@interface MIInstallationJournalEntry
+ (BOOL)supportsSecureCoding;
+ (id)_registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5;
+ (void)_attemptLSUpdateWithDiscoveredStateForIdentity:(id)a3 domain:(unint64_t)a4;
- (BOOL)_beginLaunchServicesRegistrationWithError:(id *)a3;
- (BOOL)_commitContainersWithError:(id *)a3;
- (BOOL)_findBundleContainerForToken:(id)a3 error:(id *)a4;
- (BOOL)_gatherLaunchServicesRegistrationInfoWithError:(id *)a3;
- (BOOL)_linkToParentApplication:(id *)a3;
- (BOOL)_performJournaledInstallAsReplay:(BOOL)a3 withError:(id *)a4;
- (BOOL)_populateSigningInfoWithError:(id *)a3;
- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4;
- (BOOL)_updateJournalPhaseTo:(unint64_t)a3 withError:(id *)a4;
- (BOOL)_updateReferencesWithError:(id *)a3;
- (BOOL)_writeJournalEntryWithError:(id *)a3;
- (BOOL)cleanUpJournaledDataOnDiskWithError:(id *)a3;
- (BOOL)finalizeContainersWithError:(id *)a3;
- (BOOL)finalizeWithError:(id *)a3;
- (BOOL)isPlaceholderInstall;
- (BOOL)makeStagedBackgroundUpdateLive:(id *)a3;
- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3;
- (BOOL)shouldModifyExistingContainers;
- (BOOL)shouldPersist;
- (BOOL)stageUpdateForLater:(id *)a3;
- (LSRecordPromise)recordPromise;
- (MIAppIdentity)identity;
- (MIBundleContainer)bundleContainer;
- (MIBundleContainer)existingBundleContainer;
- (MICodeSigningInfo)bundleSigningInfo;
- (MIDataContainer)dataContainer;
- (MIExecutableBundle)bundle;
- (MIInstallOptions)installOptions;
- (MIInstallationJournalEntry)initWithCoder:(id)a3;
- (MIInstallationJournalEntry)initWithIdentity:(id)a3 bundleContainer:(id)a4 existingBundleContainer:(id)a5 installationDomain:(unint64_t)a6 operationType:(unint64_t)a7 installOptions:(id)a8 bundleSigningInfo:(id)a9;
- (NSArray)appExtensionBundles;
- (NSArray)appExtensionDataContainers;
- (NSArray)bundleRecordsToRegister;
- (NSArray)noLongerPresentAppExtensionDataContainers;
- (NSString)description;
- (NSString)linkToParentBundleID;
- (NSString)uniqueIdentifier;
- (NSUUID)journalEntryID;
- (id)_containerLinkManager;
- (id)_containerProtectionManager;
- (id)_freeProfileValidatedAppTracker;
- (id)_helperServiceClient;
- (id)_journalInstance;
- (id)_keychainAccessGroupTracker;
- (id)_registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
- (id)_systemAppState;
- (id)_uninstalledAppList;
- (id)progressBlock;
- (int)_promoteKeychainItemsForAppClipWithAppIdentifier:(id)a3 toParentAppWithAppIdentifier:(id)a4;
- (unint64_t)attemptCount;
- (unint64_t)installationDomain;
- (unint64_t)journalPhase;
- (unint64_t)operationType;
- (void)_purgeJournalEntry;
- (void)_updateContainerStatePostCommit;
- (void)encodeWithCoder:(id)a3;
- (void)setAppExtensionBundles:(id)a3;
- (void)setAppExtensionDataContainers:(id)a3;
- (void)setDataContainer:(id)a3;
- (void)setJournalPhase:(unint64_t)a3;
- (void)setLinkToParentBundleID:(id)a3;
- (void)setNoLongerPresentAppExtensionDataContainers:(id)a3;
- (void)setProgressBlock:(id)a3;
@end

@implementation MIInstallationJournalEntry

- (int)_promoteKeychainItemsForAppClipWithAppIdentifier:(id)a3 toParentAppWithAppIdentifier:(id)a4
{
  return _SecItemPromoteAppClipItemsToParentApp(a3, a4);
}

- (id)_containerLinkManager
{
  unint64_t v2 = [(MIInstallationJournalEntry *)self installationDomain];

  return +[MIContainerLinkManager sharedInstanceForDomain:v2];
}

- (id)_keychainAccessGroupTracker
{
  return +[MIKeychainAccessGroupTracker sharedTracker];
}

- (id)_freeProfileValidatedAppTracker
{
  return +[MIFreeProfileValidatedAppTracker sharedTracker];
}

- (id)_systemAppState
{
  return +[MISystemAppState sharedList];
}

- (id)_containerProtectionManager
{
  return +[MIContainerProtectionManager defaultManager];
}

- (id)_helperServiceClient
{
  return +[MIHelperServiceClient sharedInstance];
}

- (id)_uninstalledAppList
{
  return +[MIUninstalledAppList sharedList];
}

- (id)_journalInstance
{
  return +[MIJournal sharedInstance];
}

+ (id)_registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  return +[MILaunchServicesOperationManager registerUsingDiscoveredInfoForAppIdentity:a3 inDomain:a4 error:a5];
}

- (id)_registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  return +[MILaunchServicesOperationManager registerInstalledInfo:a3 forIdentity:a4 inDomain:a5 error:a6];
}

+ (void)_attemptLSUpdateWithDiscoveredStateForIdentity:(id)a3 domain:(unint64_t)a4
{
  id v6 = a3;
  v7 = MIStringForInstallationDomain();
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v10 = v6;
    v11 = v7;
    MOLogWrite();
  }
  id v12 = 0;
  v8 = [a1 _registerUsingDiscoveredInfoForAppIdentity:v6 inDomain:a4 error:&v12 inDomain:v10 inDomain:v11];
  id v9 = v12;

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000594B0();
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
  }
}

- (MIInstallationJournalEntry)initWithIdentity:(id)a3 bundleContainer:(id)a4 existingBundleContainer:(id)a5 installationDomain:(unint64_t)a6 operationType:(unint64_t)a7 installOptions:(id)a8 bundleSigningInfo:(id)a9
{
  id v15 = a3;
  id v25 = a4;
  id v24 = a5;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MIInstallationJournalEntry;
  v18 = [(MIInstallationJournalEntry *)&v26 init];
  if (v18)
  {
    v19 = (MIAppIdentity *)[v15 copy];
    identity = v18->_identity;
    v18->_identity = v19;

    objc_storeStrong((id *)&v18->_bundleContainer, a4);
    objc_storeStrong((id *)&v18->_existingBundleContainer, a5);
    v18->_installationDomain = a6;
    v18->_operationType = a7;
    objc_storeStrong((id *)&v18->_installOptions, a8);
    objc_storeStrong((id *)&v18->_bundleSigningInfo, a9);
    v18->_journalPhase = 1;
    v18->_attemptCount = 0;
    uint64_t v21 = objc_opt_new();
    journalEntryID = v18->_journalEntryID;
    v18->_journalEntryID = (NSUUID *)v21;

    if (_os_feature_enabled_impl())
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
        MOLogWrite();
      }
    }
  }

  return v18;
}

