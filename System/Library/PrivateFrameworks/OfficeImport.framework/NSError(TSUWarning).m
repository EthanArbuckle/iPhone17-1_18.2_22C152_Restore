@interface NSError(TSUWarning)
+ (id)tsu_errorWithWarning:()TSUWarning;
@end

@implementation NSError(TSUWarning)

+ (id)tsu_errorWithWarning:()TSUWarning
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F08320];
  v4 = [a3 message];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v3 errorWithDomain:@"com.apple.iWork.TSUWarningErrorDomain" code:0 userInfo:v5];

  return v6;
}

@end