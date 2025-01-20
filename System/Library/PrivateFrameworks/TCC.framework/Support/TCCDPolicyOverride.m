@interface TCCDPolicyOverride
+ (BOOL)isMDMPolicyOverrideActive;
+ (id)logHandle;
+ (id)orderedOverridePolicies;
+ (id)queue;
+ (id)useString:(id)a3 orReadFromDefaults:(__CFString *)a4;
+ (unint64_t)evaluateOverridePolicyForAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6;
+ (void)loadPolicyData;
- (BOOL)isActive;
- (BOOL)validateEntry:(id)a3 identifierType:(id)a4 codeRequirementString:(id)a5 serviceName:(id)a6 allowed:(id)a7 comment:(id)a8;
- (NSDictionary)plistDictionary;
- (NSMutableDictionary)policyAccessByIdentifier;
- (NSString)plistFilePath;
- (OS_dispatch_source)watchedFileVnodeSource;
- (TCCDPolicyOverride)init;
- (__CFData)parseCodeRequirements:(id)a3;
- (id)allowedParser:(id)a3;
- (id)watchedPath;
- (unint64_t)_locked_evaluateAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6;
- (void)loadAndParse;
- (void)loadPlist;
- (void)parsePlist;
- (void)setPlistDictionary:(id)a3;
- (void)setPlistFilePath:(id)a3;
- (void)setPolicyAccessByIdentifier:(id)a3;
- (void)setWatchedFileVnodeSource:(id)a3;
- (void)watchPlistChanges;
@end

@implementation TCCDPolicyOverride

+ (id)logHandle
{
  if (qword_1000AC6F8 != -1) {
    dispatch_once(&qword_1000AC6F8, &stru_100096630);
  }
  v2 = (void *)qword_1000AC700;
  return v2;
}

+ (id)queue
{
  if (qword_1000AC6E8 != -1) {
    dispatch_once(&qword_1000AC6E8, &stru_1000965E8);
  }
  v2 = (void *)qword_1000AC6E0;
  return v2;
}

+ (id)useString:(id)a3 orReadFromDefaults:(__CFString *)a4
{
  id v4 = a3;
  return v4;
}

+ (id)orderedOverridePolicies
{
  v2 = (void *)qword_1000AC6F0;
  qword_1000AC6F0 = (uint64_t)&__NSArray0__struct;

  return &__NSArray0__struct;
}

+ (BOOL)isMDMPolicyOverrideActive
{
  v2 = [a1 orderedOverridePolicies];
  v3 = [v2 firstObject];
  unsigned __int8 v4 = [v3 isActive];

  return v4;
}

