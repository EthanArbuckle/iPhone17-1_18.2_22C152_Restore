@interface S3Content
- (BOOL)gzip;
- (NSData)content;
- (NSData)gzipContent;
- (NSString)bucket;
- (NSString)filename;
- (NSString)mimeType;
- (S3Content)initWithContent:(id)a3 filename:(id)a4 bucket:(id)a5 gzip:(BOOL)a6;
- (id)_gzipCompressData:(id)a3;
- (void)setBucket:(id)a3;
- (void)setContent:(id)a3;
- (void)setFilename:(id)a3;
- (void)setGzip:(BOOL)a3;
@end

@implementation S3Content

- (S3Content)initWithContent:(id)a3 filename:(id)a4 bucket:(id)a5 gzip:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)S3Content;
  v14 = [(S3Content *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_content, a3);
    objc_storeStrong((id *)&v15->_filename, a4);
    objc_storeStrong((id *)&v15->_bucket, a5);
    v15->_gzip = a6;
  }

  return v15;
}

- (NSString)mimeType
{
  if (self->_gzip) {
    return (NSString *)@"application/zlib";
  }
  else {
    return (NSString *)@"text/plain";
  }
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
  id v6 = a3;
  gzipContentCache = self->_gzipContentCache;
  self->_gzipContentCache = 0;
}

- (NSData)gzipContent
{
  if (self->_gzip && !self->_gzipContentCache)
  {
    v3 = [(S3Content *)self _gzipCompressData:self->_content];
    gzipContentCache = self->_gzipContentCache;
    self->_gzipContentCache = v3;
  }
  v5 = self->_gzipContentCache;

  return v5;
}

- (id)_gzipCompressData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableData);
  memset(&v7, 0, sizeof(v7));
  if (deflateInit2_(&v7, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    id v5 = 0;
  }
  else
  {
    v7.avail_in = [v3 length];
    v7.next_in = (Bytef *)[v3 bytes];
    do
    {
      v7.avail_out = 0x4000;
      v7.next_out = v8;
      deflate(&v7, 4);
      [v4 appendBytes:v8 length:0x4000 - v7.avail_out];
    }
    while (!v7.avail_out);
    deflateEnd(&v7);
    id v5 = v4;
  }

  return v5;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)bucket
{
  return self->_bucket;
}

- (void)setBucket:(id)a3
{
}

- (NSData)content
{
  return self->_content;
}

- (BOOL)gzip
{
  return self->_gzip;
}

- (void)setGzip:(BOOL)a3
{
  self->_gzip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_bucket, 0);
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_gzipContentCache, 0);
}

@end