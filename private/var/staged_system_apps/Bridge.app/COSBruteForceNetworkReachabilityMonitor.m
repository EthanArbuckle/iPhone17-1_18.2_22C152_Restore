@interface COSBruteForceNetworkReachabilityMonitor
+ (id)checkDomains;
+ (void)_issueResponse:(BOOL)a3;
+ (void)checkCompleteStateForResponse:(id)a3 andError:(id)a4;
+ (void)checkServerReachability:(id)a3 withCompletion:(id)a4;
+ (void)checkServerReachabilityWithCompletion:(id)a3;
+ (void)issueResponse;
@end

@implementation COSBruteForceNetworkReachabilityMonitor

+ (id)checkDomains
{
  if (qword_10029B100 != -1) {
    dispatch_once(&qword_10029B100, &stru_1002456B0);
  }
  v2 = (void *)qword_10029B0F8;

  return v2;
}

+ (void)checkServerReachabilityWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008E148;
  v5[3] = &unk_1002456F8;
  id v6 = a3;
  id v7 = a1;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

+ (void)checkCompleteStateForResponse:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = +[NSNumber numberWithInt:v7 == 0];
    v10 = (void *)qword_10029B110;
    v11 = [v6 URL];
    v12 = [v11 absoluteString];
    [v10 setObject:v9 forKeyedSubscript:v12];

    v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v6 URL];
      v15 = [v8 localizedDescription];
      int v23 = 138412802;
      v24 = v14;
      __int16 v25 = 2112;
      v26 = v9;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ did respond? %@ (Error: %@)", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    v16 = [v7 userInfo];
    v9 = [v16 objectForKeyedSubscript:NSURLErrorFailingURLStringErrorKey];

    v17 = pbb_bridge_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v8 localizedDescription];
      int v23 = 138412546;
      v24 = v9;
      __int16 v25 = 2112;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ failed with error Error: %@", (uint8_t *)&v23, 0x16u);
    }
    if (v9) {
      [(id)qword_10029B110 setObject:&__kCFBooleanFalse forKeyedSubscript:v9];
    }
  }

  v19 = [(id)qword_10029B110 allValues];
  id v20 = [v19 count];
  v21 = [a1 checkDomains];
  id v22 = [v21 count];

  if (v20 == v22) {
    [a1 issueResponse];
  }
}

+ (void)issueResponse
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [qword_10029B110 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    LODWORD(v7) = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = [(id)qword_10029B110 objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        uint64_t v7 = v7 & [v9 BOOLValue];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = 1;
  }

  [a1 _issueResponse:v7];
}

+ (void)_issueResponse:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)qword_10029B110;
  qword_10029B110 = 0;

  if (qword_10029B108)
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = +[NSNumber numberWithBool:v3];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Servers Reachable? %@", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(uint64_t, BOOL))(qword_10029B108 + 16))(qword_10029B108, v3);
    uint64_t v7 = (void *)qword_10029B108;
    qword_10029B108 = 0;
  }
}

+ (void)checkServerReachability:(id)a3 withCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008EA34;
  v7[3] = &unk_1002441B0;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

@end