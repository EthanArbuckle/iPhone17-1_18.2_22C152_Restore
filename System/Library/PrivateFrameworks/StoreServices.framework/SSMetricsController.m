@interface SSMetricsController
- (BOOL)isDisabled;
- (BOOL)isFlushTimerEnabled;
- (SSMetricsController)init;
- (id)_connection;
- (id)_cookieValuesForConfiguration:(id)a3;
- (id)_userType;
- (id)_valueForField:(id)a3 withFieldData:(id)a4;
- (id)configuration;
- (id)locationWithPosition:(int64_t)a3 type:(id)a4 fieldData:(id)a5;
- (id)pingURLs;
- (id)serialQueue;
- (void)_applicationWillEnterForeground;
- (void)_enumerateFieldValuesWithMap:(id)a3 fieldData:(id)a4 block:(id)a5;
- (void)_flushUnreportedEventsIfEnabled;
- (void)_handleFlushTimer;
- (void)_serialQueueInsertEvents:(id)a3 withCompletionHandler:(id)a4;
- (void)_setupFlushTimer;
- (void)dealloc;
- (void)flushUnreportedEventsWithCompletionHandler:(id)a3;
- (void)insertEvent:(id)a3 withCompletionHandler:(id)a4;
- (void)insertEvents:(id)a3 withCompletionHandler:(id)a4;
- (void)recordAnalyticsForMetricsDialogEvent:(id)a3 withTopic:(id)a4;
- (void)setFlushTimerEnabled:(BOOL)a3;
- (void)setGlobalConfiguration:(id)a3;
- (void)setPageConfiguration:(id)a3;
@end

@implementation SSMetricsController

- (SSMetricsController)init
{
  v19.receiver = self;
  v19.super_class = (Class)SSMetricsController;
  id v2 = [(SSMetricsController *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storeservices.analytics", 0);
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    v5 = *((void *)v2 + 4);
    v6 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, v6);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.storeservices.analytics.flush", 0);
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 5), v6);
    v9 = [[SSMetricsConfiguration alloc] initWithGlobalConfiguration:&unk_1EF9A99F0];
    v10 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v9;

    v11 = (void *)MEMORY[0x1E4F4DBD8];
    v12 = [MEMORY[0x1E4F4DD58] bagSubProfile];
    v13 = [MEMORY[0x1E4F4DD58] bagSubProfileVersion];
    v14 = [v11 bagForProfile:v12 profileVersion:v13];

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F4DC70]) initWithBag:v14];
    v16 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v15;

    *((unsigned char *)v2 + 49) = 0;
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel__applicationWillEnterForeground name:0x1EF972770 object:0];
  }
  return (SSMetricsController *)v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0x1EF972770 object:0];

  id flushTimerBlock = self->_flushTimerBlock;
  if (flushTimerBlock)
  {
    dispatch_block_cancel(flushTimerBlock);
    id v5 = self->_flushTimerBlock;
    self->_id flushTimerBlock = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SSMetricsController;
  [(SSMetricsController *)&v6 dealloc];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    id v5 = self->_connection;
    self->_connection = v4;

    connection = self->_connection;
  }
  return connection;
}

