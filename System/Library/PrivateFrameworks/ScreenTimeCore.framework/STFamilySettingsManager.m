@interface STFamilySettingsManager
+ (BOOL)_shouldPurgeBlueprintsBasedOnScreenTimeManagementStateTransition:(int64_t)a3;
+ (BOOL)_updateScreenTimeSettingsForAppAndWebsiteActivityStateTransition:(int64_t)a3 managementStateTransition:(int64_t)a4 withFamilySettings:(id)a5 inContext:(id)a6 error:(id *)a7;
+ (BOOL)_updateScreenTimeSettingsForTransition:(int64_t)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_childPresentedContactManagementNotificationForTransition:(int64_t)a3 childIsManaged:(BOOL)a4;
+ (id)_notificationForClearingChildContactManagementUserNotification;
+ (id)_notificationForClearingParentContactManagementUserNotificiationAboutChildWithName:(id)a3;
+ (id)_parentPresentedContactManagementNotificationForTransition:(int64_t)a3 childName:(id)a4;
+ (id)_processFamilySettings:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_screenTimeManagementNotificationForTransition:(int64_t)a3;
+ (int64_t)_appAndWebsiteActivityStateTransitionFromOldAppAndWebsiteActivityState:(id)a3 toNewAppAndWebsiteActivityState:(id)a4;
+ (int64_t)_contactManagementStateTransitionFromOldManagementState:(int64_t)a3 toNewContactManagementState:(int64_t)a4;
+ (int64_t)_screenTimeManagementStateTransitionFromOldManagementState:(BOOL)a3 toNewManagementState:(BOOL)a4;
+ (void)_postScreenTimeManagementEnabledNotification:(id)a3;
+ (void)_updateScreenTimeEnabledNotificationShownUserDefaultForTransition:(int64_t)a3;
- (NSDictionary)familyMemberByAppleID;
- (NSTimer)notificationDelayTimer;
- (STFamilySettingsManager)initWithCapabilities:(id)a3 persistenceController:(id)a4;
- (STPersistenceControllerProtocol)persistenceController;
- (STScreenTimeCapabilities)capabilities;
- (id)handleFamilySettings:(id)a3 inContext:(id)a4;
- (void)_handleApproveNotificationForManageContactsRequest:(id)a3;
- (void)_handleDontApproveNotificationForManageContactsRequest:(id)a3;
- (void)_performEffectsForProcessSettingsResult:(id)a3 localUserDSID:(id)a4 localUserIsParent:(BOOL)a5 context:(id)a6;
- (void)_postContactManagementNotification:(id)a3 notificationIsForParent:(BOOL)a4;
- (void)_updateContactManagementToState:(int64_t)a3;
- (void)handleFamilySettingsPayload:(id)a3 withCompletion:(id)a4;
- (void)prepareSettingsPayloadsWithCompletion:(id)a3;
- (void)registerFamilyMembers:(id)a3;
- (void)setFamilyMemberByAppleID:(id)a3;
- (void)setNotificationDelayTimer:(id)a3;
@end

@implementation STFamilySettingsManager

- (STFamilySettingsManager)initWithCapabilities:(id)a3 persistenceController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)STFamilySettingsManager;
  v9 = [(STFamilySettingsManager *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_capabilities, a3);
    objc_storeStrong((id *)&v10->_persistenceController, a4);
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v10 selector:"_handleApproveNotificationForManageContactsRequest:" name:STUserNotificationAskToManageContactsResponseReceivedApprove object:0];
    [v11 addObserver:v10 selector:"_handleDontApproveNotificationForManageContactsRequest:" name:STUserNotificationAskToManageContactsResponseReceivedDontApprove object:0];
  }
  return v10;
}

