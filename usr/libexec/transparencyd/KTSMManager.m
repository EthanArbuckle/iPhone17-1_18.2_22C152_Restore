@interface KTSMManager
- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7;
- (BOOL)changeOptInState:(unint64_t)a3 application:(id)a4 loggableData:(id *)a5 error:(id *)a6;
- (BOOL)idsServerReportedWrong;
- (BOOL)isCloudKitManateeAcountAvailable;
- (BOOL)isKTDisabled;
- (BOOL)isKTKeyDifferent:(id)a3;
- (BOOL)maybeUpdateMonitorState:(double)a3;
- (BOOL)newCKRequests;
- (BOOL)optOutWhenNotEligble:(id)a3 error:(id *)a4;
- (BOOL)shouldPokeIDSUponSigning;
- (BOOL)triggerCKFetchCLI:(id *)a3;
- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 error:(id *)a5;
- (CKAccountInfo)cloudKitAccountInfo;
- (KTBackgroundSystemValidationOperation)lastDutyCycle;
- (KTCheckIDSRegistrationOperation)lastCheckIDSRegistration;
- (KTCondition)initializedComplete;
- (KTCondition)pendingValidationsComplete;
- (KTCondition)readyComplete;
- (KTCondition)signaturesComplete;
- (KTCondition)successfulIDSRegistrationCheck;
- (KTEnrollmentRegistrationSignature)lastRegistration;
- (KTFetchCloudOperation)currentCKFetch;
- (KTFetchIDMSOperation)lastFetchIDMS;
- (KTFetchIDSSelfOperation)lastFetchIDSSelf;
- (KTFetchKTSelfOperation)lastFetchKTSelf;
- (KTFetchServerOptInStatus)currentServerOptInFetch;
- (KTForceSyncKVSOperation)lastForceSyncKVS;
- (KTNearFutureScheduler)checkIDSRegistration;
- (KTNearFutureScheduler)checkKTAccountKeyScheduler;
- (KTNearFutureScheduler)checkKTSignatureScheduler;
- (KTNearFutureScheduler)ckFetchScheduler;
- (KTNearFutureScheduler)manateeViewChangedScheduler;
- (KTNearFutureScheduler)pokeIDS;
- (KTNearFutureScheduler)publicKeyFetcher;
- (KTNearFutureScheduler)retryEnsureIdentity;
- (KTNearFutureScheduler)retryGetPrimaryAccount;
- (KTNearFutureScheduler)retryPendingValidations;
- (KTNearFutureScheduler)serverOptInScheduler;
- (KTOperationDependencies)deps;
- (KTOptInStateHolder)optInStates;
- (KTPCSOperationDependency)pcsOperation;
- (KTPublicKeyStoreRefresh)lastPublicKeyRefresh;
- (KTSMManager)initWithDependencies:(id)a3;
- (KTSMSelfValidationResult)selfValidationResult;
- (KTSignalIDSOperation)lastSignalIDS;
- (KTSpecificUser)specificUser;
- (KTStateMachine)stateMachine;
- (KTValidateSelfOperation)lastValidateSelf;
- (KTValidateSelfOperation)lastValidateSelfOptIn;
- (KTZoneFetchDependencyOperation)successfulCKFetchDependency;
- (NSData)idsServerReportedWrongPublicKey;
- (NSDate)lastPush;
- (NSMutableDictionary)selfVerificationInfo;
- (NSMutableSet)ckFetchReasons;
- (NSMutableSet)inflightCKFetchDependencies;
- (NSMutableSet)serverOptInFetchReasons;
- (NSNumber)smState;
- (NSOperation)lastCKFetch;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)metricsQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)signatureQueue;
- (OS_dispatch_queue)stateMachineQueue;
- (OS_dispatch_source)checkIDSTimer;
- (OS_dispatch_source)timer;
- (SecLaunchSequence)launch;
- (_TtC13transparencyd10KTWatchdog)watchdog;
- (_TtC13transparencyd28KTEligibilityStatusReporting)statusReporting;
- (id)_onqueueCreateNewServerOptInFetch;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)accountFirstSeenDate;
- (id)createSuccesfulCKFetchDependency;
- (id)idsKTData:(id)a3;
- (id)initializingOperation;
- (id)lastSelfValidate;
- (id)metricsRegistration_idsView;
- (id)metricsRegistration_ktView;
- (id)missingValidateSelfFallbackDiagnostics;
- (id)newCKFetch:(id)a3;
- (id)optInStateForKeyStore:(id)a3 error:(id *)a4;
- (id)recheckAccount;
- (id)requestSuccessfulCKFetchForManyReasons:(id)a3;
- (id)validateSelfDiagnostics:(id)a3;
- (int)checkAccountKeyChanged;
- (int)manateeViewToken;
- (os_unfair_lock_s)metricsLock;
- (void)_onQueueMaybeCreateNewServerOptInFetch;
- (void)_onqueueCreateNewCKFetch;
- (void)_waitForIDSRegistration:(id)a3;
- (void)accountChanged:(id)a3 to:(id)a4;
- (void)addEvent:(id)a3;
- (void)checkIDSHealth:(id)a3;
- (void)checkKTAccountKey:(id)a3 complete:(id)a4;
- (void)clearAccountMetrics;
- (void)clearAllFollowups:(id)a3;
- (void)clearEligibilityOverrides:(id)a3;
- (void)clearIDSCacheForUri:(id)a3 application:(id)a4;
- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)getAggregateResult:(int64_t)a3 element:(id)a4 complete:(id)a5;
- (void)getAllOptInStates:(id)a3;
- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5;
- (void)getOptInStateForAccount:(id)a3 complete:(id)a4;
- (void)getOptInStateForApplication:(id)a3 complete:(id)a4;
- (void)getStatus:(id)a3;
- (void)haltStateMachine;
- (void)idsServerBagUpdate;
- (void)idsServerReportKTKeyWrong:(id)a3;
- (void)insertResultForElement:(id)a3 samplesAgo:(id)a4 success:(BOOL)a5 complete:(id)a6;
- (void)inspectErrorForRetryAfter:(id)a3 trigger:(id)a4;
- (void)mapHeadUpdated:(id)a3 populating:(BOOL)a4;
- (void)maybeCreateNewCKFetch;
- (void)maybeCreateNewCKFetchOnQueue;
- (void)maybeCreateServerOptInFetch;
- (void)newServerOptInFetch:(id)a3;
- (void)notifyBackgroundValidationFailure:(id)a3 data:(id)a4 type:(id)a5 serverHint:(id)a6 failure:(id)a7;
- (void)notifyIDSRegistrationCorrect;
- (void)notifyPushChange:(id)a3 userInfo:(id)a4;
- (void)performAndWaitForSelfValidate:(id)a3;
- (void)performRegistrationSignatures:(id)a3;
- (void)postKTDisabledFollowup;
- (void)refreshDeviceList:(id)a3;
- (void)reportEligibility:(id)a3 complete:(id)a4;
- (void)requestServerOptInFetchForManyReasons:(id)a3 delayInSeconds:(double)a4;
- (void)resetLastAccountOperations;
- (void)resetLocalCloudDataState;
- (void)retryPendingValidations:(id)a3;
- (void)setCheckIDSRegistration:(id)a3;
- (void)setCheckIDSTimer:(id)a3;
- (void)setCheckKTAccountKeyScheduler:(id)a3;
- (void)setCheckKTSignatureScheduler:(id)a3;
- (void)setCkFetchReasons:(id)a3;
- (void)setCkFetchScheduler:(id)a3;
- (void)setCloudKitAccountInfo:(id)a3;
- (void)setCloudKitOutgoingFlag;
- (void)setCurrentCKFetch:(id)a3;
- (void)setCurrentServerOptInFetch:(id)a3;
- (void)setDeps:(id)a3;
- (void)setIdsServerReportedWrong:(BOOL)a3;
- (void)setIdsServerReportedWrongPublicKey:(id)a3;
- (void)setInflightCKFetchDependencies:(id)a3;
- (void)setInitializedComplete:(id)a3;
- (void)setLastCKFetch:(id)a3;
- (void)setLastCheckIDSRegistration:(id)a3;
- (void)setLastDutyCycle:(id)a3;
- (void)setLastFetchIDMS:(id)a3;
- (void)setLastFetchIDSSelf:(id)a3;
- (void)setLastFetchKTSelf:(id)a3;
- (void)setLastForceSyncKVS:(id)a3;
- (void)setLastPublicKeyRefresh:(id)a3;
- (void)setLastPush:(id)a3;
- (void)setLastRegistration:(id)a3;
- (void)setLastSelfValidate:(id)a3;
- (void)setLastSignalIDS:(id)a3;
- (void)setLastValidateSelf:(id)a3;
- (void)setLastValidateSelfOptIn:(id)a3;
- (void)setLaunch:(id)a3;
- (void)setManateeViewChangedScheduler:(id)a3;
- (void)setManateeViewToken:(int)a3;
- (void)setMetricsLock:(os_unfair_lock_s)a3;
- (void)setMetricsQueue:(id)a3;
- (void)setNewCKRequests:(BOOL)a3;
- (void)setOSUpdate:(BOOL)a3 complete:(id)a4;
- (void)setOperationQueue:(id)a3;
- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7;
- (void)setOptInStates:(id)a3;
- (void)setOverrideTimeBetweenReports:(double)a3 completion:(id)a4;
- (void)setPcsOperation:(id)a3;
- (void)setPendingValidationsComplete:(id)a3;
- (void)setPokeIDS:(id)a3;
- (void)setPublicKeyFetcher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReadyComplete:(id)a3;
- (void)setRetryEnsureIdentity:(id)a3;
- (void)setRetryGetPrimaryAccount:(id)a3;
- (void)setRetryPendingValidations:(id)a3;
- (void)setSelfValidationResult:(id)a3;
- (void)setSelfVerificationInfo:(id)a3;
- (void)setServerOptInFetchReasons:(id)a3;
- (void)setServerOptInScheduler:(id)a3;
- (void)setShouldPokeIDSUponSigning:(BOOL)a3;
- (void)setSignatureQueue:(id)a3;
- (void)setSignaturesComplete:(id)a3;
- (void)setSpecificUser:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStateMachineQueue:(id)a3;
- (void)setStatusReporting:(id)a3;
- (void)setSuccessfulCKFetchDependency:(id)a3;
- (void)setSuccessfulIDSRegistrationCheck:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)startMetrics;
- (void)startStateMachine;
- (void)storeEligiblilityFailure:(id)a3 error:(id)a4;
- (void)storeEligiblilitySuccess:(id)a3;
- (void)storeNeedsUpdate:(id)a3;
- (void)sysdiagnoseInfo:(id)a3;
- (void)timeout:(unint64_t)a3 block:(id)a4;
- (void)transparencyClearKTRegistrationData:(id)a3;
- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5;
- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5;
- (void)transparencyCloudDevices:(id)a3;
- (void)transparencyDumpKTRegistrationData:(id)a3;
- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4;
- (void)transparencyPerformRegistrationSignature:(id)a3;
- (void)triggerBAACertFetcher;
- (void)triggerBackgroundSystemValidate:(id)a3 completionHandler:(id)a4;
- (void)triggerCKFetch24h;
- (void)triggerCheckAccountIdentityChanged;
- (void)triggerCheckCKKSOctagonEligibility;
- (void)triggerCheckExpiredPublicKeyStores;
- (void)triggerCheckIDSRegistration;
- (void)triggerCheckKTAccountKey;
- (void)triggerCloudKitStaticKeyRemoteUpdateNotification;
- (void)triggerConfigBagFetch:(double)a3;
- (void)triggerEnsureIdentity;
- (void)triggerFetchSelf:(double)a3;
- (void)triggerGetPrimaryAccount;
- (void)triggerIDMSFetch:(double)a3;
- (void)triggerIDMSFetchBackstop:(id)a3;
- (void)triggerIDSRepair:(double)a3 selfValidationResult:(id)a4;
- (void)triggerIDSServerBagNotification;
- (void)triggerKTAccountKeySignature:(double)a3;
- (void)triggerMaybeReportEligibilityWithCompletion:(id)a3;
- (void)triggerOptInStateChange;
- (void)triggerPublicKeyFetch;
- (void)triggerRegistrationDataNeedsUpdate:(id)a3;
- (void)triggerSelfValidate:(double)a3;
- (void)triggerSelfValidateFromEnrollment;
- (void)triggerServerOptInFetch4h;
- (void)triggerStatusUpdate:(id)a3;
- (void)updateIDSRecommendation:(BOOL)a3 complete:(id)a4;
- (void)updateKTDisabledForIDS:(BOOL)a3;
- (void)uriNeedsUpdate:(id)a3 forApplication:(id)a4;
- (void)validatePendingURIsAndRequests;
- (void)waitForIDSRegistration:(id)a3;
- (void)xpc24HrNotification:(id)a3;
@end

@implementation KTSMManager

