@interface SOSCoordinator
+ (SOSCoordinator)sharedInstance;
- (BOOL)_sendUrgentMessageToPairedDevice:(id)a3 retries:(id)a4;
- (BOOL)isIncomingMessageValidHandoffAck:(id)a3;
- (BOOL)isIncomingMessageValidSOSHandoff:(id)a3;
- (BOOL)isPairedDeviceNearby;
- (BOOL)processEventWithUUID:(id)a3 triggerMechanism:(int64_t)a4;
- (BOOL)sendUrgentMessageToPairedDevice:(id)a3;
- (BOOL)shouldHandoffToPairedDevice:(int64_t)a3;
- (BOOL)shouldRetryMessage:(id)a3;
- (BOOL)tryPushToPairedDeviceWithUUID:(id)a3 triggerMechanism:(int64_t)a4;
- (NSHashTable)observers;
- (SOSCoordinator)init;
- (SOSCoreAnalyticsReporting)coreAnalyticsReporter;
- (id)effectivePairedDevice;
- (int64_t)SOSCoordinationMessageTypeForString:(id)a3;
- (int64_t)sourceDevice;
- (void)_handleServiceUpdate:(id)a3;
- (void)_updateStateForPairedDevice:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleSOSMessageTypeHandoffSOS:(id)a3;
- (void)handleSOSMessageTypeHandoffSOSAck:(id)a3;
- (void)handleSOSMessageTypeProgressionSync:(id)a3;
- (void)removeObserver:(id)a3;
- (void)reportHandoff:(int64_t)a3 result:(int64_t)a4;
- (void)sendAckToHandoffMessage:(id)a3 success:(BOOL)a4;
- (void)sendUpdateToObserversWithStatus:(id)a3 progression:(int64_t)a4 shouldHandleThirdParty:(BOOL)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setCoreAnalyticsReporter:(id)a3;
- (void)setObservers:(id)a3;
- (void)syncProgressionWithPairedDevice:(int64_t)a3 sosStatus:(id)a4;
@end

@implementation SOSCoordinator

+ (SOSCoordinator)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SOSCoordinator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_inst;

  return (SOSCoordinator *)v2;
}

uint64_t __32__SOSCoordinator_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_inst = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (SOSCoordinator)init
{
  v23.receiver = self;
  v23.super_class = (Class)SOSCoordinator;
  v2 = [(SOSCoordinator *)&v23 init];
  if (v2)
  {
    v3 = sos_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, init", v22, 2u);
    }

    v4 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.soscoordination"];
    [v4 addDelegate:v2 queue:MEMORY[0x1E4F14428]];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v4;
    id v6 = v4;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    processingEventUUIDs = v2->_processingEventUUIDs;
    v2->_processingEventUUIDs = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.private.coordination.eventUUIDArrayQueue", 0);
    eventUUIDArrayQueue = v2->_eventUUIDArrayQueue;
    v2->_eventUUIDArrayQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.private.coordination.pendingMessagesQueue", 0);
    pendingMessagesQueue = v2->_pendingMessagesQueue;
    v2->_pendingMessagesQueue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingMessagesById = v2->_pendingMessagesById;
    v2->_pendingMessagesById = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingMessageRetriesById = v2->_pendingMessageRetriesById;
    v2->_pendingMessageRetriesById = v15;

    uint64_t v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v17;

    uint64_t v19 = +[SOSCoreAnalyticsReporter sharedInstance];
    coreAnalyticsReporter = v2->_coreAnalyticsReporter;
    v2->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v19;
  }
  return v2;
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)SOSCoordinator;
  [(SOSCoordinator *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSCoordinator *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSCoordinator *)self observers];
  [v5 removeObject:v4];
}

