@interface MCCloudConfigurationWriter
+ (id)sharedInstance;
+ (void)setAMFISupervisionFromCloudConfiguration:(id)a3;
- (BOOL)_activationRecordIndicatesCloudConfigurationIsAvailable;
- (BOOL)_isActivated;
- (BOOL)_isCloudConfigurationActuallyAvailable;
- (BOOL)_isCloudConfigurationAvailableInDEP;
- (BOOL)_validateDetails:(id)a3 outReasonWhyInvalid:(id *)a4;
- (BOOL)_writeDetails:(id)a3 toFile:(id)a4;
- (BOOL)finalizeCloudConfigurationOutError:(id *)a3;
- (BOOL)saveCloudConfigurationDetails:(id)a3 outError:(id *)a4;
- (void)faceTimeSignInAttemptDidFinish;
@end

@implementation MCCloudConfigurationWriter

+ (id)sharedInstance
{
  if (qword_100105A40 != -1) {
    dispatch_once(&qword_100105A40, &stru_1000EC260);
  }
  v2 = (void *)qword_100105A38;

  return v2;
}

- (BOOL)_activationRecordIndicatesCloudConfigurationIsAvailable
{
  return CFPreferencesGetAppBooleanValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, kMCNotBackedUpPreferencesDomain, 0) != 0;
}

- (BOOL)_isActivated
{
  return _MCIsDeviceActivated(self, a2);
}

- (BOOL)_writeDetails:(id)a3 toFile:(id)a4
{
  return [a3 MCWriteToBinaryFile:a4];
}

- (void)faceTimeSignInAttemptDidFinish
{
  v3 = +[MDMCloudConfiguration sharedConfiguration];
  v4 = [v3 details];
  id v5 = [v4 mutableCopy];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCAttemptedFaceTimeSignInKey];
  [(MCCloudConfigurationWriter *)self saveCloudConfigurationDetails:v5 outError:0];
}

- (BOOL)_isCloudConfigurationActuallyAvailable
{
  return CFPreferencesGetAppBooleanValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, kMCNotBackedUpPreferencesDomain, 0) != 0;
}

