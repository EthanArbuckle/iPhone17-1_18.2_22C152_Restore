@interface MRDProactivePrepareForSetQueueSender
- (MRDProactivePrepareForSetQueueSender)init;
- (id)systemMediaAppPlayerPathForNotification:(id)a3;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_initialize;
- (void)_onQueue_sendPrepareForSetQueueTo:(id)a3 reason:(id)a4 type:(int64_t)a5;
- (void)dealloc;
- (void)handleFirstLaunchAfterBootIfNeeded;
- (void)registerForChanges;
- (void)unregisterForChanges;
@end

@implementation MRDProactivePrepareForSetQueueSender

- (MRDProactivePrepareForSetQueueSender)init
{
  v9.receiver = self;
  v9.super_class = (Class)MRDProactivePrepareForSetQueueSender;
  v2 = [(MRDProactivePrepareForSetQueueSender *)&v9 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    [(MRDProactivePrepareForSetQueueSender *)v2 _initialize];
  }
  return v2;
}

- (void)_initialize
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDPPFSQS] <%p> Initializing", (uint8_t *)&v4, 0xCu);
  }

  [(MRDProactivePrepareForSetQueueSender *)self handleFirstLaunchAfterBootIfNeeded];
  [(MRDProactivePrepareForSetQueueSender *)self registerForChanges];
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    dispatch_queue_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDPPFSQS] <%p> Deallocating.", buf, 0xCu);
  }

  [(MRDProactivePrepareForSetQueueSender *)self unregisterForChanges];
  v4.receiver = self;
  v4.super_class = (Class)MRDProactivePrepareForSetQueueSender;
  [(MRDProactivePrepareForSetQueueSender *)&v4 dealloc];
}

- (void)registerForChanges
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
}

- (void)unregisterForChanges
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001460F0;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serialQueue, v7);
}

- (id)systemMediaAppPlayerPathForNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:kMROriginActiveNowPlayingPlayerPathUserInfoKey];

  id v6 = [v3 userInfo];

  v7 = [v6 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];

  id v8 = [v5 origin];
  if (v8 || ([v7 origin], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = objc_alloc((Class)MRClient);
    id v10 = [v9 initWithBundleIdentifier:kMRMediaRemoteSystemMediaApplicationDisplayIdentifier];
    id v11 = [objc_alloc((Class)MRPlayerPath) initWithOrigin:v8 client:v10 player:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)handleFirstLaunchAfterBootIfNeeded
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001465FC;
  block[3] = &unk_100415CC8;
  block[4] = self;
  if (qword_10047E378 != -1) {
    dispatch_once(&qword_10047E378, block);
  }
}

- (void)_onQueue_sendPrepareForSetQueueTo:(id)a3 reason:(id)a4 type:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v22[0] = kMRMediaRemoteOptionPrepareForSetQueueIsProactive;
  v22[1] = kMRMediaRemoteOptionPrepareForSetQueueProactiveReason;
  v23[0] = &__kCFBooleanTrue;
  v23[1] = v8;
  v22[2] = MRMediaRemoteOptionPrepareForSetQueueProactiveReasonType;
  id v9 = +[NSNumber numberWithInteger:a5];
  v23[2] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

  id v11 = +[NSDate date];
  id v12 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"proactivePrepareForSetQueue", v8];
  v13 = v12;
  if (v7) {
    [v12 appendFormat:@" for %@", v7];
  }
  v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v15 = dispatch_get_global_queue(0, 0);
  v18 = v8;
  v19 = v11;
  id v16 = v11;
  id v17 = v8;
  MRMediaRemoteSendCommandToPlayerWithResult();
}

- (void).cxx_destruct
{
}

@end