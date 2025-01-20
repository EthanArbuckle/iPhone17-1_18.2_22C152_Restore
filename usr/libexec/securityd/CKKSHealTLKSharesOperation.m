@interface CKKSHealTLKSharesOperation
+ (id)createMissingKeyShares:(id)a3 peers:(id)a4 databaseProvider:(id)a5 error:(id *)a6;
+ (id)createMissingKeyShares:(id)a3 trustStates:(id)a4 databaseProvider:(id)a5 error:(id *)a6;
+ (id)filterTrustedPeers:(id)a3 missingTLKSharesFor:(id)a4 databaseProvider:(id)a5 error:(id *)a6;
- (BOOL)areNewSharesSufficient:(id)a3 trustStates:(id)a4 error:(id *)a5;
- (BOOL)cloudkitWriteFailures;
- (BOOL)failedDueToEssentialTrustState;
- (BOOL)failedDueToLockState;
- (CKKSHealTLKSharesOperation)init;
- (CKKSHealTLKSharesOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (NSHashTable)ckOperations;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)checkAndHealTLKShares:(id)a3 currentTrustStates:(id)a4;
- (void)groupStart;
- (void)setCkOperations:(id)a3;
- (void)setCloudkitWriteFailures:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setFailedDueToEssentialTrustState:(BOOL)a3;
- (void)setFailedDueToLockState:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
@end

@implementation CKKSHealTLKSharesOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckOperations + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_failedDueToEssentialTrustState + 4), 0);
}

- (void)setFailedDueToEssentialTrustState:(BOOL)a3
{
  self->_failedDueToEssentialTrustState = a3;
}

- (BOOL)failedDueToEssentialTrustState
{
  return self->_failedDueToEssentialTrustState;
}

- (void)setFailedDueToLockState:(BOOL)a3
{
  self->_failedDueToLockState = a3;
}

- (BOOL)failedDueToLockState
{
  return self->_failedDueToLockState;
}

- (void)setCloudkitWriteFailures:(BOOL)a3
{
  self->_cloudkitWriteFailures = a3;
}

- (BOOL)cloudkitWriteFailures
{
  return self->_cloudkitWriteFailures;
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 166, 1);
}

- (void)setCkOperations:(id)a3
{
}

- (NSHashTable)ckOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 158, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (BOOL)areNewSharesSufficient:(id)a3 trustStates:(id)a4 error:(id *)a5
{
  id v33 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a4;
  id v8 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    id v9 = v8;
    v30 = a5;
    uint64_t v10 = *(void *)v36;
    p_cache = OTDetermineCDPCapableAccountStatusOperation.cache;
LABEL_3:
    uint64_t v12 = 0;
    id v31 = v9;
    while (1)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
      v14 = [(CKKSHealTLKSharesOperation *)self deps];
      v15 = [v14 databaseProvider];
      id v34 = 0;
      v16 = [p_cache + 408 filterTrustedPeers:v13 missingTLKSharesFor:v33 databaseProvider:v15 error:&v34];
      id v17 = v34;

      if (v16) {
        BOOL v18 = v17 == 0;
      }
      else {
        BOOL v18 = 0;
      }
      if (!v18)
      {
        if ([v13 essential])
        {
          if (v30)
          {
            id v17 = v17;
            id *v30 = v17;
          }
          goto LABEL_23;
        }
        uint64_t v19 = v10;
        v20 = p_cache;
        v21 = self;
        v22 = [v33 tlk];
        v23 = [v22 zoneName];
        v24 = sub_1000CD884(@"ckksshare", v23);

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v13;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to find peers for nonessential system: %@", buf, 0xCu);
        }

        self = v21;
        p_cache = v20;
        uint64_t v10 = v19;
        id v9 = v31;
      }
      if ([v16 count])
      {
        v26 = [v33 tlk];
        v27 = [v26 zoneName];
        v28 = sub_1000CD884(@"ckksshare", v27);

        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v16;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "New share set is missing shares for peers: %@", buf, 0xCu);
        }

LABEL_23:
        BOOL v25 = 0;
        goto LABEL_24;
      }

      if (v9 == (id)++v12)
      {
        id v9 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v25 = 1;
LABEL_24:

  return v25;
}