- (KTSMManager)initWithDependencies:(id)a3
{
  id v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)KTSMManager;
  v5 = [(KTSMManager *)&v124 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("KTSMManager", 0);
    [(KTSMManager *)v5 setQueue:v6];

    dispatch_queue_t v7 = dispatch_queue_create("KT-statemachine", 0);
    [(KTSMManager *)v5 setStateMachineQueue:v7];

    dispatch_queue_t v8 = dispatch_queue_create("KT-metrics", 0);
    [(KTSMManager *)v5 setMetricsQueue:v8];

    [(KTSMManager *)v5 setDeps:v4];
    v9 = objc_alloc_init(KTOptInStateHolder);
    [(KTSMManager *)v5 setOptInStates:v9];

    id v10 = objc_alloc_init((Class)NSOperationQueue);
    [(KTSMManager *)v5 setOperationQueue:v10];

    v11 = objc_alloc_init(KTCondition);
    [(KTSMManager *)v5 setInitializedComplete:v11];

    v12 = objc_alloc_init(KTCondition);
    [(KTSMManager *)v5 setReadyComplete:v12];

    v13 = objc_alloc_init(KTCondition);
    [(KTSMManager *)v5 setSignaturesComplete:v13];

    [(KTSMManager *)v5 setShouldPokeIDSUponSigning:1];
    dispatch_queue_t v14 = dispatch_queue_create("signatures", 0);
    [(KTSMManager *)v5 setSignatureQueue:v14];

    v15 = +[NSMutableSet set];
    [(KTSMManager *)v5 setCkFetchReasons:v15];

    v16 = +[NSMutableSet set];
    [(KTSMManager *)v5 setInflightCKFetchDependencies:v16];

    v17 = [(KTSMManager *)v5 createSuccesfulCKFetchDependency];
    [(KTSMManager *)v5 setSuccessfulCKFetchDependency:v17];

    [(KTSMManager *)v5 setMetricsLock:0];
    id v18 = [objc_alloc((Class)SecLaunchSequence) initWithRocketName:@"com.apple.sear.KTSMManager"];
    [(KTSMManager *)v5 setLaunch:v18];

    v19 = [_TtC13transparencyd10KTWatchdog alloc];
    v20 = [KTManagerWatchdogControl alloc];
    id v87 = v4;
    v21 = [v4 dew];
    v22 = [(KTManagerWatchdogControl *)v20 initWithDew:v21];
    v23 = [(KTWatchdog *)v19 initWithControl:v22];
    [(KTSMManager *)v5 setWatchdog:v23];

    v24 = [(KTSMManager *)v5 deps];
    v25 = [v24 idsConfigBag];

    if (!v25)
    {
      v26 = +[TransparencyIDSConfigBag sharedInstance];
      v27 = [(KTSMManager *)v5 deps];
      [v27 setIdsConfigBag:v26];
    }
    v28 = +[NSNotificationCenter defaultCenter];
    [v28 addObserver:v5 selector:"idsServerBagUpdate" name:IDSServerBagFinishedLoadingNotification object:0];

    v29 = [KTStateMachine alloc];
    v90 = +[KTStates KTStateMap];
    v89 = [v90 allKeys];
    v30 = +[NSSet setWithArray:v89];
    v31 = +[KTStates AllKTFlags];
    uint64_t v32 = [(KTSMManager *)v5 stateMachineQueue];
    v88 = [(KTSMManager *)v5 deps];
    v33 = [v88 lockStateTracker];
    v34 = [(KTSMManager *)v5 deps];
    v35 = [v34 reachabilityTracker];
    v36 = [(KTSMManager *)v5 deps];
    v37 = [v36 idsConfigBag];
    v38 = v29;
    v39 = (void *)v32;
    v40 = [(KTStateMachine *)v38 initWithName:@"KTStateMachine" states:v30 flags:v31 initialState:@"PublicKeysInitialFetch" queue:v32 stateEngine:v5 lockStateTracker:v33 reachabilityTracker:v35 idsConfigBag:v37];
    [(KTSMManager *)v5 setStateMachine:v40];

    [(KTSMManager *)v5 setManateeViewToken:0xFFFFFFFFLL];
    v41 = [(KTSMManager *)v5 stateMachine];
    v42 = [(KTSMManager *)v5 deps];
    [v42 setFlagHandler:v41];

    v43 = [(KTSMManager *)v5 deps];
    v44 = [v43 cloudKitAccountTracker];
    id v45 = [v44 registerForNotificationsOfCloudKitAccountStatusChange:v5];

    id location = 0;
    objc_initWeak(&location, v5);
    v121[0] = _NSConcreteStackBlock;
    v121[1] = 3221225472;
    v121[2] = sub_100038E90;
    v121[3] = &unk_1002B9A60;
    objc_copyWeak(&v122, &location);
    v46 = [(KTSMManager *)v5 deps];
    v47 = [v46 octagonOperations];
    [v47 setOctagonObserver:v121];

    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_100038FD8;
    v119[3] = &unk_1002B9AA8;
    objc_copyWeak(&v120, &location);
    v48 = [(KTSMManager *)v5 deps];
    v49 = [v48 octagonOperations];
    [v49 setCkksViewObserver:v119];

    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_100039184;
    v117[3] = &unk_1002B9AF0;
    objc_copyWeak(&v118, &location);
    v50 = [(KTSMManager *)v5 deps];
    v51 = [v50 idsAccountTracker];
    [v51 setIdsObserver:v117];

    v52 = [KTNearFutureScheduler alloc];
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_1000392E8;
    v115[3] = &unk_1002B72D8;
    objc_copyWeak(&v116, &location);
    v53 = [(KTNearFutureScheduler *)v52 initWithName:@"publicKeyFetch" initialDelay:5000000000 exponentialBackoff:7200000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v115 block:2.0];
    [(KTSMManager *)v5 setPublicKeyFetcher:v53];

    v54 = [KTNearFutureScheduler alloc];
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_100039328;
    v113[3] = &unk_1002B72D8;
    objc_copyWeak(&v114, &location);
    v55 = [(KTNearFutureScheduler *)v54 initWithName:@"retryEnsureIdentity" initialDelay:5000000000 exponentialBackoff:3600000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v113 block:1.2];
    [(KTSMManager *)v5 setRetryEnsureIdentity:v55];

    v56 = [KTNearFutureScheduler alloc];
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_100039368;
    v111[3] = &unk_1002B72D8;
    objc_copyWeak(&v112, &location);
    v57 = [(KTNearFutureScheduler *)v56 initWithName:@"retryGetPrimaryAccount" initialDelay:5000000000 exponentialBackoff:7200000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v111 block:2.0];
    [(KTSMManager *)v5 setRetryGetPrimaryAccount:v57];

    v58 = [KTNearFutureScheduler alloc];
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_1000393A8;
    v109[3] = &unk_1002B72D8;
    objc_copyWeak(&v110, &location);
    v59 = [(KTNearFutureScheduler *)v58 initWithName:@"ck-zone-fetcher" initialDelay:2000000000 exponentialBackoff:3600000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v109 block:1.2];
    [(KTSMManager *)v5 setCkFetchScheduler:v59];

    v60 = [(KTSMManager *)v5 deps];
    v61 = [v60 logger];
    v62 = self;
    v63 = [v62 ckFetchScheduler];
    [v61 addNFSReporting:v63];

    v64 = [KTNearFutureScheduler alloc];
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_1000393E8;
    v107[3] = &unk_1002B72D8;
    objc_copyWeak(&v108, &location);
    v65 = [(KTNearFutureScheduler *)v64 initWithName:@"checkKTAccountKey" initialDelay:1000000000 exponentialBackoff:86400000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v107 block:2.0];
    [(KTSMManager *)v5 setCheckKTAccountKeyScheduler:v65];

    v66 = [KTNearFutureScheduler alloc];
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_100039428;
    v105[3] = &unk_1002B72D8;
    objc_copyWeak(&v106, &location);
    v67 = [(KTNearFutureScheduler *)v66 initWithName:@"checkIDSRegistration" initialDelay:1200000000000 exponentialBackoff:43200000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v105 block:2.0];
    [(KTSMManager *)v5 setCheckIDSRegistration:v67];

    v68 = [KTNearFutureScheduler alloc];
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_100039468;
    v103[3] = &unk_1002B72D8;
    objc_copyWeak(&v104, &location);
    v69 = [(KTNearFutureScheduler *)v68 initWithName:@"checkKTSignatures" initialDelay:2000000000 exponentialBackoff:43200000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v103 block:2.0];
    [(KTSMManager *)v5 setCheckKTSignatureScheduler:v69];

    v70 = [KTNearFutureScheduler alloc];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_1000394AC;
    v101[3] = &unk_1002B6CF8;
    v71 = v5;
    v102 = v71;
    v72 = [(KTNearFutureScheduler *)v70 initWithName:@"manateeViewChanged" initialDelay:5000000000 continuingDelay:90000000000 keepProcessAlive:0 dependencyDescriptionCode:0 block:v101];
    [v71 setManateeViewChangedScheduler:v72];

    v73 = [v71 deps];
    v74 = [v73 logger];
    v75 = [v71 manateeViewChangedScheduler];
    [v74 addNFSReporting:v75];

    v76 = [KTNearFutureScheduler alloc];
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_1000394B4;
    v99[3] = &unk_1002B72D8;
    objc_copyWeak(&v100, &location);
    v77 = [(KTNearFutureScheduler *)v76 initWithName:@"fillServerOptInStatus" initialDelay:2000000000 exponentialBackoff:3600000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v99 block:1.5];
    [v71 setServerOptInScheduler:v77];

    v78 = [KTNearFutureScheduler alloc];
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472;
    v97[2] = sub_1000394F4;
    v97[3] = &unk_1002B72D8;
    objc_copyWeak(&v98, &location);
    v79 = [(KTNearFutureScheduler *)v78 initWithName:@"retryPendingValidations" initialDelay:10000000 exponentialBackoff:300000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v97 block:2.0];
    [v71 setRetryPendingValidations:v79];

    v80 = [KTNearFutureScheduler alloc];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_100039534;
    v95[3] = &unk_1002B72D8;
    objc_copyWeak(&v96, &location);
    v81 = [(KTNearFutureScheduler *)v80 initWithName:@"pokeIDS" initialDelay:2000000000 exponentialBackoff:2000000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:v95 block:10.0];
    [v71 setPokeIDS:v81];

    v82 = [v71 queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100039684;
    handler[3] = &unk_1002B9B18;
    objc_copyWeak(&v94, &location);
    notify_register_dispatch("com.apple.security.view-change.Manatee", v71 + 4, v82, handler);

    v83 = [v71 watchdog];
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_1000396DC;
    v91[3] = &unk_1002B9B60;
    objc_copyWeak(&v92, &location);
    [v83 addWithNamed:@"stateMachineQueue" watcher:v91];

    v84 = [v71 watchdog];
    [v84 resume];

    [v71 startMetrics];
    v85 = v71;
    objc_destroyWeak(&v92);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v96);
    objc_destroyWeak(&v98);
    objc_destroyWeak(&v100);

    objc_destroyWeak(&v104);
    objc_destroyWeak(&v106);
    objc_destroyWeak(&v108);
    objc_destroyWeak(&v110);
    objc_destroyWeak(&v112);
    objc_destroyWeak(&v114);
    objc_destroyWeak(&v116);
    objc_destroyWeak(&v118);
    objc_destroyWeak(&v120);
    objc_destroyWeak(&v122);
    objc_destroyWeak(&location);
    id v4 = v87;
  }

  return v5;
}

- (void)dealloc
{
  int manateeViewToken = self->_manateeViewToken;
  if (manateeViewToken != -1) {
    notify_cancel(manateeViewToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)KTSMManager;
  [(KTSMManager *)&v4 dealloc];
}

- (NSNumber)smState
{
  v3 = +[KTStates KTStateMap];
  objc_super v4 = [(KTSMManager *)self stateMachine];
  v5 = [v4 currentState];
  dispatch_queue_t v6 = [v3 objectForKeyedSubscript:v5];

  return (NSNumber *)v6;
}

- (void)startStateMachine
{
  id v2 = [(KTSMManager *)self stateMachine];
  [v2 startOperation];
}

- (void)haltStateMachine
{
  v3 = [(KTSMManager *)self publicKeyFetcher];
  [v3 cancel];

  objc_super v4 = [(KTSMManager *)self retryEnsureIdentity];
  [v4 cancel];

  v5 = [(KTSMManager *)self retryGetPrimaryAccount];
  [v5 cancel];

  dispatch_queue_t v6 = [(KTSMManager *)self checkKTAccountKeyScheduler];
  [v6 cancel];

  dispatch_queue_t v7 = [(KTSMManager *)self checkKTSignatureScheduler];
  [v7 cancel];

  dispatch_queue_t v8 = [(KTSMManager *)self serverOptInScheduler];
  [v8 cancel];

  v9 = [(KTSMManager *)self ckFetchScheduler];
  [v9 cancel];

  id v10 = [(KTSMManager *)self checkIDSRegistration];
  [v10 cancel];

  v11 = [(KTSMManager *)self manateeViewChangedScheduler];
  [v11 cancel];

  v12 = [(KTSMManager *)self retryPendingValidations];
  [v12 cancel];

  v13 = [(KTSMManager *)self pokeIDS];
  [v13 cancel];

  dispatch_queue_t v14 = [(KTSMManager *)self statusReporting];

  if (v14)
  {
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v16 = [(KTSMManager *)self statusReporting];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100039AD4;
    v22[3] = &unk_1002B9BA8;
    v17 = v15;
    v23 = v17;
    [v16 closeDatabaseWithCompletionHandler:v22];

    dispatch_time_t v18 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v17, v18))
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002B9BC8);
      }
      v19 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Timeout closing eligibility db", v21, 2u);
      }
    }
    [(KTSMManager *)self setStatusReporting:0];
  }
  v20 = [(KTSMManager *)self stateMachine];
  [v20 haltOperation];
}

- (void)startMetrics
{
  id location = 0;
  objc_initWeak(&location, self);
  v3 = [(KTSMManager *)self deps];
  objc_super v4 = [v3 logger];
  double v5 = SFAnalyticsSamplerIntervalOncePerReport;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100039E00;
  v10[3] = &unk_1002B82D8;
  objc_copyWeak(&v11, &location);
  [v4 addMultiSamplerForName:@"transparencydEligibilityMultiSampler" withTimeInterval:v10 block:v5];

  dispatch_queue_t v6 = [(KTSMManager *)self deps];
  dispatch_queue_t v7 = [v6 logger];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A2AC;
  v8[3] = &unk_1002B82D8;
  objc_copyWeak(&v9, &location);
  [v7 addMultiSamplerForName:@"transparencydMultiSampler" withTimeInterval:v8 block:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v5 = a4;
  dispatch_queue_t v6 = [(KTSMManager *)self stateMachineQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003AA9C;
  v8[3] = &unk_1002B7D58;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountChanged:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B9C30);
  }
  dispatch_queue_t v8 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "account %@ state changed to: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [[KTPendingFlag alloc] initWithFlag:@"AccountChanged" conditions:0 delayInSeconds:0.1];
  id v10 = [(KTSMManager *)self stateMachine];
  [v10 handlePendingFlag:v9];
}

- (void)triggerPublicKeyFetch
{
  objc_super v4 = [[KTPendingFlag alloc] initWithFlag:@"FetchPublicKeys" conditions:2 delayInSeconds:0.1];
  v3 = [(KTSMManager *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)triggerEnsureIdentity
{
  objc_super v4 = [[KTPendingFlag alloc] initWithFlag:@"EnsureIdentity" conditions:3 delayInSeconds:0.1];
  v3 = [(KTSMManager *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)triggerGetPrimaryAccount
{
  objc_super v4 = [[KTPendingFlag alloc] initWithFlag:@"AccountChanged" delayInSeconds:0.1];
  v3 = [(KTSMManager *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)storeNeedsUpdate:(id)a3
{
  id v4 = a3;
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B9C50);
  }
  id v5 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "public key store request update: %@", (uint8_t *)&v6, 0xCu);
  }
  [(KTSMManager *)self triggerPublicKeyFetch];
}

- (void)triggerCheckIDSRegistration
{
  id v4 = [[KTPendingFlag alloc] initWithFlag:@"CheckIDSRegistration" conditions:2 delayInSeconds:0.0];
  v3 = [(KTSMManager *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)triggerCheckAccountIdentityChanged
{
  id v4 = [[KTPendingFlag alloc] initWithFlag:@"CheckKTAccountKeyChanged" conditions:2 delayInSeconds:0.0];
  v3 = [(KTSMManager *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)triggerOptInStateChange
{
  id v4 = [[KTPendingFlag alloc] initWithFlag:@"ChangeOptInState" conditions:2 delayInSeconds:0.0];
  v3 = [(KTSMManager *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)triggerConfigBagFetch:(double)a3
{
  id v5 = [[KTPendingFlag alloc] initWithFlag:@"ConfigBagFetch" conditions:2 delayInSeconds:a3];
  id v4 = [(KTSMManager *)self stateMachine];
  [v4 handlePendingFlag:v5];
}

- (void)triggerKTAccountKeySignature:(double)a3
{
  id v5 = [(KTSMManager *)self stateMachineQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003B2B4;
  v6[3] = &unk_1002B9C78;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)performRegistrationSignatures:(id)a3
{
  id v4 = a3;
  id v17 = 0;
  unsigned __int8 v5 = [(KTSMManager *)self waitUntilReadyForRPCForOperation:@"performRegistrationSignatures" fast:0 error:&v17];
  id v6 = v17;
  if (v5)
  {
    CFStringRef v21 = @"SignRegistrationData";
    CFStringRef v19 = @"Ready";
    id v7 = +[KTStateTransitionPathStep success];
    v20 = v7;
    dispatch_queue_t v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v22 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v10 = +[KTStateTransitionPath pathFromDictionary:v9];

    CFStringRef v18 = @"Ready";
    int v11 = +[NSArray arrayWithObjects:&v18 count:1];
    id v12 = +[NSSet setWithArray:v11];

    __int16 v13 = [(KTSMManager *)self stateMachine];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003B56C;
    v15[3] = &unk_1002B9CA0;
    id v16 = v4;
    id v14 = [v13 doWatchedStateMachineRPC:@"sign-registration-data" sourceStates:v12 path:v10 reply:v15];
  }
  else
  {
    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }
}

- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(KTSMManager *)self initializedComplete];
  id v10 = [v9 wait:5000000000];

  if (v10)
  {
    uint64_t v11 = kTransparencyErrorInternal;
    v39[0] = @"state";
    id v12 = [(KTSMManager *)self stateMachine];
    uint64_t v13 = [v12 currentState];
    id v14 = (void *)v13;
    CFStringRef v15 = @"-";
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    v39[1] = @"opName";
    v40[0] = v15;
    v40[1] = v8;
    id v16 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
    id v17 = +[TransparencyError errorWithDomain:v11 code:-367 underlyingError:0 userinfo:v16 description:@"not ready yet"];

    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002B9CC0);
    }
    CFStringRef v18 = qword_100326798;
    if (!os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    id v38 = v17;
    CFStringRef v19 = "Haven't yet initialized State machine; expect failure: %@";
    goto LABEL_23;
  }
  v20 = [(KTSMManager *)self deps];
  CFStringRef v21 = [v20 lockStateTracker];
  unsigned __int8 v22 = [v21 hasBeenUnlocked];

  if ((v22 & 1) == 0)
  {
    id v17 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-345 description:@"not unlocked yet"];
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002B9CE0);
    }
    CFStringRef v18 = qword_100326798;
    if (!os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    id v38 = v17;
    CFStringRef v19 = "Haven't yet unlocked: %@";
    goto LABEL_23;
  }
  v23 = [(KTSMManager *)self readyComplete];
  v24 = v23;
  if (v6) {
    uint64_t v25 = 500000000;
  }
  else {
    uint64_t v25 = 2000000000;
  }
  id v26 = [v23 wait:v25];

  if (!v26)
  {
    id v17 = 0;
    BOOL v33 = 1;
    goto LABEL_27;
  }
  uint64_t v27 = kTransparencyErrorInternal;
  v28 = [(KTSMManager *)self stateMachine];
  uint64_t v29 = [v28 currentState];
  v30 = (void *)v29;
  CFStringRef v31 = @"-";
  if (v29) {
    CFStringRef v31 = (const __CFString *)v29;
  }
  v35[1] = @"opName";
  v36[0] = v31;
  v36[1] = v8;
  uint64_t v32 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  id v17 = +[TransparencyError errorWithDomain:v27 code:-368 underlyingError:0 userinfo:v32 description:@"not ready yet"];

  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B9D00);
  }
  CFStringRef v18 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v17;
    CFStringRef v19 = "Haven't yet reached ready: %@";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
  }
LABEL_24:
  if (a5)
  {
    id v17 = v17;
    BOOL v33 = 0;
    *a5 = v17;
  }
  else
  {
    BOOL v33 = 0;
  }
LABEL_27:

  return v33;
}

- (void)triggerIDSRepair:(double)a3 selfValidationResult:(id)a4
{
  id v6 = a4;
  id v7 = [(KTSMManager *)self stateMachineQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BB74;
  block[3] = &unk_1002B9D28;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)maybeUpdateMonitorState:(double)a3
{
  unsigned __int8 v5 = [(KTSMManager *)self deps];
  id v6 = [v5 stateMonitor];
  id v7 = [v6 ktStatus];
  id v8 = [v7 selfStatus];

  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B9D48);
  }
  id v9 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v8;
    __int16 v12 = 1024;
    BOOL v13 = v8 != 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Maybe update monitor selfStatus: %d: %d", (uint8_t *)v11, 0xEu);
  }
  if (v8) {
    [(KTSMManager *)self triggerSelfValidate:a3];
  }
  return v8 != 0;
}

- (id)createSuccesfulCKFetchDependency
{
  id v2 = objc_alloc_init(KTZoneFetchDependencyOperation);
  [(KTZoneFetchDependencyOperation *)v2 setName:@"successful-fetch-dependency"];

  return v2;
}

