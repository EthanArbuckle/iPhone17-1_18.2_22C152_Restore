@interface NADLibraryPathMigrator
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 movingItemAtURL:(id)a5 toURL:(id)a6;
- (NADLibraryPathMigrator)initWithSourceURL:(id)a3 destinationURL:(id)a4;
- (NSURL)destinationURL;
- (NSURL)sourceURL;
- (void)migrate;
@end

@implementation NADLibraryPathMigrator

- (NADLibraryPathMigrator)initWithSourceURL:(id)a3 destinationURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NADLibraryPathMigrator;
  v8 = [(NADLibraryPathMigrator *)&v14 init];
  if (v8)
  {
    v9 = (NSURL *)[v6 copy];
    sourceURL = v8->_sourceURL;
    v8->_sourceURL = v9;

    v11 = (NSURL *)[v7 copy];
    destinationURL = v8->_destinationURL;
    v8->_destinationURL = v11;
  }
  return v8;
}

- (void)migrate
{
  id v3 = objc_alloc_init((Class)NSFileManager);
  [v3 setDelegate:self];
  v4 = [(NADLibraryPathMigrator *)self sourceURL];
  v5 = [(NADLibraryPathMigrator *)self destinationURL];
  id v16 = 0;
  unsigned int v6 = [v3 moveItemAtURL:v4 toURL:v5 error:&v16];
  id v7 = v16;
  v8 = v7;
  if (v6)
  {
    v9 = nar_workspace_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v4;
      __int16 v19 = 2112;
      v20 = v5;
      v10 = "Migrated store from %@ to %@";
      v11 = v9;
      uint32_t v12 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
LABEL_13:

    goto LABEL_14;
  }
  v13 = [v7 domain];
  unsigned int v14 = [v13 isEqualToString:NSCocoaErrorDomain];

  if (v14)
  {
    id v15 = [v8 code];
    if (v15 == (id)516)
    {
      v9 = nar_workspace_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v10 = "Migration failed because file already exists.";
    }
    else
    {
      if (v15 != (id)4)
      {
        v9 = nar_workspace_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v18 = v4;
          __int16 v19 = 2112;
          v20 = v5;
          __int16 v21 = 2112;
          v22 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error migrating from %@ to %@: %@", buf, 0x20u);
        }
        goto LABEL_13;
      }
      v9 = nar_workspace_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v10 = "No file to migrate.";
    }
    v11 = v9;
    uint32_t v12 = 2;
    goto LABEL_12;
  }
LABEL_14:
  [v3 setDelegate:0];
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 movingItemAtURL:(id)a5 toURL:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 domain];
  if (![v13 isEqualToString:NSCocoaErrorDomain] || objc_msgSend(v10, "code") != (id)516)
  {
LABEL_9:

    goto LABEL_10;
  }
  unsigned int v14 = [v11 path];
  unsigned int v15 = [v9 fileExistsAtPath:v14];

  if (!v15)
  {
LABEL_10:
    BOOL v18 = 0;
    goto LABEL_11;
  }
  id v21 = 0;
  unsigned __int8 v16 = [v9 removeItemAtURL:v12 error:&v21];
  id v17 = v21;
  v13 = v17;
  if ((v16 & 1) == 0)
  {
    __int16 v19 = nar_workspace_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error removing item at %@ trying to move item from %@: %@", buf, 0x20u);
    }

    goto LABEL_9;
  }

  BOOL v18 = 1;
LABEL_11:

  return v18;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end