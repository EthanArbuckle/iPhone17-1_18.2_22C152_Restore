@interface SKManagerOperation
- (BOOL)run;
- (OS_dispatch_semaphore)finishedSemaphore;
- (SKManagerOperation)init;
- (SKProgress)skProgress;
- (float)progress;
- (id)progressHandler;
- (id)redactedDescription;
- (id)validateWithRecachedDisk:(id)a3 error:(id)a4;
- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6;
- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5;
- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5;
- (void)dmAsyncStartedForDisk:(__DADisk *)a3;
- (void)finished;
- (void)setFinishedSemaphore:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgressHandler:(id)a3;
- (void)setSkProgress:(id)a3;
@end

@implementation SKManagerOperation

- (SKManagerOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKManagerOperation;
  v2 = [(SKManagerOperation *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    finishedSemaphore = v2->_finishedSemaphore;
    v2->_finishedSemaphore = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (BOOL)run
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"No implementation provided for generic base class." userInfo:0];
  objc_exception_throw(v2);
}

- (void)finished
{
  dispatch_semaphore_t v3 = +[SKDaemonManager sharedManager];
  [v3 _advanceOperationQueue];

  v4 = [(SKManagerOperation *)self finishedSemaphore];
  dispatch_semaphore_signal(v4);
}

- (void)dmAsyncStartedForDisk:(__DADisk *)a3
{
  -[SKManagerOperation setProgress:](self, "setProgress:", a3, 0.0);
  v4 = [(SKManagerOperation *)self progressHandler];

  if (v4)
  {
    v5 = [(SKManagerOperation *)self progressHandler];
    v5[2](v5, 0, 0.0);
  }
}

- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5
{
  v7 = [(SKManagerOperation *)self progressHandler];

  if (v7)
  {
    *(float *)&double v8 = a5;
    [(SKManagerOperation *)self setProgress:v8];
    v9 = [(SKManagerOperation *)self progressHandler];
    v9[2](v9, 0, a5);
  }
}

- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5
{
  id v8 = a4;
  objc_super v6 = [(SKManagerOperation *)self progressHandler];

  if (v6)
  {
    v7 = [(SKManagerOperation *)self progressHandler];
    [(SKManagerOperation *)self progress];
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6
{
  v7 = [(SKManagerOperation *)self progressHandler];

  if (v7)
  {
    LODWORD(v8) = 1120403456;
    [(SKManagerOperation *)self setProgress:v8];
    v9 = [(SKManagerOperation *)self progressHandler];
    [(SKManagerOperation *)self progress];
    v9[2](v9, 0);
  }
}

- (id)validateWithRecachedDisk:(id)a3 error:(id)a4
{
  objc_super v6 = (SKManagerOperation *)a3;
  id v7 = a4;
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
LABEL_3:
    v10 = v9;
    goto LABEL_8;
  }
  v11 = sub_10000DD48();
  v12 = v11;
  if (!v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[SKManagerOperation validateWithRecachedDisk:error:]";
      __int16 v16 = 2112;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Disk recache failed, failing %@", (uint8_t *)&v14, 0x16u);
    }

    id v9 = +[SKError errorWithCode:117 userInfo:0];
    goto LABEL_3;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[SKManagerOperation validateWithRecachedDisk:error:]";
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Disk recached successfully: %@", (uint8_t *)&v14, 0x16u);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (id)redactedDescription
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (SKProgress)skProgress
{
  return self->_skProgress;
}

- (void)setSkProgress:(id)a3
{
}

- (OS_dispatch_semaphore)finishedSemaphore
{
  return self->_finishedSemaphore;
}

- (void)setFinishedSemaphore:(id)a3
{
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedSemaphore, 0);
  objc_storeStrong((id *)&self->_skProgress, 0);

  objc_storeStrong(&self->_progressHandler, 0);
}

@end