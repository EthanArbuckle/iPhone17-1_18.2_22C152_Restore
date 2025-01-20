@interface PBFPosterExtensionDataStoreSQLiteDatabase
- (BOOL)checkIfPosterUUIDs:(id)a3 belongToRole:(id)a4 error:(id *)a5;
- (BOOL)checkpointWALOnInvalidate;
- (BOOL)performChanges:(id)a3 error:(id *)a4;
- (BOOL)validateDatabaseWithError:(id *)a3;
- (NSURL)URL;
- (PBFPosterExtensionDataStoreSQLiteDatabase)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)attributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 error:(id *)a6;
- (id)attributeIdentifiersForPoster:(id)a3 roleId:(id)a4 error:(id *)a5;
- (id)attributesForPoster:(id)a3 roleId:(id)a4 attributeIdentifiers:(id)a5 error:(id *)a6;
- (id)dataStoreMetadataWithError:(id *)a3;
- (id)extensionIdentifierForPosterUUID:(id)a3 error:(id *)a4;
- (id)extensionIdentifiersForRole:(id)a3 error:(id *)a4;
- (id)posterUUIDsForExtensionIdentifier:(id)a3 role:(id)a4 error:(id *)a5;
- (id)roleDisplayNamesForIdentifiers:(id)a3 error:(id *)a4;
- (id)roleIdentifiersWithError:(id *)a3;
- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4;
- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4;
- (id)underlyingReadonlyDatabaseConnection;
- (unint64_t)options;
- (unint64_t)version;
- (void)cancel;
- (void)invalidate;
- (void)setCheckpointWALOnInvalidate:(BOOL)a3;
@end

@implementation PBFPosterExtensionDataStoreSQLiteDatabase

- (PBFPosterExtensionDataStoreSQLiteDatabase)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v46 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"databaseURL"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreSQLiteDatabase initWithURL:options:error:]();
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D327CD80);
  }
  v9 = v8;
  v61.receiver = self;
  v61.super_class = (Class)PBFPosterExtensionDataStoreSQLiteDatabase;
  v10 = [(PBFPosterExtensionDataStoreSQLiteDatabase *)&v61 init];
  if (!v10) {
    goto LABEL_45;
  }
  uint64_t v11 = [v9 copy];
  URL = v10->_URL;
  v10->_URL = (NSURL *)v11;

  v10->_options = a4;
  [(PBFPosterExtensionDataStoreSQLiteDatabase *)v10 setCheckpointWALOnInvalidate:1];
  v10->_lock._os_unfair_lock_opaque = 0;
  v10->_readwriteLock._os_unfair_lock_opaque = 0;
  v13 = (void *)MEMORY[0x1E4F1CB10];
  v14 = [v9 path];
  v15 = [v14 stringByAppendingString:@"-shm"];
  v16 = [v13 fileURLWithPath:v15];

  v17 = (void *)MEMORY[0x1E4F1CB10];
  v18 = [v9 path];
  v19 = [v18 stringByAppendingString:@"-wal"];
  v20 = [v17 fileURLWithPath:v19];

  v50 = v10;
  v47 = a5;
  if ((a4 & 0xA) != 0)
  {
    v21 = [_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc];
    if ((a4 & 2) != 0) {
      unsigned int v22 = 6;
    }
    else {
      unsigned int v22 = 2;
    }
    if ((a4 & 4) != 0) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v22;
    }
    id v60 = 0;
    v24 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)v21 initWithURL:v9 options:v23 error:&v60];
    id v25 = v60;
    id v26 = v25;
    if (((a4 & 8) != 0 || (a4 & 2) != 0) && !v25)
    {
      uint64_t v27 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)v24 setup];

      id v26 = (id)v27;
    }
    goto LABEL_20;
  }
  if ((a4 & 4) != 0)
  {
    if (![v16 checkResourceIsReachableAndReturnError:0]
      || (id v26 = 0, ([v20 checkResourceIsReachableAndReturnError:0] & 1) == 0))
    {
      id v59 = 0;
      v24 = [[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc] initWithURL:v9 options:2 error:&v59];
      id v26 = v59;
LABEL_20:
      [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)v24 invalidate];
    }
  }
  else if (a4)
  {
    id v26 = 0;
  }
  else
  {
    _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, 0, 0);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v48 = v26;
  v49 = v20;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v66[0] = v16;
  v66[1] = v20;
  v51 = v9;
  v66[2] = v9;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        int v34 = objc_msgSend(v33, "pbf_allowSuspendWithOpenFileHandle");
        v35 = PBFLogSQLite();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v63 = v33;
          __int16 v64 = 1024;
          LODWORD(v65) = v34;
          _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "Database file at %{public}@ allowSuspendWithOpenFileHandle: %{BOOL}u", buf, 0x12u);
        }

        if ((v34 & 1) == 0)
        {
          id v54 = 0;
          int v36 = objc_msgSend(v33, "pbf_setAllowSuspendWithOpenFileHandle:error:", 1, &v54);
          id v37 = v54;
          v38 = PBFLogSQLite();
          v39 = v38;
          if (v36)
          {
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              int v40 = objc_msgSend(v33, "pbf_allowSuspendWithOpenFileHandle");
              *(_DWORD *)buf = 138543618;
              v63 = v33;
              __int16 v64 = 1024;
              LODWORD(v65) = v40;
              _os_log_impl(&dword_1D31CE000, v39, OS_LOG_TYPE_DEFAULT, "Database file at %{public}@ was updated to allowSuspendWithOpenFileHandle: %{BOOL}u", buf, 0x12u);
            }
          }
          else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v63 = v33;
            __int16 v64 = 2114;
            id v65 = v37;
            _os_log_error_impl(&dword_1D31CE000, v39, OS_LOG_TYPE_ERROR, "Database file at %{public}@ failed to update allowSuspendWithOpenFileHandle! Error: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v30);
  }

  v10 = v50;
  v9 = v51;
  id v41 = v48;
  if (!v48)
  {
    id v53 = 0;
    v42 = [[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc] initWithURL:v51 options:1 error:&v53];
    id v41 = v53;
    lock_readonlyImpl = v50->_lock_readonlyImpl;
    v50->_lock_readonlyImpl = v42;

    if (!v41)
    {
      id v52 = 0;
      [(PBFPosterExtensionDataStoreSQLiteDatabase *)v50 validateDatabaseWithError:&v52];
      id v41 = v52;
      if (!v41)
      {

LABEL_45:
        v44 = v10;
        goto LABEL_46;
      }
    }
  }
  if (v47) {
    id *v47 = v41;
  }
  [(PBFPosterExtensionDataStoreSQLiteDatabase *)v50 invalidate];

  v44 = 0;
