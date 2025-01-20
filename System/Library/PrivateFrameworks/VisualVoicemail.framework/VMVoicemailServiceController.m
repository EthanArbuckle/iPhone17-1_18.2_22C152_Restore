@interface VMVoicemailServiceController
- (NSProgress)progress;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (VMCarrierServicesController)carrierServicesController;
- (VMDAccountManager)accountManager;
- (VMDGreetingManager)greetingManager;
- (VMTelephonyClient)telephonyClient;
- (VMTranscriptionService)transcriptionService;
- (VMVoicemailServiceController)initWithConnection:(id)a3 accountManager:(id)a4 greetingManager:(id)a5 carrierServicesController:(id)a6 transcriptionService:(id)a7 telephonyClient:(id)a8;
- (id).cxx_construct;
- (id)allVoicemails;
- (id)capabilities;
- (id)changePasswordReplyBlock;
- (id)clientConnectionWithErrorHandler:(id)a3;
- (id)reportTranscriptionProgressReplyBlock;
- (id)requestTranscriptionProgress:(id)a3;
- (void)_handleCheckSubscriptionStatus:(id)a3;
- (void)_handleOnlineStatusChanged:(id)a3;
- (void)_handleSubscriptionStatusChanged:(id)a3;
- (void)_handleSyncStatusChangedNotification:(id)a3;
- (void)_handleTranscribingStatusChanged:(id)a3;
- (void)_handleVoicemailStorageUsageChanged:(id)a3;
- (void)_handleVoicemailStoreSaved;
- (void)_sendCapabilities;
- (void)accounts:(id)a3;
- (void)accountsDidChangeForAccountManager:(id)a3;
- (void)allVoicemails:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)greetingChangedByCarrier:(id)a3;
- (void)greetingForAccountUUID:(id)a3 reply:(id)a4;
- (void)greetingManager:(id)a3 greetingDidChangeForAccountUUID:(id)a4;
- (void)greetingManager:(id)a3 greetingWillChangeForAccountUUID:(id)a4;
- (void)insertVoicemail:(id)a3;
- (void)isAccountOnline:(id)a3 reply:(id)a4;
- (void)isAccountSubscribed:(id)a3 reply:(id)a4;
- (void)isCallVoicemailSupportedForAccountUUID:(id)a3 reply:(id)a4;
- (void)isGreetingChangeSupportedForAccountUUID:(id)a3 reply:(id)a4;
- (void)isPasscodeChangeSupportedForAccountUUID:(id)a3 reply:(id)a4;
- (void)maximumGreetingDurationForAccountUUID:(id)a3 reply:(id)a4;
- (void)maximumPasscodeLengthForAccountUUID:(id)a3 reply:(id)a4;
- (void)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 reply:(id)a5;
- (void)messageCountForMailboxType:(int64_t)a3 reply:(id)a4;
- (void)messagesForMailboxType:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5 reply:(id)a6;
- (void)messagesForMailboxType:(int64_t)a3 read:(BOOL)a4 limit:(int64_t)a5 offset:(int64_t)a6 reply:(id)a7;
- (void)minimumPasscodeLengthForAccountUUID:(id)a3 reply:(id)a4;
- (void)obliterate;
- (void)ping:(id)a3;
- (void)remapAccount:(id)a3 toAccount:(id)a4;
- (void)removeVoicemailFromTrashWithIdentifier:(int64_t)a3;
- (void)reportTranscriptionProblemForIdentifier:(int64_t)a3;
- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forIdentifier:(int64_t)a4;
- (void)requestInitialState:(id)a3;
- (void)resetNetworkSettings;
- (void)retrieveDataForIdentifier:(int64_t)a3;
- (void)setAccountManager:(id)a3;
- (void)setCarrierServicesController:(id)a3;
- (void)setChangePasswordReplyBlock:(id)a3;
- (void)setDeletedForIdentifier:(int64_t)a3;
- (void)setDeletedForIdentifiers:(id)a3;
- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 reply:(id)a5;
- (void)setGreetingManager:(id)a3;
- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 reply:(id)a5;
- (void)setProgress:(id)a3;
- (void)setReadForIdentifier:(int64_t)a3;
- (void)setReadForIdentifiers:(id)a3;
- (void)setReportTranscriptionProgressReplyBlock:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)setTranscriptionService:(id)a3;
- (void)setTrashedForIdentifiers:(id)a3;
- (void)synchronize;
- (void)transcriptionController:(id)a3 transcriptionProgressFractionCompletedChanged:(double)a4;
- (void)transcriptionController:(id)a3 transcriptionProgressTotalUnitCountChanged:(int64_t)a4;
@end

