@interface PBFGalleryController
- (BOOL)_stateLock_executeEnqueuedPushToProactive:(id)a3;
- (BOOL)_stateLock_isGalleryStale;
- (BOOL)_stateLock_persistGalleryConfiguration:(id)a3 lastUpdateDate:(id *)a4 sessionId:(id)a5 error:(id *)a6;
- (NSDate)lastUpdateDate;
- (NSURL)galleryCacheURL;
- (PBFGalleryController)initWithGalleryCacheURL:(id)a3 galleryLayoutProvider:(id)a4 runtimeAssertionProvider:(id)a5;
- (PBFGalleryController)initWithGalleryCacheURL:(id)a3 runtimeAssertionProvider:(id)a4;
- (PBFPosterGalleryLayoutProviding)galleryLayoutProvider;
- (PBFRuntimeAssertionProviding)runtimeAssertionProvider;
- (PRSPosterGalleryLayout)currentGalleryConfiguration;
- (double)maximumIntervalBetweenProactivePush;
- (double)minimumIntervalBetweenProactivePush;
- (id)determineRefreshStateWithContext:(id)a3;
- (id)galleryLayoutProviderWithError:(id *)a3;
- (id)runtimeAssertionProviderWithError:(id *)a3;
- (unint64_t)currentProactiveInfractionCount;
- (void)_pushFaceGalleryConfigurationUpdate:(id)a3 options:(unint64_t)a4 fetchError:(id)a5 sessionId:(id)a6 completion:(id)a7;
- (void)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 sessionId:(id)a5 completion:(id)a6;
- (void)_stateLock_enqueuePushUpdatedPosterDescriptors:(id)a3 reason:(id)a4 force:(BOOL)a5 sessionId:(id)a6 completion:(id)a7;
- (void)_stateLock_flushProactiveUpdateQueue;
- (void)_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:(id *)a3 error:(id *)a4;
- (void)_stateLock_notifyGalleryControllerDidUpdateCurrentGalleryConfiguration:(id)a3;
- (void)_stateLock_notifyGalleryControllerWillUpdateGalleryConfiguration;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 completion:(id)a5;
- (void)invalidate;
- (void)pushUpdatedPosterDescriptors:(id)a3 reason:(id)a4 force:(BOOL)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)setMaximumIntervalBetweenProactivePush:(double)a3;
- (void)setMinimumIntervalBetweenProactivePush:(double)a3;
- (void)updateGallery:(id)a3 completion:(id)a4;
@end

@implementation PBFGalleryController

- (PBFGalleryController)initWithGalleryCacheURL:(id)a3 runtimeAssertionProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(PBFProactivePosterGalleryLayoutProvider);
  v9 = [(PBFGalleryController *)self initWithGalleryCacheURL:v7 galleryLayoutProvider:v8 runtimeAssertionProvider:v6];

  return v9;
}

- (PBFGalleryController)initWithGalleryCacheURL:(id)a3 galleryLayoutProvider:(id)a4 runtimeAssertionProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:]();
    }
LABEL_23:
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B5ED8);
  }
  v11 = v10;
  if (([v10 conformsToProtocol:&unk_1F2AE46C8] & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B5F3CLL);
  }

  id v12 = v9;
  if (!v12)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B5FA0);
  }
  v13 = v12;
  if (([v12 conformsToProtocol:&unk_1F2ADD0B8] & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFPosterGalleryLayoutProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B6004);
  }

  if (([v8 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[URL checkResourceIsReachableAndReturnError:((void *)0)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:]();
    }
    goto LABEL_23;
  }
  v28.receiver = self;
  v28.super_class = (Class)PBFGalleryController;
  v14 = [(PBFGalleryController *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v8 copy];
    v16 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v15;

    uint64_t v17 = objc_opt_new();
    v18 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v17;

    objc_storeStrong((id *)v14 + 18, a4);
    *((_DWORD *)v14 + 6) = 0;
    objc_storeWeak((id *)v14 + 17, v11);
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantPast];
    v20 = (void *)*((void *)v14 + 14);
    *((void *)v14 + 14) = v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    v22 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = v21;

    *(_OWORD *)(v14 + 120) = xmmword_1D337EBD0;
    os_unfair_lock_lock((os_unfair_lock_t)v14 + 6);
    objc_msgSend(v14, "_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:error:", 0, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)v14 + 6);
  }

  return (PBFGalleryController *)v14;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    v3 = PBFLogGallery();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v6 = self;
      _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating gallery controller %p during dealloc", buf, 0xCu);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)PBFGalleryController;
  [(PBFGalleryController *)&v4 dealloc];
}

- (PRSPosterGalleryLayout)currentGalleryConfiguration
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  objc_super v4 = self->_stateLock_lastUsefulGalleryConfiguration;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (NSDate)lastUpdateDate
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  objc_super v4 = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (double)minimumIntervalBetweenProactivePush
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  double stateLock_minimumIntervalBetweenProactivePush = self->_stateLock_minimumIntervalBetweenProactivePush;
  os_unfair_lock_unlock(p_stateLock);
  return stateLock_minimumIntervalBetweenProactivePush;
}

- (double)maximumIntervalBetweenProactivePush
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  double stateLock_maximumIntervalBetweenProactivePush = self->_stateLock_maximumIntervalBetweenProactivePush;
  os_unfair_lock_unlock(p_stateLock);
  return stateLock_maximumIntervalBetweenProactivePush;
}

- (void)setMinimumIntervalBetweenProactivePush:(double)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_stateLock_minimumIntervalBetweenProactivePush != a3) {
    self->_double stateLock_minimumIntervalBetweenProactivePush = a3;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)setMaximumIntervalBetweenProactivePush:(double)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_stateLock_maximumIntervalBetweenProactivePush != a3) {
    self->_double stateLock_maximumIntervalBetweenProactivePush = a3;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (unint64_t)currentProactiveInfractionCount
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  unint64_t stateLock_proactiveInfractionCount = self->_stateLock_proactiveInfractionCount;
  os_unfair_lock_unlock(p_stateLock);
  return stateLock_proactiveInfractionCount;
}

- (id)runtimeAssertionProviderWithError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  p_runtimeAssertionProvider = &self->_runtimeAssertionProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runtimeAssertionProvider);

  if (a3 && !WeakRetained)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28588];
    v11[0] = @"runtimeAssertionProvider was nil";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v6, "pbf_generalErrorWithCode:userInfo:", 3, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = objc_loadWeakRetained((id *)p_runtimeAssertionProvider);
  return v8;
}

- (id)galleryLayoutProviderWithError:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  galleryLayoutProvider = self->_galleryLayoutProvider;
  if (a3 && !galleryLayoutProvider)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28588];
    v10[0] = @"galleryProvider was nil";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    objc_msgSend(v6, "pbf_generalErrorWithCode:userInfo:", 3, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    galleryLayoutProvider = self->_galleryLayoutProvider;
  }
  return galleryLayoutProvider;
}