- (id)_cookieValuesForConfiguration:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [a3 cookieFields];
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = +[SSAccountStore defaultStore];
    objc_super v6 = [v5 activeAccount];

    dispatch_queue_t v7 = +[SSVCookieStorage sharedStorage];
    v8 = [v7 allCookiesForAccount:v6];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "name", (void)v20);
          int v16 = [v3 containsObject:v15];

          if (v16)
          {
            v17 = [v14 value];
            v18 = [v14 name];
            [v4 setValue:v17 forKey:v18];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_serialQueueInsertEvents:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v95 = self;
  v8 = [(SSMetricsController *)self configuration];
  id v9 = [v8 reportingURLString];
  objc_opt_class();
  v92 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length])
  {
    v87 = v7;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v86 = [(SSMetricsController *)self _userType];
    objc_msgSend(v10, "setObject:forKey:");
    uint64_t v11 = [(SSMetricsController *)self _cookieValuesForConfiguration:v8];
    if ([v11 count]) {
      [v10 setObject:v11 forKey:@"cookies"];
    }
    v85 = v11;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v90 = objc_msgSend(NSNumber, "numberWithDouble:");
    v91 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v88 = v6;
    id obj = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v103;
      v89 = v8;
      do
      {
        uint64_t v15 = 0;
        uint64_t v93 = v13;
        do
        {
          if (*(void *)v103 != v14) {
            objc_enumerationMutation(obj);
          }
          int v16 = *(void **)(*((void *)&v102 + 1) + 8 * v15);
          if (objc_msgSend(v16, "isBlacklistedByConfiguration:", v8, v83, v84))
          {
            v17 = +[SSLogConfig sharedStoreServicesConfig];
            if (!v17)
            {
              v17 = +[SSLogConfig sharedConfig];
            }
            int v18 = [v17 shouldLog];
            if ([v17 shouldLogToDisk]) {
              v18 |= 2u;
            }
            objc_super v19 = [v17 OSLogObject];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              int v20 = v18;
            }
            else {
              int v20 = v18 & 2;
            }
            if (v20)
            {
              long long v21 = (char *)objc_opt_class();
              int v106 = 138412546;
              v107 = v21;
              __int16 v108 = 2112;
              v109 = v16;
              long long v22 = v21;
              LODWORD(v84) = 22;
              v83 = &v106;
              long long v23 = (void *)_os_log_send_and_compose_impl();

              if (v23)
              {
                objc_super v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v106, v84);
                free(v23);
                SSFileLog(v17, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v19);
                goto LABEL_27;
              }
            }
            else
            {
LABEL_27:
            }
            goto LABEL_43;
          }
          uint64_t v96 = MEMORY[0x1A6267F60]();
          if (([MEMORY[0x1E4F4DCB8] suppressEngagement] & 1) == 0)
          {
            v30 = v95->_engagement;
            id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v16 appendPropertiesToBody:v31];
            v32 = (void *)[objc_alloc(MEMORY[0x1E4F4DD60]) initWithUnderlyingDictionary:v31];
            if (([v32 suppressEngagement] & 1) == 0)
            {
              v33 = [v32 underlyingDictionary];
              id v34 = (id)[(AMSEngagement *)v30 enqueueData:v33];

              v8 = v89;
            }
          }
          uint64_t v35 = v14;
          id v36 = v10;
          v37 = [v16 allTableEntityPropertiesPermittedByConfiguration:v8 externalValues:v10];
          v38 = [v37 objectForKey:@"eventBody"];
          if ([v38 length])
          {
            v39 = [v16 decorateReportingURL:v92];
            v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "shouldSuppressUserInfo"));
            id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v41 setObject:v90 forKey:@"timestampInserted"];
            [v41 setObject:&unk_1EF9A9870 forKey:@"timestampReported"];
            [v41 setObject:v39 forKey:@"report_url"];
            [v41 setObject:v40 forKey:@"supressDsid"];
            [v41 setObject:v38 forKey:@"eventBody"];
            [(__CFString *)v91 addObject:v41];
          }
          else
          {
            v39 = +[SSLogConfig sharedStoreServicesConfig];
            if (!v39)
            {
              v39 = +[SSLogConfig sharedConfig];
            }
            int v42 = [v39 shouldLog];
            if ([v39 shouldLogToDisk]) {
              int v43 = v42 | 2;
            }
            else {
              int v43 = v42;
            }
            v40 = [v39 OSLogObject];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              int v44 = v43;
            }
            else {
              int v44 = v43 & 2;
            }
            if (v44)
            {
              v45 = (char *)objc_opt_class();
              int v106 = 138412546;
              v107 = v45;
              __int16 v108 = 2112;
              v109 = v16;
              v46 = v45;
              LODWORD(v84) = 22;
              v83 = &v106;
              v47 = (void *)_os_log_send_and_compose_impl();

              if (!v47)
              {
                v8 = v89;
                v54 = (void *)v96;
                goto LABEL_42;
              }
              v40 = objc_msgSend(NSString, "stringWithCString:encoding:", v47, 4, &v106, v84);
              free(v47);
              SSFileLog(v39, @"%@", v48, v49, v50, v51, v52, v53, (uint64_t)v40);
            }
            v8 = v89;
          }
          v54 = (void *)v96;

LABEL_42:
          id v10 = v36;
          uint64_t v14 = v35;
          uint64_t v13 = v93;
