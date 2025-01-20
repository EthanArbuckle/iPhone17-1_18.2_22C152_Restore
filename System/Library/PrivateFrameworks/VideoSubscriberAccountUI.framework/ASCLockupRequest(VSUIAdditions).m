@interface ASCLockupRequest(VSUIAdditions)
+ (id)tvProviderLockupRequestWithAdamID:()VSUIAdditions;
@end

@implementation ASCLockupRequest(VSUIAdditions)

+ (id)tvProviderLockupRequestWithAdamID:()VSUIAdditions
{
  v3 = (objc_class *)MEMORY[0x263F25350];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithStringValue:v4];

  id v6 = objc_alloc(MEMORY[0x263F25378]);
  v7 = (void *)[v6 initWithID:v5 kind:*MEMORY[0x263F25330] context:*MEMORY[0x263F25328]];
  v8 = [v7 lockupRequestWithClientID:@"TVProvider"];

  return v8;
}

@end