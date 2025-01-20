@interface PXGSpriteGeometrySerializable
- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteGeometry;
- (PXGSpriteGeometrySerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setSpriteGeometry:(id)a3;
@end

@implementation PXGSpriteGeometrySerializable

- (void)setSpriteGeometry:(id)a3
{
  long long v4 = *v3;
  *(_OWORD *)&self->_spriteGeometry.center.z = v3[1];
  *(_OWORD *)&self->_spriteGeometry.center.x = v4;
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteGeometry
{
  long long v3 = *(_OWORD *)&self->_spriteGeometry.center.x;
  long long v4 = *(_OWORD *)&self->_spriteGeometry.center.z;
  _OWORD *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (id)createSerializableObject
{
  [(PXGSpriteGeometrySerializable *)self spriteGeometry];
  v2 = PXGSerializeSpriteGeometry((uint64_t)&v4);
  return v2;
}

- (PXGSpriteGeometrySerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGSpriteGeometrySerializable;
  v5 = [(PXGSpriteGeometrySerializable *)&v8 init];
  if (v5)
  {
    PXGDeserializeSpriteGeometry(v4, (uint64_t)v7);
    [(PXGSpriteGeometrySerializable *)v5 setSpriteGeometry:v7];
  }

  return v5;
}

@end