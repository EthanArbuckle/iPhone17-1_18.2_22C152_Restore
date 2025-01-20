@interface MFBayAdoption
+ (OS_os_log)log;
+ (id)composeWindowSceneActivationConfigurationWithContext:(id)a3 presentationSource:(id)a4 requestingScene:(id)a5;
+ (id)openMessageInNewWindowActionWithMessage:(id)a3 messageList:(id)a4 preparation:(id)a5 completion:(id)a6;
+ (id)openMessageInNewWindowConfigurationWithMessageListItem:(id)a3 messageList:(id)a4;
+ (void)migrateDockedDrafts:(id)a3 completion:(id)a4;
+ (void)migrateQuickReplyDraft:(id)a3 completion:(id)a4;
+ (void)openComposeWithContext:(id)a3 presentationSource:(id)a4 requestingScene:(id)a5;
+ (void)requestShelfPresentationForSceneWithIdentifier:(id)a3;
@end

@implementation MFBayAdoption

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177BC4;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006999C8 != -1) {
    dispatch_once(&qword_1006999C8, block);
  }
  v2 = (void *)qword_1006999C0;

  return (OS_os_log *)v2;
}

+ (id)openMessageInNewWindowActionWithMessage:(id)a3 messageList:(id)a4 preparation:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100177DBC;
  v15[3] = &unk_10060AA88;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v9 = v19;
  id v10 = v17;
  id v11 = v16;
  id v12 = v18;
  v13 = +[UIWindowSceneActivationAction actionWithIdentifier:0 alternateAction:0 configurationProvider:v15];

  return v13;
}

+ (void)openComposeWithContext:(id)a3 presentationSource:(id)a4 requestingScene:(id)a5
{
  id v8 = a4;
  id v9 = [a1 composeWindowSceneActivationConfigurationWithContext:a3 presentationSource:v8 requestingScene:a5];
  char v10 = objc_opt_respondsToSelector();
  if ((v8 == 0) | v10 & 1)
  {
    id v11 = +[MFBayAdoption log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Open compose from presentation source: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v11 = +[MFBayAdoption log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10045C148((uint64_t)v8, v11);
    }
  }

  +[UIApplication sharedApplication];
  if (v10) {
    id v12 = {;
  }
    [v12 _requestSceneSessionActivationWithConfiguration:v9 errorHandler:&stru_10060AAA8];
  }
  else {
    id v12 = {;
  }
    v13 = [v9 userActivity];
    v14 = [v9 options];
    [v12 requestSceneSessionActivation:0 userActivity:v13 options:v14 errorHandler:&stru_10060AAC8];
  }
}

+ (id)composeWindowSceneActivationConfigurationWithContext:(id)a3 presentationSource:(id)a4 requestingScene:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)NSUserActivity);
  id v12 = [v11 initWithActivityType:MSMailActivityHandoffTypeComposeWithStreams];
  id v13 = objc_alloc((Class)NSMutableDictionary);
  uint64_t v27 = MSMailActivityHandoffTypeKey;
  uint64_t v28 = MSMailActivityHandoffTypeComposeSansStreams;
  v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v15 = [v13 initWithDictionary:v14];

  unint64_t v16 = (unint64_t)[v8 composeType];
  id v17 = [v8 autosaveIdentifier];
  if (v8)
  {
    id v18 = [v8 compositionValues];
    id v26 = 0;
    id v19 = +[NSKeyedArchiver archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v26];
    id v5 = v26;

    if (!v19)
    {
      v20 = +[MFBayAdoption log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10045C248((uint64_t)v5, v20);
      }
    }
    [v15 setObject:v19 forKeyedSubscript:MSMailActivityHandoffComposeKeyCompositionValues];
  }
  if ((v16 & 0xFFFFFFFFFFFFFFFELL) == 2 && v17) {
    [v15 setObject:v17 forKeyedSubscript:MSMailActivityHandoffComposeKeyAutosaveID];
  }
  [v12 setUserInfo:v15];
  v21 = v17;
  if (!v17)
  {
    id v5 = +[NSUUID UUID];
    v21 = [v5 UUIDString];
  }
  v22 = MSMailComposeWindowTargetContentIdentifierWithIdentifier();
  [v12 setTargetContentIdentifier:v22];

  if (!v17)
  {
  }
  id v23 = objc_alloc_init((Class)UIWindowSceneActivationRequestOptions);
  [v23 setRequestingScene:v10];
  [v23 setPreferredPresentationStyle:2];
  id v24 = [objc_alloc((Class)UIWindowSceneActivationConfiguration) initWithUserActivity:v12];
  [v9 mui_setAsTargetedSourceOnSceneConfiguration:v24];
  [v24 setOptions:v23];

  return v24;
}

+ (id)openMessageInNewWindowConfigurationWithMessageListItem:(id)a3 messageList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100178848;
  v22 = &unk_10060AAF0;
  id v7 = v5;
  id v23 = v7;
  id v8 = v6;
  id v24 = v8;
  id v9 = +[ConversationViewRestorationState stateWithBuilder:&v19];
  if (v9)
  {
    id v10 = objc_alloc((Class)NSUserActivity);
    uint64_t v11 = MSMailActivityHandoffTypeDisplayMessage;
    id v12 = [v10 initWithActivityType:MSMailActivityHandoffTypeDisplayMessage v19, v20, v21, v22, v23];
    v26[0] = v11;
    v25[0] = MSMailActivityHandoffTypeKey;
    v25[1] = MSMailActivityHandoffDisplayMessageKeyRestorationState;
    id v13 = [v9 dictionaryRepresentation];
    v26[1] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v12 setUserInfo:v14];

    id v15 = [objc_alloc((Class)UIWindowSceneActivationConfiguration) initWithUserActivity:v12];
  }
  else
  {
    id v12 = +[MFBayAdoption log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v16 = [v8 ef_publicDescription];
      id v17 = [v7 ef_publicDescription];
      sub_10045C2C0(v16, v17, buf, v12);
    }
    id v15 = 0;
  }

  return v15;
}

+ (void)requestShelfPresentationForSceneWithIdentifier:(id)a3
{
  id v5 = a3;
  v3 = NSClassFromString(@"SBSApplicationMultiwindowService");
  if (v3)
  {
    id v4 = objc_alloc_init(v3);
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      [v4 requestShelfPresentationForSceneWithIdentifier:v5];
      [v4 invalidate];
    }
  }
}

+ (void)migrateDockedDrafts:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v16 = v6;
  if ([v6 count])
  {
    id v8 = dispatch_group_create();
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v18 = SBSCreateOpenApplicationService();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v6;
    id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          dispatch_group_enter(v8);
          v14 = [v13 storedUserActivity];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100178CB0;
          v22[3] = &unk_100607890;
          id v23 = v9;
          id v24 = v13;
          v25 = v8;
          sub_100178CF0((uint64_t)a1, v14, v18, v22);
        }
        id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100178D94;
    block[3] = &unk_100608690;
    id v20 = v9;
    id v21 = v7;
    id v15 = v9;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

+ (void)migrateQuickReplyDraft:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SBSCreateOpenApplicationService();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100179830;
  v10[3] = &unk_100606650;
  id v9 = v7;
  id v11 = v9;
  sub_100178ED8((uint64_t)a1, v6, v8, 0, v10);
}

@end