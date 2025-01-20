@interface STDeviceStateCoreDataTransformerComponent
+ (NSDictionary)observationFiltersByTriggerPredicate;
+ (id)_allInstalledAppsForUserDeviceState:(id)a3 inContext:(id)a4;
+ (id)_appFromCoreDataChange:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_appTombstoneFromCoreDataChange:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_deviceWithID:(id)a3 associatedUser:(id)a4 inContext:(id)a5;
+ (id)_localDeviceFromPrimitives:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_validatedDeviceStateChangeTypeFromSecondaryType:(int64_t)a3;
+ (id)_writeDevice:(id)a3 associatedUser:(id)a4 inContext:(id)a5;
+ (id)deviceStateChangeForCoreDataChanges:(id)a3 deviceInformationPrimitives:(id)a4 container:(id)a5 error:(id *)a6;
+ (id)deviceStateChangeForLocalDeviceUsingDeviceInformationPrimitives:(id)a3 persistentContainer:(id)a4;
+ (id)handleDeviceStateChange:(id)a3 deviceInformationPrimitives:(id)a4 container:(id)a5;
+ (int64_t)_devicePlatformFromOSPlatform:(signed __int16)a3;
+ (signed)_osPlatformFromDevicePlatform:(int64_t)a3;
@end

@implementation STDeviceStateCoreDataTransformerComponent

+ (id)deviceStateChangeForCoreDataChanges:(id)a3 deviceInformationPrimitives:(id)a4 container:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 newBackgroundContext];
  uint64_t v58 = 0;
  v59[0] = &v58;
  v59[1] = 0x3032000000;
  v59[2] = sub_10002BFBC;
  v59[3] = sub_10002BFCC;
  id v60 = 0;
  id v57 = 0;
  v14 = [a1 _localDeviceFromPrimitives:v11 inContext:v13 error:&v57];
  objc_storeStrong(&v60, v57);
  if (v14)
  {
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = sub_10002BFBC;
    v55 = sub_10002BFCC;
    id v56 = 0;
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = sub_10002BFBC;
    v49 = sub_10002BFCC;
    id v50 = (id)objc_opt_new();
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = sub_10002BFBC;
    v43 = sub_10002BFCC;
    id v44 = (id)objc_opt_new();
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_10002BFD4;
    v31 = &unk_1002FC3A8;
    id v32 = v13;
    v34 = &v58;
    v35 = &v51;
    id v33 = v10;
    v36 = &v45;
    v37 = &v39;
    id v38 = a1;
    [v32 performBlockAndWait:&v28];
    if (a6) {
      *a6 = *(id *)(v59[0] + 40);
    }
    if (*(void *)(v59[0] + 40))
    {
      v15 = 0;
    }
    else
    {
      v23 = [STDeviceStateChange alloc];
      v24 = objc_msgSend(v14, "deviceID", v28, v29, v30, v31, v32);
      v25 = [v14 name];
      id v26 = [v14 platform];
      v15 = [(STDeviceStateChange *)v23 initWithDeviceID:v24 deviceName:v25 devicePlatform:v26 installedApps:v46[5] removedApps:v40[5] associatedUser:v52[5]];
    }
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);
  }
  else
  {
    v16 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10025DAB0((uint64_t)v59, v16, v17, v18, v19, v20, v21, v22);
    }

    v15 = 0;
    if (a6) {
      *a6 = *(id *)(v59[0] + 40);
    }
  }

  _Block_object_dispose(&v58, 8);
  return v15;
}

+ (id)deviceStateChangeForLocalDeviceUsingDeviceInformationPrimitives:(id)a3 persistentContainer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_10002BFBC;
  v48 = sub_10002BFCC;
  id v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = sub_10002BFBC;
  v42 = sub_10002BFCC;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10002BFBC;
  v36 = sub_10002BFCC;
  id v37 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_10002C6EC;
  uint64_t v21 = &unk_1002FC3D0;
  id v7 = [v6 newBackgroundContext];
  id v22 = v7;
  v24 = &v32;
  v25 = &v44;
  id v26 = &v38;
  id v8 = v5;
  id v23 = v8;
  v27 = &v28;
  [v7 performBlockAndWait:&v18];
  if (*((unsigned char *)v29 + 24))
  {
    v9 = [STDeviceStateChange alloc];
    id v10 = objc_msgSend((id)v39[5], "deviceID", v18, v19, v20, v21, v22);
    id v11 = [(id)v39[5] name];
    id v12 = [(id)v39[5] platform];
    id v13 = [(id)v39[5] apps];
    v14 = objc_opt_new();
    v15 = [(STDeviceStateChange *)v9 initWithDeviceID:v10 deviceName:v11 devicePlatform:v12 installedApps:v13 removedApps:v14 associatedUser:v45[5]];

    v16 = +[STResult success:v15];
  }
  else
  {
    v16 = +[STResult failure:](STResult, "failure:", v33[5], v18, v19, v20, v21, v22);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v16;
}

