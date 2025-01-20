@interface PLLocalVideoKeyFrameGenerationJob
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToJob:(id)a3;
- (BOOL)networkAccessAllowed;
- (NSManagedObjectID)assetObjectID;
- (NSString)clientBundleID;
- (PLLocalVideoKeyFrameGenerationJob)init;
- (PLPhotoLibraryPathManagerIdentifier)libraryID;
- (unint64_t)hash;
- (void)addCompletionHandler:(id)a3;
- (void)callCompletionHandlersWithMutatedMoc:(id)a3 error:(id)a4 storedRecipes:(id)a5 affectedRecipes:(id)a6 sourceMetadata:(id)a7;
- (void)setAssetObjectID:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setLibraryID:(id)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
@end

@implementation PLLocalVideoKeyFrameGenerationJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

- (void)setLibraryID:(id)a3
{
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)networkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setAssetObjectID:(id)a3
{
}

- (NSManagedObjectID)assetObjectID
{
  return self->_assetObjectID;
}

- (void)callCompletionHandlersWithMutatedMoc:(id)a3 error:(id)a4 storedRecipes:(id)a5 affectedRecipes:(id)a6 sourceMetadata:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  p_handlerLock = &self->_handlerLock;
  os_unfair_lock_lock(&self->_handlerLock);
  v18 = (void *)[(NSMutableArray *)self->_completionHandlers copy];
  os_unfair_lock_unlock(p_handlerLock);
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
    if (v15) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F1CAA0] orderedSet];
LABEL_3:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * v23) + 16))(*(void *)(*((void *)&v24 + 1) + 8 * v23));
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (void)addCompletionHandler:(id)a3
{
  p_handlerLock = &self->_handlerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_handlerLock);
  completionHandlers = self->_completionHandlers;
  v7 = (void *)MEMORY[0x19F38D650](v5);

  [(NSMutableArray *)completionHandlers addObject:v7];
  os_unfair_lock_unlock(p_handlerLock);
}

- (unint64_t)hash
{
  v2 = [(PLLocalVideoKeyFrameGenerationJob *)self assetObjectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToJob:(id)a3
{
  id v4 = a3;
  id v5 = [(PLLocalVideoKeyFrameGenerationJob *)self assetObjectID];
  v6 = [v4 assetObjectID];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLLocalVideoKeyFrameGenerationJob *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PLLocalVideoKeyFrameGenerationJob *)self isEqualToJob:v4];
  }

  return v5;
}

- (PLLocalVideoKeyFrameGenerationJob)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLLocalVideoKeyFrameGenerationJob;
  v2 = [(PLLocalVideoKeyFrameGenerationJob *)&v7 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_handlerLock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v3->_completionHandlers;
    v3->_completionHandlers = v4;
  }
  return v3;
}

@end