@implementation VMVoicemailServiceController

- (id)clientConnectionWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(VMVoicemailServiceController *)self connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (VMVoicemailServiceController)initWithConnection:(id)a3 accountManager:(id)a4 greetingManager:(id)a5 carrierServicesController:(id)a6 transcriptionService:(id)a7 telephonyClient:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v45.receiver = self;
  v45.super_class = (Class)VMVoicemailServiceController;
  v21 = [(VMVoicemailServiceController *)&v45 init];
  if (v21)
  {
    id v41 = v20;
    v42 = v15;
    v22 = objc_msgSend((id)objc_opt_class(), "vm_classIdentifier");
    v23 = NSStringFromSelector("queue");
    v24 = +[NSString stringWithFormat:@"%@.%@", v22, v23];

    id v25 = v24;
    dispatch_queue_t v26 = dispatch_queue_create((const char *)[v25 UTF8String], 0);
    objc_storeStrong((id *)v21 + 7, v26);
    id v27 = objc_storeWeak((id *)v21 + 8, v16);
    [v16 addDelegate:v21 queue:*((void *)v21 + 7)];

    id v28 = objc_storeWeak((id *)v21 + 9, v17);
    [v17 addDelegate:v21 queue:*((void *)v21 + 7)];

    objc_storeStrong((id *)v21 + 6, a3);
    [*((id *)v21 + 6) setDelegate:v21];
    *((_DWORD *)v21 + 2) = [v42 processIdentifier];
    sub_100009F0C();
    v29 = (void **)(v21 + 16);
    if (v21[39] < 0) {
      operator delete(*v29);
    }
    *(_OWORD *)v29 = v43;
    *((void *)v21 + 4) = v44;
    *((_WORD *)v21 + 20) = 0;
    objc_storeWeak((id *)v21 + 10, v18);
    objc_storeWeak((id *)v21 + 11, v19);
    objc_storeStrong((id *)v21 + 12, a8);
    id WeakRetained = objc_loadWeakRetained((id *)v21 + 11);
    v31 = [WeakRetained transcriptionController];
    [v31 addDelegate:v21 queue:*((void *)v21 + 7)];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v21, (CFNotificationCallback)sub_10000A4EC, @"com.apple.voicemail.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v21 selector:"_handleSubscriptionStatusChanged:" name:@"VVServiceSubscriptionStatusChangedNotification" object:0];

    v34 = +[NSNotificationCenter defaultCenter];
    [v34 addObserver:v21 selector:"_handleCheckSubscriptionStatus:" name:@"VVServiceCheckSubscriptionStatusNotification" object:0];

    v35 = +[NSNotificationCenter defaultCenter];
    [v35 addObserver:v21 selector:"_handleOnlineStatusChanged:" name:@"VVServiceOnlineStateChangedNotification" object:0];

    v36 = +[NSNotificationCenter defaultCenter];
    [v36 addObserver:v21 selector:"_handleNewServiceNotification:" name:@"VVServiceNewServiceNotification" object:0];

    v37 = +[NSNotificationCenter defaultCenter];
    [v37 addObserver:v21 selector:"_handleSyncStatusChangedNotification:" name:@"VVServiceSyncStatusChangedNotification" object:0];

    v38 = +[NSNotificationCenter defaultCenter];
    [v38 addObserver:v21 selector:"_handleVoicemailStorageUsageChanged:" name:@"VVServiceMailboxUsageChangedNotification" object:0];

    v39 = +[NSNotificationCenter defaultCenter];
    [v39 addObserver:v21 selector:"_handleTranscribingStatusChanged:" name:@"VVVoicemailTranscribingStatusChangedNotification" object:0];

    id v20 = v41;
    id v15 = v42;
  }

  return (VMVoicemailServiceController *)v21;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)VMVoicemailServiceController;
  [(VMVoicemailServiceController *)&v5 dealloc];
}

- (id)capabilities
{
  id v2 = objc_msgSend(objc_alloc((Class)VMVoicemailCapabilities), "initWithTranscriptionEnabled:", +[VMTranscriptionService isTranscriptionAvailable](VMTranscriptionService, "isTranscriptionAvailable"));
  return v2;
}

