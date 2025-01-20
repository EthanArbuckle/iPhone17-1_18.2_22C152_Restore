@interface NTKBasePhotoResourcesManifest
+ (id)manifestForResourceDirectory:(id)a3;
- (BOOL)_loadRawManifestAtURL:(id)a3;
- (BOOL)_validateImageListItem:(id)a3 withError:(id *)a4;
- (BOOL)didLoadRawManifest:(id)a3;
- (BOOL)resourceWithName:(id)a3 isValidMediaAssetOfType:(id)a4 withMinFileSize:(unint64_t)a5 maxFileSize:(unint64_t)a6;
- (BOOL)resourceWithNameIsValidImage:(id)a3;
- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4;
- (BOOL)validateManifestWithError:(id *)a3;
- (NSArray)imageList;
- (NSURL)resourceDirectoryURL;
- (id)_initWithResourceDirectoryURL:(id)a3;
- (unint64_t)maxCompatibleVersion;
- (unint64_t)maxNumberOfPhotos;
- (unint64_t)minCompatibleVersion;
- (unint64_t)version;
@end

@implementation NTKBasePhotoResourcesManifest

+ (id)manifestForResourceDirectory:(id)a3
{
  id v4 = a3;
  if (v4
    && ([MEMORY[0x1E4F1CB10] fileURLWithPath:v4],
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = [v5 URLByAppendingPathComponent:@"Images.plist"];
    v8 = (void *)[objc_alloc((Class)a1) _initWithResourceDirectoryURL:v6];
    if ([v8 _loadRawManifestAtURL:v7])
    {
      id v9 = v8;
    }
    else
    {
      v10 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:]();
      }

      id v9 = 0;
    }
  }
  else
  {
    v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:](v6);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_initWithResourceDirectoryURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKBasePhotoResourcesManifest;
  v5 = [(NTKBasePhotoResourcesManifest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    resourceDirectoryURL = v5->_resourceDirectoryURL;
    v5->_resourceDirectoryURL = (NSURL *)v6;
  }
  return v5;
}

- (BOOL)_loadRawManifestAtURL:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:");
    v5 = v4;
    if (!v4)
    {
      uint64_t v6 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:]((uint64_t)self);
      }
      BOOL v8 = 0;
      goto LABEL_21;
    }
    uint64_t v6 = [v4 objectForKeyedSubscript:@"version"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      self->_version = [v6 unsignedIntegerValue];
      v7 = [v5 objectForKeyedSubscript:@"imageList"];
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&self->_imageList, v7);
          BOOL v8 = [(NTKBasePhotoResourcesManifest *)self didLoadRawManifest:v5];
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
      }
      objc_super v9 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:].cold.4();
      }
    }
    else
    {
      v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:]();
      }
    }
    BOOL v8 = 0;
    goto LABEL_20;
  }
  v5 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:]((uint64_t)self);
  }
  BOOL v8 = 0;
LABEL_22:

  return v8;
}

- (BOOL)_validateImageListItem:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v7 = [(NTKBasePhotoResourcesManifest *)self validateImageListItem:v6 withError:a4];
  }
  else
  {
    BOOL v8 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NTKBasePhotoResourcesManifest _validateImageListItem:withError:]((uint64_t)self);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateManifestWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t version = self->_version;
  if (version < [(NTKBasePhotoResourcesManifest *)self minCompatibleVersion]
    || (unint64_t v6 = self->_version, v6 > [(NTKBasePhotoResourcesManifest *)self maxCompatibleVersion]))
  {
    BOOL v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NTKBasePhotoResourcesManifest validateManifestWithError:]();
    }

    if (a3)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F28C58];
      objc_super v9 = @"com.apple.nanotimekit.resourceDirectory";
      uint64_t v10 = 2004;
