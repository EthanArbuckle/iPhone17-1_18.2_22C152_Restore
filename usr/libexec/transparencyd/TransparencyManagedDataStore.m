@interface TransparencyManagedDataStore
+ (BOOL)isStrictSecureDecodingEnabled;
+ (id)deserializeLoggableDatas:(id)a3 error:(id *)a4;
+ (id)deserializeNSError:(id)a3 error:(id *)a4;
+ (id)serializeLoggableDatas:(id)a3;
+ (id)serializeNSError:(id)a3;
+ (id)supportedClassTypes;
+ (void)cleanseError:(id *)a3;
- (BOOL)clearAllFailureEvents:(id)a3 error:(id *)a4;
- (BOOL)clearFollowupTicket:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)clearSelfFailureRelatedData:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)clearSelfValidationFollowups:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)clearState:(id *)a3;
- (BOOL)clearStateForApplication:(id)a3 error:(id *)a4;
- (BOOL)createFollowupTicket:(id)a3 uri:(id)a4 startTime:(id)a5 error:(id *)a6;
- (BOOL)deleteCompletedSingleQueryForUris:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)deleteDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5;
- (BOOL)deleteDownloadRecordById:(id)a3 error:(id *)a4;
- (BOOL)deleteDownloadRecords:(id)a3 error:(id *)a4;
- (BOOL)deleteSMTsWithSPKINotIn:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)deleteSTHs:(id)a3 logBeginMsLessThan:(unint64_t)a4 error:(id *)a5;
- (BOOL)deleteServerRPCs:(id)a3 error:(id *)a4;
- (BOOL)deleteServerRpcById:(id)a3 error:(id *)a4;
- (BOOL)disableCacheHitsForUris:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)drainDataStore;
- (BOOL)failRpcId:(id)a3 failure:(id)a4 error:(id *)a5;
- (BOOL)fetchBooleanPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6;
- (BOOL)garbageCollectEntity:(id)a3 predicate:(id)a4 error:(id *)a5;
- (BOOL)garbageCollectEntityBatchDelete:(id)a3 predicate:(id)a4 error:(id *)a5;
- (BOOL)hasPendingDownloadForUUID:(id)a3 error:(id *)a4;
- (BOOL)hasPendingSingleQueryForUri:(id)a3 application:(id)a4 error:(id *)a5;
- (BOOL)haveTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 gossip:(BOOL)a9 error:(id *)a10;
- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4;
- (BOOL)ignoreFailureForUri:(id)a3 application:(id)a4 status:(unint64_t)a5 error:(id *)a6;
- (BOOL)initSelfState:(id)a3 uri:(id)a4 error:(id *)a5;
- (BOOL)isMapStillPopulating:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (BOOL)logMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)logRequestMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)logSMTMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)logSTHMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)onMocLogVerificationMetricsForApplication:(id)a3 error:(id *)a4;
- (BOOL)onQueueRemoveFailures:(id)a3 error:(id *)a4;
- (BOOL)onQueueSetCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5 error:(id *)a6;
- (BOOL)performAndWaitForDeviceId:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performAndWaitForDownloadId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForFailedEventId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForFetchId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForPeer:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performAndWaitForRequestId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForRpcId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performAndWaitForVerificationId:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)performBlockWithSelfState:(id)a3 uri:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performCheckWithNewestMap:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5 block:(id)a6;
- (BOOL)performForPendingSMTs:(id)a3 uri:(id)a4 error:(id *)a5 batchSize:(unint64_t)a6 block:(id)a7;
- (BOOL)performForPendingVerfications:(id)a3 uri:(id)a4 responseOlderThan:(id)a5 error:(id *)a6 batchSize:(unint64_t)a7 block:(id)a8;
- (BOOL)persistAndRefaultObject:(id)a3 error:(id *)a4;
- (BOOL)persistAndRefaultObjects:(id)a3 error:(id *)a4;
- (BOOL)persistWithError:(id *)a3;
- (BOOL)populateExistingRequestsToLookupTable:(id *)a3;
- (BOOL)populateMissingLogHeadHashes:(id *)a3;
- (BOOL)resetPeersToPending:(id)a3 error:(id *)a4;
- (BOOL)resetPendingRequests:(id *)a3;
- (BOOL)resetPendingRequests:(id)a3 error:(id *)a4;
- (BOOL)resetRequestsForApplication:(id)a3 error:(id *)a4;
- (BOOL)resetRequestsForTLTReset:(id *)a3;
- (BOOL)resetVerificationsToPending:(id)a3 error:(id *)a4;
- (BOOL)setResponse:(id)a3 downloadId:(id)a4 error:(id *)a5;
- (BOOL)setResponseForRpcId:(id)a3 response:(id)a4 responseStatus:(id)a5 usedReversePush:(BOOL)a6 serverHint:(id)a7 error:(id *)a8;
- (BOOL)setSeenDate:(id)a3 uris:(id)a4 application:(id)a5 error:(id *)a6;
- (BOOL)shouldGarbageCollectSMH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanRevision:(unint64_t)a6 olderThanDate:(id)a7;
- (BOOL)shouldGarbageCollectSTH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanDate:(id)a6;
- (NSManagedObjectContext)context;
- (OS_dispatch_queue)peerQueue;
- (TransparencyAnalytics)logger;
- (TransparencyFollowUpProtocol)followup;
- (TransparencyManagedDataStore)initWithController:(id)a3 followup:(id)a4 logger:(id)a5;
- (TransparencyManagedDataStoreController)controller;
- (TransparencyManagedDataStoreProtocol)updateDelegate;
- (TransparencyPeerOverrides)peerOverridesStore;
- (TransparencyStaticKeyStore)staticKeyStore;
- (double)serverRPCTimeoutSeconds;
- (id)copyStatistics:(id *)a3;
- (id)createBatchQuery;
- (id)createBatchQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5;
- (id)createBatchQuery:(id)a3 error:(id *)a4;
- (id)createDownloadRecord:(unint64_t)a3 moc:(id)a4 application:(id)a5;
- (id)createFailureEvent:(id)a3 application:(id)a4 optInServer:(id)a5;
- (id)createFetchRecord;
- (id)createFetchRecordForRequestData:(id)a3 request:(id)a4 error:(id *)a5;
- (id)createIDSKTVerification:(id)a3 application:(id)a4 accountKey:(id)a5 idsResponseTime:(id)a6 serverLoggableDatas:(id)a7 optedIn:(unint64_t)a8 type:(unint64_t)a9 syncedLoggableDatas:(id)a10 verificationId:(id)a11 error:(id *)a12;
- (id)createIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 type:(unint64_t)a6 syncedLoggableDatas:(id)a7 verificationId:(id)a8 error:(id *)a9;
- (id)createMapHead;
- (id)createMapHead:(id)a3 application:(id)a4 logBeginTime:(unint64_t)a5 logHeadHash:(id)a6 logType:(int64_t)a7 revision:(unint64_t)a8 populating:(BOOL)a9 gossip:(BOOL)a10;
- (id)createMutation:(id)a3 application:(id)a4 uri:(id)a5 mutationMs:(unint64_t)a6 spkiHash:(id)a7 receiptTime:(id)a8;
- (id)createPeerIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 error:(id *)a6;
- (id)createPeerState:(id)a3 application:(id)a4 error:(id *)a5;
- (id)createRecordFromLoggableData:(id)a3 application:(id)a4;
- (id)createRequest;
- (id)createRequestFailure;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 idsResponseTime:(id)a8 queryRequest:(id)a9 queryResponse:(id)a10 responseDate:(id)a11 type:(unint64_t)a12 clientId:(id)a13 error:(id *)a14;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 clientId:(id)a11 error:(id *)a12;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 error:(id *)a11;
- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 type:(unint64_t)a7 error:(id *)a8;
- (id)createSignedMutationTimestampsFailure;
- (id)createSignedTreeHeadFailure;
- (id)createSingleQuery;
- (id)createSingleQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5;
- (id)createSingleQuery:(id)a3 error:(id *)a4;
- (id)createTreeHead;
- (id)createTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logHeadHash:(id)a7 logType:(int64_t)a8 revision:(unint64_t)a9 gossip:(BOOL)a10;
- (id)downloadRecords:(id *)a3;
- (id)failedHeadSignaturesWithRevisions:(id)a3 application:(id)a4;
- (id)fetchCompletedRequests:(id)a3 olderThan:(id)a4 error:(id *)a5;
- (id)fetchDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5;
- (id)fetchDownloadRecordById:(id)a3 error:(id *)a4;
- (id)fetchFetchRecordById:(id)a3 error:(id *)a4;
- (id)fetchLatestSingleQueryByUri:(id)a3 application:(id)a4 error:(id *)a5;
- (id)fetchNumericPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6;
- (id)fetchOrCreateVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 fetchNow:(BOOL)a6 error:(id *)a7;
- (id)fetchPeer:(id)a3 application:(id)a4 error:(id *)a5;
- (id)fetchRecentFailureEvents:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5;
- (id)fetchRequestForUUID:(id)a3 error:(id *)a4;
- (id)fetchRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 youngerThan:(id)a7 error:(id *)a8;
- (id)fetchRequestsForURI:(id)a3 error:(id *)a4;
- (id)fetchServerRpcById:(id)a3 error:(id *)a4;
- (id)fetchTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9;
- (id)fetchTreeHeadsWithoutHash:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9;
- (id)getLatestSuccessfulBatchQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6;
- (id)getLatestSuccessfulSingleQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6;
- (id)getOptInStatus:(id)a3 application:(id)a4 error:(id *)a5;
- (id)getPendingSmtUris:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5;
- (id)getTapToRadarDate:(id)a3;
- (id)initializeServerRPC:(id)a3 application:(int)a4 backgroundOpId:(id)a5 request:(id)a6;
- (id)latestConsistencyVerifiedTreeHeadRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (id)latestConsistencyVerifiedTreeHeadSTH:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (id)onMocFetchVerificationForVerificationId:(id)a3 error:(id *)a4;
- (id)onMocSetPendingResultForVerification:(id)a3;
- (id)peerVerificationIdForUri:(id)a3 application:(id)a4 verificationInfo:(id)a5 newerThan:(id)a6 error:(id *)a7;
- (id)pendingVerificationURIs:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5;
- (id)requestFailures:(id *)a3;
- (id)requestIds:(id *)a3;
- (id)requests:(id *)a3;
- (id)retainContext;
- (id)signedMutationTimestamps:(id *)a3;
- (id)signedMutationTimestampsFailures:(id *)a3;
- (id)signedTreeHeadFailures:(id *)a3;
- (id)treeHeads:(id *)a3;
- (id)treeHeadsForApplication:(id)a3 error:(id *)a4;
- (id)unverifiedRevisions:(id)a3 isMapHead:(BOOL)a4 inclusion:(BOOL)a5 logBeginMs:(unint64_t)a6 error:(id *)a7;
- (id)verifierResultForPeer:(id)a3 application:(id)a4;
- (int64_t)contextRefCount;
- (unint64_t)checkFollowupTicket:(id)a3 uri:(id)a4 checkTime:(id)a5 error:(id *)a6;
- (unint64_t)countOutstandingRequestsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingSMHsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingSMTsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingSTHsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countOutstandingVerificationsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalRequestsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalSMTsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalSTHsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)countTotalVerificationsForApplication:(id)a3 error:(id *)a4;
- (unint64_t)newestMapRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5;
- (unint64_t)onMocCountEntity:(id)a3 predicate:(id)a4 error:(id *)a5;
- (unint64_t)requestCount:(id *)a3;
- (unint64_t)requestFailureCount:(id *)a3;
- (unint64_t)signedMutationTimestampCount:(id *)a3;
- (unint64_t)signedMutationTimestampsFailureCount:(id *)a3;
- (unint64_t)signedTreeHeadFailureCount:(id *)a3;
- (unint64_t)treeHeadCount:(id *)a3;
- (void)clearFailureEvents:(id)a3 completionBlock:(id)a4;
- (void)clearPeerState:(id)a3 uris:(id)a4 error:(id *)a5;
- (void)createIDSVerificationID:(id)a3 verification:(id)a4;
- (void)createKTRequestID:(id)a3 request:(id)a4;
- (void)createSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5;
- (void)deleteNonRecentVerificationsForApplication:(id)a3 error:(id *)a4;
- (void)deleteObject:(id)a3;
- (void)deleteObjectSet:(id)a3;
- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4;
- (void)failHeadDownload:(id)a3 failure:(id)a4 logClient:(id)a5;
- (void)failHeadDownloadRecord:(id)a3 failure:(id)a4 error:(id *)a5;
- (void)fetchSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5;
- (void)garbageCollectRequests:(id)a3 olderThan:(id)a4 error:(id *)a5;
- (void)garbageCollectSMHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanRevision:(unint64_t)a5 olderThanDate:(id)a6 error:(id *)a7;
- (void)garbageCollectSMTs:(id *)a3;
- (void)garbageCollectSTHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanDate:(id)a5 error:(id *)a6;
- (void)garbageCollectServerRPCs:(id *)a3;
- (void)garbageCollectVerifications:(id *)a3;
- (void)onMocSetMapHead:(id)a3 inclusionResult:(unint64_t)a4 inclusionError:(id)a5;
- (void)onMocSetMapHead:(id)a3 mmdResult:(unint64_t)a4 mmdError:(id)a5;
- (void)onMocSetMapHead:(id)a3 signatureResult:(unint64_t)a4 signatureError:(id)a5;
- (void)peers:(id)a3;
- (void)performAndWaitForLatestSelfRequest:(id)a3 accountKey:(id)a4 block:(id)a5;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)performBlockAndWaitWithMoc:(id)a3;
- (void)performForPendingSTHs:(id)a3 olderThan:(id)a4 type:(unint64_t)a5 error:(id *)a6 block:(id)a7;
- (void)performForRequestsWithPendingResponses:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performForSMHsWithUnverifiedMMD:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performForSMTsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performForSTHs:(id)a3 isMapHead:(BOOL)a4 revision:(id)a5 error:(id *)a6 block:(id)a7;
- (void)performForSTHsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5;
- (void)performOnBatchesOfEntity:(id)a3 predicate:(id)a4 enforceMax:(BOOL)a5 error:(id *)a6 block:(id)a7;
- (void)performOnRequestsForPredicate:(id)a3 enforceMax:(BOOL)a4 error:(id *)a5 block:(id)a6;
- (void)recalculateVerifierResultForPeer:(id)a3 application:(id)a4 after:(double)a5;
- (void)refaultObject:(id)a3;
- (void)refaultObjects:(id)a3;
- (void)releaseContext;
- (void)removeFailuresOnOptIn:(id)a3;
- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7;
- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6;
- (void)reportCoreDataPersistEventForLocation:(id)a3 underlyingError:(id)a4;
- (void)reportFailedRevisions:(id)a3 failure:(id)a4 downloadType:(unint64_t)a5 application:(id)a6;
- (void)saveAndRefaultObject:(id)a3;
- (void)setCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5;
- (void)setContext:(id)a3;
- (void)setContextRefCount:(int64_t)a3;
- (void)setController:(id)a3;
- (void)setFollowup:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPeerOverridesStore:(id)a3;
- (void)setPeerQueue:(id)a3;
- (void)setServerRPCTimeoutSeconds:(double)a3;
- (void)setStaticKeyStore:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)storeTTR:(id)a3 withType:(id)a4;
- (void)updateIDSCacheWithResults:(id)a3;
@end

@implementation TransparencyManagedDataStore

- (id)createPeerState:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(TransparencyManagedDataStore *)self context];
  v11 = +[NSEntityDescription insertNewObjectForEntityForName:@"PeerState" inManagedObjectContext:v10];

  [v11 setUri:v9];
  [v11 setApplication:v8];

  if ([(TransparencyManagedDataStore *)self persistWithError:a5])
  {
    id v12 = v11;
  }
  else
  {
    [(id)objc_opt_class() cleanseError:a5];
    id v12 = 0;
  }

  return v12;
}

- (id)fetchPeer:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[NSFetchRequest fetchRequestWithEntityName:@"PeerState"];
  v11 = +[NSPredicate predicateWithFormat:@"uri = %@ && application = %@", v9, v8];

  [v10 setPredicate:v11];
  id v12 = [(TransparencyManagedDataStore *)self context];
  v13 = [v12 executeFetchRequest:v10 error:a5];

  [(id)objc_opt_class() cleanseError:a5];
  if (v13 && [v13 count])
  {
    v14 = [v13 objectAtIndexedSubscript:0];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)performAndWaitForPeer:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100014328;
  v29 = sub_100014338;
  id v30 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100014340;
  v19[3] = &unk_1002B7A30;
  v19[4] = self;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  v23 = &v25;
  id v15 = v12;
  id v22 = v15;
  v24 = &v31;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v19];
  if (a5)
  {
    v16 = (void *)v26[5];
    if (v16) {
      *a5 = v16;
    }
  }
  char v17 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)resetPeersToPending:(id)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100014328;
  id v20 = sub_100014338;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100014620;
  v12[3] = &unk_1002B7A58;
  id v13 = self;
  id v15 = &v16;
  id v5 = a3;
  id v14 = v5;
  [(TransparencyManagedDataStore *)v13 performBlockAndWait:v12];
  v6 = v17;
  if (a4)
  {
    v7 = (void *)v17[5];
    if (v7)
    {
      *a4 = v7;
      v6 = v17;
    }
  }
  uint64_t v8 = v6[5];
  if (v8)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7A78);
    }
    id v9 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v17[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to reset peer states to pending: %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v16, 8);
  return v8 == 0;
}

- (void)peers:(id)a3
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_100014328;
  v8[4] = sub_100014338;
  id v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000149A0;
  v4[3] = &unk_1002B7AC0;
  id v5 = self;
  v7 = v8;
  id v3 = a3;
  id v6 = v3;
  [(TransparencyManagedDataStore *)v5 performBlockAndWait:v4];

  _Block_object_dispose(v8, 8);
}