- (void)_sendCapabilities
{
  if (BYTE1(self->procName.__r_.var0))
  {
    id v4 = [(VMVoicemailServiceController *)self clientConnectionWithErrorHandler:&stru_1000C16D0];
    v3 = [(VMVoicemailServiceController *)self capabilities];
    [v4 setCapabilities:v3];
  }
}

- (void)_handleVoicemailStorageUsageChanged:(id)a3
{
  id v4 = a3;
  if (BYTE1(self->procName.__r_.var0))
  {
    objc_super v5 = vm_vmd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v4 userInfo];
      int v13 = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daemon heard about storage usage changing _handleVoicemailStorageUsageChanged: %@. %@", (uint8_t *)&v13, 0x16u);
    }
    if (v4)
    {
      v7 = [v4 userInfo];
      BOOL v8 = v7 == 0;

      if (!v8)
      {
        v9 = [v4 userInfo];
        v10 = [v9 valueForKey:@"MailboxUsage"];

        if (v10)
        {
          v11 = [(VMVoicemailServiceController *)self connection];
          v12 = [v11 remoteObjectProxyWithErrorHandler:&stru_1000C16F0];
          objc_msgSend(v12, "setStorageUsage:", objc_msgSend(v10, "unsignedIntegerValue"));
        }
      }
    }
  }
}

- (void)_handleVoicemailStoreSaved
{
  if (LOBYTE(self->procName.__r_.var0))
  {
    id v5 = [(VMVoicemailServiceController *)self connection];
    v3 = [v5 remoteObjectProxyWithErrorHandler:&stru_1000C1710];
    id v4 = [(VMVoicemailServiceController *)self allVoicemails];
    [v3 voicemailsUpdated:v4];
  }
}

- (void)_handleSubscriptionStatusChanged:(id)a3
{
  id v7 = a3;
  if (BYTE1(self->procName.__r_.var0))
  {
    id v4 = [(VMVoicemailServiceController *)self connection];
    id v5 = [v4 remoteObjectProxyWithErrorHandler:&stru_1000C1730];
    v6 = [(VMVoicemailServiceController *)self carrierServicesController];
    objc_msgSend(v5, "setSubscribed:", objc_msgSend(v6, "isSubscribed"));
  }
  [(VMVoicemailServiceController *)self _sendCapabilities];
}

- (void)_handleCheckSubscriptionStatus:(id)a3
{
  if (BYTE1(self->procName.__r_.var0))
  {
    id v4 = vm_vmd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10007FDFC(v4);
    }

    id v5 = [(VMVoicemailServiceController *)self connection];
    v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_1000C1750];
    id v7 = [(VMVoicemailServiceController *)self carrierServicesController];
    objc_msgSend(v6, "setSubscribed:", objc_msgSend(v7, "isSubscribed"));
  }
}

- (void)_handleOnlineStatusChanged:(id)a3
{
  if (BYTE1(self->procName.__r_.var0))
  {
    id v6 = [(VMVoicemailServiceController *)self connection];
    id v4 = [v6 remoteObjectProxyWithErrorHandler:&stru_1000C1770];
    id v5 = [(VMVoicemailServiceController *)self carrierServicesController];
    objc_msgSend(v4, "setOnline:", objc_msgSend(v5, "isOnline"));
  }
}

- (void)_handleTranscribingStatusChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"kVMVoicemailTranscriptionInProgress"];

  id v6 = vm_vmd_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(VMVoicemailServiceController *)self connection];
    int v15 = 138412546;
    id v16 = v7;
    __int16 v17 = 1024;
    unsigned int v18 = [v5 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating client with connection: %@ about transcribing changed to: %d", (uint8_t *)&v15, 0x12u);
  }
  if (([v5 BOOLValue] & 1) == 0)
  {
    BOOL v8 = [(VMVoicemailServiceController *)self reportTranscriptionProgressReplyBlock];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      v10 = vm_vmd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(VMVoicemailServiceController *)self connection];
        int v15 = 138412290;
        id v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Executing reply block for connection %@", (uint8_t *)&v15, 0xCu);
      }
      v12 = [(VMVoicemailServiceController *)self reportTranscriptionProgressReplyBlock];
      v12[2](v12, 1);

      [(VMVoicemailServiceController *)self setReportTranscriptionProgressReplyBlock:0];
    }
    [(VMVoicemailServiceController *)self setProgress:0];
  }
  if (BYTE1(self->procName.__r_.var0))
  {
    int v13 = [(VMVoicemailServiceController *)self connection];
    id v14 = [v13 remoteObjectProxyWithErrorHandler:&stru_1000C1790];
    objc_msgSend(v14, "setTranscribing:", objc_msgSend(v5, "BOOLValue"));
  }
}

