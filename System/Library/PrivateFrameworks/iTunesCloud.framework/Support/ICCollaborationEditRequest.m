@interface ICCollaborationEditRequest
- (ICCollaborationEditRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 cloudLibraryRevision:(unsigned int)a5 properties:(id)a6 trackEdits:(id)a7;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationEditRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackEdits, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (id)_requestBody
{
  v2 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v2;
}

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    v7 = [[ICCollaborationEditResponseParserDelegate alloc] initWithResponse:v3];
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (ICCollaborationEditRequest)initWithDatabaseID:(unsigned int)a3 playlistSagaID:(unint64_t)a4 cloudLibraryRevision:(unsigned int)a5 properties:(id)a6 trackEdits:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = a6;
  id v14 = a7;
  v15 = +[NSString stringWithFormat:@"databases/%u/collaboration", v11];
  v19.receiver = self;
  v19.super_class = (Class)ICCollaborationEditRequest;
  v16 = [(ICDRequest *)&v19 initWithAction:v15];

  if (v16)
  {
    v16->_playlistCloudLibraryID = a4;
    v16->_cloudLibraryRevision = a5;
    objc_storeStrong((id *)&v16->_properties, a6);
    objc_storeStrong((id *)&v16->_trackEdits, a7);
    [(ICDRequest *)v16 setMethod:1];
    v17 = [(ICCollaborationEditRequest *)v16 _requestBody];
    [(ICDRequest *)v16 setBodyData:v17];
  }
  return v16;
}

@end