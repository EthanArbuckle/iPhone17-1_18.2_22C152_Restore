@interface SecPinningDb
+ (BOOL)enableInMemoryCache;
+ (id)pinningDbPath;
- (BOOL)createOrAlterAdminTable:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4;
- (BOOL)createOrAlterRulesTable:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4;
- (BOOL)insertRuleWithName:(id)a3 domainSuffix:(id)a4 labelRegex:(id)a5 policies:(id)a6 transparentConnection:(id)a7 dbConnection:(__OpaqueSecDbConnection *)a8 error:(__CFError *)a9;
- (BOOL)installDbFromURL:(id)a3 error:(id *)a4;
- (BOOL)isPinningDisabled:(id)a3;
- (BOOL)populateDbFromBundle:(id)a3 dbConnection:(__OpaqueSecDbConnection *)a4 error:(__CFError *)a5;
- (BOOL)queryCacheForSuffix:(id)a3 firstLabel:(id)a4 results:(id *)a5;
- (BOOL)removeAllRulesFromDb:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4;
- (BOOL)setContentVersion:(id)a3 dbConnection:(__OpaqueSecDbConnection *)a4 error:(__CFError *)a5;
- (BOOL)setSchemaVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4;
- (BOOL)shouldUpdateContent:(id)a3 error:(id *)a4;
- (BOOL)updateDb:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4 pinningList:(id)a5 updateSchema:(BOOL)a6 updateContent:(BOOL)a7;
- (NSMutableArray)regexCacheList;
- (NSMutableDictionary)regexCache;
- (NSURL)dbPath;
- (OS_dispatch_queue)queue;
- (SecPinningDb)init;
- (__OpaqueSecDb)createAtPath;
- (__OpaqueSecDb)db;
- (id)copySystemPinningList;
- (id)getContentVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4;
- (id)getSchemaVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4;
- (id)queryForDomain:(id)a3;
- (id)queryForPolicyName:(id)a3;
- (os_unfair_lock_s)regexCacheLock;
- (void)addSuffixToCache:(id)a3 entry:(id)a4;
- (void)clearCache;
- (void)dealloc;
- (void)initializedDb;
- (void)setDb:(__OpaqueSecDb *)a3;
- (void)setDbPath:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegexCache:(id)a3;
- (void)setRegexCacheList:(id)a3;
- (void)setRegexCacheLock:(os_unfair_lock_s)a3;
@end

@implementation SecPinningDb

+ (BOOL)enableInMemoryCache
{
  return 0;
}

- (id)queryForPolicyName:(id)a3
{
  id v4 = a3;
  if (!self->_queue) {

  }
  if (!self->_db) {
    [(SecPinningDb *)self initializedDb];
  }
  if ([v4 isEqualToString:@"sslServer"]) {
    goto LABEL_8;
  }
  v5 = 0;
  if ([(SecPinningDb *)self isPinningDisabled:0]) {
    goto LABEL_9;
  }
  if ([(SecPinningDb *)self isPinningDisabled:v4])
  {
LABEL_8:
    v5 = 0;
  }
  else
  {
    v7 = sub_10001CB28("SecPinningDb");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v46) = 138412290;
      *(void *)((char *)&v46 + 4) = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Fetching rules for policy named %@", (uint8_t *)&v46, 0xCu);
    }

    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 1;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    *(void *)&long long v46 = 0;
    *((void *)&v46 + 1) = &v46;
    uint64_t v47 = 0x3032000000;
    v48 = sub_100042A44;
    v49 = sub_100042A54;
    id v50 = (id)0xAAAAAAAAAAAAAAAALL;
    id v50 = +[NSMutableArray array];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_100042A44;
    v30 = sub_100042A54;
    v31 = &off_100087E28;
    db = self->_db;
    uint64_t v9 = (uint64_t)(v33 + 3);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000050C0;
    v20[3] = &unk_10007FCA0;
    v22 = &v36;
    v23 = &v32;
    id v10 = v4;
    id v21 = v10;
    v24 = &v46;
    v25 = &v26;
    BOOL v11 = sub_100010B8C((uint64_t)db, v9, (uint64_t)v20);
    if (*((unsigned char *)v37 + 24)) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
    *((unsigned char *)v37 + 24) = v12;
    if (!v12 || v33[3])
    {
      v13 = sub_10001CB28("SecError");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v33[3];
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error querying DB for policyName: %@", buf, 0xCu);
      }

      v15 = +[TrustAnalytics logger];
      uint64_t v16 = v33[3];
      v42[0] = @"database";
      v42[1] = @"operation";
      v43[0] = &off_100087E40;
      v43[1] = &off_100087E88;
      v17 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      [v15 logHardError:v16 withEventName:@"DatabaseEvent" withAttributes:v17];

      v18 = (const void *)v33[3];
      if (v18)
      {
        v33[3] = 0;
        CFRelease(v18);
      }
    }
    if ([*(id *)(*((void *)&v46 + 1) + 40) count])
    {
      uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 40);
      v40[0] = @"PinningRules";
      v40[1] = @"PinningPolicyName";
      v41[0] = v19;
      v41[1] = v10;
      v40[2] = @"PinningTransparentConnection";
      v41[2] = v27[5];
      v5 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
    }
    else
    {
      v5 = 0;
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
  }
