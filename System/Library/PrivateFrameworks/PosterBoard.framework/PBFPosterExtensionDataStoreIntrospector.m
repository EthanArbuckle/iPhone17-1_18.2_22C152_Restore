@interface PBFPosterExtensionDataStoreIntrospector
- (BOOL)assocPostersExist;
- (BOOL)descriptorsExist;
- (BOOL)legacyAssocPostersExist;
- (BOOL)multipleVersionsForConfigurationDataExists;
- (BOOL)snapshotsExist;
- (BOOL)userConfigurationDataExists;
- (NSSet)providers;
- (NSSet)roles;
- (NSSet)snapshotURLs;
- (PBFPosterExtensionDataStoreIntrospector)initWithURL:(id)a3 error:(id *)a4;
- (id)_openDatabaseIfPossible:(id *)a3;
- (id)associatedPosterForRole:(id)a3 parentPosterUUID:(id)a4;
- (id)associatedPosterUUIDForPosterUUIDForRole:(id)a3 error:(id *)a4;
- (id)associatedPosterUUIDForRole:(id)a3 parentPosterUUID:(id)a4 error:(id *)a5;
- (id)extensionStoreCoordinatorForProvider:(id)a3;
- (id)legacyAssociatedPosterForParentPosterUUID:(id)a3;
- (id)legacyAssociatedPosterParentUUIDToChildUUIDWithError:(id *)a3;
- (id)legacyAssociatedPosterUUIDForPosterUUID:(id)a3 error:(id *)a4;
- (id)legacySelectedPosterUUIDWithError:(id *)a3;
- (id)legacySortedPosterUUIDsWithError:(id *)a3;
- (id)posterWithUUID:(id)a3;
- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4;
- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4;
- (unint64_t)dataStoreVersion;
- (unint64_t)numberOfPostersForRole:(id)a3;
- (void)_hydrate;
@end

@implementation PBFPosterExtensionDataStoreIntrospector

- (PBFPosterExtensionDataStoreIntrospector)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 checkResourceIsReachableAndReturnError:a4]) {
    goto LABEL_6;
  }
  v18.receiver = self;
  v18.super_class = (Class)PBFPosterExtensionDataStoreIntrospector;
  self = [(PBFPosterExtensionDataStoreIntrospector *)&v18 init];
  if (self)
  {
    v7 = (NSURL *)[v6 copy];
    dataStoreURL = self->_dataStoreURL;
    self->_dataStoreURL = v7;

    objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreExtensionContainerURLForVersionDataStoreURL:", self->_dataStoreURL);
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    dataStoreExtensionsURL = self->_dataStoreExtensionsURL;
    self->_dataStoreExtensionsURL = v9;

    objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreSQLiteDatabaseURLForDataStoreURL:", self->_dataStoreURL);
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    dataStoreDatabaseURL = self->_dataStoreDatabaseURL;
    self->_dataStoreDatabaseURL = v11;

    _PBFExtensionStoreCoordinatorsForDataStoreExtensionContainerURL(self->_dataStoreExtensionsURL, 1u);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    extensionStoreCoordinators = self->_extensionStoreCoordinators;
    self->_extensionStoreCoordinators = v13;

    self->_dataStoreDatabaseExists = [(NSURL *)self->_dataStoreDatabaseURL checkResourceIsReachableAndReturnError:0];
    v15 = [v6 lastPathComponent];
    self->_dataStoreVersion = [v15 integerValue];

    if ([(NSArray *)self->_extensionStoreCoordinators count])
    {
      [(PBFPosterExtensionDataStoreIntrospector *)self _hydrate];
      goto LABEL_5;
    }
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
LABEL_5:
  self = self;
  v16 = self;
LABEL_7:

  return v16;
}

