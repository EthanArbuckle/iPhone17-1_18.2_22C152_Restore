@interface PLPrivacy
+ (id)_logDictionaryFromPhotosPickerClientLogFile:(id)a3;
+ (id)sharedInstance;
- (BOOL)hasHandledLimitedLibraryReprompt;
- (BOOL)isLimitedLibrarySupported;
- (PLPrivacy)init;
- (id)photosPickerPresentedLibraryLogForClient:(id)a3;
- (id)photosPickerPresentedLibraryLogsByClient;
- (int64_t)_authStatusForScope:(int64_t)a3;
- (int64_t)_resolvePreflightStatusForScope:(int64_t)a3;
- (int64_t)checkPhotosAccessAllowedWithScope:(int64_t)a3;
- (int64_t)photosAccessAllowedWithScope:(int64_t)a3;
- (int64_t)photosAccessAllowedWithScope:(int64_t)a3 auditToken:(id *)a4 clientAuthorization:(id)a5;
- (void)_checkAuthStatusForPhotosAccessScope:(int64_t)a3 preflightStatus:(int64_t)a4 promptIfUnknown:(BOOL)a5 resultHandler:(id)a6;
- (void)_isPhotosAccessAllowedWithScope:(int64_t)a3 promptIfUnknown:(BOOL)a4 synchronous:(BOOL)a5 resultHandler:(id)a6;
- (void)_setAuthStatus:(int64_t)a3 scope:(int64_t)a4;
- (void)checkPhotosAccessAllowedWithScope:(int64_t)a3 handler:(id)a4;
- (void)logPhotosAccessWithClientAuthorization:(id)a3;
- (void)logPhotosAccessWithPhotoPickerClientIdentification:(id)a3;
- (void)logPhotosAccessWithSelfAuditToken;
- (void)logPhotosPickerPresentedLibraryForClient:(id)a3 usingOptions:(int64_t)a4;
- (void)presentAsyncPromptForLimitedLibraryPickerIfNeeded;
- (void)reportPhotosUseWithClientAuthorization:(id)a3;
- (void)requestLimitedLibraryPromptForApplicationIdentifier:(id)a3;
- (void)setHasHandledLimitedLibraryReprompt:(BOOL)a3;
- (void)setLimitedLibrarySupported:(BOOL)a3;
@end

@implementation PLPrivacy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7647);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (void)logPhotosAccessWithSelfAuditToken
{
  kern_return_t v3;
  mach_error_t v4;
  NSObject *v5;
  char *v6;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v9;
  unsigned char buf[32];
  uint64_t v11;

  v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *(_OWORD *)task_info_out = v2;
  v9 = v2;
  task_info_outCnt = 8;
  v3 = task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt);
  if (v3)
  {
    v4 = v3;
    v5 = PLPrivacyGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = mach_error_string(v4);
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "logPhotosAccessWithSelfToken: create self token failed: %{public}s (0x%x)", buf, 0x12u);
    }
  }
  else
  {
    *(_OWORD *)buf = *(_OWORD *)task_info_out;
    *(_OWORD *)&buf[16] = v9;
    PLPrivacyAccountingLogPhotosAccess(buf);
  }
}

