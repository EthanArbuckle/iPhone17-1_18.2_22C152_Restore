@interface POError
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
+ (id)internalErrorWithMessage:(id)a3;
@end

@implementation POError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)[a1 errorWithCode:a3 underlyingError:0 description:a4];
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v11 = [[POError alloc] initWithDomain:@"com.apple.PlatformSSO" code:a3 userInfo:v10];

  return v11;
}

+ (id)internalErrorWithMessage:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [POError alloc];
  uint64_t v8 = *MEMORY[0x263F08320];
  v9[0] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v6 = [(POError *)v4 initWithDomain:@"com.apple.PlatformSSO" code:-1000 userInfo:v5];
  return v6;
}

@end