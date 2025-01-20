@interface PBFAmbientRoleCoordinator
+ (id)subscribedEvents;
+ (id)supportedAttributes;
+ (id)supportedChangeTypes;
- (BOOL)_executeAmbientChargerConfigurationUpdateForPosterUUID:(id)a3 newAmbientChargerConfiguration:(id)a4 currentCollection:(id)a5 storage:(id)a6 error:(id *)a7;
- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6;
- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10;
- (BOOL)finalizeChangesWithChangeHandler:(id)a3 outEvents:(id *)a4 error:(id *)a5;
- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5;
- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4;
- (BOOL)validateEventIsRelevant:(id)a3;
- (PBFAmbientRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5;
- (id)_ambientIncomingPosterConfigurationForDescriptor:(id)a3 referenceIncomingPosterConfiguration:(id)a4 error:(id *)a5;
- (id)_sortedPosterUUIDsByExtensionIdentifierFromStorage:(id)a3;
- (id)defaultAttribute:(id)a3 forNewPosterFromProvider:(id)a4;
- (id)defaultAttributesForNewPosterFromProvider:(id)a3;
- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4;
- (id)sortedPosterUUIDsFromStorage:(id)a3;
- (id)sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:(id)a3;
- (void)noteDidResetRoleCoordinator:(id)a3;
@end

@implementation PBFAmbientRoleCoordinator

- (PBFAmbientRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F92740];
  v10.receiver = self;
  v10.super_class = (Class)PBFAmbientRoleCoordinator;
  return [(PBFPosterRoleCoordinator *)&v10 initWithRole:v8 storage:a3 modelCoordinatorProvider:a4 providers:a5];
}

- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v6];
  }
  else {
  uint64_t v8 = [(PBFPosterRoleCoordinator *)self posterCollection];
  }
  v9 = [(PBFPosterRoleCoordinator *)self role];
  objc_super v10 = objc_msgSend(v7, "pbf_activeChargerIdentifier");
  v11 = objc_msgSend(v7, "pbf_currentActivePosterForRole:", v9);
  v12 = v11;
  if (v10)
  {
    v13 = [v8 orderedPosters];
    v14 = [v13 array];

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __82__PBFAmbientRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke;
    v25 = &unk_1E6981CC8;
    id v15 = v8;
    id v26 = v15;
    id v16 = v10;
    id v27 = v16;
    v17 = objc_msgSend(v14, "bs_firstObjectPassingTest:", &v22);
    if (!v17)
    {
      if (v12)
      {
        id v18 = v12;
      }
      else
      {
        objc_msgSend(v15, "selectedPoster", v22, v23, v24, v25, v26);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v18;
      v20 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v29 = v16;
        __int16 v30 = 2114;
        v31 = v17;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "No existing configuration tied to charger identifier %{public}@, selecting the active configuration %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (v11)
    {
      id v19 = v11;
    }
    else
    {
      id v19 = [v8 selectedPoster];
    }
    v17 = v19;
  }

  return v17;
}

uint64_t __82__PBFAmbientRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) attributeForPoster:a2 ofType:*MEMORY[0x1E4F92748]];
  uint64_t v4 = [v3 isAssociatedWithChargerIdentifier:*(void *)(a1 + 40)];

  return v4;
}

- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)PBFAmbientRoleCoordinator;
  if ([(PBFPosterRoleCoordinator *)&v57 synchronizeFileSystemAttributesForStorage:v6 error:a4])
  {
    v42 = [(PBFPosterRoleCoordinator *)self role];
    id v7 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v59 = v42;
      _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] synchronizeFileSystemAttributesForStorage", buf, 0xCu);
    }

    v41 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
    uint64_t v8 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v6];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [v8 orderedPosters];
    uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v50)
    {
      uint64_t v49 = *(void *)v54;
      v51 = (void *)*MEMORY[0x1E4F92748];
      v52 = (void *)*MEMORY[0x1E4F92750];
      v39 = a4;
      v40 = v6;
      v47 = self;
      v48 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v54 != v49) {
            objc_enumerationMutation(obj);
          }
          objc_super v10 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "pbf_posterProvider");
          v12 = [(id)objc_opt_class() supportedAttributes];
          v13 = [v8 attributesForPoster:v10 ofTypes:v12];

          v14 = [v13 objectForKeyedSubscript:v51];

          if (!v14)
          {
            id v15 = [(PBFAmbientRoleCoordinator *)self defaultAttribute:v51 forNewPosterFromProvider:v11];
            int v16 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v10, v51, 0, 0, v15, 0, v6, a4);

            if (!v16) {
              goto LABEL_29;
            }
          }
          v17 = [v8 configuredPropertiesForPoster:v10];
          id v18 = [v17 ambientConfiguration];

          id v19 = [v13 objectForKey:v52];
          if (![v11 isEqual:@"com.apple.ambient.AmbientUI.InfographPoster"]
            || [v18 supportedDataLayout] == 2 && objc_msgSend(v19, "supportedDataLayout") == 2)
          {
            v20 = PBFLogRoleCoordinator();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v59 = v42;
              __int16 v60 = 2114;
              v61 = v10;
              _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Synchronizing Ambient configuration for poster %{public}@", buf, 0x16u);
            }

            int v21 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v10, v52, v18, v19, 0, 0, v6, a4);
            uint64_t v22 = 0;
            uint64_t v23 = v19;
            v24 = 0;
            if (!v21) {
              goto LABEL_28;
            }
          }
          else
          {
            v46 = v19;
            uint64_t v22 = [(PBFAmbientRoleCoordinator *)self defaultAttribute:v52 forNewPosterFromProvider:v11];
            v25 = [v10 _path];
            id v26 = [v25 serverIdentity];
            uint64_t v27 = [v26 descriptorIdentifier];

            v28 = objc_msgSend(v41, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v11, 0);
            id v29 = [v28 dynamicDescriptorStoreCoordinatorForIdentifier:v27];
            __int16 v30 = v29;
            v44 = v28;
            v45 = (void *)v27;
            if (v29)
            {
              id v31 = v29;
            }
            else
            {
              id v31 = [v28 staticDescriptorStoreCoordinatorForIdentifier:v27];
            }
            uint64_t v32 = v31;

            v33 = (void *)MEMORY[0x1E4F926B0];
            v34 = [v32 pathOfLatestVersion];
            v24 = [v33 loadAmbientConfigurationForPath:v34 error:0];

            v35 = PBFLogRoleCoordinator();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v59 = v42;
              __int16 v60 = 2114;
              v61 = v10;
              _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to fix Ambient configuration for poster %{public}@", buf, 0x16u);
            }

            id v6 = v40;
            char v36 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v10, v52, 0, 0, v22, v24, v40, v39);

            a4 = v39;
            uint64_t v23 = v46;
            if ((v36 & 1) == 0)
            {
LABEL_28:

              uint64_t v8 = v48;
LABEL_29:

              BOOL v37 = 0;
              goto LABEL_30;
            }
          }

          self = v47;
          uint64_t v8 = v48;
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v50) {
          continue;
        }
        break;
      }
    }
    BOOL v37 = 1;
LABEL_30:
  }
  else
  {
    BOOL v37 = 0;
  }

  return v37;
}

- (id)defaultAttributesForNewPosterFromProvider:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PBFAmbientRoleCoordinator;
  v5 = [(PBFPosterRoleCoordinator *)&v13 defaultAttributesForNewPosterFromProvider:v4];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = *MEMORY[0x1E4F92748];
  uint64_t v8 = [(PBFAmbientRoleCoordinator *)self defaultAttribute:*MEMORY[0x1E4F92748] forNewPosterFromProvider:v4];
  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:v7];
  }
  uint64_t v9 = *MEMORY[0x1E4F92750];
  objc_super v10 = [(PBFAmbientRoleCoordinator *)self defaultAttribute:*MEMORY[0x1E4F92750] forNewPosterFromProvider:v4];
  if (v10) {
    [v6 setObject:v10 forKeyedSubscript:v9];
  }
  v11 = (void *)[v6 copy];

  return v11;
}

- (id)defaultAttribute:(id)a3 forNewPosterFromProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqual:*MEMORY[0x1E4F92750]])
  {
    if ([v6 isEqual:@"com.apple.ambient.AmbientUI.InfographPoster"])
    {
      uint64_t v7 = 2;
    }
    else if ([v6 isEqual:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"])
    {
      uint64_t v7 = 1;
    }
    else if ([v6 isEqual:@"com.apple.ClockPoster.ClockPosterExtension"])
    {
      uint64_t v7 = 3;
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F92608]) initWithSupportedDataLayout:v7];
  }
  else
  {
    if (![v5 isEqual:*MEMORY[0x1E4F92748]])
    {
      uint64_t v9 = 0;
      goto LABEL_14;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F92600]);
  }
  uint64_t v9 = v8;
