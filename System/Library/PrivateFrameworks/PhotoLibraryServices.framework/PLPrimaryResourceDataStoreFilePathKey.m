@interface PLPrimaryResourceDataStoreFilePathKey
+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
- (NSString)filePathSuffix;
- (PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)keyStruct;
- (PLPrimaryResourceDataStoreFilePathKey)initWithFilePath:(id)a3 andLibraryID:(id)a4;
- (PLPrimaryResourceDataStoreFilePathKey)initWithKeyStruct:(const void *)a3;
- (id)descriptionForAssetID:(id)a3;
- (id)extension;
- (id)fileURLForAssetID:(id)a3;
- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4;
- (id)keyData;
- (id)uniformTypeIdentifier;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
- (void)setFilePathSuffix:(id)a3;
- (void)setKeyStruct:(PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)a3;
@end

@implementation PLPrimaryResourceDataStoreFilePathKey

- (void).cxx_destruct
{
}

- (void)setFilePathSuffix:(id)a3
{
}

- (NSString)filePathSuffix
{
  return self->_filePathSuffix;
}

- (void)setKeyStruct:(PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)a3
{
  *(_WORD *)&self->_keyStruct = a3;
}

- (PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)keyStruct
{
  return (PLPrimaryDataStoreKeyStrategy_FilePath_KeyStruct_V1)*(_WORD *)&self->_keyStruct;
}

- (id)descriptionForAssetID:(id)a3
{
  id v4 = a3;
  v5 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  uint64_t v6 = [(PLPrimaryResourceDataStoreKey *)&v13 descriptionForAssetID:v4];
  v7 = (void *)v6;
  unint64_t keyStruct = (unint64_t)self->_keyStruct;
  v9 = off_1E586EBA0[(keyStruct >> 10) & 7];
  if ((keyStruct & 0x300) != 0) {
    v10 = 0;
  }
  else {
    v10 = @"v1";
  }
  v11 = [v5 stringWithFormat:@"%@, (%@, %@)", v6, v9, v10];

  return v11;
}

- (id)extension
{
  v2 = [(PLPrimaryResourceDataStoreFilePathKey *)self filePathSuffix];
  v3 = [v2 pathExtension];

  return v3;
}

- (PLPrimaryResourceDataStoreFilePathKey)initWithFilePath:(id)a3 andLibraryID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  v9 = [(PLPrimaryResourceDataStoreKey *)&v37 _init];
  if (!v9) {
    goto LABEL_24;
  }
  if (!v7)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, v9, @"PLPrimaryResourceDataStoreFilePathKey.m", 287, @"Invalid parameter not satisfying: %@", @"filePath" object file lineNumber description];
  }
  v10 = PLPathManagerFromLibraryID();
  v11 = [v10 photoDirectoryWithType:1];
  id v12 = v7;
  id v13 = v11;
  v14 = v13;
  if (!v13) {
    goto LABEL_20;
  }
  v15 = @"/PhotoData/Thumbnails/V2/PhotoData/CPLAssets/group";
  v16 = [v13 stringByAppendingString:@"/PhotoData/Thumbnails/V2/PhotoData/CPLAssets/group"];
  char v17 = [v12 hasPrefix:v16];

  if ((v17 & 1) == 0)
  {
    v15 = @"/PhotoData/Metadata/PhotoData/CPLAssets/group";
    v19 = [v14 stringByAppendingString:@"/PhotoData/Metadata/PhotoData/CPLAssets/group"];
    char v20 = [v12 hasPrefix:v19];

    if (v20)
    {
      __int16 v18 = 4096;
      goto LABEL_19;
    }
    v15 = @"/PhotoData/CPLAssets/group";
    v21 = [v14 stringByAppendingString:@"/PhotoData/CPLAssets/group"];
    char v22 = [v12 hasPrefix:v21];

    if (v22)
    {
      __int16 v18 = 6144;
      goto LABEL_19;
    }
    v15 = @"/PhotoData/Thumbnails/V2/PhotoData/";
    v23 = [v14 stringByAppendingString:@"/PhotoData/Thumbnails/V2/PhotoData/"];
    char v24 = [v12 hasPrefix:v23];

    if (v24)
    {
      __int16 v18 = 3072;
      goto LABEL_19;
    }
    v15 = @"/PhotoData/";
    v25 = [v14 stringByAppendingString:@"/PhotoData/"];
    char v26 = [v12 hasPrefix:v25];

    if (v26)
    {
      __int16 v18 = 1024;
      goto LABEL_19;
    }
    v15 = @"/DCIM/";
    v27 = [v14 stringByAppendingString:@"/DCIM/"];
    char v28 = [v12 hasPrefix:v27];

    if (v28)
    {
      __int16 v18 = 2048;
      goto LABEL_19;
    }
    if ([v12 hasPrefix:v14])
    {
      v15 = &stru_1EEB2EB80;
      __int16 v18 = 7168;
      goto LABEL_19;
    }
LABEL_20:

    v29 = v9 + 4;
    v9[4] &= 0xE3FFu;
    id v31 = v12;
    goto LABEL_21;
  }
  __int16 v18 = 5120;
