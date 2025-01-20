@interface MBDeviceTransferTask
- (BOOL)_handleCompletionWithError:(id *)a3;
- (BOOL)_startWithError:(id *)a3;
- (BOOL)canceled;
- (BOOL)finished;
- (BOOL)started;
- (MBDeviceTransferTask)initWithFileTransferSession:(id)a3;
- (MBManager)manager;
- (NSError)completionError;
- (OS_dispatch_queue)queue;
- (RPFileTransferSession)fileTransferSession;
- (id)completionHandler;
- (id)connectionInfoHandler;
- (id)connectionStateHandler;
- (id)progressHandler;
- (int64_t)taskType;
- (void)_finishWithError:(id)a3;
- (void)_resume;
- (void)_suspend;
- (void)cancel;
- (void)dealloc;
- (void)manager;
- (void)manager:(id)a3 didUpdateDeviceTransferConnectionInfo:(id)a4;
- (void)managerDidLoseConnectionToService:(id)a3;
- (void)setCompletionError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConnectionInfoHandler:(id)a3;
- (void)setConnectionStateHandler:(id)a3;
- (void)setFileTransferSession:(id)a3;
- (void)setManager:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation MBDeviceTransferTask

- (int64_t)taskType
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (!queue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);

    v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v5);
    v9 = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    queue = v2->_queue;
  }
  v10 = queue;
  objc_sync_exit(v2);

  return v10;
}

- (void)setQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  queue = obj->_queue;
  obj->_queue = v4;

  objc_sync_exit(obj);
}

- (MBManager)manager
{
  uint64_t v3 = [(MBDeviceTransferTask *)self queue];
  if (!v3) {
    -[MBDeviceTransferTask manager]();
  }
  v4 = (void *)v3;
  v5 = self;
  objc_sync_enter(v5);
  manager = v5->_manager;
  if (!manager)
  {
    v7 = [[MBManager alloc] initWithDelegate:v5 eventQueue:v4];
    dispatch_queue_t v8 = v5->_manager;
    v5->_manager = v7;

    manager = v5->_manager;
  }
  v9 = manager;
  objc_sync_exit(v5);

  return v9;
}

- (BOOL)started
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_started);
  return v2 & 1;
}

- (BOOL)canceled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v2 & 1;
}

- (BOOL)finished
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (MBDeviceTransferTask)initWithFileTransferSession:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    -[MBDeviceTransferTask initWithFileTransferSession:]();
  }
  v5 = v4;
  v16.receiver = self;
  v16.super_class = (Class)MBDeviceTransferTask;
  v6 = [(MBDeviceTransferTask *)&v16 init];
  v7 = v6;
  if (v6) {
    [(MBDeviceTransferTask *)v6 setFileTransferSession:v5];
  }
  dispatch_queue_t v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_DEFAULT, "%@: init, fileTransferSession:%@", buf, 0x16u);
    _MBLog(@"DEFAULT", (uint64_t)"%@: init, fileTransferSession:%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = self;
    _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_DEFAULT, "%@: dealloc", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: dealloc", v4, v5, v6, v7, v8, v9, (uint64_t)self);
  }

  v10.receiver = self;
  v10.super_class = (Class)MBDeviceTransferTask;
  [(MBDeviceTransferTask *)&v10 dealloc];
}

- (BOOL)_startWithError:(id *)a3
{
}

- (void)start
{
}

void __29__MBDeviceTransferTask_start__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1DD9AE000, v2, OS_LOG_TYPE_DEFAULT, "%@: Starting", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));
  }

  int v10 = [*(id *)(a1 + 32) canceled];
  uint64_t v11 = *(void **)(a1 + 32);
  if (v10)
  {
    [v11 _cancel];
  }
  else
  {
    id v16 = 0;
    int v12 = [v11 _startWithError:&v16];
    id v13 = v16;
    uint64_t v14 = v13;
    if ((v12 & 1) == 0 && !v13) {
      __29__MBDeviceTransferTask_start__block_invoke_cold_2();
    }
    v15 = *(atomic_uchar **)(a1 + 32);
    if (v12)
    {
      if (atomic_exchange(v15 + 24, 1u)) {
        __29__MBDeviceTransferTask_start__block_invoke_cold_1();
      }
    }
    else
    {
      [(atomic_uchar *)v15 _finishWithError:v14];
    }
    if ([*(id *)(a1 + 32) canceled]) {
      [*(id *)(a1 + 32) _cancel];
    }
  }
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((atomic_exchange((atomic_uchar *volatile)&self->_canceled, 1u) & 1) == 0
    && [(MBDeviceTransferTask *)self started])
  {
    uint64_t v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = self;
      _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Canceling", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"%@: Canceling", v4, v5, v6, v7, v8, v9, (uint64_t)self);
    }

    int v10 = [(MBDeviceTransferTask *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__MBDeviceTransferTask_cancel__block_invoke;
    block[3] = &unk_1E6D00E18;
    block[4] = self;
    dispatch_async(v10, block);
  }
}

