@interface NTKDSyncController
+ (id)sharedInstance;
+ (void)cleanupOrphanedSyncDirectoriesWithCurrentDeviceUUIDs:(id)a3;
- (BOOL)_queue_applyDeltaMessageList:(id)a3 collectionStore:(id)a4 complicationStores:(id)a5;
- (BOOL)_queue_applyResetMessageList:(id)a3 collectionStore:(id)a4 complicationStores:(id)a5;
- (BOOL)companionSyncWrapperCanSendData;
- (BOOL)incomingSyncSessionApplyMessage:(id)a3;
- (BOOL)incomingSyncSessionResetDataStoreWithError:(id *)a3;
- (BOOL)isSetup;
- (BOOL)shouldEnableSync;
- (BOOL)shouldEnableSyncPrintingLogs:(BOOL)a3;
- (NTKDSyncController)init;
- (NTKPigmentSyncProvider)pigmentSyncProvider;
- (NTKPigmentSyncReceiver)pigmentSyncReceiver;
- (id)_queue_checkoutComplicationStoresForDeviceUUID:(id)a3;
- (id)_queue_checkoutLibraryStoreForDeviceUUID:(id)a3;
- (id)_queue_complicationStoreStatusForDeviceUUID:(id)a3 identifier:(id)a4;
- (id)_queue_complicationStoreStatusesForDeviceUUID:(id)a3 withIdentifiers:(id)a4;
- (id)_queue_incomingMessageListForDeviceUUID:(id)a3;
- (id)_queue_outgoingMessageListForDeviceUUID:(id)a3;
- (id)_queue_storeStatusForDeviceUUID:(id)a3;
- (id)companionSyncWrapperDidRequestActivePairedSyncSession;
- (id)outgoingSyncSessionGetNextMessage;
- (int64_t)incomingSessionTransactionCount;
- (int64_t)outgoingSessionTransactionCount;
- (void)_onQueue_async:(id)a3;
- (void)_queue_addPayloadToMessage:(id)a3 withFaceStore:(id)a4 complicationStores:(id)a5;
- (void)_queue_applyIncomingMessageList:(id)a3 collectionStore:(id)a4 complicationStores:(id)a5 storeStatus:(id)a6;
- (void)_queue_applyIncomingMessageLists;
- (void)_queue_beginGuardingOutgoingSessionRequest;
- (void)_queue_endGuardingOutgoingSessionRequest;
- (void)_queue_executeIfSyncQueuesAreEmpty:(id)a3;
- (void)_queue_requestSyncIfNecessary;
- (void)_queue_requestSyncIfNecessaryAndForceDeltaRequestOtherwise:(BOOL)a3;
- (void)collectionStore:(id)a3 didAddFace:(id)a4 forUUID:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 didRemoveFaceOfStyle:(int64_t)a4 forUUID:(id)a5 seqId:(id)a6 acknowledge:(id)a7;
- (void)collectionStore:(id)a3 didSuppressNotificationForSeqId:(id)a4;
- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withConfiguration:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withResourceDirectory:(id)a5 seqId:(id)a6 acknowledge:(id)a7;
- (void)collectionStore:(id)a3 didUpdateOrderedUUIDs:(id)a4 seqId:(id)a5;
- (void)collectionStore:(id)a3 didUpdateSelectedUUID:(id)a4 seqId:(id)a5;
- (void)collectionStore:(id)a3 didUpgradeFace:(id)a4 forUUID:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 loadOrderedUUIDs:(id)a4 selectedUUID:(id)a5 facesByUUID:(id)a6 seqId:(id)a7 acknowledge:(id)a8;
- (void)collectionStoreHasBeenCreated:(id)a3;
- (void)collectionStoreWillBePurged:(id)a3;
- (void)complicationCollectionStoreHasBeenCreated:(id)a3;
- (void)complicationCollectionStoreWillBePurged:(id)a3;
- (void)complicationStore:(id)a3 didRemoveComplicationSampleTemplatesForClientIdentifier:(id)a4 descriptor:(id)a5 seqId:(id)a6;
- (void)complicationStore:(id)a3 didSuppressNotificationForSeqId:(id)a4;
- (void)complicationStore:(id)a3 didUpdateComplicationDescriptors:(id)a4 forClientIdentifier:(id)a5 seqId:(id)a6;
- (void)complicationStore:(id)a3 didUpdateSampleTemplateReference:(id)a4 forClientIdentifier:(id)a5 descriptor:(id)a6 family:(int64_t)a7 seqId:(id)a8;
- (void)complicationStore:(id)a3 loadFullCollectionWithLocalizableSampleTemplates:(id)a4 complicationDescriptors:(id)a5 seqId:(id)a6;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)ensureSyncIsActive:(id)a3;
- (void)handleActiveDeviceChangedNotification;
- (void)handleDeviceTinkerStateChangedNotification;
- (void)incomingLibraryValidationMessage:(id)a3;
- (void)incomingSyncSessionDidEnd:(BOOL)a3 withError:(id)a4;
- (void)incomingSyncSessionDidStart:(BOOL)a3;
- (void)outgoingSyncSessionDidEnd:(BOOL)a3 withError:(id)a4;
- (void)outgoingSyncSessionDidStart:(BOOL)a3;
- (void)requestResetSyncForComplicationStore:(id)a3;
- (void)setIncomingSessionTransactionCount:(int64_t)a3;
- (void)setOutgoingSessionTransactionCount:(int64_t)a3;
- (void)setPigmentSyncProvider:(id)a3;
- (void)setPigmentSyncReceiver:(id)a3;
- (void)setUp;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncProviderDidRequiresDeltaSync:(id)a3;
- (void)tearDown;
@end

@implementation NTKDSyncController

+ (id)sharedInstance
{
  if (qword_100072460 != -1) {
    dispatch_once(&qword_100072460, &stru_1000622B8);
  }
  v2 = (void *)qword_100072458;
  return v2;
}

+ (void)cleanupOrphanedSyncDirectoriesWithCurrentDeviceUUIDs:(id)a3
{
  id v3 = a3;
  v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up orphaned sync directories...", buf, 2u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  sub_100036A44();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v24;
    *(void *)&long long v6 = 138412290;
    long long v21 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v10, v21) & 1) == 0)
        {
          v11 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v28 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "...deleting sync data for device uuid %@", buf, 0xCu);
          }

          id v12 = v10;
          v13 = [_MessageList alloc];
          v14 = sub_10003DDA8(v12);
          v15 = [(_MessageList *)v13 initWithPersistencePath:v14];

          v16 = [_MessageList alloc];
          v17 = sub_10003DC7C(v12);
          v18 = [(_MessageList *)v16 initWithPersistencePath:v17];

          [(_MessageList *)v15 clearAllMessages];
          [(_MessageList *)v18 clearAllMessages];
          v19 = +[NSFileManager defaultManager];
          v20 = sub_1000426BC(v12);

          [v19 removeItemAtPath:v20 error:0];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }
}

