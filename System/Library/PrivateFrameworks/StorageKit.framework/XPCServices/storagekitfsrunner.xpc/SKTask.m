@interface SKTask
- (BOOL)endedSuccessfully;
- (BOOL)waitWithError:(id *)a3;
- (NSFileHandle)stderrHandle;
- (NSFileHandle)stdoutHandle;
- (NSProgress)progress;
- (NSTask)task;
- (SKTask)initWithExecutable:(id)a3;
- (SKTask)initWithExecutable:(id)a3 arguments:(id)a4;
- (SKTaskDataParser)stderrParser;
- (SKTaskDataParser)stdoutParser;
- (void)setProgress:(id)a3;
- (void)setStderrParser:(id)a3;
- (void)setStdoutParser:(id)a3;
@end

@implementation SKTask

- (SKTask)initWithExecutable:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SKTask;
  v8 = [(SKTask *)&v26 init];
  if (v8)
  {
    v9 = (NSTask *)objc_alloc_init((Class)NSTask);
    task = v8->_task;
    v8->_task = v9;

    [(NSTask *)v8->_task setExecutableURL:v6];
    [(NSTask *)v8->_task setArguments:v7];
    v11 = v8->_task;
    v12 = +[NSPipe pipe];
    [(NSTask *)v11 setStandardOutput:v12];

    v13 = v8->_task;
    v14 = +[NSPipe pipe];
    [(NSTask *)v13 setStandardError:v14];

    v15 = [(NSTask *)v8->_task standardOutput];
    uint64_t v16 = [v15 fileHandleForReading];
    stdoutHandle = v8->_stdoutHandle;
    v8->_stdoutHandle = (NSFileHandle *)v16;

    v18 = [(NSTask *)v8->_task standardError];
    uint64_t v19 = [v18 fileHandleForReading];
    stderrHandle = v8->_stderrHandle;
    v8->_stderrHandle = (NSFileHandle *)v19;

    v21 = objc_opt_new();
    [(SKTask *)v8 setStderrParser:v21];

    v22 = objc_opt_new();
    [(SKTask *)v8 setStdoutParser:v22];

    uint64_t v23 = +[NSProgress progressWithTotalUnitCount:100];
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v23;
  }
  return v8;
}

- (SKTask)initWithExecutable:(id)a3
{
  return [(SKTask *)self initWithExecutable:a3 arguments:&__NSArray0__struct];
}

- (BOOL)endedSuccessfully
{
  v3 = [(SKTask *)self task];
  if ([v3 isRunning])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(SKTask *)self task];
    BOOL v4 = [v5 terminationStatus] == 0;
  }
  return v4;
}

- (BOOL)waitWithError:(id *)a3
{
  v5 = [(SKTask *)self task];
  [v5 waitUntilExit];

  id v6 = [(SKTask *)self task];
  unsigned int v7 = [v6 terminationStatus];

  if (a3 && v7)
  {
    v8 = [(SKTask *)self task];
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, (int)[v8 terminationStatus], 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = [(SKTask *)self task];
  BOOL v10 = [v9 terminationStatus] == 0;

  return v10;
}

- (SKTaskDataParser)stdoutParser
{
  return self->_stdoutParser;
}

- (void)setStdoutParser:(id)a3
{
}

- (SKTaskDataParser)stderrParser
{
  return self->_stderrParser;
}

- (void)setStderrParser:(id)a3
{
}

- (NSFileHandle)stdoutHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 24, 1);
}

- (NSFileHandle)stderrHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32, 1);
}

- (NSTask)task
{
  return (NSTask *)objc_getProperty(self, a2, 40, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_stderrHandle, 0);
  objc_storeStrong((id *)&self->_stdoutHandle, 0);
  objc_storeStrong((id *)&self->_stderrParser, 0);

  objc_storeStrong((id *)&self->_stdoutParser, 0);
}

@end