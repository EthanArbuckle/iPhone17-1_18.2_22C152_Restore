@interface CKKSScanLocalItemsOperation
- (BOOL)areEquivalent:(SecDbItem *)a3 ckksItem:(id)a4 keyCache:(id)a5;
- (BOOL)executeQuery:(id)a3 readWrite:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (BOOL)onboardItemToCKKS:(SecDbItem *)a3 viewState:(id)a4 keyCache:(id)a5 error:(id *)a6;
- (CKKSOperationDependencies)deps;
- (CKKSScanLocalItemsOperation)init;
- (CKKSScanLocalItemsOperation)initWithDependencies:(id)a3 intending:(id)a4 errorState:(id)a5 ckoperationGroup:(id)a6;
- (CKOperationGroup)ckoperationGroup;
- (NSMutableSet)viewsWithNewCKKSEntries;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)queryPredicatesForViewMapping:(id)a3;
- (unint64_t)missingLocalItemsFound;
- (unint64_t)processedItems;
- (unint64_t)recordsAdded;
- (unint64_t)recordsFound;
- (void)fixUUIDlessItemsInZone:(id)a3 primaryKeys:(id)a4 databaseProvider:(id)a5;
- (void)main;
- (void)onboardItemsInView:(id)a3 uuids:(id)a4 itemClass:(id)a5 databaseProvider:(id)a6;
- (void)retriggerMissingMirrorEntries:(id)a3 databaseProvider:(id)a4;
- (void)setCkoperationGroup:(id)a3;
- (void)setDeps:(id)a3;
- (void)setMissingLocalItemsFound:(unint64_t)a3;
- (void)setNextState:(id)a3;
- (void)setProcessedItems:(unint64_t)a3;
- (void)setRecordsAdded:(unint64_t)a3;
- (void)setRecordsFound:(unint64_t)a3;
- (void)setViewsWithNewCKKSEntries:(id)a3;
@end

@implementation CKKSScanLocalItemsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsWithNewCKKSEntries, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setViewsWithNewCKKSEntries:(id)a3
{
}

- (NSMutableSet)viewsWithNewCKKSEntries
{
  return (NSMutableSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setProcessedItems:(unint64_t)a3
{
  self->_processedItems = a3;
}

- (unint64_t)processedItems
{
  return self->_processedItems;
}

- (void)setMissingLocalItemsFound:(unint64_t)a3
{
  self->_missingLocalItemsFound = a3;
}

- (unint64_t)missingLocalItemsFound
{
  return self->_missingLocalItemsFound;
}

- (void)setRecordsAdded:(unint64_t)a3
{
  self->_recordsAdded = a3;
}

- (unint64_t)recordsAdded
{
  return self->_recordsAdded;
}

- (void)setRecordsFound:(unint64_t)a3
{
  self->_recordsFound = a3;
}

- (unint64_t)recordsFound
{
  return self->_recordsFound;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 96, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)areEquivalent:(SecDbItem *)a3 ckksItem:(id)a4 keyCache:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(CKKSScanLocalItemsOperation *)self deps];
  id v42 = 0;
  v11 = +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:v8 keyCache:v9 ckksOperationalDependencies:v10 error:&v42];
  v12 = (__CFString *)v42;
  id v13 = [v11 mutableCopy];

  v36 = v13;
  if (v13) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    v41 = 0;
    v19 = sub_100118B3C(a3, 0x10000, 0, &v41);
    v20 = v19;
    v12 = v41;
    if (!v19 || v41)
    {
      v31 = [v8 zoneID];
      v32 = [v31 zoneName];
      v21 = sub_1000CD884(@"ckksscan", v32);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Could not get item contents for comparison: %@", buf, 0xCu);
      }
      BOOL v18 = 0;
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v21 = v19;
      id v22 = [v21 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v22)
      {
        id v23 = v22;
        v34 = v20;
        id v35 = v9;
        uint64_t v24 = *(void *)v38;
        uint64_t v25 = kSecAttrSHA1;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            v27 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (([v27 isEqual:kSecAttrCreationDate] & 1) == 0
              && ([v27 isEqual:kSecAttrModificationDate] & 1) == 0
              && ([v27 isEqual:v25] & 1) == 0)
            {
              v28 = [v21 objectForKeyedSubscript:v27];
              v29 = [v36 objectForKeyedSubscript:v27];
              unsigned int v30 = [v28 isEqual:v29];

              if (!v30)
              {
                BOOL v18 = 0;
                goto LABEL_26;
              }
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v37 objects:v43 count:16];
          if (v23) {
            continue;
          }
          break;
        }
        BOOL v18 = 1;
