@interface PXSystemAuthenticationTypeObserver
+ (PXSystemAuthenticationTypeObserver)sharedObserver;
- (NSMutableSet)observers;
- (OS_dispatch_queue)observationQueue;
- (PXSystemAuthenticationTypeObserver)init;
- (int64_t)_calculateAuthenticationType;
- (int64_t)_currentlyAvailableBiometryType;
- (int64_t)authenticationType;
- (int64_t)forcedSystemAuthenticationType;
- (void)_beginObservingApplicationStateChangesAndSystemEvents;
- (void)_stopObservingApplicationStateChanges;
- (void)_updateAuthenticationTypeInBackground;
- (void)dealloc;
- (void)setAuthenticationType:(int64_t)a3;
- (void)setForcedSystemAuthenticationType:(int64_t)a3;
- (void)setObservers:(id)a3;
- (void)updateAuthenticationTypeImmediately;
@end

@implementation PXSystemAuthenticationTypeObserver

- (int64_t)authenticationType
{
  return self->_authenticationType;
}

+ (PXSystemAuthenticationTypeObserver)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_55894);
  }
  v2 = (void *)sharedObserver_sharedInstance;
  return (PXSystemAuthenticationTypeObserver *)v2;
}

void __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke(uint64_t a1)
{
  v2 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Performing authentication type update in background", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) _calculateAuthenticationType];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_9;
  v4[3] = &unk_1E5DD08D8;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

- (int64_t)_calculateAuthenticationType
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculating authentication type", buf, 2u);
  }

  if ([(PXSystemAuthenticationTypeObserver *)self forcedSystemAuthenticationType])
  {
    v4 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = PXDebugDescriptionFromSystemAuthenticationType([(PXSystemAuthenticationTypeObserver *)self forcedSystemAuthenticationType]);
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Using forced authentication type: %@", buf, 0xCu);
    }
    return [(PXSystemAuthenticationTypeObserver *)self forcedSystemAuthenticationType];
  }
  v7 = [MEMORY[0x1E4F1C9C8] now];
  v8 = PLContentPrivacyUIGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CalculateAuthenticationType", "", buf, 2u);
  }

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v12 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculating authentication type on main thread", buf, 2u);
    }
  }
  int64_t v13 = [(PXSystemAuthenticationTypeObserver *)self _currentlyAvailableBiometryType];
  unint64_t v6 = 3;
  switch(v13)
  {
    case 0:
      id v14 = objc_alloc_init(MEMORY[0x1E4F30B50]);
      id v32 = 0;
      char v15 = [v14 canEvaluatePolicy:2 error:&v32];
      id v16 = v32;
      v17 = [v16 domain];
      if ([v17 isEqualToString:*MEMORY[0x1E4F30B38]])
      {
        uint64_t v18 = [v16 code];

        if (v18 == -5) {
          char v19 = v15;
        }
        else {
          char v19 = 1;
        }
        if ((v19 & 1) == 0)
        {
          v20 = PLContentPrivacyUIGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v16;
            _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Passcode/password not available or error encountered while trying to determine. Error: %@", buf, 0xCu);
          }
          uint64_t v21 = 1;
          goto LABEL_32;
        }
      }
      else
      {
      }
      if (v15)
      {
        uint64_t v21 = 2;
        goto LABEL_33;
      }
      v20 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v16;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "[SystemAuthenticationObserver] Error while attempting to determine whether a passcode/password is set: %@", buf, 0xCu);
      }
      uint64_t v21 = 2;
LABEL_32:

LABEL_33:
      id v22 = objc_alloc_init(MEMORY[0x1E4F30B50]);
      int v23 = [v22 canEvaluatePolicy:3 error:0];

      if (v23) {
        unint64_t v6 = 6;
      }
      else {
        unint64_t v6 = v21;
      }
      goto LABEL_36;
    case 1:
      goto LABEL_36;
    case 2:
      unint64_t v6 = 4;
      goto LABEL_36;
    case 4:
      unint64_t v6 = 5;
      goto LABEL_36;
    default:
      unint64_t v6 = 2;
LABEL_36:
      v24 = v11;
      v25 = v24;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_END, v9, "CalculateAuthenticationType", "", buf, 2u);
      }

      v26 = [MEMORY[0x1E4F1C9C8] now];
      [v26 timeIntervalSinceDate:v7];
      uint64_t v28 = v27;

      v29 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = PXDebugDescriptionFromSystemAuthenticationType(v6);
        *(_DWORD *)buf = 138412546;
        id v34 = v30;
        __int16 v35 = 2048;
        uint64_t v36 = v28;
        _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculated authentication type as %@, took %.1fs", buf, 0x16u);
      }
      return v6;
  }
}

- (int64_t)forcedSystemAuthenticationType
{
  return self->_forcedSystemAuthenticationType;
}

