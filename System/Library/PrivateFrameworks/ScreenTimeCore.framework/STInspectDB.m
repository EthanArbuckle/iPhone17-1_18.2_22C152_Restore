@interface STInspectDB
- (BOOL)runWithOptions:(id)a3;
- (id)_convertDateToString:(id)a3;
- (id)_fetchBlueprints:(id)a3;
- (id)_fetchCommunicationPoliciesMatchingAppleID:(id)a3;
- (id)_fetchFamilySettingsMatchingAppleID:(id)a3;
- (id)_schemaData;
- (id)_usageData:(id)a3;
- (id)name;
- (id)options;
- (id)shortEnglishDescription;
- (id)usageLine;
@end

@implementation STInspectDB

- (id)name
{
  return @"inspect";
}

- (id)shortEnglishDescription
{
  return @"Returns the current state of the ScreenTime database.";
}

- (id)options
{
  v2 = objc_opt_new();
  [v2 setLongName:@"verbose"];
  [v2 setShortName:@"v"];
  [v2 setShortEnglishDescription:@"verbose inspection"];
  [v2 setParameterCount:0];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)usageLine
{
  return @"[--verbose]";
}

- (BOOL)runWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 dictionaryWithOptionsAndValues];
  [v4 finishArguments];

  v6 = [v5 objectForKeyedSubscript:@"verbose"];
  byte_100015990 = v6 != 0;

  v7 = +[STAdminPersistenceController sharedController];
  v8 = [v7 persistentContainer];

  if (!v8)
  {
    v11 = +[NSAssertionHandler currentHandler];
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STInspectDB runWithOptions:]");
    [v11 handleFailureInFunction:v12 file:@"STInspectDB.m" lineNumber:51 description:@"Failed to load persistent container\n"];
  }
  id v9 = [v8 newBackgroundContext];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005104;
  v13[3] = &unk_1000103C0;
  v13[4] = self;
  [v9 performBlockAndWait:v13];

  return 1;
}

- (id)_schemaData
{
  v3 = &CFEqual_ptr;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = +[STCoreUser fetchRequestMatchingLocalUser];
  id v65 = 0;
  v6 = [v5 execute:&v65];
  id v7 = v65;
  id v8 = 0;
  if (!v7)
  {
    v55 = v5;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v54 = v6;
    id obj = v6;
    id v59 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v59)
    {
      uint64_t v57 = *(void *)v62;
      v58 = v4;
      CFStringRef v9 = @"nil";
      do
      {
        for (i = 0; i != v59; i = (char *)i + 1)
        {
          if (*(void *)v62 != v57) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v12 = objc_alloc_init((Class)v3[90]);
          v13 = +[NSBundle mainBundle];
          v14 = [v13 bundleIdentifier];

          v15 = [v11 givenName];
          v16 = [v11 familyName];
          v17 = +[NSString stringWithFormat:@"%@ %@", v15, v16];
          [v12 setObject:v17 forKeyedSubscript:@"user"];

          uint64_t v18 = [v11 dsid];
          v19 = (void *)v18;
          if (v18) {
            uint64_t v20 = v18;
          }
          else {
            uint64_t v20 = (uint64_t)v9;
          }
          [v12 setObject:v20 forKeyedSubscript:@"identifier"];

          v21 = [v11 altDSID];
          [v12 setObject:v21 forKeyedSubscript:@"alternateIdentifier"];

          v22 = [v11 organizationIdentifier];
          [v12 setObject:v22 forKeyedSubscript:@"organizationIdentifier"];

          id v60 = v14;
          [v60 UTF8String];
          if ((os_variant_has_internal_ui() & 1) == 0)
          {
            [v12 setObject:off_100015860 forKeyedSubscript:@"user"];
            [v12 setObject:off_100015860 forKeyedSubscript:@"identifier"];
            [v12 setObject:off_100015860 forKeyedSubscript:@"alternateIdentifier"];
          }
          id v23 = objc_alloc_init((Class)v3[90]);
          v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 screenTimeEnabled]);
          [v23 setObject:v24 forKeyedSubscript:@"screenTimeEnabled"];

          v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isManaged]);
          [v23 setObject:v25 forKeyedSubscript:@"managed"];

          uint64_t v26 = [v11 isAppAndWebsiteActivityEnabled];
          v27 = (void *)v26;
          if (v26) {
            uint64_t v28 = v26;
          }
          else {
            uint64_t v28 = (uint64_t)v9;
          }
          [v23 setObject:v28 forKeyedSubscript:@"appAndWebsiteActivity"];

          v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 syncingEnabled]);
          [v23 setObject:v29 forKeyedSubscript:@"cloudSyncingEnabled"];

          v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isEyeReliefEnabled]);
          [v23 setObject:v30 forKeyedSubscript:@"eyeRelief"];

          v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 shareWebUsage]);
          [v23 setObject:v31 forKeyedSubscript:@"shareWebUsage"];

          v32 = [v11 effectivePasscode];
          v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v32 length] != 0);
          [v23 setObject:v33 forKeyedSubscript:@"isPasscodeSet"];

          v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 needsToSetPasscode]);
          [v23 setObject:v34 forKeyedSubscript:@"needsToSetPasscode"];

          v35 = [v11 unmodeledManagingOrganizationSettings];
          [v35 modificationDate];
          CFStringRef v36 = v9;
          v38 = v37 = v3;
          v39 = [(STInspectDB *)self _convertDateToString:v38];

          if (v39) {
            CFStringRef v40 = v39;
          }
          else {
            CFStringRef v40 = @"none";
          }
          [v23 setObject:v40 forKeyedSubscript:@"settingsModificationDate"];
          v41 = [v11 appleID];
          v42 = [(STInspectDB *)self _fetchCommunicationPoliciesMatchingAppleID:v41];
          [v23 setObject:v42 forKeyedSubscript:@"communicationPolicies"];

          [v12 setObject:v23 forKeyedSubscript:@"settings"];
          v43 = [v11 appleID];
          v44 = [(STInspectDB *)self _fetchFamilySettingsMatchingAppleID:v43];
          [v12 setObject:v44 forKeyedSubscript:@"familySettings"];

          v45 = [v11 appleID];
          v46 = [(STInspectDB *)self _usageData:v45];
          [v12 setObject:v46 forKeyedSubscript:@"aggregateUsage"];

          v47 = [v11 appleID];
          v48 = sub_100006714(v47);
          [v12 setObject:v48 forKeyedSubscript:@"perDeviceState"];

          v49 = [v11 appleID];
          v50 = [(STInspectDB *)self _fetchBlueprints:v49];
          [v12 setObject:v50 forKeyedSubscript:@"blueprints"];

          v3 = v37;
          CFStringRef v9 = v36;
          v51 = [v11 localUserDeviceState];

          if (v51) {
            CFStringRef v52 = @"localUser";
          }
          else {
            CFStringRef v52 = @"remoteUser";
          }
          id v4 = v58;
          [v58 setObject:v12 forKeyedSubscript:v52];
        }
        id v59 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v59);
    }

    id v8 = v4;
    id v7 = 0;
    v5 = v55;
    v6 = v54;
  }

  return v8;
}

