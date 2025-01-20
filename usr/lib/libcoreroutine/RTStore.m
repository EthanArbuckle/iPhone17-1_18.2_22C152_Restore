@interface RTStore
+ (id)availabilityToString:(unint64_t)a3;
+ (id)contextTypeToString:(unint64_t)a3;
- (NSMutableDictionary)contexts;
- (RTInvocationDispatcher)dispatcher;
- (RTPersistenceManager)persistenceManager;
- (RTStore)init;
- (RTStore)initWithPersistenceManager:(id)a3;
- (unint64_t)availability;
- (void)_fetchReadableObjectsOfType:(Class)a3 fetchRequest:(id)a4 handler:(id)a5;
- (void)_onPersistenceManagerNotification:(id)a3;
- (void)_performBlock:(id)a3 contextType:(unint64_t)a4 errorHandler:(id)a5;
- (void)_purgeDateInterval:(id)a3 predicateMappings:(id)a4 limit:(unint64_t)a5 handler:(id)a6;
- (void)_removeAll:(id)a3 handler:(id)a4;
- (void)_setupContextsHandler:(id)a3;
- (void)_shutdownWithHandler:(id)a3;
- (void)_storeWritableObjects:(id)a3 handler:(id)a4;
- (void)_updateWritableObjects:(id)a3 handler:(id)a4;
- (void)enumerateType:(Class)a3 fetchRequest:(id)a4 enumerationBlock:(id)a5;
- (void)executeDeleteRequests:(id)a3 context:(id)a4 handler:(id)a5;
- (void)fetchAvailabilityWithHandler:(id)a3;
- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5;
- (void)fetchReadableObjectsOfType:(Class)a3 fetchRequest:(id)a4 handler:(id)a5;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onPersistenceManagerNotification:(id)a3;
- (void)purgeDateInterval:(id)a3 predicateMappings:(id)a4 handler:(id)a5;
- (void)purgeDateInterval:(id)a3 predicateMappings:(id)a4 purgeLimit:(unint64_t)a5 handler:(id)a6;
- (void)purgePredating:(id)a3 predicateMappings:(id)a4 handler:(id)a5;
- (void)purgePredating:(id)a3 predicateMappings:(id)a4 purgeLimit:(unint64_t)a5 handler:(id)a6;
- (void)removeAll:(id)a3 handler:(id)a4;
- (void)setAvailability:(unint64_t)a3;
- (void)setContexts:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)storeWritableObjects:(id)a3 handler:(id)a4;
- (void)updateWritableObjects:(id)a3 handler:(id)a4;
@end

@implementation RTStore

uint64_t __40__RTStore_storeWritableObjects_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeWritableObjects:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_performBlock:(id)a3 contextType:(unint64_t)a4 errorHandler:(id)a5
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = (void (**)(void, void))v10;
  if (v9)
  {
    v12 = [(RTStore *)self contexts];
    v13 = [NSNumber numberWithUnsignedInteger:a4];
    v14 = [v12 objectForKey:v13];

    if (v14)
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __50__RTStore__performBlock_contextType_errorHandler___block_invoke_81;
      v40[3] = &unk_1E6B90D08;
      id v42 = v9;
      id v15 = v14;
      id v41 = v15;
      [v15 performBlock:v40];
    }
    else
    {
      if ([(RTStore *)self availability])
      {
        if (v11)
        {
          unint64_t v22 = [(RTStore *)self availability];
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = *MEMORY[0x1E4F5CFE8];
          if (v22 == 1)
          {
            uint64_t v52 = *MEMORY[0x1E4F28568];
            v25 = NSString;
            v26 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v26);
            v28 = NSStringFromSelector(a2);
            v29 = +[RTStore availabilityToString:[(RTStore *)self availability]];
            v30 = [v25 stringWithFormat:@"%@, %@, availability, %@", v27, v28, v29];
            v53 = v30;
            v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
            v32 = [v23 errorWithDomain:v24 code:5 userInfo:v31];
          }
          else
          {
            uint64_t v50 = *MEMORY[0x1E4F28568];
            v37 = NSString;
            v38 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v38);
            v28 = NSStringFromSelector(a2);
            v29 = +[RTStore availabilityToString:[(RTStore *)self availability]];
            v30 = +[RTStore contextTypeToString:a4];
            v31 = [v37 stringWithFormat:@"%@, %@, availability, %@, invalid context of type, %@", v27, v28, v29, v30];
            v51 = v31;
            v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
            v32 = [v23 errorWithDomain:v24 code:7 userInfo:v39];
          }
          ((void (**)(void, void *))v11)[2](v11, v32);
        }
      }
      else
      {
        v33 = [(RTStore *)self dispatcher];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __50__RTStore__performBlock_contextType_errorHandler___block_invoke;
        v46[3] = &unk_1E6B98378;
        v46[4] = self;
        id v47 = v9;
        unint64_t v49 = a4;
        v48 = v11;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __50__RTStore__performBlock_contextType_errorHandler___block_invoke_2;
        v43[3] = &unk_1E6B921E0;
        v43[4] = self;
        SEL v45 = a2;
        v44 = v48;
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        v36 = NSStringFromSelector(a2);
        [v33 enqueueBlock:v46, v43, @"%@-%@", v35, v36 failureBlock description];
      }
      id v15 = 0;
    }
    goto LABEL_14;
  }
  if (v10)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F5CFE8];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v18 = NSString;
    NSStringFromSelector(a2);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v19 = [v18 stringWithFormat:@"%@, required block", v15];
    v55[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    v21 = [v16 errorWithDomain:v17 code:7 userInfo:v20];
    ((void (**)(void, void *))v11)[2](v11, v21);

LABEL_14:
  }
}

