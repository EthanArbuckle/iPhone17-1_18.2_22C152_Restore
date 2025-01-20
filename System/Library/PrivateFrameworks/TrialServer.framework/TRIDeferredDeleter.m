@interface TRIDeferredDeleter
+ (BOOL)_createSymlinkIfNonExistentAtPath:(id)a3 withDestinationPath:(id)a4;
+ (BOOL)_removeDeferredDeletedItemWithLink:(id)a3 externalReferenceStore:(id)a4 wasDeleted:(BOOL *)a5;
- (BOOL)_cleanupWithLinksDirLockWitness:(TRIFlockWitness_ *)a3 externalReferenceStore:(id)a4;
- (BOOL)collectGarbageWithRootDirLockWitness:(TRIFlockWitness_ *)a3 externalReferenceStore:(id)a4;
- (BOOL)markItemAtRelativePath:(id)a3;
- (BOOL)unmarkItemAtRelativePath:(id)a3;
- (id)_collectRelativeLinkPathsWithLinksDirLockWitness:(TRIFlockWitness_ *)a3;
- (id)_deferredDeletedLinksDir;
- (id)_linkPathForDeferredDeletedItemAtPath:(id)a3;
- (id)initForRootDir:(id)a3;
@end

@implementation TRIDeferredDeleter

- (id)initForRootDir:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDeferredDeleter;
  v5 = [(TRIDeferredDeleter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByStandardizingPath];
    rootDir = v5->_rootDir;
    v5->_rootDir = (NSString *)v6;
  }
  return v5;
}

- (BOOL)markItemAtRelativePath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v6 = [(NSString *)self->_rootDir stringByAppendingPathComponent:v4];
  v7 = [v6 stringByStandardizingPath];
  int v8 = [v7 isEqualToString:self->_rootDir];

  if (v8)
  {
    objc_super v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      v16 = v6;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Cannot mark root directory %{public}@ for deferred deletion", (uint8_t *)&v15, 0xCu);
    }
    BOOL v10 = 0;
  }
  else
  {
    v11 = [(TRIDeferredDeleter *)self _deferredDeletedLinksDir];
    objc_super v9 = [v11 stringByAppendingPathComponent:v4];

    v12 = [v9 stringByDeletingLastPathComponent];
    if ([MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v12]
      && [(id)objc_opt_class() _createSymlinkIfNonExistentAtPath:v9 withDestinationPath:v6])
    {
      v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138543362;
        v16 = v6;
        _os_log_debug_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEBUG, "Marked %{public}@ for deferred deletion", (uint8_t *)&v15, 0xCu);
      }

      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)_createSymlinkIfNonExistentAtPath:(id)a3 withDestinationPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (const char *)[v6 fileSystemRepresentation];
  id v8 = v5;
  if (symlink(v7, (const char *)[v8 fileSystemRepresentation]) && *__error() != 17)
  {
    BOOL v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      int v14 = *__error();
      int v15 = 138544130;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2080;
      v20 = v13;
      __int16 v21 = 1024;
      int v22 = v14;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", (uint8_t *)&v15, 0x26u);
    }

    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)unmarkItemAtRelativePath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSString *)self->_rootDir stringByAppendingPathComponent:v4];
  id v6 = [v5 stringByStandardizingPath];
  int v7 = [v6 isEqualToString:self->_rootDir];

  if (v7)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v5;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Cannot unmark root directory %{public}@ for deferred deletion", (uint8_t *)&v15, 0xCu);
    }
    BOOL v9 = 0;
  }
  else
  {
    id v8 = [(TRIDeferredDeleter *)self _linkPathForDeferredDeletedItemAtPath:v4];
    if (unlink((const char *)[v8 fileSystemRepresentation]) && *__error() != 2)
    {
      BOOL v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = __error();
        v13 = strerror(*v12);
        int v14 = *__error();
        int v15 = 138543874;
        id v16 = v8;
        __int16 v17 = 2080;
        id v18 = v13;
        __int16 v19 = 1024;
        int v20 = v14;
        _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to unmark item for deferred deletion at path %{public}@: %s (%d)", (uint8_t *)&v15, 0x1Cu);
      }
      BOOL v9 = 0;
    }
    else
    {
      BOOL v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138543362;
        id v16 = v8;
        _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "Removed deferred deletion mark %{public}@", (uint8_t *)&v15, 0xCu);
      }
      BOOL v9 = 1;
    }
  }
  return v9;
}

