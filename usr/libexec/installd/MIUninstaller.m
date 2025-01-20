@interface MIUninstaller
+ (id)uninstallerForIdentities:(id)a3 withOptions:(id)a4 forClient:(id)a5;
- (BOOL)_removeReferenceForBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 temporaryReference:(id)a5 removedInfo:(id)a6 wasLastReference:(BOOL *)a7 gatherOptions:(unint64_t *)a8 error:(id *)a9;
- (BOOL)_uninstallUserStuffForIdentity:(id)a3 error:(id *)a4;
- (BOOL)performUninstallationByRevokingTemporaryReference:(id)a3 error:(id *)a4;
- (BOOL)performUninstallationWithError:(id *)a3;
- (MIClientConnection)client;
- (MIUninstaller)initWithIdentitites:(id)a3 options:(id)a4 forClient:(id)a5;
- (NSArray)identities;
- (NSArray)receipt;
- (NSDictionary)options;
- (id)_uninstallBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 waitForDeletion:(BOOL)a5 uninstallReason:(id)a6 temporaryReference:(id)a7 deleteDataContainers:(BOOL)a8 wasLastReference:(BOOL *)a9 error:(id *)a10;
- (unsigned)percentComplete;
- (void)_fireCallbackWithStatus:(id)a3;
- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)setPercentComplete:(unsigned int)a3;
@end

@implementation MIUninstaller

- (MIUninstaller)initWithIdentitites:(id)a3 options:(id)a4 forClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MIUninstaller;
  v12 = [(MIUninstaller *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identities, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    objc_storeStrong((id *)&v13->_client, a5);
  }

  return v13;
}

+ (id)uninstallerForIdentities:(id)a3 withOptions:(id)a4 forClient:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithIdentitites:v9 options:v8 forClient:v7];

  return v10;
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([(MIUninstaller *)self percentComplete] < v4) {
    [(MIUninstaller *)self setPercentComplete:v4];
  }
  v10[0] = @"Status";
  v10[1] = @"PercentComplete";
  v11[0] = v6;
  id v7 = +[NSNumber numberWithUnsignedInt:[(MIUninstaller *)self percentComplete]];
  v11[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v9 = [(MIUninstaller *)self client];
  [v9 sendProgressWithDictionary:v8];
}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4 = a3;
  [(MIUninstaller *)self _fireCallbackWithStatus:v4 percentComplete:[(MIUninstaller *)self percentComplete]];
}

- (BOOL)_uninstallUserStuffForIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bundleID];
  id v7 = [v5 personaUniqueString];
  id v26 = 0;
  id v8 = +[MIContainer allContainersForIdentifier:v6 persona:v7 options:2 error:&v26];
  id v9 = v26;

  if (v8)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v20 = v5;
      MOLogWrite();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
LABEL_7:
      objc_super v15 = 0;
      v16 = v9;
      while (1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v15);
        id v21 = v16;
        unsigned int v18 = [v17 purgeContentWithError:&v21, v20];
        id v9 = v21;

        if (!v18) {
          break;
        }
        objc_super v15 = (char *)v15 + 1;
        v16 = v9;
        if (v13 == v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
          LOBYTE(v18) = 1;
          if (v13) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
    else
    {
      LOBYTE(v18) = 1;
    }
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIUninstaller _uninstallUserStuffForIdentity:error:]", 102, MIInstallerErrorDomain, 26, v9, 0, @"Could not get containers with identity %@", v10, (uint64_t)v5);
    LOBYTE(v18) = 0;
    id v11 = v9;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a4 && (v18 & 1) == 0) {
    *a4 = v9;
  }

  return v18;
}