uint64_t __30__MBDeviceTransferTask_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_finishWithError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v5);

  if ((atomic_exchange((atomic_uchar *volatile)&self->_finished, 1u) & 1) == 0)
  {
    uint64_t v6 = MBGetDefaultLog();
    uint64_t v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = self;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_ERROR, "%@: Finishing the device transfer task: %@", buf, 0x16u);
        _MBLog(@"ERROR", (uint64_t)"%@: Finishing the device transfer task: %@", v8, v9, v10, v11, v12, v13, (uint64_t)self);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Finishing the device transfer task", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"%@: Finishing the device transfer task", v14, v15, v16, v17, v18, v19, (uint64_t)self);
    }

    [(MBDeviceTransferTask *)self setCompletionError:v4];
    v20 = [(MBDeviceTransferTask *)self completionHandler];
    if (v20)
    {
      [(MBDeviceTransferTask *)self setProgressHandler:0];
      [(MBDeviceTransferTask *)self setConnectionInfoHandler:0];
      [(MBDeviceTransferTask *)self setConnectionStateHandler:0];
      [(MBDeviceTransferTask *)self setCompletionHandler:0];
      ((void (**)(void, id))v20)[2](v20, v4);
    }
  }
}

- (BOOL)_handleCompletionWithError:(id *)a3
{
  if (!a3) {
    -[MBDeviceTransferTask _handleCompletionWithError:]();
  }
  uint64_t v5 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(MBDeviceTransferTask *)self canceled])
  {
    uint64_t v6 = @"Canceled";
    uint64_t v7 = 202;
    goto LABEL_4;
  }
  if ([(MBDeviceTransferTask *)self finished])
  {
    uint64_t v8 = [(MBDeviceTransferTask *)self completionError];
    if (v8) {
      goto LABEL_8;
    }
    uint64_t v6 = @"Invalid state (finished)";
    uint64_t v7 = 1;
LABEL_4:
    uint64_t v8 = +[MBError errorWithCode:v7 format:v6];
    if (!v8) {
      return 1;
    }
LABEL_8:
    id v9 = v8;
    *a3 = v9;

    return 0;
  }
  return 1;
}

- (void)_suspend
{
}

- (void)_resume
{
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(MBDeviceTransferTask *)self started])
  {
    uint64_t v6 = +[MBError errorWithCode:19 format:@"XPC connection interrupted"];
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v23 = v6;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_ERROR, "Lost connection, error:%@", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"Lost connection, error:%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    }

    [(MBDeviceTransferTask *)self _finishWithError:v6];
  }
  else
  {
    uint64_t v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      __int16 v23 = v14;
      _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@", buf, 0xCu);

      uint64_t v15 = NSStringFromSelector(a2);
      _MBLog(@"DEFAULT", (uint64_t)"Ignoring %{public}@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
  }
}

- (void)manager:(id)a3 didUpdateDeviceTransferConnectionInfo:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (!v6) {
    -[MBDeviceTransferTask manager:didUpdateDeviceTransferConnectionInfo:]();
  }
  uint64_t v7 = v6;
  if ([v6 connectionState] != 1 && objc_msgSend(v7, "connectionState") != 2) {
    -[MBDeviceTransferTask manager:didUpdateDeviceTransferConnectionInfo:]();
  }
  uint64_t v8 = [(MBDeviceTransferTask *)self connectionStateHandler];

  if (v8)
  {
    uint64_t v9 = [(MBDeviceTransferTask *)self connectionStateHandler];
    v9[2](v9, [v7 connectionState]);
  }
  uint64_t v10 = [(MBDeviceTransferTask *)self connectionInfoHandler];

  if (v10)
  {
    uint64_t v11 = [(MBDeviceTransferTask *)self connectionInfoHandler];
    ((void (**)(void, void *))v11)[2](v11, v7);
  }
}

- (NSError)completionError
{
  return self->_completionError;
}

- (void)setCompletionError:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)connectionStateHandler
{
  return self->_connectionStateHandler;
}

- (void)setConnectionStateHandler:(id)a3
{
}

- (id)connectionInfoHandler
{
  return self->_connectionInfoHandler;
}

- (void)setConnectionInfoHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setManager:(id)a3
{
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_connectionInfoHandler, 0);
  objc_storeStrong(&self->_connectionStateHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_completionError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)manager
{
}

- (void)initWithFileTransferSession:.cold.1()
{
}

void __29__MBDeviceTransferTask_start__block_invoke_cold_1()
{
}

void __29__MBDeviceTransferTask_start__block_invoke_cold_2()
{
}

- (void)_handleCompletionWithError:.cold.1()
{
}

- (void)manager:didUpdateDeviceTransferConnectionInfo:.cold.1()
{
}

- (void)manager:didUpdateDeviceTransferConnectionInfo:.cold.2()
{
  __assert_rtn("-[MBDeviceTransferTask manager:didUpdateDeviceTransferConnectionInfo:]", "MBDeviceTransferTask.m", 494, "info.connectionState == MBDeviceTransferConnectionStateConnected || info.connectionState == MBDeviceTransferConnectionStateDisconnected");
}

@end