- (BOOL)setSeenDate:(id)a3 uris:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_100014328;
  uint64_t v31 = sub_100014338;
  id v32 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100014E40;
  v22[3] = &unk_1002B7B08;
  v22[4] = self;
  v26 = &v27;
  id v13 = v11;
  id v23 = v13;
  id v14 = v12;
  id v24 = v14;
  id v15 = v10;
  id v25 = v15;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v22];
  uint64_t v16 = v28;
  if (a6)
  {
    char v17 = (void *)v28[5];
    if (v17)
    {
      *a6 = v17;
      uint64_t v16 = v28;
    }
  }
  uint64_t v18 = v16[5];
  if (v18)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7B28);
    }
    v19 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = v28[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to update seen date: %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v27, 8);
  return v18 == 0;
}

- (void)updateIDSCacheWithResults:(id)a3
{
  id v3 = a3;
  v37 = +[NSMutableArray array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v45;
    *(void *)&long long v5 = 141558786;
    long long v34 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v7);
        id v9 = [v8 uri:v34];
        BOOL v10 = v9 == 0;

        if (!v10)
        {
          id v11 = [v8 uri];
          [v37 addObject:v11];

          *(void *)v57 = 0;
          *(void *)&v57[8] = v57;
          *(void *)&v57[16] = 0x3032000000;
          v58 = sub_100014328;
          v59 = sub_100014338;
          id v60 = 0;
          id v12 = [v8 uri];
          id v13 = [v8 application];
          id v15 = (id *)(*(void *)&v57[8] + 40);
          id v14 = *(void **)(*(void *)&v57[8] + 40);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1000156E4;
          v42[3] = &unk_1002B7B50;
          v42[4] = v8;
          v42[5] = self;
          v42[6] = v57;
          id v43 = v14;
          [(TransparencyManagedDataStore *)self performAndWaitForPeer:v12 application:v13 error:&v43 block:v42];
          objc_storeStrong(v15, v43);

          if (*(void *)(*(void *)&v57[8] + 40))
          {
            if (qword_1003266C0 != -1) {
              dispatch_once(&qword_1003266C0, &stru_1002B7B70);
            }
            uint64_t v16 = (id)qword_1003266C8;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              char v17 = [v8 uri];
              [v8 uiStatus];
              uint64_t v18 = KTUIStatusGetString();
              uint64_t v19 = *(void *)(*(void *)&v57[8] + 40);
              *(_DWORD *)buf = v34;
              uint64_t v50 = 1752392040;
              __int16 v51 = 2112;
              v52 = v17;
              __int16 v53 = 2114;
              v54 = v18;
              __int16 v55 = 2112;
              uint64_t v56 = v19;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to update peer state for %{mask.hash}@ with %{public}@ sent to IDS: %@", buf, 0x2Au);
            }
          }
          _Block_object_dispose(v57, 8);
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v4);
  }

  if (qword_1003266C0 != -1) {
    dispatch_once(&qword_1003266C0, &stru_1002B7B90);
  }
  uint64_t v20 = (void *)qword_1003266C8;
  if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v20;
    id v22 = [v37 count];
    id v23 = [v37 componentsJoinedByString:@", "];
    *(_DWORD *)v57 = 134218242;
    *(void *)&v57[4] = v22;
    *(_WORD *)&v57[12] = 2112;
    *(void *)&v57[14] = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "calling IDS with %lu results for %@", v57, 0x16u);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v24 = obj;
  id v25 = [v24 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v39;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v24);
        }
        v28 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v27);
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B7BB0);
        }
        uint64_t v29 = (void *)qword_1003266C8;
        if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = v29;
          [v28 uiStatus];
          uint64_t v31 = KTUIStatusGetString();
          id v32 = [v28 uri];
          *(_DWORD *)v57 = 138543874;
          *(void *)&v57[4] = v31;
          *(_WORD *)&v57[12] = 2160;
          *(void *)&v57[14] = 1752392040;
          *(_WORD *)&v57[22] = 2112;
          v58 = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "calling IDS with UIStatus %{public}@ for uri %{mask.hash}@", v57, 0x20u);
        }
        uint64_t v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [v24 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v25);
  }

  uint64_t v33 = [(TransparencyManagedDataStore *)self updateDelegate];
  [v33 peerVerificationUpdated:v24];
}

- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v28;
    char v25 = 1;
    *(void *)&long long v9 = 141558274;
    long long v24 = v9;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v12);
        id v14 = [v13 uri:v24];
        id v15 = [v13 application];
        unsigned int v16 = -[TransparencyManagedDataStore ignoreFailureForUri:application:status:error:](self, "ignoreFailureForUri:application:status:error:", v14, v15, [v13 uiStatus], a4);

        if (v16)
        {
          if (qword_1003266C0 != -1) {
            dispatch_once(&qword_1003266C0, &stru_1002B7BD0);
          }
          char v17 = (void *)qword_1003266C8;
          if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = v17;
            uint64_t v19 = [v13 uri];
            *(_DWORD *)buf = v24;
            uint64_t v32 = 1752392040;
            __int16 v33 = 2112;
            long long v34 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "ignoreFailure for %{mask.hash}@, will update IDS cache", buf, 0x16u);
          }
          uint64_t v20 = [v13 uri];
          id v21 = [v13 application];
          id v22 = [(TransparencyManagedDataStore *)self verifierResultForPeer:v20 application:v21];
          [v26 addObject:v22];
        }
        else
        {
          char v25 = 0;
        }
        [v13 setSentToIDS:1];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v10);
  }
  else
  {
    char v25 = 1;
  }

  [(TransparencyManagedDataStore *)self updateIDSCacheWithResults:v26];
  return v25 & 1;
}

- (BOOL)ignoreFailureForUri:(id)a3 application:(id)a4 status:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = sub_100014328;
  long long v28 = sub_100014338;
  id v29 = 0;
  unint64_t v22 = a5;
  id obj = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100015DC8;
  v18[3] = &unk_1002B7C18;
  v18[4] = self;
  id v11 = a4;
  id v19 = v11;
  id v12 = v10;
  id v20 = v12;
  id v21 = &v24;
  BOOL v13 = [(TransparencyManagedDataStore *)self performAndWaitForPeer:v12 application:v11 error:&obj block:v18];
  objc_storeStrong(&v29, obj);
  if (!v13)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7C38);
    }
    id v14 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v25[5];
      *(_DWORD *)buf = 138544130;
      id v31 = v11;
      __int16 v32 = 2160;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      uint64_t v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "unable to ignore error for application=%{public}@ uri=%{mask.hash}@: %@", buf, 0x2Au);
    }
    if (a6)
    {
      unsigned int v16 = (void *)v25[5];
      if (v16) {
        *a6 = v16;
      }
    }
  }

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (id)getOptInStatus:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unsigned int v16 = sub_100014328;
  char v17 = sub_100014338;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100016184;
  v12[3] = &unk_1002B7C60;
  void v12[4] = &v13;
  [(TransparencyManagedDataStore *)self performAndWaitForPeer:v8 application:v9 error:a5 block:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (id)verifierResultForPeer:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100014328;
  char v25 = sub_100014338;
  id v26 = 0;
  id v26 = [objc_alloc((Class)KTVerifierResult) initWithUri:v6 application:v7];
  id v19 = &v21;
  id v20 = 0;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_1000163D4;
  unsigned int v16 = &unk_1002B7CA8;
  char v17 = self;
  id v8 = v6;
  id v18 = v8;
  unsigned __int8 v9 = [(TransparencyManagedDataStore *)self performAndWaitForPeer:v8 application:v7 error:&v20 block:&v13];
  id v10 = v20;
  if ((v9 & 1) == 0) {
    [v22[5] setFailure:v10, v13, v14, v15, v16, v17];
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v11;
}

- (void)recalculateVerifierResultForPeer:(id)a3 application:(id)a4 after:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  id v11 = [(TransparencyManagedDataStore *)self peerQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100016788;
  v14[3] = &unk_1002B71D0;
  objc_copyWeak(&v17, &location);
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_after(v10, v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)onMocSetPendingResultForVerification:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 uri];
  id v6 = [v4 application];
  id v7 = [objc_alloc((Class)KTVerifierResult) initPendingForUri:v5 application:v6];
  id v8 = [v4 serverLoggableDatas];
  id v9 = [v8 loggableDatas];
  [v7 setLoggableDatas:v9];

  dispatch_time_t v10 = [v4 accountKey];

  if (v10)
  {
    id v11 = [v4 accountKey];
    id v12 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v11 error:0];
    [v7 setPublicID:v12];
  }
  id v13 = [v4 peerState];
  uint64_t v14 = [(TransparencyManagedDataStore *)self staticKeyStore];
  id v15 = +[NSDate now];
  [v13 updateResultWithStaticKey:v7 staticKeyStore:v14 forDate:v15];

  id v16 = [v7 uiStatus];
  if (v16 != [v13 lastIDSCacheUIStatus])
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7CC8);
    }
    id v17 = (void *)qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      *(_DWORD *)buf = 134218754;
      id v24 = [v13 lastIDSCacheUIStatus];
      __int16 v25 = 2048;
      id v26 = [v7 uiStatus];
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      long long v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "verifierResultForPeer cached UI status changed %lld->%llu for %{mask.hash}@, will update IDS cache", buf, 0x2Au);
    }
    id v22 = v7;
    id v19 = +[NSArray arrayWithObjects:&v22 count:1];
    [(TransparencyManagedDataStore *)self updateIDSCacheWithResults:v19];

    [v7 setSentToIDS:1];
  }
  id v20 = [(TransparencyManagedDataStore *)self peerOverridesStore];
  [v20 applyPeerOverrides:v7 peer:v13];

  [(TransparencyManagedDataStore *)self persistAndRefaultObject:v13 error:0];

  return v7;
}

- (void)clearPeerState:(id)a3 uris:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v10 = v9;
  if (v9 && [v9 count])
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7CE8);
    }
    id v11 = (void *)qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v11;
      id v13 = [v10 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Clearing peer state for %@ for %@", buf, 0x16u);
    }
    +[NSPredicate predicateWithFormat:@"application = %@ && uri IN %@", v8, v10];
  }
  else
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7D08);
    }
    uint64_t v14 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Clearing peer state for %@", buf, 0xCu);
    }
    +[NSPredicate predicateWithFormat:@"application = %@", v8, v16];
  id v15 = };
  if ([(TransparencyManagedDataStore *)self garbageCollectEntity:@"PeerState" predicate:v15 error:a5]&& [(TransparencyManagedDataStore *)self garbageCollectEntity:@"IDSKTVerification" predicate:v15 error:a5])
  {
    [(TransparencyManagedDataStore *)self garbageCollectEntity:@"RPCSingleQuery" predicate:v15 error:a5];
  }
}

- (void)setCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatch_time_t v10 = [(TransparencyManagedDataStore *)self peerQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100016EC4;
  v13[3] = &unk_1002B7D30;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)removeFailuresOnOptIn:(id)a3
{
  id v4 = a3;
  long long v5 = [(TransparencyManagedDataStore *)self peerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016F90;
  v7[3] = &unk_1002B7D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)onQueueRemoveFailures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_1003266C0 != -1) {
    dispatch_once(&qword_1003266C0, &stru_1002B7D78);
  }
  id v7 = qword_1003266C8;
  if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removing all saved failures for %{public}@ following opt-in", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100014328;
  uint64_t v23 = sub_100014338;
  id v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001724C;
  v15[3] = &unk_1002B7A58;
  v15[4] = self;
  p_long long buf = &buf;
  id v8 = v6;
  id v16 = v8;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  uint64_t v9 = *((void *)&buf + 1);
  if (a4)
  {
    dispatch_time_t v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10)
    {
      *a4 = v10;
      uint64_t v9 = *((void *)&buf + 1);
    }
  }
  uint64_t v11 = *(void *)(v9 + 40);
  if (v11)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7D98);
    }
    id v12 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)id v18 = 138412290;
      uint64_t v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to remove failures after opt-in: %@", v18, 0xCu);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v11 == 0;
}

- (BOOL)onQueueSetCachedPeerOptInState:(BOOL)a3 uris:(id)a4 application:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [(TransparencyManagedDataStore *)self peerQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = sub_100014328;
  long long v40 = sub_100014338;
  id v41 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100017800;
  v31[3] = &unk_1002B7DE0;
  v31[4] = self;
  __int16 v34 = &v36;
  id v13 = v10;
  id v32 = v13;
  id v14 = v11;
  id v33 = v14;
  BOOL v35 = a3;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v31];
  id v15 = v37;
  if (a6)
  {
    id v16 = (void *)v37[5];
    if (v16)
    {
      *a6 = v16;
      id v15 = v37;
    }
  }
  uint64_t v17 = v15[5];
  if (v17)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7E00);
    }
    id v18 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v37[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to update opt-in state: %@", buf, 0xCu);
    }
  }
  else
  {
    id v20 = +[NSMutableArray array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v21 = v13;
    id v22 = [v21 countByEnumeratingWithState:&v27 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v21);
          }
          __int16 v25 = -[TransparencyManagedDataStore verifierResultForPeer:application:](self, "verifierResultForPeer:application:", *(void *)(*((void *)&v27 + 1) + 8 * i), v14, (void)v27);
          if (v25) {
            [v20 addObject:v25];
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v27 objects:v42 count:16];
      }
      while (v22);
    }

    [(TransparencyManagedDataStore *)self updateIDSCacheWithResults:v20];
    [(TransparencyManagedDataStore *)self disableCacheHitsForUris:v21 application:v14 error:0];
    [(TransparencyManagedDataStore *)self deleteCompletedSingleQueryForUris:v21 application:v14 error:0];
  }
  _Block_object_dispose(&v36, 8);

  return v17 == 0;
}

- (id)createMapHead
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTTreeHead" inManagedObjectContext:v2];

  return v3;
}

- (id)createMapHead:(id)a3 application:(id)a4 logBeginTime:(unint64_t)a5 logHeadHash:(id)a6 logType:(int64_t)a7 revision:(unint64_t)a8 populating:(BOOL)a9 gossip:(BOOL)a10
{
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [(TransparencyManagedDataStore *)self createTreeHead];
  [v19 setSth:v18];

  [v19 setIsMapHead:1];
  [v19 setApplication:v17];

  [v19 setUnsigned:"logBeginTime" value:a5];
  [v19 setLogHeadHash:v16];

  [v19 setLogType:a7];
  [v19 setUnsigned:"revision" value:a8];
  [v19 setPopulating:a9];
  [v19 setGossip:a10];
  [v19 setReceiptTime:CFAbsoluteTimeGetCurrent()];
  [v19 setInclusionVerified:2];
  [v19 setConsistencyVerified:1];

  return v19;
}

- (BOOL)fetchBooleanPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10016E884;
  long long v27 = sub_10016E894;
  id v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016E89C;
  v17[3] = &unk_1002C3380;
  v17[4] = self;
  id v20 = &v23;
  id v12 = v10;
  id v18 = v12;
  unint64_t v22 = a4;
  id v13 = v11;
  id v19 = v13;
  id v21 = &v29;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v17];
  if (a6)
  {
    id v14 = (void *)v24[5];
    if (v14) {
      *a6 = v14;
    }
  }
  char v15 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (id)fetchNumericPropertyOnMostRecentMapHead:(id)a3 logBeginMs:(unint64_t)a4 propertyName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  char v32 = sub_10016E884;
  id v33 = sub_10016E894;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10016E884;
  long long v27 = sub_10016E894;
  id v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016F0EC;
  v17[3] = &unk_1002C3380;
  v17[4] = self;
  id v20 = &v23;
  id v12 = v10;
  id v18 = v12;
  unint64_t v22 = a4;
  id v13 = v11;
  id v19 = v13;
  id v21 = &v29;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v17];
  if (a6)
  {
    id v14 = (void *)v24[5];
    if (v14) {
      *a6 = v14;
    }
  }
  id v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)isMapStillPopulating:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  return [(TransparencyManagedDataStore *)self fetchBooleanPropertyOnMostRecentMapHead:a3 logBeginMs:a4 propertyName:@"populating" error:a5];
}

- (unint64_t)newestMapRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  id v12 = 0;
  id v6 = [(TransparencyManagedDataStore *)self fetchNumericPropertyOnMostRecentMapHead:a3 logBeginMs:a4 propertyName:@"revision" error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = [v6 unsignedLongLongValue];
  }
  else
  {
    id v10 = 0;
    if (a5 && v7)
    {
      id v10 = 0;
      *a5 = v7;
    }
  }

  return (unint64_t)v10;
}

- (BOOL)performCheckWithNewestMap:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = sub_10016E884;
  uint64_t v31 = sub_10016E894;
  id v32 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016F958;
  v17[3] = &unk_1002C3448;
  v17[4] = self;
  id v20 = &v27;
  id v12 = v10;
  id v21 = &v23;
  unint64_t v22 = a4;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v17];
  if (a5)
  {
    id v14 = (void *)v28[5];
    if (v14) {
      *a5 = v14;
    }
  }
  char v15 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

- (void)garbageCollectSMHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanRevision:(unint64_t)a5 olderThanDate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if (qword_10032EC80 != -1) {
    dispatch_once(&qword_10032EC80, &stru_1002C3468);
  }
  id v14 = qword_10032EC88;
  if (os_log_type_enabled((os_log_t)qword_10032EC88, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v20 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "garbage collecting map heads earlier than revision %llu", buf, 0xCu);
  }
  char v15 = +[NSPredicate predicateWithFormat:@"isMapHead == YES && application == %@ && (revision != %llu && receiptTime < %@ || logBeginTime < %llu || logBeginTime == %llu && signatureVerified != %d && inclusionVerified != %d && mmdVerified != %d && revision < %llu)", v12, a5, v13, a4, a4, 2, 2, 2, a5];
  id v18 = 0;
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTTreeHead" predicate:v15 error:&v18];
  id v16 = v18;
  id v17 = v16;
  if (a7 && v16) {
    *a7 = v16;
  }
}

