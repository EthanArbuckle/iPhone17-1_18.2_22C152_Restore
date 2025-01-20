@interface TransparencyFollowup
+ (BOOL)isFollowupEnabled;
+ (id)instance;
- (BOOL)clearAllFollowups:(id *)a3;
- (BOOL)clearFollowup:(id)a3 error:(id *)a4;
- (BOOL)clearFollowups:(id)a3 error:(id *)a4;
- (BOOL)clearFollowupsByType:(id)a3 type:(unint64_t)a4 error:(id *)a5;
- (BOOL)postFollowup:(id)a3 type:(unint64_t)a4 eventId:(id)a5 errorCode:(int64_t)a6 optInState:(id)a7 infoLink:(id)a8 additionalInfo:(id)a9 error:(id *)a10;
- (FLFollowUpController)controller;
- (NSMutableDictionary)followUpItems;
- (TransparencyAnalytics)logger;
- (TransparencyFollowup)initWithAnalytics:(id)a3;
- (id)_localizedKTStringForKey:(id)a3;
- (id)createDisableTransparencyFollowup:(id)a3 infoLink:(id)a4;
- (id)createOptOutFollowup:(id)a3 infoLink:(id)a4;
- (id)createSMTFollowup:(id)a3 infoLink:(id)a4;
- (id)createSelfFollowup:(id)a3 infoLink:(id)a4;
- (id)createTLTResetFollowup:(id)a3 infoLink:(id)a4;
- (id)createTreeRollFollowup:(id)a3 infoLink:(id)a4;
- (id)detailsAction:(unint64_t)a3 eventId:(id)a4 infoLink:(id)a5;
- (id)getPendingFollowups;
- (id)ignoreAction;
- (id)itemForType:(unint64_t)a3 eventId:(id)a4 infoLink:(id)a5;
- (id)ktFollowupStatus;
- (id)notification:(id)a3 message:(id)a4 activateAction:(id)a5 clearAction:(id)a6;
- (id)settingsAction:(unint64_t)a3 eventId:(id)a4;
- (void)setController:(id)a3;
- (void)setFollowUpItems:(id)a3;
- (void)setLogger:(id)a3;
- (void)startFollowupStatusSampler;
@end

@implementation TransparencyFollowup

+ (BOOL)isFollowupEnabled
{
  if (qword_10000CA50 != -1) {
    dispatch_once(&qword_10000CA50, &stru_1000083E0);
  }
  return byte_10000CA48;
}

+ (id)instance
{
  if (qword_10000CA68 != -1) {
    dispatch_once(&qword_10000CA68, &stru_100008420);
  }
  v2 = (void *)qword_10000CA40;
  return v2;
}

- (TransparencyFollowup)initWithAnalytics:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TransparencyFollowup;
  v5 = [(TransparencyFollowup *)&v31 init];
  if (v5)
  {
    id v6 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.transparency.followupclient"];
    [(TransparencyFollowup *)v5 setController:v6];

    v7 = +[NSMutableDictionary dictionary];
    [(TransparencyFollowup *)v5 setFollowUpItems:v7];

    if (!v4)
    {
      id v4 = +[TransparencyAnalytics logger];
    }
    id v25 = v4;
    [(TransparencyFollowup *)v5 setLogger:v4];
    v8 = [(TransparencyFollowup *)v5 controller];
    id v30 = 0;
    v9 = [v8 pendingFollowUpItems:&v30];
    id v10 = v30;

    if (!v9 && v10)
    {
      if (qword_10000CA58 != -1) {
        dispatch_once(&qword_10000CA58, &stru_100008440);
      }
      v11 = qword_10000CA60;
      if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed to get pending follow up items: %@", buf, 0xCu);
      }
    }
    v24 = v10;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "userInfo", v24);
          v19 = [v18 objectForKeyedSubscript:@"eventId"];

          if (v19)
          {
            id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:v19];
            if (v20)
            {
              [(TransparencyFollowup *)v5 followUpItems];
              v22 = v21 = v5;
              [v22 setObject:v17 forKey:v20];

              v5 = v21;
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v14);
    }

    [(TransparencyFollowup *)v5 startFollowupStatusSampler];
    id v4 = v25;
  }

  return v5;
}

