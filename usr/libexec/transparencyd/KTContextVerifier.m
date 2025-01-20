@interface KTContextVerifier
+ (BOOL)verifyLoggableDataSignatures:(id)a3 accountKey:(id)a4 error:(id *)a5;
+ (BOOL)verifyServerLoggableDatas:(id)a3 againstSyncedLoggableDatas:(id)a4 cloudDevices:(id)a5 error:(id *)a6;
+ (int64_t)verifyDeviceMutation:(id)a3 mapLeaf:(id)a4;
+ (int64_t)verifyOptInOutMutationMerged:(id)a3 mapLeaf:(id)a4 pendingAccountAdds:(id)a5;
+ (int64_t)verifyOptInOutWithExtMerged:(id)a3 accountKeyHash:(id)a4 mapLeaf:(id)a5 pendingAccountAdds:(id)a6;
- (BOOL)areSMTsOverMMD:(id)a3;
- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 analyticsData:(id)a7;
- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 savePendingError:(BOOL)a7 analyticsData:(id)a8;
- (BOOL)failSMTsIfOverMMD:(id)a3 skipOptInOut:(BOOL)a4 proof:(id)a5 underlyingError:(id)a6 errorCode:(int64_t)a7 analyticsData:(id)a8;
- (BOOL)setInclusionVerifiedState:(unint64_t)a3 logEntry:(id)a4 failure:(id)a5 error:(id *)a6;
- (BOOL)setInclusionVerifiedState:(unint64_t)a3 perApplicationTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6;
- (BOOL)setInclusionVerifiedState:(unint64_t)a3 topLevelTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6;
- (BOOL)verifyKTSMTsMerged:(id)a3 mapLeaf:(id)a4 analyticsData:(id)a5;
- (BOOL)verifyKTSMTsMerged:(id)a3 queryResponse:(id)a4 uri:(id)a5;
- (BOOL)verifyRevisionLogInclusionProofResponse:(id)a3 receivedRevisions:(id)a4 error:(id *)a5;
- (KTApplicationPublicKeyStore)applicationKeyStore;
- (KTContext)context;
- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5;
- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5 context:(id)a6;
- (KTLogClient)logClient;
- (NSString)applicationID;
- (TransparencyManagedDataStore)dataStore;
- (id)createChainOfErrorsFromSMTFailures:(id)a3;
- (id)createChainOfErrorsFromSTHFailures:(id)a3 type:(unint64_t)a4;
- (id)createErrorFromSMTFailure:(id)a3 underlyingError:(id)a4;
- (id)createErrorFromSTHFailure:(id)a3 underlyingError:(id)a4;
- (id)createTransparentDataFromQueryInfo:(id)a3 error:(id *)a4;
- (id)failExpiredSTHsForType:(unint64_t)a3 error:(id *)a4;
- (id)verifyKTSMTSignatures:(id)a3 error:(id *)a4;
- (id)verifySTHs:(id)a3 error:(id *)a4;
- (unint64_t)checkBatchQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)checkQueryInfoFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)checkQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)checkResponseFreshness:(id)a3 smh:(id)a4 receiptDate:(id)a5 error:(id *)a6;
- (unint64_t)checkServerStatus:(int)a3 error:(id *)a4;
- (unint64_t)checkServerStatus:(int)a3 isInsert:(BOOL)a4 error:(id *)a5;
- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 queryInfoHandler:(id)a8;
- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 rawDataHandler:(id)a8;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)verifyAccountKeyWitness:(id)a3 accountKey:(id)a4 error:(id *)a5;
- (unint64_t)verifyConsistencyProofResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 error:(id *)a6;
- (unint64_t)verifyInclusionProof:(id)a3 mapLeaf:(id *)a4 error:(id *)a5;
- (unint64_t)verifyLogConsistencyResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 forwards:(BOOL)a6 serverHint:(id)a7 error:(id *)a8;
- (unint64_t)verifyRevisionLogProofLogEntry:(id)a3 patSTH:(id *)a4 error:(id *)a5;
- (unint64_t)verifyRevisionLogTopLevelProof:(id)a3 patSTH:(id)a4 error:(id *)a5;
- (unint64_t)verifySMTTimestamps:(id)a3 receiptDate:(id)a4 error:(id *)a5;
- (unint64_t)verifySMTs:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6;
- (unint64_t)verifyUriWitness:(id)a3 uri:(id)a4 error:(id *)a5;
- (void)checkBatchQueryResponseEpochs:(id)a3;
- (void)checkHeadEpoch:(id)a3;
- (void)checkQueryResponseEpochs:(id)a3;
- (void)deleteSMT:(id)a3 error:(id)a4;
- (void)processSTHsFromGossipPeers:(id)a3 verifier:(id)a4 error:(id *)a5;
- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 error:(id)a5;
- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 uri:(id)a5 receiptServerHint:(id)a6 error:(id)a7;
- (void)setApplicationID:(id)a3;
- (void)setApplicationKeyStore:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setLogClient:(id)a3;
@end

@implementation KTContextVerifier

- (unint64_t)checkBatchQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 smh];
  unint64_t v10 = [(KTContextVerifier *)self checkResponseFreshness:0 smh:v9 receiptDate:v8 error:a5];

  return v10;
}

- (unint64_t)checkQueryInfoFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 pendingSmtsArray];
  unint64_t v10 = [(KTContextVerifier *)self checkResponseFreshness:v9 smh:0 receiptDate:v8 error:a5];

  return v10;
}

- (void)checkBatchQueryResponseEpochs:(id)a3
{
  id v16 = a3;
  unsigned int v4 = [v16 hasPerApplicationTreeEntry];
  v5 = v16;
  if (v4)
  {
    uint64_t v6 = [v16 perApplicationTreeEntry];
    v5 = v16;
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = [v16 perApplicationTreeEntry];
      if (![v8 hasSlh])
      {
LABEL_6:

        v5 = v16;
        goto LABEL_7;
      }
      v9 = [v16 perApplicationTreeEntry];
      unint64_t v10 = [v9 slh];

      v5 = v16;
      if (v10)
      {
        v7 = [v16 perApplicationTreeEntry];
        id v8 = [v7 slh];
        [(KTContextVerifier *)self checkHeadEpoch:v8];
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  if ([v5 hasTopLevelTreeEntry])
  {
    uint64_t v11 = [v16 topLevelTreeEntry];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v16 topLevelTreeEntry];
      if ([v13 hasSlh])
      {
        v14 = [v16 topLevelTreeEntry];
        v15 = [v14 slh];

        if (!v15) {
          goto LABEL_13;
        }
        v12 = [v16 topLevelTreeEntry];
        v13 = [v12 slh];
        [(KTContextVerifier *)self checkHeadEpoch:v13];
      }
    }
  }
LABEL_13:

  _objc_release_x1();
}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 queryInfoHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (void (**)(id, void *, void *, void))a8;
  unint64_t v19 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", [v14 status], a7);
  if (v19 != 1)
  {
    unint64_t v26 = v19;
    if (qword_10032EC70 != -1) {
      dispatch_once(&qword_10032EC70, &stru_1002C3180);
    }
    v27 = (void *)qword_10032EC78;
    if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
    {
      v28 = v27;
      *(_DWORD *)buf = 138543618;
      uint64_t v92 = (uint64_t)v17;
      __int16 v93 = 1024;
      LODWORD(v94) = [v14 status];
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "BatchQueryResponse for fetchId %{public}@ server error: %d", buf, 0x12u);
    }
    goto LABEL_25;
  }
  [(KTContextVerifier *)self checkBatchQueryResponseEpochs:v14];
  v20 = [(KTContextVerifier *)self context];
  unsigned __int8 v21 = [v20 ready:a7];

  if (v21)
  {
    unint64_t v22 = [(KTContextVerifier *)self checkBatchQueryResponseFreshness:v14 receiptDate:v16 error:a7];
    if (v22 == 1)
    {
      id v23 = [v14 queryInfoArray_Count];
      if (v23 > objc_msgSend(v15, "uriArray_Count"))
      {
        id v24 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -326, @"More query infos in response than in request for fetchId %@, aborting validation and deleting record", v17 code description];
        if (qword_10032EC70 != -1) {
          dispatch_once(&qword_10032EC70, &stru_1002C31E0);
        }
        v25 = qword_10032EC78;
        if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v92 = (uint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "More query infos in response than in request for fetchId %{public}@, aborting validation and deleting record", buf, 0xCu);
        }
        unint64_t v26 = 0;
        if (a7 && v24)
        {
          id v24 = v24;
          unint64_t v26 = 0;
          *a7 = v24;
        }
        goto LABEL_26;
      }
      v32 = [TransparencyMapInclusionProofVerifier alloc];
      v33 = [(KTContextVerifier *)self applicationKeyStore];
      v34 = [(KTContextVerifier *)self applicationID];
      v35 = [(TransparencyMapInclusionProofVerifier *)v32 initWithKeyStore:v33 application:v34];

      v78 = v35;
      [v14 setVerifier:v35];
      v36 = [(KTContextVerifier *)self dataStore];
      [v14 setDataStore:v36];

      v37 = [(KTContextVerifier *)self context];
      v38 = [v37 optInServer];
      [v14 setOptInServer:v38];

      id v90 = 0;
      unint64_t v26 = (unint64_t)[v14 verifyWithError:&v90];
      id v80 = v90;
      id v81 = v17;
      id v84 = v16;
      if (v26 == 1)
      {
        if (objc_msgSend(v14, "queryInfoArray_Count"))
        {
          unint64_t v39 = 0;
          uint64_t v77 = kTransparencyResponseMetadataKeyServerHint;
          v76 = v18;
          id v82 = v15;
          do
          {
            v40 = [v14 queryInfoArray];
            v41 = [v40 objectAtIndexedSubscript:v39];

            v42 = [v15 uriArray];
            v43 = [v42 objectAtIndexedSubscript:v39];

            id v44 = [v41 status];
            id v89 = 0;
            unint64_t v45 = [(KTContextVerifier *)self checkServerStatus:v44 error:&v89];
            id v46 = v89;
            v47 = v46;
            if (v45 == 1)
            {
              id v88 = v46;
              unint64_t v48 = [(KTContextVerifier *)self checkQueryInfoFreshness:v41 receiptDate:v84 error:&v88];
              id v49 = v88;

              if (v48 == 1)
              {
                v50 = [v41 uriWitness];
                id v87 = v49;
                unint64_t v51 = [(KTContextVerifier *)self verifyUriWitness:v50 uri:v43 error:&v87];
                id v83 = v87;

                if (v51 == 1)
                {
                  v52 = [v14 metadata];
                  uint64_t v53 = [v52 objectForKeyedSubscript:v77];

                  v79 = (void *)v53;
                  if (objc_msgSend(v41, "pendingSmtsArray_Count"))
                  {
                    v54 = [v41 pendingSmtsArray];
                    id v86 = v83;
                    unint64_t v55 = [(KTContextVerifier *)self verifySMTs:v54 uri:v43 serverHint:v53 error:&v86];
                    id v49 = v86;

                    if (v55 == 1)
                    {
                      id v83 = v49;
                      id v15 = v82;
                      v18 = v76;
                      goto LABEL_49;
                    }
                    id v15 = v82;
                    v18 = v76;
                    if (qword_10032EC70 != -1) {
                      dispatch_once(&qword_10032EC70, &stru_1002C3260);
                    }
                    v69 = qword_10032EC78;
                    if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 141558530;
                      uint64_t v92 = 1752392040;
                      __int16 v93 = 2112;
                      id v94 = v43;
                      __int16 v95 = 2114;
                      id v96 = v81;
                      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "Pending SMT verification failed for %{mask.hash}@ fetchId %{public}@", buf, 0x20u);
                    }
                    ((void (**)(id, void *, void *, id))v76)[2](v76, v43, 0, v49);
LABEL_64:
                    v67 = v79;
                  }
                  else
                  {
                    id v15 = v82;
LABEL_49:
                    if ([v41 hasMapEntry])
                    {
                      v61 = [v41 mapEntry];
                      v74 = [TransparencyMapEntryVerifier alloc];
                      v72 = [v61 index];
                      v62 = [(KTContextVerifier *)self applicationKeyStore];
                      v63 = [v62 appSthKeyStore];
                      v64 = [(TransparencyMapEntryVerifier *)v74 initWithPositon:v72 trustedKeyStore:v63];

                      v73 = v64;
                      [v61 setVerifier:v64];
                      v65 = [(KTContextVerifier *)self dataStore];
                      [v61 setDataStore:v65];

                      v66 = [v14 verifiableSmh];
                      [v61 setSmh:v66];

                      v67 = v79;
                      [v61 setMetadataValue:v79 key:v77];
                      id v85 = v83;
                      v75 = v61;
                      id v68 = [v61 verifyWithError:&v85];
                      id v49 = v85;

                      if (v68 != (id)1)
                      {
                        v18 = v76;
                        if (qword_10032EC70 != -1) {
                          dispatch_once(&qword_10032EC70, &stru_1002C3280);
                        }
                        id v15 = v82;
                        v70 = qword_10032EC78;
                        if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 141558530;
                          uint64_t v92 = 1752392040;
                          __int16 v93 = 2112;
                          id v94 = v43;
                          __int16 v95 = 2114;
                          id v96 = v81;
                          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "MapEntry verification failed for %{mask.hash}@ fetchId %{public}@", buf, 0x20u);
                        }
                        ((void (**)(id, void *, void *, id))v76)[2](v76, v43, 0, v49);

                        goto LABEL_64;
                      }

                      id v15 = v82;
                      v18 = v76;
                    }
                    else
                    {
                      id v49 = v83;
                      v67 = v79;
                    }
                    v18[2](v18, v43, v41, 0);
                  }

                  goto LABEL_66;
                }
                if (qword_10032EC70 != -1) {
                  dispatch_once(&qword_10032EC70, &stru_1002C3240);
                }
                id v15 = v82;
                v60 = qword_10032EC78;
                if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 141558530;
                  uint64_t v92 = 1752392040;
                  __int16 v93 = 2112;
                  id v94 = v43;
                  __int16 v95 = 2114;
                  id v96 = v81;
                  _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "URIWitness verification failed for %{mask.hash}@ fetchId %{public}@", buf, 0x20u);
                }
                v57 = (void (*)(id, void *, void *, id))v18[2];
                v58 = v18;
                v59 = v43;
                id v49 = v83;
              }
              else
              {
                if (qword_10032EC70 != -1) {
                  dispatch_once(&qword_10032EC70, &stru_1002C3220);
                }
                id v15 = v82;
                v56 = qword_10032EC78;
                if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 141558274;
                  uint64_t v92 = 1752392040;
                  __int16 v93 = 2112;
                  id v94 = v43;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "QueryInfo for %{mask.hash}@ is outside MMD", buf, 0x16u);
                }
                v57 = (void (*)(id, void *, void *, id))v18[2];
                v58 = v18;
                v59 = v43;
              }
              v57(v58, v59, 0, v49);
            }
            else
            {
              ((void (**)(id, void *, void *, id))v18)[2](v18, v43, 0, v46);
              id v49 = v47;
            }