- (BOOL)shouldGarbageCollectSMH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanRevision:(unint64_t)a6 olderThanDate:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if ([v11 isMapHead])
  {
    id v14 = +[NSPredicate predicateWithFormat:@"isMapHead == YES && application == %@ && (revision != %llu && receiptTime < %@ || logBeginTime < %llu || logBeginTime == %llu && signatureVerified != %d && inclusionVerified != %d && mmdVerified != %d && revision < %llu)", v12, a6, v13, a5, a5, 2, 2, 2, a6];
    unsigned __int8 v15 = [v14 evaluateWithObject:v11];
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)onMocSetMapHead:(id)a3 signatureResult:(unint64_t)a4 signatureError:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  [v13 setUnsigned:"signatureVerified" value:a4];
  if (v8)
  {
    BOOL v9 = [(TransparencyManagedDataStore *)self createSignedTreeHeadFailure];
    [v9 setErrorCode:[v8 code]];
    id v10 = [v8 domain];
    [v9 setErrorDomain:v10];

    [v9 setSth:v13];
    [v9 setVerificationType:0];
  }
  if (a4 == 1 && [v13 inclusionVerified] == (id)1 && objc_msgSend(v13, "mmdVerified") == (id)1)
  {
    id v11 = [(TransparencyManagedDataStore *)self updateDelegate];
    id v12 = [v13 application];
    [v11 mapHeadUpdated:v12 populating:[v13 populating]];
  }
}

- (void)onMocSetMapHead:(id)a3 mmdResult:(unint64_t)a4 mmdError:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  [v14 setUnsigned:"mmdVerified" value:a4];
  if (v8)
  {
    BOOL v9 = [(TransparencyManagedDataStore *)self createSignedTreeHeadFailure];
    [v9 setErrorCode:[v8 code]];
    id v10 = [v8 domain];
    [v9 setErrorDomain:v10];

    [v9 setSth:v14];
    [v9 setVerificationType:3];
  }
  if ([v14 signatureVerified] == (id)1)
  {
    id v11 = [v14 inclusionVerified];
    if (a4 == 1 && v11 == (id)1)
    {
      id v12 = [(TransparencyManagedDataStore *)self updateDelegate];
      id v13 = [v14 application];
      [v12 mapHeadUpdated:v13 populating:[v14 populating]];
    }
  }
}

- (void)onMocSetMapHead:(id)a3 inclusionResult:(unint64_t)a4 inclusionError:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  [v14 setUnsigned:"inclusionVerified" value:a4];
  if (v8)
  {
    BOOL v9 = [(TransparencyManagedDataStore *)self createSignedTreeHeadFailure];
    [v9 setErrorCode:[v8 code]];
    id v10 = [v8 domain];
    [v9 setErrorDomain:v10];

    [v9 setSth:v14];
    [v9 setVerificationType:1];
  }
  id v11 = [v14 signatureVerified];
  if (a4 == 1 && v11 == (id)1 && [v14 mmdVerified] == (id)1)
  {
    id v12 = [(TransparencyManagedDataStore *)self updateDelegate];
    id v13 = [v14 application];
    [v12 mapHeadUpdated:v13 populating:[v14 populating]];
  }
}

- (void)createSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10017D1B4;
  long long v30 = sub_10017D1C4;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10017D1B4;
  id v24 = sub_10017D1C4;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10017D1CC;
  v15[3] = &unk_1002BBF80;
  id v18 = &v26;
  v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v20;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a5)
  {
    uint64_t v12 = v21[5];
    if (v12)
    {
      *a5 = +[TransparencyError errorWithDomain:kTransparencyErrorDatabase code:-129 errorLevel:1 underlyingError:v12 description:@"couldn't create self state"];
    }
  }
  id v13 = (void *)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)fetchSelfValidationState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10017D1B4;
  long long v30 = sub_10017D1C4;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10017D1B4;
  id v24 = sub_10017D1C4;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10017D4A8;
  v15[3] = &unk_1002C38D8;
  v15[4] = self;
  id v18 = &v20;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a5)
  {
    uint64_t v12 = v21[5];
    if (v12)
    {
      *a5 = +[TransparencyError errorWithDomain:kTransparencyErrorDatabase code:-128 errorLevel:1 underlyingError:v12 description:@"couldn't fetch self state"];
    }
  }
  id v13 = (void *)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)initSelfState:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = 0;
  id v10 = [(TransparencyManagedDataStore *)self fetchSelfValidationState:v8 uri:v9 error:&v15];
  id v11 = v15;
  if (!v10)
  {
    id v14 = 0;
    id v10 = [(TransparencyManagedDataStore *)self createSelfValidationState:v8 uri:v9 error:&v14];
    id v12 = v14;

    id v11 = v12;
  }
  if (a5 && v11) {
    *a5 = v11;
  }

  return v10 != 0;
}

- (BOOL)performBlockWithSelfState:(id)a3 uri:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_10017D1B4;
  id v33 = sub_10017D1C4;
  id v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10017D91C;
  v19[3] = &unk_1002C3900;
  v19[4] = self;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  uint64_t v23 = &v29;
  id v24 = &v25;
  id v15 = v12;
  id v22 = v15;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v19];
  if (a5)
  {
    id v16 = (void *)v30[5];
    if (v16) {
      *a5 = v16;
    }
  }
  char v17 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (BOOL)createFollowupTicket:(id)a3 uri:(id)a4 startTime:(id)a5 error:(id *)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10017DB60;
  v15[3] = &unk_1002C3928;
  id v16 = a5;
  id v10 = v16;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_retainBlock(v15);
  LOBYTE(a6) = [(TransparencyManagedDataStore *)self performBlockWithSelfState:v12 uri:v11 error:a6 block:v13];

  return (char)a6;
}

- (unint64_t)checkFollowupTicket:(id)a3 uri:(id)a4 checkTime:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10017DD50;
  v23[3] = &unk_1002C3950;
  id v13 = v10;
  id v24 = v13;
  id v14 = v11;
  id v25 = v14;
  id v15 = v12;
  id v26 = v15;
  id v16 = objc_retainBlock(v23);
  id v22 = 0;
  unsigned int v17 = [(TransparencyManagedDataStore *)self performBlockWithSelfState:v13 uri:v14 error:&v22 block:v16];
  id v18 = v22;
  id v19 = v18;
  if (v18)
  {
    unint64_t v20 = 0;
    if (a6) {
      *a6 = v18;
    }
  }
  else if (v17)
  {
    unint64_t v20 = 2;
  }
  else
  {
    unint64_t v20 = 1;
  }

  return v20;
}

- (BOOL)clearFollowupTicket:(id)a3 uri:(id)a4 error:(id *)a5
{
  return [(TransparencyManagedDataStore *)self performBlockWithSelfState:a3 uri:a4 error:a5 block:&stru_1002C3990];
}

- (id)initializeServerRPC:(id)a3 application:(int)a4 backgroundOpId:(id)a5 request:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  [v9 setState:2];
  id v12 = +[NSDate now];
  [v9 setRequestTime:v12];

  id v13 = +[NSUUID UUID];
  [v9 setRpcId:v13];

  id v14 = +[NSNumber numberWithInt:v8];
  id v15 = +[TransparencyApplication applicationIdentifierForValue:v14];
  [v9 setApplication:v15];

  [v9 setRequest:v10];
  [v9 setBackgroundOpId:v11];

  return v9;
}

- (id)createBatchQuery
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"RPCBatchQuery" inManagedObjectContext:v2];

  [v3 setRpcType:1];

  return v3;
}

- (id)createSingleQuery
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"RPCSingleQuery" inManagedObjectContext:v2];

  [v3 setRpcType:0];

  return v3;
}

- (id)createBatchQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TransparencyManagedDataStore *)self createBatchQuery];
  id v11 = [v9 application];
  id v12 = [v9 data];
  id v13 = [(TransparencyManagedDataStore *)self initializeServerRPC:v10 application:v11 backgroundOpId:v8 request:v12];

  id v14 = [v9 uriArray];

  id v15 = +[NSArray arrayWithArray:v14];
  [v10 setUris:v15];

  if ([(TransparencyManagedDataStore *)self persistWithError:a5])
  {
    id v16 = [v10 rpcId];
  }
  else
  {
    id v16 = 0;
  }
  +[TransparencyManagedDataStore cleanseError:a5];

  return v16;
}

- (id)createBatchQuery:(id)a3 error:(id *)a4
{
  return [(TransparencyManagedDataStore *)self createBatchQuery:a3 backgroundOpId:0 error:a4];
}

- (id)createSingleQuery:(id)a3 backgroundOpId:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TransparencyManagedDataStore *)self createSingleQuery];
  id v11 = [v9 application];
  id v12 = [v9 data];
  id v13 = [(TransparencyManagedDataStore *)self initializeServerRPC:v10 application:v11 backgroundOpId:v8 request:v12];

  id v14 = [v9 uri];

  id v15 = +[NSString stringWithString:v14];
  [v10 setUri:v15];

  if ([(TransparencyManagedDataStore *)self persistWithError:a5])
  {
    id v16 = [v10 rpcId];
  }
  else
  {
    id v16 = 0;
  }
  +[TransparencyManagedDataStore cleanseError:a5];

  return v16;
}

- (id)createSingleQuery:(id)a3 error:(id *)a4
{
  return [(TransparencyManagedDataStore *)self createSingleQuery:a3 backgroundOpId:0 error:a4];
}

- (BOOL)deleteServerRpcById:(id)a3 error:(id *)a4
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100195ECC;
  id v22 = sub_100195EDC;
  id v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100195EE4;
  v13[3] = &unk_1002C46D8;
  id v14 = self;
  id v6 = a3;
  id v15 = v6;
  id v16 = &v18;
  unsigned int v17 = &v24;
  [(TransparencyManagedDataStore *)v14 performBlockAndWait:v13];
  if (*((unsigned char *)v25 + 24))
  {
    BOOL v7 = 1;
  }
  else
  {
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"ServerRPC" write:1 code:-325 underlyingError:v19[5]];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100195FC0;
    v10[3] = &unk_1002B9F78;
    id v11 = v6;
    id v12 = &v18;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v10];
    if (a4)
    {
      id v8 = (void *)v19[5];
      if (v8) {
        *a4 = v8;
      }
    }

    BOOL v7 = *((unsigned char *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

- (id)fetchServerRpcById:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[NSFetchRequest fetchRequestWithEntityName:@"ServerRPC"];
  id v8 = +[NSPredicate predicateWithFormat:@"rpcId = %@", v6];

  [v7 setPredicate:v8];
  id v9 = [(TransparencyManagedDataStore *)self context];
  id v10 = [v9 executeFetchRequest:v7 error:a4];

  +[TransparencyManagedDataStore cleanseError:a4];
  if (v10 && [v10 count])
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)fetchLatestSingleQueryByUri:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSFetchRequest fetchRequestWithEntityName:@"RPCSingleQuery"];
  id v11 = +[NSPredicate predicateWithFormat:@"application = %@ && uri = %@", v8, v9];

  [v10 setPredicate:v11];
  id v12 = +[NSSortDescriptor sortDescriptorWithKey:@"requestTime" ascending:0];
  uint64_t v18 = v12;
  id v13 = +[NSArray arrayWithObjects:&v18 count:1];
  [v10 setSortDescriptors:v13];

  [v10 setFetchLimit:1];
  id v14 = [(TransparencyManagedDataStore *)self context];
  id v15 = [v14 executeFetchRequest:v10 error:a5];

  +[TransparencyManagedDataStore cleanseError:a5];
  if (v15 && [v15 count])
  {
    id v16 = [v15 objectAtIndexedSubscript:0];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)performAndWaitForRpcId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100195ECC;
  uint64_t v24 = sub_100195EDC;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100196550;
  v15[3] = &unk_1002C4A38;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  uint64_t v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)failRpcId:(id)a3 failure:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100195ECC;
  id v25 = sub_100195EDC;
  id v26 = 0;
  id obj = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001968F4;
  v16[3] = &unk_1002C4A80;
  id v9 = a4;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = &v21;
  [(TransparencyManagedDataStore *)self performAndWaitForRpcId:v8 error:&obj block:v16];
  objc_storeStrong(&v26, obj);
  id v10 = (id *)(v22 + 5);
  id v15 = (id)v22[5];
  +[TransparencyManagedDataStore cleanseError:&v15];
  objc_storeStrong(v10, v15);
  id v11 = v22;
  if (a5)
  {
    id v12 = (void *)v22[5];
    if (v12)
    {
      *a5 = v12;
      id v11 = v22;
    }
  }
  BOOL v13 = v11[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (BOOL)setResponseForRpcId:(id)a3 response:(id)a4 responseStatus:(id)a5 usedReversePush:(BOOL)a6 serverHint:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_100195ECC;
  long long v39 = sub_100195EDC;
  id v40 = 0;
  id obj = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100196C84;
  v27[3] = &unk_1002C4AE8;
  id v18 = v15;
  id v28 = v18;
  id v19 = v16;
  id v29 = v19;
  BOOL v33 = a6;
  id v20 = v17;
  id v30 = v20;
  uint64_t v31 = self;
  id v32 = &v35;
  [(TransparencyManagedDataStore *)self performAndWaitForRpcId:v14 error:&obj block:v27];
  objc_storeStrong(&v40, obj);
  uint64_t v21 = (id *)(v36 + 5);
  id v26 = (id)v36[5];
  +[TransparencyManagedDataStore cleanseError:&v26];
  objc_storeStrong(v21, v26);
  uint64_t v22 = v36;
  if (a8)
  {
    uint64_t v23 = (void *)v36[5];
    if (v23)
    {
      *a8 = v23;
      uint64_t v22 = v36;
    }
  }
  BOOL v24 = v22[5] == 0;

  _Block_object_dispose(&v35, 8);
  return v24;
}

- (id)getLatestSuccessfulSingleQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100195ECC;
  id v30 = sub_100195EDC;
  id v31 = 0;
  if (qword_10032EE88 != -1) {
    dispatch_once(&qword_10032EE88, &stru_1002C4B08);
  }
  BOOL v13 = qword_10032EE90;
  if (os_log_type_enabled((os_log_t)qword_10032EE90, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 141558530;
    uint64_t v33 = 1752392040;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "getting successful ServerRPC for %{mask.hash}@ younger than %@", buf, 0x20u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100197234;
  v19[3] = &unk_1002C4B30;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  uint64_t v23 = self;
  BOOL v24 = &v26;
  id v25 = a6;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v19];
  id v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v17;
}

- (id)getLatestSuccessfulBatchQueryForUri:(id)a3 application:(id)a4 requestYoungerThan:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100195ECC;
  id v29 = sub_100195EDC;
  id v30 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100197584;
  v18[3] = &unk_1002C4B30;
  id v13 = v11;
  id v19 = v13;
  id v14 = v12;
  id v20 = v14;
  id v21 = self;
  BOOL v24 = a6;
  id v15 = v10;
  id v22 = v15;
  uint64_t v23 = &v25;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v18];
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);

  return v16;
}

- (BOOL)hasPendingSingleQueryForUri:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100195ECC;
  id v30 = sub_100195EDC;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100197A74;
  v17[3] = &unk_1002C4B58;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  id v20 = &v22;
  id v21 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v17];
  if (v27[5])
  {
    if (qword_10032EE88 != -1) {
      dispatch_once(&qword_10032EE88, &stru_1002C4B78);
    }
    id v12 = qword_10032EE90;
    if (os_log_type_enabled((os_log_t)qword_10032EE90, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = v27[5];
      *(_DWORD *)long long buf = 141558530;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v36 = 2112;
      uint64_t v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to count number of pending single queries for %{mask.hash}@: %@", buf, 0x20u);
    }
  }
  if (a5)
  {
    id v14 = (void *)v27[5];
    if (v14) {
      *a5 = v14;
    }
  }
  BOOL v15 = v23[3] != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (void)garbageCollectServerRPCs:(id *)a3
{
  if (qword_10032EE88 != -1) {
    dispatch_once(&qword_10032EE88, &stru_1002C4B98);
  }
  long long v5 = qword_10032EE90;
  if (os_log_type_enabled((os_log_t)qword_10032EE90, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting pending server RPCs", buf, 2u);
  }
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kTransparencyMaxmimumDownloadRecordLifetime];
  BOOL v7 = +[NSPredicate predicateWithFormat:@"state == %@ && requestTime < %@", &off_1002D9D38, v6];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"RPCSingleQuery" predicate:v7 error:a3];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"RPCBatchQuery" predicate:v7 error:a3];
  if (qword_10032EE88 != -1) {
    dispatch_once(&qword_10032EE88, &stru_1002C4BB8);
  }
  id v8 = qword_10032EE90;
  if (os_log_type_enabled((os_log_t)qword_10032EE90, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Garbage collecting completed server RPCs", v11, 2u);
  }
  id v9 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumCompletedRequestLifetime];

  id v10 = +[NSPredicate predicateWithFormat:@"state != %@ && responseTime < %@", &off_1002D9D38, v9];

  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"RPCSingleQuery" predicate:v10 error:a3];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"RPCBatchQuery" predicate:v10 error:a3];
}

- (BOOL)deleteServerRPCs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_10032EE88 != -1) {
    dispatch_once(&qword_10032EE88, &stru_1002C4BD8);
  }
  BOOL v7 = qword_10032EE90;
  if (os_log_type_enabled((os_log_t)qword_10032EE90, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Deleting cached server RPCs", buf, 2u);
  }
  id v8 = +[NSPredicate predicateWithFormat:@"application == %@", v6];
  BOOL v9 = [(TransparencyManagedDataStore *)self garbageCollectEntity:@"ServerRPC" predicate:v8 error:a4];

  return v9;
}

