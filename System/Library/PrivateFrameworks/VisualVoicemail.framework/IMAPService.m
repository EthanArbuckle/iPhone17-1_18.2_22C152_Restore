@interface IMAPService
+ (void)initialize;
- (BOOL)_sanitizeDuplicateRecordsFromArrayForServiceAccount:(id)a3 serviceAccount:(id)a4;
- (BOOL)beaconRetryRegistered;
- (BOOL)dataForRecordPending:(void *)a3 progressiveLoadInProgress:(BOOL *)a4;
- (BOOL)doesClientManageTrashCompaction;
- (BOOL)greetingAvailable;
- (BOOL)greetingFetchExistsProgressiveLoadInProgress:(BOOL *)a3;
- (BOOL)isBeaconActive;
- (BOOL)isIMAPServerTrusted:(id)a3;
- (BOOL)isIMAPServerTrustedFQDN:(id)a3 key:(id)a4 whitelistExist:(BOOL *)a5;
- (BOOL)isIMAPServerTrustedIP:(id)a3 af:(int)a4 key:(id)a5 whitelistExist:(BOOL *)a6;
- (BOOL)isInSync;
- (BOOL)isSyncInProgress;
- (BOOL)passwordChangeRequiresEnteringOldPassword;
- (BOOL)respectsMWINotifications;
- (BOOL)taskOfTypeExists:(int64_t)a3;
- (IMAPService)initWithLabel:(id)a3 accountIdentifier:(id)a4 phoneNumber:(id)a5 isoCountryCode:(id)a6 countryCode:(id)a7 networkCode:(id)a8 contextInfo:(id)a9 telephonyClient:(id)a10 stateRequestController:(id)a11 newAccount:(BOOL)a12;
- (IMAPServiceAccount)serviceAccount;
- (NSString)beaconRetryActivityIdentifier;
- (NSString)description;
- (id).cxx_construct;
- (id)_bodyLoadMonitor;
- (id)_candidateGreetingMessageForServiceAccount:(id)a3;
- (id)_messageChangeQueue;
- (id)_parameters;
- (id)_parametersFilePath;
- (id)changePasswordReplyBlock;
- (id)getAccountStore;
- (id)mailboxName;
- (int)maximumPasswordLength;
- (int)minimumPasswordLength;
- (int64_t)currentTaskType;
- (int64_t)mailboxGreetingType;
- (unsigned)_beaconCount;
- (void)_addPendingDeleteForRecord:(void *)a3;
- (void)_authenticationFailed;
- (void)_bodyRetrievalCompleted:(void *)a3;
- (void)_cancelBeacon;
- (void)_carrierBundleChanged;
- (void)_checkForQueuedNotifications;
- (void)_doneBeacon;
- (void)_handleFlagsDidChange:(id)a3;
- (void)_handleVoicemailPasswordChangeTaskNotification:(id)a3;
- (void)_incrementBeaconCount;
- (void)_incrementBeaconTemporaryRetryCount;
- (void)_inferActiveState;
- (void)_mailboxUsageUpdateCompletedWithError:(id)a3;
- (void)_messagesAddedCompleted;
- (void)_onQueue_setPasscode:(id)a3 completion:(id)a4;
- (void)_removePendingDeleteForRecord:(void *)a3;
- (void)_removeRecordsNotPendingDelete:(__CFArray *)a3;
- (void)_resetBeaconTemporaryRetryCount;
- (void)_resetLegacyMessageWaiting;
- (void)_retrieveBodies:(id)a3;
- (void)_retrieveSingleRecordBody:(void *)a3;
- (void)_retrieveSingleTransferredRecordBody:(void *)a3;
- (void)_sanitizeLocalVoicemailDatabaseForServiceAccount:(id)a3;
- (void)_saveParameters;
- (void)_scheduleBeaconRetry:(unint64_t)a3;
- (void)_setAccountState:(int64_t)a3;
- (void)_setAccountValue:(id)a3 forKey:(__CFString *)a4 inDictionary:(id *)a5 ifDifferentInDictionary:(id)a6;
- (void)_setActiveGreetingType:(int64_t)a3;
- (void)_setBeaconCount:(unsigned int)a3;
- (void)_setDataForRecordWithIdentifier:(unsigned int)a3;
- (void)_setGreetingCached:(BOOL)a3;
- (void)_setMessageWaitingFromNotification:(id)a3;
- (void)_setServerInfoFromInterpretedNotification:(id)a3;
- (void)_startBeacon;
- (void)_syncCompletedWithError:(shared_ptr<VMJetsamAssertion>)a3 error:(id)a4;
- (void)_synchronizeMailboxWithRelativePath:(id)a3 serviceAccount:(id)a4;
- (void)_synchronizeMailboxesForServiceAccount:(id)a3;
- (void)_synchronouslyPushFlags:(id)a3;
- (void)_synchronouslyRetrieveBody:(id)a3;
- (void)_synchronouslyRetrieveBodyForRecord:(void *)a3;
- (void)_synchronouslySetCustomGreetingWithData:(id)a3 duration:(id)a4;
- (void)_synchronouslySetDefaultGreeting;
- (void)_updateMailboxUsage;
- (void)addDataForRecord:(void *)a3;
- (void)addScheduledActivity:(id)a3;
- (void)addSyncTask;
- (void)addTranscriptForRecord:(void *)a3;
- (void)dealloc;
- (void)handleDataContextDeactivated;
- (void)handleIMAPAccountOfflineOperationQueuedNotification:(id)a3;
- (void)handleIMAPServiceLibraryRecordsAddedNotification:(id)a3;
- (void)handleNotification:(id)a3 isMWI:(BOOL)a4;
- (void)imapTransactionEnded;
- (void)kill;
- (void)markRecordsAsRead:(id)a3;
- (void)messageWriter:(id)a3 willEncodeHeaders:(id)a4 forMimePart:(id)a5;
- (void)movePendingMessagesToInboxTask:(id)a3;
- (void)movePendingMessagesToTrashTask:(id)a3;
- (void)moveRecordsToDeleted:(id)a3;
- (void)moveRecordsToInbox:(id)a3;
- (void)moveRecordsToTrash:(id)a3;
- (void)onVMStoreRecordFlagsChangedNotification:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5;
- (void)onVMStoreRecordFlagsDidChangeNotification:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5;
- (void)onVMStoreRecordFlagsWillChangeNotification:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5;
- (void)populateLabelInformation;
- (void)populateReceiverInformationForServiceAccount:(id)a3;
- (void)progressiveDataLengthsForRecord:(void *)a3 expected:(unsigned int *)a4 current:(unsigned int *)a5;
- (void)refreshIfNeeded;
- (void)requestController:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5;
- (void)requestController:(id)a3 didSendRequest:(id)a4;
- (void)retrieveDataForRecord:(void *)a3;
- (void)retrieveGreeting:(id)a3;
- (void)retrieveGreetingWorkerForServiceAccount:(id)a3;
- (void)scheduleReleaseAllAccountConnections:(id)a3 reason:(id)a4 forService:(id)a5;
- (void)scheduleSyncTask:(BOOL)a3 reason:(id)a4;
- (void)setBeaconActive:(BOOL)a3;
- (void)setBeaconRetryRegistered:(BOOL)a3;
- (void)setChangePasswordReplyBlock:(id)a3;
- (void)setGreetingType:(int64_t)a3 data:(id)a4 duration:(unint64_t)a5;
- (void)setMailboxRequiresSetup:(BOOL)a3;
- (void)setOnline:(BOOL)a3;
- (void)setPasscode:(id)a3 completion:(id)a4;
- (void)setSMSReady:(BOOL)a3;
- (void)setServiceAccount:(id)a3;
- (void)setSmscAddress:(id)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)synchronize:(BOOL)a3 reason:(id)a4;
- (void)synchronizeRecordFlags;
@end

@implementation IMAPService

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[MFData setDefaultMappingThresholdInBytes:0x100000];
    sub_100029144();
    if (CPIsInternalDevice())
    {
      dispatch_time_t v2 = dispatch_time(0, 100000000);
      dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_1000C2888);
    }
  }
}

- (IMAPService)initWithLabel:(id)a3 accountIdentifier:(id)a4 phoneNumber:(id)a5 isoCountryCode:(id)a6 countryCode:(id)a7 networkCode:(id)a8 contextInfo:(id)a9 telephonyClient:(id)a10 stateRequestController:(id)a11 newAccount:(BOOL)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v29.receiver = self;
  v29.super_class = (Class)IMAPService;
  id v26 = a10;
  id v27 = a11;
  if ([(VVService *)&v29 initWithLabel:v17 accountIdentifier:v18 phoneNumber:v19 isoCountryCode:v20 countryCode:v21 networkCode:v22 contextInfo:v23 telephonyClient:v26 stateRequestController:v27 newAccount:a12])
  {
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  [(MFInvocationQueue *)self->_messageChangeQueue removeAllItems];
  messageChangeQueue = self->_messageChangeQueue;
  self->_messageChangeQueue = 0;

  [(IMAPServiceAccount *)self->_serviceAccount invalidateServiceAccount];
  [(IMAPService *)self scheduleReleaseAllAccountConnections:self->_serviceAccount reason:@"IMAPService dealloc" forService:0];
  serviceAccount = self->_serviceAccount;
  self->_serviceAccount = 0;

  [(IMAPServiceActivityController *)self->_activityController invalidate];
  v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v12 = 2080;
    v13 = " ";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sUnregistering beacon retry activity in dealloc", buf, 0x16u);
  }

  id v8 = [(IMAPService *)self beaconRetryActivityIdentifier];
  xpc_activity_unregister((const char *)[v8 UTF8String]);

  v9.receiver = self;
  v9.super_class = (Class)IMAPService;
  [(VVService *)&v9 dealloc];
}

- (int64_t)currentTaskType
{
  int64_t result = (int64_t)self->_activityController;
  if (result) {
    return (int64_t)[(id)result currentTaskType];
  }
  return result;
}

- (void)addScheduledActivity:(id)a3
{
  id v5 = a3;
  activityController = self->_activityController;
  if (activityController) {
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v5];
  }
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(VVService *)self accountIdentifier];
  id v5 = [(VVService *)self serviceLabelID];
  v6 = +[NSString stringWithFormat:@"<%@ %p account=%@ label=%@>", v3, self, v4, v5];

  return (NSString *)v6;
}

- (BOOL)isBeaconActive
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058488;
  v4[3] = &unk_1000C23D0;
  v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setBeaconActive:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100058518;
  v3[3] = &unk_1000C1670;
  v3[4] = self;
  BOOL v4 = a3;
  [(VVService *)self performAtomicAccessorBlock:v3];
}

- (NSString)beaconRetryActivityIdentifier
{
  char v2 = [(VVService *)self serviceLabelID];
  uint64_t v3 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.vmd.BeaconRetry", v2];

  return (NSString *)v3;
}

- (id)changePasswordReplyBlock
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = sub_1000586C8;
  objc_super v9 = sub_1000586F4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000586FC;
  v4[3] = &unk_1000C23D0;
  v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  id v2 = objc_retainBlock((id)v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)setChangePasswordReplyBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000587FC;
  v4[3] = &unk_1000C28B0;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VVService *)v5 performAtomicAccessorBlock:v4];
}

- (IMAPServiceAccount)serviceAccount
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = sub_100058968;
  objc_super v9 = sub_100058978;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058980;
  v4[3] = &unk_1000C23D0;
  void v4[4] = self;
  v4[5] = &v5;
  [(VVService *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (IMAPServiceAccount *)v2;
}

- (void)setServiceAccount:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058A48;
  v4[3] = &unk_1000C1FC8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VVService *)v5 performAtomicAccessorBlock:v4];
}

- (id)getAccountStore
{
  id v2 = [(IMAPService *)self serviceAccount];
  id v3 = [v2 accountStore];

  return v3;
}

- (void)setSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMAPService *)self mf_lock];
  BOOL v5 = (*(unsigned char *)&self->super._serviceFlags & 2) == 0;
  v63.receiver = self;
  v63.super_class = (Class)IMAPService;
  [(VVService *)&v63 setSubscribed:v3];
  if (v5 == v3)
  {
    v62 = +[NSNotificationCenter defaultCenter];
    if (v3)
    {
      if (!self->_activityController)
      {
        id v6 = [[IMAPServiceActivityController alloc] initForService:self];
        activityController = self->_activityController;
        self->_activityController = v6;
      }
      v61 = [(IMAPService *)self serviceAccount];
      unsigned int v8 = [v61 hasPendingOfflineOperations];
      __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
      if (v8 | ((imapServiceFlags & 2) >> 1)) {
        __int16 v10 = 2;
      }
      else {
        __int16 v10 = 0;
      }
      *(_WORD *)&self->___int16 imapServiceFlags = v10 | imapServiceFlags & 0xFFFD;
      v11 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315906;
        v65 = v12;
        __int16 v66 = 2080;
        v67 = " ";
        __int16 v68 = 2112;
        CFIndex v69 = (CFIndex)self;
        __int16 v70 = 2112;
        v71 = v61;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%sService subscribed %@, service account %@", buf, 0x2Au);
      }

      if (v61) {
        [v62 addObserver:self selector:"handleIMAPAccountOfflineOperationQueuedNotification:" name:IMAPAccountOfflineOperationQueuedNotification object:v61];
      }
      v13 = [(VVService *)self serviceLabelID];
      CFArrayRef v14 = (const __CFArray *)VMStoreCopyOfAllRecordsWithFlags(16, 0, v13);

      if (v14)
      {
        CFIndex Count = CFArrayGetCount(v14);
        if (Count >= 1)
        {
          v16 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315650;
            v65 = v17;
            __int16 v66 = 2080;
            v67 = " ";
            __int16 v68 = 2048;
            CFIndex v69 = Count;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%sFound %ld Temporary record(s)", buf, 0x20u);
          }

          for (CFIndex i = 0; i != Count; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
            CFStringRef v20 = VMStoreRecordCopyDescription((uint64_t)ValueAtIndex);
            id v21 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [(VVService *)self getServiceObjLogPrefix];
              *(_DWORD *)buf = 136315650;
              v65 = v22;
              __int16 v66 = 2080;
              v67 = " ";
              __int16 v68 = 2112;
              CFIndex v69 = (CFIndex)v20;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoving Temporary flag from record %@", buf, 0x20u);
            }

            id v23 = [(VVService *)self serviceLabelID];
            int Flags = VMStoreRecordGetFlags((uint64_t)ValueAtIndex);
            VMStoreRecordSetFlags(v23, ValueAtIndex, Flags & 0xFFFFFFEF);

            if (v20) {
              CFRelease(v20);
            }
          }
        }
        CFRelease(v14);
      }
      v25 = [(VVService *)self serviceLabelID];
      int v26 = VMStoreCountOfRecordsWithFlags(0, 66, v25);
      $5A51FF831E2FC24F0087AEE6629E6188 v27 = self->_imapServiceFlags;
      int v28 = (*(unsigned int *)&v27 >> 1) & 1;
      if (v26 > 0) {
        int v28 = 1;
      }
      if (v28) {
        __int16 v29 = 2;
      }
      else {
        __int16 v29 = 0;
      }
      *(_WORD *)&self->___int16 imapServiceFlags = v29 | *(_WORD *)&v27 & 0xFFFD;

      v30 = [(VVService *)self serviceLabelID];
      int v31 = VMStoreCountOfRecordsWithFlags(0x4000, 0, v30);

      if (v31 <= 0)
      {
        __int16 v34 = (__int16)self->_imapServiceFlags;
      }
      else
      {
        v32 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315650;
          v65 = v33;
          __int16 v66 = 2080;
          v67 = " ";
          __int16 v68 = 2048;
          CFIndex v69 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#I %s%sFound %ld Pending record(s)", buf, 0x20u);
        }

        __int16 v34 = *(_WORD *)&self->_imapServiceFlags | 2;
        *(_WORD *)&self->___int16 imapServiceFlags = v34;
      }
      [(IMAPService *)self synchronize:(v34 & 0x100) == 0 reason:@"SetSubscribed"];
      [(IMAPService *)self synchronizeRecordFlags];
      v39 = [(VVService *)self serviceLabelID];
      v40 = [v39 UUIDString];

      if (!VMStoreGetReceiverMigration((uint64_t)v40))
      {
        v41 = [(IMAPService *)self serviceAccount];
        v42 = +[MFMonitoredInvocation invocationWithSelector:"populateReceiverInformationForServiceAccount:" target:self object:v41 taskName:@"Synchronizing" priority:0 canBeCancelled:0];

        [v42 retainArguments];
        v43 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = [(VVService *)self getServiceObjLogPrefix];
          v45 = [(IMAPService *)self _messageChangeQueue];
          v46 = [v42 monitor];
          v47 = [v42 monitor];
          *(_DWORD *)buf = 136316418;
          v65 = v44;
          __int16 v66 = 2080;
          v67 = " ";
          __int16 v68 = 2112;
          CFIndex v69 = (CFIndex)v45;
          __int16 v70 = 2048;
          v71 = v46;
          __int16 v72 = 2112;
          v73 = v47;
          __int16 v74 = 2112;
          v75 = v42;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: Performing receiver column migration => %@", buf, 0x3Eu);
        }
        v48 = *(Class *)((char *)&self->super.super.isa + v60);
        v49 = [v42 monitor];
        [v48 addScheduledActivity:v49];

        v50 = [(IMAPService *)self _messageChangeQueue];
        [v50 addInvocation:v42];
      }
      if (self->isNewAccount)
      {
        v51 = +[MFMonitoredInvocation invocationWithSelector:"populateLabelInformation" target:self taskName:@"Synchronizing" priority:0 canBeCancelled:0];
        [v51 retainArguments];
        v52 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [(VVService *)self getServiceObjLogPrefix];
          v54 = [(IMAPService *)self _messageChangeQueue];
          v55 = [v51 monitor];
          v56 = [v51 monitor];
          *(_DWORD *)buf = 136316418;
          v65 = v53;
          __int16 v66 = 2080;
          v67 = " ";
          __int16 v68 = 2112;
          CFIndex v69 = (CFIndex)v54;
          __int16 v70 = 2048;
          v71 = v55;
          __int16 v72 = 2112;
          v73 = v56;
          __int16 v74 = 2112;
          v75 = v51;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: Performing label column migration => %@", buf, 0x3Eu);
        }
        v57 = *(Class *)((char *)&self->super.super.isa + v60);
        v58 = [v51 monitor];
        [v57 addScheduledActivity:v58];

        v59 = [(IMAPService *)self _messageChangeQueue];
        [v59 addInvocation:v51];

        self->isNewAccount = 0;
      }
    }
    else
    {
      [(MFInvocationQueue *)self->_messageChangeQueue removeAllItems];
      messageChangeQueue = self->_messageChangeQueue;
      self->_messageChangeQueue = 0;

      v36 = [(IMAPService *)self serviceAccount];
      [v62 removeObserver:self name:IMAPAccountOfflineOperationQueuedNotification object:v36];

      [(IMAPService *)self setServiceAccount:0];
      [(NSRecursiveLock *)self->_pendingDeletesLock lock];
      pendingDeletes = self->_pendingDeletes;
      self->_pendingDeletes = 0;

      [(NSRecursiveLock *)self->_pendingDeletesLock unlock];
      addedRecords = self->_addedRecords;
      self->_addedRecords = 0;

      [v62 removeObserver:self name:@"kIMAPServiceLibraryRecordsAddedNotification" object:0];
    }
  }
  [(IMAPService *)self mf_unlock];
}

- (void)_setAccountValue:(id)a3 forKey:(__CFString *)a4 inDictionary:(id *)a5 ifDifferentInDictionary:(id)a6
{
  id v12 = a3;
  id v9 = a6;
  __int16 v10 = [v9 objectForKey:a4];
  if (!v10 || ([v12 isEqualToString:v10] & 1) == 0)
  {
    id v11 = *a5;
    if (!*a5)
    {
      id v11 = [v9 mutableCopy];
      *a5 = v11;
    }
    [v11 setObject:v12 forKey:a4];
  }
}

- (id)mailboxName
{
  id v2 = [(IMAPService *)self serviceAccount];
  BOOL v3 = [v2 username];

  return v3;
}

- (BOOL)isIMAPServerTrustedIP:(id)a3 af:(int)a4 key:(id)a5 whitelistExist:(BOOL *)a6
{
  id v49 = a3;
  id v50 = a5;
  v51 = -[VVService carrierParameterValueForKey:](self, "carrierParameterValueForKey:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v51)
    {
      BOOL v36 = 0;
      goto LABEL_59;
    }
    v48 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 2112;
      *(void *)v64 = objc_opt_class();
      *(_WORD *)&v64[8] = 2112;
      *(void *)&v64[10] = v51;
      *(_WORD *)&v64[18] = 2112;
      *(void *)&v64[20] = v50;
      id v35 = *(id *)v64;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "#E %s%sInvalid type <%@ %@> for bundle key %@", buf, 0x34u);
    }
LABEL_58:
    BOOL v36 = 0;

    goto LABEL_59;
  }
  v48 = v51;
  if (![v48 count]) {
    goto LABEL_58;
  }
  if (a4 != 2 && a4 != 30)
  {
    v37 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100081A64((uint64_t)[(VVService *)self getServiceObjLogPrefix], (uint64_t)buf);
    }

    goto LABEL_58;
  }
  id v10 = v49;
  if (!inet_pton(a4, (const char *)[v10 UTF8String], v58))
  {
    v38 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v40 = [(VVService *)self getServiceObjLogPrefix];
      v41 = @"Unknown";
      if (a4 == 30) {
        v41 = @"IPv6";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v60 = v40;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 2112;
      if (a4 == 2) {
        v41 = @"IPv4";
      }
      *(void *)v64 = v41;
      *(_WORD *)&v64[8] = 2112;
      *(void *)&v64[10] = v10;
      v42 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "#E %s%sInvalid %@ server address '%@'", buf, 0x2Au);
    }
    goto LABEL_58;
  }
  v46 = a6;
  int v47 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obj = v48;
  id v11 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (!v11)
  {
LABEL_51:

    BOOL v36 = 0;
    goto LABEL_52;
  }
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v55;
  CFStringRef v14 = @"IPv6";
  if (a4 != 30) {
    CFStringRef v14 = @"Unknown";
  }
  if (a4 == 2) {
    CFStringRef v14 = @"IPv4";
  }
  v43 = (__CFString *)v14;
  for (uint64_t i = *(void *)v55; ; uint64_t i = *(void *)v55)
  {
    if (i != v13) {
      objc_enumerationMutation(obj);
    }
    v16 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    id v17 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = [(VVService *)self getServiceObjLogPrefix];
      v25 = objc_opt_class();
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = v24;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 2112;
      *(void *)v64 = v25;
      *(_WORD *)&v64[8] = 2112;
      *(void *)&v64[10] = v16;
      *(_WORD *)&v64[18] = 2112;
      *(void *)&v64[20] = v50;
      id v26 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#E %s%sInvalid item <%@ %@> for bundle key %@", buf, 0x34u);
    }
