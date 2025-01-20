@interface _UIContextMenuGradientMaskingConfiguration
- (BOOL)backgroundMasksCorners;
- (BOOL)embedBackgroundForCompositing;
- (UIEdgeInsets)gradientMaskEdgeInsets;
- (UIEdgeInsets)gradientMaskLengths;
- (double)spacerHeaderFooterHeight;
- (id)platterHairlineColorProvider;
- (void)setBackgroundMasksCorners:(BOOL)a3;
- (void)setEmbedBackgroundForCompositing:(BOOL)a3;
- (void)setGradientMaskEdgeInsets:(UIEdgeInsets)a3;
- (void)setGradientMaskLengths:(UIEdgeInsets)a3;
- (void)setPlatterHairlineColorProvider:(id)a3;
- (void)setSpacerHeaderFooterHeight:(double)a3;
@end

@implementation _UIContextMenuGradientMaskingConfiguration

- (UIEdgeInsets)gradientMaskEdgeInsets
{
  double top = self->_gradientMaskEdgeInsets.top;
  double left = self->_gradientMaskEdgeInsets.left;
  double bottom = self->_gradientMaskEdgeInsets.bottom;
  double right = self->_gradientMaskEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientMaskEdgeInsets:(UIEdgeInsets)a3
{
  self->_gradientMaskEdgeInsets = a3;
}

- (UIEdgeInsets)gradientMaskLengths
{
  double top = self->_gradientMaskLengths.top;
  double left = self->_gradientMaskLengths.left;
  double bottom = self->_gradientMaskLengths.bottom;
  double right = self->_gradientMaskLengths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGradientMaskLengths:(UIEdgeInsets)a3
{
  self->_gradientMaskLengths = a3;
}

- (BOOL)embedBackgroundForCompositing
{
  return self->_embedBackgroundForCompositing;
}

- (void)setEmbedBackgroundForCompositing:(BOOL)a3
{
  self->_embedBackgroundForCompositing = a3;
}

- (BOOL)backgroundMasksCorners
{
  return self->_backgroundMasksCorners;
}

- (void)setBackgroundMasksCorners:(BOOL)a3
{
  self->_backgroundMasksCorners = a3;
}

- (id)platterHairlineColorProvider
{
  return self->_platterHairlineColorProvider;
}

- (void)setPlatterHairlineColorProvider:(id)a3
{
}

- (double)spacerHeaderFooterHeight
{
  return self->_spacerHeaderFooterHeight;
}

- (void)setSpacerHeaderFooterHeight:(double)a3
{
  self->_spacerHeaderFooterHeight = a3;
}

- (void).cxx_destruct
{
}

@end