- (id)posterWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_extensionStoreCoordinators;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "latestPosterConfigurationForUUID:", v4, (void)v13);
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)numberOfPostersForRole:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_extensionStoreCoordinators;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) configurationStoreCoordinatorsWithError:0];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __66__PBFPosterExtensionDataStoreIntrospector_numberOfPostersForRole___block_invoke;
        v14[3] = &unk_1E6983DD8;
        id v15 = v4;
        v11 = objc_msgSend(v10, "bs_filter:", v14);
        v7 += [v11 count];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

uint64_t __66__PBFPosterExtensionDataStoreIntrospector_numberOfPostersForRole___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 role];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)associatedPosterForRole:(id)a3 parentPosterUUID:(id)a4
{
  id v6 = a3;
  if (!v6) {
    id v6 = (id)*MEMORY[0x1E4F92790];
  }
  unint64_t v7 = [(PBFPosterExtensionDataStoreIntrospector *)self associatedPosterUUIDForRole:v6 parentPosterUUID:a4 error:0];
  uint64_t v8 = [(PBFPosterExtensionDataStoreIntrospector *)self posterWithUUID:v7];

  return v8;
}

- (id)legacyAssociatedPosterForParentPosterUUID:(id)a3
{
  uint64_t v4 = [(PBFPosterExtensionDataStoreIntrospector *)self legacyAssociatedPosterUUIDForPosterUUID:a3 error:0];
  uint64_t v5 = [(PBFPosterExtensionDataStoreIntrospector *)self posterWithUUID:v4];

  return v5;
}

- (id)extensionStoreCoordinatorForProvider:(id)a3
{
  id v4 = a3;
  extensionStoreCoordinators = self->_extensionStoreCoordinators;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PBFPosterExtensionDataStoreIntrospector_extensionStoreCoordinatorForProvider___block_invoke;
  v9[3] = &unk_1E6983E00;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSArray *)extensionStoreCoordinators bs_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __80__PBFPosterExtensionDataStoreIntrospector_extensionStoreCoordinatorForProvider___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 extensionIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)legacySortedPosterUUIDsWithError:(id *)a3
{
  legacySortedPosterUUIDs = self->_legacySortedPosterUUIDs;
  if (legacySortedPosterUUIDs)
  {
    uint64_t v4 = legacySortedPosterUUIDs;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_switcherConfigurationOrderingURLForDataStoreURL:", self->_dataStoreURL);
    if ([v6 checkResourceIsReachableAndReturnError:0])
    {
      unint64_t v7 = (void *)MEMORY[0x1E4F1CAA0];
      id v25 = 0;
      uint64_t v8 = objc_msgSend(v6, "pf_loadFromPlistWithError:", &v25);
      id v9 = v25;
      uint64_t v10 = objc_opt_class();
      id v11 = v8;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v13 = v12;

      if (v13) {
        id v14 = v13;
      }
      else {
        id v14 = (id)MEMORY[0x1E4F1CBF0];
      }
      id v15 = [v7 orderedSetWithArray:v14];

      if (!v9)
      {
        long long v16 = (void *)MEMORY[0x1E4F1CAA0];
        long long v17 = [v15 array];
        long long v18 = objc_msgSend(v17, "bs_mapNoNulls:", &__block_literal_global_30);
        long long v19 = [v16 orderedSetWithArray:v18];
        v20 = self->_legacySortedPosterUUIDs;
        self->_legacySortedPosterUUIDs = v19;
      }
    }
    uint64_t v21 = self->_legacySortedPosterUUIDs;
    if (!v21)
    {
      v22 = (NSOrderedSet *)objc_opt_new();
      v23 = self->_legacySortedPosterUUIDs;
      self->_legacySortedPosterUUIDs = v22;

      uint64_t v21 = self->_legacySortedPosterUUIDs;
    }
    uint64_t v4 = v21;
  }
  return v4;
}

