@interface _BEWKWebViewPendingLoad
+ (id)pendingLoadWithRequest:(id)a3;
+ (id)pendingLoadWithRequest:(id)a3 response:(id)a4 data:(id)a5;
- (NSData)data;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (void)setData:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation _BEWKWebViewPendingLoad

+ (id)pendingLoadWithRequest:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_BEWKWebViewPendingLoad);
  [(_BEWKWebViewPendingLoad *)v4 setRequest:v3];

  return v4;
}

+ (id)pendingLoadWithRequest:(id)a3 response:(id)a4 data:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_BEWKWebViewPendingLoad);
  [(_BEWKWebViewPendingLoad *)v10 setRequest:v9];

  [(_BEWKWebViewPendingLoad *)v10 setResponse:v8];
  [(_BEWKWebViewPendingLoad *)v10 setData:v7];

  return v10;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end