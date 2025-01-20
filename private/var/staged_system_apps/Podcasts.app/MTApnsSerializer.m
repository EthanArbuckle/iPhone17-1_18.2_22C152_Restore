@interface MTApnsSerializer
+ (id)whitelistedClasses;
- (id)payload;
@end

@implementation MTApnsSerializer

- (id)payload
{
  v18 = +[NSMutableDictionary dictionary];
  [(MZKeyValueStoreSerializer *)self keys];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v21 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(obj);
        }
        v4 = *(NSObject **)(*((void *)&v24 + 1) + 8 * i);
        v5 = [(MZKeyValueStoreSerializer *)self transaction];
        v6 = [v5 processor];

        v7 = [(MZKeyValueStoreSerializer *)self transaction];
        id v23 = 0;
        v8 = [v6 dataForSetTransaction:v7 key:v4 version:&v23];
        id v9 = v23;

        if (v8)
        {
          v10 = [(id)objc_opt_class() whitelistedClasses];
          id v22 = 0;
          v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v8 error:&v22];
          v12 = v22;

          if (v12 || !v11)
          {
            v13 = _MTLogCategoryCloudSync();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v4;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Processor returned data for key %@ that isn't a valid archive. Skipping.", buf, 0xCu);
            }

            if (v12)
            {
              v14 = _MTLogCategoryCloudSync();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v12;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error = %@", buf, 0xCu);
              }
            }
          }
          else
          {
            [v18 setValue:v11 forKey:v4];
          }
        }
        else
        {
          v12 = _MTLogCategoryCloudSync();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v4;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Processor returned nil data for key %@. Skipping.", buf, 0xCu);
          }
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v21);
  }
  v15 = +[NSPropertyListSerialization dataWithPropertyList:v18 format:kMZKeyValueStorePlistFormatNetworkData options:0 error:0];
  v16 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "APNS subscription payload: %@", buf, 0xCu);
  }

  return v15;
}

+ (id)whitelistedClasses
{
  if (qword_10060A958 != -1) {
    dispatch_once(&qword_10060A958, &stru_1005530E8);
  }
  v2 = (void *)qword_10060A960;

  return v2;
}

@end