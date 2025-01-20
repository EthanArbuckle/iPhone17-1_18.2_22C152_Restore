@interface SBSystemActionAbstractDataSource
- (NSString)hostIdentifier;
- (SBSystemAction)selectedSystemAction;
- (SBSystemActionAbstractDataSource)initWithHostIdentifier:(id)a3;
- (id)executorForSystemAction:(id)a3;
- (void)_notifyDidUpdateSelectedAction;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setSelectedSystemAction:(id)a3;
- (void)updateSelectedAction;
@end

@implementation SBSystemActionAbstractDataSource

- (SBSystemAction)selectedSystemAction
{
  return self->_selectedSystemAction;
}

- (SBSystemActionAbstractDataSource)initWithHostIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)SBSystemActionAbstractDataSource;
    v7 = [(SBSystemActionAbstractDataSource *)&v12 init];
    if (v7)
    {
      uint64_t v8 = [v6 copy];
      hostIdentifier = v7->_hostIdentifier;
      v7->_hostIdentifier = (NSString *)v8;

      [(SBSystemActionAbstractDataSource *)v7 updateSelectedAction];
    }

    return v7;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostIdentifier != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBSystemActionAbstractDataSource *)a2 initWithHostIdentifier:(uint64_t)v11];
    }
    [v11 UTF8String];
    result = (SBSystemActionAbstractDataSource *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)setSelectedSystemAction:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedSystemAction, a3);
    -[SBSystemActionAbstractDataSource _notifyDidUpdateSelectedAction]((id *)&self->super.isa);
  }
}

- (void)_notifyDidUpdateSelectedAction
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BSDispatchQueueAssertMain();
    v2 = [a1 selectedSystemAction];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = objc_msgSend(a1[1], "allObjects", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) systemActionDataSource:a1 didUpdateSelectedAction:v2];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)updateSelectedAction
{
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSystemAction, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)executorForSystemAction:(id)a3
{
  return 0;
}

- (void)initWithHostIdentifier:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  long long v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSystemActionAbstractDataSource.m";
  __int16 v16 = 1024;
  int v17 = 27;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end