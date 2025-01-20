@interface PKPassSnapshotCacheItem
- (PKPassSnapshotCacheItem)initWithCGImage:(CGImage *)a3 scale:(double)a4;
- (id)UIImageFromCache;
- (void)dealloc;
@end

@implementation PKPassSnapshotCacheItem

- (PKPassSnapshotCacheItem)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassSnapshotCacheItem;
  v6 = [(PKPassSnapshotCacheItem *)&v8 init];
  if (v6)
  {
    v6->_image = CGImageRetain(a3);
    v6->_scale = a4;
  }
  return v6;
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PKPassSnapshotCacheItem;
  [(PKPassSnapshotCacheItem *)&v3 dealloc];
}

- (id)UIImageFromCache
{
  return (id)[MEMORY[0x1E4FB1818] imageWithCGImage:self->_image scale:0 orientation:self->_scale];
}

@end