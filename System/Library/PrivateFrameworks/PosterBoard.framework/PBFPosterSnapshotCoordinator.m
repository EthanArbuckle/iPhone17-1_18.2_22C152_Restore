@interface PBFPosterSnapshotCoordinator
- (BOOL)hasSnapshots;
- (BOOL)snapshotExistsForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5;
- (NSSet)snapshotURLs;
- (PBFPosterSnapshotCoordinator)initWithPath:(id)a3;
- (PFServerPosterPath)path;
- (id)_lock_ingestImageAtURL:(id)a3 forDefinition:(id)a4 configuredProperties:(id)a5 context:(id)a6;
- (id)_lock_removeSnapshotsAtURLs:(id)a3 checkIfOwner:(BOOL)a4;
- (id)_lock_snapshotURLs:(BOOL)a3;
- (id)removeSnapshotsAtURLs:(id)a3;
- (id)snapshotReservationForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5;
- (id)snapshotURLForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)ingestSnapshotsByDefinition:(id)a3 path:(id)a4 configuredProperties:(id)a5 context:(id)a6;
- (void)ingestSnapshotsFromCoordinator:(id)a3;
- (void)removeAllSnapshots;
@end

@implementation PBFPosterSnapshotCoordinator

- (PBFPosterSnapshotCoordinator)initWithPath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBFPosterSnapshotCoordinator;
  v6 = [(PBFPosterSnapshotCoordinator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_definitionToSnapshotReservationMap = v7->_lock_definitionToSnapshotReservationMap;
    v7->_lock_definitionToSnapshotReservationMap = (NSMapTable *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(PBFPosterSnapshotCoordinator *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterSnapshotCoordinator;
  [(PBFPosterSnapshotCoordinator *)&v3 dealloc];
}

- (BOOL)hasSnapshots
{
  v2 = [(NSMapTable *)self->_lock_definitionToSnapshotReservationMap objectEnumerator];
  objc_super v3 = [v2 allObjects];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)snapshotReservationForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  NSClassFromString(&cfstr_Pbfpostersnaps_5.isa);
  if (!v11)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:]();
    }
LABEL_31:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325EC98);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325ECFCLL);
  }

  id v12 = v9;
  v13 = [(PFServerPosterPath *)self->_path serverIdentity];
  uint64_t v14 = [v13 type];

  if (v12 || v14 != 3)
  {
    NSClassFromString(&cfstr_Prposterconfig_0.isa);
    if (!v12)
    {
      v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.4();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D325EE28);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:].cold.4();
      }
      goto LABEL_31;
    }
  }

  id v15 = v10;
  if (!v15)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325ED60);
  }
  v16 = v15;
  if (([v15 conformsToProtocol:&unk_1F2AE68B8] & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotReservationForDefinition:configuredProperties:context:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325EDC4);
  }

  os_unfair_lock_lock(&self->_lock);
  v17 = [(NSMapTable *)self->_lock_definitionToSnapshotReservationMap objectForKey:v11];
  v18 = [(PBFPosterSnapshotCoordinator *)self snapshotURLForDefinition:v11 configuredProperties:v12 context:v16];
  v19 = [v17 objectForKey:v18];
  if (!v19)
  {
    v19 = [(PBFPosterSnapshotCoordinator *)self _lock_ingestImageAtURL:v18 forDefinition:v11 configuredProperties:v12 context:v16];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v19;
}

