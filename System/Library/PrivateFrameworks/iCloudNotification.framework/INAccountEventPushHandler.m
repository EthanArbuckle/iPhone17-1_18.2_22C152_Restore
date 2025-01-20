@interface INAccountEventPushHandler
- (INAccountEventPushHandler)init;
- (INAccountEventPushHandler)initWithAccountStore:(id)a3;
- (id)_iCloudAccountType;
- (void)_dismissNotificationsForPushEventWithID:(id)a3;
- (void)_handleEventDetailsResponse:(id)a3 forEventID:(id)a4 accountID:(id)a5 pushMessage:(id)a6;
- (void)_requestEventDetailsForPushMessage:(id)a3 withEventID:(id)a4 recipientDSID:(id)a5;
- (void)_sendAcknowledgementForNotification:(id)a3;
- (void)accountNotifier:(id)a3 didActivateNotification:(id)a4;
- (void)accountNotifier:(id)a3 didClearNotification:(id)a4;
- (void)accountNotifier:(id)a3 didDismissNotification:(id)a4;
- (void)handleIncomingPushNotification:(id)a3;
@end

@implementation INAccountEventPushHandler

- (INAccountEventPushHandler)init
{
  return 0;
}

- (INAccountEventPushHandler)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INAccountEventPushHandler;
  v6 = [(INAccountEventPushHandler *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = (ANAccountNotifier *)[objc_alloc((Class)ANAccountNotifier) initWithCallbackMachService:@"com.apple.ind.and_callback"];
    accountNotifier = v7->_accountNotifier;
    v7->_accountNotifier = v8;

    [(ANAccountNotifier *)v7->_accountNotifier setDelegate:v7];
    v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    networkingQueue = v7->_networkingQueue;
    v7->_networkingQueue = v10;
  }
  return v7;
}

- (void)handleIncomingPushNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"dsid"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = _INLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000264D4((uint64_t)v6, v10);
        }

        v9 = 0;
        goto LABEL_13;
      }
      id v7 = [v6 stringValue];
    }
    v9 = v7;
LABEL_13:
    v11 = [v4 userInfo];
    v8 = [v11 objectForKeyedSubscript:@"msgid"];

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = _INLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10002B7B0();
        }
      }
    }
    objc_super v13 = [v4 userInfo];
    v14 = [v13 objectForKeyedSubscript:@"event"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 isEqualToString:@"dismiss"]) {
      [(INAccountEventPushHandler *)self _dismissNotificationsForPushEventWithID:v8];
    }
    else {
      [(INAccountEventPushHandler *)self _requestEventDetailsForPushMessage:v4 withEventID:v8 recipientDSID:v9];
    }

    goto LABEL_23;
  }
  v8 = _INLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10002B77C();
  }
  v9 = 0;
LABEL_23:
}

- (void)_requestEventDetailsForPushMessage:(id)a3 withEventID:(id)a4 recipientDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithPersonID:v10];
  if (v11)
  {
    v12 = [[INAccountEventDetailsRequest alloc] initWithAccount:v11 pushMessage:v8];
    objc_super v13 = +[INDaemon sharedInstance];
    v14 = [v13 pushToken];
    [(INAccountEventDetailsRequest *)v12 setPushToken:v14];

    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10001CC38;
    v22 = &unk_100041830;
    v23 = self;
    id v24 = v9;
    id v25 = v11;
    id v26 = v8;
    v15 = objc_retainBlock(&v19);
    v16 = _INLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10002B818();
    }

    id v17 = objc_alloc((Class)AARequester);
    id v18 = objc_msgSend(v17, "initWithRequest:handler:", v12, v15, v19, v20, v21, v22, v23);
    [(NSOperationQueue *)self->_networkingQueue addOperation:v18];
  }
  else
  {
    _INLogSystem();
    v12 = (INAccountEventDetailsRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_100026404();
    }
  }
}

