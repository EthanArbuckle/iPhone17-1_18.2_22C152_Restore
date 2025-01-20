@interface HTTPServerResponseRandom
- (HTTPServerResponseRandom)initWithLength:(unint64_t)a3;
- (HTTPServerResponseRandom)initWithMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4;
- (id)responseForRequest:(id)a3;
- (unint64_t)maxLen;
- (unint64_t)minLen;
@end

@implementation HTTPServerResponseRandom

- (HTTPServerResponseRandom)initWithLength:(unint64_t)a3
{
  return [(HTTPServerResponseRandom *)self initWithMinimumLength:a3 maximumLength:a3];
}

- (HTTPServerResponseRandom)initWithMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HTTPServerResponseRandom;
  v6 = [(HTTPServerResponseRandom *)&v10 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  if (v6->_maxLen >= v6->_minLen)
  {
    v6->_minLen = a3;
    v6->_maxLen = a4;
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (id)responseForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(HTTPServerResponseRandom *)self minLen];
  if (v5 == (void *)[(HTTPServerResponseRandom *)self maxLen])
  {
    minLen = (char *)self->_minLen;
  }
  else
  {
    uint32_t v7 = arc4random_uniform(LODWORD(self->_maxLen) - LODWORD(self->_minLen) + 1);
    minLen = (char *)[(HTTPServerResponseRandom *)self minLen] + v7;
  }
  v8 = malloc_type_malloc((size_t)minLen, 0x7ABED9F9uLL);
  if (v8)
  {
    v9 = v8;
    arc4random_buf(v8, (size_t)minLen);
    objc_super v10 = +[NSData dataWithBytesNoCopy:v9 length:minLen];
    v11 = +[NSMutableDictionary dictionaryWithCapacity:3];
    [v11 setObject:@"CFNetworkPPTServer-ResponseRandom" forKeyedSubscript:@"Server"];
    [v11 setObject:@"keep-alive" forKeyedSubscript:@"Connection"];
    v12 = +[NSNumber numberWithUnsignedInteger:minLen];
    v13 = [v12 stringValue];
    [v11 setObject:v13 forKeyedSubscript:@"Content-Length"];

    id v14 = objc_alloc((Class)NSHTTPURLResponse);
    v15 = [v4 URL];
    id v16 = [v14 initWithURL:v15 statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:v11];

    v17 = [[HTTPServerResponse alloc] initWithResponse:v16 bodyData:v10];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unint64_t)minLen
{
  return self->_minLen;
}

- (unint64_t)maxLen
{
  return self->_maxLen;
}

@end