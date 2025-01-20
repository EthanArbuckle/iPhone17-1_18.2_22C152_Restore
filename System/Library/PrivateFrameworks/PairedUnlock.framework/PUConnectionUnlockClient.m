@interface PUConnectionUnlockClient
- (PUConnection)connection;
- (PUConnectionUnlockClient)initWithConnection:(id)a3;
- (void)didDisableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4;
- (void)didEnableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4;
- (void)didGetRemoteDeviceState:(id)a3 error:(id)a4;
- (void)didPairForUnlock:(BOOL)a3 error:(id)a4;
- (void)didUnpairForUnlock:(BOOL)a3 error:(id)a4;
- (void)remoteDeviceDidCompleteRemoteAction:(BOOL)a3 remoteDeviceState:(id)a4 error:(id)a5;
- (void)remoteDeviceDidRemoveLockout:(BOOL)a3 error:(id)a4;
- (void)remoteDeviceDidUnlock;
- (void)setConnection:(id)a3;
@end

@implementation PUConnectionUnlockClient

- (PUConnectionUnlockClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUConnectionUnlockClient;
  v5 = [(PUConnectionUnlockClient *)&v7 self];

  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v5;
}

- (void)didPairForUnlock:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  p_connection = &self->_connection;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained didPairForUnlock:v4 error:v6];
}

- (void)didUnpairForUnlock:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  p_connection = &self->_connection;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained didUnpairForUnlock:v4 error:v6];
}

- (void)didEnableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  p_connection = &self->_connection;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained didEnableOnlyRemoteUnlock:v4 error:v6];
}

- (void)didDisableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  p_connection = &self->_connection;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained didDisableOnlyRemoteUnlock:v4 error:v6];
}

- (void)remoteDeviceDidCompleteRemoteAction:(BOOL)a3 remoteDeviceState:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  p_connection = &self->_connection;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained remoteDeviceDidCompleteRemoteAction:v6 remoteDeviceState:v9 error:v8];
}

- (void)remoteDeviceDidUnlock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained remoteDeviceDidUnlock];
}

- (void)remoteDeviceDidRemoveLockout:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  p_connection = &self->_connection;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained remoteDeviceDidRemoveLockout:v4 error:v6];
}

- (void)didGetRemoteDeviceState:(id)a3 error:(id)a4
{
  p_connection = &self->_connection;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained didGetRemoteDeviceState:v7 error:v6];
}

- (PUConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (PUConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end