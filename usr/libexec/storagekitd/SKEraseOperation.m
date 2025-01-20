@interface SKEraseOperation
- (BOOL)done;
- (BOOL)run;
- (NSMutableArray)physicalStoresToErase;
- (NSString)passwordHandle;
- (SKEraseOperation)initWithEraser:(id)a3 withCompletionBlock:(id)a4;
- (float)progress;
- (id)description;
- (id)error;
- (id)resultingDisk;
- (int64_t)physicalStoreErasing;
- (void)finished;
- (void)setPasswordHandle:(id)a3;
- (void)setPhysicalStoreErasing:(int64_t)a3;
- (void)setPhysicalStoresToErase:(id)a3;
@end

@implementation SKEraseOperation

- (SKEraseOperation)initWithEraser:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKEraseOperation;
  v9 = [(SKManagerOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eraser, a3);
    id v11 = [v8 copy];
    id callbackBlock = v10->_callbackBlock;
    v10->_id callbackBlock = v11;
  }
  return v10;
}

- (BOOL)run
{
  eraser = self->_eraser;
  if (eraser)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = sub_100019EB8;
    v25 = sub_100019EC8;
    id v26 = 0;
    id obj = 0;
    v4 = [(SKEraserProtocol *)eraser createStateMachineWithError:&obj];
    objc_storeStrong(&v26, obj);
    fsm = self->_fsm;
    self->_fsm = v4;

    if (self->_fsm)
    {
      objc_initWeak(&location, self);
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_100019ED0;
      v16 = &unk_1000492D8;
      objc_copyWeak(&v18, &location);
      v17 = &v21;
      v6 = objc_retainBlock(&v13);
      id eraseBlock = self->eraseBlock;
      self->id eraseBlock = v6;

      objc_storeWeak(&self->weakEraseBlock, v6);
      id v8 = +[SKDaemonManager sharedManager];
      [v8 syncAllDisksWithCompletionBlock:self->eraseBlock];

      BOOL v9 = self->_operationError == 0;
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_storeStrong((id *)&self->_operationError, (id)v22[5]);
      [(SKEraseOperation *)self finished];
      BOOL v9 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    operationError = self->_operationError;
    self->_operationError = v10;

    [(SKEraseOperation *)self finished];
    return 0;
  }
  return v9;
}

- (float)progress
{
  return self->_lastProgress;
}

- (BOOL)done
{
  return self->_hasFinished;
}

- (id)error
{
  return self->_operationError;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Erase disk operation, with eraser: %@", self->_eraser];
}

- (void)finished
{
  self->_hasFinished = 1;
  v3 = sub_10000DD48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(SKDisk *)self->_resultingDisk mountPoint];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Erase Complete, Mount Point: %@", buf, 0xCu);
  }
  v5 = +[SKDaemonManager sharedManager];
  v6 = [v5 _recacheSyncDisk:self->_resultingDisk];
  resultingDisk = self->_resultingDisk;
  self->_resultingDisk = v6;

  id v8 = [(SKManagerOperation *)self validateWithRecachedDisk:self->_resultingDisk error:self->_operationError];
  operationError = self->_operationError;
  self->_operationError = v8;

  v10 = sub_10000DD48();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(SKDisk *)self->_resultingDisk mountPoint];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recache Complete, Mount Point: %@", buf, 0xCu);
  }
  (*((void (**)(void))self->_callbackBlock + 2))();
  v12.receiver = self;
  v12.super_class = (Class)SKEraseOperation;
  [(SKManagerOperation *)&v12 finished];
}

- (id)resultingDisk
{
  return self->_resultingDisk;
}

- (NSString)passwordHandle
{
  return self->_passwordHandle;
}

- (void)setPasswordHandle:(id)a3
{
}

- (NSMutableArray)physicalStoresToErase
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPhysicalStoresToErase:(id)a3
{
}

- (int64_t)physicalStoreErasing
{
  return self->_physicalStoreErasing;
}

- (void)setPhysicalStoreErasing:(int64_t)a3
{
  self->_physicalStoreErasing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalStoresToErase, 0);
  objc_storeStrong((id *)&self->_passwordHandle, 0);
  objc_destroyWeak(&self->weakEraseBlock);
  objc_storeStrong(&self->eraseBlock, 0);
  objc_storeStrong((id *)&self->_fsm, 0);
  objc_storeStrong((id *)&self->_eraser, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_resultingDisk, 0);

  objc_storeStrong((id *)&self->_operationError, 0);
}

@end