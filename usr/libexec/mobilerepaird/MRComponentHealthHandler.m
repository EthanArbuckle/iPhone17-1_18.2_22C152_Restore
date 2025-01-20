@interface MRComponentHealthHandler
+ (id)sharedInstance;
- (id)_init;
- (void)getCurrentSystemHealthStatusForComponentsInternal:(unint64_t)a3 WithReply:(id)a4;
- (void)postComponentStatusEventFor:(unint64_t)a3 status:(unint64_t)a4 withReply:(id)a5;
- (void)sendDailyAnalyticsForModuleType:(id)a3;
- (void)sendFailedComponentStats;
@end

@implementation MRComponentHealthHandler

- (id)_init
{
  v19.receiver = self;
  v19.super_class = (Class)MRComponentHealthHandler;
  v2 = [(MRComponentHealthHandler *)&v19 init];
  if (v2)
  {
    v18 = objc_opt_new();
    v20[0] = v18;
    v17 = objc_opt_new();
    v20[1] = v17;
    v16 = objc_opt_new();
    v20[2] = v16;
    v15 = objc_opt_new();
    v20[3] = v15;
    v3 = objc_opt_new();
    v20[4] = v3;
    v4 = objc_opt_new();
    v20[5] = v4;
    v5 = objc_opt_new();
    v20[6] = v5;
    v6 = objc_opt_new();
    v20[7] = v6;
    v7 = objc_opt_new();
    v20[8] = v7;
    v8 = objc_opt_new();
    v20[9] = v8;
    v9 = objc_opt_new();
    v20[10] = v9;
    v10 = objc_opt_new();
    v20[11] = v10;
    v11 = objc_opt_new();
    v20[12] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v20 count:13];
    supportedComponentAuth = v2->supportedComponentAuth;
    v2->supportedComponentAuth = (NSArray *)v12;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_10001EAA8 != -1) {
    dispatch_once(&qword_10001EAA8, &stru_1000186D8);
  }
  v2 = (void *)qword_10001EAA0;

  return v2;
}

- (void)postComponentStatusEventFor:(unint64_t)a3 status:(unint64_t)a4 withReply:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  if (a3 - 3 <= 9)
  {
    v7 = [(__objc2_class *)*off_100018720[a3 - 3] sharedSingleton];
    [v7 postComponentStatus:a4];
  }
  v8[2](v8, 1, 0);
}

- (void)getCurrentSystemHealthStatusForComponentsInternal:(unint64_t)a3 WithReply:(id)a4
{
  v6 = (void (**)(id, uint64_t, id, void))a4;
  v7 = objc_opt_new();
  v8 = (void *)MGCopyAnswer();
  v9 = [v8 intValue];

  v10 = objc_opt_new();
  unsigned int v11 = [v10 isSupportedIPad];

  if (v11)
  {
    v9 = handleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", buf, 2u);
    }

    if (a3 != -1)
    {
      uint64_t v12 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a3 != -1 || v9 != 1) {
      goto LABEL_22;
    }
  }
  v25 = v6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v13 = self->supportedComponentAuth;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v19 = [v18 copyComponentStatus];
        v20 = [v18 componentName];

        if (v20)
        {
          v21 = +[NSNumber numberWithInteger:v19];
          v22 = v21;
          if (!v21)
          {
            v9 = +[NSNull null];
            v22 = v9;
          }
          v23 = [v18 componentName];
          [v7 setObject:v22 forKeyedSubscript:v23];

          if (!v21) {
        }
          }
      }
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v15);
  }

  uint64_t v12 = 1;
  v6 = v25;
LABEL_22:
  id v24 = [v7 copy];
  v6[2](v6, v12, v24, 0);
}

- (void)sendFailedComponentStats
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->supportedComponentAuth;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (((unint64_t)objc_msgSend(v8, "copyComponentStatus", (void)v10) & 0x8000000000000000) != 0)
        {
          v9 = [v8 componentName];
          [(MRComponentHealthHandler *)self sendDailyAnalyticsForModuleType:v9];
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)sendDailyAnalyticsForModuleType:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

- (void).cxx_destruct
{
}

@end