LABEL_43:
          ++v15;
        }
        while (v13 != v15);
        uint64_t v55 = [obj countByEnumeratingWithState:&v102 objects:v110 count:16];
        uint64_t v13 = v55;
      }
      while (v55);
    }

    if (![(__CFString *)v91 count])
    {
      id v7 = v87;
      id v6 = v88;
      if (!v87)
      {
LABEL_78:

        goto LABEL_79;
      }
      v82 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_51;
      block[3] = &unk_1E5BA9D20;
      char v99 = 1;
      id v98 = v87;
      dispatch_async(v82, block);

      xpc_object_t v68 = v98;
LABEL_77:

      goto LABEL_78;
    }
    id v7 = v87;
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
    {
LABEL_63:
      xpc_object_t v68 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v68, "0", 110);
      SSXPCDictionarySetCFObject(v68, "1", v91);
      v69 = [(SSMetricsController *)v95 _connection];
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke;
      v100[3] = &unk_1E5BA6EE0;
      v100[4] = v95;
      id v101 = v87;
      [v69 sendMessage:v68 withReply:v100];

      id v6 = v88;
      goto LABEL_77;
    }
    v56 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v56)
    {
      v56 = +[SSLogConfig sharedConfig];
    }
    int v57 = objc_msgSend(v56, "shouldLog", v83);
    if ([v56 shouldLogToDisk]) {
      int v58 = v57 | 2;
    }
    else {
      int v58 = v57;
    }
    v59 = [v56 OSLogObject];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      int v60 = v58;
    }
    else {
      int v60 = v58 & 2;
    }
    if (v60)
    {
      int v106 = 136446210;
      v107 = "-[SSMetricsController _serialQueueInsertEvents:withCompletionHandler:]";
      LODWORD(v84) = 12;
      v61 = (void *)_os_log_send_and_compose_impl();

      if (!v61)
      {
LABEL_62:

        goto LABEL_63;
      }
      v59 = objc_msgSend(NSString, "stringWithCString:encoding:", v61, 4, &v106, v84);
      free(v61);
      SSFileLog(v56, @"%@", v62, v63, v64, v65, v66, v67, (uint64_t)v59);
    }

    goto LABEL_62;
  }
  id v10 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v10)
  {
    id v10 = +[SSLogConfig sharedConfig];
  }
  int v70 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v71 = v70 | 2;
  }
  else {
    int v71 = v70;
  }
  v72 = [v10 OSLogObject];
  if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
    v71 &= 2u;
  }
  if (!v71) {
    goto LABEL_74;
  }
  v73 = objc_opt_class();
  id v74 = v73;
  int v106 = 138412546;
  v107 = (const char *)v73;
  __int16 v108 = 1024;
  LODWORD(v109) = objc_opt_class();
  LODWORD(v84) = 18;
  v75 = (void *)_os_log_send_and_compose_impl();

  if (v75)
  {
    v72 = objc_msgSend(NSString, "stringWithCString:encoding:", v75, 4, &v106, v84);
    free(v75);
    SSFileLog(v10, @"%@", v76, v77, v78, v79, v80, v81, (uint64_t)v72);
LABEL_74:
  }
LABEL_79:
}

void __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 40))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = (id)SSXPCDictionaryCopyObjectWithClass(v4, "0", v6);
    int v8 = [v7 intValue];
    uint64_t v9 = +[SSLogConfig sharedStoreServicesConfig];
    id v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
      {
        id v10 = +[SSLogConfig sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      uint64_t v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        v12 &= 2u;
      }
      if (!v12) {
        goto LABEL_30;
      }
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      int v36 = 138412546;
      id v37 = v14;
      __int16 v38 = 1024;
      int v39 = [v7 intValue];
      LODWORD(v32) = 18;
    }
    else
    {
      if (!v9)
      {
        id v10 = +[SSLogConfig sharedConfig];
      }
      int v19 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      uint64_t v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        v20 &= 2u;
      }
      if (!v20) {
        goto LABEL_30;
      }
      int v36 = 138412290;
      id v37 = (id)objc_opt_class();
      id v15 = v37;
      LODWORD(v32) = 12;
    }
    long long v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21) {
      goto LABEL_31;
    }
    uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v36, v32);
    free(v21);
    SSFileLog(v10, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v13);
LABEL_30:

    goto LABEL_31;
  }
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
    {
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v28);
      if ([v29 intValue])
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v31 = xpc_dictionary_get_value(v4, "1");
        int v16 = (void *)[v30 initWithXPCEncoding:v31];
      }
      else
      {
        int v16 = 0;
      }

      goto LABEL_18;
    }
    uint64_t v5 = 111;
  }
  int v16 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_18:
  v17 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5BA7328;
  id v18 = *(id *)(a1 + 40);
  id v34 = v16;
  id v35 = v18;
  id v7 = v16;
  dispatch_async(v17, block);

  id v10 = v35;
LABEL_31:
}

