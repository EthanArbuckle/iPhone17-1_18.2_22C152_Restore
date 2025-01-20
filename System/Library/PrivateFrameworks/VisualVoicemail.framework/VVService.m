@interface VVService
+ (__CTServerConnection)CTServerConnection;
+ (id)accountDictionaryForURL:(id)a3;
+ (id)serviceWithLabel:(id)a3 accountIdentifier:(id)a4 phoneNumber:(id)a5 name:(id)a6 isoCountryCode:(id)a7 countryCode:(id)a8 networkCode:(id)a9 contextInfo:(id)a10 telephonyClient:(id)a11 stateRequestController:(id)a12 newAccount:(BOOL)a13;
+ (unsigned)_voicemailPowerAssertion;
+ (void)_acquireAssertionsForInsomniaState:(BOOL)a3;
+ (void)_setInsomniaStateSupressed:(BOOL)a3;
+ (void)obtainInsomniaAssertion;
+ (void)releaseInsomniaAssertion;
- (BOOL)_isOfflineDueToRoamingWithDataStatusDict:(__CFDictionary *)a3;
- (BOOL)dataForRecordPending:(void *)a3 progressiveLoadInProgress:(BOOL *)a4;
- (BOOL)doTrashCompaction:(id)a3;
- (BOOL)doesClientManageTrashCompaction;
- (BOOL)greetingAvailable;
- (BOOL)greetingFetchExistsProgressiveLoadInProgress:(BOOL *)a3;
- (BOOL)headerChangesPending;
- (BOOL)ignoresRoamingSwitch;
- (BOOL)isCellularNetworkAvailable;
- (BOOL)isDelayedRetryImmediate;
- (BOOL)isDelayedRetryScheduled;
- (BOOL)isDelayedRetryScheduledGuarded;
- (BOOL)isInSync;
- (BOOL)isMailboxUsageUpdated;
- (BOOL)isMessageWaiting;
- (BOOL)isOfflineDueToRoaming;
- (BOOL)isOnline;
- (BOOL)isPasswordReady;
- (BOOL)isSMSReady;
- (BOOL)isSingleMode;
- (BOOL)isSubscribed;
- (BOOL)isSyncInProgress;
- (BOOL)isWiFiNetworkAvailable;
- (BOOL)isWiFiNetworkReachable;
- (BOOL)isWiFiNetworkSupported;
- (BOOL)lastUsedConnectionTypeWasCellular;
- (BOOL)mailboxRequiresSetup;
- (BOOL)passwordChangeRequiresEnteringOldPassword;
- (BOOL)respectsMWINotifications;
- (BOOL)shouldImmediatelyRetrySyncOverCellular;
- (BOOL)shouldScheduleAutoTrashOnMailboxUsageChange;
- (BOOL)shouldTrashCompactRecord:(id)a3 record:(void *)a4;
- (BOOL)supportsDetachedStorage;
- (BOOL)synchronizationPending;
- (BOOL)taskOfTypeExists:(int64_t)a3;
- (CTXPCContextInfo)contextInfo;
- (Class)notificationInterpreterClass;
- (NSDictionary)accountDictionary;
- (NSMutableDictionary)stateRequestAttemptCount;
- (NSString)accountIdentifier;
- (NSString)serviceICC;
- (NSString)serviceMCC;
- (NSString)serviceMDN;
- (NSString)serviceMNC;
- (NSString)smscAddress;
- (NSURL)accountDir;
- (NSUUID)serviceLabelID;
- (OS_dispatch_queue)serialDispatchQueue;
- (VMCarrierStateRequestController)stateRequestController;
- (VMTelephonyClient)telephonyClient;
- (VMTranscriptionService)transcriptionService;
- (VVService)initWithLabel:(id)a3 accountIdentifier:(id)a4 phoneNumber:(id)a5 isoCountryCode:(id)a6 countryCode:(id)a7 networkCode:(id)a8 contextInfo:(id)a9 telephonyClient:(id)a10 stateRequestController:(id)a11 newAccount:(BOOL)a12;
- (VVVerifier)verifier;
- (__CFString)connectionServiceType;
- (__CFString)dataConnectionServiceTypeOverride;
- (__CFString)lastConnectionTypeUsed;
- (const)getServiceObjLogPrefix;
- (double)trashCompactionAge;
- (id).cxx_construct;
- (id)accountParamsAtFilePath:(id)a3;
- (id)activationError;
- (id)automatedTrashActivityIdentifier;
- (id)carrierParameterValueForKey:(id)a3;
- (id)delayedRetryActivityIdentifier;
- (id)fallbackActivityIdentifier;
- (id)getRetryIntervals;
- (id)mailboxName;
- (id)messageNotificationFallbackTimeout;
- (id)parametersFilePathForUUIDString:(id)a3;
- (id)password;
- (id)passwordIgnoringSubscription:(BOOL)a3;
- (id)provisionalPassword;
- (id)retryIntervals;
- (int)mailboxUsage;
- (int)maximumPasswordLength;
- (int)maximumRecordedNameDuration;
- (int)minimumPasswordLength;
- (int64_t)attemptCountForStateRequest:(id)a3;
- (int64_t)mailboxGreetingType;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)numFailedAttemptsToSyncOverWifi;
- (unint64_t)trashedCount;
- (unint64_t)unreadCount;
- (void)_attemptDelayedSynchronize;
- (void)_attemptScheduledTrashCompaction:(id)a3;
- (void)_callStatusChanged;
- (void)_cancelAutomatedTrashCompaction;
- (void)_cancelIndicatorAction;
- (void)_carrierBundleChanged;
- (void)_deliverFallbackNotification;
- (void)_enterFallbackMode;
- (void)_reactToIndicator;
- (void)_scheduleAutomatedTrashCompaction;
- (void)_scheduleFallbackActivityIfNecessary;
- (void)_setActivationError:(id)a3;
- (void)_setOnline:(BOOL)a3 fallbackMode:(BOOL)a4;
- (void)_updateOnlineStatus;
- (void)cancelAutomatedTrashCompaction;
- (void)cancelDelayedSynchronize:(id)a3;
- (void)cancelNotificationFallback;
- (void)cancelPasswordRequest;
- (void)clearActivationError;
- (void)clearRemoteUIDsForDetachedMessages;
- (void)dealloc;
- (void)displayPasswordRequestIfNecessary;
- (void)handleAirplaneModeChanged:(BOOL)a3;
- (void)handleCallStatusDisconnected:(id)a3;
- (void)handleVVServiceDataAvailableNotification:(id)a3;
- (void)handleVoicemailInfoUpdate:(id)a3;
- (void)incrementAttemptCountForStateRequest:(id)a3;
- (void)kill;
- (void)networkReachabilityChangedSync:(BOOL)a3;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)performSynchronousBlock:(id)a3;
- (void)progressiveDataLengthsForRecord:(void *)a3 expected:(unsigned int *)a4 current:(unsigned int *)a5;
- (void)removeAttemptCountForStateRequest:(id)a3;
- (void)removeServiceInformation;
- (void)reportError:(id)a3;
- (void)reportFailedToSyncOverWifi;
- (void)reportSucessfulSync;
- (void)resetCounts;
- (void)resetDelayedSynchronizationAttemptCount;
- (void)scheduleAutomatedTrashCompaction;
- (void)scheduleDelayedSynchronize;
- (void)scheduleImmediateSynchronizeRetryOverCellular;
- (void)setAccountDictionary:(id)a3;
- (void)setAccountDir:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setCellularNetworkAvailable:(BOOL)a3;
- (void)setContextInfo:(id)a3;
- (void)setDelayedRetryImmediate:(BOOL)a3;
- (void)setDelayedRetryScheduled:(BOOL)a3;
- (void)setGreetingType:(int64_t)a3 data:(id)a4 duration:(unint64_t)a5;
- (void)setLastConnectionTypeUsed:(__CFString *)a3;
- (void)setLastUsedConnectionType:(__CFString *)a3;
- (void)setMailboxRequiresSetup:(BOOL)a3;
- (void)setMailboxUsage:(int)a3;
- (void)setMailboxUsageUpdated:(BOOL)a3;
- (void)setMessageWaiting:(BOOL)a3;
- (void)setNumFailedAttemptsToSyncOverWifi:(unint64_t)a3;
- (void)setOnline:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setProvisionalPassword:(id)a3;
- (void)setSMSReady:(BOOL)a3;
- (void)setServiceICC:(id)a3;
- (void)setServiceLabelID:(id)a3;
- (void)setServiceMCC:(id)a3;
- (void)setServiceMDN:(id)a3;
- (void)setServiceMNC:(id)a3;
- (void)setSmscAddress:(id)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTranscriptionService:(id)a3;
- (void)setTrashedCount:(unint64_t)a3;
- (void)setUnreadCount:(unint64_t)a3;
- (void)setVerifier:(id)a3;
- (void)setWiFiNetworkReachable:(BOOL)a3;
- (void)setWiFiNetworkSupported:(BOOL)a3;
- (void)start;
- (void)stateChanged:(id)a3;
- (void)updateCountsForChangedFlags:(unsigned int)a3 currentRecordFlags:(unsigned int)a4;
@end

@implementation VVService

- (double)trashCompactionAge
{
  [(NSRecursiveLock *)self->_lock lock];
  double trashCompactionAge = self->_trashCompactionAge;
  if (trashCompactionAge < 0.0)
  {
    signed int v4 = [(VVService *)self mailboxUsage];
    signed int v5 = v4;
    unsigned int v6 = 3;
    while (1)
    {
      unsigned int v7 = v6;
      if (*((_DWORD *)&unk_1000A7068 + 4 * v6) <= v4) {
        break;
      }
      --v6;
      if (!v7)
      {
        double v8 = 1.79769313e308;
        goto LABEL_7;
      }
    }
    double v8 = *((double *)&unk_1000A7068 + 2 * v6 + 1);
LABEL_7:
    self->_double trashCompactionAge = v8;
    v9 = sub_100020350();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(VVService *)self getServiceObjLogPrefix];
      int v11 = (int)(self->_trashCompactionAge / 86400.0);
      int v13 = 136315906;
      v14 = v10;
      __int16 v15 = 2080;
      v16 = " ";
      __int16 v17 = 1024;
      int v18 = v11;
      __int16 v19 = 1024;
      signed int v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sTRASH: Trash compactor configured for %d days, given mailbox usage of %d", (uint8_t *)&v13, 0x22u);
    }

    double trashCompactionAge = self->_trashCompactionAge;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return trashCompactionAge;
}

