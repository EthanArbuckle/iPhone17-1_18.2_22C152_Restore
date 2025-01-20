@interface STConcretePrimitiveBackgroundActivity
+ (id)_configuredSchedulerWithIdentifier:(id)a3 specifiedInterval:(id)a4 existingInterval:(id)a5 type:(int64_t)a6 workBlock:(id)a7;
+ (id)_identifierForType:(int64_t)a3;
+ (id)_newIntervalFromSpecifiedInterval:(id)a3 existingInterval:(id)a4;
+ (id)_xpcActivityPropertiesForType:(int64_t)a3;
+ (int64_t)_backgroundActivityResultForResult:(int64_t)a3;
+ (int64_t)_concreteBackgroundActivityResultForResult:(int64_t)a3;
+ (int64_t)_qualityOfServiceForType:(int64_t)a3;
- (BOOL)canceled;
- (BOOL)shouldDefer;
- (NSBackgroundActivityScheduler)scheduler;
- (OS_dispatch_queue)activityQueue;
- (STConcretePrimitiveBackgroundActivity)initWithType:(int64_t)a3 interval:(id)a4 willBegin:(id)a5 didEnd:(id)a6;
- (id)activityDidEndBlock;
- (id)completionHandler;
- (int64_t)type;
- (void)cancel;
- (void)endWithResult:(int64_t)a3;
- (void)setCanceled:(BOOL)a3;
@end

@implementation STConcretePrimitiveBackgroundActivity

- (STConcretePrimitiveBackgroundActivity)initWithType:(int64_t)a3 interval:(id)a4 willBegin:(id)a5 didEnd:(id)a6
{
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)STConcretePrimitiveBackgroundActivity;
  id v11 = a6;
  id v12 = a4;
  v13 = [(STConcretePrimitiveBackgroundActivity *)&v37 init];
  v13->_type = a3;
  id v14 = objc_retainBlock(v11);

  id activityDidEndBlock = v13->_activityDidEndBlock;
  v13->_id activityDidEndBlock = v14;

  v13->_canceled = 0;
  id v16 = +[STConcretePrimitiveBackgroundActivity _identifierForType:a3];
  v17 = (const char *)[v16 UTF8String];
  v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
  activityQueue = v13->_activityQueue;
  v13->_activityQueue = (OS_dispatch_queue *)v19;

  id v21 = [[STPromise alloc] initPendingOnQueue:v13->_activityQueue];
  id v22 = v16;
  v23 = (const char *)[v22 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001B5AC;
  handler[3] = &unk_1002FB278;
  id v36 = v21;
  id v24 = v21;
  xpc_activity_register(v23, XPC_ACTIVITY_CHECK_IN, handler);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001B6A0;
  v32[3] = &unk_1002FBB88;
  v25 = v13;
  v33 = v25;
  id v34 = v10;
  id v26 = v10;
  uint64_t v27 = +[STConcretePrimitiveBackgroundActivity _configuredSchedulerWithIdentifier:v22 specifiedInterval:v12 existingInterval:v24 type:a3 workBlock:v32];

  scheduler = v25->_scheduler;
  v25->_scheduler = (NSBackgroundActivityScheduler *)v27;

  v29 = v34;
  v30 = v25;

  return v30;
}

+ (id)_configuredSchedulerWithIdentifier:(id)a3 specifiedInterval:(id)a4 existingInterval:(id)a5 type:(int64_t)a6 workBlock:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  id v16 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:v15];

  v17 = [v14 then];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001B9D8;
  v26[3] = &unk_1002FBBB0;
  id v30 = a1;
  int64_t v31 = a6;
  id v27 = v12;
  id v18 = v16;
  id v28 = v18;
  id v29 = v13;
  dispatch_queue_t v19 = (uint64_t (*)(void *, void *))v17[2];
  id v20 = v13;
  id v21 = v12;
  id v22 = (id)v19(v17, v26);

  v23 = v29;
  id v24 = v18;

  return v24;
}

+ (id)_newIntervalFromSpecifiedInterval:(id)a3 existingInterval:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && ((unsigned int v7 = [v5 isEqualToNumber:&off_10030FE68], v8 = v5, !v7)
     || ([v6 floatValue], v8 = v6, v9 == -1.0)
     || (v8 = v6, v9 != 0.0)))
  {
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)shouldDefer
{
  v2 = [(STConcretePrimitiveBackgroundActivity *)self scheduler];
  unsigned __int8 v3 = [v2 shouldDefer];

  return v3;
}

- (void)endWithResult:(int64_t)a3
{
  id v5 = [(STConcretePrimitiveBackgroundActivity *)self activityQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001BD70;
  v6[3] = &unk_1002FBBD8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)cancel
{
  unsigned __int8 v3 = [(STConcretePrimitiveBackgroundActivity *)self activityQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BF70;
  block[3] = &unk_1002FB6A8;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (id)_identifierForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"com.apple.ScreenTimeAgent.activity.retry-failed-messages";
  }
  else {
    return off_1002FBC18[a3 - 1];
  }
}

+ (int64_t)_qualityOfServiceForType:(int64_t)a3
{
  if (a3 == 3) {
    return 25;
  }
  else {
    return 9;
  }
}

+ (id)_xpcActivityPropertiesForType:(int64_t)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = v4;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v6 = (const char **)&XPC_ACTIVITY_DISK_INTENSIVE;
  }
  else
  {
    id v6 = (const char **)&XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY;
  }
  xpc_dictionary_set_BOOL(v4, *v6, 1);
LABEL_6:
  return v5;
}

+ (int64_t)_backgroundActivityResultForResult:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (int64_t)_concreteBackgroundActivityResultForResult:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (OS_dispatch_queue)activityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSBackgroundActivityScheduler)scheduler
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (id)activityDidEndBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityDidEndBlock, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
}

@end