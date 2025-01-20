@interface PTTextureRGBA
- (BOOL)isRGB;
- (MTLTexture)texRGBA;
- (unint64_t)height;
- (unint64_t)width;
- (void)setTexRGBA:(id)a3;
@end

@implementation PTTextureRGBA

- (unint64_t)width
{
  return [(MTLTexture *)self->_texRGBA width];
}

- (unint64_t)height
{
  return [(MTLTexture *)self->_texRGBA height];
}

- (BOOL)isRGB
{
  return 1;
}

- (MTLTexture)texRGBA
{
  return (MTLTexture *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTexRGBA:(id)a3
{
}

- (void).cxx_destruct
{
}

@end