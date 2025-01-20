@interface FCPrivateDataSyncConditionTrue
- (BOOL)isSatisfied;
- (id)description;
@end

@implementation FCPrivateDataSyncConditionTrue

- (BOOL)isSatisfied
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%p condition=True>", self);
}

@end