@interface PLCloudMaster
+ (PLCloudMaster)cloudMasterWithGUID:(id)a3 inMomentShare:(id)a4 prefetchResources:(BOOL)a5 inManagedObjectContext:(id)a6;
+ (PLCloudMaster)cloudMasterWithScopedIdentifier:(id)a3 prefetchResources:(BOOL)a4 inLibrary:(id)a5;
+ (id)_originalTypes;
+ (id)cloudMastersByScopedIdentifiers:(id)a3 relationshipKeyPathsForPrefetching:(id)a4 inLibrary:(id)a5;
+ (id)cloudMastersWithScopedIdentifiers:(id)a3 relationshipKeyPathsForPrefetching:(id)a4 inLibrary:(id)a5;
+ (id)entityName;
+ (id)insertIntoPhotoLibrary:(id)a3 withCloudMasterGUID:(id)a4 inMomentShare:(id)a5;
+ (id)listOfSyncedProperties;
+ (unint64_t)fullSizeJPEGSourceForUTI:(id)a3 andImageDimensions:(CGSize)a4;
+ (void)deleteAllCloudMastersInManagedObjectContext:(id)a3;
+ (void)deleteMasterIfNecessary:(id)a3 inLibrary:(id)a4;
+ (void)deleteOrphanedMastersWithManagedObjectContext:(id)a3;
+ (void)resetCloudMastersStateInManagedObjectContext:(id)a3;
- (BOOL)allOriginalsAreLocallyAvailableForAssetUuid:(id)a3 useOriginalAltInsteadOfOriginal:(BOOL)a4;
- (BOOL)allOriginalsAreUploaded;
- (BOOL)hasResourcesOtherThanForAssetUuid:(id)a3;
- (BOOL)isSyncableChange;
- (BOOL)supportsCloudUpload;
- (CPLScopedIdentifier)sourceMasterForDuplicationCPLScopedIdentifier;
- (NSString)description;
- (id)allMasterResources;
- (id)cplFullRecord;
- (id)cplMasterPropertyChangeForAsset:(id)a3;
- (id)cplPropertyRecord;
- (id)fingerprintContext;
- (id)fingerprintScheme;
- (id)originalFilenameForResourceType:(unint64_t)a3 filePath:(id)a4;
- (id)payloadID;
- (id)payloadsForChangedKeys:(id)a3;
- (id)rm_applyResourcesFromCPLMasterChange:(id)a3 inPhotoLibrary:(id)a4;
- (id)rm_assetUUIDToCloudResources;
- (id)rm_cloudResourceForResourceType:(unint64_t)a3 forAssetUuid:(id)a4;
- (id)rm_cloudResourcesForResourceType:(unint64_t)a3;
- (id)scopeIdentifier;
- (id)scopedIdentifier;
- (unint64_t)sizeOfOriginal;
- (void)_promptForNilScopeIdentifierRadar;
- (void)applyPropertiesFromCPLMasterChange:(id)a3;
- (void)awakeFromInsert;
- (void)rm_applyExpungeableResourceStatesFromCPLMasterChange:(id)a3 inPhotoLibrary:(id)a4;
- (void)setSourceMasterForDuplicationCPLScopedIdentifier:(id)a3;
- (void)updateImportedByBundleIdentifier:(id)a3;
- (void)updateImportedByDisplayName:(id)a3;
@end

@implementation PLCloudMaster

- (void)rm_applyExpungeableResourceStatesFromCPLMasterChange:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [a3 expungeableResourceStates];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v5;
        v6 = *(void **)(*((void *)&v25 + 1) + 8 * v5);
        v7 = -[PLCloudMaster rm_cloudResourcesForResourceType:](self, "rm_cloudResourcesForResourceType:", [v6 resourceType]);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              if (!*v4)
              {
                v13 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  v14 = [v12 objectID];
                  *(_DWORD *)buf = 138412546;
                  v30 = v6;
                  __int16 v31 = 2112;
                  v32 = v14;
                  _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Setting CPLExpungeableResourceState %@ on resource %@", buf, 0x16u);
                }
              }
              objc_msgSend(v12, "applyTrashedState:", +[PLInternalResource plTrashedStateForCPLExpungedState:](PLInternalResource, "plTrashedStateForCPLExpungedState:", objc_msgSend(v6, "expungedState")));
              v15 = [v6 expungedDate];
              [v12 setTrashedDate:v15];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v19);
  }
}