- (int64_t)_currentlyAvailableBiometryType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  id v10 = 0;
  int v3 = [v2 canEvaluatePolicy:1 error:&v10];
  id v4 = v10;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    int64_t v8 = [v2 biometryType];
  }
  else
  {
    v7 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "[SystemAuthenticationObserver] Biometrics not available for auth. Error: %@", buf, 0xCu);
    }

    int64_t v8 = 0;
  }

  return v8;
}

uint64_t __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAuthenticationType:*(void *)(a1 + 32)];
}

uint64_t __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_9(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke_2;
  v3[3] = &__block_descriptor_40_e87_v16__0__PXSystemAuthenticationTypeObserver_PXMutableSystemAuthenticationTypeObserver__8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 performChanges:v3];
}

void __52__PXSystemAuthenticationTypeObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(PXSystemAuthenticationTypeObserver);
  v1 = (void *)sharedObserver_sharedInstance;
  sharedObserver_sharedInstance = (uint64_t)v0;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)observationQueue
{
  return self->_observationQueue;
}

- (PXSystemAuthenticationTypeObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXSystemAuthenticationTypeObserver;
  id v2 = [(PXSystemAuthenticationTypeObserver *)&v9 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.authenticationtype-observer", v3);
    observationQueue = v2->_observationQueue;
    v2->_observationQueue = (OS_dispatch_queue *)v4;

    v2->_authenticationType = 0;
    [(PXSystemAuthenticationTypeObserver *)v2 _updateAuthenticationTypeInBackground];
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v6;

    [(PXSystemAuthenticationTypeObserver *)v2 _beginObservingApplicationStateChangesAndSystemEvents];
  }
  return v2;
}

- (void)_updateAuthenticationTypeInBackground
{
  int v3 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Scheduling async authentication type update", buf, 2u);
  }

  dispatch_queue_t v4 = [(PXSystemAuthenticationTypeObserver *)self observationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PXSystemAuthenticationTypeObserver__updateAuthenticationTypeInBackground__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_beginObservingApplicationStateChangesAndSystemEvents
{
  objc_initWeak(&location, self);
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  dispatch_queue_t v4 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v5 = *MEMORY[0x1E4FB2EB0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __91__PXSystemAuthenticationTypeObserver__beginObservingApplicationStateChangesAndSystemEvents__block_invoke;
  v11 = &unk_1E5DCFD58;
  objc_copyWeak(&v12, &location);
  uint64_t v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:&v8];

  v7 = [(PXSystemAuthenticationTypeObserver *)self observers];
  [v7 addObject:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
}

- (void)setObservers:(id)a3
{
}

- (void)_stopObservingApplicationStateChanges
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v3 = [(PXSystemAuthenticationTypeObserver *)self observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v9 removeObserver:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v10 = [(PXSystemAuthenticationTypeObserver *)self observers];
  [v10 removeAllObjects];
}

void __91__PXSystemAuthenticationTypeObserver__beginObservingApplicationStateChangesAndSystemEvents__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAuthenticationTypeInBackground];
}

- (void)setForcedSystemAuthenticationType:(int64_t)a3
{
  if (self->_forcedSystemAuthenticationType != a3)
  {
    self->_forcedSystemAuthenticationType = a3;
    [(PXSystemAuthenticationTypeObserver *)self updateAuthenticationTypeImmediately];
  }
}

- (void)setAuthenticationType:(int64_t)a3
{
  if (self->_authenticationType != a3)
  {
    self->_authenticationType = a3;
    [(PXSystemAuthenticationTypeObserver *)self signalChange:1];
  }
}

- (void)updateAuthenticationTypeImmediately
{
  int64_t v3 = [(PXSystemAuthenticationTypeObserver *)self authenticationType];
  int64_t v4 = [(PXSystemAuthenticationTypeObserver *)self _calculateAuthenticationType];
  if (v3 != v4)
  {
    int64_t v5 = v4;
    uint64_t v6 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] Calculating authentication type on demand changed the authentication type", buf, 2u);
    }

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__PXSystemAuthenticationTypeObserver_updateAuthenticationTypeImmediately__block_invoke;
    v7[3] = &__block_descriptor_40_e87_v16__0__PXSystemAuthenticationTypeObserver_PXMutableSystemAuthenticationTypeObserver__8l;
    v7[4] = v5;
    [(PXSystemAuthenticationTypeObserver *)self performChanges:v7];
  }
}

uint64_t __73__PXSystemAuthenticationTypeObserver_updateAuthenticationTypeImmediately__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAuthenticationType:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  int64_t v3 = PLContentPrivacyUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[SystemAuthenticationObserver] PXSystemAuthenticationTypeObserver dealloc", buf, 2u);
  }

  [(PXSystemAuthenticationTypeObserver *)self _stopObservingApplicationStateChanges];
  v4.receiver = self;
  v4.super_class = (Class)PXSystemAuthenticationTypeObserver;
  [(PXSystemAuthenticationTypeObserver *)&v4 dealloc];
}

@end