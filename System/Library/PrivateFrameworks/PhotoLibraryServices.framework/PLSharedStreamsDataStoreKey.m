@interface PLSharedStreamsDataStoreKey
+ (id)_keyDataWithRelativePath:(id)a3 type:(unsigned int)a4;
+ (id)_relativeDCIMFilePathForPersonID:(id)a3 albumID:(id)a4 dcimDirectory:(id)a5 fileName:(id)a6;
+ (id)_relativeFilePathForPersonID:(id)a3 albumID:(id)a4 fileName:(id)a5;
+ (id)_replacementPathExtensionForType:(unsigned int)a3;
+ (unint64_t)dataLengthFromPreviewByte:(unsigned __int8)a3;
- (BOOL)isDerivative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKey:(id)a3;
- (PLSharedStreamsDataStoreKey)initWithAsset:(id)a3 album:(id)a4 type:(unsigned int)a5;
- (PLSharedStreamsDataStoreKey)initWithKeyStruct:(const void *)a3;
- (id)descriptionForAssetID:(id)a3;
- (id)fileURLForAssetID:(id)a3;
- (id)keyData;
- (id)uniformTypeIdentifier;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
- (unsigned)recipeIDForAssetID:(id)a3;
- (unsigned)resourceType;
- (unsigned)resourceVersion;
@end

@implementation PLSharedStreamsDataStoreKey

- (void).cxx_destruct
{
}

- (id)fileURLForAssetID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 libraryID];
  v6 = PLDataStoreForClassIDAndLibraryID(2, v5);

  v7 = [v6 pathManager];
  v8 = [v7 photoDirectoryWithType:22];
  v9 = [(id)objc_opt_class() _replacementPathExtensionForType:self->_sharedStreamsResourceType];
  v10 = self->_relativePath;
  v11 = v10;
  if (v9)
  {
    v12 = [(NSString *)v10 stringByDeletingPathExtension];
    uint64_t v13 = [v12 stringByAppendingPathExtension:v9];

    v11 = (void *)v13;
  }
  v14 = [v8 stringByAppendingPathComponent:v11];
  if (v14)
  {
    v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
    id v20 = 0;
    char v16 = [(id)objc_opt_class() refreshSandboxExtensionForURL:v15 assetID:v4 error:&v20];
    id v17 = v20;
    if ((v16 & 1) == 0)
    {
      v18 = PLImageManagerGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v14;
        __int16 v23 = 2112;
        id v24 = v17;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to get sandbox extension for path: %@, error: %@", buf, 0x16u);
      }

      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)descriptionForAssetID:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(PLSharedStreamsDataStoreKey *)self fileURLForAssetID:v5];

  v9 = [v4 stringWithFormat:@"<%@>, fileURL: %@", v7, v8];

  return v9;
}

- (unsigned)recipeIDForAssetID:(id)a3
{
  uint64_t sharedStreamsResourceType = self->_sharedStreamsResourceType;
  if (sharedStreamsResourceType > 9) {
    return 65741;
  }
  else {
    return dword_19BA9A8D8[sharedStreamsResourceType];
  }
}

- (BOOL)isDerivative
{
  return 1;
}

- (unsigned)resourceVersion
{
  return 0;
}

- (unsigned)resourceType
{
  uint64_t sharedStreamsResourceType = self->_sharedStreamsResourceType;
  if (sharedStreamsResourceType > 9) {
    return 3;
  }
  else {
    return dword_19BA9A914[sharedStreamsResourceType];
  }
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSString *)self->_relativePath length])
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v9 = +[PLResourceModelValidationError malformedKeyErrorForKey:self resource:v7];
    v8 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v9];
  }
  v10 = [(PLSharedStreamsDataStoreKey *)self fileURLForAssetID:v6];
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  v12 = [v10 path];
  char v13 = [v11 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    v14 = +[PLResourceModelValidationError unreachableKeyErrorForKey:self atURL:v10 resource:v7];
    uint64_t v15 = [v8 arrayByAddingObject:v14];

    v8 = (void *)v15;
  }

  return v8;
}

- (id)uniformTypeIdentifier
{
  unsigned int v2 = self->_sharedStreamsResourceType - 3;
  if (v2 > 5)
  {
    v3 = 0;
  }
  else
  {
    v3 = [**((id **)&unk_1E5874510 + v2) identifier];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLSharedStreamsDataStoreKey *)a3;
  if (v4 == self) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0
  }
      && [(PLSharedStreamsDataStoreKey *)self isEqualToKey:v4];

  return v5;
}

- (BOOL)isEqualToKey:(id)a3
{
  return PLResourceDataStoreKeyIsEqual(self, a3);
}

