@interface KTContext
+ (BOOL)checkNetworkError:(id)a3;
+ (BOOL)hasAccountMismatch:(id)a3;
+ (BOOL)hasReachedEligibilityThreshold:(id)a3;
+ (BOOL)isCurrentlyEligible:(id)a3;
+ (id)analyticsSelfFlagNames;
+ (id)analyticsSuccessNames;
+ (id)chunkArray:(id)a3 chunkSize:(unint64_t)a4;
+ selfStatusFlagMetricsKey:(id)a3 name:(id)a4;
+ (id)successMetricsKey:(id)a3 validationName:(id)a4;
+ (id)successMetricsKey:(unint64_t)a3 forApplicationID:(id)a4;
+ (id)validateEventName:(unint64_t)a3 application:(id)a4;
+ (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 application:(id)a5 staticKeyStore:(id)a6 error:(id *)a7;
+ (void)checkAndLogHardErrorIfNecessary:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 error:(id)a6 applicationID:(id)a7;
+ (void)metricsForResult:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 applicationID:(id)a6;
+ (void)updateEligibilityThreshold:(id)a3;
- (BOOL)contextShouldGossip;
- (BOOL)drainContext;
- (BOOL)injectSelfVerificationFailure:(id)a3 failing:(id)a4 error:(id *)a5;
- (BOOL)peerStaticKeyFallback:(id)a3 accountKey:(id)a4 transparentData:(id *)a5;
- (BOOL)ready:(id *)a3;
- (BOOL)shouldShowCFU:(id)a3;
- (BOOL)unsupported:(id *)a3;
- (BOOL)validatePendingSMTs:(id)a3 singleQuery:(id)a4 error:(id *)a5;
- (BOOL)verifyInclusionProofDownload:(id)a3 error:(id *)a4;
- (BOOL)verifyInclusionProofDownloadRecord:(id)a3 error:(id *)a4;
- (KTAccountKeyServer)accountKeyServer;
- (KTApplicationPublicKeyStore)applicationKeyStore;
- (KTCloudRecordsProtocol)cloudRecords;
- (KTCondition)storedEligibilityResult;
- (KTContext)initWithApplicationID:(id)a3 dependencies:(id)a4;
- (KTContext)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 smDataStore:(id)a5 staticKeyStore:(id)a6 logClient:(id)a7 applicationID:(id)a8 contextStore:(id)a9 accountKeyServer:(id)a10 stateMachine:(id)a11 kvs:(id)a12 cloudRecords:(id)a13 followup:(id)a14 settings:(id)a15 analyticsLogger:(id)a16 tapToRadar:(id)a17 eligibilityStatusReporter:(id)a18;
- (KTContextStore)contextStore;
- (KTContextVerifier)verifier;
- (KTLogClientProtocol)logClient;
- (KTOptInManagerServer)optInServer;
- (KTSMDataStore)smDataStore;
- (KTSMManager)stateMachine;
- (KTTapToRadarProtocol)tapToRadar;
- (NSString)applicationID;
- (OS_dispatch_queue)eligibilityQueue;
- (TransparencyAnalytics)analyticsLogger;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (TransparencyStaticKeyStore)staticKeyStore;
- (TransparencyTranscript)transcript;
- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter;
- (id)analyticsForResponse:(id)a3 type:(unint64_t)a4 uri:(id)a5 result:(unint64_t)a6 ktCapable:(BOOL)a7;
- (id)analyticsForType:(unint64_t)a3 uri:(id)a4 accountKey:(id)a5 serverLoggableDatas:(id)a6 syncedLoggableDatas:(id)a7 transparentData:(id)a8 selfVerificationInfo:(id)a9 responseTime:(id)a10 result:(unint64_t)a11 failure:(id)a12 responseMetadata:(id)a13;
- (id)copyState;
- (id)createQueryRequestForKTRequest:(id)a3 error:(id *)a4;
- (id)metadataForInsertResponse:(id)a3;
- (id)parseQueryRequestFromKTRequest:(id)a3 error:(id *)a4;
- (id)parseQueryResponseFromKTRequest:(id)a3 error:(id *)a4;
- (id)parseSTHData:(id)a3 error:(id *)a4;
- (id)retrieveTLTSTH:(id *)a3;
- (id)serverLoggableDatasDiagnostics:(id)a3 selfPushToken:(id)a4 humbled:(BOOL *)a5;
- (unint64_t)deserializeServerLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5;
- (unint64_t)deserializeSyncedLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5;
- (unint64_t)fetchAndValidateEnrollKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7;
- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8;
- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 validateType:(unint64_t)a7 ktCapable:(BOOL)a8 error:(id *)a9 transparentDataHandler:(id)a10;
- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 error:(id *)a7;
- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 error:(id *)a6;
- (unint64_t)validateAndReportEnroll:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10;
- (unint64_t)validateAndReportPeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10;
- (unint64_t)validateAndReportPeerOrEnroll:(id)a3 type:(unint64_t)a4 transparentData:(id)a5 accountKey:(id)a6 loggableDatas:(id)a7 initialResult:(unint64_t)a8 idsResponseTime:(id)a9 responseMetadata:(id)a10 error:(id *)a11;
- (unint64_t)validateAndReportSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 optInCheck:(BOOL)a9 cloudDevices:(id)a10 pcsAccountKey:(id)a11 kvsOptInHistory:(id)a12 isReplay:(BOOL)a13 initialResult:(unint64_t)a14 idsResponseTime:(id)a15 responseMetadata:(id)a16 error:(id *)a17;
- (unint64_t)validateEnrollKTRequest:(id)a3 insertResponse:(id)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 cloudOptIn:(id)a7 error:(id *)a8;
- (unint64_t)validateEnrollmentRequestId:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7;
- (unint64_t)validatePeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 selfVerificationInfo:(id)a7 enforceStaticKey:(BOOL)a8 idsResponseTime:(id)a9 responseTime:(id)a10 error:(id *)a11;
- (unint64_t)validatePeerOrEnrollKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 transparentData:(id *)a6 loggableDatas:(id *)a7 error:(id *)a8;
- (unint64_t)validateSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 idsResponseTime:(id)a9 responseTime:(id)a10 optInCheck:(BOOL)a11 cloudDevices:(id)a12 pcsAccountKey:(id)a13 kvsOptInHistory:(id)a14 isReplay:(BOOL)a15 error:(id *)a16;
- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 pcsAccountKey:(id)a9 kvsOptInHistory:(id)a10 isReplay:(BOOL)a11 transparentData:(id *)a12 loggableDatas:(id *)a13 error:(id *)a14;
- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 transparentData:(id *)a9 loggableDatas:(id *)a10 error:(id *)a11;
- (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 error:(id *)a5;
- (unint64_t)verifyConsistencyProofDownload:(id)a3 error:(id *)a4;
- (unint64_t)verifyConsistencyProofDownloadRecord:(id)a3 error:(id *)a4;
- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 error:(id *)a6;
- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 replay:(BOOL)a6 error:(id *)a7;
- (void)analyticsForDecodeFailure:(id)a3 error:(id)a4;
- (void)analyticsForParseFailure:(id)a3;
- (void)analyticsForPredateLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5;
- (void)analyticsForTooNewLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5;
- (void)analyticsForUnsupportedProtocol:(int)a3 expected:(int)a4 sth:(id)a5;
- (void)clearSelfTicketState:(id)a3 responseTime:(id)a4;
- (void)clearState:(id)a3;
- (void)dealloc;
- (void)fetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchQueryForKTRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchQueryForKTRequest:(id)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7;
- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6;
- (void)logFinishFailureEvent:(id)a3 error:(id)a4;
- (void)logFinishSuccessEvent:(id)a3;
- (void)logStartEvent:(id)a3;
- (void)optInStateForUri:(id)a3 completionHandler:(id)a4;
- (void)processSTHsFromPeers:(id)a3 verifier:(id)a4 completionHandler:(id)a5;
- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7;
- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6;
- (void)recordEnrollOptInRecord:(id)a3 accountKey:(id)a4 transparentData:(id)a5 cloudOptIn:(id)a6;
- (void)replaySelfValidate:(id)a3 pcsAccountKey:(id)a4 queryRequest:(id)a5 queryResponse:(id)a6 responseTime:(id)a7 completionHandler:(id)a8;
- (void)reportValidationTime:(unint64_t)a3 initialResult:(unint64_t)a4 result:(unint64_t)a5 idsResponseTime:(id)a6;
- (void)selfValidationURIStatus:(id)a3 transparentData:(id)a4 selfDeviceID:(id)a5 logger:(id)a6;
- (void)setAccountKeyServer:(id)a3;
- (void)setAnalyticsLogger:(id)a3;
- (void)setApplicationID:(id)a3;
- (void)setApplicationKeyStore:(id)a3;
- (void)setCloudRecords:(id)a3;
- (void)setContextStore:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setEligibilityQueue:(id)a3;
- (void)setEligibilityStatusReporter:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setLogClient:(id)a3;
- (void)setOptInServer:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSmDataStore:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setStoredEligibilityResult:(id)a3;
- (void)setTapToRadar:(id)a3;
- (void)setTranscript:(id)a3;
- (void)setVerifier:(id)a3;
- (void)storeEligibilityMetric:(unint64_t)a3 result:(unint64_t)a4 error:(id)a5;
- (void)validatePeer:(id)a3 verificationInfo:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6;
- (void)validatePeerIDSKTVerification:(id)a3 batchQuery:(id)a4 completionBlock:(id)a5;
- (void)validatePeerIDSKTVerification:(id)a3 serverRPC:(id)a4 completionBlock:(id)a5;
- (void)validatePeerIDSKTVerification:(id)a3 singleQuery:(id)a4 completionBlock:(id)a5;
- (void)validatePeerRequestId:(id)a3 revalidate:(BOOL)a4 fetchNow:(BOOL)a5 completionHandler:(id)a6;
- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5;
- (void)validatePendingPeersForBatchQuery:(id)a3;
- (void)validatePendingPeersForRpcId:(id)a3;
- (void)validatePendingPeersForSingleQuery:(id)a3;
- (void)validatePendingSMTsForBatchQuery:(id)a3;
- (void)validatePendingSMTsForRpcId:(id)a3;
- (void)validatePendingSMTsForSingleQuery:(id)a3;
- (void)writeLoggableDatas:(id)a3 request:(id)a4;
- (void)writeResult:(id)a3 verification:(id)a4;
@end

@implementation KTContext

- (BOOL)validatePendingSMTs:(id)a3 singleQuery:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v58[0] = 0;
  v46 = [v7 getQueryRequest:v58];
  id v8 = v58[0];
  id v57 = v8;
  v9 = [v7 getQueryResponse:&v57];
  id v10 = v57;

  v11 = [v9 metadata];
  uint64_t v12 = kTransparencyResponseMetadataKeyServerHint;
  uint64_t v13 = [v11 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];

  v14 = [v9 metadata];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"APS"];

  v16 = +[NSMutableDictionary dictionary];
  v17 = v16;
  v43 = (void *)v15;
  v44 = (void *)v13;
  if (v13 | v15)
  {
    if (v13) {
      [v16 setObject:v13 forKey:v12];
    }
    if (v15) {
      [v17 setObject:&__kCFBooleanTrue forKey:@"APS"];
    }
  }
  v18 = [v7 backgroundOpId];
  v19 = [v18 UUIDString];
  [v17 setObject:v19 forKeyedSubscript:@"opUUID"];

  if (v46 && v9)
  {
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    v20 = [(KTContext *)self verifier];
    v21 = [v7 responseTime];
    v22 = [v7 rpcId];
    id v52 = v10;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000052C8;
    v47[3] = &unk_1002B6AC0;
    v47[4] = self;
    id v41 = v6;
    id v48 = v41;
    id v23 = v9;
    id v49 = v23;
    id v24 = v17;
    id v50 = v24;
    v51 = &v53;
    id v40 = [v20 handleQueryResponse:v23 queryRequest:v46 receiptDate:v21 fetchId:v22 error:&v52 rawDataHandler:v47];
    id v42 = v6;
    id v25 = v52;

    v26 = v44;
    if (v25)
    {
      v27 = [v25 domain];
      if ([v27 isEqual:kTransparencyErrorServer]) {
        BOOL v28 = [v25 code] == (id)7;
      }
      else {
        BOOL v28 = 0;
      }

      v34 = [(KTContext *)self verifier];
      v35 = [v23 data];
      unsigned __int8 v36 = [v34 failSMTsIfOverMMD:v41 skipOptInOut:v28 proof:v35 underlyingError:v25 errorCode:-306 analyticsData:v24];

      if ((v36 & 1) == 0) {
        *((unsigned char *)v54 + 24) = 1;
      }
      if (!v40)
      {
        v37 = [(KTContext *)self dataStore];
        v38 = [v7 rpcId];
        [v37 failRpcId:v38 failure:v25 error:0];
      }
    }
    LOBYTE(v32) = *((unsigned char *)v54 + 24) != 0;

    _Block_object_dispose(&v53, 8);
    v33 = v42;
  }
  else
  {
    BOOL v29 = [v9 status] == 7;
    v30 = [(KTContext *)self verifier];
    v31 = [v9 data];
    unsigned int v32 = [v30 failSMTsIfOverMMD:v6 skipOptInOut:v29 proof:v31 underlyingError:v10 errorCode:-306 analyticsData:v17] ^ 1;

    v33 = v6;
    id v25 = v10;
    v26 = (void *)v13;
  }

  return v32;
}

- (void)validatePendingSMTsForSingleQuery:(id)a3
{
  id v4 = a3;
  v5 = [(KTContext *)self dataStore];
  id v6 = [(KTContext *)self applicationID];
  id v7 = [v4 uri];
  id v21 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005768;
  v19[3] = &unk_1002B6B08;
  v19[4] = self;
  id v8 = v4;
  id v20 = v8;
  unsigned __int8 v9 = [v5 performForPendingSMTs:v6 uri:v7 error:&v21 batchSize:20 block:v19];
  id v10 = v21;

  if ((v9 & 1) != 0 || !v10)
  {
    if ((v9 & 1) == 0)
    {
      if (qword_100326630 != -1) {
        dispatch_once(&qword_100326630, &stru_1002B6B48);
      }
      v18 = (void *)qword_100326638;
      if (os_log_type_enabled((os_log_t)qword_100326638, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = v18;
        uint64_t v13 = [v8 rpcId];
        *(_DWORD *)buf = 138543362;
        id v23 = v13;
        v14 = "no pending SMTs found for rpcId %{public}@";
        uint64_t v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
        uint32_t v17 = 12;
        goto LABEL_12;
      }
    }
  }
  else
  {
    if (qword_100326630 != -1) {
      dispatch_once(&qword_100326630, &stru_1002B6B28);
    }
    v11 = (void *)qword_100326638;
    if (os_log_type_enabled((os_log_t)qword_100326638, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [v8 rpcId];
      *(_DWORD *)buf = 138543618;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v10;
      v14 = "no pending SMTs found for rpcId %{public}@: %@";
      uint64_t v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
    }
  }
}

- (void)validatePendingSMTsForBatchQuery:(id)a3
{
  id v3 = a3;
  if (qword_100326630 != -1) {
    dispatch_once(&qword_100326630, &stru_1002B6B68);
  }
  id v4 = qword_100326638;
  if (os_log_type_enabled((os_log_t)qword_100326638, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "validatePendingSMTsForBatchQuery: batch query is unimplemented", v5, 2u);
  }
}

- (void)validatePendingSMTsForRpcId:(id)a3
{
  id v4 = a3;
  v5 = [(KTContext *)self dataStore];
  v9[4] = self;
  id v10 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005BAC;
  v9[3] = &unk_1002B6BB0;
  unsigned __int8 v6 = [v5 performAndWaitForRpcId:v4 error:&v10 block:v9];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    if (qword_100326630 != -1) {
      dispatch_once(&qword_100326630, &stru_1002B6BD0);
    }
    id v8 = qword_100326638;
    if (os_log_type_enabled((os_log_t)qword_100326638, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to find rpc for rpcId %{public}@: %@", buf, 0x16u);
    }
  }
}

+ (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 application:(id)a5 staticKeyStore:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = +[TransparencyApplication stripApplicationPrefixForIdentifier:a5 uri:v11];
  id v40 = 0;
  uint64_t v15 = [v13 findStaticKeyByHandle:v14 error:&v40];

  id v16 = v40;
  if (v15
    || ([0 publicKeyID], uint32_t v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    if (v12)
    {
      id v39 = v16;
      v18 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v12 error:&v39];
      id v19 = v39;

      if (v18)
      {
        id v20 = [v15 publicKeyID];
        unsigned __int8 v21 = [v18 isEqual:v20];

        if (v21)
        {
          v22 = [v15 handles];
          id v23 = [v22 objectForKeyedSubscript:v14];

          if ([v23 errorCode])
          {
            if (a7)
            {
              +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, (int)[v23 errorCode], @"Synthetic mock error");
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            unint64_t v24 = 2;
          }
          else
          {
            unint64_t v24 = 0;
          }
        }
        else
        {
          v38 = a7;
          v41[0] = @"peerID";
          BOOL v29 = [v18 publicAccountIdentity];
          v41[1] = @"entry";
          v42[0] = v29;
          v30 = [v15 publicKeyID];
          v31 = [v30 publicAccountIdentity];
          v42[1] = v31;
          unsigned int v32 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

          v33 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-304 underlyingError:0 userinfo:v32 description:@"Static key mismatch"];

          if (qword_100326650 != -1) {
            dispatch_once(&qword_100326650, &stru_1002B6F30);
          }
          v34 = qword_100326658;
          if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v44 = (uint64_t)v11;
            __int16 v45 = 2112;
            id v46 = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to validateStaticKeyForPeer %@: %@", buf, 0x16u);
          }
          if (v38) {
            id *v38 = v33;
          }

          unint64_t v24 = 2;
          id v19 = v33;
        }
      }
      else
      {
        id v25 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-305 underlyingError:0 userinfo:0 description:@"failed to decode"];

        if (qword_100326650 != -1) {
          dispatch_once(&qword_100326650, &stru_1002B6F10);
        }
        v26 = (void *)qword_100326658;
        if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
        {
          v27 = v26;
          BOOL v28 = [v12 kt_hexString];
          *(_DWORD *)buf = 138412802;
          uint64_t v44 = (uint64_t)v11;
          __int16 v45 = 2112;
          id v46 = v28;
          __int16 v47 = 2112;
          id v48 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to parse account key %@ %@: %@", buf, 0x20u);
        }
        if (a7)
        {
          id v19 = v25;
          *a7 = v19;
          unint64_t v24 = 5;
        }
        else
        {
          unint64_t v24 = 5;
          id v19 = v25;
        }
      }

      id v16 = v19;
    }
    else
    {
      if (a7)
      {
        *a7 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-305 description:@"Static key missing"];
      }
      unint64_t v24 = 5;
    }
  }
  else
  {
    v35 = [0 publicKeyID];

    if (!v35)
    {
      if (qword_100326650 != -1) {
        dispatch_once(&qword_100326650, &stru_1002B6EF0);
      }
      unsigned __int8 v36 = qword_100326658;
      if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558274;
        uint64_t v44 = 1752392040;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Static key entry for %{mask.hash}@ missing publicKeyID", buf, 0x16u);
      }
    }
    unint64_t v24 = 1;
  }

  return v24;
}

- (unint64_t)validateStaticKeyForPeer:(id)a3 accountKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_class();
  id v11 = [(KTContext *)self applicationID];
  id v12 = [(KTContext *)self staticKeyStore];
  id v13 = [v10 validateStaticKeyForPeer:v9 accountKey:v8 application:v11 staticKeyStore:v12 error:a5];

  return (unint64_t)v13;
}

