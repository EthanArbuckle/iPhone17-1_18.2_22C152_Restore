@interface NANDTelemetry_PerAppDiskSpaceDaily
+ (BOOL)shouldRegisterActivity;
- (BOOL)_isAfterNotificationCoolDown;
- (id)_entityFailsCatSystemCheck:(id)a3;
- (id)_entityHasNegativeSize:(id)a3;
- (id)_getRawDictErrorStr:(id)a3;
- (id)_populatePerAppDiskSpaceDict;
- (void)_checkRawDictConsistency:(id)a3;
- (void)_sendToCoreAnalytics:(id)a3;
- (void)_tryNotifyUserRawDictErrorString:(id)a3;
- (void)_updateLastUserNotificationDate;
- (void)runActivity;
@end

@implementation NANDTelemetry_PerAppDiskSpaceDaily

- (id)_populatePerAppDiskSpaceDict
{
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100010044;
  v31 = sub_100010054;
  id v32 = 0;
  if (!objc_opt_class() || !objc_opt_class() || !objc_opt_class())
  {
    v12 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046C70(v12);
    }
    v3 = 0;
LABEL_17:
    v13 = 0;
    id v14 = 0;
    goto LABEL_18;
  }
  v3 = objc_opt_new();
  v4 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connecting to STMTelemetryController", buf, 2u);
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001005C;
  v26[3] = &unk_100090A60;
  v26[4] = &v27;
  v26[5] = &v33;
  [v3 getTelemetry:v26];
  uint64_t v5 = 1000;
  do
  {
    uint64_t v6 = v5;
    usleep(0xF4240u);
    if (*((unsigned char *)v34 + 24) && v28[5])
    {
      v16 = oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "app space dict generation done", buf, 2u);
      }
      int v11 = 0;
      uint64_t v10 = 1;
      goto LABEL_24;
    }
    v7 = [(NANDTelemetry_Base *)self activityMgr];
    unsigned int v8 = [v7 shouldDeferXpcActivity];

    uint64_t v5 = (v6 + 1000);
  }
  while (!v8);
  if (++dword_1000C88CC >= 4)
  {
    v9 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046CB4(v9);
    }
    uint64_t v10 = 0;
    int v11 = 1;
LABEL_24:
    int v17 = 1;
    goto LABEL_28;
  }
  v18 = [(NANDTelemetry_Base *)self activityMgr];
  [v18 forceDeferXpcActivity];

  v19 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v38 = dword_1000C88CC;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Asked to defer app space dict generation. %d times today so far.", buf, 8u);
  }
  uint64_t v10 = 0;
  int v17 = 0;
  int v11 = 1;
LABEL_28:
  [v3 stopService];
  v20 = oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Closing connection to StorageDataService", buf, 2u);
  }
  if (!v17) {
    goto LABEL_17;
  }
  usleep(0x186A0u);
  if (v11) {
    id v21 = objc_alloc_init((Class)NSMutableDictionary);
  }
  else {
    id v21 = (id)v28[5];
  }
  v22 = v21;
  v23 = +[NSNumber numberWithUnsignedInt:dword_1000C88CC];
  [v22 setObject:v23 forKeyedSubscript:@"numDefers"];

  v24 = +[NSNumber numberWithUnsignedInt:v6];
  [v22 setObject:v24 forKeyedSubscript:@"execMilliseconds"];

  v25 = +[NSNumber numberWithUnsignedInt:v10];
  [v22 setObject:v25 forKeyedSubscript:@"finished"];

  v13 = GetiCloudPlanSizeGB();
  if (v13) {
    [v22 setObject:v13 forKeyedSubscript:@"icloudPlanSize"];
  }
  dword_1000C88CC = 0;
  id v14 = v22;
LABEL_18:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v14;
}

