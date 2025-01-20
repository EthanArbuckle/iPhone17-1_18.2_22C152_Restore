@interface MKHTTPResponse
- (MKHTTPHeaders)headers;
- (MKHTTPResponse)init;
- (NSData)body;
- (NSInputStream)bodyStream;
- (id)responseData;
- (void)setBody:(id)a3;
- (void)setBodyStream:(id)a3;
- (void)setHeaders:(id)a3;
@end

@implementation MKHTTPResponse

- (MKHTTPResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKHTTPResponse;
  v2 = [(MKHTTPResponse *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MKHTTPHeaders);
    [(MKHTTPResponse *)v2 setHeaders:v3];
  }
  return v2;
}

- (id)responseData
{
  body = self->_body;
  if (body) {
    [(MKHTTPHeaders *)self->_headers setContentLength:[(NSData *)body length]];
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
  objc_super v5 = [(MKHTTPHeaders *)self->_headers responseHeadersData];
  [v4 appendData:v5];

  if (self->_body) {
    objc_msgSend(v4, "appendData:");
  }
  return v4;
}

- (MKHTTPHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSInputStream)bodyStream
{
  return self->_bodyStream;
}

- (void)setBodyStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyStream, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end