@interface IMImageCacheObject
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (BOOL)persistedToDisk;
- (CGSize)imageSize;
- (IMImageCacheObject)initWithImageRefs:(id)a3 imageSize:(CGSize)a4;
- (NSArray)imageRefs;
- (void)setImageRefs:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setPersistedToDisk:(BOOL)a3;
@end

@implementation IMImageCacheObject

- (IMImageCacheObject)initWithImageRefs:(id)a3 imageSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMImageCacheObject;
  v8 = [(IMImageCacheObject *)&v12 init];
  if (v8)
  {
    v9 = (NSArray *)[v7 copy];
    imageRefs = v8->_imageRefs;
    v8->_imageRefs = v9;

    v8->_imageSize.CGFloat width = width;
    v8->_imageSize.CGFloat height = height;
  }

  return v8;
}

- (BOOL)beginContentAccess
{
  return 1;
}

- (BOOL)isContentDiscarded
{
  return [(IMImageCacheObject *)self persistedToDisk];
}

- (NSArray)imageRefs
{
  return self->_imageRefs;
}

- (void)setImageRefs:(id)a3
{
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (BOOL)persistedToDisk
{
  return self->_persistedToDisk;
}

- (void)setPersistedToDisk:(BOOL)a3
{
  self->_persistedToDisk = a3;
}

- (void).cxx_destruct
{
}

@end