@interface SBSystemAperturePillImageView
- (CGSize)systemApertureSize;
- (void)setSystemApertureSize:(CGSize)a3;
@end

@implementation SBSystemAperturePillImageView

- (CGSize)systemApertureSize
{
  double width = self->_systemApertureSize.width;
  double height = self->_systemApertureSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSystemApertureSize:(CGSize)a3
{
  self->_systemApertureSize = a3;
}

@end