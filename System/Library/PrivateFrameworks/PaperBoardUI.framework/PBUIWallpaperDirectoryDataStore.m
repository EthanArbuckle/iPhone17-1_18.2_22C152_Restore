@interface PBUIWallpaperDirectoryDataStore
+ (NSURL)defaultDirectoryURL;
- (BOOL)copyVideoAtURL:(id)a3 toURL:(id)a4;
- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (BOOL)setOriginalVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setProceduralWallpaperInfo:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4;
- (BOOL)setWallpaperImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperOriginalImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5;
- (BOOL)supportsWallpaperImageHashDataStorage;
- (BOOL)supportsWallpaperOptions;
- (NSDictionary)directoryCreationAttributes;
- (NSString)description;
- (NSURL)directoryURL;
- (PBUIWallpaperDirectoryDataStore)init;
- (PBUIWallpaperDirectoryDataStore)initWithDirectoryURL:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)proceduralWallpaperInfoForVariant:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)verifiedOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)verifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperColorForVariant:(int64_t)a3;
- (id)wallpaperColorNameForVariant:(int64_t)a3;
- (id)wallpaperGradientForVariant:(int64_t)a3;
- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperImageURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOptionsURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOriginalImageURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperThumbnailDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperThumbnailURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (id)wallpaperVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4;
- (void)cleanup;
- (void)createDirectory;
- (void)didWriteFileToURL:(id)a3;
- (void)moveWallpaperImageDataTypes:(unint64_t)a3 fromVariant:(int64_t)a4 toVariant:(int64_t)a5;
- (void)removeVideoForVariant:(int64_t)a3;
- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4;
- (void)removeWallpaperOptionsForVariants:(int64_t)a3;
- (void)setSupportsWallpaperOptions:(BOOL)a3;
@end

@implementation PBUIWallpaperDirectoryDataStore

+ (NSURL)defaultDirectoryURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/SpringBoard"];
  v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return (NSURL *)v4;
}

- (PBUIWallpaperDirectoryDataStore)initWithDirectoryURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIWallpaperDirectoryDataStore;
  v5 = [(PBUIWallpaperDirectoryDataStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    directoryURL = v5->_directoryURL;
    v5->_directoryURL = (NSURL *)v6;
  }
  return v5;
}

- (void)cleanup
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
  id v4 = __possibleWallpaperFileNames();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = *MEMORY[0x1E4F1C670];
  uint64_t v64 = *MEMORY[0x1E4F1C670];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v34 = (void *)v3;
  v8 = [v5 enumeratorAtURL:v3 includingPropertiesForKeys:v7 options:1 errorHandler:&__block_literal_global_7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v55;
    uint64_t v37 = v6;
    v38 = v4;
    uint64_t v35 = *(void *)v55;
    v36 = v8;
    do
    {
      uint64_t v12 = 0;
      uint64_t v39 = v10;
      do
      {
        if (*(void *)v55 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
        id v52 = 0;
        id v53 = 0;
        char v14 = [v13 getResourceValue:&v53 forKey:v6 error:&v52];
        id v15 = v53;
        id v42 = v52;
        if (v14)
        {
          if (![v15 BOOLValue]) {
            goto LABEL_38;
          }
          id v40 = v15;
          uint64_t v41 = v12;
          v16 = [v13 lastPathComponent];
          if ([v16 hasPrefix:@"."]
            && ([v16 pathExtension],
                v17 = objc_claimAutoreleasedReturnValue(),
                uint64_t v18 = [v17 length],
                v17,
                v18 == 6))
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v19 = v4;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v49;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v49 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  if ([v16 containsString:*(void *)(*((void *)&v48 + 1) + 8 * i)])
                  {
                    v24 = [MEMORY[0x1E4F28CB8] defaultManager];
                    id v47 = 0;
                    int v25 = [v24 removeItemAtURL:v13 error:&v47];
                    id v26 = v47;

                    v27 = PBUILogCommon();
                    v28 = v27;
                    if (v25)
                    {
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138543362;
                        v61 = v13;
                        _os_log_debug_impl(&dword_1BC4B3000, v28, OS_LOG_TYPE_DEBUG, "Removed bad wallpaper data @ URL %{public}@", buf, 0xCu);
                      }
                    }
                    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v61 = v13;
                      __int16 v62 = 2114;
                      id v63 = v26;
                      _os_log_error_impl(&dword_1BC4B3000, v28, OS_LOG_TYPE_ERROR, "Unable to remove bad wallpaper data @ URL %{public}@: %{public}@", buf, 0x16u);
                    }
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v59 count:16];
              }
              while (v21);
            }
          }
          else
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v29 = v4;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v58 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v44;
              do
              {
                for (uint64_t j = 0; j != v31; ++j)
                {
                  if (*(void *)v44 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  if ([v16 hasPrefix:*(void *)(*((void *)&v43 + 1) + 8 * j)])[(PBUIWallpaperDirectoryDataStore *)self didWriteFileToURL:v13]; {
                }
                  }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v58 count:16];
              }
              while (v31);
            }
          }
          id v4 = v38;

          v8 = v36;
          uint64_t v6 = v37;
          uint64_t v11 = v35;
          uint64_t v10 = v39;
        }
        else
        {
          id v40 = v15;
          uint64_t v41 = v12;
          v16 = PBUILogCommon();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v61 = v13;
            __int16 v62 = 2114;
            id v63 = v42;
            _os_log_error_impl(&dword_1BC4B3000, v16, OS_LOG_TYPE_ERROR, "Unable to read resource type from directory URL %{public}@: %{public}@", buf, 0x16u);
          }
        }

        id v15 = v40;
        uint64_t v12 = v41;
