@interface DumpPanicArgParser
+ (id)withArgs:(char *)a3 count:(int)a4;
- (BOOL)force_run;
- (BOOL)help;
- (BOOL)restoreos;
- (DumpPanicArgParser)initWithArgs:(char *)a3 count:(int)a4;
- (NSURL)output_dir;
- (void)setForce_run:(BOOL)a3;
- (void)setHelp:(BOOL)a3;
- (void)setOutput_dir:(id)a3;
- (void)setRestoreos:(BOOL)a3;
- (void)usage;
@end

@implementation DumpPanicArgParser

- (void).cxx_destruct
{
}

- (void)setForce_run:(BOOL)a3
{
  self->_force_run = a3;
}

- (BOOL)force_run
{
  return self->_force_run;
}

- (void)setOutput_dir:(id)a3
{
}

- (NSURL)output_dir
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRestoreos:(BOOL)a3
{
  self->_restoreos = a3;
}

- (BOOL)restoreos
{
  return self->_restoreos;
}

- (void)setHelp:(BOOL)a3
{
  self->_help = a3;
}

- (BOOL)help
{
  return self->_help;
}

- (void)usage
{
  fwrite("usage: DumpPanic [OPTIONS] \n", 0x1CuLL, 1uLL, __stderrp);
  fwrite("  -r, --restoreos DIRECTORY\n\t\t               special-case mode for restore environment\n\n", 0x58uLL, 1uLL, __stderrp);
  fwrite("  -o, --outputpath DIRECTORY\n\t\t              output directory for logs\n\n", 0x48uLL, 1uLL, __stderrp);
  fwrite("  -f, --force\n\t\t             force DumpPanic to run\n", 0x34uLL, 1uLL, __stderrp);
  fwrite("  -h, --help\n\t\t              show this help\n\n", 0x2DuLL, 1uLL, __stderrp);
  v2 = __stderrp;

  fputc(10, v2);
}

- (DumpPanicArgParser)initWithArgs:(char *)a3 count:(int)a4
{
  [(DumpPanicArgParser *)self setOutput_dir:0];
  [(DumpPanicArgParser *)self setRestoreos:0];
  [(DumpPanicArgParser *)self setHelp:0];
  [(DumpPanicArgParser *)self setForce_run:0];
  optreset = 1;
  optind = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        int v7 = getopt_long(a4, a3, "ar:chf", (const option *)&off_100039AC8, 0);
        if (v7 <= 103) {
          break;
        }
        if (v7 == 114)
        {
          [(DumpPanicArgParser *)self setRestoreos:1];
          v8 = +[NSString stringWithUTF8String:optarg];
          v9 = +[NSURL fileURLWithPath:v8];
          [(DumpPanicArgParser *)self setOutput_dir:v9];
        }
        else if (v7 == 104)
        {
          [(DumpPanicArgParser *)self setHelp:1];
        }
      }
      if (v7 != 102) {
        break;
      }
      [(DumpPanicArgParser *)self setForce_run:1];
    }
  }
  while (v7 != -1);
  return self;
}

+ (id)withArgs:(char *)a3 count:(int)a4
{
  v4 = [[DumpPanicArgParser alloc] initWithArgs:a3 count:*(void *)&a4];

  return v4;
}

@end