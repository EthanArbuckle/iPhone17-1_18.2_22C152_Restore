@interface DMDInstallConfigurationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (NSSet)excludedBoolRestrictions;
+ (id)_intersectionAliasToFeatures;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)_installProfile:(id)a3 withRequest:(id)a4 error:(id *)a5;
- (BOOL)_installRestrictionsPayload:(id)a3 withRequest:(id)a4 error:(id *)a5;
- (id)_applyHeuristicsToRestrictions:(id)a3 error:(id *)a4;
- (id)_intersectionFeatureForPayloadRestrictionKey:(id)a3;
- (id)_mapMCRestrictionsFromPayload:(id)a3 error:(id *)a4;
- (unint64_t)queueGroup;
- (void)_rollbackProfile:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInstallConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2E88;
}

- (unint64_t)queueGroup
{
  return 1;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDInstallConfigurationOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 profile];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.profile";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

+ (NSSet)excludedBoolRestrictions
{
  if (qword_1000FBB10 != -1) {
    dispatch_once(&qword_1000FBB10, &stru_1000CB248);
  }
  uint64_t v2 = (void *)qword_1000FBB08;

  return (NSSet *)v2;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 profile];
  id v6 = [v5 objectForKeyedSubscript:@"PayloadContent"];

  if ([v6 count] == (id)1)
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [v7 objectForKeyedSubscript:@"PayloadType"];
    unsigned int v9 = [v8 isEqualToString:@"com.apple.applicationaccess"];

    if (!v9)
    {
      id v15 = [v4 profile];
      objc_super v10 = 0;
      goto LABEL_9;
    }
    objc_super v10 = [v6 objectAtIndexedSubscript:0];
  }
  else
  {
    if ([v6 count] == (id)2)
    {
      uint64_t v11 = [v4 profile];
      id v12 = [v11 mutableCopy];

      v13 = [v6 objectAtIndexedSubscript:0];
      v29 = v13;
      v14 = +[NSArray arrayWithObjects:&v29 count:1];
      [v12 setObject:v14 forKeyedSubscript:@"PayloadContent"];

      id v15 = [v12 copy];
      objc_super v10 = [v6 objectAtIndexedSubscript:1];

      goto LABEL_9;
    }
    objc_super v10 = 0;
  }
  id v15 = 0;
LABEL_9:
  id v26 = 0;
  unsigned __int8 v16 = [(DMDInstallConfigurationOperation *)self _installProfile:v15 withRequest:v4 error:&v26];
  id v17 = v26;
  id v18 = v17;
  if (v16)
  {
    id v25 = v17;
    unsigned __int8 v19 = [(DMDInstallConfigurationOperation *)self _installRestrictionsPayload:v10 withRequest:v4 error:&v25];
    id v20 = v25;

    if (v19)
    {
      [(DMDInstallConfigurationOperation *)self endOperationWithResultObject:0];
      id v18 = v20;
    }
    else
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10004E3B0;
      v23[3] = &unk_1000C9B78;
      v23[4] = self;
      id v24 = v20;
      id v18 = v20;
      [(DMDInstallConfigurationOperation *)self _rollbackProfile:v15 withRequest:v4 completion:v23];
    }
  }
  else if (v17)
  {
    NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
    id v28 = v17;
    v21 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v22 = DMFErrorWithCodeAndUserInfo();
    [(DMDInstallConfigurationOperation *)self endOperationWithError:v22];
  }
  else
  {
    DMFErrorWithCodeAndUserInfo();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    [(DMDInstallConfigurationOperation *)self endOperationWithError:v18];
  }
}

- (BOOL)_installProfile:(id)a3 withRequest:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    id v28 = 0;
    unsigned int v9 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:&v28];
    id v10 = v28;
    if (!v9)
    {
      v14 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100085314(v10);
      }

      if (a5)
      {
        id v15 = v10;
        BOOL v13 = 0;
        *a5 = v15;
      }
      else
      {
        BOOL v13 = 0;
        id v15 = v10;
      }
      goto LABEL_19;
    }
    uint64_t v11 = +[MCProfileConnection sharedConnection];
    id v12 = [(DMDTaskOperation *)self context];
    if ([v12 runAsUser])
    {
    }
    else
    {
      unsigned __int8 v16 = [(DMDInstallConfigurationOperation *)self request];
      id v17 = [v16 type];

      if (v17 != (id)1)
      {
        uint64_t v18 = 1;
        goto LABEL_13;
      }
    }
    uint64_t v18 = 2;
