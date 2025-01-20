@interface SKFSTaskMessageHandler
- (BOOL)taskDone;
- (NSError)error;
- (NSUUID)taskID;
- (OS_dispatch_group)group;
- (SKFSTaskMessageHandler)initWithProgress:(id)a3 dispatchGroup:(id)a4;
- (SKProgress)progress;
- (void)completed:(id)a3 replyHandler:(id)a4;
- (void)getLocalizationSetup:(id)a3;
- (void)logMessage:(id)a3;
- (void)prompt:(id)a3 replyHandler:(id)a4;
- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4;
- (void)setError:(id)a3;
- (void)setTaskID:(id)a3;
@end

@implementation SKFSTaskMessageHandler

- (SKFSTaskMessageHandler)initWithProgress:(id)a3 dispatchGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKFSTaskMessageHandler;
  v9 = [(SKFSTaskMessageHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    objc_storeStrong((id *)&v10->_group, a4);
    error = v10->_error;
    v10->_error = 0;

    v10->_taskDone = 0;
    v12 = [(SKFSTaskMessageHandler *)v10 group];
    dispatch_group_enter(v12);
  }
  return v10;
}

- (NSError)error
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_error;
  objc_sync_exit(v2);

  return v3;
}

- (void)setError:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v6) {
    objc_storeStrong((id *)&v5->_error, a3);
  }
  objc_sync_exit(v5);
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(SKFSTaskMessageHandler *)self taskDone])
  {
    id v8 = +[SKBaseManager sharedManager];
    [v8 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_1000496F8];

    v9 = sub_10000DD48();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = [(SKFSTaskMessageHandler *)self taskID];
      int v16 = 136315650;
      v17 = "-[SKFSTaskMessageHandler completed:replyHandler:]";
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v10;
      __int16 v20 = 2112;
      CFStringRef v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s: Reached an extra completion callback for task %@, error %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    v11 = sub_10000DD48();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(SKFSTaskMessageHandler *)self taskID];
      v13 = (void *)v12;
      CFStringRef v14 = &stru_10004A7A8;
      int v16 = 136315650;
      v17 = "-[SKFSTaskMessageHandler completed:replyHandler:]";
      __int16 v18 = 2112;
      if (v6) {
        CFStringRef v14 = v6;
      }
      uint64_t v19 = v12;
      __int16 v20 = 2112;
      CFStringRef v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Task %@ done %@", (uint8_t *)&v16, 0x20u);
    }
    [(SKFSTaskMessageHandler *)self setError:v6];
    v15 = [(SKFSTaskMessageHandler *)self group];
    dispatch_group_leave(v15);

    self->_taskDone = 1;
  }
  v7[2](v7, 0, v6);
}

- (void)logMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(SKFSTaskMessageHandler *)self progress];
  [v5 setLocalizedAdditionalDescription:v4];
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
}

- (void)getLocalizationSetup:(id)a3
{
  id v4 = a3;
  id v6 = +[NSLocale currentLocale];
  id v5 = +[NSLocale preferredLanguages];
  (*((void (**)(id, id, void *, void))a3 + 2))(v4, v6, v5, 0);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)taskDone
{
  return self->_taskDone;
}

- (NSUUID)taskID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTaskID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end