LABEL_9:

  return v5;
}

- (id)queryForDomain:(id)a3
{
  id v4 = a3;
  if (!self->_queue) {

  }
  if (!self->_db) {
    [(SecPinningDb *)self initializedDb];
  }
  v5 = (char *)[v4 rangeOfString:@"."];
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    v7 = v5;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = sub_100042A44;
    v67 = sub_100042A54;
    id v68 = (id)0xAAAAAAAAAAAAAAAALL;
    id v68 = [v4 substringToIndex:v5];
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = sub_100042A44;
    v61 = sub_100042A54;
    id v62 = (id)0xAAAAAAAAAAAAAAAALL;
    id v62 = [v4 substringFromIndex:v7 + 1];
    if ([(id)v58[5] hasSuffix:@"."])
    {
      uint64_t v8 = [[v58[5] substringToIndex:[v58[5] length] - 1];
      uint64_t v9 = (void *)v58[5];
      v58[5] = v8;
    }
    uint64_t v10 = v58[5];
    uint64_t v11 = v64[5];
    id v56 = 0;
    unsigned int v12 = [(SecPinningDb *)self queryCacheForSuffix:v10 firstLabel:v11 results:&v56];
    id v13 = v56;
    uint64_t v14 = v13;
    if (v12)
    {
      id v6 = v13;
    }
    else
    {
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x2020000000;
      char v55 = 1;
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      uint64_t v51 = 0;
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x3032000000;
      uint64_t v45 = sub_100042A44;
      long long v46 = sub_100042A54;
      id v47 = (id)0xAAAAAAAAAAAAAAAALL;
      id v47 = +[NSMutableArray array];
      uint64_t v39 = 0;
      v40[0] = &v39;
      v40[1] = 0x3032000000;
      v40[2] = sub_100042A44;
      void v40[3] = sub_100042A54;
      id v41 = 0;
      uint64_t v36 = 0;
      v37[0] = &v36;
      v37[1] = 0x3032000000;
      v37[2] = sub_100042A44;
      v37[3] = sub_100042A54;
      uint64_t v38 = &off_100087E28;
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = sub_100042A44;
      uint64_t v34 = sub_100042A54;
      id v35 = (id)0xAAAAAAAAAAAAAAAALL;
      id v35 = +[NSMutableDictionary dictionary];
      db = self->_db;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10001E7F0;
      v29[3] = &unk_10007FC28;
      v29[4] = &v52;
      v29[5] = &v48;
      v29[6] = &v57;
      v29[7] = &v30;
      v29[8] = &v63;
      v29[9] = &v42;
      v29[10] = &v39;
      v29[11] = &v36;
      BOOL v16 = sub_100010B8C((uint64_t)db, (uint64_t)(v49 + 3), (uint64_t)v29);
      if (*((unsigned char *)v53 + 24)) {
        BOOL v17 = v16;
      }
      else {
        BOOL v17 = 0;
      }
      *((unsigned char *)v53 + 24) = v17;
      if (!v17 || v49[3])
      {
        v18 = sub_10001CB28("SecError");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v49[3];
          *(_DWORD *)buf = 138412290;
          uint64_t v79 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error querying DB for hostname: %@", buf, 0xCu);
        }

        v20 = +[TrustAnalytics logger];
        uint64_t v21 = v49[3];
        v76[0] = @"database";
        v76[1] = @"operation";
        v77[0] = &off_100087E40;
        v77[1] = &off_100087E88;
        v22 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
        [v20 logHardError:v21 withEventName:@"DatabaseEvent" withAttributes:v22];

        v23 = (const void *)v49[3];
        if (v23)
        {
          v49[3] = 0;
          CFRelease(v23);
        }
      }
      if ([(id)v31[5] count]) {
        [(SecPinningDb *)self addSuffixToCache:v58[5] entry:v31[5]];
      }
      if ([(id)v43[5] count])
      {
        if ([(SecPinningDb *)self isPinningDisabled:*(void *)(v40[0] + 40)])
        {
          v24 = v40;
          v74[1] = @"PinningRules";
          v74[2] = @"PinningPolicyName";
          v74[3] = &off_100087F40;
          v25 = &v75;
        }
        else
        {
          v24 = v37;
          uint64_t v26 = v43[5];
          CFStringRef v69 = @"PinningRules";
          CFStringRef v70 = @"PinningPolicyName";
          uint64_t v27 = *(void *)(v40[0] + 40);
          uint64_t v72 = v26;
          uint64_t v73 = v27;
          CFStringRef v71 = @"PinningTransparentConnection";
          v25 = v74;
        }
        uint64_t *v25 = *(void *)(*v24 + 40);
        +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:");
        id v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v6 = 0;
      }
      _Block_object_dispose(&v30, 8);

      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v39, 8);

      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(&v48, 8);
      _Block_object_dispose(&v52, 8);
    }

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v63, 8);
  }

  return v6;
}

