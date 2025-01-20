@interface MIInstallableBundle
+ (BOOL)_getEligibilityForDomain:(unint64_t)a3 forBundle:(id)a4 isEligible:(BOOL *)a5 ineligibilityReason:(id *)a6 error:(id *)a7;
+ (BOOL)_shouldSkipEligibilityChecksForAppWithSigningInfo:(id)a3;
+ (BOOL)_shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:(id)a3 persona:(id)a4;
+ (BOOL)_shouldSkipEligibilityChecksForInstallRequestorWithAuditToken:(id *)a3 persona:(id)a4 authorizingBundleID:(id *)a5;
+ (unint64_t)_domainForBrowserEligibilityForApp:(id)a3 withSigningInfo:(id)a4 distributorInfo:(id)a5 isWebDistribution:(BOOL)a6 operationType:(unint64_t)a7;
+ (unint64_t)_domainForMarketplaceEligibilityForApp:(id)a3 withSigningInfo:(id)a4 isWebDistribution:(BOOL)a5 distributorInfo:(id)a6 operationType:(unint64_t)a7;
- (BOOL)_captureDataFromStagingRootOrBundle:(id)a3 toContainer:(id)a4 withError:(id *)a5;
- (BOOL)_checkCanInstallWithError:(id *)a3;
- (BOOL)_checkEligibilityForAppWithSigningInfo:(id)a3 distributorInfo:(id)a4 isWebDistribution:(BOOL)a5 withError:(id *)a6;
- (BOOL)_getLinkedParentBundleID:(id *)a3 withError:(id *)a4;
- (BOOL)_handleStashMode:(unint64_t)a3 withError:(id *)a4;
- (BOOL)_handleStashOptionWithError:(id *)a3;
- (BOOL)_installEmbeddedProfilesWithError:(id *)a3;
- (BOOL)_isValidWatchKitApp:(id)a3 withVersion:(unsigned __int8)a4 installableSigningInfo:(id)a5 isSystemAppInstall:(BOOL)a6 error:(id *)a7;
- (BOOL)_linkToParentApplication:(id *)a3;
- (BOOL)_performAppClipSpecificValidationForEntitlements:(id)a3 isAppClip:(BOOL *)a4 withError:(id *)a5;
- (BOOL)_performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_performBuiltInAppUpgradeValidationWithSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_performCompanionWatchAppValidationForWatchApp:(id)a3 withVersion:(unsigned __int8)a4 companionAppSigningInfo:(id)a5 frameworks:(id)a6 error:(id *)a7;
- (BOOL)_performWatchVerificationForSigningInfo:(id)a3 isSystemAppInstall:(BOOL)a4 withError:(id *)a5;
- (BOOL)_postFlightAppExtensionsWithError:(id *)a3;
- (BOOL)_preserveExistingPlaceholderAsParallelPlaceholderWithError:(id *)a3;
- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4;
- (BOOL)_setBundleMetadataWithError:(id *)a3;
- (BOOL)_setLaunchWarningDataWithError:(id *)a3;
- (BOOL)_setLinkageInBundleMetadata:(id)a3 error:(id *)a4;
- (BOOL)_validateAppManagementDomainForSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_validateApplicationIdentifierForNewBundleSigningInfo:(id)a3 error:(id *)a4;
- (BOOL)_validateCompanionAppStateInWatchKitApp:(id)a3 withVersion:(unsigned __int8)a4 isSystemAppInstall:(BOOL)a5 error:(id *)a6;
- (BOOL)_validateITunesMetadataOptionWithError:(id *)a3;
- (BOOL)_validateLinkedParentForSigningInfo:(id)a3 appManagementDomainValue:(unint64_t)a4 error:(id *)a5;
- (BOOL)_validateSinfsWithError:(id *)a3;
- (BOOL)_validateiTunesMetadataWithError:(id *)a3;
- (BOOL)_verifyBundleMetadataWithError:(id *)a3;
- (BOOL)_verifyPluginKitPlugins:(id)a3 extensionKitExtensions:(id)a4 inWatchKit2App:(id)a5 checkAppexSignatures:(BOOL)a6 checkFrameworkSignature:(BOOL)a7 error:(id *)a8;
- (BOOL)_writeData:(id)a3 toFile:(id)a4 inContainerAtURL:(id)a5 legacyErrorString:(id)a6 error:(id *)a7;
- (BOOL)_writeOptionsDataToBundle:(id)a3 orContainer:(id)a4 error:(id *)a5;
- (BOOL)finalizeInstallationWithError:(id *)a3;
- (BOOL)isPlaceholderInstall;
- (BOOL)performInstallationWithError:(id *)a3;
- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3;
- (BOOL)performPreflightWithError:(id *)a3;
- (BOOL)performVerificationWithError:(id *)a3;
- (BOOL)postFlightInstallationWithError:(id *)a3;
- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4;
- (BOOL)xpcServiceBundlesEnabled;
- (MIBundleContainer)bundleContainer;
- (MIBundleContainer)existingBundleContainer;
- (MICodeSigningInfo)bundleSigningInfo;
- (MIDataContainer)dataContainer;
- (MIEmbeddedWatchBundle)embeddedWatchApp;
- (MIInstallableBundle)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 existingBundleContainer:(id)a9 operationType:(unint64_t)a10 error:(id *)a11;
- (MIInstallationJournalEntry)journalEntry;
- (NSArray)appExtensionBundles;
- (NSArray)appExtensionDataContainers;
- (NSArray)driverKitExtensionBundles;
- (NSArray)frameworkBundles;
- (NSArray)xpcServiceBundles;
- (NSMutableDictionary)identifiersMap;
- (NSURL)upgradingBuiltInAppAtURL;
- (id)_builtInAppUpgradeFailureError;
- (id)_createJournalEntry;
- (id)_noLongerPresentAppExtensionDataContainers;
- (id)_validateBundle:(id)a3 validatingResources:(BOOL)a4 performingOnlineAuthorization:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 allowingFreeProfileValidation:(BOOL)a7 skippingProfileIDValidation:(BOOL)a8 error:(id *)a9;
- (id)launchServicesBundleRecordsWithError:(id *)a3;
- (id)recordPromise;
- (unint64_t)_installationJournalOperationType;
- (unint64_t)eligibilityOperationType;
- (void)dealloc;
- (void)setAppExtensionBundles:(id)a3;
- (void)setAppExtensionDataContainers:(id)a3;
- (void)setBundleContainer:(id)a3;
- (void)setBundleSigningInfo:(id)a3;
- (void)setDataContainer:(id)a3;
- (void)setDriverKitExtensionBundles:(id)a3;
- (void)setEmbeddedWatchApp:(id)a3;
- (void)setFrameworkBundles:(id)a3;
- (void)setIdentifiersMap:(id)a3;
- (void)setJournalEntry:(id)a3;
- (void)setUpgradingBuiltInAppAtURL:(id)a3;
- (void)setXpcServiceBundles:(id)a3;
- (void)setXpcServiceBundlesEnabled:(BOOL)a3;
@end

@implementation MIInstallableBundle

- (id)recordPromise
{
  v2 = [(MIInstallableBundle *)self journalEntry];
  v3 = [v2 recordPromise];

  return v3;
}

- (MIInstallableBundle)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 existingBundleContainer:(id)a9 operationType:(unint64_t)a10 error:(id *)a11
{
  uint64_t v13 = a5;
  id v17 = a8;
  id v21 = a9;
  v22.receiver = self;
  v22.super_class = (Class)MIInstallableBundle;
  v18 = [(MIInstallable *)&v22 initWithBundle:a3 inStagingRoot:a4 packageFormat:v13 identity:a6 domain:a7 installOptions:v17 operationType:a10 error:a11];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_existingBundleContainer, a9);
    if (((unint64_t)[v17 installTargetType] & 0xFFFFFFFFFFFFFFFELL) == 2) {
      v19->_isPlaceholderInstall = 1;
    }
  }

  return v19;
}

- (void)dealloc
{
  v3 = [(MIInstallableBundle *)self bundleContainer];
  sub_10003DE04(v3);

  v4 = [(MIInstallableBundle *)self dataContainer];
  sub_10003DE04(v4);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = [(MIInstallableBundle *)self appExtensionDataContainers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_10003DE04(*(void **)(*((void *)&v11 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)MIInstallableBundle;
  [(MIInstallableBundle *)&v10 dealloc];
}

- (unint64_t)eligibilityOperationType
{
  v3 = [(MIInstallable *)self installOptions];
  id v4 = [v3 installIntent];

  if (v4 == (id)3) {
    return 2;
  }
  id v6 = [(MIInstallableBundle *)self existingBundleContainer];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 bundle];
    unint64_t v5 = [v8 isPlaceholder] ^ 1;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_verifyBundleMetadataWithError:(id *)a3
{
  unint64_t v5 = [(MIInstallable *)self bundle];
  if ([(MIInstallableBundle *)self isPlaceholderInstall])
  {
    id v6 = 0;
  }
  else
  {
    id v22 = 0;
    unsigned int v10 = [v5 isApplicableToCurrentDeviceFamilyWithError:&v22];
    id v11 = v22;
    id v12 = v11;
    if (!v10) {
      goto LABEL_16;
    }
    id v21 = v11;
    unsigned __int8 v13 = [v5 isApplicableToCurrentOSVersionWithError:&v21];
    id v6 = v21;

    if ((v13 & 1) == 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        long long v14 = [v6 userInfo];
        v18 = [v14 objectForKeyedSubscript:NSLocalizedDescriptionKey];
        MOLogWrite();
      }
      goto LABEL_17;
    }
  }
  unsigned int v7 = [v5 bundleType];
  if (v7 - 1 < 5 || v7 == 9)
  {
    id v20 = v6;
    unsigned int v8 = [v5 validateAppMetadataWithError:&v20];
    id v9 = v20;

    id v6 = v9;
    if (!v8) {
      goto LABEL_17;
    }
  }
  if ([(MIInstallableBundle *)self isPlaceholderInstall])
  {
    BOOL v15 = 1;
    goto LABEL_20;
  }
  id v19 = v6;
  unsigned __int8 v16 = [v5 thinningMatchesCurrentDeviceWithError:&v19];
  id v12 = v19;

  if (v16)
  {
    BOOL v15 = 1;
    id v6 = v12;
    goto LABEL_20;
  }
LABEL_16:
  id v6 = v12;
LABEL_17:
  if (a3)
  {
    id v6 = v6;
    BOOL v15 = 0;
    *a3 = v6;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_20:

  return v15;
}

- (BOOL)_installEmbeddedProfilesWithError:(id *)a3
{
  unint64_t v5 = [(MIInstallable *)self bundle];
  id v6 = [(MIInstallable *)self progressBlock];
  id v7 = [v5 installEmbeddedProvisioningProfileWithProgress:v6];

  unsigned int v8 = [(MIInstallable *)self installOptions];
  [v8 provisioningProfileInstallFailureIsFatal];

  if (MIIsFatalMISProfileInstallationError())
  {
    id v9 = (void *)MIInstallerErrorDomain;
    v70[0] = @"LegacyErrorString";
    v70[1] = MILibMISErrorNumberKey;
    v71[0] = @"ApplicationVerificationFailed";
    unsigned int v10 = +[NSNumber numberWithInt:v7];
    v71[1] = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    id v12 = [(MIInstallable *)self bundle];
    unsigned __int8 v13 = [v12 identifier];
    long long v14 = MIErrorStringForMISError();
    sub_100014A08((uint64_t)"-[MIInstallableBundle _installEmbeddedProfilesWithError:]", 321, v9, 13, 0, v11, @"Failed to install embedded profile for %@ : 0x%08x (%@)", v15, (uint64_t)v13);
    v40 = LABEL_32:;

    BOOL v39 = 0;
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    unsigned int v10 = [(MIInstallableBundle *)self appExtensionBundles];
    id v16 = [v10 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v56;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v56 != v18) {
            objc_enumerationMutation(v10);
          }
          id v20 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v21 = [(MIInstallable *)self progressBlock];
          id v22 = [v20 installEmbeddedProvisioningProfileWithProgress:v21];

          if (MIIsFatalMISProfileInstallationError())
          {
            v41 = (void *)MIInstallerErrorDomain;
            v68[0] = @"ApplicationVerificationFailed";
            v67[0] = @"LegacyErrorString";
            v67[1] = MILibMISErrorNumberKey;
            id v11 = +[NSNumber numberWithInt:v22];
            v68[1] = v11;
            id v12 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
            unsigned __int8 v13 = [v20 identifier];
            long long v14 = MIErrorStringForMISError();
            uint64_t v46 = (uint64_t)v13;
            v43 = @"Failed to install embedded profile for %@ : 0x%08x (%@)";
            uint64_t v44 = 328;
LABEL_31:
            sub_100014A08((uint64_t)"-[MIInstallableBundle _installEmbeddedProfilesWithError:]", v44, v41, 13, 0, v12, v43, v42, v46);
            goto LABEL_32;
          }
        }
        id v17 = [v10 countByEnumeratingWithState:&v55 objects:v69 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    unsigned int v10 = [(MIInstallableBundle *)self frameworkBundles];
    id v23 = [v10 countByEnumeratingWithState:&v51 objects:v66 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v52;
      while (2)
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v52 != v25) {
            objc_enumerationMutation(v10);
          }
          v27 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
          v28 = [(MIInstallable *)self progressBlock];
          id v29 = [v27 installEmbeddedProvisioningProfileWithProgress:v28];

          if (MIIsFatalMISProfileInstallationError())
          {
            v41 = (void *)MIInstallerErrorDomain;
            v64[0] = @"LegacyErrorString";
            v64[1] = MILibMISErrorNumberKey;
            v65[0] = @"ApplicationVerificationFailed";
            id v11 = +[NSNumber numberWithInt:v29];
            v65[1] = v11;
            id v12 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
            unsigned __int8 v13 = [v27 identifier];
            long long v14 = MIErrorStringForMISError();
            uint64_t v46 = (uint64_t)v13;
            v43 = @"Failed to install embedded profile for %@ : 0x%08x (%@)";
            uint64_t v44 = 336;
            goto LABEL_31;
          }
        }
        id v24 = [v10 countByEnumeratingWithState:&v51 objects:v66 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    unsigned int v10 = [(MIInstallableBundle *)self driverKitExtensionBundles];
    id v30 = [v10 countByEnumeratingWithState:&v47 objects:v63 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v48;
      while (2)
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v10);
          }
          v34 = *(void **)(*((void *)&v47 + 1) + 8 * (void)k);
          v35 = [(MIInstallable *)self progressBlock];
          id v36 = [v34 installEmbeddedProvisioningProfileWithProgress:v35];

          if (MIIsFatalMISProfileInstallationError())
          {
            v41 = (void *)MIInstallerErrorDomain;
            v61[0] = @"LegacyErrorString";
            v61[1] = MILibMISErrorNumberKey;
            v62[0] = @"ApplicationVerificationFailed";
            id v11 = +[NSNumber numberWithInt:v36];
            v62[1] = v11;
            id v12 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
            unsigned __int8 v13 = [v34 identifier];
            long long v14 = MIErrorStringForMISError();
            uint64_t v46 = (uint64_t)v13;
            v43 = @"Failed to install embedded profile for %@ : 0x%08x (%@)";
            uint64_t v44 = 345;
            goto LABEL_31;
          }
          v37 = [(MIInstallable *)self progressBlock];
          id v38 = [v34 installMacStyleEmbeddedProvisioningProfileWithProgress:v37];

          if (MIIsFatalMISProfileInstallationError())
          {
            v41 = (void *)MIInstallerErrorDomain;
            v59[0] = @"LegacyErrorString";
            v59[1] = MILibMISErrorNumberKey;
            v60[0] = @"ApplicationVerificationFailed";
            id v11 = +[NSNumber numberWithInt:v38];
            v60[1] = v11;
            id v12 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
            unsigned __int8 v13 = [v34 identifier];
            long long v14 = MIErrorStringForMISError();
            uint64_t v46 = (uint64_t)v13;
            v43 = @"Failed to install Mac-style embedded profile for %@ : 0x%08x (%@)";
            uint64_t v44 = 350;
            goto LABEL_31;
          }
        }
        id v31 = [v10 countByEnumeratingWithState:&v47 objects:v63 count:16];
        BOOL v39 = 1;
        if (v31) {
          continue;
        }
        break;
      }
      v40 = 0;
    }
    else
    {
      v40 = 0;
      BOOL v39 = 1;
    }
  }

  if (a3 && !v39) {
    *a3 = v40;
  }

  return v39;
}

