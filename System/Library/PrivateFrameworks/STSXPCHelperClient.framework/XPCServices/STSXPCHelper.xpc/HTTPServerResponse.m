@interface HTTPServerResponse
- (HTTPServerResponse)initWithResponse:(id)a3;
- (HTTPServerResponse)initWithResponse:(id)a3 bodyData:(id)a4;
- (HTTPServerResponse)initWithResponse:(id)a3 bodyStream:(id)a4;
- (NSData)bodyData;
- (NSHTTPURLResponse)response;
- (NSInputStream)bodyStream;
- (int64_t)bodyType;
@end

@implementation HTTPServerResponse

- (HTTPServerResponse)initWithResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HTTPServerResponse;
  v6 = [(HTTPServerResponse *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_response, a3);
    v7->_bodyType = 0;
  }

  return v7;
}

- (HTTPServerResponse)initWithResponse:(id)a3 bodyData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HTTPServerResponse;
  objc_super v9 = [(HTTPServerResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_response, a3);
    v10->_bodyType = 1;
    objc_storeStrong((id *)&v10->_bodyData, a4);
  }

  return v10;
}

- (HTTPServerResponse)initWithResponse:(id)a3 bodyStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HTTPServerResponse;
  objc_super v9 = [(HTTPServerResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_response, a3);
    v10->_bodyType = 2;
    objc_storeStrong((id *)&v10->_bodyStream, a4);
  }

  return v10;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (int64_t)bodyType
{
  return self->_bodyType;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (NSInputStream)bodyStream
{
  return self->_bodyStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyStream, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end