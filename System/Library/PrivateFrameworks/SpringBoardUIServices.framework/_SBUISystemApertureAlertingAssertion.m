@interface _SBUISystemApertureAlertingAssertion
- (BOOL)isAutomaticallyInvalidatable;
- (SBUISystemApertureAlertingAction)alertingAction;
- (SBUISystemApertureElementSource)elementSource;
- (_SBUISystemApertureAlertingAssertion)initWithElementSource:(id)a3;
- (id)_descriptionConstituents;
- (void)addInvalidationBlock:(id)a3;
- (void)resetAutomaticInvalidationTimer;
- (void)setAlertingAction:(id)a3;
- (void)setAutomaticallyInvalidatable:(BOOL)a3;
- (void)setElementSource:(id)a3;
@end

@implementation _SBUISystemApertureAlertingAssertion

- (_SBUISystemApertureAlertingAssertion)initWithElementSource:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SBUISystemApertureAlertingAssertion;
  v5 = [(SBUISystemApertureAssertion *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_elementSource, v4);
    v6->_automaticallyInvalidatable = 1;
    objc_initWeak(&location, v6);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62___SBUISystemApertureAlertingAssertion_initWithElementSource___block_invoke;
    v9[3] = &unk_1E5CCE598;
    objc_copyWeak(&v10, &location);
    [(_SBUISystemApertureAlertingAssertion *)v6 addInvalidationBlock:v9];
    v7 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Created alerting assertion: %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setAlertingAction:(id)a3
{
  id v6 = a3;
  p_alertingAction = &self->_alertingAction;
  if (self->_alertingAction)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBUISystemApertureElementSource.m" lineNumber:1496 description:@"Attempting to set a second alerting action"];
  }
  if ([(SBUISystemApertureAssertion *)self isValid])
  {
    objc_storeStrong((id *)&self->_alertingAction, a3);
    objc_initWeak(&location, self);
    v8 = *p_alertingAction;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58___SBUISystemApertureAlertingAssertion_setAlertingAction___block_invoke;
    v12[3] = &unk_1E5CCC710;
    objc_copyWeak(&v13, &location);
    [(SBUISystemApertureAlertingAction *)v8 setNullificationHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = *p_alertingAction;
    id v10 = [(SBUISystemApertureAssertion *)self _invalidationReason];
    [(SBUISystemApertureAlertingAction *)v9 invalidateWithReason:v10];
  }
}

- (id)_descriptionConstituents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = NSStringFromBOOL();
  [v3 setObject:v4 forKey:@"automatically invalidatable"];

  alertingAction = self->_alertingAction;
  if (alertingAction) {
    [v3 setObject:alertingAction forKey:@"alerting action"];
  }
  v9.receiver = self;
  v9.super_class = (Class)_SBUISystemApertureAlertingAssertion;
  id v6 = [(SBUISystemApertureAssertion *)&v9 _descriptionConstituents];
  v7 = [v6 arrayByAddingObject:v3];

  return v7;
}

- (void)setAutomaticallyInvalidatable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(SBUISystemApertureAssertion *)self isValid] && self->_automaticallyInvalidatable != v3)
  {
    self->_automaticallyInvalidatable = v3;
    v5 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_automaticallyInvalidatable) {
        id v6 = @"enabled";
      }
      else {
        id v6 = @"disabled";
      }
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2114;
      objc_super v12 = self;
      _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Automatic invalidation %@: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_automaticallyInvalidatable) {
      uint64_t v7 = 9;
    }
    else {
      uint64_t v7 = 8;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementSource);
    [WeakRetained _sendActionForCommand:v7];
  }
}

- (void)addInvalidationBlock:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___SBUISystemApertureAlertingAssertion_addInvalidationBlock___block_invoke;
  v7[3] = &unk_1E5CCE7C0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_SBUISystemApertureAlertingAssertion;
  id v5 = v4;
  [(SBUISystemApertureAssertion *)&v6 addInvalidationBlock:v7];
}

- (void)resetAutomaticInvalidationTimer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(SBUISystemApertureAssertion *)self isValid])
  {
    BOOL v3 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      objc_super v6 = self;
      _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "Automatic invalidation timer reset: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_elementSource);
    [WeakRetained _sendActionForCommand:10];
  }
}

- (BOOL)isAutomaticallyInvalidatable
{
  return self->_automaticallyInvalidatable;
}

- (SBUISystemApertureElementSource)elementSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementSource);
  return (SBUISystemApertureElementSource *)WeakRetained;
}

- (void)setElementSource:(id)a3
{
}

- (SBUISystemApertureAlertingAction)alertingAction
{
  return self->_alertingAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingAction, 0);
  objc_destroyWeak((id *)&self->_elementSource);
}

@end