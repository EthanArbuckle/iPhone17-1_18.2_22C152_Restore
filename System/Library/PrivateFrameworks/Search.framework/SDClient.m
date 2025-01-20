@interface SDClient
+ (id)clientForConnection:(id)a3;
+ (void)initialize;
+ (void)registerMessageHandlersWithServer:(id)a3;
- (BOOL)active;
- (BOOL)didTimerFire;
- (OS_dispatch_source)resumeBackgroundActivityTimer;
- (void)_beginCrashHandlingForStore:(id)a3 andQuery:(id)a4;
- (void)_endCrashHandling;
- (void)activateForConnection:(id)a3 message:(id)a4;
- (void)addAndStartQuery:(id)a3;
- (void)cancelQueryWithExternalID:(unsigned int)a3;
- (void)clearInputForConnection:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)death;
- (void)removeActiveQuery:(id)a3;
- (void)setActivation:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDidTimerFire:(BOOL)a3;
- (void)setResumeBackgroundActivityTimer:(id)a3;
@end

@implementation SDClient

- (void)setActivation:(id)a3
{
  v4 = (SPXPCMessage *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentActivation = obj->_currentActivation;
  if (currentActivation) {
    [(SPXPCMessage *)currentActivation sendReply:&__NSDictionary0__struct];
  }
  v6 = obj->_currentActivation;
  obj->_currentActivation = v4;

  objc_sync_exit(obj);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.searchd"];
    byte_1000A8CA0 = [v2 BOOLForKey:@"enableDebug"];
  }
}

- (void)_beginCrashHandlingForStore:(id)a3 andQuery:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  qword_1000A8CA8 = (uint64_t)signal(10, (void (__cdecl *)(int))sub_100005618);
  qword_1000A8CB0 = (uint64_t)signal(6, (void (__cdecl *)(int))sub_100005618);
  qword_1000A8CB8 = (uint64_t)signal(11, (void (__cdecl *)(int))sub_100005618);
  uint64_t v7 = objc_opt_class();

  v8 = [v5 queryContext];

  v9 = [v8 searchString];
  v10 = +[NSString stringWithFormat:@"error: crash using datastore %@ with search string '%@'\n", v7, v9];

  id v11 = v10;
  asprintf((char **)&qword_1000A8CC0, "%s", (const char *)[v11 UTF8String]);
}

- (void)_endCrashHandling
{
  qword_1000A8CC0 = 0;
}