- (void)enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [NSString stringWithFormat:@"[%@] enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:completion:", v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke;
  v13[3] = &unk_1E6984730;
  v13[4] = self;
  id v14 = v9;
  BOOL v18 = (a3 & 4) != 0;
  BOOL v19 = (a3 & 8) != 0;
  BOOL v20 = (a3 & 2) != 0;
  id v15 = v8;
  unint64_t v16 = a3;
  int64_t v17 = a4;
  id v11 = v8;
  id v12 = v9;
  PBFDispatchAsyncWithString(v10, QOS_CLASS_DEFAULT, v13);
}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  objc_super v4 = PBFLogGallery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(unsigned __int8 *)(a1 + 72);
    int v7 = *(unsigned __int8 *)(a1 + 73);
    int v8 = *(unsigned __int8 *)(a1 + 74);
    *(_DWORD *)buf = 138544386;
    uint64_t v47 = v5;
    __int16 v48 = 1024;
    *(_DWORD *)v49 = v6;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v7;
    __int16 v50 = 1024;
    int v51 = v8;
    __int16 v52 = 2114;
    id v53 = v3;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; dontQueryJustUseLocal:%{BOOL}u checkIfGalleryIsStale:%{"
      "BOOL}u persist:%{BOOL}u; lastHydrationDate %{public}@",
      buf,
      0x28u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 32) getFlag])
  {
    uint64_t v9 = PBFLogGallery();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v10;
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; invalidated",
        buf,
        0xCu);
    }

    id v11 = *(void **)(a1 + 48);
    if (v11)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_92;
      aBlock[3] = &unk_1E69830B8;
      id v12 = &v45;
      id v45 = v11;
      v13 = (void (**)(void))_Block_copy(aBlock);
      goto LABEL_22;
    }
    goto LABEL_37;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v14 = PBFLogGallery();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v15;
      __int16 v48 = 2114;
      *(void *)v49 = v3;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; returning local gallery; last hydrated %{public}@",
        buf,
        0x16u);
    }

    unint64_t v16 = *(void **)(a1 + 48);
    if (!v16) {
      goto LABEL_37;
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_94;
    v40[3] = &unk_1E6981090;
    id v12 = &v43;
    id v43 = v16;
    id v41 = v2;
    id v42 = v3;
    v13 = (void (**)(void))_Block_copy(v40);

    int64_t v17 = v41;
  }
  else
  {
    char v18 = objc_msgSend(*(id *)(a1 + 32), "_stateLock_isGalleryStale");
    if (!*(unsigned char *)(a1 + 73) || !v3 || !v2 || (v18 & 1) != 0)
    {
      v22 = *(void **)(*(void *)(a1 + 32) + 88);
      if (v22 && ([v22 isFinalized] & 1) == 0)
      {
        v23 = (_PBFGalleryEnqueuedRefreshGalleryRequest *)*(id *)(*(void *)(a1 + 32) + 88);
        int v24 = 1;
      }
      else
      {
        v23 = [[_PBFGalleryEnqueuedRefreshGalleryRequest alloc] initWithOptions:*(void *)(a1 + 56) powerLogReason:*(void *)(a1 + 64) sessionId:*(void *)(a1 + 40)];
        int v24 = 0;
      }
      if (*(void *)(a1 + 48)) {
        -[_PBFGalleryEnqueuedRefreshGalleryRequest addCompletionHandler:](v23, "addCompletionHandler:");
      }
      v25 = PBFLogGallery();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v24)
      {
        if (v26)
        {
          uint64_t v27 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          uint64_t v47 = v27;
          _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; gallery request ongoing, tacking on completion handler",
            buf,
            0xCu);
        }
      }
      else
      {
        if (v26)
        {
          uint64_t v28 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          uint64_t v47 = v28;
          _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; kicking off new request",
            buf,
            0xCu);
        }

        objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), v23);
        uint64_t v29 = *(void *)(a1 + 56);
        uint64_t v30 = *(void *)(a1 + 64);
        v32 = *(void **)(a1 + 32);
        v31 = *(void **)(a1 + 40);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_97;
        v33[3] = &unk_1E6984708;
        v34 = v31;
        v35 = v23;
        objc_msgSend(v32, "_stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:", v29, v30, v34, v33);

        v25 = v34;
      }

      goto LABEL_37;
    }
    BOOL v19 = PBFLogGallery();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v20;
      __int16 v48 = 2114;
      *(void *)v49 = v3;
      _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; checked if gallery is stale, it is not stale, returni"
        "ng local gallery; last hydrated %{public}@",
        buf,
        0x16u);
    }

    uint64_t v21 = *(void **)(a1 + 48);
    if (!v21)
    {
LABEL_37:
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
      goto LABEL_38;
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_95;
    v36[3] = &unk_1E6981090;
    id v12 = &v39;
    id v39 = v21;
    id v37 = v2;
    id v38 = v3;
    v13 = (void (**)(void))_Block_copy(v36);

    int64_t v17 = v37;
  }

LABEL_22:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if (v13)
  {
    v13[2](v13);
  }
LABEL_38:
}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_92(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

uint64_t __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_94(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0, 0);
}

uint64_t __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_95(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0, 0);
}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_97(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id v12 = PBFLogGallery();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_97_cold_1();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138543874;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; update completed.  Gallery received: %@, newLastUpdateDate: %{public}@",
      (uint8_t *)&v15,
      0x20u);
  }

  [*(id *)(a1 + 40) fireCompletionHandlersWithError:v11 faceGalleryConfiguration:v9 lastUpdateDate:v10 didUpdate:a4];
}

- (void)pushUpdatedPosterDescriptors:(id)a3 reason:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = [NSString stringWithFormat:@"[%@] pushUpdatedPosterDescriptors completion", v13];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__PBFGalleryController_pushUpdatedPosterDescriptors_reason_force_completion___block_invoke;
  v19[3] = &unk_1E6984758;
  id v20 = v13;
  uint64_t v21 = self;
  id v22 = v10;
  id v23 = v11;
  BOOL v25 = a5;
  id v24 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  PBFDispatchAsyncWithString(v14, QOS_CLASS_DEFAULT, v19);
}

void __77__PBFGalleryController_pushUpdatedPosterDescriptors_reason_force_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PBFLogGallery();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D31CE000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors begin", (uint8_t *)&v4, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(a1 + 40), "_stateLock_enqueuePushUpdatedPosterDescriptors:reason:force:sessionId:completion:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 32), *(void *)(a1 + 64));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
}

