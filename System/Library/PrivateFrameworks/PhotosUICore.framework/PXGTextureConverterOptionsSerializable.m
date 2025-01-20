@interface PXGTextureConverterOptionsSerializable
- ($8814E4F230000EB768D7E307C62B5F7C)textureConverterOptions;
- (PXGTextureConverterOptionsSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (void)setTextureConverterOptions:(id)a3;
@end

@implementation PXGTextureConverterOptionsSerializable

- (void)setTextureConverterOptions:(id)a3
{
  self->_textureConverterOptions = ($FA15997C902EC2271369254F9448C610)a3;
}

- ($8814E4F230000EB768D7E307C62B5F7C)textureConverterOptions
{
  return ($8814E4F230000EB768D7E307C62B5F7C)self->_textureConverterOptions;
}

- (id)createSerializableObject
{
  $8814E4F230000EB768D7E307C62B5F7C v2 = [(PXGTextureConverterOptionsSerializable *)self textureConverterOptions];
  return PXGSerializeTextureConverterOptions(*(void *)&v2);
}

- (PXGTextureConverterOptionsSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXGTextureConverterOptionsSerializable;
  v5 = [(PXGTextureConverterOptionsSerializable *)&v7 init];
  if (v5) {
    [(PXGTextureConverterOptionsSerializable *)v5 setTextureConverterOptions:PXGDeserializeTextureConverterOptions(v4)];
  }

  return v5;
}

@end