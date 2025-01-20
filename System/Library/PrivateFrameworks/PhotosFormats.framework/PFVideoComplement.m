@interface PFVideoComplement
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_retimedPTSForOriginalPTS:(SEL)a3 inAsset:(unint64_t)a4 error:(id)a5;
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertTime:(SEL)a3 fromAsset:(id *)a4 toAsset:(id)a5;
+ (BOOL)_enumerateV3MetadataInAsset:(id)a3 withBlock:(id)a4 error:(id *)a5;
+ (NSString)currentFormatVersion;
+ (unint64_t)_originalPTSForFrameAtTime:(id *)a3 inAsset:(id)a4 error:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalImageDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalVideoDuration;
- (BOOL)_getSourceFilePath:(id)a3 destinationFilePath:(id)a4 areOnSameVolume:(BOOL *)a5 volumeSupportsCloning:(BOOL *)a6;
- (BOOL)copyOrLinkPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)writeToBundleAtURL:(id)a3 error:(id *)a4;
- (NSString)imagePath;
- (NSString)originalPairingIdentifier;
- (NSString)pairingIdentifier;
- (NSString)videoPath;
- (PFVideoComplement)init;
- (PFVideoComplement)initWithBundleAtURL:(id)a3;
- (PFVideoComplement)initWithPathToVideo:(id)a3 pathToImage:(id)a4;
- (PFVideoComplement)initWithPathToVideo:(id)a3 pathToImage:(id)a4 imageDisplayTime:(id *)a5 pairingIdentifier:(id)a6;
- (PFVideoComplement)initWithPropertyList:(id)a3;
- (id)propertyListRepresentation;
- (int)numberOfFramesRecoveredWithError:(id *)a3;
- (void)_readMetadataIfNeeded;
@end

@implementation PFVideoComplement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_videoPath, 0);

  objc_storeStrong((id *)&self->_imagePath, 0);
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (NSString)videoPath
{
  return self->_videoPath;
}

