@interface PXGSpriteInfoSerializable
- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfo;
- (PXGSpriteInfoSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setSpriteInfo:(id *)a3;
@end

@implementation PXGSpriteInfoSerializable

- (void)setSpriteInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var4;
  *(void *)&self[2]._spriteInfo.presentationType = a3[1].var3;
  *(_OWORD *)&self[1]._spriteInfo.presentationType = v4;
  *(_OWORD *)&self->_spriteInfo.presentationType = v3;
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfo
{
  long long v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var4 = v3;
  retstr[1].var3 = *(void *)&self[1].var4;
  return self;
}

- (id)createSerializableObject
{
  [(PXGSpriteInfoSerializable *)self spriteInfo];
  v2 = PXGSerializeSpriteInfo(v4);
  return v2;
}

- (PXGSpriteInfoSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGSpriteInfoSerializable;
  v5 = [(PXGSpriteInfoSerializable *)&v8 init];
  if (v5)
  {
    PXGDeserializeSpriteInfo(v4, (uint64_t)v7);
    [(PXGSpriteInfoSerializable *)v5 setSpriteInfo:v7];
  }

  return v5;
}

@end