- (BOOL)deleteCompletedSingleQueryForUris:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_10032EE88 != -1) {
    dispatch_once(&qword_10032EE88, &stru_1002C4BF8);
  }
  id v10 = (void *)qword_10032EE90;
  if (os_log_type_enabled((os_log_t)qword_10032EE90, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 141558274;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting cached server RPCs for %{mask.hash}@", buf, 0x16u);
  }
  uint64_t v13 = +[NSPredicate predicateWithFormat:@"uri IN %@ && application == %@ && state != %@", v8, v9, &off_1002D9D38];
  BOOL v14 = [(TransparencyManagedDataStore *)self garbageCollectEntity:@"RPCSingleQuery" predicate:v13 error:a5];

  return v14;
}

- (id)createIDSKTVerification:(id)a3 application:(id)a4 accountKey:(id)a5 idsResponseTime:(id)a6 serverLoggableDatas:(id)a7 optedIn:(unint64_t)a8 type:(unint64_t)a9 syncedLoggableDatas:(id)a10 verificationId:(id)a11 error:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a11;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  uint64_t v56 = sub_1001A498C;
  v57 = sub_1001A499C;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = sub_1001A498C;
  __int16 v51 = sub_1001A499C;
  id v52 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001A49A4;
  v35[3] = &unk_1002C5108;
  v35[4] = self;
  id v24 = v17;
  id v36 = v24;
  id v25 = v18;
  id v37 = v25;
  id v26 = v19;
  id v38 = v26;
  unint64_t v45 = a8;
  id v27 = v20;
  id v39 = v27;
  id v28 = v21;
  id v40 = v28;
  unint64_t v46 = a9;
  id v29 = v22;
  id v41 = v29;
  id v30 = v23;
  id v42 = v30;
  id v43 = &v47;
  uint64_t v44 = &v53;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v35];
  if (a12)
  {
    id v31 = (void *)v48[5];
    if (v31) {
      *a12 = v31;
    }
  }
  id v32 = (id)v54[5];

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v32;
}

- (id)createIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 type:(unint64_t)a6 syncedLoggableDatas:(id)a7 verificationId:(id)a8 error:(id *)a9
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v15 accountKey];
  id v19 = [v15 idsResponseTime];
  id v20 = [v15 serverLoggableDatas];
  id v21 = [v15 optedIn];

  id v22 = [(TransparencyManagedDataStore *)self createIDSKTVerification:v17 application:v16 accountKey:v18 idsResponseTime:v19 serverLoggableDatas:v20 optedIn:v21 type:a6 syncedLoggableDatas:v14 verificationId:v13 error:a9];

  return v22;
}

- (id)createPeerIDSKTVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 error:(id *)a6
{
  return [(TransparencyManagedDataStore *)self createIDSKTVerification:a3 application:a4 verificationInfo:a5 type:0 syncedLoggableDatas:0 verificationId:0 error:a6];
}

- (id)onMocFetchVerificationForVerificationId:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequestID"];
  id v8 = +[NSPredicate predicateWithFormat:@"requestId == %@", v6];

  [v7 setPredicate:v8];
  [v7 setRelationshipKeyPathsForPrefetching:&off_1002DA528];
  id v9 = [(TransparencyManagedDataStore *)self context];
  id v10 = [v9 executeFetchRequest:v7 error:a4];

  +[TransparencyManagedDataStore cleanseError:a4];
  if ([v10 count])
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
    id v12 = [v11 idsKTVerification];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)performAndWaitForVerificationId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001A498C;
  id v24 = sub_1001A499C;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001A5294;
  v15[3] = &unk_1002C4A38;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)resetVerificationsToPending:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1001A498C;
  id v21 = sub_1001A499C;
  id v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A5554;
  v13[3] = &unk_1002B7A58;
  id v14 = self;
  id v16 = &v17;
  id v6 = a3;
  id v15 = v6;
  [(TransparencyManagedDataStore *)v14 performBlockAndWait:v13];
  BOOL v7 = v18;
  if (a4)
  {
    id v8 = (void *)v18[5];
    if (v8)
    {
      *a4 = v8;
      BOOL v7 = v18;
    }
  }
  if (v7[5])
  {
    if (qword_10032EF20 != -1) {
      dispatch_once(&qword_10032EF20, &stru_1002C5148);
    }
    id v9 = qword_10032EF28;
    if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v18[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to reset peer verifications to pending: %@", buf, 0xCu);
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = [(TransparencyManagedDataStore *)self resetPeersToPending:v6 error:a4];
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (BOOL)performForPendingVerfications:(id)a3 uri:(id)a4 responseOlderThan:(id)a5 error:(id *)a6 batchSize:(unint64_t)a7 block:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_1001A498C;
  id v39 = sub_1001A499C;
  id v40 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001A5B5C;
  v27[3] = &unk_1002C5170;
  void v27[4] = self;
  id v32 = &v35;
  id v18 = v15;
  id v28 = v18;
  id v19 = v14;
  id v29 = v19;
  id v20 = v16;
  id v30 = v20;
  unint64_t v34 = a7;
  id v21 = v17;
  id v31 = v21;
  uint64_t v33 = &v41;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v27];
  if (a6)
  {
    id v22 = (void *)v36[5];
    if (v22) {
      *a6 = v22;
    }
  }
  if (*((unsigned char *)v42 + 24))
  {
    BOOL v23 = 1;
  }
  else
  {
    if (qword_10032EF20 != -1) {
      dispatch_once(&qword_10032EF20, &stru_1002C5190);
    }
    uint64_t v24 = qword_10032EF28;
    if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v36[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v46 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to perform block for pending verifications: %@", buf, 0xCu);
    }
    BOOL v23 = *((unsigned char *)v42 + 24) != 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v23;
}

- (id)pendingVerificationURIs:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1001A498C;
  id v27 = sub_1001A499C;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1001A498C;
  id v21 = sub_1001A499C;
  id v22 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A5EC4;
  v11[3] = &unk_1002C51B8;
  id v12 = self;
  id v14 = &v17;
  id v7 = a3;
  id v15 = &v23;
  unint64_t v16 = a4;
  id v13 = v7;
  [(TransparencyManagedDataStore *)v12 performBlockAndWait:v11];
  if (a5)
  {
    id v8 = (void *)v18[5];
    if (v8) {
      *a5 = v8;
    }
  }
  id v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (id)peerVerificationIdForUri:(id)a3 application:(id)a4 verificationInfo:(id)a5 newerThan:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  unint64_t v45 = sub_1001A498C;
  uint64_t v46 = sub_1001A499C;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_1001A498C;
  id v40 = sub_1001A499C;
  id v41 = 0;
  unint64_t v16 = [KTLoggableDataArray alloc];
  uint64_t v17 = [v14 serverLoggableDatas];
  id v18 = [(KTLoggableDataArray *)v16 initWithLoggableDatas:v17];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001A63F0;
  v27[3] = &unk_1002C51E0;
  id v19 = v13;
  id v28 = v19;
  id v20 = v12;
  id v29 = v20;
  id v21 = v15;
  id v30 = v21;
  id v22 = v14;
  id v31 = v22;
  id v32 = self;
  unint64_t v34 = &v36;
  uint64_t v23 = v18;
  uint64_t v33 = v23;
  uint64_t v35 = &v42;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v27];
  if (a7)
  {
    uint64_t v24 = (void *)v37[5];
    if (v24) {
      *a7 = v24;
    }
  }
  id v25 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v25;
}

- (id)fetchOrCreateVerification:(id)a3 application:(id)a4 verificationInfo:(id)a5 fetchNow:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v8)
  {
    +[TransparencySettings defaultQueryCacheTimeout];
    id v19 = +[NSDate dateWithTimeIntervalSinceNow:-v18];
    uint64_t v20 = [(TransparencyManagedDataStore *)self peerVerificationIdForUri:v12 application:v13 verificationInfo:v14 newerThan:v19 error:a7];
    if (v20)
    {
      id v21 = (void *)v20;
      if (qword_10032EF20 != -1) {
        dispatch_once(&qword_10032EF20, &stru_1002C5240);
      }
      id v22 = qword_10032EF28;
      if (!os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v25 = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      id v30 = v12;
      uint64_t v23 = "re-using verificationId %{public}@ for %{mask.hash}@";
    }
    else
    {
      id v21 = [(TransparencyManagedDataStore *)self createPeerIDSKTVerification:v12 application:v13 verificationInfo:v14 error:a7];
      if (qword_10032EF20 != -1) {
        dispatch_once(&qword_10032EF20, &stru_1002C5220);
      }
      id v22 = qword_10032EF28;
      if (!os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v25 = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2160;
      uint64_t v28 = 1752392040;
      __int16 v29 = 2112;
      id v30 = v12;
      uint64_t v23 = "created verificationId %{public}@ for %{mask.hash}@ none cached";
    }
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v25, 0x20u);
LABEL_17:
    id v17 = v21;

    goto LABEL_18;
  }
  id v15 = [(TransparencyManagedDataStore *)self createPeerIDSKTVerification:v12 application:v13 verificationInfo:v14 error:a7];
  if (qword_10032EF20 != -1) {
    dispatch_once(&qword_10032EF20, &stru_1002C5200);
  }
  unint64_t v16 = qword_10032EF28;
  if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543874;
    uint64_t v26 = v15;
    __int16 v27 = 2160;
    uint64_t v28 = 1752392040;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "created verificationId %{public}@ for %{mask.hash}@ because fetchNow", (uint8_t *)&v25, 0x20u);
  }
  id v17 = v15;
LABEL_18:

  return v17;
}

- (void)garbageCollectVerifications:(id *)a3
{
  if (qword_10032EF20 != -1) {
    dispatch_once(&qword_10032EF20, &stru_1002C5260);
  }
  long long v5 = qword_10032EF28;
  if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting IDSKTVerifications", buf, 2u);
  }
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumPendingRequestLifetime];
  id v7 = +[NSPredicate predicateWithFormat:@"creationTime < %@", v6];

  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"IDSKTVerification" predicate:v7 error:a3];
  BOOL v8 = +[NSPredicate predicateWithFormat:@"peerStateFailure == nil && peerStateMostRecent == nil && peerStateMostRecentSuccess == nil && peerStateMostRecentCompleted == nil"];

  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"IDSKTVerification" predicate:v8 error:a3];
}

- (void)deleteNonRecentVerificationsForApplication:(id)a3 error:(id *)a4
{
  +[NSPredicate predicateWithFormat:@"application == %@ && peerStateFailure == nil && peerStateMostRecent == nil && peerStateMostRecentSuccess == nil && peerStateMostRecentCompleted == nil", a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"IDSKTVerification" predicate:v6 error:a4];
}

- (BOOL)disableCacheHitsForUris:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_10032EF20 != -1) {
    dispatch_once(&qword_10032EF20, &stru_1002C5280);
  }
  uint64_t v10 = (void *)qword_10032EF28;
  if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = v10;
    id v12 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 141558274;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Disabling future cache hits for %{mask.hash}@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v32 = sub_1001A498C;
  uint64_t v33 = sub_1001A499C;
  id v34 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001A6F78;
  v21[3] = &unk_1002BC290;
  v21[4] = self;
  uint64_t v24 = buf;
  id v13 = v8;
  id v22 = v13;
  id v14 = v9;
  id v23 = v14;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v21];
  uint64_t v15 = *(void *)&buf[8];
  if (a5)
  {
    unint64_t v16 = *(void **)(*(void *)&buf[8] + 40);
    if (v16)
    {
      *a5 = v16;
      uint64_t v15 = *(void *)&buf[8];
    }
  }
  uint64_t v17 = *(void *)(v15 + 40);
  if (v17)
  {
    if (qword_10032EF20 != -1) {
      dispatch_once(&qword_10032EF20, &stru_1002C52C0);
    }
    double v18 = qword_10032EF28;
    if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)int v25 = 141558530;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to disable cache hits for %{mask.hash}@: %@", v25, 0x20u);
    }
  }

  _Block_object_dispose(buf, 8);
  return v17 == 0;
}

- (unint64_t)countOutstandingVerificationsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"verificationResult == %d && application == %@", 2, a3];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"IDSKTVerification" predicate:v6 error:a4];

  return v7;
}

- (unint64_t)countTotalVerificationsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application == %@", a3];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"IDSKTVerification" predicate:v6 error:a4];

  return v7;
}

- (BOOL)onMocLogVerificationMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0;
  unint64_t v7 = [(TransparencyManagedDataStore *)self countOutstandingVerificationsForApplication:v6 error:&v23];
  id v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_10032EF20 != -1) {
      dispatch_once(&qword_10032EF20, &stru_1002C52E0);
    }
    id v9 = qword_10032EF28;
    if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to get outstanding IDSKTVerifications for %@: %@", buf, 0x16u);
    }
    BOOL v10 = 0;
    if (!a4 || !v8)
    {
      id v16 = v8;
      goto LABEL_20;
    }
    BOOL v11 = v8;
    goto LABEL_17;
  }
  id v12 = [(TransparencyManagedDataStore *)self logger];
  id v13 = +[NSNumber numberWithUnsignedInteger:v7];
  id v14 = +[TransparencyAnalytics formatEventName:@"PendVer" application:v6];
  [v12 logMetric:v13 withName:v14];

  id v22 = v8;
  unint64_t v15 = [(TransparencyManagedDataStore *)self countTotalVerificationsForApplication:v6 error:&v22];
  id v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v18 = [(TransparencyManagedDataStore *)self logger];
    uint64_t v19 = +[NSNumber numberWithUnsignedInteger:v15];
    uint64_t v20 = +[TransparencyAnalytics formatEventName:@"TotVer" application:v6];
    [v18 logMetric:v19 withName:v20];

    BOOL v10 = 1;
    goto LABEL_20;
  }
  if (qword_10032EF20 != -1) {
    dispatch_once(&qword_10032EF20, &stru_1002C5300);
  }
  uint64_t v17 = qword_10032EF28;
  if (os_log_type_enabled((os_log_t)qword_10032EF28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to get total IDSKTVerifications for %@: %@", buf, 0x16u);
  }
  BOOL v10 = 0;
  if (a4 && v16)
  {
    BOOL v11 = v16;
LABEL_17:
    id v16 = v11;
    BOOL v10 = 0;
    *a4 = v16;
  }
LABEL_20:

  return v10;
}

- (id)createRecordFromLoggableData:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TransparencyManagedDataStore *)self context];
  id v9 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTDeviceRecord" inManagedObjectContext:v8];

  if (v9)
  {
    BOOL v10 = [v6 deviceID];
    [v9 setDeviceId:v10];

    id v14 = v6;
    BOOL v11 = +[NSArray arrayWithObjects:&v14 count:1];
    id v12 = +[TransparencyManagedDataStore serializeLoggableDatas:v11];
    [v9 setLoggableData:v12];

    [v9 setApplication:v7];
  }

  return v9;
}