- (unint64_t)validatePeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 selfVerificationInfo:(id)a7 enforceStaticKey:(BOOL)a8 idsResponseTime:(id)a9 responseTime:(id)a10 error:(id *)a11
{
  id v25 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  [a9 timeIntervalSinceReferenceDate];
  id v27 = 0;
  unsigned __int8 v17 = [v14 validateAndUpdateWithServerLoggableDatas:v16 accountKey:v15 idsResponseTime:&v27 error:&v28];
  id v18 = v27;
  if (v17)
  {
    unint64_t v19 = 1;
  }
  else
  {
    if (qword_100326650 != -1) {
      dispatch_once(&qword_100326650, &stru_1002B6F50);
    }
    id v20 = qword_100326658;
    if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v29 = 1752392040;
      __int16 v30 = 2112;
      id v31 = v25;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ transparency: %@", buf, 0x20u);
    }
    unint64_t v19 = 0;
    if (a11 && v18)
    {
      unint64_t v19 = 0;
      *a11 = v18;
    }
  }
  id v26 = v18;
  unsigned __int8 v21 = +[KTContextVerifier verifyLoggableDataSignatures:v16 accountKey:v15 error:&v26];
  id v22 = v26;

  if ((v21 & 1) == 0)
  {
    if (qword_100326650 != -1) {
      dispatch_once(&qword_100326650, &stru_1002B6F70);
    }
    id v23 = qword_100326658;
    if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v29 = 1752392040;
      __int16 v30 = 2112;
      id v31 = v25;
      __int16 v32 = 2112;
      id v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ signatures: %@", buf, 0x20u);
    }
    if (a11 && v22) {
      *a11 = v22;
    }
    [v14 setStaticKeyStatus:4];
    unint64_t v19 = 0;
  }

  return v19;
}

- (BOOL)injectSelfVerificationFailure:(id)a3 failing:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v15 = [v14 deviceID];
        unsigned int v16 = [v8 containsObject:v15];

        if (v16)
        {
          unsigned __int8 v17 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-397 errorLevel:4 underlyingError:0 userinfo:0 description:@"Testing force self error"];
          [v14 setResult:0];
          [v14 setFailure:v17];
          if (a5 && v17) {
            *a5 = v17;
          }

          char v11 = 1;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    char v11 = 0;
  }

  return v11 & 1;
}

- (unint64_t)validateSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 idsResponseTime:(id)a9 responseTime:(id)a10 optInCheck:(BOOL)a11 cloudDevices:(id)a12 pcsAccountKey:(id)a13 kvsOptInHistory:(id)a14 isReplay:(BOOL)a15 error:(id *)a16
{
  id v82 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a10;
  id v84 = a12;
  id v26 = a13;
  id v79 = a14;
  id v91 = 0;
  id v73 = v25;
  v83 = v25;
  id v27 = v82;
  BOOL v28 = v21;
  id v29 = v22;
  __int16 v30 = self;
  unint64_t v77 = -[KTContext validatePeer:transparentData:accountKey:loggableDatas:selfVerificationInfo:enforceStaticKey:idsResponseTime:responseTime:error:](self, "validatePeer:transparentData:accountKey:loggableDatas:selfVerificationInfo:enforceStaticKey:idsResponseTime:responseTime:error:", a9, v73, &v91);
  id v31 = v91;
  __int16 v32 = [(KTContext *)self settings];
  uint64_t v33 = [v32 testingSelfValidationFailing];

  v34 = (void *)v33;
  if (v33
    && [(KTContext *)v30 injectSelfVerificationFailure:v23 failing:v33 error:a16])
  {
    v35 = v79;
    unsigned __int8 v36 = v28;
    v37 = v29;
    unint64_t v38 = 0;
    goto LABEL_48;
  }
  v80 = (void *)v33;
  id v81 = v26;
  id v90 = v31;
  id v78 = v23;
  unsigned __int8 v39 = +[KTContextVerifier verifyServerLoggableDatas:v23 againstSyncedLoggableDatas:v24 cloudDevices:v84 error:&v90];
  id v40 = v90;

  if ((v39 & 1) == 0)
  {
    if (qword_100326650 != -1) {
      dispatch_once(&qword_100326650, &stru_1002B6F90);
    }
    unsigned __int8 v36 = v28;
    id v42 = qword_100326658;
    v37 = v29;
    if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v93 = 1752392040;
      __int16 v94 = 2112;
      id v95 = v82;
      __int16 v96 = 2112;
      id v97 = v40;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ server data against synced data: %@", buf, 0x20u);
    }
    unint64_t v38 = 0;
    id v26 = v81;
    if (a16 && v40)
    {
      id v31 = v40;
      unint64_t v38 = 0;
      *a16 = v31;
LABEL_37:
      v35 = v79;
      v34 = v80;
      id v23 = v78;
      goto LABEL_48;
    }
LABEL_36:
    id v31 = v40;
    goto LABEL_37;
  }
  id v76 = v24;
  if (!a11)
  {
    id v89 = v40;
    unsigned __int8 v41 = [v28 validateAndUpdateWithSyncedLoggableDatas:v24 accountKey:v29 cloudDevices:v84 requestDate:v83 error:&v89];
    id v31 = v89;

    if ((v41 & 1) == 0)
    {
      v75 = v28;
      if (qword_100326650 != -1) {
        dispatch_once(&qword_100326650, &stru_1002B6FB0);
      }
      v34 = (void *)v33;
      id v46 = qword_100326658;
      v37 = v29;
      id v23 = v78;
      if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558530;
        uint64_t v93 = 1752392040;
        __int16 v94 = 2112;
        id v95 = v82;
        __int16 v96 = 2112;
        id v97 = v31;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ transparent data against synced data: %@", buf, 0x20u);
      }
      unint64_t v38 = 0;
      id v26 = v81;
      goto LABEL_43;
    }
    id v40 = v31;
  }
  if (!a15)
  {
    v43 = v30;
    uint64_t v44 = [(KTContext *)v30 accountKeyServer];
    id v88 = v40;
    unsigned __int8 v45 = [v44 isAccountIdentity:v29 error:&v88];
    id v31 = v88;

    if (v45)
    {
      v34 = (void *)v33;
      if (a11)
      {
        v35 = v79;
        id v27 = v82;
        unsigned __int8 v36 = v28;
        goto LABEL_21;
      }
      id v50 = [(KTContext *)v43 cloudRecords];
      unsigned int v51 = [v50 enforceCKOptInRecords];

      id v52 = v43;
      if (!v51)
      {
LABEL_56:
        [(KTContext *)v52 cloudRecords];
        v59 = v58 = v52;
        unsigned __int8 v60 = [v59 enforceCKOptInRecords];

        id v24 = v76;
        if (v60)
        {
          v35 = v79;
          id v27 = v82;
          unsigned __int8 v36 = v28;
          v37 = v29;
          goto LABEL_22;
        }
        v61 = [(KTContext *)v58 optInServer];
        id v86 = 0;
        v35 = [v61 getOptInHistory:&v86];
        id v62 = v86;

        v75 = v28;
        if (!v62)
        {
          v68 = 0;
          id v85 = v31;
          v69 = v28;
          v37 = v29;
          unsigned __int8 v70 = [v69 validateOptInHistory:v35 accountKey:v29 responseTime:v83 error:&v85];
          id v62 = v85;

          if (v70)
          {
            id v31 = v62;
            id v26 = v81;
            id v27 = v82;
            v34 = v80;
            unsigned __int8 v36 = v75;
            goto LABEL_23;
          }
          unint64_t v38 = 0;
          id v26 = v81;
          if (!a16)
          {
            id v31 = v62;
            id v27 = v82;
            goto LABEL_85;
          }
          id v31 = v62;
          id v27 = v82;
          v72 = a16;
          if (!v62) {
            goto LABEL_85;
          }
          goto LABEL_84;
        }
        v63 = [v62 domain];
        if ([v63 isEqualToString:kTransparencyErrorInterface])
        {
          v64 = (char *)[v62 code];

          BOOL v65 = v64 + 308 == 0;
          id v27 = v82;
          v37 = v29;
          if (v65)
          {
            id v26 = v81;
            if (qword_100326650 != -1) {
              dispatch_once(&qword_100326650, &stru_1002B7050);
            }
            v66 = qword_100326658;
            if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 141558530;
              uint64_t v93 = 1752392040;
              __int16 v94 = 2112;
              id v95 = v82;
              __int16 v96 = 2112;
              id v97 = v62;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Failed to get %{mask.hash}@ opt-in history (waiting for first unlock): %@", buf, 0x20u);
            }
            unint64_t v38 = 2;
LABEL_83:
            v68 = v62;
            v72 = a16;
            if (!a16)
            {
LABEL_85:

              v34 = v80;
              id v23 = v78;
              goto LABEL_47;
            }
LABEL_84:
            id *v72 = v62;
            goto LABEL_85;
          }
        }
        else
        {

          id v27 = v82;
          v37 = v29;
        }
        id v26 = v81;
        if (qword_100326650 != -1) {
          dispatch_once(&qword_100326650, &stru_1002B7070);
        }
        v71 = qword_100326658;
        if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 141558530;
          uint64_t v93 = 1752392040;
          __int16 v94 = 2112;
          id v95 = v27;
          __int16 v96 = 2112;
          id v97 = v62;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Failed to get %{mask.hash}@ opt-in history: %@", buf, 0x20u);
        }
        unint64_t v38 = 0;
        goto LABEL_83;
      }
      uint64_t v53 = [v28 getLogDataForAccountKey:v29 uri:v82];
      v54 = [(KTContext *)v43 cloudRecords];
      uint64_t v55 = [(KTContext *)v43 applicationID];
      id v87 = 0;
      char v56 = [v54 evaluateKTLogData:v53 application:v55 error:&v87];
      id v74 = v87;

      if (v56)
      {
        if (qword_100326650 != -1) {
          dispatch_once(&qword_100326650, &stru_1002B7030);
        }
        id v52 = v43;
        id v57 = qword_100326658;
        if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v93 = (uint64_t)v56;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "evaluateKTLogData eval result: %@", buf, 0xCu);
        }

        v34 = v80;
        goto LABEL_56;
      }
      id v24 = v76;
      if (qword_100326650 != -1) {
        dispatch_once(&qword_100326650, &stru_1002B7010);
      }
      id v27 = v82;
      id v23 = v78;
      v75 = v28;
      v67 = qword_100326658;
      v37 = v29;
      if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)v74;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "evaluateKTLogData failure: %@", buf, 0xCu);
      }
      id v26 = v81;
      if (a16 && v74) {
        *a16 = v74;
      }

      unint64_t v38 = 0;
LABEL_46:
      v35 = v79;
LABEL_47:
      unsigned __int8 v36 = v75;
      goto LABEL_48;
    }
    v75 = v28;
    v34 = (void *)v33;
    if (qword_100326650 != -1) {
      dispatch_once(&qword_100326650, &stru_1002B6FD0);
    }
    id v27 = v82;
    v37 = v29;
    id v23 = v78;
    id v48 = qword_100326658;
    id v26 = v81;
    if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558530;
      uint64_t v93 = 1752392040;
      __int16 v94 = 2112;
      id v95 = v82;
      __int16 v96 = 2112;
      id v97 = v31;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ account key: %@", buf, 0x20u);
    }
    unint64_t v38 = 0;
LABEL_43:
    if (a16 && v31)
    {
      id v31 = v31;
      unint64_t v38 = 0;
      *a16 = v31;
    }
    goto LABEL_46;
  }
  unsigned __int8 v36 = v28;
  if (([v26 isEqual:v29] & 1) == 0)
  {
    if (qword_100326650 != -1) {
      dispatch_once(&qword_100326650, &stru_1002B6FF0);
    }
    v37 = v29;
    __int16 v47 = qword_100326658;
    if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v93 = 1752392040;
      __int16 v94 = 2112;
      id v95 = v82;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to verify %{mask.hash}@ account key", buf, 0x16u);
    }
    unint64_t v38 = 0;
    goto LABEL_36;
  }
  id v31 = v40;
  v35 = v79;
  v34 = v80;
LABEL_21:
  v37 = v29;
LABEL_22:
  id v26 = v81;
LABEL_23:
  unint64_t v38 = v77;
  id v23 = v78;
  if (a16 && v31)
  {
    id v31 = v31;
    *a16 = v31;
  }
LABEL_48:

  return v38;
}

- (unint64_t)validateAndReportPeerOrEnroll:(id)a3 type:(unint64_t)a4 transparentData:(id)a5 accountKey:(id)a6 loggableDatas:(id)a7 initialResult:(unint64_t)a8 idsResponseTime:(id)a9 responseMetadata:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  id v22 = [(KTContext *)self applicationID];
  id v31 = +[KTContext validateEventName:a4 application:v22];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000A0A4;
  v33[3] = &unk_1002B7098;
  id v34 = v21;
  v35 = self;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  unint64_t v41 = a4;
  unint64_t v42 = a8;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v21;
  id v29 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v31 error:a11 block:v33];

  return (unint64_t)v29;
}

- (unint64_t)validateAndReportPeer:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10
{
  return [(KTContext *)self validateAndReportPeerOrEnroll:a3 type:0 transparentData:a4 accountKey:a5 loggableDatas:a6 initialResult:a7 idsResponseTime:a8 responseMetadata:a9 error:a10];
}

- (unint64_t)validateAndReportEnroll:(id)a3 transparentData:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 initialResult:(unint64_t)a7 idsResponseTime:(id)a8 responseMetadata:(id)a9 error:(id *)a10
{
  return [(KTContext *)self validateAndReportPeerOrEnroll:a3 type:2 transparentData:a4 accountKey:a5 loggableDatas:a6 initialResult:a7 idsResponseTime:a8 responseMetadata:a9 error:a10];
}

- (void)clearSelfTicketState:(id)a3 responseTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(KTContext *)self dataStore];
  id v9 = [(KTContext *)self applicationID];
  id v21 = 0;
  id v10 = (char *)[v8 checkFollowupTicket:v9 uri:v6 checkTime:v7 error:&v21];

  id v11 = v21;
  if (v11 && [v11 code] != (id)-338)
  {
    if (qword_100326650 != -1) {
      dispatch_once(&qword_100326650, &stru_1002B70B8);
    }
    uint64_t v12 = (void *)qword_100326658;
    if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      id v14 = [(KTContext *)self applicationID];
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = (uint64_t)v14;
      __int16 v24 = 2160;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to check followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);
    }
  }
  if ((unint64_t)(v10 - 1) <= 1)
  {
    id v15 = [(KTContext *)self dataStore];
    id v16 = [(KTContext *)self applicationID];
    id v20 = 0;
    unsigned __int8 v17 = [v15 clearFollowupTicket:v16 uri:v6 error:&v20];
    id v18 = v20;

    if ((v17 & 1) == 0)
    {
      if (qword_100326650 != -1) {
        dispatch_once(&qword_100326650, &stru_1002B70D8);
      }
      id v19 = qword_100326658;
      if (os_log_type_enabled((os_log_t)qword_100326658, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 141558530;
        uint64_t v23 = 1752392040;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v6;
        __int16 v26 = 2112;
        id v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to clear followup ticket for %{mask.hash}@: %@", buf, 0x20u);
      }
    }
  }
}

- (unint64_t)validateAndReportSelf:(id)a3 transparentData:(id)a4 accountKey:(id)a5 serverloggableDatas:(id)a6 syncedLoggableDatas:(id)a7 selfVerificationInfo:(id)a8 optInCheck:(BOOL)a9 cloudDevices:(id)a10 pcsAccountKey:(id)a11 kvsOptInHistory:(id)a12 isReplay:(BOOL)a13 initialResult:(unint64_t)a14 idsResponseTime:(id)a15 responseMetadata:(id)a16 error:(id *)a17
{
  id v50 = a3;
  id v22 = a4;
  id v23 = a5;
  id v49 = a6;
  id v48 = a7;
  id v52 = a8;
  id v51 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a15;
  id v27 = a16;
  __int16 v28 = [v27 objectForKeyedSubscript:@"ResponseTime"];
  id v29 = +[NSDate kt_dateFromString:v28];

  unsigned __int8 v45 = v25;
  if (a13)
  {
    LOBYTE(v43) = 1;
    id v42 = v25;
    __int16 v30 = v50;
    LOBYTE(v41) = a9;
    id v31 = v22;
    id v32 = v22;
    uint64_t v33 = v23;
    id v34 = v23;
    id v36 = v48;
    v35 = v49;
    id v37 = v24;
    id v38 = [(KTContext *)self validateSelf:v50 transparentData:v32 accountKey:v34 serverloggableDatas:v49 syncedLoggableDatas:v48 selfVerificationInfo:v52 idsResponseTime:v26 responseTime:v29 optInCheck:v41 cloudDevices:v51 pcsAccountKey:v24 kvsOptInHistory:v42 isReplay:v43 error:a17];
  }
  else
  {
    id v39 = [(KTContext *)self applicationID];
    uint64_t v44 = +[KTContext validateEventName:1 application:v39];

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10000A920;
    v53[3] = &unk_1002B7100;
    v53[4] = self;
    __int16 v30 = v50;
    id v54 = v50;
    id v31 = v22;
    id v55 = v22;
    uint64_t v33 = v23;
    id v56 = v23;
    v35 = v49;
    id v57 = v49;
    id v36 = v48;
    id v58 = v48;
    id v59 = v52;
    id v60 = v26;
    id v61 = v29;
    BOOL v65 = a9;
    id v62 = v51;
    unint64_t v64 = a14;
    id v63 = v27;
    id v47 = v24;
    id v38 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v44 error:a17 block:v53];

    id v37 = v47;
  }

  return (unint64_t)v38;
}

- (unint64_t)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(KTContext *)self verifier];
  id v20 = [v19 handleBatchQueryResponse:v18 queryRequest:v17 receiptDate:v16 fetchId:v15 error:a7 transparentDataHandler:v14];

  return (unint64_t)v20;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 validateType:(unint64_t)a7 ktCapable:(BOOL)a8 error:(id *)a9 transparentDataHandler:(id)a10
{
  BOOL v32 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a10;
  id v18 = a6;
  id v19 = a5;
  id v20 = [(KTContext *)self applicationID];
  uint64_t v33 = +[KTContext validateEventName:a7 application:v20];

  id v21 = [(KTContext *)self verifier];
  id v34 = 0;
  id v22 = [v21 handleQueryResponse:v15 queryRequest:v16 receiptDate:v19 fetchId:v18 error:&v34 transparentDataHandler:v17];

  id v23 = v34;
  if (v22 != (id)1)
  {
    id v24 = [v15 metadata];
    id v25 = [v16 uri];
    id v26 = [(KTContext *)self analyticsForResponse:v24 type:a7 uri:v25 result:v22 ktCapable:v32];

    if (v22)
    {
      uint64_t v27 = 0;
    }
    else
    {
      __int16 v28 = [v26 objectForKeyedSubscript:@"ktSoftFailure"];
      unsigned int v29 = [v28 BOOLValue];

      uint64_t v27 = v29 ^ 1;
    }
    __int16 v30 = +[TransparencyAnalytics logger];
    [v30 logResultForEvent:v33 hardFailure:v27 result:v23 withAttributes:v26];
  }
  if (a9 && v23) {
    *a9 = v23;
  }

  return (unint64_t)v22;
}

- (unint64_t)handleQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 error:(id *)a7 transparentDataHandler:(id)a8
{
  return [(KTContext *)self handleQueryResponse:a3 queryRequest:a4 receiptDate:a5 fetchId:a6 validateType:3 ktCapable:0 error:a7 transparentDataHandler:a8];
}

- (id)metadataForInsertResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 serverEventInfo];

  if (v4)
  {
    uint64_t v7 = kTransparencyResponseMetadataKeyServerHint;
    v5 = [v3 serverEventInfo];
    id v8 = v5;
    id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  }

  return v4;
}

- (unint64_t)handleInsertResponse:(id)a3 uri:(id)a4 fetchId:(id)a5 error:(id *)a6 transparentDataHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(KTContext *)self applicationID];
  id v17 = +[KTContext validateEventName:2 application:v16];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000B048;
  v24[3] = &unk_1002B7128;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:v17 error:a6 block:v24];

  return (unint64_t)v22;
}

