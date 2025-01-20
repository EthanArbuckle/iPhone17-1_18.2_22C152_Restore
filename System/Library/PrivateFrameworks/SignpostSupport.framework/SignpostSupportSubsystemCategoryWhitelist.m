@interface SignpostSupportSubsystemCategoryWhitelist
- (BOOL)_wantsNotSubsystem;
- (unint64_t)_compoundPredicateType;
@end

@implementation SignpostSupportSubsystemCategoryWhitelist

- (BOOL)_wantsNotSubsystem
{
  return 0;
}

- (unint64_t)_compoundPredicateType
{
  return 2;
}

@end