- (void)registerFamilyMembers:(id)a3
{
  id v4 = a3;
  v5 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registering family members", buf, 2u);
  }

  v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isMe", (void)v15) & 1) == 0)
        {
          objc_super v13 = [v12 appleID];

          if (v13)
          {
            v14 = [v12 appleID];
            [v6 setObject:v12 forKeyedSubscript:v14];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  [(STFamilySettingsManager *)self setFamilyMemberByAppleID:v6];
}

- (void)prepareSettingsPayloadsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[STFamilySettingsManager prepareSettingsPayloadsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: \nStarted", buf, 0xCu);
  }

  v6 = (void *)os_transaction_create();
  id v7 = [(STFamilySettingsManager *)self persistenceController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003A428;
  v10[3] = &unk_1002FC090;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  [v7 performBackgroundTaskAndWait:v10];
}

- (void)handleFamilySettingsPayload:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Handling settings payload: %@", buf, 0xCu);
  }

  id v9 = [v6 payloadType];
  if ([v9 isEqualToString:@"RMUnifiedTransportPayloadTypeFamilySettings"])
  {
    uint64_t v10 = [v6 payloadDictionary];
    id v11 = [v10 objectForKeyedSubscript:@"Settings"];

    if ([v11 count])
    {
      id v12 = (void *)os_transaction_create();
      objc_super v13 = [(STFamilySettingsManager *)self persistenceController];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10003AF08;
      v17[3] = &unk_1002FC748;
      id v18 = v12;
      id v19 = v6;
      v20 = self;
      id v21 = v11;
      id v22 = v7;
      id v14 = v12;
      [v13 performBackgroundTaskAndWait:v17];
    }
    else
    {
      long long v16 = +[STLog familySettingsManager];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Settings payload contained no settings, aborting.", buf, 2u);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else
  {
    long long v15 = +[STLog familySettingsManager];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10025FA88();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)handleFamilySettings:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v34 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling (%lu) settings dictionaries", buf, 0xCu);
  }

  id v30 = 0;
  id v9 = +[STCoreUser fetchLocalUserInContext:v7 error:&v30];
  id v10 = v30;
  if (v9)
  {
    id v29 = 0;
    id v11 = +[STFamilySettingsManager _processFamilySettings:v6 inContext:v7 error:&v29];
    id v12 = v29;
    if (!v11)
    {
      id v24 = +[STLog familyScreenTimeManager];
      v25 = v24;
      if (v12)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10025FC98();
        }

        uint64_t v26 = +[STResult failure:v12];
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Processed family settings: Out of date", buf, 2u);
        }

        uint64_t v26 = +[STResult success:&off_10030FC88];
      }
      v23 = (void *)v26;
      goto LABEL_26;
    }
    objc_super v13 = +[STLog familySettingsManager];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Processed family settings: Performing effects", buf, 2u);
    }

    id v14 = [v9 dsid];
    -[STFamilySettingsManager _performEffectsForProcessSettingsResult:localUserDSID:localUserIsParent:context:](self, "_performEffectsForProcessSettingsResult:localUserDSID:localUserIsParent:context:", v11, v14, [v9 isParent], v7);

    if ([v7 hasChanges])
    {
      id v28 = 0;
      unsigned __int8 v15 = [v7 save:&v28];
      id v16 = v28;
      if ((v15 & 1) == 0)
      {
        long long v17 = +[STLog familySettingsManager];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10025FD00();
        }

        uint64_t v18 = +[STResult failure:v16];
        goto LABEL_21;
      }
    }
    else
    {
      id v16 = 0;
    }
    uint64_t v18 = +[STResult success:&off_10030FC70];
LABEL_21:
    v23 = (void *)v18;

LABEL_26:
    goto LABEL_27;
  }
  id v19 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10025FC30();
  }

  id v20 = objc_alloc((Class)NSError);
  uint64_t v21 = STErrorDomain;
  NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
  id v32 = v10;
  id v22 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v12 = [v20 initWithDomain:v21 code:10 userInfo:v22];

  v23 = +[STResult failure:v12];
LABEL_27:

  return v23;
}