LABEL_38:

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v10);
  }
}

uint64_t __42__PBUIWallpaperDirectoryDataStore_cleanup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = PBUILogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __42__PBUIWallpaperDirectoryDataStore_cleanup__block_invoke_cold_1();
  }

  return 1;
}

- (PBUIWallpaperDirectoryDataStore)init
{
  uint64_t v3 = [(id)objc_opt_class() defaultDirectoryURL];
  id v4 = [(PBUIWallpaperDirectoryDataStore *)self initWithDirectoryURL:v3];

  return v4;
}

- (id)wallpaperImageURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v6 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
  v7 = __wallpaperImageFilename(a3, a4);
  v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];

  return v8;
}

- (id)wallpaperOriginalImageURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v6 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
  v7 = __wallpaperOriginalImageFilename(a3, a4);
  if (v7)
  {
    v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)wallpaperThumbnailURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v6 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
  v7 = __wallpaperThumbnailFilename(a3, a4);
  if (v7)
  {
    v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)wallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  v27[3] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  v7 = -[PBUIWallpaperDirectoryDataStore wallpaperImageURLForVariant:wallpaperMode:](self, "wallpaperImageURLForVariant:wallpaperMode:");
  v8 = v7;
  if (v7)
  {
    id v26 = 0;
    uint64_t v9 = PBUIWallpaperDataForFileURL(v7, &v26);
    id v10 = v26;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = 0;
  }
  uint64_t v11 = PBUILogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v24 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperImageURLForVariant:a3 wallpaperMode:a4];
    LODWORD(v27[0]) = 138543362;
    *(CFTypeRef *)((char *)v27 + 4) = v24;
    _os_log_debug_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_DEBUG, "Wallpaper file URL: %{public}@", (uint8_t *)v27, 0xCu);
  }
  uint64_t v12 = PBUILogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PBUIWallpaperDirectoryDataStore wallpaperImageForVariant:wallpaperMode:](v9, v12);
  }

  if (v9)
  {
    v27[0] = 0;
    CFTypeRef cf = 0;
    CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      CFArrayRef v14 = ImagesFromData;
      ValueAtIndex = CFArrayGetValueAtIndex(ImagesFromData, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v27[0])
      {
        [(id)v27[0] floatValue];
        double v17 = v16;
      }
      else
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", cf);
        [v21 scale];
        double v17 = v22;
      }
      id v19 = [[PBUIWallpaperImage alloc] initWithCGImage:ValueAtIndex scale:0 orientation:v8 wallpaperFileURL:v17];
      CFRelease(v14);
    }
    else
    {
      uint64_t v20 = PBUILogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PBUIWallpaperDirectoryDataStore wallpaperImageForVariant:wallpaperMode:]((uint64_t *)&cf, v20);
      }

      id v19 = 0;
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v27[0]) {
      CFRelease(v27[0]);
    }
  }
  else
  {
    uint64_t v18 = PBUILogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[PBUIWallpaperDirectoryDataStore wallpaperImageForVariant:wallpaperMode:]((uint64_t)v10, v18);
    }

    id v19 = 0;
  }

  return v19;
}

