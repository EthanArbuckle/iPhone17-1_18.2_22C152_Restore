@interface PBFPosterRoleCoordinator
+ (BOOL)supportsSupplementalUpdates;
+ (NSSet)protectedAttributes;
+ (NSSet)subscribedEvents;
+ (NSSet)supportedAttributes;
+ (NSSet)supportedChangeTypes;
+ (id)buildInitialStateSetupEventsForRoleCoordinator:(id)a3 extensionHandlers:(id)a4 extensionStoreCoordinators:(id)a5;
+ (void)dumpResultsForEvent:(id)a3 role:(id)a4 posterCollection:(id)a5 changes:(id)a6 eventWasHandled:(BOOL)a7;
- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6;
- (BOOL)_ingestIncomingPosterConfiguration:(id)a3 change:(id)a4 currentCollection:(id)a5 storage:(id)a6 outEvents:(id *)a7 error:(id *)a8;
- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10;
- (BOOL)finalizeChangesWithChangeHandler:(id)a3 outEvents:(id *)a4 error:(id *)a5;
- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5;
- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4;
- (BOOL)updateCoordinatorWithChange:(id)a3 changeHandler:(id)a4 emitEvents:(id *)a5 error:(id *)a6;
- (BOOL)validateEventIsRelevant:(id)a3;
- (NSSet)knownExtensionIdentifiers;
- (NSString)role;
- (PBFModelCoordinatorProviding)modelCoordinatorProvider;
- (PBFPosterExtensionDataStorageRetrieving)storage;
- (PBFPosterRoleCoordinator)initWithRole:(id)a3 storage:(id)a4 modelCoordinatorProvider:(id)a5 providers:(id)a6;
- (PBFPosterRoleCoordinatorDelegate)delegate;
- (PRPosterCollection)posterCollection;
- (id)_addChangesForInitialPostersTo:(id)a3 modelCoordinatorProvider:(id)a4 role:(id)a5;
- (id)attributesForConfiguration:(id)a3 ofType:(id)a4 storage:(id)a5;
- (id)buildNewPosterCollectionFromStorage:(id)a3;
- (id)configurationStoreCoordinatorForPosterUUID:(id)a3 extensionIdentifier:(id)a4;
- (id)defaultAttributesForNewPosterFromProvider:(id)a3;
- (id)determineActivePosterConfigurationForContext:(id)a3;
- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4;
- (id)lastActivatedDatesForPosterCollection:(id)a3;
- (id)posterConfigurationsSortedByLastActivatedDate:(id)a3;
- (id)posterWithUUID:(id)a3;
- (id)posterWithUUID:(id)a3 extensionIdentifier:(id)a4;
- (id)setupRoleIfNecessaryWithStorage:(id)a3;
- (id)sortedPosterUUIDsFromStorage:(id)a3;
- (unint64_t)maximumNumberOfPosters;
- (void)_transactionLock_markPosterCollectionDirty;
- (void)decrementTransactionCount;
- (void)finalizeTransactionCount;
- (void)incrementTransactionCount;
- (void)invalidate;
- (void)markPosterCollectionDirty;
- (void)noteDidResetRoleCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumNumberOfPosters:(unint64_t)a3;
- (void)setPosterCollection:(id)a3;
@end

@implementation PBFPosterRoleCoordinator

- (PBFPosterRoleCoordinator)initWithRole:(id)a3 storage:(id)a4 modelCoordinatorProvider:(id)a5 providers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v12;
  if (!v15)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:]();
    }
LABEL_19:
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322EFA4);
  }
  v16 = v15;
  if (([v15 conformsToProtocol:&unk_1F2AE5A58] & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFPosterExtensionDataStorage)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322F008);
  }

  id v17 = v13;
  if (!v17)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322F06CLL);
  }
  v18 = v17;
  if (([v17 conformsToProtocol:&unk_1F2AC6B88] & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFModelCoordinatorProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:]();
    }
    goto LABEL_19;
  }

  v29.receiver = self;
  v29.super_class = (Class)PBFPosterRoleCoordinator;
  v19 = [(PBFPosterRoleCoordinator *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_role, a3);
    objc_storeStrong((id *)&v20->_storage, a4);
    objc_storeStrong((id *)&v20->_modelCoordinatorProvider, a5);
    v21 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
    invalidationSignal = v20->_invalidationSignal;
    v20->_invalidationSignal = v21;

    [(PBFPosterRoleCoordinator *)v20 setMaximumNumberOfPosters:200];
    uint64_t v23 = [v14 copy];
    knownExtensionIdentifiers = v20->_knownExtensionIdentifiers;
    v20->_knownExtensionIdentifiers = (NSSet *)v23;

    v20->_transactionLock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

+ (BOOL)supportsSupplementalUpdates
{
  return 0;
}

- (id)setupRoleIfNecessaryWithStorage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = [(PBFPosterRoleCoordinator *)self role];
    v7 = [v4 roleIdentifiersWithError:0];
    if (([v7 containsObject:v6] & 1) != 0
      || (id v13 = 0, [v4 addRole:v6 displayName:v6 error:&v13], (v5 = v13) == 0))
    {
      id v12 = 0;
      BOOL v8 = [(PBFPosterRoleCoordinator *)self synchronizeFileSystemAttributesForStorage:v4 error:&v12];
      id v5 = v12;
      v9 = PBFLogRoleCoordinator();
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v15 = v6;
          _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Role synchronization compelted successfully", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[PBFPosterRoleCoordinator setupRoleIfNecessaryWithStorage:]();
      }
    }
    [(PBFPosterRoleCoordinator *)self markPosterCollectionDirty];
  }
  return v5;
}

- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled];
  if (v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v8 = [(PBFPosterRoleCoordinator *)self role];
    v9 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v6];
    v10 = [v9 selectedPoster];
    if (v10)
    {
      id v11 = [v9 orderedPosters];
      char v12 = [v11 containsObject:v10];

      if ((v12 & 1) == 0)
      {
        id v13 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v8;
          _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Discovered selected poster not part of ordered posters; correcting...",
            buf,
            0xCu);
        }

        id v14 = objc_msgSend(v10, "pbf_posterUUID");
        id v18 = 0;
        [v6 assignPosterUUID:v14 toRole:v8 error:&v18];
        id v15 = v18;

        if (v15)
        {
          uint64_t v16 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[PBFPosterRoleCoordinator synchronizeFileSystemAttributesForStorage:error:]();
          }
        }
      }
    }
  }
  return v7 ^ 1;
}

- (id)posterWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterRoleCoordinator *)self storage];
  id v6 = [v5 extensionIdentifierForPosterUUID:v4 error:0];

  if (v6
    && ([(PBFPosterRoleCoordinator *)self knownExtensionIdentifiers],
        int v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:v6],
        v7,
        v8))
  {
    v9 = [(PBFPosterRoleCoordinator *)self posterWithUUID:v4 extensionIdentifier:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)posterWithUUID:(id)a3 extensionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
  v9 = objc_msgSend(v8, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v6, 0);

  v10 = [v9 latestPosterConfigurationForUUID:v7];

  return v10;
}

- (id)configurationStoreCoordinatorForPosterUUID:(id)a3 extensionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
  v9 = objc_msgSend(v8, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v6, 0);

  v10 = [v9 configurationStoreCoordinatorForPosterUUID:v7];

  return v10;
}

- (id)lastActivatedDatesForPosterCollection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v3, "orderedPosters", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x1E4F92780];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v12 = [v3 attributeForPoster:v11 ofType:v9];
        id v13 = [v12 lastActivatedDate];
        if (v13)
        {
          id v14 = objc_msgSend(v11, "pbf_posterUUID");
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)posterConfigurationsSortedByLastActivatedDate:(id)a3
{
  id v4 = a3;
  if ([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
  {
    id v5 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  else
  {
    uint64_t v6 = [(PBFPosterRoleCoordinator *)self lastActivatedDatesForPosterCollection:v4];
    uint64_t v7 = [v4 orderedPosters];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__PBFPosterRoleCoordinator_posterConfigurationsSortedByLastActivatedDate___block_invoke;
    v11[3] = &unk_1E69813A0;
    id v12 = v6;
    id v8 = v6;
    uint64_t v9 = [v7 sortedArrayUsingComparator:v11];

    id v5 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v9];
  }
  return v5;
}

uint64_t __74__PBFPosterRoleCoordinator_posterConfigurationsSortedByLastActivatedDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a2, "pbf_posterUUID");
  id v8 = [v5 objectForKey:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v11 = v10;

  id v12 = *(void **)(a1 + 32);
  id v13 = objc_msgSend(v6, "pbf_posterUUID");

  id v14 = [v12 objectForKey:v13];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  long long v17 = v16;

  uint64_t v18 = [v11 compare:v17];
  return v18;
}

- (PRPosterCollection)posterCollection
{
  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  if (self->_transactionLock_isInTransaction)
  {
    id v4 = [(PBFPosterRoleCoordinator *)self storage];
    id v5 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v4];
  }
  else
  {
    p_posterCollection = &self->_posterCollection;
    posterCollection = self->_posterCollection;
    if (posterCollection)
    {
      id v5 = posterCollection;
    }
    else
    {
      id v8 = [(PBFPosterRoleCoordinator *)self storage];
      id v5 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v8];
      objc_storeStrong((id *)p_posterCollection, v5);
    }
  }
  os_unfair_lock_unlock(p_transactionLock);
  return v5;
}

- (void)markPosterCollectionDirty
{
  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  [(PBFPosterRoleCoordinator *)self _transactionLock_markPosterCollectionDirty];
  os_unfair_lock_unlock(p_transactionLock);
}

- (void)_transactionLock_markPosterCollectionDirty
{
  posterCollection = self->_posterCollection;
  self->_posterCollection = 0;
}

- (id)defaultAttributesForNewPosterFromProvider:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F92780];
  id v3 = objc_opt_new();
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (void)invalidate
{
  if ([(BSAtomicSignal *)self->_invalidationSignal signal])
  {
    os_unfair_lock_lock(&self->_transactionLock);
    modelCoordinatorProvider = self->_modelCoordinatorProvider;
    self->_modelCoordinatorProvider = 0;

    storage = self->_storage;
    self->_storage = 0;

    os_unfair_lock_unlock(&self->_transactionLock);
  }
}

+ (NSSet)supportedAttributes
{
  if (supportedAttributes_onceToken != -1) {
    dispatch_once(&supportedAttributes_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)supportedAttributes_supportedAttributes;
  return (NSSet *)v2;
}

void __47__PBFPosterRoleCoordinator_supportedAttributes__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F92780], *MEMORY[0x1E4F92758], *MEMORY[0x1E4F92770], 0);
  v1 = (void *)supportedAttributes_supportedAttributes;
  supportedAttributes_supportedAttributes = v0;
}

+ (NSSet)protectedAttributes
{
  if (protectedAttributes_onceToken != -1) {
    dispatch_once(&protectedAttributes_onceToken, &__block_literal_global_129);
  }
  v2 = (void *)protectedAttributes_protectedAttributes;
  return (NSSet *)v2;
}

void __47__PBFPosterRoleCoordinator_protectedAttributes__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F92780], *MEMORY[0x1E4F92758], *MEMORY[0x1E4F92770], 0);
  v1 = (void *)protectedAttributes_protectedAttributes;
  protectedAttributes_protectedAttributes = v0;
}

- (id)attributesForConfiguration:(id)a3 ofType:(id)a4 storage:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v30 = (PBFPosterExtensionDataStorageRetrieving *)a5;
  char v10 = [(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled];
  id v11 = (void *)MEMORY[0x1E4F1CC08];
  if ((v10 & 1) == 0 && v8 && [v9 count])
  {
    if (!v30)
    {
      storage = self->_storage;
      if (!storage) {
        goto LABEL_29;
      }
      v30 = storage;
    }
    id v13 = [(PBFPosterRoleCoordinator *)self role];
    id v27 = v8;
    id v14 = objc_msgSend(v8, "pbf_posterUUID");
    v28 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v26 = v9;
    id obj = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v31 = 0;
          uint64_t v20 = -[PBFPosterExtensionDataStorageRetrieving attributeForPoster:roleId:attributeId:error:](v30, "attributeForPoster:roleId:attributeId:error:", v14, v13, v19, &v31, v26);
          unint64_t v21 = (unint64_t)v31;
          v22 = PBFLogRoleCoordinator();
          uint64_t v23 = v22;
          if (v20 | v21)
          {
            if (v21)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544130;
                v37 = v13;
                __int16 v38 = 2114;
                v39 = v14;
                __int16 v40 = 2114;
                v41 = v19;
                __int16 v42 = 2114;
                unint64_t v43 = v21;
                _os_log_error_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch attribute %{public}@ for posterUUID %{public}@: %{public}@", buf, 0x2Au);
              }
            }
            else
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                v37 = v13;
                __int16 v38 = 2114;
                v39 = v19;
                __int16 v40 = 2114;
                v41 = v14;
                _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Fetched attribute data for attribute %{public}@ / posterUUID %{public}@", buf, 0x20u);
              }

              uint64_t v23 = PRPosterRoleAttributeForData();
              if (v23)
              {
                [v28 setObject:v23 forKeyedSubscript:v19];
              }
              else
              {
                v24 = PBFLogRoleCoordinator();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543874;
                  v37 = v13;
                  __int16 v38 = 2114;
                  v39 = v19;
                  __int16 v40 = 2114;
                  v41 = v14;
                  _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_INFO, "[%{public}@] Unable to decode attribute data for attribute %{public}@ / posterUUID %{public}@", buf, 0x20u);
                }
              }
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            v37 = v13;
            __int16 v38 = 2114;
            v39 = v19;
            __int16 v40 = 2114;
            v41 = v14;
            _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_INFO, "[%{public}@] No attribute data for attribute %{public}@ / posterUUID %{public}@", buf, 0x20u);
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v16);
    }

    id v11 = (void *)[v28 copy];
    id v9 = v26;
    id v8 = v27;
  }

LABEL_29:
  return v11;
}

+ (NSSet)subscribedEvents
{
  if (subscribedEvents_onceToken != -1) {
    dispatch_once(&subscribedEvents_onceToken, &__block_literal_global_131);
  }
  v2 = (void *)subscribedEvents_subscribedEvents;
  return (NSSet *)v2;
}

void __44__PBFPosterRoleCoordinator_subscribedEvents__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PBFPosterDataStoreEventTypeExtensionsUpdated";
  v4[1] = @"PBFPosterDataStoreEventTypePosterDeleted";
  v4[2] = @"PBFPosterDataStoreEventTypePosterActivated";
  v4[3] = @"PBFPosterDataStoreEventTypeRoleCoordinatorReset";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)subscribedEvents_subscribedEvents;
  subscribedEvents_subscribedEvents = v2;
}

