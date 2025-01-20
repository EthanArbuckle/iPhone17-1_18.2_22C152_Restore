@interface MCNewMDMPayloadHandler
+ (id)_exchangeSyncUUIDString;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_cannotCheckInErrorWithName:(id)a3;
- (id)_mdmDictWithInstaller:(id)a3 options:(id)a4 payload:(id)a5;
- (id)persistentRefForUUID:(id)a3 outError:(id *)a4;
- (id)persistentRefsForUUIDs:(id)a3 outError:(id *)a4;
- (void)_releaseDependency;
- (void)_retainDependency;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)removeWithInstaller:(id)a3 options:(id)a4;
- (void)setAside;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
@end

@implementation MCNewMDMPayloadHandler

+ (id)_exchangeSyncUUIDString
{
  v2 = +[NSUUID UUID];
  v17[0] = 0;
  v17[1] = 0;
  [v2 getUUIDBytes:v17];
  v3 = +[NSData dataWithBytes:v17 length:16];
  signed int v4 = (8 * [v3 length]) | 4;
  uint64_t v5 = (v4 / 5);
  id v6 = [v3 mutableCopy];
  [v6 appendBytes:&unk_1001058C0 length:4];
  id v7 = v6;
  v8 = (char *)[v7 bytes];
  v9 = malloc_type_calloc((int)v5 + 1, (int)v5, 0x857E69E5uLL);
  v10 = v9;
  if (v4 >= 5)
  {
    unsigned int v11 = 0;
    v12 = v9;
    do
    {
      unsigned int v13 = (16 * ((v8[v11 >> 3] >> (~(_BYTE)v11 & 7)) & 1)) | (8
                                                                            * ((v8[(unint64_t)(v11 + 1) >> 3] >> (~(v11 + 1) & 7)) & 1)) | (4 * ((v8[(unint64_t)(v11 + 2) >> 3] >> (~(v11 + 2) & 7)) & 1)) | (2 * ((v8[(unint64_t)(v11 + 3) >> 3] >> (~(v11 + 3) & 7)) & 1)) | (v8[(unint64_t)(v11 + 4) >> 3] >> (~(v11 + 4) & 7)) & 1;
      if (v13 >= 0xA) {
        char v14 = 55;
      }
      else {
        char v14 = 48;
      }
      *v12++ = v14 + v13;
      v11 += 5;
      --v5;
    }
    while (v5);
  }
  v15 = +[NSString stringWithUTF8String:v9];
  free(v10);

  return v15;
}