- (void)maybeCreateNewCKFetch
{
  v3 = [(KTSMManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BEF4;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)maybeCreateNewCKFetchOnQueue
{
  v3 = [(KTSMManager *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(KTSMManager *)self newCKRequests])
  {
    uint64_t v4 = [(KTSMManager *)self currentCKFetch];
    if (!v4
      || (unsigned __int8 v5 = (void *)v4,
          [(KTSMManager *)self currentCKFetch],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isFinished],
          v6,
          v5,
          v7))
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002B9D68);
      }
      id v8 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating a new CK fetch", v9, 2u);
      }
      [(KTSMManager *)self _onqueueCreateNewCKFetch];
    }
  }
}

- (void)_onqueueCreateNewCKFetch
{
  v3 = [(KTSMManager *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(KTSMManager *)self successfulCKFetchDependency];
  unsigned __int8 v5 = [(KTSMManager *)self createSuccesfulCKFetchDependency];
  [(KTSMManager *)self setSuccessfulCKFetchDependency:v5];

  id v6 = [(KTSMManager *)self inflightCKFetchDependencies];
  v36 = (void *)v4;
  [v6 addObject:v4];

  v34 = [(KTSMManager *)self ckFetchReasons];
  unsigned int v7 = +[NSMutableSet set];
  [(KTSMManager *)self setCkFetchReasons:v7];

  id v8 = [v34 allObjects];
  uint64_t v9 = [v8 componentsJoinedByString:@","];

  id v10 = [(KTSMManager *)self deps];
  double v11 = [v10 fetchCloudStorage];
  __int16 v12 = [(KTSMManager *)self deps];
  BOOL v13 = [(KTSMManager *)self deps];
  id v14 = [v13 dataStore];
  CFStringRef v15 = [v14 controller];
  id v16 = [v15 backgroundContext];
  v35 = (void *)v9;
  id v17 = [v11 cloudFetchOperationWithDeps:v12 initialFetch:0 userInteractive:0 reason:v9 context:v16];

  [(KTSMManager *)self setCurrentCKFetch:v17];
  [(KTSMManager *)self setNewCKRequests:0];
  if ([v34 containsObject:off_10031E558])
  {
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002B9D88);
    }
    CFStringRef v18 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "blocking fetch on network reachability/network timeout", buf, 2u);
    }
    CFStringRef v19 = [(KTSMManager *)self currentCKFetch];
    v20 = [(KTSMManager *)self deps];
    CFStringRef v21 = [v20 reachabilityTracker];
    unsigned __int8 v22 = [v21 reachabilityDependency];
    [v19 addNullableDependency:v22];

    v23 = [(KTSMManager *)self currentCKFetch];
    v24 = [(KTSMManager *)self deps];
    uint64_t v25 = [v24 networkTimeout];
    id v26 = [v25 networkTimeoutOperation];
    [v23 addNullableDependency:v26];
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10003C480;
  v37[3] = &unk_1002B9DD0;
  v37[4] = self;
  id v38 = v17;
  id v39 = v34;
  id v27 = v34;
  id v28 = v17;
  uint64_t v29 = +[NSBlockOperation blockOperationWithBlock:v37];
  v30 = [(KTSMManager *)self currentCKFetch];
  [v29 addNullableDependency:v30];

  CFStringRef v31 = [(KTSMManager *)self operationQueue];
  uint64_t v32 = [(KTSMManager *)self currentCKFetch];
  [v31 addOperation:v32];

  BOOL v33 = [(KTSMManager *)self operationQueue];
  [v33 addOperation:v29];
}

- (id)requestSuccessfulCKFetchForManyReasons:(id)a3
{
  id v4 = a3;
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B9DF0);
  }
  unsigned __int8 v5 = (void *)qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    unsigned int v7 = [v4 allObjects];
    id v8 = [v7 componentsJoinedByString:@","];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "triggering a new CK fetch because of reason: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v9 = [(KTSMManager *)self deps];
  id v10 = [v9 cloudRecords];
  BOOL v11 = v10 == 0;

  if (v11
    || ![(KTSMManager *)self isCloudKitManateeAcountAvailable]
    || ([(KTSMManager *)self specificUser],
        __int16 v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = v12 == 0,
        v12,
        v13))
  {
    id v15 = 0;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000;
    unsigned __int8 v22 = sub_10003CBA0;
    v23 = sub_10003CBB0;
    id v24 = 0;
    id v14 = [(KTSMManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CBB8;
    block[3] = &unk_1002B9768;
    p_long long buf = &buf;
    block[4] = self;
    id v18 = v4;
    dispatch_sync(v14, block);

    id v15 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }

  return v15;
}

- (id)newCKFetch:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  unsigned __int8 v5 = [(KTSMManager *)self requestSuccessfulCKFetchForManyReasons:v4];

  return v5;
}

- (void)notifyPushChange:(id)a3 userInfo:(id)a4
{
  unsigned __int8 v5 = +[NSDate date];
  [(KTSMManager *)self setLastPush:v5];

  id v6 = [(KTSMManager *)self deps];
  unsigned int v7 = [v6 networkTimeout];
  [v7 networkWithFeedback:2];

  id v8 = [(KTSMManager *)self specificUser];

  if (v8)
  {
    uint64_t v9 = +[NSSet setWithObject:@"apns"];
    [(KTSMManager *)self requestServerOptInFetchForManyReasons:v9 delayInSeconds:10.0];

    if ([(KTSMManager *)self isCloudKitManateeAcountAvailable])
    {
      id v10 = [(KTSMManager *)self newCKFetch:@"apns"];
    }
  }
}

- (BOOL)triggerCKFetchCLI:(id *)a3
{
  unsigned __int8 v5 = +[NSSet setWithObject:@"cli"];
  id v6 = [(KTSMManager *)self requestSuccessfulCKFetchForManyReasons:v5];

  if (v6)
  {
    unsigned int v7 = [[KTPendingFlag alloc] initWithFlag:@"CloudKitOutgoing" after:v6];
    id v8 = [(KTSMManager *)self deps];
    uint64_t v9 = [v8 flagHandler];
    [v9 handlePendingFlag:v7];

    [v6 waitUntilFinishedOrTimeout:20.0];
    if ([v6 isFinished])
    {
      id v10 = 0;
    }
    else
    {
      id v10 = +[NSError errorWithDomain:kTransparencyErrorInternal code:-380 userInfo:0];
      if (v10)
      {
        if (qword_100326790 != -1) {
          dispatch_once(&qword_100326790, &stru_1002B9E10);
        }
        __int16 v12 = qword_100326798;
        if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138412290;
          id v15 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "triggerCKFetchCLI failed: %@", (uint8_t *)&v14, 0xCu);
        }
        if (a3)
        {
          id v10 = v10;
          BOOL v11 = 0;
          *a3 = v10;
        }
        else
        {
          BOOL v11 = 0;
        }
        goto LABEL_13;
      }
    }
    BOOL v11 = 1;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (void)triggerCKFetch24h
{
  if ([(KTSMManager *)self isCloudKitManateeAcountAvailable])
  {
    v3 = [(KTSMManager *)self specificUser];

    if (v3)
    {
      id v4 = [(KTSMManager *)self newCKFetch:@"24h"];
    }
  }
}

- (void)triggerCheckKTAccountKey
{
  id v4 = [[KTPendingFlag alloc] initWithFlag:@"CheckKTAccountKey" conditions:2 delayInSeconds:0.0];
  v3 = [(KTSMManager *)self stateMachine];
  [v3 handlePendingFlag:v4];
}

- (void)triggerIDMSFetchBackstop:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  CFStringRef v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  unsigned __int8 v5 = [(KTSMManager *)self deps];
  id v6 = [v5 logClient];
  [v6 idmsFetchTime];
  double v8 = v7;

  if (v8 < 604800.0) {
    double v8 = 604800.0;
  }
  uint64_t v9 = [(KTSMManager *)self deps];
  id v10 = [v9 smDataStore];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003D264;
  v14[3] = &unk_1002B9E38;
  double v17 = v8;
  id v11 = v4;
  id v15 = v11;
  id v16 = &v18;
  [v10 fetchIDMSDeviceList:v14];

  if (*((unsigned char *)v19 + 24))
  {
    __int16 v12 = [[KTPendingFlag alloc] initWithFlag:@"FetchIDMS" conditions:2 delayInSeconds:0.1];
    BOOL v13 = [(KTSMManager *)self stateMachine];
    [v13 handlePendingFlag:v12];
  }
  _Block_object_dispose(&v18, 8);
}

- (void)triggerIDMSFetch:(double)a3
{
  unsigned __int8 v5 = [[KTPendingFlag alloc] initWithFlag:@"FetchIDMS" conditions:2 delayInSeconds:a3];
  id v4 = [(KTSMManager *)self stateMachine];
  [v4 handlePendingFlag:v5];
}

- (void)triggerSelfValidate:(double)a3
{
  id v4 = [[KTPendingFlag alloc] initWithFlag:@"ValidateSelf" conditions:2 delayInSeconds:a3];
  unsigned __int8 v5 = [(KTSMManager *)self stateMachine];
  [v5 handlePendingFlag:v4];

  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B9E58);
  }
  id v6 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "scheduling server opt-in check due to self validate xpc activity", v7, 2u);
  }
}

- (void)triggerSelfValidateFromEnrollment
{
  v3 = [(KTSMManager *)self deps];
  id v4 = [v3 dew];
  [v4 selfValidationEnrollment];
  double v6 = v5;

  double v7 = [(KTSMManager *)self deps];
  double v8 = [v7 stateMonitor];
  uint64_t v9 = [v8 ktStatus];

  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B9E78);
  }
  id v10 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    float v11 = v6;
    int v14 = 134218242;
    double v15 = v11;
    __int16 v16 = 2112;
    double v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "triggerSelfValidateFromEnrollment: delay: %f current state: %@", (uint8_t *)&v14, 0x16u);
  }
  if ([v9 selfStatus] == (id)2)
  {
    __int16 v12 = [[KTPendingFlag alloc] initWithFlag:@"ValidateSelf" conditions:2 delayInSeconds:v6];
    BOOL v13 = [(KTSMManager *)self stateMachine];
    [v13 handlePendingFlag:v12];
  }
}

- (void)triggerFetchSelf:(double)a3
{
  double v5 = [[KTPendingFlag alloc] initWithFlag:@"FetchSelf" conditions:2 delayInSeconds:a3];
  id v4 = [(KTSMManager *)self stateMachine];
  [v4 handlePendingFlag:v5];
}

- (void)triggerCheckExpiredPublicKeyStores
{
  v3 = [(KTSMManager *)self deps];
  id v4 = [v3 publicKeyStore];
  unsigned int v5 = [v4 anyStoreExpired];

  if (v5)
  {
    id v6 = [(KTSMManager *)self publicKeyFetcher];
    [v6 trigger];
  }
}

- (void)triggerBackgroundSystemValidate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000;
  CFStringRef v19 = sub_10003CBA0;
  uint64_t v20 = sub_10003CBB0;
  id v21 = 0;
  id v8 = v6;
  id v21 = v8;
  if (!v17[5])
  {
    uint64_t v9 = os_transaction_create();
    id v10 = (void *)v17[5];
    v17[5] = v9;
  }
  float v11 = [(KTSMManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D900;
  block[3] = &unk_1002B9F10;
  block[4] = self;
  id v14 = v7;
  double v15 = &v16;
  id v12 = v7;
  dispatch_async(v11, block);

  _Block_object_dispose(&v16, 8);
}

- (void)notifyBackgroundValidationFailure:(id)a3 data:(id)a4 type:(id)a5 serverHint:(id)a6 failure:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  double v17 = [(KTSMManager *)self deps];
  uint64_t v18 = [v17 smDataStore];
  CFStringRef v19 = [v15 base64EncodedStringWithOptions:0];

  +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:v16 smDataStore:v18 failureDataString:v19 type:v14 serverHint:v13 failure:v12];
  uint64_t v20 = kKTApplicationIdentifierIDS;

  [(KTSMManager *)self triggerStatusUpdate:v20];
}

- (void)triggerStatusUpdate:(id)a3
{
  id v4 = [(KTSMManager *)self deps];
  unsigned int v5 = [v4 stateMonitor];
  [v5 setPendingChanges:1];

  id v6 = [(KTSMManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DF9C;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_async(v6, block);
}

- (id)optInStateForKeyStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(KTSMManager *)self deps];
  id v8 = [v7 cloudRecords];

  if (v8)
  {
    id v14 = 0;
    uint64_t v9 = [v8 getAggregateOptInStateForApplication:v6 error:&v14];
    id v10 = v14;
    if (!v9)
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002B9F50);
      }
      float v11 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "getAggregateOptInStateForApplication failed for %@: %@", buf, 0x16u);
      }
      if (a4) {
        *a4 = v10;
      }
    }
  }
  else
  {
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002B9F30);
    }
    id v12 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "no cloud records", buf, 2u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)validatePendingURIsAndRequests
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = sub_10003CBA0;
  v5[4] = sub_10003CBB0;
  id v6 = 0;
  id v6 = (id)os_transaction_create();
  v3 = [(KTSMManager *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E38C;
  v4[3] = &unk_1002B9F78;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
}

- (void)retryPendingValidations:(id)a3
{
  if ([a3 isEqual:kKTApplicationIdentifierIDS])
  {
    id v4 = objc_alloc_init(KTCondition);
    [(KTSMManager *)self setPendingValidationsComplete:v4];

    id v5 = [(KTSMManager *)self retryPendingValidations];
    [v5 trigger];
  }
}

- (void)triggerRegistrationDataNeedsUpdate:(id)a3
{
  id v4 = a3;
  [(KTSMManager *)self addEvent:@"PokeIDSWithUpdatedRegData"];
  id v5 = [(KTSMManager *)self deps];
  id v6 = [v5 stateMonitor];
  [v6 setSystemStatus:2];

  id v7 = [(KTSMManager *)self deps];
  id v8 = [v7 idsOperations];
  [v8 registrationDataNeedsUpdate:v4];

  id v11 = [(KTSMManager *)self deps];
  uint64_t v9 = [v11 logger];
  id v10 = +[NSDate date];
  [v9 setDateProperty:v10 forKey:off_10031E4C8];
}

- (void)notifyIDSRegistrationCorrect
{
  id location = 0;
  objc_initWeak(&location, self);
  v3 = [(KTSMManager *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E984;
  v4[3] = &unk_1002B72D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isKTKeyDifferent:(id)a3
{
  id v4 = a3;
  if (![(KTSMManager *)self idsServerReportedWrong]) {
    goto LABEL_4;
  }
  uint64_t v5 = [(KTSMManager *)self idsServerReportedWrongPublicKey];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = (void *)v5;
  id v7 = [(KTSMManager *)self idsServerReportedWrongPublicKey];
  unsigned __int8 v8 = [v7 isEqual:v4];

  if (v8)
  {
LABEL_4:
    BOOL v9 = 0;
  }
  else
  {
LABEL_5:
    [(KTSMManager *)self setIdsServerReportedWrong:0];
    [(KTSMManager *)self setIdsServerReportedWrongPublicKey:0];
    BOOL v9 = 1;
  }

  return v9;
}

- (void)idsServerReportKTKeyWrong:(id)a3
{
  id v4 = a3;
  [(KTSMManager *)self setIdsServerReportedWrong:1];
  [(KTSMManager *)self setIdsServerReportedWrongPublicKey:v4];
}

- (void)resetLastAccountOperations
{
  [(KTSMManager *)self setLastFetchIDMS:0];
  [(KTSMManager *)self setLastSignalIDS:0];
  [(KTSMManager *)self setLastFetchIDSSelf:0];
  [(KTSMManager *)self setLastFetchKTSelf:0];
  [(KTSMManager *)self setLastValidateSelf:0];
  [(KTSMManager *)self setLastValidateSelfOptIn:0];
  [(KTSMManager *)self setLastRegistration:0];
  [(KTSMManager *)self setLastForceSyncKVS:0];
  [(KTSMManager *)self setLastPublicKeyRefresh:0];
  [(KTSMManager *)self setLastCheckIDSRegistration:0];

  [(KTSMManager *)self setLastDutyCycle:0];
}

- (void)clearAllFollowups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(KTSMManager *)self deps];
  id v6 = [v5 followup];
  id v10 = 0;
  unsigned __int8 v7 = [v6 clearAllFollowups:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002B9F98);
    }
    BOOL v9 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "clearAllFollowups failed: %{public}@ %{public}@", buf, 0x16u);
    }
  }
}

- (void)performAndWaitForSelfValidate:(id)a3
{
  id v4 = a3;
  id v17 = 0;
  unsigned __int8 v5 = [(KTSMManager *)self waitUntilReadyForRPCForOperation:@"performAndWaitForSelfValidate" fast:0 error:&v17];
  id v6 = v17;
  if (v5)
  {
    CFStringRef v21 = @"ValidateSelf";
    CFStringRef v19 = @"Ready";
    unsigned __int8 v7 = +[KTStateTransitionPathStep success];
    uint64_t v20 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    unsigned __int8 v22 = v8;
    BOOL v9 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v10 = +[KTStateTransitionPath pathFromDictionary:v9];

    CFStringRef v18 = @"Ready";
    id v11 = +[NSArray arrayWithObjects:&v18 count:1];
    id v12 = +[NSSet setWithArray:v11];

    __int16 v13 = [(KTSMManager *)self stateMachine];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003EFCC;
    v15[3] = &unk_1002B9FC0;
    void v15[4] = self;
    id v16 = v4;
    id v14 = [v13 doWatchedStateMachineRPC:@"validate-self" sourceStates:v12 path:v10 reply:v15];
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, id))v4 + 2))(v4, 2, 0, 0, v6);
  }
}

- (id)validateSelfDiagnostics:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F190;
  v6[3] = &unk_1002B9FE8;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  [v3 handleOperationResults:v6];

  return v4;
}