- (void)checkAndHealTLKShares:(id)a3 currentTrustStates:(id)a4
{
  id v6 = a3;
  id v117 = a4;
  uint64_t v162 = 0;
  v163 = &v162;
  uint64_t v164 = 0x3032000000;
  v165 = sub_1001AC188;
  v166 = sub_1001AC198;
  id v167 = 0;
  val = self;
  v7 = [(CKKSHealTLKSharesOperation *)self deps];
  id v8 = [v7 databaseProvider];
  v159[0] = _NSConcreteStackBlock;
  v159[1] = 3221225472;
  v159[2] = sub_1001AC1A0;
  v159[3] = &unk_100307348;
  v161 = &v162;
  id v125 = v6;
  id v160 = v125;
  [v8 dispatchSyncWithReadOnlySQLTransaction:v159];

  id v9 = [(id)v163[5] error];

  if (v9)
  {
    [v125 setViewKeyHierarchyState:@"unhealthy"];
    uint64_t v10 = [v125 zoneID];
    v11 = [v10 zoneName];
    uint64_t v12 = sub_1000CD884(@"ckksshare", v11);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "couldn't load current keys: can't fix TLK shares", buf, 2u);
    }
    goto LABEL_83;
  }
  v13 = [v125 zoneID];
  v14 = [v13 zoneName];
  v15 = sub_1000CD884(@"ckksshare", v14);

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v163[5];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Key set is %@", buf, 0xCu);
  }

  id v17 = [v125 zoneID];
  BOOL v18 = [v17 zoneName];
  +[CKKSPowerCollection CKKSPowerEvent:@"TLKShareProcessing" zone:v18];

  id v19 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v20 = kSecurityRTCFieldIsLocked;
  uint64_t v179 = kSecurityRTCFieldIsLocked;
  v180 = &__kCFBooleanFalse;
  v21 = +[NSDictionary dictionaryWithObjects:&v180 forKeys:&v179 count:1];
  v22 = [(CKKSHealTLKSharesOperation *)val deps];
  v23 = [v22 activeAccount];
  v24 = [v23 altDSID];
  BOOL v25 = [(CKKSHealTLKSharesOperation *)val deps];
  [v25 sendMetric];
  uint64_t v115 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  v123 = [v19 initWithCKKSMetrics:v21 altDSID:v24 eventName:kSecurityRTCEventNameCreateMissingTLKShares testsAreEnabled:0 category:0 sendMetric:];

  v27 = [(id)v163[5] tlk];
  id v158 = 0;
  unsigned int v28 = [v27 loadKeyMaterialFromKeychain:&v158];
  id v29 = v158;
  if (v29) {
    unsigned int v30 = 0;
  }
  else {
    unsigned int v30 = v28;
  }

  if ((v30 & 1) == 0)
  {
    id v31 = [(CKKSHealTLKSharesOperation *)val deps];
    v32 = [v31 lockStateTracker];
    unsigned int v33 = [v32 isLockedError:v29];

    if (v33)
    {
      id v34 = [v125 zoneID];
      long long v35 = [v34 zoneName];
      long long v36 = sub_1000CD884(@"ckksshare", v35);

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Keychain is locked: can't fix shares yet: %@", buf, 0xCu);
      }

      [(CKKSHealTLKSharesOperation *)val setFailedDueToLockState:1];
      uint64_t v177 = v20;
      v178 = &__kCFBooleanTrue;
      long long v37 = +[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
      [v123 addMetrics:v37];
    }
    else
    {
      long long v38 = [v125 zoneID];
      v39 = [v38 zoneName];
      v40 = sub_1000CD884(@"ckksshare", v39);

      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "couldn't load current tlk from keychain: %@", buf, 0xCu);
      }

      [v125 setViewKeyHierarchyState:@"unhealthy"];
    }
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v123 success:0 error:v29];
  }

  if (!v30) {
    goto LABEL_82;
  }
  v118 = +[NSMutableSet set];
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id obj = v117;
  id v41 = [obj countByEnumeratingWithState:&v154 objects:v176 count:16];
  if (!v41) {
    goto LABEL_50;
  }
  uint64_t v121 = *(void *)v155;
  do
  {
    for (i = 0; i != v41; i = (char *)i + 1)
    {
      if (*(void *)v155 != v121) {
        objc_enumerationMutation(obj);
      }
      v43 = *(void **)(*((void *)&v154 + 1) + 8 * i);
      uint64_t v45 = v163[5];
      v46 = [(CKKSHealTLKSharesOperation *)val deps];
      v47 = [v46 databaseProvider];
      id v153 = 0;
      v48 = +[CKKSHealTLKSharesOperation createMissingKeyShares:v45 peers:v43 databaseProvider:v47 error:&v153];
      id v49 = v153;

      if (v48 && !v49)
      {
        [v118 unionSet:v48];
LABEL_36:
        int v55 = 1;
        goto LABEL_47;
      }
      v50 = [(id)v163[5] tlk];
      v51 = [v50 zoneName];
      v52 = sub_1000CD884(@"ckksshare", v51);

      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v49;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Unable to create shares for trust set %@: %@", buf, 0x16u);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v123 success:0 error:v49];
      if (![v43 essential]) {
        goto LABEL_36;
      }
      v53 = [v49 domain];
      if ([v53 isEqualToString:@"com.apple.security.trustedpeers.container"]
        && [v49 code] == (id)1)
      {
        goto LABEL_35;
      }
      v54 = [v49 domain];
      if ([v54 isEqualToString:@"CKKSErrorDomain"]
        && [v49 code] == (id)52)
      {

LABEL_35:
        goto LABEL_39;
      }
      v56 = [v49 domain];
      if (([v56 isEqualToString:@"CKKSErrorDomain"] & 1) == 0)
      {

LABEL_43:
        v61 = [v125 zoneID];
        v62 = [v61 zoneName];
        v63 = sub_1000CD884(@"ckksshare", v62);

        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = 0;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Unable to create shares: %@", buf, 0xCu);
        }

        [v125 setViewKeyHierarchyState:@"unhealthy"];
        goto LABEL_46;
      }
      BOOL v57 = [v49 code] == (id)24;

      if (!v57) {
        goto LABEL_43;
      }
LABEL_39:
      v58 = [v125 zoneID];
      v59 = [v58 zoneName];
      v60 = sub_1000CD884(@"ckksshare", v59);

      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Unable to create shares due to some trust issue: %@", buf, 0xCu);
      }

      [v125 setViewKeyHierarchyState:@"waitfortrust"];
      [(CKKSHealTLKSharesOperation *)val setFailedDueToEssentialTrustState:1];
