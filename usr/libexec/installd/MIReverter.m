@interface MIReverter
+ (id)reverterForAppIdentity:(id)a3 withOptions:(id)a4 forClient:(id)a5;
- (BOOL)_finalizeInstallationWithError:(id *)a3;
- (BOOL)_performInstallationWithError:(id *)a3;
- (BOOL)_performPreflightWithError:(id *)a3;
- (BOOL)_performVerificationWithError:(id *)a3;
- (BOOL)_postFlightAppExtensionsWithError:(id *)a3;
- (BOOL)_postFlightInstallationWithError:(id *)a3;
- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4;
- (BOOL)_validateAndEstablishLinkToParentContainer:(id *)a3;
- (BOOL)isLocked;
- (BOOL)performRevertWithError:(id *)a3;
- (LSRecordPromise)recordPromise;
- (MIAppIdentity)identity;
- (MIBundleContainer)bundleContainer;
- (MIBundleContainer)existingBundleContainer;
- (MIClientConnection)client;
- (MIDataContainer)dataContainer;
- (MIStashedBundleContainer)stashedContainer;
- (NSArray)appExtensionBundles;
- (NSArray)receipt;
- (NSDictionary)options;
- (NSMutableArray)appExtensionDataContainers;
- (id)_launchServicesBundleRecordsWithError:(id *)a3;
- (id)_validateBundle:(id)a3 error:(id *)a4;
- (id)initForAppIdentity:(id)a3 options:(id)a4 forClient:(id)a5;
- (void)_fireCallbackWithStatus:(id)a3;
- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)dealloc;
- (void)setAppExtensionBundles:(id)a3;
- (void)setAppExtensionDataContainers:(id)a3;
- (void)setBundleContainer:(id)a3;
- (void)setClient:(id)a3;
- (void)setDataContainer:(id)a3;
- (void)setExistingBundleContainer:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setStashedContainer:(id)a3;
@end

@implementation MIReverter

+ (id)reverterForAppIdentity:(id)a3 withOptions:(id)a4 forClient:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)objc_opt_class()) initForAppIdentity:v9 options:v8 forClient:v7];

  return v10;
}

- (id)initForAppIdentity:(id)a3 options:(id)a4 forClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MIReverter;
  v12 = [(MIReverter *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_client, v11);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a3);
  }

  return p_isa;
}

- (void)dealloc
{
  v3 = [(MIReverter *)self bundleContainer];
  sub_10000F42C(v3);

  v4 = [(MIReverter *)self dataContainer];
  sub_10000F42C(v4);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(MIReverter *)self appExtensionDataContainers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        sub_10000F42C(*(void **)(*((void *)&v13 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([(MIReverter *)self isLocked])
  {
    id v10 = [(MIReverter *)self identity];
    id v11 = [v10 bundleID];
    sub_1000550D8();
  }
  v12.receiver = self;
  v12.super_class = (Class)MIReverter;
  [(MIReverter *)&v12 dealloc];
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(MIReverter *)self client];
  [v7 sendProgressWithStatus:v6 percentComplete:v4];
}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(MIReverter *)self client];
  [v5 sendProgressWithStatus:v4];
}

- (BOOL)_performPreflightWithError:(id *)a3
{
  id v5 = [(MIReverter *)self identity];
  id v6 = [v5 bundleID];

  [(MIReverter *)self _fireCallbackWithStatus:@"PreflightingApplication" percentComplete:30];
  id v20 = 0;
  id v7 = +[MIBundleContainer appBundleContainerWithIdentifier:v6 createIfNeeded:0 created:0 error:&v20];
  id v9 = v20;
  if (!v7)
  {
    sub_100014A08((uint64_t)"-[MIReverter _performPreflightWithError:]", 138, MIInstallerErrorDomain, 26, v9, 0, @"Could not locate an existing installed app with bundle ID %@ to revert", v8, (uint64_t)v6);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

    id v10 = 0;
    goto LABEL_8;
  }
  [(MIReverter *)self setExistingBundleContainer:v7];
  id v19 = v9;
  id v10 = [v7 stashedBundleContainerWithError:&v19];
  id v11 = v19;

  if (!v10)
  {
    sub_100014A08((uint64_t)"-[MIReverter _performPreflightWithError:]", 145, MIInstallerErrorDomain, 167, v11, 0, @"Installed app with bundle ID %@ did not have a stashed version", v12, (uint64_t)v6);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v11;
    goto LABEL_7;
  }
  [(MIReverter *)self setStashedContainer:v10];
  long long v13 = [v10 bundle];
  id v18 = v11;
  long long v14 = [v13 appExtensionBundlesWithError:&v18];
  id v15 = v18;

  if (v14)
  {
    [(MIReverter *)self setAppExtensionBundles:v14];

    BOOL v16 = 1;
    goto LABEL_11;
  }
LABEL_8:
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
LABEL_11:

  return v16;
}