- (id)_cannotCheckInErrorWithName:(id)a3
{
  uint64_t v3 = MCMDMErrorDomain;
  signed int v4 = MCErrorArray();
  uint64_t v5 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 12002, v4, MCErrorTypeNeedsRetry, a3, 0);

  return v5;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = +[NSFileManager defaultManager];
  uint64_t v12 = kMDMPasscodeKey;
  uint64_t v13 = [v10 objectForKeyedSubscript:kMDMPasscodeKey];
  if (v13)
  {
    id v14 = [v10 mutableCopy];
    [v14 removeObjectForKey:v12];
    id v15 = [v14 copy];

    id v10 = v15;
  }
  v16 = MDMFilePath();
  unsigned int v17 = [v11 fileExistsAtPath:v16];

  v105 = (void *)v13;
  v106 = v10;
  v104 = v9;
  if (v17)
  {
    uint64_t v18 = MCMDMErrorDomain;
    v19 = MCErrorArray();
    uint64_t v20 = MCErrorTypeFatal;
    uint64_t v21 = v18;
    uint64_t v22 = 12001;
    goto LABEL_7;
  }
  v23 = +[MCRestrictionManager sharedManager];
  unsigned int v24 = [v23 effectiveRestrictedBoolForSetting:MCFeatureMDMEnrollmentAllowed];

  if (v24 != 2)
  {
    v44 = [(MCNewPayloadHandler *)self payload];
    v45 = [v44 identityUUID];
    id v110 = 0;
    v46 = [(MCNewMDMPayloadHandler *)self persistentRefForUUID:v45 outError:&v110];
    id v27 = v110;

    if (v27)
    {
      int v28 = 0;
      goto LABEL_48;
    }
    v103 = v46;
    [v44 setIdentityPersistentID:v46];
    v47 = [v44 serverPinningUUIDs];
    id v109 = 0;
    v48 = [(MCNewMDMPayloadHandler *)self persistentRefsForUUIDs:v47 outError:&v109];
    id v27 = v109;

    if (v27)
    {
      int v28 = 0;
LABEL_47:

      v46 = v103;
LABEL_48:

      if (v27) {
        goto LABEL_8;
      }
LABEL_49:
      MDMSendDevicePostureChangedNotification();
      goto LABEL_50;
    }
    v101 = v48;
    [v44 setServerPinningPersistentRefs:v48];
    v49 = [v44 checkInPinningUUIDs];
    id v108 = 0;
    uint64_t v50 = [(MCNewMDMPayloadHandler *)self persistentRefsForUUIDs:v49 outError:&v108];
    id v27 = v108;

    v102 = (void *)v50;
    if (v27) {
      goto LABEL_20;
    }
    [v44 setCheckInPinningPersistentRefs:v50];
    v51 = +[MCActivationUtilities sharedInstance];
    unsigned int v52 = [v51 isHRNMode];

    if (v52 == 2)
    {
      v58 = [v44 pollingIntervalMinutes];
      v55 = v58;
      v53 = v103;
      if (v58)
      {
        if ((uint64_t)[v58 integerValue] > 4)
        {
          id v27 = 0;
LABEL_34:

          if (v27)
          {
LABEL_20:
            int v28 = 0;
            v48 = v101;
LABEL_46:

            goto LABEL_47;
          }
LABEL_35:
          v68 = [(MCNewMDMPayloadHandler *)self _mdmDictWithInstaller:v9 options:v10 payload:v44];
          v69 = MDMFilePath();
          v95 = v68;
          [v68 MCWriteToBinaryFile:v69];

          v70 = +[MDMConfiguration sharedConfiguration];
          [v70 refreshDetailsFromDisk];

          MDMSendManagingOrgInfoChangedNotification();
          +[MDMProvisioningProfileTrust didEnrollInMDMWithPasscode:v13 duringMigration:0];
          v71 = [v44 checkInURLString];
          v96 = a6;
          if ([v71 length]) {
            [v44 checkInURLString];
          }
          else {
          v72 = [v44 serverURLString];
          }
          uint64_t v100 = +[NSURL URLWithString:v72];

          v73 = [(MCNewPayloadHandler *)self profileHandler];
          v74 = [v73 profile];
          id v75 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v53, [v74 isInstalledForSystem]);

          if (v75)
          {
            v97 = objc_opt_class();
            v76 = [v44 checkInPinningPersistentRefs];
            v77 = [(MCNewPayloadHandler *)self profileHandler];
            v78 = [v77 profile];
            id v98 = [v97 copyCertificatesWithPersistentIDs:v76 useSystemKeychain:[v78 isInstalledForSystem]];

            +[MDMClient sharedClient];
            v91 = v94 = v75;
            unsigned int v93 = [v44 pinningRevocationCheckRequired];
            v79 = [v44 topic];
            unsigned int v92 = [v44 useDevelopmentAPNS];
            unsigned __int8 v90 = [v44 signMessage];
            LOBYTE(v78) = [v44 isUserEnrollment];
            v80 = [v44 enrollmentID];
            id v107 = 0;
            BYTE1(v88) = (_BYTE)v78;
            LOBYTE(v88) = v90;
            [v91 authenticateWithCheckInURL:v100 identity:v94 pinnedSecCertificateRefs:v98 pinningRevocationCheckRequired:v93 topic:v79 useDevelopmentAPNS:v88 signMessage:v80 isUserEnrollment:v92 enrollmentID:v107 outError:&v107];
            id v27 = v107;

            CFRelease(v94);
            if (v27)
            {
              a6 = v96;
            }
            else
            {
              [(MCNewMDMPayloadHandler *)self _retainDependency];
              v84 = [v44 serverCapabilities];
              unsigned int v85 = [v84 containsObject:kMDMUserChannelCapability];

              a6 = v96;
              if (v85)
              {
                v86 = +[MDMUserClient sharedClient];
                [v86 scheduleTokenUpdate];
              }
            }
            v83 = (void *)v100;
            v48 = v101;
            v82 = v95;
            v81 = v98;
          }
          else
          {
            v81 = [v44 friendlyName];
            id v27 = [(MCNewMDMPayloadHandler *)self _cannotCheckInErrorWithName:v81];
            v82 = v95;
            v83 = (void *)v100;
            v48 = v101;
          }

          int v28 = 1;
          goto LABEL_46;
        }
        v99 = v55;
        uint64_t v59 = MCMDMErrorDomain;
        uint64_t v89 = [v44 friendlyName];
        v56 = (void *)v89;
        uint64_t v60 = MCErrorArray();
        uint64_t v61 = MCErrorTypeFatal;
        v62 = (void *)v60;
        uint64_t v63 = v59;
        uint64_t v64 = 12096;
      }
      else
      {
        v99 = 0;
        uint64_t v67 = MCMDMErrorDomain;
        uint64_t v89 = [v44 friendlyName];
        v56 = (void *)v89;
        uint64_t v60 = MCErrorArray();
        uint64_t v61 = MCErrorTypeFatal;
        v62 = (void *)v60;
        uint64_t v63 = v67;
        uint64_t v64 = 12097;
      }
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v63, v64, v60, v61, v89, 0);
      id v27 = (id)objc_claimAutoreleasedReturnValue();

      v55 = v99;
    }
    else
    {
      v53 = v103;
      if (v52 == 1)
      {
        v65 = [v44 topic];

        if (v65) {
          goto LABEL_35;
        }
        uint64_t v66 = MCMDMErrorDomain;
        v55 = [v44 friendlyName];
        v56 = MCErrorArray();
        +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v66, 12098, v56, MCErrorTypeFatal, v55, 0);
        id v57 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v52) {
          goto LABEL_35;
        }
        uint64_t v54 = MCMDMErrorDomain;
        v55 = MCErrorArray();
        v56 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v54, 12099, v55, MCErrorTypeFatal, 0);
        id v57 = [v56 MCCopyAsPrimaryError];
      }
      id v27 = v57;
    }

    v53 = v103;
    goto LABEL_34;
  }
  uint64_t v25 = MCMDMErrorDomain;
  v19 = MCErrorArray();
  uint64_t v20 = MCErrorTypeFatal;
  uint64_t v21 = v25;
  uint64_t v22 = 12088;