LABEL_46:
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v123 success:0 error:0];
      int v55 = 0;
LABEL_47:

      if (!v55) {
        goto LABEL_81;
      }
    }
    id v41 = [obj countByEnumeratingWithState:&v154 objects:v176 count:16];
  }
  while (v41);
LABEL_50:

  if ([v118 count])
  {
    uint64_t v174 = kSecurityRTCFieldNewTLKShares;
    v64 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v118 count]);
    v175 = v64;
    v65 = +[NSDictionary dictionaryWithObjects:&v175 forKeys:&v174 count:1];
    [v123 addMetrics:v65];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v123 success:1 error:0];
    v66 = [v118 allObjects];
    [(id)v163[5] setPendingTLKShares:v66];

    uint64_t v67 = v163[5];
    id v152 = 0;
    unsigned __int8 v68 = [(CKKSHealTLKSharesOperation *)val areNewSharesSufficient:v67 trustStates:obj error:&v152];
    id obj = v152;
    if (obj) {
      unsigned __int8 v69 = 0;
    }
    else {
      unsigned __int8 v69 = v68;
    }
    if (v69)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      int v173 = 0;
      v150[0] = 0;
      v150[1] = v150;
      v150[2] = 0x2020000000;
      char v151 = 1;
      id v70 = objc_alloc((Class)AAFAnalyticsEventSecurity);
      uint64_t v170 = kSecurityRTCFieldIsPrioritized;
      v171 = &__kCFBooleanFalse;
      v71 = +[NSDictionary dictionaryWithObjects:&v171 forKeys:&v170 count:1];
      v72 = [(CKKSHealTLKSharesOperation *)val deps];
      v73 = [v72 activeAccount];
      v74 = [v73 altDSID];
      v75 = [(CKKSHealTLKSharesOperation *)val deps];
      id v76 = [v75 sendMetric];
      id v116 = [v70 initWithCKKSMetrics:v71 altDSID:v74 eventName:kSecurityRTCEventNameUploadMissingTLKShares testsAreEnabled:0 category:v115 sendMetric:v76];

      id v77 = objc_alloc_init((Class)NSMutableArray);
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id v78 = v118;
      id v79 = [v78 countByEnumeratingWithState:&v146 objects:v169 count:16];
      if (v79)
      {
        uint64_t v80 = *(void *)v147;
        do
        {
          for (j = 0; j != v79; j = (char *)j + 1)
          {
            if (*(void *)v147 != v80) {
              objc_enumerationMutation(v78);
            }
            v82 = *(void **)(*((void *)&v146 + 1) + 8 * (void)j);
            v83 = [v125 zoneID];
            v84 = [v82 CKRecordWithZoneID:v83];
            [v77 addObject:v84];
          }
          id v79 = [v78 countByEnumeratingWithState:&v146 objects:v169 count:16];
        }
        while (v79);
      }

      for (uint64_t k = 0; ; ++k)
      {
        uint64_t v85 = 1000 * k;
        if (1000 * k >= (unint64_t)[v78 count]) {
          break;
        }
        v86 = [v125 zoneID];
        v87 = [v86 zoneName];
        v88 = +[NSString stringWithFormat:@"heal-tlkshares-%@", v87];
        v141[0] = _NSConcreteStackBlock;
        v141[1] = 3221225472;
        v141[2] = sub_1001AC238;
        v141[3] = &unk_100306998;
        id v89 = v78;
        id v142 = v89;
        uint64_t v145 = 1000 * k;
        id v90 = v116;
        id v143 = v90;
        v144 = v150;
        id obja = +[CKKSResultOperation named:v88 withBlock:v141];

        [(CKKSGroupOperation *)val dependOnBeforeGroupFinished:obja];
        id v91 = objc_alloc_init((Class)NSMutableDictionary);
        v92 = (char *)[v89 count];
        if ((unint64_t)&v92[-v85] >= 0x3E8) {
          uint64_t v93 = 1000;
        }
        else {
          uint64_t v93 = (uint64_t)&v92[-v85];
        }
        v94 = [v77 subarrayWithRange:v85, v93];
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        id v95 = v94;
        id v96 = [v95 countByEnumeratingWithState:&v137 objects:v168 count:16];
        if (v96)
        {
          uint64_t v97 = *(void *)v138;
          do
          {
            for (m = 0; m != v96; m = (char *)m + 1)
            {
              if (*(void *)v138 != v97) {
                objc_enumerationMutation(v95);
              }
              v99 = *(void **)(*((void *)&v137 + 1) + 8 * (void)m);
              v100 = [v99 recordID];
              [v91 setObject:v99 forKeyedSubscript:v100];
            }
            id v96 = [v95 countByEnumeratingWithState:&v137 objects:v168 count:16];
          }
          while (v96);
        }

        id v101 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v95 recordIDsToDelete:0];
        [v101 setAtomic:1];
        [v101 setLongLived:0];
        v102 = [v101 configuration];
        [v102 setIsCloudKitSupportOperation:1];

        [v101 setQualityOfService:25];
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472;
        v135[2] = sub_1001AC2A4;
        v135[3] = &unk_1003069C0;
        id v103 = v125;
        id v136 = v103;
        [v101 setPerRecordSaveBlock:v135];
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, val);
        v126[0] = _NSConcreteStackBlock;
        v126[1] = 3221225472;
        v126[2] = sub_1001AC410;
        v126[3] = &unk_100306A10;
        objc_copyWeak(&v133, &location);
        id v127 = v103;
        v131 = buf;
        v132 = v150;
        id v128 = v90;
        id v104 = v91;
        id v129 = v104;
        id v105 = obja;
        id v130 = v105;
        [v101 setModifyRecordsCompletionBlock:v126];
        v106 = [(CKKSHealTLKSharesOperation *)val ckOperations];
        [v101 linearDependencies:v106];

        v107 = [(CKKSHealTLKSharesOperation *)val setResultStateOperation];
        [v107 addDependency:v105];

        v108 = [(CKKSHealTLKSharesOperation *)val deps];
        v109 = [v108 ckdatabase];
        [v109 addOperation:v101];

        objc_destroyWeak(&v133);
        objc_destroyWeak(&location);
      }
      _Block_object_dispose(v150, 8);
      _Block_object_dispose(buf, 8);
      id obj = 0;
    }
    else
    {
      v112 = [v125 zoneID];
      v113 = [v112 zoneName];
      v114 = sub_1000CD884(@"ckksshare", v113);

      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = obj;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "New shares won't resolve the share issue; erroring to avoid infinite loops: %@",
          buf,
          0xCu);
      }

      [v125 setViewKeyHierarchyState:@"error"];
    }
  }
  else
  {
    v110 = [v125 zoneID];
    v111 = [v110 zoneName];
    id obj = sub_1000CD884(@"ckksshare", v111);

    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_DEFAULT, "Don't believe we need to change any TLKShares, stopping", buf, 2u);
    }
  }
