@interface REHTTPRequest
- (NSData)bodyData;
- (NSDictionary)headerFields;
- (NSInputStream)stream;
- (NSString)method;
- (NSURL)url;
- (REHTTPConnection)connection;
- (REHTTPRequest)initWithConnect:(id)a3 request:(_CFHTTPServerRequest *)a4;
- (_CFHTTPServerRequest)request;
- (id)responseWithStatusCode:(int64_t)a3;
- (void)appendData:(id)a3;
- (void)dealloc;
@end

@implementation REHTTPRequest

- (REHTTPRequest)initWithConnect:(id)a3 request:(_CFHTTPServerRequest *)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)REHTTPRequest;
  v8 = [(REHTTPRequest *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_request = (_CFHTTPServerRequest *)CFRetain(a4);
    uint64_t v10 = _CFHTTPServerRequestCopyProperty();
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    uint64_t v12 = _CFHTTPServerRequestCopyProperty();
    method = v9->_method;
    v9->_method = (NSString *)v12;

    v14 = (void *)_CFHTTPServerRequestCopyProperty();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v15 = [v14 objectForKey:*MEMORY[0x263EFC658]];
      headerFields = v9->_headerFields;
      v9->_headerFields = (NSDictionary *)v15;
    }
    else
    {
      headerFields = v9->_headerFields;
      v9->_headerFields = (NSDictionary *)MEMORY[0x263EFFA78];
    }

    uint64_t v17 = _CFHTTPServerRequestCopyBodyStream();
    stream = v9->_stream;
    v9->_stream = (NSInputStream *)v17;

    uint64_t v19 = [MEMORY[0x263EFF990] data];
    bodyData = v9->_bodyData;
    v9->_bodyData = (NSMutableData *)v19;
  }
  return v9;
}

- (void)dealloc
{
  request = self->_request;
  if (request)
  {
    CFRelease(request);
    self->_request = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)REHTTPRequest;
  [(REHTTPRequest *)&v4 dealloc];
}

- (id)responseWithStatusCode:(int64_t)a3
{
  v3 = [[REHTTPResponse alloc] initWithRequest:self statusCode:a3];
  return v3;
}

- (NSData)bodyData
{
  v2 = (void *)[(NSMutableData *)self->_bodyData copy];
  return (NSData *)v2;
}

- (void)appendData:(id)a3
{
}

- (NSInputStream)stream
{
  return self->_stream;
}

- (REHTTPConnection)connection
{
  return self->_connection;
}

- (NSString)method
{
  return self->_method;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (_CFHTTPServerRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end