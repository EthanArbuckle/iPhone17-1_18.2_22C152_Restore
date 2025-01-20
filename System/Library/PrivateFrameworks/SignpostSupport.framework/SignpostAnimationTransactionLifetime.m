@interface SignpostAnimationTransactionLifetime
- (NSString)executablePath;
- (NSString)processName;
- (SignpostAnimationTransactionLifetime)initWithTransactionSeedInterval:(id)a3;
- (int)pid;
- (unsigned)swapId;
- (unsigned)transactionSeed;
@end

@implementation SignpostAnimationTransactionLifetime

- (SignpostAnimationTransactionLifetime)initWithTransactionSeedInterval:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SignpostAnimationTransactionLifetime;
  v5 = [(SignpostAnimationSubInterval *)&v25 initWithInterval:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v5->_transactionSeed = [v4 signpostId];
  v6 = [v4 endEvent];
  v7 = [v6 _numberArgumentWithName:@"swap_id"];

  if (v7)
  {
    v5->_swapId = [v7 unsignedLongLongValue];

    v8 = [v4 beginEvent];
    v5->_pid = [v8 processID];

    v9 = [v4 beginEvent];
    uint64_t v10 = [v9 processName];
    processName = v5->_processName;
    v5->_processName = (NSString *)v10;

    v12 = [v4 beginEvent];
    uint64_t v13 = [v12 processImagePath];
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v13;

LABEL_4:
    v15 = v5;
    goto LABEL_8;
  }
  v16 = _signpost_debug_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[SignpostAnimationTransactionLifetime initWithTransactionSeedInterval:](v16, v17, v18, v19, v20, v21, v22, v23);
  }

  v15 = 0;
LABEL_8:

  return v15;
}

- (unsigned)transactionSeed
{
  return self->_transactionSeed;
}

- (unsigned)swapId
{
  return self->_swapId;
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

- (void)initWithTransactionSeedInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end