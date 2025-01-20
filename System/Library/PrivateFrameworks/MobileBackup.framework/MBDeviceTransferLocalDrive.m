@interface MBDeviceTransferLocalDrive
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4;
- (BOOL)isInvalid;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (MBDeviceTransferLocalDrive)initWithPath:(id)a3;
- (NSString)path;
- (id)_resolveRelativePath:(id)a3 error:(id *)a4;
- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (void)invalidate;
- (void)setPath:(id)a3;
@end

@implementation MBDeviceTransferLocalDrive

- (MBDeviceTransferLocalDrive)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBDeviceTransferLocalDrive;
  v6 = [(MBDeviceTransferLocalDrive *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

- (BOOL)isInvalid
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_invalidated, 1u) & 1) == 0)
  {
    unsigned __int8 v2 = MBGetDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v4 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidated %@", buf, 0xCu);
      objc_opt_class();
      _MBLog();
    }
  }
}

- (id)_resolveRelativePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (MBIsValidRelativePath())
  {
    v7 = [(NSString *)self->_path stringByAppendingPathComponent:v6];
    v8 = [v7 stringByStandardizingPath];

    objc_super v9 = [(NSString *)self->_path stringByAppendingString:@"/"];
    v10 = [v9 stringByStandardizingPath];

    if ([v8 hasPrefix:v10])
    {
      id v11 = v8;
    }
    else if (a4)
    {
      +[MBError errorWithCode:100 path:v6 format:@"Path outside drive root"];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else if (a4)
  {
    +[MBError errorWithCode:100 path:v6 format:@"Drive path not relative"];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  __assert_rtn("-[MBDeviceTransferLocalDrive createDirectoryAtPath:options:error:]", "MBDeviceTransferLocalDrive.m", 72, "0 && \"Unexpected call\"");
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [(MBDeviceTransferLocalDrive *)self _resolveRelativePath:v7 error:a5];
  if (!v8)
  {
    id v11 = 0;
    if (!a5) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  objc_super v9 = +[NSFileManager defaultManager];
  v10 = [v9 contentsOfDirectoryAtPath:v8 error:a5];

  if (v10)
  {
    id v11 = +[NSMutableDictionary dictionaryWithCapacity:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      v21 = v10;
      id v22 = v7;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v17 = +[NSFileManager defaultManager];
          v18 = [v8 stringByAppendingPathComponent:v16];
          v19 = [v17 attributesOfItemAtPath:v18 error:a5];

          if (!v19)
          {

            id v11 = 0;
            goto LABEL_15;
          }
          [v11 setObject:v19 forKeyedSubscript:v16];
        }
        id v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_15:
      v10 = v21;
      id v7 = v22;
    }
  }
  else
  {
    id v11 = 0;
  }

  if (a5)
  {
LABEL_19:
    if (*a5)
    {
      *a5 = +[MBError errorForNSError:*a5 path:v7 format:@"Listing directory on drive failed"];
    }
  }
LABEL_21:

  return v11;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(MBDeviceTransferLocalDrive *)self _resolveRelativePath:v9 error:a6];
  if (v11)
  {
    id v12 = [(MBDeviceTransferLocalDrive *)self _resolveRelativePath:v10 error:a6];
    if (v12)
    {
      id v13 = +[NSFileManager defaultManager];
      [v13 removeItemAtPath:v12 error:0];

      uint64_t v14 = +[NSFileManager defaultManager];
      id v18 = 0;
      unsigned __int8 v15 = [v14 copyItemAtPath:v11 toPath:v12 error:&v18];
      id v16 = v18;

      if (a6 && (v15 & 1) == 0)
      {
        *a6 = +[MBError errorForNSError:v16 path:v9 format:@"Copying file on drive failed"];
      }
    }
    else
    {
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __assert_rtn("-[MBDeviceTransferLocalDrive uploadFileAtPath:toPath:options:error:]", "MBDeviceTransferLocalDrive.m", 124, "0 && \"Unexpected call\"");
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __assert_rtn("-[MBDeviceTransferLocalDrive uploadFilesAtPaths:options:results:error:]", "MBDeviceTransferLocalDrive.m", 130, "0 && \"Unexpected call\"");
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v21 = v10;
  id v22 = v11;
  id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v19 = 0;
  id v20 = 0;
  BOOL v14 = [(MBDeviceTransferLocalDrive *)self downloadFilesAtPaths:v13 options:v12 results:&v20 error:&v19];
  id v15 = v20;
  id v16 = v19;

  if (!v14)
  {
    if (!v16) {
      __assert_rtn("-[MBDeviceTransferLocalDrive downloadFileAtPath:toPath:options:error:]", "MBDeviceTransferLocalDrive.m", 139, "error");
    }
    v17 = [v15 objectForKeyedSubscript:v10];

    if (!v17) {
      __assert_rtn("-[MBDeviceTransferLocalDrive downloadFileAtPath:toPath:options:error:]", "MBDeviceTransferLocalDrive.m", 141, "error");
    }
    if (a6)
    {
      id v16 = v17;
      *a6 = v16;
    }
    else
    {
      id v16 = v17;
    }
  }

  return v14;
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007DC58;
  v14[3] = &unk_1004117C8;
  v14[4] = self;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  [v11 enumerateKeysAndObjectsUsingBlock:v14];
  id v12 = [v10 count];
  if (v12)
  {
    if (a5) {
      *a5 = v10;
    }
    if (a6)
    {
      *a6 = +[MBError errorWithCode:2 format:@"Multiple errors"];
    }
  }

  return v12 == 0;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __assert_rtn("-[MBDeviceTransferLocalDrive moveItemAtPath:toPath:options:error:]", "MBDeviceTransferLocalDrive.m", 193, "0 && \"Unexpected call\"");
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __assert_rtn("-[MBDeviceTransferLocalDrive moveItemsAtPaths:options:results:error:]", "MBDeviceTransferLocalDrive.m", 199, "0 && \"Unexpected call\"");
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  __assert_rtn("-[MBDeviceTransferLocalDrive removeItemAtPath:options:error:]", "MBDeviceTransferLocalDrive.m", 205, "0 && \"Unexpected call\"");
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __assert_rtn("-[MBDeviceTransferLocalDrive removeItemsAtPaths:options:results:error:]", "MBDeviceTransferLocalDrive.m", 211, "0 && \"Unexpected call\"");
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  if (a3) {
    *a3 = MBFreeDiskSpace();
  }
  return 1;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return +[MBBasicFileHandle basicFileHandleWithPath:a3 flags:*(void *)&a4 mode:a5 error:a6];
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end