- (BOOL)writeToBundleAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 1;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__9545;
  v51 = __Block_byref_object_dispose__9546;
  id v52 = 0;
  char v46 = 0;
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __46__PFVideoComplement_writeToBundleAtURL_error___block_invoke;
  v45[3] = &unk_1E5B2EBA0;
  v45[4] = &v53;
  v45[5] = &v47;
  v7 = (void (**)(void, void))MEMORY[0x1A6259AE0](v45);
  v8 = [(NSString *)self->_imagePath pathExtension];
  v9 = +[PFUniformTypeUtilities typeWithFilenameExtension:v8];

  if (*((unsigned char *)v54 + 24) && (!v9 || ([v9 conformsToType:*MEMORY[0x1E4F44400]] & 1) == 0)) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"UTType is not image at '%@'");
  }
  char v46 = 1;
  if (*((unsigned char *)v54 + 24) && ([v6 fileExistsAtPath:self->_imagePath isDirectory:&v46] & 1) == 0) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"no file exists at '%@'");
  }
  if (*((unsigned char *)v54 + 24) && v46) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"directory exists at '%@'");
  }
  v10 = [(NSString *)self->_videoPath pathExtension];
  v40 = +[PFUniformTypeUtilities typeWithFilenameExtension:v10];

  if (*((unsigned char *)v54 + 24) && (!v40 || ([v40 conformsToType:*MEMORY[0x1E4F44448]] & 1) == 0)) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"UTType is not movie at '%@'");
  }
  char v46 = 1;
  if (*((unsigned char *)v54 + 24) && ([v6 fileExistsAtPath:self->_videoPath isDirectory:&v46] & 1) == 0) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"no file exists at '%@'");
  }
  int v11 = *((unsigned __int8 *)v54 + 24);
  if (*((unsigned char *)v54 + 24) && v46)
  {
    ((void (**)(void, __CFString *))v7)[2](v7, @"directory exists at '%@'");
    int v11 = *((unsigned __int8 *)v54 + 24);
  }
  if (v11 && ([v5 isFileURL] & 1) == 0) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"destination is not a file url: '%@'");
  }
  if (*((unsigned char *)v54 + 24))
  {
    v12 = [v5 pathExtension];
    char v13 = [v12 isEqualToString:@"pvt"];

    if ((v13 & 1) == 0)
    {
      v37 = [v5 pathExtension];
      ((void (**)(void, __CFString *))v7)[2](v7, @"destination has extension '%@' but requires '%@'");
    }
  }
  v14 = [v5 path];
  if (*((unsigned char *)v54 + 24) && [v6 fileExistsAtPath:v14]) {
    ((void (**)(void, __CFString *))v7)[2](v7, @"destination already exists: '%@'");
  }
  v15 = v54;
  v38 = v9;
  if (*((unsigned char *)v54 + 24))
  {
    v16 = (id *)(v48 + 5);
    id obj = (id)v48[5];
    int v17 = [v6 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&obj];
    objc_storeStrong(v16, obj);
    v15 = v54;
  }
  else
  {
    int v17 = 0;
  }
  *((unsigned char *)v15 + 24) = v17;
  v18 = [v14 stringByAppendingPathComponent:@"metadata.plist"];
  v19 = v54;
  if (*((unsigned char *)v54 + 24))
  {
    BOOL v20 = [(NSDictionary *)self->_metadata writeToFile:v18 atomically:1];
    v19 = v54;
  }
  else
  {
    BOOL v20 = 0;
  }
  *((unsigned char *)v19 + 24) = v20;
  v21 = [(NSString *)self->_imagePath lastPathComponent];
  v22 = [v14 stringByAppendingPathComponent:v21];

  v23 = v54;
  if (*((unsigned char *)v54 + 24))
  {
    imagePath = self->_imagePath;
    v25 = (id *)(v48 + 5);
    id v43 = (id)v48[5];
    BOOL v26 = [(PFVideoComplement *)self copyOrLinkPath:imagePath toPath:v22 error:&v43];
    objc_storeStrong(v25, v43);
    v23 = v54;
  }
  else
  {
    BOOL v26 = 0;
  }
  *((unsigned char *)v23 + 24) = v26;
  v27 = [(NSString *)self->_videoPath lastPathComponent];
  v28 = [v14 stringByAppendingPathComponent:v27];

  if (!*((unsigned char *)v54 + 24))
  {
    *((unsigned char *)v54 + 24) = 0;
    if (!v17) {
      goto LABEL_46;
    }
LABEL_44:
    [v6 removeItemAtPath:v14 error:0];
    if (!*((unsigned char *)v54 + 24)) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  videoPath = self->_videoPath;
  v30 = (id *)(v48 + 5);
  id v42 = (id)v48[5];
  BOOL v31 = [(PFVideoComplement *)self copyOrLinkPath:videoPath toPath:v28 error:&v42];
  objc_storeStrong(v30, v42);
  *((unsigned char *)v54 + 24) = v31;
  if (((v31 | v17 ^ 1) & 1) == 0) {
    goto LABEL_44;
  }
  if (v31)
  {
LABEL_45:
    v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:1];
    uint64_t v33 = *MEMORY[0x1E4F1C658];
    v34 = (id *)(v48 + 5);
    id v41 = (id)v48[5];
    [v32 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v33 error:&v41];
    objc_storeStrong(v34, v41);
  }
LABEL_46:
  if (a4) {
    *a4 = (id) v48[5];
  }
  char v35 = *((unsigned char *)v54 + 24);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v35;
}

