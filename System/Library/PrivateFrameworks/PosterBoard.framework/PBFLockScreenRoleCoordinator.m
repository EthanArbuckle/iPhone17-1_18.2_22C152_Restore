@interface PBFLockScreenRoleCoordinator
+ (BOOL)supportsSupplementalUpdates;
+ (id)supportedAttributes;
+ (id)supportedChangeTypes;
- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6;
- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10;
- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5;
- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4;
- (PBFLockScreenRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5;
- (id)defaultAttributesForNewPosterFromProvider:(id)a3;
- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4;
@end

@implementation PBFLockScreenRoleCoordinator

- (PBFLockScreenRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F92790];
  v10.receiver = self;
  v10.super_class = (Class)PBFLockScreenRoleCoordinator;
  return [(PBFPosterRoleCoordinator *)&v10 initWithRole:v8 storage:a3 modelCoordinatorProvider:a4 providers:a5];
}

+ (BOOL)supportsSupplementalUpdates
{
  return 1;
}

- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PBFLockScreenRoleCoordinator;
  v25 = a4;
  if ([(PBFPosterRoleCoordinator *)&v30 synchronizeFileSystemAttributesForStorage:v6 error:a4])
  {
    [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v6];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v24 = long long v29 = 0u;
    id obj = [v24 orderedPosters];
    uint64_t v23 = [obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v27;
      v7 = (void *)*MEMORY[0x1E4F92760];
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_super v10 = self;
          v11 = [(id)objc_opt_class() supportedAttributes];
          v12 = [v24 attributesForPoster:v9 ofTypes:v11];

          v13 = [v24 configuredPropertiesForPoster:v9];
          v14 = [v13 focusConfiguration];

          v15 = [v12 objectForKey:v7];
          v16 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [(PBFPosterRoleCoordinator *)v10 role];
            *(_DWORD *)buf = 138543874;
            v32 = v17;
            __int16 v33 = 2112;
            v34 = v9;
            __int16 v35 = 2112;
            v36 = v14;
            _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Synchronizing configuration for poster %@ with disk focus %@", buf, 0x20u);
          }
          int v18 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v9, v7, v14, v15, 0, 0, v6, v25);

          if (!v18)
          {
            BOOL v19 = 0;
            goto LABEL_15;
          }
          self = v10;
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v26 objects:v37 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    BOOL v19 = 1;
LABEL_15:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)defaultAttributesForNewPosterFromProvider:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PBFLockScreenRoleCoordinator;
  id v4 = a3;
  v5 = [(PBFPosterRoleCoordinator *)&v12 defaultAttributesForNewPosterFromProvider:v4];
  id v6 = objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);

  v7 = (void *)MEMORY[0x1E4F92680];
  uint64_t v8 = [(PBFPosterRoleCoordinator *)self role];
  v9 = [v7 defaultHomeScreenConfigurationForProvider:v4 role:v8];

  [v6 setObject:v9 forKey:*MEMORY[0x1E4F92768]];
  objc_super v10 = (void *)[v6 copy];

  return v10;
}

- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v6];
  }
  else {
  uint64_t v8 = [(PBFPosterRoleCoordinator *)self posterCollection];
  }
  v9 = [(PBFPosterRoleCoordinator *)self role];
  objc_super v10 = objc_msgSend(v7, "pbf_desiredActiveConfigurationForRole:", v9);

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__11;
  v64 = __Block_byref_object_dispose__11;
  id v65 = [v8 posterWithUUID:v10];
  v52 = [(PBFPosterRoleCoordinator *)self posterConfigurationsSortedByLastActivatedDate:v8];
  if (v10)
  {
    v11 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = [(PBFPosterRoleCoordinator *)self role];
      v13 = (void *)v61[5];
      *(_DWORD *)buf = 138543874;
      id v67 = v12;
      __int16 v68 = 2114;
      v69 = v13;
      __int16 v70 = 2114;
      id v71 = v10;
      _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: %{public}@/%{public}@ as active poster configuration", buf, 0x20u);
    }
  }
  v14 = objc_msgSend(v7, "pbf_activeFocusMode");
  if (v10) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v14 == 0;
  }
  int v16 = !v15;

  if (v16)
  {
    v17 = objc_msgSend(v7, "pbf_activeFocusMode");
    int v18 = [v17 activityUniqueIdentifier];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke;
    v56[3] = &unk_1E6983E80;
    id v19 = v8;
    id v57 = v19;
    id v20 = v18;
    id v58 = v20;
    v59 = &v60;
    [v52 enumerateObjectsWithOptions:2 usingBlock:v56];
    if (v61[5])
    {
      v21 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v49 = v20;
        id v50 = v6;
        id v51 = [(PBFPosterRoleCoordinator *)self role];
        uint64_t v22 = (void *)v61[5];
        uint64_t v23 = [v19 configuredPropertiesForPoster:v22];
        id v24 = [v23 focusConfiguration];
        v25 = objc_msgSend(v7, "pbf_activeFocusMode");
        long long v26 = [v25 activityUniqueIdentifier];
        *(_DWORD *)buf = 138544130;
        id v67 = v51;
        __int16 v68 = 2112;
        v69 = v22;
        __int16 v70 = 2112;
        id v71 = v24;
        __int16 v72 = 2112;
        v73 = v26;
        _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: %@ with focus configuration: %@ associated with active focus mode identifier: %@ as active poster configuration", buf, 0x2Au);

        id v20 = v49;
        id v6 = v50;
      }
    }
    else
    {
      v21 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = v20;
        id v28 = [(PBFPosterRoleCoordinator *)self role];
        long long v29 = objc_msgSend(v7, "pbf_activeFocusMode");
        objc_super v30 = [v29 activityUniqueIdentifier];
        *(_DWORD *)buf = 138543618;
        id v67 = v28;
        __int16 v68 = 2112;
        v69 = v30;
        _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: did not find poster associated with active focus mode identifier: %@", buf, 0x16u);

        id v20 = v27;
      }
    }
  }
  if (!v61[5])
  {
    v31 = [v8 selectedPoster];
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      uint64_t v33 = [v8 selectedPoster];
      v34 = (void *)v61[5];
      v61[5] = v33;

      __int16 v35 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [(PBFPosterRoleCoordinator *)self role];
        v37 = (void *)v61[5];
        *(_DWORD *)buf = 138543618;
        id v67 = v36;
        __int16 v68 = 2112;
        v69 = v37;
        _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: using selected poster: %@ as active poster configuration", buf, 0x16u);
      }
      uint64_t v38 = [v8 configuredPropertiesForPoster:v61[5]];
      v39 = [v38 focusConfiguration];

      if (v39)
      {
        v40 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = [(PBFPosterRoleCoordinator *)self role];
          v42 = (void *)v61[5];
          *(_DWORD *)buf = 138543618;
          id v67 = v41;
          __int16 v68 = 2112;
          v69 = v42;
          _os_log_impl(&dword_1D31CE000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: selected poster: %@ is still tied to a focus", buf, 0x16u);
        }
      }
    }
  }
  v43 = (void *)v61[5];
  if (!v43)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke_5;
    v53[3] = &unk_1E6983EA8;
    id v54 = v8;
    v55 = &v60;
    [v52 enumerateObjectsWithOptions:2 usingBlock:v53];
    v44 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [(PBFPosterRoleCoordinator *)self role];
      v46 = (void *)v61[5];
      *(_DWORD *)buf = 138543618;
      id v67 = v45;
      __int16 v68 = 2112;
      v69 = v46;
      _os_log_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: using most recently used poster: %@ with no focus as active poster configuration", buf, 0x16u);
    }
    v43 = (void *)v61[5];
  }
  id v47 = v43;

  _Block_object_dispose(&v60, 8);
  return v47;
}

void __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "configuredPropertiesForPoster:");
  uint64_t v8 = [v7 focusConfiguration];

  v9 = [v8 activityUUID];
  int v10 = [v9 isEqual:*(void *)(a1 + 40)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "configuredPropertiesForPoster:");
  uint64_t v8 = [v7 focusConfiguration];

  if (!v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(PBFPosterRoleCoordinator *)self validateEventIsRelevant:v8])
  {
    int v10 = [(PBFPosterRoleCoordinator *)self role];
    id v11 = objc_opt_new();
    v17.receiver = self;
    v17.super_class = (Class)PBFLockScreenRoleCoordinator;
    uint64_t v18 = 0;
    BOOL v12 = [(PBFPosterRoleCoordinator *)&v17 notifyEventWasReceived:v8 changes:&v18 storage:v9];
    if (v12) {
      [v11 addObjectsFromArray:v18];
    }
    uint64_t v13 = [v11 count];
    if (a4 && v13) {
      *a4 = (id)[v11 copy];
    }
    v14 = objc_opt_class();
    BOOL v15 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v9];
    [v14 dumpResultsForEvent:v8 role:v10 posterCollection:v15 changes:v11 eventWasHandled:v12];
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (id)supportedAttributes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PBFLockScreenRoleCoordinator_supportedAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedAttributes_onceToken_0 != -1) {
    dispatch_once(&supportedAttributes_onceToken_0, block);
  }
  v2 = (void *)supportedAttributes_supportedAttributes_0;
  return v2;
}

