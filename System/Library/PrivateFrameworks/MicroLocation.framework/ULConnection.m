@interface ULConnection
+ (id)_createNSXPCConnectionWithWeakProxy:(id)a3;
+ (id)createServiceIdentifierForToken:(id)a3;
+ (id)getMicroLocationInternalVersion;
+ (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5;
+ (id)metadataForHomekitAccessoryControlEventWithUUID:(id)a3 stateString:(id)a4 serviceUUID:(id)a5 serviceType:(id)a6 characteristicType:(id)a7 serviceGroupUUID:(id)a8 source:(id)a9 roomUUID:(id)a10;
+ (id)metadataForHomekitActionSetEventWithUUID:(id)a3 name:(id)a4 type:(id)a5 clientName:(id)a6 source:(id)a7 homeName:(id)a8;
+ (void)createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4 reply:(id)a5;
+ (void)deleteServiceWithIdentifier:(id)a3 reply:(id)a4;
+ (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5;
+ (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6;
+ (void)exportDatabaseWithReply:(id)a3;
+ (void)purgeDatabaseWithReply:(id)a3;
+ (void)queryServicesWithReply:(id)a3;
+ (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3;
+ (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4;
- (BOOL)interrupted;
- (NSString)_xpcInvalidationHandler;
- (NSUUID)legacyServiceIdentifier;
- (NSUUID)serviceIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (ULConnection)initWithDelegate:(id)a3 serviceIdentifier:(id)a4;
- (ULConnectionDelegate)delegate;
- (ULDarwinNotificationHelper)darwinNotificationHelper;
- (ULServiceStatus)serviceStatus;
- (ULUpdateConfiguration)updateConfiguration;
- (id)connect;
- (id)disconnect;
- (id)labelRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4;
- (id)requestAllModelsLearning;
- (id)requestObservation;
- (id)requestPrediction;
- (id)startUpdatingWithConfiguration:(id)a3;
- (id)stopUpdating;
- (uint64_t)_xpcInterruptionHandler;
- (void)_checkAndRecoverIfNeeded;
- (void)_invalidate;
- (void)_manageConnectionAvailableNotificationObservation:(BOOL)a3;
- (void)_performAsyncOnDelegateQueueIfRespondsToSelector:(SEL)a3 block:(id)a4;
- (void)_xpcInterruptionHandler;
- (void)_xpcInvalidationHandler;
- (void)dealloc;
- (void)didCompleteObservationWithMetaInformation:(id)a3;
- (void)didCompletePredictionWithMetaInformation:(id)a3;
- (void)didCompleteRequest:(id)a3 withError:(id)a4;
- (void)didCreateCustomLocationOfInterestWithError:(id)a3;
- (void)didFailWithError:(id)a3;
- (void)didRemoveCustomLocationOfInterestWithIdentifier:(id)a3 withError:(id)a4;
- (void)didSendGenericEvent:(unint64_t)a3 withDescription:(id)a4;
- (void)didUpdatePrediction:(id)a3;
- (void)didUpdateServiceStatus:(id)a3;
- (void)disableMicrolocationAtlocationWithIdentifier:(id)a3;
- (void)enableMicrolocationAtCurrentLocation;
- (void)enableMicrolocationAtCurrentLocationWithConfiguration:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDarwinNotificationHelper:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setLegacyServiceIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceStatus:(id)a3;
- (void)setUpdateConfiguration:(id)a3;
- (void)updateLegacyServiceIdentifier:(id)a3;
@end

@implementation ULConnection

- (ULConnection)initWithDelegate:(id)a3 serviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ULConnection;
  v8 = [(ULConnection *)&v19 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ULConnection.queue", v9);
    [(ULConnection *)v8 setQueue:v10];

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.ULConnection.delegateQueue", v11);
    [(ULConnection *)v8 setDelegateQueue:v12];

    v13 = [(ULConnection *)v8 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke;
    block[3] = &unk_2653F7CA8;
    v16 = v8;
    id v17 = v6;
    id v18 = v7;
    dispatch_sync(v13, block);
  }
  return v8;
}

void __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setServiceIdentifier:*(void *)(a1 + 48)];
  v2 = (void *)[objc_alloc(MEMORY[0x263F55820]) initWithObject:*(void *)(a1 + 32)];
  v3 = +[ULConnection _createNSXPCConnectionWithWeakProxy:v2];
  [*(id *)(a1 + 32) setConnection:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F55808]);
  [*(id *)(a1 + 32) setDarwinNotificationHelper:v4];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = [*(id *)(a1 + 32) connection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_2;
  v14[3] = &unk_2653F7C80;
  objc_copyWeak(&v15, &location);
  [v5 setInterruptionHandler:v14];

  id v6 = [*(id *)(a1 + 32) connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_3;
  v12[3] = &unk_2653F7C80;
  objc_copyWeak(&v13, &location);
  [v6 setInvalidationHandler:v12];

  id v7 = [*(id *)(a1 + 32) connection];
  v8 = [*(id *)(a1 + 32) queue];
  [v7 _setQueue:v8];

  [*(id *)(a1 + 32) _manageConnectionAvailableNotificationObservation:1];
  v9 = [*(id *)(a1 + 32) connection];
  [v9 resume];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  dispatch_queue_t v10 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_256309000, v10, OS_LOG_TYPE_DEFAULT, "Initialized a new MiLo connection", v11, 2u);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained queue];
    dispatch_assert_queue_V2(v2);

    [v3 _xpcInterruptionHandler];
    id WeakRetained = v3;
  }
}

void __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained queue];
    dispatch_assert_queue_V2(v2);

    [v3 _xpcInvalidationHandler];
    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  [(ULConnection *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ULConnection;
  [(ULConnection *)&v3 dealloc];
}

+ (id)createServiceIdentifierForToken:(id)a3
{
  v33[7] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v32[0] = @"com.apple.intelligentroutingd";
  v30[0] = @"com.apple.mediaremoted";
  v30[1] = @"com.apple.Music";
  v31[0] = @"00000000-0000-0000-0000-000000000001";
  v31[1] = @"00000000-0000-0000-0000-000000000002";
  v30[2] = @"com.apple.TelephonyUtilities";
  v30[3] = @"com.apple.controlcenter";
  v31[2] = @"00000000-0000-0000-0000-000000000003";
  v31[3] = @"00000000-0000-0000-0000-000000000004";
  v30[4] = @"com.apple.AVKit.RoutePickerViewService";
  v30[5] = @"com.apple.tvremoted";
  v31[4] = @"00000000-0000-0000-0000-000000000005";
  v31[5] = @"00000000-0000-0000-0000-000000000006";
  v30[6] = @"com.apple.NeighborhoodActivityConduitService";
  v30[7] = @"com.apple.intelligentroutingclient.Media";
  v31[6] = @"00000000-0000-0000-0000-000000000007";
  v31[7] = @"00000000-0000-0000-0000-000000000008";
  v30[8] = @"com.apple.intelligentroutingclient.AppleTVControl";
  v30[9] = @"com.apple.IntelligentRoutingHostTests.xctrunner";
  v31[8] = @"00000000-0000-0000-0000-000000000009";
  v31[9] = @"00000000-0000-0000-0000-000000000010";
  id v4 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:10];
  v33[0] = v4;
  v32[1] = @"com.apple.MicroLocationHostTests.xctrunner";
  v28 = @"com.apple.MicroLocationHostTests.xctrunner";
  v29 = @"00000000-0000-0000-0000-000000000011";
  v5 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v33[1] = v5;
  v32[2] = @"com.apple.microlocationclient";
  v26[0] = @"com.apple.MicroLocationClientUnsupervised";
  v26[1] = @"com.apple.MicroLocationClientBinaryDetection";
  v27[0] = @"00000000-0000-0000-0000-000000000012";
  v27[1] = @"00000000-0000-0000-0000-000000000013";
  v26[2] = @"com.apple.MicroLocationClientMultiClass";
  v26[3] = @"com.apple.MicroLocationClientLSL";
  v27[2] = @"00000000-0000-0000-0000-000000000014";
  v27[3] = @"00000000-0000-0000-0000-000000000015";
  id v6 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  v33[2] = v6;
  v32[3] = @"com.apple.MiLoDataCollection";
  v24 = @"com.apple.MiLoDataCollection";
  v25 = @"00000000-0000-0000-0000-000000000019";
  id v7 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v33[3] = v7;
  v32[4] = @"com.apple.MiLoLSL";
  v22 = @"com.apple.MiLoLSL";
  v23 = @"00000000-0000-0000-0000-000000000018";
  v8 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v33[4] = v8;
  v32[5] = @"com.apple.MiLoWiFiHeatmap";
  v20 = @"com.apple.MiLoWiFiHeatmap";
  v21 = @"00000000-0000-0000-0000-000000000020";
  v9 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v33[5] = v9;
  v32[6] = @"com.apple.MiLoPlaceholderApp";
  id v18 = @"com.apple.MiLoPlaceholderApp";
  objc_super v19 = @"00000000-0000-0000-0000-000000000021";
  dispatch_queue_t v10 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v33[6] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:7];

  dispatch_queue_t v12 = [MEMORY[0x263F08D68] signingIdentityForSelf];
  if (v12)
  {
    id v13 = [v11 objectForKeyedSubscript:v12];
    v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:v3];
      if (v15) {
        v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v15];
      }
      else {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4 reply:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)dispatch_queue_t v10 = 0;
    _os_log_impl(&dword_256309000, v8, OS_LOG_TYPE_ERROR, "Creating a service is not supported, only static tokens are supported", v10, 2u);
  }
  v9 = [MEMORY[0x263F087E8] errorWithDomain:@"ULLogicDomain" code:21 userInfo:0];
  v7[2](v7, 0, v9);
}