LABEL_66:

            ++v39;
          }
          while (v39 < (unint64_t)[v14 queryInfoArray_Count]);
        }
      }
      else
      {
        if (qword_10032EC70 != -1) {
          dispatch_once(&qword_10032EC70, &stru_1002C3200);
        }
        v71 = qword_10032EC78;
        if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v92 = (uint64_t)v17;
          __int16 v93 = 2112;
          id v94 = v80;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Proof validation failed for fetchId %{public}@: %@", buf, 0x16u);
        }
        if (a7 && v80) {
          *a7 = v80;
        }
      }

      id v24 = 0;
      id v16 = v84;
      id v17 = v81;
      goto LABEL_26;
    }
    unint64_t v26 = v22;
    if (qword_10032EC70 != -1) {
      dispatch_once(&qword_10032EC70, &stru_1002C31C0);
    }
    v30 = qword_10032EC78;
    if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v92 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "BatchQueryResponse for fetchId %{public}@ exceeded MMD", buf, 0xCu);
    }
LABEL_25:
    id v24 = 0;
    goto LABEL_26;
  }
  if (qword_10032EC70 != -1) {
    dispatch_once(&qword_10032EC70, &stru_1002C31A0);
  }
  v29 = qword_10032EC78;
  if (os_log_type_enabled((os_log_t)qword_10032EC78, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v92 = (uint64_t)v17;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "BatchQueryResponse for fetchId %{public}@ waiting for keystore refresh", buf, 0xCu);
  }
  id v24 = 0;
  unint64_t v26 = 2;
LABEL_26:

  return v26;
}

- (id)createTransparentDataFromQueryInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasMapEntry]
    && ([v6 mapEntry],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 mapLeaf],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 length],
        v8,
        v7,
        v9))
  {
    unint64_t v10 = [v6 mapEntry];
    uint64_t v11 = [v10 mapLeaf];
    v12 = +[IdsMapLeaf parseFromData:v11 error:a4];

    if (!v12)
    {
      v13 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v12 = 0;
  }
  id v14 = [KTTransparentData alloc];
  id v15 = [v6 uriWitness];
  id v16 = [v15 output];
  id v17 = [v6 pendingSmtsArray];
  v13 = [(KTTransparentData *)v14 initWithUriVRFOutput:v16 mapLeaf:v12 pendingSMTs:v17 error:a4];

  v18 = [(KTContextVerifier *)self applicationKeyStore];
  unint64_t v19 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v18 patLogBeginningMs] / 1000.0);
  [(KTTransparentData *)v13 setCurrentTreeEpochBeginDate:v19];

LABEL_7:

  return v13;
}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10016E11C;
  v20[3] = &unk_1002C32E8;
  v20[4] = self;
  id v21 = a6;
  id v22 = v14;
  id v23 = a8;
  id v15 = v14;
  id v16 = v23;
  id v17 = v21;
  unint64_t v18 = [(KTContextVerifier *)self handleBatchQueryResponse:a3 queryRequest:a4 receiptDate:v15 fetchId:v17 error:a7 queryInfoHandler:v20];

  return v18;
}

- (unint64_t)verifySMTTimestamps:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    uint64_t v13 = kKTMaximumMergeDelayMs;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = +[SignedMutationTimestamp signedTypeWithObject:](SignedMutationTimestamp, "signedTypeWithObject:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
        id v16 = [v15 parsedMutationWithError:a5];
        id v17 = v16;
        if (!v16) {
          goto LABEL_16;
        }
        double v18 = (double)((unint64_t)[v16 mutationMs] + v13);
        [v8 timeIntervalSince1970];
        if (v19 * 1000.0 > v18)
        {
          id v21 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-307 description:@"SMT timestamp more than MMD ago"];
          id v22 = v21;
          if (a5 && v21) {
            *a5 = v21;
          }

LABEL_16:
          unint64_t v20 = 0;
          goto LABEL_17;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      unint64_t v20 = 1;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v20 = 1;
  }
LABEL_17:

  return v20;
}

- (unint64_t)verifySMTs:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v28 = a4;
  id v29 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v11)
  {
    uint64_t v27 = *(void *)v43;
    unint64_t v25 = 1;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v14 = [(KTContextVerifier *)self applicationKeyStore];
        id v15 = [v14 appSmtKeyStore];
        id v16 = [v15 signatureVerifier];
        id v17 = [(KTContextVerifier *)self dataStore];
        double v18 = +[SignedMutationTimestamp signedTypeWithObject:v13 verifier:v16 dataStore:v17];

        double v19 = [(KTContextVerifier *)self applicationID];
        [v18 setApplication:v19];

        id v20 = [v18 verifyWithError:a6];
        if (v20 != (id)1)
        {

          unint64_t v25 = (unint64_t)v20;
          goto LABEL_15;
        }
        uint64_t v36 = 0;
        v37 = &v36;
        uint64_t v38 = 0x3032000000;
        unint64_t v39 = sub_1001BCA68;
        v40 = sub_1001BCA78;
        id v41 = 0;
        id v21 = [(KTContextVerifier *)self dataStore];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1001BCA80;
        v30[3] = &unk_1002C6228;
        id v22 = v18;
        id v31 = v22;
        v32 = self;
        id v33 = v28;
        id v34 = v29;
        v35 = &v36;
        [v21 performBlockAndWait:v30];

        if (a6)
        {
          id v23 = (void *)v37[5];
          if (v23) {
            *a6 = v23;
          }
        }

        _Block_object_dispose(&v36, 8);
      }
      id v11 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v25 = 1;
  }
LABEL_15:

  return v25;
}

- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 uri:(id)a5 receiptServerHint:(id)a6 error:(id)a7
{
  id v32 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[NSMutableDictionary dictionary];
  unsigned int v17 = +[TransparencyAnalytics hasInternalDiagnostics];
  unsigned int v18 = v17;
  if (v12 && v17) {
    [v16 addEntriesFromDictionary:v12];
  }
  if (v18)
  {
    double v19 = +[SignedObjectHolder parseFromData:v32 error:0];
    id v20 = v19;
    if (v19)
    {
      id v31 = self;
      id v21 = [v19 signature];
      id v22 = [v21 signature];
      id v23 = [v22 base64EncodedStringWithOptions:0];
      [v16 setObject:v23 forKeyedSubscript:@"sig"];

      long long v24 = [v20 parsedMutationWithError:0];
      unint64_t v25 = v24;
      if (v24)
      {
        long long v26 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v24 mutationMs]);
        [v16 setObject:v26 forKeyedSubscript:@"ms"];
      }
      self = v31;
    }
    if (v13) {
      [v16 setObject:v13 forKeyedSubscript:@"uri"];
    }
    if (v14) {
      [v16 setObject:v14 forKeyedSubscript:@"rSH"];
    }
  }
  uint64_t v27 = +[TransparencyAnalytics logger];
  id v28 = [(KTContextVerifier *)self applicationID];
  id v29 = +[TransparencyAnalytics formatEventName:@"VerifySmtInclusionEvent" application:v28];
  if ([v16 count]) {
    v30 = v16;
  }
  else {
    v30 = 0;
  }
  [v27 logResultForEvent:v29 hardFailure:1 result:v15 withAttributes:v30];
}

- (void)reportVerifySMTFailure:(id)a3 analyticsData:(id)a4 error:(id)a5
{
}

- (BOOL)areSMTsOverMMD:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = kKTMaximumMergeDelayMs;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        double v8 = (double)((unint64_t)[*(id *)(*((void *)&v11 + 1) + 8 * i) getUnsigned:@"mutationMs" :v11]+ v6);
        +[NSDate kt_currentTimeMs];
        if (v9 > v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (id)createErrorFromSMTFailure:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 errorDomain];
  id v8 = [v6 errorCode];

  double v9 = +[TransparencyError errorWithDomain:v7 code:v8 underlyingError:v5 description:0];

  return v9;
}

- (id)createChainOfErrorsFromSMTFailures:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 allObjects];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      double v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v7 = [(KTContextVerifier *)self createErrorFromSMTFailure:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9) underlyingError:v10];

        double v9 = (char *)v9 + 1;
        id v10 = v7;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 savePendingError:(BOOL)a7 analyticsData:(id)a8
{
  BOOL v49 = a7;
  id v11 = a3;
  id v12 = a5;
  id v13 = a8;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v11;
  id v14 = [v11 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v14)
  {
    id v15 = v14;
    char v16 = 0;
    uint64_t v17 = *(void *)v59;
    uint64_t v54 = kKTMaximumMergeDelayMs;
    uint64_t v47 = kTransparencyResponseMetadataKeyServerHint;
    unsigned int v18 = self;
    uint64_t v51 = *(void *)v59;
    v52 = v13;
    int64_t v48 = a6;
    while (1)
    {
      double v19 = 0;
      id v50 = v15;
      do
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v19);
        if ([v20 mergeResult] == (id)2)
        {
          double v21 = (double)((unint64_t)[v20 getUnsigned:"mutationMs"] + v54);
          +[NSDate kt_currentTimeMs];
          if (v22 <= v21)
          {
            if (!v49) {
              goto LABEL_26;
            }
            v40 = [v20 receiptServerHint];
            v57 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", a6, v12, @"SMT verification failure before MMD for %@", v40 code underlyingError description];

            if (qword_10032F080 != -1) {
              dispatch_once(&qword_10032F080, &stru_1002C6268);
            }
            id v41 = (void *)qword_10032F088;
            if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_INFO))
            {
              long long v42 = v41;
              long long v43 = [v20 receiptServerHint];
              *(_DWORD *)buf = 138543874;
              v63 = v43;
              __int16 v64 = 2112;
              v65 = v57;
              __int16 v66 = 2112;
              id v67 = v12;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "SMT verification failure before MMD for %{public}@, error: %@, underlyingError: %@", buf, 0x20u);
            }
            unsigned int v18 = self;
          }
          else
          {
            id v23 = [v20 failures];
            uint64_t v24 = [(KTContextVerifier *)v18 createChainOfErrorsFromSMTFailures:v23];

            uint64_t v53 = (void *)v24;
            unint64_t v25 = +[TransparencyError errorWithError:v12 underlyingError:v24];
            long long v26 = [v20 receiptServerHint];
            v57 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", a6, v25, @"SMT verification failure after MMD for %@", v26 code underlyingError description];

            if (qword_10032F080 != -1) {
              dispatch_once(&qword_10032F080, &stru_1002C6248);
            }
            id v13 = v52;
            uint64_t v27 = (void *)qword_10032F088;
            if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
            {
              id v28 = v27;
              id v29 = [v20 receiptServerHint];
              *(_DWORD *)buf = 138543874;
              v63 = v29;
              __int16 v64 = 2112;
              v65 = v57;
              __int16 v66 = 2112;
              id v67 = v12;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "SMT verification failure after MMD for %{public}@, error: %@, underlyingError: %@", buf, 0x20u);
            }
            [v20 setMergeResult:0];
            if ([v20 signatureResult] == (id)2) {
              [v20 setSignatureResult:0];
            }
            v30 = [v20 smt];
            id v31 = [v20 uri];
            id v32 = [v20 receiptServerHint];
            [(KTContextVerifier *)v18 reportVerifySMTFailure:v30 analyticsData:v52 uri:v31 receiptServerHint:v32 error:v57];

            id v33 = [v52 objectForKeyedSubscript:@"opUUID"];
            if (v33)
            {
              id v34 = [objc_alloc((Class)NSUUID) initWithUUIDString:v33];
              v35 = [v52 objectForKeyedSubscript:v47];
              uint64_t v36 = [(KTContextVerifier *)v18 context];
              [v36 stateMachine];
              uint64_t v38 = v37 = v12;
              unint64_t v39 = [v20 smt];
              [v38 notifyBackgroundValidationFailure:v34 data:v39 type:@"SmtInclusion" serverHint:v35 failure:v57];

              id v12 = v37;
              unsigned int v18 = self;
              id v13 = v52;

              a6 = v48;
            }

            char v16 = 1;
            id v15 = v50;
          }
          if (v57)
          {
            long long v44 = [(KTContextVerifier *)v18 dataStore];
            long long v45 = [v44 createSignedMutationTimestampsFailure];

            unsigned int v18 = self;
            [v45 setErrorCode:a6];
            [v45 setErrorDomain:@"TransparencyErrorVerify"];
            [v45 setMutation:v20];
          }
          uint64_t v17 = v51;
        }
