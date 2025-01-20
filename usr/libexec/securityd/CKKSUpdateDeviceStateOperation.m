@interface CKKSUpdateDeviceStateOperation
- (BOOL)rateLimit;
- (CKKSOperationDependencies)deps;
- (CKKSUpdateDeviceStateOperation)initWithOperationDependencies:(id)a3 rateLimit:(BOOL)a4 ckoperationGroup:(id)a5;
- (CKOperationGroup)group;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setGroup:(id)a3;
- (void)setRateLimit:(BOOL)a3;
@end

@implementation CKKSUpdateDeviceStateOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);

  objc_storeStrong((id *)(&self->_rateLimit + 6), 0);
}

- (void)setRateLimit:(BOOL)a3
{
  self->_rateLimit = a3;
}

- (BOOL)rateLimit
{
  return self->_rateLimit;
}

- (void)setGroup:(id)a3
{
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 134, 1);
}

- (void)groupStart
{
  v2 = [(CKKSUpdateDeviceStateOperation *)self deps];
  v28 = [v2 accountStateTracker];

  if (v28)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v3 = [v28 ckdeviceIDInitialized];
    id v4 = [v3 wait:200000000000];

    if (v4)
    {
      v5 = sub_1000CD884(@"ckksdevice", 0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CK device ID not initialized, likely quitting", buf, 2u);
      }
    }
    uint64_t v26 = [v28 ckdeviceID];
    if (v26)
    {
      v6 = [v28 cdpCapableiCloudAccountInitialized:v26];
      id v7 = [v6 wait:500000000];

      if (v7)
      {
        v8 = sub_1000CD884(@"ckksdevice", 0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Not quite sure if the account is HSA2/Managed or not. Probably will quit?", buf, 2u);
        }
      }
      v9 = +[NSHashTable weakObjectsHashTable];
      v10 = [(CKKSUpdateDeviceStateOperation *)self deps];
      v11 = [v10 databaseProvider];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v12 = [(CKKSUpdateDeviceStateOperation *)self deps];
      id obj = [v12 activeManagedViews];

      id v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v35;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_1000A4B24;
            v31[3] = &unk_1002F8D28;
            v31[4] = v16;
            v31[5] = self;
            objc_copyWeak(&v33, location);
            id v17 = v9;
            id v32 = v17;
            [v11 dispatchSyncWithSQLTransaction:v31];

            objc_destroyWeak(&v33);
          }
          id v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v13);
        v9 = v17;
      }
      v18 = obj;
    }
    else
    {
      v22 = sub_1000CD884(@"ckksdevice", 0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "CK device ID not initialized, quitting", buf, 2u);
      }

      v42[0] = @"CK device ID missing";
      v41[0] = NSLocalizedDescriptionKey;
      v41[1] = NSUnderlyingErrorKey;
      v23 = [v28 ckdeviceIDError];
      v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = +[NSNull null];
      }
      v9 = v25;

      v42[1] = v9;
      v11 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
      v18 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:59 userInfo:v11];
      [(CKKSResultOperation *)self setError:v18];
    }

    objc_destroyWeak(location);
  }
  else
  {
    v19 = sub_1000CD884(@"ckksdevice", 0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "no AccountTracker object", (uint8_t *)location, 2u);
    }

    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    CFStringRef v44 = @"no AccountTracker object";
    v20 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v21 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:57 userInfo:v20];
    [(CKKSResultOperation *)self setError:v21];
  }
}

- (CKKSUpdateDeviceStateOperation)initWithOperationDependencies:(id)a3 rateLimit:(BOOL)a4 ckoperationGroup:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKKSUpdateDeviceStateOperation;
  v11 = [(CKKSGroupOperation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 134), a3);
    objc_storeStrong((id *)(v12 + 142), a5);
    v12[128] = a4;
  }

  return (CKKSUpdateDeviceStateOperation *)v12;
}

@end