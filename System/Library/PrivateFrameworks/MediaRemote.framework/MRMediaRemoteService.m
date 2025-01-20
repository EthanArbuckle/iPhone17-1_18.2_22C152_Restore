@interface MRMediaRemoteService
- (BOOL)deviceSupportsUISessions;
- (BOOL)isRunning;
- (CGSize)imageDimensionsForArtworkData:(id)a3;
- (MRXPCConnection)mrXPCConnection;
- (NSXPCListenerEndpoint)uiServiceEndpoint;
- (OS_dispatch_queue)agentQueue;
- (OS_dispatch_queue)browsableContentQueue;
- (OS_dispatch_queue)clientCallbackPriorityQueue;
- (OS_dispatch_queue)clientCallbackQueue;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)televisionQueue;
- (OS_dispatch_queue)voiceInputQueue;
- (OS_xpc_object)connection;
- (id)UIServerEndpoint;
- (id)UIServiceRelayEndpoint;
- (id)applicationUserIdentity;
- (id)createTokenWithInvitationData:(id)a3 equivalentMediaIdentifier:(id)a4 version:(id)a5;
- (id)getActiveSystemEndpointUIDForType:(int64_t)a3;
- (id)groupSessionServerEndpoint;
- (void)beginMusicHandoffSessionWithSource:(id)a3 destination:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)closeApplicationConnection:(id)a3 error:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)createApplicationConnection:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)fetchParticipantsWithRequest:(id)a3 playerPath:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)getDeviceInfoForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)joinGroupSessionWithToken:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)leaveGroupSessionWithIdentifier:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)presentProximityCardWithDeviceName:(id)a3 modelIdentifier:(id)a4 color:(id)a5 url:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)requestGroupSessionWithCompletion:(id)a3;
- (void)resolvePlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendApplicationConnectionMessage:(id)a3 forConnection:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)sendEvent:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendMusicHandoffEvent:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)setAgentQueue:(id)a3;
- (void)setBrowsableContentQueue:(id)a3;
- (void)setClientCallbackPriorityQueue:(id)a3;
- (void)setClientCallbackQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setMrXPCConnection:(id)a3;
- (void)setTelevisionQueue:(id)a3;
- (void)setUIServiceRelayEndpoint:(id)a3;
- (void)setUiServiceEndpoint:(id)a3;
- (void)setVoiceInputQueue:(id)a3;
- (void)suspendDisconnectionPauseForConfiguration:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)userIdentityForDSID:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation MRMediaRemoteService

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (OS_dispatch_queue)clientCallbackQueue
{
  return self->_clientCallbackQueue;
}

- (void)resolvePlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = a4;
  id v10 = a3;
  v11 = MRCreateXPCMessage(0x200000000000018uLL);
  MRAddPlayerPathToXPCMessage(v11, v10);

  v12 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __59__MRMediaRemoteService_resolvePlayerPath_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v15 = v8;
  id v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);
}

- (void)getDeviceInfoForPlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = a4;
  id v10 = a3;
  v11 = MRCreateXPCMessage(0x20000000000002CuLL);
  MRAddPlayerPathToXPCMessage(v11, v10);

  v12 = [(MRMediaRemoteService *)self connection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke;
  v15[3] = &unk_1E57D2528;
  id v16 = v11;
  id v17 = v8;
  id v13 = v8;
  id v14 = v11;
  xpc_connection_send_message_with_reply(v12, v14, v9, v15);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

void __81__MRMediaRemoteService_fetchParticipantsWithRequest_playerPath_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v11 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
LABEL_8:
    v6 = (void *)Error;
    v7 = 0;
    goto LABEL_9;
  }
  uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  if (Error) {
    goto LABEL_8;
  }
  v9 = (UInt8 *)MRCreateDataFromXPCMessage(v11, "MRXPC_PLAYBACKQUEUE_PARTICIPANTS");
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:0];
    v7 = objc_msgSend(v10, "msv_compactMap:", &__block_literal_global_23);

    v6 = 0;
  }
  else
  {
    v6 = (void *)MRMediaRemoteCreateError(1);
    v7 = 0;
  }

LABEL_9:
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v7, v6);
  }
}

void __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528])
  {
    _MRServiceLogReplyError();
    uint64_t Error = (void *)MRMediaRemoteCreateError(1);
    v6 = 0;
  }
  else
  {
    v6 = MRCreateDeviceInfoFromXPCMessage(v3);
    uint64_t Error = (void *)MRCreateClientErrorFromXPCMessage(*(void **)(a1 + 32));
    if ([Error code] == 3)
    {
      if (MSVDeviceOSIsInternalInstall())
      {
        uint64_t v8 = _MRLogForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke_cold_1();
        }
      }
      uint64_t Error = 0;
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v6, Error);
  }
}