- (id)_validateBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v20 = 0;
  id v7 = [v6 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 checkingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:&v20];
  id v8 = v20;
  id v9 = v8;
  if (v7)
  {
    if ([v6 codeSignatureVerificationState] != (id)2)
    {
      id v15 = (void *)MIInstallerErrorDomain;
      id v16 = [v6 codeSignatureVerificationState];
      sub_100014A08((uint64_t)"-[MIReverter _validateBundle:error:]", 181, v15, 4, 0, 0, @"Unexpectedly failed to validate code signing (status %lu) for %@", v17, (uint64_t)v16);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      if (a4) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    id v10 = [(MIReverter *)self identity];
    id v11 = [v10 personaUniqueString];
    id v19 = v9;
    unsigned int v12 = [v6 hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:v7 forPersona:v11 error:&v19];
    id v13 = v19;

    if (v12)
    {
      id v14 = v7;
      goto LABEL_10;
    }
  }
  else
  {
    id v13 = v8;
  }
  if (a4)
  {
LABEL_7:
    id v13 = v13;
    id v14 = 0;
    *a4 = v13;
    goto LABEL_10;
  }
LABEL_9:
  id v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)_performVerificationWithError:(id *)a3
{
  [(MIReverter *)self _fireCallbackWithStatus:@"VerifyingApplication" percentComplete:40];
  id v5 = [(MIReverter *)self stashedContainer];
  id v6 = [v5 bundle];
  id v24 = 0;
  id v7 = [(MIReverter *)self _validateBundle:v6 error:&v24];
  id v8 = v24;

  if (!v7)
  {
    BOOL v17 = 0;
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [(MIReverter *)self appExtensionBundles];
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      id v13 = 0;
      id v14 = v8;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v13);
        id v19 = v14;
        id v16 = [(MIReverter *)self _validateBundle:v15 error:&v19];
        id v8 = v19;

        if (!v16)
        {
          BOOL v17 = 0;
          goto LABEL_12;
        }
        id v13 = (char *)v13 + 1;
        id v14 = v8;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_12:

  if (a3)
  {
LABEL_15:
    if (!v17) {
      *a3 = v8;
    }
  }
LABEL_17:

  return v17;
}

