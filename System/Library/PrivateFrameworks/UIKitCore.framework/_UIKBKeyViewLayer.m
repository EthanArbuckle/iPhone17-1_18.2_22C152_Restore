@interface _UIKBKeyViewLayer
- (int64_t)imageOrientation;
- (void)setImageOrientation:(int64_t)a3;
@end

@implementation _UIKBKeyViewLayer

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->_imageOrientation = a3;
}

@end