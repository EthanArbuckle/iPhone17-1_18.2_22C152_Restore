@interface MBManifestDB
+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 domainManager:(id)a5 error:(id *)a6;
+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 properties:(id)a5 domainManager:(id)a6 error:(id *)a7;
+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 properties:(id)a5 domainManager:(id)a6 keybag:(id)a7 error:(id *)a8;
- (BOOL)_checkPassword:(id)a3 withPasswordHash:(id)a4 andSalt:(id)a5;
- (BOOL)_isNotFoundError:(id)a3;
- (BOOL)_setupCacheWithError:(id *)a3;
- (BOOL)_setupConnectionWithError:(id *)a3;
- (BOOL)checkWithError:(id *)a3;
- (BOOL)closeAndRemoveFileWithError:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)containsFileID:(id)a3 error:(id *)a4;
- (BOOL)containsPlaceholderForFileID:(id)a3 error:(id *)a4;
- (BOOL)containsRegularFileForFileID:(id)a3 error:(id *)a4;
- (BOOL)domainRedirects;
- (BOOL)encrypted;
- (BOOL)hasUnverifiedFilesWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)setPasswordHashForPassword:(id)a3 salt:(id)a4 withError:(id *)a5;
- (BOOL)setupEncryptionWithPassword:(id)a3 withError:(id *)a4;
- (BOOL)uploadToPath:(id)a3 withDrive:(id)a4 keybag:(id)a5 error:(id *)a6;
- (MBDomainManager)domainManager;
- (MBEncryptedFileHandle)encryptedFileHandle;
- (MBManifestDB)initWithPath:(id)a3 domainManager:(id)a4;
- (MBManifestDB)initWithPath:(id)a3 properties:(id)a4 domainManager:(id)a5;
- (MBProperties)properties;
- (NSData)passwordData;
- (NSData)passwordHash;
- (NSData)salt;
- (NSString)path;
- (OS_dispatch_queue)callbackQueue;
- (PQLConnection)pql_database;
- (id)_enumerateObjectsOfClass:(Class)a3 withCallback:(id)a4 format:(id)a5;
- (id)_executeSQL:(id)a3;
- (id)_fetchObjectOfClass:(Class)a3 withError:(id *)a4 format:(id)a5;
- (id)_newConnection:(id)a3;
- (id)_passwordHashWithPassword:(id)a3 salt:(id)a4;
- (id)addFile:(id)a3 flags:(unint64_t)a4;
- (id)addPlaceholderForFile:(id)a3 flags:(unint64_t)a4;
- (id)enumerateFiles:(id)a3;
- (id)enumerateFiles:(id)a3 includeUninstalled:(BOOL)a4;
- (id)fetchFileWithID:(id)a3 error:(id *)a4;
- (id)fetchPropertyWithName:(id)a3 class:(Class)a4 error:(id *)a5;
- (id)getEncryptedFileHandleWithKeybag:(id)a3 error:(id *)a4;
- (id)removeEphemeralRetriedFiles;
- (id)removeFileWithID:(id)a3;
- (id)removeFilesNotAlreadyUploaded;
- (id)setFlags:(unint64_t)a3 forFileID:(id)a4;
- (id)setFlags:(unint64_t)a3 mask:(unint64_t)a4 forFileID:(id)a5;
- (id)setPropertyWithName:(id)a3 value:(id)a4;
- (id)unsetAlreadyUploadedFlags;
- (id)unsetVerifiedFlags;
- (unint64_t)flagsForFileID:(id)a3 error:(id *)a4;
- (void)_checkEncryption;
- (void)_performOnDBQueue:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)performCallbackOnQueue:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDomainRedirects:(BOOL)a3;
- (void)setEncryptedFileHandle:(id)a3;
- (void)setPasswordData:(id)a3;
- (void)setPasswordHash:(id)a3;
- (void)setSalt:(id)a3;
@end

@implementation MBManifestDB

+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 properties:(id)a5 domainManager:(id)a6 keybag:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = MBTemporaryPath();
  if ([v15 encrypted]
    && ([v15 manifestEncryptionKey],
        v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        !v17)
    && v19)
  {
    v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "No keybag available to decrypt manifest", buf, 2u);
      _MBLog();
    }

    if (a8)
    {
      +[MBError errorWithCode:1 format:@"No keybag available to decrypt encrypted manifest"];
      v21 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    if ([v15 encrypted])
    {
      v22 = [v15 manifestEncryptionKey];

      v23 = &__NSDictionary0__struct;
      if (v17 && v22)
      {
        v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Decrypting manifest database", buf, 2u);
          _MBLog();
        }

        v25 = objc_alloc_init(MBManifestDBDownloadHelper);
        [(MBManifestDBDownloadHelper *)v25 setKeybag:v17];
        [(MBManifestDBDownloadHelper *)v25 setProperties:v15];
        CFStringRef v36 = @"FileHandleFactory";
        v37 = v25;
        v23 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      }
    }
    else
    {
      v23 = &__NSDictionary0__struct;
    }
    id v31 = 0;
    unsigned __int8 v26 = [v13 downloadFileAtPath:v14 toPath:v18 options:v23 error:&v31];
    id v27 = v31;
    if ((v26 & 1) == 0)
    {
      v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to download manifest db from backup: %@", buf, 0xCu);
        _MBLog();
      }

      if (a8) {
        *a8 = v27;
      }
    }
    v21 = [[MBManifestDB alloc] initWithPath:v18 properties:v15 domainManager:v16];
    v29 = MBGetDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v14;
      __int16 v34 = 2112;
      v35 = v18;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "ManifestDB: downloading %@ to %@", buf, 0x16u);
      _MBLog();
    }
  }

  return v21;
}

