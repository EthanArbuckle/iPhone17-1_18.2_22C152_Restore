@interface SMReceiverCacheManager
+ (id)receiverEventToString:(int64_t)a3;
- (BOOL)acceptShareInvitationInProgress;
- (BOOL)receiverContactStoreInProgress;
- (BOOL)receiverContactStored;
- (BOOL)receiverContactUpdatePending;
- (BOOL)safetyCacheFetchPending;
- (BOOL)shouldRetryCacheDownloadForError:(id)a3;
- (BOOL)shouldRetryZoneShareAcceptanceForError:(id)a3;
- (CKContainer)container;
- (NSUUID)sessionID;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTXPCTimerAlarm)cacheDownloadTimeoutTimerAlarm;
- (RTXPCTimerAlarm)cachePersistenceTimerAlarm;
- (RTXPCTimerAlarm)missingKeyReleaseTimerAlarm;
- (SMCache)phoneCache;
- (SMCache)watchCache;
- (SMCloudKitFunction)cloudKitFunction;
- (SMMessagingService)messagingService;
- (SMReceiverCacheManager)initWithReceiverContact:(id)a3 safetyCacheStore:(id)a4 defaultsManager:(id)a5 queue:(id)a6 messagingService:(id)a7;
- (SMReceiverCacheManager)initWithSessionID:(id)a3 initiatorHandle:(id)a4 safetyCacheStore:(id)a5 defaultsManager:(id)a6 queue:(id)a7 messagingService:(id)a8;
- (SMReceiverCacheManagerDelegateProtocol)delegate;
- (SMReceiverContact)receiverContact;
- (SMReceiverSessionStatus)sessionStatus;
- (SMSafetyCacheStore)safetyCacheStore;
- (double)cachePersistenceTime;
- (id)computeReceiverSessionMetrics;
- (id)getCachePersistenceAlarmDate;
- (int64_t)cacheDownloadRetryCount;
- (int64_t)normalizedSMErrorForCacheDownloadError:(id)a3;
- (int64_t)zoneShareRetryCount;
- (void)_setupCloudKitFunction;
- (void)acceptShareInvitation:(int64_t)a3;
- (void)cachePersistenceStartTimer;
- (void)cachePersistenceStopTimer;
- (void)computeResponseModality:(id)a3 completionHandler:(id)a4;
- (void)copyKeyReleaseMessageParameters:(id)a3;
- (void)copySessionStartMessageParameters:(id)a3;
- (void)decryptAndStoreSafetyCacheDataWithPhoneCacheData:(id)a3 watchCacheData:(id)a4 userInitiatedDownload:(BOOL)a5 metricsDict:(id *)a6;
- (void)deleteReceiverContactFromStore:(unint64_t)a3;
- (void)fetchSafetyCacheData:(int64_t)a3;
- (void)onCacheDownloadResult:(BOOL)a3 userInitiatedDownload:(BOOL)a4 withError:(id)a5;
- (void)onCachePersistenceExpiry;
- (void)onCacheUpdatedMessageReceived:(id)a3;
- (void)onEstimatedEndTimeUpdateMessageReceived:(id)a3;
- (void)onKeyReleaseInfoMessageReceived:(id)a3;
- (void)onKeyReleaseMessageReceived:(id)a3;
- (void)onLowPowerModeWarningStateUpdateMessageReceived:(id)a3;
- (void)onSessionEndMessageReceived:(id)a3;
- (void)onSessionStartInfoMessageReceived:(id)a3;
- (void)onSessionStartMessageReceived:(id)a3;
- (void)onSessionStatusLoadedFromDisk;
- (void)onShareInvitationAcceptenceResult:(BOOL)a3 withError:(id)a4;
- (void)onUserCacheDownloadRequest;
- (void)onViewingSessionDetails;
- (void)requestMissingKeyReleaseInfo;
- (void)setAcceptShareInvitationInProgress:(BOOL)a3;
- (void)setCacheDownloadRetryCount:(int64_t)a3;
- (void)setCacheDownloadTimeoutTimerAlarm:(id)a3;
- (void)setCachePersistenceTimerAlarm:(id)a3;
- (void)setCloudKitFunction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMissingKeyReleaseTimerAlarm:(id)a3;
- (void)setReceiverContact:(id)a3;
- (void)setReceiverContactStoreInProgress:(BOOL)a3;
- (void)setReceiverContactStored:(BOOL)a3;
- (void)setReceiverContactUpdatePending:(BOOL)a3;
- (void)setSafetyCacheFetchPending:(BOOL)a3;
- (void)setSessionStatus:(id)a3;
- (void)setZoneShareRetryCount:(int64_t)a3;
- (void)startCacheDownloadTimeoutTimer;
- (void)startMissingKeyReleaseTimer;
- (void)stopCacheDownloadTimeoutTimer;
- (void)stopMissingKeyReleaseTimer;
- (void)storeReceiverContactInStore:(unint64_t)a3;
- (void)transitionFromActiveToCleanupDueToEvent:(int64_t)a3;
- (void)transitionFromActiveToMissingKeyReleaseInfoDueToEvent:(int64_t)a3;
- (void)transitionFromActiveToTriggeredDueToEvent:(int64_t)a3;
- (void)transitionFromCacheDownloadFailedToCachePersistenceDueToEvent:(int64_t)a3;
- (void)transitionFromCacheDownloadFailedToCacheReleasedDueToEvent:(int64_t)a3;
- (void)transitionFromCacheDownloadFailedToCleanupDueToEvent:(int64_t)a3;
- (void)transitionFromCachePersistenceToCleanupDueToEvent:(int64_t)a3;
- (void)transitionFromCacheReleasedToCacheDownloadFailedDueToEvent:(int64_t)a3;
- (void)transitionFromCacheReleasedToCachePersistenceDueToEvent:(int64_t)a3;
- (void)transitionFromCacheReleasedToCleanupDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToActiveDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToCacheDownloadFailedDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToCachePersistenceDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToCacheReleasedDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToCleanupDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToMissingSessionInfoDueToEvent:(int64_t)a3;
- (void)transitionFromInitializingToTriggeredDueToEvent:(int64_t)a3;
- (void)transitionFromMissingKeyReleaseInfoToCleanupDueToEvent:(int64_t)a3;
- (void)transitionFromMissingKeyReleaseInfoToTriggeredDueToEvent:(int64_t)a3;
- (void)transitionFromMissingSessionInfoToCleanupDueToEvent:(int64_t)a3;
- (void)transitionFromMissingSessionInfoToTriggeredDueToEvent:(int64_t)a3;
- (void)transitionFromTriggeredToCacheReleasedDueToEvent:(int64_t)a3;
- (void)transitionFromTriggeredToCleanupDueToEvent:(int64_t)a3;
- (void)transitionToState:(int64_t)a3 event:(int64_t)a4;
- (void)updateReceiverContactInStore;
@end

@implementation SMReceiverCacheManager

- (SMReceiverCacheManager)initWithSessionID:(id)a3 initiatorHandle:(id)a4 safetyCacheStore:(id)a5 defaultsManager:(id)a6 queue:(id)a7 messagingService:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v32 = 0;
    v26 = "Invalid parameter not satisfying: sessionID";
    v27 = (uint8_t *)&v32;
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_15;
  }
  if (!v15)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v31 = 0;
    v26 = "Invalid parameter not satisfying: initiatorHandle";
    v27 = (uint8_t *)&v31;
    goto LABEL_14;
  }
  if (!v16)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v30 = 0;
    v26 = "Invalid parameter not satisfying: safetyCacheStore";
    v27 = (uint8_t *)&v30;
    goto LABEL_14;
  }
  if (!v18)
  {
    v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: queue";
      v27 = buf;
      goto LABEL_14;
    }
LABEL_15:

    v24 = 0;
    goto LABEL_16;
  }
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F998F8]) initWithIdentifier:0 sessionID:v14 initiatorHandle:v15];
  [v20 setSessionState:1];
  id v21 = objc_alloc(MEMORY[0x1E4F998E8]);
  v22 = objc_opt_new();
  v23 = objc_msgSend(v21, "initWithIdentifier:syncDate:phoneCache:watchCache:sessionStatus:allowReadToken:safetyCacheKey:shareURL:participantID:sharingInvitationData:numCacheDownloads:numSuccessfulCacheDownloads:maxPhoneCacheSize:maxWatchCacheSize:maxLocationsInPhoneCacheTrace:maxLocationsInWatchCacheTrace:timeTillCacheRelease:timeTillFirstSuccessfulCacheDownload:sessionID:firstDetailViewSessionState:lastDetailViewSessionState:phoneMaxWorkoutEvents:watchMaxWorkoutEvents:", v22, 0, 0, 0, v20, 0, 0.0, -1.0, 0, 0, 0, 0, 0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v14,
                  0,
                  0,
                  0,
                  0);

  self = [(SMReceiverCacheManager *)self initWithReceiverContact:v23 safetyCacheStore:v16 defaultsManager:v17 queue:v18 messagingService:v19];
  v24 = self;
LABEL_16:

  return v24;
}

- (SMReceiverCacheManager)initWithReceiverContact:(id)a3 safetyCacheStore:(id)a4 defaultsManager:(id)a5 queue:(id)a6 messagingService:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    id v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v20 = 0;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: receiverContact";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_10;
  }
  if (!v14)
  {
    id v21 = v17;
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: safetyCacheStore";
    goto LABEL_17;
  }
  id v26 = v17;
  if (v16)
  {
    v27.receiver = self;
    v27.super_class = (Class)SMReceiverCacheManager;
    id v18 = [(SMReceiverCacheManager *)&v27 init];
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_receiverContact, a3);
      objc_storeStrong(p_isa + 8, a4);
      objc_storeStrong(p_isa + 9, a5);
      objc_storeStrong(p_isa + 10, a6);
      [p_isa _setupCloudKitFunction];
      objc_storeStrong(p_isa + 14, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v20 = 0;
  }
  id v21 = v26;
LABEL_15:

  return v20;
}

- (NSUUID)sessionID
{
  v2 = [(SMReceiverCacheManager *)self receiverContact];
  v3 = [v2 sessionUUID];

  return (NSUUID *)v3;
}

- (SMReceiverSessionStatus)sessionStatus
{
  v2 = [(SMReceiverCacheManager *)self receiverContact];
  v3 = [v2 sessionStatus];

  return (SMReceiverSessionStatus *)v3;
}

- (SMCache)phoneCache
{
  v2 = [(SMReceiverCacheManager *)self receiverContact];
  v3 = [v2 phoneCache];

  return (SMCache *)v3;
}

- (SMCache)watchCache
{
  v2 = [(SMReceiverCacheManager *)self receiverContact];
  v3 = [v2 watchCache];

  return (SMCache *)v3;
}

- (void)onSessionStatusLoadedFromDisk
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [(SMReceiverCacheManager *)self setReceiverContactStored:1];
  v4 = [(SMReceiverCacheManager *)self receiverContact];
  v5 = [v4 sessionStatus];
  v6 = [v5 sessionStartDate];
  [v6 timeIntervalSinceNow];
  if (fabs(v7) > 604800.0)
  {
    v8 = [(SMReceiverCacheManager *)self receiverContact];
    v9 = [v8 sessionStatus];
    uint64_t v10 = [v9 sessionState];

    if (v10 == 5) {
      goto LABEL_15;
    }
    v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = [(SMReceiverCacheManager *)self sessionID];
      __int16 v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      v34 = NSStringFromSelector(a2);
      int v48 = 138412802;
      v49 = v31;
      __int16 v50 = 2112;
      v51 = v33;
      __int16 v52 = 2112;
      v53 = v34;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,forcefully cleanup lingering session", (uint8_t *)&v48, 0x20u);
    }
    v12 = [(SMReceiverCacheManager *)self receiverContact];
    id v13 = [v12 sessionStatus];
    if ([v13 sessionState] == 4)
    {
      id v14 = [(SMReceiverCacheManager *)self receiverContact];
      id v15 = [v14 phoneCache];
      if (v15)
      {

LABEL_12:
        v4 = [(SMReceiverCacheManager *)self receiverContact];
        id v16 = [v4 sessionStatus];
        v5 = v16;
        uint64_t v17 = 5;
        goto LABEL_13;
      }
      id v18 = [(SMReceiverCacheManager *)self receiverContact];
      id v19 = [v18 watchCache];

      if (v19) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    v4 = [(SMReceiverCacheManager *)self receiverContact];
    id v16 = [v4 sessionStatus];
    v5 = v16;
    uint64_t v17 = 6;
LABEL_13:
    [v16 setSessionState:v17];
    goto LABEL_14;
  }

LABEL_14:
LABEL_15:
  v20 = [(SMReceiverCacheManager *)self receiverContact];
  id v21 = [v20 sessionStatus];
  uint64_t v22 = [v21 sessionState];

  v23 = [MEMORY[0x1E4F998F8] convertSessionStateToString:v22];
  v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [(SMReceiverCacheManager *)self sessionID];
    id v26 = (objc_class *)objc_opt_class();
    objc_super v27 = NSStringFromClass(v26);
    v28 = NSStringFromSelector(a2);
    int v48 = 138413058;
    v49 = v25;
    __int16 v50 = 2112;
    v51 = v27;
    __int16 v52 = 2112;
    v53 = v28;
    __int16 v54 = 2112;
    v55 = v23;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,transitioning to state:%@", (uint8_t *)&v48, 0x2Au);
  }
  switch(v22)
  {
    case 2:
      [(SMReceiverCacheManager *)self transitionFromInitializingToActiveDueToEvent:1];
      break;
    case 3:
      [(SMReceiverCacheManager *)self transitionFromInitializingToTriggeredDueToEvent:1];
      break;
    case 4:
      [(SMReceiverCacheManager *)self transitionFromInitializingToCacheReleasedDueToEvent:1];
      break;
    case 5:
      [(SMReceiverCacheManager *)self transitionFromInitializingToCachePersistenceDueToEvent:1];
      break;
    case 6:
      [(SMReceiverCacheManager *)self transitionFromInitializingToCleanupDueToEvent:1];
      break;
    case 7:
      [(SMReceiverCacheManager *)self transitionFromInitializingToMissingSessionInfoDueToEvent:1];
      break;
    case 8:
      [(SMReceiverCacheManager *)self transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:1];
      break;
    case 9:
      [(SMReceiverCacheManager *)self transitionFromInitializingToCacheDownloadFailedDueToEvent:1];
      break;
    default:
      v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v35 = [(SMReceiverCacheManager *)self sessionID];
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        v38 = NSStringFromSelector(a2);
        v39 = [(SMReceiverCacheManager *)self receiverContact];
        v40 = [v39 sessionStatus];
        int v41 = [v40 sessionState];
        int v48 = 138413058;
        v49 = v35;
        __int16 v50 = 2112;
        v51 = v37;
        __int16 v52 = 2112;
        v53 = v38;
        __int16 v54 = 1024;
        LODWORD(v55) = v41;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled cached state %d", (uint8_t *)&v48, 0x26u);
      }
      __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        v44 = NSStringFromSelector(a2);
        v45 = [(SMReceiverCacheManager *)self receiverContact];
        v46 = [v45 sessionStatus];
        int v47 = [v46 sessionState];
        int v48 = 138412802;
        v49 = v43;
        __int16 v50 = 2112;
        v51 = v44;
        __int16 v52 = 1024;
        LODWORD(v53) = v47;
        _os_log_fault_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,%@,%@,unknown or unhandled cached state %d", (uint8_t *)&v48, 0x1Cu);
      }
      break;
  }
}

- (void)onSessionStartMessageReceived:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startMessage", (uint8_t *)&v18, 2u);
    }
    goto LABEL_8;
  }
  v6 = [(SMReceiverCacheManager *)self receiverContact];
  double v7 = [v6 sessionStatus];
  uint64_t v8 = [v7 sessionState];

  if (v8 != 1)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [(SMReceiverCacheManager *)self sessionID];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      id v13 = NSStringFromSelector(a2);
      id v14 = (void *)MEMORY[0x1E4F998F8];
      id v15 = [(SMReceiverCacheManager *)self receiverContact];
      id v16 = [v15 sessionStatus];
      uint64_t v17 = [v14 convertSessionStateToString:[v16 sessionState]];
      int v18 = 138413058;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v12;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received start message outside of Initializing state,state,%@", (uint8_t *)&v18, 0x2Au);
    }
LABEL_8:

    goto LABEL_9;
  }
  [(SMReceiverCacheManager *)self copySessionStartMessageParameters:v5];
  [(SMReceiverCacheManager *)self transitionToState:2 event:2];
LABEL_9:
}

- (void)onSessionStartInfoMessageReceived:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = [(SMReceiverCacheManager *)self receiverContact];
    double v7 = [v6 sessionStatus];
    uint64_t v8 = [v7 sessionState];

    if (v8 == 7)
    {
      [(SMReceiverCacheManager *)self copySessionStartMessageParameters:v5];
      [(SMReceiverCacheManager *)self transitionToState:3 event:11];
    }
    else
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(SMReceiverCacheManager *)self sessionID];
        v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        id v14 = NSStringFromSelector(a2);
        int v15 = 138412802;
        id v16 = v11;
        __int16 v17 = 2112;
        int v18 = v13;
        __int16 v19 = 2112;
        __int16 v20 = v14;
        _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received SMSessionStartInfoMessage without requesting for it", (uint8_t *)&v15, 0x20u);
      }
    }
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startInfoMessage", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)copySessionStartMessageParameters:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 sessionType];
    uint64_t v8 = [(SMReceiverCacheManager *)self receiverContact];
    v9 = [v8 sessionStatus];
    [v9 setSessionType:v7];

    uint64_t v10 = [v6 date];
    v11 = [(SMReceiverCacheManager *)self receiverContact];
    v12 = [v11 sessionStatus];
    [v12 setSessionStartDate:v10];

    id v13 = [v6 estimatedEndTime];
    id v14 = [(SMReceiverCacheManager *)self receiverContact];
    int v15 = [v14 sessionStatus];
    [v15 setEstimatedEndDate:v13];

    id v16 = [v6 coarseEstimatedEndTime];
    __int16 v17 = v16;
    if (!v16)
    {
      __int16 v17 = [v6 estimatedEndTime];
    }
    int v18 = [(SMReceiverCacheManager *)self receiverContact];
    __int16 v19 = [v18 sessionStatus];
    [v19 setCoarseEstimatedEndDate:v17];

    if (!v16) {
    uint64_t v20 = [v6 destinationType];
    }
    uint64_t v21 = [(SMReceiverCacheManager *)self receiverContact];
    __int16 v22 = [v21 sessionStatus];
    [v22 setDestinationType:v20];

    v23 = [v6 destinationMapItem];
    __int16 v24 = [(SMReceiverCacheManager *)self receiverContact];
    v25 = [v24 sessionStatus];
    [v25 setDestinationMapItem:v23];

    uint64_t v26 = [v6 lowPowerModeWarningState];
    objc_super v27 = [(SMReceiverCacheManager *)self receiverContact];
    v28 = [v27 sessionStatus];
    [v28 setLowPowerModeWarningState:v26];

    v29 = [(SMReceiverCacheManager *)self messagingService];
    __int16 v30 = [v6 invitationTokenDict];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __60__SMReceiverCacheManager_copySessionStartMessageParameters___block_invoke;
    v46[3] = &unk_1E6B98758;
    v46[4] = self;
    SEL v48 = a2;
    id v31 = v6;
    id v47 = v31;
    [v29 findObjectForMyAccountFromDict:v30 withHandler:v46];

    __int16 v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [(SMReceiverCacheManager *)self sessionID];
      v33 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v33);
      v43 = NSStringFromSelector(a2);
      v45 = [v31 date];
      v34 = [v45 stringFromDate];
      v35 = [v31 estimatedEndTime];
      v36 = [v35 stringFromDate];
      v37 = [v31 coarseEstimatedEndTime];
      v38 = [v37 stringFromDate];
      int v39 = [v31 sessionType];
      int v40 = [v31 destinationType];
      *(_DWORD *)buf = 138414082;
      __int16 v50 = v42;
      __int16 v51 = 2112;
      __int16 v52 = v44;
      __int16 v53 = 2112;
      __int16 v54 = v43;
      __int16 v55 = 2112;
      uint64_t v56 = v34;
      __int16 v57 = 2112;
      v58 = v36;
      __int16 v59 = 2112;
      v60 = v38;
      __int16 v61 = 1024;
      int v62 = v39;
      __int16 v63 = 1024;
      int v64 = v40;
      _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sessionStartDate,%@,estimatedEndDate,%@,coarseEstimatedEndDate,%@,sessionType,%d,destinationType,%d", buf, 0x4Au);
    }
  }
  else
  {
    int v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startMessage", buf, 2u);
    }
  }
}