- (BOOL)shouldHandoffToPairedDevice:(int64_t)a3
{
  if (a3 == 7)
  {
    id v4 = [(SOSCoordinator *)self effectivePairedDevice];
    id v5 = v4;
    if (v4)
    {
      if ([v4 isNearby])
      {
        BOOL v6 = 1;
LABEL_9:

        return v6;
      }
      uint64_t v7 = 3;
    }
    else
    {
      uint64_t v7 = 2;
    }
    [(SOSCoordinator *)self reportHandoff:7 result:v7];
    BOOL v6 = 0;
    goto LABEL_9;
  }
  [(SOSCoordinator *)self reportHandoff:a3 result:6];
  return 0;
}

- (BOOL)tryPushToPairedDeviceWithUUID:(id)a3 triggerMechanism:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = sos_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 UUIDString];
    int v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, New event, Trigger ID: %@", (uint8_t *)&v11, 0xCu);
  }
  BOOL v9 = [(SOSCoordinator *)self processEventWithUUID:v6 triggerMechanism:a4];

  return v9;
}

- (BOOL)processEventWithUUID:(id)a3 triggerMechanism:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = SOSStringForSOSTriggerMechanism(a4);
  [v7 setObject:v8 forKey:@"SOSCoordinationTriggerKey"];

  [v7 setObject:@"SOSCoordinationMessageTypeHandoffSOS" forKey:@"SOSCoordinationMessageTypeKey"];
  BOOL v9 = [v6 UUIDString];
  [v7 setObject:v9 forKey:@"SOSEventUUIDKey"];

  v10 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  eventProcessingSemaphore = self->_eventProcessingSemaphore;
  self->_eventProcessingSemaphore = v10;

  if ([(SOSCoordinator *)self sendUrgentMessageToPairedDevice:v7])
  {
    eventUUIDArrayQueue = self->_eventUUIDArrayQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke;
    block[3] = &unk_1E6064AA0;
    block[4] = self;
    id v13 = v6;
    id v28 = v13;
    dispatch_sync(eventUUIDArrayQueue, block);
    v14 = self->_eventProcessingSemaphore;
    dispatch_time_t v15 = dispatch_time(0, 8000000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      v16 = sos_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3A94000, v16, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,handoff unsuccessful, timed out before received ack", buf, 2u);
      }

      uint64_t v17 = self->_eventUUIDArrayQueue;
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke_331;
      objc_super v23 = &unk_1E6064AA0;
      v24 = self;
      id v25 = v13;
      dispatch_sync(v17, &v20);
      -[SOSCoordinator reportHandoff:result:](self, "reportHandoff:result:", a4, 5, v20, v21, v22, v23, v24);
    }
    else
    {
      if (self->_ackSuccess)
      {
        BOOL v18 = 1;
        [(SOSCoordinator *)self reportHandoff:a4 result:1];
        goto LABEL_10;
      }
      [(SOSCoordinator *)self reportHandoff:a4 result:4];
    }
    BOOL v18 = 0;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v18 = 0;
LABEL_11:

  return v18;
}

void __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [*(id *)(a1 + 40) UUIDString];
  [v1 addObject:v2];
}

void __56__SOSCoordinator_processEventWithUUID_triggerMechanism___block_invoke_331(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [*(id *)(a1 + 40) UUIDString];
  [v1 removeObject:v2];
}

