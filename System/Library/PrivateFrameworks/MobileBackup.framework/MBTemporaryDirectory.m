@interface MBTemporaryDirectory
+ (id)sharedTemporaryDirectoryForTest:(id)a3;
+ (id)sharedTemporaryDirectoryIdentifiedBy:(id)a3;
+ (id)temporaryDirectoryOnSameVolumeAsPath:(id)a3 identifiedBy:(id)a4 error:(id *)a5;
+ (id)userTemporaryDirectoryForPersona:(id)a3 identifiedBy:(id)a4;
+ (id)userTemporaryDirectoryForTest:(id)a3;
- (BOOL)_purgeContentsAt:(id)a3 error:(id *)a4;
- (BOOL)dispose;
- (BOOL)disposeWithError:(id *)a3;
- (BOOL)purgeContentsWithError:(id *)a3;
- (NSString)path;
- (id)_initWithExistingFsRepPath:(char *)a3 identifier:(id)a4;
- (id)description;
- (id)makeTemporaryFilePath;
- (void)dealloc;
- (void)disposeWithoutDeleting;
@end

@implementation MBTemporaryDirectory

+ (id)sharedTemporaryDirectoryForTest:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    +[MBTemporaryDirectory sharedTemporaryDirectoryForTest:]();
  }
  if (_testingOnlySharedVolumeTmpDirRoot_onceToken != -1) {
    dispatch_once(&_testingOnlySharedVolumeTmpDirRoot_onceToken, &__block_literal_global);
  }
  id v4 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:_mkdtemp((const char *)_testingOnlySharedVolumeTmpDirRoot__path, v3, 0) identifier:v3];

  return v4;
}

+ (id)userTemporaryDirectoryForTest:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    +[MBTemporaryDirectory userTemporaryDirectoryForTest:]();
  }
  if (_testingOnlyUserVolumeTmpDirRoot_onceToken != -1) {
    dispatch_once(&_testingOnlyUserVolumeTmpDirRoot_onceToken, &__block_literal_global_79);
  }
  id v4 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:_mkdtemp((const char *)_testingOnlyUserVolumeTmpDirRoot__path, v3, 0) identifier:v3];

  return v4;
}

+ (id)sharedTemporaryDirectoryIdentifiedBy:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    +[MBTemporaryDirectory sharedTemporaryDirectoryIdentifiedBy:]();
  }
  if (_sharedVolumeTmpDirRoot_onceToken != -1) {
    dispatch_once(&_sharedVolumeTmpDirRoot_onceToken, &__block_literal_global_82);
  }
  id v4 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:_mkdtemp((const char *)_sharedVolumeTmpDirRoot__path, v3, 0) identifier:v3];

  return v4;
}

+ (id)userTemporaryDirectoryForPersona:(id)a3 identifiedBy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    +[MBTemporaryDirectory userTemporaryDirectoryForPersona:identifiedBy:]();
  }
  v7 = v6;
  if (![v6 length]) {
    +[MBTemporaryDirectory userTemporaryDirectoryForPersona:identifiedBy:]();
  }
  v8 = [v5 volumeMountPoint];
  v9 = [v8 stringByAppendingPathComponent:@"tmp"];
  id v10 = [v9 stringByAppendingPathComponent:@"com.apple.backup"];
  v11 = (const char *)[v10 fileSystemRepresentation];

  _mkpath_if_necessary(v11);
  id v12 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:_mkdtemp(v11, v7, 0) identifier:v7];

  return v12;
}

+ (id)temporaryDirectoryOnSameVolumeAsPath:(id)a3 identifiedBy:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:]();
  }
  v9 = v8;
  if (![v8 length]) {
    +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:]();
  }
  if (!a5) {
    +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:]();
  }
  id v10 = +[MBFileSystemManager volumeMountPointForFile:v7 error:a5];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 stringByAppendingPathComponent:@"tmp"];
    id v13 = [v12 stringByAppendingPathComponent:@"com.apple.backup"];
    v14 = (const char *)[v13 fileSystemRepresentation];

    _mkpath_if_necessary(v14);
    v15 = _mkdtemp(v14, v9, a5);
    if (v15) {
      v15 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:v15 identifier:v9];
    }
  }
  else
  {
    v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = *a5;
      *(_DWORD *)buf = 138412546;
      id v26 = v7;
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl(&dword_1DD9AE000, v16, OS_LOG_TYPE_ERROR, "=tmpdir= could not find mount point for %@: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= could not find mount point for %@: %@", v18, v19, v20, v21, v22, v23, (uint64_t)v7);
    }

    v15 = 0;
  }

  return v15;
}