- (int64_t)photosAccessAllowedWithScope:(int64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PLPrivacy_photosAccessAllowedWithScope___block_invoke;
  v5[3] = &unk_1E58A1DB0;
  v5[4] = &v6;
  [(PLPrivacy *)self _isPhotosAccessAllowedWithScope:a3 promptIfUnknown:0 synchronous:1 resultHandler:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_isPhotosAccessAllowedWithScope:(int64_t)a3 promptIfUnknown:(BOOL)a4 synchronous:(BOOL)a5 resultHandler:(id)a6
{
  id v10 = a6;
  isolationQueue = self->_isolationQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke;
  v13[3] = &unk_1E58A0F08;
  id v14 = v10;
  int64_t v15 = a3;
  BOOL v16 = a5;
  BOOL v17 = a4;
  v13[4] = self;
  id v12 = v10;
  dispatch_sync(isolationQueue, v13);
}

void __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v16 = [*(id *)(a1 + 32) _resolvePreflightStatusForScope:*(void *)(a1 + 48)];
  long long v2 = PLPrivacyGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int64_t v3 = PLStringFromPhotosAccessScope(*(void *)(a1 + 48));
    uint64_t v4 = v14[3];
    *(_DWORD *)buf = 138543618;
    v18 = v3;
    __int16 v19 = 1024;
    int v20 = v4;
    _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_DEBUG, "_isPhotosAccessAllowedWithScope:%{public}@ resolved preflight status as %d", buf, 0x12u);
  }
  v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    [v5 _checkAuthStatusForPhotosAccessScope:*(void *)(a1 + 48) preflightStatus:v14[3] promptIfUnknown:*(unsigned __int8 *)(a1 + 57) resultHandler:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = v5[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke_67;
    block[3] = &unk_1E58A0EE0;
    id v10 = &v13;
    block[4] = v5;
    v7 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    char v12 = *(unsigned char *)(a1 + 57);
    id v9 = v7;
    dispatch_async(v6, block);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)_checkAuthStatusForPhotosAccessScope:(int64_t)a3 preflightStatus:(int64_t)a4 promptIfUnknown:(BOOL)a5 resultHandler:(id)a6
{
  BOOL v6 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  uint64_t v11 = (void (**)(void, void))v10;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int64_t v36 = a4;
  if (!a4)
  {
    BOOL v13 = TCCAccessRestricted() != 0;
    goto LABEL_19;
  }
  if (a4 != 1)
  {
    if (!v10) {
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  int v12 = TCCAccessRestricted();
  BOOL v13 = v12 != 0;
  if (!v6 || v12)
  {
LABEL_19:
    if (!v11) {
      goto LABEL_29;
    }
    if (v13)
    {
      uint64_t v21 = 3;
LABEL_28:
      v11[2](v11, v21);
      goto LABEL_29;
    }
LABEL_23:
    unint64_t v22 = v34[3];
    if (v22 > 4)
    {
      uint64_t v21 = 1;
    }
    else
    {
      v23 = &unk_19BDC73C8;
      if (a3 > 1) {
        v23 = &unk_19BDC73A0;
      }
      uint64_t v21 = v23[v22];
    }
    goto LABEL_28;
  }
  int64_t v14 = a3;
  if (a3 == 1)
  {
    if (PLHasPhotoLibraryAddUsageDescription_onceToken != -1) {
      dispatch_once(&PLHasPhotoLibraryAddUsageDescription_onceToken, &__block_literal_global_179_3919);
    }
    if (PLHasPhotoLibraryAddUsageDescription_hasUsageDescription) {
      goto LABEL_9;
    }
    if (PLHasPhotoLibraryUsageDescription_onceToken != -1) {
      dispatch_once(&PLHasPhotoLibraryUsageDescription_onceToken, &__block_literal_global_184_3924);
    }
    if (!PLHasPhotoLibraryUsageDescription_hasUsageDescription || TCCAccessRestricted())
    {
LABEL_9:
      int64_t v14 = 1;
    }
    else
    {
      v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19BCFB000, v24, OS_LOG_TYPE_DEFAULT, "Missing NSPhotoLibraryAddUsageDescription, will try photos access instead of add-only", (uint8_t *)&buf, 2u);
      }

      int64_t v14 = 7;
    }
  }
  uint64_t v15 = PLPrivacyGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = PLStringFromPhotosAccessScope(v14);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_DEFAULT, "TCCAccessRequest %{public}@", (uint8_t *)&buf, 0xCu);
  }
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __96__PLPrivacy__checkAuthStatusForPhotosAccessScope_preflightStatus_promptIfUnknown_resultHandler___block_invoke;
  v28 = &unk_1E58A0EB8;
  v29 = self;
  v31 = &v33;
  int64_t v32 = a3;
  v18 = v17;
  v30 = v18;
  __int16 v19 = &v25;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v38 = __PLTCCAuthorizationRequest_block_invoke;
  v39 = &unk_1E58A0F78;
  v40 = v19;
  int v20 = v19;
  tcc_authorization_request();

  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (v11)
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    if (a3 >= 2 && !PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0 && v34[3] == 3)
    {
      -[PLPrivacy setHasHandledLimitedLibraryReprompt:](self, "setHasHandledLimitedLibraryReprompt:", 1, v25, v26, v27, v28, v29);
      PLPresentLimitedLibraryPicker(1);
    }
    goto LABEL_23;
  }