- (BOOL)_populateSigningInfoWithError:(id *)a3
{
  v5 = [(MIInstallationJournalEntry *)self bundle];
  id v11 = 0;
  id v6 = [v5 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v11];
  id v8 = v11;
  if (v6)
  {
    objc_storeStrong((id *)&self->_bundleSigningInfo, v6);
  }
  else
  {
    id v9 = sub_100014A08((uint64_t)"-[MIInstallationJournalEntry _populateSigningInfoWithError:]", 228, MIInstallerErrorDomain, 4, v8, 0, @"Failed to get signing info for bundle %@", v7, (uint64_t)v5);

    if (a3)
    {
      id v8 = v9;
      *a3 = v8;
    }
    else
    {
      id v8 = v9;
    }
  }

  return v6 != 0;
}

- (BOOL)_findBundleContainerForToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_journalPhase == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  id v15 = 0;
  id v8 = (MIBundleContainer *)[objc_alloc((Class)MIBundleContainer) initWithToken:v6 options:v7 error:&v15];
  id v9 = v15;
  bundleContainer = self->_bundleContainer;
  self->_bundleContainer = v8;

  id v12 = self->_bundleContainer;
  if (!v12)
  {
    v13 = sub_100014A08((uint64_t)"-[MIInstallationJournalEntry _findBundleContainerForToken:error:]", 257, MIInstallerErrorDomain, 186, v9, 0, @"Failed to locate bundle container for token %@", v11, (uint64_t)v6);

    if (a4)
    {
      id v9 = v13;
      *a4 = v9;
    }
    else
    {
      id v9 = v13;
    }
  }

  return v12 != 0;
}