- (BOOL)validateEventIsRelevant:(id)a3
{
  id v4 = a3;
  if (([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] & 1) == 0)
  {
    id v5 = [(id)objc_opt_class() subscribedEvents];
    uint64_t v6 = [v4 eventType];
    int v7 = [v5 containsObject:v6];

    if (v7)
    {
      id v8 = [v4 eventType];
      int v9 = [v8 isEqual:@"PBFPosterDataStoreEventTypeRoleCoordinatorReset"];

      if (v9)
      {
        char v10 = [(PBFPosterRoleCoordinator *)self role];
        id v11 = [v4 toValue];
        char v12 = [v10 isEqualToString:v11];
      }
      else
      {
        id v13 = [v4 eventType];
        int v14 = [v13 isEqual:@"PBFPosterDataStoreEventTypePosterDeleted"];

        if (v14)
        {
          uint64_t v15 = [v4 fromValue];
          char v10 = v15;
          if (!v15)
          {
            char v12 = 0;
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v16 = [v4 eventType];
          int v17 = [v16 isEqual:@"PBFPosterDataStoreEventTypePosterActivated"];

          if (!v17)
          {
            char v12 = 1;
            goto LABEL_14;
          }
          uint64_t v15 = [v4 toValue];
          char v10 = v15;
        }
        id v11 = [v15 role];
        uint64_t v18 = [(PBFPosterRoleCoordinator *)self role];
        char v12 = [v11 isEqual:v18];
      }
LABEL_13:

      goto LABEL_14;
    }
  }
  char v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] & 1) == 0
    && [(PBFPosterRoleCoordinator *)self validateEventIsRelevant:v8])
  {
    char v10 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(PBFPosterRoleCoordinator *)self storage];
    }
    id v13 = v11;
    int v14 = [(PBFPosterRoleCoordinator *)self role];
    v119 = self;
    uint64_t v15 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v13];
    uint64_t v16 = objc_opt_new();
    int v17 = [v8 eventType];
    int v18 = [v17 isEqual:@"PBFPosterDataStoreEventTypeRoleCoordinatorReset"];

    v133 = v15;
    if (v18)
    {
      v140 = v13;
      v122 = a4;
      v126 = v10;
      id v129 = v9;
      long long v170 = 0u;
      long long v171 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      long long v19 = [v15 orderedPosters];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v168 objects:v183 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v169;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v169 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = objc_msgSend(*(id *)(*((void *)&v168 + 1) + 8 * i), "pbf_posterUUID");
            v25 = +[PBFPosterRoleCoordinatorChange removePosterFromRole:v14 matchingUUID:v24];

            objc_msgSend(v16, "bs_safeAddObject:", v25);
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v168 objects:v183 count:16];
        }
        while (v21);
      }

      id v26 = +[PBFPosterRoleCoordinatorChange resetRole:v14];
      objc_msgSend(v16, "bs_safeAddObject:", v26);

      char v10 = v126;
      id v9 = v129;
      a4 = v122;
LABEL_16:
      id v13 = v140;
LABEL_102:
      uint64_t v111 = objc_msgSend(v16, "count", v113);
      LOBYTE(v12) = 1;
      if (a4)
      {
        uint64_t v15 = v133;
        if (v111) {
          *a4 = (id)[v16 copy];
        }
      }
      else
      {
        uint64_t v15 = v133;
      }
      goto LABEL_106;
    }
    id v27 = [v8 eventType];
    int v28 = [v27 isEqual:@"PBFPosterDataStoreEventTypeExtensionsUpdated"];

    if (v28)
    {
      v141 = v13;
      v123 = a4;
      v127 = v10;
      id v130 = v9;
      v137 = objc_opt_new();
      long long v164 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      objc_super v29 = [v8 toValue];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v164 objects:v182 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v165;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v165 != v32) {
              objc_enumerationMutation(v29);
            }
            long long v34 = *(void **)(*((void *)&v164 + 1) + 8 * j);
            long long v35 = [v34 supportedRoles];
            int v36 = [v35 containsObject:v14];

            if (v36)
            {
              v37 = [v34 posterExtensionBundleIdentifier];
              [v137 addObject:v37];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v164 objects:v182 count:16];
        }
        while (v31);
      }

      __int16 v38 = v133;
      v39 = [v133 selectedPoster];
      v115 = objc_msgSend(v39, "pbf_posterUUID");

      __int16 v40 = objc_opt_new();
      v41 = [(PBFPosterRoleCoordinator *)v119 knownExtensionIdentifiers];
      id v117 = v8;
      if ([v41 isEqualToSet:v137])
      {
        id v13 = v141;
      }
      else
      {
        v113 = v41;
        v53 = (void *)[v41 mutableCopy];
        [v53 minusSet:v137];
        long long v162 = 0u;
        long long v163 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        id obja = v53;
        uint64_t v54 = [obja countByEnumeratingWithState:&v160 objects:v181 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v161;
          do
          {
            for (uint64_t k = 0; k != v55; ++k)
            {
              if (*(void *)v161 != v56) {
                objc_enumerationMutation(obja);
              }
              uint64_t v58 = *(void *)(*((void *)&v160 + 1) + 8 * k);
              long long v156 = 0u;
              long long v157 = 0u;
              long long v158 = 0u;
              long long v159 = 0u;
              v59 = [v141 posterUUIDsForExtensionIdentifier:v58 role:v14 error:0];
              uint64_t v60 = [v59 countByEnumeratingWithState:&v156 objects:v180 count:16];
              if (v60)
              {
                uint64_t v61 = v60;
                uint64_t v62 = *(void *)v157;
                do
                {
                  for (uint64_t m = 0; m != v61; ++m)
                  {
                    if (*(void *)v157 != v62) {
                      objc_enumerationMutation(v59);
                    }
                    [v40 addObject:*(void *)(*((void *)&v156 + 1) + 8 * m)];
                  }
                  uint64_t v61 = [v59 countByEnumeratingWithState:&v156 objects:v180 count:16];
                }
                while (v61);
              }
            }
            uint64_t v55 = [obja countByEnumeratingWithState:&v160 objects:v181 count:16];
          }
          while (v55);
        }

        v64 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          knownExtensionIdentifiers = v119->_knownExtensionIdentifiers;
          *(_DWORD *)buf = 138543874;
          v175 = v119;
          __int16 v176 = 2112;
          v177 = knownExtensionIdentifiers;
          __int16 v178 = 2112;
          v179 = v137;
          _os_log_impl(&dword_1D31CE000, v64, OS_LOG_TYPE_DEFAULT, "<%{public}@> Updating knownExtensionIdentifiers.\n\tfromValue: %@\n\ttoValue: %@", buf, 0x20u);
        }

        v41 = (void *)[v137 copy];
        objc_storeStrong((id *)&v119->_knownExtensionIdentifiers, v41);

        id v8 = v117;
        id v13 = v141;
        __int16 v38 = v133;
      }
      v66 = [v38 orderedPosterUUIDs];
      v67 = [v66 set];
      v68 = (void *)[v67 mutableCopy];

      [v68 minusSet:v40];
      v114 = v68;
      if ([v68 count])
      {
        id v69 = v115;
        char v10 = v127;
      }
      else
      {
        char v10 = v127;
        uint64_t v79 = [(PBFPosterRoleCoordinator *)v119 _addChangesForInitialPostersTo:v16 modelCoordinatorProvider:v127 role:v14];
        v80 = (void *)v79;
        v113 = v41;
        if (v79) {
          v81 = (void *)v79;
        }
        else {
          v81 = v115;
        }
        id v69 = v81;
      }
      v151[0] = MEMORY[0x1E4F143A8];
      v151[1] = 3221225472;
      v151[2] = __67__PBFPosterRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke;
      v151[3] = &unk_1E6982900;
      id v116 = v69;
      id v152 = v116;
      id v82 = v38;
      id v153 = v82;
      id v83 = v41;
      id v154 = v83;
      id objb = v40;
      id v155 = objb;
      if (__67__PBFPosterRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke((uint64_t)v151))
      {
        v84 = [(PBFPosterRoleCoordinator *)v119 posterConfigurationsSortedByLastActivatedDate:v82];
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        v85 = [v84 reverseObjectEnumerator];
        uint64_t v86 = [v85 countByEnumeratingWithState:&v147 objects:v173 count:16];
        if (v86)
        {
          uint64_t v87 = v86;
          v113 = v84;
          id v120 = v83;
          uint64_t v88 = *(void *)v148;
          while (2)
          {
            for (uint64_t n = 0; n != v87; ++n)
            {
              if (*(void *)v148 != v88) {
                objc_enumerationMutation(v85);
              }
              v90 = *(void **)(*((void *)&v147 + 1) + 8 * n);
              v91 = objc_msgSend(v82, "configuredPropertiesForPoster:", v90, v113);
              v92 = [v91 focusConfiguration];

              if (!v92)
              {
                v93 = objc_msgSend(v90, "pbf_posterUUID");
                if (![objb containsObject:v93])
                {
                  id v94 = v93;

                  v95 = +[PBFPosterRoleCoordinatorChange selectPosterForRole:v14 matchingUUID:v94];

                  [v16 addObject:v95];
                  char v10 = v127;
                  id v83 = v120;
                  goto LABEL_75;
                }
              }
            }
            uint64_t v87 = [v85 countByEnumeratingWithState:&v147 objects:v173 count:16];
            if (v87) {
              continue;
            }
            break;
          }
          char v10 = v127;
          id v83 = v120;
          id v94 = v116;
LABEL_75:
          v84 = v113;
        }
        else
        {
          id v94 = v116;
        }

        id v9 = v130;
        a4 = v123;
        id v13 = v141;
        id v8 = v117;
      }
      else
      {
        id v9 = v130;
        a4 = v123;
        id v94 = v116;
      }

      goto LABEL_102;
    }
    __int16 v42 = [v8 eventType];
    int v43 = [v42 isEqual:@"PBFPosterDataStoreEventTypePosterDeleted"];

    if (v43)
    {
      v44 = [v15 selectedPoster];
      v138 = objc_msgSend(v44, "pbf_posterUUID");

      id v118 = v8;
      id obj = [v8 fromValue];
      uint64_t v45 = objc_msgSend(obj, "pbf_posterUUID");
      v46 = [v15 orderedPosterUUIDs];
      int v47 = [v46 containsObject:v45];

      if (v47)
      {
        v124 = a4;
        v48 = +[PBFPosterRoleCoordinatorChange removePosterFromRole:v14 matchingUUID:v45];
        [v16 addObject:v48];

        v49 = [v15 orderedPosterUUIDs];
        v50 = [v49 set];
        v51 = (void *)[v50 mutableCopy];

        [v51 removeObject:v45];
        if ([v51 count])
        {
          a4 = v124;
          id v52 = v138;
        }
        else
        {
          uint64_t v96 = [(PBFPosterRoleCoordinator *)v119 _addChangesForInitialPostersTo:v16 modelCoordinatorProvider:v10 role:v14];
          v97 = (void *)v96;
          if (v96) {
            v98 = (void *)v96;
          }
          else {
            v98 = v138;
          }
          id v99 = v98;

          id v52 = v99;
          a4 = v124;
        }

        uint64_t v15 = v133;
      }
      else
      {
        id v52 = v138;
      }
      if ([v52 isEqual:v45])
      {
        v142 = v13;
        v128 = v10;
        v100 = [(PBFPosterRoleCoordinator *)v119 posterConfigurationsSortedByLastActivatedDate:v15];
        long long v143 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        long long v146 = 0u;
        v101 = [v100 reverseObjectEnumerator];
        uint64_t v102 = [v101 countByEnumeratingWithState:&v143 objects:v172 count:16];
        if (v102)
        {
          uint64_t v103 = v102;
          v121 = v100;
          v125 = a4;
          v139 = v52;
          id v132 = v9;
          uint64_t v104 = *(void *)v144;
          while (2)
          {
            for (iuint64_t i = 0; ii != v103; ++ii)
            {
              if (*(void *)v144 != v104) {
                objc_enumerationMutation(v101);
              }
              v106 = *(void **)(*((void *)&v143 + 1) + 8 * ii);
              v107 = [v133 configuredPropertiesForPoster:v106];
              v108 = [v107 focusConfiguration];

              if (!v108)
              {
                v109 = objc_msgSend(v106, "pbf_posterUUID");
                if (![v109 isEqual:v45])
                {
                  id v52 = v109;

                  v110 = +[PBFPosterRoleCoordinatorChange selectPosterForRole:v14 matchingUUID:v52];

                  [v16 addObject:v110];
                  id v9 = v132;
                  a4 = v125;
                  goto LABEL_99;
                }
              }
            }
            uint64_t v103 = [v101 countByEnumeratingWithState:&v143 objects:v172 count:16];
            if (v103) {
              continue;
            }
            break;
          }
          id v9 = v132;
          a4 = v125;
          id v52 = v139;
LABEL_99:
          v100 = v121;
        }

        char v10 = v128;
        id v13 = v142;
      }

      id v8 = v118;
      goto LABEL_102;
    }
    v70 = [v8 eventType];
    int v12 = [v70 isEqual:@"PBFPosterDataStoreEventTypePosterActivated"];

    if (v12)
    {
      id v131 = v9;
      v71 = [v8 toValue];
      v72 = objc_msgSend(v71, "pbf_posterUUID");

      v73 = [v15 orderedPosterUUIDs];
      int v12 = [v73 containsObject:v72];

      if (v12)
      {
        v140 = v13;
        v74 = a4;
        v75 = [v15 posterWithUUID:v72];
        v76 = [v15 attributeForPoster:v75 ofType:*MEMORY[0x1E4F92780]];
        if (!v76) {
          v76 = objc_opt_new();
        }
        v77 = [v76 usageMetadataWithUpdatedLastActivatedDate];

        v78 = +[PBFPosterRoleCoordinatorChange assignAttributeToPosterWithinRole:v14 matchingUUID:v72 attribute:v77];
        [v16 addObject:v78];

        id v9 = v131;
        a4 = v74;
        goto LABEL_16;
      }

      id v9 = v131;
    }
LABEL_106:

    goto LABEL_107;
  }
  LOBYTE(v12) = 0;
LABEL_107:

  return v12;
}

uint64_t __67__PBFPosterRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return 1;
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "posterWithUUID:");
  id v3 = *(void **)(a1 + 48);
  id v4 = objc_msgSend(v2, "pbf_posterProvider");
  LODWORD(v3) = [v3 containsObject:v4];

  if (!v3) {
    goto LABEL_4;
  }
  id v5 = (void *)MEMORY[0x1E4F926B0];
  uint64_t v6 = [*(id *)(a1 + 40) posterWithUUID:*(void *)(a1 + 32)];
  int v7 = [v6 _path];
  id v8 = [v5 loadFocusConfigurationForPath:v7 error:0];

  if (!v8) {
    uint64_t v9 = [*(id *)(a1 + 56) containsObject:*(void *)(a1 + 32)];
  }
  else {
LABEL_4:
  }
    uint64_t v9 = 1;

  return v9;
}

- (id)_addChangesForInitialPostersTo:(id)a3 modelCoordinatorProvider:(id)a4 role:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = +[PBFInitialPosterHelper initialPosterConfigurationsWithModelCoordinatorProvider:v8 role:v9];
  id v11 = v10;
  if (v10
    && (long long v27 = 0u,
        long long v28 = 0u,
        long long v25 = 0u,
        long long v26 = 0u,
        (uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16]) != 0))
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v26;
    char v16 = 1;
    id obj = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v19 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v9 incomingPoster:v18];
        [v7 addObject:v19];

        if (v16)
        {
          uint64_t v20 = [v18 destinationUUID];
          uint64_t v21 = +[PBFPosterRoleCoordinatorChange selectPosterForRole:v9 matchingUUID:v20];
          [v7 addObject:v21];

          uint64_t v22 = [v18 destinationUUID];

          int v14 = (void *)v22;
        }
        char v16 = 0;
      }
      id v11 = obj;
      uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      char v16 = 0;
    }
    while (v13);
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (id)determineActivePosterConfigurationForContext:(id)a3
{
  return [(PBFPosterRoleCoordinator *)self determineActivePosterConfigurationForStorage:0 context:a3];
}

- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4
{
  if (a3) {
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", a3, a4);
  }
  else {
  id v4 = [(PBFPosterRoleCoordinator *)self posterCollection];
  }
  id v5 = [v4 selectedPoster];

  return v5;
}

+ (NSSet)supportedChangeTypes
{
  if (supportedChangeTypes_onceToken != -1) {
    dispatch_once(&supportedChangeTypes_onceToken, &__block_literal_global_140);
  }
  uint64_t v2 = (void *)supportedChangeTypes_supportedChangeTypes;
  return (NSSet *)v2;
}

void __48__PBFPosterRoleCoordinator_supportedChangeTypes__block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PBFPosterRoleCoordinatorChangeTypeAddPoster";
  v4[1] = @"PBFPosterRoleCoordinatorChangeTypeUpdatePoster";
  v4[2] = @"PBFPosterRoleCoordinatorChangeTypeRemovePoster";
  v4[3] = @"PBFPosterRoleCoordinatorChangeTypeReorderPosters";
  v4[4] = @"PBFPosterRoleCoordinatorChangeTypeDuplicatePoster";
  void v4[5] = @"PBFPosterRoleCoordinatorChangeTypeSelectPoster";
  v4[6] = @"PBFPosterRoleCoordinatorChangeTypeAssignAttribute";
  v4[7] = @"PBFPosterRoleCoordinatorChangeTypeRemoveAttribute";
  v4[8] = @"PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator";
  v4[9] = @"PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)supportedChangeTypes_supportedChangeTypes;
  supportedChangeTypes_supportedChangeTypes = v2;
}

- (BOOL)updateCoordinatorWithChange:(id)a3 changeHandler:(id)a4 emitEvents:(id *)a5 error:(id *)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (![(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
  {
    uint64_t v13 = [v10 changeType];
    int v14 = [(id)objc_opt_class() supportedChangeTypes];
    char v15 = [v14 containsObject:v13];

    if (v15)
    {
      [(PBFPosterRoleCoordinator *)self incrementTransactionCount];
      char v16 = objc_opt_new();
      id v26 = 0;
      id v27 = 0;
      BOOL v17 = [(PBFPosterRoleCoordinator *)self _executeChange:v10 storage:v11 outEvents:&v27 error:&v26];
      id v18 = v27;
      id v19 = v26;
      if (v17)
      {
        if (v18) {
          id v20 = v18;
        }
        else {
          id v20 = (id)MEMORY[0x1E4F1CBF0];
        }
        [v16 addObjectsFromArray:v20];
      }
      if (a6 && v19) {
        *a6 = v19;
      }
      if (a5 && [v16 count]) {
        *a5 = (id)[v16 copy];
      }
      [(PBFPosterRoleCoordinator *)self decrementTransactionCount];
      if (v19) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = v17;
      }
    }
    else
    {
      if (!a6)
      {
        BOOL v12 = 0;
        goto LABEL_26;
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      v28[0] = @"supportedChangeTypes";
      char v16 = [(id)objc_opt_class() supportedChangeTypes];
      uint64_t v22 = [v16 allObjects];
      id v19 = (id)v22;
      uint64_t v23 = MEMORY[0x1E4F1CBF0];
      if (v22) {
        uint64_t v23 = v22;
      }
      v28[1] = @"changeType";
      v29[0] = v23;
      v24 = @"(null change type)";
      if (v13) {
        v24 = v13;
      }
      v29[1] = v24;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      [v21 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:1 userInfo:v18];
      BOOL v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_26:
    goto LABEL_28;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_28:

  return v12;
}

- (void)incrementTransactionCount
{
  p_transactionLocuint64_t k = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  ++self->_transactionLock_txCount;
  os_unfair_lock_unlock(p_transactionLock);
}

- (void)decrementTransactionCount
{
  p_transactionLocuint64_t k = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  int64_t v4 = self->_transactionLock_txCount - 1;
  self->_transactionLock_txCount = v4;
  if (!v4) {
    [(PBFPosterRoleCoordinator *)self _transactionLock_markPosterCollectionDirty];
  }
  os_unfair_lock_unlock(p_transactionLock);
}

- (void)finalizeTransactionCount
{
  p_transactionLocuint64_t k = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  self->_transactionLock_txCount = 0;
  os_unfair_lock_unlock(p_transactionLock);
}

- (BOOL)finalizeChangesWithChangeHandler:(id)a3 outEvents:(id *)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v66 = v8;
  if (![(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
  {
    id v10 = [(PBFPosterRoleCoordinator *)self role];
    uint64_t v62 = self;
    id v11 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v8];
    BOOL v12 = [v11 orderedPosters];
    uint64_t v13 = [v12 count];

    v68 = a4;
    id v69 = a5;
    if (v13)
    {
      int v14 = v62;
      goto LABEL_6;
    }
    char v16 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.8();
    }

    int v14 = v62;
    BOOL v17 = [(PBFPosterRoleCoordinator *)v62 modelCoordinatorProvider];
    id v18 = +[PBFInitialPosterHelper initialPosterConfigurationsWithModelCoordinatorProvider:v17 role:v10];

    if (!v18)
    {
      __int16 v38 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:]();
      }
      goto LABEL_71;
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v18 = v18;
    uint64_t v67 = [v18 countByEnumeratingWithState:&v80 objects:v88 count:16];
    if (v67)
    {
      uint64_t v61 = v11;
      BOOL v71 = 0;
      int v19 = 0;
      uint64_t v64 = *(void *)v81;
      unint64_t v20 = 0x1E697F000uLL;
      v65 = v10;
      do
      {
        for (uint64_t i = 0; i != v67; ++i)
        {
          int v70 = v19;
          if (*(void *)v81 != v64) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend(*(id *)(v20 + 3160), "addPosterToRole:incomingPoster:", v10, v22, v61);
          BOOL v24 = [(PBFPosterRoleCoordinator *)v62 _executeChange:v23 storage:v66 outEvents:v68 error:v69];

          if (v71 || !v24)
          {
            int v19 = v24 | v70;
          }
          else
          {
            long long v25 = *(void **)(v20 + 3160);
            id v26 = [v22 destinationUUID];
            id v27 = [v25 selectPosterForRole:v10 matchingUUID:v26];
            BOOL v71 = [(PBFPosterRoleCoordinator *)v62 _executeChange:v27 storage:v66 outEvents:v68 error:v69];

            int v19 = 1;
          }
          id v10 = v65;
          unint64_t v20 = 0x1E697F000;
        }
        uint64_t v67 = [v18 countByEnumeratingWithState:&v80 objects:v88 count:16];
      }
      while (v67);

      id v8 = v66;
      id v11 = v61;
      if (v19 & v71)
      {

        uint64_t v28 = [(PBFPosterRoleCoordinator *)v62 buildNewPosterCollectionFromStorage:v66];

        id v11 = (void *)v28;
LABEL_6:
        char v15 = [v11 selectedPoster];

        if (v15)
        {
          BOOL v9 = 1;
LABEL_73:

          goto LABEL_74;
        }
        objc_super v29 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.7();
        }

        [(PBFPosterRoleCoordinator *)v14 posterConfigurationsSortedByLastActivatedDate:v11];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [obj reverseObjectEnumerator];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v76 objects:v87 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v77;
LABEL_28:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v77 != v33) {
              objc_enumerationMutation(v30);
            }
            long long v35 = *(void **)(*((void *)&v76 + 1) + 8 * v34);
            int v36 = [v11 configuredPropertiesForPoster:v35];
            v37 = [v36 focusConfiguration];

            if (!v37) {
              break;
            }
            if (v32 == ++v34)
            {
              uint64_t v32 = [v30 countByEnumeratingWithState:&v76 objects:v87 count:16];
              if (v32) {
                goto LABEL_28;
              }
              goto LABEL_34;
            }
          }
          __int16 v38 = objc_msgSend(v35, "pbf_posterUUID");

          if (!v38) {
            goto LABEL_41;
          }
          v39 = PBFLogRoleCoordinator();
          __int16 v40 = v62;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.6();
          }

LABEL_39:
          v41 = +[PBFPosterRoleCoordinatorChange selectPosterForRole:v10 matchingUUID:v38];
          BOOL v42 = [(PBFPosterRoleCoordinator *)v40 _executeChange:v41 storage:v8 outEvents:v68 error:v69];

          if (v42)
          {
            BOOL v9 = 1;
LABEL_65:
            id v18 = obj;
LABEL_72:

            goto LABEL_73;
          }
          goto LABEL_70;
        }
LABEL_34:

LABEL_41:
        int v43 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v86 = v10;
          _os_log_impl(&dword_1D31CE000, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] don't have any non-focus posters for role", buf, 0xCu);
        }

        v44 = [(PBFPosterRoleCoordinator *)v62 modelCoordinatorProvider];
        uint64_t v45 = +[PBFInitialPosterHelper initialPosterConfigurationsWithModelCoordinatorProvider:v44 role:v10];

        if (v45)
        {
          v46 = v11;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v47 = v45;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v72 objects:v84 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            int v50 = 0;
            uint64_t v51 = *(void *)v73;
            do
            {
              for (uint64_t j = 0; j != v49; ++j)
              {
                if (*(void *)v73 != v51) {
                  objc_enumerationMutation(v47);
                }
                v53 = +[PBFPosterRoleCoordinatorChange addPosterToRole:v10 incomingPoster:*(void *)(*((void *)&v72 + 1) + 8 * j)];
                v50 |= [(PBFPosterRoleCoordinator *)v62 _executeChange:v53 storage:v8 outEvents:v68 error:v69];
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v72 objects:v84 count:16];
            }
            while (v49);

            __int16 v40 = v62;
            if (v50)
            {
              uint64_t v54 = [v47 firstObject];
              __int16 v38 = [v54 destinationUUID];

              id v11 = v46;
              if (v38) {
                goto LABEL_39;
              }
LABEL_62:
              v57 = v11;
              uint64_t v58 = PBFLogRoleCoordinator();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
                -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:]();
              }

              __int16 v38 = 0;
              BOOL v9 = 1;
              id v11 = v57;
              goto LABEL_65;
            }
          }
          else
          {
          }
          v59 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.5((uint64_t)v10, v47, v59);
          }

          __int16 v38 = 0;
          id v11 = v46;
LABEL_70:
          id v18 = obj;
LABEL_71:
          BOOL v9 = 0;
          goto LABEL_72;
        }
        uint64_t v55 = v11;
        uint64_t v56 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.4();
        }

        id v11 = v55;
        goto LABEL_62;
      }
    }
    else
    {
    }
    __int16 v38 = PBFLogRoleCoordinator();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:]((uint64_t)v10, v18, v38);
    }
    goto LABEL_71;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_74:

  return v9;
}

+ (id)buildInitialStateSetupEventsForRoleCoordinator:(id)a3 extensionHandlers:(id)a4 extensionStoreCoordinators:(id)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v63 = (id)objc_opt_new();
  id v10 = [v7 role];
  uint64_t v55 = v7;
  id v11 = [(id)objc_opt_class() subscribedEvents];
  uint64_t v56 = v11;
  if ([v11 containsObject:@"PBFPosterDataStoreEventTypeExtensionsUpdated"])
  {
    BOOL v12 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    int v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    char v15 = +[PBFPosterDataStoreEventBuilder extensionsUpdatedFrom:v12 to:v13 supportedRoles:v14];
    char v16 = [v15 buildWithError:0];

    id v11 = v56;
    objc_msgSend(v63, "bs_safeAddObject:", v16);
  }
  id v54 = v8;
  if ([v11 containsObject:@"PBFPosterDataStoreEventTypeStaticDescriptorsUpdated"])
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v9;
    uint64_t v61 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v61)
    {
      uint64_t v59 = *(void *)v85;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v85 != v59) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v84 + 1) + 8 * v17);
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          uint64_t v64 = v18;
          uint64_t v66 = v17;
          int v19 = [v18 staticDescriptorStoreCoordinatorsWithError:0];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v80 objects:v90 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = 0;
            uint64_t v23 = *(void *)v81;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v81 != v23) {
                  objc_enumerationMutation(v19);
                }
                long long v25 = *(void **)(*((void *)&v80 + 1) + 8 * i);
                id v26 = [v25 role];
                int v27 = [v26 isEqual:v10];

                if (v27)
                {
                  if (!v22) {
                    uint64_t v22 = objc_opt_new();
                  }
                  uint64_t v28 = [v25 pathOfLatestVersion];
                  if (v28)
                  {
                    objc_super v29 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:v28];
                    objc_msgSend(v22, "bs_safeAddObject:", v29);
                  }
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v80 objects:v90 count:16];
            }
            while (v21);
          }
          else
          {
            uint64_t v22 = 0;
          }

          if ([v22 count])
          {
            uint64_t v30 = [v64 providerInfoObjectForKey:@"kProactiveStaticPosterDescriptorOrdering"];
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke;
            v78[3] = &unk_1E69816D8;
            id v79 = v30;
            id v31 = v30;
            [v22 sortUsingComparator:v78];
            uint64_t v32 = [v64 extensionIdentifier];
            uint64_t v33 = +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:v32 role:v10 from:MEMORY[0x1E4F1CBF0] to:v22];

            uint64_t v34 = [v33 buildWithError:0];
            objc_msgSend(v63, "bs_safeAddObject:", v34);
          }
          uint64_t v17 = v66 + 1;
        }
        while (v66 + 1 != v61);
        uint64_t v61 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v61);
    }

    id v8 = v54;
    id v11 = v56;
  }
  if ([v11 containsObject:@"PBFPosterDataStoreEventTypeDescriptorsUpdated"])
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obja = v9;
    uint64_t v62 = [obja countByEnumeratingWithState:&v74 objects:v89 count:16];
    if (v62)
    {
      uint64_t v60 = *(void *)v75;
      do
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v75 != v60) {
            objc_enumerationMutation(obja);
          }
          int v36 = *(void **)(*((void *)&v74 + 1) + 8 * v35);
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          v65 = v36;
          uint64_t v67 = v35;
          v37 = [v36 dynamicDescriptorStoreCoordinatorsWithError:0];
          uint64_t v38 = [v37 countByEnumeratingWithState:&v70 objects:v88 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            __int16 v40 = 0;
            uint64_t v41 = *(void *)v71;
            do
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                if (*(void *)v71 != v41) {
                  objc_enumerationMutation(v37);
                }
                int v43 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                v44 = [v43 role];
                int v45 = [v44 isEqual:v10];

                if (v45)
                {
                  if (!v40) {
                    __int16 v40 = objc_opt_new();
                  }
                  v46 = [v43 pathOfLatestVersion];
                  if (v46)
                  {
                    id v47 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:v46];
                    objc_msgSend(v40, "bs_safeAddObject:", v47);
                  }
                }
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v70 objects:v88 count:16];
            }
            while (v39);
          }
          else
          {
            __int16 v40 = 0;
          }

          if ([v40 count])
          {
            uint64_t v48 = [v65 providerInfoObjectForKey:@"kProactiveDynamicPosterDescriptorOrdering"];
            v68[0] = MEMORY[0x1E4F143A8];
            v68[1] = 3221225472;
            v68[2] = __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke_2;
            v68[3] = &unk_1E69816D8;
            id v69 = v48;
            id v49 = v48;
            [v40 sortUsingComparator:v68];
            int v50 = [v65 extensionIdentifier];
            uint64_t v51 = +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:v50 role:v10 from:MEMORY[0x1E4F1CBF0] to:v40];

            id v52 = [v51 buildWithError:0];
            objc_msgSend(v63, "bs_safeAddObject:", v52);
          }
          uint64_t v35 = v67 + 1;
        }
        while (v67 + 1 != v62);
        uint64_t v62 = [obja countByEnumeratingWithState:&v74 objects:v89 count:16];
      }
      while (v62);
    }

    id v8 = v54;
    id v11 = v56;
  }

  return v63;
}