void __60__SMReceiverCacheManager_copySessionStartMessageParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = [*(id *)(a1 + 32) receiverContact];
    v9 = [v8 sessionStatus];
    [v9 setReceiverHandle:v5];

    id v10 = v7;
    v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [*(id *)(a1 + 32) sessionID];
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      int v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v30 = 138413314;
      id v31 = v12;
      __int16 v32 = 2112;
      v33 = v14;
      __int16 v34 = 2112;
      v35 = v15;
      __int16 v36 = 2112;
      v37 = v5;
      __int16 v38 = 2112;
      id v39 = v10;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,found handle %@ with invitationToken %@", (uint8_t *)&v30, 0x34u);
    }
  }
  else
  {
    id v16 = [*(id *)(a1 + 40) invitationTokenDict];
    __int16 v17 = [v16 allKeys];
    v11 = [v17 firstObject];

    int v18 = [*(id *)(a1 + 40) invitationTokenDict];
    id v10 = [v18 objectForKey:v11];

    __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [*(id *)(a1 + 32) sessionID];
      objc_super v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v29 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v30 = 138413314;
      id v31 = v26;
      __int16 v32 = 2112;
      v33 = v28;
      __int16 v34 = 2112;
      v35 = v29;
      __int16 v36 = 2112;
      v37 = v11;
      __int16 v38 = 2112;
      id v39 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unable to find handle for my account,assuming first entry is for me with handle %@ and invitationToken %@", (uint8_t *)&v30, 0x34u);
    }
  }

  uint64_t v20 = [v10 sharingInvitationData];
  uint64_t v21 = [*(id *)(a1 + 32) receiverContact];
  [v21 setSharingInvitationData:v20];

  __int16 v22 = [v10 shareURL];
  v23 = [*(id *)(a1 + 32) receiverContact];
  [v23 setShareURL:v22];

  __int16 v24 = [v10 participantID];
  v25 = [*(id *)(a1 + 32) receiverContact];
  [v25 setParticipantID:v24];
}

- (void)onShareInvitationAcceptenceResult:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [(SMReceiverCacheManager *)self receiverContact];
  v9 = [v8 sessionStatus];
  char v10 = [v9 isSessionOngoing];

  if (v10)
  {
    if (v4)
    {
      [(SMReceiverCacheManager *)self setZoneShareRetryCount:0];
      v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(SMReceiverCacheManager *)self sessionID];
        id v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        int v15 = NSStringFromSelector(a2);
        int v44 = 138412802;
        v45 = v12;
        __int16 v46 = 2112;
        id v47 = v14;
        __int16 v48 = 2112;
        v49 = v15;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully accepted zone share", (uint8_t *)&v44, 0x20u);
      }
      id v16 = [(SMReceiverCacheManager *)self receiverContact];
      __int16 v17 = [v16 sessionStatus];
      [v17 setZoneShareAccepted:1];

      int v18 = [MEMORY[0x1E4F1C9C8] now];
      __int16 v19 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v20 = [v19 sessionStatus];
      [v20 setLastUpdateDate:v18];

      if ([(SMReceiverCacheManager *)self safetyCacheFetchPending]) {
        [(SMReceiverCacheManager *)self fetchSafetyCacheData:3];
      }
      uint64_t v21 = [(SMReceiverCacheManager *)self delegate];
      __int16 v22 = [(SMReceiverCacheManager *)self sessionID];
      v23 = [(SMReceiverCacheManager *)self sessionStatus];
      [v21 sessionStatusChanged:v22 status:v23];

      [(SMReceiverCacheManager *)self updateReceiverContactInStore];
    }
    else
    {
      v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = [(SMReceiverCacheManager *)self sessionID];
        int v41 = (objc_class *)objc_opt_class();
        v42 = NSStringFromClass(v41);
        v43 = NSStringFromSelector(a2);
        int v44 = 138413058;
        v45 = v40;
        __int16 v46 = 2112;
        id v47 = v42;
        __int16 v48 = 2112;
        v49 = v43;
        __int16 v50 = 2112;
        id v51 = v7;
        _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to accept zone share with error %@", (uint8_t *)&v44, 0x2Au);
      }
      if ([(SMReceiverCacheManager *)self zoneShareRetryCount] <= 1
        && [(SMReceiverCacheManager *)self shouldRetryZoneShareAcceptanceForError:v7])
      {
        [(SMReceiverCacheManager *)self setZoneShareRetryCount:[(SMReceiverCacheManager *)self zoneShareRetryCount] + 1];
        __int16 v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = [(SMReceiverCacheManager *)self sessionID];
          __int16 v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          __int16 v38 = NSStringFromSelector(a2);
          int v39 = [(SMReceiverCacheManager *)self zoneShareRetryCount];
          int v44 = 138413058;
          v45 = v35;
          __int16 v46 = 2112;
          id v47 = v37;
          __int16 v48 = 2112;
          v49 = v38;
          __int16 v50 = 1024;
          LODWORD(v51) = v39;
          _os_log_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,retry accept zone share,attempt:%d", (uint8_t *)&v44, 0x26u);
        }
        [(SMReceiverCacheManager *)self acceptShareInvitation:14];
      }
      else
      {
        [(SMReceiverCacheManager *)self setZoneShareRetryCount:0];
      }
    }
  }
  else
  {
    __int16 v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v26 = (objc_class *)objc_opt_class();
      objc_super v27 = NSStringFromClass(v26);
      v28 = NSStringFromSelector(a2);
      v29 = (void *)MEMORY[0x1E4F998F8];
      int v30 = [(SMReceiverCacheManager *)self receiverContact];
      id v31 = [v30 sessionStatus];
      __int16 v32 = [v29 convertSessionStateToString:[v31 sessionState]];
      int v44 = 138413570;
      v45 = v25;
      __int16 v46 = 2112;
      id v47 = v27;
      __int16 v48 = 2112;
      v49 = v28;
      __int16 v50 = 2112;
      id v51 = v32;
      __int16 v52 = 1024;
      BOOL v53 = v4;
      __int16 v54 = 2112;
      id v55 = v7;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,zone acceptence result returned outside of session,state,%@,success,%d,error,%@", (uint8_t *)&v44, 0x3Au);
    }
  }
}

- (void)onEstimatedEndTimeUpdateMessageReceived:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMReceiverCacheManager *)self receiverContact];
    id v7 = [v6 sessionStatus];
    uint64_t v8 = [v7 sessionState];

    if (v8 == 2)
    {
      v9 = [v5 estimatedEndTime];
      char v10 = [(SMReceiverCacheManager *)self receiverContact];
      v11 = [v10 sessionStatus];
      [v11 setEstimatedEndDate:v9];

      v12 = [v5 coarseEstimatedEndTime];
      id v13 = v12;
      if (!v12)
      {
        id v13 = [v5 estimatedEndTime];
      }
      id v14 = [(SMReceiverCacheManager *)self receiverContact];
      int v15 = [v14 sessionStatus];
      [v15 setCoarseEstimatedEndDate:v13];

      if (!v12) {
      id v16 = [MEMORY[0x1E4F1C9C8] now];
      }
      __int16 v17 = [(SMReceiverCacheManager *)self receiverContact];
      int v18 = [v17 sessionStatus];
      [v18 setLastUpdateDate:v16];

      __int16 v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(SMReceiverCacheManager *)self sessionID];
        uint64_t v21 = (objc_class *)objc_opt_class();
        __int16 v22 = NSStringFromClass(v21);
        v23 = NSStringFromSelector(a2);
        __int16 v24 = [v5 estimatedEndTime];
        v25 = [v24 stringFromDate];
        uint64_t v26 = [v5 coarseEstimatedEndTime];
        objc_super v27 = [v26 stringFromDate];
        int v41 = 138413314;
        v42 = v20;
        __int16 v43 = 2112;
        int v44 = v22;
        __int16 v45 = 2112;
        __int16 v46 = v23;
        __int16 v47 = 2112;
        __int16 v48 = v25;
        __int16 v49 = 2112;
        __int16 v50 = v27;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,estimatedEndDate,%@,coarseEstimatedEndDate,%@", (uint8_t *)&v41, 0x34u);
      }
      v28 = [(SMReceiverCacheManager *)self delegate];
      v29 = [(SMReceiverCacheManager *)self sessionID];
      int v30 = [(SMReceiverCacheManager *)self sessionStatus];
      [v28 sessionStatusChanged:v29 status:v30];

      [(SMReceiverCacheManager *)self updateReceiverContactInStore];
    }
    else
    {
      __int16 v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = [(SMReceiverCacheManager *)self sessionID];
        __int16 v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        __int16 v36 = NSStringFromSelector(a2);
        v37 = (void *)MEMORY[0x1E4F998F8];
        __int16 v38 = [(SMReceiverCacheManager *)self receiverContact];
        int v39 = [v38 sessionStatus];
        uint64_t v40 = [v37 convertSessionStateToString:[v39 sessionState]];
        int v41 = 138413058;
        v42 = v33;
        __int16 v43 = 2112;
        int v44 = v35;
        __int16 v45 = 2112;
        __int16 v46 = v36;
        __int16 v47 = 2112;
        __int16 v48 = v40;
        _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received estimated end time update message outside of Active state,state,%@", (uint8_t *)&v41, 0x2Au);
      }
    }
  }
  else
  {
    id v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v41) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: estimatedEndTimeUpdateMessage", (uint8_t *)&v41, 2u);
    }
  }
}

- (void)onLowPowerModeWarningStateUpdateMessageReceived:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SMReceiverCacheManager *)self receiverContact];
  id v7 = [v6 sessionStatus];
  if ([v7 sessionState] == 3) {
    goto LABEL_4;
  }
  uint64_t v8 = [(SMReceiverCacheManager *)self receiverContact];
  v9 = [v8 sessionStatus];
  if ([v9 sessionState] == 4)
  {

LABEL_4:
LABEL_5:
    uint64_t v10 = [v5 lowPowerModeWarningState];
    v11 = [(SMReceiverCacheManager *)self receiverContact];
    v12 = [v11 sessionStatus];
    [v12 setLowPowerModeWarningState:v10];

    id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(SMReceiverCacheManager *)self sessionID];
      int v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      __int16 v17 = NSStringFromSelector(a2);
      int v18 = [MEMORY[0x1E4F99850] convertLowPowerModeWarningStateToString:[v5 lowPowerModeWarningState]];
      int v34 = 138413058;
      v35 = v14;
      __int16 v36 = 2112;
      v37 = v16;
      __int16 v38 = 2112;
      int v39 = v17;
      __int16 v40 = 2112;
      int v41 = v18;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,message.lowPowerModeWarningState %@", (uint8_t *)&v34, 0x2Au);
    }
    __int16 v19 = [(SMReceiverCacheManager *)self delegate];
    uint64_t v20 = [(SMReceiverCacheManager *)self sessionID];
    uint64_t v21 = [(SMReceiverCacheManager *)self sessionStatus];
    [v19 sessionStatusChanged:v20 status:v21];

    [(SMReceiverCacheManager *)self updateReceiverContactInStore];
    goto LABEL_8;
  }
  __int16 v22 = [(SMReceiverCacheManager *)self receiverContact];
  v23 = [v22 sessionStatus];
  uint64_t v24 = [v23 sessionState];

  if (v24 == 2) {
    goto LABEL_5;
  }
  v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = [(SMReceiverCacheManager *)self sessionID];
    objc_super v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = NSStringFromSelector(a2);
    int v30 = (void *)MEMORY[0x1E4F998F8];
    id v31 = [(SMReceiverCacheManager *)self receiverContact];
    __int16 v32 = [v31 sessionStatus];
    v33 = [v30 convertSessionStateToString:[v32 sessionState]];
    int v34 = 138413058;
    v35 = v26;
    __int16 v36 = 2112;
    v37 = v28;
    __int16 v38 = 2112;
    int v39 = v29;
    __int16 v40 = 2112;
    int v41 = v33;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received low power mode warning state update message outside of Active state or CachedRelease state,state,%@", (uint8_t *)&v34, 0x2Au);
  }
LABEL_8:
}

- (void)onKeyReleaseMessageReceived:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v52) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseMessage", (uint8_t *)&v52, 2u);
    }

    goto LABEL_30;
  }
  id v6 = [(SMReceiverCacheManager *)self receiverContact];
  id v7 = [v6 sessionStatus];
  if ([v7 sessionState] != 3)
  {
    uint64_t v10 = [(SMReceiverCacheManager *)self receiverContact];
    v11 = [v10 sessionStatus];
    if ([v11 sessionState] != 4)
    {

      goto LABEL_12;
    }
    char v12 = [v5 isSOSTrigger];

    if ((v12 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_10:
    [(SMReceiverCacheManager *)self copyKeyReleaseMessageParameters:v5];
    id v13 = [(SMReceiverCacheManager *)self delegate];
    id v14 = [(SMReceiverCacheManager *)self sessionID];
    int v15 = [(SMReceiverCacheManager *)self sessionStatus];
    [v13 sessionStatusChanged:v14 status:v15];

    [(SMReceiverCacheManager *)self updateReceiverContactInStore];
    goto LABEL_30;
  }
  int v8 = [v5 isSOSTrigger];

  if (v8) {
    goto LABEL_10;
  }
LABEL_12:
  id v16 = [(SMReceiverCacheManager *)self receiverContact];
  __int16 v17 = [v16 sessionStatus];
  if ([v17 sessionState] != 2)
  {
    int v18 = [(SMReceiverCacheManager *)self receiverContact];
    __int16 v19 = [v18 sessionStatus];
    if ([v19 sessionState] != 1)
    {
      v37 = [(SMReceiverCacheManager *)self receiverContact];
      __int16 v38 = [v37 sessionStatus];
      uint64_t v39 = [v38 sessionState];

      if (v39 != 8)
      {
        __int16 v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          int v44 = [(SMReceiverCacheManager *)self sessionID];
          __int16 v45 = (objc_class *)objc_opt_class();
          __int16 v46 = NSStringFromClass(v45);
          __int16 v47 = NSStringFromSelector(a2);
          __int16 v48 = (void *)MEMORY[0x1E4F998F8];
          __int16 v49 = [(SMReceiverCacheManager *)self receiverContact];
          __int16 v50 = [v49 sessionStatus];
          uint64_t v51 = [v48 convertSessionStateToString:[v50 sessionState]];
          int v52 = 138413058;
          BOOL v53 = v44;
          __int16 v54 = 2112;
          id v55 = v46;
          __int16 v56 = 2112;
          __int16 v57 = v47;
          __int16 v58 = 2112;
          __int16 v59 = v51;
          _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received key release message outside of Active/Initializing/MissingKeyReleaseInfo state,state,%@", (uint8_t *)&v52, 0x2Au);
        }
        goto LABEL_30;
      }
      goto LABEL_16;
    }
  }
LABEL_16:
  uint64_t v20 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v21 = [v20 sessionStatus];
  __int16 v22 = [v21 sessionStartDate];

  if (v22)
  {
    v23 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v24 = [(SMReceiverCacheManager *)self receiverContact];
    v25 = [v24 sessionStatus];
    uint64_t v26 = [v25 sessionStartDate];
    [v23 timeIntervalSinceDate:v26];
    double v28 = v27 / 60.0;
    v29 = [(SMReceiverCacheManager *)self receiverContact];
    [v29 setTimeTillCacheRelease:v28];
  }
  else
  {
    v23 = [(SMReceiverCacheManager *)self receiverContact];
    [v23 setTimeTillCacheRelease:0.0];
  }

  [(SMReceiverCacheManager *)self copyKeyReleaseMessageParameters:v5];
  [(SMReceiverCacheManager *)self stopMissingKeyReleaseTimer];
  int v30 = [(SMReceiverCacheManager *)self receiverContact];
  id v31 = [v30 sessionStatus];
  uint64_t v32 = [v31 sessionState];

  if (v32 == 1)
  {
    v33 = self;
    uint64_t v34 = 7;
LABEL_29:
    [(SMReceiverCacheManager *)v33 transitionToState:v34 event:5];
    goto LABEL_30;
  }
  v35 = [(SMReceiverCacheManager *)self receiverContact];
  __int16 v36 = [v35 sessionStatus];
  if ([v36 sessionState] == 2)
  {

LABEL_28:
    v33 = self;
    uint64_t v34 = 3;
    goto LABEL_29;
  }
  int v41 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v42 = [v41 sessionStatus];
  uint64_t v43 = [v42 sessionState];

  if (v43 == 8) {
    goto LABEL_28;
  }
LABEL_30:
}

- (void)onKeyReleaseInfoMessageReceived:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SMReceiverCacheManager *)self receiverContact];
    id v7 = [v6 sessionStatus];
    uint64_t v8 = [v7 sessionState];

    if (v8 == 8)
    {
      v9 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v10 = [(SMReceiverCacheManager *)self receiverContact];
      v11 = [v10 sessionStatus];
      char v12 = [v11 sessionStartDate];
      [v9 timeIntervalSinceDate:v12];
      double v14 = v13 / 60.0;
      int v15 = [(SMReceiverCacheManager *)self receiverContact];
      [v15 setTimeTillCacheRelease:v14];

      [(SMReceiverCacheManager *)self copyKeyReleaseMessageParameters:v5];
      [(SMReceiverCacheManager *)self transitionToState:3 event:12];
    }
    else
    {
      __int16 v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = [(SMReceiverCacheManager *)self sessionID];
        __int16 v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        uint64_t v21 = NSStringFromSelector(a2);
        int v22 = 138412802;
        v23 = v18;
        __int16 v24 = 2112;
        v25 = v20;
        __int16 v26 = 2112;
        double v27 = v21;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received SMKeyReleaseInfoMessage without requesting for it", (uint8_t *)&v22, 0x20u);
      }
    }
  }
  else
  {
    id v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseInfoMessage", (uint8_t *)&v22, 2u);
    }
  }
}