- (id)_fetchBlueprints:(id)a3
{
  id v4 = +[STCoreUser fetchRequestMatchingAppleID:a3];
  id v57 = 0;
  v5 = [v4 execute:&v57];
  id v6 = v57;
  id v44 = 0;
  if (!v6)
  {
    CFStringRef v40 = v4;
    v39 = v5;
    id v7 = [v5 objectAtIndexedSubscript:0];
    id v8 = [v7 blueprints];
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
    id v44 = (id)objc_claimAutoreleasedReturnValue();

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v38 = v7;
    id obj = [v7 blueprints];
    id v45 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v45)
    {
      uint64_t v42 = *(void *)v54;
      v43 = self;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v54 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = v9;
          v10 = *(void **)(*((void *)&v53 + 1) + 8 * v9);
          v11 = [v10 configurations];
          id v12 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v11 count]);

          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          v47 = v10;
          v13 = [v10 configurations];
          id v14 = [v13 countByEnumeratingWithState:&v49 objects:v62 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v50;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v50 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                v19 = [v18 identifier];
                v60[0] = @"identifier";
                uint64_t v20 = [v18 identifier];
                v60[1] = @"type";
                v61[0] = v20;
                v21 = [v18 type];
                v61[1] = v21;
                v22 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
                [v12 setObject:v22 forKeyedSubscript:v19];
              }
              id v15 = [v13 countByEnumeratingWithState:&v49 objects:v62 count:16];
            }
            while (v15);
          }

          v46 = [v47 identifier];
          id v23 = [v47 modificationDate];
          v24 = [(STInspectDB *)v43 _convertDateToString:v23];

          v25 = [v47 expiration];
          uint64_t v26 = [(STInspectDB *)v43 _convertDateToString:v25];

          v27 = [v47 minimumInstallationDate];
          uint64_t v28 = [(STInspectDB *)v43 _convertDateToString:v27];

          v58[0] = @"identifier";
          v29 = [v47 identifier];
          v59[0] = v29;
          v58[1] = @"type";
          v30 = [v47 type];
          v59[1] = v30;
          v58[2] = @"enabled";
          uint64_t v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v47 enabled]);
          v32 = (void *)v31;
          CFStringRef v33 = @"none";
          if (v26) {
            CFStringRef v34 = v26;
          }
          else {
            CFStringRef v34 = @"none";
          }
          v59[2] = v31;
          v59[3] = v34;
          v58[3] = @"expiration";
          v58[4] = @"modifiedDate";
          if (v24) {
            CFStringRef v35 = v24;
          }
          else {
            CFStringRef v35 = @"none";
          }
          if (v28) {
            CFStringRef v33 = v28;
          }
          v59[4] = v35;
          v59[5] = v33;
          v58[5] = @"minimumInstallationDate";
          v58[6] = @"configurations";
          v59[6] = v12;
          CFStringRef v36 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:7];
          [v44 setObject:v36 forKeyedSubscript:v46];

          uint64_t v9 = v48 + 1;
        }
        while ((id)(v48 + 1) != v45);
        id v45 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v45);
    }

    id v6 = 0;
    id v4 = v40;
    v5 = v39;
  }

  return v44;
}

