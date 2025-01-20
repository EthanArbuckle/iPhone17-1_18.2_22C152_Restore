@interface FMFNetworkObserver
+ (id)sharedInstance;
- (BOOL)isReachable;
- (void)_reportReachabilityChange:(id)a3;
- (void)dealloc;
- (void)setIsReachable:(BOOL)a3;
@end

@implementation FMFNetworkObserver

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007760;
  block[3] = &unk_1000A1440;
  block[4] = a1;
  if (qword_1000BB688 != -1) {
    dispatch_once(&qword_1000BB688, block);
  }
  v2 = (void *)qword_1000BB680;

  return v2;
}

- (void)dealloc
{
  v3 = +[CPNetworkObserver sharedNetworkObserver];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FMFNetworkObserver;
  [(FMFNetworkObserver *)&v4 dealloc];
}

- (void)_reportReachabilityChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000793C;
  v4[3] = &unk_1000A1468;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

@end