- (BOOL)_isCloudConfigurationAvailableInDEP
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = objc_opt_new();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10007E9E8;
  v10[3] = &unk_1000EC288;
  v12 = &v13;
  v10[4] = self;
  id v5 = v3;
  v11 = v5;
  [v4 fetchConfigurationWithCompletionBlock:v10];
  if (dispatch_semaphore_wait(v5, 0x1BF08EB000uLL))
  {
    *((unsigned char *)v14 + 24) = 1;
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Activation indicates device must be configured using DEP.", v9, 2u);
    }
  }
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)_validateDetails:(id)a3 outReasonWhyInvalid:(id *)a4
{
  id v5 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10007F378;
  v40 = sub_10007F388;
  id v41 = 0;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10007F390;
      v33[3] = &unk_1000EC2B0;
      id v6 = v5;
      id v34 = v6;
      v35 = &v36;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10007F454;
      v31[3] = &unk_1000EC2D8;
      char v7 = objc_retainBlock(v33);
      id v32 = v7;
      v8 = objc_retainBlock(v31);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10007F4C0;
      v29[3] = &unk_1000EC2D8;
      v9 = v7;
      id v30 = v9;
      v10 = objc_retainBlock(v29);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10007F52C;
      v27[3] = &unk_1000EC2D8;
      v11 = v9;
      id v28 = v11;
      v12 = objc_retainBlock(v27);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10007F598;
      v24[3] = &unk_1000EC2B0;
      id v25 = v6;
      v26 = &v36;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10007F76C;
      v22[3] = &unk_1000EC2D8;
      uint64_t v13 = objc_retainBlock(v24);
      id v23 = v13;
      v14 = objc_retainBlock(v22);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10007F7D8;
      v20[3] = &unk_1000EC2D8;
      uint64_t v15 = v13;
      id v21 = v15;
      char v16 = objc_retainBlock(v20);
      if (((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationNameKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationShortNameKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationDepartmentKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressLine1Key)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressLine2Key)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationAddressLine3Key)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationCityKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationRegionKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationZipCodeKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationCountryKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationPhoneKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationMagicKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationEmailKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationSupportPhoneKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCOrganizationSupportEmailKey)
        && ((unsigned int (*)(void *, void))v10[2])(v10, kCCMDMProtocolVersionKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCIsSupervisedKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCAllowPairingKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCIsMandatoryKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCIsMDMUnremovable)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCAwaitDeviceConfiguredKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCDeviceConfiguredKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCCloudConfigurationUICompleteKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCCloudConfigurationWasAppliedKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCPostSetupProfileWasInstalledKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCAttemptedFaceTimeSignInKey)
        && ((unsigned int (*)(void *, void))v10[2])(v10, kCCConfigurationSourceKey)
        && ((unsigned int (*)(void *, void))v14[2])(v14, kCCAnchorCertificatesKey)
        && ((unsigned int (*)(void *, void))v14[2])(v14, kCCSupervisorHostCertificatesKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCConfigurationURLKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCConfigurationWebURLKey)
        && ((unsigned int (*)(void *, void))v16[2])(v16, kCCSkipSetupKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCIsMultiUserKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCAutoAdvanceSetup)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCMAIDUsernameKey)
        && ((unsigned int (*)(void *, void))v8[2])(v8, kCCMAIDHasCredentialKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCLanguageKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCRegionKey)
        && ((unsigned int (*)(void *, void))v12[2])(v12, kCCLanguageScriptKey))
      {
        ((void (*)(void *, void))v10[2])(v10, kCCProvisionalEnrollmentExpiryKey);
      }

      v17 = v34;
    }
    else
    {
      v17 = (void *)v37[5];
      v37[5] = @"not a dictionary";
    }
  }
  v18 = (void *)v37[5];
  if (a4 && v18) {
    *a4 = v18;
  }
  _Block_object_dispose(&v36, 8);

  return v18 == 0;
}

- (BOOL)saveCloudConfigurationDetails:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  if ([(MCCloudConfigurationWriter *)self _isActivated])
  {
    id v76 = 0;
    unsigned __int8 v7 = [(MCCloudConfigurationWriter *)self _validateDetails:v6 outReasonWhyInvalid:&v76];
    id v8 = v76;
    if ((v7 & 1) == 0)
    {
      v20 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v78 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Cannot store cloud configuration because it is invalid: %@", buf, 0xCu);
      }
      uint64_t v21 = MCCloudConfigErrorDomain;
      v12 = MCErrorArray();
      uint64_t v13 = MCErrorTypeFatal;
      uint64_t v14 = v21;
      uint64_t v15 = 33002;
      goto LABEL_14;
    }
    v9 = [v6 objectForKeyedSubscript:kCCConfigurationSourceKey];
    unsigned int v10 = [v9 intValue];

    if (v10 != 1
      && [(MCCloudConfigurationWriter *)self _activationRecordIndicatesCloudConfigurationIsAvailable]&& [(MCCloudConfigurationWriter *)self _isCloudConfigurationAvailableInDEP])
    {
      uint64_t v11 = MCCloudConfigErrorDomain;
      v12 = MCErrorArray();
      uint64_t v13 = MCErrorTypeFatal;
      uint64_t v14 = v11;
      uint64_t v15 = 33004;
LABEL_14:
      v22 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, v15, v12, v13, 0);

      if (a4) {
        *a4 = v22;
      }