- (NSMutableDictionary)contexts
{
  return self->_contexts;
}

void __41__RTStore__storeWritableObjects_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)[*(id *)(*((void *)&v16 + 1) + 8 * v8++) managedObjectWithContext:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }

  id v15 = 0;
  char v10 = [v3 save:&v15];
  id v11 = v15;
  if ((v10 & 1) == 0)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v11);
  }
}

- (void)storeWritableObjects:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__RTStore_storeWritableObjects_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_storeWritableObjects:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__RTStore__storeWritableObjects_handler___block_invoke;
  v12[3] = &unk_1E6B91060;
  id v14 = v8;
  SEL v15 = a2;
  id v13 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x1E016DB00](v12);
  [(RTStore *)self _performBlock:v11 contextType:2 errorHandler:v9];
}

+ (id)availabilityToString:(unint64_t)a3
{
  id v3 = @"Unknown";
  if (a3 == 1) {
    id v3 = @"Unavailable";
  }
  if (a3 == 2) {
    return @"Available";
  }
  else {
    return v3;
  }
}

+ (id)contextTypeToString:(unint64_t)a3
{
  id v3 = @"Delete";
  if (a3 == 1) {
    id v3 = @"Fetch";
  }
  if (a3 == 2) {
    return @"Insert";
  }
  else {
    return v3;
  }
}

- (RTStore)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_);
}

- (RTStore)initWithPersistenceManager:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)RTStore;
    id v6 = [(RTNotifier *)&v19 init];
    id v7 = v6;
    if (v6)
    {
      v6->_availability = 0;
      objc_storeStrong((id *)&v6->_persistenceManager, a3);
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
      contexts = v7->_contexts;
      v7->_contexts = (NSMutableDictionary *)v8;

      id v10 = [RTInvocationDispatcher alloc];
      id v11 = [(RTNotifier *)v7 queue];
      uint64_t v12 = [(RTInvocationDispatcher *)v10 initWithQueue:v11];
      dispatcher = v7->_dispatcher;
      v7->_dispatcher = (RTInvocationDispatcher *)v12;

      persistenceManager = v7->_persistenceManager;
      SEL v15 = +[RTNotification notificationName];
      [(RTNotifier *)persistenceManager addObserver:v7 selector:sel_onPersistenceManagerNotification_ name:v15];

      [(RTService *)v7 setup];
    }
    self = v7;
    long long v16 = self;
  }
  else
  {
    long long v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTStore initWithPersistenceManager:]";
      __int16 v22 = 1024;
      int v23 = 84;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager (in %s:%d)", buf, 0x12u);
    }

    long long v16 = 0;
  }

  return v16;
}