- (void)copyKeyReleaseMessageParameters:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 triggerDate];
    uint64_t v8 = [(SMReceiverCacheManager *)self receiverContact];
    v9 = [v8 sessionStatus];
    [v9 setTriggerDate:v7];

    uint64_t v10 = [v6 locationOfTrigger];
    v11 = [(SMReceiverCacheManager *)self receiverContact];
    char v12 = [v11 sessionStatus];
    [v12 setLocationOfTrigger:v10];

    uint64_t v13 = [v6 triggerType];
    double v14 = [(SMReceiverCacheManager *)self receiverContact];
    int v15 = [v14 sessionStatus];
    [v15 setTriggerType:v13];

    uint64_t v16 = [v6 isSOSTrigger];
    __int16 v17 = [(SMReceiverCacheManager *)self receiverContact];
    int v18 = [v17 sessionStatus];
    [v18 setIsSOSTrigger:v16];

    uint64_t v19 = [v6 lowPowerModeWarningState];
    uint64_t v20 = [(SMReceiverCacheManager *)self receiverContact];
    uint64_t v21 = [v20 sessionStatus];
    [v21 setLowPowerModeWarningState:v19];

    int v22 = [v6 safetyCacheKey];
    v23 = [(SMReceiverCacheManager *)self receiverContact];
    [v23 setSafetyCacheKey:v22];

    __int16 v24 = [v6 safetyCacheToken];
    v25 = [(SMReceiverCacheManager *)self receiverContact];
    [v25 setAllowReadToken:v24];

    __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      double v27 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      int v30 = NSStringFromSelector(a2);
      id v31 = [v6 triggerDate];
      uint64_t v32 = [v31 stringFromDate];
      int v33 = 138413314;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      __int16 v36 = v29;
      __int16 v37 = 2112;
      __int16 v38 = v30;
      __int16 v39 = 2112;
      __int16 v40 = v32;
      __int16 v41 = 1024;
      int v42 = [v6 triggerType];
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,triggerDate,%@,triggerType,%d", (uint8_t *)&v33, 0x30u);
    }
  }
  else
  {
    __int16 v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyReleaseMessage", (uint8_t *)&v33, 2u);
    }
  }
}

- (void)onUserCacheDownloadRequest
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  if ([v5 sessionState] == 3) {
    goto LABEL_4;
  }
  id v6 = [(SMReceiverCacheManager *)self receiverContact];
  id v7 = [v6 sessionStatus];
  if ([v7 sessionState] == 4)
  {

LABEL_4:
LABEL_5:
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      char v12 = NSStringFromSelector(a2);
      int v34 = 138412802;
      __int16 v35 = v9;
      __int16 v36 = 2112;
      __int16 v37 = v11;
      __int16 v38 = 2112;
      __int16 v39 = v12;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@", (uint8_t *)&v34, 0x20u);
    }
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    double v14 = [(SMReceiverCacheManager *)self receiverContact];
    int v15 = [v14 sessionStatus];
    [v15 setCacheRequestDate:v13];

    uint64_t v16 = [(SMReceiverCacheManager *)self receiverContact];
    __int16 v17 = [v16 sessionStatus];
    uint64_t v18 = [v17 sessionState];

    if (v18 == 4)
    {
      [(SMReceiverCacheManager *)self fetchSafetyCacheData:6];
      uint64_t v19 = [(SMReceiverCacheManager *)self delegate];
      uint64_t v20 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v21 = [(SMReceiverCacheManager *)self sessionStatus];
      [v19 sessionStatusChanged:v20 status:v21];
    }
    else
    {
      [(SMReceiverCacheManager *)self transitionToState:4 event:6];
    }
    return;
  }
  int v22 = [(SMReceiverCacheManager *)self receiverContact];
  v23 = [v22 sessionStatus];
  uint64_t v24 = [v23 sessionState];

  if (v24 == 9) {
    goto LABEL_5;
  }
  v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    __int16 v26 = [(SMReceiverCacheManager *)self sessionID];
    double v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);
    v29 = NSStringFromSelector(a2);
    int v30 = (void *)MEMORY[0x1E4F998F8];
    id v31 = [(SMReceiverCacheManager *)self receiverContact];
    uint64_t v32 = [v31 sessionStatus];
    int v33 = [v30 convertSessionStateToString:[v32 sessionState]];
    int v34 = 138413058;
    __int16 v35 = v26;
    __int16 v36 = 2112;
    __int16 v37 = v28;
    __int16 v38 = 2112;
    __int16 v39 = v29;
    __int16 v40 = 2112;
    __int16 v41 = v33;
    _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received user cache download request outside of Triggered and CacheReleased states,state,%@", (uint8_t *)&v34, 0x2Au);
  }
}

- (void)onCacheDownloadResult:(BOOL)a3 userInitiatedDownload:(BOOL)a4 withError:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v10 = [(SMReceiverCacheManager *)self defaultsManager];
  v11 = [v10 objectForKey:@"RTDefaultsMockTimeoutNextReceiverSafetyCacheDownload"];
  char v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0) {
    [(SMReceiverCacheManager *)self stopCacheDownloadTimeoutTimer];
  }
  uint64_t v13 = [(SMReceiverCacheManager *)self receiverContact];
  double v14 = [v13 sessionStatus];
  if ([v14 isSessionOngoing])
  {
  }
  else
  {
    int v15 = [(SMReceiverCacheManager *)self receiverContact];
    uint64_t v16 = [v15 sessionStatus];
    uint64_t v17 = [v16 sessionState];

    if (v17 != 5)
    {
      __int16 v54 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        id v55 = [(SMReceiverCacheManager *)self sessionID];
        __int16 v56 = (objc_class *)objc_opt_class();
        __int16 v57 = NSStringFromClass(v56);
        __int16 v58 = NSStringFromSelector(a2);
        __int16 v59 = (void *)MEMORY[0x1E4F998F8];
        uint64_t v60 = [(SMReceiverCacheManager *)self receiverContact];
        __int16 v61 = [v60 sessionStatus];
        int v62 = [v59 convertSessionStateToString:[v61 sessionState]];
        int v67 = 138413570;
        v68 = v55;
        __int16 v69 = 2112;
        v70 = v57;
        __int16 v71 = 2112;
        v72 = v58;
        __int16 v73 = 2112;
        v74 = v62;
        __int16 v75 = 1024;
        BOOL v76 = v6;
        __int16 v77 = 2112;
        id v78 = v9;
        _os_log_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache download result returned outside of session and Cache Persistence,state,%@,success,%d,error,%@", (uint8_t *)&v67, 0x3Au);
      }
      goto LABEL_30;
    }
  }
  uint64_t v18 = [(SMReceiverCacheManager *)self receiverContact];
  [v18 setNumCacheDownloads:[v18 numCacheDownloads] + 1];

  if (v6)
  {
    [(SMReceiverCacheManager *)self setCacheDownloadRetryCount:0];
    uint64_t v19 = [(SMReceiverCacheManager *)self receiverContact];
    [v19 setNumSuccessfulCacheDownloads:[v19 numSuccessfulCacheDownloads] + 1];

    uint64_t v20 = [(SMReceiverCacheManager *)self receiverContact];
    [v20 timeTillFirstSuccessfulCacheDownload];
    if (v21 == -1.0)
    {
      int v22 = [(SMReceiverCacheManager *)self receiverContact];
      v23 = [v22 sessionStatus];
      uint64_t v24 = [v23 sessionStartDate];

      if (!v24)
      {
LABEL_11:
        id v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [(SMReceiverCacheManager *)self sessionID];
          int v33 = (objc_class *)objc_opt_class();
          int v34 = NSStringFromClass(v33);
          __int16 v35 = NSStringFromSelector(a2);
          int v67 = 138412802;
          v68 = v32;
          __int16 v69 = 2112;
          v70 = v34;
          __int16 v71 = 2112;
          v72 = v35;
          _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully downloaded cache", (uint8_t *)&v67, 0x20u);
        }
        __int16 v36 = [(SMReceiverCacheManager *)self delegate];
        __int16 v37 = [(SMReceiverCacheManager *)self sessionID];
        __int16 v38 = [(SMReceiverCacheManager *)self receiverContact];
        __int16 v39 = [v38 phoneCache];
        __int16 v40 = [(SMReceiverCacheManager *)self receiverContact];
        __int16 v41 = [v40 watchCache];
        [v36 safetyCacheChanged:v37 phoneCache:v39 watchCache:v41];

        [(SMReceiverCacheManager *)self updateReceiverContactInStore];
        goto LABEL_30;
      }
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      v25 = [(SMReceiverCacheManager *)self receiverContact];
      __int16 v26 = [v25 sessionStatus];
      double v27 = [v26 sessionStartDate];
      [v20 timeIntervalSinceDate:v27];
      double v29 = v28 / 60.0;
      int v30 = [(SMReceiverCacheManager *)self receiverContact];
      [v30 setTimeTillFirstSuccessfulCacheDownload:v29];
    }
    goto LABEL_11;
  }
  uint64_t v42 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    __int16 v63 = [(SMReceiverCacheManager *)self sessionID];
    int v64 = (objc_class *)objc_opt_class();
    uint64_t v65 = NSStringFromClass(v64);
    v66 = NSStringFromSelector(a2);
    int v67 = 138412802;
    v68 = v63;
    __int16 v69 = 2112;
    v70 = v65;
    __int16 v71 = 2112;
    v72 = v66;
    _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to download cache", (uint8_t *)&v67, 0x20u);
  }
  [(SMReceiverCacheManager *)self updateReceiverContactInStore];
  if ([(SMReceiverCacheManager *)self cacheDownloadRetryCount] <= 1
    && [(SMReceiverCacheManager *)self shouldRetryCacheDownloadForError:v9])
  {
    [(SMReceiverCacheManager *)self setCacheDownloadRetryCount:[(SMReceiverCacheManager *)self cacheDownloadRetryCount] + 1];
    uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      int v44 = [(SMReceiverCacheManager *)self sessionID];
      __int16 v45 = (objc_class *)objc_opt_class();
      __int16 v46 = NSStringFromClass(v45);
      __int16 v47 = NSStringFromSelector(a2);
      int v48 = [(SMReceiverCacheManager *)self cacheDownloadRetryCount];
      int v67 = 138413058;
      v68 = v44;
      __int16 v69 = 2112;
      v70 = v46;
      __int16 v71 = 2112;
      v72 = v47;
      __int16 v73 = 1024;
      LODWORD(v74) = v48;
      _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,retry cache download,attempt:%d", (uint8_t *)&v67, 0x26u);
    }
    if (v5) {
      uint64_t v49 = 15;
    }
    else {
      uint64_t v49 = 13;
    }
    [(SMReceiverCacheManager *)self fetchSafetyCacheData:v49];
  }
  else
  {
    [(SMReceiverCacheManager *)self setCacheDownloadRetryCount:0];
    if (v5) {
      [(SMReceiverCacheManager *)self transitionToState:9 event:7];
    }
    int64_t v50 = [(SMReceiverCacheManager *)self normalizedSMErrorForCacheDownloadError:v9];
    uint64_t v51 = [(SMReceiverCacheManager *)self receiverContact];
    int v52 = [v51 sessionStatus];
    [v52 setCacheDownloadError:v50];

    BOOL v53 = [(SMReceiverCacheManager *)self defaultsManager];
    [v53 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsMockFailNextReceiverSafetyCacheDownload"];
  }
LABEL_30:
}

- (void)onCacheUpdatedMessageReceived:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [(SMReceiverCacheManager *)self receiverContact];
    id v7 = [v6 sessionStatus];
    uint64_t v8 = [v7 sessionState];

    if (v8 == 2)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(SMReceiverCacheManager *)self sessionID];
        v11 = (objc_class *)objc_opt_class();
        char v12 = NSStringFromClass(v11);
        uint64_t v13 = NSStringFromSelector(a2);
        int v32 = 138412802;
        int v33 = v10;
        __int16 v34 = 2112;
        __int16 v35 = v12;
        __int16 v36 = 2112;
        __int16 v37 = v13;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing key release message", (uint8_t *)&v32, 0x20u);
      }
      [(SMReceiverCacheManager *)self startMissingKeyReleaseTimer];
    }
    else
    {
      int v15 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v16 = [v15 sessionStatus];
      uint64_t v17 = [v16 sessionState];

      uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      uint64_t v19 = v18;
      if (v17 == 4)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [(SMReceiverCacheManager *)self sessionID];
          double v21 = (objc_class *)objc_opt_class();
          int v22 = NSStringFromClass(v21);
          v23 = NSStringFromSelector(a2);
          int v32 = 138412802;
          int v33 = v20;
          __int16 v34 = 2112;
          __int16 v35 = v22;
          __int16 v36 = 2112;
          __int16 v37 = v23;
          _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fetching updated Safety Cache data", (uint8_t *)&v32, 0x20u);
        }
        [(SMReceiverCacheManager *)self fetchSafetyCacheData:8];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = [(SMReceiverCacheManager *)self sessionID];
          v25 = (objc_class *)objc_opt_class();
          __int16 v26 = NSStringFromClass(v25);
          double v27 = NSStringFromSelector(a2);
          double v28 = (void *)MEMORY[0x1E4F998F8];
          double v29 = [(SMReceiverCacheManager *)self receiverContact];
          int v30 = [v29 sessionStatus];
          id v31 = [v28 convertSessionStateToString:[v30 sessionState]];
          int v32 = 138413058;
          int v33 = v24;
          __int16 v34 = 2112;
          __int16 v35 = v26;
          __int16 v36 = 2112;
          __int16 v37 = v27;
          __int16 v38 = 2112;
          __int16 v39 = v31;
          _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,ignore cache updated message in state,%@", (uint8_t *)&v32, 0x2Au);
        }
      }
    }
  }
  else
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cacheUpdatedMessage", (uint8_t *)&v32, 2u);
    }
  }
}

- (void)onSessionEndMessageReceived:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = [(SMReceiverCacheManager *)self receiverContact];
    id v7 = [v6 sessionStatus];
    char v8 = [v7 isSessionOngoing];

    if (v8)
    {
      uint64_t v9 = [v5 sessionEndReason];
      uint64_t v10 = [(SMReceiverCacheManager *)self receiverContact];
      v11 = [v10 sessionStatus];
      [v11 setSessionEndReason:v9];

      char v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [(SMReceiverCacheManager *)self sessionID];
        double v14 = (objc_class *)objc_opt_class();
        int v15 = NSStringFromClass(v14);
        uint64_t v16 = NSStringFromSelector(a2);
        int v107 = 138413058;
        v108 = v13;
        __int16 v109 = 2112;
        v110 = v15;
        __int16 v111 = 2112;
        v112 = v16;
        __int16 v113 = 1024;
        LODWORD(v114) = [v5 sessionEndReason];
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,sessionEndReason,%d", (uint8_t *)&v107, 0x26u);
      }
      uint64_t v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v18 = NSNumber;
      uint64_t v19 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v20 = [v19 sessionStatus];
      double v21 = [v18 numberWithUnsignedInteger:[v20 sessionType]];
      [v17 setValue:v21 forKey:@"sessionType"];

      int v22 = NSNumber;
      v23 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v24 = [v23 sessionStatus];
      v25 = [v22 numberWithUnsignedInteger:[v24 triggerType]];
      [v17 setValue:v25 forKey:@"triggerType"];

      __int16 v26 = NSNumber;
      double v27 = [(SMReceiverCacheManager *)self receiverContact];
      double v28 = [v27 sessionStatus];
      double v29 = [v26 numberWithUnsignedInteger:[v28 sessionEndReason]];
      [v17 setValue:v29 forKey:@"sessionEndReason"];

      int v30 = NSNumber;
      id v31 = [(SMReceiverCacheManager *)self receiverContact];
      int v32 = [v31 safetyCacheKey];
      int v33 = [v30 numberWithInt:v32 != 0];
      [v17 setValue:v33 forKey:@"wasCacheReleased"];

      __int16 v34 = NSNumber;
      __int16 v35 = [(SMReceiverCacheManager *)self receiverContact];
      __int16 v36 = [v34 numberWithLongLong:[v35 numCacheDownloads]];
      [v17 setValue:v36 forKey:@"numCacheDownloads"];

      __int16 v37 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v38 = [v37 numCacheDownloads];

      if (v38 < 1)
      {
        [v17 setValue:&unk_1F34514E8 forKey:@"percentageOfSuccessfulCacheDownloads"];
      }
      else
      {
        __int16 v39 = NSNumber;
        uint64_t v40 = [(SMReceiverCacheManager *)self receiverContact];
        float v41 = (float)[v40 numSuccessfulCacheDownloads];
        uint64_t v42 = [(SMReceiverCacheManager *)self receiverContact];
        *(float *)&double v43 = (float)(v41 / (float)[v42 numCacheDownloads]) * 100.0;
        int v44 = [v39 numberWithFloat:v43];
        [v17 setValue:v44 forKey:@"percentageOfSuccessfulCacheDownloads"];
      }
      BOOL v53 = NSNumber;
      __int16 v54 = [(SMReceiverCacheManager *)self receiverContact];
      [v54 timeTillCacheRelease];
      id v55 = [v53 numberWithDouble:];
      [v17 setValue:v55 forKey:@"timeTilCacheRelease"];

      __int16 v56 = NSNumber;
      __int16 v57 = [(SMReceiverCacheManager *)self receiverContact];
      *(float *)&double v58 = (float)[v57 maxPhoneCacheSize] * 0.00097656;
      __int16 v59 = [v56 numberWithFloat:v58];
      [v17 setValue:v59 forKey:@"phoneMaxCacheSize"];

      uint64_t v60 = NSNumber;
      __int16 v61 = [(SMReceiverCacheManager *)self receiverContact];
      *(float *)&double v62 = (float)[v61 maxWatchCacheSize] * 0.00097656;
      __int16 v63 = [v60 numberWithFloat:v62];
      [v17 setValue:v63 forKey:@"watchMaxCacheSize"];

      int v64 = NSNumber;
      uint64_t v65 = [(SMReceiverCacheManager *)self receiverContact];
      v66 = [v64 numberWithLongLong:[v65 maxLocationsInPhoneCacheTrace]];
      [v17 setValue:v66 forKey:@"phoneMaxLocationsInTrace"];

      int v67 = NSNumber;
      v68 = [(SMReceiverCacheManager *)self receiverContact];
      __int16 v69 = [v67 numberWithLongLong:[v68 maxLocationsInWatchCacheTrace]];
      [v17 setValue:v69 forKey:@"watchMaxLocationsInTrace"];

      v70 = NSNumber;
      __int16 v71 = [(SMReceiverCacheManager *)self phoneCache];
      v72 = [v71 locationsDuringSession];
      __int16 v73 = [v70 numberWithInt:[v72 count] != 0];
      [v17 setValue:v73 forKey:@"phoneLocationHistoryAvailable"];

      v74 = NSNumber;
      __int16 v75 = [(SMReceiverCacheManager *)self watchCache];
      BOOL v76 = [v75 locationsDuringSession];
      __int16 v77 = [v74 numberWithInt:[v76 count] != 0];
      [v17 setValue:v77 forKey:@"watchLocationHistoryAvailable"];

      id v78 = NSNumber;
      uint64_t v79 = [(SMReceiverCacheManager *)self receiverContact];
      v80 = [v79 sessionStatus];
      v81 = [v78 numberWithInt:objc_msgSend(v80, "triggerType") == 15];
      [v17 setValue:v81 forKey:@"wasScheduledSendTriggered"];

      v82 = NSNumber;
      v83 = [(SMReceiverCacheManager *)self receiverContact];
      v84 = [v82 numberWithLongLong:[v83 phoneMaxWorkoutEvents]];
      [v17 setValue:v84 forKey:@"phoneMaxWorkoutEvents"];

      v85 = NSNumber;
      v86 = [(SMReceiverCacheManager *)self receiverContact];
      v87 = [v85 numberWithLongLong:[v86 watchMaxWorkoutEvents]];
      [v17 setValue:v87 forKey:@"watchMaxWorkoutEvents"];

      v88 = NSNumber;
      v89 = [(SMReceiverCacheManager *)self receiverContact];
      v90 = [v89 sessionStatus];
      v91 = [v88 numberWithInt:[v90 lowPowerModeWarningState] == 2];
      [v17 setValue:v91 forKey:@"wasInLPM"];

      v92 = [MEMORY[0x1E4F1C9C8] date];
      v93 = [(SMReceiverCacheManager *)self receiverContact];
      v94 = [v93 sessionStatus];
      v95 = [v94 sessionStartDate];
      [v92 timeIntervalSinceDate:v95];
      double v97 = v96 / 60.0;

      v98 = [NSNumber numberWithDouble:v97];
      [v17 setValue:v98 forKey:@"sessionDuration"];

      AnalyticsSendEvent();
      v99 = [(SMReceiverCacheManager *)self computeReceiverSessionMetrics];
      [(SMReceiverCacheManager *)self computeResponseModality:v99 completionHandler:&__block_literal_global_71];
      if ([v5 sessionEndReason] == 3)
      {
        v100 = [(SMReceiverCacheManager *)self receiverContact];
        v101 = [v100 sessionStatus];
        if ([v101 sessionState] == 4)
        {
          v102 = [(SMReceiverCacheManager *)self receiverContact];
          v103 = [v102 phoneCache];
          if (v103)
          {

LABEL_19:
            uint64_t v104 = 5;
            goto LABEL_20;
          }
          v105 = [(SMReceiverCacheManager *)self receiverContact];
          v106 = [v105 watchCache];

          if (v106) {
            goto LABEL_19;
          }
        }
        else
        {
        }
      }
      uint64_t v104 = 6;
