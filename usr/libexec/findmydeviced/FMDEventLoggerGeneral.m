@interface FMDEventLoggerGeneral
+ (id)sharedInstance;
- (FMDEventLoggerGeneral)init;
- (NSMutableArray)loggedEvents;
- (OS_dispatch_queue)logQueue;
- (void)sendError:(id)a3 forEventName:(id)a4;
- (void)setLogQueue:(id)a3;
- (void)setLoggedEvents:(id)a3;
@end

@implementation FMDEventLoggerGeneral

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098B54;
  block[3] = &unk_1002D9278;
  block[4] = a1;
  if (qword_10031EB88 != -1) {
    dispatch_once(&qword_10031EB88, block);
  }
  v2 = (void *)qword_10031EB90;

  return v2;
}

- (FMDEventLoggerGeneral)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDEventLoggerGeneral;
  v2 = [(FMDEventLoggerGeneral *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(FMDEventLoggerGeneral *)v2 setLoggedEvents:v3];

    dispatch_queue_t v4 = dispatch_queue_create("FMDEventLoggerGeneralQueue", 0);
    [(FMDEventLoggerGeneral *)v2 setLogQueue:v4];
  }
  return v2;
}

- (void)sendError:(id)a3 forEventName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(FMDEventLoggerGeneral *)self logQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100098D34;
  v11[3] = &unk_1002DA298;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (NSMutableArray)loggedEvents
{
  return self->_loggedEvents;
}

- (void)setLoggedEvents:(id)a3
{
}

- (OS_dispatch_queue)logQueue
{
  return self->_logQueue;
}

- (void)setLogQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logQueue, 0);

  objc_storeStrong((id *)&self->_loggedEvents, 0);
}

@end