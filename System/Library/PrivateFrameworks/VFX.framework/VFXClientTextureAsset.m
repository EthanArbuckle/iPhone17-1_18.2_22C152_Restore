@interface VFXClientTextureAsset
- (CGImage)CGImage;
- (MTLTexture)texture;
- (void)setCGImage:(CGImage *)a3;
- (void)setTexture:(id)a3;
@end

@implementation VFXClientTextureAsset

- (MTLTexture)texture
{
  uint64_t v4 = objc_msgSend_entityObject(self, a2, v2, v3);

  return (MTLTexture *)MEMORY[0x1F4181798](v4, sel_clientTexture, v5, v6);
}

- (void)setTexture:(id)a3
{
  uint64_t v5 = objc_msgSend_entityObject(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_setClientTexture_, a3, v6);
}

- (CGImage)CGImage
{
  uint64_t v4 = objc_msgSend_entityObject(self, a2, v2, v3);

  return (CGImage *)MEMORY[0x1F4181798](v4, sel_clientCGImage, v5, v6);
}

- (void)setCGImage:(CGImage *)a3
{
  uint64_t v5 = objc_msgSend_entityObject(self, a2, (uint64_t)a3, v3);

  MEMORY[0x1F4181798](v5, sel_setClientCGImage_, a3, v6);
}

@end