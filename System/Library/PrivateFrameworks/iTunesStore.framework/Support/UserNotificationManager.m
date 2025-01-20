@interface UserNotificationManager
+ (UserNotificationManager)sharedManager;
- (OS_dispatch_queue)delegateQueue;
- (UNUserNotificationCenter)center;
- (UserNotificationManager)init;
- (id)_bag;
- (void)setCenter:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UserNotificationManager

- (UserNotificationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)UserNotificationManager;
  v2 = [(UserNotificationManager *)&v12 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.MobileStore"];
    center = v2->_center;
    v2->_center = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstored.UserNotifications", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v5;

    v7 = +[UNNotificationCategory categoryWithIdentifier:@"mst-notification-category" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:1];
    v8 = v2->_center;
    v13 = v7;
    v9 = +[NSArray arrayWithObjects:&v13 count:1];
    v10 = +[NSSet setWithArray:v9];
    [(UNUserNotificationCenter *)v8 setNotificationCategories:v10];

    [(UNUserNotificationCenter *)v2->_center setDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setPrivateDelegate:v2];
    [(UNUserNotificationCenter *)v2->_center setWantsNotificationResponsesDelivered];
  }
  return v2;
}

+ (UserNotificationManager)sharedManager
{
  if (qword_100402020 != -1) {
    dispatch_once(&qword_100402020, &stru_1003A9278);
  }
  v2 = (void *)qword_100402018;

  return (UserNotificationManager *)v2;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(UserNotificationManager *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B7C80;
  block[3] = &unk_1003A4D30;
  id v13 = v7;
  v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UserNotificationManager *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B7FA8;
  block[3] = &unk_1003A4298;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)_bag
{
  id v2 = objc_alloc_init((Class)ISLoadURLBagOperation);
  [v2 start];
  unsigned int v3 = [v2 success];
  uint64_t v4 = [v2 error];
  dispatch_queue_t v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    id v7 = +[SSLogConfig sharediTunesStoreConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      *(_DWORD *)v18 = 138543618;
      *(void *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v5;
      id v11 = *(id *)&v18[4];
      LODWORD(v17) = 22;
      id v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16]);
      free(v12);
      SSFileLog();
    }

    goto LABEL_16;
  }
LABEL_17:
  id v13 = objc_alloc((Class)ISAMSBagShim);
  v14 = [v2 URLBag];
  id v15 = [v13 initWithURLBag:v14];

  return v15;
}

- (UNUserNotificationCenter)center
{
  return self->_center;
}

- (void)setCenter:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_storeStrong((id *)&self->_center, 0);
}

@end