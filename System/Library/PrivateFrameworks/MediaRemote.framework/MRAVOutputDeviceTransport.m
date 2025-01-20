@interface MRAVOutputDeviceTransport
+ (id)_createConnectionWith:(id)a3 groupID:(id)a4 connectionType:(int64_t)a5 shouldUseSystemAuthenticationPrompt:(BOOL)a6 userInfo:(id)a7;
- (BOOL)requiresCustomPairing;
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (MRAVOutputDeviceTransport)initWithOutputDevice:(id)a3 groupID:(id)a4 connectionType:(int64_t)a5;
- (MRAVOutputDeviceTransport)initWithOutputDeviceUID:(id)a3;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)uid;
- (int64_t)port;
- (void)resetWithError:(id)a3;
- (void)setError:(id)a3;
- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3;
@end

@implementation MRAVOutputDeviceTransport

- (MRAVOutputDeviceTransport)initWithOutputDevice:(id)a3 groupID:(id)a4 connectionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MRAVOutputDeviceTransport.m", 46, @"Invalid parameter not satisfying: %@", @"outputDevice" object file lineNumber description];
  }
  v11 = [v9 primaryID];
  v12 = [(MRAVOutputDeviceTransport *)self initWithOutputDeviceUID:v11];

  if (v12)
  {
    uint64_t v13 = [v10 copy];
    groupID = v12->_groupID;
    v12->_groupID = (NSString *)v13;

    v12->super._connectionType = a5;
    v12->_useSystemAuthenticationPrompt = 1;
  }

  return v12;
}

- (MRAVOutputDeviceTransport)initWithOutputDeviceUID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRAVOutputDeviceTransport;
  v6 = [(MRAVOutputDeviceTransport *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDeviceUID, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.externalDeviceTransport/workerQueue", v8);
    workerQueue = v7->_workerQueue;
    v7->_workerQueue = (OS_dispatch_queue *)v9;

    v7->super._connectionType = 2;
  }

  return v7;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  outputDeviceUID = v2->_outputDeviceUID;
  groupID = v2->_groupID;
  connection = v2->_connection;
  v8 = NSStringFromMRAVEndpointConnectionType(v2->super._connectionType);
  dispatch_queue_t v9 = [v3 stringWithFormat:@"<%@: %p OutputDeviceUID=%@ groupID=%@ connection:%@ connectionType=%@>", v4, v2, outputDeviceUID, groupID, connection, v8];

  objc_sync_exit(v2);

  return v9;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  outputDeviceUID = v2->_outputDeviceUID;
  groupID = v2->_groupID;
  avOutputDevice = v2->_avOutputDevice;
  v8 = NSStringFromMRAVEndpointConnectionType(v2->super._connectionType);
  dispatch_queue_t v9 = MRCreateIndentedDebugDescriptionFromObject(v2->_connection);
  id v10 = [v3 stringWithFormat:@"<%@: %p {\n   OutputDeviceUID=%@\n   groupID=%@\n   AVOutputDevice=%@\n   connectionType=%@\n   connection=%@\n}>", v4, v2, outputDeviceUID, groupID, avOutputDevice, v8, v9];

  objc_sync_exit(v2);

  return v10;
}

- (id)deviceInfo
{
  return 0;
}

- (id)uid
{
  return self->_outputDeviceUID;
}

- (id)name
{
  return (id)[(AVOutputDevice *)self->_avOutputDevice name];
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL useSystemAuthenticationPrompt = v2->_useSystemAuthenticationPrompt;
  objc_sync_exit(v2);

  return useSystemAuthenticationPrompt;
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL useSystemAuthenticationPrompt = a3;
  objc_sync_exit(obj);
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSError *)v2->_error copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setError:(id)a3
{
  uint64_t v4 = (NSError *)a3;
  obj = self;
  objc_sync_enter(obj);
  error = obj->_error;
  obj->_error = v4;

  objc_sync_exit(obj);
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_connection;
  BOOL useSystemAuthenticationPrompt = v5->_useSystemAuthenticationPrompt;
  objc_sync_exit(v5);

  if (!v6)
  {
    v8 = [(id)objc_opt_class() _createConnectionWith:v5->_outputDeviceUID groupID:v5->_groupID connectionType:v5->super._connectionType shouldUseSystemAuthenticationPrompt:useSystemAuthenticationPrompt userInfo:v4];
    dispatch_queue_t v9 = v5;
    objc_sync_enter(v9);
    uint64_t v10 = [v8 first];
    connection = v5->_connection;
    v5->_connection = (MRAirPlayTransportConnection *)v10;

    uint64_t v12 = [v8 second];
    error = v9->_error;
    v9->_error = (NSError *)v12;

    objc_sync_exit(v9);
    v6 = [v8 first];
  }

  return v6;
}