LABEL_37:

    if (++v12 >= (unint64_t)v11)
    {
      id v11 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
      if (!v11) {
        goto LABEL_51;
      }
      uint64_t v12 = 0;
    }
  }
  id v17 = v16;
  if (![v17 length]) {
    goto LABEL_37;
  }
  id v18 = [v17 componentsSeparatedByString:@"/"];
  if ([v18 count] != (id)2)
  {
    $5A51FF831E2FC24F0087AEE6629E6188 v27 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v31 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315906;
      uint64_t v60 = v31;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 2112;
      *(void *)v64 = v17;
      *(_WORD *)&v64[8] = 2112;
      *(void *)&v64[10] = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#E %s%sInvalid routing format '%@' for bundle key %@", buf, 0x2Au);
    }

    goto LABEL_37;
  }
  id v19 = [v18 objectAtIndex:0];
  CFStringRef v20 = [v18 objectAtIndex:1];
  id v21 = v19;
  if (!inet_pton(v47, (const char *)[v21 UTF8String], v53))
  {
    int v28 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136316418;
      uint64_t v60 = v29;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 2112;
      *(void *)v64 = v43;
      *(_WORD *)&v64[8] = 2112;
      *(void *)&v64[10] = v21;
      *(_WORD *)&v64[18] = 2112;
      *(void *)&v64[20] = v17;
      __int16 v65 = 2112;
      id v66 = v50;
      v30 = v43;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#E %s%sInvalid %@ address '%@' <%@> for bundle key %@", buf, 0x3Eu);
    }
    goto LABEL_35;
  }
  unsigned int v22 = [v20 longLongValue];
  unsigned int v23 = v22;
  if (!v22)
  {
    int v28 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136316162;
      uint64_t v60 = v32;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 1024;
      *(_DWORD *)v64 = 0;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v17;
      *(_WORD *)&v64[14] = 2112;
      *(void *)&v64[16] = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#E %s%sInvalid routing prefix %u <%@> for bundle key %@", buf, 0x30u);
    }
LABEL_35:

    goto LABEL_36;
  }
  BOOL *v46 = 1;
  if (v47 == 2)
  {
    if (v22 >= 0x21)
    {
      log = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v33 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315906;
        uint64_t v60 = v33;
        __int16 v61 = 2080;
        v62 = " ";
        __int16 v63 = 1024;
        *(_DWORD *)v64 = v23;
        *(_WORD *)&v64[4] = 2112;
        *(void *)&v64[6] = v17;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#E %s%sInvalid IPv4 routing prefix %u <%@>", buf, 0x26u);
      }

      LOBYTE(v23) = 32;
    }
    if (!(bswap32(*(_DWORD *)v58 ^ *(_DWORD *)v53) >> -(char)v23)) {
      goto LABEL_60;
    }
    goto LABEL_36;
  }
  if (v22 >= 0x81)
  {
    loga = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315906;
      uint64_t v60 = v34;
      __int16 v61 = 2080;
      v62 = " ";
      __int16 v63 = 1024;
      *(_DWORD *)v64 = v23;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v17;
      _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "#E %s%sInvalid IPv6 routing prefix %u <%@>", buf, 0x26u);
    }

    LOBYTE(v23) = 0x80;
  }
  if (!sub_100059708(v58, v53, v23))
  {
LABEL_36:

    goto LABEL_37;
  }
LABEL_60:

  BOOL v36 = 1;
LABEL_52:

LABEL_59:
  return v36;
}

- (BOOL)isIMAPServerTrustedFQDN:(id)a3 key:(id)a4 whitelistExist:(BOOL *)a5
{
  id v26 = a3;
  id v25 = a4;
  unsigned int v8 = -[VVService carrierParameterValueForKey:](self, "carrierParameterValueForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = v8;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v28;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFStringRef v14 = v13;
            if ([v14 length])
            {
              *a5 = 1;
              if (![v14 caseInsensitiveCompare:v26]) {
                goto LABEL_25;
              }
              if ([v14 characterAtIndex:0] == 42)
              {
                v15 = [v14 substringFromIndex:1];
                v16 = [v15 lowercaseString];

                id v17 = [v26 lowercaseString];
                if ([v16 length] && (objc_msgSend(v17, "hasSuffix:", v16) & 1) != 0)
                {

LABEL_25:
                  BOOL v21 = 1;
                  goto LABEL_26;
                }
              }
            }
          }
          else
          {
            CFStringRef v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              id v18 = [(VVService *)self getServiceObjLogPrefix];
              id v19 = objc_opt_class();
              *(_DWORD *)buf = 136316162;
              v32 = v18;
              __int16 v33 = 2080;
              __int16 v34 = " ";
              __int16 v35 = 2112;
              id v36 = v19;
              __int16 v37 = 2112;
              v38 = v13;
              __int16 v39 = 2112;
              id v40 = v25;
              id v20 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#E %s%sInvalid item <%@ %@> for bundle key %@", buf, 0x34u);
            }
          }

          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v27 objects:v41 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    if (!v8)
    {
      BOOL v21 = 0;
      goto LABEL_27;
    }
    v24 = v8;
    id v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v32 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v33 = 2080;
      __int16 v34 = " ";
      __int16 v35 = 2112;
      id v36 = (id)objc_opt_class();
      __int16 v37 = 2112;
      v38 = v8;
      __int16 v39 = 2112;
      id v40 = v25;
      id v23 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#E %s%sInvalid type <%@ %@> for bundle key %@", buf, 0x34u);
    }
  }
  BOOL v21 = 0;
LABEL_26:

  unsigned int v8 = v24;
LABEL_27:

  return v21;
}

- (BOOL)isIMAPServerTrusted:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && [v4 length])
  {
    char v21 = 0;
    if ([(IMAPService *)self isIMAPServerTrustedFQDN:v5 key:@"FQDN" whitelistExist:&v21])
    {
      id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(VVService *)self getServiceObjLogPrefix];
        id v8 = [v5 UTF8String];
        *(_DWORD *)buf = 136315650;
        id v23 = v7;
        __int16 v24 = 2080;
        id v25 = " ";
        __int16 v26 = 2080;
        id v27 = v8;
        id v9 = "#I %s%sHostname '%s' is whitelisted by FQDN rules";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0x20u);
      }
    }
    else if ([(IMAPService *)self isIMAPServerTrustedIP:v5 af:2 key:@"IPv4" whitelistExist:&v21])
    {
      id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(VVService *)self getServiceObjLogPrefix];
        id v12 = [v5 UTF8String];
        *(_DWORD *)buf = 136315650;
        id v23 = v11;
        __int16 v24 = 2080;
        id v25 = " ";
        __int16 v26 = 2080;
        id v27 = v12;
        id v9 = "#I %s%sIPv4 server '%s' is whitelisted";
        goto LABEL_19;
      }
    }
    else if ([(IMAPService *)self isIMAPServerTrustedIP:v5 af:30 key:@"IPv6" whitelistExist:&v21])
    {
      id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [(VVService *)self getServiceObjLogPrefix];
        id v14 = [v5 UTF8String];
        *(_DWORD *)buf = 136315650;
        id v23 = v13;
        __int16 v24 = 2080;
        id v25 = " ";
        __int16 v26 = 2080;
        id v27 = v14;
        id v9 = "#I %s%sIPv6 server '%s' is whitelisted";
        goto LABEL_19;
      }
    }
    else
    {
      value = (id *)self->logger.__ptr_.__value_;
      if (v21)
      {
        id v6 = sub_100020EE0(value);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [(VVService *)self getServiceObjLogPrefix];
          id v17 = [v5 UTF8String];
          *(_DWORD *)buf = 136315650;
          id v23 = v16;
          __int16 v24 = 2080;
          id v25 = " ";
          __int16 v26 = 2080;
          id v27 = v17;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#W %s%sHostname '%s' is not whitelisted", buf, 0x20u);
        }
        BOOL v10 = 0;
        goto LABEL_21;
      }
      id v6 = sub_100020EE0(value);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(VVService *)self getServiceObjLogPrefix];
        id v19 = [v5 UTF8String];
        *(_DWORD *)buf = 136315650;
        id v23 = v18;
        __int16 v24 = 2080;
        id v25 = " ";
        __int16 v26 = 2080;
        id v27 = v19;
        id v9 = "#I %s%sNo whitelist rules, allow any server address. Hostname '%s'";
        goto LABEL_19;
      }
    }
    BOOL v10 = 1;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v10 = 0;
LABEL_22:

  return v10;
}

- (void)_setServerInfoFromInterpretedNotification:(id)a3
{
  id v4 = a3;
  [(IMAPService *)self mf_lock];
  uint64_t v61 = kVMNotificationHostKey;
  BOOL v5 = objc_msgSend(v4, "objectForKey:");
  uint64_t v6 = kVMNotificationLoginKey;
  v64 = [v4 objectForKey:kVMNotificationLoginKey];
  uint64_t v7 = kVMNotificationPortKey;
  __int16 v63 = [v4 objectForKey:kVMNotificationPortKey];
  v62 = [v4 objectForKey:kVMNotificationPasswordKey];
  unsigned int v8 = [(IMAPService *)self isIMAPServerTrusted:v5];
  id v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = [(VVService *)self getServiceObjLogPrefix];
    $5A51FF831E2FC24F0087AEE6629E6188 imapServiceFlags = self->_imapServiceFlags;
    id v12 = "";
    *(_DWORD *)buf = 136317186;
    if (!v62) {
      id v12 = "not ";
    }
    CFIndex v69 = v10;
    __int16 v70 = 2080;
    v71 = " ";
    __int16 v72 = 2112;
    id v73 = v4;
    __int16 v74 = 1024;
    unsigned int v75 = v8;
    __int16 v76 = 2112;
    v77 = v5;
    __int16 v78 = 2112;
    v79 = v64;
    __int16 v80 = 2112;
    v81 = v63;
    __int16 v82 = 2080;
    v83 = v12;
    __int16 v84 = 1024;
    int v85 = (*(unsigned int *)&imapServiceFlags >> 8) & 1;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s_setServerInfoFromInterpretedNotification: %@, trusted:%d, host:%@, userName:%@, port:%@, passwd:%spresent, _imapServiceFlags.initializing:%d", buf, 0x54u);
  }
  uint64_t v59 = v7;
  uint64_t v60 = v6;

  if (v5 && v64 && v63)
  {
    if (v62)
    {
      if (v8)
      {
LABEL_10:
        uint64_t v13 = [(IMAPService *)self serviceAccount];
        if (v13)
        {
          long long v57 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, MailAccountHostname, v64, MFMailAccountUsername, v63, MailAccountPortNumber, 0);
          id v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315650;
            CFIndex v69 = v15;
            __int16 v70 = 2080;
            v71 = " ";
            __int16 v72 = 2112;
            id v73 = v57;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating IMAP Account with properties: %@", buf, 0x20u);
          }

          [v13 setHostname:v5];
          objc_msgSend(v13, "setPortNumber:", objc_msgSend(v63, "intValue"));
          [v13 setUsername:v64];
          [v13 setPassword:v62];
        }
        else
        {
          long long v57 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v5, MailAccountHostname, v64, MFMailAccountUsername, v63, MailAccountPortNumber, 0);
          long long v54 = [v4 objectForKey:@"IMAPNotificationPathPrefix"];
          if (v54) {
            [v57 setObject:v54 forKeyedSubscript:IMAPServerPathPrefix];
          }
          id v20 = [IMAPServiceAccount alloc];
          char v21 = [(VVService *)self getServiceObjLogPrefix];
          v53 = [(VVService *)self serviceLabelID];
          v52 = [(VVService *)self accountDir];
          long long v56 = [(VVService *)self serviceMDN];
          long long v55 = [(VVService *)self serviceICC];
          unsigned int v22 = [(VVService *)self contextInfo];
          id v23 = [v22 uuid];
          __int16 v24 = [v23 UUIDString];
          id v25 = [(IMAPServiceAccount *)v20 initWithProperties:v57 mambaID:v21 label:v53 accountDir:v52 phoneNumber:v56 isoCountryCode:v55 networkIdentifier:v24];
          [(IMAPService *)self setServiceAccount:v25];

          __int16 v26 = [(VVService *)self carrierParameterValueForKey:@"kIMAPLongLifeMessagesCache"];
          LODWORD(v20) = [v26 BOOLValue];

          if (v20)
          {
            id v27 = [(IMAPService *)self serviceAccount];
            [v27 setLongLifeMessagesCache];
          }
          long long v28 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            long long v29 = [(VVService *)self getServiceObjLogPrefix];
            long long v30 = [(IMAPService *)self serviceAccount];
            *(_DWORD *)buf = 136315650;
            CFIndex v69 = v29;
            __int16 v70 = 2080;
            v71 = " ";
            __int16 v72 = 2112;
            id v73 = v30;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#I %s%s_setServerInfoFromInterpretedNotification: serviceAccount created: %@", buf, 0x20u);
          }
          if ((*(_WORD *)&self->_imapServiceFlags & 0x100) != 0)
          {
            if (v62)
            {
              -[VVService setPassword:](self, "setPassword:");
            }
            else
            {
              v62 = [(VVService *)self passwordIgnoringSubscription:1];
              if (!v62)
              {
                [(IMAPService *)self setServiceAccount:0];
                int v31 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  v32 = [(VVService *)self getServiceObjLogPrefix];
                  *(_DWORD *)buf = 136315394;
                  CFIndex v69 = v32;
                  __int16 v70 = 2080;
                  v71 = " ";
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#I %s%s_setServerInfoFromInterpretedNotification: serviceAccount destroyed because of no passwd", buf, 0x16u);
                }

                v62 = 0;
              }
            }
          }
          __int16 v33 = [(IMAPService *)self serviceAccount];
          BOOL v34 = v33 == 0;

          if (v34)
          {
            uint64_t v13 = 0;
          }
          else
          {
            uint64_t v13 = [(IMAPService *)self serviceAccount];
            [v13 setService:self];
            __int16 v35 = [(IMAPService *)self _messageChangeQueue];
            [v13 setInvocationQueue:v35];

            id v36 = [(VVService *)self carrierParameterValueForKey:@"IdleConnectionTimeout"];
            objc_msgSend(v13, "setConnectionIdleTimeout:", (double)(int)objc_msgSend(v36, "intValue") * 60.0);

            [v13 setPassword:v62];
            __int16 v37 = [(VVService *)self carrierParameterValueForKey:@"UsesSSL"];
            objc_msgSend(v13, "setUsesSSL:", objc_msgSend(v37, "BOOLValue"));

            v38 = [(VVService *)self carrierParameterValueForKey:@"AuthenticationScheme"];
            if (v38)
            {
              __int16 v39 = +[MFAuthScheme schemeWithName:v38];
              if (v39) {
                [v13 setPreferredAuthScheme:v39];
              }
            }
            if ([(VVService *)self isSubscribed])
            {
              id v40 = +[NSNotificationCenter defaultCenter];
              [v40 addObserver:self selector:"handleIMAPAccountOfflineOperationQueuedNotification:" name:IMAPAccountOfflineOperationQueuedNotification object:v13];

              [(IMAPService *)self _cancelBeacon];
              [(IMAPService *)self _setBeaconCount:0];
              [(IMAPService *)self _resetBeaconTemporaryRetryCount];
            }
          }
        }

        uint64_t v41 = [v13 library];
        v42 = (void *)v41;
        if (!self->_attachmentManager && v41)
        {
          v43 = (MFAttachmentLibraryManager *)[objc_alloc((Class)MFAttachmentLibraryManager) initWithPrimaryLibrary:v41];
          attachmentManager = self->_attachmentManager;
          self->_attachmentManager = v43;
        }
        if ((*(_WORD *)&self->_imapServiceFlags & 0x100) == 0)
        {
          v58 = [v13 username];
          if ([(VVService *)self isSubscribed]
            && [v64 length]
            && (!v58 || ([v58 isEqualToString:v64] & 1) == 0))
          {
            [(IMAPService *)self synchronize:1 reason:@"Updating IMAP Account"];
          }
          v45 = [(IMAPService *)self _parameters];
          v46 = [v45 objectForKey:@"AccountSettings"];
          if (v46) {
            id v47 = 0;
          }
          else {
            id v47 = objc_alloc_init((Class)NSMutableDictionary);
          }
          id v67 = v47;
          [(IMAPService *)self _setAccountValue:v5 forKey:v61 inDictionary:&v67 ifDifferentInDictionary:v46];
          id v48 = v67;

          id v66 = v48;
          [(IMAPService *)self _setAccountValue:v64 forKey:v60 inDictionary:&v66 ifDifferentInDictionary:v46];
          id v49 = v66;

          id v65 = v49;
          [(IMAPService *)self _setAccountValue:v63 forKey:v59 inDictionary:&v65 ifDifferentInDictionary:v46];
          id v50 = v65;

          v51 = [(VVService *)self password];
          LOBYTE(v49) = [v62 isEqualToString:v51];

          if ((v49 & 1) == 0) {
            [(VVService *)self setPassword:v62];
          }
          if (v50)
          {
            [v45 setValue:v50 forKey:@"AccountSettings"];
            [(IMAPService *)self _saveParameters];
          }
        }
        goto LABEL_60;
      }
    }
    else if (*((unsigned char *)&self->_imapServiceFlags + 1) & v8)
    {
      goto LABEL_10;
    }
  }
  v16 = [(IMAPService *)self serviceAccount];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    id v18 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315394;
      CFIndex v69 = v19;
      __int16 v70 = 2080;
      v71 = " ";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%sWe dont have an account and we didnt get password in the server info - requesting new server info", buf, 0x16u);
    }

    [(IMAPService *)self _startBeacon];
  }
LABEL_60:
  [(IMAPService *)self mf_unlock];
}

- (void)setOnline:(BOOL)a3
{
  if (((*(unsigned char *)&self->super._serviceFlags & 1) == 0) != a3)
  {
    BOOL v3 = a3;
    v6.receiver = self;
    v6.super_class = (Class)IMAPService;
    -[VVService setOnline:](&v6, "setOnline:");
    BOOL v5 = [(IMAPService *)self serviceAccount];
    [v5 setIsOffline:!v3];

    if (v3) {
      [(IMAPService *)self synchronize:0 reason:@"SetOnline"];
    }
  }
}

- (void)scheduleReleaseAllAccountConnections:(id)a3 reason:(id)a4 forService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_initWeak(&location, a5);
    BOOL v10 = self->_activityController;
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005B910;
    block[3] = &unk_1000C28D8;
    objc_copyWeak(&v17, &location);
    id v14 = v8;
    id v15 = v9;
    v16 = v10;
    id v12 = v10;
    dispatch_async(v11, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)handleDataContextDeactivated
{
  id v3 = [(IMAPService *)self serviceAccount];
  -[IMAPService scheduleReleaseAllAccountConnections:reason:forService:](self, "scheduleReleaseAllAccountConnections:reason:forService:");
}

- (void)handleIMAPAccountOfflineOperationQueuedNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    id v8 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v9 = 2080;
    BOOL v10 = " ";
    __int16 v11 = 2112;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v4;
    id v6 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling <%@>", (uint8_t *)&v7, 0x2Au);
  }
  [(IMAPService *)self mf_lock];
  *(_WORD *)&self->_imapServiceFlags |= 2u;
  [(IMAPService *)self mf_unlock];
}

- (void)setSmscAddress:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMAPService;
  [(VVService *)&v17 setSmscAddress:v4];
  if (v4) {
    BOOL v5 = [v4 length] != 0;
  }
  else {
    BOOL v5 = 0;
  }
  [(IMAPService *)self mf_lock];
  __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
  BOOL v7 = (imapServiceFlags & 0x800) == 0;
  if (v5) {
    __int16 v8 = 2048;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->___int16 imapServiceFlags = imapServiceFlags & 0xF7FF | v8;
  [(IMAPService *)self mf_unlock];
  __int16 v9 = [(VVService *)self verifier];
  [v9 storeValue:v5 forCheckpointKey:@"SMSCAvailable"];

  BOOL v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  BOOL v11 = v5 ^ v7;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(VVService *)self getServiceObjLogPrefix];
    uint64_t v13 = [(VVService *)self contextInfo];
    id v14 = (void *)v13;
    CFStringRef v15 = @"changed";
    *(_DWORD *)buf = 136316162;
    id v19 = v12;
    if (v11) {
      CFStringRef v15 = @"not changed";
    }
    CFStringRef v16 = @"not available";
    __int16 v20 = 2080;
    char v21 = " ";
    __int16 v22 = 2112;
    if (v5) {
      CFStringRef v16 = @"available";
    }
    CFStringRef v23 = v16;
    __int16 v24 = 2112;
    CFStringRef v25 = v15;
    __int16 v26 = 2112;
    uint64_t v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sSMSC address is %@, %@, subscription %@", buf, 0x34u);
  }
  if (v5 && !v11) {
    [(IMAPService *)self _startBeacon];
  }
}

- (void)_carrierBundleChanged
{
  [(IMAPService *)self mf_lock];
  v4.receiver = self;
  v4.super_class = (Class)IMAPService;
  [(VVService *)&v4 _carrierBundleChanged];
  [(IMAPService *)self _setBeaconCount:0];
  [(IMAPService *)self _resetBeaconTemporaryRetryCount];
  id v3 = [(IMAPService *)self _parameters];
  [v3 setObject:&__kCFBooleanTrue forKey:@"BeaconRefresh"];

  [(IMAPService *)self _saveParameters];
  [(IMAPService *)self _startBeacon];
  [(IMAPService *)self mf_unlock];
}

- (void)refreshIfNeeded
{
  [(IMAPService *)self mf_lock];
  [(IMAPService *)self _setBeaconCount:0];
  [(IMAPService *)self _resetBeaconTemporaryRetryCount];
  id v3 = [(VVService *)self carrierParameterValueForKey:@"SendBeaconOnBootup"];
  objc_super v4 = v3;
  if (v3 && [v3 BOOLValue])
  {
    BOOL v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      __int16 v8 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v9 = 2080;
      BOOL v10 = " ";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sRefresh requested", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(IMAPService *)self _parameters];
    [v6 setObject:&__kCFBooleanTrue forKey:@"BeaconRefresh"];

    [(IMAPService *)self _saveParameters];
  }
  [(IMAPService *)self mf_unlock];
}

- (unsigned)_beaconCount
{
  [(IMAPService *)self mf_lock];
  id v3 = [(IMAPService *)self _parameters];
  objc_super v4 = [v3 objectForKey:@"BeaconCount"];
  unsigned int v5 = [v4 intValue];

  [(IMAPService *)self mf_unlock];
  return v5;
}

- (void)_setBeaconCount:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(IMAPService *)self mf_lock];
  if ([(IMAPService *)self _beaconCount] != v3)
  {
    unsigned int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v10 = 2080;
      BOOL v11 = " ";
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating beacon count to: %u", (uint8_t *)&v8, 0x1Cu);
    }

    id v6 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v3];
    int v7 = [(IMAPService *)self _parameters];
    [v7 setObject:v6 forKey:@"BeaconCount"];

    [(IMAPService *)self _saveParameters];
  }
  [(IMAPService *)self mf_unlock];
}

- (void)_cancelBeacon
{
  uint64_t v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v7 = 2080;
    int v8 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sUnregistering beacon retry activity in cancelBeacon", (uint8_t *)&v5, 0x16u);
  }

  [(IMAPService *)self mf_lock];
  id v4 = [(IMAPService *)self beaconRetryActivityIdentifier];
  xpc_activity_unregister((const char *)[v4 UTF8String]);

  self->_beaconRetryRegistered = 0;
  self->_nextBeaconTime = 0.0;
  [(IMAPService *)self mf_unlock];
}

