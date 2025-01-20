@interface PXLayoutGeometryArray
- (PXLayoutGeometryArray)init;
- (PXLayoutGeometryArray)initWithGeometries:(_PXLayoutGeometry *)a3 count:(unint64_t)a4;
- (_PXLayoutGeometry)geometryAtIndex:(SEL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation PXLayoutGeometryArray

- (unint64_t)count
{
  return self->_count;
}

- (_PXLayoutGeometry)geometryAtIndex:(SEL)a3
{
  v5 = self;
  if (*(void *)&self->var1.y <= a4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a3, v5, @"PXLayoutGeometryArray.m", 48, @"index %ld out of bounds", a4);
  }
  unint64_t v7 = *(void *)&v5->var1.x + 152 * a4;
  long long v8 = *(_OWORD *)(v7 + 112);
  *(_OWORD *)&retstr->var5 = *(_OWORD *)(v7 + 96);
  *(_OWORD *)&retstr->var6.origin.y = v8;
  *(_OWORD *)&retstr->var6.size.height = *(_OWORD *)(v7 + 128);
  retstr->var7.height = *(CGFloat *)(v7 + 144);
  long long v9 = *(_OWORD *)(v7 + 48);
  *(_OWORD *)&retstr->var2.height = *(_OWORD *)(v7 + 32);
  *(_OWORD *)&retstr->var3.b = v9;
  long long v10 = *(_OWORD *)(v7 + 80);
  *(_OWORD *)&retstr->var3.d = *(_OWORD *)(v7 + 64);
  *(_OWORD *)&retstr->var3.ty = v10;
  long long v11 = *(_OWORD *)(v7 + 16);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v7;
  *(_OWORD *)&retstr->var1.y = v11;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  geometries = self->_geometries;
  int64_t count = self->_count;
  return (id)[v4 initWithGeometries:geometries count:count];
}

- (void)dealloc
{
  geometries = self->_geometries;
  if (geometries)
  {
    free(geometries);
    self->_geometries = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXLayoutGeometryArray;
  [(PXLayoutGeometryArray *)&v4 dealloc];
}

- (PXLayoutGeometryArray)initWithGeometries:(_PXLayoutGeometry *)a3 count:(unint64_t)a4
{
  if (!a3)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXLayoutGeometryArray.m" lineNumber:23 description:@"geometries is NULL"];
  }
  v21.receiver = self;
  v21.super_class = (Class)PXLayoutGeometryArray;
  unint64_t v7 = [(PXLayoutGeometryArray *)&v21 init];
  if (v7)
  {
    v7->_geometries = (_PXLayoutGeometry *)malloc_type_malloc(152 * a4, 0x100004050011849uLL);
    if (a4)
    {
      uint64_t v8 = 0;
      unint64_t v9 = a4;
      do
      {
        long long v10 = &v7->_geometries[v8];
        long long v11 = *(_OWORD *)&a3[v8].var1.y;
        *(_OWORD *)&v10->var0 = *(_OWORD *)&a3[v8].var0;
        *(_OWORD *)&v10->var1.y = v11;
        long long v12 = *(_OWORD *)&a3[v8].var2.height;
        long long v13 = *(_OWORD *)&a3[v8].var3.b;
        long long v14 = *(_OWORD *)&a3[v8].var3.ty;
        *(_OWORD *)&v10->var3.d = *(_OWORD *)&a3[v8].var3.d;
        *(_OWORD *)&v10->var3.ty = v14;
        *(_OWORD *)&v10->var2.height = v12;
        *(_OWORD *)&v10->var3.b = v13;
        long long v15 = *(_OWORD *)&a3[v8].var5;
        long long v16 = *(_OWORD *)&a3[v8].var6.origin.y;
        long long v17 = *(_OWORD *)&a3[v8].var6.size.height;
        v10->var7.height = a3[v8].var7.height;
        *(_OWORD *)&v10->var6.origin.y = v16;
        *(_OWORD *)&v10->var6.size.height = v17;
        *(_OWORD *)&v10->var5 = v15;
        ++v8;
        --v9;
      }
      while (v9);
    }
    v7->_int64_t count = a4;
  }
  return v7;
}

- (PXLayoutGeometryArray)init
{
  return [(PXLayoutGeometryArray *)self initWithGeometries:0 count:0];
}

@end