@interface TCCDIdsMessageController
- (IDSService)idsService;
- (NSMutableDictionary)messageIdsToHandlers;
- (TCCDIdsMessageController)init;
- (void)_makeReadyToReceiveMessages;
- (void)_sendMessage:(id)a3 handler:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setIdsService:(id)a3;
- (void)setMessageIdsToHandlers:(id)a3;
@end

@implementation TCCDIdsMessageController

- (TCCDIdsMessageController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TCCDIdsMessageController;
  v2 = [(TCCDMessageController *)&v8 init];
  if (v2)
  {
    if (objc_opt_class())
    {
      v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.tccd.msg"];
      idsService = v2->_idsService;
      v2->_idsService = v3;
    }
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageIdsToHandlers = v2->_messageIdsToHandlers;
    v2->_messageIdsToHandlers = v5;

    if (!v2->_idsService || !v2->_messageIdsToHandlers)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005960C();
      }

      return 0;
    }
  }
  return v2;
}

- (void)_makeReadyToReceiveMessages
{
  idsService = self->_idsService;
  dispatch_get_global_queue(25, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(IDSService *)idsService addDelegate:self queue:v4];
}

- (void)_sendMessage:(id)a3 handler:(id)a4
{
  v6 = (void (**)(id, id))a4;
  idsService = self->_idsService;
  uint64_t v8 = IDSDefaultPairedDevice;
  id v9 = a3;
  v10 = +[NSSet setWithObject:v8];
  id v21 = 0;
  id v22 = 0;
  unsigned int v11 = [(IDSService *)idsService sendMessage:v9 toDestinations:v10 priority:200 options:0 identifier:&v22 error:&v21];

  id v12 = v22;
  id v13 = v21;

  v14 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
  {
    v16 = "Failed";
    *(_DWORD *)buf = 136315650;
    v24 = "-[TCCDIdsMessageController _sendMessage:handler:]";
    if (v11)
    {
      v16 = "Success";
      id v17 = v12;
    }
    else
    {
      id v17 = v13;
    }
    __int16 v25 = 2080;
    v26 = v16;
    __int16 v27 = 2112;
    id v28 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s: IDS message send status: %s - %@", buf, 0x20u);
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v6[2](v6, v13);
    goto LABEL_9;
  }
  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  v15 = [(TCCDMessageController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018D20;
  block[3] = &unk_1000952C8;
  block[4] = self;
  id v19 = v12;
  v20 = v6;
  dispatch_async(v15, block);

LABEL_9:
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100059700((uint64_t)v15, (uint64_t)v14, v17);
  }
  v18 = [v14 objectForKeyedSubscript:@"TCCDMessageTypeKey"];
  if (v18)
  {
    id v19 = [(TCCDMessageController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018F08;
    block[3] = &unk_100094FB8;
    block[4] = self;
    id v29 = v18;
    id v30 = v14;
    dispatch_async(v19, block);
  }
  else
  {
    v20 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_100059688(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  id v12 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_1000597FC(a6, (uint64_t)v11, v12);
  }
  id v13 = [(TCCDMessageController *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000190BC;
  v16[3] = &unk_1000952F0;
  v16[4] = self;
  id v17 = v10;
  BOOL v19 = a6;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v13, v16);
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdsService:(id)a3
{
}

- (NSMutableDictionary)messageIdsToHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMessageIdsToHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdsToHandlers, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end