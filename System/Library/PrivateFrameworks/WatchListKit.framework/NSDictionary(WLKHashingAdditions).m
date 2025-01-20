@interface NSDictionary(WLKHashingAdditions)
- (uint64_t)wlk_deepHash;
@end

@implementation NSDictionary(WLKHashingAdditions)

- (uint64_t)wlk_deepHash
{
  v1 = WLKSortDictionaries(a1);
  if (([MEMORY[0x1E4F28F98] propertyList:v1 isValidForFormat:100] & 1) == 0)
  {
    v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"WLKHashingAdditions - wlk_deepHash" reason:@"wlk_deepHash only supports property list object graphs" userInfo:0];
    [v2 raise];
  }
  id v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v1 format:100 options:0 error:0];
  [v3 bytes];
  [v3 length];
  uint64_t v4 = CFHashBytes();

  return v4;
}

@end