- (PLSharedStreamsDataStoreKey)initWithKeyStruct:(const void *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PLSharedStreamsDataStoreKey;
  id v4 = [(PLSharedStreamsDataStoreKey *)&v11 init];
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(unsigned __int8 *)a3;
    v4->_uint64_t sharedStreamsResourceType = *((unsigned __int8 *)a3 + 2);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:(char *)a3 + 3 length:v6 - 3];
    uint64_t v8 = [[NSString alloc] initWithData:v7 encoding:4];
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v8;
  }
  return v5;
}

- (id)keyData
{
  v3 = objc_opt_class();
  relativePath = self->_relativePath;
  uint64_t sharedStreamsResourceType = self->_sharedStreamsResourceType;
  return (id)[v3 _keyDataWithRelativePath:relativePath type:sharedStreamsResourceType];
}

- (PLSharedStreamsDataStoreKey)initWithAsset:(id)a3 album:(id)a4 type:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 cloudGUID];
  if (![v10 length]) {
    goto LABEL_7;
  }
  objc_super v11 = [v9 cloudPersonID];
  if (![v11 length])
  {

LABEL_7:
    goto LABEL_8;
  }
  v12 = [v8 filename];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    v14 = [v8 pathManager];
    int v15 = [v14 isUBF];

    if (v15)
    {
      char v16 = objc_opt_class();
      id v17 = [v9 cloudPersonID];
      v18 = [v9 cloudGUID];
      v19 = [v8 filename];
      id v20 = [v16 _relativeFilePathForPersonID:v17 albumID:v18 fileName:v19];
    }
    else
    {
      v27 = [v8 assetID];
      v28 = [v27 directory];
      id v17 = [v28 lastPathComponent];

      v29 = objc_opt_class();
      v18 = [v9 cloudPersonID];
      v19 = [v9 cloudGUID];
      v30 = [v8 filename];
      id v20 = [v29 _relativeDCIMFilePathForPersonID:v18 albumID:v19 dcimDirectory:v17 fileName:v30];
    }
    v31 = [v20 dataUsingEncoding:4];
    if ((unint64_t)[v31 length] > 0xFC)
    {
      v35 = 0;
    }
    else
    {
      v32 = [(id)objc_opt_class() _keyDataWithRelativePath:v20 type:v5];
      v33 = [PLSharedStreamsDataStoreKey alloc];
      id v34 = v32;
      v35 = -[PLSharedStreamsDataStoreKey initWithKeyStruct:](v33, "initWithKeyStruct:", [v34 bytes]);
    }
    uint64_t v25 = v35;

    if (v25) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
LABEL_8:

LABEL_9:
  v21 = PLImageManagerGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = [v9 cloudGUID];
    __int16 v23 = [v9 cloudPersonID];
    id v24 = [v8 filename];
    int v36 = 138412802;
    v37 = v22;
    __int16 v38 = 2112;
    v39 = v23;
    __int16 v40 = 2112;
    v41 = v24;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "[RM]: Attempt to init PLSharedStreamsDataStoreKey with missing info. cloudGUID: %@, cloudPersonID: %@, filename: %@", (uint8_t *)&v36, 0x20u);
  }
  uint64_t v25 = 0;
LABEL_12:

  return v25;
}

+ (unint64_t)dataLengthFromPreviewByte:(unsigned __int8)a3
{
  return a3;
}

+ (id)_keyDataWithRelativePath:(id)a3 type:(unsigned int)a4
{
  char v4 = a4;
  uint64_t v5 = [a3 dataUsingEncoding:4];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v5, "length") + 3);
  char v10 = [v5 length] + 3;
  char v9 = 0;
  char v8 = v4;
  [v6 appendBytes:&v10 length:1];
  [v6 appendBytes:&v9 length:1];
  [v6 appendBytes:&v8 length:1];
  [v6 appendData:v5];

  return v6;
}

+ (id)_relativeDCIMFilePathForPersonID:(id)a3 albumID:(id)a4 dcimDirectory:(id)a5 fileName:(id)a6
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  v17[1] = a4;
  v17[2] = a5;
  v17[3] = a6;
  char v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v9 arrayWithObjects:v17 count:4];
  int v15 = [NSString pathWithComponents:v14];

  return v15;
}

+ (id)_relativeFilePathForPersonID:(id)a3 albumID:(id)a4 fileName:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 arrayWithObjects:&v14 count:3];
  id v12 = objc_msgSend(NSString, "pathWithComponents:", v11, v14, v15, v16, v17);

  return v12;
}

+ (id)_replacementPathExtensionForType:(unsigned int)a3
{
  if (a3 - 4 > 4) {
    return 0;
  }
  else {
    return off_1E58744E8[a3 - 4];
  }
}

@end