- (KTContext)initWithApplicationID:(id)a3 dependencies:(id)a4
{
  id v5 = a4;
  id v22 = a3;
  id v24 = [v5 applicationKeyStore];
  id v19 = [v5 dataStore];
  id v18 = [v5 smDataStore];
  id v17 = [v5 staticKeyStore];
  id v16 = [v5 logClient];
  id v23 = [v5 contextStore];
  id v15 = [v5 accountKeyServer];
  id v14 = [v5 stateMachine];
  id v13 = [v5 kvs];
  id v6 = [v5 cloudRecords];
  id v12 = [v5 followup];
  uint64_t v7 = [v5 settings];
  id v8 = [v5 analyticsLogger];
  id v9 = [v5 tapToRadar];
  id v10 = [v5 eligibilityStatusReporter];

  id v21 = [(KTContext *)self initWithApplicationKeyStore:v24 dataStore:v19 smDataStore:v18 staticKeyStore:v17 logClient:v16 applicationID:v22 contextStore:v23 accountKeyServer:v15 stateMachine:v14 kvs:v13 cloudRecords:v6 followup:v12 settings:v7 analyticsLogger:v8 tapToRadar:v9 eligibilityStatusReporter:v10];
  return v21;
}

- (KTContext)initWithApplicationKeyStore:(id)a3 dataStore:(id)a4 smDataStore:(id)a5 staticKeyStore:(id)a6 logClient:(id)a7 applicationID:(id)a8 contextStore:(id)a9 accountKeyServer:(id)a10 stateMachine:(id)a11 kvs:(id)a12 cloudRecords:(id)a13 followup:(id)a14 settings:(id)a15 analyticsLogger:(id)a16 tapToRadar:(id)a17 eligibilityStatusReporter:(id)a18
{
  id v54 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v57 = a9;
  id v28 = a10;
  id v55 = a11;
  id v29 = a12;
  id v64 = a13;
  id v63 = a14;
  id v30 = a15;
  id v62 = a16;
  id v61 = a17;
  id v60 = a18;
  v66.receiver = self;
  v66.super_class = (Class)KTContext;
  id v31 = [(KTContext *)&v66 init];
  BOOL v32 = v31;
  id v58 = v26;
  id v59 = v24;
  id v56 = v30;
  if (!v31)
  {
    id v42 = v54;
    uint64_t v44 = v55;
    id v46 = v57;
    goto LABEL_7;
  }
  id v51 = v29;
  [(KTContext *)v31 setApplicationID:v27];
  [(KTContext *)v32 setApplicationKeyStore:v54];
  [(KTContext *)v32 setDataStore:v23];
  [(KTContext *)v32 setSmDataStore:v24];
  id v53 = v25;
  [(KTContext *)v32 setStaticKeyStore:v25];
  [(KTContext *)v32 setLogClient:v26];
  [(KTContext *)v32 setSettings:v30];
  uint64_t v33 = [[KTContextVerifier alloc] initWithApplicationKeyStore:v54 dataStore:v23 applicationID:v27 context:v32];
  [(KTContext *)v32 setVerifier:v33];

  id v34 = [TransparencyTranscript alloc];
  v35 = (objc_class *)objc_opt_class();
  id v36 = NSStringFromClass(v35);
  id v37 = [(KTContext *)v32 applicationID];
  id v38 = +[NSString stringWithFormat:@"%@-%@", v36, v37];
  [(KTContext *)v32 settings];
  id v40 = v39 = v27;
  uint64_t v41 = [(TransparencyTranscript *)v34 initWithContext:v38 settings:v40];
  [(KTContext *)v32 setTranscript:v41];

  id v42 = v54;
  if (!v28)
  {
    id v28 = +[KTAccountKeyServer sharedKeyServiceForApplication:v39];
  }
  [(KTContext *)v32 setAccountKeyServer:v28];
  uint64_t v43 = v39;
  uint64_t v44 = v55;
  id v29 = v51;
  unsigned __int8 v45 = [[KTOptInManagerServer alloc] initWithApplication:v39 context:v32 stateMachine:v55 account:objc_opt_class() store:v51];
  [(KTContext *)v32 setOptInServer:v45];

  [(KTContext *)v32 setStateMachine:v55];
  id v46 = v57;
  [(KTContext *)v32 setContextStore:v57];
  [(KTContext *)v32 setFollowUp:v63];
  [(KTContext *)v32 setCloudRecords:v64];
  [(KTContext *)v32 setTapToRadar:v61];
  [(KTContext *)v32 setAnalyticsLogger:v62];
  [(KTContext *)v32 setEligibilityStatusReporter:v60];
  dispatch_queue_t v47 = dispatch_queue_create("com.apple.transparencyd.eligibility", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  [(KTContext *)v32 setEligibilityQueue:v47];

  if (v32->_verifier)
  {
    id v25 = v53;
    id v27 = v43;
LABEL_7:
    id v48 = v32;
    goto LABEL_13;
  }
  id v25 = v53;
  if (qword_100326670 != -1) {
    dispatch_once(&qword_100326670, &stru_1002B71F0);
  }
  id v27 = v43;
  id v49 = qword_100326678;
  if (os_log_type_enabled((os_log_t)qword_100326678, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Cannot create a KTContext with an invalid KTPublicKeyStore", buf, 2u);
  }
  id v48 = 0;
LABEL_13:

  return v48;
}

- (BOOL)drainContext
{
  v2 = [(KTContext *)self dataStore];
  unsigned __int8 v3 = [v2 drainDataStore];

  return v3;
}

- (void)dealloc
{
  unsigned __int8 v3 = [(KTContext *)self optInServer];
  [v3 setContext:0];

  v4.receiver = self;
  v4.super_class = (Class)KTContext;
  [(KTContext *)&v4 dealloc];
}

- (void)logStartEvent:(id)a3
{
  id v4 = a3;
  id v7 = [(KTContext *)self transcript];
  id v5 = [(KTContext *)self applicationID];
  id v6 = +[NSString stringWithFormat:@"%@-%@", v5, v4];

  [v7 startEvent:v6];
}

- (void)logFinishSuccessEvent:(id)a3
{
  id v4 = a3;
  id v7 = [(KTContext *)self transcript];
  id v5 = [(KTContext *)self applicationID];
  id v6 = +[NSString stringWithFormat:@"%@-%@", v5, v4];

  [v7 stopEventWithSuccess:v6];
}

- (void)logFinishFailureEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(KTContext *)self transcript];
  id v8 = [(KTContext *)self applicationID];
  id v9 = +[NSString stringWithFormat:@"%@-%@", v8, v7];

  [v10 stopEventWithFailure:v9 error:v6];
}

- (BOOL)unsupported:(id *)a3
{
  id v5 = [(KTContext *)self applicationKeyStore];
  unsigned int v6 = [v5 unsupported];

  if (v6)
  {
    if (qword_100326670 != -1) {
      dispatch_once(&qword_100326670, &stru_1002B7210);
    }
    id v7 = qword_100326678;
    if (os_log_type_enabled((os_log_t)qword_100326678, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = kTransparencyProtocolVersion;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "This client version (%d) is no longer supported.", buf, 8u);
    }
    if (a3)
    {
      uint64_t v8 = kTransparencyErrorInternal;
      id v9 = [(KTContext *)self applicationKeyStore];
      id v10 = [v9 treeRollInfoURL];
      *a3 = +[TransparencyError errorWithDomain:v8, -230, @"Client version (%d) no longer supported. See %@ for more info.", kTransparencyProtocolVersion, v10 code description];
    }
  }
  return v6;
}

- (BOOL)ready:(id *)a3
{
  BOOL v4 = [(KTApplicationPublicKeyStore *)self->_applicationKeyStore ready];
  if (!v4)
  {
    if (a3)
    {
      *a3 = +[TransparencyError errorWithDomain:kTransparencyErrorInterface code:-41 description:@"KT public key store is not ready"];
    }
    if (qword_100326670 != -1) {
      dispatch_once(&qword_100326670, &stru_1002B7230);
    }
    id v5 = qword_100326678;
    if (os_log_type_enabled((os_log_t)qword_100326678, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "KT public key store is not ready", v7, 2u);
    }
  }
  return v4;
}

- (void)clearState:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  [(KTContext *)self logStartEvent:@"clearState"];
  v4[2](v4, 0);

  [(KTContext *)self logFinishSuccessEvent:@"clearState"];
}

- (id)copyState
{
  v2 = [(KTContext *)self applicationKeyStore];
  id v3 = [v2 copyKeyStoreState];

  return v3;
}

- (BOOL)contextShouldGossip
{
  id v3 = [(KTContext *)self applicationKeyStore];
  id v4 = [v3 shutDown];

  if (!v4) {
    return 1;
  }
  id v5 = [(KTContext *)self applicationKeyStore];
  id v6 = [v5 shutDown];
  double v7 = (double)((unint64_t)v6 + kTransparencyThirtyDaysInMs);

  +[NSDate kt_currentTimeMs];
  return v8 < v7;
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplicationID:(id)a3
{
}

- (TransparencyTranscript)transcript
{
  return (TransparencyTranscript *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTranscript:(id)a3
{
}

- (KTApplicationPublicKeyStore)applicationKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationKeyStore:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataStore:(id)a3
{
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSmDataStore:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStaticKeyStore:(id)a3
{
}

- (KTContextVerifier)verifier
{
  return (KTContextVerifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVerifier:(id)a3
{
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLogClient:(id)a3
{
}

- (KTAccountKeyServer)accountKeyServer
{
  return (KTAccountKeyServer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountKeyServer:(id)a3
{
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOptInServer:(id)a3
{
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFollowUp:(id)a3
{
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudRecords:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSettings:(id)a3
{
}

- (TransparencyAnalytics)analyticsLogger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAnalyticsLogger:(id)a3
{
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)eligibilityStatusReporter
{
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEligibilityStatusReporter:(id)a3
{
}

- (OS_dispatch_queue)eligibilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEligibilityQueue:(id)a3
{
}

- (KTContextStore)contextStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextStore);

  return (KTContextStore *)WeakRetained;
}

- (void)setContextStore:(id)a3
{
}

- (KTSMManager)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);

  return (KTSMManager *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (KTTapToRadarProtocol)tapToRadar
{
  return (KTTapToRadarProtocol *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTapToRadar:(id)a3
{
}

- (KTCondition)storedEligibilityResult
{
  return (KTCondition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStoredEligibilityResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedEligibilityResult, 0);
  objc_storeStrong((id *)&self->_tapToRadar, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_destroyWeak((id *)&self->_contextStore);
  objc_storeStrong((id *)&self->_eligibilityQueue, 0);
  objc_storeStrong((id *)&self->_eligibilityStatusReporter, 0);
  objc_storeStrong((id *)&self->_analyticsLogger, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_optInServer, 0);
  objc_storeStrong((id *)&self->_accountKeyServer, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_storeStrong((id *)&self->_smDataStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_applicationKeyStore, 0);
  objc_storeStrong((id *)&self->_transcript, 0);

  objc_storeStrong((id *)&self->_applicationID, 0);
}

- (BOOL)shouldShowCFU:(id)a3
{
  id v4 = a3;
  id v5 = [(KTContext *)self dataStore];
  id v6 = [v4 application];
  double v7 = [v4 uri];
  double v8 = [v4 responseTime];
  id v39 = 0;
  id v9 = [v5 checkFollowupTicket:v6 uri:v7 checkTime:v8 error:&v39];
  id v10 = v39;

  if (v10 && [v10 code] != (id)-338)
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8528);
    }
    id v11 = (void *)qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      int v13 = [v4 application];
      id v14 = [v4 uri];
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = (uint64_t)v13;
      __int16 v42 = 2160;
      uint64_t v43 = 1752392040;
      __int16 v44 = 2112;
      unsigned __int8 v45 = v14;
      __int16 v46 = 2112;
      id v47 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to check followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);
    }
  }
  if (v9 != (id)2)
  {
    if (v9 == (id)1)
    {
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B8588);
      }
      id v30 = (void *)qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = v30;
        BOOL v32 = [v4 uri];
        *(_DWORD *)buf = 141558274;
        uint64_t v41 = 1752392040;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Have active followup ticket for %{mask.hash}@", buf, 0x16u);
      }
    }
    else if (!v9)
    {
      id v15 = [(KTContext *)self dataStore];
      id v16 = [v4 application];
      id v17 = [v4 uri];
      id v18 = [v4 responseTime];
      id v38 = v10;
      unsigned __int8 v19 = [v15 createFollowupTicket:v16 uri:v17 startTime:v18 error:&v38];
      id v20 = v38;

      if (v19)
      {
        id v21 = [(KTContext *)self dataStore];
        id v22 = [v4 application];
        id v23 = [v4 uri];
        id v24 = [v4 responseTime];
        id v25 = [v21 checkFollowupTicket:v22 uri:v23 checkTime:v24 error:0];

        BOOL v26 = v25 == (id)2;
      }
      else
      {
        if (qword_100326730 != -1) {
          dispatch_once(&qword_100326730, &stru_1002B8548);
        }
        uint64_t v33 = (void *)qword_100326738;
        if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
        {
          id v34 = v33;
          v35 = [v4 application];
          id v36 = [v4 uri];
          *(_DWORD *)buf = 138544130;
          uint64_t v41 = (uint64_t)v35;
          __int16 v42 = 2160;
          uint64_t v43 = 1752392040;
          __int16 v44 = 2112;
          unsigned __int8 v45 = v36;
          __int16 v46 = 2112;
          id v47 = v20;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to create followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);
        }
        BOOL v26 = 1;
      }
      id v10 = v20;
      goto LABEL_28;
    }
    BOOL v26 = 0;
    goto LABEL_28;
  }
  if (qword_100326730 != -1) {
    dispatch_once(&qword_100326730, &stru_1002B8568);
  }
  id v27 = (void *)qword_100326738;
  if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = v27;
    id v29 = [v4 uri];
    *(_DWORD *)buf = 141558274;
    uint64_t v41 = 1752392040;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Have expired followup ticket for %{mask.hash}@", buf, 0x16u);
  }
  BOOL v26 = 1;
LABEL_28:

  return v26;
}

- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 replay:(BOOL)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  if (v12)
  {
    if (a3 == 2)
    {
      [v12 requestTime];
      CFAbsoluteTime v15 = v14 + (double)kKTMaximumMergeDelayMs / 1000.0;
      if (v15 >= CFAbsoluteTimeGetCurrent()) {
        a3 = 2;
      }
      else {
        a3 = 0;
      }
    }
    id v16 = [(KTContext *)self dataStore];
    id v17 = [v16 createRequestFailure];

    if (!v17)
    {
      a3 = 2;
LABEL_46:

      goto LABEL_47;
    }
    [v17 setRequest:v12];
    if (a7)
    {
      if (*a7) {
        uint64_t v18 = (uint64_t)[*a7 code];
      }
      else {
        uint64_t v18 = -120;
      }
      [v17 setErrorCode:v18];
      if (*a7)
      {
        unsigned __int8 v19 = [*a7 domain];
        [v17 setErrorDomain:v19];

LABEL_16:
        [v12 setUnsigned:"verificationResult" value:a3];
        if (a6) {
          goto LABEL_46;
        }
        id v20 = [v12 type];
        if (!a7 || a3 || v20 != (id)1) {
          goto LABEL_46;
        }
        id v21 = [(KTContext *)self dataStore];
        id v22 = *a7;
        id v23 = [(KTContext *)self applicationID];
        id v24 = [(KTContext *)self optInServer];
        id v25 = [v21 createFailureEvent:v22 application:v23 optInServer:v24];

        BOOL v26 = [v12 failureEvent];

        if (v26)
        {
          id v27 = [(KTContext *)self dataStore];
          id v28 = [v12 failureEvent];
          [v27 deleteObject:v28];
        }
        [v12 setFailureEvent:v25];
        if (qword_100326730 != -1) {
          dispatch_once(&qword_100326730, &stru_1002B85A8);
        }
        id v29 = (void *)qword_100326738;
        if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = v29;
          id v31 = [v25 eventId];
          BOOL v32 = [v12 requestId];
          uint64_t v33 = [v17 errorDomain];
          *(_DWORD *)buf = 138544130;
          id v57 = v31;
          __int16 v58 = 2114;
          uint64_t v59 = (uint64_t)v32;
          __int16 v60 = 2112;
          id v61 = v33;
          __int16 v62 = 1024;
          LODWORD(v63) = [v17 errorCode];
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Created failure eventId %{public}@ for self validation requestId %{public}@ because error: %@:%d", buf, 0x26u);
        }
        if (![(KTContext *)self shouldShowCFU:v12]) {
          goto LABEL_45;
        }
        id v34 = [(KTContext *)self optInServer];
        id v55 = 0;
        v35 = [v34 getAggregateOptInState:&v55];
        id v36 = v55;

        if (!v35)
        {
          if (qword_100326730 != -1) {
            dispatch_once(&qword_100326730, &stru_1002B85C8);
          }
          id v37 = qword_100326738;
          if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v36;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "writeResult: failed getting optin state: %@", buf, 0xCu);
          }
        }
        id v53 = v36;
        if ([v17 errorCode] == (id)-289) {
          goto LABEL_33;
        }
        uint64_t v41 = [v17 errorDomain];
        if ([v41 isEqual:@"com.apple.Transparency"])
        {
          id v42 = [v17 errorCode];

          if (v42 == (id)7)
          {
LABEL_33:
            id v38 = [(KTContext *)self followUp];
            id v39 = [(KTContext *)self applicationID];
            id v40 = [v25 eventId];
            [v38 postFollowup:v39 type:4 eventId:v40 errorCode:-289 optInState:v35 infoLink:0 additionalInfo:0 error:0];
LABEL_39:

            uint64_t v43 = [(KTContext *)self dataStore];
            __int16 v44 = [v12 application];
            unsigned __int8 v45 = [v12 uri];
            id v54 = 0;
            unsigned __int8 v46 = [v43 clearFollowupTicket:v44 uri:v45 error:&v54];
            id v47 = v54;

            if ((v46 & 1) == 0)
            {
              if (qword_100326730 != -1) {
                dispatch_once(&qword_100326730, &stru_1002B85E8);
              }
              id v48 = (void *)qword_100326738;
              if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
              {
                id v49 = v48;
                id v50 = [v12 application];
                id v51 = [v12 uri];
                *(_DWORD *)buf = 138544130;
                id v57 = v50;
                __int16 v58 = 2160;
                uint64_t v59 = 1752392040;
                __int16 v60 = 2112;
                id v61 = v51;
                __int16 v62 = 2112;
                id v63 = v47;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to clear followup ticket for %{public}@:%{mask.hash}@ with error: %@", buf, 0x2Au);
              }
            }

LABEL_45:
            a3 = 0;
            goto LABEL_46;
          }
        }
        else
        {
        }
        id v38 = [(KTContext *)self followUp];
        id v39 = [(KTContext *)self applicationID];
        id v40 = [v25 eventId];
        [v38 postFollowup:v39 type:0 eventId:v40 errorCode:[v17 errorCode] optInState:v35 infoLink:0 additionalInfo:0 error:0];
        goto LABEL_39;
      }
    }
    else
    {
      [v17 setErrorCode:-120];
    }
    [v17 setErrorDomain:kTransparencyErrorUnknown];
    goto LABEL_16;
  }
LABEL_47:

  return a3;
}

- (unint64_t)writeResult:(unint64_t)a3 request:(id)a4 proof:(id)a5 error:(id *)a6
{
  return [(KTContext *)self writeResult:a3 request:a4 proof:a5 replay:0 error:a6];
}

- (unint64_t)deserializeServerLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 serverLoggableDatas];
  id v21 = 0;
  id v10 = +[TransparencyManagedDataStore deserializeLoggableDatas:v9 error:&v21];
  id v11 = v21;

  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    unint64_t v12 = 1;
  }
  else
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8608);
    }
    id v13 = (void *)qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
    {
      double v14 = v13;
      CFAbsoluteTime v15 = [v8 requestId];
      *(_DWORD *)buf = 138543362;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "deleting requestId %{public}@ with failed deserialization of serverLoggableDatas", buf, 0xCu);
    }
    uint64_t v16 = kTransparencyErrorDecode;
    id v17 = [v8 requestId];
    uint64_t v18 = +[TransparencyError errorWithDomain:v16, -131, v11, @"deleting requestId %@ with failed deserialization of serverLoggableDatas", v17 code underlyingError description];

    unsigned __int8 v19 = [(KTContext *)self dataStore];
    [v19 deleteObject:v8];

    unint64_t v12 = 0;
    if (a5 && v18)
    {
      id v11 = v18;
      unint64_t v12 = 0;
      *a5 = v11;
    }
    else
    {
      id v11 = v18;
    }
  }

  return v12;
}

