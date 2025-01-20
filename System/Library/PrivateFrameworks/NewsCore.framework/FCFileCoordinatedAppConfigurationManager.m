@interface FCFileCoordinatedAppConfigurationManager
- (FCFileCoordinatedAppConfigurationManager)init;
- (FCFileCoordinatedAppConfigurationManager)initWithFileURL:(id)a3 storefrontID:(id)a4;
- (FCFileCoordinatedDictionary)fileCoordinatedDictionary;
- (FCNewsAppConfiguration)appConfiguration;
- (FCNewsAppConfiguration)fetchedAppConfiguration;
- (NFUnfairLock)lock;
- (NSString)storefrontID;
- (id)_appConfigurationFromDictionary:(id)a3 forStorefrontID:(id)a4;
- (id)_dictionaryFromAppConfiguration:(id)a3;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
- (void)depositAppConfiguration:(id)a3;
- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3;
- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4;
- (void)setFetchedAppConfiguration:(id)a3;
@end

@implementation FCFileCoordinatedAppConfigurationManager

- (FCFileCoordinatedAppConfigurationManager)initWithFileURL:(id)a3 storefrontID:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFileCoordinatedAppConfigurationManager initWithFileURL:storefrontID:]";
    __int16 v27 = 2080;
    v28 = "FCFileCoordinatedAppConfigurationManager.m";
    __int16 v29 = 1024;
    int v30 = 34;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFileCoordinatedAppConfigurationManager initWithFileURL:storefrontID:]";
    __int16 v27 = 2080;
    v28 = "FCFileCoordinatedAppConfigurationManager.m";
    __int16 v29 = 1024;
    int v30 = 35;
    __int16 v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCFileCoordinatedAppConfigurationManager;
  v8 = [(FCFileCoordinatedAppConfigurationManager *)&v24 init];
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v8->_lock;
    v8->_lock = (NFUnfairLock *)v15;

    v17 = [[FCFileCoordinatedDictionary alloc] initWithFileURL:v6 allowedClasses:v14];
    fileCoordinatedDictionary = v8->_fileCoordinatedDictionary;
    v8->_fileCoordinatedDictionary = v17;

    uint64_t v19 = [v7 copy];
    storefrontID = v8->_storefrontID;
    v8->_storefrontID = (NSString *)v19;
  }
  return v8;
}

- (FCFileCoordinatedAppConfigurationManager)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFileCoordinatedAppConfigurationManager init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCFileCoordinatedAppConfigurationManager.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFileCoordinatedAppConfigurationManager init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)depositAppConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appConfiguration");
    *(_DWORD *)buf = 136315906;
    __int16 v11 = "-[FCFileCoordinatedAppConfigurationManager depositAppConfiguration:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCFileCoordinatedAppConfigurationManager.m";
    __int16 v14 = 1024;
    int v15 = 58;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFileCoordinatedAppConfigurationManager *)self fileCoordinatedDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__FCFileCoordinatedAppConfigurationManager_depositAppConfiguration___block_invoke;
  v8[3] = &unk_1E5B4CDC0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 writeWithAccessor:v8 completion:0];
}

void __68__FCFileCoordinatedAppConfigurationManager_depositAppConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 removeAllObjects];
  id v4 = [*(id *)(a1 + 32) _dictionaryFromAppConfiguration:*(void *)(a1 + 40)];
  [v3 addEntriesFromDictionary:v4];
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
}

- (FCNewsAppConfiguration)appConfiguration
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__3;
  __int16 v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  id v3 = [(FCFileCoordinatedAppConfigurationManager *)self lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__FCFileCoordinatedAppConfigurationManager_appConfiguration__block_invoke;
  v8[3] = &unk_1E5B4C258;
  v8[4] = self;
  void v8[5] = &v9;
  [v3 performWithLockSync:v8];

  id v4 = (void *)v10[5];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(FCFileCoordinatedAppConfigurationManager *)self storefrontID];
    +[FCNewsAppConfig defaultConfigurationForStoreFrontID:]((uint64_t)FCNewsAppConfig, v6);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v9, 8);

  return (FCNewsAppConfiguration *)v5;
}

