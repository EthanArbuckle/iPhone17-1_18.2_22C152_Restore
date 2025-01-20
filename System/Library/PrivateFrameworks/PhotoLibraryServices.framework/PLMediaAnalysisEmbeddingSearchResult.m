@interface PLMediaAnalysisEmbeddingSearchResult
- (NSNumber)distance;
- (NSString)assetUUID;
- (PLMediaAnalysisEmbeddingSearchResult)initWithAssetUUID:(id)a3 distance:(id)a4;
@end

@implementation PLMediaAnalysisEmbeddingSearchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

- (NSNumber)distance
{
  return self->_distance;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (PLMediaAnalysisEmbeddingSearchResult)initWithAssetUUID:(id)a3 distance:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLMediaAnalysisEmbeddingSearchResult;
  v9 = [(PLMediaAnalysisEmbeddingSearchResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetUUID, a3);
    objc_storeStrong((id *)&v10->_distance, a4);
  }

  return v10;
}

@end