- (id)detailsAction:(unint64_t)a3 eventId:(id)a4 infoLink:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"];
  v11 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_VIEW_DETAILS_LABEL"];
  id v12 = +[FLFollowUpAction actionWithLabel:v11 url:v10];

  id v13 = +[NSMutableDictionary dictionary];
  id v14 = [v9 UUIDString];

  [v13 setObject:v14 forKeyedSubscript:@"eventId"];
  uint64_t v15 = +[NSNumber numberWithUnsignedInteger:a3];
  [v13 setObject:v15 forKeyedSubscript:@"type"];

  [v13 setObject:&off_100008B78 forKeyedSubscript:@"action"];
  if (v8) {
    [v13 setObject:v8 forKeyedSubscript:@"infoLink"];
  }
  [v12 setUserInfo:v13];

  return v12;
}

- (id)settingsAction:(unint64_t)a3 eventId:(id)a4
{
  id v6 = a4;
  v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"];
  id v8 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_VIEW_SETTINGS_LABEL"];
  id v9 = +[FLFollowUpAction actionWithLabel:v8 url:v7];

  id v10 = +[NSMutableDictionary dictionary];
  v11 = [v6 UUIDString];

  [v10 setObject:v11 forKeyedSubscript:@"eventId"];
  id v12 = +[NSNumber numberWithUnsignedInteger:a3];
  [v10 setObject:v12 forKeyedSubscript:@"type"];

  [v10 setObject:&off_100008B90 forKeyedSubscript:@"action"];
  [v9 setUserInfo:v10];

  return v9;
}

- (id)ignoreAction
{
  v2 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_CLEAR_WARNING_LABEL"];
  v3 = +[FLFollowUpAction actionWithLabel:v2 url:0];

  [v3 setUserInfo:&off_100008BF8];
  return v3;
}

- (id)notification:(id)a3 message:(id)a4 activateAction:(id)a5 clearAction:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)FLFollowUpNotification);
  [v13 setTitle:v12];

  [v13 setActivateAction:v10];
  [v13 setClearAction:v9];

  [v13 setFirstNotificationDelay:0.0];
  [v13 setFrequency:0.0];
  [v13 setInformativeText:v11];

  return v13;
}

- (id)createSelfFollowup:(id)a3 infoLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)FLFollowUpItem);
  [v8 setUniqueIdentifier:@"com.apple.transparency.ValidateSelfFailed"];
  [v8 setGroupIdentifier:FLGroupIdentifierAccount];
  id v9 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_ERROR_TITLE"];
  [v8 setTitle:v9];

  id v10 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_SELF_ERROR"];
  [v8 setInformativeText:v10];

  [v8 setDisplayStyle:0];
  [v8 setExtensionIdentifier:@"com.apple.TransparencyUI.FollowUpExtension"];
  id v11 = [(TransparencyFollowup *)self detailsAction:0 eventId:v7 infoLink:v6];

  id v12 = [(TransparencyFollowup *)self ignoreAction];
  v18[0] = v11;
  v18[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  [v8 setActions:v13];

  id v14 = [v8 title];
  uint64_t v15 = [v8 informativeText];
  v16 = [(TransparencyFollowup *)self notification:v14 message:v15 activateAction:v11 clearAction:v12];

  [v8 setNotification:v16];
  return v8;
}

- (id)createSMTFollowup:(id)a3 infoLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)FLFollowUpItem);
  [v8 setUniqueIdentifier:@"com.apple.transparency.AuditFailure"];
  [v8 setGroupIdentifier:FLGroupIdentifierAccount];
  id v9 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_ERROR_TITLE"];
  [v8 setTitle:v9];

  id v10 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_DATA_ERROR"];
  [v8 setInformativeText:v10];

  [v8 setDisplayStyle:0];
  [v8 setExtensionIdentifier:@"com.apple.TransparencyUI.FollowUpExtension"];
  id v11 = [(TransparencyFollowup *)self detailsAction:1 eventId:v7 infoLink:v6];

  id v12 = [(TransparencyFollowup *)self ignoreAction];
  v18[0] = v11;
  v18[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  [v8 setActions:v13];

  id v14 = [v8 title];
  uint64_t v15 = [v8 informativeText];
  v16 = [(TransparencyFollowup *)self notification:v14 message:v15 activateAction:v11 clearAction:v12];

  [v8 setNotification:v16];
  return v8;
}

