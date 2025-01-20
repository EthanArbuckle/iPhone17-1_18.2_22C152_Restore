@interface TPFileStorageManager
+ (id)sharedInstance;
- (BOOL)hasClearedLegacyStorage;
- (NSURL)urlForFileSystem;
- (OS_dispatch_queue)queue;
- (TPFileStorageManager)init;
- (id)imageWithName:(id)a3;
- (id)urlsForLegacyFileSystem;
- (void)clearLegacyStorageIfNecessary;
- (void)dealloc;
- (void)deleteStorageAtURLs:(id)a3;
- (void)localeChanged;
- (void)saveImage:(id)a3 withName:(id)a4;
- (void)setHasClearedLegacyStorage:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)urlForFileSystem;
- (void)urlsForLegacyFileSystem;
@end

@implementation TPFileStorageManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__TPFileStorageManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __38__TPFileStorageManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (TPFileStorageManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)TPFileStorageManager;
  uint64_t v2 = [(TPFileStorageManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.TelephonyUI.TPFileStorageManager", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_localeChanged name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TPFileStorageManager;
  [(TPFileStorageManager *)&v4 dealloc];
}

- (void)saveImage:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TPFileStorageManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TPFileStorageManager_saveImage_withName___block_invoke;
  block[3] = &unk_1E647C3E8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __43__TPFileStorageManager_saveImage_withName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) urlForFileSystem];
  if (v2)
  {
    char v18 = 0;
    dispatch_queue_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_super v4 = [v2 path];
    int v5 = [v3 fileExistsAtPath:v4 isDirectory:&v18];

    if (v5) {
      BOOL v6 = v18 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v17 = 0;
      char v8 = [v7 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v17];
      id v9 = v17;

      if ((v8 & 1) == 0)
      {
        id v10 = TPDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_2();
        }
      }
    }
    v11 = [v2 URLByAppendingPathComponent:*(void *)(a1 + 40)];
    id v12 = UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
    id v16 = 0;
    char v13 = [v12 writeToURL:v11 options:268435457 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0)
    {
      v15 = TPDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_1();
      }
    }
  }
}

- (id)imageWithName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  int v5 = [(TPFileStorageManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__TPFileStorageManager_imageWithName___block_invoke;
  block[3] = &unk_1E647C2E0;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  dispatch_sync(v5, block);

  id v7 = (void *)v14[5];
  if (!v7)
  {
    [(TPFileStorageManager *)self clearLegacyStorageIfNecessary];
    id v7 = (void *)v14[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __38__TPFileStorageManager_imageWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) urlForFileSystem];
  dispatch_queue_t v3 = [v2 URLByAppendingPathComponent:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3)
  {
    int v5 = (const char *)[v3 fileSystemRepresentation];
    if (!v5)
    {
      id v9 = TPDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __38__TPFileStorageManager_imageWithName___block_invoke_cold_1();
      }
      goto LABEL_13;
    }
    int v6 = open(v5, 0, 0);
    if (v6 >= 1)
    {
      int v7 = v6;
      memset(&v25, 0, sizeof(v25));
      if (fstat(v6, &v25))
      {
        id v8 = TPDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __38__TPFileStorageManager_imageWithName___block_invoke_cold_3(v7, v8);
        }
LABEL_7:

LABEL_8:
        id v9 = 0;
        goto LABEL_9;
      }
      if (v25.st_size)
      {
        v19 = (UInt8 *)mmap(0, v25.st_size, 1, 1025, v7, 0);
        if (v19 == (UInt8 *)-1)
        {
          id v8 = TPDefaultLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            __38__TPFileStorageManager_imageWithName___block_invoke_cold_2(v7, v8);
          }
          goto LABEL_7;
        }
        v20 = v19;
        context.version = 0;
        memset(&context.retain, 0, 40);
        context.info = (void *)v25.st_size;
        context.deallocate = (CFAllocatorDeallocateCallBack)_mmapDeallocatorCallback;
        context.preferredSize = 0;
        CFAllocatorRef v21 = CFAllocatorCreate(0, &context);
        if (!v21) {
          goto LABEL_8;
        }
        CFAllocatorRef v22 = v21;
        id v9 = CFDataCreateWithBytesNoCopy(0, v20, v25.st_size, v21);
        if (!v9) {
          munmap(v20, v25.st_size);
        }
        CFRelease(v22);
      }
      else
      {
        v23 = TPDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(context.version) = 0;
          _os_log_impl(&dword_1C2F24000, v23, OS_LOG_TYPE_DEFAULT, "Memory mapping a zero byte file", (uint8_t *)&context, 2u);
        }

        id v9 = CFDataCreate(0, 0, 0);
      }
LABEL_9:
      close(v7);
      if (v9)
      {
        id v10 = [MEMORY[0x1E4FB1818] imageWithData:v9];
        id v11 = (void *)MEMORY[0x1E4FB1818];
        id v12 = v10;
        uint64_t v13 = [v12 CGImage];
        id v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v14 scale];
        uint64_t v16 = objc_msgSend(v11, "imageWithCGImage:scale:orientation:", v13, objc_msgSend(v12, "imageOrientation"), v15);
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

LABEL_13:
      }
    }
  }
}

