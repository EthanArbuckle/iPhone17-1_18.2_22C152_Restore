@interface FCPrivateDataSyncConditionFalse
- (BOOL)isSatisfied;
- (id)description;
@end

@implementation FCPrivateDataSyncConditionFalse

- (BOOL)isSatisfied
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%p condition=False>", self);
}

@end