- (BOOL)queryCacheForSuffix:(id)a3 firstLabel:(id)a4 results:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[SecPinningDb enableInMemoryCache])
  {
    BOOL v10 = 0;
  }
  else
  {
    p_regexCacheLock = &self->_regexCacheLock;
    os_unfair_lock_lock(&self->_regexCacheLock);
    unsigned int v12 = [(SecPinningDb *)self regexCache];
    id v13 = [v12 objectForKeyedSubscript:v8];
    BOOL v10 = v13 != 0;

    if (v13)
    {
      uint64_t v28 = &self->_regexCacheLock;
      BOOL v29 = v13 != 0;
      v31 = self;
      uint64_t v14 = [(SecPinningDb *)self regexCacheList];
      id v30 = v8;
      [v14 insertObject:v8 atIndex:0];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v27 = v13;
      id v15 = v13;
      id v16 = [v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v19);
            if (objc_msgSend(v20, "numberOfMatchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length")))
            {
              uint64_t v21 = sub_10001CB28("SecPinningDb");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                id v39 = v9;
                __int16 v40 = 2112;
                id v41 = v30;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "found matching rule in cache for %@.%@", buf, 0x16u);
              }

              v22 = [v15 objectForKey:v20];
              v23 = v22;
              if (a5)
              {
                v24 = [v22 objectForKeyedSubscript:@"PinningPolicyName"];
                if ([(SecPinningDb *)v31 isPinningDisabled:v24])
                {
                  v36[0] = @"PinningRules";
                  v36[1] = @"PinningPolicyName";
                  v37[0] = &off_100087F28;
                  v37[1] = v24;
                  id v25 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
                }
                else
                {
                  id v25 = v23;
                }
                *a5 = v25;
              }
            }
            uint64_t v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
        }
        while (v17);
      }

      id v8 = v30;
      BOOL v10 = v29;
      id v13 = v27;
      p_regexCacheLock = v28;
    }
    os_unfair_lock_unlock(p_regexCacheLock);
  }
  return v10;
}