- (void)removeActiveQuery:(id)a3
{
  id v7 = a3;
  v4 = self->_queriesByExternId;
  objc_sync_enter(v4);
  queriesByExternId = self->_queriesByExternId;
  id v6 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v7 externalID]);
  [(NSMutableDictionary *)queriesByExternId removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (void)addAndStartQuery:(id)a3
{
  id v101 = a3;
  uint64_t v4 = si_tracing_current_span();
  long long v5 = *(_OWORD *)(v4 + 16);
  long long v128 = *(_OWORD *)v4;
  long long v129 = v5;
  uint64_t v130 = *(void *)(v4 + 32);
  uint64_t v6 = *(void *)v4;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v4 + 8);
  *(void *)uint64_t v4 = v6;
  *(void *)(v4 + 8) = spanid;
  *(void *)(v4 + 16) = v8;
  *(unsigned char *)(v4 + 28) = 102;
  *(void *)(v4 + 32) = "-[SDClient addAndStartQuery:]";
  si_tracing_log_span_begin();
  if ((byte_1000A8CC8 & 1) == 0)
  {
    byte_1000A8CC8 = 1;
    +[SDSearchQuery prepareCacheForSearchContinuation];
  }
  [v101 start];
  v99 = [v101 queryContext];
  v9 = [v99 searchEntities];
  if ([v9 count])
  {
    v10 = [v99 searchEntities];
    id v11 = [v10 lastObject];
    v98 = [v11 currentSearchString];
  }
  else
  {
    v98 = [v99 searchString];
  }

  v12 = SPLogForSPLogCategoryDefault();
  os_log_type_t v13 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v12, v13))
  {
    v14 = [v99 searchDomains];
    *(_DWORD *)buf = 138412546;
    v136 = v98;
    __int16 v137 = 2112;
    v138 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "#query Starting query for %@ on domains %@", buf, 0x16u);
  }
  if (!self->_queriesByExternId)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriesByExternId = self->_queriesByExternId;
    self->_queriesByExternId = v15;
  }
  v17 = SPLogForSPLogCategoryDefault();
  os_log_type_t v18 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v17, v18))
  {
    v19 = [v99 searchDomains];
    *(_DWORD *)buf = 138412546;
    v136 = v98;
    __int16 v137 = 2112;
    v138 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "#query Starting query '%@' on domains:%@", buf, 0x16u);
  }
  v20 = self->_queriesByExternId;
  objc_sync_enter(v20);
  v21 = self->_queriesByExternId;
  v22 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v101 externalID]);
  [(NSMutableDictionary *)v21 setObject:v101 forKey:v22];

  objc_sync_exit(v20);
  v23 = [v101 connection];
  v97 = [v23 bundleID];

  if ([v97 isEqual:SPSpotlightAppBundleId])
  {
    if ([v98 length])
    {
      if ([(NSString *)self->_lastQuery length]
        && (([v98 hasPrefix:self->_lastQuery] & 1) != 0
         || [(NSString *)self->_lastQuery hasPrefix:v98]))
      {
        v24 = (char *)[v98 length];
        NSUInteger v25 = [(NSString *)self->_lastQuery length];
        v26 = &v24[-v25];
        if ((uint64_t)&v24[-v25] < 0) {
          v26 = (char *)(v25 - (void)v24);
        }
        v117 = _NSConcreteStackBlock;
        uint64_t v118 = 3221225472;
        v119 = sub_1000068E0;
        v120 = &unk_100091F18;
        v121 = v26;
        AnalyticsSendEventLazy();
      }
      else
      {
        lastQuery = self->_lastQuery;
        if (lastQuery)
        {
          v28 = [(NSString *)lastQuery commonPrefixWithString:v98 options:2];
        }
        else
        {
          v28 = &stru_100094088;
        }
        v122 = _NSConcreteStackBlock;
        uint64_t v123 = 3221225472;
        v124 = sub_10000680C;
        v125 = &unk_100091EF8;
        id v126 = v98;
        v127 = v28;
        AnalyticsSendEventLazy();
      }
    }
    v29 = (NSString *)[v98 copy];
    v30 = self->_lastQuery;
    self->_lastQuery = v29;
  }
  v31 = +[SDController datastores];
  BOOL v32 = [v31 count] == 0;

  if (!v32)
  {
    id v100 = objc_alloc_init((Class)NSMutableOrderedSet);
    if (![v98 length])
    {
      v33 = [v99 searchEntities];
      BOOL v34 = [v33 count] == 0;

      if (v34)
      {
LABEL_110:
        if (![v100 count])
        {
          v75 = SPLogForSPLogCategoryQuery();
          os_log_type_t v76 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v75, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v75, v76, "#query No stores for query!", buf, 2u);
          }

          [v101 sendQueryCompleted];
          goto LABEL_140;
        }
        id v70 = objc_alloc_init((Class)NSMutableSet);
        if ([v101 infinitePatience])
        {
          v71 = SPLogForSPLogCategoryDefault();
          os_log_type_t v72 = 2 * (gSPLogDebugAsDefault == 0);
          double v73 = 0.0;
          if (!os_log_type_enabled(v71, v72))
          {
LABEL_137:

            v85 = SPLogForSPLogCategoryDefault();
            os_log_type_t v86 = 2 * (gSPLogDebugAsDefault == 0);
            if (os_log_type_enabled(v85, v86))
            {
              qos_class_t v87 = qos_class_self();
              *(_DWORD *)buf = 67109120;
              LODWORD(v136) = v87;
              _os_log_impl((void *)&_mh_execute_header, v85, v86, "QOS addAndStartQuery: %d", buf, 8u);
            }

            v88 = +[SDController workQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100006994;
            block[3] = &unk_100091F68;
            id v103 = v101;
            id v104 = v97;
            double v108 = v73;
            id v105 = v100;
            id v89 = v70;
            id v106 = v89;
            id v107 = v98;
            dispatch_block_t v90 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
            tracing_dispatch_async();

LABEL_140:
            goto LABEL_141;
          }
          *(_WORD *)buf = 0;
          v74 = "Query with infinite patience";
        }
        else
        {
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v77 = v100;
          id v78 = [v77 countByEnumeratingWithState:&v109 objects:v131 count:16];
          if (v78)
          {
            uint64_t v79 = *(void *)v110;
            double v73 = 0.0;
            do
            {
              for (i = 0; i != v78; i = (char *)i + 1)
              {
                if (*(void *)v110 != v79) {
                  objc_enumerationMutation(v77);
                }
                v81 = *(void **)(*((void *)&v109 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  objc_msgSend(v81, "timeOut:", objc_msgSend(v81, "domain") == 7);
                  double v83 = v82;
                  if (v82 > 0.0)
                  {
                    [v70 addObject:v81];
                    if (v83 >= v73) {
                      double v84 = v73;
                    }
                    else {
                      double v84 = v83;
                    }
                    if (v73 <= 0.0) {
                      double v73 = v83;
                    }
                    else {
                      double v73 = v84;
                    }
                  }
                }
              }
              id v78 = [v77 countByEnumeratingWithState:&v109 objects:v131 count:16];
            }
            while (v78);
          }
          else
          {
            double v73 = 0.0;
          }

          v71 = SPLogForSPLogCategoryDefault();
          os_log_type_t v72 = 2 * (gSPLogDebugAsDefault == 0);
          if (!os_log_type_enabled(v71, v72)) {
            goto LABEL_137;
          }
          *(_WORD *)buf = 0;
          v74 = "Query with timeout";
        }
        _os_log_impl((void *)&_mh_execute_header, v71, v72, v74, buf, 2u);
        goto LABEL_137;
      }
    }
    id v35 = [v99 queryKind];
    id v36 = v97;
    if (qword_1000A8CF0 != -1) {
      dispatch_once(&qword_1000A8CF0, &stru_100092250);
    }
    if (byte_1000A8CE9) {
      goto LABEL_31;
    }
    if (byte_1000A8CE8)
    {
      if (([v36 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v36 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
LABEL_31:

        goto LABEL_32;
      }
      unsigned int v42 = [v36 hasPrefix:@"com.apple.ondeviceeval"];
      if (v35 == (id)12) {
        int v43 = 1;
      }
      else {
        int v43 = v42;
      }

      if (v43)
      {
LABEL_32:
        v37 = [v99 searchString];
        v38 = +[SPSearchQueryContext normalizeSearchString:v37 queryContext:v99];
        [v99 setSearchString:v38];

        v39 = +[SDController datastoreForDomain:1];
        if (v39) {
          [v100 addObject:v39];
        }
LABEL_109:

        goto LABEL_110;
      }
    }
    else
    {
    }
    v44 = [v99 searchDomains];
    v45 = [v44 arrayByAddingObject:&off_100098A20];

    v39 = [v45 arrayByAddingObject:&off_100098A38];

    CFStringRef v133 = @"ExtendedDeviceLockState";
    CFBooleanRef v134 = kCFBooleanTrue;
    v93 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
    if ([v99 deviceAuthenticationState])
    {
      id v46 = +[SDController datastoreForDomain:1];
      v47 = +[SDController datastoreForDomain:2];
      v48 = +[SDController datastoreForDomain:7];
      v96 = +[SDController datastoreForDomain:3];
      v95 = +[SDController datastoreForDomain:6];
      v92 = +[SDController datastoreForDomain:8];
      v94 = +[SDController datastoreForDomain:9];
      v49 = +[SDController datastoreForDomain:10];
      uint64_t v50 = +[SDController datastoreForDomain:11];
      v51 = (void *)v50;
      if (v47 || v96 || v46 || v95 || v94 || v49 || v50)
      {
        if (v47)
        {
          v52 = SPGetDisabledDomains();
          unsigned __int8 v53 = [v52 containsObject:&off_100098A50];

          if ((v53 & 1) == 0) {
            [v100 addObject:v47];
          }
        }
        if (v96) {
          [v100 addObject:v96];
        }
        if (v46) {
          [v100 addObject:v46];
        }
        if (v95) {
          [v100 addObject:v95];
        }
        if (v92) {
          [v100 addObject:v92];
        }
        if (v48) {
          [v100 addObject:v48];
        }
        if (v94) {
          [v100 addObject:v94];
        }
        if (v49) {
          [v100 addObject:v49];
        }
        if (v51) {
          [v100 addObject:v51];
        }
      }
    }
    else
    {
      if ([v39 containsObject:&off_100098A20])
      {
        v54 = +[SDController datastoreForDomain:10];
        if (v54) {
          [v100 addObject:v54];
        }
      }
      if ([v39 containsObject:&off_100098A68])
      {
        v55 = +[SDController datastoreForDomain:1];
        if (v55) {
          [v100 addObject:v55];
        }
      }
      if ([v39 containsObject:&off_100098A80])
      {
        v56 = +[SDController datastoreForDomain:2];
        v57 = +[SDController datastoreForDomain:7];
        if (v56)
        {
          v58 = SPGetDisabledDomains();
          unsigned __int8 v59 = [v58 containsObject:&off_100098A50];

          if ((v59 & 1) == 0) {
            [v100 addObject:v56];
          }
        }
        if (v57) {
          [v100 addObject:v57];
        }
      }
      if (v39)
      {
        v60 = [v39 arrayByAddingObject:&off_100098A98];
      }
      else
      {
        v60 = 0;
      }
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v46 = v60;
      id v61 = [v46 countByEnumeratingWithState:&v113 objects:v132 count:16];
      if (v61)
      {
        uint64_t v62 = *(void *)v114;
        do
        {
          for (j = 0; j != v61; j = (char *)j + 1)
          {
            if (*(void *)v114 != v62) {
              objc_enumerationMutation(v46);
            }
            v64 = *(void **)(*((void *)&v113 + 1) + 8 * (void)j);
            id v65 = [v64 intValue];
            uint64_t v66 = +[SDController datastoreForDomain:v65];
            v67 = (void *)v66;
            if (v65 == 6)
            {
              [v101 addDelayedStartStore:v66];
            }
            else if (v66)
            {
              if (([v100 containsObject:v66] & 1) == 0) {
                [v100 addObject:v67];
              }
            }
            else
            {
              v68 = SPLogForSPLogCategoryQuery();
              os_log_type_t v69 = 2 * (gSPLogDebugAsDefault == 0);
              if (os_log_type_enabled(v68, v69))
              {
                *(_DWORD *)buf = 138412290;
                v136 = v64;
                _os_log_impl((void *)&_mh_execute_header, v68, v69, "#query Missing datastore for domain %@!", buf, 0xCu);
              }
            }
          }
          id v61 = [v46 countByEnumeratingWithState:&v113 objects:v132 count:16];
        }
        while (v61);
      }
      v39 = v46;
    }

    goto LABEL_109;
  }
  v40 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    sub_100064CBC(v40);
  }

  v41 = +[NSError errorWithDomain:@"SearchError" code:1 userInfo:0];
  [v101 sendError:v41];

  [v101 sendQueryCompleted];
LABEL_141:

  si_tracing_log_span_end();
  long long v91 = v129;
  *(_OWORD *)uint64_t v4 = v128;
  *(_OWORD *)(v4 + 16) = v91;
  *(void *)(v4 + 32) = v130;
}