- (id)rm_applyResourcesFromCPLMasterChange:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v94 = [MEMORY[0x1E4F28CB8] defaultManager];
  v95 = v7;
  uint64_t v9 = [v7 resources];
  id v97 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v104 = v8;
  uint64_t v10 = [v8 pathManager];

  if (!v10)
  {
    v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:a2, self, @"PLCloudMaster+RM.m", 119, @"Invalid parameter not satisfying: %@", @"photoLibrary.pathManager" object file lineNumber description];
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v123 objects:v139 count:16];
  v96 = self;
  id v99 = v11;
  if (v12)
  {
    uint64_t v13 = v12;
    char v88 = 0;
    char v105 = 0;
    int v102 = 0;
    uint64_t v87 = *(void *)v124;
    while (1)
    {
      uint64_t v14 = 0;
      uint64_t v86 = v13;
      do
      {
        if (*(void *)v124 != v87) {
          objc_enumerationMutation(v11);
        }
        uint64_t v91 = v14;
        v15 = *(void **)(*((void *)&v123 + 1) + 8 * v14);
        context = (void *)MEMORY[0x19F38D3B0]();
        if (!*MEMORY[0x1E4F59AC0])
        {
          v16 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v128 = v15;
            _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Master resource: %@", buf, 0xCu);
          }
        }
        uint64_t v17 = [v15 resourceType];
        if (v17 != 22) {
          goto LABEL_14;
        }
        v18 = [v15 identity];
        uint64_t v19 = [v18 fileUTI];
        uint64_t v20 = [MEMORY[0x1E4F8CDF8] supplementalResourceAAEType];
        long long v21 = [v20 identifier];
        int v22 = [v19 isEqualToString:v21];

        id v11 = v99;
        if (!v22)
        {
          uint64_t v63 = v91;
        }
        else
        {
LABEL_14:
          long long v23 = [(PLCloudMaster *)self rm_cloudResourcesForResourceType:v17];
          v89 = v23;
          if ([v23 count])
          {
            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            id obj = v23;
            uint64_t v24 = [obj countByEnumeratingWithState:&v115 objects:v137 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v106 = *(void *)v116;
              while (1)
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v116 != v106) {
                    objc_enumerationMutation(obj);
                  }
                  long long v27 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                  long long v28 = [v15 identity];
                  v29 = [v27 fingerprint];
                  v30 = [v28 fingerPrint];
                  if ([v29 isEqualToString:v30])
                  {
                    int v31 = [(PLCloudMaster *)self placeholderState];

                    if (v31 != 1)
                    {
                      if ([v27 cloudLocalState] != 3)
                      {
                        if (!*MEMORY[0x1E4F59AC0])
                        {
                          v32 = __CPLAssetsdOSLogDomain();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v128 = v27;
                            _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Marking master local resource %@ as uploaded", buf, 0xCu);
                          }
                        }
                        [v27 setCloudLocalState:3];
                        objc_msgSend(v27, "setRemoteAvailability:", objc_msgSend(v28, "isAvailable"));
                        if (![v27 remoteAvailability] && !*MEMORY[0x1E4F59AC0])
                        {
                          v33 = __CPLAssetsdOSLogDomain();
                          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v128 = v27;
                            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Existing master resource marked as unavailable on pull: %@", buf, 0xCu);
                          }
                        }
                      }
                      if ([v27 isLocallyAvailable]) {
                        [v97 addObject:v27];
                      }
                      goto LABEL_75;
                    }
                  }
                  else
                  {
                  }
                  if (!*MEMORY[0x1E4F59AC0])
                  {
                    v34 = __CPLAssetsdOSLogDomain();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v128 = v15;
                      __int16 v129 = 2112;
                      v130 = v27;
                      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Applying resource change from updated master cloud resource %@ to local resource %@", buf, 0x16u);
                    }
                  }
                  uint64_t v35 = [v27 fingerprint];
                  if (v35 || ([v27 isDerivative] & 1) == 0)
                  {

                    char v105 = 1;
                  }
                  else
                  {
                    v105 |= (int)[v27 localAvailability] < 1;
                  }
                  v36 = [v27 asset];

                  if (v36)
                  {
                    v37 = [v27 asset];
                    v38 = [v27 asset];
                    v39 = [v27 asset];
                    v40 = [v38 storedResourceForCPLResource:v15 asset:v39 adjusted:0];

                    [v40 setCloudLocalState:3];
                    v41 = [v40 fileURL];
                    v42 = [v41 path];

                    if (v42)
                    {
                      if ([v37 isPlaceholderAsset])
                      {
                        v43 = [v37 momentShare];
                        if (v43) {
                          char v44 = [v94 fileExistsAtPath:v42];
                        }
                        else {
                          char v44 = 0;
                        }
                      }
                      else
                      {
                        char v44 = 0;
                      }
                      v48 = [v104 pathManager];
                      v49 = [v48 photoDirectoryWithType:4];

                      if ([v42 hasPrefix:v49])
                      {
                        if (!*MEMORY[0x1E4F59AC0])
                        {
                          v50 = __CPLAssetsdOSLogDomain();
                          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v128 = v40;
                            _os_log_impl(&dword_19B3C7000, v50, OS_LOG_TYPE_ERROR, "Found a resource change %@ under DCIM. This should not happen, skipping", buf, 0xCu);
                          }
                        }
                        if (v44)
                        {
LABEL_68:

                          self = v96;
                          goto LABEL_69;
                        }
                      }
                      else
                      {
                        if (v44) {
                          goto LABEL_68;
                        }
                        if ([v94 fileExistsAtPath:v42])
                        {
                          if (!*MEMORY[0x1E4F59AC0])
                          {
                            v51 = __CPLAssetsdOSLogDomain();
                            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v128 = v40;
                              _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, "Removing local master resource %@ due to resource change", buf, 0xCu);
                            }
                          }
                          [v94 removeItemAtPath:v42 error:0];
                        }
                      }
                      [v40 markAsNotLocallyAvailable];
                      goto LABEL_68;
                    }
LABEL_69:

                    goto LABEL_70;
                  }
                  v45 = [v27 transientCloudMaster];

                  if (!v45) {
                    goto LABEL_71;
                  }
                  v46 = [v27 transientCloudMaster];
                  v37 = +[PLResourceInstaller generateExternalResourceFromCPLResource:v15 cloudMaster:v46 masterResources:v99];

                  v47 = [v104 managedObjectContext];
                  [v27 updateResourceForMasterExternalCPLResource:v37 inManagedObjectContext:v47];

                  [v27 setCloudLocalState:3];
LABEL_70:

LABEL_71:
                  if ([(PLCloudMaster *)self placeholderState] == 1)
                  {
                    int v52 = v102;
                    if ((v102 & 1) == 0) {
                      int v52 = 1;
                    }
                    int v102 = v52;
                  }