LABEL_46:

  return v44;
}

- (unint64_t)version
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated) {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v4 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl version];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)underlyingReadonlyDatabaseConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl connection];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)validateDatabaseWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a3)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      BOOL v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl validateDatabaseWithError:a3];
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl invalidate];
  lock_readonlyImpl = self->_lock_readonlyImpl;
  self->_lock_readonlyImpl = 0;

  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
}

- (id)dataStoreMetadataWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a3)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      BOOL v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl dataStoreMetadataWithError:a3];
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)roleIdentifiersWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a3)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      BOOL v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl roleIdentifiersWithError:a3];
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)extensionIdentifiersForRole:(id)a3 error:(id *)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a4)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl extensionIdentifiersForRole:v6 error:a4];
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)attributeIdentifiersForPoster:(id)a3 roleId:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a5)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      uint64_t v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl attributeIdentifiersForPoster:v8 roleId:v9 error:a5];
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)extensionIdentifierForPosterUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a4)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl extensionIdentifierForPosterUUID:v6 error:a4];
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)posterUUIDsForExtensionIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    if (a5)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
      uint64_t v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl posterUUIDsForExtensionIdentifier:v8 role:v9 error:a5];
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a4)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        id v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl sortedPosterUUIDsForRole:v7 error:a4];
    }
    os_unfair_lock_unlock(p_lock);

    return v9;
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleId"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreSQLiteDatabase sortedPosterUUIDsForRole:error:]();
    }
    [v11 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)roleDisplayNamesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    if ([v6 count])
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      if (self->_lock_invalidated)
      {
        if (a4)
        {
          _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
          id v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v9 = 0;
        }
      }
      else
      {
        id v9 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl roleDisplayNamesForIdentifiers:v7 error:a4];
      }
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1CC08];
    }

    return v9;
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifiers"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreSQLiteDatabase roleDisplayNamesForIdentifiers:error:]();
    }
    [v11 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)checkIfPosterUUIDs:(id)a3 belongToRole:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = v9;
    if ([v8 count])
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      if (self->_lock_invalidated)
      {
        if (a5)
        {
          _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
          BOOL v12 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl checkIfPosterUUIDs:v8 belongToRole:v10 error:a5];
      }
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      BOOL v12 = 0;
    }

    return v12;
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleId"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreSQLiteDatabase checkIfPosterUUIDs:belongToRole:error:]();
    }
    [v14 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a4)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        id v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl selectedPosterUUIDForRole:v7 error:a4];
    }
    os_unfair_lock_unlock(p_lock);

    return v9;
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleId"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreSQLiteDatabase selectedPosterUUIDForRole:error:]();
    }
    [v11 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)attributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    v13 = v12;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a6)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl attributeForPoster:v10 roleId:v11 attributeId:v13 error:a6];
    }
    os_unfair_lock_unlock(p_lock);

    return v15;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleId"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreSQLiteDatabase attributeForPoster:roleId:attributeId:error:]();
    }
    [v17 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)attributesForPoster:(id)a3 roleId:(id)a4 attributeIdentifiers:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    v13 = v12;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      if (a6)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(3, 0, 0, 0);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl attributesForPoster:v10 roleId:v11 attributeIdentifiers:v13 error:a6];
    }
    os_unfair_lock_unlock(p_lock);

    return v15;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleId"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionDataStoreSQLiteDatabase attributesForPoster:roleId:attributeIdentifiers:error:]();
    }
    [v17 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)performChanges:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    os_unfair_lock_lock(&self->_lock);
    BOOL lock_invalidated = self->_lock_invalidated;
    os_unfair_lock_unlock(&self->_lock);
    if (lock_invalidated)
    {
      BOOL v9 = 0;
LABEL_20:

      return v9;
    }
    id v10 = _os_activity_create(&dword_1D31CE000, "-[PBFPosterExtensionDataStoreSQLiteDatabase performChanges:error:]", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DETACHED);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    p_readwriteLock = &self->_readwriteLock;
    os_unfair_lock_lock(&self->_readwriteLock);
    if ((self->_options & 4) != 0)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, @"readonly database", 0);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v9 = 0;
