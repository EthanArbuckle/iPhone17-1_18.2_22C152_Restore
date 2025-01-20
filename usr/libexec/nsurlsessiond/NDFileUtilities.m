@interface NDFileUtilities
+ (BOOL)createDataVaultDirectoryAtPath:(id)a3;
+ (BOOL)itemShouldBePurged:(id)a3;
+ (id)bundleManagerPath:(id)a3;
+ (id)defaultDownloadDirectoryContainer;
+ (id)defaultDownloadDirectoryForBundleID:(id)a3;
+ (id)fetchStreamingZipModificationDate:(id)a3;
+ (id)nsurlsessiondLaunchdPath;
+ (id)nsurlsessiondPath;
+ (id)sessionPath:(id)a3 forBundleID:(id)a4;
+ (void)createDirectoryAtPath:(id)a3;
+ (void)createDirectoryAtURL:(id)a3;
+ (void)markItemAsPurged:(id)a3;
+ (void)removeItemAtPath:(id)a3;
+ (void)removeItemAtURL:(id)a3;
+ (void)removeStreamingZipModificationDate:(id)a3;
+ (void)setDaemonWorkState:(BOOL)a3;
+ (void)updateStreamingZipModificationDate:(id)a3;
@end

@implementation NDFileUtilities

+ (void)createDirectoryAtURL:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Couldn't create directory at %@, error: %@ [%ld]", buf, 0x20u);
    }
  }
}

+ (void)setDaemonWorkState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[NDFileUtilities nsurlsessiondLaunchdPath];
  unsigned __int8 v5 = v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [v4 stringByAppendingString:@"/nsurlsessiond.launch"];
  v7 = (void *)v6;
  if (v3 && v6)
  {
    id v8 = +[NSFileManager defaultManager];
    [v8 createFileAtPath:v7 contents:0 attributes:0];
LABEL_5:

    goto LABEL_7;
  }
  if (!v3)
  {
    if (v6)
    {
      id v9 = +[NSFileManager defaultManager];
      unsigned int v10 = [v9 fileExistsAtPath:v7];

      if (v10)
      {
        id v8 = +[NSFileManager defaultManager];
        uint64_t v11 = 0;
        [v8 removeItemAtPath:v7 error:&v11];
        goto LABEL_5;
      }
    }
  }
LABEL_7:
}

+ (id)sessionPath:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  uint64_t v6 = +[NDFileUtilities bundleManagerPath:a4];
  v7 = sub_10000C1E0(v5);
  id v8 = [v6 stringByAppendingPathComponent:v7];

  return v8;
}

+ (id)bundleManagerPath:(id)a3
{
  id v3 = a3;
  v4 = +[NDFileUtilities nsurlsessiondPath];
  id v5 = sub_10000C1E0(v3);
  uint64_t v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

+ (id)nsurlsessiondPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v3 = [v2 objectAtIndex:0];
  v4 = [v3 stringByAppendingPathComponent:@"com.apple.nsurlsessiond"];

  return v4;
}

+ (id)nsurlsessiondLaunchdPath
{
  v2 = +[NDFileUtilities nsurlsessiondPath];
  id v3 = [v2 stringByAppendingString:@"-launchd"];

  return v3;
}

+ (BOOL)itemShouldBePurged:(id)a3
{
  id v3 = (const char *)[a3 fileSystemRepresentation];
  if (v3) {
    LOBYTE(v3) = getxattr(v3, "com.apple.nsurlsessiond.purged", 0, 0, 0, 0) == 1;
  }
  return (char)v3;
}

+ (void)markItemAsPurged:(id)a3
{
  id v3 = (const char *)[a3 fileSystemRepresentation];
  if (v3)
  {
    char value = 1;
    setxattr(v3, "com.apple.nsurlsessiond.purged", &value, 1uLL, 0, 0);
  }
}

+ (id)fetchStreamingZipModificationDate:(id)a3
{
  id v3 = (char *)[a3 fileSystemRepresentation];
  if (v3)
  {
    double value = 0.0;
    ssize_t v4 = getxattr(v3, "com.apple.nsurlsessiond.szmodtime", &value, 8uLL, 0, 0);
    id v3 = 0;
    if (v4 == 8)
    {
      id v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:value];
    }
  }

  return v3;
}

+ (void)removeStreamingZipModificationDate:(id)a3
{
  id v4 = a3;
  id v3 = (const char *)[v4 fileSystemRepresentation];
  if (v3) {
    removexattr(v3, "com.apple.nsurlsessiond.szmodtime", 0);
  }
}

+ (void)updateStreamingZipModificationDate:(id)a3
{
  id v3 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t value = v4;
  id v5 = v3;
  uint64_t v6 = (const char *)[v5 fileSystemRepresentation];
  if (v6) {
    setxattr(v6, "com.apple.nsurlsessiond.szmodtime", &value, 8uLL, 0, 0);
  }
}

+ (id)defaultDownloadDirectoryForBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NDFileUtilities defaultDownloadDirectoryContainer];
  id v5 = [v4 URLByAppendingPathComponent:v3 isDirectory:1];

  return v5;
}

+ (id)defaultDownloadDirectoryContainer
{
  v2 = NSTemporaryDirectory();
  id v3 = +[NSURL fileURLWithPath:v2];

  uint64_t v4 = +[Daemon sharedDaemon];
  unsigned int v5 = [v4 isPrivileged];

  if (v5)
  {
    uint64_t v6 = v3;
  }
  else
  {
    v7 = +[NSFileManager defaultManager];
    id v13 = 0;
    id v8 = [v7 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v13];
    id v9 = v13;

    if (v8)
    {
      [v8 URLByAppendingPathComponent:@"com.apple.nsurlsessiond/Downloads" isDirectory:1];
      id v3 = v10 = v3;
    }
    else
    {
      unsigned int v10 = (id)qword_1000CB148;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v12 = [v9 code];
        *(_DWORD *)buf = 138412546;
        id v15 = v9;
        __int16 v16 = 2048;
        id v17 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error getting caches directory: %@ [%ld]", buf, 0x16u);
      }
    }

    uint64_t v6 = v3;
  }

  return v6;
}

+ (void)createDirectoryAtPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Couldn't create directory at %@, error: %@ [%ld]", buf, 0x20u);
    }
  }
}

+ (BOOL)createDataVaultDirectoryAtPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v12 = qword_1000CB148;
    if (!os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v13 = "Couldn't create directory.  No path provided.";
    __int16 v14 = v12;
    uint32_t v15 = 2;
LABEL_28:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_16;
  }
  id v5 = v3;
  id v6 = (const char *)[v5 cStringUsingEncoding:4];
  if (!v6)
  {
    uint64_t v16 = qword_1000CB148;
    if (!os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    v31 = (const char *)v5;
    id v13 = "Couldn't create directory.  Unable to extract C-string from path argument: %@";
    __int16 v14 = v16;
    uint32_t v15 = 12;
    goto LABEL_28;
  }
  v7 = +[NSFileManager defaultManager];
  unsigned int v8 = [v7 fileExistsAtPath:v5];

  if (!v8)
  {
    id v17 = [v5 stringByDeletingLastPathComponent];
    v18 = +[NSFileManager defaultManager];
    id v29 = 0;
    unsigned __int8 v19 = [v18 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v29];
    unsigned int v10 = v29;

    if (v19)
    {
      if (!rootless_mkdir_datavault())
      {
        BOOL v11 = 1;
        goto LABEL_23;
      }
      v20 = (id)qword_1000CB148;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = v21;
        v22 = "Failed to create data-vault directory.  errno=%d";
        v23 = v20;
        uint32_t v24 = 8;
LABEL_30:
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      }
    }
    else
    {
      v20 = (id)qword_1000CB148;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v27 = [v10 code];
        *(_DWORD *)buf = 138412802;
        v31 = (const char *)v5;
        __int16 v32 = 2112;
        v33 = v10;
        __int16 v34 = 2048;
        id v35 = v27;
        v22 = "Couldn't create directory at %@, error: %@ [%ld]";
        v23 = v20;
        uint32_t v24 = 32;
        goto LABEL_30;
      }
    }

    BOOL v11 = 0;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (chmod(v6, 0x1C0u))
  {
    id v9 = (id)qword_1000CB148;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v26 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v6;
      __int16 v32 = 1024;
      LODWORD(v33) = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set mode 700 on path %s.  errno=%d", buf, 0x12u);
    }
  }
  if (rootless_check_datavault_flag() == 1 && rootless_convert_to_datavault())
  {
    unsigned int v10 = (id)qword_1000CB148;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v28 = *__error();
      *(_DWORD *)buf = 136315394;
      v31 = v6;
      __int16 v32 = 1024;
      LODWORD(v33) = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to convert %s to a data-vault directory.  errno=%d", buf, 0x12u);
    }
    BOOL v11 = 0;
    goto LABEL_24;
  }
LABEL_16:
  BOOL v11 = 0;
LABEL_25:

  return v11;
}

+ (void)removeItemAtURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error removing item at url: %@, error: %@ [%ld]", buf, 0x20u);
    }
  }
}

+ (void)removeItemAtPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v5 = [v4 removeItemAtPath:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = (id)qword_1000CB148;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 code];
      *(_DWORD *)buf = 138412802;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error removing item at path: %@, error: %@ [%ld]", buf, 0x20u);
    }
  }
}

@end