+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 properties:(id)a5 domainManager:(id)a6 error:(id *)a7
{
  return (MBManifestDB *)[a1 manifestDBWithDrive:a3 sourcePath:a4 properties:a5 domainManager:a6 keybag:0 error:a7];
}

+ (MBManifestDB)manifestDBWithDrive:(id)a3 sourcePath:(id)a4 domainManager:(id)a5 error:(id *)a6
{
  return +[MBManifestDB manifestDBWithDrive:a3 sourcePath:a4 properties:0 domainManager:a5 error:a6];
}

- (MBManifestDB)initWithPath:(id)a3 domainManager:(id)a4
{
  return [(MBManifestDB *)self initWithPath:a3 properties:0 domainManager:a4];
}

- (MBManifestDB)initWithPath:(id)a3 properties:(id)a4 domainManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MBManifestDB;
  id v13 = [(MBManifestDB *)&v23 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_path, a3);
    objc_storeStrong((id *)&v14->_domainManager, a5);
    p_properties = (void **)&v14->_properties;
    objc_storeStrong((id *)&v14->_properties, a4);
    if (!v14->_properties)
    {
      id v16 = objc_alloc_init(MBProperties);
      id v17 = *p_properties;
      *p_properties = v16;
    }
    encryptedFileHandle = v14->_encryptedFileHandle;
    v14->_encryptedFileHandle = 0;

    if (!v14->_domainManager)
    {
      v22 = +[NSAssertionHandler currentHandler];
      [v22 handleFailureInMethod:a2 object:v14 file:@"MBManifestDB.m" lineNumber:160 description:@"DomainManager must not be nil"];
    }
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.MobileBackup.MBManifestDBCallback", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    callbackQueue = v14->_callbackQueue;
    v14->_callbackQueue = (OS_dispatch_queue *)v19;
  }
  return v14;
}

- (void)dealloc
{
  v3 = self->_pdb;
  pdb = self->_pdb;
  self->_pdb = 0;

  if (v3)
  {
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      id v12 = path;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Database (%@) should be closed before dealloc", buf, 0xCu);
      _MBLog();
    }

    v7 = [(PQLConnection *)v3 serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049B98;
    block[3] = &unk_1000F1A78;
    id v10 = v3;
    dispatch_async(v7, block);
  }
  v8.receiver = self;
  v8.super_class = (Class)MBManifestDB;
  [(MBManifestDB *)&v8 dealloc];
}

- (BOOL)openWithError:(id *)a3
{
  if (!self->_pdb)
  {
    v4 = [objc_alloc((Class)NSString) initWithFormat:@"ManifestDB-%lu", -[MBManifestDB hash](self, "hash")];
    v6 = [(NSString *)self->_path stringByDeletingLastPathComponent];
    v9 = +[NSFileManager defaultManager];
    v21[0] = NSFileOwnerAccountName;
    v21[1] = NSFileGroupOwnerAccountName;
    v22[0] = @"mobile";
    v22[1] = @"mobile";
    id v10 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    LODWORD(a3) = [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v10 error:a3];

    if (a3)
    {
      id v11 = [(MBManifestDB *)self _newConnection:v4];
      pdb = self->_pdb;
      self->_pdb = v11;

      id v18 = 0;
      unsigned int v13 = [(MBManifestDB *)self _setupCacheWithError:&v18];
      id v14 = v18;
      if (v13)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100049E30;
        v17[3] = &unk_1000F1A78;
        v17[4] = self;
        [(MBManifestDB *)self _performOnDBQueue:v17];

        goto LABEL_2;
      }
      id v15 = self->_pdb;
      self->_pdb = 0;
    }
    BOOL v7 = 0;
    goto LABEL_10;
  }
