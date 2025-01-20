@interface _PBFPosterExtensionDataStoreSQLiteDatabaseImpl
- (BOOL)addPosterUUID:(id)a3 provider:(id)a4 error:(id *)a5;
- (BOOL)addRole:(id)a3 displayName:(id)a4 error:(id *)a5;
- (BOOL)assignPosterUUID:(id)a3 toRole:(id)a4 error:(id *)a5;
- (BOOL)checkIfPosterUUIDs:(id)a3 belongToRole:(id)a4 error:(id *)a5;
- (BOOL)checkpointWALOnInvalidate;
- (BOOL)markPosterUUIDAsSelected:(id)a3 roleId:(id)a4 error:(id *)a5;
- (BOOL)mutateAttributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 attributePayload:(id)a6 error:(id *)a7;
- (BOOL)mutateDataStoreMetadataForKey:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)mutateSortOrder:(id)a3 roleId:(id)a4 error:(id *)a5;
- (BOOL)performChanges:(id)a3 error:(id *)a4;
- (BOOL)removePosterUUID:(id)a3 error:(id *)a4;
- (BOOL)removeRole:(id)a3 error:(id *)a4;
- (BOOL)unassignPosterUUID:(id)a3 fromRole:(id)a4 error:(id *)a5;
- (BOOL)validateDatabaseWithError:(id *)a3;
- (NSURL)URL;
- (PBFSQLiteDatabaseConnection)connection;
- (_PBFPosterExtensionDataStoreSQLiteDatabaseImpl)initWithURL:(id)a3 options:(int)a4 error:(id *)a5;
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
- (id)setup;
- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4;
- (unint64_t)version;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)setCheckpointWALOnInvalidate:(BOOL)a3;
- (void)setup;
@end

@implementation _PBFPosterExtensionDataStoreSQLiteDatabaseImpl

- (_PBFPosterExtensionDataStoreSQLiteDatabaseImpl)initWithURL:(id)a3 options:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_PBFPosterExtensionDataStoreSQLiteDatabaseImpl;
  v10 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)&v42 init];
  v11 = v10;
  if (!v10)
  {
LABEL_33:
    v30 = v11;
    goto LABEL_34;
  }
  v10->_sqliteFlags = v6;
  objc_storeStrong((id *)&v10->_databaseURL, a3);
  uint64_t v12 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
  invalidationFlag = v11->_invalidationFlag;
  v11->_invalidationFlag = (BSAtomicFlag *)v12;

  v14 = PBFLogSQLite();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v44 = v11;
    __int16 v45 = 2114;
    id v46 = v9;
    __int16 v47 = 1024;
    *(_DWORD *)v48 = v6;
    _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "[%p] opening database at %{public}@ w/ flags %d", buf, 0x1Cu);
  }

  id v41 = 0;
  v15 = [[PBFSQLiteDatabaseConnection alloc] initWithFileURL:v9 options:v6 dataProtectionClass:1 error:&v41];
  id v16 = v41;
  connection = v11->_connection;
  v11->_connection = v15;

  v18 = v11->_connection;
  if (v18 && !v16)
  {
    v35 = a5;
    v19 = PBFLogSQLite();
    [(PBFSQLiteDatabaseConnection *)v18 setLoggingCategory:v19];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v20 = [&unk_1F2AAEC38 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
LABEL_8:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(&unk_1F2AAEC38);
        }
        v24 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
        v25 = v11->_connection;
        id v36 = 0;
        BOOL v26 = -[PBFSQLiteDatabaseConnection executeQuery:error:](v25, "executeQuery:error:", v24, &v36, v35);
        id v27 = v36;
        id v16 = v27;
        if (!v26) {
          break;
        }

        if (v21 == ++v23)
        {
          uint64_t v21 = [&unk_1F2AAEC38 countByEnumeratingWithState:&v37 objects:v51 count:16];
          if (v21) {
            goto LABEL_8;
          }
          goto LABEL_30;
        }
      }
      v29 = PBFLogSQLite();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219010;
        v44 = v11;
        __int16 v45 = 2114;
        id v46 = v24;
        __int16 v47 = 2114;
        *(void *)v48 = v9;
        *(_WORD *)&v48[8] = 1024;
        *(_DWORD *)&v48[10] = v6;
        __int16 v49 = 2114;
        id v50 = v16;
        _os_log_error_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_ERROR, "[%p] failed to run pragma '%{public}@' on database at %{public}@ w/ flags %d: %{public}@", buf, 0x30u);
      }

      if (v16)
      {
        if (v35) {
          id *v35 = v16;
        }
        v28 = PBFLogSQLite();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl initWithURL:options:error:]();
        }
        goto LABEL_29;
      }
    }
LABEL_30:
    v31 = PBFLogSQLite();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v44 = v11;
      _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "[%p] successful init", buf, 0xCu);
    }

    uint64_t v32 = objc_opt_new();
    providerForPosterUUIDCache = v11->_providerForPosterUUIDCache;
    v11->_providerForPosterUUIDCache = (NSCache *)v32;

    [(NSCache *)v11->_providerForPosterUUIDCache setCountLimit:10];
    goto LABEL_33;
  }
  if (!v16)
  {
    _PBFPosterExtensionDataStoreSQLiteDatabaseError(2, 0, 0, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5 && v16) {
    *a5 = v16;
  }
  v28 = PBFLogSQLite();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218754;
    v44 = v11;
    __int16 v45 = 2114;
    id v46 = v9;
    __int16 v47 = 1024;
    *(_DWORD *)v48 = v6;
    *(_WORD *)&v48[4] = 2114;
    *(void *)&v48[6] = v16;
    _os_log_error_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_ERROR, "[%p] failed open database at %{public}@ w/ flags %d: %{public}@", buf, 0x26u);
  }
