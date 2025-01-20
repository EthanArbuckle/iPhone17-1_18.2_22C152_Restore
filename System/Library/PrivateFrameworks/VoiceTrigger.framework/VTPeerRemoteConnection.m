@interface VTPeerRemoteConnection
- (BOOL)_hasNearbyPeer;
- (BOOL)hasPeer;
- (VTPeerRemoteConnection)initWithServiceIdentifier:(id)a3;
- (VTPeerRemoteConnection)initWithServiceIdentifier:(id)a3 requireNearbyPeer:(BOOL)a4;
- (id)_account;
- (id)_destination;
- (id)_pairedDevice;
- (id)_service;
- (id)_wrappedSendFailureError:(id)a3;
- (id)serviceIdentifier;
- (void)_invokeCompletionForIdentifier:(id)a3 response:(id)a4 error:(id)a5;
- (void)_sendResponse:(id)a3 forRequestId:(id)a4;
- (void)sendRequestType:(unint64_t)a3 nonWaking:(BOOL)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
@end

@implementation VTPeerRemoteConnection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseClasses, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!a6)
  {
    v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543618;
      id v19 = v14;
      __int16 v20 = 2114;
      id v21 = v15;
      _os_log_error_impl(&dword_21844F000, v16, OS_LOG_TYPE_ERROR, "Message send with identifier %{public}@ failed %{public}@", (uint8_t *)&v18, 0x16u);
    }
    v17 = [(VTPeerRemoteConnection *)self _wrappedSendFailureError:v15];
    [(VTPeerRemoteConnection *)self _invokeCompletionForIdentifier:v14 response:0 error:v17];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [v12 incomingResponseIdentifier];
  id v14 = [v12 outgoingResponseIdentifier];
  int v15 = [v12 expectsPeerResponse];
  v16 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = v15;
    int v18 = v14;
    id v19 = v11;
    identifier = self->_identifier;
    id v21 = v16;
    int v22 = [v10 type];
    v33 = self;
    id v23 = v10;
    v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "expectsPeerResponse"));
    *(_DWORD *)buf = 138544642;
    v38 = identifier;
    id v11 = v19;
    id v14 = v18;
    int v15 = v17;
    __int16 v39 = 1026;
    *(_DWORD *)v40 = v22;
    *(_WORD *)&v40[4] = 2114;
    *(void *)&v40[6] = v11;
    __int16 v41 = 2114;
    v42 = v13;
    __int16 v43 = 2114;
    v44 = v14;
    __int16 v45 = 2114;
    v46 = v24;
    _os_log_impl(&dword_21844F000, v21, OS_LOG_TYPE_DEFAULT, "Received %{public}@ type %{public}d fromId %{public}@ incoming %{public}@ outgoing %{public}@ expects response %{public}@", buf, 0x3Au);

    id v10 = v23;
    self = v33;
  }
  if (v13)
  {
    [(VTPeerRemoteConnection *)self _invokeCompletionForIdentifier:v13 response:v10 error:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v26 = v10;
      id v27 = objc_loadWeakRetained((id *)&self->_delegate);

      v28 = VTLogContextFacilityVoiceTrigger;
      BOOL v29 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "Handing protobuf to delegate", buf, 2u);
        }
        id v30 = objc_loadWeakRetained((id *)&self->_delegate);
        id v10 = v26;
        uint64_t v31 = [v26 type];
        if (v15)
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __83__VTPeerRemoteConnection_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
          v34[3] = &unk_264325438;
          id v35 = v14;
          v36 = self;
          [v30 remoteConnection:self handleMessageType:v31 completion:v34];
        }
        else
        {
          [v30 remoteConnection:self handleMessageType:v31 completion:0];
        }
      }
      else
      {
        id v10 = v26;
        if (v29)
        {
          *(_DWORD *)buf = 138543618;
          v38 = (NSString *)v26;
          __int16 v39 = 2114;
          *(void *)v40 = v12;
          _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "Tried to handle protobuf but couldn't find class or had no delegate %{public}@ %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      v32 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v38 = (NSString *)v10;
        __int16 v39 = 2114;
        *(void *)v40 = v12;
        _os_log_impl(&dword_21844F000, v32, OS_LOG_TYPE_DEFAULT, "Don't know how to handle protobuf %{public}@ %{public}@", buf, 0x16u);
      }
      if (v15) {
        [(VTPeerRemoteConnection *)self _sendResponse:0 forRequestId:v14];
      }
    }
  }
}