- (id)missingValidateSelfFallbackDiagnostics
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(KTSMManager *)self deps];
  unsigned __int8 v5 = [v4 smDataStore];
  uint64_t v6 = kKTApplicationIdentifierIDS;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003F364;
  v9[3] = &unk_1002BA058;
  id v7 = v3;
  id v10 = v7;
  [v5 fetchSelfVerificationInfoForApplication:v6 complete:v9];

  return v7;
}

- (id)idsKTData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSMutableDictionary dictionary];
    unsigned __int8 v5 = [v3 ktDataForRegistration];
    uint64_t v6 = [v5 kt_hexString];
    [v4 setObject:v6 forKeyedSubscript:@"tbs"];

    id v7 = [v3 ktPublicAccountKey];
    id v8 = [v7 kt_hexString];
    [v4 setObject:v8 forKeyedSubscript:@"pub"];

    BOOL v9 = [v3 ktDataSignature];
    id v10 = [v9 kt_hexString];
    [v4 setObject:v10 forKeyedSubscript:@"sig"];

    id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 uploadedToKVS]);
    [v4 setObject:v11 forKeyedSubscript:@"kvs"];

    id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 ktOptInStatus]);
    [v4 setObject:v12 forKeyedSubscript:@"optin"];

    __int16 v13 = [v3 registeredTime];
    id v14 = [v13 description];
    [v4 setObject:v14 forKeyedSubscript:@"regTS"];

    id v15 = [v3 ktAccountKeyTimestamp];
    id v16 = [v15 description];
    [v4 setObject:v16 forKeyedSubscript:@"accTS"];

    id v17 = [v3 ktOptInTimestamp];
    CFStringRef v18 = [v17 description];
    [v4 setObject:v18 forKeyedSubscript:@"optTS"];

    CFStringRef v19 = [v3 ktAccountKeyErrorCode];
    [v4 setObject:v19 forKeyedSubscript:@"accErr"];

    uint64_t v20 = [v3 ktOptInErrorCode];

    [v4 setObject:v20 forKeyedSubscript:@"optErr"];
    if ([v4 count]) {
      id v21 = v4;
    }
    else {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)sysdiagnoseInfo:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(KTSMManager *)self stateMachine];
  uint64_t v6 = [v5 dumpPendingFlags];

  id v7 = [(KTSMManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FBCC;
  block[3] = &unk_1002BA0F8;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, block);
}

- (void)getStatus:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(KTSMManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004147C;
  v7[3] = &unk_1002BA140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)mapHeadUpdated:(id)a3 populating:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(KTSMManager *)self deps];
  id v8 = [v7 stateMonitor];
  id v9 = [v8 ktStatus];
  id v10 = [v9 systemStatus];

  if (v10 == (id)3 && !a4)
  {
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BA160);
    }
    id v11 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Detected tree reset populating->non-populating edge for %{public}@", buf, 0xCu);
    }
    id v12 = [(KTSMManager *)self deps];
    __int16 v13 = [v12 followup];
    id v16 = 0;
    [v13 clearFollowupsByType:v6 type:3 error:&v16];
    id v14 = v16;

    if (v14)
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002BA180);
      }
      id v15 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error clearing tree reset followups for %@: %@", buf, 0x16u);
      }
    }
    [(KTSMManager *)self triggerStatusUpdate:v6];
  }
}

- (id)metricsRegistration_ktView
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(KTSMManager *)self deps];
  unsigned __int8 v5 = [v4 smDataStore];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100041A0C;
  v8[3] = &unk_1002BA1A8;
  id v6 = v3;
  id v9 = v6;
  [v5 fetchDeviceSignature:0 complete:v8];

  return v6;
}

- (id)metricsRegistration_idsView
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableDictionary dictionary];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(KTSMManager *)self deps];
  id v7 = [v6 idsOperations];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100041EA8;
  v34[3] = &unk_1002BA0A8;
  id v8 = v4;
  id v35 = v8;
  v36 = self;
  id v9 = v5;
  v37 = v9;
  [v7 fetchKTRegistrationStatus:v34];

  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(v9, v10))
  {
    id v27 = v9;
    +[TransparencyAnalytics analyticsApplications];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v29 = *(void *)v31;
      __int16 v13 = &off_1002D9C90;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v16 = +[NSString stringWithFormat:@"reg-%@", v15];
          id v17 = +[NSString stringWithFormat:@"unreg-%@", v15];
          id v18 = [v8 objectForKeyedSubscript:v16];

          if (v18)
          {
            __int16 v19 = [v8 objectForKeyedSubscript:v16];
            [v19 objectForKeyedSubscript:@"sig"];
            id v21 = v20 = v13;

            BOOL v22 = v21 == 0;
            __int16 v13 = v20;
            if (v22) {
              v23 = v20;
            }
            else {
              v23 = &off_1002D9C78;
            }
          }
          else
          {
            v23 = &off_1002D9CA8;
          }
          [v3 setObject:v23 forKeyedSubscript:v16];
          id v24 = [v8 objectForKeyedSubscript:v17];

          if (v24) {
            uint64_t v25 = v13;
          }
          else {
            uint64_t v25 = &off_1002D9C78;
          }
          [v3 setObject:v25 forKeyedSubscript:v17];
        }
        id v12 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v12);
    }

    id v9 = v27;
  }

  return v3;
}

- (int)checkAccountKeyChanged
{
  id v3 = [(KTSMManager *)self pcsOperation];
  id v4 = [v3 getCurrentKTPCSIdentity:off_100325BD8 error:0];

  if (v4)
  {
    [v4 identity];
    uint64_t v5 = PCSIdentityGetPublicKey();
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(KTSMManager *)self deps];
      id v8 = [v7 stateMonitor];
      id v9 = [v8 ktStatus];
      dispatch_time_t v10 = [v9 accountKey];

      if (v10 && ([v10 isEqual:v6] & 1) != 0)
      {
        int v11 = 1;
      }
      else
      {
        id v12 = [(KTSMManager *)self deps];
        __int16 v13 = [v12 stateMonitor];
        [v13 setKTAccountKey:v6];

        int v11 = 3;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 2;
  }

  return v11;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(KTSMManager *)self launch];
  [v5 addEvent:v4];
}