uint64_t __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_51(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 32);
    v2(v3, 0);
  }
  else
  {
    SSError(@"SSErrorDomain", 112, 0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
}

- (void)_handleFlushTimer
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    uint64_t v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  uint64_t v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  LODWORD(location[0]) = 138412290;
  *(id *)((char *)location + 4) = (id)objc_opt_class();
  id v7 = *(id *)((char *)location + 4);
  LODWORD(v15) = 12;
  int v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, location, v15);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:
  }
  objc_initWeak(location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSMetricsController__handleFlushTimer__block_invoke;
  block[3] = &unk_1E5BA8810;
  objc_copyWeak(&v17, location);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v17);
  objc_destroyWeak(location);
}

void __40__SSMetricsController__handleFlushTimer__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v8 = WeakRetained;
    id v2 = objc_alloc_init(MEMORY[0x1E4F4E278]);
    uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
    int v4 = [v3 bundleIdentifier];
    char v5 = [v2 applicationStateForApplication:v4];

    if ((v5 & 8) != 0
      || (SSUIApplication(),
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 applicationState],
          v6,
          !v7))
    {
      [v8 _flushUnreportedEventsIfEnabled];
    }
    else
    {
      v8[49] = 1;
    }

    WeakRetained = v8;
  }
}

- (void)_flushUnreportedEventsIfEnabled
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (!self->_flushTimerEnabled || [(SSMetricsController *)self isDisabled])
  {
    uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      uint64_t v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    uint64_t v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v7 = *(id *)((char *)location + 4);
      LODWORD(v17) = 12;
      int v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_14:

        flushSerialQueue = self->_flushSerialQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_56;
        block[3] = &unk_1E5BA7040;
        void block[4] = self;
        dispatch_async(flushSerialQueue, block);
        return;
      }
      uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, location, v17);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_14;
  }
  objc_initWeak(location, self);
  int v16 = self->_flushSerialQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke;
  v19[3] = &unk_1E5BA8860;
  objc_copyWeak(&v20, location);
  v19[4] = self;
  dispatch_async(v16, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(location);
}

void __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke(uint64_t a1)
{
  id v2 = +[SSTransactionStore defaultStore];
  [v2 takeKeepAliveWithTransactionID:@"com.apple.storeservices.metricsFlushTransactionID"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_2;
  v4[3] = &unk_1E5BA8720;
  v4[4] = *(void *)(a1 + 32);
  [WeakRetained flushUnreportedEventsWithCompletionHandler:v4];
}

void __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = +[SSLogConfig sharedStoreServicesConfig];
  int v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      int v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (!v6) {
      goto LABEL_22;
    }
    *(_DWORD *)id v20 = 138412546;
    *(void *)&v20[4] = objc_opt_class();
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v2;
    id v8 = *(id *)&v20[4];
    LODWORD(v19) = 22;
  }
  else
  {
    if (!v3)
    {
      int v4 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_22;
    }
    *(_DWORD *)id v20 = 138412290;
    *(void *)&v20[4] = objc_opt_class();
    id v8 = *(id *)&v20[4];
    LODWORD(v19) = 12;
  }
  uint64_t v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v20, v19, *(_OWORD *)v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
LABEL_22:
  }
  id v18 = +[SSTransactionStore defaultStore];
  [v18 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.metricsFlushTransactionID"];
}

void __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_56(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    dispatch_block_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;
  }
}

- (void)_setupFlushTimer
{
  flushSerialQueue = self->_flushSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SSMetricsController__setupFlushTimer__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(flushSerialQueue, block);
}

