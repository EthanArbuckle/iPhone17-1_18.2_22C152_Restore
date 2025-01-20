@interface STMessageReactorCoreComponent
+ (BOOL)_shouldSendLocalDeviceStateGivenTargetableFamilyMembers:(id)a3;
+ (id)_userIDFromMessageContent:(id)a3;
+ (id)buildCheckinResponseMessageEnvelopeForUser:(id)a3 targetableFamilyMembers:(id)a4 localDeviceStateChange:(id)a5 settingsChanges:(id)a6 downtimeChanges:(id)a7 communicationLimitsChanges:(id)a8 alwaysAllowedChanges:(id)a9 restrictionsChanges:(id)a10 managedUserChanges:(id)a11;
+ (id)configurationChangeFromMessageContent:(id)a3;
+ (id)deviceStateChangeFromMessageContent:(id)a3;
+ (id)reactorDirectiveForMessageContentType:(int64_t)a3 messageContent:(id)a4 targetableFamilyMembers:(id)a5 communicationConfigurationByUserID:(id)a6 screenTimeCapabilities:(id)a7;
+ (void)_addConfigurationChanges:(id)a3 toMessageContentTypes:(id)a4 messageContents:(id)a5;
@end

@implementation STMessageReactorCoreComponent

+ (id)deviceStateChangeFromMessageContent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 deviceStateChange];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)configurationChangeFromMessageContent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 configurationChange];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)reactorDirectiveForMessageContentType:(int64_t)a3 messageContent:(id)a4 targetableFamilyMembers:(id)a5 communicationConfigurationByUserID:(id)a6 screenTimeCapabilities:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ((unint64_t)(a3 - 1) > 4) {
    v15 = @"Unknown";
  }
  else {
    v15 = off_1002FCC48[a3 - 1];
  }
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = +[STLog familyMessaging];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v54 = v15;
    __int16 v55 = 2114;
    id v56 = v17;
    __int16 v57 = 2080;
    v58 = "+[STMessageReactorCoreComponent reactorDirectiveForMessageContentType:messageContent:targetableFamilyMembers:c"
          "ommunicationConfigurationByUserID:screenTimeCapabilities:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[v2]       <<< transport message content contained messageContentType: %{public}@, messageContentClass: %{public}@, %s", buf, 0x20u);
  }

  if ([v14 supportedInfrastructure] == (id)1)
  {
    v19 = +[STLog familyMessaging];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[v2]       <<< This device only supports V1 infrastructure. Dropping received message of messageContentType: %{public}@", buf, 0xCu);
    }
LABEL_34:

    v40 = [STReactorDirective alloc];
    uint64_t v41 = 0;
LABEL_35:
    v15 = [(STReactorDirective *)v40 initWithType:v41 data:0];
  }
  else
  {
    switch(a3)
    {
      case 0:
        v19 = +[STLog familyMessaging];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100261958();
        }
        goto LABEL_34;
      case 1:
        id v20 = +[STMessageReactorCoreComponent configurationChangeFromMessageContent:v11];
        v21 = +[STLog familyMessaging];
        v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543875;
            v54 = v15;
            __int16 v55 = 2113;
            id v56 = v20;
            __int16 v57 = 2082;
            v58 = "+[STMessageReactorCoreComponent reactorDirectiveForMessageContentType:messageContent:targetableFamilyM"
                  "embers:communicationConfigurationByUserID:screenTimeCapabilities:]";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[v2]       <<< messageContentType: %{public}@, configurationChange: %{private}@, %{public}s", buf, 0x20u);
          }

          v23 = [STReactorDirective alloc];
          uint64_t v24 = 4;
          goto LABEL_28;
        }
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        goto LABEL_41;
      case 2:
        id v20 = +[STMessageReactorCoreComponent deviceStateChangeFromMessageContent:v11];
        v25 = +[STLog familyMessaging];
        v22 = v25;
        if (v20)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543875;
            v54 = v15;
            __int16 v55 = 2113;
            id v56 = v20;
            __int16 v57 = 2082;
            v58 = "+[STMessageReactorCoreComponent reactorDirectiveForMessageContentType:messageContent:targetableFamilyM"
                  "embers:communicationConfigurationByUserID:screenTimeCapabilities:]";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[v2]       <<< messageContentType: %{public}@, deviceStateChange: %{private}@, %{public}s", buf, 0x20u);
          }

          v23 = [STReactorDirective alloc];
          uint64_t v24 = 6;
          goto LABEL_28;
        }
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        goto LABEL_41;
      case 3:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = +[STLog familyMessaging];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1002619C0();
          }
          goto LABEL_34;
        }
        id v26 = v11;
        v27 = [v26 messageContentTypes];
        v28 = +[STLog familyMessaging];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [v27 count];
          *(_DWORD *)buf = 138543618;
          v54 = v15;
          __int16 v55 = 2050;
          id v56 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[v2]       <<< messageContentType: %{public}@, underlyingContentType.count: %{public}lu", buf, 0x16u);
        }

        v30 = [v26 messageContents];
        +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v30 count]);
        v32 = v31 = v27;

        v33 = [v26 messageContents];

        v43 = _NSConcreteStackBlock;
        uint64_t v44 = 3221225472;
        v45 = sub_10004A3A0;
        v46 = &unk_1002FCC28;
        id v47 = v31;
        id v48 = v32;
        id v49 = v12;
        id v50 = v13;
        id v51 = v14;
        v52 = v15;
        id v34 = v32;
        id v20 = v31;
        [v33 enumerateObjectsUsingBlock:&v43];

        v35 = [STReactorDirective alloc];
        id v36 = objc_msgSend(v34, "copy", v43, v44, v45, v46);
        v15 = [(STReactorDirective *)v35 initWithType:1 data:v36];