LABEL_7:
  v26 = +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v21, v22, v19, v20, 0);
  id v27 = [v26 MCCopyAsPrimaryError];

  int v28 = 0;
  if (!v27) {
    goto LABEL_49;
  }
LABEL_8:
  v29 = v11;
  uint64_t v30 = MCInstallationErrorDomain;
  v31 = self;
  v32 = [(MCNewPayloadHandler *)self payload];
  [v32 friendlyName];
  v34 = v33 = a6;
  v35 = MCErrorArray();
  v36 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v30, 4001, v35, v27, MCErrorTypeFatal, v34, 0);

  if (v33) {
    id *v33 = v36;
  }
  os_log_t v37 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v38 = v37;
    v39 = [(MCNewPayloadHandler *)v31 payload];
    v40 = [v39 friendlyName];
    v41 = [v36 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v112 = v40;
    __int16 v113 = 2114;
    v114 = v41;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Cannot install MDM “%{public}@”. Error: %{public}@", buf, 0x16u);
  }
  unsigned int v11 = v29;
  if (v28)
  {
    v42 = MDMFilePath();
    [v29 removeItemAtPath:v42 error:0];

    v43 = +[MDMConfiguration sharedConfiguration];
    [v43 refreshDetailsFromDisk];

    MDMSendManagingOrgInfoChangedNotification();
  }

