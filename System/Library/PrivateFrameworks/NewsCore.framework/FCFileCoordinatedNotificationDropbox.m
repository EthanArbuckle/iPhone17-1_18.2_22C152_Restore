@interface FCFileCoordinatedNotificationDropbox
- (FCFileCoordinatedDictionary)fileCoordinatedDictionary;
- (FCFileCoordinatedNotificationDropbox)init;
- (FCFileCoordinatedNotificationDropbox)initWithFileURL:(id)a3;
- (void)depositWithAccessor:(id)a3 completion:(id)a4;
- (void)peekWithAccessor:(id)a3;
- (void)setFileCoordinatedDictionary:(id)a3;
@end

@implementation FCFileCoordinatedNotificationDropbox

- (FCFileCoordinatedNotificationDropbox)initWithFileURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "fileURL");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCFileCoordinatedNotificationDropbox initWithFileURL:]";
    __int16 v17 = 2080;
    v18 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v19 = 1024;
    int v20 = 46;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v14.receiver = self;
  v14.super_class = (Class)FCFileCoordinatedNotificationDropbox;
  v5 = [(FCFileCoordinatedNotificationDropbox *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = [[FCFileCoordinatedDictionary alloc] initWithFileURL:v4 allowedClasses:v9];
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v10;
  }
  return v5;
}

- (FCFileCoordinatedNotificationDropbox)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFileCoordinatedNotificationDropbox init]";
    __int16 v9 = 2080;
    v10 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v11 = 1024;
    int v12 = 41;
    __int16 v13 = 2114;
    objc_super v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFileCoordinatedNotificationDropbox init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)peekWithAccessor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "accessor");
    *(_DWORD *)buf = 136315906;
    __int16 v11 = "-[FCFileCoordinatedNotificationDropbox peekWithAccessor:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v14 = 1024;
    int v15 = 59;
    __int16 v16 = 2114;
    __int16 v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCFileCoordinatedNotificationDropbox *)self fileCoordinatedDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__FCFileCoordinatedNotificationDropbox_peekWithAccessor___block_invoke;
  v8[3] = &unk_1E5B4DDF8;
  id v9 = v4;
  id v6 = v4;
  [v5 readWithAccessor:v8];
}

void __57__FCFileCoordinatedNotificationDropbox_peekWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v3)
  {
    v5 = [[FCNotificationDropboxData alloc] initWithDictionary:v3];
    (*(void (**)(uint64_t, FCNotificationDropboxData *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
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
    __int16 v14 = "-[FCFileCoordinatedNotificationDropbox depositWithAccessor:completion:]";
    __int16 v15 = 2080;
    __int16 v16 = "FCFileCoordinatedNotificationDropbox.m";
    __int16 v17 = 1024;
    int v18 = 76;
    __int16 v19 = 2114;
    int v20 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v8 = [(FCFileCoordinatedNotificationDropbox *)self fileCoordinatedDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__FCFileCoordinatedNotificationDropbox_depositWithAccessor_completion___block_invoke;
  v11[3] = &unk_1E5B4DE20;
  id v12 = v6;
  id v9 = v6;
  [v8 writeWithAccessor:v11 completion:v7];
}

void __71__FCFileCoordinatedNotificationDropbox_depositWithAccessor_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [[FCMutableNotificationData alloc] initWithDictionary:v3];

  (*(void (**)(uint64_t, FCMutableNotificationData *))(v2 + 16))(v2, v4);
}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (void)setFileCoordinatedDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end