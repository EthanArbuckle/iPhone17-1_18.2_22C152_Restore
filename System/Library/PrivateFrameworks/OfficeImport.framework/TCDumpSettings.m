@interface TCDumpSettings
+ (BOOL)isDumpForQA;
+ (void)setDumpForQA:(BOOL)a3;
@end

@implementation TCDumpSettings

+ (void)setDumpForQA:(BOOL)a3
{
  sIsDumpForQA = a3;
}

+ (BOOL)isDumpForQA
{
  return sIsDumpForQA;
}

@end