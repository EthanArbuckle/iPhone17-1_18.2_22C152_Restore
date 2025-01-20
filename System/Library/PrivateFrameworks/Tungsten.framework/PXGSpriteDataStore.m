@interface PXGSpriteDataStore
+ (id)newSpriteDataStore;
- ($327AC5C1B3A50B4987650045CBFB5127)geometries;
- ($6A8CD14A92A2CBAC77B19B5162C382FC)sprites;
- ($6A8CD14A92A2CBAC77B19B5162C382FC)spritesInRange:(SEL)a3;
- ($738B17BD11CC339B30296C0EA03CEC2B)entities;
- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)infos;
- ($7B4C668D983231AF8D7B277595642D2D)styles;
- ($B0083419B7591A93B72A99AB8D6AC1B6)_mutableSpritesInRange:(SEL)a3;
- ($B0083419B7591A93B72A99AB8D6AC1B6)spriteAtIndex:(SEL)a3;
- (NSString)description;
- (NSString)diagnosticDescription;
- (PXGSpriteDataStore)init;
- (id)_init;
- (id)spriteAtIndexes:(id)a3 inRect:(CGRect)a4;
- (id)spriteIndexesInRect:(CGRect)a3;
- (id)spriteIndexesWithSpriteInfoFlags:(unsigned __int8)a3;
- (unsigned)count;
- (void)_collectSpriteIndexes:(id)a3 inRange:(_PXGSpriteIndexRange)a4 inRect:(CGRect)a5;
- (void)applyChangeDetails:(id)a3;
- (void)clearEntities;
- (void)copySpritesInRange:(_PXGSpriteIndexRange)a3 fromSpriteDataStore:(id)a4;
- (void)dealloc;
- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 usingBlock:(id)a4;
- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)insertSpritesInRange:(_PXGSpriteIndexRange)a3;
- (void)moveSpritesFromIndexes:(__CFArray *)a3 toIndexes:(id)a4;
- (void)moveSpritesInRange:(_PXGSpriteIndexRange)a3 toRange:(_PXGSpriteIndexRange)a4;
- (void)removeSpritesInRange:(_PXGSpriteIndexRange)a3;
- (void)setCount:(unsigned int)a3;
- (void)setSprites:(id *)a3;
@end

@implementation PXGSpriteDataStore

- (id)spriteAtIndexes:(id)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = (objc_class *)MEMORY[0x263F089C8];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __45__PXGSpriteDataStore_spriteAtIndexes_inRect___block_invoke;
  v18 = &unk_265556A40;
  v19 = self;
  id v20 = v11;
  CGFloat v21 = x;
  CGFloat v22 = y;
  CGFloat v23 = width;
  CGFloat v24 = height;
  id v12 = v11;
  [v10 enumerateRangesUsingBlock:&v15];

  v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18, v19);

  return v13;
}

- (void)_collectSpriteIndexes:(id)a3 inRange:(_PXGSpriteIndexRange)a4 inRect:(CGRect)a5
{
  CGFloat width = a5.size.width;
  CGFloat height = a5.size.height;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v31 = a3;
  v9 = [(PXGSpriteDataStore *)self geometries];
  unint64_t v10 = HIDWORD(*(unint64_t *)&a4);
  if (a4.var1 + a4.var0 > a4.var0)
  {
    *(float *)&unsigned int v11 = x;
    *(float *)&unsigned int v12 = y;
    double v13 = *(float *)&v11;
    v14.f64[0] = width;
    v14.f64[1] = height;
    float32x2_t v15 = vadd_f32((float32x2_t)__PAIR64__(v12, v11), vcvt_f32_f64(v14));
    double v16 = v15.f32[1];
    double v17 = *(float *)&v12;
    double v18 = v15.f32[0];
    a4 = (_PXGSpriteIndexRange)a4.var0;
    v19 = (char *)v9 + 32 * a4.var0;
    do
    {
      float32x2_t v20 = vmul_f32(*(float32x2_t *)(v19 + 24), (float32x2_t)0x3F0000003F000000);
      double v21 = *((double *)v19 + 1);
      double v22 = v21 - v20.f32[1];
      double v23 = v21 + v20.f32[1];
      if (v22 <= v16 && v23 >= v17)
      {
        double v25 = v20.f32[0];
        double v26 = *(double *)v19 - v25;
        double v27 = *(double *)v19 + v25;
        if (v26 <= v18 && v27 >= v13) {
          objc_msgSend(v31, "addIndex:", a4, v27);
        }
      }
      ++*(void *)&a4;
      v19 += 32;
      LODWORD(v10) = v10 - 1;
    }
    while (v10);
  }
}

