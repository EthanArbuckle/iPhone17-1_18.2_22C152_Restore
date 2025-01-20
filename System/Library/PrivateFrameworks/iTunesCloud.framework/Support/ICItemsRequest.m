@interface ICItemsRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7;
+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8;
+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9;
+ (id)requestWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4;
- (ICItemsRequest)initWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9;
- (double)timeoutInterval;
- (id)_bodyDataForMetadataFilter:(id)a3 queryFilter:(id)a4 purchaseTokens:(id)a5 includeHiddenItems:(BOOL)a6 includePreorders:(BOOL)a7 paginationToken:(id)a8;
@end

@implementation ICItemsRequest

- (id)_bodyDataForMetadataFilter:(id)a3 queryFilter:(id)a4 purchaseTokens:(id)a5 includeHiddenItems:(BOOL)a6 includePreorders:(BOOL)a7 paginationToken:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20 = v12;
  id v21 = a8;
  v22 = v13;
  id v14 = v13;
  id v15 = v21;
  id v16 = v12;
  id v17 = v11;
  v18 = ICDAAPUtilitiesCreateDataForContainer();

  return v18;
}

- (double)timeoutInterval
{
  return 180.0;
}

- (ICItemsRequest)initWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v19 = +[NSString stringWithFormat:@"databases/%u/items", v13];
  v23.receiver = self;
  v23.super_class = (Class)ICItemsRequest;
  v20 = [(ICDRequest *)&v23 initWithAction:v19];

  if (v20)
  {
    [(ICDRequest *)v20 setMethod:1];
    id v21 = [(ICItemsRequest *)v20 _bodyDataForMetadataFilter:v15 queryFilter:v16 purchaseTokens:v17 includeHiddenItems:v10 includePreorders:v9 paginationToken:v18];
    [(ICDRequest *)v20 setBodyData:v21];

    [(ICDRequest *)v20 setRequestPersonalizationStyle:2];
  }

  return v20;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8 paginationToken:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v14 = *(void *)&a3;
  id v15 = a9;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v14 metadataFilter:v18 queryFilter:v17 purchaseTokens:v16 includeHiddenItems:v10 includePreorders:v9 paginationToken:v15];

  return v19;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7 includePreorders:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v12 = *(void *)&a3;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v12 metadataFilter:v15 queryFilter:v14 purchaseTokens:v13 includeHiddenItems:v9 includePreorders:v8 paginationToken:0];

  return v16;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 metadataFilter:(id)a4 queryFilter:(id)a5 purchaseTokens:(id)a6 includeHiddenItems:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v10 metadataFilter:v13 queryFilter:v12 purchaseTokens:v11 includeHiddenItems:v7 includePreorders:0 paginationToken:0];

  return v14;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v4 metadataFilter:0 queryFilter:0 purchaseTokens:0 includeHiddenItems:0 includePreorders:0 paginationToken:v5];

  return v6;
}

@end