- (void)_handleSyncStatusChangedNotification:(id)a3
{
  if (BYTE1(self->procName.__r_.var0))
  {
    id v6 = [(VMVoicemailServiceController *)self connection];
    id v4 = [v6 remoteObjectProxyWithErrorHandler:&stru_1000C17B0];
    id v5 = [(VMVoicemailServiceController *)self carrierServicesController];
    objc_msgSend(v4, "setSyncInProgress:", objc_msgSend(v5, "isSyncInProgress"));
  }
}

- (void)ping:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VMVoicemailServiceController *)self connection];
    int v7 = 138412290;
    BOOL v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got pinged by client: %@", (uint8_t *)&v7, 0xCu);
  }
  v4[2](v4, 1);
}

- (void)requestInitialState:(id)a3
{
  id v4 = (void (**)(id, void *, id, id, id, id))a3;
  BYTE1(self->procName.__r_.var0) = 1;
  id v14 = v4;
  if (v4)
  {
    id v5 = [(VMVoicemailServiceController *)self capabilities];
    id v6 = [(VMVoicemailServiceController *)self carrierServicesController];
    id v7 = [v6 isSubscribed];
    BOOL v8 = [(VMVoicemailServiceController *)self carrierServicesController];
    id v9 = [v8 isOnline];
    v10 = [(VMVoicemailServiceController *)self carrierServicesController];
    id v11 = [v10 isSyncInProgress];
    v12 = [(VMVoicemailServiceController *)self transcriptionService];
    int v13 = [v12 transcriptionController];
    v14[2](v14, v5, v7, v9, v11, objc_msgSend(v13, "cache_isTranscribing"));
  }
}

- (id)requestTranscriptionProgress:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = vm_vmd_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(VMVoicemailServiceController *)self connection];
    id v7 = [(VMVoicemailServiceController *)self progress];
    *(_DWORD *)buf = 138412802;
    id v28 = v6;
    __int16 v29 = 2112;
    v30 = self;
    __int16 v31 = 2112;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client %@ requested %@ for transcriptionProgress %@", buf, 0x20u);
  }
  BOOL v8 = [(VMVoicemailServiceController *)self reportTranscriptionProgressReplyBlock];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [(VMVoicemailServiceController *)self connection];
      sub_100080048(v11, v26, v10);
    }

    v12 = [(VMVoicemailServiceController *)self reportTranscriptionProgressReplyBlock];
    v12[2](v12, 0);

    [(VMVoicemailServiceController *)self setReportTranscriptionProgressReplyBlock:0];
  }
  [(VMVoicemailServiceController *)self setProgress:0];
  int v13 = [(VMVoicemailServiceController *)self transcriptionService];
  id v14 = [v13 transcriptionController];
  unsigned int v15 = [v14 isTranscribing];

  if (v15)
  {
    id v16 = [(VMVoicemailServiceController *)self transcriptionService];
    __int16 v17 = [v16 transcriptionController];
    unsigned int v18 = [v17 transcriptionProgress];
    id v19 = +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", [v18 totalUnitCount]);
    [(VMVoicemailServiceController *)self setProgress:v19];

    id v20 = vm_vmd_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(VMVoicemailServiceController *)self connection];
      *(_DWORD *)buf = 138412290;
      id v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Saving reply block for connection %@", buf, 0xCu);
    }
    [(VMVoicemailServiceController *)self setReportTranscriptionProgressReplyBlock:v4];
  }
  else
  {
    v22 = vm_vmd_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = [(VMVoicemailServiceController *)self connection];
      sub_10007FFE0(v23, (uint64_t)self, buf, v22);
    }

    v4[2](v4, 0);
  }
  v24 = [(VMVoicemailServiceController *)self progress];

  return v24;
}

- (void)synchronize
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Synchronize requested from client", v5, 2u);
  }

  id v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  [v4 synchronize];
}

- (void)retrieveDataForIdentifier:(int64_t)a3
{
  uint64_t v4 = VMStoreCopyRecordWithIdentifier();
  if (v4)
  {
    id v5 = (const void *)v4;
    id v6 = [(VMVoicemailServiceController *)self carrierServicesController];
    [v6 retrieveDataForRecord:v5];

    CFRelease(v5);
  }
}

