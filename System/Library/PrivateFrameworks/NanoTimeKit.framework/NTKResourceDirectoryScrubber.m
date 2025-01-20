@interface NTKResourceDirectoryScrubber
- (BOOL)_scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5;
- (BOOL)scrubDirectoryAtPath:(id)a3 toDestinationPath:(id)a4 error:(id *)a5;
- (NTKResourceDirectoryScrubber)initWithOperations:(id)a3;
@end

@implementation NTKResourceDirectoryScrubber

- (NTKResourceDirectoryScrubber)initWithOperations:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NTKResourceDirectoryScrubber;
  v5 = [(NTKResourceDirectoryScrubber *)&v33 init];
  v6 = v5;
  if (v5)
  {
    v22 = v5;
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v4;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          v13 = [v12 supportedExtensions];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [*(id *)(*((void *)&v25 + 1) + 8 * j) lowercaseString];
                [v7 setObject:v12 forKeyedSubscript:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
            }
            while (v15);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v9);
    }

    v6 = v22;
    objc_storeStrong((id *)&v22->_operationsMaps, v7);
    v19 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      operationsMaps = v22->_operationsMaps;
      *(_DWORD *)buf = 138412290;
      v35 = operationsMaps;
      _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_INFO, "[Resource Scrubber]: initialized with operations: %@", buf, 0xCu);
    }

    id v4 = v23;
  }

  return v6;
}

- (BOOL)scrubDirectoryAtPath:(id)a3 toDestinationPath:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
    long long v31 = v10;
    v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:1];
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v14 = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:0 attributes:0 error:a5];

    BOOL v15 = 0;
    if (v14)
    {
      uint64_t v16 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Created directory for sharing. Now traversing the original directory to see if anything needs scrubbing.", buf, 2u);
      }

      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      v18 = [v17 enumeratorAtPath:v8];

      [v18 skipDescendants];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        id v30 = v8;
        uint64_t v22 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            long long v25 = objc_msgSend(v11, "URLByAppendingPathComponent:", v24, v30);
            long long v26 = [v12 URLByAppendingPathComponent:v24];
            if (![(NTKResourceDirectoryScrubber *)self _scrubAssetAtURL:v25 toDestinationURL:v26 error:a5])
            {
              long long v28 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                -[NTKResourceDirectoryScrubber scrubDirectoryAtPath:toDestinationPath:error:]((uint64_t *)a5, v28);
              }

              BOOL v15 = 0;
              goto LABEL_23;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v21) {
            continue;
          }
          break;
        }
        BOOL v15 = 1;
LABEL_23:
        id v8 = v30;
      }
      else
      {
        BOOL v15 = 1;
      }
    }
    uint64_t v10 = v31;
  }
  else
  {
    long long v27 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[NTKResourceDirectoryScrubber scrubDirectoryAtPath:toDestinationPath:error:]((uint64_t)v8, (uint64_t)v10, v27);
    }

    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.resourceDirectory" code:2002 userInfo:0];
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (BOOL)_scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Checking if asset at: '%@' needs scrubbing", (uint8_t *)&v19, 0xCu);
  }

  operationsMaps = self->_operationsMaps;
  v12 = [v8 pathExtension];
  v13 = [v12 lowercaseString];
  int v14 = [(NSDictionary *)operationsMaps objectForKeyedSubscript:v13];

  if (v14)
  {
    char v15 = [v14 scrubAssetAtURL:v8 toDestinationURL:v9 error:a5];
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  uint64_t v16 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = v8;
    _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_INFO, "[Resource Scrubber]: No scrubbing operations for this asset: '%@'. Passing through.", (uint8_t *)&v19, 0xCu);
  }

  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = [v17 copyItemAtURL:v8 toURL:v9 error:a5];

  if (a5)
  {
LABEL_9:
    if ((v15 & 1) == 0 && !*a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.resourceDirectory" code:2001 userInfo:0];
    }
  }
LABEL_12:

  return v15;
}

- (void).cxx_destruct
{
}

- (void)scrubDirectoryAtPath:(uint64_t)a1 toDestinationPath:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "[Resource Scrubber]: Unable to prepare resource directory for sharing. Original directory: %@. Directory for sharing: %@", (uint8_t *)&v3, 0x16u);
}

- (void)scrubDirectoryAtPath:(uint64_t *)a1 toDestinationPath:(NSObject *)a2 error:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1) {
    uint64_t v2 = *a1;
  }
  else {
    uint64_t v2 = 0;
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "[Resource Scrubber]: Scrubbing failed: %@", (uint8_t *)&v3, 0xCu);
}

@end