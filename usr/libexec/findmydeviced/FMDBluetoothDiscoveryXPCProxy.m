@interface FMDBluetoothDiscoveryXPCProxy
- (FMNSXPCConnection)connection;
- (id)didDiscoverDevice;
- (id)didEndDiscovery;
- (id)didLoseDevice;
- (void)_didEndDiscoveryWithError:(id)a3;
- (void)didDiscoverDevice:(id)a3;
- (void)didEndDiscoveryWithError:(id)a3;
- (void)didLoseDevice:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDidDiscoverDevice:(id)a3;
- (void)setDidEndDiscovery:(id)a3;
- (void)setDidLoseDevice:(id)a3;
- (void)startDiscovery;
- (void)stopDiscovery;
@end

@implementation FMDBluetoothDiscoveryXPCProxy

- (void)startDiscovery
{
  v3 = [(FMDBluetoothDiscoveryXPCProxy *)self connection];
  v4 = v3;
  if (v3 && [v3 state] == (id)1)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = objc_alloc((Class)FMNSXPCConnection);
    v7 = +[FMNSXPCConnectionConfiguration btDiscoveryConfiguration];
    id v5 = [v6 initWithConfiguration:v7 exportedObject:self];

    objc_initWeak(&location, self);
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_1000B33D8;
    v12 = &unk_1002DCD40;
    objc_copyWeak(&v13, &location);
    [v5 addFailureBlock:&v9];
    -[FMDBluetoothDiscoveryXPCProxy setConnection:](self, "setConnection:", v5, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  v8 = [v5 remoteObjectProxy];
  [v8 startDiscovery];
}

- (void)stopDiscovery
{
  v2 = [(FMDBluetoothDiscoveryXPCProxy *)self connection];
  if (v2)
  {
    id v4 = v2;
    v3 = [v2 remoteObjectProxy];
    [v3 stopDiscovery];

    v2 = v4;
  }
}

- (void)didEndDiscoveryWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1002432AC((uint64_t)v4, v5);
    }
  }
  [(FMDBluetoothDiscoveryXPCProxy *)self _didEndDiscoveryWithError:v4];
}

- (void)didDiscoverDevice:(id)a3
{
  id v6 = a3;
  id v4 = [(FMDBluetoothDiscoveryXPCProxy *)self didDiscoverDevice];

  if (v4)
  {
    id v5 = [(FMDBluetoothDiscoveryXPCProxy *)self didDiscoverDevice];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)didLoseDevice:(id)a3
{
  id v6 = a3;
  id v4 = [(FMDBluetoothDiscoveryXPCProxy *)self didLoseDevice];

  if (v4)
  {
    id v5 = [(FMDBluetoothDiscoveryXPCProxy *)self didLoseDevice];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)_didEndDiscoveryWithError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(FMDBluetoothDiscoveryXPCProxy *)self didEndDiscovery];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (id)didEndDiscovery
{
  return self->_didEndDiscovery;
}

- (void)setDidEndDiscovery:(id)a3
{
}

- (id)didDiscoverDevice
{
  return self->_didDiscoverDevice;
}

- (void)setDidDiscoverDevice:(id)a3
{
}

- (id)didLoseDevice
{
  return self->_didLoseDevice;
}

- (void)setDidLoseDevice:(id)a3
{
}

- (FMNSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_didLoseDevice, 0);
  objc_storeStrong(&self->_didDiscoverDevice, 0);

  objc_storeStrong(&self->_didEndDiscovery, 0);
}

@end