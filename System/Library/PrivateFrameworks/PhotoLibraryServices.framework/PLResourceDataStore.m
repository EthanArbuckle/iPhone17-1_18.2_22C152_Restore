@interface PLResourceDataStore
+ (BOOL)isMasterThumbRecipeID:(unsigned int)a3;
+ (BOOL)keyDataIsValid:(id)a3;
+ (id)supportedRecipes;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
+ (unsigned)storeClassID;
- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3;
- (BOOL)canStoreExternalResource:(id)a3;
- (BOOL)canStreamResource:(id)a3;
- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3;
- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7;
- (BOOL)supportsTimeRange;
- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4;
- (PLPhotoLibraryPathManager)pathManager;
- (PLResourceDataStore)initWithPathManager:(id)a3;
- (id)descriptionForSubtype:(int64_t)a3;
- (id)expectedFileURLForResource:(id)a3 asset:(id)a4;
- (id)guessUTIForExternalResource:(id)a3 forAssetKind:(signed __int16)a4;
- (id)keyFromKeyStruct:(const void *)a3;
- (id)name;
- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6;
- (id)resourceDataForKey:(id)a3 assetID:(id)a4;
- (id)resourceURLForKey:(id)a3 assetID:(id)a4;
- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4;
- (id)virtualResourcesForAsset:(id)a3;
- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10;
@end

@implementation PLResourceDataStore

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (PLResourceDataStore)initWithPathManager:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLResourceDataStore;
  v7 = [(PLResourceDataStore *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"PLResourceDataStore.m", 65, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_pathManager, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)supportsTimeRange
{
  return 0;
}

- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  return 0;
}

- (id)guessUTIForExternalResource:(id)a3 forAssetKind:(signed __int16)a4
{
  id v4 = a3;
  [v4 resourceType];
  v5 = [v4 fileURL];

  id v6 = [v5 path];
  v7 = PLGuessResourceUTIForResourceType();

  v8 = +[PLUniformTypeIdentifier utiWithIdentifier:v7];

  return v8;
}

- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10
{
  if (a10)
  {
    objc_super v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C520];
    id v12 = a10;
    id v13 = [v10 errorWithDomain:v11 code:8 userInfo:0];
    (*((void (**)(id, void, void, void, void, id))a10 + 2))(v12, 0, 0, 0, 0, v13);
  }
}

- (BOOL)canStreamResource:(id)a3
{
  return 0;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, *(void *)&a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:153 description:@"Subclass to implement"];

  return 0;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return 0;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  [v8 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:144 description:@"Subclass to implement"];

  return 0;
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  v9 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7);
  [v9 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:139 description:@"Subclass to implement"];

  return 0;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:134 description:@"Subclass to implement"];

  return 0;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, *(void *)&a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:129 description:@"Subclass to implement"];

  return 0;
}

- (id)virtualResourcesForAsset:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:124 description:@"Subclass to implement"];

  return 0;
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:114 description:@"Subclass to implement"];

  return 0;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:109 description:@"Subclass to implement"];

  return 0;
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:104 description:@"Subclass to implement"];

  return 0;
}

- (id)keyFromKeyStruct:(const void *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:99 description:@"Subclass to implement"];

  return 0;
}

- (id)descriptionForSubtype:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
}

- (id)name
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLResourceDataStore.m" lineNumber:72 description:@"Subclass to implement"];

  return 0;
}

+ (id)supportedRecipes
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"PLResourceDataStore.m" lineNumber:119 description:@"Subclass to implement"];

  return 0;
}

+ (BOOL)keyDataIsValid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5) {
    BOOL v6 = v5 == objc_msgSend(a1, "keyLengthWithDataPreview:", *(unsigned __int8 *)objc_msgSend(v4, "bytes"));
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:a1 file:@"PLResourceDataStore.m" lineNumber:81 description:@"Subclass to implement"];

  return 0;
}

+ (unsigned)storeClassID
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"PLResourceDataStore.m" lineNumber:58 description:@"Subclass to implement"];

  return 0;
}

+ (BOOL)isMasterThumbRecipeID:(unsigned int)a3
{
  return a3 == 269159 || a3 == 272155 || a3 == 272151;
}

@end