- (BOOL)_checkCanInstallWithError:(id *)a3
{
  unint64_t v5 = [(MIInstallable *)self bundle];
  unsigned int v6 = [v5 bundleType];

  id v7 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v8 = [v7 builtInFrameworkBundleIDs];

  id v9 = [(MIInstallable *)self bundle];
  unsigned int v10 = [v9 identifier];
  unsigned int v11 = [v8 containsObject:v10];

  if (v11)
  {
    id v12 = (void *)MIInstallerErrorDomain;
    unsigned __int8 v13 = [(MIInstallable *)self bundle];
    long long v14 = [v13 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 383, v12, 57, 0, &off_100097B28, @"A system framework has the bundle ID %@ so an app with the same identifier cannot be installed.", v15, (uint64_t)v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_3:
    id v17 = 0;
    goto LABEL_4;
  }
  id v16 = 0;
  BOOL v18 = 1;
  unsigned int v19 = v6 - 1;
  id v17 = 0;
  switch(v19)
  {
    case 0u:
      id v20 = +[MIDaemonConfiguration sharedInstance];
      id v21 = [v20 systemAppBundleIDToInfoMap];

      if (v21) {
        goto LABEL_14;
      }
      id v23 = (void *)MIInstallerErrorDomain;
      id v24 = @"Failed to get system app map";
      uint64_t v25 = 398;
      goto LABEL_43;
    case 1u:
      v26 = +[MIDaemonConfiguration sharedInstance];
      id v21 = [v26 internalAppBundleIDToInfoMap];

      if (v21) {
        goto LABEL_14;
      }
      id v23 = (void *)MIInstallerErrorDomain;
      id v24 = @"Failed to get internal app map";
      uint64_t v25 = 420;
      goto LABEL_43;
    case 2u:
      id v21 = +[MIDiskImageManager sharedInstance];
      v27 = [(MIInstallable *)self bundle];
      v28 = [v27 identifier];
      uint64_t v29 = [v21 diskImageAppInfoForBundleID:v28];
      goto LABEL_15;
    case 4u:
      id v30 = +[MIDaemonConfiguration sharedInstance];
      id v21 = [v30 coreServicesAppBundleIDToInfoMap];

      if (!v21)
      {
        id v23 = (void *)MIInstallerErrorDomain;
        id v24 = @"Failed to get core services app map";
        uint64_t v25 = 406;
LABEL_43:
        sub_100014A08((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", v25, v23, 4, 0, 0, v24, v22, (uint64_t)v59);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
LABEL_14:
      v27 = [(MIInstallable *)self bundle];
      v28 = [v27 identifier];
      uint64_t v29 = [v21 objectForKeyedSubscript:v28];
LABEL_15:
      id v17 = (void *)v29;

      if (!v17) {
        goto LABEL_39;
      }
      id v31 = [v17 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
      objc_opt_class();
      id v32 = v31;
      if (objc_opt_isKindOfClass()) {
        id v33 = v32;
      }
      else {
        id v33 = 0;
      }

      v34 = [v17 objectForKeyedSubscript:kCFBundleVersionKey];
      objc_opt_class();
      id v35 = v34;
      if (objc_opt_isKindOfClass()) {
        id v36 = v35;
      }
      else {
        id v36 = 0;
      }

      if (!v36)
      {
        uint64_t v42 = (void *)MIInstallerErrorDomain;
        v43 = [(MIInstallable *)self bundle];
        uint64_t v44 = [v43 identifier];
        sub_100014A08((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 431, v42, 4, 0, 0, @"Failed to get CFBundleVersion from Info.plist of installed OS app with bundle ID %@", v45, (uint64_t)v44);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_4;
      }
      v61 = v33;
      v37 = [(MIInstallable *)self bundle];
      id v38 = [v37 infoPlistSubset];
      BOOL v39 = [v38 objectForKeyedSubscript:kCFBundleVersionKey];
      objc_opt_class();
      id v40 = v39;
      if (objc_opt_isKindOfClass()) {
        id v41 = v40;
      }
      else {
        id v41 = 0;
      }

      if (v41)
      {
        id v46 = [v41 compare:v36 options:64];
        unsigned __int8 v47 = [(MIInstallableBundle *)self isPlaceholderInstall];
        if ((unint64_t)v46 < 2) {
          unsigned __int8 v48 = v47;
        }
        else {
          unsigned __int8 v48 = 0;
        }
        if ((v48 & 1) != 0 || v46 == (id)1) {
          goto LABEL_38;
        }
        long long v49 = +[MIDaemonConfiguration sharedInstance];
        unsigned int v50 = [v49 allowsInternalSecurityPolicy];

        if (v50 && !v46)
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
          {
            long long v51 = [(MIInstallable *)self bundle];
            v59 = [v51 identifier];
            MOLogWrite();
          }
LABEL_38:
          -[MIInstallableBundle setUpgradingBuiltInAppAtURL:](self, "setUpgradingBuiltInAppAtURL:", v61, v59);

LABEL_39:
          id v16 = 0;
          BOOL v18 = 1;
          goto LABEL_40;
        }
        long long v57 = (void *)MIInstallerErrorDomain;
        long long v54 = [(MIInstallable *)self bundle];
        long long v55 = [v54 identifier];
        v60 = [v61 path];
        sub_100014A08((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 458, v57, 34, 0, &off_100097B50, @"Rejecting downgrade of system/internal app %@ at %@: installed version is %@, proposed version is %@", v58, (uint64_t)v55);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v53 = (void *)MIInstallerErrorDomain;
        long long v54 = [(MIInstallable *)self bundle];
        long long v55 = [v54 identifier];
        sub_100014A08((uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]", 437, v53, 33, 0, 0, @"Failed to get CFBundleVersion from Info.plist for incoming OS app upgrade for bundle ID %@", v56, (uint64_t)v55);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_4:
      if (a3)
      {
        id v16 = v16;
        BOOL v18 = 0;
        *a3 = v16;
      }
      else
      {
        BOOL v18 = 0;
      }
LABEL_40:

      return v18;
    default:
      goto LABEL_40;
  }
}

- (BOOL)_validateITunesMetadataOptionWithError:(id *)a3
{
  unint64_t v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  unsigned int v6 = [(MIInstallable *)self installOptions];
  id v7 = [v6 sinfData];

  if (!v7 || ([v6 iTunesMetadata], (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v19 = 0;
    BOOL v18 = 0;
    id v12 = 0;
    id v16 = 0;
    unsigned int v10 = 0;
    BOOL v20 = 1;
    goto LABEL_11;
  }
  unsigned int v8 = [(MIInstallable *)self bundle];
  id v9 = [v8 bundleVersion];
  unsigned int v10 = [v9 stringByTrimmingCharactersInSet:v5];

  unsigned int v11 = [v7 bundleVersion];
  id v12 = [v11 stringByTrimmingCharactersInSet:v5];

  if (v10 && v12 && ([v10 isEqualToString:v12] & 1) == 0)
  {
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateITunesMetadataOptionWithError:]", 517, MIInstallerErrorDomain, 79, 0, &off_100097B78, @"iTunesMetadata.plist content supplied to install command specified bundleVersion (%@) that did not match app's CFBundleVersion (%@).", v13, (uint64_t)v12);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = 0;
    BOOL v18 = 0;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  long long v14 = [(MIInstallable *)self bundle];
  uint64_t v15 = [v14 bundleShortVersion];
  id v16 = [v15 stringByTrimmingCharactersInSet:v5];

  id v17 = [v7 bundleShortVersionString];
  BOOL v18 = [v17 stringByTrimmingCharactersInSet:v5];

  id v19 = 0;
  BOOL v20 = 1;
  if (v16 && v18)
  {
    if ([v16 isEqualToString:v18])
    {
      id v19 = 0;
      goto LABEL_11;
    }
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateITunesMetadataOptionWithError:]", 525, MIInstallerErrorDomain, 79, 0, &off_100097BA0, @"iTunesMetadata.plist content supplied to install command specified bundleShortVersionString (%@) that did not match app's CFBundleShortVersionString (%@).", v21, (uint64_t)v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_15:
      BOOL v20 = 0;
      goto LABEL_11;
    }
LABEL_13:
    id v19 = v19;
    BOOL v20 = 0;
    *a3 = v19;
  }
LABEL_11:

  return v20;
}

- (BOOL)performPreflightWithError:(id *)a3
{
  unsigned int v5 = [(MIInstallableBundle *)self isPlaceholderInstall];
  unsigned int v6 = [(MIInstallable *)self progressBlock];
  ((void (**)(void, const __CFString *, uint64_t))v6)[2](v6, @"PreflightingApplication", 30);

  v144.receiver = self;
  v144.super_class = (Class)MIInstallableBundle;
  id v145 = 0;
  LODWORD(v6) = [(MIInstallable *)&v144 performPreflightWithError:&v145];
  id v7 = v145;
  if (!v6) {
    goto LABEL_70;
  }
  unsigned int v8 = [(MIInstallable *)self bundle];
  id v9 = v8;
  if (v5)
  {
    id v143 = v7;
    unsigned __int8 v10 = [v8 setIsPlaceholderWithError:&v143];
    id v11 = v143;

    if ((v10 & 1) == 0) {
      goto LABEL_72;
    }
  }
  else
  {
    id v142 = v7;
    unsigned int v12 = [v8 executableExistsWithError:&v142];
    id v11 = v142;

    if (!v12) {
      goto LABEL_72;
    }
  }
  uint64_t v13 = [(MIInstallable *)self bundle];
  unsigned int v14 = [v13 bundleType];

  if (v14 - 1 < 5 || v14 == 9)
  {
    id v141 = v11;
    unsigned int v15 = [(MIInstallableBundle *)self _validateITunesMetadataOptionWithError:&v141];
    id v7 = v141;

    if (!v15) {
      goto LABEL_70;
    }
    id v11 = v7;
  }
  id v140 = v11;
  unsigned int v16 = [(MIInstallableBundle *)self _checkCanInstallWithError:&v140];
  id v7 = v140;

  if (!v16)
  {
LABEL_70:
    BOOL v60 = 0;
    if (!a3) {
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  id v17 = [(MIInstallable *)self bundle];
  id v139 = v7;
  BOOL v18 = [v17 frameworkBundlesWithError:&v139];
  id v11 = v139;

  [(MIInstallableBundle *)self setFrameworkBundles:v18];
  id v19 = [(MIInstallableBundle *)self frameworkBundles];

  if (!v19) {
    goto LABEL_72;
  }
  BOOL v20 = [(MIInstallable *)self bundle];
  id v138 = v11;
  uint64_t v21 = [v20 appExtensionBundlesWithError:&v138];
  id v7 = v138;

  [(MIInstallableBundle *)self setAppExtensionBundles:v21];
  uint64_t v22 = [(MIInstallableBundle *)self appExtensionBundles];

  if (!v22) {
    goto LABEL_70;
  }
  id v23 = [(MIInstallable *)self bundle];
  id v137 = v7;
  id v24 = [v23 driverKitExtensionBundlesWithError:&v137];
  id v11 = v137;

  [(MIInstallableBundle *)self setDriverKitExtensionBundles:v24];
  uint64_t v25 = [(MIInstallableBundle *)self driverKitExtensionBundles];

  if (!v25) {
    goto LABEL_72;
  }
  v26 = +[NSMutableDictionary dictionaryWithCapacity:0];
  [(MIInstallableBundle *)self setIdentifiersMap:v26];

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = [(MIInstallableBundle *)self frameworkBundles];
  id v27 = [obj countByEnumeratingWithState:&v133 objects:v149 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v107 = *(void *)v134;
LABEL_16:
    uint64_t v29 = 0;
    id v30 = v11;
    while (1)
    {
      if (*(void *)v134 != v107) {
        objc_enumerationMutation(obj);
      }
      id v31 = *(void **)(*((void *)&v133 + 1) + 8 * (void)v29);
      id v132 = v30;
      unsigned int v32 = [v31 executableExistsWithError:&v132];
      id v11 = v132;

      if (!v32) {
        goto LABEL_60;
      }
      id v33 = [v31 identifier];
      v34 = [(MIInstallableBundle *)self identifiersMap];
      id v35 = [v34 objectForKeyedSubscript:v33];

      if (v35)
      {
        v61 = (void *)MIInstallerErrorDomain;
        v62 = [v31 bundleURL];
        v63 = [v62 path];
        v64 = [(MIInstallableBundle *)self identifiersMap];
        v65 = [v64 objectForKeyedSubscript:v33];
        v66 = [v65 path];
        sub_100014A08((uint64_t)"-[MIInstallableBundle performPreflightWithError:]", 603, v61, 57, 0, &off_100097BC8, @"Found bundle at %@ with the same identifier (%@) as bundle at %@", v67, (uint64_t)v63);
        uint64_t v70 = LABEL_36:;

        BOOL v60 = 0;
        id v11 = (id)v70;
        goto LABEL_61;
      }
      id v36 = [v31 bundleURL];
      v37 = [(MIInstallableBundle *)self identifiersMap];
      [v37 setObject:v36 forKeyedSubscript:v33];

      uint64_t v29 = (char *)v29 + 1;
      id v30 = v11;
      if (v28 == v29)
      {
        id v28 = [obj countByEnumeratingWithState:&v133 objects:v149 count:16];
        if (v28) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id obj = [(MIInstallableBundle *)self appExtensionBundles];
  id v38 = [obj countByEnumeratingWithState:&v128 objects:v148 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v108 = *(void *)v129;
LABEL_25:
    id v40 = 0;
    id v41 = v11;
    while (1)
    {
      if (*(void *)v129 != v108) {
        objc_enumerationMutation(obj);
      }
      uint64_t v42 = *(void **)(*((void *)&v128 + 1) + 8 * (void)v40);
      id v127 = v41;
      unsigned int v43 = [v42 executableExistsWithError:&v127];
      id v11 = v127;

      if (!v43) {
        goto LABEL_60;
      }
      id v33 = [v42 identifier];
      uint64_t v44 = [(MIInstallableBundle *)self identifiersMap];
      uint64_t v45 = [v44 objectForKeyedSubscript:v33];

      if (v45)
      {
        v68 = (void *)MIInstallerErrorDomain;
        v62 = [v42 bundleURL];
        v63 = [v62 path];
        v64 = [(MIInstallableBundle *)self identifiersMap];
        v65 = [v64 objectForKeyedSubscript:v33];
        v66 = [v65 path];
        sub_100014A08((uint64_t)"-[MIInstallableBundle performPreflightWithError:]", 618, v68, 57, 0, &off_100097BF0, @"Found bundle at %@ with the same identifier (%@) as bundle at %@", v69, (uint64_t)v63);
        goto LABEL_36;
      }
      id v46 = [v42 bundleURL];
      unsigned __int8 v47 = [(MIInstallableBundle *)self identifiersMap];
      [v47 setObject:v46 forKeyedSubscript:v33];

      id v40 = (char *)v40 + 1;
      id v41 = v11;
      if (v39 == v40)
      {
        id v39 = [obj countByEnumeratingWithState:&v128 objects:v148 count:16];
        if (v39) {
          goto LABEL_25;
        }
        break;
      }
    }
  }

  unsigned __int8 v48 = [(MIInstallableBundle *)self identifiersMap];
  long long v49 = [(MIInstallable *)self bundle];
  unsigned int v50 = [v49 identifier];
  long long v51 = [v48 objectForKeyedSubscript:v50];

  if (v51)
  {
    long long v52 = (void *)MIInstallerErrorDomain;
    id obj = [(MIInstallable *)self bundle];
    long long v53 = [obj identifier];
    long long v54 = [(MIInstallableBundle *)self identifiersMap];
    long long v55 = [(MIInstallable *)self bundle];
    uint64_t v56 = [v55 identifier];
    long long v57 = [v54 objectForKeyedSubscript:v56];
    v106 = [v57 path];
    uint64_t v59 = sub_100014A08((uint64_t)"-[MIInstallableBundle performPreflightWithError:]", 625, v52, 57, 0, &off_100097C18, @"The parent bundle has the same identifier (%@) as sub-bundle at %@", v58, (uint64_t)v53);

    BOOL v60 = 0;
    id v11 = (id)v59;
LABEL_61:

    goto LABEL_73;
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id obj = [(MIInstallableBundle *)self driverKitExtensionBundles];
  id v71 = [obj countByEnumeratingWithState:&v123 objects:v147 count:16];
  if (v71)
  {
    id v72 = v71;
    uint64_t v73 = *(void *)v124;
LABEL_39:
    v74 = 0;
    v75 = v11;
    while (1)
    {
      if (*(void *)v124 != v73) {
        objc_enumerationMutation(obj);
      }
      v76 = *(void **)(*((void *)&v123 + 1) + 8 * (void)v74);
      id v122 = v75;
      unsigned int v77 = [v76 executableExistsWithError:&v122];
      id v11 = v122;

      if (!v77) {
        break;
      }
      v74 = (char *)v74 + 1;
      v75 = v11;
      if (v72 == v74)
      {
        id v72 = [obj countByEnumeratingWithState:&v123 objects:v147 count:16];
        if (v72) {
          goto LABEL_39;
        }
        goto LABEL_45;
      }
    }
LABEL_60:
    BOOL v60 = 0;
    goto LABEL_61;
  }
LABEL_45:

  if (v5)
  {
    v78 = objc_opt_new();
    v79 = [(MIInstallableBundle *)self frameworkBundles];
    [v78 addObjectsFromArray:v79];

    v80 = [(MIInstallableBundle *)self appExtensionBundles];
    [v78 addObjectsFromArray:v80];

    v81 = [(MIInstallableBundle *)self driverKitExtensionBundles];
    [v78 addObjectsFromArray:v81];

    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obj = v78;
    id v82 = [obj countByEnumeratingWithState:&v118 objects:v146 count:16];
    if (v82)
    {
      id v83 = v82;
      uint64_t v84 = *(void *)v119;
      while (2)
      {
        v85 = 0;
        v86 = v11;
        do
        {
          if (*(void *)v119 != v84) {
            objc_enumerationMutation(obj);
          }
          v87 = *(void **)(*((void *)&v118 + 1) + 8 * (void)v85);
          id v117 = v86;
          unsigned int v88 = [v87 setIsPlaceholderWithError:&v117];
          id v11 = v117;

          if (!v88)
          {

            goto LABEL_60;
          }
          v85 = (char *)v85 + 1;
          v86 = v11;
        }
        while (v83 != v85);
        id v83 = [obj countByEnumeratingWithState:&v118 objects:v146 count:16];
        if (v83) {
          continue;
        }
        break;
      }
    }
  }
  v89 = [(MIInstallable *)self bundle];
  unsigned int v90 = [v89 bundleType];

  if (v90 - 1 >= 5 && v90 != 9) {
    goto LABEL_65;
  }
  v91 = [(MIInstallableBundle *)self existingBundleContainer];

  v92 = [(MIInstallable *)self bundle];
  v93 = v92;
  if (v91)
  {
    v94 = [(MIInstallableBundle *)self existingBundleContainer];
    v95 = [v94 bundle];
    id v116 = v11;
    unsigned __int8 v96 = [v93 transferInstallationIdentityFromBundle:v95 error:&v116];
    id v7 = v116;

    if ((v96 & 1) == 0) {
      goto LABEL_70;
    }
  }
  else
  {
    id v115 = v11;
    unsigned int v97 = [v92 makeAndSetNewInstallationIdentityWithError:&v115];
    id v7 = v115;

    if (!v97) {
      goto LABEL_70;
    }
  }
  id v11 = v7;
LABEL_65:
  id v114 = v11;
  unsigned int v98 = [(MIInstallableBundle *)self _verifyBundleMetadataWithError:&v114];
  id v7 = v114;

  if (!v98) {
    goto LABEL_70;
  }
  v99 = [(MIInstallable *)self bundle];
  id v113 = v7;
  unsigned int v100 = [v99 validatePluginKitMetadataWithError:&v113];
  id v11 = v113;

  if (!v100)
  {
LABEL_72:
    BOOL v60 = 0;
LABEL_73:
    id v7 = v11;
    if (!a3) {
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  v101 = [(MIInstallable *)self bundle];
  id v112 = v11;
  unsigned int v102 = [v101 validateExtensionKitMetadataWithError:&v112];
  id v7 = v112;

  if (!v102) {
    goto LABEL_70;
  }
  v103 = [(MIInstallable *)self bundle];
  id v111 = v7;
  unsigned int v104 = [v103 validateDriverKitExtensionMetadataWithError:&v111];
  id obj = v111;

  if (v104)
  {
    id v110 = obj;
    BOOL v60 = [(MIInstallableBundle *)self _installEmbeddedProfilesWithError:&v110];
    id v11 = v110;
    goto LABEL_61;
  }
  BOOL v60 = 0;
  id v7 = obj;
  if (!a3) {
    goto LABEL_76;
  }
LABEL_74:
  if (!v60) {
    *a3 = v7;
  }
LABEL_76:

  return v60;
}

- (BOOL)_performCompanionWatchAppValidationForWatchApp:(id)a3 withVersion:(unsigned __int8)a4 companionAppSigningInfo:(id)a5 frameworks:(id)a6 error:(id *)a7
{
  int v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (([v11 isWatchApp] & 1) == 0)
  {
    CFStringRef v20 = @"Unknown";
    if (v10 == 3) {
      CFStringRef v20 = @"2.0";
    }
    if (v10 == 2) {
      CFStringRef v20 = @"1.0";
    }
    sub_100014A08((uint64_t)"-[MIInstallableBundle _performCompanionWatchAppValidationForWatchApp:withVersion:companionAppSigningInfo:frameworks:error:]", 719, MIInstallerErrorDomain, 102, 0, &off_100097C40, @"WatchKit %@ app's UIDeviceFamily key does not specify that it's compatible with device family 4.", v14, (uint64_t)v20);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ([v12 codeSignerType] == (id)2 && (objc_msgSend(v11, "isPlaceholder") & 1) == 0)
  {
    id v40 = 0;
    uint64_t v22 = [v11 codeSigningInfoByValidatingResources:1 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v40];
    id v15 = v40;

    if (!v22) {
      goto LABEL_14;
    }
    id v31 = a7;
    id v32 = v13;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v13;
    id v24 = [v23 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v37;
      while (2)
      {
        id v27 = 0;
        id v28 = v15;
        do
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v27);
          id v35 = v28;
          id v30 = [v29 codeSigningInfoByValidatingResources:1 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:1 error:&v35];
          id v15 = v35;

          if (!v30)
          {

            a7 = v31;
            id v13 = v32;
            goto LABEL_14;
          }
          id v27 = (char *)v27 + 1;
          id v28 = v15;
        }
        while (v25 != v27);
        id v25 = [v23 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    a7 = v31;
    id v13 = v32;
  }
  else
  {
    id v15 = 0;
  }
  if (v10 != 3)
  {
LABEL_8:
    BOOL v19 = 1;
    goto LABEL_17;
  }
  id v34 = v15;
  unsigned int v16 = [v11 validatePluginKitMetadataWithError:&v34];
  id v17 = v34;

  if (v16)
  {
    id v33 = v17;
    unsigned __int8 v18 = [v11 validateExtensionKitMetadataWithError:&v33];
    id v15 = v33;

    if (v18) {
      goto LABEL_8;
    }
  }
  else
  {
    id v15 = v17;
  }
LABEL_14:
  if (a7)
  {
    id v15 = v15;
    BOOL v19 = 0;
    *a7 = v15;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_17:

  return v19;
}

- (BOOL)_validateCompanionAppStateInWatchKitApp:(id)a3 withVersion:(unsigned __int8)a4 isSystemAppInstall:(BOOL)a5 error:(id *)a6
{
  int v7 = a4;
  id v9 = a3;
  int v10 = [v9 companionAppIdentifier];
  unsigned int v11 = [v9 isWatchOnlyApp];
  unsigned int v12 = [v9 watchKitAppRunsIndependentlyOfCompanion];
  id v13 = [(MIInstallable *)self bundle];
  uint64_t v14 = [v13 identifier];
  id v15 = [v14 stringByAppendingString:@"."];

  if (v11 && v12)
  {
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 790, MIInstallerErrorDomain, 138, 0, &off_100097C68, @"This app defines both %@ and %@ in its Info.plist and/or its WatchKit extension's Info.plist. Having both defined is not allowed.", v16, @"WKWatchOnly");
LABEL_6:
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v18 = v10;
    goto LABEL_7;
  }
  if (v11)
  {
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 809, MIInstallerErrorDomain, 135, 0, &off_100097C90, @"Watch-only apps cannot be contained in companion apps installed on the companion.", v16, v39);
    goto LABEL_6;
  }
  unsigned __int8 v18 = v10;
  if (v10)
  {
    uint64_t v21 = [(MIInstallable *)self bundle];
    uint64_t v22 = [v21 identifier];
    unsigned __int8 v23 = [v10 isEqualToString:v22];

    if (v23)
    {
      if (!a5)
      {
        id v24 = [v9 identifier];
        if ([v24 hasPrefix:v15])
        {
          id v25 = [v9 identifier];
          id v26 = [v25 length];
          id v27 = [v15 length];

          if (v26 > v27) {
            goto LABEL_16;
          }
        }
        else
        {
        }
        id v35 = (void *)MIInstallerErrorDomain;
        long long v36 = @"Unknown";
        if (v7 == 3) {
          long long v36 = @"2.0";
        }
        if (v7 == 2) {
          long long v36 = @"1.0";
        }
        long long v37 = v36;
        id v40 = [v9 identifier];
        sub_100014A08((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 830, v35, 101, 0, &off_100097D08, @"WatchKit %@ app's bundle ID %@ is not prefixed by the parent app's bundle ID followed by a '.'; expected prefix %@",
          v38,
          (uint64_t)v37);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
LABEL_16:
      id v17 = 0;
      BOOL v19 = 1;
      goto LABEL_10;
    }
    id v31 = (void *)MIInstallerErrorDomain;
    id v32 = @"Unknown";
    if (v7 == 3) {
      id v32 = @"2.0";
    }
    if (v7 == 2) {
      id v32 = @"1.0";
    }
    id v33 = v32;
    uint64_t v29 = [(MIInstallable *)self bundle];
    id v41 = [v29 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 821, v31, 97, 0, &off_100097CE0, @"Invalid value of WKCompanionAppBundleIdentifier key in WatchKit %@ app's Info.plist: %@ (expected %@)", v34, (uint64_t)v33);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = (void *)MIInstallerErrorDomain;
    uint64_t v29 = [v9 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:]", 814, v28, 97, 0, &off_100097CB8, @"%@: Missing WKCompanionAppBundleIdentifier key in WatchKit %@ app's Info.plist", v30, (uint64_t)v29);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  if (a6)
  {
    id v17 = v17;
    BOOL v19 = 0;
    *a6 = v17;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_10:

  return v19;
}

- (BOOL)_isValidWatchKitApp:(id)a3 withVersion:(unsigned __int8)a4 installableSigningInfo:(id)a5 isSystemAppInstall:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  if ([v12 isExtensionBasedWatchKitApp] && objc_msgSend(v13, "codeSignerType") == (id)3)
  {
    uint64_t v14 = [v13 entitlements];
    if (sub_10004CC98(v14) & 1) != 0 || ([v12 isPlaceholder]) {
      unsigned int v46 = 0;
    }
    else {
      unsigned int v46 = [v12 isApplicableToOSVersionEarlierThan:@"9.0"] & !v8;
    }
  }
  else
  {
    unsigned int v46 = 0;
  }
  unsigned __int8 v47 = a7;
  unsigned __int8 v48 = v13;
  if ([v12 minimumWatchOSVersionIsPreV6])
  {
    id v56 = 0;
    unsigned int v15 = [v12 hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:v10 error:&v56];
    id v16 = v56;
    id v17 = 0;
    unsigned __int8 v18 = 0;
    BOOL v19 = 0;
    id v20 = v16;
    if (!v15) {
      goto LABEL_29;
    }
  }
  else
  {
    id v16 = 0;
  }
  id v55 = v16;
  unsigned int v21 = [(MIInstallableBundle *)self _validateCompanionAppStateInWatchKitApp:v12 withVersion:v10 isSystemAppInstall:v8 error:&v55];
  id v20 = v55;

  if (!v21)
  {
    id v17 = 0;
    unsigned __int8 v18 = 0;
    goto LABEL_20;
  }
  id v54 = v20;
  id v17 = [v12 frameworkBundlesWithError:&v54];
  id v22 = v54;

  if (!v17)
  {
    unsigned __int8 v18 = 0;
    BOOL v19 = 0;
    goto LABEL_28;
  }
  if (![v17 count]
    || ![v12 isApplicableToOSVersion:@"2.9.9" error:0])
  {
    id v53 = v22;
    unsigned __int8 v18 = [v12 pluginKitBundlesWithError:&v53];
    id v20 = v53;

    if (v18)
    {
      id v52 = v20;
      BOOL v19 = [v12 extensionKitBundlesWithError:&v52];
      id v22 = v52;

      if (v19)
      {
        id v51 = v22;
        id v28 = v48;
        unsigned int v29 = [(MIInstallableBundle *)self _performCompanionWatchAppValidationForWatchApp:v12 withVersion:v10 companionAppSigningInfo:v48 frameworks:v17 error:&v51];
        id v20 = v51;

        if (!v29) {
          goto LABEL_29;
        }
        if (v10 == 3)
        {
          if (v46)
          {
            uint64_t v34 = +[MIDaemonConfiguration sharedInstance];
            unsigned int v35 = [v34 codeSigningEnforcementIsDisabled];

            if (v35)
            {
              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
                MOLogWrite();
              }
            }
            else
            {
              id v50 = v20;
              unsigned __int8 v38 = +[MICodeSigningVerifier validateWatchKitV2StubExecutableBundle:v12 error:&v50];
              id v39 = v50;

              if ((v38 & 1) == 0)
              {
                id v24 = v39;
                sub_100014A08((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 928, MIInstallerErrorDomain, 72, v39, &off_100097D58, @"The WatchKit 2.0 app being installed contains an invalid application executable.", v40, v45);
                id v20 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_18;
              }
              id v20 = v39;
            }
          }
          BOOL v41 = ([v12 isPlaceholder] & 1) == 0
             && [v48 codeSignerType] == (id)2;
          id v49 = v20;
          unsigned __int8 v42 = [(MIInstallableBundle *)self _verifyPluginKitPlugins:v18 extensionKitExtensions:v19 inWatchKit2App:v12 checkAppexSignatures:v41 checkFrameworkSignature:v41 error:&v49];
          id v43 = v49;
          uint64_t v44 = v20;
          id v20 = v43;

          if ((v42 & 1) == 0) {
            goto LABEL_29;
          }
        }
        else
        {
          id v31 = v20;
          if (v10 != 2)
          {
            long long v36 = (void *)MIInstallerErrorDomain;
            id v24 = [v12 identifier];
            sub_100014A08((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 962, v36, 4, 0, 0, @"Unknown WatchKit app version while validating %@: %hhu", v37, (uint64_t)v24);
            id v20 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
          sub_100014A08((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 912, MIInstallerErrorDomain, 133, 0, 0, @"WatchKit version %hhu is no longer supported", v30, 2);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        BOOL v32 = 1;
        goto LABEL_33;
      }
LABEL_28:
      id v20 = v22;
      goto LABEL_29;
    }
LABEL_20:
    BOOL v19 = 0;
    goto LABEL_29;
  }
  unsigned __int8 v23 = (void *)MIInstallerErrorDomain;
  id v24 = [v17 objectAtIndexedSubscript:0];
  id v25 = [v24 bundleURL];
  id v26 = [v25 path];
  sub_100014A08((uint64_t)"-[MIInstallableBundle _isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:]", 883, v23, 119, 0, &off_100097D30, @"WatchKit 2 app contains a framework at %@. Frameworks are only allowed at that location in WatchKit apps compatible with watchOS 3.0 or later.", v27, (uint64_t)v26);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  unsigned __int8 v18 = 0;
  BOOL v19 = 0;
LABEL_18:

LABEL_29:
  if (v47)
  {
    id v20 = v20;
    BOOL v32 = 0;
    *unsigned __int8 v47 = v20;
  }
  else
  {
    BOOL v32 = 0;
  }
  id v28 = v48;
LABEL_33:

  return v32;
}

- (BOOL)_verifyPluginKitPlugins:(id)a3 extensionKitExtensions:(id)a4 inWatchKit2App:(id)a5 checkAppexSignatures:(BOOL)a6 checkFrameworkSignature:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v16 = v13;
  id v56 = [v16 countByEnumeratingWithState:&v70 objects:v76 count:16];
  int v17 = 0;
  id v18 = 0;
  if (!v56) {
    goto LABEL_23;
  }
  uint64_t v57 = *(void *)v71;
  id v50 = v15;
  id v51 = v14;
  id v49 = a8;
  id v54 = v16;
  BOOL v47 = v9;
  BOOL v48 = v10;
  while (2)
  {
    for (i = 0; i != v56; i = (char *)i + 1)
    {
      if (*(void *)v71 != v57) {
        objc_enumerationMutation(v16);
      }
      id v20 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      if (v10)
      {
        id v69 = v18;
        unsigned int v21 = [v20 codeSigningInfoByValidatingResources:1 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v69];
        id v22 = v69;

        if (!v21)
        {
          id v46 = v16;
LABEL_51:
          id v15 = v50;
          id v14 = v51;
          a8 = v49;
          goto LABEL_47;
        }
      }
      else
      {
        id v22 = v18;
      }
      id v68 = v22;
      unsigned __int8 v23 = [v20 frameworkBundlesWithError:&v68];
      id v18 = v68;

      if (!v23)
      {
        id v46 = v16;
        id v22 = v18;
        goto LABEL_51;
      }
      if (v9)
      {
        int v52 = v17;
        long long v67 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v64 = 0u;
        id v22 = v23;
        id v24 = [v22 countByEnumeratingWithState:&v64 objects:v75 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v65;
          while (2)
          {
            uint64_t v27 = 0;
            id v28 = v18;
            do
            {
              if (*(void *)v65 != v26) {
                objc_enumerationMutation(v22);
              }
              unsigned int v29 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v27);
              id v63 = v28;
              uint64_t v30 = [v29 codeSigningInfoByValidatingResources:1 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:1 error:&v63];
              id v18 = v63;

              if (!v30)
              {

                id v16 = v54;
                id v46 = v54;
                id v15 = v50;
                id v14 = v51;
                a8 = v49;
                goto LABEL_46;
              }
              uint64_t v27 = (char *)v27 + 1;
              id v28 = v18;
            }
            while (v25 != v27);
            id v25 = [v22 countByEnumeratingWithState:&v64 objects:v75 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        id v16 = v54;
        int v17 = v52;
        BOOL v9 = v47;
        BOOL v10 = v48;
      }
      v17 |= [v20 isWatchKitExtension];
    }
    id v15 = v50;
    id v14 = v51;
    a8 = v49;
    id v56 = [v16 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v56) {
      continue;
    }
    break;
  }
LABEL_23:

  if (v10)
  {
    int v53 = v17;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v46 = v14;
    id v31 = [v46 countByEnumeratingWithState:&v59 objects:v74 count:16];
    id v55 = v16;
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v60;
      while (2)
      {
        uint64_t v34 = 0;
        unsigned int v35 = v18;
        do
        {
          if (*(void *)v60 != v33) {
            objc_enumerationMutation(v46);
          }
          long long v36 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v34);
          id v58 = v35;
          uint64_t v37 = [v36 codeSigningInfoByValidatingResources:1 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v58];
          id v18 = v58;

          if (!v37)
          {
            id v22 = v18;
            id v16 = v55;
            goto LABEL_47;
          }
          uint64_t v34 = (char *)v34 + 1;
          unsigned int v35 = v18;
        }
        while (v32 != v34);
        id v32 = [v46 countByEnumeratingWithState:&v59 objects:v74 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    id v22 = v18;
    id v16 = v55;
    int v17 = v53;
  }
  else
  {
    id v22 = v18;
  }
  if ([v15 isExtensionlessWatchKitApp]
    && [v15 isExtensionBasedWatchKitApp])
  {
    unsigned __int8 v38 = (void *)MIInstallerErrorDomain;
    id v46 = [v15 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:]", 1039, v38, 144, 0, &off_100097D80, @"WatchKit app %@ has both WKApplication and WKWatchKitApp Info.plist keys. A WatchKit app should only have one of these keys.", v39, (uint64_t)v46);
    goto LABEL_45;
  }
  if (([v15 isExtensionlessWatchKitApp] & v17) == 1)
  {
    uint64_t v40 = (void *)MIInstallerErrorDomain;
    id v46 = [v15 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:]", 1042, v40, 143, 0, &off_100097DA8, @"Extensionless WatchKit app %@ has a WatchKit extension.", v41, (uint64_t)v46);
    goto LABEL_45;
  }
  if (v17 & 1 | (([v15 isExtensionBasedWatchKitApp] & 1) == 0))
  {
    BOOL v42 = 1;
  }
  else
  {
    id v43 = (void *)MIInstallerErrorDomain;
    id v46 = [v15 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:]", 1045, v43, 96, 0, &off_100097DD0, @"Extension-based WatchKit 2 app %@ is missing its app extension.", v44, (uint64_t)v46);
LABEL_45:
    id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_46:

    id v22 = v18;
LABEL_47:

    if (a8)
    {
      id v22 = v22;
      BOOL v42 = 0;
      *a8 = v22;
    }
    else
    {
      BOOL v42 = 0;
    }
  }

  return v42;
}

- (id)_validateBundle:(id)a3 validatingResources:(BOOL)a4 performingOnlineAuthorization:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 allowingFreeProfileValidation:(BOOL)a7 skippingProfileIDValidation:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v15 = a3;
  id v32 = 0;
  id v16 = [v15 codeSigningInfoByValidatingResources:v13 performingOnlineAuthorization:v12 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:v11 skippingProfileIDValidation:v9 error:&v32];
  id v17 = v32;
  id v18 = v17;
  if (!v16)
  {
    id v22 = v17;
    goto LABEL_12;
  }
  if (![(MIInstallableBundle *)self isPlaceholderInstall]
    && [v15 codeSignatureVerificationState] != (id)2
    || [(MIInstallableBundle *)self isPlaceholderInstall]
    && [v15 codeSignatureVerificationState] != (id)1)
  {
    uint64_t v27 = (void *)MIInstallerErrorDomain;
    id v28 = [v15 codeSignatureVerificationState];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]", 1077, v27, 4, 0, 0, @"Unexpectedly failed to validate code signing (status %lu) for %@", v29, (uint64_t)v28);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    if (!a9) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  BOOL v19 = [(MIInstallable *)self identity];
  id v20 = [v19 personaUniqueString];
  id v31 = v18;
  unsigned int v21 = [v15 hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:v16 forPersona:v20 error:&v31];
  id v22 = v31;

  if (!v21)
  {
LABEL_12:
    if (!a9)
    {
LABEL_16:
      id v26 = 0;
      goto LABEL_18;
    }
LABEL_13:
    id v22 = v22;
    id v26 = 0;
    *a9 = v22;
    goto LABEL_18;
  }
  if ([v15 codeSignatureVerificationState] == (id)2
    && [v16 profileValidationType] == (id)3
    && !a7)
  {
    unsigned __int8 v23 = (void *)MIInstallerErrorDomain;
    id v18 = [v15 identifier];
    uint64_t v25 = sub_100014A08((uint64_t)"-[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:]", 1086, v23, 111, 0, &off_100097DF8, @"The bundle being installed with bundle ID %@ is authorized by a free provisioning profile, but apps validated by those are not allowed to be installed from this source.", v24, (uint64_t)v18);

    id v22 = (id)v25;
    goto LABEL_15;
  }
  id v26 = v16;
LABEL_18:

  return v26;
}

- (BOOL)_validateApplicationIdentifierForNewBundleSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 entitlements];
  BOOL v8 = sub_10004CBB0(v7);
  if (v8) {
    goto LABEL_2;
  }
  uint64_t v24 = +[MIDaemonConfiguration sharedInstance];
  if ([v24 codeSigningEnforcementIsDisabled])
  {
    id v25 = [v6 codeSignerType];

    if (v25 == (id)1)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        uint64_t v27 = [(MIInstallable *)self bundle];
        BOOL v47 = [v27 identifier];
        MOLogWrite();
      }
LABEL_2:
      uint64_t v9 = [(MIInstallableBundle *)self existingBundleContainer];
      if (!v9) {
        goto LABEL_16;
      }
      BOOL v10 = (void *)v9;
      BOOL v11 = [(MIInstallableBundle *)self existingBundleContainer];
      BOOL v12 = [v11 bundle];

      if (!v8 || !v12)
      {
LABEL_16:
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
        {
          unsigned __int8 v23 = [(MIInstallable *)self bundle];
          BOOL v48 = [v23 identifier];
          MOLogWrite();
        }
        goto LABEL_72;
      }
      BOOL v13 = [(MIInstallableBundle *)self existingBundleContainer];
      id v14 = [v13 bundle];
      id v15 = [v14 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0];

      id v16 = [v15 entitlements];
      id v17 = sub_10004CBB0(v16);

      if (v15 && v17)
      {
        id v18 = [v6 codeSignerType];
        id v19 = [v15 codeSignerType];
        if ([(MIInstallableBundle *)self isPlaceholderInstall]) {
          goto LABEL_8;
        }
        id v31 = [(MIInstallableBundle *)self existingBundleContainer];
        id v32 = [v31 bundle];
        if ([v32 isPlaceholder])
        {
          if (v18 == (id)2)
          {

LABEL_53:
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
              goto LABEL_71;
            }
            goto LABEL_70;
          }
          unsigned __int8 v41 = sub_10004CC98(v7);

          if (v41) {
            goto LABEL_53;
          }
          BOOL v40 = 0;
          BOOL v38 = v19 == (id)2;
        }
        else
        {

          BOOL v38 = v19 == (id)2;
          BOOL v39 = v18 == (id)2;
          BOOL v40 = v18 == (id)2;
          if (v39 && v19 == (id)2)
          {
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
              goto LABEL_71;
            }
            goto LABEL_70;
          }
        }
        if (sub_10004CC98(v7)
          && ([v15 entitlements],
              BOOL v42 = objc_claimAutoreleasedReturnValue(),
              unsigned int v43 = sub_10004CC98(v42),
              v42,
              v43))
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
            goto LABEL_71;
          }
        }
        else if (v40 {
               && ([v15 entitlements],
        }
                   uint64_t v44 = objc_claimAutoreleasedReturnValue(),
                   unsigned int v45 = sub_10004CC98(v44),
                   v44,
                   v45))
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
            goto LABEL_71;
          }
        }
        else
        {
          if ((sub_10004CC98(v7) & v38) != 1)
          {
LABEL_8:
            if ([v8 isEqualToString:v17])
            {
LABEL_71:

LABEL_72:
              id v28 = 0;
              BOOL v29 = 1;
              goto LABEL_73;
            }
            if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
              MOLogWrite();
            }
            id v20 = sub_10004CC30(v7);
            id v22 = v20;
            if (v20 && [v20 containsObject:v17])
            {

              goto LABEL_71;
            }
            if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
              MOLogWrite();
            }
            sub_100014A08((uint64_t)"-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", 1207, MIInstallerErrorDomain, 64, 0, &off_100097E48, @"Upgrade's application-identifier entitlement string (%@) does not match installed application's application-identifier string (%@); rejecting upgrade.",
              v21,
              (uint64_t)v8);
            id v28 = (id)objc_claimAutoreleasedReturnValue();

            if (!a4) {
              goto LABEL_51;
            }
            goto LABEL_25;
          }
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
            goto LABEL_71;
          }
        }
LABEL_70:
        MOLogWrite();
        goto LABEL_71;
      }
      if ([(MIInstallableBundle *)self isPlaceholderInstall])
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          uint64_t v30 = [(MIInstallable *)self bundle];
          id v49 = [v30 identifier];
          MOLogWrite();
        }
        goto LABEL_71;
      }
      uint64_t v33 = [(MIInstallable *)self bundle];
      uint64_t v34 = [v33 identifier];

      unsigned int v35 = [(MIInstallableBundle *)self existingBundleContainer];
      long long v36 = [v35 bundle];
      unsigned int v37 = [v36 isPlaceholder];

      if (v37)
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
          goto LABEL_46;
        }
      }
      else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
      {
        goto LABEL_46;
      }
      MOLogWrite();
LABEL_46:

      goto LABEL_71;
    }
  }
  else
  {
  }
  sub_100014A08((uint64_t)"-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]", 1129, MIInstallerErrorDomain, 63, 0, &off_100097E20, @"Application is missing the application-identifier entitlement.", v26, (uint64_t)v47);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
LABEL_51:
    BOOL v29 = 0;
    goto LABEL_73;
  }
LABEL_25:
  id v28 = v28;
  BOOL v29 = 0;
  *a4 = v28;
LABEL_73:

  return v29;
}

- (BOOL)_performWatchVerificationForSigningInfo:(id)a3 isSystemAppInstall:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(MIInstallable *)self bundle];
  id v31 = 0;
  BOOL v10 = [v9 watchKitV2AppBundleWithError:&v31];
  id v11 = v31;
  id v12 = v11;
  if (v10)
  {
    if (v6)
    {
      BOOL v13 = (void *)MIInstallerErrorDomain;
      id v14 = [v10 bundleURL];
      id v15 = [v14 path];
      id v16 = [v9 identifier];
      uint64_t v18 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performWatchVerificationForSigningInfo:isSystemAppInstall:withError:]", 1306, v13, 92, v12, &off_100097E70, @"Embedded WatchKit apps are not allowed in deletable system apps (found one at %@ in %@).", v17, (uint64_t)v15);

      id v12 = (id)v18;
LABEL_13:

      goto LABEL_14;
    }
    id v30 = v11;
    unsigned int v20 = [v10 watchKitVersionWithError:&v30];
    id v16 = v30;

    if (v20 != 3)
    {
      id v25 = (void *)MIInstallerErrorDomain;
      id v14 = [v10 bundleURL];
      id v15 = [v14 path];
      sub_100014A08((uint64_t)"-[MIInstallableBundle _performWatchVerificationForSigningInfo:isSystemAppInstall:withError:]", 1311, v25, 92, v16, &off_100097E98, @"Found WatchKit app at %@ but it was not a WatchKit 2 app (was version %@). Is it missing its app extension?", v26, (uint64_t)v15);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    id v29 = v16;
    unsigned int v21 = [v10 executableExistsWithError:&v29];
    id v22 = v29;

    if (!v21)
    {
      id v12 = v22;
      if (a5) {
        goto LABEL_16;
      }
      goto LABEL_18;
    }
    id v28 = v22;
    unsigned int v23 = [(MIInstallableBundle *)self _isValidWatchKitApp:v10 withVersion:3 installableSigningInfo:v8 isSystemAppInstall:0 error:&v28];
    id v12 = v28;

    if (!v23)
    {
LABEL_15:
      if (a5)
      {
LABEL_16:
        id v12 = v12;
        BOOL v24 = 0;
        *a5 = v12;
        goto LABEL_19;
      }
LABEL_18:
      BOOL v24 = 0;
      goto LABEL_19;
    }
    [(MIInstallableBundle *)self setEmbeddedWatchApp:v10];
  }
  else
  {
    id v14 = [v11 domain];
    if (![v14 isEqualToString:MIInstallerErrorDomain])
    {
LABEL_14:

      goto LABEL_15;
    }
    id v19 = [v12 code];

    if (v19 != (id)85) {
      goto LABEL_15;
    }

    id v12 = 0;
  }
  BOOL v24 = 1;
LABEL_19:

  return v24;
}

- (BOOL)_getLinkedParentBundleID:(id *)a3 withError:(id *)a4
{
  int v7 = [(MIInstallable *)self bundle];
  id v8 = [v7 identifier];

  uint64_t v9 = [(MIInstallable *)self installOptions];
  id v10 = [v9 linkedParentBundleID];

  id v11 = 0;
  if ([(MIInstallableBundle *)self isPlaceholderInstall] && !v10)
  {
    id v12 = [(MIInstallableBundle *)self existingBundleContainer];
    BOOL v13 = v12;
    if (v12)
    {
      id v19 = 0;
      id v14 = [v12 bundleMetadataWithError:&v19];
      id v16 = v19;
      if (!v14)
      {
        sub_100014A08((uint64_t)"-[MIInstallableBundle _getLinkedParentBundleID:withError:]", 1375, MIInstallerErrorDomain, 4, v16, 0, @"Failed to read previously set bundle metadata for %@", v15, (uint64_t)v8);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (a4)
        {
          id v11 = v11;
          id v10 = 0;
          BOOL v17 = 0;
          *a4 = v11;
        }
        else
        {
          id v10 = 0;
          BOOL v17 = 0;
        }
        goto LABEL_11;
      }
      id v10 = [v14 linkedParentBundleID];
    }
    else
    {
      id v10 = 0;
      id v16 = 0;
    }

    id v11 = v16;
  }
  if (a3)
  {
    id v10 = v10;
    *a3 = v10;
  }
  BOOL v17 = 1;
LABEL_11:

  return v17;
}

- (BOOL)_validateLinkedParentForSigningInfo:(id)a3 appManagementDomainValue:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = [(MIInstallableBundle *)self isPlaceholderInstall];
  id v10 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v11 = [v10 localSigningIsUnrestricted];

  id v12 = [(MIInstallable *)self bundle];
  BOOL v13 = [v12 identifier];

  id v14 = [v8 codeSignerType];
  id v38 = 0;
  id v39 = 0;
  LODWORD(self) = [(MIInstallableBundle *)self _getLinkedParentBundleID:&v39 withError:&v38];
  id v15 = v39;
  id v17 = v38;
  if (!self) {
    goto LABEL_43;
  }
  unsigned int v37 = a5;
  if (!v15)
  {
    LOBYTE(v19) = 0;
    goto LABEL_17;
  }
  id v18 = v15;
  if ([v18 isEqualToString:@"com.apple.Playgrounds"])
  {

    LOBYTE(v19) = 1;
    goto LABEL_17;
  }
  uint64_t v36 = (uint64_t)v13;
  char v41 = 0;
  unsigned int v20 = +[MITestManager sharedInstance];
  id v40 = 0;
  unsigned int v21 = [v20 isRunningInTestMode:&v41 outError:&v40];
  id v35 = v40;

  if (!v21)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      MOLogWrite();
      id v22 = v35;
      unsigned int v19 = 0;
      BOOL v13 = (void *)v36;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (!v41)
  {
LABEL_12:
    unsigned int v19 = 0;
    goto LABEL_13;
  }
  unsigned int v19 = [v18 isEqualToString:@"com.apple.mock.Playgrounds"];
LABEL_13:
  id v22 = v35;
  BOOL v13 = (void *)v36;
LABEL_14:

  if (((v19 | v11) & 1) == 0)
  {
    unsigned int v23 = +[MITestManager sharedInstance];
    unsigned __int8 v24 = [v23 testFlagsAreSet:4];

    if ((v24 & 1) == 0)
    {
      BOOL v13 = (void *)v36;
      sub_100014A08((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1418, MIInstallerErrorDomain, 195, 0, &off_100097EC0, @"App %@ specified \"%@\" as its linked parent app but that app isn't an allowed parent app.", v16, v36);
      goto LABEL_41;
    }
    LOBYTE(v19) = 0;
    BOOL v13 = (void *)v36;
  }
LABEL_17:
  if (v9)
  {
    if (a4 != 1 || v15) {
      goto LABEL_23;
    }
LABEL_31:
    BOOL v32 = 1;
    goto LABEL_46;
  }
  if (v14 != (id)5) {
    goto LABEL_31;
  }
  if ((v11 & 1) == 0)
  {
    if (a4 == 1 && !v15)
    {
      sub_100014A08((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1434, MIInstallerErrorDomain, 170, 0, &off_100097EE8, @"App %@ was signed with a local key but did not specify either the %@ entitlement or a linked parent bundle ID.", v16, (uint64_t)v13);
      goto LABEL_41;
    }
    if (!v15)
    {
      sub_100014A08((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1437, MIInstallerErrorDomain, 196, 0, &off_100097F10, @"App %@ was signed with a local key but did not have linked parent bundle ID specified.", v16, (uint64_t)v13);
      goto LABEL_41;
    }
    if (a4 == 1)
    {
      sub_100014A08((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1440, MIInstallerErrorDomain, 197, 0, &off_100097F38, @"App %@ was signed with a local key but did not have the %@ entitlement.", v16, (uint64_t)v13);
      goto LABEL_41;
    }
  }
LABEL_23:
  char v25 = v19 ^ 1;
  if (a4 == 2) {
    char v25 = 1;
  }
  if (v25)
  {
    if (a4 == 2) {
      char v31 = v19;
    }
    else {
      char v31 = 1;
    }
    if (v31) {
      goto LABEL_31;
    }
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1456, MIInstallerErrorDomain, 169, 0, &off_100097F88, @"App %@ with the %@ entitlement set to a value prefixed by \"swift-playgrounds\" did not specify a linkage to the Swift Playgrounds app.", v16, (uint64_t)v13);
    uint64_t v30 = LABEL_41:;
    goto LABEL_42;
  }
  uint64_t v26 = (void *)MIInstallerErrorDomain;
  [v8 entitlements];
  v28 = uint64_t v27 = (uint64_t)v13;
  uint64_t v34 = sub_10004CD74(v28);
  uint64_t v30 = sub_100014A08((uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]", 1453, v26, 168, 0, &off_100097F60, @"App %@ linked to Swift Playgrounds did not have the %@ entitlement set to a value prefixed by \"swift-playgrounds\" (found %@).", v29, v27);

  id v17 = v28;
  BOOL v13 = (void *)v27;
LABEL_42:
  a5 = v37;

  id v17 = (id)v30;
LABEL_43:
  if (a5)
  {
    id v17 = v17;
    BOOL v32 = 0;
    *a5 = v17;
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_46:

  return v32;
}

- (BOOL)_validateAppManagementDomainForSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(MIInstallable *)self bundle];
  id v8 = [v7 identifier];

  unsigned int v9 = [v6 entitlements];
  uint64_t v10 = sub_10004CE64(v9);
  unsigned int v11 = +[MIDaemonConfiguration sharedInstance];
  unsigned __int8 v12 = [v11 localSigningIsUnrestricted];

  if (v10 || (v12 & 1) != 0)
  {
    id v19 = 0;
    BOOL v16 = [(MIInstallableBundle *)self _validateLinkedParentForSigningInfo:v6 appManagementDomainValue:v10 error:&v19];
    id v15 = v19;
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v13 = (void *)MIInstallerErrorDomain;
    id v18 = sub_10004CD74(v9);
    sub_100014A08((uint64_t)"-[MIInstallableBundle _validateAppManagementDomainForSigningInfo:error:]", 1480, v13, 194, 0, 0, @"App %@ has a value for its %@ entitlement that is not allowed: \"%@\".", v14, (uint64_t)v8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v16 = 0;
    if (!a4) {
      goto LABEL_8;
    }
  }
  if (!v16) {
    *a4 = v15;
  }
LABEL_8:

  return v16;
}

- (BOOL)_performAppClipSpecificValidationForEntitlements:(id)a3 isAppClip:(BOOL *)a4 withError:(id *)a5
{
  id v7 = a3;
  unsigned int v8 = sub_10004CAE4(v7);
  id v58 = +[NSSet setWithObjects:@"com.apple.widgetkit-extension"];
  if (!v8)
  {
    unsigned int v11 = 0;
    unsigned __int8 v12 = 0;
    unsigned int v21 = 0;
    BOOL v13 = 0;
    BOOL v16 = 0;
    id v56 = 0;
    id v20 = 0;
    goto LABEL_10;
  }
  unsigned int v9 = sub_10004CBB0(v7);
  uint64_t v10 = sub_10004CAF4(v7);
  id v56 = v9;
  if (!v10)
  {
    char v25 = (void *)MIInstallerErrorDomain;
    uint64_t v26 = [(MIInstallable *)self bundle];
    uint64_t v27 = [v26 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1533, v25, 145, 0, &off_100097FB0, @"Attempted to install an app clip with bundleID %@ which is on demand install capable but doesn't have the %@ entitlement", v28, (uint64_t)v27);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    unsigned int v11 = 0;
LABEL_20:
    unsigned __int8 v12 = 0;
    unsigned int v21 = 0;
    BOOL v13 = 0;
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
  unsigned int v11 = v10;
  if ([v10 count] != (id)1)
  {
    uint64_t v29 = (void *)MIInstallerErrorDomain;
    uint64_t v30 = [(MIInstallable *)self bundle];
    char v31 = [v30 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1539, v29, 151, 0, &off_100097FD8, @"Attempted to install an app clip with bundleID %@ which has %ld parent identifiers in the %@ entitlement", v32, (uint64_t)v31);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  unsigned __int8 v12 = [v11 objectAtIndex:0];
  BOOL v13 = [v12 stringByAppendingString:@"."];
  if (![v9 hasPrefix:v13]
    || (id v15 = [v9 length], v15 <= objc_msgSend(v13, "length")))
  {
    sub_100014A08((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1547, MIInstallerErrorDomain, 150, 0, &off_100098000, @"Application identifier of the parent app, \"%@\", is not a prefix of the application identifier of the app clip, \"%@\"", v14, (uint64_t)v12);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v21 = 0;
    goto LABEL_22;
  }
  BOOL v16 = [v9 substringFromIndex:[v13 length]];
  if ([v16 containsString:@"."])
  {
    int v52 = (void *)MIInstallerErrorDomain;
    id v17 = [(MIInstallable *)self bundle];
    id v18 = [v17 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1553, v52, 149, 0, &off_100098028, @"App clip with bundleID \"%@\" contains a '.' in the portion after the parent app's prefix (prefix: \"%@\" ; dot in: \"%@\")'",
      v19,
      (uint64_t)v18);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    unsigned int v21 = 0;
    goto LABEL_23;
  }
  uint64_t v33 = sub_10004CCA8(v7);
  if (!v33)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = [(MIInstallableBundle *)self appExtensionBundles];
    id v54 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v54)
    {
      uint64_t v50 = *(void *)v60;
      while (2)
      {
        for (i = 0; i != v54; i = (char *)i + 1)
        {
          if (*(void *)v60 != v50) {
            objc_enumerationMutation(obj);
          }
          unsigned int v37 = [*(id *)(*((void *)&v59 + 1) + 8 * i) extensionPointIdentifier];
          if (![v58 containsObject:v37])
          {
            id v51 = (void *)MIInstallerErrorDomain;
            id v55 = [(MIInstallable *)self bundle];
            unsigned int v45 = [v55 identifier];
            sub_100014A08((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1569, v51, 173, 0, &off_100098078, @"The App Clip with bundle ID %@ contains an app extension with an extension point that is not allowed within an App Clip, \"%@\".", v46, (uint64_t)v45);
            id v20 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_8;
          }
        }
        id v54 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v54) {
          continue;
        }
        break;
      }
    }

    id v38 = [(MIInstallableBundle *)self embeddedWatchApp];

    if (v38)
    {
      id v40 = (void *)MIInstallerErrorDomain;
      char v41 = &off_1000980A0;
      BOOL v42 = @"App clip contains an embedded watch app";
      uint64_t v43 = 1577;
      uint64_t v44 = 146;
LABEL_40:
      sub_100014A08((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", v43, v40, v44, 0, v41, v42, v39, 0);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    BOOL v47 = [(MIInstallableBundle *)self driverKitExtensionBundles];
    id v20 = [v47 count];

    if (v20)
    {
      id v40 = (void *)MIInstallerErrorDomain;
      char v41 = &off_1000980C8;
      BOOL v42 = @"App clip contains a DriverKit bundle";
      uint64_t v43 = 1584;
      uint64_t v44 = 179;
      goto LABEL_40;
    }
    unsigned int v21 = 0;
LABEL_10:
    BOOL v22 = 1;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  unsigned int v21 = (void *)v33;
  id v49 = (void *)MIInstallerErrorDomain;
  int v53 = [(MIInstallable *)self bundle];
  uint64_t v34 = [v53 identifier];
  sub_100014A08((uint64_t)"-[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]", 1561, v49, 148, 0, &off_100098050, @"App clip with bundleID %@ has the %@ entitlement, which is not allowed on app clips", v35, (uint64_t)v34);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
  BOOL v22 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v8;
LABEL_12:
  if (a5) {
    char v23 = v22;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0) {
    *a5 = v20;
  }

  return v22;
}

- (BOOL)_performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  id v111 = sub_100043340;
  id v112 = sub_100043350;
  id v113 = 0;
  id v6 = [(MIInstallable *)self bundle];
  id v7 = [v5 entitlements];
  unsigned int v8 = sub_10004D3C8(v7);
  v81 = v5;
  id v82 = v6;
  if (((sub_10004D3D8(v7) ^ 1 | v8) & 1) == 0)
  {
    unsigned int v11 = [v6 relativePath];
    uint64_t v13 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1625, MIInstallerErrorDomain, 216, 0, 0, @"%@ has the \"%@\" entitlement, but it does not have the \"%@\" entitlement. The \"%@\" entitlement is only available to apps with the \"%@\" entitlement.", v14, (uint64_t)v11);
    goto LABEL_5;
  }
  unsigned int v9 = sub_10004D278(v7);
  unsigned int v10 = sub_10004D288(v7);
  if ((v9 & v10) == 1)
  {
    unsigned int v11 = [v6 relativePath];
    uint64_t v13 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1636, MIInstallerErrorDomain, 212, 0, 0, @"%@ has both the \"%@\" entitlement and the \"%@\" entitlement. Only one of these entitlements may be present at a time. Remove one of these entitlements to allow this app to be installed.", v12, (uint64_t)v11);
LABEL_5:
    id v15 = (id)v109[5];
    v109[5] = v13;
LABEL_6:

    BOOL v16 = 0;
    goto LABEL_7;
  }
  if ((v10 & v8) == 1)
  {
    unsigned int v11 = [v6 relativePath];
    uint64_t v13 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1643, MIInstallerErrorDomain, 214, 0, 0, @"%@ has the \"%@\" entitlement so it may not also have the \"%@\" entitlement. Remove one of these entitlements to allow this app to be installed.", v19, (uint64_t)v11);
    goto LABEL_5;
  }
  if (!v9) {
    goto LABEL_22;
  }
  if (MGGetBoolAnswer())
  {
    if (![(id)objc_opt_class() _shouldSkipEligibilityChecksForAppWithSigningInfo:v5])
    {
      if (v8)
      {
        uint64_t v34 = (id *)(v109 + 5);
        id v107 = (id)v109[5];
        unsigned __int8 v35 = [v6 hasExecutableSliceForCPUType:16777228 subtype:2 error:&v107];
        objc_storeStrong(v34, v107);
        if ((v35 & 1) == 0)
        {
          BOOL v42 = (void *)v109[5];
          unsigned int v11 = [v6 relativePath];
          uint64_t v13 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1676, MIInstallerErrorDomain, 202, v42, 0, @"\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.", v43, (uint64_t)v11);
          goto LABEL_5;
        }
        uint64_t v36 = (void *)v109[5];
        v109[5] = 0;

        v104[0] = _NSConcreteStackBlock;
        v104[1] = 3221225472;
        v104[2] = sub_100043358;
        v104[3] = &unk_10008D910;
        v106 = &v108;
        id v105 = v6;
        unsigned int v37 = [v105 enumerateDylibsWithBlock:v104];
        unsigned int v11 = v37;
        id v38 = v109;
        if (!v109[5])
        {
          if (!v37)
          {
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            uint64_t v44 = [(MIInstallableBundle *)self frameworkBundles];
            id v45 = [v44 countByEnumeratingWithState:&v100 objects:v117 count:16];
            if (v45)
            {
              uint64_t v46 = *(void *)v101;
              id v79 = v44;
              while (2)
              {
                for (i = 0; i != v45; i = (char *)i + 1)
                {
                  if (*(void *)v101 != v46) {
                    objc_enumerationMutation(v79);
                  }
                  BOOL v48 = *(void **)(*((void *)&v100 + 1) + 8 * i);
                  id v49 = (id *)(v109 + 5);
                  id v99 = (id)v109[5];
                  unsigned __int8 v50 = [v48 hasExecutableSliceForCPUType:16777228 subtype:2 error:&v99];
                  objc_storeStrong(v49, v99);
                  if ((v50 & 1) == 0)
                  {
                    id v63 = (void *)v109[5];
                    long long v64 = [v48 relativePath];
                    uint64_t v66 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1715, MIInstallerErrorDomain, 202, v63, 0, @"\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.", v65, (uint64_t)v64);
                    long long v67 = (void *)v109[5];
                    v109[5] = v66;

LABEL_75:
                    id v40 = v79;
                    goto LABEL_76;
                  }
                }
                uint64_t v44 = v79;
                id v45 = [v79 countByEnumeratingWithState:&v100 objects:v117 count:16];
                if (v45) {
                  continue;
                }
                break;
              }
            }

            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v51 = [(MIInstallableBundle *)self driverKitExtensionBundles];
            id v52 = [v51 countByEnumeratingWithState:&v95 objects:v116 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v96;
              id v79 = v51;
              while (2)
              {
                for (j = 0; j != v52; j = (char *)j + 1)
                {
                  if (*(void *)v96 != v53) {
                    objc_enumerationMutation(v79);
                  }
                  id v55 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
                  id v56 = (id *)(v109 + 5);
                  id v94 = (id)v109[5];
                  unsigned __int8 v57 = [v55 hasExecutableSliceForCPUType:16777228 subtype:2 error:&v94];
                  objc_storeStrong(v56, v94);
                  if ((v57 & 1) == 0)
                  {
                    id v68 = (void *)v109[5];
                    id v69 = [v55 relativePath];
                    uint64_t v71 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1723, MIInstallerErrorDomain, 202, v68, 0, @"\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.", v70, (uint64_t)v69);
                    long long v72 = (void *)v109[5];
                    v109[5] = v71;

                    goto LABEL_75;
                  }
                }
                id v51 = v79;
                id v52 = [v79 countByEnumeratingWithState:&v95 objects:v116 count:16];
                if (v52) {
                  continue;
                }
                break;
              }
            }

            if (sub_10004C70C(v7))
            {
              long long v93 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              long long v90 = 0u;
              id v40 = [(MIInstallableBundle *)self xpcServiceBundles];
              id v80 = [v40 countByEnumeratingWithState:&v90 objects:v115 count:16];
              if (v80)
              {
                uint64_t v58 = *(void *)v91;
                while (2)
                {
                  for (k = 0; k != v80; k = (char *)k + 1)
                  {
                    if (*(void *)v91 != v58) {
                      objc_enumerationMutation(v40);
                    }
                    long long v60 = *(void **)(*((void *)&v90 + 1) + 8 * (void)k);
                    long long v61 = (id *)(v109 + 5);
                    id v89 = (id)v109[5];
                    unsigned __int8 v62 = [v60 hasExecutableSliceForCPUType:16777228 subtype:2 error:&v89];
                    objc_storeStrong(v61, v89);
                    if ((v62 & 1) == 0)
                    {
                      long long v73 = (void *)v109[5];
                      v74 = [v60 relativePath];
                      uint64_t v76 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1734, MIInstallerErrorDomain, 202, v73, 0, @"\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.", v75, (uint64_t)v74);
                      unsigned int v77 = (void *)v109[5];
                      v109[5] = v76;

                      goto LABEL_76;
                    }
                  }
                  id v80 = [v40 countByEnumeratingWithState:&v90 objects:v115 count:16];
                  if (v80) {
                    continue;
                  }
                  break;
                }
              }
            }
            int v20 = 1;
            goto LABEL_23;
          }
          id v39 = v37;
          id v40 = (void *)v38[5];
          v38[5] = (uint64_t)v39;
LABEL_76:
        }
        id v15 = v105;
        goto LABEL_6;
      }
LABEL_44:
      unsigned int v11 = [v6 relativePath:v78];
      uint64_t v13 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1669, MIInstallerErrorDomain, 201, 0, 0, @"%@ has the \"%@\" entitlement but must also have the \"%@\" entitlement.", v41, (uint64_t)v11);
      goto LABEL_5;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      v78 = [v6 identifier];
      MOLogWrite();
    }
  }
  if ((v8 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_22:
  int v20 = 0;
LABEL_23:
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  unsigned int v11 = [(MIInstallableBundle *)self appExtensionBundles];
  id v21 = [v11 countByEnumeratingWithState:&v85 objects:v114 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v86;
    while (2)
    {
      for (m = 0; m != v21; m = (char *)m + 1)
      {
        if (*(void *)v86 != v22) {
          objc_enumerationMutation(v11);
        }
        unsigned __int8 v24 = *(void **)(*((void *)&v85 + 1) + 8 * (void)m);
        if (v20)
        {
          char v25 = (id *)(v109 + 5);
          id obj = (id)v109[5];
          unsigned __int8 v26 = [v24 hasExecutableSliceForCPUType:16777228 subtype:2 error:&obj];
          objc_storeStrong(v25, obj);
          if ((v26 & 1) == 0)
          {
            uint64_t v27 = (void *)v109[5];
            id v15 = [v24 relativePath];
            uint64_t v29 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1748, MIInstallerErrorDomain, 202, v27, 0, @"\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.", v28, (uint64_t)v15);
            uint64_t v30 = (void *)v109[5];
            v109[5] = v29;
LABEL_38:

            goto LABEL_6;
          }
        }
        if ((v9 & 1) == 0 && [v24 targetsBrowserExtensionPoint])
        {
          id v15 = [v24 relativePath];
          uint64_t v30 = [v24 extensionPointIdentifier];
          uint64_t v32 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]", 1754, MIInstallerErrorDomain, 203, 0, 0, @"The app extension at \"%@\" targets the extension point \"%@\", which is not allowed in a non-browser app. Either add the entitlement \"%@\" to the containing app, or remove this app extension.", v31, (uint64_t)v15);
          uint64_t v33 = (void *)v109[5];
          v109[5] = v32;

          goto LABEL_38;
        }
      }
      id v21 = [v11 countByEnumeratingWithState:&v85 objects:v114 count:16];
      BOOL v16 = 1;
      if (v21) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_7:

  if (a4) {
    char v17 = v16;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    *a4 = (id) v109[5];
  }

  _Block_object_dispose(&v108, 8);
  return v16;
}

- (id)_builtInAppUpgradeFailureError
{
  v3 = [(MIInstallableBundle *)self upgradingBuiltInAppAtURL];
  id v4 = [v3 path];

  id v5 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v6 = [v5 hasInternalContent];

  id v7 = (void *)MIInstallerErrorDomain;
  unsigned int v8 = [(MIInstallable *)self bundle];
  unsigned int v10 = [v8 identifier];
  if (v6) {
    sub_100014A08((uint64_t)"[(MIInstallableBundle *)"This app has the same bundle identifier _builtInAppUpgradeFailureError], v9, (uint64_t)v10);
  }
  else {
  unsigned int v11 = sub_100014A08((uint64_t)"[(MIInstallableBundle *)"This app has the same bundle identifier _builtInAppUpgradeFailureError], v9, (uint64_t)v10);
  }

  return v11;
}

- (BOOL)_performBuiltInAppUpgradeValidationWithSigningInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MIInstallableBundle *)self upgradingBuiltInAppAtURL];

  if (v7)
  {
    unsigned int v8 = [v6 entitlements];
    uint64_t v9 = [(MIInstallableBundle *)self upgradingBuiltInAppAtURL];
    unsigned int v10 = [v9 URLByDeletingLastPathComponent];
    unsigned int v11 = [v10 path];

    uint64_t v12 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v13 = [v12 systemAppsDirectory];
    uint64_t v14 = [v13 path];
    unsigned int v15 = [v11 isEqualToString:v14];

    if (v15
      && !+[MIExecutableBundle isGrandfatheredNonContainerizedForSigningInfo:v6]|| (sub_1000437DC(v8) & 1) != 0)
    {
      id v16 = 0;
      BOOL v17 = 1;
    }
    else
    {
      id v18 = [(MIInstallableBundle *)self _builtInAppUpgradeFailureError];
      id v16 = v18;
      if (a4)
      {
        id v16 = v18;
        BOOL v17 = 0;
        *a4 = v16;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)performVerificationWithError:(id *)a3
{
  id v5 = [(MIInstallable *)self installOptions];
  unsigned int v6 = [(MIInstallableBundle *)self isPlaceholderInstall];
  v366.receiver = self;
  v366.super_class = (Class)MIInstallableBundle;
  if (![(MIInstallable *)&v366 performVerificationWithError:a3])
  {
    id v16 = 0;
    id v17 = 0;
    goto LABEL_138;
  }
  id v7 = [(MIInstallable *)self progressBlock];

  if (v7)
  {
    unsigned int v8 = [(MIInstallable *)self progressBlock];
    ((void (**)(void, const __CFString *, uint64_t))v8)[2](v8, @"VerifyingApplication", 40);
  }
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = [(MIInstallable *)self bundle];
    id v10 = [v9 executableURL];
    removexattr((const char *)[v10 fileSystemRepresentation], "com.apple.installd.hidden_archs_fat_header", 1);

    unsigned int v11 = [(MIInstallable *)self bundle];
    id v12 = [v11 executableURL];
    char v13 = sub_100008B10((const char *)[v12 fileSystemRepresentation]);

    if ((v13 & 1) == 0)
    {
      uint64_t v29 = (void *)MIInstallerErrorDomain;
      uint64_t v30 = [(MIInstallable *)self bundle];
      uint64_t v31 = [v30 executableURL];
      sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 1907, v29, 14, 0, 0, @"Failed to unhide archs in executable %@", v32, (uint64_t)v31);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
  }
  if ([v5 installTargetType] == (id)1)
  {
    unsigned int v14 = [v5 isDeveloperInstall];
    unsigned int v15 = [v5 isSystemAppInstall];
  }
  else
  {
    unsigned int v15 = 0;
    unsigned int v14 = 0;
  }
  id v18 = +[MIDaemonConfiguration sharedInstance];
  if ((([v18 codeSigningEnforcementIsDisabled] | v6) & 1) != 0 || v15)
  {
  }
  else
  {
    uint64_t v19 = [(MIInstallable *)self bundle];
    unsigned int v20 = [v19 isRemovableSystemApp];

    if (v20)
    {
      sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 1926, MIInstallerErrorDomain, 25, 0, &off_100098140, @"Attempted to install a deletable system app with incorrect install type.", v21, v258);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      id v16 = 0;
      goto LABEL_136;
    }
  }
  unsigned int v279 = v15;
  unsigned int v280 = v6;
  id v22 = [v5 allowLocalProvisioned];
  char v23 = [(MIInstallable *)self bundle];
  id v365 = 0;
  v259 = &v365;
  unsigned int v283 = v14 ^ 1;
  id v16 = -[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v23, v14 ^ 1, 1, 1, v22, 0);
  id v17 = v365;

  if (!v16) {
    goto LABEL_136;
  }
  id v24 = [v16 codeSignerType];
  if (v14)
  {
    id v25 = v24;
    if ([v16 profileValidationType] == (id)2 || v25 == (id)2) {
      goto LABEL_26;
    }
    unsigned __int8 v26 = [v16 entitlements];
    if (sub_10004C71C(v26))
    {
      uint64_t v27 = +[MIDaemonConfiguration sharedInstance];
      char v28 = [v27 codeSigningEnforcementIsDisabled] ^ 1;
    }
    else
    {
      char v28 = 0;
    }

    if ((v28 & 1) != 0 || v25 == (id)5)
    {
LABEL_26:
      if ([v16 codeSignerType] == (id)2)
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
          goto LABEL_37;
        }
      }
      else if ([v16 profileValidationType] == (id)2)
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
          goto LABEL_37;
        }
      }
      else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
      {
        goto LABEL_37;
      }
      uint64_t v33 = [(MIInstallable *)self bundle];
      v259 = [v33 identifier];
      MOLogWrite();

