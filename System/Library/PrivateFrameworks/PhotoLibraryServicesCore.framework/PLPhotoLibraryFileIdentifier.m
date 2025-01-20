@interface PLPhotoLibraryFileIdentifier
+ (BOOL)isValidFileIdentifierParametersForUUID:(id)a3 utiString:(id)a4 originalFilename:(id)a5;
+ (BOOL)isValidOriginalURL:(id)a3;
+ (id)fileIdentifierForValidOriginalURL:(id)a3;
+ (id)fileIdentifierForValidOriginalURL:(id)a3 originalsDirectoryName:(id)a4;
+ (id)uuidFromURL:(id)a3;
- (BOOL)isData;
- (NSString)originalFilename;
- (NSString)uti;
- (NSString)uuid;
- (PLPhotoLibraryFileIdentifier)init;
- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 recipeID:(unsigned int)a7;
- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 resourceType:(unsigned int)a7;
- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 resourceType:(unsigned int)a7 recipeID:(unsigned int)a8 originalFilename:(id)a9;
- (id)description;
- (id)extension;
- (unsigned)bundleScope;
- (unsigned)recipeId;
- (unsigned)resourceType;
- (unsigned)resourceVersion;
- (void)setOriginalFilename:(id)a3;
- (void)setUti:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PLPhotoLibraryFileIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (BOOL)isData
{
  return self->_isData;
}

- (unsigned)recipeId
{
  return self->_recipeId;
}

- (unsigned)resourceVersion
{
  return self->_resourceVersion;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (void)setOriginalFilename:(id)a3
{
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setUti:(id)a3
{
}

- (NSString)uti
{
  return self->_uti;
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)extension
{
  v3 = [(PLPhotoLibraryFileIdentifier *)self uti];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    if ([(PLPhotoLibraryFileIdentifier *)self resourceType] == 5
      && [v4 isEqual:*MEMORY[0x1E4F44378]])
    {
      id v5 = (id)*MEMORY[0x1E4F8D2F0];
LABEL_7:
      id v6 = v5;
      goto LABEL_14;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = [MEMORY[0x1E4F8CDF8] preferredOrFallbackFilenameExtensionForType:v4 fallbackIdentifier:v3];
  if (v5) {
    goto LABEL_7;
  }
  v7 = [(PLPhotoLibraryFileIdentifier *)self originalFilename];
  v8 = [v7 pathExtension];
  v9 = [v8 lowercaseString];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v9];
    id v6 = [MEMORY[0x1E4F8CDF8] preferredOrFallbackFilenameExtensionForType:v10 fallbackIdentifier:0];
    if (!v6) {
      id v6 = v9;
    }
  }
  else
  {
    id v6 = 0;
  }

LABEL_14:
  return v6;
}

- (id)description
{
  v15 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(PLPhotoLibraryFileIdentifier *)self uuid];
  unsigned int v6 = [(PLPhotoLibraryFileIdentifier *)self bundleScope];
  uti = self->_uti;
  uint64_t v8 = [(PLPhotoLibraryFileIdentifier *)self resourceVersion];
  uint64_t v9 = [(PLPhotoLibraryFileIdentifier *)self resourceType];
  uint64_t v10 = [(PLPhotoLibraryFileIdentifier *)self recipeId] >> 16;
  uint64_t v11 = (unsigned __int16)[(PLPhotoLibraryFileIdentifier *)self recipeId] >> 1;
  v12 = [(PLPhotoLibraryFileIdentifier *)self originalFilename];
  v13 = [v15 stringWithFormat:@"%@ (%p), uuid=%@, bundleScope=%d uti=%@, resourceVersion=%d, resourceType=%d, recipeClassID=%d, recipeVarationID=%d originalFilename=%@", v4, self, v5, v6, uti, v8, v9, v10, v11, v12];

  return v13;
}

- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 resourceType:(unsigned int)a7 recipeID:(unsigned int)a8 originalFilename:(id)a9
{
  id v15 = a3;
  unint64_t v16 = (unint64_t)a5;
  unint64_t v17 = (unint64_t)a9;
  if (!v15)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLPhotoLibraryFileIdentifier.m", 45, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  if (!(v16 | v17))
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PLPhotoLibraryFileIdentifier.m" lineNumber:46 description:@"Either UTI or originalFilename must be non-nil"];
  }
  v26.receiver = self;
  v26.super_class = (Class)PLPhotoLibraryFileIdentifier;
  v18 = [(PLPhotoLibraryFileIdentifier *)&v26 init];
  if (v18)
  {
    uint64_t v19 = [v15 uppercaseString];
    uuid = v18->_uuid;
    v18->_uuid = (NSString *)v19;

    v18->_bundleScope = a4;
    objc_storeStrong((id *)&v18->_uti, a5);
    v18->_resourceType = a7;
    v18->_resourceVersion = a6;
    v18->_recipeId = a8;
    objc_storeStrong((id *)&v18->_originalFilename, a9);
    if (v16)
    {
      v21 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v16];
      v18->_isData = [v21 conformsToType:*MEMORY[0x1E4F44378]];
    }
  }

  return v18;
}

- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 recipeID:(unsigned int)a7
{
  return [(PLPhotoLibraryFileIdentifier *)self initWithAssetUuid:a3 bundleScope:a4 uti:a5 resourceVersion:*(void *)&a6 resourceType:31 recipeID:*(void *)&a7 originalFilename:0];
}