LABEL_29:

  v30 = 0;
LABEL_34:

  return v30;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = PBFLogSQLite();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "[%p] dealloc", buf, 0xCu);
  }

  [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)_PBFPosterExtensionDataStoreSQLiteDatabaseImpl;
  [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)&v4 dealloc];
}

- (unint64_t)version
{
  v2 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self dataStoreMetadataWithError:0];
  v3 = [v2 objectForKey:@"version"];

  if (v3) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (id)setup
{
  v54[2] = *MEMORY[0x1E4F143B8];
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  unint64_t v4 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self dataStoreMetadataWithError:0];
  v5 = [v4 objectForKey:@"version"];

  uint64_t v6 = PBFLogSQLite();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = self;
    _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "[%p] setup", buf, 0xCu);
  }

  long long v37 = v5;
  if (self->_sqliteFlags)
  {
    uint64_t v12 = PBFLogSQLite();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v48 = self;
      _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "[%p] setup bail; is readonly", buf, 0xCu);
    }
    id v3 = 0;
    goto LABEL_19;
  }
  connection = self->_connection;
  id v46 = 0;
  BOOL v8 = -[PBFSQLiteDatabaseConnection executeQuery:error:](connection, "executeQuery:error:", @"BEGIN TRANSACTION;",
         &v46);
  id v3 = v46;
  if (!v8)
  {
    uint64_t v12 = PBFLogSQLite();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setup]();
    }
    goto LABEL_19;
  }
  if (v5)
  {
    uint64_t v9 = [v5 integerValue];
    if (v9 > 1) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }
  do
  {
    v14 = PBFLogSQLite();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = self;
      __int16 v49 = 2048;
      uint64_t v50 = v9;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "[%p] setup update database to version %lu", buf, 0x16u);
    }

    if (v9 < 0)
    {
      v18 = &unk_1F2AAEC50;
    }
    else if (v9 == 1)
    {
      v54[0] = @"UPDATE posterMetadata SET value = \"2\" WHERE key = \"version\";";
      v15 = NSString;
      id v16 = [MEMORY[0x1E4F4F7D0] sharedInstance];
      objc_msgSend(v15, "stringWithFormat:", @"INSERT INTO posterMetadata(key, value) VALUES(\"deviceClass\", \"%d\");",
      v17 = [v16 deviceClass]);
      v54[1] = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    }
    else
    {
      v18 = 0;
    }
    if ([v18 count])
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v53 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v43;
        uint64_t v23 = v3;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v25 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            BOOL v26 = self->_connection;
            id v41 = 0;
            [(PBFSQLiteDatabaseConnection *)v26 executeQuery:v25 error:&v41];
            id v3 = v41;

            id v27 = PBFLogSQLite();
            v28 = v27;
            if (v3)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                databaseURL = self->_databaseURL;
                *(_DWORD *)buf = 134218754;
                v48 = self;
                __int16 v49 = 2114;
                uint64_t v50 = v25;
                __int16 v51 = 2114;
                *(void *)uint64_t v52 = databaseURL;
                *(_WORD *)&v52[8] = 2114;
                *(void *)&v52[10] = v3;
                _os_log_error_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_ERROR, "[%p] failed to execute setup query '%{public}@' on database at %{public}@: %{public}@", buf, 0x2Au);
              }

              goto LABEL_48;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v48 = self;
              __int16 v49 = 2114;
              uint64_t v50 = v25;
              _os_log_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_DEFAULT, "[%p] success setup query '%{public}@'", buf, 0x16u);
            }

            uint64_t v23 = 0;
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v53 count:16];
          uint64_t v23 = 0;
          if (v21) {
            continue;
          }
          break;
        }
        id v3 = 0;
      }
    }
    else
    {
      v19 = PBFLogSQLite();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v48 = self;
        __int16 v49 = 2048;
        uint64_t v50 = v9;
        _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, "[%p] skip setup for version %lu", buf, 0x16u);
      }
    }
LABEL_48:

    ++v9;
  }
  while (v9 != 2);