- (void)_doneBeacon
{
  uint64_t v3 = [(IMAPService *)self _parameters];
  [v3 removeObjectForKey:@"BeaconRefresh"];

  [(IMAPService *)self _saveParameters];
}

- (void)kill
{
  v3.receiver = self;
  v3.super_class = (Class)IMAPService;
  [(VVService *)&v3 kill];
  [(IMAPService *)self _cancelBeacon];
}

- (void)_startBeacon
{
  if ([(VVService *)self isSMSReady])
  {
    objc_super v3 = [(VVService *)self carrierParameterValueForKey:@"BeaconAddress"];
    if ([v3 length])
    {
      [(IMAPService *)self mf_lock];
      double Current = CFAbsoluteTimeGetCurrent();
      double nextBeaconTime = self->_nextBeaconTime;
      id v6 = [(IMAPService *)self serviceAccount];
      unsigned int v7 = [(IMAPService *)self isBeaconActive];
      int v8 = [(IMAPService *)self _parameters];
      __int16 v9 = [v8 objectForKey:@"BeaconRefresh"];
      double v10 = Current - nextBeaconTime;

      BOOL v11 = v10 <= (double)(2 * XPC_ACTIVITY_INTERVAL_1_MIN) || self->_nextBeaconTime == 0.0;
      id v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v15 = [(VVService *)self getServiceObjLogPrefix];
        double v16 = self->_nextBeaconTime;
        int v17 = *(_WORD *)&self->_imapServiceFlags >> 5;
        id v18 = "false";
        *(_DWORD *)v46 = 136317186;
        if (v11) {
          id v19 = "true";
        }
        else {
          id v19 = "false";
        }
        *(void *)&v46[4] = v15;
        *(_WORD *)&v46[12] = 2080;
        *(void *)&v46[14] = " ";
        if (v9) {
          id v18 = "true";
        }
        *(_WORD *)&v46[22] = 1024;
        *(_DWORD *)id v47 = v7;
        *(_WORD *)&v47[4] = 2048;
        *(double *)&v47[6] = v10;
        __int16 v48 = 2048;
        double v49 = v16;
        __int16 v50 = 1024;
        int v51 = v17;
        __int16 v52 = 2112;
        v53 = v6;
        __int16 v54 = 2080;
        long long v55 = v19;
        __int16 v56 = 2080;
        long long v57 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sCurrent beacon state - activeBeacon: %d, delta: %f, nextBeaconTime: %f, accountState: %d for account %@, time to: %s, refresh requested: %s", v46, 0x54u);
      }

      if (v11)
      {
        if ((int v20 = *(_WORD *)&self->_imapServiceFlags >> 5) == 0
          || v9
          || (v20 != 2 ? (v20 == 3 ? (BOOL v21 = v6 == 0) : (BOOL v21 = 0)) : (BOOL v21 = v6 == 0),
              !v21 ? (char v22 = 1) : (char v22 = v7),
              (v22 & 1) == 0))
        {
          int v23 = [(IMAPService *)self _beaconCount];
          __int16 v24 = [(VVService *)self carrierParameterValueForKey:@"MaxBeaconCount"];
          LOBYTE(v23) = v23 < (int)[v24 intValue];

          if (v23)
          {
            if ((*(_WORD *)&self->_imapServiceFlags & 0x800) != 0
              || (-[VVService carrierParameterValueForKey:](self, "carrierParameterValueForKey:", @"BypassSMSCAvailabilityCheck"), v25 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v26 = [v25 BOOLValue], v25, (v26 & 1) != 0))
            {
              uint64_t v27 = [(VVService *)self carrierParameterValueForKey:@"BeaconServiceCenter"];
              if (![v27 length])
              {

                uint64_t v27 = 0;
              }
              long long v28 = @"BeaconTimeout";
              long long v29 = [VMCarrierStateRequest alloc];
              long long v30 = [(VVService *)self contextInfo];
              int v31 = [v30 context];
              v32 = [(VMCarrierStateRequest *)v29 initWithSubscription:v31 destination:v3 serviceCenter:v27];

              [(VVService *)self incrementAttemptCountForStateRequest:v32];
              __int16 v33 = [(VVService *)self stateRequestController];
              [v33 addRequest:v32];

              BOOL v34 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v35 = [(VVService *)self getServiceObjLogPrefix];
                id v36 = [(VMCarrierStateRequest *)v32 debugDescription];
                *(_DWORD *)v46 = 136315650;
                *(void *)&v46[4] = v35;
                *(_WORD *)&v46[12] = 2080;
                *(void *)&v46[14] = " ";
                *(_WORD *)&v46[22] = 2112;
                *(void *)id v47 = v36;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#I %s%sWe're registered and activated and SMS is available stateRequest: %@", v46, 0x20u);
              }
            }
            else
            {
              uint64_t v27 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v43 = [(VVService *)self getServiceObjLogPrefix];
                *(_DWORD *)v46 = 136315394;
                *(void *)&v46[4] = v43;
                *(_WORD *)&v46[12] = 2080;
                *(void *)&v46[14] = " ";
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%sSMSC address is not yet available.. holding off", v46, 0x16u);
              }
              long long v28 = 0;
            }

            if ([(__CFString *)v28 length])
            {
              v44 = [(VVService *)self carrierParameterValueForKey:v28];
              unsigned int v45 = [v44 intValue];

              if (!self->_beaconRetryRegistered) {
                [(IMAPService *)self _scheduleBeaconRetry:(int)(60 * v45)];
              }
              self->_double nextBeaconTime = CFAbsoluteTimeGetCurrent() + (double)(unint64_t)(int)(60 * v45);
            }
          }
          else
          {
            __int16 v37 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = [(VVService *)self getServiceObjLogPrefix];
              *(_DWORD *)v46 = 136315394;
              *(void *)&v46[4] = v38;
              *(_WORD *)&v46[12] = 2080;
              *(void *)&v46[14] = " ";
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I %s%sBeacons are maxed out; stopping.",
                v46,
                0x16u);
            }

            __int16 v39 = [(VVService *)self contextInfo];
            id v40 = [v39 slotID];

            long long v28 = [(VVService *)self serviceMCC];
            uint64_t v41 = [(VVService *)self serviceMNC];
            v42 = +[VMAWDReporter sharedInstance];
            [v42 reportServiceBeaconMaxedOut:v40 mcc:v28 mnc:v41];

            [(IMAPService *)self _cancelBeacon];
          }
        }
      }
      [(IMAPService *)self mf_unlock];
    }
    else
    {
      id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 136315394;
        *(void *)&v46[4] = [(VVService *)self getServiceObjLogPrefix];
        *(_WORD *)&v46[12] = 2080;
        *(void *)&v46[14] = " ";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sI'd send out a beacon, but I don't have a place to send it.  Oh well.", v46, 0x16u);
      }
    }
  }
  else
  {
    objc_super v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [(VVService *)self getServiceObjLogPrefix];
      int v13 = [(VVService *)self contextInfo];
      *(_DWORD *)v46 = 136315650;
      *(void *)&v46[4] = v12;
      *(_WORD *)&v46[12] = 2080;
      *(void *)&v46[14] = " ";
      *(_WORD *)&v46[22] = 2112;
      *(void *)id v47 = v13;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sDeferring STATE request until SMS is ready for subscription %@.", v46, 0x20u);
    }
  }
}

- (void)_resetBeaconTemporaryRetryCount
{
  self->_beaconTemporaryRetryCFIndex Count = 0;
}

- (void)_incrementBeaconTemporaryRetryCount
{
}

- (void)_incrementBeaconCount
{
  [(IMAPService *)self _setBeaconCount:[(IMAPService *)self _beaconCount] + 1];
  id v3 = [(VVService *)self verifier];
  [v3 storeValue:1 forCheckpointKey:@"BeaconSent"];

  if ([(IMAPService *)self _beaconCount] >= 2)
  {
    id v4 = [(VVService *)self verifier];
    [v4 storeValue:0 forCheckpointKey:@"BeaconResponseReceived"];
  }
}

- (void)_scheduleBeaconRetry:(unint64_t)a3
{
  int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    unsigned int v7 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3];
    *(_DWORD *)buf = 136315650;
    id v14 = v6;
    __int16 v15 = 2080;
    double v16 = " ";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sScheduling next beacon for %@", buf, 0x20u);
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v8, XPC_ACTIVITY_DELAY, a3);
  xpc_dictionary_set_int64(v8, XPC_ACTIVITY_INTERVAL, a3);
  xpc_dictionary_set_int64(v8, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_string(v8, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  objc_initWeak((id *)buf, self);
  id v9 = [(IMAPService *)self beaconRetryActivityIdentifier];
  double v10 = (const char *)[v9 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005D1EC;
  handler[3] = &unk_1000C2448;
  objc_copyWeak(&v12, (id *)buf);
  xpc_activity_register(v10, v8, handler);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
  self->_beaconRetryRegistered = 1;
}

- (void)_authenticationFailed
{
  id v3 = [(VVService *)self carrierParameterValueForKey:@"SendBeaconOnLoginFailure"];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    [(IMAPService *)self mf_lock];
    int v5 = [(IMAPService *)self serviceAccount];
    if (v5 && (*(_WORD *)&self->_imapServiceFlags & 0xC0) == 0x40)
    {
      id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v11 = [(VVService *)self getServiceObjLogPrefix];
        __int16 v12 = 2080;
        int v13 = " ";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#W %s%sAuthentication failed; deleting account",
          buf,
          0x16u);
      }

      unsigned int v7 = +[NSNotificationCenter defaultCenter];
      [v7 removeObserver:self name:IMAPAccountOfflineOperationQueuedNotification object:v5];

      [(IMAPService *)self setServiceAccount:0];
      xpc_object_t v8 = [(VVService *)self serialDispatchQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005D61C;
      block[3] = &unk_1000C1A98;
      void block[4] = self;
      dispatch_async(v8, block);

      [(VVService *)self cancelAutomatedTrashCompaction];
      [(IMAPService *)self _startBeacon];
    }
    [(IMAPService *)self mf_unlock];
  }
}

- (void)imapTransactionEnded
{
  id v3 = [(VVService *)self carrierParameterValueForKey:@"kIMAPLongLifeMessagesCache"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    [(IMAPService *)self mf_lock];
    int v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      xpc_object_t v8 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v9 = 2080;
      double v10 = " ";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%simapTransactionEnded...", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(IMAPService *)self serviceAccount];
    [v6 flushIMAPServiceLibraryCache];
    [(IMAPService *)self mf_unlock];
  }
}

- (void)setMailboxRequiresSetup:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VVService *)self mailboxRequiresSetup] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)IMAPService;
    [(VVService *)&v5 setMailboxRequiresSetup:v3];
    [(IMAPService *)self mf_lock];
    if (![(VVService *)self mailboxRequiresSetup]
      && (*(_WORD *)&self->_imapServiceFlags & 0xC0) == 0x40)
    {
      [(IMAPService *)self _setAccountState:3];
      *(_WORD *)&self->___int16 imapServiceFlags = ((*(_WORD *)&self->_imapServiceFlags >> 7) & 2 | *(_WORD *)&self->_imapServiceFlags & 0xFFFD) ^ 2;
      [(VVService *)self scheduleAutomatedTrashCompaction];
    }
    [(IMAPService *)self mf_unlock];
  }
}

- (void)_setAccountState:(int64_t)a3
{
  [(IMAPService *)self mf_lock];
  if (*(_WORD *)&self->_imapServiceFlags >> 5 == a3)
  {
    if (!a3 && (*(_WORD *)&self->_imapServiceFlags & 0x100) != 0) {
      [(IMAPService *)self _startBeacon];
    }
  }
  else
  {
    objc_super v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(VVService *)self getServiceObjLogPrefix];
      if ((unint64_t)(a3 - 1) > 2) {
        CFStringRef v7 = @"Unknown";
      }
      else {
        CFStringRef v7 = off_1000C2A58[a3 - 1];
      }
      xpc_object_t v8 = [(VVService *)self contextInfo];
      int v17 = 136315906;
      id v18 = v6;
      __int16 v19 = 2080;
      int v20 = " ";
      __int16 v21 = 2112;
      CFStringRef v22 = v7;
      __int16 v23 = 2112;
      __int16 v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sIMAP Service STATE = %@, subscription %@", (uint8_t *)&v17, 0x2Au);
    }
    __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
    *(_WORD *)&self->___int16 imapServiceFlags = imapServiceFlags & 0xFF1F | (32 * (a3 & 7));
    double v10 = +[VMAWDReporter sharedInstance];
    [v10 reportServiceAccountStateChanged:a3];

    switch(a3)
    {
      case 0:
        goto LABEL_13;
      case 1:
        if ((imapServiceFlags & 0xC0) == 0x40)
        {
          BOOL v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          imapParameters = self->_imapParameters;
          self->_imapParameters = v11;
        }
LABEL_13:
        [(IMAPService *)self _setBeaconCount:0];
        [(IMAPService *)self _resetBeaconTemporaryRetryCount];
        [(IMAPService *)self setSubscribed:0];
        break;
      case 2:
        [(IMAPService *)self _setActiveGreetingType:3];
        [(IMAPService *)self _setGreetingCached:0];
        [(IMAPService *)self setSubscribed:1];
        [(IMAPService *)self setMailboxRequiresSetup:1];
        break;
      case 3:
        [(IMAPService *)self setSubscribed:1];
        [(IMAPService *)self setMailboxRequiresSetup:0];
        break;
      default:
        break;
    }
    if ((*(_WORD *)&self->_imapServiceFlags & 0x100) == 0)
    {
      int v13 = [(IMAPService *)self _parameters];
      id v14 = qword_1000C2A38[a3];
      if (a3) {
        [v13 setObject:v14 forKey:@"AccountState"];
      }
      else {
        [v13 removeObjectForKey:@"AccountState"];
      }
      [(IMAPService *)self _saveParameters];
    }
    if (!a3) {
      goto LABEL_25;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      [(IMAPService *)self _cancelBeacon];
      goto LABEL_27;
    }
    __int16 v15 = [(IMAPService *)self serviceAccount];
    BOOL v16 = v15 == 0;

    if (v16)
    {
LABEL_25:
      [(IMAPService *)self _startBeacon];
    }
    else
    {
      [(IMAPService *)self _cancelBeacon];
      [(IMAPService *)self _setBeaconCount:0];
    }
  }
LABEL_27:
  [(IMAPService *)self mf_unlock];
}

- (void)_inferActiveState
{
  [(IMAPService *)self mf_lock];
  if ((*(_WORD *)&self->_imapServiceFlags & 0xC0) != 0x40) {
    [(IMAPService *)self _setAccountState:0];
  }
  [(IMAPService *)self mf_unlock];
}

- (void)_setMessageWaitingFromNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 objectForKey:kVMNotificationMWIKey];
  if ([v5 length])
  {
    unsigned int v6 = [v5 intValue];
    [(VVService *)self setMessageWaiting:v6 != 0];
    CFStringRef v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v10 = 2080;
      BOOL v11 = " ";
      __int16 v12 = 1024;
      unsigned int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sOut-of-band MWI received: %u", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (BOOL)respectsMWINotifications
{
  id v2 = [(VVService *)self carrierParameterValueForKey:@"UsesMWI"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)handleNotification:(id)a3 isMWI:(BOOL)a4
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (v5)
  {
    CFStringRef v7 = [v5 objectForKey:kVMNotificationNameKey];
    int v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315650;
      long long v28 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v29 = 2080;
      long long v30 = " ";
      __int16 v31 = 2112;
      v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sReceived %@ notification", (uint8_t *)&v27, 0x20u);
    }

    if ([(__CFString *)v7 isEqualToString:kVMStateNotificationName])
    {
      __int16 v9 = [v6 objectForKey:kVMNotificationStateKey];
      if (v9)
      {
        __int16 v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v11 = [(VVService *)self getServiceObjLogPrefix];
          int v27 = 136315394;
          long long v28 = v11;
          __int16 v29 = 2080;
          long long v30 = " ";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sUnregistering beacon retry activity in handleNotification:isMWI", (uint8_t *)&v27, 0x16u);
        }

        [(IMAPService *)self setBeaconActive:0];
        id v12 = [(IMAPService *)self beaconRetryActivityIdentifier];
        xpc_activity_unregister((const char *)[v12 UTF8String]);

        [(IMAPService *)self _doneBeacon];
        [(IMAPService *)self _resetBeaconTemporaryRetryCount];
        unint64_t v13 = (unint64_t)sub_100057F20(v9);
        if (v13)
        {
          id v14 = [(VVService *)self verifier];
          [v14 storeValue:1 forCheckpointKey:@"BeaconResponseReceived"];

          if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2) {
            [(IMAPService *)self _setServerInfoFromInterpretedNotification:v6];
          }
          [(IMAPService *)self _setAccountState:v13];
          if (v13 == 3) {
            [(IMAPService *)self synchronize:0 reason:@"StateActive"];
          }
        }
      }
LABEL_21:

      goto LABEL_22;
    }
    if ([(__CFString *)v7 isEqualToString:kVMServerChangedNotificationName])
    {
      [(IMAPService *)self _setServerInfoFromInterpretedNotification:v6];
    }
    else
    {
      if (![(__CFString *)v7 isEqualToString:kVMGreetingChangedNotificationName])
      {
        if (![(__CFString *)v7 isEqualToString:kVMMailboxChangedNotificationName])
        {
LABEL_28:

          goto LABEL_29;
        }
        __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
        __int16 v9 = [(VVService *)self serviceMCC];
        BOOL v16 = [(VVService *)self serviceMNC];
        int v17 = [(VVService *)self contextInfo];
        id v18 = [v17 slotID];

        uint64_t v19 = +[VMAWDReporter sharedInstance];
        [(id)v19 reportVoicemailReceivedNotification:imapServiceFlags >> 5 mcc:v9 mnc:v16 notificationType:1 slotID:v18];

        [(IMAPService *)self _setServerInfoFromInterpretedNotification:v6];
        [(IMAPService *)self _inferActiveState];
        [(IMAPService *)self synchronize:1 reason:@"MBOXUPDATE"];
        int v20 = [(VVService *)self carrierParameterValueForKey:@"UsesMWI"];
        LOBYTE(v19) = [v20 BOOLValue];

        if ((v19 & 1) == 0) {
          [(IMAPService *)self _setMessageWaitingFromNotification:v6];
        }

        goto LABEL_21;
      }
      [(IMAPService *)self _setServerInfoFromInterpretedNotification:v6];
      [(IMAPService *)self _inferActiveState];
      [(IMAPService *)self _setActiveGreetingType:3];
      [(IMAPService *)self _setGreetingCached:0];
      [(IMAPService *)self synchronize:1 reason:@"GREETINGCHANGED"];
    }
LABEL_22:
    __int16 v21 = [v6 objectForKey:kVMNotificationTimestampKey];
    if ([v21 length])
    {
      VMStoreSetTimestampForTokenWithKey((uint64_t)[v21 intValue], v7);
    }
    else
    {
      CFStringRef v22 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = [(VVService *)self getServiceObjLogPrefix];
        int v27 = 136315394;
        long long v28 = v23;
        __int16 v29 = 2080;
        long long v30 = " ";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%sNotification lacked _timestamp parameter. Setting timestamp to distant past.", (uint8_t *)&v27, 0x16u);
      }

      __int16 v24 = +[NSDate date];
      CFStringRef v25 = +[NSDate distantPast];
      [v24 timeIntervalSinceDate:v25];
      VMStoreSetTimestampForTokenWithKey(v26, v7);
    }
    goto LABEL_28;
  }
LABEL_29:
}

- (void)_checkForQueuedNotifications
{
  id v3 = objc_alloc((Class)NSArray);
  uint64_t v27 = kVMMailboxChangedNotificationName;
  id v29 = objc_msgSend(v3, "initWithObjects:", kVMStateNotificationName, kVMMailboxChangedNotificationName, kVMGreetingChangedNotificationName, kVMServerChangedNotificationName, 0);
  id v4 = 0;
  id v5 = (char *)[v29 count];
  if (v5)
  {
    unsigned int v6 = 0;
    key = (const void *)kVMNotificationTimestampKey;
    do
    {
      CFStringRef v7 = [v29 objectAtIndex:v6];
      int v8 = (void *)sub_100073E3C(v7);
      if ([v8 length])
      {
        unsigned int TimestampForTokenWithKey = VMStoreGetTimestampForTokenWithKey(v7);
        CFDictionaryRef v10 = (const __CFDictionary *)VMCopyDictionaryForNotificationString();
        CFDictionaryRef v11 = v10;
        if (v10)
        {
          id v12 = CFDictionaryGetValue(v10, key);
          id v13 = [v12 intValue];
          if (TimestampForTokenWithKey && v13 <= TimestampForTokenWithKey)
          {
            if ([(__CFString *)v7 isEqualToString:v27])
            {
              id v14 = [(VVService *)self carrierParameterValueForKey:@"UsesMWI"];
              unsigned __int8 v15 = [v14 BOOLValue];

              if ((v15 & 1) == 0) {
                [(IMAPService *)self _setMessageWaitingFromNotification:v11];
              }
            }
          }
          else
          {
            v36[0] = v11;
            BOOL v16 = +[NSNumber numberWithUnsignedInt:v13];
            v36[1] = v16;
            int v17 = +[NSArray arrayWithObjects:v36 count:2];

            if (!v4) {
              id v4 = objc_alloc_init((Class)NSMutableArray);
            }
            [v4 addObject:v17];
          }
          CFRelease(v11);
        }
      }

      ++v6;
    }
    while (v5 != v6);
  }
  id v18 = (char *)[v4 count];
  if (v18)
  {
    v37.id location = 0;
    v37.length = (CFIndex)v18;
    CFArraySortValues((CFMutableArrayRef)v4, v37, (CFComparatorFunction)sub_10005E7D8, 0);
    uint64_t v19 = 0;
    int v20 = (const void *)kVMNotificationNameKey;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)[v4 objectAtIndex:v19], 0);
      CFDictionaryRef v22 = ValueAtIndex;
      if (ValueAtIndex)
      {
        CFTypeID v23 = CFGetTypeID(ValueAtIndex);
        if (v23 == CFDictionaryGetTypeID())
        {
          __int16 v24 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v25 = [(VVService *)self getServiceObjLogPrefix];
            Value = CFDictionaryGetValue(v22, v20);
            *(_DWORD *)buf = 136315650;
            __int16 v31 = v25;
            __int16 v32 = 2080;
            __int16 v33 = " ";
            __int16 v34 = 2112;
            __int16 v35 = Value;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I %s%sPlaying back queued %@ notification.", buf, 0x20u);
          }

          [(IMAPService *)self handleNotification:v22 isMWI:0];
        }
      }
      ++v19;
    }
    while (v18 != v19);
  }
}

- (id)_messageChangeQueue
{
  [(IMAPService *)self mf_lock];
  messageChangeQueue = self->_messageChangeQueue;
  if (!messageChangeQueue)
  {
    id v4 = (MFInvocationQueue *)objc_alloc_init((Class)MFInvocationQueue);
    id v5 = self->_messageChangeQueue;
    self->_messageChangeQueue = v4;

    messageChangeQueue = self->_messageChangeQueue;
  }
  unsigned int v6 = messageChangeQueue;
  [(IMAPService *)self mf_unlock];
  return v6;
}