LABEL_26:
        double v19 = (char *)v19 + 1;
      }
      while (v15 != v19);
      id v15 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (!v15) {
        goto LABEL_30;
      }
    }
  }
  char v16 = 0;
LABEL_30:

  return v16 & 1;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 proof:(id)a4 underlyingError:(id)a5 errorCode:(int64_t)a6 analyticsData:(id)a7
{
  return [(KTContextVerifier *)self failSMTsIfOverMMD:a3 proof:a4 underlyingError:a5 errorCode:a6 savePendingError:1 analyticsData:a7];
}

- (void)deleteSMT:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(KTContextVerifier *)self dataStore];
  [v8 deleteObject:v7];

  id v9 = [v7 smt];

  [(KTContextVerifier *)self reportVerifySMTFailure:v9 analyticsData:0 error:v6];
}

- (id)verifyKTSMTSignatures:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v7 = v5;
  id v48 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (!v48) {
    goto LABEL_40;
  }
  uint64_t v47 = *(void *)v53;
  uint64_t v45 = kTransparencyErrorDecode;
  long long v44 = self;
  id v42 = v7;
  while (2)
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v53 != v47) {
        objc_enumerationMutation(v7);
      }
      id v9 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v8);
      id v11 = [v9 smt];

      if (!v11)
      {
        id v19 = 0;
LABEL_15:
        id v23 = [v9 smt];
        [v6 addObject:v23];

        uint64_t v24 = +[TransparencyError errorWithDomain:v45 code:-72 underlyingError:v19 description:@"SMT from DB failed to parse"];
        [(KTContextVerifier *)self deleteSMT:v9 error:v24];

        if (qword_10032F080 != -1) {
          dispatch_once(&qword_10032F080, &stru_1002C6288);
        }
        unint64_t v25 = qword_10032F088;
        if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v19;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "SMT from DB failed to parse: %@", buf, 0xCu);
        }
        goto LABEL_29;
      }
      id v12 = [v9 smt];
      id v51 = 0;
      id v13 = +[SignedObjectHolder parseFromData:v12 error:&v51];
      id v14 = v51;

      if (!v13)
      {
        id v19 = v14;
        goto LABEL_15;
      }
      id v46 = v10;
      id v15 = [(KTContextVerifier *)self applicationKeyStore];
      char v16 = [v15 appSmtKeyStore];
      uint64_t v17 = [v16 signatureVerifier];
      [v13 setVerifier:v17];

      id v50 = v14;
      id v18 = [v13 verifyWithError:&v50];
      id v19 = v50;

      if (v18)
      {
        if (v18 != (id)1)
        {
          if (v18 == (id)2)
          {
            v56 = v9;
            id v20 = +[NSArray arrayWithObjects:&v56 count:1];
            unsigned int v21 = [(KTContextVerifier *)self failSMTsIfOverMMD:v20 proof:0 underlyingError:v19 errorCode:-64 analyticsData:0];

            if (v21)
            {
              double v22 = [v9 smt];
              [v6 addObject:v22];
            }
            else
            {

              id v19 = v13;
            }
            id v10 = v46;
            goto LABEL_29;
          }
          goto LABEL_22;
        }
        uint64_t v27 = [v9 receiptTime];
        [v27 timeIntervalSinceNow];
        double v29 = -v28;

        long long v26 = +[TransparencyAnalytics logger];
        v30 = +[NSNumber numberWithDouble:v29];
        [(KTContextVerifier *)v44 applicationID];
        v32 = id v31 = v6;
        id v33 = +[TransparencyAnalytics formatEventName:@"VerifySMTTime" application:v32];
        [v26 logMetric:v30 withName:v33];

        self = v44;
        id v6 = v31;
        id v7 = v42;
      }
      else
      {
        long long v26 = [v9 smt];
        [v6 addObject:v26];
      }

LABEL_22:
      [v9 setUnsigned:"signatureResult" value:v18];
      id v34 = [(KTContextVerifier *)self dataStore];
      id v49 = 0;
      unsigned __int8 v35 = [v34 persistAndRefaultObject:v9 error:&v49];
      id v36 = v49;

      if ((v35 & 1) == 0)
      {
        if (qword_10032F080 != -1) {
          dispatch_once(&qword_10032F080, &stru_1002C62A8);
        }
        id v37 = qword_10032F088;
        if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v36;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "failed to persist signature verified SMTS: %@", buf, 0xCu);
        }
        if (v36)
        {
          uint64_t v38 = [(KTContextVerifier *)v44 dataStore];
          [v38 reportCoreDataPersistEventForLocation:@"handlePendingSigSMTs" underlyingError:v36];

          if (!v19) {
            id v19 = v36;
          }
        }

        goto LABEL_40;
      }
      id v10 = v46;
      if (a4 && v19) {
        *a4 = v19;
      }

      self = v44;
LABEL_29:

      uint64_t v8 = (char *)v8 + 1;
    }
    while (v48 != v8);
    id v48 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v48) {
      continue;
    }
    break;
  }
LABEL_40:

  if ([v6 count]) {
    unint64_t v39 = v6;
  }
  else {
    unint64_t v39 = 0;
  }
  id v40 = v39;

  return v40;
}

+ (int64_t)verifyDeviceMutation:(id)a3 mapLeaf:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 mutationType] != 1
    && [v5 mutationType] != 2
    && [v5 mutationType] != 4
    && [v5 mutationType] != 5)
  {
    int64_t v10 = -71;
    goto LABEL_23;
  }
  if (![v5 hasOptInExtension]) {
    goto LABEL_7;
  }
  id v7 = [v5 getOptInOutWithExt];
  uint64_t v8 = [v5 idsDeviceMutation];
  id v9 = [v8 accountKeyHash];
  int64_t v10 = +[KTContextVerifier verifyOptInOutWithExtMerged:v7 accountKeyHash:v9 mapLeaf:v6 pendingAccountAdds:0];

  if (!v10)
  {
LABEL_7:
    id v11 = [v5 idsDeviceMutation];
    id v12 = [v11 accountKeyHash];
    id v13 = [v5 idsDeviceMutation];
    id v14 = [v13 deviceIdHash];
    id v15 = [v5 idsDeviceMutation];
    id v16 = [v15 appVersion];
    uint64_t v17 = [v5 idsDeviceMutation];
    id v18 = [v17 clientDataHash];
    id v19 = [v6 recordForAccountKeyHash:v12 deviceIdHash:v14 appVersion:v16 clientDataHash:v18];

    if (v19)
    {
      id v20 = [v19 markedForDeletionMs];
      unsigned int v21 = [v5 mutationType];
      if (v20)
      {
        if (v21 == 4 || v21 == 1)
        {
          id v22 = [v19 markedForDeletionMs];
          if (v22 <= [v5 mutationMs])
          {
            int64_t v10 = -70;
LABEL_22:

            goto LABEL_23;
          }
        }
      }
      else if (v21 != 1 && [v5 mutationType] != 4)
      {
        id v26 = [v19 addedMs];
        if (v26 < [v5 mutationMs])
        {
          int64_t v10 = -69;
          goto LABEL_22;
        }
      }
    }
    else if ([v5 mutationType] == 1 || objc_msgSend(v5, "mutationType") == 4)
    {
      uint64_t v23 = [v5 idsDeviceMutation];
      uint64_t v24 = [(id)v23 accountKeyHash];
      unint64_t v25 = [v6 accountForAccountKeyHash:v24];

      LOBYTE(v23) = [v25 hasOptInAfter:[v5 mutationMs]];
      if ((v23 & 1) == 0)
      {
        int64_t v10 = -68;
        goto LABEL_22;
      }
    }
    int64_t v10 = 0;
    goto LABEL_22;
  }
LABEL_23:

  return v10;
}

+ (int64_t)verifyOptInOutMutationMerged:(id)a3 mapLeaf:(id)a4 pendingAccountAdds:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int64_t v10 = [[OptInOutWithExt alloc] initWithMutation:v9];
  id v11 = [v9 accountKeyHash];

  int64_t v12 = +[KTContextVerifier verifyOptInOutWithExtMerged:v10 accountKeyHash:v11 mapLeaf:v8 pendingAccountAdds:v7];
  return v12;
}

+ (int64_t)verifyOptInOutWithExtMerged:(id)a3 accountKeyHash:(id)a4 mapLeaf:(id)a5 pendingAccountAdds:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int64_t v12 = [a5 accountForAccountKeyHash:v10];
  if ((v12 || [v11 containsObject:v10])
    && ((objc_msgSend(v12, "isActive:", objc_msgSend(v9, "timestampMs")) & 1) != 0
     || [v11 containsObject:v10]))
  {
    id v34 = 0;
    id v13 = [v12 sortedOptInOutHistory:&v34];
    id v14 = v34;
    if (v13)
    {
      int64_t v15 = -287;
      if ([v13 count] && !v14)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v16 = [v13 reverseObjectEnumerator];
        uint64_t v17 = [v16 allObjects];

        id v18 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v18)
        {
          id v19 = v18;
          double v28 = 0;
          id v29 = v11;
          uint64_t v20 = *(void *)v31;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v23 = [v22 timestampMs:v28, v29];
              if (v23 == [v9 timestampMs])
              {
                unsigned int v24 = [v22 optIn];
                if (v24 == [v9 optIn])
                {
                  int64_t v15 = 0;
                  goto LABEL_27;
                }
              }
              else
              {
                id v25 = [v22 timestampMs];
                if (v25 < [v9 timestampMs])
                {
                  unsigned int v26 = [v22 optIn];
                  if (v26 != [v9 optIn]) {
                    int64_t v15 = -288;
                  }
                  else {
                    int64_t v15 = 0;
                  }
                  goto LABEL_27;
                }
                [v22 timestampMs];
                [v9 timestampMs];
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
            if (v19) {
              continue;
            }
            break;
          }
          int64_t v15 = -288;
LABEL_27:
          id v14 = v28;
          id v11 = v29;
        }
        else
        {
          int64_t v15 = -288;
        }
      }
    }
    else
    {
      int64_t v15 = -287;
    }
  }
  else
  {
    int64_t v15 = 0;
  }

  return v15;
}

- (BOOL)failSMTsIfOverMMD:(id)a3 skipOptInOut:(BOOL)a4 proof:(id)a5 underlyingError:(id)a6 errorCode:(int64_t)a7 analyticsData:(id)a8
{
  BOOL v12 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = [v13 mutableCopy];
  if (v12)
  {
    id v33 = v16;
    id v34 = v15;
    int64_t v35 = a7;
    id v36 = v14;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v37 = v13;
    id obj = v13;
    id v18 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v43;
      uint64_t v21 = kTransparencyErrorDecode;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v22);
          id v24 = [v23 smt];

          if (v24
            && ([v23 smt],
                id v25 = objc_claimAutoreleasedReturnValue(),
                id v41 = 0,
                +[SignedObjectHolder parseFromData:v25 error:&v41], v26 = objc_claimAutoreleasedReturnValue(), id v24 = v41, v25, v26))
          {
            id v40 = v24;
            uint64_t v27 = [v26 parsedMutationWithError:&v40];
            id v28 = v40;

            if ([v27 mutationType] == 3
              || [v27 mutationType] == 6)
            {
              [v17 removeObject:v23];
              [v23 setMergeResult:1];
            }

            id v24 = v28;
          }
          else
          {
            [v17 removeObject:v23];
            id v29 = +[TransparencyError errorWithDomain:v21 code:-72 underlyingError:v24 description:@"SMT from DB failed to parse"];
            [(KTContextVerifier *)self deleteSMT:v23 error:v29];

            if (qword_10032F080 != -1) {
              dispatch_once(&qword_10032F080, &stru_1002C62C8);
            }
            long long v30 = qword_10032F088;
            if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v47 = v24;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "SMT from DB failed to parse: %@", buf, 0xCu);
            }
          }

          id v22 = (char *)v22 + 1;
        }
        while (v19 != v22);
        id v19 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v19);
    }

    id v14 = v36;
    id v13 = v37;
    id v15 = v34;
    a7 = v35;
    id v16 = v33;
  }
  BOOL v31 = [(KTContextVerifier *)self failSMTsIfOverMMD:v17 proof:v14 underlyingError:v15 errorCode:a7 analyticsData:v16];

  return v31;
}