- (id)_initWithExistingFsRepPath:(char *)a3 identifier:(id)a4
{
  id v7 = a4;
  if (!a3) {
    -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]();
  }
  id v8 = v7;
  if (!v7) {
    -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)MBTemporaryDirectory;
  v9 = [(MBTemporaryDirectory *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(NSString, "mb_stringWithFileSystemRepresentation:", a3);
    path = v9->_path;
    v9->_path = (NSString *)v10;

    v9->_fsRepPath = a3;
    objc_storeStrong((id *)&v9->_identifier, a4);
  }

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (id)makeTemporaryFilePath
{
  return _mktemp(self->_fsRepPath);
}

- (BOOL)purgeContentsWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = [(MBTemporaryDirectory *)self path];
  id v6 = [v5 stringByDeletingLastPathComponent];

  id v7 = v6;
  id v8 = _mktemp((const char *)[v7 fileSystemRepresentation]);
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [(MBTemporaryDirectory *)self path];
  id v34 = 0;
  char v11 = [v9 moveItemAtPath:v10 toPath:v8 error:&v34];
  id v12 = v34;

  if (v11)
  {
    objc_super v13 = [(MBTemporaryDirectory *)self path];
    id v33 = v12;
    char v14 = [v9 createDirectoryAtPath:v13 withIntermediateDirectories:0 attributes:0 error:&v33];
    id v15 = v33;

    if (v14)
    {
      BOOL v16 = [(MBTemporaryDirectory *)self _purgeContentsAt:v8 error:a3];
LABEL_15:
      id v12 = v15;
      goto LABEL_16;
    }
    v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = self;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_impl(&dword_1DD9AE000, v25, OS_LOG_TYPE_ERROR, "=tmpdir= %@ failed to create new contents directory: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= %@ failed to create new contents directory: %@", v26, v27, v28, v29, v30, v31, (uint64_t)self);
    }

    if (!a3)
    {
      BOOL v16 = 0;
      goto LABEL_15;
    }
    v24 = v15;
  }
  else
  {
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = self;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl(&dword_1DD9AE000, v17, OS_LOG_TYPE_ERROR, "=tmpdir= %@ failed to move contents aside to purge: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= %@ failed to move contents aside to purge: %@", v18, v19, v20, v21, v22, v23, (uint64_t)self);
    }

    if (!a3)
    {
      BOOL v16 = 0;
      goto LABEL_16;
    }
    v24 = v12;
  }
  id v12 = v24;
  BOOL v16 = 0;
  *a3 = v12;
LABEL_16:

  return v16;
}

- (BOOL)_purgeContentsAt:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  id v19 = 0;
  char v9 = [v8 removeItemAtPath:v7 error:&v19];

  id v10 = v19;
  if ((v9 & 1) == 0)
  {
    char v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_1DD9AE000, v11, OS_LOG_TYPE_ERROR, "=tmpdir= failed to delete %@: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= failed to delete %@: %@", v12, v13, v14, v15, v16, v17, (uint64_t)self);
    }

    if (a4) {
      *a4 = v10;
    }
  }

  return v9;
}

- (void)disposeWithoutDeleting
{
  obj = self;
  objc_sync_enter(obj);
  obj->_disposed = 1;
  objc_sync_exit(obj);
}

- (BOOL)disposeWithError:(id *)a3
{
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_disposed)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, v5, @"MBTemporaryDirectory.m", 241, @"TempDir: cannot be disposed multiple times %@", v5 object file lineNumber description];
  }
  v5->_disposed = 1;
  id v6 = [(MBTemporaryDirectory *)v5 path];
  BOOL v7 = [(MBTemporaryDirectory *)v5 _purgeContentsAt:v6 error:a3];

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)dispose
{
  return [(MBTemporaryDirectory *)self disposeWithError:0];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  free(self->_fsRepPath);
  self->_fsRepPath = 0;
  if (!self->_disposed)
  {
    id v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = self;
      _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_ERROR, "=tmpdir= %@ was not disposed before being dealloc'd", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= %@ was not disposed before being dealloc'd", v4, v5, v6, v7, v8, v9, (uint64_t)self);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)MBTemporaryDirectory;
  [(MBTemporaryDirectory *)&v10 dealloc];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%s: %@, path: %s>", class_getName(v4), self->_identifier, self->_fsRepPath];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)sharedTemporaryDirectoryForTest:.cold.1()
{
}

+ (void)userTemporaryDirectoryForTest:.cold.1()
{
}

+ (void)sharedTemporaryDirectoryIdentifiedBy:.cold.1()
{
}

+ (void)userTemporaryDirectoryForPersona:identifiedBy:.cold.1()
{
}

+ (void)userTemporaryDirectoryForPersona:identifiedBy:.cold.2()
{
}

+ (void)temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:.cold.1()
{
}

+ (void)temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:.cold.2()
{
}

+ (void)temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:.cold.3()
{
}

- (void)_initWithExistingFsRepPath:identifier:.cold.1()
{
}

- (void)_initWithExistingFsRepPath:identifier:.cold.2()
{
}

@end