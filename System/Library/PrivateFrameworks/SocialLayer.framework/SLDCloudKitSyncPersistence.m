@interface SLDCloudKitSyncPersistence
- (SLDCloudKitSyncPersistence)initWithName:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)reset;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation SLDCloudKitSyncPersistence

- (SLDCloudKitSyncPersistence)initWithName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLDCloudKitSyncPersistence;
  v5 = [(SLDCloudKitSyncPersistence *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [@"com.apple.sociallayerd.CloudKit." stringByAppendingString:v4];
    suiteName = v5->_suiteName;
    v5->_suiteName = (NSString *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v5->_suiteName];
    defaults = v5->_defaults;
    v5->_defaults = (NSUserDefaults *)v10;

    uint64_t v12 = objc_opt_new();
    cache = v5->_cache;
    v5->_cache = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    id nilValue = v5->_nilValue;
    v5->_id nilValue = (id)v14;
  }
  return v5;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v5];
    if (v6 == self->_nilValue)
    {
      v7 = 0;
    }
    else
    {
      if (!v6)
      {
        id v6 = [(NSUserDefaults *)self->_defaults objectForKey:v5];
      }
      id v6 = v6;
      v7 = v6;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = (void *)[v10 copy];
    id nilValue = v8;
    if (!v8) {
      id nilValue = self->_nilValue;
    }
    [(NSMutableDictionary *)self->_cache setObject:nilValue forKeyedSubscript:v7];

    [(NSUserDefaults *)self->_defaults setObject:v10 forKey:v7];
  }
}

- (void)reset
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = SLDaemonLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "#SLDCK !!! PERSISTENCE RESET !!!", buf, 2u);
  }

  [(NSUserDefaults *)self->_defaults removePersistentDomainForName:self->_suiteName];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMutableDictionary *)self->_cache allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableDictionary *)self->_cache setObject:self->_nilValue forKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nilValue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end