+ (id)handleDeviceStateChange:(id)a3 deviceInformationPrimitives:(id)a4 container:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 newBackgroundContext];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10002BFBC;
  v25 = sub_10002BFCC;
  id v26 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002C998;
  v16[3] = &unk_1002FBEB8;
  id v12 = v8;
  id v17 = v12;
  id v20 = a1;
  id v13 = v11;
  id v18 = v13;
  uint64_t v19 = &v21;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

+ (id)_deviceWithID:(id)a3 associatedUser:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 dsid];
  id v36 = 0;
  id v11 = +[STCoreUser fetchUserWithDSID:v10 inContext:v9 error:&v36];
  id v12 = v36;

  if (v11)
  {
    id v13 = [v8 identifier];
    id v35 = v12;
    id v14 = +[STCoreDevice fetchDeviceWithIdentifier:v13 inContext:v9 error:&v35];
    id v15 = v35;

    if (v14)
    {
      v16 = +[STUserDeviceState fetchRequest];
      id v17 = +[NSPredicate predicateWithFormat:@"%K == %@ AND %K == %@", @"user", v11, @"device", v14];
      [v16 setPredicate:v17];

      id v34 = v15;
      id v18 = [v16 execute:&v34];
      id v19 = v34;

      if (v18)
      {
        id v33 = v8;
        id v20 = [v18 firstObject];
        if (v20)
        {
          uint64_t v21 = [a1 _allInstalledAppsForUserDeviceState:v20 inContext:v9];
          uint64_t v32 = v13;
          id v22 = [STDevice alloc];
          [v14 name];
          uint64_t v23 = v31 = v19;
          v24 = -[STDevice initWithID:name:platform:apps:](v22, "initWithID:name:platform:apps:", v33, v23, objc_msgSend(a1, "_devicePlatformFromOSPlatform:", objc_msgSend(v14, "platform")), v21);
          v25 = +[STResult success:v24];

          id v13 = v32;
          id v19 = v31;
        }
        else
        {
          uint64_t v29 = +[STLog coreDataTransformer];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10025DE38();
          }

          v25 = +[STResult failure:v19];
        }

        id v8 = v33;
      }
      else
      {
        uint64_t v28 = +[STLog coreDataTransformer];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10025DDD0();
        }

        v25 = +[STResult failure:v19];
      }

      id v15 = v19;
    }
    else
    {
      v27 = +[STLog coreDataTransformer];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10025DD68();
      }

      v25 = +[STResult failure:v15];
    }

    id v12 = v15;
  }
  else
  {
    id v26 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10025DD00();
    }

    v25 = +[STResult failure:v12];
  }

  return v25;
}

+ (id)_localDeviceFromPrimitives:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = 0;
  id v10 = +[STUserDeviceState fetchLocalUserDeviceStateInContext:v9 error:&v21];
  id v11 = v21;
  id v12 = v11;
  if (v10)
  {
    id v13 = [a1 _allInstalledAppsForUserDeviceState:v10 inContext:v9];
    id v14 = [STDeviceID alloc];
    id v15 = [v8 deviceUUID];
    v16 = [(STDeviceID *)v14 initWithIdentifier:v15];

    id v17 = [STDevice alloc];
    id v18 = [v8 deviceName];
    id v19 = [(STDevice *)v17 initWithID:v16 name:v18 platform:+[STDevice currentPlatform] apps:v13];
  }
  else
  {
    id v19 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v19;
}