id __76__PBFPosterExtensionDataStoreIntrospector_legacySortedPosterUUIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)legacyAssociatedPosterUUIDForPosterUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(PBFPosterExtensionDataStoreIntrospector *)self legacyAssociatedPosterParentUUIDToChildUUIDWithError:a4];
  uint64_t v8 = [v7 objectForKey:v6];

  return v8;
}

- (id)legacyAssociatedPosterParentUUIDToChildUUIDWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  legacyPosterToAssociatedPoster = self->_legacyPosterToAssociatedPoster;
  if (legacyPosterToAssociatedPoster)
  {
    uint64_t v4 = legacyPosterToAssociatedPoster;
  }
  else
  {
    id v6 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = self;
    obuint64_t j = self->_extensionStoreCoordinators;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v11 = [v10 configurationStoreCoordinatorsWithError:0];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                long long v17 = [v16 objectForKeyedSubscript:@"kConfigurationAssociatedPosterUUIDKey"];
                long long v18 = [v16 posterUUID];
                if (v18) {
                  BOOL v19 = v17 == 0;
                }
                else {
                  BOOL v19 = 1;
                }
                if (!v19) {
                  [v6 setObject:v18 forKeyedSubscript:v17];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }
        }
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }

    uint64_t v20 = [v6 copy];
    uint64_t v21 = v23->_legacyPosterToAssociatedPoster;
    v23->_legacyPosterToAssociatedPoster = (NSDictionary *)v20;

    uint64_t v4 = v23->_legacyPosterToAssociatedPoster;
  }
  return v4;
}

- (id)legacySelectedPosterUUIDWithError:(id *)a3
{
  legacySelectedPosterUUID = self->_legacySelectedPosterUUID;
  if (legacySelectedPosterUUID)
  {
    uint64_t v4 = legacySelectedPosterUUID;
  }
  else
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_switcherSelectedConfigurationURLForDataStoreURL:", self->_dataStoreURL);
    if ([v7 checkResourceIsReachableAndReturnError:0])
    {
      uint64_t v8 = objc_msgSend(v7, "pf_loadFromPlistWithError:", a3);
      uint64_t v9 = objc_opt_class();
      id v10 = v8;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
      id v12 = v11;

      uint64_t v13 = [v12 objectForKey:@"selectedConfigurationIdentifier"];

      if ([v13 length])
      {
        uint64_t v14 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
        id v15 = self->_legacySelectedPosterUUID;
        self->_legacySelectedPosterUUID = v14;
      }
    }
    uint64_t v4 = self->_legacySelectedPosterUUID;
  }
  return v4;
}

- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreIntrospector sortedPosterUUIDsForRole:error:]();
    }
