class Sandbox
	
	
	attr_accessor :this, :that
	@@sandboxes=[]
	@@name=[]
	@@count=0		
	
	

	def initialize(this,that)
		@this,@that=this,that
		@@count+=1
		@@sandboxes << self
		 self.instance_variables.each do |var|
		 @@name << var
		 end
	end
	
	
	
	def self.count
		puts @@count
		@@name.each do |val|
			self.class.send(:define_method,"find_by_#{val.to_s.sub(/^@/,'')}") do |x|
			  @@sandboxes.each do |var1|
			    if var1.instance_variable_get(val)==x
					return var1
			    end
		      end
			end
		end
	end
	
	
end



sandy=Sandbox.new("234","321") 
Sandbox.count
puts sandy.this
sandy.this = "123"
puts sandy.this
puts sandy.that
boxy = Sandbox.new("a","b")

puts Sandbox.find_by_this("123").that
puts Sandbox.find_by_that("b").this

Sandbox.count

towny = Sandbox.new("paris","london")

Sandbox.count