void __46__PFVideoComplement_writeToBundleAtURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  v10 = (objc_class *)NSString;
  id v11 = a2;
  v12 = (__CFString *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  char v13 = @"unknown reason";
  if (v12) {
    char v13 = v12;
  }
  v14 = v13;

  v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = *MEMORY[0x1E4F28568];
  v21[0] = v14;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  uint64_t v17 = [v15 errorWithDomain:@"com.apple.PhotosFormats" code:-1 userInfo:v16];
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

- (BOOL)_getSourceFilePath:(id)a3 destinationFilePath:(id)a4 areOnSameVolume:(BOOL *)a5 volumeSupportsCloning:(BOOL *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
  id v36 = 0;
  uint64_t v12 = *MEMORY[0x1E4F1C820];
  id v35 = 0;
  char v13 = [v11 getResourceValue:&v36 forKey:v12 error:&v35];
  id v14 = v36;
  id v15 = v35;
  if (v13)
  {
    v30 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0];
    [v30 URLByDeletingLastPathComponent];
    id v33 = 0;
    v29 = id v34 = 0;
    char v16 = [v29 getResourceValue:&v34 forKey:v12 error:&v33];
    id v17 = v34;
    id v18 = v33;

    if ((v16 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v10;
        __int16 v39 = 2112;
        id v40 = v18;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to query volume ID for %@: %@", buf, 0x16u);
      }
      BOOL v23 = 0;
      id v15 = v18;
      v25 = v29;
      v24 = v30;
      goto LABEL_17;
    }
    id v28 = v17;
    int v19 = [v14 isEqual:v17];
    BOOL v20 = v19;
    if (a6 && (*a6 = 0, v19))
    {
      id v32 = 0;
      uint64_t v21 = *MEMORY[0x1E4F1C8E8];
      id v31 = 0;
      char v27 = [v11 getResourceValue:&v32 forKey:v21 error:&v31];
      id v22 = v32;
      id v15 = v31;

      if ((v27 & 1) == 0)
      {
        v25 = v29;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v38 = v9;
          __int16 v39 = 2112;
          id v40 = v15;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to query cloning status for %@: %@", buf, 0x16u);
        }

        BOOL v23 = 0;
        v24 = v30;
        id v17 = v28;
        goto LABEL_17;
      }
      *a6 = [v22 BOOLValue];
    }
    else
    {
      id v15 = v18;
    }
    id v17 = v28;
    v25 = v29;
    if (a5) {
      *a5 = v20;
    }
    BOOL v23 = 1;
    v24 = v30;
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v38 = v9;
    __int16 v39 = 2112;
    id v40 = v15;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to query volume ID for %@: %@", buf, 0x16u);
  }
  BOOL v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)copyOrLinkPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v19 = 0;
  BOOL v11 = [(PFVideoComplement *)self _getSourceFilePath:v8 destinationFilePath:v9 areOnSameVolume:(char *)&v19 + 1 volumeSupportsCloning:&v19];
  id v12 = 0;
  if (v11
    && HIBYTE(v19)
    && !(_BYTE)v19
    && (id v18 = 0,
        char v13 = [v10 linkItemAtPath:v8 toPath:v9 error:&v18],
        id v12 = v18,
        (v13 & 1) != 0))
  {
    char v14 = 1;
  }
  else
  {
    id v15 = v12;
    id v17 = v12;
    char v14 = [v10 copyItemAtPath:v8 toPath:v9 error:&v17];
    id v12 = v17;

    if (a5 && (v14 & 1) == 0)
    {
      id v12 = v12;
      char v14 = 0;
      *a5 = v12;
    }
  }

  return v14;
}

- (id)propertyListRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  imagePath = self->_imagePath;
  if (imagePath) {
    [v3 setObject:imagePath forKeyedSubscript:@"PFVideoComplementImagePathKey"];
  }
  videoPath = self->_videoPath;
  if (videoPath) {
    [v4 setObject:videoPath forKeyedSubscript:@"PFVideoComplementVideoPathKey"];
  }
  [v4 setObject:self->_metadata forKeyedSubscript:@"PFVideoComplementMetadataKey"];

  return v4;
}