LABEL_29:
  _Block_object_dispose(&v33, 8);
}

uint64_t __42__PLPrivacy_photosAccessAllowedWithScope___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)_resolvePreflightStatusForScope:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  int64_t v5 = [(PLPrivacy *)self _authStatusForScope:a3];
  if (v5 == 1)
  {
    unint64_t v6 = tcc_authorization_preflight();
    if (v6 >= 5) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = v6;
    }
  }
  if (a3 != 1 || v5 == 2)
  {
    v7 = self;
    uint64_t v8 = v5;
    int64_t v9 = a3;
  }
  else if (tcc_authorization_preflight() == 2)
  {
    int64_t v5 = 2;
    v7 = self;
    uint64_t v8 = 2;
    int64_t v9 = 7;
  }
  else
  {
    v7 = self;
    uint64_t v8 = v5;
    int64_t v9 = 1;
  }
  [(PLPrivacy *)v7 _setAuthStatus:v8 scope:v9];
  return v5;
}

- (void)_setAuthStatus:(int64_t)a3 scope:(int64_t)a4
{
  p_cachedClientAuthLock = &self->_cachedClientAuthLock;
  os_unfair_lock_lock(&self->_cachedClientAuthLock);
  if (a4 == 1 || (self->_cachedClientAuthRightFullAccess = a3, a3 == 2)) {
    self->_cachedClientAuthRightAddOnly = a3;
  }
  os_unfair_lock_unlock(p_cachedClientAuthLock);
}

- (int64_t)_authStatusForScope:(int64_t)a3
{
  p_cachedClientAuthLock = &self->_cachedClientAuthLock;
  os_unfair_lock_lock(&self->_cachedClientAuthLock);
  int64_t cachedClientAuthRightFullAccess = self->_cachedClientAuthRightFullAccess;
  if (a3 == 1 && (unint64_t)(cachedClientAuthRightFullAccess - 2) >= 3) {
    int64_t cachedClientAuthRightFullAccess = self->_cachedClientAuthRightAddOnly;
  }
  os_unfair_lock_unlock(p_cachedClientAuthLock);
  return cachedClientAuthRightFullAccess;
}