+ (id)_processFamilySettings:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v54 = a4;
  id v8 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing family settings", buf, 2u);
  }

  id v9 = [v7 count];
  id v10 = +[NSMutableDictionary dictionaryWithCapacity:v9];
  id v11 = +[NSMutableDictionary dictionaryWithCapacity:v9];
  id v12 = +[NSMutableDictionary dictionaryWithCapacity:v9];
  objc_super v13 = +[NSMutableDictionary dictionaryWithCapacity:v9];
  id v14 = +[NSMutableDictionary dictionaryWithCapacity:v9];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v7;
  id v50 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (!v50)
  {
    int v41 = 0;
    id v15 = 0;
    goto LABEL_36;
  }
  id v15 = 0;
  uint64_t v49 = *(void *)v57;
  v45 = a5;
  v52 = v11;
  v53 = v10;
  v47 = v14;
  v48 = v13;
  v51 = v12;
  while (2)
  {
    id v16 = 0;
    long long v17 = v15;
    do
    {
      if (*(void *)v57 != v49) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v16);
      id v55 = v17;
      id v19 = +[STFamilyOrganizationSettings fetchOrCreateWithDictionaryRepresentation:inContext:error:](STFamilyOrganizationSettings, "fetchOrCreateWithDictionaryRepresentation:inContext:error:", v18, v54, &v55, v45);
      id v15 = v55;

      if (!v19)
      {
        id v19 = +[STLog familySettingsManager];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10025FD68();
        }
        goto LABEL_35;
      }
      id v20 = [v19 isManaged];
      uint64_t v21 = [v19 isAppAndWebsiteActivityEnabled];
      id v22 = [v19 contactManagementState];
      if (([v19 updateWithDictionaryRepresentation:v18] & 1) == 0)
      {
        v42 = +[STLog familySettingsManager];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_10025FDD0(v42);
        }

LABEL_35:
        a5 = v45;
        id v11 = v52;
        id v10 = v53;
        id v12 = v51;

        int v41 = 0;
        goto LABEL_36;
      }
      v23 = [v18 objectForKeyedSubscript:@"user"];
      [v14 setObject:v19 forKeyedSubscript:v23];
      id v24 = [v19 isManaged];
      v25 = [v19 isAppAndWebsiteActivityEnabled];
      id v26 = [v19 contactManagementState];
      int64_t v27 = +[STFamilySettingsManager _screenTimeManagementStateTransitionFromOldManagementState:v20 toNewManagementState:v24];
      id v28 = +[NSNumber numberWithInteger:v27];
      [v53 setObject:v28 forKeyedSubscript:v23];

      id v29 = +[STLog familySettingsManager];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v30 = @"None";
        if (v27 == 1) {
          CFStringRef v30 = @"Became Managed";
        }
        *(_DWORD *)buf = 138543619;
        if (v27 == 2) {
          CFStringRef v30 = @"Request Unmanged";
        }
        CFStringRef v61 = v30;
        __int16 v62 = 2113;
        v63 = v23;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Computed ScreenTime Management State transition: %{public}@ for user: %{private}@", buf, 0x16u);
      }

      int64_t v31 = +[STFamilySettingsManager _appAndWebsiteActivityStateTransitionFromOldAppAndWebsiteActivityState:v21 toNewAppAndWebsiteActivityState:v25];
      id v32 = +[NSNumber numberWithInteger:v31];
      [v52 setObject:v32 forKeyedSubscript:v23];

      v33 = +[STLog familySettingsManager];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v34 = @"None";
        if (v31 == 1) {
          CFStringRef v34 = @"Enabled";
        }
        *(_DWORD *)buf = 138543619;
        if (v31 == 2) {
          CFStringRef v34 = @"Disabled";
        }
        CFStringRef v61 = v34;
        __int16 v62 = 2113;
        v63 = v23;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Computed App & Website Activity State transition: %{public}@ for user: %{private}@", buf, 0x16u);
      }

      int64_t v35 = +[STFamilySettingsManager _contactManagementStateTransitionFromOldManagementState:v22 toNewContactManagementState:v26];
      v36 = +[NSNumber numberWithInteger:v35];
      [v51 setObject:v36 forKeyedSubscript:v23];

      v37 = +[STLog familySettingsManager];
      objc_super v13 = v48;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v38 = @"None";
        if ((unint64_t)(v35 - 1) <= 4) {
          CFStringRef v38 = off_1002FC830[v35 - 1];
        }
        *(_DWORD *)buf = 138543619;
        CFStringRef v61 = v38;
        __int16 v62 = 2113;
        v63 = v23;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Computed Contact Management State transition: %{public}@ for user: %{private}@", buf, 0x16u);
      }

      v39 = [v19 user];
      v40 = [v39 givenName];
      [v48 setObject:v40 forKeyedSubscript:v23];

      id v16 = (char *)v16 + 1;
      long long v17 = v15;
      id v14 = v47;
    }
    while (v50 != v16);
    int v41 = 1;
    a5 = v45;
    id v11 = v52;
    id v10 = v53;
    id v12 = v51;
    id v50 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v50) {
      continue;
    }
    break;
  }