uint64_t __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = objc_msgSend(a2, "pbf_posterUUID");
  id v8 = [v7 UUIDString];
  unint64_t v9 = [v5 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  id v11 = objc_msgSend(v6, "pbf_posterUUID");

  BOOL v12 = [v11 UUIDString];
  unint64_t v13 = [v10 indexOfObject:v12];

  uint64_t v14 = -1;
  if (v9 >= v13) {
    uint64_t v14 = 1;
  }
  if (v9 == v13) {
    return 0;
  }
  else {
    return v14;
  }
}

uint64_t __120__PBFPosterRoleCoordinator_buildInitialStateSetupEventsForRoleCoordinator_extensionHandlers_extensionStoreCoordinators___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = objc_msgSend(a2, "pbf_posterUUID");
  id v8 = [v7 UUIDString];
  unint64_t v9 = [v5 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  id v11 = objc_msgSend(v6, "pbf_posterUUID");

  BOOL v12 = [v11 UUIDString];
  unint64_t v13 = [v10 indexOfObject:v12];

  uint64_t v14 = -1;
  if (v9 >= v13) {
    uint64_t v14 = 1;
  }
  if (v9 == v13) {
    return 0;
  }
  else {
    return v14;
  }
}

- (id)sortedPosterUUIDsFromStorage:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterRoleCoordinator *)self role];
  id v6 = [v4 sortedPosterUUIDsForRole:v5 error:0];

  return v6;
}

- (id)buildNewPosterCollectionFromStorage:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v45 = [(PBFPosterRoleCoordinator *)self role];
  uint64_t v5 = objc_msgSend(v4, "selectedPosterUUIDForRole:error:");
  id v6 = [(PBFPosterRoleCoordinator *)self sortedPosterUUIDsFromStorage:v4];
  id v7 = [(PBFPosterRoleCoordinator *)self knownExtensionIdentifiers];
  __int16 v40 = [(id)objc_opt_class() supportedAttributes];
  int v36 = (void *)v5;
  if (v5)
  {
    id v8 = [v4 extensionIdentifierForPosterUUID:v5 error:0];
    uint64_t v35 = [(PBFPosterRoleCoordinator *)self posterWithUUID:v5 extensionIdentifier:v8];
  }
  else
  {
    uint64_t v35 = 0;
  }
  unint64_t v9 = (void *)MEMORY[0x1E4F1CAA0];
  id v10 = [v6 array];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke;
  v59[3] = &unk_1E6982928;
  id v11 = v4;
  id v60 = v11;
  id v34 = v7;
  id v61 = v34;
  uint64_t v62 = self;
  v44 = self;
  BOOL v12 = objc_msgSend(v10, "bs_mapNoNulls:", v59);
  uint64_t v33 = [v9 orderedSetWithArray:v12];

  uint64_t v39 = objc_opt_new();
  int v43 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v6;
  unint64_t v13 = v45;
  v46 = v11;
  uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v56;
    uint64_t v47 = *MEMORY[0x1E4F92758];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v56 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v14;
        uint64_t v15 = *(void *)(*((void *)&v55 + 1) + 8 * v14);
        uint64_t v48 = objc_opt_new();
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v16 = v40;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v67 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v52 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              uint64_t v22 = [v11 attributeForPoster:v15 roleId:v13 attributeId:v21 error:0];
              if (v22)
              {
                PRPosterRoleAttributeForData();
                id v23 = (id)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  [v48 setObject:v23 forKeyedSubscript:v21];
                  if ([v21 isEqualToString:v47])
                  {
                    id v23 = v23;
                    BOOL v24 = [v23 childPosterUUID];
                    long long v25 = [v23 providerIdentifier];

                    id v26 = [(PBFPosterRoleCoordinator *)v44 posterWithUUID:v24 extensionIdentifier:v25];

                    if (v26) {
                      [v43 setObject:v26 forKey:v15];
                    }

                    unint64_t v13 = v45;
                    id v11 = v46;
                  }
                }
              }
              else
              {
                id v23 = 0;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v67 count:16];
          }
          while (v18);
        }

        int v27 = (void *)[v48 copy];
        [v39 setObject:v27 forKeyedSubscript:v15];

        id v11 = v46;
        uint64_t v14 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v41);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke_2;
  aBlock[3] = &unk_1E6982950;
  id v50 = v39;
  id v28 = v39;
  objc_super v29 = _Block_copy(aBlock);
  uint64_t v30 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v64 = v33;
    __int16 v65 = 2112;
    uint64_t v66 = v35;
    _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "buildNewPosterCollectionFromStorage with orderedPosters: %@ and selectedPoster: %@", buf, 0x16u);
  }

  id v31 = (void *)[objc_alloc(MEMORY[0x1E4F92610]) initWithSelectedPoster:v35 posters:v33 associatedPosterMap:v43 attributeProvider:v29];
  return v31;
}

id __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] extensionIdentifierForPosterUUID:v3 error:0];
  uint64_t v5 = 0;
  if ([a1[5] containsObject:v4])
  {
    uint64_t v5 = [a1[6] posterWithUUID:v3 extensionIdentifier:v4];
  }

  return v5;
}

id __64__PBFPosterRoleCoordinator_buildNewPosterCollectionFromStorage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "pbf_posterUUID");
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  return v4;
}

- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6
{
  v310[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    unint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    v309 = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
    v310[0] = @"(null change)";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v310 forKeys:&v309 count:1];
    *a6 = [v13 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:1 userInfo:v14];

    BOOL v12 = 0;
    goto LABEL_98;
  }
  if (![(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
  {
    uint64_t v15 = objc_opt_new();
    v257 = objc_opt_new();
    id v16 = [(PBFPosterRoleCoordinator *)self buildNewPosterCollectionFromStorage:v11];
    uint64_t v17 = [(PBFPosterRoleCoordinator *)self role];
    uint64_t v18 = [v10 changeType];
    v258 = v17;
    v251 = v18;
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator"])
    {
      uint64_t v19 = [v10 role];
      int v20 = [v19 isEqual:v17];

      if (v20)
      {
        uint64_t v21 = a6;
        uint64_t v22 = v15;
        id v23 = v16;
        BOOL v24 = [v11 roleIdentifiersWithError:0];
        if ((![v24 containsObject:v17]
           || [v11 removeRole:v17 error:v21])
          && [v11 addRole:v17 displayName:v17 error:v21])
        {
          [(PBFPosterRoleCoordinator *)self noteDidResetRoleCoordinator:v11];
          long long v25 = [(PBFPosterRoleCoordinator *)self delegate];
          if (objc_opt_respondsToSelector())
          {
            id v272 = 0;
            [v25 roleCoordinatorWasReset:self processInitialStateSetupEvents:&v272];
            id v26 = v272;
          }
          else
          {
            id v26 = 0;
          }
          uint64_t v56 = [v26 count];
          if (a5 && v56) {
            *a5 = (id)[v26 copy];
          }

          id v16 = v23;
          uint64_t v17 = v258;
          uint64_t v15 = v22;
          goto LABEL_45;
        }

        BOOL v12 = 0;
        id v16 = v23;
        uint64_t v15 = v22;
LABEL_97:

        goto LABEL_98;
      }
LABEL_19:
      BOOL v12 = 0;
      goto LABEL_97;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator"])
    {
LABEL_45:
      if (![v15 count] && !objc_msgSend(v257, "count"))
      {
        BOOL v12 = 1;
        goto LABEL_97;
      }
      v245 = v15;
      v250 = v16;
      id v241 = v10;
      long long v265 = 0u;
      long long v266 = 0u;
      long long v263 = 0u;
      long long v264 = 0u;
      id v57 = v15;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v263 objects:v274 count:16];
      unint64_t v59 = 0x1E4F92000uLL;
      if (v58)
      {
        uint64_t v60 = v58;
        uint64_t v61 = *(void *)v264;
        uint64_t v62 = *MEMORY[0x1E4F92780];
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v264 != v61) {
              objc_enumerationMutation(v57);
            }
            uint64_t v64 = *(void *)(*((void *)&v263 + 1) + 8 * i);
            __int16 v65 = *(void **)(v59 + 1776);
            uint64_t v66 = [v11 attributeForPoster:v64 roleId:v17 attributeId:v62 error:0];
            uint64_t v67 = [v65 decodeObjectWithJSON:v66];
            v68 = v67;
            if (v67) {
              id v69 = v67;
            }
            else {
              id v69 = (id)objc_opt_new();
            }
            long long v70 = v69;

            long long v71 = [v70 usageMetadataWithUpdatedLastModifiedDate];
            if ([v257 containsObject:v64])
            {
              uint64_t v72 = [v70 usageMetadataWithUpdatedLastSelectedDate];

              long long v71 = (void *)v72;
            }
            long long v73 = [v71 encodeJSON];
            [v11 mutateAttributeForPoster:v64 roleId:v258 attributeId:v62 attributePayload:v73 error:0];

            uint64_t v17 = v258;
            unint64_t v59 = 0x1E4F92000;
          }
          uint64_t v60 = [v57 countByEnumeratingWithState:&v263 objects:v274 count:16];
        }
        while (v60);
      }
      long long v74 = v11;

      long long v261 = 0u;
      long long v262 = 0u;
      long long v259 = 0u;
      long long v260 = 0u;
      id obja = v257;
      uint64_t v75 = [obja countByEnumeratingWithState:&v259 objects:v273 count:16];
      if (v75)
      {
        uint64_t v76 = v75;
        uint64_t v77 = *(void *)v260;
        uint64_t v78 = *MEMORY[0x1E4F92780];
        do
        {
          for (uint64_t j = 0; j != v76; ++j)
          {
            if (*(void *)v260 != v77) {
              objc_enumerationMutation(obja);
            }
            uint64_t v80 = *(void *)(*((void *)&v259 + 1) + 8 * j);
            if (([v57 containsObject:v80] & 1) == 0)
            {
              long long v81 = (void *)MEMORY[0x1E4F926F0];
              long long v82 = [v74 attributeForPoster:v80 roleId:v17 attributeId:v78 error:0];
              long long v83 = [v81 decodeObjectWithJSON:v82];
              long long v84 = v83;
              if (v83) {
                id v85 = v83;
              }
              else {
                id v85 = (id)objc_opt_new();
              }
              long long v86 = v85;

              long long v87 = [v86 usageMetadataWithUpdatedLastSelectedDate];
              uint64_t v88 = [v87 encodeJSON];
              [v74 mutateAttributeForPoster:v80 roleId:v258 attributeId:v78 attributePayload:v88 error:0];

              uint64_t v17 = v258;
            }
          }
          uint64_t v76 = [obja countByEnumeratingWithState:&v259 objects:v273 count:16];
        }
        while (v76);
      }

      BOOL v12 = 1;
      id v10 = v241;
      id v11 = v74;
      goto LABEL_72;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeAddPoster"])
    {
      int v27 = v16;
      id v28 = [v10 userInfo];
      objc_super v29 = [v28 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration"];

      if (v29)
      {
        if (([v29 incomingPosterType] == 4 || objc_msgSend(v29, "incomingPosterType") == 1)
          && ([v251 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeAddPoster"] & 1) != 0)
        {
          BOOL v30 = [(PBFPosterRoleCoordinator *)self _ingestIncomingPosterConfiguration:v29 change:v10 currentCollection:v27 storage:v11 outEvents:a5 error:a6];

          id v16 = v27;
          uint64_t v17 = v258;
          if (!v30) {
            goto LABEL_19;
          }
          goto LABEL_45;
        }
        id v49 = (void *)MEMORY[0x1E4F28C58];
        v305[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v50 = [v10 description];
        long long v51 = (void *)v50;
        long long v52 = @"(null change)";
        if (v50) {
          long long v52 = (__CFString *)v50;
        }
        v305[1] = *MEMORY[0x1E4F28588];
        v306[0] = v52;
        v306[1] = @"PBFPosterRoleCoordinatorChangeTypeAddPoster only supports PRIncomingPosterTypeNew";
        long long v53 = (void *)MEMORY[0x1E4F1C9E8];
        long long v54 = (__CFString **)v306;
        long long v55 = (__CFString **)v305;
        goto LABEL_89;
      }
      id v49 = (void *)MEMORY[0x1E4F28C58];
      v307 = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
      uint64_t v89 = [v10 description];
      long long v51 = (void *)v89;
      v90 = @"(null change)";
      if (v89) {
        v90 = (__CFString *)v89;
      }
      v308 = v90;
      long long v53 = (void *)MEMORY[0x1E4F1C9E8];
      long long v54 = &v308;
      long long v55 = &v307;
LABEL_93:
      uint64_t v107 = 1;
      goto LABEL_94;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeUpdatePoster"])
    {
      int v27 = v16;
      id v31 = [v10 userInfo];
      objc_super v29 = [v31 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration"];

      if (!v29)
      {
        id v49 = (void *)MEMORY[0x1E4F28C58];
        v303 = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v108 = [v10 description];
        long long v51 = (void *)v108;
        v109 = @"(null change)";
        if (v108) {
          v109 = (__CFString *)v108;
        }
        v304 = v109;
        long long v53 = (void *)MEMORY[0x1E4F1C9E8];
        long long v54 = &v304;
        long long v55 = &v303;
        goto LABEL_93;
      }
      if ([v29 incomingPosterType] != 5 && objc_msgSend(v29, "incomingPosterType") != 2
        || ([v251 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeUpdatePoster"] & 1) == 0)
      {
        id v49 = (void *)MEMORY[0x1E4F28C58];
        v301[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v105 = [v10 description];
        long long v51 = (void *)v105;
        v106 = @"(null change)";
        if (v105) {
          v106 = (__CFString *)v105;
        }
        v301[1] = *MEMORY[0x1E4F28588];
        v302[0] = v106;
        v302[1] = @"PBFPosterRoleCoordinatorChangeTypeUpdatePoster only supports PRIncomingPosterTypeUpdate";
        long long v53 = (void *)MEMORY[0x1E4F1C9E8];
        long long v54 = (__CFString **)v302;
        long long v55 = (__CFString **)v301;
LABEL_89:
        uint64_t v107 = 2;
LABEL_94:
        v110 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:v107];
        *a6 = [v49 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v110];

        goto LABEL_95;
      }
      if (![(PBFPosterRoleCoordinator *)self _ingestIncomingPosterConfiguration:v29 change:v10 currentCollection:v27 storage:v11 outEvents:a5 error:a6])
      {
LABEL_95:

        BOOL v12 = 0;
        id v16 = v27;
        goto LABEL_96;
      }
      uint64_t v32 = [v29 destinationUUID];
      [v15 addObject:v32];

LABEL_28:
      id v16 = v27;
      uint64_t v17 = v258;
      goto LABEL_45;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeDuplicatePoster"])
    {
      v244 = v15;
      uint64_t v33 = [v10 userInfo];
      id v34 = [v33 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];

      uint64_t v35 = [v10 userInfo];
      int v36 = [v35 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID"];

      v249 = v16;
      if (!v34 || !v36)
      {
        v112 = (void *)MEMORY[0x1E4F28C58];
        v299[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v113 = [v10 description];
        v114 = v36;
        v115 = (void *)v113;
        id v116 = @"(null change)";
        if (v113) {
          id v116 = (__CFString *)v113;
        }
        v300[0] = v116;
        v299[1] = @"posterUUIDToDuplicateOutUUID";
        objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v114);
        v118 = id v117 = v34;
        v300[1] = v118;
        v299[2] = @"posterUUIDToDuplicate";
        v119 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v117);
        v300[2] = v119;
        id v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v300 forKeys:v299 count:3];
        *a6 = [v112 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v120];

        uint64_t v17 = v258;
        id v16 = v249;

        BOOL v12 = 0;
        uint64_t v15 = v244;
        goto LABEL_97;
      }
      uint64_t v37 = [v16 posterWithUUID:v34];
      id obj = (id)v37;
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = [v16 posterWithUUID:v36];
        if (v39)
        {
          v240 = (void *)MEMORY[0x1E4F28C58];
          v295[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
          __int16 v40 = (void *)v39;
          uint64_t v41 = [v10 description];
          uint64_t v42 = (void *)v41;
          int v43 = @"(null change)";
          if (v41) {
            int v43 = (__CFString *)v41;
          }
          v296[0] = v43;
          v295[1] = @"posterUUID";
          v44 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v36);
          v296[1] = v44;
          v295[2] = @"duplicateOutPoster";
          [v40 description];
          v46 = int v45 = v36;
          v296[2] = v46;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v296 forKeys:v295 count:3];
          v48 = uint64_t v47 = v34;
          *a6 = [v240 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v48];

          id v34 = v47;
          int v36 = v45;
        }
        else
        {
          if (![v36 isEqual:v34])
          {
            v180 = (void *)[objc_alloc(MEMORY[0x1E4F925C0]) initWithConfigurationToDuplicate:v38 destinationPosterUUID:v36];
            BOOL v181 = [(PBFPosterRoleCoordinator *)self _ingestIncomingPosterConfiguration:v180 change:v10 currentCollection:v16 storage:v11 outEvents:a5 error:a6];
            v182 = v36;
            BOOL v183 = v181;

            uint64_t v15 = v244;
            if (!v183) {
              goto LABEL_19;
            }
            goto LABEL_45;
          }
          v239 = (void *)MEMORY[0x1E4F28C58];
          v293[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
          uint64_t v162 = [v10 description];
          uint64_t v42 = (void *)v162;
          long long v163 = @"(null change)";
          if (v162) {
            long long v163 = (__CFString *)v162;
          }
          v294[0] = v163;
          v293[1] = @"posterUUID";
          v44 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v36);
          v294[1] = v44;
          v293[2] = @"posterUUIDToDuplicateOutUUID";
          long long v164 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v36);
          v294[2] = v164;
          v293[3] = @"posterUUIDToDuplicate";
          long long v165 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v34);
          v294[3] = v165;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v294 forKeys:v293 count:4];
          long long v166 = v36;
          v168 = long long v167 = v34;
          *a6 = [v239 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v168];

          id v34 = v167;
          int v36 = v166;

          __int16 v40 = 0;
        }
      }
      else
      {
        v139 = (void *)MEMORY[0x1E4F28C58];
        v297[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v140 = [v10 description];
        __int16 v40 = (void *)v140;
        v141 = @"(null change)";
        if (v140) {
          v141 = (__CFString *)v140;
        }
        v298[0] = v141;
        v297[1] = @"posterUUID";
        uint64_t v42 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v34);
        v298[1] = v42;
        v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v298 forKeys:v297 count:2];
        *a6 = [v139 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:2 userInfo:v44];
      }

      BOOL v12 = 0;
      uint64_t v15 = v244;
      id v16 = v249;
LABEL_96:
      uint64_t v17 = v258;
      goto LABEL_97;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeRemovePoster"])
    {
      v91 = [v10 userInfo];
      uint64_t v92 = [v91 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];

      v93 = [v16 posterWithUUID:v92];
      uint64_t v94 = [v16 associatedPosterForUUID:v92];
      id objb = (id)objc_opt_new();
      v238 = v93;
      v242 = (void *)v94;
      v250 = v16;
      if (!v94)
      {
        v134 = [v16 associatedPosterForPoster:v93];
        if ([v11 unassignPosterUUID:v92 fromRole:v17 error:a6] && v93)
        {
          v135 = +[PBFPosterDataStoreEventBuilder posterDeleted:v93];
          v136 = [v135 buildWithError:a6];
          if (v136) {
            [objb addObject:v136];
          }

          v93 = v238;
        }
        if (v134)
        {
          v137 = +[PBFPosterDataStoreEventBuilder posterDeleted:v134];
          v138 = [v137 buildWithError:a6];
          if (v138) {
            [objb addObject:v138];
          }

          v93 = v238;
        }

        uint64_t v104 = objb;
        goto LABEL_121;
      }
      v237 = v92;
      id v271 = 0;
      [v16 isPosterConfigurationAnAssociatedPoster:v93 parentPoster:&v271];
      id v95 = v271;
      uint64_t v96 = objc_msgSend(v95, "pbf_posterUUID");
      uint64_t v97 = *MEMORY[0x1E4F92758];
      id v270 = 0;
      char v98 = [v11 mutateAttributeForPoster:v96 roleId:v17 attributeId:v97 attributePayload:0 error:&v270];
      id v99 = v270;

      if (v98)
      {
        v246 = v15;
        v100 = +[PBFPosterDataStoreEventBuilder posterDeleted:v242];
        v101 = [v100 buildWithError:a6];
        if (v101) {
          [objb addObject:v101];
        }
        uint64_t v102 = +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:v95 to:v95];

        uint64_t v103 = [v102 buildWithError:a6];

        uint64_t v104 = objb;
        if (v103) {
          [objb addObject:v103];
        }

        uint64_t v92 = v237;
        uint64_t v15 = v246;
        uint64_t v17 = v258;
        v93 = v238;
LABEL_121:
        id v16 = v250;
        if ([v104 count]) {
          *a5 = (id)[v104 copy];
        }

        goto LABEL_45;
      }
      if (!v99)
      {
        v142 = (void *)MEMORY[0x1E4F28C58];
        v291[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v143 = [v10 description];
        long long v144 = (void *)v143;
        long long v145 = @"(null change)";
        if (v143) {
          long long v145 = (__CFString *)v143;
        }
        long long v146 = @"(null uuid)";
        if (v237) {
          long long v146 = v237;
        }
        v292[0] = v145;
        v292[1] = v146;
        uint64_t v147 = *MEMORY[0x1E4F28588];
        v291[1] = @"posterUUIDToRemove";
        v291[2] = v147;
        v292[2] = @"Failed to remove assoc poster attribute";
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v292 forKeys:v291 count:3];
        v149 = long long v148 = v15;
        id v99 = [v142 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v149];

        uint64_t v15 = v148;
        uint64_t v17 = v258;
      }
      id v150 = v99;
      *a6 = v150;

LABEL_176:
      BOOL v12 = 0;
      goto LABEL_73;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeReorderPosters"])
    {
      v121 = [v10 userInfo];
      v122 = [v121 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyOrderedUUIDs"];

      if (v122)
      {
        if ([v11 mutateSortOrder:v122 roleId:v17 error:a6])
        {
          v243 = v122;
          v247 = v15;
          v250 = v16;
          id objc = [v16 orderedPosters];
          v123 = (void *)MEMORY[0x1E4F1CAA0];
          id v269 = 0;
          v124 = [v11 sortedPosterUUIDsForRole:v17 error:&v269];
          id v125 = v269;
          v126 = [v124 array];
          v267[0] = MEMORY[0x1E4F143A8];
          v267[1] = 3221225472;
          v267[2] = __67__PBFPosterRoleCoordinator__executeChange_storage_outEvents_error___block_invoke;
          v267[3] = &unk_1E6982978;
          v267[4] = self;
          id v268 = v11;
          v127 = objc_msgSend(v126, "bs_mapNoNulls:", v267);
          v128 = [v123 orderedSetWithArray:v127];

          if (v125)
          {
            *a6 = v125;
          }
          else
          {
            v203 = +[PBFPosterDataStoreEventBuilder postersReorderedFrom:objc to:v128];
            uint64_t v204 = [v203 buildWithError:a6];
            v205 = (void *)v204;
            if (v204)
            {
              uint64_t v288 = v204;
              *a5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v288 count:1];
            }
          }
          uint64_t v15 = v247;
          uint64_t v17 = v258;

          id v152 = v243;
          if (v125) {
            goto LABEL_175;
          }
          goto LABEL_177;
        }
LABEL_208:

        goto LABEL_19;
      }
      v250 = v16;
      long long v169 = (void *)MEMORY[0x1E4F28C58];
      v289[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
      uint64_t v170 = [v10 description];
      id v152 = 0;
      long long v171 = (void *)v170;
      v172 = @"(null change)";
      if (v170) {
        v172 = (__CFString *)v170;
      }
      v289[1] = @"sortedPosterUUIDs";
      v290[0] = v172;
      v290[1] = @"(null sorted poster uuids)";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v290 forKeys:v289 count:2];
      v174 = v173 = v15;
      v175 = v169;
      uint64_t v176 = 3;
      goto LABEL_149;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeSelectPoster"])
    {
      id v129 = [v10 userInfo];
      id v130 = [v129 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];

      id v131 = [v16 posterWithUUID:v130];
      id objd = v130;
      if (v131)
      {
        id v132 = [v16 selectedPoster];
        char v133 = [v132 isEqual:v131];

        if (v133)
        {
          BOOL v12 = 1;
LABEL_170:

          goto LABEL_97;
        }
        v195 = (void *)MEMORY[0x1E4F926B0];
        v196 = [v131 _path];
        v197 = [v195 loadFocusConfigurationForPath:v196 error:0];

        if (!v197)
        {
          v122 = objd;
          if ([v11 markPosterUUIDAsSelected:objd roleId:v17 error:a6])
          {
            v248 = v15;
            v224 = [v16 posterWithUUID:objd];
            int v27 = v16;
            v225 = [v16 selectedPoster];
            v226 = +[PBFPosterDataStoreEventBuilder posterSelected:v224 previous:v225];

            uint64_t v227 = [v226 buildWithError:a6];
            v228 = (void *)v227;
            if (v227)
            {
              uint64_t v283 = v227;
              *a5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v283 count:1];
            }
            objc_msgSend(v257, "bs_safeAddObject:", objd);

            uint64_t v15 = v248;
            goto LABEL_28;
          }

          goto LABEL_208;
        }
        uint64_t v184 = v16;
        v198 = (void *)MEMORY[0x1E4F28C58];
        v284[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v199 = [v10 description];
        v187 = (void *)v199;
        v200 = @"(null change)";
        if (v199) {
          v200 = (__CFString *)v199;
        }
        v285[0] = v200;
        v284[1] = @"posterUUID";
        uint64_t v201 = [objd UUIDString];
        v190 = (void *)v201;
        v202 = @"(null posterUUIDToSelect)";
        if (v201) {
          v202 = (__CFString *)v201;
        }
        v284[2] = *MEMORY[0x1E4F28588];
        v285[1] = v202;
        v285[2] = @"Unable to select a poster which has a focus mode associated with it (rdar://problem/110546596)";
        v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v285 forKeys:v284 count:3];
        v193 = v198;
        uint64_t v194 = 4;
      }
      else
      {
        uint64_t v184 = v16;
        v185 = (void *)MEMORY[0x1E4F28C58];
        v286[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v186 = [v10 description];
        v187 = (void *)v186;
        v188 = @"(null change)";
        if (v186) {
          v188 = (__CFString *)v186;
        }
        v287[0] = v188;
        v286[1] = @"posterUUID";
        uint64_t v189 = [v130 UUIDString];
        v190 = (void *)v189;
        v191 = @"(null poster to select)";
        if (v189) {
          v191 = (__CFString *)v189;
        }
        v287[1] = v191;
        v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v287 forKeys:v286 count:2];
        v193 = v185;
        uint64_t v194 = 2;
      }
      *a6 = [v193 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:v194 userInfo:v192];

      BOOL v12 = 0;
      id v16 = v184;
      uint64_t v17 = v258;
      goto LABEL_170;
    }
    if ([v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeAssignAttribute"])
    {
      v151 = [v10 userInfo];
      id v152 = [v151 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];

      v250 = v16;
      uint64_t v153 = [v16 posterWithUUID:v152];
      if (!v153)
      {
        v206 = (void *)MEMORY[0x1E4F28C58];
        v281[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v207 = [v10 description];
        long long v171 = (void *)v207;
        v208 = @"(null change)";
        if (v207) {
          v208 = (__CFString *)v207;
        }
        v282[0] = v208;
        v281[1] = @"posterUUID";
        uint64_t v209 = [v152 UUIDString];
        v210 = v15;
        v211 = (void *)v209;
        v212 = @"(null posterUUID)";
        if (v209) {
          v212 = (__CFString *)v209;
        }
        v282[1] = v212;
        v213 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v282 forKeys:v281 count:2];
        *a6 = [v206 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:2 userInfo:v213];

        uint64_t v15 = v210;
        uint64_t v17 = v258;
        goto LABEL_150;
      }
      id v154 = (void *)v153;
      v245 = v15;
      id v155 = [v10 userInfo];
      long long v156 = [v155 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute"];

      if (v156)
      {
        long long v157 = [v156 attributeType];
        long long v158 = [v156 encodeJSON];
        int v159 = [v11 mutateAttributeForPoster:v152 roleId:v17 attributeId:v157 attributePayload:v158 error:a6];

        if (v159)
        {
          long long v160 = [v156 attributeType];
          char v161 = [v160 isEqualToString:*MEMORY[0x1E4F92780]];

          if ((v161 & 1) == 0) {
            objc_msgSend(v245, "bs_safeAddObject:", v152);
          }

          uint64_t v15 = v245;
          goto LABEL_178;
        }
        goto LABEL_206;
      }
      v214 = (void *)MEMORY[0x1E4F28C58];
      v279[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
      uint64_t v215 = [v10 description];
      v216 = (void *)v215;
      if (v215) {
        v217 = (__CFString *)v215;
      }
      else {
        v217 = @"(null change)";
      }
      v280[0] = v217;
      v279[1] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
      uint64_t v218 = [v10 description];
      v219 = (void *)v218;
      if (v218) {
        v220 = (__CFString *)v218;
      }
      else {
        v220 = @"(null change)";
      }
      v280[1] = v220;
      v221 = (void *)MEMORY[0x1E4F1C9E8];
      v222 = v280;
      v223 = v279;
    }
    else
    {
      if (![v18 isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeRemoveAttribute"])goto LABEL_19; {
      v177 = [v10 userInfo];
      }
      id v152 = [v177 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];

      v250 = v16;
      uint64_t v178 = [v16 posterWithUUID:v152];
      if (!v178)
      {
        v229 = (void *)MEMORY[0x1E4F28C58];
        v277 = @"posterUUID";
        uint64_t v230 = [v152 UUIDString];
        long long v171 = (void *)v230;
        v231 = @"(posterUUID)";
        if (v230) {
          v231 = (__CFString *)v230;
        }
        v278 = v231;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v278 forKeys:&v277 count:1];
        v174 = v173 = v15;
        v175 = v229;
        uint64_t v176 = 2;
LABEL_149:
        *a6 = [v175 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:v176 userInfo:v174];

        uint64_t v15 = v173;
LABEL_150:

LABEL_175:
        goto LABEL_176;
      }
      id v154 = (void *)v178;
      v245 = v15;
      v179 = [v10 userInfo];
      long long v156 = [v179 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType"];

      if (v156)
      {
        if ([v11 mutateAttributeForPoster:v152 roleId:v17 attributeId:v156 attributePayload:0 error:a6])
        {
          objc_msgSend(v15, "bs_safeAddObject:", v152);

LABEL_177:
LABEL_178:
          id v16 = v250;
          goto LABEL_45;
        }
LABEL_206:

        BOOL v12 = 0;
LABEL_72:
        uint64_t v15 = v245;
LABEL_73:
        id v16 = v250;
        goto LABEL_97;
      }
      v214 = (void *)MEMORY[0x1E4F28C58];
      v275[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
      uint64_t v232 = [v10 description];
      v216 = (void *)v232;
      if (v232) {
        v233 = (__CFString *)v232;
      }
      else {
        v233 = @"(null change)";
      }
      v276[0] = v233;
      v275[1] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
      uint64_t v234 = [v10 description];
      v219 = (void *)v234;
      if (v234) {
        v235 = (__CFString *)v234;
      }
      else {
        v235 = @"(null change)";
      }
      v276[1] = v235;
      v221 = (void *)MEMORY[0x1E4F1C9E8];
      v222 = v276;
      v223 = v275;
    }
    v236 = [v221 dictionaryWithObjects:v222 forKeys:v223 count:2];
    *a6 = [v214 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v236];

    uint64_t v17 = v258;
    goto LABEL_206;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  BOOL v12 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_98:

  return v12;
}

id __67__PBFPosterRoleCoordinator__executeChange_storage_outEvents_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 extensionIdentifierForPosterUUID:v4 error:0];
  id v6 = [v2 posterWithUUID:v4 extensionIdentifier:v5];

  return v6;
}

- (BOOL)_ingestIncomingPosterConfiguration:(id)a3 change:(id)a4 currentCollection:(id)a5 storage:(id)a6 outEvents:(id *)a7 error:(id *)a8
{
  v348[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (![(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
  {
    v275 = v15;
    id v269 = objc_opt_new();
    uint64_t v19 = [(PBFPosterRoleCoordinator *)self role];
    v278 = [v14 path];
    int v20 = [v278 role];
    char v21 = BSEqualObjects();

    if ((v21 & 1) == 0)
    {
      uint64_t v207 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"BSEqualObjects(role, [path role])"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:]();
      }
      [v207 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D323660CLL);
    }
    v273 = a8;
    v256 = a7;
    long long v266 = [v14 parentPosterUUID];
    id v270 = objc_msgSend(v16, "posterWithUUID:");
    uint64_t v22 = [v270 _path];
    id v268 = [v22 serverIdentity];

    id v23 = [v14 sourceIdentity];
    uint64_t v274 = [v23 provider];
    v276 = v14;
    id v272 = [v14 destinationUUID];
    BOOL v24 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
    long long v25 = [v23 provider];
    id v26 = objc_msgSend(v24, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v25, 0);

    int v27 = [v23 posterUUID];
    long long v264 = v26;
    id v28 = [v26 modelStoreCoordinatorForPosterUUID:v27];
    uint64_t v29 = [v28 pathForIdentity:v23];

    long long v265 = (void *)v29;
    BOOL v30 = v23;
    if (v29) {
      id v31 = (void *)v29;
    }
    else {
      id v31 = v278;
    }
    v267 = [MEMORY[0x1E4F926B0] loadConfigurableOptionsForPath:v31 error:0];
    uint64_t v32 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
    uint64_t v33 = (void *)v274;
    uint64_t v34 = objc_msgSend(v32, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v274, v273);

    id v271 = (void *)v34;
    if (!v34)
    {
      BOOL v18 = 0;
      int v45 = v270;
      int v43 = v264;
      v44 = v30;
      id v14 = v276;
LABEL_210:

      id v15 = v275;
      goto LABEL_211;
    }
    long long v263 = v19;
    uint64_t v35 = [v276 incomingPosterType];
    uint64_t v36 = v35;
    if ((unint64_t)(v35 - 3) < 2) {
      goto LABEL_11;
    }
    if (v35 == 2)
    {
      id v257 = v17;
      [v16 posterWithUUID:v272];
      uint64_t v47 = v46 = v16;
      if (v47)
      {
        uint64_t v48 = [(id)objc_opt_class() supportedAttributes];
        id v49 = v46;
        uint64_t v50 = [v46 attributesForPoster:v47 ofTypes:v48];

        long long v51 = v30;
        uint64_t v33 = (void *)v274;
        if (![v50 count])
        {
          uint64_t v54 = [(PBFPosterRoleCoordinator *)self defaultAttributesForNewPosterFromProvider:v274];

          uint64_t v50 = (void *)v54;
        }
      }
      else
      {
        id v49 = v46;
        long long v53 = PBFLogRoleCoordinator();
        long long v51 = v30;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        {
          v141 = [v49 orderedPosterUUIDs];
          *(_DWORD *)buf = 138543874;
          v342 = v272;
          __int16 v343 = 2114;
          v344 = v141;
          __int16 v345 = 2114;
          v346 = v263;
          _os_log_fault_impl(&dword_1D31CE000, v53, OS_LOG_TYPE_FAULT, "Invalid existing poster for UUID: %{public}@ -- poster collection UUIDs %{public}@ -- role %{public}@", buf, 0x20u);
        }
        uint64_t v33 = (void *)v274;
        uint64_t v50 = [(PBFPosterRoleCoordinator *)self defaultAttributesForNewPosterFromProvider:v274];
      }
      id v14 = v276;
      long long v262 = v50;

      id v16 = v49;
      id v17 = v257;
      long long v52 = v51;
LABEL_27:
      uint64_t v55 = [v14 configuredProperties];
      long long v261 = [v14 attributes];
      objc_opt_class();
      v255 = v52;
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v56 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
          id v57 = [v56 providerForExtensionIdentifier:v33];

          v250 = v57;
          id v251 = v16;
          if (v57)
          {
            v249 = (void *)v55;
            uint64_t v58 = [v57 supportedRoles];
            char v59 = [v58 containsObject:v263];

            if (v59)
            {
              v252 = [v271 configurationStoreCoordinatorForPosterUUID:v272];
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke;
              aBlock[3] = &unk_1E69829A0;
              id v321 = v255;
              id v60 = v263;
              id v322 = v60;
              uint64_t v61 = _Block_copy(aBlock);
              v316[0] = MEMORY[0x1E4F143A8];
              v316[1] = 3221225472;
              v316[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3;
              v316[3] = &unk_1E69829C8;
              v316[4] = self;
              id v317 = v262;
              id v62 = v16;
              id v318 = v62;
              id v254 = v60;
              id v319 = v254;
              id v63 = (unsigned int (**)(void *, void *, void *, id, id *))_Block_copy(v316);
              v247 = v63;
              v248 = (uint64_t (**)(void, void, void, void, void))v61;
              switch(v36)
              {
                case 0:
                  id v85 = (void *)MEMORY[0x1E4F28C58];
                  v331[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
                  long long v86 = [v275 description];
                  if (v86) {
                    long long v87 = v86;
                  }
                  else {
                    long long v87 = @"(null change)";
                  }
                  v332[0] = v87;
                  v332[1] = @"PRIncomingPosterTypeUnknown";
                  v331[1] = @"incomingPosterType";
                  v331[2] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
                  uint64_t v88 = [v275 description];
                  uint64_t v89 = (void *)v88;
                  if (v88) {
                    v90 = (__CFString *)v88;
                  }
                  else {
                    v90 = @"(null change)";
                  }
                  v332[2] = v90;
                  v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v332 forKeys:v331 count:3];
                  id *v273 = [v85 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v91];

                  goto LABEL_86;
                case 1:
                  uint64_t v33 = (void *)v274;
                  if (![v17 addPosterUUID:v272 provider:v274 error:v273])
                  {
                    BOOL v18 = 0;
                    uint64_t v19 = v263;
                    int v43 = v264;
                    id v130 = v249;
                    goto LABEL_205;
                  }
                  uint64_t v19 = v263;
                  id v130 = v249;
                  if (![v17 assignPosterUUID:v272 toRole:v254 error:v273]
                    || !v247[2](v247, v272, v261, v17, v273))
                  {
                    BOOL v18 = 0;
                    goto LABEL_204;
                  }
                  id v315 = v252;
                  int v92 = ((uint64_t (**)(void, void *, void *, id *, id *))v248)[2](v248, v271, v272, &v315, v273);
                  id v93 = v315;

                  if (!v92)
                  {
                    BOOL v18 = 0;
                    v252 = v93;
                    uint64_t v19 = v263;
                    int v43 = v264;
                    id v129 = v247;
                    goto LABEL_206;
                  }
                  uint64_t v94 = [v278 contentsURL];
                  id v314 = 0;
                  id v95 = [v93 stageNewVersionWithContents:v94 error:&v314];
                  id v96 = v314;

                  if (!v95 || v96)
                  {
                    id *v273 = v96;
                    int v101 = 1;
                  }
                  else
                  {
                    uint64_t v97 = [v93 pathForIdentity:v95];
                    if (__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v97, v97, v249, v267, (uint64_t)v273))
                    {
                      char v98 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v97];
                      id v99 = +[PBFPosterDataStoreEventBuilder posterAdded:v98];
                      [v99 setOriginatingRoleCoordinatorChange:v275];
                      v311[0] = MEMORY[0x1E4F143A8];
                      v311[1] = 3221225472;
                      v311[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4;
                      v311[3] = &unk_1E69829F0;
                      id v312 = v271;
                      id v313 = v272;
                      [v99 setRevertBlock:v311];
                      v100 = [v99 buildWithError:v273];
                      if (v100)
                      {
                        [v269 addObject:v100];
                        int v101 = 0;
                      }
                      else
                      {
                        int v101 = 1;
                      }
                    }
                    else
                    {
                      [v271 teardownConfigurationStoreCoordinatorForPosterUUID:v272 error:0];

                      int v101 = 1;
                    }
                    uint64_t v33 = (void *)v274;
                    id v14 = v276;
                  }

                  id v130 = v249;
                  if (v101)
                  {
                    BOOL v18 = 0;
                    v252 = v93;
                    goto LABEL_191;
                  }
                  v252 = v93;
                  goto LABEL_193;
                case 2:
                  if (!v252)
                  {
                    v142 = (void *)MEMORY[0x1E4F28C58];
                    v329[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
                    uint64_t v143 = [v275 description];
                    long long v144 = (void *)v143;
                    long long v145 = @"(null change)";
                    if (v143) {
                      long long v145 = (__CFString *)v143;
                    }
                    uint64_t v146 = *MEMORY[0x1E4F28588];
                    v330[0] = v145;
                    v330[1] = @"No Configuration store coordinator found to update";
                    v329[1] = v146;
                    v329[2] = @"posterUUID";
                    uint64_t v147 = [v272 UUIDString];
                    long long v148 = (void *)v147;
                    long long v149 = @"(null destinationPosterUUID)";
                    if (v147) {
                      long long v149 = (__CFString *)v147;
                    }
                    v330[2] = v149;
                    id v150 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v330 forKeys:v329 count:3];
                    id *v273 = [v142 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v150];

                    id v129 = v247;
                    v252 = 0;
                    goto LABEL_87;
                  }
                  uint64_t v19 = v263;
                  id v130 = v249;
                  if (!v63[2](v63, v272, v261, v17, v273))
                  {
                    BOOL v18 = 0;
                    goto LABEL_128;
                  }
                  id v259 = v17;
                  id v102 = objc_alloc(MEMORY[0x1E4F92638]);
                  uint64_t v103 = [v252 pathOfLatestVersion];
                  uint64_t v104 = (void *)[v102 _initWithPath:v103];

                  if ([v278 isServerPosterPath])
                  {
                    uint64_t v105 = [v278 serverIdentity];
                    v106 = [v105 posterUUID];
                    uint64_t v107 = [v14 originalPosterUUID];
                    char v108 = [v106 isEqual:v107];

                    char v109 = v108 ^ 1;
                  }
                  else
                  {
                    char v109 = 1;
                  }
                  uint64_t v33 = (void *)v274;
                  int v177 = [(id)objc_opt_class() supportsSupplementalUpdates];
                  if ((v109 & 1) != 0 || !v177)
                  {
                    BOOL v181 = [v278 contentsURL];
                    id v309 = 0;
                    uint64_t v178 = v252;
                    v179 = [v252 stageNewVersionWithContents:v181 error:&v309];
                    id v180 = v309;
                  }
                  else
                  {
                    id v310 = 0;
                    uint64_t v178 = v252;
                    v179 = [v252 stageNewSupplementWithError:&v310];
                    id v180 = v310;
                  }
                  v182 = [v178 pathForIdentity:v179];
                  BOOL v183 = v182;
                  int v184 = 1;
                  if (v179 && !v180)
                  {
                    if (__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v182, v182, v249, v267, (uint64_t)v273))
                    {
                      id v185 = objc_alloc(MEMORY[0x1E4F92638]);
                      uint64_t v186 = [v252 pathForIdentity:v179];
                      uint64_t v187 = [v185 _initWithPath:v186];

                      v277 = (void *)v187;
                      v188 = +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:v104 to:v187];
                      [v188 setOriginatingRoleCoordinatorChange:v275];
                      v305[0] = MEMORY[0x1E4F143A8];
                      v305[1] = 3221225472;
                      void v305[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_5;
                      v305[3] = &unk_1E6982A18;
                      id v306 = v271;
                      id v307 = v272;
                      id v308 = v179;
                      [v188 setRevertBlock:v305];
                      uint64_t v189 = [v188 buildWithError:v273];
                      if (v189)
                      {
                        [v269 addObject:v189];
                        int v184 = 0;
                      }
                      else
                      {
                        int v184 = 1;
                      }

                      uint64_t v33 = (void *)v274;
                    }
                    else
                    {
                      objc_msgSend(v271, "teardownConfigurationStoreCoordinatorForPosterUUID:version:error:", v272, objc_msgSend(v179, "version"), 0);
                    }
                  }

                  if (v184)
                  {
                    BOOL v18 = 0;
                    id v17 = v259;
LABEL_191:
                    uint64_t v19 = v263;
                    goto LABEL_204;
                  }
                  id v17 = v259;
LABEL_193:
                  uint64_t v19 = v263;
                  goto LABEL_203;
                case 3:
                  uint64_t v110 = [v14 originalPosterUUID];
                  uint64_t v111 = [v62 posterWithUUID:v110];
                  if (!v111)
                  {
                    v235 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"originalPosterConfiguration != nil"];
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                      -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:]();
                    }
                    [v235 UTF8String];
                    _bs_set_crash_log_message();
                    __break(0);
                    JUMPOUT(0x1D3236E90);
                  }
                  id v241 = v111;
                  v243 = [v111 _path];
                  v112 = [v275 userInfo];
                  uint64_t v113 = [v112 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"];
                  v245 = (void *)v110;
                  char v114 = BSEqualObjects();

                  uint64_t v19 = v263;
                  id v130 = v249;
                  if ((v114 & 1) == 0)
                  {
                    v236 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"BSEqualObjects(originalPosterUUID, [[change userInfo] objectForKey:PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID])"];
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                      -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:]();
                    }
                    [v236 UTF8String];
                    _bs_set_crash_log_message();
                    __break(0);
                    JUMPOUT(0x1D3236EF4);
                  }
                  v115 = [v275 userInfo];
                  id v116 = [v115 objectForKey:@"PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID"];
                  id v117 = v116;
                  if (v116)
                  {
                    id v118 = v116;
                  }
                  else
                  {
                    id v118 = [MEMORY[0x1E4F29128] UUID];
                  }
                  v151 = v118;

                  uint64_t v33 = (void *)v274;
                  if ([v17 addPosterUUID:v151 provider:v274 error:v273]
                    && [v17 assignPosterUUID:v151 toRole:v254 error:v273])
                  {
                    id v304 = v252;
                    int v152 = ((uint64_t (**)(void, void *, void *, id *, id *))v248)[2](v248, v271, v151, &v304, v273);
                    id v239 = v304;

                    if (v152)
                    {
                      v253 = v151;
                      long long v302 = 0u;
                      long long v303 = 0u;
                      long long v300 = 0u;
                      long long v301 = 0u;
                      long long v260 = v17;
                      uint64_t v153 = [v17 attributeIdentifiersForPoster:v245 roleId:v254 error:0];
                      uint64_t v154 = [v153 countByEnumeratingWithState:&v300 objects:v328 count:16];
                      if (v154)
                      {
                        uint64_t v155 = v154;
                        long long v156 = 0;
                        uint64_t v157 = *(void *)v301;
                        do
                        {
                          for (uint64_t i = 0; i != v155; ++i)
                          {
                            if (*(void *)v301 != v157) {
                              objc_enumerationMutation(v153);
                            }
                            uint64_t v159 = *(void *)(*((void *)&v300 + 1) + 8 * i);
                            if (!v156) {
                              long long v156 = objc_opt_new();
                            }
                            long long v160 = [v260 attributeForPoster:v245 roleId:v254 attributeId:v159 error:0];
                            if (v160) {
                              [v156 setObject:v160 forKeyedSubscript:v159];
                            }
                          }
                          uint64_t v155 = [v153 countByEnumeratingWithState:&v300 objects:v328 count:16];
                        }
                        while (v155);
                      }
                      else
                      {
                        long long v156 = 0;
                      }

                      long long v298 = 0u;
                      long long v299 = 0u;
                      long long v296 = 0u;
                      long long v297 = 0u;
                      v208 = [v261 keyEnumerator];
                      uint64_t v209 = [v208 countByEnumeratingWithState:&v296 objects:v327 count:16];
                      id v17 = v260;
                      if (v209)
                      {
                        uint64_t v210 = v209;
                        uint64_t v211 = *(void *)v297;
                        do
                        {
                          for (uint64_t j = 0; j != v210; ++j)
                          {
                            if (*(void *)v297 != v211) {
                              objc_enumerationMutation(v208);
                            }
                            uint64_t v213 = *(void *)(*((void *)&v296 + 1) + 8 * j);
                            v214 = [v261 objectForKeyedSubscript:v213];
                            uint64_t v215 = [v214 encodeJSON];

                            if (v215) {
                              [v156 setObject:v215 forKeyedSubscript:v213];
                            }

                            id v17 = v260;
                          }
                          uint64_t v210 = [v208 countByEnumeratingWithState:&v296 objects:v327 count:16];
                        }
                        while (v210);
                      }

                      if (v247[2](v247, v253, v261, v17, v273))
                      {
                        v216 = [v278 contentsURL];
                        id v295 = 0;
                        id v162 = v239;
                        v217 = [v239 stageNewVersionWithContents:v216 error:&v295];
                        id v218 = v295;

                        id v130 = v249;
                        if (!v217 || v218)
                        {
                          uint64_t v33 = (void *)v274;
                          id *v273 = v218;
                          int v161 = 1;
                        }
                        else
                        {
                          v219 = [v239 pathForIdentity:v217];
                          if (__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v219, v219, v249, v267, (uint64_t)v273))
                          {
                            v220 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
                            v221 = [v243 serverIdentity];
                            v222 = objc_msgSend(v220, "pbf_posterSnapshotCoordinatorForIdentity:", v221);

                            v223 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
                            v224 = objc_msgSend(v223, "pbf_posterSnapshotCoordinatorForIdentity:", v217);

                            [v224 ingestSnapshotsFromCoordinator:v222];
                            v225 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v219];
                            v226 = +[PBFPosterDataStoreEventBuilder posterAdded:v225];
                            uint64_t v227 = [v226 buildWithError:v273];
                            [v226 setOriginatingRoleCoordinatorChange:v275];
                            v292[0] = MEMORY[0x1E4F143A8];
                            v292[1] = 3221225472;
                            v292[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_251;
                            void v292[3] = &unk_1E69829F0;
                            id v293 = v271;
                            id v294 = v253;
                            [v226 setRevertBlock:v292];
                            if (v227)
                            {
                              [v269 addObject:v227];
                              int v161 = 0;
                            }
                            else
                            {
                              int v161 = 1;
                            }
                          }
                          else
                          {
                            [v271 teardownConfigurationStoreCoordinatorForPosterUUID:v253 error:0];

                            int v161 = 1;
                          }
                          id v17 = v260;
                          uint64_t v33 = (void *)v274;
                          id v130 = v249;
                          id v14 = v276;
                          id v162 = v239;
                          id v218 = 0;
                        }

                        long long v163 = v241;
                      }
                      else
                      {
                        int v161 = 1;
                        uint64_t v33 = (void *)v274;
                        id v130 = v249;
                        id v162 = v239;
                        long long v163 = v241;
                      }

                      uint64_t v19 = v263;
                      v151 = v253;
                    }
                    else
                    {
                      int v161 = 1;
                      id v162 = v239;
                      long long v163 = v241;
                    }
                  }
                  else
                  {
                    int v161 = 1;
                    id v162 = v252;
                    long long v163 = v241;
                  }

                  if (v161)
                  {
                    BOOL v18 = 0;
                    v252 = v162;
                    goto LABEL_204;
                  }
                  v252 = v162;
                  goto LABEL_203;
                case 4:
                case 5:
                  if (v270)
                  {
                    v258 = v17;
                    BOOL v64 = v36 == 4 || v252 == 0;
                    int v65 = v64;
                    if (v64)
                    {
                      id v291 = v252;
                      int v66 = (*((uint64_t (**)(void *, void *, void *, id *, id *))v61 + 2))(v61, v271, v272, &v291, v273);
                      id v67 = v291;

                      id v130 = v249;
                      if (!v66)
                      {
                        BOOL v18 = 0;
                        v252 = v67;
                        goto LABEL_127;
                      }
                      v252 = v67;
                    }
                    else
                    {
                      id v130 = v249;
                    }
                    id v131 = [(PBFPosterRoleCoordinator *)self modelCoordinatorProvider];
                    id v132 = [v268 provider];
                    char v133 = objc_msgSend(v131, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v132, v273);

                    if (v133)
                    {
                      v134 = [v268 posterUUID];
                      uint64_t v135 = [v133 configurationStoreCoordinatorForPosterUUID:v134];

                      if (v135)
                      {
                        v244 = v133;
                        v242 = (void *)v135;
                        if ([v278 isServerPosterPath])
                        {
                          v136 = [v278 serverIdentity];
                          v137 = [v136 posterUUID];
                          v138 = [v14 originalPosterUUID];
                          int v139 = [v137 isEqual:v138];

                          int v140 = v139 ^ 1;
                        }
                        else
                        {
                          int v140 = 1;
                        }
                        int v173 = [(id)objc_opt_class() supportsSupplementalUpdates];
                        v174 = [v252 pathOfLatestVersion];
                        if (v174)
                        {
                          id v175 = objc_alloc(MEMORY[0x1E4F92638]);
                          uint64_t v176 = [v252 pathOfLatestVersion];
                          v246 = (void *)[v175 _initWithPath:v176];
                        }
                        else
                        {
                          v246 = 0;
                        }

                        if ((v140 | v173 ^ 1))
                        {
                          v190 = [v278 contentsURL];
                          id v289 = 0;
                          v191 = [v252 stageNewVersionWithContents:v190 error:&v289];
                          id v192 = v289;
                        }
                        else
                        {
                          id v290 = 0;
                          v191 = [v252 stageNewSupplementWithError:&v290];
                          id v192 = v290;
                        }
                        uint64_t v33 = (void *)v274;
                        if (!v191 || v192)
                        {
                          id *v273 = v192;
                        }
                        else
                        {
                          v193 = [v252 pathForIdentity:v191];
                          if (__112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2((uint64_t)v193, v193, v130, v267, (uint64_t)v273))
                          {
                            v240 = v193;
                            uint64_t v194 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v193];
                            v238 = v194;
                            if (v65)
                            {
                              id v195 = objc_alloc(MEMORY[0x1E4F92550]);
                              objc_msgSend(v194, "pbf_posterUUID");
                              v197 = v196 = v194;
                              v198 = [MEMORY[0x1E4F1C9C8] date];
                              uint64_t v199 = objc_msgSend(v196, "pbf_posterProvider");
                              v200 = (void *)[v195 initWithChildPosterUUID:v197 dateCreated:v198 providerIdentifier:v199];

                              uint64_t v201 = *MEMORY[0x1E4F92758];
                              v237 = v200;
                              v202 = [v200 encodeJSON];
                              LODWORD(v201) = [v258 mutateAttributeForPoster:v266 roleId:v254 attributeId:v201 attributePayload:v202 error:v273];

                              if (!v201)
                              {
                                uint64_t v230 = 0;
                                int v233 = 1;
                                uint64_t v232 = v200;
                                goto LABEL_198;
                              }
                              uint64_t v194 = v238;
                              v203 = +[PBFPosterDataStoreEventBuilder posterAdded:v238];
                              uint64_t v204 = v275;
                              [v203 setOriginatingRoleCoordinatorChange:v275];
                              v286[0] = MEMORY[0x1E4F143A8];
                              v286[1] = 3221225472;
                              void v286[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2_259;
                              v286[3] = &unk_1E69829F0;
                              id v287 = v271;
                              id v288 = v272;
                              [v203 setRevertBlock:v286];
                              v205 = [v203 buildWithError:v273];

                              v206 = v237;
                            }
                            else
                            {
                              v203 = +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:v246 to:v194];
                              uint64_t v204 = v275;
                              [v203 setOriginatingRoleCoordinatorChange:v275];
                              v282[0] = MEMORY[0x1E4F143A8];
                              v282[1] = 3221225472;
                              void v282[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3_260;
                              v282[3] = &unk_1E6982A18;
                              id v283 = v271;
                              id v284 = v272;
                              id v285 = v191;
                              [v203 setRevertBlock:v282];
                              v205 = [v203 buildWithError:v273];

                              v206 = v283;
                            }

                            if (!v205)
                            {
                              int v233 = 1;
                              uint64_t v33 = (void *)v274;
LABEL_199:

                              id v130 = v249;
LABEL_200:

                              uint64_t v19 = v263;
                              if (v233)
                              {
                                BOOL v18 = 0;
                                id v17 = v258;
                              }
                              else
                              {
                                id v17 = v258;
LABEL_203:
                                id *v256 = (id)[v269 copy];
                                BOOL v18 = 1;
                              }
                              goto LABEL_204;
                            }
                            [v269 addObject:v205];
                            v228 = [v252 providerInfo];
                            v229 = [v268 posterUUID];
                            [v252 setObject:v229 forKeyedSubscript:@"kConfigurationAssociatedPosterUUIDKey"];

                            uint64_t v230 = +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:v270 to:v270];

                            [v230 setOriginatingRoleCoordinatorChange:v204];
                            v279[0] = MEMORY[0x1E4F143A8];
                            v279[1] = 3221225472;
                            void v279[2] = __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4_261;
                            v279[3] = &unk_1E69829F0;
                            id v280 = v252;
                            id v281 = v228;
                            id v231 = v228;
                            [v230 setRevertBlock:v279];
                            uint64_t v232 = [v230 buildWithError:v273];

                            if (v232)
                            {
                              [v269 addObject:v232];
                              int v233 = 0;
                            }
                            else
                            {
                              int v233 = 1;
                            }

                            id v14 = v276;
LABEL_198:

                            v203 = v230;
                            uint64_t v33 = (void *)v274;
                            uint64_t v194 = v238;
                            goto LABEL_199;
                          }
                          if (v65) {
                            [v271 teardownConfigurationStoreCoordinatorForPosterUUID:v272 error:0];
                          }
                          else {
                            objc_msgSend(v271, "teardownConfigurationStoreCoordinatorForPosterUUID:version:error:", v272, objc_msgSend(v191, "version"), 0);
                          }
                        }
                        int v233 = 1;
                        goto LABEL_200;
                      }
                      long long v164 = (void *)MEMORY[0x1E4F28C58];
                      v323[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
                      uint64_t v165 = [v275 description];
                      long long v166 = (void *)v165;
                      long long v167 = @"(null change)";
                      if (v165) {
                        long long v167 = (__CFString *)v165;
                      }
                      uint64_t v168 = *MEMORY[0x1E4F28588];
                      v324[0] = v167;
                      v324[1] = @"No Configuration store coordinator found to update";
                      v323[1] = v168;
                      v323[2] = @"posterUUID";
                      uint64_t v169 = [v272 UUIDString];
                      uint64_t v170 = (void *)v169;
                      long long v171 = @"(null destinationPosterUUID)";
                      if (v169) {
                        long long v171 = (__CFString *)v169;
                      }
                      v324[2] = v171;
                      v172 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v324 forKeys:v323 count:3];
                      id *v273 = [v164 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v172];
                    }
                    BOOL v18 = 0;
LABEL_127:
                    id v17 = v258;
                    uint64_t v19 = v263;
LABEL_128:
                    uint64_t v33 = (void *)v274;
LABEL_204:
                    int v43 = v264;
LABEL_205:
                    id v129 = v247;
                    goto LABEL_206;
                  }
                  v119 = (void *)MEMORY[0x1E4F28C58];
                  v325[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
                  uint64_t v120 = [v275 description];
                  long long v86 = (__CFString *)v120;
                  v121 = @"(null change)";
                  if (v120) {
                    v121 = (__CFString *)v120;
                  }
                  uint64_t v122 = *MEMORY[0x1E4F28588];
                  v326[0] = v121;
                  v326[1] = @"No parent configuration specified for associated configuration";
                  v325[1] = v122;
                  v325[2] = @"posterUUID";
                  [v268 posterUUID];
                  v124 = id v123 = v17;
                  uint64_t v125 = [v124 UUIDString];
                  v126 = (void *)v125;
                  v127 = @"(parent poster uuid)";
                  if (v125) {
                    v127 = (__CFString *)v125;
                  }
                  v326[2] = v127;
                  v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v326 forKeys:v325 count:3];
                  id *v273 = [v119 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v128];

                  id v17 = v123;
LABEL_86:

                  id v129 = v247;
LABEL_87:
                  BOOL v18 = 0;
                  uint64_t v19 = v263;
                  int v43 = v264;
                  uint64_t v33 = (void *)v274;
                  id v130 = v249;
LABEL_206:
                  uint64_t v42 = v130;

                  long long v81 = v321;
                  break;
                default:
                  uint64_t v19 = v263;
                  uint64_t v33 = (void *)v274;
                  id v130 = v249;
                  goto LABEL_203;
              }
            }
            else
            {
              long long v82 = (void *)MEMORY[0x1E4F28C58];
              v333[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
              uint64_t v83 = [v275 description];
              long long v84 = @"(null change)";
              v252 = (void *)v83;
              if (v83) {
                long long v84 = (__CFString *)v83;
              }
              v333[1] = *MEMORY[0x1E4F28588];
              v334[0] = v84;
              v334[1] = @"Extension does not support role";
              long long v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v334 forKeys:v333 count:2];
              [v82 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v81];
              BOOL v18 = 0;
              uint64_t v33 = (void *)v274;
              id *v273 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v19 = v263;
              int v43 = v264;
              uint64_t v42 = (void *)v55;
            }
          }
          else
          {
            uint64_t v42 = (void *)v55;
            uint64_t v78 = (void *)MEMORY[0x1E4F28C58];
            v335[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
            uint64_t v79 = [v275 description];
            uint64_t v80 = @"(null change)";
            v252 = (void *)v79;
            if (v79) {
              uint64_t v80 = (__CFString *)v79;
            }
            v335[1] = *MEMORY[0x1E4F28588];
            v336[0] = v80;
            v336[1] = @"Extension does not exist";
            long long v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v336 forKeys:v335 count:2];
            [v78 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v81];
            BOOL v18 = 0;
            id *v273 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v19 = v263;
            int v43 = v264;
          }

          long long v70 = v250;
          id v16 = v251;
          uint64_t v77 = v252;
LABEL_208:

          v44 = v255;
LABEL_209:

          int v45 = v270;
          goto LABEL_210;
        }
        uint64_t v42 = (void *)v55;
        v68 = (void *)MEMORY[0x1E4F28C58];
        v337 = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v75 = [v275 description];
        long long v70 = (void *)v75;
        uint64_t v76 = @"(null change)";
        if (v75) {
          uint64_t v76 = (__CFString *)v75;
        }
        v338 = v76;
        uint64_t v72 = (void *)MEMORY[0x1E4F1C9E8];
        long long v73 = &v338;
        long long v74 = &v337;
      }
      else
      {
        uint64_t v42 = (void *)v55;
        v68 = (void *)MEMORY[0x1E4F28C58];
        v339 = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v69 = [v275 description];
        long long v70 = (void *)v69;
        long long v71 = @"(null change)";
        if (v69) {
          long long v71 = (__CFString *)v69;
        }
        v340 = v71;
        uint64_t v72 = (void *)MEMORY[0x1E4F1C9E8];
        long long v73 = &v340;
        long long v74 = &v339;
      }
      uint64_t v77 = [v72 dictionaryWithObjects:v73 forKeys:v74 count:1];
      [v68 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v77];
      BOOL v18 = 0;
      id *v273 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = v263;
      int v43 = v264;
      goto LABEL_208;
    }
    if (v35 == 1)
    {
LABEL_11:
      uint64_t v37 = [v16 orderedPosters];
      uint64_t v38 = [v37 count];

      if (v38 + 1 > [(PBFPosterRoleCoordinator *)self maximumNumberOfPosters])
      {
        uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
        v347[0] = @"PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey";
        uint64_t v40 = [v275 description];
        uint64_t v41 = @"(null change)";
        long long v262 = (void *)v40;
        if (v40) {
          uint64_t v41 = (__CFString *)v40;
        }
        v347[1] = *MEMORY[0x1E4F28588];
        v348[0] = v41;
        v348[1] = @"Exceeded data store poster configuration limit";
        uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v348 forKeys:v347 count:2];
        [v39 errorWithDomain:@"com.apple.PosterBoard.roleCoordinator.errorDomain" code:3 userInfo:v42];
        BOOL v18 = 0;
        id *v273 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = v263;
        int v43 = v264;
        uint64_t v33 = (void *)v274;
        v44 = v30;
        id v14 = v276;
        goto LABEL_209;
      }
      long long v262 = 0;
      uint64_t v33 = (void *)v274;
    }
    else
    {
      long long v262 = 0;
    }
    long long v52 = v30;
    id v14 = v276;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  BOOL v18 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_211:

  return v18;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  if (*a4)
  {
    char v5 = 1;
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = a3;
    id v12 = a2;
    unint64_t v13 = [v10 descriptorIdentifier];
    uint64_t v14 = *(void *)(a1 + 40);
    id v21 = 0;
    id v15 = [v12 stageNewConfigurationStoreCoordinatorForPosterUUID:v11 descriptorIdentifier:v13 role:v14 error:&v21];

    id v16 = v21;
    BOOL v17 = v15 != 0;
    BOOL v18 = v16 == 0;
    char v5 = v17 && v18;
    if (v17 && v18) {
      uint64_t v19 = v15;
    }
    else {
      uint64_t v19 = v16;
    }
    if (v17 && v18) {
      a5 = a4;
    }
    *a5 = v19;
  }
  return v5 & 1;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    if (![MEMORY[0x1E4F926B0] storeConfiguredPropertiesForPath:v8 configuredProperties:v9 error:a5])
    {
LABEL_10:
      uint64_t v15 = 0;
      goto LABEL_11;
    }
    id v11 = [v9 otherMetadata];
    if (v11) {
      goto LABEL_6;
    }
    id v12 = [v10 displayNameLocalizationKey];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F92698]);
      uint64_t v14 = [v10 displayNameLocalizationKey];
      id v11 = (void *)[v13 initWithDisplayNameLocalizationKey:v14];

      [MEMORY[0x1E4F926B0] storeOtherMetadataForPath:v8 otherMetadata:v11 error:0];
LABEL_6:
    }
  }
  if (v10
    && ![MEMORY[0x1E4F926B0] storeConfigurableOptionsForPath:v8 configurableOptions:v10 error:a5])
  {
    goto LABEL_10;
  }
  uint64_t v15 = 1;
