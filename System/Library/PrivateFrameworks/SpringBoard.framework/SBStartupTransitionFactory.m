@interface SBStartupTransitionFactory
- (SBStartupTransitionFactory)initWithInitialRestartState:(id)a3;
- (id)_transactionForDestination:(unint64_t)a3 context:(id)a4;
- (id)transitionForContext:(id)a3 outDestination:(unint64_t *)a4;
@end

@implementation SBStartupTransitionFactory

- (SBStartupTransitionFactory)initWithInitialRestartState:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBStartupTransitionFactory.m", 31, @"Invalid parameter not satisfying: %@", @"initialRestartState" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBStartupTransitionFactory;
  v7 = [(SBStartupTransitionFactory *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_initialRestartState, a3);
  }

  return v8;
}

- (id)transitionForContext:(id)a3 outDestination:(unint64_t *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBStartupTransitionFactory.m", 42, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v7 = [(SBInitialRestartState *)self->_initialRestartState bootDefaults];
  BOOL v8 = [(SBInitialRestartState *)self->_initialRestartState requiresSetup];
  BOOL v26 = [(SBInitialRestartState *)self->_initialRestartState isInLostMode];
  BOOL v9 = [(SBInitialRestartState *)self->_initialRestartState isBlocked];
  int v10 = [v6 isDark];
  BOOL v11 = [(SBInitialRestartState *)self->_initialRestartState shouldNeverLock];
  BOOL v12 = [(SBInitialRestartState *)self->_initialRestartState isAuthenticated];
  BOOL v25 = [(SBInitialRestartState *)self->_initialRestartState hasPasscodeSet];
  int v13 = [v6 isLogin];
  unsigned int v24 = [v6 fromUserPowerDown];
  BOOL v14 = [(SBInitialRestartState *)self->_initialRestartState isForSimulator];
  if ([(SBInitialRestartState *)self->_initialRestartState isLoginSession])
  {
    unint64_t v15 = 4;
    goto LABEL_23;
  }
  if (v13)
  {
    if (v11 || (((v9 || v26 || !v12) | v10) & 1) == 0)
    {
      if (v8) {
        unint64_t v15 = 3;
      }
      else {
        unint64_t v15 = 1;
      }
      goto LABEL_23;
    }
LABEL_15:
    unint64_t v15 = 0;
    goto LABEL_23;
  }
  if (v8)
  {
    unint64_t v15 = 3;
    goto LABEL_23;
  }
  if (!v11 && (((v9 || v26 || !v12) | v10) & 1) != 0) {
    goto LABEL_15;
  }
  v16 = [v6 applicationLaunchURL];

  if (v16)
  {
    unint64_t v15 = 2;
  }
  else
  {
    int v17 = [v7 dontLockAfterCrash];
    int64_t v18 = [(SBInitialRestartState *)self->_initialRestartState homeButtonType];
    unsigned int v19 = (v11 || v14) | v17;
    unsigned int v20 = v24;
    if (v18 == 2) {
      unsigned int v20 = 0;
    }
    if ((v19 | v25)) {
      unint64_t v15 = v19;
    }
    else {
      unint64_t v15 = v20;
    }
  }
LABEL_23:
  if (a4) {
    *a4 = v15;
  }
  v21 = [(SBStartupTransitionFactory *)self _transactionForDestination:v15 context:v6];

  return v21;
}

- (id)_transactionForDestination:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
      v7 = [SBStartupTransitionToLockOut alloc];
      uint64_t v8 = 0;
      goto LABEL_8;
    case 1uLL:
      v7 = [SBStartupTransitionToHome alloc];
      uint64_t v8 = 1;
      goto LABEL_8;
    case 2uLL:
      v7 = [SBStartupTransitionToApp alloc];
      uint64_t v8 = 2;
      goto LABEL_8;
    case 3uLL:
      int v10 = [[SBStartupTransitionToSetup alloc] initWithDestination:3 context:v6 initialRestartState:self->_initialRestartState];
      goto LABEL_9;
    case 4uLL:
      v7 = [SBStartupTransitionToLoginWindow alloc];
      uint64_t v8 = 4;
LABEL_8:
      int v10 = [(SBStartupTransitionToLockOut *)v7 initWithDestination:v8 context:v6];
LABEL_9:
      BOOL v9 = v10;
      break;
    default:
      BOOL v9 = 0;
      break;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end