- (NSMutableDictionary)regexCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isPinningDisabled:(id)a3
{
  id v3 = a3;
  if (!SecIsInternalRelease())
  {
    LOBYTE(v6) = 0;
    if (!v3) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.security"];
  unsigned __int8 v5 = [v4 BOOLForKey:@"AppleServerAuthenticationNoPinning"];
  LOBYTE(v6) = v5;
  if (v3 && (v5 & 1) == 0)
  {
    v7 = +[NSMutableString stringWithString:@"AppleServerAuthenticationNoPinning"];
    [v7 appendString:v3];
    unsigned int v6 = [v4 BOOLForKey:v7];
    id v8 = sub_10001CB28("pinningQA");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412546;
      id v12 = v3;
      __int16 v13 = 1024;
      unsigned int v14 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ disable pinning = %{BOOL}d", (uint8_t *)&v11, 0x12u);
    }
  }
  if (v3)
  {
LABEL_10:
    if ([v3 isEqualToString:@"IdMS"])
    {
      id v9 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.security"];
      LOBYTE(v6) = [v9 BOOLForKey:@"AppleServerAuthenticationNoPinningIdMS"];
    }
  }
LABEL_12:
  if (qword_10008ADC0 != -1) {
    dispatch_once(&qword_10008ADC0, &stru_10007FB90);
  }
  dispatch_source_merge_data((dispatch_source_t)qword_10008ADC8, 1uLL);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexCacheList, 0);
  objc_storeStrong((id *)&self->_regexCache, 0);
  objc_storeStrong((id *)&self->_dbPath, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setRegexCacheList:(id)a3
{
}

- (NSMutableArray)regexCacheList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRegexCache:(id)a3
{
}

- (void)setRegexCacheLock:(os_unfair_lock_s)a3
{
  self->_regexCacheLock = a3;
}

- (os_unfair_lock_s)regexCacheLock
{
  return self->_regexCacheLock;
}

- (void)setDbPath:(id)a3
{
}

- (NSURL)dbPath
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDb:(__OpaqueSecDb *)a3
{
  self->_db = a3;
}

- (__OpaqueSecDb)db
{
  return self->_db;
}

- (void)addSuffixToCache:(id)a3 entry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[SecPinningDb enableInMemoryCache])
  {
    p_regexCacheLock = &self->_regexCacheLock;
    os_unfair_lock_lock(&self->_regexCacheLock);
    id v9 = sub_10001CB28("SecPinningDb");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 134218242;
      id v20 = [v7 count];
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "adding %llu entries for %@ to cache", (uint8_t *)&v19, 0x16u);
    }

    BOOL v10 = [(SecPinningDb *)self regexCache];
    id v11 = [v10 count];

    if ((unint64_t)v11 >= 4)
    {
      id v12 = [(SecPinningDb *)self regexCacheList];
      __int16 v13 = [v12 lastObject];

      unsigned int v14 = sub_10001CB28("SecPinningDb");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 138412290;
        id v20 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "purging LRU suffix: %@", (uint8_t *)&v19, 0xCu);
      }

      id v15 = [(SecPinningDb *)self regexCache];
      [v15 removeObjectForKey:v13];

      id v16 = [(SecPinningDb *)self regexCacheList];
      [v16 removeLastObject];
    }
    id v17 = [(SecPinningDb *)self regexCache];
    [v17 setObject:v7 forKeyedSubscript:v6];

    uint64_t v18 = [(SecPinningDb *)self regexCacheList];
    [v18 insertObject:v6 atIndex:0];

    os_unfair_lock_unlock(p_regexCacheLock);
  }
}

