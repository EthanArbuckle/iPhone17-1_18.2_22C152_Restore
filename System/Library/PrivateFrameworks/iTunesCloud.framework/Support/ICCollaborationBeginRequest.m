@interface ICCollaborationBeginRequest
- (ICCollaborationBeginRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 sharingMode:(unint64_t)a5;
- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3 sharingMode:(unint64_t)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationBeginRequest

- (id)_requestBodyWithPlaylistCloudLibraryID:(unint64_t)a3 sharingMode:(unint64_t)a4
{
  v4 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v4;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    v7 = [[ICCollaborationBeginResponseParserDelegate alloc] initWithResponse:v3];
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (ICCollaborationBeginRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 sharingMode:(unint64_t)a5
{
  v8 = +[NSString stringWithFormat:@"databases/%u/collaboration", *(void *)&a3];
  v12.receiver = self;
  v12.super_class = (Class)ICCollaborationBeginRequest;
  v9 = [(ICDRequest *)&v12 initWithAction:v8];

  if (v9)
  {
    [(ICDRequest *)v9 setMethod:1];
    v10 = [(ICCollaborationBeginRequest *)v9 _requestBodyWithPlaylistCloudLibraryID:a4 sharingMode:a5];
    [(ICDRequest *)v9 setBodyData:v10];
  }
  return v9;
}

@end