- (BOOL)_removeReferenceForBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 temporaryReference:(id)a5 removedInfo:(id)a6 wasLastReference:(BOOL *)a7 gatherOptions:(unint64_t *)a8 error:(id *)a9
{
  id v13 = a3;
  id v60 = a4;
  id v14 = a5;
  id v61 = a6;
  objc_super v15 = +[MIAppReferenceManager defaultManager];
  uint64_t v16 = sub_10000EB14();
  BOOL v74 = 0;
  v17 = [v13 bundleID];
  id v73 = 0;
  uint64_t v62 = 3;
  unsigned int v18 = +[MIBundleContainer appBundleContainerForIdentifier:v17 inDomain:3 withError:&v73];
  id v19 = v73;
  id v20 = v19;
  if (!v18)
  {
    v27 = [v19 domain];
    if ([v27 isEqualToString:MIContainerManagerErrorDomain])
    {
      id v28 = [v20 code];

      if (v28 == (id)21)
      {

        id v72 = 0;
        uint64_t v62 = 2;
        unsigned int v18 = +[MIBundleContainer appBundleContainerForIdentifier:v17 inDomain:2 withError:&v72];
        id v20 = v72;
        id v22 = v20;
        if (v18) {
          goto LABEL_2;
        }
      }
      else
      {
        id v22 = v20;
      }
    }
    else
    {
      id v22 = v20;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    v30 = 0;
LABEL_25:
    long long v24 = 0;
    long long v25 = 0;
    goto LABEL_48;
  }
LABEL_2:
  if (v14)
  {
    id v71 = v20;
    unsigned __int8 v21 = [v15 revokeTemporaryReference:v14 wasLastReference:&v74 error:&v71];
    id v22 = v71;

    if (v21)
    {
      v58 = v17;
      unint64_t v23 = 0;
      long long v24 = 0;
      long long v25 = 0;
LABEL_5:
      *a8 = v23;
      *a7 = v74;
      BOOL v26 = 1;
      v17 = v58;
      goto LABEL_52;
    }
    v30 = v18;
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    goto LABEL_25;
  }
  id v69 = v20;
  id v70 = 0;
  unsigned __int8 v29 = [v15 removeReferenceForIdentity:v13 inDomain:v62 forUserWithID:v16 wasLastReference:&v74 resultingPersonaUniqueStrings:&v70 error:&v69];
  id v57 = v70;
  id v56 = v69;

  if (v29)
  {
    v55 = v15;
    v58 = v17;
    v54 = a7;
    if (v74)
    {
      long long v24 = 0;
      unint64_t v23 = 0;
    }
    else
    {
      v31 = objc_opt_new();
      id v53 = v13;
      v32 = [v13 bundleID];
      [v31 setBundleIdentifier:v32];

      v33 = [v18 bundle];
      [v31 setIsPlaceholder:[v33 isPlaceholder]];

      v52 = v18;
      [v31 setHasParallelPlaceholder:[v18 hasParallelPlaceholder]];
      [v61 addObject:v31];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v34 = v60;
      id v35 = [v34 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v35)
      {
        id v36 = v35;
        long long v24 = 0;
        uint64_t v37 = *(void *)v66;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            v39 = v24;
            if (*(void *)v66 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v40 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            id v64 = 0;
            long long v24 = +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v40, v62, &v64, v50, v51);
            id v41 = v64;

            if (v24)
            {
              v42 = [v24 bundle];
              v43 = objc_opt_new();
              v44 = [v42 identifier];
              [v31 setBundleIdentifier:v44];

              [v31 setIsPlaceholder:[v42 isPlaceholder]];
              [v31 setHasParallelPlaceholder:[v24 hasParallelPlaceholder]];
              [v61 addObject:v43];
            }
            else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
            {
              uint64_t v50 = v40;
              id v51 = v41;
              MOLogWrite();
            }
          }
          id v36 = [v34 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }
        while (v36);
      }
      else
      {
        long long v24 = 0;
      }

      unint64_t v23 = 2;
      unsigned int v18 = v52;
      id v13 = v53;
      objc_super v15 = v55;
      id v14 = 0;
      a7 = v54;
    }
    if (!v57)
    {
      long long v25 = 0;
      id v22 = v56;
      goto LABEL_5;
    }
    v30 = v18;
    v45 = +[MILaunchServicesOperationManager instanceForCurrentUser];
    v46 = [v13 bundleID];
    id v63 = v56;
    unsigned __int8 v47 = [v45 setPersonaUniqueStrings:v57 forAppBundleID:v46 inDomain:v62 error:&v63];
    id v22 = v63;

    if (v47)
    {
      objc_super v15 = v55;
      id v14 = 0;
      unsigned int v18 = v30;
      a7 = v54;
      long long v25 = v57;
      goto LABEL_5;
    }
    objc_super v15 = v55;
    id v14 = 0;
    v17 = v58;
  }
  else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
  {
    v30 = v18;
    long long v24 = 0;
    id v22 = v56;
  }
  else
  {
    v30 = v18;
    id v22 = v56;
    MOLogWrite();
    long long v24 = 0;
  }
  long long v25 = v57;
LABEL_48:
  if (a9)
  {
    v48 = v25;
    id v22 = v22;
    long long v25 = v48;
    BOOL v26 = 0;
    *a9 = v22;
  }
  else
  {
    BOOL v26 = 0;
  }
  unsigned int v18 = v30;
LABEL_52:

  return v26;
}