- (id)allVoicemails
{
  v3 = [(VMVoicemailServiceController *)self telephonyClient];
  uint64_t v4 = [v3 subscriptions];

  id v5 = [(VMVoicemailServiceController *)self telephonyClient];
  id v6 = [v5 getIsoContryCodes];

  v21 = (void *)VMStoreCopyOfAllRecordsWithFlags(0, 0, 0);
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v21 count]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v21;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = +[VMVoicemail messageForRecord:*(void *)(*((void *)&v26 + 1) + 8 * i) forContexts:v4 andIsoCodes:v6];
        int v13 = v12;
        if (v12
          && [v12 isDataAvailable]
          && ([v13 isDeleted] & 1) == 0
          && ([v13 isTemporary] & 1) == 0)
        {
          [v7 addObject:v13];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  id v14 = [v7 sortedArrayUsingComparator:&stru_1000C17F0];
  unsigned int v15 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v14 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v16);
        }
        [v15 addObject:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)];
      }
      id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  return v15;
}

- (void)allVoicemails:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  LOBYTE(self->procName.__r_.var0) = 1;
  id v6 = v4;
  if (v4)
  {
    id v5 = [(VMVoicemailServiceController *)self allVoicemails];
    v6[2](v6, v5);
  }
}

- (void)setTrashedForIdentifiers:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  [v4 moveRecordsWithIdentifiersToTrash:v5];
}

- (void)removeVoicemailFromTrashWithIdentifier:(int64_t)a3
{
  uint64_t v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 moveRecordsWithIdentifiersToInbox:v6];
}

- (void)setDeletedForIdentifier:(int64_t)a3
{
  uint64_t v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 moveRecordsWithIdentifiersToDeleted:v6];
}

- (void)setDeletedForIdentifiers:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  [v4 moveRecordsWithIdentifiersToDeleted:v5];
}

- (void)setReadForIdentifier:(int64_t)a3
{
  uint64_t v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v4 markRecordsWithIdentifiersAsRead:v6];
}

- (void)setReadForIdentifiers:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  [v4 markRecordsWithIdentifiersAsRead:v5];
}

- (void)remapAccount:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = vm_vmd_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "VMVoicemailServiceController: remapAccount %@ %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(VMVoicemailServiceController *)self carrierServicesController];
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
  [v9 remapAccount:v10 toAccount:v11];
}

- (void)resetNetworkSettings
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "resetNetworkSettings", v5, 2u);
  }

  uint64_t v4 = [(VMVoicemailServiceController *)self carrierServicesController];
  [v4 resetNetworkSettings];
}

- (void)reportTranscriptionProblemForIdentifier:(int64_t)a3
{
  uint64_t v4 = VMStoreCopyRecordWithIdentifier();
  if (v4)
  {
    id v5 = (const void *)v4;
    id v6 = [(VMVoicemailServiceController *)self carrierServicesController];
    [v6 reportTranscriptionProblemForRecord:v5];

    CFRelease(v5);
  }
}

- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forIdentifier:(int64_t)a4
{
  BOOL v4 = a3;
  uint64_t v6 = VMStoreCopyRecordWithIdentifier();
  if (v6)
  {
    id v7 = (const void *)v6;
    id v8 = [(VMVoicemailServiceController *)self carrierServicesController];
    [v8 reportTranscriptionRatedAccurate:v4 forRecord:v7];

    CFRelease(v7);
  }
}

- (void)obliterate
{
  id v2 = vm_vmd_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting (obliterate) VVM...", buf, 2u);
  }

  v3 = +[NSFileManager defaultManager];
  id v7 = 0;
  unsigned int v4 = [v3 removeItemAtPath:@"/var/mobile/Library/Voicemail" error:&v7];
  id v5 = v7;

  if (v4)
  {
    notify_post((const char *)[kVVReloadServiceNotification UTF8String]);
  }
  else
  {
    uint64_t v6 = vm_vmd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000800A0((uint64_t)v5, v6);
    }
  }
}

