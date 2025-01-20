@interface NNMKSyncStateManager
- (BLTPingSubscriber)notificationsPingSubscriber;
- (BOOL)isInitialSyncRestricted;
- (BOOL)pairedDeviceSupportsMailContentProtectedChannel;
- (BOOL)pairedDeviceSupportsMultipleMailboxes;
- (BOOL)pairedDeviceSupportsStandaloneMode;
- (BOOL)willPresentNotificationForMessage:(id)a3;
- (NNMKSyncStateManager)init;
- (NNMKSyncStateManagerDelegate)delegate;
- (PSYSyncCoordinator)initialSyncCoordinator;
- (id)_bbSubsectionIdsForMessage:(id)a3;
- (id)_pairedNanoRegistryDevice;
- (id)pairedDeviceScreenScale;
- (id)pairedDeviceScreenSize;
- (id)pairingStorePath;
- (void)_handleDidUnpairNotification:(id)a3;
- (void)_handlePairedDeviceChangedNotification:(id)a3;
- (void)dealloc;
- (void)reportInitialSyncDidComplete;
- (void)reportInitialSyncDidCompleteSending;
- (void)reportInitialSyncDidFailWithError:(id)a3;
- (void)reportInitialSyncProgress:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialSyncCoordinator:(id)a3;
- (void)setNotificationsPingSubscriber:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
@end

@implementation NNMKSyncStateManager

- (NNMKSyncStateManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)NNMKSyncStateManager;
  v2 = [(NNMKSyncStateManager *)&v17 init];
  if (v2)
  {
    v3 = (BLTPingSubscriber *)objc_alloc_init(MEMORY[0x263F2BD20]);
    notificationsPingSubscriber = v2->_notificationsPingSubscriber;
    v2->_notificationsPingSubscriber = v3;

    objc_initWeak(&location, v2);
    v5 = v2->_notificationsPingSubscriber;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __28__NNMKSyncStateManager_init__block_invoke;
    v14 = &unk_264E9A878;
    objc_copyWeak(&v15, &location);
    [(BLTPingSubscriber *)v5 subscribeToSectionID:@"com.apple.mobilemail" withNotificationAckForwardHandler:&v11];
    uint64_t v6 = objc_msgSend(MEMORY[0x263F5BB20], "syncCoordinatorWithServiceName:", @"com.apple.pairedsync.mail", v11, v12, v13, v14);
    initialSyncCoordinator = v2->_initialSyncCoordinator;
    v2->_initialSyncCoordinator = (PSYSyncCoordinator *)v6;

    [(PSYSyncCoordinator *)v2->_initialSyncCoordinator setDelegate:v2];
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel__handleDidUnpairNotification_ name:*MEMORY[0x263F576B8] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel__handlePairedDeviceChangedNotification_ name:*MEMORY[0x263F57688] object:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__NNMKSyncStateManager_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = [WeakRetained delegate];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __28__NNMKSyncStateManager_init__block_invoke_2;
    v9[3] = &unk_264E9A850;
    id v10 = v5;
    [v8 syncStateManager:WeakRetained handleForwardForNotification:v6 completion:v9];
  }
}

uint64_t __28__NNMKSyncStateManager_init__block_invoke_2(uint64_t a1, int a2)
{
  v4 = __logCategories;
  BOOL v5 = os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Calling ack block back with BLTPingSubscribingForwardAllow", buf, 2u);
    }
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Calling ack block back with BLTPingSubscribingForwardSuppress", v8, 2u);
    }
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  return v6();
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F576B8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NNMKSyncStateManager;
  [(NNMKSyncStateManager *)&v4 dealloc];
}

- (void)reportInitialSyncProgress:(double)a3
{
  id v4 = [(PSYSyncCoordinator *)self->_initialSyncCoordinator activeSyncSession];
  [v4 reportProgress:a3];
}

- (void)reportInitialSyncDidCompleteSending
{
  id v2 = [(PSYSyncCoordinator *)self->_initialSyncCoordinator activeSyncSession];
  [v2 syncDidCompleteSending];
}

- (void)reportInitialSyncDidComplete
{
  id v2 = [(PSYSyncCoordinator *)self->_initialSyncCoordinator activeSyncSession];
  [v2 syncDidComplete];
}

- (void)reportInitialSyncDidFailWithError:(id)a3
{
  initialSyncCoordinator = self->_initialSyncCoordinator;
  id v4 = a3;
  id v5 = [(PSYSyncCoordinator *)initialSyncCoordinator activeSyncSession];
  [v5 syncDidFailWithError:v4];
}

- (BOOL)isInitialSyncRestricted
{
  return [(PSYSyncCoordinator *)self->_initialSyncCoordinator syncRestriction] == 1;
}

- (id)pairingStorePath
{
  id v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [v2 pairingStorePath];

  return v3;
}

- (id)pairedDeviceScreenSize
{
  id v2 = [(NNMKSyncStateManager *)self _pairedNanoRegistryDevice];
  v3 = [v2 valueForProperty:*MEMORY[0x263F57640]];

  return v3;
}

- (id)pairedDeviceScreenScale
{
  id v2 = [(NNMKSyncStateManager *)self _pairedNanoRegistryDevice];
  v3 = [v2 valueForProperty:*MEMORY[0x263F57638]];

  return v3;
}