LABEL_9:
  v10 = self->_connection;
  if (!v3)
  {
    id v40 = 0;
    [(PBFSQLiteDatabaseConnection *)v10 executeQuery:@"COMMIT TRANSACTION;" error:&v40];
    id v30 = v40;
    if (v30)
    {
      id v3 = v30;
      uint64_t v12 = PBFLogSQLite();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v31 = self->_databaseURL;
        int sqliteFlags = self->_sqliteFlags;
        *(_DWORD *)buf = 134218754;
        v48 = self;
        __int16 v49 = 2114;
        uint64_t v50 = (uint64_t)v31;
        __int16 v51 = 1024;
        *(_DWORD *)uint64_t v52 = sqliteFlags;
        *(_WORD *)&v52[4] = 2114;
        *(void *)&v52[6] = v3;
        _os_log_error_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_ERROR, "[%p] failed to commit transaction on database at %{public}@ w/ flags %d: %{public}@", buf, 0x26u);
      }
      goto LABEL_19;
    }
    goto LABEL_53;
  }
  id v39 = 0;
  [(PBFSQLiteDatabaseConnection *)v10 executeQuery:@"ROLLBACK TRANSACTION;" error:&v39];
  id v11 = v39;

  if (!v11)
  {
LABEL_53:
    if (v9 == 2)
    {
      id v38 = 0;
      v33 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self dataStoreMetadataWithError:&v38];
      id v3 = v38;
      uint64_t v12 = [v33 objectForKey:@"version"];

      if ([v12 integerValue] != 2 && !v3)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, @"Database migration failed; final version not equal to expected version",
          0);
        id v3 = (id)objc_claimAutoreleasedReturnValue();
        v34 = PBFLogSQLite();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setup]();
        }
      }
    }
    else
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, @"Database migration failed.", 0);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = PBFLogSQLite();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setup]();
      }
    }
    goto LABEL_19;
  }
  uint64_t v12 = PBFLogSQLite();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v35 = self->_databaseURL;
    int v36 = self->_sqliteFlags;
    *(_DWORD *)buf = 134218754;
    v48 = self;
    __int16 v49 = 2114;
    uint64_t v50 = (uint64_t)v35;
    __int16 v51 = 1024;
    *(_DWORD *)uint64_t v52 = v36;
    *(_WORD *)&v52[4] = 2114;
    *(void *)&v52[6] = v11;
    _os_log_error_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_ERROR, "[%p] failed to rollback transaction on database at %{public}@ w/ flags %d: %{public}@", buf, 0x26u);
  }
  id v3 = v11;
LABEL_19:

LABEL_20:
  return v3;
}

- (BOOL)validateDatabaseWithError:(id *)a3
{
  v47[3] = *MEMORY[0x1E4F143B8];
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    v35 = a3;
    uint64_t v6 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self dataStoreMetadataWithError:a3];
    int v36 = [v6 objectForKey:@"version"];

    uint64_t v7 = v36;
    if (v36)
    {
      uint64_t v8 = [v36 integerValue];
      if (v8 > 2)
      {
        BOOL v5 = 1;
LABEL_41:

        return v5;
      }
      uint64_t v9 = v8;
      v10 = 0;
      while (v9 == 1)
      {
        id v11 = objc_opt_new();
        connection = self->_connection;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke;
        v40[3] = &unk_1E6981E58;
        id v13 = v11;
        id v41 = v13;
        id v39 = 0;
        [(PBFSQLiteDatabaseConnection *)connection executeQuery:@"SELECT tbl_name from sqlite_master WHERE type = 'table' AND tbl_name NOT LIKE 'sqlite_%'" resultRowHandler:v40 error:&v39];
        v14 = v39;

        v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"poster", @"posterMetadata", @"posterAttributes", @"posterRoles", @"posterRoleMembership", 0);
        if (([v15 isEqual:v13] & 1) == 0)
        {
          v46[0] = @"version";
          uint64_t v23 = [NSNumber numberWithInteger:1];
          v47[0] = v23;
          v46[1] = @"expectingTableNames";
          uint64_t v24 = [v15 allObjects];
          uint64_t v25 = (void *)v24;
          uint64_t v26 = MEMORY[0x1E4F1CBF0];
          if (v24) {
            uint64_t v27 = v24;
          }
          else {
            uint64_t v27 = MEMORY[0x1E4F1CBF0];
          }
          v47[1] = v27;
          v46[2] = @"tableNames";
          uint64_t v28 = [v13 allObjects];
          v29 = (void *)v28;
          if (v28) {
            uint64_t v30 = v28;
          }
          else {
            uint64_t v30 = v26;
          }
          v47[2] = v30;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
          uint64_t v32 = _PBFPosterExtensionDataStoreSQLiteDatabaseError(5, 0, 0, v31);

          if (v35) {
            id *v35 = v32;
          }
          v33 = PBFLogSQLite();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl validateDatabaseWithError:]();
          }

          goto LABEL_39;
        }

        v10 = v14;
        uint64_t v9 = 2;
      }
      if (v9 == 2)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        long long v43 = __Block_byref_object_copy__10;
        long long v44 = __Block_byref_object_dispose__10;
        id v45 = 0;
        id v16 = self->_connection;
        id v37 = 0;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke_250;
        v38[3] = &unk_1E6983D20;
        v38[4] = buf;
        -[PBFSQLiteDatabaseConnection executeQuery:resultRowHandler:error:](v16, "executeQuery:resultRowHandler:error:", @"SELECT value FROM posterMetadata WHERE key = 'version';",
          v38,
          &v37);
        id v17 = v37;
        v18 = v17;
        if (v17)
        {
          if (v35) {
            id *v35 = v17;
          }
          v19 = PBFLogSQLite();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl validateDatabaseWithError:]();
          }
        }
        BOOL v5 = [*(id *)(*(void *)&buf[8] + 40) integerValue] > 0;
        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"Version check failed for version %ld", v9);
        uint64_t v21 = _PBFPosterExtensionDataStoreSQLiteDatabaseError(5, 0, v20, 0);

        if (v35) {
          id *v35 = v21;
        }
        uint64_t v22 = PBFLogSQLite();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          long long v43 = (uint64_t (*)(uint64_t, uint64_t))v21;
          _os_log_error_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_ERROR, "[%p] failed validateDatabaseWithError for version %lu with error: %{public}@", buf, 0x20u);
        }

        BOOL v5 = 0;
      }
      v14 = v10;
    }
    else
    {
      v14 = PBFLogSQLite();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl validateDatabaseWithError:]((uint64_t)self, v14);
      }
