@interface PXGUniformAlias
- (BOOL)isEquivalentToUniform:(id)a3;
- (CGImage)image;
- (PXGUniform)original;
- (PXGUniformAlias)initWithIndex:(int64_t)a3 aliasing:(id)a4;
- (PXGUniformAlias)initWithName:(id)a3 type:(unint64_t)a4;
- (__n128)float3Value;
- (__n128)float4Value;
- (const)bytes;
- (double)float2Value;
- (float)floatValue;
- (id)cachedTexture;
- (id)description;
- (id)name;
- (id)textureProvider;
- (int64_t)bytesLength;
- (int64_t)index;
- (void)setCachedTexture:(id)a3;
@end

@implementation PXGUniformAlias

- (void).cxx_destruct
{
}

- (int64_t)index
{
  return self->_index;
}

- (PXGUniform)original
{
  return self->_original;
}

- (const)bytes
{
  id v2 = [(PXGUniformAlias *)self original];
  v3 = (const void *)[v2 bytes];

  return v3;
}

- (int64_t)bytesLength
{
  id v2 = [(PXGUniformAlias *)self original];
  int64_t v3 = [v2 bytesLength];

  return v3;
}

- (id)cachedTexture
{
  id v2 = [(PXGUniformAlias *)self original];
  int64_t v3 = [v2 cachedTexture];

  return v3;
}

- (void)setCachedTexture:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGUniformAlias *)self original];
  [v5 setCachedTexture:v4];
}

- (id)textureProvider
{
  id v2 = [(PXGUniformAlias *)self original];
  int64_t v3 = [v2 textureProvider];

  return v3;
}

- (CGImage)image
{
  id v2 = [(PXGUniformAlias *)self original];
  int64_t v3 = (CGImage *)[v2 image];

  return v3;
}

- (__n128)float4Value
{
  v1 = [a1 original];
  [v1 float4Value];
  long long v4 = v2;

  return (__n128)v4;
}

- (__n128)float3Value
{
  v1 = [a1 original];
  [v1 float3Value];
  long long v4 = v2;

  return (__n128)v4;
}

- (double)float2Value
{
  v1 = [a1 original];
  [v1 float2Value];
  double v3 = v2;

  return v3;
}

- (float)floatValue
{
  double v2 = [(PXGUniformAlias *)self original];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (BOOL)isEquivalentToUniform:(id)a3
{
  float v4 = (PXGUniformAlias *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(PXGUniformAlias *)self original];
      id v7 = [v6 name];
      v8 = [(PXGUniformAlias *)v5 original];
      id v9 = [v8 name];
      if (v7 == v9)
      {
      }
      else
      {
        v10 = v9;
        char v11 = [v7 isEqual:v9];

        if ((v11 & 1) == 0) {
          goto LABEL_11;
        }
      }
      int64_t v13 = [(PXGUniformAlias *)self index];
      if (v13 == [(PXGUniformAlias *)v5 index])
      {
        unint64_t v14 = [(PXGUniform *)self type];
        BOOL v12 = v14 == [(PXGUniform *)v5 type];
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:
      BOOL v12 = 0;
      goto LABEL_12;
    }
    BOOL v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)description
{
  float v3 = NSString;
  float v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(PXGUniformAlias *)self name];
  id v7 = [(PXGUniformAlias *)self original];
  v8 = [v3 stringWithFormat:@"<%@:%p; name:%@ original:%@>", v5, self, v6, v7];

  return v8;
}

- (id)name
{
  float v3 = NSString;
  float v4 = [(PXGUniformAlias *)self original];
  id v5 = [v4 name];
  v6 = [v3 stringWithFormat:@"%@Alias%ld", v5, -[PXGUniformAlias index](self, "index")];

  return v6;
}

- (PXGUniformAlias)initWithIndex:(int64_t)a3 aliasing:(id)a4
{
  id v7 = a4;
  v8 = [v7 name];
  v11.receiver = self;
  v11.super_class = (Class)PXGUniformAlias;
  id v9 = -[PXGUniform initWithName:type:](&v11, sel_initWithName_type_, v8, [v7 type]);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_original, a4);
    v9->_index = a3;
  }

  return v9;
}

- (PXGUniformAlias)initWithName:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGUniform.m", 157, @"%s is not available as initializer", "-[PXGUniformAlias initWithName:type:]");

  abort();
}

@end