- (NTKDSyncController)init
{
  v12.receiver = self;
  v12.super_class = (Class)NTKDSyncController;
  v2 = [(NTKDSyncController *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ntkd.synccontroller", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[CLKDevice currentDevice];
    device = v2->_device;
    v2->_device = (CLKDevice *)v5;

    uint64_t v7 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.clockface"];
    syncCoordinator = v2->_syncCoordinator;
    v2->_syncCoordinator = (PSYSyncCoordinator *)v7;

    [(PSYSyncCoordinator *)v2->_syncCoordinator setDelegate:v2];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100036CD0;
    v10[3] = &unk_100060A90;
    v11 = v2;
    [(NTKDSyncController *)v11 _onQueue_async:v10];
  }
  return v2;
}

- (BOOL)shouldEnableSync
{
  return [(NTKDSyncController *)self shouldEnableSyncPrintingLogs:0];
}

- (BOOL)shouldEnableSyncPrintingLogs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CLKDevice *)self->_device nrDevice];
  unsigned int v6 = [(CLKDevice *)self->_device supportsCompanionSync];
  unsigned int v7 = v6;
  if (v5) {
    unsigned int v8 = v6;
  }
  else {
    unsigned int v8 = 0;
  }
  unsigned int v9 = [(CLKDevice *)self->_device isTinker];
  int v10 = v8 & (v9 ^ 1);
  if (v3)
  {
    unsigned int v11 = v9;
    objc_super v12 = [(CLKDevice *)self->_device nrDevice];
    v13 = +[CLKDevice CLKDeviceUUIDForNRDevice:v12];
    v14 = [v13 UUIDString];

    v15 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v10) {
        CFStringRef v16 = @"ENABLED";
      }
      else {
        CFStringRef v16 = @"DISABLED";
      }
      v17 = [(CLKDevice *)self->_device nrDevice];
      int v19 = 138544642;
      CFStringRef v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = v7;
      __int16 v27 = 2048;
      BOOL v28 = v17 != 0;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SYNC SHOULD BE %{public}@. isDemoMode: %lu, altdv: %lu, deviceSupportsCapability: %lu, has nrDevice: %lu, deviceUUID: %{public}@", (uint8_t *)&v19, 0x3Eu);
    }
  }

  return v10;
}

- (void)handleDeviceTinkerStateChangedNotification
{
  BOOL v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NTKDSyncController received NRPairedDeviceRegistryDeviceDidPairNotification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003706C;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)handleActiveDeviceChangedNotification
{
  BOOL v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NTKDSyncController received CLKActiveDeviceChangedNotification", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003719C;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setUp
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v3 = [(NTKDSyncController *)self isSetup];
  v4 = _NTKLoggingObjectForDomain();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requested to setup NTKDSyncController but it is already setup", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SYNC ENABLED. Setting up NTKDSyncController.", buf, 2u);
    }

    unsigned int v6 = [[NTKDCompanionSyncWrapper alloc] initAsPrimary:0];
    companionSyncWrapper = self->_companionSyncWrapper;
    self->_companionSyncWrapper = v6;

    v56 = self;
    [(NTKDCompanionSyncWrapper *)self->_companionSyncWrapper setDelegate:self];
    +[NSMutableDictionary dictionary];
    *(void *)&long long v63 = _NSConcreteStackBlock;
    *((void *)&v63 + 1) = 3221225472;
    *(void *)&long long v64 = sub_100042AF0;
    *((void *)&v64 + 1) = &unk_100062668;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    *(void *)&long long v65 = v8;
    unsigned int v9 = objc_retainBlock(&v63);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    int v10 = sub_100036A44();
    id v11 = [v10 countByEnumeratingWithState:&v69 objects:buf count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v70;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v70 != v13) {
            objc_enumerationMutation(v10);
          }
          (*((void (**)(_OWORD *, void))v9 + 2))(v9, *(void *)(*((void *)&v69 + 1) + 8 * i));
        }
        id v12 = [v10 countByEnumeratingWithState:&v69 objects:buf count:16];
      }
      while (v12);
    }

    (*((void (**)(_OWORD *, void))v9 + 2))(v9, 0);
    v15 = (NSMutableDictionary *)v8;

    outgoingMessageLists = v56->_outgoingMessageLists;
    v56->_outgoingMessageLists = v15;

    v17 = +[NSMutableDictionary dictionary];
    *(void *)&long long v63 = _NSConcreteStackBlock;
    *((void *)&v63 + 1) = 3221225472;
    *(void *)&long long v64 = sub_100042A28;
    *((void *)&v64 + 1) = &unk_100062668;
    id v18 = v17;
    *(void *)&long long v65 = v18;
    int v19 = objc_retainBlock(&v63);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    CFStringRef v20 = sub_100036A44();
    id v21 = [v20 countByEnumeratingWithState:&v69 objects:buf count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v70;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v70 != v23) {
            objc_enumerationMutation(v20);
          }
          (*((void (**)(_OWORD *, void))v19 + 2))(v19, *(void *)(*((void *)&v69 + 1) + 8 * (void)j));
        }
        id v22 = [v20 countByEnumeratingWithState:&v69 objects:buf count:16];
      }
      while (v22);
    }

    (*((void (**)(_OWORD *, void))v19 + 2))(v19, 0);
    __int16 v25 = (NSMutableDictionary *)v18;

    incomingMessageLists = v56->_incomingMessageLists;
    v56->_incomingMessageLists = v25;

    __int16 v27 = +[NSMutableDictionary dictionary];
    *(void *)&long long v63 = _NSConcreteStackBlock;
    *((void *)&v63 + 1) = 3221225472;
    *(void *)&long long v64 = sub_100042890;
    *((void *)&v64 + 1) = &unk_100062668;
    id v28 = v27;
    *(void *)&long long v65 = v28;
    __int16 v29 = objc_retainBlock(&v63);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v30 = sub_100036A44();
    id v31 = [v30 countByEnumeratingWithState:&v69 objects:buf count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v70;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v70 != v33) {
            objc_enumerationMutation(v30);
          }
          (*((void (**)(_OWORD *, void))v29 + 2))(v29, *(void *)(*((void *)&v69 + 1) + 8 * (void)k));
        }
        id v32 = [v30 countByEnumeratingWithState:&v69 objects:buf count:16];
      }
      while (v32);
    }

    (*((void (**)(_OWORD *, void))v29 + 2))(v29, 0);
    v35 = (NSMutableDictionary *)v28;

    storeStatuses = v56->_storeStatuses;
    v56->_storeStatuses = v35;

    v37 = +[NSMutableDictionary dictionary];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100042958;
    v67[3] = &unk_100062690;
    id v55 = v37;
    id v68 = v55;
    v38 = objc_retainBlock(v67);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    sub_10003DA70();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v39 = [obj countByEnumeratingWithState:&v63 objects:buf count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v64;
      do
      {
        for (m = 0; m != v40; m = (char *)m + 1)
        {
          if (*(void *)v64 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = *(void *)(*((void *)&v63 + 1) + 8 * (void)m);
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          v44 = sub_100036A44();
          id v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, &v69, 16, v55);
          if (v45)
          {
            id v46 = v45;
            uint64_t v47 = *(void *)v60;
            do
            {
              for (n = 0; n != v46; n = (char *)n + 1)
              {
                if (*(void *)v60 != v47) {
                  objc_enumerationMutation(v44);
                }
                ((void (*)(void *, void, uint64_t))v38[2])(v38, *(void *)(*((void *)&v59 + 1) + 8 * (void)n), v43);
              }
              id v46 = [v44 countByEnumeratingWithState:&v59 objects:&v69 count:16];
            }
            while (v46);
          }

          ((void (*)(void *, void, uint64_t))v38[2])(v38, 0, v43);
        }
        id v40 = [obj countByEnumeratingWithState:&v63 objects:buf count:16];
      }
      while (v40);
    }

    v49 = (NSMutableDictionary *)v55;
    complicationStoreStatuses = v56->_complicationStoreStatuses;
    v56->_complicationStoreStatuses = v49;

    v51 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    stores = v56->_stores;
    v56->_stores = v51;

    v53 = +[NTKDCollectionCoordinator sharedInstance];
    [v53 addCollectionLifecycleObserver:v56];

    v54 = +[NTKDComplicationStoreCoordinator sharedInstance];
    [v54 addComplicationCollectionLifecycleObserver:v56];

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100037974;
    v58[3] = &unk_100060A90;
    v58[4] = v56;
    [(NTKDSyncController *)v56 _onQueue_async:v58];
  }
}

- (BOOL)isSetup
{
  return self->_companionSyncWrapper != 0;
}