- (id)createTreeRollFollowup:(id)a3 infoLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)FLFollowUpItem);
  [v8 setUniqueIdentifier:@"com.apple.transparency.TreeRollDetected"];
  [v8 setGroupIdentifier:FLGroupIdentifierAccount];
  id v9 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_RESET_TITLE"];
  [v8 setTitle:v9];

  id v10 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_RESET"];
  [v8 setInformativeText:v10];

  [v8 setDisplayStyle:0];
  [v8 setExtensionIdentifier:@"com.apple.TransparencyUI.FollowUpExtension"];
  id v11 = [(TransparencyFollowup *)self detailsAction:3 eventId:v7 infoLink:v6];

  id v12 = [(TransparencyFollowup *)self settingsAction:3 eventId:v7];

  v18[0] = v11;
  v18[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  [v8 setActions:v13];

  id v14 = [v8 title];
  uint64_t v15 = [v8 informativeText];
  v16 = [(TransparencyFollowup *)self notification:v14 message:v15 activateAction:v11 clearAction:v12];

  [v8 setNotification:v16];
  return v8;
}

- (id)createTLTResetFollowup:(id)a3 infoLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)FLFollowUpItem);
  [v8 setUniqueIdentifier:@"com.apple.transparency.TLTResetDetected"];
  [v8 setGroupIdentifier:FLGroupIdentifierAccount];
  id v9 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_RESET_TITLE"];
  [v8 setTitle:v9];

  id v10 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_RESET"];
  [v8 setInformativeText:v10];

  [v8 setDisplayStyle:0];
  [v8 setExtensionIdentifier:@"com.apple.TransparencyUI.FollowUpExtension"];
  id v11 = [(TransparencyFollowup *)self detailsAction:5 eventId:v7 infoLink:v6];

  id v12 = [(TransparencyFollowup *)self ignoreAction];
  v18[0] = v11;
  v18[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  [v8 setActions:v13];

  id v14 = [v8 title];
  uint64_t v15 = [v8 informativeText];
  v16 = [(TransparencyFollowup *)self notification:v14 message:v15 activateAction:v11 clearAction:v12];

  [v8 setNotification:v16];
  return v8;
}

- (id)createDisableTransparencyFollowup:(id)a3 infoLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)FLFollowUpItem);
  [v8 setUniqueIdentifier:@"com.apple.transparency.TreeRollDetected"];
  [v8 setUserInfo:&off_100008C20];
  [v8 setGroupIdentifier:FLGroupIdentifierAccount];
  id v9 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_IDS_DISABLE_TITLE"];
  [v8 setTitle:v9];

  id v10 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_IDS_DISABLE"];
  [v8 setInformativeText:v10];

  [v8 setDisplayStyle:0];
  [v8 setExtensionIdentifier:@"com.apple.TransparencyUI.FollowUpExtension"];
  id v11 = [(TransparencyFollowup *)self detailsAction:6 eventId:v7 infoLink:v6];

  id v12 = [(TransparencyFollowup *)self settingsAction:6 eventId:v7];

  v18[0] = v11;
  v18[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  [v8 setActions:v13];

  id v14 = [v8 title];
  uint64_t v15 = [v8 informativeText];
  v16 = [(TransparencyFollowup *)self notification:v14 message:v15 activateAction:v11 clearAction:v12];

  [v8 setNotification:v16];
  return v8;
}

