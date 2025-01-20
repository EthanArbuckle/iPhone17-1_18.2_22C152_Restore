@interface SSKDisplayAssertionCoordinator
- (SSKDisplayAssertionCoordinator)init;
- (SSKDisplayAssertionCoordinatorDelegate)delegate;
- (id)_createDisplayAssertionStackForRootDisplay:(id)a3;
- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 delegate:(id)a5;
- (void)activateAssertionsForDisplay:(id)a3;
- (void)assertionStack:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5;
- (void)dealloc;
- (void)invalidateAssertion:(id)a3;
- (void)rootDisplayDidConnect:(id)a3;
- (void)rootDisplayDidDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SSKDisplayAssertionCoordinator

- (SSKDisplayAssertionCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSKDisplayAssertionCoordinator;
  v2 = [(SSKDisplayAssertionCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    assertionStackMap = v2->_assertionStackMap;
    v2->_assertionStackMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    assertionPreferencesMap = v2->_assertionPreferencesMap;
    v2->_assertionPreferencesMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_assertionStackMap;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        [v8 invalidateForDisplayDisconnect];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  assertionStackMap = self->_assertionStackMap;
  self->_assertionStackMap = 0;

  v10.receiver = self;
  v10.super_class = (Class)SSKDisplayAssertionCoordinator;
  [(SSKDisplayAssertionCoordinator *)&v10 dealloc];
}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 delegate:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  if (([v10 isRootIdentity] & 1) == 0)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 40, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  if (a4)
  {
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 41, @"Invalid parameter not satisfying: %@", @"SSKDisplayPriorityIsValid(assertionLevel)" object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
  }
  uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 42, @"Invalid parameter not satisfying: %@", @"assertionDelegate" object file lineNumber description];

LABEL_5:
  long long v11 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v10];
  long long v12 = [v11 acquireAssertionForDisplay:v10 level:a4 delegate:v9];

  return v12;
}

- (void)activateAssertionsForDisplay:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 50, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = SSKLogDisplayAssertions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = _SSKLoggingMethodProem(self, 1);
    *(_DWORD *)buf = 138543618;
    long long v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_25C444000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ activating assertions for display %{public}@", buf, 0x16u);
  }
  objc_super v8 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];
  [v8 activateAssertionsForDisplay:v5];
}

- (void)rootDisplayDidConnect:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    long long v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 57, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (v6)
  {
    __int16 v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 58, @"told multiple times about a connecting display: %@", v5 object file lineNumber description];
  }
  uint64_t v7 = SSKLogDisplayAssertions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = _SSKLoggingMethodProem(self, 1);
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_25C444000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display connected %{public}@", buf, 0x16u);
  }
  id v9 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (!v9)
  {
    id v10 = [(SSKDisplayAssertionCoordinator *)self _createDisplayAssertionStackForRootDisplay:v5];
    [(NSMutableDictionary *)self->_assertionStackMap setObject:v10 forKey:v5];
  }
}

- (void)rootDisplayDidDisconnect:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    __int16 v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 67, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (!v6)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 68, @"told about a disconnecting display that we don't know about. were we told it disconnected twice?: %@", v5 object file lineNumber description];
  }
  uint64_t v7 = SSKLogDisplayAssertions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = _SSKLoggingMethodProem(self, 1);
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v8;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_25C444000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display disconnected %{public}@", buf, 0x16u);
  }
  id v9 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];
  [(NSMutableDictionary *)self->_assertionStackMap removeObjectForKey:v5];
  id v10 = [(NSMutableDictionary *)self->_assertionPreferencesMap objectForKey:v5];
  if (v10)
  {
    [(NSMutableDictionary *)self->_assertionPreferencesMap removeObjectForKey:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assertionCoordinator:self updatedAssertionPreferences:0 oldPreferences:v10 forDisplay:v5];
  }
  [v9 invalidateForDisplayDisconnect];
}

- (void)invalidateAssertion:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 84, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];

    id v5 = 0;
  }
  assertionStackMap = self->_assertionStackMap;
  uint64_t v7 = [v5 rootDisplayIdentity];
  objc_super v8 = [(NSMutableDictionary *)assertionStackMap objectForKey:v7];

  [v8 invalidateAssertion:v10];
}

- (void)assertionStack:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = [a3 displayIdentity];
  assertionPreferencesMap = self->_assertionPreferencesMap;
  if (v12) {
    [(NSMutableDictionary *)assertionPreferencesMap setObject:v12 forKey:v9];
  }
  else {
    [(NSMutableDictionary *)assertionPreferencesMap removeObjectForKey:v9];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assertionCoordinator:self updatedAssertionPreferences:v12 oldPreferences:v8 forDisplay:v9];
}

- (id)_createDisplayAssertionStackForRootDisplay:(id)a3
{
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 104, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (v6)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinator.m", 105, @"Invalid parameter not satisfying: %@", @"[_assertionStackMap objectForKey:rootIdentity] == nil" object file lineNumber description];
  }
  uint64_t v7 = [[_SSKDisplayAssertionStack alloc] initWithRootDisplay:v5 delegate:self];

  return v7;
}

- (SSKDisplayAssertionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSKDisplayAssertionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionPreferencesMap, 0);
  objc_storeStrong((id *)&self->_assertionStackMap, 0);
}

@end