LABEL_2:
  v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(MBManifestDB *)self path];
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ManifestDB: opening %@", buf, 0xCu);

    v6 = [(MBManifestDB *)self path];
    _MBLog();
    BOOL v7 = 1;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  dispatch_queue_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10004A148;
  v22 = sub_10004A158;
  id v23 = 0;
  v5 = [(MBManifestDB *)self pql_database];

  if (v5)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004A160;
    v17[3] = &unk_1000F1AA0;
    v17[4] = self;
    void v17[5] = &v24;
    v17[6] = &v18;
    [(MBManifestDB *)self _performOnDBQueue:v17];
    v6 = [(MBManifestDB *)self path];
    BOOL v7 = [v6 stringByAppendingString:@"-shm"];

    objc_super v8 = +[NSFileManager defaultManager];
    [v8 removeItemAtPath:v7 error:0];

    pdb = self->_pdb;
    self->_pdb = 0;
  }
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(MBManifestDB *)self path];
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ManifestDB: closing %@", buf, 0xCu);
    }
    id v16 = [(MBManifestDB *)self path];
    _MBLog();
  }
  int v13 = *((unsigned __int8 *)v25 + 24);
  if (a3 && !*((unsigned char *)v25 + 24))
  {
    *a3 = (id) v19[5];
    int v13 = *((unsigned __int8 *)v25 + 24);
  }
  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (BOOL)closeAndRemoveFileWithError:(id *)a3
{
  BOOL v5 = -[MBManifestDB closeWithError:](self, "closeWithError:");
  if (v5)
  {
    v6 = +[NSFileManager defaultManager];
    BOOL v7 = [(MBManifestDB *)self path];
    unsigned int v8 = [v6 removeItemAtPath:v7 error:a3];

    if (v8)
    {
      encryptedFileHandle = self->_encryptedFileHandle;
      self->_encryptedFileHandle = 0;

      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(MBManifestDB *)self path];
        *(_DWORD *)buf = 138412290;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ManifestDB: removing %@", buf, 0xCu);

        int v13 = [(MBManifestDB *)self path];
        _MBLog();
      }
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)checkWithError:(id *)a3
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10004A148;
  id v16 = sub_10004A158;
  id v17 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004A4BC;
  v7[3] = &unk_1000F1AA0;
  v7[4] = self;
  v7[5] = &v12;
  v7[6] = &v8;
  [(MBManifestDB *)self _performOnDBQueue:v7];
  int v4 = *((unsigned __int8 *)v9 + 24);
  if (a3 && !*((unsigned char *)v9 + 24))
  {
    *a3 = (id) v13[5];
    int v4 = *((unsigned __int8 *)v9 + 24);
  }
  BOOL v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

- (void)flush
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004A5C4;
  v2[3] = &unk_1000F1A78;
  v2[4] = self;
  [(MBManifestDB *)self _performOnDBQueue:v2];
}

- (BOOL)uploadToPath:(id)a3 withDrive:(id)a4 keybag:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [(MBManifestDB *)self properties];
  unsigned int v14 = [v13 encrypted];

  if (!v14)
  {
    dispatch_queue_t v19 = &__NSDictionary0__struct;
    goto LABEL_7;
  }
  id v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    v30 = path;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Setting up the upload of an encrypted manifest database located at %@", buf, 0xCu);
    _MBLog();
  }

  id v17 = objc_alloc_init(MBManifestDBUploadHelper);
  uint64_t v18 = [(MBManifestDB *)self getEncryptedFileHandleWithKeybag:v12 error:a6];
  [(MBManifestDBUploadHelper *)v17 setFileHandle:v18];

  if (self->_encryptedFileHandle)
  {
    CFStringRef v33 = @"FileHandleFactory";
    __int16 v34 = v17;
    dispatch_queue_t v19 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];

LABEL_7:
    uint64_t v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = self->_path;
      *(_DWORD *)buf = 138412546;
      v30 = v21;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "ManifestDB: uploading manifest database from path %@ to path %@", buf, 0x16u);
      _MBLog();
    }

    v22 = self->_path;
    id v28 = 0;
    unsigned __int8 v23 = [v11 uploadFileAtPath:v22 toPath:v10 options:v19 error:&v28];
    id v24 = v28;
    if (v23)
    {
      BOOL v25 = 1;
    }
    else if (a6)
    {
      id v24 = v24;
      BOOL v25 = 0;
      *a6 = v24;
    }
    else
    {
      BOOL v25 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v26 = MBGetDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Can't upload without a file handle to the db", buf, 2u);
    _MBLog();
  }

  id v24 = 0;
  BOOL v25 = 0;
  dispatch_queue_t v19 = &__NSDictionary0__struct;
LABEL_17:

  return v25;
}

- (id)getEncryptedFileHandleWithKeybag:(id)a3 error:(id *)a4
{
  if (self->_encryptedFileHandle)
  {
    BOOL v5 = MBGetDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    unsigned int v14 = path;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Using existing cached file handle for manifest DB at path %@", buf, 0xCu);
  }
  else
  {
    p_path = &self->_path;
    uint64_t v8 = +[MBEncryptedFileHandle encryptedFileHandleForBackupWithPath:self->_path keybag:a3 error:a4];
    encryptedFileHandle = self->_encryptedFileHandle;
    self->_encryptedFileHandle = v8;

    BOOL v5 = MBGetDefaultLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v10 = *p_path;
    *(_DWORD *)buf = 138412290;
    unsigned int v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Acquiring and caching a new encrypted file handle for manifest DB at path %@", buf, 0xCu);
  }
  _MBLog();
LABEL_7:

  id v11 = self->_encryptedFileHandle;

  return v11;
}