void __39__SSMetricsController__setupFlushTimer__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 56))
  {
    dispatch_block_cancel(*(dispatch_block_t *)(v2 + 56));
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 48))
  {
    if (([(id)v2 isDisabled] & 1) == 0)
    {
      int v5 = [*(id *)(a1 + 32) configuration];
      [v5 reportingFrequency];
      double v7 = v6;

      if (v7 != 0.0)
      {
        id v8 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v8)
        {
          id v8 = +[SSLogConfig sharedConfig];
        }
        int v9 = [v8 shouldLog];
        if ([v8 shouldLogToDisk]) {
          int v10 = v9 | 2;
        }
        else {
          int v10 = v9;
        }
        uint64_t v11 = [v8 OSLogObject];
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
          v10 &= 2u;
        }
        if (v10)
        {
          uint64_t v12 = objc_opt_class();
          float v13 = v7;
          *(_DWORD *)location = 138412546;
          *(void *)&id location[4] = v12;
          __int16 v30 = 2048;
          double v31 = v13;
          id v14 = v12;
          LODWORD(v26) = 22;
          uint64_t v15 = (void *)_os_log_send_and_compose_impl();

          if (!v15)
          {
LABEL_17:

            objc_initWeak((id *)location, *(id *)(a1 + 32));
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __39__SSMetricsController__setupFlushTimer__block_invoke_57;
            block[3] = &unk_1E5BA8860;
            objc_copyWeak(&v28, (id *)location);
            void block[4] = *(void *)(a1 + 32);
            dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
            uint64_t v23 = *(void *)(a1 + 32);
            uint64_t v24 = *(void **)(v23 + 56);
            *(void *)(v23 + 56) = v22;

            dispatch_time_t v25 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
            dispatch_after(v25, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 40), *(dispatch_block_t *)(*(void *)(a1 + 32) + 56));
            objc_destroyWeak(&v28);
            objc_destroyWeak((id *)location);
            return;
          }
          uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, location, v26);
          free(v15);
          SSFileLog(v8, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v11);
        }

        goto LABEL_17;
      }
    }
  }
}

void __39__SSMetricsController__setupFlushTimer__block_invoke_57(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 56);
    *(void *)(v2 + 56) = 0;

    [WeakRetained _handleFlushTimer];
    [WeakRetained _setupFlushTimer];
  }
}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  if (self->_flushTimerEnabled != a3)
  {
    self->_flushTimerEnabled = a3;
    [(SSMetricsController *)self _setupFlushTimer];
  }
}

- (id)configuration
{
  return self->_configuration;
}

- (void)flushUnreportedEventsWithCompletionHandler:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SSMetricsController *)self configuration];
  int v6 = [v5 isSendDisabled];

  if (!v6)
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v12 = *(id *)((char *)location + 4);
      LODWORD(v35) = 12;
      id v34 = location;
      float v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        id v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, location, v35);
        free(v13);
        SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      }
    }
    else
    {
    }
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
      goto LABEL_30;
    }
    uint64_t v21 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v21)
    {
      uint64_t v21 = +[SSLogConfig sharedConfig];
    }
    int v22 = objc_msgSend(v21, "shouldLog", v34);
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    uint64_t v24 = [v21 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      int v25 = v23;
    }
    else {
      int v25 = v23 & 2;
    }
    if (v25)
    {
      LODWORD(location[0]) = 136446210;
      *(id *)((char *)location + 4) = "-[SSMetricsController flushUnreportedEventsWithCompletionHandler:]";
      LODWORD(v35) = 12;
      uint64_t v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_29:

LABEL_30:
        objc_initWeak(location, self);
        v33 = [(SSMetricsController *)self serialQueue];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_58;
        v36[3] = &unk_1E5BA9D48;
        objc_copyWeak(&v38, location);
        v36[4] = self;
        id v37 = v4;
        dispatch_async(v33, v36);

        objc_destroyWeak(&v38);
        objc_destroyWeak(location);
        goto LABEL_31;
      }
      uint64_t v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, location, v35);
      free(v26);
      SSFileLog(v21, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v24);
    }

    goto LABEL_29;
  }
  if (v4)
  {
    double v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5BA8EC0;
    id v40 = v4;
    dispatch_async(v7, block);
  }
LABEL_31:
}

uint64_t __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", 114);
  id v4 = [WeakRetained _connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5BA6EE0;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 sendMessage:v3 withReply:v6];
}

void __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 40))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = (id)SSXPCDictionaryCopyObjectWithClass(v4, "0", v6);
    int v8 = [v7 intValue];
    uint64_t v9 = +[SSLogConfig sharedStoreServicesConfig];
    int v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
      {
        int v10 = +[SSLogConfig sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      float v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        v12 &= 2u;
      }
      if (!v12) {
        goto LABEL_30;
      }
      id v14 = objc_opt_class();
      id v15 = v14;
      int v36 = 138412546;
      id v37 = v14;
      __int16 v38 = 1024;
      int v39 = [v7 intValue];
      LODWORD(v32) = 18;
    }
    else
    {
      if (!v9)
      {
        int v10 = +[SSLogConfig sharedConfig];
      }
      int v19 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      float v13 = [v10 OSLogObject];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        v20 &= 2u;
      }
      if (!v20) {
        goto LABEL_30;
      }
      int v36 = 138412290;
      id v37 = (id)objc_opt_class();
      id v15 = v37;
      LODWORD(v32) = 12;
    }
    uint64_t v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21) {
      goto LABEL_31;
    }
    float v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v36, v32);
    free(v21);
    SSFileLog(v10, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v13);