- (id)createOptOutFollowup:(id)a3 infoLink:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)FLFollowUpItem);
  [v8 setUniqueIdentifier:@"com.apple.transparency.OptOut"];
  [v8 setGroupIdentifier:FLGroupIdentifierAccount];
  id v9 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_DISABLED_TITLE"];
  [v8 setTitle:v9];

  id v10 = [(TransparencyFollowup *)self _localizedKTStringForKey:@"KT_DISABLED"];
  [v8 setInformativeText:v10];

  [v8 setDisplayStyle:0];
  [v8 setExtensionIdentifier:@"com.apple.TransparencyUI.FollowUpExtension"];
  id v11 = [(TransparencyFollowup *)self detailsAction:4 eventId:v7 infoLink:v6];

  id v12 = [(TransparencyFollowup *)self ignoreAction];
  v18[0] = v11;
  v18[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:2];
  [v8 setActions:v13];

  id v14 = [v8 title];
  uint64_t v15 = [v8 informativeText];
  v16 = [(TransparencyFollowup *)self notification:v14 message:v15 activateAction:v11 clearAction:v12];

  [v8 setNotification:v16];
  return v8;
}

- (id)itemForType:(unint64_t)a3 eventId:(id)a4 infoLink:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  switch(a3)
  {
    case 0uLL:
      id v10 = [(TransparencyFollowup *)self createSelfFollowup:v8 infoLink:v9];
      goto LABEL_9;
    case 1uLL:
      id v10 = [(TransparencyFollowup *)self createSMTFollowup:v8 infoLink:v9];
      goto LABEL_9;
    case 2uLL:
      id v10 = [(TransparencyFollowup *)self createSTHFollowup:v8 infoLink:v9];
      goto LABEL_9;
    case 3uLL:
      id v10 = [(TransparencyFollowup *)self createTreeRollFollowup:v8 infoLink:v9];
      goto LABEL_9;
    case 4uLL:
      id v10 = [(TransparencyFollowup *)self createOptOutFollowup:v8 infoLink:v9];
      goto LABEL_9;
    case 5uLL:
      id v10 = [(TransparencyFollowup *)self createTLTResetFollowup:v8 infoLink:v9];
      goto LABEL_9;
    case 6uLL:
      id v10 = [(TransparencyFollowup *)self createDisableTransparencyFollowup:v8 infoLink:v9];
LABEL_9:
      self = v10;
      break;
    default:
      break;
  }

  return self;
}

