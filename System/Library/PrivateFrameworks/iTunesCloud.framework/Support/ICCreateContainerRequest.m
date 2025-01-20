@interface ICCreateContainerRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (ICCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 playlistProperties:(id)a4 trackList:(id)a5;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCreateContainerRequest

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 playlistProperties:(id)a4 trackList:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  id v6 = v11;
  id v7 = v10;
  v8 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v8;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    id v7 = objc_alloc_init(CreateContainerResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    objc_msgSend(v3, "setContainerID:", -[CreateContainerResponseParserDelegate containerID](v7, "containerID"));
    objc_msgSend(v3, "setUpdateRequired:", -[CreateContainerResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

- (ICCreateContainerRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  v12 = +[NSString stringWithFormat:@"databases/%u/edit", v8];
  v16.receiver = self;
  v16.super_class = (Class)ICCreateContainerRequest;
  v13 = [(ICDRequest *)&v16 initWithAction:v12];

  if (v13)
  {
    [(ICDRequest *)v13 setMethod:1];
    v14 = [(ICCreateContainerRequest *)v13 _bodyDataForDatabaseRevision:v7 playlistProperties:v10 trackList:v11];
    [(ICDRequest *)v13 setBodyData:v14];
  }
  return v13;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v8 databaseRevision:v7 playlistProperties:v10 trackList:v9];

  return v11;
}

@end