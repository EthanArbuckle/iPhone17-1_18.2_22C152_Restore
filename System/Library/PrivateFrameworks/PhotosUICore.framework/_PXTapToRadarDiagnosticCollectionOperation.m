@interface _PXTapToRadarDiagnosticCollectionOperation
- (NSString)name;
- (_PXTapToRadarDiagnosticCollectionOperation)initWithName:(id)a3 timeout:(double)a4;
- (void)_timedOut;
- (void)endWithSuccess:(BOOL)a3 error:(id)a4;
- (void)installCompletionHandler:(id)a3;
@end

@implementation _PXTapToRadarDiagnosticCollectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_completionGroup, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)endWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_ended) {
    PXAssertGetLog();
  }
  v8->_ended = 1;
  if (!v8->_timedOut)
  {
    v8->_success = a3;
    objc_storeStrong((id *)&v8->_error, a4);
    dispatch_group_leave((dispatch_group_t)v8->_completionGroup);
  }
  objc_sync_exit(v8);
}

- (void)_timedOut
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_ended)
  {
    obj->_timedOut = 1;
    obj->_success = 0;
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Diagnostic collection operation “%@” timed out", obj->_name);
    error = obj->_error;
    obj->_error = (NSError *)v2;

    dispatch_group_leave((dispatch_group_t)obj->_completionGroup);
  }
  objc_sync_exit(obj);
}

- (void)installCompletionHandler:(id)a3
{
  id v4 = a3;
  completionGroup = self->_completionGroup;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___PXTapToRadarDiagnosticCollectionOperation_installCompletionHandler___block_invoke;
  v7[3] = &unk_1E5DD3280;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_group_notify(completionGroup, MEMORY[0x1E4F14428], v7);
}

- (_PXTapToRadarDiagnosticCollectionOperation)initWithName:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PXTapToRadarDiagnosticCollectionOperation;
  id v7 = [(_PXTapToRadarDiagnosticCollectionOperation *)&v17 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    uint64_t v9 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v8;

    dispatch_group_t v10 = dispatch_group_create();
    v11 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v10;

    dispatch_group_enter(*((dispatch_group_t *)v7 + 1));
    objc_initWeak(&location, v7);
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67___PXTapToRadarDiagnosticCollectionOperation_initWithName_timeout___block_invoke;
    v14[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v15, &location);
    dispatch_after(v12, MEMORY[0x1E4F14428], v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return (_PXTapToRadarDiagnosticCollectionOperation *)v7;
}

@end