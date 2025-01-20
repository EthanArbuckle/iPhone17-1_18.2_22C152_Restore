@interface NSError(SXAdditions)
+ (id)unknownError;
+ (id)unreachableNetworkError;
@end

@implementation NSError(SXAdditions)

+ (id)unreachableNetworkError
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08320];
  v5[0] = @"Network Unreachable";
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = [v0 errorWithDomain:@"SXWebContentErrorDomain" code:-2 userInfo:v1];

  return v2;
}

+ (id)unknownError
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08320];
  v5[0] = @"Unknown Error";
  v1 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = [v0 errorWithDomain:@"SXWebContentErrorDomain" code:-1 userInfo:v1];

  return v2;
}

@end