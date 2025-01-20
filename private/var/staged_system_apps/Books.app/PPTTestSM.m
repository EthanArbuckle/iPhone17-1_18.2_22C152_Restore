@interface PPTTestSM
- (PPTTestSM)initWithDelegate:(id)a3;
- (id)onHandlerTimeout;
- (id)onTestError;
- (id)onTestFinished;
- (id)onTestTimeout;
- (void)handlerReceived;
- (void)setOnHandlerTimeout:(id)a3;
- (void)setOnTestError:(id)a3;
- (void)setOnTestFinished:(id)a3;
- (void)setOnTestTimeout:(id)a3;
- (void)sleep:(int)a3 completion:(id)a4;
- (void)start;
- (void)startTest;
- (void)testFinished;
@end

@implementation PPTTestSM

- (PPTTestSM)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PPTTestSM;
  v5 = [(PPTTestSM *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_state = 0;
    v6->_sleepSeq = 0;
  }

  return v6;
}

- (void)sleep:(int)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = self->_sleepSeq + 1;
  self->_sleepSeq = v7;
  int state = self->_state;
  dispatch_time_t v9 = dispatch_time(0, 1000000000 * a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E9C8C;
  block[3] = &unk_100A46640;
  int v15 = state;
  int v16 = v7;
  block[4] = self;
  id v14 = v6;
  id v12 = v6;
  dispatch_after(v9, v11, block);
}

- (void)startTest
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [WeakRetained testDelegate];
  [v5 startTest];

  self->_int state = 2;
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int v7 = [v6 testDelegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001E9DA0;
  v8[3] = &unk_100A43D60;
  v8[4] = self;
  -[PPTTestSM sleep:completion:](self, "sleep:completion:", [v7 testTimeout], v8);
}

- (void)start
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E9EF8;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)handlerReceived
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EA114;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)testFinished
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EA1CC;
  block[3] = &unk_100A43D60;
  block[4] = self;
  dispatch_async(v4, block);
}

- (id)onTestFinished
{
  return self->_onTestFinished;
}

- (void)setOnTestFinished:(id)a3
{
}

- (id)onTestError
{
  return self->_onTestError;
}

- (void)setOnTestError:(id)a3
{
}

- (id)onTestTimeout
{
  return self->_onTestTimeout;
}

- (void)setOnTestTimeout:(id)a3
{
}

- (id)onHandlerTimeout
{
  return self->_onHandlerTimeout;
}

- (void)setOnHandlerTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onHandlerTimeout, 0);
  objc_storeStrong(&self->_onTestTimeout, 0);
  objc_storeStrong(&self->_onTestError, 0);
  objc_storeStrong(&self->_onTestFinished, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end