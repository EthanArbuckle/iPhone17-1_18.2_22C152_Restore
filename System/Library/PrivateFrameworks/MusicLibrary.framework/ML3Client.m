@interface ML3Client
+ (ML3Client)daemonClient;
+ (ML3Client)processClient;
- (BOOL)isDaemonClient;
- (ML3Client)init;
- (ML3Client)initWithConnection:(id)a3;
- (NSString)bundleID;
- (NSXPCConnection)connection;
- (id)description;
- (int)processID;
@end

@implementation ML3Client

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ML3Client *)self bundleID];
  v6 = [v3 stringWithFormat:@"<%@: %p %@ [%lld]>", v4, self, v5, -[ML3Client processID](self, "processID")];

  return v6;
}

- (int)processID
{
  return self->_processID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (ML3Client)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ML3Client;
  v6 = [(ML3Client *)&v10 init];
  v7 = v6;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_processID = [v5 processIdentifier];
    [v5 auditToken];
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    bundleID = v7->_bundleID;
    v7->_bundleID = 0;
  }
  return v7;
}

- (BOOL)isDaemonClient
{
  v3 = [(id)objc_opt_class() daemonClient];
  LOBYTE(self) = [(ML3Client *)self isEqual:v3];

  return (char)self;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

+ (ML3Client)daemonClient
{
  return (ML3Client *)+[ML3DaemonClient sharedDaemonClient];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (ML3Client)init
{
  return 0;
}

+ (ML3Client)processClient
{
  return (ML3Client *)+[ML3ProcessClient sharedProcessClient];
}

@end