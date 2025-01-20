@interface SSVSubscriptionEntitlementsCoordinator
+ (id)_cachedSubscriptionEntitlementsDictionary;
+ (id)_cachedSubscriptionEntitlementsPath;
+ (id)cachedSubscriptionEntitlementsExpired:(BOOL *)a3;
+ (void)_notifyClientsOfChangedSubscriptionEntitlements;
+ (void)_setCachedSubscriptionEntitlementsDictionary:(id)a3;
+ (void)markCachedSubscriptionEntitlementsAsExpired;
+ (void)setCachedSubscriptionEntitlements:(id)a3;
@end

@implementation SSVSubscriptionEntitlementsCoordinator

+ (id)cachedSubscriptionEntitlementsExpired:(BOOL *)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = [v4 _cachedSubscriptionEntitlementsDictionary];
  objc_sync_exit(v4);

  v6 = +[SSURLBagContext contextWithBagType:0];
  v7 = +[ISURLBagCache sharedCache];
  v8 = [v7 URLBagForContext:v6];

  v9 = [v8 valueForKey:@"fsEntitlementsRefreshIntervalInSeconds"];
  [v9 doubleValue];
  double v11 = v10;

  v12 = [v5 objectForKeyedSubscript:kCacheTimestampKey];
  v13 = [v12 dateByAddingTimeInterval:v11];

  v14 = &syslog_ptr;
  if (!v13
    || (+[NSDate date],
        v15 = objc_claimAutoreleasedReturnValue(),
        id v16 = [v13 compare:v15],
        v15,
        v16 != (id)1))
  {
    v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    v20 = [v17 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      LODWORD(v39) = 138412290;
      *(void *)((char *)&v39 + 4) = objc_opt_class();
      v21 = a3;
      v22 = v8;
      v23 = v6;
      id v24 = *(id *)((char *)&v39 + 4);
      LODWORD(v38) = 12;
      v37 = &v39;
      v25 = (void *)_os_log_send_and_compose_impl();

      v6 = v23;
      v8 = v22;
      a3 = v21;
      v14 = &syslog_ptr;

      if (v25)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v39, v38, v39);
        v26 = (long long *)objc_claimAutoreleasedReturnValue();
        free(v25);
        v37 = v26;
        SSFileLog();
      }
    }
    else
    {
    }
    if (a3) {
      *a3 = 1;
    }
  }
  v27 = objc_msgSend(v14[405], "sharedDaemonConfig", v37);
  if (!v27)
  {
    v27 = [v14[405] sharedConfig];
  }
  unsigned int v28 = [v27 shouldLog];
  if ([v27 shouldLogToDisk]) {
    int v29 = v28 | 2;
  }
  else {
    int v29 = v28;
  }
  v30 = [v27 OSLogObject];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    int v31 = v29;
  }
  else {
    int v31 = v29 & 2;
  }
  if (v31)
  {
    v32 = objc_opt_class();
    LODWORD(v39) = 138412290;
    *(void *)((char *)&v39 + 4) = v32;
    id v33 = v32;
    LODWORD(v38) = 12;
    v34 = (void *)_os_log_send_and_compose_impl();

    if (!v34) {
      goto LABEL_28;
    }
    v30 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v39, v38);
    free(v34);
    SSFileLog();
  }

LABEL_28:
  v35 = +[SSVSubscriptionEntitlements _parseJSONDictionary:v5];

  return v35;
}

+ (void)markCachedSubscriptionEntitlementsAsExpired
{
  v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    LODWORD(v14) = 138412290;
    *(void *)((char *)&v14 + 4) = objc_opt_class();
    id v7 = *(id *)((char *)&v14 + 4);
    LODWORD(v13) = 12;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (v8)
    {
      v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v14, v13, v14);
      free(v8);
      SSFileLog();
    }
  }
  else
  {
  }
  id v10 = a1;
  objc_sync_enter(v10);
  double v11 = [v10 _cachedSubscriptionEntitlementsDictionary];
  id v12 = [v11 mutableCopy];

  if (v12)
  {
    [v12 removeObjectForKey:kCacheTimestampKey];
    [v10 _setCachedSubscriptionEntitlementsDictionary:v12];
  }

  objc_sync_exit(v10);
  [v10 _notifyClientsOfChangedSubscriptionEntitlements];
}