- (BOOL)shouldTrashCompactRecord:(id)a3 record:(void *)a4
{
  id v6 = a3;
  unsigned int v7 = sub_10007939C(v6, (uint64_t)a4);
  if ((v7 & 0x4C) != 8)
  {
    unsigned int v17 = v7;
    int v13 = sub_100020350();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v22 = 136315650;
    v23 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v24 = 2080;
    v25 = " ";
    __int16 v26 = 2048;
    *(void *)&double v27 = v17;
    int v18 = "#I %s%sCOMPACTION: shouldCompactTrashRecord = no, since flags = %lu";
    __int16 v19 = v13;
    uint32_t v20 = 32;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, v20);
    goto LABEL_15;
  }
  [(VVService *)self trashCompactionAge];
  double v9 = v8;
  if (v8 >= 1.79769313e308)
  {
    int v13 = sub_100020350();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v22 = 136315394;
    v23 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v24 = 2080;
    v25 = " ";
    int v18 = "#I %s%sCOMPACTION: shouldCompactTrashRecord = no, since compactionAge >= DBL_MAX";
    __int16 v19 = v13;
    uint32_t v20 = 22;
    goto LABEL_14;
  }
  int v10 = sub_100079140(v6, (uint64_t)a4);
  double v11 = (double)v10;
  double Current = CFAbsoluteTimeGetCurrent();
  int v13 = sub_100020350();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v10 || (double v15 = Current - v11, Current - v11 < v9))
  {
    if (v14)
    {
      int v22 = 136316162;
      v23 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v24 = 2080;
      v25 = " ";
      __int16 v26 = 2048;
      double v27 = Current;
      __int16 v28 = 2048;
      double v29 = (double)v10;
      __int16 v30 = 2048;
      double v31 = v9;
      int v18 = "#I %s%sCOMPACTION: shouldCompactTrashRecord = no, since current time (%f) minus trashed date (%f) < compactionAge (%f)";
      __int16 v19 = v13;
      uint32_t v20 = 52;
      goto LABEL_14;
    }
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }
  if (v14)
  {
    int v22 = 136316162;
    v23 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v24 = 2080;
    v25 = " ";
    __int16 v26 = 2048;
    double v27 = Current;
    __int16 v28 = 2048;
    double v29 = (double)v10;
    __int16 v30 = 2048;
    double v31 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sCOMPACTION: shouldCompactTrashRecord = yes, since current time (%f) minus trashed date (%f) >= compactionAge (%f)", (uint8_t *)&v22, 0x34u);
  }
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (BOOL)doTrashCompaction:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = (const __CFArray *)sub_100079A60(v4, 8, 68);
  if (!v5) {
    goto LABEL_17;
  }
  CFArrayRef v6 = v5;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
    CFRelease(v6);
LABEL_17:
    BOOL v20 = 0;
    goto LABEL_18;
  }
  CFIndex v8 = Count;
  CFIndex v9 = 0;
  char v10 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v9);
    if ([(VVService *)self shouldTrashCompactRecord:v4 record:ValueAtIndex])
    {
      char v12 = sub_10007939C(v4, (uint64_t)ValueAtIndex);
      if (([(VVService *)self supportsDetachedStorage] & ((v12 & 2) >> 1)) != 0) {
        uint64_t v13 = 64;
      }
      else {
        uint64_t v13 = 4;
      }
      sub_1000793E4(v4, ValueAtIndex, v13);
      CFStringRef v14 = VMStoreRecordCopyDescription((uint64_t)ValueAtIndex);
      double v15 = sub_100020350();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [(VVService *)self getServiceObjLogPrefix];
        int v17 = sub_10007901C(v4, (uint64_t)ValueAtIndex);
        double Current = CFAbsoluteTimeGetCurrent();
        int v19 = sub_100079140(v4, (uint64_t)ValueAtIndex);
        *(_DWORD *)buf = 136316162;
        v23 = v16;
        __int16 v24 = 2080;
        v25 = " ";
        __int16 v26 = 1024;
        int v27 = v17;
        __int16 v28 = 2112;
        CFStringRef v29 = v14;
        __int16 v30 = 1024;
        int v31 = (int)((Current - (double)v19) / 86400.0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%sTRASH: UID %u record %@ being deleted by trash compactor (it is %d days old)", buf, 0x2Cu);
      }

      if (v14) {
        CFRelease(v14);
      }
      char v10 = 1;
    }
    ++v9;
  }
  while (v8 != v9);
  CFRelease(v6);
  if ((v10 & 1) == 0) {
    goto LABEL_17;
  }
  [v4 save];
  BOOL v20 = 1;
LABEL_18:

  return v20;
}

- (void)_carrierBundleChanged
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    CFArrayRef v6 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v7 = 2080;
    CFIndex v8 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sResetting cached carrier parameters", (uint8_t *)&v5, 0x16u);
  }

  id carrierParameters = self->_carrierParameters;
  self->_id carrierParameters = 0;

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_callStatusChanged
{
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B6BC;
  block[3] = &unk_1000C1A98;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)serviceWithLabel:(id)a3 accountIdentifier:(id)a4 phoneNumber:(id)a5 name:(id)a6 isoCountryCode:(id)a7 countryCode:(id)a8 networkCode:(id)a9 contextInfo:(id)a10 telephonyClient:(id)a11 stateRequestController:(id)a12 newAccount:(BOOL)a13
{
  HIDWORD(v29) = a13;
  id v30 = a3;
  id v31 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  __int16 v26 = vm_vmd_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v19;
    __int16 v34 = 2112;
    id v35 = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Creating a new service with name: %@, subscription %@", buf, 0x16u);
  }

  if (v19 && [v19 isEqualToString:@"IMAP"])
  {
    LOBYTE(v29) = BYTE4(v29);
    int v27 = [[IMAPService alloc] initWithLabel:v30 accountIdentifier:v31 phoneNumber:v18 isoCountryCode:v20 countryCode:v21 networkCode:v22 contextInfo:v23 telephonyClient:v24 stateRequestController:v25 newAccount:v29];
    [(VVService *)v27 start];
  }
  else
  {
    int v27 = 0;
  }

  return v27;
}

- (VVService)initWithLabel:(id)a3 accountIdentifier:(id)a4 phoneNumber:(id)a5 isoCountryCode:(id)a6 countryCode:(id)a7 networkCode:(id)a8 contextInfo:(id)a9 telephonyClient:(id)a10 stateRequestController:(id)a11 newAccount:(BOOL)a12
{
  id v26 = a3;
  id v27 = a4;
  id v21 = a5;
  id v23 = a6;
  id v22 = a7;
  id v24 = a8;
  id v18 = a9;
  id v25 = a10;
  id v20 = a11;
  v28.receiver = self;
  v28.super_class = (Class)VVService;
  if ([(VVService *)&v28 init]) {
    operator new();
  }

  return 0;
}

