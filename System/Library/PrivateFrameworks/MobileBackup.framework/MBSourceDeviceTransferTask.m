@interface MBSourceDeviceTransferTask
- (BOOL)_startWithError:(id *)a3;
- (MBSourceDeviceTransferTask)initWithFileTransferSession:(id)a3;
- (int64_t)taskType;
- (void)_cancel;
- (void)_finishWithError:(id)a3;
- (void)_shortenPrebuddyExpirationIfNeeded;
- (void)cancel;
- (void)manager:(id)a3 didFinishDeviceTransferKeychainTransfer:(id)a4;
- (void)manager:(id)a3 didFinishDeviceTransferPreflight:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFinishDeviceTransferWithError:(id)a4;
- (void)manager:(id)a3 didUpdateDeviceTransferProgress:(id)a4;
- (void)start;
@end

@implementation MBSourceDeviceTransferTask

- (int64_t)taskType
{
  return 1;
}

- (MBSourceDeviceTransferTask)initWithFileTransferSession:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MBSourceDeviceTransferTask;
  return [(MBDeviceTransferTask *)&v4 initWithFileTransferSession:a3];
}

- (BOOL)_startWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Starting the device transfer task", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting the device transfer task", v7, v8, v9, v10, v11, v12, (uint64_t)self);
  }

  v13 = objc_opt_new();
  v14 = [(MBDeviceTransferTask *)self fileTransferSession];
  [v13 setFileTransferSession:v14];

  v15 = [(MBDeviceTransferTask *)self manager];
  if (!v15) {
    -[MBSourceDeviceTransferTask _startWithError:]();
  }
  v16 = v15;
  char v17 = objc_msgSend(v15, "startDeviceTransferWithTaskType:sessionInfo:error:", -[MBSourceDeviceTransferTask taskType](self, "taskType"), v13, a3);

  return v17;
}

- (void)start
{
  v2.receiver = self;
  v2.super_class = (Class)MBSourceDeviceTransferTask;
  [(MBDeviceTransferTask *)&v2 start];
}

- (void)_cancel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(MBDeviceTransferTask *)self manager];
  id v17 = 0;
  char v5 = objc_msgSend(v4, "cancelDeviceTransferWithTaskType:error:", -[MBSourceDeviceTransferTask taskType](self, "taskType"), &v17);
  id v6 = v17;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int64_t v8 = [(MBSourceDeviceTransferTask *)self taskType];
      *(_DWORD *)buf = 134218242;
      int64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_ERROR, "Failed to cancel device transfer from source. taskType: %ld error:%@", buf, 0x16u);
      uint64_t v9 = [(MBSourceDeviceTransferTask *)self taskType];
      _MBLog(@"ERROR", (uint64_t)"Failed to cancel device transfer from source. taskType: %ld error:%@", v10, v11, v12, v13, v14, v15, v9);
    }
  }
  v16 = +[MBError errorWithCode:202 format:@"Source device transfer canceled"];

  [(MBSourceDeviceTransferTask *)self _finishWithError:v16];
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)MBSourceDeviceTransferTask;
  [(MBDeviceTransferTask *)&v2 cancel];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  char v5 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v5);

  [(MBDeviceTransferTask *)self setProgressHandler:0];
  v6.receiver = self;
  v6.super_class = (Class)MBSourceDeviceTransferTask;
  [(MBDeviceTransferTask *)&v6 _finishWithError:v4];
}

- (void)_shortenPrebuddyExpirationIfNeeded
{
  id v2 = +[MBPrebuddyManager sharedManager];
  [v2 shortenPrebuddyExpiration];
}

- (void)manager:(id)a3 didFinishDeviceTransferWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = MBGetDefaultLog();
  int64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_ERROR, "%@: Failed the source transfer task: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"%@: Failed the source transfer task: %@", v9, v10, v11, v12, v13, v14, (uint64_t)self);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = self;
      _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Finished the source transfer task", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"%@: Finished the source transfer task", v15, v16, v17, v18, v19, v20, (uint64_t)self);
    }

    [(MBSourceDeviceTransferTask *)self _shortenPrebuddyExpirationIfNeeded];
  }
  [(MBSourceDeviceTransferTask *)self _finishWithError:v5];
}

- (void)manager:(id)a3 didFinishDeviceTransferKeychainTransfer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[MBSourceDeviceTransferTask manager:didFinishDeviceTransferKeychainTransfer:]", "MBSourceDeviceTransferTask.m", 99, "0 && \"Unexpected call\"");
}

- (void)manager:(id)a3 didFinishDeviceTransferPreflight:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __assert_rtn("-[MBSourceDeviceTransferTask manager:didFinishDeviceTransferPreflight:error:]", "MBSourceDeviceTransferTask.m", 103, "0 && \"Unexpected call\"");
}

- (void)manager:(id)a3 didUpdateDeviceTransferProgress:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "Updated progress: %@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"Updated progress: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
  }

  uint64_t v14 = [(MBDeviceTransferTask *)self progressHandler];

  if (v14)
  {
    uint64_t v15 = [(MBDeviceTransferTask *)self progressHandler];
    ((void (**)(void, id))v15)[2](v15, v5);
  }
}

- (void)_startWithError:.cold.1()
{
}

@end