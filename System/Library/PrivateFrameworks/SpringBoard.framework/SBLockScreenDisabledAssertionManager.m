@interface SBLockScreenDisabledAssertionManager
- (BOOL)isLockScreenDisabledForAssertion;
- (BOOL)shouldAutoUnlockForSource:(int)a3;
- (NSString)description;
- (SBLockScreenDisabledAssertionManager)init;
- (void)addLockScreenDisableAssertion:(id)a3;
- (void)removeLockScreenDisableAssertion:(id)a3;
@end

@implementation SBLockScreenDisabledAssertionManager

- (SBLockScreenDisabledAssertionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBLockScreenDisabledAssertionManager;
  v2 = [(SBLockScreenDisabledAssertionManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    disableLockScreenIfPossibleAssertions = v2->_disableLockScreenIfPossibleAssertions;
    v2->_disableLockScreenIfPossibleAssertions = v3;
  }
  return v2;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLockScreenDisabledAssertionManager isLockScreenDisabledForAssertion](self, "isLockScreenDisabledForAssertion"), @"lockScreenDisabled");
  if ([(NSMutableSet *)self->_disableLockScreenIfPossibleAssertions count]) {
    id v5 = (id)[v3 appendObject:self->_disableLockScreenIfPossibleAssertions withName:@"assertions"];
  }
  objc_super v6 = [v3 build];

  return (NSString *)v6;
}

- (void)addLockScreenDisableAssertion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Adding lock screen disable assertion %@", (uint8_t *)&v7, 0xCu);
  }

  objc_super v6 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v4];
  [(NSMutableSet *)self->_disableLockScreenIfPossibleAssertions addObject:v6];
}

- (void)removeLockScreenDisableAssertion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Removing lock screen disable assertion %@", (uint8_t *)&v7, 0xCu);
  }

  objc_super v6 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v4];
  [(NSMutableSet *)self->_disableLockScreenIfPossibleAssertions removeObject:v6];
}

- (BOOL)isLockScreenDisabledForAssertion
{
  return [(NSMutableSet *)self->_disableLockScreenIfPossibleAssertions count] != 0;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  id v4 = +[SBLockScreenManager sharedInstance];
  if ([v4 isLockScreenActive]) {
    BOOL v5 = [(SBLockScreenDisabledAssertionManager *)self isLockScreenDisabledForAssertion];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end