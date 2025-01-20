@interface ICSetContainerPropertiesRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7;
- (ICSetContainerPropertiesRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 containerID:(unsigned int)a4 trackList:(id)a5 properties:(id)a6;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICSetContainerPropertiesRequest

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 containerID:(unsigned int)a4 trackList:(id)a5 properties:(id)a6
{
  id v7 = a5;
  id v12 = a6;
  id v8 = v7;
  id v9 = v12;
  v10 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v10;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    id v7 = objc_alloc_init(SetContainerPropertiesResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    objc_msgSend(v3, "setUpdateRequired:", -[SetContainerPropertiesResponseParserDelegate updateRequired](v7, "updateRequired"));
    id v8 = [(SetContainerPropertiesResponseParserDelegate *)v7 globalPlaylistID];
    [v3 setGlobalPlaylistID:v8];

    id v9 = [(SetContainerPropertiesResponseParserDelegate *)v7 subscribedContainerURL];
    [v3 setSubscribedContainerURL:v9];
  }

  return v3;
}

- (ICSetContainerPropertiesRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a7;
  v14 = +[NSString stringWithFormat:@"databases/%u/edit", v10];
  v18.receiver = self;
  v18.super_class = (Class)ICSetContainerPropertiesRequest;
  v15 = [(ICDRequest *)&v18 initWithAction:v14];

  if (v15)
  {
    [(ICDRequest *)v15 setMethod:1];
    v16 = [(ICSetContainerPropertiesRequest *)v15 _bodyDataForDatabaseRevision:v9 containerID:v8 trackList:v12 properties:v13];
    [(ICDRequest *)v15 setBodyData:v16];
  }
  return v15;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 containerID:(unsigned int)a5 trackList:(id)a6 properties:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v10 databaseRevision:v9 containerID:v8 trackList:v12 properties:v11];

  return v13;
}

@end