@interface SLUtils
+ (id)createErrorWithMsg:(id)a3 code:(unint64_t)a4;
@end

@implementation SLUtils

+ (id)createErrorWithMsg:(id)a3 code:(unint64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F087E8];
  v11 = @"reason";
  v12[0] = a3;
  v6 = NSDictionary;
  id v7 = a3;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"com.apple.sl" code:a4 userInfo:v8];

  return v9;
}

@end