LABEL_37:
      uint64_t v34 = [(MIInstallable *)self bundle];
      id v364 = v17;
      v259 = &v364;
      uint64_t v35 = -[MIInstallableBundle _validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:](self, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:", v34, 1, 1, 1, v22, 0);
      id v36 = v364;

      if (!v35)
      {
        id v16 = 0;
        id v17 = v36;
        goto LABEL_136;
      }
      id v16 = (void *)v35;
      id v17 = v36;
    }
  }
  unsigned int v37 = v17;
  [(MIInstallableBundle *)self setBundleSigningInfo:v16];
  id v38 = [(MIInstallable *)self bundle];
  id v39 = [v16 entitlements];
  id v363 = v17;
  int v40 = sub_100045C50(v38, v39, &v363);
  id v17 = v363;

  if (!v40) {
    goto LABEL_136;
  }
  v282 = v16;
  v269 = a3;
  v270 = v5;
  long long v362 = 0u;
  long long v361 = 0u;
  long long v360 = 0u;
  long long v359 = 0u;
  uint64_t v41 = [(MIInstallableBundle *)self frameworkBundles];
  id v42 = [v41 countByEnumeratingWithState:&v359 objects:v378 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v360;
    do
    {
      id v45 = 0;
      uint64_t v46 = v17;
      do
      {
        if (*(void *)v360 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v47 = *(void *)(*((void *)&v359 + 1) + 8 * (void)v45);
        id v358 = v46;
        BOOL v48 = [(MIInstallableBundle *)self _validateBundle:v47 validatingResources:v283 performingOnlineAuthorization:0 checkingTrustCacheIfApplicable:1 allowingFreeProfileValidation:v22 skippingProfileIDValidation:1 error:&v358];
        id v17 = v358;

        if (!v48)
        {

          goto LABEL_61;
        }
        id v45 = (char *)v45 + 1;
        uint64_t v46 = v17;
      }
      while (v43 != v45);
      id v43 = [v41 countByEnumeratingWithState:&v359 objects:v378 count:16];
    }
    while (v43);
  }

  long long v357 = 0u;
  long long v356 = 0u;
  long long v354 = 0u;
  long long v355 = 0u;
  id obj = [(MIInstallableBundle *)self appExtensionBundles];
  id v271 = [obj countByEnumeratingWithState:&v354 objects:v377 count:16];
  if (!v271) {
    goto LABEL_63;
  }
  uint64_t v274 = *(void *)v355;
  do
  {
    for (i = 0; i != v271; i = (char *)i + 1)
    {
      if (*(void *)v355 != v274) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v50 = *(void **)(*((void *)&v354 + 1) + 8 * i);
      id v353 = v17;
      id v51 = [(MIInstallableBundle *)self _validateBundle:v50 validatingResources:v283 performingOnlineAuthorization:0 checkingTrustCacheIfApplicable:1 allowingFreeProfileValidation:v22 skippingProfileIDValidation:0 error:&v353];
      id v52 = v353;

      if (!v51) {
        goto LABEL_134;
      }
      uint64_t v53 = [v51 entitlements];
      id v352 = v52;
      unsigned int v54 = [v50 validateHasCorrespondingEntitlements:v53 error:&v352];
      id v55 = v352;

      if (!v54) {
        goto LABEL_133;
      }
      id v351 = v55;
      int v56 = sub_100045E34(v50, v53, &v351);
      id v17 = v351;

      if (!v56)
      {
        id v55 = v17;
LABEL_133:

        id v52 = v55;
LABEL_134:
        a3 = v269;
        id v5 = v270;

        id v17 = v52;
        goto LABEL_135;
      }
      if (sub_10004C73C(v53))
      {
        long long v119 = (void *)MIInstallerErrorDomain;
        long long v120 = [v50 relativePath];
        sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2035, v119, 210, 0, 0, @"The app extension at \"%@\" has the \"%@\" entitlement, which is not allowed on an app extension.", v121, (uint64_t)v120);
        id v55 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_133;
      }

      id v16 = v282;
    }
    id v271 = [obj countByEnumeratingWithState:&v354 objects:v377 count:16];
  }
  while (v271);