- (BOOL)_validateAndEstablishLinkToParentContainer:(id *)a3
{
  id v5 = [(MIReverter *)self bundleContainer];
  id v17 = 0;
  id v6 = [v5 bundleMetadataWithError:&v17];
  id v7 = v17;

  if (v6)
  {
    id v8 = [(MIReverter *)self existingBundleContainer];
    id v16 = v7;
    id v9 = [v8 bundleMetadataWithError:&v16];
    id v10 = v16;

    if (v9)
    {
      id v11 = [v9 linkedChildBundleIDs];
      [v6 setLinkedChildBundleIDs:v11];

      uint64_t v12 = [(MIReverter *)self bundleContainer];
      id v15 = v10;
      unsigned __int8 v13 = [v12 saveBundleMetadata:v6 withError:&v15];
      id v7 = v15;

      if (!a3) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    unsigned __int8 v13 = 0;
    id v7 = v10;
    if (a3)
    {
LABEL_14:
      if ((v13 & 1) == 0) {
        *a3 = v7;
      }
    }
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    unsigned __int8 v13 = 0;
    if (a3) {
      goto LABEL_14;
    }
  }
LABEL_16:

  return v13;
}

- (BOOL)_performInstallationWithError:(id *)a3
{
  [(MIReverter *)self _fireCallbackWithStatus:@"CreatingContainer" percentComplete:50];
  id v5 = [(MIReverter *)self identity];
  id v6 = [v5 bundleID];
  id v18 = 0;
  id v7 = +[MIBundleContainer tempAppBundleContainerWithIdentifier:v6 error:&v18];
  id v8 = v18;

  if (v7)
  {
    [(MIReverter *)self setBundleContainer:v7];
    [(MIReverter *)self _fireCallbackWithStatus:@"InstallingApplication" percentComplete:60];
    id v10 = [(MIReverter *)self stashedContainer];
    id v17 = v8;
    unsigned int v11 = [v7 cloneContentFromStashedBundleContainer:v10 error:&v17];
    id v12 = v17;

    if (!v11)
    {
      BOOL v13 = 0;
      if (!a3) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    id v16 = v12;
    BOOL v13 = [(MIReverter *)self _validateAndEstablishLinkToParentContainer:&v16];
    id v8 = v12;
    id v12 = v16;
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIReverter _performInstallationWithError:]", 279, MIInstallerErrorDomain, 21, v8, &off_100097560, @"Failed to create container", v9, v15);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v13 = 0;
  }

  if (!a3) {
    goto LABEL_10;
  }
LABEL_8:
  if (!v13) {
    *a3 = v12;
  }
LABEL_10:

  return v13;
}

- (BOOL)_postFlightAppExtensionsWithError:(id *)a3
{
  id v5 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v31 = self;
  id obj = [(MIReverter *)self appExtensionBundles];
  id v6 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    v28 = a3;
    id v8 = 0;
    uint64_t v30 = *(void *)v35;
LABEL_3:
    uint64_t v9 = 0;
    id v10 = v8;
    while (1)
    {
      if (*(void *)v35 != v30) {
        objc_enumerationMutation(obj);
      }
      unsigned int v11 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v9);
      id v33 = 0;
      unsigned __int8 v12 = [v11 updateMCMWithCodeSigningInfoAsAdvanceCopy:1 withError:&v33];
      id v13 = v33;
      if ((v12 & 1) == 0) {
        break;
      }
      id v14 = v5;
      uint64_t v15 = [(MIReverter *)v31 identity];
      id v16 = [v15 personaUniqueString];
      id v32 = v10;
      id v17 = [v11 dataContainerCreatingIfNeeded:1 forPersona:v16 makeLive:0 created:0 error:&v32];
      id v8 = v32;

      if (!v17)
      {
        long long v23 = (void *)MIInstallerErrorDomain;
        long long v21 = [v11 identifier];
        sub_100014A08((uint64_t)"-[MIReverter _postFlightAppExtensionsWithError:]", 332, v23, 21, v8, &off_100097588, @"Failed to create app extension data container for  %@", v24, (uint64_t)v21);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        id v10 = v8;
        id v5 = v14;
LABEL_18:

        if (v28)
        {
          id v19 = v19;
          BOOL v18 = 0;
          id *v28 = v19;
        }
        else
        {
          BOOL v18 = 0;
        }
        goto LABEL_21;
      }
      id v5 = v14;
      [v14 addObject:v17];

      uint64_t v9 = (char *)v9 + 1;
      id v10 = v8;
      if (v7 == v9)
      {
        id v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      v26 = [v11 identifier];
      id v27 = v13;
      MOLogWrite();
    }
    long long v20 = (void *)MIInstallerErrorDomain;
    long long v21 = [v11 identifier:v26, v27];
    [v11 isPlaceholder];
    sub_100014A08((uint64_t)"-[MIReverter _postFlightAppExtensionsWithError:]", 325, v20, 110, v13, 0, @"Failed to set app extension code signing info with container manager for %@, isPlaceholder: %c", v22, (uint64_t)v21);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  id v8 = 0;
LABEL_12:

  [(MIReverter *)v31 setAppExtensionDataContainers:v5];
  BOOL v18 = 1;
  id v19 = v8;
LABEL_21:

  return v18;
}

- (BOOL)_postFlightInstallationWithError:(id *)a3
{
  id v5 = [(MIReverter *)self identity];
  id v6 = [v5 bundleID];
  [(MIReverter *)self _fireCallbackWithStatus:@"PostflightingApplication" percentComplete:70];
  id v7 = [(MIReverter *)self bundleContainer];
  id v8 = [v7 bundle];

  if ([v8 needsDataContainer])
  {
    uint64_t v9 = [v5 personaUniqueString];
    id v17 = 0;
    id v10 = [v8 dataContainerCreatingIfNeeded:1 forPersona:v9 makeLive:0 created:0 error:&v17];
    id v11 = v17;

    if (!v10)
    {
      sub_100014A08((uint64_t)"-[MIReverter _postFlightInstallationWithError:]", 371, MIInstallerErrorDomain, 4, v11, 0, @"Failed to locate data container for stashed app %@", v12, (uint64_t)v6);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = 0;
      goto LABEL_7;
    }
    [(MIReverter *)self setDataContainer:v10];
  }
  else
  {
    id v11 = 0;
  }
  id v16 = v11;
  BOOL v13 = [(MIReverter *)self _postFlightAppExtensionsWithError:&v16];
  id v14 = v16;
LABEL_7:

  if (a3 && !v13) {
    *a3 = v14;
  }

  return v13;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if ([v5 status] != (id)1)
  {
    id v8 = 0;
LABEL_7:
    BOOL v11 = 1;
    goto LABEL_8;
  }
  id v14 = 0;
  unsigned int v6 = [v5 regenerateDirectoryUUIDWithError:&v14];
  id v7 = v14;
  id v8 = v7;
  if (v6)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      uint64_t v9 = [v5 identifier];
      id v10 = [v5 containerURL];
      BOOL v13 = [v10 path];
      MOLogWrite();
    }
    goto LABEL_7;
  }
  if (a4)
  {
    id v8 = v7;
    BOOL v11 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_8:

  return v11;
}