+ (void)deleteServiceWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_256309000, v7, OS_LOG_TYPE_DEFAULT, "Deleting service:%@", buf, 0xCu);
  }
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_create("com.apple.MicroLocation.deleteServiceWithIdentifier", v8);

  dispatch_queue_t v10 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v10 resume];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke;
  block[3] = &unk_2653F7CF8;
  id v15 = v10;
  id v16 = v5;
  id v17 = v6;
  id v11 = v6;
  id v12 = v5;
  id v13 = v10;
  dispatch_async(v9, block);
}

void __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_2653F7CD0;
  id v5 = v3;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  [v2 deleteServiceWithIdentifier:v5 reply:v4];
}

void __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = [v3 localizedDescription];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_256309000, v6, OS_LOG_TYPE_DEFAULT, "Deleting service, identifier: %@, error:%@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

- (id)connect
{
  id v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v4 = [(ULConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23__ULConnection_connect__block_invoke;
  v7[3] = &unk_2653F7D20;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __23__ULConnection_connect__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "connect", v10, 2u);
  }
  [*(id *)(a1 + 32) _checkAndRecoverIfNeeded];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) connection];
  id v7 = [v6 remoteObjectProxy];
  uint64_t v8 = [*(id *)(a1 + 32) serviceIdentifier];
  uint64_t v9 = [*(id *)(a1 + 32) legacyServiceIdentifier];
  [v7 connectWithServiceIdentifier:v8 legacyServiceIdentifier:v9 andRequestIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)disconnect
{
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v4 = [(ULConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __26__ULConnection_disconnect__block_invoke;
  v7[3] = &unk_2653F7D20;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __26__ULConnection_disconnect__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "disconnect", v9, 2u);
  }
  [*(id *)(a1 + 32) _checkAndRecoverIfNeeded];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) connection];
  id v7 = [v6 remoteObjectProxy];
  [v7 disconnectWithRequestIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  [*(id *)(a1 + 32) setServiceStatus:0];
  return [*(id *)(a1 + 32) setUpdateConfiguration:0];
}