LABEL_44:
        break;
      case 4:
        id v20 = +[STMessageReactorCoreComponent _userIDFromMessageContent:v11];
        v37 = +[STLog familyMessaging];
        v22 = v37;
        if (v20)
        {
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543619;
            v54 = v15;
            __int16 v55 = 2113;
            id v56 = v20;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[v2]       <<< messageContentType: %{public}@, userID: %{private}@", buf, 0x16u);
          }

          v23 = [STReactorDirective alloc];
          uint64_t v24 = 10;
LABEL_28:
          id v38 = v20;
        }
        else
        {
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
LABEL_41:
          }
            sub_1002619C0();
LABEL_42:

          v23 = [STReactorDirective alloc];
          uint64_t v24 = 0;
          id v38 = 0;
        }
        v15 = [(STReactorDirective *)v23 initWithType:v24 data:v38];
        goto LABEL_44;
      case 5:
        v39 = +[STLog familyMessaging];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v54 = v15;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "[v2]       <<< messageContentType: %{public}@ -- no data", buf, 0xCu);
        }

        v40 = [STReactorDirective alloc];
        uint64_t v41 = 17;
        goto LABEL_35;
      default:
        break;
    }
  }

  return v15;
}

+ (id)_userIDFromMessageContent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 userID];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)buildCheckinResponseMessageEnvelopeForUser:(id)a3 targetableFamilyMembers:(id)a4 localDeviceStateChange:(id)a5 settingsChanges:(id)a6 downtimeChanges:(id)a7 communicationLimitsChanges:(id)a8 alwaysAllowedChanges:(id)a9 restrictionsChanges:(id)a10 managedUserChanges:(id)a11
{
  id v42 = a3;
  id v16 = a5;
  id v17 = a6;
  id v41 = a7;
  id v40 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a4;
  v22 = objc_opt_new();
  v23 = objc_opt_new();
  LODWORD(a8) = +[STMessageReactorCoreComponent _shouldSendLocalDeviceStateGivenTargetableFamilyMembers:v21];

  if (!a8) {
    goto LABEL_4;
  }
  if (v16)
  {
    uint64_t v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[STDeviceStateChangeContent contentType]);
    [v22 addObject:v24];

    v25 = [[STDeviceStateChangeContent alloc] initWithDeviceStateChange:v16];
    [v23 addObject:v25];

LABEL_4:
    +[STMessageReactorCoreComponent _addConfigurationChanges:v17 toMessageContentTypes:v22 messageContents:v23];
    +[STMessageReactorCoreComponent _addConfigurationChanges:v41 toMessageContentTypes:v22 messageContents:v23];
    +[STMessageReactorCoreComponent _addConfigurationChanges:v40 toMessageContentTypes:v22 messageContents:v23];
    +[STMessageReactorCoreComponent _addConfigurationChanges:v18 toMessageContentTypes:v22 messageContents:v23];
    +[STMessageReactorCoreComponent _addConfigurationChanges:v19 toMessageContentTypes:v22 messageContents:v23];
    +[STMessageReactorCoreComponent _addConfigurationChanges:v20 toMessageContentTypes:v22 messageContents:v23];
    id v38 = [[STCompoundContent alloc] initWithMessageContentTypes:v22 messageContents:v23];
    v37 = objc_opt_new();
    id v39 = v17;
    id v26 = [[STMessageTransportMessage alloc] initWithIdentifier:v37 content:v38];
    id v27 = v18;
    id v28 = v16;
    id v29 = [STMessageTransportMessageAddress alloc];
    [v42 dsid];
    v31 = id v30 = v20;
    v32 = [(STMessageTransportMessageAddress *)v29 initWithUserDSID:v31];
    +[NSSet setWithObject:v32];
    id v34 = v33 = v19;

    id v16 = v28;
    id v18 = v27;

    id v20 = v30;
    v35 = [[STTransportEnvoyMessageEnvelope alloc] initWithMessage:v26 addresses:v34];

    id v19 = v33;
    id v17 = v39;

    goto LABEL_6;
  }
  v35 = 0;
LABEL_6:

  return v35;
}

+ (void)_addConfigurationChanges:(id)a3 toMessageContentTypes:(id)a4 messageContents:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v13);
        v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[STOrganizationControllerConfigurationChangeContent contentType]);
        [v8 addObject:v15];

        id v16 = [[STOrganizationControllerConfigurationChangeContent alloc] initWithConfigurationChange:v14];
        [v9 addObject:v16];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

+ (BOOL)_shouldSendLocalDeviceStateGivenTargetableFamilyMembers:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isSignedInMember", (void)v11)
          && ([v8 isParent] & 1) != 0)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

@end