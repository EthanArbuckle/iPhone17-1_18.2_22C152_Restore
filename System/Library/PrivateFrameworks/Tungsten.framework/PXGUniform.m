@interface PXGUniform
- (BOOL)isEquivalentToUniform:(id)a3;
- (CGImage)image;
- (MTLTexture)cachedTexture;
- (NSString)declaration;
- (NSString)name;
- (PXGUniform)init;
- (PXGUniform)initWithName:(id)a3 type:(unint64_t)a4;
- (__n128)encodableValue;
- (__n128)float3Value;
- (__n128)float4Value;
- (const)bytes;
- (double)float2Value;
- (float)floatValue;
- (id)bindableTextureForContext:(id)a3;
- (id)description;
- (id)parameterDeclarationWithBindingIndex:(int64_t)a3;
- (id)textureProvider;
- (int64_t)bytesLength;
- (unint64_t)bindType;
- (unint64_t)type;
- (void)setCachedTexture:(id)a3;
- (void)setFloat2Value:(PXGUniform *)self;
- (void)setFloat3Value:(PXGUniform *)self;
- (void)setFloat4Value:(PXGUniform *)self;
- (void)setFloatValue:(float)a3;
- (void)setImage:(CGImage *)a3;
- (void)setTextureProvider:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PXGUniform