- (BOOL)isCloudKitManateeAcountAvailable
{
  id v2 = [(KTSMManager *)self cloudKitAccountInfo];
  unint64_t v3 = ((unint64_t)[v2 deviceToDeviceEncryptionAvailability] >> 1) & 1;

  return v3;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(KTSMManager *)self addEvent:v8];
  if ([v8 isEqual:@"PublicKeysInitialFetch"])
  {
    int v11 = [KTPublicKeyStoreRefresh alloc];
    id v12 = [(KTSMManager *)self deps];
    CFStringRef v13 = @"Initializing";
    CFStringRef v14 = @"PublicKeysWait";
    uint64_t v15 = v11;
    id v16 = v12;
    uint64_t v17 = 1;
LABEL_3:
    id v18 = [(KTPublicKeyStoreRefresh *)v15 initWithDependencies:v16 initialFetch:v17 intendedState:v13 errorState:v14];

    [(KTSMManager *)self setLastPublicKeyRefresh:v18];
    goto LABEL_24;
  }
  if ([v8 isEqual:@"PublicKeysWait"])
  {
    if ([v9 _onqueueContains:@"FetchPublicKeys"])
    {
      [v9 _onqueueRemoveFlag:@"FetchPublicKeys"];
      uint64_t v19 = +[KTStateTransitionOperation named:@"need-to-fetch-public-keys" entering:@"PublicKeysInitialFetch"];
LABEL_9:
      id v18 = (KTSetOptInStateOperation *)v19;
      goto LABEL_24;
    }
    id v20 = [(KTSMManager *)self publicKeyFetcher];
    [(KTPendingFlag *)v20 trigger];
    goto LABEL_11;
  }
  if ([v8 isEqual:@"Initializing"])
  {
    [v9 _onqueueRemoveFlag:@"CKAccountChanged"];
    [v9 _onqueueRemoveFlag:@"AccountChanged"];
    [v9 _onqueueRemoveFlag:@"OctagonTrustChanged"];
    [v9 _onqueueRemoveFlag:@"ManateeViewChanged"];
    [v9 _onqueueRemoveFlag:@"EnsureIdentity"];
    [v9 _onqueueRemoveFlag:@"FetchSelf"];
    [v9 _onqueueRemoveFlag:@"CloudKitOutgoing"];
    [v9 _onqueueRemoveFlag:@"CheckAccountSignatures"];
    [v9 _onqueueRemoveFlag:@"CloudKitZoneRecreate"];
    [v9 _onqueueRemoveFlag:@"CheckKTAccountKey"];
    [v9 _onqueueRemoveFlag:@"CheckKTAccountKeyChanged"];
    [v9 _onqueueRemoveFlag:@"IDSStatusChanged"];
    uint64_t v19 = [(KTSMManager *)self initializingOperation];
    goto LABEL_9;
  }
  if ([v8 isEqual:@"KTDisabled"])
  {
    if ([(KTSMManager *)self isKTDisabled])
    {
      if ([v9 _onqueueContains:@"ChangeOptInState"])
      {
        [v9 _onqueueRemoveFlag:@"ChangeOptInState"];
        id v21 = [(KTSMManager *)self optInStates];
        BOOL v22 = [v21 targetOptInStates];
        v23 = [v22 allKeys];
        id v24 = [v23 firstObject];
        uint64_t v25 = [(KTSMManager *)self optInStates];
        [v25 setCurrentTarget:v24];

        id v26 = [KTSetOptInStateOperation alloc];
        id v27 = [(KTSMManager *)self deps];
        id v28 = [(KTSMManager *)self optInStates];
        id v18 = [(KTSetOptInStateOperation *)v26 initWithDependenics:v27 intendedState:@"KTDisabled" errorState:@"KTDisabled" optinStates:v28];

LABEL_17:
        goto LABEL_24;
      }
      long long v32 = [(KTSMManager *)self deps];
      long long v33 = [v32 stateMonitor];
      v34 = [v33 ktStatus];
      id v35 = [v34 optIn];

      if (v35 != (id)2) {
        goto LABEL_12;
      }
      v36 = [KTFillStatusOperation alloc];
      v37 = [(KTSMManager *)self deps];
      uint64_t v38 = kKTApplicationIdentifierIDS;
      id v39 = v36;
      uint64_t v40 = 1;
      v41 = v37;
      CFStringRef v42 = @"KTDisabled";
      CFStringRef v43 = @"KTDisabled";
      goto LABEL_32;
    }
    uint64_t v29 = +[NSString stringWithFormat:@"%@", @"initializing-after-disable"];
    long long v30 = +[KTStateTransitionOperation named:v29 entering:@"Initializing"];
    goto LABEL_22;
  }
  if ([v8 isEqual:@"WaitForUnlock"])
  {
    if (![v9 _onqueueContains:@"Unlocked"])
    {
      id v20 = [[KTPendingFlag alloc] initWithFlag:@"Unlocked" conditions:1];
      [v10 _onqueueHandlePendingFlagLater:v20];
LABEL_11:

LABEL_12:
      id v18 = 0;
      goto LABEL_24;
    }
    [v9 _onqueueRemoveFlag:@"Unlocked"];
    uint64_t v29 = +[NSString stringWithFormat:@"%@", @"initializing-after-unlock"];
    long long v30 = +[KTStateTransitionOperation named:v29 entering:@"Initializing"];
    goto LABEL_22;
  }
  if ([v8 isEqual:@"NoAccount"])
  {
    if ([v9 _onqueueContains:@"AccountChanged"])
    {
      uint64_t v19 = +[KTStateTransitionOperation named:@"account-probably-changed" entering:@"Initializing"];
      goto LABEL_9;
    }
    if ([v9 _onqueueContains:@"CKAccountChanged"])
    {
      uint64_t v19 = +[KTStateTransitionOperation named:@"account-probably-changed-ck" entering:@"Initializing"];
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  if ([v8 isEqual:@"KTStateCheckCloudKitAccount"])
  {
    [v9 _onqueueRemoveFlag:@"CKAccountChanged"];
    if (![(KTSMManager *)self isCloudKitManateeAcountAvailable])
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002BA1C8);
      }
      v46 = (void *)qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
      {
        v47 = v46;
        v48 = [(KTSMManager *)self cloudKitAccountInfo];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "CloudKit not available for device2device encryption, holding start up: %@", buf, 0xCu);
      }
      goto LABEL_12;
    }
    uint64_t v29 = +[NSString stringWithFormat:@"%@", @"initializing-ck-show-up"];
    long long v30 = +[KTStateTransitionOperation named:v29 entering:@"GetStatusInitial"];
    goto LABEL_22;
  }
  CFStringRef v45 = @"WaitForManatee";
  if ([v8 isEqual:@"WaitForManatee"])
  {
    if ([v9 _onqueueContains:@"OctagonTrustChanged"])
    {
      uint64_t v19 = +[KTStateTransitionOperation named:@"ckaccount-probably-changed" entering:@"Initializing"];
      goto LABEL_9;
    }
    if ([v9 _onqueueContains:@"ManateeViewChanged"])
    {
      uint64_t v19 = +[KTStateTransitionOperation named:@"retry-manatee-check" entering:@"Initializing"];
      goto LABEL_9;
    }
    if (![v9 _onqueueContains:@"CheckAccountSignatures"]) {
      goto LABEL_12;
    }
    goto LABEL_57;
  }
  CFStringRef v45 = @"WaitForCKKS";
  if (![v8 isEqual:@"WaitForCKKS"])
  {
    if ([v8 isEqual:@"CheckKTAccountKeyChanged"])
    {
      [v9 _onqueueRemoveFlag:@"CheckKTAccountKeyChanged"];
      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_1000449EC;
      v158[3] = &unk_1002BA278;
      v158[4] = self;
      id v159 = v9;
      id v18 = +[KTStateTransitionOperation named:@"check-kt-account-key-changed" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v158];

      goto LABEL_24;
    }
    if ([v8 isEqual:@"ForceSyncKTAccountKey"])
    {
      [v9 _onqueueRemoveFlag:@"CheckKTAccountKey"];
      *(void *)long long buf = 0;
      objc_initWeak((id *)buf, self);
      v50 = [(KTSMManager *)self deps];
      v51 = [v50 octagonOperations];
      v156[0] = _NSConcreteStackBlock;
      v156[1] = 3221225472;
      v156[2] = sub_100044D5C;
      v156[3] = &unk_1002BA2C0;
      objc_copyWeak(&v157, (id *)buf);
      [v51 ckksRequestViewSync:@"Manatee" complete:v156];

      id v18 = +[KTStateTransitionOperation named:@"force-sync-kt-account-key-done" entering:@"Ready"];
      objc_destroyWeak(&v157);
      objc_destroyWeak((id *)buf);
      goto LABEL_24;
    }
    if ([v8 isEqual:@"KTStateFixups"])
    {
      v52 = [KTFixupOperation alloc];
      v37 = [(KTSMManager *)self deps];
      v44 = [(KTFixupOperation *)v52 initWithDependenics:v37 intendedState:@"EnsureAccountIdentity" errorState:@"EnsureAccountIdentity"];
      goto LABEL_33;
    }
    if ([v8 isEqual:@"RetryEnsureAccountIdentity"])
    {
      if (([v9 _onqueueContains:@"CKAccountChanged"] & 1) != 0
        || [v9 _onqueueContains:@"OctagonTrustChanged"])
      {
        uint64_t v19 = +[KTStateTransitionOperation named:@"recheck-accountstate" entering:@"Initializing"];
        goto LABEL_9;
      }
      if (([v9 _onqueueContains:@"EnsureIdentity"] & 1) == 0
        && ![v9 _onqueueContains:@"ManateeViewChanged"])
      {
        goto LABEL_12;
      }
      goto LABEL_159;
    }
    if ([v8 isEqual:@"EnsureAccountIdentity"])
    {
      [v9 _onqueueRemoveFlag:@"EnsureIdentity"];
      v59 = [KTEnsureAccountIdentityOperation alloc];
      v60 = [(KTSMManager *)self deps];
      v61 = [(KTSMManager *)self pcsOperation];
      v62 = [(KTEnsureAccountIdentityOperation *)v59 initWithDependencies:v60 pcsOperation:v61];

      v154[0] = _NSConcreteStackBlock;
      v154[1] = 3221225472;
      v154[2] = sub_100044F48;
      v154[3] = &unk_1002BA278;
      v154[4] = self;
      v155 = v62;
      v63 = v62;
      id v18 = +[KTStateTransitionOperation named:@"ensure-identity" intending:@"KTStateCheckCloudKitAccount" errorState:@"Error" withBlockTakingSelf:v154];
      [(KTSetOptInStateOperation *)v18 addNullableDependency:v63];
      v64 = [(KTSMManager *)self operationQueue];
      [v64 addOperation:v63];

      goto LABEL_24;
    }
    if ([v8 isEqual:@"SignalIDS"])
    {
      [v9 _onqueueRemoveFlag:@"RepairIDSFlag"];
      v65 = [KTSignalIDSOperation alloc];
      v66 = [(KTSMManager *)self deps];
      v67 = [(KTSMManager *)self selfValidationResult];
      v68 = [(KTSMManager *)self stateMachine];
      id v18 = [(KTSignalIDSOperation *)v65 initWithDependencies:v66 intendedState:@"InitialIDMSCheck" errorState:@"Ready" selfValidationResult:v67 stateMachine:v68];

      [(KTSMManager *)self setLastSignalIDS:v18];
      goto LABEL_24;
    }
    if ([v8 isEqual:@"FetchConfigBag"])
    {
      [v9 _onqueueRemoveFlag:@"ConfigBagFetch"];
      v69 = [KTConfigBagFetchOperation alloc];
      uint64_t v29 = [(KTSMManager *)self deps];
      long long v30 = [(KTConfigBagFetchOperation *)v69 initWithDependencies:v29 intendedState:@"Ready" errorState:@"Ready" triggerInterface:self];
LABEL_22:
      id v18 = (KTSetOptInStateOperation *)v30;
LABEL_23:

      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      [v9 _onqueueRemoveFlag:@"FetchSelf"];
      v70 = [KTFetchIDSSelfOperation alloc];
      v71 = [(KTSMManager *)self deps];
      uint64_t v72 = kKTApplicationIdentifierIDS;
      v73 = off_1002CA8F8;
LABEL_81:
      id v18 = [(KTFetchIDSSelfOperation *)v70 initWithApplication:v72 dependencies:v71 intendedState:*v73 errorState:@"Ready"];

      [(KTSMManager *)self setLastFetchIDSSelf:v18];
      goto LABEL_24;
    }
    if ([v8 isEqual:@"FetchKTSelf"])
    {
LABEL_83:
      v74 = [KTFetchKTSelfOperation alloc];
      v75 = [(KTSMManager *)self deps];
      id v18 = [(KTFetchKTSelfOperation *)v74 initWithApplication:kKTApplicationIdentifierIDS dependencies:v75 intendedState:@"Ready" errorState:@"Ready"];

      [(KTSMManager *)self setLastFetchKTSelf:v18];
      goto LABEL_24;
    }
    if ([v8 isEqual:@"ValidateFetchIDSSelf"])
    {
      [v9 _onqueueRemoveFlag:@"ValidateSelf"];
      [v9 _onqueueRemoveFlag:@"FetchSelf"];
      v70 = [KTFetchIDSSelfOperation alloc];
      v71 = [(KTSMManager *)self deps];
      uint64_t v72 = kKTApplicationIdentifierIDS;
      v73 = off_1002CA918;
      goto LABEL_81;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      [v9 _onqueueRemoveFlag:@"FetchIDMS"];
      v76 = [KTFetchIDMSOperation alloc];
      v77 = [(KTSMManager *)self deps];
      v78 = [(KTSMManager *)self specificUser];
      id v18 = [(KTFetchIDMSOperation *)v76 initWithDependencies:v77 specificUser:v78 intendedState:@"Ready" errorState:@"Ready"];

      [(KTSMManager *)self setLastFetchIDMS:v18];
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      [v9 _onqueueRemoveFlag:@"CheckIDSRegistration"];
      v153[0] = _NSConcreteStackBlock;
      v153[1] = 3221225472;
      v153[2] = sub_100045668;
      v153[3] = &unk_1002BA3A8;
      v153[4] = self;
      uint64_t v19 = +[KTStateTransitionGroupOperation named:@"check-ids-registration" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v153];
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      v79 = [KTCheckInitialCache alloc];
      uint64_t v29 = [(KTSMManager *)self deps];
      v80 = [(KTSMManager *)self stateMachine];
      v81 = [(KTCheckInitialCache *)v79 initWithDependencies:v29 intendedState:@"ZoneSetup" errorState:@"ZoneSetup" stateMachine:v80];
      goto LABEL_92;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      [v9 _onqueueRemoveFlag:@"CloudKitZoneRecreate"];
      *(void *)long long buf = 0;
      objc_initWeak((id *)buf, self);
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472;
      v151[2] = sub_100045990;
      v151[3] = &unk_1002BA438;
      objc_copyWeak(&v152, (id *)buf);
      id v18 = +[KTStateTransitionGroupOperation named:@"zone-setup" intending:@"ProcessIncomingInitial" errorState:@"InitialSignRegistrationData" withBlockTakingSelf:v151];
      objc_destroyWeak(&v152);
      objc_destroyWeak((id *)buf);
      goto LABEL_24;
    }
    if ([v8 isEqual:@"ProcessIncomingInitial"])
    {
      v133 = [(KTSMManager *)self deps];
      v130 = [v133 fetchCloudStorage];
      v82 = [(KTSMManager *)self deps];
      v83 = off_10031E568;
      v84 = [(KTSMManager *)self deps];
      v85 = [v84 dataStore];
      v86 = [v85 controller];
      id v87 = [v86 backgroundContext];
      v88 = [v130 cloudFetchOperationWithDeps:v82 initialFetch:0 userInteractive:1 reason:v83 context:v87];

      v148[0] = _NSConcreteStackBlock;
      v148[1] = 3221225472;
      v148[2] = sub_100045FC0;
      v148[3] = &unk_1002BA278;
      id v149 = v88;
      v150 = self;
      id v89 = v88;
      id v18 = +[KTStateTransitionOperation named:@"initial-fetch" intending:@"InitialSignRegistrationData" errorState:@"InitialSignRegistrationData" withBlockTakingSelf:v148];
      [(KTSetOptInStateOperation *)v18 addNullableDependency:v89];
      v90 = [(KTSMManager *)self operationQueue];
      [v90 addOperation:v89];

      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:"))
    {
      [v9 _onqueueRemoveFlag:@"CloudKitIncoming"];
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472;
      v147[2] = sub_10004607C;
      v147[3] = &unk_1002BA3A8;
      v147[4] = self;
      uint64_t v19 = +[KTStateTransitionGroupOperation named:@"process-incoming" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v147];
      goto LABEL_9;
    }
    if ([v8 isEqual:@"InitialSignRegistrationData"])
    {
      [v9 _onqueueRemoveFlag:@"CheckAccountSignatures"];
      v91 = [KTEnrollmentRegistrationSignature alloc];
      id v92 = [(KTSMManager *)self deps];
      v93 = v91;
      id v94 = v92;
      id v95 = 0;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqual:"))
      {
        if ([v8 isEqual:@"ValidateFetchKTSelf"]) {
          goto LABEL_83;
        }
        if ([v8 isEqual:@"ForceSyncKVS"])
        {
          id v98 = [KTForceSyncKVSOperation alloc];
          v99 = [(KTSMManager *)self deps];
          id v18 = [(KTForceSyncKVSOperation *)v98 initWithDependencies:v99 timeout:30000000000 intendedState:@"Ready" errorState:@"Ready"];

          [(KTSMManager *)self setLastForceSyncKVS:v18];
          goto LABEL_24;
        }
        if (objc_msgSend(v8, "isEqual:"))
        {
          [v9 _onqueueRemoveFlag:@"ValidateSelf"];
          [v9 _onqueueRemoveFlag:@"FetchSelf"];
          [v9 _onqueueRemoveFlag:@"ValidateSelfOptIn"];
          id v100 = +[NSDate date];
          [(KTSMManager *)self setLastSelfValidate:v100];

          *(void *)long long buf = 0;
          objc_initWeak((id *)buf, self);
          v145[0] = _NSConcreteStackBlock;
          v145[1] = 3221225472;
          v145[2] = sub_1000460B0;
          v145[3] = &unk_1002BA438;
          objc_copyWeak(&v146, (id *)buf);
          id v18 = +[KTStateTransitionGroupOperation named:@"validate-self" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v145];
          objc_destroyWeak(&v146);
          objc_destroyWeak((id *)buf);
          goto LABEL_24;
        }
        if (objc_msgSend(v8, "isEqual:"))
        {
          [v9 _onqueueRemoveFlag:@"ChangeOptInState"];
          v101 = [(KTSMManager *)self optInStates];
          v102 = [v101 targetOptInStates];
          id v103 = [v102 count];

          if (!v103)
          {
            uint64_t v19 = +[KTStateTransitionOperation named:@"Done with all opt-in changes" entering:@"Ready"];
            goto LABEL_9;
          }
          id v104 = [KTChangeOptInStateOperation alloc];
          uint64_t v29 = [(KTSMManager *)self deps];
          v80 = [(KTSMManager *)self optInStates];
          CFStringRef v105 = @"SetOptIO";
          id v106 = v104;
          v107 = v29;
        }
        else
        {
          if (!objc_msgSend(v8, "isEqual:"))
          {
            if ([v8 isEqual:@"ValidateSelfOptIn"])
            {
              *(void *)long long buf = 0;
              objc_initWeak((id *)buf, self);
              v143[0] = _NSConcreteStackBlock;
              v143[1] = 3221225472;
              v143[2] = sub_100046A5C;
              v143[3] = &unk_1002BA438;
              objc_copyWeak(&v144, (id *)buf);
              id v18 = +[KTStateTransitionGroupOperation named:@"validate-self-opt-in" intending:@"SetOptIO" errorState:@"Ready" withBlockTakingSelf:v143];
              objc_destroyWeak(&v144);
              objc_destroyWeak((id *)buf);
              goto LABEL_24;
            }
            if (objc_msgSend(v8, "isEqual:"))
            {
              [v9 _onqueueRemoveFlag:@"CloudKitOutgoing"];
              v134 = [(KTSMManager *)self deps];
              v131 = [v134 cloudRecords];
              v109 = [(KTSMManager *)self deps];
              id v110 = [(KTSMManager *)self deps];
              v111 = [v110 dataStore];
              id v112 = [v111 controller];
              v113 = [v112 backgroundContext];
              id v114 = [v131 updateCloudRecordsOperation:v109 context:v113];

              v140[0] = _NSConcreteStackBlock;
              v140[1] = 3221225472;
              v140[2] = sub_100047294;
              v140[3] = &unk_1002BA278;
              id v141 = v114;
              v142 = self;
              id v115 = v114;
              id v18 = +[KTStateTransitionOperation named:@"processOutgoing" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v140];
              [(KTGroupOperation *)v18 addDependency:v115];
              id v116 = [(KTSMManager *)self operationQueue];
              [v116 addOperation:v115];

              goto LABEL_24;
            }
            if (objc_msgSend(v8, "isEqual:"))
            {
              [v9 _onqueueRemoveFlag:@"FetchPublicKeys"];
              v117 = [KTPublicKeyStoreRefresh alloc];
              id v12 = [(KTSMManager *)self deps];
              CFStringRef v13 = @"Ready";
              uint64_t v15 = v117;
              id v16 = v12;
              uint64_t v17 = 0;
              CFStringRef v14 = @"Ready";
              goto LABEL_3;
            }
            if (objc_msgSend(v8, "isEqual:"))
            {
              [v9 _onqueueRemoveFlag:@"AccountChanged"];
              uint64_t v19 = [(KTSMManager *)self recheckAccount];
              goto LABEL_9;
            }
            if ([v8 isEqual:@"EnvironmentSwitch"])
            {
              *(void *)long long buf = 0;
              objc_initWeak((id *)buf, self);
              v138[0] = _NSConcreteStackBlock;
              v138[1] = 3221225472;
              v138[2] = sub_100047364;
              v138[3] = &unk_1002BA438;
              objc_copyWeak(&v139, (id *)buf);
              id v18 = +[KTStateTransitionGroupOperation named:@"transparency-environment-switch" intending:@"ResetLocalState" errorState:@"ResetLocalState" withBlockTakingSelf:v138];
              objc_destroyWeak(&v139);
              objc_destroyWeak((id *)buf);
              goto LABEL_24;
            }
            if ([v8 isEqual:@"ResetLocalState"])
            {
              v137[0] = _NSConcreteStackBlock;
              v137[1] = 3221225472;
              v137[2] = sub_100047674;
              v137[3] = &unk_1002BA1F0;
              v137[4] = self;
              uint64_t v19 = +[KTStateTransitionOperation named:@"transparency-reset-local" intending:@"Initializing" errorState:@"Error" withBlockTakingSelf:v137];
              goto LABEL_9;
            }
            if ([v8 isEqual:@"ResetLocalCloudState"])
            {
              v136[0] = _NSConcreteStackBlock;
              v136[1] = 3221225472;
              v136[2] = sub_100047A18;
              v136[3] = &unk_1002BA1F0;
              v136[4] = self;
              uint64_t v19 = +[KTStateTransitionOperation named:@"transparency-reset-local-cloud-state" intending:@"Initializing" errorState:@"Initializing" withBlockTakingSelf:v136];
              goto LABEL_9;
            }
            if ([v8 isEqual:@"GetStatusInitial"])
            {
              [v9 _onqueueRemoveFlag:@"StatusUpdate"];
              id v118 = [KTFillStatusOperation alloc];
              v37 = [(KTSMManager *)self deps];
              uint64_t v38 = kKTApplicationIdentifierIDS;
              id v39 = v118;
              uint64_t v40 = 1;
              v41 = v37;
              CFStringRef v42 = @"InitialIDMSCheck";
            }
            else
            {
              if (!objc_msgSend(v8, "isEqual:"))
              {
                if (objc_msgSend(v8, "isEqual:"))
                {
                  [v9 _onqueueRemoveFlag:@"PokeIDS"];
                  v135[0] = _NSConcreteStackBlock;
                  v135[1] = 3221225472;
                  v135[2] = sub_100047ADC;
                  v135[3] = &unk_1002BA1F0;
                  v135[4] = self;
                  uint64_t v19 = +[KTStateTransitionOperation named:@"poke-ids" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v135];
                  goto LABEL_9;
                }
                if (![v8 isEqual:@"Ready"]) {
                  goto LABEL_12;
                }
                v125 = [(KTSMManager *)self stateMachine];
                [v125 _onqueueCancelPendingFlag:@"CheckServerOptIn"];

                v126 = [(KTSMManager *)self readyComplete];
                [v126 fulfill];

                v127 = [(KTSMManager *)self deps];
                objc_super v124 = [v127 stateMonitor];
                [v124 setAccountStatus:4];

                if ([v9 _onqueueContains:@"AccountChanged"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"account-probably-changed" entering:@"RecheckAccount"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"CheckAccountSignatures"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"make-signatures" entering:@"SignRegistrationData"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"OctagonTrustChanged"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"recheck-after-octagon-change" entering:@"Initializing"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"RepairIDSFlag"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"repair-ids" entering:@"SignalIDS"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"ConfigBagFetch"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"fetch-config-bag" entering:@"FetchConfigBag"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"FetchSelf"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"fetch-ids-self" entering:@"FetchIDSSelf"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"FetchIDMS"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"fetch-idms" entering:@"FetchIDMS"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"FetchPublicKeys"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"public-keys-fetch" entering:@"PublicKeysFetch"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"CheckIDSRegistration"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"check-ids-registration" entering:@"CheckIDSRegistration"];
                  goto LABEL_9;
                }
                if ([v9 _onqueueContains:@"ChangeOptInState"])
                {
                  uint64_t v19 = +[KTStateTransitionOperation named:@"process-opt-in-out" entering:@"ChangeOptIn"];
                  goto LABEL_9;
                }
                if (![v9 _onqueueContains:@"EnsureIdentity"])
                {
                  if ([v9 _onqueueContains:@"CloudKitZoneRecreate"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"zone-needs-resetup" entering:@"ZoneSetup"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"CloudKitOutgoing"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"upload-to-ck" entering:@"ProcessOutgoing"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"CloudKitIncoming"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"fetch-from-ck" entering:@"ProcessIncoming"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"ValidateSelf"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"validate-self" entering:@"ValidateSelf"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"CheckKTAccountKey"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"check-kt-account-key" entering:@"ForceSyncKTAccountKey"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"StatusUpdate"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"fill-status" entering:@"GetStatus"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"CheckKTAccountKeyChanged"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"check-account-key-changed" entering:@"CheckKTAccountKeyChanged"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"IDSStatusChanged"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"check-ids-account" entering:@"Initializing"];
                    goto LABEL_9;
                  }
                  if ([v9 _onqueueContains:@"PokeIDS"])
                  {
                    uint64_t v19 = +[KTStateTransitionOperation named:@"poke-ids" entering:@"PokeIDS"];
                    goto LABEL_9;
                  }
                  id v120 = [(KTSMManager *)self launch];
                  [v120 launch];

                  v121 = [(KTSMManager *)self deps];
                  id v122 = [v121 logger];
                  v123 = [(KTSMManager *)self launch];
                  [v122 noteLaunchSequence:v123];

                  goto LABEL_12;
                }
LABEL_159:
                uint64_t v19 = +[KTStateTransitionOperation named:@"retry-ensure-identity" entering:@"EnsureAccountIdentity"];
                goto LABEL_9;
              }
              [v9 _onqueueRemoveFlag:@"StatusUpdate"];
              v119 = [KTFillStatusOperation alloc];
              v37 = [(KTSMManager *)self deps];
              uint64_t v38 = kKTApplicationIdentifierIDS;
              CFStringRef v42 = @"Ready";
              id v39 = v119;
              uint64_t v40 = 0;
              v41 = v37;
            }
            CFStringRef v43 = v42;
LABEL_32:
            v44 = [(KTFillStatusOperation *)v39 initWithApplication:v38 initialFill:v40 dependencies:v41 intendedState:v42 errorState:v43];
LABEL_33:
            id v18 = (KTSetOptInStateOperation *)v44;

            goto LABEL_24;
          }
          id v108 = [KTSetOptInStateOperation alloc];
          uint64_t v29 = [(KTSMManager *)self deps];
          v80 = [(KTSMManager *)self optInStates];
          CFStringRef v105 = @"Ready";
          id v106 = v108;
          v107 = v29;
        }
        v81 = (KTCheckInitialCache *)[v106 initWithDependenics:v107 intendedState:v105 errorState:@"Ready" optinStates:v80];
LABEL_92:
        id v18 = (KTSetOptInStateOperation *)v81;

        goto LABEL_23;
      }
      id v96 = [v9 _onqueueContains:@"CheckAccountSignatures"];
      [v9 _onqueueRemoveFlag:@"CheckAccountSignatures"];
      v97 = [KTEnrollmentRegistrationSignature alloc];
      id v92 = [(KTSMManager *)self deps];
      v93 = v97;
      id v94 = v92;
      id v95 = v96;
    }
    id v18 = [(KTEnrollmentRegistrationSignature *)v93 initWithDependencies:v94 forceUpdate:v95 intendedState:@"Ready" errorState:@"Ready" idsRegistrationInterface:self signatureTracker:self];

    [(KTSMManager *)self setLastRegistration:v18];
    goto LABEL_24;
  }
  if (([v9 _onqueueContains:@"CKAccountChanged"] & 1) != 0
    || ([v9 _onqueueContains:@"OctagonTrustChanged"] & 1) != 0
    || [v9 _onqueueContains:@"ManateeViewChanged"])
  {
    uint64_t v19 = +[KTStateTransitionOperation named:@"retry-ckks-check" entering:@"Initializing"];
    goto LABEL_9;
  }
  if ([v9 _onqueueContains:@"CheckAccountSignatures"])
  {
LABEL_57:
    [v9 _onqueueRemoveFlag:@"CheckAccountSignatures"];
    v49 = [KTEnrollmentRegistrationSignature alloc];
    id v27 = [(KTSMManager *)self deps];
    id v18 = [(KTEnrollmentRegistrationSignature *)v49 initWithDependencies:v27 forceUpdate:0 intendedState:v45 errorState:v45 idsRegistrationInterface:self signatureTracker:self];
    goto LABEL_17;
  }
  if (![v9 _onqueueContains:@"CloudKitOutgoing"]) {
    goto LABEL_12;
  }
  [v9 _onqueueRemoveFlag:@"CloudKitOutgoing"];
  v132 = [(KTSMManager *)self deps];
  v129 = [v132 cloudRecords];
  v128 = [(KTSMManager *)self deps];
  v53 = [(KTSMManager *)self deps];
  v54 = [v53 dataStore];
  v55 = [v54 controller];
  v56 = [v55 backgroundContext];
  v57 = [v129 updateCloudRecordsOperation:v128 context:v56];

  v160[0] = _NSConcreteStackBlock;
  v160[1] = 3221225472;
  v160[2] = sub_100044934;
  v160[3] = &unk_1002BA1F0;
  v160[4] = self;
  id v18 = +[KTStateTransitionOperation named:@"processOutgoing" intending:@"WaitForCKKS" errorState:@"WaitForCKKS" withBlockTakingSelf:v160];
  [(KTResultOperation *)v18 addSuccessDependency:v57];
  v58 = [(KTSMManager *)self operationQueue];
  [v58 addOperation:v57];

LABEL_24:

  return v18;
}