- (BOOL)verifyKTSMTsMerged:(id)a3 mapLeaf:(id)a4 analyticsData:(id)a5
{
  id v8 = a3;
  id v63 = a4;
  id v62 = a5;
  long long v61 = +[NSMutableArray array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    uint64_t v13 = 1;
    uint64_t v69 = *(void *)v74;
    uint64_t v67 = kTransparencyErrorDecode;
    id v65 = v9;
    while (1)
    {
      id v14 = 0;
      id v66 = v11;
      do
      {
        if (*(void *)v74 != v69) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v14);
        id v16 = [v15 smt];

        if (v16)
        {
          uint64_t v68 = v13;
          id v17 = [v15 smt];
          id v72 = v12;
          id v18 = +[SignedObjectHolder parseFromData:v17 error:&v72];
          id v19 = v72;

          if (v18)
          {
            id v71 = v19;
            uint64_t v20 = [v18 parsedMutationWithError:&v71];
            id v12 = v71;

            if (v20)
            {
              int64_t v21 = -71;
              switch([v20 mutationType])
              {
                case 0u:
                  goto LABEL_31;
                case 1u:
                case 4u:
                  int64_t v22 = +[KTContextVerifier verifyDeviceMutation:v20 mapLeaf:v63];
                  if (!v22) {
                    goto LABEL_32;
                  }
                  int64_t v21 = v22;
                  id v23 = [v20 idsDeviceMutation];
                  id v24 = [v23 accountKeyHash];

                  if (v24)
                  {
                    id v25 = [v20 idsDeviceMutation];
                    unsigned int v26 = [v25 accountKeyHash];
                    [v61 addObject:v26];
                  }
LABEL_31:
                  id v85 = v15;
                  id v33 = +[NSArray arrayWithObjects:&v85 count:1];
                  unsigned int v34 = [(KTContextVerifier *)self failSMTsIfOverMMD:v33 proof:0 underlyingError:0 errorCode:v21 analyticsData:v62];

                  uint64_t v13 = (v34 ^ 1) & v68;
                  break;
                case 2u:
                case 5u:
                  int64_t v21 = +[KTContextVerifier verifyDeviceMutation:v20 mapLeaf:v63];
                  if (!v21) {
                    goto LABEL_32;
                  }
                  goto LABEL_31;
                case 3u:
                  if (qword_10032F080 != -1) {
                    dispatch_once(&qword_10032F080, &stru_1002C6328);
                  }
                  BOOL v31 = qword_10032F088;
                  if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "WARNING: Skipping deprecated mutation type OPT_IN_OUT_MUTATION", buf, 2u);
                  }
                  goto LABEL_32;
                case 6u:
                  long long v32 = [v20 optInOutMutation];
                  int64_t v21 = +[KTContextVerifier verifyOptInOutMutationMerged:v32 mapLeaf:v63 pendingAccountAdds:v61];

                  if (v21) {
                    goto LABEL_31;
                  }
                  goto LABEL_32;
                default:
LABEL_32:
                  if (qword_10032F080 != -1) {
                    dispatch_once(&qword_10032F080, &stru_1002C6348);
                  }
                  int64_t v35 = (void *)qword_10032F088;
                  if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_DEFAULT))
                  {
                    id v36 = v35;
                    id v37 = [v15 application];
                    uint64_t v38 = [v15 uri];
                    id v39 = [v15 mutationMs];
                    *(_DWORD *)buf = 138544130;
                    id v78 = v37;
                    __int16 v79 = 2160;
                    uint64_t v80 = 1752392040;
                    __int16 v81 = 2112;
                    id v82 = v38;
                    __int16 v83 = 2048;
                    id v84 = v39;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "verified SMT inclusion for %{public}@/%{mask.hash}@ mutationMs %lld", buf, 0x2Au);
                  }
                  id v40 = +[TransparencyAnalytics logger];
                  +[NSDate kt_currentTimeMs];
                  long long v42 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v41 - (double)(unint64_t)[v20 mutationMs]);
                  [(KTContextVerifier *)self applicationID];
                  __int16 v64 = v20;
                  long long v44 = v43 = self;
                  long long v45 = +[TransparencyAnalytics formatEventName:@"SmtMergeDelay" application:v44];
                  [v40 logMetric:v42 withName:v45];

                  id v46 = +[TransparencyAnalytics logger];
                  id v47 = [v15 receiptTime];
                  [v47 timeIntervalSinceNow];
                  id v49 = +[NSNumber numberWithDouble:v48 * -1000.0];
                  id v50 = [(KTContextVerifier *)v43 applicationID];
                  id v51 = +[TransparencyAnalytics formatEventName:@"SmtDeviceMergeDelay" application:v50];
                  [v46 logMetric:v49 withName:v51];

                  self = v43;
                  uint64_t v20 = v64;

                  long long v52 = +[TransparencyAnalytics logger];
                  long long v53 = [(KTContextVerifier *)self applicationID];
                  long long v54 = +[TransparencyAnalytics formatEventName:@"VerifySmtInclusionEvent" application:v53];
                  [v52 logSuccessForEventNamed:v54];

                  [v15 setMergeResult:1];
                  uint64_t v13 = v68;
                  break;
              }
              long long v55 = [(KTContextVerifier *)self dataStore];
              id v70 = v12;
              unsigned __int8 v56 = [v55 persistAndRefaultObject:v15 error:&v70];
              id v57 = v70;

              if (v56)
              {
                id v12 = v57;
                id v9 = v65;
              }
              else
              {
                if (qword_10032F080 != -1) {
                  dispatch_once(&qword_10032F080, &stru_1002C6368);
                }
                id v58 = qword_10032F088;
                id v9 = v65;
                if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v78 = v57;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "failed to save verified KTSMTs: %@", buf, 0xCu);
                }
                if (v57)
                {
                  long long v59 = [(KTContextVerifier *)self dataStore];
                  [v59 reportCoreDataPersistEventForLocation:@"verifyKTSMTsMerged" underlyingError:v57];

                  id v12 = v57;
                }
                else
                {
                  id v12 = 0;
                }
              }
              id v11 = v66;
            }
            else
            {
              id v29 = +[TransparencyError errorWithDomain:v67 code:-73 underlyingError:v12 description:@"Mutation failed to parse"];
              [(KTContextVerifier *)self deleteSMT:v15 error:v29];

              if (qword_10032F080 != -1) {
                dispatch_once(&qword_10032F080, &stru_1002C6308);
              }
              long long v30 = qword_10032F088;
              if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v78 = v12;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Mutation failed to parse: %@", buf, 0xCu);
              }
              uint64_t v13 = 0;
            }

            goto LABEL_48;
          }
          id v12 = v19;
        }
        uint64_t v27 = +[TransparencyError errorWithDomain:v67 code:-72 underlyingError:v12 description:@"SMT from DB failed to parse"];
        [(KTContextVerifier *)self deleteSMT:v15 error:v27];

        if (qword_10032F080 != -1) {
          dispatch_once(&qword_10032F080, &stru_1002C62E8);
        }
        id v28 = qword_10032F088;
        if (os_log_type_enabled((os_log_t)qword_10032F088, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v78 = v12;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "SMT from DB failed to parse: %@", buf, 0xCu);
        }
        uint64_t v13 = 0;
LABEL_48:
        id v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v73 objects:v86 count:16];
      if (!v11) {
        goto LABEL_52;
      }
    }
  }
  id v12 = 0;
  LOBYTE(v13) = 1;
LABEL_52:

  return v13 & 1;
}

- (BOOL)verifyKTSMTsMerged:(id)a3 queryResponse:(id)a4 uri:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    id v11 = [v9 metadata];
    uint64_t v12 = kTransparencyResponseMetadataKeyServerHint;
    uint64_t v13 = [v11 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];

    id v14 = [v9 metadata];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"APS"];

    if (v13 | v15)
    {
      id v16 = +[NSMutableDictionary dictionary];
      id v17 = v16;
      if (v13) {
        [v16 setObject:v13 forKey:v12];
      }
      if (v15) {
        [v17 setObject:&__kCFBooleanTrue forKey:@"APS"];
      }
    }
    else
    {
      id v17 = 0;
    }
    if ([v9 status] == 1)
    {
      uint64_t v44 = v15;
      id v18 = [TransparencyMapInclusionProofVerifier alloc];
      id v19 = [(KTContextVerifier *)self applicationKeyStore];
      uint64_t v20 = [(KTContextVerifier *)self applicationID];
      int64_t v21 = [(TransparencyMapInclusionProofVerifier *)v18 initWithKeyStore:v19 application:v20];

      int64_t v22 = [v9 inclusionProof];
      long long v43 = v21;
      [v22 setVerifier:v21];

      id v23 = [v9 inclusionProof];
      id v24 = [(KTContextVerifier *)self dataStore];
      [v23 setDataStore:v24];

      id v25 = [v9 inclusionProof];
      unsigned int v26 = [v9 metadata];
      uint64_t v27 = [v26 objectForKeyedSubscript:v12];
      [v25 setMetadataValue:v27 key:v12];

      id v28 = [v9 inclusionProof];
      id v46 = 0;
      id v29 = [v28 verifyWithError:&v46];
      id v30 = v46;

      BOOL v31 = [v9 inclusionProof];
      long long v32 = v31;
      if (v29 == (id)1)
      {
        id v45 = v30;
        uint64_t v33 = [v31 mapLeafWithError:&v45];
        id v34 = v45;

        if (v33)
        {
          LOBYTE(self) = [(KTContextVerifier *)self verifyKTSMTsMerged:v8 mapLeaf:v33 analyticsData:v17];
          long long v32 = (void *)v33;
          id v30 = v34;
        }
        else
        {
          [v9 inclusionProof];
          id v38 = v34;
          id v39 = v42 = v34;
          id v40 = [v39 data];
          LODWORD(self) = ![(KTContextVerifier *)self failSMTsIfOverMMD:v8 proof:v40 underlyingError:v38 errorCode:-79 analyticsData:v17];

          long long v32 = 0;
          id v30 = v42;
        }
      }
      else
      {
        id v37 = [v31 data];
        LODWORD(self) = ![(KTContextVerifier *)self failSMTsIfOverMMD:v8 proof:v37 underlyingError:v30 errorCode:-67 analyticsData:v17];
      }
      uint64_t v15 = v44;
    }
    else
    {
      +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorServer, (int)[v9 status], @"Query response indicates server failure: %d", [v9 status]);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v35 = [v9 status] == 7;
      id v36 = [v9 data];
      LODWORD(self) = ![(KTContextVerifier *)self failSMTsIfOverMMD:v8 skipOptInOut:v35 proof:v36 underlyingError:v30 errorCode:-306 analyticsData:v17];
    }
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTContextVerifier;
  uint64_t v15 = [(KTContextVerifier *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_applicationID, a5);
    objc_storeStrong((id *)&v16->_applicationKeyStore, a3);
    objc_storeStrong((id *)&v16->_dataStore, a4);
    objc_storeWeak((id *)&v16->_context, v14);
  }

  return v16;
}

- (KTContextVerifier)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 applicationID:(id)a5
{
  return [(KTContextVerifier *)self initWithApplicationKeyStore:a3 dataStore:a4 applicationID:a5 context:0];
}

- (unint64_t)checkServerStatus:(int)a3 isInsert:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a3 == 3 && a4;
  unint64_t result = 1;
  if (a3 != 1 && !v6)
  {
    uint64_t v9 = *(void *)&a3;
    if (a5)
    {
      *a5 = +[TransparencyError errorWithDomain:kTransparencyErrorServer, a3, @"Query response indicates server failure: %d", *(void *)&a3 code description];
    }
    if (qword_10032F090 != -1) {
      dispatch_once(&qword_10032F090, &stru_1002C6388);
    }
    id v10 = qword_10032F098;
    if (os_log_type_enabled((os_log_t)qword_10032F098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Response indicates server failure: %d", buf, 8u);
    }
    id v11 = [(KTContextVerifier *)self applicationKeyStore];
    [v11 triggerRefreshFromServerStatus:v9];

    return 2 * (v9 == 5);
  }
  return result;
}

- (unint64_t)checkServerStatus:(int)a3 error:(id *)a4
{
  return [(KTContextVerifier *)self checkServerStatus:*(void *)&a3 isInsert:0 error:a4];
}

- (unint64_t)checkResponseFreshness:(id)a3 smh:(id)a4 receiptDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12)
  {
    id v12 = +[NSDate date];
  }
  if (![v10 count]
    || (unint64_t v13 = [(KTContextVerifier *)self verifySMTTimestamps:v10 receiptDate:v12 error:a6], v13 == 1))
  {
    uint64_t v14 = [v11 object];
    if (v14 && (v15 = (void *)v14, unsigned int v16 = [v11 hasSignature], v15, v16))
    {
      id v17 = [(KTContextVerifier *)self applicationKeyStore];
      objc_super v18 = [v17 appSthKeyStore];
      id v19 = [v18 signatureVerifier];
      uint64_t v20 = [(KTContextVerifier *)self dataStore];
      int64_t v21 = +[SignedMapHead signedTypeWithObject:v11 verifier:v19 dataStore:v20];

      int64_t v22 = [(KTContextVerifier *)self applicationKeyStore];
      [v21 setOverrideBeginTime:[v22 patLogBeginningMs]];

      [v12 timeIntervalSinceReferenceDate];
      unint64_t v13 = (unint64_t)[v21 verifyMMD:a6 error:x0];
    }
    else
    {
      unint64_t v13 = 1;
    }
  }

  return v13;
}

+ (BOOL)verifyServerLoggableDatas:(id)a3 againstSyncedLoggableDatas:(id)a4 cloudDevices:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v49 = a4;
  id v9 = a5;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v8;
  id v10 = [v8 countByEnumeratingWithState:&v61 objects:v70 count:16];
  id v53 = v10;
  if (!v10)
  {
    char v43 = 1;
    goto LABEL_48;
  }
  id v50 = 0;
  char v46 = 1;
  uint64_t v52 = *(void *)v62;
  *(void *)&long long v11 = 138412546;
  long long v45 = v11;
  id v48 = v9;
  do
  {
    id v12 = 0;
    do
    {
      if (*(void *)v62 != v52) {
        objc_enumerationMutation(obj);
      }
      unint64_t v13 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v12);
      uint64_t v14 = [v13 deviceID:v45];
      uint64_t v15 = [v13 clientData];
      unsigned int v16 = [v9 fetchSyncedLoggableDataByPushToken:v14 registrationData:v15];

      if ([v9 disableKTSyncabledKVSStore])
      {
        if (v16) {
          goto LABEL_40;
        }
        uint64_t v17 = -101;
LABEL_30:
        unsigned __int8 v56 = v16;
        if (a6 && *a6) {
          id v18 = *a6;
        }
        else {
          id v18 = 0;
        }
        BOOL v31 = +[NSMutableDictionary dictionary];
        long long v32 = [v13 clientData];
        uint64_t v33 = [v32 kt_hexString];
        [v31 setObject:v33 forKeyedSubscript:@"clientData"];

        id v34 = [v13 deviceID];
        BOOL v35 = [v34 kt_hexString];
        [v31 setObject:v35 forKeyedSubscript:@"deviceID"];

        uint64_t v36 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:v17 errorLevel:4 underlyingError:v18 userinfo:v31 description:@"IDS server data missing from syncedData"];

        if (qword_10032F090 != -1) {
          dispatch_once(&qword_10032F090, &stru_1002C63A8);
        }
        id v37 = (void *)qword_10032F098;
        if (os_log_type_enabled((os_log_t)qword_10032F098, OS_LOG_TYPE_ERROR))
        {
          id v38 = v37;
          id v39 = [v13 deviceID];
          id v40 = [v39 kt_hexString];
          double v41 = [v13 clientData];
          [v41 kt_hexString];
          v42 = long long v55 = v12;
          *(_DWORD *)buf = v45;
          id v66 = v40;
          __int16 v67 = 2112;
          uint64_t v68 = v42;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "IDS server data (deviceId: %@, clientData: %@) missing from syncedData", buf, 0x16u);

          id v12 = v55;
        }
        [v13 setNotInSyncedData:1];
        [v13 setResult:0];
        [v13 setFailure:v36];

        char v46 = 0;
        id v50 = (id)v36;