- (PXGUniform)initWithName:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGUniform;
  v8 = [(PXGUniform *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_type = a4;
    switch(a4)
    {
      case 0uLL:
        uint64_t v10 = 4;
        p_floatValue = &v9->_floatValue;
        goto LABEL_8;
      case 1uLL:
        uint64_t v10 = 8;
        p_floatValue = v9->_float2Value;
        goto LABEL_8;
      case 2uLL:
        uint64_t v10 = 16;
        p_floatValue = v9->_float3Value;
        goto LABEL_8;
      case 3uLL:
        uint64_t v10 = 16;
        p_floatValue = v9->_float4Value;
LABEL_8:
        v9->_bytesLength = v10;
        v9->_bytes = p_floatValue;
        break;
      case 4uLL:
      case 5uLL:
        v9->_bytesLength = 0;
        break;
      default:
        break;
    }
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTexture, 0);
  objc_storeStrong(&self->_textureProvider, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCachedTexture:(id)a3
{
}

- (MTLTexture)cachedTexture
{
  return self->_cachedTexture;
}

- (const)bytes
{
  return self->_bytes;
}

- (int64_t)bytesLength
{
  return self->_bytesLength;
}

- (id)textureProvider
{
  return self->_textureProvider;
}

- (void)setImage:(CGImage *)a3
{
  self->_image = a3;
}

- (CGImage)image
{
  return self->_image;
}

- (void)setFloat4Value:(PXGUniform *)self
{
  *(_OWORD *)self->_float4Value = v2;
}

- (__n128)float4Value
{
  return a1[6];
}

- (void)setFloat3Value:(PXGUniform *)self
{
  *(_OWORD *)self->_float3Value = v2;
}

- (__n128)float3Value
{
  return a1[5];
}

- (void)setFloat2Value:(PXGUniform *)self
{
  *(void *)self->_float2Value = v2;
}

- (double)float2Value
{
  return *(double *)(a1 + 32);
}

- (void)setFloatValue:(float)a3
{
  self->_floatValue = a3;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)declaration
{
  v3 = NSString;
  unint64_t v4 = [(PXGUniform *)self type];
  if (v4 > 5) {
    v5 = 0;
  }
  else {
    v5 = off_265556B20[v4];
  }
  v6 = [(PXGUniform *)self name];
  id v7 = [v3 stringWithFormat:@"%@ %@", v5, v6];

  return (NSString *)v7;
}

- (id)bindableTextureForContext:(id)a3
{
  id v4 = a3;
  if ([(PXGUniform *)self bindType] == 1)
  {
    v5 = [(PXGUniform *)self cachedTexture];
    v6 = [v5 device];
    id v7 = [v4 device];

    if (v6 == v7)
    {
      v8 = [(PXGUniform *)self cachedTexture];
    }
    else
    {
      v8 = [(PXGUniform *)self textureProvider];

      v9 = self;
      if (v8)
      {
        uint64_t v10 = [(PXGUniform *)self textureProvider];
        v8 = ((void (**)(void, id))v10)[2](v10, v4);

        v9 = self;
        v11 = v8;
      }
      else
      {
        v11 = 0;
      }
      [(PXGUniform *)v9 setCachedTexture:v11];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (__n128)encodableValue
{
  switch([(__n128 *)a1 type])
  {
    case 0:
      result.n128_u32[0] = a1->n128_u32[2];
      return result;
    case 1:
      result.n128_u64[0] = a1[2].n128_u64[0];
      return result;
    case 2:
      return a1[5];
    case 3:
      return a1[6];
    case 4:
    case 5:
      v5 = [MEMORY[0x263F08690] currentHandler];
      v6 = v5;
      uint64_t v7 = a2;
      v8 = a1;
      uint64_t v9 = 126;
      break;
    default:
      v5 = [MEMORY[0x263F08690] currentHandler];
      v6 = v5;
      uint64_t v7 = a2;
      v8 = a1;
      uint64_t v9 = 129;
      break;
  }
  [v5 handleFailureInMethod:v7 object:v8 file:@"PXGUniform.m" lineNumber:v9 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)parameterDeclarationWithBindingIndex:(int64_t)a3
{
  unint64_t v5 = [(PXGUniform *)self bindType];
  if (v5 == 1)
  {
    uint64_t v9 = NSString;
    unint64_t v10 = [(PXGUniform *)self type];
    if (v10 > 5) {
      v11 = 0;
    }
    else {
      v11 = off_265556B20[v10];
    }
    v12 = [(PXGUniform *)self name];
    [v9 stringWithFormat:@"%@ %@ [[ texture(%ld) ]]", v11, v12, a3];
  }
  else
  {
    if (v5)
    {
      v15 = [MEMORY[0x263F08690] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[PXGUniform parameterDeclarationWithBindingIndex:]"];
      [v15 handleFailureInFunction:v16 file:@"PXGUniform.m" lineNumber:107 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v6 = NSString;
    unint64_t v7 = [(PXGUniform *)self type];
    if (v7 > 5) {
      v8 = 0;
    }
    else {
      v8 = off_265556B20[v7];
    }
    v12 = [(PXGUniform *)self name];
    [v6 stringWithFormat:@"constant %@ &%@ [[ buffer(%ld) ]]", v8, v12, a3];
  objc_super v13 = };

  return v13;
}

- (BOOL)isEquivalentToUniform:(id)a3
{
  id v4 = (PXGUniform *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    unint64_t v5 = [(PXGUniform *)self name];
    v6 = [(PXGUniform *)v4 name];
    if ([v5 isEqualToString:v6])
    {
      unint64_t v7 = [(PXGUniform *)self type];
      BOOL v8 = v7 == [(PXGUniform *)v4 type];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  v6 = [(PXGUniform *)self name];
  unint64_t v7 = [(PXGUniform *)self type];
  if (v7 > 5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_265556B20[v7];
  }
  uint64_t v9 = [v3 stringWithFormat:@"<%@:%p; name:%@ type:%@>", v5, self, v6, v8];

  return v9;
}

- (unint64_t)bindType
{
  unint64_t v2 = [(PXGUniform *)self type];
  if (v2 >= 6)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"PXGUniformBindType bindTypeForUniformType(PXGUniformType)"];
    [v4 handleFailureInFunction:v5 file:@"PXGUniform.m" lineNumber:34 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return qword_2603C3A90[v2];
}

- (void)setTextureProvider:(id)a3
{
  if (self->_textureProvider != a3)
  {
    id v4 = (void *)[a3 copy];
    id textureProvider = self->_textureProvider;
    self->_id textureProvider = v4;

    [(PXGUniform *)self setCachedTexture:0];
  }
}

- (PXGUniform)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGUniform.m", 44, @"%s is not available as initializer", "-[PXGUniform init]");

  abort();
}

@end