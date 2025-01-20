@interface SignpostClientDrawableInterval
- (NSString)executablePath;
- (NSString)processName;
- (SignpostClientDrawableInterval)initWithClientDrawableInterval:(id)a3;
- (int)pid;
- (unint64_t)threadID;
- (unsigned)queueID;
- (unsigned)surfaceID;
@end

@implementation SignpostClientDrawableInterval

- (SignpostClientDrawableInterval)initWithClientDrawableInterval:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SignpostClientDrawableInterval;
  v5 = [(SignpostAnimationSubInterval *)&v27 initWithInterval:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [v4 beginEvent];
  v5->_queueID = [v6 signpostId];

  v7 = [v4 beginEvent];
  v8 = [v7 _numberArgumentWithName:@"surfaceID"];

  if (v8)
  {
    v5->_surfaceID = [v8 unsignedLongLongValue];

    v9 = [v4 beginEvent];
    v5->_threadID = [v9 threadID];

    v10 = [v4 beginEvent];
    v5->_pid = [v10 processID];

    v11 = [v4 beginEvent];
    uint64_t v12 = [v11 processName];
    processName = v5->_processName;
    v5->_processName = (NSString *)v12;

    v14 = [v4 beginEvent];
    uint64_t v15 = [v14 processImagePath];
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v15;

LABEL_4:
    v17 = v5;
    goto LABEL_8;
  }
  v18 = _signpost_debug_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[SignpostClientDrawableInterval initWithClientDrawableInterval:](v18, v19, v20, v21, v22, v23, v24, v25);
  }

  v17 = 0;
LABEL_8:

  return v17;
}

- (unsigned)queueID
{
  return self->_queueID;
}

- (unsigned)surfaceID
{
  return self->_surfaceID;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executablePath, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

- (void)initWithClientDrawableInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end