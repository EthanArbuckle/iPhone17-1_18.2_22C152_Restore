@interface PXNewMagazineFrame
- (PXNewMagazineFrame)initWithWidth:(int64_t)a3 height:(int64_t)a4;
- (double)aspectRatio;
- (double)maxAspectRatio;
- (double)minAspectRatio;
- (id)description;
- (int64_t)height;
- (int64_t)numberOfTiles;
- (int64_t)width;
- (void)setAspectRatio:(double)a3;
- (void)setHeight:(int64_t)a3;
- (void)setMaxAspectRatio:(double)a3;
- (void)setMinAspectRatio:(double)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation PXNewMagazineFrame

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMinAspectRatio:(double)a3
{
  self->_minAspectRatio = a3;
}

- (double)minAspectRatio
{
  return self->_minAspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
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

- (id)description
{
  return (id)[NSString stringWithFormat:@"%lux%lu, asp: %.3f (%.3f ~ %.3f)", self->_width, self->_height, *(void *)&self->_aspectRatio, *(void *)&self->_minAspectRatio, *(void *)&self->_maxAspectRatio];
}

- (int64_t)numberOfTiles
{
  return self->_height * self->_width;
}

- (PXNewMagazineFrame)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXNewMagazineFrame;
  result = [(PXNewMagazineFrame *)&v7 init];
  if (result)
  {
    result->_width = a3;
    result->_height = a4;
  }
  return result;
}

@end