- (PLPhotoLibraryFileIdentifier)initWithAssetUuid:(id)a3 bundleScope:(unsigned __int16)a4 uti:(id)a5 resourceVersion:(unsigned int)a6 resourceType:(unsigned int)a7
{
  return [(PLPhotoLibraryFileIdentifier *)self initWithAssetUuid:a3 bundleScope:a4 uti:a5 resourceVersion:*(void *)&a6 resourceType:*(void *)&a7 recipeID:0 originalFilename:0];
}

- (PLPhotoLibraryFileIdentifier)init
{
  return 0;
}

+ (id)fileIdentifierForValidOriginalURL:(id)a3 originalsDirectoryName:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PLPhotoLibraryFileIdentifier.m", 128, @"Invalid parameter not satisfying: %@", @"originalsDirectoryName" object file lineNumber description];
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1506;
  v24 = __Block_byref_object_dispose__1507;
  id v25 = 0;
  uint64_t v9 = [a1 uuidFromURL:v7];
  if (v9)
  {
    uint64_t v10 = PLAllowedResourceTypesForOriginalResources();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89__PLPhotoLibraryFileIdentifier_fileIdentifierForValidOriginalURL_originalsDirectoryName___block_invoke;
    v15[3] = &unk_1E589F1E8;
    unint64_t v16 = v9;
    id v17 = v7;
    id v18 = v8;
    uint64_t v19 = &v20;
    [v10 enumerateObjectsUsingBlock:v15];

    uint64_t v11 = v16;
  }
  else
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v7;
      _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_DEFAULT, "FileIdentifier - filenameUUID is nil for url: %@", buf, 0xCu);
    }
  }

  id v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __89__PLPhotoLibraryFileIdentifier_fileIdentifierForValidOriginalURL_originalsDirectoryName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  unsigned int v6 = [PLPhotoLibraryFileIdentifier alloc];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v5 integerValue];
  uint64_t v9 = [*(id *)(a1 + 40) lastPathComponent];
  obj = [(PLPhotoLibraryFileIdentifier *)v6 initWithAssetUuid:v7 bundleScope:0 uti:0 resourceVersion:0 resourceType:v8 recipeID:0 originalFilename:v9];

  uint64_t v10 = [*(id *)(a1 + 32) UTF8String];
  id v11 = [(PLPhotoLibraryFileIdentifier *)obj extension];
  uint64_t v12 = [v11 UTF8String];
  LODWORD(v9) = [v5 integerValue];

  v13 = PLPathForResourceProperties(v10, v12, v9, 0, 0, -[PLPhotoLibraryFileIdentifier isData](obj, "isData"), [*(id *)(a1 + 48) UTF8String], objc_msgSend(@"resources/renders", "UTF8String"), objc_msgSend(@"resources/derivatives", "UTF8String"), objc_msgSend(@"resources/caches/compute", "UTF8String"), objc_msgSend(@"resources/derivatives/masters", "UTF8String"));

  v14 = [*(id *)(a1 + 40) path];
  id v15 = [v14 pathComponents];

  unint64_t v16 = [v13 pathComponents];
  unint64_t v17 = [v15 count];
  if (v17 > [v16 count])
  {
    id v18 = objc_msgSend(v15, "subarrayWithRange:", objc_msgSend(v15, "count") - objc_msgSend(v16, "count"), objc_msgSend(v16, "count"));
    int v19 = [v18 isEqualToArray:v16];

    if (v19)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
      *a4 = 1;
    }
  }
}

+ (id)fileIdentifierForValidOriginalURL:(id)a3
{
  return (id)[a1 fileIdentifierForValidOriginalURL:a3 originalsDirectoryName:@"originals"];
}

+ (BOOL)isValidOriginalURL:(id)a3
{
  v3 = [a1 fileIdentifierForValidOriginalURL:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)uuidFromURL:(id)a3
{
  v3 = [a3 lastPathComponent];
  if ((unint64_t)[v3 length] < 0x24)
  {
    id v9 = 0;
  }
  else
  {
    BOOL v4 = [v3 substringToIndex:36];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    unsigned int v6 = v5;
    if (v5
      && ([v5 UUIDString],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isEqualToString:v4],
          v7,
          v8))
    {
      id v9 = v4;
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

+ (BOOL)isValidFileIdentifierParametersForUUID:(id)a3 utiString:(id)a4 originalFilename:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
  id v11 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    int v13 = [v11 isDynamic] ^ 1;
    if (!v10)
    {
LABEL_8:
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
    if (!v10) {
      goto LABEL_8;
    }
  }
  if (v13) {
    goto LABEL_8;
  }
  v14 = [v9 pathExtension];
  uint64_t v15 = [v14 length];

  if (!v15)
  {
LABEL_9:
    if (PFOSVariantHasInternalDiagnostics() && (PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      unint64_t v17 = PLBackendGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v21 = 138543874;
        id v22 = v7;
        __int16 v23 = 2114;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v9;
        id v18 = v17;
        os_log_type_t v19 = OS_LOG_TYPE_FAULT;
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v17 = PLBackendGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138543874;
        id v22 = v7;
        __int16 v23 = 2114;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v9;
        id v18 = v17;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_15:
        _os_log_impl(&dword_19BCFB000, v18, v19, "isValidFileIdentifierParameters failed validation with uuid: %{public}@, utiString: %{public}@, originalFilename: %@", (uint8_t *)&v21, 0x20u);
      }
    }

    BOOL v16 = 0;
    goto LABEL_17;
  }
LABEL_7:
  BOOL v16 = 1;
LABEL_17:

  return v16;
}

@end