LABEL_26:
        id v9 = v35;
        v20 = v34;
        v12 = 0;
      }
      else
      {
        BOOL v18 = 1;
      }
    }
  }
  else
  {
    v15 = [v8 zoneID];
    v16 = [v15 zoneName];
    v17 = sub_1000CD884(@"ckksscan", v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not decrypt item for comparison: %@", buf, 0xCu);
    }

    BOOL v18 = 1;
  }

  return v18;
}

- (void)main
{
  v104 = (void *)os_transaction_create();
  v3 = [(CKKSScanLocalItemsOperation *)self deps];
  v118 = [v3 databaseProvider];

  v115 = +[NSMutableDictionary dictionary];
  v113 = +[NSMutableDictionary dictionary];
  v111 = +[NSMutableSet set];
  v4 = sub_1000CD884(@"ckksscan", 0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(CKKSScanLocalItemsOperation *)self deps];
    v6 = [v5 activeManagedViews];
    *(_DWORD *)buf = 138412290;
    *(void *)v157 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scanning for views: %@", buf, 0xCu);
  }
  v7 = +[NSMutableSet set];
  id v106 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v163 = kSecurityRTCFieldNumViews;
  v116 = [(CKKSScanLocalItemsOperation *)self deps];
  v109 = [v116 activeManagedViews];
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v109 count]);
  v164 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
  v10 = [(CKKSScanLocalItemsOperation *)self deps];
  v11 = [v10 activeAccount];
  v12 = [v11 altDSID];
  uint64_t v13 = kSecurityRTCEventNameScanLocalItems;
  uint64_t v14 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  v15 = [(CKKSScanLocalItemsOperation *)self deps];
  id v107 = [v106 initWithCKKSMetrics:v9 altDSID:v12 eventName:v13 testsAreEnabled:0 category:v14 sendMetric:[v15 sendMetric]];

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v117 = self;
  v16 = [(CKKSScanLocalItemsOperation *)self deps];
  v17 = [v16 activeManagedViews];

  id v18 = [v17 countByEnumeratingWithState:&v147 objects:v162 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v148;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v148 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v147 + 1) + 8 * i);
        id v23 = [v22 zoneID];
        [v7 addObject:v23];

        uint64_t v24 = [v22 viewKeyHierarchyState];
        unsigned int v25 = [v24 isEqualToString:@"ready"];

        if (v25)
        {
          v26 = [v22 launch];
          [v26 addEvent:@"scan-local-items-begin"];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v147 objects:v162 count:16];
    }
    while (v19);
  }

  v27 = [(CKKSScanLocalItemsOperation *)v117 deps];
  v28 = [v27 overallLaunch];
  [v28 addEvent:@"scan-local-items-begin"];

  v140[0] = _NSConcreteStackBlock;
  v140[1] = 3221225472;
  v140[2] = sub_1000B60F0;
  v140[3] = &unk_1002F91F0;
  id v29 = v111;
  id v141 = v29;
  v142 = v117;
  id v30 = v7;
  id v143 = v30;
  id v31 = v113;
  id v144 = v31;
  id v110 = v115;
  id v145 = v110;
  id v32 = v107;
  id v146 = v32;
  [v118 dispatchSyncWithReadOnlySQLTransaction:v140];
  v33 = [(CKKSResultOperation *)v117 error];

  if (v33)
  {
    v34 = sub_1000CD884(@"ckksscan", 0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = [(CKKSResultOperation *)v117 error];
      *(_DWORD *)buf = 138412290;
      *(void *)v157 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Exiting due to previous error: %@", buf, 0xCu);
    }
    v36 = [(CKKSResultOperation *)v117 error];
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v32 success:0 error:v36];
  }
  else
  {
    id v100 = v32;
    id v101 = v30;
    v102 = v31;
    id v103 = v29;
    id v37 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    long long v38 = [(CKKSScanLocalItemsOperation *)v117 deps];
    long long v39 = [v38 activeAccount];
    long long v40 = [v39 altDSID];
    uint64_t v41 = kSecurityRTCEventNameOnboardMissingItems;
    id v42 = [(CKKSScanLocalItemsOperation *)v117 deps];
    id v99 = [v37 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v40 eventName:v41 testsAreEnabled:0 category:v14 sendMetric:[v42 sendMetric]];

    v43 = sub_1000CD884(@"ckksscan", 0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v44 = [v110 count];
      v45 = [(CKKSScanLocalItemsOperation *)v117 deps];
      v46 = [v45 activeManagedViews];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v157 = v44;
      *(_WORD *)&v157[4] = 2112;
      *(void *)&v157[6] = v46;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Found %d views with missing items for %@", buf, 0x12u);
    }
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id obj = [v110 allKeys];
    id v112 = [obj countByEnumeratingWithState:&v136 objects:v161 count:16];
    if (v112)
    {
      uint64_t v108 = *(void *)v137;
      do
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v137 != v108) {
            objc_enumerationMutation(obj);
          }
          uint64_t v114 = v47;
          v48 = *(void **)(*((void *)&v136 + 1) + 8 * v47);
          v49 = [v110 objectForKeyedSubscript:v48];
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          v50 = [v49 allKeys];
          id v51 = [v50 countByEnumeratingWithState:&v132 objects:v160 count:16];
          if (v51)
          {
            id v52 = v51;
            uint64_t v53 = *(void *)v133;
            do
            {
              for (j = 0; j != v52; j = (char *)j + 1)
              {
                if (*(void *)v133 != v53) {
                  objc_enumerationMutation(v50);
                }
                uint64_t v55 = *(void *)(*((void *)&v132 + 1) + 8 * (void)j);
                v56 = [v49 objectForKeyedSubscript:v55];
                v57 = [v48 zoneName];
                v58 = sub_1000CD884(@"ckksscan", v57);

                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v59 = [v56 count];
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v157 = v59;
                  *(_WORD *)&v157[4] = 2112;
                  *(void *)&v157[6] = v55;
                  __int16 v158 = 2112;
                  v159 = v48;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Found %d missing %@ items for %@", buf, 0x1Cu);
                }

                [(CKKSScanLocalItemsOperation *)v117 onboardItemsInView:v48 uuids:v56 itemClass:v55 databaseProvider:v118];
              }
              id v52 = [v50 countByEnumeratingWithState:&v132 objects:v160 count:16];
            }
            while (v52);
          }

          uint64_t v47 = v114 + 1;
        }
        while ((id)(v114 + 1) != v112);
        id v112 = [obj countByEnumeratingWithState:&v136 objects:v161 count:16];
      }
      while (v112);
    }

    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v60 = [v102 allKeys];
    id v61 = [v60 countByEnumeratingWithState:&v128 objects:v155 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v129;
      do
      {
        for (k = 0; k != v62; k = (char *)k + 1)
        {
          if (*(void *)v129 != v63) {
            objc_enumerationMutation(v60);
          }
          uint64_t v65 = *(void *)(*((void *)&v128 + 1) + 8 * (void)k);
          v66 = [v102 objectForKeyedSubscript:v65];
          [(CKKSScanLocalItemsOperation *)v117 fixUUIDlessItemsInZone:v65 primaryKeys:v66 databaseProvider:v118];
        }
        id v62 = [v60 countByEnumeratingWithState:&v128 objects:v155 count:16];
      }
      while (v62);
    }

    [(CKKSScanLocalItemsOperation *)v117 retriggerMissingMirrorEntries:v103 databaseProvider:v118];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v67 = [(CKKSScanLocalItemsOperation *)v117 deps];
    v68 = [v67 activeManagedViews];

    id v69 = [v68 countByEnumeratingWithState:&v124 objects:v154 count:16];
    if (v69)
    {
      id v70 = v69;
      uint64_t v71 = *(void *)v125;
      do
      {
        for (m = 0; m != v70; m = (char *)m + 1)
        {
          if (*(void *)v125 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = [*(id *)(*((void *)&v124 + 1) + 8 * (void)m) zoneID];
          v74 = [v73 zoneName];
          +[CKKSPowerCollection CKKSPowerEvent:@"scanLocalItems" zone:v74 count:[(CKKSScanLocalItemsOperation *)v117 processedItems]];
        }
        id v70 = [v68 countByEnumeratingWithState:&v124 objects:v154 count:16];
      }
      while (v70);
    }

    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472;
    v123[2] = sub_1000B6A64;
    v123[3] = &unk_100306A88;
    v123[4] = v117;
    [v118 dispatchSyncWithSQLTransaction:v123];
    v75 = [(CKKSScanLocalItemsOperation *)v117 viewsWithNewCKKSEntries];
    id v76 = [v75 count];

    id v32 = v100;
    id v30 = v101;
    v36 = v99;
    if (v76)
    {
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      v77 = [(CKKSScanLocalItemsOperation *)v117 viewsWithNewCKKSEntries];
      id v78 = [v77 countByEnumeratingWithState:&v119 objects:v153 count:16];
      if (v78)
      {
        id v79 = v78;
        uint64_t v80 = *(void *)v120;
        do
        {
          for (n = 0; n != v79; n = (char *)n + 1)
          {
            if (*(void *)v120 != v80) {
              objc_enumerationMutation(v77);
            }
            v82 = [*(id *)(*((void *)&v119 + 1) + 8 * (void)n) notifyViewChangedScheduler];
            [v82 trigger];
          }
          id v79 = [v77 countByEnumeratingWithState:&v119 objects:v153 count:16];
        }
        while (v79);
      }

      v83 = [(CKKSScanLocalItemsOperation *)v117 ckoperationGroup];

      if (v83)
      {
        v84 = sub_1000CD884(@"ckksscan", 0);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          v85 = [(CKKSScanLocalItemsOperation *)v117 ckoperationGroup];
          *(_DWORD *)buf = 138412290;
          *(void *)v157 = v85;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Transferring ckoperation group %@", buf, 0xCu);
        }
        v86 = [(CKKSScanLocalItemsOperation *)v117 ckoperationGroup];
        v87 = [(CKKSScanLocalItemsOperation *)v117 deps];
        [v87 setCurrentOutgoingQueueOperationGroup:v86];
      }
      v88 = [(CKKSScanLocalItemsOperation *)v117 deps];
      v89 = [v88 flagHandler];
      [v89 handleFlag:@"process_outgoing_queue"];
    }
    uint64_t v151 = kSecurityRTCFieldNumViewsWithNewEntries;
    v90 = [(CKKSScanLocalItemsOperation *)v117 viewsWithNewCKKSEntries];
    v91 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v90 count]);
    v152 = v91;
    v92 = +[NSDictionary dictionaryWithObjects:&v152 forKeys:&v151 count:1];
    [v99 addMetrics:v92];

    v93 = [(CKKSResultOperation *)v117 error];
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v99 success:1 error:v93];

    v94 = [(CKKSResultOperation *)v117 error];
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v100 success:1 error:v94];

    v95 = [(CKKSScanLocalItemsOperation *)v117 intendedState];
    [(CKKSScanLocalItemsOperation *)v117 setNextState:v95];

    if ([(CKKSScanLocalItemsOperation *)v117 missingLocalItemsFound])
    {
      v96 = [(CKKSScanLocalItemsOperation *)v117 deps];
      v97 = [v96 flagHandler];
      [v97 handleFlag:@"process_incoming_queue"];
    }
    v98 = sub_1000CD884(@"ckksscan", 0);
    id v31 = v102;
    id v29 = v103;
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Completed scan", buf, 2u);
    }
  }
}

