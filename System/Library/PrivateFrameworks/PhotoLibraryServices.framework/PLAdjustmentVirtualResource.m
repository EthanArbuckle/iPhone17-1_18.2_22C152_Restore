@interface PLAdjustmentVirtualResource
- (NSNumber)cachedDataLength;
- (PLAdjustmentVirtualResource)initWithAdjustmentFilePath:(id)a3 forAsset:(id)a4;
- (id)adjustmentDictionary;
- (int64_t)dataLength;
- (int64_t)estimatedDataLength;
- (os_unfair_lock_s)lock;
- (void)setCachedDataLength:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation PLAdjustmentVirtualResource

- (void).cxx_destruct
{
}

- (void)setCachedDataLength:(id)a3
{
}

- (NSNumber)cachedDataLength
{
  return self->_cachedDataLength;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (id)adjustmentDictionary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(PLVirtualResource *)self fileURL];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:2 error:0];
    if (v3)
    {
      id v8 = 0;
      v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v8];
      v5 = v8;
      if (v5)
      {
        v6 = PLBackendGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v10 = v5;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Error when parsing adjustment data: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v5 = PLBackendGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v2;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "adjustmentFileData is nil for file URL: %@", buf, 0xCu);
      }
      v4 = 0;
    }
  }
  else
  {
    v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "adjustmentFileURL is nil for self", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (int64_t)estimatedDataLength
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedDataLength = self->_cachedDataLength;
  if (cachedDataLength)
  {
    int64_t v5 = [(NSNumber *)cachedDataLength unsignedLongLongValue];
    os_unfair_lock_unlock(p_lock);
    if (v5) {
      return v5;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  uint64_t v6 = [MEMORY[0x1E4F59910] maxInlineDataSize];
  if (v6 >= 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 + 1;
  }
  return v7 >> 1;
}

- (int64_t)dataLength
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_cachedDataLength = &self->_cachedDataLength;
  cachedDataLength = self->_cachedDataLength;
  if (!cachedDataLength)
  {
    uint64_t v6 = [(PLVirtualResource *)self dataStoreKey];
    uint64_t v7 = [(PLVirtualResource *)self assetID];
    id v8 = [v6 fileURLForAssetID:v7];
    v9 = [v8 path];

    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = [v10 attributesOfItemAtPath:v9 error:0];

    v12 = [v11 objectForKey:*MEMORY[0x1E4F28390]];
    if (v12) {
      objc_storeStrong((id *)p_cachedDataLength, v12);
    }

    cachedDataLength = *p_cachedDataLength;
  }
  int64_t v13 = [(NSNumber *)cachedDataLength unsignedLongLongValue];
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (PLAdjustmentVirtualResource)initWithAdjustmentFilePath:(id)a3 forAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAdjustmentVirtualResource;
  v9 = [(PLVirtualResource *)&v16 initWithAsset:v8 resourceType:8 version:2 recipeID:0];
  if (v9)
  {
    if (!v7)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v9, @"PLAdjustmentVirtualResource.m", 37, @"Invalid parameter not satisfying: %@", @"pathForAdjustmentFile" object file lineNumber description];
    }
    v9->_lock._os_unfair_lock_opaque = 0;
    v10 = +[PLUniformTypeIdentifier plistUniformTypeIdentifier];
    [(PLVirtualResource *)v9 setUniformTypeIdentifier:v10];

    uint64_t v11 = objc_alloc_init(PLValidatedExternalResource);
    [(PLValidatedExternalResource *)v11 setResourceType:[(PLVirtualResource *)v9 resourceType]];
    [(PLValidatedExternalResource *)v11 setVersion:[(PLVirtualResource *)v9 version]];
    [(PLValidatedExternalResource *)v11 setRecipeID:[(PLVirtualResource *)v9 recipeID]];
    v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
    [(PLValidatedExternalResource *)v11 setFileURL:v12];

    id v13 = [[PLPrimaryResourceDataStoreKey alloc] initFromExistingLocationOfExternalResource:v11 asset:v8];
    [(PLVirtualResource *)v9 setDataStoreKey:v13];
  }
  return v9;
}

@end