LABEL_11:

  return v15;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = (void *)a1[4];
  uint64_t v12 = a1[5];
  id v39 = 0;
  id v40 = 0;
  int v13 = [v11 _prepareAttributesForIngestionForPoster:v9 existingAttributes:v12 incomingAttributes:a3 proposedAttributesToDelete:&v40 proposedAttributesToUpdate:&v39 storage:v10 currentCollection:a1[6] error:a5];
  id v14 = v40;
  id v30 = v39;
  if (v13)
  {
    if ([v14 count] || objc_msgSend(v30, "count"))
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v28 = v14;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v15);
            }
            if (![v10 mutateAttributeForPoster:v9 roleId:a1[7] attributeId:*(void *)(*((void *)&v35 + 1) + 8 * i) attributePayload:0 error:a5])
            {
              uint64_t v26 = 0;
              goto LABEL_23;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v42 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v15 = [v30 keyEnumerator];
      uint64_t v20 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v29 = *(void *)v32;
LABEL_14:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v15);
          }
          uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * v22);
          BOOL v24 = [v30 objectForKey:v23];
          long long v25 = [v24 encodeJSON];
          uint64_t v26 = [v10 mutateAttributeForPoster:v9 roleId:a1[7] attributeId:v23 attributePayload:v25 error:a5];

          if (!v26) {
            break;
          }
          if (v21 == ++v22)
          {
            uint64_t v21 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
            uint64_t v26 = 1;
            if (v21) {
              goto LABEL_14;
            }
            break;
          }
        }
      }
      else
      {
        uint64_t v26 = 1;
      }