- (id)spriteIndexesInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x263F089C8]);
  -[PXGSpriteDataStore _collectSpriteIndexes:inRange:inRect:](self, "_collectSpriteIndexes:inRange:inRect:", v8, [(PXGSpriteDataStore *)self count] << 32, x, y, width, height);
  v9 = (void *)[v8 copy];

  return v9;
}

- (void)removeSpritesInRange:(_PXGSpriteIndexRange)a3
{
  uint64_t var1 = a3.var1;
  uint64_t var0 = a3.var0;
  _PXGArrayRemoveRange((uint64_t)self->_entities, 4, [(PXGSpriteDataStore *)self count], a3.var0, a3.var1);
  _PXGArrayRemoveRange((uint64_t)self->_geometries, 32, [(PXGSpriteDataStore *)self count], var0, var1);
  _PXGArrayRemoveRange((uint64_t)self->_styles, 160, [(PXGSpriteDataStore *)self count], var0, var1);
  _PXGArrayRemoveRange((uint64_t)self->_infos, 40, [(PXGSpriteDataStore *)self count], var0, var1);
  uint64_t v6 = [(PXGSpriteDataStore *)self count] - var1;

  [(PXGSpriteDataStore *)self setCount:v6];
}

- (id)spriteIndexesWithSpriteInfoFlags:(unsigned __int8)a3
{
  int v3 = a3;
  v4 = self;
  uint64_t v5 = [(PXGSpriteDataStore *)v4 infos];
  unsigned int v6 = [(PXGSpriteDataStore *)v4 count];
  id v7 = objc_alloc_init(MEMORY[0x263F089C8]);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  unint64_t v10 = (unsigned __int8 *)(v5 + 34);
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v12 = v11;
    uint64_t v13 = v9;
    int v14 = *v10;
    v10 += 40;
    if ((v3 & ~v14) == 0)
    {
      if (v9)
      {
        uint64_t v11 = v8;
        uint64_t v9 = 1;
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_11;
        }
        if (v8 == v13 + v12)
        {
          uint64_t v9 = v13 + 1;
          uint64_t v11 = v12;
          goto LABEL_11;
        }
        objc_msgSend(v7, "addIndexesInRange:", v12, v13);
      }
      uint64_t v11 = v8;
      uint64_t v9 = 1;
    }
LABEL_11:
    ++v8;
  }
  while (v6 != v8);
  if (v9) {
    [v7 addIndexesInRange:v11];
  }
LABEL_14:

  return v7;
}

- (void)insertSpritesInRange:(_PXGSpriteIndexRange)a3
{
  uint64_t var1 = a3.var1;
  [(PXGSpriteDataStore *)self setCount:[(PXGSpriteDataStore *)self count] + a3.var1];
  unsigned int var0 = a3.var0;
  _PXGArrayInsertRange((uint64_t)self->_entities, 4, [(PXGSpriteDataStore *)self count], a3.var0, var1);
  _PXGArrayInsertRange((uint64_t)self->_geometries, 32, [(PXGSpriteDataStore *)self count], a3.var0, var1);
  _PXGArrayInsertRange((uint64_t)self->_styles, 160, [(PXGSpriteDataStore *)self count], a3.var0, var1);
  _PXGArrayInsertRange((uint64_t)self->_infos, 40, [(PXGSpriteDataStore *)self count], a3.var0, var1);
  bzero(&self->_entities[a3.var0], 4 * var1);
  bzero((char *)self->_geometries + 32 * a3.var0, 32 * var1);
  unint64_t v7 = 4 * var1 + HIDWORD(*(unint64_t *)&a3);
  bzero((char *)self->_styles + 160 * var0, 32 * v7);
  uint64_t v8 = (char *)self->_infos + 40 * var0;

  bzero(v8, 8 * v7);
}