LABEL_75:
                }
                uint64_t v25 = [obj countByEnumeratingWithState:&v115 objects:v137 count:16];
                if (!v25)
                {
                  id v11 = v99;
                  uint64_t v13 = v86;
                  goto LABEL_103;
                }
              }
            }
            id v11 = v99;
          }
          else
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              v53 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v128 = v15;
                _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEBUG, "Creating new master resource from cloud resource %@", buf, 0xCu);
              }
            }
            id obj = [(PLCloudMaster *)self rm_assetUUIDToCloudResources];
            if ([obj count])
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                v54 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  v55 = [obj allKeys];
                  *(_DWORD *)buf = 138412290;
                  v128 = v55;
                  _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Found existing master resources for assets %@", buf, 0xCu);
                }
              }
              long long v121 = 0u;
              long long v122 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              v56 = [obj allKeys];
              uint64_t v57 = [v56 countByEnumeratingWithState:&v119 objects:v138 count:16];
              if (v57)
              {
                uint64_t v58 = v57;
                uint64_t v59 = *(void *)v120;
                do
                {
                  for (uint64_t j = 0; j != v58; ++j)
                  {
                    if (*(void *)v120 != v59) {
                      objc_enumerationMutation(v56);
                    }
                    v61 = +[PLManagedAsset assetWithUUID:*(void *)(*((void *)&v119 + 1) + 8 * j) inLibrary:v104];
                    v62 = [v61 storedResourceForCPLResource:v15 asset:v61 adjusted:0];
                    [v62 setCloudLocalState:3];
                    if ([v62 isLocallyAvailable]) {
                      [v97 addObject:v62];
                    }
                  }
                  uint64_t v58 = [v56 countByEnumeratingWithState:&v119 objects:v138 count:16];
                }
                while (v58);
                id v11 = v99;
                uint64_t v13 = v86;
              }
            }
            else
            {
              v56 = +[PLResourceInstaller generateExternalResourceFromCPLResource:v15 cloudMaster:self masterResources:v11];
              v64 = [(PLCloudMaster *)self objectID];
              v65 = [v104 managedObjectContext];
              id v66 = +[PLInternalResource insertResourceForMasterObjectID:v64 withExternalCPLResource:v56 inManagedObjectContext:v65];
            }
            if ([v15 resourceType] == 23 || objc_msgSend(v15, "resourceType") == 24) {
              char v88 = 1;
            }
          }
LABEL_103:
          uint64_t v63 = v91;
        }
        uint64_t v14 = v63 + 1;
      }
      while (v14 != v13);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v123 objects:v139 count:16];
      if (!v13)
      {
        int v92 = v102 & 1;
        goto LABEL_108;
      }
    }
  }
  char v88 = 0;
  char v105 = 0;
  int v92 = 0;
LABEL_108:

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v93 = [(PLCloudMaster *)self assets];
  id obja = (id)[v93 countByEnumeratingWithState:&v111 objects:v136 count:16];
  if (obja)
  {
    uint64_t v98 = *(void *)v112;
    do
    {
      uint64_t v67 = 0;
      do
      {
        if (*(void *)v112 != v98) {
          objc_enumerationMutation(v93);
        }
        uint64_t v103 = v67;
        v68 = *(void **)(*((void *)&v111 + 1) + 8 * v67);
        if (v88) {
          [*(id *)(*((void *)&v111 + 1) + 8 * v67) reevaluateCameraProcessingAdjustmentState];
        }
        if (v105)
        {
          if (![v68 isPlaceholderAsset]
            || ([v68 momentShare], (uint64_t v69 = objc_claimAutoreleasedReturnValue()) == 0)
            || (v70 = (void *)v69, char v71 = [v68 hasMasterThumb], v70, (v71 & 1) == 0))
          {
            [v68 invalidateThumbnailIfNeededAfterMasterResourceChangeInLibrary:v104];
          }
        }
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        v72 = [v68 allMasterCPLResources];
        uint64_t v73 = [v72 countByEnumeratingWithState:&v107 objects:v135 count:16];
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v75 = *(void *)v108;
          do
          {
            for (uint64_t k = 0; k != v74; ++k)
            {
              if (*(void *)v108 != v75) {
                objc_enumerationMutation(v72);
              }
              v77 = *(void **)(*((void *)&v107 + 1) + 8 * k);
              if ([v77 supportsTrashedState]
                && (objc_msgSend(v68, "_isResourceType:inResources:", objc_msgSend(v77, "cplType"), v11) & 1) == 0)
              {
                if (!*MEMORY[0x1E4F59AC0])
                {
                  v78 = __CPLAssetsdOSLogDomain();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    v79 = objc_msgSend(MEMORY[0x1E4F59940], "shortDescriptionForResourceType:", objc_msgSend(v77, "cplType"));
                    v80 = [v77 objectID];
                    v81 = [v68 cloudAssetGUID];
                    *(_DWORD *)buf = 138544130;
                    v128 = v79;
                    __int16 v129 = 2112;
                    v130 = v95;
                    __int16 v131 = 2114;
                    v132 = v80;
                    __int16 v133 = 2114;
                    v134 = v81;
                    _os_log_impl(&dword_19B3C7000, v78, OS_LOG_TYPE_DEFAULT, "Detected master resource %{public}@ removed on master change %@. Expunging resource %{public}@ on asset %{public}@", buf, 0x2Au);

                    id v11 = v99;
                  }
                }
                [v77 applyTrashedState:2];
              }
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&v107 objects:v135 count:16];
          }
          while (v74);
        }

        uint64_t v67 = v103 + 1;
        self = v96;
      }
      while ((id)(v103 + 1) != obja);
      id obja = (id)[v93 countByEnumeratingWithState:&v111 objects:v136 count:16];
    }
    while (obja);
  }

  if (v92)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v82 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v83 = [(PLCloudMaster *)self scopedIdentifier];
        *(_DWORD *)buf = 138412290;
        v128 = v83;
        _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_DEFAULT, "Setting master %@ as non-placeholder", buf, 0xCu);
      }
    }
    [(PLCloudMaster *)self setPlaceholderState:0];
    [(PLCloudMaster *)self setSourceMasterForDuplicationCPLScopedIdentifier:0];
  }

  return v97;
}

