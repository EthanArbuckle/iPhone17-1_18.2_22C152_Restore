@interface APFileSystemAdapter
- (APFileSystemAdapter)init;
- (APStorageManager)secureFileManager;
- (BOOL)fileExists:(id)a3;
- (BOOL)removeFile:(id)a3 error:(id *)a4;
- (BOOL)setLastModifiedDate:(id)a3 toFile:(id)a4 error:(id *)a5;
- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5;
- (id)enumeratorForFilesWithExtension:(id)a3;
- (id)fileToFilePath:(id)a3 error:(id *)a4;
- (id)getFileLastModifiedDate:(id)a3 error:(id *)a4;
- (id)getStorageInfo;
- (id)readDataFromFile:(id)a3 error:(id *)a4;
- (void)setSecureFileManager:(id)a3;
@end

@implementation APFileSystemAdapter

- (APFileSystemAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)APFileSystemAdapter;
  v2 = [(APFileSystemAdapter *)&v6 init];
  if (v2)
  {
    v3 = (APStorageManager *)[objc_alloc((Class)APStorageManager) initWithPathPrefix:@"y"];
    secureFileManager = v2->_secureFileManager;
    v2->_secureFileManager = v3;
  }
  return v2;
}

- (id)fileToFilePath:(id)a3 error:(id *)a4
{
  return sub_1001758AC((uint64_t)APFileNameConverter, a3, (uint64_t)a4);
}

- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v10 = +[NSString stringWithFormat:@"%@ name cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  v11 = [(APFileSystemAdapter *)self fileToFilePath:v9 error:a5];
  if (v11)
  {
    v12 = [(APFileSystemAdapter *)self secureFileManager];
    id v21 = 0;
    v13 = [v12 fileForWritingAtKeyPath:v11 error:&v21];
    id v14 = v21;

    if (!v13 || v14)
    {
      if (a5)
      {
LABEL_14:
        id v14 = v14;
        *a5 = v14;
LABEL_19:

        BOOL v16 = 0;
        goto LABEL_20;
      }
      v17 = APLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        id v23 = v9;
        __int16 v24 = 2113;
        id v25 = v14;
        v18 = "Failed to open (w) file for object '%{public}@'. %{private}@";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
      }
    }
    else
    {
      id v20 = 0;
      unsigned int v15 = [v13 addData:v8 error:&v20];
      id v14 = v20;
      [v13 close];
      if (v15 && !v14)
      {
        BOOL v16 = 1;
LABEL_20:

        goto LABEL_21;
      }
      if (a5) {
        goto LABEL_14;
      }
      v17 = APLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        id v23 = v9;
        __int16 v24 = 2113;
        id v25 = v14;
        v18 = "Failed to write file for object '%{public}@'. %{private}@";
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  BOOL v16 = 0;
LABEL_21:

  return v16;
}

- (id)readDataFromFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v7 = +[NSString stringWithFormat:@"%@ name cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v8 = [(APFileSystemAdapter *)self fileToFilePath:v6 error:a4];
  if (v8)
  {
    id v9 = [(APFileSystemAdapter *)self secureFileManager];
    id v16 = 0;
    v10 = [v9 fileForReadingAtKeyPath:v8 error:&v16];
    id v11 = v16;

    if (!v10 || v11)
    {
      if (a4)
      {
        v12 = 0;
        *a4 = v11;
      }
      else
      {
        id v14 = APLogForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          id v18 = v6;
          __int16 v19 = 2113;
          id v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to open (r) file for object '%{public}@'. %{private}@", buf, 0x16u);
        }

        v12 = 0;
      }
    }
    else
    {
      v12 = [v10 nextObjectData];
      [v10 close];
      if (!v12)
      {
        v13 = APLogForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to read file for object '%{public}@'.", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)removeFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v7 = +[NSString stringWithFormat:@"%@ name cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v8 = [(APFileSystemAdapter *)self fileToFilePath:v6 error:a4];
  if (v8)
  {
    id v9 = [(APFileSystemAdapter *)self secureFileManager];
    id v14 = 0;
    unsigned int v10 = [v9 removeObjectAtPath:v8 error:&v14];
    id v11 = v14;

    if (!v10 || v11)
    {
      if (a4)
      {
        *a4 = v11;
      }
      else
      {
        v12 = APLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v16 = v6;
          __int16 v17 = 2112;
          id v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove file for object '%{public}@'. %{object}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)getFileLastModifiedDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    v7 = +[NSString stringWithFormat:@"%@ name cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v8 = [(APFileSystemAdapter *)self fileToFilePath:v6 error:a4];
  if (v8)
  {
    id v9 = [(APFileSystemAdapter *)self secureFileManager];
    id v14 = 0;
    unsigned int v10 = [v9 lastModifiedDateForFileAtPath:v8 error:&v14];
    id v11 = v14;

    if (!v10 || v11)
    {
      if (a4)
      {
        *a4 = v11;
      }
      else
      {
        v12 = APLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          id v16 = v6;
          __int16 v17 = 2113;
          id v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to get last modified date for object '%{public}@'. %{private}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

- (BOOL)setLastModifiedDate:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    unsigned int v10 = +[NSString stringWithFormat:@"%@ name cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v11 = [(APFileSystemAdapter *)self fileToFilePath:v9 error:a5];
  if (v11)
  {
    v12 = [(APFileSystemAdapter *)self secureFileManager];
    id v17 = 0;
    unsigned int v13 = [v12 touchFileAtPath:v11 error:&v17];
    id v14 = v17;

    if (!v13 || v14)
    {
      if (a5)
      {
        *a5 = v14;
      }
      else
      {
        unsigned int v15 = APLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          id v19 = v9;
          __int16 v20 = 2113;
          id v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to update last modified date for object '%{public}@'. %{private}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)fileExists:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:@"%@ name cannot be nil", objc_opt_class()];
    APSimulateCrash();
  }
  id v6 = [(APFileSystemAdapter *)self fileToFilePath:v4 error:0];
  if (v6)
  {
    v7 = [(APFileSystemAdapter *)self secureFileManager];
    id v12 = 0;
    unsigned __int8 v8 = [v7 fileExistsAtPath:v6 error:&v12];
    id v9 = v12;

    if (v9)
    {
      unsigned int v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        id v14 = v4;
        __int16 v15 = 2113;
        id v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get file exists status for object '%{public}@'. %{private}@", buf, 0x16u);
      }
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)enumeratorForFilesWithExtension:(id)a3
{
  id v4 = a3;
  v5 = [(APFileSystemAdapter *)self secureFileManager];
  id v6 = [v5 iterateObjectsIncludingFolders:0];

  v7 = [APFilesEnumerator alloc];
  unsigned __int8 v8 = [(APFileSystemAdapter *)self secureFileManager];
  id v9 = [(APFilesEnumerator *)v7 initWithObjectsIterator:v6 fileManager:v8 extension:v4];

  return v9;
}

- (id)getStorageInfo
{
  id v4 = objc_alloc_init(APFileSystemStorageInfo);
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  v5 = [(APFileSystemAdapter *)self secureFileManager];
  [v5 getStorageSize:&v9 allocatedSize:&v8 files:&v7];

  [(APFileSystemStorageInfo *)v4 setTotalSize:v9];
  [(APFileSystemStorageInfo *)v4 setAllocatedSize:v8];
  [(APFileSystemStorageInfo *)v4 setFilesCount:v7];

  return v4;
}

- (APStorageManager)secureFileManager
{
  return self->_secureFileManager;
}

- (void)setSecureFileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end