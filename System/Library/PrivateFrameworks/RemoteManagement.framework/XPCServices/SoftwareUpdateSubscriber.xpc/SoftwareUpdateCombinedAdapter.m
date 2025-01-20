@interface SoftwareUpdateCombinedAdapter
- (BOOL)applyCombinedConfiguration:(id)a3 declarationKeys:(id)a4 scope:(int64_t)a5 returningReasons:(id *)a6 error:(id *)a7;
- (BOOL)removeCombinedConfigurationForScope:(int64_t)a3 error:(id *)a4;
- (Class)configurationClass;
- (SUCoreDDMControllerProtocol)controller;
- (SoftwareUpdateCombinedAdapter)init;
- (id)_localizedStringForRMModelSettingsState:(id)a3;
- (id)_recommendationCadenceLocalizedStringForString:(id)a3;
- (id)_recommendationCadenceValueForString:(id)a3;
- (id)_valueForEnum:(id)a3;
- (id)combineConfigurations:(id)a3;
- (id)declarationKeyForConfiguration:(id)a3;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)setController:(id)a3;
@end

@implementation SoftwareUpdateCombinedAdapter

- (SoftwareUpdateCombinedAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SoftwareUpdateCombinedAdapter;
  v2 = [(SoftwareUpdateCombinedAdapter *)&v6 init];
  if (v2)
  {
    v3 = (SUCoreDDMControllerProtocol *)[objc_alloc((Class)SUManagerClient) initWithDelegate:0 queue:&_dispatch_main_q clientType:1];
    controller = v2->_controller;
    v2->_controller = v3;
  }
  return v2;
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  objc_super v6 = (void (**)(id, void *, id))a4;
  v7 = +[SUCoreDDMUtilities sharedLogger];
  v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[SoftwareUpdateCombinedAdapter allDeclarationKeysForScope:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Getting all declarations for scope", buf, 0xCu);
  }

  if (a3 == 1)
  {
    v9 = [(SoftwareUpdateCombinedAdapter *)self controller];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(SoftwareUpdateCombinedAdapter *)self controller];
      id v34 = 0;
      v12 = [v11 globalSettingsDeclarationWithError:&v34];
      id v13 = v34;
    }
    else
    {
      v17 = +[SUCoreDDMUtilities sharedLogger];
      v18 = [v17 oslog];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[SoftwareUpdateCombinedAdapter allDeclarationKeysForScope:completionHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Anomaly: No controller found to get global settings declaration keys", buf, 0xCu);
      }

      v11 = +[SUCore sharedCore];
      id v13 = [v11 buildError:9101 underlying:0 description:@"No controller found to get global settings declaration keys"];
      v12 = 0;
    }

    v19 = +[SUCoreDDMUtilities sharedLogger];
    v20 = [v19 oslog];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v12 serializedKeys];
      *(_DWORD *)buf = 136315394;
      v37 = "-[SoftwareUpdateCombinedAdapter allDeclarationKeysForScope:completionHandler:]";
      __int16 v38 = 2114;
      int64_t v39 = (int64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Found serializedKeys: %{public}@", buf, 0x16u);
    }
    v22 = [v12 serializedKeys];
    v23 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v22 count]);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v24 = objc_msgSend(v12, "serializedKeys", 0);
    id v25 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        v28 = 0;
        do
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = +[RMStoreDeclarationKey newDeclarationKey:*(void *)(*((void *)&v30 + 1) + 8 * (void)v28)];
          [v23 addObject:v29];

          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v26);
    }

    v6[2](v6, v23, v13);
  }
  else
  {
    v14 = +[SUCoreDDMUtilities sharedLogger];
    v15 = [v14 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[SoftwareUpdateCombinedAdapter allDeclarationKeysForScope:completionHandler:]";
      __int16 v38 = 2048;
      int64_t v39 = a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Error, declarations required for non system scope: (long)%ld", buf, 0x16u);
    }

    v16 = +[SUCore sharedCore];
    id v13 = [v16 buildError:9100 underlying:0 description:@"Not in system scope"];

    v6[2](v6, 0, v13);
  }
}