LABEL_19:

  v29 = v9 + 4;
  v9[4] = v9[4] & 0xE3FF | v18;
  v30 = [v14 stringByAppendingString:v15];
  objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v30, "length"));
  id v31 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
  [v9 setFilePathSuffix:v31];
  v32 = [v31 dataUsingEncoding:4];
  unint64_t v33 = [v32 length];

  unsigned __int8 v34 = 16;
  if (v33 > 0x10) {
    unsigned __int8 v34 = v33;
  }
  _WORD *v29 = *v29 & 0xFC00 | v34;

LABEL_24:
  return (PLPrimaryResourceDataStoreFilePathKey *)v9;
}

- (id)uniformTypeIdentifier
{
  v2 = (void *)MEMORY[0x1E4F8CDF8];
  v3 = [(PLPrimaryResourceDataStoreFilePathKey *)self extension];
  id v4 = [v2 resourceModelTypeForFilenameExtension:v3];
  v5 = [v4 identifier];

  return v5;
}

- (id)initFromExistingLocationOfExternalResource:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  id v8 = [(PLPrimaryResourceDataStoreKey *)&v18 _initFromExistingLocationOfExternalResource:v6 asset:v7];
  if (v8)
  {
    v9 = v8;
    v10 = [v6 fileURL];

    if (v10)
    {
      v11 = [v6 fileURL];
    }
    else
    {
      if ([v6 resourceType] == 3)
      {
        id v13 = [v7 pathForVideoComplementFile];
        if (v13)
        {
LABEL_10:
          v15 = [v7 assetID];
          uint64_t v16 = [v15 libraryID];

          id v12 = (void *)[v9 initWithFilePath:v13 andLibraryID:v16];
          v9 = (void *)v16;
          goto LABEL_11;
        }
LABEL_7:
        id v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v11 = [v7 mainFileURL];
    }
    v14 = v11;
    id v13 = [v11 path];

    if (v13) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (id)fileURLForAssetID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLPrimaryResourceDataStoreFilePathKey *)self filePathSuffix];

  if (!v5) {
    goto LABEL_11;
  }
  if ((*(_WORD *)&self->_keyStruct & 0x1C00) != 0)
  {
    if (v4)
    {
      id v6 = [v4 libraryID];
      id v7 = PLDataStoreForClassIDAndLibraryID(0, v6);

      id v8 = [v7 pathManager];
      v9 = [v8 photoDirectoryWithType:1];

      v10 = [v9 stringByAppendingString:off_1E586EB60[((unint64_t)*(_WORD *)&self->_keyStruct >> 10) & 7]];
      v11 = [(PLPrimaryResourceDataStoreFilePathKey *)self filePathSuffix];
      id v12 = [v10 stringByAppendingString:v11];

      if (v12) {
        goto LABEL_5;
      }
    }
LABEL_11:
    id v13 = 0;
    goto LABEL_12;
  }
  id v12 = [(PLPrimaryResourceDataStoreFilePathKey *)self filePathSuffix];
  if (!v12) {
    goto LABEL_11;
  }
LABEL_5:
  id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
  id v18 = 0;
  char v14 = [(id)objc_opt_class() refreshSandboxExtensionForURL:v13 assetID:v4 error:&v18];
  id v15 = v18;
  if ((v14 & 1) == 0)
  {
    uint64_t v16 = PLImageManagerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      char v20 = v12;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to get sandbox extension for path: %@, error: %@", buf, 0x16u);
    }

    id v13 = 0;
  }

LABEL_12:
  return v13;
}

- (PLPrimaryResourceDataStoreFilePathKey)initWithKeyStruct:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreFilePathKey;
  id v4 = -[PLPrimaryResourceDataStoreKey _initWithKeyStruct:](&v9, sel__initWithKeyStruct_);
  v5 = v4;
  if (v4)
  {
    __int16 v6 = *(_WORD *)a3;
    *(_WORD *)&v4->_unint64_t keyStruct = *(_WORD *)a3;
    id v7 = (void *)[[NSString alloc] initWithBytes:(char *)a3 + 2 length:v6 encoding:4];
    [(PLPrimaryResourceDataStoreFilePathKey *)v5 setFilePathSuffix:v7];
  }
  return v5;
}

- (id)keyData
{
  v3 = [(PLPrimaryResourceDataStoreFilePathKey *)self filePathSuffix];
  uint64_t v4 = [v3 length] + 2;

  v5 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v4];
  [v5 appendBytes:&self->_keyStruct length:2];
  __int16 v6 = [(PLPrimaryResourceDataStoreFilePathKey *)self filePathSuffix];
  id v7 = [v6 dataUsingEncoding:4];

  if ((unint64_t)[v7 length] <= 0xF)
  {
    id v8 = malloc_type_calloc(0x10uLL, 1uLL, 0xCFF50BBBuLL);
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    __strncpy_chk();
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v8 length:16];
  }
  [v5 appendData:v7];

  return v5;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6 = a4;
  id v7 = [(PLPrimaryResourceDataStoreFilePathKey *)self fileURLForAssetID:a3];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v12 = +[PLResourceModelValidationError unreachableKeyErrorForKey:self atURL:v7 resource:v6];
    v11 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v12];
  }
  return v11;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return a3 + 2;
}

+ (id)fileURLForPayloadKeyData:(unint64_t)a3 assetID:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:a1 file:@"PLPrimaryResourceDataStoreFilePathKey.m" lineNumber:177 description:@"fileURLForPayload not supported for filePath key."];

  return 0;
}

@end