- (BOOL)postFollowup:(id)a3 type:(unint64_t)a4 eventId:(id)a5 errorCode:(int64_t)a6 optInState:(id)a7 infoLink:(id)a8 additionalInfo:(id)a9 error:(id *)a10
{
  id v41 = a3;
  id v15 = a5;
  id v16 = a7;
  id v42 = a8;
  id v17 = a9;
  if (qword_10000CA58 != -1) {
    dispatch_once(&qword_10000CA58, &stru_100008460);
  }
  v18 = qword_10000CA60;
  if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v47 = a4;
    __int16 v48 = 2112;
    unint64_t v49 = (unint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received a postFollowup call of type: %lu eventId: %@", buf, 0x16u);
  }
  if (v16)
  {
    if ([v16 state] && objc_msgSend(v16, "state") != (id)2)
    {
      if (v15)
      {
        v39 = [(TransparencyFollowup *)self itemForType:a4 eventId:v15 infoLink:v42];
        v40 = +[NSMutableDictionary dictionary];
        [v40 setObject:v41 forKeyedSubscript:@"application"];
        v21 = +[NSNumber numberWithUnsignedInteger:a4];
        [v40 setObject:v21 forKeyedSubscript:@"type"];

        v22 = [v15 UUIDString];
        [v40 setObject:v22 forKeyedSubscript:@"eventId"];

        [v40 addEntriesFromDictionary:v17];
        [v39 setUserInfo:v40];
        v23 = [(TransparencyFollowup *)self followUpItems];
        objc_sync_enter(v23);
        v24 = [(TransparencyFollowup *)self followUpItems];
        id v25 = [v24 objectForKeyedSubscript:v15];
        BOOL v26 = v25 == 0;

        if (v26)
        {
          long long v28 = [(TransparencyFollowup *)self followUpItems];
          [v28 setObject:v39 forKey:v15];
        }
        else
        {
          if (qword_10000CA58 != -1) {
            dispatch_once(&qword_10000CA58, &stru_1000084E0);
          }
          long long v27 = qword_10000CA60;
          if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            unint64_t v47 = (unint64_t)v15;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "skipping follow up due to existing follow up for eventId %{public}@", buf, 0xCu);
          }
          long long v28 = v39;
          v39 = 0;
        }

        objc_sync_exit(v23);
        if (v39)
        {
          if (qword_10000CA58 != -1) {
            dispatch_once(&qword_10000CA58, &stru_100008500);
          }
          v33 = qword_10000CA60;
          if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            unint64_t v47 = (unint64_t)v15;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "posting follow up for eventId %{public}@", buf, 0xCu);
          }
          id v34 = [(TransparencyFollowup *)self controller];
          id v43 = 0;
          unsigned __int8 v35 = [v34 postFollowUpItem:v39 error:&v43];
          id v36 = v43;

          if ((v35 & 1) == 0)
          {
            if (qword_10000CA58 != -1) {
              dispatch_once(&qword_10000CA58, &stru_100008520);
            }
            v37 = qword_10000CA60;
            if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              unint64_t v47 = a4;
              __int16 v48 = 2112;
              unint64_t v49 = (unint64_t)v36;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "failed to post follow up type %lu: %@", buf, 0x16u);
            }
          }
        }
      }
      else
      {
        if (qword_10000CA58 != -1) {
          dispatch_once(&qword_10000CA58, &stru_1000084C0);
        }
        long long v29 = qword_10000CA60;
        if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "no eventId passed, not much we can do", buf, 2u);
        }
        id v30 = [(TransparencyFollowup *)self logger];
        CFStringRef v44 = @"type";
        objc_super v31 = +[NSNumber numberWithUnsignedInteger:a4];
        v45 = v31;
        v32 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        [v30 logHardFailureForEventNamed:@"PostFollowUpMissEvent" withAttributes:v32];
      }
    }
    else
    {
      if (qword_10000CA58 != -1) {
        dispatch_once(&qword_10000CA58, &stru_1000084A0);
      }
      v19 = qword_10000CA60;
      if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v47 = (unint64_t)v16;
        __int16 v48 = 2048;
        unint64_t v49 = a4;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "opt-in state %@ follow up type %lu", buf, 0x16u);
      }
    }
  }
  else
  {
    if (qword_10000CA58 != -1) {
      dispatch_once(&qword_10000CA58, &stru_100008480);
    }
    id v20 = qword_10000CA60;
    if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to post follow up due to missing optIn state", buf, 2u);
    }
    if (a10)
    {
      *a10 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-178 description:@"failed to post follow up due to missing optIn state"];
    }
  }

  return v16 != 0;
}

- (BOOL)clearAllFollowups:(id *)a3
{
  if (qword_10000CA58 != -1) {
    dispatch_once(&qword_10000CA58, &stru_100008540);
  }
  v5 = qword_10000CA60;
  if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "clearing all Transparency followups", (uint8_t *)&v13, 2u);
  }
  id v6 = [(TransparencyFollowup *)self controller];
  unsigned int v7 = [v6 clearPendingFollowUpItems:a3];

  if (v7)
  {
    id v8 = [(TransparencyFollowup *)self followUpItems];
    objc_sync_enter(v8);
    id v9 = [(TransparencyFollowup *)self followUpItems];
    [v9 removeAllObjects];

    objc_sync_exit(v8);
  }
  else
  {
    if (qword_10000CA58 != -1) {
      dispatch_once(&qword_10000CA58, &stru_100008560);
    }
    id v10 = qword_10000CA60;
    if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v11 = *a3;
      }
      else {
        id v11 = 0;
      }
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to clear Transparency followups: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  return v7;
}

