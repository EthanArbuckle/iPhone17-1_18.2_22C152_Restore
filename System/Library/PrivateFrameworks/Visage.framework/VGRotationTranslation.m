@interface VGRotationTranslation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VGRotationTranslation)initWithCoder:(id)a3;
- (__n128)rotation;
- (__n128)setRotation:(__n128 *)result;
- (__n128)translation;
- (void)encodeWithCoder:(id)a3;
- (void)setTranslation:(VGRotationTranslation *)self;
@end

@implementation VGRotationTranslation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF8F8];
  anon_10 = self->_anon_10;
  id v6 = a3;
  id v8 = [v4 dataWithBytes:anon_10 length:16];
  v7 = [MEMORY[0x263EFF8F8] dataWithBytes:self->_translation length:16];
  [v6 encodeObject:v8 forKey:@"rotation"];
  [v6 encodeObject:v7 forKey:@"translation"];
}

- (VGRotationTranslation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGRotationTranslation;
  v5 = [(VGRotationTranslation *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rotation"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"translation"];
    [v6 getBytes:v5->_anon_10 length:16];
    [v7 getBytes:v5->_translation length:16];
    id v8 = v5;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (float32x4_t *)v4;
    [(VGRotationTranslation *)self rotation];
    if ((vminvq_u32((uint32x4_t)vceqq_f32(v6, v5[1])) & 0x80000000) != 0)
    {
      [(VGRotationTranslation *)self translation];
      uint32x4_t v9 = (uint32x4_t)vceqq_f32(v8, v5[2]);
      v9.i32[3] = v9.i32[2];
      unsigned int v7 = vminvq_u32(v9) >> 31;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (__n128)rotation
{
  return a1[1];
}

- (__n128)setRotation:(__n128 *)result
{
  result[1] = a2;
  return result;
}

- (__n128)translation
{
  return a1[2];
}

- (void)setTranslation:(VGRotationTranslation *)self
{
  *(_OWORD *)self->_translation = v2;
}

@end