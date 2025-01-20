@interface HVPathsBase
+ (id)filename:(id)a3;
+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)filename:(id)a3 subdirectory:(id)a4;
+ (id)filename:(id)a3 subdirectory:(id)a4 createIfNeeded:(BOOL)a5;
+ (id)subdirectory:(id)a3;
+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)topDirectory;
+ (id)topDirectoryWithName:(id)a3 createIfNeeded:(BOOL)a4;
+ (void)_createDirectoryAtPath:(uint64_t)a1;
@end

@implementation HVPathsBase

+ (id)filename:(id)a3 subdirectory:(id)a4 createIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x22A6667F0]();
  v11 = [a1 subdirectory:v9 createIfNeeded:v5];
  v12 = [v11 stringByAppendingPathComponent:v8];

  return v12;
}

+ (id)filename:(id)a3 subdirectory:(id)a4
{
  return (id)[a1 filename:a3 subdirectory:a4 createIfNeeded:1];
}

+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)MEMORY[0x22A6667F0]();
  id v8 = [a1 topDirectoryCreateIfNeeded:v4];
  id v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

+ (id)filename:(id)a3
{
  return (id)[a1 filename:a3 createIfNeeded:1];
}

+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)MEMORY[0x22A6667F0]();
  id v8 = [a1 topDirectoryCreateIfNeeded:v4];
  id v9 = [v8 stringByAppendingPathComponent:v6];

  if (v4) {
    +[HVPathsBase _createDirectoryAtPath:]((uint64_t)a1, v9);
  }

  return v9;
}

+ (void)_createDirectoryAtPath:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = *MEMORY[0x263F07F70];
  char v5 = 1;
  while (1)
  {
    char v6 = v5;
    v7 = [MEMORY[0x263F08850] defaultManager];
    id v21 = 0;
    char v8 = [v7 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v21];
    id v9 = v21;

    if (v8) {
      break;
    }
    if ([v9 code] == 640)
    {
      v10 = [v9 domain];
      int v11 = [v10 isEqualToString:v4];

      if (v11)
      {
        v19 = hv_default_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v2;
          _os_log_error_impl(&dword_226C41000, v19, OS_LOG_TYPE_ERROR, "HVPathBase: _createDirectoryAtPath: exiting due to lack of disk space while creating %@", buf, 0xCu);
        }

        if ([MEMORY[0x263F61E28] isInternalBuild])
        {
          v17 = hv_default_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_226C41000, v17, OS_LOG_TYPE_FAULT, "HVPathBase: unable to create directory due to lack of space.", buf, 2u);
          }
          int v18 = 4002;
          goto LABEL_31;
        }
        int v18 = 4002;
LABEL_32:
        HVExit(v18);
      }
    }
    if ([v9 code] == 513)
    {
      v16 = hv_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v2;
        _os_log_error_impl(&dword_226C41000, v16, OS_LOG_TYPE_ERROR, "HVPathBase: _createDirectoryAtPath: exiting due to lack of write permissions to directory %@", buf, 0xCu);
      }

      if ([MEMORY[0x263F61E28] isInternalBuild])
      {
        v17 = hv_default_log_handle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_226C41000, v17, OS_LOG_TYPE_FAULT, "HVPathBase: unable to create directory due to lack of permissions.", buf, 2u);
        }
LABEL_24:
        int v18 = 4003;
LABEL_31:
      }
      else
      {
        int v18 = 4003;
      }
      goto LABEL_32;
    }
    if ([v9 code] != 516) {
      break;
    }
    v12 = hv_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v2;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_error_impl(&dword_226C41000, v12, OS_LOG_TYPE_ERROR, "HVPathBase: deleting file squatting at %@ due to error %@", buf, 0x16u);
    }

    v13 = [MEMORY[0x263F08850] defaultManager];
    id v20 = 0;
    [v13 removeItemAtPath:v2 error:&v20];
    id v14 = v20;

    if (v14)
    {
      v17 = hv_default_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v2;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_error_impl(&dword_226C41000, v17, OS_LOG_TYPE_ERROR, "HVPathBase: exiting due to failure to delete squatter file %@ due to error %@", buf, 0x16u);
      }
      goto LABEL_24;
    }
    char v5 = 0;
    if ((v6 & 1) == 0)
    {
      id v9 = 0;
      goto LABEL_15;
    }
  }
  if (v9) {
    +[HVFileErrorCode handleError:v9];
  }
  if ((v8 & 1) == 0)
  {
LABEL_15:
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:sel__createDirectoryAtPath_, v3, @"HVPaths.m", 224, @"HVPathBase: _createDirectoryAtPath: %@ error: %@", v2, v9 object file lineNumber description];
  }
  objc_sync_exit(v3);
}

+ (id)subdirectory:(id)a3
{
  return (id)[a1 subdirectory:a3 createIfNeeded:1];
}

+ (id)topDirectoryWithName:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  char v8 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v9 = [v8 objectAtIndexedSubscript:0];

  if (!v9 || ![v9 length])
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"HVPaths.m" lineNumber:118 description:@"failed to construct the root path"];
  }
  v10 = (void *)MEMORY[0x22A6667F0]();
  int v11 = [v9 stringByAppendingPathComponent:v7];
  v12 = hv_default_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    v16 = v11;
    _os_log_debug_impl(&dword_226C41000, v12, OS_LOG_TYPE_DEBUG, "using top directory: %@", (uint8_t *)&v15, 0xCu);
  }

  if (v4) {
    +[HVPathsBase _createDirectoryAtPath:]((uint64_t)a1, v11);
  }

  return v11;
}

+ (id)topDirectory
{
  return (id)[a1 topDirectoryCreateIfNeeded:1];
}

@end