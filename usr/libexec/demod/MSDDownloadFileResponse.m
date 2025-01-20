@interface MSDDownloadFileResponse
- (NSError)localHubError;
- (NSString)downloadSource;
- (int64_t)downloadedSize;
- (void)setDownloadSource:(id)a3;
- (void)setDownloadedSize:(int64_t)a3;
- (void)setLocalHubError:(id)a3;
@end

@implementation MSDDownloadFileResponse

- (NSError)localHubError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalHubError:(id)a3
{
}

- (NSString)downloadSource
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDownloadSource:(id)a3
{
}

- (int64_t)downloadedSize
{
  return self->_downloadedSize;
}

- (void)setDownloadedSize:(int64_t)a3
{
  self->_downloadedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadSource, 0);

  objc_storeStrong((id *)&self->_localHubError, 0);
}

@end