- (void)_handleEventDetailsResponse:(id)a3 forEventID:(id)a4 accountID:(id)a5 pushMessage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _INLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10002B920(v10);
  }

  v15 = [v10 error];

  if (v15)
  {
    uint64_t v16 = _INLogSystem();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_10002B88C(v10, v16);
    }
  }
  else if ([v10 showAlert])
  {
    uint64_t v16 = [v10 title];
    uint64_t v17 = [v10 message];
    if (v16 | v17)
    {
      id v19 = objc_alloc((Class)ANAccountNotification);
      uint64_t v20 = [(INAccountEventPushHandler *)self _iCloudAccountType];
      id v18 = [v19 initForAccountWithType:v20];

      [v18 setTitle:v16];
      [v18 setMessage:v17];
      [v18 setEventIdentifier:v11];
      v21 = [v10 defaultButtonTitle];
      [v18 setActivateButtonTitle:v21];

      uint64_t v22 = [v10 defaultButtonURL];
      v30 = (void *)v22;
      if (v22)
      {
        v23 = +[ANNotificationAction actionForOpeningWebURL:v22];
        [v18 setActivateAction:v23];
      }
      else
      {
        v23 = _INLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No server-supplied default action URL.", v33, 2u);
        }
      }

      uint64_t v24 = [v10 alternateButtonURL];
      uint64_t v31 = v17;
      v29 = (void *)v24;
      if (v24)
      {
        id v25 = +[ANNotificationAction actionForOpeningWebURL:v24];
        [v18 setDismissAction:v25];
      }
      else
      {
        id v25 = _INLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No server-supplied alternate action URL.", v32, 2u);
        }
      }

      id v26 = objc_alloc_init((Class)NSMutableDictionary);
      [v26 setObject:v12 forKeyedSubscript:@"INAccountID"];
      v27 = [v13 userInfo];
      id v28 = [v27 mutableCopy];

      [v28 removeObjectForKey:@"aps"];
      if (v28) {
        [v26 setObject:v28 forKeyedSubscript:@"INPushMessage"];
      }
      [v18 setUserInfo:v26];
      [(ANAccountNotifier *)self->_accountNotifier addNotification:v18];

      uint64_t v17 = v31;
    }
    else
    {
      id v18 = _INLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002B858();
      }
    }
  }
  else
  {
    uint64_t v16 = _INLogSystem();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Account event details says not to notify.", buf, 2u);
    }
  }
}

- (void)_dismissNotificationsForPushEventWithID:(id)a3
{
  id v4 = a3;
  id v5 = _INLogSystem();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing notifications for event ID: %@", (uint8_t *)&v7, 0xCu);
    }

    [(ANAccountNotifier *)self->_accountNotifier removeNotificationsWithEventIdentifier:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002B998();
    }
  }
}

- (void)accountNotifier:(id)a3 didActivateNotification:(id)a4
{
  id v5 = a4;
  v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }

  [(INAccountEventPushHandler *)self _sendAcknowledgementForNotification:v5];
}

- (void)accountNotifier:(id)a3 didClearNotification:(id)a4
{
  id v4 = a4;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)accountNotifier:(id)a3 didDismissNotification:(id)a4
{
  id v5 = a4;
  int v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }

  [(INAccountEventPushHandler *)self _sendAcknowledgementForNotification:v5];
}

- (void)_sendAcknowledgementForNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:@"INAccountID"];

  int v7 = [(ACAccountStore *)self->_accountStore accountWithIdentifier:v6];
  if (v7)
  {
    id v8 = [v4 userInfo];
    id v9 = [v8 objectForKeyedSubscript:@"INPushMessage"];

    if (!v9)
    {
      id v10 = _INLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002BA74();
      }
    }
    id v11 = [[INAcknowledgeAccountAlertRequest alloc] initWithAccount:v7 store:self->_accountStore];
    [(INAcknowledgeAccountAlertRequest *)v11 setPushMessageInfo:v9];
    id v12 = +[INDaemon sharedInstance];
    id v13 = [v12 pushToken];
    [(INAcknowledgeAccountAlertRequest *)v11 setPushToken:v13];

    v14 = _INLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10002BA34();
    }

    id v15 = [objc_alloc((Class)AARequester) initWithRequest:v11 handler:&stru_100041870];
    [(NSOperationQueue *)self->_networkingQueue addOperation:v15];
  }
  else
  {
    id v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002B9CC();
    }
  }
}

- (id)_iCloudAccountType
{
  iCloudAccountType = self->_iCloudAccountType;
  if (!iCloudAccountType)
  {
    id v4 = [(ACAccountStore *)self->_accountStore aa_appleAccountType];
    id v5 = self->_iCloudAccountType;
    self->_iCloudAccountType = v4;

    iCloudAccountType = self->_iCloudAccountType;
  }
  return iCloudAccountType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountNotifier, 0);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_iCloudAccountType, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end