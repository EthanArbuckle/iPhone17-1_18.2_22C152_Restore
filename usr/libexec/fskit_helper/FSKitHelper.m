@interface FSKitHelper
- (id)createQueue:(id)a3;
- (id)getResourceQueue:(id)a3;
- (void)openDevice:(id)a3 devicePath:(id)a4 flags:(int)a5 auditToken:(id)a6 replyHandler:(id)a7;
- (void)revoke:(id)a3 replyHandler:(id)a4;
- (void)wipeFS:(id)a3 replyHandler:(id)a4;
@end

@implementation FSKitHelper

- (id)getResourceQueue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (id)qword_1000087B8;
    objc_sync_enter(v4);
    v5 = [(id)qword_1000087B8 objectForKeyedSubscript:v3];
    objc_sync_exit(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createQueue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (id)qword_1000087B8;
    objc_sync_enter(v4);
    v5 = [(id)qword_1000087B8 objectForKeyedSubscript:v3];
    if (!v5)
    {
      id v6 = +[NSString stringWithFormat:@"com.apple.fskit_helper.queue.%@", v3];
      v5 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
      [(id)qword_1000087B8 setObject:v5 forKeyedSubscript:v3];
    }
    objc_sync_exit(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)openDevice:(id)a3 devicePath:(id)a4 flags:(int)a5 auditToken:(id)a6 replyHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [(FSKitHelper *)self createQueue:v12];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001E14;
  block[3] = &unk_1000041D0;
  id v22 = v13;
  id v23 = v14;
  int v26 = a5;
  id v24 = v12;
  id v25 = v15;
  id v17 = v12;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  dispatch_sync(v16, block);
}

- (void)wipeFS:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 BSDName];
  v9 = [(FSKitHelper *)self getResourceQueue:v8];

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000022C0;
    v12[3] = &unk_1000041F8;
    id v13 = v6;
    id v14 = v7;
    dispatch_sync(v9, v12);

    v10 = v13;
  }
  else
  {
    v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100002B04(v6);
    }

    v10 = fs_errorForPOSIXError();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)revoke:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 BSDName];
  v9 = [(FSKitHelper *)self getResourceQueue:v8];

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000026CC;
    v12[3] = &unk_1000041F8;
    id v13 = v6;
    id v14 = v7;
    dispatch_sync(v9, v12);

    v10 = v13;
  }
  else
  {
    v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100002E10(v6);
    }

    v10 = fs_errorForPOSIXError();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

@end