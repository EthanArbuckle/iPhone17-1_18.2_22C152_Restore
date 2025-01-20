@interface MCNewRestrictionsPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
@end

@implementation MCNewRestrictionsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = [(MCNewPayloadHandler *)self payload];
  v10 = [v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
  unsigned __int8 v11 = [v10 BOOLValue];

  v12 = [v9 restrictions];
  if (v11) {
    goto LABEL_2;
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:MCFeatureManagedWriteUnmanagedContactsAllowed withRestrictionsDictionary:v12] == 1)
  {
LABEL_15:
    id v23 = +[MCInstaller notInstalledByMDMError];
    goto LABEL_36;
  }
  v24 = +[MCRestrictionManager intersectedValuesForFeature:MCFeatureAllowedExternalIntelligenceWorkspaceIDs withRestrictionsDictionary:v12];
  if (v24)
  {

    goto LABEL_15;
  }
  if (+[MCRestrictionManager restrictedBoolForFeature:MCFeatureUnmanagedReadManagedContactsAllowed withRestrictionsDictionary:v12] == 1)goto LABEL_15; {
LABEL_2:
  }
  v13 = MCEffectiveSingleAppModeBundleID();
  if (v13)
  {
    v14 = +[MCRestrictionManager intersectedValuesForFeature:MCFeatureAppLockBundleIDs withRestrictionsDictionary:v12];
    v15 = v14;
    if (v14 && ([v14 containsObject:v13] & 1) == 0)
    {
      uint64_t v31 = MCRestrictionsErrorDomain;
      MCErrorArray();
      v65 = self;
      v32 = a6;
      v33 = v15;
      v35 = id v34 = v8;
      v36 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v31, 3002, v35, MCErrorTypeFatal, v13, 0);
      id v23 = [v36 MCCopyAsPrimaryError];

      id v8 = v34;
      v15 = v33;
      a6 = v32;
      self = v65;
    }
    else
    {
      v16 = +[MCRestrictionManager unionValuesForFeature:MCFeatureBlacklistedAppBundleIDs withRestrictionsDictionary:v12];
      v66 = v16;
      if ([v16 containsObject:v13])
      {
        uint64_t v17 = MCRestrictionsErrorDomain;
        MCErrorArray();
        v63 = self;
        v18 = a6;
        v19 = v15;
        v21 = id v20 = v8;
        v22 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v17, 3003, v21, MCErrorTypeFatal, v13, 0);
        id v23 = [v22 MCCopyAsPrimaryError];

        v16 = v66;
        id v8 = v20;
        v15 = v19;
        a6 = v18;
        self = v63;
      }
      else
      {
        id v64 = v8;
        v25 = +[MCRestrictionManager unionValuesForFeature:MCFeatureBlockedAppBundleIDs withRestrictionsDictionary:v12];
        if ([v25 containsObject:v13])
        {
          v26 = v25;
          uint64_t v27 = MCRestrictionsErrorDomain;
          MCErrorArray();
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = v27;
          v25 = v26;
          v30 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v29, 3003, v28, MCErrorTypeFatal, v13, 0);
          id v23 = [v30 MCCopyAsPrimaryError];

          v16 = v66;
        }
        else
        {
          +[MCRestrictionManager explicitlyRestrictedAppsBySetting];
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          id v23 = [v28 countByEnumeratingWithState:&v67 objects:v75 count:16];
          if (v23)
          {
            v59 = a6;
            v61 = v25;
            v58 = v15;
            uint64_t v37 = *(void *)v68;
            while (2)
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v68 != v37) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v39 = *(void *)(*((void *)&v67 + 1) + 8 * i);
                v40 = [v28 objectForKeyedSubscript:v39];
                if ([v40 containsObject:v13]
                  && +[MCRestrictionManager restrictedBoolForFeature:v39 withRestrictionsDictionary:v12] == 2)
                {
                  uint64_t v41 = MCRestrictionsErrorDomain;
                  v42 = MCErrorArray();
                  v43 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v41, 3004, v42, MCErrorTypeFatal, v13, 0);
                  id v23 = [v43 MCCopyAsPrimaryError];

                  goto LABEL_27;
                }
              }
              id v23 = [v28 countByEnumeratingWithState:&v67 objects:v75 count:16];
              if (v23) {
                continue;
              }
              break;
            }
