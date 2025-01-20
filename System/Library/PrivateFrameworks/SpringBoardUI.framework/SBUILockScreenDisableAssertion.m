@interface SBUILockScreenDisableAssertion
+ (id)lockScreenDisableAssertionWithIdentifier:(id)a3;
+ (void)setLockScreenDisableAssertionClass:(Class)a3;
- (SBUILockScreenDisableAssertion)initWithIdentifier:(id)a3;
- (id)description;
@end

@implementation SBUILockScreenDisableAssertion

+ (void)setLockScreenDisableAssertionClass:(Class)a3
{
  __assertionClass = (uint64_t)a3;
}

+ (id)lockScreenDisableAssertionWithIdentifier:(id)a3
{
  v3 = (objc_class *)__assertionClass;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithIdentifier:v4];

  return v5;
}

- (SBUILockScreenDisableAssertion)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUILockScreenDisableAssertion;
  return [(SBUILockScreenDisableAssertion *)&v4 init];
}

- (id)description
{
  return 0;
}

@end