- (void)clearCache
{
  if (!+[SecPinningDb enableInMemoryCache])
  {
    os_unfair_lock_lock(&self->_regexCacheLock);
    id v3 = +[NSMutableDictionary dictionary];
    [(SecPinningDb *)self setRegexCache:v3];

    id v4 = +[NSMutableArray array];
    [(SecPinningDb *)self setRegexCacheList:v4];

    os_unfair_lock_unlock(&self->_regexCacheLock);
  }
}

- (void)dealloc
{
  db = self->_db;
  if (db)
  {
    self->_db = 0;
    CFRelease(db);
  }
  v4.receiver = self;
  v4.super_class = (Class)SecPinningDb;
  [(SecPinningDb *)&v4 dealloc];
}

- (SecPinningDb)init
{
  v11.receiver = self;
  v11.super_class = (Class)SecPinningDb;
  v2 = [(SecPinningDb *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Pinning DB Queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    if (+[SecPinningDb enableInMemoryCache])
    {
      uint64_t v6 = +[NSMutableDictionary dictionary];
      regexCache = v2->_regexCache;
      v2->_regexCache = (NSMutableDictionary *)v6;

      uint64_t v8 = +[NSMutableArray array];
      regexCacheList = v2->_regexCacheList;
      v2->_regexCacheList = (NSMutableArray *)v8;

      v2->_regexCacheLock._os_unfair_lock_opaque = 0;
    }
    [(SecPinningDb *)v2 initializedDb];
  }
  return v2;
}

- (void)initializedDb
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043074;
  block[3] = &unk_10007FB70;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (__OpaqueSecDb)createAtPath
{
  if (qword_10008AC30 != -1) {
    dispatch_once(&qword_10008AC30, &stru_10007E800);
  }
  char v3 = byte_10008AC28;
  CFStringRef v4 = CFStringCreateWithCString(0, [(NSURL *)self->_dbPath fileSystemRepresentation], 0x8000100u);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000431C8;
  v7[3] = &unk_10007FB48;
  v7[4] = self;
  unsigned __int8 v5 = (__OpaqueSecDb *)sub_10002607C(v4, 384, v3, v3, 0, 0, v7);
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

- (BOOL)updateDb:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4 pinningList:(id)a5 updateSchema:(BOOL)a6 updateContent:(BOOL)a7
{
  id v12 = a5;
  if (qword_10008AC30 != -1) {
    dispatch_once(&qword_10008AC30, &stru_10007E800);
  }
  if (byte_10008AC28 == 1)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000438D4;
    v16[3] = &unk_10007FAF8;
    BOOL v21 = a6;
    uint64_t v18 = &v23;
    int v19 = a3;
    v16[4] = self;
    id v20 = a4;
    BOOL v22 = a7;
    id v17 = v12;
    BOOL v13 = sub_100027440((uint64_t)a3, 2, (CFTypeRef *)a4, (uint64_t)v16);
    if (*((unsigned char *)v24 + 24)) {
      BOOL v14 = v13;
    }
    else {
      BOOL v14 = 0;
    }
    *((unsigned char *)v24 + 24) = v14;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)copySystemPinningList
{
  uint64_t v2 = sub_100015CEC();
  char v3 = (void *)v2;
  if (!v2)
  {
    CFStringRef v4 = 0;
LABEL_11:
    id v7 = v3;

    uint64_t v8 = v7;
    goto LABEL_15;
  }
  CFStringRef v4 = *(void **)(v2 + 56);
  if (v4) {
    CFRetain(*(CFTypeRef *)(v2 + 56));
  }
  CFRelease(v3);
  if (v4)
  {
    id v10 = 0;
    char v3 = +[NSArray arrayWithContentsOfURL:v4 error:&v10];
    id v5 = v10;
    if (!v3)
    {
      uint64_t v6 = sub_10001CB28("SecError");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to read pinning plist from bundle: %@", buf, 0xCu);
      }
    }
    goto LABEL_11;
  }
  id v7 = sub_10001CB28("SecError");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to get pinning plist URL", buf, 2u);
  }
  uint64_t v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)installDbFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = +[NSURL URLWithString:@"CertificatePinning.plist" relativeToURL:v6];
    *(void *)uint64_t v25 = 0;
    char v26 = v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = sub_100042A44;
    BOOL v29 = sub_100042A54;
    id v30 = (id)0xAAAAAAAAAAAAAAAALL;
    id v30 = +[NSArray arrayWithContentsOfURL:v7 error:a4];
    uint64_t v8 = (void *)*((void *)v26 + 5);
    if (v8)
    {
      id v9 = [v8 objectAtIndex:0];
      if ([(SecPinningDb *)self shouldUpdateContent:v9 error:a4])
      {
        *(void *)&long long v37 = 0;
        *((void *)&v37 + 1) = &v37;
        uint64_t v38 = 0x2020000000;
        uint64_t v39 = 0;
        uint64_t v21 = 0;
        BOOL v22 = &v21;
        uint64_t v23 = 0x2020000000;
        char v24 = 1;
        queue = self->_queue;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100043FDC;
        v20[3] = &unk_10007FAD0;
        void v20[4] = self;
        v20[5] = &v21;
        v20[6] = &v37;
        v20[7] = v25;
        dispatch_sync(queue, v20);
        if (!*((unsigned char *)v22 + 24) || *(void *)(*((void *)&v37 + 1) + 24))
        {
          objc_super v11 = sub_10001CB28("SecError");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = [*((id *)v26 + 5) objectAtIndex:0];
            uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 24);
            *(_DWORD *)buf = 138412546;
            long long v34 = v12;
            __int16 v35 = 2112;
            uint64_t v36 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error installing updated pinning list version %@: %@", buf, 0x16u);
          }
          BOOL v14 = +[TrustAnalytics logger];
          uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 24);
          v31[0] = @"database";
          v31[1] = @"operation";
          v32[0] = &off_100087E40;
          v32[1] = &off_100087E58;
          id v16 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
          [v14 logHardError:v15 withEventName:@"DatabaseEvent" withAttributes:v16];

          if (a4)
          {
            id v17 = *(void **)(*((void *)&v37 + 1) + 24);
            if (v17) {
              *a4 = v17;
            }
          }
        }
        BOOL v18 = *((unsigned char *)v22 + 24) != 0;
        _Block_object_dispose(&v21, 8);
        _Block_object_dispose(&v37, 8);
        goto LABEL_21;
      }
      if (!a4 || !*a4)
      {
        BOOL v18 = 1;
        goto LABEL_21;
      }
    }
    else
    {
      id v9 = sub_10001CB28("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v37) = 138412290;
        *(void *)((char *)&v37 + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SecPinningDb: unable to create pinning list from asset file: %@", (uint8_t *)&v37, 0xCu);
      }
    }
    BOOL v18 = 0;
LABEL_21:

    _Block_object_dispose(v25, 8);
    goto LABEL_22;
  }
  id v7 = sub_10001CB28("SecError");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecPinningDb: missing url for downloaded asset", v25, 2u);
  }
  BOOL v18 = 0;
