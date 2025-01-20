@interface ICCollaborationRespondToPendingCollaboratorRequest
- (ICCollaborationRespondToPendingCollaboratorRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 socialProfileID:(id)a5 approval:(BOOL)a6;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationRespondToPendingCollaboratorRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfileID, 0);

  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
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
    v7 = [[ICCollaborationRespondToPendingCollaboratorResponseParserDelegate alloc] initWithResponse:v3];
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (ICCollaborationRespondToPendingCollaboratorRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 socialProfileID:(id)a5 approval:(BOOL)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[NSString stringWithFormat:@"databases/%u/collaboration", v9];
  v17.receiver = self;
  v17.super_class = (Class)ICCollaborationRespondToPendingCollaboratorRequest;
  v14 = [(ICDRequest *)&v17 initWithAction:v13];

  if (v14)
  {
    [(ICDRequest *)v14 setMethod:1];
    objc_storeStrong((id *)&v14->_globalPlaylistID, a4);
    objc_storeStrong((id *)&v14->_socialProfileID, a5);
    v14->_approval = a6;
    v15 = [(ICCollaborationRespondToPendingCollaboratorRequest *)v14 _requestBody];
    [(ICDRequest *)v14 setBodyData:v15];
  }
  return v14;
}

@end