@interface MRIDSCompanionTransportConnection
- (BOOL)isValid;
- (MRIDSCompanionTransportConnection)initWithConnection:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6;
- (NSString)destination;
- (NSString)session;
- (NSString)type;
- (id)_exportDescriptorForOutputDevice:(id)a3 endpoint:(id)a4 remoteControl:(BOOL)a5;
- (id)error;
- (id)exportEndpoint:(id)a3;
- (id)exportOutputDevice:(id)a3 endpoint:(id)a4;
- (id)runLoop;
- (int64_t)_idsPriorityFromPriority:(int64_t)a3;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (void)closeWithError:(id)a3;
- (void)dealloc;
@end

@implementation MRIDSCompanionTransportConnection

- (MRIDSCompanionTransportConnection)initWithConnection:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MRIDSCompanionTransportConnection;
  v15 = [(MRExternalDeviceTransportConnection *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_connection, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong((id *)&v16->_destination, a5);
    objc_storeStrong((id *)&v16->_session, a6);
    objc_initWeak(&location, v16);
    connection = v16->_connection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__MRIDSCompanionTransportConnection_initWithConnection_type_destination_session___block_invoke;
    v19[3] = &unk_1E57D2C50;
    objc_copyWeak(&v20, &location);
    [(MRIDSCompanionConnection *)connection setMessageHandler:v19 forType:v16->_type destination:v16->_destination session:v14];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __81__MRIDSCompanionTransportConnection_initWithConnection_type_destination_session___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 data];

  [WeakRetained ingestData:v4];
}

- (void)dealloc
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:104 description:@"MRIDSCompanionTransportConnection.dealloc"];
  [(MRIDSCompanionTransportConnection *)self closeWithError:v3];

  v4.receiver = self;
  v4.super_class = (Class)MRIDSCompanionTransportConnection;
  [(MRIDSCompanionTransportConnection *)&v4 dealloc];
}

- (BOOL)isValid
{
  return [(MRIDSCompanionConnection *)self->_connection isConnected];
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSError *)v2->_error copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)runLoop
{
  return 0;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = -[MRIDSCompanionTransportConnection _idsPriorityFromPriority:](self, "_idsPriorityFromPriority:", [v6 priority]);
  char v9 = [v6 isWaking];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F6A9D0];
    v14[0] = MEMORY[0x1E4F1CC38];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  [(MRIDSCompanionConnection *)self->_connection sendMessage:v7 type:self->_type destination:self->_destination session:self->_session options:v10 priority:v8];
  unint64_t v11 = [v7 length];

  return v11;
}

- (void)closeWithError:(id)a3
{
  id v8 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  connection = v4->_connection;
  if (connection)
  {
    [(MRIDSCompanionConnection *)connection removeMessageHandlerForType:v4->_type destination:v4->_destination session:v4->_session];
    id v6 = v8;
    if (!v8) {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:104];
    }
    id v8 = v6;
    objc_storeStrong((id *)&v4->_error, v6);
    id v7 = v4->_connection;
    v4->_connection = 0;

    objc_sync_exit(v4);
    [(MRExternalDeviceTransportConnection *)v4 _notifyDelegateDidCloseWithError:v8];
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (id)exportEndpoint:(id)a3
{
  id v4 = a3;
  if ([v4 isLocalEndpoint])
  {
    v5 = [v4 groupLeader];
    id v6 = [(MRIDSCompanionTransportConnection *)self _exportDescriptorForOutputDevice:v5 endpoint:v4 remoteControl:1];

    if (v6)
    {
      id v7 = [v4 outputDevices];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __52__MRIDSCompanionTransportConnection_exportEndpoint___block_invoke;
      v18 = &unk_1E57D2C78;
      v19 = self;
      id v8 = v4;
      id v20 = v8;
      char v9 = objc_msgSend(v7, "mr_compactMap:", &v15);
      v10 = objc_msgSend(v9, "mutableCopy", v15, v16, v17, v18, v19);

      [v10 addObject:v6];
      unint64_t v11 = [v8 descriptor];
      [v11 setDesignatedGroupLeader:v6];
      [v11 setOutputDevices:v10];
      id v12 = [[MRAVDistantEndpoint alloc] initWithDescriptor:v11];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v13 = [v4 designatedGroupLeader];
    id v12 = [v13 uid];

    if (v12) {
      id v12 = (MRAVDistantEndpoint *)v4;
    }
  }

  return v12;
}

id __52__MRIDSCompanionTransportConnection_exportEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLocalDevice])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) _exportDescriptorForOutputDevice:v3 endpoint:*(void *)(a1 + 40) remoteControl:1];
  }

  return v4;
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  id v4 = [(MRIDSCompanionTransportConnection *)self _exportDescriptorForOutputDevice:a3 endpoint:a4 remoteControl:0];
  v5 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v4];

  return v5;
}

