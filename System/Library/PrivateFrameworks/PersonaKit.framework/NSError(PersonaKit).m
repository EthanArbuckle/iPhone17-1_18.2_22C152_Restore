@interface NSError(PersonaKit)
+ (uint64_t)pr_errorWithCode:()PersonaKit;
- (BOOL)pr_isNetworkAvailabilityError;
- (uint64_t)pr_isInPersonaDomain;
@end

@implementation NSError(PersonaKit)

+ (uint64_t)pr_errorWithCode:()PersonaKit
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"PRPersonaDomain" code:a3 userInfo:0];
}

- (BOOL)pr_isNetworkAvailabilityError
{
  v2 = [a1 domain];
  int v3 = [v2 isEqual:*MEMORY[0x263F08570]];

  if (!v3)
  {
    v5 = [a1 domain];
    int v6 = [v5 isEqual:@"PRPersonaDomain"];

    if (!v6) {
      return 0;
    }
    if ([a1 code] != -9002)
    {
      uint64_t v4 = -9006;
      return [a1 code] == v4;
    }
    return 1;
  }
  if ([a1 code] == -1009
    || [a1 code] == -1001
    || [a1 code] == -1003
    || [a1 code] == -1004
    || [a1 code] == -1020
    || [a1 code] == -1006)
  {
    return 1;
  }
  uint64_t v4 = -1005;
  return [a1 code] == v4;
}

- (uint64_t)pr_isInPersonaDomain
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqual:@"PRPersonaDomain"];

  return v2;
}

@end