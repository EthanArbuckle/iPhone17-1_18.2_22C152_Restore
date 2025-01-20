@interface ICCreateGeniusContainerRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6;
- (ICCreateGeniusContainerRequest)initWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6;
- (id)_bodyDataForPlaylistName:(id)a3 seedItemIDs:(id)a4 itemIDs:(id)a5;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCreateGeniusContainerRequest

- (id)_bodyDataForPlaylistName:(id)a3 seedItemIDs:(id)a4 itemIDs:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v14 = v7;
  id v15 = a5;
  v16 = v8;
  id v9 = v8;
  id v10 = v15;
  id v11 = v7;
  v12 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v12;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  v5 = +[ICDResponseDataParser parseResponseData:v4];

  v6 = [v5 lastObject];
  id v7 = [v6 objectForKey:@"dmap.itemid"];
  objc_msgSend(v3, "setContainerID:", objc_msgSend(v7, "unsignedIntValue"));

  return v3;
}

- (ICCreateGeniusContainerRequest)initWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[NSString stringWithFormat:@"databases/%u/edit", v8];
  v17.receiver = self;
  v17.super_class = (Class)ICCreateGeniusContainerRequest;
  v14 = [(ICDRequest *)&v17 initWithAction:v13];

  if (v14)
  {
    [(ICDRequest *)v14 setMethod:1];
    id v15 = [(ICCreateGeniusContainerRequest *)v14 _bodyDataForPlaylistName:v10 seedItemIDs:v11 itemIDs:v12];
    [(ICDRequest *)v14 setBodyData:v15];
  }
  return v14;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 playlistName:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v8 playlistName:v11 seedItemIDs:v10 itemIDs:v9];

  return v12;
}

@end