+ (void)loadPolicyData
{
  v2 = [a1 orderedOverridePolicies];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) loadAndParse];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (unint64_t)evaluateOverridePolicyForAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 1;
  v13 = [a1 orderedOverridePolicies];
  if ([v13 count])
  {
    v14 = [a1 queue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004D4B0;
    v17[3] = &unk_100096610;
    id v18 = v13;
    id v19 = v11;
    v22 = &v24;
    id v20 = v10;
    id v21 = v12;
    v23 = a6;
    dispatch_sync(v14, v17);
  }
  unint64_t v15 = v25[3];

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (TCCDPolicyOverride)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCCDPolicyOverride;
  v2 = [(TCCDPolicyOverride *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [(TCCDPolicyOverride *)v2 setPolicyAccessByIdentifier:v3];

    id v4 = v2;
  }

  return v2;
}

- (BOOL)isActive
{
  id v3 = [(TCCDPolicyOverride *)self plistDictionary];
  if (v3)
  {
    id v4 = [(TCCDPolicyOverride *)self plistDictionary];
    if ([v4 count])
    {
      uint64_t v5 = [(TCCDPolicyOverride *)self policyAccessByIdentifier];
      BOOL v6 = [v5 count] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)loadPlist
{
  id v3 = [(TCCDPolicyOverride *)self plistFilePath];
  if (v3)
  {
    if (qword_1000AC6F8 != -1) {
      dispatch_once(&qword_1000AC6F8, &stru_100096630);
    }
    id v4 = qword_1000AC700;
    if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Override: loading from: %{public}@", buf, 0xCu);
    }
    id v18 = 0;
    uint64_t v5 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v18];
    id v6 = v18;
    long long v7 = v6;
    if (v5)
    {
      id v17 = 0;
      long long v8 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v17];
      id v9 = v17;

      [(TCCDPolicyOverride *)self setPlistDictionary:v8];
      id v10 = [(TCCDPolicyOverride *)self plistDictionary];

      if (!v10)
      {
        if (qword_1000AC6F8 != -1) {
          dispatch_once(&qword_1000AC6F8, &stru_100096630);
        }
        id v11 = qword_1000AC700;
        if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR)) {
          sub_10004ED70((uint64_t)v3, (uint64_t)v9, v11);
        }
      }
      long long v7 = v9;
      goto LABEL_31;
    }
    v13 = [v6 domain];
    if ([v13 isEqualToString:NSCocoaErrorDomain])
    {
      if ([v7 code] == (id)4)
      {

LABEL_26:
        if (qword_1000AC6F8 != -1) {
          dispatch_once(&qword_1000AC6F8, &stru_100096630);
        }
        v16 = qword_1000AC700;
        if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v20 = v3;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Override: no file at: %{public}@", buf, 0xCu);
        }
LABEL_30:
        [(TCCDPolicyOverride *)self setPlistDictionary:0];
LABEL_31:

        goto LABEL_32;
      }
      id v15 = [v7 code];

      if (v15 == (id)260) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    if (qword_1000AC6F8 != -1) {
      dispatch_once(&qword_1000AC6F8, &stru_100096630);
    }
    v14 = qword_1000AC700;
    if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR)) {
      sub_10004ECF8((uint64_t)v3, (uint64_t)v7, v14);
    }
    goto LABEL_30;
  }
  if (qword_1000AC6F8 != -1) {
    dispatch_once(&qword_1000AC6F8, &stru_100096630);
  }
  id v12 = qword_1000AC700;
  if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR)) {
    sub_10004ECB4(v12);
  }
LABEL_32:
}

