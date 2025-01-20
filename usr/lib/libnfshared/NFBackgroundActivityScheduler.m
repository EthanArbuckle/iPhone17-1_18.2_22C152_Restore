@interface NFBackgroundActivityScheduler
- (BOOL)invalidated;
- (NFBackgroundActivityScheduler)initWithQueue:(id)a3;
- (NSMutableDictionary)activityMap;
- (OS_dispatch_queue)queue;
- (id)getActivity:(id)a3;
- (void)backgroundActivityScheduler:(id)a3 interval:(double)a4 tolerance:(double)a5 repeats:(BOOL)a6 qualityOfService:(int64_t)a7 delay:(double)a8 callback:(id)a9;
- (void)registerActivity:(id)a3 identifier:(id)a4;
- (void)schedulePreRegisteredActivity:(id)a3 callback:(id)a4;
- (void)setActivityMap:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)unregisterActivity:(id)a3;
@end

@implementation NFBackgroundActivityScheduler

- (NFBackgroundActivityScheduler)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFBackgroundActivityScheduler;
  v6 = [(NFBackgroundActivityScheduler *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_invalidated = 0;
    uint64_t v8 = objc_opt_new();
    activityMap = v7->_activityMap;
    v7->_activityMap = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)getActivity:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_activityMap objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)registerActivity:(id)a3 identifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_activityMap setObject:v8 forKey:v6];
  objc_sync_exit(v7);
}

- (void)unregisterActivity:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NFBackgroundActivityScheduler_unregisterActivity___block_invoke;
  block[3] = &unk_1E65AB840;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __52__NFBackgroundActivityScheduler_unregisterActivity___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) getActivity:*(void *)(a1 + 40)];
  v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  id v5 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
  if (v5)
  {
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i unregisterActivity %{public}@ for identifier: %{public}@", v10, ClassName, Name, 49, v2, *(void *)(a1 + 40));
    v3 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  objc_super v11 = dispatch_get_specific(v3);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v12 = (id)_NFSharedLogClient[(void)v11];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67110402;
    int v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = v16;
    __int16 v26 = 1024;
    int v27 = 49;
    __int16 v28 = 2114;
    v29 = v2;
    __int16 v30 = 2114;
    uint64_t v31 = v17;
    _os_log_impl(&dword_1CA51A000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i unregisterActivity %{public}@ for identifier: %{public}@", buf, 0x36u);
  }

  if (v2)
  {
    [v2 invalidate];
  }
  id v18 = *(id *)(a1 + 32);
  objc_sync_enter(v18);
  v19 = [*(id *)(a1 + 32) activityMap];
  [v19 removeObjectForKey:*(void *)(a1 + 40)];

  objc_sync_exit(v18);
}

- (void)schedulePreRegisteredActivity:(id)a3 callback:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  objc_super v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
  if (v11)
  {
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v11(6, "%c[%{public}s %{public}s]:%i ", v15, ClassName, Name, 63);
    id v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v16 = dispatch_get_specific(v9);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  uint64_t v17 = (id)_NFSharedLogClient[(void)v16];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v29 = v19;
    __int16 v30 = 2082;
    uint64_t v31 = object_getClassName(self);
    __int16 v32 = 2082;
    v33 = sel_getName(a2);
    __int16 v34 = 1024;
    int v35 = 63;
    _os_log_impl(&dword_1CA51A000, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke;
  block[3] = &unk_1E65AB890;
  block[4] = self;
  id v25 = v7;
  id v26 = v8;
  SEL v27 = a2;
  id v21 = v8;
  id v22 = v7;
  dispatch_async(queue, block);
}

void __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) getActivity:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v6)
      {
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v6(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", v11, ClassName, Name, 69, *(void *)(a1 + 40), v3);
        id v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v12 = dispatch_get_specific(v4);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v13 = (id)_NFSharedLogClient[(void)v12];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        v16 = object_getClassName(*(id *)(a1 + 32));
        uint64_t v17 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 67110402;
        int v37 = v15;
        __int16 v38 = 2082;
        v39 = v16;
        __int16 v40 = 2082;
        v41 = v17;
        __int16 v42 = 1024;
        int v43 = 69;
        __int16 v44 = 2114;
        uint64_t v45 = v18;
        __int16 v46 = 2114;
        v47 = v3;
        _os_log_impl(&dword_1CA51A000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", buf, 0x36u);
      }

      [v3 invalidate];
      goto LABEL_28;
    }
LABEL_29:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:*(void *)(a1 + 40)];
  int v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v20 >= 4) {
    goto LABEL_29;
  }
  id v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v20);
  if (v21)
  {
    id v22 = object_getClass(*(id *)(a1 + 32));
    BOOL v23 = class_isMetaClass(v22);
    __int16 v24 = object_getClassName(*(id *)(a1 + 32));
    id v25 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v26 = 45;
    if (v23) {
      uint64_t v26 = 43;
    }
    v21(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. Create a new activity: %{public}@", v26, v24, v25, 73, *(void *)(a1 + 40), v3);
    int v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  SEL v27 = dispatch_get_specific(v19);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  __int16 v28 = (id)_NFSharedLogClient[(void)v27];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v29)) {
      int v30 = 43;
    }
    else {
      int v30 = 45;
    }
    uint64_t v31 = object_getClassName(*(id *)(a1 + 32));
    __int16 v32 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v33 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67110402;
    int v37 = v30;
    __int16 v38 = 2082;
    v39 = v31;
    __int16 v40 = 2082;
    v41 = v32;
    __int16 v42 = 1024;
    int v43 = 73;
    __int16 v44 = 2114;
    uint64_t v45 = v33;
    __int16 v46 = 2114;
    v47 = v3;
    _os_log_impl(&dword_1CA51A000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. Create a new activity: %{public}@", buf, 0x36u);
  }

