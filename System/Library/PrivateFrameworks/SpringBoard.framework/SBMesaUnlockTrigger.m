@interface SBMesaUnlockTrigger
- (BOOL)authenticated;
- (BOOL)bioUnlock;
- (SBMesaUnlockTriggerDelegate)delegate;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAuthenticated:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBMesaUnlockTrigger

- (BOOL)bioUnlock
{
  return 0;
}

- (id)description
{
  return [(SBMesaUnlockTrigger *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBMesaUnlockTrigger *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = (void *)MEMORY[0x1E4F4F718];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [v4 descriptionForObject:WeakRetained];
  id v7 = (id)[v3 appendObject:v6 withName:@"delegate"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBMesaUnlockTrigger *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (SBMesaUnlockTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBMesaUnlockTriggerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (void).cxx_destruct
{
}

@end