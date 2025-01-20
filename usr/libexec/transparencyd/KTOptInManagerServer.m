@interface KTOptInManagerServer
+ (id)getOptInHistory:(id)a3 store:(id)a4 error:(id *)a5;
+ (id)getOptInHistoryDiagnostic:(id)a3 store:(id)a4;
+ (id)notificationKeyForApplication:(id)a3;
+ (id)optInKeyForApplication:(id)a3;
+ (void)optInManagerOptInState:(id)a3 sync:(BOOL)a4 store:(id)a5 complete:(id)a6;
- (BOOL)kvsOptInState;
- (BOOL)outstandingSetSignal;
- (Class)account;
- (KTContext)context;
- (KTKVSProtocol)store;
- (KTOptInManagerServer)initWithApplication:(id)a3;
- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4;
- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5;
- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5 account:(Class)a6 store:(id)a7;
- (KTSMManager)stateMachine;
- (NSString)applicationId;
- (OS_dispatch_group)setGroup;
- (OS_dispatch_queue)setQueue;
- (id)emailPrefix;
- (id)getAggregateOptInState:(id *)a3;
- (id)getCurrentOptInEntry:(id *)a3;
- (id)getOptInHistory:(id *)a3;
- (id)notificationKey;
- (id)optInKey;
- (int)notifyToken;
- (void)changeOptInState:(unint64_t)a3 dataStore:(id)a4 completionBlock:(id)a5;
- (void)dealloc;
- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4;
- (void)getOptInState:(id)a3;
- (void)handleCDPReset:(id)a3;
- (void)handleOptInStateChange:(id)a3;
- (void)setAccount:(Class)a3;
- (void)setApplicationId:(id)a3;
- (void)setContext:(id)a3;
- (void)setNotifyToken:(int *)a3;
- (void)setOutstandingSetSignal:(BOOL)a3;
- (void)setSetGroup:(id)a3;
- (void)setSetQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation KTOptInManagerServer

+ (id)optInKeyForApplication:(id)a3
{
  return +[NSString stringWithFormat:@"%@.optIn", a3];
}

+ (id)notificationKeyForApplication:(id)a3
{
  return +[KTOptInManager notificationKeyForApplication:a3];
}

