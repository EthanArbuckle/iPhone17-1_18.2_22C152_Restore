@interface PUCropTransformedImageView
- ($5A0616AB7869379E861635CACF312FD6)imageModulationOptions;
- (BOOL)isDecelerating;
- (BOOL)isMuted;
- (BOOL)isTracking;
- (BOOL)shouldEnableImageModulation;
- (CGRect)_imageBounds;
- (CGRect)canvasFrame;
- (CGRect)cropRect;
- (CGSize)imageSize;
- (NUComposition)autoloopComposition;
- (NUComposition)videoComposition;
- (NUMediaView)videoMediaView;
- (PUCropTransformedImageViewDelegate)delegate;
- (UIImage)image;
- (double)pitchAngle;
- (double)straightenAngle;
- (double)yawAngle;
- (id)cropModel;
- (int64_t)orientation;
- (void)_setTracking:(BOOL)a3;
- (void)setAutoloopComposition:(id)a3;
- (void)setCanvasFrame:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageModulationOptions:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setModelCropRect:(CGRect)a3 viewCropRect:(CGRect)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setPitchAngle:(double)a3;
- (void)setShouldEnableImageModulation:(BOOL)a3;
- (void)setStraightenAngle:(double)a3;
- (void)setVideoComposition:(id)a3 withSeekTime:(id *)a4;
- (void)setVideoMediaView:(id)a3;
- (void)setYawAngle:(double)a3;
@end

@implementation PUCropTransformedImageView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_autoloopComposition, 0);
  objc_storeStrong((id *)&self->_videoMediaView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (BOOL)isDecelerating
{
  return self->_decelerating;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (void)setCanvasFrame:(CGRect)a3
{
  self->_canvasFrame = a3;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setYawAngle:(double)a3
{
  self->_yawAngle = a3;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (void)setPitchAngle:(double)a3
{
  self->_pitchAngle = a3;
}

- (double)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setStraightenAngle:(double)a3
{
  self->_straightenAngle = a3;
}

- (double)straightenAngle
{
  return self->_straightenAngle;
}

- (void)setDelegate:(id)a3
{
}

- (PUCropTransformedImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCropTransformedImageViewDelegate *)WeakRetained;
}

- (void)setShouldEnableImageModulation:(BOOL)a3
{
  self->_shouldEnableImageModulation = a3;
}

- (BOOL)shouldEnableImageModulation
{
  return self->_shouldEnableImageModulation;
}

- (void)setImageModulationOptions:(id)a3
{
  self->_imageModulationOptions = ($905D32049B9A80FAC5D7A68DC94C5166)a3;
}

- ($5A0616AB7869379E861635CACF312FD6)imageModulationOptions
{
  p_imageModulationOptions = &self->_imageModulationOptions;
  int64_t privateInteger = self->_imageModulationOptions.privateInteger;
  uint64_t v4 = *(void *)&p_imageModulationOptions->privateFloat;
  result.var1 = *(float *)&v4;
  result.var0 = privateInteger;
  return result;
}

- (NUComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setAutoloopComposition:(id)a3
{
}

- (NUComposition)autoloopComposition
{
  return self->_autoloopComposition;
}

- (void)setVideoMediaView:(id)a3
{
}

- (NUMediaView)videoMediaView
{
  return self->_videoMediaView;
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

- (UIImage)image
{
  return self->_image;
}

- (void)setVideoComposition:(id)a3 withSeekTime:(id *)a4
{
}

- (CGRect)canvasFrame
{
  p_canvasFrame = &self->_canvasFrame;
  if (CGRectIsEmpty(self->_canvasFrame))
  {
    [(PUCropTransformedImageView *)self bounds];
  }
  else
  {
    double x = p_canvasFrame->origin.x;
    double y = p_canvasFrame->origin.y;
    double width = p_canvasFrame->size.width;
    double height = p_canvasFrame->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_imageBounds
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PUCropTransformedImageView *)self imageSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.double height = v7;
  result.size.double width = v5;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)setImage:(id)a3
{
  double v4 = self;
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  double v4 = (PUCropTransformedImageView *)((char *)v4 + 488);
  [v5 size];
  double v7 = v6;
  uint64_t v9 = v8;

  v4->super.super.super.isa = v7;
  *(void *)&v4->super.super._responderFlags = v9;
}

- (BOOL)isMuted
{
  return 0;
}

- (void)setModelCropRect:(CGRect)a3 viewCropRect:(CGRect)a4
{
  self->_cropRect = a4;
}

- (id)cropModel
{
  return 0;
}

- (void)_setTracking:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUCropTransformedImageView *)self isTracking] != a3)
  {
    if (v3)
    {
      id v5 = [(PUCropTransformedImageView *)self delegate];
      [v5 cropTransformedImageViewWillBeginTracking:self];

      self->_tracking = 1;
    }
    else
    {
      self->_tracking = 0;
      id v6 = [(PUCropTransformedImageView *)self delegate];
      [v6 cropTransformedImageViewDidEndTracking:self];
    }
  }
}

@end