LABEL_7:
      [v8 errorWithDomain:v9 code:v10 userInfo:0];
      BOOL v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v11;
    }
    return 0;
  }
  if (![(NSArray *)self->_imageList count])
  {
    v14 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[NTKBasePhotoResourcesManifest validateManifestWithError:]((uint64_t)self);
    }

    if (a3)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F28C58];
      objc_super v9 = @"com.apple.nanotimekit.photos";
      uint64_t v10 = 1006;
      goto LABEL_7;
    }
    return 0;
  }
  unint64_t v12 = [(NSArray *)self->_imageList count];
  if (v12 > [(NTKBasePhotoResourcesManifest *)self maxNumberOfPhotos])
  {
    v13 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NTKBasePhotoResourcesManifest validateManifestWithError:]();
    }

    if (a3)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F28C58];
      objc_super v9 = @"com.apple.nanotimekit.photos";
      uint64_t v10 = 1007;
      goto LABEL_7;
    }
    return 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = self->_imageList;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        if (!-[NTKBasePhotoResourcesManifest _validateImageListItem:withError:](self, "_validateImageListItem:withError:", *(void *)(*((void *)&v21 + 1) + 8 * i), a3, (void)v21))
        {
          if (a3)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.resourceDirectory" code:2003 userInfo:0];
            BOOL v11 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v11 = 0;
          }
          goto LABEL_32;
        }
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_32:

  return v11;
}

- (BOOL)resourceWithName:(id)a3 isValidMediaAssetOfType:(id)a4 withMinFileSize:(unint64_t)a5 maxFileSize:(unint64_t)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (([v10 hasPrefix:@"~"] & 1) == 0
    && ([v10 hasPrefix:@"."] & 1) == 0
    && ![v10 containsString:@"/"])
  {
    v15 = [v10 pathExtension];
    v16 = [v15 lowercaseString];
    char v17 = [v11 containsObject:v16];

    if ((v17 & 1) == 0)
    {
      unint64_t v12 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:]();
      }
      goto LABEL_6;
    }
    resourceDirectoryURL = self->_resourceDirectoryURL;
    p_resourceDirectoryURL = &self->_resourceDirectoryURL;
    v20 = [(NSURL *)resourceDirectoryURL URLByAppendingPathComponent:v10 isDirectory:0];
    unint64_t v12 = [v20 URLByResolvingSymlinksInPath];

    long long v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v22 = [v12 path];
    long long v23 = [v21 attributesOfItemAtPath:v22 error:0];

    if (!v23)
    {
      v31 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:]();
      }
      goto LABEL_22;
    }
    uint64_t v24 = *MEMORY[0x1E4F283B8];
    uint64_t v25 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F283B8]];
    if (!v25) {
      goto LABEL_12;
    }
    uint64_t v26 = (void *)v25;
    v27 = [v23 objectForKeyedSubscript:v24];
    uint64_t v37 = v24;
    v28 = v23;
    v29 = (void *)*MEMORY[0x1E4F283C8];

    BOOL v30 = v27 == v29;
    long long v23 = v28;
    uint64_t v24 = v37;
    if (v30)
    {
      if ([v23 fileSize] >= a5 && objc_msgSend(v23, "fileSize") <= a6)
      {
        BOOL v13 = 1;
        goto LABEL_23;
      }
      v31 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = [(NSURL *)*p_resourceDirectoryURL lastPathComponent];
        uint64_t v35 = [v23 fileSize];
        v36 = [v12 path];
        *(_DWORD *)buf = 138412802;
        v39 = v32;
        __int16 v40 = 2048;
        uint64_t v41 = v35;
        __int16 v42 = 2112;
        v43 = v36;
        _os_log_error_impl(&dword_1BC5A9000, v31, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected file size %lu at path '%@'", buf, 0x20u);

        goto LABEL_14;
      }
    }
    else
    {
LABEL_12:
      v31 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = [(NSURL *)*p_resourceDirectoryURL lastPathComponent];
        v33 = [v23 objectForKeyedSubscript:v24];
        v34 = [v12 path];
        *(_DWORD *)buf = 138412802;
        v39 = v32;
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)v33;
        __int16 v42 = 2112;
        v43 = v34;
        _os_log_error_impl(&dword_1BC5A9000, v31, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected file type '%@' for asset at path: '%@'", buf, 0x20u);

LABEL_14:
      }
    }
LABEL_22:

    BOOL v13 = 0;
LABEL_23:

    goto LABEL_7;
  }
  unint64_t v12 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:]();
  }
LABEL_6:
  BOOL v13 = 0;
LABEL_7:

  return v13;
}

