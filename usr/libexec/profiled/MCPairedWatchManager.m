@interface MCPairedWatchManager
- (BOOL)_updateSupervision:(BOOL)a3 cloudConfigReader:(id)a4 cloudConfigWriter:(id)a5 outError:(id *)a6;
- (DMCEnrollmentFlowController)enrollmentController;
- (NSData)pairingToken;
- (id)_derCertificatesFromPersistentRefArray:(id)a3;
- (id)_errorBadProfile;
- (id)_errorEnrollmentCannotBeStaged;
- (id)_errorEnrollmentMalformed;
- (id)_errorInvalidServiceURL;
- (id)_errorMissingMDMPayload;
- (id)_errorMissingServiceURL;
- (id)_errorPhoneUnsupervised;
- (id)_organizationNameFromProfile:(id)a3 payload:(id)a4;
- (id)_serviceURLFromEnrollmentDictionary:(id)a3 outError:(id *)a4;
- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4;
- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4;
- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 usingProfileInstaller:(id)a5 cloudConfigReader:(id)a6 cloudConfigWriter:(id)a7 completion:(id)a8;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4;
- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3;
- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7;
- (void)setEnrollmentController:(id)a3;
- (void)setPairingToken:(id)a3;
- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9;
- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3;
- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4;
@end