LABEL_20:
      [(SMReceiverCacheManager *)self transitionToState:v104 event:9];

      goto LABEL_21;
    }
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v45 = [(SMReceiverCacheManager *)self sessionID];
      __int16 v46 = (objc_class *)objc_opt_class();
      __int16 v47 = NSStringFromClass(v46);
      int v48 = NSStringFromSelector(a2);
      uint64_t v49 = (void *)MEMORY[0x1E4F998F8];
      int64_t v50 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v51 = [v50 sessionStatus];
      int v52 = [v49 convertSessionStateToString:[v51 sessionState]];
      int v107 = 138413058;
      v108 = v45;
      __int16 v109 = 2112;
      v110 = v47;
      __int16 v111 = 2112;
      v112 = v48;
      __int16 v113 = 2112;
      v114 = v52;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received session end message outside of session,state,%@", (uint8_t *)&v107, 0x2Au);
    }
  }
  else
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v107) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endMessage", (uint8_t *)&v107, 2u);
    }
  }
LABEL_21:
}

void __54__SMReceiverCacheManager_onSessionEndMessageReceived___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  id v6 = (id)[v4 initWithCString:RTAnalyticsEventSafetyMonitorReceiverSession encoding:1];
  log_analytics_submission(v6, v3);
  id v5 = [NSString stringWithFormat:@"com.apple.%@", v6];
  AnalyticsSendEvent();
}

- (void)onCachePersistenceExpiry
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(SMReceiverCacheManager *)self cachePersistenceStopTimer];
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  uint64_t v6 = [v5 sessionState];

  id v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  char v8 = v7;
  if (v6 == 5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      char v12 = NSStringFromSelector(a2);
      int v21 = 138412802;
      int v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      __int16 v26 = v12;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@", (uint8_t *)&v21, 0x20u);
    }
    [(SMReceiverCacheManager *)self transitionToState:6 event:10];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [(SMReceiverCacheManager *)self sessionID];
      double v14 = (objc_class *)objc_opt_class();
      int v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(a2);
      uint64_t v17 = (void *)MEMORY[0x1E4F998F8];
      uint64_t v18 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v19 = [v18 sessionStatus];
      uint64_t v20 = [v17 convertSessionStateToString:[v19 sessionState]];
      int v21 = 138413058;
      int v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      double v28 = v20;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,received Cache Persistence Expiry when outside of Cache Persistence state,state,%@", (uint8_t *)&v21, 0x2Au);
    }
  }
}

- (void)onViewingSessionDetails
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v5 = [v4 firstDetailViewSessionState];

  if (!v5)
  {
    uint64_t v6 = [(SMReceiverCacheManager *)self receiverContact];
    id v7 = [v6 sessionStatus];
    uint64_t v8 = [v7 sessionState];
    uint64_t v9 = [(SMReceiverCacheManager *)self receiverContact];
    [v9 setFirstDetailViewSessionState:v8];
  }
  uint64_t v10 = [(SMReceiverCacheManager *)self receiverContact];
  v11 = [v10 sessionStatus];
  uint64_t v12 = [v11 sessionState];
  uint64_t v13 = [(SMReceiverCacheManager *)self receiverContact];
  [v13 setLastDetailViewSessionState:v12];

  [(SMReceiverCacheManager *)self updateReceiverContactInStore];
  double v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [(SMReceiverCacheManager *)self sessionID];
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v18 = NSStringFromSelector(a2);
    uint64_t v19 = [(SMReceiverCacheManager *)self receiverContact];
    int v20 = [v19 firstDetailViewSessionState];
    int v21 = [(SMReceiverCacheManager *)self receiverContact];
    int v22 = 138413314;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    __int16 v25 = v17;
    __int16 v26 = 2112;
    __int16 v27 = v18;
    __int16 v28 = 1024;
    int v29 = v20;
    __int16 v30 = 1024;
    int v31 = [v21 lastDetailViewSessionState];
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry firstDetailViewSessionState %d, lastDetailViewSessionState %d", (uint8_t *)&v22, 0x2Cu);
  }
}

- (void)startCacheDownloadTimeoutTimer
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [(SMReceiverCacheManager *)self stopCacheDownloadTimeoutTimer];
  objc_initWeak(&location, self);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SMReceiverCacheManager *)self sessionID];
  id v7 = NSString;
  uint64_t v8 = [(SMReceiverCacheManager *)self sessionID];
  uint64_t v9 = [v7 stringWithFormat:@"%@.%@", @"com.apple.routined.SMReceiverCacheManager.cacheDownloadTimeoutTimerIdentifierBase", v8];

  uint64_t v10 = [RTXPCTimerAlarm alloc];
  v11 = [(SMReceiverCacheManager *)self queue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __56__SMReceiverCacheManager_startCacheDownloadTimeoutTimer__block_invoke;
  v30[3] = &unk_1E6B987A0;
  objc_copyWeak(v34, &location);
  id v12 = v6;
  id v31 = v12;
  id v13 = v5;
  v34[1] = (id)a2;
  id v32 = v13;
  int v33 = self;
  double v14 = [(RTXPCTimerAlarm *)v10 initWithIdentifier:v9 queue:v11 handler:v30];
  [(SMReceiverCacheManager *)self setCacheDownloadTimeoutTimerAlarm:v14];

  int v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
  uint64_t v16 = [(SMReceiverCacheManager *)self cacheDownloadTimeoutTimerAlarm];
  id v29 = 0;
  [v16 fireWithDate:v15 error:&v29];
  id v17 = v29;

  if (v17)
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      int v22 = [v17 localizedDescription];
      *(_DWORD *)buf = 138413058;
      __int16 v37 = v27;
      __int16 v38 = 2112;
      id v39 = v20;
      __int16 v40 = 2112;
      id v41 = v21;
      __int16 v42 = 2112;
      double v43 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cacheDownloadTimeoutTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = [(SMReceiverCacheManager *)self sessionID];
      __int16 v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v26 = [v15 stringFromDate];
      *(_DWORD *)buf = 138413058;
      __int16 v37 = v28;
      __int16 v38 = 2112;
      id v39 = v24;
      __int16 v40 = 2112;
      id v41 = v25;
      __int16 v42 = 2112;
      double v43 = v26;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missingKeyReleaseTimerAlarm scheduled for: %@", buf, 0x2Au);
    }
  }

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
}

void __56__SMReceiverCacheManager_startCacheDownloadTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (!WeakRetained)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    int v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v18 = 138412802;
    uint64_t v19 = v16;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    __int16 v23 = v15;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,self not found", (uint8_t *)&v18, 0x20u);
LABEL_13:

    goto LABEL_7;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v18 = 138412802;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    __int16 v23 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache download timer timeout fired", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v8 = [*(id *)(a1 + 48) defaultsManager];
  [v8 setObject:MEMORY[0x1E4F1CC28] forKey:@"RTDefaultsMockTimeoutNextReceiverSafetyCacheDownload"];

  id v4 = [*(id *)(a1 + 48) receiverContact];
  uint64_t v9 = [v4 phoneCache];
  if (v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v10 = [*(id *)(a1 + 48) receiverContact];
  v11 = [v10 watchCache];

  if (!v11)
  {
    id v12 = [WeakRetained receiverContact];
    id v13 = [v12 sessionStatus];
    uint64_t v14 = [v13 sessionState];

    if (v14 == 4)
    {
      [WeakRetained transitionToState:9 event:7];
      id v4 = [*(id *)(a1 + 48) receiverContact];
      int v15 = [v4 sessionStatus];
      [v15 setCacheDownloadError:15];
      goto LABEL_13;
    }
  }
LABEL_8:
}

- (void)stopCacheDownloadTimeoutTimer
{
  id v3 = [(SMReceiverCacheManager *)self cacheDownloadTimeoutTimerAlarm];

  if (v3)
  {
    id v4 = [(SMReceiverCacheManager *)self cacheDownloadTimeoutTimerAlarm];
    [v4 invalidate];

    [(SMReceiverCacheManager *)self setCacheDownloadTimeoutTimerAlarm:0];
  }
}

- (void)startMissingKeyReleaseTimer
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(SMReceiverCacheManager *)self stopMissingKeyReleaseTimer];
  objc_initWeak(&location, self);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SMReceiverCacheManager *)self sessionID];
  id v7 = NSString;
  uint64_t v8 = [(SMReceiverCacheManager *)self sessionID];
  uint64_t v9 = [v7 stringWithFormat:@"%@.%@", @"com.apple.routined.SMReceiverCacheManager.missingKeyReleaseTimerIdentifierBase", v8];

  uint64_t v10 = [RTXPCTimerAlarm alloc];
  v11 = [(SMReceiverCacheManager *)self queue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53__SMReceiverCacheManager_startMissingKeyReleaseTimer__block_invoke;
  v30[3] = &unk_1E6B97F40;
  objc_copyWeak(v33, &location);
  id v12 = v6;
  id v31 = v12;
  id v13 = v5;
  id v32 = v13;
  v33[1] = (id)a2;
  uint64_t v14 = [(RTXPCTimerAlarm *)v10 initWithIdentifier:v9 queue:v11 handler:v30];
  [(SMReceiverCacheManager *)self setMissingKeyReleaseTimerAlarm:v14];

  int v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
  uint64_t v16 = [(SMReceiverCacheManager *)self missingKeyReleaseTimerAlarm];
  id v29 = 0;
  [v16 fireWithDate:v15 error:&v29];
  id v17 = v29;

  if (v17)
  {
    int v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v22 = [v17 localizedDescription];
      *(_DWORD *)buf = 138413058;
      __int16 v36 = v27;
      __int16 v37 = 2112;
      id v38 = v20;
      __int16 v39 = 2112;
      id v40 = v21;
      __int16 v41 = 2112;
      __int16 v42 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missingKeyReleaseTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);
    }
  }
  else
  {
    int v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = [(SMReceiverCacheManager *)self sessionID];
      __int16 v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v26 = [v15 stringFromDate];
      *(_DWORD *)buf = 138413058;
      __int16 v36 = v28;
      __int16 v37 = 2112;
      id v38 = v24;
      __int16 v39 = 2112;
      id v40 = v25;
      __int16 v41 = 2112;
      __int16 v42 = v26;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missingKeyReleaseTimerAlarm scheduled for: %@", buf, 0x2Au);
    }
  }

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

void __53__SMReceiverCacheManager_startMissingKeyReleaseTimer__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing key release wait timer fired", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v8 = [WeakRetained receiverContact];
    uint64_t v9 = [v8 sessionStatus];
    uint64_t v10 = [v9 sessionState];

    if (v10 == 2) {
      [WeakRetained transitionToState:8 event:8];
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v14 = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,self not found", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)stopMissingKeyReleaseTimer
{
  id v3 = [(SMReceiverCacheManager *)self missingKeyReleaseTimerAlarm];

  if (v3)
  {
    id v4 = [(SMReceiverCacheManager *)self missingKeyReleaseTimerAlarm];
    [v4 invalidate];

    [(SMReceiverCacheManager *)self setMissingKeyReleaseTimerAlarm:0];
  }
}

- (BOOL)shouldRetryZoneShareAcceptanceForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v5)
  {
    unint64_t v6 = [v3 code];
    if (v6 <= 0x1A) {
      unsigned int v7 = (0x3FFE1FDu >> v6) & 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)shouldRetryCacheDownloadForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F999F0]];

  if (v5)
  {
    unint64_t v6 = [v3 code];
    if (v6 >= 9) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = (0x103u >> v6) & 1;
    }
  }
  else
  {
    uint64_t v8 = [v3 domain];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F19C40]];

    if (v9) {
      BOOL v7 = [v3 code] != 7;
    }
    else {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (int64_t)normalizedSMErrorForCacheDownloadError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v5)
  {
    if ([v3 code] == 3)
    {
      int64_t v6 = 46;
    }
    else if ([v3 code] == 7)
    {
      int64_t v6 = 12;
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else
  {
    BOOL v7 = [v3 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F99A48]];

    if (v8) {
      int64_t v6 = [v3 code];
    }
    else {
      int64_t v6 = 0;
    }
  }

  return v6;
}

