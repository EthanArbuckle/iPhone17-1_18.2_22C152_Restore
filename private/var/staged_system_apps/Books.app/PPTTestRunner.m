@interface PPTTestRunner
- (BOOL)isFatalError;
- (BOOL)isQueueEmpty;
- (BOOL)shouldSleepBeforeTest;
- (NSMutableArray)testQueue;
- (NSString)errorMessage;
- (OS_dispatch_queue)queue;
- (PPTTestDelegate)testDelegate;
- (PPTTestRunner)init;
- (PPTTestRunnerSM)machine;
- (PPTTestSM)testMachine;
- (id)createSafeBlock:(id)a3;
- (id)onFatalError;
- (id)onIdle;
- (id)onStart;
- (id)onStopped;
- (id)onSuccess;
- (id)onTestError;
- (id)onTestFinished;
- (int)testSequence;
- (int)timeBeforeTest;
- (void)prepareTestToStart;
- (void)removeTestFromQueue;
- (void)setErrorMessage:(id)a3;
- (void)setMachine:(id)a3;
- (void)setOnFatalError:(id)a3;
- (void)setOnIdle:(id)a3;
- (void)setOnStart:(id)a3;
- (void)setOnStopped:(id)a3;
- (void)setOnSuccess:(id)a3;
- (void)setOnTestError:(id)a3;
- (void)setOnTestFinished:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTestDelegate:(id)a3;
- (void)setTestMachine:(id)a3;
- (void)setTestQueue:(id)a3;
- (void)setTestSequence:(int)a3;
- (void)start;
- (void)startTest;
- (void)stop;
- (void)terminateTest;
@end

@implementation PPTTestRunner

- (void)startTest
{
}

- (void)removeTestFromQueue
{
  id v2 = [(PPTTestRunner *)self testQueue];
  [v2 removeObjectAtIndex:0];
}

- (int)timeBeforeTest
{
  return [(PPTTestDelegate *)self->_testDelegate timeBeforeTest];
}

- (BOOL)isFatalError
{
  return 1;
}

- (BOOL)isQueueEmpty
{
  return [(NSMutableArray *)self->_testQueue count] == 0;
}

- (BOOL)shouldSleepBeforeTest
{
  return (int)[(PPTTestDelegate *)self->_testDelegate timeBeforeTest] > 0;
}

- (void)start
{
  id v2 = [(PPTTestRunner *)self machine];
  [v2 start];
}

- (void)stop
{
  id v2 = [(PPTTestRunner *)self machine];
  [v2 stop];
}

- (PPTTestRunner)init
{
  v9.receiver = self;
  v9.super_class = (Class)PPTTestRunner;
  id v2 = [(PPTTestRunner *)&v9 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_queue, &_dispatch_main_q);
    uint64_t v4 = +[NSMutableArray array];
    testQueue = v3->_testQueue;
    v3->_testQueue = (NSMutableArray *)v4;

    v6 = [[PPTTestRunnerSM alloc] initWithDelegate:v3];
    machine = v3->_machine;
    v3->_machine = v6;

    v3->_testSequence = 0;
  }
  return v3;
}

- (id)createSafeBlock:(id)a3
{
  id v4 = a3;
  int testSequence = self->_testSequence;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001DC070;
  v9[3] = &unk_100A4ADB0;
  objc_copyWeak(&v11, &location);
  int v12 = testSequence;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_retainBlock(v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (void)prepareTestToStart
{
  v3 = [(PPTTestRunner *)self testQueue];
  id v4 = [v3 objectAtIndex:0];
  testDelegate = self->_testDelegate;
  self->_testDelegate = v4;

  id v6 = [[PPTTestSM alloc] initWithDelegate:self];
  testMachine = self->_testMachine;
  self->_testMachine = v6;

  v8 = [(PPTTestRunner *)self createSafeBlock:&stru_100A4ADF0];
  [(PPTTestDelegate *)self->_testDelegate setOnTestFinished:v8];

  objc_super v9 = [(PPTTestRunner *)self createSafeBlock:&stru_100A4AE10];
  [(PPTTestDelegate *)self->_testDelegate setOnReceiveHandler:v9];

  id v10 = [(PPTTestRunner *)self createSafeBlock:&stru_100A4AE30];
  [(PPTTestSM *)self->_testMachine setOnTestFinished:v10];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001DC3D0;
  v15[3] = &unk_100A4AE80;
  v15[4] = self;
  id v11 = objc_retainBlock(v15);
  int v12 = ((void (*)(void *, const __CFString *))v11[2])(v11, @"failed");
  [(PPTTestSM *)self->_testMachine setOnTestError:v12];

  v13 = ((void (*)(void *, const __CFString *))v11[2])(v11, @"time out");
  [(PPTTestSM *)self->_testMachine setOnTestTimeout:v13];

  v14 = ((void (*)(void *, const __CFString *))v11[2])(v11, @"time out waiting for handler");
  [(PPTTestSM *)self->_testMachine setOnHandlerTimeout:v14];
}

- (void)terminateTest
{
  ++self->_testSequence;
  testMachine = self->_testMachine;
  self->_testMachine = 0;

  [(PPTTestDelegate *)self->_testDelegate setOnTestFinished:0];
  [(PPTTestDelegate *)self->_testDelegate setOnReceiveHandler:0];
  testDelegate = self->_testDelegate;
  self->_testDelegate = 0;
}

- (id)onFatalError
{
  return self->onFatalError;
}

- (void)setOnFatalError:(id)a3
{
}

- (id)onIdle
{
  return self->onIdle;
}

- (void)setOnIdle:(id)a3
{
}

- (id)onStopped
{
  return self->onStopped;
}

- (void)setOnStopped:(id)a3
{
}

- (id)onStart
{
  return self->onStart;
}

- (void)setOnStart:(id)a3
{
}

- (id)onSuccess
{
  return self->onSuccess;
}

- (void)setOnSuccess:(id)a3
{
}

- (id)onTestFinished
{
  return self->onTestFinished;
}

- (void)setOnTestFinished:(id)a3
{
}

- (id)onTestError
{
  return self->onTestError;
}

- (void)setOnTestError:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSMutableArray)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PPTTestSM)testMachine
{
  return self->_testMachine;
}

- (void)setTestMachine:(id)a3
{
}

- (PPTTestRunnerSM)machine
{
  return self->_machine;
}

- (void)setMachine:(id)a3
{
}

- (PPTTestDelegate)testDelegate
{
  return self->_testDelegate;
}

- (void)setTestDelegate:(id)a3
{
}

- (int)testSequence
{
  return self->_testSequence;
}

- (void)setTestSequence:(int)a3
{
  self->_int testSequence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDelegate, 0);
  objc_storeStrong((id *)&self->_machine, 0);
  objc_storeStrong((id *)&self->_testMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong(&self->onTestError, 0);
  objc_storeStrong(&self->onTestFinished, 0);
  objc_storeStrong(&self->onSuccess, 0);
  objc_storeStrong(&self->onStart, 0);
  objc_storeStrong(&self->onStopped, 0);
  objc_storeStrong(&self->onIdle, 0);

  objc_storeStrong(&self->onFatalError, 0);
}

@end