@interface NSFileManager(VoiceServices)
- (uint64_t)directorySize:()VoiceServices;
- (void)cleanDirectory:()VoiceServices withDateOlderThan:;
- (void)cleanDirectory:()VoiceServices withLRULimit:;
- (void)removeDirectory:()VoiceServices;
@end

@implementation NSFileManager(VoiceServices)

- (uint64_t)directorySize:()VoiceServices
{
  v43[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [NSURL fileURLWithPath:v4 isDirectory:1];
  uint64_t v6 = *MEMORY[0x263EFF628];
  v43[0] = *MEMORY[0x263EFF628];
  unint64_t v7 = 0x263EFF000uLL;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
  id v36 = 0;
  v9 = [a1 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v8 options:4 error:&v36];
  id v10 = v36;

  if (v10)
  {
    uint64_t v11 = [v10 code];
    v12 = VSGetLogDefault();
    v13 = v12;
    if (v11 == 260)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v4;
        _os_log_impl(&dword_20CABC000, v13, OS_LOG_TYPE_INFO, "No cache directory from which to get the size: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v4;
      __int16 v41 = 2112;
      id v42 = v10;
      _os_log_error_impl(&dword_20CABC000, v13, OS_LOG_TYPE_ERROR, "Error getting cache path: %@, error: %@", buf, 0x16u);
    }
    goto LABEL_20;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (!v14)
  {
    id v10 = 0;
LABEL_20:
    uint64_t v25 = 0;
    goto LABEL_21;
  }
  uint64_t v15 = v14;
  v27 = v9;
  id v28 = v4;
  id v10 = 0;
  uint64_t v30 = 0;
  uint64_t v16 = *(void *)v33;
  obj = v13;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      v18 = v10;
      if (*(void *)v33 != v16) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v37 = v6;
      unint64_t v20 = v7;
      v21 = objc_msgSend(*(id *)(v7 + 2240), "arrayWithObjects:count:", &v37, 1, v27, v28);
      id v31 = v10;
      v22 = [v19 resourceValuesForKeys:v21 error:&v31];
      id v10 = v31;

      if (v10)
      {
        v23 = VSGetLogDefault();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = [v19 path];
          *(_DWORD *)buf = 138412546;
          id v40 = v24;
          __int16 v41 = 2112;
          id v42 = v10;
          _os_log_error_impl(&dword_20CABC000, v23, OS_LOG_TYPE_ERROR, "Unable to get URL: %@, URL resources: %@", buf, 0x16u);
        }
      }
      else
      {
        v23 = [v22 objectForKeyedSubscript:v6];
        v30 += [v23 longLongValue];
      }

      unint64_t v7 = v20;
    }
    v13 = obj;
    uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  }
  while (v15);
  v9 = v27;
  id v4 = v28;
  uint64_t v25 = v30;
LABEL_21:

  return v25;
}

- (void)cleanDirectory:()VoiceServices withDateOlderThan:
{
  v34[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [NSURL fileURLWithPath:a3];
  uint64_t v8 = *MEMORY[0x263EFF5E8];
  v34[0] = *MEMORY[0x263EFF5E8];
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  v22 = a1;
  v21 = (void *)v7;
  id v10 = [a1 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v9 options:5 error:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        id v24 = 0;
        [v16 getResourceValue:&v24 forKey:v8 error:0];
        id v17 = v24;
        [v17 timeIntervalSinceDate:v6];
        if (v18 <= 0.0)
        {
          id v23 = 0;
          [v22 removeItemAtURL:v16 error:&v23];
          id v19 = v23;
          if (v19)
          {
            unint64_t v20 = VSGetLogDefault();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = v16;
              __int16 v31 = 2112;
              id v32 = v19;
              _os_log_error_impl(&dword_20CABC000, v20, OS_LOG_TYPE_ERROR, "Can't remove file '%@', error: %@", buf, 0x16u);
            }
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }
}

- (void)cleanDirectory:()VoiceServices withLRULimit:
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = mach_absolute_time();
  uint64_t v8 = [NSURL fileURLWithPath:v6];
  v37[0] = *MEMORY[0x263EFF5E8];
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  id v10 = [a1 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v9 options:5 error:0];

  if ([v10 count] >= a4)
  {
    uint64_t v21 = v7;
    long long v25 = v8;
    id v26 = v6;
    [v10 sortedArrayUsingComparator:&__block_literal_global_385];
    id v24 = v10;
    id v23 = v22 = a4;
    id v11 = objc_msgSend(v23, "subarrayWithRange:", 0, objc_msgSend(v10, "count") - a4);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v27 = 0;
          [a1 removeItemAtURL:v16 error:&v27];
          id v17 = v27;
          if (v17)
          {
            double v18 = VSGetLogDefault();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v33 = v16;
              __int16 v34 = 2112;
              v35[0] = v17;
              _os_log_error_impl(&dword_20CABC000, v18, OS_LOG_TYPE_ERROR, "Can't remove file '%@', error: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v13);
    }
    id v19 = VSGetLogDefault();
    uint64_t v8 = v25;
    id v6 = v26;
    id v10 = v24;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v20 = mach_absolute_time() - v21;
      if (VSAbsoluteTimeToSecond_onceToken != -1) {
        dispatch_once(&VSAbsoluteTimeToSecond_onceToken, &__block_literal_global_7);
      }
      *(_DWORD *)buf = 138412802;
      id v33 = v26;
      __int16 v34 = 1024;
      LODWORD(v35[0]) = v22;
      WORD2(v35[0]) = 2048;
      *(double *)((char *)v35 + 6) = *(double *)&VSAbsoluteTimeToSecond_clockFactor * (double)v20;
      _os_log_debug_impl(&dword_20CABC000, v19, OS_LOG_TYPE_DEBUG, "Cleaned directory: '%@', LRU limit: %d, latency: %f", buf, 0x1Cu);
    }
  }
}

- (void)removeDirectory:()VoiceServices
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(NSURL, "fileURLWithPath:");
  v3 = [a1 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:0 options:4 error:0];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "removeItemAtURL:error:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end