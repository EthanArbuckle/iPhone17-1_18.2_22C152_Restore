@interface MRDIDSTransport
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (BOOL)supportsIdleDisconnection;
- (MRAVOutputDevice)outputDevice;
- (MRDIDSServiceConnection)idsConnection;
- (MRDIDSTransport)initWithOutputDevice:(id)a3;
- (MRDIDSTransportConnection)transport;
- (NSString)sessionUID;
- (id)_createConnectionWithUserInfo:(id)a3;
- (id)_generateSessionUID;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)debugDescription;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)uid;
- (int64_t)port;
- (void)_synchronized_setSessionUID:(id)a3;
- (void)resetWithError:(id)a3;
- (void)setIdsConnection:(id)a3;
- (void)setSessionUID:(id)a3;
- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3;
- (void)setTransport:(id)a3;
@end

@implementation MRDIDSTransport

- (MRDIDSTransport)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRDIDSTransport;
  v6 = [(MRDIDSTransport *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
    id v8 = objc_alloc_init((Class)MRDeviceInfo);
    v9 = [v5 name];
    [v8 setName:v9];

    v10 = [v5 primaryID];
    [v8 setDeviceUID:v10];

    objc_storeStrong((id *)&v7->_deviceInfo, v8);
    v11 = [MRDIDSServiceConnection alloc];
    v12 = [v8 deviceUID];
    v13 = [(MRDIDSServiceConnection *)v11 initWithDeviceUID:v12];
    idsConnection = v7->_idsConnection;
    v7->_idsConnection = v13;

    objc_initWeak(&location, v7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000854D8;
    v16[3] = &unk_100416C88;
    objc_copyWeak(&v17, &location);
    [(MRDIDSServiceConnection *)v7->_idsConnection setInvalidationHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v7;
}

- (id)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  v4 = self;
  objc_sync_enter(v4);
  id v5 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" connection = %@\n", v5];

  [v3 appendFormat:@" outputDevice = %@\n", v4->_outputDevice];
  [v3 appendFormat:@" session = %@\n", v4->_sessionUID];
  [v3 appendFormat:@" error = %@\n", v4->_error];
  objc_sync_exit(v4);

  [v3 appendString:@"}>"];

  return v3;
}

- (id)name
{
  v2 = [(MRDIDSTransport *)self deviceInfo];
  id v3 = [v2 name];

  return v3;
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (id)uid
{
  v2 = [(MRDIDSTransport *)self deviceInfo];
  id v3 = [v2 WHAIdentifier];

  return v3;
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_error;
  objc_sync_exit(v2);

  return v3;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDIDSTransport *)self sessionUID];

  if (!v5)
  {
    v6 = [(MRDIDSTransport *)self _generateSessionUID];
    [(MRDIDSTransport *)self setSessionUID:v6];

    v7 = dispatch_group_create();
    idsConnection = self->_idsConnection;
    uint64_t v9 = MRIDSServiceMessageTypeProtobuf;
    v10 = [(MRDIDSTransport *)self uid];
    v11 = [(MRDIDSTransport *)self sessionUID];
    [(MRDIDSServiceConnection *)idsConnection setMessageHandler:&stru_1004193F0 forType:v9 destination:v10 session:v11];

    dispatch_group_enter(v7);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100085ACC;
    v17[3] = &unk_100415CC8;
    v12 = v7;
    v18 = v12;
    [(MRDIDSServiceConnection *)self->_idsConnection setConnectionHandler:v17];
    if ([(MRDIDSServiceConnection *)self->_idsConnection isConnected]) {
      dispatch_group_leave(v12);
    }
    v13 = [(MRDIDSTransport *)self _createConnectionWithUserInfo:v4];
    transport = self->_transport;
    self->_transport = v13;
  }
  v15 = self->_transport;

  return v15;
}

- (id)_createConnectionWithUserInfo:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100085D88;
  v32 = sub_100085D98;
  id v33 = 0;
  id v27 = 0;
  v6 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v27];
  id v23 = v27;
  idsConnection = self->_idsConnection;
  id v8 = [(MRDIDSTransport *)self uid];
  uint64_t v9 = [(MRDIDSTransport *)self sessionUID];
  uint64_t v10 = MRIDSServiceMessageTypeConnectRemoteControl;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100085DA0;
  v24[3] = &unk_100419440;
  v26 = &v28;
  v11 = v5;
  v25 = v11;
  [(MRDIDSServiceConnection *)idsConnection sendMessage:v6 type:v10 destination:v8 session:v9 options:0 priority:300 response:v24];

  if (self->_shouldUseSystemAuthenticationPrompt) {
    int64_t v12 = 90000000000;
  }
  else {
    int64_t v12 = 14000000000;
  }
  dispatch_time_t v13 = dispatch_time(0, v12);
  intptr_t v14 = dispatch_semaphore_wait(v11, v13);
  v15 = (void *)v29[5];
  if (v14 || v15)
  {
    v21 = v15;
    v20 = 0;
    error = self->_error;
    self->_error = v21;
  }
  else
  {
    v16 = [MRDIDSTransportConnection alloc];
    id v17 = self->_idsConnection;
    error = [(MRDIDSTransport *)self uid];
    objc_super v19 = [(MRDIDSTransport *)self sessionUID];
    v20 = [(MRDIDSTransportConnection *)v16 initWithConnection:v17 type:MRIDSServiceMessageTypeRemoteControl destination:error session:v19];
  }
  _Block_object_dispose(&v28, 8);

  return v20;
}

- (void)resetWithError:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(MRDIDSTransportConnection *)v4->_transport closeWithError:v5];
  objc_sync_exit(v4);
}

- (BOOL)supportsIdleDisconnection
{
  return 1;
}

- (void)setSessionUID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(MRDIDSTransport *)v4 _synchronized_setSessionUID:v5];
  objc_sync_exit(v4);
}

- (void)_synchronized_setSessionUID:(id)a3
{
  id v5 = a3;
  p_sessionUID = &self->_sessionUID;
  if (self->_sessionUID)
  {
    idsConnection = self->_idsConnection;
    uint64_t v8 = MRIDSServiceMessageTypeDisconnectRemoteControl;
    uint64_t v9 = [(MRDIDSTransport *)self uid];
    [(MRDIDSServiceConnection *)idsConnection removeMessageHandlerForType:v8 destination:v9 session:*p_sessionUID];
  }
  objc_storeStrong((id *)&self->_sessionUID, a3);
  if (*p_sessionUID)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = self->_idsConnection;
    objc_copyWeak(&v13, &location);
    v11 = [(MRDIDSTransport *)self uid];
    [(MRDIDSServiceConnection *)v10 setMessageHandler:&v12 forType:MRIDSServiceMessageTypeDisconnectRemoteControl destination:v11 session:*p_sessionUID];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (id)_generateSessionUID
{
  id v2 = objc_alloc((Class)NSString);
  id v3 = +[NSUUID UUID];
  id v4 = [v3 UUIDString];
  id v5 = [v2 initWithFormat:@"%@-%d", v4, ++dword_10047E028];

  return v5;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return self->_shouldUseSystemAuthenticationPrompt;
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  self->_shouldUseSystemAuthenticationPrompt = a3;
}

- (id)deviceInfo
{
  return self->_deviceInfo;
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (MRDIDSTransportConnection)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (MRDIDSServiceConnection)idsConnection
{
  return self->_idsConnection;
}

- (void)setIdsConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsConnection, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end