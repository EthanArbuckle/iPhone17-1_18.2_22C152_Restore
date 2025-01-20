@interface _SSKDisplayAssertionStack
- (FBSDisplayIdentity)displayIdentity;
- (NSString)description;
- (_SSKDisplayAssertionStack)initWithRootDisplay:(id)a3 delegate:(id)a4;
- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 delegate:(id)a5;
- (void)_assertion:(id)a3 updatedPreferences:(id)a4;
- (void)_assertionDidInvalidate:(id)a3;
- (void)_evalAndApplyOldPreferences:(id)a3 newPreferences:(id)a4;
- (void)activateAssertionsForDisplay:(id)a3;
- (void)dealloc;
- (void)invalidateAssertion:(id)a3;
- (void)invalidateForDisplayDisconnect;
@end

@implementation _SSKDisplayAssertionStack

- (_SSKDisplayAssertionStack)initWithRootDisplay:(id)a3 delegate:(id)a4
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
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 47, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 48, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)_SSKDisplayAssertionStack;
  v10 = [(_SSKDisplayAssertionStack *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rootIdentity, a3);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_invalidated = 0;
    uint64_t v12 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:0x10000];
    assertionControlPreferences = v11->_assertionControlPreferences;
    v11->_assertionControlPreferences = (NSMapTable *)v12;
  }
  return v11;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SSKDisplayAssertionStack;
  [(_SSKDisplayAssertionStack *)&v5 dealloc];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_rootIdentity withName:@"display"];
  objc_super v5 = [v3 build];

  return (NSString *)v5;
}

- (void)activateAssertionsForDisplay:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([(FBSDisplayIdentity *)self->_rootIdentity isEqual:v5] & 1) == 0)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 69, @"Invalid parameter not satisfying: %@", @"[_rootIdentity isEqual:rootIdentity]" object file lineNumber description];
  }
  if (self->_invalidated)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 70, @"Invalid parameter not satisfying: %@", @"!_invalidated" object file lineNumber description];
  }
  if (self->_activated)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 71, @"Invalid parameter not satisfying: %@", @"!_activated" object file lineNumber description];
  }
  v6 = SSKLogDisplayAssertions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] activating assertions for display", buf, 0xCu);
  }

  self->_activated = 1;
  id v7 = objc_alloc_init(MEMORY[0x263F08968]);
  [(_SSKDisplayAssertionStack *)self _evalAndApplyOldPreferences:v7 newPreferences:self->_assertionControlPreferences];
}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 delegate:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  if (([(FBSDisplayIdentity *)self->_rootIdentity isEqual:v9] & 1) == 0)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 81, @"Invalid parameter not satisfying: %@", @"[_rootIdentity isEqual:rootIdentity]" object file lineNumber description];
  }
  if (a4)
  {
    if (v10) {
      goto LABEL_5;
    }
  }
  else
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 82, @"Invalid parameter not satisfying: %@", @"SSKDisplayPriorityIsValid(assertionLevel)" object file lineNumber description];

    if (v10) {
      goto LABEL_5;
    }
  }
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 83, @"Invalid parameter not satisfying: %@", @"assertionDelegate" object file lineNumber description];

LABEL_5:
  if (self->_invalidated)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 84, @"Invalid parameter not satisfying: %@", @"!_invalidated" object file lineNumber description];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v11 = self->_assertionControlPreferences;
  uint64_t v12 = [(NSMapTable *)v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v16 level] == a4)
        {
          [MEMORY[0x263F08690] currentHandler];
          id v30 = v10;
          id v17 = v9;
          v19 = v18 = a2;
          [v19 handleFailureInMethod:v18, self, @"_SSKDisplayAssertionStack.m", 86, @"we are already tracking an assertion for level %lu: %@", a4, v16 object file lineNumber description];

          a2 = v18;
          id v9 = v17;
          id v10 = v30;
        }
      }
      uint64_t v13 = [(NSMapTable *)v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v13);
  }

  id v20 = [[SSKDisplayAssertion alloc] _initWithPhysicalDisplay:v9 level:a4 assertionStack:self delegate:v10];
  v21 = SSKLogDisplayAssertions();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543618;
    v36 = rootIdentity;
    __int16 v37 = 2114;
    id v38 = v20;
    _os_log_impl(&dword_25C444000, v21, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] acquiring new assertion: %{public}@", buf, 0x16u);
  }

  v23 = objc_alloc_init(SSKDisplayAssertionPreferences);
  [(SSKDisplayAssertionPreferences *)v23 setWantsControlOfDisplay:0];
  [(SSKDisplayAssertionPreferences *)v23 setDisplayArrangement:0];
  v24 = (void *)[(NSMapTable *)self->_assertionControlPreferences copy];
  [(NSMapTable *)self->_assertionControlPreferences setObject:v23 forKey:v20];
  if (self->_activated) {
    [(_SSKDisplayAssertionStack *)self _evalAndApplyOldPreferences:v24 newPreferences:self->_assertionControlPreferences];
  }

  return v20;
}

