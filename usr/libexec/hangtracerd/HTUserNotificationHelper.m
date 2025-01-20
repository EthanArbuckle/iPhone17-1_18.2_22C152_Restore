@interface HTUserNotificationHelper
+ (id)sharedHelperWithCategories:(id)a3;
- (NSMutableDictionary)responseHandlers;
- (OS_dispatch_queue)notificationQueue;
- (UNUserNotificationCenter)notificationCenter;
- (void)associatePrefix:(id)a3 withHandler:(id)a4;
- (void)setNotificationCenter:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setResponseHandlers:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation HTUserNotificationHelper

+ (id)sharedHelperWithCategories:(id)a3
{
  id v3 = a3;
  v4 = v3;
  v5 = (void *)qword_100064540;
  if (qword_100064540)
  {
    if (v3)
    {
      v6 = sub_100027DEC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "+[HTUserNotificationHelper sharedHelperWithCategories:]";
        v7 = "%s Shared HTUserNotificationHelper was provided with notification categories, but singleton is already instantiated.";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
LABEL_9:
    id v8 = v5;
    goto LABEL_14;
  }
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002C958;
    block[3] = &unk_100051280;
    id v11 = v3;
    if (qword_100064548 != -1) {
      dispatch_once(&qword_100064548, block);
    }

    v5 = (void *)qword_100064540;
    goto LABEL_9;
  }
  v6 = sub_100027DEC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "+[HTUserNotificationHelper sharedHelperWithCategories:]";
    v7 = "%s Trying to create shared HTUserNotificationHelper but no notification categories provided";
    goto LABEL_12;
  }
LABEL_13:

  id v8 = 0;
LABEL_14:

  return v8;
}

- (void)associatePrefix:(id)a3 withHandler:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v8 = objc_retainBlock(a4);
    v7 = [(HTUserNotificationHelper *)self responseHandlers];
    [v7 setObject:v8 forKeyedSubscript:v6];
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  v28 = self;
  v29 = (void (**)(void))a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = [(HTUserNotificationHelper *)self responseHandlers];
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * v12);
      v14 = [v7 notification];
      v15 = [v14 request];
      v16 = [v15 identifier];
      unsigned __int8 v17 = [v16 hasPrefix:v13];

      if (v17) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v18 = [(HTUserNotificationHelper *)v28 responseHandlers];
    uint64_t v19 = [v18 objectForKeyedSubscript:v13];

    if (!v19) {
      goto LABEL_14;
    }
    v20 = sub_100027DEC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = [v7 notification];
      v22 = [v21 request];
      v23 = [v22 identifier];
      v24 = [v7 actionIdentifier];
      *(_DWORD *)buf = 138412546;
      v35 = v23;
      __int16 v36 = 2112;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "ResponseHandler invoked, request %@, action %@", buf, 0x16u);
    }
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v7);
  }
  else
  {
LABEL_9:

LABEL_14:
    uint64_t v19 = sub_100027DEC();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
    {
      v25 = [v7 notification];
      v26 = [v25 request];
      v27 = [v26 identifier];
      *(_DWORD *)buf = 138412290;
      v35 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_INFO, "Request identifier %@ using default handler", buf, 0xCu);
    }
  }

  if (v29) {
    v29[2](v29);
  }
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end