@interface MSDSessionTaskInfo
- (BOOL)isValid;
- (NSData)postData;
- (NSMutableURLRequest)request;
- (NSString)postFile;
- (NSString)savePath;
- (id)description;
- (id)handler;
- (int64_t)maxRetry;
- (void)setHandler:(id)a3;
- (void)setMaxRetry:(int64_t)a3;
- (void)setPostData:(id)a3;
- (void)setPostFile:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSavePath:(id)a3;
@end

@implementation MSDSessionTaskInfo

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MSDSessionTaskInfo *)self request];
  v6 = +[NSString stringWithFormat:@"<%@: request=%@>", v4, v5];

  return v6;
}

- (BOOL)isValid
{
  return 1;
}

- (int64_t)maxRetry
{
  return self->_maxRetry;
}

- (void)setMaxRetry:(int64_t)a3
{
  self->_maxRetry = a3;
}

- (NSString)savePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSavePath:(id)a3
{
}

- (NSData)postData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPostData:(id)a3
{
}

- (NSString)postFile
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPostFile:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHandler:(id)a3
{
}

- (NSMutableURLRequest)request
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_postFile, 0);
  objc_storeStrong((id *)&self->_postData, 0);

  objc_storeStrong((id *)&self->_savePath, 0);
}

@end