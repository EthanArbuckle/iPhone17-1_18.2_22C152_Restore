@interface CVPixelBufferCacheItem
- (CGSize)fullSize;
- (CVPixelBufferCacheItem)initWithCVPixelBuffers:(id)a3 DODs:(id)a4 fullSize:(CGSize)a5 colorSpace:(id)a6;
- (NSArray)DODs;
- (NSArray)buffers;
- (PVColorSpace)colorSpace;
@end

@implementation CVPixelBufferCacheItem

- (CVPixelBufferCacheItem)initWithCVPixelBuffers:(id)a3 DODs:(id)a4 fullSize:(CGSize)a5 colorSpace:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CVPixelBufferCacheItem;
  v15 = [(CVPixelBufferCacheItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_buffers, a3);
    objc_storeStrong((id *)&v16->_DODs, a4);
    v16->_fullSize.CGFloat width = width;
    v16->_fullSize.CGFloat height = height;
    objc_storeStrong((id *)&v16->_colorSpace, a6);
  }

  return v16;
}

- (NSArray)buffers
{
  return self->_buffers;
}

- (NSArray)DODs
{
  return self->_DODs;
}

- (CGSize)fullSize
{
  double width = self->_fullSize.width;
  double height = self->_fullSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PVColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_DODs, 0);

  objc_storeStrong((id *)&self->_buffers, 0);
}

@end