@interface DeepFusionPrepareDescriptor
- (BOOL)cmiResourceEnabled;
- (int)height;
- (int)width;
- (void)setCmiResourceEnabled:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setWidth:(int)a3;
@end

@implementation DeepFusionPrepareDescriptor

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

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

@end