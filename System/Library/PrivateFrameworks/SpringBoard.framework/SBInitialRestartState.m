@interface SBInitialRestartState
- (BOOL)hasPasscodeSet;
- (BOOL)isAuthenticated;
- (BOOL)isBlocked;
- (BOOL)isForSimulator;
- (BOOL)isInLostMode;
- (BOOL)isLoginSession;
- (BOOL)requiresSetup;
- (BOOL)shouldNeverLock;
- (NSString)description;
- (SBBootDefaults)bootDefaults;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)homeButtonType;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBlocked:(BOOL)a3;
- (void)setBootDefaults:(id)a3;
- (void)setForSimulator:(BOOL)a3;
- (void)setHasPasscodeSet:(BOOL)a3;
- (void)setHomeButtonType:(int64_t)a3;
- (void)setInLostMode:(BOOL)a3;
- (void)setLoginSession:(BOOL)a3;
- (void)setRequiresSetup:(BOOL)a3;
- (void)setShouldNeverLock:(BOOL)a3;
@end

@implementation SBInitialRestartState

- (NSString)description
{
  return (NSString *)[(SBInitialRestartState *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBInitialRestartState *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBInitialRestartState *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBInitialRestartState *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SBInitialRestartState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v10 = v5;
  v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

void __63__SBInitialRestartState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned char *)(*(void *)(a1 + 40) + 8) == 0 withName:@"isPasscodeLocked"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"isBlocked"];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"isInLostMode"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11) withName:@"hasPasscodeSet"];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12) withName:@"requiresSetup"];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 13) withName:@"shouldNeverLock"];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 14) withName:@"forSimulator"];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 15) withName:@"isLoginSession"];
  id v10 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"bootDefaults"];
  v11 = *(void **)(a1 + 32);
  id v13 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 40) + 16)];
  id v12 = (id)[v11 appendObject:v13 withName:@"homeButtonType"];
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)isInLostMode
{
  return self->_isInLostMode;
}

- (void)setInLostMode:(BOOL)a3
{
  self->_isInLostMode = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (BOOL)requiresSetup
{
  return self->_requiresSetup;
}

- (void)setRequiresSetup:(BOOL)a3
{
  self->_requiresSetup = a3;
}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (void)setHasPasscodeSet:(BOOL)a3
{
  self->_hasPasscodeSet = a3;
}

- (BOOL)shouldNeverLock
{
  return self->_shouldNeverLock;
}

- (void)setShouldNeverLock:(BOOL)a3
{
  self->_shouldNeverLock = a3;
}

- (BOOL)isLoginSession
{
  return self->_isLoginSession;
}

- (void)setLoginSession:(BOOL)a3
{
  self->_isLoginSession = a3;
}

- (SBBootDefaults)bootDefaults
{
  return self->_bootDefaults;
}

- (void)setBootDefaults:(id)a3
{
}

- (BOOL)isForSimulator
{
  return self->_forSimulator;
}

- (void)setForSimulator:(BOOL)a3
{
  self->_forSimulator = a3;
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (void).cxx_destruct
{
}

@end