LABEL_14:

  return v9;
}

+ (id)supportedAttributes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PBFAmbientRoleCoordinator_supportedAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedAttributes_onceToken_1 != -1) {
    dispatch_once(&supportedAttributes_onceToken_1, block);
  }
  v2 = (void *)supportedAttributes_supportedAttributes_1;
  return v2;
}

void __48__PBFAmbientRoleCoordinator_supportedAttributes__block_invoke(uint64_t a1)
{
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___PBFAmbientRoleCoordinator;
  v1 = objc_msgSendSuper2(&v8, sel_supportedAttributes);
  v2 = (void *)[v1 mutableCopy];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;

  [v5 addObject:*MEMORY[0x1E4F92750]];
  [v5 addObject:*MEMORY[0x1E4F92748]];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)supportedAttributes_supportedAttributes_1;
  supportedAttributes_supportedAttributes_1 = v6;
}

+ (id)subscribedEvents
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PBFAmbientRoleCoordinator_subscribedEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (subscribedEvents_onceToken_0 != -1) {
    dispatch_once(&subscribedEvents_onceToken_0, block);
  }
  v2 = (void *)subscribedEvents_subscribedEvents_0;
  return v2;
}

void __45__PBFAmbientRoleCoordinator_subscribedEvents__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CA80];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___PBFAmbientRoleCoordinator;
  v2 = objc_msgSendSuper2(&v6, sel_subscribedEvents);
  v3 = [v1 setWithSet:v2];

  [v3 addObject:@"PBFPosterDataStoreEventTypeDescriptorsUpdated"];
  [v3 addObject:@"PBFPosterDataStoreEventTypeStaticDescriptorsUpdated"];
  [v3 addObject:@"PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"];
  uint64_t v4 = [v3 copy];
  id v5 = (void *)subscribedEvents_subscribedEvents_0;
  subscribedEvents_subscribedEvents_0 = v4;
}

- (BOOL)validateEventIsRelevant:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PBFAmbientRoleCoordinator;
  if ([(PBFPosterRoleCoordinator *)&v31 validateEventIsRelevant:v4])
  {
    id v5 = [v4 eventType];
    if (([v5 isEqual:@"PBFPosterDataStoreEventTypeDescriptorsUpdated"] & 1) == 0
      && ![v5 isEqual:@"PBFPosterDataStoreEventTypeStaticDescriptorsUpdated"])
    {
      BOOL v21 = 1;
      goto LABEL_25;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    objc_super v6 = [v4 fromValue];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v27 + 1) + 8 * v10) role];
        v12 = [(PBFPosterRoleCoordinator *)self role];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
          if (v8) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      objc_super v6 = objc_msgSend(v4, "toValue", 0);
      uint64_t v14 = [v6 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (!v14)
      {
        BOOL v21 = 1;
        goto LABEL_23;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
LABEL_14:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v6);
        }
        id v18 = [*(id *)(*((void *)&v23 + 1) + 8 * v17) role];
        id v19 = [(PBFPosterRoleCoordinator *)self role];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v6 countByEnumeratingWithState:&v23 objects:v32 count:16];
          BOOL v21 = 1;
          if (v15) {
            goto LABEL_14;
          }
          goto LABEL_23;
        }
      }
    }
    BOOL v21 = 0;
LABEL_23:

LABEL_25:
    goto LABEL_26;
  }
  BOOL v21 = 0;
LABEL_26:

  return v21;
}

- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5
{
  uint64_t v240 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (![(PBFAmbientRoleCoordinator *)self validateEventIsRelevant:v8])
  {
    LOBYTE(v12) = 0;
    goto LABEL_145;
  }
  v180 = [(PBFPosterRoleCoordinator *)self role];
  v159 = [v8 eventType];
  uint64_t v10 = objc_opt_new();
  v175 = self;
  id v155 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(PBFPosterRoleCoordinator *)self storage];
  }
  id v157 = v11;
  v156 = v8;
  if ([v159 isEqual:@"PBFPosterDataStoreEventTypeDescriptorsUpdated"])
  {
    if (![v159 isEqual:@"PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"])goto LABEL_12; {
LABEL_10:
    }
    uint64_t v14 = +[PBFPosterRoleCoordinatorChange refreshRoleCoordinator:v180];
    [v10 addObject:v14];

    uint64_t v15 = 0;
    goto LABEL_137;
  }
  int v13 = [v159 isEqual:@"PBFPosterDataStoreEventTypeStaticDescriptorsUpdated"];
  if ([v159 isEqual:@"PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"]) {
    goto LABEL_10;
  }
  if (!v13) {
    goto LABEL_91;
  }
LABEL_12:
  if (![MEMORY[0x1E4F927B0] ambientPosterAutocreationSupported])
  {
LABEL_91:
    uint64_t v15 = 0;
LABEL_92:
    v186.receiver = v175;
    v186.super_class = (Class)PBFAmbientRoleCoordinator;
    uint64_t v187 = 0;
    BOOL v12 = [(PBFPosterRoleCoordinator *)&v186 notifyEventWasReceived:v156 changes:&v187 storage:v157];
    v101 = a4;
    if (v12) {
      [v10 addObjectsFromArray:v187];
    }
    goto LABEL_138;
  }
  id v16 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v157];
  if ([v159 isEqual:@"PBFPosterDataStoreEventTypeDescriptorsUpdated"]) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2;
  }
  id v18 = [v156 relatedProviders];
  id v19 = [v18 anyObject];

  int v20 = [v156 relatedProviders];
  uint64_t v21 = [v20 count];

  if (v21 != 1)
  {
    v154 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[event relatedProviders] count] == 1"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFAmbientRoleCoordinator notifyEventWasReceived:changes:storage:](a2, (uint64_t)self, (uint64_t)v154);
    }
    [v154 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32A5BA4);
  }
  v160 = [(PBFAmbientRoleCoordinator *)self defaultAttributesForNewPosterFromProvider:v19];
  uint64_t v22 = [v156 toValue];
  v171 = v19;
  if ([v19 isEqual:@"com.apple.PosterTester.SamplePoster"])
  {
    long long v23 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
    long long v24 = [v23 providerForExtensionIdentifier:v19];

    long long v25 = [v24 posterExtensionInfoPlist];
    char v26 = objc_msgSend(v25, "pbf_supportsGallery");

    if ((v26 & 1) == 0)
    {
      long long v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      long long v28 = [v27 stringArrayForKey:@"ShowSamplePoster"];
      char v29 = [v28 containsObject:v19];

      if ((v29 & 1) == 0)
      {

        uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  v163 = v10;
  v168 = objc_opt_new();
  v170 = objc_opt_new();
  v172 = objc_opt_new();
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  id v30 = v22;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v223 objects:v239 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v224;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v224 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v223 + 1) + 8 * i);
        char v36 = [v35 _path];
        BOOL v37 = [v36 serverIdentity];
        uint64_t v38 = [v37 type];

        if (v38 == v17)
        {
          v39 = [v35 _path];
          v40 = [v39 descriptorIdentifier];

          if (v40) {
            [v170 setObject:v35 forKeyedSubscript:v40];
          }
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v223 objects:v239 count:16];
    }
    while (v32);
  }

  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  v179 = v16;
  v41 = [v16 orderedPosters];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v219 objects:v238 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v220;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v220 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v219 + 1) + 8 * j);
        v47 = objc_msgSend(v46, "pbf_posterProvider");
        int v48 = [v47 isEqual:v171];

        if (v48)
        {
          uint64_t v49 = [v46 _path];
          uint64_t v50 = [v49 descriptorIdentifier];

          if (v50
            || (objc_msgSend(v46, "pbf_posterProvider"),
                v51 = objc_claimAutoreleasedReturnValue(),
                int v52 = [v51 isEqualToString:@"com.apple.ambient.AmbientUI.InfographPoster"],
                v51,
                uint64_t v50 = @"InfographPoster",
                v52))
          {
            long long v53 = [v170 objectForKeyedSubscript:v50];

            if (v53)
            {
              long long v54 = [v172 objectForKey:v50];
              if (!v54)
              {
                long long v54 = objc_opt_new();
                [v172 setObject:v54 forKeyedSubscript:v50];
              }
              [v54 addObject:v46];
            }
            else
            {
              [v168 addObject:v46];
            }
          }
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v219 objects:v238 count:16];
    }
    while (v43);
  }

  v169 = objc_opt_new();
  v174 = objc_opt_new();
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  id v55 = v30;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v215 objects:v237 count:16];
  uint64_t v10 = v163;
  if (!v56)
  {
LABEL_90:

    goto LABEL_99;
  }
  uint64_t v57 = v56;
  uint64_t v58 = *(void *)v216;
  uint64_t v173 = *MEMORY[0x1E4F92750];
  uint64_t v161 = *(void *)v216;
  id v162 = v55;
