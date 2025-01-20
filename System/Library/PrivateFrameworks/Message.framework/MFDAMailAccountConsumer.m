@interface MFDAMailAccountConsumer
- (BOOL)shouldRetryRequest;
- (BOOL)waitUntilDoneBeforeDate:(id)a3;
- (MFDAMailAccountConsumer)init;
- (MFDAMailAccountConsumer)initWithAlwaysReportFailures:(BOOL)a3;
- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5;
- (void)setDone:(BOOL)a3;
- (void)waitUntilDone;
@end

@implementation MFDAMailAccountConsumer

- (MFDAMailAccountConsumer)init
{
  return [(MFDAMailAccountConsumer *)self initWithAlwaysReportFailures:0];
}

- (MFDAMailAccountConsumer)initWithAlwaysReportFailures:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFDAMailAccountConsumer;
  v4 = [(MFDAMailAccountConsumer *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"MFDAMailAccountConsumer_doneCondition" condition:0 andDelegate:v4];
    doneCondition = v4->_doneCondition;
    v4->_doneCondition = (NSConditionLock *)v5;

    v4->_alwaysReportFailures = a3;
  }
  return v4;
}

- (void)setDone:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSConditionLock *)self->_doneCondition lock];
  doneCondition = self->_doneCondition;
  [(NSConditionLock *)doneCondition unlockWithCondition:v3];
}

- (BOOL)waitUntilDoneBeforeDate:(id)a3
{
  id v4 = a3;
  ECAssertNetworkActivityAllowed();
  BOOL v5 = [(NSConditionLock *)self->_doneCondition lockWhenCondition:1 beforeDate:v4];
  if (v5) {
    [(NSConditionLock *)self->_doneCondition unlock];
  }

  return v5;
}

- (void)waitUntilDone
{
  ECAssertNetworkActivityAllowed();
  [(NSConditionLock *)self->_doneCondition lockWhenCondition:1];
  doneCondition = self->_doneCondition;
  [(NSConditionLock *)doneCondition unlock];
}

- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5
{
  int64_t v13 = a3;
  id v7 = a4;
  id v8 = a5;
  id v12 = v8;
  MFWalkUpDAErrorChain(&v12, &v13);
  id v9 = v12;

  int64_t v10 = v13;
  BOOL v11 = (unint64_t)(v13 + 1) > 8 || ((1 << (v13 + 1)) & 0x103) == 0;
  if (v11
    || ([(NSConditionLock *)self->_doneCondition lock],
        self->_shouldRetryRequest = 1,
        [(NSConditionLock *)self->_doneCondition unlock],
        self->_alwaysReportFailures))
  {
    [(MFDAMailAccountConsumer *)self taskFailed:v7 statusCode:v10 error:v9];
  }
  [(MFDAMailAccountConsumer *)self setDone:1];
}

- (BOOL)shouldRetryRequest
{
  [(NSConditionLock *)self->_doneCondition lock];
  BOOL shouldRetryRequest = self->_shouldRetryRequest;
  [(NSConditionLock *)self->_doneCondition unlock];
  return shouldRetryRequest;
}

- (void).cxx_destruct
{
}

@end