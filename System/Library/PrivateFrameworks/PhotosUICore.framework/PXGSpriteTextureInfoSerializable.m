@interface PXGSpriteTextureInfoSerializable
- ($3BA783FF50B239963188BE194EBFFEBA)spriteTextureInfo;
- (PXGSpriteTextureInfoSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setSpriteTextureInfo:(id)a3;
@end

@implementation PXGSpriteTextureInfoSerializable

- (void)setSpriteTextureInfo:(id)a3
{
  PXGSpriteTextureInfoSerializable v4 = *v3;
  PXGSpriteTextureInfoSerializable v5 = v3[1];
  PXGSpriteTextureInfoSerializable v6 = v3[3];
  self[3] = v3[2];
  self[4] = v6;
  self[1] = v4;
  self[2] = v5;
}

- ($3BA783FF50B239963188BE194EBFFEBA)spriteTextureInfo
{
  PXGSpriteTextureInfoSerializable v3 = self[2];
  PXGSpriteTextureInfoSerializable *v2 = self[1];
  v2[1] = v3;
  PXGSpriteTextureInfoSerializable v4 = self[3];
  PXGSpriteTextureInfoSerializable v5 = self[4];
  v2[2] = v4;
  v2[3] = v5;
  return ($3BA783FF50B239963188BE194EBFFEBA)v4.super.isa;
}

- (id)createSerializableObject
{
  [(PXGSpriteTextureInfoSerializable *)self spriteTextureInfo];
  v2 = PXGSerializeSpriteTextureInfo((uint64_t)&v4);
  return v2;
}

- (PXGSpriteTextureInfoSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGSpriteTextureInfoSerializable;
  PXGSpriteTextureInfoSerializable v5 = [(PXGSpriteTextureInfoSerializable *)&v8 init];
  if (v5)
  {
    PXGDeserializeSpriteTextureInfo(v4, (uint64_t)v7);
    [(PXGSpriteTextureInfoSerializable *)v5 setSpriteTextureInfo:v7];
  }

  return v5;
}

@end