- (void)tearDown
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SYNC DISABLED. Tearing down NTKDSyncController.", buf, 2u);
  }

  v4 = [(PSYSyncCoordinator *)self->_syncCoordinator activeSyncSession];
  [v4 syncDidComplete];

  [(NTKDCompanionSyncWrapper *)self->_companionSyncWrapper suspend];
  [(NTKDCompanionSyncWrapper *)self->_companionSyncWrapper setDelegate:0];
  companionSyncWrapper = self->_companionSyncWrapper;
  self->_companionSyncWrapper = 0;

  outgoingMessageLists = self->_outgoingMessageLists;
  self->_outgoingMessageLists = 0;

  incomingMessageLists = self->_incomingMessageLists;
  self->_incomingMessageLists = 0;

  storeStatuses = self->_storeStatuses;
  self->_storeStatuses = 0;

  complicationStoreStatuses = self->_complicationStoreStatuses;
  self->_complicationStoreStatuses = 0;

  pigmentSyncReceiver = self->_pigmentSyncReceiver;
  self->_pigmentSyncReceiver = 0;

  pigmentSyncProvider = self->_pigmentSyncProvider;
  self->_pigmentSyncProvider = 0;

  id v12 = +[NTKDCollectionCoordinator sharedInstance];
  [v12 removeCollectionLifecycleObserver:self];

  uint64_t v13 = +[NTKDComplicationStoreCoordinator sharedInstance];
  [v13 removeComplicationCollectionLifecycleObserver:self];

  int64_t incomingSessionTransactionCount = self->_incomingSessionTransactionCount;
  if (incomingSessionTransactionCount >= 1)
  {
    do
    {
      self->_int64_t incomingSessionTransactionCount = incomingSessionTransactionCount - 1;
      sub_10000B870(@"com.apple.ntkd.synccontroller.incomingsession");
      int64_t incomingSessionTransactionCount = self->_incomingSessionTransactionCount;
    }
    while (incomingSessionTransactionCount > 0);
  }
  int64_t outgoingSessionTransactionCount = self->_outgoingSessionTransactionCount;
  if (outgoingSessionTransactionCount >= 1)
  {
    do
    {
      self->_int64_t outgoingSessionTransactionCount = outgoingSessionTransactionCount - 1;
      sub_10000B870(@"com.apple.ntkd.synccontroller.outgoingsession");
      int64_t outgoingSessionTransactionCount = self->_outgoingSessionTransactionCount;
    }
    while (outgoingSessionTransactionCount > 0);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100037BDC;
  v16[3] = &unk_100060A90;
  v16[4] = self;
  [(NTKDSyncController *)self _onQueue_async:v16];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ([v7 syncSessionType]) {
      unsigned int v9 = "QWS";
    }
    else {
      unsigned int v9 = "RESET";
    }
    int v10 = [v7 sessionIdentifier];
    *(_DWORD *)buf = 136315394;
    id v18 = v9;
    __int16 v19 = 2112;
    CFStringRef v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "enqueueing - starting paired sync %s session with ID = %@", buf, 0x16u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100037DFC;
  v13[3] = &unk_100060C58;
  id v14 = v7;
  v15 = self;
  id v16 = v6;
  id v11 = v6;
  id v12 = v7;
  [(NTKDSyncController *)self _onQueue_async:v13];
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v4 = a4;
  BOOL v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ([v4 syncSessionType]) {
      id v6 = "QWS";
    }
    else {
      id v6 = "RESET";
    }
    id v7 = [v4 sessionIdentifier];
    int v8 = 136315394;
    unsigned int v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "paired sync %s session was invalidated with ID = %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v4 = a3;
  BOOL v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PSYSyncCoordinator *)self->_syncCoordinator syncRestriction];
    id v7 = "in place";
    if (!v6) {
      id v7 = "lifted";
    }
    *(_DWORD *)buf = 136315138;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "enqueueing - paired sync restriction %s", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000381D4;
  v9[3] = &unk_100060AB8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NTKDSyncController *)self _onQueue_async:v9];
}

- (void)ensureSyncIsActive:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(PSYSyncCoordinator *)self->_syncCoordinator syncRestriction];
  id v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "in place";
    if (!v5) {
      id v7 = "lifted";
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "paired sync restriction %s", buf, 0xCu);
  }

  if (v5
    || ([(CLKDevice *)self->_device nrDevice],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v4[2](v4);
  }
  else
  {
    unsigned int v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100044B4C(v9);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100038420;
    v10[3] = &unk_100060AE0;
    void v10[4] = self;
    id v11 = v4;
    [(NTKDSyncController *)self _onQueue_async:v10];
  }
}

- (void)syncProviderDidRequiresDeltaSync:(id)a3
{
  id v4 = a3;
  if ([(NTKDSyncController *)self companionSyncWrapperCanSendData])
  {
    objc_initWeak(location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000385F0;
    v6[3] = &unk_100060A68;
    objc_copyWeak(&v7, location);
    [(NTKDSyncController *)self _onQueue_async:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
  else
  {
    id v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pigment data won't be synced at this moment, waiting for full sync session", (uint8_t *)location, 2u);
    }
  }
}

- (void)collectionStoreHasBeenCreated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 collectionIdentifier];
  unsigned int v6 = [v5 isEqualToString:NTKCollectionIdentifierLibraryFaces];

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000386FC;
    v7[3] = &unk_100060AB8;
    id v8 = v4;
    unsigned int v9 = self;
    [(NTKDSyncController *)self _onQueue_async:v7];
  }
}

- (void)collectionStoreWillBePurged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 collectionIdentifier];
  unsigned int v6 = [v5 isEqualToString:NTKCollectionIdentifierLibraryFaces];

  if (v6)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000388E4;
    v8[3] = &unk_100060AB8;
    id v9 = v4;
    id v10 = self;
    dispatch_sync(queue, v8);
  }
}

- (void)complicationCollectionStoreHasBeenCreated:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000389EC;
  v5[3] = &unk_100060AB8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(NTKDSyncController *)self _onQueue_async:v5];
}

- (void)complicationCollectionStoreWillBePurged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100038BF0;
  v7[3] = &unk_100060AB8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)collectionStore:(id)a3 loadOrderedUUIDs:(id)a4 selectedUUID:(id)a5 facesByUUID:(id)a6 seqId:(id)a7 acknowledge:(id)a8
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a8;
  id v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did full reload -- will request reset sync", buf, 0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100038DD8;
  v18[3] = &unk_100060B08;
  v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [(NTKDSyncController *)self _onQueue_async:v18];
}

- (void)collectionStore:(id)a3 didUpdateSelectedUUID:(id)a4 seqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did update selected uuid: %@", buf, 0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100038FE4;
  v14[3] = &unk_100060C58;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  [(NTKDSyncController *)self _onQueue_async:v14];
}

- (void)collectionStore:(id)a3 didUpdateOrderedUUIDs:(id)a4 seqId:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did update ordered uuids", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100039204;
  v12[3] = &unk_100060C58;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(NTKDSyncController *)self _onQueue_async:v12];
}

- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withConfiguration:(id)a5 seqId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did update face for uuid '%@' with configuration: %@", buf, 0x20u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100039470;
  v18[3] = &unk_1000610F0;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  [(NTKDSyncController *)self _onQueue_async:v18];
}

- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withResourceDirectory:(id)a5 seqId:(id)a6 acknowledge:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did update face for uuid '%@' with resource directory: %@", buf, 0x20u);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003970C;
  v22[3] = &unk_100060DB0;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v15;
  id v26 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  [(NTKDSyncController *)self _onQueue_async:v22];
}

- (void)collectionStore:(id)a3 didUpgradeFace:(id)a4 forUUID:(id)a5 seqId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did upgrade face for uuid '%@': %@", buf, 0x20u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003998C;
  v18[3] = &unk_1000610F0;
  v18[4] = self;
  id v19 = v10;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  [(NTKDSyncController *)self _onQueue_async:v18];
}

