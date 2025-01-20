@interface _SBDisplayAssertionStack
- (FBSDisplayIdentity)displayIdentity;
- (NSString)description;
- (_SBDisplayAssertionStack)initWithRootDisplay:(id)a3 delegate:(id)a4;
- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 delegate:(id)a6;
- (void)_assertion:(id)a3 updatedPreferences:(id)a4;
- (void)_assertionDidInvalidate:(id)a3;
- (void)_evalAndApplyOldPreferences:(id)a3 newPreferences:(id)a4;
- (void)activateAssertionsForDisplay:(id)a3;
- (void)dealloc;
- (void)invalidateAssertionForDerivedDisplayDisconnect:(id)a3;
- (void)invalidateForDisplayDisconnect;
@end

@implementation _SBDisplayAssertionStack

- (_SBDisplayAssertionStack)initWithRootDisplay:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isRootIdentity])
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 47, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 48, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)_SBDisplayAssertionStack;
  v10 = [(_SBDisplayAssertionStack *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rootIdentity, a3);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_invalidated = 0;
    uint64_t v12 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0x10000];
    assertionControlPreferences = v11->_assertionControlPreferences;
    v11->_assertionControlPreferences = (NSMapTable *)v12;
  }
  return v11;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SBDisplayAssertionStack;
  [(_SBDisplayAssertionStack *)&v5 dealloc];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_rootIdentity withName:@"display"];
  objc_super v5 = [v3 build];

  return (NSString *)v5;
}

- (void)activateAssertionsForDisplay:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(FBSDisplayIdentity *)self->_rootIdentity isEqual:v5] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 69, @"Invalid parameter not satisfying: %@", @"[_rootIdentity isEqual:rootIdentity]" object file lineNumber description];
  }
  if (self->_invalidated)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 70, @"Invalid parameter not satisfying: %@", @"!_invalidated" object file lineNumber description];
  }
  if (self->_activated)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 71, @"Invalid parameter not satisfying: %@", @"!_activated" object file lineNumber description];
  }
  v6 = SBLogDisplayAssertions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] activating assertions for display", buf, 0xCu);
  }

  self->_activated = 1;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  [(_SBDisplayAssertionStack *)self _evalAndApplyOldPreferences:v7 newPreferences:self->_assertionControlPreferences];
}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 delegate:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (([(FBSDisplayIdentity *)self->_rootIdentity isEqual:v10] & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 82, @"Invalid parameter not satisfying: %@", @"[_rootIdentity isEqual:rootIdentity]" object file lineNumber description];
  }
  if (SBDisplayAssertionLevelIsValid(a4))
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 83, @"Invalid parameter not satisfying: %@", @"SBDisplayAssertionLevelIsValid(assertionLevel)" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 84, @"Invalid parameter not satisfying: %@", @"assertionDelegate" object file lineNumber description];

LABEL_5:
  if (self->_invalidated)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 85, @"Invalid parameter not satisfying: %@", @"!_invalidated" object file lineNumber description];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = self->_assertionControlPreferences;
  uint64_t v13 = [(NSMapTable *)v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_super v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v17 level] == a4)
        {
          [MEMORY[0x1E4F28B00] currentHandler];
          id v31 = v10;
          v18 = id v32 = v11;
          SBDisplayAssertionLevelDescription(a4);
          v20 = unint64_t v19 = a5;
          [v18 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 87, @"we are already tracking an assertion for level %@: %@", v20, v17 object file lineNumber description];

          a5 = v19;
          id v10 = v31;
          id v11 = v32;
        }
      }
      uint64_t v14 = [(NSMapTable *)v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v14);
  }

  id v21 = [[SBDisplayAssertion alloc] _initWithPhysicalDisplay:v10 level:a4 deactivationReasons:a5 assertionStack:self delegate:v11];
  v22 = SBLogDisplayAssertions();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543618;
    v39 = rootIdentity;
    __int16 v40 = 2114;
    id v41 = v21;
    _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] acquiring new assertion: %{public}@", buf, 0x16u);
  }

  v24 = objc_alloc_init(SBDisplayAssertionPreferences);
  [(SBDisplayAssertionPreferences *)v24 setWantsControlOfDisplay:0];
  [(SBDisplayAssertionPreferences *)v24 setDisplayArrangement:0];
  v25 = (void *)[(NSMapTable *)self->_assertionControlPreferences copy];
  [(NSMapTable *)self->_assertionControlPreferences setObject:v24 forKey:v21];
  if (self->_activated) {
    [(_SBDisplayAssertionStack *)self _evalAndApplyOldPreferences:v25 newPreferences:self->_assertionControlPreferences];
  }

  return v21;
}

