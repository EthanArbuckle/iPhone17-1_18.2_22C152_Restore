@interface UserFSSleepManager
+ (id)getUserFSSleepManager;
- (UserFSSleepManager)init;
- (void)disableSystemSleep;
- (void)disableSystemSleepDelayed:(id)a3;
- (void)reenableSystemSleep;
@end

@implementation UserFSSleepManager

- (UserFSSleepManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)UserFSSleepManager;
  v2 = [(UserFSSleepManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.userfsd.pm", 0);
    sleepCountQueue = v2->sleepCountQueue;
    v2->sleepCountQueue = (OS_dispatch_queue *)v3;

    v8[0] = @"AssertName";
    v8[1] = @"AssertType";
    v9[0] = @"External Storage";
    v9[1] = @"PreventUserIdleSystemSleep";
    v8[2] = @"AssertLevel";
    v9[2] = &off_100039AC8;
    CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
    if (IOPMAssertionCreateWithProperties(v5, &v2->noSystemIdleSleepAssertion) || !v2->noSystemIdleSleepAssertion)
    {

      v2 = 0;
    }
  }
  return v2;
}

+ (id)getUserFSSleepManager
{
  if (qword_100040348 != -1) {
    dispatch_once(&qword_100040348, &stru_100038C70);
  }
  v2 = (void *)qword_100040340;

  return v2;
}

- (void)disableSystemSleep
{
  sleepCountQueue = self->sleepCountQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B800;
  block[3] = &unk_100038668;
  block[4] = self;
  dispatch_sync(sleepCountQueue, block);
}

- (void)disableSystemSleepDelayed:(id)a3
{
  id v4 = a3;
  sleepCountQueue = self->sleepCountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001B908;
  v7[3] = &unk_100038C98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sleepCountQueue, v7);
}

- (void)reenableSystemSleep
{
  sleepCountQueue = self->sleepCountQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BCC8;
  block[3] = &unk_100038668;
  block[4] = self;
  dispatch_async(sleepCountQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cancelTimer, 0);

  objc_storeStrong((id *)&self->sleepCountQueue, 0);
}

@end