LABEL_39:

        unsigned int v16 = v56;
        goto LABEL_40;
      }
      long long v54 = v12;
      unsigned __int8 v56 = v16;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v18 = v49;
      id v19 = [v18 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v58;
        uint64_t v17 = -101;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v58 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            id v24 = [v13 deviceID];
            id v25 = [v23 deviceID];
            unsigned int v26 = [v24 isEqualToData:v25];

            uint64_t v27 = [v13 clientData];
            id v28 = [v23 clientData];
            unsigned int v29 = [v27 isEqualToData:v28];

            int v30 = v26 ^ 1;
            if ((v26 ^ 1) & 1) == 0 && (v29)
            {
              id v9 = v48;
              id v12 = v54;
              goto LABEL_39;
            }
            if ((v30 & v29) != 1 || v17 == -88)
            {
              if (((v30 | v29) & 1) != 0 || v17 == -87)
              {
                if (v26 | v29) {
                  uint64_t v17 = -89;
                }
              }
              else
              {
                uint64_t v17 = -88;
              }
            }
            else
            {
              uint64_t v17 = -87;
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v57 objects:v69 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v17 = -101;
      }

      id v9 = v48;
      id v12 = v54;
      unsigned int v16 = v56;
      if (!v56) {
        goto LABEL_30;
      }
LABEL_40:

      id v12 = (char *)v12 + 1;
    }
    while (v12 != v53);
    id v53 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  }
  while (v53);
  if (a6)
  {
    id v10 = v50;
    if (v50)
    {
      id v10 = v50;
      *a6 = v10;
    }
  }
  else
  {
    id v10 = v50;
  }
  char v43 = v46;
LABEL_48:

  return v43 & 1;
}

- (unint64_t)verifyUriWitness:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 type];
  long long v11 = [(KTApplicationPublicKeyStore *)self->_applicationKeyStore vrfKey];
  id v12 = +[TransparencyVRFVerifier verifierOfType:v10 key:v11];

  [v9 setVerifier:v12];
  unint64_t v13 = [v8 dataUsingEncoding:4];
  [v9 setMessage:v13];

  id v14 = [v9 verifyWithError:a5];
  if (v14 != (id)1)
  {
    if (a5)
    {
      *a5 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -104, *a5, @"URI VRF witness failed for %@", v8 code underlyingError description];
    }
    if (qword_10032F090 != -1) {
      dispatch_once(&qword_10032F090, &stru_1002C63C8);
    }
    uint64_t v15 = qword_10032F098;
    if (os_log_type_enabled((os_log_t)qword_10032F098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "URI VRF witness failed for %@", buf, 0xCu);
    }
  }

  return (unint64_t)v14;
}

- (unint64_t)verifyAccountKeyWitness:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 type];
  long long v11 = [(KTApplicationPublicKeyStore *)self->_applicationKeyStore vrfKey];
  id v12 = +[TransparencyVRFVerifier verifierOfType:v10 key:v11];

  [v9 setVerifier:v12];
  [v9 setMessage:v8];
  id v13 = [v9 verifyWithError:a5];

  if (v13 != (id)1)
  {
    if (a5)
    {
      *a5 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -77, *a5, @"AccountKey VRF witness failed for %@", v8 code underlyingError description];
    }
    if (qword_10032F090 != -1) {
      dispatch_once(&qword_10032F090, &stru_1002C63E8);
    }
    id v14 = qword_10032F098;
    if (os_log_type_enabled((os_log_t)qword_10032F098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "AccountKey VRF witness failed for %@", buf, 0xCu);
    }
  }

  return (unint64_t)v13;
}

+ (BOOL)verifyLoggableDataSignatures:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableDictionary dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
  BOOL v12 = v11 == 0;
  if (!v11)
  {
    id v14 = 0;
    id v25 = v10;
LABEL_20:

    goto LABEL_21;
  }
  id v13 = v11;
  unsigned int v29 = a5;
  BOOL v30 = v11 == 0;
  BOOL v31 = v9;
  id v14 = 0;
  uint64_t v15 = *(void *)v34;
  char v16 = 1;
  do
  {
    id v17 = v10;
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v34 != v15) {
        objc_enumerationMutation(v17);
      }
      id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      id v32 = 0;
      unsigned __int8 v20 = [v19 verifySignatureWithAccountKey:v8 error:&v32];
      id v21 = v32;
      if ((v20 & 1) == 0)
      {
        [v19 setResult:0];
        [v19 setFailure:v21];
        int64_t v22 = [v19 deviceID];
        id v23 = [v22 kt_hexString];
        [v31 setObject:v21 forKeyedSubscript:v23];

        id v24 = v21;
        char v16 = 0;
        id v14 = v24;
      }
    }
    id v10 = v17;
    id v13 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
  }
  while (v13);

  if ((v16 & 1) == 0)
  {
    id v9 = v31;
    if (v31)
    {
      CFStringRef v37 = @"loggableDataErrors";
      id v38 = v31;
      id v25 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    }
    else
    {
      id v25 = 0;
    }
    unsigned int v26 = [v14 domain];
    uint64_t v27 = +[TransparencyError errorWithDomain:code:userInfo:](TransparencyError, "errorWithDomain:code:userInfo:", v26, [v14 code], v25);

    BOOL v12 = v30;
    if (v29 && v27) {
      id *v29 = v27;
    }

    goto LABEL_20;
  }
  BOOL v12 = 1;
  id v9 = v31;
LABEL_21:

  return v12;
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationID:(id)a3
{
}

- (KTContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (KTContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (KTLogClient)logClient
{
  return (KTLogClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);

  objc_storeStrong((id *)&self->_applicationKeyStore, 0);
}

- (unint64_t)checkQueryResponseFreshness:(id)a3 receiptDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 pendingSmtsArray];
  id v11 = [v9 inclusionProof];

  BOOL v12 = [v11 mapEntry];
  id v13 = [v12 smh];
  unint64_t v14 = [(KTContextVerifier *)self checkResponseFreshness:v10 smh:v13 receiptDate:v8 error:a5];

  return v14;
}

- (void)checkQueryResponseEpochs:(id)a3
{
  id v16 = a3;
  if ([v16 hasInclusionProof])
  {
    id v4 = [v16 inclusionProof];

    if (v4)
    {
      id v5 = [v16 inclusionProof];
      if ([v5 hasPerApplicationTreeEntry])
      {
        uint64_t v6 = [v5 perApplicationTreeEntry];
        if (v6)
        {
          id v7 = (void *)v6;
          id v8 = [v5 perApplicationTreeEntry];
          if (![v8 hasSlh])
          {
LABEL_8:

            goto LABEL_9;
          }
          id v9 = [v5 perApplicationTreeEntry];
          id v10 = [v9 slh];

          if (v10)
          {
            id v7 = [v5 perApplicationTreeEntry];
            id v8 = [v7 slh];
            [(KTContextVerifier *)self checkHeadEpoch:v8];
            goto LABEL_8;
          }
        }
      }
LABEL_9:
      if (![v5 hasTopLevelTreeEntry]) {
        goto LABEL_15;
      }
      uint64_t v11 = [v5 topLevelTreeEntry];
      if (!v11) {
        goto LABEL_15;
      }
      BOOL v12 = (void *)v11;
      id v13 = [v5 topLevelTreeEntry];
      if ([v13 hasSlh])
      {
        unint64_t v14 = [v5 topLevelTreeEntry];
        uint64_t v15 = [v14 slh];

        if (!v15)
        {
LABEL_15:

          goto LABEL_16;
        }
        BOOL v12 = [v5 topLevelTreeEntry];
        id v13 = [v12 slh];
        [(KTContextVerifier *)self checkHeadEpoch:v13];
      }

      goto LABEL_15;
    }
  }
LABEL_16:

  _objc_release_x1();
}

