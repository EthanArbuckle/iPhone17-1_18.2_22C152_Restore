@interface MCMachineInfo
+ (id)machineInfoWithKeys:(id)a3 challenge:(id)a4 identity:(__SecIdentity *)a5 additionalInfo:(id)a6 outError:(id *)a7;
+ (id)machineInfoWithKeys:(id)a3 outError:(id *)a4;
@end

@implementation MCMachineInfo

+ (id)machineInfoWithKeys:(id)a3 challenge:(id)a4 identity:(__SecIdentity *)a5 additionalInfo:(id)a6 outError:(id *)a7
{
  id v9 = a3;
  id v47 = a4;
  id v46 = a6;
  v10 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)[v9 count] + [v46 count]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v50;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v15);
        if ([v16 isEqualToString:@"UDID"])
        {
          v17 = MCGestaltGetDeviceUUID();
          v18 = v10;
          v19 = v17;
          CFStringRef v20 = @"UDID";
          goto LABEL_14;
        }
        if ([v16 isEqualToString:@"IMEI"])
        {
          v17 = MCCTIMEI();
          v18 = v10;
          v19 = v17;
          CFStringRef v20 = @"IMEI";
          goto LABEL_14;
        }
        if ([v16 isEqualToString:@"MEID"])
        {
          v17 = MCCTMEID();
          v18 = v10;
          v19 = v17;
          CFStringRef v20 = @"MEID";
          goto LABEL_14;
        }
        if ([v16 isEqualToString:@"VERSION"])
        {
          v17 = MCProductBuildVersion();
          v18 = v10;
          v19 = v17;
          CFStringRef v20 = @"VERSION";
          goto LABEL_14;
        }
        if ([v16 isEqualToString:@"SERIAL"])
        {
          v17 = MCIOSerialString();
          [v10 MCSetObjectIfNotNil:v17 forKey:@"SERIAL"];
          goto LABEL_15;
        }
        if ([v16 isEqualToString:@"PRODUCT"])
        {
          v17 = MCGestaltGetProductName();
          v21 = +[DMCFeatureOverrides productNameWithDefaultValue:v17];
          [v10 MCSetObjectIfNotNil:v21 forKey:@"PRODUCT"];

          goto LABEL_15;
        }
        if ([v16 isEqualToString:@"LANGUAGE"])
        {
          v17 = +[NSLocale preferredLanguages];
          v22 = [v17 firstObject];
          [v10 MCSetObjectIfNotNil:v22 forKey:@"LANGUAGE"];

          goto LABEL_15;
        }
        if ([v16 isEqualToString:@"OS_VERSION"])
        {
          v17 = +[DMCMobileGestalt marketingVersion];
          [v10 MCSetObjectIfNotNil:v17 forKey:@"OS_VERSION"];
          goto LABEL_15;
        }
        if ([v16 isEqualToString:@"SUPPLEMENTAL_BUILD_VERSION"])
        {
          v17 = +[DMCMobileGestalt supplementalBuildVersion];
          v18 = v10;
          v19 = v17;
          CFStringRef v20 = @"SUPPLEMENTAL_BUILD_VERSION";
          goto LABEL_14;
        }
        if ([v16 isEqualToString:@"SUPPLEMENTAL_OS_VERSION_EXTRA"])
        {
          v17 = +[DMCMobileGestalt supplementalMarketingVersionExtra];
          v18 = v10;
          v19 = v17;
          CFStringRef v20 = @"SUPPLEMENTAL_OS_VERSION_EXTRA";
LABEL_14:
          [v18 MCSetObjectIfNotNil:v19 forKey:v20];
LABEL_15:

          goto LABEL_16;
        }
        if ([v16 isEqualToString:@"SOFTWARE_UPDATE_DEVICE_ID"])
        {
          v17 = +[SUUtility currentProductType];
          v23 = +[DMCFeatureOverrides softwareUpdateDeviceIDWithDefaultValue:v17];
          [v10 MCSetObjectIfNotNil:v23 forKey:@"SOFTWARE_UPDATE_DEVICE_ID"];

          goto LABEL_15;
        }
LABEL_16:
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v24 = [v11 countByEnumeratingWithState:&v49 objects:v57 count:16];
      id v13 = v24;
    }
    while (v24);
  }

  if (v47) {
    [v10 setObject:v47 forKey:@"CHALLENGE"];
  }
  [v10 addEntriesFromDictionary:v46];
  v25 = +[NSMutableData data];
  id v48 = 0;
  v26 = +[NSPropertyListSerialization dataWithPropertyList:v10 format:100 options:0 error:&v48];
  id v27 = v48;
  if (v27)
  {
    v28 = v27;
    uint64_t v29 = MCOTAProfilesErrorDomain;
    v30 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v29, 24000, v30, v28, MCErrorTypeFatal, 0);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  if (a5)
  {
    int v32 = SecCMSSignDataAndAttributes();
    if (v32)
    {
LABEL_39:
      uint64_t v33 = MCOTAProfilesErrorDomain;
      v30 = +[NSNumber numberWithInteger:v32];
      v28 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v33, 24001, v28, MCErrorTypeFatal, v30, 0);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
LABEL_53:
    id v34 = 0;
    goto LABEL_54;
  }
  v38 = (const void *)MCLockdownCopyBuiltInIdentity();
  if (v38 || sub_100098F74() && (v38 = (const void *)MCLockdownCopyBuiltInIdentity()) != 0)
  {
    uint64_t v39 = MCLockdownGetDeviceIntermediateCertificates();
    v40 = (void *)v39;
    if (v39)
    {
      uint64_t v55 = kSecCMSAdditionalCerts;
      uint64_t v56 = v39;
      v41 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    }
    else
    {
      v41 = 0;
    }
    int v32 = SecCMSCreateSignedData();
    CFRelease(v38);

    if (v32) {
      goto LABEL_39;
    }
    goto LABEL_53;
  }
  uint64_t v42 = MCInstallationErrorDomain;
  v30 = MCErrorArrayByDevice();
  v28 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v42, 4014, v30, MCErrorTypeFatal, 0);
  id v31 = [v28 MCCopyAsPrimaryError];
LABEL_40:
  id v34 = v31;

  if (v34)
  {
    os_log_t v35 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v36 = v35;
      v37 = [v34 MCVerboseDescription];
      *(_DWORD *)buf = 138543362;
      v54 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Could not create machine info dictionary. Error: %{public}@", buf, 0xCu);
    }
    if (a7)
    {
      id v34 = v34;
      *a7 = v34;
    }
  }
LABEL_54:

  return v25;
}

+ (id)machineInfoWithKeys:(id)a3 outError:(id *)a4
{
  return [a1 machineInfoWithKeys:a3 challenge:0 identity:0 additionalInfo:0 outError:a4];
}

@end