- (id)_entityHasNegativeSize:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"total"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"sizes"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((unint64_t)[v4 longLongValue] & 0x8000000000000000) != 0)
  {
    id v15 = +[NSString stringWithFormat:@"Negative size in app space entity dictionary %@", v3];
    v18 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100046D38(v15, v18);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        id v8 = v7;
        v20 = v5;
        id v21 = v4;
        id v9 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = *(void *)v23;
        while (2)
        {
          v12 = 0;
          v13 = v9;
          id v14 = v10;
          do
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v6);
            }
            id v9 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v12);

            uint64_t v10 = [v6 objectForKeyedSubscript:v9];

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ((unint64_t)[v10 longLongValue] & 0x8000000000000000) != 0)
            {
              v16 = +[NSString stringWithFormat:@"Negative size in app space entity dictionary %@", v3];
              int v17 = (void *)oslog;
              if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
                sub_100046D38(v16, v17);
              }
              id v15 = v16;

              uint64_t v5 = v20;
              v4 = v21;
              goto LABEL_21;
            }
            v12 = (char *)v12 + 1;
            v13 = v9;
            id v14 = v10;
          }
          while (v8 != v12);
          id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v8) {
            continue;
          }
          break;
        }

        uint64_t v5 = v20;
        v4 = v21;
      }
    }
    id v15 = 0;
  }
LABEL_21:

  return v15;
}

- (id)_entityFailsCatSystemCheck:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"total"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"sizes"];
  id v6 = [v3 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v6 isEqualToString:@"iOS"]) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (char *)[v4 longLongValue];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v5 objectForKeyedSubscript:@"total"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v5 objectForKeyedSubscript:@"total"];
      id v7 = (char *)[v10 longLongValue];

LABEL_8:
      if ((unint64_t)(v7 - 0x640000001) <= 0xFFFFFFFAFFFFFFFELL) {
        goto LABEL_9;
      }
LABEL_11:
      uint64_t v11 = 0;
      goto LABEL_12;
    }
  }
LABEL_9:
  uint64_t v11 = +[NSString stringWithFormat:@"Unexpected system category size! Category info: %@", v3];
  v12 = (void *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
    sub_100046D38(v11, v12);
  }
LABEL_12:

  return v11;
}

- (id)_getRawDictErrorStr:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v4;
  id v27 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v27)
  {
    uint64_t v29 = v5;
    id v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v35;
    uint64_t v25 = *(void *)v35;
    id v26 = v6;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v28 = v10;
        id v8 = *(id *)(*((void *)&v34 + 1) + 8 * v10);

        v12 = [v6 objectForKeyedSubscript:v8];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v14 = [v6 objectForKeyedSubscript:v8];
          id v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v15)
          {
            id v16 = v15;
            id v17 = 0;
            uint64_t v18 = *(void *)v31;
            do
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                v20 = v17;
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v14);
                }
                id v17 = *(id *)(*((void *)&v30 + 1) + 8 * i);

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v21 = [(NANDTelemetry_PerAppDiskSpaceDaily *)self _entityHasNegativeSize:v17];

                  if (v21) {
                    [v29 addObject:v21];
                  }
                  if ([v8 isEqualToString:@"categories"])
                  {
                    id v7 = [(NANDTelemetry_PerAppDiskSpaceDaily *)self _entityFailsCatSystemCheck:v17];

                    if (v7) {
                      [v29 addObject:v7];
                    }
                  }
                  else
                  {
                    id v7 = v21;
                  }
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v16);

            uint64_t v9 = v25;
            id v6 = v26;
          }
        }
        uint64_t v10 = v28 + 1;
        uint64_t v11 = v8;
      }
      while ((id)(v28 + 1) != v27);
      id v27 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v27);

    id v5 = v29;
  }
  else
  {
    id v7 = 0;
  }

  id v22 = [v5 count];
  if (v22)
  {
    id v22 = [v5 componentsJoinedByString:@"\n"];
  }
  id v23 = v22;

  return v23;
}

- (void)_updateLastUserNotificationDate
{
  id v4 = [(NANDTelemetry_Base *)self stateMgr];
  v2 = +[NSDate now];
  id v3 = DateTimeToStr(v2);
  [v4 saveValue:v3 forKey:@"lastUserNotificationDate" doPersist:1];
}

