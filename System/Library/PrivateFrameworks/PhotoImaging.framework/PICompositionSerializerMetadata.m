@interface PICompositionSerializerMetadata
- (int64_t)height;
- (int64_t)orientation;
- (int64_t)width;
- (void)setHeight:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation PICompositionSerializerMetadata

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)width
{
  return self->_width;
}

@end