- (void)insertVoicemail:(id)a3
{
  id v4 = a3;
  id v5 = [(VMVoicemailServiceController *)self telephonyClient];
  uint64_t v6 = [v4 receiverDestinationID];
  uint64_t v7 = [v5 subscriptionContextWithPhoneNumber:v6];

  v53 = (void *)v7;
  if (!v7)
  {
    id v8 = [(VMVoicemailServiceController *)self telephonyClient];
    uint64_t v9 = [v8 userDefaultVoiceSubscriptionContext];

    v53 = (void *)v9;
    if (!v9)
    {
      id v10 = [(VMVoicemailServiceController *)self telephonyClient];
      id v11 = [v10 subscriptions];
      v53 = [v11 firstObject];
    }
  }
  id v12 = objc_alloc((Class)NSUUID);
  id v13 = [v53 labelID];
  id v52 = [v12 initWithUUIDString:v13];

  v51 = [v53 phoneNumber];
  __int16 v14 = [v4 date];
  [v14 timeIntervalSince1970];
  uint64_t v16 = v15;
  id v17 = [v4 senderDestinationID];
  v50 = +[NSString stringWithFormat:@"%f_%@", v16, v17];

  id v18 = [v4 remoteUID];
  id v19 = [v4 date];
  [v19 timeIntervalSince1970];
  double v21 = v20;
  long long v22 = [v4 senderDestinationID];
  long long v23 = [v4 callbackDestinationID];
  [v4 duration];
  long long v25 = (const void *)VMStoreCreateAndAddRecord((uint64_t)v18, (int)v21, v50, (uint64_t)v22, (uint64_t)v23, (int)v24, 0, 0, (uint64_t)v51, v52);

  VMStoreSave();
  long long v26 = (__CFString *)VMStoreRecordCopyDescription((uint64_t)v25);
  long long v27 = [v4 dataURL];
  long long v28 = [v27 path];

  v49 = (void *)VMStoreRecordCopyDataPath();
  long long v29 = +[NSFileManager defaultManager];
  LODWORD(v12) = [v29 fileExistsAtPath:v28];

  if (v12)
  {
    v30 = +[NSFileManager defaultManager];
    id v55 = 0;
    unsigned int v31 = [v30 copyItemAtPath:v28 toPath:v49 error:&v55];
    id v32 = v55;

    if (v31)
    {
      VMStoreRecordSetFlag(v52, v25, 2u);
    }
    else
    {
      v35 = vm_vmd_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1000801FC();
      }
    }
  }
  else
  {
    v33 = vm_vmd_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100080264();
    }

    int Flags = VMStoreRecordGetFlags((uint64_t)v25);
    VMStoreRecordSetFlags(v52, v25, Flags & 0xFFFFFFFD);
  }
  v36 = [v4 transcriptionURL];
  v37 = [v36 path];

  v38 = (void *)VMStoreRecordCopyTranscriptionPath();
  v39 = +[NSFileManager defaultManager];
  unsigned int v40 = [v39 fileExistsAtPath:v37];

  if (v40)
  {
    id v41 = +[NSFileManager defaultManager];
    id v54 = 0;
    unsigned int v42 = [v41 copyItemAtPath:v37 toPath:v38 error:&v54];
    id v43 = v54;

    if (v42)
    {
      VMStoreRecordSetFlag(v52, v25, 0x100u);
    }
    else
    {
      v46 = vm_vmd_log();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10008012C();
      }
    }
  }
  else
  {
    uint64_t v44 = vm_vmd_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100080194();
    }

    int v45 = VMStoreRecordGetFlags((uint64_t)v25);
    VMStoreRecordSetFlags(v52, v25, v45 & 0xFFFE6DFF | 0x1000);
  }
  v47 = (__CFString *)VMStoreRecordCopyDescription((uint64_t)v25);

  v48 = vm_vmd_log();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v47;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Created record %@", buf, 0xCu);
  }

  VMStoreSave();
  if (v25) {
    VMStoreRecordRelease(v25);
  }
}

- (void)accounts:(id)a3
{
  uint64_t v6 = (void (**)(id, void *))a3;
  id v4 = [(VMVoicemailServiceController *)self accountManager];
  id v5 = [v4 accounts];
  v6[2](v6, v5);
}

- (void)isAccountSubscribed:(id)a3 reply:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self accountManager];
  v6[2](v6, [v7 isAccountSubscribed:v8]);
}

- (void)isAccountOnline:(id)a3 reply:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self accountManager];
  v6[2](v6, [v7 isAccountOnline:v8]);
}

- (void)isCallVoicemailSupportedForAccountUUID:(id)a3 reply:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self accountManager];
  v6[2](v6, [v7 isCallVoicemailSupportedForAccountUUID:v8]);
}

- (void)isPasscodeChangeSupportedForAccountUUID:(id)a3 reply:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self accountManager];
  v6[2](v6, [v7 isPasscodeChangeSupportedForAccountUUID:v8]);
}

- (void)minimumPasscodeLengthForAccountUUID:(id)a3 reply:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self accountManager];
  v6[2](v6, [v7 minimumPasscodeLengthForAccountUUID:v8]);
}

