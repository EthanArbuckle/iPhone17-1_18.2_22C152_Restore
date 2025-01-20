@interface PLPrimaryResourceDataStoreUniformFileKey
+ (id)_fileURLFromKeyStruct:(PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1 *)a3 assetID:(id)a4;
+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
- (BOOL)isDerivative;
- (PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)keyStruct;
- (PLPrimaryResourceDataStoreUniformFileKey)initWithFilePath:(id)a3 resourceVersion:(unsigned int)a4 resourceType:(unsigned int)a5 recipeID:(unsigned int)a6 bundleScope:(unsigned __int16)a7 pathManager:(id)a8;
- (PLPrimaryResourceDataStoreUniformFileKey)initWithKeyStruct:(const void *)a3;
- (id)fileURLForAssetID:(id)a3;
- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4;
- (id)keyData;
- (id)uniformTypeIdentifier;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
- (unsigned)recipeIDForAssetID:(id)a3;
- (unsigned)resourceType;
- (unsigned)resourceVersion;
- (void)setKeyStruct:(PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)a3;
@end

@implementation PLPrimaryResourceDataStoreUniformFileKey

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  unint64_t v6 = a3;
  v4 = [a1 _fileURLFromKeyStruct:&v6 assetID:a4];
  return v4;
}

+ (id)_fileURLFromKeyStruct:(PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1 *)a3 assetID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [v6 libraryID];
  v8 = PLDataStoreForClassIDAndLibraryID(0, v7);

  uint64_t v9 = objc_msgSend(v8, "keyHelperForBundleScope:", objc_msgSend(v6, "bundleScope"));
  v10 = [v8 pathManager];
  int v11 = objc_msgSend(v10, "shouldUseFileIdentifierForBundleScope:", objc_msgSend(v6, "bundleScope"));

  if (v11)
  {
    id v12 = [v6 uuid];
    [v12 UTF8String];
    _fileExtensionFromFileType((*((unsigned __int16 *)a3 + 2) >> 7), (*((unsigned __int16 *)a3 + 2) >> 5) & 3);
    id v13 = objc_claimAutoreleasedReturnValue();
    [v13 UTF8String];
    *(void *)&long long v23 = *(void *)(v9 + 40);
    long long v22 = *(_OWORD *)(v9 + 24);
    v14 = PLURLForResourceProperties();
  }
  else
  {
    _fileExtensionFromFileType((*((unsigned __int16 *)a3 + 2) >> 7), ((*(_DWORD *)a3 | ((unint64_t)*((unsigned __int16 *)a3 + 2) << 32)) >> 37) & 3);
    id v12 = objc_claimAutoreleasedReturnValue();
    [v12 UTF8String];
    id v13 = [v6 filename];
    [v6 directory];
    v15 = v8;
    v17 = id v16 = a1;
    long long v22 = *(_OWORD *)(v9 + 16);
    long long v23 = *(_OWORD *)(v9 + 32);
    v14 = PLDCIMURLForResourceProperties();

    a1 = v16;
    v8 = v15;
  }

  if (v14)
  {
    id v24 = 0;
    char v18 = objc_msgSend(a1, "refreshSandboxExtensionForURL:assetID:error:", v14, v6, &v24, v22, (void)v23);
    id v19 = v24;
    if ((v18 & 1) == 0)
    {
      v20 = PLImageManagerGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v14;
        __int16 v27 = 2112;
        id v28 = v19;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to get sandbox extension for url: %@, error: %@", buf, 0x16u);
      }

      v14 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v14;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return 6;
}

- (void)setKeyStruct:(PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)a3
{
  *((_WORD *)&self->_keyStruct + 2) = *((_WORD *)&a3 + 2);
  *(_DWORD *)&self->_keyStruct = a3;
}

- (PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)keyStruct
{
  return (PLPrimaryDataStore_UniformFileStrategy_KeyStruct_V1)(*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int16 *)&self->_keyStruct + 2) << 32));
}