- (PFVideoComplement)initWithBundleAtURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 pathExtension];
  int v6 = [v5 isEqualToString:@"pvt"];

  if (v6)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [v7 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:5 errorHandler:0];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v25 = v4;
      BOOL v26 = self;
      int v27 = 0;
      int v31 = 0;
      int v29 = 0;
      uint64_t v12 = *(void *)v34;
      uint64_t v13 = *MEMORY[0x1E4F44400];
      uint64_t v30 = *MEMORY[0x1E4F44448];
      uint64_t v28 = *MEMORY[0x1E4F44488];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          id v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          char v16 = objc_msgSend(v15, "path", v25);
          if (v16)
          {
            id v17 = (void *)MEMORY[0x1E4F442D8];
            id v18 = [v15 pathExtension];
            __int16 v19 = [v17 typeWithFilenameExtension:v18];

            if (v19)
            {
              if ([v19 conformsToType:v13])
              {
                [v32 setObject:v16 forKeyedSubscript:@"PFVideoComplementImagePathKey"];
                int v31 = 1;
              }
              else if ([v19 conformsToType:v30])
              {
                [v32 setObject:v16 forKeyedSubscript:@"PFVideoComplementVideoPathKey"];
                int v29 = 1;
              }
              else if ([v19 conformsToType:v28])
              {
                BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v16];
                uint64_t v21 = v20;
                if (v20)
                {
                  id v22 = [v20 objectForKeyedSubscript:@"PFVideoComplementMetadataVersionKey"];
                  if ([v22 isEqualToString:@"1"])
                  {
                    [v32 setObject:v21 forKeyedSubscript:@"PFVideoComplementMetadataKey"];
                    int v27 = 1;
                  }
                }
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v11);

      if (v29 & v31 & v27)
      {
        self = [(PFVideoComplement *)v26 initWithPropertyList:v32];
        BOOL v23 = self;
      }
      else
      {
        BOOL v23 = 0;
        self = v26;
      }
      id v4 = v25;
    }
    else
    {

      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (PFVideoComplement)initWithPropertyList:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PFVideoComplement;
  id v5 = [(PFVideoComplement *)&v24 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"PFVideoComplementMetadataKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 objectForKeyedSubscript:@"PFVideoComplementMetadataVersionKey"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v7 = 0;
      }
      id v8 = [v6 objectForKeyedSubscript:@"PFVideoComplementMetadataPairidIdentifierKey"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v8 = 0;
      }
      id v9 = [v6 objectForKeyedSubscript:@"PFVideoComplementMetadataTimingInfoKey"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
      id v8 = 0;
      v7 = 0;
    }
    uint64_t v10 = @"1";
    if (v7) {
      uint64_t v10 = v7;
    }
    uint64_t v11 = v10;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = (id)[v6 mutableCopy];
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v13 = v12;
    char v14 = (void *)[(__CFString *)v11 copy];

    [v13 setObject:v14 forKeyedSubscript:@"PFVideoComplementMetadataVersionKey"];
    id v15 = (void *)[v9 copy];
    [v13 setObject:v15 forKeyedSubscript:@"PFVideoComplementMetadataTimingInfoKey"];

    char v16 = (void *)[v8 copy];
    [v13 setObject:v16 forKeyedSubscript:@"PFVideoComplementMetadataPairidIdentifierKey"];

    objc_storeStrong((id *)&v5->_metadata, v13);
    id v17 = [v4 objectForKeyedSubscript:@"PFVideoComplementImagePathKey"];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v17 copy];
        imagePath = v5->_imagePath;
        v5->_imagePath = (NSString *)v18;
      }
    }
    BOOL v20 = [v4 objectForKeyedSubscript:@"PFVideoComplementVideoPathKey"];
    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [v20 copy];
        videoPath = v5->_videoPath;
        v5->_videoPath = (NSString *)v21;
      }
    }
  }
  return v5;
}

- (PFVideoComplement)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"%@ not supported for %@: use initWithPropertyList: or initWithBundleAtURL:", v5, objc_opt_class() format];

  return 0;
}

- (int)numberOfFramesRecoveredWithError:(id *)a3
{
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  uint64_t v4 = (void *)MEMORY[0x1E4F16330];
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  int v6 = [(PFVideoComplement *)self videoPath];
  v7 = [v5 fileURLWithPath:v6];
  id v8 = [v4 assetWithURL:v7];

  if (!v8)
  {
    id v10 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = objc_opt_class();
  id v13 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PFVideoComplement_Convenience__numberOfFramesRecoveredWithError___block_invoke;
  v14[3] = &unk_1E5B2EBC8;
  v14[4] = &v15;
  [v9 _enumerateV3MetadataInAsset:v8 withBlock:v14 error:&v13];
  id v10 = v13;
  if (a3) {
LABEL_3:
  }
    *a3 = v10;
LABEL_4:
  int v11 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __67__PFVideoComplement_Convenience__numberOfFramesRecoveredWithError___block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) += *(unsigned __int8 *)(a2 + 58);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalImageDisplayTime
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PFVideoComplement *)self _readMetadataIfNeeded];
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_originalImageDisplayTime;
  return result;
}

- (NSString)originalPairingIdentifier
{
  [(PFVideoComplement *)self _readMetadataIfNeeded];
  originalPairingIdentifier = self->_originalPairingIdentifier;

  return originalPairingIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalVideoDuration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(PFVideoComplement *)self _readMetadataIfNeeded];
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_originalVideoDuration;
  return result;
}

- (void)_readMetadataIfNeeded
{
  if (!self->_didReadOriginalMetadata)
  {
    self->_didReadOriginalMetadata = 1;
    id v3 = PFVideoComplementMetadataForVideoAtPath((uint64_t)self->_videoPath, 0);
    uint64_t v4 = [v3 pairingIdentifier];
    originalPairingIdentifier = self->_originalPairingIdentifier;
    self->_originalPairingIdentifier = v4;

    p_originalVideoDuration = &self->_originalVideoDuration;
    if (v3)
    {
      [v3 videoDuration];
      *(_OWORD *)&p_originalVideoDuration->value = v7;
      self->_originalVideoDuration.epoch = v8;
      [v3 imageDisplayTime];
    }
    else
    {
      p_originalVideoDuration->value = 0;
      *(void *)&self->_originalVideoDuration.timescale = 0;
      self->_originalVideoDuration.epoch = 0;
      long long v7 = 0uLL;
      int64_t v8 = 0;
    }
    *(_OWORD *)&self->_originalImageDisplayTime.value = v7;
    self->_originalImageDisplayTime.epoch = v8;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  id v5 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"PFVideoComplementMetadataTimingInfoKey"];

  if (v5) {
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v7, (CFDictionaryRef)v5);
  }
  else {
    result = [(PFVideoComplement *)self originalImageDisplayTime];
  }
  *(CMTime *)retstr = v7;
  return result;
}