- (unint64_t)validatePeerOrEnrollKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 transparentData:(id *)a6 loggableDatas:(id *)a7 error:(id *)a8
{
  id v12 = a3;
  id v49 = a4;
  id v13 = a5;
  id v46 = [v12 getUnsigned:"type"];
  uint64_t v81 = 0;
  id v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 2;
  uint64_t v75 = 0;
  id v76 = (id *)&v75;
  uint64_t v77 = 0x3032000000;
  id v78 = sub_100021C98;
  id v79 = sub_100021CA8;
  id v80 = 0;
  id v14 = [v12 getUnsigned:];
  CFAbsoluteTime v15 = [v13 metadata];
  uint64_t v16 = [v15 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
  [v12 setServerHint:v16];

  id v17 = [v13 metadata];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"APS"];
  [v12 setUsedReversePush:v18 != 0];

  unsigned __int8 v19 = [v13 metadata];
  id v20 = [v19 objectForKeyedSubscript:@"ResponseTime"];
  id v21 = +[NSDate kt_dateFromString:v20];
  [v12 setResponseTime:v21];

  uint64_t v69 = 0;
  unsigned __int8 v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = sub_100021C98;
  id v73 = sub_100021CA8;
  id v74 = 0;
  id obj = 0;
  unint64_t v22 = [(KTContext *)self deserializeServerLoggableDatas:v12 loggableDatas:&obj error:a8];
  objc_storeStrong(&v74, obj);
  v82[3] = v22;
  if (v22 == 1)
  {
    unsigned int v45 = +[KTLoggableData isAccountKTCapable:v70[5]];
    uint64_t v62 = 0;
    id v63 = &v62;
    uint64_t v64 = 0x3032000000;
    BOOL v65 = sub_100021C98;
    objc_super v66 = sub_100021CA8;
    id v67 = 0;
    id v23 = [v12 responseTime];
    id v24 = [v12 requestId];
    id v61 = 0;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100021CB0;
    v52[3] = &unk_1002B86B0;
    id v55 = &v75;
    id v56 = &v81;
    v52[4] = self;
    id v59 = v46;
    id v25 = v12;
    id v53 = v25;
    id v57 = &v69;
    id v60 = v14;
    id v26 = v13;
    id v54 = v26;
    __int16 v58 = &v62;
    unint64_t v27 = [(KTContext *)self handleQueryResponse:v26 queryRequest:v49 receiptDate:v23 fetchId:v24 validateType:v46 ktCapable:v45 error:&v61 transparentDataHandler:v52];
    id v28 = v61;

    if (a6)
    {
      id v29 = (void *)v63[5];
      if (v29) {
        *a6 = v29;
      }
    }
    if (a7)
    {
      id v30 = (void *)v70[5];
      if (v30) {
        *a7 = v30;
      }
    }
    if (v27 == 2) {
      goto LABEL_12;
    }
    id v31 = [v49 data];
    [v25 setQueryRequest:v31];

    BOOL v32 = [v26 data];
    [v25 setQueryResponse:v32];

    if (v27 != 1)
    {
LABEL_12:
      if (a8 && v28) {
        *a8 = v28;
      }
      id v51 = v28;
      unint64_t v33 = [(KTContext *)self writeResult:v27 request:v25 proof:0 error:&v51];
      id v34 = v51;

      v82[3] = v33;
      id v28 = v34;
    }
    else
    {
      unint64_t v33 = v82[3];
    }
    if (v33 == 1) {
      goto LABEL_20;
    }
    v35 = v76;
    if (a8)
    {
      id v36 = v76[5];
      if (v36)
      {
        *a8 = v36;
        unint64_t v33 = v82[3];
        v35 = v76;
      }
    }
    id v50 = v35[5];
    unint64_t v37 = [(KTContext *)self writeResult:v33 request:v25 proof:0 error:&v50];
    objc_storeStrong(v35 + 5, v50);
    v82[3] = v37;
    if (v37 == 1) {
LABEL_20:
    }
      [v25 setUnsigned:"verificationResult" value:1];
    id v38 = [(KTContext *)self dataStore];
    unsigned __int8 v39 = [v38 persistAndRefaultObject:v25 error:a8];

    if ((v39 & 1) == 0)
    {
      if (a8 && *a8)
      {
        id v40 = [(KTContext *)self dataStore];
        [v40 reportCoreDataPersistEventForLocation:@"validatePeerOrEnrollKTRequest" underlyingError:*a8];
      }
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B86D0);
      }
      uint64_t v41 = qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v42 = @"enroll";
        if (!v46) {
          CFStringRef v42 = @"peer";
        }
        if (a8) {
          id v43 = *a8;
        }
        else {
          id v43 = 0;
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v86 = v42;
        __int16 v87 = 2112;
        id v88 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "failed to save validate %@ with response: %@", buf, 0x16u);
      }
    }
    unint64_t v22 = v82[3];

    _Block_object_dispose(&v62, 8);
  }
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v81, 8);

  return v22;
}

- (void)writeLoggableDatas:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = [(KTContext *)self dataStore];
        id v14 = [v7 application];
        CFAbsoluteTime v15 = [v13 createRecordFromLoggableData:v12 application:v14];

        [v15 setRequest:v7];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (unint64_t)deserializeSyncedLoggableDatas:(id)a3 loggableDatas:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 clientLoggableDatas];
  id v21 = 0;
  uint64_t v10 = +[TransparencyManagedDataStore deserializeLoggableDatas:v9 error:&v21];
  id v11 = v21;

  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    unint64_t v12 = 1;
  }
  else
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B86F0);
    }
    id v13 = (void *)qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
    {
      id v14 = v13;
      CFAbsoluteTime v15 = [v8 requestId];
      *(_DWORD *)buf = 138543362;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "deleting requestId %{public}@ with failed deserialization of clientLoggableDatas", buf, 0xCu);
    }
    uint64_t v16 = kTransparencyErrorDecode;
    long long v17 = [v8 requestId];
    long long v18 = +[TransparencyError errorWithDomain:v16, -131, v11, @"deleting requestId %@ with failed deserialization of clientLoggableDatas", v17 code underlyingError description];

    long long v19 = [(KTContext *)self dataStore];
    [v19 deleteObject:v8];

    unint64_t v12 = 0;
    if (a5 && v18)
    {
      id v11 = v18;
      unint64_t v12 = 0;
      *a5 = v11;
    }
    else
    {
      id v11 = v18;
    }
  }

  return v12;
}

- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 pcsAccountKey:(id)a9 kvsOptInHistory:(id)a10 isReplay:(BOOL)a11 transparentData:(id *)a12 loggableDatas:(id *)a13 error:(id *)a14
{
  id v20 = a3;
  id v58 = a4;
  id v21 = a5;
  id v54 = a6;
  id v55 = a8;
  id v56 = a9;
  id v57 = a10;
  uint64_t v96 = 0;
  id v97 = &v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = 2;
  uint64_t v90 = 0;
  id v91 = (id *)&v90;
  uint64_t v92 = 0x3032000000;
  uint64_t v93 = sub_100021C98;
  __int16 v94 = sub_100021CA8;
  id v95 = 0;
  id v59 = v20;
  id v22 = [v20 getUnsigned:];
  id v23 = [v21 metadata];
  id v24 = [v23 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
  [v59 setServerHint:v24];

  id v25 = [v21 metadata];
  id v26 = [v25 objectForKeyedSubscript:@"APS"];
  [v59 setUsedReversePush:v26 != 0];

  unint64_t v27 = [v21 metadata];
  id v28 = [v27 objectForKeyedSubscript:@"ResponseTime"];
  id v29 = +[NSDate kt_dateFromString:v28];
  [v59 setResponseTime:v29];

  uint64_t v84 = 0;
  id v85 = &v84;
  uint64_t v86 = 0x3032000000;
  __int16 v87 = sub_100021C98;
  id v88 = sub_100021CA8;
  id v89 = 0;
  id obj = 0;
  unint64_t v30 = [(KTContext *)self deserializeServerLoggableDatas:v59 loggableDatas:&obj error:a14];
  objc_storeStrong(&v89, obj);
  v97[3] = v30;
  if (v30 == 1)
  {
    BOOL v31 = a7;
    unsigned int v53 = +[KTLoggableData isAccountKTCapable:v85[5]];
    uint64_t v77 = 0;
    id v78 = &v77;
    uint64_t v79 = 0x3032000000;
    id v80 = sub_100021C98;
    uint64_t v81 = sub_100021CA8;
    id v82 = 0;
    BOOL v32 = [v59 responseTime];
    unint64_t v33 = [v59 requestId];
    id v76 = 0;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100022DD0;
    v62[3] = &unk_1002B87B8;
    uint64_t v69 = &v90;
    unsigned __int8 v70 = &v96;
    v62[4] = self;
    id v34 = v59;
    id v63 = v34;
    id v64 = v55;
    uint64_t v71 = &v84;
    id v65 = v54;
    BOOL v74 = v31;
    id v66 = v56;
    BOOL v75 = a11;
    id v67 = v57;
    id v73 = v22;
    id v35 = v21;
    id v68 = v35;
    v72 = &v77;
    unint64_t v36 = [(KTContext *)self handleQueryResponse:v35 queryRequest:v58 receiptDate:v32 fetchId:v33 validateType:0 ktCapable:v53 error:&v76 transparentDataHandler:v62];
    id v37 = v76;

    if (a12)
    {
      id v38 = (void *)v78[5];
      if (v38) {
        *a12 = v38;
      }
    }
    if (a13)
    {
      unsigned __int8 v39 = (void *)v85[5];
      if (v39) {
        *a13 = v39;
      }
    }
    if (v36 == 2) {
      goto LABEL_12;
    }
    id v40 = [v58 data];
    [v34 setQueryRequest:v40];

    uint64_t v41 = [v35 data];
    [v34 setQueryResponse:v41];

    if (v36 != 1)
    {
LABEL_12:
      if (a14 && v37) {
        *a14 = v37;
      }
      id v61 = v37;
      unint64_t v42 = [(KTContext *)self writeResult:v36 request:v34 proof:0 replay:a11 error:&v61];
      id v43 = v61;

      v97[3] = v42;
      id v37 = v43;
    }
    else
    {
      unint64_t v42 = v97[3];
    }
    if (v42 == 1) {
      goto LABEL_20;
    }
    __int16 v44 = v91;
    if (a14)
    {
      id v45 = v91[5];
      if (v45)
      {
        *a14 = v45;
        unint64_t v42 = v97[3];
        __int16 v44 = v91;
      }
    }
    id v60 = v44[5];
    unint64_t v46 = [(KTContext *)self writeResult:v42 request:v34 proof:0 replay:a11 error:&v60];
    objc_storeStrong(v44 + 5, v60);
    v97[3] = v46;
    if (v46 == 1) {
LABEL_20:
    }
      [v34 setUnsigned:"verificationResult" value:1];
    id v47 = [(KTContext *)self dataStore];
    unsigned __int8 v48 = [v47 persistAndRefaultObject:v34 error:a14];

    if ((v48 & 1) == 0)
    {
      if (a14 && *a14)
      {
        id v49 = [(KTContext *)self dataStore];
        [v49 reportCoreDataPersistEventForLocation:@"validateSelfResponse" underlyingError:*a14];
      }
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B87D8);
      }
      id v50 = qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
      {
        if (a14) {
          id v51 = *a14;
        }
        else {
          id v51 = 0;
        }
        *(_DWORD *)buf = 138412290;
        id v101 = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "failed to save validate self with response: %@", buf, 0xCu);
      }
    }
    unint64_t v30 = v97[3];

    _Block_object_dispose(&v77, 8);
  }
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v96, 8);

  return v30;
}

- (unint64_t)validateSelfKTRequest:(id)a3 queryRequest:(id)a4 queryResponse:(id)a5 selfVerificationInfo:(id)a6 optInCheck:(BOOL)a7 cloudDevices:(id)a8 transparentData:(id *)a9 loggableDatas:(id *)a10 error:(id *)a11
{
  LOBYTE(v12) = 0;
  return [(KTContext *)self validateSelfKTRequest:a3 queryRequest:a4 queryResponse:a5 selfVerificationInfo:a6 optInCheck:a7 cloudDevices:a8 pcsAccountKey:0 kvsOptInHistory:0 isReplay:v12 transparentData:a9 loggableDatas:a10 error:a11];
}

- (void)recordEnrollOptInRecord:(id)a3 accountKey:(id)a4 transparentData:(id)a5 cloudOptIn:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [a5 accountOptInRecord:a4];
  id v13 = v12;
  if (v12)
  {
    id v14 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v12 timestampMs] / 1000.0);
    CFAbsoluteTime v15 = [(KTContext *)self applicationID];
    id v22 = 0;
    unsigned __int8 v16 = [v11 addOptInStateWithURI:v10 smtTimestamp:v14 application:v15 state:[v13 optIn] error:&v22];
    id v17 = v22;

    if ((v16 & 1) == 0)
    {
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B8818);
      }
      long long v18 = (void *)qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
      {
        long long v19 = v18;
        id v20 = [v14 kt_toISO_8601_UTCString];
        *(_DWORD *)buf = 141558786;
        uint64_t v24 = 1752392040;
        __int16 v25 = 2112;
        id v26 = v10;
        __int16 v27 = 2114;
        id v28 = v20;
        __int16 v29 = 2112;
        id v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to update cloud opt-in records for %{mask.hash}@ at %{public}@: %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B87F8);
    }
    id v21 = qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 141558274;
      uint64_t v24 = 1752392040;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to find optInOut record during enroll for %{mask.hash}@", buf, 0x16u);
    }
  }
}

- (unint64_t)validateEnrollKTRequest:(id)a3 insertResponse:(id)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 cloudOptIn:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v39 = a4;
  id v40 = a7;
  uint64_t v67 = 0;
  id v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 2;
  uint64_t v61 = 0;
  uint64_t v62 = (id *)&v61;
  uint64_t v63 = 0x3032000000;
  id v64 = sub_100021C98;
  id v65 = sub_100021CA8;
  id v66 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = sub_100021C98;
  id v59 = sub_100021CA8;
  id v60 = 0;
  id v54 = 0;
  unint64_t v15 = [(KTContext *)self deserializeServerLoggableDatas:v14 loggableDatas:&v54 error:a8];
  id v41 = v54;
  v68[3] = v15;
  if (v15 == 1)
  {
    id v38 = a8;
    unsigned __int8 v16 = a5;
    id v17 = a6;
    id v18 = [v14 getUnsigned:];
    long long v19 = [v14 uri];
    id v20 = [v14 requestId];
    id v53 = 0;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100023EF0;
    v44[3] = &unk_1002B88C0;
    id v49 = &v61;
    id v50 = &v67;
    v44[4] = self;
    id v21 = v14;
    id v45 = v21;
    id v22 = v41;
    id v46 = v22;
    id v52 = v18;
    id v47 = v39;
    id v48 = v40;
    id v51 = &v55;
    unint64_t v23 = [(KTContext *)self handleInsertResponse:v47 uri:v19 fetchId:v20 error:&v53 transparentDataHandler:v44];
    id v24 = v53;

    if (v16)
    {
      __int16 v25 = (void *)v56[5];
      if (v25) {
        id *v16 = v25;
      }
    }
    if (v17 && v22) {
      id *v17 = v22;
    }
    if (v23 == 1)
    {
      unint64_t v26 = v68[3];
    }
    else
    {
      if (v38 && v24) {
        id *v38 = v24;
      }
      id v43 = v24;
      unint64_t v26 = [(KTContext *)self writeResult:v23 request:v21 proof:0 error:&v43];
      id v27 = v43;

      v68[3] = v26;
      id v24 = v27;
    }
    if (v26 == 1) {
      goto LABEL_19;
    }
    id v28 = v62;
    if (v38)
    {
      id v29 = v62[5];
      if (v29)
      {
        id *v38 = v29;
        unint64_t v26 = v68[3];
        id v28 = v62;
      }
    }
    id obj = v28[5];
    unint64_t v30 = [(KTContext *)self writeResult:v26 request:v21 proof:0 error:&obj];
    objc_storeStrong(v28 + 5, obj);
    v68[3] = v30;
    if (v30 == 1) {
LABEL_19:
    }
      [v21 setUnsigned:"verificationResult" value:1];
    BOOL v31 = [(KTContext *)self dataStore];
    unsigned __int8 v32 = [v31 persistAndRefaultObject:v21 error:v38];

    unint64_t v33 = v38;
    if ((v32 & 1) == 0)
    {
      if (v38 && *v38)
      {
        id v34 = [(KTContext *)self dataStore];
        [v34 reportCoreDataPersistEventForLocation:@"validateEnrollKTRequest" underlyingError:*v38];

        unint64_t v33 = v38;
      }
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B88E0);
      }
      id v35 = qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
      {
        if (v33) {
          id v36 = *v33;
        }
        else {
          id v36 = 0;
        }
        *(_DWORD *)buf = 138412290;
        id v72 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "failed to save validate enrollment with response: %@", buf, 0xCu);
      }
    }
    unint64_t v15 = v68[3];
  }
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  return v15;
}

- (id)createQueryRequestForKTRequest:(id)a3 error:(id *)a4
{
  id v6 = [a3 uri];
  id v7 = [(KTContext *)self applicationID];
  id v12 = 0;
  id v8 = +[TransparencyRPCRequestBuilder buildQueryRequest:v6 application:v7 error:&v12];
  id v9 = v12;

  if (v8)
  {
    id v10 = v8;
  }
  else if (a4 && v9)
  {
    *a4 = v9;
  }

  return v8;
}

- (id)parseQueryRequestFromKTRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 queryRequest];

  if (v7)
  {
    id v8 = [v6 queryRequest];
    id v7 = +[TransparencyGPBMessage parseFromData:v8 error:a4];
  }
  id v9 = [v6 queryRequest];

  if (!v9 || v7)
  {
    if (v7)
    {
      id v14 = v7;
      goto LABEL_32;
    }
  }
  else
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8900);
    }
    id v10 = (id)qword_100326738;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v6 requestId];
      id v12 = (void *)v11;
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "parse saved queryRequest for requestId %{public}@ failed: %@", buf, 0x16u);
    }
  }
  [v6 setQueryRequest:0];
  [v6 setQueryResponse:0];
  [v6 setServerHint:0];
  [v6 setUsedReversePush:0];
  [v6 setResponseTime:0];
  unint64_t v15 = [(KTContext *)self dataStore];
  id v24 = 0;
  unsigned __int8 v16 = [v15 persistWithError:&v24];
  id v17 = v24;

  if ((v16 & 1) == 0)
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8920);
    }
    id v18 = qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to remove query request and response for unparseable request: %@", buf, 0xCu);
    }
    long long v19 = [(KTContext *)self dataStore];
    [v19 reportCoreDataPersistEventForLocation:@"verifyDeviceWitnesses" underlyingError:v17];
  }
  id v20 = [v6 queryRequest];

  if (v20)
  {
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-133 underlyingError:*a4 description:@"saved query request failed to decode"];
    }
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8940);
    }
    id v21 = qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v22 = *a4;
      }
      else {
        id v22 = 0;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = (uint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "saved query request failed to decode: %@", buf, 0xCu);
    }
  }

  id v14 = 0;
LABEL_32:

  return v14;
}

- (id)parseQueryResponseFromKTRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 queryResponse];

  if (v6)
  {
    id v7 = [v5 queryResponse];
    id v6 = +[TransparencyGPBMessage parseFromData:v7 error:a4];
  }
  id v8 = [v5 queryResponse];

  if (!v8 || v6)
  {
    if (v6)
    {
      id v13 = [v5 serverHint];

      if (v13)
      {
        id v14 = [v5 serverHint];
        [v6 setMetadataValue:v14 key:kTransparencyResponseMetadataKeyServerHint];
      }
      if ([v5 usedReversePush]) {
        [v6 setMetadataValue:@"YES" key:@"APS"];
      }
      unint64_t v15 = [v5 responseTime];

      if (v15)
      {
        unsigned __int8 v16 = [v5 responseTime];
        id v17 = [v16 kt_dateToString];
        [v6 setMetadataValue:v17 key:@"ResponseTime"];
      }
    }
  }
  else
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8960);
    }
    id v9 = (id)qword_100326738;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v5 requestId];
      uint64_t v11 = (void *)v10;
      if (a4) {
        id v12 = *a4;
      }
      else {
        id v12 = 0;
      }
      int v19 = 138543618;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "parse saved queryResponse as query response for requestId %{public}@ failed: %@", (uint8_t *)&v19, 0x16u);
    }
  }

  return v6;
}

