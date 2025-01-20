@interface NetworkActivityIndicator
- (NetworkActivityIndicator)init;
- (void)_hideStatusBarProgress;
- (void)dealloc;
- (void)networkActivityEnded:(id)a3;
- (void)networkActivityStarted:(id)a3;
- (void)setStatusBarShowsMailProgress:(id)a3;
- (void)setStatusBarShowsProgress:(BOOL)a3;
@end

@implementation NetworkActivityIndicator

- (NetworkActivityIndicator)init
{
  v5.receiver = self;
  v5.super_class = (Class)NetworkActivityIndicator;
  v2 = [(NetworkActivityIndicator *)&v5 init];
  v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_activityLock, 0);
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_activityLock);
  v3.receiver = self;
  v3.super_class = (Class)NetworkActivityIndicator;
  [(NetworkActivityIndicator *)&v3 dealloc];
}

- (void)networkActivityStarted:(id)a3
{
  id v10 = a3;
  pthread_mutex_lock(&self->_activityLock);
  id v4 = [(NSMutableSet *)self->_networkMonitors count];
  if (v10)
  {
    networkMonitors = self->_networkMonitors;
    if (!networkMonitors)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v7 = self->_networkMonitors;
      self->_networkMonitors = v6;

      networkMonitors = self->_networkMonitors;
    }
    [(NSMutableSet *)networkMonitors addObject:v10];
  }
  id v8 = [(NSMutableSet *)self->_networkMonitors count];
  pthread_mutex_unlock(&self->_activityLock);
  if ((v4 == 0) == (v8 != 0))
  {
    v9 = +[NSNumber numberWithBool:v8 != 0];
    [(NetworkActivityIndicator *)self setStatusBarShowsMailProgress:v9];
  }
}

- (void)networkActivityEnded:(id)a3
{
  id v7 = a3;
  pthread_mutex_lock(&self->_activityLock);
  id v4 = [(NSMutableSet *)self->_networkMonitors count];
  if (v7) {
    [(NSMutableSet *)self->_networkMonitors removeObject:v7];
  }
  id v5 = [(NSMutableSet *)self->_networkMonitors count];
  pthread_mutex_unlock(&self->_activityLock);
  if ((v4 == 0) == (v5 != 0))
  {
    v6 = +[NSNumber numberWithBool:v5 != 0];
    [(NetworkActivityIndicator *)self setStatusBarShowsMailProgress:v6];
  }
}

- (void)setStatusBarShowsProgress:(BOOL)a3
{
  if (byte_100699E40 != a3)
  {
    byte_100699E40 = a3;
    [UIApp setStatusBarShowsProgress:];
  }
}

- (void)setStatusBarShowsMailProgress:(id)a3
{
  id v11 = a3;
  if (+[NSThread isMainThread])
  {
    if ([v11 BOOLValue])
    {
      uint64_t v5 = qword_100699E48;
      if (*(double *)&qword_100699E48 == 0.0)
      {
        +[NSDate timeIntervalSinceReferenceDate];
        qword_100699E48 = v5;
      }
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_hideStatusBarProgress", 0, *(double *)&v5);
      [(NetworkActivityIndicator *)self setStatusBarShowsProgress:1];
    }
    else
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v7 = v6 - *(double *)&qword_100699E48;
      double v8 = 1.0 - v7;
      BOOL v9 = v7 < 1.0;
      double v10 = 0.200000003;
      if (v9) {
        double v10 = v8;
      }
      [(NetworkActivityIndicator *)self performSelector:"_hideStatusBarProgress" withObject:0 afterDelay:v10];
    }
  }
  else
  {
    [(NetworkActivityIndicator *)self performSelectorOnMainThread:a2 withObject:v11 waitUntilDone:0];
  }
}

- (void)_hideStatusBarProgress
{
  [(NetworkActivityIndicator *)self setStatusBarShowsProgress:0];
  qword_100699E48 = 0;
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:MailApplicationStatusBarProgressDidHideNotification object:0];
}

- (void).cxx_destruct
{
}

@end