- (NSString)pairingIdentifier
{
  id v3 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"PFVideoComplementMetadataPairidIdentifierKey"];
  if (!v3)
  {
    id v3 = [(PFVideoComplement *)self originalPairingIdentifier];
  }

  return (NSString *)v3;
}

- (PFVideoComplement)initWithPathToVideo:(id)a3 pathToImage:(id)a4 imageDisplayTime:(id *)a5 pairingIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a5->var2)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a5;
    CFDictionaryRef v14 = CMTimeCopyAsDictionary((CMTime *)&v20, 0);
    if (v14)
    {
      CFDictionaryRef v15 = v14;
      [v13 setObject:v14 forKeyedSubscript:@"PFVideoComplementMetadataTimingInfoKey"];
      CFRelease(v15);
    }
  }
  if (v12) {
    [v13 setObject:v12 forKeyedSubscript:@"PFVideoComplementMetadataPairidIdentifierKey"];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v17 = v16;
  if (v10) {
    [v16 setObject:v10 forKeyedSubscript:@"PFVideoComplementVideoPathKey"];
  }
  if (v11) {
    [v17 setObject:v11 forKeyedSubscript:@"PFVideoComplementImagePathKey"];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:@"PFVideoComplementMetadataKey"];
  }
  int v18 = [(PFVideoComplement *)self initWithPropertyList:v17];

  return v18;
}

- (PFVideoComplement)initWithPathToVideo:(id)a3 pathToImage:(id)a4
{
  long long v5 = *MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [(PFVideoComplement *)self initWithPathToVideo:a3 pathToImage:a4 imageDisplayTime:&v5 pairingIdentifier:0];
}

+ (BOOL)_enumerateV3MetadataInAsset:(id)a3 withBlock:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v53 = 0;
  if (!v7)
  {
    id v13 = 0;
    if (!a5) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  id v52 = 0;
  id v9 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v7 error:&v52];
  id v10 = v52;
  id v11 = v10;
  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v9 == 0;
  }
  if (!v12)
  {
    id v43 = v8;
    id v44 = v10;
    id v46 = v7;
    uint64_t v47 = v9;
    v45 = a5;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    CFDictionaryRef v14 = [v7 tracks];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v55 count:16];
    if (!v15)
    {
LABEL_27:

LABEL_38:
      id v7 = v46;
      id v9 = v47;
      id v11 = v44;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)count = 138412290;
        *(void *)&count[4] = v46;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to find metadata track for AVAsset %@", count, 0xCu);
      }
      id v13 = 0;
      id v8 = v43;
      goto LABEL_48;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    uint64_t v18 = *MEMORY[0x1E4F52790];
