@interface MRDIDSTransportConnection
- (BOOL)isValid;
- (MRDIDSServiceConnection)connection;
- (MRDIDSTransportConnection)initWithConnection:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6;
- (NSString)destination;
- (NSString)session;
- (NSString)type;
- (id)_exportDescriptorForOutputDevice:(id)a3 endpoint:(id)a4 remoteControl:(BOOL)a5;
- (id)debugDescription;
- (id)error;
- (id)exportEndpoint:(id)a3;
- (id)exportOutputDevice:(id)a3 endpoint:(id)a4;
- (id)runLoop;
- (int64_t)_idsPriorityFromPriority:(int64_t)a3;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (void)closeWithError:(id)a3;
- (void)dealloc;
@end

@implementation MRDIDSTransportConnection

- (MRDIDSTransportConnection)initWithConnection:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MRDIDSTransportConnection;
  v15 = [(MRDIDSTransportConnection *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_connection, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong((id *)&v16->_destination, a5);
    objc_storeStrong((id *)&v16->_session, a6);
    objc_initWeak(&location, v16);
    connection = v16->_connection;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10008C958;
    v19[3] = &unk_100419468;
    objc_copyWeak(&v20, &location);
    [(MRDIDSServiceConnection *)connection setMessageHandler:v19 forType:v16->_type destination:v16->_destination session:v14];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)dealloc
{
  id v3 = [objc_alloc((Class)NSError) initWithMRError:104 description:@"MRIDSCompanionTransportConnection.dealloc"];
  [(MRDIDSTransportConnection *)self closeWithError:v3];

  v4.receiver = self;
  v4.super_class = (Class)MRDIDSTransportConnection;
  [(MRDIDSTransportConnection *)&v4 dealloc];
}

- (id)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  objc_super v4 = self;
  objc_sync_enter(v4);
  v5 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" connection = %@\n", v5];

  [v3 appendFormat:@" type = %@\n", v4->_type];
  [v3 appendFormat:@" destination = %@\n", v4->_destination];
  [v3 appendFormat:@" session = %@\n", v4->_session];
  unsigned int v6 = [(MRDIDSTransportConnection *)v4 isValid];
  CFStringRef v7 = @"NO";
  if (v6) {
    CFStringRef v7 = @"YES";
  }
  [v3 appendFormat:@" isValid = %@\n", v7];
  [v3 appendFormat:@" error = %@\n", v4->_error];
  objc_sync_exit(v4);

  [v3 appendString:@"}>"];

  return v3;
}

- (BOOL)isValid
{
  return [(MRDIDSServiceConnection *)self->_connection isConnected];
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSError *)v2->_error copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)runLoop
{
  return 0;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = -[MRDIDSTransportConnection _idsPriorityFromPriority:](self, "_idsPriorityFromPriority:", [v6 priority]);
  unsigned __int8 v9 = [v6 isWaking];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v13 = IDSSendMessageOptionNonWakingKey;
    id v14 = &__kCFBooleanTrue;
    v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  }
  [(MRDIDSServiceConnection *)self->_connection sendMessage:v7 type:self->_type destination:self->_destination session:self->_session options:v10 priority:v8];
  id v11 = [v7 length];

  return (unint64_t)v11;
}

- (void)closeWithError:(id)a3
{
  id v8 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  connection = v4->_connection;
  if (connection)
  {
    [(MRDIDSServiceConnection *)connection removeMessageHandlerForType:v4->_type destination:v4->_destination session:v4->_session];
    id v6 = v8;
    if (!v8) {
      id v6 = [objc_alloc((Class)NSError) initWithMRError:104];
    }
    id v8 = v6;
    objc_storeStrong((id *)&v4->_error, v6);
    id v7 = v4->_connection;
    v4->_connection = 0;

    objc_sync_exit(v4);
    [(MRDIDSTransportConnection *)v4 _notifyDelegateDidCloseWithError:v8];
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
    id v6 = [(MRDIDSTransportConnection *)self _exportDescriptorForOutputDevice:v5 endpoint:v4 remoteControl:1];

    if (v6)
    {
      id v7 = [v4 outputDevices];
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_10008D05C;
      v18 = &unk_100418698;
      v19 = self;
      id v8 = v4;
      id v20 = v8;
      unsigned __int8 v9 = objc_msgSend(v7, "mr_compactMap:", &v15);
      id v10 = objc_msgSend(v9, "mutableCopy", v15, v16, v17, v18, v19);

      [v10 addObject:v6];
      id v11 = [v8 descriptor];
      [v11 setDesignatedGroupLeader:v6];
      [v11 setOutputDevices:v10];
      id v12 = [objc_alloc((Class)MRAVDistantEndpoint) initWithDescriptor:v11];
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
      id v12 = v4;
    }
  }

  return v12;
}

- (id)exportOutputDevice:(id)a3 endpoint:(id)a4
{
  id v4 = [(MRDIDSTransportConnection *)self _exportDescriptorForOutputDevice:a3 endpoint:a4 remoteControl:0];
  id v5 = [objc_alloc((Class)MRAVDistantOutputDevice) initWithDescriptor:v4];

  return v5;
}

- (int64_t)_idsPriorityFromPriority:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 100;
  }
  else {
    return qword_1003C5488[a3];
  }
}

- (id)_exportDescriptorForOutputDevice:(id)a3 endpoint:(id)a4 remoteControl:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  unsigned __int8 v9 = [v7 descriptor];
  [v9 setTransportType:4];
  id v10 = +[MROrigin localOrigin];
  id v11 = +[MRDeviceInfoRequest deviceInfoForOrigin:v10];

  if (v5)
  {
    unsigned int v12 = 1;
  }
  else
  {
    uint64_t v13 = [v7 uid];
    unsigned int v12 = [v8 containsOutputDeviceWithUID:v13];
  }
  if ([v7 isLocalDevice])
  {
    [v11 deviceClass];
    [v9 setHostDeviceClass:_MRDeviceInfoMessageProtobuf_DeviceClassFromModel()];
    id v14 = [v11 modelID];
    [v9 setModelID:v14];

    v15 = (void *)IDSCopyLocalDeviceUniqueID();
    [v9 setPrimaryUID:v15];

    if (v12)
    {
      uint64_t v16 = [v11 groupUID];
      [v9 setGroupID:v16];

      [v9 setGroupContainsGroupLeader:1];
      [v9 setIsRemoteControllable:1];
      [v9 setIsGroupLeader:1];
      [v9 setIsLocalDevice:0];
      v17 = [v8 outputDevices];
      objc_msgSend(v9, "setIsProxyGroupPlayer:", objc_msgSend(v17, "mr_any:", &stru_100419810));
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
      id v20 = [v7 sourceInfo];
      unsigned __int8 v21 = [v20 multipleBuiltInDevices];

      if ((v21 & 1) == 0)
      {
        objc_super v22 = [v11 localizedModelName];
        [v9 setName:v22];
      }
    }
    if (v5)
    {
      v23 = [v11 WHAIdentifier];
      [v9 setUniqueIdentifier:v23];

      v19 = [v11 localizedModelName];
      [v9 setName:v19];
      goto LABEL_16;
    }
  }
  else if (([v8 isLocalEndpoint] & v12) == 1)
  {
    [v9 setIsRemoteControllable:1];
    [v9 setIsGroupLeader:0];
    v18 = [v7 groupID];

    if (!v18)
    {
      v19 = [v11 groupUID];
      [v9 setGroupID:v19];
LABEL_16:
    }
  }

  return v9;
}

- (MRDIDSServiceConnection)connection
{
  return self->_connection;
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
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end