- ($6A8CD14A92A2CBAC77B19B5162C382FC)sprites
{
  uint64_t v4 = [(PXGSpriteDataStore *)self count] << 32;

  return [(PXGSpriteDataStore *)self spritesInRange:v4];
}

- (void)setSprites:(id *)a3
{
  uint64_t var0 = a3->var0;
  [(PXGSpriteDataStore *)self setCount:var0];
  unsigned int v6 = self;
  memcpy([(PXGSpriteDataStore *)v6 entities], a3->var1, 4 * var0);
  unint64_t v7 = v6;
  memcpy([(PXGSpriteDataStore *)v7 geometries], a3->var2, 32 * var0);
  uint64_t v8 = v7;
  uint64_t v9 = 5 * var0;
  memcpy([(PXGSpriteDataStore *)v8 styles], a3->var3, 32 * v9);
  unint64_t v10 = [(PXGSpriteDataStore *)v8 infos];
  var4 = a3->var4;

  memcpy(v10, var4, 8 * v9);
}

- ($6A8CD14A92A2CBAC77B19B5162C382FC)spritesInRange:(SEL)a3
{
  unsigned int var0 = a4.var0;
  unsigned int var1 = a4.var1;
  if (a4.var1 + a4.var0 > [(PXGSpriteDataStore *)self count])
  {
    double v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a3, self, @"PXGSpriteDataStore.m", 151, @"Invalid parameter not satisfying: %@", @"PXGSpriteIndexRangeMax(range) <= self.count" object file lineNumber description];
  }
  uint64_t v9 = var0;
  unint64_t v10 = self;
  uint64_t v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v10 entities] + 4 * var0);
  uint64_t v12 = v10;
  uint64_t v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v12 geometries] + 32 * v9);
  int v14 = v12;
  float32x2_t v15 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v14 styles] + 160 * v9);
  result = [(PXGSpriteDataStore *)v14 infos];
  retstr->unsigned int var0 = var1;
  retstr->unsigned int var1 = v11;
  retstr->var2 = v13;
  retstr->var3 = v15;
  retstr->var4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&result[v9];
  return result;
}

- (unsigned)count
{
  return self->_count;
}

- ($7B4C668D983231AF8D7B277595642D2D)styles
{
  return self->_styles;
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)infos
{
  return self->_infos;
}

- ($327AC5C1B3A50B4987650045CBFB5127)geometries
{
  return self->_geometries;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)entities
{
  return self->_entities;
}

- (void)setCount:(unsigned int)a3
{
  self->_count = a3;
  capacitdouble y = self->_capacity;
  if (capacity < a3)
  {
    if (capacity)
    {
      do
        capacity *= 2;
      while (capacity < a3);
    }
    else
    {
      capacitdouble y = a3;
    }
    self->_capacitdouble y = capacity;
    self->_entities = ($738B17BD11CC339B30296C0EA03CEC2B *)malloc_type_realloc(self->_entities, 4 * capacity, 0xFA539D40uLL);
    self->_geometries = ($327AC5C1B3A50B4987650045CBFB5127 *)malloc_type_realloc(self->_geometries, 32 * self->_capacity, 0xFA539D40uLL);
    self->_styles = ($7B4C668D983231AF8D7B277595642D2D *)malloc_type_realloc(self->_styles, 160 * self->_capacity, 0xFA539D40uLL);
    self->_infos = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)malloc_type_realloc(self->_infos, 40 * self->_capacity, 0xFA539D40uLL);
  }
}

+ (id)newSpriteDataStore
{
  id v2 = objc_alloc((Class)a1);

  return (id)[v2 _init];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteDataStore;
  return [(PXGSpriteDataStore *)&v3 init];
}

