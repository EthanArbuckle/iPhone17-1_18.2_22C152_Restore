@interface NSPredicate(PPSSQLitePredicate)
- (uint64_t)pps_sqlPredicateForSelect;
@end

@implementation NSPredicate(PPSSQLitePredicate)

- (uint64_t)pps_sqlPredicateForSelect
{
  return 0;
}

@end