- (void)syncProgressionWithPairedDevice:(int64_t)a3 sosStatus:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(SOSCoordinator *)self isPairedDeviceNearby])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:@"SOSMessageTypeProgressionSync" forKey:@"SOSCoordinationMessageTypeKey"];
    v8 = SOSStringForSOSProgression(a3);
    [v7 setObject:v8 forKey:@"SOSProgressionKey"];

    BOOL v9 = [[SOSMessagingStatus alloc] initWithSOSStatus:v6];
    v10 = sos_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(SOSMessagingStatus *)v9 description];
      int v14 = 138412290;
      dispatch_time_t v15 = v11;
      _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, sending messaging status %@", (uint8_t *)&v14, 0xCu);
    }
    if (v9)
    {
      v12 = [(SOSMessagingStatus *)v9 data];
      [v7 setObject:v12 forKey:@"SOSStatusKey"];

      [(SOSCoordinator *)self sendUrgentMessageToPairedDevice:v7];
    }
    else
    {
      id v13 = sos_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SOSCoordinator syncProgressionWithPairedDevice:sosStatus:]();
      }
    }
  }
  else
  {
    id v7 = sos_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, no paired device, not syncing SOSProgression", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v7 = a5;
  v8 = [v7 objectForKeyedSubscript:@"SOSCoordinationMessageTypeKey"];
  int64_t v9 = [(SOSCoordinator *)self SOSCoordinationMessageTypeForString:v8];

  switch(v9)
  {
    case 0:
      v10 = sos_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl(&dword_1B3A94000, v10, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,cannot handle SOSMessageTypeUnspecified!", v11, 2u);
      }

      break;
    case 1:
      [(SOSCoordinator *)self handleSOSMessageTypeHandoffSOS:v7];
      break;
    case 2:
      [(SOSCoordinator *)self handleSOSMessageTypeHandoffSOSAck:v7];
      break;
    case 4:
      [(SOSCoordinator *)self handleSOSMessageTypeProgressionSync:v7];
      break;
    default:
      break;
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = sos_default_log();
  uint64_t v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SOSCoordinator service:account:identifier:didSendWithSuccess:error:]((uint64_t)v14, (uint64_t)v15, v17);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v14;
    _os_log_impl(&dword_1B3A94000, v17, OS_LOG_TYPE_DEFAULT, "IDS didSendWithSuccess identifier=%@ Success!", buf, 0xCu);
  }

  if (v14)
  {
    BOOL v18 = [(NSMutableDictionary *)self->_pendingMessagesById objectForKeyedSubscript:v14];
    uint64_t v19 = [(NSMutableDictionary *)self->_pendingMessageRetriesById objectForKeyedSubscript:v14];
    uint64_t v20 = v19;
    if (!a6
      && [v19 integerValue] >= 1
      && [(SOSCoordinator *)self shouldRetryMessage:v18])
    {
      uint64_t v21 = sos_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = [v20 integerValue];
        *(_DWORD *)buf = 138412546;
        id v28 = v14;
        __int16 v29 = 1024;
        int v30 = v22;
        _os_log_impl(&dword_1B3A94000, v21, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, retrying failed message with id %@ and %d retries", buf, 0x12u);
      }

      objc_super v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "integerValue") - 1);
      [(SOSCoordinator *)self _sendUrgentMessageToPairedDevice:v18 retries:v23];
    }
    pendingMessagesQueue = self->_pendingMessagesQueue;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__SOSCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke;
    v25[3] = &unk_1E6064AA0;
    v25[4] = self;
    id v26 = v14;
    dispatch_sync(pendingMessagesQueue, v25);
  }
  else
  {
    BOOL v18 = sos_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SOSCoordinator service:account:identifier:didSendWithSuccess:error:]();
    }
  }
}

uint64_t __70__SOSCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  objc_super v3 = *(void **)(*(void *)(a1 + 32) + 56);

  return [v3 removeObjectForKey:v2];
}

- (BOOL)isIncomingMessageValidSOSHandoff:(id)a3
{
  objc_super v3 = [a3 objectForKeyedSubscript:@"SOSCoordinationTriggerKey"];
  id v4 = SOSStringForSOSTriggerMechanism(7uLL);
  char v5 = [v3 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = sos_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,received SOS handoff message with unsupported SOSTriggerMechanism", v8, 2u);
    }
  }
  return v5;
}

- (BOOL)isIncomingMessageValidHandoffAck:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  eventUUIDArrayQueue = self->_eventUUIDArrayQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke;
  block[3] = &unk_1E6064B50;
  v10 = self;
  int v11 = &v12;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(eventUUIDArrayQueue, block);
  LOBYTE(eventUUIDArrayQueue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)eventUUIDArrayQueue;
}

void __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SOSEventUUIDKey"];
  if (!v2)
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke_cold_1();
    }
    goto LABEL_8;
  }
  if (([*(id *)(*(void *)(a1 + 40) + 16) containsObject:v2] & 1) == 0)
  {
    id v4 = sos_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOSCoordinator,unrecognized event UUID", v5, 2u);
    }
