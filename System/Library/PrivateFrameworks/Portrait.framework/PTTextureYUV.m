@interface PTTextureYUV
- (BOOL)isRGB;
- (MTLTexture)texChroma;
- (MTLTexture)texLuma;
- (unint64_t)height;
- (unint64_t)width;
- (void)setTexChroma:(id)a3;
- (void)setTexLuma:(id)a3;
@end

@implementation PTTextureYUV

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texChroma, 0);

  objc_storeStrong((id *)&self->_texLuma, 0);
}

- (void)setTexLuma:(id)a3
{
}

- (void)setTexChroma:(id)a3
{
}

- (unint64_t)width
{
  return [(MTLTexture *)self->_texLuma width];
}

- (unint64_t)height
{
  return [(MTLTexture *)self->_texLuma height];
}

- (BOOL)isRGB
{
  return 0;
}

- (MTLTexture)texLuma
{
  return (MTLTexture *)objc_getProperty(self, a2, 48, 1);
}

- (MTLTexture)texChroma
{
  return (MTLTexture *)objc_getProperty(self, a2, 56, 1);
}

@end