- (void)start
{
  dispatch_time_t v3 = [(VVService *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C4E8;
  block[3] = &unk_1000C1A98;
  block[4] = self;
  dispatch_async(v3, block);
}

- (const)getServiceObjLogPrefix
{
  return self->fLogPrefix;
}

- (void)dealloc
{
  dispatch_time_t v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    char v10 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v11 = 2080;
    char v12 = " ";
    __int16 v13 = 2112;
    CFStringRef v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sDeallocating service %@", buf, 0x20u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  int v5 = +[VVMSharedNetworkObserver sharedInstance];
  [v5 removeDelegate:self];

  fPreferencesObserver = self->fPreferencesObserver;
  if (fPreferencesObserver) {
    [(VVMSharedPreferencesObserver *)fPreferencesObserver removeDelegate:self];
  }
  fStatusCallObserver = self->fStatusCallObserver;
  if (fStatusCallObserver) {
    [(VVMSharedCallStatusObserver *)fStatusCallObserver removeDelegate:self];
  }
  [(VVService *)self cancelDelayedSynchronize:@"Dealloc"];
  [(VVService *)self cancelPasswordRequest];
  [(VVService *)self cancelNotificationFallback];
  [(VVService *)self cancelAutomatedTrashCompaction];
  VMStoreDestroy();
  v8.receiver = self;
  v8.super_class = (Class)VVService;
  [(VVService *)&v8 dealloc];
}

- (BOOL)isSubscribed
{
  return (*(unsigned char *)&self->_serviceFlags >> 1) & 1;
}

+ (__CTServerConnection)CTServerConnection
{
  if (qword_1000E0948 != -1) {
    dispatch_once(&qword_1000E0948, &stru_1000C23A8);
  }
  return (__CTServerConnection *)qword_1000E0940;
}

- (id)parametersFilePathForUUIDString:(id)a3
{
  return 0;
}

- (id)accountParamsAtFilePath:(id)a3
{
  return 0;
}

- (void)setSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[NSNotificationCenter defaultCenter];
  char serviceFlags = (char)self->_serviceFlags;
  if (((((serviceFlags & 2) == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_char serviceFlags = serviceFlags & 0xFD | v7;
    objc_super v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFIndex v9 = [(VVService *)self getServiceObjLogPrefix];
      uint64_t v10 = [(VVService *)self contextInfo];
      __int16 v11 = (void *)v10;
      CFStringRef v12 = @"NOT SUBSCRIBED";
      *(_DWORD *)buf = 136315906;
      id v24 = v9;
      __int16 v25 = 2080;
      id v26 = " ";
      if (v3) {
        CFStringRef v12 = @"SUBSCRIBED";
      }
      __int16 v27 = 2112;
      CFStringRef v28 = v12;
      __int16 v29 = 2112;
      uint64_t v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sVisual Voicemail Subscription State is now %@, subscription %@", buf, 0x2Au);
    }
    if (v3)
    {
      passwordError = self->_passwordError;
      self->_passwordError = 0;

      [(id)objc_opt_class() _setInsomniaStateSupressed:0];
      [(VVService *)self resetCounts];
      [(VVService *)self _updateOnlineStatus];
      Boolean AppBooleanValue = CFPreferencesGetAppBooleanValue(@"VoicemailSetupRequired", kVVDefaultsDomain, 0);
      *(unsigned char *)&self->_char serviceFlags = *(unsigned char *)&self->_serviceFlags & 0xE3 | (16 * (AppBooleanValue & 1)) | (8 * (AppBooleanValue & 1)) | (4 * (AppBooleanValue & 1));
      [v5 addObserver:self selector:"handleVVServiceDataAvailableNotification:" name:@"VVServiceDataAvailableNotification" object:0];
    }
    else
    {
      [(id)objc_opt_class() _setInsomniaStateSupressed:1];
      double v15 = [(VVService *)self serialDispatchQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003CBE8;
      block[3] = &unk_1000C1A98;
      block[4] = self;
      dispatch_async(v15, block);

      [(VVService *)self _setActivationError:0];
      [(VVService *)self cancelAutomatedTrashCompaction];
    }
  }
  BOOL v16 = dispatch_get_current_queue();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003CC2C;
  v18[3] = &unk_1000C1B00;
  id v19 = v5;
  id v20 = self;
  BOOL v21 = v3;
  id v17 = v5;
  dispatch_async(v16, v18);
}

- (void)kill
{
  BOOL v3 = [(VVService *)self serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CE38;
  block[3] = &unk_1000C1A98;
  block[4] = self;
  dispatch_async(v3, block);

  [(VVService *)self cancelAutomatedTrashCompaction];
  [(VVService *)self cancelNotificationFallback];
}

- (id)mailboxName
{
  return 0;
}

- (BOOL)mailboxRequiresSetup
{
  return (*(unsigned char *)&self->_serviceFlags >> 2) & 1;
}

- (void)setMailboxRequiresSetup:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  char serviceFlags = (char)self->_serviceFlags;
  if ((((serviceFlags & 4) == 0) ^ v3))
  {
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
  else
  {
    if (v3) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_char serviceFlags = serviceFlags & 0xFB | v7;
    [(NSRecursiveLock *)self->_lock unlock];
    objc_super v8 = objc_opt_class();
    if (v3)
    {
      [v8 _setInsomniaStateSupressed:1];
      [(VVService *)self cancelNotificationFallback];
    }
    else
    {
      [v8 _setInsomniaStateSupressed:0];
      [(VVService *)self setProvisionalPassword:0];
      [(VVService *)self _scheduleFallbackActivityIfNecessary];
    }
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"VVServiceSetupRequirementChangedNotification" object:self];
  }
}

- (int)mailboxUsage
{
  [(NSRecursiveLock *)self->_lock lock];
  int mailboxUsage = self->_mailboxUsage;
  if (mailboxUsage < 0)
  {
    CFStringRef v4 = (const __CFString *)VMStoreCopyMailboxUsage();
    if (v4)
    {
      CFStringRef v5 = v4;
      self->_int mailboxUsage = CFStringGetIntValue(v4);
      CFRelease(v5);
    }
    else
    {
      self->_int mailboxUsage = 0;
    }
    CFArrayRef v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = [(VVService *)self getServiceObjLogPrefix];
      int v8 = self->_mailboxUsage;
      int v10 = 136315650;
      __int16 v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = " ";
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sFetched initial mailbox usage value: %d", (uint8_t *)&v10, 0x1Cu);
    }

    int mailboxUsage = self->_mailboxUsage;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return mailboxUsage;
}

- (void)setMailboxUsage:(int)a3
{
  if (a3 >= 100) {
    int v4 = 100;
  }
  else {
    int v4 = a3;
  }
  uint64_t v5 = v4 & ~(v4 >> 31);
  [(NSRecursiveLock *)self->_lock lock];
  if (v5 == [(VVService *)self mailboxUsage])
  {
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
  else
  {
    self->_int mailboxUsage = v5;
    CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%d", v5);
    VMStoreSetMailboxUsage();
    CFRelease(v7);
    int v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(VVService *)self getServiceObjLogPrefix];
      int mailboxUsage = self->_mailboxUsage;
      *(_DWORD *)buf = 136315650;
      id v17 = v9;
      __int16 v18 = 2080;
      id v19 = " ";
      __int16 v20 = 1024;
      int v21 = mailboxUsage;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sSet new mailbox usage value: %d", buf, 0x1Cu);
    }

    self->_double trashCompactionAge = -1.0;
    if ([(VVService *)self shouldScheduleAutoTrashOnMailboxUsageChange]) {
      [(VVService *)self scheduleAutomatedTrashCompaction];
    }
    [(NSRecursiveLock *)self->_lock unlock];
    __int16 v11 = +[NSNotificationCenter defaultCenter];
    CFStringRef v14 = @"MailboxUsage";
    __int16 v12 = +[NSNumber numberWithInt:self->_mailboxUsage];
    int v15 = v12;
    __int16 v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v11 postNotificationName:@"VVServiceMailboxUsageChangedNotification" object:self userInfo:v13];
  }
}

- (void)updateCountsForChangedFlags:(unsigned int)a3 currentRecordFlags:(unsigned int)a4
{
  if ([(VVService *)self isOnline]) {
    int v7 = 0;
  }
  else {
    int v7 = 2;
  }
  int v8 = VMStoreRecordCopyFlagsDescription(a3);
  id v9 = VMStoreRecordCopyFlagsDescription(a4);
  int v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v21 = 136316162;
    *(void *)&v21[4] = [(VVService *)self getServiceObjLogPrefix];
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = " ";
    *(_WORD *)&v21[22] = 2112;
    id v22 = (id)objc_opt_class();
    *(_WORD *)id v23 = 2112;
    *(void *)&v23[2] = v8;
    *(_WORD *)&v23[10] = 2112;
    *(void *)&v23[12] = v9;
    id v11 = v22;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling <updateCountsForChangedFlags>, changedFlags=%@, currentFlags=%@", v21, 0x34u);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (((v7 | 0xD) & a3) != 0)
  {
    unsigned int v12 = a4 ^ a3;
    unsigned int v13 = (v7 | 5) & a4;
    if ((((v7 | 5) & v12) != v7) == (v13 == v7))
    {
      BOOL v14 = v13 == v7;
      unint64_t v15 = [(VVService *)self unreadCount];
      if (v14) {
        unint64_t v16 = v15 + 1;
      }
      else {
        unint64_t v16 = v15 - 1;
      }
      [(VVService *)self setUnreadCount:v16];
    }
    unsigned int v17 = (v7 | 0xC) & a4;
    if ((((v7 | 0xC) & v12) != (v7 | 8)) == (v17 == (v7 | 8)))
    {
      BOOL v18 = v17 == (v7 | 8);
      unint64_t v19 = [(VVService *)self trashedCount];
      if (v18) {
        unint64_t v20 = v19 + 1;
      }
      else {
        unint64_t v20 = v19 - 1;
      }
      -[VVService setTrashedCount:](self, "setTrashedCount:", v20, *(void *)v21, *(_OWORD *)&v21[8], v22, *(void *)v23, *(_OWORD *)&v23[8]);
    }
  }
}

- (void)resetCounts
{
  if ([(VVService *)self isOnline]) {
    int v3 = 0;
  }
  else {
    int v3 = 2;
  }
  id v4 = [(VVService *)self serviceLabelID];
  [(VVService *)self setTrashedCount:(int)VMStoreCountOfRecordsWithFlags(v3 | 8u, 4, v4)];

  id v5 = [(VVService *)self serviceLabelID];
  [(VVService *)self setUnreadCount:(int)VMStoreCountOfRecordsWithFlags(v3, 13, v5)];
}

- (BOOL)isCellularNetworkAvailable
{
  uint64_t v5 = 0;
  CFArrayRef v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D698;
  v4[3] = &unk_1000C23D0;
  v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setCellularNetworkAvailable:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D720;
  v3[3] = &unk_1000C1670;
  v3[4] = self;
  BOOL v4 = a3;
  [(VVService *)self performAtomicAccessorBlock:v3];
}

- (BOOL)isWiFiNetworkAvailable
{
  BOOL v3 = [(VVService *)self isWiFiNetworkSupported];
  if (v3)
  {
    LOBYTE(v3) = [(VVService *)self isWiFiNetworkReachable];
  }
  return v3;
}

- (BOOL)isWiFiNetworkReachable
{
  uint64_t v5 = 0;
  CFArrayRef v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D8D4;
  v4[3] = &unk_1000C23D0;
  v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isWiFiNetworkSupported
{
  uint64_t v5 = 0;
  CFArrayRef v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D9A4;
  v4[3] = &unk_1000C23D0;
  v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setWiFiNetworkSupported:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003DA2C;
  v3[3] = &unk_1000C1670;
  v3[4] = self;
  BOOL v4 = a3;
  [(VVService *)self performAtomicAccessorBlock:v3];
}

- (BOOL)isMailboxUsageUpdated
{
  uint64_t v5 = 0;
  CFArrayRef v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DC50;
  v4[3] = &unk_1000C23D0;
  v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setMailboxUsageUpdated:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003DCD8;
  v3[3] = &unk_1000C1670;
  v3[4] = self;
  BOOL v4 = a3;
  [(VVService *)self performAtomicAccessorBlock:v3];
}

- (NSString)smscAddress
{
  uint64_t v5 = 0;
  CFArrayRef v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = sub_10003DDFC;
  id v9 = sub_10003DE0C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DE14;
  v4[3] = &unk_1000C23D0;
  v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setSmscAddress:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DED4;
  v4[3] = &unk_1000C1FC8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VVService *)v5 performAtomicAccessorBlock:v4];
}

- (BOOL)isSMSReady
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DF9C;
  v4[3] = &unk_1000C23D0;
  void v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setSMSReady:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003E024;
  v3[3] = &unk_1000C1670;
  v3[4] = self;
  BOOL v4 = a3;
  [(VVService *)self performAtomicAccessorBlock:v3];
}

- (unint64_t)trashedCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E0FC;
  v4[3] = &unk_1000C23D0;
  void v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setTrashedCount:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003E180;
  v3[3] = &unk_1000C2420;
  v3[4] = self;
  void v3[5] = a3;
  [(VVService *)self performAtomicAccessorBlock:v3];
}

- (unint64_t)unreadCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E474;
  v4[3] = &unk_1000C23D0;
  void v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setUnreadCount:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003E4F8;
  v3[3] = &unk_1000C2420;
  v3[4] = self;
  void v3[5] = a3;
  [(VVService *)self performAtomicAccessorBlock:v3];
}

- (BOOL)isOnline
{
  return (*(unsigned char *)&self->_serviceFlags & 0x41) == 0;
}

- (void)_setOnline:(BOOL)a3 fallbackMode:(BOOL)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(VVService *)self isOnline];
  if (v4) {
    char v8 = 64;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_char serviceFlags = v8 | !v5 | *(unsigned char *)&self->_serviceFlags & 0xBE;
  if ((v5 & ~v4) != v7)
  {
    if ([(VVService *)self isSubscribed]) {
      [(VVService *)self resetCounts];
    }
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"VVServiceOnlineStateChangedNotification" object:self userInfo:0];
  }
}

- (void)setOnline:(BOOL)a3
{
  if (((*(unsigned char *)&self->_serviceFlags & 1) == 0) != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(VVService *)self getServiceObjLogPrefix];
      CFStringRef v7 = @"OFFLINE";
      if (v3) {
        CFStringRef v7 = @"ONLINE";
      }
      int v8 = 136315650;
      id v9 = v6;
      __int16 v10 = 2080;
      id v11 = " ";
      __int16 v12 = 2112;
      CFStringRef v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail offline status: %@", (uint8_t *)&v8, 0x20u);
    }

    [(VVService *)self _setOnline:v3 fallbackMode:(*(unsigned char *)&self->_serviceFlags >> 6) & 1];
  }
}

- (__CFString)connectionServiceType
{
  return (__CFString *)kCTDataConnectionServiceTypeVVM;
}