+ (void)setCachedSubscriptionEntitlements:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5)
    {
      int v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      LODWORD(v24) = 138412290;
      *(void *)((char *)&v24 + 4) = objc_opt_class();
      id v9 = *(id *)((char *)&v24 + 4);
      LODWORD(v23) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        double v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v24, v23, v24);
        free(v10);
        SSFileLog();
      }
    }
    else
    {
    }
    id v12 = [v4 mutableCopy];
    v20 = +[NSDate date];
    [v12 setObject:v20 forKeyedSubscript:kCacheTimestampKey];

    id v21 = a1;
    objc_sync_enter(v21);
    [v21 _setCachedSubscriptionEntitlementsDictionary:v12];
  }
  else
  {
    id v12 = [a1 _cachedSubscriptionEntitlementsPath];
    uint64_t v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13)
    {
      uint64_t v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15)
    {
      LODWORD(v24) = 138412290;
      *(void *)((char *)&v24 + 4) = objc_opt_class();
      id v17 = *(id *)((char *)&v24 + 4);
      LODWORD(v23) = 12;
      unsigned int v18 = (void *)_os_log_send_and_compose_impl();

      if (v18)
      {
        int v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v24, v23, v24);
        free(v18);
        SSFileLog();
      }
    }
    else
    {
    }
    objc_sync_enter(a1);
    v22 = +[NSFileManager defaultManager];
    [v22 removeItemAtPath:v12 error:0];
  }
  objc_sync_exit(a1);

  [a1 _notifyClientsOfChangedSubscriptionEntitlements];
}

+ (id)_cachedSubscriptionEntitlementsDictionary
{
  v2 = [a1 _cachedSubscriptionEntitlementsPath];
  v3 = +[NSData dataWithContentsOfFile:v2];
  if (!v3)
  {
    id v13 = 0;
    goto LABEL_21;
  }
  id v16 = 0;
  id v4 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:0 error:&v16];
  id v5 = v16;
  if (v5)
  {
    unsigned int v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      unsigned int v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      id v10 = objc_opt_class();
      int v17 = 138412546;
      unsigned int v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      id v11 = v10;
      LODWORD(v15) = 22;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v17, v15);
      free(v12);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count]) {
    id v13 = v4;
  }
  else {
    id v13 = 0;
  }

LABEL_21:

  return v13;
}

+ (id)_cachedSubscriptionEntitlementsPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  v15[0] = v3;
  v15[1] = @"com.apple.itunesstored";
  v15[2] = @"SubscriptionEntitlements_v2.plist";
  id v4 = +[NSArray arrayWithObjects:v15 count:3];
  id v5 = +[NSString pathWithComponents:v4];
  if (!v5)
  {
    unsigned int v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      unsigned int v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      LODWORD(v14) = 138412290;
      *(void *)((char *)&v14 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      id v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v14, v13, v14);
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

+ (void)_notifyClientsOfChangedSubscriptionEntitlements
{
  v2 = (const char *)[kSSVNotificationSubscriptionEntitlementsChanged UTF8String];

  notify_post(v2);
}

+ (void)_setCachedSubscriptionEntitlementsDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _cachedSubscriptionEntitlementsPath];
  if ([v5 length])
  {
    id v17 = 0;
    unsigned int v6 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v17];
    id v7 = v17;
    if (!v7)
    {
LABEL_15:
      objc_msgSend(v6, "writeToFile:atomically:", v5, 1, v15);

      goto LABEL_16;
    }
    int v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      int v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      id v12 = objc_opt_class();
      int v18 = 138412546;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      id v21 = v7;
      id v13 = v12;
      LODWORD(v16) = 22;
      uint64_t v15 = &v18;
      long long v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
      free(v14);
      uint64_t v15 = (int *)v11;
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_16:
}

@end