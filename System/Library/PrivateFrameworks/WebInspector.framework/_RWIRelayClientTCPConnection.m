@interface _RWIRelayClientTCPConnection
+ (id)connectionFromLockdownCheckinWithInfo:(void *)a3 delegate:(id)a4;
+ (id)connectionFromTCPConnection:(id)a3 delegate:(id)a4;
- (_RWIRelayClientTCPConnection)initWithTCPConnection:(id)a3 delegate:(id)a4;
- (_RWITCPConnection)connection;
- (void)closeInternal;
- (void)sendMessage:(id)a3;
- (void)setConnection:(id)a3;
- (void)tcpConnection:(id)a3 didReceiveMessage:(id)a4;
@end

@implementation _RWIRelayClientTCPConnection

+ (id)connectionFromTCPConnection:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_RWIRelayClientTCPConnection alloc] initWithTCPConnection:v6 delegate:v5];

  return v7;
}

+ (id)connectionFromLockdownCheckinWithInfo:(void *)a3 delegate:(id)a4
{
  id v5 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F8C4F0], a3);
  secure_lockdown_checkin();
  CFRelease(Mutable);
  NSLog(&cfstr_UnableToCheckI.isa);

  return 0;
}

- (_RWIRelayClientTCPConnection)initWithTCPConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_RWIRelayClientTCPConnection;
  v8 = [(_RWIRelayClientConnection *)&v13 initWithDelegate:a4];
  v9 = v8;
  if (v8)
  {
    p_connection = (id *)&v8->_connection;
    objc_storeStrong((id *)&v8->_connection, a3);
    [*p_connection setDelegate:v9];
    [*p_connection startReceiving];
    v11 = v9;
  }

  return v9;
}

- (void)closeInternal
{
  connection = self->_connection;
  if (connection)
  {
    [(_RWITCPConnection *)connection setDelegate:0];
    v4 = self->_connection;
    self->_connection = 0;
  }
}

- (void)tcpConnection:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v7 = 0;
  id v5 = [MEMORY[0x263F08AC0] propertyListWithData:a4 options:0 format:0 error:&v7];
  uint64_t v6 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v6) {
    [(_RWIRelayClientConnection *)self dispatchRelayMessage:v5];
  }
}

- (void)sendMessage:(id)a3
{
  if (self->_connection)
  {
    uint64_t v6 = 0;
    v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v6];
    if (v4) {
      BOOL v5 = v6 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      [(_RWITCPConnection *)self->_connection sendMessage:v4];
    }
    else {
      [(_RWIRelayClientConnection *)self closeFromConnection];
    }
  }
}

- (_RWITCPConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end