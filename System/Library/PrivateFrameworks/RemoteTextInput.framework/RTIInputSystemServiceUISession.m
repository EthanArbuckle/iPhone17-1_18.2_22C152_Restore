@interface RTIInputSystemServiceUISession
+ (id)sessionWithConnection:(id)a3 remoteProcess:(id)a4;
- (RTIInputSystemServiceUISession)initWithConnection:(id)a3 remoteProcess:(id)a4;
- (id)bundleIdentifier;
- (id)valueForEntitlement:(id)a3;
- (int)pid;
@end

@implementation RTIInputSystemServiceUISession

- (RTIInputSystemServiceUISession)initWithConnection:(id)a3 remoteProcess:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTIInputSystemServiceUISession;
  v8 = [(RTIInputSystemServiceSession *)&v11 initWithConnection:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_remoteProcess, a4);
  }

  return v9;
}

+ (id)sessionWithConnection:(id)a3 remoteProcess:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithConnection:v7 remoteProcess:v6];

  return v8;
}

- (int)pid
{
  return [(BSProcessHandle *)self->_remoteProcess pid];
}

- (id)bundleIdentifier
{
  return (id)[(BSProcessHandle *)self->_remoteProcess bundleIdentifier];
}

- (id)valueForEntitlement:(id)a3
{
  return (id)[(BSProcessHandle *)self->_remoteProcess valueForEntitlement:a3];
}

- (void).cxx_destruct
{
}

@end