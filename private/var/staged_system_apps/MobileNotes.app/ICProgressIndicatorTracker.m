@interface ICProgressIndicatorTracker
- (BOOL)makingProgress;
- (BOOL)progressIndicatorShouldAnimate;
- (ICProgressIndicatorTracker)init;
- (ICProgressIndicatorTracker)initWithDelegate:(id)a3;
- (ICProgressIndicatorTrackerDelegate)delegate;
- (ICSelectorDelayer)progressIndicatorShouldStartDelayer;
- (ICSelectorDelayer)progressIndicatorShouldStopDelayer;
- (NSDate)progressIndicatorStartDate;
- (void)invalidate;
- (void)progressIndicatorShouldUpdate;
- (void)setDelegate:(id)a3;
- (void)setMakingProgress:(BOOL)a3;
- (void)setProgressIndicatorShouldAnimate:(BOOL)a3;
- (void)setProgressIndicatorShouldStartDelayer:(id)a3;
- (void)setProgressIndicatorShouldStopDelayer:(id)a3;
- (void)setProgressIndicatorStartDate:(id)a3;
@end

@implementation ICProgressIndicatorTracker

- (ICProgressIndicatorTracker)init
{
  return 0;
}

- (ICProgressIndicatorTracker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICProgressIndicatorTracker;
  v5 = [(ICProgressIndicatorTracker *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(ICProgressIndicatorTracker *)v5 setDelegate:v4];
    id v7 = [objc_alloc((Class)ICSelectorDelayer) initWithTarget:v6 selector:"progressIndicatorShouldUpdate" delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:0.1];
    [(ICProgressIndicatorTracker *)v6 setProgressIndicatorShouldStartDelayer:v7];

    id v8 = [objc_alloc((Class)ICSelectorDelayer) initWithTarget:v6 selector:"progressIndicatorShouldUpdate" delay:0 waitToFireUntilRequestsStop:1 callOnMainThread:1.0];
    [(ICProgressIndicatorTracker *)v6 setProgressIndicatorShouldStopDelayer:v8];
  }
  return v6;
}

- (void)invalidate
{
  [(ICProgressIndicatorTracker *)self setDelegate:0];
  v3 = [(ICProgressIndicatorTracker *)self progressIndicatorShouldStartDelayer];
  [v3 cancelPreviousFireRequests];

  id v4 = [(ICProgressIndicatorTracker *)self progressIndicatorShouldStopDelayer];
  [v4 cancelPreviousFireRequests];
}

- (void)setMakingProgress:(BOOL)a3
{
  if (self->_makingProgress != a3)
  {
    BOOL v3 = a3;
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1004DBA10(v3, v5);
    }

    self->_makingProgress = v3;
    v6 = [(ICProgressIndicatorTracker *)self progressIndicatorShouldStartDelayer];
    id v7 = v6;
    if (v3)
    {
      [v6 requestFire];

      id v8 = [(ICProgressIndicatorTracker *)self progressIndicatorShouldStopDelayer];
      [v8 cancelPreviousFireRequests];
    }
    else
    {
      [v6 cancelPreviousFireRequests];

      uint64_t v9 = [(ICProgressIndicatorTracker *)self progressIndicatorStartDate];
      if (v9)
      {
        objc_super v10 = (void *)v9;
        v11 = [(ICProgressIndicatorTracker *)self progressIndicatorStartDate];
        [v11 timeIntervalSinceNow];
        double v13 = v12;

        if (v13 <= -1.0)
        {
          v17 = [(ICProgressIndicatorTracker *)self progressIndicatorShouldStopDelayer];
          [v17 cancelPreviousFireRequests];

          [(ICProgressIndicatorTracker *)self setProgressIndicatorShouldAnimate:0];
          [(ICProgressIndicatorTracker *)self setProgressIndicatorStartDate:0];
          return;
        }
        double v14 = -v13;
      }
      else
      {
        double v14 = 0.0;
      }
      double v15 = 1.0 - v14;
      v16 = [(ICProgressIndicatorTracker *)self progressIndicatorShouldStopDelayer];
      [v16 setDelay:v15];

      id v8 = [(ICProgressIndicatorTracker *)self progressIndicatorShouldStopDelayer];
      [v8 requestFire];
    }
  }
}

- (void)setProgressIndicatorShouldAnimate:(BOOL)a3
{
  if (self->_progressIndicatorShouldAnimate != a3)
  {
    BOOL v3 = a3;
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1004DBA88(v3, v5);
    }

    self->_progressIndicatorShouldAnimate = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000EFE0C;
    v6[3] = &unk_100625D18;
    BOOL v7 = v3;
    v6[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)progressIndicatorShouldUpdate
{
  BOOL v3 = [(ICProgressIndicatorTracker *)self makingProgress];

  [(ICProgressIndicatorTracker *)self setProgressIndicatorShouldAnimate:v3];
}

- (ICProgressIndicatorTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICProgressIndicatorTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)progressIndicatorShouldAnimate
{
  return self->_progressIndicatorShouldAnimate;
}

- (BOOL)makingProgress
{
  return self->_makingProgress;
}

- (ICSelectorDelayer)progressIndicatorShouldStartDelayer
{
  return self->_progressIndicatorShouldStartDelayer;
}

- (void)setProgressIndicatorShouldStartDelayer:(id)a3
{
}

- (ICSelectorDelayer)progressIndicatorShouldStopDelayer
{
  return self->_progressIndicatorShouldStopDelayer;
}

- (void)setProgressIndicatorShouldStopDelayer:(id)a3
{
}

- (NSDate)progressIndicatorStartDate
{
  return self->_progressIndicatorStartDate;
}

- (void)setProgressIndicatorStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorStartDate, 0);
  objc_storeStrong((id *)&self->_progressIndicatorShouldStopDelayer, 0);
  objc_storeStrong((id *)&self->_progressIndicatorShouldStartDelayer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end