- (unint64_t)verifyInclusionProof:(id)a3 mapLeaf:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [TransparencyMapInclusionProofVerifier alloc];
  id v10 = [(KTContextVerifier *)self applicationKeyStore];
  uint64_t v11 = [(KTContextVerifier *)self applicationID];
  BOOL v12 = [(TransparencyMapInclusionProofVerifier *)v9 initWithKeyStore:v10 application:v11];

  [v8 setVerifier:v12];
  id v13 = [(KTContextVerifier *)self dataStore];
  [v8 setDataStore:v13];

  unint64_t v14 = [(KTContextVerifier *)self context];
  uint64_t v15 = [v14 optInServer];
  [v8 setOptInServer:v15];

  unint64_t v16 = (unint64_t)[v8 verifyWithError:a5];
  if (v16 == 1)
  {
    if (a4)
    {
      id v17 = [v8 mapLeafWithError:a5];
      *a4 = v17;
      unint64_t v16 = v17 != 0;
    }
    else
    {
      unint64_t v16 = 1;
    }
  }

  return v16;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 rawDataHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *, void *, id, void *, void))a8;
  unint64_t v19 = -[KTContextVerifier checkServerStatus:error:](self, "checkServerStatus:error:", [v14 status], a7);
  if (v19 == 1)
  {
    [(KTContextVerifier *)self checkQueryResponseEpochs:v14];
    unsigned __int8 v20 = [(KTContextVerifier *)self context];
    unsigned __int8 v21 = [v20 ready:a7];

    if (v21)
    {
      unint64_t v22 = [(KTContextVerifier *)self checkQueryResponseFreshness:v14 receiptDate:v16 error:a7];
      if (v22 == 1)
      {
        id v23 = [v14 uriWitness];
        id v24 = [v15 uri];
        unint64_t v25 = [(KTContextVerifier *)self verifyUriWitness:v23 uri:v24 error:a7];

        if (v25 == 1)
        {
          unsigned int v26 = [v14 metadata];
          uint64_t v27 = kTransparencyResponseMetadataKeyServerHint;
          id v49 = [v26 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];

          if ([v14 hasInclusionProof]
            && ([v14 inclusionProof],
                id v28 = objc_claimAutoreleasedReturnValue(),
                v28,
                v28))
          {
            unsigned int v29 = [v14 inclusionProof];
            [v29 setMetadataValue:v49 key:v27];

            BOOL v30 = [v14 inclusionProof];
            id v50 = 0;
            unint64_t v25 = [(KTContextVerifier *)self verifyInclusionProof:v30 mapLeaf:&v50 error:a7];
            id v48 = v50;

            if (v25 != 1)
            {
              if (qword_10032F1A8 != -1) {
                dispatch_once(&qword_10032F1A8, &stru_1002C7C58);
              }
              BOOL v31 = qword_10032F1B0;
              if (os_log_type_enabled((os_log_t)qword_10032F1B0, OS_LOG_TYPE_ERROR))
              {
                if (a7) {
                  id v32 = *a7;
                }
                else {
                  id v32 = 0;
                }
                *(_DWORD *)buf = 138543618;
                id v52 = v17;
                __int16 v53 = 2112;
                uint64_t v54 = (uint64_t)v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ failed inclusion proof verification: %@", buf, 0x16u);
              }
              long long v45 = v48;
LABEL_42:

              goto LABEL_43;
            }
          }
          else
          {
            id v48 = 0;
          }
          if (objc_msgSend(v14, "pendingSmtsArray_Count")
            && ([v14 pendingSmtsArray],
                id v39 = objc_claimAutoreleasedReturnValue(),
                [v15 uri],
                id v40 = objc_claimAutoreleasedReturnValue(),
                unint64_t v25 = [(KTContextVerifier *)self verifySMTs:v39 uri:v40 serverHint:v49 error:a7], v40, v39, v25 != 1))
          {
            if (qword_10032F1A8 != -1) {
              dispatch_once(&qword_10032F1A8, &stru_1002C7C78);
            }
            char v46 = qword_10032F1B0;
            long long v45 = v48;
            if (os_log_type_enabled((os_log_t)qword_10032F1B0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v52 = v17;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Pending SMT verification failed for fetchId %{public}@", buf, 0xCu);
            }
          }
          else
          {
            double v41 = [v15 uri];
            id v42 = [v14 uriWitness];
            char v43 = [v42 output];
            uint64_t v44 = [v14 pendingSmtsArray];
            long long v45 = v48;
            v18[2](v18, v41, v43, v48, v44, 0);

            unint64_t v25 = 1;
          }
          goto LABEL_42;
        }
        if (qword_10032F1A8 != -1) {
          dispatch_once(&qword_10032F1A8, &stru_1002C7C38);
        }
        CFStringRef v37 = (void *)qword_10032F1B0;
        if (os_log_type_enabled((os_log_t)qword_10032F1B0, OS_LOG_TYPE_ERROR))
        {
          long long v34 = v37;
          id v38 = [v15 uri];
          *(_DWORD *)buf = 138543874;
          id v52 = v17;
          __int16 v53 = 2160;
          uint64_t v54 = 1752392040;
          __int16 v55 = 2112;
          unsigned __int8 v56 = v38;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ failed uri witness verification: %{mask.hash}@", buf, 0x20u);

          goto LABEL_17;
        }
      }
      else
      {
        unint64_t v25 = v22;
        if (qword_10032F1A8 != -1) {
          dispatch_once(&qword_10032F1A8, &stru_1002C7C18);
        }
        long long v36 = qword_10032F1B0;
        if (os_log_type_enabled((os_log_t)qword_10032F1B0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v52 = v17;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ exceeded MMD", buf, 0xCu);
        }
      }
    }
    else
    {
      if (qword_10032F1A8 != -1) {
        dispatch_once(&qword_10032F1A8, &stru_1002C7BF8);
      }
      long long v35 = qword_10032F1B0;
      if (os_log_type_enabled((os_log_t)qword_10032F1B0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v52 = v17;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ waiting for keystore refresh", buf, 0xCu);
      }
      unint64_t v25 = 2;
    }
  }
  else
  {
    unint64_t v25 = v19;
    if (qword_10032F1A8 != -1) {
      dispatch_once(&qword_10032F1A8, &stru_1002C7BD8);
    }
    long long v33 = (void *)qword_10032F1B0;
    if (os_log_type_enabled((os_log_t)qword_10032F1B0, OS_LOG_TYPE_ERROR))
    {
      long long v34 = v33;
      *(_DWORD *)buf = 138543618;
      id v52 = v17;
      __int16 v53 = 1024;
      LODWORD(v54) = [v14 status];
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "QueryResponse for fetchId %{public}@ server error: %d", buf, 0x12u);
LABEL_17:
    }
  }
LABEL_43:

  return v25;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001DF58C;
  v20[3] = &unk_1002C7CE0;
  v20[4] = self;
  id v21 = a6;
  id v22 = v14;
  id v23 = a8;
  id v15 = v14;
  id v16 = v23;
  id v17 = v21;
  unint64_t v18 = [(KTContextVerifier *)self handleQueryResponse:a3 queryRequest:a4 receiptDate:v15 fetchId:v17 error:a7 rawDataHandler:v20];

  return v18;
}

- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, id, id, void))a7;
  unint64_t v16 = -[KTContextVerifier checkServerStatus:isInsert:error:](self, "checkServerStatus:isInsert:error:", [v12 status], 1, a6);
  if (v16 == 1)
  {
    id v17 = [(KTContextVerifier *)self context];
    unsigned __int8 v18 = [v17 ready:a6];

    if (v18)
    {
      unint64_t v19 = [v12 uriWitness];
      unint64_t v20 = [(KTContextVerifier *)self verifyUriWitness:v19 uri:v13 error:a6];

      if (v20 == 1)
      {
        id v21 = [v12 smt];
        char v46 = v21;
        id v22 = +[NSArray arrayWithObjects:&v46 count:1];
        id v23 = [v12 serverEventInfo];
        unint64_t v20 = [(KTContextVerifier *)self verifySMTs:v22 uri:v13 serverHint:v23 error:a6];

        if (v20 == 1)
        {
          char v43 = [KTTransparentData alloc];
          id v24 = [v12 uriWitness];
          unint64_t v25 = [v24 output];
          unsigned int v26 = [v12 smt];
          long long v45 = v26;
          uint64_t v27 = +[NSArray arrayWithObjects:&v45 count:1];
          uint64_t v44 = [(KTTransparentData *)v43 initWithUriVRFOutput:v25 mapLeaf:0 pendingSMTs:v27 error:a6];

          id v28 = [(KTContextVerifier *)self applicationKeyStore];
          unsigned int v29 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v28 patLogBeginningMs] / 1000.0);
          [(KTTransparentData *)v44 setCurrentTreeEpochBeginDate:v29];

          if (v44)
          {
            if ([(KTTransparentData *)v44 verifyServerInvariantsAt:0 error:a6])
            {
              v15[2](v15, v13, v44, 0);
              unint64_t v20 = 1;
LABEL_42:

              goto LABEL_43;
            }
            if (qword_10032F1B8 != -1) {
              dispatch_once(&qword_10032F1B8, &stru_1002C7DA0);
            }
            id v38 = qword_10032F1C0;
            if (!os_log_type_enabled((os_log_t)qword_10032F1C0, OS_LOG_TYPE_ERROR))
            {
LABEL_41:
              unint64_t v20 = 0;
              goto LABEL_42;
            }
            if (a6) {
              id v40 = *a6;
            }
            else {
              id v40 = 0;
            }
            *(_DWORD *)buf = 138543618;
            id v48 = v14;
            __int16 v49 = 2112;
            uint64_t v50 = (uint64_t)v40;
            double v41 = "InsertResponse for fetchId %{public}@ failed server invariant verification: %@";
          }
          else
          {
            if (qword_10032F1B8 != -1) {
              dispatch_once(&qword_10032F1B8, &stru_1002C7D80);
            }
            id v38 = qword_10032F1C0;
            if (!os_log_type_enabled((os_log_t)qword_10032F1C0, OS_LOG_TYPE_ERROR)) {
              goto LABEL_41;
            }
            if (a6) {
              id v39 = *a6;
            }
            else {
              id v39 = 0;
            }
            *(_DWORD *)buf = 138543618;
            id v48 = v14;
            __int16 v49 = 2112;
            uint64_t v50 = (uint64_t)v39;
            double v41 = "InsertResponse for fetchId %{public}@ failed to build transparentData: %@";
          }
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);
          goto LABEL_41;
        }
        if (qword_10032F1B8 != -1) {
          dispatch_once(&qword_10032F1B8, &stru_1002C7D60);
        }
        uint64_t v37 = qword_10032F1C0;
        if (os_log_type_enabled((os_log_t)qword_10032F1C0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v48 = v14;
          long long v34 = "Pending SMT verification failed for fetchId %{public}@";
          long long v35 = v37;
          uint32_t v36 = 12;
          goto LABEL_25;
        }
      }
      else
      {
        if (qword_10032F1B8 != -1) {
          dispatch_once(&qword_10032F1B8, &stru_1002C7D40);
        }
        uint64_t v33 = qword_10032F1C0;
        if (os_log_type_enabled((os_log_t)qword_10032F1C0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v48 = v14;
          __int16 v49 = 2160;
          uint64_t v50 = 1752392040;
          __int16 v51 = 2112;
          id v52 = v13;
          long long v34 = "InsertResponse for fetchId %{public}@ failed uri witness verification: %{mask.hash}@";
          long long v35 = v33;
          uint32_t v36 = 32;
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
        }
      }
    }
    else
    {
      if (qword_10032F1B8 != -1) {
        dispatch_once(&qword_10032F1B8, &stru_1002C7D20);
      }
      id v32 = qword_10032F1C0;
      if (os_log_type_enabled((os_log_t)qword_10032F1C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v14;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "InsertResponse for fetchId %{public}@ waiting for keystore refresh", buf, 0xCu);
      }
      unint64_t v20 = 2;
    }
  }
  else
  {
    unint64_t v20 = v16;
    if (qword_10032F1B8 != -1) {
      dispatch_once(&qword_10032F1B8, &stru_1002C7D00);
    }
    BOOL v30 = (void *)qword_10032F1C0;
    if (os_log_type_enabled((os_log_t)qword_10032F1C0, OS_LOG_TYPE_ERROR))
    {
      BOOL v31 = v30;
      *(_DWORD *)buf = 138543618;
      id v48 = v14;
      __int16 v49 = 1024;
      LODWORD(v50) = [v12 status];
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "InsertResponse for fetchId %{public}@ server error: %d", buf, 0x12u);
    }
  }
LABEL_43:

  return v20;
}

- (id)createErrorFromSTHFailure:(id)a3 underlyingError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 errorDomain];
  id v8 = [v6 errorCode];

  id v9 = +[TransparencyError errorWithDomain:v7 code:v8 underlyingError:v5 description:0];

  return v9;
}

- (id)createChainOfErrorsFromSTHFailures:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 allObjects];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 verificationType] == (id)a4)
        {
          uint64_t v14 = [(KTContextVerifier *)self createErrorFromSTHFailure:v13 underlyingError:v10];

          id v10 = (void *)v14;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)failExpiredSTHsForType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1001EEAA0;
  unint64_t v25 = sub_1001EEAB0;
  id v26 = 0;
  id v7 = +[NSMutableArray array];
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumSTHProofDelay];
  id v9 = [(KTContextVerifier *)self dataStore];
  id v10 = [(KTContextVerifier *)self applicationID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001EEAB8;
  v16[3] = &unk_1002C8860;
  unint64_t v19 = a3;
  unint64_t v20 = a4;
  v16[4] = self;
  long long v18 = &v21;
  id v11 = v7;
  id v17 = v11;
  [v9 performForPendingSTHs:v10 olderThan:v8 type:a3 error:a4 block:v16];

  if (a4)
  {
    id v12 = (void *)v22[5];
    if (v12) {
      *a4 = v12;
    }
  }
  if ([v11 count]) {
    id v13 = v11;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v21, 8);

  return v14;
}

- (unint64_t)verifyLogConsistencyResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 forwards:(BOOL)a6 serverHint:(id)a7 error:(id *)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = [TransparencyConsistencyProofVerifier alloc];
  long long v18 = [(KTContextVerifier *)self applicationKeyStore];
  unint64_t v19 = [v18 appSthKeyStore];
  unint64_t v20 = [(TransparencyConsistencyProofVerifier *)v17 initWithTrustedKeyStore:v19];

  [v14 setVerifier:v20];
  uint64_t v21 = [(KTContextVerifier *)self dataStore];
  [v14 setDataStore:v21];

  id v22 = +[NSNumber numberWithLongLong:a4];
  [v14 setStartRevision:v22];

  [v14 setMetadataValue:v16 key:kTransparencyResponseMetadataKeyServerHint];
  [v14 setForwards:v10];
  uint64_t v23 = [(KTContextVerifier *)self context];
  id v24 = [v23 optInServer];
  [v14 setOptInServer:v24];

  unint64_t v25 = [(KTContextVerifier *)self context];
  id v26 = [v25 followUp];
  [v14 setFollowUp:v26];

  if ([v14 hasStartSlh])
  {
    uint64_t v27 = [v14 startSlh];

    if (v27)
    {
      id v28 = [v14 startSlh];
      unsigned int v29 = +[SignedLogHead signedTypeWithObject:v28];

      if (v15)
      {
        BOOL v30 = [v29 parsedLogHead];
        BOOL v31 = v30;
        if (v30)
        {
          id v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 revision]);
          [v15 addObject:v32];
        }
      }
      uint64_t v33 = [v14 startSlh];
      [(KTContextVerifier *)self checkHeadEpoch:v33];
    }
  }
  if ([v14 hasEndSlh])
  {
    long long v34 = [v14 endSlh];

    if (v34)
    {
      long long v35 = [v14 endSlh];
      uint32_t v36 = +[SignedLogHead signedTypeWithObject:v35];

      if (v15)
      {
        uint64_t v37 = [v36 parsedLogHead];
        id v38 = v37;
        if (v37)
        {
          id v39 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v37 revision]);
          [v15 addObject:v39];
        }
      }
      id v40 = [v14 endSlh];
      [(KTContextVerifier *)self checkHeadEpoch:v40];
    }
  }
  id v41 = [v14 verifyWithError:a8];

  return (unint64_t)v41;
}

- (unint64_t)verifyConsistencyProofResponse:(id)a3 startRevision:(int64_t)a4 receivedRevisions:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v53 = a5;
  id v11 = [v10 metadata];
  id v12 = [v11 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];

  LODWORD(v11) = [v10 application];
  unsigned int v13 = [v10 logType];
  if (v11)
  {
    if (v13 != 2) {
      goto LABEL_4;
    }
    id v14 = [(KTContextVerifier *)self applicationID];
    id v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 application]);
    id v16 = +[TransparencyApplication applicationIdentifierForValue:v15];
    unsigned __int8 v17 = [v14 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
LABEL_4:
      if (a6)
      {
        *a6 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-187 description:@"LogConsistencyResponse for wrong application or tree"];
      }
      if (qword_10032F238 != -1) {
        dispatch_once(&qword_10032F238, &stru_1002C88A0);
      }
      long long v18 = v53;
      unint64_t v19 = qword_10032F240;
      if (!os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      __int16 v54 = 0;
      unint64_t v20 = "LogConsistencyResponse for wrong application or tree";
      uint64_t v21 = (uint8_t *)&v54;
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
LABEL_39:
      unint64_t v39 = 0;
      goto LABEL_40;
    }
  }
  else if (v13 != 3 {
         || ([(KTContextVerifier *)self applicationID],
  }
             id v22 = objc_claimAutoreleasedReturnValue(),
             unsigned __int8 v23 = [v22 isEqualToString:kKTApplicationIdentifierTLT],
             v22,
             (v23 & 1) == 0))
  {
    if (a6)
    {
      *a6 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-186 description:@"LogConsistencyResponse omits application, but log type or verifier is not TLT"];
    }
    if (qword_10032F238 != -1) {
      dispatch_once(&qword_10032F238, &stru_1002C8880);
    }
    long long v18 = v53;
    unint64_t v19 = qword_10032F240;
    if (!os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_WORD *)buf = 0;
    unint64_t v20 = "LogConsistencyResponse omits application, but log type or verifier is not TLT";
    uint64_t v21 = buf;
    goto LABEL_38;
  }
  if (!objc_msgSend(v10, "responsesArray_Count"))
  {
    unint64_t v39 = 1;
    goto LABEL_42;
  }
  unint64_t v24 = 0;
  unint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
  long long v18 = v53;
  do
  {
    unint64_t v25 = [v10 responsesArray];
    id v26 = [v25 objectAtIndexedSubscript:v24];

    if ([v26 hasStartSlh])
    {
      uint64_t v27 = [v26 startSlh];
      if (v27 && ([v26 hasEndSlh] & 1) != 0)
      {
        id v28 = [v26 endSlh];

        if (v28)
        {
          unsigned int v29 = [v26 startSlh];
          BOOL v30 = +[SignedLogHead signedTypeWithObject:v29];

          uint64_t v50 = v30;
          BOOL v31 = [v30 parsedLogHead];
          id v32 = [v26 endSlh];
          uint64_t v33 = +[SignedLogHead signedTypeWithObject:v32];

          long long v34 = [v33 parsedLogHead];
          __int16 v49 = v31;
          if ([v31 revision] == (id)a4)
          {
            int v35 = 1;
            unint64_t v52 = v24;
          }
          else if (v52 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v37 = [v34 revision];
            int v35 = 0;
            uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
            if (v37 == (id)a4) {
              uint64_t v38 = v24 + 1;
            }
            unint64_t v52 = v38;
          }
          else
          {
            int v35 = 1;
          }

          long long v18 = v53;
          if (!v35) {
            goto LABEL_22;
          }
        }
        else
        {
          long long v18 = v53;
        }
      }
      else
      {
      }
    }
    unint64_t v36 = [(KTContextVerifier *)self verifyLogConsistencyResponse:v26 startRevision:a4 receivedRevisions:v18 forwards:1 serverHint:v12 error:a6];
    if (v36 != 1)
    {
      unint64_t v39 = v36;

      goto LABEL_40;
    }
LABEL_22:

    ++v24;
  }
  while (v24 < [v10 responsesArray_Count]);
  unint64_t v39 = 1;
  if (v52)
  {
    int64_t v51 = a4;
    if (v52 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v41 = v52 - 1;
      unint64_t v39 = 1;
      unint64_t v42 = 1;
      while (1)
      {
        char v43 = [v10 responsesArray];
        [v43 objectAtIndexedSubscript:v41];
        uint64_t v44 = v12;
        v46 = long long v45 = v18;

        id v47 = v45;
        id v12 = v44;
        unint64_t v48 = [(KTContextVerifier *)self verifyLogConsistencyResponse:v46 startRevision:v51 receivedRevisions:v47 forwards:0 serverHint:v44 error:a6];

        if (v48 != 1) {
          break;
        }
        ++v42;
        --v41;
        long long v18 = v53;
        if (v42 > v52) {
          goto LABEL_40;
        }
      }
      unint64_t v39 = v48;
LABEL_42:
      long long v18 = v53;
    }
  }