- (void)invalidateForDisplayDisconnect
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = SSKLogDisplayAssertions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    rootIdentity = self->_rootIdentity;
    *(_DWORD *)buf = 138543362;
    v24 = rootIdentity;
    _os_log_impl(&dword_25C444000, v4, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] told to invalidate.", buf, 0xCu);
  }

  if (self->_invalidated)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
  }
  self->_invalidated = 1;
  v6 = (void *)[(NSMapTable *)self->_assertionControlPreferences copy];
  assertionControlPreferences = self->_assertionControlPreferences;
  self->_assertionControlPreferences = 0;

  id v8 = _SSKActiveAssertion(v6);
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
        v15 = SSKLogDisplayAssertions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_rootIdentity;
          *(_DWORD *)buf = 138543618;
          v24 = v16;
          __int16 v25 = 2114;
          v26 = v14;
          _os_log_impl(&dword_25C444000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's invalidated. assertion: %{public}@", buf, 0x16u);
        }

        if ([v14 isEqual:v8] && self->_activated) {
          [v14 _didLoseControlOfDisplay];
        }
        [v14 _didInvalidateForDisplayDisconnect];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }
}

- (void)invalidateAssertion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _SSKActiveAssertion(self->_assertionControlPreferences);
  if ([v5 isEqual:v4] && self->_activated)
  {
    v6 = SSKLogDisplayAssertions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      int v8 = 138543618;
      id v9 = rootIdentity;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it's lost control of the display. assertion: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    [v4 _didLoseControlOfDisplay];
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
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_invalidated)
  {
    int v8 = SSKLogDisplayAssertions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = self->_rootIdentity;
      int v17 = 138543362;
      v18 = rootIdentity;
      _os_log_impl(&dword_25C444000, v8, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring wantsControlOfDisplay update because we're invalid.", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    int v8 = [(NSMapTable *)self->_assertionControlPreferences objectForKey:v6];
    char v10 = [v7 isEqual:v8];
    id v11 = SSKLogDisplayAssertions();
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
        _os_log_impl(&dword_25C444000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay since no change. assertion: %{public}@; preferences: %{public}@",
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
        _os_log_impl(&dword_25C444000, v11, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion preferences changed. assertion: %{public}@; preferences: %{public}@",
          (uint8_t *)&v17,
          0x20u);
      }

      id v11 = [(NSMapTable *)self->_assertionControlPreferences copy];
      [(NSMapTable *)self->_assertionControlPreferences setObject:v7 forKey:v6];
      if (self->_activated)
      {
        [(_SSKDisplayAssertionStack *)self _evalAndApplyOldPreferences:v11 newPreferences:self->_assertionControlPreferences];
      }
      else
      {
        v15 = SSKLogDisplayAssertions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_rootIdentity;
          int v17 = 138543874;
          v18 = v16;
          __int16 v19 = 2114;
          id v20 = v6;
          __int16 v21 = 2114;
          id v22 = v7;
          _os_log_impl(&dword_25C444000, v15, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion wantsControlOfDisplay because we're not active. assertion: %{public}@; "
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
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL invalidated = self->_invalidated;
  id v6 = SSKLogDisplayAssertions();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (invalidated)
  {
    if (v7)
    {
      rootIdentity = self->_rootIdentity;
      int v12 = 138543362;
      uint64_t v13 = rootIdentity;
      _os_log_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're invalid.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      id v9 = self->_rootIdentity;
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] removing invalidated assertion and processing active assertions.", (uint8_t *)&v12, 0xCu);
    }

    id v6 = [(NSMapTable *)self->_assertionControlPreferences copy];
    [(NSMapTable *)self->_assertionControlPreferences removeObjectForKey:v4];
    if (self->_activated)
    {
      [(_SSKDisplayAssertionStack *)self _evalAndApplyOldPreferences:v6 newPreferences:self->_assertionControlPreferences];
    }
    else
    {
      char v10 = SSKLogDisplayAssertions();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_rootIdentity;
        int v12 = 138543618;
        uint64_t v13 = v11;
        __int16 v14 = 2114;
        id v15 = v4;
        _os_log_impl(&dword_25C444000, v10, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] ignoring assertion invalidation because we're not active. assertion: %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_evalAndApplyOldPreferences:(id)a3 newPreferences:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v7 = (NSMapTable *)a3;
  int v8 = (NSMapTable *)a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 182, @"Invalid parameter not satisfying: %@", @"oldAssertionPrefs" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v29 = [MEMORY[0x263F08690] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 183, @"Invalid parameter not satisfying: %@", @"newAssertionPrefs" object file lineNumber description];

LABEL_3:
  if (self->_invalidated)
  {
    id v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 184, @"Invalid parameter not satisfying: %@", @"!_invalidated" object file lineNumber description];
  }
  if (!self->_activated)
  {
    long long v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"_SSKDisplayAssertionStack.m", 185, @"Invalid parameter not satisfying: %@", @"_activated" object file lineNumber description];
  }
  long long v32 = self;
  char v10 = (void *)MEMORY[0x263EFF9C0];
  id v11 = NSAllMapTableKeys(v7);
  int v12 = [v10 setWithArray:v11];

  uint64_t v13 = (void *)[v12 mutableCopy];
  __int16 v14 = (void *)MEMORY[0x263EFF9C0];
  id v15 = NSAllMapTableKeys(v9);
  uint64_t v16 = [v14 setWithArray:v15];

  [v13 minusSet:v16];
  [v16 minusSet:v12];
  int v17 = _SSKActiveAssertion(v7);
  v18 = _SSKActiveAssertion(v9);
  __int16 v19 = [(NSMapTable *)v7 objectForKey:v17];
  id v20 = [(NSMapTable *)v9 objectForKey:v18];
  if (([v19 isEqual:v20] & 1) == 0 && v19 != v20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v32->_delegate);
    [WeakRetained assertionStack:v32 updatedAssertionPreferences:v20 oldPreferences:v19];
  }
  if (v17 != v18)
  {
    id v22 = SSKLogDisplayAssertions();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      rootIdentity = v32->_rootIdentity;
      *(_DWORD *)buf = 138543362;
      long long v34 = rootIdentity;
      _os_log_impl(&dword_25C444000, v22, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] assertion data changed. calling back to delegates", buf, 0xCu);
    }

    if (v17 && ([v13 containsObject:v17] & 1) == 0)
    {
      v24 = SSKLogDisplayAssertions();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = v32->_rootIdentity;
        *(_DWORD *)buf = 138543618;
        long long v34 = v25;
        __int16 v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_25C444000, v24, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it lost control of display. assertion: %{public}@", buf, 0x16u);
      }

      [v17 _didLoseControlOfDisplay];
    }
    if (v18)
    {
      v26 = SSKLogDisplayAssertions();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v32->_rootIdentity;
        *(_DWORD *)buf = 138543618;
        long long v34 = v27;
        __int16 v35 = 2114;
        v36 = v18;
        _os_log_impl(&dword_25C444000, v26, OS_LOG_TYPE_DEFAULT, "stack[%{public}@] informing assertion it gained control of display. assertion: %{public}@", buf, 0x16u);
      }

      [v18 _didGainControlOfDisplay];
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