- (void)ingestSnapshotsByDefinition:(id)a3 path:(id)a4 configuredProperties:(id)a5 context:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  id v15 = [(PFServerPosterPath *)self->_path serverIdentity];
  uint64_t v16 = [v15 type];

  if (v14 || v16 != 3)
  {
    NSClassFromString(&cfstr_Prposterconfig_0.isa);
    if (!v14)
    {
      v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:].cold.4();
      }
      [v33 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D325F260);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:].cold.4();
      }
      [v34 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D325F2C4);
    }
  }

  id v17 = v13;
  if (!v17)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325F134);
  }
  v18 = v17;
  if (([v17 conformsToProtocol:&unk_1F2AE68B8] & 1) == 0)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325F198);
  }

  v19 = [v11 identity];
  v20 = [(PFServerPosterPath *)self->_path identity];
  char v21 = [v19 isEqual:v20];

  if ((v21 & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[path identity] isEqual:[_path identity]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator ingestSnapshotsByDefinition:path:configuredProperties:context:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325F1FCLL);
  }
  v35 = v11;
  os_unfair_lock_lock(&self->_lock);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = v10;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v28 = [v22 objectForKeyedSubscript:v27];
        if ([v28 checkResourceIsReachableAndReturnError:0]) {
          id v29 = [(PBFPosterSnapshotCoordinator *)self _lock_ingestImageAtURL:v28 forDefinition:v27 configuredProperties:v14 context:v18];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v24);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)ingestSnapshotsFromCoordinator:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = [a3 path];
  uint64_t v4 = [v16 instanceURL];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  os_unfair_lock_lock(&self->_lock);
  id v15 = (void *)v4;
  v6 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:21 error:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        if (objc_msgSend(v11, "pbf_isPosterSnapshot"))
        {
          id v12 = [(PFServerPosterPath *)self->_path instanceURL];
          id v13 = [v11 lastPathComponent];
          id v14 = [v12 URLByAppendingPathComponent:v13];

          [v5 copyItemAtURL:v11 toURL:v14 error:0];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)snapshotExistsForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  NSClassFromString(&cfstr_Pbfpostersnaps_5.isa);
  if (!v11)
  {
    uint64_t v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_42:
    JUMPOUT(0x1D325F6BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325F720);
  }

  id v12 = v9;
  id v13 = [(PFServerPosterPath *)self->_path serverIdentity];
  uint64_t v14 = [v13 type];

  if (v12 || v14 != 3)
  {
    NSClassFromString(&cfstr_Prposterconfig_0.isa);
    if (!v12)
    {
      v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.5();
      }
      [v31 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D325F84CLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:].cold.5();
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D325F8B0);
    }
  }

  id v15 = v10;
  if (!v15)
  {
    id v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325F784);
  }
  uint64_t v16 = v15;
  if (([v15 conformsToProtocol:&unk_1F2AE68B8] & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFDisplayContext)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D325F7E8);
  }

  long long v17 = [(PBFPosterSnapshotCoordinator *)self snapshotReservationForDefinition:v11 configuredProperties:v12 context:v16];
  long long v18 = [v17 error];

  if (v18
    || ([v17 URL],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v19 checkResourceIsReachableAndReturnError:0],
        v19,
        !v20))
  {
    BOOL v25 = 0;
    goto LABEL_20;
  }
  id v34 = 0;
  char v21 = [v17 fetchImageWithError:&v34];
  id v22 = v34;
  if ((v21 == 0) != (v22 != 0))
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"(fetchedImage && !error) || (!fetchedImage && error)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotCoordinator snapshotExistsForDefinition:configuredProperties:context:]();
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_42;
  }
  uint64_t v23 = v22;
  if (v22) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = v21 == 0;
  }
  BOOL v25 = !v24;

LABEL_20:
  return v25;
}

- (id)snapshotURLForDefinition:(id)a3 configuredProperties:(id)a4 context:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_snapshotURLForPath:definition:configuredProperties:context:", self->_path, a3, a4, a5);
}

- (void)removeAllSnapshots
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(PBFPosterSnapshotCoordinator *)self _lock_snapshotURLs:0];
  id v5 = [(PBFPosterSnapshotCoordinator *)self _lock_removeSnapshotsAtURLs:v4 checkIfOwner:0];

  os_unfair_lock_unlock(p_lock);
}

- (id)removeSnapshotsAtURLs:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(PBFPosterSnapshotCoordinator *)self _lock_removeSnapshotsAtURLs:v5 checkIfOwner:1];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSSet)snapshotURLs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(PBFPosterSnapshotCoordinator *)self _lock_snapshotURLs:1];
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)[v4 copy];

  return (NSSet *)v5;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_lock_definitionToSnapshotReservationMap removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_ingestImageAtURL:(id)a3 forDefinition:(id)a4 configuredProperties:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(PBFPosterSnapshotCoordinator *)self snapshotURLForDefinition:v11 configuredProperties:a5 context:v12];
  uint64_t v14 = 0;
  if ([v13 checkResourceIsReachableAndReturnError:0])
  {
    id v15 = [(NSMapTable *)self->_lock_definitionToSnapshotReservationMap objectForKey:v11];
    uint64_t v14 = [[PBFPosterSnapshotReservation alloc] initWithURL:v10 displayContext:v12 image:0 error:0];
    if (!v15)
    {
      id v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      [(NSMapTable *)self->_lock_definitionToSnapshotReservationMap setObject:v15 forKey:v11];
    }
    [v15 setObject:v14 forKey:v13];
  }
  return v14;
}