- (void)invalidateForDisplayDisconnect
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogDisplayAssertions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543362;
    v24 = rootIdentity;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] told to invalidate.", buf, 0xCu);
  }

  if (self->_invalidated)
  {
    objc_super v17 = [MEMORY[0x1E4F28B00] currentHandler];
  }
  self->_invalidated = 1;
  v6 = (void *)[(NSMapTable *)self->_assertionControlPreferences copy];
  assertionControlPreferences = self->_assertionControlPreferences;
  self->_assertionControlPreferences = 0;

  id v8 = _SBActiveAssertion(v6);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = v6;
  id v9 = (void *)[v6 copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = SBLogDisplayAssertions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_rootIdentity;
          *(_DWORD *)buf = 138543618;
          v24 = v16;
          __int16 v25 = 2114;
          v26 = v14;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's invalidated. assertion: %{public}@", buf, 0x16u);
        }

        if ([v14 isEqual:v8] && self->_activated) {
          [v14 _didLoseControlOfDisplayForDeactivationReasons:0];
        }
        [v14 _didInvalidateForDisplayDisconnect];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }
}

- (void)invalidateAssertionForDerivedDisplayDisconnect:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _SBActiveAssertion(self->_assertionControlPreferences);
  if ([v5 isEqual:v4] && self->_activated)
  {
    v6 = SBLogDisplayAssertions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      int v8 = 138543618;
      id v9 = rootIdentity;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's lost control of the display. assertion: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    [v4 _didLoseControlOfDisplayForDeactivationReasons:0];
  }
  [v4 _didInvalidateForDisplayDisconnect];
  [(NSMapTable *)self->_assertionControlPreferences removeObjectForKey:v4];
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_rootIdentity;
}

- (void)_assertion:(id)a3 updatedPreferences:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_invalidated)
  {
    int v8 = SBLogDisplayAssertions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      int v17 = 138543362;
      v18 = rootIdentity;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring wantsControlOfDisplay update because we're invalid.", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    int v8 = [(NSMapTable *)self->_assertionControlPreferences objectForKey:v6];
    char v10 = [v7 isEqual:v8];
    id v11 = SBLogDisplayAssertions();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        uint64_t v13 = self->_rootIdentity;
        int v17 = 138543874;
        v18 = v13;
        __int16 v19 = 2114;
        id v20 = v6;
        __int16 v21 = 2114;
        id v22 = v7;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay since no change. assertion: %{public}@; preferences: %{public}@",
          (uint8_t *)&v17,
          0x20u);
      }
    }
    else
    {
      if (v12)
      {
        uint64_t v14 = self->_rootIdentity;
        int v17 = 138543874;
        v18 = v14;
        __int16 v19 = 2114;
        id v20 = v6;
        __int16 v21 = 2114;
        id v22 = v7;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion preferences changed. assertion: %{public}@; preferences: %{public}@",
          (uint8_t *)&v17,
          0x20u);
      }

      id v11 = [(NSMapTable *)self->_assertionControlPreferences copy];
      [(NSMapTable *)self->_assertionControlPreferences setObject:v7 forKey:v6];
      if (self->_activated)
      {
        [(_SBDisplayAssertionStack *)self _evalAndApplyOldPreferences:v11 newPreferences:self->_assertionControlPreferences];
      }
      else
      {
        uint64_t v15 = SBLogDisplayAssertions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_rootIdentity;
          int v17 = 138543874;
          v18 = v16;
          __int16 v19 = 2114;
          id v20 = v6;
          __int16 v21 = 2114;
          id v22 = v7;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay because we're not active. assertion: %{public}@; "
            "preferences: %{public}@",
            (uint8_t *)&v17,
            0x20u);
        }
      }
    }
  }
}

- (void)_assertionDidInvalidate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL invalidated = self->_invalidated;
  id v6 = SBLogDisplayAssertions();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (invalidated)
  {
    if (v7)
    {
      rootIdentity = self->_rootIdentity;
      int v12 = 138543362;
      uint64_t v13 = rootIdentity;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're invalid.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      id v9 = self->_rootIdentity;
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] removing invalidated assertion and processing active assertions.", (uint8_t *)&v12, 0xCu);
    }

    id v6 = [(NSMapTable *)self->_assertionControlPreferences copy];
    [(NSMapTable *)self->_assertionControlPreferences removeObjectForKey:v4];
    if (self->_activated)
    {
      [(_SBDisplayAssertionStack *)self _evalAndApplyOldPreferences:v6 newPreferences:self->_assertionControlPreferences];
    }
    else
    {
      char v10 = SBLogDisplayAssertions();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_rootIdentity;
        int v12 = 138543618;
        uint64_t v13 = v11;
        __int16 v14 = 2114;
        id v15 = v4;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're not active. assertion: %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_evalAndApplyOldPreferences:(id)a3 newPreferences:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = (NSMapTable *)a3;
  BOOL v7 = (NSMapTable *)a4;
  int v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 183, @"Invalid parameter not satisfying: %@", @"oldAssertionPrefs" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 184, @"Invalid parameter not satisfying: %@", @"newAssertionPrefs" object file lineNumber description];