- (void)maximumPasscodeLengthForAccountUUID:(id)a3 reply:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self accountManager];
  v6[2](v6, [v7 maximumPasscodeLengthForAccountUUID:v8]);
}

- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(VMVoicemailServiceController *)self accountManager];
  [v10 setPasscode:v11 forAccountUUID:v8 completion:v9];
}

- (void)accountsDidChangeForAccountManager:(id)a3
{
  id v8 = a3;
  id v4 = [(VMVoicemailServiceController *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(VMVoicemailServiceController *)self connection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_1000C1810];
  uint64_t v7 = [v8 accounts];
  [v6 updateAccounts:v7];
}

- (void)greetingForAccountUUID:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self greetingManager];
  [v7 greetingForAccountUUID:v8 completion:v6];
}

- (void)isGreetingChangeSupportedForAccountUUID:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, id))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self greetingManager];
  v6[2](v6, [v7 isGreetingChangeSupportedForAccountUUID:v8]);
}

- (void)maximumGreetingDurationForAccountUUID:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [(VMVoicemailServiceController *)self greetingManager];
  [v7 maximumGreetingDurationForAccountUUID:v8];
  v6[2](v6);
}

- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(VMVoicemailServiceController *)self greetingManager];
  [v10 setGreeting:v11 forAccountUUID:v8 completion:v9];
}

- (void)greetingManager:(id)a3 greetingWillChangeForAccountUUID:(id)a4
{
  id v4 = [(VMVoicemailServiceController *)self queue];
  dispatch_assert_queue_V2(v4);
}

- (void)greetingManager:(id)a3 greetingDidChangeForAccountUUID:(id)a4
{
  id v4 = [(VMVoicemailServiceController *)self queue];
  dispatch_assert_queue_V2(v4);
}

- (void)greetingChangedByCarrier:(id)a3
{
  id v7 = a3;
  id v4 = [(VMVoicemailServiceController *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(VMVoicemailServiceController *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_1000C1830];
  [v6 greetingChangedByCarrier:v7];
}

- (void)messageCountForMailboxType:(int64_t)a3 reply:(id)a4
{
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v5 = sub_100016F98(a3);
  uint64_t RecordCountWithMailboxType = VMStoreGetRecordCountWithMailboxType(v5, 0);
  v7[2](v7, RecordCountWithMailboxType);
}

- (void)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  uint64_t v7 = sub_100016F98(a3);
  id v8 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!v5) {
    id v8 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  uint64_t RecordCountWithMailboxType = VMStoreGetRecordCountWithMailboxType(v7, *v8);
  v10[2](v10, RecordCountWithMailboxType);
}

- (void)messagesForMailboxType:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5 reply:(id)a6
{
  int v6 = a5;
  int v7 = a4;
  id v10 = (void (**)(id, id))a6;
  id v11 = +[NSMutableArray array];
  uint64_t v12 = sub_100016F98(a3);
  id v13 = [(VMVoicemailServiceController *)self telephonyClient];
  __int16 v14 = [v13 subscriptions];

  uint64_t v15 = [(VMVoicemailServiceController *)self telephonyClient];
  uint64_t v16 = [v15 getIsoContryCodes];

  id v17 = (void *)VMStoreCopyRecordsWithMailboxType(v12, 0, v7, v6);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000DC1C;
  v21[3] = &unk_1000C1858;
  id v18 = v14;
  id v22 = v18;
  id v19 = v16;
  id v23 = v19;
  id v20 = v11;
  id v24 = v20;
  [v17 enumerateObjectsUsingBlock:v21];
  v10[2](v10, v20);
}

- (void)messagesForMailboxType:(int64_t)a3 read:(BOOL)a4 limit:(int64_t)a5 offset:(int64_t)a6 reply:(id)a7
{
  int v7 = a6;
  int v8 = a5;
  BOOL v9 = a4;
  uint64_t v12 = (void (**)(id, id))a7;
  id v13 = +[NSMutableArray array];
  uint64_t v14 = sub_100016F98(a3);
  uint64_t v15 = [(VMVoicemailServiceController *)self telephonyClient];
  uint64_t v16 = [v15 subscriptions];

  id v17 = [(VMVoicemailServiceController *)self telephonyClient];
  id v18 = [v17 getIsoContryCodes];

  id v19 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!v9) {
    id v19 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  id v20 = (void *)VMStoreCopyRecordsWithMailboxType(v14, *v19, v8, v7);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000DEB4;
  v24[3] = &unk_1000C1858;
  id v21 = v16;
  id v25 = v21;
  id v22 = v18;
  id v26 = v22;
  id v23 = v13;
  id v27 = v23;
  [v20 enumerateObjectsUsingBlock:v24];
  v12[2](v12, v23);
}

- (void)transcriptionController:(id)a3 transcriptionProgressFractionCompletedChanged:(double)a4
{
  id v8 = [(VMVoicemailServiceController *)self progress];
  id v6 = [v8 totalUnitCount];
  int v7 = [(VMVoicemailServiceController *)self progress];
  [v7 setCompletedUnitCount:(uint64_t)((double)(uint64_t)v6 * a4)];
}

- (void)transcriptionController:(id)a3 transcriptionProgressTotalUnitCountChanged:(int64_t)a4
{
  id v5 = [(VMVoicemailServiceController *)self progress];
  [v5 setTotalUnitCount:a4];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v5)
  {
    [v9 invoke];
  }
  else
  {
    id v11 = [v9 invocationDescription];
    uint64_t v12 = sub_100009E74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      p_procName = &self->procName;
      if (*((char *)&self->procName.__r_.__value_.var0.__l + 23) < 0) {
        p_procName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_procName->__r_.__value_.var0.__l.__data_;
      }
      int procPid = self->procPid;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = p_procName;
      __int16 v26 = 1024;
      int v27 = procPid;
      __int16 v28 = 2048;
      id v29 = v8;
      __int16 v30 = 2112;
      unsigned int v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client [%s:%d] (conn=%p) invoking %@", buf, 0x26u);
    }

    uint64_t v15 = [(VMVoicemailServiceController *)self connection];
    uint64_t v16 = [v15 exportedInterface];
    id v17 = objc_msgSend(v16, "replyBlockSignatureForSelector:", objc_msgSend(v10, "selector"));

    if (v17)
    {
      id v18 = [v10 getBlockArgumentIndex];
      *(void *)buf = 0;
      [v10 getArgument:buf atIndex:v18];
      id v19 = NSStringFromSelector((SEL)[v10 selector]);
      id v20 = [*(id *)buf copy];
      id v21 = v17;
      [v21 UTF8String];
      id v22 = v19;
      id v23 = v20;
      id v24 = (id)__NSMakeSpecialForwardingCaptureBlock();
      objc_msgSend(v10, "setArgument:atIndex:", &v24, v18, _NSConcreteStackBlock, 3221225472, sub_10000E388, &unk_1000C1880);
      [v10 invoke];
    }
    else
    {
      [v10 invoke];
    }
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)self->procName.var0;
}

