@interface FCRemoteDefaults
- (BOOL)isAvailable;
- (FCBackgroundTaskable)backgroundTaskable;
- (FCRemoteDefaults)init;
- (FCRemoteDefaults)initWithBackgroundTaskable:(id)a3;
- (FCThreadSafeMutableDictionary)remoteDefaults;
- (id)URLForKey:(id)a3;
- (id)URLRequest;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)checkForUpdate;
- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5;
- (void)updateRemoteDefaults;
@end

@implementation FCRemoteDefaults

- (BOOL)isAvailable
{
  v2 = [(FCThreadSafeMutableDictionary *)self->_remoteDefaults objectForKey:@"FCRemoteDefaults"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(FCRemoteDefaults *)self objectForKey:v4];

  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)objectForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  remoteDefaults = self->_remoteDefaults;
  id v4 = a3;
  v5 = [(FCThreadSafeMutableDictionary *)remoteDefaults objectForKey:@"FCRemoteDefaults"];
  v6 = [v5 objectForKey:v4];

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "object");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCRemoteDefaults objectForKey:]";
    __int16 v11 = 2080;
    v12 = "FCRemoteDefaults.m";
    __int16 v13 = 1024;
    int v14 = 68;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v6;
}

- (FCRemoteDefaults)initWithBackgroundTaskable:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCRemoteDefaults;
  v5 = [(FCRemoteDefaults *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_backgroundTaskable, v4);
    id v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    remoteDefaults = v6->_remoteDefaults;
    v6->_remoteDefaults = v7;

    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v10 = [v9 objectForKey:@"FCRemoteDefaults"];

    if (v10) {
      [(FCThreadSafeMutableDictionary *)v6->_remoteDefaults setObject:v10 forKey:@"FCRemoteDefaults"];
    }
    else {
      [(FCRemoteDefaults *)v6 checkForUpdate];
    }
  }
  return v6;
}

- (FCRemoteDefaults)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
    int v5 = 136315906;
    v6 = "-[FCRemoteDefaults init]";
    __int16 v7 = 2080;
    v8 = "FCRemoteDefaults.m";
    __int16 v9 = 1024;
    int v10 = 58;
    __int16 v11 = 2114;
    objc_super v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
  }
  return [(FCRemoteDefaults *)self initWithBackgroundTaskable:0];
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int v5 = [(FCRemoteDefaults *)self objectForKey:v4];

  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)URLForKey:(id)a3
{
  BOOL v3 = [(FCRemoteDefaults *)self objectForKey:a3];
  objc_opt_class();
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;
  if (!v5 && v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v3;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    if (v7)
    {
      id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (void)checkForUpdate
{
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v6 objectForKey:@"FCRemoteDefaultsLastUpdate"];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 dateByAddingTimeInterval:86400.0];
  if (!v3 || objc_msgSend(v4, "fc_isLaterThan:", v5)) {
    [(FCRemoteDefaults *)self updateRemoteDefaults];
  }
}

- (void)updateRemoteDefaults
{
  BOOL v3 = [(FCRemoteDefaults *)self URLRequest];
  id v4 = [(FCRemoteDefaults *)self backgroundTaskable];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke;
  v13[3] = &unk_1E5B4F3B0;
  id v5 = v4;
  id v14 = v5;
  __int16 v15 = &v16;
  uint64_t v6 = objc_msgSend(v5, "fc_beginBackgroundTaskWithName:expirationHandler:", @"Remote Defaults Update", v13);
  v17[3] = v6;
  id v7 = [MEMORY[0x1E4F18DC0] sharedSession];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_2;
  v10[3] = &unk_1E5B58C98;
  v10[4] = self;
  id v8 = v5;
  id v11 = v8;
  objc_super v12 = &v16;
  __int16 v9 = [v7 dataTaskWithRequest:v3 completionHandler:v10];
  [v9 resume];

  _Block_object_dispose(&v16, 8);
}

uint64_t __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  int v10 = (objc_class *)objc_opt_class();
  id v11 = FCCheckedDynamicCast(v10, (uint64_t)v8);

  [*(id *)(a1 + 32) processResponse:v11 data:v9 error:v7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_3;
  v14[3] = &unk_1E5B4F3B0;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v15 = v12;
  uint64_t v16 = v13;
  FCPerformBlockOnMainThread(v14);
}

uint64_t __40__FCRemoteDefaults_updateRemoteDefaults__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (id)URLRequest
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 stringForKey:@"FCRemoteDefaultsDownloadURL"];
  if (![v3 length]
    || ([MEMORY[0x1E4F1CB10] URLWithString:v3],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://configuration.apple.com/configurations/internetservices/tectosilicate/RemoteDefaults.plist"];
  }
  id v5 = [MEMORY[0x1E4F18D50] requestWithURL:v4];
  [v5 setTimeoutInterval:20.0];
  [v5 setCachePolicy:1];
  uint64_t v6 = [v2 stringForKey:@"FCRemoteDefaultsETag"];
  if ([v6 length]) {
    [v5 setValue:v6 forHTTPHeaderField:@"If-None-Match"];
  }

  return v5;
}

- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 statusCode];
  uint64_t v12 = v11;
  if (v11 == 304 || v11 == 200)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v13 setObject:v14 forKey:@"FCRemoteDefaultsLastUpdate"];

    if (v12 == 200 && [v9 length])
    {
      id v21 = 0;
      id v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:&v21];
      id v16 = v21;

      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [(FCThreadSafeMutableDictionary *)self->_remoteDefaults setObject:v15 forKey:@"FCRemoteDefaults"];
        [v13 setObject:v15 forKey:@"FCRemoteDefaults"];
        uint64_t v17 = FCAppConfigurationLog;
        if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v15;
          _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_INFO, "Received configuration file: %@", buf, 0xCu);
        }
        uint64_t v18 = [v8 allHeaderFields];
        uint64_t v19 = [v18 objectForKey:@"Etag"];

        [v13 setObject:v19 forKey:@"FCRemoteDefaultsETag"];
      }
      else
      {
        v20 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = v16;
          _os_log_error_impl(&dword_1A460D000, v20, OS_LOG_TYPE_ERROR, "Could not create property list from data. Error: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v16 = v10;
    }

    id v10 = v16;
  }
}

- (FCBackgroundTaskable)backgroundTaskable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundTaskable);
  return (FCBackgroundTaskable *)WeakRetained;
}

- (FCThreadSafeMutableDictionary)remoteDefaults
{
  return self->_remoteDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDefaults, 0);
  objc_destroyWeak((id *)&self->_backgroundTaskable);
}

@end