LABEL_19:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D328475CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreIntrospector sortedPosterUUIDsForRole:error:]();
    }
    goto LABEL_19;
  }

  uint64_t v7 = [(NSMutableDictionary *)self->_roleToSortedPosterUUID objectForKeyedSubscript:v6];
  if (!v7)
  {
    if (self->_dataStoreDatabaseExists)
    {
      uint64_t v8 = [(PBFPosterExtensionDataStoreIntrospector *)self _openDatabaseIfPossible:a4];
      uint64_t v7 = [v8 sortedPosterUUIDsForRole:v6 error:a4];
      if (!self->_roleToSortedPosterUUID)
      {
        uint64_t v9 = (NSMutableDictionary *)objc_opt_new();
        roleToSortedPosterUUID = self->_roleToSortedPosterUUID;
        self->_roleToSortedPosterUUID = v9;
      }
      if (v7) {
        [(NSMutableDictionary *)self->_roleToSortedPosterUUID setObject:v7 forKey:v6];
      }
      [v8 invalidate];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  id v11 = v7;

  return v11;
}

- (id)associatedPosterUUIDForPosterUUIDForRole:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    long long v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3284ACCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3284B30);
  }

  roleToParentToChildPosterUUID = self->_roleToParentToChildPosterUUID;
  if (!roleToParentToChildPosterUUID)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v9 = self->_roleToParentToChildPosterUUID;
    self->_roleToParentToChildPosterUUID = v8;

    roleToParentToChildPosterUUID = self->_roleToParentToChildPosterUUID;
  }
  id v10 = [(NSMutableDictionary *)roleToParentToChildPosterUUID objectForKey:v6];

  if (!v10 && self->_dataStoreDatabaseExists)
  {
    long long v29 = self;
    id v11 = [(PBFPosterExtensionDataStoreIntrospector *)self _openDatabaseIfPossible:a4];
    id v12 = [v11 sortedPosterUUIDsForRole:v6 error:a4];
    long long v30 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      uint64_t v16 = *MEMORY[0x1E4F92758];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          BOOL v19 = [v11 attributeForPoster:v18 roleId:v6 attributeId:v16 error:0];
          if ([v19 length])
          {
            id v20 = v6;
            uint64_t v21 = PRPosterRoleAttributeForData();
            v22 = [v21 childPosterUUID];

            if (v22)
            {
              v23 = [v21 childPosterUUID];
              [v30 setObject:v23 forKeyedSubscript:v18];
            }
            id v6 = v20;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    [v11 invalidate];
    v24 = (void *)[v30 copy];
    self = v29;
    [(NSMutableDictionary *)v29->_roleToParentToChildPosterUUID setObject:v24 forKeyedSubscript:v6];
  }
  uint64_t v25 = [(NSMutableDictionary *)self->_roleToParentToChildPosterUUID objectForKeyedSubscript:v6];

  return v25;
}

- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreIntrospector selectedPosterUUIDForRole:error:]();
    }
LABEL_17:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3284CB8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreIntrospector selectedPosterUUIDForRole:error:]();
    }
    goto LABEL_17;
  }

  uint64_t v7 = [(NSMutableDictionary *)self->_roleToSelectedPosterUUID objectForKey:v6];
  if (!v7)
  {
    if (self->_dataStoreDatabaseExists)
    {
      uint64_t v8 = [(PBFPosterExtensionDataStoreIntrospector *)self _openDatabaseIfPossible:a4];
      uint64_t v7 = [v8 selectedPosterUUIDForRole:v6 error:a4];
      roleToSelectedPosterUUID = self->_roleToSelectedPosterUUID;
      if (!roleToSelectedPosterUUID)
      {
        id v10 = (NSMutableDictionary *)objc_opt_new();
        id v11 = self->_roleToSelectedPosterUUID;
        self->_roleToSelectedPosterUUID = v10;

        roleToSelectedPosterUUID = self->_roleToSelectedPosterUUID;
      }
      [(NSMutableDictionary *)roleToSelectedPosterUUID bs_setSafeObject:v7 forKey:v6];
      [v8 invalidate];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  id v12 = v7;

  return v12;
}

- (id)associatedPosterUUIDForRole:(id)a3 parentPosterUUID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(PBFPosterExtensionDataStoreIntrospector *)self associatedPosterUUIDForPosterUUIDForRole:a3 error:a5];
  id v10 = [v9 objectForKey:v8];

  return v10;
}

- (NSSet)snapshotURLs
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  snapshotURLs = self->_snapshotURLs;
  if (snapshotURLs)
  {
    id v3 = snapshotURLs;
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = self->_extensionStoreCoordinators;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __55__PBFPosterExtensionDataStoreIntrospector_snapshotURLs__block_invoke;
          v15[3] = &unk_1E6983E28;
          id v16 = v5;
          objc_msgSend(v11, "pbf_enumerateSnapshotCoordinators:", v15);
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    id v12 = (NSSet *)[v5 copy];
    uint64_t v13 = self->_snapshotURLs;
    self->_snapshotURLs = v12;

    id v3 = self->_snapshotURLs;
  }
  return v3;
}

void __55__PBFPosterExtensionDataStoreIntrospector_snapshotURLs__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 snapshotURLs];
  [v2 unionSet:v3];
}

