@interface PXGSublayoutDataStore
- ($3E2DF284A90EA61521E3C11DCA85D21B)geometries;
- ($3E2DF284A90EA61521E3C11DCA85D21B)geometryForSublayout:(SEL)a3;
- ($70F8FB89805F9D8BAB6060F0E8A4CB7F)infos;
- (NSString)diagnosticDescription;
- (id)sublayoutAtIndex:(int64_t)a3;
- (id)sublayoutProviderAtIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)indexOfSublayout:(id)a3;
- (int64_t)version;
- (unsigned)spriteIndexOriginForSublayout:(id)a3;
- (unsigned)spriteIndexOriginForSublayoutIndex:(int64_t)a3;
- (void)_insertRange:(_NSRange)a3;
- (void)_invalidateVersion;
- (void)dealloc;
- (void)enumerateSublayoutGeometriesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateSublayoutGeometriesUsingBlock:(id)a3;
- (void)enumerateSublayoutsAtPoint:(CGPoint)a3 usingBlock:(id)a4;
- (void)enumerateSublayoutsInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateSublayoutsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)enumerateSublayoutsUsingBlock:(id)a3;
- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4;
- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4;
- (void)moveSublayoutsFromIndexes:(__CFArray *)a3 toIndexes:(id)a4;
- (void)removeSublayoutsInRange:(_NSRange)a3;
- (void)setCount:(int64_t)a3;
@end

@implementation PXGSublayoutDataStore

- (void)enumerateSublayoutsUsingBlock:(id)a3
{
  id v4 = a3;
  -[PXGSublayoutDataStore enumerateSublayoutsInRange:options:usingBlock:](self, "enumerateSublayoutsInRange:options:usingBlock:", 0, [(PXGSublayoutDataStore *)self count], 0, v4);
}

- (int64_t)count
{
  return self->_count;
}

- (void)enumerateSublayoutsInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10 = (void (**)(id, uint64_t, void *, unsigned char *))a5;
  if (location + length > [(PXGSublayoutDataStore *)self count])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 202, @"Invalid parameter not satisfying: %@", @"NSMaxRange(range) <= self.count" object file lineNumber description];
  }
  if ((v5 & 2) != 0) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = 1;
  }
  v12 = [(PXGSublayoutDataStore *)self infos];
  char v16 = 0;
  if (length)
  {
    if ((v5 & 2) != 0) {
      uint64_t v13 = location + length - 1;
    }
    else {
      uint64_t v13 = location;
    }
    v14 = &v12[v13];
    do
    {
      if (v14->var0)
      {
        v10[2](v10, v13, v14->var0, &v16);
        if (v16) {
          break;
        }
      }
      v13 += v11;
      v14 += v11;
      --length;
    }
    while (length);
  }
}

- ($70F8FB89805F9D8BAB6060F0E8A4CB7F)infos
{
  return self->_infos;
}

uint64_t __55__PXGSublayoutDataStore_spriteIndexOriginForSublayout___block_invoke(uint64_t result, uint64_t a2, void *a3, unsigned char *a4)
{
  if (*(void **)(result + 32) == a3)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v4 = result;
    result = [a3 numberOfSprites];
    *(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) += result;
  }
  return result;
}

- (void)enumerateSublayoutGeometriesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v5 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10 = (void (**)(id, uint64_t, uint64_t, uint64_t, unsigned char *))a5;
  if (location + length > [(PXGSublayoutDataStore *)self count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v20.NSUInteger location = location;
    v20.NSUInteger length = length;
    v18 = NSStringFromRange(v20);
    [v17 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 264, @"range out of bounds %@ 0..%li", v18, -[PXGSublayoutDataStore count](self, "count") object file lineNumber description];

    if (!length) {
      goto LABEL_12;
    }
  }
  else if (!length)
  {
    goto LABEL_12;
  }
  BOOL v11 = (v5 & 2) == 0;
  if ((v5 & 2) != 0) {
    uint64_t v12 = location + length - 1;
  }
  else {
    uint64_t v12 = location;
  }
  if (v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }
  v14 = self;
  uint64_t v15 = (uint64_t)([(PXGSublayoutDataStore *)v14 geometries] + 136 * v12);
  uint64_t v16 = (uint64_t)([(PXGSublayoutDataStore *)v14 infos] + 16 * v12);
  char v19 = 0;
  do
  {
    v10[2](v10, v12, v15, v16, &v19);
    if (v19) {
      break;
    }
    v12 += v13;
    v16 += 16 * v13;
    v15 += 136 * v13;
    --length;
  }
  while (length);
LABEL_12:
}