- (id)_usageData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = +[STCoreUser fetchRequestMatchingAppleID:v3];
  id v34 = 0;
  id v6 = [v5 execute:&v34];
  id v7 = v34;
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v28 = v5;
    id v29 = v3;
    v27 = v6;
    uint64_t v9 = [v6 objectAtIndexedSubscript:0];
    v10 = +[NSCalendar currentCalendar];
    v11 = +[NSDate date];
    id v12 = [v10 dateByAddingUnit:16 value:-6 toDate:v11 options:0];
    v13 = [v10 startOfDayForDate:v12];

    id v14 = +[NSDate date];
    v25 = v10;
    id v15 = [v10 startOfDayForDate:v14];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v26 = v9;
    uint64_t v16 = [v9 usages];
    id v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v22 = [v21 device];

          if (!v22)
          {
            uint64_t v23 = sub_1000047EC(v21, v13, v15);

            id v4 = (id)v23;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v18);
    }

    id v4 = v4;
    id v8 = v4;
    v5 = v28;
    id v3 = v29;
    id v6 = v27;
  }

  return v8;
}

- (id)_fetchCommunicationPoliciesMatchingAppleID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = +[STCoreUser fetchRequestMatchingAppleID:v3];

  uint64_t v17 = 0;
  id v6 = [v5 execute:&v17];
  id v7 = v6;
  id v8 = 0;
  if (!v17)
  {
    uint64_t v9 = [v6 objectAtIndexedSubscript:0];
    v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v9 communicationPolicy]);
    [v4 setObject:v10 forKeyedSubscript:@"communicationPolicy"];

    v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v9 communicationWhileLimitedPolicy]);
    [v4 setObject:v11 forKeyedSubscript:@"communicationWhileLimitedPolicy"];

    id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isCommunicationSafetySendingRestricted]);
    [v4 setObject:v12 forKeyedSubscript:@"communicationSafetySendingRestricted"];

    v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isCommunicationSafetyReceivingRestricted]);
    [v4 setObject:v13 forKeyedSubscript:@"communicationSafetyReceivingRestricted"];

    id v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isCommunicationSafetyNotificationEnabled]);
    [v4 setObject:v14 forKeyedSubscript:@"communicationSafetyNotification"];

    id v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isCommunicationSafetyAnalyticsEnabled]);
    [v4 setObject:v15 forKeyedSubscript:@"communicationSafetyAnalytics"];

    id v8 = v4;
  }

  return v8;
}

- (id)_fetchFamilySettingsMatchingAppleID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = +[STCoreUser fetchRequestMatchingAppleID:v3];

  uint64_t v17 = 0;
  id v6 = [v5 execute:&v17];
  id v7 = v6;
  id v8 = 0;
  if (!v17)
  {
    uint64_t v9 = [v6 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 familyMemberType];
    v11 = (void *)v10;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = @"nil";
    }
    [v4 setObject:v12 forKeyedSubscript:@"memberType"];

    v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isParent]);
    [v4 setObject:v13 forKeyedSubscript:@"isParent"];

    id v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isFamilyOrganizer]);
    [v4 setObject:v14 forKeyedSubscript:@"isFamilyOrganizer"];

    id v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 canSetUpFamily]);
    [v4 setObject:v15 forKeyedSubscript:@"canSetupFamily"];

    id v8 = v4;
  }

  return v8;
}

- (id)_convertDateToString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_opt_new();
    v5 = [v4 stringFromDate:v3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end