- (void)updateGallery:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController updateGallery:completion:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B72A4);
  }
  int v8 = (void (**)(void, void))v7;
  if (objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_keynoteModeEnabled"))
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v21[0] = @"Keynote mode is enabled; we aren't going to accept gallery updates right now.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v11 = objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 6, v10);
    ((void (**)(void, void *))v8)[2](v8, v11);
  }
  else
  {
    if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v8)[2](v8, v12);
    }
    else
    {
      v13 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v14 = [NSString stringWithFormat:@"[%@] updateGallery:completion:", v13];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __49__PBFGalleryController_updateGallery_completion___block_invoke;
      v16[3] = &unk_1E6981248;
      v16[4] = self;
      id v17 = v13;
      id v18 = v6;
      __int16 v19 = v8;
      id v12 = v13;
      PBFDispatchAsyncWithString(v14, QOS_CLASS_DEFAULT, v16);
    }
  }
}

void __49__PBFGalleryController_updateGallery_completion___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = *(id *)(*(void *)(a1 + 32) + 112);
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v2);
  id v6 = PBFLogGallery();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v7;
    __int16 v32 = 2048;
    double v33 = v5;
    _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateGallery; time since last request: %f",
      buf,
      0x16u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 32) getFlag])
  {
    int v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    goto LABEL_7;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 40) isEqual:*(void *)(a1 + 48)])
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28588];
    uint64_t v29 = @"Attempting to update gallery with the current gallery object";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    int v8 = objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 1, v10);

    ++*(void *)(*(void *)(a1 + 32) + 104);
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = *(double *)(v11 + 128);
  if (v12 <= 0.0 || (long double v13 = *(double *)(v11 + 120), v13 >= v12))
  {
    *(void *)(v11 + 104) = 0;
    uint64_t v11 = *(void *)(a1 + 32);
LABEL_16:
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
    goto LABEL_17;
  }
  double v14 = pow(v13, (double)*(unint64_t *)(v11 + 104));
  if (v14 < v12) {
    double v12 = v14;
  }
  if (v5 >= v12) {
    goto LABEL_16;
  }
  v26[0] = @"acceptableMinimumIntervalBetweenRequests";
  id v15 = [NSNumber numberWithDouble:v12];
  v27[0] = v15;
  v26[1] = @"timeIntervalSinceLastRequest";
  id v16 = [NSNumber numberWithDouble:v5];
  uint64_t v17 = *MEMORY[0x1E4F28588];
  v27[1] = v16;
  v27[2] = @"You have been rate limited! Please stop hammering this interface.";
  v26[2] = v17;
  v26[3] = @"numberOfRateLimitedAttempts";
  id v18 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 104)];
  v27[3] = v18;
  v26[4] = @"timeWhenceRequestsWillBeAcceptedAgain";
  __int16 v19 = [v2 dateByAddingTimeInterval:v12];
  v27[4] = v19;
  v27[5] = v3;
  v26[5] = @"previousRequestDate";
  v26[6] = @"sessionId";
  v27[6] = *(void *)(a1 + 40);
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:7];

  int v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 9, v20);
  ++*(void *)(*(void *)(a1 + 32) + 104);

LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if (!v8)
  {
LABEL_17:
    +[PBFPowerLogger logUpdate:3 reason:5];
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 48);
    id v23 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__PBFGalleryController_updateGallery_completion___block_invoke_138;
    v24[3] = &unk_1E6984780;
    id v25 = *(id *)(a1 + 56);
    [v23 _pushFaceGalleryConfigurationUpdate:v21 options:2 fetchError:0 sessionId:v22 completion:v24];
    int v8 = v25;
    goto LABEL_18;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_18:
}

uint64_t __49__PBFGalleryController_updateGallery_completion___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    os_unfair_lock_lock(&self->_stateLock);
    stateLock_observers = self->_stateLock_observers;
    if (!stateLock_observers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v7 = self->_stateLock_observers;
      self->_stateLock_observers = v6;

      stateLock_observers = self->_stateLock_observers;
    }
    [(NSHashTable *)stateLock_observers addObject:v9];
    os_unfair_lock_unlock(&self->_stateLock);
  }
  else
  {
    int v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController addObserver:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)removeObserver:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_stateLock);
  [(NSHashTable *)self->_stateLock_observers removeObject:v5];

  if (![(NSHashTable *)self->_stateLock_observers count])
  {
    stateLock_observers = self->_stateLock_observers;
    self->_stateLock_observers = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    galleryLayoutProvider = self->_galleryLayoutProvider;
    self->_galleryLayoutProvider = 0;

    objc_storeWeak((id *)&self->_runtimeAssertionProvider, 0);
    id v4 = PBFLogGallery();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      id v6 = self;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "PBFGalleryController Invalidated %p", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_stateLock_enqueuePushUpdatedPosterDescriptors:(id)a3 reason:(id)a4 force:(BOOL)a5 sessionId:(id)a6 completion:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (v15)
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v15[2](v15, 0, v16);
    }
    uint64_t v17 = PBFLogGallery();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      id v40 = v14;
      _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; invalidated",
        (uint8_t *)&v39,
        0xCu);
    }

    goto LABEL_32;
  }
  if (a5) {
    goto LABEL_8;
  }
  id v25 = PBFLogGallery();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138543362;
    id v40 = v14;
    _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; checking if descriptors have already been sent",
      (uint8_t *)&v39,
      0xCu);
  }

  stateLock_enqueuedPushToProactive = self->_stateLock_enqueuedPushToProactive;
  if (stateLock_enqueuedPushToProactive)
  {
    uint64_t v27 = [(_PBFGalleryEnqueuedPushToProactiveRequest *)stateLock_enqueuedPushToProactive updatedDescriptors];
    int v28 = [v27 isEqual:v12];

    if (v28)
    {
      uint64_t v29 = PBFLogGallery();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138543362;
        id v40 = v14;
        _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; descriptors match already enqueued push to proactive.  Bailing.",
          (uint8_t *)&v39,
          0xCu);
      }

      uint64_t v30 = self->_stateLock_enqueuedPushToProactive;
