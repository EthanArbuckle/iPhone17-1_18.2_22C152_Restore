@interface MSDS3UploadRequest
- (MSDS3UploadRequest)init;
- (NSDictionary)httpHeaders;
- (NSString)logFilePath;
- (NSString)s3url;
- (int64_t)retryAttempts;
- (void)setHttpHeaders:(id)a3;
- (void)setLogFilePath:(id)a3;
- (void)setRetryAttempts:(int64_t)a3;
- (void)setS3url:(id)a3;
@end

@implementation MSDS3UploadRequest

- (MSDS3UploadRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDS3UploadRequest;
  v2 = [(MSDS3UploadRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSDS3UploadRequest *)v2 setS3url:0];
    [(MSDS3UploadRequest *)v3 setLogFilePath:0];
    [(MSDS3UploadRequest *)v3 setHttpHeaders:0];
    [(MSDS3UploadRequest *)v3 setRetryAttempts:0];
    v4 = v3;
  }

  return v3;
}

- (NSString)s3url
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setS3url:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHttpHeaders:(id)a3
{
}

- (NSString)logFilePath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogFilePath:(id)a3
{
}

- (int64_t)retryAttempts
{
  return self->_retryAttempts;
}

- (void)setRetryAttempts:(int64_t)a3
{
  self->_retryAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logFilePath, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);

  objc_storeStrong((id *)&self->_s3url, 0);
}

@end