- (BOOL)hasResourcesOtherThanForAssetUuid:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLCloudMaster *)self transientModernResources];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(PLCloudMaster *)self assets];
    uint64_t v7 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v8);
          }
          id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) uuid];
          int v12 = [v11 isEqualToString:v4];

          if (!v12)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v7;
}

- (id)allMasterResources
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(PLCloudMaster *)self transientModernResources];
  [v3 unionSet:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(PLCloudMaster *)self assets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) allMasterCPLResources];
        [v3 unionSet:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)rm_assetUUIDToCloudResources
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(PLCloudMaster *)self assets];
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v8 = [v7 uuid];
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v10 = [v7 modernResources];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v15 isCPLMasterResource]) {
                [v9 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }

        if ([v9 count]) {
          [v18 setObject:v9 forKeyedSubscript:v8];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  return v18;
}

- (id)rm_cloudResourceForResourceType:(unint64_t)a3 forAssetUuid:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(PLCloudMaster *)self assets];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 uuid];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          long long v15 = [v12 masterResourceForCPLType:a3];
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v15 = 0;
LABEL_11:

  return v15;
}

- (id)rm_cloudResourcesForResourceType:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [(PLCloudMaster *)self transientModernResources];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v11 cplType] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [(PLCloudMaster *)self assets];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) masterResourceForCPLType:a3];
        if (v17) {
          [v5 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (id)payloadsForChangedKeys:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(PLCloudMaster *)self assets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v21;
  *(void *)&long long v7 = 138543362;
  long long v18 = v7;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v12 = objc_msgSend(v11, "payloadID", v18);
      if (v12)
      {
        if (![v11 isValidForJournalPersistence]) {
          goto LABEL_13;
        }
        uint64_t v13 = [[PLAssetJournalEntryPayload alloc] initWithCloudMaster:self payloadID:v12 changedKeys:v4];
        if (v13) {
          [v19 addObject:v13];
        }
      }
      else
      {
        PLMigrationGetLog();
        uint64_t v13 = (PLAssetJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = [v11 objectID];
          *(_DWORD *)buf = v18;
          long long v25 = v14;
          _os_log_impl(&dword_19B3C7000, &v13->super.super, OS_LOG_TYPE_ERROR, "Skipping payload for CloudMaster update with nil payloadID for existing object: %{public}@", buf, 0xCu);
        }
      }

LABEL_13:
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v8);
LABEL_15:

  if ([v19 count]) {
    uint64_t v15 = v19;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (id)payloadID
{
  v2 = [(PLCloudMaster *)self cloudMasterGUID];
  uint64_t v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithString:v2];

  return v3;
}

- (void)setSourceMasterForDuplicationCPLScopedIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 identifier];
    [(PLCloudMaster *)self setSourceMasterForDuplicationIdentifier:v5];

    uint64_t v6 = [v7 scopeIdentifier];
    [(PLCloudMaster *)self setSourceMasterForDuplicationScopeIdentifier:v6];
  }
  else
  {
    [(PLCloudMaster *)self setSourceMasterForDuplicationIdentifier:0];
    [(PLCloudMaster *)self setSourceMasterForDuplicationScopeIdentifier:0];
  }
}

- (CPLScopedIdentifier)sourceMasterForDuplicationCPLScopedIdentifier
{
  uint64_t v3 = [(PLCloudMaster *)self sourceMasterForDuplicationIdentifier];
  id v4 = [(PLCloudMaster *)self sourceMasterForDuplicationScopeIdentifier];
  if (v3) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v4 identifier:v3];
  }
  else {
    uint64_t v5 = 0;
  }

  return (CPLScopedIdentifier *)v5;
}

- (BOOL)isSyncableChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(PLCloudMaster *)self changedValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = +[PLCloudMaster listOfSyncedProperties];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [v2 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * i)];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)originalFilenameForResourceType:(unint64_t)a3 filePath:(id)a4
{
  id v6 = a4;
  if (a3 - 17 < 2)
  {
    id v7 = [(PLCloudMaster *)self originalFilename];
    uint64_t v8 = [v7 stringByDeletingPathExtension];
    long long v9 = [v6 pathExtension];
    long long v11 = [v8 stringByAppendingPathExtension:v9];
    goto LABEL_5;
  }
  if (a3 - 23 < 2)
  {
    id v7 = [(PLCloudMaster *)self originalFilename];
    uint64_t v8 = [v7 stringByDeletingPathExtension];
    long long v9 = [v8 stringByAppendingString:*MEMORY[0x1E4F8C548]];
    long long v10 = [v6 pathExtension];
    long long v11 = [v9 stringByAppendingPathExtension:v10];

LABEL_5:
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    long long v11 = [(PLCloudMaster *)self originalFilename];
  }
  else
  {
    long long v11 = 0;
  }
LABEL_9:

  return v11;
}

- (void)_promptForNilScopeIdentifierRadar
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  uint64_t v4 = [(PLCloudMaster *)self objectID];
  int v5 = [(PLCloudMaster *)self isDeleted];
  id v6 = @"NO";
  if (v5) {
    id v6 = @"YES";
  }
  id v7 = [v3 stringWithFormat:@"Found cloud master with nil scope identifier %@ (isDeleted=%@) %@.\n\nSee rdar://problem/41018298", v4, v6, self];

  if (!*MEMORY[0x1E4F59AC0])
  {
    uint64_t v8 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v10 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }
  }
  +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Photo Library state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: cloud master with nil scope identifier" radarDescription:v7];
}