- (id)_newConnection:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)PQLConnection);
  [v4 setSqliteErrorHandler:&stru_1000F1AE0];
  BOOL v5 = [v4 sqliteErrorHandler];
  [v4 setAutoRollbackHandler:v5];

  [v4 setLabel:v3];
  v6 = +[MBBehaviorOptions sharedOptions];
  [v4 setTraced:[v6 sqlTrace]];

  [v4 setCrashIfUsedAfterClose:1];
  [v4 setStatementCacheMaxCount:30];
  return v4;
}

- (BOOL)_setupConnectionWithError:(id *)a3
{
  BOOL v5 = [(MBManifestDB *)self pql_database];
  v6 = +[NSURL fileURLWithPath:self->_path];
  unsigned int v7 = [v5 openAtURL:v6 withFlags:6 error:a3];

  if (v7)
  {
    uint64_t v8 = [(MBManifestDB *)self pql_database];
    unsigned __int8 v9 = [v8 setupPragmas];

    if (v9) {
      return 1;
    }
    id v11 = [(MBManifestDB *)self pql_database];
    [v11 close:a3];
  }
  pdb = self->_pdb;
  self->_pdb = 0;

  return 0;
}

- (BOOL)_setupCacheWithError:(id *)a3
{
  BOOL v5 = -[MBManifestDB _setupConnectionWithError:](self, "_setupConnectionWithError:");
  if (v5)
  {
    v6 = [(MBManifestDB *)self pql_database];
    unsigned int v7 = [v6 userVersion];
    id v8 = [v7 unsignedIntValue];

    unsigned __int8 v9 = [(MBManifestDB *)self pql_database];
    id v10 = v9;
    if (v8 < 2)
    {
      id v11 = [v9 url];

      *(_DWORD *)v49 = 61;
      id v12 = [(MBManifestDB *)self pql_database];
      uint64_t v13 = sqlite3_file_control((sqlite3 *)[v12 dbHandle], 0, 101, v49);

      unsigned int v14 = [(MBManifestDB *)self pql_database];
      unsigned __int8 v15 = [v14 close:a3];

      if ((v15 & 1) == 0)
      {
        id v16 = MBGetDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = *a3;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Can't close db: %@", buf, 0xCu);
          id v43 = *a3;
          _MBLog();
        }
      }
      if (v13)
      {
        uint64_t v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v13;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to truncate database at %@: %d", buf, 0x12u);
          id v43 = v11;
          uint64_t v44 = v13;
          _MBLog();
        }

        id v19 = v11;
        if (unlink((const char *)[v19 fileSystemRepresentation]) < 0)
        {
          uint64_t v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            int v21 = *__error();
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v19;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to unlink %@: %{errno}d", buf, 0x12u);
            id v43 = v19;
            uint64_t v44 = *__error();
            _MBLog();
          }
        }
      }
      unsigned int v22 = -[MBManifestDB _setupConnectionWithError:](self, "_setupConnectionWithError:", a3, v43, v44);

      if (v22)
      {
        unsigned __int8 v23 = [(MBManifestDB *)self pql_database];
        [v23 execute:@"PRAGMA cache_size = 250"];

        id v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Migrating manifest database from version %d to %d", buf, 0xEu);
          id v43 = v8;
          uint64_t v44 = 2;
          _MBLog();
        }

        BOOL v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Migrating database from version %d to %d", buf, 0xEu);
          id v43 = v8;
          uint64_t v44 = 2;
          _MBLog();
        }

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v56 = sub_10004A148;
        v57 = sub_10004A158;
        id v58 = 0;
        uint64_t v26 = [(MBManifestDB *)self pql_database];
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10004B578;
        v45[3] = &unk_1000F1B38;
        int v46 = 0;
        int v47 = (int)v8;
        int v48 = 2;
        v45[4] = self;
        v45[5] = buf;
        unsigned __int8 v27 = [v26 performWithFlags:10 action:v45];

        if (v27)
        {
          id v28 = [(MBManifestDB *)self pql_database];
          [v28 setUserVersion:2];

          v29 = [(MBManifestDB *)self pql_database];
          v30 = [v29 userVersion];
          [v30 unsignedIntValue];

          _Block_object_dispose(buf, 8);
LABEL_22:
          __int16 v31 = [(MBManifestDB *)self pql_database];
          id v32 = +[MBBehaviorOptions sharedOptions];
          [v32 sqlBatchTime];
          double v34 = v33;
          v35 = +[MBBehaviorOptions sharedOptions];
          [v31 useBatchingWithDelay:[v35 sqlBatchCount] changeCount:v34];

          CFStringRef v36 = [(MBManifestDB *)self pql_database];
          [v36 useSerialQueue];

          v37 = [(MBManifestDB *)self pql_database];
          v38 = [v37 serialQueue];
          dispatch_queue_set_specific(v38, self, self, 0);

          LOBYTE(v5) = 1;
          return v5;
        }
        v39 = MBGetDefaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v49 = 67109634;
          int v50 = (int)v8;
          __int16 v51 = 1024;
          int v52 = 2;
          __int16 v53 = 2112;
          uint64_t v54 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Migration from version %d to %d failed, error:%@", v49, 0x18u);
          _MBLog();
        }

        v41 = [(MBManifestDB *)self pql_database];
        [v41 close:0];

        if (a3) {
          *a3 = *(id *)(*(void *)&buf[8] + 40);
        }
        _Block_object_dispose(buf, 8);
      }
      LOBYTE(v5) = 0;
      return v5;
    }
    [v9 execute:@"PRAGMA cache_size = 250"];

    goto LABEL_22;
  }
  return v5;
}