- (void)_setupContextsHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v5 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [&unk_1F3453090 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(&unk_1F3453090);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        id v11 = [(RTStore *)self contexts];
        uint64_t v12 = [v11 objectForKey:v10];

        if (!v12)
        {
          dispatch_group_enter(v5);
          id v13 = [(RTStore *)self persistenceManager];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __33__RTStore__setupContextsHandler___block_invoke;
          v20[3] = &unk_1E6B94D80;
          v20[4] = self;
          v20[5] = v10;
          SEL v22 = a2;
          v21 = v5;
          [v13 createManagedObjectContext:v20];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [&unk_1F3453090 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
  id v14 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__RTStore__setupContextsHandler___block_invoke_43;
  block[3] = &unk_1E6B90868;
  id v19 = v17;
  id v15 = v17;
  dispatch_group_notify(v5, v14, block);
}

void __33__RTStore__setupContextsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 32);
  block[2] = __33__RTStore__setupContextsHandler___block_invoke_2;
  block[3] = &unk_1E6B90F80;
  id v9 = v3;
  id v5 = (id)v7;
  long long v11 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __33__RTStore__setupContextsHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) contexts];
    [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = (objc_class *)objc_opt_class();
      id v4 = NSStringFromClass(v3);
      id v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
      id v6 = +[RTStore contextTypeToString:](RTStore, "contextTypeToString:", [*(id *)(a1 + 48) integerValue]);
      int v7 = 138412802;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      long long v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "%@, %@, failed to create context, %@", (uint8_t *)&v7, 0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __33__RTStore__setupContextsHandler___block_invoke_43(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_onPersistenceManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = +[RTNotification notificationName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v4 availability];
    if (v8 == 2)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__RTStore__onPersistenceManagerNotification___block_invoke;
      v11[3] = &unk_1E6B90840;
      v11[4] = self;
      [(RTStore *)self _setupContextsHandler:v11];
    }
    else
    {
      uint64_t v9 = v8;
      long long v10 = [(RTStore *)self contexts];
      [v10 removeAllObjects];

      [(RTStore *)self setAvailability:v9 == 1];
    }
  }
}

uint64_t __45__RTStore__onPersistenceManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAvailability:2];
}

- (void)onPersistenceManagerNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__RTStore_onPersistenceManagerNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __44__RTStore_onPersistenceManagerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onPersistenceManagerNotification:*(void *)(a1 + 40)];
}

- (void)_shutdownWithHandler:(id)a3
{
  id v9 = a3;
  id v4 = [(RTStore *)self persistenceManager];
  id v5 = +[RTNotification notificationName];
  [v4 removeObserver:self fromNotification:v5];

  id v6 = [(RTStore *)self contexts];
  [v6 removeAllObjects];

  int v7 = [(RTStore *)self dispatcher];
  [v7 shutdown];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    id v8 = v9;
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RTNotification notificationName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    long long v10 = [[RTStoreNotificationAvailabilityDidChange alloc] initWithAvailability:[(RTStore *)self availability]];
    [(RTNotifier *)self postNotification:v10 toObserver:v6];
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = +[RTNotification notificationName];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setAvailability:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_availability != a3)
  {
    self->_availability = a3;
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v5);
      id v7 = +[RTStore availabilityToString:self->_availability];
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, availability, %@", (uint8_t *)&v12, 0x16u);
    }
    int v8 = [[RTStoreNotificationAvailabilityDidChange alloc] initWithAvailability:self->_availability];
    [(RTNotifier *)self postNotification:v8];

    id v9 = [(RTStore *)self dispatcher];
    int v10 = [v9 invocationsPending];

    if (v10)
    {
      __int16 v11 = [(RTStore *)self dispatcher];
      [v11 dispatchPendingInvocations];
    }
  }
}

- (void)fetchAvailabilityWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__RTStore_fetchAvailabilityWithHandler___block_invoke;
    v7[3] = &unk_1E6B90D08;
    v7[4] = self;
    int v8 = v4;
    dispatch_async(v5, v7);

    char v6 = v8;
  }
  else
  {
    char v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __40__RTStore_fetchAvailabilityWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 40), 0);
}

