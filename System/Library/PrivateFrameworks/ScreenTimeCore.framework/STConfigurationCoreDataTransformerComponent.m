@interface STConfigurationCoreDataTransformerComponent
+ (NSDictionary)observationFiltersByTriggerPredicate;
+ (id)_blueprintBackedConfigurationChangesOfBlueprintType:(id)a3 configurationType:(int64_t)a4 userID:(id)a5 containter:(id)a6;
+ (id)_configurationFromChangedObject:(id)a3 context:(id)a4 error:(id *)a5;
+ (id)_coreDataChangeFromBlueprintConfiguration:(id)a3 configurationType:(int64_t)a4 container:(id)a5;
+ (id)_coreDataChangeFromSettingsConfiguration:(id)a3 configurationType:(int64_t)a4 container:(id)a5;
+ (id)_familyManagedCoreUsersFromCoreUsers:(id)a3 inContext:(id)a4;
+ (id)_familySettingsBackedConfigurationChangesForUserID:(id)a3 configurationType:(int64_t)a4 container:(id)a5;
+ (id)_fetchAuthorCoreUserInContext:(id)a3 error:(id *)a4;
+ (id)_setupConfigurationFromSettingsConfiguration:(id)a3 familyProvider:(id)a4 container:(id)a5;
+ (id)_targetCoreUserFromChangedObject:(id)a3 ofConfigurationType:(int64_t)a4 error:(id *)a5;
+ (id)_targetDevicesForCoreUser:(id)a3;
+ (id)_validatedConfigurationTypeFromSecondaryType:(int64_t)a3;
+ (id)communicationConfigurationForLocalUserFromPersistentContainer:(id)a3;
+ (id)communicationConfigurationForUserID:(id)a3 container:(id)a4;
+ (id)configurationChangeForCoreDataChange:(id)a3 container:(id)a4 error:(id *)a5;
+ (id)configurationChangeForRelatedConfigurationChange:(id)a3 container:(id)a4;
+ (id)configurationChangesOfType:(int64_t)a3 userID:(id)a4 containter:(id)a5;
+ (id)downtimeConfigurationForUserID:(id)a3 container:(id)a4;
+ (id)handleOnDemandDowntimeToggleForUserID:(id)a3 persistentContainer:(id)a4;
+ (id)handleSetupConfiguration:(id)a3 persistentContainter:(id)a4;
+ (id)setupConfigurationFromSettingsConfigurationChange:(id)a3 familyProvider:(id)a4 container:(id)a5;
+ (int64_t)_setupConfigurationContactManagementStateForContactManagementState:(int64_t)a3;
+ (int64_t)_setupConfigurationScreenTimeStateForManagementState:(BOOL)a3;
@end

@implementation STConfigurationCoreDataTransformerComponent

+ (id)communicationConfigurationForLocalUserFromPersistentContainer:(id)a3
{
  id v3 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100021248;
  v25 = sub_100021258;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003F90;
  v9[3] = &unk_1002FBDF0;
  id v4 = [v3 newBackgroundContext];
  id v10 = v4;
  v11 = &v21;
  v12 = &v39;
  v13 = &v35;
  v14 = &v31;
  v15 = &v27;
  v16 = &v17;
  [v4 performBlockAndWait:v9];
  if (*((unsigned char *)v18 + 24))
  {
    id v5 = objc_alloc((Class)STCommunicationConfiguration);
    id v6 = [v5 initWithCommunicationSafetySendingRestricted:*((unsigned __int8 *)v40 + 24) communicationSafetyReceivingRestricted:*((unsigned __int8 *)v36 + 24) communicationSafetyNotificationEnabled:*((unsigned __int8 *)v32 + 24) communicationSafetyAnalyticsEnabled:*((unsigned __int8 *)v28 + 24)];
    v7 = +[STResult success:v6];
  }
  else
  {
    v7 = +[STResult failure:v22[5]];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v7;
}

+ (id)configurationChangeForCoreDataChange:(id)a3 container:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 newBackgroundContext];
  if ([v8 primaryType] != (id)1)
  {
    v12 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10025CBCC();
    }
    goto LABEL_12;
  }
  v11 = objc_msgSend(a1, "_validatedConfigurationTypeFromSecondaryType:", objc_msgSend(v8, "secondaryType"));
  v12 = v11;
  if (!v11)
  {
    v14 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10025CB60();
    }

