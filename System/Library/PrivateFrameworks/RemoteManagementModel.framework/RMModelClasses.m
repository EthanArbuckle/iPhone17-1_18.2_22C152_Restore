@interface RMModelClasses
+ (Class)classForCommandType:(id)a3;
+ (Class)classForDeclarationType:(id)a3;
+ (Class)classForStatusItemType:(id)a3;
+ (id)allActivationClasses;
+ (id)allAssetClasses;
+ (id)allConfigurationClasses;
+ (id)allManagementClasses;
+ (id)allStatusItemClasses;
+ (void)ensureClassForDeclarations:(id)a3;
+ (void)ensureClassForStatusItems:(id)a3;
+ (void)hideDeclarationsWithTypes:(id)a3;
@end

@implementation RMModelClasses

+ (Class)classForCommandType:(id)a3
{
  uint64_t v3 = classForCommandType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&classForCommandType__onceToken, &__block_literal_global_10);
  }
  v5 = [(id)classForCommandType__commandClassByCommandType objectForKeyedSubscript:v4];

  return (Class)v5;
}

void __38__RMModelClasses_classForCommandType___block_invoke()
{
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  uint64_t v0 = objc_opt_class();
  v1 = +[RMModelManagementTestCommandCommand registeredIdentifier];
  [v4 setObject:v0 forKeyedSubscript:v1];

  uint64_t v2 = [v4 copy];
  uint64_t v3 = (void *)classForCommandType__commandClassByCommandType;
  classForCommandType__commandClassByCommandType = v2;
}

+ (Class)classForDeclarationType:(id)a3
{
  uint64_t v3 = classForDeclarationType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&classForDeclarationType__onceToken, &__block_literal_global_3);
  }
  v5 = [(id)declarationClassByDeclarationType objectForKeyedSubscript:v4];

  return (Class)v5;
}