LABEL_28:
  [v3 setPreregistered:1];
  [*(id *)(a1 + 32) registerActivity:v3 identifier:*(void *)(a1 + 40)];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke_6;
  v34[3] = &unk_1E65AB868;
  id v35 = *(id *)(a1 + 48);
  [v3 scheduleWithBlock:v34];
}

void __72__NFBackgroundActivityScheduler_schedulePreRegisteredActivity_callback___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void (**)(uint64_t, void))(v2 + 16);
  id v4 = a2;
  v3(v2, 0);
  v4[2](v4, 1);
}

- (void)backgroundActivityScheduler:(id)a3 interval:(double)a4 tolerance:(double)a5 repeats:(BOOL)a6 qualityOfService:(int64_t)a7 delay:(double)a8 callback:(id)a9
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a9;
  int v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  id v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
  if (v21)
  {
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v25 = 45;
    if (isMetaClass) {
      uint64_t v25 = 43;
    }
    v21(6, "%c[%{public}s %{public}s]:%i ", v25, ClassName, Name, 94);
    int v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  uint64_t v26 = dispatch_get_specific(v19);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  SEL v27 = (id)_NFSharedLogClient[(void)v26];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = object_getClass(self);
    if (class_isMetaClass(v28)) {
      int v29 = 43;
    }
    else {
      int v29 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v44 = v29;
    __int16 v45 = 2082;
    __int16 v46 = object_getClassName(self);
    __int16 v47 = 2082;
    uint64_t v48 = sel_getName(a2);
    __int16 v49 = 1024;
    int v50 = 94;
    _os_log_impl(&dword_1CA51A000, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke;
  block[3] = &unk_1E65AB8B8;
  block[4] = self;
  id v35 = v17;
  double v38 = a4;
  double v39 = a5;
  BOOL v42 = a6;
  int64_t v40 = a7;
  double v41 = a8;
  id v36 = v18;
  SEL v37 = a2;
  id v31 = v18;
  id v32 = v17;
  dispatch_async(queue, block);
}

void __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) getActivity:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v6)
      {
        Class = object_getClass(*(id *)(a1 + 32));
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v11 = 45;
        if (isMetaClass) {
          uint64_t v11 = 43;
        }
        v6(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", v11, ClassName, Name, 100, *(void *)(a1 + 40), v3);
        id v4 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v12 = dispatch_get_specific(v4);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v13 = (id)_NFSharedLogClient[(void)v12];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v14)) {
          int v15 = 43;
        }
        else {
          int v15 = 45;
        }
        v16 = object_getClassName(*(id *)(a1 + 32));
        id v17 = sel_getName(*(SEL *)(a1 + 56));
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 67110402;
        int v37 = v15;
        __int16 v38 = 2082;
        double v39 = v16;
        __int16 v40 = 2082;
        double v41 = v17;
        __int16 v42 = 1024;
        int v43 = 100;
        __int16 v44 = 2114;
        uint64_t v45 = v18;
        __int16 v46 = 2114;
        __int16 v47 = v3;
        _os_log_impl(&dword_1CA51A000, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): %{public}@", buf, 0x36u);
      }

      [v3 invalidate];
      goto LABEL_28;
    }
LABEL_29:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:*(void *)(a1 + 40)];
  int v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v20 >= 4) {
    goto LABEL_29;
  }
  id v21 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v20);
  if (v21)
  {
    id v22 = object_getClass(*(id *)(a1 + 32));
    BOOL v23 = class_isMetaClass(v22);
    __int16 v24 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v25 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v26 = 45;
    if (v23) {
      uint64_t v26 = 43;
    }
    v21(6, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. New activity: %{public}@", v26, v24, v25, 104, *(void *)(a1 + 40), v3);
    int v19 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  SEL v27 = dispatch_get_specific(v19);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  __int16 v28 = (id)_NFSharedLogClient[(void)v27];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v29)) {
      int v30 = 43;
    }
    else {
      int v30 = 45;
    }
    id v31 = object_getClassName(*(id *)(a1 + 32));
    id v32 = sel_getName(*(SEL *)(a1 + 56));
    uint64_t v33 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67110402;
    int v37 = v30;
    __int16 v38 = 2082;
    double v39 = v31;
    __int16 v40 = 2082;
    double v41 = v32;
    __int16 v42 = 1024;
    int v43 = 104;
    __int16 v44 = 2114;
    uint64_t v45 = v33;
    __int16 v46 = 2114;
    __int16 v47 = v3;
    _os_log_impl(&dword_1CA51A000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i getActivity for identifier (%{public}@): nil. New activity: %{public}@", buf, 0x36u);
  }

LABEL_28:
  [v3 setInterval:*(double *)(a1 + 64)];
  [v3 setTolerance:*(double *)(a1 + 72)];
  [v3 setRepeats:*(unsigned __int8 *)(a1 + 96)];
  [v3 setQualityOfService:*(void *)(a1 + 80)];
  [v3 setDelay:*(double *)(a1 + 88)];
  [*(id *)(a1 + 32) registerActivity:v3 identifier:*(void *)(a1 + 40)];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke_9;
  v34[3] = &unk_1E65AB868;
  id v35 = *(id *)(a1 + 48);
  [v3 scheduleWithBlock:v34];
}

void __120__NFBackgroundActivityScheduler_backgroundActivityScheduler_interval_tolerance_repeats_qualityOfService_delay_callback___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void (**)(uint64_t, void))(v2 + 16);
  id v4 = a2;
  v3(v2, 0);
  v4[2](v4, 1);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)activityMap
{
  return self->_activityMap;
}

- (void)setActivityMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end