LABEL_50:
  return v27 == 0;
}

- (id)_mdmDictWithInstaller:(id)a3 options:(id)a4 payload:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = +[NSMutableDictionary dictionary];
  uint64_t v13 = [v10 profile];
  uint64_t v14 = [v13 identifier];
  [v12 setObject:v14 forKey:kMDMManagingProfileIdentifierKey];

  id v15 = [v10 identityPersistentID];
  [v12 MCSetObjectIfNotNil:v15 forKey:kMDMIdentityPersistentRefKey];

  v16 = [v10 serverPinningPersistentRefs];
  [v12 MCSetObjectIfNotNil:v16 forKey:kMDMServerPinningCertPersistentRefsKey];

  unsigned int v17 = [v10 checkInPinningPersistentRefs];
  [v12 MCSetObjectIfNotNil:v17 forKey:kMDMCheckInPinningCertPersistentRefsKey];

  uint64_t v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 pinningRevocationCheckRequired]);
  [v12 setObject:v18 forKey:kMDMPinningRevocationCheckRequiredKey];

  v19 = [v10 topic];
  [v12 MCSetObjectIfNotNil:v19 forKey:kMDMTopicKey];

  uint64_t v20 = [v10 pollingIntervalMinutes];
  [v12 MCSetObjectIfNotNil:v20 forKey:kMDMPollingIntervalKey];

  uint64_t v21 = [v10 serverURLString];
  [v12 MCSetObjectIfNotNil:v21 forKey:kMDMServerURLKey];

  uint64_t v22 = [v10 checkInURLString];
  [v12 MCSetObjectIfNotNil:v22 forKey:kMDMCheckInURLKey];

  v23 = [v10 serverCapabilities];
  [v12 MCSetObjectIfNotNil:v23 forKey:kMDMServerCapabilitiesKey];

  unsigned int v24 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v10 accessRights]);
  [v12 setObject:v24 forKey:kMDMAccessRightsKey];

  uint64_t v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 useDevelopmentAPNS]);
  [v12 setObject:v25 forKey:kMDMUseDevelopmentAPNSKey];

  v26 = +[NSString MCMakeUUID];
  [v12 setObject:v26 forKey:kMDMPushMagicKey];

  id v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 signMessage]);
  [v12 setObject:v27 forKey:kMDMSignMessageKey];

  int v28 = [v10 enrollmentMode];
  [v12 MCSetObjectIfNotNil:v28 forKey:kMDMEnrollmentModeKey];

  v29 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionIsESSOEnrollment];
  LOBYTE(v14) = [v29 BOOLValue];

  if (v14)
  {
    uint64_t v30 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionESSOAppITunesStoreID];
    [v12 MCSetObjectIfNotNil:v30 forKey:kMDMRequiredAppIDForMDMKey];
    [v10 setRequiredAppIDForMDM:v30];
  }
  else
  {
    uint64_t v30 = [v10 requiredAppIDForMDM];
    [v12 MCSetObjectIfNotNil:v30 forKey:kMDMRequiredAppIDForMDMKey];
  }

  uint64_t v31 = +[MCMDMOptionsUtilities defaultMDMOptions];
  if (v31) {
    [v12 setObject:v31 forKeyedSubscript:kMDMOptionsKey];
  }
  v32 = [v11 setAsideDictionariesForPayloadHandlerClass:objc_opt_class()];

  v70 = (void *)v31;
  if ([v32 count] == (id)1)
  {
    v33 = [v32 anyObject];
    v34 = [v33 objectForKeyedSubscript:kMDMPersonaKey];
  }
  else
  {
    v34 = 0;
  }
  if ([v10 isUserEnrollment])
  {
    SEL v67 = a2;
    v68 = v32;
    v69 = self;
    if ([v32 count] == (id)1)
    {
      [v32 anyObject];
      v65 = v34;
      v36 = id v35 = v9;
      uint64_t v37 = kMDMEnrollmentIDKey;
      v38 = [v36 objectForKeyedSubscript:kMDMEnrollmentIDKey];
      uint64_t v39 = kMDMiCloudEnrollmentIDKey;
      v40 = [v36 objectForKeyedSubscript:kMDMiCloudEnrollmentIDKey];
      uint64_t v41 = kMDMEASEnrollmentIDKey;
      v42 = [v36 objectForKeyedSubscript:kMDMEASEnrollmentIDKey];

      id v9 = v35;
      v34 = v65;
    }
    else
    {
      v43 = +[NSUUID UUID];
      v38 = [v43 UUIDString];

      v44 = +[NSUUID UUID];
      uint64_t v66 = [v44 UUIDString];

      v42 = [(id)objc_opt_class() _exchangeSyncUUIDString];
      v45 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v72 = v42;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Generated new EAS Enrollment ID: %{private}@", buf, 0xCu);
      }
      uint64_t v37 = kMDMEnrollmentIDKey;
      uint64_t v39 = kMDMiCloudEnrollmentIDKey;
      uint64_t v41 = kMDMEASEnrollmentIDKey;
      v40 = (void *)v66;
    }
    [v12 setObject:v38 forKeyedSubscript:v37];
    [v12 setObject:v40 forKeyedSubscript:v39];
    [v12 setObject:v42 forKeyedSubscript:v41];
    [v10 setEnrollmentID:v38];
    [v10 setICloudEnrollmentID:v40];
    [v10 setEasEnrollmentID:v42];
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:kMDMUserEnrollmentKey];
    if (v34)
    {
      uint64_t v46 = [v10 personaID];
      if (v46)
      {
        v47 = (void *)v46;
        v48 = [v10 personaID];
        unsigned __int8 v49 = [v48 isEqualToString:v34];

        if ((v49 & 1) == 0)
        {
          uint64_t v50 = +[NSAssertionHandler currentHandler];
          v51 = [v10 personaID];
          [v50 handleFailureInMethod:v67, v69, @"MCNewMDMPayloadHandler.m", 377, @"Persona ID from the new payload (%@) and the old payload (%@) doesn't match!!!", v51, v34 object file lineNumber description];
        }
      }
    }

    v32 = v68;
    self = v69;
  }
  uint64_t v52 = [v10 personaID];
  v53 = (void *)v52;
  if (v52) {
    uint64_t v54 = (void *)v52;
  }
  else {
    uint64_t v54 = v34;
  }
  [v10 setPersonaID:v54];

  v55 = [v10 personaID];
  [v12 setObject:v55 forKeyedSubscript:kMDMPersonaKey];

  v56 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudProfile];
  id v57 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v56 BOOLValue]);
  [v12 setObject:v57 forKeyedSubscript:kMDMIsADEProfileKey];

  v58 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionIsCloudLocked];
  LODWORD(v56) = [v58 BOOLValue];

  uint64_t v59 = [(MCNewPayloadHandler *)self profileHandler];
  uint64_t v60 = [v59 profile];
  uint64_t v61 = v56 | [v60 isLocked];

  v62 = +[NSNumber numberWithBool:v61];
  [v12 setObject:v62 forKeyedSubscript:kMDMIsProfileLockedKey];

  uint64_t v63 = [v9 objectForKeyedSubscript:kMCInstallProfileOptionRMAccountIdentifier];
  if (v63)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v12 setObject:v63 forKeyedSubscript:kMDMRMAccountIDKey];
    }
  }

  return v12;
}