- (void)_performOnDBQueue:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (dispatch_get_specific(self) == self)
  {
    v4[2](v4);
  }
  else
  {
    BOOL v5 = self;
    objc_sync_enter(v5);
    v6 = [(PQLConnection *)v5->_pdb serialQueue];
    dispatch_assert_queue_not_V2(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004B820;
    block[3] = &unk_1000F1B60;
    unsigned __int8 v9 = v4;
    dispatch_sync(v6, block);

    objc_sync_exit(v5);
  }
}

- (void)performCallbackOnQueue:(id)a3
{
}

- (BOOL)_isNotFoundError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)12)
  {
    id v4 = [v3 domain];
    unsigned __int8 v5 = [v4 isEqualToString:PQLSqliteErrorDomain];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)_executeSQL:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned __int8 v15 = sub_10004A148;
  id v16 = sub_10004A158;
  id v17 = 0;
  id v11 = &v19;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004BA28;
  v6[3] = &unk_1000F1728;
  unsigned int v7 = self;
  id v3 = a3;
  unsigned __int8 v9 = &v12;
  id v10 = &v11;
  id v8 = v3;
  [(MBManifestDB *)v7 _performOnDBQueue:v6];
  id v4 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v4;
}

- (id)_enumerateObjectsOfClass:(Class)a3 withCallback:(id)a4 format:(id)a5
{
  id v8 = a4;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unsigned __int8 v23 = sub_10004A148;
  id v24 = sub_10004A158;
  id v25 = 0;
  uint64_t v19 = &v27;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004BC44;
  v13[3] = &unk_1000F1BB0;
  v13[4] = self;
  id v9 = a5;
  id v14 = v9;
  id v17 = &v19;
  Class v18 = a3;
  id v10 = v8;
  id v15 = v10;
  id v16 = &v20;
  [(MBManifestDB *)self _performOnDBQueue:v13];
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v11;
}

- (id)_fetchObjectOfClass:(Class)a3 withError:(id *)a4 format:(id)a5
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_10004A148;
  id v28 = sub_10004A158;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = sub_10004A148;
  uint64_t v22 = sub_10004A158;
  id v23 = 0;
  id v17 = &v31;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004C0D8;
  v10[3] = &unk_1000F1BD8;
  uint64_t v13 = &v18;
  id v11 = self;
  Class v15 = a3;
  id v6 = a5;
  id v16 = &v17;
  id v12 = v6;
  id v14 = &v24;
  [(MBManifestDB *)v11 _performOnDBQueue:v10];
  unsigned int v7 = (void *)v19[5];
  if (a4 && !v7)
  {
    *a4 = (id) v25[5];
    unsigned int v7 = (void *)v19[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (void)_checkEncryption
{
  if ([(MBManifestDB *)self encrypted])
  {
    id v3 = [(MBManifestDB *)self passwordData];

    if (!v3)
    {
      id v7 = objc_alloc((Class)MBException);
      CFStringRef v8 = @"Manifest is encrypted but no password set";
      uint64_t v9 = 207;
LABEL_8:
      objc_exception_throw([v7 initWithCode:v9 format:v8]);
    }
  }
  uint64_t v4 = [(MBManifestDB *)self passwordData];
  if (v4)
  {
    unsigned __int8 v5 = (void *)v4;
    id v6 = [(MBManifestDB *)self passwordHash];

    if (!v6)
    {
      id v7 = objc_alloc((Class)MBException);
      CFStringRef v8 = @"Password is set but no password hash available";
      uint64_t v9 = 1;
      goto LABEL_8;
    }
  }
}

- (BOOL)_checkPassword:(id)a3 withPasswordHash:(id)a4 andSalt:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (v8 | v9)
  {
    if (!v8 || v9)
    {
      if (v8 || !v9)
      {
        id v14 = [(id)v8 dataUsingEncoding:4];
        id v11 = [(MBManifestDB *)self _passwordHashWithPassword:v14 salt:v10];

        unsigned __int8 v12 = [(id)v9 isEqualToData:v11];
        if ((v12 & 1) == 0)
        {
          Class v15 = MBGetDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = [(id)v9 base64EncodedStringWithOptions:0];
            id v17 = [v11 base64EncodedStringWithOptions:0];
            *(_DWORD *)buf = 138412546;
            int v21 = v16;
            __int16 v22 = 2112;
            id v23 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Password does not match password hash (%@ != %@)", buf, 0x16u);

            uint64_t v18 = [(id)v9 base64EncodedStringWithOptions:0];
            uint64_t v19 = [v11 base64EncodedStringWithOptions:0];
            _MBLog();
          }
        }
        goto LABEL_13;
      }
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Password not set but there is a password hash", buf, 2u);
        goto LABEL_11;
      }
    }
    else
    {
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Password set but no available password hash", buf, 2u);
LABEL_11:
        _MBLog();
      }
    }
    unsigned __int8 v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  unsigned __int8 v12 = 1;