- (unsigned)recipeIDForAssetID:(id)a3
{
  return (*(_DWORD *)&self->_keyStruct >> 1) & 0xF0000 | ((*(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int16 *)&self->_keyStruct + 2) << 32)) >> 20) & 0xFFFE | (*((unsigned __int16 *)&self->_keyStruct + 2) >> 4) & 1;
}

- (BOOL)isDerivative
{
  return (*((unsigned __int16 *)&self->_keyStruct + 2) >> 4) & 1;
}

- (unsigned)resourceVersion
{
  return (*(_DWORD *)&self->_keyStruct >> 10) & 3;
}

- (unsigned)resourceType
{
  return (*(_DWORD *)&self->_keyStruct >> 12) & 0x1F;
}

- (id)fileURLForAssetID:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _fileURLFromKeyStruct:&self->_keyStruct assetID:v4];

  return v5;
}

- (PLPrimaryResourceDataStoreUniformFileKey)initWithFilePath:(id)a3 resourceVersion:(unsigned int)a4 resourceType:(unsigned int)a5 recipeID:(unsigned int)a6 bundleScope:(unsigned __int16)a7 pathManager:(id)a8
{
  uint64_t v9 = a7;
  char v12 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a8;
  v34.receiver = self;
  v34.super_class = (Class)PLPrimaryResourceDataStoreUniformFileKey;
  id v16 = [(PLPrimaryResourceDataStoreKey *)&v34 _init];
  v17 = v16;
  if (v16)
  {
    if (a5 == 31) {
      goto LABEL_22;
    }
    v16[2] = ((a5 & 0x1F) << 12) | ((v12 & 3) << 10) | v16[2] & 0xFFFE0000 | 3;
    id v18 = [v14 pathExtension];
    id v19 = v18;
    if (onceToken == -1)
    {
      if (v18)
      {
LABEL_5:
        v20 = [(id)kFileIdentifierKeyExtensionsToFileTypes objectForKeyedSubscript:v19];
        LOBYTE(v21) = [v20 unsignedShortValue];

        uint64_t v21 = v21;
LABEL_10:

        unint64_t v23 = (v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32)) & 0xFFFF807FFFFFFFFFLL;
        v17[2] = v17[2];
        *((_WORD *)v17 + 6) = (v23 | (v21 << 39)) >> 32;

        if (([v15 isUBF] & 1) != 0
          || [v15 shouldUseFileIdentifierForBundleScope:v9])
        {
          unint64_t v24 = (v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32)) & 0xFFFFFF9FFFFFFFFFLL;
          *((_WORD *)v17 + 6) = WORD2(v24);
        }
        else
        {
          v26 = [v14 pathExtension];
          __int16 v27 = [v26 lowercaseString];
          char v28 = [v26 isEqualToString:v27];

          if (v28)
          {
            uint64_t v29 = 0x2000000000;
          }
          else
          {
            v30 = [v26 uppercaseString];
            int v31 = [v26 isEqualToString:v30];

            if (!v31)
            {

              v17 = 0;
              goto LABEL_22;
            }
            uint64_t v29 = 0x4000000000;
          }
          unint64_t v32 = (v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32)) & 0xFFFFFF9FFFFFFFFFLL | v29;
          v17[2] = v32;
          *((_WORD *)v17 + 6) = WORD2(v32);

          unint64_t v24 = v17[2] | ((unint64_t)*((unsigned __int16 *)v17 + 6) << 32);
        }
        if ((v24 & 0x7F8000000000) != 0 && !(a6 >> 20))
        {
          unint64_t v25 = v24 & 0xFFE00001FFFFLL | (2 * a6) & 0x1E0000 | ((unint64_t)((unsigned __int16)a6 >> 1) << 21);
          v17[2] = v25;
          *((_WORD *)v17 + 6) = (v25 | ((unint64_t)(a6 & 1) << 36)) >> 32;
          goto LABEL_23;
        }
LABEL_22:

        v17 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      dispatch_once(&onceToken, &__block_literal_global_80749);
      if (v19) {
        goto LABEL_5;
      }
    }
    long long v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = 0;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Cannot determine file type from extension: %{public}@", buf, 0xCu);
    }

    uint64_t v21 = 0;
    goto LABEL_10;
  }
