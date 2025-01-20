@interface MRApplicationConnectionListener
- (BOOL)handleIncomingConnection:(id)a3 requestInfo:(id)a4;
- (MRApplicationConnectionListener)initWithServiceName:(id)a3 playerPath:(id)a4 incomingConnectionHandler:(id)a5;
- (MRPlayerPath)playerPath;
- (NSString)serviceName;
- (id)handler;
- (void)setHandler:(id)a3;
@end

@implementation MRApplicationConnectionListener

- (MRApplicationConnectionListener)initWithServiceName:(id)a3 playerPath:(id)a4 incomingConnectionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MRApplicationConnectionListener;
  v12 = [(MRApplicationConnectionListener *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_playerPath, a4);
    uint64_t v14 = MEMORY[0x1997190F0](v11);
    id handler = v13->_handler;
    v13->_id handler = (id)v14;
  }
  v16 = +[MRClientApplicationConnectionManager sharedManager];
  [v16 registerListener:v13];

  return v13;
}

- (BOOL)handleIncomingConnection:(id)a3 requestInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MRApplicationConnectionListener *)self handler];
  char v9 = ((uint64_t (**)(void, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end