+ (id)_allInstalledAppsForUserDeviceState:(id)a3 inContext:(id)a4
{
  id v4 = a3;
  id v25 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v23 = v4;
  id obj = [v4 installedApps];
  id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v29;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v7 = [v6 bundleIdentifier];
        id v8 = [v6 distributorID];
        id v9 = [v6 adamID];
        if (v9)
        {
          id v10 = [v6 adamID];
          id v11 = [v10 unsignedLongLongValue];
        }
        else
        {
          id v11 = 0;
        }

        id v12 = [v6 versionIdentifier];
        if (v12)
        {
          id v13 = [v6 versionIdentifier];
          id v14 = [v13 unsignedLongLongValue];
        }
        else
        {
          id v14 = 0;
        }

        id v15 = [v6 betaVersionIdentifier];
        if (v15)
        {
          v16 = [v6 betaVersionIdentifier];
          id v17 = [v16 unsignedLongLongValue];
        }
        else
        {
          id v17 = 0;
        }

        if (v7)
        {
          id v18 = [STAppInformation alloc];
          id v19 = [v6 displayName];
          id v20 = [v6 iconData];
          id v21 = -[STAppInformation initWithBundleIdentifier:displayName:iconData:distributorID:distributorIsThirdParty:adamID:versionIdentifier:betaVersionIdentifier:](v18, "initWithBundleIdentifier:displayName:iconData:distributorID:distributorIsThirdParty:adamID:versionIdentifier:betaVersionIdentifier:", v7, v19, v20, v8, [v6 distributorIsThirdParty], v11, v14, v17);
          [v25 addObject:v21];
        }
        else
        {
          id v19 = +[STLog coreDataTransformer];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v33 = v6;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Installed app missing bundle identifier: %{public}@", buf, 0xCu);
          }
        }
      }
      id v27 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v27);
  }

  return v25;
}

+ (id)_appFromCoreDataChange:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v39 = 0;
  id v6 = +[STSharedCoreDataTransformerComponent changedObjectFromCoreDataChange:a3 inContext:a4 error:&v39];
  id v7 = v39;
  if (!v6)
  {
    id v13 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10025DEA0();
    }

    if (a5)
    {
      id v14 = 0;
      *a5 = v7;
      goto LABEL_29;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10025DF70();
    }

    if (a5)
    {
      id v16 = objc_alloc((Class)NSError);
      uint64_t v17 = STErrorDomain;
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      id v20 = +[NSString stringWithFormat:@"Changed Object Class: %@", v19];
      id v43 = v20;
      id v21 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      *a5 = [v16 initWithDomain:v17 code:34 userInfo:v21];
    }
LABEL_14:
    id v14 = 0;
    goto LABEL_29;
  }
  id v8 = v6;
  id v9 = [v8 bundleIdentifier];
  if (v9)
  {
    id v10 = [v8 distributorID];
    id v11 = [v8 adamID];
    if (v11)
    {
      id v12 = [v8 adamID];
      id v37 = [v12 unsignedLongLongValue];
    }
    else
    {
      id v37 = 0;
    }

    uint64_t v26 = [v8 versionIdentifier];
    if (v26)
    {
      id v27 = [v8 versionIdentifier];
      id v28 = [v27 unsignedLongLongValue];
    }
    else
    {
      id v28 = 0;
    }

    long long v29 = [v8 betaVersionIdentifier];
    uint64_t v38 = v9;
    if (v29)
    {
      long long v30 = [v8 betaVersionIdentifier];
      id v31 = [v30 unsignedLongLongValue];
    }
    else
    {
      id v31 = 0;
    }

    uint64_t v32 = [STAppInformation alloc];
    id v33 = [v8 bundleIdentifier];
    id v34 = [v8 displayName];
    id v35 = [v8 iconData];
    id v14 = -[STAppInformation initWithBundleIdentifier:displayName:iconData:distributorID:distributorIsThirdParty:adamID:versionIdentifier:betaVersionIdentifier:](v32, "initWithBundleIdentifier:displayName:iconData:distributorID:distributorIsThirdParty:adamID:versionIdentifier:betaVersionIdentifier:", v33, v34, v35, v10, [v8 distributorIsThirdParty], v37, v28, v31);

    id v9 = v38;
  }
  else
  {
    id v22 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10025DF08();
    }

    if (!a5)
    {
      id v14 = 0;
      goto LABEL_28;
    }
    id v23 = objc_alloc((Class)NSError);
    uint64_t v24 = STErrorDomain;
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    CFStringRef v41 = @"Installed app missing bundle identifier";
    id v10 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v25 = [v23 initWithDomain:v24 code:34 userInfo:v10];
    id v14 = 0;
    *a5 = v25;
  }