LABEL_8:

    char v3 = 0;
    goto LABEL_9;
  }
  [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v2];
  char v3 = 1;
LABEL_9:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

- (void)handleSOSMessageTypeHandoffSOSAck:(id)a3
{
  id v4 = a3;
  char v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, handleSOSMessageTypeHandoffSOSAck", v7, 2u);
  }

  if ([(SOSCoordinator *)self isIncomingMessageValidHandoffAck:v4])
  {
    id v6 = [v4 objectForKeyedSubscript:@"SOSHandoffAckSuccessKey"];
    self->_ackSuccess = [v6 BOOLValue];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_eventProcessingSemaphore);
  }
}

- (void)handleSOSMessageTypeHandoffSOS:(id)a3
{
  id v4 = a3;
  char v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, handleSOSMessageTypeHandoffSOS", buf, 2u);
  }

  if ([(SOSCoordinator *)self isIncomingMessageValidSOSHandoff:v4])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    id v7 = [v4 objectForKeyedSubscript:@"SOSEventUUIDKey"];
    v8 = (void *)[v6 initWithUUIDString:v7];

    id v9 = [v4 objectForKeyedSubscript:@"SOSCoordinationTriggerKey"];
    int64_t v10 = +[SOSUtilities SOSTriggerMechanismForString:v9];

    int v11 = +[SOSEngine sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__SOSCoordinator_handleSOSMessageTypeHandoffSOS___block_invoke;
    v12[3] = &unk_1E6064B78;
    v12[4] = self;
    id v13 = v4;
    [v11 triggerSOSWithUUID:v8 triggerMechanism:v10 source:1 completion:v12];
  }
  else
  {
    [(SOSCoordinator *)self sendAckToHandoffMessage:v4 success:0];
  }
}

uint64_t __49__SOSCoordinator_handleSOSMessageTypeHandoffSOS___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendAckToHandoffMessage:*(void *)(a1 + 40) success:a2 == 0];
}

- (void)handleSOSMessageTypeProgressionSync:(id)a3
{
  id v4 = a3;
  char v5 = sos_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, handleSOSMessageTypeProgressionSync", v14, 2u);
  }

  id v6 = [v4 objectForKeyedSubscript:@"SOSProgressionKey"];
  int64_t v7 = +[SOSUtilities SOSProgressionForString:v6];

  if (v7 == 2)
  {
    id v9 = [v4 objectForKeyedSubscript:@"SOSCoordinationShouldHandleThirdPartyKey"];
    uint64_t v10 = [v9 BOOLValue];
  }
  else
  {
    if (!v7)
    {
      v8 = sos_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SOSCoordinator handleSOSMessageTypeProgressionSync:]();
      }
      goto LABEL_14;
    }
    uint64_t v10 = 0;
  }
  v8 = [v4 objectForKeyedSubscript:@"SOSStatusKey"];
  int v11 = [[SOSMessagingStatus alloc] initWithData:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = [(SOSMessagingStatus *)v11 sosStatus];
    [(SOSCoordinator *)self sendUpdateToObserversWithStatus:v13 progression:v7 shouldHandleThirdParty:v10];
  }
  else
  {
    id v13 = sos_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SOSCoordinator handleSOSMessageTypeProgressionSync:]();
    }
  }

LABEL_14:
}

- (void)sendUpdateToObserversWithStatus:(id)a3 progression:(int64_t)a4 shouldHandleThirdParty:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(SOSCoordinator *)self observers];
  uint64_t v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) pairedDeviceSOSStatusDidUpdate:v8 progression:a4 shouldHandleThirdParty:v5];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)sendUrgentMessageToPairedDevice:(id)a3
{
  return [(SOSCoordinator *)self _sendUrgentMessageToPairedDevice:a3 retries:&unk_1F0C4AB10];
}