LABEL_81:

LABEL_82:
  uint64_t v12 = v123;
LABEL_83:

  _Block_object_dispose(&v162, 8);
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = [(CKKSHealTLKSharesOperation *)self deps];
  v3 = [v2 syncingPolicy];
  unsigned int v4 = [v3 isInheritedAccount];

  if (v4)
  {
    v5 = sub_10000B070("ckksshare");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Account is inherited, bailing out of healing TLKShares", buf, 2u);
    }

    id v6 = [(CKKSHealTLKSharesOperation *)self intendedState];
    [(CKKSHealTLKSharesOperation *)self setNextState:v6];
  }
  else
  {
    v7 = [(CKKSHealTLKSharesOperation *)self deps];
    id v8 = [v7 overallLaunch];
    [v8 addEvent:@"heal-tlk-shares-begin"];

    id v9 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    uint64_t v10 = [(CKKSHealTLKSharesOperation *)self deps];
    v11 = [v10 activeAccount];
    uint64_t v12 = [v11 altDSID];
    v13 = [(CKKSHealTLKSharesOperation *)self deps];
    id v14 = [v13 sendMetric];
    id v15 = [v9 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v12 eventName:kSecurityRTCEventNameHealTLKShares testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:v14];

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1001ACE70;
    v45[3] = &unk_100306960;
    long long v36 = &v47;
    objc_copyWeak(&v47, &location);
    id v38 = v15;
    id v46 = v38;
    uint64_t v16 = +[CKKSResultOperation named:@"determine-next-state" withBlockTakingSelf:v45];
    [(CKKSHealTLKSharesOperation *)self setSetResultStateOperation:v16];

    id v17 = [(CKKSHealTLKSharesOperation *)self deps];
    v39 = [v17 currentTrustStates];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    BOOL v18 = [(CKKSHealTLKSharesOperation *)self deps];
    id v19 = [v18 activeManagedViews];

    uint64_t v20 = 0;
    id v21 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v42;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          BOOL v25 = [v24 viewKeyHierarchyState:v36];
          unsigned __int8 v26 = [v25 isEqualToString:@"ready"];

          if (v26)
          {
            [(CKKSHealTLKSharesOperation *)self checkAndHealTLKShares:v24 currentTrustStates:v39];
            uint64_t v20 = (v20 + 1);
          }
          else
          {
            v27 = [v24 zoneID];
            unsigned int v28 = [v27 zoneName];
            id v29 = sub_1000CD884(@"ckksshare", v28);

            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v24;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "View key state is %@; not checking TLK share validity",
                buf,
                0xCu);
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v21);
    }

    uint64_t v49 = kSecurityRTCFieldNumViews;
    unsigned int v30 = +[NSNumber numberWithInt:v20];
    v50 = v30;
    id v31 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    [v38 addMetrics:v31];

    if ([(CKKSHealTLKSharesOperation *)self failedDueToLockState])
    {
      v32 = [[OctagonPendingFlag alloc] initWithFlag:@"key_process_requested" conditions:1];
      unsigned int v33 = [(CKKSHealTLKSharesOperation *)self deps];
      id v34 = [v33 flagHandler];
      [v34 handlePendingFlag:v32];
    }
    long long v35 = [(CKKSHealTLKSharesOperation *)self setResultStateOperation];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v35];

    objc_destroyWeak(v37);
    id v6 = v38;
  }

  objc_destroyWeak(&location);
}

- (CKKSHealTLKSharesOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKKSHealTLKSharesOperation;
  uint64_t v12 = [(CKKSGroupOperation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a5);
    objc_storeStrong((id *)(v13 + 134), a4);
    v13[128] = 0;
    v13[129] = 0;
    v13[130] = 0;
    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    id v15 = *(void **)(v13 + 158);
    *(void *)(v13 + 158) = v14;
  }
  return (CKKSHealTLKSharesOperation *)v13;
}

- (CKKSHealTLKSharesOperation)init
{
  return 0;
}

+ (id)filterTrustedPeers:(id)a3 missingTLKSharesFor:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v156 = a4;
  id v148 = a5;
  id v153 = v9;
  id v10 = [v9 currentTrustedPeersError];

  if (v10)
  {
    id v11 = [v156 tlk];
    uint64_t v12 = [v11 zoneName];
    v13 = sub_1000CD884(@"ckksshare", v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v153 currentTrustedPeersError];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't find missing shares because trusted peers aren't available: %@", buf, 0xCu);
    }
    if (a6)
    {
      *a6 = [v153 currentTrustedPeersError];
    }
LABEL_12:
    id v20 = +[NSSet set];
    goto LABEL_13;
  }
  id v15 = [v9 currentSelfPeersError];

  if (v15)
  {
    uint64_t v16 = [v156 tlk];
    objc_super v17 = [v16 zoneName];
    BOOL v18 = sub_1000CD884(@"ckksshare", v17);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v153 currentSelfPeersError];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Couldn't find missing shares because self peers aren't available: %@", buf, 0xCu);
    }
    if (a6)
    {
      *a6 = [v153 currentSelfPeersError];
    }
    goto LABEL_12;
  }
  id v143 = +[NSMutableSet set];
  uint64_t v22 = [v9 currentTrustedPeerIDs];
  v23 = [v9 currentSelfPeers];
  v24 = [v23 currentSelf];
  BOOL v25 = [v24 peerID];
  unsigned __int8 v26 = [v22 containsObject:v25];

  if (v26)
  {
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    id obj = [v153 currentTrustedPeers];
    id v150 = [obj countByEnumeratingWithState:&v174 objects:v189 count:16];
    if (v150)
    {
      uint64_t v149 = *(void *)v175;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v175 != v149)
          {
            uint64_t v28 = v27;
            objc_enumerationMutation(obj);
            uint64_t v27 = v28;
          }
          uint64_t v151 = v27;
          long long v157 = *(void **)(*((void *)&v174 + 1) + 8 * v27);
          id v29 = [v156 tlk];
          unsigned int v30 = [v29 zoneName];
          unsigned __int8 v31 = [v157 shouldHaveView:v30];

          if (v31)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v186 = sub_1001AC188;
            v187 = sub_1001AC198;
            id v188 = 0;
            uint64_t v168 = 0;
            v169 = &v168;
            uint64_t v170 = 0x3032000000;
            v171 = sub_1001AC188;
            v172 = sub_1001AC198;
            id v173 = 0;
            if (v148)
            {
              v163[0] = _NSConcreteStackBlock;
              v163[1] = 3221225472;
              v163[2] = sub_1001AE520;
              v163[3] = &unk_100307528;
              v165 = &v168;
              v163[4] = v157;
              id v164 = v156;
              v166 = buf;
              [v148 dispatchSyncWithReadOnlySQLTransaction:v163];
            }
            else
            {
              long long v36 = [v157 peerID];
              long long v37 = [v156 tlk];
              id v38 = [v37 contextID];
              v39 = [v156 tlk];
              v40 = [v39 uuid];
              long long v41 = [v156 tlk];
              long long v42 = [v41 zoneID];
              long long v43 = (id *)(*(void *)&buf[8] + 40);
              id v167 = *(id *)(*(void *)&buf[8] + 40);
              uint64_t v44 = +[CKKSTLKShareRecord allFor:v36 contextID:v38 keyUUID:v40 zoneID:v42 error:&v167];
              objc_storeStrong(v43, v167);
              uint64_t v45 = (void *)v169[5];
              v169[5] = v44;
            }
            id v46 = (void *)v169[5];
            if (!v46 || *(void *)(*(void *)&buf[8] + 40))
            {
              id v47 = [v156 tlk];
              v48 = [v47 zoneName];
              uint64_t v49 = sub_1000CD884(@"ckksshare", v48);

              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                v50 = *(void **)(*(void *)&buf[8] + 40);
                *(_DWORD *)v178 = 138412546;
                id v179 = v157;
                __int16 v180 = 2112;
                v181 = v50;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Unable to load existing TLKShares for peer (%@): %@", v178, 0x16u);
              }
LABEL_83:

              _Block_object_dispose(&v168, 8);
              _Block_object_dispose(buf, 8);

              goto LABEL_84;
            }
            uint64_t v51 = [v156 pendingTLKShares];
            v52 = (void *)v51;
            if (v51) {
              v53 = (void *)v51;
            }
            else {
              v53 = &__NSArray0__struct;
            }
            v54 = [v46 arrayByAddingObjectsFromArray:v53];

            long long v146 = +[NSMutableArray array];
            long long v161 = 0u;
            long long v162 = 0u;
            long long v159 = 0u;
            long long v160 = 0u;
            id v152 = v54;
            id v55 = [v152 countByEnumeratingWithState:&v159 objects:v184 count:16];
            if (!v55)
            {

LABEL_78:
              v107 = [v156 tlk];
              v108 = [v107 zoneName];
              v109 = sub_1000CD884(@"ckksshare", v108);

              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                v110 = [v156 tlk];
                v111 = [v110 uuid];
                *(_DWORD *)v178 = 138412802;
                id v179 = v157;
                __int16 v180 = 2112;
                v181 = v111;
                __int16 v182 = 2112;
                v183 = v146;
                _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "Peer %@ is shared %@ via insufficient shares: %@", v178, 0x20u);
              }
              v112 = [v157 publicEncryptionKey];

              if (v112) {
                [v143 addObject:v157];
              }
