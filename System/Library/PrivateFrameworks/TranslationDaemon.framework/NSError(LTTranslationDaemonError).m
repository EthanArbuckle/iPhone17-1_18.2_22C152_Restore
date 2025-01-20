@interface NSError(LTTranslationDaemonError)
+ (id)ltd_errorWithCode:()LTTranslationDaemonError description:userInfo:;
@end

@implementation NSError(LTTranslationDaemonError)

+ (id)ltd_errorWithCode:()LTTranslationDaemonError description:userInfo:
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)[v8 mutableCopy];
  }
  else
  {
    v10 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v11 = v10;
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v12 = [MEMORY[0x263F087E8] errorWithDomain:@"LTTranslationDaemonErrorDomain" code:a3 userInfo:v11];

  return v12;
}

@end