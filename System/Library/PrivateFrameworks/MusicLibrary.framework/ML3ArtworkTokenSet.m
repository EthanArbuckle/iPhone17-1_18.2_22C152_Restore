@interface ML3ArtworkTokenSet
- (ML3ArtworkTokenSet)initWithEntity:(id)a3 artworkType:(int64_t)a4;
- (NSString)availableArtworkToken;
- (NSString)fetchableArtworkToken;
- (double)retrievalTime;
- (id)artworkTokenForSource:(int64_t)a3;
- (int64_t)fetchableArtworkSourceType;
- (void)_faultInBestTokens;
- (void)_faultInTokens;
- (void)setRetrievalTime:(double)a3;
@end

@implementation ML3ArtworkTokenSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkSourceToTokenMap, 0);
  objc_storeStrong((id *)&self->_fetchableArtworkToken, 0);
  objc_storeStrong((id *)&self->_availableArtworkToken, 0);

  objc_storeStrong((id *)&self->_entity, 0);
}

- (void)setRetrievalTime:(double)a3
{
  self->_retrievalTime = a3;
}

- (double)retrievalTime
{
  return self->_retrievalTime;
}

- (void)_faultInTokens
{
  self->_faultedInTokens = 1;
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(ML3Entity *)self->_entity library];
  int64_t v5 = [(ML3Entity *)self->_entity persistentID];
  uint64_t v6 = [(id)objc_opt_class() revisionTrackingCode];
  int64_t artworkType = self->_artworkType;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__ML3ArtworkTokenSet__faultInTokens__block_invoke;
  v11[3] = &unk_1E5FAF400;
  id v12 = v3;
  id v8 = v3;
  [v4 enumerateArtworkTokensForEntityPersistentID:v5 entityType:v6 artworkType:artworkType usingBlock:v11];

  v9 = (NSDictionary *)[v8 copy];
  artworkSourceToTokenMap = self->_artworkSourceToTokenMap;
  self->_artworkSourceToTokenMap = v9;
}

void __36__ML3ArtworkTokenSet__faultInTokens__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  int64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithInteger:a3];
  [v4 setObject:v6 forKeyedSubscript:v7];
}

- (void)_faultInBestTokens
{
  self->_faultedInBestTokens = 1;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(ML3Entity *)self->_entity library];
  int64_t v5 = [(ML3Entity *)self->_entity persistentID];
  uint64_t v6 = [(id)objc_opt_class() revisionTrackingCode];
  int64_t artworkType = self->_artworkType;
  double retrievalTime = self->_retrievalTime;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__ML3ArtworkTokenSet__faultInBestTokens__block_invoke;
  v10[3] = &unk_1E5FAF3D8;
  v10[4] = self;
  dispatch_semaphore_t v11 = v3;
  v9 = v3;
  [v4 retrieveBestArtworkTokensForEntityPersistentID:v5 entityType:v6 artworkType:artworkType retrievalTime:v10 completionHandler:retrievalTime];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __40__ML3ArtworkTokenSet__faultInBestTokens__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v8;
  id v13 = v8;

  *(void *)(*(void *)(a1 + 32) + 40) = a4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)artworkTokenForSource:(int64_t)a3
{
  if (!self->_faultedInTokens) {
    [(ML3ArtworkTokenSet *)self _faultInTokens];
  }
  artworkSourceToTokenMap = self->_artworkSourceToTokenMap;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(NSDictionary *)artworkSourceToTokenMap objectForKeyedSubscript:v6];

  return v7;
}

- (int64_t)fetchableArtworkSourceType
{
  if (!self->_faultedInBestTokens) {
    [(ML3ArtworkTokenSet *)self _faultInBestTokens];
  }
  return self->_fetchableArtworkSourceType;
}

- (NSString)fetchableArtworkToken
{
  if (!self->_faultedInBestTokens) {
    [(ML3ArtworkTokenSet *)self _faultInBestTokens];
  }
  fetchableArtworkToken = self->_fetchableArtworkToken;

  return fetchableArtworkToken;
}

- (NSString)availableArtworkToken
{
  if (!self->_faultedInBestTokens) {
    [(ML3ArtworkTokenSet *)self _faultInBestTokens];
  }
  availableArtworkToken = self->_availableArtworkToken;

  return availableArtworkToken;
}

- (ML3ArtworkTokenSet)initWithEntity:(id)a3 artworkType:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ML3ArtworkTokenSet.m", 26, @"Invalid parameter not satisfying: %@", @"entity != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)ML3ArtworkTokenSet;
  uint64_t v9 = [(ML3ArtworkTokenSet *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entity, a3);
    v10->_int64_t artworkType = a4;
  }

  return v10;
}

@end