- (NSSet)roles
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(NSMutableDictionary *)self->_roleToSortedPosterUUID allKeys];
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)snapshotsExist
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  snapshotsExistSentinel = self->_snapshotsExistSentinel;
  if (snapshotsExistSentinel)
  {
    return [(NSNumber *)snapshotsExistSentinel BOOLValue];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v5 enumeratorAtURL:self->_dataStoreExtensionsURL includingPropertiesForKeys:0 options:0 errorHandler:0];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "pbf_isPosterSnapshot", (void)v15))
          {
            id v12 = self->_snapshotsExistSentinel;
            self->_snapshotsExistSentinel = (NSNumber *)MEMORY[0x1E4F1CC38];

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    uint64_t v13 = self->_snapshotsExistSentinel;
    if (!v13)
    {
      self->_snapshotsExistSentinel = (NSNumber *)MEMORY[0x1E4F1CC28];

      uint64_t v13 = self->_snapshotsExistSentinel;
    }
    BOOL v14 = [(NSNumber *)v13 BOOLValue];

    return v14;
  }
}

- (BOOL)descriptorsExist
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  descriptorsExistSentinel = self->_descriptorsExistSentinel;
  if (descriptorsExistSentinel)
  {
    return [(NSNumber *)descriptorsExistSentinel BOOLValue];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = self->_extensionStoreCoordinators;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "dynamicDescriptorStoreCoordinatorsWithError:", 0, (void)v16);
          if ([v11 count])
          {

LABEL_16:
            BOOL v14 = self->_descriptorsExistSentinel;
            self->_descriptorsExistSentinel = (NSNumber *)MEMORY[0x1E4F1CC38];

            goto LABEL_17;
          }
          id v12 = [v10 staticDescriptorStoreCoordinatorsWithError:0];
          uint64_t v13 = [v12 count];

          if (v13) {
            goto LABEL_16;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    long long v15 = self->_descriptorsExistSentinel;
    if (!v15)
    {
      self->_descriptorsExistSentinel = (NSNumber *)MEMORY[0x1E4F1CC28];

      long long v15 = self->_descriptorsExistSentinel;
    }
    return [(NSNumber *)v15 BOOLValue];
  }
}

- (BOOL)userConfigurationDataExists
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  userConfigurationDataExistsSentinel = self->_userConfigurationDataExistsSentinel;
  if (userConfigurationDataExistsSentinel)
  {
    return [(NSNumber *)userConfigurationDataExistsSentinel BOOLValue];
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = self->_extensionStoreCoordinators;
    uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v48;
LABEL_7:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v48 != v27)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v29 = v5;
        uint64_t v7 = *(void **)(*((void *)&v47 + 1) + 8 * v5);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v30 = [v7 configurationStoreCoordinatorsWithError:0];
        uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v32)
        {
          uint64_t v31 = *(void *)v44;
LABEL_12:
          uint64_t v8 = 0;
          while (1)
          {
            if (*(void *)v44 != v31) {
              objc_enumerationMutation(v30);
            }
            uint64_t v33 = v8;
            uint64_t v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v34 = [v9 allPosterPaths];
            uint64_t v10 = [v34 countByEnumeratingWithState:&v39 objects:v52 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v40;
LABEL_17:
              uint64_t v13 = 0;
              while (1)
              {
                if (*(void *)v40 != v12) {
                  objc_enumerationMutation(v34);
                }
                BOOL v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
                long long v15 = [MEMORY[0x1E4F926B0] expectedConfigurationFilesForPath:v14];
                long long v16 = [v14 contentsURL];
                long long v35 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                long long v17 = [MEMORY[0x1E4F28CB8] defaultManager];
                long long v18 = [v17 enumeratorAtURL:v16 includingPropertiesForKeys:0 options:0 errorHandler:0];

                uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v51 count:16];
                if (v19)
                {
                  uint64_t v20 = v19;
                  uint64_t v21 = *(void *)v36;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v20; ++i)
                    {
                      if (*(void *)v36 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      if (([v15 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * i)] & 1) == 0)
                      {
                        v23 = self->_userConfigurationDataExistsSentinel;
                        self->_userConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E4F1CC38];

                        goto LABEL_30;
                      }
                    }
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v51 count:16];
                    if (v20) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_30:

                v24 = self->_userConfigurationDataExistsSentinel;
                if (v24) {
                  break;
                }
                if (++v13 == v11)
                {
                  uint64_t v11 = [v34 countByEnumeratingWithState:&v39 objects:v52 count:16];
                  if (v11) {
                    goto LABEL_17;
                  }
                  break;
                }
              }
            }

            if (self->_userConfigurationDataExistsSentinel) {
              break;
            }
            uint64_t v8 = v33 + 1;
            if (v33 + 1 == v32)
            {
              uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v53 count:16];
              if (v32) {
                goto LABEL_12;
              }
              break;
            }
          }
        }

        if (self->_userConfigurationDataExistsSentinel) {
          break;
        }
        uint64_t v5 = v29 + 1;
        if (v29 + 1 == v28)
        {
          uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v54 count:16];
          if (v28) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    uint64_t v25 = self->_userConfigurationDataExistsSentinel;
    if (!v25)
    {
      self->_userConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E4F1CC28];

      uint64_t v25 = self->_userConfigurationDataExistsSentinel;
    }
    return [(NSNumber *)v25 BOOLValue];
  }
}