- (void)clearInputForConnection:(id)a3
{
  id v3 = +[SDController workQueue];
  md_tracing_dispatch_async_propagating();
}

- (void)cancelQueryWithExternalID:(unsigned int)a3
{
  id v3 = +[SDController workQueue];
  md_tracing_dispatch_async_propagating();
}

- (void)activateForConnection:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[SDLockHandler sharedLockHandler];
  [v8 checkMigrationComplete];

  if (v7) {
    goto LABEL_2;
  }
  if (!self->_active)
  {
    id v11 = [v6 bundleID];
    unsigned int v12 = [v11 isEqualToString:@"com.apple.Spotlight"];

    if (v12)
    {
      os_log_type_t v13 = SPLogForSPLogCategoryDefault();
      os_log_type_t v14 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(v13, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Activate Spotlight", buf, 2u);
      }

      id v7 = [objc_alloc((Class)SPXPCMessage) initWithName:@"Activate" connection:v6];
      if (v7)
      {
LABEL_2:
        [(SDClient *)self setActivation:v7];
        if (self->_active)
        {
          v9 = SPLogForSPLogCategoryDefault();
          os_log_type_t v10 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v9, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, v10, "already active, ignoring", buf, 2u);
          }
        }
        else
        {
          v9 = +[SDController workQueue];
          self->_active = 1;
          kdebug_trace();
          v38 = [v6 bundleID];
          v15 = SPLogForSPLogCategoryDefault();
          os_log_type_t v16 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v15, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v38;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "Activate from %@", buf, 0xCu);
          }

          if ([v38 isEqualToString:@"com.apple.springboard"])
          {
            v17 = SPLogForSPLogCategoryDefault();
            os_log_type_t v18 = gSPLogInfoAsDefault ^ 1;
            if (os_log_type_enabled(v17, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, v18, "Activate from SpringBoard", buf, 2u);
            }

            if (qword_1000A8CD8 != -1) {
              dispatch_once(&qword_1000A8CD8, &stru_100091FD0);
            }
            v19 = [v7 rootObjectOfClasses:qword_1000A8CD0];
            self->_isSpringBoard = 1;
            v20 = SPLogForSPLogCategoryDefault();
            os_log_type_t v21 = 2 * (gSPLogDebugAsDefault == 0);
            if (os_log_type_enabled(v20, v21))
            {
              id v37 = [v19 count];
              v22 = [v19 objectForKey:@"apps"];
              id v36 = [v22 count];
              v23 = [v19 objectForKey:@"apps"];
              v24 = [v19 objectForKey:@"hiddenApps"];
              *(_DWORD *)buf = 138413314;
              *(void *)&uint8_t buf[4] = v7;
              __int16 v44 = 2048;
              id v45 = v37;
              __int16 v46 = 2048;
              id v47 = v36;
              __int16 v48 = 2112;
              v49 = v23;
              __int16 v50 = 2112;
              v51 = v24;
              _os_log_impl((void *)&_mh_execute_header, v20, v21, "Received apps: %@ %ld %ld %@ %@", buf, 0x34u);
            }
            if (v19)
            {
              NSUInteger v25 = [v19 objectForKey:@"apps"];
              v26 = [v19 objectForKey:@"hiddenApps"];
              SPFastApplicationsSet();
            }
            v27 = +[SDAppUninstallMonitor sharedInstance];
            [v27 ready];

            *(void *)buf = 0;
            objc_initWeak((id *)buf, self);
            dispatch_time_t v28 = dispatch_time(0, 2000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100007AE0;
            block[3] = &unk_100091FF8;
            objc_copyWeak(&v42, (id *)buf);
            dispatch_after(v28, v9, block);
            objc_destroyWeak(&v42);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            SSScreenTimeStatusClearCache();
            +[SPCoreSpotlightIndexer preheat];
            byte_1000A8CC8 = 1;
            dispatch_block_t v29 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &stru_100092018);
            tracing_dispatch_async();

            self->_didTimerFire = 0;
            v30 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);
            resumeBackgroundActivityTimer = self->_resumeBackgroundActivityTimer;
            self->_resumeBackgroundActivityTimer = v30;

            *(void *)buf = 0;
            objc_initWeak((id *)buf, self);
            BOOL v32 = self->_resumeBackgroundActivityTimer;
            dispatch_time_t v33 = dispatch_time(0, 180000000000);
            dispatch_source_set_timer(v32, v33, 0xFFFFFFFFFFFFFFFFLL, 0);
            BOOL v34 = self->_resumeBackgroundActivityTimer;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_100007CB0;
            handler[3] = &unk_100091FF8;
            objc_copyWeak(&v40, (id *)buf);
            dispatch_source_set_event_handler(v34, handler);
            dispatch_resume((dispatch_object_t)self->_resumeBackgroundActivityTimer);
            id v35 = SPGetDisabledDomains();
            [v35 containsObject:&off_100098A50];

            AnalyticsSendEventLazy();
            objc_destroyWeak(&v40);
            objc_destroyWeak((id *)buf);
          }
        }
      }
    }
  }
}

