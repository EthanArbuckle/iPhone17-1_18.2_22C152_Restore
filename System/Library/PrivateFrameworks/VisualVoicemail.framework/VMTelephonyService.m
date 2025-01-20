@interface VMTelephonyService
- (OS_dispatch_queue)queue;
- (VMTelephonyClient)telephonyClient;
- (VMTelephonyService)initWithTelephonyClient:(id)a3 telephonyClient:(id)a4;
- (void)dealloc;
- (void)excludeNotificationFromBackup:(id)a3;
- (void)executeHandlerForNotificationWithName:(id)a3 info:(id)a4;
- (void)saveNotification:(id)a3 info:(id)a4;
- (void)setQueue:(id)a3;
- (void)setTelephonyClient:(id)a3;
- (void)voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4;
@end

@implementation VMTelephonyService

- (VMTelephonyService)initWithTelephonyClient:(id)a3 telephonyClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VMTelephonyService;
  v8 = [(VMTelephonyService *)&v13 init];
  if (v8)
  {
    v9 = sub_10002F430();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 136315650;
      v15 = "";
      __int16 v16 = 2080;
      v17 = "";
      __int16 v18 = 2112;
      v19 = v10;
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ init", buf, 0x20u);
    }
    [(VMTelephonyService *)v8 setQueue:v6];
    [(VMTelephonyService *)v8 setTelephonyClient:v7];
    [v7 addDelegate:v8 queue:v6];
  }

  return v8;
}

- (void)dealloc
{
  v3 = sub_10002F430();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "";
    __int16 v9 = 2080;
    v10 = "";
    __int16 v11 = 2112;
    id v12 = (id)objc_opt_class();
    id v4 = v12;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I %s%s+++> %@ dealoc", buf, 0x20u);
  }
  v5 = [(VMTelephonyService *)self telephonyClient];
  [v5 removeDelegate:self];

  v6.receiver = self;
  v6.super_class = (Class)VMTelephonyService;
  [(VMTelephonyService *)&v6 dealloc];
}

- (void)voicemailInfoAvailableNotification:(id)a3 voicemailInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10002F430();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136316162;
    v10 = "";
    __int16 v11 = 2080;
    id v12 = "";
    __int16 v13 = 2112;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    id v8 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling voicemail info available notification delegate callback for subscription %@, voicemail info %@", (uint8_t *)&v9, 0x34u);
  }
}

- (void)excludeNotificationFromBackup:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  unsigned int v4 = [v3 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v12];
  id v5 = v12;
  id v6 = sub_10002F430();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      id v8 = [v3 path];
      *(_DWORD *)buf = 136315650;
      id v14 = "";
      __int16 v15 = 2080;
      id v16 = "";
      __int16 v17 = 2112;
      id v18 = v8;
      int v9 = "#W %s%sNotification file at %@ excluded from backup";
      v10 = v6;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else if (v7)
  {
    id v8 = [v3 path];
    *(_DWORD *)buf = 136315906;
    id v14 = "";
    __int16 v15 = 2080;
    id v16 = "";
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v5;
    int v9 = "#W %s%sError setting notification file at %@ to be excluded from backup with error %@";
    v10 = v6;
    uint32_t v11 = 42;
    goto LABEL_6;
  }
}

