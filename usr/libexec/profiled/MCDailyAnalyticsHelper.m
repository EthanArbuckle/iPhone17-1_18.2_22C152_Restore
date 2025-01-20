@interface MCDailyAnalyticsHelper
+ (id)_allFalseSettingsKeys;
+ (id)_allPayloadCountKeys;
+ (id)_allTrueSettingsKeys;
+ (id)_falseRestrictionsDictionary;
+ (id)_falseSettingsDictionary;
+ (id)_getCounterDictionaryFromKeySet:(id)a3;
+ (id)_intersectionRestrictionsDictionary;
+ (id)_objectRestrictionsDictionary;
+ (id)_payloadCountDictionary;
+ (id)_trueRestrictionsDictionary;
+ (id)_trueSettingsDictionary;
+ (id)_valueRestrictionsDictionary;
+ (void)addCloudConfigInfoWithEventPayload:(id)a3;
+ (void)addMDMConfigInfoWithEventPayload:(id)a3;
+ (void)addPasscodeInfoWithEventPayload:(id)a3;
+ (void)addProfileAndPayloadInfoWithEventPayload:(id)a3;
+ (void)addRestrictionInfoWithEventPayload:(id)a3;
+ (void)addSettingsInfoWithEventPayload:(id)a3;
+ (void)addSharediPadInfoWithEventPayload:(id)a3;
@end

@implementation MCDailyAnalyticsHelper

+ (void)addCloudConfigInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v6 = +[MDMCloudConfiguration sharedConfiguration];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isSupervised]);
  [v3 setObject:v4 forKeyedSubscript:@"isSupervised"];

  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isTeslaEnrolled]);
  [v3 setObject:v5 forKeyedSubscript:@"isDEP"];
}

+ (void)addMDMConfigInfoWithEventPayload:(id)a3
{
  id v15 = a3;
  v4 = +[MDMConfiguration sharedConfiguration];
  v5 = [v4 memberQueueManagingProfileIdentifier];
  BOOL v6 = v5 != 0;

  v7 = +[NSNumber numberWithBool:v6];
  [v15 setObject:v7 forKeyedSubscript:@"isMDMEnrolled"];

  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isUserEnrollment]);
  [v15 setObject:v8 forKeyedSubscript:@"isUserEnrollment"];

  v9 = [v4 personaID];
  v10 = +[NSNumber numberWithBool:v9 != 0];
  [v15 setObject:v10 forKeyedSubscript:@"isDataSeparated"];

  v11 = [v4 enrollmentMode];
  unsigned __int8 v12 = [v11 isEqualToString:kMDMEnrollmentModeBYOD];
  if (v12)
  {
    uint64_t v13 = 1;
  }
  else
  {
    id v3 = [v4 enrollmentMode];
    uint64_t v13 = (uint64_t)[v3 isEqualToString:kMDMEnrollmentModeADDE];
  }
  v14 = +[NSNumber numberWithBool:v13];
  [v15 setObject:v14 forKeyedSubscript:@"isAccountDrivenEnrollment"];

  if ((v12 & 1) == 0) {
}
  }

+ (void)addSharediPadInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[DMCMultiUserModeUtilities isSharediPad]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"isSharediPad"];
}