LABEL_31:
      [(_PBFGalleryEnqueuedPushToProactiveRequest *)v30 addCompletionHandler:v15];
      goto LABEL_32;
    }
  }
  stateLock_activePushToProactive = self->_stateLock_activePushToProactive;
  if (stateLock_activePushToProactive)
  {
    __int16 v32 = [(_PBFGalleryEnqueuedPushToProactiveRequest *)stateLock_activePushToProactive updatedDescriptors];
    int v33 = [v32 isEqual:v12];

    if (v33)
    {
      uint64_t v34 = PBFLogGallery();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138543362;
        id v40 = v14;
        _os_log_impl(&dword_1D31CE000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; descriptors match already active push to proactive.  Bailing.",
          (uint8_t *)&v39,
          0xCu);
      }

      uint64_t v30 = self->_stateLock_activePushToProactive;
      goto LABEL_31;
    }
  }
  stateLock_lastSuccessfulPushToProactive = self->_stateLock_lastSuccessfulPushToProactive;
  if (!stateLock_lastSuccessfulPushToProactive
    || (-[_PBFGalleryEnqueuedPushToProactiveRequest updatedDescriptors](stateLock_lastSuccessfulPushToProactive, "updatedDescriptors"), v36 = objc_claimAutoreleasedReturnValue(), int v37 = [v36 isEqual:v12], v36, !v37))
  {
LABEL_8:
    id v18 = PBFLogGallery();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      id v40 = v14;
      _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; Crafting new _PBFGalleryEnqueuedPushToProactiveRequest",
        (uint8_t *)&v39,
        0xCu);
    }

    __int16 v19 = [[_PBFGalleryEnqueuedPushToProactiveRequest alloc] initWithUpdatedDescriptors:v12 reason:v13 sessionId:v14];
    [(_PBFGalleryEnqueuedPushToProactiveRequest *)v19 addCompletionHandler:v15];
    if (self->_stateLock_enqueuedPushToProactive)
    {
      uint64_t v20 = PBFLogGallery();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(_PBFGalleryEnqueuedPushToProactiveRequest *)self->_stateLock_enqueuedPushToProactive sessionId];
        int v39 = 138543618;
        id v40 = v14;
        __int16 v41 = 2114;
        id v42 = v21;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; stealing completion handlers for existing enqueued request (session"
          "Id %{public}@) and replacing.",
          (uint8_t *)&v39,
          0x16u);
      }
      [(_PBFGalleryEnqueuedPushToProactiveRequest *)v19 addCompletionHandlersFromEnqueuedPushToProactive:self->_stateLock_enqueuedPushToProactive];
    }
    uint64_t v22 = PBFLogGallery();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      id v40 = v14;
      _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; enqueuing",
        (uint8_t *)&v39,
        0xCu);
    }

    id v23 = self->_stateLock_enqueuedPushToProactive;
    self->_stateLock_enqueuedPushToProactive = v19;

    id v24 = PBFLogGallery();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138543362;
      id v40 = v14;
      _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; flush",
        (uint8_t *)&v39,
        0xCu);
    }

    [(PBFGalleryController *)self _stateLock_flushProactiveUpdateQueue];
    goto LABEL_32;
  }
  id v38 = PBFLogGallery();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138543362;
    id v40 = v14;
    _os_log_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushUpdatedPosterDescriptors; descriptors have already been sent in prior send.  Bailing.",
      (uint8_t *)&v39,
      0xCu);
  }

  if (v15) {
    v15[2](v15, 0, 0);
  }
LABEL_32:
}

- (void)_stateLock_flushProactiveUpdateQueue
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    if (self->_stateLock_activePushToProactive || !self->_stateLock_enqueuedPushToProactive)
    {
      id v3 = PBFLogGallery();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = [(_PBFGalleryEnqueuedPushToProactiveRequest *)self->_stateLock_activePushToProactive sessionId];
        int v5 = [(_PBFGalleryEnqueuedPushToProactiveRequest *)self->_stateLock_enqueuedPushToProactive sessionId];
        int v9 = 138543618;
        id v10 = v4;
        __int16 v11 = 2114;
        id v12 = v5;
        _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "_flushProactiveUpdateQueue; nothing to do; active session id %{public}@; enqueued session id %{public}@",
          (uint8_t *)&v9,
          0x16u);
      }
    }
    else
    {
      id v6 = PBFLogGallery();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(_PBFGalleryEnqueuedPushToProactiveRequest *)self->_stateLock_enqueuedPushToProactive sessionId];
        int v9 = 138543362;
        id v10 = v7;
        _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "_flushProactiveUpdateQueue; moving session id %{public}@ to active",
          (uint8_t *)&v9,
          0xCu);
      }
      objc_storeStrong((id *)&self->_stateLock_activePushToProactive, self->_stateLock_enqueuedPushToProactive);
      stateLock_enqueuedPushToProactive = self->_stateLock_enqueuedPushToProactive;
      self->_stateLock_enqueuedPushToProactive = 0;

      [(PBFGalleryController *)self _stateLock_executeEnqueuedPushToProactive:self->_stateLock_activePushToProactive];
    }
  }
}

- (BOOL)_stateLock_executeEnqueuedPushToProactive:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  int v5 = [v4 sessionId];
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v66 = 0;
    int v9 = [(PBFGalleryController *)self runtimeAssertionProviderWithError:&v66];
    id v7 = v66;
    if (v7)
    {
      id v10 = PBFLogGallery();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PBFGalleryController _stateLock_executeEnqueuedPushToProactive:]();
      }

      [v4 fireCompletionHandlersWithError:v7 didUpdate:0];
      BOOL v8 = 0;
      goto LABEL_35;
    }
    id v65 = 0;
    __int16 v41 = [(PBFGalleryController *)self galleryLayoutProviderWithError:&v65];
    id v42 = v65;
    if (v42)
    {
      __int16 v11 = PBFLogGallery();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PBFGalleryController _stateLock_executeEnqueuedPushToProactive:]();
      }

      [v4 fireCompletionHandlersWithError:v42 didUpdate:0];
      BOOL v8 = 0;
      goto LABEL_34;
    }
    id v12 = [v4 reason];
    uint64_t v13 = [v4 updatedDescriptors];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__17;
    v80 = __Block_byref_object_dispose__17;
    id v14 = [MEMORY[0x1E4F96478] currentProcess];
    id v81 = [v9 acquirePrewarmRuntimeAssertionForReason:@"Push To Proactive" target:v14 invalidationHandler:0];

    id v15 = PBFLogGallery();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v71 = 138543618;
      *(void *)&v71[4] = v5;
      *(_WORD *)&v71[12] = 2114;
      *(void *)&v71[14] = v12;
      _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:reason:'%{public}@'; begin",
        v71,
        0x16u);
    }

    uint64_t v16 = *MEMORY[0x1E4F28588];
    v76[0] = @"Proactive indicated it was not successful in receiving our updatedPosterDescriptorsForExtensionBundleIdentifier";
    v75[0] = v16;
    v75[1] = @"updatedPosterDescriptorsForExtensionBundleIdentifier";
    uint64_t v17 = [v13 description];
    id v18 = (void *)v17;
    __int16 v19 = @"(NULL)";
    if (v17) {
      __int16 v19 = (__CFString *)v17;
    }
    v75[2] = @"reason";
    uint64_t v20 = @"(null)";
    if (v12) {
      uint64_t v20 = v12;
    }
    v76[1] = v19;
    v76[2] = v20;
    id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:3];

    uint64_t v21 = v13;
    uint64_t v22 = objc_opt_new();
    *(void *)v71 = 0;
    *(void *)&v71[8] = v71;
    *(void *)&v71[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__164;
    v73 = __Block_byref_object_dispose__165;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke;
    aBlock[3] = &unk_1E69847D0;
    id v36 = v5;
    id v57 = v36;
    id v37 = v22;
    id v58 = v37;
    int v39 = v12;
    v59 = v39;
    v60 = self;
    id v61 = v4;
    id v40 = v21;
    id v62 = v40;
    p_long long buf = &buf;
    id v23 = v41;
    id v63 = v23;
    id v74 = _Block_copy(aBlock);
    if ([v40 count])
    {
      stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier = self->_stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier;
      if (!stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier
        || ![(NSDictionary *)stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier isEqualToDictionary:v40])
      {
        uint64_t v27 = PBFLogGallery();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v67 = 138543618;
          id v68 = v36;
          __int16 v69 = 2114;
          v70 = v39;
          _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@'; dumping payload...",
            v67,
            0x16u);
        }

        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_171;
        v54[3] = &unk_1E69818B8;
        id v28 = v36;
        id v55 = v28;
        [v40 enumerateKeysAndObjectsUsingBlock:v54];
        uint64_t v29 = PBFLogGallery();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v67 = 138543618;
          id v68 = v28;
          __int16 v69 = 2114;
          v70 = v39;
          _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@'; firing request...",
            v67,
            0x16u);
        }

        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_175;
        v49[3] = &unk_1E6984820;
        id v30 = v28;
        id v50 = v30;
        uint64_t v31 = v39;
        int v51 = v31;
        id v53 = v71;
        id v32 = v38;
        id v52 = v32;
        [v23 handlePosterDescriptorsDidChange:v40 withCompletion:v49];
        dispatch_time_t v33 = dispatch_time(0, 10000000000);
        uint64_t v34 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_176;
        block[3] = &unk_1E6984848;
        id v44 = v37;
        id v45 = v30;
        v46 = v31;
        __int16 v48 = v71;
        id v47 = v32;
        dispatch_after(v33, v34, block);

        BOOL v8 = 1;
        goto LABEL_33;
      }
      id v25 = PBFLogGallery();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 138543618;
        id v68 = v36;
        __int16 v69 = 2114;
        v70 = v39;
        BOOL v26 = "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Bailed; this has already been sent "
              "to proactive successfully.";