- (MIInstallationJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)MIInstallationJournalEntry;
  v5 = [(MIInstallationJournalEntry *)&v90 init];
  if (!v5)
  {
    id v11 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
  identity = v5->_identity;
  v5->_identity = (MIAppIdentity *)v6;

  if (!v5->_identity)
  {
    v14 = (void *)MIInstallerErrorDomain;
    id v15 = @"Decoded object was missing identity.";
    uint64_t v16 = 278;
LABEL_12:
    sub_100014A08((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", v16, v14, 186, 0, 0, v15, v8, v72);
    goto LABEL_13;
  }
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"journalPhase"];
  v5->_journalPhase = (unint64_t)[v9 unsignedIntegerValue];

  if (v5->_journalPhase - 8 <= 0xFFFFFFFFFFFFFFF8)
  {
    sub_100014A08((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 285, MIInstallerErrorDomain, 186, 0, 0, @"Got invalid journal phase: %lu.", v10, v5->_journalPhase);
LABEL_13:
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    goto LABEL_14;
  }
  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attemptCount"];
  v5->_attemptCount = (unint64_t)[v17 unsignedIntegerValue];

  ++v5->_attemptCount;
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installationDomain"];
  v5->_unint64_t installationDomain = (unint64_t)[v18 unsignedIntegerValue];

  unint64_t installationDomain = v5->_installationDomain;
  if ((MIIsValidInstallationDomain() & 1) == 0)
  {
    v14 = (void *)MIInstallerErrorDomain;
    uint64_t v72 = installationDomain;
    id v15 = @"Got invalid installation domain: %lu.";
    uint64_t v16 = 295;
    goto LABEL_12;
  }
  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationType"];
  v5->_operationType = (unint64_t)[v20 unsignedIntegerValue];

  if (v5->_operationType - 6 <= 0xFFFFFFFFFFFFFFFALL)
  {
    sub_100014A08((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 304, MIInstallerErrorDomain, 186, 0, 0, @"Got invalid journal operation type: %lu.", v21, v5->_operationType);
    goto LABEL_13;
  }
  uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installOptions"];
  installOptions = v5->_installOptions;
  v5->_installOptions = (MIInstallOptions *)v24;

  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"journalEntryID"];
  journalEntryID = v5->_journalEntryID;
  v5->_journalEntryID = (NSUUID *)v26;

  uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleContainerToken"];
  if (!v28)
  {
    v14 = (void *)MIInstallerErrorDomain;
    id v15 = @"Serialized journal entry did not contain bundle container token.";
    uint64_t v16 = 314;
    goto LABEL_12;
  }
  v29 = (void *)v28;
  id v89 = 0;
  unsigned int v30 = [(MIInstallationJournalEntry *)v5 _findBundleContainerForToken:v28 error:&v89];
  id v13 = v89;
  if (!v30)
  {
    v22 = v29;
    goto LABEL_14;
  }
  [(MIInstallationJournalEntry *)v5 _populateSigningInfoWithError:0];
  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExistingBundleContainerToken"];

  if ([(MIInstallationJournalEntry *)v5 journalPhase] < 2)
  {
    if (v22) {
      objc_storeStrong((id *)&v5->_existingBundleContainer, v5->_bundleContainer);
    }
  }
  else if (v22)
  {
    id v88 = v13;
    v31 = (MIBundleContainer *)[objc_alloc((Class)MIBundleContainer) initWithToken:v22 options:1 error:&v88];
    id v32 = v88;

    existingBundleContainer = v5->_existingBundleContainer;
    v5->_existingBundleContainer = v31;

    if (!v5->_existingBundleContainer)
    {
      sub_100014A08((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 330, MIInstallerErrorDomain, 186, v32, 0, @"Expected to find existing bundle container but lookup failed.", v34, v72);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    id v13 = v32;
  }
  uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkToParentBundleID"];
  linkToParentBundleID = v5->_linkToParentBundleID;
  v5->_linkToParentBundleID = (NSString *)v35;

  v37 = objc_opt_new();
  v75 = v4;
  v38 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NoLongerPresentContainerTokens"];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v39 = [v38 countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v85;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v85 != v41) {
          objc_enumerationMutation(v38);
        }
        id v43 = [objc_alloc((Class)MIPluginDataContainer) initWithToken:*(void *)(*((void *)&v84 + 1) + 8 * i) options:0 error:0];
        if (v43) {
          [v37 addObject:v43];
        }
      }
      id v40 = [v38 countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v40);
  }
  if ([v37 count])
  {
    v44 = (NSArray *)[v37 copy];
    noLongerPresentAppExtensionDataContainers = v5->_noLongerPresentAppExtensionDataContainers;
    v5->_noLongerPresentAppExtensionDataContainers = v44;
  }
  v46 = v75;
  v47 = [v75 decodeObjectOfClass:objc_opt_class() forKey:@"DataContainerToken"];
  if (!v47)
  {
    v73 = 0;
    goto LABEL_44;
  }
  id v83 = v13;
  v48 = (MIDataContainer *)[objc_alloc((Class)MIDataContainer) initWithToken:v47 options:0 error:&v83];
  id v49 = v83;

  dataContainer = v5->_dataContainer;
  v5->_dataContainer = v48;

  if (v5->_dataContainer)
  {
    v73 = v47;
    id v13 = v49;
    v46 = v75;
LABEL_44:
    v74 = v22;
    v52 = [v46 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"AppExtensionDataContainerTokens"];
    [v37 removeAllObjects];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v53 = v52;
    id v54 = [v53 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v80;
      id obj = v53;
      while (2)
      {
        v57 = 0;
        v58 = v13;
        do
        {
          if (*(void *)v80 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v59 = *(void *)(*((void *)&v79 + 1) + 8 * (void)v57);
          id v60 = objc_alloc((Class)MIPluginDataContainer);
          id v78 = v58;
          id v61 = [v60 initWithToken:v59 options:0 error:&v78];
          id v13 = v78;

          if (!v61)
          {
            uint64_t v68 = sub_100014A08((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 383, MIInstallerErrorDomain, 186, v13, 0, @"Expected to find app extension data container but lookup failed.", v62, v72);
            id v53 = obj;
            v69 = obj;
            goto LABEL_60;
          }
          [v37 addObject:v61];

          v57 = (char *)v57 + 1;
          v58 = v13;
        }
        while (v55 != v57);
        id v53 = obj;
        id v55 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
        if (v55) {
          continue;
        }
        break;
      }
    }

    if ([v37 count])
    {
      v63 = (NSArray *)[v37 copy];
      appExtensionDataContainers = v5->_appExtensionDataContainers;
      v5->_appExtensionDataContainers = v63;
    }
    v65 = [(MIInstallationJournalEntry *)v5 bundle];
    id v77 = v13;
    uint64_t v66 = [v65 appExtensionBundlesWithError:&v77];
    id v11 = v77;

    appExtensionBundles = v5->_appExtensionBundles;
    v5->_appExtensionBundles = (NSArray *)v66;

    if (!v5->_appExtensionBundles)
    {
      v70 = (void *)MIInstallerErrorDomain;
      v69 = [(MIInstallationJournalEntry *)v5 bundle];
      uint64_t v68 = sub_100014A08((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 395, v70, 186, v11, 0, @"Failed to locate app extension bundles in bundle %@.", v71, (uint64_t)v69);
      id v13 = v11;
LABEL_60:

      id v13 = (id)v68;
      v22 = v74;
      id v4 = v75;
      goto LABEL_14;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }

    id v4 = v75;
LABEL_6:
    id v12 = v5;
    id v13 = v11;
    goto LABEL_18;
  }
  sub_100014A08((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 372, MIInstallerErrorDomain, 186, v49, 0, @"Expected to find data container but lookup failed.", v51, v72);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v75;
LABEL_14:

  if (v5->_identity && MIIsValidInstallationDomain()) {
    [(id)objc_opt_class() _attemptLSUpdateWithDiscoveredStateForIdentity:v5->_identity domain:v5->_installationDomain];
  }
  [v4 failWithError:v13];
  id v12 = 0;
LABEL_18:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MIInstallationJournalEntry *)self identity];
  [v4 encodeObject:v5 forKey:@"identity"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:[(MIInstallationJournalEntry *)self journalPhase]];
  [v4 encodeObject:v6 forKey:@"journalPhase"];

  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:[(MIInstallationJournalEntry *)self attemptCount]];
  [v4 encodeObject:v7 forKey:@"attemptCount"];

  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:[(MIInstallationJournalEntry *)self installationDomain]];
  [v4 encodeObject:v8 forKey:@"installationDomain"];

  id v9 = +[NSNumber numberWithUnsignedInteger:[(MIInstallationJournalEntry *)self operationType]];
  [v4 encodeObject:v9 forKey:@"operationType"];

  uint64_t v10 = [(MIInstallationJournalEntry *)self installOptions];
  [v4 encodeObject:v10 forKey:@"installOptions"];

  id v11 = [(MIInstallationJournalEntry *)self journalEntryID];
  [v4 encodeObject:v11 forKey:@"journalEntryID"];

  id v12 = objc_alloc((Class)MIBundleContainerToken);
  id v13 = [(MIInstallationJournalEntry *)self bundleContainer];
  id v14 = [v12 initWithContainer:v13];

  [v4 encodeObject:v14 forKey:@"BundleContainerToken"];
  uint64_t v15 = [(MIInstallationJournalEntry *)self existingBundleContainer];
  uint64_t v34 = (void *)v15;
  if (v15)
  {
    id v16 = [objc_alloc((Class)MIBundleContainerToken) initWithContainer:v15];

    [v4 encodeObject:v16 forKey:@"ExistingBundleContainerToken"];
    id v14 = v16;
  }
  id v17 = [(MIInstallationJournalEntry *)self linkToParentBundleID];
  [v4 encodeObject:v17 forKey:@"linkToParentBundleID"];

  v18 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v19 = self->_noLongerPresentAppExtensionDataContainers;
  id v20 = [(NSArray *)v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [objc_alloc((Class)MIContainerToken) initWithContainer:*(void *)(*((void *)&v39 + 1) + 8 * (void)v23)];
        [v18 addObject:v24];

        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [(NSArray *)v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v21);
  }

  if ([v18 count]) {
    [v4 encodeObject:v18 forKey:@"NoLongerPresentContainerTokens"];
  }
  id v25 = objc_alloc((Class)MIContainerToken);
  uint64_t v26 = [(MIInstallationJournalEntry *)self dataContainer];
  id v27 = [v25 initWithContainer:v26];

  [v4 encodeObject:v27 forKey:@"DataContainerToken"];
  [v18 removeAllObjects];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v28 = self->_appExtensionDataContainers;
  id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      id v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = [objc_alloc((Class)MIContainerToken) initWithContainer:*(void *)(*((void *)&v35 + 1) + 8 * (void)v32)];
        [v18 addObject:v33];

        id v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v30 = [(NSArray *)v28 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v30);
  }

  if ([v18 count]) {
    [v4 encodeObject:v18 forKey:@"AppExtensionDataContainerTokens"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(MIInstallationJournalEntry *)self identity];
  [(MIInstallationJournalEntry *)self installationDomain];
  uint64_t v6 = MIStringForInstallationDomain();
  unint64_t v7 = [(MIInstallationJournalEntry *)self operationType];
  uint64_t v8 = sub_1000329FC([(MIInstallationJournalEntry *)self journalPhase]);
  id v9 = [(MIInstallationJournalEntry *)self bundle];
  uint64_t v10 = [v9 bundleVersion];
  id v11 = +[NSString stringWithFormat:@"<%@<%p> %@/%@ op:%lu phase:%@ version:%@>", v4, self, v5, v6, v7, v8, v10];

  return (NSString *)v11;
}

- (NSString)uniqueIdentifier
{
  v3 = [(MIInstallationJournalEntry *)self journalEntryID];
  id v4 = [v3 UUIDString];
  v5 = [(MIInstallationJournalEntry *)self identity];
  uint64_t v6 = [v5 bundleID];
  unint64_t v7 = +[NSString stringWithFormat:@"%@_%@", v4, v6];

  return (NSString *)v7;
}

- (BOOL)shouldPersist
{
  return (id)[(MIInstallationJournalEntry *)self operationType] == (id)5;
}

- (MIExecutableBundle)bundle
{
  unint64_t v2 = [(MIInstallationJournalEntry *)self bundleContainer];
  v3 = [v2 bundle];

  return (MIExecutableBundle *)v3;
}

- (BOOL)shouldModifyExistingContainers
{
  return (id)[(MIInstallationJournalEntry *)self operationType] != (id)3;
}

- (BOOL)isPlaceholderInstall
{
  unint64_t v2 = [(MIInstallationJournalEntry *)self installOptions];
  unint64_t v3 = (unint64_t)[v2 installTargetType];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_writeJournalEntryWithError:(id *)a3
{
  v5 = [(MIInstallationJournalEntry *)self _journalInstance];
  LOBYTE(a3) = [v5 writeJournalEntry:self withError:a3];

  return (char)a3;
}

- (void)_purgeJournalEntry
{
  id v3 = [(MIInstallationJournalEntry *)self _journalInstance];
  [v3 purgeJournalEntry:self withError:0];
}

- (BOOL)_updateJournalPhaseTo:(unint64_t)a3 withError:(id *)a4
{
  -[MIInstallationJournalEntry setJournalPhase:](self, "setJournalPhase:");
  id v14 = 0;
  BOOL v7 = [(MIInstallationJournalEntry *)self _writeJournalEntryWithError:&v14];
  id v8 = v14;
  if (!v7)
  {
    id v9 = (void *)MIInstallerErrorDomain;
    id v13 = [(MIInstallationJournalEntry *)self identity];
    id v11 = sub_100014A08((uint64_t)"-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]", 531, v9, 188, v8, 0, @"Failed to write updated journal with phase %lu for %@", v10, a3);

    if (a4)
    {
      id v8 = v11;
      *a4 = v8;
    }
    else
    {
      id v8 = v11;
    }
  }

  return v7;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (![(MIInstallationJournalEntry *)self shouldModifyExistingContainers]
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
      uint64_t v10 = [v6 identifier];
      id v11 = [v6 containerURL];
      id v14 = [v11 path];
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

- (BOOL)_linkToParentApplication:(id *)a3
{
  v5 = [(MIInstallationJournalEntry *)self linkToParentBundleID];
  if (v5)
  {
    id v6 = [(MIInstallationJournalEntry *)self _containerLinkManager];
    unsigned int v7 = [(MIInstallationJournalEntry *)self bundleContainer];
    id v8 = [v7 identifier];
    id v12 = 0;
    unsigned __int8 v9 = [v6 linkChild:v8 toParent:v5 error:&v12];
    id v10 = v12;

    if (a3 && (v9 & 1) == 0)
    {
      id v10 = v10;
      unsigned __int8 v9 = 0;
      *a3 = v10;
    }
  }
  else
  {
    id v10 = 0;
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (BOOL)_updateReferencesWithError:(id *)a3
{
  v5 = [(MIInstallationJournalEntry *)self _keychainAccessGroupTracker];
  id v6 = [(MIInstallationJournalEntry *)self _freeProfileValidatedAppTracker];
  unsigned int v7 = [(MIInstallationJournalEntry *)self existingBundleContainer];

  if (v7)
  {
    id v8 = [(MIInstallationJournalEntry *)self existingBundleContainer];
    unsigned __int8 v9 = [v8 bundle];
    id v10 = [(MIInstallationJournalEntry *)self bundleContainer];
    id v11 = [v10 bundle];
    id v32 = 0;
    unsigned __int8 v12 = [v5 updateReferencesWithOldBundle:v9 newBundle:v11 error:&v32];
    id v13 = v32;

    if ((v12 & 1) == 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v14 = [(MIInstallationJournalEntry *)self bundle];
        id v27 = [v14 identifier];
        id v28 = v13;
        MOLogWrite();
      }
      [v5 invalidateCache];
      id v13 = 0;
    }
LABEL_8:
    id v17 = [(MIInstallationJournalEntry *)self bundleSigningInfo];
    id v18 = [v17 profileValidationType];

    if (v18 == (id)3)
    {
      v19 = [(MIInstallationJournalEntry *)self bundleSigningInfo];
      id v20 = [v19 entitlements];
      id v21 = sub_10004CBB0(v20);

      if (v21)
      {
        uint64_t v22 = [(MIInstallationJournalEntry *)self bundle];
        id v30 = v13;
        unsigned int v23 = [v6 addReferenceForApplicationIdentifier:v21 bundle:v22 error:&v30];
        id v24 = v30;

        if (!v23)
        {
          BOOL v25 = 0;
LABEL_14:

          id v13 = v24;
          if (!a3) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        id v13 = v24;
      }
    }
    id v29 = v13;
    BOOL v25 = [(MIInstallationJournalEntry *)self _linkToParentApplication:&v29];
    id v24 = v29;
    id v21 = v13;
    goto LABEL_14;
  }
  id v15 = [(MIInstallationJournalEntry *)self bundle];
  id v31 = 0;
  unsigned int v16 = [v5 addReferencesForBundle:v15 error:&v31];
  id v13 = v31;

  if (v16) {
    goto LABEL_8;
  }
  BOOL v25 = 0;
  if (!a3) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v25) {
    *a3 = v13;
  }
LABEL_17:

  return v25;
}

- (BOOL)_commitContainersWithError:(id *)a3
{
  v5 = [(MIInstallationJournalEntry *)self dataContainer];
  id v6 = [(MIInstallationJournalEntry *)self bundle];
  unsigned int v7 = [v6 identifier];

  if (!v5 || [v5 status] == (id)3)
  {
    v46 = a3;
    id v8 = 0;
LABEL_4:
    v45 = v5;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    unsigned __int8 v9 = [(MIInstallationJournalEntry *)self appExtensionDataContainers];
    id v10 = [v9 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v57;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          id v55 = v8;
          unsigned int v15 = [(MIInstallationJournalEntry *)self _refreshUUIDForContainer:v14 withError:&v55];
          id v16 = v55;

          if (!v15)
          {
            LOBYTE(v23) = 0;
            goto LABEL_27;
          }
          if ([v14 status] == (id)3)
          {
            id v8 = v16;
          }
          else
          {
            id v54 = v16;
            unsigned int v17 = [v14 makeContainerLiveWithError:&v54];
            id v8 = v54;

            if (!v17)
            {
              LOBYTE(v23) = 0;
LABEL_26:
              id v16 = v8;
              goto LABEL_27;
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v56 objects:v63 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if ((id)[(MIInstallationJournalEntry *)self operationType] == (id)4)
    {
      id v18 = [(MIInstallationJournalEntry *)self bundle];
      unsigned int v19 = [v18 bundleType];

      v5 = v45;
      if (v19 == 1)
      {
        id v20 = [(MIInstallationJournalEntry *)self installOptions];
        id v21 = (char *)[v20 lsInstallType];

        if ((unint64_t)(v21 - 7) >= 3)
        {
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
          {
            uint64_t v22 = 3;
          }
          else
          {
            v44 = v21;
            uint64_t v22 = 3;
            MOLogWrite();
          }
        }
        else
        {
          uint64_t v22 = (v21 - 4);
        }
        id v30 = [(MIInstallationJournalEntry *)self existingBundleContainer];
        id v31 = [v30 bundle];
        unsigned int v32 = [v31 bundleType];

        if (v32 == 1)
        {
          id v33 = [(MIInstallationJournalEntry *)self _systemAppState];
          [v33 addIdentifier:v7 withState:v22];
        }
      }
      uint64_t v29 = 1;
    }
    else
    {
      id v28 = [(MIInstallationJournalEntry *)self existingBundleContainer];

      if (v28) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = 3;
      }
      v5 = v45;
    }
    uint64_t v34 = [(MIInstallationJournalEntry *)self installOptions];
    id v35 = [v34 waitForDeletion];

    long long v36 = [(MIInstallationJournalEntry *)self bundleContainer];
    long long v37 = [(MIInstallationJournalEntry *)self existingBundleContainer];
    id v53 = v8;
    unsigned int v23 = [v36 makeContainerLiveReplacingContainer:v37 reason:v29 waitForDeletion:v35 withError:&v53];
    id v16 = v53;

    if (!v23)
    {
LABEL_29:
      a3 = v46;
      if (!v46) {
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    if (!v5 || [v5 status] != (id)3)
    {
LABEL_49:
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      unsigned __int8 v9 = [(MIInstallationJournalEntry *)self appExtensionDataContainers];
      id v39 = [v9 countByEnumeratingWithState:&v48 objects:v62 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v49;
        do
        {
          for (j = 0; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v49 != v41) {
              objc_enumerationMutation(v9);
            }
            id v43 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
            if ([v43 status] == (id)3)
            {
              [v43 setParentBundleID:v7];
              id v47 = v16;
              unsigned int v23 = [v43 makeContainerLiveWithError:&v47];
              id v8 = v47;

              if (!v23) {
                goto LABEL_26;
              }
              id v16 = v8;
            }
          }
          id v40 = [v9 countByEnumeratingWithState:&v48 objects:v62 count:16];
          LOBYTE(v23) = 1;
        }
        while (v40);
LABEL_27:
        v5 = v45;
      }
      else
      {
        LOBYTE(v23) = 1;
      }

      goto LABEL_29;
    }
    id v52 = v16;
    unsigned int v38 = [v5 makeContainerLiveWithError:&v52];
    id v8 = v52;

    if (v38)
    {
      id v16 = v8;
      goto LABEL_49;
    }
LABEL_60:
    LOBYTE(v23) = 0;
    id v16 = v8;
    goto LABEL_29;
  }
  id v61 = 0;
  unsigned int v24 = [(MIInstallationJournalEntry *)self _refreshUUIDForContainer:v5 withError:&v61];
  id v25 = v61;
  id v16 = v25;
  if (v24)
  {
    v46 = a3;
    id v60 = v25;
    unsigned int v26 = [v5 makeContainerLiveWithError:&v60];
    id v8 = v60;

    if (!v26) {
      goto LABEL_60;
    }
    goto LABEL_4;
  }
  LOBYTE(v23) = 0;
  if (!a3) {
    goto LABEL_32;
  }
LABEL_30:
  if ((v23 & 1) == 0) {
    *a3 = v16;
  }
LABEL_32:

  return v23;
}

- (void)_updateContainerStatePostCommit
{
  unint64_t v2 = self;
  id v3 = [(MIInstallationJournalEntry *)self noLongerPresentAppExtensionDataContainers];
  if (![v3 count])
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_8;
  }
  id v74 = 0;
  unsigned __int8 v4 = +[MIContainer removeContainers:v3 waitForDeletion:0 error:&v74];
  id v5 = v74;
  if ((v4 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      long long v58 = v3;
      id v60 = v5;
      MOLogWrite();
    }

    goto LABEL_7;
  }
LABEL_8:
  if ([(MIInstallationJournalEntry *)v2 shouldModifyExistingContainers]
    && ![(MIInstallationJournalEntry *)v2 isPlaceholderInstall])
  {
    id v6 = [(MIInstallationJournalEntry *)v2 _containerProtectionManager];
    unsigned int v7 = [(MIInstallationJournalEntry *)v2 dataContainer];

    if (v7)
    {
      id v8 = [(MIInstallationJournalEntry *)v2 dataContainer];
      unsigned __int8 v9 = [(MIInstallationJournalEntry *)v2 bundle];
      [v6 setDataProtectionOnDataContainer:v8 forNewBundle:v9 retryIfLocked:1];
    }
    id v10 = [(MIInstallationJournalEntry *)v2 appExtensionBundles];
    id v11 = (char *)[v10 count];

    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        id v13 = [(MIInstallationJournalEntry *)v2 appExtensionDataContainers];
        id v14 = [v13 objectAtIndexedSubscript:i];

        unsigned int v15 = [(MIInstallationJournalEntry *)v2 appExtensionBundles];
        id v16 = [v15 objectAtIndexedSubscript:i];

        [v6 setDataProtectionOnDataContainer:v14 forNewBundle:v16 retryIfLocked:1];
      }
    }
  }
  v65 = v2;
  if (![(MIInstallationJournalEntry *)v2 isPlaceholderInstall])
  {
    id v63 = v5;
    v64 = v3;
    unsigned int v17 = [(MIInstallationJournalEntry *)v2 bundleSigningInfo];
    id v18 = [v17 entitlements];
    unsigned int v19 = sub_10004CF58(v18);

    id v20 = [(MIInstallationJournalEntry *)v2 bundleSigningInfo];
    id v21 = [v20 entitlements];
    uint64_t v22 = sub_10004CBB0(v21);

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v19;
    id v23 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (!v23) {
      goto LABEL_37;
    }
    id v24 = v23;
    uint64_t v25 = *(void *)v71;
    uint64_t v66 = MIContainerManagerErrorDomain;
    while (1)
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v71 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v70 + 1) + 8 * (void)j);
        id v69 = 0;
        id v28 = +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v27, 0, 0, &v69, v59, v61, v62);
        id v29 = v69;
        id v30 = v29;
        if (v28)
        {
LABEL_23:
          id v31 = (id)[(MIInstallationJournalEntry *)v2 _promoteKeychainItemsForAppClipWithAppIdentifier:v27 toParentAppWithAppIdentifier:v22];
          if (v31 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
          {
            id v61 = v22;
            id v62 = v31;
            uint64_t v59 = v27;
LABEL_34:
            MOLogWrite();
            goto LABEL_35;
          }
          goto LABEL_35;
        }
        unsigned int v32 = [v29 domain];
        if ([v32 isEqualToString:v66])
        {
          id v33 = [v30 code];

          BOOL v34 = v33 == (id)21;
          unint64_t v2 = v65;
          if (v34) {
            goto LABEL_23;
          }
        }
        else
        {
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          uint64_t v59 = v27;
          id v61 = v30;
          goto LABEL_34;
        }
LABEL_35:
      }
      id v24 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      if (!v24)
      {
LABEL_37:

        id v5 = v63;
        id v3 = v64;
        break;
      }
    }
  }
  id v35 = [(MIInstallationJournalEntry *)v2 _uninstalledAppList];
  long long v36 = [(MIInstallationJournalEntry *)v2 bundle];
  long long v37 = [v36 identifier];
  v75 = v37;
  unsigned int v38 = +[NSArray arrayWithObjects:&v75 count:1];
  [v35 removeIdentifiers:v38];

  id v39 = v65;
  id v40 = [(MIInstallationJournalEntry *)v65 bundle];
  if ([v40 bundleType] == 1)
  {
    id v41 = [(MIInstallationJournalEntry *)v65 operationType];

    if (v41 == (id)4) {
      goto LABEL_42;
    }
    id v40 = [(MIInstallationJournalEntry *)v65 _systemAppState];
    long long v42 = [(MIInstallationJournalEntry *)v65 bundle];
    id v43 = [v42 identifier];
    [v40 addIdentifier:v43 withState:1];

    id v39 = v65;
  }

LABEL_42:
  id v44 = [(MIInstallationJournalEntry *)v39 bundle];
  if ([v44 isPlaceholder])
  {
LABEL_43:

    goto LABEL_50;
  }
  v45 = [(MIInstallationJournalEntry *)v39 bundleContainer];
  v46 = [v45 compatibilityLinkDestination];

  if (v46)
  {
    uint64_t v47 = [(MIInstallationJournalEntry *)v39 dataContainer];
    if (v47)
    {
      id v44 = (id)v47;
      uint64_t v48 = [(MIInstallationJournalEntry *)v39 bundleContainer];
      if (v48)
      {
        long long v49 = (void *)v48;
        long long v50 = [(MIInstallationJournalEntry *)v39 bundle];
        unsigned int v51 = [v50 bundleType];

        if (v51 != 4) {
          goto LABEL_50;
        }
        id v52 = [(MIInstallationJournalEntry *)v39 _helperServiceClient];
        id v53 = [(MIInstallationJournalEntry *)v39 bundle];
        id v54 = [v53 identifier];
        id v55 = [(MIInstallationJournalEntry *)v39 identity];
        long long v56 = [v55 personaUniqueString];
        id v68 = v5;
        unsigned __int8 v57 = [v52 makeSymlinkFromAppDataContainerToBundleForIdentifier:v54 forPersona:v56 withError:&v68];
        id v44 = v68;

        if (v57)
        {
          id v5 = v44;
          goto LABEL_50;
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
          MOLogWrite();
        }
        id v5 = 0;
      }
      goto LABEL_43;
    }
  }
LABEL_50:
}

- (BOOL)_gatherLaunchServicesRegistrationInfoWithError:(id *)a3
{
  id v35 = objc_opt_new();
  id v5 = [(MIInstallationJournalEntry *)self bundleContainer];
  id v6 = [(MIInstallationJournalEntry *)self bundle];
  BOOL v34 = [v6 identifier];

  uint64_t v7 = [(MIInstallationJournalEntry *)self progressBlock];
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, const __CFString *, uint64_t))(v7 + 16))(v7, @"GeneratingApplicationMap", 90);
  }
  id v9 = objc_alloc((Class)MIInstalledInfoGatherer);
  id v10 = [(MIInstallationJournalEntry *)self dataContainer];
  id v11 = [v9 initWithBundleContainer:v5 dataContainer:v10];

  id v37 = 0;
  uint64_t v12 = [v11 bundleRecordWithError:&v37];
  id v13 = v37;
  if (!v12)
  {
    unsigned int v26 = 0;
    if (a3)
    {
LABEL_17:
      id v13 = v13;
      BOOL v27 = 0;
      *a3 = v13;
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  unsigned int v32 = a3;
  [v35 addObject:v12];
  id v14 = [(MIInstallationJournalEntry *)self appExtensionBundles];
  unsigned int v15 = (char *)[v14 count];

  id v16 = [(MIInstallationJournalEntry *)self appExtensionDataContainers];
  unsigned int v17 = (char *)[v16 count];

  id v33 = v8;
  if (v15 != v17)
  {
    sub_100014A08((uint64_t)"-[MIInstallationJournalEntry _gatherLaunchServicesRegistrationInfoWithError:]", 900, MIInstallerErrorDomain, 4, 0, 0, @"Have %ld app extensions and %ld app extension data containers; they should be equal.",
      v18,
      (uint64_t)v15);
    id v23 = v13;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  id v31 = v5;
  if (v15)
  {
    unsigned int v19 = 0;
    while (1)
    {
      id v20 = v11;
      id v21 = v13;
      uint64_t v22 = [(MIInstallationJournalEntry *)self appExtensionBundles];
      id v23 = [v22 objectAtIndexedSubscript:v19];

      id v24 = [(MIInstallationJournalEntry *)self appExtensionDataContainers];
      uint64_t v25 = [v24 objectAtIndexedSubscript:v19];

      id v11 = [objc_alloc((Class)MIInstalledInfoGatherer) initWithAppExtensionBundle:v23 inBundleIdentifier:v34 dataContainer:v25];
      id v36 = v21;
      unsigned int v26 = [v11 bundleRecordWithError:&v36];
      id v13 = v36;

      if (!v26) {
        break;
      }
      [v35 addObject:v26];

      ++v19;
      uint64_t v12 = v26;
      if (v15 == v19) {
        goto LABEL_14;
      }
    }

    uint64_t v12 = 0;
    id v5 = v31;
LABEL_16:

    unsigned int v26 = v12;
    a3 = v32;
    id v8 = v33;
    if (v32) {
      goto LABEL_17;
    }
LABEL_11:
    BOOL v27 = 0;
    goto LABEL_18;
  }
  unsigned int v26 = v12;
LABEL_14:
  id v28 = (NSArray *)[v35 copy];
  bundleRecordsToRegister = self->_bundleRecordsToRegister;
  self->_bundleRecordsToRegister = v28;

  BOOL v27 = 1;
  id v5 = v31;
  id v8 = v33;
LABEL_18:

  return v27;
}

- (BOOL)_beginLaunchServicesRegistrationWithError:(id *)a3
{
  unint64_t v5 = [(MIInstallationJournalEntry *)self installationDomain];
  id v6 = [(MIInstallationJournalEntry *)self identity];
  uint64_t v7 = [(MIInstallationJournalEntry *)self _registerInstalledInfo:self->_bundleRecordsToRegister forIdentity:v6 inDomain:v5 error:a3];
  if (v7) {
    objc_storeStrong((id *)&self->_recordPromise, v7);
  }

  return v7 != 0;
}

- (BOOL)_performJournaledInstallAsReplay:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  unint64_t v7 = [(MIInstallationJournalEntry *)self attemptCount];
  if (v7 < 6)
  {
    unint64_t v19 = [(MIInstallationJournalEntry *)self journalPhase];
    id v12 = 0;
    id v20 = 0;
    BOOL v13 = 0;
    switch(v19)
    {
      case 1uLL:
        id v43 = 0;
        unsigned int v21 = [(MIInstallationJournalEntry *)self _updateJournalPhaseTo:2 withError:&v43];
        id v12 = v43;
        if (!v21) {
          goto LABEL_9;
        }
        goto LABEL_22;
      case 2uLL:
LABEL_22:
        uint64_t v22 = v12;
        id v42 = v12;
        unsigned int v23 = [(MIInstallationJournalEntry *)self _updateReferencesWithError:&v42];
        id v12 = v42;

        if (!v23) {
          goto LABEL_9;
        }
        id v41 = v12;
        unsigned int v14 = [(MIInstallationJournalEntry *)self _commitContainersWithError:&v41];
        id v20 = v41;

        if (!v14)
        {
          BOOL v13 = 1;
          id v12 = v20;
          goto LABEL_11;
        }
        if (![(MIInstallationJournalEntry *)self _updateJournalPhaseTo:3 withError:0]&& (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
        {
          id v35 = [(MIInstallationJournalEntry *)self identity];
          MOLogWrite();
        }
        BOOL v13 = 1;
LABEL_29:
        [(MIInstallationJournalEntry *)self _updateContainerStatePostCommit];
        if (![(MIInstallationJournalEntry *)self _updateJournalPhaseTo:4 withError:0]&& (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
        {
          id v36 = [(MIInstallationJournalEntry *)self identity];
          MOLogWrite();
        }
        id v40 = v20;
        unsigned int v14 = -[MIInstallationJournalEntry _gatherLaunchServicesRegistrationInfoWithError:](self, "_gatherLaunchServicesRegistrationInfoWithError:", &v40, v36);
        id v12 = v40;

        if (!v14 || !v5) {
          goto LABEL_11;
        }
LABEL_35:
        if (!v5
          && ![(MIInstallationJournalEntry *)self _updateJournalPhaseTo:5 withError:0]&& (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
        {
          id v35 = [(MIInstallationJournalEntry *)self identity];
          MOLogWrite();
        }
LABEL_40:
        id v24 = v12;
        id v39 = v12;
        unsigned int v25 = -[MIInstallationJournalEntry _beginLaunchServicesRegistrationWithError:](self, "_beginLaunchServicesRegistrationWithError:", &v39, v35);
        id v12 = v39;

        BOOL v13 = v13;
        if (v25)
        {
          [(MIInstallationJournalEntry *)self setJournalPhase:6];
          [(MIInstallationJournalEntry *)self _purgeJournalEntry];
          goto LABEL_19;
        }
        break;
      case 3uLL:
        goto LABEL_29;
      case 4uLL:
        goto LABEL_35;
      case 5uLL:
        goto LABEL_40;
      case 6uLL:
        unsigned int v32 = (void *)MIInstallerErrorDomain;
        id v33 = [(MIInstallationJournalEntry *)self identity];
        sub_100014A08((uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", 1060, v32, 4, 0, 0, @"Called again after install journal entry was already complete for %@", v34, (uint64_t)v33);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      case 7uLL:
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          id v37 = [(MIInstallationJournalEntry *)self identity];
          MOLogWrite();
        }
        id v12 = 0;
        goto LABEL_19;
      default:
        uint64_t v29 = v19;
        id v30 = (void *)MIInstallerErrorDomain;
        id v10 = [(MIInstallationJournalEntry *)self identity];
        sub_100014A08((uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", 1070, v30, 4, 0, 0, @"Unknown journal phase %lu when finalizing %@", v31, v29);
        goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = v7;
    [(MIInstallationJournalEntry *)self _purgeJournalEntry];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100059548(self, v8);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v35 = [(MIInstallationJournalEntry *)self identity];
      uint64_t v38 = v8;
      MOLogWrite();
    }
    id v9 = (void *)MIInstallerErrorDomain;
    id v10 = [(MIInstallationJournalEntry *)self identity];
    sub_100014A08((uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", 972, v9, 4, 0, 0, @"Tried %lu times to replay journal entry for %@; assuming something is wrong; failing.",
      v11,
      v8);
LABEL_8:
    id v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    BOOL v13 = 0;
  }
  unsigned int v14 = 0;
LABEL_11:
  if (a4 && (v14 & 1) == 0) {
    *a4 = v12;
  }
  if (v13 || v5) && ((v14 ^ 1))
  {
    unsigned int v15 = [(MIInstallationJournalEntry *)self existingBundleContainer];

    if (v15)
    {
      id v16 = objc_opt_class();
      unsigned int v17 = [(MIInstallationJournalEntry *)self identity];
      [v16 _attemptLSUpdateWithDiscoveredStateForIdentity:v17 domain:[self installationDomain]];
    }
  }
  if (v14)
  {
LABEL_19:
    BOOL v18 = 1;
  }
  else
  {
    unsigned int v26 = [(MIInstallationJournalEntry *)self _keychainAccessGroupTracker];
    [v26 invalidateCache];

    BOOL v27 = [(MIInstallationJournalEntry *)self _freeProfileValidatedAppTracker];
    [v27 invalidateCache];

    [(MIInstallationJournalEntry *)self _purgeJournalEntry];
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)finalizeContainersWithError:(id *)a3
{
  unint64_t v5 = [(MIInstallationJournalEntry *)self journalPhase];
  if (v5 == 1)
  {
    id v12 = 0;
    BOOL v6 = [(MIInstallationJournalEntry *)self _performJournaledInstallAsReplay:0 withError:&v12];
    id v7 = v12;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = (void *)MIInstallerErrorDomain;
    id v9 = sub_1000329FC(v5);
    sub_100014A08((uint64_t)"-[MIInstallationJournalEntry finalizeContainersWithError:]", 1108, v8, 4, 0, 0, @"Finalize called on journal entry in unexpected state; found journal phase %@, should have been %@",
      v10,
      (uint64_t)v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a3 = v7;
  }
LABEL_7:

  return v6;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  unint64_t v5 = [(MIInstallationJournalEntry *)self journalPhase];
  if (v5 == 4)
  {
    id v12 = 0;
    BOOL v6 = [(MIInstallationJournalEntry *)self _performJournaledInstallAsReplay:0 withError:&v12];
    id v7 = v12;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v8 = (void *)MIInstallerErrorDomain;
    id v9 = sub_1000329FC(v5);
    sub_100014A08((uint64_t)"-[MIInstallationJournalEntry performLaunchServicesRegistrationWithError:]", 1132, v8, 4, 0, 0, @"Asked to register journal entry with LaunchServices in unexpected state; found journal phase %@, should have been %@",
      v10,
      (uint64_t)v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v6 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    *a3 = v7;
  }
LABEL_7:

  return v6;
}

- (BOOL)finalizeWithError:(id *)a3
{
  if ((id)[(MIInstallationJournalEntry *)self journalPhase] == (id)7)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    return 1;
  }
  else
  {
    return [(MIInstallationJournalEntry *)self _performJournaledInstallAsReplay:1 withError:a3];
  }
}

- (BOOL)stageUpdateForLater:(id *)a3
{
  id v12 = 0;
  unsigned int v5 = [(MIInstallationJournalEntry *)self _updateJournalPhaseTo:7 withError:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = [(MIInstallationJournalEntry *)self bundleContainer];
    id v11 = v6;
    unsigned __int8 v8 = [v7 markContainerAsStagedUpdateContainer:&v11];
    id v9 = v11;

    id v6 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if ((v8 & 1) == 0) {
    *a3 = v6;
  }
LABEL_7:

  return v8;
}

- (BOOL)makeStagedBackgroundUpdateLive:(id *)a3
{
  id v12 = 0;
  unsigned int v5 = [(MIInstallationJournalEntry *)self _updateJournalPhaseTo:2 withError:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5)
  {
    id v11 = v6;
    BOOL v8 = [(MIInstallationJournalEntry *)self _performJournaledInstallAsReplay:0 withError:&v11];
    id v9 = v11;

    id v7 = v9;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v8) {
    *a3 = v7;
  }
LABEL_7:

  return v8;
}

- (BOOL)cleanUpJournaledDataOnDiskWithError:(id *)a3
{
  unsigned int v5 = [(MIInstallationJournalEntry *)self bundleContainer];
  id v6 = objc_opt_new();
  char v33 = 0;
  id v32 = 0;
  unsigned __int8 v7 = [v5 isStagedUpdateContainer:&v33 withError:&v32];
  id v8 = v32;
  if ((v7 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v24 = v5;
      id v25 = v8;
      MOLogWrite();
    }
    char v33 = 1;
LABEL_8:
    id v31 = v8;
    unsigned int v9 = [v5 clearStagedUpdateContainerStatusWithError:&v31, v24, v25];
    id v10 = v31;

    id v8 = v10;
    if (!v9) {
      goto LABEL_27;
    }
    goto LABEL_9;
  }
  if (v33) {
    goto LABEL_8;
  }
LABEL_9:
  if ([v5 isTransient]) {
    [v6 addObject:v5];
  }
  id v11 = [(MIInstallationJournalEntry *)self dataContainer];
  unsigned int v12 = [v11 isTransient];

  if (v12)
  {
    BOOL v13 = [(MIInstallationJournalEntry *)self dataContainer];
    [v6 addObject:v13];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned int v14 = [(MIInstallationJournalEntry *)self appExtensionDataContainers];
  id v15 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        unint64_t v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v19 isTransient]) {
          [v6 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v16);
  }

  if (![v6 count])
  {
    BOOL v22 = 1;
    goto LABEL_30;
  }
  id v26 = v8;
  unsigned __int8 v20 = +[MIContainer removeContainers:v6 waitForDeletion:0 error:&v26];
  id v21 = v26;

  if (v20)
  {
    BOOL v22 = 1;
    id v8 = v21;
    goto LABEL_30;
  }
  id v8 = v21;
LABEL_27:
  if (a3)
  {
    id v8 = v8;
    BOOL v22 = 0;
    *a3 = v8;
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_30:

  return v22;
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (MIInstallOptions)installOptions
{
  return self->_installOptions;
}

- (MICodeSigningInfo)bundleSigningInfo
{
  return self->_bundleSigningInfo;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (NSString)linkToParentBundleID
{
  return self->_linkToParentBundleID;
}

- (void)setLinkToParentBundleID:(id)a3
{
}

- (NSArray)noLongerPresentAppExtensionDataContainers
{
  return self->_noLongerPresentAppExtensionDataContainers;
}

- (void)setNoLongerPresentAppExtensionDataContainers:(id)a3
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

- (NSArray)bundleRecordsToRegister
{
  return self->_bundleRecordsToRegister;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (NSUUID)journalEntryID
{
  return self->_journalEntryID;
}

- (unint64_t)journalPhase
{
  return self->_journalPhase;
}

- (void)setJournalPhase:(unint64_t)a3
{
  self->_journalPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalEntryID, 0);
  objc_storeStrong((id *)&self->_recordPromise, 0);
  objc_storeStrong((id *)&self->_bundleRecordsToRegister, 0);
  objc_storeStrong((id *)&self->_appExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_appExtensionBundles, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_noLongerPresentAppExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_linkToParentBundleID, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_bundleSigningInfo, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_existingBundleContainer, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end