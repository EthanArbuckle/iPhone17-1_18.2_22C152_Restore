@interface SCLTransportService
- (BOOL)sendProtobuf:(id)a3 toDevice:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (IDSService)service;
- (NSHashTable)transportControllers;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueue;
- (SCLTransportService)initWithTargetQueue:(id)a3 service:(id)a4;
- (id)transportControllerForDevice:(id)a3;
- (void)addTransportController:(id)a3;
- (void)removeTransportController:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)start;
@end

@implementation SCLTransportService

- (SCLTransportService)initWithTargetQueue:(id)a3 service:(id)a4
{
  v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SCLTransportService;
  v9 = [(SCLTransportService *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    transportControllers = v9->_transportControllers;
    v9->_transportControllers = (NSHashTable *)v10;

    objc_storeStrong((id *)&v9->_targetQueue, a3);
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v13 = dispatch_queue_attr_make_initially_inactive(v12);

    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("com.apple.schooltimed.SCLTransportService", v13, v7);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_service, a4);
  }

  return v9;
}

- (void)start
{
  v3 = [(SCLTransportService *)self targetQueue];
  dispatch_assert_queue_V2(v3);

  id v7 = objc_alloc_init(MEMORY[0x263F4A0D0]);
  [v7 setWantsCrossAccountMessaging:1];
  v4 = [(SCLTransportService *)self service];
  v5 = [(SCLTransportService *)self queue];
  [v4 addDelegate:self withDelegateProperties:v7 queue:v5];

  v6 = [(SCLTransportService *)self queue];
  dispatch_activate(v6);
}

- (void)addTransportController:(id)a3
{
  id v6 = a3;
  v4 = [(SCLTransportService *)self targetQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(SCLTransportService *)self transportControllers];
  [v5 addObject:v6];

  [v6 setTransportService:self];
}

- (void)removeTransportController:(id)a3
{
  id v4 = a3;
  v5 = [(SCLTransportService *)self targetQueue];
  dispatch_assert_queue_V2(v5);

  [v4 setTransportService:0];
  id v6 = [(SCLTransportService *)self transportControllers];
  [v6 removeObject:v4];
}

- (id)transportControllerForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(SCLTransportService *)self targetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x263F08A98];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__SCLTransportService_transportControllerForDevice___block_invoke;
  v14[3] = &unk_2648AC4B8;
  id v15 = v4;
  id v7 = v4;
  id v8 = [v6 predicateWithBlock:v14];
  v9 = [(SCLTransportService *)self transportControllers];
  uint64_t v10 = [v9 allObjects];

  v11 = [v10 filteredArrayUsingPredicate:v8];
  v12 = [v11 lastObject];

  return v12;
}

uint64_t __52__SCLTransportService_transportControllerForDevice___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 IDSDeviceIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIDOverride];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)sendProtobuf:(id)a3 toDevice:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  v23[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void *)IDSCopyIDForDevice();
  if (v15)
  {
    if (!v14) {
      id v14 = (id)MEMORY[0x263EFFA78];
    }
    v16 = [(SCLTransportService *)self service];
    objc_super v17 = [MEMORY[0x263EFFA08] setWithObject:v15];
    LOBYTE(a7) = [v16 sendProtobuf:v12 toDestinations:v17 priority:300 options:v14 identifier:a6 error:a7];
  }
  else if (a7)
  {
    v18 = [NSString stringWithFormat:@"IDSCopyIDForDevice returned nil for device %@", v13];
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = v18;
    v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a7 = [v19 errorWithDomain:@"com.apple.schooltime" code:4 userInfo:v20];

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = scl_transport_log();
  if (os_signpost_enabled(v13))
  {
    int v20 = 67109120;
    int v21 = [v10 type];
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Incoming Protobuf", "Type: %d", (uint8_t *)&v20, 8u);
  }

  id v14 = [(SCLTransportService *)self service];
  id v15 = [v14 linkedDeviceForFromID:v11 withRelationship:2];

  v16 = [(SCLTransportService *)self transportControllerForDevice:v15];
  objc_super v17 = v16;
  if (v16)
  {
    [v16 service:self incomingProtobuf:v10 fromID:v11 context:v12];
    v18 = scl_transport_log();
    if (os_signpost_enabled(v18))
    {
      int v19 = [v10 type];
      int v20 = 67109120;
      int v21 = v19;
      _os_signpost_emit_with_name_impl(&dword_22B7B4000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Incoming Protobuf", "Type: %d", (uint8_t *)&v20, 8u);
    }
  }
  else
  {
    v18 = scl_transport_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SCLTransportService service:account:incomingUnhandledProtobuf:fromID:context:]();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = scl_transport_log();
  int v19 = v18;
  if (v10)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v33 = v15;
      __int16 v34 = 1024;
      int v35 = 1;
      __int16 v36 = 2112;
      id v37 = v16;
      _os_log_impl(&dword_22B7B4000, v19, OS_LOG_TYPE_DEFAULT, "Service message with identifier %@ did send with success %{BOOL}u error: %@", buf, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    -[SCLTransportService service:account:identifier:didSendWithSuccess:error:context:]();
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v20 = [(SCLTransportService *)self transportControllers];
  int v21 = [v20 allObjects];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v25++) service:self identifier:v15 didSendWithSuccess:v10 error:v16];
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v23);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = scl_transport_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v9;
    _os_log_impl(&dword_22B7B4000, v11, OS_LOG_TYPE_DEFAULT, "Service message %@ hasBeenDelivered", (uint8_t *)&v17, 0xCu);
  }

  id v12 = [(SCLTransportService *)self service];
  id v13 = [v12 linkedDeviceForFromID:v10 withRelationship:2];

  id v14 = [(SCLTransportService *)self transportControllerForDevice:v13];
  id v15 = v14;
  if (v14)
  {
    [v14 service:self didDeliverMessageWithIdentifier:v9];
  }
  else
  {
    id v16 = scl_transport_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SCLTransportService service:account:incomingUnhandledProtobuf:fromID:context:]();
    }
  }
}

- (IDSService)service
{
  return self->_service;
}

- (NSHashTable)transportControllers
{
  return self->_transportControllers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transportControllers, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)service:account:incomingUnhandledProtobuf:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22B7B4000, v0, v1, "No transport controller for incoming message from %@; %@");
}

- (void)service:account:identifier:didSendWithSuccess:error:context:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22B7B4000, v0, v1, "Service message with identifier %@ failed to send with error %@");
}

@end