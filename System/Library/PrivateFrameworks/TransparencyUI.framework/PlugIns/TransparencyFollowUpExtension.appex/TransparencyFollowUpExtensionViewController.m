@interface TransparencyFollowUpExtensionViewController
- (void)_openKBArticle:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
@end

@implementation TransparencyFollowUpExtensionViewController

- (void)_openKBArticle:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[NSURL URLWithString:v3];
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_1000082A0);
    }
    v5 = qword_10000CA38;
    if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Opening kbase %@", buf, 0xCu);
    }
    v6 = +[LSApplicationWorkspace defaultWorkspace];
    id v11 = 0;
    unsigned __int8 v7 = [v6 openURL:v4 withOptions:0 error:&v11];
    id v8 = v11;

    if ((v7 & 1) == 0)
    {
      if (qword_10000CA30 != -1) {
        dispatch_once(&qword_10000CA30, &stru_1000082C0);
      }
      v9 = qword_10000CA38;
      if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not open kbase url %@ error %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_100008280);
    }
    v10 = qword_10000CA38;
    if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "missing informational link", buf, 2u);
    }
  }
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  if (qword_10000CA30 != -1) {
    dispatch_once(&qword_10000CA30, &stru_1000082E0);
  }
  id v11 = qword_10000CA38;
  if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "processing Transparency follow up item %@, action %@", buf, 0x16u);
  }
  v12 = [v8 userInfo];
  v13 = [v12 objectForKeyedSubscript:@"type"];

  __int16 v14 = [v9 userInfo];
  id v15 = [v14 objectForKeyedSubscript:@"action"];

  v16 = [v8 userInfo];
  v17 = [v16 objectForKeyedSubscript:@"eventId"];

  if (!v13 || !v15)
  {
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_100008300);
    }
    v18 = qword_10000CA38;
    if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Follow up had no type or action. Skipping.", buf, 2u);
    }
  }
  unsigned int v19 = [v15 intValue];
  if (!v19)
  {
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_100008360);
    }
    v25 = qword_10000CA38;
    if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v13;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "viewing details for follow up type %@, event %@", buf, 0x16u);
    }
    if ([v13 intValue] == 3 || objc_msgSend(v13, "intValue") == 6)
    {
      v26 = [v9 userInfo];
      v27 = [v26 objectForKeyedSubscript:@"infoLink"];
      [(TransparencyFollowUpExtensionViewController *)self _openKBArticle:v27];

      goto LABEL_44;
    }
    v29 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"];
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_100008380);
    }
    v30 = qword_10000CA38;
    if (!os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_INFO))
    {
LABEL_43:
      v31 = +[LSApplicationWorkspace defaultWorkspace];
      [v31 openSensitiveURL:v29 withOptions:0];

      goto LABEL_44;
    }
    *(_DWORD *)buf = 138412290;
    id v34 = v29;
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "transferring to Contact Key Verification pane %@", buf, 0xCu);
    goto LABEL_43;
  }
  if (v19 == 2)
  {
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_1000083A0);
    }
    v28 = qword_10000CA38;
    if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v13;
      __int16 v35 = 2112;
      id v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "viewing settings for follow up type %@, event %@", buf, 0x16u);
    }
    v29 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"];
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_1000083C0);
    }
    v30 = qword_10000CA38;
    if (!os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_INFO)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 138412290;
    id v34 = v29;
    goto LABEL_42;
  }
  if (v19 != 1)
  {
LABEL_44:
    id v23 = 0;
    goto LABEL_45;
  }
  if (qword_10000CA30 != -1) {
    dispatch_once(&qword_10000CA30, &stru_100008320);
  }
  v20 = qword_10000CA38;
  if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "dismissing follow up type %@, event %@", buf, 0x16u);
  }
  v21 = +[TransparencyFollowup instance];
  id v32 = 0;
  unsigned __int8 v22 = [v21 clearFollowup:v8 error:&v32];
  id v23 = v32;

  if ((v22 & 1) == 0)
  {
    if (qword_10000CA30 != -1) {
      dispatch_once(&qword_10000CA30, &stru_100008340);
    }
    v24 = qword_10000CA38;
    if (os_log_type_enabled((os_log_t)qword_10000CA38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v13;
      __int16 v35 = 2112;
      id v36 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to dismiss follow up type %@: %@", buf, 0x16u);
    }
  }
LABEL_45:
  v10[2](v10, 1);
}

@end