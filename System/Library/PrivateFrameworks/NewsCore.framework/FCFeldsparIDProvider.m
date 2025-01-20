@interface FCFeldsparIDProvider
+ (FCFeldsparIDProvider)sharedInstance;
- (FCFeldsparIDProvider)init;
- (FCUserInfo)userInfo;
- (NSHashTable)observers;
- (NSString)feldsparID;
- (void)_updateFeldsparID:(id)a3;
- (void)addObserver:(id)a3;
- (void)registerUserInfo:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setFeldsparID:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4;
@end

@implementation FCFeldsparIDProvider

- (void)addObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    v5 = [(FCFeldsparIDProvider *)self observers];
    [v5 addObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCFeldsparIDProvider addObserver:]";
    __int16 v8 = 2080;
    v9 = "FCFeldsparIDProvider.m";
    __int16 v10 = 1024;
    int v11 = 87;
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (NSHashTable)observers
{
  return self->_observers;
}

+ (FCFeldsparIDProvider)sharedInstance
{
  if (qword_1EB5D11D0 != -1) {
    dispatch_once(&qword_1EB5D11D0, &__block_literal_global_33);
  }
  v2 = (void *)_MergedGlobals_153;
  return (FCFeldsparIDProvider *)v2;
}

- (NSString)feldsparID
{
  v3 = +[FCUserInfo overrideFeldsparID];
  if ([v3 length])
  {
    id v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  if (self->_userInfo)
  {
    id v4 = self->_feldsparID;
    goto LABEL_5;
  }
  v7 = NewsCoreSensitiveUserDefaults();
  v5 = [v7 stringForKey:@"provider_user_id"];

LABEL_6:
  return (NSString *)v5;
}

uint64_t __38__FCFeldsparIDProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FCFeldsparIDProvider);
  uint64_t v1 = _MergedGlobals_153;
  _MergedGlobals_153 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCFeldsparIDProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)FCFeldsparIDProvider;
  v2 = [(FCFeldsparIDProvider *)&v9 init];
  if (v2)
  {
    v3 = NewsCoreSensitiveUserDefaults();
    uint64_t v4 = [v3 stringForKey:@"provider_user_id"];
    feldsparID = v2->_feldsparID;
    v2->_feldsparID = (NSString *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v6;
  }
  return v2;
}

- (void)registerUserInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (FCUserInfo *)a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v5)
  {
    userInfo = self->_userInfo;
    if (userInfo != v5)
    {
      [(FCUserInfo *)userInfo removeObserver:self];
      [(FCUserInfo *)v5 addObserver:self];
      objc_storeStrong((id *)&self->_userInfo, a3);
      v7 = [(FCUserInfo *)v5 feldsparID];
      [(FCFeldsparIDProvider *)self _updateFeldsparID:v7];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userInfo");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCFeldsparIDProvider registerUserInfo:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCFeldsparIDProvider.m";
    __int16 v13 = 1024;
    int v14 = 67;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (void)_updateFeldsparID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if ([v4 length])
  {
    v5 = [(FCFeldsparIDProvider *)self feldsparID];
    char v6 = [v5 isEqualToString:v4];

    if ((v6 & 1) == 0)
    {
      [(FCFeldsparIDProvider *)self setFeldsparID:v4];
      v7 = NewsCoreSensitiveUserDefaults();
      [v7 setValue:v4 forKey:@"provider_user_id"];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      __int16 v8 = [(FCFeldsparIDProvider *)self observers];
      objc_super v9 = (void *)[v8 copy];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            int v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
            if (objc_opt_respondsToSelector()) {
              [v14 feldsparIDProviderDidChangeFeldsparID:self];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)removeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    v5 = [(FCFeldsparIDProvider *)self observers];
    [v5 removeObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCFeldsparIDProvider removeObserver:]";
    __int16 v8 = 2080;
    objc_super v9 = "FCFeldsparIDProvider.m";
    __int16 v10 = 1024;
    int v11 = 98;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  char v6 = [v7 feldsparID];
  [(FCFeldsparIDProvider *)self _updateFeldsparID:v6];

  if (v4) {
    [v7 resetSportsID];
  }
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setFeldsparID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_feldsparID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end