- (void)maybeCreateServerOptInFetch
{
  unint64_t v3 = [(KTSMManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047BE0;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onQueueMaybeCreateNewServerOptInFetch
{
  unint64_t v3 = [(KTSMManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v12 = [(KTSMManager *)self deps];
  id v4 = [v12 stateMonitor];
  if ([v4 newServerOptInRequests])
  {
    uint64_t v5 = [(KTSMManager *)self currentServerOptInFetch];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(KTSMManager *)self currentServerOptInFetch];
      unsigned int v8 = [v7 isFinished];

      if (!v8) {
        return;
      }
    }
    else
    {
    }
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BA5E8);
    }
    id v9 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating new ServerOptIn fetch", buf, 2u);
    }
    id v10 = [(KTSMManager *)self _onqueueCreateNewServerOptInFetch];
    int v11 = [(KTSMManager *)self stateMachine];
    [v11 cancelPendingFlag:@"CheckServerOptIn"];
  }
  else
  {
  }
}

- (id)_onqueueCreateNewServerOptInFetch
{
  unint64_t v3 = [(KTSMManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(KTSMManager *)self serverOptInFetchReasons];
  uint64_t v5 = +[NSMutableSet set];
  [(KTSMManager *)self setServerOptInFetchReasons:v5];

  id v6 = [v4 allObjects];
  id v7 = [v6 componentsJoinedByString:@","];

  unsigned int v8 = [KTFetchServerOptInStatus alloc];
  id v9 = [(KTSMManager *)self deps];
  id v10 = [(KTSMManager *)self serverOptInScheduler];
  int v11 = [(KTFetchServerOptInStatus *)v8 initWithDependencies:v9 reason:v7 retryScheduler:v10];

  [(KTSMManager *)self setCurrentServerOptInFetch:v11];
  id v12 = [(KTSMManager *)self deps];
  CFStringRef v13 = [v12 stateMonitor];
  [v13 setNewServerOptInRequests:0];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100048040;
  v24[3] = &unk_1002B6CF8;
  v24[4] = self;
  CFStringRef v14 = +[NSBlockOperation blockOperationWithBlock:v24];
  uint64_t v15 = [(KTSMManager *)self currentServerOptInFetch];
  [v14 addNullableDependency:v15];

  id v16 = [(KTSMManager *)self currentServerOptInFetch];
  uint64_t v17 = [(KTSMManager *)self deps];
  id v18 = [v17 reachabilityTracker];
  uint64_t v19 = [v18 reachabilityDependency];
  [v16 addNullableDependency:v19];

  id v20 = [(KTSMManager *)self operationQueue];
  id v21 = [(KTSMManager *)self currentServerOptInFetch];
  [v20 addOperation:v21];

  BOOL v22 = [(KTSMManager *)self operationQueue];
  [v22 addOperation:v14];

  return v11;
}

- (void)requestServerOptInFetchForManyReasons:(id)a3 delayInSeconds:(double)a4
{
  id v6 = a3;
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002BA608);
  }
  id v7 = (void *)qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = v7;
    id v9 = [v6 allObjects];
    id v10 = [v9 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "triggering a new server opt-in state fetch because of reason: %@", buf, 0xCu);
  }
  int v11 = [(KTSMManager *)self deps];
  id v12 = [v11 stateMonitor];
  [v12 setNewServerOptInRequests:1];

  CFStringRef v13 = [KTPendingFlag alloc];
  CFStringRef v14 = [(KTSMManager *)self serverOptInScheduler];
  uint64_t v15 = [(KTPendingFlag *)v13 initWithFlag:@"CheckServerOptIn" conditions:2 scheduler:v14];

  id v16 = [(KTSMManager *)self deps];
  uint64_t v17 = [v16 flagHandler];
  [v17 handlePendingFlag:v15];

  id v18 = [(KTSMManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048368;
  block[3] = &unk_1002B9D28;
  block[4] = self;
  id v21 = v6;
  double v22 = a4;
  id v19 = v6;
  dispatch_async(v18, block);
}

- (void)newServerOptInFetch:(id)a3
{
  id v4 = +[NSSet setWithObject:a3];
  [(KTSMManager *)self requestServerOptInFetchForManyReasons:v4 delayInSeconds:0.0];
}

- (void)triggerServerOptInFetch4h
{
}

- (void)triggerBAACertFetcher
{
  id v3 = [(KTSMManager *)self deps];
  id v2 = [v3 certFetcher];
  [v2 getDeviceCertWithForcedFetch:1 completionHandler:&stru_1002BA648];
}

- (void)postKTDisabledFollowup
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000486A4;
  v2[3] = &unk_1002BA6B0;
  v2[4] = self;
  [(KTSMManager *)self getOptInStateForApplication:kKTApplicationIdentifierIDS complete:v2];
}

- (void)updateKTDisabledForIDS:(BOOL)a3
{
  uint64_t v5 = [(KTSMManager *)self deps];
  id v6 = [v5 dataStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048938;
  v7[3] = &unk_1002BA6D8;
  BOOL v8 = a3;
  v7[4] = self;
  [v6 peers:v7];
}

- (id)initializingOperation
{
  id location = 0;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100048C6C;
  v4[3] = &unk_1002BA9C8;
  objc_copyWeak(&v5, &location);
  id v2 = +[KTStateTransitionOperation named:@"transparency-initializing" intending:@"NoAccount" errorState:@"Error" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)recheckAccount
{
  id location = 0;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004AB28;
  v4[3] = &unk_1002BA9C8;
  objc_copyWeak(&v5, &location);
  id v2 = +[KTStateTransitionOperation named:@"transparency-recheck-account" intending:@"Ready" errorState:@"Initializing" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)accountFirstSeenDate
{
  id v2 = [(KTSMManager *)self deps];
  id v3 = [v2 logger];
  id v4 = [v3 datePropertyForKey:off_10031E4E0];

  return v4;
}

- (void)clearAccountMetrics
{
  id v3 = [(KTSMManager *)self deps];
  id v4 = [v3 logger];
  [v4 setDateProperty:0 forKey:off_10031E4E0];

  [(KTSMManager *)self setLastSelfValidate:0];
}

- (id)lastSelfValidate
{
  id v2 = [(KTSMManager *)self deps];
  id v3 = [v2 smDataStore];
  id v4 = [v3 getSettingsDate:off_10031E4E8];

  return v4;
}

- (void)setLastSelfValidate:(id)a3
{
  id v4 = a3;
  id v6 = [(KTSMManager *)self deps];
  id v5 = [v6 smDataStore];
  [v5 setSettingsDate:off_10031E4E8 date:v4];
}

- (BOOL)optOutWhenNotEligble:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(KTIDSOpsOptInOutData);
  [(KTIDSOpsOptInOutData *)v6 setOptInStatus:&__kCFBooleanFalse];
  id v16 = v5;
  uint64_t v17 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  id v9 = [(KTSMManager *)self deps];
  id v10 = [v9 idsOperations];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004B120;
  v14[3] = &unk_1002BAA10;
  void v14[4] = self;
  dispatch_semaphore_t v15 = v8;
  int v11 = v8;
  [v10 sendOptInUpdateRequest:v7 withCompletion:v14];

  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v11, v12);

  return 1;
}

- (BOOL)changeOptInState:(unint64_t)a3 application:(id)a4 loggableData:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  unsigned __int8 v11 = [(KTSMManager *)self isKTDisabled];
  if (!a3 || (v11 & 1) == 0)
  {
    v54 = a5;
    v55 = a6;
    CFStringRef v13 = [(KTSMManager *)self deps];
    CFStringRef v14 = [v13 accountOperations];
    id v62 = 0;
    dispatch_semaphore_t v15 = [v14 primaryAccount:&v62];
    id v16 = v62;

    if (!v15)
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002BAA30);
      }
      uint64_t v17 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "no primary account: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v18 = [(KTSMManager *)self deps];
    id v19 = [v18 accountOperations];
    id v20 = [(KTSMManager *)self deps];
    id v21 = [v20 idsAccountTracker];
    id v61 = v16;
    double v22 = (char *)[v19 ktAccountStatus:v15 idsAccountsTracker:v21 error:&v61];
    id v56 = v61;

    if ((unint64_t)(v22 - 4) >= 2)
    {
      if (v22)
      {
        BOOL v29 = 0;
        unint64_t v28 = 0;
        if (a3) {
          goto LABEL_11;
        }
      }
      else
      {
        long long v32 = [(KTSMManager *)self readyComplete];
        +[TransparencySettings uiBlockingNetworkTimeout];
        [v32 wait:(uint64_t)(v33 * 1000000000.0)];

        v34 = [(KTSMManager *)self deps];
        id v35 = [v34 stateMonitor];
        v36 = [v35 ktStatus];
        unint64_t v28 = (unint64_t)[v36 accountStatus];

        BOOL v29 = (v28 & 0xFFFFFFFFFFFFFFFELL) != 2;
        if ((v28 & 0xFFFFFFFFFFFFFFFELL) == 2 && a3 != 0) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      v23 = [(KTSMManager *)self readyComplete];
      +[TransparencySettings uiBlockingNetworkTimeout];
      [v23 wait:(uint64_t)(v24 * 1000000000.0)];

      uint64_t v25 = [(KTSMManager *)self deps];
      id v26 = [v25 stateMonitor];
      id v27 = [v26 ktStatus];
      unint64_t v28 = (unint64_t)[v27 accountStatus];

      BOOL v29 = (v28 & 0xFFFFFFFFFFFFFFFELL) != 2;
      if (a3)
      {
LABEL_11:
        id v30 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal, -160, v56, @"Opt-in not allowed, account state: %d cdpState: %d", v22, v28 code underlyingError description];
        if (qword_100326790 != -1) {
          dispatch_once(&qword_100326790, &stru_1002BAA50);
        }
        long long v31 = qword_100326798;
        if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Opt-in not allowed: %{public}@", (uint8_t *)&buf, 0xCu);
        }
        if (v55)
        {
          id v30 = v30;
          BOOL v12 = 0;
          id *v55 = v30;
        }
        else
        {
          BOOL v12 = 0;
        }
        goto LABEL_44;
      }
    }
    v66[0] = @"cdp";
    uint64_t v38 = +[NSNumber numberWithUnsignedInteger:v28];
    v66[1] = @"newState";
    v67[0] = v38;
    id v39 = +[NSNumber numberWithUnsignedInteger:a3];
    v67[1] = v39;
    id v30 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];

    if (!v29)
    {
      v44 = +[TransparencyError errorWithDomain:kTransparencyErrorAccount code:-400 description:@"No CloudKit, can't opt out"];
      v47 = +[TransparencyAnalytics logger];
      [v47 logResultForEvent:kTransparencyAnalyticsEventOptIn hardFailure:1 result:v44 withAttributes:v30];

      BOOL v12 = [(KTSMManager *)self optOutWhenNotEligble:v10 error:v55];
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }
    uint64_t v40 = +[TransparencyAnalytics logger];
    uint64_t v41 = kTransparencyAnalyticsEventOptIn;
    [v40 logResultForEvent:kTransparencyAnalyticsEventOptIn hardFailure:0 result:0 withAttributes:v30];

    CFStringRef v42 = [[KTOptInWatcher alloc] initWithTargetState:a3];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    CFStringRef v43 = [(KTSMManager *)self stateMachineQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004B9A8;
    block[3] = &unk_1002BAA78;
    block[4] = self;
    id v58 = v10;
    p_long long buf = &buf;
    v44 = v42;
    v59 = v44;
    dispatch_sync(v43, block);

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      id v45 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-342 underlyingError:0 description:@"opt-in pending"];
      v46 = +[TransparencyAnalytics logger];
      [v46 logResultForEvent:v41 hardFailure:1 result:v45 withAttributes:v30];
    }
    else
    {
      [(KTSMManager *)self triggerOptInStateChange];
      v48 = [(KTOptInWatcher *)v44 targetResolved];
      BOOL v49 = [v48 wait:120000000000] == 0;

      if (v49)
      {
        v51 = [(KTOptInWatcher *)v44 error];

        if (!v51)
        {
          id v45 = 0;
          BOOL v12 = 1;
LABEL_37:
          if (v54)
          {
            id *v54 = [(KTOptInWatcher *)v44 loggableData];
          }
          +[TransparencyAnalytics logger];
          if (v51) {
            v52 = {;
          }
            [v52 logResultForEvent:v41 hardFailure:1 result:v45 withAttributes:v30];
          }
          else {
            v52 = {;
          }
            [v52 logResultForEvent:v41 hardFailure:0 result:0 withAttributes:v30];
          }

          _Block_object_dispose(&buf, 8);
          goto LABEL_43;
        }
        uint64_t v50 = [(KTOptInWatcher *)v44 error];
      }
      else
      {
        uint64_t v50 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-343 underlyingError:0 description:@"timeout setting opt-in"];
      }
      id v45 = (id)v50;
    }
    BOOL v12 = 0;
    LODWORD(v51) = v45 != 0;
    if (v55 && v45)
    {
      id v45 = v45;
      BOOL v12 = 0;
      id *v55 = v45;
      LODWORD(v51) = 1;
    }
    goto LABEL_37;
  }
  BOOL v12 = 0;
LABEL_45:

  return v12;
}

- (void)timeout:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002BAA98);
  }
  id v7 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting a timer to watch for IDS registration timeouts - timeout %llu", buf, 0xCu);
  }
  dispatch_semaphore_t v8 = [(KTSMManager *)self queue];
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  [(KTSMManager *)self setTimer:v9];

  id v10 = [(KTSMManager *)self timer];
  dispatch_semaphore_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_10004BCB4;
  id v18 = &unk_1002BA140;
  id v19 = self;
  id v20 = v6;
  id v11 = v6;
  dispatch_source_set_event_handler(v10, &v15);

  BOOL v12 = [(KTSMManager *)self timer];
  dispatch_time_t v13 = dispatch_time(0, a3);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

  CFStringRef v14 = [(KTSMManager *)self timer];
  dispatch_resume(v14);
}

- (void)waitForIDSRegistration:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate now];
  id v6 = [(KTSMManager *)self deps];
  id v7 = [v6 idsAccountTracker];
  [v7 setTimeOfLastUpsell:v5];

  BOOL v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  CFStringRef v14 = sub_10004BF2C;
  dispatch_semaphore_t v15 = &unk_1002B9FC0;
  uint64_t v16 = self;
  id v17 = v4;
  id v8 = v4;
  [(KTSMManager *)self _waitForIDSRegistration:&v12];
  dispatch_source_t v9 = [(KTSMManager *)self deps];
  id v10 = [v9 idsOperations];
  [v10 checkIDSTimeoutSeconds];
  [(KTSMManager *)self timeout:(unint64_t)(v11 * 1000000000.0) block:v8];
}