LABEL_28:
LABEL_29:

  return v14;
}

+ (id)_appTombstoneFromCoreDataChange:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = [v6 changeIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [v6 changeIdentifier];
    id v10 = [v9 objectForKeyedSubscript:@"bundleIdentifier"];
    uint64_t v11 = [v9 objectForKeyedSubscript:@"uniqueIdentifier"];
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      id v13 = [[STAppTombstone alloc] initWithBundleIdentifier:v10 uniqueIdentifier:v11];
    }
    else
    {
      id v16 = +[STLog coreDataTransformer];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10025DFF8(v12 == 0, v10 == 0, v16);
      }

      if (a5)
      {
        id v17 = objc_alloc((Class)NSError);
        id v13 = 0;
        *a5 = [v17 initWithDomain:STErrorDomain code:40 userInfo:0];
      }
      else
      {
        id v13 = 0;
      }
    }
  }
  else
  {
    id v14 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10025E0D8(v6);
    }

    if (a5)
    {
      id v15 = objc_alloc((Class)NSError);
      id v13 = 0;
      *a5 = [v15 initWithDomain:STErrorDomain code:40 userInfo:0];
    }
    else
    {
      id v13 = 0;
    }
  }

  return v13;
}

+ (id)_writeDevice:(id)a3 associatedUser:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 dsid];
  id v92 = 0;
  uint64_t v11 = +[STCoreUser fetchUserWithDSID:v10 inContext:v9 error:&v92];
  id v12 = v92;

  if (v11)
  {
    id v13 = [v8 deviceID];
    id v14 = [v13 identifier];

    id v91 = v12;
    id v15 = +[STCoreDevice fetchDeviceWithIdentifier:v14 inContext:v9 error:&v91];
    id v16 = v91;
    id v17 = v12;
    id v18 = v16;

    if (!v15)
    {
      id v19 = +[STLog screentime];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v97 = "+[STDeviceStateCoreDataTransformerComponent _writeDevice:associatedUser:inContext:]";
        __int16 v98 = 2112;
        v99 = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating CoreDevice with deviceIdentifier: (%@)", buf, 0x16u);
      }

      id v20 = [objc_alloc((Class)STCoreDevice) initWithContext:v9];
      [v20 setIdentifier:v14];
      objc_msgSend(v20, "setPlatform:", objc_msgSend(a1, "_osPlatformFromDevicePlatform:", objc_msgSend(v8, "platform")));
      id v21 = [objc_alloc((Class)STUsage) initWithContext:v9];
      id v22 = +[NSDate now];
      [v21 setLastUpdatedDate:v22];

      id v15 = v20;
      [v21 setDevice:v20];
      [v21 setUser:v11];
    }
    id v23 = [v8 name];
    [v15 setName:v23];

    uint64_t v24 = +[STUserDeviceState fetchRequest];
    id v25 = +[NSPredicate predicateWithFormat:@"%K == %@ AND %K == %@", @"user", v11, @"device", v15];
    [v24 setPredicate:v25];

    id v90 = v18;
    v73 = v24;
    uint64_t v26 = [v24 execute:&v90];
    id v74 = v90;

    v75 = v15;
    v72 = v26;
    if (v26)
    {
      v77 = [v26 firstObject];
      if (!v77)
      {
        id v27 = +[STLog screentime];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [v11 dsid];
          long long v29 = [v75 identifier];
          *(_DWORD *)buf = 136446722;
          v97 = "+[STDeviceStateCoreDataTransformerComponent _writeDevice:associatedUser:inContext:]";
          __int16 v98 = 2112;
          v99 = v28;
          __int16 v100 = 2112;
          v101 = v29;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating UserDeviceState for user: (%@), deviceIdentifier: (%@)", buf, 0x20u);
        }
        id v30 = [objc_alloc((Class)STUserDeviceState) initWithContext:v9];
        [v30 setUser:v11];
        v77 = v30;
        [v30 setDevice:v75];
      }
      v69 = v14;
      v70 = v11;
      v76 = v9;
      id v31 = [v8 apps];
      id v32 = [v31 count];

      id v33 = +[NSMutableDictionary dictionaryWithCapacity:v32];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v71 = v8;
      id v34 = [v8 apps];
      id v35 = [v34 countByEnumeratingWithState:&v86 objects:v95 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v87;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v87 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            NSErrorUserInfoKey v40 = [v39 bundleIdentifier];
            if (v40)
            {
              [v33 setObject:v39 forKeyedSubscript:v40];
            }
            else
            {
              CFStringRef v41 = +[STLog coreDataTransformer];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                v97 = (const char *)v39;
                _os_log_fault_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "Missing bundle identifier for app: %{public}@", buf, 0xCu);
              }
            }
          }
          id v36 = [v34 countByEnumeratingWithState:&v86 objects:v95 count:16];
        }
        while (v36);
      }

      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      NSErrorUserInfoKey v42 = [v77 installedApps];
      id v43 = [v42 countByEnumeratingWithState:&v82 objects:v94 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v83;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(void *)v83 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void **)(*((void *)&v82 + 1) + 8 * (void)j);
            v48 = [v47 bundleIdentifier];
            if (v48)
            {
              id v49 = [v33 allKeys];
              unsigned __int8 v50 = [v49 containsObject:v48];

              if (v50) {
                [v33 removeObjectForKey:v48];
              }
              else {
                [v76 deleteObject:v47];
              }
            }
          }
          id v44 = [v42 countByEnumeratingWithState:&v82 objects:v94 count:16];
        }
        while (v44);
      }

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v51 = [v33 allValues];
      id v52 = [v51 countByEnumeratingWithState:&v78 objects:v93 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v79;
        do
        {
          for (k = 0; k != v53; k = (char *)k + 1)
          {
            if (*(void *)v79 != v54) {
              objc_enumerationMutation(v51);
            }
            id v56 = *(void **)(*((void *)&v78 + 1) + 8 * (void)k);
            id v57 = [objc_alloc((Class)STInstalledApp) initWithContext:v76];
            uint64_t v58 = [v56 bundleIdentifier];
            [v57 setBundleIdentifier:v58];

            [v57 setUserDeviceState:v77];
            v59 = [v56 displayName];
            [v57 setDisplayName:v59];

            id v60 = [v56 iconData];
            [v57 setIconData:v60];

            v61 = [v56 distributorID];
            [v57 setDistributorID:v61];

            objc_msgSend(v57, "setDistributorIsThirdParty:", objc_msgSend(v56, "distributorIsThirdParty"));
            v62 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v56 adamID]);
            [v57 setAdamID:v62];

            v63 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v56 versionIdentifier]);
            [v57 setVersionIdentifier:v63];

            v64 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v56 betaVersionIdentifier]);
            [v57 setBetaVersionIdentifier:v64];
          }
          id v53 = [v51 countByEnumeratingWithState:&v78 objects:v93 count:16];
        }
        while (v53);
      }

      v65 = +[STResult success];

      uint64_t v11 = v70;
      id v8 = v71;
      id v9 = v76;
      id v14 = v69;
      id v12 = v74;
    }
    else
    {
      v67 = +[STLog coreDataTransformer];
      id v12 = v74;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_10025E1E0();
      }

      v65 = +[STResult failure:v74];
    }
  }
  else
  {
    v66 = +[STLog coreDataTransformer];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_10025E178();
    }

    v65 = +[STResult failure:v12];
  }

  return v65;
}

+ (int64_t)_devicePlatformFromOSPlatform:(signed __int16)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 5) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

+ (signed)_osPlatformFromDevicePlatform:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 5) {
    return a3;
  }
  else {
    return 0;
  }
}

+ (id)_validatedDeviceStateChangeTypeFromSecondaryType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSNumber numberWithInteger:v3];
  }
  return v5;
}

+ (NSDictionary)observationFiltersByTriggerPredicate
{
  if (qword_100346938 != -1) {
    dispatch_once(&qword_100346938, &stru_1002FC488);
  }
  v2 = (void *)qword_100346930;
  return (NSDictionary *)v2;
}

@end