LABEL_63:

  long long v349 = 0u;
  long long v350 = 0u;
  long long v347 = 0u;
  long long v348 = 0u;
  id obja = [(MIInstallableBundle *)self driverKitExtensionBundles];
  id v57 = [obja countByEnumeratingWithState:&v347 objects:v376 count:16];
  if (!v57) {
    goto LABEL_75;
  }
  id v58 = v57;
  uint64_t v272 = *(void *)v348;
  do
  {
    for (j = 0; j != v58; j = (char *)j + 1)
    {
      if (*(void *)v348 != v272) {
        objc_enumerationMutation(obja);
      }
      long long v60 = *(void **)(*((void *)&v347 + 1) + 8 * (void)j);
      id v346 = v17;
      long long v61 = [(MIInstallableBundle *)self _validateBundle:v60 validatingResources:v283 performingOnlineAuthorization:0 checkingTrustCacheIfApplicable:1 allowingFreeProfileValidation:v22 skippingProfileIDValidation:0 error:&v346];
      id v62 = v346;

      if (!v61)
      {
        v149 = obja;
        a3 = v269;
        id v5 = v270;
LABEL_177:

        id v17 = v62;
        goto LABEL_136;
      }
      v275 = v61;
      id v63 = [v61 entitlements];
      if ((sub_10004D014(v63) & 1) == 0)
      {
        v149 = obja;
        v150 = (void *)MIInstallerErrorDomain;
        v151 = [v60 bundleURL];
        id v17 = [v151 path];
        sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2057, v150, 178, 0, &off_100098168, @"Found DriverKit bundle %@ with missing entitlement %@", v152, (uint64_t)v17);
        id v65 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_175;
      }
      id v345 = v62;
      int v64 = sub_100045E34(v60, v63, &v345);
      id v65 = v345;

      if (!v64)
      {
        v149 = obja;
        goto LABEL_173;
      }
      id v344 = v65;
      int v66 = sub_100045C50(v60, v63, &v344);
      id v17 = v344;

      if (!v66)
      {
        v149 = obja;
        id v65 = v17;
LABEL_173:
        a3 = v269;
        id v5 = v270;
        id v16 = v282;
LABEL_176:

        id v62 = v65;
        goto LABEL_177;
      }
      id v16 = v282;
      if (sub_10004C73C(v63))
      {
        v149 = obja;
        v153 = (void *)MIInstallerErrorDomain;
        v151 = [v60 relativePath];
        sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2071, v153, 210, 0, 0, @"The DriverKit extension at \"%@\" has the \"%@\" entitlement, which is not allowed on a DriverKit extension.", v154, (uint64_t)v151);
        id v65 = (id)objc_claimAutoreleasedReturnValue();
LABEL_175:
        id v5 = v270;

        a3 = v269;
        goto LABEL_176;
      }
    }
    id v58 = [obja countByEnumeratingWithState:&v347 objects:v376 count:16];
  }
  while (v58);