- (id)persistentRefForUUID:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = [(MCNewPayloadHandler *)self profileHandler];
  v8 = [v7 persistentIDForCertificateUUID:v6];

  if (v8)
  {
    id v9 = v8;
  }
  else if (a4)
  {
    uint64_t v10 = MCMDMErrorDomain;
    id v11 = [(MCNewPayloadHandler *)self payload];
    uint64_t v12 = [v11 friendlyName];
    uint64_t v13 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v10, 12005, v13, MCErrorTypeFatal, v12, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)persistentRefsForUUIDs:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[MCNewMDMPayloadHandler persistentRefForUUID:outError:](self, "persistentRefForUUID:outError:", *(void *)(*((void *)&v17 + 1) + 8 * i), a4, (void)v17);
        if (!v13)
        {

          id v15 = 0;
          goto LABEL_11;
        }
        uint64_t v14 = (void *)v13;
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = v7;
LABEL_11:

  return v15;
}

- (void)_retainDependency
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = [v2 identityPersistentID];
  signed int v4 = +[NSMutableArray arrayWithObject:v3];

  uint64_t v5 = [v2 serverPinningPersistentRefs];
  if (v5) {
    [v4 addObjectsFromArray:v5];
  }
  v16 = (void *)v5;
  id v6 = [v2 checkInPinningPersistentRefs];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
  id v7 = +[MCDependencyManager sharedManager];
  id v8 = [v2 UUID];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    uint64_t v13 = kMCDMCertificateToPayloadUUIDDependencyKey;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) MCHexString];
        [v7 addDependent:v8 ofParent:v15 inDomain:v13];

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)_releaseDependency
{
  v2 = [(MCNewPayloadHandler *)self payload];
  uint64_t v3 = [v2 identityPersistentID];
  signed int v4 = +[NSMutableArray arrayWithObject:v3];

  uint64_t v5 = [v2 serverPinningPersistentRefs];
  id v6 = [v2 serverPinningPersistentRefs];

  if (v6) {
    [v4 addObjectsFromArray:v5];
  }
  long long v18 = (void *)v5;
  id v7 = [v2 checkInPinningPersistentRefs];
  id v8 = [v2 checkInPinningPersistentRefs];

  if (v8) {
    [v4 addObjectsFromArray:v7];
  }
  id v9 = +[MCDependencyManager sharedManager];
  id v10 = [v2 UUID];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    uint64_t v15 = kMCDMCertificateToPayloadUUIDDependencyKey;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) MCHexString];
        [v9 removeDependent:v10 fromParent:v17 inDomain:v15];

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
}