- (BOOL)performAndWaitForDeviceId:(id)a3 application:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = sub_1001A799C;
  uint64_t v30 = sub_1001A79AC;
  id v31 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001A79B4;
  v19[3] = &unk_1002B7A30;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  id v22 = self;
  uint64_t v24 = &v26;
  id v15 = v12;
  id v23 = v15;
  id v25 = &v32;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v19];
  if (a5)
  {
    id v16 = (void *)v27[5];
    if (v16) {
      *a5 = v16;
    }
  }
  char v17 = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (id)createRequest
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTRequest" inManagedObjectContext:v2];

  return v3;
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 type:(unint64_t)a7 error:(id *)a8
{
  return [(TransparencyManagedDataStore *)self createRequestWithUri:a3 application:a4 accountKey:a5 serverData:a6 syncedData:0 queryRequest:0 queryResponse:0 type:a7 clientId:0 error:a8];
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 error:(id *)a11
{
  return [(TransparencyManagedDataStore *)self createRequestWithUri:a3 application:a4 accountKey:a5 serverData:a6 syncedData:a7 queryRequest:a8 queryResponse:a9 type:a10 clientId:0 error:a11];
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 queryRequest:(id)a8 queryResponse:(id)a9 type:(unint64_t)a10 clientId:(id)a11 error:(id *)a12
{
  id v18 = a11;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  uint64_t v26 = +[NSDate date];
  id v27 = +[NSDate date];
  id v30 = [(TransparencyManagedDataStore *)self createRequestWithUri:v25 application:v24 accountKey:v23 serverData:v22 syncedData:v21 idsResponseTime:v26 queryRequest:v20 queryResponse:v19 responseDate:v27 type:a10 clientId:v18 error:a12];

  return v30;
}

- (id)createRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 serverData:(id)a6 syncedData:(id)a7 idsResponseTime:(id)a8 queryRequest:(id)a9 queryResponse:(id)a10 responseDate:(id)a11 type:(unint64_t)a12 clientId:(id)a13 error:(id *)a14
{
  id v19 = a3;
  id v37 = a4;
  id v20 = a5;
  id v42 = a6;
  id v41 = a7;
  id v40 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a13;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = sub_1001A8368;
  v67 = sub_1001A8378;
  id v68 = 0;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = sub_1001A8368;
  v61 = sub_1001A8378;
  id v62 = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001A8380;
  v43[3] = &unk_1002C5388;
  v43[4] = self;
  v54 = &v57;
  id v36 = v19;
  id v44 = v36;
  id v38 = v37;
  id v45 = v38;
  id v25 = v20;
  id v46 = v25;
  id v26 = v24;
  id v47 = v26;
  id v27 = v21;
  id v48 = v27;
  id v28 = v22;
  id v49 = v28;
  id v29 = v23;
  id v50 = v29;
  id v30 = v40;
  id v51 = v30;
  id v31 = v41;
  id v52 = v31;
  id v32 = v42;
  uint64_t v55 = &v63;
  unint64_t v56 = a12;
  id v53 = v32;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v43];
  if (a14)
  {
    uint64_t v33 = (void *)v58[5];
    if (v33) {
      *a14 = v33;
    }
  }
  id v34 = (id)v64[5];

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v34;
}

- (id)requests:(id *)a3
{
  long long v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequest"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 executeFetchRequest:v5 error:a3];

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", @"KTRequest", 0, -128);
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (unint64_t)requestCount:(id *)a3
{
  long long v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequest"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:a3];
  return (unint64_t)v7;
}

- (id)fetchRequestForUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequestID"];
  id v8 = +[NSPredicate predicateWithFormat:@"requestId == %@", v6];
  [v7 setPredicate:v8];

  [v7 setRelationshipKeyPathsForPrefetching:&off_1002DA558];
  id v9 = [(TransparencyManagedDataStore *)self context];
  id v10 = [v9 executeFetchRequest:v7 error:a4];

  +[TransparencyManagedDataStore cleanseError:a4];
  if ([v10 count] == (id)1)
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
    id v12 = [v11 request];
  }
  else
  {
    id v13 = [v10 count];
    if (a4 && (unint64_t)v13 >= 2)
    {
      +[TransparencyError errorWithDomain:kTransparencyErrorDatabase, -57, *a4, @"Fetch returned too many requests for requestId = %@", v6 code underlyingError description];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = v14;
      [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTRequestID" write:0 code:-57 underlyingError:v14];
      if (qword_10032EF40 != -1) {
        dispatch_once(&qword_10032EF40, &stru_1002C53A8);
      }
      id v15 = qword_10032EF48;
      if (os_log_type_enabled((os_log_t)qword_10032EF48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Fetch returned too many requests for requestId = %@", buf, 0xCu);
      }
    }
    id v16 = [v10 count];
    id v12 = 0;
    if (a4 && !v16)
    {
      +[TransparencyError errorWithDomain:kTransparencyErrorDatabase, -58, *a4, @"Fetch returned no requests for requestId = %@", v6 code underlyingError description];
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = v17;
      [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTRequestID" hardFailure:0 write:0 code:-58 underlyingError:v17];
      if (qword_10032EF40 != -1) {
        dispatch_once(&qword_10032EF40, &stru_1002C53C8);
      }
      id v18 = qword_10032EF48;
      if (os_log_type_enabled((os_log_t)qword_10032EF48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Fetch returned no requests for requestId = %@", buf, 0xCu);
      }
      id v12 = 0;
    }
  }

  return v12;
}

- (id)fetchRequestsForURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequest"];
  id v8 = +[NSPredicate predicateWithFormat:@"uri == %@", v6];

  [v7 setPredicate:v8];
  id v9 = [(TransparencyManagedDataStore *)self context];
  id v10 = [v9 executeFetchRequest:v7 error:a4];

  +[TransparencyManagedDataStore cleanseError:a4];

  return v10;
}

- (id)fetchRequestWithUri:(id)a3 application:(id)a4 accountKey:(id)a5 loggableDatas:(id)a6 youngerThan:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequest"];
  id v20 = +[NSPredicate predicateWithFormat:@"uri == %@ && application == %@ && accountKey == %@ && serverLoggableDatas == %@ && requestTime > %@", v18, v17, v16, v15, v14];

  [v19 setPredicate:v20];
  id v21 = +[NSSortDescriptor sortDescriptorWithKey:@"requestTime" ascending:0];
  id v28 = v21;
  id v22 = +[NSArray arrayWithObjects:&v28 count:1];
  [v19 setSortDescriptors:v22];

  [v19 setFetchLimit:1];
  [v19 setPropertiesToFetch:&off_1002DA570];
  id v23 = [(TransparencyManagedDataStore *)self context];
  id v24 = [v23 executeFetchRequest:v19 error:a8];

  +[TransparencyManagedDataStore cleanseError:a8];
  if (v24 && [v24 count])
  {
    id v25 = [v24 objectAtIndexedSubscript:0];
    id v26 = [v25 requestId];
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (void)performForRequestsWithPendingResponses:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  +[NSPredicate predicateWithFormat:@"verificationResult == %d && application == %@", 2, a3];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(TransparencyManagedDataStore *)self performOnRequestsForPredicate:v9 enforceMax:1 error:a4 block:v8];
}

- (id)fetchCompletedRequests:(id)a3 olderThan:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(TransparencyManagedDataStore *)self persistWithError:a5])
  {
    id v10 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequest"];
    [v10 setReturnsDistinctResults:1];
    id v11 = +[NSPredicate predicateWithFormat:@"requestTime < %@ && (verificationResult == %d || verificationResult == %d) && application == %@", v9, 1, 0, v8];
    [v10 setPredicate:v11];

    id v12 = [(TransparencyManagedDataStore *)self context];
    id v13 = [v12 executeFetchRequest:v10 error:a5];
  }
  else
  {
    id v13 = 0;
  }
  if (qword_10032EF40 != -1) {
    dispatch_once(&qword_10032EF40, &stru_1002C53E8);
  }
  id v14 = qword_10032EF48;
  if (os_log_type_enabled((os_log_t)qword_10032EF48, OS_LOG_TYPE_ERROR))
  {
    if (a5) {
      id v15 = *a5;
    }
    else {
      id v15 = 0;
    }
    *(_DWORD *)long long buf = 138412290;
    id v18 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "unable to read completed requests: %@", buf, 0xCu);
  }
  +[TransparencyManagedDataStore cleanseError:a5];

  return v13;
}

- (BOOL)populateExistingRequestsToLookupTable:(id *)a3
{
  long long v5 = +[NSPredicate predicateWithFormat:@"requestIDCache.@count == 0"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A92A0;
  v12[3] = &unk_1002C5410;
  void v12[4] = self;
  [(TransparencyManagedDataStore *)self performOnBatchesOfEntity:@"KTRequest" predicate:v5 enforceMax:0 error:a3 block:v12];
  if (a3 && *a3)
  {
    id v6 = *a3;
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTRequest" write:1 code:-200 underlyingError:v6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001A93D4;
    v10[3] = &unk_1002B6CF8;
    id v11 = v6;
    id v7 = v6;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v10];

    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)garbageCollectRequests:(id)a3 olderThan:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[NSPredicate predicateWithFormat:@"requestTime < %@ && (verificationResult == %d || verificationResult == %d || verificationResult == %d) && application == %@", a4, 1, 0, 3, v8];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTRequest" predicate:v9 error:a5];
  id v10 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumPendingRequestLifetime];
  +[NSPredicate predicateWithFormat:@"requestTime < %@ && application == %@", v10, v8];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTRequest" predicate:v11 error:a5];
}

- (BOOL)resetRequestsForApplication:(id)a3 error:(id *)a4
{
  return [(TransparencyManagedDataStore *)self resetPendingRequests:a3 error:a4];
}

- (BOOL)resetRequestsForTLTReset:(id *)a3
{
  return [(TransparencyManagedDataStore *)self resetPendingRequests:a3];
}

- (BOOL)resetPendingRequests:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6) {
    +[NSPredicate predicateWithFormat:@"application == %@ AND verificationResult == %d", v6, 2];
  }
  else {
  id v7 = +[NSPredicate predicateWithFormat:@"verificationResult == %d", 2, v10];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A96FC;
  v11[3] = &unk_1002C5410;
  void v11[4] = self;
  [(TransparencyManagedDataStore *)self performOnRequestsForPredicate:v7 enforceMax:0 error:a4 block:v11];
  BOOL v8 = !a4 || !*a4;

  return v8;
}

- (BOOL)resetPendingRequests:(id *)a3
{
  return [(TransparencyManagedDataStore *)self resetPendingRequests:0 error:a3];
}

- (unint64_t)countOutstandingRequestsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"verificationResult == %d && application == %@", 2, a3];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"KTRequest" predicate:v6 error:a4];

  return v7;
}

- (unint64_t)countTotalRequestsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application == %@", a3];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"KTRequest" predicate:v6 error:a4];

  return v7;
}

- (BOOL)logRequestMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0;
  unint64_t v7 = [(TransparencyManagedDataStore *)self countOutstandingRequestsForApplication:v6 error:&v23];
  id v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_10032EF40 != -1) {
      dispatch_once(&qword_10032EF40, &stru_1002C5450);
    }
    id v9 = qword_10032EF48;
    if (os_log_type_enabled((os_log_t)qword_10032EF48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to get outstanding requests for %@: %@", buf, 0x16u);
    }
    BOOL v10 = 0;
    if (!a4 || !v8)
    {
      id v16 = v8;
      goto LABEL_20;
    }
    id v11 = v8;
    goto LABEL_17;
  }
  id v12 = [(TransparencyManagedDataStore *)self logger];
  id v13 = +[NSNumber numberWithUnsignedInteger:v7];
  id v14 = +[TransparencyAnalytics formatEventName:@"OutstandingRequests" application:v6];
  [v12 logMetric:v13 withName:v14];

  id v22 = v8;
  unint64_t v15 = [(TransparencyManagedDataStore *)self countTotalRequestsForApplication:v6 error:&v22];
  id v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = [(TransparencyManagedDataStore *)self logger];
    id v19 = +[NSNumber numberWithUnsignedInteger:v15];
    id v20 = +[TransparencyAnalytics formatEventName:@"TotalRequests" application:v6];
    [v18 logMetric:v19 withName:v20];

    BOOL v10 = 1;
    goto LABEL_20;
  }
  if (qword_10032EF40 != -1) {
    dispatch_once(&qword_10032EF40, &stru_1002C5470);
  }
  id v17 = qword_10032EF48;
  if (os_log_type_enabled((os_log_t)qword_10032EF48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to get total requests for %@: %@", buf, 0x16u);
  }
  BOOL v10 = 0;
  if (a4 && v16)
  {
    id v11 = v16;
LABEL_17:
    id v16 = v11;
    BOOL v10 = 0;
    *a4 = v16;
  }
LABEL_20:

  return v10;
}

- (void)performOnRequestsForPredicate:(id)a3 enforceMax:(BOOL)a4 error:(id *)a5 block:(id)a6
{
}

- (BOOL)performAndWaitForRequestId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001A8368;
  id v24 = sub_1001A8378;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001A9EEC;
  v15[3] = &unk_1002C4A38;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  id v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  id v19 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)performAndWaitForLatestSelfRequest:(id)a3 accountKey:(id)a4 block:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001AA08C;
  v11[3] = &unk_1002C5498;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v11];
}

- (id)createRequestFailure
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTRequestFailure" inManagedObjectContext:v2];

  return v3;
}

- (id)requestFailures:(id *)a3
{
  long long v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequestFailure"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  unint64_t v7 = [v6 executeFetchRequest:v5 error:a3];

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", @"KTRequestFailure", 0, -128);
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (unint64_t)requestFailureCount:(id *)a3
{
  long long v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequestFailure"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:a3];
  return (unint64_t)v7;
}

- (void)createKTRequestID:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TransparencyManagedDataStore *)self context];
  id v9 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTRequestID" inManagedObjectContext:v8];

  [v9 setRequestId:v7];
  [v9 setRequest:v6];
}

- (void)createIDSVerificationID:(id)a3 verification:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TransparencyManagedDataStore *)self context];
  id v9 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTRequestID" inManagedObjectContext:v8];

  [v9 setRequestId:v7];
  [v9 setIdsKTVerification:v6];
}

- (id)requestIds:(id *)a3
{
  long long v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTRequestID"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 executeFetchRequest:v5 error:a3];

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", @"KTRequestID", 0, -128);
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (id)createMutation:(id)a3 application:(id)a4 uri:(id)a5 mutationMs:(unint64_t)a6 spkiHash:(id)a7 receiptTime:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(TransparencyManagedDataStore *)self context];
  uint64_t v20 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTMutation" inManagedObjectContext:v19];

  if (v20)
  {
    [v20 setSmt:v14];
    [v20 setUnsigned:"mutationMs" value:a6];
    [v20 setReceiptTime:v18];
    [v20 setApplication:v15];
    [v20 setUri:v16];
    [v20 setSpkiHash:v17];
  }

  return v20;
}

- (id)signedMutationTimestamps:(id *)a3
{
  long long v5 = +[KTMutation fetchRequest];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 executeFetchRequest:v5 error:a3];

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", @"KTMutation", 0, -128);
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (unint64_t)signedMutationTimestampCount:(id *)a3
{
  long long v5 = +[KTMutation fetchRequest];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:a3];
  return (unint64_t)v7;
}

- (void)performForSMTsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  +[NSPredicate predicateWithFormat:@"signatureResult == %d && mergeResult == %d && application == %@", 2, 2, a3];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(TransparencyManagedDataStore *)self performOnBatchesOfEntity:@"KTMutation" predicate:v9 enforceMax:0 error:a4 block:v8];
}

- (unint64_t)countOutstandingSMTsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"(signatureResult == %d || mergeResult == %d) && application == %@", 2, 2, a3];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"KTMutation" predicate:v6 error:a4];

  return v7;
}

- (unint64_t)countTotalSMTsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application == %@", a3];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"KTMutation" predicate:v6 error:a4];

  return v7;
}

- (BOOL)logSMTMetricsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0;
  unint64_t v7 = [(TransparencyManagedDataStore *)self countOutstandingSMTsForApplication:v6 error:&v23];
  id v8 = v23;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002C54B8);
    }
    id v9 = qword_10032EF58;
    if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to get outstanding SMTs for %@: %@", buf, 0x16u);
    }
    BOOL v10 = 0;
    if (!a4 || !v8)
    {
      id v16 = v8;
      goto LABEL_20;
    }
    id v11 = v8;
    goto LABEL_17;
  }
  id v12 = [(TransparencyManagedDataStore *)self logger];
  id v13 = +[NSNumber numberWithUnsignedInteger:v7];
  id v14 = +[TransparencyAnalytics formatEventName:@"OutstandingSMTs" application:v6];
  [v12 logMetric:v13 withName:v14];

  id v22 = v8;
  unint64_t v15 = [(TransparencyManagedDataStore *)self countTotalSMTsForApplication:v6 error:&v22];
  id v16 = v22;

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = [(TransparencyManagedDataStore *)self logger];
    id v19 = +[NSNumber numberWithUnsignedInteger:v15];
    uint64_t v20 = +[TransparencyAnalytics formatEventName:@"TotalSMTs" application:v6];
    [v18 logMetric:v19 withName:v20];

    BOOL v10 = 1;
    goto LABEL_20;
  }
  if (qword_10032EF50 != -1) {
    dispatch_once(&qword_10032EF50, &stru_1002C54D8);
  }
  id v17 = qword_10032EF58;
  if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to get total SMTs for %@: %@", buf, 0x16u);
  }
  BOOL v10 = 0;
  if (a4 && v16)
  {
    id v11 = v16;
LABEL_17:
    id v16 = v11;
    BOOL v10 = 0;
    *a4 = v16;
  }
LABEL_20:

  return v10;
}

- (void)garbageCollectSMTs:(id *)a3
{
  if (qword_10032EF50 != -1) {
    dispatch_once(&qword_10032EF50, &stru_1002C54F8);
  }
  long long v5 = qword_10032EF58;
  if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Garbage collecting SMTs", buf, 2u);
  }
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumPendingRequestLifetime];
  unint64_t v7 = +[NSPredicate predicateWithFormat:@"receiptTime < %@", v6];

  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTMutation" predicate:v7 error:a3];
  if (qword_10032EF50 != -1) {
    dispatch_once(&qword_10032EF50, &stru_1002C5518);
  }
  id v8 = qword_10032EF58;
  if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Garbage collecting successfully verified SMTs", v11, 2u);
  }
  id v9 = +[NSDate dateWithTimeIntervalSinceNow:(double)(uint64_t)-kKTMaximumCompletedRequestLifetime];
  BOOL v10 = +[NSPredicate predicateWithFormat:@"receiptTime < %@ && signatureResult == %d && mergeResult == %d", v9, 1, 1];

  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTMutation" predicate:v10 error:a3];
}

- (BOOL)performForPendingSMTs:(id)a3 uri:(id)a4 error:(id *)a5 batchSize:(unint64_t)a6 block:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1001AB2F0;
  id v34 = sub_1001AB300;
  id v35 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001AB308;
  v23[3] = &unk_1002C5540;
  void v23[4] = self;
  id v27 = &v30;
  id v15 = v13;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  unint64_t v29 = a6;
  id v17 = v14;
  id v26 = v17;
  uint64_t v28 = &v36;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v23];
  if (a5)
  {
    id v18 = (void *)v31[5];
    if (v18) {
      *a5 = v18;
    }
  }
  if (*((unsigned char *)v37 + 24))
  {
    BOOL v19 = 1;
  }
  else
  {
    if (qword_10032EF50 != -1) {
      dispatch_once(&qword_10032EF50, &stru_1002C5560);
    }
    uint64_t v20 = qword_10032EF58;
    if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v31[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to perform block for pending SMTs: %@", buf, 0xCu);
    }
    BOOL v19 = *((unsigned char *)v37 + 24) != 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

- (id)getPendingSmtUris:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1001AB2F0;
  id v27 = sub_1001AB300;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1001AB2F0;
  uint64_t v21 = sub_1001AB300;
  id v22 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001AB6EC;
  v11[3] = &unk_1002C51B8;
  id v12 = self;
  id v14 = &v17;
  id v7 = a3;
  id v15 = &v23;
  unint64_t v16 = a4;
  id v13 = v7;
  [(TransparencyManagedDataStore *)v12 performBlockAndWait:v11];
  if (a5)
  {
    id v8 = (void *)v18[5];
    if (v8) {
      *a5 = v8;
    }
  }
  id v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (BOOL)deleteSMTsWithSPKINotIn:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_10032EF50 != -1) {
    dispatch_once(&qword_10032EF50, &stru_1002C5580);
  }
  BOOL v10 = qword_10032EF58;
  if (os_log_type_enabled((os_log_t)qword_10032EF58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deleting %@ SMTs with old SPKI hashes", buf, 0xCu);
  }
  id v11 = +[NSPredicate predicateWithFormat:@"application == %@ && (NOT spkiHash IN %@ || spkiHash == nil)", v9, v8];
  BOOL v12 = [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTMutation" predicate:v11 error:a5];

  return v12;
}

- (id)createSignedMutationTimestampsFailure
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTSMTFailure" inManagedObjectContext:v2];

  return v3;
}