- (void)collectionStore:(id)a3 didAddFace:(id)a4 forUUID:(id)a5 seqId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did add face for uuid '%@': %@", buf, 0x20u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100039BFC;
  v18[3] = &unk_1000610F0;
  v18[4] = self;
  id v19 = v10;
  id v20 = v12;
  id v21 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  [(NTKDSyncController *)self _onQueue_async:v18];
}

- (void)collectionStore:(id)a3 didRemoveFaceOfStyle:(int64_t)a4 forUUID:(id)a5 seqId:(id)a6 acknowledge:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = NTKFaceStyleDescription();
    *(_DWORD *)buf = 138412802;
    id v27 = v13;
    __int16 v28 = 2112;
    __int16 v29 = v16;
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "collectionStore (seqId = %@) did remove face of style %@ for uuid '%@'", buf, 0x20u);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100039EC4;
  v21[3] = &unk_100060DB0;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  [(NTKDSyncController *)self _onQueue_async:v21];
}

- (void)collectionStore:(id)a3 didSuppressNotificationForSeqId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 collectionIdentifier];
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "collectionStore %@ seqId = %@", buf, 0x16u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A120;
  v12[3] = &unk_100060C58;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NTKDSyncController *)self _onQueue_async:v12];
}

- (void)complicationStore:(id)a3 loadFullCollectionWithLocalizableSampleTemplates:(id)a4 complicationDescriptors:(id)a5 seqId:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v8 collectionIdentifier];
    *(_DWORD *)buf = 138412290;
    id v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "complicationStore %@ did full reload -- will request reset sync", buf, 0xCu);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003A300;
  v14[3] = &unk_100060C58;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(NTKDSyncController *)self _onQueue_async:v14];
}

- (void)complicationStore:(id)a3 didUpdateSampleTemplateReference:(id)a4 forClientIdentifier:(id)a5 descriptor:(id)a6 family:(int64_t)a7 seqId:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  __int16 v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v13 collectionIdentifier];
    id v19 = CLKComplicationFamilyDescription();
    *(_DWORD *)buf = 138412802;
    id v31 = v18;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    id v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "complicationStore %@ did update template of family %@ for client '%@'", buf, 0x20u);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003A58C;
  v24[3] = &unk_100061C48;
  v24[4] = self;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  int64_t v29 = a7;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  [(NTKDSyncController *)self _onQueue_async:v24];
}

- (void)complicationStore:(id)a3 didUpdateComplicationDescriptors:(id)a4 forClientIdentifier:(id)a5 seqId:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v9 collectionIdentifier];
    *(_DWORD *)buf = 138412546;
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "complicationStore %@ did update complication descriptors for client '%@'", buf, 0x16u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003A85C;
  v17[3] = &unk_1000610F0;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  [(NTKDSyncController *)self _onQueue_async:v17];
}

- (void)complicationStore:(id)a3 didRemoveComplicationSampleTemplatesForClientIdentifier:(id)a4 descriptor:(id)a5 seqId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 collectionIdentifier];
    *(_DWORD *)buf = 138412546;
    id v26 = v15;
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "complicationStore %@ did remove complication for client '%@'", buf, 0x16u);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003AB28;
  v20[3] = &unk_100061190;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [(NTKDSyncController *)self _onQueue_async:v20];
}

- (void)complicationStore:(id)a3 didSuppressNotificationForSeqId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 collectionIdentifier];
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "complicationStore %@ seqId is now %@", buf, 0x16u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003ADAC;
  v12[3] = &unk_100060C58;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(NTKDSyncController *)self _onQueue_async:v12];
}

- (void)requestResetSyncForComplicationStore:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 collectionIdentifier];
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "complicationStore %@ requested reset sync", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003AF78;
  v8[3] = &unk_100060AB8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(NTKDSyncController *)self _onQueue_async:v8];
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  if ([a4 isEqualToString:NRDevicePropertySystemBuildVersion])
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NRDevicePropertySystemBuildVersion did change. enqueuing sync request", buf, 2u);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003B0E4;
    v7[3] = &unk_100060A90;
    void v7[4] = self;
    [(NTKDSyncController *)self _onQueue_async:v7];
  }
}

- (void)outgoingSyncSessionDidStart:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B164;
  v4[3] = &unk_100061928;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (id)outgoingSyncSessionGetNextMessage
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10003BA28;
  id v12 = sub_10003BA38;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BA40;
  v7[3] = &unk_100061640;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(queue, v7);
  unsigned int v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = v9[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "outgoing session get next message: %@", buf, 0xCu);
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)outgoingSyncSessionDidEnd:(BOOL)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = LogBool();
    *(_DWORD *)buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "outgoing session end (success=%@)", buf, 0xCu);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003BE14;
  v12[3] = &unk_100061118;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  [(NTKDSyncController *)self _onQueue_async:v12];
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003C0B4;
  v11[3] = &unk_100060A90;
  v11[4] = self;
  dispatch_sync(queue, v11);
}

- (void)incomingSyncSessionDidStart:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003C174;
  v4[3] = &unk_100061928;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (BOOL)incomingSyncSessionResetDataStoreWithError:(id *)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C3DC;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

- (BOOL)incomingSyncSessionApplyMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "incoming session, enqueuing message: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003C5B4;
  v9[3] = &unk_100060AB8;
  id v10 = v4;
  id v11 = self;
  id v7 = v4;
  dispatch_sync(queue, v9);

  return 1;
}

- (void)incomingSyncSessionDidEnd:(BOOL)a3 withError:(id)a4
{
  id v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = LogBool();
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "incoming session end (success=%@)", buf, 0xCu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003C860;
  v10[3] = &unk_100061928;
  void v10[4] = self;
  BOOL v11 = a3;
  [(NTKDSyncController *)self _onQueue_async:v10];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CB3C;
  block[3] = &unk_100060A90;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)incomingLibraryValidationMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CC1C;
  v7[3] = &unk_100060AB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (id)companionSyncWrapperDidRequestActivePairedSyncSession
{
  return [(PSYSyncCoordinator *)self->_syncCoordinator activeSyncSession];
}

- (BOOL)companionSyncWrapperCanSendData
{
  id v3 = [(PSYSyncCoordinator *)self->_syncCoordinator syncRestriction];
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    uint64_t v7 = [(NTKDSyncController *)self shouldEnableSync];
    __int16 v8 = 2048;
    BOOL v9 = v3 == 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Can send data? shouldEnableSync: %lu, syncUnrestricted: %lu", (uint8_t *)&v6, 0x16u);
  }

  BOOL result = [(NTKDSyncController *)self shouldEnableSync];
  if (v3) {
    return 0;
  }
  return result;
}

- (void)_onQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.synccontroller.busy");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D2FC;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_queue_beginGuardingOutgoingSessionRequest
{
  if (!self->_guardingOutgoingSessionRequest)
  {
    sub_10000B610(@"com.apple.ntkd.synccontroller.outgoingsessionrequested");
    id v3 = +[NTKDActivityTracker sharedInstance];
    [v3 beginActivity:@"outgoing-sync-session-activity"];

    self->_guardingOutgoingSessionRequest = 1;
  }
}

- (void)_queue_endGuardingOutgoingSessionRequest
{
  if (self->_guardingOutgoingSessionRequest)
  {
    sub_10000B870(@"com.apple.ntkd.synccontroller.outgoingsessionrequested");
    id v3 = +[NTKDActivityTracker sharedInstance];
    [v3 endActivity:@"outgoing-sync-session-activity"];

    self->_guardingOutgoingSessionRequest = 0;
  }
}

