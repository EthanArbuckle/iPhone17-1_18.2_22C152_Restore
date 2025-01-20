@interface _WBSPendingLPLinkMetadataRequest
- (BOOL)allowDelayedResponse;
- (WBSSiteMetadataRequest)request;
- (_WBSPendingLPLinkMetadataRequest)initWithRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
@end

@implementation _WBSPendingLPLinkMetadataRequest

- (_WBSPendingLPLinkMetadataRequest)initWithRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_WBSPendingLPLinkMetadataRequest;
  v8 = [(_WBSPendingLPLinkMetadataRequest *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_request, a3);
    v9->_allowDelayedResponse = a4;
    v10 = v9;
  }

  return v9;
}

- (WBSSiteMetadataRequest)request
{
  return self->_request;
}

- (BOOL)allowDelayedResponse
{
  return self->_allowDelayedResponse;
}

- (void).cxx_destruct
{
}

@end