LABEL_39:
      BOOL v5 = 0;
    }

    uint64_t v7 = v36;
    goto LABEL_41;
  }
  if (!a3) {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  BOOL v5 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (BOOL)performChanges:(id)a3 error:(id *)a4
{
  uint64_t v6 = (uint64_t (**)(id, _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *))a3;
  if (![(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    connection = self->_connection;
    id v22 = 0;
    BOOL v9 = -[PBFSQLiteDatabaseConnection executeQuery:error:](connection, "executeQuery:error:", @"BEGIN TRANSACTION;",
           &v22);
    id v10 = v22;
    if (v9)
    {
      int v11 = v6[2](v6, self);
      uint64_t v12 = self->_connection;
      if (v11)
      {
        id v21 = 0;
        BOOL v7 = -[PBFSQLiteDatabaseConnection executeQuery:error:](v12, "executeQuery:error:", @"COMMIT TRANSACTION;",
               &v21);
        id v13 = v21;
        if (!v7)
        {
          v14 = PBFLogSQLite();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl performChanges:error:]();
          }

          if (a4) {
            *a4 = v13;
          }
        }

        goto LABEL_24;
      }
      id v20 = 0;
      BOOL v16 = -[PBFSQLiteDatabaseConnection executeQuery:error:](v12, "executeQuery:error:", @"ROLLBACK TRANSACTION;",
              &v20);
      id v17 = v20;
      if (!v16)
      {
        v18 = PBFLogSQLite();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl performChanges:error:]();
        }

        if (a4) {
          *a4 = v17;
        }
      }
    }
    else
    {
      v15 = PBFLogSQLite();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl performChanges:error:]();
      }

      if (a4)
      {
        BOOL v7 = 0;
        *a4 = v10;
LABEL_24:

        goto LABEL_25;
      }
    }
    BOOL v7 = 0;
    goto LABEL_24;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_25:

  return v7;
}

- (id)dataStoreMetadataWithError:(id *)a3
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__10;
    id v13 = __Block_byref_object_dispose__10;
    id v14 = 0;
    uint64_t v6 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT key, value FROM posterMetadata;"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_dataStoreMetadataWithError___block_invoke;
    v8[3] = &unk_1E6983D20;
    v8[4] = &v9;
    [v6 executeWithBindings:0 resultRowHandler:v8 error:a3];
    id v5 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }
  return v5;
}

- (id)roleIdentifiersWithError:(id *)a3
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__10;
    id v13 = __Block_byref_object_dispose__10;
    id v14 = 0;
    uint64_t v6 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT roleIdentifier FROM posterRoles;"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleIdentifiersWithError___block_invoke;
    v8[3] = &unk_1E6983D20;
    v8[4] = &v9;
    [v6 executeWithBindings:0 resultRowHandler:v8 error:a3];
    id v5 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }
  return v5;
}

- (id)extensionIdentifiersForRole:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__10;
    BOOL v16 = __Block_byref_object_dispose__10;
    id v17 = 0;
    uint64_t v8 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT DISTINCT(providerId) as providerId FROM poster WHERE UUID IN (SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleIdentifier)"];;
    v18 = @":roleIdentifier";
    v19[0] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifiersForRole_error___block_invoke;
    v11[3] = &unk_1E6983D20;
    v11[4] = &v12;
    [v8 executeWithBindings:v9 resultRowHandler:v11 error:a4];

    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  return v7;
}

- (id)attributeIdentifiersForPoster:(id)a3 roleId:(id)a4 error:(id *)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__10;
    id v20 = __Block_byref_object_dispose__10;
    id v21 = 0;
    uint64_t v11 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT DISTINCT(attributeIdentifier) as attributeIdentifier FROM posterAttributes WHERE posterUUID = :posterUUID AND roleId = :roleIdentifier AND attributeIdentifier != 'SELECTED'"];
    v23[0] = v9;
    v22[0] = @":roleIdentifier";
    v22[1] = @":posterUUID";
    uint64_t v12 = [v8 UUIDString];
    v23[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeIdentifiersForPoster_roleId_error___block_invoke;
    v15[3] = &unk_1E6983D20;
    v15[4] = &v16;
    [v11 executeWithBindings:v13 resultRowHandler:v15 error:a5];

    id v10 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }
  return v10;
}

- (id)posterUUIDsForExtensionIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__10;
    v19 = __Block_byref_object_dispose__10;
    id v20 = 0;
    uint64_t v11 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT UUID FROM poster WHERE providerId = :extensionIdentifier AND UUID IN (SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleIdentifier)"];;
    v21[0] = @":extensionIdentifier";
    v21[1] = @":roleIdentifier";
    v22[0] = v8;
    v22[1] = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_posterUUIDsForExtensionIdentifier_role_error___block_invoke;
    v14[3] = &unk_1E6983D20;
    v14[4] = &v15;
    [v11 executeWithBindings:v12 resultRowHandler:v14 error:a5];

    id v10 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  return v10;
}