- ($3E2DF284A90EA61521E3C11DCA85D21B)geometryForSublayout:(SEL)a3
{
  id v18 = a4;
  uint64_t v7 = [(PXGSublayoutDataStore *)self count];
  v8 = self;
  v9 = [(PXGSublayoutDataStore *)v8 infos];
  if (v7 < 1)
  {
LABEL_5:
    BOOL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a3, v8, @"PXGSublayoutDataStore.m", 194, @"couldn't find sublayout %@", v18 object file lineNumber description];

    abort();
  }
  uint64_t v10 = 0;
  while (v9->var0 != v18)
  {
    ++v10;
    ++v9;
    if (v7 == v10) {
      goto LABEL_5;
    }
  }
  uint64_t v12 = (uint64_t)([(PXGSublayoutDataStore *)v8 geometries] + 136 * v10);
  long long v13 = *(_OWORD *)(v12 + 112);
  *(_OWORD *)&retstr->var5.var0.d = *(_OWORD *)(v12 + 96);
  *(_OWORD *)&retstr->var5.var0.ty = v13;
  retstr->var6 = *(double *)(v12 + 128);
  long long v14 = *(_OWORD *)(v12 + 48);
  retstr->var3 = *(CGSize *)(v12 + 32);
  *(_OWORD *)&retstr->var4.var0 = v14;
  long long v15 = *(_OWORD *)(v12 + 80);
  *(_OWORD *)&retstr->var4.var2 = *(_OWORD *)(v12 + 64);
  *(_OWORD *)&retstr->var5.var0.b = v15;
  long long v16 = *(_OWORD *)(v12 + 16);
  retstr->var0 = *(CGSize *)v12;
  *(_OWORD *)&retstr->var1 = v16;

  return result;
}

- ($3E2DF284A90EA61521E3C11DCA85D21B)geometries
{
  return self->_geometries;
}

- (unsigned)spriteIndexOriginForSublayout:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PXGSublayoutDataStore_spriteIndexOriginForSublayout___block_invoke;
  v7[3] = &unk_1E5DBD708;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(PXGSublayoutDataStore *)self enumerateSublayoutsUsingBlock:v7];
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return self;
}

uint64_t __62__PXGSublayoutDataStore_enumerateSublayoutsInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, double *a3, void *a4)
{
  CGFloat v6 = a3[6];
  CGFloat v7 = a3[7];
  CGFloat v8 = a3[4];
  CGFloat v9 = a3[5];
  v17.origin.x = v6;
  v17.origin.y = v7;
  v17.size.width = v8;
  v17.size.height = v9;
  uint64_t result = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v17);
  if (result && *a4)
  {
    long long v15 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
    v11.n128_f64[0] = v6;
    v12.n128_f64[0] = v7;
    v13.n128_f64[0] = v8;
    v14.n128_f64[0] = v9;
    return v15(v11, v12, v13, v14);
  }
  return result;
}

- (int64_t)indexOfSublayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGSublayoutDataStore *)self count];
  CGFloat v6 = [(PXGSublayoutDataStore *)self infos];
  if (v5 < 1)
  {
LABEL_5:
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = 0;
    while (v6->var0 != v4)
    {
      ++v7;
      ++v6;
      if (v5 == v7) {
        goto LABEL_5;
      }
    }
  }

  return v7;
}

- (void)enumerateSublayoutGeometriesUsingBlock:(id)a3
{
  id v4 = a3;
  -[PXGSublayoutDataStore enumerateSublayoutGeometriesInRange:options:usingBlock:](self, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, [(PXGSublayoutDataStore *)self count], 0, v4);
}

