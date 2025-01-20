@interface MRSystemHealthComponentHandler
- (MRSystemHealthComponentHandler)initWithComponentName:(id)a3;
- (OS_dispatch_queue)componentEventQueue;
- (void)postComponentStatus:(unint64_t)a3;
- (void)setComponentEventQueue:(id)a3;
@end

@implementation MRSystemHealthComponentHandler

- (MRSystemHealthComponentHandler)initWithComponentName:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MRSystemHealthComponentHandler;
  v5 = [(MRBaseComponentHandler *)&v39 init];
  v6 = v5;
  if (v5)
  {
    [(MRBaseComponentHandler *)v5 setComponentName:v4];
    v7 = [(MRBaseComponentHandler *)v6 componentName];
    v8 = +[NSString stringWithFormat:@"SUcaseFor%@", v7];
    [(MRBaseComponentHandler *)v6 setComponentSUCaseKey:v8];

    v9 = +[NSUserDefaults standardUserDefaults];
    v10 = [(MRBaseComponentHandler *)v6 componentSUCaseKey];
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v6, "setIsSUCaseForComponent:", [v9 BOOLForKey:v10]);

    [(MRBaseComponentHandler *)v6 setDisplayNotification:0];
    [(MRBaseComponentHandler *)v6 setDisplayModalPopup:[(MRBaseComponentHandler *)v6 isSUCaseForComponent] ^ 1];
    v11 = [(MRBaseComponentHandler *)v6 componentName];
    v12 = +[NSString stringWithFormat:@"prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/%@", v11];
    v13 = +[NSURL URLWithString:v12];
    [(MRBaseComponentHandler *)v6 setLinkedSensitiveURL:v13];

    v14 = [(MRBaseComponentHandler *)v6 componentName];
    v15 = +[NSString stringWithFormat:@"com.apple.mobilerepair.%@Repair", v14];
    [(MRBaseComponentHandler *)v6 setComponentFollowupClientID:v15];

    v16 = [(MRBaseComponentHandler *)v6 componentFollowupClientID];
    v17 = [v16 stringByAppendingString:@"FINISH_REPAIR"];
    [(MRBaseComponentHandler *)v6 setFinishRepairKey:v17];

    v18 = [(MRBaseComponentHandler *)v6 componentName];
    v19 = +[NSString stringWithFormat:@"unlockCheckCountFor%@", v18];
    [(MRBaseComponentHandler *)v6 setComponentUnLockCheckCountKey:v19];

    v20 = [(MRBaseComponentHandler *)v6 componentName];
    v21 = +[NSString stringWithFormat:@"retriggerCheckCountFor%@", v20];
    [(MRBaseComponentHandler *)v6 setComponentRetriggerCountKey:v21];

    v22 = [(MRBaseComponentHandler *)v6 componentName];
    v23 = +[NSString stringWithFormat:@"lastCheckTimeFor%@", v22];
    [(MRBaseComponentHandler *)v6 setComponentLastCheckTimeKey:v23];

    v24 = [(MRBaseComponentHandler *)v6 componentName];
    v25 = +[NSString stringWithFormat:@"hasDisplayedFollowupForSHC%@", v24];
    [(MRBaseComponentHandler *)v6 setComponentHasDisplayedFollowUpKey:v25];

    v26 = [(MRBaseComponentHandler *)v6 componentName];
    v27 = +[NSString stringWithFormat:@"com.apple.mobilerepair.%@unlockchecker", v26];
    [(MRBaseComponentHandler *)v6 setComponentUnlockCheckerActivityName:v27];

    [(MRBaseComponentHandler *)v6 setComponentId:0];
    [(MRBaseComponentHandler *)v6 setNotifyServer:0];
    v28 = [(MRBaseComponentHandler *)v6 componentName];
    v29 = +[NSString stringWithFormat:@"firstUIDisplayedTimeFor%@", v28];
    [(MRBaseComponentHandler *)v6 setComponentFirstUIDisplayedTimeKey:v29];

    v30 = [(MRBaseComponentHandler *)v6 componentName];
    v31 = +[NSString stringWithFormat:@"lastKnownIDFor%@", v30];
    [(MRBaseComponentHandler *)v6 setLastKnownComponentIdentifierKey:v31];

    v32 = [(MRBaseComponentHandler *)v6 componentName];
    id v33 = +[CRFDRBaseDeviceHandler copySealingManifestDataInstanceForComponent:v32];
    [(MRBaseComponentHandler *)v6 setLastKnownComponentIdentifierValue:v33];

    [(MRBaseComponentHandler *)v6 setUnlockCheckActivityRequired:0];
    id v34 = [(MRBaseComponentHandler *)v6 componentName];
    dispatch_queue_t v35 = dispatch_queue_create((const char *)[v34 UTF8String], 0);
    [(MRSystemHealthComponentHandler *)v6 setComponentEventQueue:v35];

    v36 = [(MRBaseComponentHandler *)v6 componentName];
    v37 = [v36 stringByAppendingString:@"Failed"];
    [(MRBaseComponentHandler *)v6 setComponentStatusKey:v37];
  }
  return v6;
}

- (void)postComponentStatus:(unint64_t)a3
{
  id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilerepaird.systemhealth"];
  v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(MRBaseComponentHandler *)self componentName];
    v8 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 138412802;
    v19 = v7;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "postComponentStatus name:%@ status:%llu connection:%@", buf, 0x20u);
  }
  v9 = [(MRBaseComponentHandler *)self componentAuthHandler];
  id v10 = [v9 copyComponentStatus];

  v11 = handleForCategory();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 != (id)-3)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Processing componentStatus", buf, 2u);
    }

    if (a3 == 1)
    {
      v13 = [(MRBaseComponentHandler *)self componentStatusKey];
      v14 = v5;
      uint64_t v15 = 0;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_14:
        [v5 synchronize];
        v16 = [(MRSystemHealthComponentHandler *)self componentEventQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D71C;
        block[3] = &unk_100018810;
        block[4] = self;
        dispatch_async(v16, block);

        goto LABEL_15;
      }
      v13 = [(MRBaseComponentHandler *)self componentStatusKey];
      v14 = v5;
      uint64_t v15 = 1;
    }
    [v14 setBool:v15 forKey:v13];

    goto LABEL_14;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring componentStatus for pending repair case", buf, 2u);
  }

LABEL_15:
}

- (OS_dispatch_queue)componentEventQueue
{
  return self->_componentEventQueue;
}

- (void)setComponentEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end