@interface PPTTestRunnerSM
- (BOOL)checkFatalError;
- (PPTTestRunnerSM)initWithDelegate:(id)a3;
- (void)fromStoppingToIdle;
- (void)runTest;
- (void)sleep:(int)a3 onEnd:(id)a4;
- (void)start;
- (void)stop;
- (void)testError;
- (void)testFinished;
@end

@implementation PPTTestRunnerSM

- (PPTTestRunnerSM)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPTTestRunnerSM;
  v5 = [(PPTTestRunnerSM *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_state = 0;
    v6->_sleepSeq = 0;
  }

  return v6;
}

- (void)sleep:(int)a3 onEnd:(id)a4
{
  id v6 = a4;
  if (a3 >= 1)
  {
    int state = self->_state;
    int v8 = self->_sleepSeq + 1;
    self->_sleepSeq = v8;
    dispatch_time_t v9 = dispatch_time(0, 1000000000 * a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E2AE0;
    block[3] = &unk_100A46640;
    block[4] = self;
    int v14 = state;
    int v15 = v8;
    id v13 = v6;
    dispatch_after(v9, v11, block);
  }
}

- (void)runTest
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v5 = [WeakRetained isQueueEmpty];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = [v6 onSuccess];

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      dispatch_time_t v9 = [v8 onSuccess];
      v9[2]();
    }
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    v11 = [v10 onIdle];

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_delegate);
      id v13 = [v12 onIdle];
      v13[2]();
    }
    self->_int state = 0;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000E2CE0;
    v19[3] = &unk_100A43D60;
    v19[4] = self;
    int v14 = objc_retainBlock(v19);
    id v15 = objc_loadWeakRetained((id *)p_delegate);
    [v15 prepareTestToStart];

    id v16 = objc_loadWeakRetained((id *)p_delegate);
    unsigned int v17 = [v16 shouldSleepBeforeTest];

    if (v17)
    {
      self->_int state = 1;
      id v18 = objc_loadWeakRetained((id *)p_delegate);
      -[PPTTestRunnerSM sleep:onEnd:](self, "sleep:onEnd:", [v18 timeBeforeTest], v14);
    }
    else
    {
      ((void (*)(void *))v14[2])(v14);
    }
  }
}

- (void)start
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2DD0;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)stop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2F2C;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)fromStoppingToIdle
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained removeTestFromQueue];

  id v5 = objc_loadWeakRetained((id *)p_delegate);
  id v6 = [v5 onStopped];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    id v8 = [v7 onStopped];
    v8[2]();
  }
  id v9 = objc_loadWeakRetained((id *)p_delegate);
  id v10 = [v9 onIdle];

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    id v12 = [v11 onIdle];
    v12[2]();
  }
  self->_int state = 0;
}

- (void)testFinished
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3170;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)checkFatalError
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v5 = [WeakRetained isFatalError];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    id v7 = [v6 onFatalError];

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      id v9 = [v8 onFatalError];
      v9[2]();
    }
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    id v11 = [v10 onIdle];

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_delegate);
      id v13 = [v12 onIdle];
      v13[2]();
    }
    self->_int state = 0;
  }
  return v5;
}

- (void)testError
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3480;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void).cxx_destruct
{
}

@end