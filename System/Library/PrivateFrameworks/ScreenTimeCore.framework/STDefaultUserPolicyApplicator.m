@interface STDefaultUserPolicyApplicator
- (BOOL)_needToApplyDefaultUserPolicy:(int64_t)a3 user:(id)a4 organizationSettings:(id)a5;
- (int64_t)_applyDefaultUserPolicy:(int64_t)a3 user:(id)a4 organizationSettings:(id)a5 error:(id *)a6;
- (int64_t)applyDefaultUserPoliciesToUser:(id)a3 error:(id *)a4;
- (int64_t)applyDefaultUserPoliciesWithError:(id *)a3;
@end

@implementation STDefaultUserPolicyApplicator

- (int64_t)applyDefaultUserPoliciesWithError:(id *)a3
{
  v5 = +[STCoreUser fetchRequestMatchingLocalUser];
  v6 = [v5 execute:a3];
  v7 = [v6 firstObject];

  if (v7)
  {
    int64_t v8 = [(STDefaultUserPolicyApplicator *)self applyDefaultUserPoliciesToUser:v7 error:a3];
  }
  else if (a3)
  {
    if (*a3)
    {
      v9 = +[STLog defaultUserPolicyApplicator];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100265450((uint64_t *)a3, v9);
      }
    }
    +[NSError errorWithDomain:STErrorDomain code:10 userInfo:0];
    int64_t v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)applyDefaultUserPoliciesToUser:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 managedObjectContext];

  if (!v7)
  {
    v35 = +[NSAssertionHandler currentHandler];
    [v35 handleFailureInMethod:a2, self, @"STDefaultUserPolicyApplicator.m", 33, @"Invalid parameter not satisfying: %@", @"user.managedObjectContext" object file lineNumber description];
  }
  int64_t v8 = [v6 unmodeledManagingOrganizationSettings];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 localSettings];
  }
  v11 = v10;

  v12 = [v6 managingOrganization];

  if (!v12)
  {
    v13 = +[STLog defaultUserPolicyApplicator];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Missing managing organization, using local", buf, 2u);
    }
  }
  v14 = +[STLog defaultUserPolicyApplicator];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v6 familyMemberType];
    v16 = [v6 managingOrganization];
    v17 = [v16 entity];
    v18 = [v17 managedObjectClassName];
    v19 = [v6 dsid];
    *(_DWORD *)buf = 138543874;
    CFStringRef v45 = v15;
    __int16 v46 = 2112;
    v47 = v18;
    __int16 v48 = 2114;
    v49 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Applying default user policies to %{public}@'s %@ (%{public}@)", buf, 0x20u);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = [&off_10030FFD8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v38;
    int64_t v23 = 1;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(&off_10030FFD8);
        }
        v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (-[STDefaultUserPolicyApplicator _needToApplyDefaultUserPolicy:user:organizationSettings:](self, "_needToApplyDefaultUserPolicy:user:organizationSettings:", [v25 unsignedIntValue], v6, v11))
        {
          int64_t v23 = -[STDefaultUserPolicyApplicator _applyDefaultUserPolicy:user:organizationSettings:error:](self, "_applyDefaultUserPolicy:user:organizationSettings:error:", [v25 unsignedIntValue], v6, v11, a4);
          v26 = +[STLog defaultUserPolicyApplicator];
          v27 = v26;
          if (v23 == 2)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v28 = [v25 unsignedIntValue] - 1;
              CFStringRef v29 = @"STDefaultUserPolicyNone";
              if (v28 <= 3) {
                CFStringRef v29 = off_1002FE018[v28];
              }
              *(_DWORD *)buf = 138543362;
              CFStringRef v45 = v29;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "\tApplied %{public}@", buf, 0xCu);
            }
            int64_t v23 = 2;
          }
          else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            sub_1002654CC(v41, v25, &v42, v27);
          }
        }
      }
      id v21 = [&off_10030FFD8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v21);
  }
  else
  {
    int64_t v23 = 1;
  }
  v30 = [v6 managedObjectContext];
  unsigned int v31 = [v30 hasChanges];

  if (v31)
  {
    v32 = [v6 managedObjectContext];
    unsigned int v33 = [v32 save:a4];

    if (!v33) {
      int64_t v23 = 0;
    }
  }

  return v23;
}

- (BOOL)_needToApplyDefaultUserPolicy:(int64_t)a3 user:(id)a4 organizationSettings:(id)a5
{
  id v7 = a4;
  if (((unint64_t)[a5 defaultUserPolicies] & a3) != 0)
  {
    int64_t v8 = +[STLog defaultUserPolicyApplicator];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 3) {
        CFStringRef v9 = @"STDefaultUserPolicyNone";
      }
      else {
        CFStringRef v9 = off_1002FE018[a3 - 1];
      }
      int v14 = 138543362;
      CFStringRef v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "\t%{public}@ already applied", (uint8_t *)&v14, 0xCu);
    }

    goto LABEL_11;
  }
  if (a3 == 4)
  {
    id v10 = [v7 unmodeledManagingOrganizationSettings];
    v12 = [v7 cloudSettings];
    unsigned __int8 v11 = v10 == v12;

    goto LABEL_13;
  }
  if (a3 == 1)
  {
    id v10 = [v7 familyMemberType];
    unsigned __int8 v11 = [v10 isEqualToString:STFamilyMemberTypeChild];
LABEL_13:

    goto LABEL_14;
  }
LABEL_11:
  unsigned __int8 v11 = 0;
LABEL_14:

  return v11;
}