- (id)signedMutationTimestampsFailures:(id *)a3
{
  long long v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTSMTFailure"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 executeFetchRequest:v5 error:a3];

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", @"KTSMTFailure", 0, -128);
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (unint64_t)signedMutationTimestampsFailureCount:(id *)a3
{
  long long v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTSMTFailure"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:a3];
  return (unint64_t)v7;
}

+ (id)serializeNSError:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  id v9 = v3;
  id v5 = v3;
  +[TransparencyManagedDataStore cleanseError:&v9];
  id v6 = v9;

  [v4 encodeObject:v6 forKey:@"error"];
  id v7 = [v4 encodedData];

  return v7;
}

+ (id)deserializeNSError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:a4];

  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v6 _enableStrictSecureDecodingMode];
  id v8 = [v6 decodeObjectOfClasses:v7 forKey:@"error"];

  return v8;
}

- (id)createFailureEvent:(id)a3 application:(id)a4 optInServer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v19 = 0;
  BOOL v10 = [a5 getAggregateOptInState:&v19];
  id v11 = v19;
  if (!v10)
  {
    if (qword_10032F1E8 != -1) {
      dispatch_once(&qword_10032F1E8, &stru_1002C7E70);
    }
    uint64_t v17 = qword_10032F1F0;
    if (os_log_type_enabled((os_log_t)qword_10032F1F0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "createFailureEvent: failed getting optin state: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if ([v10 state] != (id)1)
  {
LABEL_9:
    id v13 = 0;
    goto LABEL_10;
  }
  BOOL v12 = [(TransparencyManagedDataStore *)self context];
  id v13 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTFailureEvent" inManagedObjectContext:v12];

  if (v13)
  {
    [v13 setApplication:v9];
    id v14 = +[NSUUID UUID];
    [v13 setEventId:v14];

    id v15 = +[NSDate date];
    [v13 setFailureTime:v15];

    unint64_t v16 = +[TransparencyManagedDataStore serializeNSError:v8];
    [v13 setEncodedError:v16];
  }
LABEL_10:

  return v13;
}

- (id)fetchRecentFailureEvents:(id)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1001E2D6C;
  id v27 = sub_1001E2D7C;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1001E2D6C;
  id v21 = sub_1001E2D7C;
  id v22 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E2D84;
  v11[3] = &unk_1002C51B8;
  BOOL v12 = self;
  id v14 = &v17;
  id v7 = a3;
  id v15 = &v23;
  unint64_t v16 = a4;
  id v13 = v7;
  [(TransparencyManagedDataStore *)v12 performBlockAndWait:v11];
  if (a5)
  {
    id v8 = (void *)v18[5];
    if (v8) {
      *a5 = v8;
    }
  }
  id v9 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E3230;
  v8[3] = &unk_1002C7F18;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v8];
}

- (BOOL)performAndWaitForFailedEventId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1001E2D6C;
  uint64_t v25 = sub_1001E2D7C;
  id v26 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001E39B8;
  v15[3] = &unk_1002C4A38;
  id v10 = v8;
  id v16 = v10;
  uint64_t v17 = self;
  uint64_t v19 = &v21;
  id v11 = v9;
  id v18 = v11;
  uint64_t v20 = &v27;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a4)
  {
    BOOL v12 = (void *)v22[5];
    if (v12) {
      *a4 = v12;
    }
  }
  char v13 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (BOOL)clearAllFailureEvents:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application == %@", a3];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTFailureEvent" predicate:v6 error:a4];
  if (a4 && *a4)
  {
    id v7 = *a4;
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTFailureEvent" write:1 code:-171 underlyingError:v7];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001E3D60;
    v11[3] = &unk_1002B6CF8;
    id v12 = v7;
    id v8 = v7;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v11];

    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)clearFailureEvents:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E3F34;
  v8[3] = &unk_1002C7F18;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v8];
}

- (BOOL)clearSelfFailureRelatedData:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[NSPredicate predicateWithFormat:@"request.uri == %@ AND application == %@ AND request.type == %lld", v8, a3, 1];
  if (![(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTFailureEvent" predicate:v9 error:a5])
  {
    if (!a5) {
      goto LABEL_19;
    }
    if (*a5)
    {
      id v10 = *a5;
      [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTFailureEvent" write:1 code:-310 underlyingError:v10];
      if (qword_10032F1E8 != -1) {
        dispatch_once(&qword_10032F1E8, &stru_1002C7FB8);
      }
      id v11 = qword_10032F1F0;
      if (!os_log_type_enabled((os_log_t)qword_10032F1F0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)long long buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v10;
      id v12 = "failed to clear self-validation failure events for uri %@: %@";
      goto LABEL_16;
    }
LABEL_18:
    LOBYTE(a5) = 0;
    goto LABEL_19;
  }
  if (![(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTDeviceRecord" predicate:v9 error:a5])
  {
    if (!a5) {
      goto LABEL_19;
    }
    if (*a5)
    {
      id v10 = *a5;
      [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTDeviceRecord" write:1 code:-310 underlyingError:v10];
      if (qword_10032F1E8 != -1) {
        dispatch_once(&qword_10032F1E8, &stru_1002C7FD8);
      }
      id v11 = qword_10032F1F0;
      if (!os_log_type_enabled((os_log_t)qword_10032F1F0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)long long buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v10;
      id v12 = "failed to clear outdated device records for uri %@: %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  LOBYTE(a5) = 1;
LABEL_19:

  return (char)a5;
}

- (BOOL)clearSelfValidationFollowups:(id)a3 uri:(id)a4 error:(id *)a5
{
  id v27 = a3;
  id v7 = a4;
  id v8 = [(TransparencyManagedDataStore *)self followup];
  id v9 = [v8 getPendingFollowups];

  if ([v9 count])
  {
    id v26 = +[NSPredicate predicateWithFormat:@"eventId in %@ AND application == %@ AND request.type == %lld AND request.uri == %@", v9, v27, 1, v7];
    id v10 = +[KTFailureEvent fetchRequest];
    [v10 setPredicate:v26];
    [v10 setPropertiesToFetch:&off_1002DA5E8];
    [v10 setReturnsDistinctResults:1];
    [v10 setResultType:2];
    uint64_t v43 = 0;
    id v44 = &v43;
    uint64_t v45 = 0x3032000000;
    id v46 = sub_1001E2D6C;
    id v47 = sub_1001E2D7C;
    id v48 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    id v40 = sub_1001E2D6C;
    uint64_t v41 = sub_1001E2D7C;
    id v42 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001E4A64;
    v33[3] = &unk_1002C8000;
    id v35 = &v43;
    v33[4] = self;
    id v11 = v10;
    id v34 = v11;
    uint64_t v36 = &v37;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v33];
    if (v38[5])
    {
      if (qword_10032F1E8 != -1) {
        dispatch_once(&qword_10032F1E8, &stru_1002C8020);
      }
      id v12 = qword_10032F1F0;
      if (os_log_type_enabled((os_log_t)qword_10032F1F0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = v38[5];
        *(_DWORD *)long long buf = 138543618;
        id v51 = v9;
        __int16 v52 = 2112;
        uint64_t v53 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to fetch self-request eventIds: %{public}@ : %@", buf, 0x16u);
      }
      id v14 = (id *)(v38 + 5);
      id obj = (id)v38[5];
      +[TransparencyManagedDataStore cleanseError:&obj];
      objc_storeStrong(v14, obj);
    }
    id v15 = (void *)v44[5];
    if (v15 && [v15 count])
    {
      __int16 v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [(id)v44[5] count]);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v17 = [(id)v44[5] reverseObjectEnumerator];
      id v18 = [v17 countByEnumeratingWithState:&v28 objects:v49 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v29;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = [*(id *)(*((void *)&v28 + 1) + 8 * i) objectForKeyedSubscript:@"eventId"];
            [v16 addObject:v21];
          }
          id v18 = [v17 countByEnumeratingWithState:&v28 objects:v49 count:16];
        }
        while (v18);
      }
    }
    else
    {
      __int16 v16 = 0;
    }
    id v22 = +[TransparencyFollowup instance];
    unsigned __int8 v23 = [v22 clearFollowups:v16 error:a5];

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);
  }
  else
  {
    unsigned __int8 v23 = 1;
  }

  return v23;
}

- (id)createTreeHead
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTTreeHead" inManagedObjectContext:v2];

  return v3;
}

- (id)createTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logHeadHash:(id)a7 logType:(int64_t)a8 revision:(unint64_t)a9 gossip:(BOOL)a10
{
  BOOL v13 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a3;
  uint64_t v19 = [(TransparencyManagedDataStore *)self createTreeHead];
  [v19 setSth:v18];

  [v19 setIsMapHead:v13];
  [v19 setApplication:v16];
  [v19 setUnsigned:"logBeginTime" value:a6];
  [v19 setLogHeadHash:v17];
  [v19 setLogType:a8];
  [v19 setUnsigned:"revision" value:a9];
  [v19 setGossip:a10];
  [v19 setReceiptTime:CFAbsoluteTimeGetCurrent()];
  if (a8 != 3 || v13) {
    [v19 setInclusionVerified:2];
  }
  if (v13) {
    [v19 setConsistencyVerified:1];
  }
  if (qword_10032F208 != -1) {
    dispatch_once(&qword_10032F208, &stru_1002C83D0);
  }
  uint64_t v20 = (void *)qword_10032F210;
  if (os_log_type_enabled((os_log_t)qword_10032F210, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    id v22 = [v17 kt_hexString];
    int v24 = 138413570;
    uint64_t v25 = v22;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 1024;
    BOOL v29 = v13;
    __int16 v30 = 2048;
    unint64_t v31 = a6;
    __int16 v32 = 2048;
    int64_t v33 = a8;
    __int16 v34 = 2048;
    unint64_t v35 = a9;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Add new tree head: %@[%@] %d %llu %lld %lld", (uint8_t *)&v24, 0x3Au);
  }

  return v19;
}

- (BOOL)haveTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 gossip:(BOOL)a9 error:(id *)a10
{
  BOOL v13 = a4;
  id v16 = a5;
  id v17 = a3;
  id v18 = +[NSFetchRequest fetchRequestWithEntityName:@"KTTreeHead"];
  uint64_t v19 = +[NSNumber numberWithBool:v13];
  uint64_t v20 = +[NSPredicate predicateWithFormat:@"isMapHead == %@ && logHeadHash == %@ && application == %@ && logBeginTime == %llu && logType == %lld && revision == %llu", v19, v17, v16, a6, a7, a8];

  [v18 setPredicate:v20];
  uint64_t v21 = [(TransparencyManagedDataStore *)self context];
  id v25 = 0;
  id v22 = [v21 countForFetchRequest:v18 error:&v25];
  id v23 = v25;

  if (a10 && v23) {
    *a10 = v23;
  }
  +[TransparencyManagedDataStore cleanseError:a10];

  return v22 != 0;
}

- (id)treeHeads:(id *)a3
{
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTTreeHead"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v10 = 0;
  id v7 = [v6 executeFetchRequest:v5 error:&v10];
  id v8 = v10;

  if (v8)
  {
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTTreeHead" write:0 code:-128 underlyingError:v8];
    if (a3) {
      *a3 = v8;
    }
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (id)treeHeadsForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"KTTreeHead"];
  id v8 = +[NSPredicate predicateWithFormat:@"application == %@", v6];

  [v7 setPredicate:v8];
  id v9 = [(TransparencyManagedDataStore *)self context];
  id v13 = 0;
  id v10 = [v9 executeFetchRequest:v7 error:&v13];
  id v11 = v13;

  if (a4 && v11) {
    *a4 = v11;
  }
  +[TransparencyManagedDataStore cleanseError:a4];

  return v10;
}

- (unint64_t)treeHeadCount:(id *)a3
{
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTTreeHead"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:a3];
  return (unint64_t)v7;
}

- (id)fetchTreeHead:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = +[NSFetchRequest fetchRequestWithEntityName:@"KTTreeHead"];
  id v18 = +[NSNumber numberWithBool:v13];
  id v50 = v16;
  uint64_t v19 = +[NSPredicate predicateWithFormat:@"isMapHead == %@ && logHeadHash == %@ && application == %@ && logBeginTime == %lld && logType == %lld && revision == %lld", v18, v15, v16, a6, a7, a8];
  [v17 setPredicate:v19];

  uint64_t v20 = [(TransparencyManagedDataStore *)self context];
  id v60 = 0;
  id v51 = v17;
  uint64_t v21 = [v20 executeFetchRequest:v17 error:&v60];
  id v22 = v60;

  if ([v21 count])
  {
    id v47 = v15;
    if ((unint64_t)[v21 count] >= 2)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v48 = v21;
      id obj = v21;
      id v23 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v57;
        __int16 v26 = &qword_10032F000;
        id v27 = &qword_10032F000;
        uint64_t v52 = *(void *)v57;
        id v53 = v22;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v57 != v25) {
              objc_enumerationMutation(obj);
            }
            BOOL v29 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            if (v26[65] != -1) {
              dispatch_once(&qword_10032F208, &stru_1002C8410);
            }
            __int16 v30 = v27[66];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              log = v30;
              unint64_t v31 = [v29 logHeadHash];
              __int16 v32 = [v31 kt_hexString];
              int64_t v33 = [v29 application];
              id v34 = v24;
              unint64_t v35 = v27;
              unsigned int v36 = [v29 isMapHead];
              id v37 = [v29 logBeginTime];
              id v38 = [v29 logType];
              id v39 = [v29 revision];
              *(_DWORD *)long long buf = 138413570;
              uint64_t v63 = v32;
              __int16 v64 = 2112;
              id v65 = v33;
              __int16 v66 = 1024;
              int v67 = v36;
              id v27 = v35;
              id v24 = v34;
              __int16 v68 = 2048;
              unint64_t v69 = (unint64_t)v37;
              __int16 v70 = 2048;
              int64_t v71 = (int64_t)v38;
              __int16 v72 = 2048;
              unint64_t v73 = (unint64_t)v39;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fetch returned too dup head: %@[%@] %d %llu %lld %lld", buf, 0x3Au);

              __int16 v26 = &qword_10032F000;
              id v22 = v53;

              uint64_t v25 = v52;
            }
          }
          id v24 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v24);
      }

      uint64_t v21 = v48;
    }
    +[TransparencyManagedDataStore cleanseError:a9];
    id v40 = [v21 objectAtIndexedSubscript:0];
    id v15 = v47;
    uint64_t v41 = v50;
  }
  else
  {
    id v49 = v21;
    id v42 = [v15 kt_hexString];
    uint64_t v43 = +[TransparencyError errorWithDomain:kTransparencyErrorDatabase, -185, v22, @"Fetch returned no tree heads for hash: %@", v42 code underlyingError description];
    id v44 = v22;
    id v22 = (id)v43;

    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTTreeHead" hardFailure:0 write:0 code:-185 underlyingError:v22];
    if (qword_10032F208 != -1) {
      dispatch_once(&qword_10032F208, &stru_1002C83F0);
    }
    uint64_t v41 = v16;
    uint64_t v45 = qword_10032F210;
    if (os_log_type_enabled((os_log_t)qword_10032F210, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138413570;
      uint64_t v63 = v42;
      __int16 v64 = 2112;
      id v65 = v16;
      __int16 v66 = 1024;
      int v67 = v13;
      __int16 v68 = 2048;
      unint64_t v69 = a6;
      __int16 v70 = 2048;
      int64_t v71 = a7;
      __int16 v72 = 2048;
      unint64_t v73 = a8;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Fetch returned no tree heads for hash: %@[%@] %d %llu %lld %lld", buf, 0x3Au);
    }
    if (a9 && v22) {
      *a9 = v22;
    }

    id v40 = 0;
    uint64_t v21 = v49;
  }

  return v40;
}

- (id)fetchTreeHeadsWithoutHash:(id)a3 isMapHead:(BOOL)a4 application:(id)a5 logBeginTime:(unint64_t)a6 logType:(int64_t)a7 revision:(unint64_t)a8 error:(id *)a9
{
  BOOL v12 = a4;
  id v15 = a5;
  id v16 = a3;
  id v17 = +[NSFetchRequest fetchRequestWithEntityName:@"KTTreeHead"];
  id v18 = +[NSNumber numberWithBool:v12];
  uint64_t v19 = +[NSPredicate predicateWithFormat:@"isMapHead == %@ && logHeadHash != %@ && application == %@ && logBeginTime == %llu && logType == %lld && revision == %llu", v18, v16, v15, a6, a7, a8];

  [v17 setPredicate:v19];
  uint64_t v20 = [(TransparencyManagedDataStore *)self context];
  uint64_t v21 = [v20 executeFetchRequest:v17 error:a9];

  +[TransparencyManagedDataStore cleanseError:a9];

  return v21;
}

- (id)latestConsistencyVerifiedTreeHeadRevision:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_1001E8DAC;
  __int16 v28 = sub_1001E8DBC;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1001E8DAC;
  id v22 = sub_1001E8DBC;
  id v23 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E8DC4;
  v12[3] = &unk_1002C8478;
  id v8 = a3;
  id v16 = &v24;
  unint64_t v17 = a4;
  id v13 = v8;
  id v14 = self;
  id v15 = &v18;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v12];
  if (a5)
  {
    id v9 = (void *)v19[5];
    if (v9) {
      *a5 = v9;
    }
  }
  id v10 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (id)latestConsistencyVerifiedTreeHeadSTH:(id)a3 logBeginMs:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_1001E8DAC;
  __int16 v28 = sub_1001E8DBC;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_1001E8DAC;
  id v22 = sub_1001E8DBC;
  id v23 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E948C;
  v11[3] = &unk_1002C8500;
  BOOL v12 = self;
  id v14 = &v18;
  id v7 = a3;
  id v13 = v7;
  id v15 = &v24;
  unint64_t v16 = a4;
  unint64_t v17 = a5;
  [(TransparencyManagedDataStore *)v12 performBlockAndWait:v11];
  if (a5)
  {
    id v8 = (void *)v19[5];
    if (v8) {
      *a5 = v8;
    }
  }
  id v9 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v9;
}

