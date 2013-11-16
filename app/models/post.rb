class Post < ActiveRecord::Base
  attr_accessible :description, :title

  validates_presence_of 	:title, :description

  def title
  	t = read_attribute :title
  	rand_chars + t + rand_chars
  end

  def description
  	to_craigslist read_attribute :description
  end

  def to_craigslist(description)
  	description = capitalize_sentences(description)
  	description = swap_chars(description)
  	description
  end

  def capitalize_sentences(description)
  	description = description.split(/[\.|?]\s+/).map do |sentence|
  		(rand(3) % 2) == 1 ? sentence.upcase : sentence
  	end.join(". \n")
  end

  def swap_chars(description)
  	replacements.each_pair do |key, val|
  		description = description.gsub key, val
  	end
  	description
  end

  def replacements
  	{
  		/ you / 		=> ' U ',
  		/\./				=> '!' * rand(1..3),
  		/\?/				=> '?' * rand(2..3),
  		/ at /i			=> ' @ ',
  		/ and /i		=> ' & ',
  		/ are /i		=> ' r ',
  		/ to /i			=> ' 2 ',
  		/ with /i		=> ' w/ ',
  		/ great /i	=> ' gr8 ',
  		/5/					=> ' five ',
  		/4/					=> ' four ',
  		/9/					=> ' nine ',
  	}
  end

  def title_chars
  	%w{* @ - +}.sample
  end

  def rand_chars
  	title_chars*rand(2..10)
  end
end

# !!
# :-)
# m4w / w4m / m4m / w4w
# Swf / swm / sbm / sbf
# ALL CAPS
# all downcase
# **************title**************
# 5 five 5 four eight nine 7
# FREE!
# New / never worn / never opened / never used.
# 2 in 1
#  'great' = gr8
# 'At' = @
# And = &
# Are = R
# You = U
# to= 2
# OBO
# (behind the Olive Garden)
# +++
# Phone calls Only.
# With = w/
# Put quotations around "random" words