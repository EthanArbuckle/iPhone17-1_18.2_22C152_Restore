@interface TXROptions
- (BOOL)cubemapFromVerticallyStackedImage;
- (BOOL)multiplyAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)colorSpaceHandling;
- (unint64_t)originOperation;
- (void)setColorSpaceHandling:(unint64_t)a3;
- (void)setCubemapFromVerticallyStackedImage:(BOOL)a3;
- (void)setMultiplyAlpha:(BOOL)a3;
- (void)setOriginOperation:(unint64_t)a3;
@end

@implementation TXROptions

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[TXROptions allocWithZone:a3] init];
  *((unsigned char *)result + 8) = self->_cubemapFromVerticallyStackedImage;
  *((void *)result + 2) = self->_originOperation;
  *((void *)result + 3) = self->_colorSpaceHandling;
  *((unsigned char *)result + 32) = self->_multiplyAlpha;
  return result;
}

- (BOOL)cubemapFromVerticallyStackedImage
{
  return self->_cubemapFromVerticallyStackedImage;
}

- (void)setCubemapFromVerticallyStackedImage:(BOOL)a3
{
  self->_cubemapFromVerticallyStackedImage = a3;
}

- (unint64_t)originOperation
{
  return self->_originOperation;
}

- (void)setOriginOperation:(unint64_t)a3
{
  self->_originOperation = a3;
}

- (unint64_t)colorSpaceHandling
{
  return self->_colorSpaceHandling;
}

- (void)setColorSpaceHandling:(unint64_t)a3
{
  self->_colorSpaceHandling = a3;
}

- (BOOL)multiplyAlpha
{
  return self->_multiplyAlpha;
}

- (void)setMultiplyAlpha:(BOOL)a3
{
  self->_multiplyAlpha = a3;
}

@end