- (void)fetchQueryForKTRequest:(id)a3 userInitiated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v27 = 0;
  uint64_t v10 = [(KTContext *)self createQueryRequestForKTRequest:v8 error:&v27];
  id v11 = v27;
  if (v10)
  {
    id v12 = [(KTContext *)self dataStore];
    id v13 = [v10 data];
    id v26 = v11;
    id v14 = [v12 createFetchRecordForRequestData:v13 request:v8 error:&v26];
    id v15 = v26;

    if (v14)
    {
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B89A0);
      }
      unsigned __int8 v16 = (void *)qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        id v18 = [v8 requestId];
        *(_DWORD *)buf = 138543618;
        id v29 = v18;
        __int16 v30 = 2114;
        BOOL v31 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetching query response for requestId %{public}@ with fetchId %{public}@", buf, 0x16u);
      }
      int v19 = [(KTContext *)self logClient];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10002505C;
      v22[3] = &unk_1002B8A50;
      v22[4] = self;
      id v23 = v14;
      id v25 = v9;
      id v24 = v10;
      [v19 fetchQuery:v24 uuid:v23 userInitiated:v6 completionHandler:v22];
    }
    else
    {
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B8980);
      }
      uint64_t v20 = qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to save query request before fetch: %@", buf, 0xCu);
      }
      __int16 v21 = [(KTContext *)self dataStore];
      [v21 reportCoreDataPersistEventForLocation:@"fetchQuery" underlyingError:v15];

      (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0, 0, 0, v15);
    }
  }
  else
  {
    (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0, 0, 0, v11);
    id v15 = v11;
  }
}

- (void)fetchQueryForKTRequest:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)peerStaticKeyFallback:(id)a3 accountKey:(id)a4 transparentData:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v23 = 0;
  unint64_t v10 = [(KTContext *)self validateStaticKeyForPeer:v8 accountKey:v9 error:&v23];
  id v11 = v23;
  if (qword_100326730 != -1) {
    dispatch_once(&qword_100326730, &stru_1002B8A70);
  }
  id v12 = qword_100326738;
  if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v8;
    __int16 v26 = 1024;
    int v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "validatePeer static key: %@ result: %d", buf, 0x12u);
  }
  if (!v10)
  {
    id v13 = objc_alloc_init(OptInOutWithExt);
    [(OptInOut *)v13 setOptIn:1];
    id v14 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
    [v14 timeIntervalSince1970];
    [(OptInOut *)v13 setTimestampMs:(unint64_t)(v15 * 1000.0)];

    unsigned __int8 v16 = [KTTransparentData alloc];
    id v17 = +[NSData data];
    id v18 = [(KTTransparentData *)v16 initWithUriVRFOutput:v17];

    [(KTTransparentData *)v18 setStaticKeyEnforced:1];
    int v19 = objc_alloc_init(KTAccount);
    [(KTAccount *)v19 setAccountKey:v9];
    uint64_t v20 = [(KTAccount *)v19 optInOutHistory];
    [v20 addObject:v13];

    __int16 v21 = [(KTTransparentData *)v18 accounts];
    [v21 addObject:v19];

    if (a5 && v18) {
      *a5 = v18;
    }
  }
  return v10 == 0;
}

- (void)fetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, unint64_t, id, id, id))a5;
  id v37 = 0;
  unsigned int v10 = [(KTContext *)self unsupported:&v37];
  id v11 = v37;
  id v12 = v11;
  if (!v10)
  {
    if (v6)
    {
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B8A90);
      }
      id v14 = qword_100326738;
      if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "client requested fresh KT data", buf, 2u);
      }
      double v15 = 0;
      unsigned __int8 v16 = 0;
    }
    else
    {
      id v35 = v11;
      double v15 = [(KTContext *)self parseQueryRequestFromKTRequest:v8 error:&v35];
      id v17 = v35;

      id v34 = v17;
      unsigned __int8 v16 = [(KTContext *)self parseQueryResponseFromKTRequest:v8 error:&v34];
      id v12 = v34;

      if (v16 && v15)
      {
        if (qword_100326730 != -1) {
          dispatch_once(&qword_100326730, &stru_1002B8B38);
        }
        id v18 = (void *)qword_100326738;
        if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = v18;
          uint64_t v20 = [v8 requestId];
          *(_DWORD *)buf = 138543362;
          id v39 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Using existing queryResponse in validatePeer for requestId %{public}@", buf, 0xCu);
        }
        id v30 = 0;
        id v31 = 0;
        id v29 = v12;
        unint64_t v21 = [(KTContext *)self validatePeerOrEnrollKTRequest:v8 queryRequest:v15 queryResponse:v16 transparentData:&v31 loggableDatas:&v30 error:&v29];
        id v22 = v31;
        id v23 = v30;
        id v24 = v29;

        v9[2](v9, v21, v22, v23, v24);
        id v12 = v24;
        goto LABEL_21;
      }
    }
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8AB0);
    }
    id v25 = (void *)qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEBUG))
    {
      __int16 v26 = v25;
      int v27 = [v8 requestId];
      id v28 = [v8 uri];
      *(_DWORD *)buf = 138543618;
      id v39 = v27;
      __int16 v40 = 2112;
      id v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "fetching query in validatePeer for requestId %{public}@ uri: %@", buf, 0x16u);
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100025D08;
    v32[3] = &unk_1002B8B18;
    v32[4] = self;
    unint64_t v33 = v9;
    [(KTContext *)self fetchQueryForKTRequest:v8 completionHandler:v32];

LABEL_21:
    goto LABEL_22;
  }
  id v36 = v11;
  [(KTContext *)self writeResult:0 request:v8 proof:0 error:&v36];
  id v13 = v36;

  v9[2](v9, 0, 0, 0, v13);
  id v12 = v13;
LABEL_22:
}

- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 fetchNow:(BOOL)a4 transparentData:(id *)a5 loggableDatas:(id *)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 2;
  uint64_t v43 = 0;
  __int16 v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = sub_100021C98;
  id v47 = sub_100021CA8;
  id v48 = 0;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  __int16 v40 = sub_100021C98;
  id v41 = sub_100021CA8;
  id v42 = 0;
  uint64_t v31 = 0;
  unsigned __int8 v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_100021C98;
  id v35 = sub_100021CA8;
  id v36 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002646C;
  v25[3] = &unk_1002B8B60;
  int v27 = &v43;
  id v28 = &v37;
  id v29 = &v31;
  id v30 = &v49;
  id v13 = dispatch_semaphore_create(0);
  __int16 v26 = v13;
  [(KTContext *)self fetchAndValidatePeerKTRequest:v12 fetchNow:v10 completionHandler:v25];
  dispatch_time_t v14 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    uint64_t v15 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-168 description:@"test timed out waiting for validatePeer"];
    unsigned __int8 v16 = (void *)v32[5];
    void v32[5] = v15;

    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8B80);
    }
    id v17 = qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "test timed out waiting for validatePeer", v24, 2u);
    }
    if (a7)
    {
      id v18 = (void *)v32[5];
      if (v18) {
        *a7 = v18;
      }
    }
    unint64_t v19 = 2;
  }
  else
  {
    if (a5)
    {
      uint64_t v20 = (void *)v44[5];
      if (v20) {
        *a5 = v20;
      }
    }
    if (a6)
    {
      unint64_t v21 = (void *)v38[5];
      if (v21) {
        *a6 = v21;
      }
    }
    if (a7)
    {
      id v22 = (void *)v32[5];
      if (v22) {
        *a7 = v22;
      }
    }
    unint64_t v19 = v50[3];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v19;
}

- (unint64_t)synchronousFetchAndValidatePeerKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 error:(id *)a6
{
  return [(KTContext *)self synchronousFetchAndValidatePeerKTRequest:a3 fetchNow:0 transparentData:a4 loggableDatas:a5 error:a6];
}

- (unint64_t)fetchAndValidateEnrollKTRequest:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if ([(KTContext *)self unsupported:a7])
  {
    [(KTContext *)self writeResult:0 request:v12 proof:0 error:a7];
    unint64_t v14 = 0;
    goto LABEL_26;
  }
  uint64_t v15 = [v12 queryResponse];
  if (v15)
  {
    unsigned __int8 v16 = (void *)v15;
    id v17 = [v12 queryRequest];

    if (!v17)
    {
      __int16 v26 = [v12 queryResponse];
      id v18 = +[TransparencyGPBMessage parseFromData:v26 error:a7];

      if (v18)
      {
        if (qword_100326730 != -1) {
          dispatch_once(&qword_100326730, &stru_1002B8C48);
        }
        int v27 = (void *)qword_100326738;
        if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = v27;
          id v29 = [v12 requestId];
          *(_DWORD *)buf = 138543362;
          uint64_t v37 = (uint64_t)v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "using existing insertResponse in validateEnrollment for requestId %{public}@", buf, 0xCu);
        }
        unint64_t v14 = [(KTContext *)self validateEnrollKTRequest:v12 insertResponse:v18 transparentData:a4 loggableDatas:a5 cloudOptIn:v13 error:a7];
        goto LABEL_25;
      }
      if (qword_100326730 != -1) {
        dispatch_once(&qword_100326730, &stru_1002B8BA0);
      }
      uint64_t v31 = (id)qword_100326738;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = [v12 requestId];
        uint64_t v33 = (void *)v32;
        if (a7) {
          id v34 = *a7;
        }
        else {
          id v34 = 0;
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v37 = v32;
        __int16 v38 = 2112;
        id v39 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "parse saved queryResponse as insert response for requestId %{public}@ failed: %@", buf, 0x16u);
      }
    }
  }
  id v18 = [(KTContext *)self parseQueryRequestFromKTRequest:v12 error:a7];
  unint64_t v19 = [(KTContext *)self parseQueryResponseFromKTRequest:v12 error:a7];
  if (v19 && v18)
  {
    if (qword_100326730 != -1) {
      dispatch_once(&qword_100326730, &stru_1002B8C28);
    }
    uint64_t v20 = (void *)qword_100326738;
    if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v21 = v20;
      id v22 = [v12 requestId];
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = (uint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "using existing queryResponse in validateEnrollment for requestId %{public}@", buf, 0xCu);
    }
    unint64_t v14 = [(KTContext *)self validatePeerOrEnrollKTRequest:v12 queryRequest:v18 queryResponse:v19 transparentData:a4 loggableDatas:a5 error:a7];

LABEL_25:
    goto LABEL_26;
  }
  if (qword_100326730 != -1) {
    dispatch_once(&qword_100326730, &stru_1002B8BC0);
  }
  id v23 = (void *)qword_100326738;
  if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEBUG))
  {
    id v24 = v23;
    id v25 = [v12 requestId];
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "fetching query in validateEnrollment for requestId %{public}@", buf, 0xCu);
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100026AE0;
  v35[3] = &unk_1002B8C08;
  v35[4] = self;
  [(KTContext *)self fetchQueryForKTRequest:v12 completionHandler:v35];

  if (a7)
  {
    *a7 = +[TransparencyError errorWithDomain:kTransparencyErrorUnknown code:-134 description:@"request to server pending"];
  }
  unint64_t v14 = 2;
LABEL_26:

  return v14;
}

- (void)validatePeerRequestId:(id)a3 revalidate:(BOOL)a4 fetchNow:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(KTContext *)self applicationID];
  id v13 = +[KTContext validateEventName:0 application:v12];

  unint64_t v14 = [(KTContext *)self dataStore];
  id v27 = 0;
  unint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  unint64_t v21 = sub_100026EE4;
  id v22 = &unk_1002B8C98;
  BOOL v25 = a4;
  id v23 = self;
  BOOL v26 = a5;
  id v15 = v10;
  id v24 = v15;
  unsigned __int8 v16 = [v14 performAndWaitForRequestId:v11 error:&v27 block:&v19];

  id v17 = v27;
  if ((v16 & 1) == 0)
  {
    id v18 = +[TransparencyAnalytics logger];
    [v18 logResultForEvent:v13 hardFailure:1 result:v17];

    (*((void (**)(id, void, id))v15 + 2))(v15, 0, v17);
  }
}

- (unint64_t)validateEnrollmentRequestId:(id)a3 transparentData:(id *)a4 loggableDatas:(id *)a5 cloudOptIn:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 2;
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = sub_100021C98;
  uint64_t v43 = sub_100021CA8;
  id v44 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_100021C98;
  uint64_t v37 = sub_100021CA8;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_100021C98;
  uint64_t v31 = sub_100021CA8;
  id v32 = 0;
  id v13 = [(KTContext *)self dataStore];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000273F8;
  v21[3] = &unk_1002B8CC0;
  id v23 = &v45;
  id v24 = &v39;
  v21[4] = self;
  BOOL v25 = &v33;
  id v14 = v12;
  id v22 = v14;
  BOOL v26 = &v27;
  LOBYTE(v12) = [v13 performAndWaitForRequestId:v11 error:a7 block:v21];

  if (v12)
  {
    if (a4)
    {
      id v15 = (void *)v40[5];
      if (v15) {
        *a4 = v15;
      }
    }
    if (a5)
    {
      unsigned __int8 v16 = (void *)v34[5];
      if (v16) {
        *a5 = v16;
      }
    }
    if (a7)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a7 = v17;
      }
    }
    unint64_t v18 = v46[3];
  }
  else
  {
    unint64_t v18 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v18;
}

- (void)replaySelfValidate:(id)a3 pcsAccountKey:(id)a4 queryRequest:(id)a5 queryResponse:(id)a6 responseTime:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v38 = a4;
  id v44 = a5;
  id v43 = a6;
  id v42 = a7;
  uint64_t v35 = (void (**)(id, uint64_t, id, void))a8;
  uint64_t v45 = v13;
  id v14 = [v13 syncedLoggableDatas];
  uint64_t v39 = +[TransparencyManagedDataStore serializeLoggableDatas:v14];

  __int16 v40 = +[NSMutableDictionary dictionary];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = [v13 uriToServerLoggableDatas];
  id v41 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v41)
  {
    uint64_t v37 = *(void *)v61;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v61 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v60 + 1) + 8 * (void)v15);
        id v17 = [v45 uriToServerLoggableDatas];
        unint64_t v18 = [v17 objectForKeyedSubscript:v16];

        unint64_t v19 = [v18 serverLoggableDatas];
        uint64_t v20 = +[TransparencyManagedDataStore serializeLoggableDatas:v19];

        unint64_t v21 = [(KTContext *)self dataStore];
        id v22 = [(KTContext *)self applicationID];
        id v23 = [v18 accountKey];
        id v24 = [v18 idsResponseTime];
        id v59 = 0;
        BOOL v25 = [v21 createRequestWithUri:v16 application:v22 accountKey:v23 serverData:v20 syncedData:v39 idsResponseTime:v24 queryRequest:v44 queryResponse:v43 responseDate:v42 type:1 clientId:0 error:&v59];
        id v26 = v59;

        if (qword_100326730 != -1) {
          dispatch_once(&qword_100326730, &stru_1002B8CE0);
        }
        uint64_t v27 = qword_100326738;
        if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "ReplaySelfValidate: created requestId %{public}@ for %@", buf, 0x16u);
        }
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v69 = sub_100021C98;
        uint64_t v70 = sub_100021CA8;
        id v71 = 0;
        id v71 = objc_alloc_init((Class)KTSelfValidationURIDiagnostics);
        id v28 = [(KTContext *)self dataStore];
        id v58 = 0;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100027B70;
        v47[3] = &unk_1002B8D48;
        id v48 = v44;
        id v29 = v25;
        uint64_t v57 = buf;
        id v49 = v29;
        id v50 = self;
        id v51 = v43;
        id v52 = v42;
        id v53 = v45;
        id v54 = v38;
        id v55 = v40;
        uint64_t v56 = v16;
        unsigned __int8 v30 = [v28 performAndWaitForRequestId:v29 error:&v58 block:v47];
        id v31 = v58;

        if ((v30 & 1) == 0)
        {
          if (qword_100326730 != -1) {
            dispatch_once(&qword_100326730, &stru_1002B8D68);
          }
          id v32 = qword_100326738;
          if (os_log_type_enabled((os_log_t)qword_100326738, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v64 = 138543618;
            id v65 = v29;
            __int16 v66 = 2112;
            id v67 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "ReplayValidateSelf: failed to find requestId %{public}@: %@", v64, 0x16u);
          }
          [*(id *)(*(void *)&buf[8] + 40) setResult:@"Failed"];
          [*(id *)(*(void *)&buf[8] + 40) setError:v31];
        }

        _Block_object_dispose(buf, 8);
        id v15 = (char *)v15 + 1;
      }
      while (v41 != v15);
      id v41 = [obj countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v41);
  }

  id v33 = objc_alloc_init((Class)KTSelfValidationDiagnostics);
  id v34 = [v45 diagnosticsJsonDictionary];
  [v33 setKtSelfVerificationInfoDiagnosticsJson:v34];

  [v33 setUriToDiagnostics:v40];
  v35[2](v35, 1, v33, 0);
}

+ (id)validateEventName:(unint64_t)a3 application:(id)a4
{
  id v5 = a4;
  if (a3 > 5) {
    CFStringRef v6 = @"ValidateUnknownCompleteEvent";
  }
  else {
    CFStringRef v6 = *(&off_1002BB2C8 + a3);
  }
  id v7 = +[TransparencyAnalytics formatEventName:v6 application:v5];

  return v7;
}

+ (id)successMetricsKey:(id)a3 validationName:(id)a4
{
  return +[NSString stringWithFormat:@"days%@Validation-%@", a4, a3];
}

+ (id)analyticsSuccessNames
{
  if (qword_1003267A0 != -1) {
    dispatch_once(&qword_1003267A0, &stru_1002BB1F0);
  }
  v2 = (void *)qword_1003267A8;

  return v2;
}

+ (id)successMetricsKey:(unint64_t)a3 forApplicationID:(id)a4
{
  id v5 = a4;
  if (a3 <= 6 && ((0x77u >> a3) & 1) != 0)
  {
    CFStringRef v6 = +[KTContext successMetricsKey:v5 validationName:*(&off_1002BB2F8 + a3)];
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

+ (void)metricsForResult:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 applicationID:(id)a6
{
  id v11 = a5;
  id v9 = +[KTContext successMetricsKey:a4 forApplicationID:a6];
  if (v9)
  {
    if (a3)
    {
      id v10 = v11;
      if (a3 != 1)
      {
LABEL_7:
        +[KTContext updateEligibilityThreshold:v10];
        goto LABEL_8;
      }
      [v11 setSuccessNowForPropertyKey:v9];
    }
    else
    {
      [v11 setFailureNowForPropertyKey:v9];
    }
    id v10 = v11;
    goto LABEL_7;
  }
LABEL_8:
}

+ (id)analyticsSelfFlagNames
{
  if (qword_1003267B0 != -1) {
    dispatch_once(&qword_1003267B0, &stru_1002BB210);
  }
  v2 = (void *)qword_1003267B8;

  return v2;
}

+ selfStatusFlagMetricsKey:(id)a3 name:(id)a4
{
  return +[NSString stringWithFormat:@"selfValidation-%@-%@", a4, a3];
}

- (void)selfValidationURIStatus:(id)a3 transparentData:(id)a4 selfDeviceID:(id)a5 logger:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[KTLoggableData isAccountKTCapable:v10];
  id v15 = objc_opt_class();
  uint64_t v16 = [(KTContext *)self applicationID];
  uint64_t v17 = [v15 selfStatusFlagMetricsKey:v16 name:@"ktCapable"];

  unint64_t v18 = +[NSNumber numberWithBool:v14];
  id v50 = (void *)v17;
  [v13 setNumberProperty:v18 forKey:v17];

  unint64_t v19 = objc_opt_class();
  uint64_t v20 = [(KTContext *)self applicationID];
  uint64_t v21 = [v19 selfStatusFlagMetricsKey:v20 name:@"optIn"];

  id v52 = v11;
  id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 verifiedAccountOptInState]);
  id v51 = v13;
  id v49 = (void *)v21;
  [v13 setNumberProperty:v22 forKey:v21];

  id v23 = objc_opt_class();
  uint64_t v47 = self;
  id v24 = [(KTContext *)self applicationID];
  id v48 = [v23 selfStatusFlagMetricsKey:v24 name:@"humbled"];

  BOOL v53 = v12 != 0;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v10;
  id v25 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = 0;
    char v28 = 0;
    uint64_t v29 = *(void *)v56;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v56 != v29) {
          objc_enumerationMutation(obj);
        }
        id v31 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v32 = [v31 version];
        if (v32
          && (id v33 = (void *)v32,
              [v31 version],
              id v34 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v35 = [v34 isEqual:&off_1002D9CC0],
              v34,
              v33,
              (v35 & 1) == 0))
        {
          if (!v27
            || ([v31 version],
                id v36 = objc_claimAutoreleasedReturnValue(),
                id v37 = [v27 compare:v36],
                v36,
                v37 == (id)1))
          {
            uint64_t v38 = [v31 version];

            uint64_t v27 = (void *)v38;
          }
        }
        else
        {
          char v28 = 1;
        }
        uint64_t v39 = [v31 deviceID];
        unsigned int v40 = [v12 isEqual:v39];

        if (v40)
        {
          if ([v31 result]) {
            int v41 = 3;
          }
          else {
            int v41 = 2;
          }
          BOOL v53 = v41;
        }
      }
      id v26 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v26);
  }
  else
  {
    uint64_t v27 = 0;
    char v28 = 0;
  }

  id v42 = +[NSNumber numberWithUnsignedInt:v53];
  [v51 setNumberProperty:v42 forKey:v48];

  if (v27)
  {
    if (v28)
    {
      uint64_t v43 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -(uint64_t)[v27 intValue]);

      uint64_t v27 = (void *)v43;
    }
    id v44 = objc_opt_class();
    uint64_t v45 = [(KTContext *)v47 applicationID];
    id v46 = [v44 selfStatusFlagMetricsKey:v45 name:@"OV"];

    [v51 setNumberProperty:v27 forKey:v46];
  }
}