- (BOOL)clearFollowupsByType:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  id v29 = a3;
  v33 = self;
  id obj = [(TransparencyFollowup *)self followUpItems];
  objc_sync_enter(obj);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = [(TransparencyFollowup *)self followUpItems];
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v7)
  {
    uint64_t v32 = *(void *)v35;
    char v27 = 1;
    id v31 = v6;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v31);
        }
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v8);
        id v10 = [(TransparencyFollowup *)v33 followUpItems];
        id v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          id v12 = [v11 userInfo];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            id v14 = [v11 userInfo];
            id v15 = [v14 objectForKeyedSubscript:@"application"];
            id v16 = [v14 objectForKeyedSubscript:@"type"];
            id v17 = [v16 unsignedIntegerValue];

            if (v17 == (id)a4 && [v15 isEqualToString:v29])
            {
              v18 = [(TransparencyFollowup *)v33 controller];
              v19 = [v11 uniqueIdentifier];
              id v42 = v19;
              id v20 = +[NSArray arrayWithObjects:&v42 count:1];
              unsigned int v21 = [v18 clearPendingFollowUpItemsWithUniqueIdentifiers:v20 error:a5];

              if (v21)
              {
                v22 = [(TransparencyFollowup *)v33 followUpItems];
                [v22 removeObjectForKey:v9];
              }
              else
              {
                if (qword_10000CA58 != -1) {
                  dispatch_once(&qword_10000CA58, &stru_100008580);
                }
                v23 = qword_10000CA60;
                if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
                {
                  v24 = a5;
                  if (a5) {
                    v24 = *a5;
                  }
                  *(_DWORD *)buf = 138412546;
                  uint64_t v39 = v9;
                  __int16 v40 = 2112;
                  id v41 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to clear tree reset CFU for event id %@ with error: %@", buf, 0x16u);
                }
                char v27 = 0;
              }
            }
          }
        }

        id v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      id v6 = v31;
      id v7 = [v31 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v7);
  }
  else
  {
    char v27 = 1;
  }

  objc_sync_exit(obj);
  return v27 & 1;
}

- (BOOL)clearFollowup:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(TransparencyFollowup *)self controller];
  id v8 = [v6 uniqueIdentifier];
  v18 = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:&v18 count:1];
  unsigned int v10 = [v7 clearPendingFollowUpItemsWithUniqueIdentifiers:v9 error:a4];

  if (v10)
  {
    id v11 = objc_alloc((Class)NSUUID);
    id v12 = [v6 userInfo];
    BOOL v13 = [v12 objectForKeyedSubscript:@"eventId"];
    id v14 = [v11 initWithUUIDString:v13];

    if (v14)
    {
      id v15 = [(TransparencyFollowup *)self followUpItems];
      objc_sync_enter(v15);
      id v16 = [(TransparencyFollowup *)self followUpItems];
      [v16 removeObjectForKey:v14];

      objc_sync_exit(v15);
    }
  }
  return v10;
}

- (id)getPendingFollowups
{
  v3 = [(TransparencyFollowup *)self followUpItems];
  objc_sync_enter(v3);
  id v4 = [(TransparencyFollowup *)self followUpItems];
  v5 = [v4 allKeys];

  objc_sync_exit(v3);
  return v5;
}