- (void)setSMSReady:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VVService *)self isSMSReady] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)IMAPService;
    [(VVService *)&v5 setSMSReady:v3];
    [(IMAPService *)self _cancelBeacon];
    if (v3) {
      [(IMAPService *)self _startBeacon];
    }
  }
}

- (int)minimumPasswordLength
{
  id v2 = [(VVService *)self carrierParameterValueForKey:@"MinPINLength"];
  int v3 = [v2 intValue];

  return v3;
}

- (int)maximumPasswordLength
{
  id v2 = [(VVService *)self carrierParameterValueForKey:@"MaxPINLength"];
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)passwordChangeRequiresEnteringOldPassword
{
  return 0;
}

- (BOOL)doesClientManageTrashCompaction
{
  id v2 = [(VVService *)self carrierParameterValueForKey:@"ClientManagesTrash"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)taskOfTypeExists:(int64_t)a3
{
  return [(IMAPServiceActivityController *)self->_activityController taskOfTypeExists:a3];
}

- (BOOL)dataForRecordPending:(void *)a3 progressiveLoadInProgress:(BOOL *)a4
{
  CFStringRef v7 = -[IMAPServiceActivityController bodyFetchActivityForRecord:](self->_activityController, "bodyFetchActivityForRecord:");

  if (a4)
  {
    if (v7) {
      BOOL v8 = [(IMAPServiceBodyLoadMonitor *)self->_bodyLoadMonitor progressiveBodyLoadHasStartedForRecord:a3];
    }
    else {
      BOOL v8 = 0;
    }
    *a4 = v8;
  }
  return v7 != 0;
}

- (BOOL)greetingFetchExistsProgressiveLoadInProgress:(BOOL *)a3
{
  unsigned int v5 = [(IMAPServiceActivityController *)self->_activityController taskOfTypeExists:3];
  BOOL v6 = v5;
  if (a3)
  {
    if (v5) {
      BOOL v7 = [(IMAPServiceBodyLoadMonitor *)self->_bodyLoadMonitor progressiveBodyLoadHasStartedForRecord:0];
    }
    else {
      BOOL v7 = 0;
    }
    *a3 = v7;
  }
  return v6;
}

- (void)progressiveDataLengthsForRecord:(void *)a3 expected:(unsigned int *)a4 current:(unsigned int *)a5
{
}

- (BOOL)isInSync
{
  return (*(_WORD *)&self->_imapServiceFlags & 3) == 0;
}

- (void)_updateMailboxUsage
{
  unsigned __int8 v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v14 = 2080;
    unsigned __int8 v15 = " ";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Updating quota information...", (uint8_t *)&v12, 0x16u);
  }

  id v4 = [(IMAPService *)self serviceAccount];
  [v4 mailboxUsage];
  float v6 = v5;

  [(VVService *)self setMailboxUsage:(int)(float)(v6 * 100.0)];
  [(VVService *)self setMailboxUsageUpdated:1];
  BOOL v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(VVService *)self getServiceObjLogPrefix];
    unsigned int v9 = [(VVService *)self mailboxUsage];
    int v12 = 136315650;
    id v13 = v8;
    __int16 v14 = 2080;
    unsigned __int8 v15 = " ";
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sMailbox usage is at %d%%", (uint8_t *)&v12, 0x1Cu);
  }

  CFDictionaryRef v10 = +[MFActivityMonitor currentTracebleMonitor];
  CFDictionaryRef v11 = [v10 error];
  [(IMAPService *)self performSelectorOnMainThread:"_mailboxUsageUpdateCompletedWithError:" withObject:v11 waitUntilDone:0];
}

- (void)_mailboxUsageUpdateCompletedWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = [(VVService *)self mailboxUsage] < 1;
    id v4 = 0;
    if (!v5)
    {
      float v6 = [(VVService *)self carrierParameterValueForKey:@"ClientManagesTrash"];
      unsigned int v7 = [v6 BOOLValue];

      id v4 = 0;
      if (v7)
      {
        BOOL v8 = [(IMAPService *)self serviceAccount];
        unsigned int v9 = [v8 accountStore];
        [(VVService *)self doTrashCompaction:v9];

        id v4 = 0;
      }
    }
  }
}

- (void)_synchronizeMailboxWithRelativePath:(id)a3 serviceAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    unsigned __int8 v15 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v16 = 2080;
    unsigned int v17 = " ";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sSynchronize %@ for service account %@, process started", (uint8_t *)&v14, 0x2Au);
  }

  unsigned int v9 = [v7 mailboxUidForRelativePath:v6 create:1];
  if (v9)
  {
    CFDictionaryRef v10 = [v7 storeForMailboxUid:v9];
    CFDictionaryRef v11 = v10;
    if (v10) {
      [v10 fetchMobileSynchronously:0x7FFFFFFFFFFFFFFFLL];
    }
  }
  int v12 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(VVService *)self getServiceObjLogPrefix];
    int v14 = 136315906;
    unsigned __int8 v15 = v13;
    __int16 v16 = 2080;
    unsigned int v17 = " ";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%sSynchronize %@ for service account %@, process completed", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)_sanitizeLocalVoicemailDatabaseForServiceAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    id v13 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v14 = 2080;
    unsigned __int8 v15 = " ";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sCalling _sanitizeLocalVoicemailDatabase before sync for service account %@", (uint8_t *)&v12, 0x20u);
  }

  id v6 = [v4 accountStore];
  id v7 = sub_100079A60(v6, 0, 72);

  unsigned int v8 = [(IMAPService *)self _sanitizeDuplicateRecordsFromArrayForServiceAccount:v7 serviceAccount:v4];
  unsigned int v9 = [v4 accountStore];
  id v10 = sub_100079A60(v9, 8, 64);

  if ((v8 | [(IMAPService *)self _sanitizeDuplicateRecordsFromArrayForServiceAccount:v10 serviceAccount:v4]) == 1)
  {
    CFDictionaryRef v11 = [v4 accountStore];
    [v11 save];
  }
}

- (BOOL)_sanitizeDuplicateRecordsFromArrayForServiceAccount:(id)a3 serviceAccount:(id)a4
{
  id v22 = a3;
  id v23 = a4;
  id v6 = [v23 accountStore];
  CFStringRef v25 = +[NSMutableSet set];
  id v7 = [v22 reverseObjectEnumerator];
  unsigned int v8 = [v7 allObjects];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  char v9 = 0;
  id v10 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        __int16 v14 = +[NSNumber numberWithUnsignedInt:sub_10007901C(v6, v13)];
        if ((sub_10007939C(v6, v13) & 2) == 0)
        {
          CFStringRef v15 = VMStoreRecordCopyDescription(v13);
          __int16 v16 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136316162;
            __int16 v31 = v17;
            __int16 v32 = 2080;
            __int16 v33 = " ";
            __int16 v34 = 2112;
            CFStringRef v35 = v15;
            __int16 v36 = 2112;
            CFRange v37 = v14;
            __int16 v38 = 2112;
            __int16 v39 = v6;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoving record %@ with remote UID %@ from the account store %@. Could not find any audio data.", buf, 0x34u);
          }

          if (v15) {
            CFRelease(v15);
          }
LABEL_17:
          sub_1000798C4(v6, v13);
          char v9 = 1;
          goto LABEL_19;
        }
        if ([v25 containsObject:v14])
        {
          CFStringRef v18 = VMStoreRecordCopyDescription(v13);
          id v19 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v20 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136316162;
            __int16 v31 = v20;
            __int16 v32 = 2080;
            __int16 v33 = " ";
            __int16 v34 = 2112;
            CFStringRef v35 = v18;
            __int16 v36 = 2112;
            CFRange v37 = v14;
            __int16 v38 = 2112;
            __int16 v39 = v6;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoving record %@ with remote UID %@ from the account store %@. A record with that remote UID already exists.", buf, 0x34u);
          }

          if (v18) {
            CFRelease(v18);
          }
          goto LABEL_17;
        }
        [v25 addObject:v14];
LABEL_19:
      }
      id v10 = [obj countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v10);
  }

  return v9 & 1;
}

- (void)_synchronizeMailboxesForServiceAccount:(id)a3
{
  id v4 = a3;
  [(VVService *)self getServiceObjLogPrefix];
  sub_10006DCC8();
}

- (void)_messagesAddedCompleted
{
  if ([(NSMutableArray *)self->_addedRecords count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", self->_addedRecords, @"VVAddedRecords", 0);
    id v4 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v8 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v9 = 2080;
      id v10 = " ";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sPosting VVServiceFinishedAddingRecordsNotification notification %@", buf, 0x20u);
    }

    BOOL v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"VVServiceFinishedAddingRecordsNotification" object:self userInfo:v3];
  }
  addedRecords = self->_addedRecords;
  self->_addedRecords = 0;
}

- (void)_resetLegacyMessageWaiting
{
  [(IMAPService *)self mf_lock];
  if ((*(_WORD *)&self->_imapServiceFlags & 3) == 0)
  {
    id v3 = [(VVService *)self carrierParameterValueForKey:@"UsesMWI"];
    unsigned __int8 v4 = [v3 BOOLValue];

    if ((v4 & 1) == 0) {
      [(VVService *)self setMessageWaiting:0];
    }
  }
  [(IMAPService *)self mf_unlock];
}

- (void)_syncCompletedWithError:(shared_ptr<VMJetsamAssertion>)a3 error:(id)a4
{
  ptr = a3.__ptr_;
  __int16 v70 = a3.__cntrl_;
  BOOL v5 = sub_1000571A0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v76 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v77 = 2080;
    __int16 v78 = " ";
    __int16 v79 = 2112;
    uint64_t v80 = (uint64_t)v70;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s_syncCompletedWithError %@", buf, 0x20u);
  }

  if (v70)
  {
    if (![(VVService *)self lastUsedConnectionTypeWasCellular]) {
      [(VVService *)self reportFailedToSyncOverWifi];
    }
    id v6 = [(VVService *)self verifier];
    [v6 storeValue:0 forCheckpointKey:@"ServerLogin"];
  }
  else
  {
    id v6 = [(VVService *)self verifier];
    [v6 storeValue:1 forCheckpointKey:@"ServerLogin"];
  }

  id v7 = [(IMAPService *)self serviceAccount];
  [v7 saveState];

  +[VVService releaseInsomniaAssertion];
  [(IMAPService *)self mf_lock];
  __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
  *(_WORD *)&self->___int16 imapServiceFlags = imapServiceFlags & 0xFFFE;
  if (v70)
  {
    *(_WORD *)&self->___int16 imapServiceFlags = imapServiceFlags & 0xFFFC | 2;
    __int16 v9 = [(VVService *)self serialDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100060E34;
    block[3] = &unk_1000C1A98;
    void block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    if ((imapServiceFlags & 2) == 0)
    {
      id v10 = [(VVService *)self serialDispatchQueue];
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100060E3C;
      v73[3] = &unk_1000C1A98;
      v73[4] = self;
      dispatch_async(v10, v73);

      [(VVService *)self cancelNotificationFallback];
      __int16 v11 = [(IMAPService *)self _parameters];
      id v12 = +[NSNumber numberWithBool:0];
      [v11 setObject:v12 forKey:@"SyncRequired"];

      uint64_t v13 = +[NSDate date];
      [v13 timeIntervalSince1970];
      double v15 = v14;
      __int16 v16 = [(IMAPService *)self _parameters];
      id v17 = +[NSNumber numberWithUnsignedInt:v15];
      [v16 setObject:v17 forKey:@"SyncTimestamp"];

      [(IMAPService *)self _setBeaconCount:0];
      [(IMAPService *)self _saveParameters];
    }
    [(IMAPService *)self _resetLegacyMessageWaiting];
  }
  [(IMAPService *)self mf_unlock];
  if (!v70)
  {
    [(VVService *)self reportSucessfulSync];
    unsigned int v18 = [(VVService *)self isMailboxUsageUpdated];
    id v19 = [(IMAPService *)self serviceAccount];
    __int16 v20 = [v19 accountStore];
    CFArrayRef v21 = (const __CFArray *)sub_100079A60(v20, 0, 6);

    if (v21)
    {
      uint64_t Count = CFArrayGetCount(v21);
      id v23 = VMStoreRecordCopyArrayDescription(v21);
      __int16 v24 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v25 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315906;
        __int16 v76 = v25;
        __int16 v77 = 2080;
        __int16 v78 = " ";
        __int16 v79 = 2048;
        uint64_t v80 = Count;
        __int16 v81 = 2112;
        uint64_t v82 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I %s%sFound %lu records for retrieving audio data %@", buf, 0x2Au);
      }

      if (v23) {
        CFRelease(v23);
      }
      if (Count < 1)
      {
        CFStringRef v35 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        int v34 = v18 ^ 1;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v36 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315394;
          __int16 v76 = v36;
          __int16 v77 = 2080;
          __int16 v78 = " ";
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#I %s%sNo records found that require retrieving audio data", buf, 0x16u);
        }
        CFArrayRef v27 = v21;
      }
      else
      {
        uint64_t v26 = 0;
        CFArrayRef v27 = 0;
        for (CFIndex i = 0; i != Count; ++i)
        {
          CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v21, i);
          if ([(IMAPServiceActivityController *)self->_activityController bodyFetchPendingForRecord:ValueAtIndex])
          {
            CFStringRef v30 = VMStoreRecordCopyDescription((uint64_t)ValueAtIndex);
            __int16 v31 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v32 = [(VVService *)self getServiceObjLogPrefix];
              *(_DWORD *)buf = 136315906;
              __int16 v76 = v32;
              __int16 v77 = 2080;
              __int16 v78 = " ";
              __int16 v79 = 2048;
              uint64_t v80 = i;
              __int16 v81 = 2112;
              uint64_t v82 = (uint64_t)v30;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#I %s%sRecord %lu is pending to retrieve audio data %@", buf, 0x2Au);
            }

            if (v30) {
              CFRelease(v30);
            }
            MutableCopy = v27;
            if (!v27) {
              MutableCopy = CFArrayCreateMutableCopy(0, Count, v21);
            }
            CFArrayRef v27 = MutableCopy;
            CFArrayRemoveValueAtIndex(MutableCopy, i - v26++);
          }
        }
        if (v27) {
          CFRelease(v21);
        }
        else {
          CFArrayRef v27 = v21;
        }
        if (v26 < Count)
        {
          CFRange v37 = [VMSharedJetsamAssertion alloc];
          __int16 v38 = (std::__shared_weak_count *)*((void *)ptr + 1);
          uint64_t v71 = *(void *)ptr;
          __int16 v72 = v38;
          if (v38) {
            atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          __int16 v68 = [(VMSharedJetsamAssertion *)v37 initWithJetsamAssertion:&v71];
          if (v72) {
            sub_10006C2BC(v72);
          }
          id v67 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v27, @"FetchRecord", v68, @"FetchJetsam", 0);
          __int16 v39 = +[MFMonitoredInvocation invocationWithSelector:target:object:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", "_retrieveBodies:", self);
          [v39 retainArguments];
          id v40 = [v39 monitor];
          [v40 addActivityTargets:v27];

          uint64_t v41 = VMStoreRecordCopyArrayDescription(v27);
          v42 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = [(VVService *)self getServiceObjLogPrefix];
            id v65 = [(IMAPService *)self _messageChangeQueue];
            id v69 = [v39 monitor];
            id v44 = [v39 monitor];
            unsigned int v45 = [(IMAPService *)self serviceAccount];
            v46 = [v45 accountStore];
            *(_DWORD *)buf = 136316930;
            __int16 v76 = v43;
            __int16 v77 = 2080;
            __int16 v78 = " ";
            __int16 v79 = 2112;
            uint64_t v80 = (uint64_t)v65;
            __int16 v81 = 2048;
            uint64_t v82 = (uint64_t)v69;
            __int16 v83 = 2112;
            id v84 = v44;
            __int16 v85 = 2112;
            v86 = v46;
            __int16 v87 = 2112;
            v88 = v41;
            __int16 v89 = 2112;
            v90 = v39;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: Creating kIMAPServiceBodyCachingTaskName store %@ for records %@ => %@", buf, 0x52u);
          }
          if (v41) {
            CFRelease(v41);
          }
          activityController = self->_activityController;
          __int16 v48 = [v39 monitor];
          [(IMAPServiceActivityController *)activityController addScheduledActivity:v48];

          double v49 = [(IMAPService *)self _messageChangeQueue];
          [v49 addInvocation:v39];

          goto LABEL_58;
        }
        CFStringRef v35 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v50 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315906;
          __int16 v76 = v50;
          __int16 v77 = 2080;
          __int16 v78 = " ";
          __int16 v79 = 2048;
          uint64_t v80 = v26;
          __int16 v81 = 2048;
          uint64_t v82 = Count;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#I %s%sNo records found that require retrieving audio data, removed %lu records, total %lu records", buf, 0x2Au);
        }
        int v34 = 1;
      }
    }
    else
    {
      if (!v18)
      {
        CFArrayRef v27 = 0;
        int v34 = 1;
        goto LABEL_55;
      }
      if ([(VVService *)self mailboxUsage])
      {
        CFArrayRef v27 = 0;
        int v34 = 0;
        goto LABEL_55;
      }
      CFStringRef v35 = [(VVService *)self serviceLabelID];
      CFArrayRef v27 = 0;
      int v34 = VMStoreCountOfRecordsWithFlags(0, 4, v35) != 0;
    }

LABEL_55:
    int v51 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v52 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315394;
      __int16 v76 = v52;
      __int16 v77 = 2080;
      __int16 v78 = " ";
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#I %s%sRetrieving audio data is not scheduled", buf, 0x16u);
    }

    if (!v34)
    {
      [(VVService *)self scheduleAutomatedTrashCompaction];
LABEL_62:
      if (v27) {
        CFRelease(v27);
      }
      [(VVService *)self clearRemoteUIDsForDetachedMessages];
      v64 = +[NSNotificationCenter defaultCenter];
      [v64 postNotificationName:@"VVServiceSyncStatusChangedNotification" object:0];

      [(IMAPService *)self synchronize:0 reason:@"syncCompleted"];
      goto LABEL_65;
    }
LABEL_58:
    v53 = +[MFMonitoredInvocation invocationWithSelector:"_updateMailboxUsage" target:self taskName:&stru_1000C35D8 priority:2 canBeCancelled:1];
    [v53 retainArguments];
    __int16 v54 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      long long v55 = [(VVService *)self getServiceObjLogPrefix];
      id v56 = [(IMAPService *)self _messageChangeQueue];
      id v57 = [v53 monitor];
      id v58 = [v53 monitor];
      uint64_t v59 = [(IMAPService *)self serviceAccount];
      uint64_t v60 = [v59 accountStore];
      *(_DWORD *)buf = 136316674;
      __int16 v76 = v55;
      __int16 v77 = 2080;
      __int16 v78 = " ";
      __int16 v79 = 2112;
      uint64_t v80 = (uint64_t)v56;
      __int16 v81 = 2048;
      uint64_t v82 = (uint64_t)v57;
      __int16 v83 = 2112;
      id v84 = v58;
      __int16 v85 = 2112;
      v86 = v60;
      __int16 v87 = 2112;
      v88 = v53;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: _updateMailboxUsage for store %@ => %@", buf, 0x48u);
    }
    uint64_t v61 = self->_activityController;
    v62 = [v53 monitor];
    [(IMAPServiceActivityController *)v61 addScheduledActivity:v62];

    __int16 v63 = [(IMAPService *)self _messageChangeQueue];
    [v63 addInvocation:v53];

    goto LABEL_62;
  }
LABEL_65:
}

- (void)handleIMAPServiceLibraryRecordsAddedNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v13 = 136315906;
    *(void *)&v13[4] = [(VVService *)self getServiceObjLogPrefix];
    *(_WORD *)&v13[12] = 2080;
    *(void *)&v13[14] = " ";
    *(_WORD *)&v13[22] = 2112;
    id v14 = (id)objc_opt_class();
    LOWORD(v15) = 2112;
    *(void *)((char *)&v15 + 2) = v4;
    id v6 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling <%@>", v13, 0x2Au);
  }
  id v7 = [v4 userInfo];
  unsigned int v8 = [v7 objectForKey:@"VVAddedRecords"];

  addedRecords = self->_addedRecords;
  if (!addedRecords)
  {
    id v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    p_addedRecords = &self->_addedRecords;
    id v12 = *p_addedRecords;
    *p_addedRecords = v10;

    addedRecords = *p_addedRecords;
  }
  -[NSMutableArray addObjectsFromArray:](addedRecords, "addObjectsFromArray:", v8, *(_OWORD *)v13, *(void *)&v13[16], v14, v15);
}

- (BOOL)isSyncInProgress
{
  return *(_WORD *)&self->_imapServiceFlags & 1;
}

- (void)synchronize:(BOOL)a3 reason:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100061134;
  v9[3] = &unk_1000C2938;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)addSyncTask
{
  id v3 = [(IMAPService *)self serviceAccount];
  +[VVService obtainInsomniaAssertion];
  id v4 = +[NSNotificationCenter defaultCenter];
  BOOL v5 = [v3 library];
  [v4 addObserver:self selector:"handleIMAPServiceLibraryRecordsAddedNotification:" name:@"kIMAPServiceLibraryRecordsAddedNotification" object:v5];

  id v6 = +[MFMonitoredInvocation invocationWithSelector:"_synchronizeMailboxesForServiceAccount:" target:self object:v3 taskName:@"Synchronizing" priority:0 canBeCancelled:0];
  [v6 retainArguments];
  id v7 = sub_1000571A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(VVService *)self getServiceObjLogPrefix];
    id v9 = [(IMAPService *)self _messageChangeQueue];
    id v10 = [v6 monitor];
    id v11 = [v6 monitor];
    int v15 = 136316674;
    __int16 v16 = v8;
    __int16 v17 = 2080;
    unsigned int v18 = " ";
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2048;
    id v22 = v10;
    __int16 v23 = 2112;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v3;
    __int16 v27 = 2112;
    long long v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: Dispatching synchronize operation for service account %@ => %@", (uint8_t *)&v15, 0x48u);
  }
  activityController = self->_activityController;
  uint64_t v13 = [v6 monitor];
  [(IMAPServiceActivityController *)activityController addScheduledActivity:v13];

  id v14 = [(IMAPService *)self _messageChangeQueue];
  [v14 addInvocation:v6];
}