- (int64_t)photosAccessAllowedWithScope:(int64_t)a3 auditToken:(id *)a4 clientAuthorization:(id)a5
{
  unint64_t v6 = tcc_authorization_check_audit_token();
  if (v6 >= 5) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = &unk_19BDC73A0;
  if (a3 <= 1) {
    uint64_t v8 = qword_19BDC73C8;
  }
  int64_t result = v8[v7];
  if (a3 == 1)
  {
    if ((result & 3) != 0)
    {
      unint64_t v10 = tcc_authorization_check_audit_token();
      if (v10 >= 5) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      if ((unint64_t)(v11 - 2) < 3) {
        uint64_t v11 = 4;
      }
      return qword_19BDC73C8[v11];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __27__PLPrivacy_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (PLPrivacy)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLPrivacy;
  long long v2 = [(PLPrivacy *)&v10 init];
  if (v2)
  {
    int64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.accessIsolation", v3);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v4;

    unint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photos.accessCallbacks", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v2->_cachedClientAuthLock._os_unfair_lock_opaque = 0;
    *(int64x2_t *)&v2->_int64_t cachedClientAuthRightFullAccess = vdupq_n_s64(1uLL);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacySupportClient, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (void)setLimitedLibrarySupported:(BOOL)a3
{
  self->_limitedLibrarySupported = a3;
}

- (BOOL)isLimitedLibrarySupported
{
  return self->_limitedLibrarySupported;
}

- (void)setHasHandledLimitedLibraryReprompt:(BOOL)a3
{
  self->_hasHandledLimitedLibraryReprompt = a3;
}

- (BOOL)hasHandledLimitedLibraryReprompt
{
  return self->_hasHandledLimitedLibraryReprompt;
}

- (id)photosPickerPresentedLibraryLogForClient:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    dispatch_queue_t v4 = +[PLPhotoLibraryPathManager systemLibraryPathManager];
    int64_t v5 = [v4 privateCacheDirectoryWithSubType:14];

    if (v5)
    {
      unint64_t v6 = [v5 stringByAppendingPathComponent:v3];
      dispatch_queue_t v7 = [(id)objc_opt_class() _logDictionaryFromPhotosPickerClientLogFile:v6];
    }
    else
    {
      objc_super v10 = PLPrivacyGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Failed to get photos picker client log directory", (uint8_t *)&v12, 2u);
      }

      dispatch_queue_t v7 = 0;
    }
    uint64_t v8 = v7;

    int64_t v9 = v8;
  }
  else
  {
    uint64_t v8 = PLPrivacyGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v3;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Failed to access photos picker client log for client with invalid bundle identifier: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    int64_t v9 = 0;
  }

  return v9;
}

- (id)photosPickerPresentedLibraryLogsByClient
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[PLPhotoLibraryPathManager systemLibraryPathManager];
  dispatch_queue_t v4 = [v3 privateCacheDirectoryWithSubType:14];

  if (v4)
  {
    int64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    unint64_t v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v21];
    dispatch_queue_t v7 = v21;

    if (v6)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v16 = v6;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v17 + 1) + 8 * i)];
            uint64_t v14 = [(id)objc_opt_class() _logDictionaryFromPhotosPickerClientLogFile:v13];
            if (v14) {
              [v2 addObject:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v26 count:16];
        }
        while (v10);
        unint64_t v6 = v16;
      }
    }
    else
    {
      if (PLIsErrorFileNotFound(v7)) {
        goto LABEL_14;
      }
      uint64_t v8 = PLPrivacyGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        v23 = v4;
        __int16 v24 = 2114;
        uint64_t v25 = v7;
        _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Failed to read contents of picker client log directory %{public}@: %{public}@", buf, 0x16u);
      }
    }

LABEL_14:
    goto LABEL_17;
  }
  dispatch_queue_t v7 = PLPrivacyGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Failed to get photos picker client log directory", buf, 2u);
  }
LABEL_17:

  return v2;
}

- (void)logPhotosPickerPresentedLibraryForClient:(id)a3 usingOptions:(int64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int64_t v5 = (__CFString *)a3;
  if ([(__CFString *)v5 length])
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    dispatch_queue_t v7 = PLPhotosPickerLogDateFormatter();
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [v7 stringFromDate:v8];

    [v6 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];
    [v6 setObject:v9 forKeyedSubscript:@"timestamp"];
    if (a4 == 1)
    {
      uint64_t v10 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      if (a4 != 2)
      {
LABEL_9:
        uint64_t v11 = +[PLPhotoLibraryPathManager systemLibraryPathManager];
        id v29 = 0;
        int v12 = [v11 privateCacheDirectoryWithSubType:14 createIfNeeded:1 error:&v29];
        id v13 = v29;
        uint64_t v14 = v13;
        if (v12)
        {
          __int16 v24 = v13;
          uint64_t v15 = [v12 stringByAppendingPathComponent:v5];
          uint64_t v16 = [(id)objc_opt_class() _logDictionaryFromPhotosPickerClientLogFile:v15];
          if (v16) {
            [v6 addEntriesFromDictionary:v16];
          }
          uint64_t v25 = v9;
          uint64_t v26 = v7;
          long long v17 = PLPrivacyGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543618;
            v31 = v5;
            __int16 v32 = 2114;
            uint64_t v33 = v6;
            _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_DEFAULT, "Logging photos picker presented library for client %{public}@: %{public}@", buf, 0x16u);
          }

          id v28 = 0;
          long long v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:&v28];
          id v27 = v28;
          id v19 = v28;
          char v20 = [v18 writeToFile:v15 options:1073741825 error:&v27];
          id v21 = v27;

          if ((v20 & 1) == 0)
          {
            unint64_t v22 = PLPrivacyGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = @"write";
              *(_DWORD *)long long buf = 138544130;
              if (!v18) {
                v23 = @"encode";
              }
              v31 = v23;
              __int16 v32 = 2114;
              uint64_t v33 = v6;
              __int16 v34 = 2114;
              uint64_t v35 = v15;
              __int16 v36 = 2112;
              id v37 = v21;
              _os_log_impl(&dword_19BCFB000, v22, OS_LOG_TYPE_ERROR, "Failed to %{public}@ photos picker client log %{public}@ to %{public}@: %@", buf, 0x2Au);
            }
          }
          uint64_t v9 = v25;
          dispatch_queue_t v7 = v26;
          uint64_t v14 = v24;
        }
        else
        {
          uint64_t v15 = PLPrivacyGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543618;
            v31 = v5;
            __int16 v32 = 2112;
            uint64_t v33 = v14;
            _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, "Failed to create photos picker client log directory for client %{public}@: %@", buf, 0x16u);
          }
        }

        goto LABEL_24;
      }
      uint64_t v10 = MEMORY[0x1E4F1CC28];
    }
    [v6 setObject:v10 forKeyedSubscript:@"pickerUsesOptions"];
    goto LABEL_9;
  }
  unint64_t v6 = PLPrivacyGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    v31 = v5;
    _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Failed to create photos picker client log for client with empty bundle identifier: %{public}@", buf, 0xCu);
  }