- (id)extensionIdentifierForPosterUUID:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__10;
    id v20 = __Block_byref_object_dispose__10;
    id v21 = [(NSCache *)self->_providerForPosterUUIDCache objectForKey:v6];
    id v8 = (void *)v17[5];
    if (v8)
    {
      id v7 = v8;
    }
    else
    {
      id v9 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT providerID from poster WHERE UUID = :posterUUID"];;
      id v22 = @":posterUUID";
      id v10 = [v6 UUIDString];
      v23[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __89___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifierForPosterUUID_error___block_invoke;
      v15[3] = &unk_1E6983D20;
      v15[4] = &v16;
      [v9 executeWithBindings:v11 resultRowHandler:v15 error:a4];

      uint64_t v12 = v17[5];
      if (v12)
      {
        [(NSCache *)self->_providerForPosterUUIDCache setObject:v12 forKey:v6];
        id v13 = (void *)v17[5];
      }
      else
      {
        id v13 = 0;
      }
      id v7 = v13;
    }
    _Block_object_dispose(&v16, 8);
  }
  return v7;
}

- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl sortedPosterUUIDsForRole:error:]();
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D328055CLL);
    }
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__10;
    uint64_t v17 = __Block_byref_object_dispose__10;
    id v18 = 0;
    id v8 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleIdentifier ORDER BY roleSortKey"];;
    v19 = @":roleIdentifier";
    v20[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_sortedPosterUUIDsForRole_error___block_invoke;
    v12[3] = &unk_1E6983D20;
    v12[4] = &v13;
    [v8 executeWithBindings:v9 resultRowHandler:v12 error:a4];

    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  return v7;
}

- (id)roleDisplayNamesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if ([v6 count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__10;
    uint64_t v15 = __Block_byref_object_dispose__10;
    id v16 = 0;
    id v7 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT roleIdentifier, displayName FROM posterMetadata;"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleDisplayNamesForIdentifiers_error___block_invoke;
    v10[3] = &unk_1E6983D20;
    v10[4] = &v11;
    [v7 executeWithBindings:0 resultRowHandler:v10 error:a4];
    id v8 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    goto LABEL_7;
  }
  id v8 = (id)MEMORY[0x1E4F1CC08];
LABEL_7:

  return v8;
}

- (BOOL)checkIfPosterUUIDs:(id)a3 belongToRole:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_20;
  }
  if (!v9)
  {
    uint64_t v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleId"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl checkIfPosterUUIDs:belongToRole:error:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3280BFCLL);
  }
  if (!v8)
  {
    uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUIDs"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl checkIfPosterUUIDs:belongToRole:error:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3280C60);
  }
  if (![v8 count]) {
    goto LABEL_16;
  }
  uint64_t v11 = objc_opt_new();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke;
  v34[3] = &unk_1E6983D48;
  id v12 = v11;
  id v35 = v12;
  objc_msgSend(v8, "bs_each:", v34);
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleId"];;
  id v37 = @":roleId";
  v38[0] = v9;
  BOOL v10 = 1;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke_2;
  v32[3] = &unk_1E6981E58;
  id v16 = v13;
  id v33 = v16;
  [v14 executeWithBindings:v15 resultRowHandler:v32 error:a5];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id v27 = v12;
    uint64_t v20 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v28 + 1) + 8 * i) UUIDString];
        int v23 = [v16 containsObject:v22];

        if (!v23)
        {
          BOOL v10 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v19) {
        continue;
      }
      break;
    }
    BOOL v10 = 1;
LABEL_18:
    id v12 = v27;
  }

LABEL_20:
  return v10;
}

- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl selectedPosterUUIDForRole:error:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3280FA0);
    }
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__10;
    uint64_t v18 = __Block_byref_object_dispose__10;
    id v19 = 0;
    id v8 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT posterUUID FROM posterAttributes WHERE (roleId = :roleIdentifier AND attributeIdentifier = :attributeIdentifier AND attributePayload = :attributePayload) LIMIT 1"];;
    v20[0] = @":roleIdentifier";
    v20[1] = @":attributeIdentifier";
    v21[0] = v6;
    v21[1] = @"SELECTED";
    void v20[2] = @":attributePayload";
    void v21[2] = &unk_1F2AAED20;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_selectedPosterUUIDForRole_error___block_invoke;
    v13[3] = &unk_1E6983D20;
    v13[4] = &v14;
    [v8 executeWithBindings:v9 resultRowHandler:v13 error:a4];

    if ([(id)v15[5] length])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F29128]);
      id v7 = (void *)[v10 initWithUUIDString:v15[5]];
    }
    else
    {
      id v7 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (id)attributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 error:(id *)a6
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    if (!v10)
    {
      uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeForPoster:roleId:attributeId:error:]();
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32812C4);
    }
    if (!v11)
    {
      id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeForPoster:roleId:attributeId:error:]();
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3281328);
    }
    if (!v12)
    {
      uint64_t v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attributeIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeForPoster:roleId:attributeId:error:]();
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D328138CLL);
    }
    v28[0] = @":posterUUID";
    uint64_t v14 = [v10 UUIDString];
    v29[0] = v14;
    v29[1] = v11;
    v28[1] = @":roleIdentifier";
    v28[2] = @":attributeIdentifier";
    v29[2] = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];

    uint64_t v16 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"SELECT attributePayload FROM posterAttributes WHERE (roleId = :roleIdentifier AND attributeIdentifier = :attributeIdentifier AND posterUUID = :posterUUID) LIMIT 1"];;
    uint64_t v22 = 0;
    int v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__10;
    uint64_t v26 = __Block_byref_object_dispose__10;
    id v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __94___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeForPoster_roleId_attributeId_error___block_invoke;
    v21[3] = &unk_1E6983D20;
    void v21[4] = &v22;
    [v16 executeWithBindings:v15 resultRowHandler:v21 error:a6];
    id v13 = (id)v23[5];
    _Block_object_dispose(&v22, 8);
  }
  return v13;
}

