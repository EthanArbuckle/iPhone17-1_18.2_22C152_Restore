@interface PXStoryPersistableRecipeWriterFactory
+ (BOOL)canPersistForConfiguration:(id)a3;
+ (id)defaultPersistableRecipeWriterForConfiguration:(id)a3;
@end

@implementation PXStoryPersistableRecipeWriterFactory

+ (id)defaultPersistableRecipeWriterForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [v3 assetCollection];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && +[PXStoryPersistableRecipeWriterFactory canPersistForConfiguration:v3])
  {
    v5 = [[PXStoryPHMemoryPersistableRecipeWriter alloc] initWithMemory:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v4 photoLibrary];
      id v13 = objc_alloc(MEMORY[0x1E4F39150]);
      v14 = [v3 referencePersons];
      v15 = (void *)[v13 initWithObjects:v14 photoLibrary:v12 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

      v5 = [[PXStoryPHAssetCollectionPersistableRecipeWriter alloc] initWithAssetCollection:v4 referencePersons:v15];
    }
    else
    {
      v12 = PXStoryErrorCreateWithCodeDebugFormat(4, @"Can't persist recipe with asset collection %@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
      v5 = [[PXStoryNullPersistableRecipeWriter alloc] initWithError:v12];
    }
  }
  return v5;
}

+ (BOOL)canPersistForConfiguration:(id)a3
{
  v5 = [a3 assetCollection];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        id v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
        [v10 handleFailureInMethod:a2, a1, @"PXStoryPersistableRecipeWriter.m", 30, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v12, v13 object file lineNumber description];
      }
      unsigned int v7 = [v6 pendingState];
      unsigned int v8 = (v7 < 4) & (0xBu >> (v7 & 0xF));
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

@end