LABEL_22:

  return v18;
}

- (BOOL)createOrAlterRulesTable:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  int v7 = sub_100026520((uint64_t)a3, @"CREATE TABLE IF NOT EXISTS rules(policyName TEXT NOT NULL,domainSuffix TEXT NOT NULL,labelRegex TEXT NOT NULL,policies BLOB NOT NULL,transparentConnection INTEGER,UNIQUE(policyName, domainSuffix, labelRegex));",
         (CFTypeRef *)a4);
  int v8 = v7 & sub_100026520((uint64_t)a3, @"CREATE INDEX IF NOT EXISTS idomain ON rules(domainSuffix);",
              (CFTypeRef *)a4);
  int v9 = v8 & sub_100026520((uint64_t)a3, @"CREATE INDEX IF NOT EXISTS ipolicy ON rules(policyName);",
              (CFTypeRef *)a4);
  id v10 = [(SecPinningDb *)self getSchemaVersion:a3 error:a4];
  objc_super v11 = v10;
  if (!v10 || (int)[v10 intValue] < 1 || (int)objc_msgSend(v11, "intValue") > 2)
  {
    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    BOOL v14 = 1;
    goto LABEL_13;
  }
  if (v9 & sub_100026520((uint64_t)a3, @"ALTER TABLE rules ADD COLUMN transparentConnection INTEGER", (CFTypeRef *)a4))goto LABEL_9; {
LABEL_5:
  }
  id v12 = sub_10001CB28("SecError");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a4) {
      uint64_t v13 = *a4;
    }
    else {
      uint64_t v13 = 0;
    }
    int v16 = 138412290;
    id v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to create rules table: %@", (uint8_t *)&v16, 0xCu);
  }

  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)createOrAlterAdminTable:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  char v5 = sub_100026520((uint64_t)a3, @"CREATE TABLE IF NOT EXISTS admin(key TEXT PRIMARY KEY NOT NULL,ival INTEGER NOT NULL,value BLOB);",
         (CFTypeRef *)a4);
  if ((v5 & 1) == 0)
  {
    id v6 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        int v7 = *a4;
      }
      else {
        int v7 = 0;
      }
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to create admin table: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v5;
}

