@interface PCStatusConditionsService
+ (PCStatusConditionsService)sharedInstance;
+ (int64_t)maxVersion;
- (BOOL)evaluate:(id)a3 error:(id *)a4;
- (NSMutableDictionary)cachedEvaluations;
- (PCStatusConditionsService)init;
- (id)notificationObject;
- (void)clearCache;
- (void)setCachedEvaluations:(id)a3;
- (void)setNotificationObject:(id)a3;
@end

@implementation PCStatusConditionsService

+ (PCStatusConditionsService)sharedInstance
{
  if (qword_10028D2B0 != -1) {
    dispatch_once(&qword_10028D2B0, &stru_100239010);
  }
  v2 = (void *)qword_10028D2A8;

  return (PCStatusConditionsService *)v2;
}

- (PCStatusConditionsService)init
{
  v14.receiver = self;
  v14.super_class = (Class)PCStatusConditionsService;
  v2 = [(PCStatusConditionsService *)&v14 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    cachedEvaluations = v2->_cachedEvaluations;
    v2->_cachedEvaluations = (NSMutableDictionary *)v3;

    objc_initWeak(&location, v2);
    v5 = +[NSDistributedNotificationCenter defaultCenter];
    uint64_t v6 = kAPAccountChangedNotification;
    uint64_t v7 = kAPAdLibBundleID;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100191BA0;
    v11[3] = &unk_100234A68;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v5 addObserverForName:v6 object:v7 queue:0 usingBlock:v11];
    id notificationObject = v2->_notificationObject;
    v2->_id notificationObject = (id)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)clearCache
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_cachedEvaluations removeAllObjects];
  objc_sync_exit(obj);
}

+ (int64_t)maxVersion
{
  return 1;
}

- (BOOL)evaluate:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (a4) {
    *a4 = 0;
  }
  if (!v7 || ![v7 length])
  {
    if (a4)
    {
      +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1122 userInfo:0];
      unsigned __int8 v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v4 = 0;
    }
    goto LABEL_51;
  }
  v9 = self;
  objc_sync_enter(v9);
  v10 = [(NSMutableDictionary *)v9->_cachedEvaluations objectForKey:v8];
  if (v10)
  {
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = +[APIDAccountProvider privateUserAccount];
      v13 = [v12 iTunesDSID];
      *(_DWORD *)buf = 136643587;
      v50 = "-[PCStatusConditionsService evaluate:error:]";
      __int16 v51 = 2114;
      v52 = v8;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040;
      __int16 v55 = 2112;
      v56 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{sensitive}s]: fetching previously evaluated status condition expression from the cache (%{public}@) for DSID %{mask.hash}@", buf, 0x2Au);
    }
    unsigned __int8 v4 = [v10 BOOLValue];
  }

  objc_sync_exit(v9);
  if (!v10)
  {
    v37 = [v8 dataUsingEncoding:4];
    v39 = +[NSJSONSerialization JSONObjectWithData:v37 options:4 error:a4];
    if (v39)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id obj = v39;
        id v14 = 0;
        id v15 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (!v15)
        {
          v40 = 0;
          goto LABEL_35;
        }
        v40 = 0;
        uint64_t v16 = *(void *)v45;
LABEL_17:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v44 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          v19 = [v18 objectForKeyedSubscript:@"version"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                *a4 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1116 userInfo:0];
              }

LABEL_46:
              goto LABEL_47;
            }
          }
          id v20 = [v19 integerValue];
          if ((uint64_t)v20 <= +[PCStatusConditionsService maxVersion]&& (uint64_t)v20 > (uint64_t)v14)
          {
            id v21 = v18;

            id v14 = v20;
            v40 = v21;
          }

          if (v15 == (id)++v17)
          {
            id v15 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v15) {
              goto LABEL_17;
            }
LABEL_35:

            +[PCStatusConditionsService setVersion:v14];
            if ((uint64_t)+[PCStatusConditionsService version] <= 0)
            {
              if (a4)
              {
                +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1116 userInfo:0];
                unsigned __int8 v4 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
LABEL_47:
                unsigned __int8 v4 = 0;
              }
              goto LABEL_48;
            }
            if (v40)
            {
              v22 = [v40 objectForKeyedSubscript:@"expression"];
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
              {
                if (qword_10028D2B8 != -1) {
                  dispatch_once(&qword_10028D2B8, &stru_100239030);
                }
                id v43 = 0;
                v23 = [[PCSCTreeNode alloc] initWithExpression:v22 version:+[PCStatusConditionsService version] andParent:0 error:&v43];
                v24 = (PCStatusConditionsService *)v43;
                if (v24)
                {
                  v25 = v24;
                  LOBYTE(v26) = 0;
                  goto LABEL_68;
                }
                id v42 = 0;
                v36 = +[PCSCTreeNode _translateRootNodeToExpressionFormat:v23 error:&v42];
                v25 = (PCStatusConditionsService *)v42;
                if (v36)
                {
                  v30 = [[APTargetingExpression alloc] initWithDictionary:v36];
                  v31 = [(APTargetingExpression *)v30 error];
                  BOOL v32 = v31 == 0;

                  if (!v32)
                  {
                    v33 = [(APTargetingExpression *)v30 error];
                    LOBYTE(v26) = 0;
                    goto LABEL_59;
                  }
                  v41 = v25;
                  BOOL v26 = [(APTargetingExpression *)v30 evaluate:&v41];
                  v33 = v41;

                  if (!v33)
                  {
                    v25 = v9;
                    objc_sync_enter(v25);
                    cachedEvaluations = v9->_cachedEvaluations;
                    v35 = +[NSNumber numberWithBool:v26];
                    [(NSMutableDictionary *)cachedEvaluations setObject:v35 forKey:v8];

                    objc_sync_exit(v25);
                    v33 = 0;
LABEL_59:
                  }
                  v25 = v33;
                }
                else
                {
                  LOBYTE(v26) = 0;
                }

LABEL_68:
                if (v25) {
                  unsigned __int8 v4 = 0;
                }
                else {
                  unsigned __int8 v4 = v26;
                }
                if (a4 && v25)
                {
                  unsigned __int8 v4 = 0;
                  *a4 = v25;
                }
              }
              else if (a4)
              {
                +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1112 userInfo:0];
                unsigned __int8 v4 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                unsigned __int8 v4 = 0;
              }

LABEL_48:
              v27 = v40;
            }
            else if (a4)
            {
              id v29 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1116 userInfo:0];
              v27 = 0;
              unsigned __int8 v4 = 0;
              *a4 = v29;
            }
            else
            {
              v27 = 0;
              unsigned __int8 v4 = 0;
            }

LABEL_50:
            goto LABEL_51;
          }
        }
        if (a4)
        {
          *a4 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1123 userInfo:0];
        }
        goto LABEL_46;
      }
      if (a4)
      {
        +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:-1112 userInfo:0];
        unsigned __int8 v4 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
    }
    unsigned __int8 v4 = 0;
    goto LABEL_50;
  }
LABEL_51:

  return v4 & 1;
}

- (NSMutableDictionary)cachedEvaluations
{
  return self->_cachedEvaluations;
}

- (void)setCachedEvaluations:(id)a3
{
}

- (id)notificationObject
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setNotificationObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationObject, 0);

  objc_storeStrong((id *)&self->_cachedEvaluations, 0);
}

@end