- (void)_updateWritableObjects:(id)a3 handler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    id v9 = [v7 firstObject];
    NSSelectorFromString(&cfstr_Updatemanagedo.isa);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __42__RTStore__updateWritableObjects_handler___block_invoke;
      v24[3] = &unk_1E6B91060;
      id v25 = v7;
      SEL v27 = a2;
      id v11 = v8;
      id v26 = v11;
      int v12 = (void *)MEMORY[0x1E016DB00](v24);
      [(RTStore *)self _performBlock:v12 contextType:2 errorHandler:v11];
    }
    else
    {
      id v13 = NSString;
      __int16 v14 = NSStringFromSelector(a2);
      id v15 = [v7 firstObject];
      uint64_t v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      long long v18 = [v13 stringWithFormat:@"%@, %@ does not support update protocol", v14, v17];

      id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v31 = v18;
        __int16 v32 = 2080;
        v33 = "-[RTStore _updateWritableObjects:handler:]";
        __int16 v34 = 1024;
        int v35 = 378;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@ (in %s:%d)", buf, 0x1Cu);
      }

      if (v8)
      {
        v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F5CFE8];
        uint64_t v28 = *MEMORY[0x1E4F28568];
        v29 = v18;
        SEL v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        long long v23 = [v20 errorWithDomain:v21 code:7 userInfo:v22];
        (*((void (**)(id, void *))v8 + 2))(v8, v23);
      }
    }
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __42__RTStore__updateWritableObjects_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v41 = [v3 mergePolicy];
  [v3 setMergePolicy:*MEMORY[0x1E4F1BE40]];
  id v4 = [*(id *)(a1 + 32) firstObject];
  id v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  uint64_t v7 = [v6 stringByAppendingString:@"MO"];

  v39 = (void *)v7;
  id v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v7];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  char v10 = [*(id *)(a1 + 32) valueForKeyPath:@"identifier"];
  id v11 = [v9 predicateWithFormat:@"%K IN %@", @"identifier", v10];
  [v8 setPredicate:v11];

  [v8 setReturnsObjectsAsFaults:0];
  id v51 = 0;
  int v12 = [v8 execute:&v51];
  id v13 = v51;
  __int16 v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v35 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v36 = [v12 count];
    *(_DWORD *)buf = 138413058;
    v55 = v35;
    __int16 v56 = 2112;
    id v57 = v8;
    __int16 v58 = 2048;
    uint64_t v59 = v36;
    __int16 v60 = 2112;
    id v61 = v13;
    _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  v38 = v13;

  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v40 = a1;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        SEL v22 = [v21 identifier];
        [v15 setObject:v21 forKeyedSubscript:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v18);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v23 = v12;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        v29 = [v28 identifier];
        v30 = [v15 objectForKeyedSubscript:v29];

        [v30 updateManagedObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v25);
  }

  id v42 = v38;
  char v31 = [v3 save:&v42];
  id v32 = v42;

  if ((v31 & 1) == 0)
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(*(SEL *)(v40 + 48));
      *(_DWORD *)buf = 138412546;
      v55 = v37;
      __int16 v56 = 2112;
      id v57 = v32;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
  }
  [v3 setMergePolicy:v41];
  uint64_t v34 = *(void *)(v40 + 40);
  if (v34) {
    (*(void (**)(uint64_t, id))(v34 + 16))(v34, v32);
  }
}

- (void)updateWritableObjects:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__RTStore_updateWritableObjects_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __41__RTStore_updateWritableObjects_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWritableObjects:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __50__RTStore__performBlock_contextType_errorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performBlock:*(void *)(a1 + 40) contextType:*(void *)(a1 + 56) errorHandler:*(void *)(a1 + 48)];
}

void __50__RTStore__performBlock_contextType_errorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = [v2 stringWithFormat:@"%@, %@, failed invoking pending invocation", v4, v5];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F5CFE8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    __int16 v14 = v6;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v12 = [v9 errorWithDomain:v10 code:5 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);
  }
}

uint64_t __50__RTStore__performBlock_contextType_errorHandler___block_invoke_81(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 reset];
}

- (void)removeAll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__RTStore_removeAll_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __29__RTStore_removeAll_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAll:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_removeAll:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[RTStore _removeAll:handler:]";
      __int16 v17 = 1024;
      int v18 = 528;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: classes (in %s:%d)", buf, 0x12u);
    }
  }
  if ([v6 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__RTStore__removeAll_handler___block_invoke;
    v11[3] = &unk_1E6B91088;
    id v12 = v6;
    id v13 = self;
    id v9 = v7;
    id v14 = v9;
    id v10 = (void *)MEMORY[0x1E016DB00](v11);
    [(RTStore *)self _performBlock:v10 contextType:0 errorHandler:v9];
  }
}

void __30__RTStore__removeAll_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[*(id *)(a1 + 32) count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        if ([v9 isSubclassOfClass:objc_opt_class()])
        {
          id v10 = [v9 fetchRequest];
          id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v10];
          [v11 setResultType:2];
          [v3 addObject:v11];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 40) executeDeleteRequests:v3 context:v12 handler:*(void *)(a1 + 48)];
}

