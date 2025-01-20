@interface PLAssetSearchResult
- (NSArray)assetUUIDs;
- (NSDate)sortDate;
- (NSString)identifier;
- (id)description;
- (id)keyAssetUUID;
- (unint64_t)assetCount;
- (unint64_t)type;
@end

@implementation PLAssetSearchResult

- (void).cxx_destruct
{
}

- (NSDate)sortDate
{
  return self->_sortDate;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@:%p, ", v5, self];

  v6 = [(PLSearchResult *)self contentStrings];
  [v3 appendFormat:@"contentStrings: %@, ", v6];

  [v3 appendFormat:@"type: %ld, ", -[PLAssetSearchResult type](self, "type")];
  objc_msgSend(v3, "appendFormat:", @"assetCount: %ld", -[PLAssetSearchResult assetCount](self, "assetCount"));
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)identifier
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = [(PLSearchResult *)self groupResult];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [v4 groups];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v3, "appendFormat:", @"%llu", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "groupId"));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v3 hash];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"aggregationSearchResult://%lu", v10);

  return (NSString *)v11;
}

- (NSArray)assetUUIDs
{
  id v3 = [(PLSearchResult *)self groupResult];
  v4 = [v3 assetUUIDs];
  unint64_t v5 = [v4 count];
  uint64_t v6 = [(PLSearchResult *)self groupResult];
  unint64_t Count = CFArrayGetCount((CFArrayRef)[v6 assetIds]);

  if (v5 < Count)
  {
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_75256);
    v9 = [(PLSearchResult *)self groupResult];
    [v9 fetchNextAssetUUIDs:0 completionHandler:v8];

    dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v10 = [(PLSearchResult *)self groupResult];
  v11 = [v10 assetUUIDs];

  return (NSArray *)v11;
}

- (unint64_t)assetCount
{
  v2 = [(PLSearchResult *)self groupResult];
  unint64_t v3 = [v2 assetMatchCount];

  return v3;
}

- (id)keyAssetUUID
{
  v2 = [(PLSearchResult *)self groupResult];
  unint64_t v3 = [v2 assetUUIDs];
  v4 = [v3 firstObject];

  return v4;
}

- (unint64_t)type
{
  return 1;
}

@end