- (void)transitionToState:(int64_t)a3 event:(int64_t)a4
{
  BOOL v7 = self;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  int v8 = [(SMReceiverCacheManager *)self receiverContact];
  int v9 = [v8 sessionStatus];
  uint64_t v10 = [v9 sessionState];

  uint64_t v11 = [MEMORY[0x1E4F998F8] convertSessionStateToString:v10];
  if (v10 == a3)
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(SMReceiverCacheManager *)v7 sessionID];
      int v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      __int16 v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      int64_t v106 = (int64_t)v13;
      __int16 v107 = 2112;
      v108 = v15;
      __int16 v109 = 2112;
      *(void *)v110 = v16;
      *(_WORD *)&v110[8] = 2112;
      *(void *)&v110[10] = v11;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,attempted state transition when already in that state,%@", buf, 0x2Au);
    }
    goto LABEL_92;
  }
  uint64_t v12 = [MEMORY[0x1E4F998F8] convertSessionStateToString:a3];
  uint64_t v17 = [(id)objc_opt_class() receiverEventToString:a4];
  __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    [(SMReceiverCacheManager *)v7 sessionID];
    int64_t v103 = a4;
    uint64_t v19 = v12;
    uint64_t v20 = v11;
    v22 = id v21 = v17;
    __int16 v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v24 = v104 = a3;
    NSStringFromSelector(a2);
    id v25 = v7;
    v27 = __int16 v26 = a2;
    *(_DWORD *)buf = 138413570;
    int64_t v106 = (int64_t)v22;
    __int16 v107 = 2112;
    v108 = v24;
    __int16 v109 = 2112;
    *(void *)v110 = v27;
    *(_WORD *)&v110[8] = 2112;
    *(void *)&v110[10] = v20;
    *(_WORD *)&v110[18] = 2112;
    *(void *)&v110[20] = v19;
    __int16 v111 = 2112;
    v112 = v21;
    _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fromState:%@,toState:%@,event:%@", buf, 0x3Eu);

    uint64_t v17 = v21;
    uint64_t v11 = v20;
    uint64_t v12 = v19;
    a4 = v103;

    a2 = v26;
    BOOL v7 = v25;

    a3 = v104;
  }

  switch(v10)
  {
    case 1:
      switch(a3)
      {
        case 2:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToActiveDueToEvent:a4];
          goto LABEL_89;
        case 3:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToTriggeredDueToEvent:a4];
          goto LABEL_89;
        case 4:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToCacheReleasedDueToEvent:a4];
          goto LABEL_89;
        case 5:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToCachePersistenceDueToEvent:a4];
          goto LABEL_89;
        case 6:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToCleanupDueToEvent:a4];
          goto LABEL_89;
        case 7:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToMissingSessionInfoDueToEvent:a4];
          goto LABEL_89;
        case 8:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:a4];
          goto LABEL_89;
        case 9:
          [(SMReceiverCacheManager *)v7 transitionFromInitializingToCacheDownloadFailedDueToEvent:a4];
          goto LABEL_89;
        default:
          __int16 v39 = a2;
          int v48 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            [(SMReceiverCacheManager *)v7 sessionID];
            a3 = int v99 = a3;
            v100 = (objc_class *)objc_opt_class();
            v101 = NSStringFromClass(v100);
            v102 = NSStringFromSelector(v39);
            *(_DWORD *)buf = 138413314;
            int64_t v106 = a3;
            __int16 v107 = 2112;
            v108 = v101;
            __int16 v109 = 2112;
            *(void *)v110 = v102;
            *(_WORD *)&v110[8] = 1024;
            *(_DWORD *)&v110[10] = v99;
            *(_WORD *)&v110[14] = 2112;
            *(void *)&v110[16] = v11;
            _os_log_error_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

            LODWORD(a3) = v99;
          }

          __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            goto LABEL_80;
          }
          goto LABEL_81;
      }
    case 2:
      switch(a3)
      {
        case 8:
          [(SMReceiverCacheManager *)v7 transitionFromActiveToMissingKeyReleaseInfoDueToEvent:a4];
          goto LABEL_89;
        case 6:
          [(SMReceiverCacheManager *)v7 transitionFromActiveToCleanupDueToEvent:a4];
          goto LABEL_89;
        case 3:
          [(SMReceiverCacheManager *)v7 transitionFromActiveToTriggeredDueToEvent:a4];
          goto LABEL_89;
      }
      __int16 v39 = a2;
      __int16 v45 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        [(SMReceiverCacheManager *)v7 sessionID];
        a3 = int v87 = a3;
        v88 = (objc_class *)objc_opt_class();
        v89 = NSStringFromClass(v88);
        v90 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413314;
        int64_t v106 = a3;
        __int16 v107 = 2112;
        v108 = v89;
        __int16 v109 = 2112;
        *(void *)v110 = v90;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v87;
        *(_WORD *)&v110[14] = 2112;
        *(void *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v87;
      }

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        goto LABEL_80;
      }
      goto LABEL_81;
    case 3:
      if (a3 == 6)
      {
        [(SMReceiverCacheManager *)v7 transitionFromTriggeredToCleanupDueToEvent:a4];
        goto LABEL_89;
      }
      if (a3 == 4)
      {
        [(SMReceiverCacheManager *)v7 transitionFromTriggeredToCacheReleasedDueToEvent:a4];
        goto LABEL_89;
      }
      __int16 v39 = a2;
      __int16 v42 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        [(SMReceiverCacheManager *)v7 sessionID];
        a3 = int v75 = a3;
        BOOL v76 = (objc_class *)objc_opt_class();
        __int16 v77 = NSStringFromClass(v76);
        id v78 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413314;
        int64_t v106 = a3;
        __int16 v107 = 2112;
        v108 = v77;
        __int16 v109 = 2112;
        *(void *)v110 = v78;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v75;
        *(_WORD *)&v110[14] = 2112;
        *(void *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v75;
      }

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        goto LABEL_80;
      }
      goto LABEL_81;
    case 4:
      switch(a3)
      {
        case 5:
          [(SMReceiverCacheManager *)v7 transitionFromCacheReleasedToCachePersistenceDueToEvent:a4];
          goto LABEL_89;
        case 6:
          [(SMReceiverCacheManager *)v7 transitionFromCacheReleasedToCleanupDueToEvent:a4];
          goto LABEL_89;
        case 9:
          [(SMReceiverCacheManager *)v7 transitionFromCacheReleasedToCacheDownloadFailedDueToEvent:a4];
          goto LABEL_89;
      }
      __int16 v39 = a2;
      __int16 v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        [(SMReceiverCacheManager *)v7 sessionID];
        a3 = int v91 = a3;
        v92 = (objc_class *)objc_opt_class();
        v93 = NSStringFromClass(v92);
        v94 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413314;
        int64_t v106 = a3;
        __int16 v107 = 2112;
        v108 = v93;
        __int16 v109 = 2112;
        *(void *)v110 = v94;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v91;
        *(_WORD *)&v110[14] = 2112;
        *(void *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v91;
      }

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        goto LABEL_80;
      }
      goto LABEL_81;
    case 5:
      if (a3 == 6)
      {
        [(SMReceiverCacheManager *)v7 transitionFromCachePersistenceToCleanupDueToEvent:a4];
        goto LABEL_89;
      }
      __int16 v39 = a2;
      id v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        [(SMReceiverCacheManager *)v7 sessionID];
        a3 = int v71 = a3;
        v72 = (objc_class *)objc_opt_class();
        __int16 v73 = NSStringFromClass(v72);
        v74 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413314;
        int64_t v106 = a3;
        __int16 v107 = 2112;
        v108 = v73;
        __int16 v109 = 2112;
        *(void *)v110 = v74;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v71;
        *(_WORD *)&v110[14] = 2112;
        *(void *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v71;
      }

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        goto LABEL_80;
      }
      goto LABEL_81;
    case 6:
      __int16 v37 = a2;
      id v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v66 = [(SMReceiverCacheManager *)v7 sessionID];
        int v67 = (objc_class *)objc_opt_class();
        v68 = NSStringFromClass(v67);
        __int16 v69 = NSStringFromSelector(v37);
        *(_DWORD *)buf = 138412802;
        int64_t v106 = (int64_t)v66;
        __int16 v107 = 2112;
        v108 = v68;
        __int16 v109 = 2112;
        *(void *)v110 = v69;
        _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,tried to transition out of Cleanup state", buf, 0x20u);
      }
      __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      v70 = (objc_class *)objc_opt_class();
      id v32 = NSStringFromClass(v70);
      int v33 = NSStringFromSelector(v37);
      *(_DWORD *)buf = 138412546;
      int64_t v106 = (int64_t)v32;
      __int16 v107 = 2112;
      v108 = v33;
      __int16 v34 = "#SafetyCache,Receiver,%@,%@,tried to transition out of Cleanup state";
      __int16 v35 = v30;
      uint32_t v36 = 22;
      goto LABEL_94;
    case 7:
      if (a3 == 3)
      {
        [(SMReceiverCacheManager *)v7 transitionFromMissingSessionInfoToTriggeredDueToEvent:a4];
        goto LABEL_89;
      }
      if (a3 == 6)
      {
        [(SMReceiverCacheManager *)v7 transitionFromMissingSessionInfoToCleanupDueToEvent:a4];
        goto LABEL_89;
      }
      __int16 v39 = a2;
      uint64_t v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        [(SMReceiverCacheManager *)v7 sessionID];
        a3 = int v79 = a3;
        v80 = (objc_class *)objc_opt_class();
        v81 = NSStringFromClass(v80);
        v82 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413314;
        int64_t v106 = a3;
        __int16 v107 = 2112;
        v108 = v81;
        __int16 v109 = 2112;
        *(void *)v110 = v82;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v79;
        *(_WORD *)&v110[14] = 2112;
        *(void *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v79;
      }

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        goto LABEL_80;
      }
      goto LABEL_81;
    case 8:
      if (a3 == 3)
      {
        [(SMReceiverCacheManager *)v7 transitionFromMissingKeyReleaseInfoToTriggeredDueToEvent:a4];
        goto LABEL_89;
      }
      if (a3 == 6)
      {
        [(SMReceiverCacheManager *)v7 transitionFromMissingKeyReleaseInfoToCleanupDueToEvent:a4];
        goto LABEL_89;
      }
      __int16 v39 = a2;
      uint64_t v44 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        [(SMReceiverCacheManager *)v7 sessionID];
        a3 = int v83 = a3;
        v84 = (objc_class *)objc_opt_class();
        v85 = NSStringFromClass(v84);
        v86 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413314;
        int64_t v106 = a3;
        __int16 v107 = 2112;
        v108 = v85;
        __int16 v109 = 2112;
        *(void *)v110 = v86;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v83;
        *(_WORD *)&v110[14] = 2112;
        *(void *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v83;
      }

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        goto LABEL_80;
      }
      goto LABEL_81;
    case 9:
      switch(a3)
      {
        case 6:
          [(SMReceiverCacheManager *)v7 transitionFromCacheDownloadFailedToCleanupDueToEvent:a4];
          goto LABEL_89;
        case 5:
          [(SMReceiverCacheManager *)v7 transitionFromCacheDownloadFailedToCachePersistenceDueToEvent:a4];
LABEL_89:
          BOOL v53 = [MEMORY[0x1E4F1C9C8] now:v103];
          __int16 v54 = [(SMReceiverCacheManager *)v7 receiverContact];
          id v55 = [v54 sessionStatus];
          [v55 setLastUpdateDate:v53];

          __int16 v56 = [(SMReceiverCacheManager *)v7 delegate];
          __int16 v57 = [(SMReceiverCacheManager *)v7 sessionID];
          double v58 = [(SMReceiverCacheManager *)v7 sessionStatus];
          [v56 sessionStatusChanged:v57 status:v58];

          __int16 v59 = [(SMReceiverCacheManager *)v7 receiverContact];
          uint64_t v60 = [v59 sessionStatus];
          uint64_t v61 = [v60 sessionState];

          if (v61 != 6) {
            [(SMReceiverCacheManager *)v7 updateReceiverContactInStore];
          }
          goto LABEL_91;
        case 4:
          [(SMReceiverCacheManager *)v7 transitionFromCacheDownloadFailedToCacheReleasedDueToEvent:a4];
          goto LABEL_89;
      }
      __int16 v39 = a2;
      __int16 v47 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        [(SMReceiverCacheManager *)v7 sessionID];
        a3 = int v95 = a3;
        double v96 = (objc_class *)objc_opt_class();
        double v97 = NSStringFromClass(v96);
        v98 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413314;
        int64_t v106 = a3;
        __int16 v107 = 2112;
        v108 = v97;
        __int16 v109 = 2112;
        *(void *)v110 = v98;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v95;
        *(_WORD *)&v110[14] = 2112;
        *(void *)&v110[16] = v11;
        _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x30u);

        LODWORD(a3) = v95;
      }

      __int16 v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
LABEL_80:
        uint64_t v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v51 = int v50 = a3;
        int v52 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138413058;
        int64_t v106 = (int64_t)v51;
        __int16 v107 = 2112;
        v108 = v52;
        __int16 v109 = 1024;
        *(_DWORD *)v110 = v50;
        *(_WORD *)&v110[4] = 2112;
        *(void *)&v110[6] = v11;
        _os_log_fault_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,%@,%@,unknown or unhandled toState:%d for fromState:%@", buf, 0x26u);
      }
LABEL_81:

LABEL_91:
LABEL_92:

      return;
    default:
      __int16 v28 = a2;
      id v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        double v62 = [(SMReceiverCacheManager *)v7 sessionID];
        __int16 v63 = (objc_class *)objc_opt_class();
        int v64 = NSStringFromClass(v63);
        uint64_t v65 = NSStringFromSelector(v28);
        *(_DWORD *)buf = 138413058;
        int64_t v106 = (int64_t)v62;
        __int16 v107 = 2112;
        v108 = v64;
        __int16 v109 = 2112;
        *(void *)v110 = v65;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v10;
        _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,unknown or unhandled fromState:%d", buf, 0x26u);
      }
      __int16 v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        goto LABEL_29;
      }
      id v31 = (objc_class *)objc_opt_class();
      id v32 = NSStringFromClass(v31);
      int v33 = NSStringFromSelector(v28);
      *(_DWORD *)buf = 138412802;
      int64_t v106 = (int64_t)v32;
      __int16 v107 = 2112;
      v108 = v33;
      __int16 v109 = 1024;
      *(_DWORD *)v110 = v10;
      __int16 v34 = "#SafetyCache,Receiver,%@,%@,unknown or unhandled fromState:%d";
      __int16 v35 = v30;
      uint32_t v36 = 28;
LABEL_94:
      _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, v34, buf, v36);

LABEL_29:
      goto LABEL_91;
  }
}

- (void)transitionFromInitializingToActiveDueToEvent:(int64_t)a3
{
  int v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:2];

  [(SMReceiverCacheManager *)self acceptShareInvitation:a3];
}

- (void)transitionFromInitializingToTriggeredDueToEvent:(int64_t)a3
{
  int v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:3];

  [(SMReceiverCacheManager *)self acceptShareInvitation:a3];
}

- (void)transitionFromInitializingToCacheReleasedDueToEvent:(int64_t)a3
{
  int v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:4];

  [(SMReceiverCacheManager *)self fetchSafetyCacheData:a3];
}

- (void)transitionFromInitializingToCacheDownloadFailedDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  int v5 = [v4 sessionStatus];
  [v5 setSessionState:4];

  [(SMReceiverCacheManager *)self fetchSafetyCacheData:15];
}

- (void)transitionFromInitializingToCachePersistenceDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  int v5 = [v4 sessionStatus];
  [v5 setSessionState:5];

  [(SMReceiverCacheManager *)self cachePersistenceStartTimer];
}

- (void)transitionFromInitializingToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  int v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)transitionFromActiveToTriggeredDueToEvent:(int64_t)a3
{
  int v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:3];

  [(SMReceiverCacheManager *)self acceptShareInvitation:a3];
}

- (void)transitionFromInitializingToMissingSessionInfoDueToEvent:(int64_t)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int v8 = [(SMReceiverCacheManager *)self receiverContact];
  int v9 = [v8 sessionStatus];
  uint64_t v10 = [v9 sessionStartInfoRequestCount];
  if (v10 < 1)
  {
    __int16 v37 = a2;
  }
  else
  {
    id v3 = [(SMReceiverCacheManager *)self receiverContact];
    id v4 = [v3 sessionStatus];
    int v5 = [v4 lastSessionStartInfoRequestDate];
    [v5 timeIntervalSinceNow];
    if (v11 > -60.0)
    {

LABEL_9:
      __int16 v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(SMReceiverCacheManager *)self sessionID];
        __int16 v18 = (objc_class *)objc_opt_class();
        uint64_t v19 = NSStringFromClass(v18);
        uint64_t v20 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v44 = v17;
        __int16 v45 = 2112;
        __int16 v46 = v19;
        __int16 v47 = 2112;
        int v48 = v20;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,repeated attempts to request SMSessionStartInfo, drop request", buf, 0x20u);
      }
      goto LABEL_14;
    }
    __int16 v37 = a2;
  }
  uint64_t v12 = [(SMReceiverCacheManager *)self receiverContact];
  id v13 = [v12 sessionStatus];
  uint64_t v14 = [v13 sessionStartInfoRequestCount];

  if (v10 >= 1)
  {
  }
  BOOL v15 = v14 <= 5;
  a2 = v37;
  if (!v15) {
    goto LABEL_9;
  }
  id v21 = [(SMReceiverCacheManager *)self receiverContact];
  __int16 v22 = [v21 sessionStatus];
  [v22 setSessionState:7];

  __int16 v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [(SMReceiverCacheManager *)self sessionID];
    id v25 = (objc_class *)objc_opt_class();
    __int16 v26 = NSStringFromClass(v25);
    __int16 v27 = NSStringFromSelector(v37);
    *(_DWORD *)buf = 138412802;
    uint64_t v44 = v24;
    __int16 v45 = 2112;
    __int16 v46 = v26;
    __int16 v47 = 2112;
    int v48 = v27;
    _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,send sessionStartInfoRequestMessage", buf, 0x20u);
  }
  id v28 = objc_alloc(MEMORY[0x1E4F99988]);
  id v29 = [(SMReceiverCacheManager *)self sessionID];
  __int16 v30 = (void *)[v28 initWithSessionID:v29];

  id v31 = [(SMReceiverCacheManager *)self messagingService];
  id v32 = objc_alloc(MEMORY[0x1E4F99838]);
  int v33 = [(SMReceiverCacheManager *)self sessionStatus];
  __int16 v34 = [v33 initiatorHandle];
  __int16 v42 = v34;
  __int16 v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  uint32_t v36 = (void *)[v32 initWithReceiverHandles:v35 identifier:0 displayName:0];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __83__SMReceiverCacheManager_transitionFromInitializingToMissingSessionInfoDueToEvent___block_invoke;
  v38[3] = &unk_1E6B97D90;
  id v39 = v30;
  id v40 = self;
  __int16 v41 = v37;
  __int16 v16 = v30;
  [v31 sendIDSMessage:v16 toConversation:v36 completion:v38];

LABEL_14:
}

void __83__SMReceiverCacheManager_transitionFromInitializingToMissingSessionInfoDueToEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [*(id *)(a1 + 32) sessionID];
    int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v19 = 138413314;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMMessageTypeSessionStartInfoRequest, sent with status:%d error:%@", (uint8_t *)&v19, 0x30u);
  }
  double v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = [*(id *)(a1 + 40) receiverContact];
  id v13 = [v12 sessionStatus];
  [v13 setLastSessionStartInfoRequestDate:v11];

  uint64_t v14 = [*(id *)(a1 + 40) receiverContact];
  BOOL v15 = [v14 sessionStatus];
  uint64_t v16 = [v15 sessionStartInfoRequestCount] + 1;
  uint64_t v17 = [*(id *)(a1 + 40) receiverContact];
  __int16 v18 = [v17 sessionStatus];
  [v18 setSessionStartInfoRequestCount:v16];

  [*(id *)(a1 + 40) updateReceiverContactInStore];
}

- (void)transitionFromInitializingToMissingKeyReleaseInfoDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:8];

  [(SMReceiverCacheManager *)self requestMissingKeyReleaseInfo];
}

- (void)transitionFromActiveToMissingKeyReleaseInfoDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:8];

  [(SMReceiverCacheManager *)self requestMissingKeyReleaseInfo];
}

- (void)requestMissingKeyReleaseInfo
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(SMReceiverCacheManager *)self receiverContact];
  int v8 = [v7 sessionStatus];
  uint64_t v9 = [v8 keyReleaseInfoRequestCount];
  if (v9 < 1)
  {
    __int16 v34 = a2;
  }
  else
  {
    v2 = [(SMReceiverCacheManager *)self receiverContact];
    id v3 = [v2 sessionStatus];
    id v4 = [v3 lastKeyReleaseInfoRequestDate];
    [v4 timeIntervalSinceNow];
    if (v10 > -60.0)
    {

LABEL_9:
      BOOL v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(SMReceiverCacheManager *)self sessionID];
        uint64_t v17 = (objc_class *)objc_opt_class();
        __int16 v18 = NSStringFromClass(v17);
        int v19 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        __int16 v41 = v16;
        __int16 v42 = 2112;
        uint64_t v43 = v18;
        __int16 v44 = 2112;
        __int16 v45 = v19;
        _os_log_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,repeated attempts to request KeyReleaseInfo, drop request", buf, 0x20u);
      }
      goto LABEL_14;
    }
    __int16 v34 = a2;
  }
  double v11 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v12 = [v11 sessionStatus];
  uint64_t v13 = [v12 keyReleaseInfoRequestCount];

  if (v9 >= 1)
  {
  }
  BOOL v14 = v13 <= 5;
  a2 = v34;
  if (!v14) {
    goto LABEL_9;
  }
  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = [(SMReceiverCacheManager *)self sessionID];
    __int16 v22 = (objc_class *)objc_opt_class();
    __int16 v23 = NSStringFromClass(v22);
    id v24 = NSStringFromSelector(v34);
    *(_DWORD *)buf = 138412802;
    __int16 v41 = v21;
    __int16 v42 = 2112;
    uint64_t v43 = v23;
    __int16 v44 = 2112;
    __int16 v45 = v24;
    _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,send keyReleaseInfoRequestMessage", buf, 0x20u);
  }
  id v25 = objc_alloc(MEMORY[0x1E4F998A8]);
  int v26 = [(SMReceiverCacheManager *)self sessionID];
  __int16 v27 = (void *)[v25 initWithSessionID:v26];

  id v28 = [(SMReceiverCacheManager *)self messagingService];
  id v29 = objc_alloc(MEMORY[0x1E4F99838]);
  __int16 v30 = [(SMReceiverCacheManager *)self sessionStatus];
  id v31 = [v30 initiatorHandle];
  id v39 = v31;
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  int v33 = (void *)[v29 initWithReceiverHandles:v32 identifier:0 displayName:0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __54__SMReceiverCacheManager_requestMissingKeyReleaseInfo__block_invoke;
  v35[3] = &unk_1E6B97D90;
  id v36 = v27;
  __int16 v37 = self;
  id v38 = v34;
  BOOL v15 = v27;
  [v28 sendIDSMessage:v15 toConversation:v33 completion:v35];

LABEL_14:
}

void __54__SMReceiverCacheManager_requestMissingKeyReleaseInfo__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [*(id *)(a1 + 32) sessionID];
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    double v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v19 = 138413314;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMMessageTypeKeyReleaseInfoRequest, sent with status:%d error:%@", (uint8_t *)&v19, 0x30u);
  }
  double v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = [*(id *)(a1 + 40) receiverContact];
  uint64_t v13 = [v12 sessionStatus];
  [v13 setLastKeyReleaseInfoRequestDate:v11];

  BOOL v14 = [*(id *)(a1 + 40) receiverContact];
  BOOL v15 = [v14 sessionStatus];
  uint64_t v16 = [v15 keyReleaseInfoRequestCount] + 1;
  uint64_t v17 = [*(id *)(a1 + 40) receiverContact];
  __int16 v18 = [v17 sessionStatus];
  [v18 setKeyReleaseInfoRequestCount:v16];

  [*(id *)(a1 + 40) updateReceiverContactInStore];
}