- (id)fingerprintScheme
{
  uint64_t v3 = [(PLCloudMaster *)self cloudMasterGUID];
  if (v3)
  {
    uint64_t v4 = [(PLCloudMaster *)self fingerprintContext];
    int v5 = [v4 fingerprintSchemeForMasterIdentifier:v3];
  }
  else
  {
    int v5 = [MEMORY[0x1E4F59898] invalidFingerprintScheme];
  }

  return v5;
}

- (id)fingerprintContext
{
  v2 = [(PLManagedObject *)self photoLibrary];
  uint64_t v3 = [v2 fingerprintContext];

  return v3;
}

- (id)scopedIdentifier
{
  uint64_t v3 = [(PLCloudMaster *)self scopeIdentifier];
  uint64_t v4 = [(PLCloudMaster *)self cloudMasterGUID];
  if (v4)
  {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4F59968]) initWithScopeIdentifier:v3 identifier:v4];
  }
  else
  {
    [(PLCloudMaster *)self _promptForNilScopeIdentifierRadar];
    int v5 = 0;
  }

  return v5;
}

- (id)scopeIdentifier
{
  uint64_t v3 = [(PLCloudMaster *)self momentShare];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 scopeIdentifier];
  }
  else
  {
    id v6 = [(PLManagedObject *)self photoLibrary];
    int v5 = [v6 mainScopeIdentifier];
  }
  return v5;
}

- (id)cplMasterPropertyChangeForAsset:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = self;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "PLCloudMaster %@", buf, 0xCu);
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F598B0]);
  uint64_t v8 = [(PLCloudMaster *)self scopedIdentifier];
  [v7 setScopedIdentifier:v8];

  long long v9 = [(PLCloudMaster *)self originalFilename];

  if (v9)
  {
    long long v10 = [(PLCloudMaster *)self originalFilename];
    [v7 setFilename:v10];
  }
  objc_msgSend(v7, "setFullSizeJPEGSource:", (int)-[PLCloudMaster fullSizeJPEGSource](self, "fullSizeJPEGSource"));
  uint64_t v11 = [(PLCloudMaster *)self creationDate];
  [v7 setCreationDate:v11];

  long long v12 = [(PLCloudMaster *)self importDate];
  [v7 setImportDate:v12];

  uint64_t v13 = [(PLCloudMaster *)self uniformTypeIdentifier];
  [v7 setItemType:v13];

  [v7 setChangeType:0];
  uint64_t v14 = [(PLCloudMaster *)self mediaMetadata];
  uint64_t v15 = [v14 valueForKey:@"data"];

  unint64_t v16 = [v15 length];
  if (v16 <= [MEMORY[0x1E4F59910] maxInlineDataSize]) {
    [v7 setMediaMetaData:v15];
  }
  long long v17 = [(PLCloudMaster *)self mediaMetadataType];
  [v7 setMediaMetaDataType:v17];

  long long v18 = [(PLCloudMaster *)self originatingAssetIdentifier];
  [v7 setOriginatingFingerprint:v18];

  objc_msgSend(v7, "setImportedBy:", -[PLCloudMaster importedBy](self, "importedBy"));
  id v19 = [(PLCloudMaster *)self importedByBundleIdentifier];
  [v7 setImportedByBundleIdentifier:v19];

  long long v20 = [(PLCloudMaster *)self importedByDisplayName];
  [v7 setImportedByDisplayName:v20];

  if ([(PLCloudMaster *)self placeholderState] == 1)
  {
    long long v21 = [(PLCloudMaster *)self sourceMasterForDuplicationCPLScopedIdentifier];
    [v7 setResourceCopyFromScopedIdentifier:v21];
  }
  if ([v4 kind] == 1)
  {
    long long v22 = [(PLCloudMaster *)self mediaMetadata];
    long long v23 = [v22 valueForKey:@"data"];

    if (v23)
    {
      id v36 = 0;
      long long v24 = [MEMORY[0x1E4F28F98] propertyListWithData:v23 options:0 format:0 error:&v36];
      long long v25 = v36;
      if (v24)
      {
        long long v26 = [MEMORY[0x1E4F16330] assetProxyWithPropertyList:v24];
        [v4 setVideoInfoOnMasterFromAVAsset:v26];
        uint64_t v27 = [(PLCloudMaster *)self codecName];
        [v7 setCodec:v27];

        objc_msgSend(v7, "setVideoFrameRate:", -[PLCloudMaster videoFrameRate](self, "videoFrameRate"));
LABEL_21:

        goto LABEL_22;
      }
      if (!*v5)
      {
        long long v26 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          long long v28 = [(PLCloudMaster *)self scopedIdentifier];
          *(_DWORD *)buf = 138543618;
          v38 = v28;
          __int16 v39 = 2114;
          v40 = v25;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "cplMasterPropertyChangeFromCloudMaster: unable to serialize videoProperties for %{public}@: %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
    else
    {
      if (*v5)
      {
LABEL_24:

        goto LABEL_25;
      }
      long long v25 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_24;
      }
      long long v24 = [(PLCloudMaster *)self scopedIdentifier];
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "cplMasterPropertyChangeFromCloudMaster: unable to find mediaPropertiesData for %{public}@", buf, 0xCu);
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:
  uint64_t v29 = [v4 importSession];
  v30 = v29;
  if (v29)
  {
    int v31 = [v29 importSessionID];
    [v7 setImportGroupIdentifier:v31];
  }
  if (!*v5)
  {
    v32 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      int v33 = [(PLCloudMaster *)self originalOrientation];
      *(_DWORD *)buf = 67109120;
      LODWORD(v38) = v33;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "Setting original orientation %d to masterChange", buf, 8u);
    }
  }
  objc_msgSend(v7, "setOriginalOrientation:", (int)-[PLCloudMaster originalOrientation](self, "originalOrientation"));
  v34 = objc_msgSend(v4, "rm_cplExpungeableMasterResourceStates");
  if ([v34 count]) {
    [v7 setExpungeableResourceStates:v34];
  }

  return v7;
}