LABEL_75:

  long long v67 = [v16 entitlements];
  unsigned int v68 = sub_10004C70C(v67);

  if (!v68)
  {
    id v71 = v17;
    goto LABEL_141;
  }
  id v69 = [(MIInstallable *)self bundle];
  id v343 = v17;
  uint64_t v70 = [v69 xpcServiceBundlesWithError:&v343];
  id v71 = v343;

  [(MIInstallableBundle *)self setXpcServiceBundles:v70];
  long long v72 = [(MIInstallableBundle *)self xpcServiceBundles];

  if (!v72)
  {
    id v17 = v71;
    goto LABEL_187;
  }
  long long v341 = 0u;
  long long v342 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  long long v73 = [(MIInstallableBundle *)self xpcServiceBundles];
  id v74 = [v73 countByEnumeratingWithState:&v339 objects:v375 count:16];
  if (v74)
  {
    id v75 = v74;
    uint64_t v276 = *(void *)v340;
    do
    {
      uint64_t v76 = 0;
      unsigned int v77 = v71;
      do
      {
        if (*(void *)v340 != v276) {
          objc_enumerationMutation(v73);
        }
        v78 = *(void **)(*((void *)&v339 + 1) + 8 * (void)v76);
        id v338 = v77;
        unsigned int v79 = [v78 executableExistsWithError:&v338];
        id v71 = v338;

        if (!v79) {
          goto LABEL_185;
        }
        id v80 = [v78 identifier];
        v81 = [(MIInstallableBundle *)self identifiersMap];
        id v82 = [v81 objectForKeyedSubscript:v80];

        if (v82)
        {
          v158 = (void *)MIInstallerErrorDomain;
          v159 = [v78 bundleURL];
          v160 = [v159 path];
          v161 = [(MIInstallableBundle *)self identifiersMap];
          [v161 objectForKeyedSubscript:v80];
          v163 = v162 = v73;
          v265 = [v163 path];
          uint64_t v165 = sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2094, v158, 57, 0, &off_100098190, @"Found bundle at %@ with the same identifier (%@) as bundle at %@", v164, (uint64_t)v160);

          long long v73 = v162;
          id v71 = (id)v165;
LABEL_185:

LABEL_186:
          id v17 = v71;
          goto LABEL_61;
        }
        id v83 = [v78 bundleURL];
        uint64_t v84 = [(MIInstallableBundle *)self identifiersMap];
        [v84 setObject:v83 forKeyedSubscript:v80];

        uint64_t v76 = (char *)v76 + 1;
        unsigned int v77 = v71;
      }
      while (v75 != v76);
      id v75 = [v73 countByEnumeratingWithState:&v339 objects:v375 count:16];
    }
    while (v75);
  }

  if (!v280) {
    goto LABEL_96;
  }
  long long v336 = 0u;
  long long v337 = 0u;
  long long v334 = 0u;
  long long v335 = 0u;
  long long v85 = [(MIInstallableBundle *)self xpcServiceBundles];
  id v86 = [v85 countByEnumeratingWithState:&v334 objects:v374 count:16];
  if (!v86) {
    goto LABEL_95;
  }
  id v87 = v86;
  uint64_t v88 = *(void *)v335;
  do
  {
    id v89 = 0;
    long long v90 = v71;
    do
    {
      if (*(void *)v335 != v88) {
        objc_enumerationMutation(v85);
      }
      long long v91 = *(void **)(*((void *)&v334 + 1) + 8 * (void)v89);
      id v333 = v90;
      unsigned int v92 = [v91 setIsPlaceholderWithError:&v333];
      id v71 = v333;

      if (!v92)
      {

        goto LABEL_186;
      }
      id v89 = (char *)v89 + 1;
      long long v90 = v71;
    }
    while (v87 != v89);
    id v87 = [v85 countByEnumeratingWithState:&v334 objects:v374 count:16];
  }
  while (v87);
LABEL_95:

LABEL_96:
  long long v331 = 0u;
  long long v332 = 0u;
  long long v329 = 0u;
  long long v330 = 0u;
  long long v93 = [(MIInstallableBundle *)self xpcServiceBundles];
  id v94 = [v93 countByEnumeratingWithState:&v329 objects:v373 count:16];
  if (v94)
  {
    id v95 = v94;
    uint64_t v96 = *(void *)v330;
    do
    {
      for (k = 0; k != v95; k = (char *)k + 1)
      {
        if (*(void *)v330 != v96) {
          objc_enumerationMutation(v93);
        }
        long long v98 = *(void **)(*((void *)&v329 + 1) + 8 * (void)k);
        id v99 = [(MIInstallable *)self progressBlock];
        [v98 installEmbeddedProvisioningProfileWithProgress:v99];
      }
      id v95 = [v93 countByEnumeratingWithState:&v329 objects:v373 count:16];
    }
    while (v95);
  }

  long long v327 = 0u;
  long long v328 = 0u;
  long long v325 = 0u;
  long long v326 = 0u;
  id objb = [(MIInstallableBundle *)self xpcServiceBundles];
  id v273 = [objb countByEnumeratingWithState:&v325 objects:v372 count:16];
  if (v273)
  {
    uint64_t v277 = *(void *)v326;
    do
    {
      for (m = 0; m != v273; m = (char *)m + 1)
      {
        if (*(void *)v326 != v277) {
          objc_enumerationMutation(objb);
        }
        long long v101 = *(void **)(*((void *)&v325 + 1) + 8 * (void)m);
        id v324 = v71;
        long long v102 = [(MIInstallableBundle *)self _validateBundle:v101 validatingResources:v283 performingOnlineAuthorization:0 checkingTrustCacheIfApplicable:1 allowingFreeProfileValidation:v22 skippingProfileIDValidation:0 error:&v324];
        id v17 = v324;

        if (!v102)
        {
          v187 = objb;
          a3 = v269;
          id v5 = v270;
          id v16 = v282;
LABEL_209:

          goto LABEL_136;
        }
        long long v103 = v102;
        unsigned int v104 = [v102 entitlements];
        id v323 = v17;
        int v105 = sub_100045E34(v101, v104, &v323);
        id v106 = v323;

        if (!v105)
        {
          v187 = objb;
LABEL_208:
          id v16 = v282;

          id v17 = v106;
          a3 = v269;
          id v5 = v270;
          goto LABEL_209;
        }
        id v322 = v106;
        int v107 = sub_100045C50(v101, v104, &v322);
        id v71 = v322;

        if (!v107)
        {
          v187 = objb;
          id v106 = v71;
          goto LABEL_208;
        }
        if (sub_10004C73C(v104))
        {
          v187 = objb;
          v188 = (void *)MIInstallerErrorDomain;
          v189 = [v101 relativePath];
          sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2140, v188, 210, 0, 0, @"The XPCService extension at \"%@\" has the \"%@\" entitlement, which is not allowed on an XPCService.", v190, (uint64_t)v189);
          id v106 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_208;
        }
      }
      id v273 = [objb countByEnumeratingWithState:&v325 objects:v372 count:16];
    }
    while (v273);
  }

  long long v320 = 0u;
  long long v321 = 0u;
  long long v318 = 0u;
  long long v319 = 0u;
  id v284 = [(MIInstallableBundle *)self xpcServiceBundles];
  id v108 = [v284 countByEnumeratingWithState:&v318 objects:v371 count:16];
  if (v108)
  {
    id v109 = v108;
    uint64_t v110 = *(void *)v319;
    do
    {
      for (n = 0; n != v109; n = (char *)n + 1)
      {
        if (*(void *)v319 != v110) {
          objc_enumerationMutation(v284);
        }
        id v112 = *(void **)(*((void *)&v318 + 1) + 8 * (void)n);
        id v113 = [v112 infoPlistSubset];
        id v114 = [v113 objectForKeyedSubscript:@"XPCService"];

        if (v114)
        {
          objc_opt_class();
          id v115 = sub_100017A04(v114);

          if (!v115)
          {
            v191 = (void *)MIInstallerErrorDomain;
            id v116 = [v112 bundleURL];
            v192 = [v116 path];
            v193 = (objc_class *)objc_opt_class();
            v194 = NSStringFromClass(v193);
            sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2149, v191, 113, 0, 0, @"XPCService key in Info.plist of XPC service at %@ has illegal value type: %@", v195, (uint64_t)v192);
            goto LABEL_225;
          }
          id v116 = [v114 objectForKeyedSubscript:@"ServiceType"];
          if (v116)
          {
            objc_opt_class();
            id v117 = sub_100017A04(v116);

            if (!v117)
            {
              v202 = (void *)MIInstallerErrorDomain;
              v192 = [v112 bundleURL];
              v194 = [v192 path];
              v203 = (objc_class *)objc_opt_class();
              uint64_t v263 = NSStringFromClass(v203);
              sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2156, v202, 51, 0, 0, @"XPCService's ServiceType key in Info.plist of service at %@ has illegal value type: %@", v204, (uint64_t)v194);
              id v17 = (id)objc_claimAutoreleasedReturnValue();

              id v71 = (id)v263;
              goto LABEL_226;
            }
            if (([v116 isEqualToString:@"Application"] & 1) == 0)
            {
              v205 = (void *)MIInstallerErrorDomain;
              v192 = [v112 bundleURL];
              v194 = [v192 path];
              sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2161, v205, 51, 0, 0, @"XPCService's ServiceType key in Info.plist of service at %@ has illegal value: %@ (must be \"Application\")", v206, (uint64_t)v194);
LABEL_225:
              id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_226:

LABEL_182:
LABEL_183:

              goto LABEL_61;
            }
          }
        }
      }
      id v109 = [v284 countByEnumeratingWithState:&v318 objects:v371 count:16];
    }
    while (v109);
  }

  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    long long v118 = [(MIInstallable *)self bundle];
    v259 = [v118 identifier];
    MOLogWrite();
  }
  -[MIInstallableBundle setXpcServiceBundlesEnabled:](self, "setXpcServiceBundlesEnabled:", 1, v259);
LABEL_141:
  long long v316 = 0u;
  long long v317 = 0u;
  long long v314 = 0u;
  long long v315 = 0u;
  id v284 = [(MIInstallableBundle *)self appExtensionBundles];
  id v124 = [v284 countByEnumeratingWithState:&v314 objects:v370 count:16];
  if (!v124) {
    goto LABEL_160;
  }
  id v125 = v124;
  uint64_t v126 = *(void *)v315;
  uint64_t v278 = MIContainerManagerErrorDomain;
  while (2)
  {
    id v127 = 0;
    long long v128 = v71;
    while (2)
    {
      if (*(void *)v315 != v126) {
        objc_enumerationMutation(v284);
      }
      long long v129 = *(void **)(*((void *)&v314 + 1) + 8 * (void)v127);
      long long v130 = [(MIInstallable *)self identity];
      long long v131 = [v130 personaUniqueString];
      id v313 = v128;
      id v114 = [v129 dataContainerForPersona:v131 error:&v313];
      id v71 = v313;

      if (v114)
      {
        id v132 = [v114 parentBundleID];
        if (v132)
        {
          long long v133 = [(MIInstallable *)self bundle];
          long long v134 = [v133 identifier];
          unsigned __int8 v135 = [v132 isEqualToString:v134];

          if ((v135 & 1) == 0)
          {
            v155 = (void *)MIInstallerErrorDomain;
            v156 = [v114 identifier];
            sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2203, v155, 88, 0, &off_1000981B8, @"An app extension with the identifier %@ is already installed as part of the bundle with identifier %@", v157, (uint64_t)v156);
            id v17 = (id)objc_claimAutoreleasedReturnValue();

            id v71 = v132;
LABEL_181:

            goto LABEL_182;
          }
        }
        else if ([v114 status] != (id)3 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
        {
          v259 = (id *)v114;
          MOLogWrite();
        }
      }
      else
      {
        long long v136 = [v71 domain];
        if (![v136 isEqualToString:v278])
        {

LABEL_180:
          sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2211, MIInstallerErrorDomain, 4, v71, 0, @"Failed to look up data container for app extension %@", v138, (uint64_t)v129);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_181;
        }
        id v137 = [v71 code];

        if (v137 != (id)21) {
          goto LABEL_180;
        }
      }

      id v127 = (char *)v127 + 1;
      long long v128 = v71;
      if (v125 != v127) {
        continue;
      }
      break;
    }
    id v125 = [v284 countByEnumeratingWithState:&v314 objects:v370 count:16];
    if (v125) {
      continue;
    }
    break;
  }
LABEL_160:

  id v16 = v282;
  id v312 = v71;
  unsigned int v139 = [(MIInstallableBundle *)self _validateAppManagementDomainForSigningInfo:v282 error:&v312];
  id v17 = v312;

  if (!v139)
  {
LABEL_187:
    a3 = v269;
    id v5 = v270;
    goto LABEL_136;
  }
  if (v280)
  {
    id v140 = [(MIInstallableBundle *)self existingBundleContainer];
    id v141 = [v140 bundle];
    id v142 = v141;
    if (v140)
    {
      if (([v141 isPlaceholder] & 1) != 0
        || [v270 installTargetType] == (id)3)
      {
        [v282 entitlements:v259];
        id v285 = (id)objc_claimAutoreleasedReturnValue();
        v281 = [v142 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0];
        id v143 = [v281 entitlements];
        objc_super v144 = v143;
        if (v143)
        {
          if (sub_10004C73C(v143) && [v270 installTargetType] == (id)3)
          {
            id v145 = (void *)MIInstallerErrorDomain;
            v146 = [v142 displayName];
            uint64_t v148 = sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2303, v145, 172, 0, 0, @"Offloading is not allowed for the marketplace \"%@\".", v147, (uint64_t)v146);
            goto LABEL_265;
          }
          if (v285)
          {
            v196 = sub_10004CBB0(v144);
            v197 = sub_10004CBB0(v285);
            v198 = v197;
            if (v196)
            {
              if (v197)
              {
                if ([v197 isEqualToString:v196])
                {
                  id v199 = v17;
                  goto LABEL_259;
                }
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
                {
                  v220 = [(MIInstallable *)self bundle];
                  v221 = [v220 identifier];
                  id v262 = v198;
                  v264 = v196;
                  v260 = v221;
LABEL_255:
                  MOLogWrite();
                }
              }
              else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
              {
                v220 = [(MIInstallable *)self bundle];
                v221 = [v220 identifier];
                v260 = v221;
                goto LABEL_255;
              }
LABEL_256:

              goto LABEL_257;
            }
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
            {
              v200 = [(MIInstallable *)self bundle];
              v201 = [v200 identifier];
LABEL_236:
              MOLogWrite();
            }
            goto LABEL_260;
          }
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
          {
            v196 = [(MIInstallable *)self bundle];
            v198 = [v196 identifier];
            v260 = v198;
            MOLogWrite();
            goto LABEL_256;
          }
LABEL_257:
          v222 = [(MIInstallable *)self bundle];
          v223 = [v222 bundleURL];
          id v311 = v17;
          unsigned __int8 v224 = sub_10004C7B0(v223, v144, (uint64_t)&v311);
          id v199 = v311;

          if (v224)
          {
            v196 = [(MIInstallable *)self bundle];
            [v196 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0];
            v282 = v198 = v282;
LABEL_259:

            id v310 = v199;
            unsigned __int8 v225 = [(MIInstallableBundle *)self _validateApplicationIdentifierForNewBundleSigningInfo:v282 error:&v310];
            id v17 = v310;

            if (v225) {
              goto LABEL_260;
            }
          }
          else
          {
            v226 = (void *)MIInstallerErrorDomain;
            v146 = [(MIInstallable *)self bundle];
            id v17 = [v146 identifier];
            uint64_t v148 = sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2328, v226, 4, v199, 0, @"%@: Unable to write placeholder entitlements into downgrade placeholder: %@", v227, (uint64_t)v17);

LABEL_265:
            id v17 = (id)v148;
          }

LABEL_61:
          a3 = v269;
          id v5 = v270;
LABEL_135:
          id v16 = v282;
LABEL_136:
          if (a3)
          {
            id v17 = v17;
            BOOL v122 = 0;
            *a3 = v17;
            goto LABEL_139;
          }
LABEL_138:
          BOOL v122 = 0;
          goto LABEL_139;
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          v196 = [(MIInstallable *)self bundle];
          v198 = [v196 identifier];
          v200 = [v142 bundleURL];
          v201 = [v200 path];
          goto LABEL_236;
        }
LABEL_260:

LABEL_261:
LABEL_262:

        goto LABEL_263;
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
        goto LABEL_262;
      }
    }
    else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7)
    {
      goto LABEL_262;
    }
    id v285 = [(MIInstallable *)self bundle];
    v281 = [v285 identifier];
    MOLogWrite();
    goto LABEL_261;
  }
  id v309 = v17;
  unsigned int v166 = [(MIInstallableBundle *)self _validateApplicationIdentifierForNewBundleSigningInfo:v282 error:&v309];
  id v167 = v309;

  if (!v166)
  {
    id v17 = v167;
    goto LABEL_187;
  }
  v168 = [v282 entitlements];
  id v308 = v167;
  unsigned __int8 v169 = [(MIInstallableBundle *)self _performWatchVerificationForSigningInfo:v282 isSystemAppInstall:v279 withError:&v308];
  id v17 = v308;

  if ((v169 & 1) == 0)
  {

    goto LABEL_61;
  }
  char v307 = 0;
  id v306 = v17;
  id v284 = v168;
  unsigned int v170 = [(MIInstallableBundle *)self _performAppClipSpecificValidationForEntitlements:v168 isAppClip:&v307 withError:&v306];
  id v171 = v306;

  if (!v170) {
    goto LABEL_304;
  }
  if (v307)
  {
    v172 = sub_10004CBB0(v284);
    v173 = +[MIFileManager defaultManager];
    v174 = [(MIInstallable *)self bundle];
    v175 = [v174 bundleURL];
    id v305 = v171;
    unsigned __int8 v176 = [v173 setAppClipAppIdentifier:v172 insecurelyCachedOnBundle:v175 error:&v305];
    id v177 = v305;

    if ((v176 & 1) == 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        v178 = [(MIInstallable *)self bundle];
        v259 = [v178 bundleURL];
        id v262 = v177;
        MOLogWrite();
      }
      id v177 = 0;
    }

    id v171 = v177;
  }
  v179 = v171;
  id v304 = v171;
  unsigned int v180 = -[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:](self, "_performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:", v282, &v304, v259, v262);
  id v171 = v304;

  if (!v180) {
    goto LABEL_304;
  }
  if (sub_10004C73C(v284))
  {
    v181 = [(MIInstallable *)self bundle];
    unsigned int v182 = [v181 isLaunchProhibited];

    if (v182)
    {
      v183 = (void *)MIInstallerErrorDomain;
      v184 = [(MIInstallable *)self bundle];
      v185 = [v184 displayName];
      sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", 2395, v183, 209, 0, 0, @"The marketplace \"%@\" has the key \"%@\" = TRUE in its Info.plist. This is not allowed.", v186, (uint64_t)v185);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      id v171 = v184;
      goto LABEL_302;
    }
  }
  v207 = +[MIDaemonConfiguration sharedInstance];
  if (([v207 codeSigningEnforcementIsDisabled] & 1) != 0
    || ([(MIInstallableBundle *)self upgradingBuiltInAppAtURL],
        (uint64_t v208 = objc_claimAutoreleasedReturnValue()) == 0))
  {
  }
  else
  {
    v209 = (void *)v208;
    unsigned __int8 v210 = sub_10004C670(v284);

    if ((v210 & 1) == 0)
    {
      v211 = +[MIDaemonConfiguration sharedInstance];
      unsigned int v212 = [v211 hasInternalContent];

      v214 = (void *)MIInstallerErrorDomain;
      if (v212)
      {
        v215 = &off_1000981E0;
        v216 = @"System app upgrade is missing upgrade entitlement (disable code signing enforcement via boot-args to avoid this).";
        uint64_t v217 = 2401;
      }
      else
      {
        v215 = &off_100098208;
        v216 = @"System app upgrade is missing upgrade entitlement.";
        uint64_t v217 = 2403;
      }
      uint64_t v257 = 16;
      goto LABEL_301;
    }
  }
  if (v279 && (sub_10004C71C(v284) & 1) == 0)
  {
    v214 = (void *)MIInstallerErrorDomain;
    v215 = &off_100098230;
    v216 = @"System app install missing system app entitlement";
    uint64_t v217 = 2410;
    goto LABEL_298;
  }
  v218 = [(MIInstallable *)self bundle];
  if ([v218 isRemovableSystemApp])
  {
    unsigned __int8 v219 = sub_10004C71C(v284);

    if ((v219 & 1) == 0)
    {
      v214 = (void *)MIInstallerErrorDomain;
      v215 = &off_100098258;
      v216 = @"Install of known system app missing system app entitlement";
      uint64_t v217 = 2416;
LABEL_298:
      uint64_t v257 = 127;
LABEL_301:
      sub_100014A08((uint64_t)"-[MIInstallableBundle performVerificationWithError:]", v217, v214, v257, 0, v215, v216, v213, v261);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_302:

LABEL_303:
      id v171 = v17;
LABEL_304:

      id v17 = v171;
      goto LABEL_61;
    }
  }
  else
  {
  }
  id v303 = v171;
  unsigned int v228 = [(MIInstallableBundle *)self _performBuiltInAppUpgradeValidationWithSigningInfo:v282 error:&v303];
  id v229 = v303;

  if (!v228)
  {
    id v171 = v229;
    goto LABEL_304;
  }
  v230 = [(MIInstallable *)self bundle];
  id v231 = [v230 executableURL];
  [v231 fileSystemRepresentation];
  id v302 = v229;
  int v232 = MIMachOFileMatchesMyArchitecture();
  id v17 = v229;

  if (!v232) {
    goto LABEL_303;
  }
  long long v300 = 0u;
  long long v301 = 0u;
  long long v298 = 0u;
  long long v299 = 0u;
  id v171 = [(MIInstallableBundle *)self appExtensionBundles];
  id v233 = [v171 countByEnumeratingWithState:&v298 objects:v369 count:16];
  if (v233)
  {
    id v234 = v233;
    uint64_t v235 = *(void *)v299;
    do
    {
      v236 = 0;
      v237 = v17;
      do
      {
        if (*(void *)v299 != v235) {
          objc_enumerationMutation(v171);
        }
        id v238 = [*(id *)(*((void *)&v298 + 1) + 8 * (void)v236) executableURL];
        [v238 fileSystemRepresentation];
        v297 = v237;
        int v239 = MIMachOFileMatchesMyArchitecture();
        id v17 = v237;

        if (!v239) {
          goto LABEL_302;
        }
        v236 = (char *)v236 + 1;
        v237 = v17;
      }
      while (v234 != v236);
      id v234 = [v171 countByEnumeratingWithState:&v298 objects:v369 count:16];
    }
    while (v234);
  }

  long long v295 = 0u;
  long long v296 = 0u;
  long long v293 = 0u;
  long long v294 = 0u;
  id v171 = [(MIInstallableBundle *)self xpcServiceBundles];
  id v240 = [v171 countByEnumeratingWithState:&v293 objects:v368 count:16];
  if (v240)
  {
    id v241 = v240;
    uint64_t v242 = *(void *)v294;
    do
    {
      v243 = 0;
      v244 = v17;
      do
      {
        if (*(void *)v294 != v242) {
          objc_enumerationMutation(v171);
        }
        id v245 = [*(id *)(*((void *)&v293 + 1) + 8 * (void)v243) executableURL];
        [v245 fileSystemRepresentation];
        v292 = v244;
        int v246 = MIMachOFileMatchesMyArchitecture();
        id v17 = v244;

        if (!v246) {
          goto LABEL_302;
        }
        v243 = (char *)v243 + 1;
        v244 = v17;
      }
      while (v241 != v243);
      id v241 = [v171 countByEnumeratingWithState:&v293 objects:v368 count:16];
    }
    while (v241);
  }

  long long v290 = 0u;
  long long v291 = 0u;
  long long v288 = 0u;
  long long v289 = 0u;
  v247 = [(MIInstallableBundle *)self driverKitExtensionBundles];
  id v248 = [v247 countByEnumeratingWithState:&v288 objects:v367 count:16];
  if (!v248) {
    goto LABEL_295;
  }
  id v249 = v248;
  uint64_t v250 = *(void *)v289;
  while (2)
  {
    uint64_t v251 = 0;
    while (2)
    {
      if (*(void *)v289 != v250) {
        objc_enumerationMutation(v247);
      }
      v252 = *(void **)(*((void *)&v288 + 1) + 8 * v251);
      id v253 = [v252 executableURL];
      [v253 fileSystemRepresentation];

      id v287 = v17;
      int v254 = MIMachOFileMatchesMyArchitecture();
      id v255 = v287;

      if (!v254)
      {
        id v17 = v255;
LABEL_309:

        goto LABEL_183;
      }
      id v286 = v255;
      unsigned __int8 v256 = [v252 onlyHasExecutableSlicesForPlatform:10 error:&v286];
      id v17 = v286;

      if ((v256 & 1) == 0)
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
          MOLogWrite();
        }
        goto LABEL_309;
      }
      if (v249 != (id)++v251) {
        continue;
      }
      break;
    }
    id v249 = [v247 countByEnumeratingWithState:&v288 objects:v367 count:16];
    if (v249) {
      continue;
    }
    break;
  }