- (void)purgePredating:(id)a3 predicateMappings:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__RTStore_purgePredating_predicateMappings_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __52__RTStore_purgePredating_predicateMappings_handler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v4 = (void *)[v3 initWithStartDate:v5 endDate:a1[5]];
  [v2 _purgeDateInterval:v4 predicateMappings:a1[6] limit:0 handler:a1[7]];
}

- (void)purgePredating:(id)a3 predicateMappings:(id)a4 purgeLimit:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTStore_purgePredating_predicateMappings_purgeLimit_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __63__RTStore_purgePredating_predicateMappings_purgeLimit_handler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v4 = (void *)[v3 initWithStartDate:v5 endDate:a1[5]];
  [v2 _purgeDateInterval:v4 predicateMappings:a1[6] limit:a1[8] handler:a1[7]];
}

- (void)purgeDateInterval:(id)a3 predicateMappings:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__RTStore_purgeDateInterval_predicateMappings_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __55__RTStore_purgeDateInterval_predicateMappings_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeDateInterval:*(void *)(a1 + 40) predicateMappings:*(void *)(a1 + 48) limit:0 handler:*(void *)(a1 + 56)];
}

- (void)purgeDateInterval:(id)a3 predicateMappings:(id)a4 purgeLimit:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__RTStore_purgeDateInterval_predicateMappings_purgeLimit_handler___block_invoke;
  block[3] = &unk_1E6B90FA8;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

uint64_t __66__RTStore_purgeDateInterval_predicateMappings_purgeLimit_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeDateInterval:*(void *)(a1 + 40) predicateMappings:*(void *)(a1 + 48) limit:*(void *)(a1 + 64) handler:*(void *)(a1 + 56)];
}

- (void)_purgeDateInterval:(id)a3 predicateMappings:(id)a4 limit:(unint64_t)a5 handler:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    if (v11)
    {
      id v13 = [v11 allKeys];
      if ([v13 count])
      {
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        uint64_t v26 = __62__RTStore__purgeDateInterval_predicateMappings_limit_handler___block_invoke;
        SEL v27 = &unk_1E6B983A0;
        id v13 = v13;
        id v28 = v13;
        id v29 = v11;
        unint64_t v33 = a5;
        id v30 = v10;
        char v31 = self;
        id v14 = v12;
        id v32 = v14;
        id v15 = (void *)MEMORY[0x1E016DB00](&v24);
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v15, 0, v14, v24, v25, v26, v27);
      }
      else if (v12)
      {
        (*((void (**)(id, void))v12 + 2))(v12, 0);
      }
      goto LABEL_15;
    }
  }
  else
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTStore _purgeDateInterval:predicateMappings:limit:handler:]";
      __int16 v40 = 1024;
      int v41 = 605;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    if (v11) {
      goto LABEL_12;
    }
  }
  id v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTStore _purgeDateInterval:predicateMappings:limit:handler:]";
    __int16 v40 = 1024;
    int v41 = 606;
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mappings (in %s:%d)", buf, 0x12u);
  }

  if (v10)
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    int v35 = @"requires a non-nil mappings.";
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v21 = &v35;
    SEL v22 = &v34;
    goto LABEL_13;
  }
LABEL_12:
  id v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F5CFE8];
  uint64_t v36 = *MEMORY[0x1E4F28568];
  v37 = @"requires a non-nil dateInterval.";
  id v20 = (void *)MEMORY[0x1E4F1C9E8];
  unint64_t v21 = &v37;
  SEL v22 = &v36;
LABEL_13:
  id v23 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
  id v13 = [v18 errorWithDomain:v19 code:7 userInfo:v23];

  if (v12) {
    (*((void (**)(id, id))v12 + 2))(v12, v13);
  }
LABEL_15:
}

void __62__RTStore__purgeDateInterval_predicateMappings_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v3 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1E016D870]();
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
        uint64_t v6 = [v22 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v22);
              }
              id v10 = [*(id *)(*((void *)&v23 + 1) + 8 * v9) fetchRequest];
              [v10 setFetchLimit:*(void *)(a1 + 72)];
              id v11 = (void *)MEMORY[0x1E4F28F60];
              id v12 = [*(id *)(a1 + 48) startDate];
              id v13 = [*(id *)(a1 + 48) endDate];
              id v14 = [v11 predicateWithFormat:@"%@ < %K AND %K < %@", v12, v5, v5, v13];
              [v10 setPredicate:v14];

              id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v10];
              [v15 setResultType:2];
              [v3 addObject:v15];

              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v22 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v7);
        }

        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v19);
  }

  [*(id *)(a1 + 56) executeDeleteRequests:v3 context:v16 handler:*(void *)(a1 + 64)];
}