LABEL_24:
}

- (void)logPhotosAccessWithPhotoPickerClientIdentification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  dispatch_queue_t v4 = PLPrivacyGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = [v3 trustedCallerBundleID];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = (int)[v3 clientProcessIdentifier];
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEFAULT, "Logging client %{public}@ (pid: %ld) access to photos via picker", buf, 0x16u);
  }
  memset(buf, 0, 32);
  if (v3) {
    [v3 clientAuditToken];
  }
  v9[0] = *(_OWORD *)buf;
  v9[1] = *(_OWORD *)&buf[16];
  unint64_t v6 = [MEMORY[0x1E4F934E0] applicationWithAuditToken:v9];
  dispatch_queue_t v7 = [MEMORY[0x1E4F934F8] accessWithAccessor:v6 forType:1];
  uint64_t v8 = [MEMORY[0x1E4F934D0] sharedInstance];
  [v8 log:v7];
}

- (void)logPhotosAccessWithClientAuthorization:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isClientAuthorizedForTCCServicePhotos])
  {
    dispatch_queue_t v4 = PLPrivacyGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v5 = [v3 trustedCallerBundleID];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = (int)[v3 clientProcessIdentifier];
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = @"read-write";
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEFAULT, "Logging client %{public}@ (pid: %ld) access to photos (%{public}@)", buf, 0x20u);
    }
    memset(buf, 0, 32);
    if (v3) {
      [v3 clientAuditToken];
    }
    v6[0] = *(_OWORD *)buf;
    v6[1] = *(_OWORD *)&buf[16];
    PLPrivacyAccountingLogPhotosAccess(v6);
  }
  else
  {
    [v3 isClientAuthorizedForTCCServicePhotosAdd];
  }
}

