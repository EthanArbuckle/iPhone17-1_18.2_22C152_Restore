@interface PXLinkPresentationConfiguration
- (NSDate)earliestAssetDate;
- (NSDate)expirationDate;
- (NSDate)latestAssetDate;
- (PHAsset)keyAsset;
- (PXLinkPresentationConfiguration)initWithKeyAsset:(id)a3;
- (UIImage)placeholderImage;
- (unint64_t)otherItemCount;
- (unint64_t)photoCount;
- (unint64_t)videoCount;
- (void)setEarliestAssetDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setLatestAssetDate:(id)a3;
- (void)setOtherItemCount:(unint64_t)a3;
- (void)setPhotoCount:(unint64_t)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setVideoCount:(unint64_t)a3;
@end

@implementation PXLinkPresentationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_latestAssetDate, 0);
  objc_storeStrong((id *)&self->_earliestAssetDate, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

- (void)setPlaceholderImage:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setLatestAssetDate:(id)a3
{
}

- (NSDate)latestAssetDate
{
  return self->_latestAssetDate;
}

- (void)setEarliestAssetDate:(id)a3
{
}

- (NSDate)earliestAssetDate
{
  return self->_earliestAssetDate;
}

- (void)setOtherItemCount:(unint64_t)a3
{
  self->_otherItemCount = a3;
}

- (unint64_t)otherItemCount
{
  return self->_otherItemCount;
}

- (void)setVideoCount:(unint64_t)a3
{
  self->_videoCount = a3;
}

- (unint64_t)videoCount
{
  return self->_videoCount;
}

- (void)setPhotoCount:(unint64_t)a3
{
  self->_photoCount = a3;
}

- (unint64_t)photoCount
{
  return self->_photoCount;
}

- (void)setKeyAsset:(id)a3
{
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXLinkPresentationConfiguration)initWithKeyAsset:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXLinkPresentationActivityItemProvider.m", 30, @"Invalid parameter not satisfying: %@", @"keyAsset" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXLinkPresentationConfiguration;
  v7 = [(PXLinkPresentationConfiguration *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_keyAsset, a3);
  }

  return v8;
}

@end