- (BOOL)_sendUrgentMessageToPairedDevice:(id)a3 retries:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F6A998];
  v29[0] = *MEMORY[0x1E4F6AA10];
  v29[1] = v8;
  v30[0] = &unk_1F0C4AB28;
  v30[1] = MEMORY[0x1E4F1CC38];
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  uint64_t v10 = [(SOSCoordinator *)self effectivePairedDevice];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 destination];
    if (v12)
    {
      idsService = self->_idsService;
      uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
      id v27 = 0;
      id v28 = 0;
      char v15 = [(IDSService *)idsService sendMessage:v6 toDestinations:v14 priority:300 options:v9 identifier:&v28 error:&v27];
      id v16 = v28;
      long long v17 = v27;

      if (v17)
      {
        long long v18 = sos_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:](v17, v18);
        }
      }
      pendingMessagesQueue = self->_pendingMessagesQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__SOSCoordinator__sendUrgentMessageToPairedDevice_retries___block_invoke;
      block[3] = &unk_1E6064BA0;
      id v23 = v16;
      v24 = self;
      id v25 = v6;
      id v26 = v7;
      id v20 = v16;
      dispatch_sync(pendingMessagesQueue, block);
    }
    else
    {
      long long v17 = sos_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:]();
      }
      char v15 = 0;
    }
  }
  else
  {
    uint64_t v12 = sos_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SOSCoordinator _sendUrgentMessageToPairedDevice:retries:]();
    }
    char v15 = 0;
  }

  return v15;
}

void *__59__SOSCoordinator__sendUrgentMessageToPairedDevice_retries___block_invoke(void *result)
{
  if (result[4])
  {
    v1 = result;
    objc_msgSend(*(id *)(result[5] + 48), "setObject:forKeyedSubscript:", result[6]);
    uint64_t v2 = v1[7];
    uint64_t v3 = v1[4];
    id v4 = *(void **)(v1[5] + 56);
    return (void *)[v4 setObject:v2 forKeyedSubscript:v3];
  }
  return result;
}

- (BOOL)shouldRetryMessage:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"SOSCoordinationMessageTypeKey"];
  unint64_t v5 = [(SOSCoordinator *)self SOSCoordinationMessageTypeForString:v4];

  return (v5 & 1) == 0 && v5 < 5;
}

- (void)sendAckToHandoffMessage:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:@"SOSCoordinationEventHandoffSOSAck" forKey:@"SOSCoordinationMessageTypeKey"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"SOSEventUUIDKey"];

  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"SOSEventUUIDKey"];
    [v7 setObject:v9 forKey:@"SOSEventUUIDKey"];
  }
  uint64_t v10 = [NSNumber numberWithBool:v4];
  [v7 setObject:v10 forKey:@"SOSHandoffAckSuccessKey"];

  [(SOSCoordinator *)self sendUrgentMessageToPairedDevice:v7];
  uint64_t v11 = sos_default_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v12)
    {
      __int16 v16 = 0;
      uint64_t v13 = "SOSCoordinator,sending ack SOS event successfully handed off to watch";
      uint64_t v14 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }
  else if (v12)
  {
    __int16 v15 = 0;
    uint64_t v13 = "SOSCoordinator,sending ack SOS event NOT successfully handed off to watch";
    uint64_t v14 = (uint8_t *)&v15;
    goto LABEL_8;
  }
}

- (id)effectivePairedDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(IDSService *)self->_idsService devices];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice] && objc_msgSend(v6, "relationship") == 1)
        {
          id v3 = v6;
          goto LABEL_12;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (int64_t)SOSCoordinationMessageTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SOSMessageTypeUnspecified"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"SOSCoordinationMessageTypeHandoffSOS"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"SOSCoordinationEventHandoffSOSAck"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"SOSMessageTypeProgressionSync"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isPairedDeviceNearby
{
  uint64_t v2 = [(SOSCoordinator *)self effectivePairedDevice];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isNearby];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a3;
  id v6 = sos_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "SOSCoordinator nearbyDevicesChanged", v7, 2u);
  }

  [(SOSCoordinator *)self _handleServiceUpdate:v5];
}