- (id)requestPrediction
{
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v4 = [(ULConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__ULConnection_requestPrediction__block_invoke;
  v7[3] = &unk_2653F7D20;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__ULConnection_requestPrediction__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "requestPrediction", v8, 2u);
  }
  [*(id *)(a1 + 32) _checkAndRecoverIfNeeded];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) connection];
  id v7 = [v6 remoteObjectProxy];
  [v7 requestPredictionWithRequestIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)requestObservation
{
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v4 = [(ULConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__ULConnection_requestObservation__block_invoke;
  v7[3] = &unk_2653F7D20;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __34__ULConnection_requestObservation__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "requestObservation", v8, 2u);
  }
  [*(id *)(a1 + 32) _checkAndRecoverIfNeeded];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) connection];
  id v7 = [v6 remoteObjectProxy];
  [v7 requestObservationWithRequestIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)labelRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v9 = [(ULConnection *)self queue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__ULConnection_labelRequestIdentifier_withPlaceIdentifier___block_invoke;
  v14[3] = &unk_2653F7D48;
  id v15 = v6;
  id v16 = v7;
  id v17 = self;
  id v18 = &v19;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, v14);

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __59__ULConnection_labelRequestIdentifier_withPlaceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138412546;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "labelRequestIdentifier: %@, withPlaceIdentifier: %@", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 48) _checkAndRecoverIfNeeded];
  uint64_t v5 = [MEMORY[0x263F08C38] UUID];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 48) connection];
  uint64_t v9 = [v8 remoteObjectProxy];
  [v9 labelRequestIdentifier:*(void *)(a1 + 32) withPlaceIdentifier:*(void *)(a1 + 40) withReturnIdentifier:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
}

- (id)startUpdatingWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v6 = [(ULConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ULConnection_startUpdatingWithConfiguration___block_invoke;
  block[3] = &unk_2653F7D70;
  id v11 = v4;
  __int16 v12 = self;
  uint64_t v13 = &v14;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __47__ULConnection_startUpdatingWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "startUpdatingWithConfiguration: %@", (uint8_t *)&v10, 0xCu);
  }
  [*(id *)(a1 + 40) _checkAndRecoverIfNeeded];
  uint64_t v4 = [MEMORY[0x263F08C38] UUID];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 40) connection];
  id v8 = [v7 remoteObjectProxy];
  [v8 startUpdatingWithConfiguration:*(void *)(a1 + 32) withRequestIdentifier:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  uint64_t v9 = (void *)[*(id *)(a1 + 32) copy];
  [*(id *)(a1 + 40) setUpdateConfiguration:v9];
}

- (id)stopUpdating
{
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v4 = [(ULConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__ULConnection_stopUpdating__block_invoke;
  v7[3] = &unk_2653F7D20;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __28__ULConnection_stopUpdating__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "stopUpdating", v9, 2u);
  }
  [*(id *)(a1 + 32) _checkAndRecoverIfNeeded];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) connection];
  id v7 = [v6 remoteObjectProxy];
  [v7 stopUpdatingWithRequestIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  return [*(id *)(a1 + 32) setUpdateConfiguration:0];
}

- (void)enableMicrolocationAtCurrentLocation
{
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v3);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  uint64_t v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_256309000, v4, OS_LOG_TYPE_DEFAULT, "Legacy SPI request, enableMicrolocationAtCurrentLocation, default to enable in room detection", v6, 2u);
  }
  id v5 = [[ULCustomLoiConfiguration alloc] initWithEnableInRoomDetection:1];
  [(ULConnection *)self enableMicrolocationAtCurrentLocationWithConfiguration:v5];
}