LABEL_17:
      BOOL v19 = 0;
      goto LABEL_18;
    }
    uint64_t v24 = kCCAllowPairingKey;
    uint64_t v25 = [v6 objectForKeyedSubscript:kCCAllowPairingKey];
    if (v25
      && (v26 = (void *)v25,
          [v6 objectForKeyedSubscript:v24],
          v27 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v28 = [v27 BOOLValue],
          v27,
          v26,
          (v28 & 1) == 0))
    {
      if ((MCLockdownDeletePairingRecords() & 1) == 0)
      {
        uint64_t v45 = MCCloudConfigErrorDomain;
        v12 = MCErrorArray();
        uint64_t v13 = MCErrorTypeFatal;
        uint64_t v14 = v45;
        uint64_t v15 = 33015;
        goto LABEL_14;
      }
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v29 = 1;
    }
    if (![v6 count])
    {
      v35 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Removing cloud configuration.", buf, 2u);
      }
      id v30 = +[NSFileManager defaultManager];
      uint64_t v36 = MCCloudConfigurationDetailsFilePath();
      [v30 removeItemAtPath:v36 error:0];

LABEL_60:
      MCSendCloudConfigurationDetailsChangedNotification();
      v65 = +[MCRestrictionManagerWriter sharedManager];
      [v65 setBoolValue:v29 forSetting:MCFeatureHostPairingAllowed sender:@"MCCloudConfigurationWriter.SaveCloudConfiguration"];

      v66 = [v6 objectForKeyedSubscript:kCCSkipSetupKey];
      unsigned int v67 = [v66 containsObject:kMCCCSkipSetupDiagnostics];

      if (v67)
      {
        v68 = +[MCRestrictionManagerWriter sharedManager];
        uint64_t v69 = MCFeatureDiagnosticsSubmissionAllowed;
        if (![v68 BOOLSettingForFeature:MCFeatureDiagnosticsSubmissionAllowed]) {
          [v68 setBoolValue:0 forSetting:v69 sender:@"MCCloudConfigurationWriter.SaveCloudConfiguration"];
        }
      }
      v70 = [v6 objectForKeyedSubscript:kCCIsSupervisedKey];
      unsigned int v71 = [v70 BOOLValue];

      if (v71)
      {
        id v72 = +[MCCrypto createAndStoreNewActivationLockBypassCodeAndHashIfNeeded];
        +[MCCloudConfigurationWriter setAMFISupervisionFromCloudConfiguration:v6];
      }
      BOOL v19 = 1;
      goto LABEL_18;
    }
    id v30 = [v6 mutableCopy];
    uint64_t v31 = kCCIsMDMUnremovable;
    id v32 = [v30 objectForKeyedSubscript:kCCIsMDMUnremovable];
    if ([v32 BOOLValue])
    {
      v33 = [v30 objectForKeyedSubscript:kCCIsSupervisedKey];
      unsigned __int8 v34 = [v33 BOOLValue];

      if ((v34 & 1) == 0) {
        [v30 setObject:&__kCFBooleanFalse forKeyedSubscript:v31];
      }
    }
    else
    {
    }
    uint64_t v37 = kCCAwaitDeviceConfiguredKey;
    uint64_t v38 = [v30 objectForKeyedSubscript:kCCAwaitDeviceConfiguredKey];
    if ([v38 BOOLValue])
    {
      v39 = [v30 objectForKeyedSubscript:kCCIsSupervisedKey];
      unsigned __int8 v40 = [v39 BOOLValue];

      if ((v40 & 1) == 0) {
        [v30 setObject:&__kCFBooleanFalse forKeyedSubscript:v37];
      }
    }
    else
    {
    }
    uint64_t v41 = kCCIsMultiUserKey;
    v42 = [v30 objectForKeyedSubscript:kCCIsMultiUserKey];
    if (![v42 BOOLValue])
    {

      goto LABEL_44;
    }
    if (MCGestaltSupportsMultiUser())
    {
      v43 = [v30 objectForKeyedSubscript:kCCIsSupervisedKey];
      unsigned __int8 v44 = [v43 BOOLValue];

      if (v44)
      {
LABEL_44:
        v46 = +[MCActivationUtilities sharedInstance];
        unsigned int v47 = [v46 isHRNMode];

        if ((v47 | 2) == 2)
        {
          uint64_t v48 = kMCCCIsMultiUserKey;
          v49 = [v30 objectForKeyedSubscript:kMCCCIsMultiUserKey];
          unsigned int v50 = [v49 BOOLValue];

          if (v50)
          {
            v51 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Cannot configure device for Shared iPad mode when in HRN mode. Ignoring Shared iPad flag.", buf, 2u);
            }
            [v30 removeObjectForKey:v48];
          }
        }
        os_log_t v52 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v53 = kCCIsSupervisedKey;
          v54 = v52;
          v55 = [v30 objectForKeyedSubscript:v53];
          *(_DWORD *)buf = 138543362;
          id v78 = v55;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Storing cloud configuration. (supervised: %{public}@)", buf, 0xCu);
        }
        v56 = MCCloudConfigurationDetailsFilePath();
        unsigned __int8 v57 = [(MCCloudConfigurationWriter *)self _writeDetails:v30 toFile:v56];

        v58 = _MCLogObjects[0];
        if ((v57 & 1) == 0)
        {
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Could not store cloud configuration.", buf, 2u);
          }
          uint64_t v73 = MCCloudConfigErrorDomain;
          v74 = MCErrorArray();
          v75 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v73, 33023, v74, MCErrorTypeFatal, 0);

          if (a4) {
            *a4 = v75;
          }

          goto LABEL_17;
        }
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Updating CloudConfigUIComplete and CloudConfigWasApplied keys for set aside details.", buf, 2u);
        }
        [v30 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
        [v30 setObject:&__kCFBooleanFalse forKeyedSubscript:kCCCloudConfigurationWasAppliedKey];
        v59 = MCCloudConfigurationSetAsideDetailsFilePath();
        unsigned __int8 v60 = [(MCCloudConfigurationWriter *)self _writeDetails:v30 toFile:v59];

        if ((v60 & 1) == 0)
        {
          v61 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Could not store set aside details.", buf, 2u);
          }
        }
        v62 = MCCloudConfigurationSetAsideDetailsFilePath();
        char v63 = MCSetSkipBackupAttributeToItemAtPath();

        uint64_t v29 = v29;
        if ((v63 & 1) == 0)
        {
          v64 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Could not mark set aside cloud configuration to be excluded from backup.", buf, 2u);
          }
        }
        goto LABEL_60;
      }
    }
    else
    {
    }
    [v30 removeObjectForKey:v41];
    goto LABEL_44;
  }
  char v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Cannot store cloud configuration because this device is not activated.", buf, 2u);
  }
  uint64_t v17 = MCCloudConfigErrorDomain;
  v18 = MCErrorArray();
  +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v17, 33003, v18, MCErrorTypeFatal, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!a4) {
    goto LABEL_17;
  }
  id v8 = v8;
  BOOL v19 = 0;
  *a4 = v8;
