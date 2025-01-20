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
    sub_100013C48();
  }
  if (qword_100026280 != -1) {
    dispatch_once(&qword_100026280, &stru_1000208C0);
  }
  id v4 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:sub_100007990((const char *)qword_100026278, v3, 0) identifier:v3];

  return v4;
}

+ (id)userTemporaryDirectoryForTest:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    sub_100013CCC();
  }
  if (qword_100026290 != -1) {
    dispatch_once(&qword_100026290, &stru_1000208E0);
  }
  id v4 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:sub_100007990((const char *)qword_100026288, v3, 0) identifier:v3];

  return v4;
}

+ (id)sharedTemporaryDirectoryIdentifiedBy:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    sub_100013CF8();
  }
  if (qword_1000262A0 != -1) {
    dispatch_once(&qword_1000262A0, &stru_100020900);
  }
  id v4 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:sub_100007990((const char *)qword_100026298, v3, 0) identifier:v3];

  return v4;
}

+ (id)userTemporaryDirectoryForPersona:(id)a3 identifiedBy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    sub_100013D24();
  }
  v7 = v6;
  if (![v6 length]) {
    sub_100013D50();
  }
  v8 = [v5 volumeMountPoint];
  v9 = [v8 stringByAppendingPathComponent:@"tmp"];
  id v10 = [v9 stringByAppendingPathComponent:@"com.apple.backup"];
  v11 = (const char *)[v10 fileSystemRepresentation];

  sub_100007D70(v11);
  id v12 = [[MBTemporaryDirectory alloc] _initWithExistingFsRepPath:sub_100007990(v11, v7, 0) identifier:v7];

  return v12;
}

+ (id)temporaryDirectoryOnSameVolumeAsPath:(id)a3 identifiedBy:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    sub_100013DA8();
  }
  v9 = v8;
  if (![v8 length]) {
    sub_100013DD4();
  }
  if (!a5) {
    sub_100013E00();
  }
  id v10 = +[MBFileSystemManager volumeMountPointForFile:v7 error:a5];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 stringByAppendingPathComponent:@"tmp"];
    id v13 = [v12 stringByAppendingPathComponent:@"com.apple.backup"];
    v14 = (const char *)[v13 fileSystemRepresentation];

    sub_100007D70(v14);
    v15 = sub_100007990(v14, v9, (char *)a5);
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
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=tmpdir= could not find mount point for %@: %@", buf, 0x16u);
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
    sub_100013E2C();
  }
  id v8 = v7;
  if (!v7) {
    sub_100013E58();
  }
  v13.receiver = self;
  v13.super_class = (Class)MBTemporaryDirectory;
  v9 = [(MBTemporaryDirectory *)&v13 init];
  if (v9)
  {
    uint64_t v10 = +[NSString mb_stringWithFileSystemRepresentation:a3];
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
  return sub_10000804C(self->_fsRepPath);
}

- (BOOL)purgeContentsWithError:(id *)a3
{
  id v5 = [(MBTemporaryDirectory *)self path];
  id v6 = [v5 stringByDeletingLastPathComponent];

  id v7 = v6;
  id v8 = sub_10000804C((const char *)[v7 fileSystemRepresentation]);
  v9 = +[NSFileManager defaultManager];
  uint64_t v10 = [(MBTemporaryDirectory *)self path];
  id v34 = 0;
  unsigned __int8 v11 = [v9 moveItemAtPath:v10 toPath:v8 error:&v34];
  id v12 = v34;

  if (v11)
  {
    objc_super v13 = [(MBTemporaryDirectory *)self path];
    id v33 = v12;
    unsigned __int8 v14 = [v9 createDirectoryAtPath:v13 withIntermediateDirectories:0 attributes:0 error:&v33];
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
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "=tmpdir= %@ failed to create new contents directory: %@", buf, 0x16u);
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
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "=tmpdir= %@ failed to move contents aside to purge: %@", buf, 0x16u);
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
  id v6 = a3;
  id v7 = +[NSFileManager defaultManager];
  id v18 = 0;
  unsigned __int8 v8 = [v7 removeItemAtPath:v6 error:&v18];

  id v9 = v18;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = self;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=tmpdir= failed to delete %@: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= failed to delete %@: %@", v11, v12, v13, v14, v15, v16, (uint64_t)self);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
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
  id v4 = self;
  objc_sync_enter(v4);
  v4->_disposed = 1;
  id v5 = [(MBTemporaryDirectory *)v4 path];
  LOBYTE(a3) = [(MBTemporaryDirectory *)v4 _purgeContentsAt:v5 error:a3];

  objc_sync_exit(v4);
  return (char)a3;
}

- (BOOL)dispose
{
  return [(MBTemporaryDirectory *)self disposeWithError:0];
}

- (void)dealloc
{
  free(self->_fsRepPath);
  self->_fsRepPath = 0;
  if (!self->_disposed)
  {
    id v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "=tmpdir= %@ was not disposed before being dealloc'd", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"=tmpdir= %@ was not disposed before being dealloc'd", v4, v5, v6, v7, v8, v9, (uint64_t)self);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)MBTemporaryDirectory;
  [(MBTemporaryDirectory *)&v10 dealloc];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%s: %@, path: %s>", class_getName(v3), self->_identifier, self->_fsRepPath];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end