- (KTOptInManagerServer)initWithApplication:(id)a3
{
  return [(KTOptInManagerServer *)self initWithApplication:a3 context:0];
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4
{
  return [(KTOptInManagerServer *)self initWithApplication:a3 context:a4 stateMachine:0];
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(KTOptInManagerServer *)self initWithApplication:v10 context:v9 stateMachine:v8 account:objc_opt_class() store:0];

  return v11;
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5 account:(Class)a6 store:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = +[TransparencyApplication applicationValueForIdentifier:v12];

  if (v16)
  {
    v29.receiver = self;
    v29.super_class = (Class)KTOptInManagerServer;
    v17 = [(KTOptInManagerServer *)&v29 init];
    v18 = v17;
    if (v17)
    {
      [(KTOptInManagerServer *)v17 setApplicationId:v12];
      [(KTOptInManagerServer *)v18 setContext:v13];
      [(KTOptInManagerServer *)v18 setStateMachine:v14];
      if (v15)
      {
        [(KTOptInManagerServer *)v18 setStore:v15];
      }
      else
      {
        v21 = +[KTKVSSoftStore sharedStore];
        [(KTOptInManagerServer *)v18 setStore:v21];
      }
      [(KTOptInManagerServer *)v18 setAccount:a6];
      dispatch_group_t v22 = dispatch_group_create();
      [(KTOptInManagerServer *)v18 setSetGroup:v22];

      v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v24 = dispatch_queue_create("KTOptInManagerSet", v23);
      [(KTOptInManagerServer *)v18 setSetQueue:v24];

      v25 = +[TransparencyDistributedReadNotificationCenter defaultCenter];
      [v25 addObserver:v18 selector:"handleCDPReset:" name:@"com.apple.security.resetprotecteddata.complete"];

      v26 = +[TransparencyDistributedReadNotificationCenter defaultCenter];
      v27 = [(KTOptInManagerServer *)v18 notificationKey];
      [v26 addObserver:v18 selector:"handleOptInStateChange:" name:v27];
    }
    self = v18;
    v20 = self;
  }
  else
  {
    if (qword_10032F108 != -1) {
      dispatch_once(&qword_10032F108, &stru_1002C6BB0);
    }
    v19 = qword_10032F110;
    if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  v3 = +[TransparencyDistributedReadNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"com.apple.security.resetprotecteddata.complete"];

  v4 = +[TransparencyDistributedReadNotificationCenter defaultCenter];
  v5 = [(KTOptInManagerServer *)self notificationKey];
  [v4 removeObserver:self name:v5];

  notifyToken = self->_notifyToken;
  if (notifyToken)
  {
    notify_cancel(*notifyToken);
    v7 = self->_notifyToken;
  }
  else
  {
    v7 = 0;
  }
  free(v7);
  v8.receiver = self;
  v8.super_class = (Class)KTOptInManagerServer;
  [(KTOptInManagerServer *)&v8 dealloc];
}

+ (void)optInManagerOptInState:(id)a3 sync:(BOOL)a4 store:(id)a5 complete:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11 && ([v11 storeReady] & 1) != 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001CA14C;
    v19[3] = &unk_1002C6BD8;
    id v23 = a1;
    id v20 = v10;
    id v13 = v11;
    id v21 = v13;
    id v22 = v12;
    id v14 = objc_retainBlock(v19);
    id v15 = v14;
    if (v8)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1001CA268;
      v17[3] = &unk_1002B9CA0;
      v18 = v14;
      [v13 forceSync:v17];
    }
    else
    {
      ((void (*)(void *))v14[2])(v14);
    }
  }
  else
  {
    v16 = +[TransparencyError errorWithDomain:kTransparencyErrorInterface code:-308 description:@"KVS store not yet loaded"];
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v16);
  }
}

- (id)optInKey
{
  v2 = [(KTOptInManagerServer *)self applicationId];
  v3 = +[KTOptInManagerServer optInKeyForApplication:v2];

  return v3;
}

- (id)notificationKey
{
  v2 = [(KTOptInManagerServer *)self applicationId];
  v3 = +[KTOptInManager notificationKeyForApplication:v2];

  return v3;
}

- (id)getOptInHistory:(id *)a3
{
  v5 = [(KTOptInManagerServer *)self store];
  unsigned __int8 v6 = [v5 storeReady];

  if (v6)
  {
    v7 = objc_opt_class();
    id v8 = [(KTOptInManagerServer *)self applicationId];
    id v9 = [(KTOptInManagerServer *)self store];
    id v10 = [v7 getOptInHistory:v8 store:v9 error:a3];
  }
  else
  {
    id v11 = +[TransparencyError errorWithDomain:kTransparencyErrorInterface code:-308 description:@"KVS store not yet loaded"];
    id v8 = v11;
    id v10 = 0;
    if (a3 && v11)
    {
      id v8 = v11;
      id v10 = 0;
      *a3 = v8;
    }
  }

  return v10;
}

+ (id)getOptInHistory:(id)a3 store:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[KTOptInManagerServer optInKeyForApplication:v7];
  id v10 = +[TransparencyAnalytics formatEventName:@"OptInServerGet" application:v7];
  id v11 = [v8 objectForKey:v9];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = v8;
      v33 = v10;
      id v31 = v9;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v36;
        id obj = v12;
LABEL_5:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          id v18 = v17;
          v19 = [v18 objectAtIndexedSubscript:0];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

LABEL_24:
            v28 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-283 description:@"Opt-in entry has wrong value types"];
            objc_super v29 = +[TransparencyAnalytics logger];
            [v29 logResultForEvent:v33 hardFailure:1 result:v28];

            if (a5 && v28) {
              *a5 = v28;
            }

