@interface SBDisableWindowSceneStatusBarAlphaChangesAssertion
- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 reason:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBDisableWindowSceneStatusBarAlphaChangesAssertion

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 reason:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDisableWindowSceneStatusBarAlphaChangesAssertion;
  id v7 = [(SBBaseWindowSceneStatusBarChangeAssertion *)&v9 _initWithWindowSceneStatusBarAssertionManager:v6 reason:a4];
  if (v7) {
    [v6 _addDisableWindowSceneStatusBarAlphaChangesAssertion:v7];
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._assertionManager);
  [WeakRetained _removeDisableWindowSceneStatusBarAlphaChangesAssertion:self];

  v4.receiver = self;
  v4.super_class = (Class)SBDisableWindowSceneStatusBarAlphaChangesAssertion;
  [(SBDisableWindowSceneStatusBarAlphaChangesAssertion *)&v4 dealloc];
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._assertionManager);
  [WeakRetained _removeDisableWindowSceneStatusBarAlphaChangesAssertion:self];
}

@end