void __59__MRMediaRemoteService_resolvePlayerPath_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = (void *)MRMediaRemoteCreateError(1);
    v5 = 0;
  }
  else
  {
    v5 = MRCreatePlayerPathFromXPCMessage(v3);
    uint64_t Error = (void *)MRCreateClientErrorFromXPCMessage(v8);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, Error);
  }
  kdebug_trace();
}

- (MRXPCConnection)mrXPCConnection
{
  return self->_mrXPCConnection;
}

- (void)setVoiceInputQueue:(id)a3
{
}

- (void)setMrXPCConnection:(id)a3
{
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void)setConnectionQueue:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)setClientCallbackQueue:(id)a3
{
}

- (void)setClientCallbackPriorityQueue:(id)a3
{
}

- (void)setBrowsableContentQueue:(id)a3
{
}

- (void)fetchParticipantsWithRequest:(id)a3 playerPath:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = MRCreateXPCMessage(0x20000000000003CuLL);
  MRAddPlayerPathToXPCMessage(v12, v11);

  id v13 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __81__MRMediaRemoteService_fetchParticipantsWithRequest_playerPath_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v16 = v9;
  id v14 = v9;
  xpc_connection_send_message_with_reply(v13, v12, v10, handler);
}

- (id)getActiveSystemEndpointUIDForType:(int64_t)a3
{
  v5 = MRCreateXPCMessage(0x300000000000010uLL);
  xpc_dictionary_set_int64(v5, "MRXPC_ROUTE_OPTIONS_KEY", a3);
  v6 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v11 = 0;
  uint64_t v7 = [v6 sendSyncMessage:v5 error:&v11];
  uint64_t v8 = v11;

  if (v8)
  {
    _MRServiceLogReplyError();
    id v9 = 0;
  }
  else
  {
    id v9 = MRCreateStringFromXPCMessage(v7, "MRXPC_ROUTE_UID_KEY");
  }

  return v9;
}

- (id)UIServerEndpoint
{
  id v3 = MRCreateXPCMessage(0xB00000000000001uLL);
  BOOL v4 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v10 = 0;
  v5 = [v4 sendSyncMessage:v3 error:&v10];
  uint64_t v6 = v10;

  if (v6)
  {
    _MRServiceLogReplyError();
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
    if (v8)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F292A0]);
      [v7 _setEndpoint:v8];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)UIServiceRelayEndpoint
{
  id v3 = MRCreateXPCMessage(0xB00000000000002uLL);
  BOOL v4 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v10 = 0;
  v5 = [v4 sendSyncMessage:v3 error:&v10];
  uint64_t v6 = v10;

  if (v6)
  {
    _MRServiceLogReplyError();
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
    if (v8)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F292A0]);
      [v7 _setEndpoint:v8];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)setUIServiceRelayEndpoint:(id)a3
{
  id v4 = a3;
  [(MRMediaRemoteService *)self setUiServiceEndpoint:v4];
  MRCreateXPCMessage(0xB00000000000003uLL);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v5 = [v4 _endpoint];

  xpc_dictionary_set_value(xdict, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY", v5);
  uint64_t v6 = [(MRMediaRemoteService *)self connection];
  xpc_connection_send_message(v6, xdict);
}

- (BOOL)deviceSupportsUISessions
{
  id v3 = MRCreateXPCMessage(0xB00000000000004uLL);
  id v4 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v9 = 0;
  v5 = [v4 sendSyncMessage:v3 error:&v9];
  uint64_t v6 = v9;

  if (v6)
  {
    _MRServiceLogReplyError();
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = xpc_dictionary_get_BOOL(v5, "MRXPC_BOOL_RESULT_KEY");
  }

  return v7;
}

- (void)createApplicationConnection:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = a4;
  id v10 = a3;
  uint64_t v11 = MRCreateXPCMessage(0x40000000000000EuLL);
  v12 = [MRCreateApplicationConnectionMessage alloc];
  id v13 = [v10 context];

  id v14 = [(MRCreateApplicationConnectionMessage *)v12 initWithConnectionContext:v13 requestInfo:0];
  MRAddProtobufToXPCMessage(v11, v14);
  id v15 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __69__MRMediaRemoteService_createApplicationConnection_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v18 = v8;
  id v16 = v8;
  xpc_connection_send_message_with_reply(v15, v11, v9, handler);
}

