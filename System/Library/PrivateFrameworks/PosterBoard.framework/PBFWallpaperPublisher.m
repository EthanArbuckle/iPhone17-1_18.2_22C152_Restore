@interface PBFWallpaperPublisher
- (BOOL)_updatePath:(id)a3 addingIfNotExists:(BOOL)a4;
- (PBFWallpaperPublisher)init;
- (PBFWallpaperPublisherDelegate)delegate;
- (unint64_t)_update;
- (void)_compact;
- (void)_updateSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6;
- (void)activatePublishingOfCollectionsForRole:(id)a3;
- (void)activatePublishingOfRoles:(id)a3;
- (void)activateWithSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6 recentlyChanged:(BOOL)a7;
- (void)issuePosterCollectionUpdate:(id)a3;
- (void)issueUpdateForRoles:(id)a3;
- (void)noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateHomePath:(id)a3 matchingLockPath:(id)a4;
- (void)updatePath:(id)a3;
- (void)updateSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6;
- (void)wallpaperPublisherDidReceiveObserverConnection;
@end

@implementation PBFWallpaperPublisher

- (PBFWallpaperPublisher)init
{
  v10.receiver = self;
  v10.super_class = (Class)PBFWallpaperPublisher;
  v2 = [(PBFWallpaperPublisher *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    wallpaperPublisher = v2->_wallpaperPublisher;
    v2->_wallpaperPublisher = (PRSWallpaperPublisher *)v3;

    [(PRSWallpaperPublisher *)v2->_wallpaperPublisher setDelegate:v2];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
    pathsByUUID = v2->_pathsByUUID;
    v2->_pathsByUUID = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    isPairedByUUID = v2->_isPairedByUUID;
    v2->_isPairedByUUID = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (BOOL)_updatePath:(id)a3 addingIfNotExists:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = [v6 identity];
    v9 = [v8 posterUUID];
    objc_super v10 = [(NSMutableDictionary *)self->_pathsByUUID objectForKey:v9];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 identity];
      int v4 = [v8 isNewerVersionOfIdentity:v12];
      if (v4)
      {
        [(NSMutableDictionary *)self->_pathsByUUID setObject:v7 forKey:v9];
        [(NSMutableDictionary *)self->_isPairedByUUID removeObjectForKey:v9];
      }
    }
    else if (v4)
    {
      [(NSMutableDictionary *)self->_pathsByUUID setObject:v7 forKey:v9];
      LOBYTE(v4) = 1;
    }

    return v4;
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFWallpaperPublisher _updatePath:addingIfNotExists:]();
    }
    [v14 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_compact
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA80];
  int v4 = [(NSMutableDictionary *)self->_pathsByUUID allKeys];
  id v15 = [v3 setWithArray:v4];

  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = [(NSMutableDictionary *)self->_isPairedByUUID allKeys];
  uint64_t v7 = [v5 setWithArray:v6];

  for (uint64_t i = 0; i != 4; ++i)
  {
    v9 = [(PFServerPosterPath *)self->_paths[i] identity];
    objc_super v10 = [v9 posterUUID];

    [v15 removeObject:v10];
    [v7 removeObject:v10];
  }
  pathsByUUID = self->_pathsByUUID;
  v12 = [v15 allObjects];
  [(NSMutableDictionary *)pathsByUUID removeObjectsForKeys:v12];

  isPairedByUUID = self->_isPairedByUUID;
  v14 = [v7 allObjects];
  [(NSMutableDictionary *)isPairedByUUID removeObjectsForKeys:v14];
}

