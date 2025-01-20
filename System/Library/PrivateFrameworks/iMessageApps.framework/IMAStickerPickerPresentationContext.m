@interface IMAStickerPickerPresentationContext
- (BOOL)deferredPresentation;
- (CGRect)sourceRect;
- (IMSticker)stickerForDeferredRePresentation;
- (UIView)sourceView;
- (UIViewController)stickerPickerContainer;
- (unint64_t)style;
- (void)setDeferredPresentation:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setStickerForDeferredRePresentation:(id)a3;
- (void)setStickerPickerContainer:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation IMAStickerPickerPresentationContext

- (UIViewController)stickerPickerContainer
{
  return self->_stickerPickerContainer;
}

- (void)setStickerPickerContainer:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (IMSticker)stickerForDeferredRePresentation
{
  return self->_stickerForDeferredRePresentation;
}

- (void)setStickerForDeferredRePresentation:(id)a3
{
}

- (BOOL)deferredPresentation
{
  return self->_deferredPresentation;
}

- (void)setDeferredPresentation:(BOOL)a3
{
  self->_deferredPresentation = a3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerForDeferredRePresentation, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_stickerPickerContainer, 0);
}

@end