void __83__VTPeerRemoteConnection_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "Error for request id %{public}@ %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 40) _sendResponse:v5 forRequestId:*(void *)(a1 + 32)];
}

- (id)_wrappedSendFailureError:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F087E8]);
  id v5 = v4;
  if (v3)
  {
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = v3;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v7 = (void *)[v5 initWithDomain:@"VTRemoteConnectionErrorDomain" code:3 userInfo:v6];
  }
  else
  {
    v7 = (void *)[v4 initWithDomain:@"VTRemoteConnectionErrorDomain" code:3 userInfo:0];
  }

  return v7;
}

- (void)_invokeCompletionForIdentifier:(id)a3 response:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_completions objectForKey:v14];
  if (v9)
  {
LABEL_7:
    uint64_t v13 = 0;
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (![v8 isResponse]
    || (v11 = objc_alloc((Class)(id)-[NSMutableDictionary objectForKey:](self->_responseClasses, "objectForKey:", v14)), [v8 data], id v12 = objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v11, "initWithData:", v12), v12, !v13))
  {
    id v9 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"VTRemoteConnectionErrorDomain" code:0 userInfo:0];
    goto LABEL_7;
  }
  id v9 = 0;
  if (v10) {
LABEL_8:
  }
    ((void (**)(void, void *, id))v10)[2](v10, v13, v9);
LABEL_9:
  [(NSMutableDictionary *)self->_completions removeObjectForKey:v14];
  [(NSMutableDictionary *)self->_responseClasses removeObjectForKey:v14];
}

- (void)_sendResponse:(id)a3 forRequestId:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__VTPeerRemoteConnection__sendResponse_forRequestId___block_invoke;
    block[3] = &unk_264325410;
    id v11 = v6;
    id v12 = v7;
    uint64_t v13 = self;
    dispatch_async(queue, block);
  }
  else
  {
    id v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring response with no requestId %{public}@", buf, 0xCu);
    }
  }
}

void __53__VTPeerRemoteConnection__sendResponse_forRequestId___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4A090]);
  id v3 = [*(id *)(a1 + 32) data];
  id v4 = (void *)[v2 initWithProtobufData:v3 type:0 isResponse:1];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v17 = *MEMORY[0x263F49F38];
  v18[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v7 = [*(id *)(a1 + 48) _service];
  id v8 = [*(id *)(a1 + 48) _account];
  id v9 = [*(id *)(a1 + 48) _destination];
  id v13 = 0;
  id v14 = 0;
  [v7 sendProtobuf:v4 fromAccount:v8 toDestinations:v9 priority:300 options:v6 identifier:&v14 error:&v13];
  id v10 = v14;
  id v11 = v13;

  if (v11)
  {
    id v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v11;
      _os_log_error_impl(&dword_21844F000, v12, OS_LOG_TYPE_ERROR, "Error sending response %{public}@", buf, 0xCu);
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__VTPeerRemoteConnection_setDelegate___block_invoke;
  v7[3] = &unk_264325FF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

id __38__VTPeerRemoteConnection_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _service];
  id v3 = *(void **)(a1 + 40);
  id v4 = (id *)(*(void *)(a1 + 32) + 56);

  return objc_storeWeak(v4, v3);
}

- (void)sendRequestType:(unint64_t)a3 nonWaking:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138543362;
    id v15 = v10;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "Sending Request %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__VTPeerRemoteConnection_sendRequestType_nonWaking___block_invoke;
  block[3] = &unk_264325500;
  void block[4] = self;
  block[5] = a3;
  BOOL v13 = a4;
  dispatch_async(queue, block);
}

