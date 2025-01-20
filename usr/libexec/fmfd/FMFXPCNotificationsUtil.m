@interface FMFXPCNotificationsUtil
+ (void)handleDarwinNotificationsWithHandlers:(id)a3;
+ (void)handleDistributedNotificationsWithHandlers:(id)a3;
@end

@implementation FMFXPCNotificationsUtil

+ (void)handleDarwinNotificationsWithHandlers:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionary];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000228A4;
  v8[3] = &unk_1000A21F0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022AD4;
  v6[3] = &unk_1000A2218;
  id v7 = v4;
  id v5 = v7;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, v6);
}

+ (void)handleDistributedNotificationsWithHandlers:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionary];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022C94;
  v8[3] = &unk_1000A21F0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022EC4;
  v6[3] = &unk_1000A2218;
  id v7 = v4;
  id v5 = v7;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, v6);
}

@end