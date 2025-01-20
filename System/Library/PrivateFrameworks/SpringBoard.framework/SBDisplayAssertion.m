@interface SBDisplayAssertion
- (BOOL)hasControlOfDisplay;
- (BOOL)isEqual:(id)a3;
- (FBSDisplayIdentity)rootDisplayIdentity;
- (id)_initWithPhysicalDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 assertionStack:(id)a6 delegate:(id)a7;
- (id)description;
- (unint64_t)deactivationReasonsWhenActive;
- (unint64_t)level;
- (void)_didGainControlOfDisplay;
- (void)_didInvalidateForDisplayDisconnect;
- (void)_didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a3;
- (void)_didReceiveNewDeactivationReasons:(unint64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)updateWithPreferences:(id)a3;
@end

@implementation SBDisplayAssertion

- (id)_initWithPhysicalDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 assertionStack:(id)a6 delegate:(id)a7
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (([v14 isRootIdentity] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBDisplayAssertion.m", 114, @"Invalid parameter not satisfying: %@", @"[rootDisplayIdentity isRootIdentity]" object file lineNumber description];
  }
  if (SBDisplayAssertionLevelIsValid(a4))
  {
    if (v15) {
      goto LABEL_5;
    }
LABEL_10:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBDisplayAssertion.m", 116, @"Invalid parameter not satisfying: %@", @"assertionStack" object file lineNumber description];

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBDisplayAssertion.m", 115, @"Invalid parameter not satisfying: %@", @"SBDisplayAssertionLevelIsValid(level)" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_5:
  if (v16) {
    goto LABEL_6;
  }
LABEL_11:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SBDisplayAssertion.m", 117, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)SBDisplayAssertion;
  v17 = [(SBDisplayAssertion *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rootDisplayIdentity, a3);
    v18->_level = a4;
    v18->_deactivationReasonsWhenActive = a5;
    objc_storeWeak((id *)&v18->_assertionStack, v15);
    objc_storeWeak((id *)&v18->_delegate, v16);
    *(_WORD *)&v18->_invalidated = 0;
    v18->_hasControlOfDisplay = 0;
  }

  return v18;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBDisplayAssertion;
  [(SBDisplayAssertion *)&v5 dealloc];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = SBDisplayAssertionLevelDescription(self->_level);
  [v3 appendString:v4 withName:@"level"];

  objc_super v5 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  id v6 = (id)[v3 appendObject:v5 withName:@"deactivationReasonsWhenActive"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
  id v8 = (id)[v3 appendObject:WeakRetained withName:@"stack"];

  v9 = [v3 build];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBDisplayAssertion *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      if ([(FBSDisplayIdentity *)self->_rootDisplayIdentity isEqual:v5->_rootDisplayIdentity]&& self->_level == v5->_level)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
        v7 = [WeakRetained displayIdentity];
        id v8 = objc_loadWeakRetained((id *)&v5->_assertionStack);
        v9 = [v8 displayIdentity];
        char v10 = [v7 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)hasControlOfDisplay
{
  return self->_hasControlOfDisplay;
}

- (void)updateWithPreferences:(id)a3
{
  if (!self->_invalidated)
  {
    p_assertionStack = &self->_assertionStack;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_assertionStack);
    [WeakRetained _assertion:self updatedPreferences:v5];
  }
}

- (void)invalidate
{
  if (self->_invalidatedByClient)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  self->_hasControlOfDisplay = 0;
  *(_WORD *)&self->_invalidated = 257;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
  [WeakRetained _assertionDidInvalidate:self];
}

- (void)_didInvalidateForDisplayDisconnect
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    self->_hasControlOfDisplay = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained displayAssertionDidInvalidate:self];
    }
  }
}

- (void)_didGainControlOfDisplay
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    self->_hasControlOfDisplay = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained displayAssertionDidGainControlOfDisplay:self];

    v4 = SBLogDisplayControlling();
    if (os_signpost_enabled(v4))
    {
      id v5 = SBDisplayAssertionLevelDescription(self->_level);
      int v6 = 138543362;
      v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_ASSERTION_GAIN_CONTROL", "%{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated && self->_hasControlOfDisplay)
  {
    self->_hasControlOfDisplay = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained displayAssertion:self didLoseControlOfDisplayForDeactivationReasons:a3];

    int v6 = SBLogDisplayControlling();
    if (os_signpost_enabled(v6))
    {
      v7 = SBDisplayAssertionLevelDescription(self->_level);
      int v8 = 138543362;
      v9 = v7;
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_ASSERTION_LOST_CONTROL", "%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_didReceiveNewDeactivationReasons:(unint64_t)a3
{
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained displayAssertion:self didReceiveNewDeactivationReasons:a3];
    }
  }
}

- (FBSDisplayIdentity)rootDisplayIdentity
{
  return self->_rootDisplayIdentity;
}

- (unint64_t)level
{
  return self->_level;
}

- (unint64_t)deactivationReasonsWhenActive
{
  return self->_deactivationReasonsWhenActive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_assertionStack);
  objc_storeStrong((id *)&self->_rootDisplayIdentity, 0);
}

@end