LABEL_30:

    goto LABEL_31;
  }
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
    {
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v28);
      if ([v29 intValue])
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = xpc_dictionary_get_value(v4, "1");
        uint64_t v16 = (void *)[v30 initWithXPCEncoding:v31];
      }
      else
      {
        uint64_t v16 = 0;
      }

      goto LABEL_18;
    }
    uint64_t v5 = 111;
  }
  uint64_t v16 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_18:
  uint64_t v17 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5BA7328;
  id v18 = *(id *)(a1 + 40);
  id v34 = v16;
  id v35 = v18;
  id v7 = v16;
  dispatch_async(v17, block);

  int v10 = v35;
LABEL_31:
}

uint64_t __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)isDisabled
{
  uint64_t v2 = [(SSMetricsController *)self configuration];
  char v3 = [v2 isDisabled];

  return v3;
}

- (void)insertEvent:(id)a3 withCompletionHandler:(id)a4
{
  if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    id v8 = [v6 arrayWithObject:a3];
    -[SSMetricsController insertEvents:withCompletionHandler:](self, "insertEvents:withCompletionHandler:");
  }
  else
  {
    id v8 = a4;
    -[SSMetricsController insertEvents:withCompletionHandler:](self, "insertEvents:withCompletionHandler:", 0);
  }
}

- (void)insertEvents:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SSMetricsController *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5BA9D70;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  float v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v3 = SSRestrictionsIsOnDeviceDiagnosticsAllowed();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        if (([v10 requiresDiagnosticSendingPermission] ^ 1 | v3) == 1) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [*(id *)(a1 + 32) count];
  if (v11 != [v4 count])
  {
    uint64_t v12 = [*(id *)(a1 + 32) count];
    uint64_t v13 = [v4 count];
    id v14 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    uint64_t v17 = [v14 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      id v18 = objc_opt_class();
      int v88 = 138412546;
      v89 = v18;
      __int16 v90 = 2048;
      uint64_t v91 = v12 - v13;
      id v19 = v18;
      LODWORD(v77) = 22;
      uint64_t v76 = &v88;
      int v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v88, v77);
      free(v20);
      SSFileLog(v14, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
    }

    goto LABEL_22;
  }
LABEL_23:
  if (objc_msgSend(v4, "count", v76))
  {
    if ([WeakRetained isDisabled])
    {
      uint64_t v27 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v27)
      {
        uint64_t v27 = +[SSLogConfig sharedConfig];
      }
      int v28 = [v27 shouldLog];
      if ([v27 shouldLogToDisk]) {
        int v29 = v28 | 2;
      }
      else {
        int v29 = v28;
      }
      id v30 = [v27 OSLogObject];
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
        v29 &= 2u;
      }
      if (v29)
      {
        uint64_t v31 = objc_opt_class();
        id v32 = v31;
        uint64_t v33 = [v4 count];
        int v88 = 138412546;
        v89 = v31;
        __int16 v90 = 2048;
        uint64_t v91 = v33;
        LODWORD(v77) = 22;
        id v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34) {
          goto LABEL_36;
        }
        id v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v34, 4, &v88, v77);
        free(v34);
        SSFileLog(v27, @"%@", v35, v36, v37, v38, v39, v40, (uint64_t)v30);
      }

LABEL_36:
      id v41 = *(void **)(a1 + 48);
      if (v41)
      {
        int v42 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_61;
        block[3] = &unk_1E5BA8EC0;
        id v81 = v41;
        dispatch_async(v42, block);

        int v43 = v81;
LABEL_66:

        goto LABEL_67;
      }
      goto LABEL_67;
    }
    v59 = [WeakRetained configuration];
    int v43 = [v59 reportingURLString];

    if ([v43 length])
    {
      [WeakRetained _serialQueueInsertEvents:v4 withCompletionHandler:*(void *)(a1 + 48)];
      goto LABEL_66;
    }
    int v60 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v60)
    {
      int v60 = +[SSLogConfig sharedConfig];
    }
    int v61 = [v60 shouldLog];
    if ([v60 shouldLogToDisk]) {
      int v62 = v61 | 2;
    }
    else {
      int v62 = v61;
    }
    uint64_t v63 = [v60 OSLogObject];
    if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
      v62 &= 2u;
    }
    if (v62)
    {
      uint64_t v64 = objc_opt_class();
      id v65 = v64;
      uint64_t v66 = [v4 count];
      int v88 = 138412546;
      v89 = v64;
      __int16 v90 = 2048;
      uint64_t v91 = v66;
      LODWORD(v77) = 22;
      uint64_t v67 = (void *)_os_log_send_and_compose_impl();

      if (!v67) {
        goto LABEL_64;
      }
      uint64_t v63 = objc_msgSend(NSString, "stringWithCString:encoding:", v67, 4, &v88, v77);
      free(v67);
      SSFileLog(v60, @"%@", v68, v69, v70, v71, v72, v73, (uint64_t)v63);
    }