LABEL_295:

LABEL_263:
  BOOL v122 = 1;
  id v5 = v270;
  id v16 = v282;
LABEL_139:

  return v122;
}

- (BOOL)_writeData:(id)a3 toFile:(id)a4 inContainerAtURL:(id)a5 legacyErrorString:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  char v13 = [a5 URLByAppendingPathComponent:a4 isDirectory:0];
  id v23 = 0;
  unsigned int v14 = [v11 writeToURL:v13 options:268435457 error:&v23];
  id v15 = v23;
  if (v14)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
    {
      [v11 length];
      id v22 = [v13 path];
      MOLogWrite();
    }
  }
  else
  {
    id v16 = (void *)MIInstallerErrorDomain;
    CFStringRef v24 = @"LegacyErrorString";
    id v25 = v12;
    id v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v18 = [v13 path];
    unsigned int v20 = sub_100014A08((uint64_t)"-[MIInstallableBundle _writeData:toFile:inContainerAtURL:legacyErrorString:error:]", 2489, v16, 24, v15, v17, @"Failed to write data to %@", v19, (uint64_t)v18);

    if (a7)
    {
      id v15 = v20;
      *a7 = v15;
    }
    else
    {
      id v15 = v20;
    }
  }

  return v14;
}

- (BOOL)_writeOptionsDataToBundle:(id)a3 orContainer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = [v9 containerURL];
  id v10 = [(MIInstallable *)self installOptions];
  uint64_t v32 = [v10 iTunesMetadata];
  id v11 = [v10 iTunesMetadata];
  id v12 = [v11 distributorInfo];

  uint64_t v13 = [v10 sinfData];
  if (v13)
  {
    unsigned int v14 = (void *)v13;
    id v15 = [v12 distributorID];
    if (v15 && ![v12 distributorIsFirstPartyApple])
    {
      unsigned int v23 = [v10 sinfDataType];

      if (v23 != 1)
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          CFStringRef v24 = [(MIInstallable *)self bundle];
          uint64_t v31 = [v24 identifier];
          MOLogWrite();
        }
        [v10 setSinfDataType:1, v31];
      }
    }
    else
    {
    }
  }
  id v39 = 0;
  unsigned int v16 = [v8 setSinfDataType:[v10 sinfDataType] withError:&v39];
  id v17 = v39;
  if (!v16)
  {
    id v18 = 0;
LABEL_10:
    id v20 = v17;
    goto LABEL_11;
  }
  id v18 = [v10 sinfData];
  if (v18)
  {
    id v38 = v17;
    unsigned __int8 v19 = [v8 updateSinfWithData:v18 error:&v38];
    id v20 = v38;

    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    id v37 = v17;
    unsigned int v25 = [v8 replicateRootSinfWithError:&v37];
    id v20 = v37;

    if (!v25)
    {
      id v18 = 0;
      goto LABEL_11;
    }
  }
  unsigned __int8 v26 = [v10 geoJSONData];

  if (v26)
  {
    id v36 = v20;
    unsigned int v27 = [(MIInstallableBundle *)self _writeData:v26 toFile:@"GeoJSON" inContainerAtURL:v33 legacyErrorString:@"GeoJSONCaptureFailed" error:&v36];
    id v17 = v36;

    if (!v27)
    {
      id v18 = v26;
      goto LABEL_10;
    }
  }
  else
  {
    id v17 = v20;
  }
  id v18 = [v10 iTunesArtworkData];

  if (v18)
  {
    id v35 = v17;
    unsigned int v28 = [(MIInstallableBundle *)self _writeData:v18 toFile:@"iTunesArtwork" inContainerAtURL:v33 legacyErrorString:@"iTunesArtworkCaptureFailed" error:&v35];
    id v20 = v35;

    if (!v28) {
      goto LABEL_11;
    }
  }
  else
  {
    id v20 = v17;
  }
  if (!v32)
  {
    BOOL v21 = 1;
    goto LABEL_14;
  }
  id v34 = v20;
  unsigned __int8 v29 = [v9 writeiTunesMetadata:v32 error:&v34];
  id v30 = v34;

  if (v29)
  {
    BOOL v21 = 1;
    id v20 = v30;
    goto LABEL_14;
  }
  id v20 = v30;
LABEL_11:
  if (a5)
  {
    id v20 = v20;
    BOOL v21 = 0;
    *a5 = v20;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_14:

  return v21;
}

- (BOOL)_captureDataFromStagingRootOrBundle:(id)a3 toContainer:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MIInstallable *)self installOptions];
  id v11 = [v10 iTunesMetadata];

  id v12 = [(MIInstallable *)self stagingRootURL];
  unsigned int v13 = [v9 captureStoreDataFromDirectory:v12 doCopy:1 failureIsFatal:1 includeiTunesMetadata:v11 == 0 withError:a5];

  BOOL v14 = v13
     && ([(MIInstallable *)self packageFormat] != 2
      || [v9 captureStoreDataFromDirectory:v8 doCopy:1 failureIsFatal:1 includeiTunesMetadata:v11 == 0 withError:a5]);

  return v14;
}

- (BOOL)_validateSinfsWithError:(id *)a3
{
  if ([(MIInstallableBundle *)self isPlaceholderInstall])
  {
    id v5 = 0;
    id v6 = 0;
  }
  else
  {
    id v7 = objc_opt_new();
    id v8 = [(MIInstallable *)self bundle];
    [v7 addObject:v8];

    id v9 = [(MIInstallableBundle *)self frameworkBundles];
    [v7 addObjectsFromArray:v9];

    id v10 = [(MIInstallableBundle *)self appExtensionBundles];
    [v7 addObjectsFromArray:v10];

    id v11 = [(MIInstallableBundle *)self driverKitExtensionBundles];
    [v7 addObjectsFromArray:v11];

    id v12 = [(MIInstallableBundle *)self xpcServiceBundles];

    if (v12)
    {
      unsigned int v13 = [(MIInstallableBundle *)self xpcServiceBundles];
      [v7 addObjectsFromArray:v13];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v7;
    id v14 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      id v6 = 0;
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        id v17 = 0;
        id v18 = v6;
        do
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v5);
          }
          unsigned __int8 v19 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v17);
          id v23 = v18;
          unsigned int v20 = [v19 validateSinfWithError:&v23];
          id v6 = v23;

          if (!v20)
          {

            if (a3)
            {
              id v6 = v6;
              BOOL v21 = 0;
              *a3 = v6;
            }
            else
            {
              BOOL v21 = 0;
            }
            goto LABEL_19;
          }
          id v17 = (char *)v17 + 1;
          id v18 = v6;
        }
        while (v15 != v17);
        id v15 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  BOOL v21 = 1;
LABEL_19:

  return v21;
}

+ (BOOL)_shouldSkipEligibilityChecksForAppWithSigningInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 codeSignerType];
  char v16 = 0;
  id v5 = +[MITestManager sharedInstance];
  id v6 = v5;
  if (v4 == (id)3)
  {
    if ([v3 profileValidationType] == (id)4)
    {
      id v9 = [v3 entitlements];
      unsigned __int8 v10 = sub_10004CC98(v9);

      if ((v10 & 1) == 0)
      {
        id v11 = +[MIDaemonConfiguration sharedInstance];
        unsigned int v12 = [v11 requireEligibilityChecksForAppsInDevelopment];

        if (!v12)
        {
LABEL_19:
          BOOL v7 = 1;
          goto LABEL_18;
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          id v15 = [v3 codeInfoIdentifier];
          MOLogWrite();
        }
      }
    }
    goto LABEL_17;
  }
  BOOL v7 = 0;
  if (v4 == (id)1)
  {
    if ([v5 isRunningInTestMode:&v16 outError:0]) {
      BOOL v8 = v16 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8 && [v6 testFlagsAreSet:256])
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        id v14 = [v3 codeInfoIdentifier];
        MOLogWrite();
      }
      goto LABEL_19;
    }
LABEL_17:
    BOOL v7 = 0;
  }
LABEL_18:

  return v7;
}

+ (BOOL)_shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:(id)a3 persona:(id)a4
{
  id v6 = a3;
  id v19 = 0;
  BOOL v7 = +[MIBundleContainer containerWithIdentifier:v6 forPersona:a4 ofContentClass:1 createIfNeeded:0 created:0 error:&v19];
  id v8 = v19;
  id v9 = v8;
  if (!v7)
  {
    id v15 = [v8 domain];
    if ([v15 isEqualToString:MIContainerManagerErrorDomain])
    {
      id v16 = [v9 code];

      if (v16 == (id)21)
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_17;
    }
LABEL_16:
    MOLogWrite();
LABEL_17:
    unsigned __int8 v14 = 0;
    id v11 = 0;
    goto LABEL_23;
  }
  unsigned __int8 v10 = [v7 bundle];
  if (!v10)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  id v11 = v10;
  id v18 = v9;
  unsigned int v12 = [v10 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v18];
  id v13 = v18;

  if (v12)
  {
    unsigned __int8 v14 = [a1 _shouldSkipEligibilityChecksForAppWithSigningInfo:v12];
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    unsigned __int8 v14 = 0;
  }
  id v9 = v13;
LABEL_23:

  return v14;
}

+ (BOOL)_shouldSkipEligibilityChecksForInstallRequestorWithAuditToken:(id *)a3 persona:(id)a4 authorizingBundleID:(id *)a5
{
  id v8 = a4;
  long long v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v18.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v18.val[4] = v9;
  id v17 = 0;
  long long v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v10;
  id v11 = +[MICodeSigningInfo signingIdentifierForAuditToken:&atoken error:&v17];
  id v12 = v17;
  if (v11)
  {
    LOBYTE(atoken.val[0]) = 0;
    id v13 = +[MITestManager sharedInstance];
    if ([v11 isEqualToString:@"com.apple.mi-test-runner"]
      && [v13 isRunningInTestMode:&atoken outError:0]
      && LOBYTE(atoken.val[0])
      && [v13 testFlagsAreSet:512])
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
        MOLogWrite();
      }
      unsigned int v14 = 1;
    }
    else
    {
      unsigned int v14 = [a1 _shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:v11 persona:v8];
    }
    if (a5 && v14) {
      *a5 = v11;
    }
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      audit_token_t atoken = v18;
      audit_token_to_pid(&atoken);
      MOLogWrite();
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (unint64_t)_domainForBrowserEligibilityForApp:(id)a3 withSigningInfo:(id)a4 distributorInfo:(id)a5 isWebDistribution:(BOOL)a6 operationType:(unint64_t)a7
{
  id v9 = a4;
  long long v10 = [a3 identifier];
  id v11 = [v9 entitlements];

  if (sub_10004D278(v11))
  {
    switch(a7)
    {
      case 2uLL:
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
          goto LABEL_24;
        }
        break;
      case 1uLL:
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
        {
LABEL_24:
          unint64_t v12 = 4;
          goto LABEL_32;
        }
        break;
      case 0uLL:
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
          MOLogWrite();
        }
        unint64_t v12 = 7;
        goto LABEL_32;
      default:
LABEL_17:
        unint64_t v12 = 0;
        goto LABEL_32;
    }
    MOLogWrite();
    goto LABEL_24;
  }
  if (!sub_10004D288(v11)) {
    goto LABEL_17;
  }
  if (a7 == 2)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
      goto LABEL_31;
    }
LABEL_30:
    MOLogWrite();
LABEL_31:
    unint64_t v12 = 6;
    goto LABEL_32;
  }
  if (a7 == 1)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (a7) {
    goto LABEL_17;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    MOLogWrite();
  }
  unint64_t v12 = 23;
LABEL_32:

  return v12;
}

+ (unint64_t)_domainForMarketplaceEligibilityForApp:(id)a3 withSigningInfo:(id)a4 isWebDistribution:(BOOL)a5 distributorInfo:(id)a6 operationType:(unint64_t)a7
{
  BOOL v8 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = [a3 identifier];
  unsigned int v14 = [v12 entitlements];

  unsigned int v15 = sub_10004C73C(v14);
  unsigned int v16 = [v11 distributorIsThirdParty];
  if ((v15 & 1) == 0 && !v16) {
    goto LABEL_3;
  }
  if ((!v8 | v15))
  {
    if (v15)
    {
      audit_token_t v18 = @"marketplace";
    }
    else
    {
      id v19 = [v11 distributorID];
      audit_token_t v18 = +[NSString stringWithFormat:@"app distributed by marketplace \"%@\",", v19];
    }
    if (a7 == 2)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
        goto LABEL_35;
      }
    }
    else
    {
      if (a7 != 1)
      {
        if (a7)
        {
          unint64_t v17 = 0;
        }
        else
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
            MOLogWrite();
          }
          unint64_t v17 = 2;
        }
        goto LABEL_37;
      }
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
      {
LABEL_35:
        unint64_t v17 = 3;
LABEL_37:

        goto LABEL_38;
      }
    }
    MOLogWrite();
    goto LABEL_35;
  }
  if (a7 == 2)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
      goto LABEL_28;
    }
LABEL_27:
    MOLogWrite();
LABEL_28:
    unint64_t v17 = 20;
    goto LABEL_38;
  }
  if (a7 == 1)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (a7)
  {
LABEL_3:
    unint64_t v17 = 0;
    goto LABEL_38;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    MOLogWrite();
  }
  unint64_t v17 = 19;
LABEL_38:

  return v17;
}

+ (BOOL)_getEligibilityForDomain:(unint64_t)a3 forBundle:(id)a4 isEligible:(BOOL *)a5 ineligibilityReason:(id *)a6 error:(id *)a7
{
  uint64_t v44 = 0;
  id v42 = 0;
  uint64_t v43 = 0;
  id v41 = 0;
  id v11 = [a4 identifier];
  id v12 = +[MIEligibilityManager sharedInstance];
  id v40 = 0;
  unsigned int v13 = [v12 getEligibilityForDomain:a3 answer:&v44 source:&v43 status:&v42 context:&v41 error:&v40];
  id v14 = v40;

  if (!v13)
  {
    unint64_t v17 = sub_100014A08((uint64_t)"+[MIInstallableBundle _getEligibilityForDomain:forBundle:isEligible:ineligibilityReason:error:]", 2861, MIInstallerErrorDomain, 4, v14, 0, @"Failed to get eligibility for domain %llu for %@", v15, a3);

    if (a7)
    {
      id v14 = v17;
      unsigned int v16 = 0;
      *a7 = v14;
    }
    else
    {
      unsigned int v16 = 0;
      id v14 = v17;
    }
    goto LABEL_31;
  }
  if (v44 != 4)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    uint64_t v18 = v43;
    id v19 = v42;
    unsigned int v20 = v19;
    if (v18 != 1)
    {
      if (v18 == 2)
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
          goto LABEL_26;
        }
      }
      else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
      {
        goto LABEL_26;
      }
LABEL_25:
      MOLogWrite();
LABEL_26:
      long long v24 = 0;
      BOOL v21 = 0;
      goto LABEL_27;
    }
    if (!v19)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    BOOL v21 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (!v21
      || ((objc_opt_class(), id v22 = v21, (objc_opt_isKindOfClass() & 1) == 0)
        ? (id v23 = 0)
        : (id v23 = v22),
          v22,
          v23,
          !v23))
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
      long long v24 = 0;
LABEL_27:

      unsigned int v16 = v24;
      if (!a5) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    long long v26 = [v22 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"];
    objc_opt_class();
    id v27 = v26;
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    id v39 = [v28 unsignedLongLongValue];
    unsigned __int8 v29 = [v22 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"];
    objc_opt_class();
    id v30 = v29;
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }

    id v38 = [v31 unsignedLongLongValue];
    uint64_t v32 = [v22 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"];
    objc_opt_class();
    id v33 = v32;
    if (objc_opt_isKindOfClass()) {
      id v34 = v33;
    }
    else {
      id v34 = 0;
    }

    id v35 = [v34 unsignedLongLongValue];
    if (v39 == (id)3)
    {
      if (v38 != (id)3 && v35 != (id)3)
      {
        CFStringRef v36 = @"This device is not eligible based on the country or region it is located in and the country or region of the Apple ID signed in.";
        CFStringRef v37 = @"This device is not eligible based on the country or region it is located in and without an Apple ID signed in.";
LABEL_51:
        if (v35 == (id)7) {
          long long v24 = (__CFString *)v37;
        }
        else {
          long long v24 = (__CFString *)v36;
        }
        goto LABEL_55;
      }
      if (v38 == (id)3)
      {
        if (v35 == (id)3)
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
            MOLogWrite();
          }
          long long v24 = 0;
          goto LABEL_55;
        }
        CFStringRef v36 = @"This device is not eligible based on the country or region of the Apple ID signed in.";
        CFStringRef v37 = @"This device is not eligible without an Apple ID signed in.";
        goto LABEL_51;
      }
      long long v24 = @"This device is not eligible based on the country or region it is located in.";
    }
    else
    {
      long long v24 = @"This device type is not eligible.";
    }
LABEL_55:
    BOOL v21 = v22;
    goto LABEL_27;
  }
  unsigned int v16 = 0;
  if (a5) {
LABEL_28:
  }
    *a5 = v44 == 4;
LABEL_29:
  if (a6)
  {
    unsigned int v16 = v16;
    *a6 = v16;
  }
LABEL_31:

  return v13;
}

- (BOOL)_checkEligibilityForAppWithSigningInfo:(id)a3 distributorInfo:(id)a4 isWebDistribution:(BOOL)a5 withError:(id *)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = [(MIInstallable *)self bundle];
  uint64_t v61 = [v11 displayName];
  unint64_t v12 = [(MIInstallableBundle *)self eligibilityOperationType];
  id v62 = [v11 identifier];
  unsigned int v13 = objc_opt_class();
  id v14 = [(MIInstallable *)self installOptions];
  uint64_t v15 = (audit_token_t *)[v14 installationRequestorAuditToken];

  unint64_t v16 = (unint64_t)[v13 _domainForBrowserEligibilityForApp:v11 withSigningInfo:v9 distributorInfo:v10 isWebDistribution:v6 operationType:v12];
  unint64_t v17 = (unint64_t)[v13 _domainForMarketplaceEligibilityForApp:v11 withSigningInfo:v9 isWebDistribution:v6 distributorInfo:v10 operationType:v12];
  if (!(v16 | v17))
  {
    uint64_t v18 = 0;
    id v19 = 0;
LABEL_3:
    BOOL v20 = 1;
LABEL_4:
    BOOL v21 = (void *)v61;
    goto LABEL_5;
  }
  unint64_t v23 = v17;
  long long v59 = v10;
  if (v6 && v15)
  {
    id v58 = v9;
    audit_token_t v71 = *v15;
    id v69 = 0;
    id v70 = 0;
    audit_token_t atoken = v71;
    unsigned __int8 v24 = +[MICodeSigningInfo getValue:&v70 forEntitlement:@"com.apple.developer.browser.app-installation" fromProcessWithAuditToken:&atoken error:&v69];
    id v25 = v70;
    uint64_t v18 = (__CFString *)v69;
    if ((v24 & 1) == 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        CFStringRef v53 = @"com.apple.developer.browser.app-installation";
        CFStringRef v54 = v18;
        MOLogWrite();
      }

      id v19 = 0;
      unsigned int v28 = 0;
      uint64_t v18 = 0;
      id v10 = v59;
      goto LABEL_37;
    }
    if (v25)
    {
      id v10 = v59;
      if (objc_opt_respondsToSelector())
      {
        id v57 = v25;
        if ([v25 BOOLValue])
        {
          long long v26 = [(MIInstallable *)self identity];
          id v27 = [v26 personaUniqueString];

          id v10 = v59;
          id v67 = 0;
          unsigned int v28 = [v13 _shouldSkipEligibilityChecksForInstallRequestorWithAuditToken:v15 persona:v27 authorizingBundleID:&v67];
          id v19 = (__CFString *)v67;
        }
        else
        {
          id v19 = 0;
          unsigned int v28 = 0;
        }
        id v25 = v57;
        goto LABEL_37;
      }
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
      {
LABEL_30:
        id v19 = 0;
        unsigned int v28 = 0;
LABEL_37:

        id v9 = v58;
        goto LABEL_38;
      }
    }
    else
    {
      id v10 = v59;
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_30;
      }
    }
    audit_token_t atoken = v71;
    CFStringRef v53 = (const __CFString *)audit_token_to_pid(&atoken);
    CFStringRef v54 = @"com.apple.developer.browser.app-installation";
    MOLogWrite();
    goto LABEL_30;
  }
  if ([v13 _shouldSkipEligibilityChecksForAppWithSigningInfo:v9])
  {
    id v19 = 0;
    uint64_t v18 = 0;
    unsigned int v28 = 1;
  }
  else
  {
    if (![v10 distributorIsThirdParty])
    {
      if (!v16)
      {
        uint64_t v18 = 0;
        if (!v23)
        {
          BOOL v20 = 1;
          id v19 = 0;
          goto LABEL_4;
        }
        id v19 = 0;
        goto LABEL_67;
      }
      id v19 = 0;
      uint64_t v18 = 0;
      goto LABEL_48;
    }
    unsigned __int8 v29 = [v10 distributorID];
    id v30 = [(MIInstallable *)self identity];
    id v31 = [v30 personaUniqueString];
    unsigned int v28 = [v13 _shouldSkipEligibilityChecksForAuthorizingAppWithBundleID:v29 persona:v31];

    if (v28) {
      id v19 = v29;
    }
    else {
      id v19 = 0;
    }

    uint64_t v18 = 0;
    id v10 = v59;
  }