- (void)scheduleSyncTask:(BOOL)a3 reason:(id)a4
{
  id v6 = a4;
  [(IMAPService *)self mf_lock];
  id v7 = sub_1000571A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v33 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v34 = 2080;
    CFStringRef v35 = " ";
    __int16 v36 = 2080;
    uint64_t v37 = asStringBOOL();
    __int16 v38 = 2080;
    uint64_t v39 = asStringBool();
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s-[IMAPService synchronize:force=%s, syncRequired=%s, reason=%@]", buf, 0x34u);
  }

  __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
  if (!a3 && (imapServiceFlags & 2) == 0)
  {
    id v9 = sub_1000571A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(VVService *)self getServiceObjLogPrefix];
      uint64_t v11 = asStringBOOL();
      uint64_t v12 = asStringBool();
      *(_DWORD *)buf = 136315906;
      __int16 v33 = v10;
      __int16 v34 = 2080;
      CFStringRef v35 = " ";
      __int16 v36 = 2080;
      uint64_t v37 = v11;
      __int16 v38 = 2080;
      uint64_t v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sSuppressing synchronize because (force=%s, syncRequired=%s)", buf, 0x2Au);
    }
    goto LABEL_31;
  }
  if ((imapServiceFlags & 2) == 0)
  {
    uint64_t v13 = [(IMAPService *)self _parameters];
    id v14 = +[NSNumber numberWithBool:1];
    [v13 setObject:v14 forKey:@"SyncRequired"];

    [(IMAPService *)self _saveParameters];
  }
  uint64_t v15 = [(IMAPService *)self serviceAccount];
  id v9 = v15;
  __int16 v16 = (__int16)self->_imapServiceFlags;
  if ((v16 & 0xE1) == 0x60 && (*(unsigned char *)&self->super._serviceFlags & 1) == 0 && v15)
  {
    if ([(VVService *)self isDelayedRetryImmediate]
      || ![(VVService *)self isDelayedRetryScheduledGuarded])
    {
      *(_WORD *)&self->___int16 imapServiceFlags = *(_WORD *)&self->_imapServiceFlags & 0xFFFC | 1;
      long long v28 = [(VVService *)self serialDispatchQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100061A2C;
      block[3] = &unk_1000C1A98;
      void block[4] = self;
      dispatch_async(v28, block);

      goto LABEL_31;
    }
    __int16 v17 = sub_1000571A0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315394;
      __int16 v33 = v18;
      __int16 v34 = 2080;
      CFStringRef v35 = " ";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sDeferring synchronize because delayed sync is scheduled", buf, 0x16u);
    }
LABEL_30:

    goto LABEL_31;
  }
  __int16 v17 = sub_1000571A0();
  BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if ((v16 & 0x400) != 0)
  {
    if (v19)
    {
      __int16 v24 = [(VVService *)self getServiceObjLogPrefix];
      uint64_t v25 = asStringBool();
      unint64_t v26 = (*(_WORD *)&self->_imapServiceFlags >> 5) - 1;
      if (v26 > 2) {
        CFStringRef v27 = @"Unknown";
      }
      else {
        CFStringRef v27 = off_1000C2A58[v26];
      }
      uint64_t v30 = asStringBool();
      *(_DWORD *)buf = 136316418;
      __int16 v33 = v24;
      __int16 v34 = 2080;
      CFStringRef v35 = " ";
      __int16 v36 = 2080;
      uint64_t v37 = v25;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v27;
      __int16 v40 = 2080;
      uint64_t v41 = v30;
      __int16 v42 = 2112;
      v43 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sSuppressing synchronize because (syncInProgress:%s OR accountState:%@ is not kStateActive OR we're offline:%s OR we have no account:%@)", buf, 0x3Eu);
    }
    goto LABEL_30;
  }
  if (v19)
  {
    id v20 = [(VVService *)self getServiceObjLogPrefix];
    uint64_t v21 = asStringBool();
    unint64_t v22 = (*(_WORD *)&self->_imapServiceFlags >> 5) - 1;
    if (v22 > 2) {
      CFStringRef v23 = @"Unknown";
    }
    else {
      CFStringRef v23 = off_1000C2A58[v22];
    }
    uint64_t v29 = asStringBool();
    *(_DWORD *)buf = 136316418;
    __int16 v33 = v20;
    __int16 v34 = 2080;
    CFStringRef v35 = " ";
    __int16 v36 = 2080;
    uint64_t v37 = v21;
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v23;
    __int16 v40 = 2080;
    uint64_t v41 = v29;
    __int16 v42 = 2112;
    v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sDeferring synchronize because (syncInProgress:%s OR accountState:%@ is not kStateActive OR we're offline:%s OR we have no account:%@), syncRequired", buf, 0x3Eu);
  }

  *(_WORD *)&self->_imapServiceFlags |= 2u;
LABEL_31:

  [(IMAPService *)self mf_unlock];
}

- (id)_bodyLoadMonitor
{
  [(NSLock *)self->_bodyLoadMonitorLock lock];
  if (!self->_bodyLoadMonitor)
  {
    id v3 = [[IMAPServiceBodyLoadMonitor alloc] initForService:self];
    bodyLoadMonitor = self->_bodyLoadMonitor;
    self->_bodyLoadMonitor = v3;

    BOOL v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v10 = 2080;
      uint64_t v11 = " ";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%screated IMAPServiceBodyLoadMonitor", (uint8_t *)&v8, 0x16u);
    }
  }
  [(NSLock *)self->_bodyLoadMonitorLock unlock];
  id v6 = self->_bodyLoadMonitor;
  return v6;
}

- (void)_synchronouslyRetrieveBody:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_25;
  }
  id v24 = v3;
  CFStringRef v23 = [v3 topLevelPart];
  id v4 = [v23 type];
  unsigned int v5 = [v4 isEqualToString:@"multipart"];

  if (!v5) {
    goto LABEL_23;
  }
  id v6 = [v23 subparts];
  id v7 = [v6 count];
  if (!v7)
  {

    goto LABEL_23;
  }
  unint64_t v8 = 1;
  do
  {
    id v9 = [v6 objectAtIndex:v8 - 1];
    if ([v9 isAttachment])
    {
      __int16 v10 = [v9 attachmentURLs];
      if (![v10 count])
      {
        id v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
      attachmentManager = self->_attachmentManager;
      uint64_t v12 = [v10 objectAtIndex:0];
      uint64_t v13 = [(MFAttachmentLibraryManager *)attachmentManager attachmentForURL:v12 error:0];

      id v14 = [v13 mimeType];
      if ([v14 isEqualToString:@"audio/amr"]) {
        goto LABEL_8;
      }
      __int16 v16 = [v9 type];
      if ([v16 isEqualToString:@"audio"])
      {
        __int16 v17 = [v9 subtype];
        unsigned int v18 = [v17 isEqualToString:@"amr"];

        if (v18)
        {
LABEL_8:
          id v15 = v13;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
      }
      id v15 = 0;
      goto LABEL_16;
    }
    id v15 = 0;
LABEL_18:

    if (v8 >= (unint64_t)v7) {
      break;
    }
    ++v8;
  }
  while (!v15);

  if (!v15)
  {
LABEL_23:
    BOOL v19 = [v24 message];
    id v20 = +[NSString stringWithFormat:@"Couldn't find audio/amr part for message %@", v19];
    uint64_t v21 = +[NSError errorWithDomain:kVVErrorDomain code:1007 localizedDescription:v20];

    unint64_t v22 = +[MFActivityMonitor currentTracebleMonitor];
    [v22 setError:v21];

    id v15 = 0;
  }

  id v3 = v24;
LABEL_25:
}

- (void)_synchronouslyRetrieveBodyForRecord:(void *)a3
{
  id v6 = [(IMAPService *)self serviceAccount];
  unsigned int v5 = [v6 mimeBodyForAccountRecord:a3];
  [(IMAPService *)self _synchronouslyRetrieveBody:v5];
}

- (void)_bodyRetrievalCompleted:(void *)a3
{
  id v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", a3, @"VVRecord", 0);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"VVServiceDataAvailableNotification" object:self userInfo:v5];
}

- (void)_retrieveBodies:(id)a3
{
  id v24 = a3;
  CFStringRef v27 = +[MFActivityMonitor currentTracebleMonitor];
  unint64_t v22 = [v24 objectForKeyedSubscript:@"FetchRecord"];
  CFStringRef v4 = (const __CFString *)[v22 count];
  CFStringRef v23 = [v24 objectForKeyedSubscript:@"FetchJetsam"];
  id v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    id v7 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)buf = 136316674;
    __int16 v34 = v6;
    __int16 v35 = 2080;
    __int16 v36 = " ";
    __int16 v37 = 2112;
    __int16 v38 = v7;
    __int16 v39 = 2048;
    CFStringRef v40 = v4;
    __int16 v41 = 2048;
    __int16 v42 = v27;
    __int16 v43 = 2112;
    id v44 = v27;
    __int16 v45 = 2112;
    v46 = v23;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Retrieving audio data for account %@, fetch %lu records, monitor %p.'%@', jetsam %@", buf, 0x48u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v22;
  id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v26 = *(void *)v29;
    do
    {
      for (CFIndex i = 0; i != v8; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        [v27 setError:0];
        uint64_t v11 = [(IMAPService *)self serviceAccount];
        uint64_t v12 = [v11 accountStore];
        char v13 = sub_10007939C(v12, v10);

        CFStringRef v14 = VMStoreRecordCopyDescription(v10);
        id v15 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = [(VVService *)self getServiceObjLogPrefix];
          __int16 v17 = [(IMAPService *)self serviceAccount];
          unsigned int v18 = [v17 accountStore];
          *(_DWORD *)buf = 136315906;
          __int16 v34 = v16;
          __int16 v35 = 2080;
          __int16 v36 = " ";
          __int16 v37 = 2112;
          __int16 v38 = v18;
          __int16 v39 = 2112;
          CFStringRef v40 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Retrieving audio data for account store %@, record %@", buf, 0x2Au);
        }
        if (v14) {
          CFRelease(v14);
        }
        if ((v13 & 0x14) == 0)
        {
          [v27 setPrimaryTarget:v10];
          [(IMAPService *)self _synchronouslyRetrieveBodyForRecord:v10];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  BOOL v19 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [(VVService *)self getServiceObjLogPrefix];
    uint64_t v21 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)buf = 136315650;
    __int16 v34 = v20;
    __int16 v35 = 2080;
    __int16 v36 = " ";
    __int16 v37 = 2112;
    __int16 v38 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Retrieve audio data for account %@ completed", buf, 0x20u);
  }
}

- (void)_retrieveSingleRecordBody:(void *)a3
{
  CFStringRef v5 = VMStoreRecordCopyDescription((uint64_t)a3);
  id v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VVService *)self getServiceObjLogPrefix];
    id v8 = [(IMAPService *)self serviceAccount];
    id v9 = [v8 accountStore];
    int v11 = 136315906;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    CFStringRef v14 = " ";
    __int16 v15 = 2112;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    CFStringRef v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] RetrieveSingleRecordBody for account store %@, record %@", (uint8_t *)&v11, 0x2Au);
  }
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v10 = +[MFActivityMonitor currentTracebleMonitor];
  [v10 setPrimaryTarget:a3];

  [(IMAPService *)self _synchronouslyRetrieveBodyForRecord:a3];
}

- (void)_retrieveSingleTransferredRecordBody:(void *)a3
{
  CFStringRef v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    id v7 = [(IMAPService *)self serviceAccount];
    id v8 = [v7 accountStore];
    id v9 = (void *)sub_10006E7DC(a3);
    int v10 = 136315906;
    int v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = " ";
    __int16 v14 = 2112;
    __int16 v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] _retrieveSingleTransferredRecordBody for account store %@, record %@", (uint8_t *)&v10, 0x2Au);
  }
  +[IMAPServiceActivityController setRemainingBodyRetries:1];
  [(IMAPService *)self _retrieveSingleRecordBody:a3];
  +[IMAPServiceActivityController setRemainingBodyRetries:0];
}

- (void)retrieveDataForRecord:(void *)a3
{
  if (!-[IMAPServiceActivityController bodyFetchPendingForRecord:](self->_activityController, "bodyFetchPendingForRecord:"))
  {
    char Flags = VMStoreRecordGetFlags((uint64_t)a3);
    id v6 = &selRef__retrieveSingleTransferredRecordBody_;
    if ((Flags & 0x10) != 0)
    {
      uint64_t v7 = 5;
    }
    else
    {
      id v6 = &selRef__retrieveSingleRecordBody_;
      uint64_t v7 = 15;
    }
    id v8 = +[MFMonitoredInvocation invocationWithSelector:*v6 target:self object:a3 taskName:@"Retrieving Body" priority:v7 canBeCancelled:1];
    [v8 retainArguments];
    id v9 = [v8 monitor];
    [v9 addActivityTarget:a3];

    int v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(VVService *)self getServiceObjLogPrefix];
      id v12 = [(IMAPService *)self _messageChangeQueue];
      id v13 = [v8 monitor];
      id v14 = [v8 monitor];
      __int16 v15 = [(IMAPService *)self serviceAccount];
      __int16 v16 = [v15 accountStore];
      int v20 = 136316674;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      CFStringRef v23 = " ";
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2048;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      long long v31 = v16;
      __int16 v32 = 2112;
      __int16 v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: retrieveDataForRecord, store %@ => %@", (uint8_t *)&v20, 0x48u);
    }
    activityController = self->_activityController;
    CFStringRef v18 = [v8 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v18];

    BOOL v19 = [(IMAPService *)self _messageChangeQueue];
    [v19 addInvocation:v8];
  }
}

- (void)addTranscriptForRecord:(void *)a3
{
  uint64_t Identifier = VMStoreRecordGetIdentifier(a3);
  BOOL v6 = (VMStoreRecordGetFlags((uint64_t)a3) & 0x8300) == 0;
  uint64_t v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315650;
      id v14 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v15 = 2080;
      __int16 v16 = " ";
      __int16 v17 = 1024;
      int v18 = Identifier;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail record %d is being queued for transcription", buf, 0x1Cu);
    }

    objc_initWeak((id *)buf, self);
    id v9 = [(VVService *)self transcriptionService];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100062EAC;
    v10[3] = &unk_1000C2960;
    objc_copyWeak(&v11, (id *)buf);
    int v12 = Identifier;
    [v9 processTranscriptForRecordWithIdentifier:Identifier priority:4 completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315650;
      id v14 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v15 = 2080;
      __int16 v16 = " ";
      __int16 v17 = 1024;
      int v18 = Identifier;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%sVoicemail record %d is not eligible for transcription.", buf, 0x1Cu);
    }
  }
}

- (void)addDataForRecord:(void *)a3
{
  CFStringRef v4 = [(IMAPService *)self serviceAccount];
  CFStringRef v5 = [v4 accountStore];

  v64 = v5;
  BOOL v6 = (void *)sub_10007931C(v5, (uint64_t)a3);
  RecordWithToken = VMStoreCopyFirstRecordWithToken(v6, 0);
  if (v6) {
    CFRelease(v6);
  }
  if (RecordWithToken) {
    goto LABEL_14;
  }
  BOOL v8 = [(VVService *)self serviceLabelID];
  RecordWithToken = (const void *)sub_1000798D0(v64, (uint64_t)a3, v8);

  VMStoreSave();
  CFStringRef v9 = VMStoreRecordCopyDescription((uint64_t)RecordWithToken);
  int v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v73 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v74 = 2080;
    unsigned int v75 = " ";
    __int16 v76 = 2112;
    CFStringRef v77 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sCreated new global record for audio data %@", buf, 0x20u);
  }

  if (RecordWithToken)
  {
    id v11 = (const void *)VMStoreRecordCopyDataPath();
    int v12 = +[NSFileManager defaultManager];
    unsigned int v13 = [v12 fileExistsAtPath:v11];

    if (v13)
    {
      id v14 = +[NSFileManager defaultManager];
      id v71 = 0;
      [v14 removeItemAtPath:v11 error:&v71];
      id v15 = v71;
    }
    else
    {
      id v15 = 0;
    }
    CFRelease(v11);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (RecordWithToken)
  {
LABEL_14:
    CFStringRef cf = VMStoreRecordCopyDescription((uint64_t)RecordWithToken);
    __int16 v16 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315650;
      id v73 = v17;
      __int16 v74 = 2080;
      unsigned int v75 = " ";
      __int16 v76 = 2112;
      CFStringRef v77 = cf;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s%sCopying audio data to record %@", buf, 0x20u);
    }

    CFTypeRef v62 = sub_10007966C(v64, (uint64_t)a3);
    CFTypeRef v66 = (CFTypeRef)VMStoreRecordCopyDataPath();
    int v18 = +[NSFileManager defaultManager];
    unsigned int v19 = [v18 fileExistsAtPath:v66];

    if (!v19)
    {
      if ((VMStoreRecordGetFlags((uint64_t)RecordWithToken) & 2) == 0) {
        goto LABEL_34;
      }
      __int16 v33 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v40 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315650;
        id v73 = v40;
        __int16 v74 = 2080;
        unsigned int v75 = " ";
        __int16 v76 = 2112;
        CFStringRef v77 = cf;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#I %s%sData available flag is set, but audio file does not exist, for record %@", buf, 0x20u);
      }
LABEL_33:

LABEL_34:
      id v44 = +[NSFileManager defaultManager];
      id v67 = 0;
      unsigned int v45 = [v44 copyItemAtPath:v62 toPath:v66 error:&v67];
      v46 = v67;

      if (v45)
      {
        sub_1000790E0(v64, (uint64_t)a3);
        VMStoreRecordSetDuration((uint64_t)RecordWithToken);
        int Flags = VMStoreRecordGetFlags((uint64_t)RecordWithToken);
        __int16 v48 = [(VVService *)self serviceLabelID];
        VMStoreRecordSetFlags(v48, RecordWithToken, Flags | 2u);

        VMStoreSave();
        CFStringRef v49 = VMStoreRecordCopyDescription((uint64_t)RecordWithToken);
        __int16 v50 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          int v51 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315650;
          id v73 = v51;
          __int16 v74 = 2080;
          unsigned int v75 = " ";
          __int16 v76 = 2112;
          CFStringRef v77 = v49;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#I %s%sCopying audio data completed for global record %@", buf, 0x20u);
        }

        if (!v49) {
          goto LABEL_48;
        }
      }
      else
      {
        __int16 v52 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315906;
          id v73 = v53;
          __int16 v74 = 2080;
          unsigned int v75 = " ";
          __int16 v76 = 2112;
          CFStringRef v77 = cf;
          __int16 v78 = 2112;
          __int16 v79 = v46;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#I %s%sUnable to copy audio data from account store to global record %@ with error %@", buf, 0x2Au);
        }

        int v54 = VMStoreRecordGetFlags((uint64_t)RecordWithToken);
        if ((v54 & 2) == 0) {
          goto LABEL_48;
        }
        long long v55 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          id v56 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315650;
          id v73 = v56;
          __int16 v74 = 2080;
          unsigned int v75 = " ";
          __int16 v76 = 2112;
          CFStringRef v77 = cf;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#I %s%sData available flag is set, but audio file does not exist, record %@", buf, 0x20u);
        }

        id v57 = [(VVService *)self serviceLabelID];
        VMStoreRecordSetFlags(v57, RecordWithToken, v54 & 0xFFFFFFFD);

        VMStoreSave();
        CFStringRef v49 = VMStoreRecordCopyDescription((uint64_t)RecordWithToken);
        id v58 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v59 = [(VVService *)self getServiceObjLogPrefix];
          *(_DWORD *)buf = 136315650;
          id v73 = v59;
          __int16 v74 = 2080;
          unsigned int v75 = " ";
          __int16 v76 = 2112;
          CFStringRef v77 = v49;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#I %s%sData available flag is removed for global record %@", buf, 0x20u);
        }

        if (!v49) {
          goto LABEL_48;
        }
      }
      CFRelease(v49);
LABEL_48:
      [(IMAPService *)self addTranscriptForRecord:RecordWithToken];
      if (cf) {
        CFRelease(cf);
      }
      CFRelease(RecordWithToken);
      CFRelease(v66);
      CFRelease(v62);

      goto LABEL_51;
    }
    int v20 = +[NSFileManager defaultManager];
    id v70 = 0;
    uint64_t v21 = [v20 attributesOfItemAtPath:v62 error:&v70];
    id v22 = v70;

    CFStringRef v23 = +[NSFileManager defaultManager];
    id v69 = v22;
    uint64_t v61 = [v23 attributesOfItemAtPath:v66 error:&v69];
    id v24 = v69;

    id v25 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = v21;
      __int16 v26 = [(VVService *)self getServiceObjLogPrefix];
      CFStringRef v27 = (const __CFString *)[v21 fileSize];
      __int16 v28 = [v21 fileModificationDate];
      id v29 = [v61 fileSize];
      __int16 v30 = [v61 fileModificationDate];
      *(_DWORD *)buf = 136316674;
      id v73 = v26;
      __int16 v74 = 2080;
      unsigned int v75 = " ";
      __int16 v76 = 2048;
      CFStringRef v77 = v27;
      __int16 v78 = 2112;
      __int16 v79 = v28;
      __int16 v80 = 2048;
      id v81 = v29;
      __int16 v82 = 2112;
      __int16 v83 = v30;
      __int16 v84 = 2112;
      CFStringRef v85 = cf;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%sAudio file already exists, <src size=%llu, date=%@> <dst size=%llu, date=%@>, record %@", buf, 0x48u);

      uint64_t v21 = v60;
    }

    long long v31 = +[NSFileManager defaultManager];
    id v68 = v24;
    unsigned int v32 = [v31 removeItemAtPath:v66 error:&v68];
    __int16 v33 = v68;

    value = (id *)self->logger.__ptr_.__value_;
    if (v32)
    {
      __int16 v35 = sub_100020EE0(value);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v36 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315650;
        id v73 = v36;
        __int16 v74 = 2080;
        unsigned int v75 = " ";
        __int16 v76 = 2112;
        CFStringRef v77 = cf;
        __int16 v37 = "#I %s%sRemoving audio data for global record %@";
        __int16 v38 = v35;
        uint32_t v39 = 32;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
      }
    }
    else
    {
      __int16 v35 = sub_100020EE0(value);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v41 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315906;
        id v73 = v41;
        __int16 v74 = 2080;
        unsigned int v75 = " ";
        __int16 v76 = 2112;
        CFStringRef v77 = cf;
        __int16 v78 = 2112;
        __int16 v79 = v33;
        __int16 v37 = "#I %s%sUnable to remove audio data for global record %@ with error %@";
        __int16 v38 = v35;
        uint32_t v39 = 42;
        goto LABEL_27;
      }
    }

    if ((VMStoreRecordGetFlags((uint64_t)RecordWithToken) & 2) == 0)
    {
      __int16 v42 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v43 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315650;
        id v73 = v43;
        __int16 v74 = 2080;
        unsigned int v75 = " ";
        __int16 v76 = 2112;
        CFStringRef v77 = cf;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#I %s%sData available flag is not set, but audio file exists, for record %@", buf, 0x20u);
      }
    }
    goto LABEL_33;
  }
LABEL_51:
}

- (void)_setDataForRecordWithIdentifier:(unsigned int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100063C88;
  v3[3] = &unk_1000C2988;
  v3[4] = self;
  unsigned int v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_removeRecordsNotPendingDelete:(__CFArray *)a3
{
  [(NSRecursiveLock *)self->_pendingDeletesLock lock];
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
        if (([(NSMutableSet *)self->_pendingDeletes containsObject:ValueAtIndex] & 1) == 0
          && (VMStoreRecordGetFlags((uint64_t)ValueAtIndex) & 0x40) == 0)
        {
          VMStoreRemoveRecord((uint64_t)ValueAtIndex);
        }
      }
    }
  }
  pendingDeletesLock = self->_pendingDeletesLock;
  [(NSRecursiveLock *)pendingDeletesLock unlock];
}