LABEL_64:
    id v74 = *(void **)(a1 + 48);
    if (v74)
    {
      v75 = dispatch_get_global_queue(0, 0);
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_60;
      v82[3] = &unk_1E5BA8EC0;
      id v83 = v74;
      dispatch_async(v75, v82);
    }
    goto LABEL_66;
  }
  int v44 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v44)
  {
    int v44 = +[SSLogConfig sharedConfig];
  }
  int v45 = [v44 shouldLog];
  if ([v44 shouldLogToDisk]) {
    int v46 = v45 | 2;
  }
  else {
    int v46 = v45;
  }
  v47 = [v44 OSLogObject];
  if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
    v46 &= 2u;
  }
  if (v46)
  {
    uint64_t v48 = objc_opt_class();
    int v88 = 138412290;
    v89 = v48;
    id v49 = v48;
    LODWORD(v77) = 12;
    uint64_t v50 = (void *)_os_log_send_and_compose_impl();

    if (!v50) {
      goto LABEL_49;
    }
    v47 = objc_msgSend(NSString, "stringWithCString:encoding:", v50, 4, &v88, v77);
    free(v50);
    SSFileLog(v44, @"%@", v51, v52, v53, v54, v55, v56, (uint64_t)v47);
  }

LABEL_49:
  int v57 = *(void **)(a1 + 48);
  if (v57)
  {
    int v58 = dispatch_get_global_queue(0, 0);
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_62;
    v78[3] = &unk_1E5BA8EC0;
    id v79 = v57;
    dispatch_async(v58, v78);

    int v43 = v79;
    goto LABEL_66;
  }
LABEL_67:
}

uint64_t __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)locationWithPosition:(int64_t)a3 type:(id)a4 fieldData:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(SSMetricsEventLocation);
  [(SSMetricsEventLocation *)v10 setLocationPosition:a3];
  [(SSMetricsEventLocation *)v10 setLocationType:v8];
  uint64_t v11 = [(SSMetricsConfiguration *)self->_configuration fieldsMap];
  uint64_t v12 = [v11 objectForKey:@"single"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke;
    v33[3] = &unk_1E5BA9610;
    id v34 = v10;
    [(SSMetricsController *)self _enumerateFieldValuesWithMap:v12 fieldData:v9 block:v33];
  }
  uint64_t v13 = [v11 objectForKey:@"multi"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke_2;
    v31[3] = &unk_1E5BA9610;
    id v32 = v10;
    [(SSMetricsController *)self _enumerateFieldValuesWithMap:v13 fieldData:v9 block:v31];
  }
  id v14 = [v11 objectForKey:@"custom"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v23 = v13;
    uint64_t v24 = v12;
    uint64_t v25 = v11;
    id v26 = v8;
    int v15 = [v14 objectForKey:@"location"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v21 = [(SSMetricsController *)self _valueForField:v20 withFieldData:v9];
            if (v21) {
              [(SSMetricsEventLocation *)v10 setValue:v21 forLocationKey:v20];
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v17);
    }

    uint64_t v11 = v25;
    id v8 = v26;
    uint64_t v13 = v23;
    uint64_t v12 = v24;
  }

  return v10;
}

uint64_t __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) setValue:a3 forLocationKey:a2];
  *a4 = 1;
  return result;
}

uint64_t __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forLocationKey:a2];
}

- (id)pingURLs
{
  return [(SSMetricsConfiguration *)self->_configuration pingURLs];
}

- (void)recordAnalyticsForMetricsDialogEvent:(id)a3 withTopic:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (!SSIsDaemon())
  {
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
      goto LABEL_20;
    }
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v25 = 136446210;
      id v26 = "-[SSMetricsController recordAnalyticsForMetricsDialogEvent:withTopic:]";
      LODWORD(v22) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_19:

