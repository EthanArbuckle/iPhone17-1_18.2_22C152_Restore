@interface PXGSpriteEntitySerializable
- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntity;
- (PXGSpriteEntitySerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setSpriteEntity:(id)a3;
@end

@implementation PXGSpriteEntitySerializable

- (void)setSpriteEntity:(id)a3
{
  self->_spriteEntity.id = a3.var0;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntity
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_spriteEntity.id;
}

- (id)createSerializableObject
{
  v2.var0 = [(PXGSpriteEntitySerializable *)self spriteEntity];
  return PXGSerializeSpriteEntity(v2.var0);
}

- (PXGSpriteEntitySerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXGSpriteEntitySerializable;
  v5 = [(PXGSpriteEntitySerializable *)&v7 init];
  if (v5) {
    [(PXGSpriteEntitySerializable *)v5 setSpriteEntity:PXGDeserializeSpriteEntity(v4)];
  }

  return v5;
}

@end