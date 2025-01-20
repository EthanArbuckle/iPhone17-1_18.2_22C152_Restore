@interface PTEffectBackgroundURLManager
+ (CGSize)findSize:(CGSize)a3 maxSize:(CGSize)a4;
- (BOOL)copyAsFullsizeAndThumbnailFromPixelBuffer:(__CVBuffer *)a3 outputPathFullsize:(id)a4 outputPathThumbnail:(id)a5;
- (PTEffectBackgroundURLManager)init;
- (PTEffectBackgroundURLManager)initWithUserBackgrounds:(BOOL)a3;
- (id)arrayToPlist:(id)a3;
- (id)asyncWorkerQueue;
- (id)backgroundsWithType:(int64_t)a3;
- (id)createBuiltInBackgroundURLsWithFiles:(id)a3 extension:(id)a4 subdirectory:(id)a5;
- (id)makeUniqueFilename;
- (id)plistToArray:(id)a3;
- (void)addUserBackground:(id)a3 ciImage:(id)a4 backgroundToReplace:(id)a5 withOptions:(id)a6 completion:(id)a7;
- (void)addUserBackground:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)addUserBackgroundWithImage:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)hasUserBackground:(id)a3 completion:(id)a4;
- (void)hasUserBackgroundWithImage:(id)a3 completion:(id)a4;
- (void)hasUserBackgroundWithPixelBuffer:(id)a3 ciImage:(id)a4 completion:(id)a5;
- (void)loadUserBackgroundWithPath:(id)a3;
- (void)removeUserBackground:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)replaceUserBackground:(id)a3 withBackground:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)replaceUserBackground:(id)a3 withImage:(id)a4 withOptions:(id)a5 completion:(id)a6;
@end

@implementation PTEffectBackgroundURLManager

- (PTEffectBackgroundURLManager)init
{
  return [(PTEffectBackgroundURLManager *)self initWithUserBackgrounds:1];
}

- (PTEffectBackgroundURLManager)initWithUserBackgrounds:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PTEffectBackgroundURLManager;
  v3 = [(PTEffectBackgroundURLManager *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)loadUserBackgroundWithPath:(id)a3
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_userBackgroundDirectory, a3);
  userBackgroundDirectory = self->_userBackgroundDirectory;
  if (userBackgroundDirectory)
  {
    objc_super v7 = [(NSURL *)userBackgroundDirectory path];

    if (v7)
    {
      id v46 = v5;
      v8 = (void *)MEMORY[0x1E4F1CB10];
      v9 = [(NSURL *)self->_userBackgroundDirectory path];
      v10 = [v9 stringByAppendingPathComponent:@"content.plist"];
      v11 = [v8 fileURLWithPath:v10];
      userBackgroundPList = self->_userBackgroundPList;
      self->_userBackgroundPList = v11;

      v13 = (void *)MEMORY[0x1E4F1CB10];
      v14 = [(NSURL *)self->_userBackgroundDirectory path];
      v15 = [v14 stringByAppendingPathComponent:@"images"];
      v16 = [v13 fileURLWithPath:v15];
      userBackgroundDirectoryImages = self->_userBackgroundDirectoryImages;
      self->_userBackgroundDirectoryImages = v16;

      v18 = (void *)MEMORY[0x1E4F1CB10];
      v19 = [(NSURL *)self->_userBackgroundDirectory path];
      v20 = [v19 stringByAppendingPathComponent:@"thumbnails"];
      v21 = [v18 fileURLWithPath:v20];
      userBackgroundDirectoryThumbnails = self->_userBackgroundDirectoryThumbnails;
      self->_userBackgroundDirectoryThumbnails = v21;

      v23 = self->_userBackgroundDirectoryThumbnails;
      v60[0] = self->_userBackgroundDirectoryImages;
      v60[1] = v23;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (!v25) {
        goto LABEL_24;
      }
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v50;
      while (1)
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v50 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v49 + 1) + 8 * v28);
          unsigned __int8 v48 = 0;
          fileManager = self->_fileManager;
          v31 = [v29 path];
          LOBYTE(fileManager) = [(NSFileManager *)fileManager fileExistsAtPath:v31 isDirectory:&v48];

          if ((fileManager & 1) == 0)
          {
            v36 = self->_fileManager;
            v37 = [v29 path];
            id v47 = 0;
            BOOL v38 = [(NSFileManager *)v36 createDirectoryAtPath:v37 withIntermediateDirectories:1 attributes:0 error:&v47];
            v34 = v47;

            v39 = _PTLogSystem();
            v40 = v39;
            if (v38)
            {
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v41 = [v29 path];
                *(_DWORD *)buf = 138412290;
                v56 = v41;
                _os_log_impl(&dword_1D0778000, v40, OS_LOG_TYPE_INFO, "Created %@", buf, 0xCu);
                goto LABEL_15;
              }
            }
            else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v41 = [v29 path];
              *(_DWORD *)buf = 138412546;
              v56 = v41;
              __int16 v57 = 2112;
              v58 = v34;
              _os_log_error_impl(&dword_1D0778000, v40, OS_LOG_TYPE_ERROR, "Error creating directory %@ error %@", buf, 0x16u);
LABEL_15:
            }
            goto LABEL_20;
          }
          int v32 = v48;
          v33 = _PTLogSystem();
          v34 = v33;
          if (v32)
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              v35 = [v29 path];
              *(_DWORD *)buf = 138412290;
              v56 = v35;
              _os_log_impl(&dword_1D0778000, v34, OS_LOG_TYPE_INFO, "Found background replacement directory %@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            -[PTEffectBackgroundURLManager loadUserBackgroundWithPath:](v53, v29, &v54, v34);
          }