LABEL_13:
    uint64_t v29 = kMCInstallProfileOptionInstallationType;
    unsigned __int8 v19 = +[NSNumber numberWithInteger:v18];
    v30 = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v21 = [v20 mutableCopy];

    v22 = [v8 managingProfileIdentifier];

    if (v22)
    {
      [v21 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM];
      v23 = [v8 managingProfileIdentifier];
      [v21 setObject:v23 forKeyedSubscript:kMCInstallProfileOptionManagingProfileIdentifier];
    }
    id v24 = [v21 copy];
    id v27 = v10;
    id v25 = [v11 installProfileData:v9 options:v24 outError:&v27];
    id v15 = v27;

    BOOL v13 = v25 != 0;
    if (a5 && !v25) {
      *a5 = v15;
    }

LABEL_19:
    goto LABEL_20;
  }
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (void)_rollbackProfile:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned int v9 = (void (**)(void, void))v8;
  if (a3)
  {
    id v10 = [a4 profile];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"PayloadIdentifier"];

    id v12 = +[MCProfileConnection sharedConnection];
    BOOL v13 = [v12 installedProfileWithIdentifier:v11];

    if (!v13)
    {
      uint64_t v21 = DMFProfileIdentifierErrorKey;
      v22 = v11;
      id v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      unsigned __int8 v16 = DMFErrorWithCodeAndUserInfo();
      ((void (**)(void, void *))v9)[2](v9, v16);

LABEL_11:
      goto LABEL_12;
    }
    v14 = [(DMDTaskOperation *)self context];
    if ([v14 runAsUser])
    {
    }
    else
    {
      id v17 = [(DMDInstallConfigurationOperation *)self request];
      id v18 = [v17 type];

      if (v18 != (id)1)
      {
        uint64_t v19 = 1;
        goto LABEL_10;
      }
    }
    uint64_t v19 = 2;
LABEL_10:
    id v20 = +[MCProfileConnection sharedConnection];
    [v20 removeProfileAsyncWithIdentifier:v11 installationType:v19 completion:v9];

    goto LABEL_11;
  }
  (*((void (**)(id, void))v8 + 2))(v8, 0);
LABEL_12:
}

- (BOOL)_installRestrictionsPayload:(id)a3 withRequest:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    id v33 = 0;
    unsigned int v9 = [(DMDInstallConfigurationOperation *)self _mapMCRestrictionsFromPayload:a3 error:&v33];
    id v10 = v33;
    id v11 = v10;
    if (v9)
    {
      id v32 = v10;
      id v12 = [(DMDInstallConfigurationOperation *)self _applyHeuristicsToRestrictions:v9 error:&v32];
      id v13 = v32;

      if (v12)
      {
        v14 = [v8 profile];
        id v15 = [v14 objectForKeyedSubscript:@"PayloadIdentifier"];
        unsigned __int8 v16 = +[NSString stringWithFormat:@"%@-restrictions", v15];

        id v17 = +[MCProfileConnection sharedConnection];
        id v31 = v13;
        unsigned __int8 v18 = [v17 applyRestrictionDictionary:v12 clientType:@"com.apple.dmd" clientUUID:v16 localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:0 outEffectiveSettingsChanged:0 outError:&v31];
        id v11 = v31;

        if (v18)
        {
          uint64_t v19 = MCFeatureMaximumAppsRating;
          id v20 = +[MCRestrictionManager valueForFeature:MCFeatureMaximumAppsRating withRestrictionsDictionary:v12];
          unsigned int v21 = [v20 intValue];
          uint64_t v22 = DMFAppRatingUnrated;
          if (v21 == [DMFAppRatingUnrated intValue])
          {
            v23 = +[MCProfileConnection sharedConnection];
            id v24 = [v23 userValueForSetting:v19];

            LODWORD(v23) = [v24 intValue];
            if (v23 == [DMFAppRatingAllApps intValue])
            {
              id v25 = +[MCProfileConnection sharedConnection];
              [v25 setValue:v22 forSetting:v19];
            }
          }
        }
        else
        {
          uint64_t v29 = DMFConfigurationEngineLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_1000854A0(v11);
          }

          if (a5) {
            *a5 = v11;
          }
        }

        goto LABEL_27;
      }
      id v28 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10008541C(v13);
      }

      if (!a5)
      {
        unsigned __int8 v18 = 0;
        id v11 = v13;
        goto LABEL_27;
      }
      id v27 = v13;
    }
    else
    {
      id v26 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100085398(v11);
      }

      if (!a5)
      {
        unsigned __int8 v18 = 0;
        goto LABEL_27;
      }
      id v27 = v11;
    }
    id v11 = v27;
    unsigned __int8 v18 = 0;
    *a5 = v11;
LABEL_27:

    goto LABEL_28;
  }
  unsigned __int8 v18 = 1;
LABEL_28:

  return v18;
}