LABEL_27:
            v15 = v58;
            a6 = v59;
            v16 = v66;
            v25 = v61;
          }

          if ([v13 isEqualToString:MCFindMyBundleIdentifier]
            && +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", MCFeatureFindMyDeviceAllowed, v12) == 2&& +[MCRestrictionManager restrictedBoolForFeature:MCFeatureFindMyFriendsAllowed withRestrictionsDictionary:v12] == 2)
          {
            v62 = v25;
            uint64_t v44 = MCRestrictionsErrorDomain;
            v45 = MCErrorArray();
            v46 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v44, 3004, v45, MCErrorTypeFatal, v13, 0);
            id v60 = [v46 MCCopyAsPrimaryError];

            v25 = v62;
            v16 = v66;
            id v23 = v60;
          }
        }

        id v8 = v64;
      }
    }
  }
  else
  {
    id v23 = 0;
  }

LABEL_36:
  if (v23)
  {
    uint64_t v47 = MCInstallationErrorDomain;
    v48 = [(MCNewPayloadHandler *)self payload];
    v49 = [v48 friendlyName];
    v50 = MCErrorArray();
    v51 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v47, 4001, v50, v23, MCErrorTypeFatal, v49, 0);

    if (a6) {
      *a6 = v51;
    }
    os_log_t v52 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v53 = v52;
      v54 = [(MCNewPayloadHandler *)self payload];
      v55 = [v54 friendlyName];
      v56 = [v51 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v72 = v55;
      __int16 v73 = 2114;
      v74 = v56;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Cannot install restrictions payload “%{public}@”. Error: %{public}@", buf, 0x16u);
    }
  }

  return v23 == 0;
}

- (BOOL)isInstalled
{
  char v8 = 0;
  v2 = [(MCNewPayloadHandler *)self payload];
  v3 = [v2 restrictions];
  v4 = +[MCRestrictionManagerWriter sharedManager];
  v5 = [v4 currentRestrictions];
  id v6 = +[MCRestrictionManagerWriter restrictionsAfterApplyingRestrictionsDictionary:v3 toRestrictionsDictionary:v5 outChangeDetected:&v8 outError:0];

  return v8 == 0;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)MCNewRestrictionsPayloadHandler;
  id v5 = a4;
  id v6 = a3;
  [(MCNewPayloadHandler *)&v18 didInstallOldGlobalRestrictions:v6 newGlobalRestrictions:v5];
  uint64_t v7 = MCRestrictedBoolKey;
  char v8 = [v6 objectForKey:MCRestrictedBoolKey, v18.receiver, v18.super_class];

  uint64_t v9 = MCFeaturePredictiveKeyboardAllowed;
  v10 = [v8 objectForKey:MCFeaturePredictiveKeyboardAllowed];

  uint64_t v11 = MCRestrictedBoolValueKey;
  v12 = [v10 objectForKey:MCRestrictedBoolValueKey];
  v13 = [v5 objectForKey:v7];

  v14 = [v13 objectForKey:v9];

  uint64_t v15 = [v14 objectForKey:v11];
  v16 = (void *)v15;
  if (!v12)
  {
    if (!v15) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ([v12 BOOLValue]) {
    BOOL v17 = v16 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
LABEL_9:
    if (([v16 BOOLValue] & 1) == 0) {
      MCSendKeyboardSettingsChangedNotification();
    }
  }
LABEL_11:
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)MCNewRestrictionsPayloadHandler;
  id v5 = a4;
  id v6 = a3;
  [(MCNewPayloadHandler *)&v16 didRemoveOldGlobalRestrictions:v6 newGlobalRestrictions:v5];
  uint64_t v7 = MCRestrictedBoolKey;
  char v8 = [v6 objectForKey:MCRestrictedBoolKey v16.receiver, v16.super_class];

  uint64_t v9 = MCFeaturePredictiveKeyboardAllowed;
  v10 = [v8 objectForKey:MCFeaturePredictiveKeyboardAllowed];

  uint64_t v11 = MCRestrictedBoolValueKey;
  v12 = [v10 objectForKey:MCRestrictedBoolValueKey];
  v13 = [v5 objectForKey:v7];

  v14 = [v13 objectForKey:v9];

  uint64_t v15 = [v14 objectForKey:v11];
  if (v12
    && ([v12 BOOLValue] & 1) == 0
    && (!v15 || [v15 BOOLValue]))
  {
    MCSendKeyboardSettingsChangedNotification();
  }
}

@end