LABEL_36:

  if (a5) {
    *a5 = v15;
  }
  if (v41) {
    v43 = [[STProcessFamilySettingsResult alloc] initWithScreenTimeManagementStateTransitionsByDSID:v10 appAndWebsiteActivityStateTransitionsByDSID:v11 contactManagementStateTransitionsByDSID:v12 givenChildNamesByDSID:v13 updatedSettingsByUserDSID:v14];
  }
  else {
    v43 = 0;
  }

  return v43;
}

- (void)_performEffectsForProcessSettingsResult:(id)a3 localUserDSID:(id)a4 localUserIsParent:(BOOL)a5 context:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  objc_super v13 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Performing effects for processed settings", buf, 2u);
  }

  id v14 = [v12 screenTimeManagementStateTransitionsByDSID];
  id v15 = [v12 appAndWebsiteActivityStateTransitionsByDSID];
  id v16 = [v12 contactManagementStateTransitionsByDSID];
  long long v17 = [v12 givenChildNamesByDSID];
  uint64_t v18 = [v12 updatedSettingsByUserDSID];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003BDD4;
  v25[3] = &unk_1002FC770;
  id v26 = v10;
  id v27 = v14;
  id v28 = v11;
  id v29 = v15;
  BOOL v33 = a5;
  id v30 = v16;
  id v31 = v17;
  id v32 = self;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v11;
  id v23 = v14;
  id v24 = v10;
  [v18 enumerateKeysAndObjectsUsingBlock:v25];
}

+ (int64_t)_screenTimeManagementStateTransitionFromOldManagementState:(BOOL)a3 toNewManagementState:(BOOL)a4
{
  int64_t v4 = 1;
  if (a3 && !a4) {
    int64_t v4 = 2;
  }
  if (a3 != a4) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (BOOL)_updateScreenTimeSettingsForTransition:(int64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  char v8 = _os_feature_enabled_impl();
  BOOL v9 = 1;
  if (a3 && (v8 & 1) == 0)
  {
    id v17 = 0;
    id v10 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v7 error:&v17];
    id v11 = v17;
    BOOL v9 = v10 != 0;
    if (v10)
    {
      id v12 = +[STLog familySettingsManager];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v13 = @"NO";
        if (a3 == 1) {
          objc_super v13 = @"YES";
        }
        id v14 = v13;
        *(_DWORD *)buf = 138543362;
        id v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating ScreenTimeEnabled setting to: %{public}@", buf, 0xCu);
      }
      [v10 setScreenTimeEnabled:a3 == 1];
    }
    else if (a5)
    {
      id v15 = +[STLog familySettingsManager];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10025FE7C();
      }

      *a5 = v11;
    }
  }
  return v9;
}

+ (id)_screenTimeManagementNotificationForTransition:(int64_t)a3
{
  int64_t v4 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"None";
    if (a3 == 1) {
      CFStringRef v5 = @"Became Managed";
    }
    if (a3 == 2) {
      CFStringRef v5 = @"Request Unmanged";
    }
    int v10 = 138412290;
    CFStringRef v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Generating notification for Screen Time management state transition: %@", (uint8_t *)&v10, 0xCu);
  }

  if (a3 == 1)
  {
    id v6 = off_1002FE960;
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    id v6 = off_1002FE968;
LABEL_11:
    id v7 = objc_opt_new();
    id v8 = [objc_alloc((Class)NSNotification) initWithName:*v6 object:v7 userInfo:0];
    goto LABEL_13;
  }
  id v8 = 0;
  id v7 = 0;
LABEL_13:

  return v8;
}