+ (void)addProfileAndPayloadInfoWithEventPayload:(id)a3
{
  id v33 = a3;
  id v4 = +[MCManifest sharedManifest];
  id v34 = objc_alloc_init((Class)MCProfileTrustEvaluator);
  id v5 = objc_alloc((Class)NSSet);
  BOOL v6 = [v4 identifiersOfProfilesWithFilterFlags:2];
  id v37 = [v5 initWithArray:v6];

  v7 = +[MCDailyAnalyticsHelper _payloadCountDictionary];
  v8 = [a1 _allPayloadCountKeys];
  v9 = [a1 _getCounterDictionaryFromKeySet:v8];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v39 = v4;
  id obj = [v4 allInstalledProfileIdentifiers];
  id v40 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  uint64_t v10 = 0;
  if (v40)
  {
    unsigned int v36 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v38 = *(void *)v53;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        id v15 = [v39 installedProfileWithIdentifier:v14];
        if (v15)
        {
          int v46 = v11;
          int v47 = v10;
          int v45 = v12;
          v44 = i;
          unsigned int v42 = [v37 containsObject:v14];
          if ([v15 isSigned])
          {
            v16 = [v15 signerCertificates];
            unsigned int v17 = [v34 sanitizedProfileSignerCertificateChainIsAllowedToWriteDefaults:v16];

            v36 += v17;
          }
          unsigned int v41 = [v15 isEncrypted];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v43 = v15;
          v18 = [v15 payloads];
          id v19 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v49;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v49 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) type];
                v24 = [v7 objectForKeyedSubscript:v23];

                if (v24)
                {
                  v25 = [v9 objectForKeyedSubscript:v24];

                  if (v25)
                  {
                    v26 = [v9 objectForKeyedSubscript:v24];
                    v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v26 unsignedIntValue] + 1);
                    [v9 setObject:v27 forKeyedSubscript:v24];
                  }
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v20);
          }
          uint64_t v12 = (v45 + 1);
          uint64_t v11 = v46 + v42;
          uint64_t v10 = v47 + v41;

          id v15 = v43;
          i = v44;
        }
      }
      id v40 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v40);
  }
  else
  {
    unsigned int v36 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }

  v28 = +[NSNumber numberWithUnsignedInt:v12];
  [v33 setObject:v28 forKeyedSubscript:@"profile_count"];

  v29 = +[NSNumber numberWithUnsignedInt:v11];
  [v33 setObject:v29 forKeyedSubscript:@"profile_count_carrier"];

  v30 = +[NSNumber numberWithUnsignedInt:v10];
  [v33 setObject:v30 forKeyedSubscript:@"profile_count_encrypted"];

  v31 = +[NSNumber numberWithUnsignedInt:v36];
  [v33 setObject:v31 forKeyedSubscript:@"profile_count_signed"];

  v32 = +[NSNumber numberWithUnsignedInt:v36];
  [v33 setObject:v32 forKeyedSubscript:@"profile_count_signedByApple"];

  [v33 addEntriesFromDictionary:v9];
}

+ (void)addRestrictionInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v4 = +[MCRestrictionManager sharedManager];
  id v5 = [v4 combinedProfileRestrictions];

  BOOL v6 = +[MCDailyAnalyticsHelper _falseRestrictionsDictionary];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100041998;
  v33[3] = &unk_1000EBA10;
  id v7 = v5;
  id v34 = v7;
  id v8 = v3;
  id v35 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v33];
  v9 = +[MCDailyAnalyticsHelper _trueRestrictionsDictionary];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100041A2C;
  v30[3] = &unk_1000EBA10;
  id v10 = v7;
  id v31 = v10;
  id v11 = v8;
  id v32 = v11;
  [v9 enumerateKeysAndObjectsUsingBlock:v30];
  uint64_t v12 = +[MCDailyAnalyticsHelper _objectRestrictionsDictionary];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100041AC0;
  v27[3] = &unk_1000EBA10;
  id v13 = v10;
  id v28 = v13;
  id v14 = v11;
  id v29 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v27];
  id v15 = +[MCDailyAnalyticsHelper _intersectionRestrictionsDictionary];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100041B68;
  v24[3] = &unk_1000EBA10;
  id v16 = v13;
  id v25 = v16;
  id v17 = v14;
  id v26 = v17;
  [v15 enumerateKeysAndObjectsUsingBlock:v24];
  v18 = +[MCDailyAnalyticsHelper _valueRestrictionsDictionary];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100041C10;
  v21[3] = &unk_1000EBA10;
  id v22 = v16;
  id v23 = v17;
  id v19 = v17;
  id v20 = v16;
  [v18 enumerateKeysAndObjectsUsingBlock:v21];
}

+ (void)addSettingsInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v4 = +[MCRestrictionManager sharedManager];
  id v5 = [v4 userSettings];

  id v23 = +[MCDailyAnalyticsHelper _falseSettingsDictionary];
  +[MCDailyAnalyticsHelper _allFalseSettingsKeys];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v11 = [v23 objectForKeyedSubscript:v10];
        if (+[MCRestrictionManager BOOLSettingForFeature:v11 withUserSettingDictionary:v5] == 2)uint64_t v12 = &__kCFBooleanTrue; {
        else
        }
          uint64_t v12 = &__kCFBooleanFalse;
        [v3 setObject:v12 forKeyedSubscript:v10];
      }
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }
  id v13 = +[MCDailyAnalyticsHelper _trueSettingsDictionary];
  +[MCDailyAnalyticsHelper _allTrueSettingsKeys];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v27 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
        id v20 = [v13 objectForKeyedSubscript:v19];
        if (+[MCRestrictionManager BOOLSettingForFeature:v20 withUserSettingDictionary:v5] == 1)uint64_t v21 = &__kCFBooleanTrue; {
        else
        }
          uint64_t v21 = &__kCFBooleanFalse;
        [v3 setObject:v21 forKeyedSubscript:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }
}