- (BOOL)_isOfflineDueToRoamingWithDataStatusDict:(__CFDictionary *)a3
{
  if (a3)
  {
    Value = CFDictionaryGetValue(a3, kCTRegistrationDataAttached);
    id v6 = Value;
    if (Value)
    {
      CFTypeID v7 = CFGetTypeID(Value);
      LODWORD(v6) = v7 == CFBooleanGetTypeID() && CFEqual(v6, kCFBooleanTrue) != 0;
    }
    id v9 = [(VVService *)self carrierParameterValueForKey:@"VVMIgnoresIntlDataRoaming"];

    LOBYTE(v8) = 0;
    if (v6)
    {
      if (!v9)
      {
        CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(a3, kCTRegistrationDataIndicator);
        if (v8)
        {
          CFStringRef v10 = v8;
          CFTypeID v11 = CFGetTypeID(v8);
          if (v11 == CFStringGetTypeID()
            && CFEqual(v10, kCTRegistrationDataIndicatorNone))
          {
            __int16 v12 = CFDictionaryGetValue(a3, kCTRegistrationDataStatusInternationalRoaming);
            if (!v12
              || (CFStringRef v13 = v12, v14 = CFGetTypeID(v12), v14 != CFBooleanGetTypeID())
              || (LODWORD(v8) = CFEqual(v13, kCFBooleanFalse), v8))
            {
              LOBYTE(v8) = 1;
            }
          }
          else
          {
            LOBYTE(v8) = 0;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (BOOL)isOfflineDueToRoaming
{
  BOOL v3 = (const void *)CTRegistrationCopyDataStatus();
  BOOL v4 = [(VVService *)self _isOfflineDueToRoamingWithDataStatusDict:v3];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)_updateOnlineStatus
{
  BOOL v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    id v23 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v24 = 2080;
    __int16 v25 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating online status", (uint8_t *)&v22, 0x16u);
  }

  unsigned int v4 = [(VVService *)self isCellularNetworkAvailable];
  BOOL v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v7 = @"unavailable";
    if (v4) {
      CFStringRef v7 = @"available";
    }
    int v22 = 136315650;
    id v23 = v6;
    __int16 v24 = 2080;
    __int16 v25 = " ";
    __int16 v26 = 2112;
    CFStringRef v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sService over cellular network is %@", (uint8_t *)&v22, 0x20u);
  }

  unsigned int v8 = [(VVService *)self isWiFiNetworkSupported];
  id v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v11 = @"unsupported";
    if (v8) {
      CFStringRef v11 = @"supported";
    }
    int v22 = 136315650;
    id v23 = v10;
    __int16 v24 = 2080;
    __int16 v25 = " ";
    __int16 v26 = 2112;
    CFStringRef v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sService over WiFi network is %@", (uint8_t *)&v22, 0x20u);
  }

  if (v8)
  {
    unsigned int v8 = [(VVService *)self isWiFiNetworkReachable];
    __int16 v12 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = [(VVService *)self getServiceObjLogPrefix];
      CFStringRef v14 = @"unreachable";
      if (v8) {
        CFStringRef v14 = @"reachable";
      }
      int v22 = 136315650;
      id v23 = v13;
      __int16 v24 = 2080;
      __int16 v25 = " ";
      __int16 v26 = 2112;
      CFStringRef v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%sWiFi network is %@", (uint8_t *)&v22, 0x20u);
    }
  }
  unint64_t v15 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v16 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v17 = @"unavailable";
    if (v8) {
      CFStringRef v17 = @"available";
    }
    int v22 = 136315650;
    id v23 = v16;
    __int16 v24 = 2080;
    __int16 v25 = " ";
    __int16 v26 = 2112;
    CFStringRef v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%sService over WiFi network is %@", (uint8_t *)&v22, 0x20u);
  }

  BOOL v18 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  uint64_t v19 = v4 | v8;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v20 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v21 = @"offline";
    if (v19) {
      CFStringRef v21 = @"online";
    }
    int v22 = 136315650;
    id v23 = v20;
    __int16 v24 = 2080;
    __int16 v25 = " ";
    __int16 v26 = 2112;
    CFStringRef v27 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%sService is %@", (uint8_t *)&v22, 0x20u);
  }

  [(VVService *)self setOnline:v19];
}

- (void)_setActivationError:(id)a3
{
  BOOL v5 = (NSError *)a3;
  activationError = self->_activationError;
  if (activationError != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_activationError, a3);
    BOOL v5 = v9;
    if (v9)
    {
      if (!activationError)
      {
        id v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", self->_activationError, @"VVError", 0);
        unsigned int v8 = +[NSNotificationCenter defaultCenter];
        [v8 postNotificationName:@"VVServiceContextActivationErrorNotification" object:self userInfo:v7];

        BOOL v5 = v9;
      }
    }
  }
}

- (id)activationError
{
  return self->_activationError;
}

- (void)clearActivationError
{
}

- (id)fallbackActivityIdentifier
{
  unint64_t v2 = [(VVService *)self serviceLabelID];
  BOOL v3 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.voicemail.fallback", v2];

  return v3;
}

- (void)cancelNotificationFallback
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = [(VVService *)self fallbackActivityIdentifier];
  xpc_activity_unregister((const char *)[v3 UTF8String]);

  [(VVService *)self _setOnline:(*(unsigned char *)&self->_serviceFlags & 1) == 0 fallbackMode:0];
  unsigned int v4 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v7 = 2080;
    unsigned int v8 = " ";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sCanceling fallback mode.", (uint8_t *)&v5, 0x16u);
  }

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_deliverFallbackNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"VVMessageWaitingFallbackNotification", 0, 0, 1u);
  unsigned int v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"VVServiceMessageWaitingFallbackNotification" object:self];

  int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    __int16 v7 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v8 = 2080;
    id v9 = " ";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sDelivered fallback notification.", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_enterFallbackMode
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v6 = 2080;
    __int16 v7 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sEntered fallback mode.", (uint8_t *)&v4, 0x16u);
  }

  [(VVService *)self cancelNotificationFallback];
  [(VVService *)self _setOnline:(*(unsigned char *)&self->_serviceFlags & 1) == 0 fallbackMode:1];
  [(NSRecursiveLock *)self->_lock unlock];
  if ([(VVService *)self isMessageWaiting]) {
    [(VVService *)self _deliverFallbackNotification];
  }
}

- (void)_scheduleFallbackActivityIfNecessary
{
  id v3 = [(VVService *)self messageNotificationFallbackTimeout];
  int v4 = v3;
  if (v3)
  {
    id v5 = [v3 unsignedIntegerValue];
    if (v5)
    {
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, (int64_t)v5);
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
      xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      __int16 v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        CFStringRef v13 = [(VVService *)self getServiceObjLogPrefix];
        __int16 v14 = 2080;
        unint64_t v15 = " ";
        __int16 v16 = 2048;
        id v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sScheduling fallback mode in %lu s", buf, 0x20u);
      }

      objc_initWeak((id *)buf, self);
      id v8 = [(VVService *)self fallbackActivityIdentifier];
      id v9 = (const char *)[v8 UTF8String];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10003F6D4;
      handler[3] = &unk_1000C2448;
      objc_copyWeak(&v11, (id *)buf);
      xpc_activity_register(v9, v6, handler);

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)isInSync
{
  return 1;
}

- (BOOL)isMessageWaiting
{
  return (*(unsigned char *)&self->_serviceFlags >> 5) & 1;
}

- (void)setMessageWaiting:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  char serviceFlags = (char)self->_serviceFlags;
  if (((((serviceFlags & 0x20) == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      char v6 = 32;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_char serviceFlags = serviceFlags & 0xDF | v6;
    __int16 v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(VVService *)self getServiceObjLogPrefix];
      CFStringRef v9 = @"OFF";
      if (v3) {
        CFStringRef v9 = @"ON";
      }
      int v11 = 136315650;
      __int16 v12 = v8;
      __int16 v13 = 2080;
      __int16 v14 = " ";
      __int16 v15 = 2112;
      CFStringRef v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sMessage waiting is %@", (uint8_t *)&v11, 0x20u);
    }

    CFStringRef v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"VVServiceMessageWaitingStateChangedNotification" object:self userInfo:0];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_reactToIndicator
{
  BOOL v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v6 = 2080;
    __int16 v7 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sOOS: Acting on MWI.", (uint8_t *)&v4, 0x16u);
  }

  [(VVService *)self synchronize:1 reason:@"MWI action"];
}

- (void)_cancelIndicatorAction
{
  BOOL v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v6 = 2080;
    __int16 v7 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sOOS: Cancelling MWI action.", (uint8_t *)&v4, 0x16u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_reactToIndicator" object:0];
}

- (Class)notificationInterpreterClass
{
  [(NSRecursiveLock *)self->_lock lock];
  Class notificationInterpreter = self->_notificationInterpreter;
  if (!notificationInterpreter)
  {
    int v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 objectForInfoDictionaryKey:@"VVNotificationInterpreter"];
    __int16 v6 = v5;
    if (v5)
    {
      __int16 v7 = NSClassFromString(v5);
      self->_Class notificationInterpreter = v7;
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!self->_notificationInterpreter)
    {
LABEL_6:
      self->_Class notificationInterpreter = (Class)objc_opt_class();
    }

    Class notificationInterpreter = self->_notificationInterpreter;
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return notificationInterpreter;
}

- (BOOL)respectsMWINotifications
{
  return 1;
}

- (BOOL)isPasswordReady
{
  id v2 = [(VVService *)self mailboxName];
  return sub_10007D588(v2);
}

- (id)password
{
  return [(VVService *)self passwordIgnoringSubscription:0];
}

- (id)passwordIgnoringSubscription:(BOOL)a3
{
  id v5 = [(VVService *)self mailboxName];
  if (![(__CFString *)v5 length] || !a3 && ![(VVService *)self isSubscribed])
  {
    password = self->_password;
    self->_password = 0;

    passwordMailboxName = self->_passwordMailboxName;
    self->_passwordMailboxName = 0;
    goto LABEL_8;
  }
  if (!self->_password
    || ([(__CFString *)v5 isEqualToString:self->_passwordMailboxName] & 1) == 0)
  {
    sub_10007D578(v5);
    __int16 v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    __int16 v7 = self->_password;
    self->_password = v6;

    id v8 = v5;
    passwordMailboxName = self->_passwordMailboxName;
    self->_passwordMailboxName = v8;
LABEL_8:
  }
  int v11 = self->_password;

  return v11;
}