- (void)loadAndParse
{
  id v3 = +[TCCDPolicyOverride queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DB84;
  block[3] = &unk_100094E78;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

- (__CFData)parseCodeRequirements:(id)a3
{
  return 0;
}

- (id)allowedParser:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)validateEntry:(id)a3 identifierType:(id)a4 codeRequirementString:(id)a5 serviceName:(id)a6 allowed:(id)a7 comment:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v15 || !v13 || !v14 || !v17)
  {
    if (qword_1000AC6F8 != -1) {
      dispatch_once(&qword_1000AC6F8, &stru_100096630);
    }
    uint64_t v20 = qword_1000AC700;
    if (!os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v26 = 138544386;
    id v27 = v16;
    __int16 v28 = 2114;
    id v29 = v13;
    __int16 v30 = 2114;
    id v31 = v14;
    __int16 v32 = 2114;
    id v33 = v15;
    __int16 v34 = 2114;
    id v35 = v18;
    v23 = "Override: missing configuration info for Service: %{public}@: Identifier: %{public}@, type: %{public}@, code r"
          "equirement: %{public}@, comment: %{public}@";
    uint64_t v24 = v20;
    uint32_t v25 = 52;
    goto LABEL_18;
  }
  if (([v14 isEqualToString:@"bundleID"] & 1) == 0
    && ([v14 isEqualToString:@"path"] & 1) == 0)
  {
    if (qword_1000AC6F8 != -1) {
      dispatch_once(&qword_1000AC6F8, &stru_100096630);
    }
    uint64_t v22 = qword_1000AC700;
    if (!os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v26 = 138543874;
    id v27 = v16;
    __int16 v28 = 2114;
    id v29 = v13;
    __int16 v30 = 2114;
    id v31 = v14;
    v23 = "Override: invalid identifier type for Service %{public}@, Identifier: %{public}@, type: %{public}@";
    uint64_t v24 = v22;
    uint32_t v25 = 32;
LABEL_18:
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v26, v25);
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }
  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (void)parsePlist
{
  if (qword_1000AC6F8 != -1) {
    dispatch_once(&qword_1000AC6F8, &stru_100096630);
  }
  uint64_t v5 = (id)qword_1000AC700;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(TCCDPolicyOverride *)self plistDictionary];
    if (v6)
    {
      v2 = [(TCCDPolicyOverride *)self plistDictionary];
      id v3 = [v2 objectForKeyedSubscript:@"Services"];
      uint64_t v7 = (uint64_t)[v3 count];
    }
    else
    {
      uint64_t v7 = -1;
    }
    *(_DWORD *)buf = 138412546;
    v68 = self;
    __int16 v69 = 2048;
    v70 = (TCCDPolicyOverride *)v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Override: parsing plist for %@ with %ld entries.", buf, 0x16u);
    if (v6)
    {
    }
  }

  long long v8 = [(TCCDPolicyOverride *)self plistDictionary];

  if (v8)
  {
    id v9 = [(TCCDPolicyOverride *)self policyAccessByIdentifier];
    [v9 removeAllObjects];

    id v10 = [(TCCDPolicyOverride *)self plistDictionary];
    id v11 = [v10 objectForKeyedSubscript:@"Services"];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v11;
    id v41 = [obj countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (!v41) {
      goto LABEL_62;
    }
    uint64_t v40 = *(void *)v64;
    *(void *)&long long v12 = 138544386;
    long long v39 = v12;
    v53 = self;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v64 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v13;
        id v14 = *(TCCDPolicyOverride **)(*((void *)&v63 + 1) + 8 * v13);
        v51 = objc_msgSend(@"kTCCService", "stringByAppendingString:", v14, v39);
        unsigned int v50 = [v51 isEqualToString:@"kTCCServiceAppleEvents"];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v58 = v14;
        id v52 = [obj objectForKeyedSubscript:v14];
        id v57 = [v52 countByEnumeratingWithState:&v59 objects:v77 count:16];
        if (v57)
        {
          uint64_t v56 = *(void *)v60;
          do
          {
            id v15 = 0;
            do
            {
              if (*(void *)v60 != v56) {
                objc_enumerationMutation(v52);
              }
              id v16 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v15);
              id v17 = [v16 objectForKeyedSubscript:@"Identifier"];
              id v18 = [v16 objectForKeyedSubscript:@"IdentifierType"];
              BOOL v19 = [v16 objectForKeyedSubscript:@"CodeRequirement"];
              uint64_t v20 = [v16 objectForKeyedSubscript:@"Comment"];
              id v21 = [v16 objectForKeyedSubscript:@"Allowed"];
              uint64_t v22 = [(TCCDPolicyOverride *)self allowedParser:v21];

              v23 = [v16 objectForKeyedSubscript:@"StaticCode"];
              if (![(TCCDPolicyOverride *)self validateEntry:v17 identifierType:v18 codeRequirementString:v19 serviceName:v58 allowed:v22 comment:v20])goto LABEL_41; {
              v55 = [(TCCDPolicyOverride *)self parseCodeRequirements:v19];
              }
              if (!v55)
              {
                if (qword_1000AC6F8 != -1) {
                  dispatch_once(&qword_1000AC6F8, &stru_100096630);
                }
                __int16 v34 = qword_1000AC700;
                if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138544130;
                  v68 = v58;
                  __int16 v69 = 2114;
                  v70 = v17;
                  __int16 v71 = 2114;
                  id v72 = v18;
                  __int16 v73 = 2114;
                  v74 = v19;
                  _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Override: invalid code requirements for Service %{public}@, Identifier: %{public}@, type: %{public}@, requirement: %{public}@", buf, 0x2Au);
                }
LABEL_41:
                int v35 = 4;
                goto LABEL_57;
              }
              if (qword_1000AC6F8 != -1) {
                dispatch_once(&qword_1000AC6F8, &stru_100096630);
              }
              uint64_t v24 = qword_1000AC700;
              if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                v68 = v58;
                __int16 v69 = 2114;
                v70 = v17;
                __int16 v71 = 2114;
                id v72 = v19;
                __int16 v73 = 2114;
                v74 = v20;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Override: service: %{public}@, processed entry: %{public}@, '%{public}@', %{public}@", buf, 0x2Au);
              }
              uint32_t v25 = [(TCCDPolicyOverride *)self policyAccessByIdentifier];
              int v26 = [v25 objectForKeyedSubscript:v17];

              if (!v26)
              {
                int v26 = +[NSMutableDictionary dictionary];
                id v27 = [(TCCDPolicyOverride *)v53 policyAccessByIdentifier];
                [v27 setObject:v26 forKeyedSubscript:v17];
              }
              __int16 v28 = [v26 objectForKeyedSubscript:v51];
              if (!v28)
              {
                __int16 v28 = +[NSMutableDictionary dictionary];
                [v26 setObject:v28 forKeyedSubscript:v51];
              }
              v54 = v28;
              if (!v50)
              {
                id v29 = v28;
LABEL_43:
                [v29 setObject:v17 forKeyedSubscript:@"Identifier"];
                [v29 setObject:v18 forKeyedSubscript:@"IdentifierType"];
                [v29 setObject:v22 forKeyedSubscript:@"Allowed"];
                if (v23) {
                  v36 = v23;
                }
                else {
                  v36 = &off_10009D2A0;
                }
                [v29 setObject:v36 forKeyedSubscript:@"StaticCode"];
                [v29 setObject:v55 forKeyedSubscript:@"CodeRequirementData"];
                if (qword_1000AC6F8 != -1) {
                  dispatch_once(&qword_1000AC6F8, &stru_100096630);
                }
                v37 = (void *)qword_1000AC700;
                if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_DEBUG))
                {
                  v38 = v37;
                  v49 = [(TCCDPolicyOverride *)v53 policyAccessByIdentifier];
                  os_log_t logb = [v49 objectForKeyedSubscript:v17];
                  *(_DWORD *)buf = 138412546;
                  v68 = v17;
                  __int16 v69 = 2112;
                  v70 = (TCCDPolicyOverride *)logb;
                  _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Override: policyAccessByIdentifier[%@] = %@", buf, 0x16u);
                }
                int v35 = 0;
                goto LABEL_56;
              }
              v48 = v26;
              id v29 = [v16 objectForKeyedSubscript:@"AEReceiverIdentifier"];
              __int16 v30 = [v16 objectForKeyedSubscript:@"AEReceiverIdentifierType"];
              id v31 = [v16 objectForKeyedSubscript:@"AEReceiverCodeRequirement"];
              if ([(TCCDPolicyOverride *)v53 validateEntry:v29 identifierType:v30 codeRequirementString:v31 serviceName:v58 allowed:v22 comment:v20])
              {
                __int16 v32 = [(TCCDPolicyOverride *)v53 parseCodeRequirements:v31];
                if (v32)
                {
                  v43 = v32;
                  os_log_t log = v31;
                  id v33 = [v54 objectForKeyedSubscript:v29];
                  if (!v33)
                  {
                    id v33 = +[NSMutableDictionary dictionary];
                    [v54 setObject:v33 forKeyedSubscript:v29];
                  }
                  [v33 setObject:v29 forKeyedSubscript:@"AEReceiverIdentifier"];
                  [v33 setObject:v30 forKeyedSubscript:@"AEReceiverIdentifierType"];
                  [v33 setObject:v43 forKeyedSubscript:@"AEReceiverCodeRequirementData"];

                  id v29 = v33;
                  int v26 = v48;
                  goto LABEL_43;
                }
                if (qword_1000AC6F8 != -1) {
                  dispatch_once(&qword_1000AC6F8, &stru_100096630);
                }
                loga = qword_1000AC700;
                if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v39;
                  v68 = v58;
                  __int16 v69 = 2114;
                  v70 = v17;
                  __int16 v71 = 2114;
                  id v72 = v29;
                  __int16 v73 = 2114;
                  v74 = v30;
                  __int16 v75 = 2114;
                  v76 = v31;
                  _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "Override: invalid code requirements for Service %{public}@, Identifier: %{public}@, Target Identifier: %{public}@, target type: %{public}@, target requirement: %{public}@", buf, 0x34u);
                }
              }

              int v35 = 4;
              int v26 = v48;
