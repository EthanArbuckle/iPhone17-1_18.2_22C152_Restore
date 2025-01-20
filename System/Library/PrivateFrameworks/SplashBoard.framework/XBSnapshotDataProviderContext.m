@interface XBSnapshotDataProviderContext
- (BOOL)isOpaque;
- (double)scale;
- (void)setOpaque:(BOOL)a3;
- (void)setScale:(double)a3;
@end

@implementation XBSnapshotDataProviderContext

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)a3
{
  self->_opaque = a3;
}

@end