- (BOOL)hasWallpaperImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  id v4 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperImageURLForVariant:a3 wallpaperMode:a4];
  char v5 = [v4 checkResourceIsReachableAndReturnError:0];

  return v5;
}

- (id)wallpaperThumbnailDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  id v4 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperThumbnailURLForVariant:a3 wallpaperMode:a4];
  if (v4)
  {
    char v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:1 error:0];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)wallpaperOriginalImageForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  id v4 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalImageURLForVariant:a3 wallpaperMode:a4];
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F42A80];
    v7 = [v4 path];
    v8 = [v6 imageWithContentsOfCPBitmapFile:v7 flags:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDictionary)directoryCreationAttributes
{
  return 0;
}

- (void)createDirectory
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BC4B3000, v0, v1, "Error creating wallpaper directory at location '%{public}@': %{public}@");
}

- (void)didWriteFileToURL:(id)a3
{
}

- (BOOL)setWallpaperImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8 = a3;
  if (!__hasEnoughFreeSpaceToSetWallpaper()
    || ([(PBUIWallpaperDirectoryDataStore *)self createDirectory], a4 == -1))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperImageURLForVariant:a4 wallpaperMode:a5];
    id v10 = [v9 path];
    if (v10)
    {
      if (([v8 writeToCPBitmapFile:v10 flags:1] & 1) != 0
        || (BOOL v11 = 0, [v8 writeToCPBitmapFile:v10 flags:0]))
      {
        [(PBUIWallpaperDirectoryDataStore *)self didWriteFileToURL:v9];
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (BOOL)setWallpaperOriginalImage:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8 = a3;
  if (!__hasEnoughFreeSpaceToSetWallpaper()
    || ([(PBUIWallpaperDirectoryDataStore *)self createDirectory], a4 == -1))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalImageURLForVariant:a4 wallpaperMode:a5];
    id v10 = [v9 path];
    if (v10)
    {
      if (([v8 writeToCPBitmapFile:v10 flags:1] & 1) != 0
        || (BOOL v11 = 0, [v8 writeToCPBitmapFile:v10 flags:0]))
      {
        [(PBUIWallpaperDirectoryDataStore *)self didWriteFileToURL:v9];
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (BOOL)setWallpaperThumbnailData:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4 != -1)
  {
    uint64_t v9 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperThumbnailURLForVariant:a4 wallpaperMode:a5];
    if (v9)
    {
      id v16 = 0;
      int v10 = [v8 writeToURL:v9 options:268435457 error:&v16];
      id v11 = v16;
      if (v10)
      {
        [(PBUIWallpaperDirectoryDataStore *)self didWriteFileToURL:v9];
        BOOL v12 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      id v11 = 0;
    }
    v13 = PBUILogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFArrayRef v14 = PBUIStringForWallpaperVariant(a4);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_impl(&dword_1BC4B3000, v13, OS_LOG_TYPE_INFO, "Error writing thumbnail for variant %{public}@ to disk at URL '%{public}@': %{public}@", buf, 0x20u);
    }
    BOOL v12 = 0;
    goto LABEL_10;
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)moveWallpaperImageDataTypes:(unint64_t)a3 fromVariant:(int64_t)a4 toVariant:(int64_t)a5
{
  char v7 = a3;
  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  for (uint64_t i = 0; i != 4; ++i)
  {
    if (v7)
    {
      int v10 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperImageURLForVariant:a4 wallpaperMode:i];
      uint64_t v11 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperImageURLForVariant:a5 wallpaperMode:i];
      BOOL v12 = (void *)v11;
      if (v10 && v11) {
        [v19 moveItemAtURL:v10 toURL:v11 error:0];
      }

      if ((v7 & 4) == 0)
      {
LABEL_4:
        if ((v7 & 2) == 0) {
          continue;
        }
LABEL_14:
        id v16 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalImageURLForVariant:a4 wallpaperMode:i];
        uint64_t v17 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalImageURLForVariant:a5 wallpaperMode:i];
        uint64_t v18 = (void *)v17;
        if (v16 && v17) {
          [v19 moveItemAtURL:v16 toURL:v17 error:0];
        }

        continue;
      }
    }
    else if ((v7 & 4) == 0)
    {
      goto LABEL_4;
    }
    v13 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperThumbnailURLForVariant:a4 wallpaperMode:i];
    uint64_t v14 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperThumbnailURLForVariant:a5 wallpaperMode:i];
    id v15 = (void *)v14;
    if (v13 && v14) {
      [v19 moveItemAtURL:v13 toURL:v14 error:0];
    }

    if ((v7 & 2) != 0) {
      goto LABEL_14;
    }
  }
}