LABEL_56:

              self = v53;
LABEL_57:

              if (v35) {
                goto LABEL_60;
              }
              id v15 = (char *)v15 + 1;
            }
            while (v57 != v15);
            id v57 = [v52 countByEnumeratingWithState:&v59 objects:v77 count:16];
          }
          while (v57);
        }
LABEL_60:

        uint64_t v13 = v47 + 1;
      }
      while ((id)(v47 + 1) != v41);
      id v41 = [obj countByEnumeratingWithState:&v63 objects:v78 count:16];
      if (!v41)
      {
LABEL_62:

        return;
      }
    }
  }
}

- (unint64_t)_locked_evaluateAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6
{
  return 1;
}

- (id)watchedPath
{
  return 0;
}

- (void)watchPlistChanges
{
  id v3 = [(TCCDPolicyOverride *)self watchedFileVnodeSource];

  if (v3)
  {
    id v4 = [(TCCDPolicyOverride *)self watchedFileVnodeSource];
    dispatch_source_cancel(v4);

    [(TCCDPolicyOverride *)self setWatchedFileVnodeSource:0];
  }
  uint64_t v5 = [(TCCDPolicyOverride *)self watchedPath];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    unsigned int v8 = open((const char *)[v7 UTF8String], 0x8000);
    if ((v8 & 0x80000000) != 0)
    {
      if (qword_1000AC6F8 != -1) {
        dispatch_once(&qword_1000AC6F8, &stru_100096630);
      }
      id v16 = (void *)qword_1000AC700;
      if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_ERROR)) {
        sub_10004EE64((uint64_t)v7, v16);
      }
    }
    else
    {
      uintptr_t v9 = v8;
      id v10 = dispatch_get_global_queue(0, 0);
      dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v9, 0x4FuLL, v10);
      [(TCCDPolicyOverride *)self setWatchedFileVnodeSource:v11];

      [(TCCDPolicyOverride *)self watchedFileVnodeSource];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10004EA90;
      handler[3] = &unk_100094FB8;
      long long v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = v12;
      id v13 = v7;
      id v21 = v13;
      uint64_t v22 = self;
      dispatch_source_set_event_handler(v12, handler);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004EB98;
      v17[3] = &unk_100094E78;
      id v14 = v12;
      id v18 = v14;
      dispatch_source_set_cancel_handler(v14, v17);
      dispatch_resume(v14);
      if (qword_1000AC6F8 != -1) {
        dispatch_once(&qword_1000AC6F8, &stru_100096630);
      }
      id v15 = qword_1000AC700;
      if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Override: watchPlistChanges: watching: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (NSString)plistFilePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPlistFilePath:(id)a3
{
}

- (NSDictionary)plistDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPlistDictionary:(id)a3
{
}

- (NSMutableDictionary)policyAccessByIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPolicyAccessByIdentifier:(id)a3
{
}

- (OS_dispatch_source)watchedFileVnodeSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWatchedFileVnodeSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->watchedFileVnodeSource, 0);
  objc_storeStrong((id *)&self->policyAccessByIdentifier, 0);
  objc_storeStrong((id *)&self->plistDictionary, 0);
  objc_storeStrong((id *)&self->plistFilePath, 0);
}

@end