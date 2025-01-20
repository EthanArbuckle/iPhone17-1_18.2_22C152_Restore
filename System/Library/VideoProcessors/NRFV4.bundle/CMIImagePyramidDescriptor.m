@interface CMIImagePyramidDescriptor
- (BOOL)_isValidWithLogError:(BOOL)a3;
- (BOOL)isValid;
- (CMIImagePyramidDescriptor)init;
- (unint64_t)height;
- (unint64_t)levelCount;
- (unint64_t)type;
- (unint64_t)width;
- (void)setHeight:(unint64_t)a3;
- (void)setLevelCount:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation CMIImagePyramidDescriptor

- (CMIImagePyramidDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMIImagePyramidDescriptor;
  v2 = [(CMIImagePyramidDescriptor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CMIImagePyramidDescriptor *)v2 setWidth:0];
    [(CMIImagePyramidDescriptor *)v3 setHeight:0];
    [(CMIImagePyramidDescriptor *)v3 setType:0];
    [(CMIImagePyramidDescriptor *)v3 setLevelCount:0];
    v4 = v3;
  }

  return v3;
}

- (BOOL)_isValidWithLogError:(BOOL)a3
{
  if (![(CMIImagePyramidDescriptor *)self levelCount]
    || [(CMIImagePyramidDescriptor *)self type] > 1
    || ![(CMIImagePyramidDescriptor *)self width]
    || ![(CMIImagePyramidDescriptor *)self height])
  {
    return 0;
  }
  unint64_t v4 = [(CMIImagePyramidDescriptor *)self width];
  unint64_t v5 = [(CMIImagePyramidDescriptor *)self height];
  if ([(CMIImagePyramidDescriptor *)self levelCount] < 2) {
    return 1;
  }
  unint64_t v6 = 1;
  do
  {
    BOOL v7 = ((v4 | v5) & 1) == 0;
    if ((v4 | v5)) {
      break;
    }
    v4 >>= 1;
    v5 >>= 1;
    ++v6;
  }
  while ([(CMIImagePyramidDescriptor *)self levelCount] > v6);
  return v7;
}

- (BOOL)isValid
{
  return [(CMIImagePyramidDescriptor *)self _isValidWithLogError:0];
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)levelCount
{
  return self->_levelCount;
}

- (void)setLevelCount:(unint64_t)a3
{
  self->_levelCount = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end