LABEL_82:

              uint64_t v49 = v152;
              goto LABEL_83;
            }
            char v145 = 0;
            uint64_t v154 = *(void *)v160;
            while (2)
            {
              uint64_t v56 = 0;
              id v155 = v55;
LABEL_39:
              if (*(void *)v160 != v154) {
                objc_enumerationMutation(v152);
              }
              BOOL v57 = *(void **)(*((void *)&v159 + 1) + 8 * v56);
              v59 = [v57 share];
              v60 = [v59 receiverPeerID];
              v61 = [v157 peerID];
              unsigned __int8 v62 = [v60 isEqualToString:v61];

              if (v62)
              {
                v63 = [v57 senderPeerID];
                unsigned int v64 = [v63 hasPrefix:@"spid-"];

                if (!v64) {
                  goto LABEL_45;
                }
                v65 = [v153 currentTrustedPeers];
                id v158 = 0;
                unsigned int v66 = [v57 signatureVerifiesWithPeerSet:v65 error:&v158];
                id v67 = v158;

                if (v66)
                {

LABEL_45:
                  id v67 = [v57 tlkUUID];
                  unsigned __int8 v68 = [v156 tlk];
                  unsigned __int8 v69 = [v68 uuid];
                  if ([v67 isEqualToString:v69])
                  {
                    id v70 = [v153 currentTrustedPeerIDs];
                    v71 = [v57 senderPeerID];
                    unsigned int v72 = [v70 containsObject:v71];

                    if (!v72)
                    {
                      int v91 = 0;
                      goto LABEL_64;
                    }
                    v73 = [v157 peerID];
                    v74 = [v153 currentSelfPeers];
                    v75 = [v74 currentSelf];
                    id v76 = [v75 peerID];
                    unsigned int v77 = [v73 isEqualToString:v76];

                    if (v77)
                    {
                      id v78 = [v153 currentSelfPeers];
                      id v79 = [v78 currentSelf];
                      uint64_t v80 = [v79 publicEncryptionKey];
                      id v67 = [v80 keyData];

                      v81 = [v57 senderPeerID];
                      v82 = [v153 currentSelfPeers];
                      v83 = [v82 currentSelf];
                      v84 = [v83 peerID];
                      if ([v81 isEqualToString:v84])
                      {
                        uint64_t v85 = [v57 share];
                        v86 = [v85 receiverPublicEncryptionKeySPKI];
                        unsigned int v144 = [v86 isEqual:v67];

                        if (v144)
                        {
                          v87 = [v156 tlk];
                          v88 = [v87 zoneName];
                          unsigned __int8 v68 = sub_1000CD884(@"ckksshare", v88);

                          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                          {
                            id v89 = [v156 tlk];
                            id v90 = [v89 uuid];
                            *(_DWORD *)v178 = 138412802;
                            id v179 = v157;
                            __int16 v180 = 2112;
                            v181 = v90;
                            __int16 v182 = 2112;
                            v183 = v57;
                            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Local peer %@ is shared %@ via self: %@", v178, 0x20u);
                          }
                          goto LABEL_61;
                        }
                      }
                      else
                      {
                      }
                      [v146 addObject:v57];
LABEL_73:
                      int v91 = 0;
LABEL_63:

LABEL_64:
                      if (v91 != 5 && v91) {
                        goto LABEL_75;
                      }
                      if (v155 == (id)++v56)
                      {
                        id v55 = [v152 countByEnumeratingWithState:&v159 objects:v184 count:16];
                        if (!v55)
                        {
LABEL_75:

                          if (v145) {
                            goto LABEL_82;
                          }
                          goto LABEL_78;
                        }
                        continue;
                      }
                      goto LABEL_39;
                    }
                    v94 = [v157 publicEncryptionKey];
                    id v67 = [v94 keyData];

                    id v95 = [v57 share];
                    id v96 = [v95 receiverPublicEncryptionKeySPKI];
                    unsigned int v97 = [v96 isEqual:v67];

                    if (!v97)
                    {
                      v102 = [v156 tlk];
                      id v103 = [v102 zoneName];
                      id v104 = sub_1000CD884(@"ckksshare", v103);

                      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                      {
                        id v105 = [v156 tlk];
                        v106 = [v105 uuid];
                        *(_DWORD *)v178 = 138412802;
                        id v179 = v157;
                        __int16 v180 = 2112;
                        v181 = v106;
                        __int16 v182 = 2112;
                        v183 = v57;
                        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Peer %@ has a share for %@, but to old keys: %@", v178, 0x20u);
                      }
                      [v146 addObject:v57];
                      goto LABEL_73;
                    }
                    v98 = [v156 tlk];
                    v99 = [v98 zoneName];
                    unsigned __int8 v68 = sub_1000CD884(@"ckksshare", v99);

                    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                    {
                      v100 = [v156 tlk];
                      id v101 = [v100 uuid];
                      *(_DWORD *)v178 = 138412802;
                      id v179 = v157;
                      __int16 v180 = 2112;
                      v181 = v101;
                      __int16 v182 = 2112;
                      v183 = v57;
                      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Peer %@ is shared %@ via trusted %@", v178, 0x20u);
                    }
LABEL_61:
                    char v145 = 1;
                    int v91 = 4;
                  }
                  else
                  {

                    int v91 = 0;
                  }
                }
                else
                {
                  v92 = [v156 tlk];
                  uint64_t v93 = [v92 zoneName];
                  unsigned __int8 v68 = sub_1000CD884(@"ckksshare", v93);

                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v178 = 138412546;
                    id v179 = v67;
                    __int16 v180 = 2112;
                    v181 = v57;
                    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Existing TLKShare's signature doesn't verify with current peer set: %@ %@", v178, 0x16u);
                  }
                  int v91 = 5;
                }

                goto LABEL_63;
              }
              break;
            }
            int v91 = 5;
            goto LABEL_64;
          }
          v32 = [v156 tlk];
          unsigned int v33 = [v32 zoneName];
          id v34 = sub_1000CD884(@"ckksshare", v33);

          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v157;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Peer (%@) is not supposed to have view, skipping", buf, 0xCu);
          }

