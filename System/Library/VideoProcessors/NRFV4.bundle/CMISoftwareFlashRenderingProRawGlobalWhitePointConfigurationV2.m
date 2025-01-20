@interface CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2
- (CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2)init;
- (unsigned)thumbnailSpatialWhitePointsHeight;
- (unsigned)thumbnailSpatialWhitePointsWidth;
- (void)setThumbnailSpatialWhitePointsHeight:(unsigned int)a3;
- (void)setThumbnailSpatialWhitePointsWidth:(unsigned int)a3;
@end

@implementation CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2

- (CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2;
  result = [(CMISoftwareFlashRenderingProRawGlobalWhitePointConfigurationV2 *)&v3 init];
  if (result) {
    *(void *)&result->_thumbnailSpatialWhitePointsWidth = 0x1800000020;
  }
  return result;
}

- (unsigned)thumbnailSpatialWhitePointsWidth
{
  return self->_thumbnailSpatialWhitePointsWidth;
}

- (void)setThumbnailSpatialWhitePointsWidth:(unsigned int)a3
{
  self->_thumbnailSpatialWhitePointsWidth = a3;
}

- (unsigned)thumbnailSpatialWhitePointsHeight
{
  return self->_thumbnailSpatialWhitePointsHeight;
}

- (void)setThumbnailSpatialWhitePointsHeight:(unsigned int)a3
{
  self->_thumbnailSpatialWhitePointsHeight = a3;
}

@end