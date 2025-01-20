@interface MRAssetPlayerOptions
- (BOOL)isEmbeddedAsset;
- (BOOL)isForExport;
- (BOOL)isStill;
- (BOOL)thumbnailIsOK;
- (BOOL)wantsMipmap;
- (BOOL)wantsMonochromatic;
- (BOOL)wantsPowerOfTwo;
- (CGSize)resolutionIfEmbeddedAsset;
- (MRAssetPlayerOptions)init;
- (MRImage)initialImage;
- (double)introDuration;
- (double)mainDuration;
- (double)outroDuration;
- (double)stillTime;
- (id)playerHint;
- (void)dealloc;
- (void)setInitialImage:(id)a3;
- (void)setIntroDuration:(double)a3;
- (void)setIsForExport:(BOOL)a3;
- (void)setMainDuration:(double)a3;
- (void)setOutroDuration:(double)a3;
- (void)setPlayerHint:(id)a3;
- (void)setResolutionIfEmbeddedAsset:(CGSize)a3;
- (void)setStillTime:(double)a3;
- (void)setThumbnailIsOK:(BOOL)a3;
- (void)setWantsMipmap:(BOOL)a3;
- (void)setWantsMonochromatic:(BOOL)a3;
- (void)setWantsPowerOfTwo:(BOOL)a3;
@end

@implementation MRAssetPlayerOptions

- (MRAssetPlayerOptions)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRAssetPlayerOptions;
  result = [(MRAssetPlayerOptions *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    result->_resolutionIfEmbeddedAsset = _Q0;
    result->_stillTime = -1.0;
  }
  return result;
}

- (void)dealloc
{
  [(MRImage *)self->_initialImage releaseByUser];
  self->_initialImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRAssetPlayerOptions;
  [(MRAssetPlayerOptions *)&v3 dealloc];
}

- (BOOL)isEmbeddedAsset
{
  return self->_resolutionIfEmbeddedAsset.width >= 0.0;
}

- (BOOL)isStill
{
  return self->_stillTime >= 0.0;
}

- (MRImage)initialImage
{
  return self->_initialImage;
}

- (void)setInitialImage:(id)a3
{
  initialImage = self->_initialImage;
  if (initialImage != a3)
  {
    [(MRImage *)initialImage releaseByUser];
    self->_initialImage = (MRImage *)[a3 retainByUser];
  }
}

- (BOOL)wantsMonochromatic
{
  return self->_wantsMonochromatic;
}

- (void)setWantsMonochromatic:(BOOL)a3
{
  self->_wantsMonochromatic = a3;
}

- (BOOL)wantsMipmap
{
  return self->_wantsMipmap;
}

- (void)setWantsMipmap:(BOOL)a3
{
  self->_wantsMipmap = a3;
}

- (BOOL)wantsPowerOfTwo
{
  return self->_wantsPowerOfTwo;
}

- (void)setWantsPowerOfTwo:(BOOL)a3
{
  self->_wantsPowerOfTwo = a3;
}

- (BOOL)isForExport
{
  return self->_isForExport;
}

- (void)setIsForExport:(BOOL)a3
{
  self->_isForExport = a3;
}

- (BOOL)thumbnailIsOK
{
  return self->_thumbnailIsOK;
}

- (void)setThumbnailIsOK:(BOOL)a3
{
  self->_thumbnailIsOK = a3;
}

- (double)stillTime
{
  return self->_stillTime;
}

- (void)setStillTime:(double)a3
{
  self->_stillTime = a3;
}

- (CGSize)resolutionIfEmbeddedAsset
{
  double width = self->_resolutionIfEmbeddedAsset.width;
  double height = self->_resolutionIfEmbeddedAsset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setResolutionIfEmbeddedAsset:(CGSize)a3
{
  self->_resolutionIfEmbeddedAsset = a3;
}

- (id)playerHint
{
  return self->_playerHint;
}

- (void)setPlayerHint:(id)a3
{
  self->_playerHint = a3;
}

- (double)introDuration
{
  return self->_introDuration;
}

- (void)setIntroDuration:(double)a3
{
  self->_introDuration = a3;
}

- (double)mainDuration
{
  return self->_mainDuration;
}

- (void)setMainDuration:(double)a3
{
  self->_mainDuration = a3;
}

- (double)outroDuration
{
  return self->_outroDuration;
}

- (void)setOutroDuration:(double)a3
{
  self->_outroDuration = a3;
}

@end