- (void)enableMicrolocationAtCurrentLocationWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = [(ULConnection *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__ULConnection_enableMicrolocationAtCurrentLocationWithConfiguration___block_invoke;
  v8[3] = &unk_2653F7D98;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __70__ULConnection_enableMicrolocationAtCurrentLocationWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "enableMicrolocationAtCurrentLocationWithConfiguration %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) connection];
  id v5 = [v4 remoteObjectProxy];
  [v5 createCustomLocationOfInterestAtCurrentLocationWithConfiguration:*(void *)(a1 + 32)];
}

- (void)didUpdateServiceStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __39__ULConnection_didUpdateServiceStatus___block_invoke;
  uint64_t v11 = &unk_2653F7D98;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didUpdateServiceStatus_ block:&v8];
  uint64_t v7 = objc_msgSend(v6, "copy", v8, v9, v10, v11, v12);
  [(ULConnection *)self setServiceStatus:v7];
}

void __39__ULConnection_didUpdateServiceStatus___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didUpdateServiceStatus:*(void *)(a1 + 40)];
}

- (void)didUpdatePrediction:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ULConnection_didUpdatePrediction___block_invoke;
  v7[3] = &unk_2653F7D98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didUpdatePrediction_ block:v7];
}

void __36__ULConnection_didUpdatePrediction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didUpdatePrediction:*(void *)(a1 + 40)];
}

- (void)didCompleteRequest:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v8);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__ULConnection_didCompleteRequest_withError___block_invoke;
  v11[3] = &unk_2653F7CA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didCompleteRequest_withError_ block:v11];
}

void __45__ULConnection_didCompleteRequest_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didCompleteRequest:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)didCreateCustomLocationOfInterestWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__ULConnection_didCreateCustomLocationOfInterestWithError___block_invoke;
  v7[3] = &unk_2653F7D98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didEnableMicrolocationAtCurrentLocationWithError_ block:v7];
}

void __59__ULConnection_didCreateCustomLocationOfInterestWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didEnableMicrolocationAtCurrentLocationWithError:*(void *)(a1 + 40)];
}

- (void)didRemoveCustomLocationOfInterestWithIdentifier:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v8);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__ULConnection_didRemoveCustomLocationOfInterestWithIdentifier_withError___block_invoke;
  v11[3] = &unk_2653F7CA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didDisableMicrolocationAtLocationWithIdentifier_withError_ block:v11];
}

void __74__ULConnection_didRemoveCustomLocationOfInterestWithIdentifier_withError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didDisableMicrolocationAtLocationWithIdentifier:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __33__ULConnection_didFailWithError___block_invoke;
  id v10 = &unk_2653F7D98;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didFailWithError_ block:&v7];
  [(ULConnection *)self _invalidate];
}

void __33__ULConnection_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)didSendGenericEvent:(unint64_t)a3 withDescription:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__ULConnection_didSendGenericEvent_withDescription___block_invoke;
  v9[3] = &unk_2653F7DC0;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didSendGenericEvent_withDescription_ block:v9];
}

void __52__ULConnection_didSendGenericEvent_withDescription___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didSendGenericEvent:*(void *)(a1 + 48) withDescription:*(void *)(a1 + 40)];
}

- (void)didCompleteObservationWithMetaInformation:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ULConnection_didCompleteObservationWithMetaInformation___block_invoke;
  v7[3] = &unk_2653F7D98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didCompleteObservationWithMetaInformation_ block:v7];
}

void __58__ULConnection_didCompleteObservationWithMetaInformation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didCompleteObservationWithMetaInformation:*(void *)(a1 + 40)];
}

- (void)didCompletePredictionWithMetaInformation:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ULConnection_didCompletePredictionWithMetaInformation___block_invoke;
  v7[3] = &unk_2653F7D98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ULConnection *)self _performAsyncOnDelegateQueueIfRespondsToSelector:sel_connection_didCompletePredictionWithMetaInformation_ block:v7];
}

void __57__ULConnection_didCompletePredictionWithMetaInformation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didCompletePredictionWithMetaInformation:*(void *)(a1 + 40)];
}

+ (id)_createNSXPCConnectionWithWeakProxy:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08D68];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithMachServiceName:@"com.apple.milod.xpc.service" options:4096];
  id v6 = +[ULXPCProtocols responseInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:v4];
  uint64_t v7 = +[ULXPCProtocols requestInterface];
  [v5 setRemoteObjectInterface:v7];

  return v5;
}

- (void)_xpcInterruptionHandler
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ULConnection *)self interrupted])
  {
    -[ULConnection _xpcInterruptionHandler]();
  }
  else if (onceToken_MicroLocation_Default == -1)
  {
    goto LABEL_3;
  }
  dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
LABEL_3:
  id v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [(ULConnection *)self connection];
    uint64_t v7 = [v6 signingIdentity];
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_256309000, v5, OS_LOG_TYPE_DEFAULT, "%@: connection interrupted", buf, 0xCu);
  }
  id v8 = [(ULConnection *)self serviceStatus];
  [v8 updateServiceState:1];

  id v9 = [(ULConnection *)self serviceStatus];
  id v10 = [[ULServiceSuspendReason alloc] initWithSuspendReasonEnum:4];
  id v13 = v10;
  unint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  [v9 updateServiceSuspendReasons:v11];

  id v12 = [(ULConnection *)self serviceStatus];
  [(ULConnection *)self didUpdateServiceStatus:v12];

  [(ULConnection *)self setInterrupted:1];
}