- (void)reportValidationTime:(unint64_t)a3 initialResult:(unint64_t)a4 result:(unint64_t)a5 idsResponseTime:(id)a6
{
  if (a4 == 2 && a5 != 2)
  {
    id v9 = a6;
    double Current = CFAbsoluteTimeGetCurrent();
    [v9 timeIntervalSinceReferenceDate];
    double v12 = v11;

    double v13 = Current - v12;
    switch(a3)
    {
      case 0uLL:
        id v14 = [(KTContext *)self applicationID];
        CFStringRef v15 = @"ValidatePeerTime";
        break;
      case 1uLL:
        id v14 = [(KTContext *)self applicationID];
        CFStringRef v15 = @"ValidateSelfTime";
        break;
      case 2uLL:
        id v14 = [(KTContext *)self applicationID];
        CFStringRef v15 = @"ValidateEnrollmentTime";
        break;
      case 4uLL:
        id v14 = [(KTContext *)self applicationID];
        CFStringRef v15 = @"PeerV2Time";
        break;
      case 5uLL:
        id v14 = [(KTContext *)self applicationID];
        CFStringRef v15 = @"PeerV2OptInTime";
        break;
      default:
        id v14 = [(KTContext *)self applicationID];
        CFStringRef v15 = @"UnknownTypeTime";
        break;
    }
    id v18 = +[TransparencyAnalytics formatEventName:v15 application:v14];

    uint64_t v16 = +[TransparencyAnalytics logger];
    uint64_t v17 = +[NSNumber numberWithDouble:v13];
    [v16 logMetric:v17 withName:v18];
  }
}

+ (BOOL)hasAccountMismatch:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "successfulSync", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (id)serverLoggableDatasDiagnostics:(id)a3 selfPushToken:(id)a4 humbled:(BOOL *)a5
{
  id v25 = a5;
  id v6 = a3;
  id v7 = a4;
  long long v8 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    id obj = v9;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v15 = +[NSMutableDictionary dictionary];
        if (!v15)
        {
          id v9 = obj;

          goto LABEL_15;
        }
        uint64_t v16 = [v14 build];
        [v15 setObject:v16 forKeyedSubscript:@"b"];

        uint64_t v17 = [v14 product];
        [v15 setObject:v17 forKeyedSubscript:@"p"];

        id v18 = [v14 version];
        [v15 setObject:v18 forKeyedSubscript:@"v"];

        unint64_t v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 result]);
        [v15 setObject:v19 forKeyedSubscript:@"r"];

        if (v7
          && ([v14 deviceID],
              uint64_t v20 = objc_claimAutoreleasedReturnValue(),
              unsigned int v21 = [v20 isEqualToData:v7],
              v20,
              v21))
        {
          *id v25 = [v14 result] == 0;
          uint64_t v22 = 1;
        }
        else
        {
          uint64_t v22 = 0;
        }
        id v23 = +[NSNumber numberWithBool:v22];
        [v15 setObject:v23 forKeyedSubscript:@"c"];

        [v8 addObject:v15];
      }
      id v9 = obj;
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v15 = v8;
LABEL_15:

  return v15;
}

- (id)analyticsForType:(unint64_t)a3 uri:(id)a4 accountKey:(id)a5 serverLoggableDatas:(id)a6 syncedLoggableDatas:(id)a7 transparentData:(id)a8 selfVerificationInfo:(id)a9 responseTime:(id)a10 result:(unint64_t)a11 failure:(id)a12 responseMetadata:(id)a13
{
  id v70 = a4;
  id v18 = a5;
  id v74 = a6;
  id v19 = a7;
  id v20 = a8;
  id v71 = a10;
  id v76 = a12;
  id v75 = a13;
  id v68 = a9;
  unsigned int v21 = +[NSMutableDictionary dictionary];
  uint64_t v22 = [(KTContext *)self applicationKeyStore];
  id v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v22 inResetWindow]);
  [v21 setObject:v23 forKeyedSubscript:@"inResetWindow"];

  id v72 = self;
  id v24 = [(KTContext *)self optInServer];
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000534A8;
  v78[3] = &unk_1002BB238;
  id v25 = v21;
  id v79 = v25;
  [v24 getOptInState:1 completionBlock:v78];

  if (v20)
  {
    [v20 accountOptInState:v18];
    id v26 = KTOptInGetString();
    [v25 setObject:v26 forKeyedSubscript:@"peerOptIn"];

    [v20 accountEverOptedIn:v18];
    long long v27 = KTOptInGetString();
    [v25 setObject:v27 forKeyedSubscript:@"peerEverOptedIn"];

    [v20 accountRecentlyOptedIn:v18];
    long long v28 = KTOptInGetString();
    [v25 setObject:v28 forKeyedSubscript:@"peerRecentlyOptedIn"];

    long long v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 staticKeyEnforced]);
    [v25 setObject:v29 forKeyedSubscript:@"staticKeyEnforced"];

    long long v30 = [v20 expectedSelfResolutionDate:v18 requestDate:v71];
    id v31 = v30;
    if (v30)
    {
      uint64_t v32 = [v30 kt_dateToString];
      [v25 setObject:v32 forKeyedSubscript:@"expectedResolutionDate"];

      id v33 = [v31 kt_toISO_8601_UTCString];
      [v25 setObject:v33 forKeyedSubscript:@"expectedResolutionDateReadable"];

      [v31 timeIntervalSinceNow];
      unsigned __int8 v35 = +[NSNumber numberWithLong:llround(v34 / 86400.0)];
      [v25 setObject:v35 forKeyedSubscript:@"daysUntilExpectedResolutionDate"];
    }
    if (v18)
    {
      id v36 = [v20 getLogDataForAccountKey:v18 uri:v70];
      id v37 = [v36 objectForKeyedSubscript:v70];
      uint64_t v38 = [v37 lastObject];
      uint64_t v39 = v38;
      if (v38)
      {
        unsigned int v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v38 optIn]);
        [v25 setObject:v40 forKeyedSubscript:@"serverOptIn"];
      }
    }
  }
  int v41 = [v20 earliestAddedDate:v18];
  id v42 = v41;
  if (v41)
  {
    [v41 timeIntervalSince1970];
    double v44 = (double)(kKTMaximumResetFailureWindowMs + (unint64_t)(v43 * 1000.0));
    +[NSDate kt_currentTimeMs];
    id v46 = +[NSNumber numberWithBool:v45 < v44];
    [v25 setObject:v46 forKeyedSubscript:@"inHeartbeatWindow"];
  }
  uint64_t v47 = v74;
  if (v19 && !a11)
  {
    id v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [(id)objc_opt_class() hasAccountMismatch:v19]);
    [v25 setObject:v48 forKeyedSubscript:@"mismatchedAccounts"];
  }
  id v49 = +[KTLoggableData isAccountKTCapable:v74];
  if (v49)
  {
    BOOL v69 = 0;
  }
  else
  {
    BOOL v51 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || a3 == 5;
    BOOL v69 = v51;
  }
  if (v74)
  {
    if (!a11)
    {
      id v52 = +[NSNumber numberWithBool:v49];
      [v25 setObject:v52 forKeyedSubscript:@"ktCapable"];

      if (v69) {
        [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ktSoftFailure"];
      }
    }
  }
  BOOL v53 = +[TransparencyAnalytics analyticsErrorData:v76];
  [v25 setObject:v53 forKeyedSubscript:@"failure"];

  unsigned __int8 v77 = 0;
  id v54 = [v68 selfDeviceID];

  long long v55 = [(KTContext *)v72 serverLoggableDatasDiagnostics:v74 selfPushToken:v54 humbled:&v77];
  [v25 setObject:v55 forKeyedSubscript:@"sldd"];

  long long v56 = +[NSNumber numberWithBool:v77];
  [v25 setObject:v56 forKeyedSubscript:@"humbled"];

  if (a3 == 1 && [v76 code] == (id)-286)
  {
    long long v57 = +[TransparencyAnalytics logger];
    long long v58 = [v57 numberPropertyForKey:@"stateAtSigFetchStart"];
    [v25 setObject:v58 forKeyedSubscript:@"stateAtSigFetchStart"];

    id v59 = +[TransparencyAnalytics logger];
    long long v60 = [v59 numberPropertyForKey:@"stateAtSigFetchEnd"];
    [v25 setObject:v60 forKeyedSubscript:@"stateAtSigFetchEnd"];

    uint64_t v47 = v74;
  }
  if (+[TransparencyAnalytics hasInternalDiagnostics])
  {
    if (!a11)
    {
      [v25 setObject:v70 forKeyedSubscript:@"failedUri"];
      long long v61 = [v18 base64EncodedStringWithOptions:0];
      [v25 setObject:v61 forKeyedSubscript:@"failedAccountKey"];
    }
    uint64_t v62 = kTransparencyResponseMetadataKeyServerHint;
    long long v63 = [v75 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
    if (v63) {
      [v25 setObject:v63 forKeyedSubscript:v62];
    }
    id v64 = [v75 objectForKeyedSubscript:@"APS"];

    if (v64)
    {
      id v65 = +[NSNumber numberWithBool:1];
      [v25 setObject:v65 forKeyedSubscript:@"APS"];
    }
    uint64_t v47 = v74;
  }
  if (!v69 && !+[KTContext checkNetworkError:v76]) {
    [(KTContext *)v72 storeEligibilityMetric:a3 result:a11 error:v76];
  }
  id v66 = v25;

  return v66;
}

- (void)storeEligibilityMetric:(unint64_t)a3 result:(unint64_t)a4 error:(id)a5
{
  id v8 = a5;
  if (_os_feature_enabled_impl())
  {
    id v9 = [(KTContext *)self eligibilityQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000535EC;
    v10[3] = &unk_1002BB2A8;
    unint64_t v13 = a3;
    unint64_t v14 = a4;
    id v11 = v8;
    uint64_t v12 = self;
    dispatch_async(v9, v10);
  }
}

- (id)analyticsForResponse:(id)a3 type:(unint64_t)a4 uri:(id)a5 result:(unint64_t)a6 ktCapable:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  unint64_t v14 = +[NSMutableDictionary dictionary];
  id v15 = [(KTContext *)self applicationKeyStore];
  uint64_t v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 inResetWindow]);
  [v14 setObject:v16 forKeyedSubscript:@"inResetWindow"];

  if (a6)
  {
    +[TransparencyAnalytics hasInternalDiagnostics];
  }
  else
  {
    uint64_t v17 = +[NSNumber numberWithBool:v7];
    [v14 setObject:v17 forKeyedSubscript:@"ktCapable"];

    if (!v7 && a4 <= 5 && ((1 << a4) & 0x31) != 0) {
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"ktSoftFailure"];
    }
    if (+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics"))[v14 setObject:v13 forKeyedSubscript:@"failedUri"]; {
  }
    }
  uint64_t v18 = kTransparencyResponseMetadataKeyServerHint;
  id v19 = [v12 objectForKeyedSubscript:kTransparencyResponseMetadataKeyServerHint];
  if (v19) {
    [v14 setObject:v19 forKeyedSubscript:v18];
  }
  id v20 = [v12 objectForKeyedSubscript:@"APS"];

  if (v20)
  {
    unsigned int v21 = +[NSNumber numberWithBool:1];
    [v14 setObject:v21 forKeyedSubscript:@"APS"];
  }

  return v14;
}

+ (void)checkAndLogHardErrorIfNecessary:(unint64_t)a3 type:(unint64_t)a4 logger:(id)a5 error:(id)a6 applicationID:(id)a7
{
  id v15 = a5;
  id v11 = a6;
  id v12 = a7;
  if (a4 == 1)
  {
    if (a3)
    {
      unint64_t v13 = a3;
      id v14 = v15;
    }
    else
    {
      if (+[KTContext checkNetworkError:v11]) {
        goto LABEL_7;
      }
      unint64_t v13 = 0;
      id v14 = v15;
    }
    +[KTContext metricsForResult:v13 type:6 logger:v14 applicationID:v12];
  }
LABEL_7:
}

+ (BOOL)checkNetworkError:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = [v4 domain];
  if ([v5 isEqual:kTransparencyErrorNetwork]) {
    goto LABEL_15;
  }
  id v6 = [v4 domain];
  if ([v6 isEqual:NSURLErrorDomain])
  {
LABEL_14:

LABEL_15:
LABEL_16:
    BOOL v11 = 1;
    goto LABEL_18;
  }
  BOOL v7 = [v4 domain];
  if ([v7 isEqual:kCFErrorDomainCFNetwork])
  {
LABEL_13:

    goto LABEL_14;
  }
  id v8 = [v4 domain];
  if ([v8 isEqual:kTransparencyErrorInternal] && objc_msgSend(v4, "code") == (id)-343)
  {
LABEL_12:

    goto LABEL_13;
  }
  id v9 = [v4 domain];
  if ([v9 isEqual:kTransparencyErrorInterface] && objc_msgSend(v4, "code") == (id)-41)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v10 = [v4 domain];
  if ([v10 isEqual:kTransparencyErrorIDSRegistrationTimeout])
  {

    goto LABEL_11;
  }
  unint64_t v13 = [v4 domain];
  unsigned __int8 v14 = [v13 isEqual:kTransparencyErrorBAACertFetch];

  if (v14) {
    goto LABEL_16;
  }
  id v15 = [v4 userInfo];
  id v16 = [v15 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if ([a1 checkNetworkError:v16])
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v17 = [v4 userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:NSMultipleUnderlyingErrorsKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v26;
        while (2)
        {
          id v23 = 0;
          id v24 = v16;
          do
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v19);
            }
            id v16 = *(id *)(*((void *)&v25 + 1) + 8 * (void)v23);

            if (objc_msgSend(a1, "checkNetworkError:", v16, (void)v25))
            {
              BOOL v11 = 1;
              goto LABEL_34;
            }
            id v23 = (char *)v23 + 1;
            id v24 = v16;
          }
          while (v21 != v23);
          id v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      BOOL v11 = 0;
      id v16 = 0;
LABEL_34:
    }
    else
    {
      BOOL v11 = 0;
    }
  }
LABEL_18:

  return v11;
}

+ (BOOL)hasReachedEligibilityThreshold:(id)a3
{
  uint64_t v3 = eligibilityKey;
  id v4 = a3;
  uint64_t v5 = [v4 numberPropertyForKey:v3];
  unsigned __int8 v6 = [v5 BOOLValue];

  BOOL v7 = [v4 numberPropertyForKey:eligibilityVersionKey];

  id v8 = [v7 longValue];
  uint64_t v9 = ktEligibilityAnalyticsVersion;

  if ((uint64_t)v8 >= v9) {
    return v6;
  }
  else {
    return 0;
  }
}

