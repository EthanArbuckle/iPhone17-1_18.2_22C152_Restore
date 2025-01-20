@interface SBSLockScreenContentAction(SupportedInterfaceOrientations)
- (BOOL)specifiesSupportedInterfaceOrientations;
- (uint64_t)supportedInterfaceOrientations;
@end

@implementation SBSLockScreenContentAction(SupportedInterfaceOrientations)

- (BOOL)specifiesSupportedInterfaceOrientations
{
  return [a1 supportedInterfaceOrientations] != 0;
}

- (uint64_t)supportedInterfaceOrientations
{
  uint64_t v2 = objc_opt_class();
  v3 = [a1 configurationObject];
  v4 = SBSafeCast(v2, v3);

  v5 = [v4 objectForKey:*MEMORY[0x1E4FA7018]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

@end