void __42__RMModelClasses_classForDeclarationType___block_invoke()
{
  id v82 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:40];
  uint64_t v0 = objc_opt_class();
  v1 = +[RMModelActivationSimpleDeclaration registeredIdentifier];
  [v82 setObject:v0 forKeyedSubscript:v1];

  uint64_t v2 = objc_opt_class();
  uint64_t v3 = +[RMModelAssetCredentialACMEDeclaration registeredIdentifier];
  [v82 setObject:v2 forKeyedSubscript:v3];

  uint64_t v4 = objc_opt_class();
  v5 = +[RMModelAssetCredentialCertificateDeclaration registeredIdentifier];
  [v82 setObject:v4 forKeyedSubscript:v5];

  uint64_t v6 = objc_opt_class();
  v7 = +[RMModelAssetCredentialIdentityDeclaration registeredIdentifier];
  [v82 setObject:v6 forKeyedSubscript:v7];

  uint64_t v8 = objc_opt_class();
  v9 = +[RMModelAssetCredentialSCEPDeclaration registeredIdentifier];
  [v82 setObject:v8 forKeyedSubscript:v9];

  uint64_t v10 = objc_opt_class();
  v11 = +[RMModelAssetCredentialUserNameAndPasswordDeclaration registeredIdentifier];
  [v82 setObject:v10 forKeyedSubscript:v11];

  uint64_t v12 = objc_opt_class();
  v13 = +[RMModelAssetDataDeclaration registeredIdentifier];
  [v82 setObject:v12 forKeyedSubscript:v13];

  uint64_t v14 = objc_opt_class();
  v15 = +[RMModelAssetUserIdentityDeclaration registeredIdentifier];
  [v82 setObject:v14 forKeyedSubscript:v15];

  uint64_t v16 = objc_opt_class();
  v17 = +[RMModelAccountCalDAVDeclaration registeredIdentifier];
  [v82 setObject:v16 forKeyedSubscript:v17];

  uint64_t v18 = objc_opt_class();
  v19 = +[RMModelAccountCardDAVDeclaration registeredIdentifier];
  [v82 setObject:v18 forKeyedSubscript:v19];

  uint64_t v20 = objc_opt_class();
  v21 = +[RMModelAccountExchangeDeclaration registeredIdentifier];
  [v82 setObject:v20 forKeyedSubscript:v21];

  uint64_t v22 = objc_opt_class();
  v23 = +[RMModelAccountGoogleDeclaration registeredIdentifier];
  [v82 setObject:v22 forKeyedSubscript:v23];

  uint64_t v24 = objc_opt_class();
  v25 = +[RMModelAccountLDAPDeclaration registeredIdentifier];
  [v82 setObject:v24 forKeyedSubscript:v25];

  uint64_t v26 = objc_opt_class();
  v27 = +[RMModelAccountMailDeclaration registeredIdentifier];
  [v82 setObject:v26 forKeyedSubscript:v27];

  uint64_t v28 = objc_opt_class();
  v29 = +[RMModelAccountSubscribedCalendarDeclaration registeredIdentifier];
  [v82 setObject:v28 forKeyedSubscript:v29];

  uint64_t v30 = objc_opt_class();
  v31 = +[RMModelAppManagedDeclaration registeredIdentifier];
  [v82 setObject:v30 forKeyedSubscript:v31];

  uint64_t v32 = objc_opt_class();
  v33 = +[RMModelAppMarketplaceDeclaration registeredIdentifier];
  [v82 setObject:v32 forKeyedSubscript:v33];

  uint64_t v34 = objc_opt_class();
  v35 = +[RMModelAppSettingsDeclaration registeredIdentifier];
  [v82 setObject:v34 forKeyedSubscript:v35];

  uint64_t v36 = objc_opt_class();
  v37 = +[RMModelDiskManagementSettingsDeclaration registeredIdentifier];
  [v82 setObject:v36 forKeyedSubscript:v37];

  uint64_t v38 = objc_opt_class();
  v39 = +[RMModelLegacyInteractiveProfileDeclaration registeredIdentifier];
  [v82 setObject:v38 forKeyedSubscript:v39];

  uint64_t v40 = objc_opt_class();
  v41 = +[RMModelLegacyProfileDeclaration registeredIdentifier];
  [v82 setObject:v40 forKeyedSubscript:v41];

  uint64_t v42 = objc_opt_class();
  v43 = +[RMModelManagementStatusSubscriptionsDeclaration registeredIdentifier];
  [v82 setObject:v42 forKeyedSubscript:v43];

  uint64_t v44 = objc_opt_class();
  v45 = +[RMModelManagementTestDeclaration registeredIdentifier];
  [v82 setObject:v44 forKeyedSubscript:v45];

  uint64_t v46 = objc_opt_class();
  v47 = +[RMModelNetworkEAPDeclaration registeredIdentifier];
  [v82 setObject:v46 forKeyedSubscript:v47];

  uint64_t v48 = objc_opt_class();
  v49 = +[RMModelNetworkWiFiDeclaration registeredIdentifier];
  [v82 setObject:v48 forKeyedSubscript:v49];

  uint64_t v50 = objc_opt_class();
  v51 = +[RMModelPasscodeSettingsDeclaration registeredIdentifier];
  [v82 setObject:v50 forKeyedSubscript:v51];

  uint64_t v52 = objc_opt_class();
  v53 = +[RMModelScreenSharingConnectionGroupDeclaration registeredIdentifier];
  [v82 setObject:v52 forKeyedSubscript:v53];

  uint64_t v54 = objc_opt_class();
  v55 = +[RMModelScreenSharingConnectionDeclaration registeredIdentifier];
  [v82 setObject:v54 forKeyedSubscript:v55];

  uint64_t v56 = objc_opt_class();
  v57 = +[RMModelScreenSharingHostSettingsDeclaration registeredIdentifier];
  [v82 setObject:v56 forKeyedSubscript:v57];

  uint64_t v58 = objc_opt_class();
  v59 = +[RMModelSecurityCertificateDeclaration registeredIdentifier];
  [v82 setObject:v58 forKeyedSubscript:v59];

  uint64_t v60 = objc_opt_class();
  v61 = +[RMModelSecurityIdentityDeclaration registeredIdentifier];
  [v82 setObject:v60 forKeyedSubscript:v61];

  uint64_t v62 = objc_opt_class();
  v63 = +[RMModelSecurityPasskeyAttestationDeclaration registeredIdentifier];
  [v82 setObject:v62 forKeyedSubscript:v63];

  uint64_t v64 = objc_opt_class();
  v65 = +[RMModelServicesBackgroundTasksDeclaration registeredIdentifier];
  [v82 setObject:v64 forKeyedSubscript:v65];

  uint64_t v66 = objc_opt_class();
  v67 = +[RMModelServicesConfigurationFilesDeclaration registeredIdentifier];
  [v82 setObject:v66 forKeyedSubscript:v67];

  uint64_t v68 = objc_opt_class();
  v69 = +[RMModelSoftwareUpdateEnforcementSpecificDeclaration registeredIdentifier];
  [v82 setObject:v68 forKeyedSubscript:v69];

  uint64_t v70 = objc_opt_class();
  v71 = +[RMModelSoftwareUpdateSettingsDeclaration registeredIdentifier];
  [v82 setObject:v70 forKeyedSubscript:v71];

  uint64_t v72 = objc_opt_class();
  v73 = +[RMModelWatchEnrollmentDeclaration registeredIdentifier];
  [v82 setObject:v72 forKeyedSubscript:v73];

  uint64_t v74 = objc_opt_class();
  v75 = +[RMModelManagementOrganizationInformationDeclaration registeredIdentifier];
  [v82 setObject:v74 forKeyedSubscript:v75];

  uint64_t v76 = objc_opt_class();
  v77 = +[RMModelManagementPropertiesDeclaration registeredIdentifier];
  [v82 setObject:v76 forKeyedSubscript:v77];

  uint64_t v78 = objc_opt_class();
  v79 = +[RMModelManagementServerCapabilitiesDeclaration registeredIdentifier];
  [v82 setObject:v78 forKeyedSubscript:v79];

  uint64_t v80 = [v82 copy];
  v81 = (void *)declarationClassByDeclarationType;
  declarationClassByDeclarationType = v80;
}