- (BOOL)collectGarbageWithRootDirLockWitness:(TRIFlockWitness_ *)a3 externalReferenceStore:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(TRIDeferredDeleter *)self _deferredDeletedLinksDir];
  int v7 = open((const char *)[v6 fileSystemRepresentation], 0);
  if ((v7 & 0x80000000) == 0)
  {
    int v8 = v7;
    if (flock(v7, 6))
    {
      if (*__error() == 35)
      {
        BOOL v9 = TRILogCategory_Server();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v36 = (NSString *)v6;
          _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Unable to lock deferred deleted items directory %{public}@, skipping garbage collecting deferred deleted items", buf, 0xCu);
        }

        int v10 = 2;
        char v11 = 1;
      }
      else
      {
        int v20 = TRILogCategory_Server();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v25 = __error();
          v26 = strerror(*v25);
          int v27 = *__error();
          *(_DWORD *)buf = 138543874;
          v36 = (NSString *)v6;
          __int16 v37 = 2080;
          v38 = v26;
          __int16 v39 = 1024;
          int v40 = v27;
          _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Unable to acquire exclusive lock on deferred deleted items dir %{public}@: %s (%d)", buf, 0x1Cu);
        }

        char v11 = 0;
        int v10 = 2;
      }
LABEL_31:
      close(v8);
      char v16 = v11 | (v10 == 0);
      goto LABEL_32;
    }
    __int16 v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = (NSString *)v6;
      _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Running garbage collection on deferred deleted items in dir %{public}@", buf, 0xCu);
    }

    *(_DWORD *)buf = v8;
    if ([(TRIDeferredDeleter *)self _cleanupWithLinksDirLockWitness:buf externalReferenceStore:v5])
    {
      id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v19 = [v18 triRemoveNestedEmptyDirectoriesAtPath:v6];

      if (v19)
      {
        int v10 = 0;
LABEL_26:
        if (flock(v8, 8))
        {
          uint64_t v23 = TRILogCategory_Server();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v31 = __error();
            v32 = strerror(*v31);
            int v33 = *__error();
            *(_DWORD *)buf = 138543874;
            v36 = (NSString *)v6;
            __int16 v37 = 2080;
            v38 = v32;
            __int16 v39 = 1024;
            int v40 = v33;
            _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Unable to release exclusive lock on deferred deleted items dir %{public}@: %s (%d)", buf, 0x1Cu);
          }
        }
        char v11 = 0;
        goto LABEL_31;
      }
      uint64_t v21 = TRILogCategory_Server();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        int v10 = 1;
        goto LABEL_26;
      }
      *(_WORD *)v34 = 0;
      int v22 = "Empty deferred link directories cleanup failed";
    }
    else
    {
      uint64_t v21 = TRILogCategory_Server();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)v34 = 0;
      int v22 = "Deferred deleted items cleanup failed";
    }
    _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, v22, v34, 2u);
    goto LABEL_25;
  }
  BOOL v12 = *__error() == 2;
  v13 = TRILogCategory_Server();
  int v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      rootDir = self->_rootDir;
      *(_DWORD *)buf = 138543362;
      v36 = rootDir;
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "No deferred deleted items to garbage collect for root directory %{public}@", buf, 0xCu);
    }

    char v16 = 1;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v28 = __error();
      v29 = strerror(*v28);
      int v30 = *__error();
      *(_DWORD *)buf = 138543874;
      v36 = (NSString *)v6;
      __int16 v37 = 2080;
      v38 = v29;
      __int16 v39 = 1024;
      int v40 = v30;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to open lock on dir %{public}@: %s (%d)", buf, 0x1Cu);
    }

    char v16 = 0;
  }
LABEL_32:

  return v16 & 1;
}

