@interface _NFXPCSession
- (BOOL)suspendWithInfo:(id)a3;
- (NSXPCConnection)connection;
- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4;
- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 allowsBackgroundMode:(BOOL)a5;
- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5;
- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6;
- (id)bundleIdentifier;
- (id)clientName;
- (id)powerAssertionIdentifier;
- (id)remoteObject;
- (int)processIdentifier;
- (void)activateWithToken:(id)a3 completion:(id)a4;
- (void)createHandoffTokenWithCompletion:(id)a3;
- (void)endSession:(id)a3;
- (void)prioritizeSessionWithCompletion:(id)a3;
- (void)releaseObjects;
- (void)resume;
- (void)setConnection:(id)a3;
@end

@implementation _NFXPCSession

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4
{
  return [(_NFXPCSession *)self initWithRemoteObject:a3 workQueue:a4 expressModeManager:0 allowsBackgroundMode:1];
}

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 allowsBackgroundMode:(BOOL)a5
{
  return [(_NFXPCSession *)self initWithRemoteObject:a3 workQueue:a4 expressModeManager:0 allowsBackgroundMode:a5];
}

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5
{
  return [(_NFXPCSession *)self initWithRemoteObject:a3 workQueue:a4 expressModeManager:a5 allowsBackgroundMode:1];
}

- (_NFXPCSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_NFXPCSession;
  v12 = [(_NFSession *)&v15 initWithWorkQueue:a4 expressModeManager:a5 allowsBackgroundMode:v6];
  v13 = v12;
  if (v12) {
    objc_storeStrong(&v12->_remoteObject, a3);
  }

  return v13;
}

- (void)releaseObjects
{
  id remoteObject = self->_remoteObject;
  self->_id remoteObject = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v5 = [WeakRetained NF_userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:@"ProxyObjects"];
  [v6 removeObject:self];

  v7.receiver = self;
  v7.super_class = (Class)_NFXPCSession;
  [(_NFSession *)&v7 releaseObjects];
}

- (BOOL)suspendWithInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NFXPCSession;
  BOOL v5 = [(_NFSession *)&v8 suspendWithInfo:v4];
  if (v5)
  {
    BOOL v6 = [(_NFXPCSession *)self remoteObject];
    [v6 handleSessionSuspended:v4];
  }
  return v5;
}

- (void)resume
{
  v4.receiver = self;
  v4.super_class = (Class)_NFXPCSession;
  [(_NFSession *)&v4 resume];
  v3 = [(_NFXPCSession *)self remoteObject];
  [v3 handleSessionResumed];
}

- (id)powerAssertionIdentifier
{
  v3 = [(_NFXPCSession *)self clientName];
  objc_super v4 = v3;
  if (!v3 || ![(__CFString *)v3 length])
  {

    objc_super v4 = @"unavailable";
  }
  id v5 = objc_alloc((Class)NSString);
  uint64_t v6 = [(_NFXPCSession *)self processIdentifier];
  ClassName = object_getClassName(self);
  v10.receiver = self;
  v10.super_class = (Class)_NFXPCSession;
  id v8 = [v5 initWithFormat:@"process:%@,pid:%d,%s,sessionID:%d", v4, v6, ClassName, -[_NFSession sessionID](&v10, "sessionID")];

  return v8;
}

- (id)clientName
{
  v3 = [(_NFXPCSession *)self connection];

  if (!v3) {
    goto LABEL_3;
  }
  objc_super v4 = [(_NFXPCSession *)self connection];
  id v5 = [v4 NF_userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"ClientName"];

  if (!v6) {
LABEL_3:
  }
    uint64_t v6 = &stru_100309C40;

  return v6;
}

- (int)processIdentifier
{
  v2 = [(_NFXPCSession *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (id)bundleIdentifier
{
  int v3 = [(_NFXPCSession *)self connection];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v5 = [WeakRetained NF_userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"BundleIdentifier"];

    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    id v8 = v7;
  }
  else
  {
    id v8 = objc_opt_new();
  }

  return v8;
}

- (void)endSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFXPCSession;
  [(_NFSession *)&v3 endSession:a3];
}

- (void)prioritizeSessionWithCompletion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFXPCSession;
  [(_NFSession *)&v3 prioritizeSessionWithCompletion:a3];
}

- (void)activateWithToken:(id)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)_NFXPCSession;
  [(_NFSession *)&v4 activateWithToken:a3 completion:a4];
}

- (void)createHandoffTokenWithCompletion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NFXPCSession;
  [(_NFSession *)&v3 createHandoffTokenWithCompletion:a3];
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (id)remoteObject
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObject, 0);

  objc_destroyWeak((id *)&self->_connection);
}

@end