LABEL_84:
          uint64_t v27 = v151 + 1;
        }
        while ((id)(v151 + 1) != v150);
        id v150 = [obj countByEnumeratingWithState:&v174 objects:v189 count:16];
      }
      while (v150);
    }

    if ([v143 count])
    {
      v113 = [v156 tlk];
      v114 = [v113 zoneName];
      uint64_t v115 = sub_1000CD884(@"ckksshare", v114);

      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        id v116 = [v143 count];
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v116;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v143;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "Missing TLK shares for %lu peers: %@", buf, 0x16u);
      }

      id v117 = [v156 tlk];
      v118 = [v117 zoneName];
      v119 = sub_1000CD884(@"ckksshare", v118);

      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v120 = [v153 currentSelfPeersError];
        uint64_t v121 = (void *)v120;
        if (v120) {
          CFStringRef v122 = (const __CFString *)v120;
        }
        else {
          CFStringRef v122 = @"no error";
        }
        v123 = [v153 currentSelfPeers];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v122;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v123;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "Self peers are (%@) %@", buf, 0x16u);
      }
      v124 = [v156 tlk];
      id v125 = [v124 zoneName];
      v126 = sub_1000CD884(@"ckksshare", v125);

      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v127 = [v153 currentTrustedPeersError];
        id v128 = (void *)v127;
        if (v127) {
          CFStringRef v129 = (const __CFString *)v127;
        }
        else {
          CFStringRef v129 = @"no error";
        }
        id v130 = [v153 currentTrustedPeers];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v129;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v130;
        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "Trusted peers are (%@) %@", buf, 0x16u);
      }
    }
    v131 = v143;
    id v20 = v143;
  }
  else
  {
    v132 = [v156 tlk];
    id v133 = [v132 zoneName];
    v134 = sub_1000CD884(@"ckksshare", v133);

    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    {
      v135 = [v153 currentSelfPeers];
      id v136 = [v135 currentSelf];
      long long v137 = [v136 peerID];
      long long v138 = [v153 currentTrustedPeerIDs];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v137;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v138;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_ERROR, "current self peer (%@) is not in the set of trusted peers: %@", buf, 0x16u);
    }
    if (a6)
    {
      long long v139 = [v153 currentSelfPeers];
      long long v140 = [v139 currentSelf];
      v141 = [v140 peerID];
      id v142 = +[NSString stringWithFormat:@"current self peer (%@) is not in the set of trusted peers", v141];
      *a6 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:52 description:v142];
    }
    id v20 = 0;
    v131 = v143;
  }

LABEL_13:

  return v20;
}

