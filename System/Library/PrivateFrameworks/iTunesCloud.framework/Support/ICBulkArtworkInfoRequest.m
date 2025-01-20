@interface ICBulkArtworkInfoRequest
- (ICBulkArtworkInfoRequest)initWithDatabaseID:(unsigned int)a3 cloudIDs:(id)a4 itemKind:(unsigned __int8)a5 useLongIDs:(BOOL)a6;
- (id)_bodyDataForCloudIDs:(id)a3 itemKind:(unsigned __int8)a4 useLongIDs:(BOOL)a5;
- (id)_queryFilterString;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICBulkArtworkInfoRequest

- (id)_queryFilterString
{
  v2 = [@"com.apple.itunes.extended-media-kind" stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"];
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [&off_1001CCCE8 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [&off_1001CCCE8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&off_1001CCCE8);
        }
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@:%d'", v2, [*(id *)(*((void *)&v12 + 1) + 8 * i) intValue]);
        [v3 addObject:v8];
      }
      id v5 = [&off_1001CCCE8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  v9 = [v3 componentsJoinedByString:@","];
  v10 = +[NSString stringWithFormat:@"(%@)", v9];

  return v10;
}

- (id)_bodyDataForCloudIDs:(id)a3 itemKind:(unsigned __int8)a4 useLongIDs:(BOOL)a5
{
  id v8 = a3;
  id v5 = v8;
  uint64_t v6 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v6;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  id v4 = [v3 responseData];
  id v5 = +[ICDResponseDataParser parseResponseData:v4];

  [v3 setArtworkInfoDictionaries:v5];

  return v3;
}

- (ICBulkArtworkInfoRequest)initWithDatabaseID:(unsigned int)a3 cloudIDs:(id)a4 itemKind:(unsigned __int8)a5 useLongIDs:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v11 = +[NSString stringWithFormat:@"databases/%u/extra_data/cloud-artwork-info", v8];
  v15.receiver = self;
  v15.super_class = (Class)ICBulkArtworkInfoRequest;
  long long v12 = [(ICDRequest *)&v15 initWithAction:v11];

  if (v12)
  {
    [(ICDRequest *)v12 setMethod:1];
    long long v13 = [(ICBulkArtworkInfoRequest *)v12 _bodyDataForCloudIDs:v10 itemKind:v7 useLongIDs:v6];
    [(ICDRequest *)v12 setBodyData:v13];

    [(ICDRequest *)v12 setRequestPersonalizationStyle:2];
  }

  return v12;
}

@end