- (id)_uninstallBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 waitForDeletion:(BOOL)a5 uninstallReason:(id)a6 temporaryReference:(id)a7 deleteDataContainers:(BOOL)a8 wasLastReference:(BOOL *)a9 error:(id *)a10
{
  BOOL v10 = a8;
  BOOL v90 = a5;
  id v15 = a3;
  id v16 = a4;
  id v92 = a6;
  id v17 = a7;
  unsigned int v18 = objc_opt_new();
  v95 = objc_opt_new();
  id v19 = [v15 bundleID];
  uint64_t v121 = 0;
  BOOL v120 = 0;
  id v20 = [v15 personaUniqueString];
  if (!+[ICLFeatureFlags appReferencesEnabled])
  {
    id v22 = 0;
    BOOL v120 = 1;
LABEL_6:
    uint64_t v23 = 5;
    if (v10) {
      uint64_t v23 = 7;
    }
    uint64_t v121 = v23;
    if (_os_feature_enabled_impl())
    {

      id v20 = 0;
    }
    goto LABEL_10;
  }
  id v119 = 0;
  unsigned __int8 v21 = [(MIUninstaller *)self _removeReferenceForBundleWithIdentity:v15 linkedToChildren:v16 temporaryReference:v17 removedInfo:v18 wasLastReference:&v120 gatherOptions:&v121 error:&v119];
  id v22 = v119;
  if ((v21 & 1) == 0)
  {
LABEL_32:
    id v37 = 0;
    id v38 = 0;
    v91 = 0;
LABEL_97:
    v79 = a10;
    goto LABEL_98;
  }
  if (v120) {
    goto LABEL_6;
  }
LABEL_10:
  long long v24 = v22;
  id v118 = v22;
  uint64_t v25 = +[MIContainer allContainersForIdentifier:v19 persona:v20 options:v121 error:&v118];
  id v22 = v118;

  if (!v25) {
    goto LABEL_32;
  }
  [v95 addObjectsFromArray:v25];
  id v87 = v17;
  id v88 = v15;
  v93 = v18;
  v94 = v16;
  v89 = v19;
  v97 = v20;
  v91 = (void *)v25;
  if ([v16 count])
  {
    BOOL v26 = objc_opt_new();
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v27 = v16;
    id v28 = [v27 countByEnumeratingWithState:&v114 objects:v123 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v115;
      uint64_t v102 = MIContainerManagerErrorDomain;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          v32 = v22;
          if (*(void *)v115 != v30) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          id v113 = v22;
          id v34 = +[MIContainer allContainersForIdentifier:persona:options:error:](MIContainer, "allContainersForIdentifier:persona:options:error:", v33, v20, v121, &v113, v82, v85);
          id v22 = v113;

          if (v34)
          {
LABEL_18:
            [v95 addObjectsFromArray:v34];
            [v26 addObject:v33];
            goto LABEL_26;
          }
          id v35 = [v22 domain];
          if ([v35 isEqualToString:v102])
          {
            id v36 = [v22 code];

            id v20 = v97;
            if (v36 == (id)21) {
              goto LABEL_18;
            }
          }
          else
          {

            id v20 = v97;
          }
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
          {
            id v82 = v33;
            v85 = v22;
            MOLogWrite();
          }
LABEL_26:
        }
        id v29 = [v27 countByEnumeratingWithState:&v114 objects:v123 count:16];
      }
      while (v29);
    }

    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v82 = v89;
      v85 = v26;
      MOLogWrite();
    }
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v82 = v19;
    MOLogWrite();
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v95;
  id v103 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
  id v38 = 0;
  if (!v103) {
    goto LABEL_86;
  }
  uint64_t v101 = *(void *)v110;
  do
  {
    v39 = 0;
    uint64_t v40 = v38;
    do
    {
      if (*(void *)v110 != v101) {
        objc_enumerationMutation(obj);
      }
      id v41 = *(void **)(*((void *)&v109 + 1) + 8 * (void)v39);
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        v42 = [*(id *)(*((void *)&v109 + 1) + 8 * (void)v39) identifier:v82, v85, v86];
        v43 = [v41 personaUniqueString];
        v44 = [v41 containerURL];
        [v44 path];
        v86 = v85 = v43;
        id v82 = v42;
        MOLogWrite();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v38 = v40;
        goto LABEL_84;
      }
      id v38 = v41;

      v45 = [v38 bundle];
      v46 = [v45 identifier];

      if (!v46)
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          id v82 = v38;
          MOLogWrite();
        }
        goto LABEL_83;
      }
      unsigned __int8 v47 = +[MIFreeProfileValidatedAppTracker sharedTracker];
      v48 = [v38 bundle];
      id v108 = v22;
      unsigned __int8 v49 = [v47 removeReferenceForBundle:v48 error:&v108];
      id v50 = v108;

      if ((v49 & 1) == 0)
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          id v51 = [v38 bundle:v82, v85, v86];
          v52 = [v51 bundleURL];
          v85 = [v52 path];
          v86 = v50;
          id v82 = v46;
          MOLogWrite();
        }
        [v47 invalidateCache];
        id v50 = 0;
      }
      v100 = v47;
      id v53 = [v38 bundle:v82];
      id v54 = [v53 isPlaceholder];

      LODWORD(v53) = [v38 hasParallelPlaceholder];
      v55 = [v38 bundle];
      id v56 = [v55 bundleURL];

      v99 = v56;
      unsigned int v98 = v53;
      if ((v54 & 1) == 0)
      {
        v59 = +[MIFileManager defaultManager];
        id v107 = v50;
        id v57 = [v59 insecureCachedAppIdentifierIfAppClipForBundle:v56 error:&v107];
        id v58 = v107;

        if (v57)
        {
          uint64_t v60 = SecItemDeleteKeychainItemsForAppClip();
          if (v60 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
          {
            v83 = v57;
            v85 = (void *)v60;
            MOLogWrite();
          }
          goto LABEL_70;
        }
        id v61 = [v58 domain];
        if ([v61 isEqualToString:NSPOSIXErrorDomain])
        {
          id v62 = [v58 code];

          if (v62 == (id)93)
          {
LABEL_69:

            id v57 = 0;
            id v58 = 0;
            goto LABEL_70;
          }
        }
        else
        {
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          v83 = [v56 path];
          v85 = v58;
          MOLogWrite();
        }
        goto LABEL_69;
      }
      id v57 = 0;
      id v58 = v50;
LABEL_70:
      id v63 = +[MIKeychainAccessGroupTracker sharedTracker];
      id v64 = [v38 bundle];
      id v106 = v58;
      unsigned __int8 v65 = [v63 removeReferencesForBundle:v64 error:&v106];
      id v22 = v106;

      if ((v65 & 1) == 0)
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          long long v66 = [v38 bundle];
          v84 = [v66 identifier];
          v85 = v22;
          MOLogWrite();
        }
        [v63 invalidateCache];
        id v22 = 0;
      }
      id v67 = [v94 containsObject:v46, v84];
      long long v68 = objc_opt_new();
      [v68 setBundleIdentifier:v46];
      [v68 setIsPlaceholder:v54];
      [v68 setHasParallelPlaceholder:v98];
      [v68 setIsLinked:v67];
      [v68 setIsLastReference:v120];
      [v93 addObject:v68];
      id v69 = +[MIUninstalledAppList sharedList];
      [v69 addIdentifier:v46];

      id v70 = [v38 bundle];
      unsigned int v71 = [v70 bundleType];

      if (v71 == 1)
      {
        if (v92)
        {
          if ([v92 isEqualToString:@"UninstallReasonSystemAppNotAllowed"]) {
            uint64_t v72 = 6;
          }
          else {
            uint64_t v72 = 2;
          }
        }
        else
        {
          uint64_t v72 = 2;
        }
        id v73 = +[MISystemAppState sharedList];
        [v73 addIdentifier:v46 withState:v72];
      }
      id v20 = v97;