- (id)cplPropertyRecord
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLCloudMaster *)self assets];
  if ([v3 count])
  {
    id v4 = [v3 anyObject];
    int v5 = [(PLCloudMaster *)self cplMasterPropertyChangeForAsset:v4];

    [v5 setChangeType:2];
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v6 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        long long v9 = self;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Can't find any asset for this master: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    int v5 = 0;
  }

  return v5;
}

- (id)cplFullRecord
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLCloudMaster *)self assets];
  if ([v3 count])
  {
    id v4 = [v3 anyObject];
    int v5 = [(PLManagedObject *)self photoLibrary];
    id v6 = objc_msgSend(v4, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", v5, objc_msgSend(MEMORY[0x1E4F59940], "cplShouldGenerateDerivatives") ^ 1);
  }
  else
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      id v7 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        uint64_t v10 = self;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Can't find any asset for this master: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    id v6 = 0;
  }

  return v6;
}

- (BOOL)allOriginalsAreLocallyAvailableForAssetUuid:(id)a3 useOriginalAltInsteadOfOriginal:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = +[PLCloudMaster _originalTypes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v7);
      }
      long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
      uint64_t v13 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v14 = [v12 integerValue];
      if (v4)
      {
        if (v14 != 1) {
          goto LABEL_10;
        }
      }
      else if (v14 != 17)
      {
LABEL_10:
        if ([v12 integerValue] != 17)
        {
          uint64_t v15 = -[PLCloudMaster rm_cloudResourceForResourceType:forAssetUuid:](self, "rm_cloudResourceForResourceType:forAssetUuid:", [v12 unsignedIntegerValue], v6);
          unint64_t v16 = v15;
          if (v15 && ([v15 isLocallyAvailable] & 1) == 0)
          {

            BOOL v17 = 0;
            goto LABEL_18;
          }
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v17 = 1;
LABEL_18:

  return v17;
}

- (BOOL)allOriginalsAreUploaded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = +[PLCloudMaster _originalTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v10 = -[PLCloudMaster rm_cloudResourcesForResourceType:](self, "rm_cloudResourcesForResourceType:", [v8 unsignedIntegerValue]);
        uint64_t v11 = [v10 firstObject];

        if (v11 && [v11 cloudLocalState] != 3)
        {

          BOOL v12 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (unint64_t)sizeOfOriginal
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = +[PLCloudMaster _originalTypes];
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v9 = -[PLCloudMaster rm_cloudResourcesForResourceType:](self, "rm_cloudResourcesForResourceType:", [v7 unsignedIntegerValue]);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v15 isLocallyAvailable])
              {
                v4 += [v15 dataLength];
                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v3);
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  uint64_t v3 = [(PLCloudMaster *)self allMasterResources];
  uint64_t v4 = [v3 count];

  uint64_t v5 = NSString;
  uint64_t v6 = [(PLCloudMaster *)self cloudMasterGUID];
  id v7 = [v5 stringWithFormat:@"Cloud master GUID: %@ cloudLocalState: %d JPEGSource: %d %lu resources\n", v6, (int)-[PLCloudMaster cloudLocalState](self, "cloudLocalState"), (int)-[PLCloudMaster fullSizeJPEGSource](self, "fullSizeJPEGSource"), v4];

  return (NSString *)v7;
}

