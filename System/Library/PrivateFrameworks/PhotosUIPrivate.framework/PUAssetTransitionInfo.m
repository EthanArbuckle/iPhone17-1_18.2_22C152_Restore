@interface PUAssetTransitionInfo
+ (PUAssetTransitionInfo)assetTransitionInfoWithConfigurationBlock:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime;
- (BOOL)allowAutoPlay;
- (CGRect)frame;
- (NSArray)badgeTransitionInfos;
- (PUAssetTransitionInfo)assetTransitionInfoWithModifications:(id)a3;
- (PUAssetTransitionInfo)init;
- (PUDisplayAsset)asset;
- (PUPhotoViewContentHelper)contentHelper;
- (PXImageLayerModulator)imageLayerModulator;
- (UIImage)image;
- (UIView)snapshotView;
- (double)cornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_applyConfigurationBlock:(id)a3;
- (void)setAllowAutoPlay:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setBadgeTransitionInfos:(id)a3;
- (void)setContentHelper:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageLayerModulator:(id)a3;
- (void)setSeekTime:(id *)a3;
- (void)setSnapshotView:(id)a3;
@end

@implementation PUAssetTransitionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_storeStrong((id *)&self->_contentHelper, 0);
  objc_storeStrong((id *)&self->_badgeTransitionInfos, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

- (void)setImageLayerModulator:(id)a3
{
}

- (PXImageLayerModulator)imageLayerModulator
{
  return self->_imageLayerModulator;
}

- (void)setContentHelper:(id)a3
{
}

- (PUPhotoViewContentHelper)contentHelper
{
  return self->_contentHelper;
}

- (void)setBadgeTransitionInfos:(id)a3
{
}

- (NSArray)badgeTransitionInfos
{
  return self->_badgeTransitionInfos;
}

- (void)setAsset:(id)a3
{
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setAllowAutoPlay:(BOOL)a3
{
  self->_allowAutoPlay = a3;
}

- (BOOL)allowAutoPlay
{
  return self->_allowAutoPlay;
}

- (void)setSeekTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_seekTime.epoch = a3->var3;
  *(_OWORD *)&self->_seekTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setSnapshotView:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PUAssetTransitionInfo);
  v5 = [(PUAssetTransitionInfo *)self snapshotView];
  [(PUAssetTransitionInfo *)v4 setSnapshotView:v5];

  v6 = [(PUAssetTransitionInfo *)self image];
  [(PUAssetTransitionInfo *)v4 setImage:v6];

  [(PUAssetTransitionInfo *)self seekTime];
  long long v12 = v14;
  uint64_t v13 = v15;
  [(PUAssetTransitionInfo *)v4 setSeekTime:&v12];
  [(PUAssetTransitionInfo *)self frame];
  -[PUAssetTransitionInfo setFrame:](v4, "setFrame:");
  [(PUAssetTransitionInfo *)v4 setAllowAutoPlay:[(PUAssetTransitionInfo *)self allowAutoPlay]];
  [(PUAssetTransitionInfo *)self cornerRadius];
  -[PUAssetTransitionInfo setCornerRadius:](v4, "setCornerRadius:");
  v7 = [(PUAssetTransitionInfo *)self asset];
  [(PUAssetTransitionInfo *)v4 setAsset:v7];

  v8 = [(PUAssetTransitionInfo *)self badgeTransitionInfos];
  [(PUAssetTransitionInfo *)v4 setBadgeTransitionInfos:v8];

  v9 = [(PUAssetTransitionInfo *)self contentHelper];
  [(PUAssetTransitionInfo *)v4 setContentHelper:v9];

  v10 = [(PUAssetTransitionInfo *)self imageLayerModulator];
  [(PUAssetTransitionInfo *)v4 setImageLayerModulator:v10];

  return v4;
}

- (void)_applyConfigurationBlock:(id)a3
{
  (*((void (**)(id, PUAssetTransitionInfo *))a3 + 2))(a3, self);
  v4 = [(PUAssetTransitionInfo *)self snapshotView];
  if (v4 || ([(PUAssetTransitionInfo *)self image], (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    [(PUAssetTransitionInfo *)self frame];
    if (CGRectIsEmpty(v8) || ([(PUAssetTransitionInfo *)self frame], CGRectIsNull(v9)))
    {
      v5 = PXAssertGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Transition info is required to have either snapshot view, or image, or a valid, non-empty frame.", v6, 2u);
      }
    }
  }
}

- (PUAssetTransitionInfo)assetTransitionInfoWithModifications:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(PUAssetTransitionInfo *)self copy];
  [v5 _applyConfigurationBlock:v4];

  return (PUAssetTransitionInfo *)v5;
}

- (PUAssetTransitionInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)PUAssetTransitionInfo;
  CGRect result = [(PUAssetTransitionInfo *)&v4 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_seekTime.value = *MEMORY[0x1E4F1F9F8];
    result->_seekTime.epoch = *(void *)(v3 + 16);
  }
  return result;
}

+ (PUAssetTransitionInfo)assetTransitionInfoWithConfigurationBlock:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_opt_new();
  [v4 _applyConfigurationBlock:v3];

  return (PUAssetTransitionInfo *)v4;
}

@end