void __69__MRMediaRemoteService_createApplicationConnection_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (void)sendApplicationConnectionMessage:(id)a3 forConnection:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  uint64_t v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = MRCreateXPCMessage(0x40000000000000FuLL);
  id v15 = [MRApplicationConnectionProtocolMessage alloc];
  id v16 = [v12 context];

  id v17 = [(MRApplicationConnectionProtocolMessage *)v15 initWithMessage:v13 connectionContext:v16];
  MRAddProtobufToXPCMessage(v14, v17);
  id v18 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __88__MRMediaRemoteService_sendApplicationConnectionMessage_forConnection_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v21 = v10;
  id v19 = v10;
  xpc_connection_send_message_with_reply(v18, v14, v11, handler);
}

void __88__MRMediaRemoteService_sendApplicationConnectionMessage_forConnection_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (void)closeApplicationConnection:(id)a3 error:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  uint64_t v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = MRCreateXPCMessage(0x400000000000010uLL);
  id v15 = [MRInvalidateApplicationConnectionMessage alloc];
  id v16 = [v13 context];

  id v17 = [(MRInvalidateApplicationConnectionMessage *)v15 initWithConnectionContext:v16 error:v12];
  MRAddProtobufToXPCMessage(v14, v17);
  id v18 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __74__MRMediaRemoteService_closeApplicationConnection_error_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v21 = v10;
  id v19 = v10;
  xpc_connection_send_message_with_reply(v18, v14, v11, handler);
}

void __74__MRMediaRemoteService_closeApplicationConnection_error_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (void)beginMusicHandoffSessionWithSource:(id)a3 destination:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  uint64_t v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = MRCreateXPCMessage(0x20000000000003DuLL);
  id v15 = [[MRMusicHandoffSession alloc] initWithIdentifier:&stru_1EE60E7D8 sourcePlayerPath:v13 destinationPlayerPath:v12];

  id v16 = [(MRMusicHandoffSession *)v15 protobufData];
  MRAddDataToXPCMessage(v14, v16, "MRXPC_MUSIC_HANDOFF_SESSION_KEY");

  id v17 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __88__MRMediaRemoteService_beginMusicHandoffSessionWithSource_destination_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v20 = v10;
  id v18 = v10;
  xpc_connection_send_message_with_reply(v17, v14, v11, handler);
}

void __88__MRMediaRemoteService_beginMusicHandoffSessionWithSource_destination_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (void)sendMusicHandoffEvent:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = a4;
  id v10 = a3;
  uint64_t v11 = MRCreateXPCMessage(0x20000000000003EuLL);
  id v12 = [v10 protobufData];

  MRAddDataToXPCMessage(v11, v12, "MRXPC_MUSIC_HANDOFF_EVENT_KEY");
  id v13 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __63__MRMediaRemoteService_sendMusicHandoffEvent_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v16 = v8;
  id v14 = v8;
  xpc_connection_send_message_with_reply(v13, v11, v9, handler);
}

void __63__MRMediaRemoteService_sendMusicHandoffEvent_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (id)groupSessionServerEndpoint
{
  id v3 = MRCreateXPCMessage(0xC00000000000001uLL);
  BOOL v4 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v10 = 0;
  v5 = [v4 sendSyncMessage:v3 error:&v10];
  uint64_t v6 = v10;

  if (v6)
  {
    _MRServiceLogReplyError();
    id v7 = 0;
  }
  else
  {
    id v8 = xpc_dictionary_get_value(v5, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");
    if (v8)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F292A0]);
      [v7 _setEndpoint:v8];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)joinGroupSessionWithToken:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = a4;
  id v10 = a3;
  uint64_t v11 = MRCreateXPCMessage(0xC00000000000002uLL);
  id v12 = [v10 data];

  MRAddDataToXPCMessage(v11, v12, "MRXPC_GROUP_SESSION_TOKEN_KEY");
  id v13 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __67__MRMediaRemoteService_joinGroupSessionWithToken_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v16 = v8;
  id v14 = v8;
  xpc_connection_send_message_with_reply(v13, v11, v9, handler);
}

void __67__MRMediaRemoteService_joinGroupSessionWithToken_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = (void *)MRMediaRemoteCreateError(1);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t Error = (void *)MRCreateClientErrorFromXPCMessage(v3);
    uint64_t v6 = MRCreateStringFromXPCMessage(v8, "MRXPC_GROUP_SESSION_IDENTIFIER_KEY");
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v6, Error);
  }
}

