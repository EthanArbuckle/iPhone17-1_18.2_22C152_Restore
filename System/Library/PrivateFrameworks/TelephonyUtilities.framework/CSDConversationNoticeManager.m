@interface CSDConversationNoticeManager
- (CSDConversationNoticeDelegate)delegate;
- (CSDConversationNoticeManager)initWithDelegate:(id)a3 queue:(id)a4;
- (FBSOpenApplicationService)service;
- (OS_dispatch_queue)queue;
- (id)fetchUpcomingNoticeFromQueue;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4;
- (void)removeConversationNoticeWithUUID:(id)a3;
@end

@implementation CSDConversationNoticeManager

- (CSDConversationNoticeManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CSDConversationNoticeManager;
  v8 = [(CSDConversationNoticeManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_delegate, v6);
    v10 = (FBSOpenApplicationService *)objc_alloc_init((Class)FBSOpenApplicationService);
    service = v9->_service;
    v9->_service = v10;
  }
  return v9;
}

- (void)conversation:(id)a3 receivedActivitySessionEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDConversationNoticeManager *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 session];
  v10 = [v9 activity];
  unsigned int v11 = [v10 isSystemActivity];

  if (v11)
  {
    v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = [v7 sessionUUID];
      *(_DWORD *)buf = 138412290;
      v64 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring event for session %@, since the activity is a system group activity", buf, 0xCu);
    }
  }
  else
  {
    id v14 = objc_alloc((Class)TUConversationNotice);
    v15 = +[NSUUID UUID];
    v12 = [v14 initWithUUID:v15];

    v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v7 description];
      *(_DWORD *)buf = 138412290;
      v64 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received TUConversationActivityEvent: %@", buf, 0xCu);
    }
    v18 = [v7 sessionUUID];
    [v12 setSessionUUID:v18];

    id v19 = [v7 type];
    switch((unint64_t)v19)
    {
      case 1uLL:
        v20 = v12;
        uint64_t v21 = 1;
        goto LABEL_26;
      case 2uLL:
        v20 = v12;
        uint64_t v21 = 2;
        goto LABEL_26;
      case 3uLL:
        v20 = v12;
        uint64_t v21 = 3;
        goto LABEL_26;
      case 4uLL:
        v22 = v12;
        uint64_t v23 = 4;
        goto LABEL_24;
      case 5uLL:
        v20 = v12;
        uint64_t v21 = 5;
        goto LABEL_26;
      case 6uLL:
        v20 = v12;
        uint64_t v21 = 6;
        goto LABEL_26;
      case 7uLL:
        v22 = v12;
        uint64_t v23 = 7;
        goto LABEL_24;
      case 8uLL:
        v20 = v12;
        uint64_t v21 = 8;
        goto LABEL_26;
      case 9uLL:
        goto LABEL_27;
      case 0xAuLL:
        [v12 setSessionEventType:10];
        v24 = [v7 item];
        [v12 setItem:v24];

        id v25 = [v7 queueItemType];
        if (v25 == (id)2)
        {
          v26 = v12;
          uint64_t v27 = 2;
        }
        else if (v25 == (id)1)
        {
          v26 = v12;
          uint64_t v27 = 1;
        }
        else
        {
          if (v25) {
            goto LABEL_27;
          }
          v26 = v12;
          uint64_t v27 = 0;
        }
        [v26 setQueueItemType:v27];
LABEL_27:
        v58 = v6;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v29 = objc_msgSend(v6, "tuActivitySessions", self);
        id v30 = [v29 countByEnumeratingWithState:&v59 objects:v67 count:16];
        if (!v30) {
          goto LABEL_37;
        }
        id v31 = v30;
        uint64_t v32 = *(void *)v60;
        break;
      case 0xBuLL:
        v20 = v12;
        uint64_t v21 = 11;
        goto LABEL_26;
      case 0xCuLL:
        v20 = v12;
        uint64_t v21 = 12;
        goto LABEL_26;
      case 0xDuLL:
        v22 = v12;
        uint64_t v23 = 13;
        goto LABEL_24;
      case 0xEuLL:
        v20 = v12;
        uint64_t v21 = 14;
LABEL_26:
        [v20 setSessionEventType:v21];
        goto LABEL_27;
      default:
        if (v19 == (id)99)
        {
          v22 = v12;
          uint64_t v23 = 99;
LABEL_24:
          [v22 setSessionEventType:v23];
          v28 = [v7 item];
          [v12 setItem:v28];
        }
        goto LABEL_27;
    }
    while (2)
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v60 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v35 = [v34 UUID];
        v36 = [v12 sessionUUID];
        unsigned int v37 = [v35 isEqual:v36];

        if (v37)
        {
          v38 = [v34 activity];
          v39 = [v38 bundleIdentifier];
          [v12 setBundleIdentifier:v39];

          goto LABEL_37;
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v31) {
        continue;
      }
      break;
    }
LABEL_37:

    v40 = [v12 bundleIdentifier];
    id v41 = [v40 length];

    if (!v41)
    {
      v42 = [v7 session];
      v43 = [v42 activity];
      v44 = [v43 bundleIdentifier];
      [v12 setBundleIdentifier:v44];
    }
    v45 = [v7 session];
    [v12 setSession:v45];

    v46 = [v7 url];
    [v12 setActionURL:v46];

    v47 = [v12 bundleIdentifier];

    if (v47)
    {
      v48 = [v7 originator];
      id v6 = v58;
      if ([v48 isLightweight])
      {
        v49 = sub_100008DCC();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v12;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Notice %@ is from a lightweightMember, trying to translate", buf, 0xCu);
        }

        v50 = [v58 tuConversation];
        v51 = [v48 handle];
        v52 = [v50 remoteParticipantForLightweightParticipantHandle:v51];

        if (v52)
        {
          v53 = v52;

          v48 = v53;
        }
      }
      v55 = sub_100008DCC();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v64 = v12;
        __int16 v65 = 2112;
        id v66 = v7;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Posting notice: %@ for event: %@", buf, 0x16u);
      }

      v56 = [v57 delegate];
      [v56 noticeManager:v57 conversation:v58 participant:v48 addedNotice:v12];
    }
    else
    {
      v48 = sub_100008DCC();
      id v6 = v58;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_1003AE708((uint64_t)v12, v48);
      }
    }
  }
}

- (id)fetchUpcomingNoticeFromQueue
{
  v2 = sub_100008DCC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching notices is a no-op", v4, 2u);
  }

  return 0;
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDConversationNoticeManager *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activating conversation notice with URL: %@ and bundleID %@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    v10 = [(CSDConversationNoticeManager *)self service];
    uint64_t v17 = FBSOpenApplicationOptionKeyPayloadURL;
    id v18 = v6;
    unsigned int v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v12 = +[FBSOpenApplicationOptions optionsWithDictionary:v11];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10017276C;
    v14[3] = &unk_100508D08;
    v15 = v7;
    id v16 = v6;
    [v10 openApplication:v15 withOptions:v12 completion:v14];

    objc_super v13 = v15;
  }
  else
  {
    objc_super v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Error activating conversation notice. Could not find action url %@ or bundleID %@", buf, 0x16u);
    }
  }
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing conversation notice is a no-op", v4, 2u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDConversationNoticeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDConversationNoticeDelegate *)WeakRetained;
}

- (FBSOpenApplicationService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end