- (BOOL)removeAllRulesFromDb:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  BOOL v5 = 1;
  char v15 = 1;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000444CC;
  v11[3] = &unk_10007FA80;
  v11[4] = &v12;
  v11[5] = a3;
  v11[6] = a4;
  char v6 = sub_1000120C0((uint64_t)a3, @"DELETE FROM rules;", (CFTypeRef *)a4, (uint64_t)v11);
  if (*((unsigned char *)v13 + 24)) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  *((unsigned char *)v13 + 24) = v7;
  if ((v7 & 1) == 0)
  {
    int v8 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        int v9 = *a4;
      }
      else {
        int v9 = 0;
      }
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to delete old values: %@", buf, 0xCu);
    }

    BOOL v5 = *((unsigned char *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (BOOL)populateDbFromBundle:(id)a3 dbConnection:(__OpaqueSecDbConnection *)a4 error:(__CFError *)a5
{
  id v8 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000446BC;
  v13[3] = &unk_10007FA58;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a4;
  v13[7] = a5;
  [v8 enumerateObjectsUsingBlock:v13];
  if (*((unsigned char *)v15 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        objc_super v11 = *a5;
      }
      else {
        objc_super v11 = 0;
      }
      *(_DWORD *)buf = 138412290;
      int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to populate DB from pinning list: %@", buf, 0xCu);
    }

    BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)insertRuleWithName:(id)a3 domainSuffix:(id)a4 labelRegex:(id)a5 policies:(id)a6 transparentConnection:(id)a7 dbConnection:(__OpaqueSecDbConnection *)a8 error:(__CFError *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x2020000000;
  BOOL v19 = 1;
  char v42 = 1;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100044EA8;
  v30[3] = &unk_10007FA08;
  uint64_t v36 = &v39;
  id v20 = v14;
  id v31 = v20;
  long long v37 = a9;
  id v21 = v15;
  id v32 = v21;
  id v22 = v16;
  id v33 = v22;
  id v23 = v17;
  id v34 = v23;
  id v24 = v18;
  id v35 = v24;
  uint64_t v38 = a8;
  char v25 = sub_1000120C0((uint64_t)a8, @"INSERT OR REPLACE INTO rules (policyName,domainSuffix,labelRegex,policies,transparentConnection) VALUES (?,?,?,?,?) ", (CFTypeRef *)a9, (uint64_t)v30);
  if (*((unsigned char *)v40 + 24)) {
    char v26 = v25;
  }
  else {
    char v26 = 0;
  }
  *((unsigned char *)v40 + 24) = v26;
  if ((v26 & 1) == 0)
  {
    uint64_t v27 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if (a9) {
        uint64_t v28 = *a9;
      }
      else {
        uint64_t v28 = 0;
      }
      *(_DWORD *)buf = 138413058;
      id v44 = v20;
      __int16 v45 = 2112;
      id v46 = v22;
      __int16 v47 = 2112;
      id v48 = v21;
      __int16 v49 = 2112;
      uint64_t v50 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to insert rule %@ for %@.%@ with error %@", buf, 0x2Au);
    }

    BOOL v19 = *((unsigned char *)v40 + 24) != 0;
  }

  _Block_object_dispose(&v39, 8);
  return v19;
}

- (BOOL)shouldUpdateContent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  char v7 = [(SecPinningDb *)self db];
  uint64_t v8 = (uint64_t)(v24 + 3);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100045320;
  v15[3] = &unk_10007F9E0;
  v15[4] = self;
  id v17 = &v23;
  id v9 = v6;
  id v16 = v9;
  id v18 = &v19;
  if (!sub_100010B8C((uint64_t)v7, v8, (uint64_t)v15) || v24[3])
  {
    id v10 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v24[3];
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SecPinningDb: error reading content version from database %@", buf, 0xCu);
    }
  }
  if (a4)
  {
    uint64_t v12 = (void *)v24[3];
    if (v12) {
      *a4 = v12;
    }
  }
  BOOL v13 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (BOOL)setContentVersion:(id)a3 dbConnection:(__OpaqueSecDbConnection *)a4 error:(__CFError *)a5
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  BOOL v7 = 1;
  char v22 = 1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100045648;
  v14[3] = &unk_10007F9B8;
  id v16 = &v19;
  id v17 = (CFTypeRef *)a5;
  id v8 = a3;
  id v15 = v8;
  id v18 = a4;
  char v9 = sub_1000120C0((uint64_t)a4, @"INSERT OR REPLACE INTO admin (key,ival,value) VALUES (?,?,?)", v17, (uint64_t)v14);
  if (*((unsigned char *)v20 + 24)) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }
  *((unsigned char *)v20 + 24) = v10;
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        uint64_t v12 = *a5;
      }
      else {
        uint64_t v12 = 0;
      }
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to set version %@ from pinning list: %@", buf, 0x16u);
    }

    BOOL v7 = *((unsigned char *)v20 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
  return v7;
}