- (void)_xpcInvalidationHandler
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ULConnection *)self interrupted])
  {
    -[ULConnection _xpcInvalidationHandler]();
  }
  else if (onceToken_MicroLocation_Default == -1)
  {
    goto LABEL_3;
  }
  dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
LABEL_3:
  id v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [(ULConnection *)self connection];
    uint64_t v7 = [v6 signingIdentity];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_256309000, v5, OS_LOG_TYPE_DEFAULT, "%@: connection invalidated", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ULLogicDomain" code:0 userInfo:0];
  [(ULConnection *)self didFailWithError:v8];
}

- (void)_invalidate
{
  uint64_t v3 = [(ULConnection *)self connection];
  [v3 setInterruptionHandler:0];

  id v4 = [(ULConnection *)self connection];
  [v4 setInvalidationHandler:0];

  id v5 = [(ULConnection *)self connection];
  [v5 invalidate];

  [(ULConnection *)self setConnection:0];

  [(ULConnection *)self _manageConnectionAvailableNotificationObservation:0];
}

- (void)_manageConnectionAvailableNotificationObservation:(BOOL)a3
{
  if (a3)
  {
    objc_initWeak(&location, self);
    id v4 = [(ULConnection *)self darwinNotificationHelper];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke;
    v6[3] = &unk_2653F7C80;
    objc_copyWeak(&v7, &location);
    [v4 addObserverForNotificationName:@"ULConnectionAvailableNotification" handler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(ULConnection *)self darwinNotificationHelper];
    [v5 removeObserverForNotificationName:@"ULConnectionAvailableNotification"];
  }
}

void __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke_2;
    block[3] = &unk_2653F7DE8;
    void block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke_2(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "Handling connection available notification", v4, 2u);
  }
  return [*(id *)(a1 + 32) _checkAndRecoverIfNeeded];
}

- (void)_performAsyncOnDelegateQueueIfRespondsToSelector:(SEL)a3 block:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(ULConnection *)self delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
    }
    int v9 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      uint64_t v11 = NSStringFromSelector(a3);
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_256309000, v10, OS_LOG_TYPE_DEFAULT, "Performing block for selector: %@", (uint8_t *)&v13, 0xCu);
    }
    id v12 = [(ULConnection *)self delegateQueue];
    dispatch_async(v12, v6);
  }
}

- (void)_checkAndRecoverIfNeeded
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ULConnection *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ULConnection *)self interrupted])
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
    }
    id v4 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = [(ULConnection *)self serviceStatus];
      id v7 = [(ULConnection *)self updateConfiguration];
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      _os_log_impl(&dword_256309000, v5, OS_LOG_TYPE_DEFAULT, "Recovering: serviceStatus: %@, updateConfiguration: %@", (uint8_t *)&v18, 0x16u);
    }
    id v8 = [(ULConnection *)self connection];
    int v9 = [v8 remoteObjectProxy];
    id v10 = [(ULConnection *)self serviceIdentifier];
    uint64_t v11 = [(ULConnection *)self legacyServiceIdentifier];
    id v12 = [MEMORY[0x263F08C38] UUID];
    [v9 connectWithServiceIdentifier:v10 legacyServiceIdentifier:v11 andRequestIdentifier:v12];

    int v13 = [(ULConnection *)self updateConfiguration];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x263F08C38] UUID];
      uint64_t v15 = [(ULConnection *)self connection];
      uint64_t v16 = [v15 remoteObjectProxy];
      id v17 = [(ULConnection *)self updateConfiguration];
      [v16 startUpdatingWithConfiguration:v17 withRequestIdentifier:v14];
    }
    [(ULConnection *)self setInterrupted:0];
  }
}

- (ULConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ULConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSUUID)legacyServiceIdentifier
{
  return self->_legacyServiceIdentifier;
}

- (void)setLegacyServiceIdentifier:(id)a3
{
}

- (ULServiceStatus)serviceStatus
{
  return self->_serviceStatus;
}

- (void)setServiceStatus:(id)a3
{
}

- (ULUpdateConfiguration)updateConfiguration
{
  return self->_updateConfiguration;
}

- (void)setUpdateConfiguration:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (ULDarwinNotificationHelper)darwinNotificationHelper
{
  return self->_darwinNotificationHelper;
}

- (void)setDarwinNotificationHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationHelper, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updateConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceStatus, 0);
  objc_storeStrong((id *)&self->_legacyServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)exportDatabaseWithReply:(id)a3
{
  id v3 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256309000, v4, OS_LOG_TYPE_DEFAULT, "Exporting database", buf, 2u);
  }
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = dispatch_queue_create("com.apple.MicroLocation.exportDatabaseWithReply", v5);

  id v7 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v7 resume];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke;
  v10[3] = &unk_2653F7E38;
  id v11 = v7;
  id v12 = v3;
  id v8 = v3;
  id v9 = v7;
  dispatch_async(v6, v10);
}

void __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke_2;
  v3[3] = &unk_2653F7E10;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  [v2 exportDatabaseWithReply:v3];
}