- (void)leaveGroupSessionWithIdentifier:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = a4;
  id v10 = a3;
  uint64_t v11 = MRCreateXPCMessage(0xC00000000000003uLL);
  MRAddStringToXPCMessage(v11, v10, "MRXPC_GROUP_SESSION_IDENTIFIER_KEY");

  id v12 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __73__MRMediaRemoteService_leaveGroupSessionWithIdentifier_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v15 = v8;
  id v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);
}

void __73__MRMediaRemoteService_leaveGroupSessionWithIdentifier_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (void)userIdentityForDSID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = a4;
  id v10 = a3;
  uint64_t v11 = MRCreateXPCMessage(0xC00000000000007uLL);
  MRAddStringToXPCMessage(v11, v10, "MRXPC_DSID_KEY");

  id v12 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __61__MRMediaRemoteService_userIdentityForDSID_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v15 = v8;
  id v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);
}

void __61__MRMediaRemoteService_userIdentityForDSID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v10 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
LABEL_8:
    uint64_t v6 = (void *)Error;
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  if (Error) {
    goto LABEL_8;
  }
  uint64_t v9 = (UInt8 *)MRCreateDataFromXPCMessage(v10, "MRXPC_USER_IDENTITY_KEY");
  if (v9)
  {
    uint64_t v7 = [[MRUserIdentity alloc] initWithProtobufData:v9];
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)MRMediaRemoteCreateError(1);
    uint64_t v7 = 0;
  }

LABEL_9:
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, MRUserIdentity *, void *))(v8 + 16))(v8, v7, v6);
  }
}

- (void)presentProximityCardWithDeviceName:(id)a3 modelIdentifier:(id)a4 color:(id)a5 url:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = MRCreateXPCMessage(0xC00000000000008uLL);
  MRAddStringToXPCMessage(v20, v19, "deviceName");

  MRAddStringToXPCMessage(v20, v18, "modelIdentifier");
  MRAddStringToXPCMessage(v20, v17, "color");

  MRAddStringToXPCMessage(v20, v16, "url");
  id v21 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __102__MRMediaRemoteService_presentProximityCardWithDeviceName_modelIdentifier_color_url_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v24 = v14;
  id v22 = v14;
  xpc_connection_send_message_with_reply(v21, v20, v15, handler);
}

void __102__MRMediaRemoteService_presentProximityCardWithDeviceName_modelIdentifier_color_url_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v7 = v3;
  if (v4) {
    v5 = 0;
  }
  else {
    v5 = (void *)MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

- (void)requestGroupSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = MRCreateXPCMessage(0xC00000000000009uLL);
  uint64_t v6 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __58__MRMediaRemoteService_requestGroupSessionWithCompletion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v9 = v4;
  id v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, MEMORY[0x1E4F14428], handler);
}

void __58__MRMediaRemoteService_requestGroupSessionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    v5 = MRCreateStringFromXPCMessage(v3, "MRXPC_GROUP_SESSION_IDENTIFIER_KEY");
    uint64_t v6 = (void *)MRCreateClientErrorFromXPCMessage(v8);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v5, v6);
  }
}

- (id)applicationUserIdentity
{
  id v3 = MRCreateXPCMessage(0xC00000000000005uLL);
  BOOL v4 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v11 = 0;
  v5 = [v4 sendSyncMessage:v3 error:&v11];
  uint64_t v6 = v11;

  if (v6)
  {
    _MRServiceLogReplyError();
LABEL_3:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  id v8 = MRCreateDataFromXPCMessage(v5, "MRXPC_USER_IDENTITY_KEY");
  if (!v8) {
    goto LABEL_3;
  }
  id v9 = (UInt8 *)v8;
  uint64_t v7 = [[MRUserIdentity alloc] initWithProtobufData:v8];

LABEL_6:

  return v7;
}

MRPlaybackQueueParticipant *__81__MRMediaRemoteService_fetchParticipantsWithRequest_playerPath_queue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRPlaybackQueueParticipant alloc] initWithProtobufData:v2];

  return v3;
}

