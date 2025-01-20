@interface _PBUIImageSlotRepositoryEntry
- (CGSize)size;
- (IOSurface)ioSurface;
- (NSURL)url;
- (UIImage)image;
- (int64_t)actualStyle;
- (void)_setBlockSet:(CGImageBlockSet *)a3;
- (void)dealloc;
- (void)setActualStyle:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setUrl:(id)a3;
@end

@implementation _PBUIImageSlotRepositoryEntry

- (void)dealloc
{
  [(_PBUIImageSlotRepositoryEntry *)self _setBlockSet:0];
  v3.receiver = self;
  v3.super_class = (Class)_PBUIImageSlotRepositoryEntry;
  [(_PBUIImageSlotRepositoryEntry *)&v3 dealloc];
}

- (IOSurface)ioSurface
{
  p_id ioSurface = &self->_ioSurface;
  id ioSurface = self->_ioSurface;
  if (!ioSurface)
  {
    id ioSurface = self->_image;
    if (ioSurface)
    {
      uint64_t v7 = 0;
      v5 = PBUICreateIOSurfaceForImage(ioSurface, &v7, 1);
      if (v5)
      {
        objc_storeStrong((id *)p_ioSurface, v5);
        [(_PBUIImageSlotRepositoryEntry *)self _setBlockSet:v7];
      }
      if (v7) {
        CGImageBlockSetRelease();
      }

      id ioSurface = *p_ioSurface;
    }
  }
  return (IOSurface *)ioSurface;
}

- (void)_setBlockSet:(CGImageBlockSet *)a3
{
  blockSet = self->_blockSet;
  if (blockSet != a3)
  {
    CGImageBlockSetRetain();
    self->_blockSet = a3;
    if (blockSet)
    {
      CGImageBlockSetRelease();
    }
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)actualStyle
{
  return self->_actualStyle;
}

- (void)setActualStyle:(int64_t)a3
{
  self->_actualStyle = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_ioSurface, 0);
}

@end