- (void)transitionFromActiveToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)transitionFromTriggeredToCacheReleasedDueToEvent:(int64_t)a3
{
  id v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:4];

  [(SMReceiverCacheManager *)self fetchSafetyCacheData:a3];
}

- (void)transitionFromCacheReleasedToCacheDownloadFailedDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v3 = [v4 sessionStatus];
  [v3 setSessionState:9];
}

- (void)transitionFromCacheDownloadFailedToCacheReleasedDueToEvent:(int64_t)a3
{
  id v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:4];

  [(SMReceiverCacheManager *)self fetchSafetyCacheData:a3];
}

- (void)transitionFromCacheDownloadFailedToCachePersistenceDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:5];

  [(SMReceiverCacheManager *)self cachePersistenceStartTimer];
}

- (void)transitionFromCacheDownloadFailedToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)transitionFromTriggeredToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)transitionFromCacheReleasedToCachePersistenceDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:5];

  [(SMReceiverCacheManager *)self cachePersistenceStartTimer];
}

- (void)transitionFromCacheReleasedToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)transitionFromCachePersistenceToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self cachePersistenceStopTimer];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)transitionFromMissingSessionInfoToTriggeredDueToEvent:(int64_t)a3
{
  id v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:3];

  [(SMReceiverCacheManager *)self acceptShareInvitation:a3];
}

- (void)transitionFromMissingSessionInfoToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)transitionFromMissingKeyReleaseInfoToTriggeredDueToEvent:(int64_t)a3
{
  id v5 = [(SMReceiverCacheManager *)self receiverContact];
  int64_t v6 = [v5 sessionStatus];
  [v6 setSessionState:3];

  [(SMReceiverCacheManager *)self acceptShareInvitation:a3];
}

- (void)transitionFromMissingKeyReleaseInfoToCleanupDueToEvent:(int64_t)a3
{
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  id v5 = [v4 sessionStatus];
  [v5 setSessionState:6];

  [(SMReceiverCacheManager *)self deleteReceiverContactFromStore:2];
}

- (void)cachePersistenceStartTimer
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  [(SMReceiverCacheManager *)self cachePersistenceStopTimer];
  id v4 = [(SMReceiverCacheManager *)self getCachePersistenceAlarmDate];
  [v4 timeIntervalSinceNow];
  if (v5 <= 0.0)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = [(SMReceiverCacheManager *)self sessionID];
      int v26 = (objc_class *)objc_opt_class();
      __int16 v27 = NSStringFromClass(v26);
      id v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v42 = v25;
      __int16 v43 = 2112;
      id v44 = v27;
      __int16 v45 = 2112;
      id v46 = v28;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache persistence timer expired in the past", buf, 0x20u);
    }
    [(SMReceiverCacheManager *)self onCachePersistenceExpiry];
  }
  else
  {
    objc_initWeak(&location, self);
    int64_t v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    int v8 = [(SMReceiverCacheManager *)self sessionID];
    uint64_t v9 = NSString;
    double v10 = [(SMReceiverCacheManager *)self sessionID];
    double v11 = [v9 stringWithFormat:@"%@.%@", @"com.apple.routined.SMReceiverCacheManager.cachePersistenceTimerIdentifierBase", v10];

    uint64_t v12 = [RTXPCTimerAlarm alloc];
    uint64_t v13 = [(SMReceiverCacheManager *)self queue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __52__SMReceiverCacheManager_cachePersistenceStartTimer__block_invoke;
    v36[3] = &unk_1E6B97F40;
    objc_copyWeak(v39, &location);
    id v14 = v8;
    id v37 = v14;
    id v15 = v7;
    id v38 = v15;
    v39[1] = (id)a2;
    uint64_t v16 = [(RTXPCTimerAlarm *)v12 initWithIdentifier:v11 queue:v13 handler:v36];
    [(SMReceiverCacheManager *)self setCachePersistenceTimerAlarm:v16];

    uint64_t v17 = [(SMReceiverCacheManager *)self cachePersistenceTimerAlarm];
    id v35 = 0;
    [v17 fireWithDate:v4 error:&v35];
    id v18 = v35;

    if (v18)
    {
      int v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v33 = [(SMReceiverCacheManager *)self sessionID];
        uint64_t v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v23 = [v18 localizedDescription];
        *(_DWORD *)buf = 138413058;
        __int16 v42 = v33;
        __int16 v43 = 2112;
        id v44 = v21;
        __int16 v45 = 2112;
        id v46 = v22;
        __int16 v47 = 2112;
        int v48 = v23;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cachePersistenceTimerAlarm fireWithDate hit error: %@", buf, 0x2Au);
      }
    }
    else
    {
      int v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v34 = [(SMReceiverCacheManager *)self sessionID];
        uint64_t v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        id v32 = [v4 stringFromDate];
        *(_DWORD *)buf = 138413058;
        __int16 v42 = v34;
        __int16 v43 = 2112;
        id v44 = v30;
        __int16 v45 = 2112;
        id v46 = v31;
        __int16 v47 = 2112;
        int v48 = v32;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cachePersistenceTimerAlarm scheduled for: %@", buf, 0x2Au);
      }
    }

    objc_destroyWeak(v39);
    objc_destroyWeak(&location);
  }
}

void __52__SMReceiverCacheManager_cachePersistenceStartTimer__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      BOOL v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v11 = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache persistence timer fired", (uint8_t *)&v11, 0x20u);
    }
    [WeakRetained onCachePersistenceExpiry];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      double v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,self not found", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (id)getCachePersistenceAlarmDate
{
  id v3 = [(SMReceiverCacheManager *)self receiverContact];
  id v4 = [v3 sessionStatus];
  uint64_t v5 = [v4 cacheExpiryDate];

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
    [(SMReceiverCacheManager *)self cachePersistenceTime];
    BOOL v7 = [v6 dateWithTimeIntervalSinceNow:];
    uint64_t v8 = [(SMReceiverCacheManager *)self receiverContact];
    uint64_t v9 = [v8 sessionStatus];
    [v9 setCacheExpiryDate:v7];
  }
  double v10 = [(SMReceiverCacheManager *)self receiverContact];
  int v11 = [v10 sessionStatus];
  uint64_t v12 = [v11 cacheExpiryDate];

  return v12;
}

- (void)cachePersistenceStopTimer
{
  id v3 = [(SMReceiverCacheManager *)self cachePersistenceTimerAlarm];

  if (v3)
  {
    id v4 = [(SMReceiverCacheManager *)self cachePersistenceTimerAlarm];
    [v4 invalidate];

    [(SMReceiverCacheManager *)self setCachePersistenceTimerAlarm:0];
  }
}

- (void)_setupCloudKitFunction
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = +[SMCloudKitZone getContainer];
  container = self->_container;
  self->_container = v3;

  uint64_t v5 = [(SMReceiverCacheManager *)self defaultsManager];
  uint64_t v6 = [v5 objectForKey:@"RTDefaultsSafetyCacheUseDevEnvForCloudKitFunction"];
  unsigned int v7 = [v6 BOOLValue];

  uint64_t v8 = v7;
  id v9 = objc_alloc(MEMORY[0x1E4F99828]);
  double v10 = [(SMReceiverCacheManager *)self queue];
  int v11 = (SMCloudKitFunction *)[v9 initWithEnvironment:v8 version:0 queue:v10];
  cloudKitFunction = self->_cloudKitFunction;
  self->_cloudKitFunction = v11;

  __int16 v13 = [(SMReceiverCacheManager *)self defaultsManager];
  uint64_t v14 = [v13 objectForKey:@"RTDefaultsSafetyCachePersistenceTimeKey" value:&unk_1F3453958];
  [v14 doubleValue];
  self->_double cachePersistenceTime = v15;

  if (self->_cachePersistenceTime != 604800.0)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      double cachePersistenceTime = self->_cachePersistenceTime;
      int v18 = 136316162;
      int v19 = "-[SMReceiverCacheManager _setupCloudKitFunction]";
      __int16 v20 = 2080;
      id v21 = "overriding cache persistence time";
      __int16 v22 = 2048;
      uint64_t v23 = 0x4122750000000000;
      __int16 v24 = 2048;
      double v25 = cachePersistenceTime;
      __int16 v26 = 2112;
      __int16 v27 = @"RTDefaultsSafetyCachePersistenceTimeKey";
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v18, 0x34u);
    }
  }
}

- (void)acceptShareInvitation:(int64_t)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ([(SMReceiverCacheManager *)self acceptShareInvitationInProgress])
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(SMReceiverCacheManager *)self sessionID];
      unsigned int v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      NSStringFromSelector(a2);
      id v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      __int16 v56 = v9;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,zone share accept operation already in progress", buf, 0x20u);
    }
  }
  else
  {
    double v10 = [(SMReceiverCacheManager *)self receiverContact];
    int v11 = [v10 sessionStatus];
    int v12 = [v11 zoneShareAccepted];

    if (v12)
    {
      uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = [(SMReceiverCacheManager *)self sessionID];
        uint64_t v14 = (objc_class *)objc_opt_class();
        double v15 = NSStringFromClass(v14);
        NSStringFromSelector(a2);
        uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        __int16 v56 = v16;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,zone share already accepted", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v5 = [(id)objc_opt_class() receiverEventToString:a3];
      uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [(SMReceiverCacheManager *)self sessionID];
        int v19 = (objc_class *)objc_opt_class();
        __int16 v20 = NSStringFromClass(v19);
        NSStringFromSelector(a2);
        id v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2112;
        __int16 v56 = v21;
        LOWORD(v57) = 2112;
        *(void *)((char *)&v57 + 2) = v5;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,event:%@,attempting to accept the zone share", buf, 0x2Au);
      }
      [(SMReceiverCacheManager *)self setAcceptShareInvitationInProgress:1];
      objc_initWeak(&location, self);
      __int16 v45 = [(SMReceiverCacheManager *)self sessionID];
      __int16 v22 = (objc_class *)objc_opt_class();
      id v44 = NSStringFromClass(v22);
      id v23 = objc_alloc(MEMORY[0x1E4F19F68]);
      __int16 v24 = [(SMReceiverCacheManager *)self receiverContact];
      double v25 = [v24 sharingInvitationData];
      __int16 v26 = [(SMReceiverCacheManager *)self receiverContact];
      __int16 v27 = [v26 shareURL];
      uint64_t v28 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v29 = [v28 participantID];
      id v46 = (void *)[v23 initWithSharingInvitationData:v25 shareURL:v27 participantID:v29];

      id v30 = [MEMORY[0x1E4F1C9C8] now];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      __int16 v56 = __Block_byref_object_copy__89;
      *(void *)&long long v57 = __Block_byref_object_dispose__89;
      *((void *)&v57 + 1) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v31 = *(void **)(*(void *)&buf[8] + 40);
      id v32 = NSNumber;
      int v33 = [(SMReceiverCacheManager *)self sessionStatus];
      __int16 v34 = [v32 numberWithInteger:[v33 sessionState]];
      [v31 setValue:v34 forKey:@"receiverSessionState"];

      id v35 = *(void **)(*(void *)&buf[8] + 40);
      id v36 = [NSNumber numberWithInteger:a3];
      [v35 setValue:v36 forKey:@"responseToEvent"];

      id v37 = [(SMReceiverCacheManager *)self sessionID];
      id v38 = [(SMReceiverCacheManager *)self container];
      id v39 = [(SMReceiverCacheManager *)self queue];
      id v40 = [[SMCloudKitQosOptions alloc] initWithDefaultQos:1 masqueradeBundleID:0 xpcActivity:0];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __48__SMReceiverCacheManager_acceptShareInvitation___block_invoke;
      v48[3] = &unk_1E6B987C8;
      int v52 = buf;
      id v41 = v30;
      id v49 = v41;
      objc_copyWeak(v53, &location);
      id v42 = v45;
      id v50 = v42;
      id v43 = v44;
      id v51 = v43;
      v53[1] = (id)a2;
      +[SMCloudKitZone acceptShareWithInvitationToken:v46 sessionID:v37 container:v38 queue:v39 qos:v40 withCompletion:v48];

      objc_destroyWeak(v53);
      _Block_object_dispose(buf, 8);

      objc_destroyWeak(&location);
    }
  }
}

void __48__SMReceiverCacheManager_acceptShareInvitation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  unsigned int v7 = [NSNumber numberWithBool:a2];
  [v6 setValue:v7 forKey:@"wasSuccessful"];

  if (v5)
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v9 = NSString;
    double v10 = [v5 domain];
    int v11 = [v9 stringWithFormat:@"%@:%d", v10, [v5 code]];
    [v8 setValue:v11 forKey:@"shareAcceptanceError"];
  }
  int v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v14 = v13;

  double v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v16 = [NSNumber numberWithDouble:v14];
  [v15 setValue:v16 forKey:@"timeToAcceptShare"];

  AnalyticsSendEvent();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v18 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setAcceptShareInvitationInProgress:0];
    [v18 onShareInvitationAcceptenceResult:a2 withError:v5];
  }
  else
  {
    int v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      __int16 v22 = NSStringFromSelector(*(SEL *)(a1 + 72));
      *(_DWORD *)buf = 138413314;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v22;
      __int16 v29 = 1024;
      int v30 = a2;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache manager released before zone share acceptence returned,success,%d,error,%@", buf, 0x30u);
    }
  }
}

- (void)fetchSafetyCacheData:(int64_t)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(SMReceiverCacheManager *)self receiverContact];
  unsigned int v7 = [v6 sessionStatus];
  [v7 setCacheDownloadError:0];

  uint64_t v8 = [(SMReceiverCacheManager *)self receiverContact];
  id v9 = [v8 sessionStatus];
  uint64_t v10 = [v9 sessionState];

  if (v10 == 4)
  {
    int v11 = [(SMReceiverCacheManager *)self receiverContact];
    int v12 = [v11 sessionStatus];
    char v13 = [v12 zoneShareAccepted];

    if (v13)
    {
      [(SMReceiverCacheManager *)self setSafetyCacheFetchPending:0];
      uint64_t v65 = [MEMORY[0x1E4F1C9C8] now];
      objc_initWeak(&location, self);
      double v14 = [(SMReceiverCacheManager *)self sessionID];
      double v15 = (objc_class *)objc_opt_class();
      int v64 = NSStringFromClass(v15);
      uint64_t v16 = [(SMReceiverCacheManager *)self receiverContact];
      uint64_t v17 = [v16 allowReadToken];
      int v18 = [v17 base64EncodedStringWithOptions:0];

      v66 = [(id)objc_opt_class() receiverEventToString:a3];
      BOOL v19 = a3 == 15 || a3 == 6;
      if (a3 == 15 || a3 == 6) {
        [(SMReceiverCacheManager *)self startCacheDownloadTimeoutTimer];
      }
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(SMReceiverCacheManager *)self sessionID];
        __int16 v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2112;
        __int16 v77 = v24;
        LOWORD(v78) = 2112;
        *(void *)((char *)&v78 + 2) = v66;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,event:%@,requesting Safety Cache", buf, 0x2Au);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      __int16 v77 = __Block_byref_object_copy__89;
      *(void *)&long long v78 = __Block_byref_object_dispose__89;
      *((void *)&v78 + 1) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      __int16 v25 = *(void **)(*(void *)&buf[8] + 40);
      uint64_t v26 = [NSNumber numberWithInteger:a3];
      [v25 setValue:v26 forKey:@"responseToEvent"];

      __int16 v27 = *(void **)(*(void *)&buf[8] + 40);
      uint64_t v28 = NSNumber;
      __int16 v29 = [(SMReceiverCacheManager *)self receiverContact];
      int v30 = [v29 allowReadToken];
      __int16 v31 = [v28 numberWithInt:v30 != 0];
      [v27 setValue:v31 forKey:@"tokenAvailable"];

      id v32 = *(void **)(*(void *)&buf[8] + 40);
      uint64_t v33 = NSNumber;
      __int16 v34 = [(SMReceiverCacheManager *)self receiverContact];
      id v35 = [v34 sessionStatus];
      id v36 = [v33 numberWithInt:objc_msgSend(v35, "triggerType") == 15];
      [v32 setValue:v36 forKey:@"cacheReleasedViaScheduledSend"];

      id v37 = [(SMReceiverCacheManager *)self cloudKitFunction];
      id v38 = [v14 UUIDString];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __47__SMReceiverCacheManager_fetchSafetyCacheData___block_invoke;
      v67[3] = &unk_1E6B987F0;
      id v39 = v65;
      id v68 = v39;
      v72 = buf;
      objc_copyWeak(v73, &location);
      id v40 = v14;
      id v69 = v40;
      id v41 = v64;
      v73[1] = (id)a2;
      id v70 = v41;
      int v71 = self;
      BOOL v74 = v19;
      [v37 requestSafetyCacheRecordFromZone:v38 withToken:v18 completion:v67];

      objc_destroyWeak(v73);
      _Block_object_dispose(buf, 8);

      objc_destroyWeak(&location);
    }
    else
    {
      id v44 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        __int16 v45 = [(SMReceiverCacheManager *)self sessionID];
        id v46 = (objc_class *)objc_opt_class();
        __int16 v47 = NSStringFromClass(v46);
        NSStringFromSelector(a2);
        int v48 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v45;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v47;
        *(_WORD *)&buf[22] = 2112;
        __int16 v77 = v48;
        _os_log_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,initiate zone share accept process", buf, 0x20u);
      }
      [(SMReceiverCacheManager *)self setSafetyCacheFetchPending:1];
      [(SMReceiverCacheManager *)self acceptShareInvitation:a3];
    }
  }
  else
  {
    id v42 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v49 = [(SMReceiverCacheManager *)self sessionID];
      id v50 = (objc_class *)objc_opt_class();
      id v51 = NSStringFromClass(v50);
      NSStringFromSelector(a2);
      int v52 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      BOOL v53 = (void *)MEMORY[0x1E4F998F8];
      __int16 v54 = [(SMReceiverCacheManager *)self receiverContact];
      id v55 = [v54 sessionStatus];
      __int16 v56 = [v53 convertSessionStateToString:[v55 sessionState]];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v49;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2112;
      __int16 v77 = v52;
      LOWORD(v78) = 2112;
      *(void *)((char *)&v78 + 2) = v56;
      _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,tried to fetch safety cache in state: %@", buf, 0x2Au);
    }
    id v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      long long v57 = (objc_class *)objc_opt_class();
      uint64_t v58 = NSStringFromClass(v57);
      __int16 v59 = NSStringFromSelector(a2);
      uint64_t v60 = (void *)MEMORY[0x1E4F998F8];
      uint64_t v61 = [(SMReceiverCacheManager *)self receiverContact];
      double v62 = [v61 sessionStatus];
      [v60 convertSessionStateToString:[v62 sessionState]];
      __int16 v63 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v59;
      *(_WORD *)&buf[22] = 2112;
      __int16 v77 = v63;
      _os_log_fault_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,%@,%@,tried to fetch safety cache in state: %@", buf, 0x20u);
    }
  }
}