- (void)deactivate
{
  if (!self->_isSpringBoard)
  {
    resumeBackgroundActivityTimer = self->_resumeBackgroundActivityTimer;
    if (resumeBackgroundActivityTimer) {
      dispatch_source_cancel(resumeBackgroundActivityTimer);
    }
    if (self->_active)
    {
      if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
      {
        uint64_t v4 = +[SDController workQueue];
        tracing_dispatch_async();
      }
      if (!self->_didTimerFire)
      {
        long long v5 = +[SDController workQueue];
        dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, &stru_100092078);
        tracing_dispatch_async();
      }
    }
    id v7 = +[SDController backgroundWorkQueue];
    tracing_dispatch_async();

    +[SPCoreSpotlightIndexer deactivate];
    +[SSRankingManager deactivate];
  }
  lastQuery = self->_lastQuery;
  self->_lastQuery = 0;

  self->_active = 0;

  [(SDClient *)self setActivation:0];
}

- (void)death
{
  id v3 = +[SDFeedbackInterceptor sharedInstance];
  [v3 cleanup];

  [(SDClient *)self deactivate];
}

+ (id)clientForConnection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 context];

  if (!v4)
  {
    long long v5 = objc_alloc_init(SDClient);
    [v3 setContext:v5];
  }
  dispatch_block_t v6 = [v3 context];

  return v6;
}