- (int64_t)_idsPriorityFromPriority:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 100;
  }
  else {
    return qword_195224358[a3];
  }
}

- (id)_exportDescriptorForOutputDevice:(id)a3 endpoint:(id)a4 remoteControl:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  char v9 = [v7 descriptor];
  [v9 setTransportType:3];
  v10 = +[MROrigin localOrigin];
  unint64_t v11 = +[MRDeviceInfoRequest deviceInfoForOrigin:v10];

  if (v5)
  {
    int v12 = 1;
  }
  else
  {
    uint64_t v13 = [v7 uid];
    int v12 = [v8 containsOutputDeviceWithUID:v13];
  }
  if ([v7 isLocalDevice])
  {
    objc_msgSend(v9, "setHostDeviceClass:", _MRDeviceInfoMessageProtobuf_DeviceClassFromModel(objc_msgSend(v11, "deviceClass")));
    id v14 = [v11 WHAIdentifier];
    [v9 setPrimaryUID:v14];

    if (v12)
    {
      uint64_t v15 = [v11 groupUID];
      [v9 setGroupID:v15];

      [v9 setGroupContainsGroupLeader:1];
      [v9 setIsRemoteControllable:1];
      [v9 setIsGroupLeader:1];
      [v9 setIsLocalDevice:0];
      uint64_t v16 = [v8 outputDevices];
      objc_msgSend(v9, "setIsProxyGroupPlayer:", objc_msgSend(v16, "mr_any:", &__block_literal_global_30));
    }
    else
    {
      [v9 setGroupID:0];
      [v9 setGroupContainsGroupLeader:0];
      [v9 setIsRemoteControllable:0];
      [v9 setIsGroupLeader:0];
      [v9 setIsLocalDevice:0];
      [v9 setIsProxyGroupPlayer:0];
    }
    if ([v7 deviceType] == 4)
    {
      v19 = [v7 sourceInfo];
      char v20 = [v19 multipleBuiltInDevices];

      if ((v20 & 1) == 0)
      {
        v21 = [v11 localizedModelName];
        [v9 setName:v21];

        objc_super v22 = [v11 modelID];
        [v9 setModelID:v22];
      }
    }
    if (v5)
    {
      v23 = [v11 WHAIdentifier];
      [v9 setUniqueIdentifier:v23];

      v18 = [v11 localizedModelName];
      [v9 setName:v18];
      goto LABEL_16;
    }
  }
  else if (([v8 isLocalEndpoint] & v12) == 1)
  {
    [v9 setIsRemoteControllable:1];
    [v9 setIsGroupLeader:0];
    v17 = [v7 groupID];

    if (!v17)
    {
      v18 = [v11 groupUID];
      [v9 setGroupID:v18];
LABEL_16:
    }
  }

  return v9;
}

BOOL __93__MRIDSCompanionTransportConnection__exportDescriptorForOutputDevice_endpoint_remoteControl___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deviceType] == 1;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end