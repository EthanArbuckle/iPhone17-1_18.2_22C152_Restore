@interface MBServiceBatchRestoreOperation
+ (id)batchOperationWithFilePaths:(id)a3 serviceManager:(id)a4 delegateContext:(id)a5;
+ (id)batchOperationWithFilePaths:(id)a3 serviceManager:(id)a4 delegateContext:(id)a5 batchCompletion:(id)a6;
- (BOOL)startRestoreWithError:(id *)a3;
- (MBServiceBatchRestoreOperation)initWithFilePath:(id)a3 serviceManager:(id)a4 delegateContext:(id)a5;
- (MBServiceBatchRestoreOperation)nextOp;
- (MBServiceManager)manager;
- (NSString)filePath;
- (id)batchCompletion;
- (id)delegateContext;
- (id)description;
- (void)manager:(id)a3 didFailRestoreWithContext:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFinishRestoreWithContext:(id)a4;
- (void)setBatchCompletion:(id)a3;
- (void)setDelegateContext:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setManager:(id)a3;
- (void)setNextOp:(id)a3;
@end

@implementation MBServiceBatchRestoreOperation

+ (id)batchOperationWithFilePaths:(id)a3 serviceManager:(id)a4 delegateContext:(id)a5
{
  return [a1 batchOperationWithFilePaths:a3 serviceManager:a4 delegateContext:a5 batchCompletion:0];
}

+ (id)batchOperationWithFilePaths:(id)a3 serviceManager:(id)a4 delegateContext:(id)a5 batchCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v9;
  id v13 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v13)
  {
    v15 = 0;
    v16 = 0;
    goto LABEL_16;
  }
  id v14 = v13;
  v15 = 0;
  v16 = 0;
  uint64_t v17 = *(void *)v24;
  do
  {
    v18 = 0;
    v19 = v15;
    do
    {
      if (*(void *)v24 != v17) {
        objc_enumerationMutation(obj);
      }
      v15 = [[MBServiceBatchRestoreOperation alloc] initWithFilePath:*(void *)(*((void *)&v23 + 1) + 8 * (void)v18) serviceManager:v10 delegateContext:v11];
      [(MBServiceBatchRestoreOperation *)v15 setBatchCompletion:v12];
      if (v16)
      {
        if (!v19) {
          goto LABEL_9;
        }
LABEL_8:
        [(MBServiceBatchRestoreOperation *)v19 setNextOp:v15];
        goto LABEL_9;
      }
      v16 = v15;
      if (v19) {
        goto LABEL_8;
      }
LABEL_9:

      v18 = (char *)v18 + 1;
      v19 = v15;
    }
    while (v14 != v18);
    id v20 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    id v14 = v20;
  }
  while (v20);
LABEL_16:

  return v16;
}

- (MBServiceBatchRestoreOperation)initWithFilePath:(id)a3 serviceManager:(id)a4 delegateContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MBServiceBatchRestoreOperation;
  id v11 = [(MBServiceBatchRestoreOperation *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    [(MBServiceBatchRestoreOperation *)v11 setFilePath:v8];
    [(MBServiceBatchRestoreOperation *)v12 setManager:v9];
    [(MBServiceBatchRestoreOperation *)v12 setDelegateContext:v10];
  }

  return v12;
}

- (BOOL)startRestoreWithError:(id *)a3
{
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting batch restore %@", buf, 0xCu);
    _MBLog();
  }

  v6 = [(MBServiceBatchRestoreOperation *)self manager];
  v7 = [(MBServiceBatchRestoreOperation *)self filePath];
  id v8 = [(MBServiceBatchRestoreOperation *)self manager];
  id v9 = [v8 account];
  id v10 = [(MBServiceBatchRestoreOperation *)self delegateContext];
  id v11 = [v6 _settingsContextForBackgroundFileRestoreWithPath:v7 account:v9 delegateContext:v10];

  [v11 setInternalDelegate:self];
  id v12 = [(MBServiceBatchRestoreOperation *)self manager];
  id v13 = [(MBServiceBatchRestoreOperation *)self delegateContext];
  unsigned __int8 v14 = [v12 _startBackgroundRestoreWithSettingsContext:v11 delegateContext:v13 error:a3];

  return v14;
}

