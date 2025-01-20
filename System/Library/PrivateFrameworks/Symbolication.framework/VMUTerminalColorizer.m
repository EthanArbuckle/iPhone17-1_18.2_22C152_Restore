@interface VMUTerminalColorizer
+ (id)colorize:(id)a3 withColor:(unsigned int)a4 bold:(BOOL)a5;
+ (id)controlCodeResetString;
+ (id)startColorCodeString:(unsigned int)a3;
@end

@implementation VMUTerminalColorizer

+ (id)colorize:(id)a3 withColor:(unsigned int)a4 bold:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  if (getenv("TERM") && isatty(0) && isatty(1) && isatty(2))
  {
    v8 = &stru_1EFE27F38;
    if (v5) {
      v8 = @";1";
    }
    id v9 = [NSString stringWithFormat:@"\x1B[38;5;%d%@m%@\x1B[0m", v6, v8, v7];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)startColorCodeString:(unsigned int)a3
{
  return [NSString stringWithFormat:@"\x1B[38;5;%dm", *(void *)&a3];
}

+ (id)controlCodeResetString
{
  return @"\x1B[0m";
}

@end