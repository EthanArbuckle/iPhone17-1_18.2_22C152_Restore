@interface PDCarKeyRequirementsChecker
- (BOOL)carAccessFeatureAvailable;
- (BOOL)deviceSupportsCredentials;
- (PDCarKeyRequirementsChecker)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4;
- (id)_carAccessFeature;
- (id)supportedTerminalForConfiguration:(id)a3;
- (id)supportedTerminalForTCIs:(id)a3 brandCode:(int64_t)a4;
- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation PDCarKeyRequirementsChecker

- (PDCarKeyRequirementsChecker)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDCarKeyRequirementsChecker;
  v9 = [(PDCarKeyRequirementsChecker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v10->_databaseManager, a4);
  }

  return v10;
}

- (BOOL)deviceSupportsCredentials
{
  if (qword_100808BE8 != -1) {
    dispatch_once(&qword_100808BE8, &stru_100737370);
  }
  if (byte_100808BE0) {
    return PKIsBeneficiaryAccount() ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)carAccessFeatureAvailable
{
  v2 = [(PDCarKeyRequirementsChecker *)self _carAccessFeature];
  v3 = [v2 supportedTerminals];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (uint64_t)[v6 supportedRadioTechnologies];
    if (!v8)
    {
      v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v62 = (uint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Defaulting to NFC due to missing or invalid radioTechnologies for configuration: %@", buf, 0xCu);
      }

      uint64_t v8 = 1;
    }
    if (PKRadioTechnologyForConfigurationTechnology())
    {
      if ([(PDCarKeyRequirementsChecker *)self deviceSupportsCredentials])
      {
        v10 = [v6 manufacturerIdentifier];
        if (v10 || ([v6 issuerIdentifier], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v11 = [v6 issuerIdentifier];
          unsigned __int8 v12 = +[PKDAManager isCarKeySupportedForManufacturerIdentifier:v10 issuerIdentifier:v11 productPlanIdentifier:0];

          if ((v12 & 1) == 0)
          {
            v23 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v62 = (uint64_t)v6;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Vehicle onboarding check failed for configuration: %@", buf, 0xCu);
            }

            v14 = (void (*)(void *, uint64_t, void, void))v7[2];
            v15 = v7;
            uint64_t v16 = 0;
            goto LABEL_25;
          }
        }
        if (PKPassbookIsCurrentlyDeletedByUser())
        {
          v13 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipping feature enabled check because Wallet is deleted. User will be prompted to redownload Wallet before the configuration can be used.", buf, 2u);
          }

          v14 = (void (*)(void *, uint64_t, void, void))v7[2];
          v15 = v7;
          uint64_t v16 = 1;
LABEL_25:
          v14(v15, v16, 0, 0);
          goto LABEL_26;
        }
        v24 = [v6 pairedReaderIdentifier];
        if ([v24 length])
        {
          v25 = [(PDDatabaseManager *)self->_databaseManager passesWithPairedReaderIdentifier:v24];
          if (objc_msgSend(v25, "pk_hasObjectPassingTest:", &stru_1007373B0))
          {
            v26 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v62 = (uint64_t)v24;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Active credentialed pass already provisioned for '%@'", buf, 0xCu);
            }

            uint64_t v27 = PKSubcredentialProvisioningErrorDomain;
            NSErrorUserInfoKey v55 = NSDebugDescriptionErrorKey;
            CFStringRef v56 = @"pass already provisioned";
            v28 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
            uint64_t v29 = v27;
            uint64_t v30 = 11;
            goto LABEL_50;
          }
        }
        v25 = [(PDCarKeyRequirementsChecker *)self _carAccessFeature];
        if (v25)
        {
          uint64_t v31 = [v6 issuerIdentifier];
          v32 = (void *)v31;
          if (v31)
          {
            v33 = (void *)v31;
            v45 = v25;
            v46 = v24;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id obj = [v25 supportedTerminals];
            id v34 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
            if (v34)
            {
              id v35 = v34;
              uint64_t v36 = *(void *)v49;
              while (2)
              {
                for (i = 0; i != v35; i = (char *)i + 1)
                {
                  if (*(void *)v49 != v36) {
                    objc_enumerationMutation(obj);
                  }
                  v38 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                  v39 = [v38 partnerIdentifier];
                  unsigned int v40 = [v39 isEqualToString:v33];

                  if (v40)
                  {
                    ((void (*)(void *, uint64_t, void *, void))v7[2])(v7, 1, v38, 0);

                    v25 = v45;
                    v24 = v46;
                    v32 = v33;
                    goto LABEL_55;
                  }
                }
                id v35 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
                if (v35) {
                  continue;
                }
                break;
              }
            }

            v41 = PKLogFacilityTypeGetObject();
            v32 = v33;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v62 = (uint64_t)v33;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Credentialed pass feature is supported on device but not with issuer: %@", buf, 0xCu);
            }

            ((void (*)(void *, void, void, void))v7[2])(v7, 0, 0, 0);
            v25 = v45;
            v24 = v46;
          }
          else
          {
            v44 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Credentialed pass feature is supported and no issuer provided. Allowing flow to proceed because it will be blocked with SLG if issuer unsupported.", buf, 2u);
            }

            ((void (*)(void *, uint64_t, void, void))v7[2])(v7, 1, 0, 0);
          }
          goto LABEL_55;
        }
        v42 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Credentialed pass feature is not supported on device", buf, 2u);
        }

        uint64_t v43 = PKSubcredentialProvisioningErrorDomain;
        NSErrorUserInfoKey v53 = NSDebugDescriptionErrorKey;
        CFStringRef v54 = @"Software not supported";
        v28 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        uint64_t v29 = v43;
        uint64_t v30 = 21;
