@interface VSKeepAlive
- (BOOL)active;
- (BOOL)keepAudioSessionActive;
- (id)_remoteKeepAlive;
- (id)_serverConnection;
- (int64_t)audioType;
- (void)_ensureKeepAliveMaintenance;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setAudioType:(int64_t)a3;
- (void)setKeepAudioSessionActive:(BOOL)a3;
@end

@implementation VSKeepAlive

- (void).cxx_destruct
{
}

- (BOOL)keepAudioSessionActive
{
  return self->_keepAudioSessionActive;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setAudioType:(int64_t)a3
{
  self->_audioType = a3;
}

- (int64_t)audioType
{
  return self->_audioType;
}

- (void)_ensureKeepAliveMaintenance
{
  if (self->_active)
  {
    id v3 = [(VSKeepAlive *)self _remoteKeepAlive];
    [v3 maintainWithAudioType:self->_audioType keepAudioSessionActive:self->_keepAudioSessionActive];
  }
}

- (void)setKeepAudioSessionActive:(BOOL)a3
{
  self->_keepAudioSessionActive = a3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v5 = [(VSKeepAlive *)self _remoteKeepAlive];
    id v6 = v5;
    if (v3) {
      [v5 maintainWithAudioType:self->_audioType keepAudioSessionActive:self->_keepAudioSessionActive];
    }
    else {
      [v5 cancel];
    }
  }
}

- (id)_remoteKeepAlive
{
  v2 = [(VSKeepAlive *)self _serverConnection];
  BOOL v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_serverConnection
{
  serverConnection = self->_serverConnection;
  if (!serverConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.voiceservices.keepalive" options:0];
    v5 = self->_serverConnection;
    self->_serverConnection = v4;

    id v6 = self->_serverConnection;
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C1C74F0];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v8 = self->_serverConnection;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __32__VSKeepAlive__serverConnection__block_invoke;
    v13 = &unk_2640E8B50;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:&v10];
    [(NSXPCConnection *)self->_serverConnection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    serverConnection = self->_serverConnection;
  }
  return serverConnection;
}

void __32__VSKeepAlive__serverConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _ensureKeepAliveMaintenance];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_serverConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VSKeepAlive;
  [(VSKeepAlive *)&v3 dealloc];
}

@end