LABEL_28:
            id v9 = v31;
            id v8 = v32;
            id v10 = v33;
            id v12 = obj;
            goto LABEL_29;
          }
          id v20 = [v18 objectAtIndexedSubscript:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_24;
          }

          if (v14 == (id)++v16)
          {
            id v12 = obj;
            id v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
            if (v14) {
              goto LABEL_5;
            }
            goto LABEL_13;
          }
        }
        id v18 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-282 description:@"Latest opt-in entry is not an array"];
        v27 = +[TransparencyAnalytics logger];
        [v27 logResultForEvent:v33 hardFailure:1 result:v18];

        if (!a5) {
          goto LABEL_28;
        }
        id v9 = v31;
        id v8 = v32;
        id v12 = obj;
        if (v18)
        {
          id v18 = v18;
          *a5 = v18;
        }
        id v10 = v33;
LABEL_29:

        id v23 = 0;
        goto LABEL_30;
      }
LABEL_13:

      id v22 = +[TransparencyAnalytics logger];
      id v10 = v33;
      [v22 logSuccessForEventNamed:v33];

      id v23 = [v12 sortedArrayUsingComparator:&stru_1002C6C18];
      id v9 = v31;
      id v8 = v32;
LABEL_30:
    }
    else
    {
      v25 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-281 description:@"Top-level opt-in value is not a array"];
      v26 = +[TransparencyAnalytics logger];
      [v26 logResultForEvent:v10 hardFailure:1 result:v25];

      if (a5 && v25) {
        *a5 = v25;
      }

      id v23 = 0;
    }
  }
  else
  {
    dispatch_queue_t v24 = +[TransparencyAnalytics logger];
    [v24 logSuccessForEventNamed:v10];

    id v23 = +[NSArray array];
  }

  return v23;
}

+ (id)getOptInHistoryDiagnostic:(id)a3 store:(id)a4
{
  id v24 = 0;
  v4 = [a1 getOptInHistory:a3 store:a4 error:&v24];
  id v5 = v24;
  unsigned __int8 v6 = v5;
  if (v4)
  {
    id v18 = v5;
    id v19 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((unint64_t)[v12 count] >= 2)
          {
            id v13 = [v12 objectAtIndexedSubscript:0];
            id v14 = [v12 objectAtIndexedSubscript:1];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v25[0] = @"date";
                uint64_t v15 = [v13 kt_toISO_8601_UTCString];
                v25[1] = @"state";
                v26[0] = v15;
                v26[1] = v14;
                uint64_t v16 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
                [v19 addObject:v16];
              }
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v9);
    }

    unsigned __int8 v6 = v18;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)getCurrentOptInEntry:(id *)a3
{
  v3 = [(KTOptInManagerServer *)self getOptInHistory:a3];
  v4 = [v3 lastObject];

  return v4;
}

- (void)getOptInState:(id)a3
{
  v4 = (void (**)(id, id, void *, void))a3;
  id v10 = 0;
  uint64_t v5 = [(KTOptInManagerServer *)self getCurrentOptInEntry:&v10];
  unint64_t v6 = (unint64_t)v10;
  if (v5 | v6)
  {
    if (v5)
    {
      id v7 = [(id)v5 objectAtIndexedSubscript:1];
      id v8 = [v7 BOOLValue];

      id v9 = [(id)v5 objectAtIndexedSubscript:0];
      v4[2](v4, v8, v9, 0);
    }
    else
    {
      v4[2](v4, 0, 0, v6);
    }
  }
  else
  {
    v4[2](v4, 0, 0, 0);
  }
}

- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  unint64_t v6 = (void (**)(id, uint64_t, void, id))a4;
  id v7 = [(KTOptInManagerServer *)self stateMachine];
  id v8 = [v7 deps];
  id v9 = [v8 cloudRecords];

  if (v9)
  {
    id v10 = [(KTOptInManagerServer *)self applicationId];
    id v23 = 0;
    id v11 = [v9 getAggregateOptInStateForApplication:v10 error:&v23];
    id v12 = v23;

    if (v11 && [v11 state]) {
      v6[2](v6, 1, 0, v12);
    }
    else {
      v6[2](v6, 0, 0, 0);
    }
  }
  else
  {
    id v13 = [(KTOptInManagerServer *)self store];
    unsigned __int8 v14 = [v13 storeReady];

    if (v14)
    {
      if (!v4)
      {
        [(KTOptInManagerServer *)self getOptInState:v6];
        goto LABEL_13;
      }
      uint64_t v15 = [(KTOptInManagerServer *)self applicationId];
      uint64_t v16 = +[TransparencyAnalytics formatEventName:@"OptInServerGet" application:v15];

      v17 = [(KTOptInManagerServer *)self store];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1001CAEC8;
      v19[3] = &unk_1002C6C40;
      id v20 = v16;
      long long v21 = self;
      long long v22 = v6;
      id v18 = v16;
      [v17 forceSync:v19];
    }
    else
    {
      id v18 = +[TransparencyError errorWithDomain:kTransparencyErrorInterface code:-308 description:@"KVS store not yet loaded"];
      v6[2](v6, 0, 0, v18);
    }
  }
LABEL_13:
}

- (BOOL)kvsOptInState
{
  v2 = [(KTOptInManagerServer *)self getCurrentOptInEntry:0];
  v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 objectAtIndexedSubscript:1];
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)changeOptInState:(unint64_t)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = [(KTOptInManagerServer *)self setQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CB084;
  block[3] = &unk_1002C6C68;
  block[4] = self;
  id v11 = v7;
  unint64_t v12 = a3;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (id)emailPrefix
{
  v3 = [(KTOptInManagerServer *)self applicationId];
  if ([v3 isEqualToString:kKTApplicationIdentifierIDS]) {
    goto LABEL_4;
  }
  BOOL v4 = [(KTOptInManagerServer *)self applicationId];
  if ([v4 isEqualToString:kKTApplicationIdentifierIDSFaceTime])
  {

LABEL_4:
LABEL_5:
    unsigned __int8 v5 = [(KTOptInManagerServer *)self applicationId];
    unint64_t v6 = +[TransparencyApplication applicationPrefixForIdentifier:v5];

    goto LABEL_6;
  }
  id v8 = [(KTOptInManagerServer *)self applicationId];
  unsigned __int8 v9 = [v8 isEqualToString:kKTApplicationIdentifierIDSMultiplex];

  if (v9) {
    goto LABEL_5;
  }
  unint64_t v6 = 0;
LABEL_6:

  return v6;
}

- (void)handleCDPReset:(id)a3
{
  id v23 = a3;
  if (qword_10032F108 != -1) {
    dispatch_once(&qword_10032F108, &stru_1002C6C88);
  }
  BOOL v4 = qword_10032F110;
  if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "received CDP Reset notification", buf, 2u);
  }
  id v30 = 0;
  unsigned __int8 v5 = +[TransparencyAccount primaryAccount:&v30];
  id v6 = v30;
  if (v5)
  {
    id v7 = [v5 aa_primaryEmail];
    id v8 = [(KTOptInManagerServer *)self emailPrefix];
    if (v8)
    {
      unsigned __int8 v9 = +[NSString stringWithFormat:@"%@://mailto:%@", v8, v7];
      id v10 = [(KTOptInManagerServer *)self applicationId];
      id v29 = v6;
      id v11 = +[TransparencyRPCRequestBuilder buildQueryRequest:v9 application:v10 error:&v29];
      id v22 = v29;

      if (v11)
      {
        if (qword_10032F108 != -1) {
          dispatch_once(&qword_10032F108, &stru_1002C6D08);
        }
        unint64_t v12 = qword_10032F110;
        if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 141558274;
          *(void *)&uint8_t buf[4] = 1752392040;
          __int16 v32 = 2112;
          v33 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "querying KT server opt-in state for %{mask.hash}@", buf, 0x16u);
        }
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        id v13 = +[NSUUID UUID];
        unsigned __int8 v14 = [(KTOptInManagerServer *)self context];
        uint64_t v15 = [v14 logClient];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1001CB900;
        v24[3] = &unk_1002C6DD8;
        objc_copyWeak(&v28, (id *)buf);
        id v25 = v11;
        id v16 = v13;
        id v26 = v16;
        id v27 = v7;
        [v15 fetchQuery:v25 uuid:v16 userInitiated:0 completionHandler:v24];

        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (qword_10032F108 != -1) {
          dispatch_once(&qword_10032F108, &stru_1002C6CE8);
        }
        long long v21 = qword_10032F110;
        if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to check opt-in after CDP reset, no query request: %@", buf, 0xCu);
        }
      }

      id v6 = v22;
    }
    else
    {
      if (qword_10032F108 != -1) {
        dispatch_once(&qword_10032F108, &stru_1002C6CC8);
      }
      id v18 = (void *)qword_10032F110;
      if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        id v20 = [(KTOptInManagerServer *)self applicationId];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "skipping opt in check after CDP reset for %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (qword_10032F108 != -1) {
      dispatch_once(&qword_10032F108, &stru_1002C6CA8);
    }
    v17 = qword_10032F110;
    if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to check opt-in after CDP reset, no account: %@", buf, 0xCu);
    }
  }
}

