@interface TUAudioController
- (OS_dispatch_semaphore)modifyingStateLock;
- (TUAudioController)init;
- (void)_acquireLock;
- (void)_releaseLock;
- (void)_requestUpdatedValueWithBlock:(id)a3 object:(id *)a4 isRequestingPointer:(BOOL *)a5 forceNewRequest:(BOOL)a6 scheduleTimePointer:(unint64_t *)a7 notificationString:(id)a8 notificationUserInfo:(id)a9 queue:(id)a10;
- (void)_requestUpdatedValueWithBlock:(id)a3 object:(id *)a4 isRequestingPointer:(BOOL *)a5 forceNewRequest:(BOOL)a6 scheduleTimePointer:(unint64_t *)a7 notificationString:(id)a8 queue:(id)a9;
- (void)setModifyingStateLock:(id)a3;
@end

@implementation TUAudioController

- (void)_requestUpdatedValueWithBlock:(id)a3 object:(id *)a4 isRequestingPointer:(BOOL *)a5 forceNewRequest:(BOOL)a6 scheduleTimePointer:(unint64_t *)a7 notificationString:(id)a8 notificationUserInfo:(id)a9 queue:(id)a10
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  if (!*a5 || v12)
  {
    v20 = a10;
    uint64_t v21 = mach_absolute_time();
    *a7 = v21;
    *a5 = 1;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke;
    v22[3] = &unk_1E58E6030;
    v22[4] = self;
    v26 = a7;
    uint64_t v27 = v21;
    id v25 = v16;
    v28 = a4;
    id v23 = v17;
    id v24 = v18;
    v29 = a5;
    dispatch_async(v20, v22);
  }
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _acquireLock];
  if (**(void **)(a1 + 64) <= *(void *)(a1 + 72))
  {
    v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_5();
    }

    [*(id *)(a1 + 32) _releaseLock];
    v2 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) _acquireLock];
    if (**(void **)(a1 + 64) <= *(void *)(a1 + 72))
    {
      v5 = TUDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_4();
      }

      char v6 = TUObjectsAreEqualOrNil((unint64_t)v2, **(void **)(a1 + 80));
      v7 = TUDefaultLog();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_3();
        }

        [*(id *)(a1 + 32) _releaseLock];
        [*(id *)(a1 + 32) _acquireLock];
        **(unsigned char **)(a1 + 88) = 0;
        [*(id *)(a1 + 32) _releaseLock];
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = **(void **)(a1 + 80);
          *(_DWORD *)buf = 138412546;
          uint64_t v20 = v9;
          __int16 v21 = 2112;
          v22 = v2;
          _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Requested value is different from cached value (cached = %@, current = %@)", buf, 0x16u);
        }

        objc_storeStrong(*(id **)(a1 + 80), v2);
        [*(id *)(a1 + 32) _releaseLock];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_11;
        v14[3] = &unk_1E58E6008;
        id v10 = *(id *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 32);
        id v15 = v10;
        uint64_t v16 = v11;
        id v12 = *(id *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 88);
        id v17 = v12;
        uint64_t v18 = v13;
        dispatch_async(MEMORY[0x1E4F14428], v14);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _releaseLock];
      v4 = TUDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_2();
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) _releaseLock];
    v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_1();
    }
  }
}

- (void)_releaseLock
{
}

- (void)_acquireLock
{
}

- (void)_requestUpdatedValueWithBlock:(id)a3 object:(id *)a4 isRequestingPointer:(BOOL *)a5 forceNewRequest:(BOOL)a6 scheduleTimePointer:(unint64_t *)a7 notificationString:(id)a8 queue:(id)a9
{
}

- (TUAudioController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUAudioController;
  v2 = [(TUAudioController *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    modifyingStateLock = v2->_modifyingStateLock;
    v2->_modifyingStateLock = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (OS_dispatch_semaphore)modifyingStateLock
{
  return self->_modifyingStateLock;
}

- (void)setModifyingStateLock:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_11(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Posting changed notification: %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];

  [*(id *)(a1 + 40) _acquireLock];
  **(unsigned char **)(a1 + 56) = 0;
  return [*(id *)(a1 + 40) _releaseLock];
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Skipping request, newer one coming", v2, v3, v4, v5, v6);
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Skipping post, newer request coming", v2, v3, v4, v5, v6);
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Value is the same", v2, v3, v4, v5, v6);
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Processing post, no newer ones in the queue", v2, v3, v4, v5, v6);
}

void __170__TUAudioController_Internal___requestUpdatedValueWithBlock_object_isRequestingPointer_forceNewRequest_scheduleTimePointer_notificationString_notificationUserInfo_queue___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Processing request, no newer ones in the queue", v2, v3, v4, v5, v6);
}

@end