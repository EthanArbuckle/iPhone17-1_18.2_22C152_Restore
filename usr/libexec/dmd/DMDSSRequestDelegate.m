@interface DMDSSRequestDelegate
+ (double)timeout;
- (DMDSSRequestDelegate)initWithRequest:(id)a3;
- (NSTimer)timeoutTimer;
- (SSRequest)request;
- (id)completionBlock;
- (void)_timerDidFire:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setRequest:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation DMDSSRequestDelegate

+ (double)timeout
{
  return 0.0;
}

- (DMDSSRequestDelegate)initWithRequest:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMDSSRequestDelegate;
  v6 = [(DMDSSRequestDelegate *)&v12 init];
  v7 = v6;
  if (v6)
  {
    if (!v5) {
      sub_100087FA4();
    }
    objc_storeStrong((id *)&v6->_request, a3);
    [(SSRequest *)v7->_request setDelegate:v7];
    v8 = +[NSDate distantFuture];
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v9 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v7, "_timerDidFire:", v7, 1);
    timeoutTimer = v7->_timeoutTimer;
    v7->_timeoutTimer = (NSTimer *)v9;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(DMDSSRequestDelegate *)self timeoutTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)DMDSSRequestDelegate;
  [(DMDSSRequestDelegate *)&v4 dealloc];
}

- (void)startWithCompletionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100071D08;
  v4[3] = &unk_1000CA828;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _performBlockOnMainThread(v4);
}

- (void)cancel
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100071E90;
  v2[3] = &unk_1000CA508;
  v2[4] = self;
  _performBlockOnMainThread(v2);
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v6 = +[NSDate distantFuture];
  v7 = [(DMDSSRequestDelegate *)self timeoutTimer];
  [v7 setFireDate:v6];

  v8 = [(DMDSSRequestDelegate *)self completionBlock];
  [(DMDSSRequestDelegate *)self setCompletionBlock:0];
  if (v8)
  {
    uint64_t v9 = dispatch_get_global_queue(0, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100072050;
    v10[3] = &unk_1000CB3B8;
    id v12 = v8;
    id v11 = v5;
    dispatch_async(v9, v10);
  }
}

- (void)requestDidFinish:(id)a3
{
  objc_super v4 = +[NSDate distantFuture];
  id v5 = [(DMDSSRequestDelegate *)self timeoutTimer];
  [v5 setFireDate:v4];

  v6 = [(DMDSSRequestDelegate *)self completionBlock];
  [(DMDSSRequestDelegate *)self setCompletionBlock:0];
  if (v6)
  {
    v7 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100072164;
    block[3] = &unk_1000CB4E0;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

- (void)_timerDidFire:(id)a3
{
  [(DMDSSRequestDelegate *)self cancel];
  objc_super v4 = [(DMDSSRequestDelegate *)self completionBlock];
  [(DMDSSRequestDelegate *)self setCompletionBlock:0];
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100072240;
    block[3] = &unk_1000CB4E0;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

- (SSRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end