LABEL_12:
    v13 = 0;
    goto LABEL_15;
  }
  id v17 = [v11 integerValue];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_100021248;
  v56 = sub_100021258;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_100021248;
  v50 = sub_100021258;
  id v51 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_100021248;
  v44 = sub_100021258;
  id v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = sub_100021248;
  char v38 = sub_100021258;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_100021248;
  v32 = sub_100021258;
  id v33 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100021260;
  v18[3] = &unk_1002FBDA0;
  id v19 = v8;
  id v20 = v10;
  uint64_t v21 = &v28;
  v25 = &v34;
  id v26 = a1;
  id v27 = v17;
  v22 = &v40;
  uint64_t v23 = &v52;
  v24 = &v46;
  [v20 performBlockAndWait:v18];
  if (a5) {
    *a5 = (id) v29[5];
  }
  if (v29[5])
  {
    v13 = 0;
  }
  else
  {
    v15 = [STConfigurationChange alloc];
    v13 = [(STConfigurationChange *)v15 initWithTargetUser:v53[5] targetDevices:v47[5] configuration:v41[5] configurationType:v17 author:v35[5]];
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
LABEL_15:

  return v13;
}

+ (id)configurationChangeForRelatedConfigurationChange:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    unint64_t v10 = (unint64_t)[v6 configurationType];
    if (v10 > 6)
    {
      v18 = 0;
    }
    else
    {
      if (((1 << v10) & 0x74) != 0)
      {
        uint64_t v11 = [a1 _coreDataChangeFromBlueprintConfiguration:v9 configurationType:v10 container:v7];
      }
      else
      {
        if (((1 << v10) & 0xA) == 0)
        {
          id v20 = objc_alloc((Class)NSError);
          uint64_t v21 = STErrorDomain;
          NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
          v22 = +[NSString stringWithFormat:@"Unsupported configuration: %@ - %@", objc_opt_class(), @"Invalid"];
          uint64_t v29 = v22;
          uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          id v24 = [v20 initWithDomain:v21 code:37 userInfo:v23];
          v18 = +[STResult failure:v24];

          goto LABEL_11;
        }
        uint64_t v11 = [a1 _coreDataChangeFromSettingsConfiguration:v9 configurationType:v10 container:v7];
      }
      v18 = (void *)v11;
    }
LABEL_11:
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000218FC;
    v25[3] = &unk_1002FBDC8;
    id v27 = a1;
    id v26 = v7;
    id v17 = [v18 flatMap:v25];

    goto LABEL_12;
  }
  v12 = +[STLog coreDataTransformer];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10025CC38();
  }

  id v13 = objc_alloc((Class)NSError);
  uint64_t v14 = STErrorDomain;
  NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
  v15 = +[NSString stringWithFormat:@"Unsupported configuration: %@", objc_opt_class()];
  uint64_t v31 = v15;
  v16 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id v9 = [v13 initWithDomain:v14 code:37 userInfo:v16];

  id v17 = +[STResult failure:v9];
LABEL_12:

  return v17;
}

+ (id)configurationChangesOfType:(int64_t)a3 userID:(id)a4 containter:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  switch(a3)
  {
    case 0:
      id v13 = objc_alloc((Class)NSError);
      uint64_t v14 = STErrorDomain;
      v15 = +[NSString stringWithFormat:@"Invalid type: %@", @"Invalid", NSLocalizedDescriptionKey];
      id v20 = v15;
      v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v17 = [v13 initWithDomain:v14 code:32 userInfo:v16];

      unint64_t v10 = +[STResult failure:v17];

      break;
    case 1:
    case 3:
      uint64_t v9 = +[STConfigurationCoreDataTransformerComponent _familySettingsBackedConfigurationChangesForUserID:v7 configurationType:a3 container:v8];
      goto LABEL_10;
    case 2:
      uint64_t v11 = STBlueprintTypeDowntime;
      uint64_t v12 = 2;
      goto LABEL_9;
    case 4:
      uint64_t v11 = STBlueprintTypeAlwaysAllowedApps;
      uint64_t v12 = 4;
      goto LABEL_9;
    case 5:
      uint64_t v11 = STBlueprintTypeRestrictions;
      uint64_t v12 = 5;
      goto LABEL_9;
    case 6:
      uint64_t v11 = STBlueprintTypeManagedUser;
      uint64_t v12 = 6;
LABEL_9:
      uint64_t v9 = +[STConfigurationCoreDataTransformerComponent _blueprintBackedConfigurationChangesOfBlueprintType:v11 configurationType:v12 userID:v7 containter:v8];
LABEL_10:
      unint64_t v10 = (void *)v9;
      break;
    default:
      unint64_t v10 = 0;
      break;
  }

  return v10;
}

