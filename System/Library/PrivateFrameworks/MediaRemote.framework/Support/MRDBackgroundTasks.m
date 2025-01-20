@interface MRDBackgroundTasks
- (id)allowList;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
@end

@implementation MRDBackgroundTasks

- (id)allowList
{
  if (qword_10047E038 != -1) {
    dispatch_once(&qword_10047E038, &stru_100419488);
  }
  v2 = (void *)qword_10047E030;

  return v2;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "MRXPC_NOTIFICATION_NAME_KEY");
  id v7 = [objc_alloc((Class)NSString) initWithCString:string encoding:4];
  v8 = [(MRDBackgroundTasks *)self allowList];
  unsigned __int8 v9 = [v8 containsObject:v7];

  if (v9)
  {
    double v10 = xpc_dictionary_get_double(v5, "MRXPC_NOTIFICATION_DELAY");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100086560;
    v13[3] = &unk_1004165C0;
    v13[4] = string;
    v11 = objc_retainBlock(v13);
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_double(v12, XPC_ACTIVITY_DELAY, v10);
    xpc_activity_register(string, v12, v11);
  }
  else
  {
    v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10032C004((uint64_t)v7, v11);
    }
  }
}

@end