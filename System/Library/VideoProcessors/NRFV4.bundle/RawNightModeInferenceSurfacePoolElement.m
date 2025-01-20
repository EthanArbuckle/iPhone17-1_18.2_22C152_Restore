@interface RawNightModeInferenceSurfacePoolElement
- (MTLTexture)texture;
- (NSDictionary)elementMetadata;
- (__CVBuffer)pixelBuffer;
- (__IOSurface)iosurface;
- (void)dealloc;
- (void)setElementMetadata:(id)a3;
- (void)setIosurface:(__IOSurface *)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setTexture:(id)a3;
@end

@implementation RawNightModeInferenceSurfacePoolElement

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)RawNightModeInferenceSurfacePoolElement;
  [(RawNightModeInferenceSurfacePoolElement *)&v3 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (__IOSurface)iosurface
{
  return self->_iosurface;
}

- (void)setIosurface:(__IOSurface *)a3
{
  self->_iosurface = a3;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
}

- (NSDictionary)elementMetadata
{
  return self->_elementMetadata;
}

- (void)setElementMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementMetadata, 0);

  objc_storeStrong((id *)&self->_texture, 0);
}

@end