- (id)unverifiedRevisions:(id)a3 isMapHead:(BOOL)a4 inclusion:(BOOL)a5 logBeginMs:(unint64_t)a6 error:(id *)a7
{
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  unint64_t v31 = sub_1001E8DAC;
  __int16 v32 = sub_1001E8DBC;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_1001E8DAC;
  uint64_t v26 = sub_1001E8DBC;
  id v27 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001E9C38;
  v14[3] = &unk_1002C8528;
  BOOL v20 = a5;
  BOOL v21 = a4;
  id v10 = a3;
  uint64_t v18 = &v28;
  unint64_t v19 = a6;
  id v15 = v10;
  unint64_t v16 = self;
  unint64_t v17 = &v22;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v14];
  if (a7)
  {
    id v11 = (void *)v23[5];
    if (v11) {
      *a7 = v11;
    }
  }
  id v12 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (BOOL)populateMissingLogHeadHashes:(id *)a3
{
  id v5 = +[NSPredicate predicateWithFormat:@"isMapHead == NO && logHeadHash == nil"];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001EA0CC;
  v12[3] = &unk_1002C5410;
  void v12[4] = self;
  [(TransparencyManagedDataStore *)self performOnBatchesOfEntity:@"KTTreeHead" predicate:v5 enforceMax:0 error:a3 block:v12];
  if (a3 && *a3)
  {
    id v6 = *a3;
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTTreeHead" write:1 code:-194 underlyingError:v6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001EA31C;
    v10[3] = &unk_1002B6CF8;
    id v11 = v6;
    id v7 = v6;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v10];

    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)performForPendingSTHs:(id)a3 olderThan:(id)a4 type:(unint64_t)a5 error:(id *)a6 block:(id)a7
{
  id v15 = a3;
  id v12 = a4;
  id v13 = a7;
  if (a5 > 3)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", *(&off_1002C8740 + a5), v15, v12, 2);
  }
  [(TransparencyManagedDataStore *)self performOnBatchesOfEntity:@"KTTreeHead" predicate:v14 enforceMax:0 error:a6 block:v13];
}

- (void)performForSTHsWithUnverifiedSignature:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  +[NSPredicate predicateWithFormat:@"application == %@ && signatureVerified == %d", a3, 2];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(TransparencyManagedDataStore *)self performOnBatchesOfEntity:@"KTTreeHead" predicate:v9 enforceMax:0 error:a4 block:v8];
}

- (void)performForSMHsWithUnverifiedMMD:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  +[NSPredicate predicateWithFormat:@"isMapHead = %@ && application == %@ && mmdVerified == %d", &__kCFBooleanTrue, a3, 2];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(TransparencyManagedDataStore *)self performOnBatchesOfEntity:@"KTTreeHead" predicate:v9 enforceMax:0 error:a4 block:v8];
}

- (void)performForSTHs:(id)a3 isMapHead:(BOOL)a4 revision:(id)a5 error:(id *)a6 block:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = +[NSNumber numberWithBool:v9];
  +[NSPredicate predicateWithFormat:@"isMapHead == %@ && application == %@ && revision == %@", v15, v14, v13];
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  [(TransparencyManagedDataStore *)self performOnBatchesOfEntity:@"KTTreeHead" predicate:v16 enforceMax:0 error:a6 block:v12];
}

- (void)garbageCollectSTHs:(id)a3 logBeginMs:(unint64_t)a4 olderThanDate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v13 = [(TransparencyManagedDataStore *)self latestConsistencyVerifiedTreeHeadRevision:v11 logBeginMs:a4 error:a6];
  id v12 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"isMapHead == NO && receiptTime < %@ && (consistencyVerified == %d || consistencyVerified == %d || consistencyVerified == %d) && application == %@ && revision != %llu", v10, 1, 0, 3, v11, [v13 unsignedLongLongValue]);

  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTTreeHead" predicate:v12 error:a6];
}

- (BOOL)shouldGarbageCollectSTH:(id)a3 application:(id)a4 logBeginMs:(unint64_t)a5 olderThanDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 isMapHead])
  {
    unsigned __int8 v13 = 0;
  }
  else
  {
    id v14 = [(TransparencyManagedDataStore *)self latestConsistencyVerifiedTreeHeadRevision:v11 logBeginMs:a5 error:0];
    id v15 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"isMapHead == NO && receiptTime < %@ && (consistencyVerified == %d || consistencyVerified == %d || consistencyVerified == %d) && application == %@ && revision != %llu", v12, 1, 0, 3, v11, [v14 unsignedLongLongValue]);
    unsigned __int8 v13 = [v15 evaluateWithObject:v10];
  }
  return v13;
}

- (unint64_t)countOutstandingSTHsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application == %@ && isMapHead == NO && (signatureVerified == %d || consistencyVerified == %d || inclusionVerified == %d)", a3, 2, 2, 2];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"KTTreeHead" predicate:v6 error:a4];

  return v7;
}

- (unint64_t)countTotalSTHsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application == %@", a3];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"KTTreeHead" predicate:v6 error:a4];

  return v7;
}

- (unint64_t)countOutstandingSMHsForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application == %@ && isMapHead == YES && (signatureVerified == %d || mmdVerified == %d || inclusionVerified == %d)", a3, 2, 2, 2];
  unint64_t v7 = [(TransparencyManagedDataStore *)self onMocCountEntity:@"KTTreeHead" predicate:v6 error:a4];

  return v7;
}

- (BOOL)logSTHMetricsForApplication:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001EAB8C;
  v7[3] = &unk_1002C85D0;
  id v8 = self;
  id v5 = a3;
  id v10 = &v12;
  id v11 = a4;
  id v9 = v5;
  [(TransparencyManagedDataStore *)v8 performBlockAndWait:v7];
  LOBYTE(a4) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)a4;
}

- (BOOL)deleteSTHs:(id)a3 logBeginMsLessThan:(unint64_t)a4 error:(id *)a5
{
  unint64_t v7 = +[NSPredicate predicateWithFormat:@"application == %@ && logBeginTime < %llu", a3, a4];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTTreeHead" predicate:v7 error:a5];
  if (a5 && *a5)
  {
    id v8 = *a5;
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"KTTreeHead" write:1 code:-171 underlyingError:v8];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001EB184;
    v12[3] = &unk_1002B6CF8;
    id v13 = v8;
    id v9 = v8;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v12];

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)reportFailedRevisions:(id)a3 failure:(id)a4 downloadType:(unint64_t)a5 application:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (a5 - 1 <= 2)
  {
    uint64_t v12 = +[TransparencyAnalytics formatEventName:*(&off_1002C8760 + a5 - 1) application:v11];
    v18[0] = v9;
    v17[0] = @"requestedRevisions";
    v17[1] = @"errorCode";
    id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
    v18[1] = v13;
    v17[2] = @"errorDomain";
    uint64_t v14 = [v10 domain];
    v18[2] = v14;
    char v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    id v16 = +[TransparencyAnalytics logger];
    [v16 logHardFailureForEventNamed:v12 withAttributes:v15];
  }
}

- (void)failHeadDownloadRecord:(id)a3 failure:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v32 = a4;
  id v9 = [v8 revisions];
  if (v9)
  {
    id v10 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:a5];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (os_variant_allows_internal_security_policies())
      {
        id v11 = [v8 downloadType];
        uint64_t v12 = [v8 application];
        [(TransparencyManagedDataStore *)self reportFailedRevisions:v10 failure:v32 downloadType:v11 application:v12];
      }
      id v13 = [v8 downloadType];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v10;
      id v14 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v30 = v10;
        unint64_t v31 = v9;
        uint64_t v16 = *(void *)v40;
        do
        {
          unint64_t v17 = 0;
          do
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v17);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unint64_t v19 = [v8 application];
              v34[0] = _NSConcreteStackBlock;
              v34[1] = 3221225472;
              v34[2] = sub_1001EB984;
              v34[3] = &unk_1002C86B8;
              id v38 = v13;
              id v35 = v8;
              unsigned int v36 = self;
              id v37 = v32;
              [(TransparencyManagedDataStore *)self performForSTHs:v19 isMapHead:v13 == (id)1 revision:v18 error:a5 block:v34];
            }
            else
            {
              if (qword_10032F208 != -1) {
                dispatch_once(&qword_10032F208, &stru_1002C8650);
              }
              BOOL v20 = (void *)qword_10032F210;
              if (os_log_type_enabled((os_log_t)qword_10032F210, OS_LOG_TYPE_ERROR))
              {
                BOOL v21 = v20;
                uint64_t v22 = [v8 downloadId];
                *(_DWORD *)long long buf = 138543618;
                uint64_t v45 = (uint64_t)v22;
                __int16 v46 = 2112;
                id v47 = v18;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "invalid revision type serialized from downloadId %{public}@: %@", buf, 0x16u);
              }
            }
            unint64_t v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v15);
        id v10 = v30;
        id v9 = v31;
      }
      id v23 = obj;
    }
    else
    {
      if (qword_10032F208 != -1) {
        dispatch_once(&qword_10032F208, &stru_1002C8630);
      }
      id v23 = (id)qword_10032F210;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v8 downloadId];
        uint64_t v25 = (void *)v24;
        if (a5) {
          id v26 = *a5;
        }
        else {
          id v26 = 0;
        }
        *(_DWORD *)long long buf = 138543618;
        uint64_t v45 = v24;
        __int16 v46 = 2112;
        id v47 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to deserialize revisions for downloadId %{public}@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (qword_10032F208 != -1) {
      dispatch_once(&qword_10032F208, &stru_1002C8610);
    }
    id v27 = (void *)qword_10032F210;
    if (os_log_type_enabled((os_log_t)qword_10032F210, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = v27;
      id v29 = [v8 downloadId];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v45 = (uint64_t)v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "STH download record type missing revisions for downloadId %{public}@", buf, 0xCu);
    }
  }
}

- (void)failHeadDownload:(id)a3 failure:(id)a4 logClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10032F208 != -1) {
    dispatch_once(&qword_10032F208, &stru_1002C86D8);
  }
  id v11 = qword_10032F210;
  if (os_log_type_enabled((os_log_t)qword_10032F210, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failing STH downloadId %{public}@", buf, 0xCu);
  }
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_1001EBED4;
  uint64_t v16 = &unk_1002C8720;
  unint64_t v17 = self;
  id v18 = v9;
  id v12 = v9;
  [(TransparencyManagedDataStore *)self performAndWaitForDownloadId:v8 error:0 block:&v13];
  [v10 deleteDownloadId:v8, v13, v14, v15, v16, v17];
}

- (id)failedHeadSignaturesWithRevisions:(id)a3 application:(id)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  unint64_t v19 = sub_1001E8DAC;
  id v20 = sub_1001E8DBC;
  id v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001EC19C;
  v11[3] = &unk_1002C45E8;
  id v7 = a4;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = &v16;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

- (id)createSignedTreeHeadFailure
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"KTSTHFailure" inManagedObjectContext:v2];

  return v3;
}

- (id)signedTreeHeadFailures:(id *)a3
{
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTSTHFailure"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 executeFetchRequest:v5 error:a3];

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", @"KTSTHFailure", 0, -128);
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (unint64_t)signedTreeHeadFailureCount:(id *)a3
{
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"KTSTHFailure"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 countForFetchRequest:v5 error:a3];

  +[TransparencyManagedDataStore cleanseError:a3];
  return (unint64_t)v7;
}

- (id)createDownloadRecord:(unint64_t)a3 moc:(id)a4 application:(id)a5
{
  id v7 = a5;
  id v8 = +[NSEntityDescription insertNewObjectForEntityForName:@"DownloadRecord" inManagedObjectContext:a4];
  [v8 setUnsigned:"downloadType" value:a3];
  [v8 setApplication:v7];

  id v9 = +[NSUUID UUID];
  [v8 setDownloadId:v9];

  [v8 setRequestTime:CFAbsoluteTimeGetCurrent()];

  return v8;
}

- (id)downloadRecords:(id *)a3
{
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"DownloadRecord"];
  id v6 = [(TransparencyManagedDataStore *)self context];
  id v7 = [v6 executeFetchRequest:v5 error:a3];

  if (a3 && *a3)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", @"DownloadRecord", 0, -128);
    +[TransparencyManagedDataStore cleanseError:a3];
  }

  return v7;
}

- (id)fetchDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[NSFetchRequest fetchRequestWithEntityName:@"DownloadRecord"];
  id v10 = +[NSPredicate predicateWithFormat:@"downloadType == %d && application = %@", a3, v8];

  [v9 setPredicate:v10];
  id v11 = [(TransparencyManagedDataStore *)self context];
  id v12 = [v11 executeFetchRequest:v9 error:a5];

  +[TransparencyManagedDataStore cleanseError:a5];
  if (v12 && [v12 count])
  {
    id v13 = [v12 objectAtIndexedSubscript:0];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)fetchDownloadRecordById:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"DownloadRecord"];
  id v8 = +[NSPredicate predicateWithFormat:@"downloadId = %@", v6];

  [v7 setPredicate:v8];
  id v9 = [(TransparencyManagedDataStore *)self context];
  id v10 = [v9 executeFetchRequest:v7 error:a4];

  +[TransparencyManagedDataStore cleanseError:a4];
  if (v10 && [v10 count])
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)hasPendingDownloadForUUID:(id)a3 error:(id *)a4
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = sub_1001ECAB0;
  uint64_t v18 = sub_1001ECAC0;
  id v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001ECAC8;
  v9[3] = &unk_1002C46D8;
  id v10 = self;
  id v5 = a3;
  id v11 = v5;
  id v12 = &v14;
  id v13 = &v20;
  [(TransparencyManagedDataStore *)v10 performBlockAndWait:v9];
  if (a4)
  {
    id v6 = (void *)v15[5];
    if (v6) {
      *a4 = v6;
    }
  }
  char v7 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (BOOL)setResponse:(id)a3 downloadId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = sub_1001ECAB0;
  uint64_t v24 = sub_1001ECAC0;
  id v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001ECD1C;
  v14[3] = &unk_1002B9800;
  id v9 = a4;
  id v15 = v9;
  uint64_t v16 = self;
  uint64_t v18 = &v20;
  id v10 = v8;
  id v17 = v10;
  id v19 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v14];
  if (a5)
  {
    id v11 = (void *)v21[5];
    if (v11) {
      *a5 = v11;
    }
  }
  char v12 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (BOOL)deleteDownloadRecordById:(id)a3 error:(id *)a4
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1001ECAB0;
  uint64_t v22 = sub_1001ECAC0;
  id v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001ED1F0;
  v13[3] = &unk_1002C46D8;
  uint64_t v14 = self;
  id v6 = a3;
  id v15 = v6;
  uint64_t v16 = &v18;
  id v17 = &v24;
  [(TransparencyManagedDataStore *)v14 performBlockAndWait:v13];
  if (*((unsigned char *)v25 + 24))
  {
    BOOL v7 = 1;
  }
  else
  {
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"DownloadRecord" write:1 code:-190 underlyingError:v19[5]];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001ED2CC;
    v10[3] = &unk_1002B9F78;
    id v11 = v6;
    char v12 = &v18;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v10];
    if (a4)
    {
      id v8 = (void *)v19[5];
      if (v8) {
        *a4 = v8;
      }
    }

    BOOL v7 = *((unsigned char *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

- (BOOL)deleteDownloadRecords:(id)a3 error:(id *)a4
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1001ECAB0;
  uint64_t v22 = sub_1001ECAC0;
  id v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001ED5E8;
  v13[3] = &unk_1002C46D8;
  id v6 = a3;
  id v14 = v6;
  id v15 = self;
  uint64_t v16 = &v18;
  id v17 = &v24;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v13];
  if (!*((unsigned char *)v25 + 24))
  {
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"DownloadRecord" write:1 code:-190 underlyingError:v19[5]];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001ED728;
    v10[3] = &unk_1002B9F78;
    id v11 = v6;
    char v12 = &v18;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v10];
  }
  if (a4)
  {
    BOOL v7 = (void *)v19[5];
    if (v7) {
      *a4 = v7;
    }
  }
  char v8 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (BOOL)deleteDownloadRecord:(unint64_t)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001ECAB0;
  uint64_t v24 = sub_1001ECAC0;
  id v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001EDA50;
  v14[3] = &unk_1002C8478;
  id v15 = self;
  unint64_t v19 = a3;
  id v7 = a4;
  id v16 = v7;
  id v17 = &v20;
  uint64_t v18 = &v26;
  [(TransparencyManagedDataStore *)v15 performBlockAndWait:v14];
  if (!*((unsigned char *)v27 + 24))
  {
    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:@"DownloadRecord" write:1 code:-190 underlyingError:v21[5]];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001EDB2C;
    v11[3] = &unk_1002B9F78;
    id v12 = v7;
    id v13 = &v20;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v11];
  }
  if (a5)
  {
    char v8 = (void *)v21[5];
    if (v8) {
      *a5 = v8;
    }
  }
  char v9 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v9;
}