LABEL_83:

      uint64_t v40 = v38;
LABEL_84:
      v39 = (char *)v39 + 1;
    }
    while (v103 != v39);
    id v103 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
  }
  while (v103);
LABEL_86:

  id v74 = [obj copy];
  id v105 = v22;
  unsigned __int8 v75 = +[MIContainer removeContainers:v74 waitForDeletion:v90 error:&v105];
  id v76 = v105;

  if ((v75 & 1) == 0)
  {
    id v17 = v87;
    id v15 = v88;
    unsigned int v18 = v93;
    id v16 = v94;
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v19 = v89;
      MOLogWrite();
LABEL_96:
      sub_1000375CC(v76);
      id v37 = 0;
      id v22 = v76;
      goto LABEL_97;
    }
LABEL_95:
    id v19 = v89;
    goto LABEL_96;
  }
  v77 = +[MIContainerLinkManager sharedInstanceForDomain:2];
  id v104 = v76;
  unsigned int v78 = [v77 removeParent:v89 error:&v104];
  id v22 = v104;

  id v17 = v87;
  id v15 = v88;
  unsigned int v18 = v93;
  id v16 = v94;
  if (!v78)
  {
    id v76 = v22;
    goto LABEL_95;
  }
  sub_1000375CC(0);
  id v37 = [v93 copy];
  if (!a9)
  {
    id v19 = v89;
    goto LABEL_97;
  }
  id v19 = v89;
  v79 = a10;
  if (v37)
  {
    *a9 = v120;
    goto LABEL_101;
  }
LABEL_98:
  if (v79 && !v37)
  {
    id v22 = v22;
    id v37 = 0;
    id *v79 = v22;
  }
LABEL_101:
  id v80 = v37;

  return v80;
}

- (BOOL)performUninstallationWithError:(id *)a3
{
  return [(MIUninstaller *)self performUninstallationByRevokingTemporaryReference:0 error:a3];
}

- (BOOL)performUninstallationByRevokingTemporaryReference:(id)a3 error:(id *)a4
{
  id v152 = a3;
  uint64_t v213 = 0;
  v214 = &v213;
  uint64_t v215 = 0x3032000000;
  v216 = sub_1000390A0;
  v217 = sub_1000390B0;
  id v218 = 0;
  v175 = objc_opt_new();
  v156 = objc_opt_new();
  v162 = objc_opt_new();
  v155 = objc_opt_new();
  v174 = +[MIContainerLinkManager sharedInstanceForDomain:2];
  v166 = objc_opt_new();
  v165 = objc_opt_new();
  v153 = objc_opt_new();
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id v4 = [(MIUninstaller *)self identities];
  id v5 = [v4 countByEnumeratingWithState:&v209 objects:v225 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v210;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v210 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v209 + 1) + 8 * v7);
      id v9 = (id *)(v214 + 5);
      id obj = (id)v214[5];
      unsigned __int8 v10 = [v8 resolvePersonaWithError:&obj];
      objc_storeStrong(v9, obj);
      if ((v10 & 1) == 0) {
        break;
      }
      id v11 = [v8 bundleID];
      [v155 addObject:v11];

      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v209 objects:v225 count:16];
        if (!v5) {
          goto LABEL_9;
        }
        goto LABEL_3;
      }
    }
    id v151 = 0;
    v160 = 0;
    v148 = 0;
    goto LABEL_181;
  }
