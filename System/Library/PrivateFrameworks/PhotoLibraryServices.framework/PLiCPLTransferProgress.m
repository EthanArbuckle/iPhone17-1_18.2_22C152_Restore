@interface PLiCPLTransferProgress
- (id)description;
- (unint64_t)notUploadedItemsCount;
- (unint64_t)notUploadedPhotosCount;
- (unint64_t)notUploadedVideosCount;
- (void)setNotUploadedItemsCount:(unint64_t)a3;
- (void)setNotUploadedPhotosCount:(unint64_t)a3;
- (void)setNotUploadedVideosCount:(unint64_t)a3;
@end

@implementation PLiCPLTransferProgress

- (void)setNotUploadedItemsCount:(unint64_t)a3
{
  self->_notUploadedItemsCount = a3;
}

- (unint64_t)notUploadedItemsCount
{
  return self->_notUploadedItemsCount;
}

- (void)setNotUploadedVideosCount:(unint64_t)a3
{
  self->_notUploadedVideosCount = a3;
}

- (unint64_t)notUploadedVideosCount
{
  return self->_notUploadedVideosCount;
}

- (void)setNotUploadedPhotosCount:(unint64_t)a3
{
  self->_notUploadedPhotosCount = a3;
}

- (unint64_t)notUploadedPhotosCount
{
  return self->_notUploadedPhotosCount;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"notUploadedPhotosCount: %llu notUploadedVideosCount: %llu notUploadedItemsCount %llu", self->_notUploadedPhotosCount, self->_notUploadedVideosCount, self->_notUploadedItemsCount);
}

@end