- (NSString)diagnosticDescription
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v31 = [v3 stringWithFormat:@"<%@: %p\n", v5, self];

  unsigned int v6 = [(PXGSpriteDataStore *)self count];
  unint64_t v7 = self;
  uint64_t v8 = [(PXGSpriteDataStore *)v7 entities];
  uint64_t v9 = v7;
  unint64_t v10 = [(PXGSpriteDataStore *)v9 geometries];
  uint64_t v11 = v9;
  uint64_t v12 = [(PXGSpriteDataStore *)v11 styles];
  uint64_t v13 = [(PXGSpriteDataStore *)v11 infos];
  if (v6)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = v6;
    do
    {
      double v17 = objc_msgSend(NSString, "stringWithFormat:", @"{id=%ld}", *(unsigned int *)(v8 + 4 * v15));
      long long v18 = *(_OWORD *)&v10->var0.var0;
      long long v19 = *(_OWORD *)&v10->var0.var2;
      unint64_t v10 = ($327AC5C1B3A50B4987650045CBFB5127 *)((char *)v10 + 32);
      long long v32 = v18;
      long long v33 = v19;
      float32x2_t v20 = PXGSpriteGeometryDescription(&v32);
      long long v21 = *(_OWORD *)&v12[2].var3;
      long long v38 = *(long long *)((char *)&v12[2].var1 + 4);
      long long v39 = v21;
      long long v22 = *(long long *)((char *)&v12[3].var1 + 8);
      long long v40 = *(_OWORD *)&v12[2].var8;
      long long v41 = v22;
      $75DC967394D75D22597118241CE31CB7 var1 = v12[1].var1;
      long long v34 = *(_OWORD *)&v12->var5;
      $75DC967394D75D22597118241CE31CB7 v35 = var1;
      long long v24 = *(_OWORD *)&v12[1].var6;
      long long v36 = *(_OWORD *)&v12[1].var2;
      long long v37 = v24;
      long long v25 = *(_OWORD *)&v12->var0;
      long long v26 = *(long long *)((char *)&v12->var1 + 12);
      uint64_t v12 = ($7B4C668D983231AF8D7B277595642D2D *)((char *)v12 + 160);
      long long v32 = v25;
      long long v33 = v26;
      double v27 = PXGSpriteStyleDescription((uint64_t)&v32);
      long long v28 = *(_OWORD *)(v14 + 16);
      long long v32 = *(_OWORD *)v14;
      long long v33 = v28;
      *(void *)&long long v34 = *(void *)(v14 + 32);
      v29 = PXGSpriteInfoDescription((unsigned __int8 *)&v32);
      [v31 appendFormat:@"\t%li: entity=%@ geometry=%@ style=%@ info=%@\n", v15, v17, v20, v27, v29];

      ++v15;
      v14 += 40;
    }
    while (v16 != v15);
  }
  [v31 appendString:@">"];

  return (NSString *)v31;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; count = %u>",
    v5,
    self,
  unsigned int v6 = [(PXGSpriteDataStore *)self count]);

  return (NSString *)v6;
}

uint64_t __45__PXGSpriteDataStore_spriteAtIndexes_inRect___block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collectSpriteIndexes:inRange:inRect:", *(void *)(a1 + 40), a2 | ((unint64_t)a3 << 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)enumerateSpritesInRange:(_PXGSpriteIndexRange)a3 usingBlock:(id)a4
{
  unsigned int v6 = (void (**)(id, _PXGSpriteIndexRange, void *, char *))a4;
  unsigned int v7 = [(PXGSpriteDataStore *)self count];
  uint64_t v8 = self;
  uint64_t v9 = [(PXGSpriteDataStore *)v8 entities];
  unint64_t v10 = v8;
  uint64_t v11 = [(PXGSpriteDataStore *)v10 geometries];
  uint64_t v12 = v10;
  uint64_t v13 = [(PXGSpriteDataStore *)v12 styles];
  uint64_t v14 = v12;
  uint64_t v15 = [(PXGSpriteDataStore *)v14 infos];
  unint64_t v16 = a3.var1 + a3.var0;
  if (v16 > v7)
  {
    long long v24 = [MEMORY[0x263F08690] currentHandler];
    [NSString stringWithFormat:@"{%li, %li}", a3.var0, HIDWORD(*(unint64_t *)&a3)];
    long long v22 = v23 = v7;
    [v24 handleFailureInMethod:a2, v14, @"PXGSpriteDataStore.m", 226, @"invalid range %@ not within 0..<%li", v22, v23 object file lineNumber description];
  }
  char v27 = 0;
  if (v16 > a3.var0)
  {
    unint64_t v17 = a3.var0 + 1;
    uint64_t v18 = v15 + 40 * a3.var0;
    uint64_t v19 = v13 + 160 * a3.var0;
    uint64_t v20 = v11 + 32 * a3.var0;
    uint64_t v21 = v9 + 4 * a3.var0;
    do
    {
      v26[0] = v21;
      v26[1] = v20;
      v26[2] = v19;
      v26[3] = v18;
      v6[2](v6, a3, v26, &v27);
      if (v17 >= v16) {
        break;
      }
      ++v17;
      a3 = (_PXGSpriteIndexRange)(a3.var0 + 1);
      v18 += 40;
      v19 += 160;
      v20 += 32;
      v21 += 4;
    }
    while (!v27);
  }
}

- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = a4;
  unsigned int v8 = [(PXGSpriteDataStore *)self count];
  uint64_t v9 = self;
  uint64_t v10 = [(PXGSpriteDataStore *)v9 entities];
  uint64_t v11 = v9;
  uint64_t v12 = [(PXGSpriteDataStore *)v11 geometries];
  uint64_t v13 = v11;
  uint64_t v14 = [(PXGSpriteDataStore *)v13 styles];
  uint64_t v15 = [(PXGSpriteDataStore *)v13 infos];
  unsigned __int8 v39 = 0;
  if (v8)
  {
    uint64_t v17 = v15;
    v18.f32[0] = x;
    float32_t v19 = y;
    double v20 = v18.f32[0];
    v18.f32[1] = v19;
    v21.f64[0] = width;
    v21.f64[1] = height;
    float32x2_t v22 = vadd_f32(v18, vcvt_f32_f64(v21));
    double v23 = v22.f32[1];
    double v24 = v19;
    double v25 = v22.f32[0];
    unint64_t v26 = 1;
    do
    {
      float32x2_t v27 = vmul_f32(*(float32x2_t *)(v12 + 24), (float32x2_t)0x3F0000003F000000);
      double v28 = *(double *)(v12 + 8);
      double v29 = v28 - v27.f32[1];
      double v30 = v28 + v27.f32[1];
      BOOL v31 = v29 > v23 || v30 < v24;
      if (v31
        || ((double v32 = v27.f32[0], v33 = *(double *)v12 - v32, v16.n128_f64[0] = *(double *)v12 + v32, v33 <= v25)
          ? (BOOL v34 = v16.n128_f64[0] < v20)
          : (BOOL v34 = 1),
            v34))
      {
        int v35 = 0;
      }
      else
      {
        v38[0] = v10;
        v38[1] = v12;
        v38[2] = v14;
        v38[3] = v17;
        (*((void (**)(id, void, void *, unsigned __int8 *, __n128))v7 + 2))(v7, (v26 - 1), v38, &v39, v16);
        int v35 = v39;
      }
      if (v26 >= v8) {
        break;
      }
      ++v26;
      v17 += 40;
      v14 += 160;
      v10 += 4;
      v12 += 32;
    }
    while (!v35);
  }
}

- (void)clearEntities
{
  size_t v3 = 4 * [(PXGSpriteDataStore *)self count];
  entities = self->_entities;

  bzero(entities, v3);
}

- (void)copySpritesInRange:(_PXGSpriteIndexRange)a3 fromSpriteDataStore:(id)a4
{
  id v7 = a4;
  unint64_t v8 = HIDWORD(*(unint64_t *)&a3);
  if (a3.var1 + a3.var0 > [v7 count])
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGSpriteDataStore.m", 181, @"Invalid parameter not satisfying: %@", @"PXGSpriteIndexRangeMax(spriteIndexRange) <= fromSpriteDataStore.count" object file lineNumber description];
  }
  [(PXGSpriteDataStore *)self _mutableSpritesInRange:a3];
  if (v7) {
    [v7 _mutableSpritesInRange:a3];
  }
  memcpy(0, 0, 4 * v8);
  memcpy(0, 0, 32 * v8);
  memcpy(0, 0, 160 * v8);
  memcpy(0, 0, 40 * v8);
}

- ($B0083419B7591A93B72A99AB8D6AC1B6)spriteAtIndex:(SEL)a3
{
  unsigned int v6 = self;
  id v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v6 entities] + 4 * a4);
  unint64_t v8 = v6;
  uint64_t v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v8 geometries] + 32 * a4);
  uint64_t v10 = v8;
  uint64_t v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v10 styles] + 160 * a4);
  result = [(PXGSpriteDataStore *)v10 infos];
  retstr->unsigned int var0 = v7;
  retstr->$75DC967394D75D22597118241CE31CB7 var1 = v9;
  retstr->var2 = v11;
  retstr->var3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)result + 40 * a4);
  return result;
}