LABEL_23:
      id v14 = v28;
    }
    else
    {
      uint64_t v26 = 1;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) teardownConfigurationStoreCoordinatorForPosterUUID:*(void *)(a1 + 40) error:0];
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) version];
  return [v1 teardownConfigurationStoreCoordinatorForPosterUUID:v2 version:v3 error:0];
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_251(uint64_t a1)
{
  return [*(id *)(a1 + 32) teardownConfigurationStoreCoordinatorForPosterUUID:*(void *)(a1 + 40) error:0];
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_2_259(uint64_t a1)
{
  return [*(id *)(a1 + 32) teardownConfigurationStoreCoordinatorForPosterUUID:*(void *)(a1 + 40) error:0];
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_3_260(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) version];
  return [v1 teardownConfigurationStoreCoordinatorForPosterUUID:v2 version:v3 error:0];
}

uint64_t __112__PBFPosterRoleCoordinator__ingestIncomingPosterConfiguration_change_currentCollection_storage_outEvents_error___block_invoke_4_261(uint64_t a1)
{
  return 1;
}

- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  int v18 = [(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled];
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v40 = a7;
    id v41 = v15;
    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = [v16 allKeys];
    uint64_t v21 = [v19 setWithArray:v20];

    id v39 = v21;
    uint64_t v22 = (void *)[v21 mutableCopy];
    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v24 = [v17 allKeys];
    long long v25 = [v23 setWithArray:v24];
    [v22 minusSet:v25];

    uint64_t v26 = [(id)objc_opt_class() protectedAttributes];
    if ([v22 intersectsSet:v26])
    {
      int v27 = (void *)[v22 mutableCopy];
      [v27 intersectSet:v26];
      id v28 = PBFLogRoleCoordinator();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [(PBFPosterRoleCoordinator *)self role];
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = v29;
        __int16 v44 = 2114;
        id v45 = v41;
        __int16 v46 = 2114;
        uint64_t v47 = v27;
        _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Blocked deletion of protected attribute(s) from poster %{public}@: %{public}@", buf, 0x20u);
      }
      [v22 minusSet:v26];
    }
    id v30 = (void *)[v17 mutableCopy];
    long long v31 = v30;
    if (v30) {
      id v32 = v30;
    }
    else {
      id v32 = (id)objc_opt_new();
    }
    long long v33 = v32;

    uint64_t v34 = *MEMORY[0x1E4F92780];
    long long v35 = [v33 objectForKey:*MEMORY[0x1E4F92780]];

    if (v35)
    {
      long long v36 = [v33 objectForKeyedSubscript:v34];
      id v37 = [v36 usageMetadataWithUpdatedLastModifiedDate];
    }
    else
    {
      id v37 = objc_alloc_init(MEMORY[0x1E4F926F0]);
    }
    [v33 setObject:v37 forKeyedSubscript:v34];

    if (a6) {
      *a6 = (id)[v22 copy];
    }
    id v15 = v41;
    if (v40) {
      *id v40 = (id)[v33 copy];
    }
  }
  return v18 ^ 1;
}