- (void)handleOptInStateChange:(id)a3
{
  id v4 = a3;
  if (qword_10032F108 != -1) {
    dispatch_once(&qword_10032F108, &stru_1002C6DF8);
  }
  unsigned __int8 v5 = qword_10032F110;
  if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got opt-in change notification", buf, 2u);
  }
  id v19 = 0;
  id v6 = [(KTOptInManagerServer *)self getCurrentOptInEntry:&v19];
  id v7 = v19;
  if (v7 || !v6)
  {
    if (qword_10032F108 != -1) {
      dispatch_once(&qword_10032F108, &stru_1002C6E18);
    }
    uint64_t v10 = qword_10032F110;
    if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      id v11 = "failed to get current opt-in state: %@";
      unint64_t v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0xCu);
    }
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:1];
    unsigned __int8 v9 = [v8 BOOLValue];

    if (v9)
    {
      id v7 = 0;
      goto LABEL_19;
    }
    unsigned __int8 v14 = [(KTOptInManagerServer *)self context];
    uint64_t v15 = [v14 followUp];
    id v18 = 0;
    unsigned __int8 v16 = [v15 clearAllFollowups:&v18];
    id v7 = v18;

    if ((v16 & 1) == 0)
    {
      if (qword_10032F108 != -1) {
        dispatch_once(&qword_10032F108, &stru_1002C6E38);
      }
      uint64_t v17 = qword_10032F110;
      if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        id v11 = "failed to clear existing follow ups on optOut notification: %@";
        unint64_t v12 = v17;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        goto LABEL_13;
      }
    }
  }
LABEL_19:
}

- (id)getAggregateOptInState:(id *)a3
{
  unsigned __int8 v5 = [(KTOptInManagerServer *)self stateMachine];
  id v6 = [v5 deps];
  id v7 = [v6 cloudRecords];

  if (v7)
  {
    id v8 = [(KTOptInManagerServer *)self applicationId];
    unsigned __int8 v9 = [v7 getAggregateOptInStateForApplication:v8 error:a3];
  }
  else
  {
    if (qword_10032F108 != -1) {
      dispatch_once(&qword_10032F108, &stru_1002C6E58);
    }
    uint64_t v10 = qword_10032F110;
    if (os_log_type_enabled((os_log_t)qword_10032F110, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "no state machine or cloudrecords", v12, 2u);
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (KTKVSProtocol)store
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStore:(id)a3
{
}

- (KTContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (KTContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (KTSMManager)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);

  return (KTSMManager *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (NSString)applicationId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationId:(id)a3
{
}

- (Class)account
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccount:(Class)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int *)a3
{
  self->_notifyToken = a3;
}

- (BOOL)outstandingSetSignal
{
  return self->_outstandingSetSignal;
}

- (void)setOutstandingSetSignal:(BOOL)a3
{
  self->_outstandingSetSignal = a3;
}

- (OS_dispatch_queue)setQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSetQueue:(id)a3
{
}

- (OS_dispatch_group)setGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSetGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setGroup, 0);
  objc_storeStrong((id *)&self->_setQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_applicationId, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_destroyWeak((id *)&self->_context);

  objc_storeStrong((id *)&self->_store, 0);
}

@end