- (void)_waitForIDSRegistration:(id)a3
{
  id v4 = a3;
  id v5 = [(KTSMManager *)self queue];
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  [(KTSMManager *)self setCheckIDSTimer:v6];

  id v7 = [(KTSMManager *)self checkIDSTimer];
  CFStringRef v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10004C12C;
  id v17 = &unk_1002BA140;
  id v18 = self;
  id v19 = v4;
  id v8 = v4;
  dispatch_source_set_event_handler(v7, &v14);

  dispatch_source_t v9 = [(KTSMManager *)self checkIDSTimer];
  id v10 = [(KTSMManager *)self deps];
  double v11 = [v10 idsOperations];
  [v11 sleepTimeBetweenIDSCheckups];
  dispatch_source_set_timer(v9, 0, (unint64_t)(v12 * 1000000000.0), 0x2FAF080uLL);

  uint64_t v13 = [(KTSMManager *)self checkIDSTimer];
  dispatch_resume(v13);
}

- (void)checkIDSHealth:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CheckIDSRegistrationMonitor);
  id location = 0;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004C5C0;
  v16[3] = &unk_1002BAB28;
  objc_copyWeak(&v18, &location);
  dispatch_source_t v6 = v5;
  id v17 = v6;
  id v7 = +[KTStateTransitionGroupOperation named:@"check-ids-health" intending:@"Ready" errorState:@"Ready" withBlockTakingSelf:v16];
  CFStringRef v20 = @"Ready";
  id v8 = +[NSArray arrayWithObjects:&v20 count:1];
  dispatch_source_t v9 = +[NSSet setWithArray:v8];

  id v10 = [(KTSMManager *)self stateMachine];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004C698;
  v13[3] = &unk_1002BAB70;
  id v11 = v4;
  id v15 = v11;
  double v12 = v6;
  CFStringRef v14 = v12;
  [v10 doSimpleStateMachineRPC:@"check-ids" op:v7 sourceStates:v9 reply:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)checkKTAccountKey:(id)a3 complete:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  [(KTSMManager *)self idsServerReportKTKeyWrong:a3];
  dispatch_source_t v6 = [(KTSMManager *)self checkKTAccountKeyScheduler];
  [v6 trigger];

  v7[2](v7, 0);
}

- (void)refreshDeviceList:(id)a3
{
  id v10 = (void (**)(id, void, void *))a3;
  id v4 = [(KTSMManager *)self specificUser];
  id v5 = v4;
  if (v4 && ([v4 altDSID], dispatch_source_t v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = [(KTSMManager *)self deps];
    id v8 = [v7 idmsOperations];
    dispatch_source_t v9 = [v5 altDSID];
    [v8 refreshDeviceList:v9 complete:v10];
  }
  else
  {
    id v7 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-339 description:@"No specific user available yet"];
    v10[2](v10, 0, v7);
  }
}

- (void)clearIDSCacheForUri:(id)a3 application:(id)a4
{
  id v6 = a4;
  id v7 = +[TransparencyApplication stripApplicationPrefixForIdentifier:v6 uri:a3];
  id v8 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:v7];
  id v9 = objc_alloc_init((Class)IDSCacheClearRequestContext);
  id v17 = v8;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  [v9 setUris:v10];

  id v11 = +[TransparencyApplication idsServiceForIdentifier:v6];

  [v9 setService:v11];
  id v12 = objc_alloc_init((Class)IDSCacheClearRequest);
  id v16 = v9;
  uint64_t v13 = +[NSArray arrayWithObjects:&v16 count:1];
  [v12 setRequestContexts:v13];

  CFStringRef v14 = [(KTSMManager *)self deps];
  id v15 = [v14 idsOperations];
  [v15 cacheClearRequest:v12];
}

- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10003CBA0;
  v20[4] = sub_10003CBB0;
  id v21 = 0;
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002BAB90);
  }
  id v8 = (id)qword_100326798;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 requests];
    unsigned int v10 = [v9 count];
    *(_DWORD *)long long buf = 67109120;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Getting signature request: %d", buf, 8u);
  }
  [(KTSMManager *)self addEvent:@"GettingSignatureRequest"];
  id v11 = [(KTSMManager *)self signatureQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CE28;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_async(v11, block);

  id v12 = [(KTSMManager *)self deps];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004CE34;
  v15[3] = &unk_1002BACC8;
  id v18 = v20;
  void v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = v7;
  id v17 = v14;
  +[KTEnrollmentSignatureSupport updateClientData:v13 deps:v12 complete:v15];

  _Block_object_dispose(v20, 8);
}

- (void)transparencyDumpKTRegistrationData:(id)a3
{
  id v4 = a3;
  id v5 = [(KTSMManager *)self deps];
  id v6 = [v5 smDataStore];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004DBC4;
  v8[3] = &unk_1002B73B0;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchDeviceSignature:0 complete:v8];
}

- (void)transparencyClearKTRegistrationData:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(KTSMManager *)self deps];
  id v6 = [v5 smDataStore];
  id v8 = 0;
  [v6 clearDeviceSignatures:&v8];
  id v7 = v8;

  v4[2](v4, v7);
}

- (void)transparencyPerformRegistrationSignature:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004DD84;
  v4[3] = &unk_1002BAB70;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(KTSMManager *)v5 performRegistrationSignatures:v4];
}

- (void)transparencyCloudDevices:(id)a3
{
  id v9 = (void (**)(id, void *, void))a3;
  id v4 = [(KTSMManager *)self deps];
  id v5 = [v4 cloudRecords];

  if (v5)
  {
    id v6 = [(KTSMManager *)self deps];
    id v7 = [v6 cloudRecords];
    id v8 = [v7 cloudDevices];

    v9[2](v9, v8, 0);
  }
  else
  {
    v9[2](v9, 0, 0);
  }
}

- (void)setCloudKitOutgoingFlag
{
  id v5 = [[KTPendingFlag alloc] initWithFlag:@"CloudKitOutgoing" conditions:2 delayInSeconds:0.1];
  id v3 = [(KTSMManager *)self deps];
  id v4 = [v3 flagHandler];
  [v4 handlePendingFlag:v5];
}

- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id))a5;
  id v11 = [(KTSMManager *)self deps];
  id v12 = [v11 cloudRecords];

  if (v12)
  {
    id v13 = [(KTSMManager *)self deps];
    id v14 = [v13 cloudRecords];
    id v16 = 0;
    [v14 addDevice:v8 clientData:v9 error:&v16];
    id v15 = v16;

    [(KTSMManager *)self setCloudKitOutgoingFlag];
    v10[2](v10, v15);
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id))a5;
  id v11 = [(KTSMManager *)self deps];
  id v12 = [v11 cloudRecords];

  if (v12)
  {
    id v13 = [(KTSMManager *)self deps];
    id v14 = [v13 cloudRecords];
    id v16 = 0;
    [v14 removeDevice:v8 clientData:v9 error:&v16];
    id v15 = v16;

    [(KTSMManager *)self setCloudKitOutgoingFlag];
    v10[2](v10, v15);
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)getOptInStateForAccount:(id)a3 complete:(id)a4
{
  id v5 = (void (**)(id, void *, id))a4;
  id v6 = [(KTSMManager *)self deps];
  id v7 = [v6 cloudRecords];

  if (v7)
  {
    id v14 = 0;
    id v8 = [v7 getAllOptInStatesAndReturnError:&v14];
    id v9 = v14;
    if (v8)
    {
      unsigned int v10 = [[_TtC13transparencyd16KTOptIOValidator alloc] initWithOptInRecords:v8 uriToSMT:&__NSDictionary0__struct];
      id v13 = v9;
      id v11 = [(KTOptIOValidator *)v10 evaluateCloudDataWithApplication:@"IDS" error:&v13];
      id v12 = v13;

      v5[2](v5, v11, v12);
      id v9 = v12;
    }
    else
    {
      v5[2](v5, 0, v9);
    }
  }
  else
  {
    v5[2](v5, 0, 0);
  }
}

- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, void *, id))a5;
  id v11 = [(KTSMManager *)self deps];
  id v12 = [v11 cloudRecords];

  if (v12)
  {
    id v15 = 0;
    id v13 = [v12 getOptInStateWithUri:v8 application:v9 error:&v15];
    id v14 = v15;
    v10[2](v10, v13, v14);
  }
  else
  {
    v10[2](v10, 0, 0);
  }
}

- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(KTSMManager *)self deps];
  id v16 = [v15 cloudRecords];

  if (v16) {
    unsigned __int8 v17 = [v16 addOptInStateWithURI:v12 smtTimestamp:v13 application:v14 state:v8 error:a7];
  }
  else {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, id, id))a7;
  id v16 = [(KTSMManager *)self deps];
  unsigned __int8 v17 = [v16 cloudRecords];

  if (v17)
  {
    if (!v14)
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002BACE8);
      }
      id v18 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "using SMT timestamp now 'now', will lead to sadness", buf, 2u);
      }
      id v14 = +[NSDate date];
    }
    id v32 = v12;
    id v33 = v14;
    id v19 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v30 = 0;
    id v20 = [v17 setOptInStateWithURIs:v19 application:v13 state:v9 error:&v30];
    id v21 = v30;
    if (v20)
    {
      unint64_t v22 = [[KTPendingFlag alloc] initWithFlag:@"CloudKitOutgoing" conditions:2];
      unsigned int v23 = [(KTSMManager *)self deps];
      [v23 flagHandler];
      BOOL v29 = v19;
      double v24 = v15;
      uint64_t v25 = v17;
      id v26 = v13;
      v28 = id v27 = v12;
      [v28 handlePendingFlag:v22];

      id v12 = v27;
      id v13 = v26;
      unsigned __int8 v17 = v25;
      id v15 = v24;
      id v19 = v29;
    }
    v15[2](v15, v20, v21);
  }
  else
  {
    v15[2](v15, 0, 0);
  }
}

- (void)getAllOptInStates:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(KTSMManager *)self deps];
  id v6 = [v5 cloudRecords];

  if (v6)
  {
    id v9 = 0;
    id v7 = [v6 getAllOptInStatesAndReturnError:&v9];
    id v8 = v9;
    v4[2](v4, v7, v8);
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

- (void)getOptInStateForApplication:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = [(KTSMManager *)self deps];
  id v9 = [v8 cloudRecords];

  if (v9)
  {
    id v12 = 0;
    unsigned int v10 = [v9 getAggregateOptInStateForApplication:v6 error:&v12];
    id v11 = v12;
    v7[2](v7, v10, v11);
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id, id))a5;
  id v11 = [(KTSMManager *)self deps];
  id v12 = [v11 cloudRecords];

  if (v12)
  {
    id v15 = 0;
    id v13 = [v12 clearOptInStateForURI:v8 application:v9 error:&v15];
    id v14 = v15;
    v10[2](v10, v13, v14);
  }
  else
  {
    v10[2](v10, 0, 0);
  }
}

- (void)resetLocalCloudDataState
{
  id v7 = +[KTStateTransitionOperation named:@"cloud-data-reset" entering:@"ResetLocalCloudState"];
  id v3 = [(KTSMManager *)self stateMachine];
  id v4 = +[KTStates KTStateMap];
  id v5 = [v4 allKeys];
  id v6 = +[NSSet setWithArray:v5];
  [v3 doSimpleStateMachineRPC:@"cloud-data-reset" op:v7 sourceStates:v6 reply:&stru_1002BAD28];
}

- (void)uriNeedsUpdate:(id)a3 forApplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002BAD68);
  }
  id v7 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "uriNeedsUpdate: %@[%@]", (uint8_t *)&v8, 0x16u);
  }
}

- (void)inspectErrorForRetryAfter:(id)a3 trigger:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CKRetryAfterSecondsForError();
  if (v7 != 0.0)
  {
    double v8 = v7;
    unint64_t v9 = 1000000000 * (unint64_t)v7;
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BAD88);
    }
    __int16 v10 = (void *)qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = [v6 name];
      int v13 = 138412802;
      id v14 = v12;
      __int16 v15 = 2048;
      double v16 = v8;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CK operation failed, scheduling %@ delay for %.1f seconds: %@", (uint8_t *)&v13, 0x20u);
    }
    [v6 waitUntil:v9];
  }
}

- (BOOL)isKTDisabled
{
  id v2 = [(KTSMManager *)self deps];
  id v3 = [v2 idsConfigBag];
  unsigned __int8 v4 = [v3 ktDisable];

  return v4;
}

- (void)idsServerBagUpdate
{
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002BADA8);
  }
  id v3 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "IDS server bag update", buf, 2u);
  }
  if (_os_feature_enabled_impl())
  {
    unsigned __int8 v4 = +[KTStateTransitionOperation named:@"ids-server-bag-update" entering:@"Initializing"];
    id v5 = [(KTSMManager *)self stateMachine];
    id v6 = +[KTStates KTStateMap];
    double v7 = [v6 allKeys];
    double v8 = +[NSSet setWithArray:v7];
    [v5 doSimpleStateMachineRPC:@"ids-server-bag-update" op:v4 sourceStates:v8 reply:&stru_1002BADC8];
  }
  else
  {
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BAE08);
    }
    unint64_t v9 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "An IDS server bag update happened but 'KTEnableKillSwitch' feature flag is not enabled", v10, 2u);
    }
  }
}

- (void)triggerCheckCKKSOctagonEligibility
{
  id v3 = [(KTSMManager *)self deps];
  unsigned __int8 v4 = [v3 octagonOperations];
  unsigned __int8 v5 = [v4 ckksViewReady:@"Manatee" error:0];

  if ((v5 & 1) == 0) {
    [(KTSMManager *)self storeEligiblilitySuccess:@"ckks"];
  }
  id v6 = [(KTSMManager *)self deps];
  double v7 = [v6 octagonOperations];
  unsigned __int8 v8 = [v7 getCachedOctagonStatus];

  if (v8)
  {
    [(KTSMManager *)self storeEligiblilitySuccess:@"octagon"];
  }
  else
  {
    id v9 = +[TransparencyError errorWithDomain:kTransparencyErrorEligibility code:-395 description:@"octagon status is pending or untrusted"];
    [(KTSMManager *)self storeEligiblilityFailure:@"octagon" error:v9];
  }
}

- (void)storeEligiblilitySuccess:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    unsigned __int8 v5 = [(KTSMManager *)self statusReporting];

    if (v5)
    {
      id v6 = +[KTEligibilityStatusResult statusResultWithSuccessWithElement:v4];
      double v7 = [(KTSMManager *)self statusReporting];
      [v7 storeWithStatus:v6 completionHandler:&stru_1002BAE68];
    }
    else
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002BAE28);
      }
      unsigned __int8 v8 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Did not store eligiblity result, status reporting object is nil", v9, 2u);
      }
    }
  }
}

- (void)storeEligiblilityFailure:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    unsigned __int8 v8 = [(KTSMManager *)self statusReporting];

    if (v8)
    {
      id v9 = +[KTEligibilityStatusResult statusResultWithFailureWithElement:v6 error:v7];
      __int16 v10 = [(KTSMManager *)self statusReporting];
      [v10 storeWithStatus:v9 completionHandler:&stru_1002BAEC8];
    }
    else
    {
      if (qword_100326790 != -1) {
        dispatch_once(&qword_100326790, &stru_1002BAEA8);
      }
      id v11 = qword_100326798;
      if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Did not store eligiblity result, status reporting object is nil", v12, 2u);
      }
    }
  }
}

- (void)triggerMaybeReportEligibilityWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BAF08);
    }
    id v7 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "KTEligibilityServerReporting feature not enabled", buf, 2u);
    }
    CFStringRef v8 = @"transparencyd.KTEligibilityError";
    CFStringRef v9 = @"Feature flag not enabled";
    uint64_t v10 = 9;
    goto LABEL_10;
  }
  unsigned __int8 v5 = [(KTSMManager *)self statusReporting];

  if (!v5)
  {
    CFStringRef v8 = (const __CFString *)kTransparencyErrorInternal;
    CFStringRef v9 = @"State Machine not initialized yet, can't run eligibility commands";
    uint64_t v10 = -367;
LABEL_10:
    id v11 = +[TransparencyError errorWithDomain:v8 code:v10 description:v9];
    v4[2](v4, 0, v11);

    goto LABEL_11;
  }
  id v6 = [(KTSMManager *)self statusReporting];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004FA38;
  v12[3] = &unk_1002BB000;
  v12[4] = self;
  int v13 = v4;
  [v6 cachedTimeOfLastReportWithCompletionHandler:v12];

LABEL_11:
}

- (void)updateIDSRecommendation:(BOOL)a3 complete:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    CFStringRef v9 = +[TransparencyError errorWithDomain:kTransparencyErrorEligibility code:9 description:@"KTEligibilityServerReporting feature not enabled"];
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BB020);
    }
    uint64_t v10 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "KTEligibilityServerReporting feature not enabled", buf, 2u);
    }
    goto LABEL_9;
  }
  id v7 = [(KTSMManager *)self statusReporting];

  if (!v7)
  {
    CFStringRef v9 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-367 description:@"State Machine not initialized yet, can't run eligibility commands"];
LABEL_9:
    v6[2](v6, v9);

    goto LABEL_10;
  }
  CFStringRef v8 = [(KTSMManager *)self statusReporting];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _DWORD v11[2] = sub_100050248;
  v11[3] = &unk_1002BB048;
  id v12 = v6;
  [v8 setLastIDSRecWithRecommendation:v4 completionHandler:v11];

LABEL_10:
}

- (void)setOSUpdate:(BOOL)a3 complete:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(KTSMManager *)self statusReporting];

  if (v7)
  {
    CFStringRef v8 = [(KTSMManager *)self statusReporting];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100050374;
    v10[3] = &unk_1002BB048;
    id v11 = v6;
    [v8 setHasDoneOSUpdateWithValue:v4 completionHandler:v10];
  }
  else
  {
    CFStringRef v9 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-367 description:@"State Machine not initialized yet, can't run eligibility commands"];
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
  }
}

