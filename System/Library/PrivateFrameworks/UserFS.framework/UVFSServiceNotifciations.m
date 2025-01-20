@interface UVFSServiceNotifciations
- (void)serviceExitingForDevice:(id)a3 withReply:(id)a4;
@end

@implementation UVFSServiceNotifciations

- (void)serviceExitingForDevice:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
    sub_100004B60((uint64_t)v5, v7);
  }
  id v8 = (id)qword_10000D6A8;
  objc_sync_enter(v8);
  v9 = [(id)qword_10000D6A8 objectForKeyedSubscript:v5];
  objc_sync_exit(v8);

  v10 = qword_10000D6C0;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
      sub_100004AE8((uint64_t)v5, v10);
    }
    [v9 setExited:1];
    v11 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
      sub_100004A70((uint64_t)v5, v10);
    }
    v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
  }
  v6[2](v6, v11);
}

@end