- (int64_t)_applyDefaultUserPolicy:(int64_t)a3 user:(id)a4 organizationSettings:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [v10 valueForKey:@"organization"];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v9 managingOrganization];
  }
  int v14 = v13;

  if (a3 == 4)
  {
    if (_os_feature_enabled_impl())
    {
      id v22 = [v9 screenTimeEnabled];
      int64_t v23 = [v9 cloudSettings];
      [v23 setIsAppAndWebsiteActivityEnabled:v22];
    }
  }
  else if (a3 == 1)
  {
    CFStringRef v15 = [v9 dsid];
    uint64_t v16 = STBlueprintTypeRestrictions;
    v17 = +[STBlueprint fetchRequestMatchingBlueprintsForUserWithDSID:v15 ofType:STBlueprintTypeRestrictions fromOrganization:v14];
    id v71 = 0;
    v18 = [v17 execute:&v71];
    id v19 = v71;

    if (v19)
    {
      if (a6) {
        *a6 = v19;
      }
      id v20 = +[STLog defaultUserPolicyApplicator];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10026555C(v20);
      }

      int64_t v21 = 0;
      goto LABEL_46;
    }
    uint64_t v61 = v16;
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [v9 setScreenTimeEnabled:1];
    }
    [v10 setIsCommunicationSafetySendingRestricted:1];
    [v10 setIsCommunicationSafetyReceivingRestricted:1];
    [v10 setIsEyeReliefEnabled:1];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v24 = v18;
    id v25 = [v24 countByEnumeratingWithState:&v67 objects:v73 count:16];
    uint64_t v26 = STBlueprintConfigurationTypeSystemWebContentFilterBasic;
    v60 = v14;
    v62 = v24;
    uint64_t v27 = v16;
    id v58 = v25;
    if (v25)
    {
      uint64_t v28 = *(void *)v68;
      uint64_t v57 = *(void *)v68;
      while (2)
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v68 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v59 = v29;
          v30 = *(void **)(*((void *)&v67 + 1) + 8 * v29);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          unsigned int v31 = [v30 configurations];
          id v32 = [v31 countByEnumeratingWithState:&v63 objects:v72 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v64;
LABEL_23:
            uint64_t v35 = 0;
            while (1)
            {
              if (*(void *)v64 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v63 + 1) + 8 * v35);
              long long v37 = [v36 type];
              unsigned __int8 v38 = [v37 isEqualToString:v26];

              if (v38) {
                break;
              }
              if (v33 == (id)++v35)
              {
                id v33 = [v31 countByEnumeratingWithState:&v63 objects:v72 count:16];
                a3 = 1;
                if (v33) {
                  goto LABEL_23;
                }
                goto LABEL_29;
              }
            }
            id v39 = v36;

            id v24 = v62;
            a3 = 1;
            uint64_t v27 = v61;
            if (!v39) {
              goto LABEL_34;
            }
            long long v40 = [v39 cemConfiguration];
            goto LABEL_37;
          }
LABEL_29:

          uint64_t v29 = v59 + 1;
          uint64_t v27 = v61;
          id v24 = v62;
          uint64_t v28 = v57;
        }
        while ((id)(v59 + 1) != v58);
        id v58 = [v62 countByEnumeratingWithState:&v67 objects:v73 count:16];
        if (v58) {
          continue;
        }
        break;
      }
    }

LABEL_34:
    v41 = +[STBlueprintConfiguration cemConfigurationIdentifierWithType:v26 forUser:v9];
    long long v40 = +[CEMSystemBasicWebContentFilterDeclaration buildRequiredOnlyWithIdentifier:v41 withRestrictWeb:&__kCFBooleanTrue];
    CFStringRef v42 = [v24 firstObject];
    if (!v42)
    {
      CFStringRef v42 = +[STBlueprint createBlueprintWithType:v27 user:v9];
      [v42 setOrganization:v60];
    }
    id v43 = objc_alloc((Class)STBlueprintConfiguration);
    v44 = [v9 managedObjectContext];
    id v39 = [v43 initWithContext:v44];

    [v39 setType:v26];
    CFStringRef v45 = [v9 contentPrivacyConfigurationIdentifierForType:v26];
    [v39 setIdentifier:v45];

    [v39 setBlueprint:v42];
LABEL_37:
    uint64_t v46 = [v39 cemConfiguration];
    int v14 = v60;
    if (!v46
      || (v47 = (void *)v46,
          [v40 payloadRestrictWeb],
          __int16 v48 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v49 = [v48 BOOLValue],
          v48,
          v47,
          (v49 & 1) == 0))
    {
      [v40 setPayloadUseContentFilter:&__kCFBooleanTrue];
      [v40 setPayloadRestrictWeb:&__kCFBooleanTrue];
      [v40 setPayloadWhiteListEnabled:&__kCFBooleanFalse];
      [v40 updateServerHash];
      [v39 setCemConfiguration:v40];
      v50 = [v39 blueprint];
      [v50 setIsDirty:1];
    }
    v51 = [v39 blueprint];
    unsigned __int8 v52 = [v51 enabled];

    if ((v52 & 1) == 0)
    {
      v53 = [v39 blueprint];
      [v53 setEnabled:1];

      v54 = [v39 blueprint];
      [v54 setIsDirty:1];
    }
  }
  objc_msgSend(v10, "setDefaultUserPolicies:", (unint64_t)objc_msgSend(v10, "defaultUserPolicies") | a3);
  id v55 = [v9 familySettings];

  if (v55 == v10)
  {
    id v19 = [v9 familySettings];
    [v19 setIsDirty:1];
    int64_t v21 = 2;
LABEL_46:

    goto LABEL_47;
  }
  int64_t v21 = 2;
LABEL_47:

  return v21;
}

@end