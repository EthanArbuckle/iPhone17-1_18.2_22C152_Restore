@interface DownloadErrorController
+ (id)sharedErrorController;
- (DownloadErrorController)init;
- (void)_cancelErrorsPassingTest:(id)a3;
- (void)_displayScheduledErrors;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_scheduleErrorDisplay:(id)a3;
- (void)cancelDialogsWithDownloadIdentifier:(int64_t)a3;
- (void)dealloc;
- (void)showDownloadError:(id)a3;
@end

@implementation DownloadErrorController

- (DownloadErrorController)init
{
  v5.receiver = self;
  v5.super_class = (Class)DownloadErrorController;
  v2 = [(DownloadErrorController *)&v5 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.DownloadErrorController", 0);
    v2->_errors = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_scheduledErrors = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 addObserver:v2 selector:"_networkTypeChangedNotification:" name:ISNetworkTypeChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:ISNetworkTypeChangedNotification object:0];
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  scheduledErrorTimer = self->_scheduledErrorTimer;
  if (scheduledErrorTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledErrorTimer);
    dispatch_release((dispatch_object_t)self->_scheduledErrorTimer);
  }

  v5.receiver = self;
  v5.super_class = (Class)DownloadErrorController;
  [(DownloadErrorController *)&v5 dealloc];
}

+ (id)sharedErrorController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001025AC;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401DD8 != -1) {
    dispatch_once(&qword_100401DD8, block);
  }
  return (id)qword_100401DD0;
}

- (void)cancelDialogsWithDownloadIdentifier:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100102648;
  v4[3] = &unk_1003A3838;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)showDownloadError:(id)a3
{
  id v4 = [a3 copy];
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100102754;
  v6[3] = &unk_1003A3380;
  v6[4] = v4;
  v6[5] = self;
  dispatch_async(dispatchQueue, v6);
}

- (void)_networkTypeChangedNotification:(id)a3
{
  if ((uint64_t)[+[ISNetworkObserver sharedInstance] networkType] >= 1)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010296C;
    block[3] = &unk_1003A33A8;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_cancelErrorsPassingTest:(id)a3
{
  id v9 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = (uint64_t)[(NSMutableArray *)self->_errors count];
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      id v7 = [(NSMutableArray *)self->_errors objectAtIndex:v6 - 2];
      if ((*((unsigned int (**)(id, id))a3 + 2))(a3, v7))
      {
        id v8 = [v7 _notification];
        if (v8) {
          [v9 addObject:v8];
        }
        [(NSMutableOrderedSet *)self->_scheduledErrors removeObject:v7];
        [(NSMutableArray *)self->_errors removeObjectAtIndex:v6 - 2];
      }
      --v6;
    }
    while (v6 > 1);
  }
  objc_msgSend(+[UserNotificationCenter defaultCenter](UserNotificationCenter, "defaultCenter"), "cancelUserNotifications:", v9);
}

- (void)_displayScheduledErrors
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_scheduledErrors;
  id v3 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 copyUserNotification];
        id v9 = +[UserNotificationCenter defaultCenter];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100102C48;
        v12[3] = &unk_1003A68A0;
        v12[4] = v7;
        v12[5] = self;
        objc_msgSend(v7, "_setNotification:", objc_msgSend(v9, "showUserNotification:withCompletionBlock:", v8, v12));
      }
      id v4 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  if ([(NSMutableOrderedSet *)self->_scheduledErrors count]) {
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "releaseKeepAliveAssertion:", @"com.apple.itunesstored.DownloadErrorController");
  }
  [(NSMutableOrderedSet *)self->_scheduledErrors removeAllObjects];
  scheduledErrorTimer = self->_scheduledErrorTimer;
  if (scheduledErrorTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledErrorTimer);
    dispatch_release((dispatch_object_t)self->_scheduledErrorTimer);
    self->_scheduledErrorTimer = 0;
  }
}

- (void)_scheduleErrorDisplay:(id)a3
{
  if (![(NSMutableOrderedSet *)self->_scheduledErrors count]) {
    objc_msgSend(+[Daemon daemon](Daemon, "daemon"), "takeKeepAliveAssertion:", @"com.apple.itunesstored.DownloadErrorController");
  }
  [(NSMutableOrderedSet *)self->_scheduledErrors addObject:a3];
  if (!self->_scheduledErrorTimer)
  {
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    self->_scheduledErrorTimer = v5;
    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0, 0);
    scheduledErrorTimer = self->_scheduledErrorTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100102DE8;
    handler[3] = &unk_1003A33A8;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)scheduledErrorTimer, handler);
    dispatch_resume((dispatch_object_t)self->_scheduledErrorTimer);
  }
}

@end