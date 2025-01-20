@interface SXMediaExposureEvent
- (unint64_t)numberOfImages;
- (unint64_t)numberOfImagesExposed;
- (void)setNumberOfImages:(unint64_t)a3;
- (void)setNumberOfImagesExposed:(unint64_t)a3;
@end

@implementation SXMediaExposureEvent

- (unint64_t)numberOfImagesExposed
{
  return self->_numberOfImagesExposed;
}

- (void)setNumberOfImagesExposed:(unint64_t)a3
{
  self->_numberOfImagesExposed = a3;
}

- (unint64_t)numberOfImages
{
  return self->_numberOfImages;
}

- (void)setNumberOfImages:(unint64_t)a3
{
  self->_numberOfImages = a3;
}

@end