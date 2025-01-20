@interface SHStubbedNetworkRequester
- (NSData)requestData;
- (NSHTTPURLResponse)httpResponse;
- (NSURL)downloadFileURL;
- (SHStubbedNetworkRequester)initWithHTTPResponse:(id)a3 requestData:(id)a4 downloadFileURL:(id)a5;
- (void)downloadResourceFromRequest:(id)a3 completionHandler:(id)a4;
- (void)performRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation SHStubbedNetworkRequester

- (SHStubbedNetworkRequester)initWithHTTPResponse:(id)a3 requestData:(id)a4 downloadFileURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHStubbedNetworkRequester;
  v12 = [(SHStubbedNetworkRequester *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestData, a4);
    objc_storeStrong((id *)&v13->_downloadFileURL, a5);
    objc_storeStrong((id *)&v13->_httpResponse, a3);
  }

  return v13;
}

- (void)downloadResourceFromRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v8 = [(SHStubbedNetworkRequester *)self httpResponse];
  v7 = [(SHStubbedNetworkRequester *)self downloadFileURL];
  (*((void (**)(id, id, void *, void))a4 + 2))(v6, v8, v7, 0);
}

- (void)performRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v8 = [(SHStubbedNetworkRequester *)self httpResponse];
  v7 = [(SHStubbedNetworkRequester *)self requestData];
  (*((void (**)(id, id, void *, void))a4 + 2))(v6, v8, v7, 0);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (NSURL)downloadFileURL
{
  return self->_downloadFileURL;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_downloadFileURL, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end