- (BOOL)applyCombinedConfiguration:(id)a3 declarationKeys:(id)a4 scope:(int64_t)a5 returningReasons:(id *)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if (a5 == 1)
  {
    v118 = self;
    id v13 = v11;
    v14 = +[NSMutableArray array];
    v15 = +[RMManagedDevice currentManagedDevice];
    unsigned int v16 = [v15 isSupervised];

    v17 = +[SUCoreDDMUtilities sharedLogger];
    v18 = [v17 oslog];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = @"NO";
      if (v16) {
        CFStringRef v19 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      v127 = "-[SoftwareUpdateCombinedAdapter applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:]";
      __int16 v128 = 2114;
      *(void *)v129 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Supervised: %{public}@", buf, 0x16u);
    }

    if (v16) {
      goto LABEL_26;
    }
    v20 = [v13 payloadDeferrals];

    if (v20) {
      [v14 addObject:@"deferrals"];
    }
    v21 = [v13 payloadAutomaticActions];

    if (v21) {
      [v14 addObject:@"automatic actions"];
    }
    v22 = [v13 payloadRapidSecurityResponse];

    if (v22) {
      [v14 addObject:@"rapid security response"];
    }
    v23 = [v13 payloadBeta];
    v24 = [v23 payloadRequireProgram];

    if (v24) {
      [v14 addObject:@"beta require program"];
    }
    id v25 = [v13 payloadBeta];
    id v26 = [v25 payloadProgramEnrollment];

    if (v26) {
      [v14 addObject:@"beta program enrollment"];
    }
    if (![v14 count])
    {
LABEL_26:
      v115 = v14;
      id v34 = a7;
      v35 = +[NSMutableDictionary dictionary];
      v36 = [v13 payloadNotifications];
      [v35 setSafeObject:v36 forKey:SUCorePolicyDDMGlobalSettingEnableGlobalNotificationsKey];

      v37 = [v13 payloadAutomaticActions];
      __int16 v38 = v37;
      if (v37)
      {
        int64_t v39 = [v37 payloadDownload];
        v40 = [(SoftwareUpdateCombinedAdapter *)self _valueForEnum:v39];
        [v35 setSafeObject:v40 forKey:SUCorePolicyDDMGlobalSettingAutomaticallyDownloadKey];

        v41 = [v38 payloadInstallOSUpdates];
        v42 = [(SoftwareUpdateCombinedAdapter *)self _valueForEnum:v41];
        [v35 setSafeObject:v42 forKey:SUCorePolicyDDMGlobalSettingAutomaticallyInstallOSUpdatesKey];

        v43 = [v38 payloadInstallSecurityUpdate];
        v44 = [(SoftwareUpdateCombinedAdapter *)self _valueForEnum:v43];
        [v35 setSafeObject:v44 forKey:SUCorePolicyDDMGlobalSettingAutomaticallyInstallSystemAndSecurityUpdatesKey];
      }
      v113 = v38;
      v45 = [v13 payloadRapidSecurityResponse];
      v46 = v45;
      if (v45)
      {
        v47 = [v45 payloadEnable];
        [v35 setSafeObject:v47 forKey:SUCorePolicyDDMGlobalSettingEnableRapidSecurityResponseKey];

        v48 = [v46 payloadEnableRollback];
        [v35 setSafeObject:v48 forKey:SUCorePolicyDDMGlobalSettingEnableRapidSecurityResponseRollbackKey];
      }
      v112 = v46;
      v49 = [v13 payloadRecommendedCadence];
      v50 = [(SoftwareUpdateCombinedAdapter *)self _recommendationCadenceValueForString:v49];
      [v35 setSafeObject:v50 forKey:SUCorePolicyDDMGlobalSettingRecommendationCadenceKey];

      v51 = [v13 payloadDeferrals];
      v52 = v51;
      v53 = v34;
      if (v51)
      {
        v54 = [v51 payloadCombinedPeriodInDays];
        [v35 setSafeObject:v54 forKey:SUCorePolicyDDMGlobalSettingCombinedUpdatesDeferralPeriodKey];
      }
      v111 = v52;
      v110 = [v12 valueForKey:@"key"];
      v55 = [v110 allObjects];
      [v35 setSafeObject:v55 forKey:SUCorePolicyDDMGlobalSettingSerializedKeysKey];

      uint64_t v56 = [v13 payloadBeta];
      v116 = (void *)v56;
      v117 = v35;
      v14 = v115;
      id v114 = v11;
      if (v56)
      {
        v57 = (void *)v56;
        id v119 = objc_alloc_init((Class)NSMutableArray);
        v58 = [v57 payloadProgramEnrollment];

        if (v58)
        {
          v59 = [v57 payloadProgramEnrollment];
          uint64_t v60 = [(SoftwareUpdateCombinedAdapter *)self _valueForEnum:v59];
          v61 = v35;
          v62 = (void *)v60;
          [v61 setSafeObject:v60 forKey:SUCorePolicyDDMGlobalSettingProgramEnrollment];

          v63 = [v57 payloadProgramEnrollment];
          LOBYTE(v62) = [v63 isEqualToString:RMModelSettingsState_alwaysOn];

          if (v62)
          {
            uint64_t v64 = 2;
          }
          else
          {
            v65 = [v57 payloadProgramEnrollment];
            unsigned int v66 = [v65 isEqualToString:RMModelSettingsState_alwaysOff];

            uint64_t v64 = 3;
            if (!v66) {
              uint64_t v64 = 1;
            }
          }
        }
        else
        {
          uint64_t v64 = 1;
        }
        uint64_t v109 = v64;
        v67 = [v57 payloadOfferPrograms];

        if (v67)
        {
          id v106 = v13;
          v107 = v53;
          id v108 = v12;
          id v68 = objc_alloc_init((Class)NSMutableArray);
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          v69 = [v57 payloadOfferPrograms];
          id v70 = [v69 countByEnumeratingWithState:&v122 objects:v134 count:16];
          if (v70)
          {
            id v71 = v70;
            uint64_t v72 = *(void *)v123;
            uint64_t v73 = seedingProgramDescription;
            uint64_t v74 = seedingProgramToken;
            do
            {
              for (i = 0; i != v71; i = (char *)i + 1)
              {
                if (*(void *)v123 != v72) {
                  objc_enumerationMutation(v69);
                }
                v76 = *(void **)(*((void *)&v122 + 1) + 8 * i);
                v77 = [v76 payloadToken];
                [v119 addObject:v77];

                v132[0] = v73;
                v78 = [v76 payloadDescription];
                v132[1] = v74;
                v133[0] = v78;
                v79 = [v76 payloadToken];
                v133[1] = v79;
                v80 = +[NSDictionary dictionaryWithObjects:v133 forKeys:v132 count:2];
                [v68 addObject:v80];
              }
              id v71 = [v69 countByEnumeratingWithState:&v122 objects:v134 count:16];
            }
            while (v71);
          }

          [v117 setSafeObject:v68 forKey:SUCorePolicyDDMGlobalSettingOfferPrograms];
          v53 = v107;
          id v12 = v108;
          id v13 = v106;
          v14 = v115;
          v57 = v116;
        }
        v81 = [v57 payloadRequireProgram];

        if (v81)
        {
          v130[0] = seedingProgramDescription;
          v82 = [v57 payloadRequireProgram];
          v83 = [v82 payloadDescription];
          v131[0] = v83;
          v130[1] = seedingProgramToken;
          v84 = [v57 payloadRequireProgram];
          v85 = [v84 payloadToken];
          v131[1] = v85;
          +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:2];
          v87 = v86 = v14;
          [v117 setSafeObject:v87 forKey:SUCorePolicyDDMGlobalSettingRequireProgram];

          v14 = v86;
          v57 = v116;
        }
        v88 = +[NSSet setWithArray:v119];
        v89 = [v57 payloadRequireProgram];
        v90 = [v89 payloadToken];
        id v121 = 0;
        +[SDMDMConfigurator configureWithOfferProgramTokens:v88 requireProgramToken:v90 enrollmentPolicy:v109 error:&v121];
        id v91 = v121;

        if (v91)
        {
          v92 = +[SUCoreDDMUtilities sharedLogger];
          v93 = [v92 oslog];

          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v127 = "-[SoftwareUpdateCombinedAdapter applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:]";
            __int16 v128 = 2114;
            *(void *)v129 = v91;
            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%s: Error while applying the seeding configuration: %{public}@", buf, 0x16u);
          }
        }
        v35 = v117;
      }
      v94 = +[SUCoreDDMUtilities sharedLogger];
      v95 = [v94 oslog];

      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v127 = "-[SoftwareUpdateCombinedAdapter applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:]";
        __int16 v128 = 2114;
        *(void *)v129 = v13;
        *(_WORD *)&v129[8] = 2114;
        *(void *)&v129[10] = v35;
        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "%s: Applying configuration: %{public}@; declaration dictionary: %{public}@",
          buf,
          0x20u);
      }

      v96 = [(SoftwareUpdateCombinedAdapter *)v118 controller];
      char v97 = objc_opt_respondsToSelector();

      if (v97)
      {
        id v98 = [objc_alloc((Class)SUCoreDDMDeclarationGlobalSettings) initWithDeclarationKeys:v35];
        v99 = [(SoftwareUpdateCombinedAdapter *)v118 controller];
        id v120 = 0;
        unsigned int v31 = [v99 setGlobalSettings:v98 withError:&v120];
        id v100 = v120;
      }
      else
      {
        v101 = +[SUCoreDDMUtilities sharedLogger];
        v102 = [v101 oslog];

        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v127 = "-[SoftwareUpdateCombinedAdapter applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:]";
          _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%s: Anomaly: No controller found to enforce declaration", buf, 0xCu);
        }

        id v98 = +[SUCore sharedCore];
        id v100 = [v98 buildError:9101 underlying:0 description:@"No controller found to enforce declaration"];
        unsigned int v31 = 0;
      }

      v103 = +[SUCoreDDMUtilities sharedLogger];
      v104 = [v103 oslog];

      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v127 = "-[SoftwareUpdateCombinedAdapter applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:]";
        __int16 v128 = 1024;
        *(_DWORD *)v129 = v31;
        *(_WORD *)&v129[4] = 2114;
        *(void *)&v129[6] = v100;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "%s: Applied global settings, result = %d, error = %{public}@", buf, 0x1Cu);
      }

      if (v53 && v100) {
        id *v53 = v100;
      }

      long long v30 = v113;
      id v11 = v114;
      id v29 = v117;
    }
    else
    {
      uint64_t v27 = +[SUCoreDDMUtilities sharedLogger];
      v28 = [v27 oslog];

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v127 = "-[SoftwareUpdateCombinedAdapter applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:]";
        __int16 v128 = 2114;
        *(void *)v129 = v14;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s: Invalid declaration: The following settings cannot be enforced on unsupervised devices: %{public}@", buf, 0x16u);
      }

      if (!a7)
      {
        LOBYTE(v31) = 0;
        goto LABEL_70;
      }
      id v29 = +[NSString stringWithFormat:@"The following settings cannot be enforced on unsupervised devices: %@", v14];
      long long v30 = +[SUCore sharedCore];
      [v30 buildError:9100 underlying:0 description:v29];
      LOBYTE(v31) = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_70:
    goto LABEL_71;
  }
  long long v32 = +[SUCoreDDMUtilities sharedLogger];
  long long v33 = [v32 oslog];

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v127 = "-[SoftwareUpdateCombinedAdapter applyCombinedConfiguration:declarationKeys:scope:returningReasons:error:]";
    __int16 v128 = 2048;
    *(void *)v129 = a5;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: Error, declarations required for non system scope: (long)%ld", buf, 0x16u);
  }

  if (a7)
  {
    id v13 = +[SUCore sharedCore];
    [v13 buildError:8114 underlying:0 description:@"Software update declarations only support system scope"];
    LOBYTE(v31) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_71:

    goto LABEL_72;
  }
  LOBYTE(v31) = 0;