- (void)setAside
{
  uint64_t v3 = MDMFilePath();
  signed int v4 = +[NSData dataWithContentsOfFile:v3];
  uint64_t v5 = +[NSPropertyListSerialization MCSafePropertyListWithData:v4 options:0 format:0 error:0];
  setAsideDictionary = self->_setAsideDictionary;
  self->_setAsideDictionary = v5;

  id v7 = +[MCKeychain stringFromService:kMDMServiceKey account:kMDMEscrowSecretAccountKey label:0 description:0 useSystemKeychain:0 outError:0];
  setAsideEscrowSecret = self->_setAsideEscrowSecret;
  self->_setAsideEscrowSecret = v7;

  id v9 = +[NSFileManager defaultManager];
  id v10 = MDMFilePath();
  id v16 = 0;
  [v9 removeItemAtPath:v10 error:&v16];
  id v11 = v16;

  if (v11)
  {
    os_log_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      id v13 = v12;
      uint64_t v14 = MDMFilePath();
      *(_DWORD *)buf = 136315650;
      long long v18 = "-[MCNewMDMPayloadHandler setAside]";
      __int16 v19 = 2112;
      long long v20 = v14;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to remove item at path: %@ with error: %@", buf, 0x20u);
    }
  }
  uint64_t v15 = +[MDMConfiguration sharedConfiguration];
  [v15 refreshDetailsFromDisk];

  MDMSendManagingOrgInfoChangedNotification();
  self->_setAside = 1;
  [(MCNewMDMPayloadHandler *)self _releaseDependency];
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCNewMDMPayloadHandler;
  [(MCNewPayloadHandler *)&v12 setAsideWithInstaller:v4];
  uint64_t v5 = [(MCNewPayloadHandler *)self payload];
  id v6 = objc_opt_new();
  id v7 = [v5 enrollmentID];
  [v6 setObject:v7 forKeyedSubscript:kMDMEnrollmentIDKey];

  id v8 = [v5 iCloudEnrollmentID];
  [v6 setObject:v8 forKeyedSubscript:kMDMiCloudEnrollmentIDKey];

  id v9 = [v5 easEnrollmentID];
  [v6 setObject:v9 forKeyedSubscript:kMDMEASEnrollmentIDKey];

  id v10 = [v5 personaID];
  [v6 setObject:v10 forKeyedSubscript:kMDMPersonaKey];

  if ([v6 count])
  {
    id v11 = [v6 copy];
    [v4 addSetAsideDictionary:v11 forPayloadHandlerClass:objc_opt_class()];
  }
}

