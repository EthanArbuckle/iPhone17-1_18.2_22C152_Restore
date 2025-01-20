@interface TVPResourceLoadingRequest
- (AVAssetResourceLoadingRequest)loadingRequest;
- (BOOL)isCancelled;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)avRequestID;
- (NSURL)URL;
- (TVPResourceLoadingRequest)init;
- (TVPResourceLoadingRequest)initWithAssetResourceLoadingRequest:(id)a3;
- (void)finishLoadingWithError:(id)a3;
- (void)finishLoadingWithResponse:(id)a3 data:(id)a4 renewalDate:(id)a5 redirect:(id)a6;
- (void)finishLoadingWithResponseData:(id)a3 renewalDate:(id)a4 keyType:(int64_t)a5;
@end

@implementation TVPResourceLoadingRequest

- (TVPResourceLoadingRequest)initWithAssetResourceLoadingRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPResourceLoadingRequest;
  v6 = [(TVPResourceLoadingRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_loadingRequest, a3);
  }

  return v7;
}

- (NSURL)URL
{
  v2 = [(TVPResourceLoadingRequest *)self loadingRequest];
  v3 = [v2 request];
  v4 = [v3 URL];

  return (NSURL *)v4;
}

- (BOOL)isCancelled
{
  v2 = [(TVPResourceLoadingRequest *)self loadingRequest];
  char v3 = [v2 isCancelled];

  return v3;
}

- (void)finishLoadingWithResponse:(id)a3 data:(id)a4 renewalDate:(id)a5 redirect:(id)a6
{
  loadingRequest = self->_loadingRequest;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  [(AVAssetResourceLoadingRequest *)loadingRequest setResponse:a3];
  [(AVAssetResourceLoadingRequest *)self->_loadingRequest setRedirect:v11];

  v14 = [(AVAssetResourceLoadingRequest *)self->_loadingRequest contentInformationRequest];
  [v14 setRenewalDate:v12];

  v15 = [(AVAssetResourceLoadingRequest *)self->_loadingRequest dataRequest];
  [v15 respondWithData:v13];

  v16 = self->_loadingRequest;
  [(AVAssetResourceLoadingRequest *)v16 finishLoading];
}

- (void)finishLoadingWithResponseData:(id)a3 renewalDate:(id)a4 keyType:(int64_t)a5
{
  if (a5 == 1)
  {
    v8 = (id *)MEMORY[0x263EFA1A0];
    goto LABEL_5;
  }
  if (a5 == 2)
  {
    v8 = (id *)MEMORY[0x263EFA1A8];
LABEL_5:
    id v18 = *v8;
    goto LABEL_7;
  }
  id v18 = 0;
LABEL_7:
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TVPResourceLoadingRequest *)self loadingRequest];
  id v12 = [v11 contentInformationRequest];
  [v12 setContentType:v18];

  id v13 = [(TVPResourceLoadingRequest *)self loadingRequest];
  v14 = [v13 contentInformationRequest];
  [v14 setRenewalDate:v9];

  v15 = [(TVPResourceLoadingRequest *)self loadingRequest];
  v16 = [v15 dataRequest];
  [v16 respondWithData:v10];

  v17 = [(TVPResourceLoadingRequest *)self loadingRequest];
  [v17 finishLoading];
}

- (void)finishLoadingWithError:(id)a3
{
}

- (NSNumber)avRequestID
{
  v2 = [(TVPResourceLoadingRequest *)self dictionaryRepresentation];
  char v3 = objc_msgSend(v2, "tvp_numberForKey:", @"FCUP_Response_RequestID");

  return (NSNumber *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [(AVAssetResourceLoadingRequest *)self->_loadingRequest serializableRepresentation];
  char v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (TVPResourceLoadingRequest)init
{
  return 0;
}

- (AVAssetResourceLoadingRequest)loadingRequest
{
  return self->_loadingRequest;
}

- (void).cxx_destruct
{
}

@end