@interface SignpostSupportSubsystemCategoryAllowlist
- (BOOL)_wantsNotSubsystem;
- (unint64_t)_compoundPredicateType;
@end

@implementation SignpostSupportSubsystemCategoryAllowlist

- (BOOL)_wantsNotSubsystem
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 2;
}

@end