LABEL_50:
        v32 = +[NSError errorWithDomain:v29 code:v30 userInfo:v28];

        ((void (*)(void *, void, void, void *))v7[2])(v7, 0, 0, v32);
LABEL_55:

        goto LABEL_26;
      }
      v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Device does not support provisioning passes with credentials", buf, 2u);
      }

      uint64_t v18 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v57 = NSDebugDescriptionErrorKey;
      CFStringRef v58 = @"Hardware not supported";
      v19 = &v58;
      v20 = &v57;
    }
    else
    {
      v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v62 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device does not support the radio technologies %lu", buf, 0xCu);
      }

      uint64_t v18 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v59 = NSDebugDescriptionErrorKey;
      CFStringRef v60 = @"Hardware not supported";
      v19 = &v60;
      v20 = &v59;
    }
    v22 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v20 count:1];
    v10 = +[NSError errorWithDomain:v18 code:20 userInfo:v22];

    ((void (*)(void *, void, void, void *))v7[2])(v7, 0, 0, v10);
LABEL_26:
  }
}

- (id)supportedTerminalForTCIs:(id)a3 brandCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PDCarKeyRequirementsChecker *)self _carAccessFeature];
  uint64_t v31 = v7;
  if (!v7)
  {
    a4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)a4, OS_LOG_TYPE_DEFAULT, "Native pairing feature is not supported on device", buf, 2u);
    }
    unsigned __int8 v12 = 0;
    goto LABEL_36;
  }
  uint64_t v8 = v7;
  if (a4)
  {
    v9 = [v7 brandIdentifierForBrandCode];
    v10 = +[NSNumber numberWithInteger:a4];
    a4 = [v9 objectForKey:v10];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [v8 supportedTerminals];
  id v34 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (!v34) {
    goto LABEL_31;
  }
  uint64_t v33 = *(void *)v41;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v41 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v35 = v11;
      unsigned __int8 v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v13 = [v12 terminalCriteria];
      id v14 = [v13 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (!v14)
      {
LABEL_22:

        goto LABEL_29;
      }
      id v15 = v14;
      uint64_t v16 = *(void *)v37;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v36 + 1) + 8 * v17);
        if ([v18 technologyType] != (id)4) {
          goto LABEL_20;
        }
        v19 = [v18 primaryTCIs];
        if ([v6 intersectsSet:v19])
        {
        }
        else
        {
          v20 = [v18 TCIs];
          unsigned int v21 = [v6 intersectsSet:v20];

          if (!v21) {
            goto LABEL_20;
          }
        }
        if (!a4)
        {
          id v24 = v12;
          v25 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          *(_DWORD *)buf = 138412290;
          id v45 = v24;
          v26 = v25;
          uint64_t v27 = "Found associated terminal for field: %@";
          uint32_t v28 = 12;
          goto LABEL_27;
        }
        v22 = [v12 partnerIdentifier];
        unsigned int v23 = [(id)a4 isEqualToString:v22];

        if (v23) {
          break;
        }
LABEL_20:
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_22;
        }
      }
      id v29 = v12;
      v25 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412546;
      id v45 = v29;
      __int16 v46 = 2112;
      int64_t v47 = a4;
      v26 = v25;
      uint64_t v27 = "Found associated terminal for field: %@ brandIdentifier: %@";
      uint32_t v28 = 22;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, v28);
LABEL_28:

      if (v12) {
        goto LABEL_32;
      }
LABEL_29:
      uint64_t v11 = v35 + 1;
    }
    while ((id)(v35 + 1) != v34);
    id v34 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  }
  while (v34);
LABEL_31:
  unsigned __int8 v12 = 0;
LABEL_32:

LABEL_36:
  return v12;
}

- (id)supportedTerminalForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(PDCarKeyRequirementsChecker *)self _carAccessFeature];
  if (v5)
  {
    id v6 = [v4 issuerIdentifier];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = objc_msgSend(v5, "supportedTerminals", 0);
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = [v12 partnerIdentifier];
          unsigned __int8 v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            id v15 = v12;
            goto LABEL_14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Credentialed pass feature is supported on device but not with issuer: %@", buf, 0xCu);
    }
    id v15 = 0;
LABEL_14:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_carAccessFeature
{
  v2 = [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator sharedWebServiceContext];
  v3 = [v2 configuration];
  id v4 = PKCurrentRegion();
  v5 = [v3 featureWithType:2 inRegion:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
}

@end