void __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v6 localizedDescription];
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    int v13 = v9;
    _os_log_impl(&dword_256309000, v8, OS_LOG_TYPE_DEFAULT, "Export database response, URLS:%@, error:%@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)purgeDatabaseWithReply:(id)a3
{
  id v3 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256309000, v4, OS_LOG_TYPE_DEFAULT, "Purging database", buf, 2u);
  }
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = dispatch_queue_create("com.apple.MicroLocation.purgeDatabaseWithReply", v5);

  id v7 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v7 resume];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke;
  v10[3] = &unk_2653F7E38;
  id v11 = v7;
  id v12 = v3;
  id v8 = v3;
  id v9 = v7;
  dispatch_async(v6, v10);
}

void __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke_2;
  v3[3] = &unk_2653F7E60;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  [v2 purgeDatabaseWithReply:v3];
}

void __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 localizedDescription];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_256309000, v5, OS_LOG_TYPE_DEFAULT, "Purge database response, error:%@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)queryServicesWithReply:(id)a3
{
  id v3 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256309000, v4, OS_LOG_TYPE_DEFAULT, "Querying services", buf, 2u);
  }
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = dispatch_queue_create("com.apple.MicroLocation.queryServicesForClient", v5);

  int v7 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v7 resume];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke;
  v10[3] = &unk_2653F7E38;
  id v11 = v7;
  id v12 = v3;
  id v8 = v3;
  id v9 = v7;
  dispatch_async(v6, v10);
}

void __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke_2;
  v3[3] = &unk_2653F7E10;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  [v2 queryServicesWithReply:v3];
}

void __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  int v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v6 localizedDescription];
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    int v13 = v9;
    _os_log_impl(&dword_256309000, v8, OS_LOG_TYPE_DEFAULT, "Query services response:%@, error:%@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

- (id)requestAllModelsLearning
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = [(ULConnection *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__ULConnection_Diagnostic__requestAllModelsLearning__block_invoke;
  v6[3] = &unk_2653F7D20;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__ULConnection_Diagnostic__requestAllModelsLearning__block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "requestAllModelsLearning", v8, 2u);
  }
  [*(id *)(a1 + 32) _checkAndRecoverIfNeeded];
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) connection];
  uint64_t v7 = [v6 remoteObjectProxy];
  [v7 requestAllModelsLearningWithRequestIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)disableMicrolocationAtlocationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(ULConnection *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__ULConnection_Diagnostic__disableMicrolocationAtlocationWithIdentifier___block_invoke;
  v8[3] = &unk_2653F7D98;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __73__ULConnection_Diagnostic__disableMicrolocationAtlocationWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "disableMicrolocationAtlocationWithIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) connection];
  id v5 = [v4 remoteObjectProxy];
  [v5 removeCustomLocationOfInterestWithIdentifier:*(void *)(a1 + 32)];
}

+ (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v35 = a5;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  uint64_t v8 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSNumber;
    int v10 = v8;
    id v11 = [v9 numberWithBool:v6];
    *(_DWORD *)buf = 138412290;
    v58 = v11;
    _os_log_impl(&dword_256309000, v10, OS_LOG_TYPE_DEFAULT, "received recording scan request, forced: %@", buf, 0xCu);
  }
  id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.MicroLocation.getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation", v12);

  v33 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v33 resume];
  uint64_t v13 = [MEMORY[0x263F08C38] UUID];
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7 copyItems:1];
  id v32 = (id)v13;
  [v14 setValue:v13 forKey:@"private.MicroLocation.recordingTriggerUUID"];
  BOOL v36 = v6;
  if (v6) {
    uint64_t v15 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v15 = MEMORY[0x263EFFA80];
  }
  [v14 setValue:v15 forKey:@"private.MicroLocation.forced.recordingRequest"];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  v56[2] = objc_opt_class();
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v7;
  uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v38 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v51 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v20 = v39;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v47;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v47 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = [v14 objectForKeyedSubscript:v19];
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {

                goto LABEL_25;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        [v14 removeObjectForKey:v19];
LABEL_25:
        ;
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v17);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke;
  block[3] = &unk_2653F7EB0;
  id v41 = v33;
  id v42 = v14;
  BOOL v45 = v36;
  id v43 = obj;
  id v44 = v35;
  id v27 = v35;
  id v28 = obj;
  id v29 = v14;
  id v30 = v33;
  dispatch_async(queue, block);

  return v32;
}

void __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke_2;
  v5[3] = &unk_2653F7E88;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  [v2 getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:v4 shouldForceRecording:v3 handler:v5];
}

void __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = NSNumber;
    uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
    int v10 = v6;
    id v11 = [v8 numberWithBool:v9];
    id v12 = [NSNumber numberWithBool:a2];
    uint64_t v13 = [v5 localizedDescription];
    int v14 = 138413058;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_256309000, v10, OS_LOG_TYPE_DEFAULT, "get triggerUUID and request scan, information: %@, shouldForceRecording: %@, success: %@, error: %@", (uint8_t *)&v14, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

+ (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  int v10 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256309000, v10, OS_LOG_TYPE_DEFAULT, "received truth label donation request for a recording trigger", buf, 2u);
  }
  id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v12 = dispatch_queue_create("com.apple.MicroLocation.donateMicroLocationTruthTagWithTagUUID", v11);

  uint64_t v13 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v13 resume];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke;
  v18[3] = &unk_2653F7ED8;
  id v19 = v13;
  id v20 = v7;
  id v21 = v8;
  id v22 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  id v17 = v13;
  dispatch_async(v12, v18);
}