void __51__PBFLockScreenRoleCoordinator_supportedAttributes__block_invoke(uint64_t a1)
{
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___PBFLockScreenRoleCoordinator;
  v1 = objc_msgSendSuper2(&v8, sel_supportedAttributes);
  v2 = (void *)[v1 mutableCopy];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;

  [v5 addObject:*MEMORY[0x1E4F92760]];
  [v5 addObject:*MEMORY[0x1E4F92768]];
  uint64_t v6 = [v5 copy];
  id v7 = (void *)supportedAttributes_supportedAttributes_0;
  supportedAttributes_supportedAttributes_0 = v6;
}

+ (id)supportedChangeTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PBFLockScreenRoleCoordinator_supportedChangeTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedChangeTypes_onceToken_0 != -1) {
    dispatch_once(&supportedChangeTypes_onceToken_0, block);
  }
  v2 = (void *)supportedChangeTypes_supportedChangeTypes_0;
  return v2;
}

void __52__PBFLockScreenRoleCoordinator_supportedChangeTypes__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v9[0] = @"PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v4 = [v2 setWithArray:v3];

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___PBFLockScreenRoleCoordinator;
  v5 = objc_msgSendSuper2(&v8, sel_supportedChangeTypes);
  [v4 unionSet:v5];

  uint64_t v6 = [v4 copy];
  id v7 = (void *)supportedChangeTypes_supportedChangeTypes_0;
  supportedChangeTypes_supportedChangeTypes_0 = v6;
}

- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6
{
  v86[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [v10 changeType];
  char v13 = [v12 isEqual:@"PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties"];

  if (v13)
  {
    v14 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v11];
    BOOL v15 = [v10 userInfo];
    uint64_t v16 = [v15 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];

    objc_super v17 = [v14 posterWithUUID:v16];
    uint64_t v18 = [v10 userInfo];
    uint64_t v19 = [v18 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties"];

    if (v16) {
      BOOL v20 = v17 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    v82 = (void *)v19;
    if (v20 || v19 == 0)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      v85[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
      uint64_t v23 = [v10 description];
      id v24 = (void *)v23;
      v25 = @"(null change)";
      if (v23) {
        v25 = (__CFString *)v23;
      }
      v85[1] = @"posterUUIDToUpdate";
      long long v26 = @"(null uuid)";
      if (v16) {
        long long v26 = (__CFString *)v16;
      }
      v86[0] = v25;
      v86[1] = v26;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
      v28 = id v27 = (void *)v16;
      [v22 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v28];
      unsigned __int8 v29 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
    v78 = (void *)v16;
    v79 = a5;
    objc_super v30 = [v17 _path];
    uint64_t v31 = [v30 serverIdentity];

    id v83 = 0;
    int v32 = [v14 isPosterConfigurationAnAssociatedPoster:v17 parentPoster:&v83];
    id v33 = v83;
    v80 = a6;
    v81 = (void *)v31;
    id v76 = v11;
    v77 = v17;
    v75 = self;
    if (v32)
    {
      v34 = (objc_class *)MEMORY[0x1E4F925C0];
      id v35 = v83;
      id v36 = [v34 alloc];
      v37 = [v17 _path];
      uint64_t v38 = objc_msgSend(v17, "pbf_posterUUID");
      v39 = objc_msgSend(v35, "pbf_posterUUID");
      v40 = [(id)objc_opt_class() supportedAttributes];
      v41 = v17;
      v42 = v33;
      v43 = [v14 attributesForPoster:v41 ofTypes:v40];
      id v24 = (void *)[v36 initWithUpdatedPath:v37 updatedPosterUUID:v38 parentPosterUUID:v39 sourceIdentity:v31 configuredProperties:v82 attributes:v43];
LABEL_38:

      id v11 = v76;
      unsigned __int8 v29 = [(PBFPosterRoleCoordinator *)v75 _ingestIncomingPosterConfiguration:v24 change:v10 currentCollection:v14 storage:v76 outEvents:v79 error:v80];

      id v28 = v81;
      objc_super v17 = v77;
      id v27 = v78;
LABEL_39:

      goto LABEL_40;
    }
    id v74 = v83;
    id v44 = v83;
    v45 = [(id)objc_opt_class() supportedAttributes];
    v73 = v14;
    v46 = [v14 attributesForPoster:v17 ofTypes:v45];
    id v47 = (void *)[v46 mutableCopy];
    v48 = v47;
    if (v47) {
      id v49 = v47;
    }
    else {
      id v49 = (id)objc_opt_new();
    }
    id v50 = v49;

    uint64_t v38 = [v82 focusConfiguration];
    if (v38)
    {
      uint64_t v51 = *MEMORY[0x1E4F92760];
      v52 = [v50 objectForKey:*MEMORY[0x1E4F92760]];
      char v53 = [v38 isEqual:v52];

      if (v53)
      {
        int v72 = 0;
      }
      else
      {
        [v50 setObject:v38 forKeyedSubscript:v51];
        int v72 = 1;
      }
    }
    else
    {
      id v54 = [v50 allKeys];
      uint64_t v55 = *MEMORY[0x1E4F92760];
      int v72 = [v54 containsObject:*MEMORY[0x1E4F92760]];

      [v50 removeObjectForKey:v55];
    }
    v56 = [v82 homeScreenConfiguration];
    if (v56)
    {
      uint64_t v57 = *MEMORY[0x1E4F92768];
      id v58 = [v50 objectForKey:*MEMORY[0x1E4F92768]];
      char v59 = [v56 isEqual:v58];

      if (v59)
      {
        uint64_t v60 = v56;
        if (!v72)
        {
LABEL_37:
          id v70 = objc_alloc(MEMORY[0x1E4F925C0]);
          v40 = [v17 _path];
          v43 = objc_msgSend(v17, "pbf_posterUUID");
          id v24 = (void *)[v70 initWithUpdatedPath:v40 updatedPosterUUID:v43 sourceIdentity:v81 configuredProperties:v82 attributes:v50];
          v37 = v50;
          v14 = v73;
          v42 = v74;
          v39 = v60;
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v60 = v56;
        [v50 setObject:v56 forKeyedSubscript:v57];
      }
    }
    else
    {
      uint64_t v60 = 0;
      v61 = [v50 allKeys];
      uint64_t v62 = *MEMORY[0x1E4F92768];
      unsigned __int8 v63 = [v61 containsObject:*MEMORY[0x1E4F92768]];

      [v50 removeObjectForKey:v62];
      if (((v63 | v72) & 1) == 0) {
        goto LABEL_37;
      }
    }
    uint64_t v64 = *MEMORY[0x1E4F92780];
    id v65 = [v50 objectForKeyedSubscript:*MEMORY[0x1E4F92780]];
    v66 = v65;
    if (v65) {
      id v67 = v65;
    }
    else {
      id v67 = (id)objc_opt_new();
    }
    __int16 v68 = v67;

    v69 = [v68 usageMetadataWithUpdatedLastModifiedDate];

    [v50 setObject:v69 forKeyedSubscript:v64];
    goto LABEL_37;
  }
  v84.receiver = self;
  v84.super_class = (Class)PBFLockScreenRoleCoordinator;
  unsigned __int8 v29 = [(PBFPosterRoleCoordinator *)&v84 _executeChange:v10 storage:v11 outEvents:a5 error:a6];
LABEL_40:

  return v29;
}

- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)PBFLockScreenRoleCoordinator;
  BOOL v18 = [(PBFPosterRoleCoordinator *)&v29 _prepareAttributesForIngestionForPoster:v16 existingAttributes:a4 incomingAttributes:a5 proposedAttributesToDelete:a6 proposedAttributesToUpdate:a7 storage:a8 currentCollection:v17 error:a10];
  if (v18 && [*a6 containsObject:*MEMORY[0x1E4F92760]])
  {
    uint64_t v19 = [v17 posterWithUUID:v16];
    BOOL v20 = (void *)MEMORY[0x1E4F926B0];
    v21 = [v19 _path];
    int v22 = [v20 removeFocusConfigurationForPath:v21 error:a10];

    uint64_t v23 = PBFLogRoleCoordinator();
    id v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [(PBFPosterRoleCoordinator *)self role];
        long long v26 = (void *)v25;
        if (a10) {
          id v27 = (__CFString *)*a10;
        }
        else {
          id v27 = @"[unknown error]";
        }
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v25;
        __int16 v32 = 2114;
        id v33 = v16;
        __int16 v34 = 2114;
        id v35 = v27;
        _os_log_error_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove focus configuration after attribute deletion for poster %{public}@: %{public}@", buf, 0x20u);
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = [(PBFPosterRoleCoordinator *)self role];
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = (uint64_t)v26;
      __int16 v32 = 2114;
      id v33 = v16;
      _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed focus configuration after attribute deletion for poster %{public}@", buf, 0x16u);
LABEL_9:
    }
  }

  return v18;
}

@end