- (id)sublayoutAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(PXGSublayoutDataStore *)self count] <= a3)
  {
    CGFloat v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 153, @"Invalid parameter not satisfying: %@", @"index >= 0 && index < self.count" object file lineNumber description];
  }
  CGFloat v6 = (void *)[(PXGSublayoutDataStore *)self infos][16 * a3];
  return v6;
}

- (void)insertSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  -[PXGSublayoutDataStore _insertRange:](self, "_insertRange:", a4, 1);
  int64_t v7 = self;
  uint64_t v8 = (uint64_t)([(PXGSublayoutDataStore *)v7 geometries] + 136 * a4);
  [v6 contentSize];
  *(void *)(v8 + 32) = v9;
  *(void *)(v8 + 40) = v10;
  __n128 v11 = (id *)([(PXGSublayoutDataStore *)v7 infos] + 16 * a4);
  id v12 = v6;
  if (*v11 != v12)
  {

    *__n128 v11 = v12;
  }
}

- (void)_insertRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  if (a3.location > [(PXGSublayoutDataStore *)self count])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 93, @"Invalid parameter not satisfying: %@", @"range.location <= self.count" object file lineNumber description];
  }
  [(PXGSublayoutDataStore *)self setCount:[(PXGSublayoutDataStore *)self count] + length];
  [(PXGSublayoutDataStore *)self count];
  _PXGArrayInsertRange();
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    int64_t capacity = self->_capacity;
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
        int64_t capacity = a3;
      }
      self->_int64_t capacity = capacity;
      _PXGArrayResize();
    }
    [(PXGSublayoutDataStore *)self _invalidateVersion];
  }
}

- (void)_invalidateVersion
{
  self->_version = (int)atomic_fetch_add(VersionMakeUnique_lastVersion, 1u);
}

- (void)enumerateSublayoutsInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PXGSublayoutDataStore_enumerateSublayoutsInRect_usingBlock___block_invoke;
  v11[3] = &unk_1E5DBB190;
  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;
  id v12 = v9;
  id v10 = v9;
  [(PXGSublayoutDataStore *)self enumerateSublayoutGeometriesUsingBlock:v11];
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)diagnosticDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p\n", v5, self];

  uint64_t v7 = [(PXGSublayoutDataStore *)self count];
  uint64_t v8 = self;
  [(PXGSublayoutDataStore *)v8 geometries];
  [(PXGSublayoutDataStore *)v8 infos];
  if (v7 >= 1) {
    PXGPositionDescription();
  }
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (void)enumerateSublayoutsAtPoint:(CGPoint)a3 usingBlock:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PXGSublayoutDataStore_enumerateSublayoutsAtPoint_usingBlock___block_invoke;
  v9[3] = &unk_1E5DBB1B8;
  CGFloat v11 = x;
  CGFloat v12 = y;
  id v10 = v7;
  id v8 = v7;
  [(PXGSublayoutDataStore *)self enumerateSublayoutGeometriesUsingBlock:v9];
}

uint64_t __63__PXGSublayoutDataStore_enumerateSublayoutsAtPoint_usingBlock___block_invoke(uint64_t a1, uint64_t a2, double *a3, void *a4)
{
  CGFloat v6 = a3[6];
  CGFloat v7 = a3[7];
  CGFloat v8 = a3[4];
  CGFloat v9 = a3[5];
  v17.origin.CGFloat x = v6;
  v17.origin.CGFloat y = v7;
  v17.size.CGFloat width = v8;
  v17.size.CGFloat height = v9;
  uint64_t result = CGRectContainsPoint(v17, *(CGPoint *)(a1 + 40));
  if (result && *a4)
  {
    CGFloat v15 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
    v11.n128_f64[0] = v6;
    v12.n128_f64[0] = v7;
    v13.n128_f64[0] = v8;
    v14.n128_f64[0] = v9;
    return v15(v11, v12, v13, v14);
  }
  return result;
}

