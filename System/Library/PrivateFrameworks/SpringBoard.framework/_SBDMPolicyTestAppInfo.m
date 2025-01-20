@interface _SBDMPolicyTestAppInfo
- (BOOL)isBlockedForScreenTimeExpiration;
- (BOOL)testAppBlocked;
- (int64_t)screenTimePolicy;
- (void)setTestAppBlocked:(BOOL)a3;
@end

@implementation _SBDMPolicyTestAppInfo

- (BOOL)isBlockedForScreenTimeExpiration
{
  if ([(_SBDMPolicyTestAppInfo *)self testAppBlocked]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SBDMPolicyTestAppInfo;
  return [(_SBDMPolicyTestAppInfo *)&v4 isBlockedForScreenTimeExpiration];
}

- (int64_t)screenTimePolicy
{
  if ([(_SBDMPolicyTestAppInfo *)self testAppBlocked]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SBDMPolicyTestAppInfo;
  return [(_SBDMPolicyTestAppInfo *)&v4 screenTimePolicy];
}

- (BOOL)testAppBlocked
{
  return self->_testAppBlocked;
}

- (void)setTestAppBlocked:(BOOL)a3
{
  self->_testAppBlocked = a3;
}

@end