- (void)_addPendingDeleteForRecord:(void *)a3
{
  if (a3)
  {
    CFStringRef v5 = VMStoreRecordCopyDescription((uint64_t)a3);
    CFIndex v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      int v12 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v13 = 2080;
      id v14 = " ";
      __int16 v15 = 2112;
      CFStringRef v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%saddPendingDelete for record %@", (uint8_t *)&v11, 0x20u);
    }

    if (v5) {
      CFRelease(v5);
    }
    [(NSRecursiveLock *)self->_pendingDeletesLock lock];
    pendingDeletes = self->_pendingDeletes;
    if (!pendingDeletes)
    {
      BOOL v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      CFStringRef v9 = self->_pendingDeletes;
      self->_pendingDeletes = v8;

      pendingDeletes = self->_pendingDeletes;
    }
    [(NSMutableSet *)pendingDeletes addObject:a3];
    [(NSRecursiveLock *)self->_pendingDeletesLock unlock];
  }
  else
  {
    int v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      int v12 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v13 = 2080;
      id v14 = " ";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sIMAPService _addPendingDeleteForRecord: was called with a nil record.", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)_removePendingDeleteForRecord:(void *)a3
{
  CFStringRef v5 = VMStoreRecordCopyDescription((uint64_t)a3);
  CFIndex v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    BOOL v8 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v9 = 2080;
    int v10 = " ";
    __int16 v11 = 2112;
    CFStringRef v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sremovePendingDelete for record %@", (uint8_t *)&v7, 0x20u);
  }

  if (v5) {
    CFRelease(v5);
  }
  [(NSRecursiveLock *)self->_pendingDeletesLock lock];
  [(NSMutableSet *)self->_pendingDeletes removeObject:a3];
  [(NSRecursiveLock *)self->_pendingDeletesLock unlock];
}

- (void)movePendingMessagesToTrashTask:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IMAPService *)self serviceAccount];

  if (v5)
  {
    CFIndex v6 = [(IMAPService *)self serviceAccount];
    int v7 = +[MFMonitoredInvocation invocationWithSelector:"movePendingMessagesToTrash:" target:v6 object:v4 taskName:@"Pushing Flags" priority:5 canBeCancelled:1];

    [v7 retainArguments];
    BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      id v10 = [(IMAPService *)self _messageChangeQueue];
      id v11 = [v7 monitor];
      id v12 = [v7 monitor];
      __int16 v13 = [(IMAPService *)self serviceAccount];
      id v14 = [v13 accountStore];
      int v18 = 136316674;
      unsigned int v19 = v9;
      __int16 v20 = 2080;
      uint64_t v21 = " ";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2048;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      long long v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: movePendingMessagesToTrashTask, store %@ => %@", (uint8_t *)&v18, 0x48u);
    }
    activityController = self->_activityController;
    CFStringRef v16 = [v7 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v16];

    __int16 v17 = [(IMAPService *)self _messageChangeQueue];
    [v17 addInvocation:v7];
  }
  else
  {
    int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      unsigned int v19 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v20 = 2080;
      uint64_t v21 = " ";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] ERROR: no serviceAccount when scheduling movePendingMessagesToTrash", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)movePendingMessagesToInboxTask:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IMAPService *)self serviceAccount];

  if (v5)
  {
    CFIndex v6 = [(IMAPService *)self serviceAccount];
    int v7 = +[MFMonitoredInvocation invocationWithSelector:"movePendingMessagesToInbox:" target:v6 object:v4 taskName:@"Pushing Flags" priority:5 canBeCancelled:1];

    [v7 retainArguments];
    BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      id v10 = [(IMAPService *)self _messageChangeQueue];
      id v11 = [v7 monitor];
      id v12 = [v7 monitor];
      __int16 v13 = [(IMAPService *)self serviceAccount];
      id v14 = [v13 accountStore];
      int v18 = 136316674;
      unsigned int v19 = v9;
      __int16 v20 = 2080;
      uint64_t v21 = " ";
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2048;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      long long v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: movePendingMessagesToInboxTask, store %@ => %@", (uint8_t *)&v18, 0x48u);
    }
    activityController = self->_activityController;
    CFStringRef v16 = [v7 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v16];

    __int16 v17 = [(IMAPService *)self _messageChangeQueue];
    [v17 addInvocation:v7];
  }
  else
  {
    int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      unsigned int v19 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v20 = 2080;
      uint64_t v21 = " ";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] ERROR: no serviceAccount when scheduling movePendingMessagesToInbox", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)moveRecordsToTrash:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IMAPService *)self serviceAccount];

  if (v5)
  {
    CFIndex v6 = [(IMAPService *)self serviceAccount];
    int v7 = +[MFMonitoredInvocation invocationWithSelector:"moveMessagesWithTokensToTrash:" target:v6 object:v4 taskName:@"Pushing Flags" priority:5 canBeCancelled:1];

    [v7 retainArguments];
    BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      id v10 = [(IMAPService *)self _messageChangeQueue];
      id v11 = [v7 monitor];
      id v12 = [v7 monitor];
      int v16 = 136316674;
      __int16 v17 = v9;
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2048;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v4;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: moving records to Trash: %@ => %@", (uint8_t *)&v16, 0x48u);
    }
    activityController = self->_activityController;
    id v14 = [v7 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v14];

    __int16 v15 = [(IMAPService *)self _messageChangeQueue];
    [v15 addInvocation:v7];
  }
  else
  {
    int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] ERROR: no serviceAccount when scheduling moveMessagesWithTokensToTrash", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)moveRecordsToInbox:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IMAPService *)self serviceAccount];

  if (v5)
  {
    CFIndex v6 = [(IMAPService *)self serviceAccount];
    int v7 = +[MFMonitoredInvocation invocationWithSelector:"moveMessagesWithTokensToInbox:" target:v6 object:v4 taskName:@"Pushing Flags" priority:5 canBeCancelled:1];

    [v7 retainArguments];
    BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      id v10 = [(IMAPService *)self _messageChangeQueue];
      id v11 = [v7 monitor];
      id v12 = [v7 monitor];
      int v16 = 136316674;
      __int16 v17 = v9;
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2048;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v4;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: moving records to Inbox: %@ => %@", (uint8_t *)&v16, 0x48u);
    }
    activityController = self->_activityController;
    id v14 = [v7 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v14];

    __int16 v15 = [(IMAPService *)self _messageChangeQueue];
    [v15 addInvocation:v7];
  }
  else
  {
    int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] ERROR: no serviceAccount when scheduling moveMessagesWithTokensToInbox", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)moveRecordsToDeleted:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IMAPService *)self serviceAccount];

  if (v5)
  {
    CFIndex v6 = [(IMAPService *)self serviceAccount];
    int v7 = +[MFMonitoredInvocation invocationWithSelector:"moveMessagesWithTokensToDeleted:" target:v6 object:v4 taskName:@"Pushing Flags" priority:5 canBeCancelled:1];

    [v7 retainArguments];
    BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      id v10 = [(IMAPService *)self _messageChangeQueue];
      id v11 = [v7 monitor];
      id v12 = [v7 monitor];
      int v16 = 136316674;
      __int16 v17 = v9;
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2048;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v4;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: deleting records with tokens: %@ => %@", (uint8_t *)&v16, 0x48u);
    }
    activityController = self->_activityController;
    id v14 = [v7 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v14];

    __int16 v15 = [(IMAPService *)self _messageChangeQueue];
    [v15 addInvocation:v7];
  }
  else
  {
    int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] ERROR: no serviceAccount when scheduling moveMessagesWithTokensToDeleted", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)markRecordsAsRead:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IMAPService *)self serviceAccount];

  if (v5)
  {
    CFIndex v6 = [(IMAPService *)self serviceAccount];
    int v7 = +[MFMonitoredInvocation invocationWithSelector:"moveMessagesWithTokensToRead:" target:v6 object:v4 taskName:@"Pushing Flags" priority:5 canBeCancelled:1];

    [v7 retainArguments];
    BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [(VVService *)self getServiceObjLogPrefix];
      id v10 = [(IMAPService *)self _messageChangeQueue];
      id v11 = [v7 monitor];
      id v12 = [v7 monitor];
      int v16 = 136316674;
      __int16 v17 = v9;
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2048;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v4;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: mark records as read: %@ => %@", (uint8_t *)&v16, 0x48u);
    }
    activityController = self->_activityController;
    id v14 = [v7 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v14];

    __int16 v15 = [(IMAPService *)self _messageChangeQueue];
    [v15 addInvocation:v7];
  }
  else
  {
    int v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] ERROR: no serviceAccount when scheduling moveMessagesWithTokensToRead", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)synchronizeRecordFlags
{
  id v3 = [(VVService *)self serviceLabelID];
  id v4 = (void *)VMStoreCopyOfAllRecordsWithFlags(4, 64, v3);

  CFStringRef v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  id v6 = [v4 count];
  value = (id *)self->logger.__ptr_.__value_;
  if (v6)
  {
    BOOL v8 = sub_100020EE0(value);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      __int16 v20 = 2048;
      id v21 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sFound %lu records that need to sync up with the account store", buf, 0x20u);
    }

    for (unint64_t i = 0; (unint64_t)[v4 count] > i; ++i)
    {
      id v10 = [v4 objectAtIndexedSubscript:i];
      id v11 = +[NSNumber numberWithInt:VMStoreRecordGetIdentifier(v10)];
      [v5 addObject:v11];
    }
    id v12 = dispatch_get_global_queue(0, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100065C14;
    v14[3] = &unk_1000C1FC8;
    v14[4] = self;
    id v15 = v5;
    dispatch_async(v12, v14);
  }
  else
  {
    __int16 v13 = sub_100020EE0(value);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v17 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v18 = 2080;
      unsigned int v19 = " ";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sDid not find records that need server sync", buf, 0x16u);
    }
  }
}

- (void)populateLabelInformation
{
  id v3 = [(VVService *)self serviceMDN];
  CFArrayRef v4 = (const __CFArray *)VMStoreCopyRecordsWithReceiver(v3);

  CFStringRef v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VVService *)self getServiceObjLogPrefix];
    int v7 = [(VVService *)self serviceLabelID];
    BOOL v8 = [(VVService *)self serviceMDN];
    int v14 = 136315906;
    id v15 = v6;
    __int16 v16 = 2080;
    __int16 v17 = " ";
    __int16 v18 = 2112;
    unsigned int v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] populateLabelInformation for label %@, service phone number %@", (uint8_t *)&v14, 0x2Au);
  }
  if (v4)
  {
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        id v12 = VMStoreRecordGetLabel((uint64_t)ValueAtIndex);
        if (!v12)
        {
          __int16 v13 = [(VVService *)self serviceLabelID];
          VMStoreRecordSetLabel((uint64_t)ValueAtIndex, v13);
        }
      }
    }
    CFRelease(v4);
  }
  VMStoreSave();
}

- (void)populateReceiverInformationForServiceAccount:(id)a3
{
  id v43 = a3;
  CFArrayRef v4 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = [(VVService *)self getServiceObjLogPrefix];
    id v6 = [(VVService *)self serviceLabelID];
    *(_DWORD *)buf = 136315906;
    id v69 = v5;
    __int16 v70 = 2080;
    id v71 = " ";
    __int16 v72 = 2112;
    CFIndex v73 = (CFIndex)v6;
    __int16 v74 = 2112;
    id v75 = v43;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] populateReceiverInformationForServiceAccount %@, serviceAccount:%@", buf, 0x2Au);
  }
  __int16 v42 = [v43 mailboxUidForRelativePath:@"INBOX" create:1];
  [v43 mailboxUidForRelativePath:@"Trash" create:1];
  v67 = CFTypeRef v66 = v42;
  __int16 v38 = (void *)v67;
  +[NSArray arrayWithObjects:&v66 count:2];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v41 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v61;
    do
    {
      for (CFIndex i = 0; i != v41; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        id v47 = +[NSMutableSet set];
        v46 = [v43 storeForMailboxUid:v7];
        if ([v7 isEqual:v42])
        {
          CFArrayRef v8 = (const __CFArray *)VMStoreCopyOfAllRecordsWithFlags(0, 8, 0);
          uint64_t v9 = 1;
        }
        else
        {
          if (![v7 isEqual:v38])
          {
            unint64_t v51 = 0;
            goto LABEL_28;
          }
          CFArrayRef v8 = (const __CFArray *)VMStoreCopyOfAllRecordsWithFlags(8, 0, 0);
          uint64_t v9 = 3;
        }
        unint64_t v51 = v9;
        if (v8)
        {
          __int16 v52 = [(VVService *)self serviceICC];
          CFIndex Count = CFArrayGetCount(v8);
          theString = [(VVService *)self serviceMDN];
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_1000668FC;
          v58[3] = &unk_1000C29F0;
          uint64_t v59 = &stru_1000C29C8;
          id v11 = objc_retainBlock(v58);
          if (Count >= 1)
          {
            for (CFIndex j = 0; j != Count; ++j)
            {
              CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v8, j);
              if ((VMStoreRecordGetFlags((uint64_t)ValueAtIndex) & 0x40) != 0)
              {
                CFStringRef v15 = (const __CFString *)VMStoreRecordCopyReceiver((uint64_t)ValueAtIndex);
                if (v15)
                {
                  if (CFStringHasSuffix(theString, v15)) {
                    ((void (*)(void *, const void *, void *))v11[2])(v11, ValueAtIndex, v52);
                  }
                  CFRelease(v15);
                }
              }
              else
              {
                int v14 = VMStoreRecordCopyReceiver((uint64_t)ValueAtIndex);
                if (v14)
                {
                  ((void (*)(void *, const void *, void *))v11[2])(v11, ValueAtIndex, v52);
                  CFRelease(v14);
                }
                else
                {
                  VMStoreRecordSetReceiver((uint64_t)ValueAtIndex);
                }
                __int16 v16 = (void *)VMStoreRecordCopyToken((uint64_t)ValueAtIndex);
                if (v16)
                {
                  [v47 addObject:v16];
                }
              }
            }
          }
          VMStoreSave();
          CFRelease(v8);
        }
LABEL_28:
        if ([v47 count])
        {
          __int16 v17 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v18 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315906;
            id v69 = v18;
            __int16 v70 = 2080;
            id v71 = " ";
            __int16 v72 = 2112;
            CFIndex v73 = (CFIndex)v46;
            __int16 v74 = 2112;
            id v75 = v47;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sChecking message store %@ for message IDs %@", buf, 0x2Au);
          }

          id v44 = [v46 messageIdRollCall:v47];
          unsigned int v19 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v20 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315906;
            id v69 = v20;
            __int16 v70 = 2080;
            id v71 = " ";
            __int16 v72 = 2112;
            CFIndex v73 = (CFIndex)v46;
            __int16 v74 = 2112;
            id v75 = v44;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sMessage store %@ contains message IDs %@", buf, 0x2Au);
          }

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v48 = v44;
          id v21 = [v48 countByEnumeratingWithState:&v54 objects:v64 count:16];
          if (v21)
          {
            CFStringRef theStringa = *(CFStringRef *)v55;
            do
            {
              id v53 = v21;
              for (k = 0; k != v53; k = (char *)k + 1)
              {
                if (*(CFStringRef *)v55 != theStringa) {
                  objc_enumerationMutation(v48);
                }
                id v23 = *(void **)(*((void *)&v54 + 1) + 8 * (void)k);
                CFArrayRef v24 = (const __CFArray *)VMStoreCopyRecordsWithTokenInMailbox(v23, v51);
                CFArrayRef v25 = v24;
                if (v24)
                {
                  CFIndex v26 = CFArrayGetCount(v24);
                  if (v26 >= 2)
                  {
                    id v27 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      __int16 v28 = [(VVService *)self getServiceObjLogPrefix];
                      *(_DWORD *)buf = 136315906;
                      id v69 = v28;
                      __int16 v70 = 2080;
                      id v71 = " ";
                      __int16 v72 = 2048;
                      CFIndex v73 = v26;
                      __int16 v74 = 2112;
                      id v75 = v23;
                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I %s%sFound %ld records for message ID '%@'", buf, 0x2Au);
                    }

                    CFIndex v29 = 0;
                    char v30 = 0;
                    do
                    {
                      long long v31 = CFArrayGetValueAtIndex(v25, v29);
                      uint64_t v32 = (uint64_t)v31;
                      if (v30)
                      {
                        __int16 v33 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
                        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                        {
                          __int16 v34 = [(VVService *)self getServiceObjLogPrefix];
                          *(_DWORD *)buf = 136315906;
                          id v69 = v34;
                          __int16 v70 = 2080;
                          id v71 = " ";
                          __int16 v72 = 2112;
                          CFIndex v73 = v32;
                          __int16 v74 = 2112;
                          id v75 = v23;
                          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#I %s%sRemoving duplicate record %@ with message ID '%@'", buf, 0x2Au);
                        }

                        VMStoreRemoveRecord(v32);
                      }
                      else
                      {
                        if ((VMStoreRecordGetFlags((uint64_t)v31) & 0x10) != 0)
                        {
                          char v30 = 0;
                          goto LABEL_53;
                        }
                        __int16 v35 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                        {
                          __int16 v36 = [(VVService *)self getServiceObjLogPrefix];
                          *(_DWORD *)buf = 136315906;
                          id v69 = v36;
                          __int16 v70 = 2080;
                          id v71 = " ";
                          __int16 v72 = 2112;
                          CFIndex v73 = v32;
                          __int16 v74 = 2112;
                          id v75 = v23;
                          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#I %s%sFound first instance of record %@ with message ID '%@'", buf, 0x2Au);
                        }
                      }
                      char v30 = 1;
LABEL_53:
                      ++v29;
                    }
                    while (v26 != v29);
                  }
                  CFRelease(v25);
                }
              }
              id v21 = [v48 countByEnumeratingWithState:&v54 objects:v64 count:16];
            }
            while (v21);
          }
        }
      }
      id v41 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v41);
  }

  __int16 v37 = [(VVService *)self serviceLabelID];
  VMStoreSetReceiverMigration((uint64_t)[v37 UUIDString]);

  VMStoreSave();
}

- (void)_synchronouslyPushFlags:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 objectForKeyedSubscript:@"userInfo"];

  unsigned int v6 = objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v5, @"VMStoreRecordChangedFlags"), "unsignedIntValue");
  int v7 = [v4 objectForKeyedSubscript:@"object"];

  CFArrayRef v8 = VMStoreRecordCopyFlagsDescription(v6);
  CFStringRef v9 = VMStoreRecordCopyDescription((uint64_t)v7);
  id v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315906;
    CFArrayRef v24 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v25 = 2080;
    CFIndex v26 = " ";
    __int16 v27 = 2112;
    __int16 v28 = v8;
    __int16 v29 = 2112;
    CFStringRef v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Synchronously push flags %@ for record %@", (uint8_t *)&v23, 0x2Au);
  }

  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  if ((v6 & 4) != 0) {
    unsigned int v11 = (VMStoreRecordGetFlags((uint64_t)v7) >> 2) & 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if ((VMStoreRecordGetFlags((uint64_t)v7) & 0x10) == 0 && (v6 & 0x45) != 0)
  {
    if (v11 && (VMStoreRecordGetFlags((uint64_t)v7) & 0x40) != 0)
    {
      __int16 v20 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(VVService *)self getServiceObjLogPrefix];
        int Identifier = VMStoreRecordGetIdentifier(v7);
        int v23 = 136315650;
        CFArrayRef v24 = v21;
        __int16 v25 = 2080;
        CFIndex v26 = " ";
        __int16 v27 = 1024;
        LODWORD(v28) = Identifier;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s%sFound detached record with identifier: %d, just removing it", (uint8_t *)&v23, 0x1Cu);
      }

      VMStoreRemoveRecord((uint64_t)v7);
      VMStoreSave();
      [(VVService *)self resetCounts];
    }
    else
    {
      if ([(VVService *)self supportsDetachedStorage]) {
        int v12 = (v6 >> 4) & 4;
      }
      else {
        LOBYTE(v12) = 0;
      }
      __int16 v13 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [(VVService *)self getServiceObjLogPrefix];
        int v15 = VMStoreRecordGetIdentifier(v7);
        int v23 = 136315650;
        CFArrayRef v24 = v14;
        __int16 v25 = 2080;
        CFIndex v26 = " ";
        __int16 v27 = 1024;
        LODWORD(v28) = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sStoring flags for record with identifier: %d", (uint8_t *)&v23, 0x1Cu);
      }

      __int16 v16 = [(IMAPService *)self serviceAccount];
      [v16 storeFlags:(v12 | v6) & 5 forRecord:v7];

      if ((VMStoreRecordGetFlags((uint64_t)v7) & 4) != 0 && ((v12 | v6) & 4) != 0
        || (VMStoreRecordGetFlags((uint64_t)v7) & 0x40) != 0 && (v6 & 0x40) != 0)
      {
        __int16 v17 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = [(VVService *)self getServiceObjLogPrefix];
          int v23 = 136315394;
          CFArrayRef v24 = v18;
          __int16 v25 = 2080;
          CFIndex v26 = " ";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sRecords removed - invalidating mailbox usage information", (uint8_t *)&v23, 0x16u);
        }

        [(VVService *)self setMailboxUsage:0];
        unsigned int v19 = +[NSUserDefaults standardUserDefaults];
        [v19 removeObjectForKey:kVVLastWarnedUsageDefault];
      }
    }
  }
}

- (void)_synchronouslySetDefaultGreeting
{
  id v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(VVService *)self getServiceObjLogPrefix];
    CFStringRef v5 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = " ";
    __int16 v36 = 2112;
    __int16 v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%sJetsam assertion for default greeting sync created, service account %@", buf, 0x20u);
  }
  unsigned int v6 = (ctu::XpcJetsamAssertion *)pthread_mutex_lock(&stru_1000E06C0);
  if (!(void)xmmword_1000E0700)
  {
    ctu::XpcJetsamAssertion::create_default_global((uint64_t *)buf, v6);
    long long v7 = *(_OWORD *)buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    CFArrayRef v8 = (std::__shared_weak_count *)*((void *)&xmmword_1000E0700 + 1);
    xmmword_1000E0700 = v7;
    if (v8)
    {
      sub_10006C2BC(v8);
      if (*(void *)&buf[8]) {
        sub_10006C2BC(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  CFStringRef v9 = (std::__shared_weak_count *)*((void *)&xmmword_1000E0700 + 1);
  if (*((void *)&xmmword_1000E0700 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1000E0700 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_1000E06C0);
  sub_10000E6A8(&__p, "_synchronouslySetDefaultGreeting");
  ctu::XpcJetsamAssertion::createActivity();
  if (v27 < 0) {
    operator delete(__p);
  }
  if (v9) {
    sub_10006C2BC(v9);
  }
  [(NSRecursiveLock *)self->_greetingLock lock];
  id v10 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [(VVService *)self getServiceObjLogPrefix];
    int v12 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = " ";
    __int16 v36 = 2112;
    __int16 v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Set default greeting synchronously for service account %@ started", buf, 0x20u);
  }
  __int16 v13 = [(IMAPService *)self serviceAccount];
  int v14 = [v13 mailboxUidForRelativePath:@"Greetings" create:0];
  if (v14)
  {
    int v15 = [v13 storeForMailboxUid:v14];
    [v15 removeActiveGreetingFlagFromAllUids];
  }
  __int16 v16 = +[MFActivityMonitor currentTracebleMonitor];
  __int16 v17 = [v16 error];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    [(IMAPService *)self _setActiveGreetingType:0];
    unsigned int v19 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = " ";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%smark custom greeting inactive", buf, 0x16u);
    }

    [(IMAPService *)self mf_lock];
    id v21 = [(IMAPService *)self _parameters];
    __int16 v22 = +[NSNumber numberWithBool:0];
    [v21 setObject:v22 forKey:@"GreetingCustomActive"];

    [(IMAPService *)self _saveParameters];
    [(IMAPService *)self mf_unlock];
  }
  [(NSRecursiveLock *)self->_greetingLock unlock];
  int v23 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    CFArrayRef v24 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v25 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)__int16 v29 = 136315650;
    CFStringRef v30 = v24;
    __int16 v31 = 2080;
    uint64_t v32 = " ";
    __int16 v33 = 2112;
    __int16 v34 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Set default greeting synchronously for service account %@ completed", v29, 0x20u);
  }
  if (v28) {
    sub_10006C2BC(v28);
  }
}

