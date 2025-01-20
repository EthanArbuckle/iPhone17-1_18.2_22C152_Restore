@interface MAPushNotificationController
+ (id)sharedInstance;
- (MAPushNotificationController)init;
- (NSLock)serviceConnectionLock;
- (NSXPCConnection)serviceConnection;
- (id)_serviceConnection;
- (id)asyncProxy;
- (id)pushJobDescriptions;
- (id)subscribedChannelIDs;
- (id)synchronousProxy;
- (void)addSyntheticJobWithType:(id)a3 assetSpecifier:(id)a4 matchingAssetVersion:(id)a5 triggerInterval:(int64_t)a6;
- (void)asyncSubscribeToChannelWithIdentifier:(id)a3;
- (void)asyncUnsubscribeToChannelWithIdentifier:(id)a3;
- (void)didReceivePushNotificationWithInfo:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)setServiceConnectionLock:(id)a3;
- (void)subscribeToChannelWithIdentifier:(id)a3;
- (void)subscribedChannelIDsWithCompletion:(id)a3;
- (void)triggerNotificationWithPayload:(id)a3;
- (void)unsubscribeFromAllChannels;
- (void)unsubscribeToChannelWithIdentifier:(id)a3;
@end

@implementation MAPushNotificationController

- (MAPushNotificationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAPushNotificationController;
  v2 = [(MAPushNotificationController *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    serviceConnectionLock = v2->_serviceConnectionLock;
    v2->_serviceConnectionLock = v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __46__MAPushNotificationController_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(MAPushNotificationController);
  return MEMORY[0x1F41817F8]();
}

- (id)_serviceConnection
{
  v3 = [(MAPushNotificationController *)self serviceConnectionLock];
  [v3 lock];

  v4 = [(MAPushNotificationController *)self serviceConnection];

  if (!v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mobileassetd.push-notifications" options:4096];
    [(MAPushNotificationController *)self setServiceConnection:v5];

    objc_super v6 = [(MAPushNotificationController *)self serviceConnection];

    if (!v6) {
      _MobileAssetLog(0, 3, (uint64_t)"-[MAPushNotificationController _serviceConnection]", @"Could not connect to service %@", v7, v8, v9, v10, @"com.apple.mobileassetd.push-notifications");
    }
    v11 = MAPushServiceInterface();
    v12 = [(MAPushNotificationController *)self serviceConnection];
    [v12 setRemoteObjectInterface:v11];

    v13 = MAServiceClientInterface();
    v14 = [(MAPushNotificationController *)self serviceConnection];
    [v14 setExportedInterface:v13];

    v15 = [(MAPushNotificationController *)self serviceConnection];
    [v15 setExportedObject:self];

    objc_initWeak(&location, self);
    v16 = [(MAPushNotificationController *)self serviceConnection];
    [v16 setInterruptionHandler:&__block_literal_global_8];

    v17 = [(MAPushNotificationController *)self serviceConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__MAPushNotificationController__serviceConnection__block_invoke_2;
    v23[3] = &unk_1E6005B50;
    objc_copyWeak(&v24, &location);
    [v17 setInvalidationHandler:v23];

    id v18 = objc_loadWeakRetained(&location);
    v19 = [v18 serviceConnection];
    [v19 resume];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  v20 = [(MAPushNotificationController *)self serviceConnectionLock];
  [v20 unlock];

  v21 = [(MAPushNotificationController *)self serviceConnection];
  return v21;
}

void __50__MAPushNotificationController__serviceConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __50__MAPushNotificationController__serviceConnection__block_invoke_2(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 4, (uint64_t)"-[MAPushNotificationController _serviceConnection]_block_invoke_2", @"Service connection invalidated", a5, a6, a7, a8, v13);
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v10 = [WeakRetained serviceConnectionLock];
  [v10 lock];

  id v11 = objc_loadWeakRetained(a1);
  [v11 setServiceConnection:0];

  id v14 = objc_loadWeakRetained(a1);
  v12 = [v14 serviceConnectionLock];
  [v12 unlock];
}

- (id)synchronousProxy
{
  v2 = [(MAPushNotificationController *)self _serviceConnection];
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_17];

  return v3;
}

void __48__MAPushNotificationController_synchronousProxy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (id)asyncProxy
{
  v2 = [(MAPushNotificationController *)self _serviceConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_22];

  return v3;
}

void __42__MAPushNotificationController_asyncProxy__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)asyncSubscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MAPushNotificationController *)self asyncProxy];
  [v5 subscribeToChannelWithIdentifier:v4];
}

- (void)subscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MAPushNotificationController *)self synchronousProxy];
  [v5 subscribeToChannelWithIdentifier:v4];
}

- (void)asyncUnsubscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MAPushNotificationController *)self asyncProxy];
  [v5 unsubscribeToChannelWithIdentifier:v4];
}

- (void)unsubscribeToChannelWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MAPushNotificationController *)self synchronousProxy];
  [v5 unsubscribeToChannelWithIdentifier:v4];
}

- (void)subscribedChannelIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MAPushNotificationController *)self asyncProxy];
  [v5 subscribedChannelIDsWithCompletion:v4];
}

- (void)unsubscribeFromAllChannels
{
  id v2 = [(MAPushNotificationController *)self synchronousProxy];
  [v2 unsubscribeFromAllChannels];
}

- (id)subscribedChannelIDs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  id v2 = [(MAPushNotificationController *)self synchronousProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MAPushNotificationController_subscribedChannelIDs__block_invoke;
  v5[3] = &unk_1E6005B98;
  v5[4] = &v6;
  [v2 subscribedChannelIDsWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__MAPushNotificationController_subscribedChannelIDs__block_invoke(uint64_t a1, void *a2)
{
}

- (void)triggerNotificationWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(MAPushNotificationController *)self synchronousProxy];
  [v5 triggerPushNotificationWithPayload:v4];
}

- (id)pushJobDescriptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__7;
  uint64_t v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  id v2 = [(MAPushNotificationController *)self synchronousProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MAPushNotificationController_pushJobDescriptions__block_invoke;
  v5[3] = &unk_1E6005B98;
  v5[4] = &v6;
  [v2 pushJobsAwaitingTriggerWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__MAPushNotificationController_pushJobDescriptions__block_invoke(uint64_t a1, void *a2)
{
}

- (void)addSyntheticJobWithType:(id)a3 assetSpecifier:(id)a4 matchingAssetVersion:(id)a5 triggerInterval:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(MAPushNotificationController *)self synchronousProxy];
  [v13 addSyntheticJobWithType:v12 assetSpecifier:v11 matchingAssetVersion:v10 triggerInterval:a6];
}

- (void)didReceivePushNotificationWithInfo:(id)a3
{
  _MobileAssetLog(0, 6, (uint64_t)"-[MAPushNotificationController didReceivePushNotificationWithInfo:]", @"Client received notification with info %@", v3, v4, v5, v6, (uint64_t)a3);
}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
}

- (NSLock)serviceConnectionLock
{
  return self->_serviceConnectionLock;
}

- (void)setServiceConnectionLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnectionLock, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

@end