void __47__SMReceiverCacheManager_fetchSafetyCacheData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v9 = v8;

  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  int v11 = [NSNumber numberWithDouble:v9];
  [v10 setValue:v11 forKey:@"timeToRequestCache"];

  int v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  char v13 = [NSNumber numberWithInt:v6 == 0];
  [v12 setValue:v13 forKey:@"wasRequestSuccessful"];

  if (v6)
  {
    double v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    double v15 = NSString;
    uint64_t v16 = [v6 domain];
    uint64_t v17 = [v15 stringWithFormat:@"%@:%d", v16, [v6 code]];
    [v14 setValue:v17 forKey:@"cacheRequestError"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
    uint64_t v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v78 = *(void *)(a1 + 40);
      uint64_t v79 = *(void *)(a1 + 48);
      v80 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 138413314;
      uint64_t v87 = v78;
      __int16 v88 = 2112;
      uint64_t v89 = v79;
      __int16 v90 = 2112;
      int v91 = v80;
      __int16 v92 = 2112;
      id v93 = v6;
      __int16 v94 = 2112;
      id v95 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cache manager released before request Safety Cache returned,error,%@,record,%@", buf, 0x34u);
    }
    goto LABEL_23;
  }
  BOOL v19 = [*(id *)(a1 + 56) defaultsManager];
  uint64_t v20 = [v19 objectForKey:@"RTDefaultsMockTimeoutNextReceiverSafetyCacheDownload"];
  int v21 = [v20 BOOLValue];

  if (!v21)
  {
    __int16 v27 = [*(id *)(a1 + 56) defaultsManager];
    uint64_t v28 = [v27 objectForKey:@"RTDefaultsMockFailNextReceiverSafetyCacheDownload"];
    int v29 = [v28 BOOLValue];

    int v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    __int16 v31 = v30;
    if (!v6 && !v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(a1 + 40);
        uint64_t v33 = *(void *)(a1 + 48);
        __int16 v34 = NSStringFromSelector(*(SEL *)(a1 + 80));
        *(_DWORD *)buf = 138413058;
        uint64_t v87 = v32;
        __int16 v88 = 2112;
        uint64_t v89 = v33;
        __int16 v90 = 2112;
        int v91 = v34;
        __int16 v92 = 2112;
        id v93 = v5;
        _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,request for safety cache record successful,record,%@", buf, 0x2Au);
      }
      id v35 = [v5 encryptedValues];
      __int16 v22 = [v35 objectForKeyedSubscript:@"PhoneSafetyCacheEncryptedData"];

      id v36 = [v5 encryptedValues];
      id v37 = [v36 objectForKeyedSubscript:@"WatchSafetyCacheEncryptedData"];

      unint64_t v38 = [v22 length];
      id v39 = [*(id *)(a1 + 56) receiverContact];
      id v84 = v5;
      unint64_t v40 = [v39 maxPhoneCacheSize];

      if (v38 <= v40) {
        unint64_t v38 = v40;
      }
      id v41 = [*(id *)(a1 + 56) receiverContact];
      [v41 setMaxPhoneCacheSize:v38];

      unint64_t v42 = [v37 length];
      id v43 = [*(id *)(a1 + 56) receiverContact];
      unint64_t v44 = [v43 maxWatchCacheSize];

      if (v42 <= v44) {
        unint64_t v42 = v44;
      }
      __int16 v45 = [*(id *)(a1 + 56) receiverContact];
      [v45 setMaxWatchCacheSize:v42];

      uint64_t v46 = *(unsigned __int8 *)(a1 + 88);
      uint64_t v47 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v47 + 40);
      [WeakRetained decryptAndStoreSafetyCacheDataWithPhoneCacheData:v22 watchCacheData:v37 userInitiatedDownload:v46 metricsDict:&obj];
      objc_storeStrong((id *)(v47 + 40), obj);
      int v48 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v49 = [NSNumber numberWithUnsignedInteger:-[v22 length] >> 10];
      [v48 setValue:v49 forKey:@"phoneCacheSize"];

      id v50 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v51 = [NSNumber numberWithUnsignedInteger:(unint64_t)[v37 length] >> 10];
      [v50 setValue:v51 forKey:@"watchCacheSize"];

      int v52 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      BOOL v53 = NSNumber;
      __int16 v54 = [WeakRetained phoneCache];
      id v55 = [v54 locationsDuringSession];
      __int16 v56 = [v53 numberWithUnsignedInteger:[v55 count]];
      [v52 setValue:v56 forKey:@"phoneNumLocationsInTrace"];

      long long v57 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v58 = NSNumber;
      __int16 v59 = [WeakRetained watchCache];
      uint64_t v60 = [v59 locationsDuringSession];
      uint64_t v61 = [v58 numberWithUnsignedInteger:[v60 count]];
      [v57 setValue:v61 forKey:@"watchNumLocationsInTrace"];

      double v62 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      __int16 v63 = NSNumber;
      int v64 = [WeakRetained phoneCache];
      uint64_t v65 = [v64 locationsDuringSession];
      v66 = [v63 numberWithInt:[v65 count] != 0];
      [v62 setValue:v66 forKey:@"phoneLocationHistoryAvailable"];

      int v67 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v68 = NSNumber;
      id v69 = [WeakRetained watchCache];
      id v70 = [v69 locationsDuringSession];
      int v71 = [v68 numberWithInt:[v70 count] != 0];
      [v67 setValue:v71 forKey:@"watchLocationHistoryAvailable"];

      id v5 = v84;
      v72 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      __int16 v73 = NSNumber;
      +[RTRuntime footprint];
      BOOL v74 = [v73 numberWithDouble:];
      [v72 setValue:v74 forKey:@"processFootprint"];

      AnalyticsSendEvent();
      goto LABEL_19;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v81 = *(void *)(a1 + 40);
      uint64_t v82 = *(void *)(a1 + 48);
      int v83 = NSStringFromSelector(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 138413058;
      uint64_t v87 = v81;
      __int16 v88 = 2112;
      uint64_t v89 = v82;
      __int16 v90 = 2112;
      int v91 = v83;
      __int16 v92 = 2112;
      id v93 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,request cache failed with error %@", buf, 0x2Au);
    }
    [WeakRetained onCacheDownloadResult:0 userInitiatedDownload:*(unsigned __int8 *)(a1 + 88) withError:v6];
LABEL_23:
    int v75 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    BOOL v76 = NSNumber;
    +[RTRuntime footprint];
    __int16 v77 = [v76 numberWithDouble:];
    [v75 setValue:v77 forKey:@"processFootprint"];

    AnalyticsSendEvent();
    goto LABEL_24;
  }
  __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    __int16 v25 = NSStringFromSelector(*(SEL *)(a1 + 80));
    *(_DWORD *)buf = 138413058;
    uint64_t v87 = v23;
    __int16 v88 = 2112;
    uint64_t v89 = v24;
    __int16 v90 = 2112;
    int v91 = v25;
    __int16 v92 = 2112;
    id v93 = v5;
    _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,mock timing out safety cache record request,%@", buf, 0x2Au);
  }
LABEL_19:

LABEL_24:
}

- (void)decryptAndStoreSafetyCacheDataWithPhoneCacheData:(id)a3 watchCacheData:(id)a4 userInitiatedDownload:(BOOL)a5 metricsDict:(id *)a6
{
  BOOL v111 = a5;
  v129[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = objc_opt_new();
  int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  uint64_t v113 = v9;
  if (v9)
  {
    double v14 = v11;
    id v15 = v10;
    if (v13)
    {
      uint64_t v16 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      BOOL v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v117 = v16;
      __int16 v118 = 2112;
      v119 = v18;
      __int16 v120 = 2112;
      v121 = v19;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,decrypting phone safety cache data", buf, 0x20u);
    }
    uint64_t v20 = [(SMReceiverCacheManager *)self receiverContact];
    int v21 = [v20 safetyCacheKey];
    __int16 v22 = [(SMReceiverCacheManager *)self sessionID];
    id v115 = 0;
    uint64_t v23 = +[SMCryptoUtilities decryptSafetyCache:v113 key:v21 sessionID:v22 role:@"Receiver" device:1 metricsDict:a6 hashString:&v115];
    id v24 = v115;

    id v25 = *a6;
    uint64_t v26 = NSNumber;
    __int16 v27 = [(id)v23 workoutEvents];
    uint64_t v28 = [v26 numberWithUnsignedInteger:[v27 count]];
    [v25 setValue:v28 forKey:@"phoneNumWorkoutEvents"];

    int v29 = [(id)v23 locationsDuringSession];
    unint64_t v30 = [v29 count];

    __int16 v31 = [(SMReceiverCacheManager *)self receiverContact];
    unint64_t v32 = [v31 maxLocationsInPhoneCacheTrace];

    if (v30 <= v32) {
      unint64_t v33 = v32;
    }
    else {
      unint64_t v33 = v30;
    }
    __int16 v34 = [(SMReceiverCacheManager *)self receiverContact];
    [v34 setMaxLocationsInPhoneCacheTrace:v33];

    id v35 = [(id)v23 workoutEvents];
    unint64_t v36 = [v35 count];

    id v37 = [(SMReceiverCacheManager *)self receiverContact];
    unint64_t v38 = [v37 phoneMaxWorkoutEvents];

    if (v36 <= v38) {
      unint64_t v39 = v38;
    }
    else {
      unint64_t v39 = v36;
    }
    unint64_t v40 = [(SMReceiverCacheManager *)self receiverContact];
    [v40 setPhoneMaxWorkoutEvents:v39];

    if (v23)
    {
      id v41 = [(SMReceiverCacheManager *)self sessionID];
      int v11 = v14;
      [(id)v23 logCacheForSessionID:v41 role:@"Receiver" deviceType:@"phone" transaction:v14 hashString:v24];
    }
    else
    {
      int v48 = (void *)MEMORY[0x1E4F99818];
      id v41 = [(SMReceiverCacheManager *)self sessionID];
      int v11 = v14;
      [v48 logNoCacheDataForSessionID:v41 role:@"Receiver" deviceType:@"phone" transaction:v14];
    }

    id v10 = v15;
  }
  else
  {
    if (v13)
    {
      unint64_t v42 = [(SMReceiverCacheManager *)self sessionID];
      id v43 = (objc_class *)objc_opt_class();
      unint64_t v44 = NSStringFromClass(v43);
      NSStringFromSelector(a2);
      uint64_t v46 = v45 = v11;
      *(_DWORD *)buf = 138412802;
      v117 = v42;
      __int16 v118 = 2112;
      v119 = v44;
      __int16 v120 = 2112;
      v121 = v46;
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no phone safety cache data", buf, 0x20u);

      int v11 = v45;
    }

    [*a6 setValue:&unk_1F3451500 forKey:@"phoneCacheDecryptionResult"];
    uint64_t v47 = (void *)MEMORY[0x1E4F99818];
    id v24 = [(SMReceiverCacheManager *)self sessionID];
    [v47 logNoCacheDataForSessionID:v24 role:@"Receiver" deviceType:@"phone" transaction:v11];
    uint64_t v23 = 0;
  }

  id v49 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    v110 = v11;
    if (v50)
    {
      id v51 = [(SMReceiverCacheManager *)self sessionID];
      int v52 = (objc_class *)objc_opt_class();
      BOOL v53 = NSStringFromClass(v52);
      __int16 v54 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v117 = v51;
      __int16 v118 = 2112;
      v119 = v53;
      __int16 v120 = 2112;
      v121 = v54;
      _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,decrypting watch safety cache data", buf, 0x20u);
    }
    id v55 = [(SMReceiverCacheManager *)self receiverContact];
    __int16 v56 = [v55 safetyCacheKey];
    long long v57 = [(SMReceiverCacheManager *)self sessionID];
    id v114 = 0;
    id v58 = v10;
    uint64_t v59 = +[SMCryptoUtilities decryptSafetyCache:v10 key:v56 sessionID:v57 role:@"Receiver" device:2 metricsDict:a6 hashString:&v114];
    id v60 = v114;

    uint64_t v61 = [(id)v59 locationsDuringSession];
    unint64_t v62 = [v61 count];

    __int16 v63 = [(SMReceiverCacheManager *)self receiverContact];
    unint64_t v64 = [v63 maxLocationsInWatchCacheTrace];

    if (v62 <= v64) {
      unint64_t v65 = v64;
    }
    else {
      unint64_t v65 = v62;
    }
    v66 = [(SMReceiverCacheManager *)self receiverContact];
    [v66 setMaxLocationsInWatchCacheTrace:v65];

    id v67 = *a6;
    id v68 = NSNumber;
    id v69 = [(id)v59 workoutEvents];
    id v70 = [v68 numberWithUnsignedInteger:[v69 count]];
    [v67 setValue:v70 forKey:@"watchNumWorkoutEvents"];

    int v71 = [(id)v59 workoutEvents];
    unint64_t v72 = [v71 count];

    __int16 v73 = [(SMReceiverCacheManager *)self receiverContact];
    unint64_t v74 = [v73 watchMaxWorkoutEvents];

    if (v72 <= v74) {
      unint64_t v75 = v74;
    }
    else {
      unint64_t v75 = v72;
    }
    BOOL v76 = [(SMReceiverCacheManager *)self receiverContact];
    [v76 setWatchMaxWorkoutEvents:v75];

    if (v59)
    {
      __int16 v77 = [(SMReceiverCacheManager *)self sessionID];
      int v11 = v110;
      [(id)v59 logCacheForSessionID:v77 role:@"Receiver" deviceType:@"watch" transaction:v110 hashString:v60];
    }
    else
    {
      id v84 = (void *)MEMORY[0x1E4F99818];
      __int16 v77 = [(SMReceiverCacheManager *)self sessionID];
      int v11 = v110;
      [v84 logNoCacheDataForSessionID:v77 role:@"Receiver" deviceType:@"watch" transaction:v110];
    }

    [(SMReceiverCacheManager *)self updateReceiverContactInStore];
    id v10 = v58;
  }
  else
  {
    if (v50)
    {
      uint64_t v78 = [(SMReceiverCacheManager *)self sessionID];
      uint64_t v79 = (objc_class *)objc_opt_class();
      v80 = NSStringFromClass(v79);
      uint64_t v81 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v117 = v78;
      __int16 v118 = 2112;
      v119 = v80;
      __int16 v120 = 2112;
      v121 = v81;
      _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no watch safety cache data", buf, 0x20u);
    }
    [*a6 setValue:&unk_1F3451500 forKey:@"watchCacheDecryptionResult"];
    uint64_t v82 = (void *)MEMORY[0x1E4F99818];
    int v83 = [(SMReceiverCacheManager *)self sessionID];
    [v82 logNoCacheDataForSessionID:v83 role:@"Receiver" deviceType:@"watch" transaction:v11];

    [(SMReceiverCacheManager *)self updateReceiverContactInStore];
    if (!v113)
    {
      int v99 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        int64_t v106 = [(SMReceiverCacheManager *)self sessionID];
        __int16 v107 = (objc_class *)objc_opt_class();
        v108 = NSStringFromClass(v107);
        __int16 v109 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v117 = v106;
        __int16 v118 = 2112;
        v119 = v108;
        __int16 v120 = 2112;
        v121 = v109;
        _os_log_error_impl(&dword_1D9BFA000, v99, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no safety cache data present", buf, 0x20u);
      }
      uint64_t v128 = *MEMORY[0x1E4F28568];
      v100 = [NSString stringWithFormat:@"no safety cache data"];
      v129[0] = v100;
      uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:&v128 count:1];

      __int16 v88 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v89 = *MEMORY[0x1E4F99A48];
      uint64_t v90 = 47;
      goto LABEL_44;
    }
    uint64_t v59 = 0;
  }
  v85 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v86 = v85;
  if (!(v23 | v59))
  {
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      v102 = [(SMReceiverCacheManager *)self sessionID];
      int64_t v103 = (objc_class *)objc_opt_class();
      int64_t v104 = NSStringFromClass(v103);
      v105 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v117 = v102;
      __int16 v118 = 2112;
      v119 = v104;
      __int16 v120 = 2112;
      v121 = v105;
      _os_log_error_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,no decrypted safety cache data present", buf, 0x20u);
    }
    uint64_t v126 = *MEMORY[0x1E4F28568];
    uint64_t v87 = [NSString stringWithFormat:@"no decrypted safety cache data"];
    v127 = v87;
    uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];

    __int16 v88 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v89 = *MEMORY[0x1E4F99A48];
    uint64_t v90 = 48;
LABEL_44:
    v101 = [v88 errorWithDomain:v89 code:v90 userInfo:v59];
    [(SMReceiverCacheManager *)self onCacheDownloadResult:0 userInitiatedDownload:v111 withError:v101];

    goto LABEL_45;
  }
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    int v91 = [(SMReceiverCacheManager *)self sessionID];
    __int16 v92 = (objc_class *)objc_opt_class();
    id v93 = NSStringFromClass(v92);
    __int16 v94 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    v117 = v91;
    __int16 v118 = 2112;
    v119 = v93;
    __int16 v120 = 2112;
    v121 = v94;
    __int16 v122 = 1024;
    BOOL v123 = v23 != 0;
    __int16 v124 = 1024;
    BOOL v125 = v59 != 0;
    _os_log_impl(&dword_1D9BFA000, v86, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully decrypted safety cache data for,phone,%d,watch,%d", buf, 0x2Cu);
  }
  id v95 = [(SMReceiverCacheManager *)self receiverContact];
  [v95 setPhoneCache:v23];

  uint64_t v96 = [(SMReceiverCacheManager *)self receiverContact];
  [v96 setWatchCache:v59];

  double v97 = [MEMORY[0x1E4F1C9C8] now];
  v98 = [(SMReceiverCacheManager *)self receiverContact];
  [v98 setSyncDate:v97];

  [(SMReceiverCacheManager *)self onCacheDownloadResult:1 userInitiatedDownload:v111 withError:0];
LABEL_45:
}

- (void)storeReceiverContactInStore:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(SMReceiverCacheManager *)self receiverContactStoreInProgress];
  unsigned int v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  double v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = [(SMReceiverCacheManager *)self sessionID];
      id v10 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v10);
      int v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      int v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMReceiverContact store operation already in progress", buf, 0x20u);
    }
    [(SMReceiverCacheManager *)self setReceiverContactUpdatePending:1];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(SMReceiverCacheManager *)self sessionID];
      double v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      uint64_t v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      int v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,storing SMReceiverContact in store", buf, 0x20u);
    }
    [(SMReceiverCacheManager *)self setReceiverContactStoreInProgress:1];
    uint64_t v17 = [(SMReceiverCacheManager *)self safetyCacheStore];
    int v18 = [(SMReceiverCacheManager *)self receiverContact];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke;
    v19[3] = &unk_1E6B98818;
    v19[4] = self;
    v19[5] = a2;
    v19[6] = a3;
    [v17 storeReceiverContact:v18 handler:v19];
  }
}