- (void)_synchronouslySetCustomGreetingWithData:(id)a3 duration:(id)a4
{
  id v53 = a3;
  id v51 = a4;
  unsigned int v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = [(VVService *)self getServiceObjLogPrefix];
    CFArrayRef v8 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = " ";
    __int16 v64 = 2112;
    CFStringRef v65 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sJetsam assertion for custom greeting sync created, service account %@", buf, 0x20u);
  }
  CFStringRef v9 = (ctu::XpcJetsamAssertion *)pthread_mutex_lock(&stru_1000E06C0);
  if (!(void)xmmword_1000E0700)
  {
    ctu::XpcJetsamAssertion::create_default_global((uint64_t *)buf, v9);
    long long v10 = *(_OWORD *)buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    unsigned int v11 = (std::__shared_weak_count *)*((void *)&xmmword_1000E0700 + 1);
    xmmword_1000E0700 = v10;
    if (v11)
    {
      sub_10006C2BC(v11);
      if (*(void *)&buf[8]) {
        sub_10006C2BC(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  int v12 = (std::__shared_weak_count *)*((void *)&xmmword_1000E0700 + 1);
  if (*((void *)&xmmword_1000E0700 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1000E0700 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_1000E06C0);
  sub_10000E6A8(&__p, "_synchronouslySetCustomGreetingWithData");
  ctu::XpcJetsamAssertion::createActivity();
  if (v55 < 0) {
    operator delete(__p);
  }
  if (v12) {
    sub_10006C2BC(v12);
  }
  [(NSRecursiveLock *)self->_greetingLock lock];
  __int16 v52 = +[MFActivityMonitor currentTracebleMonitor];
  id v13 = [v53 length];
  int v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [(VVService *)self getServiceObjLogPrefix];
    uint64_t v16 = [(IMAPService *)self serviceAccount];
    __int16 v17 = (void *)v16;
    CFStringRef v18 = @"is available";
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = " ";
    if (!v13) {
      CFStringRef v18 = @"is not available";
    }
    __int16 v64 = 2112;
    CFStringRef v65 = v18;
    __int16 v66 = 2112;
    id v67 = v51;
    __int16 v68 = 2112;
    uint64_t v69 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Set custom greeting synchronously with data '%@', duration %@ for service account %@", buf, 0x34u);
  }
  if (v13)
  {
    id v19 = objc_alloc_init((Class)MFMutableMessageHeaders);
    [v19 setHeader:@"1.0" forKey:@"x-applevm-message-version"];
    [v19 setHeader:@"1.0" forKey:H_MIME_VERSION];
    __int16 v20 = +[NSDate date];
    id v21 = objc_msgSend(v20, "mf_descriptionForMimeHeaders");
    [v19 setHeader:v21 forKey:H_DATE];

    id v22 = [objc_alloc((Class)MFMessageFileWrapper) initRegularFileWithContents:v53];
    [v22 setMimeType:@"audio/amr"];
    [v22 setPreferredFilename:@"Greeting.amr"];
    id v23 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v22, 0);
    id v24 = objc_alloc_init((Class)MFMessageWriter);
    [v24 setDelegate:self];
    [v24 setWriteSizeDispositionParameter:1];
    self->_greetingDuration = [v51 unsignedIntValue];
    id v25 = [v24 createMessageWithHtmlString:0 attachments:v23 headers:v19];
    CFIndex v26 = [(IMAPService *)self serviceAccount];
    char v27 = [v26 mailboxUidForRelativePath:@"Greetings" create:0];
    if (v27)
    {
      if ([v52 shouldCancel])
      {
LABEL_40:
        [v25 setMessageBody:0];

        goto LABEL_41;
      }
      CFStringRef v49 = [v26 storeForMailboxUid:v27];
      unsigned int v50 = [v49 appendActiveGreeting:v25];
      __int16 v28 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = " ";
        __int16 v64 = 1024;
        LODWORD(v65) = v50;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#I %s%snew greeting UID: %u", buf, 0x1Cu);
      }

      if (!v50)
      {
        uint64_t v40 = [v52 error];
        BOOL v41 = v40 == 0;

        if (v41)
        {
          __int16 v37 = +[NSError errorWithDomain:kVVErrorDomain code:1008 localizedDescription:@"Error appending greeting."];
          [v52 setError:v37];
LABEL_37:
        }
LABEL_38:
        CFStringRef v30 = v49;
        goto LABEL_39;
      }
      CFStringRef v30 = v49;
      if (([v52 shouldCancel] & 1) == 0)
      {
        [v49 removeActiveGreetingFlagFromAllUidsExceptLast:v50];
        __int16 v31 = [v52 error];
        BOOL v32 = v31 == 0;

        if (v32)
        {
          __int16 v33 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v34 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v34;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = " ";
            __int16 v64 = 1024;
            LODWORD(v65) = v50;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#I %s%smark custom greeting UID %u active", buf, 0x1Cu);
          }

          [(IMAPService *)self mf_lock];
          id v48 = [(IMAPService *)self _parameters];
          __int16 v35 = +[NSNumber numberWithBool:1];
          [v48 setObject:v35 forKey:@"GreetingCustomActive"];

          __int16 v36 = +[NSNumber numberWithUnsignedLong:v50];
          [v48 setObject:v36 forKey:@"GreetingCustomUID"];

          [(IMAPService *)self _saveParameters];
          [(IMAPService *)self mf_unlock];
          __int16 v37 = v48;
          goto LABEL_37;
        }
        goto LABEL_38;
      }
    }
    else
    {
      CFStringRef v30 = +[NSError errorWithDomain:kVVErrorDomain code:1016 localizedDescription:@"Greetings mailbox doesn't exist."];
      [v52 setError:v30];
    }
LABEL_39:

    goto LABEL_40;
  }
  id v19 = [(IMAPService *)self serviceAccount];
  id v22 = [v19 mailboxUidForRelativePath:@"Greetings" create:0];
  if (v22)
  {
    id v23 = [v19 storeForMailboxUid:v22];
    id v24 = [v23 candidateGreetingMessage];
    if ([v52 shouldCancel]) {
      goto LABEL_42;
    }
    __int16 v38 = [v52 error];
    BOOL v39 = v38 == 0;

    if (!v39) {
      goto LABEL_42;
    }
    if (v24)
    {
      [v23 makeGreetingActive:v24];
LABEL_42:

      goto LABEL_43;
    }
    id v25 = +[NSError errorWithDomain:kVVErrorDomain code:1033 localizedDescription:@"No greeting found to make active."];
    [v52 setError:v25];
LABEL_41:

    goto LABEL_42;
  }
  id v23 = +[NSError errorWithDomain:kVVErrorDomain code:1016 localizedDescription:@"Greetings mailbox doesn't exist."];
  [v52 setError:v23];
LABEL_43:

  __int16 v42 = +[MFActivityMonitor currentTracebleMonitor];
  id v43 = [v42 error];
  BOOL v44 = v43 == 0;

  if (v44)
  {
    [(IMAPService *)self _setActiveGreetingType:2];
    if (v13) {
      [(IMAPService *)self _setGreetingCached:1];
    }
  }

  [(NSRecursiveLock *)self->_greetingLock unlock];
  unsigned int v45 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [(VVService *)self getServiceObjLogPrefix];
    id v47 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)long long v57 = 136315650;
    id v58 = v46;
    __int16 v59 = 2080;
    long long v60 = " ";
    __int16 v61 = 2112;
    long long v62 = v47;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] Set custom greeting synchronously for service account %@ completed", v57, 0x20u);
  }
  if (v56) {
    sub_10006C2BC(v56);
  }
}

- (void)messageWriter:(id)a3 willEncodeHeaders:(id)a4 forMimePart:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  if ([v7 isAttachment])
  {
    id v8 = [v7 type];
    if ([v8 isEqualToString:@"audio"])
    {
      CFStringRef v9 = [v7 subtype];
      if ([v9 isEqualToString:@"amr"])
      {
        unsigned int greetingDuration = self->_greetingDuration;

        if (!greetingDuration) {
          goto LABEL_8;
        }
        id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%u", self->_greetingDuration);
        [v11 setHeader:v8 forKey:@"x-applevm-duration"];
      }
      else
      {
      }
    }
  }
LABEL_8:
}

- (void)setGreetingType:(int64_t)a3 data:(id)a4 duration:(unint64_t)a5
{
  id v8 = a4;
  if (!self->_greetingLock)
  {
    CFStringRef v9 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    greetingLock = self->_greetingLock;
    self->_greetingLock = v9;
  }
  v34.receiver = self;
  v34.super_class = (Class)IMAPService;
  [(VVService *)&v34 setGreetingType:a3 data:v8 duration:a5];
  if ((unint64_t)a3 < 2) {
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    id v11 = [objc_alloc((Class)NSNumber) initWithUnsignedInteger:a5];
    LOBYTE(v33) = 0;
    id v21 = +[MFMonitoredInvocation invocationWithSelector:"_synchronouslySetCustomGreetingWithData:duration:" target:self object1:v8 object2:v11 taskName:@"Setting Custom Greeting" priority:14 canBeCancelled:v33];
    [v21 retainArguments];
    id v22 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [(VVService *)self getServiceObjLogPrefix];
      id v24 = [(IMAPService *)self _messageChangeQueue];
      id v25 = [v21 monitor];
      CFIndex v26 = [v21 monitor];
      char v27 = [(IMAPService *)self serviceAccount];
      *(_DWORD *)buf = 136316674;
      __int16 v36 = v23;
      __int16 v37 = 2080;
      __int16 v38 = " ";
      __int16 v39 = 2112;
      int64_t v40 = (int64_t)v24;
      __int16 v41 = 2048;
      id v42 = v25;
      __int16 v43 = 2112;
      BOOL v44 = v26;
      __int16 v45 = 2112;
      v46 = v27;
      __int16 v47 = 2112;
      id v48 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: Starting set custom greeting task for service account %@ => %@", buf, 0x48u);
    }
    activityController = self->_activityController;
    __int16 v29 = [v21 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v29];

    CFStringRef v30 = [(IMAPService *)self _messageChangeQueue];
    [v30 addInvocation:v21];
  }
  else
  {
    if (a3 == 3)
    {
LABEL_6:
      id v11 = +[MFMonitoredInvocation invocationWithSelector:"_synchronouslySetDefaultGreeting" target:self taskName:@"Setting Default Greeting" priority:14 canBeCancelled:0];
      [v11 retainArguments];
      int v12 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(VVService *)self getServiceObjLogPrefix];
        id v14 = [(IMAPService *)self _messageChangeQueue];
        id v15 = [v11 monitor];
        uint64_t v16 = [v11 monitor];
        __int16 v17 = [(IMAPService *)self serviceAccount];
        *(_DWORD *)buf = 136316674;
        __int16 v36 = v13;
        __int16 v37 = 2080;
        __int16 v38 = " ";
        __int16 v39 = 2112;
        int64_t v40 = (int64_t)v14;
        __int16 v41 = 2048;
        id v42 = v15;
        __int16 v43 = 2112;
        BOOL v44 = v16;
        __int16 v45 = 2112;
        v46 = v17;
        __int16 v47 = 2112;
        id v48 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: Starting set default greeting task for service account %@ => %@", buf, 0x48u);
      }
      CFStringRef v18 = self->_activityController;
      id v19 = [v11 monitor];
      [(IMAPServiceActivityController *)v18 addScheduledActivity:v19];

      __int16 v20 = [(IMAPService *)self _messageChangeQueue];
      [v20 addInvocation:v11];

      goto LABEL_14;
    }
    id v11 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = [(VVService *)self getServiceObjLogPrefix];
      BOOL v32 = [(IMAPService *)self serviceAccount];
      *(_DWORD *)buf = 136315906;
      __int16 v36 = v31;
      __int16 v37 = 2080;
      __int16 v38 = " ";
      __int16 v39 = 2048;
      int64_t v40 = a3;
      __int16 v41 = 2112;
      id v42 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#E %s%sUnknown greeting type %ld for service account %@", buf, 0x2Au);
    }
  }
LABEL_14:
}

- (id)_candidateGreetingMessageForServiceAccount:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 mailboxUidForRelativePath:@"Greetings" create:1];
  if (v5)
  {
    __int16 v37 = [v4 storeForMailboxUid:v5];
    unsigned int v6 = [v37 candidateGreetingMessage];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v35 = [v6 customFlags];
      id v7 = [v35 containsObject:@"$AppleVM-ActiveGreeting"];
      unsigned int v36 = [v6 uid];
      id v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v9 = [(VVService *)self getServiceObjLogPrefix];
        unsigned int v10 = [v6 uid];
        id v11 = "NO";
        *(_DWORD *)buf = 136315906;
        __int16 v41 = v9;
        __int16 v43 = " ";
        __int16 v42 = 2080;
        if (v7) {
          id v11 = "YES";
        }
        __int16 v44 = 1024;
        *(_DWORD *)__int16 v45 = v10;
        *(_WORD *)&v45[4] = 2080;
        *(void *)&v45[6] = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sCustom greeting on server: UID:%u Active:%s", buf, 0x26u);
      }

      [(IMAPService *)self mf_lock];
      int v12 = [(IMAPService *)self _parameters];
      id v13 = [v12 objectForKey:@"GreetingCustomActive"];
      id v14 = [v12 objectForKey:@"GreetingCustomUID"];
      if ((id)[(IMAPService *)self mailboxGreetingType] == (id)2) {
        char v15 = 0;
      }
      else {
        char v15 = (char)v7;
      }
      if ((v15 & 1) == 0
        && v7 == [v13 BOOLValue]
        && [v14 unsignedLongValue] == (id)v36)
      {
        BOOL v34 = 0;
      }
      else
      {
        BOOL v34 = v14 != 0;
        CFStringRef v18 = +[NSNumber numberWithBool:v7];
        [v12 setObject:v18 forKey:@"GreetingCustomActive"];

        id v19 = +[NSNumber numberWithUnsignedLong:v36];
        [v12 setObject:v19 forKey:@"GreetingCustomUID"];

        if (v7) {
          CFStringRef v20 = @"Custom";
        }
        else {
          CFStringRef v20 = @"Standard";
        }
        [v12 setObject:v20 forKey:@"GreetingType"];
        *(_WORD *)&self->_imapServiceFlags &= ~4u;
        [(IMAPService *)self _saveParameters];
        [(IMAPService *)self mailboxGreetingType];
      }
      [(IMAPService *)self mf_unlock];

      if (v6) {
        int v21 = (int)v7;
      }
      else {
        int v21 = 0;
      }
      if (v21 == 1)
      {
        id v22 = [(VVService *)self accountDir];
        id v24 = sub_10006D9E8(v22, v23);
        id v25 = [v24 path];

        if (v25)
        {
          CFIndex v26 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            char v27 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315906;
            __int16 v41 = v27;
            __int16 v42 = 2080;
            __int16 v43 = " ";
            __int16 v44 = 2112;
            *(void *)__int16 v45 = v4;
            *(_WORD *)&v45[8] = 2112;
            *(void *)&v45[10] = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I %s%sCreating greeting file for service account %@, path:%@", buf, 0x2Au);
          }

          id v28 = v25;
          int v29 = open((const char *)[v28 fileSystemRepresentation], 512, 448);
          if ((v29 & 0x80000000) == 0) {
            close(v29);
          }
          CFRelease(v28);
        }
      }
      if (v34)
      {
        CFStringRef v38 = @"accountUUID";
        CFStringRef v30 = [(VVService *)self serviceLabelID];
        __int16 v39 = v30;
        __int16 v31 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];

        BOOL v32 = +[NSNotificationCenter defaultCenter];
        [v32 postNotificationName:@"VVServiceGreetingChangedByCarrierNotification" object:self userInfo:v31];
      }
    }
  }
  else
  {
    uint64_t v16 = +[NSError errorWithDomain:kVVErrorDomain code:1016 localizedDescription:@"Greetings mailbox doesn't exist."];
    __int16 v17 = +[MFActivityMonitor currentTracebleMonitor];
    [v17 setError:v16];

    unsigned int v6 = 0;
  }

  return v6;
}

- (BOOL)greetingAvailable
{
  [(IMAPService *)self mf_lock];
  __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
  if ((imapServiceFlags & 0x18) == 0)
  {
    id v4 = [(VVService *)self carrierParameterValueForKey:@"GreetingNotification"];
    unsigned int v5 = [v4 BOOLValue];

    if (v5)
    {
      unsigned int v6 = [(IMAPService *)self _parameters];
      id v7 = [v6 objectForKey:@"GreetingCached"];
      unsigned int v8 = [v7 BOOLValue];

      if (v8) {
        __int16 v9 = 8;
      }
      else {
        __int16 v9 = 16;
      }
      *(_WORD *)&self->___int16 imapServiceFlags = *(_WORD *)&self->_imapServiceFlags & 0xFFE7 | v9;

      __int16 imapServiceFlags = (__int16)self->_imapServiceFlags;
    }
    else
    {
      __int16 imapServiceFlags = *(_WORD *)&self->_imapServiceFlags & 0xFFE7 | 0x10;
      *(_WORD *)&self->___int16 imapServiceFlags = imapServiceFlags;
    }
  }
  BOOL v10 = (imapServiceFlags & 0x18) != 0;
  [(IMAPService *)self mf_unlock];
  return v10;
}

- (void)_setGreetingCached:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMAPService *)self mf_lock];
  if (((*(_WORD *)&self->_imapServiceFlags & 0x18) != 8) == v3)
  {
    unsigned int v5 = [(VVService *)self carrierParameterValueForKey:@"GreetingNotification"];
    unsigned int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = [(IMAPService *)self _parameters];
      id v8 = [objc_alloc((Class)NSNumber) initWithBool:v3];
      [v7 setValue:v8 forKey:@"GreetingCached"];
      [(IMAPService *)self _saveParameters];
      if (v3) {
        __int16 v9 = 8;
      }
      else {
        __int16 v9 = 16;
      }
      *(_WORD *)&self->___int16 imapServiceFlags = *(_WORD *)&self->_imapServiceFlags & 0xFFE7 | v9;
    }
  }
  [(IMAPService *)self mf_unlock];
}

- (void)retrieveGreeting:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  unsigned int v6 = +[MFMonitoredInvocation invocationWithSelector:"retrieveGreetingWorkerForServiceAccount:" target:self object:v5 taskName:@"Retrieving Greeting" priority:15 canBeCancelled:1];

  [v6 retainArguments];
  id v7 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(VVService *)self getServiceObjLogPrefix];
    id v9 = [(IMAPService *)self _messageChangeQueue];
    id v10 = [v6 monitor];
    id v11 = [v6 monitor];
    int v12 = [(IMAPService *)self serviceAccount];
    int v16 = 136316674;
    __int16 v17 = v8;
    __int16 v18 = 2080;
    id v19 = " ";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2048;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    char v27 = v12;
    __int16 v28 = 2112;
    int v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: retrieveGreeting, account %@ => %@", (uint8_t *)&v16, 0x48u);
  }
  activityController = self->_activityController;
  id v14 = [v6 monitor];
  [(IMAPServiceActivityController *)activityController addScheduledActivity:v14];

  char v15 = [(IMAPService *)self _messageChangeQueue];
  [v15 addInvocation:v6];
}

- (void)retrieveGreetingWorkerForServiceAccount:(id)a3
{
  id v33 = a3;
  id v4 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(VVService *)self getServiceObjLogPrefix];
    unsigned int v6 = [(IMAPService *)self serviceAccount];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = " ";
    __int16 v39 = 2112;
    int64_t v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sJetsam assertion for greeting worker created, service account %@", buf, 0x20u);
  }
  id v7 = (ctu::XpcJetsamAssertion *)pthread_mutex_lock(&stru_1000E06C0);
  if (!(void)xmmword_1000E0700)
  {
    ctu::XpcJetsamAssertion::create_default_global((uint64_t *)buf, v7);
    long long v8 = *(_OWORD *)buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v9 = (std::__shared_weak_count *)*((void *)&xmmword_1000E0700 + 1);
    xmmword_1000E0700 = v8;
    if (v9)
    {
      sub_10006C2BC(v9);
      if (*(void *)&buf[8]) {
        sub_10006C2BC(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  id v10 = (std::__shared_weak_count *)*((void *)&xmmword_1000E0700 + 1);
  if (*((void *)&xmmword_1000E0700 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1000E0700 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_1000E06C0);
  sub_10000E6A8(&__p, "retrieveGreetingWorkerForServiceAccount");
  ctu::XpcJetsamAssertion::createActivity();
  if (v36 < 0) {
    operator delete(__p);
  }
  if (v10) {
    sub_10006C2BC(v10);
  }
  id v11 = [(IMAPService *)self serviceAccount];
  int v12 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(VVService *)self getServiceObjLogPrefix];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = " ";
    __int16 v39 = 2112;
    int64_t v40 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPService::retrieveGreetingWorkerForServiceAccount, account %@", buf, 0x20u);
  }

  id v14 = +[NSNotificationCenter defaultCenter];
  v43[0] = @"accountUUID";
  char v15 = [(VVService *)self serviceLabelID];
  v44[0] = v15;
  v43[1] = @"VVBlock";
  id v16 = objc_retainBlock(v34);
  v44[1] = v16;
  v43[2] = @"VVTaskType";
  v44[2] = &off_1000C86A8;
  __int16 v17 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

  [v14 postNotificationName:@"VVServiceTaskStartedNotification" object:self userInfo:v17];
  if (v11)
  {
    __int16 v18 = [(IMAPService *)self _candidateGreetingMessageForServiceAccount:v11];
    id v19 = v18;
    if (v18)
    {
      __int16 v20 = [v18 messageBody];
      id v21 = [v17 mutableCopy];
      [v21 setObject:&__kCFBooleanFalse forKeyedSubscript:@"VVTaskWillBeRetried"];
      [v14 postNotificationName:@"VVServiceTaskEndedNotification" object:self userInfo:v21];

      __int16 v22 = 0;
    }
    else
    {
      __int16 v22 = +[NSError errorWithDomain:kVVErrorDomain code:1033 localizedDescription:@"No greeting found to retrive."];
    }
  }
  else
  {
    __int16 v22 = +[NSError errorWithDomain:kVVErrorDomain code:1034 localizedDescription:@"Couldn't find service account."];
  }
  if (v22)
  {
    id v23 = +[MFActivityMonitor currentTracebleMonitor];
    __int16 v24 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v26 = [v23 error];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = " ";
      __int16 v39 = 2112;
      int64_t v40 = v22;
      __int16 v41 = 2112;
      __int16 v42 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPService::retrieveGreetingWorkerForServiceAccount failed with error %@, monitor error %@", buf, 0x2Au);
    }
    char v27 = [v23 error];
    BOOL v28 = v27 == 0;

    if (v28) {
      [v23 setError:v22];
    }
    id v29 = [v17 mutableCopy];
    [v29 setObject:&__kCFBooleanFalse forKeyedSubscript:@"VVTaskWillBeRetried"];
    CFStringRef v30 = [v23 error];
    [v29 setObject:v30 forKeyedSubscript:@"VVError"];

    [v14 postNotificationName:@"VVServiceTaskCancelledNotification" object:self userInfo:v29];
  }
  __int16 v31 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v32 = [(VVService *)self getServiceObjLogPrefix];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v32;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = " ";
    __int16 v39 = 2112;
    int64_t v40 = v11;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] IMAPService::retrieveGreetingWorkerForServiceAccount for service account %@ completed", buf, 0x20u);
  }

  if (v37) {
    sub_10006C2BC(v37);
  }
}

