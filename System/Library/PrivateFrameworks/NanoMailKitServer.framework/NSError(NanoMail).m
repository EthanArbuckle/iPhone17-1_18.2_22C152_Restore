@interface NSError(NanoMail)
+ (id)genericErrorWithMessage:()NanoMail;
+ (id)httpErrorWithCode:()NanoMail message:;
+ (uint64_t)errorWithCode:()NanoMail;
+ (uint64_t)errorWithCode:()NanoMail userInfo:;
- (BOOL)isAuthenticationError;
@end

@implementation NSError(NanoMail)

+ (uint64_t)errorWithCode:()NanoMail userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.nanomail" code:a3 userInfo:a4];
}

+ (uint64_t)errorWithCode:()NanoMail
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.nanomail" code:a3 userInfo:MEMORY[0x263EFFA78]];
}

+ (id)genericErrorWithMessage:()NanoMail
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [a1 errorWithCode:999 userInfo:v6];

  return v7;
}

+ (id)httpErrorWithCode:()NanoMail message:
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263F08320];
  v12[1] = @"NNMKErrorHTTPStatusCodeUserInfoKey";
  v13[0] = a4;
  v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithInteger:a3];
  v13[1] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  v10 = [a1 errorWithCode:998 userInfo:v9];

  return v10;
}

- (BOOL)isAuthenticationError
{
  return [a1 code] == 1032 || objc_msgSend(a1, "code") == 1055 || objc_msgSend(a1, "code") == 1034;
}

@end