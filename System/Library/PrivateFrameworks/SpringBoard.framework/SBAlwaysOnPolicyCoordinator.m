@interface SBAlwaysOnPolicyCoordinator
- (NSSet)activePolicies;
- (void)_activatePolicy:(id)a3;
- (void)activate;
- (void)removeExternalPolicy:(id)a3;
@end

@implementation SBAlwaysOnPolicyCoordinator

- (void)activate
{
  v3 = objc_opt_new();
  [(SBAlwaysOnPolicyCoordinator *)self _activatePolicy:v3];

  v4 = objc_opt_new();
  [(SBAlwaysOnPolicyCoordinator *)self _activatePolicy:v4];

  v5 = objc_opt_new();
  [(SBAlwaysOnPolicyCoordinator *)self _activatePolicy:v5];

  id v6 = (id)objc_opt_new();
  [(SBAlwaysOnPolicyCoordinator *)self _activatePolicy:v6];
}

- (void)removeExternalPolicy:(id)a3
{
}

- (NSSet)activePolicies
{
  v2 = (void *)[(NSMutableSet *)self->_policies copy];
  return (NSSet *)v2;
}

- (void)_activatePolicy:(id)a3
{
  id v4 = a3;
  policies = self->_policies;
  id v8 = v4;
  if (!policies)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = self->_policies;
    self->_policies = v6;

    id v4 = v8;
    policies = self->_policies;
  }
  [(NSMutableSet *)policies addObject:v4];
  [v8 activateAlwaysOnPolicy];
}

- (void).cxx_destruct
{
}

@end