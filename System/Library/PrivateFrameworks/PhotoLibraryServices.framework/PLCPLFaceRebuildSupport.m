@interface PLCPLFaceRebuildSupport
+ (void)rebuildDeferredFacesForAsset:(id)a3 inManagedObjectContext:(id)a4;
- (PLCPLFaceRebuildSupport)initWithAsset:(id)a3 managedObjectContext:(id)a4;
- (id)fetchDeferredFacesToRebuild;
- (id)fetchPersonForDeferredFace:(id)a3;
- (void)rebuildAllFaces;
- (void)rebuildDetectedFace:(id)a3;
- (void)rebuildFace:(id)a3;
- (void)rebuildHiddenFace:(id)a3;
- (void)rebuildRejectedFace:(id)a3;
@end

@implementation PLCPLFaceRebuildSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rebuildHelper, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id)fetchPersonForDeferredFace:(id)a3
{
  v4 = [a3 personUUID];
  v5 = +[PLPerson personWithUUID:v4 inManagedObjectContext:self->_context];

  return v5;
}

- (id)fetchDeferredFacesToRebuild
{
  v3 = [(PLManagedAsset *)self->_asset cloudAssetGUID];
  v4 = +[PLDeferredRebuildFace deferredFacesWithAssetCloudGUID:v3 inManagedObjectContext:self->_context];

  return v4;
}

- (void)rebuildHiddenFace:(id)a3
{
  [(PLFaceRebuildHelper *)self->_rebuildHelper rebuildHiddenFace:a3 onAsset:self->_asset];
  ++self->_hiddenFaceCount;
  if (!*MEMORY[0x1E4F59AC0])
  {
    v4 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Rebuilt hidden face", v5, 2u);
    }
  }
}

- (void)rebuildRejectedFace:(id)a3
{
  id v4 = a3;
  v5 = [(PLCPLFaceRebuildSupport *)self fetchPersonForDeferredFace:v4];
  [(PLFaceRebuildHelper *)self->_rebuildHelper rebuildRejectedFace:v4 onAsset:self->_asset person:v5];

  ++self->_rejectedFaceCount;
  if (!*MEMORY[0x1E4F59AC0])
  {
    v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Rebuilt rejected face", v7, 2u);
    }
  }
}

- (void)rebuildDetectedFace:(id)a3
{
  id v4 = a3;
  v5 = [(PLCPLFaceRebuildSupport *)self fetchPersonForDeferredFace:v4];
  [(PLFaceRebuildHelper *)self->_rebuildHelper rebuildDetectedFace:v4 onAsset:self->_asset person:v5];

  ++self->_detectedFaceCount;
  if (!*MEMORY[0x1E4F59AC0])
  {
    v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Rebuilt detected face", v7, 2u);
    }
  }
}

- (void)rebuildFace:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (!*MEMORY[0x1E4F59AC0])
  {
    v6 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Rebuilding deferred face: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (([v4 rejected] & 1) != 0
    || ([v4 personUUID], v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    if ([v4 rejected]
      && ([v4 personUUID], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      [(PLCPLFaceRebuildSupport *)self rebuildRejectedFace:v4];
    }
    else if ([v4 isHidden] {
           && ([v4 personUUID], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
    }
    {
      [(PLCPLFaceRebuildSupport *)self rebuildHiddenFace:v4];
    }
    else if (!*v5)
    {
      v10 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unexpected deferred face state: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    [(PLCPLFaceRebuildSupport *)self rebuildDetectedFace:v4];
  }
}

- (void)rebuildAllFaces
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(PLCPLFaceRebuildSupport *)self fetchDeferredFacesToRebuild];
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x19F38D3B0](v5);
          -[PLCPLFaceRebuildSupport rebuildFace:](self, "rebuildFace:", v9, (void)v16);
          [(NSManagedObjectContext *)self->_context deleteObject:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v28 count:16];
        uint64_t v6 = v5;
      }
      while (v5);
    }

    if (!*MEMORY[0x1E4F59AC0])
    {
      int v11 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int detectedFaceCount = self->_detectedFaceCount;
        int rejectedFaceCount = self->_rejectedFaceCount;
        int hiddenFaceCount = self->_hiddenFaceCount;
        v15 = [(PLManagedAsset *)self->_asset cloudAssetGUID];
        *(_DWORD *)buf = 67109890;
        int v21 = detectedFaceCount;
        __int16 v22 = 1024;
        int v23 = rejectedFaceCount;
        __int16 v24 = 1024;
        int v25 = hiddenFaceCount;
        __int16 v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Rebuilt %d detected, %d rejected, %d hidden for asset: %@", buf, 0x1Eu);
      }
    }
  }
}

- (PLCPLFaceRebuildSupport)initWithAsset:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLCPLFaceRebuildSupport;
  uint64_t v9 = [(PLCPLFaceRebuildSupport *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    int v11 = [[PLFaceRebuildHelper alloc] initWithContext:v10->_context];
    rebuildHelper = v10->_rebuildHelper;
    v10->_rebuildHelper = v11;

    uint64_t v13 = v10;
  }

  return v10;
}

+ (void)rebuildDeferredFacesForAsset:(id)a3 inManagedObjectContext:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x19F38D3B0]();
  id v7 = [[PLCPLFaceRebuildSupport alloc] initWithAsset:v8 managedObjectContext:v5];
  [(PLCPLFaceRebuildSupport *)v7 rebuildAllFaces];
}

@end