LABEL_40:

  return v39;
}

- (id)verifySTHs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v47 = +[NSMutableArray array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (!v8)
  {

    id v10 = 0;
    goto LABEL_38;
  }
  id v9 = v8;
  long long v45 = a4;
  id v10 = 0;
  uint64_t v48 = *(void *)v55;
  id obj = v7;
  do
  {
    id v11 = 0;
    do
    {
      if (*(void *)v55 != v48) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v11);
      uint64_t v14 = [v12 sth];
      if (v14
        && (v15 = (void *)v14, unsigned __int8 v16 = [v12 isMapHead], v15, (v16 & 1) == 0))
      {
        __int16 v49 = v13;
        long long v18 = SignedLogHead;
        unint64_t v19 = [v12 sth];
        id v53 = v10;
        unint64_t v20 = &v53;
        uint64_t v21 = &v53;
      }
      else
      {
        unsigned __int8 v17 = [v12 sth];

        if (!v17) {
          goto LABEL_18;
        }
        __int16 v49 = v13;
        long long v18 = SignedMapHead;
        unint64_t v19 = [v12 sth];
        id v52 = v10;
        unint64_t v20 = &v52;
        uint64_t v21 = &v52;
      }
      id v22 = [(__objc2_class *)v18 parseFromData:v19 error:v21];
      id v23 = *v20;

      if (!v22)
      {
        id v10 = v23;
        unsigned int v13 = v49;
LABEL_18:
        unint64_t v36 = [v12 sth];
        [v47 addObject:v36];

        id v22 = [(KTContextVerifier *)self dataStore];
        [v22 deleteObject:v12];
        goto LABEL_32;
      }
      unint64_t v24 = [(KTContextVerifier *)self applicationKeyStore];
      unint64_t v25 = [v24 appSthKeyStore];
      id v26 = [v25 signatureVerifier];
      [v22 setVerifier:v26];

      id v51 = v23;
      id v27 = [v22 verifyWithError:&v51];
      id v10 = v51;

      [v12 setUnsigned:"signatureVerified" value:v27];
      if ([v12 signatureVerified] == (id)1)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        [v12 receiptTime];
        double v30 = Current - v29;
        if ([v12 isMapHead]) {
          CFStringRef v31 = @"VerifySMHTime";
        }
        else {
          CFStringRef v31 = @"VerifySTHTime";
        }
        id v32 = [(KTContextVerifier *)self applicationID];
        uint64_t v33 = +[TransparencyAnalytics formatEventName:v31 application:v32];

        long long v34 = +[TransparencyAnalytics logger];
        int v35 = +[NSNumber numberWithDouble:v30];
        [v34 logMetric:v35 withName:v33];
      }
      else
      {
        if ([v12 signatureVerified]) {
          goto LABEL_22;
        }
        uint64_t v33 = [v12 sth];
        [v47 addObject:v33];
      }

LABEL_22:
      id v37 = [(KTContextVerifier *)self dataStore];
      id v50 = 0;
      unsigned __int8 v38 = [v37 persistAndRefaultObject:v12 error:&v50];
      id v39 = v50;

      if (v38) {
        goto LABEL_30;
      }
      if (qword_10032F238 != -1) {
        dispatch_once(&qword_10032F238, &stru_1002C88C0);
      }
      id v40 = qword_10032F240;
      if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v39;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "failed to save signature verified STHs: %@", buf, 0xCu);
      }
      if (!v39)
      {
LABEL_30:
        unsigned int v13 = v49;
      }
      else
      {
        unint64_t v41 = [(KTContextVerifier *)self dataStore];
        [v41 reportCoreDataPersistEventForLocation:@"verifySTHs" underlyingError:v39];

        unsigned int v13 = v49;
        if (!v10) {
          id v10 = v39;
        }
      }

LABEL_32:
      id v11 = (char *)v11 + 1;
    }
    while (v9 != v11);
    id v7 = obj;
    id v9 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  }
  while (v9);

  if (v45 && v10)
  {
    id v10 = v10;
    *long long v45 = v10;
  }
LABEL_38:
  if ([v47 count]) {
    unint64_t v42 = v47;
  }
  else {
    unint64_t v42 = 0;
  }
  id v43 = v42;

  return v43;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 perApplicationTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 1;
  id v12 = [v10 nodeBytes];
  unsigned int v13 = +[TransparencyGPBMessage parseFromData:v12 error:a6];

  if (!v13)
  {
    if (qword_10032F238 != -1) {
      dispatch_once(&qword_10032F238, &stru_1002C88E0);
    }
    uint64_t v14 = qword_10032F240;
    if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v15 = *a6;
      }
      else {
        id v15 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to parse PAT node from revision log inclusion proof: %@", (uint8_t *)&buf, 0xCu);
    }
    *((unsigned char *)v51 + 24) = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000;
  long long v58 = sub_1001EEAA0;
  id v59 = sub_1001EEAB0;
  id v60 = 0;
  if (([v13 hasObjectMapHead] & 1) == 0)
  {
    if (qword_10032F238 != -1) {
      dispatch_once(&qword_10032F238, &stru_1002C8900);
    }
    unsigned __int8 v16 = qword_10032F240;
    if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Per application tree node is missing map head", v46, 2u);
    }
    if (a6)
    {
      *a6 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-203 description:@"Per application tree node is missing map head"];
    }
    *((unsigned char *)v51 + 24) = 0;
  }
  *(void *)char v46 = 0;
  id v47 = v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  if ([v13 hasObjectMapHead])
  {
    unsigned __int8 v17 = [(KTContextVerifier *)self dataStore];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1001F0608;
    v36[3] = &unk_1002C8988;
    id v37 = v13;
    unsigned __int8 v38 = self;
    id v39 = v10;
    p_long long buf = &buf;
    unint64_t v44 = a3;
    id v40 = v11;
    unint64_t v42 = v46;
    long long v45 = a6;
    id v43 = &v50;
    [v17 performBlockAndWait:v36];
  }
  long long v18 = [(KTContextVerifier *)self applicationID];
  unint64_t v19 = +[TransparencyAnalytics formatEventName:@"VerifyPATInclusionProofEvent" application:v18];

  if (!+[TransparencyAnalytics hasInternalDiagnostics])goto LABEL_23; {
  unint64_t v20 = [v10 metadata];
  }
  uint64_t v21 = kTransparencyResponseMetadataKeyServerHint;
  id v22 = [v20 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
  BOOL v23 = v22 == 0;

  if (v23)
  {
LABEL_23:
    id v26 = 0;
  }
  else
  {
    uint64_t v54 = v21;
    unint64_t v24 = [v10 metadata];
    unint64_t v25 = [v24 objectForKeyedSubscript:v21];
    long long v55 = v25;
    id v26 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  }
  id v27 = +[TransparencyAnalytics logger];
  [v27 logResultForEvent:v19 hardFailure:a3 == 0 result:v11 withAttributes:v26];

  if (a3 == 1 && *((double *)v47 + 3) != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v29 = *((double *)v47 + 3);
    double v30 = +[TransparencyAnalytics logger];
    CFStringRef v31 = +[NSNumber numberWithDouble:Current - v29];
    id v32 = [(KTContextVerifier *)self applicationID];
    uint64_t v33 = +[TransparencyAnalytics formatEventName:@"PatInclusionProofTime" application:v32];
    [v30 logMetric:v31 withName:v33];
  }
  BOOL v34 = *((unsigned char *)v51 + 24) != 0;

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v50, 8);
  return v34;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 topLevelTreeLogEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  id v12 = [v10 nodeBytes];
  unsigned int v13 = +[TransparencyGPBMessage parseFromData:v12 error:a6];

  if (!v13)
  {
    if (qword_10032F238 != -1) {
      dispatch_once(&qword_10032F238, &stru_1002C89A8);
    }
    uint64_t v14 = qword_10032F240;
    if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v15 = *a6;
      }
      else {
        id v15 = 0;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to parse TLT node from revision log inclusion proof: %@", (uint8_t *)&buf, 0xCu);
    }
    *((unsigned char *)v45 + 24) = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = sub_1001EEAA0;
  char v53 = sub_1001EEAB0;
  id v54 = 0;
  if (([v13 hasPatHead] & 1) == 0)
  {
    if (qword_10032F238 != -1) {
      dispatch_once(&qword_10032F238, &stru_1002C89C8);
    }
    unsigned __int8 v16 = qword_10032F240;
    if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Top level tree node is missing PAT head", v40, 2u);
    }
    if (a6)
    {
      *a6 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-204 description:@"Top level tree node is missing PAT head"];
    }
    *((unsigned char *)v45 + 24) = 0;
  }
  *(void *)id v40 = 0;
  unint64_t v41 = v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  if ([v13 hasPatHead])
  {
    unsigned __int8 v17 = [(KTContextVerifier *)self dataStore];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001F1158;
    v32[3] = &unk_1002C8A70;
    id v33 = v13;
    BOOL v34 = self;
    unint64_t v38 = a3;
    id v39 = a6;
    p_long long buf = &buf;
    unint64_t v36 = v40;
    id v37 = &v44;
    [v17 performBlockAndWait:v32];
  }
  if (!+[TransparencyAnalytics hasInternalDiagnostics])goto LABEL_23; {
  long long v18 = [v10 metadata];
  }
  uint64_t v19 = kTransparencyResponseMetadataKeyServerHint;
  unint64_t v20 = [v18 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
  BOOL v21 = v20 == 0;

  if (v21)
  {
LABEL_23:
    unint64_t v24 = 0;
  }
  else
  {
    uint64_t v48 = v19;
    id v22 = [v10 metadata];
    BOOL v23 = [v22 objectForKeyedSubscript:v19];
    uint64_t v49 = v23;
    unint64_t v24 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  }
  unint64_t v25 = +[TransparencyAnalytics logger];
  [v25 logResultForEvent:@"ktTLTVerifyInclusionProofEvent" hardFailure:a3 == 0 result:v11 withAttributes:v24];

  if (a3 == 1 && *((double *)v41 + 3) != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v27 = *((double *)v41 + 3);
    id v28 = +[TransparencyAnalytics logger];
    double v29 = +[NSNumber numberWithDouble:Current - v27];
    [v28 logMetric:v29 withName:@"ktTLTInclusionProofTime"];
  }
  BOOL v30 = *((unsigned char *)v45 + 24) != 0;

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v44, 8);
  return v30;
}

- (BOOL)setInclusionVerifiedState:(unint64_t)a3 logEntry:(id)a4 failure:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ([v10 logType] == 2)
  {
    unsigned __int8 v12 = [(KTContextVerifier *)self setInclusionVerifiedState:a3 perApplicationTreeLogEntry:v10 failure:v11 error:a6];
  }
  else
  {
    if ([v10 logType] != 3)
    {
      BOOL v13 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v12 = [(KTContextVerifier *)self setInclusionVerifiedState:a3 topLevelTreeLogEntry:v10 failure:v11 error:a6];
  }
  BOOL v13 = v12;
LABEL_7:

  return v13;
}