- (void)executeDeleteRequests:(id)a3 context:(id)a4 handler:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = (void (**)(id, void *))a5;
  uint64_t v9 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v7;
  uint64_t v34 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        context = (void *)MEMORY[0x1E016D870]();
        id v12 = 0;
        while (1)
        {
          id v13 = v12;
          id v14 = (void *)MEMORY[0x1E016D870]();
          id v37 = v12;
          id v15 = [v8 executeRequest:v11 error:&v37];
          id v12 = v37;

          id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            id v20 = NSStringFromSelector(a2);
            uint64_t v21 = [v15 result];
            *(_DWORD *)buf = 138413058;
            long long v45 = v20;
            __int16 v46 = 2112;
            id v47 = v11;
            __int16 v48 = 2112;
            long long v49 = v21;
            __int16 v50 = 2112;
            id v51 = v12;
            _os_log_debug_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEBUG, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);
          }
          if (v12) {
            [v9 addObject:v12];
          }
          if (objc_msgSend(v9, "count", v30)) {
            break;
          }
          id v17 = [v11 fetchRequest];
          if (![v17 fetchLimit])
          {

            break;
          }
          uint64_t v18 = [v15 result];
          uint64_t v19 = [v18 unsignedIntegerValue];

          if (!v19) {
            goto LABEL_17;
          }
        }

LABEL_17:
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v34);
  }

  id v36 = 0;
  char v22 = [v8 save:&v36];
  id v23 = v36;
  if ((v22 & 1) == 0)
  {
    long long v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v45 = v29;
      __int16 v46 = 2112;
      id v47 = v23;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
    }
    [v9 addObject:v23];
  }
  if (v30)
  {
    if ((unint64_t)[v9 count] > 1)
    {
      long long v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F5CFE8];
      uint64_t v42 = *MEMORY[0x1E4F5CFE0];
      long long v43 = v9;
      long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      long long v25 = [v26 errorWithDomain:v27 code:9 userInfo:v28];
    }
    else
    {
      long long v25 = [v9 firstObject];
    }
    v30[2](v30, v25);
  }
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if ([(RTStore *)self conformsToProtocol:&unk_1F345B978])
    {
      uint64_t v10 = [v8 enumeratedType];
      if (objc_opt_respondsToSelector())
      {
        id v11 = self;
        id v26 = 0;
        id v12 = [(RTStore *)v11 fetchRequestFromOptions:v8 offset:a4 error:&v26];
        id v13 = v26;
        if (v12)
        {
          id v14 = [v8 processingBlock];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __60__RTStore_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
          v22[3] = &unk_1E6B983C8;
          unint64_t v25 = a4;
          id v23 = v14;
          id v24 = v9;
          id v15 = v14;
          [(RTStore *)v11 fetchReadableObjectsOfType:v10 fetchRequest:v12 handler:v22];
        }
        else
        {
          (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v13);
        }

        goto LABEL_13;
      }
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      long long v29 = @"the enumerated type is not a CoreDataReadable";
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v19 = &v29;
      id v20 = &v28;
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"this store does not conform to RTEnumerableStore";
      uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v19 = (__CFString **)v31;
      id v20 = &v30;
    }
    uint64_t v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];
    id v11 = [v16 errorWithDomain:v17 code:7 userInfo:v21];

    (*((void (**)(id, void, void, RTStore *))v9 + 2))(v9, 0, 0, v11);
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  id v11 = (RTStore *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, &v11->super.super.super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_13:
}

void __60__RTStore_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:objc_msgSend(v10, "count") + a1[6]];
  uint64_t v7 = a1[4];
  if (v7)
  {
    uint64_t v8 = (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);

    id v9 = (id)v8;
  }
  else
  {
    id v9 = v10;
  }
  id v11 = v9;
  (*(void (**)(void))(a1[5] + 16))();
}