LABEL_51:
  uint64_t v59 = 0;
  uint64_t v164 = v57;
  while (1)
  {
    if (*(void *)v216 != v58) {
      objc_enumerationMutation(v55);
    }
    __int16 v60 = *(void **)(*((void *)&v215 + 1) + 8 * v59);
    v61 = [v60 _path];
    v62 = [v61 descriptorIdentifier];

    uint64_t v63 = [v172 objectForKeyedSubscript:v62];
    v177 = v60;
    if ([v63 count])
    {
      long long v213 = 0u;
      long long v214 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      id v178 = v63;
      uint64_t v64 = [v178 countByEnumeratingWithState:&v211 objects:v236 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v165 = v59;
        v166 = v63;
        v167 = v62;
        uint64_t v66 = *(void *)v212;
        v68 = v60;
        v67 = v178;
        uint64_t v176 = *(void *)v212;
        do
        {
          uint64_t v69 = 0;
          uint64_t v181 = v65;
          do
          {
            if (*(void *)v212 != v66) {
              objc_enumerationMutation(v67);
            }
            v70 = *(void **)(*((void *)&v211 + 1) + 8 * v69);
            v71 = [v70 loadAmbientConfigurationWithError:0];
            if (![v71 creationBehavior])
            {
              v72 = [v68 ambientConfiguration];
              v73 = [v68 displayNameLocalizationKey];
              v74 = [v70 displayNameLocalizationKey];
              int v75 = BSEqualStrings();

              char v76 = [v72 isEqualToAmbientConfiguration:v71];
              char v77 = v76;
              if (!v75 || (v76 & 1) == 0)
              {
                v78 = [v70 loadConfiguredPropertiesWithError:0];
                v184 = (void *)[v78 mutableCopy];

                v79 = [(id)objc_opt_class() supportedAttributes];
                v80 = [v179 attributesForPoster:v70 ofTypes:v79];
                v81 = (void *)[v80 mutableCopy];
                v82 = v81;
                if (v81) {
                  id v83 = v81;
                }
                else {
                  id v83 = (id)objc_opt_new();
                }
                id obj = v83;

                if ((v75 & 1) == 0)
                {
                  v84 = (void *)[objc_alloc(MEMORY[0x1E4F92698]) initWithDisplayNameLocalizationKey:v73];
                  [v184 setOtherMetadata:v84];
                }
                if ((v77 & 1) == 0)
                {
                  [v184 setAmbientConfiguration:v72];
                  [obj setObject:v72 forKeyedSubscript:v173];
                }
                v85 = [MEMORY[0x1E4F924B8] temporaryPathForRole:v180];
                v86 = [v70 _path];
                [v85 copyContentsOfPath:v86 error:0];

                id v87 = objc_alloc(MEMORY[0x1E4F925C0]);
                v88 = objc_msgSend(v70, "pbf_posterUUID");
                v89 = [v70 _path];
                v90 = [v89 serverIdentity];
                v91 = (void *)[v87 initWithUpdatedPath:v85 updatedPosterUUID:v88 sourceIdentity:v90 configuredProperties:v184 attributes:obj];

                [v91 trackTemporaryState:v85];
                [v174 addObject:v91];

                v68 = v177;
                v67 = v178;
                uint64_t v66 = v176;
              }

              uint64_t v65 = v181;
            }

            ++v69;
          }
          while (v65 != v69);
          uint64_t v65 = [v67 countByEnumeratingWithState:&v211 objects:v236 count:16];
        }
        while (v65);
        id v55 = v162;
        uint64_t v10 = v163;
        uint64_t v58 = v161;
        uint64_t v57 = v164;
        uint64_t v59 = v165;
        uint64_t v63 = v166;
        v62 = v167;
      }
      goto LABEL_88;
    }
    v92 = [v60 ambientConfiguration];
    v93 = v92;
    if (v92)
    {
      id v94 = v92;
    }
    else
    {
      v95 = [v160 objectForKeyedSubscript:v173];
      v96 = v95;
      if (v95) {
        id v97 = v95;
      }
      else {
        id v97 = (id)objc_opt_new();
      }
      id v94 = v97;
    }
    id v178 = v94;
    if ([v94 creationBehavior])
    {
      v98 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v233 = v177;
        _os_log_impl(&dword_1D31CE000, v98, OS_LOG_TYPE_DEFAULT, "Skipping descriptor '%{public}@'; creation behavior is to not auto-create",
          buf,
          0xCu);
      }
      goto LABEL_87;
    }
    id v210 = 0;
    v98 = [(PBFAmbientRoleCoordinator *)v175 _ambientIncomingPosterConfigurationForDescriptor:v177 referenceIncomingPosterConfiguration:0 error:&v210];
    id v99 = v210;
    v100 = v99;
    if (v99 || !v98) {
      break;
    }
    [v169 setObject:v98 forKeyedSubscript:v62];
LABEL_87:

LABEL_88:
    if (++v59 == v57)
    {
      uint64_t v57 = [v55 countByEnumeratingWithState:&v215 objects:v237 count:16];
      if (v57) {
        goto LABEL_51;
      }
      goto LABEL_90;
    }
  }
  if (v99)
  {
    id v102 = v99;
  }
  else
  {
    v103 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v234 = *MEMORY[0x1E4F28588];
    v235 = @"notifyEventWasReceived; Unable to copy descriptor into new configuration; bailing descriptor update.";
    v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
    objc_msgSend(v103, "pbf_generalErrorWithCode:userInfo:", 0, v104);
    id v102 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v102)
  {

    uint64_t v15 = v179;
    goto LABEL_92;
  }