- (void)reportPhotosUseWithClientAuthorization:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isClientAuthorizedForTCCServicePhotos])
  {
    dispatch_queue_t v4 = (uint64_t *)MEMORY[0x1E4FA9AE0];
  }
  else
  {
    if (![v3 isClientAuthorizedForTCCServicePhotosAdd]) {
      goto LABEL_15;
    }
    dispatch_queue_t v4 = (uint64_t *)MEMORY[0x1E4FA9AE8];
  }
  uint64_t v5 = *v4;
  if (TCCLibraryCore() && gettcc_authorization_audit_token_report_useSymbolLoc())
  {
    unint64_t v6 = PLPrivacyGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      dispatch_queue_t v7 = [v3 trustedCallerBundleID];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = (int)[v3 clientProcessIdentifier];
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEBUG, "Reporting client %{public}@ (pid: %ld) use of photos service %{public}@", buf, 0x20u);
    }
    memset(buf, 0, 32);
    if (v3) {
      [v3 clientAuditToken];
    }
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__PLPrivacy_reportPhotosUseWithClientAuthorization___block_invoke;
    v11[3] = &unk_1E58A0F50;
    uint64_t v13 = v5;
    long long v14 = *(_OWORD *)buf;
    long long v15 = *(_OWORD *)&buf[16];
    id v12 = v3;
    dispatch_async(v8, v11);
  }
  else
  {
    uint64_t v9 = PLPrivacyGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v3 trustedCallerBundleID];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = (int)[v3 clientProcessIdentifier];
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v5;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "Unable to report client %{public}@ (pid: %ld) use of photos service %{public}@", buf, 0x20u);
    }
  }
LABEL_15:
}

void __52__PLPrivacy_reportPhotosUseWithClientAuthorization___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 48);
  long long v16 = v3;
  dispatch_queue_t v4 = (uint64_t (*)(uint64_t, unsigned char *, void))gettcc_authorization_audit_token_report_useSymbolLoc();
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool pl_tcc_authorization_audit_token_report_use(CFStringRef _Nonnull, audit_token_t, CFDictionaryRef _Nullable)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PLPrivacy.m", 32, @"%s", dlerror());

    __break(1u);
  }
  *(_OWORD *)long long buf = v15;
  *(_OWORD *)&buf[16] = v16;
  int v5 = v4(v2, buf, 0);
  unint64_t v6 = PLPrivacyGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v7 = [*(id *)(a1 + 32) trustedCallerBundleID];
    int v8 = [*(id *)(a1 + 32) clientProcessIdentifier];
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138544130;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v9;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEFAULT, "Reported client %{public}@ (pid: %ld) use of photos service %{public}@ (rv=%d)", buf, 0x26u);
  }
}

- (void)requestLimitedLibraryPromptForApplicationIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLPrivacy.m", 711, @"Invalid parameter not satisfying: %@", @"applicationIdentifier" object file lineNumber description];
  }
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PLPrivacy.m" lineNumber:712 description:@"requestLimitedLibraryPromptForApplicationIdentifier: can only be called within assetsd"];
  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PLPrivacy_requestLimitedLibraryPromptForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E58A1EC0;
  id v11 = v5;
  id v7 = v5;
  dispatch_sync(isolationQueue, block);
}

void __65__PLPrivacy_requestLimitedLibraryPromptForApplicationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v2 dictionaryForKey:@"PLLimitedLibraryApplicationEntries"];

  if (v6)
  {
    long long v3 = (void *)[v6 mutableCopy];
  }
  else
  {
    long long v3 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  dispatch_queue_t v4 = v3;
  [v3 setObject:@"ForcePrompt" forKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v5 setObject:v4 forKey:@"PLLimitedLibraryApplicationEntries"];
}

- (void)presentAsyncPromptForLimitedLibraryPickerIfNeeded
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  BOOL v8 = 0;
  BOOL v8 = [(PLPrivacy *)self hasHandledLimitedLibraryReprompt];
  if (!*((unsigned char *)v6 + 24))
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
    {
      long long v3 = dispatch_get_global_queue(0, 0);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke;
      v4[3] = &unk_1E58A1F28;
      v4[4] = self;
      v4[5] = &v5;
      dispatch_async(v3, v4);
    }
  }
  _Block_object_dispose(&v5, 8);
}

void __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke(uint64_t a1)
{
  if (PLShouldPreventAutomaticLimitedAccessAlert_onceToken != -1) {
    dispatch_once(&PLShouldPreventAutomaticLimitedAccessAlert_onceToken, &__block_literal_global_162_3900);
  }
  if (PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert)
  {
    [*(id *)(a1 + 32) setHasHandledLimitedLibraryReprompt:1];
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_10;
  }
  if ((PLIsClientApplicationStateReadyForLimitedLibraryPickerReprompt() & 1) == 0)
  {
    uint64_t v2 = PLPrivacyGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_DEFAULT, "Application state is not ready for limited library picker re-prompt", buf, 2u);
    }

    goto LABEL_9;
  }