+ (void)addPasscodeInfoWithEventPayload:(id)a3
{
  id v3 = a3;
  id v12 = +[MCPasscodeManager sharedManager];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 isPasscodeSet]);
  [v3 setObject:v4 forKeyedSubscript:@"passcode_hasPasscode"];

  id v5 = +[MCRestrictionManager sharedManager];
  id v6 = [v5 currentRestrictions];
  id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MCPasscodeManager restrictionsEnforcePasscodePolicy:v6]);
  [v3 setObject:v7 forKeyedSubscript:@"passcode_hasPasscodePolicy"];

  uint64_t v8 = +[NSNumber numberWithBool:MCKeybagMementoBlobExists()];
  [v3 setObject:v8 forKeyedSubscript:@"passcode_hasRecoveryPasscode"];

  v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 currentUnlockScreenType]);
  [v3 setObject:v9 forKeyedSubscript:@"passcode_unlockScreenType"];

  uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 currentUnlockSimplePasscodeType]);
  [v3 setObject:v10 forKeyedSubscript:@"passcode_simpleType"];

  id v11 = +[NSNumber numberWithBool:MCKeybagMementoSupported()];
  [v3 setObject:v11 forKeyedSubscript:@"passcode_supportsPasscodeRecovery"];
}

+ (id)_allPayloadCountKeys
{
  if (qword_1001058D0 != -1) {
    dispatch_once(&qword_1001058D0, &stru_1000EBA30);
  }
  v2 = (void *)qword_1001058C8;

  return v2;
}

+ (id)_payloadCountDictionary
{
  if (qword_1001058E0 != -1) {
    dispatch_once(&qword_1001058E0, &stru_1000EBA50);
  }
  v2 = (void *)qword_1001058D8;

  return v2;
}

+ (id)_falseRestrictionsDictionary
{
  if (qword_1001058F0 != -1) {
    dispatch_once(&qword_1001058F0, &stru_1000EBA70);
  }
  v2 = (void *)qword_1001058E8;

  return v2;
}

+ (id)_trueRestrictionsDictionary
{
  if (qword_100105900 != -1) {
    dispatch_once(&qword_100105900, &stru_1000EBA90);
  }
  v2 = (void *)qword_1001058F8;

  return v2;
}

+ (id)_objectRestrictionsDictionary
{
  if (qword_100105910 != -1) {
    dispatch_once(&qword_100105910, &stru_1000EBAB0);
  }
  v2 = (void *)qword_100105908;

  return v2;
}

+ (id)_intersectionRestrictionsDictionary
{
  if (qword_100105920 != -1) {
    dispatch_once(&qword_100105920, &stru_1000EBAD0);
  }
  v2 = (void *)qword_100105918;

  return v2;
}

+ (id)_valueRestrictionsDictionary
{
  if (qword_100105930 != -1) {
    dispatch_once(&qword_100105930, &stru_1000EBAF0);
  }
  v2 = (void *)qword_100105928;

  return v2;
}

+ (id)_allFalseSettingsKeys
{
  if (qword_100105940 != -1) {
    dispatch_once(&qword_100105940, &stru_1000EBB10);
  }
  v2 = (void *)qword_100105938;

  return v2;
}

+ (id)_falseSettingsDictionary
{
  if (qword_100105950 != -1) {
    dispatch_once(&qword_100105950, &stru_1000EBB30);
  }
  v2 = (void *)qword_100105948;

  return v2;
}

+ (id)_allTrueSettingsKeys
{
  if (qword_100105960 != -1) {
    dispatch_once(&qword_100105960, &stru_1000EBB50);
  }
  v2 = (void *)qword_100105958;

  return v2;
}

+ (id)_trueSettingsDictionary
{
  if (qword_100105970 != -1) {
    dispatch_once(&qword_100105970, &stru_1000EBB70);
  }
  v2 = (void *)qword_100105968;

  return v2;
}

+ (id)_getCounterDictionaryFromKeySet:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 setObject:&off_1000F5200 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

@end