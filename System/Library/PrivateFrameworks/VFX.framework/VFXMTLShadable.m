@interface VFXMTLShadable
- (id)bufferAtIndices:(id)a3;
- (id)samplerAtIndices:(id)a3;
- (id)textureAtIndices:(id)a3;
- (int64_t)geometryModificationCount;
- (int64_t)materialModificationCount;
- (void)dealloc;
- (void)setGeometryModificationCount:(int64_t)a3;
- (void)setMaterialModificationCount:(int64_t)a3;
- (void)setResource:(id)a3 ofType:(int64_t)a4 atIndices:(id)a5;
@end

@implementation VFXMTLShadable

- (void)dealloc
{
  for (uint64_t i = 0; i != 31; ++i)
  {
  }
  for (uint64_t j = 0; j != 31; ++j)
  {
  }
  for (uint64_t k = 0; k != 16; ++k)
  {
  }
  v6.receiver = self;
  v6.super_class = (Class)VFXMTLShadable;
  [(VFXMTLShadable *)&v6 dealloc];
}

- (void)setResource:(id)a3 ofType:(int64_t)a4 atIndices:(id)a5
{
  char var0 = a5.var0;
  uint64_t v11 = *(void *)&a5.var0 >> 8;
  int var1 = a5.var1;
  if (a4 == 3)
  {
    if (a5.var0 != 255)
    {
      id v17 = a3;
      v18 = (id *)(&self->super.isa + var0);

      v18[125] = a3;
    }
    if (var1 != 255)
    {
      id v19 = a3;
      v20 = (id *)(&self->super.isa + (char)v11);

      v20[141] = a3;
    }
  }
  else if (a4 == 2)
  {
    if (a5.var0 != 255)
    {
      id v21 = a3;
      v22 = (id *)(&self->super.isa + var0);

      v22[63] = a3;
    }
    if (var1 != 255)
    {
      id v23 = a3;
      v24 = (id *)(&self->super.isa + (char)v11);

      v24[94] = a3;
    }
  }
  else if (a4)
  {
    sub_1B63F2F54(16, @"Unreachable code: Invalid resource type", (uint64_t)a3, a4, *(uint64_t *)&a5.var0, v5, v6, v7, v26);
  }
  else
  {
    if (a5.var0 != 255)
    {
      id v13 = a3;
      v14 = (id *)(&self->super.isa + var0);

      v14[1] = a3;
    }
    if (var1 != 255)
    {
      id v15 = a3;
      v16 = (id *)(&self->super.isa + (char)v11);

      v16[32] = a3;
    }
  }
}

- (id)bufferAtIndices:(id)a3
{
  if (a3.var0 != -1) {
    return self->_vertexBuffers[a3.var0];
  }
  if ((~*(_WORD *)&a3 & 0xFF00) != 0) {
    return self->_fragmentBuffers[a3.var1];
  }
  sub_1B63F2F54(16, @"Unreachable code: Not indices are bound!?!", *(uint64_t *)&a3.var0, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)textureAtIndices:(id)a3
{
  if (a3.var0 != -1) {
    return self->_vertexTextures[a3.var0];
  }
  if ((~*(_WORD *)&a3 & 0xFF00) != 0) {
    return self->_fragmentTextures[a3.var1];
  }
  sub_1B63F2F54(16, @"Unreachable code: Not indices are bound!?!", *(uint64_t *)&a3.var0, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)samplerAtIndices:(id)a3
{
  if (a3.var0 != -1) {
    return self->_vertexSamplers[a3.var0];
  }
  if ((~*(_WORD *)&a3 & 0xFF00) != 0) {
    return self->_fragmentSamplers[a3.var1];
  }
  sub_1B63F2F54(16, @"Unreachable code: Not indices are bound!?!", *(uint64_t *)&a3.var0, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (int64_t)materialModificationCount
{
  return self->materialModificationCount;
}

- (void)setMaterialModificationCount:(int64_t)a3
{
  self->materialModificationCount = a3;
}

- (int64_t)geometryModificationCount
{
  return self->geometryModificationCount;
}

- (void)setGeometryModificationCount:(int64_t)a3
{
  self->geometryModificationCount = a3;
}

@end