LABEL_38:
  if (!v16) {
    goto LABEL_61;
  }
  if (!v28)
  {
LABEL_48:
    id v33 = v18;
    LOBYTE(v71.val[0]) = 0;
    id v65 = v18;
    id v66 = 0;
    unsigned int v34 = [v13 _getEligibilityForDomain:v16 forBundle:v11 isEligible:&v71 ineligibilityReason:&v66 error:v53];
    id v35 = (__CFString *)v66;
    uint64_t v18 = v65;

    if (!v34) {
      goto LABEL_70;
    }
    id v10 = v59;
    if (!LOBYTE(v71.val[0]))
    {
      BOOL v21 = (void *)v61;
      if (v35)
      {
        uint64_t v41 = +[NSString stringWithFormat:@" %@", v35];

        id v35 = (__CFString *)v41;
      }
      else
      {
        id v35 = &stru_10008EEE8;
      }
      id v40 = a6;
      uint64_t v43 = "install";
      if (v12 == 1) {
        uint64_t v43 = "update";
      }
      if (v12 == 2) {
        uint64_t v43 = "restore";
      }
      uint64_t v44 = sub_100014A08((uint64_t)"-[MIInstallableBundle _checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:]", 2976, MIInstallerErrorDomain, 208, 0, 0, @"This device is not eligible to %s the browser engine app \"%@\".%@", v36, (uint64_t)v43);

      uint64_t v18 = (__CFString *)v44;
      goto LABEL_72;
    }

    if (!v23) {
      goto LABEL_3;
    }
LABEL_67:
    id v38 = v18;
    LOBYTE(v71.val[0]) = 0;
    id v63 = v18;
    id v64 = 0;
    unsigned int v39 = [v13 _getEligibilityForDomain:v23 forBundle:v11 isEligible:&v71 ineligibilityReason:&v64 error:v53];
    id v35 = (__CFString *)v64;
    uint64_t v18 = v63;

    if (v39)
    {
      BOOL v21 = (void *)v61;
      if (LOBYTE(v71.val[0]))
      {

        BOOL v20 = 1;
        id v10 = v59;
        goto LABEL_5;
      }
      if (v35)
      {
        uint64_t v42 = +[NSString stringWithFormat:@" %@", v35];

        id v35 = (__CFString *)v42;
      }
      else
      {
        id v35 = &stru_10008EEE8;
      }
      id v45 = [v9 entitlements];
      unsigned int v46 = sub_10004C73C(v45);

      BOOL v48 = (void *)MIInstallerErrorDomain;
      id v49 = "install";
      if (v12 == 1) {
        id v49 = "update";
      }
      if (v12 == 2) {
        unsigned __int8 v50 = "restore";
      }
      else {
        unsigned __int8 v50 = v49;
      }
      if (v46)
      {
        uint64_t v51 = sub_100014A08((uint64_t)"-[MIInstallableBundle _checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:]", 3005, MIInstallerErrorDomain, 208, 0, 0, @"This device is not eligible to %s the marketplace \"%@\".%@", v47, (uint64_t)v50);
      }
      else
      {
        uint64_t v56 = [v59 distributorNameForCurrentLocale];
        uint64_t v51 = sub_100014A08((uint64_t)"-[MIInstallableBundle _checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:]", 3007, v48, 208, 0, 0, @"This device is not eligible to %s the app \"%@\" distributed by \"%@\".%@", v52, (uint64_t)v50);

        uint64_t v18 = (__CFString *)v56;
      }

      uint64_t v18 = (__CFString *)v51;
      goto LABEL_71;
    }
LABEL_70:
    BOOL v21 = (void *)v61;
LABEL_71:
    id v40 = a6;
LABEL_72:

    id v10 = v59;
    if (v40)
    {
      uint64_t v18 = v18;
      BOOL v20 = 0;
      id *v40 = v18;
    }
    else
    {
      BOOL v20 = 0;
    }
    goto LABEL_5;
  }
  if (v19)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      uint64_t v32 = "install";
      if (v12 == 1) {
        uint64_t v32 = "update";
      }
      if (v12 == 2) {
        uint64_t v32 = "restore";
      }
      CFStringRef v54 = v19;
      id v55 = v62;
      CFStringRef v53 = (const __CFString *)v32;
      MOLogWrite();
    }
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      CFStringRef v37 = "install";
      if (v12 == 1) {
        CFStringRef v37 = "update";
      }
      if (v12 == 2) {
        CFStringRef v37 = "restore";
      }
      CFStringRef v53 = v62;
      CFStringRef v54 = (const __CFString *)v37;
      MOLogWrite();
    }
    id v19 = 0;
  }
  unsigned int v28 = 1;
LABEL_61:
  if (!v23) {
    goto LABEL_3;
  }
  if (!v28) {
    goto LABEL_67;
  }
  if (v19)
  {
    BOOL v21 = (void *)v61;
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
  }
  else
  {
    BOOL v21 = (void *)v61;
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    id v19 = 0;
  }
  BOOL v20 = 1;
LABEL_5:

  return v20;
}

- (BOOL)_validateiTunesMetadataWithError:(id *)a3
{
  id v4 = [(MIInstallableBundle *)self bundleContainer];
  id v5 = [(MIInstallableBundle *)self existingBundleContainer];
  BOOL v6 = [(MIInstallable *)self bundle];
  uint64_t v7 = [v6 displayName];

  id v61 = 0;
  BOOL v8 = [v4 iTunesMetadataWithError:&v61];
  id v9 = v61;
  id v10 = v9;
  uint64_t v56 = v7;
  if (v8)
  {
    id v11 = v9;
    goto LABEL_3;
  }
  BOOL v21 = [v9 userInfo];
  id v11 = [v21 objectForKeyedSubscript:NSUnderlyingErrorKey];

  id v22 = [v11 domain];
  if (![v22 isEqualToString:NSCocoaErrorDomain])
  {

LABEL_24:
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    CFStringRef v54 = 0;
    id v57 = 0;
    id v27 = 0;
    BOOL v8 = 0;
    id v13 = 0;
    unint64_t v12 = 0;
    goto LABEL_57;
  }
  id v23 = [v11 code];

  if (v23 != (id)260) {
    goto LABEL_24;
  }

  id v11 = 0;
LABEL_3:
  unint64_t v12 = [v8 distributorInfo];
  id v13 = [v12 distributorID];
  id v14 = [v12 distributorType];
  if (v5)
  {
    uint64_t v15 = v4;
    id v60 = v11;
    unint64_t v16 = v5;
    uint64_t v17 = [v5 iTunesMetadataWithError:&v60];
    id v10 = v60;

    CFStringRef v53 = (void *)v17;
    if (v17)
    {
LABEL_5:
      id v5 = v16;
      id v4 = v15;
      uint64_t v18 = [v53 distributorInfo];
      id v19 = [v18 distributorID];
      id v57 = v18;
      id v20 = [v18 distributorType];
      id v11 = v10;
      goto LABEL_10;
    }
    id v49 = v8;
    uint64_t v32 = [v10 userInfo];
    id v11 = [v32 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v33 = [v11 domain];
    if ([v33 isEqualToString:NSCocoaErrorDomain])
    {
      unsigned int v34 = v16;
      id v35 = [v11 code];

      BOOL v36 = v35 == (id)260;
      unint64_t v16 = v34;
      if (v36)
      {

        id v10 = 0;
        BOOL v8 = v49;
        goto LABEL_5;
      }
    }
    else
    {
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
    {
      CFStringRef v54 = 0;
      id v57 = 0;
      id v27 = 0;
      BOOL v8 = v49;
      id v5 = v16;
    }
    else
    {
      id v5 = v16;
      MOLogWrite();
      CFStringRef v54 = 0;
      id v57 = 0;
      id v27 = 0;
      BOOL v8 = v49;
    }
    id v4 = v15;
    goto LABEL_57;
  }
  id v19 = 0;
  id v20 = 0;
  id v57 = 0;
  CFStringRef v53 = 0;
LABEL_10:
  CFStringRef v54 = v19;
  if (v13 && !v19) {
    goto LABEL_12;
  }
  if (!v13 && v19)
  {
    id v52 = v20;
    id v24 = [v57 copy];

    id v13 = v19;
    if (!v8) {
      BOOL v8 = objc_opt_new();
    }
    [v8 setDistributorInfo:v24];
    id v59 = v11;
    unsigned __int8 v26 = [v4 writeiTunesMetadata:v8 error:&v59];
    id v10 = v59;

    if ((v26 & 1) == 0)
    {
      CFStringRef v54 = v13;
      id v27 = v53;
      goto LABEL_58;
    }
    goto LABEL_13;
  }
  if (!v13
    || !v19
    || (id v37 = v20, ([v13 isEqualToString:v19] & 1) != 0)
    || v14 == (id)2
    || v37 == (id)2)
  {
LABEL_12:
    id v52 = v14;
    id v24 = v12;
    id v10 = v11;
LABEL_13:
    if ([(MIInstallableBundle *)self isPlaceholderInstall])
    {
      id v25 = (void *)v56;
LABEL_48:
      [(MIInstallable *)self setInstalledDistributorID:v13];
      BOOL v46 = 1;
      id v27 = v53;
      goto LABEL_61;
    }
    unsigned int v28 = [(MIInstallable *)self bundle];
    id v11 = [v28 identifier];

    unsigned __int8 v29 = [(MIInstallableBundle *)self bundleSigningInfo];
    unsigned __int8 v50 = v5;
    uint64_t v51 = v4;
    id v30 = v8;
    if (v13) {
      id v31 = [v11 isEqualToString:v13];
    }
    else {
      id v31 = 0;
    }
    uint64_t v41 = [v29 entitlements];
    unsigned int v42 = sub_10004C73C(v41);

    if (!v13 || !v42 || (v31 & 1) != 0 || v52 == (id)2)
    {
      id v58 = v10;
      unsigned __int8 v45 = [(MIInstallableBundle *)self _checkEligibilityForAppWithSigningInfo:v29 distributorInfo:v24 isWebDistribution:v31 withError:&v58];
      id v44 = v58;

      if (v45)
      {

        id v10 = v44;
        id v5 = v50;
        id v4 = v51;
        id v25 = (void *)v56;
        BOOL v8 = v30;
        goto LABEL_48;
      }
    }
    else
    {
      sub_100014A08((uint64_t)"-[MIInstallableBundle _validateiTunesMetadataWithError:]", 3138, MIInstallerErrorDomain, 211, 0, 0, @"The marketplace \"%@\" may not be installed by the distributor ID \"%@\".", v43, v56);
      id v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v4 = v51;

    unint64_t v12 = v24;
    id v10 = v44;
    id v5 = v50;
    BOOL v8 = v30;
    goto LABEL_50;
  }
  int IsThirdParty = MIDistributorTypeIsThirdParty();
  int v39 = MIDistributorTypeIsThirdParty();
  if (IsThirdParty && v37 == (id)1)
  {
    sub_100014A08((uint64_t)"[(MIInstallableBundle *)"The app being installed _validateiTunesMetadataWithError:is distributed by a third party (distributor ID \"%@\") but its existing installation is distributed by Apple (distributor ID \"%@\"). An app cannot change its distribution source from Apple to a third party once installed. Uninstall this app, then try installing it again.""], v40, v56);
  }
  else
  {
    if (v14 == (id)1) {
      int v48 = v39;
    }
    else {
      int v48 = 0;
    }
    if (v48 == 1)
    {
      sub_100014A08((uint64_t)"[(MIInstallableBundle *)"The app being installed _validateiTunesMetadataWithError:is distributed by Apple (distributor ID \"%@\") but its existing installation is distributed by a third party (distributor ID \"%@\"). An app cannot change its distribution source from a third party to Apple once installed. Uninstall this app, then try installing it again.""], v40, v56);
    }
    else if ((IsThirdParty & v39) == 1)
    {
      sub_100014A08((uint64_t)"[(MIInstallableBundle *)"The app being installed _validateiTunesMetadataWithError:is distributed by \"%@\" but its existing installation is distributed by \"%@\". An app cannot change its third party distribution source once installed. Uninstall this app, then try installing it again.""], v40, v56);
    }
    else
    {
      sub_100014A08((uint64_t)"[(MIInstallableBundle *)"The app being installed _validateiTunesMetadataWithError:is distributed by \"%@\" but its existing installation is distributed by \"%@\". An app cannot change its distribution source once installed, except to/from TestFlight. Uninstall this app, then try installing it again.""], v40, v56);
    }
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:
  id v27 = v53;
LABEL_57:

  id v24 = v12;
LABEL_58:
  id v25 = (void *)v56;
  if (a3)
  {
    id v10 = v10;
    BOOL v46 = 0;
    *a3 = v10;
  }
  else
  {
    BOOL v46 = 0;
  }
LABEL_61:

  return v46;
}

- (BOOL)_setLinkageInBundleMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MIInstallable *)self installOptions];
  id v8 = [v7 linkedParentBundleID];

  id v9 = [(MIInstallableBundle *)self existingBundleContainer];
  id v10 = v9;
  if (v9)
  {
    id v37 = 0;
    id v11 = [v9 bundleMetadataWithError:&v37];
    id v12 = v37;
    if (!v11)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        MOLogWrite();
        if (a4)
        {
LABEL_19:
          id v24 = v12;
          BOOL v26 = 0;
          *a4 = v24;
          goto LABEL_33;
        }
LABEL_16:
        BOOL v26 = 0;
LABEL_32:
        id v24 = v12;
        goto LABEL_33;
      }
LABEL_18:
      if (a4) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    uint64_t v13 = [v11 linkedParentBundleID];
    id v14 = (void *)v13;
    if (v8)
    {
      if (v13)
      {
        if (([v8 isEqualToString:v13] & 1) == 0)
        {
          unsigned int v34 = (void *)MIInstallerErrorDomain;
          uint64_t v15 = [(MIInstallable *)self bundle];
          unint64_t v16 = [v15 identifier];
          uint64_t v18 = sub_100014A08((uint64_t)"-[MIInstallableBundle _setLinkageInBundleMetadata:error:]", 3191, v34, 4, 0, 0, @"Existing installation of %@ is linked to %@, but the client supplied a linked parent bundle ID of %@ for the update. Changing linkage of an already installed app is not supported", v17, (uint64_t)v16);

          id v12 = v15;
          goto LABEL_27;
        }
      }
      else
      {
        id v27 = [v10 bundle];
        unsigned __int8 v28 = [v27 isPlaceholder];

        if ((v28 & 1) == 0)
        {
          uint64_t v18 = sub_100014A08((uint64_t)"-[MIInstallableBundle _setLinkageInBundleMetadata:error:]", 3186, MIInstallerErrorDomain, 4, 0, 0, @"Client specified a linked parent bundle ID for an upgrade to %@ when a parent linkage was not originally specified when the app was installed. Linkage cannot be established by updating an app", v29, (uint64_t)v8);
LABEL_27:

          id v12 = (id)v18;
          if (!a4) {
            goto LABEL_16;
          }
          goto LABEL_19;
        }
      }
    }
    else if (v13)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        uint64_t v32 = @"LinkedParentBundleID";
        id v33 = (id)v13;
        MOLogWrite();
      }
      id v8 = v14;
    }
    else
    {
      id v8 = 0;
    }
    id v30 = [v11 linkedChildBundleIDs:v32, v33];
    [v6 setLinkedChildBundleIDs:v30];

    if (!v8)
    {
LABEL_31:
      BOOL v26 = 1;
      goto LABEL_32;
    }
  }
  else
  {
    id v12 = 0;
    if (!v8) {
      goto LABEL_31;
    }
  }
  id v35 = v6;
  id v19 = a4;
  id v20 = +[MIContainerLinkManager sharedInstanceForDomain:[(MIInstallable *)self installationDomain]];
  BOOL v21 = [(MIInstallable *)self bundle];
  id v22 = [v21 identifier];
  id v36 = v12;
  unsigned int v23 = [v20 preflightLinkingChild:v22 toParent:v8 error:&v36];
  id v24 = v36;

  if (!v23)
  {

    id v12 = v24;
    a4 = v19;
    id v6 = v35;
    goto LABEL_18;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v25 = [(MIInstallable *)self bundle];
    uint64_t v32 = [v25 identifier];
    id v33 = v8;
    MOLogWrite();
  }
  id v6 = v35;
  [v35 setLinkedParentBundleID:v8 v32 v33];

  BOOL v26 = 1;
LABEL_33:

  return v26;
}

- (BOOL)_setBundleMetadataWithError:(id *)a3
{
  id v5 = [(MIInstallable *)self installOptions];
  id v6 = [(MIInstallableBundle *)self bundleContainer];
  id v39 = 0;
  uint64_t v7 = [v6 bundleMetadataWithError:&v39];
  id v8 = v39;

  if (!v7)
  {
    id v12 = 0;
    unsigned __int8 v15 = 0;
    goto LABEL_39;
  }
  id v9 = +[NSDate date];
  [v7 setInstallDate:v9];

  id v10 = (void *)MGCopyAnswer();
  objc_opt_class();
  id v11 = v10;
  id v12 = 0;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }

  if (!v12)
  {
    sub_100014A08((uint64_t)"-[MIInstallableBundle _setBundleMetadataWithError:]", 3239, MIInstallerErrorDomain, 4, 0, 0, @"Failed to copy build version for %@", v13, (uint64_t)self);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v15 = 0;
LABEL_38:

    id v8 = v16;
    goto LABEL_39;
  }
  [v7 setInstallBuildVersion:v12];
  id v14 = [v5 lsInstallType];
  if (!v14)
  {
    uint64_t v17 = [(MIInstallableBundle *)self existingBundleContainer];

    if (!v17) {
      goto LABEL_21;
    }
    uint64_t v18 = [(MIInstallableBundle *)self existingBundleContainer];
    id v19 = [v18 bundle];
    id v38 = v8;
    id v20 = [v19 lsInstallTypeWithError:&v38];
    id v21 = v38;

    if (v20)
    {
      [v7 setInstallType:[v20 unsignedIntegerValue]];
LABEL_20:

      id v8 = v21;
      goto LABEL_21;
    }
    id v22 = [v21 domain];
    if ([v22 isEqualToString:MIInstallerErrorDomain])
    {
      id v23 = [v21 code];

      if (v23 == (id)158)
      {
LABEL_19:

        id v21 = 0;
        goto LABEL_20;
      }
    }
    else
    {
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v24 = [(MIInstallableBundle *)self existingBundleContainer];
      uint64_t v32 = [v24 bundle];
      id v34 = v21;
      MOLogWrite();
    }
    goto LABEL_19;
  }
  [v7 setInstallType:v14];
LABEL_21:
  id v37 = v8;
  unsigned int v25 = -[MIInstallableBundle _setLinkageInBundleMetadata:error:](self, "_setLinkageInBundleMetadata:error:", v7, &v37, v32, v34);
  id v26 = v37;

  if (v25)
  {
    id v27 = [v5 autoInstallOverride];
    id v28 = v27;
    if (v27 == (id)2)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
        goto LABEL_31;
      }
    }
    else
    {
      if (v27 != (id)1)
      {
LABEL_32:
        id v8 = [v5 alternateIconName];
        if (v8)
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
          {
            uint64_t v29 = [(MIInstallable *)self bundle];
            id v33 = [v29 identifier];
            id v35 = v8;
            MOLogWrite();
          }
          [v7 setAlternateIconName:v8, v33, v35];
        }
        id v30 = [(MIInstallableBundle *)self bundleContainer];
        id v36 = v26;
        unsigned __int8 v15 = [v30 saveBundleMetadata:v7 withError:&v36];
        id v16 = v36;

        goto LABEL_38;
      }
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
      {
LABEL_31:
        [v7 setAutoInstallOverride:v28];
        goto LABEL_32;
      }
    }
    MOLogWrite();
    goto LABEL_31;
  }
  unsigned __int8 v15 = 0;
  id v8 = v26;
LABEL_39:
  if (a3 && (v15 & 1) == 0) {
    *a3 = v8;
  }

  return v15;
}

- (BOOL)_handleStashMode:(unint64_t)a3 withError:(id *)a4
{
  if (a3 == 2)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v11 = [(MIInstallable *)self bundle];
      unsigned __int8 v15 = [v11 identifier];
      MOLogWrite();
    }
    id v12 = 0;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    uint64_t v7 = [(MIInstallableBundle *)self bundleContainer];
    id v8 = [(MIInstallableBundle *)self existingBundleContainer];
    id v16 = 0;
    unsigned __int8 v9 = [v7 stashBundleContainerContents:v8 error:&v16];
    id v10 = v16;
  }
  else
  {
    if (a3)
    {
      sub_100014A08((uint64_t)"-[MIInstallableBundle _handleStashMode:withError:]", 3329, MIInstallerErrorDomain, 25, 0, 0, @"Unknown stash mode specified in options: %lu", v4, a3);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    uint64_t v7 = [(MIInstallableBundle *)self bundleContainer];
    id v8 = [(MIInstallableBundle *)self existingBundleContainer];
    uint64_t v17 = 0;
    unsigned __int8 v9 = [v7 transferExistingStashesFromContainer:v8 error:&v17];
    id v10 = v17;
  }
  id v12 = v10;

  if (v9)
  {
LABEL_11:
    BOOL v13 = 1;
    goto LABEL_16;
  }
LABEL_13:
  if (a4)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_16:

  return v13;
}

- (BOOL)_linkToParentApplication:(id *)a3
{
  id v5 = [(MIInstallable *)self installOptions];
  id v6 = [v5 linkedParentBundleID];

  if (v6)
  {
    uint64_t v7 = +[MIContainerLinkManager sharedInstanceForDomain:[(MIInstallable *)self installationDomain]];
    id v8 = [(MIInstallableBundle *)self bundleContainer];
    unsigned __int8 v9 = [v8 identifier];
    id v13 = 0;
    unsigned __int8 v10 = [v7 linkChild:v9 toParent:v6 error:&v13];
    id v11 = v13;

    if (a3 && (v10 & 1) == 0)
    {
      id v11 = v11;
      unsigned __int8 v10 = 0;
      *a3 = v11;
    }
  }
  else
  {
    uint64_t v7 = 0;
    id v11 = 0;
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)_handleStashOptionWithError:(id *)a3
{
  uint64_t v5 = [(MIInstallableBundle *)self existingBundleContainer];
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(MIInstallableBundle *)self existingBundleContainer];
  id v8 = [v7 bundle];
  if ([v8 isPlaceholder])
  {

LABEL_11:
    id v15 = 0;
LABEL_12:
    BOOL v16 = 1;
    goto LABEL_13;
  }
  unsigned __int8 v9 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v10 = [v9 allowsInternalSecurityPolicy];

  if (!v10) {
    goto LABEL_11;
  }
  id v11 = [(MIInstallable *)self installOptions];
  id v12 = [v11 stashMode];
  if ([v11 installTargetType] == (id)3) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = (uint64_t)v12;
  }
  id v18 = 0;
  unsigned __int8 v14 = [(MIInstallableBundle *)self _handleStashMode:v13 withError:&v18];
  id v15 = v18;

  if (v14) {
    goto LABEL_12;
  }
  if (a3)
  {
    id v15 = v15;
    BOOL v16 = 0;
    *a3 = v15;
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_13:

  return v16;
}

