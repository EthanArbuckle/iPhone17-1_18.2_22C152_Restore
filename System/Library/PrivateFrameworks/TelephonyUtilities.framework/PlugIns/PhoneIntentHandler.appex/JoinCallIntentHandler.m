@interface JoinCallIntentHandler
- (JoinCallIntentHandler)init;
- (JoinCallIntentHandler)initWithCallCenter:(id)a3 contactsDataSource:(id)a4;
- (TUCallCenter)callCenter;
- (TUContactsDataSource)contactsDataSource;
- (id)_responseForMatchingConversation:(id)a3 intent:(id)a4;
- (void)confirmJoinCall:(id)a3 completion:(id)a4;
- (void)handleJoinCall:(id)a3 completion:(id)a4;
- (void)resolveGroupConversationForJoinCall:(id)a3 withCompletion:(id)a4;
@end

@implementation JoinCallIntentHandler

- (JoinCallIntentHandler)init
{
  id v3 = +[NSString stringWithFormat:@"com.apple.TelephonyUtilities.PhoneIntentHandler.%@", objc_opt_class()];
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);

  v5 = +[TUCallCenter callCenterWithQueue:v4];
  v6 = [v5 contactStore];
  v7 = [(JoinCallIntentHandler *)self initWithCallCenter:v5 contactsDataSource:v6];

  return v7;
}

- (JoinCallIntentHandler)initWithCallCenter:(id)a3 contactsDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)JoinCallIntentHandler;
  v9 = [(JoinCallIntentHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_callCenter, a3);
    objc_storeStrong((id *)&v10->_contactsDataSource, a4);
  }

  return v10;
}

- (void)handleJoinCall:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling join call intent: %@", (uint8_t *)&buf, 0xCu);
  }

  v9 = [v6 groupConversation];
  v10 = [v9 conversationId];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000233CC;
  v26 = sub_1000233DC;
  id v27 = 0;
  v11 = [(JoinCallIntentHandler *)self callCenter];
  objc_super v12 = [v11 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000233E4;
  block[3] = &unk_10004D168;
  id v13 = v10;
  id v20 = v13;
  v21 = self;
  p_long long buf = &buf;
  dispatch_sync(v12, block);

  uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
  if (v14)
  {
    id v15 = [(JoinCallIntentHandler *)self _responseForMatchingConversation:v14 intent:v6];
  }
  else
  {
    v16 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No matching conversation. Returning failure.", v18, 2u);
    }

    id v15 = [objc_alloc((Class)INJoinCallIntentResponse) initWithCode:5 userActivity:0];
  }
  v17 = v15;
  v7[2](v7, v15);

  _Block_object_dispose(&buf, 8);
}

- (id)_responseForMatchingConversation:(id)a3 intent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)TUJoinConversationRequest) initWithConversation:v6 originatingUIType:37];

  [v7 setVideoEnabled:1];
  id v8 = +[NSUserActivity makeActivityWithIntent:v5 joinRequestAttachment:v7];

  v9 = IntentHandlerDefaultLog();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attaching TUJoinConversationRequest to UserActivity", v16, 2u);
    }

    id v11 = objc_alloc((Class)INJoinCallIntentResponse);
    uint64_t v12 = 2;
    id v13 = v8;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100032198(v10);
    }

    id v11 = objc_alloc((Class)INJoinCallIntentResponse);
    uint64_t v12 = 5;
    id v13 = 0;
  }
  id v14 = [v11 initWithCode:v12 userActivity:v13];

  return v14;
}

- (void)confirmJoinCall:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Confirming join call intent: %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [objc_alloc((Class)INJoinCallIntentResponse) initWithCode:1 userActivity:0];
  v6[2](v6, v8);
}

- (void)resolveGroupConversationForJoinCall:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_1000233CC;
  v28 = sub_1000233DC;
  id v29 = 0;
  id v8 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolving join call intent: %@", buf, 0xCu);
  }

  int v9 = [v6 groupConversation];
  id v10 = [v9 conversationId];
  BOOL v11 = [v10 length] == 0;

  if (v11)
  {
    v16 = [(JoinCallIntentHandler *)self callCenter];
    v17 = [v16 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023B38;
    block[3] = &unk_10004D168;
    id v21 = v6;
    v22 = self;
    v23 = &v24;
    dispatch_sync(v17, block);

    id v13 = v21;
  }
  else
  {
    uint64_t v12 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "INCallGroupConversation already resolved.", buf, 2u);
    }

    id v13 = [v6 groupConversation];
    uint64_t v14 = +[INCallGroupConversationResolutionResult successWithResolvedCallGroupConversation:v13];
    id v15 = (void *)v25[5];
    v25[5] = v14;
  }
  v18 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)v25[5];
    *(_DWORD *)long long buf = 138412290;
    id v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling completion on resolution result: %@", buf, 0xCu);
  }

  v7[2](v7, v25[5]);
  _Block_object_dispose(&v24, 8);
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (TUContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsDataSource, 0);

  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end