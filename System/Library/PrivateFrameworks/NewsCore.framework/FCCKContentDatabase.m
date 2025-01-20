@interface FCCKContentDatabase
- (BOOL)isProductionEnvironment;
- (BOOL)shouldBypassCDNForCKAssetURLs;
- (BOOL)shouldUseCloudd;
- (BOOL)shouldUseSecureConnectionForCKAssetURLs;
- (FCCKContentDatabase)init;
- (FCCKContentDatabase)initWithContainerIdentifier:(id)a3 productionEnvironment:(BOOL)a4 networkBehaviorMonitor:(id)a5 networkReachability:(id)a6 configurationManager:(id)a7;
- (FCCoreConfigurationManager)configurationManager;
- (FCNetworkBehaviorMonitor)networkBehaviorMonitor;
- (FCNetworkReachabilityType)networkReachability;
- (NSString)containerIdentifier;
- (NSURL)baseURLForEdgeCachedMultiFetch;
- (NSURL)baseURLForEdgeCachedOrderFeed;
- (NSURL)baseURLForMultiFetch;
- (NSURL)baseURLForOrderFeed;
- (NSURL)baseURLForRecordFetch;
- (double)maximumRetryAfterForCK;
- (id)generateURLForResourceID:(id)a3;
- (id)permanentURLForRecordID:(id)a3 field:(int64_t)a4;
- (id)permanentURLForRecordID:(id)a3 field:(int64_t)a4 useSecureConnection:(BOOL)a5;
- (void)addOperation:(id)a3;
- (void)setMaximumRetryAfterForCK:(double)a3;
- (void)setShouldBypassCDNForCKAssetURLs:(BOOL)a3;
- (void)setShouldUseSecureConnectionForCKAssetURLs:(BOOL)a3;
- (void)updateAssetURLHostIfNeededWithComponents:(id)a3;
@end

@implementation FCCKContentDatabase

- (id)generateURLForResourceID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "resourceID != nil");
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKContentDatabase generateURLForResourceID:]";
    __int16 v10 = 2080;
    v11 = "FCCKContentDatabase.m";
    __int16 v12 = 1024;
    int v13 = 113;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCCKContentDatabase *)self permanentURLForRecordID:v4 field:3];

  return v5;
}

- (id)permanentURLForRecordID:(id)a3 field:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(FCCKContentDatabase *)self shouldUseSecureConnectionForCKAssetURLs];
  v8 = [(FCCKContentDatabase *)self containerIdentifier];
  v9 = FCPermanentURLForRecordID(v6, a4, v8, v7);

  return v9;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (BOOL)shouldUseSecureConnectionForCKAssetURLs
{
  return self->_shouldUseSecureConnectionForCKAssetURLs;
}

- (BOOL)isProductionEnvironment
{
  return self->_isProductionEnvironment;
}

- (BOOL)shouldUseCloudd
{
  return self->_shouldUseCloudd;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (NSURL)baseURLForRecordFetch
{
  v2 = [(FCCKContentDatabase *)self configurationManager];
  v3 = [v2 configuration];
  id v4 = +[FCBaseURLConfiguration ckRecordFetchBaseURLForConfiguration:v3];

  return (NSURL *)v4;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (NSURL)baseURLForEdgeCachedMultiFetch
{
  v2 = [(FCCKContentDatabase *)self configurationManager];
  v3 = [v2 configuration];
  id v4 = +[FCBaseURLConfiguration ckEdgeCachedMultiFetchBaseURLForConfiguration:v3];

  return (NSURL *)v4;
}

- (void)setShouldUseSecureConnectionForCKAssetURLs:(BOOL)a3
{
  self->_shouldUseSecureConnectionForCKAssetURLs = a3;
}

- (void)setMaximumRetryAfterForCK:(double)a3
{
  self->_maximumRetryAfterForCK = a3;
}

- (FCCKContentDatabase)initWithContainerIdentifier:(id)a3 productionEnvironment:(BOOL)a4 networkBehaviorMonitor:(id)a5 networkReachability:(id)a6 configurationManager:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FCCKContentDatabase;
  uint64_t v16 = [(FCCKContentDatabase *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    containerIdentifier = v16->_containerIdentifier;
    v16->_containerIdentifier = (NSString *)v17;

    v16->_isProductionEnvironment = a4;
    objc_storeStrong((id *)&v16->_networkBehaviorMonitor, a5);
    objc_storeStrong((id *)&v16->_networkReachability, a6);
    objc_storeStrong((id *)&v16->_configurationManager, a7);
  }

  return v16;
}

- (double)maximumRetryAfterForCK
{
  return self->_maximumRetryAfterForCK;
}

- (FCCKContentDatabase)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKContentDatabase init]";
    __int16 v9 = 2080;
    __int16 v10 = "FCCKContentDatabase.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCKContentDatabase init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)updateAssetURLHostIfNeededWithComponents:(id)a3
{
}

- (BOOL)shouldBypassCDNForCKAssetURLs
{
  if (qword_1EB5D1380 != -1) {
    dispatch_once(&qword_1EB5D1380, &__block_literal_global_59);
  }
  return _MergedGlobals_164;
}

void __52__FCCKContentDatabase_shouldBypassCDNForCKAssetURLs__block_invoke()
{
  NewsCoreUserDefaults();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_164 = [v0 BOOLForKey:@"replace_cdn_with_cvws"];
}

- (NSURL)baseURLForOrderFeed
{
  v2 = [(FCCKContentDatabase *)self configurationManager];
  v3 = [v2 configuration];
  uint64_t v4 = +[FCBaseURLConfiguration ckOrderFeedBaseURLForConfiguration:v3];

  return (NSURL *)v4;
}

- (NSURL)baseURLForMultiFetch
{
  v2 = [(FCCKContentDatabase *)self configurationManager];
  v3 = [v2 configuration];
  uint64_t v4 = +[FCBaseURLConfiguration ckMultiFetchBaseURLForConfiguration:v3];

  return (NSURL *)v4;
}

- (NSURL)baseURLForEdgeCachedOrderFeed
{
  v2 = [(FCCKContentDatabase *)self configurationManager];
  v3 = [v2 configuration];
  uint64_t v4 = +[FCBaseURLConfiguration ckEdgeCachedOrderFeedBaseURLForConfiguration:v3];

  return (NSURL *)v4;
}

- (void)addOperation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCCKContentDatabase addOperation:]";
    __int16 v11 = 2080;
    int v12 = "FCCKContentDatabase.m";
    __int16 v13 = 1024;
    int v14 = 92;
    __int16 v15 = 2114;
    uint64_t v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  int v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCCKContentDatabase addOperation:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)permanentURLForRecordID:(id)a3 field:(int64_t)a4 useSecureConnection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  __int16 v9 = [(FCCKContentDatabase *)self containerIdentifier];
  __int16 v10 = FCPermanentURLForRecordID(v8, a4, v9, v5);

  return v10;
}

- (void)setShouldBypassCDNForCKAssetURLs:(BOOL)a3
{
  self->_shouldBypassCDNForCKAssetURLs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end