- (void)_updateSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v31 = v10;
  id v32 = v31;
  id v30 = v11;
  id v33 = v30;
  id v29 = v12;
  id v34 = v29;
  id v14 = v13;
  uint64_t v15 = 0;
  int v16 = 0;
  id v35 = v14;
  do
  {
    uint64_t v17 = *(uint64_t *)((char *)&v32 + v15);
    if (v17) {
      v16 |= -[PBFWallpaperPublisher _updatePath:addingIfNotExists:](self, "_updatePath:addingIfNotExists:", v17, 1, v29, v30, v31, v32, v33, v34, v35, v36);
    }
    v15 += 8;
  }
  while (v15 != 32);
  uint64_t v18 = 0;
  paths = self->_paths;
  do
  {
    v20 = *(id *)((char *)&v32 + v18 * 8);
    pathsByUUID = self->_pathsByUUID;
    if (v20)
    {
      v22 = [*(id *)((char *)&v32 + v18 * 8) identity];
      v23 = [v22 posterUUID];
      uint64_t v24 = [(NSMutableDictionary *)pathsByUUID objectForKey:v23];
    }
    else
    {
      v22 = [(PFServerPosterPath *)self->_paths[v18] identity];
      v23 = [v22 posterUUID];
      uint64_t v24 = [(NSMutableDictionary *)pathsByUUID objectForKey:v23];
    }

    *(id *)((char *)&v32 + v18 * 8) = (id)v24;
    ++v18;
  }
  while (v18 != 4);
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  do
  {
    v27 = (PFServerPosterPath *)*(&v32 + v25);
    if (*paths != v27)
    {
      v26 |= PRSWallpaperObserverLocationsFromIndex();
      objc_storeStrong((id *)paths, v27);
    }
    ++v25;
    ++paths;
  }
  while (v25 != 4);
  if (v16) {
    [(PBFWallpaperPublisher *)self _compact];
  }
  if (v26 && [(PBFWallpaperPublisher *)self _update]) {
    [(PRSWallpaperPublisher *)self->_wallpaperPublisher updatePaths:self->_lastSentPaths];
  }
  for (uint64_t i = 24; i != -8; i -= 8)
}

- (unint64_t)_update
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  paths = self->_paths;
  lastSentPaths = self->_lastSentPaths;
  do
  {
    int v6 = PRSWallpaperObserverLocationsLockIndexIfHomeIndex();
    if (PRSWallpaperObserverLocationsIndexIsValid())
    {
      uint64_t v7 = paths[v6];
      v8 = [(PFServerPosterPath *)v7 identity];
      v9 = [v8 posterUUID];

      id v10 = [(NSMutableDictionary *)self->_isPairedByUUID objectForKey:v9];
      if (!v10)
      {
        id v20 = 0;
        id v11 = [MEMORY[0x1E4F926B0] loadHomeScreenConfigurationForPath:v7 error:&v20];
        id v12 = v20;
        if (v12)
        {
          id v13 = PRSLogObserver();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = (objc_class *)objc_opt_class();
            uint64_t v18 = NSStringFromClass(v15);
            uint64_t v17 = [(PFServerPosterPath *)v7 identity];
            *(_DWORD *)buf = 138544130;
            v22 = v18;
            __int16 v23 = 2048;
            uint64_t v24 = self;
            __int16 v25 = 2112;
            uint64_t v26 = v17;
            __int16 v27 = 2114;
            id v28 = v12;
            _os_log_error_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_ERROR, "<%{public}@:%p> failed to load homeConfig for %@ with error: %{public}@", buf, 0x2Au);
          }
        }
        id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "selectedAppearanceType", v17) == 3);
        [(NSMutableDictionary *)self->_isPairedByUUID setObject:v10 forKey:v9];
      }
      if ([v10 BOOLValue]) {
        int v14 = v2;
      }
      else {
        int v14 = v6;
      }
    }
    else
    {
      int v14 = v2;
    }
    if (*lastSentPaths != paths[v14])
    {
      v3 |= PRSWallpaperObserverLocationsFromIndex();
      objc_storeStrong((id *)lastSentPaths, paths[v14]);
    }
    ++v2;
    ++lastSentPaths;
  }
  while (v2 != 4);
  return v3;
}