+ (void)ensureClassForDeclarations:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 classForDeclarationType:&stru_2708A9900];
  v5 = (void *)[(id)declarationClassByDeclarationType mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  v9 = v6;
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v10 = v7;
  char v11 = 0;
  uint64_t v12 = *(void *)v21;
  v13 = &_os_log_internal;
  *(void *)&long long v8 = 138543362;
  long long v19 = v8;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v6);
      }
      v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if ([v15 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v16 = [v15 registeredIdentifier];
        if (![v5 objectForKeyedSubscript:v16])
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v17 = NSStringFromClass((Class)v15);
            *(_DWORD *)buf = v19;
            v25 = v17;
            _os_log_impl(&dword_25AF84000, v13, OS_LOG_TYPE_DEFAULT, "Registering declaration model class: %{public}@", buf, 0xCu);
          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16, v19, (void)v20);
          char v11 = 1;
        }
      }
    }
    uint64_t v10 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v10);

  if (v11)
  {
    uint64_t v18 = [v5 copy];
    v9 = (void *)declarationClassByDeclarationType;
    declarationClassByDeclarationType = v18;
LABEL_16:
  }
}

+ (void)hideDeclarationsWithTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 classForDeclarationType:&stru_2708A9900];
  v5 = (void *)[(id)declarationClassByDeclarationType mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, *(void *)(*((void *)&v13 + 1) + 8 * v10++), (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [v5 copy];
  uint64_t v12 = (void *)declarationClassByDeclarationType;
  declarationClassByDeclarationType = v11;
}

+ (Class)classForStatusItemType:(id)a3
{
  uint64_t v3 = classForStatusItemType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&classForStatusItemType__onceToken, &__block_literal_global_47);
  }
  v5 = [(id)statusItemClassByStatusItemType objectForKeyedSubscript:v4];

  return (Class)v5;
}