LABEL_31:
        _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, v26, v67, 0x16u);
      }
    }
    else
    {
      id v25 = PBFLogGallery();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 138543618;
        id v68 = v36;
        __int16 v69 = 2114;
        v70 = v39;
        BOOL v26 = "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Bailed; nothing to send.";
        goto LABEL_31;
      }
    }

    (*(void (**)(void))(*(void *)(*(void *)&v71[8] + 40) + 16))();
    BOOL v8 = 0;
LABEL_33:
    _Block_object_dispose(v71, 8);

    _Block_object_dispose(&buf, 8);
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  id v6 = PBFLogGallery();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive; invalidated",
      (uint8_t *)&buf,
      0xCu);
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 fireCompletionHandlersWithError:v7 didUpdate:0];
  BOOL v8 = 0;
LABEL_36:

  return v8;
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"[%@] _stateLock_executeEnqueuedPushToProactive completion", *(void *)(a1 + 32)];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_2;
  v13[3] = &unk_1E69847A8;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  int v9 = *(void **)(a1 + 64);
  id v16 = v7;
  uint64_t v17 = v8;
  id v18 = v5;
  id v19 = v9;
  id v20 = *(id *)(a1 + 72);
  char v22 = a2;
  long long v12 = *(_OWORD *)(a1 + 80);
  id v10 = (id)v12;
  long long v21 = v12;
  id v11 = v5;
  PBFDispatchAsyncWithString(v6, QOS_CLASS_DEFAULT, v13);
}

uint64_t __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) signal];
  if (result)
  {
    id v3 = PBFLogGallery();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v4;
      __int16 v15 = 2114;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@'; finished",
        (uint8_t *)&v13,
        0x16u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 56) + 24));
    if (!*(void *)(a1 + 64))
    {
      objc_storeStrong((id *)(*(void *)(a1 + 56) + 80), *(id *)(a1 + 72));
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:*(void *)(a1 + 80) copyItems:1];
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(void **)(v7 + 56);
      *(void *)(v7 + 56) = v6;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    id v10 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = 0;

    objc_msgSend(*(id *)(a1 + 56), "_stateLock_flushProactiveUpdateQueue");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 56) + 24));
    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) invalidate];
    uint64_t v11 = *(void *)(*(void *)(a1 + 96) + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    [*(id *)(a1 + 72) fireCompletionHandlersWithError:*(void *)(a1 + 64) didUpdate:*(unsigned __int8 *)(a1 + 104)];
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 88) wantsFetchGalleryLayoutAfterHandlePosterDescriptorsDidChange];
      if (result) {
        return [*(id *)(a1 + 56) enqueueGalleryConfigurationUpdateWithOptions:2 powerLogReason:6 completion:0];
      }
    }
  }
  return result;
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PBFLogGallery();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] \textension '%{public}@'", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_172;
  v9[3] = &unk_1E69847F8;
  id v10 = *(id *)(a1 + 32);
  [v6 enumerateObjectsUsingBlock:v9];
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_172(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PBFLogGallery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 identifier];
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] \t\tdescriptor identifier '%{public}@'", (uint8_t *)&v7, 0x16u);
  }
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_175(void *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PBFLogGallery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Success? %{BOOL}u", (uint8_t *)&v9, 0x1Cu);
  }

  uint64_t v7 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, 1, 0);
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2222, a1[6]);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_176(uint64_t a1)
{
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) == 0)
  {
    id v2 = PBFLogGallery();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_176_cold_1();
    }

    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_dataStoreErrorWithCode:userInfo:", -2221, v3);
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

- (BOOL)_stateLock_isGalleryStale
{
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  stateLock_lastUsefulGalleryConfigurationPersistDate = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v5 = stateLock_lastUsefulGalleryConfigurationPersistDate;
  uint64_t v6 = [v4 date];
  [v6 timeIntervalSinceDate:v5];
  double v8 = v7;

  return v8 >= 14400.0;
}

