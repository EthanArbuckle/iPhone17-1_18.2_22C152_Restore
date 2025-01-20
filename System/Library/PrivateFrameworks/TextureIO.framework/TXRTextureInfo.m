@interface TXRTextureInfo
- (BOOL)cubemap;
- (NSError)error;
- (__n128)dimensions;
- (unint64_t)alphaInfo;
- (unint64_t)arrayLength;
- (unint64_t)mipmapLevelCount;
- (unint64_t)pixelFormat;
- (void)setAlphaInfo:(unint64_t)a3;
- (void)setArrayLength:(unint64_t)a3;
- (void)setCubemap:(BOOL)a3;
- (void)setDimensions:(TXRTextureInfo *)self;
- (void)setMipmapLevelCount:(unint64_t)a3;
- (void)setPixelFormat:(unint64_t)a3;
@end

@implementation TXRTextureInfo

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void)setAlphaInfo:(unint64_t)a3
{
  self->_alphaInfo = a3;
}

- (__n128)dimensions
{
  return a1[2];
}

- (void)setDimensions:(TXRTextureInfo *)self
{
  *(_OWORD *)self->_dimensions = v2;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (void)setMipmapLevelCount:(unint64_t)a3
{
  self->_mipmapLevelCount = a3;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (void)setArrayLength:(unint64_t)a3
{
  self->_arrayLength = a3;
}

- (BOOL)cubemap
{
  return self->_cubemap;
}

- (void)setCubemap:(BOOL)a3
{
  self->_cubemap = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
}

@end