LABEL_9:

  id v12 = [(MIUninstaller *)self options];

  if (v12)
  {
    id v13 = [(MIUninstaller *)self options];
    id v14 = [v13 objectForKeyedSubscript:@"UserDataOnly"];
    unsigned int v15 = [v14 isEqual:&__kCFBooleanTrue];

    id v16 = [(MIUninstaller *)self options];
    id v17 = [v16 objectForKeyedSubscript:@"Placeholder"];
    unsigned int v172 = [v17 isEqual:&__kCFBooleanTrue];

    if (v172)
    {
      id v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        id v19 = [(MIUninstaller *)self client];
        id v20 = [v19 clientName];
        sub_100059670(v20, v224, v19);
      }

      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        unsigned __int8 v21 = [(MIUninstaller *)self client];
        v140 = [v21 clientName];
        v145 = @"Placeholder";
        MOLogWrite();
      }
    }
    id v22 = [(MIUninstaller *)self options];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"ParallelPlaceholderOnlyIfExists"];
    HIDWORD(v171) = [v23 isEqual:&__kCFBooleanTrue];

    if (HIDWORD(v171))
    {
      id v24 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        uint64_t v25 = [(MIUninstaller *)self client];
        BOOL v26 = [v25 clientName];
        sub_1000595F8(v26, v223, v25);
      }

      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v27 = [(MIUninstaller *)self client];
        v141 = [v27 clientName];
        CFStringRef v146 = @"ParallelPlaceholderOnlyIfExists";
        MOLogWrite();
      }
    }
    id v28 = [(MIUninstaller *)self options];
    id v29 = [v28 objectForKeyedSubscript:kMIUninstallParallelPlaceholderKey];
    LODWORD(v171) = [v29 isEqual:&__kCFBooleanTrue];

    uint64_t v30 = [(MIUninstaller *)self options];
    v31 = [v30 objectForKeyedSubscript:@"UninstallPlaceholdersOnly"];
    unsigned int v163 = [v31 isEqual:&__kCFBooleanTrue];

    v32 = [(MIUninstaller *)self options];
    v33 = [v32 objectForKeyedSubscript:@"WaitForStorageDeletion"];
    unsigned int v150 = [v33 isEqual:&__kCFBooleanTrue];

    id v34 = [(MIUninstaller *)self options];
    id v35 = [v34 objectForKeyedSubscript:@"UninstallReason"];
    objc_opt_class();
    id v36 = v35;
    if (objc_opt_isKindOfClass()) {
      id v151 = v36;
    }
    else {
      id v151 = 0;
    }

    if (v15)
    {
      if ((v172 | v171 | HIDWORD(v171) | v163) == 1)
      {
        uint64_t v38 = sub_100014A08((uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", 492, MIInstallerErrorDomain, 25, 0, 0, @"Illegal option combination passed to MobileInstallationUninstall. Can't uninstall user stuff only and uninstall placeholders.", v37, (uint64_t)v140);
        v160 = 0;
        v148 = 0;
        id v4 = (void *)v214[5];
        v214[5] = v38;
        goto LABEL_181;
      }
      uint64_t v171 = 0;
      unsigned int v172 = 0;
      unsigned int v163 = 0;
      int v158 = 1;
    }
    else
    {
      int v158 = 0;
    }
  }
  else
  {
    int v158 = 0;
    uint64_t v171 = 0;
    unsigned int v172 = 0;
    unsigned int v163 = 0;
    unsigned int v150 = 0;
    id v151 = 0;
  }
  [v175 addObjectsFromArray:v155];
  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  id v176 = v155;
  id v39 = [v176 countByEnumeratingWithState:&v204 objects:v222 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v205;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v205 != v40) {
          objc_enumerationMutation(v176);
        }
        v42 = *(void **)(*((void *)&v204 + 1) + 8 * i);
        id v203 = 0;
        v43 = [v174 childrenForParentBundleID:v42 error:&v203];
        v44 = (__CFString *)v203;
        v45 = v44;
        if (v43)
        {
          [v166 setObject:v43 forKeyedSubscript:v42];
          [v175 unionSet:v43];
        }
        else if (v44 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
        {
          v142 = v42;
          v145 = v44;
          MOLogWrite();
        }
        v46 = +[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", 2, v142, v145);
        id v202 = 0;
        id v201 = 0;
        unsigned int v47 = [v46 getLinkedParent:&v202 forChild:v42 error:&v201];
        id v48 = v202;
        unsigned __int8 v49 = (__CFString *)v201;

        if (v48) {
          unsigned int v50 = v47;
        }
        else {
          unsigned int v50 = 0;
        }
        if (v50 == 1)
        {
          [v175 addObject:v48];
          [v165 setObject:v48 forKeyedSubscript:v42];
        }
        else if (v49 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
        {
          v140 = v42;
          v145 = v49;
          MOLogWrite();
        }
      }
      id v39 = [v176 countByEnumeratingWithState:&v204 objects:v222 count:16];
    }
    while (v39);
  }

  v148 = [v175 allObjects];
  id v51 = +[MIDaemonConfiguration sharedInstance];
  v160 = [v51 builtInApplicationBundleIDs];

  sub_100054F88(v148);
  [(MIUninstaller *)self _fireCallbackWithStatus:@"RemovingApplication" percentComplete:50];
  v52 = +[MIDaemonConfiguration sharedInstance];
  unsigned __int8 v53 = [v52 allowDeletableSystemApps];

  if (v53)
  {
    v154 = 0;
  }
  else
  {
    id v54 = +[MIDaemonConfiguration sharedInstance];
    v154 = [v54 systemAppPlaceholderBundleIDs];
  }
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  v55 = [(MIUninstaller *)self identities];
  id v56 = [v55 countByEnumeratingWithState:&v197 objects:v221 count:16];
  if (v56)
  {
    int v57 = v171 | HIDWORD(v171) | v163;
    int v169 = v57 | v172;
    uint64_t v170 = *(void *)v198;
    uint64_t v58 = 11;
    if (v158) {
      uint64_t v58 = 12;
    }
    uint64_t v168 = v58;
    uint64_t v159 = MIContainerManagerErrorDomain;
    int v167 = v172 ^ 1;
    int v161 = (v172 ^ 1) & v57;
    uint64_t v149 = MIInstallerErrorDomain;
    id v164 = v55;
    do
    {
      id v173 = v56;
      for (j = 0; j != v173; j = (char *)j + 1)
      {
        if (*(void *)v198 != v170) {
          objc_enumerationMutation(v164);
        }
        uint64_t v60 = *(void **)(*((void *)&v197 + 1) + 8 * (void)j);
        id v61 = +[MIAppReferenceManager defaultManager];
        id v62 = [v60 bundleID];
        id v177 = [v61 personaUniqueStringsForAppWithBundleID:v62 domain:2 forUserWithID:sub_10000EB14() error:0];

        if (v177 && [v177 count])
        {
          id v63 = [v60 bundleID];
          [v162 addObject:v63];
        }
        id v64 = [v60 personaUniqueString];
        id v67 = [v60 bundleID];
        if (v169)
        {
          unsigned int v68 = +[ICLFeatureFlags appReferencesEnabled];
          id v69 = (id *)(v214 + 5);
          if (v68)
          {
            id v196 = (id)v214[5];
            id v70 = +[MIBundleContainer appBundleContainerForIdentifier:v67 inDomain:3 withError:&v196];
            objc_storeStrong(v69, v196);
            if (!v70)
            {
              unsigned int v71 = [(id)v214[5] domain];
              if ([v71 isEqualToString:v159])
              {
                BOOL v72 = [(id)v214[5] code] == (id)21;

                if (v72)
                {
                  id v73 = (void *)v214[5];
                  v214[5] = 0;

                  id v69 = (id *)(v214 + 5);
                  v195 = (void *)v214[5];
                  id v70 = +[MIBundleContainer appBundleContainerForIdentifier:v67 inDomain:2 withError:&v195];
                  id v74 = v195;
                  goto LABEL_75;
                }
              }
              else
              {
              }
              goto LABEL_96;
            }
LABEL_76:
            v83 = [v70 bundle];
            unsigned int v77 = [v83 isPlaceholder];

            if (v161)
            {
              _MILogTransactionStep(9, 1, 1, v67, v64, 0, v84, v85, (uint64_t)v144);
              if (([v160 containsObject:v67] & v77) == 1)
              {
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
                {
                  v86 = [v70 containerURL];
                  [v86 path];
                  v144 = v67;
                  v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  MOLogWrite();
                }
                id v87 = (id *)(v214 + 5);
                id v193 = (id)v214[5];
                unsigned __int8 v88 = [v70 removeUnderlyingContainerWaitingForDeletion:0 error:&v193 v144, v145];
                objc_storeStrong(v87, v193);
                if ((v88 & 1) == 0)
                {
                  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
                  {
                    v144 = v67;
                    v145 = (__CFString *)v214[5];
                    MOLogWrite();
                  }
                  uint64_t v79 = 0;
                  v89 = (void *)v214[5];
                  v214[5] = 0;
                  unsigned int v77 = 1;
LABEL_93:

                  goto LABEL_94;
                }
LABEL_92:
                v89 = objc_opt_new();
                [v89 setBundleIdentifier:v67];
                [v89 setHasParallelPlaceholder:1];
                [v89 setIsPlaceholder:1];
                [v156 addObject:v89];
                uint64_t v79 = 1;
                goto LABEL_93;
              }
              if ([v70 hasParallelPlaceholder])
              {
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
                {
                  v144 = v67;
                  MOLogWrite();
                }
                BOOL v90 = +[MIFileManager defaultManager];
                v91 = [v70 parallelPlaceholderURL];
                id v92 = (id *)(v214 + 5);
                id v192 = (id)v214[5];
                unsigned __int8 v93 = [v90 removeItemAtURL:v91 error:&v192];
                objc_storeStrong(v92, v192);

                if (v93) {
                  goto LABEL_92;
                }
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
                {
                  v89 = [v70 parallelPlaceholderURL];
                  v144 = [v89 path];
                  v145 = (__CFString *)v214[5];
                  MOLogWrite();

                  uint64_t v79 = 0;
                  goto LABEL_93;
                }
                uint64_t v79 = 0;
LABEL_94:
                int v78 = 1;
              }
              else
              {
                int v78 = 0;
                uint64_t v79 = 0;
              }
              uint64_t v80 = 9;
            }
            else
            {
              _MILogTransactionStep(10, 1, 1, v67, v64, 0, v84, v85, (uint64_t)v144);
              int v78 = 0;
              uint64_t v79 = 0;
              uint64_t v80 = 10;
            }
LABEL_106:

            goto LABEL_107;
          }
          v194 = (void *)v214[5];
          id v70 = +[MIBundleContainer appBundleContainerWithIdentifier:v67 createIfNeeded:0 created:0 error:&v194];
          id v74 = v194;
LABEL_75:
          id v81 = v74;
          id v82 = *v69;
          *id v69 = v81;

          if (v70) {
            goto LABEL_76;
          }
LABEL_96:
          v94 = [(id)v214[5] domain];
          if ([v94 isEqualToString:v159])
          {
            BOOL v95 = [(id)v214[5] code] == (id)21;

            if (v95)
            {
LABEL_103:
              id v70 = 0;
              unsigned int v77 = 0;
              int v78 = 0;
              uint64_t v79 = 0;
              uint64_t v80 = 0;
              goto LABEL_106;
            }
          }
          else
          {
          }
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
          {
            v144 = v67;
            v145 = (__CFString *)v214[5];
            MOLogWrite();
          }
          goto LABEL_103;
        }
        _MILogTransactionStep(v168, 1, 1, v67, v64, 0, v65, v66, (uint64_t)v144);
        unsigned int v77 = 0;
        int v78 = 0;
        uint64_t v79 = 0;
        uint64_t v80 = v168;
LABEL_107:
        uint64_t v96 = 1;
        if ((v171 | HIDWORD(v171) & v78) == 1) {
          goto LABEL_165;
        }
        if (!(v167 | v77)) {
          goto LABEL_165;
        }
        uint64_t v96 = v79;
        if (v163 & (v78 | v77 ^ 1)) {
          goto LABEL_165;
        }
        if (v158)
        {
          [(MIUninstaller *)self _uninstallUserStuffForIdentity:v60 error:0];
          uint64_t v96 = 1;
LABEL_165:
          _MILogTransactionStep(v80, 2, v96, v67, v64, 0, v75, v76, (uint64_t)v144);
          goto LABEL_166;
        }
        if (![v160 containsObject:v67]) {
          goto LABEL_142;
        }
        v97 = +[MIDaemonConfiguration sharedInstance];
        unsigned __int8 v98 = [v97 allowsInternalSecurityPolicy];

        if ((v98 & 1) == 0)
        {
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) <= 2) {
            goto LABEL_164;
          }
          goto LABEL_163;
        }
        v99 = (id *)(v214 + 5);
        id v191 = (id)v214[5];
        v100 = +[MIBundleContainer appBundleContainerForIdentifier:v67 inDomain:2 withError:&v191];
        objc_storeStrong(v99, v191);
        if (v100)
        {
          id v103 = +[MIDaemonConfiguration sharedInstance];
          id v104 = [v103 systemAppBundleIDToInfoMap];
          id v105 = [v104 objectForKeyedSubscript:v67];

          if (v105)
          {
            id v106 = +[MIDaemonConfiguration sharedInstance];
            id v107 = [v106 systemAppBundleIDToInfoMap];
            uint64_t v108 = [v107 objectForKeyedSubscript:v67];
            goto LABEL_133;
          }
          long long v109 = +[MIDaemonConfiguration sharedInstance];
          long long v110 = [v109 internalAppBundleIDToInfoMap];
          long long v111 = [v110 objectForKeyedSubscript:v67];

          if (v111)
          {
            id v106 = +[MIDaemonConfiguration sharedInstance];
            id v107 = [v106 internalAppBundleIDToInfoMap];
            uint64_t v108 = [v107 objectForKeyedSubscript:v67];
            goto LABEL_133;
          }
          long long v112 = +[MIDaemonConfiguration sharedInstance];
          id v113 = [v112 coreServicesAppBundleIDToInfoMap];
          long long v114 = [v113 objectForKeyedSubscript:v67];

          if (v114)
          {
            id v106 = +[MIDaemonConfiguration sharedInstance];
            id v107 = [v106 coreServicesAppBundleIDToInfoMap];
            uint64_t v108 = [v107 objectForKeyedSubscript:v67];
LABEL_133:
            long long v115 = (void *)v108;
          }
          else
          {
            long long v115 = 0;
          }
          long long v116 = [v115 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL" v144];
          objc_opt_class();
          id v117 = v116;
          if (objc_opt_isKindOfClass()) {
            id v118 = v117;
          }
          else {
            id v118 = 0;
          }

          if (!v118)
          {
            _MILogTransactionStep(v80, 2, 0, v67, v64, 0, v119, v120, (uint64_t)v144);

            goto LABEL_162;
          }
          [v153 setObject:v118 forKeyedSubscript:v67];
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
          {
            [v118 path];
            v144 = v67;
            v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();
          }
LABEL_142:
          if (!v154 || ![v154 containsObject:v67])
          {
            v100 = [v166 objectForKeyedSubscript:v67, v144];
            LOBYTE(v186) = 0;
            uint64_t v121 = [v153 objectForKeyedSubscript:v67];
            BOOL v122 = v121 == 0;

            id v190 = 0;
            v145 = (__CFString *)&v190;
            v123 = -[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:](self, "_uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:", v60, v100, v150, v151, v152, v122);
            v124 = (__CFString *)v190;
            _MILogTransactionStep(v80, 2, v123 != 0, v67, v64, 0, v125, v126, (uint64_t)&v186);
            if (v123) {
              goto LABEL_148;
            }
            v128 = [(__CFString *)v124 domain];
            if ([v128 isEqualToString:v149]
              && [(__CFString *)v124 code] == (id)26)
            {

LABEL_156:
              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
              {
                v143 = v60;
                v145 = v124;
                MOLogWrite();
              }
              v127 = objc_opt_new();
              v131 = [v60 bundleID];
              [v127 setBundleIdentifier:v131];

              [v127 setIsLastReference:1];
              [v127 setHasParallelPlaceholder:1];
              [v127 setDoesNotHaveBundleContainer:1];
              [v156 addObject:v127];
LABEL_160:
            }
            else
            {
              v129 = [(__CFString *)v124 domain];
              if ([v129 isEqualToString:v159])
              {
                BOOL v130 = [(__CFString *)v124 code] == (id)21;

                if (v130) {
                  goto LABEL_156;
                }
              }
              else
              {
              }
              id v132 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v60;
                *(_WORD *)&buf[22] = 2112;
                v220 = v124;
                _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to uninstall %@ : %@", buf, 0x20u);
              }

              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
              {
                v143 = v60;
                v145 = v124;
                MOLogWrite();
              }
LABEL_148:
              [v156 addObjectsFromArray:v123, v143];
              if ((_BYTE)v186)
              {
                v127 = [v165 objectForKeyedSubscript:v67];
                if (v127) {
                  [v174 unlinkChild:v67 fromParent:v127 error:0];
                }
                goto LABEL_160;
              }
            }

LABEL_162:
            goto LABEL_166;
          }
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
            goto LABEL_164;
          }
LABEL_163:
          v144 = v67;
          MOLogWrite();
LABEL_164:
          uint64_t v96 = 0;
          goto LABEL_165;
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          v144 = v67;
          MOLogWrite();
        }
        _MILogTransactionStep(v80, 2, 0, v67, v64, 0, v101, v102, (uint64_t)v144);
LABEL_166:
      }
      v55 = v164;
      id v56 = [v164 countByEnumeratingWithState:&v197 objects:v221 count:16];
    }
    while (v56);
  }

  [(MIUninstaller *)self _fireCallbackWithStatus:@"GeneratingApplicationMap" percentComplete:90];
  sub_1000550D8(v148);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v220) = 0;
  uint64_t v186 = 0;
  v187 = &v186;
  uint64_t v188 = 0x2020000000;
  char v189 = 0;
  v133 = sub_10000EC48();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000390B8;
  block[3] = &unk_10008D780;
  id v134 = v156;
  id v179 = v134;
  v183 = &v213;
  v184 = &v186;
  id v180 = v153;
  v181 = self;
  id v182 = v162;
  v185 = buf;
  dispatch_sync(v133, block);

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {

    _Block_object_dispose(&v186, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v135 = *((unsigned char *)v187 + 24) == 0;

    _Block_object_dispose(&v186, 8);
    _Block_object_dispose(buf, 8);
    if (v135)
    {
      v138 = +[MIUninstallRecord uninstallRecordArrayToICLUninstallRecordArray:v134];
      receipt = self->_receipt;
      self->_receipt = v138;

      BOOL v136 = 1;
      goto LABEL_183;
    }
  }
  id v4 = v154;
LABEL_181:

  BOOL v136 = 0;
  if (a4) {
    *a4 = (id) v214[5];
  }
LABEL_183:

  _Block_object_dispose(&v213, 8);
  return v136;
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSDictionary)options
{
  return self->_options;
}

- (MIClientConnection)client
{
  return self->_client;
}

- (unsigned)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(unsigned int)a3
{
  self->_percentComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_identities, 0);

  objc_storeStrong((id *)&self->_receipt, 0);
}

@end