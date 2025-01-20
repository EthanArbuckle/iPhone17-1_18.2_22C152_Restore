@interface PLTopAssetsSearchResult
- (NSArray)assetUUIDs;
- (NSArray)assetUUIDsV2;
- (PLTopAssetsSearchResult)initWithAssetUUIDs:(id)a3;
- (PLTopAssetsSearchResult)initWithTopAssetsResult:(id)a3;
- (PSITopAssetsResult)topAssetsResults;
- (unint64_t)assetCount;
@end

@implementation PLTopAssetsSearchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topAssetsResults, 0);
  objc_storeStrong((id *)&self->_assetUUIDsV2, 0);
}

- (PSITopAssetsResult)topAssetsResults
{
  return self->_topAssetsResults;
}

- (NSArray)assetUUIDsV2
{
  return self->_assetUUIDsV2;
}

- (NSArray)assetUUIDs
{
  v3 = [(PLTopAssetsSearchResult *)self assetUUIDsV2];

  if (v3)
  {
    v4 = [(PLTopAssetsSearchResult *)self assetUUIDsV2];
  }
  else
  {
    v5 = [(PLTopAssetsSearchResult *)self topAssetsResults];
    v6 = [v5 assetUUIDs];
    unint64_t v7 = [v6 count];
    v8 = [(PLTopAssetsSearchResult *)self topAssetsResults];
    unint64_t Count = CFArrayGetCount((CFArrayRef)[v8 assetIds]);

    if (v7 < Count)
    {
      dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_67044);
      v11 = [(PLTopAssetsSearchResult *)self topAssetsResults];
      [v11 fetchAssetUUIDsWithCompletionHandler:v10];

      dispatch_block_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    }
    v12 = [(PLTopAssetsSearchResult *)self topAssetsResults];
    v4 = [v12 assetUUIDs];
  }
  return (NSArray *)v4;
}

- (unint64_t)assetCount
{
  v3 = [(PLTopAssetsSearchResult *)self assetUUIDsV2];
  if (v3)
  {
    v4 = [(PLTopAssetsSearchResult *)self assetUUIDsV2];
    uint64_t v5 = [v4 count];
  }
  else
  {
    v4 = [(PLTopAssetsSearchResult *)self topAssetsResults];
    uint64_t v5 = [v4 assetMatchCount];
  }
  unint64_t v6 = v5;

  return v6;
}

- (PLTopAssetsSearchResult)initWithAssetUUIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLTopAssetsSearchResult;
  unint64_t v6 = [(PLTopAssetsSearchResult *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetUUIDsV2, a3);
  }

  return v7;
}

- (PLTopAssetsSearchResult)initWithTopAssetsResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLTopAssetsSearchResult;
  unint64_t v6 = [(PLTopAssetsSearchResult *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_topAssetsResults, a3);
  }

  return v7;
}

@end