LABEL_14:

  return v12;
}

- (id)_passwordHashWithPassword:(id)a3 salt:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  [v6 appendData:v5];

  id v7 = +[MBDigest sha256];
  unint64_t v8 = [v7 digestForData:v6];

  return v8;
}

- (BOOL)setupEncryptionWithPassword:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting up encryption for manifest database", buf, 2u);
    _MBLog();
  }

  uint64_t v8 = [(MBManifestDB *)self passwordData];
  if (!v8)
  {
LABEL_8:
    id v30 = 0;
    id v14 = [(MBManifestDB *)self fetchPropertyWithName:@"passwordHash" class:objc_opt_class() error:&v30];
    id v15 = v30;
    if (v15)
    {
      id v16 = v15;
      id v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to fetch password hash from database: %@", buf, 0xCu);
        _MBLog();
      }

      if (a4)
      {
        id v16 = v16;
        BOOL v13 = 0;
        *a4 = v16;
      }
      else
      {
        BOOL v13 = 0;
      }
      goto LABEL_44;
    }
    id v29 = 0;
    uint64_t v18 = [(MBManifestDB *)self fetchPropertyWithName:@"salt" class:objc_opt_class() error:&v29];
    id v16 = v29;
    if (v16)
    {
      uint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to fetch salt from database: %@", buf, 0xCu);
        _MBLog();
      }

      if (a4)
      {
        id v20 = v16;
LABEL_41:
        BOOL v13 = 0;
        *a4 = v20;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
LABEL_42:
      BOOL v13 = 0;
      goto LABEL_43;
    }
    if (!v14 || v18)
    {
      if (!v14
        || !v18
        || [(MBManifestDB *)self _checkPassword:v6 withPasswordHash:v14 andSalt:v18])
      {
        uint64_t v24 = [v6 dataUsingEncoding:4];
        BOOL v13 = v24 != 0;
        if (v24)
        {
          [(MBManifestDB *)self setSalt:v18];
          id v25 = [(MBManifestDB *)self salt];

          if (v25) {
            [(MBManifestDB *)self setPasswordData:v24];
          }
        }
        else
        {
          uint64_t v26 = MBGetDefaultLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to encode password", buf, 2u);
            _MBLog();
          }

          if (a4)
          {
            *a4 = +[MBError errorWithCode:207 format:@"Failed to encode password"];
          }
        }

        goto LABEL_43;
      }
      uint64_t v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Password does not match existing manifest password hash", buf, 2u);
        _MBLog();
      }

      if (!a4) {
        goto LABEL_42;
      }
      CFStringRef v22 = @"Password does not match existing manifest password hash";
      uint64_t v23 = 207;
    }
    else
    {
      int v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Inconsistent encryption settings in database: password hash without salt", buf, 2u);
        _MBLog();
      }

      if (!a4) {
        goto LABEL_42;
      }
      CFStringRef v22 = @"Inconsistent encryption settings in manifest database";
      uint64_t v23 = 205;
    }
    id v20 = +[MBError errorWithCode:v23 format:v22];
    goto LABEL_41;
  }
  unint64_t v9 = (void *)v8;
  uint64_t v10 = [(MBManifestDB *)self passwordHash];
  if (!v10)
  {

    goto LABEL_8;
  }
  id v11 = (void *)v10;
  unsigned __int8 v12 = [(MBManifestDB *)self salt];

  if (!v12) {
    goto LABEL_8;
  }
  BOOL v13 = 1;
LABEL_45:

  return v13;
}

- (BOOL)setPasswordHashForPassword:(id)a3 salt:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(MBManifestDB *)self _passwordHashWithPassword:v8 salt:v9];
    if (v10)
    {
      id v11 = [(MBManifestDB *)self setPropertyWithName:@"passwordHash" value:v10];
      BOOL v12 = v11 == 0;
      if (v11)
      {
        BOOL v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to store password hash in database: %@", buf, 0xCu);
          _MBLog();
        }

        if (a5) {
          *a5 = v11;
        }
      }
      else
      {
        [(MBManifestDB *)self setPasswordHash:v10];
      }
    }
    else
    {
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to generate password hash", buf, 2u);
        _MBLog();
      }

      if (a5)
      {
        +[MBError errorWithCode:1 format:@"Failed to generate password hash"];
        BOOL v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = 0;
      }
    }
  }
  else if (a5)
  {
    +[MBError errorWithCode:207 format:@"Cannot set password hash without a password"];
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)encrypted
{
  id v3 = [(MBManifestDB *)self passwordData];
  if (v3)
  {
    uint64_t v4 = [(MBManifestDB *)self salt];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)addFile:(id)a3 flags:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", [v6 mode]) | a4;
  id v8 = v6;
  id v9 = [v8 fileID];
  uint64_t v10 = [v9 string];
  id v11 = [v8 domain];
  BOOL v12 = [v11 name];
  BOOL v13 = [v8 relativePath];
  id v14 = [(MBManifestDB *)self _executeSQL:@"INSERT OR REPLACE INTO Files (fileID, domain, relativePath, flags, file) VALUES (%@, %@, %@, %lu, %@)", v10, v12, v13, v7, v8];

  return v14;
}