LABEL_99:
  v105 = objc_opt_new();
  v106 = [v55 sortedArrayUsingComparator:&__block_literal_global_38];

  long long v208 = 0u;
  long long v209 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  id obja = v106;
  uint64_t v107 = [obja countByEnumeratingWithState:&v206 objects:v231 count:16];
  if (v107)
  {
    uint64_t v108 = v107;
    uint64_t v185 = *(void *)v207;
    do
    {
      for (uint64_t k = 0; k != v108; ++k)
      {
        if (*(void *)v207 != v185) {
          objc_enumerationMutation(obja);
        }
        v110 = [*(id *)(*((void *)&v206 + 1) + 8 * k) _path];
        v111 = [v110 descriptorIdentifier];

        v112 = [v172 objectForKey:v111];
        v204[0] = MEMORY[0x1E4F143A8];
        v204[1] = 3221225472;
        v204[2] = __68__PBFAmbientRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke_2;
        v204[3] = &unk_1E69813A0;
        id v205 = v179;
        [v112 sortUsingComparator:v204];
        long long v202 = 0u;
        long long v203 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        id v113 = v112;
        uint64_t v114 = [v113 countByEnumeratingWithState:&v200 objects:v230 count:16];
        if (v114)
        {
          uint64_t v115 = v114;
          uint64_t v116 = *(void *)v201;
          do
          {
            for (uint64_t m = 0; m != v115; ++m)
            {
              if (*(void *)v201 != v116) {
                objc_enumerationMutation(v113);
              }
              v118 = objc_msgSend(*(id *)(*((void *)&v200 + 1) + 8 * m), "pbf_posterUUID");
              [v105 addObject:v118];
            }
            uint64_t v115 = [v113 countByEnumeratingWithState:&v200 objects:v230 count:16];
          }
          while (v115);
        }

        v119 = [v169 objectForKey:v111];
        v120 = v119;
        if (v119)
        {
          v121 = [v119 destinationUUID];
          [v105 addObject:v121];
        }
      }
      uint64_t v108 = [obja countByEnumeratingWithState:&v206 objects:v231 count:16];
    }
    while (v108);
  }

  long long v198 = 0u;
  long long v199 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  id v122 = v168;
  uint64_t v123 = [v122 countByEnumeratingWithState:&v196 objects:v229 count:16];
  uint64_t v10 = v163;
  if (v123)
  {
    uint64_t v124 = v123;
    uint64_t v125 = *(void *)v197;
    do
    {
      for (uint64_t n = 0; n != v124; ++n)
      {
        if (*(void *)v197 != v125) {
          objc_enumerationMutation(v122);
        }
        v127 = objc_msgSend(*(id *)(*((void *)&v196 + 1) + 8 * n), "pbf_posterUUID");
        v128 = +[PBFPosterRoleCoordinatorChange removePosterFromRole:v180 matchingUUID:v127];
        [v163 addObject:v128];
      }
      uint64_t v124 = [v122 countByEnumeratingWithState:&v196 objects:v229 count:16];
    }
    while (v124);
  }

  long long v195 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v192 = 0u;
  v129 = [v169 objectEnumerator];
  uint64_t v130 = [v129 countByEnumeratingWithState:&v192 objects:v228 count:16];
  uint64_t v15 = v179;
  if (v130)
  {
    uint64_t v131 = v130;
    uint64_t v132 = *(void *)v193;
    do
    {
      for (iuint64_t i = 0; ii != v131; ++ii)
      {
        if (*(void *)v193 != v132) {
          objc_enumerationMutation(v129);
        }
        v134 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v180 incomingPoster:*(void *)(*((void *)&v192 + 1) + 8 * ii)];
        [v163 addObject:v134];
      }
      uint64_t v131 = [v129 countByEnumeratingWithState:&v192 objects:v228 count:16];
    }
    while (v131);
  }

  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  id v135 = v174;
  uint64_t v136 = [v135 countByEnumeratingWithState:&v188 objects:v227 count:16];
  if (v136)
  {
    uint64_t v137 = v136;
    uint64_t v138 = *(void *)v189;
    do
    {
      for (juint64_t j = 0; jj != v137; ++jj)
      {
        if (*(void *)v189 != v138) {
          objc_enumerationMutation(v135);
        }
        v140 = +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:v180 incomingPoster:*(void *)(*((void *)&v188 + 1) + 8 * jj)];
        [v163 addObject:v140];
      }
      uint64_t v137 = [v135 countByEnumeratingWithState:&v188 objects:v227 count:16];
    }
    while (v137);
  }

  v141 = [(PBFAmbientRoleCoordinator *)v175 _sortedPosterUUIDsByExtensionIdentifierFromStorage:v157];
  v142 = (void *)[v141 mutableCopy];

  v143 = (void *)[v105 copy];
  [v142 setObject:v143 forKeyedSubscript:v171];

  v144 = [(PBFAmbientRoleCoordinator *)v175 sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:v142];
  v145 = +[PBFPosterRoleCoordinatorChange reorderPostersForRole:v180 sortedPosterUUIDs:v144];
  [v163 addObject:v145];

LABEL_137:
  BOOL v12 = 1;
  v101 = a4;
LABEL_138:
  uint64_t v146 = [v10 count];
  if (v101 && v146) {
    id *v101 = (id)[v10 copy];
  }
  uint64_t v147 = objc_opt_class();
  v148 = [(PBFPosterRoleCoordinator *)v175 role];
  if (v15)
  {
    v149 = (void *)v147;
    id v8 = v156;
    [v149 dumpResultsForEvent:v156 role:v148 posterCollection:v15 changes:v10 eventWasHandled:v12];
    v150 = v157;
  }
  else
  {
    v150 = v157;
    v151 = [(PBFPosterRoleCoordinator *)v175 buildNewPosterCollectionFromStorage:v157];
    v152 = (void *)v147;
    id v8 = v156;
    [v152 dumpResultsForEvent:v156 role:v148 posterCollection:v151 changes:v10 eventWasHandled:v12];
  }
  id v9 = v155;
LABEL_145:

  return v12;
}

uint64_t __68__PBFAmbientRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 ambientConfiguration];
  uint64_t v6 = [v5 displayOrder];

  uint64_t v7 = [v4 ambientConfiguration];

  uint64_t v8 = [v7 displayOrder];
  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

uint64_t __68__PBFAmbientRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F92780];
  id v7 = a3;
  uint64_t v8 = [v5 attributeForPoster:a2 ofType:v6];
  id v9 = [*(id *)(a1 + 32) attributeForPoster:v7 ofType:v6];

  uint64_t v10 = [v8 creationDate];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  int v13 = v12;

  uint64_t v14 = [v9 creationDate];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  uint64_t v17 = v16;

  if (v13) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (v13) {
      uint64_t v19 = -1;
    }
    else {
      uint64_t v19 = v17 != 0;
    }
  }
  else
  {
    uint64_t v19 = [v17 compare:v13];
  }

  return v19;
}

- (BOOL)finalizeChangesWithChangeHandler:(id)a3 outEvents:(id *)a4 error:(id *)a5
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  v132.receiver = self;
  v132.super_class = (Class)PBFAmbientRoleCoordinator;
  id v98 = a3;
  v91 = a5;
  if (!-[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:](&v132, sel_finalizeChangesWithChangeHandler_outEvents_error_))
  {
    BOOL v16 = 0;
    goto LABEL_109;
  }
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2020000000;
  char v131 = 0;
  v96 = [(PBFPosterRoleCoordinator *)self role];
  id v7 = [(PBFPosterRoleCoordinator *)self role];
  uint64_t v8 = [v98 sortedPosterUUIDsForRole:v7 error:0];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v106 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v105 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v124 objects:v146 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v125 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v124 + 1) + 8 * i);
        uint64_t v14 = [(PBFPosterRoleCoordinator *)self posterWithUUID:v13 extensionIdentifier:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"];
        if (v14)
        {
          [v9 setObject:v14 forKey:v13];
        }
        else
        {
          uint64_t v14 = [(PBFPosterRoleCoordinator *)self posterWithUUID:v13 extensionIdentifier:@"com.apple.ambient.AmbientUI.InfographPoster"];
          if (v14)
          {
            [v106 setObject:v14 forKey:v13];
          }
          else
          {
            uint64_t v14 = [(PBFPosterRoleCoordinator *)self posterWithUUID:v13 extensionIdentifier:@"com.apple.ClockPoster.ClockPosterExtension"];
            if (v14) {
              [v105 setObject:v14 forKey:v13];
            }
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v124 objects:v146 count:16];
    }
    while (v10);
  }

  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __78__PBFAmbientRoleCoordinator_finalizeChangesWithChangeHandler_outEvents_error___block_invoke;
  v123[3] = &unk_1E6984348;
  v123[4] = &v128;
  [v9 enumerateKeysAndObjectsUsingBlock:v123];
  if (!*((unsigned char *)v129 + 24) && [v9 count])
  {
    uint64_t v17 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "All photo posters are hidden!", buf, 2u);
    }

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    BOOL v18 = obj;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v119 objects:v145 count:16];
    if (!v19) {
      goto LABEL_35;
    }
    uint64_t v102 = *(void *)v120;
    id v99 = v18;
LABEL_25:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v120 != v102) {
        objc_enumerationMutation(v99);
      }
      uint64_t v21 = *(void *)(*((void *)&v119 + 1) + 8 * v20);
      uint64_t v22 = [v9 objectForKey:v21];
      long long v23 = v22;
      if (v22)
      {
        long long v24 = [v22 loadConfiguredPropertiesWithError:0];
        long long v25 = (void *)[v24 mutableCopy];

        char v26 = [v25 ambientConfiguration];
        long long v27 = (void *)[v26 mutableCopy];

        [v27 setHidden:0];
        [v25 setAmbientConfiguration:v27];
        long long v28 = +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:v25 forPosterWithinRole:v96 matchingUUID:v21];
        id v118 = 0;
        BOOL v29 = [(PBFAmbientRoleCoordinator *)self _executeChange:v28 storage:v98 outEvents:a4 error:&v118];
        id v30 = v118;

        if (v29)
        {
          v35 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v142 = v23;
            _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "All photo posters are hidden so choosing to unhide poster: %@{public}", buf, 0xCu);
          }

          uint64_t v15 = v99;
          goto LABEL_42;
        }
        uint64_t v31 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v142 = v23;
          __int16 v143 = 2114;
          uint64_t v144 = (uint64_t)v30;
          _os_log_error_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_ERROR, "failed to unhide poster %{public}@: %{public}@", buf, 0x16u);
        }
      }
      if (v19 == ++v20)
      {
        BOOL v18 = v99;
        uint64_t v19 = [v99 countByEnumeratingWithState:&v119 objects:v145 count:16];
        if (!v19)
        {
LABEL_35:

          uint64_t v32 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            -[PBFAmbientRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:](v32);
          }

          if (v91)
          {
            uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v139 = *MEMORY[0x1E4F28588];
            v140 = @"Photos posters are all hidden and no poster could be found to un-hide";
            uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
            [v33 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:-3341 userInfo:v34];
            BOOL v16 = 0;
            id *v91 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_107;
          }
          BOOL v16 = 0;
          goto LABEL_108;
        }
        goto LABEL_25;
      }
    }
  }
  if (![v9 count])
  {
    uint64_t v15 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "No photo posters found; not checking for hidden",
        buf,
        2u);
    }
