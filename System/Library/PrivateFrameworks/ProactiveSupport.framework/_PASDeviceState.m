@interface _PASDeviceState
+ (BOOL)isClassCLocked;
+ (BOOL)isDeviceFormattedForProtection;
+ (BOOL)isUnlocked;
+ (id)currentOsBuild;
+ (id)registerForLockStateChangeNotifications:(id)a3;
+ (int)lockState;
+ (void)registerForAKSEventsNotifications:(id)a3;
+ (void)runBlockWhenDeviceIsClassCUnlocked:(id)a3;
+ (void)runBlockWhenDeviceIsClassCUnlockedWithQoS:(unsigned int)a3 block:(id)a4;
+ (void)setDefaultSystemCallbacks;
+ (void)setSystemCallbacks:(const _PASDeviceStateSystemCallbacks *)a3;
+ (void)unregisterForAKSEventsNotifications:(void *)a3;
+ (void)unregisterForLockStateChangeNotifications:(id)a3;
@end

@implementation _PASDeviceState

+ (BOOL)isUnlocked
{
  unint64_t v2 = atomic_load((unint64_t *)&cb);
  int v3 = (*(uint64_t (**)(id, SEL))(v2 + 16))(a1, a2);
  return !v3 || v3 == 3;
}

+ (void)runBlockWhenDeviceIsClassCUnlockedWithQoS:(unsigned int)a3 block:(id)a4
{
  v5 = (void (**)(void))a4;
  if (v5)
  {
    v16 = v5;
    unint64_t v6 = atomic_load((unint64_t *)&cb);
    uint64_t v7 = (*(uint64_t (**)(void))(v6 + 8))();
    if (v7) {
      uint64_t v7 = +[_PASDeviceState isClassCLocked];
    }
    unint64_t v8 = atomic_load((unint64_t *)&cb);
    if ((*(unsigned int (**)(uint64_t))(v8 + 8))(v7)
      && !+[_PASDeviceState isClassCLocked])
    {
      v15 = (void *)MEMORY[0x1A62450A0]();
      v16[2]();
    }
    else
    {
      pthread_mutex_lock(&cUnlockMutex);
      unint64_t v9 = atomic_load((unint64_t *)&cb);
      (*(void (**)(void *))(v9 + 64))(&__block_literal_global_3093);
      if (!cUnlockBlocks)
      {
        uint64_t v10 = objc_opt_new();
        v11 = (void *)cUnlockBlocks;
        cUnlockBlocks = v10;
      }
      uint64_t v12 = objc_opt_new();
      uint64_t v13 = MEMORY[0x1A6245320](v16);
      v14 = *(void **)(v12 + 8);
      *(void *)(v12 + 8) = v13;

      *(_DWORD *)(v12 + 16) = a3;
      [(id)cUnlockBlocks addObject:v12];
      pthread_mutex_unlock(&cUnlockMutex);
      +[_PASDeviceState isClassCLocked];
    }
    v5 = v16;
  }
}

+ (BOOL)isClassCLocked
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (uint64_t (**)(id, SEL))atomic_load((unint64_t *)&cb);
  int v3 = (*v2)(a1, a2);
  if (v3)
  {
    char v31 = v3;
    pthread_mutex_lock(&cUnlockMutex);
    id v4 = (id)cUnlockBlocks;
    v5 = (void *)cUnlockBlocks;
    cUnlockBlocks = 0;

    pthread_mutex_unlock(&cUnlockMutex);
    unint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_get_global_queue(33, 0);
    dispatch_queue_t v36 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.user_interactive", v6, v7);

    unint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v9 = dispatch_get_global_queue(25, 0);
    dispatch_queue_t v35 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.user_initiated", v8, v9);

    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.default", v10, v11);

    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v34 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.utility", v13, v14);

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_get_global_queue(9, 0);
    dispatch_queue_t v33 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.background", v15, v16);

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v32 = dispatch_queue_create_with_target_V2("com.apple.proactive.unlockblocks.unspecified", v17, v18);

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v20) {
      goto LABEL_24;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v40;
    while (1)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v25 = v12;
        int v26 = *(_DWORD *)(v24 + 16);
        if (v26 > 20)
        {
          switch(v26)
          {
            case 21:
              goto LABEL_22;
            case 25:
              dispatch_queue_t v27 = v35;
              goto LABEL_21;
            case 33:
              dispatch_queue_t v27 = v36;
              goto LABEL_21;
          }
        }
        else if (v26)
        {
          if (v26 == 9)
          {
            dispatch_queue_t v27 = v33;
            goto LABEL_21;
          }
          if (v26 == 17)
          {
            dispatch_queue_t v27 = v34;
LABEL_21:
            v29 = v27;

            v25 = v29;
            goto LABEL_22;
          }
        }
        else
        {
          v28 = v32;

          v25 = v28;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Using default QOS for unlock block", buf, 2u);
        }
LABEL_22:
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __runUnlockBlocks_block_invoke;
        block[3] = &unk_1E5AEBE98;
        block[4] = v24;
        dispatch_async(v25, block);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (!v21)
      {
LABEL_24:

        LOBYTE(v3) = v31;
        return v3 ^ 1;
      }
    }
  }
  return v3 ^ 1;
}

+ (void)unregisterForAKSEventsNotifications:(void *)a3
{
  if (a3)
  {
    unint64_t v3 = atomic_load((unint64_t *)&cb);
    (*(void (**)(void *))(v3 + 56))(a3);
  }
}

+ (void)registerForAKSEventsNotifications:(id)a3
{
  unint64_t v3 = atomic_load((unint64_t *)&cb);
  id v4 = *(uint64_t (**)(uint64_t, id))(v3 + 48);
  uint64_t v5 = getAKSEventsNotificationsQueue_onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&getAKSEventsNotificationsQueue_onceToken, &__block_literal_global_57);
  }
  uint64_t v7 = (void *)v4(getAKSEventsNotificationsQueue_queue, v6);

  return v7;
}

+ (void)runBlockWhenDeviceIsClassCUnlocked:(id)a3
{
}

+ (id)currentOsBuild
{
  unint64_t v2 = atomic_load((unint64_t *)&cb);
  return (id)(*(uint64_t (**)(void))(v2 + 24))();
}

+ (BOOL)isDeviceFormattedForProtection
{
  unint64_t v2 = atomic_load((unint64_t *)&cb);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

+ (void)unregisterForLockStateChangeNotifications:(id)a3
{
  if (a3)
  {
    unint64_t v3 = atomic_load((unint64_t *)&cb);
    (*(void (**)(id))(v3 + 40))(a3);
  }
}

+ (id)registerForLockStateChangeNotifications:(id)a3
{
  unint64_t v3 = atomic_load((unint64_t *)&cb);
  id v4 = *(void (**)(uint64_t, id))(v3 + 32);
  uint64_t v5 = getLockStateChangedQueue_onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&getLockStateChangedQueue_onceToken, &__block_literal_global_54);
  }
  uint64_t v7 = v4(getLockStateChangedQueue_queue, v6);

  return v7;
}

+ (int)lockState
{
  unint64_t v2 = atomic_load((unint64_t *)&cb);
  return (*(uint64_t (**)(void))(v2 + 16))();
}

+ (void)setDefaultSystemCallbacks
{
}

+ (void)setSystemCallbacks:(const _PASDeviceStateSystemCallbacks *)a3
{
}

@end