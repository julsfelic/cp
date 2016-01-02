class Cp
  attr_reader :args, :readfile, :newfile

  def initialize(args)
    @args     = args
    @readfile = File.read(args[0])
    @newfile  = File.open(args[1], 'w')
  end

  def copyfile
    newfile << readfile
    newfile.close
  end
end

if __FILE__ == $PROGRAM_NAME
  cp = Cp.new(ARGV)
  cp.copyfile
end