- (void)updateImportedByDisplayName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLCloudMaster *)self setImportedByDisplayName:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(PLCloudMaster *)self assets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [v10 importedByDisplayName];
        char IsEqual = PLObjectIsEqual();

        if ((IsEqual & 1) == 0) {
          [v10 setImportedByDisplayName:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)updateImportedByBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLCloudMaster *)self setImportedByBundleIdentifier:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(PLCloudMaster *)self assets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [v10 importedByBundleIdentifier];
        char IsEqual = PLObjectIsEqual();

        if ((IsEqual & 1) == 0) {
          [v10 setImportedByBundleIdentifier:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)applyPropertiesFromCPLMasterChange:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLCloudMaster *)self originalFilename];
  uint64_t v6 = [v4 filename];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [v4 filename];
    [(PLCloudMaster *)self setOriginalFilename:v8];
  }
  int v9 = [(PLCloudMaster *)self fullSizeJPEGSource];
  if ([v4 fullSizeJPEGSource] != v9) {
    -[PLCloudMaster setFullSizeJPEGSource:](self, "setFullSizeJPEGSource:", (__int16)[v4 fullSizeJPEGSource]);
  }
  id v10 = [(PLCloudMaster *)self creationDate];
  uint64_t v11 = [v4 creationDate];
  char v12 = [v10 isEqualToDate:v11];

  if ((v12 & 1) == 0)
  {
    long long v13 = [v4 creationDate];
    [(PLCloudMaster *)self setCreationDate:v13];
  }
  long long v14 = [(PLCloudMaster *)self importDate];
  long long v15 = [v4 importDate];
  char v16 = [v14 isEqualToDate:v15];

  if ((v16 & 1) == 0)
  {
    long long v17 = [v4 importDate];
    [(PLCloudMaster *)self setImportDate:v17];
  }
  uint64_t v18 = [(PLCloudMaster *)self uniformTypeIdentifier];
  long long v19 = [v4 itemType];
  char v20 = [v18 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
    long long v21 = [v4 itemType];
    [(PLCloudMaster *)self setUniformTypeIdentifier:v21];
  }
  int v22 = [(PLCloudMaster *)self originalOrientation];
  if ([v4 originalOrientation] != v22) {
    -[PLCloudMaster setOriginalOrientation:](self, "setOriginalOrientation:", (__int16)[v4 originalOrientation]);
  }
  long long v23 = [(PLCloudMaster *)self mediaMetadata];
  long long v24 = [v23 valueForKey:@"data"];
  long long v25 = [v4 mediaMetaData];
  char v26 = [v24 isEqualToData:v25];

  if ((v26 & 1) == 0)
  {
    uint64_t v27 = [(PLCloudMaster *)self mediaMetadata];
    long long v28 = [v4 mediaMetaData];
    [v27 setValue:v28 forKey:@"data"];
  }
  uint64_t v29 = [(PLCloudMaster *)self mediaMetadataType];
  v30 = [v4 mediaMetaDataType];
  char v31 = [v29 isEqualToString:v30];

  if ((v31 & 1) == 0)
  {
    v32 = [v4 mediaMetaDataType];
    [(PLCloudMaster *)self setMediaMetadataType:v32];
  }
  uint64_t v33 = [v4 importGroupIdentifier];
  if (v33)
  {
    v34 = (void *)v33;
    uint64_t v35 = [(PLCloudMaster *)self importSessionID];
    id v36 = [v4 importGroupIdentifier];
    char v37 = [v35 isEqualToString:v36];

    if ((v37 & 1) == 0)
    {
      v38 = [v4 importGroupIdentifier];
      [(PLCloudMaster *)self setImportSessionID:v38];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      __int16 v39 = [(PLCloudMaster *)self assets];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v54;
        do
        {
          uint64_t v43 = 0;
          do
          {
            if (*(void *)v54 != v42) {
              objc_enumerationMutation(v39);
            }
            [*(id *)(*((void *)&v53 + 1) + 8 * v43++) setImportSessionAlbumWithImportSessionID:v38];
          }
          while (v41 != v43);
          uint64_t v41 = [v39 countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v41);
      }
    }
  }
  char v44 = [(PLCloudMaster *)self originatingAssetIdentifier];
  v45 = [v4 originatingFingerprint];
  char v46 = [v44 isEqualToString:v45];

  if ((v46 & 1) == 0)
  {
    v47 = [v4 originatingFingerprint];
    [(PLCloudMaster *)self setOriginatingAssetIdentifier:v47];
  }
  int v48 = [(PLCloudMaster *)self importedBy];
  if (v48 != [v4 importedBy]) {
    -[PLCloudMaster setImportedBy:](self, "setImportedBy:", [v4 importedBy]);
  }
  v49 = [v4 importedByBundleIdentifier];

  if (v49)
  {
    v50 = [v4 importedByBundleIdentifier];
    [(PLCloudMaster *)self updateImportedByBundleIdentifier:v50];
  }
  v51 = [v4 importedByDisplayName];

  if (v51)
  {
    int v52 = [v4 importedByDisplayName];
    [(PLCloudMaster *)self updateImportedByDisplayName:v52];
  }
}

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)PLCloudMaster;
  [(PLCloudMaster *)&v5 awakeFromInsert];
  uint64_t v3 = [(PLCloudMaster *)self managedObjectContext];
  id v4 = +[PLManagedObject insertInManagedObjectContext:v3];
  [(PLCloudMaster *)self setMediaMetadata:v4];
}

- (BOOL)supportsCloudUpload
{
  return 1;
}

+ (id)entityName
{
  return @"CloudMaster";
}

+ (unint64_t)fullSizeJPEGSourceForUTI:(id)a3 andImageDimensions:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v6 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:a3];
  int v7 = [v6 conformsToType:*MEMORY[0x1E4F44498]];

  return !v7
      || [MEMORY[0x1E4F8CC38] rawSourceMaximumPixelCountForBackgroundProcessing] >= (uint64_t)(width * height);
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  uint64_t v2 = (void *)listOfSyncedProperties_result_87573;
  return v2;
}

void __39__PLCloudMaster_listOfSyncedProperties__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"creationDate", @"importDate", @"uniformTypeIdentifier", @"originalFilename", @"originatingAssetIdentifier", @"importedBy", @"videoFrameRate", @"codecName", @"mediaMetadataType", @"importedByBundleIdentifier", @"importedByDisplayName", 0);
  v1 = (void *)listOfSyncedProperties_result_87573;
  listOfSyncedProperties_result_87573 = v0;
}

+ (id)_originalTypes
{
  if (_originalTypes_onceToken != -1) {
    dispatch_once(&_originalTypes_onceToken, &__block_literal_global_81_87608);
  }
  uint64_t v2 = (void *)_originalTypes_originalTypes;
  return v2;
}

void __31__PLCloudMaster__originalTypes__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1EEBEFC60, &unk_1EEBEFC78, &unk_1EEBEFC90, &unk_1EEBEFCA8, &unk_1EEBEFCC0, 0);
  v1 = (void *)_originalTypes_originalTypes;
  _originalTypes_originalTypes = v0;
}

+ (void)deleteMasterIfNecessary:(id)a3 inLibrary:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    int v7 = [v5 assets];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      uint64_t v11 = [v6 libraryServicesManager];
      int v9 = [v11 cloudPhotoLibraryManager];

      char v12 = [v5 allMasterResources];
      +[PLInternalResource triggerBackgroundDownloadFailureForResources:v12 cloudPhotoLibraryManager:v9];

      if (!*MEMORY[0x1E4F59AC0])
      {
        long long v13 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          id v15 = v5;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Deleting master %@", (uint8_t *)&v14, 0xCu);
        }
      }
      id v10 = [v6 managedObjectContext];
      [v10 deleteObject:v5];
      goto LABEL_11;
    }
    if (!*MEMORY[0x1E4F59AC0])
    {
      int v9 = __CPLAssetsdOSLogDomain();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      id v10 = [v5 assets];
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = [v10 count];
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Ignored deleting a master record: %@, master still being referred by %lu assets", (uint8_t *)&v14, 0x16u);
LABEL_11:

      goto LABEL_12;
    }
  }
LABEL_13:
}

