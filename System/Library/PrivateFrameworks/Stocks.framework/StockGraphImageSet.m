@interface StockGraphImageSet
- (UIImage)highlightOverlayImage;
- (UIImage)lineGraphImage;
- (UIImage)volumeGraphImage;
- (void)setHighlightOverlayImage:(id)a3;
- (void)setLineGraphImage:(id)a3;
- (void)setVolumeGraphImage:(id)a3;
@end

@implementation StockGraphImageSet

- (UIImage)lineGraphImage
{
  return self->_lineGraphImage;
}

- (void)setLineGraphImage:(id)a3
{
}

- (UIImage)highlightOverlayImage
{
  return self->_highlightOverlayImage;
}

- (void)setHighlightOverlayImage:(id)a3
{
}

- (UIImage)volumeGraphImage
{
  return self->_volumeGraphImage;
}

- (void)setVolumeGraphImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeGraphImage, 0);
  objc_storeStrong((id *)&self->_highlightOverlayImage, 0);

  objc_storeStrong((id *)&self->_lineGraphImage, 0);
}

@end