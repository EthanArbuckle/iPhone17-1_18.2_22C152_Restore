@interface PXImageAssetUIImageProvider
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
@end

@implementation PXImageAssetUIImageProvider

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v10 = a7;
  v11 = [a3 image];
  (*((void (**)(id, void *, void))a7 + 2))(v10, v11, 0);

  return (int)atomic_fetch_add(&self->_mediaRequestID, 1u);
}

@end