- (BOOL)multipleVersionsForConfigurationDataExists
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  multipleVersionsForConfigurationDataExistsSentinel = self->_multipleVersionsForConfigurationDataExistsSentinel;
  if (multipleVersionsForConfigurationDataExistsSentinel)
  {
    return [(NSNumber *)multipleVersionsForConfigurationDataExistsSentinel BOOLValue];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = self->_extensionStoreCoordinators;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
LABEL_7:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = [v9 configurationStoreCoordinatorsWithError:0];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) allPosterPaths];
              unint64_t v16 = [v15 count];

              if (v16 >= 2)
              {
                long long v17 = self->_multipleVersionsForConfigurationDataExistsSentinel;
                self->_multipleVersionsForConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E4F1CC38];

                goto LABEL_20;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_20:

        if (self->_multipleVersionsForConfigurationDataExistsSentinel) {
          break;
        }
        if (++v8 == v6)
        {
          uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v6) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    long long v18 = self->_multipleVersionsForConfigurationDataExistsSentinel;
    if (!v18)
    {
      self->_multipleVersionsForConfigurationDataExistsSentinel = (NSNumber *)MEMORY[0x1E4F1CC28];

      long long v18 = self->_multipleVersionsForConfigurationDataExistsSentinel;
    }
    return [(NSNumber *)v18 BOOLValue];
  }
}

- (BOOL)legacyAssocPostersExist
{
  legacyPosterToAssociatedPoster = self->_legacyPosterToAssociatedPoster;
  if (!legacyPosterToAssociatedPoster)
  {
    uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [(PBFPosterExtensionDataStoreIntrospector *)self legacyAssociatedPosterUUIDForPosterUUID:v4 error:0];

    legacyPosterToAssociatedPoster = self->_legacyPosterToAssociatedPoster;
  }
  return [(NSDictionary *)legacyPosterToAssociatedPoster count] != 0;
}

