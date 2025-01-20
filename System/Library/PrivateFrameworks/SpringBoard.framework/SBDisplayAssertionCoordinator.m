@interface SBDisplayAssertionCoordinator
- (SBDisplayAssertionCoordinator)init;
- (SBDisplayAssertionCoordinatorDelegate)delegate;
- (id)_createDisplayAssertionStackForRootDisplay:(id)a3;
- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 delegate:(id)a6;
- (void)activateAssertionsForDisplay:(id)a3;
- (void)assertionStack:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5;
- (void)dealloc;
- (void)invalidateAssertionForDerivedDisplayDisconnect:(id)a3;
- (void)rootDisplayDidConnect:(id)a3;
- (void)rootDisplayDidDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBDisplayAssertionCoordinator

- (SBDisplayAssertionCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBDisplayAssertionCoordinator;
  v2 = [(SBDisplayAssertionCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    assertionStackMap = v2->_assertionStackMap;
    v2->_assertionStackMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    assertionPreferencesMap = v2->_assertionPreferencesMap;
    v2->_assertionPreferencesMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
  v10.super_class = (Class)SBDisplayAssertionCoordinator;
  [(SBDisplayAssertionCoordinator *)&v10 dealloc];
}

- (id)acquireAssertionForDisplay:(id)a3 level:(unint64_t)a4 deactivationReasons:(unint64_t)a5 delegate:(id)a6
{
  id v11 = a6;
  id v12 = a3;
  if (([v12 isRootIdentity] & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 43, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  if (SBDisplayAssertionLevelIsValid(a4))
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 44, @"Invalid parameter not satisfying: %@", @"SBDisplayAssertionLevelIsValid(assertionLevel)" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 45, @"Invalid parameter not satisfying: %@", @"assertionDelegate" object file lineNumber description];

LABEL_5:
  long long v13 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v12];
  long long v14 = [v13 acquireAssertionForDisplay:v12 level:a4 deactivationReasons:a5 delegate:v11];

  return v14;
}

- (void)activateAssertionsForDisplay:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 53, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = SBLogDisplayAssertions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ activating assertions for display %{public}@", buf, 0x16u);
  }
  objc_super v8 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];
  [v8 activateAssertionsForDisplay:v5];
}

- (void)rootDisplayDidConnect:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 60, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (v6)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 61, @"told multiple times about a connecting display: %@", v5 object file lineNumber description];
  }
  uint64_t v7 = SBLogDisplayAssertions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display connected %{public}@", buf, 0x16u);
  }
  v9 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (!v9)
  {
    objc_super v10 = [(SBDisplayAssertionCoordinator *)self _createDisplayAssertionStackForRootDisplay:v5];
    [(NSMutableDictionary *)self->_assertionStackMap setObject:v10 forKey:v5];
  }
}

- (void)rootDisplayDidDisconnect:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 isRootIdentity] & 1) == 0)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 70, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (!v6)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 71, @"told about a disconnecting display that we don't know about. were we told it disconnected twice?: %@", v5 object file lineNumber description];
  }
  uint64_t v7 = SBLogDisplayAssertions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    __int16 v15 = v8;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ told root display disconnected %{public}@", buf, 0x16u);
  }
  v9 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];
  [(NSMutableDictionary *)self->_assertionStackMap removeObjectForKey:v5];
  objc_super v10 = [(NSMutableDictionary *)self->_assertionPreferencesMap objectForKey:v5];
  if (v10)
  {
    [(NSMutableDictionary *)self->_assertionPreferencesMap removeObjectForKey:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assertionCoordinator:self updatedAssertionPreferences:0 oldPreferences:v10 forDisplay:v5];
  }
  [v9 invalidateForDisplayDisconnect];
}

- (void)invalidateAssertionForDerivedDisplayDisconnect:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 87, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];

    id v5 = 0;
  }
  assertionStackMap = self->_assertionStackMap;
  uint64_t v7 = [v5 rootDisplayIdentity];
  objc_super v8 = [(NSMutableDictionary *)assertionStackMap objectForKey:v7];

  [v8 invalidateAssertionForDerivedDisplayDisconnect:v10];
}

- (void)assertionStack:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  v9 = [a3 displayIdentity];
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
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 107, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_assertionStackMap objectForKey:v5];

  if (v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBDisplayAssertionCoordinator.m", 108, @"Invalid parameter not satisfying: %@", @"[_assertionStackMap objectForKey:rootIdentity] == nil" object file lineNumber description];
  }
  uint64_t v7 = [[_SBDisplayAssertionStack alloc] initWithRootDisplay:v5 delegate:self];

  return v7;
}

- (SBDisplayAssertionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDisplayAssertionCoordinatorDelegate *)WeakRetained;
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