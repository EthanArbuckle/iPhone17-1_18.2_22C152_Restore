@interface PPPaths
+ (id)defaultAssetPathForNamespaceId:(unsigned int)a3 factorName:(id)a4;
+ (id)filename:(id)a3 logSubdirectory:(id)a4;
+ (id)filename:(id)a3 subdirectory:(id)a4;
+ (id)logDirectoryCreateIfNeeded:;
+ (id)logSubdirectory:(id)a3;
+ (id)logSubdirectory:(uint64_t)a1 createIfNeeded:(void *)a2;
+ (id)resourcesDirectory;
+ (id)subdirectory:(id)a3;
+ (id)subdirectory:(uint64_t)a1 createIfNeeded:(void *)a2;
+ (id)topDirectoryCreateIfNeeded:;
@end

@implementation PPPaths

+ (id)defaultAssetPathForNamespaceId:(unsigned int)a3 factorName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = (void *)MEMORY[0x1CB79D060]();
  v7 = +[PPPaths resourcesDirectory];
  v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"assets_%u", v4);
  v9 = [v7 stringByAppendingPathComponent:v8];

  v10 = [v9 stringByAppendingPathComponent:v5];

  return v10;
}

+ (id)resourcesDirectory
{
  uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 resourcePath];
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"PPPaths.m" lineNumber:313 description:@"Error: Unable to find resource directory"];
  }
  return v6;
}

+ (id)filename:(id)a3 logSubdirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  v8 = (void *)MEMORY[0x1CB79D060]();
  v9 = +[PPPaths logSubdirectory:createIfNeeded:](v7, v6);
  v10 = [v9 stringByAppendingPathComponent:v5];

  return v10;
}

+ (id)logSubdirectory:(uint64_t)a1 createIfNeeded:(void *)a2
{
  id v2 = a2;
  v3 = self;
  uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = +[PPPaths logDirectoryCreateIfNeeded:]();
  id v6 = [v5 stringByAppendingPathComponent:v2];

  id v7 = v3;
  objc_sync_enter(v7);
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  [v8 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v9 = v12;

  objc_sync_exit(v7);
  if (v9)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel_logSubdirectory_createIfNeeded_, v7, @"PPPaths.m", 291, @"Error creating subdirectory for Portrait logs: %@", v9 object file lineNumber description];
  }
  return v6;
}

+ (id)logDirectoryCreateIfNeeded:
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PPPaths_logDirectoryCreateIfNeeded___block_invoke;
  block[3] = &__block_descriptor_49_e5_v8__0l;
  block[4] = sel_logDirectoryCreateIfNeeded_;
  block[5] = v0;
  char v4 = 1;
  if (logDirectoryCreateIfNeeded__onceToken != -1) {
    dispatch_once(&logDirectoryCreateIfNeeded__onceToken, block);
  }
  v1 = (void *)logDirectoryCreateIfNeeded__dir;
  return v1;
}

void __38__PPPaths_logDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndexedSubscript:0];

  char v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = [v3 stringByAppendingPathComponent:@"Logs"];

  if (!v5 || ![v5 length])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPPaths.m" lineNumber:244 description:@"failed to construct the log root path"];
  }
  id v6 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v7 = [v5 stringByAppendingPathComponent:@"PersonalizationPortrait"];
  v8 = (void *)logDirectoryCreateIfNeeded__dir;
  logDirectoryCreateIfNeeded__dir = v7;

  id v9 = pp_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = logDirectoryCreateIfNeeded__dir;
    _os_log_debug_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEBUG, "using log directory: %@", buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 48))
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v19 = 0;
    [v10 createDirectoryAtPath:logDirectoryCreateIfNeeded__dir withIntermediateDirectories:1 attributes:0 error:&v19];
    id v11 = v19;
    id v12 = v11;
    if (v11)
    {
      if ([v11 code] == 640)
      {
        v13 = [v12 domain];
        int v14 = [v13 isEqualToString:*MEMORY[0x1E4F281F8]];

        if (v14)
        {
          v18 = pp_default_log_handle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = logDirectoryCreateIfNeeded__dir;
            _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "Portrait exiting due to lack of disk space while creating %@", buf, 0xCu);
          }

          PPExit(2002);
        }
      }
      if ([v12 code] == 513)
      {
        v17 = pp_default_log_handle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = logDirectoryCreateIfNeeded__dir;
          _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "Portrait exiting due to lack of write permissions to directory %@", buf, 0xCu);
        }

        PPExit(2003);
      }
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"PPPaths.m", 262, @"Error creating directory for PersonalizationPortrait: %@", v12 object file lineNumber description];
    }
  }
}

+ (id)logSubdirectory:(id)a3
{
  return +[PPPaths logSubdirectory:createIfNeeded:]((uint64_t)a1, a3);
}

+ (id)filename:(id)a3 subdirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = +[PPPaths subdirectory:createIfNeeded:](v7, v6);
  v10 = [v9 stringByAppendingPathComponent:v5];

  return v10;
}

