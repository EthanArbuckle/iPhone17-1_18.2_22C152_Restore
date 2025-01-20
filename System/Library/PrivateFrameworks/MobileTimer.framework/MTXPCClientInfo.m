@interface MTXPCClientInfo
+ (id)clientInfoForConnection:(id)a3 clientLink:(id)a4;
- (BOOL)donatesIntent;
- (BOOL)isEqual:(id)a3;
- (MTXPCClientInfo)initWithConnection:(id)a3 clientLink:(id)a4;
- (NSDate)connectedDate;
- (NSString)description;
- (NSString)processName;
- (NSXPCConnection)connection;
- (id)clientLink;
- (id)sourceIdentifier;
- (int)processID;
- (unint64_t)hash;
- (void)setClientLink:(id)a3;
- (void)setConnectedDate:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation MTXPCClientInfo

- (unint64_t)hash
{
  v2 = [(MTXPCClientInfo *)self connection];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)clientInfoForConnection:(id)a3 clientLink:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnection:v6 clientLink:v5];

  return v7;
}

- (MTXPCClientInfo)initWithConnection:(id)a3 clientLink:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTXPCClientInfo;
  v9 = [(MTXPCClientInfo *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong(&v10->_clientLink, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    connectedDate = v10->_connectedDate;
    v10->_connectedDate = (NSDate *)v11;
  }
  return v10;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MTXPCClientInfo *)self processName];
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[MTXPCClientInfo processID](self, "processID"));
  id v7 = [(MTXPCClientInfo *)self connectedDate];
  id v8 = [(MTXPCClientInfo *)self connection];
  v9 = [v3 stringWithFormat:@"<%@:%p ProcessName: %@ ProcessID: %@ Connected: %@ Connection: %@>", v4, self, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)processName
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  proc_name(-[MTXPCClientInfo processID](self, "processID", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0),
    &v5,
    0x100u);
  v2 = [NSString stringWithUTF8String:&v5];
  unint64_t v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSDate)connectedDate
{
  return self->_connectedDate;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MTXPCClientInfo *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v5 = [(MTXPCClientInfo *)self connection];
      uint64_t v6 = [(MTXPCClientInfo *)v4 connection];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (int)processID
{
  v2 = [(MTXPCClientInfo *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)sourceIdentifier
{
  int v3 = NSString;
  uint64_t v4 = [(MTXPCClientInfo *)self processName];
  long long v5 = [v3 stringWithFormat:@"%@-%d", v4, -[MTXPCClientInfo processID](self, "processID")];

  return v5;
}

- (BOOL)donatesIntent
{
  return 1;
}

- (void)setConnection:(id)a3
{
}

- (id)clientLink
{
  return self->_clientLink;
}

- (void)setClientLink:(id)a3
{
}

- (void)setConnectedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedDate, 0);
  objc_storeStrong(&self->_clientLink, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end