+ (void)_postScreenTimeManagementEnabledNotification:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    int64_t v4 = +[STLog familyScreenTimeManager];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posting Screen Time Management enabled user notification", v6, 2u);
    }

    CFStringRef v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotification:v3];
  }
}

+ (void)_updateScreenTimeEnabledNotificationShownUserDefaultForTransition:(int64_t)a3
{
  int64_t v4 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"None";
    if (a3 == 1) {
      CFStringRef v5 = @"Became Managed";
    }
    if (a3 == 2) {
      CFStringRef v5 = @"Request Unmanged";
    }
    int v9 = 138412290;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating Screen Time Enabled 'hasShown' default for Screen Time management state transition: %@", (uint8_t *)&v9, 0xCu);
  }

  if (a3 == 2)
  {
    id v8 = +[STLog familySettingsManager];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing ScreenTimeEnabledNotificationShown default", (uint8_t *)&v9, 2u);
    }

    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 removeObjectForKey:@"ScreenTimeEnabledNotificationShown"];
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    id v6 = +[STLog familySettingsManager];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting ScreenTimeEnabledNotificationShown default to YES", (uint8_t *)&v9, 2u);
    }

    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setBool:1 forKey:@"ScreenTimeEnabledNotificationShown"];
  }
}

+ (BOOL)_shouldPurgeBlueprintsBasedOnScreenTimeManagementStateTransition:(int64_t)a3
{
  return a3 == 2;
}

+ (int64_t)_appAndWebsiteActivityStateTransitionFromOldAppAndWebsiteActivityState:(id)a3 toNewAppAndWebsiteActivityState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    unsigned int v8 = [v5 BOOLValue];
    if (v8 == [v7 BOOLValue])
    {
LABEL_3:
      int64_t v9 = 0;
      goto LABEL_8;
    }
  }
  else if (!v6)
  {
    goto LABEL_3;
  }
  if ([v7 BOOLValue]) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = 2;
  }
LABEL_8:

  return v9;
}

+ (BOOL)_updateScreenTimeSettingsForAppAndWebsiteActivityStateTransition:(int64_t)a3 managementStateTransition:(int64_t)a4 withFamilySettings:(id)a5 inContext:(id)a6 error:(id *)a7
{
  id v11 = a5;
  if (a3 || a4 == 1)
  {
    id v23 = 0;
    objc_super v13 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:a6 error:&v23];
    id v14 = v23;
    BOOL v12 = v13 != 0;
    if (v13)
    {
      if (a4 == 1)
      {
        id v15 = [v11 isAppAndWebsiteActivityEnabled];
        if ([v15 BOOLValue])
        {
          BOOL v16 = 1;
        }
        else
        {
          uint64_t v18 = [v11 isAppAndWebsiteActivityEnabled];
          BOOL v16 = v18 == 0;
        }
      }
      else
      {
        BOOL v16 = a3 == 1;
      }
      id v19 = +[STLog familySettingsManager];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = @"NO";
        if (v16) {
          id v20 = @"YES";
        }
        id v21 = v20;
        *(_DWORD *)buf = 138543362;
        v25 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating ScreenTimeEnabled setting to: %{public}@", buf, 0xCu);
      }
      [v13 setScreenTimeEnabled:v16];
    }
    else if (a7)
    {
      id v17 = +[STLog familySettingsManager];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10025FE7C();
      }

      *a7 = v14;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

+ (int64_t)_contactManagementStateTransitionFromOldManagementState:(int64_t)a3 toNewContactManagementState:(int64_t)a4
{
  if (a3 == 2)
  {
    if (a4) {
      return a4 == 1;
    }
    else {
      return 5;
    }
  }
  else if (a3 == 1)
  {
    if ((unint64_t)a4 >= 3) {
      return 0;
    }
    else {
      return qword_100284B68[a4];
    }
  }
  else
  {
    int64_t v4 = a4 == 1;
    if (a4 == 2) {
      int64_t v4 = 4;
    }
    if (a3) {
      return 0;
    }
    else {
      return v4;
    }
  }
}