- (BOOL)_finalizeInstallationWithError:(id *)a3
{
  v3 = self;
  id v4 = [(MIReverter *)self bundleContainer];
  id v5 = [v4 bundle];

  unsigned int v6 = +[NSMutableArray arrayWithCapacity:0];
  [(MIReverter *)v3 _fireCallbackWithStatus:@"SandboxingApplication" percentComplete:80];
  id v7 = [(MIReverter *)v3 existingBundleContainer];

  v93 = v3;
  if (v7)
  {
    v91 = v6;
    id v8 = [(MIReverter *)v3 existingBundleContainer];
    uint64_t v9 = [v8 bundle];

    id v119 = 0;
    id v10 = [v9 appExtensionBundlesWithError:&v119];
    id v11 = v119;
    if (v10)
    {
      v89 = v10;
      uint64_t v12 = +[NSMutableArray arrayWithCapacity:0];
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      BOOL v13 = [(MIReverter *)v3 appExtensionBundles];
      id v14 = [v13 countByEnumeratingWithState:&v115 objects:v123 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v116;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v116 != v16) {
              objc_enumerationMutation(v13);
            }
            BOOL v18 = [*(id *)(*((void *)&v115 + 1) + 8 * i) identifier];
            [v12 addObject:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v115 objects:v123 count:16];
        }
        while (v15);
      }
      v88 = v5;

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v10 = v89;
      id obj = v89;
      id v19 = [obj countByEnumeratingWithState:&v111 objects:v122 count:16];
      if (v19)
      {
        id v20 = v19;
        v87 = v9;
        uint64_t v21 = *(void *)v112;
        do
        {
          uint64_t v22 = 0;
          long long v23 = v11;
          do
          {
            if (*(void *)v112 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v111 + 1) + 8 * (void)v22);
            v25 = [v24 identifier:v83:v85];
            unsigned __int8 v26 = [v12 containsObject:v25];

            if (v26)
            {
              id v11 = v23;
            }
            else
            {
              id v27 = [(MIReverter *)v93 identity];
              v28 = [v27 personaUniqueString];
              id v110 = v23;
              v29 = [v24 dataContainerCreatingIfNeeded:0 forPersona:v28 makeLive:0 created:0 error:&v110];
              id v11 = v110;

              if (v29)
              {
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
                {
                  v83 = [v24 identifier];
                  MOLogWrite();
                }
                [v91 addObject:v29, v83];
              }
              else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
              {
                v83 = [v24 identifier];
                id v85 = v11;
                MOLogWrite();
              }
              long long v23 = v11;
            }
            uint64_t v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          id v20 = [obj countByEnumeratingWithState:&v111 objects:v122 count:16];
        }
        while (v20);
        uint64_t v9 = v87;
        id v5 = v88;
        v3 = v93;
        id v10 = v89;
      }
    }
    else
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_33;
      }
      uint64_t v12 = [v9 bundleURL];
      v83 = [v12 path];
      id v85 = v11;
      id obj = v83;
      MOLogWrite();
    }