- (void)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:(unint64_t)a3 powerLogReason:(int64_t)a4 sessionId:(id)a5 completion:(id)a6
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v65 = 0;
    int v14 = [(PBFGalleryController *)self runtimeAssertionProviderWithError:&v65];
    id v13 = v65;
    if (v13)
    {
      uint64_t v15 = PBFLogGallery();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[PBFGalleryController _stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:]();
      }

      if (v11) {
        (*((void (**)(id, void, void, void, id))v11 + 2))(v11, 0, 0, 0, v13);
      }
      goto LABEL_47;
    }
    id v64 = 0;
    id v45 = [(PBFGalleryController *)self galleryLayoutProviderWithError:&v64];
    id v46 = v64;
    if (v46)
    {
      uint64_t v16 = PBFLogGallery();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[PBFGalleryController _stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:]();
      }

      if (v11) {
        (*((void (**)(id, void, void, void, id))v11 + 2))(v11, 0, 0, 0, v46);
      }
      goto LABEL_46;
    }
    id v44 = self->_stateLock_lastUsefulGalleryConfiguration;
    uint64_t v43 = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
    +[PBFPowerLogger logUpdate:3 reason:a4];
    id v42 = objc_opt_new();
    __int16 v41 = objc_opt_new();
    uint64_t v17 = PBFLogGallery();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; begin",
        buf,
        0xCu);
    }

    if ((a3 & 8) == 0) {
      goto LABEL_35;
    }
    if (v43) {
      BOOL v18 = v44 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    char v19 = !v18;
    id v20 = PBFLogGallery();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; Checking if gallery is stale... ",
          buf,
          0xCu);
      }

      char v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v41);
      [v22 timeIntervalSinceDate:v43];
      double v24 = v23;

      id v20 = PBFLogGallery();
      BOOL v25 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v24 < 14400.0)
      {
        if (v25)
        {
          *(_DWORD *)long long buf = 138543874;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v43;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v69 = 0x40CC200000000000;
          _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; gallery was last refreshed at @ %{pub"
            "lic}@, which means it is younger than %f seconds, so we're going to not update.",
            buf,
            0x20u);
        }

        (*((void (**)(id, PRSPosterGalleryLayout *, NSDate *, void, void))v11 + 2))(v11, v44, v43, 0, 0);
        goto LABEL_45;
      }
      if (!v25) {
        goto LABEL_34;
      }
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v43;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v69 = 0x40CC200000000000;
      BOOL v26 = "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; gallery was last refreshed at @ %{pub"
            "lic}@, which means it is OLDER than %f seconds, so we're going to proceed";
      uint64_t v27 = v20;
      uint32_t v28 = 32;
    }
    else
    {
      if (!v21)
      {
LABEL_34:

LABEL_35:
        if (objc_msgSend(MEMORY[0x1E4F1CB18], "pbf_keynoteModeEnabled", v41))
        {
          uint64_t v29 = PBFLogGallery();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v10;
            _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; not querying, just using local (keynote mode)",
              buf,
              0xCu);
          }

          stateLock_lastUsefulGalleryConfigurationPersistDate = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
          uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v72 = *MEMORY[0x1E4F28588];
          v73[0] = @"Keynote mode has been engaged; disabled fetching new gallery configuration.";
          id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
          dispatch_time_t v33 = objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 6, v32);
          (*((void (**)(id, PRSPosterGalleryLayout *, NSDate *, void, void *))v11 + 2))(v11, v44, stateLock_lastUsefulGalleryConfigurationPersistDate, 0, v33);
        }
        else
        {
          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          uint64_t v69 = (uint64_t)__Block_byref_object_copy__17;
          v70 = __Block_byref_object_dispose__17;
          uint64_t v34 = [MEMORY[0x1E4F96478] currentProcess];
          id v71 = [v14 acquirePrewarmRuntimeAssertionForReason:@"Gallery Async Fetch" target:v34 invalidationHandler:0];

          v62[0] = 0;
          v62[1] = v62;
          v62[2] = 0x3032000000;
          v62[3] = __Block_byref_object_copy__164;
          v62[4] = __Block_byref_object_dispose__165;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke;
          aBlock[3] = &unk_1E6984898;
          id v35 = v10;
          id v58 = v35;
          id v36 = v41;
          id v59 = v36;
          id v60 = v11;
          id v61 = buf;
          id v63 = _Block_copy(aBlock);
          id v37 = PBFLogGallery();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v66 = 138543362;
            id v67 = v35;
            _os_log_impl(&dword_1D31CE000, v37, OS_LOG_TYPE_DEFAULT, "(%{public}@)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:; querying",
              v66,
              0xCu);
          }

          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_186;
          v51[3] = &unk_1E6984910;
          id v38 = v35;
          id v52 = v38;
          id v53 = v42;
          uint64_t v54 = self;
          id v55 = v62;
          unint64_t v56 = a3;
          [v45 fetchGalleryLayoutWithCompletion:v51];
          dispatch_time_t v39 = dispatch_time(0, 10000000000);
          id v40 = [MEMORY[0x1E4F924D8] sharedWorkloop];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_194;
          block[3] = &unk_1E6982218;
          id v48 = v36;
          id v49 = v38;
          id v50 = v62;
          dispatch_after(v39, v40, block);

          _Block_object_dispose(v62, 8);
          _Block_object_dispose(buf, 8);
        }
LABEL_45:

LABEL_46:
LABEL_47:

        goto LABEL_48;
      }
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v10;
      BOOL v26 = "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; Checked if gallery is stale... but we"
            " don't have a gallery, so we're going to proceed.";
      uint64_t v27 = v20;
      uint32_t v28 = 12;
    }
    _os_log_impl(&dword_1D31CE000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_34;
  }
  uint64_t v12 = PBFLogGallery();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions; invalidated",
      buf,
      0xCu);
  }

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void, void, id))v11 + 2))(v11, 0, 0, 0, v13);
LABEL_48:
  }
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [NSString stringWithFormat:@"[%@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions completion", *(void *)(a1 + 32)];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2;
  v17[3] = &unk_1E6984870;
  id v18 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v19 = v9;
  id v20 = v10;
  char v24 = a4;
  id v21 = v11;
  id v22 = v13;
  uint64_t v23 = *(void *)(a1 + 56);
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  PBFDispatchAsyncWithString(v12, QOS_CLASS_DEFAULT, v17);
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v2 = *(void *)(a1 + 64);
    if (v2) {
      (*(void (**)(uint64_t, void, void, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 56));
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) invalidate];
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [NSString stringWithFormat:@"[%@] _pushFaceGalleryConfigurationUpdate", *(void *)(a1 + 32)];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_190;
  v13[3] = &unk_1E69848E8;
  id v14 = v6;
  id v15 = *(id *)(a1 + 40);
  id v16 = v5;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v20 = v8;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 56);
  id v18 = v9;
  uint64_t v19 = v10;
  id v11 = v5;
  id v12 = v6;
  PBFDispatchAsyncWithString(v7, QOS_CLASS_DEFAULT, v13);
}

uint64_t __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_190(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 4;
  uint64_t v3 = a1[4];
  uint64_t v4 = PBFLogGallery();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_190_cold_1((uint64_t)a1, v2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; received response '%@'",
      buf,
      0x16u);
  }

  uint64_t v9 = a1[6];
  uint64_t v8 = (void *)a1[7];
  uint64_t v10 = a1[4];
  uint64_t v11 = a1[8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_191;
  v14[3] = &unk_1E69848C0;
  uint64_t v12 = a1[10];
  v14[4] = a1[9];
  return [v8 _pushFaceGalleryConfigurationUpdate:v9 options:v12 fetchError:v10 sessionId:v11 completion:v14];
}