- ($B0083419B7591A93B72A99AB8D6AC1B6)_mutableSpritesInRange:(SEL)a3
{
  unsigned int var0 = a4.var0;
  if (a4.var1 + a4.var0 > [(PXGSpriteDataStore *)self count])
  {
    __n128 v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a3, self, @"PXGSpriteDataStore.m", 156, @"Invalid parameter not satisfying: %@", @"PXGSpriteIndexRangeMax(range) <= self.count" object file lineNumber description];
  }
  uint64_t v8 = var0;
  uint64_t v9 = self;
  uint64_t v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v9 entities] + 4 * var0);
  uint64_t v11 = v9;
  uint64_t v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v11 geometries] + 32 * v8);
  uint64_t v13 = v11;
  uint64_t v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)([(PXGSpriteDataStore *)v13 styles] + 160 * v8);
  result = [(PXGSpriteDataStore *)v13 infos];
  retstr->unsigned int var0 = v10;
  retstr->$75DC967394D75D22597118241CE31CB7 var1 = v12;
  retstr->var2 = v14;
  retstr->var3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)result + 40 * v8);
  return result;
}

- (void)applyChangeDetails:(id)a3
{
  id v4 = a3;
  -[PXGSpriteDataStore setCount:](self, "setCount:", [v4 numberOfSpritesAfterChange]- objc_msgSend(v4, "numberOfSpritesBeforeChange")+ -[PXGSpriteDataStore count](self, "count"));
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_entities, 4, -[PXGSpriteDataStore count](self, "count"), 0, 0);
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_geometries, 32, -[PXGSpriteDataStore count](self, "count"), 0, 0);
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_styles, 160, -[PXGSpriteDataStore count](self, "count"), 0, 0);
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", self->_infos, 40, -[PXGSpriteDataStore count](self, "count"), 0, 0);
}

- (void)moveSpritesInRange:(_PXGSpriteIndexRange)a3 toRange:(_PXGSpriteIndexRange)a4
{
  objc_msgSend(MEMORY[0x263F5E328], "changeDetailsWithMovedFromIndexRange:toIndexRange:", a3.var0, a3.var1, a4.var0, a4.var1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v7 movesFromIndexes];
  unsigned int v6 = [v7 movesToIndexes];
  [(PXGSpriteDataStore *)self moveSpritesFromIndexes:v5 toIndexes:v6];
}