- (void)unsetAside
{
  if (self->_setAside)
  {
    setAsideDictionary = self->_setAsideDictionary;
    id v4 = MDMFilePath();
    [(NSMutableDictionary *)setAsideDictionary MCWriteToBinaryFile:v4];

    uint64_t v5 = self->_setAsideDictionary;
    self->_setAsideDictionary = 0;

    id v6 = +[MDMConfiguration sharedConfiguration];
    [v6 refreshDetailsFromDisk];

    setAsideEscrowSecret = self->_setAsideEscrowSecret;
    if (setAsideEscrowSecret)
    {
      LOWORD(v10) = 256;
      +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", setAsideEscrowSecret, kMDMServiceKey, kMDMEscrowSecretAccountKey, 0, 0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0, v10, 0);
      id v8 = self->_setAsideEscrowSecret;
      self->_setAsideEscrowSecret = 0;
    }
    [(MCNewMDMPayloadHandler *)self _retainDependency];
    self->_setAside = 0;
    id v9 = +[MDMClient sharedClient];
    [v9 notifyNewConfiguration];

    if (+[DMCMultiUserModeUtilities inSharediPadUserSession])
    {
      id v11 = +[MDMUserClient sharedClient];
      [v11 notifyNewConfiguration];
    }
  }
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  uint64_t v5 = [a4 objectForKeyedSubscript:kMCRemoveProfileOptionRemovedDueToMigrationFromOtherDevice];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = +[MDMConfiguration sharedConfiguration];
  id v8 = [v7 rmAccountID];

  if (!self->_setAside)
  {
    id v9 = [(MCNewPayloadHandler *)self payload];
    uint64_t v10 = &os_unfair_lock_unlock_ptr;
    if ([v9 checkOutWhenRemoved])
    {
      id v11 = [v9 identityPersistentID];
      objc_super v12 = [(MCNewPayloadHandler *)self profileHandler];
      id v13 = [v12 profile];
      id v14 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v11, [v13 isInstalledForSystem]);

      if (v14)
      {
        uint64_t v15 = [v9 topic];
        id v16 = [v9 checkInURLString];
        long long v17 = +[NSURL URLWithString:v16];

        if (v17)
        {
          long long v18 = objc_opt_class();
          __int16 v19 = [v9 checkInPinningPersistentRefs];
          long long v20 = [(MCNewPayloadHandler *)self profileHandler];
          [v20 profile];
          __int16 v21 = v44 = v15;
          id v43 = [v18 copyCertificatesWithPersistentIDs:v19 useSystemKeychain:[v21 isInstalledForSystem]];

          id v22 = +[MDMClient sharedClient];
          [v9 pinningRevocationCheckRequired];
          [v9 signMessage];
          LOBYTE(v18) = [v9 isUserEnrollment];
          uint64_t v23 = [v9 enrollmentID];
          unsigned int v24 = v17;
          uint64_t v25 = (void *)v23;
          id v46 = 0;
          LOBYTE(v42) = (_BYTE)v18;
          v45 = v24;
          [v22 checkOutCheckInURL:v42 identity:v23 pinnedSecCertificateRefs:&v46 pinningRevocationCheckRequired:1 topic:nil signMessage:0 isUserEnrollment:0 enrollmentID:nil outError:&v46];
          id v26 = v46;

          if (v26)
          {
            os_log_t v27 = _MCLogObjects[1];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              int v28 = v27;
              v29 = [v26 MCVerboseDescription];
              *(_DWORD *)buf = 138543362;
              v48 = v29;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Cannot check out. Error: %{public}@", buf, 0xCu);
            }
          }

          uint64_t v15 = v44;
          long long v17 = v45;
        }
        else
        {
          uint64_t v31 = _MCLogObjects[1];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Cannot check out because the Check-In URL is invalid.", buf, 2u);
          }
        }
        CFRelease(v14);

        uint64_t v10 = &os_unfair_lock_unlock_ptr;
      }
      else
      {
        uint64_t v30 = _MCLogObjects[1];
        uint64_t v10 = &os_unfair_lock_unlock_ptr;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Cannot check out because the MDM identity cannot be retrieved.", buf, 2u);
        }
      }
    }
    +[MDMProvisioningProfileTrust didUnenrollFromMDM];
    v32 = [v10[423] sharedClient];
    [v32 uprootMDM];

    v33 = _MCLogObjects[1];
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Preserving unlock token (if any) because we removed the MDM profile through migration", buf, 2u);
      }
    }
    else
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Deleting unlock token (if any) because we removed the MDM profile", buf, 2u);
      }
      MCKeybagDeleteMDMEscrowSecret();
      MCKeybagDeleteMDMEscrowData();
    }
    [(MCNewMDMPayloadHandler *)self _releaseDependency];
    setAsideDictionary = self->_setAsideDictionary;
    self->_setAsideDictionary = 0;

    v36 = [v9 personaID];

    if (v36)
    {
      uint64_t v37 = [v9 personaID];
      +[DMCPersonaHelper removePersonaAndAccountsWithPersonaID:v37];
    }
    else
    {
      if (!v8)
      {
LABEL_27:

        goto LABEL_28;
      }
      v38 = objc_opt_new();
      [v38 signOutAllPrimaryAccounts];

      uint64_t v37 = +[ACAccountStore defaultStore];
      uint64_t v39 = [v37 dmc_remoteManagementAccountForIdentifier:v8];
      v40 = v39;
      if (v39)
      {
        uint64_t v41 = [v39 dmc_altDSID];
        [v37 dmc_removeMAIDRelatedAccountsWithAltDSID:v41];
      }
    }

    goto LABEL_27;
  }
LABEL_28:
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4 = +[MDMClient sharedClient];
  [v4 notifyNewConfiguration];

  uint64_t v5 = +[MDMClient sharedClient];
  [v5 scheduleTokenUpdate];

  if (+[DMCMultiUserModeUtilities inSharediPadUserSession])
  {
    id v6 = +[MDMUserClient sharedClient];
    [v6 notifyNewConfiguration];
  }
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4 = +[MDMClient sharedClient];
  [v4 notifyNewConfiguration];

  if (+[DMCMultiUserModeUtilities inSharediPadUserSession])
  {
    id v5 = +[MDMUserClient sharedClient];
    [v5 notifyNewConfiguration];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideEscrowSecret, 0);

  objc_storeStrong((id *)&self->_setAsideDictionary, 0);
}

@end