void __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke_2;
  v8[3] = &unk_1E6B97C78;
  uint64_t v5 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __54__SMReceiverCacheManager_storeReceiverContactInStore___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setReceiverContactStoreInProgress:0];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v12 = [*(id *)(a1 + 32) sessionID];
      BOOL v13 = (objc_class *)objc_opt_class();
      double v14 = NSStringFromClass(v13);
      id v15 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 56);
      int v18 = 138413314;
      BOOL v19 = v12;
      __int16 v20 = 2112;
      int v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 1024;
      int v27 = v17;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to store receiver contact with error %@, retries left %d", (uint8_t *)&v18, 0x30u);
    }
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 32);
    if (v5) {
      return [v6 storeReceiverContactInStore:v5 - 1];
    }
    else {
      return [v6 setReceiverContactUpdatePending:0];
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = [*(id *)(a1 + 32) sessionID];
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v18 = 138412802;
      BOOL v19 = v8;
      __int16 v20 = 2112;
      int v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully stored receiver contact", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 32) setReceiverContactStored:1];
    uint64_t result = [*(id *)(a1 + 32) receiverContactUpdatePending];
    if (result)
    {
      [*(id *)(a1 + 32) setReceiverContactUpdatePending:0];
      return [*(id *)(a1 + 32) updateReceiverContactInStore];
    }
  }
  return result;
}

- (void)updateReceiverContactInStore
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(SMReceiverCacheManager *)self receiverContactStored])
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(SMReceiverCacheManager *)self sessionID];
      id v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      __int16 v22 = v6;
      __int16 v23 = 2112;
      __int16 v24 = v8;
      __int16 v25 = 2112;
      __int16 v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v4;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,updating SMReceiverContact in store,transaction,%@", buf, 0x2Au);
    }
    uint64_t v10 = [(SMReceiverCacheManager *)self safetyCacheStore];
    uint64_t v11 = [(SMReceiverCacheManager *)self receiverContact];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__SMReceiverCacheManager_updateReceiverContactInStore__block_invoke;
    v18[3] = &unk_1E6B94130;
    id v19 = v4;
    SEL v20 = a2;
    v18[4] = self;
    id v12 = v4;
    [v10 updateReceiverContact:v11 handler:v18];
  }
  else
  {
    BOOL v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = [(SMReceiverCacheManager *)self sessionID];
      id v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      uint64_t v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v22 = v14;
      __int16 v23 = 2112;
      __int16 v24 = v16;
      __int16 v25 = 2112;
      __int16 v26 = v17;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,SMReceiverContact not yet stored", buf, 0x20u);
    }
    [(SMReceiverCacheManager *)self storeReceiverContactInStore:2];
  }
}

void __54__SMReceiverCacheManager_updateReceiverContactInStore__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(a1 + 32) sessionID];
      id v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v10 = *(void *)(a1 + 40);
      int v13 = 138413314;
      double v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      int v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to update SMReceiverContact in store,transaction,%@,error,%@", (uint8_t *)&v13, 0x34u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 32) sessionID];
    uint64_t v11 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v11);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138413058;
    double v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    int v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully updated SMReceiverContact in store,transaction,%@", (uint8_t *)&v13, 0x2Au);
    goto LABEL_6;
  }
}

- (void)deleteReceiverContactFromStore:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(SMReceiverCacheManager *)self sessionID];
    double v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    uint64_t v11 = [(SMReceiverCacheManager *)self receiverContact];
    uint64_t v12 = [v11 identifier];
    *(_DWORD *)buf = 138413058;
    __int16 v17 = v7;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,deleting SMReceiverContact from store with identifier %@", buf, 0x2Au);
  }
  int v13 = [(SMReceiverCacheManager *)self safetyCacheStore];
  double v14 = [(SMReceiverCacheManager *)self receiverContact];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__SMReceiverCacheManager_deleteReceiverContactFromStore___block_invoke;
  v15[3] = &unk_1E6B98818;
  v15[4] = self;
  v15[5] = a2;
  v15[6] = a3;
  [v13 removeReceiverContact:v14 handler:v15];
}

void __57__SMReceiverCacheManager_deleteReceiverContactFromStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = [*(id *)(a1 + 32) sessionID];
      uint64_t v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      __int16 v18 = NSStringFromSelector(*(SEL *)(a1 + 40));
      __int16 v19 = [*(id *)(a1 + 32) receiverContact];
      __int16 v20 = [v19 identifier];
      uint64_t v21 = *(void *)(a1 + 48);
      int v22 = 138413570;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      __int16 v25 = v17;
      __int16 v26 = 2112;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      id v31 = v3;
      __int16 v32 = 1024;
      int v33 = v21;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to delete SMReceiverContact from store with identifier %@ and error %@ retries left %d", (uint8_t *)&v22, 0x3Au);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      [*(id *)(a1 + 32) deleteReceiverContactFromStore:v6 - 1];
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) sessionID];
      double v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v11 = [*(id *)(a1 + 32) receiverContact];
      uint64_t v12 = [v11 identifier];
      int v22 = 138413058;
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      __int16 v25 = v9;
      __int16 v26 = 2112;
      __int16 v27 = v10;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,successfully deleted SMReceiverContact from store with identifier %@", (uint8_t *)&v22, 0x2Au);
    }
    [*(id *)(a1 + 32) setReceiverContactStored:0];
    int v13 = [*(id *)(a1 + 32) delegate];
    double v14 = [*(id *)(a1 + 32) sessionID];
    [v13 cacheManagerDidCompleteCleanupForSessionId:v14];
  }
}

+ (id)receiverEventToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return @"Unknown";
  }
  else {
    return off_1E6B988A8[a3 - 1];
  }
}

- (id)computeReceiverSessionMetrics
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v5 = [v4 sessionStatus];
  uint64_t v6 = [v5 sessionStartDate];

  double v7 = -1.0;
  double v8 = -1.0;
  double v9 = -1.0;
  if (v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = [(SMReceiverCacheManager *)self receiverContact];
    uint64_t v12 = [v11 sessionStatus];
    int v13 = [v12 sessionStartDate];
    [v10 timeIntervalSinceDate:v13];
    double v8 = v14 / 60.0;

    __int16 v15 = [(SMReceiverCacheManager *)self receiverContact];
    uint64_t v16 = [v15 sessionStatus];
    __int16 v17 = [v16 estimatedEndDate];

    if (v17)
    {
      __int16 v18 = [(SMReceiverCacheManager *)self receiverContact];
      __int16 v19 = [v18 sessionStatus];
      __int16 v20 = [v19 estimatedEndDate];
      uint64_t v21 = [(SMReceiverCacheManager *)self receiverContact];
      int v22 = [v21 sessionStatus];
      uint64_t v23 = [v22 sessionStartDate];
      [v20 timeIntervalSinceDate:v23];
      double v9 = v24 / 60.0;
    }
  }
  __int16 v25 = [NSNumber numberWithDouble:v8];
  [v3 setValue:v25 forKey:@"actualDuration"];

  __int16 v26 = [NSNumber numberWithDouble:v9];
  [v3 setValue:v26 forKey:@"expectedDuration"];

  __int16 v27 = NSNumber;
  __int16 v28 = [(SMReceiverCacheManager *)self receiverContact];
  [v28 timeTillFirstSuccessfulCacheDownload];
  uint64_t v29 = [v27 numberWithDouble:];
  [v3 setValue:v29 forKey:@"cacheAge"];

  __int16 v30 = NSNumber;
  id v31 = [(SMReceiverCacheManager *)self receiverContact];
  __int16 v32 = [v30 numberWithLongLong:[v31 numCacheDownloads]];
  [v3 setValue:v32 forKey:@"cacheDownloadAttemptCount"];

  int v33 = NSNumber;
  uint64_t v34 = [(SMReceiverCacheManager *)self receiverContact];
  id v35 = [v33 numberWithLongLong:[v34 numSuccessfulCacheDownloads]];
  [v3 setValue:v35 forKey:@"cacheDownloadSuccessCount"];

  if (v8 > 0.0)
  {
    unint64_t v36 = [(SMReceiverCacheManager *)self receiverContact];
    [v36 timeTillCacheRelease];
    double v7 = v37 / v8 * 100.0;
  }
  unint64_t v38 = [NSNumber numberWithDouble:v7];
  [v3 setValue:v38 forKey:@"triggerTimePercent"];

  unint64_t v39 = NSNumber;
  unint64_t v40 = [(SMReceiverCacheManager *)self receiverContact];
  id v41 = [v40 sessionStatus];
  unint64_t v42 = [v39 numberWithUnsignedInteger:[v41 sessionEndReason]];
  [v3 setValue:v42 forKey:@"endReason"];

  id v43 = NSNumber;
  unint64_t v44 = [(SMReceiverCacheManager *)self receiverContact];
  __int16 v45 = [v44 sessionStatus];
  uint64_t v46 = [v43 numberWithInteger:[v45 sessionState]];
  [v3 setValue:v46 forKey:@"maxSessionState"];

  uint64_t v47 = [(SMReceiverCacheManager *)self receiverContact];
  int v48 = [v47 sessionStatus];
  id v49 = [v48 sessionStartDate];

  if (v49)
  {
    BOOL v50 = [(SMReceiverCacheManager *)self receiverContact];
    id v51 = [v50 sessionStatus];
    int v52 = [v51 sessionStartDate];
    unint64_t v53 = 6 * ([v52 hour] / 6uLL);
  }
  else
  {
    unint64_t v53 = -1;
  }
  __int16 v54 = [NSNumber numberWithInteger:v53];
  [v3 setValue:v54 forKey:@"partOfDay"];

  id v55 = NSNumber;
  __int16 v56 = [(SMReceiverCacheManager *)self receiverContact];
  long long v57 = [v56 sessionStatus];
  id v58 = [v55 numberWithUnsignedInteger:[v57 sessionType]];
  [v3 setValue:v58 forKey:@"sessionType"];

  uint64_t v59 = NSNumber;
  id v60 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v61 = [v60 sessionStatus];
  unint64_t v62 = [v59 numberWithUnsignedInteger:[v61 triggerType]];
  [v3 setValue:v62 forKey:@"triggerCategory"];

  __int16 v63 = NSNumber;
  unint64_t v64 = [(SMReceiverCacheManager *)self receiverContact];
  unint64_t v65 = [v63 numberWithInteger:[v64 firstDetailViewSessionState]];
  [v3 setValue:v65 forKey:@"firstDetailViewSessionState"];

  v66 = NSNumber;
  id v67 = [(SMReceiverCacheManager *)self receiverContact];
  id v68 = [v66 numberWithInteger:[v67 lastDetailViewSessionState]];
  [v3 setValue:v68 forKey:@"lastDetailViewSessionState"];

  return v3;
}

- (void)computeResponseModality:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__89;
  unint64_t v44 = __Block_byref_object_dispose__89;
  id v9 = v7;
  id v45 = v9;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__89;
  void v38[4] = __Block_byref_object_dispose__89;
  id v39 = [(SMReceiverCacheManager *)self sessionID];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__89;
  void v36[4] = __Block_byref_object_dispose__89;
  uint64_t v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  id v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__89;
  v34[4] = __Block_byref_object_dispose__89;
  uint64_t v11 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v12 = [v11 sessionStatus];
  int v13 = [v12 initiatorHandle];
  id v35 = [v13 primaryHandle];

  [(id)v41[5] setValue:&unk_1F3451518 forKey:@"firstResponseModality"];
  [(id)v41[5] setValue:&unk_1F3451518 forKey:@"lastResponseModality"];
  double v14 = NSNumber;
  __int16 v15 = [(SMReceiverCacheManager *)self receiverContact];
  uint64_t v16 = [v15 sessionStatus];
  __int16 v17 = [v16 sessionStartDate];
  [v17 timeIntervalSinceReferenceDate];
  __int16 v18 = [v14 numberWithDouble:x0];

  __int16 v19 = NSNumber;
  __int16 v20 = [MEMORY[0x1E4F1C9C8] date];
  [v20 timeIntervalSinceReferenceDate];
  uint64_t v21 = [v19 numberWithDouble:];

  int v22 = [MEMORY[0x1E4F504C8] intent];
  uint64_t v23 = [v22 publisherWithStartTime:v18 endTime:v21 maxEvents:0 lastN:0 reversed:0];

  double v24 = [v23 filterWithIsIncluded:&__block_literal_global_293];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_2;
  v28[3] = &unk_1E6B98860;
  __int16 v30 = v38;
  id v31 = v36;
  SEL v33 = a2;
  id v25 = v8;
  id v29 = v25;
  __int16 v32 = &v40;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_297;
  v27[3] = &unk_1E6B98888;
  v27[4] = v38;
  v27[5] = v36;
  v27[7] = &v40;
  v27[8] = a2;
  v27[6] = v34;
  id v26 = (id)[v24 sinkWithCompletion:v28 receiveInput:v27];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);
}

BOOL __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 eventBody];

  if (v3)
  {
    id v4 = [v2 eventBody];
    uint64_t v5 = [v4 intentClass];

    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (([v5 isEqualToString:v7] & 1) != 0 || objc_msgSend(v5, "isEqualToString:", v9))
    {
      uint64_t v10 = [v2 eventBody];
      BOOL v11 = [v10 interactionDirection] == 2;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v10 = [v3 error];
      id v11 = [v10 description];
      int v14 = 138413058;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      __int16 v20 = 2080;
      uint64_t v21 = [v11 UTF8String];
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry failed to hit Biome completion hanlder with error %s", (uint8_t *)&v14, 0x2Au);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry successfully looped through biome events phone & messages.", (uint8_t *)&v14, 0x20u);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__SMReceiverCacheManager_computeResponseModality_completionHandler___block_invoke_297(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 eventBody];
  uint64_t v7 = [v6 interaction];
  id v46 = 0;
  uint64_t v8 = [v4 unarchivedObjectOfClass:v5 fromData:v7 error:&v46];
  id v9 = v46;

  if (!v9)
  {
    __int16 v16 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v17 = [v3 eventBody];
    [v17 absoluteTimestamp];
    uint64_t v10 = [v16 dateWithTimeIntervalSinceReferenceDate:];

    __int16 v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personHandle.value ==[c] %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    __int16 v19 = [v8 intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v21 = [v8 intent];
    uint64_t v22 = v21;
    if (isKindOfClass)
    {
      uint64_t v23 = [v21 recipients];
      double v24 = [v23 filteredArrayUsingPredicate:v18];

      uint64_t v25 = [v24 count];
      if (v25)
      {
        uint64_t v26 = 1;
LABEL_10:
        __int16 v32 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) valueForKey:@"firstResponseModality"];
        if (![v32 integerValue])
        {
          SEL v33 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          [NSNumber numberWithInteger:v26];
          unint64_t v44 = v18;
          v35 = uint64_t v34 = v32;
          [v33 setValue:v35 forKey:@"firstResponseModality"];

          __int16 v32 = v34;
          __int16 v18 = v44;
        }
        unint64_t v36 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        id v37 = [NSNumber numberWithInteger:v26];
        [v36 setValue:v37 forKey:@"lastResponseModality"];

        unint64_t v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v40 = NSStringFromSelector(*(SEL *)(a1 + 64));
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) valueForKey:@"firstResponseModality"];
          id v41 = v45 = v32;
          uint64_t v42 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) valueForKey:@"lastResponseModality"];
          *(_DWORD *)buf = 138413570;
          uint64_t v48 = v39;
          __int16 v49 = 2112;
          uint64_t v50 = v43;
          __int16 v51 = 2112;
          int v52 = v40;
          __int16 v53 = 1024;
          *(_DWORD *)__int16 v54 = v41;
          *(_WORD *)&v54[4] = 1024;
          *(_DWORD *)&v54[6] = v42;
          __int16 v55 = 2112;
          __int16 v56 = v10;
          _os_log_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@ firstResponseModality: %d, lastResponseModality: %d, timestamp: %@", buf, 0x36u);

          __int16 v32 = v45;
        }
      }
    }
    else
    {
      objc_opt_class();
      char v27 = objc_opt_isKindOfClass();

      if (v27)
      {
        __int16 v28 = [v8 intent];
        id v29 = [v28 contacts];
        __int16 v30 = [v29 filteredArrayUsingPredicate:v18];

        uint64_t v31 = [v30 count];
        if (v31)
        {
          uint64_t v26 = 2;
          goto LABEL_10;
        }
      }
    }

    goto LABEL_16;
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v14 = [v9 description];
    uint64_t v15 = [v14 UTF8String];
    *(_DWORD *)buf = 138413058;
    uint64_t v48 = v11;
    __int16 v49 = 2112;
    uint64_t v50 = v12;
    __int16 v51 = 2112;
    int v52 = v13;
    __int16 v53 = 2080;
    *(void *)__int16 v54 = v15;
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@, SMReceiverTelemetry failed to convert BMIntentEvent --> INInteraction. Error %s", buf, 0x2Au);
  }
LABEL_16:
}

- (SMReceiverCacheManagerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SMReceiverCacheManagerDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SMReceiverContact)receiverContact
{
  return self->_receiverContact;
}

- (void)setReceiverContact:(id)a3
{
}

- (void)setSessionStatus:(id)a3
{
}

- (RTXPCTimerAlarm)cachePersistenceTimerAlarm
{
  return self->_cachePersistenceTimerAlarm;
}

- (void)setCachePersistenceTimerAlarm:(id)a3
{
}

- (RTXPCTimerAlarm)missingKeyReleaseTimerAlarm
{
  return self->_missingKeyReleaseTimerAlarm;
}

- (void)setMissingKeyReleaseTimerAlarm:(id)a3
{
}

- (RTXPCTimerAlarm)cacheDownloadTimeoutTimerAlarm
{
  return self->_cacheDownloadTimeoutTimerAlarm;
}

- (void)setCacheDownloadTimeoutTimerAlarm:(id)a3
{
}

- (BOOL)receiverContactStored
{
  return self->_receiverContactStored;
}

- (void)setReceiverContactStored:(BOOL)a3
{
  self->_receiverContactStored = a3;
}

- (BOOL)receiverContactStoreInProgress
{
  return self->_receiverContactStoreInProgress;
}

- (void)setReceiverContactStoreInProgress:(BOOL)a3
{
  self->_receiverContactStoreInProgress = a3;
}

- (BOOL)receiverContactUpdatePending
{
  return self->_receiverContactUpdatePending;
}

- (void)setReceiverContactUpdatePending:(BOOL)a3
{
  self->_receiverContactUpdatePending = a3;
}

- (BOOL)acceptShareInvitationInProgress
{
  return self->_acceptShareInvitationInProgress;
}

- (void)setAcceptShareInvitationInProgress:(BOOL)a3
{
  self->_acceptShareInvitationInProgress = a3;
}

- (BOOL)safetyCacheFetchPending
{
  return self->_safetyCacheFetchPending;
}

- (void)setSafetyCacheFetchPending:(BOOL)a3
{
  self->_safetyCacheFetchPending = a3;
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKContainer)container
{
  return self->_container;
}

- (SMCloudKitFunction)cloudKitFunction
{
  return self->_cloudKitFunction;
}

- (void)setCloudKitFunction:(id)a3
{
}

- (double)cachePersistenceTime
{
  return self->_cachePersistenceTime;
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (int64_t)cacheDownloadRetryCount
{
  return self->_cacheDownloadRetryCount;
}

- (void)setCacheDownloadRetryCount:(int64_t)a3
{
  self->_cacheDownloadRetryCount = a3;
}

- (int64_t)zoneShareRetryCount
{
  return self->_zoneShareRetryCount;
}

- (void)setZoneShareRetryCount:(int64_t)a3
{
  self->_zoneShareRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_cloudKitFunction, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_cacheDownloadTimeoutTimerAlarm, 0);
  objc_storeStrong((id *)&self->_missingKeyReleaseTimerAlarm, 0);
  objc_storeStrong((id *)&self->_cachePersistenceTimerAlarm, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_receiverContact, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end