LABEL_42:
  }
  if (![v106 count])
  {
    BOOL v37 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v37, OS_LOG_TYPE_DEFAULT, "No Infograph posters found; skipping bad ambient configuration state check",
        buf,
        2u);
    }
LABEL_66:

    if ([v105 count])
    {
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      v95 = [v105 allValues];
      uint64_t v56 = [v95 countByEnumeratingWithState:&v109 objects:v135 count:16];
      uint64_t v34 = v95;
      if (v56)
      {
        uint64_t v92 = *(void *)v110;
LABEL_69:
        uint64_t v94 = v56;
        uint64_t v57 = 0;
        while (1)
        {
          if (*(void *)v110 != v92) {
            objc_enumerationMutation(v95);
          }
          uint64_t v58 = *(void **)(*((void *)&v109 + 1) + 8 * v57);
          uint64_t v59 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v142 = v58;
            _os_log_impl(&dword_1D31CE000, v59, OS_LOG_TYPE_DEFAULT, "Checking %{public}@ for bad ambient configuration.. ", buf, 0xCu);
          }

          id v60 = objc_alloc(MEMORY[0x1E4F92650]);
          v61 = [v58 _path];
          v62 = (void *)[v60 _initWithPath:v61];

          if (!v62) {
            goto LABEL_89;
          }
          uint64_t v63 = [v58 loadConfiguredPropertiesWithError:0];
          uint64_t v64 = (void *)[v63 mutableCopy];
          uint64_t v65 = v64;
          if (v64)
          {
            id v104 = v64;
          }
          else
          {
            uint64_t v66 = (void *)MEMORY[0x1E4F926A0];
            v67 = [(PBFPosterRoleCoordinator *)self role];
            id v104 = [v66 defaultConfiguredPropertiesForRole:v67];
          }
          v68 = [v62 displayNameLocalizationKey];
          uint64_t v69 = [v104 otherMetadata];
          v70 = [v69 displayNameLocalizationKey];
          char v71 = [v68 isEqual:v70];

          if ((v71 & 1) == 0)
          {
            id v72 = objc_alloc(MEMORY[0x1E4F92698]);
            v73 = [v62 displayNameLocalizationKey];
            v74 = (void *)[v72 initWithDisplayNameLocalizationKey:v73];
            [v104 setOtherMetadata:v74];
          }
          id v101 = [v62 ambientConfiguration];
          int v75 = [v58 loadAmbientConfigurationWithError:0];
          uint64_t v76 = [v101 editingBehavior];
          if (v76 != [v75 editingBehavior]) {
            break;
          }
          if ((v71 & 1) == 0) {
            goto LABEL_84;
          }
LABEL_88:

LABEL_89:
          if (v94 == ++v57)
          {
            uint64_t v56 = [v95 countByEnumeratingWithState:&v109 objects:v135 count:16];
            BOOL v16 = 1;
            if (v56) {
              goto LABEL_69;
            }
            goto LABEL_106;
          }
        }
        char v77 = (void *)[v75 mutableCopy];
        objc_msgSend(v77, "setEditingBehavior:", objc_msgSend(v101, "editingBehavior"));
        v78 = (void *)[v77 copy];
        [v104 setAmbientConfiguration:v78];

LABEL_84:
        v79 = objc_msgSend(v58, "pbf_posterUUID");
        v80 = +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:v104 forPosterWithinRole:v96 matchingUUID:v79];
        id v108 = 0;
        BOOL v81 = [(PBFAmbientRoleCoordinator *)self _executeChange:v80 storage:v98 outEvents:a4 error:&v108];
        id v82 = v108;

        if (!v81)
        {
          id v87 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
            -[PBFAmbientRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:]();
          }

          if (v91)
          {
            v88 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v133 = *MEMORY[0x1E4F28588];
            v134 = @"Unable to correct editing behavior for clock poster";
            v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
            id *v91 = [v88 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:-3341 userInfo:v89];
          }
          goto LABEL_105;
        }
        id v83 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v142 = v58;
          _os_log_impl(&dword_1D31CE000, v83, OS_LOG_TYPE_DEFAULT, "Correcting editing behavior for poster %{public}@", buf, 0xCu);
        }

        goto LABEL_88;
      }
    }
    else
    {
      uint64_t v34 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v34, OS_LOG_TYPE_DEFAULT, "No Clock posters found; skipping bad ambient configuration state check",
          buf,
          2u);
      }
    }
    BOOL v16 = 1;
    goto LABEL_107;
  }
  long long v117 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v114 = 0u;
  v95 = [v106 allValues];
  uint64_t v36 = [v95 countByEnumeratingWithState:&v114 objects:v138 count:16];
  BOOL v37 = v95;
  if (!v36) {
    goto LABEL_66;
  }
  uint64_t v93 = *(void *)v115;
LABEL_46:
  id v100 = (id)v36;
  uint64_t v38 = 0;
  while (1)
  {
    if (*(void *)v115 != v93) {
      objc_enumerationMutation(v95);
    }
    v39 = *(void **)(*((void *)&v114 + 1) + 8 * v38);
    v40 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v142 = v39;
      _os_log_impl(&dword_1D31CE000, v40, OS_LOG_TYPE_DEFAULT, "Checking %{public}@ for bad ambient configuration supported data layout state", buf, 0xCu);
    }

    v41 = [v39 loadAmbientConfigurationWithError:0];
    if ([v41 supportedDataLayout] == 2) {
      goto LABEL_61;
    }
    uint64_t v42 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = [v41 supportedDataLayout];
      *(_DWORD *)buf = 138543618;
      v142 = v39;
      __int16 v143 = 2048;
      uint64_t v144 = v43;
      _os_log_impl(&dword_1D31CE000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ has bad supported data layout state: %lu", buf, 0x16u);
    }

    uint64_t v44 = (void *)[v41 mutableCopy];
    [v44 setSupportedDataLayout:2];
    v45 = [v39 loadConfiguredPropertiesWithError:0];
    v46 = (void *)[v45 mutableCopy];
    v47 = v46;
    if (v46)
    {
      id v103 = v46;
    }
    else
    {
      int v48 = (void *)MEMORY[0x1E4F926A0];
      uint64_t v49 = [(PBFPosterRoleCoordinator *)self role];
      id v103 = [v48 defaultConfiguredPropertiesForRole:v49];
    }
    uint64_t v50 = (void *)[v44 copy];
    [v103 setAmbientConfiguration:v50];

    v51 = objc_msgSend(v39, "pbf_posterUUID");
    int v52 = +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:v103 forPosterWithinRole:v96 matchingUUID:v51];
    id v113 = 0;
    BOOL v53 = [(PBFAmbientRoleCoordinator *)self _executeChange:v52 storage:v98 outEvents:a4 error:&v113];
    id v54 = v113;

    if (!v53) {
      break;
    }
    id v55 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v142 = v39;
      _os_log_impl(&dword_1D31CE000, v55, OS_LOG_TYPE_DEFAULT, "correcting ambient widget configuration for poster %{public}@", buf, 0xCu);
    }

LABEL_61:
    if (v100 == (id)++v38)
    {
      uint64_t v36 = [v95 countByEnumeratingWithState:&v114 objects:v138 count:16];
      if (!v36)
      {
        BOOL v37 = v95;
        goto LABEL_66;
      }
      goto LABEL_46;
    }
  }
  v84 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
    -[PBFAmbientRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:]();
  }

  if (v91)
  {
    v85 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v136 = *MEMORY[0x1E4F28588];
    uint64_t v137 = @"Unable to correct invalid supported data layout type for infograph";
    v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
    id *v91 = [v85 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:-3341 userInfo:v86];
  }
