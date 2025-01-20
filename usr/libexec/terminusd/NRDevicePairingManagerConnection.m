@interface NRDevicePairingManagerConnection
- (void)dealloc;
@end

@implementation NRDevicePairingManagerConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingManagers, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)dealloc
{
  if (self)
  {
    xpcConnection = self->_xpcConnection;
    if (xpcConnection)
    {
      xpc_connection_cancel(xpcConnection);
      v4 = self->_xpcConnection;
      self->_xpcConnection = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NRDevicePairingManagerConnection;
  [(NRDevicePairingManagerConnection *)&v5 dealloc];
}

@end