- (id)_queue_checkoutLibraryStoreForDeviceUUID:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_10003BA28;
  id v26 = sub_10003BA38;
  stores = self->_stores;
  id v6 = sub_1000387C0(v4);
  id v27 = [(NSMutableDictionary *)stores objectForKey:v6];

  if (v23[5])
  {
    uint64_t v7 = +[NTKDCollectionCoordinator sharedInstance];
    [v7 checkoutStore:v23[5]];
  }
  else
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    BOOL v9 = +[NTKDCollectionCoordinator sharedInstance];
    uint64_t v10 = NTKCollectionIdentifierLibraryFaces;
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_10003D604;
    id v19 = &unk_100060C80;
    id v21 = &v22;
    uint64_t v7 = v8;
    id v20 = v7;
    [v9 checkoutStoreForCollectionIdentifier:v10 deviceUUID:v4 withHandler:&v16];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v11 = self->_stores;
    uint64_t v12 = v23[5];
    id v13 = sub_1000387C0(v4);
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v13, v16, v17, v18, v19);
  }
  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)_queue_checkoutComplicationStoresForDeviceUUID:(id)a3
{
  id v4 = a3;
  complicationStores = self->_complicationStores;
  id v6 = sub_1000387C0(v4);
  id v7 = [(NSMutableDictionary *)complicationStores objectForKey:v6];

  if (v7)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    dispatch_semaphore_t v8 = [v7 allValues];
    id v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v14 = +[NTKDComplicationStoreCoordinator sharedInstance];
          [v14 checkoutStore:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v10);
    }
  }
  else
  {
    dispatch_group_t v15 = dispatch_group_create();
    id v16 = objc_opt_new();
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10003D940;
    v31[3] = &unk_100062480;
    dispatch_group_t v32 = v15;
    id v17 = v4;
    id v33 = v17;
    id v34 = v16;
    id v18 = v16;
    dispatch_semaphore_t v8 = v15;
    id v19 = objc_retainBlock(v31);
    id v20 = sub_10003DA70();
    id v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    id v28 = sub_10003DB0C;
    int64_t v29 = &unk_1000624A8;
    id v30 = v19;
    id v21 = v19;
    [v20 enumerateObjectsUsingBlock:&v26];

    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v22 = self->_complicationStores;
    id v23 = objc_msgSend(v18, "copy", v26, v27, v28, v29);
    uint64_t v24 = sub_1000387C0(v17);
    [(NSMutableDictionary *)v22 setObject:v23 forKey:v24];

    id v7 = [v18 copy];
  }

  return v7;
}

- (id)_queue_outgoingMessageListForDeviceUUID:(id)a3
{
  id v4 = a3;
  outgoingMessageLists = self->_outgoingMessageLists;
  id v6 = sub_1000387C0(v4);
  id v7 = [(NSMutableDictionary *)outgoingMessageLists objectForKey:v6];

  if (!v7)
  {
    sub_10003DBF4(v4);
    dispatch_semaphore_t v8 = [_MessageList alloc];
    id v9 = sub_10003DC7C(v4);
    id v7 = [(_MessageList *)v8 initWithPersistencePath:v9];

    id v10 = self->_outgoingMessageLists;
    uint64_t v11 = sub_1000387C0(v4);
    [(NSMutableDictionary *)v10 setObject:v7 forKey:v11];
  }
  return v7;
}

- (id)_queue_incomingMessageListForDeviceUUID:(id)a3
{
  id v4 = a3;
  incomingMessageLists = self->_incomingMessageLists;
  id v6 = sub_1000387C0(v4);
  id v7 = [(NSMutableDictionary *)incomingMessageLists objectForKey:v6];

  if (!v7)
  {
    sub_10003DBF4(v4);
    dispatch_semaphore_t v8 = [_MessageList alloc];
    id v9 = sub_10003DDA8(v4);
    id v7 = [(_MessageList *)v8 initWithPersistencePath:v9];

    id v10 = self->_incomingMessageLists;
    uint64_t v11 = sub_1000387C0(v4);
    [(NSMutableDictionary *)v10 setObject:v7 forKey:v11];
  }
  return v7;
}

- (id)_queue_storeStatusForDeviceUUID:(id)a3
{
  id v4 = a3;
  storeStatuses = self->_storeStatuses;
  id v6 = sub_1000387C0(v4);
  id v7 = [(NSMutableDictionary *)storeStatuses objectForKey:v6];

  if (!v7)
  {
    sub_10003DBF4(v4);
    dispatch_semaphore_t v8 = [_StoreStatus alloc];
    id v9 = sub_10003DED4(v4);
    id v7 = [(_StoreStatus *)v8 initWithPersistencePath:v9];

    id v10 = self->_storeStatuses;
    uint64_t v11 = sub_1000387C0(v4);
    [(NSMutableDictionary *)v10 setObject:v7 forKey:v11];
  }
  return v7;
}

- (id)_queue_complicationStoreStatusForDeviceUUID:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  complicationStoreStatuses = self->_complicationStoreStatuses;
  id v9 = sub_10003E07C(v6, v7);
  id v10 = [(NSMutableDictionary *)complicationStoreStatuses objectForKey:v9];

  if (!v10)
  {
    sub_10003DBF4(v6);
    id v11 = v6;
    uint64_t v12 = +[NSFileManager defaultManager];
    uint64_t v13 = sub_10004283C(v11);

    [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:0];
    id v14 = [_StoreStatus alloc];
    dispatch_group_t v15 = sub_10003E104(v11, (uint64_t)v7);
    id v10 = [(_StoreStatus *)v14 initWithPersistencePath:v15];

    id v16 = self->_complicationStoreStatuses;
    id v17 = sub_10003E07C(v11, v7);
    [(NSMutableDictionary *)v16 setObject:v10 forKey:v17];
  }
  return v10;
}

- (id)_queue_complicationStoreStatusesForDeviceUUID:(id)a3 withIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        dispatch_group_t v15 = -[NTKDSyncController _queue_complicationStoreStatusForDeviceUUID:identifier:](self, "_queue_complicationStoreStatusForDeviceUUID:identifier:", v6, v14, (void)v18);
        [v8 setObject:v15 forKeyedSubscript:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  id v16 = [v8 copy];
  return v16;
}

- (void)_queue_requestSyncIfNecessary
{
}

- (void)_queue_requestSyncIfNecessaryAndForceDeltaRequestOtherwise:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = sub_100009124();
  unsigned int v6 = +[CLKDevice NRProductVersionForNRDevice:v5];

  if (HIWORD(v6) <= 2u)
  {
    id v7 = sub_100009124();
    uint64_t v36 = NRDevicePropertySystemBuildVersion;
    dispatch_semaphore_t v8 = +[NSArray arrayWithObjects:&v36 count:1];
    [v7 addPropertyObserver:self forPropertyChanges:v8];

    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sync request ignored because active gizmo is older than Daytona - watchOS=%u", buf, 8u);
    }
    goto LABEL_26;
  }
  BOOL v25 = v3;
  id v9 = sub_1000090CC();
  id v10 = [(NTKDSyncController *)self _queue_storeStatusForDeviceUUID:v9];
  unsigned int v26 = [v10 needsResetSync];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = sub_10003DA70();
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v18 = [(NTKDSyncController *)self _queue_complicationStoreStatusForDeviceUUID:v9 identifier:v17];
        if ([v18 needsResetSync])
        {
          long long v19 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            dispatch_group_t v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "reset sync needed for complication collection: %@", buf, 0xCu);
          }

          int v14 = 1;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v13);
  }
  else
  {
    int v14 = 0;
  }

  if (((v26 | v14) & 1) == 0)
  {
    id v23 = [(NTKDSyncController *)self _queue_outgoingMessageListForDeviceUUID:v9];
    unsigned __int8 v24 = [v23 hasMessages];

    if ((v24 & 1) == 0 && !v25) {
      goto LABEL_26;
    }
    [(NTKDCompanionSyncWrapper *)self->_companionSyncWrapper requestDeltaSync];
LABEL_25:
    [(NTKDSyncController *)self _queue_beginGuardingOutgoingSessionRequest];
    goto LABEL_26;
  }
  long long v20 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    long long v21 = LogBool();
    uint64_t v22 = LogBool();
    *(_DWORD *)buf = 138412546;
    dispatch_group_t v32 = v21;
    __int16 v33 = 2112;
    id v34 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "requesting reset sync (needed for collection: %@, complication: %@)", buf, 0x16u);
  }
  [(NTKDCompanionSyncWrapper *)self->_companionSyncWrapper requestResetSync];
  if ([(NTKDCompanionSyncWrapper *)self->_companionSyncWrapper isPrimary]) {
    goto LABEL_25;
  }
