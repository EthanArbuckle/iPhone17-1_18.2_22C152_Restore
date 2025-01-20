@interface VUIDocumentUIConfigurationFormSheet
- (BOOL)isTapDismissable;
- (BOOL)prefersGrabberVisible;
- (CGSize)preferredSize;
- (NSArray)detents;
- (void)setDetents:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setPrefersGrabberVisible:(BOOL)a3;
- (void)setTapDismissable:(BOOL)a3;
@end

@implementation VUIDocumentUIConfigurationFormSheet

- (CGSize)preferredSize
{
  detents = self->_detents;
  double width = self->_preferredSize.width;
  result.height = width;
  result.double width = *(double *)&detents;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  *(CGSize *)&self->_detents = a3;
}

- (BOOL)isTapDismissable
{
  return *(&self->super._presentOnPresentingVC + 1);
}

- (void)setTapDismissable:(BOOL)a3
{
  *(&self->super._presentOnPresentingVC + 1) = a3;
}

- (BOOL)prefersGrabberVisible
{
  return *(&self->super._presentOnPresentingVC + 2);
}

- (void)setPrefersGrabberVisible:(BOOL)a3
{
  *(&self->super._presentOnPresentingVC + 2) = a3;
}

- (NSArray)detents
{
  return *(NSArray **)&self->_tapDismissable;
}

- (void)setDetents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end