- (void)setPassword:(id)a3
{
  id v5 = (__CFString *)a3;
  __int16 v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __int16 v7 = sub_10007D578((__CFString *)[(VVService *)self mailboxName]);
    if (v7)
    {
      unsigned int v8 = [(__CFString *)v5 isEqual:v7];
      CFStringRef v9 = v6;
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        if (v10)
        {
          int v11 = [(VVService *)self mailboxName];
          sub_100080EBC(v11, (uint8_t *)&v17, v9);
        }
      }
      else if (v10)
      {
        __int16 v13 = [(VVService *)self mailboxName];
        sub_100080F14(v13, (uint8_t *)&v17, v9);
      }
    }
    else
    {
      CFStringRef v9 = vm_vmd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [(VVService *)self mailboxName];
        int v17 = 138412290;
        BOOL v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "-[VVService setPassword:] called for mailbox named %@; old password for this mailbox was NULL",
          (uint8_t *)&v17,
          0xCu);
      }
    }
  }
  __int16 v14 = [(VVService *)self mailboxName];
  passwordMailboxName = self->_passwordMailboxName;
  self->_passwordMailboxName = v14;

  objc_storeStrong((id *)&self->_password, a3);
  sub_10007D82C(v5, self->_passwordMailboxName);
  passwordError = self->_passwordError;
  self->_passwordError = 0;

  if (![(VVService *)self mailboxRequiresSetup]) {
    [(id)objc_opt_class() _setInsomniaStateSupressed:0];
  }
}

- (void)setProvisionalPassword:(id)a3
{
  id v5 = (__CFString *)a3;
  int v4 = [(VVService *)self mailboxName];
  if ([(__CFString *)v4 length]) {
    sub_10007DB04(v5, v4);
  }
}

- (id)provisionalPassword
{
  id v2 = [(VVService *)self mailboxName];
  if ([(__CFString *)v2 length]) {
    BOOL v3 = (__CFString *)sub_10007DA50(v2);
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)displayPasswordRequestIfNecessary
{
  if (self->_passwordError)
  {
    if ((*(unsigned char *)&self->_serviceFlags & 5) == 0)
    {
      id v5 = [(VVService *)self mailboxName];
      id v3 = [v5 length];

      if (v3)
      {
        id v6 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", self->_passwordError, @"VVError", 0);
        int v4 = +[NSNotificationCenter defaultCenter];
        [v4 postNotificationName:@"VVServicePasswordNeededNotification" object:self userInfo:v6];
      }
    }
  }
}

- (void)cancelPasswordRequest
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"VVServicePasswordRequestCancelledNotification" object:self];
}

- (int)maximumRecordedNameDuration
{
  return 0;
}

- (int)minimumPasswordLength
{
  return 0;
}

- (int)maximumPasswordLength
{
  return 0;
}

- (BOOL)passwordChangeRequiresEnteringOldPassword
{
  return 1;
}

- (int64_t)mailboxGreetingType
{
  return 3;
}

- (id)carrierParameterValueForKey:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id carrierParameters = self->_carrierParameters;
  if (carrierParameters
    || (id v6 = [[VVCarrierParameters alloc] initWithService:self], v7 = self->_carrierParameters, self->_carrierParameters = v6, v7, (carrierParameters = self->_carrierParameters) != 0))
  {
    unsigned int v8 = [carrierParameters parameterValueForKey:v4];
  }
  else
  {
    unsigned int v8 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v8;
}

- (BOOL)doesClientManageTrashCompaction
{
  return 1;
}

- (BOOL)ignoresRoamingSwitch
{
  id v2 = [(VVService *)self carrierParameterValueForKey:@"VVMIgnoresIntlDataRoaming"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsDetachedStorage
{
  id v2 = [(VVService *)self carrierParameterValueForKey:@"VVMDetachedStorageDisabled"];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)getRetryIntervals
{
  return [(VVService *)self carrierParameterValueForKey:@"kVVRetryIntervalsKey"];
}

- (id)messageNotificationFallbackTimeout
{
  return [(VVService *)self carrierParameterValueForKey:@"kVVNotificationFallbackTimeoutKey"];
}

- (BOOL)shouldScheduleAutoTrashOnMailboxUsageChange
{
  return 1;
}

- (BOOL)taskOfTypeExists:(int64_t)a3
{
  return 0;
}

- (void)progressiveDataLengthsForRecord:(void *)a3 expected:(unsigned int *)a4 current:(unsigned int *)a5
{
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
}

- (BOOL)dataForRecordPending:(void *)a3 progressiveLoadInProgress:(BOOL *)a4
{
  return 0;
}

- (BOOL)headerChangesPending
{
  return 0;
}

- (BOOL)synchronizationPending
{
  return 0;
}

- (BOOL)greetingFetchExistsProgressiveLoadInProgress:(BOOL *)a3
{
  return 0;
}

- (BOOL)isSyncInProgress
{
  return 0;
}

- (void)clearRemoteUIDsForDetachedMessages
{
  BOOL v3 = [(VVService *)self serviceLabelID];
  CFArrayRef v4 = (const __CFArray *)VMStoreCopyOfAllRecordsWithFlags(64, 0, v3);

  if (v4)
  {
    id v5 = VMStoreRecordCopyArrayDescription(v4);
    id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(VVService *)self getServiceObjLogPrefix];
      unsigned int v8 = [(VVService *)self serviceLabelID];
      int v13 = 136315906;
      __int16 v14 = v7;
      __int16 v15 = 2080;
      CFStringRef v16 = " ";
      __int16 v17 = 2112;
      BOOL v18 = v8;
      __int16 v19 = 2112;
      unint64_t v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sClear remote UIDs for detached records, label %@ %@", (uint8_t *)&v13, 0x2Au);
    }
    if (v5) {
      CFRelease(v5);
    }
    CFIndex Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      CFRelease(v4);
    }
    else
    {
      CFIndex v10 = 0;
      char v11 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, v10);
        if (VMStoreRecordGetRemoteUID((uint64_t)ValueAtIndex))
        {
          VMStoreRecordSetRemoteUID((uint64_t)ValueAtIndex);
          char v11 = 1;
        }
        ++v10;
      }
      while (Count != v10);
      CFRelease(v4);
      if (v11) {
        VMStoreSave();
      }
    }
  }
}

- (BOOL)greetingAvailable
{
  return 0;
}

- (void)setGreetingType:(int64_t)a3 data:(id)a4 duration:(unint64_t)a5
{
  id v7 = a4;
  unsigned int v8 = v7;
  if (a3 == 2 && [v7 length])
  {
    CFStringRef v9 = [(VVService *)self accountDir];
    char v11 = sub_10006D9E8(v9, v10);

    id v21 = 0;
    unsigned int v12 = [v8 writeToURL:v11 options:0 error:&v21];
    id v13 = v21;
    value = (id *)self->logger.__ptr_.__value_;
    if (v12)
    {
      __int16 v15 = sub_100020EE0(value);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v16 = [(VVService *)self getServiceObjLogPrefix];
        __int16 v17 = [v11 path];
        *(_DWORD *)buf = 136315650;
        id v23 = v16;
        __int16 v24 = 2080;
        __int16 v25 = " ";
        __int16 v26 = 2112;
        CFStringRef v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%sSaved custom greeting to file at %@", buf, 0x20u);
      }
    }
    else
    {
      BOOL v18 = sub_100020EE0(value);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [(VVService *)self getServiceObjLogPrefix];
        unint64_t v20 = [v11 path];
        *(_DWORD *)buf = 136315906;
        id v23 = v19;
        __int16 v24 = 2080;
        __int16 v25 = " ";
        __int16 v26 = 2112;
        CFStringRef v27 = v20;
        __int16 v28 = 2112;
        id v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not save custom greeting to file at %@ with error %@", buf, 0x2Au);
      }
      [(VVService *)self reportError:v13];
    }
  }
}

- (void)reportError:(id)a3
{
  id v5 = (NSError *)a3;
  if (([(NSError *)v5 isConnectivityError] & 1) == 0)
  {
    activationError = self->_activationError;
    self->_activationError = 0;
  }
  if ([(NSError *)v5 isPasswordMismatchError])
  {
    if (self->_passwordError != v5) {
      objc_storeStrong((id *)&self->_passwordError, a3);
    }
    [(id)objc_opt_class() _setInsomniaStateSupressed:1];
    [(VVService *)self displayPasswordRequestIfNecessary];
  }
  else if ([(NSError *)v5 isInvalidSubscriberError])
  {
    [(VVService *)self setSubscribed:0];
    [(VVService *)self removeServiceInformation];
  }
  id v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    unsigned int v8 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v9 = [(NSError *)v5 localizedDescription];
    sub_100080F6C((uint64_t)v8, v9, v10, v7);
  }
}

+ (unsigned)_voicemailPowerAssertion
{
  if ((byte_1000E0950 & 1) == 0)
  {
    values[0] = @"PreventUserIdleSystemSleep";
    int valuePtr = 0;
    keys[0] = @"AssertType";
    keys[1] = @"AssertLevel";
    values[1] = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    values[2] = @"Visual Voicemail Activity";
    keys[2] = @"AssertName";
    keys[3] = @"FrameworkBundleID";
    values[3] = @"com.apple.voicemail";
    int valuePtr = 600;
    keys[4] = @"TimeoutSeconds";
    CFNumberRef v2 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    keys[5] = @"TimeoutAction";
    values[4] = v2;
    values[5] = @"TimeoutActionTurnOff";
    CFDictionaryRef v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (IOPMAssertionCreateWithProperties(v3, (IOPMAssertionID *)&dword_1000E0954))
    {
      CFArrayRef v4 = vm_vmd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        id v5 = "Error: Failed to create IOPMAssertion for Voicemail. Voicemail power assertions will not be active.";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v7, 2u);
      }
    }
    else
    {
      byte_1000E0950 = 1;
      CFArrayRef v4 = vm_vmd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        id v5 = "Created IOPMAssertion for Voicemail successfully.";
        goto LABEL_7;
      }
    }

    CFRelease(v3);
  }
  return dword_1000E0954;
}

+ (void)_acquireAssertionsForInsomniaState:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_mutex_trylock(&stru_1000E0358) != 16) {
    sub_100080FE8();
  }
  id v5 = vm_vmd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Insomnia] Enabling voicemail power assertion and resetting time out", buf, 2u);
    }

    IOPMAssertionSetProperty((IOPMAssertionID)[a1 _voicemailPowerAssertion], @"AssertLevel", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 255));
    CFStringRef v7 = @"TimeoutSeconds";
    uint64_t v8 = 600;
  }
  else
  {
    if (v6)
    {
      *(_WORD *)CFStringRef v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Insomnia] Disabling voicemail power assertion", v9, 2u);
    }

    uint64_t v8 = 0;
    CFStringRef v7 = @"AssertLevel";
  }
  IOPMAssertionSetProperty((IOPMAssertionID)[a1 _voicemailPowerAssertion], v7, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
}

+ (void)_setInsomniaStateSupressed:(BOOL)a3
{
  int v3 = a3;
  pthread_mutex_lock(&stru_1000E0358);
  if (byte_1000E0958 != v3)
  {
    id v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = asStringBOOL();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Insomnia] setInsomniaStateSupressed [%s]", (uint8_t *)&v6, 0xCu);
    }

    byte_1000E0958 = v3;
    [a1 _acquireAssertionsForInsomniaState:(dword_1000E095C > 0) & ~v3];
  }
  pthread_mutex_unlock(&stru_1000E0358);
}

