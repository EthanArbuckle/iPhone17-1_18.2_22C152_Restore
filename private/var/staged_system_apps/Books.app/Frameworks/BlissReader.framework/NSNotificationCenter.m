@interface NSNotificationCenter
+ (id)notificationOperationQueue;
- (id)addBackgroundObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6;
- (id)addNonBlockingObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6;
@end

@implementation NSNotificationCenter

+ (id)notificationOperationQueue
{
  if (qword_5732C0 != -1) {
    dispatch_once(&qword_5732C0, &stru_459B98);
  }
  return (id)qword_5732B8;
}

- (id)addBackgroundObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_120928;
  v7[3] = &unk_459BC0;
  v7[4] = a3;
  v7[5] = a4;
  return -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](self, "addObserverForName:object:queue:usingBlock:", a5, a6, [(id)objc_opt_class() notificationOperationQueue], v7);
}

- (id)addNonBlockingObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_120A00;
  v12[3] = &unk_459BE8;
  v12[5] = +[NSThread currentThread];
  v12[6] = a4;
  v12[4] = a3;
  return -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](self, "addObserverForName:object:queue:usingBlock:", a5, a6, [(id)objc_opt_class() notificationOperationQueue], v12);
}

@end