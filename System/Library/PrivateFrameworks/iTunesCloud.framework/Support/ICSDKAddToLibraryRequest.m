@interface ICSDKAddToLibraryRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6;
- (ICSDKAddToLibraryRequest)initWithAction:(id)a3 databaseID:(unsigned int)a4 databaseRevision:(unsigned int)a5 opaqueID:(id)a6 bundleID:(id)a7;
- (double)timeoutInterval;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICSDKAddToLibraryRequest

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 opaqueID:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  v5 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v5;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  id v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    id v7 = objc_alloc_init(SDKAddToLibraryResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    v8 = [(SDKAddToLibraryResponseParserDelegate *)v7 addedItems];
    id v9 = [v8 copy];
    [v3 setAddedItems:v9];

    objc_msgSend(v3, "setUpdateRequired:", -[SDKAddToLibraryResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

- (double)timeoutInterval
{
  return 120.0;
}

- (ICSDKAddToLibraryRequest)initWithAction:(id)a3 databaseID:(unsigned int)a4 databaseRevision:(unsigned int)a5 opaqueID:(id)a6 bundleID:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a6;
  id v12 = a7;
  v17.receiver = self;
  v17.super_class = (Class)ICSDKAddToLibraryRequest;
  v13 = [(ICDRequest *)&v17 initWithAction:a3];
  v14 = v13;
  if (v13)
  {
    [(ICDRequest *)v13 setMethod:1];
    [(ICDRequest *)v14 setRequestingBundleID:v12];
    v15 = [(ICSDKAddToLibraryRequest *)v14 _bodyDataForDatabaseRevision:v8 opaqueID:v11];
    [(ICDRequest *)v14 setBodyData:v15];
  }
  return v14;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = +[NSString stringWithFormat:@"databases/%u/cloud-add", v8];
  id v12 = [objc_alloc((Class)objc_opt_class()) initWithAction:v11 databaseID:v8 databaseRevision:v7 opaqueID:v10 bundleID:v9];

  return v12;
}

@end