LABEL_105:
  BOOL v16 = 0;
LABEL_106:
  uint64_t v34 = v95;
LABEL_107:

LABEL_108:
  _Block_object_dispose(&v128, 8);
LABEL_109:

  return v16;
}

void __78__PBFAmbientRoleCoordinator_finalizeChangesWithChangeHandler_outEvents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = [a3 loadAmbientConfigurationWithError:0];
  char v7 = [v6 hidden];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)supportedChangeTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PBFAmbientRoleCoordinator_supportedChangeTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedChangeTypes_onceToken_1 != -1) {
    dispatch_once(&supportedChangeTypes_onceToken_1, block);
  }
  v2 = (void *)supportedChangeTypes_supportedChangeTypes_1;
  return v2;
}

void __49__PBFAmbientRoleCoordinator_supportedChangeTypes__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA80];
  v9[0] = @"PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v4 = [v2 setWithArray:v3];

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___PBFAmbientRoleCoordinator;
  id v5 = objc_msgSendSuper2(&v8, sel_supportedChangeTypes);
  [v4 unionSet:v5];

  uint64_t v6 = [v4 copy];
  char v7 = (void *)supportedChangeTypes_supportedChangeTypes_1;
  supportedChangeTypes_supportedChangeTypes_1 = v6;
}

- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 changeType];
  if (![v12 isEqual:@"PBFPosterRoleCoordinatorChangeTypeAddPoster"]) {
    goto LABEL_24;
  }
  uint64_t v13 = [v10 userInfo];
  uint64_t v14 = [v13 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration"];

  if (v14)
  {
    uint64_t v15 = [v14 attributes];
    uint64_t v16 = [v15 count];

    if (v16)
    {
LABEL_23:

LABEL_24:
      uint64_t v38 = [v10 userInfo];
      uint64_t v14 = [v38 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType"];

      v39 = [v10 userInfo];
      v40 = [v39 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];

      if ([v14 isEqual:*MEMORY[0x1E4F92748]]
        && (([v12 isEqual:@"PBFPosterRoleCoordinatorChangeTypeAssignAttribute"] & 1) != 0
         || [v12 isEqual:@"PBFPosterRoleCoordinatorChangeTypeRemoveAttribute"]))
      {
        v41 = [v10 userInfo];
        uint64_t v42 = [v41 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute"];

        uint64_t v43 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v11];
        unsigned __int8 v30 = [(PBFAmbientRoleCoordinator *)self _executeAmbientChargerConfigurationUpdateForPosterUUID:v40 newAmbientChargerConfiguration:v42 currentCollection:v43 storage:v11 error:a6];
      }
      else if ([v12 isEqual:@"PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties"])
      {
        v90 = v12;
        id v94 = v11;
        uint64_t v92 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v11];
        uint64_t v44 = [v92 posterWithUUID:v40];
        v45 = [v10 userInfo];
        v46 = [v45 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties"];

        if (v40 && v44 && v46)
        {
          id v83 = a5;
          v84 = v46;
          v47 = [v44 _path];
          uint64_t v48 = [v47 serverIdentity];

          v86 = self;
          uint64_t v49 = [(id)objc_opt_class() supportedAttributes];
          uint64_t v50 = [v92 attributesForPoster:v44 ofTypes:v49];
          v51 = (void *)[v50 mutableCopy];
          int v52 = v51;
          if (v51) {
            id v53 = v51;
          }
          else {
            id v53 = (id)objc_opt_new();
          }
          v61 = v53;
          v88 = a6;

          v62 = [v84 ambientConfiguration];
          if (v62)
          {
            uint64_t v63 = *MEMORY[0x1E4F92750];
            uint64_t v64 = [v61 objectForKey:*MEMORY[0x1E4F92750]];
            char v65 = [v62 isEqual:v64];

            if ((v65 & 1) == 0)
            {
              [v61 setObject:v62 forKeyedSubscript:v63];
              uint64_t v66 = *MEMORY[0x1E4F92780];
              v67 = [v61 objectForKeyedSubscript:*MEMORY[0x1E4F92780]];
              v68 = v67;
              if (v67) {
                id v69 = v67;
              }
              else {
                id v69 = (id)objc_opt_new();
              }
              v70 = v69;

              char v71 = [v70 usageMetadataWithUpdatedLastModifiedDate];

              [v61 setObject:v71 forKeyedSubscript:v66];
            }
          }
          id v72 = objc_alloc(MEMORY[0x1E4F925C0]);
          v73 = [v44 _path];
          v74 = objc_msgSend(v44, "pbf_posterUUID");
          uint64_t v75 = v48;
          BOOL v81 = (void *)v48;
          v46 = v84;
          v79 = v61;
          uint64_t v76 = (void *)[v72 initWithUpdatedPath:v73 updatedPosterUUID:v74 sourceIdentity:v75 configuredProperties:v84 attributes:v61];

          char v77 = v62;
          id v60 = v92;
          unsigned __int8 v30 = [(PBFPosterRoleCoordinator *)v86 _ingestIncomingPosterConfiguration:v76 change:v10 currentCollection:v92 storage:v94 outEvents:v83 error:v88];
        }
        else
        {
          id v54 = (void *)MEMORY[0x1E4F28C58];
          v96[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
          uint64_t v55 = [v10 description];
          uint64_t v56 = (void *)v55;
          uint64_t v57 = @"(null change)";
          if (v55) {
            uint64_t v57 = (__CFString *)v55;
          }
          v96[1] = @"posterUUIDToUpdate";
          v97[0] = v57;
          uint64_t v58 = @"(null uuid)";
          if (v40) {
            uint64_t v58 = v40;
          }
          v97[1] = v58;
          uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
          *a6 = [v54 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v59];

          unsigned __int8 v30 = 0;
          id v60 = v92;
        }

        id v11 = v94;
        id v12 = v90;
      }
      else
      {
        v95.receiver = self;
        v95.super_class = (Class)PBFAmbientRoleCoordinator;
        unsigned __int8 v30 = [(PBFPosterRoleCoordinator *)&v95 _executeChange:v10 storage:v11 outEvents:a5 error:a6];
      }

      goto LABEL_52;
    }
    uint64_t v17 = [v14 sourceIdentity];
    BOOL v18 = [v17 provider];

    uint64_t v19 = [v14 sourceIdentity];
    uint64_t v20 = [v19 descriptorIdentifier];

    if (![v20 length])
    {
LABEL_22:

      goto LABEL_23;
    }
    v85 = self;
    uint64_t v21 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
    id v87 = a6;
    uint64_t v22 = objc_msgSend(v21, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v18, a6);
    if (v22)
    {
      long long v23 = v22;
      uint64_t v93 = v21;
      long long v24 = [v22 dynamicDescriptorStoreCoordinatorForIdentifier:v20];
      long long v25 = v24;
      id v82 = a5;
      if (v24)
      {
        id v26 = v24;
      }
      else
      {
        id v26 = [v23 staticDescriptorStoreCoordinatorForIdentifier:v20];
      }
      uint64_t v31 = v26;

      uint64_t v32 = [v31 pathOfLatestVersion];
      v91 = (void *)v32;
      if (v32)
      {
        v89 = v31;
        v80 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:v32];
        uint64_t v33 = -[PBFAmbientRoleCoordinator _ambientIncomingPosterConfigurationForDescriptor:referenceIncomingPosterConfiguration:error:](v85, "_ambientIncomingPosterConfigurationForDescriptor:referenceIncomingPosterConfiguration:error:");

        if (v33)
        {
          uint64_t v34 = [(PBFPosterRoleCoordinator *)v85 role];
          uint64_t v35 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v34 incomingPoster:v33];

          uint64_t v14 = (void *)v33;
          id v10 = (id)v35;
        }
        else
        {
          uint64_t v14 = 0;
        }
        BOOL v37 = v93;

        uint64_t v31 = v89;
        BOOL v36 = v33 != 0;
      }
      else
      {
        BOOL v36 = 1;
        BOOL v37 = v93;
      }

      self = v85;
      a6 = v87;
      a5 = v82;
      if (v36) {
        goto LABEL_22;
      }
    }
    else
    {
    }
LABEL_41:

    unsigned __int8 v30 = 0;
LABEL_52:

    goto LABEL_53;
  }
  if (a6)
  {
    long long v27 = (void *)MEMORY[0x1E4F28C58];
    id v98 = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
    uint64_t v28 = [v10 description];
    uint64_t v14 = (void *)v28;
    BOOL v29 = @"(null change)";
    if (v28) {
      BOOL v29 = (__CFString *)v28;
    }
    v99[0] = v29;
    BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
    *a6 = [v27 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v18];
    goto LABEL_41;
  }
  unsigned __int8 v30 = 0;
LABEL_53:

  return v30;
}

- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  id v35 = 0;
  id v36 = 0;
  v34.receiver = self;
  v34.super_class = (Class)PBFAmbientRoleCoordinator;
  LODWORD(a4) = [(PBFPosterRoleCoordinator *)&v34 _prepareAttributesForIngestionForPoster:v15 existingAttributes:a4 incomingAttributes:v16 proposedAttributesToDelete:&v36 proposedAttributesToUpdate:&v35 storage:v17 currentCollection:v18 error:a10];
  id v19 = v36;
  id v20 = v35;
  uint64_t v21 = v20;
  if (a4)
  {
    unsigned __int8 v30 = a7;
    id v31 = v19;
    uint64_t v22 = (void *)[v20 mutableCopy];
    uint64_t v23 = *MEMORY[0x1E4F92750];
    long long v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F92750]];
    if (!v24)
    {
      long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F92608]) initWithSupportedDataLayout:3];
      [v22 setObject:v24 forKeyedSubscript:v23];
    }
    long long v25 = [v16 objectForKey:*MEMORY[0x1E4F92748]];
    if (v25
      && (id v33 = 0,
          [(PBFAmbientRoleCoordinator *)self _executeAmbientChargerConfigurationUpdateForPosterUUID:v15 newAmbientChargerConfiguration:v25 currentCollection:v18 storage:v17 error:&v33], (id v26 = v33) != 0))
    {
      long long v27 = v26;
      if (a10) {
        *a10 = v26;
      }

      BOOL v28 = 0;
    }
    else
    {
      if (a6) {
        *a6 = v31;
      }
      if (v30) {
        *unsigned __int8 v30 = (id)[v22 copy];
      }
      BOOL v28 = 1;
    }

    id v19 = v31;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)_executeAmbientChargerConfigurationUpdateForPosterUUID:(id)a3 newAmbientChargerConfiguration:(id)a4 currentCollection:(id)a5 storage:(id)a6 error:(id *)a7
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v75 = a6;
  uint64_t v13 = [v12 posterWithUUID:v10];
  uint64_t v14 = [v12 posterWithUUID:v10];
  uint64_t v15 = *MEMORY[0x1E4F92748];
  id v16 = [v12 attributeForPoster:v14 ofType:*MEMORY[0x1E4F92748]];

  uint64_t v76 = v16;
  if ([v16 isEqual:v11])
  {
    BOOL v17 = 1;
  }
  else
  {
    uint64_t v71 = v15;
    uint64_t v64 = v13;
    id v67 = v10;
    id v68 = v12;
    id v18 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v19 = [v11 associatedChargerIdentifiers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v89 objects:v95 count:16];
    id v70 = v11;
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v90;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v90 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v89 + 1) + 8 * i);
          long long v25 = [v76 associatedChargerIdentifiers];
          if ([v25 containsObject:v24])
          {
          }
          else
          {
            id v26 = [v11 associatedChargerIdentifiers];
            int v27 = [v26 containsObject:v24];

            id v11 = v70;
            if (v27)
            {
              [v18 addObject:v24];
              goto LABEL_15;
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v89 objects:v95 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    long long v87 = 0u;
    long long v88 = 0u;
    long long v86 = 0u;
    long long v85 = 0u;
    id v28 = v18;
    id v10 = v67;
    id v12 = v68;
    uint64_t v29 = v71;
    uint64_t v63 = [v28 countByEnumeratingWithState:&v85 objects:v94 count:16];
    if (v63)
    {
      uint64_t v30 = *(void *)v86;
      id v62 = v28;
      uint64_t v60 = *(void *)v86;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v86 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v65 = v31;
          uint64_t v32 = *(void *)(*((void *)&v85 + 1) + 8 * v31);
          id v33 = [v12 orderedPosters];
          objc_super v34 = [v33 array];
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __147__PBFAmbientRoleCoordinator__executeAmbientChargerConfigurationUpdateForPosterUUID_newAmbientChargerConfiguration_currentCollection_storage_error___block_invoke;
          v82[3] = &unk_1E6981CC8;
          id v72 = v12;
          uint64_t v73 = v32;
          id v83 = v72;
          uint64_t v84 = v32;
          id v35 = objc_msgSend(v34, "bs_filter:", v82);

          if ([v35 count])
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v61 = v35;
            id obj = v35;
            uint64_t v36 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v79;
              while (2)
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v79 != v38) {
                    objc_enumerationMutation(obj);
                  }
                  v40 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                  v41 = [v72 attributeForPoster:v40 ofType:v29];
                  uint64_t v42 = (void *)[v41 mutableCopy];
                  [v42 disassociateFromChargerIdentifier:v73];
                  uint64_t v43 = [v42 associatedChargerIdentifiers];
                  uint64_t v44 = [v43 count];

                  if (!v44)
                  {

                    uint64_t v42 = 0;
                  }
                  v45 = objc_msgSend(v40, "pbf_posterUUID");
                  v46 = [(PBFPosterRoleCoordinator *)self role];
                  v47 = [v42 encodeJSON];
                  id v77 = 0;
                  char v48 = [v75 mutateAttributeForPoster:v45 roleId:v46 attributeId:v29 attributePayload:v47 error:&v77];
                  id v49 = v77;

                  if ((v48 & 1) == 0)
                  {
                    if (a7) {
                      *a7 = v49;
                    }

                    BOOL v17 = 0;
                    id v57 = v83;
                    id v28 = v62;
                    uint64_t v56 = v62;
                    id v10 = v67;
                    id v11 = v70;
                    goto LABEL_43;
                  }

                  uint64_t v29 = v71;
                }
                uint64_t v37 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
                if (v37) {
                  continue;
                }
                break;
              }
            }

            id v10 = v67;
            id v12 = v68;
            id v11 = v70;
            id v35 = v61;
            id v28 = v62;
            uint64_t v30 = v60;
          }

          uint64_t v31 = v65 + 1;
        }
        while (v65 + 1 != v63);
        uint64_t v63 = [v28 countByEnumeratingWithState:&v85 objects:v94 count:16];
      }
      while (v63);
    }

    uint64_t v50 = [(PBFPosterRoleCoordinator *)self role];
    v51 = [v11 encodeJSON];
    int v52 = [v75 mutateAttributeForPoster:v10 roleId:v50 attributeId:v29 attributePayload:v51 error:a7];

    if (v52)
    {
      uint64_t v53 = *MEMORY[0x1E4F92780];
      id v54 = [v12 attributeForPoster:v64 ofType:*MEMORY[0x1E4F92780]];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = [v54 usageMetadataWithUpdatedLastModifiedDate];
      }
      else
      {
        uint64_t v56 = objc_opt_new();
      }
      id v57 = [(PBFPosterRoleCoordinator *)self role];
      uint64_t v58 = [v56 encodeJSON];
      [v75 mutateAttributeForPoster:v10 roleId:v57 attributeId:v53 attributePayload:v58 error:0];

      BOOL v17 = 1;
LABEL_43:

      id v12 = v68;
    }
    else
    {
      BOOL v17 = 1;
    }
    uint64_t v13 = v64;
  }
  return v17;
}

uint64_t __147__PBFAmbientRoleCoordinator__executeAmbientChargerConfigurationUpdateForPosterUUID_newAmbientChargerConfiguration_currentCollection_storage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) attributeForPoster:a2 ofType:*MEMORY[0x1E4F92748]];
  uint64_t v4 = [v3 isAssociatedWithChargerIdentifier:*(void *)(a1 + 40)];

  return v4;
}

- (id)sortedPosterUUIDsFromStorage:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F927B0];
  id v5 = a3;
  if ([v4 ambientPosterDateCreatedOrderingSupported])
  {
    v9.receiver = self;
    v9.super_class = (Class)PBFAmbientRoleCoordinator;
    uint64_t v6 = [(PBFPosterRoleCoordinator *)&v9 sortedPosterUUIDsFromStorage:v5];
  }
  else
  {
    char v7 = [(PBFAmbientRoleCoordinator *)self _sortedPosterUUIDsByExtensionIdentifierFromStorage:v5];

    uint64_t v6 = [(PBFAmbientRoleCoordinator *)self sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:v7];
  }
  return v6;
}