void __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke_2;
  v5[3] = &unk_2653F7E60;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 32);
  [v2 donateMicroLocationTruthTagWithTagUUID:v3 correspondingToTriggerUUID:v4 handler:v5];
}

void __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  uint64_t v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 localizedDescription];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_256309000, v5, OS_LOG_TYPE_DEFAULT, "donate truth tagUUID with corresponding triggerUUID, error:%@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  uint64_t v13 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256309000, v13, OS_LOG_TYPE_DEFAULT, "received truth label donation request between Dates", buf, 2u);
  }
  id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v15 = dispatch_queue_create("com.apple.MicroLocation.donateMicroLocationTruthTagWithTagUUID", v14);

  id v16 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v16 resume];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke;
  block[3] = &unk_2653F7F00;
  id v23 = v10;
  id v24 = v11;
  id v26 = v9;
  id v27 = v12;
  id v25 = v16;
  id v17 = v9;
  id v18 = v16;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  dispatch_async(v15, block);
}

void __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) compare:*(void *)(a1 + 40)] == 1)
  {
    uint64_t v2 = *(void *)(a1 + 64);
    if (!v2) {
      return;
    }
    id v3 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"donateTruthTagLabelForClient failed because startDate is later than endDate";
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v5 = (void *)[v3 initWithDomain:@"ULConnectionDomain" code:38 userInfo:v4];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) remoteObjectProxy];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke_2;
    v10[3] = &unk_2653F7E60;
    uint64_t v9 = *(void *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 48);
    [v6 donateMicroLocationTruthTagWithTagUUID:v9 forRecordingEventsBetweenDate:v7 andDate:v8 handler:v10];

    uint64_t v4 = v12;
  }
}

void __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  uint64_t v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 localizedDescription];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_256309000, v5, OS_LOG_TYPE_DEFAULT, "donate truth tagUUID between dates, error:%@", (uint8_t *)&v7, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

+ (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4
{
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = a3;
  uint64_t v8 = dispatch_queue_create("com.apple.MicroLocation.requestMicroLocationRecordingScanWithAdditionalInformation", v6);

  uint64_t v9 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v9 resume];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  id v10 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v7 copyItems:1];

  id v17 = v10;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__ULConnection_Legacy__requestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording___block_invoke;
  block[3] = &unk_2653F7F28;
  BOOL v15 = a4;
  id v13 = v9;
  id v14 = v16;
  id v11 = v9;
  dispatch_async(v8, block);

  _Block_object_dispose(v16, 8);
}

void __104__ULConnection_Legacy__requestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording___block_invoke(uint64_t a1)
{
  v36[3] = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyItems:1];
  id v6 = v5;
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v7 = MEMORY[0x263EFFA80];
  }
  [v5 setValue:v7 forKey:@"private.MicroLocation.forced.recordingRequest"];
  uint64_t v8 = [v6 objectForKey:@"private.MicroLocation.recordingTriggerUUID"];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    [v6 setValue:v9 forKey:@"private.MicroLocation.recordingTriggerUUID"];
  }
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v22 = a1;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = v25;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, v22);
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {

                goto LABEL_23;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        [v6 removeObjectForKey:v13];
LABEL_23:
        ;
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  id v21 = [*(id *)(v22 + 32) remoteObjectProxy];
  [v21 requestMicroLocationRecordingScanWithAdditionalInformation:v6];
}

+ (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3
{
  id v3 = a3;
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  uint64_t v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256309000, v4, OS_LOG_TYPE_DEFAULT, "received localization scan request", buf, 2u);
  }
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = dispatch_queue_create("com.apple.MicroLocation.requestCurrentMicroLocationWithAdditionalInformation", v5);

  uint64_t v7 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v7 resume];
  *(void *)buf = 0;
  uint64_t v13 = buf;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = (id)[objc_alloc(NSDictionary) initWithDictionary:v3 copyItems:1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__ULConnection_Legacy__requestCurrentMicroLocationWithAdditionalInformation___block_invoke;
  v9[3] = &unk_2653F7F50;
  id v10 = v7;
  uint64_t v11 = buf;
  id v8 = v7;
  dispatch_async(v6, v9);

  _Block_object_dispose(buf, 8);
}

void __77__ULConnection_Legacy__requestCurrentMicroLocationWithAdditionalInformation___block_invoke(uint64_t a1)
{
  v29[2] = *MEMORY[0x263EF8340];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copyItems:1];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v15 = a1;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * v5);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v7 = v18;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v20;
          while (2)
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = objc_msgSend(v2, "objectForKeyedSubscript:", v6, v15);
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {

                goto LABEL_16;
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        [v2 removeObjectForKey:v6];
LABEL_16:
        ++v5;
      }
      while (v5 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  uint64_t v14 = [*(id *)(v15 + 32) remoteObjectProxy];
  [v14 requestCurrentMicroLocationWithAdditionalInformation:v2];
}