- (void)enumerateType:(Class)a3 fetchRequest:(id)a4 enumerationBlock:(id)a5
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v52 = a4;
  uint64_t v8 = (void (**)(id, void, id, char *))a5;
  if (v8)
  {
    aSelector = a2;
    char v67 = 0;
    if (a3)
    {
      Class v54 = a3;
      if ([(objc_class *)a3 conformsToProtocol:&unk_1F3456960])
      {
        if ([(RTStore *)self availability] == 2)
        {
          if (v52)
          {
            __int16 v56 = (void *)[v52 copy];
            uint64_t v53 = 0;
            *(void *)v73 = 0;
            *(void *)&v73[8] = v73;
            *(void *)&v73[16] = 0x3032000000;
            v74 = __Block_byref_object_copy__82;
            v75 = __Block_byref_object_dispose__82;
            id v76 = 0;
            uint64_t v61 = 0;
            uint64_t v62 = (id *)&v61;
            uint64_t v63 = 0x3032000000;
            v64 = __Block_byref_object_copy__82;
            v65 = __Block_byref_object_dispose__82;
            id v66 = 0;
            uint64_t v50 = *MEMORY[0x1E4F5CFE8];
            uint64_t v51 = *MEMORY[0x1E4F28568];
            while (1)
            {
              id v9 = (void *)MEMORY[0x1E016D870]();
              [v56 setFetchOffset:v53];
              id v10 = _rt_log_facility_get_os_log(RTLogFacilityStore);
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v34 = NSStringFromSelector(aSelector);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v34;
                __int16 v69 = 2112;
                Class v70 = v54;
                __int16 v71 = 2112;
                v72 = v56;
                _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "%@, iterating type %@, with fetchRequest, %@", buf, 0x20u);
              }
              dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              v57[2] = __55__RTStore_enumerateType_fetchRequest_enumerationBlock___block_invoke;
              v57[3] = &unk_1E6B905F0;
              uint64_t v59 = v73;
              __int16 v60 = &v61;
              id v12 = v11;
              __int16 v58 = v12;
              [(RTStore *)self fetchReadableObjectsOfType:v54 fetchRequest:v56 handler:v57];
              id v13 = v12;
              id v14 = [MEMORY[0x1E4F1C9C8] now];
              dispatch_time_t v15 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(v13, v15)) {
                goto LABEL_14;
              }
              id v16 = [MEMORY[0x1E4F1C9C8] now];
              [v16 timeIntervalSinceDate:v14];
              double v18 = v17;
              uint64_t v19 = objc_opt_new();
              id v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_67];
              uint64_t v21 = [MEMORY[0x1E4F29060] callStackSymbols];
              char v22 = [v21 filteredArrayUsingPredicate:v20];
              id v23 = [v22 firstObject];

              [v19 submitToCoreAnalytics:v23 type:1 duration:v18];
              id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
              }

              unint64_t v25 = (void *)MEMORY[0x1E4F28C58];
              v85[0] = v51;
              *(void *)buf = @"semaphore wait timeout";
              id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v85 count:1];
              uint64_t v27 = [v25 errorWithDomain:v50 code:15 userInfo:v26];

              if (v27)
              {
                id v28 = v27;

                char v29 = 0;
              }
              else
              {
LABEL_14:
                id v28 = 0;
                char v29 = 1;
              }

              id v30 = v28;
              if ((v29 & 1) == 0) {
                objc_storeStrong(v62 + 5, v28);
              }
              v8[2](v8, *(void *)(*(void *)&v73[8] + 40), v62[5], &v67);
              if (v67) {
                break;
              }
              if (v62[5])
              {
                char v31 = _rt_log_facility_get_os_log(RTLogFacilityStore);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  id v32 = v62[5];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v32;
                  _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "received error while enumerating, %@", buf, 0xCu);
                }
                goto LABEL_24;
              }
              if ([*(id *)(*(void *)&v73[8] + 40) count])
              {
                v53 += [*(id *)(*(void *)&v73[8] + 40) count];
                char v33 = 1;
                goto LABEL_26;
              }
LABEL_25:
              char v33 = 0;
LABEL_26:

              if ((v33 & 1) == 0)
              {
                _Block_object_dispose(&v61, 8);

                _Block_object_dispose(v73, 8);
                goto LABEL_45;
              }
            }
            char v31 = _rt_log_facility_get_os_log(RTLogFacilityStore);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "client set stop bit while enumerating, breaking out.", buf, 2u);
            }