- (id)addPlaceholderForFile:(id)a3 flags:(unint64_t)a4
{
  id v6 = [a3 fileID];
  unint64_t v7 = [v6 string];
  id v8 = [(MBManifestDB *)self _executeSQL:@"INSERT OR IGNORE INTO Files (fileID, flags) VALUES (%@, %lu)", v7, a4];

  return v8;
}

- (id)removeFileWithID:(id)a3
{
  uint64_t v4 = [a3 string];
  BOOL v5 = [(MBManifestDB *)self _executeSQL:@"DELETE FROM Files WHERE fileID = %@", v4];

  return v5;
}

- (id)setFlags:(unint64_t)a3 mask:(unint64_t)a4 forFileID:(id)a5
{
  id v8 = a5;
  id v9 = [v8 string];
  uint64_t v10 = [(MBManifestDB *)self _executeSQL:@"INSERT OR IGNORE INTO Files (fileID, flags) VALUES (%@, %lu)", v9, a3];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    BOOL v12 = [v8 string];
    [(MBManifestDB *)self _executeSQL:@"UPDATE Files SET flags = ((flags & %lu) | %lu) WHERE fileID = %@", a4, a3, v12];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)setFlags:(unint64_t)a3 forFileID:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [v6 string];
  id v8 = [(MBManifestDB *)self _executeSQL:@"INSERT OR IGNORE INTO Files (fileID, flags) VALUES (%@, %lu)", v7, a3];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = [v6 string];
    [(MBManifestDB *)self _executeSQL:@"UPDATE Files SET flags = (flags | %lu) WHERE fileID = %@", a3, v10];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (unint64_t)flagsForFileID:(id)a3 error:(id *)a4
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_10004A148;
  v16[4] = sub_10004A158;
  id v17 = 0;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004D178;
  v7[3] = &unk_1000F1C00;
  id v8 = self;
  id v4 = a3;
  id v9 = v4;
  uint64_t v10 = &v12;
  id v11 = v16;
  [(MBManifestDB *)v8 _performOnDBQueue:v7];
  unint64_t v5 = v13[3];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  return v5;
}

- (BOOL)containsFileID:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004A148;
  int v21 = sub_10004A158;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D3E8;
  v8[3] = &unk_1000F1C00;
  id v9 = self;
  id v5 = a3;
  id v10 = v5;
  id v11 = &v13;
  uint64_t v12 = &v17;
  [(MBManifestDB *)v9 _performOnDBQueue:v8];
  if (a4) {
    *a4 = (id) v18[5];
  }
  char v6 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (BOOL)containsPlaceholderForFileID:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004A148;
  int v21 = sub_10004A158;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D65C;
  v8[3] = &unk_1000F1C00;
  id v9 = self;
  id v5 = a3;
  id v10 = v5;
  id v11 = &v13;
  uint64_t v12 = &v17;
  [(MBManifestDB *)v9 _performOnDBQueue:v8];
  if (a4) {
    *a4 = (id) v18[5];
  }
  char v6 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (BOOL)containsRegularFileForFileID:(id)a3 error:(id *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10004A148;
  int v21 = sub_10004A158;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D8D0;
  v8[3] = &unk_1000F1C00;
  id v9 = self;
  id v5 = a3;
  id v10 = v5;
  id v11 = &v13;
  uint64_t v12 = &v17;
  [(MBManifestDB *)v9 _performOnDBQueue:v8];
  if (a4) {
    *a4 = (id) v18[5];
  }
  char v6 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

- (id)fetchFileWithID:(id)a3 error:(id *)a4
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_10004A148;
  v18[4] = sub_10004A158;
  id v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10004A148;
  char v16 = sub_10004A158;
  id v17 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DB64;
  v7[3] = &unk_1000F1C00;
  id v8 = self;
  id v4 = a3;
  id v9 = v4;
  id v10 = v18;
  id v11 = &v12;
  [(MBManifestDB *)v8 _performOnDBQueue:v7];
  id v5 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);

  return v5;
}

- (BOOL)hasUnverifiedFilesWithError:(id *)a3
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_10004A148;
  id v17 = sub_10004A158;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E0A0;
  v8[3] = &unk_1000F1AA0;
  void v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v13;
  [(MBManifestDB *)self _performOnDBQueue:v8];
  if (*((unsigned char *)v10 + 24))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004E1A4;
    v7[3] = &unk_1000F1A78;
    void v7[4] = self;
    [(MBManifestDB *)self _performOnDBQueue:v7];
  }
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (id)unsetVerifiedFlags
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unsetting all verified file flags", buf, 2u);
    _MBLog();
  }

  -[MBManifestDB _executeSQL:](self, "_executeSQL:", @"UPDATE Files SET flags = (flags & ~%lu) WHERE flags & %lu != 0;",
    32,
  id v4 = 32);

  return v4;
}