LABEL_33:
    unsigned int v6 = v91;
  }
  uint64_t v30 = [(MIReverter *)v3 dataContainer];
  if (v30
    && (v31 = (void *)v30,
        [(MIReverter *)v3 dataContainer],
        id v32 = objc_claimAutoreleasedReturnValue(),
        id v33 = [v32 status],
        v32,
        v31,
        v33 != (id)3))
  {
    v66 = [(MIReverter *)v3 dataContainer];
    id v109 = 0;
    unsigned int v67 = [(MIReverter *)v3 _refreshUUIDForContainer:v66 withError:&v109];
    id v49 = v109;

    if (!v67) {
      goto LABEL_69;
    }
    v68 = [(MIReverter *)v3 dataContainer];
    id v108 = v49;
    unsigned int v69 = [v68 makeContainerLiveWithError:&v108];
    id v34 = v108;

    id v49 = v34;
    if (!v69) {
      goto LABEL_69;
    }
  }
  else
  {
    id v34 = 0;
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v35 = [(MIReverter *)v3 appExtensionDataContainers];
  id v36 = [v35 countByEnumeratingWithState:&v104 objects:v121 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v105;
LABEL_39:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v105 != v38) {
        objc_enumerationMutation(v35);
      }
      v40 = *(void **)(*((void *)&v104 + 1) + 8 * v39);
      id v103 = v34;
      unsigned int v41 = [(MIReverter *)v93 _refreshUUIDForContainer:v40 withError:&v103];
      id v42 = v103;

      if (!v41) {
        goto LABEL_68;
      }
      if ([v40 status] == (id)3)
      {
        id v34 = v42;
      }
      else
      {
        id v102 = v42;
        unsigned int v43 = [v40 makeContainerLiveWithError:&v102];
        id v34 = v102;

        if (!v43)
        {
          id v42 = v34;
          goto LABEL_68;
        }
      }
      if (v37 == (id)++v39)
      {
        id v37 = [v35 countByEnumeratingWithState:&v104 objects:v121 count:16];
        if (v37) {
          goto LABEL_39;
        }
        break;
      }
    }
  }

  v44 = [(MIReverter *)v93 options];
  v45 = [v44 objectForKeyedSubscript:@"WaitForStorageDeletion"];
  id v46 = sub_100014D34(v45, 0);

  v47 = [(MIReverter *)v93 bundleContainer];
  v48 = [(MIReverter *)v93 existingBundleContainer];
  id v101 = v34;
  LODWORD(v46) = [v47 makeContainerLiveReplacingContainer:v48 reason:2 waitForDeletion:v46 withError:&v101];
  id v49 = v101;

  if (!v46) {
    goto LABEL_69;
  }
  uint64_t v50 = [(MIReverter *)v93 dataContainer];
  if (v50)
  {
    v51 = (void *)v50;
    v52 = [(MIReverter *)v93 dataContainer];
    id v53 = [v52 status];

    if (v53 == (id)3)
    {
      v54 = [(MIReverter *)v93 dataContainer];
      id v100 = v49;
      unsigned int v55 = [v54 makeContainerLiveWithError:&v100];
      id v56 = v100;

      id v49 = v56;
      if (!v55) {
        goto LABEL_69;
      }
    }
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v35 = [(MIReverter *)v93 appExtensionDataContainers];
  id v57 = [v35 countByEnumeratingWithState:&v96 objects:v120 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v97;
LABEL_54:
    uint64_t v60 = 0;
    while (1)
    {
      if (*(void *)v97 != v59) {
        objc_enumerationMutation(v35);
      }
      v61 = *(void **)(*((void *)&v96 + 1) + 8 * v60);
      if ([v61 status] == (id)3)
      {
        v62 = [v5 identifier];
        [v61 setParentBundleID:v62];

        id v95 = v49;
        LODWORD(v62) = [v61 makeContainerLiveWithError:&v95];
        id v42 = v95;

        id v49 = v42;
        if (!v62) {
          break;
        }
      }
      if (v58 == (id)++v60)
      {
        id v58 = [v35 countByEnumeratingWithState:&v96 objects:v120 count:16];
        if (v58) {
          goto LABEL_54;
        }
        goto LABEL_61;
      }
    }
LABEL_68:

    id v49 = v42;
LABEL_69:
    if (a3)
    {
      id v49 = v49;
      BOOL v70 = 0;
      *a3 = v49;
    }
    else
    {
      BOOL v70 = 0;
    }
    goto LABEL_72;
  }
LABEL_61:

  if ([v6 count])
  {
    id v94 = v49;
    unsigned __int8 v63 = +[MIContainer removeContainers:v6 waitForDeletion:0 error:&v94];
    id v64 = v94;

    v65 = v93;
    if (v63)
    {
      id v49 = v64;
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        v84 = v6;
        id v86 = v64;
        MOLogWrite();
      }

      id v49 = 0;
    }
  }
  else
  {
    v65 = v93;
  }
  v72 = [(MIReverter *)v65 dataContainer];

  if (v72)
  {
    v73 = +[MIContainerProtectionManager defaultManager];
    v74 = [(MIReverter *)v65 dataContainer];
    [v73 setDataProtectionOnDataContainer:v74 forNewBundle:v5 retryIfLocked:1];
  }
  v75 = [(MIReverter *)v65 appExtensionBundles];
  v76 = (char *)[v75 count];

  if (v76)
  {
    for (j = 0; j != v76; ++j)
    {
      v78 = [(MIReverter *)v65 appExtensionDataContainers];
      v79 = [v78 objectAtIndexedSubscript:j];

      v80 = [(MIReverter *)v65 appExtensionBundles];
      v81 = [v80 objectAtIndexedSubscript:j];

      v82 = +[MIContainerProtectionManager defaultManager];
      BOOL v70 = 1;
      [v82 setDataProtectionOnDataContainer:v79 forNewBundle:v81 retryIfLocked:1];

      v65 = v93;
    }
  }
  else
  {
    BOOL v70 = 1;
  }