+ (id)subdirectory:(uint64_t)a1 createIfNeeded:(void *)a2
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = self;
  char v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = +[PPPaths topDirectoryCreateIfNeeded:]();
  id v6 = [v5 stringByAppendingPathComponent:v2];

  id v7 = v3;
  objc_sync_enter(v7);
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = 0;
  [v8 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v18];
  id v9 = v18;

  objc_sync_exit(v7);
  if (v9)
  {
    if ([v9 code] == 640)
    {
      v10 = [v9 domain];
      int v11 = [v10 isEqualToString:*MEMORY[0x1E4F281F8]];

      if (v11)
      {
        v16 = pp_default_log_handle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v9;
          _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPPaths: failed to create subdirectory due to lack of space: %@", buf, 0xCu);
        }

        if ([MEMORY[0x1E4F93B08] isInternalBuild])
        {
          v17 = pp_default_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_FAULT, "PPPaths: unable to create directory due to lack of space.", buf, 2u);
          }
        }
        PPExit(2002);
      }
    }
    if ([v9 code] == 513)
    {
      int v14 = pp_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v9;
        _os_log_error_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_ERROR, "PPPaths: failed to create subdirectory due to lack of permissions: %@", buf, 0xCu);
      }

      if ([MEMORY[0x1E4F93B08] isInternalBuild])
      {
        v15 = pp_default_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_FAULT, "PPPaths: unable to create directory due to lack of permissions.", buf, 2u);
        }
      }
      PPExit(2003);
    }
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel_subdirectory_createIfNeeded_, v7, @"PPPaths.m", 201, @"Error creating subdirectory for Portrait info: %@", v9 object file lineNumber description];
  }
  return v6;
}

+ (id)topDirectoryCreateIfNeeded:
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PPPaths_topDirectoryCreateIfNeeded___block_invoke;
  block[3] = &__block_descriptor_49_e5_v8__0l;
  block[4] = sel_topDirectoryCreateIfNeeded_;
  block[5] = v0;
  char v4 = 1;
  if (topDirectoryCreateIfNeeded__onceToken != -1) {
    dispatch_once(&topDirectoryCreateIfNeeded__onceToken, block);
  }
  v1 = (void *)topDirectoryCreateIfNeeded__dir;
  return v1;
}

void __38__PPPaths_topDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndexedSubscript:0];

  if (!v3 || ![v3 length])
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PPPaths.m" lineNumber:124 description:@"failed to construct the root path"];
  }
  char v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = [v3 stringByAppendingPathComponent:@"PersonalizationPortrait"];
  id v6 = (void *)topDirectoryCreateIfNeeded__dir;
  topDirectoryCreateIfNeeded__dir = v5;

  id v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = topDirectoryCreateIfNeeded__dir;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "using top directory: %@", buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 48))
  {
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = *MEMORY[0x1E4F281F8];
    char v10 = 1;
    *(void *)&long long v11 = 138412546;
    long long v26 = v11;
    while (1)
    {
      char v12 = v10;
      id v28 = 0;
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", topDirectoryCreateIfNeeded__dir, 1, 0, &v28, v26);
      id v13 = v28;
      int v14 = v13;
      if (!v13) {
        goto LABEL_18;
      }
      if ([v13 code] == 640)
      {
        v15 = [v14 domain];
        int v16 = [v15 isEqualToString:v9];

        if (v16)
        {
          v25 = pp_default_log_handle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = topDirectoryCreateIfNeeded__dir;
            _os_log_error_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_ERROR, "Portrait exiting due to lack of disk space while creating %@", buf, 0xCu);
          }

          PPExit(2002);
        }
      }
      if ([v14 code] == 513)
      {
        id v20 = pp_default_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = topDirectoryCreateIfNeeded__dir;
          uint64_t v21 = "Portrait exiting due to lack of write permissions to directory %@";
          uint64_t v22 = v20;
          uint32_t v23 = 12;
          goto LABEL_25;
        }
LABEL_26:

        PPExit(2003);
      }
      if ([v14 code] != 516) {
        break;
      }
      v17 = pp_default_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v26;
        uint64_t v30 = topDirectoryCreateIfNeeded__dir;
        __int16 v31 = 2112;
        v32 = v14;
        _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "Portrait deleting file squatting at %@ due to error %@", buf, 0x16u);
      }

      id v27 = 0;
      [v8 removeItemAtPath:topDirectoryCreateIfNeeded__dir error:&v27];
      id v18 = v27;
      if (v18)
      {
        id v24 = v18;
        id v20 = pp_default_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          uint64_t v30 = topDirectoryCreateIfNeeded__dir;
          __int16 v31 = 2112;
          v32 = v24;
          uint64_t v21 = "Portrait exiting due to failure to delete squatter file %@ due to error %@";
          uint64_t v22 = v20;
          uint32_t v23 = 22;
LABEL_25:
          _os_log_error_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
        }
        goto LABEL_26;
      }
      char v10 = 0;
      if ((v12 & 1) == 0)
      {
        int v14 = 0;
        goto LABEL_18;
      }
    }
    +[PPFileErrorCode handleError:v14];
LABEL_18:
  }
}

+ (id)subdirectory:(id)a3
{
  return +[PPPaths subdirectory:createIfNeeded:]((uint64_t)a1, a3);
}

@end