- (void)activateWithSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6 recentlyChanged:(BOOL)a7
{
  BOOL v42 = a7;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"selectedLockPath"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322DD44);
  }
  if (!v12)
  {
    uint64_t v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"selectedHomePath"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322DDA8);
  }
  if (!v13)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activeLockPath"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:]();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322DE0CLL);
  }
  uint64_t v15 = v14;
  if (!v14)
  {
    v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activeHomePath"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFWallpaperPublisher activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:].cold.4();
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322DE70);
  }
  int v16 = PRSLogObserver();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v17);
    v39 = PRSWallpaperObserverLocationsDescription();
    uint64_t v18 = [v11 identity];
    v19 = [v12 identity];
    [v13 identity];
    id v20 = v41 = v13;
    v21 = [v15 identity];
    *(_DWORD *)buf = 138544898;
    *(void *)&uint8_t buf[4] = v40;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    id v44 = v39;
    __int16 v45 = 2114;
    v46 = v18;
    __int16 v47 = 2114;
    v48 = v19;
    __int16 v49 = 2114;
    v50 = v20;
    __int16 v51 = 2114;
    v52 = v21;
    _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received activation with recentlyChanged=(%{public}@) {\n\tsl=%{public}@\n\tsh=%{public}@\n\tal=%{public}@\n\tah=%{public}@\n}", buf, 0x48u);

    id v13 = v41;
  }

  id v22 = v11;
  *(void *)buf = v22;
  id v23 = v12;
  *(void *)&buf[8] = v23;
  id v24 = v13;
  *(void *)&buf[16] = v24;
  id v25 = v15;
  uint64_t v26 = 0;
  id v44 = v25;
  do
  {
    [(PBFWallpaperPublisher *)self _updatePath:*(void *)&buf[v26] addingIfNotExists:1];
    v26 += 8;
  }
  while (v26 != 32);
  for (uint64_t i = 0; i != 4; ++i)
  {
    pathsByUUID = self->_pathsByUUID;
    uint64_t v29 = [*(id *)&buf[i * 8] identity];
    id v30 = [v29 posterUUID];
    id v31 = [(NSMutableDictionary *)pathsByUUID objectForKey:v30];
    id v32 = self->_paths[i];
    self->_paths[i] = v31;
  }
  [(PBFWallpaperPublisher *)self _update];
  if (v42) {
    uint64_t v33 = 15;
  }
  else {
    uint64_t v33 = 0;
  }
  [(PRSWallpaperPublisher *)self->_wallpaperPublisher initializeWithPaths:self->_lastSentPaths recentlyChanged:v33];
  for (uint64_t j = 24; j != -8; j -= 8)
}

- (void)updateSelectedLockPath:(id)a3 selectedHomePath:(id)a4 activeLockPath:(id)a5 activeHomePath:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = PRSLogObserver();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    int v16 = NSStringFromClass(v15);
    uint64_t v17 = [v10 identity];
    [v11 identity];
    uint64_t v18 = v21 = self;
    v19 = [v12 identity];
    id v20 = [v13 identity];
    *(_DWORD *)buf = 138544642;
    id v23 = v16;
    __int16 v24 = 2048;
    id v25 = v21;
    __int16 v26 = 2114;
    __int16 v27 = v17;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    __int16 v30 = 2114;
    id v31 = v19;
    __int16 v32 = 2114;
    uint64_t v33 = v20;
    _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received multi-update {\n\tsl=%{public}@\n\tsh=%{public}@\n\tal=%{public}@\n\tah=%{public}@\n}", buf, 0x3Eu);

    self = v21;
  }

  [(PBFWallpaperPublisher *)self _updateSelectedLockPath:v10 selectedHomePath:v11 activeLockPath:v12 activeHomePath:v13];
}

