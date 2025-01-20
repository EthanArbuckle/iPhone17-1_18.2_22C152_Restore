@interface RTNotifier
- (BOOL)observer:(id)a3 observingNotificationName:(id)a4;
- (NSMutableDictionary)observersMap;
- (OS_dispatch_queue)queue;
- (RTNotifier)init;
- (RTNotifier)initWithName:(id)a3;
- (RTNotifier)initWithQueue:(id)a3;
- (unint64_t)getNumberOfObservers:(id)a3;
- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5;
- (void)postNotification:(id)a3;
- (void)postNotification:(id)a3 toObserver:(id)a4;
- (void)removeAllObservers;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 fromNotification:(id)a4;
- (void)setObserversMap:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation RTNotifier

void __40__RTNotifier_addObserver_selector_name___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  v6 = [v10 observer];
  v7 = v6;
  if (v6 == (void *)a1[4])
  {
    uint64_t v8 = [v10 selector];
    uint64_t v9 = a1[6];

    if (v8 == v9)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
  }
}

void __42__RTNotifier_postNotification_toObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  v6 = [v7 observer];
  if (v6 == *(void **)(a1 + 32))
  {
    [v6 performSelector:v7 withObject:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

void __31__RTNotifier_postNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 observer];
  uint64_t v4 = [v3 selector];

  [v5 performSelector:v4 withObject:*(void *)(a1 + 32)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)getNumberOfObservers:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self observersMap];
  v6 = [v5 objectForKey:v4];

  unint64_t v7 = [v6 count];
  return v7;
}

- (NSMutableDictionary)observersMap
{
  return self->_observersMap;
}

- (void)postNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTNotifier postNotification:]";
      __int16 v16 = 1024;
      int v17 = 173;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification (in %s:%d)", buf, 0x12u);
    }
  }
  v6 = [v4 name];

  if (!v6)
  {
    unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTNotifier postNotification:]";
      __int16 v16 = 1024;
      int v17 = 174;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "nil notification name (in %s:%d)", buf, 0x12u);
    }
  }
  uint64_t v8 = [(RTNotifier *)self observersMap];
  uint64_t v9 = [v4 name];
  id v10 = [v8 objectForKey:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__RTNotifier_postNotification___block_invoke;
  v12[3] = &unk_1E6B94F90;
  id v13 = v4;
  id v11 = v4;
  [v10 enumerateObjectsUsingBlock:v12];
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[RTNotifier addObserver:selector:name:]";
      __int16 v21 = 1024;
      int v22 = 79;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName (in %s:%d)", buf, 0x12u);
    }
  }
  id v11 = [(RTNotifier *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__RTNotifier_addObserver_selector_name___block_invoke;
  v14[3] = &unk_1E6B917F0;
  id v15 = v8;
  __int16 v16 = self;
  id v17 = v9;
  SEL v18 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(v11, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__RTNotifier_addObserver_selector_name___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [[RTObserverRecord alloc] initWithObserver:*(void *)(a1 + 32) selector:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 40) observersMap];
  id v4 = [v3 objectForKey:*(void *)(a1 + 48)];

  if (v4)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v22) = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__RTNotifier_addObserver_selector_name___block_invoke_2;
    v17[3] = &unk_1E6B94F18;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    v19 = buf;
    uint64_t v20 = v6;
    id v18 = v5;
    [v4 enumerateObjectsUsingBlock:v17];
    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      [v4 addObject:v2];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    unint64_t v7 = [*(id *)(a1 + 40) observersMap];
    id v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v2, 0];
    [v7 setObject:v8 forKey:*(void *)(a1 + 48)];
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = [*(id *)(a1 + 40) getNumberOfObservers:v15];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    __int16 v25 = 2048;
    uint64_t v26 = v16;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, add observer, %@(%p), notification, %@, numberOfObservers, %ld", buf, 0x34u);
  }
  [*(id *)(a1 + 40) internalAddObserver:*(void *)(a1 + 32) name:*(void *)(a1 + 48)];
}

- (void)postNotification:(id)a3 toObserver:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[RTNotifier postNotification:toObserver:]";
      __int16 v21 = 1024;
      int v22 = 189;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notification (in %s:%d)", buf, 0x12u);
    }
  }
  id v9 = [v6 name];

  if (!v9)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[RTNotifier postNotification:toObserver:]";
      __int16 v21 = 1024;
      int v22 = 190;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "nil notification name (in %s:%d)", buf, 0x12u);
    }
  }
  id v11 = [(RTNotifier *)self observersMap];
  id v12 = [v6 name];
  id v13 = [v11 objectForKey:v12];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__RTNotifier_postNotification_toObserver___block_invoke;
  v16[3] = &unk_1E6B94FB8;
  id v17 = v7;
  id v18 = v6;
  id v14 = v6;
  id v15 = v7;
  [v13 enumerateObjectsUsingBlock:v16];
}

- (RTNotifier)init
{
  v2 = self;
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (const char *)[(RTNotifier *)v2 UTF8String];
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v2];
    id v4 = (const char *)[v5 UTF8String];
  }
  dispatch_queue_t v6 = dispatch_queue_create(v4, v3);

  id v7 = [(RTNotifier *)v2 initWithQueue:v6];
  return v7;
}

- (RTNotifier)initWithQueue:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    dispatch_queue_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[RTNotifier initWithQueue:]";
      __int16 v14 = 1024;
      int v15 = 66;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)RTNotifier;
  id v7 = [(RTNotifier *)&v11 init];
  if (v7)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersMap = v7->_observersMap;
    v7->_observersMap = v8;

    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