+ (void)obtainInsomniaAssertion
{
  pthread_mutex_lock(&stru_1000E0358);
  ++dword_1000E095C;
  int v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = dword_1000E095C;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Insomnia] Obtaining insomnia assertion [InsomniaCount: %d]", (uint8_t *)v5, 8u);
  }

  if (byte_1000E0958) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = dword_1000E095C == 1;
  }
  if (v4) {
    [a1 _acquireAssertionsForInsomniaState:1];
  }
  pthread_mutex_unlock(&stru_1000E0358);
}

+ (void)releaseInsomniaAssertion
{
  pthread_mutex_lock(&stru_1000E0358);
  --dword_1000E095C;
  int v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = dword_1000E095C;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Insomnia] Releasing insomnia assertion [InsomniaCount: %d]", (uint8_t *)v5, 8u);
  }

  if (dword_1000E095C) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = byte_1000E0958 == 0;
  }
  if (v4) {
    [a1 _acquireAssertionsForInsomniaState:0];
  }
  pthread_mutex_unlock(&stru_1000E0358);
}

- (BOOL)isSingleMode
{
  return self->_singleMode;
}

- (id)delayedRetryActivityIdentifier
{
  CFNumberRef v2 = [(VVService *)self serviceLabelID];
  int v3 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.voicemail.SyncRetry", v2];

  return v3;
}

- (void)setDelayedRetryScheduled:(BOOL)a3
{
  if (self->_retryScheduled != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_10003B490();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(VVService *)self getServiceObjLogPrefix];
      if (byte_1000E0960) {
        int v7 = 118;
      }
      else {
        int v7 = 110;
      }
      int v9 = 136315906;
      CFIndex v10 = v6;
      CFStringRef v8 = @"Scheduled";
      __int16 v11 = 2080;
      unsigned int v12 = " ";
      if (!v3) {
        CFStringRef v8 = @"Not Scheduled";
      }
      __int16 v13 = 1024;
      int v14 = v7;
      __int16 v15 = 2112;
      CFStringRef v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Set delayed sync retry state: %@", (uint8_t *)&v9, 0x26u);
    }

    self->_retryScheduled = v3;
  }
}

- (BOOL)isDelayedRetryScheduled
{
  return self->_retryScheduled;
}

- (BOOL)isDelayedRetryScheduledGuarded
{
  CFNumberRef v2 = self;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(VVService *)self serialDispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_1000412D8;
  v5[3] = &unk_1000C23D0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setDelayedRetryImmediate:(BOOL)a3
{
  if (self->_retryImmediate != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_10003B490();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(VVService *)self getServiceObjLogPrefix];
      if (byte_1000E0960) {
        int v7 = 118;
      }
      else {
        int v7 = 110;
      }
      int v9 = 136315906;
      CFIndex v10 = v6;
      CFStringRef v8 = @"Immediate";
      __int16 v11 = 2080;
      unsigned int v12 = " ";
      if (!v3) {
        CFStringRef v8 = @"Continuous";
      }
      __int16 v13 = 1024;
      int v14 = v7;
      __int16 v15 = 2112;
      CFStringRef v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Set delayed sync retry mode: %@", (uint8_t *)&v9, 0x26u);
    }

    self->_retryImmediate = v3;
  }
}

- (BOOL)isDelayedRetryImmediate
{
  return self->_retryImmediate;
}

- (void)cancelDelayedSynchronize:(id)a3
{
  id v4 = a3;
  [(VVService *)self _cancelIndicatorAction];
  id v5 = sub_10003B490();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(VVService *)self getServiceObjLogPrefix];
    int retryIntervalIndex = self->_retryIntervalIndex;
    if (byte_1000E0960) {
      int v8 = 118;
    }
    else {
      int v8 = 110;
    }
    int v10 = 136316162;
    __int16 v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = " ";
    __int16 v14 = 1024;
    int v15 = v8;
    __int16 v16 = 1024;
    int v17 = retryIntervalIndex;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Delayed sync cancelled, next iteration %d, reason %@", (uint8_t *)&v10, 0x2Cu);
  }

  [(VVService *)self setDelayedRetryScheduled:0];
  id v9 = [(VVService *)self delayedRetryActivityIdentifier];
  xpc_activity_unregister((const char *)[v9 UTF8String]);
}

- (void)resetDelayedSynchronizationAttemptCount
{
  BOOL v3 = sub_10003B490();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VVService *)self getServiceObjLogPrefix];
    int retryIntervalIndex = self->_retryIntervalIndex;
    if (byte_1000E0960) {
      int v6 = 118;
    }
    else {
      int v6 = 110;
    }
    int v7 = 136315906;
    int v8 = v4;
    __int16 v9 = 2080;
    int v10 = " ";
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 1024;
    int v14 = retryIntervalIndex;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Resetting delayed sync, last iteration %d", (uint8_t *)&v7, 0x22u);
  }

  self->_int retryIntervalIndex = 0;
}

- (void)_attemptDelayedSynchronize
{
  BOOL v3 = sub_10003B490();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VVService *)self getServiceObjLogPrefix];
    int retryIntervalIndex = self->_retryIntervalIndex;
    if (byte_1000E0960) {
      int v6 = 118;
    }
    else {
      int v6 = 110;
    }
    int v7 = 136315906;
    int v8 = v4;
    __int16 v9 = 2080;
    int v10 = " ";
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 1024;
    int v14 = retryIntervalIndex;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Attempting delayed sync, next iteration %d", (uint8_t *)&v7, 0x22u);
  }

  [(VVService *)self cancelDelayedSynchronize:@"SyncAttempting"];
  [(VVService *)self synchronize:0 reason:@"SyncAttempting"];
}

- (id)retryIntervals
{
  retryIntervals = self->_retryIntervals;
  if (!retryIntervals)
  {
    id v4 = [(VVService *)self getRetryIntervals];
    id v5 = v4;
    if (v4 && [v4 count]) {
      int v6 = (NSArray *)[v5 copy];
    }
    else {
      int v6 = (NSArray *)&off_1000C8828;
    }
    int v7 = self->_retryIntervals;
    self->_retryIntervals = v6;

    retryIntervals = self->_retryIntervals;
  }
  return retryIntervals;
}

- (void)scheduleDelayedSynchronize
{
  if ([(VVService *)self isDelayedRetryScheduled])
  {
    BOOL v3 = sub_10003B490();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(VVService *)self getServiceObjLogPrefix];
      int retryIntervalIndex = self->_retryIntervalIndex;
      if (byte_1000E0960) {
        int v6 = 118;
      }
      else {
        int v6 = 110;
      }
      *(_DWORD *)buf = 136315906;
      __int16 v24 = v4;
      __int16 v25 = 2080;
      __int16 v26 = " ";
      __int16 v27 = 1024;
      int v28 = v6;
      __int16 v29 = 1024;
      unsigned int v30 = retryIntervalIndex;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Delayed sync is already scheduled, last iteration %d", buf, 0x22u);
    }
  }
  else
  {
    int v7 = [(VVService *)self retryIntervals];
    BOOL v3 = v7;
    if (v7 && (unint64_t v8 = self->_retryIntervalIndex, (unint64_t)[v7 count] > v8))
    {
      __int16 v9 = [v3 objectAtIndex:self->_retryIntervalIndex];
      unsigned int v10 = [v9 unsignedIntValue];

      __int16 v11 = sub_10003B490();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = [(VVService *)self getServiceObjLogPrefix];
        int v13 = self->_retryIntervalIndex;
        if (byte_1000E0960) {
          int v14 = 118;
        }
        else {
          int v14 = 110;
        }
        *(_DWORD *)buf = 136316162;
        __int16 v24 = v12;
        __int16 v25 = 2080;
        __int16 v26 = " ";
        __int16 v27 = 1024;
        int v28 = v14;
        __int16 v29 = 1024;
        unsigned int v30 = v10;
        __int16 v31 = 1024;
        int v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Scheduling delayed sync in %u s, iteration %d", buf, 0x28u);
      }

      [(VVService *)self setDelayedRetryScheduled:1];
      xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v15, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_int64(v15, XPC_ACTIVITY_DELAY, v10);
      xpc_dictionary_set_int64(v15, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
      xpc_dictionary_set_string(v15, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      objc_initWeak((id *)buf, self);
      id v16 = [(VVService *)self delayedRetryActivityIdentifier];
      int v17 = (const char *)[v16 UTF8String];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100041CC0;
      handler[3] = &unk_1000C2448;
      objc_copyWeak(&v22, (id *)buf);
      xpc_activity_register(v17, v15, handler);

      ++self->_retryIntervalIndex;
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v18 = sub_10003B490();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [(VVService *)self getServiceObjLogPrefix];
        if (byte_1000E0960) {
          int v20 = 118;
        }
        else {
          int v20 = 110;
        }
        *(_DWORD *)buf = 136315650;
        __int16 v24 = v19;
        __int16 v25 = 2080;
        __int16 v26 = " ";
        __int16 v27 = 1024;
        int v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%s[%c] Too many delayed sync retries, giving up;",
          buf,
          0x1Cu);
      }

      if ([(VVService *)self isDelayedRetryImmediate]) {
        [(VVService *)self resetDelayedSynchronizationAttemptCount];
      }
    }
  }
}

- (id)automatedTrashActivityIdentifier
{
  CFNumberRef v2 = [(VVService *)self serviceLabelID];
  BOOL v3 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.voicemail.autotrash", v2];

  return v3;
}

- (void)scheduleAutomatedTrashCompaction
{
  if (+[NSThread isMainThread])
  {
    [(VVService *)self _scheduleAutomatedTrashCompaction];
  }
  else
  {
    [(VVService *)self performSelectorOnMainThread:"_scheduleAutomatedTrashCompaction" withObject:0 waitUntilDone:0];
  }
}

- (void)_scheduleAutomatedTrashCompaction
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v32 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v39 = 2080;
      v40 = " ";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#W %s%sWe were asked to schedule trash compaction, but this class does't support this procedure", buf, 0x16u);
    }
    BOOL v3 = 0;
    goto LABEL_35;
  }
  BOOL v3 = [(VVService *)self getAccountStore];
  if (![(VVService *)self doesClientManageTrashCompaction])
  {
    int v32 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v39 = 2080;
      v40 = " ";
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#W %s%sWe were asked to schedule trash compaction, but client doesn't manage trash", buf, 0x16u);
    }