- (id)description
{
  uint64_t v3 = [(MBServiceBatchRestoreOperation *)self nextOp];
  if (v3)
  {
    v4 = (void *)v3;
    LODWORD(v5) = 0;
    do
    {
      uint64_t v5 = (v5 + 1);
      uint64_t v6 = [v4 nextOp];

      v4 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v5 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)MBServiceBatchRestoreOperation;
  v7 = [(MBServiceBatchRestoreOperation *)&v16 description];
  id v8 = [(MBServiceBatchRestoreOperation *)self filePath];
  id v9 = [(MBServiceBatchRestoreOperation *)self manager];
  if (v9) {
    CFStringRef v10 = @"<set>";
  }
  else {
    CFStringRef v10 = @"<nil>";
  }
  id v11 = [(MBServiceBatchRestoreOperation *)self delegateContext];
  id v12 = [(MBServiceBatchRestoreOperation *)self nextOp];
  id v13 = [v12 filePath];
  unsigned __int8 v14 = +[NSString stringWithFormat:@"%@ <%@, manager=%@, delegateContext=%@, nextOp.filePath=%@, opsLeft=%d>", v7, v8, v10, v11, v13, v5];

  return v14;
}

- (void)manager:(id)a3 didFinishRestoreWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Batch restore received finished notification", buf, 2u);
    _MBLog();
  }

  id v9 = [(MBServiceBatchRestoreOperation *)self manager];
  CFStringRef v10 = [v9 serviceDelegate];

  if (objc_opt_respondsToSelector())
  {
    id v11 = [(MBServiceBatchRestoreOperation *)self filePath];
    id v12 = [(MBServiceBatchRestoreOperation *)self delegateContext];
    [v10 manager:v6 didFinishRestoreForPath:v11 withContext:v12];
  }
  id v13 = [(MBServiceBatchRestoreOperation *)self manager];
  unsigned __int8 v14 = [v13 batchRestoreOps];

  v15 = [(MBServiceBatchRestoreOperation *)self nextOp];
  objc_super v16 = MBGetDefaultLog();
  uint64_t v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Starting next batch restore operation: %@", buf, 0xCu);
      _MBLog();
    }

    id v18 = v14;
    objc_sync_enter(v18);
    [v18 addObject:v15];
    objc_sync_exit(v18);

    id v29 = 0;
    unsigned __int8 v19 = [v15 startRestoreWithError:&v29];
    id v20 = v29;
    if ((v19 & 1) == 0)
    {
      v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to start next batch operation: %@", buf, 0xCu);
        _MBLog();
      }

      id v22 = v18;
      objc_sync_enter(v22);
      [v22 removeObject:v15];
      objc_sync_exit(v22);

      long long v23 = [(MBServiceBatchRestoreOperation *)self batchCompletion];

      if (v23)
      {
        long long v24 = [(MBServiceBatchRestoreOperation *)self batchCompletion];
        ((void (**)(void, id))v24)[2](v24, v20);

        [(MBServiceBatchRestoreOperation *)self setBatchCompletion:0];
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          v27 = [v15 filePath];
          [v10 manager:v6 didFailRestoreForPath:v27 withContext:v7 error:v20];
        }
        if (objc_opt_respondsToSelector()) {
          [v10 manager:v6 didFailRestoreWithContext:v7 error:v20];
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Batch restore finished successfully", buf, 2u);
      _MBLog();
    }

    long long v25 = [(MBServiceBatchRestoreOperation *)self batchCompletion];

    if (v25)
    {
      long long v26 = [(MBServiceBatchRestoreOperation *)self batchCompletion];
      v26[2](v26, 0);

      [(MBServiceBatchRestoreOperation *)self setBatchCompletion:0];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v10 manager:v6 didFinishRestoreWithContext:v7];
    }
  }
  id v28 = v14;
  objc_sync_enter(v28);
  [v28 removeObject:self];
  objc_sync_exit(v28);
}

- (void)manager:(id)a3 didFailRestoreWithContext:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Batch restore failed: %@", buf, 0xCu);
    _MBLog();
  }

  id v12 = [(MBServiceBatchRestoreOperation *)self manager];
  id v13 = [v12 batchRestoreOps];

  objc_sync_enter(v13);
  unsigned __int8 v14 = [(MBServiceBatchRestoreOperation *)self manager];
  v15 = [v14 batchRestoreOps];
  [v15 removeObject:self];

  objc_sync_exit(v13);
  objc_super v16 = [(MBServiceBatchRestoreOperation *)self batchCompletion];

  if (v16)
  {
    uint64_t v17 = [(MBServiceBatchRestoreOperation *)self batchCompletion];
    ((void (**)(void, id))v17)[2](v17, v10);

    [(MBServiceBatchRestoreOperation *)self setBatchCompletion:0];
  }
  else
  {
    id v18 = [(MBServiceBatchRestoreOperation *)self manager];
    unsigned __int8 v19 = [v18 serviceDelegate];

    if (v19)
    {
      if (objc_opt_respondsToSelector())
      {
        id v20 = [(MBServiceBatchRestoreOperation *)self filePath];
        [v19 manager:v8 didFailRestoreForPath:v20 withContext:v9 error:v10];
      }
      if (objc_opt_respondsToSelector()) {
        [v19 manager:v8 didFailRestoreWithContext:v9 error:v10];
      }
    }
  }
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (MBServiceManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  self->_manager = (MBServiceManager *)a3;
}

- (id)delegateContext
{
  return self->_delegateContext;
}

- (void)setDelegateContext:(id)a3
{
  self->_delegateContext = a3;
}

- (MBServiceBatchRestoreOperation)nextOp
{
  return self->_nextOp;
}

- (void)setNextOp:(id)a3
{
}

- (id)batchCompletion
{
  return self->_batchCompletion;
}

- (void)setBatchCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchCompletion, 0);
  objc_storeStrong((id *)&self->_nextOp, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end