LABEL_26:
}

- (void)_queue_applyIncomingMessageLists
{
  BOOL v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "applying incoming message lists", buf, 2u);
  }

  incomingMessageLists = self->_incomingMessageLists;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E78C;
  v5[3] = &unk_1000624D0;
  void v5[4] = self;
  [(NSMutableDictionary *)incomingMessageLists enumerateKeysAndObjectsUsingBlock:v5];
}

- (void)_queue_applyIncomingMessageList:(id)a3 collectionStore:(id)a4 complicationStores:(id)a5 storeStatus:(id)a6
{
  id v16 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v12 firstMessage];
  id v14 = [v13 messageType];

  if (v14 == (id)-1)
  {
    unsigned __int8 v15 = [(NTKDSyncController *)self _queue_applyResetMessageList:v12 collectionStore:v11 complicationStores:v10];

    if ((v15 & 1) == 0)
    {
      [v16 setNeedsResetSync:1];
      [(NTKDSyncController *)self _queue_requestSyncIfNecessary];
    }
  }
  else
  {
    [(NTKDSyncController *)self _queue_applyDeltaMessageList:v12 collectionStore:v11 complicationStores:v10];
  }
}

- (BOOL)_queue_applyResetMessageList:(id)a3 collectionStore:(id)a4 complicationStores:(id)a5
{
  id v61 = a3;
  id v57 = a4;
  id v56 = a5;
  id v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "building up reset state from reset message list", (uint8_t *)&buf, 2u);
  }

  v58 = +[NSMutableDictionary dictionary];
  dispatch_semaphore_t v8 = +[NSMutableDictionary dictionary];
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = [v56 allKeys];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10003F544;
  v80[3] = &unk_1000616E0;
  id v54 = v8;
  id v81 = v54;
  id v55 = v9;
  id v82 = v55;
  [v10 enumerateObjectsUsingBlock:v80];

  long long v59 = +[NSMutableArray array];
  [v61 suspendCoalescing];
  long long v66 = [v61 messageEnumerator];
  id v12 = [v66 nextObject];
  if (v12)
  {
    long long v62 = 0;
    long long v63 = 0;
    while (2)
    {
      id v13 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "processing incoming message (part of reset): %@", (uint8_t *)&buf, 0xCu);
      }

      switch((unint64_t)[v12 messageType])
      {
        case 0xFFFFFFFFFFFFFFFFLL:
          goto LABEL_39;
        case 0uLL:
          long long v65 = [v12 faceUUID];
          id v14 = +[NSUUID UUID];
          unsigned __int8 v15 = [v14 UUIDString];
          id v16 = +[NSString stringWithFormat:@"In-%@.zip", v15];

          id v17 = sub_10003F5D8();
          long long v18 = [v17 stringByAppendingPathComponent:v16];

          if ([v12 getPayloadDataIntoFile:v18])
          {
            long long v19 = [v57 deviceUUID];
            id v79 = 0;
            long long v20 = NTKDFaceFromPayloadPath();
            long long v21 = v79;
          }
          else
          {
            long long v20 = 0;
            long long v21 = 0;
          }
          uint64_t v36 = +[NSFileManager defaultManager];
          [v36 removeItemAtPath:v18 error:0];

          if (v65 && v20) {
            [v58 setObject:v20 forKey:v65];
          }

          goto LABEL_36;
        case 4uLL:
          long long v21 = [v12 payloadData];
          uint64_t v22 = NTKDSelectedUUIDFromPayloadData();

          long long v62 = (void *)v22;
          goto LABEL_38;
        case 5uLL:
          long long v21 = [v12 payloadData];
          uint64_t v23 = NTKDOrderedUUIDsFromPayloadData();

          long long v63 = (void *)v23;
          goto LABEL_38;
        case 6uLL:
          long long v65 = [v12 complicationCollectionIdentifier];
          long long v20 = [v12 complicationClientID];
          id v16 = [v12 complicationDescriptor];
          unsigned __int8 v24 = [v12 payloadData];
          long long v64 = NTKDClientSampleDataFromPayloadData();

          uint64_t v25 = NSTemporaryDirectory();
          unsigned int v26 = [(id)v25 stringByAppendingPathComponent:@"sync"];
          long long v27 = +[NSUUID UUID];
          long long v28 = [v27 UUIDString];
          long long v21 = [v26 stringByAppendingPathComponent:v28];

          long long v29 = +[NSFileManager defaultManager];
          id v78 = 0;
          LOBYTE(v25) = [v29 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v78];
          id v30 = v78;

          if (v25)
          {
            id v31 = [v64 copyEncodedToDirectoryPath:v21];
            if (v31) {
              goto LABEL_32;
            }
          }
          else
          {
            long long v37 = _NTKLoggingObjectForDomain();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v30;
              _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "Failed to make temporary reset sync sample data directory: %@", (uint8_t *)&buf, 0xCu);
            }
          }
          id v31 = v64;
          long long v38 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_100044F14(&v76, v77, v38);
          }

LABEL_32:
          if (v20 && v31)
          {
            id v39 = [objc_alloc((Class)NTKComplicationKey) initWithClientIdentifier:v20 descriptor:v16];
            id v40 = [v54 objectForKeyedSubscript:v65];
            [v40 setObject:v31 forKey:v39];
          }
LABEL_36:

          if (v21)
          {
            [v59 addObject:v21];
LABEL_38:
          }
LABEL_39:

          id v12 = [v66 nextObject];
          if (!v12) {
            goto LABEL_42;
          }
          continue;
        case 0xAuLL:
          long long v21 = [v12 complicationCollectionIdentifier];
          dispatch_group_t v32 = [v12 complicationClientID];
          __int16 v33 = [v12 payloadData];
          id v34 = NTKDComplicationDescriptorsFromPayloadData();

          if (v32 && v34)
          {
            long long v35 = [v55 objectForKeyedSubscript:v21];
            [v35 setObject:v34 forKey:v32];
          }
          goto LABEL_38;
        default:
          long long v21 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_100044E88(v87, v12, &v88, v21);
          }
          goto LABEL_38;
      }
    }
  }
  long long v62 = 0;
  long long v63 = 0;
LABEL_42:
  [v61 resumeCoalescing];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  if ([v58 count] && v63)
  {
    [v57 withoutNotifyingSyncObserverResetWithFaces:v58 orderedUUIDs:v63 selectedUUID:v62];
    [v57 synchronize];
    *(unsigned char *)(*((void *)&buf + 1) + 24) = 1;
  }
  uint64_t v41 = [v56 allKeys];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10003F62C;
  v71[3] = &unk_100062548;
  id v42 = v55;
  id v72 = v42;
  id v43 = v54;
  id v73 = v43;
  id v44 = v56;
  id v74 = v44;
  p_long long buf = &buf;
  [v41 enumerateObjectsUsingBlock:v71];

  if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    id v45 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_100044E44(v45);
    }
  }
  [v61 clearAllMessages];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v46 = v59;
  id v47 = [v46 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v68;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v68 != v48) {
          objc_enumerationMutation(v46);
        }
        uint64_t v50 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        v51 = +[NSFileManager defaultManager];
        [v51 removeItemAtPath:v50 error:0];
      }
      id v47 = [v46 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v47);
  }

  BOOL v52 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return v52;
}