- (BOOL)willPresentNotificationForMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 checkState:1])
  {
LABEL_9:
    BOOL v16 = 0;
    goto LABEL_13;
  }
  id v5 = [v4 accountId];

  if (!v5)
  {
    id v15 = (void *)qword_26AC21850;
    if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
      -[NNMKSyncStateManager willPresentNotificationForMessage:](v15, v4);
    }
    goto LABEL_9;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  notificationsPingSubscriber = self->_notificationsPingSubscriber;
  v8 = [(NNMKSyncStateManager *)self _bbSubsectionIdsForMessage:v4];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__NNMKSyncStateManager_willPresentNotificationForMessage___block_invoke;
  v18[3] = &unk_264E9A8A0;
  v20 = &v26;
  v21 = &v22;
  v9 = v6;
  v19 = v9;
  [(BLTPingSubscriber *)notificationsPingSubscriber getWillNanoPresentNotificationForSectionID:@"com.apple.mobilemail" subsectionIDs:v8 completion:v18];

  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  uint64_t v11 = qword_26AC21850;
  if (*((unsigned char *)v23 + 24))
  {
    uint64_t v12 = (id)qword_26AC21850;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v4 messageId];
      int v14 = *((unsigned __int8 *)v27 + 24);
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      __int16 v32 = 1024;
      int v33 = v14;
      _os_log_impl(&dword_23D3DF000, v12, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber did respond. (Id: %{public}@, Notification: %d)", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncStateManager willPresentNotificationForMessage:](v11);
  }
  BOOL v16 = *((unsigned char *)v27 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
LABEL_13:

  return v16;
}

intptr_t __58__NNMKSyncStateManager_willPresentNotificationForMessage___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleDidUnpairNotification:(id)a3
{
  id v4 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v6 = 0;
    _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "Received Unpair notification from NanoRegistry. Informing NNMKSyncProvider...", v6, 2u);
  }
  id v5 = [(NNMKSyncStateManager *)self delegate];
  [v5 syncStateManagerDidUnpair:self];
}

- (void)_handlePairedDeviceChangedNotification:(id)a3
{
  id v4 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v6 = 0;
    _os_log_impl(&dword_23D3DF000, v4, OS_LOG_TYPE_DEFAULT, "Received Paired Device Changed notification from NanoRegistry. Informing NNMKSyncProvider...", v6, 2u);
  }
  id v5 = [(NNMKSyncStateManager *)self delegate];
  [v5 syncStateManagerDidChangePairedDevice:self];
}

- (BOOL)pairedDeviceSupportsMailContentProtectedChannel
{
  id v2 = [(NNMKSyncStateManager *)self _pairedNanoRegistryDevice];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0AEBD96A-0D13-42E0-9D9B-3D4BFAB8B7DB"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  dispatch_semaphore_t v6 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Received notification from PairedSync to begin SyncSession. Informing NNMKSyncProvider...", v11, 2u);
  }
  v7 = [(NNMKSyncStateManager *)self delegate];
  [v5 syncSessionType];
  v8 = NSStringfromPSYSyncSessionType();
  v9 = [v5 sessionIdentifier];
  dispatch_time_t v10 = [v9 UUIDString];
  [v7 syncStateManagerDidBeginSyncSession:self syncSessionType:v8 syncSessionIdentifier:v10];
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5 = a4;
  dispatch_semaphore_t v6 = qword_26AC21850;
  if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v10 = 0;
    _os_log_impl(&dword_23D3DF000, v6, OS_LOG_TYPE_DEFAULT, "Received notification from PairedSync to invalidate SyncSession. Informing NNMKSyncProvider...", v10, 2u);
  }
  v7 = [(NNMKSyncStateManager *)self delegate];
  v8 = [v5 sessionIdentifier];
  v9 = [v8 UUIDString];
  [v7 syncStateManagerDidInvalidateSyncSession:self syncSessionIdentifier:v9];
}

- (id)_bbSubsectionIdsForMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9C0];
  dispatch_semaphore_t v6 = [v4 accountId];
  v7 = [v5 setWithObject:v6];

  if ([v4 checkState:64]) {
    [v7 addObject:@"com.apple.mobilemail.bulletin-subsection.VIP"];
  }
  if ([v4 checkState:128]) {
    [v7 addObject:@"com.apple.mobilemail.bulletin-subsection.ThreadNotify"];
  }
  v8 = [(NNMKSyncStateManager *)self delegate];
  v9 = [v4 mailboxId];
  int v10 = [v8 syncStateManagerShouldAddFavoriteSubsectionForMailboxId:v9];

  if (v10) {
    [v7 addObject:@"com.apple.mobilemail.bulletin-subsection.FavoriteMailboxes"];
  }

  return v7;
}

- (id)_pairedNanoRegistryDevice
{
  id v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  return v3;
}

- (BOOL)pairedDeviceSupportsMultipleMailboxes
{
  id v2 = [(NNMKSyncStateManager *)self _pairedNanoRegistryDevice];
  int v3 = NRWatchOSVersionForRemoteDevice();

  return (v3 & 0xFFFC0000) != 0;
}

- (BOOL)pairedDeviceSupportsStandaloneMode
{
  id v2 = [(NNMKSyncStateManager *)self _pairedNanoRegistryDevice];
  int v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (NNMKSyncStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (NNMKSyncStateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BLTPingSubscriber)notificationsPingSubscriber
{
  return self->_notificationsPingSubscriber;
}

- (void)setNotificationsPingSubscriber:(id)a3
{
}

- (PSYSyncCoordinator)initialSyncCoordinator
{
  return self->_initialSyncCoordinator;
}

- (void)setInitialSyncCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationsPingSubscriber, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)willPresentNotificationForMessage:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = a1;
  char v4 = [a2 messageId];
  int v5 = 138543362;
  dispatch_semaphore_t v6 = v4;
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "Received message with nil accountId. It will not preset notification. %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)willPresentNotificationForMessage:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Please file a radar. #BulletinDistributor Ping Subscriber did NOT respond within 5 seconds. Assuming we WILL generate a notification.", v1, 2u);
}

@end