- (OS_dispatch_queue)queue
{
  return *(OS_dispatch_queue **)&self->fMailsSyncRequested;
}

- (VMDAccountManager)accountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (VMDAccountManager *)WeakRetained;
}

- (void)setAccountManager:(id)a3
{
}

- (VMDGreetingManager)greetingManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  return (VMDGreetingManager *)WeakRetained;
}

- (void)setGreetingManager:(id)a3
{
}

- (VMCarrierServicesController)carrierServicesController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);
  return (VMCarrierServicesController *)WeakRetained;
}

- (void)setCarrierServicesController:(id)a3
{
}

- (VMTranscriptionService)transcriptionService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_greetingManager);
  return (VMTranscriptionService *)WeakRetained;
}

- (void)setTranscriptionService:(id)a3
{
}

- (VMTelephonyClient)telephonyClient
{
  return (VMTelephonyClient *)self->_carrierServicesController;
}

- (void)setTelephonyClient:(id)a3
{
}

- (id)changePasswordReplyBlock
{
  return self->_transcriptionService;
}

- (void)setChangePasswordReplyBlock:(id)a3
{
}

- (id)reportTranscriptionProgressReplyBlock
{
  return self->_telephonyClient;
}

- (void)setReportTranscriptionProgressReplyBlock:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)self->_changePasswordReplyBlock;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changePasswordReplyBlock, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_transcriptionService, 0);
  objc_storeStrong((id *)&self->_carrierServicesController, 0);
  objc_destroyWeak((id *)&self->_greetingManager);
  objc_destroyWeak((id *)&self->_accountManager);
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->fMailsSyncRequested, 0);
  objc_storeStrong((id *)&self->procName.var0, 0);
  if (*((char *)&self->procName.__r_.__value_.var0.__l + 23) < 0)
  {
    data = self->procName.__r_.__value_.var0.__l.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0uLL;
  *((void *)self + 4) = 0;
  return self;
}

@end