- (void)_handleServiceUpdate:(id)a3
{
  id v4 = [(SOSCoordinator *)self effectivePairedDevice];
  [(SOSCoordinator *)self _updateStateForPairedDevice:v4];
}

- (void)_updateStateForPairedDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 isNearby])
  {
    id v6 = +[SOSUtilities currentDeviceSOSStatus];
    id v7 = sos_default_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, forcing SOS state sync", (uint8_t *)&v13, 2u);
      }

      if ([v6 flowState])
      {
        long long v9 = self;
        uint64_t v10 = 3;
      }
      else
      {
        long long v9 = self;
        uint64_t v10 = 1;
      }
      [(SOSCoordinator *)v9 syncProgressionWithPairedDevice:v10 sosStatus:v6];
    }
    else
    {
      if (v8)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, no currentDeviceSOSStatus to sync with paired device", (uint8_t *)&v13, 2u);
      }
    }
  }
  else
  {
    long long v11 = +[SOSUtilities pairedDeviceSOSStatus];
    id v6 = v11;
    if (v11 && [v11 isFlowActive])
    {
      BOOL v12 = sos_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "SOSCoordinator, clearing out pairedDeviceSOSStatus: %@", (uint8_t *)&v13, 0xCu);
      }

      [v6 setFlowState:0];
      [(SOSCoordinator *)self sendUpdateToObserversWithStatus:v6 progression:3 shouldHandleThirdParty:0];
    }
  }
}

- (int64_t)sourceDevice
{
  return 2;
}

- (void)reportHandoff:(int64_t)a3 result:(int64_t)a4
{
  id v7 = [(SOSCoordinator *)self coreAnalyticsReporter];
  objc_msgSend(v7, "reportSOSTriggerHandoff:source:destination:result:", a3, -[SOSCoordinator sourceDevice](self, "sourceDevice"), 1, a4);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingMessageRetriesById, 0);
  objc_storeStrong((id *)&self->_pendingMessagesById, 0);
  objc_storeStrong((id *)&self->_pendingMessagesQueue, 0);
  objc_storeStrong((id *)&self->_eventUUIDArrayQueue, 0);
  objc_storeStrong((id *)&self->_eventProcessingSemaphore, 0);
  objc_storeStrong((id *)&self->_processingEventUUIDs, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

- (void)syncProgressionWithPairedDevice:sosStatus:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSCoordinator, messagingStatus was nil! Not sending update message to paired device", v2, v3, v4, v5, v6);
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSCoordinator, indentifier for message is nil. Cannot retry.", v2, v3, v4, v5, v6);
}

- (void)service:(os_log_t)log account:identifier:didSendWithSuccess:error:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "IDS didSendWithSuccess identifier=%@ error=%@", (uint8_t *)&v3, 0x16u);
}

void __51__SOSCoordinator_isIncomingMessageValidHandoffAck___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSCoordinator, incoming handoff message missing uuid", v2, v3, v4, v5, v6);
}

- (void)handleSOSMessageTypeProgressionSync:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSCoordinator, incoming message missing SOSStatus!", v2, v3, v4, v5, v6);
}

- (void)handleSOSMessageTypeProgressionSync:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSCoordinator, message has SOSProgressionUnknown!", v2, v3, v4, v5, v6);
}

- (void)_sendUrgentMessageToPairedDevice:retries:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSCoordinator, no effectivePairedDevice to send message", v2, v3, v4, v5, v6);
}

- (void)_sendUrgentMessageToPairedDevice:retries:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1(&dword_1B3A94000, v0, v1, "SOSCoordinator, pairedDevice does not have a destination", v2, v3, v4, v5, v6);
}

- (void)_sendUrgentMessageToPairedDevice:(void *)a1 retries:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1B3A94000, a2, OS_LOG_TYPE_ERROR, "SOSCoordinator,sendUrgentMessageToPairedDevice failed with error: %@", (uint8_t *)&v4, 0xCu);
}

@end