- (id)_mapMCRestrictionsFromPayload:(id)a3 error:(id *)a4
{
  v65 = a4;
  id v86 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:4];
  uint64_t v5 = +[NSMutableDictionary dictionary];
  uint64_t v6 = +[NSMutableDictionary dictionary];
  uint64_t v7 = +[NSMutableDictionary dictionary];
  uint64_t v8 = +[NSMutableDictionary dictionary];
  uint64_t v9 = MCRestrictedBoolKey;
  v84 = (void *)v5;
  [v4 setObject:v5 forKeyedSubscript:MCRestrictedBoolKey];
  uint64_t v10 = MCRestrictedValueKey;
  v83 = (void *)v6;
  [v4 setObject:v6 forKeyedSubscript:MCRestrictedValueKey];
  uint64_t v11 = MCIntersectionKey;
  v77 = (void *)v7;
  [v4 setObject:v7 forKeyedSubscript:MCIntersectionKey];
  uint64_t v12 = MCUnionKey;
  v67 = v4;
  v72 = (void *)v8;
  [v4 setObject:v8 forKeyedSubscript:MCUnionKey];
  id v13 = +[MCRestrictionManager sharedManager];
  v14 = [v13 defaultRestrictions];

  id v15 = [v14 objectForKeyedSubscript:v9];
  v70 = [v14 objectForKeyedSubscript:v10];
  v69 = [v14 objectForKeyedSubscript:v11];
  v66 = v14;
  v68 = [v14 objectForKeyedSubscript:v12];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v15;
  id v16 = [obj countByEnumeratingWithState:&v107 objects:v132 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v108;
    uint64_t v19 = MCRestrictedBoolValueKey;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v108 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v107 + 1) + 8 * i);
        uint64_t v22 = +[DMDInstallConfigurationOperation excludedBoolRestrictions];
        unsigned __int8 v23 = [v22 containsObject:v21];

        if ((v23 & 1) == 0)
        {
          id v24 = [v86 objectForKey:v21];
          if (v24)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              uint64_t v130 = DMFInvalidParameterErrorKey;
              CFStringRef v131 = @"key";
              id v27 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
              DMFErrorWithCodeAndUserInfo();
              id v28 = (id)objc_claimAutoreleasedReturnValue();

              if (v28) {
                goto LABEL_76;
              }
              goto LABEL_17;
            }
            id v25 = [obj objectForKey:v21];
            id v26 = [v25 MCMutableDeepCopy];

            if (!v26) {
              id v26 = objc_alloc_init((Class)NSMutableDictionary);
            }
            [v26 setObject:v24 forKey:v19];
            [v84 setObject:v26 forKey:v21];
          }
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v107 objects:v132 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

LABEL_17:
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v29 = v70;
  id v30 = [v29 countByEnumeratingWithState:&v103 objects:v129 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v104;
    uint64_t v33 = MCRestrictedValueValueKey;
    while (2)
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v104 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void *)(*((void *)&v103 + 1) + 8 * (void)j);
        v36 = [v86 objectForKey:v35, v65];
        if (v36)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v127 = DMFInvalidParameterErrorKey;
            CFStringRef v128 = @"key";
            v39 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
            DMFErrorWithCodeAndUserInfo();
            id v28 = (id)objc_claimAutoreleasedReturnValue();

            if (v28) {
              goto LABEL_76;
            }
            goto LABEL_31;
          }
          v37 = [v29 objectForKey:v35];
          id v38 = [v37 MCMutableDeepCopy];

          if (!v38) {
            id v38 = objc_alloc_init((Class)NSMutableDictionary);
          }
          [v38 setObject:v36 forKey:v33];
          [v83 setObject:v38 forKey:v35];
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v103 objects:v129 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

LABEL_31:
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v78 = v69;
  id v81 = [v78 countByEnumeratingWithState:&v99 objects:v126 count:16];
  if (v81)
  {
    uint64_t v79 = *(void *)v100;
    uint64_t v71 = DMFInvalidParameterErrorKey;
    uint64_t v73 = MCIntersectionValuesKey;
    while (2)
    {
      for (k = 0; k != v81; k = (char *)k + 1)
      {
        if (*(void *)v100 != v79) {
          objc_enumerationMutation(v78);
        }
        uint64_t v41 = *(void *)(*((void *)&v99 + 1) + 8 * (void)k);
        v42 = [v86 objectForKeyedSubscript:v41, v65];
        if (v42)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v119 = v71;
            CFStringRef v120 = @"key";
            v51 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
            DMFErrorWithCodeAndUserInfo();
            id v28 = (id)objc_claimAutoreleasedReturnValue();

            if (v28) {
              goto LABEL_76;
            }
            goto LABEL_53;
          }
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v43 = v42;
          v44 = (char *)[v43 countByEnumeratingWithState:&v95 objects:v125 count:16];
          if (v44)
          {
            v45 = v44;
            uint64_t v46 = *(void *)v96;
            while (2)
            {
              for (m = 0; m != v45; ++m)
              {
                if (*(void *)v96 != v46) {
                  objc_enumerationMutation(v43);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v123 = v71;
                  CFStringRef v124 = @"key";
                  v48 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
                  DMFErrorWithCodeAndUserInfo();
                  id v28 = (id)objc_claimAutoreleasedReturnValue();

                  if (v28)
                  {
LABEL_74:

                    goto LABEL_76;
                  }
                  goto LABEL_48;
                }
              }
              v45 = (char *)[v43 countByEnumeratingWithState:&v95 objects:v125 count:16];
              if (v45) {
                continue;
              }
              break;
            }
          }

LABEL_48:
          v49 = [(DMDInstallConfigurationOperation *)self _intersectionFeatureForPayloadRestrictionKey:v41];
          uint64_t v121 = v73;
          id v122 = v43;
          v50 = +[NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
          [v77 setObject:v50 forKeyedSubscript:v49];
        }
      }
      id v81 = [v78 countByEnumeratingWithState:&v99 objects:v126 count:16];
      if (v81) {
        continue;
      }
      break;
    }
  }