LABEL_18:

  return v19;
}

- (BOOL)finalizeCloudConfigurationOutError:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  id v5 = MCCloudConfigurationSetAsideDetailsFilePath();
  id v10 = 0;
  unsigned __int8 v6 = [v4 removeItemAtPath:v5 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    id v8 = _MCLogObjects[8];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to remove set aside cloud configuration. Error: %{public}@", buf, 0xCu);
    }
    if (a3) {
      *a3 = v7;
    }
  }

  return v6;
}

+ (void)setAMFISupervisionFromCloudConfiguration:(id)a3
{
  dispatch_semaphore_t v3 = [a3 objectForKeyedSubscript:kCCConfigurationSourceKey];
  unsigned int v4 = [v3 intValue];

  switch(v4)
  {
    case 5u:
      id v5 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AMFI/SEP setting internal supervision to mimic configurator supervision", (uint8_t *)v7, 2u);
      }
      +[MDMProvisioningProfileTrust didSuperviseThroughConfigurator];
      break;
    case 2u:
      +[MDMProvisioningProfileTrust didSuperviseThroughConfigurator];
      break;
    case 1u:
      +[MDMProvisioningProfileTrust didSuperviseThroughADE];
      break;
    default:
      unsigned __int8 v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67240192;
        v7[1] = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "AMFI/SEP ignoring supervision source: %{public}d", (uint8_t *)v7, 8u);
      }
      break;
  }
}

@end