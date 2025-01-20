@interface PXGPPTAnimationLayout
- (NSString)configurationDescription;
- (PXGPPTAnimationLayout)init;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)style;
- (unsigned)numberOfColumns;
- (unsigned)numberOfRows;
- (void)_updateContent;
- (void)referenceSizeDidChange;
- (void)setNumberOfColumns:(unsigned int)a3;
- (void)setNumberOfRows:(unsigned int)a3;
- (void)setStyle:(int64_t)a3;
- (void)update;
@end

@implementation PXGPPTAnimationLayout

- (void).cxx_destruct
{
}

- (int64_t)style
{
  return self->_style;
}

- (unsigned)numberOfColumns
{
  return self->_numberOfColumns;
}

- (unsigned)numberOfRows
{
  return self->_numberOfRows;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  colors = self->_colors;
  unint64_t v5 = a3 % [(NSArray *)colors count];
  return [(NSArray *)colors objectAtIndexedSubscript:v5];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGPPTAnimationLayout setStyle:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGPPTAnimationLayout.m", 172, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setNumberOfColumns:(unsigned int)a3
{
  if (self->_numberOfColumns != a3)
  {
    self->_numberOfColumns = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGPPTAnimationLayout setNumberOfColumns:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGPPTAnimationLayout.m", 164, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setNumberOfRows:(unsigned int)a3
{
  if (self->_numberOfRows != a3)
  {
    self->_numberOfRows = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGPPTAnimationLayout setNumberOfRows:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGPPTAnimationLayout.m", 156, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGPPTAnimationLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[PXGPPTAnimationLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGPPTAnimationLayout.m", 148, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (NSString)configurationDescription
{
  [(PXGLayout *)self updateIfNeeded];
  unsigned int v3 = [(PXGLayout *)self numberOfSprites];
  LODWORD(v4) = v3 / 0x3E8;
  unint64_t v5 = &stru_1F00B0030;
  if (v3 <= 0x3E7) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v4;
  }
  if (v3 > 0x3E7) {
    unint64_t v5 = @"k";
  }
  return (NSString *)[NSString stringWithFormat:@"%li%@_Sprites", v4, v5];
}

- (void)_updateContent
{
  unsigned int v3 = [(PXGPPTAnimationLayout *)self numberOfRows];
  unsigned int v4 = [(PXGPPTAnimationLayout *)self numberOfColumns];
  uint64_t v5 = v4 * v3;
  unsigned int v6 = [(PXGLayout *)self numberOfSprites];
  if (v5 >= v6)
  {
    if (v5 > v6) {
      [(PXGLayout *)self addSpritesInRange:v6 | ((unint64_t)(v5 - v6) << 32) initialState:&__block_literal_global_122069];
    }
  }
  else
  {
    [(PXGLayout *)self removeSpritesInRange:v5 | ((unint64_t)(v6 - v5) << 32)];
  }
  [(PXGLayout *)self referenceSize];
  *(void *)&v10.f64[0] = v7;
  v10.f64[1] = v8;
  __asm { FMOV            V2.2D, #0.5 }
  float32x2_t v16 = vcvt_f32_f64(vmulq_f64(v10, _Q2));
  long long v27 = v7;
  if (*(double *)&v7 >= v8) {
    *(double *)&long long v7 = v8;
  }
  float v17 = *(double *)&v7 * 0.5;
  int64_t v18 = [(PXGPPTAnimationLayout *)self style];
  if (v18 == 1)
  {
    float v25 = 6.28318531 / (double)v4;
    v30[1] = 3221225472;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[2] = __39__PXGPPTAnimationLayout__updateContent__block_invoke_3;
    v30[3] = &__block_descriptor_64_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    uint64_t v20 = v5 << 32;
    unsigned int v31 = v4;
    float v32 = v25;
    float v33 = v17 / (float)v3;
    __asm { FMOV            V0.2S, #10.0 }
    v30[4] = v16;
    v30[5] = _D0;
    int v34 = 1065353216;
    v24 = v30;
    goto LABEL_11;
  }
  if (!v18)
  {
    uint64_t v20 = v5 << 32;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __39__PXGPPTAnimationLayout__updateContent__block_invoke_2;
    v35[3] = &__block_descriptor_76_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    unsigned int v36 = v4;
    *(float32x2_t *)v19.i8 = vcvt_f32_u32((uint32x2_t)vadd_s32((int32x2_t)__PAIR64__(v3, v4), (int32x2_t)-1));
    _Q0 = (float32x4_t)vzip1q_s32(v19, v19);
    v22.i64[0] = 0x3F0000003F000000;
    v22.i64[1] = 0x3F0000003F000000;
    v23.i64[0] = 0x4000000040000000;
    v23.i64[1] = 0x4000000040000000;
    int32x4_t v37 = vtrn2q_s32(vrev64q_s32((int32x4_t)vmulq_f32(_Q0, v22)), (int32x4_t)vdivq_f32(v23, _Q0));
    float v38 = v17 * 0.75;
    __asm { FMOV            V0.2S, #1.0 }
    v35[4] = v16;
    v35[5] = _Q0.i64[0];
    int v39 = 1056964608;
    v24 = v35;
LABEL_11:
    [(PXGLayout *)self modifySpritesInRange:v20 state:v24];
  }
  -[PXGLayout setContentSize:](self, "setContentSize:", v28, v29);
}

float __39__PXGPPTAnimationLayout__updateContent__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, float *a4)
{
  unint64_t v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    do
    {
      unsigned int v5 = *(_DWORD *)(a1 + 48);
      float v6 = (float)((float)(a2 / v5) - *(float *)(a1 + 60)) * *(float *)(a1 + 64);
      float v7 = *(float *)(a1 + 68);
      *(double *)a3 = (float)(COERCE_FLOAT(*(void *)(a1 + 32))
                            + (float)((float)((float)((float)(a2 % v5) - *(float *)(a1 + 52))
                                            * *(float *)(a1 + 56))
                                    * v7));
      *(double *)(a3 + 8) = (float)(*(float *)(a1 + 36) + (float)(v6 * v7));
      *(void *)(a3 + 24) = *(void *)(a1 + 40);
      float result = *(float *)(a1 + 72);
      *a4 = result;
      a4 += 40;
      LODWORD(a2) = a2 + 1;
      a3 += 32;
      LODWORD(v4) = v4 - 1;
    }
    while (v4);
  }
  return result;
}

void __39__PXGPPTAnimationLayout__updateContent__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4)
{
  unint64_t v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v7 = a2;
    do
    {
      unsigned int v9 = *(_DWORD *)(a1 + 48);
      float v10 = *(float *)(a1 + 56) * (float)(v7 / v9);
      __float2 v11 = __sincosf_stret(*(float *)(a1 + 52) * (float)(v7 % v9));
      *(double *)a3 = (float)(COERCE_FLOAT(*(void *)(a1 + 32)) + (float)(v11.__cosval * v10));
      *(double *)(a3 + 8) = (float)(*(float *)(a1 + 36) + (float)(v11.__sinval * v10));
      *(void *)(a3 + 24) = *(void *)(a1 + 40);
      *a4 = *(_DWORD *)(a1 + 60);
      a4 += 40;
      ++v7;
      a3 += 32;
      LODWORD(v4) = v4 - 1;
    }
    while (v4);
  }
}

void __39__PXGPPTAnimationLayout__updateContent__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v5 = (_OWORD *)a3[3];
    uint64_t v4 = a3[4];
    float v6 = (float32x2_t *)a3[2];
    CGFloat v7 = *MEMORY[0x1E4F1DB28];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    long long v32 = *(_OWORD *)off_1E5DAAF90;
    long long v30 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v31 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v28 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v29 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v26 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v27 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v25 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v23 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v24 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v21 = *((_OWORD *)off_1E5DAAF88 + 1);
    long long v22 = *(_OWORD *)off_1E5DAAF88;
    __asm { FMOV            V14.2S, #10.0 }
    uint64_t v16 = *((void *)off_1E5DAAF88 + 4);
    do
    {
      v34.origin.x = v7;
      v34.origin.y = v8;
      v34.size.width = v9;
      v34.size.height = v10;
      CGFloat MidX = CGRectGetMidX(v34);
      v35.origin.x = v7;
      v35.origin.y = v8;
      v35.size.width = v9;
      v35.size.height = v10;
      CGFloat MidY = CGRectGetMidY(v35);
      v36.origin.x = v7;
      v36.origin.y = v8;
      v36.size.width = v9;
      v36.size.height = v10;
      CGFloat Width = CGRectGetWidth(v36);
      v37.origin.x = v7;
      v37.origin.y = v8;
      v37.size.width = v9;
      v37.size.height = v10;
      CGFloat Height = CGRectGetHeight(v37);
      v20.f64[0] = Width;
      v20.f64[1] = Height;
      *(CGFloat *)float v6 = MidX;
      *(CGFloat *)&v6[1] = MidY;
      v6[2] = 0;
      v6[3] = vcvt_f32_f64(v20);
      *unsigned int v5 = v32;
      v5[1] = v31;
      v5[4] = v29;
      v5[5] = v30;
      v5[2] = v27;
      v5[3] = v28;
      v5[8] = v25;
      v5[9] = v26;
      v5[6] = v23;
      v5[7] = v24;
      *(void *)(v4 + 32) = v16;
      *(_OWORD *)uint64_t v4 = v22;
      *(_OWORD *)(v4 + 16) = v21;
      *(unsigned char *)(v4 + 1) = 5;
      *(void *)(v4 + 8) = _D14;
      v5 += 10;
      v6 += 4;
      v4 += 40;
      LODWORD(v3) = v3 - 1;
    }
    while (v3);
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      unsigned int v5 = [MEMORY[0x1E4F28B00] currentHandler];
      float v6 = [NSString stringWithUTF8String:"-[PXGPPTAnimationLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXGPPTAnimationLayout.m", 45, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGPPTAnimationLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      CGFloat v7 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v8 = [NSString stringWithUTF8String:"-[PXGPPTAnimationLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGPPTAnimationLayout.m", 49, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTAnimationLayout;
  [(PXGLayout *)&v9 update];
}

- (PXGPPTAnimationLayout)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXGPPTAnimationLayout;
  v2 = [(PXGLayout *)&v9 init];
  if (v2)
  {
    unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:101];
    for (unint64_t i = 0; i != 101; ++i)
    {
      unsigned int v5 = [MEMORY[0x1E4FB1618] colorWithHue:(double)i / 101.0 saturation:1.0 brightness:1.0 alpha:1.0];
      [v3 addObject:v5];
    }
    uint64_t v6 = [v3 copy];
    colors = v2->_colors;
    v2->_colors = (NSArray *)v6;

    [(PXGLayout *)v2 setContentSource:v2];
  }
  return v2;
}

@end