@interface ICCollaborationEndRequest
- (ICCollaborationEndRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4;
- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationEndRequest

- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3
{
  v3 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v3;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    v7 = [[ICCollaborationEndResponseParserDelegate alloc] initWithResponse:v3];
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (ICCollaborationEndRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4
{
  id v6 = +[NSString stringWithFormat:@"databases/%u/collaboration", *(void *)&a3];
  v10.receiver = self;
  v10.super_class = (Class)ICCollaborationEndRequest;
  v7 = [(ICDRequest *)&v10 initWithAction:v6];

  if (v7)
  {
    [(ICDRequest *)v7 setMethod:1];
    v8 = [(ICCollaborationEndRequest *)v7 _requestBodyWithPlaylistCloudLibraryID:a4];
    [(ICDRequest *)v7 setBodyData:v8];
  }
  return v7;
}

@end