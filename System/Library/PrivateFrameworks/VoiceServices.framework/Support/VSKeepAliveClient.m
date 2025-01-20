@interface VSKeepAliveClient
- (BOOL)_shouldChangeAudioSession;
- (void)cancel;
- (void)dealloc;
- (void)maintainWithAudioType:(int64_t)a3 keepAudioSessionActive:(BOOL)a4;
- (void)setManager:(id)a3;
@end

@implementation VSKeepAliveClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)cancel
{
  if (self->_isActive)
  {
    self->_isActive = 0;
    transaction = self->_transaction;
    self->_transaction = 0;

    if ([(VSKeepAliveClient *)self _shouldChangeAudioSession]) {
      sub_1000EF3E8(0, self->_activity);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained cancelKeepAlive:self];

    registryRunLoopSource = self->_registryRunLoopSource;
    if (registryRunLoopSource)
    {
      sub_1000E5930(registryRunLoopSource, 0);
    }
  }
}

- (void)maintainWithAudioType:(int64_t)a3 keepAudioSessionActive:(BOOL)a4
{
  if (!self->_isActive)
  {
    self->_isActive = 1;
    self->_activity = a3 & 3;
    self->_keepSessionActive = a4;
    if ([(VSKeepAliveClient *)self _shouldChangeAudioSession]) {
      sub_1000EF3E8(1, self->_activity);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained maintainKeepAlive:self];

    v9.version = 0;
    memset(&v9.retain, 0, 56);
    v9.info = self;
    v9.perform = (void (__cdecl *)(void *))nullsub_17;
    v6 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v6;

    v8 = CFRunLoopSourceCreate(0, 0, &v9);
    self->_registryRunLoopSource = v8;
    sub_1000E5930(v8, 1);
  }
}

- (BOOL)_shouldChangeAudioSession
{
  return self->_activity && self->_keepSessionActive;
}

- (void)setManager:(id)a3
{
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained cancelKeepAlive:self];

  registryRunLoopSource = self->_registryRunLoopSource;
  if (registryRunLoopSource)
  {
    sub_1000E5930(registryRunLoopSource, 0);
    CFRelease(self->_registryRunLoopSource);
  }
  v5.receiver = self;
  v5.super_class = (Class)VSKeepAliveClient;
  [(VSKeepAliveClient *)&v5 dealloc];
}

@end