LABEL_72:

  return v31;
}

- (id)_valueForEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:RMModelSettingsState_allowed])
  {
    v4 = 0;
  }
  else if ([v3 isEqualToString:RMModelSettingsState_alwaysOn])
  {
    v4 = &off_10000CAA8;
  }
  else if ([v3 isEqualToString:RMModelSettingsState_alwaysOff])
  {
    v4 = &off_10000CAC0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_recommendationCadenceValueForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:RMModelSoftwareUpdateSettingsDeclaration_RecommendedCadence_all])
  {
    v4 = &off_10000CAC0;
  }
  else if ([v3 isEqualToString:RMModelSoftwareUpdateSettingsDeclaration_RecommendedCadence_oldest])
  {
    v4 = &off_10000CAA8;
  }
  else if ([v3 isEqualToString:RMModelSoftwareUpdateSettingsDeclaration_RecommendedCadence_theNewest])
  {
    v4 = &off_10000CAD8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_recommendationCadenceLocalizedStringForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:RMModelSoftwareUpdateSettingsDeclaration_RecommendedCadence_all])
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"SU_CONFIGURATION_RECOMMENDATION_CADENCE_ALL";
LABEL_7:
    v7 = [v4 localizedStringForKey:v6 value:&stru_10000C498 table:0];

    goto LABEL_8;
  }
  if ([v3 isEqualToString:RMModelSoftwareUpdateSettingsDeclaration_RecommendedCadence_oldest])
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"SU_CONFIGURATION_RECOMMENDATION_CADENCE_SLOW";
    goto LABEL_7;
  }
  if ([v3 isEqualToString:RMModelSoftwareUpdateSettingsDeclaration_RecommendedCadence_theNewest])
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"SU_CONFIGURATION_RECOMMENDATION_CADENCE_FAST";
    goto LABEL_7;
  }
  v7 = &stru_10000C498;
