@interface BKLibraryFileSizeManagerCacheItemRequest
- (BKLibraryFileSizeManagerCacheItemRequest)initWithCacheItemRequestWithAssetID:(id)a3 assetURL:(id)a4;
- (NSString)assetID;
- (NSURL)assetURL;
@end

@implementation BKLibraryFileSizeManagerCacheItemRequest

- (BKLibraryFileSizeManagerCacheItemRequest)initWithCacheItemRequestWithAssetID:(id)a3 assetURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryFileSizeManagerCacheItemRequest;
  v8 = [(BKLibraryFileSizeManagerCacheItemRequest *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    assetID = v8->_assetID;
    v8->_assetID = v9;

    v11 = (NSURL *)[v7 copy];
    assetURL = v8->_assetURL;
    v8->_assetURL = v11;
  }
  return v8;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURL, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end