LABEL_3:
  if (self->_invalidated)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 185, @"Invalid parameter not satisfying: %@", @"!_invalidated" object file lineNumber description];
  }
  if (!self->_activated)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"_SBDisplayAssertionStack.m", 186, @"Invalid parameter not satisfying: %@", @"_activated" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x1E4F1CA80];
  char v10 = NSAllMapTableKeys(v6);
  id v11 = [v9 setWithArray:v10];

  int v12 = (void *)[v11 mutableCopy];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA80];
  __int16 v14 = NSAllMapTableKeys(v8);
  id v15 = [v13 setWithArray:v14];

  [v12 minusSet:v15];
  [v15 minusSet:v11];
  uint64_t v16 = _SBActiveAssertion(v6);
  int v17 = _SBActiveAssertion(v8);
  v53 = (void *)v16;
  v18 = [(NSMapTable *)v6 objectForKey:v16];
  uint64_t v19 = [(NSMapTable *)v8 objectForKey:v17];
  v51 = (void *)v19;
  if (([v18 isEqual:v19] & 1) == 0 && v18 != (void *)v19)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assertionStack:self updatedAssertionPreferences:v51 oldPreferences:v18];
  }
  uint64_t v21 = [v53 deactivationReasonsWhenActive];
  uint64_t v22 = [v17 deactivationReasonsWhenActive];
  if (v53 != v17 || v21 != v22)
  {
    uint64_t v55 = v22;
    uint64_t v23 = SBLogDisplayAssertions();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      *(_DWORD *)buf = 138543362;
      v62 = rootIdentity;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion data changed. calling back to delegates", buf, 0xCu);
    }

    if (v53 && v53 != v17 && (objc_msgSend(v12, "containsObject:") & 1) == 0)
    {
      __int16 v25 = SBLogDisplayAssertions();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = v11;
        v27 = self->_rootIdentity;
        UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
        uint64_t v28 = v49 = v18;
        *(_DWORD *)buf = 138543874;
        v62 = v27;
        id v11 = v26;
        __int16 v63 = 2114;
        v64 = v53;
        __int16 v65 = 2114;
        v66 = v28;
        _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it lost control of display. assertion: %{public}@; reasons: %{public}@",
          buf,
          0x20u);

        v18 = v49;
      }

      [v53 _didLoseControlOfDisplayForDeactivationReasons:v55];
    }
    if (v21 != v55)
    {
      v48 = v6;
      v50 = v18;
      v46 = v11;
      v47 = v8;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v29 = v8;
      uint64_t v30 = [(NSMapTable *)v29 countByEnumeratingWithState:&v56 objects:v60 count:16];
      id v31 = v53;
      if (v30)
      {
        uint64_t v32 = v30;
        uint64_t v33 = *(void *)v57;
        v52 = v15;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v57 != v33) {
              objc_enumerationMutation(v29);
            }
            long long v35 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            if (([v12 containsObject:v35] & 1) == 0
              && ([v15 containsObject:v35] & 1) == 0
              && ([v35 isEqual:v31] & 1) == 0
              && ([v35 isEqual:v17] & 1) == 0)
            {
              long long v36 = v17;
              long long v37 = SBLogDisplayAssertions();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                v38 = self->_rootIdentity;
                v39 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
                *(_DWORD *)buf = 138543874;
                v62 = v38;
                id v31 = v53;
                __int16 v63 = 2114;
                v64 = v35;
                __int16 v65 = 2114;
                v66 = v39;
                _os_log_impl(&dword_1D85BA000, v37, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion of new deactivation reasons. assertion: %{public}@; reasons: %{public}@",
                  buf,
                  0x20u);

                id v15 = v52;
              }

              [v35 _didReceiveNewDeactivationReasons:v55];
              int v17 = v36;
            }
          }
          uint64_t v32 = [(NSMapTable *)v29 countByEnumeratingWithState:&v56 objects:v60 count:16];
        }
        while (v32);
      }

      int v8 = v47;
      id v6 = v48;
      id v11 = v46;
      v18 = v50;
    }
    if (v17)
    {
      __int16 v40 = SBLogDisplayAssertions();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = self->_rootIdentity;
        *(_DWORD *)buf = 138543618;
        v62 = v41;
        __int16 v63 = 2114;
        v64 = v17;
        _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it gained control of display. assertion: %{public}@", buf, 0x16u);
      }

      [v17 _didGainControlOfDisplay];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionControlPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootIdentity, 0);
}

@end