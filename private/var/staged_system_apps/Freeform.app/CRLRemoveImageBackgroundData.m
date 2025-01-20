@interface CRLRemoveImageBackgroundData
- (CGImage)image;
- (CGPoint)offset;
- (NSError)error;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setImage:(CGImage *)a3;
- (void)setOffset:(CGPoint)a3;
@end

@implementation CRLRemoveImageBackgroundData

- (void)setImage:(CGImage *)a3
{
  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  self->_image = CGImageRetain(a3);
}

- (void)dealloc
{
  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLRemoveImageBackgroundData;
  [(CRLRemoveImageBackgroundData *)&v4 dealloc];
}

- (CGImage)image
{
  return self->_image;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end