- (BOOL)clearFollowups:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    id v21 = v5;
    if ([v5 count])
    {
      id obj = [(TransparencyFollowup *)self followUpItems];
      objc_sync_enter(obj);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v23 = v21;
      id v6 = [v23 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v26;
        char v22 = 1;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v26 != v7) {
              objc_enumerationMutation(v23);
            }
            uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v8);
            unsigned int v10 = [(TransparencyFollowup *)self followUpItems];
            id v11 = [v10 objectForKeyedSubscript:v9];

            if (v11)
            {
              id v12 = [(TransparencyFollowup *)self controller];
              BOOL v13 = [v11 uniqueIdentifier];
              v33 = v13;
              id v14 = +[NSArray arrayWithObjects:&v33 count:1];
              unsigned int v15 = [v12 clearPendingFollowUpItemsWithUniqueIdentifiers:v14 error:a4];

              if (v15)
              {
                id v16 = [(TransparencyFollowup *)self followUpItems];
                [v16 removeObjectForKey:v9];
              }
              else
              {
                if (qword_10000CA58 != -1) {
                  dispatch_once(&qword_10000CA58, &stru_1000085A0);
                }
                id v17 = qword_10000CA60;
                if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
                {
                  v18 = a4;
                  if (a4) {
                    v18 = *a4;
                  }
                  *(_DWORD *)buf = 138412546;
                  uint64_t v30 = v9;
                  __int16 v31 = 2112;
                  uint64_t v32 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to clear followup for event id %@ with error: %@", buf, 0x16u);
                }
                char v22 = 0;
              }
            }

            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [v23 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v6);
      }
      else
      {
        char v22 = 1;
      }

      objc_sync_exit(obj);
    }
    else
    {
      char v22 = 1;
    }
    id v5 = v21;
  }
  else
  {
    char v22 = 1;
  }

  return v22 & 1;
}

- (id)_localizedKTStringForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/Transparency.framework"];
  id v5 = v4;
  id v6 = &TransparencyFollowUpExtensionViewController__metaData;
  uint64_t v7 = &TransparencyFollowUpExtensionViewController__metaData;
  if (v4)
  {
    id v8 = [v4 localizations];
    if (v8)
    {
      uint64_t v9 = (void *)CFPreferencesCopyValue(@"AppleLanguages", kCFPreferencesAnyApplication, @"mobile", kCFPreferencesAnyHost);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v10 = +[NSBundle preferredLocalizationsFromArray:v8 forPreferences:v9];
        if ([v10 count])
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v11 = v10;
          id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v12)
          {
            id v13 = v12;
            long long v27 = v8;
            uint64_t v14 = *(void *)v29;
            while (2)
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                CFStringRef v16 = *(const __CFString **)(*((void *)&v28 + 1) + 8 * i);
                uint64_t v17 = [v5 localizedStringForKey:v3 value:0 table:@"Localizable-NARWHAL" localization:v16];
                if (v17)
                {
                  v18 = (__CFString *)v17;
                  id v6 = &TransparencyFollowUpExtensionViewController__metaData;
                  if (qword_10000CA58 != -1) {
                    dispatch_once(&qword_10000CA58, &stru_1000085E0);
                  }
                  id v8 = v27;
                  uint64_t v7 = &TransparencyFollowUpExtensionViewController__metaData;
                  char v22 = qword_10000CA60;
                  if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    CFStringRef v33 = v16;
                    __int16 v34 = 2114;
                    long long v35 = v18;
                    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "followup localized string (%{public}@) = %{public}@", buf, 0x16u);
                  }
                  goto LABEL_46;
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v13) {
                continue;
              }
              break;
            }
            v18 = 0;
            id v8 = v27;
            uint64_t v7 = &TransparencyFollowUpExtensionViewController__metaData;
            id v6 = &TransparencyFollowUpExtensionViewController__metaData;
          }
          else
          {
            v18 = 0;
          }
LABEL_46:

          if (v18) {
            goto LABEL_47;
          }
          goto LABEL_37;
        }
        if (qword_10000CA58 != -1) {
          dispatch_once(&qword_10000CA58, &stru_100008600);
        }
        id v23 = qword_10000CA60;
        if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to get preferred localizations", buf, 2u);
        }
      }
      else
      {
        if (qword_10000CA58 != -1) {
          dispatch_once(&qword_10000CA58, &stru_100008620);
        }
        id v21 = qword_10000CA60;
        if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "failed to get languages for the current user", buf, 2u);
        }
      }
    }
    else
    {
      if (qword_10000CA58 != -1) {
        dispatch_once(&qword_10000CA58, &stru_100008640);
      }
      id v20 = qword_10000CA60;
      if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v33 = @"/System/Library/PrivateFrameworks/Transparency.framework";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "failed to get localizations from the localization bundle (%{public}@)", buf, 0xCu);
      }
    }
