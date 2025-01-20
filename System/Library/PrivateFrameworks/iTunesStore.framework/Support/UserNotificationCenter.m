@interface UserNotificationCenter
+ (id)defaultCenter;
- (UserNotificationCenter)init;
- (id)prepareUserNotificationWithDialog:(id)a3;
- (id)showDialog:(id)a3 withCompletionBlock:(id)a4;
- (id)showUserNotification:(__CFDictionary *)a3 withOptions:(unint64_t)a4 completionBlock:(id)a5;
- (id)showUserNotification:(id)a3 withCompletionBlock:(id)a4;
- (void)_finishUserNotification:(__CFUserNotification *)a3 withResponseFlags:(unint64_t)a4;
- (void)_showPreparedNotification:(id)a3;
- (void)cancelUserNotification:(id)a3;
- (void)cancelUserNotifications:(id)a3;
- (void)dealloc;
- (void)showPreparedNotification:(id)a3 withCompletionBlock:(id)a4;
- (void)updateUserNotification:(id)a3 withDialog:(id)a4;
- (void)updateUserNotification:(id)a3 withDictionary:(__CFDictionary *)a4 options:(unint64_t)a5;
- (void)updateUserNotification:(id)a3 withUserNotification:(id)a4;
@end

@implementation UserNotificationCenter

- (UserNotificationCenter)init
{
  v4.receiver = self;
  v4.super_class = (Class)UserNotificationCenter;
  v2 = [(UserNotificationCenter *)&v4 init];
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstored.UserNotificationCenter", 0);
    v2->_userNotifications = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)UserNotificationCenter;
  [(UserNotificationCenter *)&v3 dealloc];
}

+ (id)defaultCenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100104E50;
  block[3] = &unk_1003A33A8;
  block[4] = a1;
  if (qword_100401DE8 != -1) {
    dispatch_once(&qword_100401DE8, block);
  }
  return (id)qword_100401DE0;
}

- (void)cancelUserNotification:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(UserNotificationCenter *)self cancelUserNotifications:v4];
}

- (void)cancelUserNotifications:(id)a3
{
  if ([a3 count])
  {
    dispatchQueue = self->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100104F6C;
    v6[3] = &unk_1003A3380;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(dispatchQueue, v6);
  }
}

- (id)prepareUserNotificationWithDialog:(id)a3
{
  id v3 = [a3 copyUserNotification];
  id v4 = -[UserNotification initWithDictionary:options:completionBlock:]([UserNotification alloc], "initWithDictionary:options:completionBlock:", [v3 dictionary], objc_msgSend(v3, "optionFlags"), 0);

  return v4;
}

- (id)showDialog:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = [a3 copyUserNotification];
  id v7 = [(UserNotificationCenter *)self showUserNotification:v6 withCompletionBlock:a4];

  return v7;
}

- (void)showPreparedNotification:(id)a3 withCompletionBlock:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001053D0;
  block[3] = &unk_1003A68C8;
  void block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(dispatchQueue, block);
}

- (id)showUserNotification:(id)a3 withCompletionBlock:(id)a4
{
  id v7 = [a3 dictionary];
  id v8 = [a3 optionFlags];

  return [(UserNotificationCenter *)self showUserNotification:v7 withOptions:v8 completionBlock:a4];
}

- (id)showUserNotification:(__CFDictionary *)a3 withOptions:(unint64_t)a4 completionBlock:(id)a5
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_10010556C;
  v13 = sub_10010557C;
  uint64_t v14 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105588;
  block[3] = &unk_1003A68F0;
  block[6] = &v9;
  void block[7] = a3;
  block[8] = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_sync(dispatchQueue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)updateUserNotification:(id)a3 withDialog:(id)a4
{
  id v6 = [a4 copyUserNotification];
  [(UserNotificationCenter *)self updateUserNotification:a3 withUserNotification:v6];
}

- (void)updateUserNotification:(id)a3 withDictionary:(__CFDictionary *)a4 options:(unint64_t)a5
{
  CFRetain(a4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001056E4;
  block[3] = &unk_1003A6918;
  block[4] = a3;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateUserNotification:(id)a3 withUserNotification:(id)a4
{
  id v7 = [a4 dictionary];
  id v8 = [a4 optionFlags];

  [(UserNotificationCenter *)self updateUserNotification:a3 withDictionary:v7 options:v8];
}

- (void)_finishUserNotification:(__CFUserNotification *)a3 withResponseFlags:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105800;
  block[3] = &unk_1003A6918;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)_showPreparedNotification:(id)a3
{
  if ([a3 isCanceled])
  {
    id v5 = [a3 completionBlock];
    if (!v5) {
      return;
    }
    id v6 = v5;
    global_queue = dispatch_get_global_queue(0, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100105AF4;
    v11[3] = &unk_1003A40D0;
    v11[4] = v6;
    id v8 = v11;
  }
  else
  {
    id v9 = +[Daemon daemon];
    [(NSMutableArray *)self->_userNotifications addObject:a3];
    if ([(NSMutableArray *)self->_userNotifications count] == (id)1) {
      [v9 takeKeepAliveAssertion:@"com.apple.itunesstored.UserNotificationCenter"];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100105B0C;
    block[3] = &unk_1003A3380;
    block[4] = v9;
    void block[5] = a3;
    global_queue = &_dispatch_main_q;
    id v8 = block;
  }
  dispatch_async(global_queue, v8);
}

@end