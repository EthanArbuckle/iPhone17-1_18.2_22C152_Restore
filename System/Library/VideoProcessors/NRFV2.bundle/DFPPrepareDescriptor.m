@interface DFPPrepareDescriptor
- (int)height;
- (int)width;
- (unsigned)pixelFormat;
- (void)setHeight:(int)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setWidth:(int)a3;
@end

@implementation DFPPrepareDescriptor

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

@end