- (unsigned)spriteIndexOriginForSublayoutIndex:(int64_t)a3
{
  uint64_t v6 = 0;
  CGFloat v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PXGSublayoutDataStore_spriteIndexOriginForSublayoutIndex___block_invoke;
  v5[3] = &unk_1E5DBB168;
  v5[4] = &v6;
  v5[5] = a3;
  [(PXGSublayoutDataStore *)self enumerateSublayoutsUsingBlock:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__PXGSublayoutDataStore_spriteIndexOriginForSublayoutIndex___block_invoke(uint64_t result, uint64_t a2, void *a3, unsigned char *a4)
{
  if (*(void *)(result + 40) == a2)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v4 = result;
    uint64_t result = [a3 numberOfSprites];
    *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 8) + 24) += result;
  }
  return result;
}

- (id)sublayoutProviderAtIndex:(int64_t)a3
{
  if (a3 < 0 || [(PXGSublayoutDataStore *)self count] <= a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 158, @"Invalid parameter not satisfying: %@", @"index >= 0 && index < self.count" object file lineNumber description];
  }
  uint64_t v6 = (void *)([(PXGSublayoutDataStore *)self infos] + 16 * a3)[8];
  return v6;
}

- (void)moveSublayoutsFromIndexes:(__CFArray *)a3 toIndexes:(id)a4
{
  id v7 = a4;
  CFIndex Count = CFArrayGetCount(a3);
  uint64_t v9 = [v7 count];
  uint64_t v10 = v9;
  if (Count < 1 || v9 <= 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 122, @"Invalid parameter not satisfying: %@", @"fromIndexesCount > 0 && toIndexesCount > 0" object file lineNumber description];
  }
  if (Count != v10)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 123, @"Invalid parameter not satisfying: %@", @"fromIndexesCount == toIndexesCount" object file lineNumber description];
  }
  if (![(PXGSublayoutDataStore *)self count])
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 124, @"Invalid parameter not satisfying: %@", @"self.count != 0" object file lineNumber description];
  }
  int64_t v11 = [(PXGSublayoutDataStore *)self count];
  [(PXGSublayoutDataStore *)self setCount:[(PXGSublayoutDataStore *)self count] + v10];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if (Count < 1)
  {
    v24 = &v29;
  }
  else
  {
    for (CFIndex i = 0; i < Count; v30[3] = i)
    {
      ValueAtIndeCGFloat x = CFArrayGetValueAtIndex(a3, i);
      int64_t v14 = v30[3] + v11;
      geometries = self->_geometries;
      CGFloat v16 = &geometries[v14];
      CGRect v17 = &geometries[(void)ValueAtIndex];
      long long v18 = *(_OWORD *)&v17->var4.var2;
      long long v20 = *(_OWORD *)&v17->var1;
      CGSize var3 = v17->var3;
      *(_OWORD *)&v16->var4.var0 = *(_OWORD *)&v17->var4.var0;
      *(_OWORD *)&v16->var4.var2 = v18;
      *(_OWORD *)&v16->var1 = v20;
      v16->CGSize var3 = var3;
      long long v22 = *(_OWORD *)&v17->var5.var0.d;
      long long v21 = *(_OWORD *)&v17->var5.var0.ty;
      long long v23 = *(_OWORD *)&v17->var5.var0.b;
      v16->var6 = v17->var6;
      *(_OWORD *)&v16->var5.var0.d = v22;
      *(_OWORD *)&v16->var5.var0.tCGFloat y = v21;
      *(_OWORD *)&v16->var5.var0.b = v23;
      v16->var0 = v17->var0;
      self->_infos[v14] = self->_infos[(void)ValueAtIndex];
      v24 = v30;
      CFIndex i = v30[3] + 1;
    }
  }
  v24[3] = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__PXGSublayoutDataStore_moveSublayoutsFromIndexes_toIndexes___block_invoke;
  v28[3] = &unk_1E5DBB140;
  v28[6] = v11;
  v28[7] = v10;
  v28[4] = self;
  v28[5] = &v29;
  [v7 enumerateRangesUsingBlock:v28];
  [(PXGSublayoutDataStore *)self setCount:[(PXGSublayoutDataStore *)self count] - v10];
  _Block_object_dispose(&v29, 8);
}

