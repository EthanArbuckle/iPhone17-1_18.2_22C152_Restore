@interface CKKSLocalResetOperation
- (CKKSLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)main;
- (void)onqueuePerformLocalReset;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSLocalResetOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 96, 1);
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

- (void)onqueuePerformLocalReset
{
  id v100 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v119 = kSecurityRTCFieldNumViews;
  v102 = [(CKKSLocalResetOperation *)self deps];
  v3 = [v102 views];
  v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 count]);
  v120 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
  v6 = [(CKKSLocalResetOperation *)self deps];
  v7 = [v6 activeAccount];
  v8 = [v7 altDSID];
  uint64_t v9 = kSecurityRTCEventNameLocalReset;
  uint64_t v10 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  v11 = [(CKKSLocalResetOperation *)self deps];
  id v97 = [v100 initWithCKKSMetrics:v5 altDSID:v8 eventName:v9 testsAreEnabled:0 category:v10 sendMetric:[v11 sendMetric]];

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v12 = [(CKKSLocalResetOperation *)self deps];
  v13 = [v12 views];

  id obj = v13;
  id v101 = [v13 countByEnumeratingWithState:&v112 objects:v118 count:16];
  id v14 = 0;
  if (v101)
  {
    uint64_t v99 = *(void *)v113;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v113 != v99) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v112 + 1) + 8 * v15);
      [v16 setViewKeyHierarchyState:@"resetlocal" v97];
      v17 = [(CKKSLocalResetOperation *)self deps];
      v18 = [v17 contextID];
      v19 = [v16 zoneID];
      v20 = [v19 zoneName];
      v21 = +[CKKSZoneStateEntry contextID:v18 zoneName:v20];

      [v21 setCkzonecreated:0];
      [v21 setCkzonesubscribed:0];
      [v21 setChangeToken:0];
      [v21 setMoreRecordsInCloudKit:0];
      [v21 setLastFetchTime:0];
      [v21 setLastLocalKeychainScanTime:0];
      id v111 = v14;
      [v21 saveToDatabase:&v111];
      id v22 = v111;

      if (v22)
      {
        v23 = [(CKKSResultOperation *)self error];

        if (!v23)
        {
          v24 = [v16 zoneID];
          v25 = [v24 zoneName];
          v26 = sub_1000CD884(@"local-reset", v25);

          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v22;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "couldn't reset zone status: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v22];
          id v22 = 0;
        }
      }
      v27 = [(CKKSLocalResetOperation *)self deps];
      v28 = [v27 contextID];
      v29 = [v16 zoneID];
      id v110 = v22;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v28 zoneID:v29 error:&v110];
      id v30 = v110;

      if (v30)
      {
        v31 = [(CKKSResultOperation *)self error];

        if (!v31)
        {
          v32 = [v16 zoneID];
          v33 = [v32 zoneName];
          v34 = sub_1000CD884(@"local-reset", v33);

          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v30;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSMirrorEntry: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v30];
          id v30 = 0;
        }
      }
      v35 = [(CKKSLocalResetOperation *)self deps];
      v36 = [v35 contextID];
      v37 = [v16 zoneID];
      id v109 = v30;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v36 zoneID:v37 error:&v109];
      id v38 = v109;

      if (v38)
      {
        v39 = [(CKKSResultOperation *)self error];

        if (!v39)
        {
          v40 = [v16 zoneID];
          v41 = [v40 zoneName];
          v42 = sub_1000CD884(@"local-reset", v41);

          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v38;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSOutgoingQueueEntry: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v38];
          id v38 = 0;
        }
      }
      v43 = [(CKKSLocalResetOperation *)self deps];
      v44 = [v43 contextID];
      v45 = [v16 zoneID];
      id v108 = v38;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v44 zoneID:v45 error:&v108];
      id v46 = v108;

      if (v46)
      {
        v47 = [(CKKSResultOperation *)self error];

        if (!v47)
        {
          v48 = [v16 zoneID];
          v49 = [v48 zoneName];
          v50 = sub_1000CD884(@"local-reset", v49);

          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v46;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSIncomingQueueEntry: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v46];
          id v46 = 0;
        }
      }
      v51 = [(CKKSLocalResetOperation *)self deps];
      v52 = [v51 contextID];
      v53 = [v16 zoneID];
      id v107 = v46;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v52 zoneID:v53 error:&v107];
      id v54 = v107;

      if (v54)
      {
        v55 = [(CKKSResultOperation *)self error];

        if (!v55)
        {
          v56 = [v16 zoneID];
          v57 = [v56 zoneName];
          v58 = sub_1000CD884(@"local-reset", v57);

          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v54;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSKey: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v54];
          id v54 = 0;
        }
      }
      v59 = [(CKKSLocalResetOperation *)self deps];
      v60 = [v59 contextID];
      v61 = [v16 zoneID];
      id v106 = v54;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v60 zoneID:v61 error:&v106];
      id v62 = v106;

      if (v62)
      {
        v63 = [(CKKSResultOperation *)self error];

        if (!v63)
        {
          v64 = [v16 zoneID];
          v65 = [v64 zoneName];
          v66 = sub_1000CD884(@"local-reset", v65);

          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v62;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSTLKShare: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v62];
          id v62 = 0;
        }
      }
      v67 = [(CKKSLocalResetOperation *)self deps];
      v68 = [v67 contextID];
      v69 = [v16 zoneID];
      id v105 = v62;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v68 zoneID:v69 error:&v105];
      id v70 = v105;

      if (v70)
      {
        v71 = [(CKKSResultOperation *)self error];

        if (!v71)
        {
          v72 = [v16 zoneID];
          v73 = [v72 zoneName];
          v74 = sub_1000CD884(@"local-reset", v73);

          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v70;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSCurrentKeyPointer: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v70];
          id v70 = 0;
        }
      }
      v75 = [(CKKSLocalResetOperation *)self deps];
      v76 = [v75 contextID];
      v77 = [v16 zoneID];
      id v104 = v70;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v76 zoneID:v77 error:&v104];
      id v78 = v104;

      if (v78)
      {
        v79 = [(CKKSResultOperation *)self error];

        if (!v79)
        {
          v80 = [v16 zoneID];
          v81 = [v80 zoneName];
          v82 = sub_1000CD884(@"local-reset", v81);

          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v78;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSCurrentItemPointer: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v78];
          id v78 = 0;
        }
      }
      v83 = [(CKKSLocalResetOperation *)self deps];
      v84 = [v83 contextID];
      v85 = [v16 zoneID];
      id v103 = v78;
      +[CKKSSQLDatabaseObject deleteAllWithContextID:v84 zoneID:v85 error:&v103];
      id v14 = v103;

      if (v14)
      {
        v86 = [(CKKSResultOperation *)self error];

        if (!v86)
        {
          v87 = [v16 zoneID];
          v88 = [v87 zoneName];
          v89 = sub_1000CD884(@"local-reset", v88);

          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v117 = v14;
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "couldn't delete all CKKSDeviceStateEntry: %@", buf, 0xCu);
          }

          [(CKKSResultOperation *)self setError:v14];
          id v14 = 0;
        }
      }
      v90 = [(CKKSResultOperation *)self error];

      if (v90) {
        break;
      }
      if (v101 == (id)++v15)
      {
        id v101 = [obj countByEnumeratingWithState:&v112 objects:v118 count:16];
        if (v101) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v91 = [(CKKSResultOperation *)self error];

  if (v91)
  {
    v92 = [(CKKSResultOperation *)self error];
    v93 = v97;
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v97 success:0 error:v92];
  }
  else
  {
    v94 = sub_1000CD884(@"local-reset", 0);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      v95 = [(CKKSLocalResetOperation *)self deps];
      v96 = [v95 views];
      *(_DWORD *)buf = 138412290;
      id v117 = v96;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Successfully deleted all local data for zones: %@", buf, 0xCu);
    }
    v93 = v97;
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v97 success:1 error:0];
    v92 = [(CKKSLocalResetOperation *)self intendedState];
    [(CKKSLocalResetOperation *)self setNextState:v92];
  }
}

- (void)main
{
  v3 = [(CKKSLocalResetOperation *)self deps];
  v4 = [v3 databaseProvider];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BBCAC;
  v5[3] = &unk_100306A88;
  v5[4] = self;
  [v4 dispatchSyncWithSQLTransaction:v5];
}

- (CKKSLocalResetOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSLocalResetOperation;
  v12 = [(CKKSResultOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
    [(CKKSLocalResetOperation *)v13 setName:@"ckks-local-reset"];
  }

  return v13;
}

@end