- (BOOL)_preserveExistingPlaceholderAsParallelPlaceholderWithError:(id *)a3
{
  uint64_t v5 = [(MIInstallableBundle *)self existingBundleContainer];
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 hasParallelPlaceholder];
    id v8 = [v6 bundle];
    unsigned __int8 v9 = [v8 isPlaceholder];

    if ((v9 & 1) == 0 && (v7 & 1) == 0)
    {
      unsigned int v10 = (void *)MIInstallerErrorDomain;
      id v11 = [(MIInstallable *)self bundle];
      id v12 = [v11 identifier];
      [(MIInstallable *)self installationDomain];
      uint64_t v13 = MIStringForInstallationDomain();
      sub_100014A08((uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]", 3416, v10, 190, 0, 0, @"Existing installed bundle for %@ in %@ was not a placeholder or did not have a parallel placeholder.", v14, (uint64_t)v12);
      goto LABEL_6;
    }
    id v20 = [(MIInstallableBundle *)self bundleContainer];
    id v18 = [v20 parallelPlaceholderURL];

    id v21 = +[MIFileManager defaultManager];
    if (v7)
    {
      id v22 = [v6 parallelPlaceholderURL];
      id v35 = 0;
      unsigned __int8 v23 = [v21 copyItemAtURL:v22 toURL:v18 error:&v35];
      id v17 = v35;

      if ((v23 & 1) == 0)
      {
        unsigned int v25 = (void *)MIInstallerErrorDomain;
        id v26 = @"Could not copy existing parallel placeholder to new bundle container.";
        uint64_t v27 = 3426;
        goto LABEL_14;
      }
    }
    else
    {
      id v28 = [v6 bundle];
      uint64_t v29 = [v28 bundleURL];
      id v34 = 0;
      unsigned __int8 v30 = [v21 copyItemAtURL:v29 toURL:v18 error:&v34];
      id v17 = v34;

      if ((v30 & 1) == 0)
      {
        unsigned int v25 = (void *)MIInstallerErrorDomain;
        id v26 = @"Could not copy existing placeholder to parallel placeholder.";
        uint64_t v27 = 3431;
LABEL_14:
        uint64_t v31 = sub_100014A08((uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]", v27, v25, 4, v17, 0, v26, v24, v33);

        id v17 = (id)v31;
        if (a3) {
          goto LABEL_7;
        }
LABEL_15:
        BOOL v19 = 0;
        goto LABEL_16;
      }
    }
    BOOL v19 = 1;
    goto LABEL_16;
  }
  id v15 = (void *)MIInstallerErrorDomain;
  id v11 = [(MIInstallable *)self bundle];
  id v12 = [v11 identifier];
  [(MIInstallable *)self installationDomain];
  uint64_t v13 = MIStringForInstallationDomain();
  sub_100014A08((uint64_t)"-[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]", 3409, v15, 190, 0, 0, @"Did not find existing bundle container for %@ in %@ from which to preserve placeholder.", v16, (uint64_t)v12);
LABEL_6:
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  id v18 = 0;
  if (!a3) {
    goto LABEL_15;
  }
LABEL_7:
  id v17 = v17;
  BOOL v19 = 0;
  *a3 = v17;
LABEL_16:

  return v19;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  v53.receiver = self;
  v53.super_class = (Class)MIInstallableBundle;
  if (!-[MIInstallable performInstallationWithError:](&v53, "performInstallationWithError:"))
  {
    id v17 = 0;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t v5 = [(MIInstallable *)self progressBlock];
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"CreatingContainer", 50);

  id v6 = [(MIInstallable *)self bundle];
  unsigned int v7 = [v6 bundleType];

  if (v7 <= 5 && ((1 << v7) & 0x36) != 0)
  {
    id v8 = [(MIInstallable *)self bundle];
    unsigned __int8 v9 = [v8 identifier];
    id v52 = 0;
    unsigned int v10 = +[MIBundleContainer tempAppBundleContainerWithIdentifier:v9 inDomain:[(MIInstallable *)self installationDomain] withError:&v52];
    id v11 = v52;
    [(MIInstallableBundle *)self setBundleContainer:v10];
  }
  else
  {
    uint64_t v41 = (void *)MIInstallerErrorDomain;
    id v8 = [(MIInstallable *)self bundle];
    unsigned int v42 = [v8 bundleType];
    sub_100014A08((uint64_t)"-[MIInstallableBundle performInstallationWithError:]", 3478, v41, 4, 0, 0, @"Don't know how to create bundle container for installable type %d", v43, v42);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v12 = [(MIInstallableBundle *)self bundleContainer];

  if (!v12)
  {
    id v36 = (void *)MIInstallerErrorDomain;
    id v37 = [(MIInstallable *)self bundle];
    id v38 = [v37 identifier];
    sub_100014A08((uint64_t)"-[MIInstallableBundle performInstallationWithError:]", 3483, v36, 21, v11, &off_100098280, @"Failed to create container for %@", v39, (uint64_t)v38);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  uint64_t v13 = [(MIInstallable *)self progressBlock];
  ((void (**)(void, const __CFString *, uint64_t))v13)[2](v13, @"InstallingApplication", 60);

  uint64_t v14 = [(MIInstallableBundle *)self bundleContainer];
  id v15 = [(MIInstallable *)self bundle];
  id v51 = v11;
  unsigned int v16 = [v14 captureBundleByMoving:v15 withError:&v51];
  id v17 = v51;

  if (!v16) {
    goto LABEL_19;
  }
  id v18 = [(MIInstallableBundle *)self bundleContainer];
  BOOL v19 = [v18 bundle];
  id v20 = [v19 bundleURL];
  id v21 = [(MIInstallableBundle *)self bundleContainer];
  id v50 = v17;
  unsigned int v22 = [(MIInstallableBundle *)self _captureDataFromStagingRootOrBundle:v20 toContainer:v21 withError:&v50];
  id v23 = v50;

  if (!v22) {
    goto LABEL_21;
  }
  uint64_t v24 = [(MIInstallableBundle *)self bundleContainer];
  unsigned int v25 = [v24 bundle];
  id v26 = [(MIInstallableBundle *)self bundleContainer];
  id v49 = v23;
  unsigned int v27 = [(MIInstallableBundle *)self _writeOptionsDataToBundle:v25 orContainer:v26 error:&v49];
  id v17 = v49;

  if (!v27) {
    goto LABEL_19;
  }
  id v48 = v17;
  unsigned int v28 = [(MIInstallableBundle *)self _validateiTunesMetadataWithError:&v48];
  id v23 = v48;

  if (!v28) {
    goto LABEL_21;
  }
  id v47 = v23;
  unsigned int v29 = [(MIInstallableBundle *)self _setBundleMetadataWithError:&v47];
  id v17 = v47;

  if (!v29) {
    goto LABEL_19;
  }
  id v46 = v17;
  unsigned int v30 = [(MIInstallableBundle *)self _validateSinfsWithError:&v46];
  id v23 = v46;

  if (!v30) {
    goto LABEL_21;
  }
  id v45 = v23;
  unsigned int v31 = [(MIInstallableBundle *)self _handleStashOptionWithError:&v45];
  id v17 = v45;

  if (!v31)
  {
LABEL_19:
    if (!a3)
    {
LABEL_22:
      BOOL v35 = 0;
      goto LABEL_23;
    }
LABEL_20:
    id v17 = v17;
    BOOL v35 = 0;
    *a3 = v17;
    goto LABEL_23;
  }
  uint64_t v32 = [(MIInstallable *)self installOptions];
  unsigned int v33 = [v32 preservePlaceholderAsParallel];

  if (!v33)
  {
    BOOL v35 = 1;
    goto LABEL_23;
  }
  id v44 = v17;
  unsigned __int8 v34 = [(MIInstallableBundle *)self _preserveExistingPlaceholderAsParallelPlaceholderWithError:&v44];
  id v23 = v44;

  if ((v34 & 1) == 0)
  {
LABEL_21:
    id v17 = v23;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  BOOL v35 = 1;
  id v17 = v23;
LABEL_23:

  return v35;
}

- (BOOL)_postFlightAppExtensionsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(MIInstallableBundle *)self appExtensionBundles];
  id v31 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v31)
  {
    unsigned int v29 = a3;
    id v6 = 0;
    uint64_t v32 = *(void *)v37;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v37 != v32) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
      unsigned __int8 v9 = [(MIInstallable *)self bundle];
      unsigned __int8 v10 = [v9 isPlaceholder];

      if (v10)
      {
        id v11 = v6;
      }
      else
      {
        id v35 = v6;
        unsigned int v12 = [v8 makeExecutableWithError:&v35];
        id v11 = v35;

        if (!v12) {
          goto LABEL_22;
        }
      }
      id v34 = 0;
      unsigned __int8 v13 = [v8 updateMCMWithCodeSigningInfoAsAdvanceCopy:1 withError:&v34];
      id v14 = v34;
      if ((v13 & 1) == 0) {
        break;
      }
      id v15 = v5;
      unsigned int v16 = [(MIInstallable *)self identity];
      id v17 = [v16 personaUniqueString];
      id v33 = v11;
      id v18 = [v8 dataContainerCreatingIfNeeded:1 forPersona:v17 makeLive:0 created:0 error:&v33];
      id v6 = v33;

      if (!v18)
      {
        uint64_t v24 = (void *)MIInstallerErrorDomain;
        id v21 = [v8 identifier];
        uint64_t v23 = sub_100014A08((uint64_t)"-[MIInstallableBundle _postFlightAppExtensionsWithError:]", 3578, v24, 21, v6, &off_1000982A8, @"Failed to create plugin data container for plugin %@", v25, (uint64_t)v21);
        id v11 = v6;
        uint64_t v5 = v15;
LABEL_21:

        id v11 = (id)v23;
LABEL_22:

        if (v29)
        {
          id v11 = v11;
          BOOL v19 = 0;
          *unsigned int v29 = v11;
        }
        else
        {
          BOOL v19 = 0;
        }
        goto LABEL_25;
      }
      uint64_t v5 = v15;
      [v15 addObject:v18];

      if (v31 == (id)++v7)
      {
        id v31 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v31) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      unsigned int v27 = [v8 identifier];
      id v28 = v14;
      MOLogWrite();
    }
    id v20 = (void *)MIInstallerErrorDomain;
    id v21 = [v8 identifier:v27, v28];
    [v8 isPlaceholder];
    uint64_t v23 = sub_100014A08((uint64_t)"-[MIInstallableBundle _postFlightAppExtensionsWithError:]", 3571, v20, 110, v14, 0, @"Failed to set app extension code signing info with container manager for %@, isPlaceholder: %c", v22, (uint64_t)v21);
    goto LABEL_21;
  }
  id v6 = 0;
LABEL_15:

  [(MIInstallableBundle *)self setAppExtensionDataContainers:v5];
  BOOL v19 = 1;
  id v11 = v6;
LABEL_25:

  return v19;
}

- (BOOL)_setLaunchWarningDataWithError:(id *)a3
{
  id v6 = [(MIInstallableBundle *)self bundleSigningInfo];
  if (v6)
  {
    uint64_t v7 = [(MIInstallable *)self bundle];
    id v8 = [v6 launchWarningData];
    id v13 = 0;
    unsigned __int8 v9 = [v7 setLaunchWarningData:v8 withError:&v13];
    id v10 = v13;

    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIInstallableBundle _setLaunchWarningDataWithError:]", 3605, MIInstallerErrorDomain, 4, 0, 0, @"Unexpectedly missing bundle signing information", v5, v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v9 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if ((v9 & 1) == 0) {
    *a3 = v10;
  }
LABEL_7:

  return v9;
}

- (BOOL)postFlightInstallationWithError:(id *)a3
{
  uint64_t v5 = [(MIInstallable *)self progressBlock];
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"PostflightingApplication", 70);

  v52.receiver = self;
  v52.super_class = (Class)MIInstallableBundle;
  if (![(MIInstallable *)&v52 postFlightInstallationWithError:a3])
  {
    id v12 = 0;
    goto LABEL_33;
  }
  id v6 = [(MIInstallable *)self bundle];
  unsigned int v7 = [v6 needsDataContainer];

  if (v7)
  {
    id v8 = [(MIInstallable *)self bundle];
    unsigned __int8 v9 = [(MIInstallable *)self identity];
    id v10 = [v9 personaUniqueString];
    id v51 = 0;
    id v11 = [v8 dataContainerCreatingIfNeeded:1 forPersona:v10 makeLive:0 created:0 error:&v51];
    id v12 = v51;

    if (!v11) {
      goto LABEL_33;
    }
    [(MIInstallableBundle *)self setDataContainer:v11];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;
  id v50 = v12;
  unsigned int v14 = [(MIInstallableBundle *)self _postFlightAppExtensionsWithError:&v50];
  id v12 = v50;

  if (v14)
  {
    id v15 = [(MIInstallable *)self bundle];
    unsigned __int8 v16 = [v15 isPlaceholder];

    if (v16)
    {
LABEL_9:
      BOOL v17 = 1;
      goto LABEL_36;
    }
    id v18 = [(MIInstallable *)self bundle];
    id v49 = v12;
    unsigned int v19 = [v18 makeExecutableWithError:&v49];
    id v20 = v49;

    if (!v19) {
      goto LABEL_32;
    }
    if ([(MIInstallableBundle *)self xpcServiceBundlesEnabled])
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v21 = [(MIInstallableBundle *)self xpcServiceBundles];
      id v22 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v46;
LABEL_14:
        uint64_t v25 = 0;
        id v26 = v20;
        while (1)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          unsigned int v27 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v25);
          id v44 = v26;
          unsigned int v28 = [v27 makeExecutableWithError:&v44];
          id v20 = v44;

          if (!v28) {
            goto LABEL_31;
          }
          uint64_t v25 = (char *)v25 + 1;
          id v26 = v20;
          if (v23 == v25)
          {
            id v23 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
            if (v23) {
              goto LABEL_14;
            }
            break;
          }
        }
      }
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v21 = [(MIInstallableBundle *)self driverKitExtensionBundles];
    id v29 = [v21 countByEnumeratingWithState:&v40 objects:v53 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v41;
LABEL_23:
      uint64_t v32 = 0;
      id v33 = v20;
      while (1)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(v21);
        }
        id v34 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v32);
        id v39 = v33;
        unsigned int v35 = [v34 makeExecutableWithError:&v39];
        id v20 = v39;

        if (!v35) {
          break;
        }
        uint64_t v32 = (char *)v32 + 1;
        id v33 = v20;
        if (v30 == v32)
        {
          id v30 = [v21 countByEnumeratingWithState:&v40 objects:v53 count:16];
          if (v30) {
            goto LABEL_23;
          }
          goto LABEL_29;
        }
      }
LABEL_31:

LABEL_32:
      id v12 = v20;
      goto LABEL_33;
    }
LABEL_29:

    id v38 = v20;
    unsigned __int8 v36 = [(MIInstallableBundle *)self _setLaunchWarningDataWithError:&v38];
    id v12 = v38;

    if (v36) {
      goto LABEL_9;
    }
  }
LABEL_33:
  if (a3)
  {
    id v12 = v12;
    BOOL v17 = 0;
    *a3 = v12;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_36:

  return v17;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (![(MIInstallable *)self shouldModifyExistingContainers]
    || [v6 status] != (id)1)
  {
    id v9 = 0;
LABEL_8:
    BOOL v12 = 1;
    goto LABEL_9;
  }
  id v15 = 0;
  unsigned int v7 = [v6 regenerateDirectoryUUIDWithError:&v15];
  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v10 = [v6 identifier];
      id v11 = [v6 containerURL];
      unsigned int v14 = [v11 path];
      MOLogWrite();
    }
    goto LABEL_8;
  }
  if (a4)
  {
    id v9 = v8;
    BOOL v12 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_9:

  return v12;
}

- (unint64_t)_installationJournalOperationType
{
  if ((id)[(MIInstallable *)self installOperationType] == (id)1) {
    return 5;
  }
  if (![(MIInstallableBundle *)self isPlaceholderInstall]) {
    return 1;
  }
  uint64_t v4 = [(MIInstallableBundle *)self existingBundleContainer];
  uint64_t v5 = v4;
  if (v4
    && ([v4 bundle],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isPlaceholder],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = [(MIInstallable *)self installOptions];
    id v9 = [v8 installTargetType];

    if (v9 == (id)3) {
      unint64_t v3 = 4;
    }
    else {
      unint64_t v3 = 3;
    }
  }
  else
  {
    unint64_t v3 = 2;
  }

  return v3;
}

- (id)_noLongerPresentAppExtensionDataContainers
{
  uint64_t v32 = +[NSMutableArray arrayWithCapacity:0];
  unint64_t v3 = [(MIInstallableBundle *)self existingBundleContainer];
  uint64_t v4 = [v3 bundle];

  id v44 = 0;
  uint64_t v5 = [v4 appExtensionBundlesWithError:&v44];
  id v6 = v44;
  if (v5)
  {
    unsigned __int8 v7 = +[NSMutableArray arrayWithCapacity:0];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v33 = self;
    id v8 = [(MIInstallableBundle *)self appExtensionBundles];
    id v9 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v40 + 1) + 8 * i) identifier];
          [v7 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v10);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v5;
    id v14 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v14)
    {
      id v15 = v14;
      id v30 = v5;
      uint64_t v31 = v4;
      uint64_t v16 = *(void *)v37;
      do
      {
        BOOL v17 = 0;
        id v18 = v6;
        do
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(obj);
          }
          unsigned int v19 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v17);
          id v20 = [v19 identifier:v28, v29];
          unsigned __int8 v21 = [v7 containsObject:v20];

          if (v21)
          {
            id v6 = v18;
          }
          else
          {
            id v22 = [(MIInstallable *)v33 identity];
            id v23 = [v22 personaUniqueString];
            id v35 = v18;
            uint64_t v24 = [v19 dataContainerCreatingIfNeeded:0 forPersona:v23 makeLive:0 created:0 error:&v35];
            id v25 = v35;

            if (v24)
            {
              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
              {
                unsigned int v28 = [v19 identifier];
                MOLogWrite();
              }
              [v32 addObject:v24, v28];
            }
            else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
            {
              unsigned int v28 = [v19 identifier];
              id v29 = v25;
              MOLogWrite();
            }
            id v6 = v25;
            id v18 = v25;
          }
          BOOL v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v15);
      uint64_t v5 = v30;
      uint64_t v4 = v31;
    }
    goto LABEL_31;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    unsigned __int8 v7 = [v4 bundleURL];
    unsigned int v28 = [v7 path];
    id v29 = v6;
    id obj = v28;
    MOLogWrite();
LABEL_31:
  }
  id v26 = [v32 copy:v28 v29];

  return v26;
}

- (id)_createJournalEntry
{
  unint64_t v3 = [(MIInstallable *)self installOptions];
  uint64_t v4 = [(MIInstallableBundle *)self existingBundleContainer];
  if (v4 && ![(MIInstallableBundle *)self isPlaceholderInstall])
  {
    uint64_t v5 = [(MIInstallableBundle *)self _noLongerPresentAppExtensionDataContainers];
  }
  else
  {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(MIInstallableBundle *)self _installationJournalOperationType];
  unsigned __int8 v7 = [MIInstallationJournalEntry alloc];
  id v8 = [(MIInstallable *)self identity];
  id v9 = [(MIInstallableBundle *)self bundleContainer];
  unint64_t v10 = [(MIInstallable *)self installationDomain];
  uint64_t v11 = [(MIInstallableBundle *)self bundleSigningInfo];
  BOOL v12 = [(MIInstallationJournalEntry *)v7 initWithIdentity:v8 bundleContainer:v9 existingBundleContainer:v4 installationDomain:v10 operationType:v6 installOptions:v3 bundleSigningInfo:v11];

  id v13 = [(MIInstallable *)self progressBlock];
  [(MIInstallationJournalEntry *)v12 setProgressBlock:v13];

  id v14 = [v3 linkedParentBundleID];
  [(MIInstallationJournalEntry *)v12 setLinkToParentBundleID:v14];

  [(MIInstallationJournalEntry *)v12 setNoLongerPresentAppExtensionDataContainers:v5];
  id v15 = [(MIInstallableBundle *)self dataContainer];
  [(MIInstallationJournalEntry *)v12 setDataContainer:v15];

  uint64_t v16 = [(MIInstallableBundle *)self appExtensionBundles];
  id v17 = [v16 copy];
  [(MIInstallationJournalEntry *)v12 setAppExtensionBundles:v17];

  id v18 = [(MIInstallableBundle *)self appExtensionDataContainers];
  id v19 = [v18 copy];
  [(MIInstallationJournalEntry *)v12 setAppExtensionDataContainers:v19];

  return v12;
}

- (BOOL)finalizeInstallationWithError:(id *)a3
{
  uint64_t v5 = [(MIInstallable *)self progressBlock];
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"SandboxingApplication", 80);

  v15.receiver = self;
  v15.super_class = (Class)MIInstallableBundle;
  id v16 = 0;
  unsigned int v6 = [(MIInstallable *)&v15 finalizeInstallationWithError:&v16];
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v9 = [(MIInstallableBundle *)self _createJournalEntry];
    id v14 = v8;
    unsigned int v10 = [v9 finalizeContainersWithError:&v14];
    id v11 = v14;

    if (v10)
    {
      [(MIInstallableBundle *)self setJournalEntry:v9];
      BOOL v12 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = 0;
    id v11 = v7;
  }
  if (a3)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a3 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_8:

  return v12;
}

- (BOOL)stageBackgroundUpdate:(id *)a3 withError:(id *)a4
{
  id v24 = 0;
  id v25 = 0;
  v23.receiver = self;
  v23.super_class = (Class)MIInstallableBundle;
  unsigned int v7 = [(MIInstallable *)&v23 stageBackgroundUpdate:&v25 withError:&v24];
  id v8 = v25;
  id v9 = v24;
  unsigned int v10 = v9;
  if (!v7)
  {
    id v11 = 0;
    id v13 = v9;
    if (!a4)
    {
LABEL_15:
      BOOL v15 = 0;
      goto LABEL_17;
    }
LABEL_6:
    id v13 = v13;
    BOOL v15 = 0;
    *a4 = v13;
    goto LABEL_17;
  }
  id v11 = [(MIInstallableBundle *)self _createJournalEntry];
  id v22 = v10;
  unsigned __int8 v12 = [v11 stageUpdateForLater:&v22];
  id v13 = v22;

  if ((v12 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v20 = v11;
      MOLogWrite();
    }
    id v16 = +[MIJournal sharedInstance];
    id v21 = 0;
    unsigned __int8 v17 = [v16 purgeJournalEntry:v11 withError:&v21];
    id v18 = v21;

    if ((v17 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
      MOLogWrite();
    }

    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  [(MIInstallableBundle *)self setJournalEntry:v11];
  id v14 = [v11 uniqueIdentifier];

  if (a3)
  {
    id v8 = v14;
    *a3 = v8;
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 1;
    id v8 = v14;
  }
LABEL_17:

  return v15;
}

- (id)launchServicesBundleRecordsWithError:(id *)a3
{
  uint64_t v5 = objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)MIInstallableBundle;
  unsigned int v6 = [(MIInstallable *)&v11 launchServicesBundleRecordsWithError:a3];
  if (v6)
  {
    [v5 addObjectsFromArray:v6];
    unsigned int v7 = [(MIInstallableBundle *)self journalEntry];
    id v8 = [v7 bundleRecordsToRegister];
    [v5 addObjectsFromArray:v8];

    id v9 = [v5 copy];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  uint64_t v4 = [(MIInstallableBundle *)self journalEntry];
  LOBYTE(a3) = [v4 performLaunchServicesRegistrationWithError:a3];

  return (char)a3;
}

- (BOOL)isPlaceholderInstall
{
  return self->_isPlaceholderInstall;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (void)setBundleContainer:(id)a3
{
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
}

- (NSArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
}

- (NSArray)frameworkBundles
{
  return self->_frameworkBundles;
}

- (void)setFrameworkBundles:(id)a3
{
}

- (NSArray)xpcServiceBundles
{
  return self->_xpcServiceBundles;
}

- (void)setXpcServiceBundles:(id)a3
{
}

- (NSArray)driverKitExtensionBundles
{
  return self->_driverKitExtensionBundles;
}

- (void)setDriverKitExtensionBundles:(id)a3
{
}

- (NSURL)upgradingBuiltInAppAtURL
{
  return self->_upgradingBuiltInAppAtURL;
}

- (void)setUpgradingBuiltInAppAtURL:(id)a3
{
}

- (NSMutableDictionary)identifiersMap
{
  return self->_identifiersMap;
}

- (void)setIdentifiersMap:(id)a3
{
}

- (BOOL)xpcServiceBundlesEnabled
{
  return self->_xpcServiceBundlesEnabled;
}

- (void)setXpcServiceBundlesEnabled:(BOOL)a3
{
  self->_xpcServiceBundlesEnabled = a3;
}

- (MICodeSigningInfo)bundleSigningInfo
{
  return self->_bundleSigningInfo;
}

- (void)setBundleSigningInfo:(id)a3
{
}

- (MIInstallationJournalEntry)journalEntry
{
  return self->_journalEntry;
}

- (void)setJournalEntry:(id)a3
{
}

- (MIEmbeddedWatchBundle)embeddedWatchApp
{
  return self->_embeddedWatchApp;
}

- (void)setEmbeddedWatchApp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedWatchApp, 0);
  objc_storeStrong((id *)&self->_journalEntry, 0);
  objc_storeStrong((id *)&self->_bundleSigningInfo, 0);
  objc_storeStrong((id *)&self->_identifiersMap, 0);
  objc_storeStrong((id *)&self->_upgradingBuiltInAppAtURL, 0);
  objc_storeStrong((id *)&self->_driverKitExtensionBundles, 0);
  objc_storeStrong((id *)&self->_xpcServiceBundles, 0);
  objc_storeStrong((id *)&self->_frameworkBundles, 0);
  objc_storeStrong((id *)&self->_appExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_appExtensionBundles, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);

  objc_storeStrong((id *)&self->_existingBundleContainer, 0);
}

@end