- (BOOL)_isAfterNotificationCoolDown
{
  id v3 = [(NANDTelemetry_Base *)self stateMgr];
  id v4 = [v3 getValueForKey:@"lastUserNotificationDate"];
  id v5 = StringToDateTime(v4);

  if (v5)
  {
    id v6 = [v5 dateByAddingTimeInterval:604800.0];
    id v2 = +[NSDate now];
    BOOL v7 = [v6 compare:v2] == (id)-1;
  }
  else
  {
    BOOL v7 = 1;
  }
  id v8 = (id)oslog;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      uint64_t v9 = "Do";
    }
    else {
      uint64_t v9 = "Do not";
    }
    if (v5)
    {
      DateTimeToStr(v5);
      id v2 = objc_claimAutoreleasedReturnValue();
      uint64_t v10 = (const char *)[v2 UTF8String];
    }
    else
    {
      uint64_t v10 = "none";
    }
    int v12 = 136315394;
    v13 = v9;
    __int16 v14 = 2080;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s notify user for raw dict error. Previous notification time %s", (uint8_t *)&v12, 0x16u);
    if (v5) {
  }
    }
  return v7;
}

- (void)_tryNotifyUserRawDictErrorString:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_ui()
    && objc_opt_class()
    && [(NANDTelemetry_PerAppDiskSpaceDaily *)self _isAfterNotificationCoolDown])
  {
    id v5 = objc_alloc_init((Class)RadarDraft);
    [v5 setTitle:@"SpaceForce Telemetry Inconsistent Disk Space Result"];
    id v6 = +[NSString stringWithFormat:@"Inconsistent result is detect on your device during disk space usage telemetry collection. Inconsistencies:\n\n%@", v4];
    [v5 setProblemDescription:v6];

    id v7 = [objc_alloc((Class)RadarComponent) initWithName:@"Storage Management" version:@"iOS" identifier:819298];
    [v5 setComponent:v7];

    [v5 setReproducibility:5];
    [v5 setClassification:6];
    [v5 setDiagnosticExtensionIDs:&off_1000C1660];
    [v5 setAttachments:0];
    [v5 setAutoDiagnostics:0];
    [v5 setIsUserInitiated:0];
    id v8 = +[TapToRadarService shared];
    id v12 = 0;
    [v8 createDraft:v5 forProcessNamed:@"SpaceForceTelemetry" withDisplayReason:@"disk space usage calculation is inconsistent" error:&v12];
    id v9 = v12;

    uint64_t v10 = oslog;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100046DC8(v10, v9);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully created radar draft", buf, 2u);
      }
      [(NANDTelemetry_PerAppDiskSpaceDaily *)self _updateLastUserNotificationDate];
    }
  }
}

- (void)_checkRawDictConsistency:(id)a3
{
  id v8 = a3;
  id v4 = [v8 objectForKeyedSubscript:@"finished"];
  unsigned int v5 = [v4 unsignedIntValue];

  if (v5)
  {
    id v6 = [(NANDTelemetry_PerAppDiskSpaceDaily *)self _getRawDictErrorStr:v8];
    if (v6) {
      id v7 = &off_1000B0628;
    }
    else {
      id v7 = &off_1000B0610;
    }
    [v8 setObject:v7 forKeyedSubscript:@"inconsistent"];
  }
}

- (void)_sendToCoreAnalytics:(id)a3
{
  id v4 = a3;
  LogStorageUIDatatoCA(v4, 0);
}

- (void)runActivity
{
  id v3 = [(NANDTelemetry_PerAppDiskSpaceDaily *)self _populatePerAppDiskSpaceDict];
  if (v3)
  {
    [(NANDTelemetry_PerAppDiskSpaceDaily *)self _checkRawDictConsistency:v3];
    id v4 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = v4;
      id v6 = [v3 objectForKeyedSubscript:@"execMilliseconds"];
      v7[0] = 67109120;
      v7[1] = (int)[v6 intValue] / 1000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending app space info to CA. Extraction time %ds", (uint8_t *)v7, 8u);
    }
    [(NANDTelemetry_PerAppDiskSpaceDaily *)self _sendToCoreAnalytics:v3];
  }
}

+ (BOOL)shouldRegisterActivity
{
  return 0;
}

@end