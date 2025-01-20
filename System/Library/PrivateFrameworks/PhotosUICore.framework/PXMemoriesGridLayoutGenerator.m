@interface PXMemoriesGridLayoutGenerator
- (id)geometryKinds;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
@end

@implementation PXMemoriesGridLayoutGenerator

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v17.receiver = self;
  v17.super_class = (Class)PXMemoriesGridLayoutGenerator;
  -[PXGridLayoutGenerator getGeometries:inRange:withKind:](&v17, sel_getGeometries_inRange_withKind_);
  if (length && !__CFADD__(location, length - 1))
  {
    NSUInteger v9 = length + location;
    if (length + location <= location + 1) {
      NSUInteger v9 = location + 1;
    }
    NSUInteger v10 = v9 - location;
    unint64_t v11 = (v9 - location + 1) & 0xFFFFFFFFFFFFFFFELL;
    uint64x2_t v12 = (uint64x2_t)vdupq_n_s64(v10 - 1);
    int64x2_t v13 = (int64x2_t)xmmword_1AB2F42D0;
    p_var5 = &a3[1].var5;
    int64x2_t v15 = vdupq_n_s64(2uLL);
    do
    {
      int32x2_t v16 = vmovn_s64((int64x2_t)vcgeq_u64(v12, (uint64x2_t)v13));
      if (v16.i8[0]) {
        *(p_var5 - 19) = a5;
      }
      if (v16.i8[4]) {
        int64_t *p_var5 = a5;
      }
      int64x2_t v13 = vaddq_s64(v13, v15);
      p_var5 += 38;
      v11 -= 2;
    }
    while (v11);
  }
}

- (id)geometryKinds
{
  if (geometryKinds_onceToken_224251 != -1) {
    dispatch_once(&geometryKinds_onceToken_224251, &__block_literal_global_224252);
  }
  v2 = (void *)geometryKinds_kinds_224253;
  return v2;
}

void __46__PXMemoriesGridLayoutGenerator_geometryKinds__block_invoke()
{
  v0 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
  [v0 addIndex:2];
  v1 = (void *)geometryKinds_kinds_224253;
  geometryKinds_kinds_224253 = (uint64_t)v0;
}

@end