- (id)attributesForPoster:(id)a3 roleId:(id)a4 attributeIdentifiers:(id)a5 error:(id *)a6
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    if (!v10)
    {
      uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributesForPoster:roleId:attributeIdentifiers:error:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D328171CLL);
    }
    if (!v11)
    {
      uint64_t v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributesForPoster:roleId:attributeIdentifiers:error:]();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3281780);
    }
    if (!v12)
    {
      uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attributeIdentifiers"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributesForPoster:roleId:attributeIdentifiers:error:]();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32817E4);
    }
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    long long v31 = __Block_byref_object_copy__10;
    uint64_t v32 = __Block_byref_object_dispose__10;
    id v33 = 0;
    uint64_t v14 = [v12 allObjects];
    uint64_t v15 = [v14 sortedArrayUsingSelector:sel_compare_];
    uint64_t v16 = objc_msgSend(v15, "bs_map:", &__block_literal_global_29);

    id v17 = NSString;
    uint64_t v18 = [v16 componentsJoinedByString:@","];
    id v19 = objc_msgSend(v17, "stringWithFormat:", @"SELECT attributeIdentifier, attributePayload FROM posterAttributes WHERE (roleId = :roleIdentifier AND posterUUID = :posterUUID AND attributeIdentifier IN (%@)"), v18;

    v34[0] = @":posterUUID";
    uint64_t v20 = [v10 UUIDString];
    v34[1] = @":roleIdentifier";
    v35[0] = v20;
    v35[1] = v11;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

    uint64_t v22 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:v19];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __104___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributesForPoster_roleId_attributeIdentifiers_error___block_invoke_2;
    v27[3] = &unk_1E6983D20;
    v27[4] = &v28;
    [v22 executeWithBindings:v21 resultRowHandler:v27 error:a6];
    id v13 = (void *)[(id)v29[5] copy];

    _Block_object_dispose(&v28, 8);
  }

  return v13;
}

- (BOOL)addRole:(id)a3 displayName:(id)a4 error:(id *)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addRole:displayName:error:]();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3281AE8);
    }
    if (!v9)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"displayName"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addRole:displayName:error:]();
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3281B4CLL);
    }
    id v11 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"INSERT INTO posterRoles VALUES(:roleIdentifier, :displayName);"];
    v16[0] = @":roleIdentifier";
    v16[1] = @":displayName";
    v17[0] = v8;
    v17[1] = v9;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    char v10 = [v11 executeWithBindings:v12 resultRowHandler:0 error:a5];
  }
  return v10;
}

- (BOOL)removeRole:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl removeRole:error:]();
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3281CD4);
    }
    id v8 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"DELETE FROM posterRoles WHERE roleIdentifier = :roleIdentifier"];;
    id v12 = @":roleIdentifier";
    v13[0] = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v7 = [v8 executeWithBindings:v9 resultRowHandler:0 error:a4];
  }
  return v7;
}

- (BOOL)addPosterUUID:(id)a3 provider:(id)a4 error:(id *)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addPosterUUID:provider:error:]();
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3281E9CLL);
    }
    if (!v9)
    {
      uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"provider"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addPosterUUID:provider:error:]();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3281F00);
    }
    id v11 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"INSERT INTO poster (UUID, providerId) VALUES(:posterUUID, :provider);"];
    v17[0] = @":posterUUID";
    id v12 = [v8 UUIDString];
    v17[1] = @":provider";
    v18[0] = v12;
    v18[1] = v9;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    char v10 = [v11 executeWithBindings:v13 resultRowHandler:0 error:a5];
  }
  return v10;
}

- (BOOL)removePosterUUID:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl removePosterUUID:error:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32820A0);
    }
    id v8 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"DELETE FROM poster WHERE UUID = :posterUUID"];;
    id v13 = @":posterUUID";
    id v9 = [v6 UUIDString];
    v14[0] = v9;
    char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    char v7 = [v8 executeWithBindings:v10 resultRowHandler:0 error:a4];
  }
  return v7;
}