LABEL_24:

            goto LABEL_25;
          }
          long long v44 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v77 = *MEMORY[0x1E4F28568];
          v78 = @"requires non-nil fetchRequest";
          long long v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          __int16 v56 = [v44 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v45];

          long long v38 = _rt_log_facility_get_os_log(RTLogFacilityStore);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            __int16 v48 = NSStringFromSelector(aSelector);
            *(_DWORD *)v73 = 138412546;
            *(void *)&v73[4] = v48;
            *(_WORD *)&v73[12] = 2112;
            *(void *)&v73[14] = v56;
            _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", v73, 0x16u);
          }
        }
        else
        {
          long long v41 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v79 = *MEMORY[0x1E4F28568];
          v80 = @"resource temporarily unavailable.";
          uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          __int16 v56 = [v41 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v42];

          long long v38 = _rt_log_facility_get_os_log(RTLogFacilityStore);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            long long v43 = NSStringFromSelector(aSelector);
            *(_DWORD *)v73 = 138412546;
            *(void *)&v73[4] = v43;
            *(_WORD *)&v73[12] = 2112;
            *(void *)&v73[14] = v56;
            _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_INFO, "%@, error, %@", v73, 0x16u);
          }
        }
      }
      else
      {
        long long v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v81 = *MEMORY[0x1E4F28568];
        v82 = @"requires a type that conforms to RTCoreDataReadable.";
        long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        __int16 v56 = [v39 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v40];

        long long v38 = _rt_log_facility_get_os_log(RTLogFacilityStore);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v47 = NSStringFromSelector(aSelector);
          *(_DWORD *)v73 = 138412546;
          *(void *)&v73[4] = v47;
          *(_WORD *)&v73[12] = 2112;
          *(void *)&v73[14] = v56;
          _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", v73, 0x16u);
        }
      }
    }
    else
    {
      id v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v83 = *MEMORY[0x1E4F28568];
      v84 = @"requires non-nil type";
      id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      __int16 v56 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v37];

      long long v38 = _rt_log_facility_get_os_log(RTLogFacilityStore);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        __int16 v46 = NSStringFromSelector(aSelector);
        *(_DWORD *)v73 = 138412546;
        *(void *)&v73[4] = v46;
        *(_WORD *)&v73[12] = 2112;
        *(void *)&v73[14] = v56;
        _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", v73, 0x16u);
      }
    }

    char v67 = 1;
    v8[2](v8, 0, v56, &v67);
LABEL_45:
  }
  else
  {
    int v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v73 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", v73, 2u);
    }
  }
}

void __55__RTStore_enumerateType_fetchRequest_enumerationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchReadableObjectsOfType:(Class)a3 fetchRequest:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__RTStore_fetchReadableObjectsOfType_fetchRequest_handler___block_invoke;
    v12[3] = &unk_1E6B983F0;
    void v12[4] = self;
    Class v15 = a3;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
}

uint64_t __59__RTStore_fetchReadableObjectsOfType_fetchRequest_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchReadableObjectsOfType:*(void *)(a1 + 56) fetchRequest:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchReadableObjectsOfType:(Class)a3 fetchRequest:(id)a4 handler:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (a3)
    {
      if (v9)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke;
        v22[3] = &unk_1E6B98438;
        id v23 = v9;
        SEL v25 = a2;
        id v11 = v10;
        id v24 = v11;
        Class v26 = a3;
        id v12 = (void *)MEMORY[0x1E016DB00](v22);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_176;
        v20[3] = &unk_1E6B90C18;
        id v21 = v11;
        [(RTStore *)self _performBlock:v12 contextType:1 errorHandler:v20];

        id v13 = v23;
        goto LABEL_10;
      }
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      char v29 = @"requires a non-nil fetchRequest";
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      double v17 = &v29;
      double v18 = &v28;
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"requires a non-nil type";
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      double v17 = (__CFString **)v31;
      double v18 = &v30;
    }
    uint64_t v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
    id v13 = [v14 errorWithDomain:v15 code:7 userInfo:v19];

    (*((void (**)(id, void, NSObject *))v10 + 2))(v10, 0, v13);
    goto LABEL_10;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_10:
}

void __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v12 = 0;
  id v3 = [v2 execute:&v12];
  id v4 = v12;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityStore);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v3 count];
    *(_DWORD *)buf = 138413058;
    id v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);
  }
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [[_RTMap alloc] initWithInput:v3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_172;
    v11[3] = &__block_descriptor_40_e47____RTCoreDataReadable__16__0__NSManagedObject_8lu32l8;
    void v11[4] = *(void *)(a1 + 56);
    uint64_t v7 = [(_RTMap *)v6 withBlock:v11];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_172(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) createWithManagedObject:v3];
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityStore);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_fault_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_FAULT, "nil initialization of object of type, %@, using managedObject, %@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v4;
}

uint64_t __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_176(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (unint64_t)availability
{
  return self->_availability;
}

- (void)setContexts:(id)a3
{
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_contexts, 0);

  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end