@interface TSUDownloadTaskProgress
- (BOOL)isActive;
- (id)description;
- (int64_t)totalBytesDownloaded;
- (int64_t)totalBytesExpectedToBeDownloaded;
- (void)setIsActive:(BOOL)a3;
- (void)setTotalBytesDownloaded:(int64_t)a3;
- (void)setTotalBytesExpectedToBeDownloaded:(int64_t)a3;
@end

@implementation TSUDownloadTaskProgress

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)TSUDownloadTaskProgress;
  v4 = [(TSUDownloadTaskProgress *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ \"%lld of %lld\"", v4, self->_totalBytesDownloaded, self->_totalBytesExpectedToBeDownloaded];

  return v5;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (int64_t)totalBytesDownloaded
{
  return self->_totalBytesDownloaded;
}

- (void)setTotalBytesDownloaded:(int64_t)a3
{
  self->_totalBytesDownloaded = a3;
}

- (int64_t)totalBytesExpectedToBeDownloaded
{
  return self->_totalBytesExpectedToBeDownloaded;
}

- (void)setTotalBytesExpectedToBeDownloaded:(int64_t)a3
{
  self->_totalBytesExpectedToBeDownloaded = a3;
}

@end