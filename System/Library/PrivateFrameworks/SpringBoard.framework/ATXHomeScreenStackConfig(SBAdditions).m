@interface ATXHomeScreenStackConfig(SBAdditions)
- (uint64_t)sb_isAppPredictionStack;
@end

@implementation ATXHomeScreenStackConfig(SBAdditions)

- (uint64_t)sb_isAppPredictionStack
{
  v1 = [a1 widgets];
  if ([v1 count] == 1)
  {
    v2 = [v1 firstObject];
    v3 = [v2 extensionBundleId];
    uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F4AD48]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end