- (BOOL)_queue_applyDeltaMessageList:(id)a3 collectionStore:(id)a4 complicationStores:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v11 = [v7 firstMessage];
  if (v11)
  {
    id v12 = v11;
    id v13 = &BOMCopierCopyWithOptions_ptr;
    long long v66 = v8;
    id v67 = v9;
    do
    {
      id v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v71 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "applying incoming message: %@", buf, 0xCu);
      }

      switch((unint64_t)[v12 messageType])
      {
        case 0xFFFFFFFFFFFFFFFFLL:
          unsigned __int8 v15 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_100044F54(&v68, v69, v15);
          }
          goto LABEL_24;
        case 0uLL:
          unsigned __int8 v15 = [v12 faceUUID];
          id v17 = +[NSUUID UUID];
          long long v18 = [v17 UUIDString];
          long long v19 = +[NSString stringWithFormat:@"In-%@.zip", v18];

          long long v20 = sub_10003F5D8();
          long long v21 = [v20 stringByAppendingPathComponent:v19];

          if ([v12 getPayloadDataIntoFile:v21])
          {
            uint64_t v22 = [v8 deviceUUID];
            uint64_t v23 = NTKDFaceFromPayloadPath();
            id v16 = 0;
          }
          else
          {
            uint64_t v23 = 0;
            id v16 = 0;
          }
          id v57 = +[NSFileManager defaultManager];
          [v57 removeItemAtPath:v21 error:0];

          v58 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138543618;
            long long v71 = v15;
            __int16 v72 = 2114;
            id v73 = v23;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "incoming - %{public}@ - added face %{public}@", buf, 0x16u);
          }

          if (v15 && v23)
          {
            long long v59 = [v12 faceUUID];
            [v8 withoutNotifyingSyncObserverAddFace:v23 forUUID:v59];
          }
          goto LABEL_61;
        case 1uLL:
          unsigned __int8 v15 = [v12 faceUUID];
          unsigned __int8 v24 = [v12 payloadData];
          uint64_t v25 = [v8 deviceUUID];
          unsigned int v26 = NTKDFaceConfigurationFromPayloadData();

          long long v27 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138543618;
            long long v71 = v15;
            __int16 v72 = 2114;
            id v73 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "incoming - %{public}@ - updated face config %{public}@", buf, 0x16u);
          }

          if (v15 && v26) {
            [v8 withoutNotifyingSyncObserverUpdateFaceForUUID:v15 withConfiguration:v26];
          }
          goto LABEL_44;
        case 2uLL:
          unsigned __int8 v15 = [v12 faceUUID];
          long long v28 = +[NSUUID UUID];
          long long v29 = [v28 UUIDString];
          id v30 = +[NSString stringWithFormat:@"In-%@.zip", v29];

          id v31 = sub_10003F5D8();
          dispatch_group_t v32 = [v31 stringByAppendingPathComponent:v30];

          if ([v12 getPayloadDataIntoFile:v32])
          {
            __int16 v33 = NTKDFaceResourceDirectoryFromPayloadPath();
          }
          else
          {
            __int16 v33 = 0;
          }
          long long v60 = +[NSFileManager defaultManager];
          [v60 removeItemAtPath:v32 error:0];

          if (v15)
          {
            [v66 withoutNotifyingSyncObserverUpdateFaceForUUID:v15 withResourceDirectory:v33];
            [v66 synchronize];
            id v61 = +[NSFileManager defaultManager];
            [v61 removeItemAtPath:v33 error:0];
          }
          id v16 = 0;
          id v13 = &BOMCopierCopyWithOptions_ptr;
          id v8 = v66;
          goto LABEL_63;
        case 3uLL:
          unsigned __int8 v15 = [v12 faceUUID];
          if (v15) {
            [v8 withoutNotifyingSyncObserverRemoveFaceForUUID:v15];
          }
          goto LABEL_24;
        case 4uLL:
          id v34 = [v12 payloadData];
          unsigned __int8 v15 = NTKDSelectedUUIDFromPayloadData();

          if (v15) {
            [v8 withoutNotifyingSyncObserverSetSelectedUUID:v15];
          }
          goto LABEL_24;
        case 5uLL:
          long long v35 = [v12 payloadData];
          unsigned __int8 v15 = NTKDOrderedUUIDsFromPayloadData();

          if (v15) {
            [v8 withoutNotifyingSyncObserverSetOrderedUUIDs:v15];
          }
LABEL_24:
          id v16 = 0;
          goto LABEL_63;
        case 6uLL:
          unsigned __int8 v15 = [v12 complicationCollectionIdentifier];
          uint64_t v36 = [v9 objectForKeyedSubscript:v15];
          long long v37 = [v12 complicationClientID];
          long long v38 = [v12 complicationDescriptor];
          id v39 = [v12 payloadData];
          id v40 = NTKDClientSampleDataFromPayloadData();

          if (v37 && v40) {
            [v36 withoutNotifyingSyncObserverSetComplicationSampleData:v40 forClientIdentifier:v37 descriptor:v38];
          }

          goto LABEL_37;
        case 7uLL:
          unsigned __int8 v15 = [v12 complicationCollectionIdentifier];
          unsigned int v26 = [v9 objectForKeyedSubscript:v15];
          uint64_t v41 = [v12 complicationClientID];
          id v42 = [v12 complicationDescriptor];
          if (v41) {
            [v26 withoutNotifyingSyncObserverRemoveComplicationSampleTemplatesForClientIdentifier:v41 descriptor:v42];
          }

          goto LABEL_44;
        case 8uLL:
          unsigned __int8 v15 = [v12 complicationCollectionIdentifier];
          uint64_t v36 = [v9 objectForKeyedSubscript:v15];
          long long v37 = [v12 complicationClientID];
          long long v38 = [v12 complicationDescriptor];
          id v43 = [v12 payloadData];
          id v44 = NTKDClientSampleTemplateFromPayloadData();

          id v45 = [v12 complicationFamily];
          id v46 = v45;
          if (v37 && v44 && v45) {
            objc_msgSend(v36, "withoutNotifyingUpdateLocalizableSampleDataTemplate:forClientIdentifier:descriptor:family:", v44, v37, v38, objc_msgSend(v45, "integerValue"));
          }

LABEL_37:
          id v16 = 0;
          goto LABEL_61;
        case 9uLL:
          unsigned __int8 v15 = [v12 faceUUID];
          id v47 = +[NSUUID UUID];
          uint64_t v48 = [v47 UUIDString];
          v49 = +[NSString stringWithFormat:@"In-%@.zip", v48];

          uint64_t v50 = sub_10003F5D8();
          v51 = [v50 stringByAppendingPathComponent:v49];

          if ([v12 getPayloadDataIntoFile:v51])
          {
            BOOL v52 = [v8 deviceUUID];
            v53 = NTKDFaceFromPayloadPath();
            id v16 = 0;
          }
          else
          {
            v53 = 0;
            id v16 = 0;
          }
          long long v62 = +[NSFileManager defaultManager];
          [v62 removeItemAtPath:v51 error:0];

          if (v15 && v53)
          {
            long long v63 = [v12 faceUUID];
            [v8 withoutNotifyingSyncObserverUpgradeFace:v53 forUUID:v63];
          }
LABEL_61:
          id v9 = v67;
          goto LABEL_62;
        case 0xAuLL:
          unsigned __int8 v15 = [v12 complicationCollectionIdentifier];
          unsigned int v26 = [v9 objectForKeyedSubscript:v15];
          id v54 = [v12 complicationClientID];
          id v55 = [v12 payloadData];
          id v56 = NTKDComplicationDescriptorsFromPayloadData();

          if (v54 && v56) {
            [v26 withoutNotifyingUpdateComplicationDescriptors:v56 forClientIdentifier:v54];
          }

LABEL_44:
          id v16 = 0;
LABEL_62:
          id v13 = &BOMCopierCopyWithOptions_ptr;
LABEL_63:

          break;
        default:
          id v16 = 0;
          break;
      }
      [v8 synchronize];
      [v9 enumerateKeysAndObjectsUsingBlock:&stru_100062568];
      [v7 dequeueFirstMessage];
      if (v16)
      {
        long long v64 = [v13[242] defaultManager];
        [v64 removeItemAtPath:v16 error:0];
      }
      id v12 = [v7 firstMessage];
    }
    while (v12);
  }

  return 1;
}