@implementation MCPairedWatchManager

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v19 = (void (**)(id, void))a9;
  v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.stageMDMEnrollmentInfoForPairingWatchWithProfileData", buf, 2u);
  }
  v21 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned __int8 v22 = [v21 isSupervised];

  if ((v22 & 1) != 0
    || (+[MCFeatureOverrides allowUnsupervisedWatchEnrollment] & 1) != 0)
  {
    v23 = objc_opt_new();
    v24 = +[NSNumber numberWithBool:v11];
    [v23 setObject:v24 forKeyedSubscript:kMCWatchEnrollmentSupervisionKey];

    unsigned int v25 = +[DMCFeatureOverrides watchEnrollmentAllowLocalProfile];
    if (v14 && v25) {
      [v23 setObject:v14 forKeyedSubscript:kMCWatchEnrollmentProfileDataKey];
    }
    if (v15) {
      [v23 setObject:v15 forKeyedSubscript:kMCWatchEnrollmentServiceURLKey];
    }
    if (v16)
    {
      v26 = [(MCPairedWatchManager *)self _derCertificatesFromPersistentRefArray:v16];
      [v23 setObject:v26 forKeyedSubscript:kMCWatchEnrollmentAnchorCertificatesKey];
    }
    if (v17)
    {
      v27 = [v17 allObjects];
      [v23 setObject:v27 forKeyedSubscript:kMCWatchEnrollmentDeclarationKeysKey];
    }
    if (v18) {
      [v23 setObject:v18 forKeyedSubscript:kMCWatchEnrollmentDeclarationConfigurationKey];
    }
    v28 = MCSystemWatchEnrollmentDataFilePath();
    unsigned int v29 = [v23 DMCWriteToBinaryFile:v28];

    v30 = _MCLogObjects[0];
    if (v29)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Watch enrollment successfully staged", v35, 2u);
      }
      v19[2](v19, 0);
    }
    else
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Watch enrollment could not be staged", v34, 2u);
      }
      v31 = [(MCPairedWatchManager *)self _errorEnrollmentCannotBeStaged];
      ((void (**)(id, void *))v19)[2](v19, v31);
    }
  }
  else
  {
    v32 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Watch enrollment could not be staged because phone is unsupervised", v36, 2u);
    }
    v23 = [(MCPairedWatchManager *)self _errorPhoneUnsupervised];
    ((void (**)(id, void *))v19)[2](v19, v23);
  }
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  v3 = (void (**)(id, id))a3;
  v4 = +[NSFileManager defaultManager];
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.unstageMDMEnrollmentInfoForPairingWatchWithCompletion", buf, 2u);
  }
  v6 = MCSystemWatchEnrollmentDataFilePath();
  if ([v4 fileExistsAtPath:v6])
  {
    id v10 = 0;
    [v4 removeItemAtPath:v6 error:&v10];
    id v7 = v10;
    if (v7)
    {
      v8 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Watch enrollment failed to unstage with error: %{public}@", buf, 0xCu);
      }
    }
    v3[2](v3, v7);
  }
  else
  {
    v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Watch enrollment could not be unstaged because it does not exist", buf, 2u);
    }
    v3[2](v3, 0);
  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion", v7, 2u);
  }
  v5 = MCSystemWatchEnrollmentDataFilePath();
  v6 = +[NSData MCDataFromFile:v5];

  v3[2](v3, v6, 0);
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken", buf, 2u);
  }
  v9 = MCSystemWatchEnrollmentDataFilePath();
  id v10 = +[NSData MCDataFromFile:v9];

  if (v10)
  {
    id v19 = 0;
    BOOL v11 = +[NSPropertyListSerialization propertyListWithData:v10 options:1 format:0 error:&v19];
    id v12 = v19;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v11 setObject:v6 forKeyedSubscript:kMCWatchEnrollmentPairingTokenKey];
      id v18 = 0;
      v13 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:200 options:0 error:&v18];
      id v14 = v18;

      if (v13)
      {
        id v15 = v13;
        id v16 = 0;
      }
      else
      {
        id v15 = 0;
        id v16 = v14;
      }
      v7[2](v7, v15, v16);
      id v12 = v14;
    }
    else
    {
      id v17 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Watch enrollment is malformed: %{public}@", buf, 0xCu);
      }
      v13 = [(MCPairedWatchManager *)self _errorEnrollmentMalformed];
      v7[2](v7, 0, v13);
    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion", buf, 2u);
  }
  id v6 = MCSystemWatchEnrollmentDataFilePath();
  id v7 = +[NSData MCDataFromFile:v6];

  if (v7)
  {
    id v13 = 0;
    v8 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:0 error:&v13];
    id v9 = v13;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = [v8 objectForKeyedSubscript:kMCWatchEnrollmentDeclarationKeysKey];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        BOOL v11 = +[NSSet setWithArray:v10];
        v4[2](v4, v11, 0);
      }
      else
      {
        v4[2](v4, 0, 0);
      }
    }
    else
    {
      id v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Watch enrollment is malformed: %{public}@", buf, 0xCu);
      }
      id v10 = [(MCPairedWatchManager *)self _errorEnrollmentMalformed];
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);
    }
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 source:(id)a4 usingProfileInstaller:(id)a5 cloudConfigReader:(id)a6 cloudConfigWriter:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, id))a8;
  v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.applyPairingWatchMDMEnrollmentData", buf, 2u);
  }
  id v60 = 0;
  v51 = v14;
  v21 = +[NSPropertyListSerialization propertyListWithData:v14 options:0 format:0 error:&v60];
  id v22 = v60;
  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v24 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Watch enrollment is malformed: %{public}@", buf, 0xCu);
    }
    id v25 = [(MCPairedWatchManager *)self _errorEnrollmentMalformed];
    goto LABEL_11;
  }
  if (+[DMCFeatureOverrides watchEnrollmentAllowLocalProfile](DMCFeatureOverrides, "watchEnrollmentAllowLocalProfile")&& ([v21 objectForKeyedSubscript:kMCWatchEnrollmentProfileDataKey], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v44 = 0;
    v48 = 0;
  }
  else
  {
    v49 = v19;
    id v26 = v18;
    id v27 = v17;
    id v59 = v22;
    uint64_t v28 = [(MCPairedWatchManager *)self _serviceURLFromEnrollmentDictionary:v21 outError:&v59];
    id v25 = v59;

    if (v25)
    {
      id v22 = (id)v28;
      id v17 = v27;
      id v18 = v26;
      id v19 = v49;
LABEL_11:

      v19[2](v19, v25);
      goto LABEL_12;
    }
    v48 = (void *)v28;
    uint64_t v23 = 0;
    id v22 = 0;
    char v44 = 1;
    id v17 = v27;
    id v18 = v26;
    id v19 = v49;
  }
  v50 = (void *)v23;
  v47 = [v21 objectForKeyedSubscript:kMCWatchEnrollmentAnchorCertificatesKey];
  uint64_t v29 = [v21 objectForKeyedSubscript:kMCWatchEnrollmentPairingTokenKey];
  v46 = (void *)v29;
  if (v29)
  {
    [(MCPairedWatchManager *)self setPairingToken:v29];
    v30 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v31 = "applyPairingWatchMDMEnrollmentData: pairingToken extracted from enrollmentDictionary";
  }
  else
  {
    v30 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v31 = "applyPairingWatchMDMEnrollmentData: pairingToken in enrollmentDictionary is nil";
  }
  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
LABEL_22:
  v32 = [v21 objectForKeyedSubscript:kMCWatchEnrollmentSupervisionKey];
  objc_opt_class();
  v45 = v32;
  if (objc_opt_isKindOfClass()) {
    id v33 = [v32 BOOLValue];
  }
  else {
    id v33 = 0;
  }
  id v58 = v22;
  [(MCPairedWatchManager *)self _updateSupervision:v33 cloudConfigReader:v17 cloudConfigWriter:v18 outError:&v58];
  id v25 = v58;

  if (v25)
  {

    id v22 = v50;
    goto LABEL_11;
  }
  id v34 = v17;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10001BD84;
  v56[3] = &unk_1000EB490;
  v57 = v19;
  v35 = objc_retainBlock(v56);
  v36 = v35;
  if (v44)
  {
    v37 = +[DMCEnrollmentFlowController enrollmentFlowControllerWithPresenter:0 managedConfigurationHelper:self];
    [(MCPairedWatchManager *)self setEnrollmentController:v37];

    v38 = [(MCPairedWatchManager *)self enrollmentController];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10001BE68;
    v52[3] = &unk_1000EB6D0;
    v52[4] = self;
    id v53 = v36;
    id v39 = v36;
    v40 = v48;
    [v38 startWatchEnrollmentFlowWithServiceURL:v48 anchorCertificates:v47 restartIfFail:0 completionHandler:v52];

    v41 = v47;
    v42 = v50;
  }
  else
  {
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10001BE54;
    v54[3] = &unk_1000EB6A8;
    id v55 = v35;
    v43 = v35;
    v41 = v47;
    v42 = v50;
    [v16 installProfileData:v50 interactionClient:0 options:0 source:v15 completion:v54];

    v40 = v48;
  }

  id v25 = 0;
  id v17 = v34;
LABEL_12:
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void *, id))a4;
  uint64_t v6 = kDMCPairingParametersSecurityTokenKey;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = +[DMCMobileGestalt deviceUDID];
  id v10 = [v7 objectForKeyedSubscript:kDMCPairingParametersWatchUDIDKey];

  BOOL v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.updateMDMEnrollmentInfoForPairingWatch security token: %@ ; deviceID : %@ ; watchID : %@",
      buf,
      0x20u);
  }
  id v16 = 0;
  id v12 = +[MDMConfiguration getWatchPairingTokenForPhoneID:v9 watchID:v10 securityToken:v8 outError:&v16];
  id v13 = v16;
  if (v13)
  {
    id v14 = 0;
    id v15 = v13;
  }
  else
  {
    id v14 = v12;
    id v15 = 0;
  }
  v5[2](v5, v14, v15);
}

- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4
{
  v5 = +[MCProfileServiceServer sharedServer];
  uint64_t v6 = [(MCPairedWatchManager *)self pairingToken];

  if (v6)
  {
    CFStringRef v13 = @"PAIRING_TOKEN";
    id v7 = [(MCPairedWatchManager *)self pairingToken];
    id v14 = v7;
    v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

    id v9 = [v5 cloudConfigurationMachineInfoDataWithAdditionalInfo:v8];
  }
  else
  {
    id v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MCPairedWatchManager.getMachineIfoForEnrollmentType self.pairingToken==nil", v12, 2u);
    }
    id v9 = [v5 cloudConfigurationMachineInfo];
  }

  return v9;
}

- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4
{
  uint64_t v6 = +[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", a3);
  if (v6)
  {
    id v7 = [v6 payloadsWithClass:objc_opt_class()];
    v8 = [v7 firstObject];

    if (v8)
    {
      id v9 = +[NSMutableDictionary dictionaryWithCapacity:7];
      id v10 = [v6 identifier];
      [v9 setObject:v10 forKeyedSubscript:kMCBridgeProfileIdentifierKey];

      BOOL v11 = [v8 managedAppleID];
      [v9 setObject:v11 forKeyedSubscript:kMCBridgeManagedAppleIDKey];

      id v12 = [v8 assignedManagedAppleID];
      [v9 setObject:v12 forKeyedSubscript:kMCBridgeAssignedManagedAppleIDKey];

      CFStringRef v13 = [v8 friendlyName];
      [v9 setObject:v13 forKeyedSubscript:kMCBridgeFriendlyNameKey];

      id v14 = [(MCPairedWatchManager *)self _organizationNameFromProfile:v6 payload:v8];
      [v9 setObject:v14 forKeyedSubscript:kMCBridgeOrganizationNameKey];

      id v15 = [v8 enrollmentMode];
      [v9 setObject:v15 forKeyedSubscript:kMCBridgeEnrollmentModeKey];

      id v16 = [v8 serverCapabilities];
      [v9 setObject:v16 forKeyedSubscript:kMCBridgeServerCapabilitiesKey];

      id v17 = [v9 copy];
    }
    else if (a4)
    {
      [(MCPairedWatchManager *)self _errorMissingMDMPayload];
      id v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = 0;
    }
  }
  else if (a4)
  {
    [(MCPairedWatchManager *)self _errorBadProfile];
    id v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_organizationNameFromProfile:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 organization];

  if (v7)
  {
    v8 = v6;
LABEL_5:
    id v10 = [v8 organization];
    goto LABEL_6;
  }
  id v9 = [v5 organization];

  if (v9)
  {
    v8 = v5;
    goto LABEL_5;
  }
  id v10 = [v6 serverURLString];

  if (v10)
  {
    id v12 = [v6 serverURLString];
    CFStringRef v13 = +[NSURL URLWithString:v12];

    if (v13)
    {
      id v10 = [v13 host];
    }
    else
    {
      id v10 = 0;
    }
  }
LABEL_6:

  return v10;
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = objc_opt_new();
  [v14 setObject:v12 forKeyedSubscript:kMCInstallProfileOptionPersonaID];

  [v14 setObject:v11 forKeyedSubscript:kMCInstallProfileOptionRMAccountIdentifier];
  if (v12) {
    [v14 setObject:kDMCProfileInstallationSourceAccountDrivenUserEnrollment forKeyedSubscript:kMCInstallProfileOptionInstallationSource];
  }
  [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
  [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:kMCInstallProfileOptionIsCloudProfile];
  id v15 = +[MCProfileServiceServer sharedServer];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C6CC;
  v17[3] = &unk_1000EB6A8;
  id v18 = v10;
  id v16 = v10;
  [v15 installProfileData:v13 interactionClient:0 options:v14 source:@"MCPairedWatchManager" completion:v17];
}

- (id)_derCertificatesFromPersistentRefArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v15 = v3;
    id v4 = [(id)objc_opt_class() copyCertificatesWithPersistentIDs:v3 useSystemKeychain:1 enforcePersonalPersona:0];
    id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          CFDataRef v11 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v16 + 1) + 8 * i));
          [v5 addObject:v11];
          id v12 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "_derCertificatesFromPersistentRefArray :: converted persistentRef to der NSData", buf, 2u);
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }

    id v3 = v15;
  }
  else
  {
    id v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
    }
    id v5 = 0;
  }

  return v5;
}

