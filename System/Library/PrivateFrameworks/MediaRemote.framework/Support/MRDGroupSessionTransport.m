@interface MRDGroupSessionTransport
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (BOOL)supportsIdleDisconnection;
- (BOOL)supportsReconnection;
- (MRAVOutputDevice)outputDevice;
- (MRDGroupSessionTransport)initWithOutputDevice:(id)a3;
- (MRDGroupSessionTransportConnection)connection;
- (NSError)connectionError;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)description;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)subscribedPlayerPaths;
- (id)uid;
- (int64_t)port;
- (void)resetWithError:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionError:(id)a3;
@end

@implementation MRDGroupSessionTransport

- (MRDGroupSessionTransport)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRDGroupSessionTransport;
  v6 = [(MRDGroupSessionTransport *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
    id v8 = objc_alloc((Class)MRClient);
    id v9 = [v8 initWithBundleIdentifier:kMRMediaRemoteSystemMediaApplicationDisplayIdentifier];
    id v10 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:0 client:v9 player:0];
    id v15 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v15 count:1];
    subscribedPlayerPaths = v7->_subscribedPlayerPaths;
    v7->_subscribedPlayerPaths = (NSArray *)v11;
  }
  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(MRAVOutputDevice *)self->_outputDevice uid];
  id v5 = [(MRAVOutputDevice *)self->_outputDevice groupSessionInfo];
  v6 = +[NSString stringWithFormat:@"<%@:%p identifier=%@ info=%@>", v3, self, v4, v5];

  return v6;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 groupSessionServer];
  v6 = [v5 sessionManager];
  v7 = [v6 session];

  id v8 = [(MRDGroupSessionTransport *)self outputDevice];
  id v9 = [v8 groupID];

  id v10 = [v7 identifier];
  if (v10 == v9)
  {
  }
  else
  {
    uint64_t v11 = v10;
    unsigned __int8 v12 = [v10 isEqual:v9];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = MRGroupSessionError;
      objc_super v14 = +[NSString stringWithFormat:@"Could not find session corresponding to identifier: %@", v9];
      +[NSError msv_errorWithDomain:v13, 2, @"%@", v14 code debugDescription];
      goto LABEL_8;
    }
  }
  id v15 = [v7 leader];

  if (v15)
  {
    v16 = [MRDGroupSessionTransportConnection alloc];
    v17 = [v7 leader];
    v18 = [(MRDGroupSessionTransportConnection *)v16 initWithGroupSession:v7 participant:v17];
    [(MRDGroupSessionTransport *)self setConnection:v18];

    v19 = [(MRDGroupSessionTransport *)self connection];
    goto LABEL_9;
  }
  uint64_t v20 = MRGroupSessionError;
  objc_super v14 = +[NSString stringWithFormat:@"Could not find session leader on session: %@", v7];
  +[NSError msv_errorWithDomain:v20, 8, @"%@", v14 code debugDescription];
  v21 = LABEL_8:;
  [(MRDGroupSessionTransport *)self setConnectionError:v21];

  v19 = 0;
LABEL_9:

  return v19;
}

- (BOOL)supportsReconnection
{
  return 0;
}

- (BOOL)supportsIdleDisconnection
{
  return 0;
}

- (void)resetWithError:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionTransport] %@ Reset with error: %@", (uint8_t *)&v7, 0x16u);
  }

  [(MRDGroupSessionTransport *)self setConnectionError:v4];
  v6 = [(MRDGroupSessionTransport *)self connection];
  [v6 closeWithError:v4];
}

- (id)deviceInfo
{
  id v3 = objc_alloc_init((Class)MRDeviceInfo);
  id v4 = [(MRDGroupSessionTransport *)self outputDevice];
  id v5 = [v4 name];
  [v3 setName:v5];

  v6 = [(MRDGroupSessionTransport *)self outputDevice];
  int v7 = [v6 primaryID];
  [v3 setDeviceUID:v7];

  return v3;
}

- (id)uid
{
  v2 = [(MRDGroupSessionTransport *)self outputDevice];
  id v3 = [v2 uid];

  return v3;
}

- (id)name
{
  v2 = [(MRDGroupSessionTransport *)self outputDevice];
  id v3 = [v2 name];

  return v3;
}

- (id)hostname
{
  return &stru_10042ACB0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return 0;
}

- (id)error
{
  return [(MRDGroupSessionTransport *)self connectionError];
}

- (id)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (MRDGroupSessionTransportConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSError)connectionError
{
  return self->_connectionError;
}

- (void)setConnectionError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionError, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);

  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
}

@end