void __52__VTPeerRemoteConnection_sendRequestType_nonWaking___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F4A090]);
  id v3 = [MEMORY[0x263EFF8F8] data];
  id v4 = (void *)[v2 initWithProtobufData:v3 type:*(unsigned __int16 *)(a1 + 40) isResponse:0];

  uint64_t v5 = *(unsigned char **)(a1 + 32);
  if (v5[16] || *(unsigned char *)(a1 + 48))
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v7 = v6;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 16)) {
      [v6 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F49F00]];
    }
    [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F49EF0]];
    id v8 = [NSNumber numberWithUnsignedInteger:kVTPeerRemotePhraseSpotterRecommendedTimeout];
    [v7 setObject:v8 forKey:*MEMORY[0x263F49F78]];

    if (*(unsigned char *)(a1 + 48)) {
      [v7 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F49F28]];
    }
    [v7 setObject:@"VoiceTriggerRemotePhraseSpotter" forKey:*MEMORY[0x263F49F58]];
    id v9 = [NSNumber numberWithUnsignedInteger:kVTPeerRemotePhraseSpotterRecommendedTimeout];
    [v7 setObject:v9 forKey:*MEMORY[0x263F49EE0]];

    uint64_t v5 = *(unsigned char **)(a1 + 32);
  }
  else
  {
    id v7 = 0;
  }
  id v10 = [v5 _service];
  id v11 = [*(id *)(a1 + 32) _account];
  id v12 = [*(id *)(a1 + 32) _destination];
  id v16 = 0;
  id v17 = 0;
  [v10 sendProtobuf:v4 fromAccount:v11 toDestinations:v12 priority:300 options:v7 identifier:&v17 error:&v16];
  id v13 = v17;
  id v14 = v16;

  if (v14)
  {
    id v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_error_impl(&dword_21844F000, v15, OS_LOG_TYPE_ERROR, "Error sending request %{public}@", buf, 0xCu);
    }
  }
}

- (id)_destination
{
  id v2 = (void *)_destination_sDestination;
  if (!_destination_sDestination)
  {
    uint64_t v3 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E38]];
    id v4 = (void *)_destination_sDestination;
    _destination_sDestination = v3;

    id v2 = (void *)_destination_sDestination;
  }

  return v2;
}

- (id)_account
{
  id v2 = [(IDSService *)self->_idsService accounts];
  uint64_t v3 = [v2 anyObject];

  return v3;
}

- (id)_service
{
  idsService = self->_idsService;
  if (!idsService)
  {
    id v4 = (IDSService *)[objc_alloc(MEMORY[0x263F4A0C8]) initWithService:self->_identifier];
    uint64_t v5 = self->_idsService;
    self->_idsService = v4;

    [(IDSService *)self->_idsService addDelegate:self queue:self->_queue];
    idsService = self->_idsService;
  }

  return idsService;
}

- (id)serviceIdentifier
{
  return self->_identifier;
}

- (BOOL)_hasNearbyPeer
{
  id v2 = [(VTPeerRemoteConnection *)self _pairedDevice];
  char v3 = [v2 isNearby];

  return v3;
}

- (id)_pairedDevice
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(VTPeerRemoteConnection *)self serviceIdentifier];
    id v6 = [(VTPeerRemoteConnection *)self _service];
    id v7 = [v6 devices];
    *(_DWORD *)buf = 138543618;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_impl(&dword_21844F000, v4, OS_LOG_TYPE_DEFAULT, "devices for %{public}@: %{public}@", buf, 0x16u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(VTPeerRemoteConnection *)self _service];
  id v9 = [v8 devices];

  id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 isDefaultPairedDevice])
        {
          id v10 = v13;
          goto LABEL_13;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v10;
}

- (BOOL)hasPeer
{
  id v2 = [(VTPeerRemoteConnection *)self _account];
  BOOL v3 = v2 != 0;

  return v3;
}

- (VTPeerRemoteConnection)initWithServiceIdentifier:(id)a3
{
  return [(VTPeerRemoteConnection *)self initWithServiceIdentifier:a3 requireNearbyPeer:0];
}

- (VTPeerRemoteConnection)initWithServiceIdentifier:(id)a3 requireNearbyPeer:(BOOL)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VTPeerRemoteConnection;
  id v7 = [(VTPeerRemoteConnection *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("VTRemotePeerConnection", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    id v12 = v7->_queue;
    id v13 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v12, v13);

    v7->_requireNearbyPeer = a4;
  }

  return v7;
}

@end