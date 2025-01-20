@interface PLTile
- (BOOL)visible;
- (CGRect)imageRect;
- (__IOSurface)decodedSurface;
- (id)tileId;
- (void)dealloc;
- (void)setDecodedSurface:(__IOSurface *)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setTileId:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation PLTile

- (void)dealloc
{
  decodedSurface = self->_decodedSurface;
  if (decodedSurface)
  {
    IOSurfaceDecrementUseCount(decodedSurface);
    CFRelease(self->_decodedSurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLTile;
  [(PLTile *)&v4 dealloc];
}

- (id)tileId
{
  return self->_tileId;
}

- (void)setTileId:(id)a3
{
  if (self->_tileId != a3)
  {
    id v5 = a3;

    self->_tileId = a3;
  }
}

- (__IOSurface)decodedSurface
{
  return self->_decodedSurface;
}

- (void)setDecodedSurface:(__IOSurface *)a3
{
  decodedSurface = self->_decodedSurface;
  if (decodedSurface != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      decodedSurface = self->_decodedSurface;
    }
    if (decodedSurface)
    {
      IOSurfaceDecrementUseCount(decodedSurface);
      CFRelease(self->_decodedSurface);
    }
    self->_decodedSurface = a3;
  }
}

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
}

- (CGRect)imageRect
{
  double x = self->_imageRect.origin.x;
  double y = self->_imageRect.origin.y;
  double width = self->_imageRect.size.width;
  double height = self->_imageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

@end