+ (id)createMissingKeyShares:(id)a3 peers:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 tlk];
  v13 = [v9 zoneID];
  uint64_t v14 = [v13 ownerName];
  id v63 = 0;
  uint64_t v15 = [v12 ensureKeyLoadedForContextID:v14 cache:0 error:&v63];
  id v16 = v63;

  v53 = (void *)v15;
  if (v15)
  {
    id v62 = v16;
    objc_super v17 = [a1 filterTrustedPeers:v10 missingTLKSharesFor:v9 databaseProvider:v11 error:&v62];
    id v18 = v62;

    if (v17)
    {
      uint64_t v56 = v18;
      id v47 = v11;
      v52 = +[NSMutableSet set];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v48 = v17;
      id obj = v17;
      id v55 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v55)
      {
        uint64_t v54 = *(void *)v59;
        id v51 = v10;
        while (2)
        {
          for (i = 0; i != v55; i = (char *)i + 1)
          {
            if (*(void *)v59 != v54) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            id v21 = [v20 publicEncryptionKey];

            uint64_t v22 = [v9 tlk];
            v23 = [v22 zoneName];
            v24 = sub_1000CD884(@"ckksshare", v23);

            BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
            if (v21)
            {
              if (v25)
              {
                unsigned __int8 v26 = [v9 tlk];
                uint64_t v27 = [v10 currentSelfPeers];
                uint64_t v28 = [v27 currentSelf];
                *(_DWORD *)buf = 138412802;
                id v65 = v26;
                __int16 v66 = 2112;
                id v67 = v28;
                __int16 v68 = 2112;
                unsigned __int8 v69 = v20;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Creating share of %@ as %@ for %@", buf, 0x20u);
              }
              id v29 = v9;
              unsigned int v30 = [v9 tlk];
              unsigned __int8 v31 = [v30 contextID];
              v32 = [v10 currentSelfPeers];
              unsigned int v33 = [v32 currentSelf];
              id v57 = v56;
              v24 = +[CKKSTLKShareRecord share:v53 contextID:v31 as:v33 to:v20 epoch:-1 poisoned:0 error:&v57];
              id v18 = v57;

              if (v18)
              {
                id v9 = v29;
                long long v43 = [v29 tlk];
                uint64_t v44 = [v43 zoneName];
                uint64_t v45 = sub_1000CD884(@"ckksshare", v44);

                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  id v65 = v20;
                  __int16 v66 = 2112;
                  id v67 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Couldn't create new share for %@: %@", buf, 0x16u);
                }

                id v10 = v51;
                if (a6) {
                  *a6 = v18;
                }

                id v35 = 0;
                id v11 = v47;
                id v34 = v52;
                goto LABEL_31;
              }
              [v52 addObject:v24];
              uint64_t v56 = 0;
              id v9 = v29;
              id v10 = v51;
            }
            else if (v25)
            {
              *(_DWORD *)buf = 138412290;
              id v65 = v20;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No need to make TLK for %@; they don't have any encryption keys",
                buf,
                0xCu);
            }
          }
          id v55 = [obj countByEnumeratingWithState:&v58 objects:v70 count:16];
          if (v55) {
            continue;
          }
          break;
        }
      }

      id v34 = v52;
      id v35 = v52;
      id v11 = v47;
      id v18 = v56;
LABEL_31:

      v39 = v48;
    }
    else
    {
      v39 = 0;
      v40 = [v9 tlk];
      long long v41 = [v40 zoneName];
      long long v42 = sub_1000CD884(@"ckksshare", v41);

      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v18;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Unable to find peers missing TLKShares: %@", buf, 0xCu);
      }

      if (a6)
      {
        id v18 = v18;
        id v35 = 0;
        *a6 = v18;
      }
      else
      {
        id v35 = 0;
      }
    }

    id v16 = v18;
  }
  else
  {
    long long v36 = [v9 tlk];
    long long v37 = [v36 zoneName];
    id v38 = sub_1000CD884(@"ckksshare", v37);

    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v65 = v16;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "TLK not loaded; cannot make shares for peers: %@",
        buf,
        0xCu);
    }

    if (a6)
    {
      id v16 = v16;
      id v35 = 0;
      *a6 = v16;
    }
    else
    {
      id v35 = 0;
    }
  }

  return v35;
}

+ (id)createMissingKeyShares:(id)a3 trustStates:(id)a4 databaseProvider:(id)a5 error:(id *)a6
{
  id v31 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  id v11 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    unsigned int v30 = a6;
    id v33 = 0;
    id v13 = 0;
    uint64_t v14 = *(void *)v38;
    uint64_t v15 = v31;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v36 = 0;
        id v18 = [a1 createMissingKeyShares:v15 peers:v17 databaseProvider:v10 error:&v36];
        id v19 = v36;
        id v20 = v19;
        if (v18) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 0;
        }
        if (v21)
        {
          if (v13)
          {
            uint64_t v28 = [v13 setByAddingObjectsFromSet:v18];

            id v13 = (id)v28;
          }
          else
          {
            id v13 = v18;
          }
        }
        else
        {
          id v34 = v13;
          id v22 = v12;
          uint64_t v23 = v14;
          id v24 = v10;
          BOOL v25 = [v15 tlk];
          unsigned __int8 v26 = [v25 zoneName];
          uint64_t v27 = sub_1000CD884(@"ckksshare", v26);

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v42 = v17;
            __int16 v43 = 2112;
            uint64_t v44 = v20;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unable to create shares for trust set %@: %@", buf, 0x16u);
          }

          if (!v33) {
            id v33 = v20;
          }
          id v10 = v24;
          uint64_t v15 = v31;
          uint64_t v14 = v23;
          id v12 = v22;
          id v13 = v34;
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v12);
    if (v13)
    {
      id v11 = v33;
    }
    else
    {
      id v11 = v33;
      if (v30 && v33)
      {
        id v11 = v33;
        id v13 = 0;
        id *v30 = v11;
      }
    }
  }
  else
  {
    id v13 = 0;
    uint64_t v15 = v31;
  }

  return v13;
}

@end