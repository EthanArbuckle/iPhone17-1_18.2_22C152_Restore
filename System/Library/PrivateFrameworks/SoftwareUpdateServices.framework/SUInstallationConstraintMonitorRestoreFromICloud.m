@interface SUInstallationConstraintMonitorRestoreFromICloud
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (unint64_t)unsatisfiedConstraints;
- (void)_queue_restoreStateChanged;
- (void)dealloc;
@end

@implementation SUInstallationConstraintMonitorRestoreFromICloud

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  v16.receiver = self;
  v16.super_class = (Class)SUInstallationConstraintMonitorRestoreFromICloud;
  v8 = [(SUInstallationConstraintMonitorBase *)&v16 initOnQueue:v6 withRepresentedInstallationConstraints:8 andDownload:v7];
  v9 = v8;
  if (v8)
  {
    v8[13] = -1;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__5;
    v14[4] = __Block_byref_object_dispose__5;
    v10 = v8;
    id v15 = v10;
    v11 = (const char *)[(id)*MEMORY[0x263F55A10] UTF8String];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __77__SUInstallationConstraintMonitorRestoreFromICloud_initOnQueue_withDownload___block_invoke;
    handler[3] = &unk_26447D700;
    handler[4] = v14;
    notify_register_dispatch(v11, v9 + 13, v6, handler);
    objc_msgSend(v10, "_queue_restoreStateChanged");
    _Block_object_dispose(v14, 8);
  }
  return v9;
}

uint64_t __77__SUInstallationConstraintMonitorRestoreFromICloud_initOnQueue_withDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_queue_restoreStateChanged");
}

- (void)dealloc
{
  notify_cancel(self->_queue_restoreToken);
  self->_queue_restoreToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)SUInstallationConstraintMonitorRestoreFromICloud;
  [(SUInstallationConstraintMonitorRestoreFromICloud *)&v3 dealloc];
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (!self->_queue_isRestoring) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void)_queue_restoreStateChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  uint64_t state64 = 0;
  notify_get_state(self->_queue_restoreToken, &state64);
  BOOL v3 = state64 - 1 < 2;
  if (self->_queue_isRestoring != v3)
  {
    self->_queue_isRestoring = v3;
    v4 = SULogInstallConstraints();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isRestoring) {
        v5 = @"NO";
      }
      else {
        v5 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_21DCF7000, v4, OS_LOG_TYPE_DEFAULT, "%@ - iCloud restore constraint changed (satisfied? %@)", buf, 0x16u);
    }

    v6 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v6, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

@end