LABEL_35:

    goto LABEL_36;
  }
  CFArrayRef v4 = (const __CFArray *)sub_100079A60(v3, 8, 68);
  CFArrayRef v5 = v4;
  if (v4 && CFArrayGetCount(v4))
  {
    double v6 = COERCE_DOUBLE(VMStoreRecordCopyArrayDescription(v5));
    int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v38 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v39 = 2080;
      v40 = " ";
      __int16 v41 = 2112;
      double v42 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sWe have records that are eligible for compaction; records %@",
        buf,
        0x20u);
    }

    if (v6 != 0.0) {
      CFRelease(*(CFTypeRef *)&v6);
    }
    CFIndex Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      CFIndex v9 = 0;
      double v10 = 1.79769313e308;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v9);
        int v12 = sub_100079140(v3, (uint64_t)ValueAtIndex);
        *(double *)&CFStringRef v13 = COERCE_DOUBLE(VMStoreRecordCopyDescription((uint64_t)ValueAtIndex));
        int v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          xpc_object_t v15 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315906;
          v38 = v15;
          __int16 v39 = 2080;
          v40 = " ";
          __int16 v41 = 2112;
          double v42 = *(double *)&v13;
          __int16 v43 = 1024;
          LODWORD(v44) = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sCOMPACTION: trashed date of record %@ is %d", buf, 0x26u);
        }

        if (*(double *)&v13 != 0.0) {
          CFRelease(v13);
        }
        if (v12 && v10 > (double)v12)
        {
          id v16 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315650;
            v38 = v17;
            __int16 v39 = 2080;
            v40 = " ";
            __int16 v41 = 2048;
            double v42 = (double)v12;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%sCOMPACTION: trashed date of oldest record is now %f", buf, 0x20u);
          }

          double v10 = (double)v12;
        }
        ++v9;
      }
      while (Count != v9);
      if (v10 != 1.79769313e308)
      {
        [(VVService *)self trashCompactionAge];
        double v19 = v18;
        double Current = CFAbsoluteTimeGetCurrent();
        id v21 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        double v22 = Current - v10;
        double v23 = v19 - (Current - v10) + 10.0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136316418;
          v38 = v24;
          __int16 v39 = 2080;
          v40 = " ";
          __int16 v41 = 2048;
          double v42 = v19;
          __int16 v43 = 2048;
          double v44 = Current;
          __int16 v45 = 2048;
          double v46 = v22;
          __int16 v47 = 2048;
          double v48 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%sCOMPACTION: ageAtWhichToCompact=%f, currentTime=%f, currentTimeSpentInTrash=%f, timeUntilNextCompaction=%f", buf, 0x3Eu);
        }

        if (v23 < 0.0)
        {
          __int16 v25 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v26 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315394;
            v38 = v26;
            __int16 v39 = 2080;
            v40 = " ";
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%sCOMPACTION: Time until next compaction was less than one minute.  Increasing to one minute.", buf, 0x16u);
          }

          double v23 = 60.0;
        }
        xpc_object_t v27 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v27, XPC_ACTIVITY_REPEATING, 0);
        xpc_dictionary_set_int64(v27, XPC_ACTIVITY_DELAY, (uint64_t)v23);
        xpc_dictionary_set_int64(v27, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
        xpc_dictionary_set_string(v27, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
        objc_initWeak(&location, self);
        id v28 = [(VVService *)self automatedTrashActivityIdentifier];
        __int16 v29 = (const char *)[v28 UTF8String];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000428F8;
        handler[3] = &unk_1000C2448;
        objc_copyWeak(&v35, &location);
        xpc_activity_register(v29, v27, handler);

        unsigned int v30 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315650;
          v38 = v31;
          __int16 v39 = 2080;
          v40 = " ";
          __int16 v41 = 2048;
          double v42 = v23;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#I %s%sScheduling automated trash compaction in %f s", buf, 0x20u);
        }

        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
      }
    }
    CFRelease(v5);
  }
  else
  {
    id v33 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v39 = 2080;
      v40 = " ";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#W %s%sWe were asked to schedule trash compaction, but no records were eligible", buf, 0x16u);
    }

    if (v5) {
      CFRelease(v5);
    }
  }
LABEL_36:
}

- (void)cancelAutomatedTrashCompaction
{
}

- (void)_cancelAutomatedTrashCompaction
{
  id v3 = [(VVService *)self automatedTrashActivityIdentifier];
  xpc_activity_unregister((const char *)[v3 UTF8String]);

  CFArrayRef v4 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    double v6 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v7 = 2080;
    unint64_t v8 = " ";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sAutomated trash compaction was cancelled.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_attemptScheduledTrashCompaction:(id)a3
{
  CFArrayRef v4 = (_xpc_activity_s *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(VVService *)self getAccountStore];
    if (v5)
    {
      unsigned int v6 = [(VVService *)self doTrashCompaction:v5];
      if (!xpc_activity_set_state(v4, 5))
      {
        __int16 v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315650;
          int v14 = [(VVService *)self getServiceObjLogPrefix];
          __int16 v15 = 2080;
          id v16 = " ";
          __int16 v17 = 2112;
          CFStringRef v18 = @"com.apple.voicemail.autotrash";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#W %s%sUnable to transition %@ activity to state done", (uint8_t *)&v13, 0x20u);
        }
      }
      unint64_t v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        CFIndex v9 = [(VVService *)self getServiceObjLogPrefix];
        CFStringRef v10 = @"but no records were compacted";
        if (v6) {
          CFStringRef v10 = @"one or more records were compacted";
        }
        int v13 = 136315650;
        int v14 = v9;
        __int16 v15 = 2080;
        id v16 = " ";
        __int16 v17 = 2112;
        CFStringRef v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sAutomated trash compaction completed, %@", (uint8_t *)&v13, 0x20u);
      }

      [(VVService *)self scheduleAutomatedTrashCompaction];
      goto LABEL_20;
    }
  }
  else
  {
    __int16 v11 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100081014((uint64_t)[(VVService *)self getServiceObjLogPrefix], buf, v11);
    }
  }
  if (!xpc_activity_set_state(v4, 5))
  {
    int v12 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      int v14 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v15 = 2080;
      id v16 = " ";
      __int16 v17 = 2112;
      CFStringRef v18 = @"com.apple.voicemail.autotrash";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#W %s%sUnable to transition %@ activity to state done", (uint8_t *)&v13, 0x20u);
    }
  }
  int v5 = 0;
LABEL_20:
}

- (void)reportFailedToSyncOverWifi
{
  [(VVService *)self setNumFailedAttemptsToSyncOverWifi:(char *)[(VVService *)self numFailedAttemptsToSyncOverWifi] + 1];
  id v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    int v5 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v6 = 2080;
    __int16 v7 = " ";
    __int16 v8 = 2048;
    unint64_t v9 = [(VVService *)self numFailedAttemptsToSyncOverWifi];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sreportFailedToSyncOverWifi %ld", (uint8_t *)&v4, 0x20u);
  }
}

- (void)reportSucessfulSync
{
  [(VVService *)self setNumFailedAttemptsToSyncOverWifi:0];
  id v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v6 = 2080;
    __int16 v7 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sreported successful sync", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)shouldImmediatelyRetrySyncOverCellular
{
  id v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    __int16 v7 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v8 = 2080;
    unint64_t v9 = " ";
    __int16 v10 = 2048;
    unint64_t v11 = [(VVService *)self numFailedAttemptsToSyncOverWifi];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sshouldImmediatelyRetrySyncOverCellular %ld", (uint8_t *)&v6, 0x20u);
  }

  unint64_t v4 = [(VVService *)self numFailedAttemptsToSyncOverWifi];
  if (v4) {
    LOBYTE(v4) = ![(VVService *)self lastUsedConnectionTypeWasCellular];
  }
  return v4;
}

- (void)setLastUsedConnectionType:(__CFString *)a3
{
  int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    __int16 v7 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v8 = 2080;
    unint64_t v9 = " ";
    __int16 v10 = 2112;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%ssetLastUsedConnectionType: %@", (uint8_t *)&v6, 0x20u);
  }

  self->_lastConnectionTypeUsed = a3;
}

- (BOOL)lastUsedConnectionTypeWasCellular
{
  id v3 = self->_lastConnectionTypeUsed;
  unsigned int v4 = [(__CFString *)v3 isEqualToString:kCTDataConnectionServiceTypeVVM];
  int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    __int16 v8 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v9 = 2080;
    __int16 v10 = " ";
    __int16 v11 = 1024;
    unsigned int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%slastUsedConnectionTypeWasCellular: %d", (uint8_t *)&v7, 0x1Cu);
  }

  return v4;
}

- (void)scheduleImmediateSynchronizeRetryOverCellular
{
  if ([(VVService *)self shouldImmediatelyRetrySyncOverCellular])
  {
    id v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v7 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v8 = 2080;
      __int16 v9 = " ";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sattempting sync retry over cellular", buf, 0x16u);
    }

    unsigned int v4 = [(VVService *)self serialDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043654;
    block[3] = &unk_1000C1A98;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (__CFString)dataConnectionServiceTypeOverride
{
  if ([(VVService *)self shouldImmediatelyRetrySyncOverCellular]) {
    return (__CFString *)kCTDataConnectionServiceTypeVVM;
  }
  else {
    return 0;
  }
}

- (void)handleVoicemailInfoUpdate:(id)a3
{
  unsigned int v4 = (__CFString *)a3;
  int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 136315650;
    *(void *)&v21[4] = [(VVService *)self getServiceObjLogPrefix];
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = " ";
    *(_WORD *)&v21[22] = 2112;
    CFStringRef v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sReceived voicemail info update: %@", v21, 0x20u);
  }

  id v6 = [(__CFString *)v4 isVoiceMailMWI];
  id v7 = [(__CFString *)v4 available];
  unsigned int v8 = [(__CFString *)v4 isNetworkOriginated];
  __int16 v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v11 = &stru_1000C35D8;
    if (v8) {
      CFStringRef v11 = @" (from network)";
    }
    *(_DWORD *)id v21 = 136315906;
    *(void *)&v21[4] = v10;
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = " ";
    *(_WORD *)&v21[22] = 2112;
    CFStringRef v22 = v11;
    if (v7) {
      CFStringRef v12 = @"ON";
    }
    else {
      CFStringRef v12 = @"OFF";
    }
    __int16 v23 = 2112;
    CFStringRef v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail MWI%@ %@", v21, 0x2Au);
  }

  unsigned int v13 = v7 ^ ((*(unsigned char *)&self->_serviceFlags & 0x20) >> 5);
  if (v13 & 1) != 0 || ((v8 ^ 1))
  {
    if (!v13) {
      goto LABEL_23;
    }
  }
  else
  {
    int v14 = [(__CFString *)v4 count];
    id v15 = [v14 integerValue];

    if ((uint64_t)v15 >= 0) {
      goto LABEL_23;
    }
  }
  if (v7)
  {
    if ([(VVService *)self isSubscribed] && [(VVService *)self isInSync])
    {
      id v16 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)id v21 = 136315394;
        *(void *)&v21[4] = v17;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = " ";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%sOOS: MWI went ON but we were not out of sync; scheduling future check.",
          v21,
          0x16u);
      }

      [(VVService *)self performSelector:"_reactToIndicator" withObject:0 afterDelay:120.0];
    }
  }
  else
  {
    [(VVService *)self _cancelIndicatorAction];
  }
  -[VVService setMessageWaiting:](self, "setMessageWaiting:", v7, *(_OWORD *)v21, *(void *)&v21[16], v22);