+ (void)deleteOrphanedMastersWithManagedObjectContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  int v7 = [a1 entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  int v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $asset, $asset != nil).@count = 0", @"assets"];
  [v8 setPredicate:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
  [v10 setResultType:2];
  id v15 = 0;
  uint64_t v11 = [v4 executeRequest:v10 error:&v15];
  id v12 = v15;
  if (v11)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      long long v13 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v11 result];
        *(_DWORD *)buf = 138412290;
        id v17 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %@ orphaned cloud masters", buf, 0xCu);
      }
LABEL_8:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    long long v13 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to delete orphaned cloud masters %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
}

+ (void)resetCloudMastersStateInManagedObjectContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int v7 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Resetting cloudLocalState of cloud masters", buf, 2u);
    }
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C038]);
  int v9 = [a1 entityName];
  id v10 = (void *)[v8 initWithEntityName:v9];

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudLocalState != %d", 0);
  [v10 setPredicate:v11];
  [v10 setResultType:2];
  [v10 setPropertiesToUpdate:&unk_1EEBF29F0];
  id v16 = 0;
  id v12 = [v4 executeRequest:v10 error:&v16];
  id v13 = v16;
  if (v13)
  {
    if (!*v6)
    {
      int v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to batch update cloud masters: %@", buf, 0xCu);
      }
LABEL_12:
    }
  }
  else if (!*v6)
  {
    int v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v12 result];
      *(_DWORD *)buf = 138412290;
      id v18 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Batch updated %@ cloud masters", buf, 0xCu);
    }
    goto LABEL_12;
  }
}

+ (void)deleteAllCloudMastersInManagedObjectContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    int v7 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Deleting all cloud masters locally", buf, 2u);
    }
  }
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  int v9 = [a1 entityName];
  id v10 = [v8 fetchRequestWithEntityName:v9];

  [v10 setFetchBatchSize:100];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v10];
  [v11 setResultType:2];
  id v16 = 0;
  id v12 = [v4 executeRequest:v11 error:&v16];
  id v13 = v16;
  if (v13)
  {
    if (!*v6)
    {
      int v14 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to batch delete cloud masters: Error: %@", buf, 0xCu);
      }
LABEL_12:
    }
  }
  else if (!*v6)
  {
    int v14 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v12 result];
      *(_DWORD *)buf = 138412290;
      id v18 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Batch deleted %@ cloud masters", buf, 0xCu);
    }
    goto LABEL_12;
  }
}

+ (id)cloudMastersWithScopedIdentifiers:(id)a3 relationshipKeyPathsForPrefetching:(id)a4 inLibrary:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PLCloudMaster entityName];
  uint64_t v11 = +[PLManagedAsset objectsWithScopedIdentifiers:v9 forEntityName:v10 prefetchResources:0 relationshipKeyPathsForPrefetching:v8 inLibrary:v7];

  return v11;
}

+ (PLCloudMaster)cloudMasterWithScopedIdentifier:(id)a3 prefetchResources:(BOOL)a4 inLibrary:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v15 = 0;
  BOOL v9 = +[PLShare getShareIfNecessary:&v15 forCPLRecordWithClass:objc_opt_class() scopedIdentifier:v7 inLibrary:v8];
  id v10 = v15;
  uint64_t v11 = 0;
  if (v9)
  {
    id v12 = [v7 identifier];
    id v13 = [v8 managedObjectContext];
    uint64_t v11 = +[PLCloudMaster cloudMasterWithGUID:v12 inMomentShare:v10 prefetchResources:v6 inManagedObjectContext:v13];
  }
  return (PLCloudMaster *)v11;
}

+ (id)cloudMastersByScopedIdentifiers:(id)a3 relationshipKeyPathsForPrefetching:(id)a4 inLibrary:(id)a5
{
  id v5 = [a1 cloudMastersWithScopedIdentifiers:a3 relationshipKeyPathsForPrefetching:a4 inLibrary:a5];
  BOOL v6 = objc_msgSend(v5, "_pl_indexBy:", &__block_literal_global_87656);

  return v6;
}

uint64_t __94__PLCloudMaster_cloudMastersByScopedIdentifiers_relationshipKeyPathsForPrefetching_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scopedIdentifier];
}

+ (PLCloudMaster)cloudMasterWithGUID:(id)a3 inMomentShare:(id)a4 prefetchResources:(BOOL)a5 inManagedObjectContext:(id)a6
{
  BOOL v7 = a5;
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    id v13 = (void *)MEMORY[0x19F38D3B0]();
    int v14 = (void *)MEMORY[0x1E4F1C0D0];
    id v15 = [a1 entityName];
    id v16 = [v14 fetchRequestWithEntityName:v15];

    id v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"cloudMasterGUID == %@ AND momentShare == %@", v10, v11];
    [v16 setPredicate:v17];
    [v16 setFetchLimit:1];
    if (v7)
    {
      v23[0] = @"assets.modernResources";
      v23[1] = @"transientModernResources";
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      [v16 setRelationshipKeyPathsForPrefetching:v18];
    }
    uint64_t v22 = 0;
    uint64_t v19 = [v12 executeFetchRequest:v16 error:&v22];
    if ([v19 count])
    {
      char v20 = [v19 firstObject];
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return (PLCloudMaster *)v20;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withCloudMasterGUID:(id)a4 inMomentShare:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLCloudMaster.m", 82, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PLCloudMaster.m", 83, @"Invalid parameter not satisfying: %@", @"cloudMasterGUID" object file lineNumber description];

LABEL_3:
  id v12 = [v9 managedObjectContext];
  id v13 = [a1 entityName];
  int v14 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v13, (uint64_t)v12, 0);

  [v14 setCloudMasterGUID:v10];
  if (v11) {
    [v14 setMomentShare:v11];
  }

  return v14;
}

@end