uint64_t __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_194(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) == 0)
  {
    uint64_t v2 = PBFLogGallery();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_194_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
    }

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28588];
    v14[0] = @"Proactive timed out calling fetchFaceGalleryConfigurationWithCompletion:";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v12 = objc_msgSend(v10, "pbf_generalErrorWithCode:userInfo:", 2, v11);
    (*(void (**)(uint64_t, void, void, void, void *))(v9 + 16))(v9, 0, 0, 0, v12);
  }
}

- (void)_pushFaceGalleryConfigurationUpdate:(id)a3 options:(unint64_t)a4 fetchError:(id)a5 sessionId:(id)a6 completion:(id)a7
{
  char v10 = a4;
  v49[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, PRSPosterGalleryLayout *, NSDate *, void, id))a7;
  __int16 v17 = PBFLogGallery();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v13 locale];
    uint64_t v19 = [v18 localeIdentifier];
    *(_DWORD *)long long buf = 138543618;
    id v45 = v15;
    __int16 v46 = 2112;
    *(void *)id v47 = v19;
    _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: received gallery w/ locale %@", buf, 0x16u);
  }
  if (v13)
  {
    unint64_t v20 = v10 & 2;
    id v21 = PBFLogGallery();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      id v45 = v15;
      __int16 v46 = 1024;
      *(_DWORD *)id v47 = v20 >> 1;
      *(_WORD *)&v47[4] = 2114;
      *(void *)&v47[6] = v13;
      _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: should Persist? %{BOOL}u '%{public}@'", buf, 0x1Cu);
    }

    os_unfair_lock_lock(&self->_stateLock);
    int v22 = [(PRSPosterGalleryLayout *)self->_stateLock_lastUsefulGalleryConfiguration isEqual:v13];
    id v23 = v14;
    id v24 = v23;
    id v41 = v15;
    int v40 = v22;
    if (!v20 || v23 || (v22 & 1) != 0)
    {
      uint64_t v27 = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
      BOOL v25 = self->_stateLock_lastUsefulGalleryConfiguration;
      id v38 = PBFLogGallery();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543874;
        id v45 = v41;
        __int16 v46 = 2114;
        *(void *)id v47 = v13;
        *(_WORD *)&v47[8] = 2114;
        *(void *)&v47[10] = v27;
        _os_log_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: received new gallery but not persisting '%{public}@'/%{public}@", buf, 0x20u);
      }
    }
    else
    {
      id v39 = v14;
      BOOL v25 = (PRSPosterGalleryLayout *)v13;
      id v42 = 0;
      id v43 = 0;
      [(PBFGalleryController *)self _stateLock_persistGalleryConfiguration:v25 lastUpdateDate:&v43 sessionId:v15 error:&v42];
      id v26 = v43;
      uint64_t v27 = (NSDate *)v43;
      id v24 = v42;
      uint32_t v28 = PBFLogGallery();
      uint64_t v29 = v28;
      if (v24)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543874;
          id v45 = v41;
          __int16 v46 = 2114;
          *(void *)id v47 = v25;
          *(_WORD *)&v47[8] = 2114;
          *(void *)&v47[10] = v24;
          _os_log_error_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_ERROR, "[%{public}@] _pushFaceGalleryConfigurationUpdate: persisting %{public}@ -- error: %{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543874;
        id v45 = v41;
        __int16 v46 = 2114;
        *(void *)id v47 = v25;
        *(_WORD *)&v47[8] = 2114;
        *(void *)&v47[10] = v27;
        _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] _pushFaceGalleryConfigurationUpdate: persisting %{public}@ -- last update date? %{public}@", buf, 0x20u);
      }

      [(PBFGalleryController *)self _stateLock_notifyGalleryControllerWillUpdateGalleryConfiguration];
      objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfigurationPersistDate, v26);
      objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfiguration, a3);
      [(PBFGalleryController *)self _stateLock_notifyGalleryControllerDidUpdateCurrentGalleryConfiguration:v25];
      id v14 = v39;
    }
    os_unfair_lock_unlock(&self->_stateLock);
    if (v16) {
      v16[2](v16, v25, v27, v40 ^ 1u, v24);
    }

    goto LABEL_25;
  }
  id v30 = PBFLogGallery();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[PBFGalleryController _pushFaceGalleryConfigurationUpdate:options:fetchError:sessionId:completion:]((uint64_t)v15, v30, v31, v32, v33, v34, v35, v36);
  }

  if (v16)
  {
    id v41 = v15;
    id v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F28588];
    v49[0] = @"Nil gallery was rejected.";
    BOOL v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    objc_msgSend(v37, "pbf_generalErrorWithCode:userInfo:", 1, v25);
    uint64_t v27 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, 0, 0, v27);
LABEL_25:

    id v15 = v41;
  }
}

- (BOOL)_stateLock_persistGalleryConfiguration:(id)a3 lastUpdateDate:(id *)a4 sessionId:(id)a5 error:(id *)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  uint64_t v12 = [(PBFGalleryController *)self galleryCacheURL];
  if (!v12)
  {
    if (a6)
    {
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28588];
      v39[0] = @"Gallery cache URL is invalid.  Bailing.";
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      objc_msgSend(v23, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v16 = PBFLogGallery();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController _stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:]((uint64_t)v11, v16, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_19;
  }
  fileManager = self->_fileManager;
  id v14 = PFFileProtectionNoneAttributes();
  id v35 = 0;
  BOOL v15 = [(NSFileManager *)fileManager createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:v14 error:&v35];
  uint64_t v16 = v35;

  if (!v15)
  {
    uint64_t v31 = PBFLogGallery();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController _stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:]();
    }

    if (a6)
    {
      uint64_t v16 = v16;
      LOBYTE(v18) = 0;
      *a6 = v16;
      goto LABEL_23;
    }
LABEL_19:
    LOBYTE(v18) = 0;
    goto LABEL_23;
  }
  __int16 v17 = [[PBFPosterGalleryLayoutPersistence alloc] initWithURL:v12];
  id v33 = 0;
  id v34 = 0;
  BOOL v18 = [(PBFPosterGalleryLayoutPersistence *)v17 saveGalleryLayout:v10 returningPersistenceDate:&v34 error:&v33];
  id v19 = v34;
  id v20 = v33;
  if (a4 && v18) {
    *a4 = v19;
  }
  if (a6) {
    *a6 = v20;
  }
  id v21 = PBFLogGallery();
  int v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[PBFGalleryController _stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:]();
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v37 = v11;
    _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] _stateLock_persistGalleryConfiguration: successfully persisted gallery", buf, 0xCu);
  }