uint64_t __60__FCFileCoordinatedAppConfigurationManager_appConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchedAppConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3
{
}

- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  v8 = [(FCFileCoordinatedAppConfigurationManager *)self lock];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke;
  v12[3] = &unk_1E5B4C258;
  v12[4] = self;
  v12[5] = &v13;
  [v8 performWithLockSync:v12];

  if (v14[5])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2;
    v9[3] = &unk_1E5B4CDE8;
    id v10 = v7;
    uint64_t v11 = &v13;
    dispatch_async(v6, v9);
  }
  else
  {
    [(FCFileCoordinatedAppConfigurationManager *)self refreshAppConfigurationIfNeededWithCompletionQueue:v6 refreshCompletion:v7];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchedAppConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __104__FCFileCoordinatedAppConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FCFileCoordinatedAppConfigurationManager *)self fileCoordinatedDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke;
  v11[3] = &unk_1E5B4CE10;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 readWithAccessor:v11];
}

void __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 storefrontID];
    id v6 = [v3 _appConfigurationFromDictionary:v4 forStorefrontID:v5];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) lock];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2;
      v12[3] = &unk_1E5B4BE70;
      v12[4] = *(void *)(a1 + 32);
      id v13 = v6;
      [v7 performWithLockSync:v12];
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_3;
  v10[3] = &unk_1E5B4C7C0;
  v8 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v9;
  dispatch_async(v8, v10);
}

uint64_t __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFetchedAppConfiguration:*(void *)(a1 + 40)];
}

void __113__FCFileCoordinatedAppConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) appConfiguration];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (id)_dictionaryFromAppConfiguration:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appConfiguration");
    *(_DWORD *)buf = 136315906;
    id v14 = "-[FCFileCoordinatedAppConfigurationManager _dictionaryFromAppConfiguration:]";
    __int16 v15 = 2080;
    __int16 v16 = "FCFileCoordinatedAppConfigurationManager.m";
    __int16 v17 = 1024;
    int v18 = 162;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v4 = [v3 internalConfiguration];
  v11[0] = @"c";
  id v5 = [v4 configDictionary];
  v12[0] = v5;
  v11[1] = @"l";
  id v6 = [v4 languageConfigDictionary];
  v12[1] = v6;
  v11[2] = @"s";
  id v7 = [v4 storefrontID];
  v12[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v8;
}

- (id)_appConfigurationFromDictionary:(id)a3 forStorefrontID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dictionary");
    *(_DWORD *)buf = 136315906;
    __int16 v16 = "-[FCFileCoordinatedAppConfigurationManager _appConfigurationFromDictionary:forStorefrontID:]";
    __int16 v17 = 2080;
    int v18 = "FCFileCoordinatedAppConfigurationManager.m";
    __int16 v19 = 1024;
    int v20 = 175;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "desiredStorefrontID");
    *(_DWORD *)buf = 136315906;
    __int16 v16 = "-[FCFileCoordinatedAppConfigurationManager _appConfigurationFromDictionary:forStorefrontID:]";
    __int16 v17 = 2080;
    int v18 = "FCFileCoordinatedAppConfigurationManager.m";
    __int16 v19 = 1024;
    int v20 = 176;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  id v7 = [v5 objectForKeyedSubscript:@"c"];
  v8 = [v5 objectForKeyedSubscript:@"l"];
  id v9 = [v5 objectForKeyedSubscript:@"s"];
  id v10 = v9;
  id v11 = 0;
  if (v7 && v8 && v9)
  {
    if ([v9 isEqualToString:v6]) {
      id v11 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], v7, v10, v8);
    }
    else {
      id v11 = 0;
    }
  }

  return v11;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (FCNewsAppConfiguration)fetchedAppConfiguration
{
  return self->_fetchedAppConfiguration;
}

- (void)setFetchedAppConfiguration:(id)a3
{
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, 0);
  objc_storeStrong((id *)&self->_fetchedAppConfiguration, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end