- (void)removeWallpaperImageDataTypes:(unint64_t)a3 forVariants:(int64_t)a4
{
  char v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__PBUIWallpaperDirectoryDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke;
  v19[3] = &unk_1E62B3010;
  unint64_t v21 = a3;
  v19[4] = self;
  id v8 = v7;
  id v20 = v8;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v19);
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "removeItemAtURL:error:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), 0, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v22 count:16];
    }
    while (v12);
  }
}

void __77__PBUIWallpaperDirectoryDataStore_removeWallpaperImageDataTypes_forVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) wallpaperImageURLForVariant:a2 wallpaperMode:i];
      if (v6) {
        [*(id *)(a1 + 40) addObject:v6];
      }

      uint64_t v5 = *(void *)(a1 + 48);
      if ((v5 & 2) == 0)
      {
LABEL_4:
        if ((v5 & 4) == 0) {
          continue;
        }
LABEL_12:
        id v8 = [*(id *)(a1 + 32) wallpaperThumbnailURLForVariant:a2 wallpaperMode:i];
        if (v8) {
          [*(id *)(a1 + 40) addObject:v8];
        }

        continue;
      }
    }
    else if ((v5 & 2) == 0)
    {
      goto LABEL_4;
    }
    id v7 = [*(id *)(a1 + 32) wallpaperOriginalImageURLForVariant:a2 wallpaperMode:i];
    if (v7) {
      [*(id *)(a1 + 40) addObject:v7];
    }

    if ((*(void *)(a1 + 48) & 4) != 0) {
      goto LABEL_12;
    }
  }
}

- (BOOL)supportsWallpaperImageHashDataStorage
{
  return 0;
}

- (BOOL)setWallpaperImageHashData:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  return 0;
}

- (id)wallpaperImageHashDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  return 0;
}

- (id)wallpaperVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v6 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
  id v7 = __wallpaperVideoFilename(a3, a4);
  id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];

  return v8;
}

- (id)wallpaperOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  uint64_t v6 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
  id v7 = __wallpaperOriginalVideoFilename(a3, a4);
  id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];

  return v8;
}

- (id)verifiedVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  id v7 = -[PBUIWallpaperDirectoryDataStore wallpaperVideoURLForVariant:wallpaperMode:](self, "wallpaperVideoURLForVariant:wallpaperMode:");
  if (([v7 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v8 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalVideoURLForVariant:a3 wallpaperMode:a4];
    id v9 = 0;
    if ([v8 checkResourceIsReachableAndReturnError:0]) {
      id v9 = v8;
    }

    id v7 = v9;
  }
  return v7;
}