LABEL_23:

  return (PLPrimaryResourceDataStoreUniformFileKey *)v17;
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PLPrimaryResourceDataStoreUniformFileKey;
  id v8 = [(PLPrimaryResourceDataStoreKey *)&v21 _initFromExistingLocationOfExternalResource:v6 asset:v7];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = v8;
  v10 = [v6 fileURL];

  if (!v10)
  {

LABEL_6:
    id v18 = 0;
    goto LABEL_7;
  }
  int v11 = [PLPrimaryResourceDataStoreUniformFileKey alloc];
  v20 = [v6 fileURL];
  char v12 = [v20 path];
  uint64_t v13 = [v6 version];
  uint64_t v14 = [v6 resourceType];
  uint64_t v15 = [v6 recipeID];
  uint64_t v16 = [v7 bundleScope];
  v17 = [v7 pathManager];
  id v18 = [(PLPrimaryResourceDataStoreUniformFileKey *)v11 initWithFilePath:v12 resourceVersion:v13 resourceType:v14 recipeID:v15 bundleScope:v16 pathManager:v17];

  if (!v18) {
    id v18 = [[PLPrimaryResourceDataStoreFilePathKey alloc] initFromExistingLocationOfExternalResource:v6 asset:v7];
  }
LABEL_7:

  return v18;
}

- (id)uniformTypeIdentifier
{
  v2 = PLUTTypeFromUniformFileType((*((unsigned __int16 *)&self->_keyStruct + 2) >> 7));
  v3 = [v2 identifier];

  return v3;
}

- (PLPrimaryResourceDataStoreUniformFileKey)initWithKeyStruct:(const void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLPrimaryResourceDataStoreUniformFileKey;
  result = -[PLPrimaryResourceDataStoreKey _initWithKeyStruct:](&v6, sel__initWithKeyStruct_);
  if (result)
  {
    __int16 v5 = *((_WORD *)a3 + 2);
    *(_DWORD *)&result->_keyStruct = *(_DWORD *)a3;
    *((_WORD *)&result->_keyStruct + 2) = v5;
  }
  return result;
}

- (id)keyData
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_keyStruct length:6];
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 libraryID];
  uint64_t v9 = PLDataStoreForClassIDAndLibraryID(0, v8);

  v10 = [v9 pathManager];
  char v11 = [v10 isUBF];
  unint64_t v12 = *(_DWORD *)&self->_keyStruct | ((unint64_t)*((unsigned __int16 *)&self->_keyStruct + 2) << 32);
  if ((v12 & 0x7F8000000000) == 0 || (*(_DWORD *)&self->_keyStruct & 0x1F000) == 0x1F000)
  {

    goto LABEL_7;
  }
  if (v11)
  {
    uint64_t v13 = v12 & 0x6000000000;

    if (!v13) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v14 = v7;
    uint64_t v15 = +[PLResourceModelValidationError malformedKeyErrorForKey:self resource:v7];
    uint64_t v16 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v15];

    goto LABEL_10;
  }
  unsigned int v17 = ((v12 >> 37) & 3) - 1;

  if (v17 >= 2) {
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v14 = v7;
  uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_10:
  id v18 = [(PLPrimaryResourceDataStoreUniformFileKey *)self fileURLForAssetID:v6];
  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  v20 = [v18 path];
  char v21 = [v19 fileExistsAtPath:v20];

  if ((v21 & 1) == 0)
  {
    if ([(PLPrimaryResourceDataStoreUniformFileKey *)self isDerivative]
      && (*(_DWORD *)&self->_keyStruct & 0x1E0000) == 0x80000)
    {
      uint64_t v22 = +[PLResourceModelValidationError unreachableFileThumbnailErrorForKey:self assetID:v6];
    }
    else
    {
      uint64_t v22 = +[PLResourceModelValidationError unreachableKeyErrorForKey:self atURL:v18 resource:v14];
    }
    unint64_t v23 = (void *)v22;
    uint64_t v24 = [v16 arrayByAddingObject:v22];

    uint64_t v16 = (void *)v24;
  }

  return v16;
}

@end