@interface WCDRetrieveInstalledAppsListOperation
+ (id)md5HexDigest:(id)a3;
- (void)doWorkWithCompletionHandler:(id)a3;
@end

@implementation WCDRetrieveInstalledAppsListOperation

- (void)doWorkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = "-[WCDRetrieveInstalledAppsListOperation doWorkWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  id v6 = objc_initWeak((id *)buf, self);
  unsigned int v7 = [(WCDRetrieveInstalledAppsListOperation *)self isCancelled];

  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    [WeakRetained finish];
  }
  else
  {
    v9 = +[NSMutableSet set];
    v10 = +[NRPairedDeviceRegistry sharedInstance];
    v11 = [v10 getActivePairedDevice];

    v12 = +[ACXDeviceConnection sharedDeviceConnection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000CDCC;
    v14[3] = &unk_100044DC0;
    id v18 = v4;
    id v13 = v11;
    id v15 = v13;
    v16 = self;
    id WeakRetained = v9;
    id v17 = WeakRetained;
    objc_copyWeak(&v19, (id *)buf);
    [v12 fetchInstalledApplicationsForPairedDevice:v13 completion:v14];

    objc_destroyWeak(&v19);
  }

  objc_destroyWeak((id *)buf);
}

+ (id)md5HexDigest:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  v5 = +[NSMutableString stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    [v5 appendFormat:@"%02x", md[i]];

  return v5;
}

@end