- (void)noteDidResetRoleCoordinator:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = [(PBFPosterRoleCoordinator *)self role];
    int v6 = 138543618;
    id v7 = v5;
    __int16 v8 = 2114;
    id v9 = self;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did reset role coordinator %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

+ (void)dumpResultsForEvent:(id)a3 role:(id)a4 posterCollection:(id)a5 changes:(id)a6 eventWasHandled:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v43 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F29128] UUID];
  id v15 = [v14 UUIDString];
  id v16 = [v15 substringToIndex:7];

  id v17 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v55 = v16;
    __int16 v56 = 2114;
    id v57 = v11;
    __int16 v58 = 2114;
    id v59 = v43;
    _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]\tExecution report for notifyEventWasReceived:%{public}@ for role %{public}@", buf, 0x20u);
  }

  int v18 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v55 = v16;
    __int16 v56 = 1024;
    LODWORD(v57) = v7;
    _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]\tWas event handled: '%{BOOL}u'", buf, 0x12u);
  }

  uint64_t v19 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v55 = v16;
    _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]\tEvent Description:", buf, 0xCu);
  }

  uint64_t v20 = PBFLogRoleCoordinator();
  [v11 dumpLongDescriptionWithPreamble:v16 log:v20 type:16];

  uint64_t v21 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v12 selectedPoster];
    *(_DWORD *)buf = 138543618;
    uint64_t v55 = v16;
    __int16 v56 = 2114;
    id v57 = v22;
    _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\tCurrent selected poster: %{public}@", buf, 0x16u);
  }
  id v42 = v11;

  uint64_t v23 = PBFLogRoleCoordinator();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v55 = v16;
    _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\tCurrent poster collection:", buf, 0xCu);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v41 = v12;
  BOOL v24 = [v12 orderedPosters];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v49 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v30 = PBFLogRoleCoordinator();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v55 = v16;
          __int16 v56 = 2114;
          id v57 = v29;
          _os_log_impl(&dword_1D31CE000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\t\t%{public}@", buf, 0x16u);
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v26);
  }

  uint64_t v31 = [v13 count];
  id v32 = PBFLogRoleCoordinator();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    uint64_t v34 = v42;
    if (v33)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v55 = v16;
      __int16 v56 = 2114;
      id v57 = v42;
      _os_log_impl(&dword_1D31CE000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\tProposed changes in response to event '%{public}@':", buf, 0x16u);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v32 = v13;
    uint64_t v35 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v32);
          }
          id v39 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          id v40 = PBFLogRoleCoordinator();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v55 = v16;
            __int16 v56 = 2114;
            id v57 = v39;
            _os_log_impl(&dword_1D31CE000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\t\t%{public}@", buf, 0x16u);
          }
        }
        uint64_t v36 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v36);
      uint64_t v34 = v42;
    }
  }
  else
  {
    uint64_t v34 = v42;
    if (v33)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v55 = v16;
      __int16 v56 = 2114;
      id v57 = v42;
      _os_log_impl(&dword_1D31CE000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@]\t\t0 Proposed changes in response to event '%{public}@':", buf, 0x16u);
    }
  }
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPosterCollection:(id)a3
{
}

- (unint64_t)maximumNumberOfPosters
{
  return self->maximumNumberOfPosters;
}

- (void)setMaximumNumberOfPosters:(unint64_t)a3
{
  self->maximumNumberOfPosters = a3;
}

- (PBFPosterExtensionDataStorageRetrieving)storage
{
  return (PBFPosterExtensionDataStorageRetrieving *)objc_getProperty(self, a2, 56, 1);
}

- (PBFModelCoordinatorProviding)modelCoordinatorProvider
{
  return (PBFModelCoordinatorProviding *)objc_getProperty(self, a2, 64, 1);
}

- (PBFPosterRoleCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBFPosterRoleCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)knownExtensionIdentifiers
{
  return self->_knownExtensionIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownExtensionIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modelCoordinatorProvider, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_posterCollection, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
}

- (void)initWithRole:storage:modelCoordinatorProvider:providers:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRole:storage:modelCoordinatorProvider:providers:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setupRoleIfNecessaryWithStorage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13_1(&dword_1D31CE000, v0, (uint64_t)v0, "[%{public}@] Role synchronization failed with error: %{public}@", v1);
}

- (void)synchronizeFileSystemAttributesForStorage:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13_1(&dword_1D31CE000, v0, (uint64_t)v0, "[%{public}@] Failed to fix selected poster / ordered poster relationship: %{public}@", v1);
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "[%{public}@] initialPosters is nil; unable to create default poster(s) for role",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)finalizeChangesWithChangeHandler:(uint64_t)a1 outEvents:(void *)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a2 count];
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_13_1(&dword_1D31CE000, a3, v4, "[%{public}@] unable to add & select any of %lu initial posters for role", v5);
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "[%{public}@] Correcting unselected poster has failed.", v2, v3, v4, v5, v6);
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "[%{public}@] initialPosters is nil; unable to ascertain new selected poster for role",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)finalizeChangesWithChangeHandler:(uint64_t)a1 outEvents:(void *)a2 error:(NSObject *)a3 .cold.5(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a2 count];
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_13_1(&dword_1D31CE000, a3, v4, "[%{public}@] unable to add any of %lu initial posters for role", v5);
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.6()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "[%{public}@] unable to ascertain new selected poster for role.", v2, v3, v4, v5, v6);
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.7()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "[%{public}@] selectedPoster is nil; determining new selected poster",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.8()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "[%{public}@] collection is nil; setting up initial poster(s)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end