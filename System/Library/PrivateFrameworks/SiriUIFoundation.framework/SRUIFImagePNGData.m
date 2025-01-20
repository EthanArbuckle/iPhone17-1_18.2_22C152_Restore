@interface SRUIFImagePNGData
- (NSData)imageData;
- (double)scale;
- (void)setImageData:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation SRUIFImagePNGData

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
}

@end