- (id)verifiedOriginalVideoURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  char v4 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalVideoURLForVariant:a3 wallpaperMode:a4];
  if (([v4 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {

    char v4 = 0;
  }
  return v4;
}

- (BOOL)copyVideoAtURL:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqual:v7])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    [(PBUIWallpaperDirectoryDataStore *)self createDirectory];
    uint64_t v9 = [MEMORY[0x1E4F166C8] assetWithURL:v6];
    id v10 = (void *)v9;
    LOBYTE(v8) = 0;
    if (v7 && v9)
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v11 removeItemAtURL:v7 error:0];
      id v15 = 0;
      int v8 = [v11 copyItemAtURL:v6 toURL:v7 error:&v15];
      id v12 = v15;
      if (v8)
      {
        [(PBUIWallpaperDirectoryDataStore *)self didWriteFileToURL:v7];
      }
      else
      {
        uint64_t v13 = PBUILogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[PBUIWallpaperDirectoryDataStore copyVideoAtURL:toURL:]((uint64_t)v7, v12, v13);
        }
      }
    }
  }
  return v8;
}

- (BOOL)setVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperVideoURLForVariant:a4 wallpaperMode:a5];
  LOBYTE(a4) = [(PBUIWallpaperDirectoryDataStore *)self copyVideoAtURL:v8 toURL:v9];

  return a4;
}

- (BOOL)setOriginalVideoURL:(id)a3 forVariant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalVideoURLForVariant:a4 wallpaperMode:a5];
  LOBYTE(a4) = [(PBUIWallpaperDirectoryDataStore *)self copyVideoAtURL:v8 toURL:v9];

  return a4;
}

- (void)removeVideoForVariant:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = 0;
  id v7 = 0;
  *(void *)&long long v8 = 138543362;
  long long v16 = v8;
  do
  {
    uint64_t v9 = -[PBUIWallpaperDirectoryDataStore wallpaperVideoURLForVariant:wallpaperMode:](self, "wallpaperVideoURLForVariant:wallpaperMode:", a3, v6, v16);
    if (!v9
      || (id v18 = v7,
          char v10 = [v5 removeItemAtURL:v9 error:&v18],
          id v11 = v18,
          v7,
          id v7 = v11,
          (v10 & 1) == 0))
    {
      if ((objc_msgSend(v7, "pbui_isFileNotFoundError") & 1) == 0)
      {
        id v12 = PBUILogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v16;
          id v20 = v7;
          _os_log_error_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_ERROR, "Error removing video file: %{public}@", buf, 0xCu);
        }
      }
    }

    uint64_t v13 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOriginalVideoURLForVariant:a3 wallpaperMode:v6];
    if (v13)
    {
      id v17 = 0;
      char v14 = [v5 removeItemAtURL:v13 error:&v17];
      id v7 = v17;
      if (v14) {
        goto LABEL_16;
      }
    }
    else
    {
      id v7 = 0;
    }
    if ((objc_msgSend(v7, "pbui_isFileNotFoundError") & 1) == 0)
    {
      id v15 = PBUILogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v16;
        id v20 = v7;
        _os_log_error_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_ERROR, "Error removing original video file: %{public}@", buf, 0xCu);
      }
    }
LABEL_16:

    ++v6;
  }
  while (v6 != 4);
}

- (id)proceduralWallpaperInfoForVariant:(int64_t)a3
{
  return 0;
}

- (BOOL)setProceduralWallpaperInfo:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (id)wallpaperOptionsURLForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  if (a3 == 1)
  {
    uint64_t v5 = @"HomeWallpaperOptions";
  }
  else
  {
    if (a3) {
      goto LABEL_9;
    }
    uint64_t v5 = @"LockWallpaperOptions";
  }
  if (a4 == 2)
  {
    uint64_t v6 = PBUIStringForWallpaperMode(2uLL);
    uint64_t v5 = [(__CFString *)v5 stringByAppendingString:v6];
  }
  id v7 = [(__CFString *)v5 stringByAppendingString:@".plist"];

  if (v7)
  {
    long long v8 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
    uint64_t v9 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];

    goto LABEL_10;
  }
LABEL_9:
  uint64_t v9 = 0;
LABEL_10:
  return v9;
}

- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  if ([(PBUIWallpaperDirectoryDataStore *)self supportsWallpaperOptions])
  {
    id v7 = [(PBUIWallpaperDirectoryDataStore *)self wallpaperOptionsURLForVariant:a3 wallpaperMode:a4];
    if (v7) {
      long long v8 = [[PBUIWallpaperOptions alloc] initWithContentsOfURL:v7];
    }
    else {
      long long v8 = 0;
    }
  }
  else
  {
    long long v8 = 0;
  }
  return v8;
}