- (void)retriggerMissingMirrorEntries:(id)a3 databaseProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B7A40;
    v10[3] = &unk_100305670;
    v11 = v6;
    v12 = self;
    [v7 dispatchSyncWithSQLTransaction:v10];
    id v8 = v11;
  }
  else
  {
    id v8 = sub_1000CD884(@"ckksscan", 0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No missing local items found", v9, 2u);
    }
  }
}

- (void)fixUUIDlessItemsInZone:(id)a3 primaryKeys:(id)a4 databaseProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 zoneID];
  v12 = [v11 zoneName];
  uint64_t v13 = sub_1000CD884(@"ckksscan", v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v19 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found %d items missing UUIDs", buf, 8u);
  }

  if ([v9 count])
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000B7FA8;
    v14[3] = &unk_1003053A8;
    id v15 = v9;
    id v16 = v8;
    v17 = self;
    [v10 dispatchSyncWithSQLTransaction:v14];
  }
}

- (void)onboardItemsInView:(id)a3 uuids:(id)a4 itemClass:(id)a5 databaseProvider:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v9;
  uint64_t v14 = [v9 zoneID];
  id v15 = [v14 zoneName];
  id v16 = sub_1000CD884(@"ckksscan", v15);

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    unsigned int v35 = [v10 count];
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found %d missing %@ items", buf, 0x12u);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v10;
  id v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v20);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000B8C4C;
        v24[3] = &unk_1003052A0;
        id v25 = v11;
        uint64_t v26 = v21;
        id v27 = v13;
        v28 = self;
        [v12 dispatchSyncWithSQLTransaction:v24];

        uint64_t v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v18);
  }
}