- (void)moveSpritesFromIndexes:(__CFArray *)a3 toIndexes:(id)a4
{
  id v7 = a4;
  CFIndex Count = CFArrayGetCount(a3);
  uint64_t v9 = [v7 count];
  uint64_t v10 = v9;
  if (Count < 1 || v9 <= 0)
  {
    int v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXGSpriteDataStore.m", 103, @"Invalid parameter not satisfying: %@", @"fromIndexesCount > 0 && toIndexesCount > 0" object file lineNumber description];
  }
  if (Count != v10)
  {
    long long v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PXGSpriteDataStore.m", 104, @"Invalid parameter not satisfying: %@", @"fromIndexesCount == toIndexesCount" object file lineNumber description];
  }
  if (![(PXGSpriteDataStore *)self count])
  {
    long long v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PXGSpriteDataStore.m", 105, @"Invalid parameter not satisfying: %@", @"self.count != 0" object file lineNumber description];
  }
  unsigned int v11 = [(PXGSpriteDataStore *)self count];
  [(PXGSpriteDataStore *)self setCount:[(PXGSpriteDataStore *)self count] + v10];
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  if (Count < 1)
  {
    BOOL v34 = &v41;
  }
  else
  {
    for (CFIndex i = 0; i < Count; v42[3] = i)
    {
      ValueAtIndedouble x = CFArrayGetValueAtIndex(a3, i);
      uint64_t v14 = v42[3] + v11;
      self->_entities[v14].unsigned int var0 = self->_entities[(void)ValueAtIndex].var0;
      geometries = self->_geometries;
      __n128 v16 = (_OWORD *)(&geometries->var0.var0 + 4 * v14);
      uint64_t v17 = (_OWORD *)(&geometries->var0.var0 + 4 * (void)ValueAtIndex);
      long long v18 = v17[1];
      *__n128 v16 = *v17;
      v16[1] = v18;
      styles = self->_styles;
      double v20 = (_OWORD *)(&styles->var0 + 40 * v14);
      float64x2_t v21 = (_OWORD *)(&styles->var0 + 40 * (void)ValueAtIndex);
      long long v22 = v21[1];
      *double v20 = *v21;
      v20[1] = v22;
      long long v23 = v21[2];
      long long v24 = v21[3];
      long long v25 = v21[5];
      v20[4] = v21[4];
      v20[5] = v25;
      v20[2] = v23;
      v20[3] = v24;
      long long v26 = v21[6];
      long long v27 = v21[7];
      long long v28 = v21[9];
      v20[8] = v21[8];
      v20[9] = v28;
      v20[6] = v26;
      v20[7] = v27;
      infos = self->_infos;
      double v30 = (char *)infos + 40 * v14;
      BOOL v31 = (char *)infos + 40 * (void)ValueAtIndex;
      uint64_t v32 = *((void *)v31 + 4);
      long long v33 = *((_OWORD *)v31 + 1);
      *(_OWORD *)double v30 = *(_OWORD *)v31;
      *((_OWORD *)v30 + 1) = v33;
      *((void *)v30 + 4) = v32;
      BOOL v34 = v42;
      CFIndex i = v42[3] + 1;
    }
  }
  v34[3] = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __55__PXGSpriteDataStore_moveSpritesFromIndexes_toIndexes___block_invoke;
  v38[3] = &unk_265556A18;
  unsigned int v39 = v11;
  int v40 = v10;
  void v38[4] = self;
  v38[5] = &v41;
  [v7 enumerateRangesUsingBlock:v38];
  [(PXGSpriteDataStore *)self setCount:[(PXGSpriteDataStore *)self count] - v10];
  _Block_object_dispose(&v41, 8);
}

__n128 __55__PXGSpriteDataStore_moveSpritesFromIndexes_toIndexes___block_invoke(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = a2 + a3;
  if (v3 > a2)
  {
    uint64_t v4 = v3 - a2;
    uint64_t v5 = 4 * a2;
    uint64_t v6 = 40 * a2;
    uint64_t v7 = 160 * a2;
    do
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + *(unsigned int *)(a1 + 48);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 16) + v5) = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 16)
                                                                             + 4 * v8);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
      uint64_t v10 = (_OWORD *)(v9 + 8 * v5);
      unsigned int v11 = (_OWORD *)(v9 + 32 * v8);
      long long v12 = v11[1];
      *uint64_t v10 = *v11;
      v10[1] = v12;
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
      uint64_t v14 = (_OWORD *)(v13 + v7);
      uint64_t v15 = (_OWORD *)(v13 + 160 * v8);
      long long v16 = v15[5];
      long long v18 = v15[2];
      long long v17 = v15[3];
      v14[4] = v15[4];
      v14[5] = v16;
      v14[2] = v18;
      v14[3] = v17;
      long long v19 = v15[9];
      long long v21 = v15[6];
      long long v20 = v15[7];
      v14[8] = v15[8];
      v14[9] = v19;
      v14[6] = v21;
      v14[7] = v20;
      long long v22 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v22;
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 40);
      uint64_t v24 = v23 + 40 * v8;
      __n128 result = *(__n128 *)v24;
      long long v26 = *(_OWORD *)(v24 + 16);
      uint64_t v27 = v23 + v6;
      *(void *)(v27 + 32) = *(void *)(v24 + 32);
      *(__n128 *)uint64_t v27 = result;
      *(_OWORD *)(v27 + 16) = v26;
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v6 += 40;
      v7 += 160;
      v5 += 4;
      --v4;
    }
    while (v4);
  }
  return result;
}

- (void)dealloc
{
  free(self->_entities);
  free(self->_geometries);
  free(self->_styles);
  free(self->_infos);
  v3.receiver = self;
  v3.super_class = (Class)PXGSpriteDataStore;
  [(PXGSpriteDataStore *)&v3 dealloc];
}

- (PXGSpriteDataStore)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGSpriteDataStore.m", 38, @"%s is not available as initializer", "-[PXGSpriteDataStore init]");

  abort();
}

@end