- (id)_parametersFilePath
{
  id v2 = [(VVService *)self accountDir];
  BOOL v3 = [v2 URLByAppendingPathComponent:@"com.apple.voicemail.imap.parameters.plist" isDirectory:0];
  id v4 = [v3 path];

  return v4;
}

- (id)_parameters
{
  [(IMAPService *)self mf_lock];
  if (!self->_imapParameters)
  {
    BOOL v3 = [(IMAPService *)self _parametersFilePath];
    id v4 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:v3];
    imapParameters = self->_imapParameters;
    self->_imapParameters = v4;

    if (!self->_imapParameters)
    {
      unsigned int v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v7 = self->_imapParameters;
      self->_imapParameters = v6;
    }
  }
  [(IMAPService *)self mf_unlock];
  long long v8 = self->_imapParameters;
  return v8;
}

- (void)_saveParameters
{
  [(IMAPService *)self mf_lock];
  if (self->_imapParameters)
  {
    BOOL v3 = [(IMAPService *)self _parametersFilePath];
    imapParameters = self->_imapParameters;
    id v12 = 0;
    [(NSMutableDictionary *)imapParameters writeToFile:v3 options:268435457 error:&v12];
    id v5 = v12;
    if (v5)
    {
      unsigned int v6 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136315906;
        id v14 = v7;
        __int16 v15 = 2080;
        id v16 = " ";
        __int16 v17 = 2112;
        __int16 v18 = v3;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not save file at path %@ due to error %@", buf, 0x2Au);
      }
    }
    id v8 = [(NSMutableDictionary *)self->_imapParameters copy];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069FA4;
    block[3] = &unk_1000C1FC8;
    void block[4] = self;
    id v11 = v8;
    id v9 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    BOOL v3 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100081B80((uint64_t)[(VVService *)self getServiceObjLogPrefix], (uint64_t)buf);
    }
  }

  [(IMAPService *)self mf_unlock];
}

- (int64_t)mailboxGreetingType
{
  [(IMAPService *)self mf_lock];
  if ((*(_WORD *)&self->_imapServiceFlags & 4) == 0)
  {
    self->_int64_t greetingType = 3;
    BOOL v3 = [(IMAPService *)self _parameters];
    id v4 = v3;
    if (!v3)
    {
LABEL_10:
      *(_WORD *)&self->_imapServiceFlags |= 4u;

      goto LABEL_11;
    }
    id v5 = [v3 objectForKey:@"GreetingType"];
    unsigned int v6 = v5;
    if (v5)
    {
      if ([v5 isEqualToString:@"Standard"])
      {
        int64_t v7 = 0;
LABEL_8:
        self->_int64_t greetingType = v7;
        goto LABEL_9;
      }
      if ([v6 isEqualToString:@"Custom"])
      {
        int64_t v7 = 2;
        goto LABEL_8;
      }
    }
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
  int64_t greetingType = self->_greetingType;
  [(IMAPService *)self mf_unlock];
  return greetingType;
}

- (void)_setActiveGreetingType:(int64_t)a3
{
  [(IMAPService *)self mf_lock];
  if (self->_greetingType != a3)
  {
    CFStringRef v5 = &stru_1000C35D8;
    if (!a3) {
      CFStringRef v5 = @"Standard";
    }
    if (a3 == 2) {
      CFStringRef v6 = @"Custom";
    }
    else {
      CFStringRef v6 = v5;
    }
    int64_t v7 = [(IMAPService *)self _parameters];
    [v7 setObject:v6 forKey:@"GreetingType"];
    [(IMAPService *)self _saveParameters];
    *(_WORD *)&self->_imapServiceFlags |= 4u;
    self->_int64_t greetingType = a3;
  }
  [(IMAPService *)self mf_unlock];
}

- (void)_onQueue_setPasscode:(id)a3 completion:(id)a4
{
  id v20 = a3;
  CFStringRef v6 = (void (**)(id, void, void *))a4;
  int64_t v7 = [(IMAPService *)self serviceAccount];
  if (v7)
  {
    [(IMAPService *)self setChangePasswordReplyBlock:v6];
    id v8 = +[MFMonitoredInvocation invocationWithSelector:"changePIN:" target:v7 object:v20 taskName:@"Changing PIN" priority:2 canBeCancelled:1];
    [v8 retainArguments];
    id v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(VVService *)self getServiceObjLogPrefix];
      id v11 = [(IMAPService *)self _messageChangeQueue];
      id v12 = [v8 monitor];
      id v13 = [v8 monitor];
      *(_DWORD *)buf = 136316674;
      __int16 v22 = v10;
      __int16 v23 = 2080;
      __int16 v24 = " ";
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2048;
      BOOL v28 = v12;
      __int16 v29 = 2112;
      CFStringRef v30 = v13;
      __int16 v31 = 2112;
      BOOL v32 = v7;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: _onQueue_setPasscode, account %@ => %@", buf, 0x48u);
    }
    activityController = self->_activityController;
    __int16 v15 = [v8 monitor];
    [(IMAPServiceActivityController *)activityController addScheduledActivity:v15];

    id v16 = [(IMAPService *)self _messageChangeQueue];
    [v16 addInvocation:v8];

    __int16 v17 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [(VVService *)self getServiceObjLogPrefix];
      *(_DWORD *)buf = 136315650;
      __int16 v22 = v18;
      __int16 v23 = 2080;
      __int16 v24 = " ";
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sadded invocation %@", buf, 0x20u);
    }
  }
  else
  {
    __int16 v19 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v23 = 2080;
      __int16 v24 = " ";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sWe dont have a valid account - requesting new server info", buf, 0x16u);
    }

    [(IMAPService *)self _startBeacon];
    id v8 = +[NSError errorWithDomain:kVVErrorDomain code:1017 userInfo:0];
    v6[2](v6, 0, v8);
  }
}

- (void)setPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(VVService *)self getServiceObjLogPrefix];
    id v10 = [(IMAPService *)self _messageChangeQueue];
    *(_DWORD *)buf = 136315906;
    id v20 = v9;
    __int16 v21 = 2080;
    __int16 v22 = " ";
    __int16 v23 = 2112;
    __int16 v24 = v10;
    __int16 v25 = 2112;
    id v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:???, schedule: setPasscode, account %@", buf, 0x2Au);
  }
  messageChangeQueue = self->_messageChangeQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10006A910;
  v14[3] = &unk_1000C2A18;
  objc_copyWeak(&v17, &location);
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  [(MFInvocationQueue *)messageChangeQueue addBlockInvocation:v14 withPriority:2 controlledBy:self->_activityController];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_handleFlagsDidChange:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    id v8 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v9 = 2080;
    id v10 = " ";
    __int16 v11 = 2112;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2112;
    id v14 = v4;
    id v6 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s==== _handleFlagsDidChange, %@ is handling <%@>", (uint8_t *)&v7, 0x2Au);
  }
}

- (void)_handleVoicemailPasswordChangeTaskNotification:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v24 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v25 = 2080;
    id v26 = " ";
    __int16 v27 = 2112;
    id v28 = (id)objc_opt_class();
    __int16 v29 = 2112;
    id v30 = v4;
    id v6 = v28;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling <%@>", buf, 0x2Au);
  }
  int v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"VVTaskType"];
  unsigned int v9 = [v8 isEqual:&off_1000C86C0];

  if (v9)
  {
    id v10 = [v4 userInfo];
    __int16 v11 = [v10 objectForKeyedSubscript:@"VVError"];

    if (!v11)
    {
LABEL_8:
      id v17 = 0;
LABEL_13:
      uint64_t v18 = [(IMAPService *)self changePasswordReplyBlock];
      __int16 v19 = (void *)v18;
      if (v18)
      {
        (*(void (**)(uint64_t, BOOL, void *))(v18 + 16))(v18, v11 == 0, v17);
        [(IMAPService *)self setChangePasswordReplyBlock:0];
      }
      else
      {
        id v20 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100081BC4((uint64_t)[(VVService *)self getServiceObjLogPrefix], (uint64_t)buf);
        }
      }
      goto LABEL_19;
    }
    id v12 = [v4 userInfo];
    __int16 v13 = [v12 objectForKeyedSubscript:@"VVSuppressError"];
    if (v13)
    {
      __int16 v22 = [v4 userInfo];
      id v14 = [v22 objectForKeyedSubscript:@"VVSuppressError"];
      if (!v14)
      {

        id v17 = 0;
        goto LABEL_12;
      }
      id v15 = [v4 userInfo];
      id v16 = [v15 objectForKeyedSubscript:@"VVSuppressError"];
      unsigned __int8 v21 = [v16 BOOLValue];

      if (v21) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v12 = [v4 userInfo];
    id v17 = [v12 objectForKeyedSubscript:@"VVError"];
LABEL_12:

    goto LABEL_13;
  }
LABEL_19:
}

- (void)requestController:(id)a3 didSendRequest:(id)a4
{
  id v5 = a4;
  id v6 = [v5 subscription];
  int v7 = [v6 uuid];
  id v8 = [(VVService *)self contextInfo];
  unsigned int v9 = [v8 uuid];
  unsigned int v10 = [v7 isEqual:v9];

  if (v10)
  {
    __int16 v11 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      __int16 v13 = [(VVService *)self getServiceObjLogPrefix];
      __int16 v14 = 2080;
      id v15 = " ";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%sSent state request %@. Waiting for response.", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)requestController:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned int v9 = [v7 subscription];
  unsigned int v10 = [v9 uuid];
  __int16 v11 = [(VVService *)self contextInfo];
  int v12 = [v11 uuid];
  unsigned int v13 = [v10 isEqual:v12];

  if (v13)
  {
    int64_t v14 = [(VVService *)self attemptCountForStateRequest:v8];
    id v15 = [v7 error];

    value = (id *)self->logger.__ptr_.__value_;
    if (v15)
    {
      id v17 = sub_100020EE0(value);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [(VVService *)self getServiceObjLogPrefix];
        id v19 = [v8 identifier];
        id v20 = [v7 error];
        int v36 = 136316162;
        __int16 v37 = v18;
        __int16 v38 = 2080;
        __int16 v39 = " ";
        __int16 v40 = 2048;
        id v41 = v19;
        __int16 v42 = 2048;
        int64_t v43 = v14;
        __int16 v44 = 2112;
        __int16 v45 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#W %s%sCoreTelephony failed to send message with identifier %ld to carrier on attempt #%ld due to error %@", (uint8_t *)&v36, 0x34u);
      }
      [(IMAPService *)self setBeaconActive:0];
      unsigned __int8 v21 = [v7 error];
      id v22 = [v21 code];
      BOOL v23 = v22 == (id)qword_1000E0768;

      if (v23)
      {
        if (self->_beaconTemporaryRetryCount > 9)
        {
          __int16 v29 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = [(VVService *)self getServiceObjLogPrefix];
            int v36 = 136315394;
            __int16 v37 = v30;
            __int16 v38 = 2080;
            __int16 v39 = " ";
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#W %s%sTemporary retry attempts are maxed out.", (uint8_t *)&v36, 0x16u);
          }

          [(IMAPService *)self _cancelBeacon];
          [(IMAPService *)self _incrementBeaconCount];
          [(IMAPService *)self _resetBeaconTemporaryRetryCount];
          __int16 v31 = [(VVService *)self carrierParameterValueForKey:@"BeaconTimeout"];
          unsigned int v32 = [v31 intValue];

          int v33 = 60 * v32;
          id v34 = (void *)(int)(60 * v32);
          [(IMAPService *)self _scheduleBeaconRetry:v33];
          __int16 v24 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          __int16 v35 = [(VVService *)self getServiceObjLogPrefix];
          int v36 = 136315650;
          __int16 v37 = v35;
          __int16 v38 = 2080;
          __int16 v39 = " ";
          __int16 v40 = 2048;
          id v41 = v34;
          __int16 v27 = "#I %s%sScheduled next attempt in %lu sec.";
        }
        else
        {
          [(IMAPService *)self _incrementBeaconTemporaryRetryCount];
          [(IMAPService *)self _cancelBeacon];
          [(IMAPService *)self _scheduleBeaconRetry:120];
          __int16 v24 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
LABEL_17:

            goto LABEL_18;
          }
          __int16 v25 = [(VVService *)self getServiceObjLogPrefix];
          beaconTemporaryRetryCFIndex Count = self->_beaconTemporaryRetryCount;
          int v36 = 136315650;
          __int16 v37 = v25;
          __int16 v38 = 2080;
          __int16 v39 = " ";
          __int16 v40 = 2048;
          id v41 = (id)beaconTemporaryRetryCount;
          __int16 v27 = "#I %s%sScheduled temporary retry attempt %lu.";
        }
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v36, 0x20u);
        goto LABEL_17;
      }
    }
    else
    {
      id v28 = sub_100020EE0(value);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136315906;
        __int16 v37 = [(VVService *)self getServiceObjLogPrefix];
        __int16 v38 = 2080;
        __int16 v39 = " ";
        __int16 v40 = 2048;
        id v41 = [v8 identifier];
        __int16 v42 = 2048;
        int64_t v43 = v14;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#I %s%sCoreTelephony sent message with identifier %ld to carrier on attempt #%ld. Waiting for carrier response.", (uint8_t *)&v36, 0x2Au);
      }

      [(VVService *)self removeAttemptCountForStateRequest:v8];
      [(IMAPService *)self setBeaconActive:1];
      [(IMAPService *)self _incrementBeaconCount];
      [(IMAPService *)self _resetBeaconTemporaryRetryCount];
    }
  }
LABEL_18:
}

- (void)onVMStoreRecordFlagsChangedNotification:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5
{
  id v28 = [(IMAPService *)self serviceAccount];
  unsigned int v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v30 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v31 = 2080;
    unsigned int v32 = " ";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s================= __VMStoreRecordFlagsChangedNotificationCallback", buf, 0x16u);
  }

  unsigned int v10 = CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlagsLabel");
  __int16 v11 = [v28 serviceLabelID];
  int v12 = [v11 UUIDString];
  unsigned int v13 = [v12 isEqualToString:v10];

  if (v13)
  {
    id v14 = objc_msgSend((id)CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlags"), "unsignedIntValue");
    [(VVService *)self updateCountsForChangedFlags:v14 currentRecordFlags:VMStoreRecordGetFlags((uint64_t)a4)];
    if (!CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlagsFromServer"))
    {
      id v15 = VMStoreRecordCopyFlagsDescription((int)v14);
      CFStringRef v16 = VMStoreRecordCopyDescription((uint64_t)a4);
      id v17 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136316418;
        id v30 = v18;
        __int16 v31 = 2080;
        unsigned int v32 = " ";
        __int16 v33 = 2112;
        id v34 = a3;
        __int16 v35 = 2112;
        int v36 = v15;
        __int16 v37 = 2112;
        CFStringRef v38 = v16;
        __int16 v39 = 2112;
        __int16 v40 = v28;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%shandling <%@>, changedFlags=%@, record=%@, account=%@", buf, 0x3Eu);
      }

      if (v16) {
        CFRelease(v16);
      }
      if (v15) {
        CFRelease(v15);
      }
      if ((v14 & 0x45) != 0)
      {
        if (a4
          && (v14 & 0x44) != 0
          && ((VMStoreRecordGetFlags((uint64_t)a4) & 4) != 0 || (VMStoreRecordGetFlags((uint64_t)a4) & 0x40) != 0))
        {
          [(IMAPService *)self _addPendingDeleteForRecord:a4];
        }
        v43[0] = @"object";
        v43[1] = @"userInfo";
        v44[0] = a4;
        v44[1] = a5;
        id v19 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
        id v20 = +[MFMonitoredInvocation invocationWithSelector:"_synchronouslyPushFlags:" target:self object:v19 taskName:@"Pushing Flags" priority:5 canBeCancelled:1];

        [v20 retainArguments];
        unsigned __int8 v21 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [(VVService *)self getServiceObjLogPrefix];
          BOOL v23 = [(IMAPService *)self _messageChangeQueue];
          __int16 v24 = [v20 monitor];
          __int16 v25 = [v20 monitor];
          *(_DWORD *)buf = 136316674;
          id v30 = v22;
          __int16 v31 = 2080;
          unsigned int v32 = " ";
          __int16 v33 = 2112;
          id v34 = v23;
          __int16 v35 = 2048;
          int v36 = v24;
          __int16 v37 = 2112;
          CFStringRef v38 = v25;
          __int16 v39 = 2112;
          __int16 v40 = v28;
          __int16 v41 = 2112;
          __int16 v42 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVQ] queue:%@, monitor:%p.'%@', schedule: _synchronouslyPushFlags, account %@ => %@", buf, 0x48u);
        }
        id v26 = [v20 monitor];
        [(IMAPService *)self addScheduledActivity:v26];

        __int16 v27 = [(IMAPService *)self _messageChangeQueue];
        [v27 addInvocation:v20];
      }
    }
  }
}

- (void)onVMStoreRecordFlagsDidChangeNotification:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5
{
  if (a5) {
    BOOL v8 = CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlagsFromServer") != 0;
  }
  else {
    BOOL v8 = 1;
  }
  unsigned int v9 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v30 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v31 = 2080;
    unsigned int v32 = " ";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s================= __VMStoreRecordFlagsDidChangeNotificationCallback", buf, 0x16u);
  }

  if (!v8)
  {
    id v28 = CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlagsLabel");
    unsigned int v10 = [(IMAPService *)self serviceAccount];
    __int16 v11 = [v10 serviceLabelID];
    int v12 = [v11 UUIDString];
    unsigned int v13 = [v12 isEqualToString:v28];

    if (v13)
    {
      int v14 = objc_msgSend((id)CFDictionaryGetValue(a5, @"VMStoreRecordOldFlags"), "unsignedIntValue");
      int v15 = objc_msgSend((id)CFDictionaryGetValue(a5, @"VMStoreRecordNewFlags"), "unsignedIntValue");
      int v16 = objc_msgSend((id)CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlags"), "unsignedIntValue");
      id v17 = VMStoreRecordCopyFlagsDescription(v14);
      uint64_t v18 = VMStoreRecordCopyFlagsDescription(v15);
      id v19 = VMStoreRecordCopyFlagsDescription(v16);
      id v20 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v21 = [(VVService *)self getServiceObjLogPrefix];
        *(_DWORD *)buf = 136316674;
        id v30 = v21;
        __int16 v31 = 2080;
        unsigned int v32 = " ";
        __int16 v33 = 2112;
        id v34 = a3;
        __int16 v35 = 2112;
        int v36 = v17;
        __int16 v37 = 2112;
        CFStringRef v38 = v18;
        __int16 v39 = 2112;
        __int16 v40 = v19;
        __int16 v41 = 2112;
        __int16 v42 = v10;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s%shandling <%@>, flags=%@, newFlags=%@, changedFlags=%@, account=%@", buf, 0x48u);
      }

      if (v17) {
        CFRelease(v17);
      }
      if (v18) {
        CFRelease(v18);
      }
      if (v19) {
        CFRelease(v19);
      }
      if ((v16 & 0x45) != 0)
      {
        int v22 = 0;
        if ((v15 & 0x40) != 0 && (v16 & 0x40) != 0)
        {
          CFStringRef v23 = VMStoreRecordCopyDescription((uint64_t)a4);
          __int16 v24 = VMStoreRecordCopyFlagsDescription(4);
          __int16 v25 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = [(VVService *)self getServiceObjLogPrefix];
            *(_DWORD *)buf = 136315906;
            id v30 = v26;
            __int16 v31 = 2080;
            unsigned int v32 = " ";
            __int16 v33 = 2112;
            id v34 = v24;
            __int16 v35 = 2112;
            int v36 = (__CFString *)v23;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%sSet %@ flag for Detached record %@", buf, 0x2Au);
          }

          if (v23) {
            CFRelease(v23);
          }
          if (v24) {
            CFRelease(v24);
          }
          int v22 = 4;
        }
        if (a4) {
          [v10 willSetFlags:v22 | v16 state:VMStoreRecordGetFlags((uint64_t)a4) | v22 forRecord:a4 needToBeStored:0];
        }
      }
      objc_msgSend(v10, "completeFlagChange", a4);
    }
  }
}

- (void)onVMStoreRecordFlagsWillChangeNotification:(__CFString *)a3 object:(const void *)a4 userInfo:(__CFDictionary *)a5
{
  BOOL v8 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    id v17 = [(VVService *)self getServiceObjLogPrefix];
    __int16 v18 = 2080;
    id v19 = " ";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s================= __VMStoreRecordFlagsWillChangeNotificationCallback", (uint8_t *)&v16, 0x16u);
  }

  if (a5 && !CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlagsFromServer"))
  {
    unsigned int v9 = CFDictionaryGetValue(a5, @"VMStoreRecordChangedFlagsLabel");
    unsigned int v10 = [(IMAPService *)self serviceAccount];
    __int16 v11 = [v10 serviceLabelID];
    int v12 = [v11 UUIDString];
    unsigned int v13 = [v12 isEqualToString:v9];

    if (v13)
    {
      int v14 = sub_100020EE0((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [(VVService *)self getServiceObjLogPrefix];
        int v16 = 136315906;
        id v17 = v15;
        __int16 v18 = 2080;
        id v19 = " ";
        __int16 v20 = 2112;
        unsigned __int8 v21 = a3;
        __int16 v22 = 2112;
        CFStringRef v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%shandling <%@>, account=%@", (uint8_t *)&v16, 0x2Au);
      }

      [v10 prepareForFlagChange];
    }
  }
}

- (BOOL)beaconRetryRegistered
{
  return self->_beaconRetryRegistered;
}

- (void)setBeaconRetryRegistered:(BOOL)a3
{
  self->_beaconRetryRegistered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceAccount, 0);
  objc_storeStrong(&self->_changePasswordReplyBlock, 0);
  objc_storeStrong((id *)&self->_bodyLoadMonitorLock, 0);
  sub_100026948((ctu::OsLogLogger **)&self->logger, 0);
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_addedRecords, 0);
  objc_storeStrong((id *)&self->_pendingDeletesLock, 0);
  objc_storeStrong((id *)&self->_pendingDeletes, 0);
  objc_storeStrong((id *)&self->_messageChangeQueue, 0);
  objc_storeStrong((id *)&self->_imapParameters, 0);
  objc_storeStrong((id *)&self->_greetingLock, 0);
  objc_storeStrong((id *)&self->_bodyLoadMonitor, 0);
  objc_storeStrong((id *)&self->_activityController, 0);
}

- (id).cxx_construct
{
  *((void *)self + 55) = 0;
  return self;
}

@end