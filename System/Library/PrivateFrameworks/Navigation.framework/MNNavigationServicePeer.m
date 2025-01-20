@interface MNNavigationServicePeer
- (BOOL)isEntitled;
- (MNNavigationServicePeer)initWithConnection:(id)a3;
- (NSString)peerIdentifier;
- (id)auditToken;
- (id)description;
- (int)processIdentifier;
- (void)clearConnection;
@end

@implementation MNNavigationServicePeer

- (BOOL)isEntitled
{
  return [(GEONavdPeer *)self hasEntitlement:@"com.apple.navigation.spi"];
}

- (MNNavigationServicePeer)initWithConnection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MNNavigationServicePeer;
  v5 = [(GEONavdPeer *)&v16 initWithXPCConnection:v4];
  if (v5)
  {
    uint64_t v6 = [v4 valueForEntitlement:@"application-identifier"];
    uint64_t v7 = [v4 processIdentifier];
    uint64_t v8 = v7;
    if (!v6)
    {
      int v9 = proc_pidpath(v7, buffer, 0x400u);
      if (v9 < 1)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"pid = %d", v8);
        v10 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v6;
          _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "No application ID or process name found. Using process ID as ID: %@", buf, 0xCu);
        }
      }
      else
      {
        v10 = [[NSString alloc] initWithBytes:buffer length:v9 encoding:4];
        uint64_t v6 = [v10 lastPathComponent];
        v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v6;
          _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEBUG, "No application ID found. Using process name as ID: %@", buf, 0xCu);
        }
      }
    }
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      buffer[0] = 67109378;
      buffer[1] = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_INFO, "Allocating new peer for process identifier: %d, peer identifier: %@", (uint8_t *)buffer, 0x12u);
    }

    peerIdentifier = v5->_peerIdentifier;
    v5->_peerIdentifier = (NSString *)v6;

    v5->_processIdentifier = v8;
    v14 = v5;
  }

  return v5;
}

- (void)clearConnection
{
  uint64_t v3 = (int)*MEMORY[0x1E4F64C98];
  [*(id *)((char *)&self->super.super.isa + v3) setInvalidationHandler:0];
  [*(id *)((char *)&self->super.super.isa + v3) setInterruptionHandler:0];
  id v4 = *(Class *)((char *)&self->super.super.isa + v3);
  [v4 setExportedObject:0];
}

- (id)auditToken
{
  return (id)[*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F64C90]) auditToken];
}

- (id)description
{
  peerIdentifier = self->_peerIdentifier;
  uint64_t v3 = NSString;
  uint64_t processIdentifier = self->_processIdentifier;
  v5 = [*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F64C98]) remoteObjectProxy];
  uint64_t v6 = [v3 stringWithFormat:@"('%@', pid: %d, remoteObjectProxy: %p)", peerIdentifier, processIdentifier, v5];

  return v6;
}

- (NSString)peerIdentifier
{
  return self->_peerIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void).cxx_destruct
{
}

@end