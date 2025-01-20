@interface PXPhotosHeaderCustomizationModel
- (BOOL)shouldUseTextStyles;
- (PXPhotosHeaderCustomizationModel)init;
- (double)alpha;
- (double)verticalFloatingOffset;
- (double)verticalVisibilityOffset;
- (int64_t)subtitleTextStyle;
- (int64_t)titleTextStyle;
- (void)setAlpha:(double)a3;
- (void)setShouldUseTextStyles:(BOOL)a3;
- (void)setVerticalFloatingOffset:(double)a3;
- (void)setVerticalVisibilityOffset:(double)a3;
@end

@implementation PXPhotosHeaderCustomizationModel

- (double)alpha
{
  return self->_alpha;
}

- (double)verticalFloatingOffset
{
  return self->_verticalFloatingOffset;
}

- (double)verticalVisibilityOffset
{
  return self->_verticalVisibilityOffset;
}

- (BOOL)shouldUseTextStyles
{
  return self->_shouldUseTextStyles;
}

- (int64_t)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (int64_t)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setShouldUseTextStyles:(BOOL)a3
{
  if (self->_shouldUseTextStyles != a3)
  {
    self->_shouldUseTextStyles = a3;
    [(PXPhotosHeaderCustomizationModel *)self signalChange:8];
  }
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    [(PXPhotosHeaderCustomizationModel *)self signalChange:4];
  }
}

- (void)setVerticalFloatingOffset:(double)a3
{
  if (self->_verticalFloatingOffset != a3)
  {
    self->_verticalFloatingOffset = a3;
    [(PXPhotosHeaderCustomizationModel *)self signalChange:2];
  }
}

- (void)setVerticalVisibilityOffset:(double)a3
{
  if (self->_verticalVisibilityOffset != a3)
  {
    self->_verticalVisibilityOffset = a3;
    [(PXPhotosHeaderCustomizationModel *)self signalChange:1];
  }
}

- (PXPhotosHeaderCustomizationModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosHeaderCustomizationModel;
  result = [(PXPhotosHeaderCustomizationModel *)&v3 init];
  if (result)
  {
    result->_alpha = 1.0;
    result->_titleTextStyle = 1;
    result->_subtitleTextStyle = 8;
    result->_shouldUseTextStyles = 0;
  }
  return result;
}

@end