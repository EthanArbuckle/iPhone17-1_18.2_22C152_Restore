@interface SSKDisplayAssertion
- (BOOL)hasControlOfDisplay;
- (BOOL)isEqual:(id)a3;
- (FBSDisplayIdentity)rootDisplayIdentity;
- (id)_initWithPhysicalDisplay:(id)a3 level:(unint64_t)a4 assertionStack:(id)a5 delegate:(id)a6;
- (id)description;
- (unint64_t)deactivationReasonsWhenActive;
- (unint64_t)level;
- (void)_didGainControlOfDisplay;
- (void)_didInvalidateForDisplayDisconnect;
- (void)_didLoseControlOfDisplay;
- (void)dealloc;
- (void)invalidate;
- (void)updateWithPreferences:(id)a3;
@end

@implementation SSKDisplayAssertion

- (id)_initWithPhysicalDisplay:(id)a3 level:(unint64_t)a4 assertionStack:(id)a5 delegate:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (([v12 isRootIdentity] & 1) == 0)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SSKDisplayAssertion.m", 103, @"Invalid parameter not satisfying: %@", @"[rootDisplayIdentity isRootIdentity]" object file lineNumber description];
  }
  if (a4)
  {
    if (v13) {
      goto LABEL_5;
    }
LABEL_10:
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SSKDisplayAssertion.m", 105, @"Invalid parameter not satisfying: %@", @"assertionStack" object file lineNumber description];

    if (v14) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SSKDisplayAssertion.m", 104, @"Invalid parameter not satisfying: %@", @"SSKDisplayPriorityIsValid(level)" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_5:
  if (v14) {
    goto LABEL_6;
  }
LABEL_11:
  v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SSKDisplayAssertion.m", 106, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_6:
  v22.receiver = self;
  v22.super_class = (Class)SSKDisplayAssertion;
  v15 = [(SSKDisplayAssertion *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rootDisplayIdentity, a3);
    v16->_level = a4;
    objc_storeWeak((id *)&v16->_assertionStack, v13);
    objc_storeWeak((id *)&v16->_delegate, v14);
    *(_WORD *)&v16->_invalidated = 0;
    v16->_hasControlOfDisplay = 0;
  }

  return v16;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
  }
  v5.receiver = self;
  v5.super_class = (Class)SSKDisplayAssertion;
  [(SSKDisplayAssertion *)&v5 dealloc];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendUnsignedInteger:self->_level withName:@"level"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionStack);
  id v6 = (id)[v3 appendObject:WeakRetained withName:@"stack"];

  v7 = [v3 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SSKDisplayAssertion *)a3;
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
    id v4 = [MEMORY[0x263F08690] currentHandler];
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
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!self->_invalidated)
  {
    self->_hasControlOfDisplay = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained displayAssertionDidGainControlOfDisplay:self];

    id v4 = SSKLogDisplayControlling();
    if (os_signpost_enabled(v4))
    {
      unint64_t level = self->_level;
      int v6 = 134217984;
      unint64_t v7 = level;
      _os_signpost_emit_with_name_impl(&dword_25C444000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SSK_DISPLAY_ASSERTION_GAIN_CONTROL", "%lu", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_didLoseControlOfDisplay
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!self->_invalidated && self->_hasControlOfDisplay)
  {
    self->_hasControlOfDisplay = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained displayAssertionDidLoseControlOfDisplay:self];

    id v4 = SSKLogDisplayControlling();
    if (os_signpost_enabled(v4))
    {
      unint64_t level = self->_level;
      int v6 = 134217984;
      unint64_t v7 = level;
      _os_signpost_emit_with_name_impl(&dword_25C444000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SSK_DISPLAY_ASSERTION_LOST_CONTROL", "%lu", (uint8_t *)&v6, 0xCu);
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