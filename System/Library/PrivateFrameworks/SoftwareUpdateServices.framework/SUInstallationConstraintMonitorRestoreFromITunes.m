@interface SUInstallationConstraintMonitorRestoreFromITunes
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (unint64_t)unsatisfiedConstraints;
- (void)_queue_beganRestoring;
- (void)_queue_endedRestoring;
- (void)_queue_setRestoring:(BOOL)a3;
- (void)dealloc;
@end

@implementation SUInstallationConstraintMonitorRestoreFromITunes

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  v21.receiver = self;
  v21.super_class = (Class)SUInstallationConstraintMonitorRestoreFromITunes;
  id v8 = [(SUInstallationConstraintMonitorBase *)&v21 initOnQueue:v6 withRepresentedInstallationConstraints:64 andDownload:v7];
  v9 = v8;
  if (v8)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__3;
    v19[4] = __Block_byref_object_dispose__3;
    id v10 = v8;
    id v20 = v10;
    v11 = (const char *)[@"com.apple.MobileSync.BackupAgent.RestoreStarted" UTF8String];
    v12 = *((void *)v10 + 1);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke;
    handler[3] = &unk_26447D700;
    handler[4] = v19;
    notify_register_dispatch(v11, (int *)v10 + 13, v12, handler);
    v13 = (const char *)[@"com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded" UTF8String];
    v14 = *((void *)v10 + 1);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke_2;
    v17[3] = &unk_26447D700;
    v17[4] = v19;
    notify_register_dispatch(v13, (int *)v10 + 14, v14, v17);
    uint64_t state64 = 0;
    notify_get_state(*((_DWORD *)v10 + 13), &state64);
    if (state64) {
      objc_msgSend(v10, "_queue_beganRestoring");
    }
    _Block_object_dispose(v19, 8);
  }
  return v9;
}

uint64_t __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_queue_beganRestoring");
}

uint64_t __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_queue_endedRestoring");
}

- (void)dealloc
{
  notify_cancel(self->_queue_startNotifyToken);
  self->_queue_startNotifyToken = -1;
  notify_cancel(self->_queue_endNotifyToken);
  self->_queue_endNotifyToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)SUInstallationConstraintMonitorRestoreFromITunes;
  [(SUInstallationConstraintMonitorRestoreFromITunes *)&v3 dealloc];
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (!self->_queue_isRestoring) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void)_queue_beganRestoring
{
  BSDispatchQueueAssert();
  [(SUInstallationConstraintMonitorRestoreFromITunes *)self _queue_setRestoring:1];
}

- (void)_queue_endedRestoring
{
  BSDispatchQueueAssert();
  [(SUInstallationConstraintMonitorRestoreFromITunes *)self _queue_setRestoring:0];
}

- (void)_queue_setRestoring:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  if (self->_queue_isRestoring != v3)
  {
    self->_queue_isRestoring = v3;
    v5 = SULogInstallConstraints();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isRestoring) {
        id v6 = @"NO";
      }
      else {
        id v6 = @"YES";
      }
      int v8 = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_21DCF7000, v5, OS_LOG_TYPE_DEFAULT, "%@ - iTunes restore constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    id v7 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

@end