+ (id)getMicroLocationInternalVersion
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  id v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256309000, v2, OS_LOG_TYPE_DEFAULT, "received internal version get request", buf, 2u);
  }
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = dispatch_queue_create("com.apple.MicroLocation.getMicroLocationInternalVersion", v3);

  uint64_t v5 = +[ULConnection _createNSXPCConnectionWithWeakProxy:0];
  [v5 resume];
  *(void *)buf = 0;
  long long v19 = buf;
  uint64_t v20 = 0x3032000000;
  long long v21 = __Block_byref_object_copy_;
  long long v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke;
  block[3] = &unk_2653F7FA0;
  id v7 = v5;
  id v15 = v7;
  uint64_t v17 = buf;
  uint64_t v8 = v6;
  uint64_t v16 = v8;
  dispatch_async(v4, block);
  dispatch_time_t v9 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v8, v9);
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  }
  uint64_t v10 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*((id *)v19 + 5) UTF8String];
    uint64_t v24 = 68289282;
    __int16 v25 = 2082;
    long long v26 = &unk_2563189C3;
    __int16 v27 = 2082;
    uint64_t v28 = v11;
    _os_log_impl(&dword_256309000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation Internal Version request\", \"version\":%{public, location:escape_only}s}", (uint8_t *)&v24, 0x1Cu);
  }

  id v12 = *((id *)v19 + 5);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke_2;
  v4[3] = &unk_2653F7F78;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  [v2 getMicroLocationInternalVersionWithReply:v4];
}

void __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  [*(id *)(a1 + 40) invalidate];
}

+ (id)metadataForHomekitActionSetEventWithUUID:(id)a3 name:(id)a4 type:(id)a5 clientName:(id)a6 source:(id)a7 homeName:(id)a8
{
  uint64_t v13 = (objc_class *)MEMORY[0x263EFF9A0];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(v13);
  [v20 setValue:v19 forKey:@"private.HomeKit.scene.actionSetUUID"];

  [v20 setValue:v18 forKey:@"private.HomeKit.scene.actionSetName"];
  [v20 setValue:v17 forKey:@"private.HomeKit.scene.actionSetType"];

  [v20 setValue:v16 forKey:@"private.HomeKit.scene.clientName"];
  [v20 setValue:v15 forKey:@"private.HomeKit.scene.source"];

  [v20 setValue:v14 forKey:@"private.HomeKit.scene.homeName"];

  return v20;
}

+ (id)metadataForHomekitAccessoryControlEventWithUUID:(id)a3 stateString:(id)a4 serviceUUID:(id)a5 serviceType:(id)a6 characteristicType:(id)a7 serviceGroupUUID:(id)a8 source:(id)a9 roomUUID:(id)a10
{
  id v16 = (objc_class *)MEMORY[0x263EFF9A0];
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = objc_alloc_init(v16);
  [v25 setValue:v24 forKey:@"private.HomeKit.accessory.accessoryUUID"];

  [v25 setValue:v23 forKey:@"private.HomeKit.accessory.stateString"];
  [v25 setValue:v22 forKey:@"private.HomeKit.accessory.serviceUUID"];

  [v25 setValue:v21 forKey:@"private.HomeKit.accessory.serviceType"];
  [v25 setValue:v20 forKey:@"private.HomeKit.accessory.characteristicType"];

  [v25 setValue:v19 forKey:@"private.HomeKit.accessory.serviceGroupUUID"];
  [v25 setValue:v18 forKey:@"private.HomeKit.accessory.source"];

  [v25 setValue:v17 forKey:@"private.HomeKit.accessory.roomUUID"];

  return v25;
}

- (void)updateLegacyServiceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ULConnection *)self queue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(ULConnection *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__ULConnection_Legacy__updateLegacyServiceIdentifier___block_invoke;
  v8[3] = &unk_2653F7D98;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __54__ULConnection_Legacy__updateLegacyServiceIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLegacyServiceIdentifier:*(void *)(a1 + 40)];
}

- (uint64_t)_xpcInterruptionHandler
{
  v0 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_256309000, v1, v2, "{\"msg%{public}.0s\":\"Interruption handler called twice\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v22, v23, v24, v25, v26);
  }

  id v7 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_signpost_enabled(v7))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_256309000, v8, v9, v10, "Interruption handler called twice", "{\"msg%{public}.0s\":\"Interruption handler called twice\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v22, v23, v24, v25, v26);
  }

  uint64_t v13 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_256309000, v14, v15, "{\"msg%{public}.0s\":\"Interruption handler called twice\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v22, v23, v24, v25, v26);
  }

  uint64_t v20 = abort_report_np();
  return -[ULConnection _xpcInvalidationHandler](v20);
}

- (NSString)_xpcInvalidationHandler
{
  v0 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_256309000, v1, v2, "{\"msg%{public}.0s\":\"Invalidation handler called after interruption handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v22, v23, v24, v25, v26);
  }

  id v7 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_signpost_enabled(v7))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_256309000, v8, v9, v10, "Invalidation handler called after interruption handler", "{\"msg%{public}.0s\":\"Invalidation handler called after interruption handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v22, v23, v24, v25, v26);
  }

  uint64_t v13 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_256309000, v14, v15, "{\"msg%{public}.0s\":\"Invalidation handler called after interruption handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v22, v23, v24, v25, v26);
  }

  uint64_t v20 = (objc_class *)abort_report_np();
  return NSStringFromClass(v20);
}

@end