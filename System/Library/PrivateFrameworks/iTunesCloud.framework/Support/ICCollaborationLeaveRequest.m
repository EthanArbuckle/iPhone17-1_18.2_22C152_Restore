@interface ICCollaborationLeaveRequest
- (ICCollaborationLeaveRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4;
- (id)_requestBody;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICCollaborationLeaveRequest

- (void).cxx_destruct
{
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
    v7 = [[ICCollaborationLeaveResponseParserDelegate alloc] initWithResponse:v3];
    [v6 setDelegate:v7];
    [v6 parse];
  }

  return v3;
}

- (ICCollaborationLeaveRequest)initWithDatabaseID:(unsigned int)a3 globalPlaylistID:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  v8 = +[NSString stringWithFormat:@"databases/%u/collaboration", v5];
  v12.receiver = self;
  v12.super_class = (Class)ICCollaborationLeaveRequest;
  v9 = [(ICDRequest *)&v12 initWithAction:v8];

  if (v9)
  {
    [(ICDRequest *)v9 setMethod:1];
    objc_storeStrong((id *)&v9->_globalPlaylistID, a4);
    v10 = [(ICCollaborationLeaveRequest *)v9 _requestBody];
    [(ICDRequest *)v9 setBodyData:v10];
  }
  return v9;
}

@end