- (void)saveNotification:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10002F430();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v42 = "";
    __int16 v43 = 2080;
    v44 = "";
    __int16 v45 = 2112;
    v46 = v6;
    __int16 v47 = 2112;
    id v48 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%sSaving notification for subscription %@ with info %@", buf, 0x2Au);
  }

  int v9 = sub_10006DA70();
  v10 = +[NSFileManager defaultManager];
  uint32_t v11 = [v9 path];
  unsigned __int8 v12 = [v10 fileExistsAtPath:v11];

  if ((v12 & 1) == 0)
  {
    __int16 v13 = sub_10002F430();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 path];
      *(_DWORD *)buf = 136315650;
      v42 = "";
      __int16 v43 = 2080;
      v44 = "";
      __int16 v45 = 2112;
      v46 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sCreating notification directory %@", buf, 0x20u);
    }
    __int16 v15 = +[NSFileManager defaultManager];
    id v16 = [v9 path];
    id v40 = 0;
    unsigned __int8 v17 = [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v40];
    id v18 = v40;

    if ((v17 & 1) == 0)
    {
      __int16 v19 = sub_10002F430();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v9 path];
        *(_DWORD *)buf = 136315906;
        v42 = "";
        __int16 v43 = 2080;
        v44 = "";
        __int16 v45 = 2112;
        v46 = v20;
        __int16 v47 = 2112;
        id v48 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#W %s%sError while creating notification directory at path: %@ error: %@", buf, 0x2Au);
      }
    }
  }
  v21 = [v6 accountID];
  v22 = sub_10006DB24(v21);

  id v39 = 0;
  v23 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v39];
  v24 = v39;
  if (v24)
  {
    v25 = sub_10002F430();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "";
      __int16 v43 = 2080;
      v44 = "";
      __int16 v45 = 2112;
      v46 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#W %s%sError encoding data notification: %@", buf, 0x20u);
    }
  }
  else
  {
    v37 = self;
    v25 = objc_opt_new();
    v26 = objc_opt_class();
    v27 = [v6 accountID];
    v28 = [v26 hashedUUID:v27];
    uint64_t v29 = [v28 UUIDString];

    v36 = (void *)v29;
    [v25 setObject:v29 forKey:@"Account"];
    [v25 setObject:v23 forKey:@"Info"];
    v30 = sub_10002F430();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "";
      __int16 v43 = 2080;
      v44 = "";
      __int16 v45 = 2112;
      v46 = v25;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#I %s%s=== notificationsDictionary to save %@", buf, 0x20u);
    }

    v31 = [v22 path];
    id v38 = 0;
    unsigned __int8 v32 = [v25 writeToFile:v31 options:805306369 error:&v38];
    id v33 = v38;

    if ((v32 & 1) == 0)
    {
      v34 = sub_10002F430();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v22 path];
        *(_DWORD *)buf = 136315906;
        v42 = "";
        __int16 v43 = 2080;
        v44 = "";
        __int16 v45 = 2112;
        v46 = v35;
        __int16 v47 = 2112;
        id v48 = v33;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#W %s%sCould not save notification file at path %@ due to error %@", buf, 0x2Au);
      }
    }
    [(VMTelephonyService *)v37 excludeNotificationFromBackup:v22];
  }
}

- (void)executeHandlerForNotificationWithName:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10002F430();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    id v38 = "";
    __int16 v39 = 2080;
    id v40 = "";
    __int16 v41 = 2112;
    id v42 = (id)objc_opt_class();
    __int16 v43 = 2112;
    id v44 = v6;
    __int16 v45 = 2112;
    id v46 = v7;
    id v9 = v42;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is handling notification %@ with user info %@", buf, 0x34u);
  }
  unsigned int v10 = [v6 isEqualToString:kCTIndicatorsVoiceMailNotification];
  if (v7 && v10)
  {
    uint32_t v11 = +[CTVoicemailInfoType voicemailInfoTypeForDictionaryRepresentation:v7];
    if ([v11 isVoiceMailMWI])
    {
      unsigned __int8 v12 = sub_10002F430();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = objc_opt_class();
        *(_DWORD *)buf = 136315650;
        id v38 = "";
        __int16 v39 = 2080;
        id v40 = "";
        __int16 v41 = 2112;
        id v42 = v13;
        id v14 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%s%@ is ignoring MWI notification", buf, 0x20u);
      }
    }
    else
    {
      unsigned __int8 v12 = [v7 objectForKeyedSubscript:kCTIndicatorVoiceMailSubInstance];
      if (v12)
      {
        id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:v12];
        if (v15)
        {
          id v16 = v15;
          v30 = v12;
          v31 = v11;
          uint64_t v29 = self;
          unsigned __int8 v17 = [(VMTelephonyService *)self telephonyClient];
          id v18 = [v17 contexts];
          __int16 v19 = [v18 subscriptions];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v33;
            while (2)
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v33 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                v26 = [v25 uuid];
                unsigned int v27 = [v26 isEqual:v16];

                if (v27)
                {
                  v28 = sub_10002F430();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    id v38 = "";
                    __int16 v39 = 2080;
                    id v40 = "";
                    __int16 v41 = 2112;
                    id v42 = v25;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#I %s%sAdding notification for subscription %@", buf, 0x20u);
                  }

                  [(VMTelephonyService *)v29 saveNotification:v25 info:v7];
                  goto LABEL_22;
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
LABEL_22:

          unsigned __int8 v12 = v30;
          uint32_t v11 = v31;
        }
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end