- (RTNotifier)initWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[RTNotifier initWithName:]";
      __int16 v15 = 1024;
      int v16 = 58;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name (in %s:%d)", buf, 0x12u);
    }
  }
  dispatch_queue_t v6 = self;
  id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (const char *)[(RTNotifier *)v6 UTF8String];
  }
  else
  {
    id v9 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v6];
    id v8 = (const char *)[v9 UTF8String];
  }
  dispatch_queue_t v10 = dispatch_queue_create(v8, v7);

  objc_super v11 = [(RTNotifier *)v6 initWithQueue:v10];
  return v11;
}

- (void)removeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v11 = "-[RTNotifier removeObserver:]";
      __int16 v12 = 1024;
      int v13 = 119;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationObserver (in %s:%d)", buf, 0x12u);
    }
  }
  dispatch_queue_t v6 = [(RTNotifier *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__RTNotifier_removeObserver___block_invoke;
  v8[3] = &unk_1E6B90BF0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __29__RTNotifier_removeObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observersMap];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__RTNotifier_removeObserver___block_invoke_2;
  v5[3] = &unk_1E6B94F40;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __29__RTNotifier_removeObserver___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = [v8 count];
  if (v9 - 1 >= 0)
  {
    uint64_t v10 = v9;
    id v20 = v8;
    do
    {
      objc_super v11 = [v8 objectAtIndex:--v10];
      __int16 v12 = [v11 observer];
      if (*(void **)(a1 + 32) == v12)
      {
        [v8 removeObjectAtIndex:v10];
        int v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = (objc_class *)objc_opt_class();
          __int16 v15 = NSStringFromClass(v14);
          int v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v16);
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = [*(id *)(a1 + 40) getNumberOfObservers:v7];
          *(_DWORD *)buf = 138413314;
          int v22 = v15;
          __int16 v23 = 2112;
          uint64_t v24 = v17;
          __int16 v25 = 2048;
          uint64_t v26 = v18;
          __int16 v27 = 2112;
          id v28 = v7;
          __int16 v29 = 2048;
          uint64_t v30 = v19;
          _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, remove observer, %@(%p), notification, %@, numberOfObservers, %ld", buf, 0x34u);

          id v8 = v20;
        }

        [*(id *)(a1 + 40) internalRemoveObserver:v12 name:v7];
      }
    }
    while (v10 > 0);
  }
}

- (void)removeObserver:(id)a3 fromNotification:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[RTNotifier removeObserver:fromNotification:]";
    __int16 v19 = 1024;
    int v20 = 148;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationObserver (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[RTNotifier removeObserver:fromNotification:]";
      __int16 v19 = 1024;
      int v20 = 149;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  objc_super v11 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__RTNotifier_removeObserver_fromNotification___block_invoke;
  block[3] = &unk_1E6B92F80;
  block[4] = self;
  id v15 = v8;
  id v16 = v6;
  id v12 = v6;
  id v13 = v8;
  dispatch_sync(v11, block);
}

void __46__RTNotifier_removeObserver_fromNotification___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__52;
  int v22 = __Block_byref_object_dispose__52;
  v2 = [*(id *)(a1 + 32) observersMap];
  id v23 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v3 = (void *)v19[5];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __46__RTNotifier_removeObserver_fromNotification___block_invoke_26;
  id v15 = &unk_1E6B94F68;
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = &v18;
  [v3 enumerateObjectsUsingBlock:&v12];
  uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = [*(id *)(a1 + 32) getNumberOfObservers:v9, v12, v13, v14, v15];
    *(_DWORD *)buf = 138413314;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v9;
    __int16 v32 = 2048;
    uint64_t v33 = v11;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, remove observer, %@(%p), notification, %@, numberOfObservers, %ld", buf, 0x34u);
  }
  [*(id *)(a1 + 32) internalRemoveObserver:*(void *)(a1 + 48) name:*(void *)(a1 + 40)];

  _Block_object_dispose(&v18, 8);
}

void __46__RTNotifier_removeObserver_fromNotification___block_invoke_26(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 observer];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObjectAtIndex:a3];
    *a4 = 1;
  }
}

- (void)removeAllObservers
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__RTNotifier_removeAllObservers__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __32__RTNotifier_removeAllObservers__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observersMap];
  [v1 removeAllObjects];
}

- (BOOL)observer:(id)a3 observingNotificationName:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTNotifier observer:observingNotificationName:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 226;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: observer (in %s:%d)", buf, 0x12u);
    }

    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[RTNotifier observer:observingNotificationName:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 227;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationName (in %s:%d)", buf, 0x12u);
    }

LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v19 = 0;
  uint64_t v9 = [(RTNotifier *)self queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__RTNotifier_observer_observingNotificationName___block_invoke;
  v14[3] = &unk_1E6B94FE0;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v6;
  uint64_t v17 = buf;
  dispatch_sync(v9, v14);

  BOOL v10 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_11:

  return v10;
}

void __49__RTNotifier_observer_observingNotificationName___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observersMap];
  id v7 = [v2 objectForKey:*(void *)(a1 + 40)];

  if ([v7 count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = [v7 objectAtIndex:v3];
      id v5 = *(void **)(a1 + 48);
      id v6 = [v4 observer];

      if (v5 == v6) {
        break;
      }

      if (++v3 >= (unint64_t)[v7 count]) {
        goto LABEL_7;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_7:
}

- (void)setQueue:(id)a3
{
}

- (void)setObserversMap:(id)a3
{
}

@end