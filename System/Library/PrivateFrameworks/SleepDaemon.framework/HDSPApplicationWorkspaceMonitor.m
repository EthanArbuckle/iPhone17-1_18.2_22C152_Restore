@interface HDSPApplicationWorkspaceMonitor
- (BOOL)isApplicationInstalled:(id)a3;
- (HDSPApplicationWorkspaceMonitor)init;
- (HKSPObserverSet)observers;
- (void)addObserver:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation HDSPApplicationWorkspaceMonitor

- (HDSPApplicationWorkspaceMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDSPApplicationWorkspaceMonitor;
  v2 = [(HDSPApplicationWorkspaceMonitor *)&v7 init];
  if (v2)
  {
    v3 = (HKSPObserverSet *)objc_alloc_init(MEMORY[0x263F75E20]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = v2;
  }

  return v2;
}

- (void)addObserver:(id)a3
{
  char v5 = 0;
  [(HKSPObserverSet *)self->_observers addObserver:a3 wasFirst:&v5];
  if (v5)
  {
    v4 = [MEMORY[0x263F01880] defaultWorkspace];
    [v4 addObserver:self];
  }
}

- (void)removeObserver:(id)a3
{
  char v5 = 0;
  [(HKSPObserverSet *)self->_observers removeObserver:a3 wasLast:&v5];
  if (v5)
  {
    v4 = [MEMORY[0x263F01880] defaultWorkspace];
    [v4 removeObserver:self];
  }
}

- (BOOL)isApplicationInstalled:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F01878];
  id v4 = a3;
  id v14 = 0;
  char v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v14];

  id v6 = v14;
  if (!v5)
  {
    objc_super v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2114;
      id v18 = v6;
      id v13 = v12;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create application record: %{public}@.", buf, 0x16u);
    }
    goto LABEL_7;
  }
  objc_super v7 = [v5 applicationState];
  if (![v7 isValid])
  {
LABEL_7:
    char v9 = 0;
    goto LABEL_10;
  }
  v8 = [v5 applicationState];
  if ([v8 isInstalled])
  {
    char v9 = 1;
  }
  else
  {
    v10 = [v5 applicationState];
    char v9 = [v10 isPlaceholder];
  }
LABEL_10:

  return v9;
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) bundleIdentifier];
        observers = self->_observers;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __58__HDSPApplicationWorkspaceMonitor_applicationsDidInstall___block_invoke;
        v12[3] = &unk_2645DA060;
        id v13 = v9;
        id v11 = v9;
        [(HKSPObserverSet *)observers enumerateObserversWithBlock:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void __58__HDSPApplicationWorkspaceMonitor_applicationsDidInstall___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 observedApplicationBundleIdentifiers];
  int v4 = [v3 containsObject:*(void *)(a1 + 32)];

  if (v4) {
    [v5 observedApplicationDidInstall:*(void *)(a1 + 32)];
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) bundleIdentifier];
        observers = self->_observers;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __60__HDSPApplicationWorkspaceMonitor_applicationsDidUninstall___block_invoke;
        v12[3] = &unk_2645DA060;
        id v13 = v9;
        id v11 = v9;
        [(HKSPObserverSet *)observers enumerateObserversWithBlock:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void __60__HDSPApplicationWorkspaceMonitor_applicationsDidUninstall___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 observedApplicationBundleIdentifiers];
  int v4 = [v3 containsObject:*(void *)(a1 + 32)];

  if (v4) {
    [v5 observedApplicationDidUninstall:*(void *)(a1 + 32)];
  }
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end