- (BOOL)onboardItemToCKKS:(SecDbItem *)a3 viewState:(id)a4 keyCache:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [(CKKSScanLocalItemsOperation *)self deps];
  uint64_t v13 = [v12 contextID];
  uint64_t v14 = [v10 zoneID];
  id v28 = 0;
  id v15 = +[CKKSOutgoingQueueEntry withItem:a3 action:@"add" contextID:v13 zoneID:v14 keyCache:v11 error:&v28];

  id v16 = v28;
  id v17 = [v10 zoneID];
  id v18 = [v17 zoneName];
  uint64_t v19 = sub_1000CD884(@"ckksscan", v18);

  if (!v16)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Syncing new item: %@", buf, 0xCu);
    }

    id v27 = 0;
    [(SecDbItem *)v15 saveToDatabase:&v27];
    id v21 = v27;
    if (!v21)
    {
      id v25 = [(CKKSScanLocalItemsOperation *)self viewsWithNewCKKSEntries];
      [v25 addObject:v10];

      [(CKKSScanLocalItemsOperation *)self setRecordsAdded:(char *)[(CKKSScanLocalItemsOperation *)self recordsAdded] + 1];
      id v16 = 0;
      BOOL v20 = 1;
      goto LABEL_14;
    }
    id v16 = v21;
    id v22 = [v10 zoneID];
    id v23 = [v22 zoneName];
    uint64_t v24 = sub_1000CD884(@"ckksscan", v23);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v30 = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Need to upload %@, but can't save to database: %@", buf, 0x16u);
    }

    [(CKKSResultOperation *)self setError:v16];
    goto LABEL_12;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138478083;
    long long v30 = a3;
    __int16 v31 = 2112;
    id v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Need to upload %{private}@, but can't create outgoing entry: %@", buf, 0x16u);
  }

  if (!a6)
  {
LABEL_12:
    BOOL v20 = 0;
    goto LABEL_14;
  }
  id v16 = v16;
  BOOL v20 = 0;
  *a6 = v16;