LABEL_72:

  return v70;
}

- (id)_launchServicesBundleRecordsWithError:(id *)a3
{
  id v5 = objc_opt_new();
  unsigned int v6 = [(MIReverter *)self identity];
  id v34 = [v6 bundleID];
  [(MIReverter *)self _fireCallbackWithStatus:@"GeneratingApplicationMap" percentComplete:90];
  id v7 = objc_alloc((Class)MIInstalledInfoGatherer);
  id v8 = [(MIReverter *)self bundleContainer];
  uint64_t v9 = [(MIReverter *)self dataContainer];
  id v10 = [v7 initWithBundleContainer:v8 dataContainer:v9];

  id v36 = 0;
  id v11 = [v10 bundleRecordWithError:&v36];
  id v12 = v36;
  if (!v11)
  {
    id v26 = 0;
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  [v5 addObject:v11];
  BOOL v13 = [(MIReverter *)self appExtensionBundles];
  id v14 = [v13 count];

  id v15 = [(MIReverter *)self appExtensionDataContainers];
  id v16 = [v15 count];

  if (v14 != v16)
  {
    sub_100014A08((uint64_t)"-[MIReverter _launchServicesBundleRecordsWithError:]", 590, MIInstallerErrorDomain, 4, 0, 0, @"Have %ld app extensions and %ld app extension data containers; they should be equal.",
      v17,
    uint64_t v27 = (uint64_t)v14);

    id v26 = 0;
    id v12 = (id)v27;
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v31 = v6;
  id v32 = a3;
  uint64_t v30 = v11;
  if (v14)
  {
    id v33 = v14;
    uint64_t v18 = 0;
    while (1)
    {
      id v19 = v10;
      id v20 = v12;
      uint64_t v21 = [(MIReverter *)self appExtensionBundles];
      uint64_t v22 = [v21 objectAtIndexedSubscript:v18];

      long long v23 = [(MIReverter *)self appExtensionDataContainers];
      uint64_t v24 = [v23 objectAtIndexedSubscript:v18];

      id v10 = [objc_alloc((Class)MIInstalledInfoGatherer) initWithAppExtensionBundle:v22 inBundleIdentifier:v34 dataContainer:v24];
      id v35 = v12;
      v25 = [v10 bundleRecordWithError:&v35];
      id v12 = v35;

      if (!v25) {
        break;
      }
      [v5 addObject:v25];

      if (v33 == (id)++v18) {
        goto LABEL_7;
      }
    }

    id v26 = 0;
  }
  else
  {
LABEL_7:
    id v26 = v5;
  }
  unsigned int v6 = v31;
  a3 = v32;
  id v11 = v30;
  if (v32)
  {
LABEL_14:
    if (!v26) {
      *a3 = v12;
    }
  }
LABEL_16:
  id v28 = v26;

  return v28;
}

- (BOOL)performRevertWithError:(id *)a3
{
  uint64_t v40 = 0;
  unsigned int v41 = (id *)&v40;
  uint64_t v42 = 0x3032000000;
  unsigned int v43 = sub_1000115B0;
  v44 = sub_1000115C0;
  id v45 = 0;
  id v5 = [(MIReverter *)self identity];
  unsigned int v6 = [v5 bundleID];
  [(MIReverter *)self _fireCallbackWithStatus:@"CreatingStagingDirectory" percentComplete:5];
  [(MIReverter *)self _fireCallbackWithStatus:@"ExtractingPackage" percentComplete:15];
  [(MIReverter *)self _fireCallbackWithStatus:@"InspectingPackage" percentComplete:20];
  [(MIReverter *)self _fireCallbackWithStatus:@"TakingInstallLock"];
  sub_100054F88(v6);
  [(MIReverter *)self setIsLocked:1];
  id v7 = v41;
  id v39 = v41[5];
  unsigned __int8 v8 = [v5 resolvePersonaWithError:&v39];
  objc_storeStrong(v7 + 5, v39);
  if ((v8 & 1) == 0)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = v41;
  id v38 = v41[5];
  LODWORD(v10) = [(MIReverter *)self _performPreflightWithError:&v38];
  objc_storeStrong(v9 + 5, v38);
  if (!v10) {
    goto LABEL_14;
  }
  id v11 = v41;
  id v37 = v41[5];
  LODWORD(v10) = [(MIReverter *)self _performVerificationWithError:&v37];
  objc_storeStrong(v11 + 5, v37);
  if (!v10) {
    goto LABEL_14;
  }
  id v12 = v41;
  id obj = v41[5];
  LODWORD(v10) = [(MIReverter *)self _performInstallationWithError:&obj];
  objc_storeStrong(v12 + 5, obj);
  if (!v10) {
    goto LABEL_14;
  }
  BOOL v13 = v41;
  id v35 = v41[5];
  LODWORD(v10) = [(MIReverter *)self _postFlightInstallationWithError:&v35];
  objc_storeStrong(v13 + 5, v35);
  if (!v10
    || (id v14 = v41,
        id v34 = v41[5],
        LODWORD(v10) = [(MIReverter *)self _finalizeInstallationWithError:&v34],
        objc_storeStrong(v14 + 5, v34),
        !v10))
  {
LABEL_14:
    id v16 = 0;
    goto LABEL_15;
  }
  id v15 = v41;
  id v33 = v41[5];
  id v16 = [(MIReverter *)self _launchServicesBundleRecordsWithError:&v33];
  objc_storeStrong(v15 + 5, v33);
  if (!v16)
  {
LABEL_13:
    LOBYTE(v10) = 0;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&self->_receipt, v16);
  if ([(MIReverter *)self isLocked])
  {
    sub_1000550D8(v6);
    [(MIReverter *)self setIsLocked:0];
  }
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1000115B0;
  v31 = sub_1000115C0;
  id v32 = 0;
  id v10 = sub_10000EC48();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000115C8;
  block[3] = &unk_10008CF10;
  v25 = &v27;
  id v16 = v16;
  id v23 = v16;
  id v24 = v5;
  id v26 = &v40;
  dispatch_sync(v10, block);

  uint64_t v17 = (void *)v28[5];
  LOBYTE(v10) = v17 != 0;
  if (v17)
  {
    objc_storeStrong((id *)&self->_recordPromise, v17);
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v20 = v6;
    uint64_t v21 = (uint64_t)v41[5];
    MOLogWrite();
  }

  _Block_object_dispose(&v27, 8);
LABEL_15:
  if ([(MIReverter *)self isLocked])
  {
    sub_1000550D8(v6);
    [(MIReverter *)self setIsLocked:0];
  }
  if (a3) {
    char v18 = (char)v10;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0) {
    *a3 = v41[5];
  }

  _Block_object_dispose(&v40, 8);
  return (char)v10;
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (MIClientConnection)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (MIClientConnection *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (void)setExistingBundleContainer:(id)a3
{
}

- (MIStashedBundleContainer)stashedContainer
{
  return self->_stashedContainer;
}

- (void)setStashedContainer:(id)a3
{
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (void)setBundleContainer:(id)a3
{
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
}

- (NSMutableArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_appExtensionBundles, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);
  objc_storeStrong((id *)&self->_stashedContainer, 0);
  objc_storeStrong((id *)&self->_existingBundleContainer, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_recordPromise, 0);

  objc_storeStrong((id *)&self->_receipt, 0);
}

@end