- (id)sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  v3 = (void *)[v39 mutableCopy];
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  uint64_t v6 = v5;

  char v7 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v8 = [&unk_1F2AAEC68 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = @"com.apple.PosterTester.SamplePoster";
    uint64_t v11 = *(void *)v45;
    uint64_t v37 = v7;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(&unk_1F2AAEC68);
        }
        uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
        if (![v13 isEqual:v10]) {
          goto LABEL_13;
        }
        uint64_t v14 = v11;
        uint64_t v15 = v6;
        id v16 = v10;
        BOOL v17 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
        id v18 = [v17 providerForExtensionIdentifier:v13];

        id v19 = [v18 posterExtensionInfoPlist];
        char v20 = objc_msgSend(v19, "pbf_supportsGallery");

        if ((v20 & 1) != 0
          || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
              uint64_t v21 = objc_claimAutoreleasedReturnValue(),
              [v21 stringArrayForKey:@"ShowSamplePoster"],
              uint64_t v22 = objc_claimAutoreleasedReturnValue(),
              int v23 = [v22 containsObject:v13],
              v22,
              v21,
              v23))
        {

          id v10 = v16;
          uint64_t v6 = v15;
          uint64_t v11 = v14;
          char v7 = v37;
LABEL_13:
          id v18 = [v39 objectForKeyedSubscript:v13];
          uint64_t v24 = [v18 array];
          [v7 addObjectsFromArray:v24];

          [v6 removeObjectForKey:v13];
          goto LABEL_14;
        }
        id v10 = v16;
        uint64_t v6 = v15;
        uint64_t v11 = v14;
        char v7 = v37;
LABEL_14:

        ++v12;
      }
      while (v9 != v12);
      uint64_t v25 = [&unk_1F2AAEC68 countByEnumeratingWithState:&v44 objects:v49 count:16];
      uint64_t v9 = v25;
    }
    while (v25);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = [v6 allKeys];
  int v27 = [v26 sortedArrayUsingSelector:sel_localizedCompare_];

  uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v33 = [v39 objectForKeyedSubscript:v32];
        objc_super v34 = [v33 array];
        [v7 addObjectsFromArray:v34];

        [v6 removeObjectForKey:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v29);
  }

  id v35 = (void *)[v7 copy];
  return v35;
}

- (id)_sortedPosterUUIDsByExtensionIdentifierFromStorage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PBFPosterRoleCoordinator *)self role];
  uint64_t v6 = [v4 sortedPosterUUIDsForRole:v5 error:0];

  char v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v4, "extensionIdentifierForPosterUUID:error:", v13, 0, (void)v18);
        uint64_t v15 = [v7 objectForKeyedSubscript:v14];
        if (!v15)
        {
          uint64_t v15 = objc_opt_new();
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
        [v15 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = (void *)[v7 copy];
  return v16;
}

- (void)noteDidResetRoleCoordinator:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(PBFPosterRoleCoordinator *)self role];
    int v6 = 138543362;
    char v7 = v5;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Populating ambient role coordinator epoch after role reset", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_ambientIncomingPosterConfigurationForDescriptor:(id)a3 referenceIncomingPosterConfiguration:(id)a4 error:(id *)a5
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v65 = a4;
  uint64_t v9 = [(PBFPosterRoleCoordinator *)self role];
  uint64_t v10 = [v8 _path];
  uint64_t v11 = [v10 serverIdentity];
  uint64_t v12 = [v11 provider];

  uint64_t v13 = [v8 _path];
  uint64_t v14 = [v13 serverIdentity];
  uint64_t v15 = [v14 descriptorIdentifier];

  uint64_t v16 = [MEMORY[0x1E4F925D8] mutableConfigurationWithRole:v9];
  BOOL v17 = [v8 _path];
  id v66 = 0;
  long long v18 = (void *)v16;
  LOBYTE(v16) = [(id)v16 copyContentsOfPath:v17 error:&v66];
  id v19 = v66;

  if ((v16 & 1) == 0)
  {
    if (a5)
    {
      id v26 = v65;
      if (v19)
      {
        int v27 = 0;
        *a5 = v19;
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v67 = *MEMORY[0x1E4F28588];
        v68[0] = @"_ambientIncomingPosterConfigurationForDescriptor initial copy; Unable to copy descriptor; bailing descriptor update.";
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
        objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 0, v32);
        id v33 = objc_claimAutoreleasedReturnValue();
        *a5 = v33;

        int v27 = 0;
      }
      uint64_t v25 = v18;
    }
    else
    {
      int v27 = 0;
      uint64_t v25 = v18;
      id v26 = v65;
    }
    goto LABEL_25;
  }
  id v57 = a5;
  long long v20 = [(PBFAmbientRoleCoordinator *)self defaultAttributesForNewPosterFromProvider:v12];
  long long v21 = [v8 ambientConfiguration];
  uint64_t v22 = v21;
  id v62 = v20;
  uint64_t v63 = v15;
  id v61 = v19;
  if (v21)
  {
    id v23 = v21;
    uint64_t v24 = *MEMORY[0x1E4F92750];
    uint64_t v25 = v18;
  }
  else
  {
    uint64_t v24 = *MEMORY[0x1E4F92750];
    uint64_t v28 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F92750]];
    uint64_t v29 = v28;
    uint64_t v25 = v18;
    if (v28) {
      id v30 = v28;
    }
    else {
      id v30 = (id)objc_opt_new();
    }
    id v34 = v30;

    long long v20 = v62;
    id v23 = v34;
  }
  uint64_t v64 = v12;

  id v35 = [MEMORY[0x1E4F92640] defaultConfiguredPropertiesForRole:v9];
  uint64_t v36 = (void *)[v35 mutableCopy];

  uint64_t v37 = (void *)[v20 mutableCopy];
  uint64_t v38 = (void *)[v23 copy];
  [v37 setObject:v38 forKeyedSubscript:v24];

  uint64_t v60 = v23;
  [v36 setAmbientConfiguration:v23];
  uint64_t v39 = [v8 displayNameLocalizationKey];
  id v26 = v65;
  if (v39) {
    [v25 setDisplayNameLocalizationKey:v39];
  }
  uint64_t v59 = (void *)v39;
  long long v40 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v41 = [MEMORY[0x1E4F924C8] descriptorIdentityWithProvider:v64 identifier:v63 role:v9 posterUUID:v40 version:0];
  long long v42 = (void *)v41;
  uint64_t v58 = v37;
  if (v65)
  {
    uint64_t v55 = (void *)v41;
    uint64_t v56 = v9;
    long long v43 = [v65 configuredProperties];
    long long v44 = v36;
    [v36 mergeConfiguredProperties:v43];
    long long v45 = [v65 attributes];
    if ([v45 count]) {
      [v37 addEntriesFromDictionary:v45];
    }
    long long v46 = [v65 _path];
    int v47 = [v25 copyContentsOfPath:v46 error:v57];

    if (!v47)
    {

      int v27 = 0;
      int v52 = v55;
      uint64_t v9 = v56;
      uint64_t v53 = v58;
      goto LABEL_24;
    }
    uint64_t v48 = [v65 destinationUUID];

    long long v40 = (void *)v48;
    long long v42 = v55;
    uint64_t v9 = v56;
  }
  else
  {
    long long v44 = v36;
  }
  id v49 = objc_alloc(MEMORY[0x1E4F925C0]);
  uint64_t v50 = [v25 _path];
  v51 = v42;
  int v52 = v42;
  uint64_t v53 = v58;
  int v27 = (void *)[v49 initWithNewPath:v50 destinationPosterUUID:v40 sourceIdentity:v51 configuredProperties:v44 attributes:v58];

  [v27 trackTemporaryState:v25];
  id v26 = v65;
LABEL_24:

  uint64_t v15 = v63;
  uint64_t v12 = v64;
  id v19 = v61;
LABEL_25:

  return v27;
}

- (void)notifyEventWasReceived:(const char *)a1 changes:(uint64_t)a2 storage:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  int v6 = (objc_class *)objc_opt_class();
  char v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"PBFAmbientRoleCoordinator.m";
  __int16 v16 = 1024;
  int v17 = 255;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "Failed to correct editing behavior for poster %{public}@: %{public}@");
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "failed to correct widget configuration for poster %{public}@: %{public}@");
}

- (void)finalizeChangesWithChangeHandler:(os_log_t)log outEvents:error:.cold.3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "All photo posters are hidden and we were unsuccessful in unhiding one.", v1, 2u);
}

@end