- (void)localeChanged
{
  dispatch_queue_t v3 = [(TPFileStorageManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__TPFileStorageManager_localeChanged__block_invoke;
  block[3] = &unk_1E647C1D0;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __37__TPFileStorageManager_localeChanged__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) urlForFileSystem];
  id v19 = 0;
  id v4 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:&v19];
  id v5 = v19;

  uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138412546;
    long long v17 = v7;
    do
    {
      uint64_t v10 = 0;
      id v11 = v5;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v17);
        id v18 = v11;
        int v14 = [v13 removeItemAtURL:v12 error:&v18];
        id v5 = v18;

        if (v14) {
          BOOL v15 = v5 == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (!v15)
        {
          uint64_t v16 = TPDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v25 = v12;
            __int16 v26 = 2112;
            id v27 = v5;
            _os_log_error_impl(&dword_1C2F24000, v16, OS_LOG_TYPE_ERROR, "Error deleting file %@ %@", buf, 0x16u);
          }
        }
        ++v10;
        id v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (NSURL)urlForFileSystem
{
  urlForFileSystem = self->_urlForFileSystem;
  if (!urlForFileSystem)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = 0;
    id v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v11];
    id v6 = v11;

    if (v5)
    {
      long long v7 = [NSString stringWithFormat:@"%@-%d", @"TelephonyUI", 10];
      uint64_t v8 = [v5 URLByAppendingPathComponent:v7];
      uint64_t v9 = self->_urlForFileSystem;
      self->_urlForFileSystem = v8;
    }
    else
    {
      long long v7 = TPDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[TPFileStorageManager urlForFileSystem]();
      }
    }

    urlForFileSystem = self->_urlForFileSystem;
  }
  return urlForFileSystem;
}

- (id)urlsForLegacyFileSystem
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_queue_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v27 = 0;
  id v4 = [v3 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v27];
  id v5 = v27;

  if (v4)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v26 = v5;
    long long v7 = [v6 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:&v26];
    id v8 = v26;

    if (v7)
    {
      id v20 = v8;
      long long v21 = v4;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v7 = v7;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            int v14 = objc_msgSend(v13, "pathComponents", v20, v21, (void)v22);
            BOOL v15 = [v14 lastObject];
            int v16 = [v15 hasPrefix:@"TelephonyUI"];

            if (v16) {
              [v2 addObject:v13];
            }
          }
          uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v10);
      }

      id v8 = v20;
      id v4 = v21;
    }
    else
    {
      long long v17 = TPDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[TPFileStorageManager urlsForLegacyFileSystem]();
      }
    }
  }
  else
  {
    long long v7 = TPDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[TPFileStorageManager urlsForLegacyFileSystem]();
    }
    id v8 = v5;
  }

  id v18 = (void *)[v2 copy];
  return v18;
}

- (void)clearLegacyStorageIfNecessary
{
  if (![(TPFileStorageManager *)self hasClearedLegacyStorage])
  {
    dispatch_queue_t v3 = TPDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1C2F24000, v3, OS_LOG_TYPE_DEFAULT, "clear legacy storage", v5, 2u);
    }

    id v4 = [(TPFileStorageManager *)self urlsForLegacyFileSystem];
    [(TPFileStorageManager *)self deleteStorageAtURLs:v4];

    [(TPFileStorageManager *)self setHasClearedLegacyStorage:1];
  }
}

- (void)deleteStorageAtURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(TPFileStorageManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__TPFileStorageManager_deleteStorageAtURLs___block_invoke;
  block[3] = &unk_1E647C1D0;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __44__TPFileStorageManager_deleteStorageAtURLs___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v19;
    *(void *)&long long v3 = 138412546;
    long long v16 = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v1);
        }
        long long v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v16);
        uint64_t v9 = [v7 path];
        int v10 = [v8 fileExistsAtPath:v9];

        if (v10)
        {
          uint64_t v11 = TPDefaultLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v23 = v7;
            _os_log_impl(&dword_1C2F24000, v11, OS_LOG_TYPE_DEFAULT, "deleting legacy storage at URL: %@", buf, 0xCu);
          }

          uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v17 = 0;
          char v13 = [v12 removeItemAtURL:v7 error:&v17];
          id v14 = v17;

          if ((v13 & 1) == 0)
          {
            BOOL v15 = TPDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              long long v23 = v7;
              __int16 v24 = 2112;
              id v25 = v14;
              _os_log_error_impl(&dword_1C2F24000, v15, OS_LOG_TYPE_ERROR, "Error deleting storage at %@ %@", buf, 0x16u);
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v1 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)hasClearedLegacyStorage
{
  return self->_hasClearedLegacyStorage;
}

- (void)setHasClearedLegacyStorage:(BOOL)a3
{
  self->_hasClearedLegacyStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_urlForFileSystem, 0);
}

void __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C2F24000, v0, v1, "Error writing image %@", v2, v3, v4, v5, v6);
}

void __43__TPFileStorageManager_saveImage_withName___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C2F24000, v0, v1, "Error creating directory for mmap images %@", v2, v3, v4, v5, v6);
}

void __38__TPFileStorageManager_imageWithName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C2F24000, v0, v1, "Can't get file system representation for file path %@", v2, v3, v4, v5, v6);
}

void __38__TPFileStorageManager_imageWithName___block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  v6[0] = 67109378;
  v6[1] = a1;
  __int16 v7 = 2080;
  id v8 = v5;
  _os_log_error_impl(&dword_1C2F24000, a2, OS_LOG_TYPE_ERROR, "Could not mmap %d: %s", (uint8_t *)v6, 0x12u);
}

void __38__TPFileStorageManager_imageWithName___block_invoke_cold_3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C2F24000, a2, OS_LOG_TYPE_ERROR, "fstat failed %d", (uint8_t *)v2, 8u);
}

- (void)urlForFileSystem
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C2F24000, v0, v1, "Error getting library cache Directory %@", v2, v3, v4, v5, v6);
}

- (void)urlsForLegacyFileSystem
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C2F24000, v0, v1, "Error getting files from directory %@", v2, v3, v4, v5, v6);
}

@end