- (id)_lock_snapshotURLs:(BOOL)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [(PFServerPosterPath *)self->_path instanceURL];
  uint64_t v7 = *MEMORY[0x1E4F1C5C0];
  v27[0] = *MEMORY[0x1E4F1C5C0];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v9 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:v8 options:20 errorHandler:&__block_literal_global_20];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    uint64_t v14 = *MEMORY[0x1E4F1C5D0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v21 = 0;
        [v16 getResourceValue:&v21 forKey:v7 error:0];
        id v17 = v21;
        if ([v17 isEqualToString:v14]
          && objc_msgSend(v16, "pbf_isPosterSnapshot"))
        {
          long long v18 = [v16 URLByStandardizingPath];
          [v4 addObject:v18];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  long long v19 = (void *)[v4 copy];
  return v19;
}

uint64_t __51__PBFPosterSnapshotCoordinator__lock_snapshotURLs___block_invoke()
{
  return 1;
}

- (id)_lock_removeSnapshotsAtURLs:(id)a3 checkIfOwner:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  if ([v30 count])
  {
    id v34 = self;
    v6 = [(PFServerPosterPath *)self->_path instanceURL];
    v35 = [v6 path];

    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__7;
    v53 = __Block_byref_object_dispose__7;
    id v54 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke;
    aBlock[3] = &unk_1E69834C8;
    aBlock[4] = &v49;
    uint64_t v7 = (void (**)(void *, void))_Block_copy(aBlock);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v8 = v30;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          if (v4)
          {
            uint64_t v13 = [*(id *)(*((void *)&v44 + 1) + 8 * i) path];
            char v14 = [v13 hasPrefix:v35];

            if ((v14 & 1) == 0) {
              continue;
            }
          }
          v7[2](v7, v12);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v9);
    }

    if ([(id)v50[5] count])
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v15 = (void *)[(NSMapTable *)v34->_lock_definitionToSnapshotReservationMap copy];
      obuint64_t j = [v15 keyEnumerator];

      uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
      id v17 = v34;
      if (v16)
      {
        uint64_t v32 = *(void *)v41;
        do
        {
          uint64_t v33 = v16;
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v41 != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * j);
            int v20 = [(NSMapTable *)v17->_lock_definitionToSnapshotReservationMap objectForKey:v19];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v21 = (void *)[v20 copy];
            long long v22 = [v21 keyEnumerator];

            uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v55 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v37;
              do
              {
                for (uint64_t k = 0; k != v23; ++k)
                {
                  if (*(void *)v37 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * k);
                  if ([(id)v50[5] containsObject:v26])
                  {
                    uint64_t v27 = [v20 objectForKey:v26];
                    [v27 cancel];
                    [v20 removeObjectForKey:v26];
                  }
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v55 count:16];
              }
              while (v23);
            }

            if (![v20 count]) {
              [(NSMapTable *)v34->_lock_definitionToSnapshotReservationMap removeObjectForKey:v19];
            }

            id v17 = v34;
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
        }
        while (v16);
      }
    }
    id v28 = (id)v50[5];

    _Block_object_dispose(&v49, 8);
  }
  else
  {
    id v28 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v28;
}

uint64_t __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  uint64_t v5 = [v4 removeItemAtURL:v3 error:&v13];
  id v6 = v13;

  +[PBFPosterSnapshotReservation noteSnapshotWasReaped:v3];
  if (v5)
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v7)
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v7 addObject:v3];
    uint64_t v11 = PBFLogReaper();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v3;
      _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "Reaped snapshot: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = PBFLogReaper();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke_cold_1((uint64_t)v3, (uint64_t)v6, v11);
    }
  }

  return v5;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_definitionToSnapshotReservationMap, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)snapshotReservationForDefinition:configuredProperties:context:.cold.1()
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

- (void)snapshotReservationForDefinition:configuredProperties:context:.cold.2()
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

- (void)snapshotReservationForDefinition:configuredProperties:context:.cold.4()
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

- (void)ingestSnapshotsByDefinition:path:configuredProperties:context:.cold.1()
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

- (void)ingestSnapshotsByDefinition:path:configuredProperties:context:.cold.2()
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

- (void)ingestSnapshotsByDefinition:path:configuredProperties:context:.cold.4()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.1()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.2()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.3()
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

- (void)snapshotExistsForDefinition:configuredProperties:context:.cold.5()
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

void __73__PBFPosterSnapshotCoordinator__lock_removeSnapshotsAtURLs_checkIfOwner___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "Failed to reap snapshot '%{public}@': %{public}@", (uint8_t *)&v3, 0x16u);
}

@end