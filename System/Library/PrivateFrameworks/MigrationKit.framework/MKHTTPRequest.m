@interface MKHTTPRequest
- (BOOL)chunkedTransferCompleted;
- (MKHTTPHeaders)headers;
- (MKHTTPParameters)parameters;
- (MKHTTPRequest)initWithHeaders:(id)a3 body:(id)a4 hostname:(id)a5;
- (NSData)chunk;
- (NSMutableData)body;
- (NSString)hostname;
- (unint64_t)chunkOffset;
- (void)appendData:(id)a3;
- (void)setBody:(id)a3;
- (void)setChunk:(id)a3;
- (void)setChunkOffset:(unint64_t)a3;
- (void)setChunkedTransferCompleted:(BOOL)a3;
- (void)setHeaders:(id)a3;
- (void)setHostname:(id)a3;
- (void)setParameters:(id)a3;
- (void)sliceData:(unint64_t)a3;
@end

@implementation MKHTTPRequest

- (MKHTTPRequest)initWithHeaders:(id)a3 body:(id)a4 hostname:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKHTTPRequest;
  v11 = [(MKHTTPRequest *)&v18 init];
  v12 = v11;
  if (v11)
  {
    [(MKHTTPRequest *)v11 setHeaders:v8];
    v13 = [MKHTTPParameters alloc];
    v14 = [v8 query];
    v15 = [(MKHTTPParameters *)v13 initWithDictionary:v14];
    [(MKHTTPRequest *)v12 setParameters:v15];

    [(MKHTTPRequest *)v12 setHostname:v10];
    id v16 = objc_alloc_init(MEMORY[0x263EFF990]);
    [(MKHTTPRequest *)v12 setBody:v16];

    if ([v9 length]) {
      [(NSMutableData *)v12->_body appendData:v9];
    }
  }

  return v12;
}

- (void)appendData:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(NSMutableData *)self->_body appendData:v4];
  }
}

- (void)sliceData:(unint64_t)a3
{
  id v8 = objc_alloc_init(MEMORY[0x263EFF990]);
  NSUInteger v5 = [(NSMutableData *)self->_body length];
  NSUInteger v6 = v5 - a3;
  if (v5 != a3)
  {
    v7 = -[NSMutableData subdataWithRange:](self->_body, "subdataWithRange:", a3, v6);
    [v8 appendData:v7];
  }
  -[MKHTTPRequest setBody:](self, "setBody:", v8, v6);
}

- (BOOL)chunkedTransferCompleted
{
  return self->_chunkedTransferCompleted;
}

- (void)setChunkedTransferCompleted:(BOOL)a3
{
  self->_chunkedTransferCompleted = a3;
}

- (unint64_t)chunkOffset
{
  return self->_chunkOffset;
}

- (void)setChunkOffset:(unint64_t)a3
{
  self->_chunkOffset = a3;
}

- (MKHTTPHeaders)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (MKHTTPParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSMutableData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSData)chunk
{
  return self->_chunk;
}

- (void)setChunk:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_chunk, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end