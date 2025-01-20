@interface TCCDMessageController
+ (id)sharedMessageControllerForCurrentPlatform;
- (NSMutableDictionary)messageTypesToHandlers;
- (OS_dispatch_queue)queue;
- (TCCDMessageController)init;
- (void)_sendMessage:(id)a3 handler:(id)a4;
- (void)sendMessage:(id)a3 ofType:(id)a4 handler:(id)a5;
- (void)setIncomingMessageType:(id)a3 handler:(id)a4;
- (void)setMessageTypesToHandlers:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation TCCDMessageController

+ (id)sharedMessageControllerForCurrentPlatform
{
  if (qword_1000AC480 != -1) {
    dispatch_once(&qword_1000AC480, &stru_100095310);
  }
  v2 = (void *)qword_1000AC478;
  return v2;
}

- (TCCDMessageController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TCCDMessageController;
  v2 = [(TCCDMessageController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("TCCDIdsMessageController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageTypesToHandlers = v2->_messageTypesToHandlers;
    v2->_messageTypesToHandlers = v5;

    if (!v2->_queue || !v2->_messageTypesToHandlers)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005991C();
      }

      return 0;
    }
  }
  return v2;
}

- (void)setIncomingMessageType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_super v8 = [(TCCDMessageController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000194D0;
    block[3] = &unk_100095338;
    id v20 = v7;
    block[4] = self;
    id v19 = v6;
    dispatch_async(v8, block);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100019554;
    v17[3] = &unk_100094E78;
    v17[4] = self;
    if (qword_1000AC488 != -1) {
      dispatch_once(&qword_1000AC488, v17);
    }
  }
  else
  {
    v9 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_100059998(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)sendMessage:(id)a3 ofType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v11 = +[NSMutableDictionary dictionaryWithDictionary:v8];
    id v12 = [v9 copy];
    [v11 setObject:v12 forKeyedSubscript:@"TCCDMessageTypeKey"];

    [(TCCDMessageController *)self _sendMessage:v11 handler:v10];
  }
  else
  {
    uint64_t v13 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_100059A10(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)_sendMessage:(id)a3 handler:(id)a4
{
  v4 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
    sub_100059A88(v4);
  }
}

- (NSMutableDictionary)messageTypesToHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessageTypesToHandlers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageTypesToHandlers, 0);
}

@end