- (void)updatePath:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFWallpaperPublisher updatePath:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322E2A0);
  }
  uint64_t v5 = v4;
  int v6 = PRSLogObserver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v5 identity];
    *(_DWORD *)buf = 138543874;
    id v23 = v8;
    __int16 v24 = 2048;
    id v25 = self;
    __int16 v26 = 2114;
    __int16 v27 = v9;
    _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received single-update with %{public}@", buf, 0x20u);
  }
  pathsByUUID = self->_pathsByUUID;
  id v11 = [v5 identity];
  id v12 = [v11 posterUUID];
  id v13 = [(NSMutableDictionary *)pathsByUUID objectForKey:v12];

  if (v13)
  {
    if (![(PBFWallpaperPublisher *)self _updatePath:v5 addingIfNotExists:0])
    {
      id v14 = v13;

      uint64_t v5 = v14;
    }
    uint64_t v15 = [v5 identity];
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    paths = self->_paths;
    do
    {
      v19 = [(PFServerPosterPath *)*paths identity];
      int v20 = [v15 isNewerVersionOfIdentity:v19];

      if (v20)
      {
        v17 |= PRSWallpaperObserverLocationsFromIndex();
        objc_storeStrong((id *)paths, v5);
      }
      ++v16;
      ++paths;
    }
    while (v16 != 4);
    if (v17 && [(PBFWallpaperPublisher *)self _update]) {
      [(PRSWallpaperPublisher *)self->_wallpaperPublisher updatePaths:self->_lastSentPaths];
    }
  }
}

- (void)updateHomePath:(id)a3 matchingLockPath:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    __int16 v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"lockPath"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFWallpaperPublisher updateHomePath:matchingLockPath:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322E508);
  }
  v8 = v7;
  v9 = PRSLogObserver();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = [v6 identity];
    id v13 = [v8 identity];
    *(_DWORD *)buf = 138544130;
    uint64_t v29 = v11;
    __int16 v30 = 2048;
    id v31 = self;
    __int16 v32 = 2114;
    uint64_t v33 = v12;
    __int16 v34 = 2114;
    id v35 = v13;
    _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> received pairing-update {\n\thomePath=%{public}@\n\tmatchingLockPath=%{public}@\n}", buf, 0x2Au);
  }
  id v14 = [v8 identity];
  uint64_t v15 = [v14 posterUUID];
  uint64_t v16 = [(PFServerPosterPath *)self->_paths[0] identity];
  uint64_t v17 = [v16 posterUUID];
  int v18 = [v15 isEqual:v17];

  v19 = [(PFServerPosterPath *)self->_paths[2] identity];
  int v20 = [v19 posterUUID];
  int v21 = [v15 isEqual:v20];

  if ((v18 & 1) != 0 || v21)
  {
    if (v6) {
      id v22 = v6;
    }
    else {
      id v22 = v8;
    }
    if (v18) {
      id v23 = v8;
    }
    else {
      id v23 = 0;
    }
    if (v18) {
      id v24 = v22;
    }
    else {
      id v24 = 0;
    }
    if (v21) {
      id v25 = v8;
    }
    else {
      id v25 = 0;
    }
    if (v21) {
      id v26 = v22;
    }
    else {
      id v26 = 0;
    }
    [(PBFWallpaperPublisher *)self _updateSelectedLockPath:v23 selectedHomePath:v24 activeLockPath:v25 activeHomePath:v26];
  }
}

- (void)noteSnapshotUpdateForPath:(id)a3 snapshotType:(id)a4
{
}

- (void)issueUpdateForRoles:(id)a3
{
}

- (void)activatePublishingOfRoles:(id)a3
{
}

- (void)activatePublishingOfCollectionsForRole:(id)a3
{
}

- (void)issuePosterCollectionUpdate:(id)a3
{
}

- (void)wallpaperPublisherDidReceiveObserverConnection
{
}

- (PBFWallpaperPublisherDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_isPairedByUUID, 0);
  objc_storeStrong((id *)&self->_pathsByUUID, 0);
  for (uint64_t i = 72; i != 40; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 8);
  objc_storeStrong((id *)&self->_wallpaperPublisher, 0);
}

- (void)_updatePath:addingIfNotExists:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activateWithSelectedLockPath:selectedHomePath:activeLockPath:activeHomePath:recentlyChanged:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatePath:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateHomePath:matchingLockPath:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end