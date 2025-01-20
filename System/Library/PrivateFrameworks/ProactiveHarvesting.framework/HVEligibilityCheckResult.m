@interface HVEligibilityCheckResult
- (BOOL)isEligible;
- (BOOL)isEligibleExceptForAge;
- (void)setIsEligible:(BOOL)a3;
- (void)setIsEligibleExceptForAge:(BOOL)a3;
@end

@implementation HVEligibilityCheckResult

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (BOOL)isEligibleExceptForAge
{
  return self->_isEligibleExceptForAge;
}

- (void)setIsEligibleExceptForAge:(BOOL)a3
{
  self->_isEligibleExceptForAge = a3;
}

- (void)setIsEligible:(BOOL)a3
{
  self->_isEligible = a3;
}

@end