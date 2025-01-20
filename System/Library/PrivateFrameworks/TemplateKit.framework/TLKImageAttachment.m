@interface TLKImageAttachment
- (BOOL)isPlaceholder;
- (CGSize)size;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TLKImageAttachment

- (void)setSize:(CGSize)a3
{
  if (a3.width != self->_size.width || a3.height != self->_size.height)
  {
    self->_size = a3;
    -[TLKImageAttachment setBounds:](self, "setBounds:", 0.0, 0.0);
  }
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

@end