+ (BOOL)isCurrentlyEligible:(id)a3
{
  uint64_t v3 = kKTApplicationIdentifierIDS;
  id v4 = a3;
  uint64_t v5 = +[KTContext successMetricsKey:1 forApplicationID:v3];
  unsigned __int8 v6 = +[KTContext successMetricsKey:4 forApplicationID:v3];
  BOOL v7 = [v4 fuzzyTimeSinceLastSuccess:v5];
  id v8 = [v7 longValue];
  uint64_t v9 = ktSelfValidateSuccessDays;

  uint64_t v10 = [v4 fuzzyTimeSinceLastSuccess:v6];
  id v11 = [(id)v10 longValue];
  uint64_t v12 = ktPeerValidateSuccessDays;

  LODWORD(v10) = [v4 manateeStatusForReporting];
  unsigned int v13 = (v10 < 0x18) & (0x804001u >> v10);
  if ((uint64_t)v11 < v12) {
    LOBYTE(v13) = 0;
  }
  if ((uint64_t)v8 >= v9) {
    BOOL v14 = v13;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

+ (void)updateEligibilityThreshold:(id)a3
{
  id v4 = a3;
  if (!+[KTContext hasReachedEligibilityThreshold:](KTContext, "hasReachedEligibilityThreshold:")
    && +[KTContext isCurrentlyEligible:v4])
  {
    [v4 setNumberProperty:&__kCFBooleanTrue forKey:eligibilityKey];
    uint64_t v3 = +[NSNumber numberWithLongLong:ktEligibilityAnalyticsVersion];
    [v4 setNumberProperty:v3 forKey:eligibilityVersionKey];
  }
}

- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7
{
  BOOL v27 = a4;
  id v11 = a3;
  id v12 = a5;
  id v28 = a6;
  unsigned int v13 = (void (**)(id, void *, id))a7;
  if (v12)
  {
    BOOL v14 = [(KTContext *)self dataStore];
    id v15 = [v11 uri];
    id v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 application]);
    uint64_t v17 = +[TransparencyApplication applicationIdentifierForValue:v16];
    id v47 = 0;
    uint64_t v18 = [v14 getLatestSuccessfulSingleQueryForUri:v15 application:v17 requestYoungerThan:v12 error:&v47];
    id v19 = v47;

    if (v18)
    {
      v13[2](v13, v18, v19);

      goto LABEL_14;
    }
  }
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  double v44 = sub_10005F478;
  double v45 = sub_10005F488;
  id v46 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_10005F478;
  uint64_t v39 = sub_10005F488;
  id v40 = 0;
  id v20 = [(KTContext *)self dataStore];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10005F490;
  v30[3] = &unk_1002BBF80;
  id v33 = &v35;
  v30[4] = self;
  id v21 = v11;
  id v31 = v21;
  id v32 = v28;
  double v34 = &v41;
  [v20 performBlockAndWait:v30];

  if (v36[5] && !v42[5])
  {
    long long v25 = [(KTContext *)self logClient];
    uint64_t v26 = v36[5];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005F55C;
    v29[3] = &unk_1002BBFE8;
    v29[5] = &v41;
    v29[6] = &v35;
    v29[4] = self;
    [v25 fetchQuery:v21 uuid:v26 userInitiated:v27 completionHandler:v29];

    v13[2](v13, (void *)v36[5], (id)v42[5]);
  }
  else
  {
    if (qword_100326830 != -1) {
      dispatch_once(&qword_100326830, &stru_1002BBFA0);
    }
    uint64_t v22 = qword_100326838;
    if (os_log_type_enabled((os_log_t)qword_100326838, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v42[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "failed to save single query rpc before fetch: %@", buf, 0xCu);
    }
    id v24 = [(KTContext *)self dataStore];
    [v24 reportCoreDataPersistEventForLocation:@"fetchRPCSingleQuery" underlyingError:v42[5]];

    v13[2](v13, 0, (id)v42[5]);
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

LABEL_14:
}

- (void)fetchRPCSingleQuery:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6
{
}

- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 backgroundOpId:(id)a6 completionHandler:(id)a7
{
  BOOL v26 = a4;
  id v11 = a3;
  id v28 = a5;
  id v27 = a6;
  long long v25 = (void (**)(id, void))a7;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = sub_10005F478;
  uint64_t v41 = sub_10005F488;
  id v42 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v16 = [(KTContext *)self dataStore];
        uint64_t v17 = [(KTContext *)self applicationID];
        uint64_t v18 = (id *)(v38 + 5);
        id v32 = (id)v38[5];
        unsigned int v19 = [v16 hasPendingSingleQueryForUri:v15 application:v17 error:&v32];
        objc_storeStrong(v18, v32);

        if (v19)
        {
          if (qword_100326830 != -1) {
            dispatch_once(&qword_100326830, &stru_1002BC008);
          }
          id v20 = qword_100326838;
          if (os_log_type_enabled((os_log_t)qword_100326838, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v44 = 1752392040;
            __int16 v45 = 2112;
            uint64_t v46 = v15;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "queryForUris: skipping fetch for %{mask.hash}@ due to existing pending query", buf, 0x16u);
          }
        }
        else
        {
          if (qword_100326830 != -1) {
            dispatch_once(&qword_100326830, &stru_1002BC028);
          }
          id v21 = qword_100326838;
          if (os_log_type_enabled((os_log_t)qword_100326838, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 141558274;
            uint64_t v44 = 1752392040;
            __int16 v45 = 2112;
            uint64_t v46 = v15;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "queryForUris: fetching rpc for uri %{mask.hash}@", buf, 0x16u);
          }
          uint64_t v22 = [(KTContext *)self applicationID];
          uint64_t v23 = (id *)(v38 + 5);
          id v31 = (id)v38[5];
          id v24 = +[TransparencyRPCRequestBuilder buildQueryRequest:v15 application:v22 error:&v31];
          objc_storeStrong(v23, v31);

          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10005FD40;
          v30[3] = &unk_1002BC090;
          v30[4] = v15;
          void v30[5] = &v37;
          [(KTContext *)self fetchRPCSingleQuery:v24 userInitiated:v26 cachedYoungerThan:v28 backgroundOpId:v27 completionHandler:v30];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
    }
    while (v12);
  }

  v25[2](v25, v38[5]);
  _Block_object_dispose(&v37, 8);
}

- (void)queryForUris:(id)a3 userInitiated:(BOOL)a4 cachedYoungerThan:(id)a5 completionHandler:(id)a6
{
}

- (void)optInStateForUri:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(KTContext *)self applicationID];
  uint64_t v9 = +[TransparencyApplication addApplicationPrefixForIdentifier:v8 uri:v6];

  uint64_t v10 = [(KTContext *)self applicationID];
  id v23 = 0;
  id v11 = +[TransparencyRPCRequestBuilder buildQueryRequest:v9 application:v10 error:&v23];
  id v12 = v23;

  if (v11)
  {
    if (qword_100326830 != -1) {
      dispatch_once(&qword_100326830, &stru_1002BC0D0);
    }
    uint64_t v13 = qword_100326838;
    if (os_log_type_enabled((os_log_t)qword_100326838, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 141558274;
      *(void *)&uint8_t buf[4] = 1752392040;
      __int16 v25 = 2112;
      BOOL v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "optInStateForUri: querying KT server opt-in state for %{mask.hash}@", buf, 0x16u);
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    BOOL v14 = +[NSUUID UUID];
    uint64_t v15 = [(KTContext *)self logClient];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10006035C;
    v18[3] = &unk_1002BC180;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v7;
    id v19 = v11;
    id v16 = v14;
    id v20 = v16;
    [v15 fetchQuery:v19 uuid:v16 userInitiated:0 completionHandler:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (qword_100326830 != -1) {
      dispatch_once(&qword_100326830, &stru_1002BC0B0);
    }
    uint64_t v17 = qword_100326838;
    if (os_log_type_enabled((os_log_t)qword_100326838, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "optInStateForUri: failed to check opt-in, no query request: %@", buf, 0xCu);
    }
    (*((void (**)(id, uint64_t, id))v7 + 2))(v7, 2, v12);
  }
}

+ (id)chunkArray:(id)a3 chunkSize:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)[v5 count] / a4 + 1);
    if ([v6 count])
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        id v10 = [v6 count];
        if ((unint64_t)v10 + v8 >= a4) {
          unint64_t v11 = a4;
        }
        else {
          unint64_t v11 = (unint64_t)v10 + v8;
        }
        id v12 = [v6 subarrayWithRange:v9, v11];
        [v7 addObject:v12];

        v9 += a4;
        v8 -= a4;
      }
      while (v9 < (unint64_t)[v6 count]);
    }
  }
  else
  {
    uint64_t v13 = +[NSArray arrayWithArray:v5];
    id v7 = +[NSArray arrayWithObject:v13];
  }

  return v7;
}

- (BOOL)verifyInclusionProofDownload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100071B04;
  id v24 = sub_100071B14;
  id v25 = 0;
  id v7 = [(KTContext *)self dataStore];
  uint64_t v18 = &v20;
  id v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100071B1C;
  v15[3] = &unk_1002BCF60;
  uint64_t v17 = &v26;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  unsigned __int8 v9 = [v7 performAndWaitForDownloadId:v8 error:&v19 block:v15];
  id v10 = v19;

  if (v9)
  {
    if (a4)
    {
      unint64_t v11 = (void *)v21[5];
      if (v11) {
        *a4 = v11;
      }
    }
    BOOL v12 = *((unsigned char *)v27 + 24) != 0;
  }
  else
  {
    if (qword_100326850 != -1) {
      dispatch_once(&qword_100326850, &stru_1002BCF80);
    }
    uint64_t v13 = qword_100326858;
    if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to fetch download record for downloadId %{public}@: %@", buf, 0x16u);
    }
    BOOL v12 = 0;
    if (a4 && v10)
    {
      BOOL v12 = 0;
      *a4 = v10;
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (BOOL)verifyInclusionProofDownloadRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [RevisionLogInclusionProofResponse alloc];
  id v8 = [v6 response];
  unsigned __int8 v9 = [(TransparencyGPBMessage *)v7 initWithData:v8 error:a4];

  id v10 = [v6 serverHint];

  [(RevisionLogInclusionProofResponse *)v9 setMetadataValue:v10 key:kTransparencyResponseMetadataKeyServerHint];
  if (!v9)
  {
    if (qword_100326850 != -1) {
      dispatch_once(&qword_100326850, &stru_1002BCFC0);
    }
    BOOL v14 = qword_100326858;
    if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v15 = *a4;
      }
      else {
        id v15 = 0;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "response failed to parse: %@", buf, 0xCu);
    }
    goto LABEL_24;
  }
  if ([(RevisionLogInclusionProofResponse *)v9 status] != 1)
  {
    id v16 = +[TransparencyError errorWithDomain:kTransparencyErrorServer, (int)[(RevisionLogInclusionProofResponse *)v9 status], @"server failed to produce inclusion proof: %d", [(RevisionLogInclusionProofResponse *)v9 status] code description];
    uint64_t v17 = v16;
    if (a4 && v16) {
      *a4 = v16;
    }

    goto LABEL_24;
  }
  unint64_t v11 = [(KTContext *)self verifier];
  unsigned __int8 v12 = [v11 verifyRevisionLogInclusionProofResponse:v9 receivedRevisions:0 error:a4];

  if ((v12 & 1) == 0)
  {
    if (qword_100326850 != -1) {
      dispatch_once(&qword_100326850, &stru_1002BCFA0);
    }
    uint64_t v18 = (id)qword_100326858;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(KTContext *)self applicationID];
      uint64_t v20 = (void *)v19;
      if (a4) {
        id v21 = *a4;
      }
      else {
        id v21 = 0;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Inclusion proof response verification failed for %{public}@: %@", buf, 0x16u);
    }
LABEL_24:
    BOOL v13 = 0;
    goto LABEL_25;
  }
  BOOL v13 = 1;
LABEL_25:

  return v13;
}

- (unint64_t)verifyConsistencyProofDownload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 2;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100071B04;
  uint64_t v24 = sub_100071B14;
  id v25 = 0;
  id v7 = [(KTContext *)self dataStore];
  uint64_t v18 = &v20;
  id v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100072528;
  v15[3] = &unk_1002BCF60;
  uint64_t v17 = &v26;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  unsigned __int8 v9 = [v7 performAndWaitForDownloadId:v8 error:&v19 block:v15];
  id v10 = v19;

  if (v9)
  {
    if (a4)
    {
      unint64_t v11 = (void *)v21[5];
      if (v11) {
        *a4 = v11;
      }
    }
    unint64_t v12 = v27[3];
  }
  else
  {
    if (qword_100326850 != -1) {
      dispatch_once(&qword_100326850, &stru_1002BD040);
    }
    BOOL v13 = qword_100326858;
    if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "failed to fetch download record for downloadId %{public}@: %@", buf, 0x16u);
    }
    unint64_t v12 = 0;
    if (a4 && v10)
    {
      unint64_t v12 = 0;
      *a4 = v10;
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (unint64_t)verifyConsistencyProofDownloadRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [ConsistencyProofResponse alloc];
  id v8 = [v6 response];
  unsigned __int8 v9 = [(TransparencyGPBMessage *)v7 initWithData:v8 error:a4];

  id v10 = [v6 serverHint];
  [(ConsistencyProofResponse *)v9 setMetadataValue:v10 key:kTransparencyResponseMetadataKeyServerHint];

  if (v9)
  {
    if ([(ConsistencyProofResponse *)v9 status] == 1)
    {
      unint64_t v11 = [(KTContext *)self verifier];
      id v12 = [v11 verifyConsistencyProofResponse:v9 startRevision:[v6 startSLHRevision] receivedRevisions:0 error:a4];

      if (v12) {
        goto LABEL_27;
      }
      if (qword_100326850 != -1) {
        dispatch_once(&qword_100326850, &stru_1002BD060);
      }
      BOOL v13 = (id)qword_100326858;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [(KTContext *)self applicationID];
        id v15 = (void *)v14;
        if (a4) {
          id v16 = *a4;
        }
        else {
          id v16 = 0;
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v14;
        __int16 v30 = 2112;
        id v31 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Consistency proof response verification failed for %{public}@: %@", buf, 0x16u);
      }
    }
    else
    {
      id v19 = +[TransparencyError errorWithDomain:kTransparencyErrorServer, (int)[(ConsistencyProofResponse *)v9 status], @"server failed to produce consistency proof: %d", [(ConsistencyProofResponse *)v9 status] code description];
      BOOL v13 = v19;
      if (a4 && v19) {
        *a4 = v19;
      }
      if (qword_100326850 != -1) {
        dispatch_once(&qword_100326850, &stru_1002BD080);
      }
      uint64_t v20 = (void *)qword_100326858;
      if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
      {
        id v21 = v20;
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = [(ConsistencyProofResponse *)v9 status];
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "server failed to produce consistency proof: %d", buf, 8u);
      }
    }
  }
  else
  {
    if (qword_100326850 != -1) {
      dispatch_once(&qword_100326850, &stru_1002BD0A0);
    }
    uint64_t v17 = qword_100326858;
    if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v18 = *a4;
      }
      else {
        id v18 = 0;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "response failed to parse: %@", buf, 0xCu);
    }
  }
  id v12 = 0;
LABEL_27:
  if (qword_100326850 != -1) {
    dispatch_once(&qword_100326850, &stru_1002BD0C0);
  }
  uint64_t v22 = (void *)qword_100326858;
  if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = v22;
    uint64_t v24 = [v6 downloadId];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = (uint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "deleting download record %{public}@", buf, 0xCu);
  }
  id v25 = [(KTContext *)self logClient];
  uint64_t v26 = [v6 downloadId];
  [v25 deleteDownloadId:v26];

  return (unint64_t)v12;
}

- (id)retrieveTLTSTH:(id *)a3
{
  id v5 = [(KTContext *)self dataStore];
  uint64_t v6 = kKTApplicationIdentifierTLT;
  id v7 = [(KTContext *)self applicationKeyStore];
  id v8 = [v5 latestConsistencyVerifiedTreeHeadSTH:v6 logBeginMs:objc_msgSend(v7, "tltLogBeginningMs") error:a3];

  if (v8)
  {
    unsigned __int8 v9 = objc_alloc_init(Gossip);
    id v10 = [(KTContext *)self applicationKeyStore];
    -[Gossip setVersion:](v9, "setVersion:", [v10 tltEarliestVersion]);

    [(Gossip *)v9 setSth:v8];
    unint64_t v11 = [(TransparencyGPBMessage *)v9 data];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)parseSTHData:(id)a3 error:(id *)a4
{
  return +[SignedObjectHolder parseFromData:a3 error:a4];
}

- (void)analyticsForDecodeFailure:(id)a3 error:(id)a4
{
  uint64_t v4 = kKTApplicationIdentifierTLT;
  id v5 = a4;
  id v7 = +[TransparencyAnalytics formatEventName:@"GossipDecodeMessageFailure" application:v4];
  uint64_t v6 = +[TransparencyAnalytics logger];
  [v6 logResultForEvent:v7 hardFailure:1 result:v5];
}

- (void)analyticsForUnsupportedProtocol:(int)a3 expected:(int)a4 sth:(id)a5
{
  uint64_t v5 = kTransparencyErrorGossip;
  uint64_t v6 = +[NSString stringWithFormat:@"Unsupported protocol version, message version %d, expected version: %d, sth: %@", *(void *)&a3, *(void *)&a4, a5];
  id v9 = +[TransparencyError errorWithDomain:v5, -276, @"%@", v6 code description];

  id v7 = +[TransparencyAnalytics formatEventName:@"GossipUnsupportedProtocol" application:kKTApplicationIdentifierTLT];
  id v8 = +[TransparencyAnalytics logger];
  [v8 logResultForEvent:v7 hardFailure:1 result:v9];
}

- (void)analyticsForParseFailure:(id)a3
{
  uint64_t v3 = kKTApplicationIdentifierTLT;
  id v4 = a3;
  id v6 = +[TransparencyAnalytics formatEventName:@"GossipParseFailure" application:v3];
  uint64_t v5 = +[TransparencyAnalytics logger];
  [v5 logResultForEvent:v6 hardFailure:1 result:v4];
}

- (void)analyticsForPredateLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5
{
  uint64_t v5 = kTransparencyErrorGossip;
  id v6 = +[NSString stringWithFormat:@"STH predates our TLT's LogBeginningMs, gossiped loghead logBeginningMs %llu, expected logBeginningMs: %llu, sth: %@", a3, a4, a5];
  id v9 = +[TransparencyError errorWithDomain:v5, -277, @"%@", v6 code description];

  id v7 = +[TransparencyAnalytics formatEventName:@"GossipOldLogBeginningMS" application:kKTApplicationIdentifierTLT];
  id v8 = +[TransparencyAnalytics logger];
  [v8 logResultForEvent:v7 hardFailure:1 result:v9];
}

- (void)analyticsForTooNewLogBeginningMs:(unint64_t)a3 expectedLogBeginningMS:(unint64_t)a4 sth:(id)a5
{
  uint64_t v5 = kTransparencyErrorGossip;
  id v6 = +[NSString stringWithFormat:@"Received gossip from a newer client.  Gossiped logBeginningsMs: %llu, client logBeginningsMs: %llu", a4, a5, a3, a4];
  id v9 = +[TransparencyError errorWithDomain:v5, -279, @"%@", v6 code description];

  id v7 = +[TransparencyAnalytics formatEventName:@"GossipLogBeginningMSTooNew" application:kKTApplicationIdentifierTLT];
  id v8 = +[TransparencyAnalytics logger];
  [v8 logResultForEvent:v7 hardFailure:1 result:v9];
}

- (void)processSTHsFromPeers:(id)a3 verifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v81 = a4;
  id v80 = a5;
  id v82 = +[NSMutableArray array];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v10)
  {
    id v11 = v10;
    id v12 = 0;
    p_cache = TransparencyGPBFloatValue.cache;
    uint64_t v14 = *(void *)v94;
    int v89 = kTransparencyProtocolVersion;
    uint64_t v84 = kTransparencyErrorGossip;
    id v87 = v9;
    uint64_t v88 = *(void *)v94;
    while (1)
    {
      id v15 = 0;
      do
      {
        id v16 = v12;
        if (*(void *)v94 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v93 + 1) + 8 * (void)v15);
        id v18 = objc_alloc((Class)(p_cache + 408));
        id v92 = v12;
        id v19 = [v18 initWithData:v17 error:&v92];
        id v12 = v92;

        if (v19) {
          BOOL v20 = v12 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20)
        {
          if ((int)[v19 version] <= v89)
          {
            signed int v28 = [v19 version];
            uint64_t v29 = [(KTContext *)self applicationKeyStore];
            signed int v30 = [v29 tltEarliestVersion];

            if (v28 >= v30)
            {
              uint64_t v41 = [v19 sth];
              id v91 = 0;
              id v42 = [(KTContext *)self parseSTHData:v41 error:&v91];
              id v43 = v91;

              if (v42 && !v43)
              {
                uint64_t v44 = [v42 parsedLogHead];
                __int16 v45 = v44;
                if (v44)
                {
                  id v46 = [v44 logBeginningMs];
                  id v47 = [(KTContext *)self applicationKeyStore];
                  id v48 = [v47 tltLogBeginningMs];

                  if (v46 < v48)
                  {
                    if (qword_100326850 != -1) {
                      dispatch_once(&qword_100326850, &stru_1002BD180);
                    }
                    id v85 = v42;
                    uint64_t v49 = (void *)qword_100326858;
                    if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
                    {
                      id v50 = v49;
                      id v83 = [v45 logBeginningMs];
                      BOOL v51 = [(KTContext *)self applicationKeyStore];
                      id v52 = [v51 tltLogBeginningMs];
                      BOOL v53 = [v19 sth];
                      *(_DWORD *)buf = 134218498;
                      *(void *)uint64_t v98 = v83;
                      *(_WORD *)&v98[8] = 2048;
                      *(void *)uint64_t v99 = v52;
                      *(_WORD *)&v99[8] = 2112;
                      v100 = v53;
                      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "STH predates our TLT's LogBeginningMs, gossiped loghead logBeginningMs %llu, expected logBeginningMs: %llu, sth: %@", buf, 0x20u);
                    }
                    id v54 = [v45 logBeginningMs];
                    long long v55 = [(KTContext *)self applicationKeyStore];
                    id v56 = [v55 tltLogBeginningMs];
                    [v19 sth];
                    v58 = long long v57 = v45;
                    [(KTContext *)self analyticsForPredateLogBeginningMs:v54 expectedLogBeginningMS:v56 sth:v58];

                    __int16 v45 = v57;
                    id v43 = 0;
                    id v9 = v87;
                    p_cache = (void **)(TransparencyGPBFloatValue + 16);
                    id v42 = v85;
LABEL_54:

LABEL_55:
                    uint64_t v14 = v88;
                    goto LABEL_56;
                  }
                  uint64_t v86 = v45;
                  id v62 = [v45 logBeginningMs];
                  long long v63 = [(KTContext *)self applicationKeyStore];
                  id v64 = [v63 tltLogBeginningMs];

                  if (v62 <= v64)
                  {
                    id v76 = [v19 sth];
                    [v82 addObject:v76];

                    id v43 = 0;
                    id v9 = v87;
                    p_cache = (void **)(TransparencyGPBFloatValue + 16);
                    __int16 v45 = v86;
                    goto LABEL_54;
                  }
                  if (qword_100326850 != -1) {
                    dispatch_once(&qword_100326850, &stru_1002BD1A0);
                  }
                  id v65 = (void *)qword_100326858;
                  if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_INFO))
                  {
                    id v66 = v65;
                    id v67 = [v86 logBeginningMs];
                    id v68 = [(KTContext *)self applicationKeyStore];
                    id v69 = [v68 tltLogBeginningMs];
                    *(_DWORD *)buf = 134218240;
                    *(void *)uint64_t v98 = v67;
                    *(_WORD *)&v98[8] = 2048;
                    *(void *)uint64_t v99 = v69;
                    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Received gossip from a newer client.  Gossiped logBeginningsMs: %llu, client logBeginningsMs: %llu", buf, 0x16u);
                  }
                  id v70 = [v86 logBeginningMs];
                  id v71 = [(KTContext *)self applicationKeyStore];
                  id v72 = [v71 tltLogBeginningMs];
                  id v73 = [v19 sth];
                  [(KTContext *)self analyticsForTooNewLogBeginningMs:v70 expectedLogBeginningMS:v72 sth:v73];

                  id v74 = [(KTContext *)self verifier];
                  id v75 = [v42 signedObject];
                  [v74 checkHeadEpoch:v75];

                  __int16 v45 = v86;
                  id v43 = 0;
                }
                else
                {
                  if (qword_100326850 != -1) {
                    dispatch_once(&qword_100326850, &stru_1002BD160);
                  }
                  long long v60 = qword_100326858;
                  if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)uint64_t v98 = 0;
                    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Failed to parse gossiped sth loghead: %@", buf, 0xCu);
                  }
                  NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
                  CFStringRef v102 = @"Failed to parse gossiped sth loghead";
                  long long v61 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
                  id v43 = +[NSError errorWithDomain:v84 code:-278 userInfo:v61];

                  [(KTContext *)self analyticsForParseFailure:v43];
                }
                id v9 = v87;
                p_cache = (void **)(TransparencyGPBFloatValue + 16);
                goto LABEL_54;
              }
              if (qword_100326850 != -1) {
                dispatch_once(&qword_100326850, &stru_1002BD140);
              }
              id v59 = qword_100326858;
              if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)uint64_t v98 = v43;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Failed to parse gossiped sth signedLogHead: %@", buf, 0xCu);
              }
              [(KTContext *)self analyticsForParseFailure:v43];
              goto LABEL_55;
            }
            if (qword_100326850 != -1) {
              dispatch_once(&qword_100326850, &stru_1002BD120);
            }
            uint64_t v14 = v88;
            id v31 = (void *)qword_100326858;
            if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
            {
              __int16 v32 = v31;
              unsigned int v33 = [v19 version];
              long long v34 = [(KTContext *)self applicationKeyStore];
              unsigned int v35 = [v34 tltEarliestVersion];
              long long v36 = [v19 sth];
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)uint64_t v98 = v33;
              *(_WORD *)&v98[4] = 1024;
              *(_DWORD *)&v98[6] = v35;
              *(_WORD *)uint64_t v99 = 2112;
              *(void *)&v99[2] = v36;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unsupported protocol version, message version %d, expected version: %d, sth: %@", buf, 0x18u);

              uint64_t v14 = v88;
            }
            id v37 = [v19 version];
            uint64_t v38 = [(KTContext *)self applicationKeyStore];
            id v39 = [v38 tltEarliestVersion];
            id v40 = [v19 sth];
            [(KTContext *)self analyticsForUnsupportedProtocol:v37 expected:v39 sth:v40];

            id v9 = v87;
            p_cache = (void **)(TransparencyGPBFloatValue + 16);
          }
          else
          {
            if (qword_100326850 != -1) {
              dispatch_once(&qword_100326850, &stru_1002BD100);
            }
            uint64_t v22 = (void *)qword_100326858;
            if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
            {
              id v23 = v22;
              unsigned int v24 = [v19 version];
              id v25 = [v19 sth];
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)uint64_t v98 = v24;
              *(_WORD *)&v98[4] = 1024;
              *(_DWORD *)&v98[6] = v89;
              *(_WORD *)uint64_t v99 = 2112;
              *(void *)&v99[2] = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Unsupported protocol version, message version %d, expected version: %d, sth: %@", buf, 0x18u);

              uint64_t v14 = v88;
            }
            id v26 = [v19 version];
            id v27 = [v19 sth];
            [(KTContext *)self analyticsForUnsupportedProtocol:v26 expected:v89 sth:v27];
          }
        }
        else
        {
          if (qword_100326850 != -1) {
            dispatch_once(&qword_100326850, &stru_1002BD0E0);
          }
          id v21 = qword_100326858;
          if (os_log_type_enabled((os_log_t)qword_100326858, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)uint64_t v98 = v12;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to inflate Gossip message %@", buf, 0xCu);
          }
          [(KTContext *)self analyticsForDecodeFailure:v19 error:v12];
        }