LABEL_15:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v49 != v17) {
        objc_enumerationMutation(v14);
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *(void **)(*((void *)&v48 + 1) + 8 * v19);
      uint64_t v21 = [v20 formatDescriptions];
      if ([v21 count] == 1
        && ([v21 firstObject], id v22 = objc_claimAutoreleasedReturnValue(), v22, v22)
        && CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)v22) == 1835365473
        && (CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v22),
            (BOOL v23 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_super v24 = v23;
        char v25 = [v23 containsObject:v18];

        if (v25)
        {
          id v26 = v20;

          if (!v26) {
            goto LABEL_38;
          }
          int v27 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v26 outputSettings:0];
          id v9 = v47;
          if ([v47 canAddOutput:v27])
          {
            [v47 addOutput:v27];
            uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F16390]) initWithAssetReaderTrackOutput:v27];
            id v8 = v43;
            if ([v47 startReading])
            {
              uint64_t v29 = [v28 nextTimedMetadataGroup];
              if (v29)
              {
                uint64_t v30 = (void *)v29;
                int v31 = v27;
                id v32 = v26;
                do
                {
                  long long v33 = [v30 items];
                  long long v34 = [v33 firstObject];

                  *(void *)count = 0;
                  id v35 = [v34 dataValue];
                  [v35 bytes];
                  long long v36 = [v34 dataValue];
                  [v36 length];
                  FigLivePhotoMetadataComputeDeserializationSize();

                  v37 = malloc_type_calloc(*(size_t *)count, 1uLL, 0xA5227ED3uLL);
                  id v38 = [v34 dataValue];
                  [v38 bytes];
                  __int16 v39 = [v34 dataValue];
                  [v39 length];
                  FigLivePhotoMetadataDeserializeIntoBuffer();

                  if (*v37 >= 3u)
                  {
                    id v40 = (int32x4_t *)&v37[8 * v37[11]];
                    (*((void (**)(id, int32x4_t *, char *))v43 + 2))(v43, &v40[2 * vaddvq_s32(v40[3]) + 4], &v53);
                  }
                  free(v37);
                  uint64_t v41 = [v28 nextTimedMetadataGroup];

                  if (!v41) {
                    break;
                  }
                  uint64_t v30 = v41;
                }
                while (!v53);

                id v9 = v47;
                id v26 = v32;
                int v27 = v31;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)count = 0;
              _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to start reading from asset reader", count, 2u);
            }

            a5 = v45;
            id v7 = v46;
            id v11 = v44;
          }
          else
          {
            id v7 = v46;
            id v8 = v43;
            id v11 = v44;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)count = 0;
              _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to add output to asset reader", count, 2u);
            }
          }

LABEL_47:
          id v13 = 0;
          goto LABEL_48;
        }
      }
      else
      {
      }
      if (v16 == ++v19)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v55 count:16];
        if (v16) {
          goto LABEL_15;
        }
        goto LABEL_27;
      }
    }
  }
  if (!v10) {
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)count = 138412290;
    *(void *)&count[4] = v11;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to read from asset with error: %@", count, 0xCu);
  }
  id v13 = v11;
LABEL_48:

  if (a5) {
LABEL_49:
  }
    *a5 = v13;
LABEL_50:

  return 0;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_retimedPTSForOriginalPTS:(SEL)a3 inAsset:(unint64_t)a4 error:(id)a5
{
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PFVideoComplement_Convenience___retimedPTSForOriginalPTS_inAsset_error___block_invoke;
  v15[3] = &unk_1E5B2EC18;
  v15[5] = &v16;
  v15[6] = a4;
  v15[4] = &v20;
  [a2 _enumerateV3MetadataInAsset:v10 withBlock:v15 error:a6];
  uint64_t v11 = v17[3];
  if (v11)
  {
    uint64_t v12 = v21[3];
    if (v12)
    {
      CMTimeMake(&v14, v11 - v12, 1000000000);
      *(CMTime *)retstr = v14;
    }
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return result;
}

void *__74__PFVideoComplement_Convenience___retimedPTSForOriginalPTS_inAsset_error___block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(result[4] + 8);
  if (!*(void *)(v3 + 24)) {
    *(void *)(v3 + 24) = *(void *)(a2 + 40);
  }
  if (result[6] == *(void *)(a2 + 48))
  {
    *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(a2 + 40);
    *a3 = 1;
  }
  return result;
}

+ (unint64_t)_originalPTSForFrameAtTime:(id *)a3 inAsset:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PFVideoComplement_Convenience___originalPTSForFrameAtTime_inAsset_error___block_invoke;
  v11[3] = &unk_1E5B2EBF0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  v11[4] = v13;
  v11[5] = &v14;
  [a1 _enumerateV3MetadataInAsset:v8 withBlock:v11 error:a5];
  unint64_t v9 = v15[3];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __75__PFVideoComplement_Convenience___originalPTSForFrameAtTime_inAsset_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unint64_t v6 = *(void *)(a2 + 40);
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (!v7)
  {
    CMTime v8 = *(CMTime *)(a1 + 48);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6
                                                                + (unint64_t)(CMTimeGetSeconds(&v8) * 1000000000.0);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a2 + 48);
    unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  if (v7 < v6) {
    *a3 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a2 + 48);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertTime:(SEL)a3 fromAsset:(id *)a4 toAsset:(id)a5
{
  id v10 = a6;
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  uint64_t v11 = [a2 _originalPTSForFrameAtTime:&v13 inAsset:a5 error:0];
  if (v11)
  {
    [a2 _retimedPTSForOriginalPTS:v11 inAsset:v10 error:0];
    *retstr = v13;
  }

  return result;
}

+ (NSString)currentFormatVersion
{
  return (NSString *)@"1";
}

@end