- (BOOL)_cleanupWithLinksDirLockWitness:(TRIFlockWitness_ *)a3 externalReferenceStore:(id)a4
{
  id v6 = a4;
  int v7 = [(TRIDeferredDeleter *)self _collectRelativeLinkPathsWithLinksDirLockWitness:a3];
  if (v7)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 1;
    int v8 = [(TRIDeferredDeleter *)self _deferredDeletedLinksDir];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__TRIDeferredDeleter__cleanupWithLinksDirLockWitness_externalReferenceStore___block_invoke;
    v12[3] = &unk_1E6BBBD98;
    id v9 = v8;
    id v13 = v9;
    int v14 = self;
    id v15 = v6;
    char v16 = &v17;
    if ([v7 enumerateStringsWithBlock:v12]) {
      BOOL v10 = *((unsigned char *)v18 + 24) != 0;
    }
    else {
      BOOL v10 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __77__TRIDeferredDeleter__cleanupWithLinksDirLockWitness_externalReferenceStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v3];
  char v5 = 0;
  if (![(id)objc_opt_class() _removeDeferredDeletedItemWithLink:v4 externalReferenceStore:*(void *)(a1 + 48) wasDeleted:&v5]|| v5 && (objc_msgSend(*(id *)(a1 + 40), "unmarkItemAtRelativePath:", v3) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (id)_collectRelativeLinkPathsWithLinksDirLockWitness:(TRIFlockWitness_ *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E016E7F0](self, a2, a3);
  char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(TRIDeferredDeleter *)self _deferredDeletedLinksDir];
  int v7 = [v5 enumeratorAtPath:v6];

  int v8 = objc_opt_new();
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v10 = [v7 nextObject];
    if (v10)
    {
      BOOL v12 = (void *)v10;
      id v13 = (void *)*MEMORY[0x1E4F283C0];
      int v14 = (void *)*MEMORY[0x1E4F283D0];
      *(void *)&long long v11 = 138543362;
      long long v20 = v11;
      do
      {
        id v15 = objc_msgSend(v7, "fileAttributes", v20);
        char v16 = [v15 fileType];

        if (v16 == v13 || v16 == v14)
        {
          if (v16 == v14 && ([v8 addString:v12] & 1) == 0)
          {

            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v17 = TRILogCategory_Server();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            int v22 = v12;
            _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Found unexpected non symbolic link file %{public}@", buf, 0xCu);
          }
        }
        id v9 = (void *)MEMORY[0x1E016E7F0]();
        BOOL v12 = [v7 nextObject];
      }
      while (v12);
    }
    id v18 = v8;
  }
  else
  {
LABEL_14:
    id v18 = 0;
  }

  return v18;
}

+ (BOOL)_removeDeferredDeletedItemWithLink:(id)a3 externalReferenceStore:(id)a4 wasDeleted:(BOOL *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  *a5 = 0;
  id v9 = [MEMORY[0x1E4F28CB8] triTargetPathForSymlink:v7];
  if (!v9)
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v7;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Found deferred deletion symlink with path %{public}@ with no valid target", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (v8 && [v8 hasReferenceToPath:v9])
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v7;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Deferred Deletion garbage collection found a nonzero external reference count for path: %{public}@", buf, 0xCu);
    }
    BOOL v11 = 1;
    goto LABEL_17;
  }
  BOOL v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  char v13 = [v12 triForceRemoveItemAtPath:v9 error:&v17];
  uint64_t v10 = v17;

  int v14 = TRILogCategory_Server();
  id v15 = v14;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to remove path %{public}@ marked for deferred deletion: %{public}@", buf, 0x16u);
    }

LABEL_16:
    BOOL v11 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v9;
    _os_log_debug_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEBUG, "Deleted deferred item %{public}@", buf, 0xCu);
  }

  BOOL v11 = 1;
  *a5 = 1;
LABEL_17:

  return v11;
}

- (id)_linkPathForDeferredDeletedItemAtPath:(id)a3
{
  id v4 = a3;
  char v5 = [(TRIDeferredDeleter *)self _deferredDeletedLinksDir];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (id)_deferredDeletedLinksDir
{
  id v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  id v4 = [(NSString *)self->_rootDir stringByAppendingPathComponent:@"_deferredDeletedLinks"];
  return v4;
}

- (void).cxx_destruct
{
}

@end