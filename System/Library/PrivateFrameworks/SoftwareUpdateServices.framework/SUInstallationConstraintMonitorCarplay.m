@interface SUInstallationConstraintMonitorCarplay
- (id)initOnQueue:(id)a3 withDownload:(id)a4;
- (unint64_t)unsatisfiedConstraints;
- (void)_queue_carplayDidChange;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation SUInstallationConstraintMonitorCarplay

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BSDispatchQueueAssert();
  v41.receiver = self;
  v41.super_class = (Class)SUInstallationConstraintMonitorCarplay;
  id v8 = [(SUInstallationConstraintMonitorBase *)&v41 initOnQueue:v7 withRepresentedInstallationConstraints:512 andDownload:v6];

  if (v8)
  {
    if (dlopen("/System/Library/PrivateFrameworks/CarKit.framework/CarKit", 261))
    {
      Class Class = objc_getClass("CARSessionStatus");
      if (Class)
      {
        v17 = Class;
        if (objc_opt_respondsToSelector())
        {
          id v18 = [v17 alloc];
          if (objc_opt_respondsToSelector())
          {
            id v26 = v18;
            uint64_t v27 = [v26 initAndWaitUntilSessionUpdated];
            v28 = (void *)*((void *)v8 + 7);
            *((void *)v8 + 7) = v27;

            v29 = (void *)*((void *)v8 + 7);
            if (v29)
            {
              [v29 setSessionObserver:v8];
              v30 = [*((id *)v8 + 7) currentSession];
              *((unsigned char *)v8 + 48) = v30 != 0;

              return v8;
            }
          }
          else
          {
            SULogInfo(@"dynamically loaded CARSessionStatus class does not respond to selector initAndWaitUntilSessionUpdated", v19, v20, v21, v22, v23, v24, v25, (uint64_t)v41.receiver);
          }

LABEL_12:
          SULogInfo(@"Failed to dynamically load CARSessionStatus. Setting carplay enabled to NO", v32, v33, v34, v35, v36, v37, v38, (uint64_t)v41.receiver);
          v39 = (void *)*((void *)v8 + 7);
          *((void *)v8 + 7) = 0;

          *((unsigned char *)v8 + 48) = 0;
          return v8;
        }
        v31 = @"dynamically loaded CARSessionStatus class does not respond to selector alloc";
      }
      else
      {
        v31 = @"Failed to get class CARSessionStatus";
      }
    }
    else
    {
      v31 = @"Failed to open CarKit dylib";
    }
    SULogInfo(v31, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v41.receiver);
    goto LABEL_12;
  }
  return v8;
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (!self->_queue_CarplayConnected) {
    return 0;
  }
  return [(SUInstallationConstraintMonitorBase *)self representedConstraints];
}

- (void)_queue_carplayDidChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  queue_carSessionStatus = self->_queue_carSessionStatus;
  if (queue_carSessionStatus)
  {
    v4 = [(CARSessionStatus *)queue_carSessionStatus currentSession];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if (self->_queue_CarplayConnected != v5)
  {
    self->_queue_CarplayConnected = v5;
    id v6 = SULogInstallConstraints();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_CarplayConnected) {
        id v7 = @"NO";
      }
      else {
        id v7 = @"YES";
      }
      int v9 = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_21DCF7000, v6, OS_LOG_TYPE_DEFAULT, "%@ - carplay constraint changed (satisfied? %@)", (uint8_t *)&v9, 0x16u);
    }

    id v8 = [(SUInstallationConstraintMonitorBase *)self delegate];
    objc_msgSend(v8, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));
  }
}

- (void)sessionDidConnect:(id)a3
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SUInstallationConstraintMonitorCarplay_sessionDidConnect___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__SUInstallationConstraintMonitorCarplay_sessionDidConnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_carplayDidChange");
}

- (void)sessionDidDisconnect:(id)a3
{
  queue = self->super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SUInstallationConstraintMonitorCarplay_sessionDidDisconnect___block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __63__SUInstallationConstraintMonitorCarplay_sessionDidDisconnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_carplayDidChange");
}

- (void).cxx_destruct
{
}

@end