- (void)_queue_addPayloadToMessage:(id)a3 withFaceStore:(id)a4 complicationStores:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  switch((unint64_t)[v7 messageType])
  {
    case 0uLL:
      uint64_t v11 = [v7 faceUUID];
      id v12 = [v8 faceForUUID:v11];

      id v13 = +[NSUUID UUID];
      id v14 = [v13 UUIDString];
      unsigned __int8 v15 = +[NSString stringWithFormat:@"Out-%@.zip", v14];

      id v16 = sub_10003F5D8();
      id v17 = [v16 stringByAppendingPathComponent:v15];

      if (sub_10000A480(v12, 0, v17)) {
        [v7 setPayloadDataFromFile:v17];
      }
      long long v18 = +[NSFileManager defaultManager];
      [v18 removeItemAtPath:v17 error:0];

      long long v19 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        long long v20 = [v7 faceUUID];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v50 = v20;
        __int16 v51 = 2114;
        BOOL v52 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Outgoing - %{public}@ - added face %{public}@", buf, 0x16u);
      }
      goto LABEL_18;
    case 1uLL:
      long long v21 = [v7 faceUUID];
      id v12 = [v8 faceForUUID:v21];

      uint64_t v22 = NTKDPayloadDataFromFaceConfiguration();
      [v7 setPayloadData:v22];

      unsigned __int8 v15 = _NTKLoggingObjectForDomain();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      id v17 = [v7 faceUUID];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v50 = v17;
      __int16 v51 = 2114;
      BOOL v52 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Outgoing - %{public}@ - updated face %{public}@", buf, 0x16u);
      goto LABEL_19;
    case 2uLL:
      uint64_t v23 = [v7 faceUUID];
      unsigned __int8 v24 = [v8 faceForUUID:v23];
      id v12 = [v24 resourceDirectory];

      uint64_t v25 = +[NSUUID UUID];
      unsigned int v26 = [v25 UUIDString];
      unsigned __int8 v15 = +[NSString stringWithFormat:@"Out-%@.zip", v26];

      long long v27 = sub_10003F5D8();
      id v17 = [v27 stringByAppendingPathComponent:v15];

      long long v28 = +[NTKDZIPArchivist sharedArchivist];
      unsigned int v29 = [v28 zippedDataForPath:v12 toZipFile:v17];

      if (!v29) {
        goto LABEL_17;
      }
      goto LABEL_16;
    case 4uLL:
      id v12 = [v8 selectedUUID];
      uint64_t v30 = NTKDPayloadDataFromSelectedUUID();
      goto LABEL_12;
    case 5uLL:
      id v12 = [v8 orderedUUIDs];
      uint64_t v30 = NTKDPayloadDataFromOrderedUUIDs();
LABEL_12:
      unsigned __int8 v15 = v30;
      [v7 setPayloadData:v30];
      goto LABEL_20;
    case 6uLL:
      id v12 = [v7 complicationClientID];
      unsigned __int8 v15 = [v7 complicationDescriptor];
      id v31 = [v7 complicationCollectionIdentifier];
      dispatch_group_t v32 = [v9 objectForKeyedSubscript:v31];

      __int16 v33 = [v32 complicationSampleDataForClientID:v12 descriptor:v15 shouldInflate:1];
      id v34 = NTKDPayloadDataFromComplicationSampleData();
      [v7 setPayloadData:v34];

      goto LABEL_20;
    case 8uLL:
      id v12 = [v7 complicationClientID];
      unsigned __int8 v15 = [v7 complicationDescriptor];
      long long v35 = [v7 complicationFamily];
      id v36 = [v35 integerValue];

      long long v37 = [v7 complicationCollectionIdentifier];
      long long v38 = [v9 objectForKeyedSubscript:v37];

      id v39 = [v38 sampleTemplateForClientIdentifier:v12 descriptor:v15 family:v36];
      id v40 = NTKDPayloadDataFromComplicationTemplate();
      [v7 setPayloadData:v40];

      goto LABEL_20;
    case 9uLL:
      uint64_t v41 = [v7 faceUUID];
      id v12 = [v8 faceForUUID:v41];

      id v42 = +[NSUUID UUID];
      id v43 = [v42 UUIDString];
      unsigned __int8 v15 = +[NSString stringWithFormat:@"Out-%@.zip", v43];

      id v44 = sub_10003F5D8();
      id v17 = [v44 stringByAppendingPathComponent:v15];

      if (sub_10000A480(v12, 0, v17)) {
LABEL_16:
      }
        [v7 setPayloadDataFromFile:v17];
LABEL_17:
      long long v19 = +[NSFileManager defaultManager];
      [v19 removeItemAtPath:v17 error:0];
LABEL_18:

LABEL_19:
LABEL_20:

      goto LABEL_21;
    case 0xAuLL:
      id v12 = [v7 complicationClientID];
      id v45 = [v7 complicationCollectionIdentifier];
      id v46 = [v9 objectForKeyedSubscript:v45];

      id v47 = [v46 complicationDescriptorsForClientIdentifier:v12];
      uint64_t v48 = NTKDPayloadDataFromComplicationDescriptors();
      [v7 setPayloadData:v48];

LABEL_21:
      break;
    default:
      break;
  }
}

- (void)_queue_executeIfSyncQueuesAreEmpty:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = sub_1000090CC();
  unsigned int v6 = [(NTKDSyncController *)self _queue_outgoingMessageListForDeviceUUID:v5];
  if ([v6 hasMessages])
  {
  }
  else
  {
    id v7 = sub_1000090CC();
    id v8 = [(NTKDSyncController *)self _queue_incomingMessageListForDeviceUUID:v7];
    unsigned __int8 v9 = [v8 hasMessages];

    if ((v9 & 1) == 0)
    {
      v4[2](v4);
      goto LABEL_8;
    }
  }
  id v10 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ignoring library store validation attempt -- sync messages currently enqueued", v11, 2u);
  }

LABEL_8:
}

- (int64_t)outgoingSessionTransactionCount
{
  return self->_outgoingSessionTransactionCount;
}

- (void)setOutgoingSessionTransactionCount:(int64_t)a3
{
  self->_int64_t outgoingSessionTransactionCount = a3;
}

- (int64_t)incomingSessionTransactionCount
{
  return self->_incomingSessionTransactionCount;
}

- (void)setIncomingSessionTransactionCount:(int64_t)a3
{
  self->_int64_t incomingSessionTransactionCount = a3;
}

- (NTKPigmentSyncProvider)pigmentSyncProvider
{
  return self->_pigmentSyncProvider;
}

- (void)setPigmentSyncProvider:(id)a3
{
}

- (NTKPigmentSyncReceiver)pigmentSyncReceiver
{
  return self->_pigmentSyncReceiver;
}

- (void)setPigmentSyncReceiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pigmentSyncReceiver, 0);
  objc_storeStrong((id *)&self->_pigmentSyncProvider, 0);
  objc_storeStrong((id *)&self->_outgoingSessionMessageEnumerator, 0);
  objc_storeStrong((id *)&self->_sessionComplicationStoreByIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_sessionComplicationStoreStatusByIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionStoreStatus, 0);
  objc_storeStrong((id *)&self->_sessionMessageList, 0);
  objc_storeStrong((id *)&self->_complicationStores, 0);
  objc_storeStrong((id *)&self->_stores, 0);
  objc_storeStrong((id *)&self->_complicationStoreStatuses, 0);
  objc_storeStrong((id *)&self->_storeStatuses, 0);
  objc_storeStrong((id *)&self->_incomingMessageLists, 0);
  objc_storeStrong((id *)&self->_outgoingMessageLists, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_companionSyncWrapper, 0);
}

@end