+ (id)_parentPresentedContactManagementNotificationForTransition:(int64_t)a3 childName:(id)a4
{
  id v5 = a4;
  id v6 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4) {
      CFStringRef v7 = @"None";
    }
    else {
      CFStringRef v7 = off_1002FC830[a3 - 1];
    }
    int v13 = 138412290;
    CFStringRef v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Generating parent-presented Contact Management notification for transition: %@", (uint8_t *)&v13, 0xCu);
  }

  int64_t v8 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 4)
  {
    id v11 = 0;
    id v10 = 0;
  }
  else
  {
    int64_t v9 = off_1002FC808[v8];
    id v10 = [objc_alloc((Class)*off_1002FC7E0[v8]) initWithChildName:v5];
    id v11 = [objc_alloc((Class)NSNotification) initWithName:*v9 object:v10 userInfo:0];
  }

  return v11;
}

+ (id)_childPresentedContactManagementNotificationForTransition:(int64_t)a3 childIsManaged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4) {
      CFStringRef v7 = @"None";
    }
    else {
      CFStringRef v7 = off_1002FC830[a3 - 1];
    }
    int64_t v8 = @"NO";
    if (v4) {
      int64_t v8 = @"YES";
    }
    int64_t v9 = v8;
    int v16 = 138543618;
    CFStringRef v17 = v7;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Generating child-presented Contact Management notification for transition: %{public}@, childIsManaged: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (v4)
  {
    if ((unint64_t)(a3 - 1) > 4)
    {
      id v12 = 0;
      id v11 = 0;
    }
    else
    {
      id v10 = off_1002FC858[a3 - 1];
      id v11 = objc_opt_new();
      id v12 = [objc_alloc((Class)NSNotification) initWithName:*v10 object:v11 userInfo:0];
    }
    id v13 = v12;
    CFStringRef v14 = v13;
  }
  else
  {
    id v11 = objc_opt_new();
    id v13 = [objc_alloc((Class)NSNotification) initWithName:@"STUserNotificationManagerShouldRemoveNotification" object:v11 userInfo:0];
    CFStringRef v14 = 0;
  }

  return v13;
}

- (void)_postContactManagementNotification:(id)a3 notificationIsForParent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CFStringRef v7 = v6;
  if (v6)
  {
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003CF14;
      block[3] = &unk_1002FB828;
      block[4] = self;
      id v12 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      int64_t v8 = +[STLog familyScreenTimeManager];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting Contact Management user notification", v10, 2u);
      }

      int64_t v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotification:v7];
    }
  }
}

+ (id)_notificationForClearingParentContactManagementUserNotificiationAboutChildWithName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)STAskToManageContactsApprovedResponseReceivedUserNotificationContext) initWithChildName:v3];

  id v5 = [objc_alloc((Class)NSNotification) initWithName:@"STUserNotificationManagerShouldRemoveNotification" object:v4 userInfo:0];
  return v5;
}

+ (id)_notificationForClearingChildContactManagementUserNotification
{
  v2 = objc_opt_new();
  id v3 = [objc_alloc((Class)NSNotification) initWithName:@"STUserNotificationManagerShouldRemoveNotification" object:v2 userInfo:0];

  return v3;
}

- (void)_updateContactManagementToState:(int64_t)a3
{
  id v5 = [(STFamilySettingsManager *)self persistenceController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003D204;
  v6[3] = &unk_1002FC7C0;
  v6[4] = self;
  v6[5] = a3;
  [v5 performBackgroundTask:v6];
}

- (void)_handleApproveNotificationForManageContactsRequest:(id)a3
{
  id v4 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received approve notification for manage contacts request", v5, 2u);
  }

  [(STFamilySettingsManager *)self _updateContactManagementToState:2];
}

- (void)_handleDontApproveNotificationForManageContactsRequest:(id)a3
{
  id v4 = +[STLog familySettingsManager];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received don't approve notification for manage contacts request", v5, 2u);
  }

  [(STFamilySettingsManager *)self _updateContactManagementToState:0];
}

- (STScreenTimeCapabilities)capabilities
{
  return (STScreenTimeCapabilities *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)familyMemberByAppleID
{
  return self->_familyMemberByAppleID;
}

- (void)setFamilyMemberByAppleID:(id)a3
{
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSTimer)notificationDelayTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationDelayTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationDelayTimer, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_familyMemberByAppleID, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end