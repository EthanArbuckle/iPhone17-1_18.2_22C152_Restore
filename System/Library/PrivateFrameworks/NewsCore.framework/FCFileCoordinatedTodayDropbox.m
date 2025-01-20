@interface FCFileCoordinatedTodayDropbox
- (BOOL)depositSyncWithAccessor:(id)a3;
- (BOOL)peekSyncWithAccessor:(id)a3;
- (FCFileCoordinatedDictionary)fileCoordinatedDictionary;
- (FCFileCoordinatedTodayDropbox)init;
- (FCFileCoordinatedTodayDropbox)initWithFileURL:(id)a3;
- (void)depositWithAccessor:(id)a3 completion:(id)a4;
- (void)peekWithAccessor:(id)a3;
- (void)setFileCoordinatedDictionary:(id)a3;
@end

@implementation FCFileCoordinatedTodayDropbox

void __64__FCFileCoordinatedTodayDropbox_depositWithAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  v4 = [[FCMutableTodayPrivateData alloc] initWithDictionary:v3];

  (*(void (**)(uint64_t, FCMutableTodayPrivateData *))(v2 + 16))(v2, v4);
}

- (void)depositWithAccessor:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCFileCoordinatedTodayDropbox depositWithAccessor:completion:]";
    __int16 v15 = 2080;
    v16 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v17 = 1024;
    int v18 = 106;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v8 = [(FCFileCoordinatedTodayDropbox *)self fileCoordinatedDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__FCFileCoordinatedTodayDropbox_depositWithAccessor_completion___block_invoke;
  v11[3] = &unk_1E5B4DE20;
  id v12 = v6;
  id v9 = v6;
  [v8 writeWithAccessor:v11 completion:v7];
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (FCFileCoordinatedTodayDropbox)initWithFileURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCFileCoordinatedTodayDropbox initWithFileURL:]";
    __int16 v25 = 2080;
    v26 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v27 = 1024;
    int v28 = 50;
    __int16 v29 = 2114;
    v30 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v22.receiver = self;
  v22.super_class = (Class)FCFileCoordinatedTodayDropbox;
  v5 = [(FCFileCoordinatedTodayDropbox *)&v22 init];
  if (v5)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v21, "setWithObjects:", v20, v19, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    __int16 v15 = [[FCFileCoordinatedDictionary alloc] initWithFileURL:v4 allowedClasses:v14];
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v15;
  }
  return v5;
}

- (FCFileCoordinatedTodayDropbox)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFileCoordinatedTodayDropbox init]";
    __int16 v9 = 2080;
    uint64_t v10 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v11 = 1024;
    int v12 = 45;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFileCoordinatedTodayDropbox init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)peekSyncWithAccessor:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCFileCoordinatedTodayDropbox peekSyncWithAccessor:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v16 = 1024;
    int v17 = 76;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFileCoordinatedTodayDropbox *)self fileCoordinatedDictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__FCFileCoordinatedTodayDropbox_peekSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E5B4DDF8;
  id v11 = v4;
  id v6 = v4;
  char v7 = [v5 readSyncWithAccessor:v10];

  return v7;
}

void __54__FCFileCoordinatedTodayDropbox_peekSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [FCTodayPrivateData alloc];
  if (v7) {
    id v5 = v7;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }
  id v6 = [(FCTodayPrivateData *)v4 initWithDictionary:v5];
  (*(void (**)(uint64_t, FCTodayPrivateData *))(v3 + 16))(v3, v6);
}

- (void)peekWithAccessor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    id v11 = "-[FCFileCoordinatedTodayDropbox peekWithAccessor:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v14 = 1024;
    int v15 = 86;
    __int16 v16 = 2114;
    int v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [(FCFileCoordinatedTodayDropbox *)self fileCoordinatedDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__FCFileCoordinatedTodayDropbox_peekWithAccessor___block_invoke;
  v8[3] = &unk_1E5B4DDF8;
  id v9 = v4;
  id v6 = v4;
  [v5 readWithAccessor:v8];
}

void __50__FCFileCoordinatedTodayDropbox_peekWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [FCTodayPrivateData alloc];
  if (v7) {
    id v5 = v7;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }
  id v6 = [(FCTodayPrivateData *)v4 initWithDictionary:v5];
  (*(void (**)(uint64_t, FCTodayPrivateData *))(v3 + 16))(v3, v6);
}

- (BOOL)depositSyncWithAccessor:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCFileCoordinatedTodayDropbox depositSyncWithAccessor:]";
    __int16 v14 = 2080;
    int v15 = "FCFileCoordinatedTodayDropbox.m";
    __int16 v16 = 1024;
    int v17 = 96;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [(FCFileCoordinatedTodayDropbox *)self fileCoordinatedDictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__FCFileCoordinatedTodayDropbox_depositSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E5B4DE20;
  id v11 = v4;
  id v6 = v4;
  char v7 = [v5 writeSyncWithAccessor:v10];

  return v7;
}

void __57__FCFileCoordinatedTodayDropbox_depositSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [[FCMutableTodayPrivateData alloc] initWithDictionary:v3];

  (*(void (**)(uint64_t, FCMutableTodayPrivateData *))(v2 + 16))(v2, v4);
}

- (void)setFileCoordinatedDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end