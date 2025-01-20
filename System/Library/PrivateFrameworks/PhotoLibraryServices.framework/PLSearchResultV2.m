@interface PLSearchResultV2
- (BOOL)isEqual:(id)a3;
- (NSArray)allFruitfulScopedQueryMatchedGroups;
- (NSArray)allQueryMatchedGroups;
- (NSArray)assetUUIDs;
- (NSArray)collectionUUIDs;
- (NSArray)suggestions;
- (PLSearchResultV2)init;
- (PLSearchResultV2)initWithAssetUUIDs:(id)a3 collectionUUIDs:(id)a4 suggestions:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)mergeWithSearchResult:(id)a3;
- (void)setAllFruitfulScopedQueryMatchedGroups:(id)a3;
- (void)setAllQueryMatchedGroups:(id)a3;
@end

@implementation PLSearchResultV2

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allQueryMatchedGroups, 0);
  objc_storeStrong((id *)&self->_allFruitfulScopedQueryMatchedGroups, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_collectionUUIDs, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (PLSearchResultV2)initWithAssetUUIDs:(id)a3 collectionUUIDs:(id)a4 suggestions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PLSearchResultV2;
  v11 = [(PLSearchResultV2 *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      v15 = (void *)v12;
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v11->_assetUUIDs, v15);

    uint64_t v16 = [v9 copy];
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = v14;
    }
    objc_storeStrong((id *)&v11->_collectionUUIDs, v18);

    uint64_t v19 = [v10 copy];
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = v14;
    }
    objc_storeStrong((id *)&v11->_suggestions, v21);
  }
  return v11;
}

- (PLSearchResultV2)init
{
  return [(PLSearchResultV2 *)self initWithAssetUUIDs:MEMORY[0x1E4F1CBF0] collectionUUIDs:MEMORY[0x1E4F1CBF0] suggestions:MEMORY[0x1E4F1CBF0]];
}

- (void)setAllQueryMatchedGroups:(id)a3
{
}

- (NSArray)allQueryMatchedGroups
{
  return self->_allQueryMatchedGroups;
}

- (void)setAllFruitfulScopedQueryMatchedGroups:(id)a3
{
}

- (NSArray)allFruitfulScopedQueryMatchedGroups
{
  return self->_allFruitfulScopedQueryMatchedGroups;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSArray)collectionUUIDs
{
  return self->_collectionUUIDs;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLSearchResultV2 *)self assetUUIDs];
  uint64_t v5 = [v4 count];
  v6 = [(PLSearchResultV2 *)self collectionUUIDs];
  uint64_t v7 = [v6 count];
  id v8 = [(PLSearchResultV2 *)self suggestions];
  id v9 = [v3 stringWithFormat:@"asset count: %lu\ncollection count: %lu\nsuggestions: %@", v5, v7, v8];

  return v9;
}

- (unint64_t)hash
{
  v3 = [(PLSearchResultV2 *)self assetUUIDs];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(PLSearchResultV2 *)self collectionUUIDs];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(PLSearchResultV2 *)self suggestions];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(PLSearchResultV2 *)self assetUUIDs];
    uint64_t v7 = [v5 assetUUIDs];
    char v8 = [v6 isEqualToArray:v7];

    id v9 = [(PLSearchResultV2 *)self collectionUUIDs];
    id v10 = [v5 collectionUUIDs];
    char v11 = [v9 isEqualToArray:v10];

    uint64_t v12 = [(PLSearchResultV2 *)self suggestions];
    v13 = [v5 suggestions];

    LOBYTE(v5) = [v12 isEqualToArray:v13];
    char v14 = v8 & v11 & v5;
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)mergeWithSearchResult:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA80];
    id v5 = a3;
    uint64_t v6 = [(PLSearchResultV2 *)self assetUUIDs];
    id v22 = [v4 setWithArray:v6];

    uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
    char v8 = [(PLSearchResultV2 *)self collectionUUIDs];
    id v9 = [v7 setWithArray:v8];

    id v10 = (void *)MEMORY[0x1E4F1CA80];
    char v11 = [(PLSearchResultV2 *)self suggestions];
    uint64_t v12 = [v10 setWithArray:v11];

    v13 = [v5 assetUUIDs];
    [v22 addObjectsFromArray:v13];

    char v14 = [v5 collectionUUIDs];
    [v9 addObjectsFromArray:v14];

    v15 = [v5 suggestions];

    [v12 addObjectsFromArray:v15];
    uint64_t v16 = [v22 allObjects];
    assetUUIDs = self->_assetUUIDs;
    self->_assetUUIDs = v16;

    v18 = [v9 allObjects];
    collectionUUIDs = self->_collectionUUIDs;
    self->_collectionUUIDs = v18;

    v20 = [v12 allObjects];
    suggestions = self->_suggestions;
    self->_suggestions = v20;
  }
}

@end