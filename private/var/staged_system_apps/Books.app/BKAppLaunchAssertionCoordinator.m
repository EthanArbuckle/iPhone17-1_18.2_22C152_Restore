@interface BKAppLaunchAssertionCoordinator
- (BKAppLaunchAssertionCoordinator)initWithCondition:(unint64_t)a3;
- (BOOL)hasEnteredGroup;
- (BOOL)leave;
- (unint64_t)condition;
- (unint64_t)holdCount;
- (void)enter;
@end

@implementation BKAppLaunchAssertionCoordinator

- (BOOL)leave
{
  unint64_t holdCount = self->_holdCount;
  if (!holdCount) {
    return 0;
  }
  unint64_t v3 = holdCount - 1;
  self->_unint64_t holdCount = v3;
  return v3 == 0;
}

- (BKAppLaunchAssertionCoordinator)initWithCondition:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKAppLaunchAssertionCoordinator;
  result = [(BKAppLaunchAssertionCoordinator *)&v5 init];
  if (result) {
    result->_condition = a3;
  }
  return result;
}

- (unint64_t)holdCount
{
  return self->_holdCount;
}

- (void)enter
{
}

- (unint64_t)condition
{
  return self->_condition;
}

- (BOOL)hasEnteredGroup
{
  return self->_hasEnteredGroup;
}

@end