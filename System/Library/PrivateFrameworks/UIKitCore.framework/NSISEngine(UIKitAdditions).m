@interface NSISEngine(UIKitAdditions)
- debugQuickLookObject;
@end

@implementation NSISEngine(UIKitAdditions)

- debugQuickLookObject
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t v3;
  void *v4;
  int8x8_t v5;
  int8x8_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIGraphicsImageRendererFormat *v16;
  UIGraphicsImageRenderer *v17;
  id v18;
  id v19;
  __int32 v21;
  void v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  _DWORD *v30;
  void v31[4];
  __int32 v32;
  void aBlock[4];
  __int32 v34;
  uint64_t vars8;

  v1 = [a1 traceState];
  v2 = (_DWORD *)v1;
  if (v1)
  {
    v3 = *(unsigned int *)(v1 + 24);
    if (v3)
    {
      v4 = *(void **)(v1 + 28);
      v5 = 0;
      do
      {
        v6 = *(int8x8_t *)v4;
        v4 = (void *)((char *)v4 + 9);
        v5 = vbsl_s8((int8x8_t)vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x4000000040000000)), (int8x8_t)vmax_u32((uint32x2_t)v5, (uint32x2_t)v6), v5);
        --v3;
      }
      while (v3);
    }
    else
    {
      v5 = 0;
    }
    v21 = v5.i32[0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke;
    aBlock[3] = &__block_descriptor_36_e8_I12__0I8l;
    v34 = v5.i32[1];
    v7 = _Block_copy(aBlock);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke_2;
    v31[3] = &__block_descriptor_36_e8_I12__0I8l;
    v32 = v21;
    v8 = _Block_copy(v31);
    v10 = v2[4];
    v9 = v2[5];
    if (v9 <= 1) {
      v9 = 1;
    }
    if (v10 <= 1) {
      v10 = 1;
    }
    v11 = (double)v9;
    v12 = 1024.0 / (double)v10;
    if (1024.0 / (double)v9 < v12) {
      v12 = 1024.0 / v11;
    }
    v13 = fmax(v12, 1.0);
    v14 = v13 * v11;
    v15 = v13 * (double)v10;
    v16 = objc_alloc_init(UIGraphicsImageRendererFormat);
    [(UIGraphicsImageRendererFormat *)v16 setScale:1.0];
    [(UIGraphicsImageRendererFormat *)v16 setOpaque:1];
    [(UIGraphicsImageRendererFormat *)v16 setPreferredRange:2];
    v17 = -[UIGraphicsImageRenderer initWithBounds:format:]([UIGraphicsImageRenderer alloc], "initWithBounds:format:", v16, 0.0, 0.0, v14, v15);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__NSISEngine_UIKitAdditions__debugQuickLookObject__block_invoke_3;
    v22[3] = &unk_1E530E5C0;
    v25 = 0;
    v26 = 0;
    v27 = v14;
    v28 = v15;
    v29 = v13;
    v30 = v2;
    v23 = v7;
    v24 = v8;
    v18 = v8;
    v19 = v7;
    v2 = [(UIGraphicsImageRenderer *)v17 imageWithActions:v22];
  }
  return v2;
}

@end