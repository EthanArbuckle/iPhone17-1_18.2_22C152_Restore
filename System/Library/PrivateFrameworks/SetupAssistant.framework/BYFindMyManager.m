@interface BYFindMyManager
- (BOOL)isFindMyEnabled;
@end

@implementation BYFindMyManager

- (BOOL)isFindMyEnabled
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Will fetch Find My state.", buf, 2u);
  }

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v4 = (void *)getFMDFMIPManagerClass_softClass;
  uint64_t v26 = getFMDFMIPManagerClass_softClass;
  if (!getFMDFMIPManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getFMDFMIPManagerClass_block_invoke;
    v21 = &unk_1E5D2B9E8;
    v22 = &v23;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)buf);
    v4 = (void *)v24[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v23, 8);
  v6 = [v5 sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__BYFindMyManager_isFindMyEnabled__block_invoke;
  v11[3] = &unk_1E5D2BBA8;
  v13 = &v14;
  v7 = v2;
  v12 = v7;
  [v6 fmipStateWithCompletion:v11];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Did finish waiting for Find My state.", buf, 2u);
  }

  char v9 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v9;
}

void __34__BYFindMyManager_isFindMyEnabled__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = _BYLoggingFacility();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7) {
      __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_2(v5, v6);
    }
  }
  else
  {
    if (v7) {
      __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_1(a2, v6);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Did fetch Find My state %lu", (uint8_t *)&v2, 0xCu);
}

void __34__BYFindMyManager_isFindMyEnabled__block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = _BYIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    v6 = NSString;
    int v2 = [a1 domain];
    a1 = [v6 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(a1, "code")];
  }
  *(_DWORD *)buf = 138543362;
  v8 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch Find My state: %{public}@", buf, 0xCu);
  if (!v5)
  {
  }
}

@end