+ (id)_createConnectionWith:(id)a3 groupID:(id)a4 connectionType:(int64_t)a5 shouldUseSystemAuthenticationPrompt:(BOOL)a6 userInfo:(id)a7
{
  BOOL v8 = a6;
  v87[5] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v50 = a4;
  id v52 = a7;
  uint64_t v11 = [v52 objectForKeyedSubscript:@"MRExternalDeviceConnectionReasonUserInfoKey"];
  uint64_t v12 = (void *)v11;
  uint64_t v13 = @"unknown";
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  v54 = v13;

  v14 = [v52 objectForKeyedSubscript:@"MRExternalDeviceConnectionCorrelationIDUserInfoKey"];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    v17 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [v17 UUIDString];
  }
  v18 = dispatch_group_create();
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__2;
  v84 = __Block_byref_object_dispose__2;
  id v85 = 0;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__2;
  v78 = __Block_byref_object_dispose__2;
  id v79 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__2;
  v72 = __Block_byref_object_dispose__2;
  id v73 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__2;
  v19 = &getAVOutputDeviceCommunicationChannelControlTypeRelayed;
  v66 = __Block_byref_object_dispose__2;
  id v67 = 0;
  if (a5 != 3) {
    v19 = &getAVOutputDeviceCommunicationChannelControlTypeDirect;
  }
  v51 = ((void (*)(void))*v19)();
  v20 = getAVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired();
  v86[0] = v20;
  v21 = [NSNumber numberWithInt:!v8];
  v87[0] = v21;
  v22 = getAVOutputDeviceCommunicationChannelOptionControlType();
  v86[1] = v22;
  v87[1] = v51;
  v23 = getAVOutputDeviceCommunicationChannelOptionCorrelationID();
  v86[2] = v23;
  v87[2] = v16;
  v24 = getAVOutputDeviceCommunicationChannelOptionInitiator();
  v86[3] = v24;
  v87[3] = v54;
  v25 = getAVOutputDeviceCommunicationChannelOptionUsePerCommChannelDelegate();
  v86[4] = v25;
  v87[4] = MEMORY[0x1E4F1CC38];
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:5];

  dispatch_group_enter(v18);
  v27 = [[MRAVDiscoverySessionHelper alloc] initWithFeatures:8];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke;
  v55[3] = &unk_1E57D0870;
  v58 = &v68;
  v28 = v18;
  v56 = v28;
  v59 = &v80;
  id v29 = v26;
  id v57 = v29;
  v60 = &v74;
  v61 = &v62;
  [(MRAVDiscoverySessionHelper *)v27 searchAVOutputDeviceForUID:v53 timeout:v16 identifier:v54 reason:v55 completion:5.0];
  if (v8) {
    double v30 = 60.0;
  }
  else {
    double v30 = 33.0;
  }
  dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
  intptr_t v32 = dispatch_group_wait(v28, v31);
  if (v69[5] || !v75[5])
  {
    if (v32)
    {
      id v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithMRError:format:", 26, @"Timed out after <%lf> waiting to open remote control communication channel", *(void *)&v30);
LABEL_24:
      v37 = v33;
      v36 = 0;
      goto LABEL_25;
    }
    v42 = (void *)v63[5];
    v43 = getAVOutputDeviceCommunicationChannelOpenCancellationReasonAuthorizationSkipped();
    LODWORD(v42) = v42 == v43;

    if (v42)
    {
      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      v46 = @"Skipped creating remote control communication channel. CancelIfAuthRequired was used";
      uint64_t v47 = 119;
    }
    else
    {
      v44 = (void *)v69[5];
      if (v44)
      {
        id v33 = v44;
        goto LABEL_24;
      }
      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      v46 = @"Failed to create remote control communication channel with no underlying error";
      uint64_t v47 = 100;
    }
    id v33 = (id)[v45 initWithMRError:v47 description:v46];
    goto LABEL_24;
  }
  v34 = [MRAirPlayTransportConnection alloc];
  uint64_t v35 = [(MRAirPlayTransportConnection *)v34 initWithOutputDeviceCommunicationChannel:v75[5]];
  v36 = (void *)v35;
  v37 = 0;
  if (v50 && v35)
  {
    v38 = [[MRConfigureConnectionMessage alloc] initWithGroupID:v50];
    v39 = [(MRProtocolMessage *)v38 protobufData];
    [v36 sendTransportData:v39 options:0];

    v40 = objc_alloc_init(MRDeviceInfo);
    [(MRDeviceInfo *)v40 setDeviceUID:v53];
    [(MRDeviceInfo *)v40 setName:v81[5]];
    v41 = +[MRProtocolMessageLogger sharedLogger];
    [v41 logMessage:@"Message Sent:" label:@"RemoteControl" deviceInfo:v40 protocolMessage:v38];

    v37 = 0;
  }
LABEL_25:
  v48 = (void *)[objc_alloc(MEMORY[0x1E4F779D8]) initWithFirst:v36 second:v37];

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);

  return v48;
}

void __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v12 = v6;
    if (!v6) {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
    if (!v7) {

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    uint64_t v8 = [v5 name];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke_2;
    v13[3] = &unk_1E57D0848;
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    long long v16 = *(_OWORD *)(a1 + 64);
    id v14 = *(id *)(a1 + 32);
    [v5 openCommunicationChannelWithOptions:v11 completionHandler:v13];
  }
}

void __119__MRAVOutputDeviceTransport__createConnectionWith_groupID_connectionType_shouldUseSystemAuthenticationPrompt_userInfo___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v18 = v8;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)resetWithError:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MRAVOutputDeviceTransport_resetWithError___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workerQueue, v7);
}

void __44__MRAVOutputDeviceTransport_resetWithError___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) closeWithError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;
}

- (BOOL)requiresCustomPairing
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avOutputDevice, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end