LABEL_16:
      os_activity_scope_leave(&state);
      os_unfair_lock_unlock(p_readwriteLock);
      if (a4)
      {
        if (v16) {
          *a4 = v16;
        }
      }

      goto LABEL_20;
    }
    id v12 = [_PBFPosterExtensionDataStoreSQLiteDatabaseImpl alloc];
    URL = self->_URL;
    id v22 = 0;
    v14 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)v12 initWithURL:URL options:2 error:&v22];
    id v15 = v22;
    [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)v14 setCheckpointWALOnInvalidate:[(PBFPosterExtensionDataStoreSQLiteDatabase *)self checkpointWALOnInvalidate]];
    if (v15)
    {
      id v16 = v15;
      BOOL v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if (v14)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __66__PBFPosterExtensionDataStoreSQLiteDatabase_performChanges_error___block_invoke;
      v20[3] = &unk_1E6983CF8;
      id v21 = v7;
      id v19 = 0;
      BOOL v9 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)v14 performChanges:v20 error:&v19];
      id v16 = v19;

      if (v9)
      {
LABEL_14:
        [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)v14 invalidate];
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v9 = 0;
      id v16 = 0;
    }
    if (!v16)
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(4, 0, 0, 0);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"changeHandler"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PBFPosterExtensionDataStoreSQLiteDatabase performChanges:error:]();
  }
  [v18 UTF8String];
  BOOL result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __66__PBFPosterExtensionDataStoreSQLiteDatabase_performChanges_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self->_lock_readonlyImpl cancel];
  os_unfair_lock_unlock(p_lock);
}

- (NSURL)URL
{
  return self->_URL;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)checkpointWALOnInvalidate
{
  return self->_checkpointWALOnInvalidate;
}

- (void)setCheckpointWALOnInvalidate:(BOOL)a3
{
  self->_checkpointWALOnInvalidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_lock_readonlyImpl, 0);
}

- (void)initWithURL:options:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sortedPosterUUIDsForRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)roleDisplayNamesForIdentifiers:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)checkIfPosterUUIDs:belongToRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)selectedPosterUUIDForRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)performChanges:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end