LABEL_37:
    if (v6[36].weak_ivar_lyt != (void *)-1) {
      dispatch_once(&qword_10000CA58, &stru_100008660);
    }
    base_props = v7[36].base_props;
    if (os_log_type_enabled(base_props, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, base_props, OS_LOG_TYPE_ERROR, "failed to get localized string for the current user localization", buf, 2u);
    }
    v18 = [v5 localizedStringForKey:v3 value:v3 table:@"Localizable-NARWHAL"];
    if (v6[36].weak_ivar_lyt != (void *)-1) {
      dispatch_once(&qword_10000CA58, &stru_100008680);
    }
    long long v25 = v7[36].base_props;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "followup localized string = %{public}@", buf, 0xCu);
    }
LABEL_47:

    goto LABEL_48;
  }
  if (qword_10000CA58 != -1) {
    dispatch_once(&qword_10000CA58, &stru_1000085C0);
  }
  v19 = qword_10000CA60;
  if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v33 = @"/System/Library/PrivateFrameworks/Transparency.framework";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to get the localization bundle (%{public}@)", buf, 0xCu);
  }
  v18 = (__CFString *)v3;
LABEL_48:

  return v18;
}

- (id)ktFollowupStatus
{
  v2 = +[NSMutableDictionary dictionary];
  if (+[TransparencyFollowup isFollowupEnabled])
  {
    id obj = [(TransparencyFollowup *)self followUpItems];
    objc_sync_enter(obj);
    id v3 = [(TransparencyFollowup *)self followUpItems];
    id v4 = [v3 allKeys];
    id v5 = [v4 sortedArrayUsingSelector:"compare:"];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v5;
    id v6 = [v26 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v6)
    {
      uint64_t v27 = *(void *)v31;
      do
      {
        id v29 = v6;
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v26);
          }
          uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v9 = [(TransparencyFollowup *)self followUpItems];
          unsigned int v10 = [v9 objectForKey:v8];

          if (v10)
          {
            id v11 = [v10 notification];
            id v12 = [v11 creationDate];

            if (v12)
            {
              id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[SFAnalytics fuzzyDaysSinceDate:v12]);
            }
            else
            {
              id v13 = 0;
            }
            uint64_t v14 = [v10 uniqueIdentifier];
            unsigned int v15 = +[NSString stringWithFormat:@"ktcfu-%@-days", v14];

            CFStringRef v16 = [v10 uniqueIdentifier];
            uint64_t v17 = +[NSString stringWithFormat:@"ktcfu-%@-count", v16];

            v18 = [v2 objectForKeyedSubscript:v15];
            v19 = v18;
            if (!v18 || ((unint64_t)[v18 compare:v13] & 0x8000000000000000) != 0) {
              [v2 setObject:v13 forKeyedSubscript:v15];
            }
            id v20 = [v2 objectForKeyedSubscript:v17];
            id v21 = (char *)[v20 integerValue];

            char v22 = +[NSNumber numberWithInteger:v21 + 1];
            [v2 setObject:v22 forKeyedSubscript:v17];
          }
        }
        id v6 = [v26 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v6);
    }

    objc_sync_exit(obj);
    if (qword_10000CA58 != -1) {
      dispatch_once(&qword_10000CA58, &stru_1000086A0);
    }
    id v23 = qword_10000CA60;
    if (os_log_type_enabled((os_log_t)qword_10000CA60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v35 = v2;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Analytics for KT CFUs are %@", buf, 0xCu);
    }
  }
  return v2;
}

- (void)startFollowupStatusSampler
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(TransparencyFollowup *)self logger];
  double v4 = SFAnalyticsSamplerIntervalOncePerReport;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000054D8;
  v5[3] = &unk_1000086C8;
  objc_copyWeak(&v6, &location);
  [v3 addMultiSamplerForName:@"transparencyFollowupStatus" withTimeInterval:v5 block:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (FLFollowUpController)controller
{
  return (FLFollowUpController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setController:(id)a3
{
}

- (NSMutableDictionary)followUpItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFollowUpItems:(id)a3
{
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_followUpItems, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end