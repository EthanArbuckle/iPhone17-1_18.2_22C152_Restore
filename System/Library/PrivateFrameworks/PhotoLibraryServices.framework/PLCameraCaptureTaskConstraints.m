@interface PLCameraCaptureTaskConstraints
+ (PLCameraCaptureTaskConstraints)sharedTaskConstraints;
- (PLCameraCaptureTaskConstraints)init;
- (id)stateCaptureDictionary;
- (id)taskConstraintStatus;
- (void)startConstrainingTasksWithCoordinator:(id)a3;
- (void)stopConstrainingTasksWithCoordinator:(id)a3;
@end

@implementation PLCameraCaptureTaskConstraints

void __72__PLCameraCaptureTaskConstraints_startConstrainingTasksWithCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = [v2 count];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (v6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7 == 1;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    if (v9)
    {
      v11 = PLCameraTaskConstraintsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v10;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: become active for camera activity", (uint8_t *)&v13, 0xCu);
      }

      v12 = +[PLPhotoLibrary cameraPhotoLibrary];
      [v12 disableOpportunisticTasks];
    }
  }
}

- (void)startConstrainingTasksWithCoordinator:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLSafeRunWithUnfairLock();
}

+ (PLCameraCaptureTaskConstraints)sharedTaskConstraints
{
  pl_dispatch_once();
  v2 = (void *)sharedTaskConstraints_pl_once_object_15;
  return (PLCameraCaptureTaskConstraints *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong(&self->_mstreamdPauseContext, 0);
  objc_storeStrong((id *)&self->_taskConstraintCoordinators, 0);
}

- (id)stateCaptureDictionary
{
  [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  PLSafeRunWithUnfairLock();
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:v5 forKeyedSubscript:@"coordinators"];
  id v3 = [NSNumber numberWithBool:*((unsigned __int8 *)v7 + 24)];
  [v2 setObject:v3 forKeyedSubscript:@"photoStreamsPaused"];

  _Block_object_dispose(&v6, 8);
  return v2;
}

void __56__PLCameraCaptureTaskConstraints_stateCaptureDictionary__block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = (void *)a1[5];
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "description", (void)v9);
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 24) != 0;
}

- (id)taskConstraintStatus
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__78317;
  uint64_t v8 = __Block_byref_object_dispose__78318;
  id v9 = 0;
  PLSafeRunWithUnfairLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __54__PLCameraCaptureTaskConstraints_taskConstraintStatus__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"Camera capture task constraints are active (%ld coordinators activated)", v2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 24))
    {
      uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@", photo streams are paused"];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void *)(a1 + 32);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = *(id *)(v6 + 16);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@"\n\t%@", *(void *)(*((void *)&v21 + 1) + 8 * i)];
          uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
          v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v18 = [NSString stringWithFormat:@"Camera capture task constraints are not active"];
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- (void)stopConstrainingTasksWithCoordinator:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLSafeRunWithUnfairLock();
}

void __71__PLCameraCaptureTaskConstraints_stopConstrainingTasksWithCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (v2 == 1 && v3 == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    if (v5)
    {
      uint64_t v7 = PLCameraTaskConstraintsGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: resign active for camera activity", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v8 = +[PLPhotoLibrary cameraPhotoLibrary];
      [v8 enableOpportunisticTasks];
    }
  }
}

- (PLCameraCaptureTaskConstraints)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLCameraCaptureTaskConstraints;
  uint64_t v2 = [(PLCameraCaptureTaskConstraints *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_taskConstraintCoordinatorLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F8A228]) initWithProvider:v2];
    stateHandler = v3->_stateHandler;
    v3->_stateHandler = (PFStateCaptureHandler *)v4;

    id v6 = v3;
  }

  return v3;
}

void __55__PLCameraCaptureTaskConstraints_sharedTaskConstraints__block_invoke()
{
  v0 = objc_alloc_init(PLCameraCaptureTaskConstraints);
  v1 = (void *)sharedTaskConstraints_pl_once_object_15;
  sharedTaskConstraints_pl_once_object_15 = (uint64_t)v0;
}

@end