- (BOOL)performAndWaitForDownloadId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001ECAB0;
  uint64_t v24 = sub_1001ECAC0;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001EDDF0;
  v15[3] = &unk_1002C4A38;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  uint64_t v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  unint64_t v19 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)createFetchRecord
{
  v2 = [(TransparencyManagedDataStore *)self context];
  id v3 = +[NSEntityDescription insertNewObjectForEntityForName:@"FetchRecord" inManagedObjectContext:v2];

  return v3;
}

- (id)createFetchRecordForRequestData:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TransparencyManagedDataStore *)self createFetchRecord];
  id v11 = +[NSUUID UUID];
  [v10 setFetchId:v11];

  [v10 setRequestData:v9];
  [v10 setRequest:v8];

  if ([(TransparencyManagedDataStore *)self persistWithError:a5])
  {
    id v12 = [v10 fetchId];
  }
  else
  {
    id v12 = 0;
  }
  +[TransparencyManagedDataStore cleanseError:a5];

  return v12;
}

- (id)fetchFetchRecordById:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSFetchRequest fetchRequestWithEntityName:@"FetchRecord"];
  id v8 = +[NSPredicate predicateWithFormat:@"fetchId = %@", v6];

  [v7 setPredicate:v8];
  id v9 = [(TransparencyManagedDataStore *)self context];
  id v10 = [v9 executeFetchRequest:v7 error:a4];

  +[TransparencyManagedDataStore cleanseError:a4];
  if (v10 && [v10 count])
  {
    id v11 = [v10 objectAtIndexedSubscript:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)performAndWaitForFetchId:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001EE2DC;
  uint64_t v24 = sub_1001EE2EC;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001EE2F4;
  v15[3] = &unk_1002C4A38;
  void v15[4] = self;
  id v10 = v8;
  id v16 = v10;
  uint64_t v18 = &v20;
  id v11 = v9;
  id v17 = v11;
  unint64_t v19 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v21[5];
    if (v12) {
      *a4 = v12;
    }
  }
  char v13 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (TransparencyManagedDataStore)initWithController:(id)a3 followup:(id)a4 logger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TransparencyManagedDataStore;
  id v11 = [(TransparencyManagedDataStore *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    [(TransparencyManagedDataStore *)v11 setController:v8];
    [(TransparencyManagedDataStore *)v12 setLogger:v10];
    dispatch_queue_t v13 = dispatch_queue_create("TransparencyManagedDataStore peerQueue", 0);
    [(TransparencyManagedDataStore *)v12 setPeerQueue:v13];

    [(TransparencyManagedDataStore *)v12 setContextRefCount:0];
    [(TransparencyManagedDataStore *)v12 setFollowup:v9];
    [(TransparencyManagedDataStore *)v12 setServerRPCTimeoutSeconds:(double)kTransparencyMaxmimumServerRPCWaitTime];
  }

  return v12;
}

+ (void)cleanseError:(id *)a3
{
  if (a3)
  {
    *a3 = +[SecXPCHelper cleanseErrorForXPC:*a3];
  }
}

- (void)reportCoreDataEventForEntity:(id)a3 write:(BOOL)a4 code:(int64_t)a5 underlyingError:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(TransparencyManagedDataStore *)self controller];
  [v12 reportCoreDataEventForEntity:v11 write:v7 code:a5 underlyingError:v10];
}

- (void)reportCoreDataEventForEntity:(id)a3 hardFailure:(BOOL)a4 write:(BOOL)a5 code:(int64_t)a6 underlyingError:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a3;
  id v14 = [(TransparencyManagedDataStore *)self controller];
  [v14 reportCoreDataEventForEntity:v13 hardFailure:v9 write:v8 code:a6 underlyingError:v12];
}

- (void)reportCoreDataPersistEventForLocation:(id)a3 underlyingError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TransparencyManagedDataStore *)self logger];
  BOOL v9 = +[SecXPCHelper cleanseErrorForXPC:v6];

  v11[0] = @"entityType";
  v11[1] = @"write";
  v12[0] = @"Persistence";
  v12[1] = &__kCFBooleanTrue;
  v11[2] = @"location";
  v12[2] = v7;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  [v8 logResultForEvent:@"ktCoreDataEvent" hardFailure:1 result:v9 withAttributes:v10];
}

+ (id)serializeLoggableDatas:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeObject:v3 forKey:@"loggableDatas"];

  id v5 = [v4 encodedData];

  return v5;
}

+ (BOOL)isStrictSecureDecodingEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)deserializeLoggableDatas:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v17 = 0;
  id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:&v17];

  id v8 = v17;
  BOOL v9 = [a1 supportedClassTypes];
  id v16 = v8;
  id v10 = [v7 decodeTopLevelObjectOfClasses:v9 forKey:@"loggableDatas" error:&v16];
  id v11 = v16;

  if (!v10 && [v11 code] == (id)4864)
  {
    if (qword_10032F3F8 != -1) {
      dispatch_once(&qword_10032F3F8, &stru_1002CA408);
    }
    id v12 = (void *)qword_10032F400;
    if (os_log_type_enabled((os_log_t)qword_10032F400, OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      id v14 = [v11 description];
      *(_DWORD *)long long buf = 138412290;
      unint64_t v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to decode loggable data. Error: %@", buf, 0xCu);
    }
  }
  if (a4 && v11) {
    *a4 = v11;
  }

  return v10;
}

+ (id)supportedClassTypes
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, objc_opt_class(), 0);
}

- (void)deleteObject:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyManagedDataStore *)self context];
  [v5 deleteObject:v4];
}

- (void)deleteObjectSet:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(TransparencyManagedDataStore *)self deleteObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)clearState:(id *)a3
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100210248;
  uint64_t v26 = sub_100210258;
  id v27 = 0;
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v5 = [(TransparencyManagedDataStore *)self controller];
  id v6 = [v5 persistentContainer];
  uint64_t v7 = [v6 managedObjectModel];

  [v7 entities];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100210260;
  void v12[3] = &unk_1002C4B58;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v8;
  id v14 = &off_1002DA660;
  objc_super v15 = self;
  id v16 = &v22;
  id v17 = &v18;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v12];
  if (a3)
  {
    long long v9 = (void *)v23[5];
    if (v9) {
      *a3 = v9;
    }
  }
  char v10 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)garbageCollectEntityBatchDelete:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = sub_100210248;
  uint64_t v30 = sub_100210258;
  id v31 = 0;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_100210760;
  char v21 = &unk_1002CA490;
  id v10 = v8;
  id v22 = v10;
  id v11 = v9;
  id v23 = v11;
  uint64_t v24 = self;
  id v25 = &v26;
  [(TransparencyManagedDataStore *)self performBlockAndWaitWithMoc:&v18];
  long long v12 = v27;
  if (a5)
  {
    id v13 = (void *)v27[5];
    if (v13)
    {
      *a5 = v13;
      long long v12 = v27;
    }
  }
  uint64_t v14 = v12[5];
  if (v14)
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", v10, 1, -122, v12[5], v18, v19, v20, v21, v22);
    if (qword_10032F3F8 != -1) {
      dispatch_once(&qword_10032F3F8, &stru_1002CA4B0);
    }
    objc_super v15 = qword_10032F400;
    if (os_log_type_enabled((os_log_t)qword_10032F400, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v27[5];
      *(_DWORD *)long long buf = 138412546;
      id v33 = v10;
      __int16 v34 = 2112;
      uint64_t v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to garbage collect %@: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v26, 8);
  return v14 == 0;
}

- (BOOL)garbageCollectEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_100210248;
  id v31 = sub_100210258;
  id v32 = 0;
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  char v21 = sub_100210CF0;
  id v22 = &unk_1002CA4D8;
  id v10 = v8;
  id v23 = v10;
  id v11 = v9;
  id v25 = self;
  uint64_t v26 = &v27;
  id v24 = v11;
  [(TransparencyManagedDataStore *)self performBlockAndWaitWithMoc:&v19];
  uint64_t v12 = v28[5];
  if (v12)
  {
    uint64_t v13 = +[SecXPCHelper cleanseErrorForXPC:](SecXPCHelper, "cleanseErrorForXPC:", v28[5], v19, v20, v21, v22, v23);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v13;

    [(TransparencyManagedDataStore *)self reportCoreDataEventForEntity:v10 write:1 code:-122 underlyingError:v28[5]];
    if (qword_10032F3F8 != -1) {
      dispatch_once(&qword_10032F3F8, &stru_1002CA4F8);
    }
    objc_super v15 = qword_10032F400;
    if (os_log_type_enabled((os_log_t)qword_10032F400, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v28[5];
      *(_DWORD *)long long buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to garbage collect %@: %@", buf, 0x16u);
    }
    if (a5)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a5 = v17;
      }
    }
  }

  _Block_object_dispose(&v27, 8);
  return v12 == 0;
}

- (void)storeTTR:(id)a3 withType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v9 = v15;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100211178;
    void v11[3] = &unk_1002CA560;
    id v12 = v7;
    id v13 = v6;
    id v14 = v8;
    [(TransparencyManagedDataStore *)self performBlockAndWaitWithMoc:v11];
  }
  else
  {
    if (qword_10032F3F8 != -1) {
      dispatch_once(&qword_10032F3F8, &stru_1002CA518);
    }
    id v10 = qword_10032F400;
    if (os_log_type_enabled((os_log_t)qword_10032F400, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "storeTTR: archivedDataWithRootObject: %@", buf, 0xCu);
    }
  }
}

- (id)getTapToRadarDate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100210248;
  id v17 = sub_100210258;
  id v18 = 0;
  id v5 = +[CachedData fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@", @"TapToRadarDate", v4];
  [v5 setPredicate:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10021162C;
  v10[3] = &unk_1002CA5A8;
  id v7 = v5;
  id v11 = v7;
  id v12 = &v13;
  [(TransparencyManagedDataStore *)self performBlockAndWaitWithMoc:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (unint64_t)onMocCountEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[NSFetchRequest fetchRequestWithEntityName:a3];
  [v9 setPredicate:v8];

  id v10 = [(TransparencyManagedDataStore *)self context];
  id v11 = [v10 countForFetchRequest:v9 error:a5];

  +[TransparencyManagedDataStore cleanseError:a5];
  return (unint64_t)v11;
}

- (BOOL)logMetricsForApplication:(id)a3 error:(id *)a4
{
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_100210248;
  id v18 = sub_100210258;
  id v19 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002119E8;
  v9[3] = &unk_1002C46D8;
  id v10 = self;
  id v5 = a3;
  id v11 = v5;
  id v12 = &v14;
  uint64_t v13 = &v20;
  [(TransparencyManagedDataStore *)v10 performBlockAndWait:v9];
  if (a4)
  {
    id v6 = (void *)v15[5];
    if (v6) {
      *a4 = v6;
    }
  }
  char v7 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

- (void)refaultObject:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyManagedDataStore *)self context];
  [v5 refreshObject:v4 mergeChanges:0];
}

- (void)saveAndRefaultObject:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyManagedDataStore *)self context];
  [v5 refreshObject:v4 mergeChanges:1];
}

- (void)refaultObjects:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [a3 allObjects];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        id v10 = [(TransparencyManagedDataStore *)self context];
        [v10 refreshObject:v9 mergeChanges:0];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)persistWithError:(id *)a3
{
  id v5 = [(TransparencyManagedDataStore *)self controller];
  id v6 = [(TransparencyManagedDataStore *)self context];
  LOBYTE(a3) = [v5 saveContext:v6 error:a3];

  return (char)a3;
}

- (BOOL)persistAndRefaultObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(TransparencyManagedDataStore *)self persistWithError:a4];
  if (v7) {
    [(TransparencyManagedDataStore *)self refaultObject:v6];
  }

  return v7;
}

- (BOOL)persistAndRefaultObjects:(id)a3 error:(id *)a4
{
  BOOL v5 = [(TransparencyManagedDataStore *)self persistWithError:a4];
  if (v5)
  {
    id v6 = [(TransparencyManagedDataStore *)self context];
    [v6 refreshAllObjects];
  }
  return v5;
}

- (BOOL)clearStateForApplication:(id)a3 error:(id *)a4
{
  id v6 = +[NSPredicate predicateWithFormat:@"application = %@", a3];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTRequest" predicate:v6 error:a4];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTTreeHead" predicate:v6 error:a4];
  [(TransparencyManagedDataStore *)self garbageCollectEntity:@"KTMutation" predicate:v6 error:a4];

  return 1;
}

- (id)copyStatistics:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100210248;
  id v19 = sub_100210258;
  id v20 = 0;
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = sub_100210248;
  long long v13 = sub_100210258;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100212034;
  v8[3] = &unk_1002CA600;
  v8[4] = self;
  void v8[5] = &v15;
  v8[6] = &v9;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v8];
  if (a3)
  {
    BOOL v5 = (void *)v10[5];
    if (v5) {
      *a3 = v5;
    }
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)performOnBatchesOfEntity:(id)a3 predicate:(id)a4 enforceMax:(BOOL)a5 error:(id *)a6 block:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = sub_100210248;
  long long v41 = sub_100210258;
  id v42 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_100210248;
  __int16 v35 = sub_100210258;
  id v36 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10021258C;
  v24[3] = &unk_1002CA648;
  v24[4] = self;
  uint64_t v28 = &v31;
  id v15 = v12;
  id v25 = v15;
  id v16 = v13;
  id v26 = v16;
  BOOL v30 = a5;
  id v17 = v14;
  id v27 = v17;
  uint64_t v29 = &v37;
  [(TransparencyManagedDataStore *)self performBlockAndWait:v24];
  if (v32[5])
  {
    -[TransparencyManagedDataStore reportCoreDataEventForEntity:write:code:underlyingError:](self, "reportCoreDataEventForEntity:write:code:underlyingError:", v15, 0, -211);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002128E4;
    v20[3] = &unk_1002C47C0;
    id v21 = v15;
    id v22 = v16;
    char v23 = &v31;
    [(TransparencyManagedDataStore *)self performBlockAndWait:v20];
    if (a6)
    {
      id v18 = (void *)v32[5];
      if (v18) {
        *a6 = v18;
      }
    }
  }
  else if (a6)
  {
    id v19 = (void *)v38[5];
    if (v19) {
      *a6 = v19;
    }
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
}

- (id)retainContext
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(TransparencyManagedDataStore *)v2 context];

  if (!v3)
  {
    id v4 = [(TransparencyManagedDataStore *)v2 controller];
    BOOL v5 = [v4 backgroundContext];
    [(TransparencyManagedDataStore *)v2 setContext:v5];
  }
  [(TransparencyManagedDataStore *)v2 setContextRefCount:(char *)[(TransparencyManagedDataStore *)v2 contextRefCount] + 1];
  id v6 = [(TransparencyManagedDataStore *)v2 context];
  objc_sync_exit(v2);

  return v6;
}

- (void)releaseContext
{
  id obj = self;
  objc_sync_enter(obj);
  [(TransparencyManagedDataStore *)obj setContextRefCount:(char *)[(TransparencyManagedDataStore *)obj contextRefCount] - 1];
  if ([(TransparencyManagedDataStore *)obj contextRefCount] <= 0)
  {
    [(TransparencyManagedDataStore *)obj setContext:0];
    [(TransparencyManagedDataStore *)obj setContextRefCount:0];
  }
  objc_sync_exit(obj);
}

- (BOOL)drainDataStore
{
  unint64_t v3 = 120;
  do
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = [(TransparencyManagedDataStore *)v4 contextRefCount];
    objc_sync_exit(v4);

    sleep(1u);
    if (v3 < 2) {
      break;
    }
    --v3;
  }
  while (v5 >= 1);
  return v5 < 1;
}

- (void)performBlockAndWaitWithMoc:(id)a3
{
  id v4 = a3;
  [(TransparencyManagedDataStore *)self retainContext];
  BOOL v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_100212CD0;
  id v10 = &unk_1002BCBD0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  id v5 = v11;
  id v6 = v4;
  [v5 performBlockAndWait:&v7];
  [(TransparencyManagedDataStore *)self releaseContext];
}

- (void)performBlockAndWait:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100212D78;
  v5[3] = &unk_1002CA690;
  id v6 = a3;
  id v4 = v6;
  [(TransparencyManagedDataStore *)self performBlockAndWaitWithMoc:v5];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100210248;
  void v10[4] = sub_100210258;
  id v11 = 0;
  id v11 = (id)os_transaction_create();
  id v5 = [(TransparencyManagedDataStore *)self retainContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100212EB8;
  v7[3] = &unk_1002CA6B8;
  id v6 = v4;
  void v7[4] = self;
  id v8 = v6;
  uint64_t v9 = v10;
  [v5 performBlock:v7];

  _Block_object_dispose(v10, 8);
}

- (TransparencyManagedDataStoreController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (TransparencyManagedDataStoreController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContext:(id)a3
{
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogger:(id)a3
{
}

- (TransparencyManagedDataStoreProtocol)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  return (TransparencyManagedDataStoreProtocol *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFollowup:(id)a3
{
}

- (double)serverRPCTimeoutSeconds
{
  return self->_serverRPCTimeoutSeconds;
}

- (void)setServerRPCTimeoutSeconds:(double)a3
{
  self->_serverRPCTimeoutSeconds = a3;
}

- (OS_dispatch_queue)peerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeerQueue:(id)a3
{
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_staticKeyStore);

  return (TransparencyStaticKeyStore *)WeakRetained;
}

- (void)setStaticKeyStore:(id)a3
{
}

- (TransparencyPeerOverrides)peerOverridesStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peerOverridesStore);

  return (TransparencyPeerOverrides *)WeakRetained;
}

- (void)setPeerOverridesStore:(id)a3
{
}

- (int64_t)contextRefCount
{
  return self->_contextRefCount;
}

- (void)setContextRefCount:(int64_t)a3
{
  self->_contextRefCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_peerOverridesStore);
  objc_destroyWeak((id *)&self->_staticKeyStore);
  objc_storeStrong((id *)&self->_peerQueue, 0);
  objc_storeStrong((id *)&self->_followup, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end