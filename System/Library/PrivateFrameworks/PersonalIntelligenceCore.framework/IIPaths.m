@interface IIPaths
+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)resourcesDirectory;
+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)suggestionsDirectoryFile:(id)a3;
+ (id)suggestionsSubdirectory:(id)a3;
+ (id)topDirectory;
+ (id)topDirectoryCreateIfNeeded:(BOOL)a3;
+ (id)topDirectoryWithName:(id)a3 createIfNeeded:(BOOL)a4;
@end

@implementation IIPaths

+ (id)resourcesDirectory
{
  v4 = (void *)MEMORY[0x1CB79E3D0]();
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 resourcePath];
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"IIPaths.m" lineNumber:161 description:@"Error: Unable to find resource directory"];
  }
  return v6;
}

+ (id)suggestionsSubdirectory:(id)a3
{
  return (id)[a1 subdirectory:a3 createIfNeeded:1];
}

+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void *)MEMORY[0x1CB79E3D0]();
  v9 = [a1 topDirectoryCreateIfNeeded:v4];
  v10 = [v9 stringByAppendingPathComponent:v7];

  if (v4)
  {
    id v11 = a1;
    objc_sync_enter(v11);
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v22 = 0;
    [v12 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v13 = v22;

    objc_sync_exit(v11);
    if (v13)
    {
      if ([v13 code] == 640)
      {
        v14 = [v13 domain];
        int v15 = [v14 isEqualToString:*MEMORY[0x1E4F281F8]];

        if (v15)
        {
          v20 = ii_default_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v13;
            _os_log_error_impl(&dword_1CABE8000, v20, OS_LOG_TYPE_ERROR, "IIPaths: failed to create subdirectory due to lack of space: %@", buf, 0xCu);
          }

          if ([MEMORY[0x1E4F93B08] isInternalBuild])
          {
            v21 = ii_default_log_handle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1CABE8000, v21, OS_LOG_TYPE_FAULT, "IIPaths: unable to create directory due to lack of space.", buf, 2u);
            }
          }
          IIExit(4002);
        }
      }
      if ([v13 code] == 513)
      {
        v18 = ii_default_log_handle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v13;
          _os_log_error_impl(&dword_1CABE8000, v18, OS_LOG_TYPE_ERROR, "IIPaths: failed to create subdirectory due to lack of permissions: %@", buf, 0xCu);
        }

        if ([MEMORY[0x1E4F93B08] isInternalBuild])
        {
          v19 = ii_default_log_handle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1CABE8000, v19, OS_LOG_TYPE_FAULT, "IIPaths: unable to create directory due to lack of permissions.", buf, 2u);
          }
        }
        IIExit(4003);
      }
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v11, @"IIPaths.m", 134, @"Error creating subdirectory: %@", v13 object file lineNumber description];
    }
  }

  return v10;
}

+ (id)suggestionsDirectoryFile:(id)a3
{
  return (id)[a1 filename:a3 createIfNeeded:1];
}

+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1CB79E3D0]();
  v8 = [a1 topDirectoryCreateIfNeeded:v4];
  v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

+ (id)topDirectoryWithName:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v9 = [v8 objectAtIndexedSubscript:0];

  if (!v9 || ![v9 length])
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:a1 file:@"IIPaths.m" lineNumber:47 description:@"failed to construct the root path"];
  }
  v10 = (void *)MEMORY[0x1CB79E3D0]();
  uint64_t v11 = [v9 stringByAppendingPathComponent:v7];
  v12 = (void *)topDirectoryWithName_createIfNeeded__dir;
  topDirectoryWithName_createIfNeeded__dir = v11;

  id v13 = ii_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = topDirectoryWithName_createIfNeeded__dir;
    _os_log_debug_impl(&dword_1CABE8000, v13, OS_LOG_TYPE_DEBUG, "using top directory: %@", buf, 0xCu);
  }

  if (v4)
  {
    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v25 = 0;
    [v14 createDirectoryAtPath:topDirectoryWithName_createIfNeeded__dir withIntermediateDirectories:1 attributes:0 error:&v25];
    id v15 = v25;
    v16 = v15;
    if (v15)
    {
      if ([v15 code] == 640)
      {
        v17 = [v16 domain];
        int v18 = [v17 isEqualToString:*MEMORY[0x1E4F281F8]];

        if (v18)
        {
          id v24 = ii_default_log_handle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = (uint64_t)v16;
            _os_log_error_impl(&dword_1CABE8000, v24, OS_LOG_TYPE_ERROR, "IIPaths: failed to create directory due to lack of space: %@", buf, 0xCu);
          }

          IIExit(4002);
        }
      }
      if ([v16 code] == 513)
      {
        v23 = ii_default_log_handle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = (uint64_t)v16;
          _os_log_error_impl(&dword_1CABE8000, v23, OS_LOG_TYPE_ERROR, "IIPaths: failed to create directory due to lack of permissions: %@", buf, 0xCu);
        }

        IIExit(4003);
      }
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, a1, @"IIPaths.m", 65, @"Error creating directory for %@: %@", v7, v16 object file lineNumber description];
    }
  }
  id v20 = (id)topDirectoryWithName_createIfNeeded__dir;

  return v20;
}

+ (id)topDirectoryCreateIfNeeded:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__IIPaths_topDirectoryCreateIfNeeded___block_invoke;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = a1;
  BOOL v6 = a3;
  if (topDirectoryCreateIfNeeded___pasOnceToken2[0] != -1) {
    dispatch_once(topDirectoryCreateIfNeeded___pasOnceToken2, v5);
  }
  v3 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;
  return v3;
}

void __38__IIPaths_topDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79E3D0]();
  uint64_t v3 = [*(id *)(a1 + 32) topDirectoryWithName:@"Suggestions" createIfNeeded:*(unsigned __int8 *)(a1 + 40)];
  BOOL v4 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;
  topDirectoryCreateIfNeeded___pasExprOnceResult = v3;
}

+ (id)topDirectory
{
  return (id)[a1 topDirectoryCreateIfNeeded:1];
}

@end