+ (id)communicationConfigurationForUserID:(id)a3 container:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 newBackgroundContext];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_100021248;
  uint64_t v34 = sub_100021258;
  id v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100021EC0;
  id v17 = &unk_1002FBE18;
  id v8 = v5;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  id v20 = &v30;
  uint64_t v21 = &v48;
  v22 = &v44;
  uint64_t v23 = &v40;
  id v24 = &v36;
  v25 = &v26;
  [v9 performBlockAndWait:&v14];
  if (*((unsigned char *)v27 + 24))
  {
    id v10 = objc_alloc((Class)STCommunicationConfiguration);
    id v11 = objc_msgSend(v10, "initWithCommunicationSafetySendingRestricted:communicationSafetyReceivingRestricted:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:", *((unsigned __int8 *)v49 + 24), *((unsigned __int8 *)v45 + 24), *((unsigned __int8 *)v41 + 24), *((unsigned __int8 *)v37 + 24), v14, v15, v16, v17, v18);
    uint64_t v12 = +[STResult success:v11];
  }
  else
  {
    uint64_t v12 = +[STResult failure:](STResult, "failure:", v31[5], v14, v15, v16, v17, v18);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v12;
}

+ (id)downtimeConfigurationForUserID:(id)a3 container:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 newBackgroundContext];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = sub_100021248;
  uint64_t v30 = sub_100021258;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100021248;
  id v24 = sub_100021258;
  id v25 = 0;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10002217C;
  uint64_t v15 = &unk_1002FBE40;
  id v18 = &v26;
  id v8 = v5;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  id v19 = &v20;
  [v9 performBlockAndWait:&v12];
  if (v27[5]) {
    +[STResult success:](STResult, "success:", v12, v13, v14, v15, v16);
  }
  else {
  id v10 = +[STResult failure:](STResult, "failure:", v21[5], v12, v13, v14, v15, v16);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

+ (id)_blueprintBackedConfigurationChangesOfBlueprintType:(id)a3 configurationType:(int64_t)a4 userID:(id)a5 containter:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100021248;
  id v27 = sub_100021258;
  id v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100022384;
  v17[3] = &unk_1002FBE68;
  id v12 = [v11 newBackgroundContext];
  id v18 = v12;
  uint64_t v21 = &v23;
  id v13 = v10;
  id v19 = v13;
  id v14 = v9;
  id v20 = v14;
  int64_t v22 = a4;
  [v12 performBlockAndWait:v17];
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

+ (id)_familyManagedCoreUsersFromCoreUsers:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (+[STSharedCoreDataTransformerComponent managingOrganizationIsFamilyOrganizationForCoreUser:inContext:](STSharedCoreDataTransformerComponent, "managingOrganizationIsFamilyOrganizationForCoreUser:inContext:", v13, v6, (void)v16))
        {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [v7 copy];
  return v14;
}

+ (id)_targetDevicesForCoreUser:(id)a3
{
  id v3 = [a3 userDeviceStates];
  if (v3)
  {
    id v4 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "device", (void)v16);
          if (v10)
          {
            uint64_t v11 = [STDeviceID alloc];
            id v12 = [v10 identifier];
            uint64_t v13 = [(STDeviceID *)v11 initWithIdentifier:v12];

            [v4 addObject:v13];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    id v14 = [v4 copy];
  }
  else
  {
    id v14 = (id)objc_opt_new();
  }

  return v14;
}

+ (id)_familySettingsBackedConfigurationChangesForUserID:(id)a3 configurationType:(int64_t)a4 container:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100021248;
  int64_t v22 = sub_100021258;
  id v23 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100022CF4;
  v13[3] = &unk_1002FBE90;
  id v9 = [v8 newBackgroundContext];
  id v14 = v9;
  long long v16 = &v18;
  id v10 = v7;
  id v15 = v10;
  int64_t v17 = a4;
  [v9 performBlockAndWait:v13];
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

+ (id)_validatedConfigurationTypeFromSecondaryType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSNumber numberWithInteger:v3];
  }
  return v5;
}

+ (id)_configurationFromChangedObject:(id)a3 context:(id)a4 error:(id *)a5
{
  id v6 = a3;
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___STSerializableManagedObject])
  {
    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___STVersionVectorable])
    {
      a5 = [v6 dictionaryRepresentation];
      goto LABEL_12;
    }
  }
  else
  {
    id v7 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10025CD38();
    }

    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___STVersionVectorable]) {
      goto LABEL_10;
    }
  }
  id v8 = +[STLog coreDataTransformer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10025CCB8();
  }

LABEL_10:
  if (a5)
  {
    id v9 = objc_alloc((Class)NSError);
    uint64_t v10 = STErrorDomain;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    uint64_t v13 = +[NSString stringWithFormat:@"Changed Object Class: %@", v12, NSLocalizedDescriptionKey];
    int64_t v17 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a5 = [v9 initWithDomain:v10 code:34 userInfo:v14];

    a5 = 0;
  }
LABEL_12:

  return a5;
}