LABEL_23:
  if ((v7 & v8 & v6) == 1)
  {
    if ((*(unsigned char *)&self->_serviceFlags & 0x40) != 0 && [(VVService *)self isSubscribed]) {
      [(VVService *)self _deliverFallbackNotification];
    }
    else {
      [(VVService *)self _scheduleFallbackActivityIfNecessary];
    }
  }
  CFStringRef v18 = objc_opt_class();
  double v19 = [(__CFString *)v4 url];
  int v20 = [v18 accountDictionaryForURL:v19];
  [(VVService *)self handleNotification:v20 isMWI:v6];
}

+ (id)accountDictionaryForURL:(id)a3
{
  id v3 = (void *)VMCopyDictionaryForNotificationString();
  return v3;
}

- (void)handleVVServiceDataAvailableNotification:(id)a3
{
  id v4 = a3;
  int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    id v7 = (id)objc_opt_class();
    unsigned int v8 = [v4 name];
    int v9 = 136315906;
    __int16 v10 = v6;
    __int16 v11 = 2080;
    CFStringRef v12 = " ";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s==== %@ received deprecated <%@> notification", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)networkReachabilityChangedSync:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(VVService *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v8 = @"NO";
    if (v3) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 136315650;
    CFStringRef v12 = v7;
    __int16 v13 = 2080;
    id v14 = " ";
    __int16 v15 = 2112;
    CFStringRef v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sNetwork reachability changed to: %@", buf, 0x20u);
  }

  [(VVService *)self setWiFiNetworkReachable:v3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100043DA0;
  v9[3] = &unk_1000C1670;
  v9[4] = self;
  BOOL v10 = v3;
  [(VVService *)self performAtomicAccessorBlock:v9];
}

- (void)handleAirplaneModeChanged:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(VVService *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v8 = @"NO";
    if (v3) {
      CFStringRef v8 = @"YES";
    }
    int v9 = 136315650;
    BOOL v10 = v7;
    __int16 v11 = 2080;
    CFStringRef v12 = " ";
    __int16 v13 = 2112;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sAirplaneMode changed to: %@", (uint8_t *)&v9, 0x20u);
  }

  if (v3)
  {
    [(VVService *)self cancelDelayedSynchronize:@"AirplaneMode"];
    [(VVService *)self resetDelayedSynchronizationAttemptCount];
  }
}

- (void)handleCallStatusDisconnected:(id)a3
{
  id v4 = a3;
  int v5 = [(VVService *)self serialDispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VVService *)self getServiceObjLogPrefix];
    [(VVService *)self isDelayedRetryScheduled];
    CFStringRef v8 = asNSStringBOOL();
    int v15 = 136315906;
    CFStringRef v16 = v7;
    __int16 v17 = 2080;
    CFStringRef v18 = " ";
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    CFStringRef v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sCallStatus Disconnected for uuid %@, delayed sync scheduled %@", (uint8_t *)&v15, 0x2Au);
  }
  if (![(VVService *)self isDelayedRetryImmediate]
    && [(VVService *)self isDelayedRetryScheduled])
  {
    int v9 = [(VVService *)self contextInfo];
    BOOL v10 = [v9 uuid];
    unsigned __int8 v11 = [v10 isEqual:v4];

    if ((v11 & 1) == 0)
    {
      int retryIntervalIndex = self->_retryIntervalIndex;
      BOOL v13 = __OFSUB__(retryIntervalIndex, 1);
      int v14 = retryIntervalIndex - 1;
      if (v14 < 0 == v13) {
        self->_int retryIntervalIndex = v14;
      }
      [(VVService *)self cancelDelayedSynchronize:@"CallDisconnected"];
      [(VVService *)self scheduleDelayedSynchronize];
    }
  }
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 isActiveService:32])
  {
    id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      CFStringRef v8 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v9 = 2080;
      BOOL v10 = " ";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sSatSMS service activated - force IMAP to re-sync after getting on grid", (uint8_t *)&v7, 0x16u);
    }

    [(VVService *)self synchronize:1 reason:@"StewieStateChanged"];
  }
}

- (int64_t)attemptCountForStateRequest:(id)a3
{
  uint64_t v10 = 0;
  unsigned __int8 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100044300;
  v6[3] = &unk_1000C2498;
  int v7 = self;
  id v8 = a3;
  __int16 v9 = &v10;
  id v3 = v8;
  [(VVService *)v7 performSynchronousBlock:v6];
  int64_t v4 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)incrementAttemptCountForStateRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(VVService *)self serialDispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044458;
  v7[3] = &unk_1000C1FC8;
  uint8_t v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeAttemptCountForStateRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(VVService *)self serialDispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004460C;
  v7[3] = &unk_1000C1FC8;
  uint8_t v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSMutableDictionary)stateRequestAttemptCount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10003DDFC;
  __int16 v9 = sub_10003DE0C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100044780;
  v4[3] = &unk_1000C24C0;
  void v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performSynchronousBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSMutableDictionary *)v2;
}

- (void)performAtomicAccessorBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_accessorLock);
  }
  else
  {
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VVService.mm", 1990, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (void)performSynchronousBlock:(id)a3
{
  block = (void (**)(void))a3;
  if (dispatch_get_specific(off_1000E0350) == self)
  {
    block[2]();
  }
  else
  {
    id v4 = [(VVService *)self serialDispatchQueue];
    dispatch_sync(v4, block);
  }
}

- (void)removeServiceInformation
{
  id v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v23 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v24 = 2080;
    __int16 v25 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoving database records", buf, 0x16u);
  }

  id v4 = [(VVService *)self serviceLabelID];
  sub_10007067C(0, v4);

  uint64_t v5 = +[NSFileManager defaultManager];
  id v6 = [(VVService *)self accountDir];
  uint64_t v7 = [v6 path];
  unsigned int v8 = [v5 fileExistsAtPath:v7];

  if (v8)
  {
    __int16 v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(VVService *)self getServiceObjLogPrefix];
      unsigned __int8 v11 = [(VVService *)self accountDir];
      *(_DWORD *)buf = 136315650;
      __int16 v23 = v10;
      __int16 v24 = 2080;
      __int16 v25 = " ";
      __int16 v26 = 2112;
      xpc_object_t v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sAttempting to remove service directory at %@", buf, 0x20u);
    }
    uint64_t v12 = [(VVService *)self accountDir];
    id v21 = 0;
    unsigned int v13 = [v5 removeItemAtURL:v12 error:&v21];
    id v14 = v21;

    value = (id *)self->logger.__ptr_.__value_;
    if (v13)
    {
      CFStringRef v16 = sub_100020EE0(value);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
        CFStringRef v18 = [(VVService *)self accountDir];
        *(_DWORD *)buf = 136315650;
        __int16 v23 = v17;
        __int16 v24 = 2080;
        __int16 v25 = " ";
        __int16 v26 = 2112;
        xpc_object_t v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoved service directory at %@", buf, 0x20u);
      }
    }
    else
    {
      CFStringRef v16 = sub_100020EE0(value);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [(VVService *)self getServiceObjLogPrefix];
        id v20 = [(VVService *)self accountDir];
        *(_DWORD *)buf = 136315906;
        __int16 v23 = v19;
        __int16 v24 = 2080;
        __int16 v25 = " ";
        __int16 v26 = 2112;
        xpc_object_t v27 = v20;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#E %s%sCould not remove service directory at %@ due to error %@", buf, 0x2Au);
      }
    }
  }
}

- (void)setWiFiNetworkReachable:(BOOL)a3
{
  self->_WiFiNetworkReachable = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)serviceICC
{
  return self->_serviceICC;
}

- (void)setServiceICC:(id)a3
{
}

- (NSString)serviceMDN
{
  return self->_serviceMDN;
}

- (void)setServiceMDN:(id)a3
{
}

- (NSString)serviceMCC
{
  return self->_serviceMCC;
}

- (void)setServiceMCC:(id)a3
{
}

- (NSString)serviceMNC
{
  return self->_serviceMNC;
}

- (void)setServiceMNC:(id)a3
{
}

- (NSUUID)serviceLabelID
{
  return self->_serviceLabelID;
}

- (void)setServiceLabelID:(id)a3
{
}

- (NSURL)accountDir
{
  return self->_accountDir;
}

- (void)setAccountDir:(id)a3
{
}

- (VMTranscriptionService)transcriptionService
{
  return self->_transcriptionService;
}

- (void)setTranscriptionService:(id)a3
{
}

- (VVVerifier)verifier
{
  return self->_verifier;
}

- (void)setVerifier:(id)a3
{
}

- (CTXPCContextInfo)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (unint64_t)numFailedAttemptsToSyncOverWifi
{
  return self->_numFailedAttemptsToSyncOverWifi;
}

- (void)setNumFailedAttemptsToSyncOverWifi:(unint64_t)a3
{
  self->_numFailedAttemptsToSyncOverWifi = a3;
}

- (__CFString)lastConnectionTypeUsed
{
  return self->_lastConnectionTypeUsed;
}

- (void)setLastConnectionTypeUsed:(__CFString *)a3
{
  self->_lastConnectionTypeUsed = a3;
}

- (NSDictionary)accountDictionary
{
  return self->_accountDictionary;
}

- (void)setAccountDictionary:(id)a3
{
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (VMCarrierStateRequestController)stateRequestController
{
  return self->_stateRequestController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateRequestController, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_accountDictionary, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_transcriptionService, 0);
  objc_storeStrong((id *)&self->_accountDir, 0);
  objc_storeStrong((id *)&self->_serviceLabelID, 0);
  objc_storeStrong((id *)&self->_serviceMNC, 0);
  objc_storeStrong((id *)&self->_serviceMCC, 0);
  objc_storeStrong((id *)&self->_serviceMDN, 0);
  objc_storeStrong((id *)&self->_serviceICC, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_stateRequestAttemptCount, 0);
  objc_storeStrong((id *)&self->_smscAddress, 0);
  objc_storeStrong((id *)&self->fPreferencesObserver, 0);
  objc_storeStrong((id *)&self->fStatusCallObserver, 0);
  objc_storeStrong((id *)&self->fStewieStateMonitor, 0);
  sub_100026948((ctu::OsLogLogger **)&self->logger, 0);
  objc_storeStrong(&self->_carrierParameters, 0);
  objc_storeStrong((id *)&self->_retryIntervals, 0);
  objc_storeStrong((id *)&self->_passwordMailboxName, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_activationError, 0);
  objc_storeStrong((id *)&self->_passwordError, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  return self;
}

@end