- (BOOL)setWallpaperOptions:(id)a3 forVariants:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  char v6 = a4;
  id v8 = a3;
  if ([(PBUIWallpaperDirectoryDataStore *)self supportsWallpaperOptions])
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__PBUIWallpaperDirectoryDataStore_setWallpaperOptions_forVariants_wallpaperMode___block_invoke;
    v11[3] = &unk_1E62B3038;
    v11[4] = self;
    int64_t v14 = a5;
    id v12 = v8;
    uint64_t v13 = &v15;
    PBUIWallpaperEnumerateVariantsForLocations(v6, v11);
    BOOL v9 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __81__PBUIWallpaperDirectoryDataStore_setWallpaperOptions_forVariants_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) wallpaperOptionsURLForVariant:a2 wallpaperMode:*(void *)(a1 + 56)];
  if (!v3 || ([*(id *)(a1 + 40) writeToURL:v3 error:0] & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return MEMORY[0x1F41817F8]();
}

- (void)removeWallpaperOptionsForVariants:(int64_t)a3
{
  char v3 = a3;
  if ([(PBUIWallpaperDirectoryDataStore *)self supportsWallpaperOptions])
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__PBUIWallpaperDirectoryDataStore_removeWallpaperOptionsForVariants___block_invoke;
    v7[3] = &unk_1E62B2C88;
    v7[4] = self;
    id v8 = v5;
    id v6 = v5;
    PBUIWallpaperEnumerateVariantsForLocations(v3, v7);
  }
}

void __69__PBUIWallpaperDirectoryDataStore_removeWallpaperOptionsForVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v5 = [*(id *)(a1 + 32) wallpaperOptionsURLForVariant:a2 wallpaperMode:i];
    if (v5) {
      [*(id *)(a1 + 40) removeItemAtURL:v5 error:0];
    }
  }
}

- (id)wallpaperColorForVariant:(int64_t)a3
{
  return 0;
}

- (id)wallpaperColorNameForVariant:(int64_t)a3
{
  return 0;
}

- (BOOL)setWallpaperColor:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (BOOL)setWallpaperColorName:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (id)wallpaperGradientForVariant:(int64_t)a3
{
  return 0;
}

- (BOOL)setWallpaperGradient:(id)a3 forVariants:(int64_t)a4
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperDirectoryDataStore *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v3 = [(PBUIWallpaperDirectoryDataStore *)self descriptionBuilderWithMultilinePrefix:a3];
  char v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = [(PBUIWallpaperDirectoryDataStore *)self directoryURL];
  id v6 = (id)[v4 appendObject:v5 withName:@"directoryURL"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIWallpaperDirectoryDataStore *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (BOOL)supportsWallpaperOptions
{
  return self->_supportsWallpaperOptions;
}

- (void)setSupportsWallpaperOptions:(BOOL)a3
{
  self->_supportsWallpaperOptions = a3;
}

- (void).cxx_destruct
{
}

void __42__PBUIWallpaperDirectoryDataStore_cleanup__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BC4B3000, v0, v1, "Unable to read wallpaper directory URL %{public}@: %{public}@");
}

- (void)wallpaperImageForVariant:(uint64_t)a1 wallpaperMode:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_DEBUG, "Error reading wallpaper file data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)wallpaperImageForVariant:(uint64_t *)a1 wallpaperMode:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_ERROR, "Error deserializing wallpaper image: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)wallpaperImageForVariant:(void *)a1 wallpaperMode:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = [a1 length];
  __int16 v6 = 2048;
  id v7 = a1;
  _os_log_debug_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_DEBUG, "Wallpaper file data length: %lu (%p)", (uint8_t *)&v4, 0x16u);
}

- (void)copyVideoAtURL:(NSObject *)a3 toURL:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_1BC4B3000, a3, OS_LOG_TYPE_ERROR, "Error writing video file to '%{public}@': %{public}@", (uint8_t *)&v6, 0x16u);
}

@end