LABEL_8:

  return v7;
}

- (id)combineConfigurations:(id)a3
{
  return +[RMModelSoftwareUpdateSettingsDeclaration combineConfigurations:a3];
}

- (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (id)declarationKeyForConfiguration:(id)a3
{
  id v3 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"com.apple.RemoteManagement.SoftwareUpdateExtension.GlobalSettings" reference:a3];

  return v3;
}

- (BOOL)removeCombinedConfigurationForScope:(int64_t)a3 error:(id *)a4
{
  v7 = +[SUCoreDDMUtilities sharedLogger];
  v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[SoftwareUpdateCombinedAdapter removeCombinedConfigurationForScope:error:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Removing combined configuration", buf, 0xCu);
  }

  if (a3 == 1)
  {
    v9 = [(SoftwareUpdateCombinedAdapter *)self controller];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(SoftwareUpdateCombinedAdapter *)self controller];
      id v25 = 0;
      unsigned int v12 = [v11 setGlobalSettings:0 withError:&v25];
      id v13 = v25;
    }
    else
    {
      unsigned int v16 = +[SUCoreDDMUtilities sharedLogger];
      v17 = [v16 oslog];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v27 = "-[SoftwareUpdateCombinedAdapter removeCombinedConfigurationForScope:error:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Anomaly: No controller found to remove combined configuration", buf, 0xCu);
      }

      id v11 = +[SUCore sharedCore];
      id v13 = [v11 buildError:9101 underlying:0 description:@"No controller found to remove combined configuration"];
      unsigned int v12 = 0;
    }

    id v24 = 0;
    +[SDMDMConfigurator resetMDMConfigurationWithError:&v24];
    id v18 = v24;
    if (v18)
    {
      CFStringRef v19 = +[SUCoreDDMUtilities sharedLogger];
      v20 = [v19 oslog];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = "-[SoftwareUpdateCombinedAdapter removeCombinedConfigurationForScope:error:]";
        __int16 v28 = 2114;
        v29[0] = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Error unenrolling device %{public}@", buf, 0x16u);
      }
    }
    v21 = +[SUCoreDDMUtilities sharedLogger];
    v22 = [v21 oslog];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v27 = "-[SoftwareUpdateCombinedAdapter removeCombinedConfigurationForScope:error:]";
      __int16 v28 = 1024;
      LODWORD(v29[0]) = v12;
      WORD2(v29[0]) = 2114;
      *(void *)((char *)v29 + 6) = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Removed combined configuration, result = %d, error = %{public}@", buf, 0x1Cu);
    }

    if (a4 && v13) {
      *a4 = v13;
    }
  }
  else
  {
    v14 = +[SUCoreDDMUtilities sharedLogger];
    v15 = [v14 oslog];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v27 = "-[SoftwareUpdateCombinedAdapter removeCombinedConfigurationForScope:error:]";
      __int16 v28 = 2048;
      v29[0] = a3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Error, declarations required for non system scope: (long)%ld", buf, 0x16u);
    }

    if (!a4)
    {
      LOBYTE(v12) = 0;
      return v12;
    }
    id v13 = +[SUCore sharedCore];
    [v13 buildError:8114 underlying:0 description:@"Software update declarations only support system scope"];
    LOBYTE(v12) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)configurationUIForConfiguration:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a3;
  v118 = (void (**)(id, uint64_t, void *, void))a5;
  v7 = +[SUCoreDDMUtilities sharedLogger];
  v8 = [v7 oslog];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 declaration];
    char v10 = [v9 declarationIdentifier];
    *(_DWORD *)buf = 136315394;
    v140 = "-[SoftwareUpdateCombinedAdapter configurationUIForConfiguration:scope:completionHandler:]";
    __int16 v141 = 2114;
    v142 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Get configuration UI for: %{public}@", buf, 0x16u);
  }
  id v11 = [v6 declaration];
  unsigned int v12 = +[NSMutableArray array];
  id v13 = [v11 payloadNotifications];

  id v119 = v6;
  if (v13)
  {
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"SU_CONFIGURATION_NOTIFICATIONS" value:&stru_10000C498 table:0];
    v138[0] = v15;
    unsigned int v16 = [v11 payloadNotifications];
    unsigned int v17 = [v16 BOOLValue];
    id v18 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v19 = v18;
    if (v17) {
      CFStringRef v20 = @"ON";
    }
    else {
      CFStringRef v20 = @"OFF";
    }
    v21 = [v18 localizedStringForKey:v20 value:&stru_10000C498 table:0];
    v138[1] = v21;
    v22 = +[NSArray arrayWithObjects:v138 count:2];
    [v12 addObject:v22];

    id v6 = v119;
  }
  long long v122 = v12;
  v23 = [v11 payloadRecommendedCadence];

  id v24 = &NSStringFromClass_ptr;
  if (v23)
  {
    id v25 = +[NSBundle bundleForClass:objc_opt_class()];
    id v26 = [v25 localizedStringForKey:@"SU_CONFIGURATION_RECOMMENDATION_CADENCE" value:&stru_10000C498 table:0];
    v137[0] = v26;
    uint64_t v27 = [v11 payloadRecommendedCadence];
    __int16 v28 = [(SoftwareUpdateCombinedAdapter *)self _recommendationCadenceLocalizedStringForString:v27];
    v137[1] = v28;
    id v29 = +[NSArray arrayWithObjects:v137 count:2];
    [v122 addObject:v29];

    id v6 = v119;
  }
  long long v30 = [v11 payloadAutomaticActions];
  v117 = v30;
  if (v30)
  {
    unsigned int v31 = v30;
    long long v32 = [v30 payloadDownload];

    if (v32)
    {
      long long v33 = +[NSBundle bundleForClass:objc_opt_class()];
      id v34 = [v33 localizedStringForKey:@"SU_CONFIGURATION_AUTOMATIC_ACTIONS_DOWNLOAD" value:&stru_10000C498 table:0];
      v136[0] = v34;
      v35 = [v31 payloadDownload];
      v36 = [(SoftwareUpdateCombinedAdapter *)self _localizedStringForRMModelSettingsState:v35];
      v136[1] = v36;
      v37 = +[NSArray arrayWithObjects:v136 count:2];
      [v122 addObject:v37];
    }
    __int16 v38 = [v31 payloadInstallOSUpdates];

    if (v38)
    {
      int64_t v39 = +[NSBundle bundleForClass:objc_opt_class()];
      v40 = [v39 localizedStringForKey:@"SU_CONFIGURATION_AUTOMATIC_ACTIONS_INSTALL_OS_UPDATES" value:&stru_10000C498 table:0];
      v135[0] = v40;
      v41 = [v31 payloadInstallOSUpdates];
      v42 = [(SoftwareUpdateCombinedAdapter *)self _localizedStringForRMModelSettingsState:v41];
      v135[1] = v42;
      v43 = +[NSArray arrayWithObjects:v135 count:2];
      [v122 addObject:v43];
    }
    v44 = [v31 payloadInstallSecurityUpdate];

    if (v44)
    {
      v45 = +[NSBundle bundleForClass:objc_opt_class()];
      v46 = [v45 localizedStringForKey:@"SU_CONFIGURATION_AUTOMATIC_ACTIONS_INSTALL_SECURITY_UPDATES" value:&stru_10000C498 table:0];
      v134[0] = v46;
      v47 = [v31 payloadInstallSecurityUpdate];
      v48 = [(SoftwareUpdateCombinedAdapter *)self _localizedStringForRMModelSettingsState:v47];
      v134[1] = v48;
      v49 = +[NSArray arrayWithObjects:v134 count:2];
      [v122 addObject:v49];
    }
  }
  v50 = [v11 payloadRapidSecurityResponse];
  v51 = v122;
  v52 = &NSStringFromClass_ptr;
  id v121 = v50;
  if (v50)
  {
    v53 = v50;
    v54 = [v50 payloadEnable];

    if (v54)
    {
      v55 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v56 = [v55 localizedStringForKey:@"SU_CONFIGURATION_RAPID_SECURITY_RESPONSE_ENABLE" value:&stru_10000C498 table:0];
      v133[0] = v56;
      v57 = [v121 payloadEnable];
      unsigned int v58 = [v57 BOOLValue];
      v59 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v60 = v59;
      if (v58) {
        CFStringRef v61 = @"ON";
      }
      else {
        CFStringRef v61 = @"OFF";
      }
      v62 = [v59 localizedStringForKey:v61 value:&stru_10000C498 table:0];
      v133[1] = v62;
      v63 = +[NSArray arrayWithObjects:v133 count:2];
      [v122 addObject:v63];

      id v24 = &NSStringFromClass_ptr;
      v53 = v121;

      v52 = &NSStringFromClass_ptr;
    }
    uint64_t v64 = [v53 payloadEnableRollback];

    if (v64)
    {
      v65 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v66 = [v65 localizedStringForKey:@"SU_CONFIGURATION_RAPID_SECURITY_RESPONSE_ENABLE_ROLLBACK" value:&stru_10000C498 table:0];
      v132[0] = v66;
      v67 = [v121 payloadEnableRollback];
      unsigned int v68 = [v67 BOOLValue];
      v69 = +[NSBundle bundleForClass:objc_opt_class()];
      id v70 = v69;
      if (v68) {
        CFStringRef v71 = @"ON";
      }
      else {
        CFStringRef v71 = @"OFF";
      }
      uint64_t v72 = [v69 localizedStringForKey:v71 value:&stru_10000C498 table:0];
      v132[1] = v72;
      uint64_t v73 = +[NSArray arrayWithObjects:v132 count:2];
      [v122 addObject:v73];

      id v24 = &NSStringFromClass_ptr;
      v52 = &NSStringFromClass_ptr;
    }
  }
  uint64_t v74 = [v11 payloadDeferrals];
  v116 = v74;
  if (v74)
  {
    v75 = v74;
    v76 = [v74 payloadCombinedPeriodInDays];

    if (v76)
    {
      v77 = +[NSBundle bundleForClass:objc_opt_class()];
      v78 = [v77 localizedStringForKey:@"SU_CONFIGURATION_DEFERRALS_COMBINED" value:&stru_10000C498 table:0];
      v131[0] = v78;
      v79 = [v75 payloadCombinedPeriodInDays];
      v80 = [v79 description];
      v131[1] = v80;
      v81 = [v52[40] arrayWithObjects:v131 count:2];
      [v122 addObject:v81];

      id v24 = &NSStringFromClass_ptr;
    }
  }
  v82 = [v11 payloadBeta];
  v83 = v82;
  if (v82)
  {
    v84 = [v82 payloadProgramEnrollment];

    if (v84)
    {
      v85 = +[NSBundle bundleForClass:objc_opt_class()];
      v86 = [v85 localizedStringForKey:@"SU_CONFIGURATION_BETA_PROGRAM_ENROLLMENT" value:&stru_10000C498 table:0];
      v130[0] = v86;
      v87 = [v83 payloadProgramEnrollment];
      v130[1] = v87;
      v88 = [v52[40] arrayWithObjects:v130 count:2];
      [v122 addObject:v88];

      id v24 = &NSStringFromClass_ptr;
    }
    v89 = [v83 payloadRequireProgram];

    if (v89)
    {
      v90 = +[NSBundle bundleForClass:objc_opt_class()];
      id v91 = [v90 localizedStringForKey:@"SU_CONFIGURATION_BETA_REQUIRED_PROGRAM" value:&stru_10000C498 table:0];
      v129[0] = v91;
      v92 = [v83 payloadRequireProgram];
      v93 = [v92 payloadDescription];
      v129[1] = v93;
      v94 = [v52[40] arrayWithObjects:v129 count:2];
      [v122 addObject:v94];

      id v6 = v119;
      id v24 = &NSStringFromClass_ptr;
    }
    v95 = [v83 payloadOfferPrograms];

    if (v95)
    {
      v96 = +[NSMutableString string];
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      char v97 = [v83 payloadOfferPrograms];
      id v98 = [v97 countByEnumeratingWithState:&v123 objects:v128 count:16];
      if (v98)
      {
        id v99 = v98;
        uint64_t v100 = *(void *)v124;
        do
        {
          for (i = 0; i != v99; i = (char *)i + 1)
          {
            if (*(void *)v124 != v100) {
              objc_enumerationMutation(v97);
            }
            v102 = [*(id *)(*((void *)&v123 + 1) + 8 * i) payloadDescription];
            [v96 appendFormat:@"%@\n", v102];
          }
          id v99 = [v97 countByEnumeratingWithState:&v123 objects:v128 count:16];
        }
        while (v99);
      }

      id v24 = &NSStringFromClass_ptr;
      v103 = +[NSBundle bundleForClass:objc_opt_class()];
      v104 = [v103 localizedStringForKey:@"SU_CONFIGURATION_BETA_OFFER_PROGRAMS" value:&stru_10000C498 table:0];
      v127[0] = v104;
      v127[1] = v96;
      v105 = +[NSArray arrayWithObjects:v127 count:2];
      v51 = v122;
      [v122 addObject:v105];

      id v6 = v119;
    }
  }
  id v106 = v6;
  v107 = +[SUCoreDDMUtilities sharedLogger];
  id v108 = [v107 oslog];

  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v140 = "-[SoftwareUpdateCombinedAdapter configurationUIForConfiguration:scope:completionHandler:]";
    __int16 v141 = 2114;
    v142 = v51;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "%s: Applying configuration UI: %{public}@", buf, 0x16u);
  }

  uint64_t v109 = [v24[41] bundleForClass:objc_opt_class()];
  v110 = [v109 localizedStringForKey:@"SU_GLOBAL_SETTINGS_CONFIGURATION_TITLE" value:&stru_10000C498 table:0];
  v111 = [v24[41] bundleForClass:objc_opt_class()];
  v112 = [v111 localizedStringForKey:@"SU_GLOBAL_SETTINGS_CONFIGURATION_DESCRIPTION" value:&stru_10000C498 table:0];
  v113 = v51;
  id v114 = [v51 copy];
  v115 = +[RMConfigurationUIDetails configurationUIWithTitle:v110 description:v112 details:v114];

  v118[2](v118, 1, v115, 0);
}

- (id)_localizedStringForRMModelSettingsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:RMModelSettingsState_allowed])
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"ALLOWED";
LABEL_7:
    v7 = [v4 localizedStringForKey:v6 value:&stru_10000C498 table:0];

    goto LABEL_8;
  }
  if ([v3 isEqualToString:RMModelSettingsState_alwaysOn])
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"ON";
    goto LABEL_7;
  }
  if ([v3 isEqualToString:RMModelSettingsState_alwaysOff])
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = v4;
    CFStringRef v6 = @"OFF";
    goto LABEL_7;
  }
  v7 = &stru_10000C498;
LABEL_8:

  return v7;
}

- (SUCoreDDMControllerProtocol)controller
{
  return (SUCoreDDMControllerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end