- (id)_serviceURLFromEnrollmentDictionary:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:kMCWatchEnrollmentServiceURLKey];
  if (v7)
  {
    id v8 = +[NSURL URLWithString:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543362;
        id v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Watch enrollment service URL is invalid: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      if (a4)
      {
        *a4 = [(MCPairedWatchManager *)self _errorInvalidServiceURL];
      }
    }
  }
  else
  {
    CFDataRef v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Watch enrollment is missing a profile service URL: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    if (a4)
    {
      [(MCPairedWatchManager *)self _errorMissingServiceURL];
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_updateSupervision:(BOOL)a3 cloudConfigReader:(id)a4 cloudConfigWriter:(id)a5 outError:(id *)a6
{
  BOOL v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 refreshDetailsFromDisk];
  CFDataRef v11 = [v9 details];
  id v12 = [v11 mutableCopy];

  if (v12)
  {
    id v13 = +[NSNumber numberWithBool:v8];
    [v12 setObject:v13 forKeyedSubscript:kMCCCIsSupervisedKey];
  }
  else
  {
    id v12 = [(id)objc_opt_class() canonicalConfigurationWithSupervision:v8];
  }
  [v12 setObject:&off_1000F5140 forKeyedSubscript:kCCConfigurationSourceKey];
  unsigned __int8 v14 = [v10 saveCloudConfigurationDetails:v12 outError:a6];
  if (v14)
  {
    [v10 finalizeCloudConfigurationOutError:0];
  }
  else
  {
    id v15 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v16 = *a6;
      int v18 = 138543362;
      id v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Watch enrollment failed to apply supervision state: %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }

  return v14;
}

- (id)_errorEnrollmentCannotBeStaged
{
  uint64_t v2 = MDMErrorDomain;
  id v3 = DMCErrorArray();
  id v4 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12116, v3, DMCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorPhoneUnsupervised
{
  uint64_t v2 = MDMErrorDomain;
  id v3 = DMCErrorArray();
  id v4 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12121, v3, DMCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorEnrollmentMalformed
{
  uint64_t v2 = MDMErrorDomain;
  id v3 = DMCErrorArray();
  id v4 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12008, v3, DMCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorMissingServiceURL
{
  uint64_t v2 = MDMErrorDomain;
  id v3 = DMCErrorArray();
  id v4 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12117, v3, DMCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorInvalidServiceURL
{
  uint64_t v2 = MDMErrorDomain;
  id v3 = DMCErrorArray();
  id v4 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12118, v3, DMCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorBadProfile
{
  uint64_t v2 = MDMErrorDomain;
  id v3 = DMCErrorArray();
  id v4 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12119, v3, DMCErrorTypeFatal, 0);

  return v4;
}

- (id)_errorMissingMDMPayload
{
  uint64_t v2 = MDMErrorDomain;
  id v3 = DMCErrorArray();
  id v4 = +[NSError DMCErrorWithDomain:code:descriptionArray:errorType:](NSError, "DMCErrorWithDomain:code:descriptionArray:errorType:", v2, 12120, v3, DMCErrorTypeFatal, 0);

  return v4;
}

- (DMCEnrollmentFlowController)enrollmentController
{
  return self->_enrollmentController;
}

- (void)setEnrollmentController:(id)a3
{
}

- (NSData)pairingToken
{
  return self->_pairingToken;
}

- (void)setPairingToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingToken, 0);

  objc_storeStrong((id *)&self->_enrollmentController, 0);
}

@end