- (id)getContentVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_100042A44;
  BOOL v13 = sub_100042A54;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045890;
  v8[3] = &unk_10007F990;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = &v15;
  v8[5] = &v9;
  char v4 = sub_1000120C0((uint64_t)a3, @"SELECT ival FROM admin WHERE key='version'", (CFTypeRef *)a4, (uint64_t)v8);
  if (*((unsigned char *)v16 + 24)) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)v16 + 24) = v5;
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

- (BOOL)setSchemaVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  +[NSString stringWithFormat:@"PRAGMA user_version = %llu", 3];
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  char v7 = sub_100026520((uint64_t)a3, v6, (CFTypeRef *)a4);
  if ((v7 & 1) == 0)
  {
    id v8 = sub_10001CB28("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        uint64_t v9 = *a4;
      }
      else {
        uint64_t v9 = 0;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecPinningDb: failed to create admin table: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (id)getSchemaVersion:(__OpaqueSecDbConnection *)a3 error:(__CFError *)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_100042A44;
  BOOL v13 = sub_100042A54;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100045BE0;
  v8[3] = &unk_10007F990;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = &v15;
  v8[5] = &v9;
  char v4 = sub_1000120C0((uint64_t)a3, @"PRAGMA user_version", (CFTypeRef *)a4, (uint64_t)v8);
  if (*((unsigned char *)v16 + 24)) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)v16 + 24) = v5;
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

+ (id)pinningDbPath
{
  CFURLRef v2 = sub_100020F2C(@"pinningrules.sqlite3");

  return v2;
}

@end