@interface SignpostCommitInterval
- (NSString)executablePath;
- (NSString)processName;
- (SignpostCommitInterval)initWithCommitInterval:(id)a3;
- (int)pid;
- (unint64_t)threadID;
- (unsigned)transactionSeed;
@end

@implementation SignpostCommitInterval

- (int)pid
{
  return self->_pid;
}

- (SignpostCommitInterval)initWithCommitInterval:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SignpostCommitInterval;
  v5 = [(SignpostAnimationSubInterval *)&v17 initWithInterval:v4];
  if (v5)
  {
    v6 = [v4 beginEvent];
    v7 = [v6 _numberArgumentWithName:@"transaction_seed"];

    if (v7) {
      v5->_transactionSeed = [v7 unsignedLongLongValue];
    }

    v8 = [v4 beginEvent];
    v5->_threadID = [v8 threadID];

    v9 = [v4 beginEvent];
    v5->_pid = [v9 processID];

    v10 = [v4 beginEvent];
    uint64_t v11 = [v10 processName];
    processName = v5->_processName;
    v5->_processName = (NSString *)v11;

    v13 = [v4 beginEvent];
    uint64_t v14 = [v13 processImagePath];
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v14;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executablePath, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

- (unsigned)transactionSeed
{
  return self->_transactionSeed;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

@end