void __41__RMModelClasses_classForStatusItemType___block_invoke()
{
  id v88 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:43];
  uint64_t v0 = objc_opt_class();
  v1 = +[RMModelStatusAccountListCalDAV statusItemType];
  [v88 setObject:v0 forKeyedSubscript:v1];

  uint64_t v2 = objc_opt_class();
  uint64_t v3 = +[RMModelStatusAccountListCardDAV statusItemType];
  [v88 setObject:v2 forKeyedSubscript:v3];

  uint64_t v4 = objc_opt_class();
  v5 = +[RMModelStatusAccountListExchange statusItemType];
  [v88 setObject:v4 forKeyedSubscript:v5];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = +[RMModelStatusAccountListGoogle statusItemType];
  [v88 setObject:v6 forKeyedSubscript:v7];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = +[RMModelStatusAccountListLDAP statusItemType];
  [v88 setObject:v8 forKeyedSubscript:v9];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = +[RMModelStatusAccountListMailIncoming statusItemType];
  [v88 setObject:v10 forKeyedSubscript:v11];

  uint64_t v12 = objc_opt_class();
  long long v13 = +[RMModelStatusAccountListMailOutgoing statusItemType];
  [v88 setObject:v12 forKeyedSubscript:v13];

  uint64_t v14 = objc_opt_class();
  long long v15 = +[RMModelStatusAccountListSubscribedCalendar statusItemType];
  [v88 setObject:v14 forKeyedSubscript:v15];

  uint64_t v16 = objc_opt_class();
  v17 = +[RMModelStatusAppManagedList statusItemType];
  [v88 setObject:v16 forKeyedSubscript:v17];

  uint64_t v18 = objc_opt_class();
  long long v19 = +[RMModelStatusDeviceSerialNumber statusItemType];
  [v88 setObject:v18 forKeyedSubscript:v19];

  uint64_t v20 = objc_opt_class();
  long long v21 = +[RMModelStatusDeviceUDID statusItemType];
  [v88 setObject:v20 forKeyedSubscript:v21];

  uint64_t v22 = objc_opt_class();
  long long v23 = +[RMModelStatusDeviceModelFamily statusItemType];
  [v88 setObject:v22 forKeyedSubscript:v23];

  uint64_t v24 = objc_opt_class();
  v25 = +[RMModelStatusDeviceModelIdentifier statusItemType];
  [v88 setObject:v24 forKeyedSubscript:v25];

  uint64_t v26 = objc_opt_class();
  uint64_t v27 = +[RMModelStatusDeviceModelMarketingName statusItemType];
  [v88 setObject:v26 forKeyedSubscript:v27];

  uint64_t v28 = objc_opt_class();
  v29 = +[RMModelStatusDeviceModelNumber statusItemType];
  [v88 setObject:v28 forKeyedSubscript:v29];

  uint64_t v30 = objc_opt_class();
  v31 = +[RMModelStatusDeviceOperatingSystemBuildVersion statusItemType];
  [v88 setObject:v30 forKeyedSubscript:v31];

  uint64_t v32 = objc_opt_class();
  v33 = +[RMModelStatusDeviceOperatingSystemFamily statusItemType];
  [v88 setObject:v32 forKeyedSubscript:v33];

  uint64_t v34 = objc_opt_class();
  v35 = +[RMModelStatusDeviceOperatingSystemMarketingName statusItemType];
  [v88 setObject:v34 forKeyedSubscript:v35];

  uint64_t v36 = objc_opt_class();
  v37 = +[RMModelStatusDeviceOperatingSystemSupplementalBuildVersion statusItemType];
  [v88 setObject:v36 forKeyedSubscript:v37];

  uint64_t v38 = objc_opt_class();
  v39 = +[RMModelStatusDeviceOperatingSystemSupplementalExtraVersion statusItemType];
  [v88 setObject:v38 forKeyedSubscript:v39];

  uint64_t v40 = objc_opt_class();
  v41 = +[RMModelStatusDeviceOperatingSystemVersion statusItemType];
  [v88 setObject:v40 forKeyedSubscript:v41];

  uint64_t v42 = objc_opt_class();
  v43 = +[RMModelStatusDeviceBatteryHealth statusItemType];
  [v88 setObject:v42 forKeyedSubscript:v43];

  uint64_t v44 = objc_opt_class();
  v45 = +[RMModelStatusDiskManagementFileVaultEnabled statusItemType];
  [v88 setObject:v44 forKeyedSubscript:v45];

  uint64_t v46 = objc_opt_class();
  v47 = +[RMModelStatusManagementClientCapabilities statusItemType];
  [v88 setObject:v46 forKeyedSubscript:v47];

  uint64_t v48 = objc_opt_class();
  v49 = +[RMModelStatusManagementDeclarations statusItemType];
  [v88 setObject:v48 forKeyedSubscript:v49];

  uint64_t v50 = objc_opt_class();
  v51 = +[RMModelStatusManagementPushToken statusItemType];
  [v88 setObject:v50 forKeyedSubscript:v51];

  uint64_t v52 = objc_opt_class();
  v53 = +[RMModelStatusMDMApp statusItemType];
  [v88 setObject:v52 forKeyedSubscript:v53];

  uint64_t v54 = objc_opt_class();
  v55 = +[RMModelStatusPasscodeCompliance statusItemType];
  [v88 setObject:v54 forKeyedSubscript:v55];

  uint64_t v56 = objc_opt_class();
  v57 = +[RMModelStatusPasscodeIsPresent statusItemType];
  [v88 setObject:v56 forKeyedSubscript:v57];

  uint64_t v58 = objc_opt_class();
  v59 = +[RMModelStatusScreenSharingConnectionGroupUnresolvedConnections statusItemType];
  [v88 setObject:v58 forKeyedSubscript:v59];

  uint64_t v60 = objc_opt_class();
  v61 = +[RMModelStatusSecurityCertificateList statusItemType];
  [v88 setObject:v60 forKeyedSubscript:v61];

  uint64_t v62 = objc_opt_class();
  v63 = +[RMModelStatusServicesBackgroundTask statusItemType];
  [v88 setObject:v62 forKeyedSubscript:v63];

  uint64_t v64 = objc_opt_class();
  v65 = +[RMModelStatusSoftwareUpdateFailureReason statusItemType];
  [v88 setObject:v64 forKeyedSubscript:v65];

  uint64_t v66 = objc_opt_class();
  v67 = +[RMModelStatusSoftwareUpdateInstallReason statusItemType];
  [v88 setObject:v66 forKeyedSubscript:v67];

  uint64_t v68 = objc_opt_class();
  v69 = +[RMModelStatusSoftwareUpdateInstallState statusItemType];
  [v88 setObject:v68 forKeyedSubscript:v69];

  uint64_t v70 = objc_opt_class();
  v71 = +[RMModelStatusSoftwareUpdatePendingVersion statusItemType];
  [v88 setObject:v70 forKeyedSubscript:v71];

  uint64_t v72 = objc_opt_class();
  v73 = +[RMModelStatusTestArrayValue statusItemType];
  [v88 setObject:v72 forKeyedSubscript:v73];

  uint64_t v74 = objc_opt_class();
  v75 = +[RMModelStatusTestBooleanValue statusItemType];
  [v88 setObject:v74 forKeyedSubscript:v75];

  uint64_t v76 = objc_opt_class();
  v77 = +[RMModelStatusTestDictionaryValue statusItemType];
  [v88 setObject:v76 forKeyedSubscript:v77];

  uint64_t v78 = objc_opt_class();
  v79 = +[RMModelStatusTestErrorValue statusItemType];
  [v88 setObject:v78 forKeyedSubscript:v79];

  uint64_t v80 = objc_opt_class();
  v81 = +[RMModelStatusTestIntegerValue statusItemType];
  [v88 setObject:v80 forKeyedSubscript:v81];

  uint64_t v82 = objc_opt_class();
  v83 = +[RMModelStatusTestRealValue statusItemType];
  [v88 setObject:v82 forKeyedSubscript:v83];

  uint64_t v84 = objc_opt_class();
  v85 = +[RMModelStatusTestStringValue statusItemType];
  [v88 setObject:v84 forKeyedSubscript:v85];

  uint64_t v86 = [v88 copy];
  v87 = (void *)statusItemClassByStatusItemType;
  statusItemClassByStatusItemType = v86;
}