- (void)clearEligibilityOverrides:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(KTSMManager *)self statusReporting];

  if (v5)
  {
    id v6 = [(KTSMManager *)self statusReporting];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100050498;
    v8[3] = &unk_1002BB048;
    id v9 = v4;
    [v6 clearEligibilityOverridesWithCompletionHandler:v8];
  }
  else
  {
    id v7 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-367 description:@"State Machine not initialized yet, can't run eligibility commands"];
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

- (void)setOverrideTimeBetweenReports:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(KTSMManager *)self statusReporting];

  if (v7)
  {
    CFStringRef v8 = [(KTSMManager *)self statusReporting];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000505CC;
    v10[3] = &unk_1002BB048;
    id v11 = v6;
    [v8 setOverrideTimeBetweenReportsWithValue:v10 completionHandler:a3];
  }
  else
  {
    id v9 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-367 description:@"State Machine not initialized yet, can't run eligibility commands"];
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
  }
}

- (void)reportEligibility:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v11 = +[TransparencyError errorWithDomain:kTransparencyErrorEligibility code:9 description:@"KTEligibilityServerReporting feature not enabled"];
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BB068);
    }
    id v12 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "KTEligibilityServerReporting feature not enabled", (uint8_t *)location, 2u);
    }
    goto LABEL_9;
  }
  CFStringRef v8 = [(KTSMManager *)self statusReporting];

  if (!v8)
  {
    id v11 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-367 description:@"State Machine not initialized yet, can't run eligibility commands"];
LABEL_9:
    v7[2](v7, 0, v11);

    goto LABEL_10;
  }
  location[0] = 0;
  objc_initWeak(location, self);
  id v9 = [(KTSMManager *)self statusReporting];
  id v10 = [v6 BOOLValue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100050864;
  v13[3] = &unk_1002BB0D8;
  objc_copyWeak(&v15, location);
  id v14 = v7;
  [v9 setOverrideReportValueWithReportValue:v10 completionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
LABEL_10:
}

- (void)getAggregateResult:(int64_t)a3 element:(id)a4 complete:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v12 = +[TransparencyError errorWithDomain:kTransparencyErrorEligibility code:9 description:@"KTEligibilityMetrics feature not enabled"];
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BB0F8);
    }
    int v13 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "KTEligibilityMetrics feature not enabled", buf, 2u);
    }
    goto LABEL_9;
  }
  id v10 = [(KTSMManager *)self statusReporting];

  if (!v10)
  {
    id v12 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-367 description:@"State Machine not initialized yet, can't run eligibility commands"];
LABEL_9:
    v9[2](v9, 0, v12);

    goto LABEL_10;
  }
  id v11 = [(KTSMManager *)self statusReporting];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100050BB8;
  v14[3] = &unk_1002BB120;
  id v15 = v9;
  [v11 aggregateResultWithSamples:a3 element:v8 completionHandler:v14];

LABEL_10:
}

- (void)insertResultForElement:(id)a3 samplesAgo:(id)a4 success:(BOOL)a5 complete:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (_os_feature_enabled_impl())
  {
    int v13 = [(KTSMManager *)self statusReporting];

    if (v13)
    {
      if ([v11 count] == (id)1)
      {
        id v14 = [(KTSMManager *)self statusReporting];
        id v15 = [v11 objectAtIndexedSubscript:0];
        uint64_t v16 = (int)[v15 intValue];
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10005116C;
        v45[3] = &unk_1002B9CA0;
        id v46 = v12;
        [v14 insertResultWithElement:v10 samplesAgo:v16 success:v7 completionHandler:v45];

        goto LABEL_21;
      }
      if ([v11 count] == (id)2)
      {
        id v21 = [v11 objectAtIndexedSubscript:0];
        long long v31 = [v11 objectAtIndexedSubscript:1];
        if (objc_msgSend(v21, "compare:") == (id)1)
        {
          unint64_t v22 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-399 description:@"Invalid sample range"];
          unsigned int v23 = +[SecXPCHelper cleanseErrorForXPC:v22];
          (*((void (**)(id, void *))v12 + 2))(v12, v23);
        }
        else
        {
          id v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          dispatch_queue_t v27 = dispatch_queue_create("com.apple.transparency.eligibilityCLIQueue", v26);

          *(void *)long long buf = 0;
          uint64_t v40 = buf;
          uint64_t v41 = 0x3032000000;
          CFStringRef v42 = sub_10003CBA0;
          CFStringRef v43 = sub_10003CBB0;
          id v44 = 0;
          unint64_t v28 = dispatch_group_create();
          for (uint64_t i = (int)[v21 intValue]; i <= (int)[v31 intValue]; ++i)
          {
            dispatch_group_enter(v28);
            id v30 = [(KTSMManager *)self statusReporting];
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            void v35[2] = sub_1000511D4;
            v35[3] = &unk_1002BB168;
            v36 = v27;
            uint64_t v38 = buf;
            v37 = v28;
            [v30 insertResultWithElement:v10 samplesAgo:i success:v7 completionHandler:v35];
          }
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000512E8;
          block[3] = &unk_1002BB190;
          id v33 = v12;
          v34 = buf;
          dispatch_group_notify(v28, v27, block);

          _Block_object_dispose(buf, 8);
        }

        goto LABEL_21;
      }
      uint64_t v18 = kTransparencyErrorInternal;
      CFStringRef v19 = @"Invalid sample range";
      uint64_t v20 = -399;
    }
    else
    {
      uint64_t v18 = kTransparencyErrorInternal;
      CFStringRef v19 = @"State Machine not initialized yet, can't run eligibility commands";
      uint64_t v20 = -367;
    }
    double v24 = +[TransparencyError errorWithDomain:v18 code:v20 description:v19];
    uint64_t v25 = +[SecXPCHelper cleanseErrorForXPC:v24];
    (*((void (**)(id, void *))v12 + 2))(v12, v25);

    goto LABEL_21;
  }
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002BB140);
  }
  __int16 v17 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "KTEligibilityMetrics feature not enabled", buf, 2u);
  }
  (*((void (**)(id, void))v12 + 2))(v12, 0);
LABEL_21:
}

- (void)triggerIDSServerBagNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:IDSServerBagFinishedLoadingNotification object:self];
}

- (void)triggerCloudKitStaticKeyRemoteUpdateNotification
{
  id v5 = +[NSNotificationCenter defaultCenter];
  id v3 = [(KTSMManager *)self deps];
  id v4 = [v3 staticKeyStore];
  [v5 postNotificationName:NSPersistentStoreRemoteChangeNotification object:v4];
}

- (void)xpc24HrNotification:(id)a3
{
  id v4 = +[NSDate date];
  [(KTSMManager *)self triggerIDMSFetchBackstop:v4];

  [(KTSMManager *)self triggerKTAccountKeySignature:10.0];
  [(KTSMManager *)self triggerCheckIDSRegistration];
  [(KTSMManager *)self triggerCheckExpiredPublicKeyStores];
  [(KTSMManager *)self triggerCKFetch24h];

  [(KTSMManager *)self triggerMaybeReportEligibilityWithCompletion:&stru_1002BB1B0];
}

- (BOOL)shouldPokeIDSUponSigning
{
  return self->shouldPokeIDSUponSigning;
}

- (void)setShouldPokeIDSUponSigning:(BOOL)a3
{
  self->shouldPokeIDSUponSigning = a3;
}

- (KTCondition)signaturesComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSignaturesComplete:(id)a3
{
}

- (OS_dispatch_queue)signatureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSignatureQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (KTSpecificUser)specificUser
{
  return (KTSpecificUser *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSpecificUser:(id)a3
{
}

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeps:(id)a3
{
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStateMachineQueue:(id)a3
{
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPcsOperation:(id)a3
{
}

- (KTNearFutureScheduler)checkIDSRegistration
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCheckIDSRegistration:(id)a3
{
}

- (KTNearFutureScheduler)pokeIDS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPokeIDS:(id)a3
{
}

- (KTCondition)successfulIDSRegistrationCheck
{
  return (KTCondition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSuccessfulIDSRegistrationCheck:(id)a3
{
}

- (BOOL)idsServerReportedWrong
{
  return self->_idsServerReportedWrong;
}

- (void)setIdsServerReportedWrong:(BOOL)a3
{
  self->_idsServerReportedWrong = a3;
}

- (NSData)idsServerReportedWrongPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIdsServerReportedWrongPublicKey:(id)a3
{
}

- (KTNearFutureScheduler)manateeViewChangedScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 120, 1);
}

- (void)setManateeViewChangedScheduler:(id)a3
{
}

- (KTFetchIDMSOperation)lastFetchIDMS
{
  return (KTFetchIDMSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastFetchIDMS:(id)a3
{
}

- (KTSignalIDSOperation)lastSignalIDS
{
  return (KTSignalIDSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastSignalIDS:(id)a3
{
}

- (KTFetchIDSSelfOperation)lastFetchIDSSelf
{
  return (KTFetchIDSSelfOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastFetchIDSSelf:(id)a3
{
}

- (KTFetchKTSelfOperation)lastFetchKTSelf
{
  return (KTFetchKTSelfOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastFetchKTSelf:(id)a3
{
}

- (KTValidateSelfOperation)lastValidateSelf
{
  return (KTValidateSelfOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastValidateSelf:(id)a3
{
}

- (KTValidateSelfOperation)lastValidateSelfOptIn
{
  return (KTValidateSelfOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastValidateSelfOptIn:(id)a3
{
}

- (KTEnrollmentRegistrationSignature)lastRegistration
{
  return (KTEnrollmentRegistrationSignature *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastRegistration:(id)a3
{
}

- (KTForceSyncKVSOperation)lastForceSyncKVS
{
  return (KTForceSyncKVSOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastForceSyncKVS:(id)a3
{
}

- (NSOperation)lastCKFetch
{
  return (NSOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastCKFetch:(id)a3
{
}

- (KTPublicKeyStoreRefresh)lastPublicKeyRefresh
{
  return (KTPublicKeyStoreRefresh *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastPublicKeyRefresh:(id)a3
{
}

- (KTCheckIDSRegistrationOperation)lastCheckIDSRegistration
{
  return (KTCheckIDSRegistrationOperation *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastCheckIDSRegistration:(id)a3
{
}

- (KTBackgroundSystemValidationOperation)lastDutyCycle
{
  return (KTBackgroundSystemValidationOperation *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLastDutyCycle:(id)a3
{
}

- (KTNearFutureScheduler)ckFetchScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 224, 1);
}

- (void)setCkFetchScheduler:(id)a3
{
}

- (KTNearFutureScheduler)serverOptInScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 232, 1);
}

- (void)setServerOptInScheduler:(id)a3
{
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)statusReporting
{
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)objc_getProperty(self, a2, 240, 1);
}

- (void)setStatusReporting:(id)a3
{
}

- (KTCondition)pendingValidationsComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPendingValidationsComplete:(id)a3
{
}

- (OS_dispatch_queue)metricsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setMetricsQueue:(id)a3
{
}

- (CKAccountInfo)cloudKitAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 264, 1);
}

- (void)setCloudKitAccountInfo:(id)a3
{
}

- (NSDate)lastPush
{
  return (NSDate *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLastPush:(id)a3
{
}

- (os_unfair_lock_s)metricsLock
{
  return self->_metricsLock;
}

- (void)setMetricsLock:(os_unfair_lock_s)a3
{
  self->_metricsLock = a3;
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 280, 1);
}

- (void)setOptInStates:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 288, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)checkIDSTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 304, 1);
}

- (void)setCheckIDSTimer:(id)a3
{
}

- (NSMutableDictionary)selfVerificationInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 312, 1);
}

- (void)setSelfVerificationInfo:(id)a3
{
}

- (KTSMSelfValidationResult)selfValidationResult
{
  return (KTSMSelfValidationResult *)objc_getProperty(self, a2, 320, 1);
}

- (void)setSelfValidationResult:(id)a3
{
}

- (KTNearFutureScheduler)publicKeyFetcher
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 328, 1);
}

- (void)setPublicKeyFetcher:(id)a3
{
}

- (KTNearFutureScheduler)retryEnsureIdentity
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRetryEnsureIdentity:(id)a3
{
}

- (KTNearFutureScheduler)retryGetPrimaryAccount
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 344, 1);
}

- (void)setRetryGetPrimaryAccount:(id)a3
{
}

- (KTNearFutureScheduler)checkKTAccountKeyScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 352, 1);
}

- (void)setCheckKTAccountKeyScheduler:(id)a3
{
}

- (KTNearFutureScheduler)checkKTSignatureScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 360, 1);
}

- (void)setCheckKTSignatureScheduler:(id)a3
{
}

- (KTNearFutureScheduler)retryPendingValidations
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 368, 1);
}

- (void)setRetryPendingValidations:(id)a3
{
}

- (int)manateeViewToken
{
  return self->_manateeViewToken;
}

- (void)setManateeViewToken:(int)a3
{
  self->_int manateeViewToken = a3;
}

- (KTFetchCloudOperation)currentCKFetch
{
  return (KTFetchCloudOperation *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCurrentCKFetch:(id)a3
{
}

- (BOOL)newCKRequests
{
  return self->_newCKRequests;
}

- (void)setNewCKRequests:(BOOL)a3
{
  self->_newCKRequests = a3;
}

- (NSMutableSet)ckFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCkFetchReasons:(id)a3
{
}

- (KTZoneFetchDependencyOperation)successfulCKFetchDependency
{
  return (KTZoneFetchDependencyOperation *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSuccessfulCKFetchDependency:(id)a3
{
}

- (NSMutableSet)inflightCKFetchDependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 400, 1);
}

- (void)setInflightCKFetchDependencies:(id)a3
{
}

- (KTFetchServerOptInStatus)currentServerOptInFetch
{
  return (KTFetchServerOptInStatus *)objc_getProperty(self, a2, 408, 1);
}

- (void)setCurrentServerOptInFetch:(id)a3
{
}

- (NSMutableSet)serverOptInFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 416, 1);
}

- (void)setServerOptInFetchReasons:(id)a3
{
}

- (KTCondition)initializedComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 424, 1);
}

- (void)setInitializedComplete:(id)a3
{
}

- (KTCondition)readyComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 432, 1);
}

- (void)setReadyComplete:(id)a3
{
}

- (SecLaunchSequence)launch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLaunch:(id)a3
{
}

- (_TtC13transparencyd10KTWatchdog)watchdog
{
  return (_TtC13transparencyd10KTWatchdog *)objc_getProperty(self, a2, 448, 1);
}

- (void)setWatchdog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_readyComplete, 0);
  objc_storeStrong((id *)&self->_initializedComplete, 0);
  objc_storeStrong((id *)&self->_serverOptInFetchReasons, 0);
  objc_storeStrong((id *)&self->_currentServerOptInFetch, 0);
  objc_storeStrong((id *)&self->_inflightCKFetchDependencies, 0);
  objc_storeStrong((id *)&self->_successfulCKFetchDependency, 0);
  objc_storeStrong((id *)&self->_ckFetchReasons, 0);
  objc_storeStrong((id *)&self->_currentCKFetch, 0);
  objc_storeStrong((id *)&self->_retryPendingValidations, 0);
  objc_storeStrong((id *)&self->_checkKTSignatureScheduler, 0);
  objc_storeStrong((id *)&self->_checkKTAccountKeyScheduler, 0);
  objc_storeStrong((id *)&self->_retryGetPrimaryAccount, 0);
  objc_storeStrong((id *)&self->_retryEnsureIdentity, 0);
  objc_storeStrong((id *)&self->_publicKeyFetcher, 0);
  objc_storeStrong((id *)&self->_selfValidationResult, 0);
  objc_storeStrong((id *)&self->_selfVerificationInfo, 0);
  objc_storeStrong((id *)&self->_checkIDSTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_optInStates, 0);
  objc_storeStrong((id *)&self->_lastPush, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountInfo, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_pendingValidationsComplete, 0);
  objc_storeStrong((id *)&self->_statusReporting, 0);
  objc_storeStrong((id *)&self->_serverOptInScheduler, 0);
  objc_storeStrong((id *)&self->_ckFetchScheduler, 0);
  objc_storeStrong((id *)&self->_lastDutyCycle, 0);
  objc_storeStrong((id *)&self->_lastCheckIDSRegistration, 0);
  objc_storeStrong((id *)&self->_lastPublicKeyRefresh, 0);
  objc_storeStrong((id *)&self->_lastCKFetch, 0);
  objc_storeStrong((id *)&self->_lastForceSyncKVS, 0);
  objc_storeStrong((id *)&self->_lastRegistration, 0);
  objc_storeStrong((id *)&self->_lastValidateSelfOptIn, 0);
  objc_storeStrong((id *)&self->_lastValidateSelf, 0);
  objc_storeStrong((id *)&self->_lastFetchKTSelf, 0);
  objc_storeStrong((id *)&self->_lastFetchIDSSelf, 0);
  objc_storeStrong((id *)&self->_lastSignalIDS, 0);
  objc_storeStrong((id *)&self->_lastFetchIDMS, 0);
  objc_storeStrong((id *)&self->_manateeViewChangedScheduler, 0);
  objc_storeStrong((id *)&self->_idsServerReportedWrongPublicKey, 0);
  objc_storeStrong((id *)&self->_successfulIDSRegistrationCheck, 0);
  objc_storeStrong((id *)&self->_pokeIDS, 0);
  objc_storeStrong((id *)&self->_checkIDSRegistration, 0);
  objc_storeStrong((id *)&self->_pcsOperation, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_specificUser, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->signatureQueue, 0);

  objc_storeStrong((id *)&self->signaturesComplete, 0);
}

@end