- (id)createTokenWithInvitationData:(id)a3 equivalentMediaIdentifier:(id)a4 version:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = MRCreateXPCMessage(0xC00000000000006uLL);
  id v12 = v10;
  id v13 = (const void *)[v12 bytes];
  size_t v14 = [v12 length];

  xpc_dictionary_set_data(v11, "MRXPC_GROUP_SESSION_INVITATION_DATA_KEY", v13, v14);
  if (v8) {
    xpc_dictionary_set_string(v11, "MRXPC_GROUP_SESSION_EQUIVALENT_MEDIA_ID_KEY", (const char *)[v8 cStringUsingEncoding:4]);
  }
  if (v9) {
    xpc_dictionary_set_int64(v11, "MRXPC_GROUP_SESSION_VERSION_KEY", (int)[v9 intValue]);
  }
  id v15 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v21 = 0;
  id v16 = [v15 sendSyncMessage:v11 error:&v21];
  uint64_t v17 = v21;

  if (v17)
  {
    _MRServiceLogReplyError();
    id v18 = 0;
  }
  else
  {
    id v19 = (UInt8 *)MRCreateDataFromXPCMessage(v16, "MRXPC_GROUP_SESSION_TOKEN_KEY");
    id v18 = [[MRGroupSessionToken alloc] initWithData:v19];
  }

  return v18;
}

- (void)sendEvent:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = MRCreateXPCMessage(0xC00000000000004uLL);
  MRAddPropertyListToXPCMessage(v11, (uint64_t)v10, "MRXPC_GROUP_SESSION_EVENT_KEY");

  id v12 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __51__MRMediaRemoteService_sendEvent_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v15 = v8;
  id v13 = v8;
  xpc_connection_send_message_with_reply(v12, v11, v9, handler);
}

void __51__MRMediaRemoteService_sendEvent_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (CGSize)imageDimensionsForArtworkData:(id)a3
{
  id v4 = a3;
  v5 = MRCreateXPCMessage(0x20000000000003BuLL);
  MRAddDataToXPCMessage(v5, v4, "MRXPC_ARTWORK_DATA_KEY");

  uint64_t v6 = [(MRMediaRemoteService *)self mrXPCConnection];
  uint64_t v13 = 0;
  uint64_t v7 = [v6 sendSyncMessage:v5 error:&v13];
  uint64_t v8 = v13;

  if (v8)
  {
    _MRServiceLogReplyError();
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v9 = xpc_dictionary_get_double(v7, "MRXPC_ARTWORK_DIMENSION_WIDTH_KEY");
    double v10 = xpc_dictionary_get_double(v7, "MRXPC_ARTWORK_DIMENSION_HEIGHT_KEY");
  }

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)suspendDisconnectionPauseForConfiguration:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  double v9 = a4;
  double v10 = [a3 XPCMessage];
  double v11 = [(MRMediaRemoteService *)self connection];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __83__MRMediaRemoteService_suspendDisconnectionPauseForConfiguration_queue_completion___block_invoke;
  handler[3] = &unk_1E57D2550;
  id v14 = v8;
  id v12 = v8;
  xpc_connection_send_message_with_reply(v11, v10, v9, handler);
}

void __83__MRMediaRemoteService_suspendDisconnectionPauseForConfiguration_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  uint64_t v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

- (OS_dispatch_queue)clientCallbackPriorityQueue
{
  return self->_clientCallbackPriorityQueue;
}

- (OS_dispatch_queue)browsableContentQueue
{
  return self->_browsableContentQueue;
}

- (OS_dispatch_queue)voiceInputQueue
{
  return self->_voiceInputQueue;
}

- (OS_dispatch_queue)televisionQueue
{
  return self->_televisionQueue;
}

- (void)setTelevisionQueue:(id)a3
{
}

- (OS_dispatch_queue)agentQueue
{
  return self->_agentQueue;
}

- (void)setAgentQueue:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (NSXPCListenerEndpoint)uiServiceEndpoint
{
  return self->_uiServiceEndpoint;
}

- (void)setUiServiceEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiServiceEndpoint, 0);
  objc_storeStrong((id *)&self->_agentQueue, 0);
  objc_storeStrong((id *)&self->_televisionQueue, 0);
  objc_storeStrong((id *)&self->_voiceInputQueue, 0);
  objc_storeStrong((id *)&self->_browsableContentQueue, 0);
  objc_storeStrong((id *)&self->_clientCallbackPriorityQueue, 0);
  objc_storeStrong((id *)&self->_clientCallbackQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_mrXPCConnection, 0);
}

void __68__MRMediaRemoteService_getDeviceInfoForPlayerPath_queue_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  _os_log_fault_impl(&dword_194F3C000, v0, OS_LOG_TYPE_FAULT, "Missing entitlement <com.apple.mediaremote.device-info> to fetch deviceInfo. Please file a radar for this process to obtain this entitlement", v1, 2u);
}

@end