+ (void)ensureClassForStatusItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 classForStatusItemType:&stru_2708A9900];
  v5 = (void *)[(id)statusItemClassByStatusItemType mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  uint64_t v9 = v6;
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v10 = v7;
  char v11 = 0;
  uint64_t v12 = *(void *)v21;
  long long v13 = &_os_log_internal;
  *(void *)&long long v8 = 138543362;
  long long v19 = v8;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v6);
      }
      long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if ([v15 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v16 = [v15 statusItemType];
        if (![v5 objectForKeyedSubscript:v16])
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v17 = NSStringFromClass((Class)v15);
            *(_DWORD *)buf = v19;
            v25 = v17;
            _os_log_impl(&dword_25AF84000, v13, OS_LOG_TYPE_DEFAULT, "Registering status item model class: %{public}@", buf, 0xCu);
          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16, v19, (void)v20);
          char v11 = 1;
        }
      }
    }
    uint64_t v10 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v10);

  if (v11)
  {
    uint64_t v18 = [v5 copy];
    uint64_t v9 = (void *)statusItemClassByStatusItemType;
    statusItemClassByStatusItemType = v18;
LABEL_16:
  }
}

+ (id)allActivationClasses
{
  if (allActivationClasses_onceToken != -1) {
    dispatch_once(&allActivationClasses_onceToken, &__block_literal_global_93);
  }
  uint64_t v2 = (void *)allActivationClasses_activationClasses;
  return v2;
}