- (BOOL)resourceWithNameIsValidImage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSURL *)self->_resourceDirectoryURL URLByAppendingPathComponent:a3 isDirectory:0];
  v5 = (void *)MEMORY[0x1E4FB1818];
  unint64_t v6 = [v4 path];
  BOOL v7 = [v5 imageWithContentsOfFile:v6];

  [v7 size];
  if (v8 >= 1.0
    && ([v7 size], v9 >= 1.0)
    && ([v7 size], v10 <= 4096.0)
    && ([v7 size], v11 <= 4096.0))
  {
    BOOL v13 = 1;
  }
  else
  {
    unint64_t v12 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = [(NSURL *)self->_resourceDirectoryURL lastPathComponent];
      [v7 size];
      v16 = NSStringFromCGSize(v25);
      char v17 = [v4 path];
      int v18 = 138412802;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      long long v21 = v16;
      __int16 v22 = 2112;
      long long v23 = v17;
      _os_log_error_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected image dimensions '%@' at path '%@'", (uint8_t *)&v18, 0x20u);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)didLoadRawManifest:(id)a3
{
  return 1;
}

- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4
{
  return 0;
}

- (unint64_t)minCompatibleVersion
{
  return 0;
}

- (unint64_t)maxCompatibleVersion
{
  return 0;
}

- (unint64_t)maxNumberOfPhotos
{
  return 0;
}

- (NSURL)resourceDirectoryURL
{
  return self->_resourceDirectoryURL;
}

- (NSArray)imageList
{
  return self->_imageList;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageList, 0);
  objc_storeStrong((id *)&self->_resourceDirectoryURL, 0);
}

+ (void)manifestForResourceDirectory:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "[SANITIZER:nil]: Unable to load manifest, resource directory is nil.", v1, 2u);
}

+ (void)manifestForResourceDirectory:.cold.2()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 lastPathComponent];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: Failed to load manifest: %@.", v4, v5, v6, v7, v8);
}

- (void)_loadRawManifestAtURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_3_2(a1) lastPathComponent];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: manifest URL is nil.", v4, v5, v6, v7, v8);
}

- (void)_loadRawManifestAtURL:(uint64_t)a1 .cold.2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_3_2(a1) lastPathComponent];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: unable to decode manifest.", v4, v5, v6, v7, v8);
}

- (void)_loadRawManifestAtURL:.cold.3()
{
  OUTLINED_FUNCTION_9();
  v1 = [(id)OUTLINED_FUNCTION_3_2(v0) lastPathComponent];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: invalid version: %@", v4, v5, v6, v7, v8);
}

- (void)_loadRawManifestAtURL:.cold.4()
{
  OUTLINED_FUNCTION_9();
  v1 = [*(id *)(v0 + 8) lastPathComponent];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_11(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: unexpected value: '%@' for key: %@. ", v4, v5, v6, v7, v8);
}

- (void)_validateImageListItem:(uint64_t)a1 withError:.cold.1(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_3_2(a1) lastPathComponent];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: unexpected image list item data", v4, v5, v6, v7, v8);
}

- (void)validateManifestWithError:.cold.1()
{
  OUTLINED_FUNCTION_9();
  v1 = [(id)OUTLINED_FUNCTION_3_2(v0) lastPathComponent];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: incompatible version: %lu.", v4, v5, v6, v7, v8);
}

- (void)validateManifestWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  v1 = [(id)OUTLINED_FUNCTION_3_2(a1) lastPathComponent];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: invalid manifest. Image list is empty.", v4, v5, v6, v7, v8);
}

- (void)validateManifestWithError:.cold.3()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = v1;
  uint64_t v3 = [v1[1] lastPathComponent];
  [*v0 count];
  [v2 maxNumberOfPhotos];
  OUTLINED_FUNCTION_1_11(&dword_1BC5A9000, v4, v5, "[SANITIZER:%@]: invalid manifest. Too many photos: %lu (expecting: %lu)", v6, v7, v8, v9, 2u);
}

- (void)resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:.cold.1()
{
  OUTLINED_FUNCTION_9();
  v1 = [(id)OUTLINED_FUNCTION_3_2(v0) lastPathComponent];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: invalid filename '%@'", v4, v5, v6, v7, v8);
}

- (void)resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:.cold.2()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = [*v1 lastPathComponent];
  uint64_t v9 = [v0 path];
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v3, v4, "[SANITIZER:%@]: unable to open asset at path: '%@'", v5, v6, v7, v8, 2u);
}

- (void)resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:.cold.3()
{
  OUTLINED_FUNCTION_9();
  v1 = [(id)OUTLINED_FUNCTION_3_2(v0) lastPathComponent];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "[SANITIZER:%@]: invalid extension '%@'", v4, v5, v6, v7, v8);
}

@end