- (unint64_t)verifyRevisionLogProofLogEntry:(id)a3 patSTH:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(KTContextVerifier *)self dataStore];
  [v8 setDataStore:v9];

  id v10 = [(KTContextVerifier *)self context];
  id v11 = [v10 optInServer];
  [v8 setOptInServer:v11];

  if ([v8 logType] == 2)
  {
    unsigned __int8 v12 = [TransparencyLogEntryVerifier alloc];
    BOOL v13 = [(KTContextVerifier *)self applicationKeyStore];
    uint64_t v14 = [v13 appSthKeyStore];
LABEL_5:
    id v15 = (void *)v14;
    unsigned __int8 v16 = [(TransparencyLogEntryVerifier *)v12 initWithTrustedKeyStore:v14];
    [v8 setVerifier:v16];

    id v29 = 0;
    id v17 = [v8 verifyWithError:&v29];
    id v18 = v29;
    if (v17 == (id)1)
    {
      unsigned int v19 = [v8 logType];
      if (a4 && v19 == 2)
      {
        unint64_t v20 = [v8 slh];
        *a4 = +[SignedLogHead signedTypeWithObject:v20];
      }
    }
    else
    {
      if (qword_10032F238 != -1) {
        dispatch_once(&qword_10032F238, &stru_1002C8AB0);
      }
      BOOL v21 = qword_10032F240;
      if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to verify revision proof log entry: %@", buf, 0xCu);
      }
      if (a5 && v18) {
        *a5 = v18;
      }
    }
    id v28 = 0;
    unsigned __int8 v22 = [(KTContextVerifier *)self setInclusionVerifiedState:v17 logEntry:v8 failure:v18 error:&v28];
    id v23 = v28;
    if ((v22 & 1) == 0)
    {
      if (qword_10032F238 != -1) {
        dispatch_once(&qword_10032F238, &stru_1002C8AD0);
      }
      unint64_t v24 = qword_10032F240;
      if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to set inclusion verification state for log entry: %@", buf, 0xCu);
      }
    }

    goto LABEL_22;
  }
  if ([v8 logType] == 3)
  {
    unsigned __int8 v12 = [TransparencyLogEntryVerifier alloc];
    BOOL v13 = [(KTContextVerifier *)self applicationKeyStore];
    uint64_t v14 = [v13 tltKeyStore];
    goto LABEL_5;
  }
  if (qword_10032F238 != -1) {
    dispatch_once(&qword_10032F238, &stru_1002C8A90);
  }
  id v26 = (void *)qword_10032F240;
  if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
  {
    double v27 = v26;
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v31) = [v8 logType];
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unknown log type in log entry: %d", buf, 8u);
  }
  if (a5)
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -205, @"Unknown log type in log entry: %d", [v8 logType]);
    id v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }
LABEL_22:

  return (unint64_t)v17;
}

- (unint64_t)verifyRevisionLogTopLevelProof:(id)a3 patSTH:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(KTContextVerifier *)self dataStore];
  [v8 setDataStore:v10];

  id v11 = [(KTContextVerifier *)self context];
  unsigned __int8 v12 = [v11 optInServer];
  [v8 setOptInServer:v12];

  BOOL v13 = [TransparencyLogEntryVerifier alloc];
  uint64_t v14 = [(KTContextVerifier *)self applicationKeyStore];
  id v15 = [v14 tltKeyStore];
  unsigned __int8 v16 = [(TransparencyLogEntryVerifier *)v13 initWithTrustedKeyStore:v15];
  [v8 setVerifier:v16];

  if (v9)
  {
    id v26 = 0;
    id v17 = [v8 verifyTLTEntryForPerApplicationLogHead:v9 error:&v26];
    id v18 = v26;
  }
  else
  {
    id v25 = 0;
    id v17 = [v8 verifyWithError:&v25];
    id v18 = v25;
    id v24 = 0;
    unsigned __int8 v19 = [(KTContextVerifier *)self setInclusionVerifiedState:v17 logEntry:v8 failure:v18 error:&v24];
    id v20 = v24;
    if ((v19 & 1) == 0)
    {
      if (qword_10032F238 != -1) {
        dispatch_once(&qword_10032F238, &stru_1002C8AF0);
      }
      BOOL v21 = qword_10032F240;
      if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to set inclusion verified state: %@", buf, 0xCu);
      }
    }
  }
  if (v17 != (id)1)
  {
    if (qword_10032F238 != -1) {
      dispatch_once(&qword_10032F238, &stru_1002C8B10);
    }
    unsigned __int8 v22 = qword_10032F240;
    if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to verify revision proof tlt entry: %@", buf, 0xCu);
    }
    if (a5 && v18) {
      *a5 = v18;
    }
  }

  return (unint64_t)v17;
}

- (BOOL)verifyRevisionLogInclusionProofResponse:(id)a3 receivedRevisions:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [v6 logEntryArray];
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  id v43 = v6;
  uint64_t v44 = v7;
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_24;
  }
  id v9 = v8;
  id v10 = 0;
  uint64_t v46 = *(void *)v55;
  uint64_t v11 = kTransparencyResponseMetadataKeyServerHint;
  while (2)
  {
    unsigned __int8 v12 = 0;
    BOOL v13 = v10;
    do
    {
      if (*(void *)v55 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v12);
      if (objc_msgSend(v14, "hasSlh", v43))
      {
        id v15 = [v14 slh];

        if (v15)
        {
          unsigned __int8 v16 = [v14 slh];
          [(KTContextVerifier *)self checkHeadEpoch:v16];
        }
      }
      id v17 = [v6 metadata];
      id v18 = [v17 objectForKeyedSubscript:v11];
      [v14 setMetadataValue:v18 key:v11];

      if (v7)
      {
        unsigned __int8 v19 = [v14 nodeBytes];
        id v20 = [v19 length];

        if (v20)
        {
          if ([v14 logType] == 3)
          {
            BOOL v21 = [v14 nodeBytes];
            unsigned __int8 v22 = +[TransparencyGPBMessage parseFromData:v21 error:0];

            id v23 = [v22 patHead];
            id v24 = [v23 object];
            id v25 = +[TransparencyGPBMessage parseFromData:v24 error:0];

            id v7 = v44;
          }
          else
          {
            if ([v14 logType] != 2) {
              goto LABEL_18;
            }
            id v26 = [v14 nodeBytes];
            unsigned __int8 v22 = +[TransparencyGPBMessage parseFromData:v26 error:0];

            id v23 = [v22 objectMapHead];
            double v27 = [v23 object];
            id v7 = v44;
            id v25 = +[TransparencyGPBMessage parseFromData:v27 error:0];
          }
          if (v25)
          {
            id v28 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v25 revision]);
            [v7 addObject:v28];
          }
          id v6 = v43;
        }
      }
LABEL_18:
      id v53 = v13;
      unint64_t v29 = [(KTContextVerifier *)self verifyRevisionLogProofLogEntry:v14 patSTH:&v53 error:a5];
      id v10 = v53;

      if (!v29)
      {
        BOOL v30 = 0;
        goto LABEL_33;
      }
      unsigned __int8 v12 = (char *)v12 + 1;
      BOOL v13 = v10;
    }
    while (v9 != v12);
    id v9 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_24:

  if ([v6 hasTopLevelTreeEntry]
    && ([v6 topLevelTreeEntry], id v31 = objc_claimAutoreleasedReturnValue(), v31, v31))
  {
    [v6 topLevelTreeEntry];
    id v33 = v32 = v6;
    if (![v33 hasSlh]) {
      goto LABEL_29;
    }
    BOOL v34 = [v32 topLevelTreeEntry];
    int v35 = [v34 slh];

    if (v35)
    {
      id v33 = [v32 topLevelTreeEntry];
      unint64_t v36 = [v33 slh];
      [(KTContextVerifier *)self checkHeadEpoch:v36];

LABEL_29:
      id v32 = v43;
    }
    id v37 = [v32 topLevelTreeEntry:v43];
    unint64_t v38 = [v32 metadata];
    uint64_t v39 = kTransparencyResponseMetadataKeyServerHint;
    id v40 = [v38 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
    [v37 setMetadataValue:v40 key:v39];

    id obj = [v32 topLevelTreeEntry];
    BOOL v30 = -[KTContextVerifier verifyRevisionLogTopLevelProof:patSTH:error:](self, "verifyRevisionLogTopLevelProof:patSTH:error:") != 0;
    id v6 = v32;
LABEL_33:
  }
  else
  {
    if (v10)
    {
      unint64_t v41 = [(KTContextVerifier *)self dataStore];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1001F2618;
      v49[3] = &unk_1002B9D28;
      id v50 = v10;
      uint64_t v51 = self;
      uint64_t v52 = a5;
      id v10 = v10;
      [v41 performBlockAndWait:v49];

      BOOL v30 = 1;
      id obj = v50;
      goto LABEL_33;
    }
    BOOL v30 = 1;
  }

  return v30;
}

- (void)checkHeadEpoch:(id)a3
{
  id v4 = +[SignedLogHead signedTypeWithObject:a3];
  id v5 = [v4 parsedLogHead];
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 logType];
    id v8 = [v6 logBeginningMs];
    id v9 = [(KTContextVerifier *)self applicationKeyStore];
    id v10 = v9;
    if (v7 == 3)
    {
      id v11 = [v9 tltLogBeginningMs];

      if (v8 > v11)
      {
        if (qword_10032F238 != -1) {
          dispatch_once(&qword_10032F238, &stru_1002C8B50);
        }
        unsigned __int8 v12 = qword_10032F240;
        if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TLT head has logBeginningMs after key store epoch", buf, 2u);
        }
        BOOL v13 = [(KTContextVerifier *)self applicationKeyStore];
        uint64_t v14 = [v13 vrfKey];
        [v14 setNeedsRefresh:1];

        id v15 = [(KTContextVerifier *)self applicationKeyStore];
        unsigned __int8 v16 = [v15 appSmtKeyStore];
        id v17 = [v16 signatureVerifier];
        [v17 setNeedsRefresh:1];

        id v18 = [(KTContextVerifier *)self applicationKeyStore];
        unsigned __int8 v19 = [v18 appSthKeyStore];
        id v20 = [v19 signatureVerifier];
        [v20 setNeedsRefresh:1];

        BOOL v21 = [(KTContextVerifier *)self applicationKeyStore];
        unsigned __int8 v22 = [v21 tltKeyStore];
LABEL_15:
        BOOL v30 = v22;
        id v31 = [v22 signatureVerifier];
        [v31 setNeedsRefresh:1];
      }
    }
    else
    {
      id v23 = [v9 patLogBeginningMs];

      if (v8 > v23)
      {
        if (qword_10032F238 != -1) {
          dispatch_once(&qword_10032F238, &stru_1002C8B70);
        }
        id v24 = qword_10032F240;
        if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Application head has logBeginningMs after key store epoch", v32, 2u);
        }
        id v25 = [(KTContextVerifier *)self applicationKeyStore];
        id v26 = [v25 vrfKey];
        [v26 setNeedsRefresh:1];

        double v27 = [(KTContextVerifier *)self applicationKeyStore];
        id v28 = [v27 appSmtKeyStore];
        unint64_t v29 = [v28 signatureVerifier];
        [v29 setNeedsRefresh:1];

        BOOL v21 = [(KTContextVerifier *)self applicationKeyStore];
        unsigned __int8 v22 = [v21 appSthKeyStore];
        goto LABEL_15;
      }
    }
  }
}

- (void)processSTHsFromGossipPeers:(id)a3 verifier:(id)a4 error:(id *)a5
{
  id obj = a3;
  id v37 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v38 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v38)
  {
    BOOL v34 = a5;
    id v7 = 0;
    uint64_t v8 = *(void *)v42;
    p_vtable = KTStateTransitionPathStep.vtable;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v10);
        id v40 = 0;
        unsigned __int8 v12 = [p_vtable + 207 parseFromData:v11 error:&v40];
        id v13 = v40;
        uint64_t v14 = v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15)
        {
          BOOL v21 = [(KTContextVerifier *)self applicationKeyStore];
          unsigned __int8 v22 = [v21 appSthKeyStore];
          id v23 = [v22 signatureVerifier];
          [v12 setVerifier:v23];

          id v24 = [(KTContextVerifier *)self dataStore];
          [v12 setDataStore:v24];

          [v12 setGossip:1];
          [v12 setGossip:1];
          if (v37) {
            [v12 setVerifier:v37];
          }
          id v39 = 0;
          [v12 verifyWithError:&v39];
          id v25 = v39;
          if (v25)
          {
            if (qword_10032F238 != -1) {
              dispatch_once(&qword_10032F238, &stru_1002C8BB0);
            }
            id v26 = qword_10032F240;
            if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v46 = v25;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to verify gossiped sth: %@", buf, 0xCu);
            }
            if (v7)
            {
              double v27 = [v25 domain];
              id v28 = p_vtable;
              uint64_t v29 = v8;
              id v30 = [v25 code];
              id v31 = [0 description];
              id v32 = v30;
              uint64_t v8 = v29;
              p_vtable = v28;
              uint64_t v33 = +[TransparencyError errorWithDomain:v27, v32, v7, @"%@", v31 code underlyingError description];

              id v7 = (id)v33;
            }
            else
            {
              id v7 = v25;
            }
          }
        }
        else
        {
          if (qword_10032F238 != -1) {
            dispatch_once(&qword_10032F238, &stru_1002C8B90);
          }
          unsigned __int8 v16 = qword_10032F240;
          if (os_log_type_enabled((os_log_t)qword_10032F240, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v46 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to parse gossiped slh: %@", buf, 0xCu);
          }
          if (v7)
          {
            id v17 = [v14 domain];
            id v18 = [v14 code];
            unsigned __int8 v19 = [v14 description];
            uint64_t v20 = +[TransparencyError errorWithDomain:v17, v18, v7, @"%@", v19 code underlyingError description];

            id v7 = (id)v20;
          }
          else
          {
            id v7 = v14;
          }
        }

        id v10 = (char *)v10 + 1;
      }
      while (v38 != v10);
      id v38 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v38);
    if (v34 && v7)
    {
      id v7 = v7;
      id *v34 = v7;
    }
  }
  else
  {
    id v7 = 0;
  }
}

@end