LABEL_10:
  uint64_t v3 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(*(void *)(v3 + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke_68;
    v12[3] = &unk_1E58A1F28;
    v12[4] = v4;
    v12[5] = v3;
    dispatch_sync(v5, v12);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (*(void *)(*(void *)(a1 + 32) + 48)) {
        goto LABEL_14;
      }
      id v6 = objc_alloc_init(PLNonBindingAssetsdClient);
      uint64_t v7 = [(PLNonBindingAssetsdClient *)v6 privacySupportClient];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 48);
      *(void *)(v8 + 48) = v7;

      if (*(void *)(*(void *)(a1 + 32) + 48))
      {
LABEL_14:
        uint64_t v10 = PLPrivacyGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "Presenting limited library picker re-prompt", buf, 2u);
        }

        [*(id *)(*(void *)(a1 + 32) + 48) presentLimitedLibraryPickerRepromptWithCompletionHandler:&__block_literal_global_73_7620];
      }
      else
      {
        id v11 = PLPrivacyGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "Failed to message privacy support client to reprompt alert", buf, 2u);
        }
      }
    }
  }
}

uint64_t __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke_68(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasHandledLimitedLibraryReprompt];
  if ((result & 1) != 0 || (uint64_t result = [*(id *)(a1 + 32) _authStatusForScope:7], result != 3))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 setHasHandledLimitedLibraryReprompt:1];
  }
  return result;
}

void __62__PLPrivacy_presentAsyncPromptForLimitedLibraryPickerIfNeeded__block_invoke_70(uint64_t a1, int a2)
{
  if (a2)
  {
    PLPresentLimitedLibraryPicker(0);
  }
  else
  {
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    uint64_t v4 = PLPrivacyGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEBUG, "Skipping limited library picker, will keep current selection", v5, 2u);
    }
  }
}

- (int64_t)checkPhotosAccessAllowedWithScope:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PLPrivacy_checkPhotosAccessAllowedWithScope___block_invoke;
  v5[3] = &unk_1E58A1DB0;
  v5[4] = &v6;
  [(PLPrivacy *)self _isPhotosAccessAllowedWithScope:a3 promptIfUnknown:1 synchronous:1 resultHandler:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__PLPrivacy_checkPhotosAccessAllowedWithScope___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)checkPhotosAccessAllowedWithScope:(int64_t)a3 handler:(id)a4
{
}

uint64_t __87__PLPrivacy__isPhotosAccessAllowedWithScope_promptIfUnknown_synchronous_resultHandler___block_invoke_67(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v2 == 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _authStatusForScope:*(void *)(a1 + 56)];
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 _checkAuthStatusForPhotosAccessScope:v3 preflightStatus:v2 promptIfUnknown:v4 resultHandler:v6];
}

intptr_t __96__PLPrivacy__checkAuthStatusForPhotosAccessScope_preflightStatus_promptIfUnknown_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _setAuthStatus:a2 scope:*(void *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v4 = PLPrivacyGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEFAULT, "TCCAccessRequest returned %d", (uint8_t *)v6, 8u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_logDictionaryFromPhotosPickerClientLogFile:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v15 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:0 error:&v15];
  id v5 = v15;
  uint64_t v6 = v5;
  if (v4)
  {
    id v14 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v14];
    id v8 = v14;

    if (v7)
    {
      uint64_t v9 = _ValidatedClientLogFromDictionary(v7);
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = v5;
  }
  uint64_t v10 = PLPrivacyGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = @"read";
    *(_DWORD *)long long buf = 138543874;
    if (!v4) {
      id v11 = @"decode";
    }
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    id v19 = v3;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Failed to %{public}@ photos picker client log from %{public}@: %@", buf, 0x20u);
  }

  uint64_t v7 = 0;
  uint64_t v9 = 0;
LABEL_10:
  id v12 = v9;

  return v12;
}

@end