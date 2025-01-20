@interface PBFApplicationStateNode
- (NSSet)components;
- (NSString)description;
- (NSString)stateDescription;
- (NSUUID)uniqueIdentifier;
- (PBFApplicationStateNode)initWithDescription:(id)a3;
- (void)_componentsDidUpdate;
- (void)addStateObserver:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)removeStateObserver:(id)a3;
- (void)setComponents:(id)a3;
- (void)updateByAddingComponent:(id)a3;
- (void)updateByRemovingComponent:(id)a3;
@end

@implementation PBFApplicationStateNode

- (PBFApplicationStateNode)initWithDescription:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v18.receiver = self;
    v18.super_class = (Class)PBFApplicationStateNode;
    v7 = [(PBFApplicationStateNode *)&v18 init];
    if (v7)
    {
      uint64_t v8 = [v6 copy];
      stateDescription = v7->_stateDescription;
      v7->_stateDescription = (NSString *)v8;

      uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
      uniqueIdentifier = v7->_uniqueIdentifier;
      v7->_uniqueIdentifier = (NSUUID *)v10;

      uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      observers = v7->_observers;
      v7->_observers = (NSHashTable *)v12;

      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
      observerNotificationScheduled = v7->_observerNotificationScheduled;
      v7->_observerNotificationScheduled = (BSAtomicFlag *)v14;
    }
    return v7;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"stateDescription"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(PBFApplicationStateNode *)a2 initWithDescription:(uint64_t)v17];
    }
    [v17 UTF8String];
    result = (PBFApplicationStateNode *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  [(PBFApplicationStateNode *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)PBFApplicationStateNode;
  [(PBFApplicationStateNode *)&v3 dealloc];
}

- (NSSet)components
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)[(NSSet *)v2->_components copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setComponents:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(NSSet *)v5->_components isEqualToSet:v4])
  {
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = [v4 copy];
    components = v5->_components;
    v5->_components = (NSSet *)v6;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setDelegate:", v5, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v5);
    [(PBFApplicationStateNode *)v5 _componentsDidUpdate];
  }
}

- (void)updateByAddingComponent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    if ([(NSSet *)v5->_components containsObject:v12])
    {
      objc_sync_exit(v5);
    }
    else
    {
      [v12 setDelegate:v5];
      uint64_t v6 = (void *)[(NSSet *)v5->_components mutableCopy];
      v7 = v6;
      if (v6) {
        id v8 = v6;
      }
      else {
        id v8 = (id)objc_opt_new();
      }
      uint64_t v9 = v8;

      [v9 addObject:v12];
      uint64_t v10 = [v9 copy];
      components = v5->_components;
      v5->_components = (NSSet *)v10;

      objc_sync_exit(v5);
      [(PBFApplicationStateNode *)v5 _componentsDidUpdate];
    }
    id v4 = v12;
  }
}

- (void)updateByRemovingComponent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    if ([(NSSet *)v5->_components containsObject:v9])
    {
      [v9 setDelegate:0];
      uint64_t v6 = (void *)[(NSSet *)v5->_components mutableCopy];
      [v6 removeObject:v9];
      uint64_t v7 = [v6 copy];
      components = v5->_components;
      v5->_components = (NSSet *)v7;

      objc_sync_exit(v5);
      [(PBFApplicationStateNode *)v5 _componentsDidUpdate];
    }
    else
    {
      objc_sync_exit(v5);
    }
    id v4 = v9;
  }
}

- (void)addStateObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeStateObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_stateDescription withName:@"description"];
  id v4 = [(PBFApplicationStateNode *)self components];
  id v5 = [v4 allObjects];
  id v6 = (id)[v3 appendObject:v5 withName:@"components" skipIfNil:1];

  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = self->_observers;
  objc_sync_enter(v3);
  id v4 = [(NSHashTable *)self->_observers allObjects];
  objc_sync_exit(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "stateWasInvalidated:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_componentsDidUpdate
{
  if ([(BSAtomicFlag *)self->_observerNotificationScheduled setFlag:1])
  {
    objc_super v3 = [NSString stringWithUTF8String:"-[PBFApplicationStateNode _componentsDidUpdate]"];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__PBFApplicationStateNode__componentsDidUpdate__block_invoke;
    v4[3] = &unk_1E69808C0;
    v4[4] = self;
    PBFDispatchAsyncWithString(v3, QOS_CLASS_DEFAULT, v4);
  }
}

void __47__PBFApplicationStateNode__componentsDidUpdate__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 8) setFlag:0];
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  objc_sync_exit(v2);

  id v4 = [*(id *)(a1 + 32) components];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "state:didUpdateComponents:", *(void *)(a1 + 32), v4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSString)stateDescription
{
  return self->_stateDescription;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerNotificationScheduled, 0);
}

- (void)initWithDescription:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  long long v9 = @"PBFApplicationStateMonitoring.m";
  __int16 v10 = 1024;
  int v11 = 143;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end