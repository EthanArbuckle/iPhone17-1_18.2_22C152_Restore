@interface ICBulkLyricsInfoRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5;
- (ICBulkLyricsInfoRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5;
- (id)_bodyDataForItemIDs:(id)a3 useLongIDs:(BOOL)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICBulkLyricsInfoRequest

- (id)_bodyDataForItemIDs:(id)a3 useLongIDs:(BOOL)a4
{
  id v7 = a3;
  id v4 = v7;
  v5 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v5;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  id v4 = [v3 responseData];
  v5 = +[ICDResponseDataParser parseResponseData:v4];

  [v3 setLyricsInfoDictionaries:v5];

  return v3;
}

- (ICBulkLyricsInfoRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = +[NSString stringWithFormat:@"databases/%u/extra_data/cloud-lyrics-info", v6];
  v13.receiver = self;
  v13.super_class = (Class)ICBulkLyricsInfoRequest;
  v10 = [(ICDRequest *)&v13 initWithAction:v9];

  if (v10)
  {
    [(ICDRequest *)v10 setMethod:1];
    v11 = [(ICBulkLyricsInfoRequest *)v10 _bodyDataForItemIDs:v8 useLongIDs:v5];
    [(ICDRequest *)v10 setBodyData:v11];
  }
  return v10;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v6 itemIDs:v7 useLongIDs:v5];

  return v8;
}

@end