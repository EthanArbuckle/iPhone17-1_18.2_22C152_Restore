@interface MBDLHandleForLibrary
@end

@implementation MBDLHandleForLibrary

dispatch_queue_t ___MBDLHandleForLibrary_block_invoke()
{
  _MBDLHandleForLibrary_handles = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
  dispatch_queue_t result = dispatch_queue_create("MBDYLDLoaderQueue", 0);
  _MBDLHandleForLibrary_queue = (uint64_t)result;
  return result;
}

void ___MBDLHandleForLibrary_block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)[v2 pathExtension];
  v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if ([v3 isEqualToString:@"framework"])
  {
    if (_MBFrameworkSearchPaths_onceToken != -1) {
      dispatch_once(&_MBFrameworkSearchPaths_onceToken, &__block_literal_global_24_0);
    }
    v5 = (void *)_MBFrameworkSearchPaths_paths;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [(id)_MBFrameworkSearchPaths_paths countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * i) stringByAppendingPathComponent:v2];
          if ([v4 fileExistsAtPath:v10])
          {
            v2 = objc_msgSend(v10, "stringByAppendingPathComponent:", objc_msgSend(v2, "stringByDeletingPathExtension"));
            goto LABEL_29;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    goto LABEL_27;
  }
  if ([v3 isEqualToString:@"dylib"])
  {
    if (_MBLibrarySearchPaths_onceToken != -1) {
      dispatch_once(&_MBLibrarySearchPaths_onceToken, &__block_literal_global_33_0);
    }
    v11 = (void *)_MBLibrarySearchPaths_paths;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [(id)_MBLibrarySearchPaths_paths countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) stringByAppendingPathComponent:v2];
          if ([v4 fileExistsAtPath:v16])
          {
            v2 = (void *)v16;
            goto LABEL_29;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    goto LABEL_27;
  }
  if (([v3 isEqualToString:&stru_1F394E128] & 1) == 0) {
LABEL_27:
  }
    v2 = 0;
LABEL_29:
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)_MBDLHandleForLibrary_handles, *(const void **)(a1 + 32));
  v17 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!v17)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = dlopen((const char *)[v2 fileSystemRepresentation], 5);
    NSLog(&cfstr_Opened.isa, v2);
    v17 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (!v17)
    {
      v18 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "void *_MBDLHandleForLibrary(NSString *)_block_invoke_2"), @"MBWeakLinking.m", 82, @"Unable to open framework at %@: %s", v2, dlerror() file lineNumber description];
      v17 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
  CFDictionarySetValue((CFMutableDictionaryRef)_MBDLHandleForLibrary_handles, v2, v17);
}

@end