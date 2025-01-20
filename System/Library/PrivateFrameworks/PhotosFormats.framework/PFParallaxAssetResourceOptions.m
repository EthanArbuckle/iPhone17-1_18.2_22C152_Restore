@interface PFParallaxAssetResourceOptions
- (BOOL)aspectFit;
- (BOOL)networkAccessAllowed;
- (CGSize)imageSize;
- (OS_dispatch_queue)resultHandlerQueue;
- (id)canHandleAdjustmentData;
- (id)downloadProgressHandler;
- (int64_t)priority;
- (void)setAspectFit:(BOOL)a3;
- (void)setCanHandleAdjustmentData:(id)a3;
- (void)setDownloadProgressHandler:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setResultHandlerQueue:(id)a3;
@end

@implementation PFParallaxAssetResourceOptions

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);

  objc_storeStrong(&self->_canHandleAdjustmentData, 0);
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)networkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setDownloadProgressHandler:(id)a3
{
}

- (id)downloadProgressHandler
{
  return self->_downloadProgressHandler;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (void)setCanHandleAdjustmentData:(id)a3
{
}

- (id)canHandleAdjustmentData
{
  return self->_canHandleAdjustmentData;
}

- (void)setAspectFit:(BOOL)a3
{
  self->_aspectFit = a3;
}

- (BOOL)aspectFit
{
  return self->_aspectFit;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end