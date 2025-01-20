@interface IntentRouter
- (IntentRouter)init;
- (NSMutableArray)recentIntentHandlersAndIdentifiers;
- (id)existingHandlerForIntentIdentifier:(id)a3;
- (id)handlerForIntent:(id)a3;
- (void)registerForProvider;
- (void)setRecentIntentHandlersAndIdentifiers:(id)a3;
- (void)transactionDidCompleteForIntentIdentifier:(id)a3;
- (void)updateRecentlyUsedHandlersWithHandler:(id)a3;
@end

@implementation IntentRouter

- (IntentRouter)init
{
  v7.receiver = self;
  v7.super_class = (Class)IntentRouter;
  v2 = [(IntentRouter *)&v7 init];
  if (v2)
  {
    v3 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000314F0(v3);
    }

    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    recentIntentHandlersAndIdentifiers = v2->_recentIntentHandlersAndIdentifiers;
    v2->_recentIntentHandlersAndIdentifiers = v4;
  }
  [(IntentRouter *)v2 registerForProvider];
  return v2;
}

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [(IntentRouter *)self existingHandlerForIntentIdentifier:v5];

  if (v6) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = StartCallIntentHandler;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = IntentHandlerDefaultLog();
      os_signpost_id_t v11 = os_signpost_id_generate(v10);

      v12 = IntentHandlerDefaultLog();
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        LOWORD(v23) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "HangUpIntentHandlerWaitForProvider", " enableTelemetry=YES ", (uint8_t *)&v23, 2u);
      }

      group = self->_group;
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      if (dispatch_group_wait(group, v15))
      {
        v16 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 134217984;
          uint64_t v24 = 1;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "registerForCallbacksForProvider did not complete before the %ld second timeout.", (uint8_t *)&v23, 0xCu);
        }
      }
      v17 = IntentHandlerDefaultLog();
      v18 = v17;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(v23) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v11, "HangUpIntentHandlerWaitForProvider", "", (uint8_t *)&v23, 2u);
      }

      v9 = HangUpCallIntentHandler;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = PlayVoicemailIntentHandler;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = JoinCallIntentHandler;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v9 = AddCallParticipantIntentHandler;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v9 = SearchCallHistoryIntentHandler;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v9 = AnswerCallIntentHandler;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v22 = IntentHandlerDefaultLog();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                    sub_100031534();
                  }

                  goto LABEL_38;
                }
                v9 = IdentifyIncomingCallerIntentHandler;
              }
            }
          }
        }
      }
    }
  }
  id v19 = objc_alloc_init(v9);
  if (!v19)
  {
LABEL_38:
    v6 = 0;
    goto LABEL_3;
  }
  v20 = [IntentHandlerAndIdentifier alloc];
  v21 = [v4 identifier];
  v6 = [(IntentHandlerAndIdentifier *)v20 initWithHandler:v19 intentIdentifier:v21];

  if (v6) {
LABEL_2:
  }
    [(IntentRouter *)self updateRecentlyUsedHandlersWithHandler:v6];
LABEL_3:
  objc_super v7 = [(IntentHandlerAndIdentifier *)v6 handler];

  return v7;
}

- (void)transactionDidCompleteForIntentIdentifier:(id)a3
{
  id v4 = [(IntentRouter *)self existingHandlerForIntentIdentifier:a3];
  v3 = [v4 handler];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 endPlayback];
  }
}

- (id)existingHandlerForIntentIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    v14 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Intent does not have an identifier set. Creating new handler.", buf, 2u);
    }
    id v7 = 0;
    goto LABEL_20;
  }
  v5 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        os_signpost_id_t v11 = [v10 intentIdentifier];
        unsigned int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          v13 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            sub_10003161C();
          }

          id v7 = v10;
          goto LABEL_14;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  objc_sync_exit(v5);
  if (!v7)
  {
    v14 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000315A8();
    }
LABEL_20:
  }

  return v7;
}

- (void)updateRecentlyUsedHandlersWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [v4 intentIdentifier];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
    objc_sync_enter(v7);
    *(void *)buf = 0;
    int v23 = buf;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
    long long v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    long long v18 = sub_10000EC64;
    long long v19 = &unk_10004CF10;
    id v9 = v4;
    id v20 = v9;
    v21 = buf;
    [v8 enumerateObjectsUsingBlock:&v16];

    uint64_t v10 = *((void *)v23 + 3);
    if (v10)
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        os_signpost_id_t v11 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
        [v11 removeObjectAtIndex:*((void *)v23 + 3)];
      }
      unsigned int v12 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
      [v12 insertObject:v9 atIndex:0];

      v13 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
      id v14 = [v13 count];

      if ((unint64_t)v14 >= 6)
      {
        dispatch_time_t v15 = [(IntentRouter *)self recentIntentHandlersAndIdentifiers];
        [v15 removeLastObject];
      }
    }

    _Block_object_dispose(buf, 8);
    objc_sync_exit(v7);
  }
  else
  {
    id v7 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Attempting to update recently used intent handler cache for an intent with no intentIdentifier. Ignoring.", buf, 2u);
    }
  }
}

- (void)registerForProvider
{
  v3 = (TUConversationProviderManager *)objc_alloc_init((Class)TUConversationProviderManager);
  conversationProviderManager = self->_conversationProviderManager;
  self->_conversationProviderManager = v3;

  v5 = (OS_dispatch_group *)dispatch_group_create();
  group = self->_group;
  self->_group = v5;

  dispatch_group_enter((dispatch_group_t)self->_group);
  id v7 = IntentHandlerDefaultLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = IntentHandlerDefaultLog();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HangUpIntentHandlerRegisterForProvider", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v11 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registering for drop-in calls", buf, 2u);
  }

  unsigned int v12 = self->_conversationProviderManager;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000EE64;
  v13[3] = &unk_10004CF38;
  v13[4] = self;
  v13[5] = v8;
  [(TUConversationProviderManager *)v12 registerForCallbacksForProvider:@"com.apple.private.alloy.dropin.communication" completionHandler:v13];
}

- (NSMutableArray)recentIntentHandlersAndIdentifiers
{
  return self->_recentIntentHandlersAndIdentifiers;
}

- (void)setRecentIntentHandlersAndIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentIntentHandlersAndIdentifiers, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_conversationProviderManager, 0);
}

@end