void __38__RMModelClasses_allActivationClasses__block_invoke()
{
  id v2 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  [v2 addObject:objc_opt_class()];
  uint64_t v0 = [v2 copy];
  v1 = (void *)allActivationClasses_activationClasses;
  allActivationClasses_activationClasses = v0;
}

+ (id)allConfigurationClasses
{
  if (allConfigurationClasses_onceToken != -1) {
    dispatch_once(&allConfigurationClasses_onceToken, &__block_literal_global_96);
  }
  id v2 = (void *)allConfigurationClasses_configurationClasses;
  return v2;
}

void __41__RMModelClasses_allConfigurationClasses__block_invoke()
{
  id v2 = [MEMORY[0x263EFF980] arrayWithCapacity:29];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  uint64_t v0 = [v2 copy];
  v1 = (void *)allConfigurationClasses_configurationClasses;
  allConfigurationClasses_configurationClasses = v0;
}

+ (id)allAssetClasses
{
  if (allAssetClasses_onceToken != -1) {
    dispatch_once(&allAssetClasses_onceToken, &__block_literal_global_98);
  }
  id v2 = (void *)allAssetClasses_assetClasses;
  return v2;
}

void __33__RMModelClasses_allAssetClasses__block_invoke()
{
  id v2 = [MEMORY[0x263EFF980] arrayWithCapacity:7];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  uint64_t v0 = [v2 copy];
  v1 = (void *)allAssetClasses_assetClasses;
  allAssetClasses_assetClasses = v0;
}

+ (id)allManagementClasses
{
  if (allManagementClasses_onceToken != -1) {
    dispatch_once(&allManagementClasses_onceToken, &__block_literal_global_100);
  }
  id v2 = (void *)allManagementClasses_managementClasses;
  return v2;
}

void __38__RMModelClasses_allManagementClasses__block_invoke()
{
  id v2 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  uint64_t v0 = [v2 copy];
  v1 = (void *)allManagementClasses_managementClasses;
  allManagementClasses_managementClasses = v0;
}

+ (id)allStatusItemClasses
{
  if (allStatusItemClasses_onceToken != -1) {
    dispatch_once(&allStatusItemClasses_onceToken, &__block_literal_global_102);
  }
  id v2 = (void *)allStatusItemClasses_statusItemClasses;
  return v2;
}

void __38__RMModelClasses_allStatusItemClasses__block_invoke()
{
  id v2 = [MEMORY[0x263EFF980] arrayWithCapacity:43];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  uint64_t v0 = [v2 copy];
  v1 = (void *)allStatusItemClasses_statusItemClasses;
  allStatusItemClasses_statusItemClasses = v0;
}

@end