- (BOOL)assignPosterUUID:(id)a3 toRole:(id)a4 error:(id *)a5
{
  void v18[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl assignPosterUUID:toRole:error:]();
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3282274);
    }
    if (!v9)
    {
      uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl assignPosterUUID:toRole:error:]();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32822D8);
    }
    id v11 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"INSERT INTO posterRoleMembership VALUES(:posterUUID, :roleIdentifier1, IFNULL((SELECT MAX(roleSortKey) + 1 FROM posterRoleMembership WHERE roleId = :roleIdentifier2), 1))"];;
    v17[0] = @":posterUUID";
    id v12 = [v8 UUIDString];
    v18[0] = v12;
    v18[1] = v9;
    v17[1] = @":roleIdentifier1";
    void v17[2] = @":roleIdentifier2";
    v18[2] = v9;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    char v10 = [v11 executeWithBindings:v13 resultRowHandler:0 error:a5];
  }
  return v10;
}

- (BOOL)unassignPosterUUID:(id)a3 fromRole:(id)a4 error:(id *)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl unassignPosterUUID:fromRole:error:]();
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32824A0);
    }
    if (!v9)
    {
      uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl unassignPosterUUID:fromRole:error:]();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3282504);
    }
    id v11 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"DELETE FROM posterRoleMembership WHERE roleId = :roleIdentifier AND posterUUID = :posterUUID"];;
    v17[0] = @":posterUUID";
    id v12 = [v8 UUIDString];
    v17[1] = @":roleIdentifier";
    v18[0] = v12;
    v18[1] = v9;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    char v10 = [v11 executeWithBindings:v13 resultRowHandler:0 error:a5];
  }
  return v10;
}

- (BOOL)mutateSortOrder:(id)a3 roleId:(id)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v8 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
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
  }
  else
  {
    v34 = v8;
    id v35 = a5;
    char v10 = [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self sortedPosterUUIDsForRole:v8 error:0];
    id v11 = (void *)[v10 mutableCopy];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v12 = v36;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v55;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * v15);
        if (([v11 containsObject:v16] & 1) == 0) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v13) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      if (!v35)
      {
        BOOL v9 = 0;
        goto LABEL_41;
      }
      v60 = @"missingUUID";
      uint64_t v30 = [v16 UUIDString];
      id v17 = (void *)v30;
      long long v31 = @"(null)";
      if (v30) {
        long long v31 = (__CFString *)v30;
      }
      v61 = v31;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, @"newSortOrder contained UUIDs that the database did not, suggesting an out-of-order commit sequence", v32);
      id *v35 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v9 = 0;
    }
    else
    {
LABEL_12:

      id v12 = (id)[v12 mutableCopy];
      id v17 = objc_opt_new();
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v18 = v11;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v51 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            if (([v12 containsObject:v22] & 1) == 0) {
              [v17 addObject:v22];
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v59 count:16];
        }
        while (v19);
      }

      if ([v17 count])
      {
        int v23 = [v17 array];
        uint64_t v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_402];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v47 != v27) {
                objc_enumerationMutation(v25);
              }
              [v12 addObject:*(void *)(*((void *)&v46 + 1) + 8 * j)];
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v58 count:16];
          }
          while (v26);
        }
      }
      uint64_t v40 = 0;
      id v41 = &v40;
      uint64_t v42 = 0x3032000000;
      long long v43 = __Block_byref_object_copy__10;
      long long v44 = __Block_byref_object_dispose__10;
      id v45 = 0;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __79___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_mutateSortOrder_roleId_error___block_invoke_2;
      v37[3] = &unk_1E6983DB0;
      v37[4] = self;
      id v38 = v34;
      id v39 = &v40;
      [v12 enumerateObjectsUsingBlock:v37];
      long long v29 = (void *)v41[5];
      BOOL v9 = v29 == 0;
      if (v35 && v29) {
        id *v35 = v29;
      }

      _Block_object_dispose(&v40, 8);
    }

LABEL_41:
    id v8 = v34;
  }

  return v9;
}

- (BOOL)mutateDataStoreMetadataForKey:(id)a3 value:(id)a4 error:(id *)a5
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (__CFString *)a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      id v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"key"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateDataStoreMetadataForKey:value:error:]();
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3282D78);
    }
    connection = self->_connection;
    if (v9) {
      id v12 = @"INSERT INTO posterMetadata VALUES(:key1, :value1) ON CONFLICT(key) DO UPDATE SET value=:value2 WHERE key=:key2;";
    }
    else {
      id v12 = @"DELETE FROM posterMetadata WHERE key = :key1;";
    }
    if (v9) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = &stru_1F2A71F00;
    }
    uint64_t v14 = [(PBFSQLiteDatabaseConnection *)connection prepareStatement:v12];
    v18[0] = @":key1";
    v18[1] = @":key2";
    v19[0] = v8;
    v19[1] = v8;
    v18[2] = @":value1";
    void v18[3] = @":value2";
    void v19[2] = v13;
    v19[3] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    char v10 = [v14 executeWithBindings:v15 resultRowHandler:0 error:a5];
  }
  return v10;
}