LABEL_14:

  return v20;
}

- (BOOL)executeQuery:(id)a3 readWrite:(BOOL)a4 error:(id *)a5 block:(id)a6
{
  BOOL v8 = a4;
  CFDictionaryRef v10 = (const __CFDictionary *)a3;
  id v11 = a6;
  uint64_t v30 = 0;
  __int16 v31 = (__CFString **)&v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  id v12 = [(CKKSOperationDependencies *)self->_deps keychainMusrForCurrentAccount];
  uint64_t v13 = sub_10000C3CC(v10, v12, -1, 0, v31 + 3);
  uint64_t v14 = (uint64_t)(v31 + 3);
  if (v31[3])
  {
    id v15 = sub_1000CD884(@"ckksscan", 0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = v31[3];
      *(_DWORD *)buf = 138412290;
      unsigned int v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "couldn't create query: %@", buf, 0xCu);
    }

    id v17 = v31[3];
    if (a5)
    {
      BOOL v18 = 0;
      *a5 = v17;
    }
    else
    {
      if (v17)
      {
        v31[3] = 0;
        CFRelease(v17);
      }
      BOOL v18 = 0;
    }
  }
  else
  {
    uint64_t v19 = (const void **)v13;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B9608;
    v26[3] = &unk_1002F9100;
    id v28 = &v30;
    uint64_t v29 = v13;
    id v27 = v11;
    int v20 = sub_10000CBA4(v8, 1, 0, v14, (uint64_t)v26);
    if (v8) {
      char v21 = sub_100129708((uint64_t)v19, v20, (CFErrorRef *)v31 + 3);
    }
    else {
      char v21 = sub_10000C2C4(v19, (CFErrorRef *)v31 + 3);
    }
    if (v31[3]) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v21;
    }
    if (!v18)
    {
      id v22 = sub_1000CD884(@"ckksscan", 0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = v31[3];
        *(_DWORD *)buf = 138412290;
        unsigned int v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "couldn't execute query: %@", buf, 0xCu);
      }

      uint64_t v24 = v31[3];
      if (a5)
      {
        *a5 = v24;
      }
      else if (v24)
      {
        v31[3] = 0;
        CFRelease(v24);
      }
    }
  }
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (id)queryPredicatesForViewMapping:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] <= 1 && objc_msgSend(v4, "count"))
  {
    id v63 = v4;
    v5 = [v4 allObjects];
    id v6 = [v5 objectAtIndexedSubscript:0];

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v7 = [(CKKSScanLocalItemsOperation *)self deps];
    BOOL v8 = [v7 syncingPolicy];
    id v9 = [v8 keyViewMapping];

    id v10 = [v9 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v10)
    {
      id v11 = v10;
      id v64 = 0;
      uint64_t v12 = *(void *)v66;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v66 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          id v15 = [v14 view];
          id v16 = [v6 zoneID];
          id v17 = [v16 zoneName];
          unsigned int v18 = [v15 isEqualToString:v17];

          if (v18)
          {
            if (v64)
            {
              int v20 = [v6 zoneID];
              char v21 = [v20 zoneName];
              id v22 = sub_1000CD884(@"ckksscan", v21);

              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                id v23 = [v6 zoneID];
                uint64_t v24 = [v23 zoneName];
                *(_DWORD *)buf = 138412290;
                id v77 = v24;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Too many policy rules for view %@", buf, 0xCu);
              }
              uint64_t v19 = &__NSDictionary0__struct;
              id v4 = v63;
              goto LABEL_34;
            }
            id v64 = v14;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v65 objects:v75 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v64 = 0;
    }

    id v4 = v63;
    if (![v64 hasMatchingRule]) {
      goto LABEL_30;
    }
    id v25 = [v64 matchingRule];
    if ([v25 andsCount]) {
      goto LABEL_29;
    }
    uint64_t v26 = [v64 matchingRule];
    if ([v26 orsCount])
    {
LABEL_28:

LABEL_29:
LABEL_30:
      uint64_t v29 = sub_1000CD884(@"ckksscan", 0);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:

        uint64_t v19 = &__NSDictionary0__struct;
LABEL_34:

        goto LABEL_35;
      }
      *(_DWORD *)buf = 138412290;
      id v77 = v64;
      uint64_t v30 = "Policy view rule is complex: %@";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
      goto LABEL_33;
    }
    id v27 = [v64 matchingRule];
    if ([v27 hasNot])
    {
LABEL_27:

      goto LABEL_28;
    }
    id v28 = [v64 matchingRule];
    if ([v28 hasExists])
    {

      goto LABEL_27;
    }
    uint64_t v32 = [v64 matchingRule];
    unsigned int v33 = [v32 hasMatch];

    if (!v33) {
      goto LABEL_30;
    }
    v34 = [v64 matchingRule];
    unsigned int v35 = [v34 match];
    __int16 v36 = [v35 fieldName];
    if ([(__CFString *)(id)kSecAttrSyncViewHint isEqualToString:v36])
    {
      id v37 = [v64 matchingRule];
      id v61 = [v37 match];
      long long v38 = [v61 regex];
      long long v39 = [v6 zoneID];
      long long v40 = [v39 zoneName];
      uint64_t v41 = +[NSString stringWithFormat:@"^%@$", v40];
      unsigned int v60 = [v38 isEqualToString:v41];

      if (v60)
      {
        CFStringRef v73 = kSecAttrSyncViewHint;
        id v42 = [v6 zoneName];
        v74 = v42;
        uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];

        goto LABEL_34;
      }
    }
    else
    {
    }
    v43 = (__CFString *)kSecAttrAccessGroup;
    unsigned int v44 = [v64 matchingRule];
    v45 = [v44 match];
    v46 = [v45 fieldName];
    if ([(__CFString *)(id)kSecAttrAccessGroup isEqualToString:v46])
    {
      uint64_t v47 = [v64 matchingRule];
      v48 = [v47 match];
      v49 = [v48 regex];
      unsigned int v50 = [v49 isEqualToString:@"^com\\.apple\\.cfnetwork$"];

      v43 = (__CFString *)kSecAttrAccessGroup;
      if (v50)
      {
        CFStringRef v71 = kSecAttrAccessGroup;
        CFStringRef v72 = @"com.apple.cfnetwork";
        id v51 = &v72;
        id v52 = &v71;
LABEL_50:
        uint64_t v19 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v52 count:1];
        goto LABEL_34;
      }
    }
    else
    {
    }
    uint64_t v53 = [v64 matchingRule];
    v54 = [v53 match];
    uint64_t v55 = [v54 fieldName];
    if ([(__CFString *)v43 isEqualToString:v55])
    {
      id v62 = v43;
      v56 = [v64 matchingRule];
      v57 = [v56 match];
      v58 = [v57 regex];
      unsigned int v59 = [v58 isEqualToString:@"^com\\.apple\\.safari\\.credit-cards$"];

      if (v59)
      {
        id v69 = v62;
        CFStringRef v70 = @"com.apple.safari.credit-cards";
        id v51 = &v70;
        id v52 = (CFStringRef *)&v69;
        goto LABEL_50;
      }
    }
    else
    {
    }
    uint64_t v29 = sub_1000CD884(@"ckksscan", 0);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138412290;
    id v77 = v64;
    uint64_t v30 = "Policy view rule is not a match against viewhint: %@";
    goto LABEL_32;
  }
  id v6 = sub_1000CD884(@"ckksscan", 0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v77 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not acting on exactly one view; not limiting query: %@",
      buf,
      0xCu);
  }
  uint64_t v19 = &__NSDictionary0__struct;
LABEL_35:

  return v19;
}

- (CKKSScanLocalItemsOperation)initWithDependencies:(id)a3 intending:(id)a4 errorState:(id)a5 ckoperationGroup:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CKKSScanLocalItemsOperation;
  id v15 = [(CKKSResultOperation *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_ckoperationGroup, a6);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    uint64_t v17 = +[NSMutableSet set];
    viewsWithNewCKKSEntries = v16->_viewsWithNewCKKSEntries;
    v16->_viewsWithNewCKKSEntries = (NSMutableSet *)v17;

    v16->_recordsFound = 0;
    v16->_recordsAdded = 0;
  }

  return v16;
}

- (CKKSScanLocalItemsOperation)init
{
  return 0;
}

@end