__n128 __61__PXGSublayoutDataStore_moveSublayoutsFromIndexes_toIndexes___block_invoke(void *a1, unsigned int a2, int a3)
{
  uint64_t v3 = a2 + a3;
  if (v3 > a2)
  {
    uint64_t v4 = v3 - a2;
    uint64_t v5 = 16 * a2;
    uint64_t v6 = 136 * a2;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24) + a1[6];
      uint64_t v8 = *(void *)(a1[4] + 24);
      uint64_t v9 = v8 + v6;
      uint64_t v10 = v8 + 136 * v7;
      long long v11 = *(_OWORD *)(v10 + 64);
      long long v13 = *(_OWORD *)(v10 + 16);
      long long v12 = *(_OWORD *)(v10 + 32);
      *(_OWORD *)(v9 + 48) = *(_OWORD *)(v10 + 48);
      *(_OWORD *)(v9 + 64) = v11;
      *(_OWORD *)(v9 + 16) = v13;
      *(_OWORD *)(v9 + 32) = v12;
      long long v15 = *(_OWORD *)(v10 + 96);
      long long v14 = *(_OWORD *)(v10 + 112);
      long long v16 = *(_OWORD *)(v10 + 80);
      *(void *)(v9 + 128) = *(void *)(v10 + 128);
      *(_OWORD *)(v9 + 96) = v15;
      *(_OWORD *)(v9 + 112) = v14;
      *(_OWORD *)(v9 + 80) = v16;
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      uint64_t v17 = *(void *)(a1[4] + 32);
      __n128 result = *(__n128 *)(v17 + 16 * v7);
      *(__n128 *)(v17 + v5) = result;
      ++*(void *)(*(void *)(a1[5] + 8) + 24);
      v5 += 16;
      v6 += 136;
      --v4;
    }
    while (v4);
  }
  return result;
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(PXGSublayoutDataStore *)self count])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGSublayoutDataStore.m", 82, @"Invalid parameter not satisfying: %@", @"NSMaxRange(range) <= self.count" object file lineNumber description];

    if (!length) {
      goto LABEL_7;
    }
  }
  else if (!length)
  {
    goto LABEL_7;
  }
  uint64_t v7 = &self->_infos[location];
  NSUInteger v8 = length;
  do
  {
    if (v7->var0)
    {

      v7->var0 = 0;
    }
    ++v7;
    --v8;
  }
  while (v8);
LABEL_7:
  [(PXGSublayoutDataStore *)self count];
  _PXGArrayRemoveRange();
}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  -[PXGSublayoutDataStore _insertRange:](self, "_insertRange:", location, length);
  uint64_t v7 = self;
  uint64_t v8 = [(PXGSublayoutDataStore *)v7 geometries];
  uint64_t v9 = [(PXGSublayoutDataStore *)v7 infos];
  if (length)
  {
    uint64_t v10 = (void *)(v9 + 16 * location + 8);
    long long v11 = (_OWORD *)(v8 + 136 * location + 32);
    long long v12 = *(_OWORD *)off_1E5DAB030;
    do
    {
      *long long v11 = v12;
      long long v11 = (_OWORD *)((char *)v11 + 136);
      *uint64_t v10 = v13;
      v10 += 2;
      --length;
    }
    while (length);
  }
}

- (void)dealloc
{
  int64_t count = self->_count;
  if (count >= 1)
  {
    int64_t v4 = 0;
    infos = self->_infos;
    do
    {
      if (infos->var0)
      {

        infos->var0 = 0;
        int64_t count = self->_count;
      }
      ++v4;
      ++infos;
    }
    while (v4 < count);
  }
  free(self->_geometries);
  free(self->_infos);
  v6.receiver = self;
  v6.super_class = (Class)PXGSublayoutDataStore;
  [(PXGSublayoutDataStore *)&v6 dealloc];
}

@end