- (BOOL)markPosterUUIDAsSelected:(id)a3 roleId:(id)a4 error:(id *)a5
{
  v18[6] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl markPosterUUIDAsSelected:roleId:error:]();
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3282F74);
    }
    if (!v9)
    {
      uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl markPosterUUIDAsSelected:roleId:error:]();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3282FD8);
    }
    v17[0] = @":posterUUID";
    id v11 = [v8 UUIDString];
    v18[0] = v11;
    v18[1] = v9;
    v17[1] = @":roleIdentifier1";
    void v17[2] = @":roleIdentifier2";
    v18[2] = v9;
    void v18[3] = @"SELECTED";
    void v17[3] = @":attributeIdentifier1";
    v17[4] = @":attributeIdentifier2";
    v17[5] = @":attributePayload";
    void v18[4] = @"SELECTED";
    v18[5] = &unk_1F2AAED20;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];

    uint64_t v13 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:@"            DELETE FROM posterAttributes WHERE (roleId = :roleIdentifier1 AND attributeIdentifier = :attributeIdentifier1)                INSERT INTO posterAttributes VALUES(:posterUUID, :roleIdentifier2, :attributeIdentifier2, :attributePayload);"];;
    char v10 = [v13 executeWithBindings:v12 resultRowHandler:0 error:a5];
  }
  return v10;
}

- (BOOL)mutateAttributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 attributePayload:(id)a6 error:(id *)a7
{
  v28[7] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      char v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    if (!v12)
    {
      uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterUUID"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateAttributeForPoster:roleId:attributeId:attributePayload:error:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3283254);
    }
    if (!v13)
    {
      id v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"roleIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateAttributeForPoster:roleId:attributeId:attributePayload:error:]();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32832B8);
    }
    if (!v14)
    {
      uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attributeIdentifier"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateAttributeForPoster:roleId:attributeId:attributePayload:error:]();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D328331CLL);
    }
    v27[0] = @":posterUUID1";
    id v17 = [v12 UUIDString];
    v28[0] = v17;
    v28[1] = v13;
    v27[1] = @":roleIdentifier1";
    v27[2] = @":attributeIdentifier1";
    v28[2] = v14;
    v27[3] = @":posterUUID2";
    id v18 = [v12 UUIDString];
    void v28[3] = v18;
    v28[4] = v13;
    v27[4] = @":roleIdentifier2";
    void v27[5] = @":attributeIdentifier2";
    v28[5] = v14;
    v27[6] = @":attributePayload";
    uint64_t v19 = v15;
    if (!v15)
    {
      uint64_t v19 = [MEMORY[0x1E4F1C9B8] data];
    }
    v28[6] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];
    if (v15)
    {
      id v21 = @"DELETE FROM posterAttributes WHERE (roleId = :roleIdentifier1 AND attributeIdentifier = :attributeIdentifier1 AND posterUUID = :posterUUID1); INSERT INTO posterAttributes VALUES(:posterUUID2, :roleIdentifier2, :attributeIdentifier2, :attributePayload);";
    }
    else
    {

      id v21 = @"DELETE FROM posterAttributes WHERE (roleId = :roleIdentifier1 AND attributeIdentifier = :attributeIdentifier1 AND posterUUID = :posterUUID1);";
    }

    uint64_t v22 = [(PBFSQLiteDatabaseConnection *)self->_connection prepareStatement:v21];
    char v16 = [v22 executeWithBindings:v20 resultRowHandler:0 error:a7];
  }
  return v16;
}

- (void)cancel
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1D31CE000, v0, OS_LOG_TYPE_FAULT, "[%p] wal checkpoint failed: %{public}@", v1, 0x16u);
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    [(_PBFPosterExtensionDataStoreSQLiteDatabaseImpl *)self cancel];
    connection = self->_connection;
    [(PBFSQLiteDatabaseConnection *)connection invalidate];
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (PBFSQLiteDatabaseConnection)connection
{
  return self->_connection;
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
  objc_storeStrong((id *)&self->_providerForPosterUUIDCache, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)initWithURL:options:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%p] failed to init with error: %{public}@");
}

- (void)setup
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%p] setup bail; cannot begin transaction: %{public}@");
}

- (void)validateDatabaseWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  id v5 = @"version string was nil";
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "[%p] failed validateDatabaseWithError with error: %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)validateDatabaseWithError:.cold.2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_13_0(&dword_1D31CE000, v0, v1, "[%p] failed validateDatabaseWithError for version %lu with error: %{public}@");
}

- (void)validateDatabaseWithError:.cold.3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_13_0(&dword_1D31CE000, v0, v1, "[%p] failed validateDatabaseWithError for version %lu with error: %{public}@");
}

- (void)performChanges:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%p] failed to commit transaction: %{public}@");
}

- (void)performChanges:error:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_1D31CE000, v0, v1, "[%p] failed to begin transaction: %{public}@");
}

- (void)sortedPosterUUIDsForRole:error:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)checkIfPosterUUIDs:belongToRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)checkIfPosterUUIDs:belongToRole:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)selectedPosterUUIDForRole:error:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addRole:displayName:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addRole:displayName:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addPosterUUID:provider:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addPosterUUID:provider:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removePosterUUID:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)assignPosterUUID:toRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)assignPosterUUID:toRole:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)unassignPosterUUID:fromRole:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)unassignPosterUUID:fromRole:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)mutateDataStoreMetadataForKey:value:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)markPosterUUIDAsSelected:roleId:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)markPosterUUIDAsSelected:roleId:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)mutateAttributeForPoster:roleId:attributeId:attributePayload:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)mutateAttributeForPoster:roleId:attributeId:attributePayload:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)mutateAttributeForPoster:roleId:attributeId:attributePayload:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end