@interface FedStatsCohortQueryInstalledApps
+ (id)cohortInstance;
+ (void)initialize;
- (BOOL)_isSupportedIntentMediaApp:(id)a3 :(id)a4 :(id)a5;
- (FedStatsCohortQueryInstalledApps)init;
- (NSDictionary)domainToInstalledApps;
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
- (unint64_t)numOfMediaApps;
- (unint64_t)numOfPhoneApps;
- (void)applyFilteringForMediaDomain;
- (void)lsAppRecords;
- (void)lsPluginKitExtensions;
- (void)resolveDomainToBundleIds;
- (void)setDomainToInstalledApps:(id)a3;
@end

@implementation FedStatsCohortQueryInstalledApps

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = +[NSSet setWithArray:&off_100034688];
    v3 = (void *)qword_10003DD28;
    qword_10003DD28 = v2;

    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v6, v8, v10, 0);
    v12 = (void *)qword_10003DD30;
    qword_10003DD30 = v11;
  }
}

- (FedStatsCohortQueryInstalledApps)init
{
  v10.receiver = self;
  v10.super_class = (Class)FedStatsCohortQueryInstalledApps;
  uint64_t v2 = [(FedStatsCohortQueryInstalledApps *)&v10 init];
  if (v2)
  {
    v11[0] = @"media";
    v3 = +[NSMutableSet set];
    v11[1] = @"phone";
    v12[0] = v3;
    v4 = +[NSMutableSet set];
    v12[1] = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    domainToInstalledApps = v2->_domainToInstalledApps;
    v2->_domainToInstalledApps = (NSDictionary *)v5;

    [(FedStatsCohortQueryInstalledApps *)v2 resolveDomainToBundleIds];
    v7 = [(NSDictionary *)v2->_domainToInstalledApps objectForKeyedSubscript:@"media"];
    v2->_numOfMediaApps = (unint64_t)[v7 count];

    v8 = [(NSDictionary *)v2->_domainToInstalledApps objectForKeyedSubscript:@"phone"];
    v2->_numOfPhoneApps = (unint64_t)[v8 count];
  }
  return v2;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  uint64_t v5 = +[NSString stringWithFormat:@"Invalid call to FedStatsCohortQueryInstalledApps#.cohortKeyForParameters"];
  v6 = +[FedStatsError errorWithCode:900 description:v5];
  id v7 = *a4;
  *a4 = v6;

  return 0;
}

+ (id)cohortInstance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (void)resolveDomainToBundleIds
{
  v3 = +[_PFLLog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds start.", (uint8_t *)&v11, 2u);
  }

  v4 = +[NSDate date];
  [(FedStatsCohortQueryInstalledApps *)self lsAppRecords];
  [(FedStatsCohortQueryInstalledApps *)self lsPluginKitExtensions];
  [(FedStatsCohortQueryInstalledApps *)self applyFilteringForMediaDomain];
  uint64_t v5 = +[_PFLLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    domainToInstalledApps = self->_domainToInstalledApps;
    int v11 = 138412290;
    v12 = domainToInstalledApps;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds resolved domain to bundle ids: %@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = +[NSDate date];
  [v7 timeIntervalSinceDate:v4];
  v9 = v8;

  objc_super v10 = +[_PFLLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds complete in %fms", (uint8_t *)&v11, 0xCu);
  }
}

- (void)lsAppRecords
{
  v3 = +[LSApplicationRecord enumeratorWithOptions:0];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v6 = (void *)v4;
    p_vtable = FedStatsError.vtable;
    *(void *)&long long v5 = 138412802;
    long long v22 = v5;
    v23 = v3;
    do
    {
      v8 = objc_msgSend(v6, "bundleIdentifier", v22);
      if (v8)
      {
        v9 = [v6 supportedIntentMediaCategories];
        objc_super v10 = +[NSSet setWithArray:v9];

        int v11 = [v6 supportedIntents];
        if ([(FedStatsCohortQueryInstalledApps *)self _isSupportedIntentMediaApp:v8 :v10 :v11])
        {
          v12 = [InstalledApp alloc];
          id v13 = [v6 supportedIntentMediaCategories];
          [v6 localizedName];
          v14 = self;
          v16 = v15 = p_vtable;
          v17 = [(InstalledApp *)v12 initWithBundleIdentifier:v8 supportedMediaCategories:v13 supportedIntents:v11 appName:v16];

          p_vtable = v15;
          self = v14;

          v18 = [(NSDictionary *)v14->_domainToInstalledApps objectForKeyedSubscript:@"media"];
          [v18 addObject:v17];

          v19 = [p_vtable + 32 framework];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v21 = [v6 supportedIntentMediaCategories];
            *(_DWORD *)buf = v22;
            v25 = v8;
            __int16 v26 = 2112;
            v27 = v11;
            __int16 v28 = 2112;
            v29 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "bundle record: %@ has supported intent %@ and supported media categories: %@", buf, 0x20u);
          }
          v3 = v23;
        }
      }
      else
      {
        objc_super v10 = [p_vtable + 32 framework];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error enumerating app records; app record: %@ has nil bundle identifier",
            buf,
            0xCu);
        }
      }

      uint64_t v20 = [v3 nextObject];

      v6 = (void *)v20;
    }
    while (v20);
  }
}

- (void)lsPluginKitExtensions
{
  v3 = [(id)qword_10003DD30 allObjects];
  v10[0] = NSExtensionPointName;
  v10[1] = INExtensionAttributesIntentsSupportedKey;
  v11[0] = INIntentsServiceExtensionPointName;
  v11[1] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  long long v5 = +[LSApplicationWorkspace defaultWorkspace];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E4D0;
  v7[3] = &unk_1000309D0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 enumeratePluginsMatchingQuery:v6 withBlock:v7];
}

- (BOOL)_isSupportedIntentMediaApp:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 isEqualToString:@"com.apple.Music"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.podcasts"] & 1) != 0)
  {
    BOOL v10 = 1;
  }
  else if ([v8 count])
  {
    v12 = +[NSMutableSet setWithSet:qword_10003DD28];
    [v12 intersectSet:v8];
    if ([v12 count] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = +[NSMutableSet setWithSet:qword_10003DD30];
      v14 = +[NSSet setWithArray:v9];
      [v13 intersectSet:v14];

      BOOL v10 = [v13 count] != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)applyFilteringForMediaDomain
{
  id v2 = [(FedStatsCohortQueryInstalledApps *)self domainToInstalledApps];
  id v6 = [v2 objectForKeyedSubscript:@"media"];

  v3 = [v6 objectsPassingTest:&stru_100030A10];
  uint64_t v4 = [v3 objectsPassingTest:&stru_100030A30];

  long long v5 = [v4 objectsPassingTest:&stru_100030A50];

  [v6 setSet:v5];
}

- (unint64_t)numOfMediaApps
{
  return self->_numOfMediaApps;
}

- (unint64_t)numOfPhoneApps
{
  return self->_numOfPhoneApps;
}

- (NSDictionary)domainToInstalledApps
{
  return self->_domainToInstalledApps;
}

- (void)setDomainToInstalledApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end