LABEL_20:

          ++v28;
        }
        while (v26 != v28);
        uint64_t v42 = [v24 countByEnumeratingWithState:&v49 objects:v59 count:16];
        uint64_t v26 = v42;
        if (!v42)
        {
LABEL_24:

          v43 = (PTPixelBufferUtil *)objc_opt_new();
          pixelBufferUtil = self->_pixelBufferUtil;
          self->_pixelBufferUtil = v43;

          id v5 = v46;
          goto LABEL_28;
        }
      }
    }
  }
  v45 = _PTLogSystem();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager loadUserBackgroundWithPath:]();
  }

  self->_loadCustomBackgrounds = 0;
LABEL_28:
}

- (id)asyncWorkerQueue
{
  asyncWorkerQueue = self->_asyncWorkerQueue;
  if (!asyncWorkerQueue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.portrait.PTEffectBackgroundURLManager", 0);
    id v5 = self->_asyncWorkerQueue;
    self->_asyncWorkerQueue = v4;

    asyncWorkerQueue = self->_asyncWorkerQueue;
  }

  return asyncWorkerQueue;
}

- (id)createBuiltInBackgroundURLsWithFiles:(id)a3 extension:(id)a4 subdirectory:(id)a5
{
  id v5 = objc_opt_new();
  v6 = _PTLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:]();
  }

  objc_super v7 = (void *)[v5 copy];

  return v7;
}

- (id)backgroundsWithType:(int64_t)a3
{
  v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:]();
  }

  return 0;
}

- (id)makeUniqueFilename
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  v4 = [NSString stringWithFormat:@"%@.heic", v3];

  return v4;
}

- (void)hasUserBackground:(id)a3 completion:(id)a4
{
}

- (void)hasUserBackgroundWithImage:(id)a3 completion:(id)a4
{
}

- (void)hasUserBackgroundWithPixelBuffer:(id)a3 ciImage:(id)a4 completion:(id)a5
{
  id v5 = _PTLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:]();
  }
}

- (void)addUserBackground:(id)a3 ciImage:(id)a4 backgroundToReplace:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  objc_super v7 = _PTLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:]();
  }
}

- (void)addUserBackground:(id)a3 withOptions:(id)a4 completion:(id)a5
{
}

- (void)addUserBackgroundWithImage:(id)a3 withOptions:(id)a4 completion:(id)a5
{
}

- (void)replaceUserBackground:(id)a3 withBackground:(id)a4 withOptions:(id)a5 completion:(id)a6
{
}

- (void)replaceUserBackground:(id)a3 withImage:(id)a4 withOptions:(id)a5 completion:(id)a6
{
}

- (void)removeUserBackground:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v5 = _PTLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:]();
  }
}

+ (CGSize)findSize:(CGSize)a3 maxSize:(CGSize)a4
{
  double v4 = a3.width / a4.width;
  float v5 = a3.width / a4.width;
  double v6 = a3.height / a4.height;
  float v7 = a3.height / a4.height;
  if (v5 > 1.0 || v7 > 1.0)
  {
    if (v5 >= 1.0)
    {
      if (v7 >= 1.0)
      {
        a3 = a4;
      }
      else
      {
        if (a4.width * v6 < a4.width) {
          a4.width = a4.width * v6;
        }
        if (a4.width < a3.width) {
          a3.width = a4.width;
        }
      }
    }
    else
    {
      double height = a4.height * v4;
      if (a4.height * v4 >= a4.height) {
        double height = a4.height;
      }
      if (height < a3.height) {
        a3.double height = height;
      }
    }
  }
  double v10 = floor(a3.width);
  double v11 = floor(a3.height);
  result.double height = v11;
  result.width = v10;
  return result;
}

- (BOOL)copyAsFullsizeAndThumbnailFromPixelBuffer:(__CVBuffer *)a3 outputPathFullsize:(id)a4 outputPathThumbnail:(id)a5
{
  float v5 = _PTLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:]();
  }

  return 0;
}

- (id)arrayToPlist:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v27[0] = @"fullsize";
        double v10 = [v9 fullsizeURL];
        double v11 = [v10 path];
        v28[0] = v11;
        v27[1] = @"thumbnail";
        v12 = [v9 thumbnailURL];
        v13 = [v12 path];
        v28[1] = v13;
        v27[2] = @"inputBufferChecksum";
        v14 = [v9 inputBufferChecksum];
        if (v14)
        {
          v3 = [v9 inputBufferChecksum];
          v15 = v3;
        }
        else
        {
          v15 = &stru_1F269F3B0;
        }
        v28[2] = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
        [v20 addObject:v16];

        if (v14) {
      }
        }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }

  uint64_t v25 = @"content";
  uint64_t v26 = v20;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  return v17;
}

- (id)plistToArray:(id)a3
{
  v3 = _PTLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[PTEffectBackgroundURLManager createBuiltInBackgroundURLsWithFiles:extension:subdirectory:]();
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferUtil, 0);
  objc_storeStrong((id *)&self->_asyncWorkerQueue, 0);
  objc_storeStrong((id *)&self->_userBackgroundDirectoryThumbnails, 0);
  objc_storeStrong((id *)&self->_userBackgroundDirectoryImages, 0);
  objc_storeStrong((id *)&self->_userBackgroundPList, 0);
  objc_storeStrong((id *)&self->_userBackgroundDirectory, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_backgroundGradient, 0);

  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

- (void)loadUserBackgroundWithPath:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Error loading secure container", v2, v3, v4, v5, v6);
}

- (void)loadUserBackgroundWithPath:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 path];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D0778000, a4, OS_LOG_TYPE_ERROR, "%@ is not a directory", a1, 0xCu);
}

- (void)createBuiltInBackgroundURLsWithFiles:extension:subdirectory:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Not supported", v2, v3, v4, v5, v6);
}

@end