+ (void)registerMessageHandlersWithServer:(id)a3
{
  id v3 = a3;
  [v3 setHandlerForMessageName:@"OpenQuery" handler:&stru_1000920D8];
  [v3 setHandlerForMessageName:@"CloseQuery" handler:&stru_1000920F8];
  [v3 setHandlerForMessageName:@"ClearInput" handler:&stru_100092118];
  [v3 setHandlerForMessageName:@"RequestFTE" handler:&stru_100092138];
  [v3 setHandlerForMessageName:@"Activate" handler:&stru_1000921D0];
  [v3 setHandlerForMessageName:@"Deactivate" handler:&stru_1000921F0];
  [v3 setHandlerForMessageName:@"Preheat" handler:&stru_100092210];
}

- (void)dealloc
{
  [(SDClient *)self deactivate];
  id v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "SDClient dealloc", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)SDClient;
  [(SDClient *)&v5 dealloc];
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (OS_dispatch_source)resumeBackgroundActivityTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 88, 1);
}

- (void)setResumeBackgroundActivityTimer:(id)a3
{
}

- (BOOL)didTimerFire
{
  return self->_didTimerFire;
}

- (void)setDidTimerFire:(BOOL)a3
{
  self->_didTimerFire = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeBackgroundActivityTimer, 0);
  objc_storeStrong((id *)&self->_currentActivation, 0);
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_contentIndices, 0);
  objc_storeStrong((id *)&self->_updatesFile, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_applicationDisplayID, 0);

  objc_storeStrong((id *)&self->_queriesByExternId, 0);
}

@end