LABEL_20:
        xpc_object_t v20 = SSXPCCreateMessageDictionary(197);
        SSXPCDictionarySetObject(v20, "1", v7);

        SSXPCDictionarySetObject(v20, "2", v6);
        uint64_t v21 = [(SSMetricsController *)self _connection];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __70__SSMetricsController_recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke;
        v24[3] = &unk_1E5BA9D98;
        v24[4] = self;
        [v21 sendMessage:v20 withReply:v24];

        return;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v25, v22);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_19;
  }
  id v23 = objc_alloc_init(NSClassFromString(&cfstr_Metricscontrol.isa));
  [v23 recordAnalyticsWithMetricsDialogEvent:v7 forTopic:v6];
}

void __70__SSMetricsController_recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = v2;
  if (v2 == (id)MEMORY[0x1E4F14520])
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (!v9) {
      goto LABEL_24;
    }
LABEL_21:
    *(_DWORD *)int v25 = 138412290;
    *(void *)&v25[4] = objc_opt_class();
    id v10 = *(id *)&v25[4];
    LODWORD(v24) = 12;
    uint64_t v11 = (void *)_os_log_send_and_compose_impl();

    goto LABEL_22;
  }
  if (!v2 || MEMORY[0x1A62689E0](v2) != MEMORY[0x1E4F14590])
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    id v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (!v6) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  BOOL v18 = xpc_dictionary_get_BOOL(v3, "0");
  id v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v19 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v20 &= 2u;
  }
  if (!v20) {
    goto LABEL_24;
  }
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = @"NO";
  if (v18) {
    uint64_t v22 = @"YES";
  }
  *(_DWORD *)int v25 = 138412546;
  *(void *)&v25[4] = v21;
  *(_WORD *)&v25[12] = 2112;
  *(void *)&v25[14] = v22;
  id v23 = v21;
  LODWORD(v24) = 22;
  uint64_t v11 = (void *)_os_log_send_and_compose_impl();

LABEL_22:
  if (v11)
  {
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, v25, v24, *(_OWORD *)v25);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
LABEL_24:
  }
}

- (id)serialQueue
{
  return self->_serialQueue;
}

- (void)setGlobalConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [(SSMetricsController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SSMetricsController_setGlobalConfiguration___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__SSMetricsController_setGlobalConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    [v2 reportingFrequency];
    double v5 = v4;
    [*(id *)(*(void *)(a1 + 32) + 24) reportingFrequency];
    if (v5 != v6) {
      [*(id *)(a1 + 32) setFlushTimerEnabled:0];
    }
    id v7 = [*(id *)(*(void *)(a1 + 32) + 24) childConfiguration];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 24) setChildConfiguration:v7];
  }
}

- (void)setPageConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(SSMetricsController *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SSMetricsController_setPageConfiguration___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __44__SSMetricsController_setPageConfiguration___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 24)) {
    return [*(id *)(*(void *)(result + 32) + 24) setChildConfiguration:*(void *)(result + 40)];
  }
  return result;
}

- (void)_applicationWillEnterForeground
{
  if (self->_flushOnForeground)
  {
    [(SSMetricsController *)self _flushUnreportedEventsIfEnabled];
    self->_flushOnForeground = 0;
  }
}

- (void)_enumerateFieldValuesWithMap:(id)a3 fieldData:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__SSMetricsController__enumerateFieldValuesWithMap_fieldData_block___block_invoke;
  v12[3] = &unk_1E5BA9DC0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a3 enumerateKeysAndObjectsUsingBlock:v12];
}

void __68__SSMetricsController__enumerateFieldValuesWithMap_fieldData_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = [*(id *)(a1 + 32) _valueForField:v12 withFieldData:*(void *)(a1 + 40)];
              if (v13) {
                (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
}

- (id)_valueForField:(id)a3 withFieldData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SSMetricsConfiguration *)self->_configuration valueForConfigurationKey:v6];
  if (!v8)
  {
    uint64_t v8 = [v7 valueForMetricsField:v6];
  }

  return v8;
}

- (id)_userType
{
  id v2 = +[SSVSubscriptionStatusCoordinator sharedCoordinator];
  uint64_t v3 = [v2 lastKnownStatus];

  unint64_t v4 = [v3 accountStatus];
  if (v4 > 4) {
    id v5 = 0;
  }
  else {
    id v5 = off_1E5BA9DE0[v4];
  }

  return v5;
}

- (BOOL)isFlushTimerEnabled
{
  return self->_flushTimerEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimerQueue, 0);
  objc_storeStrong(&self->_flushTimerBlock, 0);
  objc_storeStrong((id *)&self->_flushSerialQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_engagement, 0);
}

@end