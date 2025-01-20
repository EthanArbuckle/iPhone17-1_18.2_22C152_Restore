@interface PCDLHandleForLibrary
@end

@implementation PCDLHandleForLibrary

uint64_t ___PCDLHandleForLibrary_block_invoke()
{
  _PCDLHandleForLibrary_handles = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
  _PCDLHandleForLibrary_queue = (uint64_t)dispatch_queue_create("PCDYLDLoaderQueue", 0);
  return MEMORY[0x1F41817F8]();
}

void ___PCDLHandleForLibrary_block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  v3 = [v2 pathExtension];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v3 isEqualToString:@"framework"])
  {
    if (_PCFrameworkSearchPaths_onceToken != -1) {
      dispatch_once(&_PCFrameworkSearchPaths_onceToken, &__block_literal_global_30);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = (id)_PCFrameworkSearchPaths_paths;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v21 + 1) + 8 * i) stringByAppendingPathComponent:v2];
          if ([v4 fileExistsAtPath:v10])
          {
            v16 = [v2 stringByDeletingPathExtension];
            id v15 = [v10 stringByAppendingPathComponent:v16];

            goto LABEL_26;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_24:

LABEL_29:
    id v15 = 0;
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"dylib"])
  {
    if (_PCLibrarySearchPaths_onceToken != -1) {
      dispatch_once(&_PCLibrarySearchPaths_onceToken, &__block_literal_global_39);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = (id)_PCLibrarySearchPaths_paths;
    uint64_t v11 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v5);
          }
          id v15 = [*(id *)(*((void *)&v21 + 1) + 8 * j) stringByAppendingPathComponent:v2];
          if ([v4 fileExistsAtPath:v15])
          {
LABEL_26:

            goto LABEL_30;
          }
        }
        uint64_t v12 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    goto LABEL_24;
  }
  if (![v3 isEqualToString:&stru_1F2AB1208]) {
    goto LABEL_29;
  }
  id v15 = v2;
LABEL_30:

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)_PCDLHandleForLibrary_handles, *(const void **)(a1 + 32));
  v17 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!v17)
  {
    id v18 = v15;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = dlopen((const char *)[v18 fileSystemRepresentation], 5);
    v17 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (!v17)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"void *_PCDLHandleForLibrary(NSString *__strong)_block_invoke_2"];
      [v19 handleFailureInFunction:v20, @"PCUtilities.m", 114, @"Unable to open framework '%@'", v18 file lineNumber description];

      v17 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
  CFDictionarySetValue((CFMutableDictionaryRef)_PCDLHandleForLibrary_handles, v15, v17);
}

@end