- (BOOL)assocPostersExist
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_dataStoreDatabaseExists) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = PFPosterRolesSupportedForCurrentDeviceClass();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[PBFPosterExtensionDataStoreIntrospector associatedPosterUUIDForPosterUUIDForRole:error:](self, "associatedPosterUUIDForPosterUUIDForRole:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        uint64_t v9 = [v8 count];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (id)_openDatabaseIfPossible:(id *)a3
{
  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_dataStoreDatabaseURL, "checkResourceIsReachableAndReturnError:"))
  {
    uint64_t v5 = [[PBFPosterExtensionDataStoreSQLiteDatabase alloc] initWithURL:self->_dataStoreDatabaseURL options:4 error:a3];
    uint64_t v6 = v5;
    if (v5
      && [(PBFPosterExtensionDataStoreSQLiteDatabase *)v5 validateDatabaseWithError:a3])
    {
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)_hydrate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PBFPosterExtensionDataStoreIntrospector *)self legacySortedPosterUUIDsWithError:0];
  id v4 = [(PBFPosterExtensionDataStoreIntrospector *)self legacySelectedPosterUUIDWithError:0];
  id v5 = [(PBFPosterExtensionDataStoreIntrospector *)self legacyAssociatedPosterParentUUIDToChildUUIDWithError:0];
  if (self->_dataStoreDatabaseExists)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = PFPosterRolesSupportedForCurrentDeviceClass();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v12 = -[PBFPosterExtensionDataStoreIntrospector sortedPosterUUIDsForRole:error:](self, "sortedPosterUUIDsForRole:error:", v11, 0, (void)v16);
          id v13 = [(PBFPosterExtensionDataStoreIntrospector *)self selectedPosterUUIDForRole:v11 error:0];
          id v14 = [(PBFPosterExtensionDataStoreIntrospector *)self associatedPosterUUIDForPosterUUIDForRole:v11 error:0];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  [(PBFPosterExtensionDataStoreIntrospector *)self snapshotsExist];
  [(PBFPosterExtensionDataStoreIntrospector *)self descriptorsExist];
  [(PBFPosterExtensionDataStoreIntrospector *)self userConfigurationDataExists];
  [(PBFPosterExtensionDataStoreIntrospector *)self multipleVersionsForConfigurationDataExists];
  id v15 = [(PBFPosterExtensionDataStoreIntrospector *)self snapshotURLs];
  [(PBFPosterExtensionDataStoreIntrospector *)self assocPostersExist];
  [(PBFPosterExtensionDataStoreIntrospector *)self legacyAssocPostersExist];
}

- (NSSet)providers
{
  return self->_providers;
}

- (unint64_t)dataStoreVersion
{
  return self->_dataStoreVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_multipleVersionsForConfigurationDataExistsSentinel, 0);
  objc_storeStrong((id *)&self->_userConfigurationDataExistsSentinel, 0);
  objc_storeStrong((id *)&self->_descriptorsExistSentinel, 0);
  objc_storeStrong((id *)&self->_snapshotsExistSentinel, 0);
  objc_storeStrong((id *)&self->_posterToAssociatedPoster, 0);
  objc_storeStrong((id *)&self->_latestPathsForProviders, 0);
  objc_storeStrong((id *)&self->_snapshotURLs, 0);
  objc_storeStrong((id *)&self->_roleToParentToChildPosterUUID, 0);
  objc_storeStrong((id *)&self->_roleToSortedPosterUUID, 0);
  objc_storeStrong((id *)&self->_roleToSelectedPosterUUID, 0);
  objc_storeStrong((id *)&self->_legacyPosterToAssociatedPoster, 0);
  objc_storeStrong((id *)&self->_legacySelectedPosterUUID, 0);
  objc_storeStrong((id *)&self->_legacySortedPosterUUIDs, 0);
  objc_storeStrong((id *)&self->_dataStoreDatabaseURL, 0);
  objc_storeStrong((id *)&self->_dataStoreExtensionsURL, 0);
  objc_storeStrong((id *)&self->_dataStoreURL, 0);
  objc_storeStrong((id *)&self->_extensionStoreCoordinators, 0);
}

- (void)sortedPosterUUIDsForRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)associatedPosterUUIDForPosterUUIDForRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)selectedPosterUUIDForRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end