LABEL_23:
  return v18;
}

- (void)_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:(id *)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  uint64_t v6 = [(PBFGalleryController *)self galleryCacheURL];
  if (v6)
  {
    uint64_t v7 = [[PBFPosterGalleryLayoutPersistence alloc] initWithURL:v6];
    id v36 = 0;
    id v37 = 0;
    id v35 = 0;
    uint64_t v8 = [(PBFPosterGalleryLayoutPersistence *)v7 loadNewestUsableGalleryLayoutReturningPersistenceDate:&v37 purgeableGalleryLayoutURLs:&v36 error:&v35];
    id v9 = v37;
    id v28 = v37;
    id v10 = v36;
    id v11 = v35;
    uint64_t v27 = v8;
    objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfiguration, v8);
    objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfigurationPersistDate, v9);
    uint64_t v29 = v7;
    uint64_t v30 = v6;
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      uint64_t v12 = PBFLogGallery();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PBFGalleryController _stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:error:]((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    else
    {
      uint64_t v12 = PBFLogGallery();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate successfully loaded gallery!", buf, 2u);
      }
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v25 = PBFLogReaper();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            uint64_t v39 = v24;
            _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "Cleaning up old gallery configurations: %{public}@", buf, 0xCu);
          }

          uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v26 removeItemAtURL:v24 error:a4];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v21);
    }

    uint64_t v6 = v30;
  }
}

- (void)_stateLock_notifyGalleryControllerWillUpdateGalleryConfiguration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->_stateLock_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "galleryControllerWillUpdateGalleryConfiguration:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_stateLock_notifyGalleryControllerDidUpdateCurrentGalleryConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBFDebug_os_unfair_lock_assert_owner(&self->_stateLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_stateLock_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "galleryController:didUpdateCurrentGalleryConfiguration:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)determineRefreshStateWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 component];
  if ([v5 isEqual:@"PBFDataComponentGallery"])
  {
    stateLock_lastUsefulGalleryConfigurationPersistDate = self->_stateLock_lastUsefulGalleryConfigurationPersistDate;
    if (stateLock_lastUsefulGalleryConfigurationPersistDate)
    {
      uint64_t v7 = stateLock_lastUsefulGalleryConfigurationPersistDate;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    uint64_t v9 = v7;
    stateLock_lastUsefulGalleryConfiguration = self->_stateLock_lastUsefulGalleryConfiguration;
    if (stateLock_lastUsefulGalleryConfiguration)
    {
      long long v11 = stateLock_lastUsefulGalleryConfiguration;
    }
    else
    {
      long long v11 = [MEMORY[0x1E4F1CA98] null];
    }
    long long v12 = v11;
    long long v13 = [PBFDataComponentObjectEntity alloc];
    long long v14 = [PBFDataRefreshContext alloc];
    uint64_t v15 = [v4 now];
    uint64_t v16 = [(PBFDataRefreshContext *)v14 initWithComponent:@"PBFDataComponentGallery" now:v15 lastRefreshDate:v9 userInfo:0];
    uint64_t v17 = [(PBFDataComponentObjectEntity *)v13 initWithComponent:@"PBFDataComponentGallery" object:v12 context:v16];

    uint64_t v8 = [(PBFDataComponentObjectEntity *)v17 determineRefreshState];
  }
  else
  {
    uint64_t v8 = [[PBFDataRefreshState alloc] initWithNeedsRefresh:1 reason:@"Unable to ascertain status; just reload anyway..."];
  }

  return v8;
}

- (NSURL)galleryCacheURL
{
  return self->_galleryCacheURL;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runtimeAssertionProvider);
  return (PBFRuntimeAssertionProviding *)WeakRetained;
}

- (PBFPosterGalleryLayoutProviding)galleryLayoutProvider
{
  return self->_galleryLayoutProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_runtimeAssertionProvider);
  objc_storeStrong((id *)&self->_stateLock_timestampOfLastGalleryPushRequestFromProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_observers, 0);
  objc_storeStrong((id *)&self->_stateLock_activeRefreshGalleryRequest, 0);
  objc_storeStrong((id *)&self->_stateLock_lastSuccessfulPushToProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_activePushToProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_enqueuedPushToProactive, 0);
  objc_storeStrong((id *)&self->_stateLock_lastSentPosterDescriptorsForExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfigurationPersistDate, 0);
  objc_storeStrong((id *)&self->_stateLock_lastUsefulGalleryConfiguration, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_galleryCacheURL, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (void)initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithGalleryCacheURL:galleryLayoutProvider:runtimeAssertionProvider:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __95__PBFGalleryController_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_completion___block_invoke_97_cold_1()
{
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%{public}@] enqueueGalleryConfigurationUpdateWithOptions; update completed.  Error: %{public}@");
}

- (void)updateGallery:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addObserver:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_stateLock_executeEnqueuedPushToProactive:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%{public}@] _stateLock_executeEnqueuedPushToProactive; unable to acquire gallery provider: %{public}@");
}

- (void)_stateLock_executeEnqueuedPushToProactive:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%{public}@] _stateLock_executeEnqueuedPushToProactive; unable to acquire runtime assertion provider: %{public}@");
}

void __66__PBFGalleryController__stateLock_executeEnqueuedPushToProactive___block_invoke_176_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_9_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D31CE000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] _stateLock_executeEnqueuedPushToProactive:'%{public}@' -- Failed; proactive timed out.  Please file a radar.",
    v2,
    0x16u);
}

- (void)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions; unable to acquire gallery provider: %{public}@");
}

- (void)_stateLock_enqueueGalleryConfigurationUpdateWithOptions:powerLogReason:sessionId:completion:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions; unable to acquire runtime assertion provider: %{public}@");
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_190_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, (uint64_t)a2, a3, "[%{public}@] _stateLock_enqueueGalleryConfigurationUpdateWithOptions:; received error '%@'",
    *(void *)v3,
    *(void *)&v3[8],
    *(void *)&v3[16],
    *MEMORY[0x1E4F143B8]);
}

void __116__PBFGalleryController__stateLock_enqueueGalleryConfigurationUpdateWithOptions_powerLogReason_sessionId_completion___block_invoke_2_194_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)_pushFaceGalleryConfigurationUpdate:(uint64_t)a3 options:(uint64_t)a4 fetchError:(uint64_t)a5 sessionId:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_stateLock_persistGalleryConfiguration:(uint64_t)a3 lastUpdateDate:(uint64_t)a4 sessionId:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_stateLock_persistGalleryConfiguration:lastUpdateDate:sessionId:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%{public}@] _stateLock_persistGalleryConfiguration: gallery cache directory could not be created -- error: %{public}@");
}

- (void)_stateLock_loadPersistedGalleryConfigurationWithLastUpdateDate:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end