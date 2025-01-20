@interface FedStatsDataCohort
+ (BOOL)checkCohortField:(id)a3 forNamespaceID:(id)a4;
+ (id)keysForCohorts:(id)a3 namespaceID:(id)a4 parameters:(id)a5 possibleError:(id *)a6;
+ (id)sharedInstance;
- (FedStatsDataCohort)init;
- (NSDictionary)namespaceMap;
@end

@implementation FedStatsDataCohort

- (FedStatsDataCohort)init
{
  v8.receiver = self;
  v8.super_class = (Class)FedStatsDataCohort;
  v2 = [(FedStatsDataCohort *)&v8 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [v3 pathForResource:@"FedStatsCohortAllowList" ofType:@"plist"];

    uint64_t v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
    namespaceMap = v2->_namespaceMap;
    v2->_namespaceMap = (NSDictionary *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000058DC;
  block[3] = &unk_1000305F8;
  block[4] = a1;
  if (qword_10003DCC0 != -1) {
    dispatch_once(&qword_10003DCC0, block);
  }
  v2 = (void *)qword_10003DCB8;
  return v2;
}

+ (BOOL)checkCohortField:(id)a3 forNamespaceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[FedStatsDataCohort sharedInstance];
  objc_super v8 = [v7 namespaceMap];
  v9 = [v8 objectForKey:v6];

  if (v9) {
    unsigned __int8 v10 = [v9 containsObject:v5];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (id)keysForCohorts:(id)a3 namespaceID:(id)a4 parameters:(id)a5 possibleError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v40 = a5;
  v11 = +[FedStatsDataCohort sharedInstance];
  v12 = [v11 namespaceMap];
  v13 = [v12 objectForKey:v10];

  if (v13)
  {
    v37 = a6;
    id v38 = v10;
    v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v9;
    id v15 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v43;
      v35 = v11;
      id v36 = v9;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v42 + 1) + 8 * v18);
        if (([v13 containsObject:v19] & 1) == 0) {
          break;
        }
        v20 = +[FedStatsCohortFactory cohortQueryFieldByName:v19];
        if (!v20)
        {
          id v9 = v36;
          v29 = v37;
          id v10 = v38;
          if (v37)
          {
            +[NSString stringWithFormat:@"\"%@\" cohort is not implemented.", v19, v34];
            v30 = LABEL_25:;
            uint64_t v31 = +[FedStatsError errorWithCode:900 description:v30];
            v32 = *v29;
            *v29 = (void *)v31;
          }
          goto LABEL_26;
        }
        v21 = v20;
        id v41 = 0;
        v22 = [v20 cohortKeyForParameters:v40 possibleError:&v41];
        v23 = +[_PFLLog framework];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v47 = v19;
          __int16 v48 = 2112;
          id v49 = v22;
          __int16 v50 = 2112;
          id v51 = v38;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "cohortName:cohortKey => %@=%@ for namespace %@", buf, 0x20u);
        }

        if (v41)
        {
          v24 = +[_PFLLog framework];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v47 = v19;
            __int16 v48 = 2112;
            id v49 = v41;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "\"%@\" cohort error while creating the key: %@", buf, 0x16u);
          }
        }
        [v14 addObject:v22];

        if (v16 == (id)++v18)
        {
          id v16 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
          v11 = v35;
          id v9 = v36;
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_17;
        }
      }
      id v9 = v36;
      v29 = v37;
      id v10 = v38;
      if (v37)
      {
        +[NSString stringWithFormat:@"\"%@\" cohort is not approved for \"%@\" namespace.", v19, v38];
        goto LABEL_25;
      }
LABEL_26:

      v25 = 0;
      v11 = v35;
      goto LABEL_27;
    }
LABEL_17:

    v25 = +[NSArray arrayWithArray:v14];
    id v10 = v38;
LABEL_27:
  }
  else
  {
    if (a6)
    {
      v26 = +[NSString stringWithFormat:@"\"%@\" namespace is invalid.", v10];
      v27 = +[FedStatsError errorWithCode:900 description:v26];
      id v28 = *a6;
      *a6 = v27;
    }
    v25 = 0;
  }

  return v25;
}

- (NSDictionary)namespaceMap
{
  return self->_namespaceMap;
}

- (void).cxx_destruct
{
}

@end