LABEL_56:

        id v15 = (char *)v15 + 1;
      }
      while (v11 != v15);
      id v11 = [v9 countByEnumeratingWithState:&v93 objects:v103 count:16];
      if (!v11) {
        goto LABEL_60;
      }
    }
  }
  id v12 = 0;
LABEL_60:

  if ([v82 count]
    && ([(KTContext *)self verifier],
        unsigned __int8 v77 = objc_claimAutoreleasedReturnValue(),
        id v90 = 0,
        [v77 processSTHsFromGossipPeers:v82 verifier:v81 error:&v90],
        id v78 = v90,
        v77,
        v78))
  {
    id v79 = v80;
    (*((void (**)(id, id))v80 + 2))(v80, v78);
  }
  else
  {
    id v79 = v80;
    (*((void (**)(id, void))v80 + 2))(v80, 0);
  }
}

- (void)writeResult:(id)a3 verification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 succeed] == (id)2)
  {
    id v8 = [v7 idsResponseTime];
    [v8 timeIntervalSinceNow];
    double v10 = v9;
    double v11 = (double)kKTMaximumMergeDelayMs / -1000.0;

    if (v10 < v11) {
      [v6 setSucceed:0];
    }
  }
  [v7 setUnsigned:value:"verificationResult"[v6 succeed]];
  if ([v6 succeed] != (id)2)
  {
    id v12 = [v6 loggableDatas];

    if (v12)
    {
      BOOL v13 = [KTLoggableDataArray alloc];
      uint64_t v14 = [v6 loggableDatas];
      id v15 = [(KTLoggableDataArray *)v13 initWithLoggableDatas:v14];
      [v7 setServerLoggableDatas:v15];
    }
    [v7 setOptedIn:[v6 optedIn]];
    id v16 = [v6 failure];
    [v7 setFailure:v16];

    [v7 setUnsigned:value:@"staticKeyStatus" [v6 staticAccountKeyStatus]];
    uint64_t v17 = [v7 peerState];
    [v17 setEverCompletedVerification:1];
    if ([v6 optInTernaryState] != (id)2) {
      [v17 setOptedIn:[v6 optedIn]];
    }
    if ([v6 optInTernaryState] == (id)1)
    {
      if ([v17 everOptedIn] && objc_msgSend(v17, "turnedOffIgnored")) {
        [v17 setTurnedOffIgnored:0];
      }
      [v17 setEverOptedIn:1];
    }
    if ([v17 setCompletedVerification:v7])
    {
      if (qword_100326860 != -1) {
        dispatch_once(&qword_100326860, &stru_1002BD1C0);
      }
      id v18 = (void *)qword_100326868;
      if (os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_INFO))
      {
        id v19 = v18;
        BOOL v20 = [v6 uri];
        id v21 = [v6 application];
        *(_DWORD *)buf = 138412546;
        unsigned int v35 = v20;
        __int16 v36 = 2112;
        id v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Updated cached verifications for uri: %@ application: %@", buf, 0x16u);
      }
      uint64_t v22 = [(KTContext *)self contextStore];
      id v23 = [v6 uri];
      unsigned int v33 = v23;
      unsigned int v24 = +[NSArray arrayWithObjects:&v33 count:1];
      id v25 = [v6 application];
      [v22 handlePeerStateChange:v24 application:v25];
    }
    id v26 = [(KTContext *)self dataStore];
    id v32 = 0;
    unsigned __int8 v27 = [v26 persistWithError:&v32];
    id v28 = v32;

    if ((v27 & 1) == 0)
    {
      if (qword_100326860 != -1) {
        dispatch_once(&qword_100326860, &stru_1002BD1E0);
      }
      uint64_t v29 = (void *)qword_100326868;
      if (os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_ERROR))
      {
        signed int v30 = v29;
        id v31 = [v7 verificationId];
        *(_DWORD *)buf = 138543618;
        unsigned int v35 = v31;
        __int16 v36 = 2112;
        id v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "failed to persist IDSKTVerification results for id %{public}@: %@", buf, 0x16u);
      }
    }
  }
}

- (void)validatePeerIDSKTVerification:(id)a3 singleQuery:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v38 = (void (**)(id, void))a5;
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = sub_100074AAC;
  long long v57 = sub_100074ABC;
  id v58 = 0;
  id v58 = [v8 serverLoggableDatas];
  double v10 = [(id)v54[5] loggableDatas];
  id v11 = +[KTLoggableData isAccountKTCapable:v10];

  id v52 = 0;
  uint64_t v41 = [v9 getQueryRequest:&v52];
  id v12 = v52;
  id v51 = v12;
  id v40 = [v9 getQueryResponse:&v51];
  id v13 = v51;

  if (v41 && v40)
  {
    uint64_t v14 = [(KTContext *)self optInServer];
    id v50 = 0;
    id v37 = [v14 getAggregateOptInState:&v50];
    id v39 = v50;

    if (v37)
    {
      if ([v37 state] == (id)1) {
        uint64_t v15 = 5;
      }
      else {
        uint64_t v15 = 4;
      }
    }
    else
    {
      if (qword_100326860 != -1) {
        dispatch_once(&qword_100326860, &stru_1002BD200);
      }
      id v21 = qword_100326868;
      if (os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v39;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "getAggregateOptInState: %@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v15 = 4;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v60 = 0x3032000000;
    long long v61 = sub_100074AAC;
    id v62 = sub_100074ABC;
    id v63 = 0;
    uint64_t v22 = [v9 responseTime];
    id v23 = [v8 verificationId];
    id v49 = v13;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    void v42[2] = sub_100074B08;
    v42[3] = &unk_1002BD2A8;
    p_long long buf = &buf;
    id v24 = v8;
    id v43 = v24;
    uint64_t v44 = self;
    id v47 = &v53;
    uint64_t v48 = v15;
    id v45 = v40;
    unint64_t v25 = [(KTContext *)self handleQueryResponse:v45 queryRequest:v41 receiptDate:v22 fetchId:v23 validateType:v15 ktCapable:v11 error:&v49 transparentDataHandler:v42];
    id v26 = v49;

    uint64_t v27 = *(void *)(*((void *)&buf + 1) + 40);
    if (v27) {
      goto LABEL_22;
    }
    if (!v25)
    {
      id v28 = [(KTContext *)self dataStore];
      uint64_t v29 = [v9 rpcId];
      [v28 failRpcId:v29 failure:v26 error:0];
    }
    signed int v30 = [v26 domain];
    if ([v30 isEqual:kTransparencyErrorServer])
    {
      BOOL v31 = [v26 code] == (id)7;

      if (v31) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    unint64_t v25 = 2;
LABEL_21:
    id v32 = objc_alloc((Class)KTVerifierResult);
    unsigned int v33 = [v24 uri];
    long long v34 = [v24 application];
    id v35 = [v32 initWithUri:v33 application:v34 ktResult:v25 failure:v26];
    __int16 v36 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v35;

    uint64_t v27 = *(void *)(*((void *)&buf + 1) + 40);
LABEL_22:
    [(KTContext *)self writeResult:v27 verification:v24];
    v38[2](v38, *(void *)(*((void *)&buf + 1) + 40));

    _Block_object_dispose(&buf, 8);
    id v13 = v26;
    goto LABEL_23;
  }
  id v16 = objc_alloc((Class)KTVerifierResult);
  uint64_t v17 = [v8 uri];
  id v18 = [v8 application];
  id v39 = [v16 initWithUri:v17 application:v18 ktResult:2 failure:v13];

  [(KTContext *)self writeResult:v39 verification:v8];
  id v19 = [(KTContext *)self dataStore];
  BOOL v20 = [v9 rpcId];
  [v19 failRpcId:v20 failure:v13 error:0];

  ((void (**)(id, id))v38)[2](v38, v39);
LABEL_23:

  _Block_object_dispose(&v53, 8);
}

- (void)validatePeerIDSKTVerification:(id)a3 batchQuery:(id)a4 completionBlock:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a3;
  id v9 = NSStringFromSelector(a2);
  id v14 = +[TransparencyError unimplementedError:v9];

  id v10 = objc_alloc((Class)KTVerifierResult);
  id v11 = [v8 uri];
  id v12 = [v8 application];

  id v13 = [v10 initWithUri:v11 application:v12 failure:v14];
  v7[2](v7, v13);
}

- (void)validatePeerIDSKTVerification:(id)a3 serverRPC:(id)a4 completionBlock:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  if ([v8 rpcType])
  {
    if ([v8 rpcType] == (id)1)
    {
      [(KTContext *)self validatePeerIDSKTVerification:v15 batchQuery:v8 completionBlock:v9];
    }
    else
    {
      id v10 = +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -340, @"unknown server rpc type: %lld", [v8 rpcType]);
      id v11 = objc_alloc((Class)KTVerifierResult);
      id v12 = [v15 uri];
      id v13 = [v15 application];
      id v14 = [v11 initWithUri:v12 application:v13 failure:v10];
      v9[2](v9, v14);
    }
  }
  else
  {
    [(KTContext *)self validatePeerIDSKTVerification:v15 singleQuery:v8 completionBlock:v9];
  }
}

- (void)validatePeer:(id)a3 verificationInfo:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(KTContext *)self dataStore];
  id v14 = [(KTContext *)self applicationID];
  id v37 = 0;
  id v15 = [v13 fetchOrCreateVerification:v10 application:v14 verificationInfo:v12 fetchNow:v7 error:&v37];

  id v16 = v37;
  if (v15)
  {
    uint64_t v17 = [(KTContext *)self dataStore];
    id v36 = v16;
    id v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    signed int v30 = sub_100075648;
    BOOL v31 = &unk_1002BD3A0;
    id v32 = v15;
    id v18 = v10;
    id v33 = v18;
    long long v34 = self;
    id v19 = v11;
    id v35 = v19;
    unsigned __int8 v20 = [v17 performAndWaitForVerificationId:v32 error:&v36 block:&v28];
    id v21 = v36;

    if ((v20 & 1) == 0)
    {
      id v22 = objc_alloc((Class)KTVerifierResult);
      id v23 = [(KTContext *)self applicationID];
      id v24 = [v22 initWithUri:v18 application:v23 failure:v21];

      (*((void (**)(id, id, void))v19 + 2))(v19, v24, 0);
    }

    id v25 = v32;
  }
  else
  {
    id v26 = objc_alloc((Class)KTVerifierResult);
    uint64_t v27 = [(KTContext *)self applicationID];
    id v25 = [v26 initWithUri:v10 application:v27 failure:v16];

    (*((void (**)(id, id, void))v11 + 2))(v11, v25, 0);
    id v21 = v16;
  }
}

- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v18 = a4;
  id v22 = a3;
  uint64_t v17 = (void (**)(id, void))a5;
  unsigned __int8 v20 = +[NSMutableArray array];
  id v21 = +[NSMutableArray array];
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = sub_100074AAC;
  id v43 = sub_100074ABC;
  id v44 = 0;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v22 count]);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_100074AAC;
  id v37 = sub_100074ABC;
  id v38 = 0;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v22 count]);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [v22 keyEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v29 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v11 = [v22 objectForKeyedSubscript:v10];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000762FC;
        v23[3] = &unk_1002BD3E8;
        uint64_t v27 = &v39;
        id v24 = v20;
        uint64_t v25 = v10;
        id v28 = &v33;
        id v26 = v21;
        [(KTContext *)self validatePeer:v10 verificationInfo:v11 fetchNow:v18 completionBlock:v23];
      }
      id v7 = [v6 countByEnumeratingWithState:&v29 objects:v51 count:16];
    }
    while (v7);
  }

  if (qword_100326860 != -1) {
    dispatch_once(&qword_100326860, &stru_1002BD408);
  }
  id v12 = (id)qword_100326868;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v20 count];
    id v14 = [v20 componentsJoinedByString:@", "];
    uint64_t v15 = v40[5];
    *(_DWORD *)long long buf = 134218498;
    id v46 = v13;
    __int16 v47 = 2112;
    uint64_t v48 = v14;
    __int16 v49 = 2112;
    uint64_t v50 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "validatePeers: returning %lu results for %@: %@", buf, 0x20u);
  }
  v17[2](v17, v40[5]);
  if ([(id)v34[5] count])
  {
    id v16 = [(KTContext *)self dataStore];
    [v16 updateIDSCacheWithResults:v34[5]];
  }
  if ([v21 count]) {
    [(KTContext *)self queryForUris:v21 userInitiated:1 cachedYoungerThan:0 completionHandler:&stru_1002BD428];
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

- (void)validatePendingPeersForSingleQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uri];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 responseTime];

    if (v7)
    {
      uint64_t v8 = [(KTContext *)self dataStore];
      id v9 = [(KTContext *)self applicationID];
      uint64_t v10 = [v4 uri];
      id v11 = [v4 responseTime];
      id v28 = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000769B8;
      v25[3] = &unk_1002B6B08;
      id v12 = v4;
      id v26 = v12;
      uint64_t v27 = self;
      unsigned __int8 v13 = [v8 performForPendingVerfications:v9 uri:v10 responseOlderThan:v11 error:&v28 batchSize:20 block:v25];
      id v14 = v28;

      if ((v13 & 1) != 0 || !v14)
      {
        if (v13) {
          goto LABEL_19;
        }
        if (qword_100326860 != -1) {
          dispatch_once(&qword_100326860, &stru_1002BD510);
        }
        id v24 = (void *)qword_100326868;
        if (!os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_19;
        }
        id v16 = v24;
        uint64_t v17 = [v12 rpcId];
        *(_DWORD *)long long buf = 138543362;
        long long v30 = v17;
        BOOL v18 = "no pending IDSKTVerifications found for rpcId %{public}@";
        id v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
        uint32_t v21 = 12;
      }
      else
      {
        if (qword_100326860 != -1) {
          dispatch_once(&qword_100326860, &stru_1002BD4F0);
        }
        uint64_t v15 = (void *)qword_100326868;
        if (!os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        id v16 = v15;
        uint64_t v17 = [v12 rpcId];
        *(_DWORD *)long long buf = 138543618;
        long long v30 = v17;
        __int16 v31 = 2112;
        long long v32 = v14;
        BOOL v18 = "no pending IDSKTVerifications found for rpcId %{public}@: %@";
        id v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        uint32_t v21 = 22;
      }
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);

LABEL_19:
      goto LABEL_20;
    }
  }
  if (qword_100326860 != -1) {
    dispatch_once(&qword_100326860, &stru_1002BD468);
  }
  id v22 = (void *)qword_100326868;
  if (os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_ERROR))
  {
    id v14 = v22;
    id v23 = [v4 rpcId];
    *(_DWORD *)long long buf = 138543362;
    long long v30 = v23;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "rpcId %{public}@ missing uri or response time", buf, 0xCu);

LABEL_20:
  }
}

- (void)validatePendingPeersForBatchQuery:(id)a3
{
  id v3 = a3;
  if (qword_100326860 != -1) {
    dispatch_once(&qword_100326860, &stru_1002BD530);
  }
  id v4 = qword_100326868;
  if (os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "validatePendingPeersForBatchQuery: batch query is unimplemented", v5, 2u);
  }
}

- (void)validatePendingPeersForRpcId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(KTContext *)self dataStore];
  v9[4] = self;
  id v10 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000770EC;
  v9[3] = &unk_1002B6BB0;
  unsigned __int8 v6 = [v5 performAndWaitForRpcId:v4 error:&v10 block:v9];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    if (qword_100326860 != -1) {
      dispatch_once(&qword_100326860, &stru_1002BD570);
    }
    uint64_t v8 = qword_100326868;
    if (os_log_type_enabled((os_log_t)qword_100326868, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to find rpc for rpcId %{public}@: %@", buf, 0x16u);
    }
  }
}

@end