- (id)removeEphemeralRetriedFiles
{
  return [(MBManifestDB *)self _executeSQL:@"DELETE FROM Files WHERE (flags & %lu) = %lu", 64, 64];
}

- (id)removeFilesNotAlreadyUploaded
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing files not already uploaded from manifest", buf, 2u);
    _MBLog();
  }

  id v4 = [(MBManifestDB *)self _executeSQL:@"DELETE FROM Files WHERE (flags & %lu) = 0 AND (flags & %lu) = 0", 8, 128];
  if (!v4)
  {
    id v4 = [(MBManifestDB *)self _executeSQL:@"DELETE FROM Files WHERE (flags & %lu) = %lu", 16, 16];
    if (!v4)
    {
      id v4 = [(MBManifestDB *)self _executeSQL:@"DELETE FROM Files WHERE file IS NULL"];
    }
  }
  id v5 = v4;

  return v5;
}

- (id)unsetAlreadyUploadedFlags
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unsetting all already uploaded file flags", buf, 2u);
    _MBLog();
  }

  -[MBManifestDB _executeSQL:](self, "_executeSQL:", @"UPDATE Files SET flags = (flags & ~%lu) WHERE flags & %lu != 0;",
    8,
  id v4 = 8);
  if (!v4)
  {
    -[MBManifestDB _executeSQL:](self, "_executeSQL:", @"UPDATE Files SET flags = (flags & ~%lu) WHERE flags & %lu != 0;",
      128,
    id v4 = 128);
  }

  return v4;
}

- (id)enumerateFiles:(id)a3
{
  return [(MBManifestDB *)self enumerateFiles:a3 includeUninstalled:0];
}

- (id)enumerateFiles:(id)a3 includeUninstalled:(BOOL)a4
{
  id v5 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_10004A148;
  id v29 = sub_10004A158;
  id v30 = 0;
  [(MBManifestDB *)self flush];
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"ManifestDB-%lu-enumerator", -[MBManifestDB hash](self, "hash")];
  id v7 = [(MBManifestDB *)self _newConnection:v6];
  id v8 = +[NSURL fileURLWithPath:self->_path];
  uint64_t v9 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  unsigned __int8 v10 = [v7 openAtURL:v8 withFlags:1 error:&obj];
  objc_storeStrong(v9, obj);

  if (v10)
  {
    [v7 useSerialQueue];
    uint64_t v11 = [v7 serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004E900;
    block[3] = &unk_1000F1C28;
    id v12 = v7;
    id v20 = v12;
    int v21 = self;
    uint64_t v23 = &v25;
    id v22 = v5;
    dispatch_sync(v11, block);

    uint64_t v13 = [v12 serialQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004EE7C;
    v16[3] = &unk_1000F1C50;
    id v17 = v12;
    id v18 = &v25;
    dispatch_sync(v13, v16);

    id v14 = (id)v26[5];
  }
  else
  {
    id v14 = (id)v26[5];
  }

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)setPropertyWithName:(id)a3 value:(id)a4
{
  return -[MBManifestDB _executeSQL:](self, "_executeSQL:", @"INSERT OR REPLACE INTO Properties (key, value) VALUES (%@, %@);",
           a3,
           a4);
}

- (id)fetchPropertyWithName:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10004A148;
  id v30 = sub_10004A158;
  id v31 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_10004A148;
  uint64_t v24 = sub_10004A158;
  id v25 = 0;
  uint64_t v9 = [(MBManifestDB *)self pql_database];
  unsigned __int8 v10 = [v9 serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F198;
  block[3] = &unk_1000F1C78;
  void block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v17 = &v20;
  id v18 = &v26;
  Class v19 = a4;
  dispatch_sync(v10, block);

  id v12 = (void *)v21[5];
  if (a5 && !v12)
  {
    *a5 = (id) v27[5];
    id v12 = (void *)v21[5];
  }
  id v13 = v12;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (PQLConnection)pql_database
{
  return self->_pdb;
}

- (NSString)path
{
  return self->_path;
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (BOOL)domainRedirects
{
  return self->_domainRedirects;
}

- (void)setDomainRedirects:(BOOL)a3
{
  self->_domainRedirects = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (NSData)passwordHash
{
  return self->_passwordHash;
}

- (void)setPasswordHash:(id)a3
{
}

- (NSData)passwordData
{
  return self->_passwordData;
}

- (void)setPasswordData:(id)a3
{
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
}

- (MBEncryptedFileHandle)encryptedFileHandle
{
  return self->_encryptedFileHandle;
}

- (void)setEncryptedFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedFileHandle, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_passwordData, 0);
  objc_storeStrong((id *)&self->_passwordHash, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_pdb, 0);
}

@end