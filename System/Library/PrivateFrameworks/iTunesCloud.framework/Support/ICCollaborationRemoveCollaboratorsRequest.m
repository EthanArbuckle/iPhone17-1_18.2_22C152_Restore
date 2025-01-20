@interface ICCollaborationRemoveCollaboratorsRequest
- (ICCollaborationRemoveCollaboratorsRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 socialProfileIDs:(id)a5;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationRemoveCollaboratorsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfileIDs, 0);

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
    v7 = [[ICCollaborationRemoveCollaboratorsResponseParserDelegate alloc] initWithResponse:v3];
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (ICCollaborationRemoveCollaboratorsRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4 socialProfileIDs:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSString stringWithFormat:@"databases/%u/collaboration", v7];
  v15.receiver = self;
  v15.super_class = (Class)ICCollaborationRemoveCollaboratorsRequest;
  v12 = [(ICDRequest *)&v15 initWithAction:v11];

  if (v12)
  {
    [(ICDRequest *)v12 setMethod:1];
    objc_storeStrong((id *)&v12->_globalPlaylistID, a4);
    objc_storeStrong((id *)&v12->_socialProfileIDs, a5);
    v13 = [(ICCollaborationRemoveCollaboratorsRequest *)v12 _requestBody];
    [(ICDRequest *)v12 setBodyData:v13];
  }
  return v12;
}

@end