LABEL_53:
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v78 = v68;
  id v82 = [v78 countByEnumeratingWithState:&v91 objects:v118 count:16];
  if (!v82)
  {
LABEL_73:

LABEL_83:
    v63 = v67;
    id v62 = v67;
    id v28 = 0;
    goto LABEL_80;
  }
  uint64_t v80 = *(void *)v92;
  uint64_t v74 = DMFInvalidParameterErrorKey;
  uint64_t v76 = MCUnionValuesKey;
LABEL_55:
  uint64_t v52 = 0;
  while (1)
  {
    if (*(void *)v92 != v80) {
      objc_enumerationMutation(v78);
    }
    uint64_t v53 = *(void *)(*((void *)&v91 + 1) + 8 * v52);
    v54 = [v86 objectForKeyedSubscript:v53, v65];
    if (v54) {
      break;
    }
LABEL_71:

    if ((id)++v52 == v82)
    {
      id v82 = [v78 countByEnumeratingWithState:&v91 objects:v118 count:16];
      if (v82) {
        goto LABEL_55;
      }
      goto LABEL_73;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v43 = v54;
    id v55 = [v43 countByEnumeratingWithState:&v87 objects:v117 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v88;
LABEL_62:
      uint64_t v58 = 0;
      while (1)
      {
        if (*(void *)v88 != v57) {
          objc_enumerationMutation(v43);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v56 == (id)++v58)
        {
          id v56 = [v43 countByEnumeratingWithState:&v87 objects:v117 count:16];
          if (v56) {
            goto LABEL_62;
          }
          goto LABEL_68;
        }
      }
      uint64_t v115 = v74;
      CFStringRef v116 = @"key";
      v59 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      DMFErrorWithCodeAndUserInfo();
      id v28 = (id)objc_claimAutoreleasedReturnValue();

      if (v28) {
        goto LABEL_74;
      }
    }
    else
    {
LABEL_68:
    }
    uint64_t v113 = v76;
    id v114 = v43;
    v60 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    [v72 setObject:v60 forKeyedSubscript:v53];

    goto LABEL_71;
  }
  uint64_t v111 = v74;
  CFStringRef v112 = @"key";
  v61 = +[NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
  DMFErrorWithCodeAndUserInfo();
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  if (!v28) {
    goto LABEL_83;
  }
LABEL_76:
  if (v65)
  {
    id v28 = v28;
    id v62 = 0;
    id *v65 = v28;
  }
  else
  {
    id v62 = 0;
  }
  v63 = v67;
LABEL_80:

  return v62;
}

- (id)_applyHeuristicsToRestrictions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSDictionary dictionary];
  id v13 = 0;
  uint64_t v7 = +[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:v5 toRestrictionsDictionary:v6 outChangeDetected:0 outError:&v13];

  id v8 = v13;
  uint64_t v9 = +[MCHacks sharedHacks];
  uint64_t v10 = objc_opt_new();
  [v9 _applyHeuristicsToRestrictions:v7 forProfile:v10 ignoresUnrestrictableApps:0];

  if (v8)
  {
    id v11 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    id v11 = [v7 copy];
  }

  return v11;
}

+ (id)_intersectionAliasToFeatures
{
  if (qword_1000FBB20 != -1) {
    dispatch_once(&qword_1000FBB20, &stru_1000CB268);
  }
  uint64_t v2 = (void *)qword_1000FBB18;

  return v2;
}

- (id)_intersectionFeatureForPayloadRestrictionKey:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _intersectionAliasToFeatures];
  id v5 = [v4 objectForKey:v3];
  uint64_t v6 = v5;
  if (!v5) {
    id v5 = v3;
  }
  id v7 = v5;

  return v7;
}

@end