+ (id)_targetCoreUserFromChangedObject:(id)a3 ofConfigurationType:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if ((unint64_t)a4 <= 6)
  {
    if (((1 << a4) & 0x74) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 users];
        id v9 = [v8 anyObject];

        if (v9) {
          goto LABEL_14;
        }
      }
    }
    else if (((1 << a4) & 0xA) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v7 user];
        if (v9) {
          goto LABEL_14;
        }
      }
    }
  }
  uint64_t v10 = +[STLog coreDataTransformer];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10025CDB8((uint64_t)v7, a4, v10);
  }

  if (a5)
  {
    id v11 = objc_alloc((Class)NSError);
    uint64_t v12 = STErrorDomain;
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = +[NSString stringWithFormat:@"Changed object class: %@, does not map to configuration type: %ld", v14, a4];
    long long v19 = v15;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    *a5 = [v11 initWithDomain:v12 code:34 userInfo:v16];
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

+ (id)_fetchAuthorCoreUserInContext:(id)a3 error:(id *)a4
{
  id v12 = 0;
  id v5 = +[STCoreUser fetchLocalUserInContext:a3 error:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10025CE5C();
    }

    if (a4)
    {
      if (v6)
      {
        NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
        id v14 = v6;
        id v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      }
      else
      {
        id v9 = 0;
      }
      id v10 = objc_alloc((Class)NSError);
      *a4 = [v10 initWithDomain:STErrorDomain code:32 userInfo:v9];
    }
  }

  return v5;
}

+ (id)_coreDataChangeFromSettingsConfiguration:(id)a3 configurationType:(int64_t)a4 container:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v8 newBackgroundContext];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int64_t v22 = sub_100021248;
  id v23 = sub_100021258;
  id v24 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000236C0;
  v14[3] = &unk_1002FBEB8;
  id v10 = v7;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  int64_t v17 = &v19;
  int64_t v18 = a4;
  [v11 performBlockAndWait:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

+ (id)_coreDataChangeFromBlueprintConfiguration:(id)a3 configurationType:(int64_t)a4 container:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v8 newBackgroundContext];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int64_t v22 = sub_100021248;
  id v23 = sub_100021258;
  id v24 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100023958;
  v14[3] = &unk_1002FBEB8;
  id v10 = v7;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  int64_t v17 = &v19;
  int64_t v18 = a4;
  [v11 performBlockAndWait:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

+ (id)setupConfigurationFromSettingsConfigurationChange:(id)a3 familyProvider:(id)a4 container:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 matchingAny:&off_10030FF78];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100023BB0;
  v17[3] = &unk_1002FBEE0;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v21 = a1;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = [v11 flatMap:v17];

  return v15;
}

+ (id)_setupConfigurationFromSettingsConfiguration:(id)a3 familyProvider:(id)a4 container:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 newBackgroundContext];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100021248;
  id v27 = sub_100021258;
  id v28 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100023EF0;
  v17[3] = &unk_1002FBF58;
  id v12 = v8;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  id v21 = &v23;
  id v22 = a1;
  id v14 = v9;
  id v20 = v14;
  [v13 performBlockAndWait:v17];
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

+ (int64_t)_setupConfigurationScreenTimeStateForManagementState:(BOOL)a3
{
  if (a3) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (int64_t)_setupConfigurationContactManagementStateForContactManagementState:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (NSDictionary)observationFiltersByTriggerPredicate
{
  if (qword_100346928 != -1) {
    dispatch_once(&qword_100346928, &stru_1002FBF78);
  }
  v2 = (void *)qword_100346920;
  return (NSDictionary *)v2;
}

+ (id)handleSetupConfiguration:(id)a3 persistentContainter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100021248;
  id v19 = sub_100021258;
  id v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024820;
  v11[3] = &unk_1002FBFA0;
  id v7 = [v6 newBackgroundContext];
  id v12 = v7;
  id v14 = &v15;
  id v8 = v5;
  id v13 = v8;
  [v7 performBlockAndWait:v11];
  if (v16[5]) {
    +[STResult failure:](STResult, "failure:");
  }
  else {
  id v9 = +[STResult success];
  }

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)handleOnDemandDowntimeToggleForUserID:(id)a3 persistentContainer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 newBackgroundContext];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = sub_100021248;
  uint64_t v30 = sub_100021258;
  id v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1000251CC;
  uint64_t v15 = &unk_1002FBFC8;
  id v18 = v34;
  id v8 = v5;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  id v19 = &v26;
  id v20 = v32;
  id v21 = &v22;
  [v9 performBlockAndWait:&v12];
  if (*((unsigned char *)v23 + 24)) {
    +[STResult success];
  }
  else {
  id v10 = +[STResult failure:](STResult, "failure:", v27[5], v12, v13, v14, v15, v16);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  return v10;
}

@end