@interface PXGRoundedCornerMaskLayout
- (BOOL)continuousCorners;
- (PXGPath)topLeftPath;
- (PXGRoundedCornerMaskLayout)initWithCornerRadius:(double)a3 continuousCorners:(BOOL)a4 maskColor:(id)a5;
- (UIColor)maskColor;
- (UIEdgeInsets)insets;
- (double)cornerRadius;
- (double)leftMaskWidth;
- (double)maskScale;
- (double)rightMaskWidth;
- (void)_invalidateContent;
- (void)_invalidatePath;
- (void)_updateContent;
- (void)_updatePath;
- (void)contentSizeDidChange;
- (void)displayScaleDidChange;
- (void)referenceSizeDidChange;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setLeftMaskWidth:(double)a3;
- (void)setMaskColor:(id)a3;
- (void)setMaskScale:(double)a3;
- (void)setRightMaskWidth:(double)a3;
- (void)setTopLeftPath:(id)a3;
- (void)update;
@end

@implementation PXGRoundedCornerMaskLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLeftPath, 0);
  objc_storeStrong((id *)&self->_maskColor, 0);
}

- (PXGPath)topLeftPath
{
  return self->_topLeftPath;
}

- (double)rightMaskWidth
{
  return self->_rightMaskWidth;
}

- (double)leftMaskWidth
{
  return self->_leftMaskWidth;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)maskScale
{
  return self->_maskScale;
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_updateContent
{
}

void __44__PXGRoundedCornerMaskLayout__updateContent__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 112)) {
    PXEdgesFlippedHorizontally();
  }
  PXRectWithSizeAlignedToRectEdges();
}

float32x2_t __44__PXGRoundedCornerMaskLayout__updateContent__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [*(id *)(a1 + 32) leftMaskWidth];
  CGFloat v9 = v8 * *(double *)(a1 + 40);
  [*(id *)(a1 + 32) rightMaskWidth];
  CGFloat v11 = v10 * *(double *)(a1 + 40);
  CGFloat v12 = *(double *)(a1 + 48) - v9;
  CGFloat v13 = *(double *)(a1 + 72);
  float v14 = *(double *)(a1 + 80);
  v31.origin.y = 0.0;
  v31.origin.CGFloat x = v12;
  v31.size.width = v9;
  v31.size.height = v13;
  CGFloat MidX = CGRectGetMidX(v31);
  v32.origin.y = 0.0;
  v32.origin.CGFloat x = v12;
  v32.size.width = v9;
  v32.size.height = v13;
  CGFloat MidY = CGRectGetMidY(v32);
  v33.origin.y = 0.0;
  v33.origin.CGFloat x = v12;
  v33.size.width = v9;
  v33.size.height = v13;
  CGFloat Width = CGRectGetWidth(v33);
  v34.origin.y = 0.0;
  v34.origin.CGFloat x = v12;
  v34.size.width = v9;
  v34.size.height = v13;
  CGFloat Height = CGRectGetHeight(v34);
  v18.f64[0] = Width;
  v18.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)(a3 + 8) = MidY;
  *(double *)(a3 + 16) = v14;
  *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v18);
  uint64_t v19 = *(void *)(a1 + 48);
  v18.f64[0] = *(float64_t *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  v35.origin.CGFloat x = CGRectGetMaxX(*(CGRect *)((char *)&v18 - 8));
  CGFloat x = v35.origin.x;
  CGFloat v23 = *(double *)(a1 + 72);
  *(float *)&CGFloat MidY = *(double *)(a1 + 80);
  v35.origin.y = 0.0;
  v35.size.width = v11;
  v35.size.height = v23;
  CGFloat v24 = CGRectGetMidX(v35);
  v36.origin.y = 0.0;
  v36.origin.CGFloat x = x;
  v36.size.width = v11;
  v36.size.height = v23;
  CGFloat v25 = CGRectGetMidY(v36);
  v37.origin.y = 0.0;
  v37.origin.CGFloat x = x;
  v37.size.width = v11;
  v37.size.height = v23;
  CGFloat v30 = CGRectGetWidth(v37);
  v38.origin.y = 0.0;
  v38.origin.CGFloat x = x;
  v38.size.width = v11;
  v38.size.height = v23;
  CGFloat v26 = CGRectGetHeight(v38);
  v27.f64[0] = v30;
  v27.f64[1] = v26;
  float32x2_t result = vcvt_f32_f64(v27);
  *(CGFloat *)(a3 + 32) = v24;
  *(CGFloat *)(a3 + 40) = v25;
  *(double *)(a3 + 48) = *(float *)&MidY;
  *(float32x2_t *)(a3 + 56) = result;
  *(_WORD *)(a5 + 32) = *(void *)(*(void *)(a1 + 32) + 880);
  *(_WORD *)(a5 + 72) = *(void *)(*(void *)(a1 + 32) + 880);
  return result;
}

- (void)_invalidateContent
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXGRoundedCornerMaskLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGRoundedCornerMaskLayout.m", 183, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updatePath
{
  id v10 = +[PXGCornerMaskPathLibrary sharedLibrary];
  [(PXGRoundedCornerMaskLayout *)self cornerRadius];
  double v4 = v3;
  BOOL v5 = [(PXGRoundedCornerMaskLayout *)self continuousCorners];
  [(PXGLayout *)self displayScale];
  double v7 = v6;
  double v8 = [(PXGRoundedCornerMaskLayout *)self maskColor];
  CGFloat v9 = [v10 pathForCornerRadius:v5 continuousCorners:v8 screenScale:v4 maskColor:v7];
  [(PXGRoundedCornerMaskLayout *)self setTopLeftPath:v9];
}

- (void)_invalidatePath
{
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
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXGRoundedCornerMaskLayout _invalidatePath]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGRoundedCornerMaskLayout.m", 175, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
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
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXGRoundedCornerMaskLayout update]"];
      [v6 handleFailureInFunction:v7, @"PXGRoundedCornerMaskLayout.m", 163, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGRoundedCornerMaskLayout *)self _updatePath];
      if (!p_updateFlags->isPerformingUpdate)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        CGFloat v11 = [NSString stringWithUTF8String:"-[PXGRoundedCornerMaskLayout update]"];
        [v10 handleFailureInFunction:v11, @"PXGRoundedCornerMaskLayout.m", 167, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXGRoundedCornerMaskLayout *)self _updateContent];
      unint64_t v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v9 = [NSString stringWithUTF8String:"-[PXGRoundedCornerMaskLayout update]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGRoundedCornerMaskLayout.m", 170, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PXGRoundedCornerMaskLayout;
  [(PXGLayout *)&v12 update];
}

- (void)contentSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGRoundedCornerMaskLayout;
  [(PXGLayout *)&v3 contentSizeDidChange];
  [(PXGRoundedCornerMaskLayout *)self _invalidateContent];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGRoundedCornerMaskLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXGRoundedCornerMaskLayout *)self _invalidatePath];
  [(PXGRoundedCornerMaskLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGRoundedCornerMaskLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGLayout *)self referenceSize];
  -[PXGLayout setContentSize:](self, "setContentSize:");
}

- (void)setContinuousCorners:(BOOL)a3
{
  if (self->_continuousCorners != a3)
  {
    self->_continuousCorners = a3;
    ++self->_mediaVersion;
    [(PXGRoundedCornerMaskLayout *)self _invalidatePath];
  }
}

- (void)setTopLeftPath:(id)a3
{
  double v8 = (PXGPath *)a3;
  double v4 = self->_topLeftPath;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(PXGPath *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (PXGPath *)[(PXGPath *)v8 copy];
      topLeftPath = self->_topLeftPath;
      self->_topLeftPath = v6;

      [(PXGRoundedCornerMaskLayout *)self _invalidateContent];
    }
  }
}

- (void)setRightMaskWidth:(double)a3
{
  if (self->_rightMaskWidth != a3)
  {
    self->_rightMaskCGFloat Width = a3;
    [(PXGRoundedCornerMaskLayout *)self _invalidateContent];
  }
}

- (void)setLeftMaskWidth:(double)a3
{
  if (self->_leftMaskWidth != a3)
  {
    self->_leftMaskCGFloat Width = a3;
    [(PXGRoundedCornerMaskLayout *)self _invalidateContent];
  }
}

- (void)setMaskColor:(id)a3
{
  double v7 = (UIColor *)a3;
  char v5 = self->_maskColor;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIColor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maskColor, a3);
      ++self->_mediaVersion;
      [(PXGRoundedCornerMaskLayout *)self _invalidatePath];
    }
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius == a3)
  {
    self->_cornerRadius = a3;
    [(PXGRoundedCornerMaskLayout *)self _invalidatePath];
  }
}

- (void)setInsets:(UIEdgeInsets)a3
{
}

- (void)setMaskScale:(double)a3
{
  if (self->_maskScale != a3)
  {
    self->_maskScale = a3;
    [(PXGRoundedCornerMaskLayout *)self _invalidateContent];
  }
}

- (PXGRoundedCornerMaskLayout)initWithCornerRadius:(double)a3 continuousCorners:(BOOL)a4 maskColor:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXGRoundedCornerMaskLayout;
  id v10 = [(PXGLayout *)&v14 init];
  CGFloat v11 = v10;
  if (v10)
  {
    v10->_cornerRadius = a3;
    objc_storeStrong((id *)&v10->_maskColor, a5);
    v11->_maskScale = 1.0;
    v11->_continuousCorners = a4;
    long long v12 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&v11->_insets.double top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&v11->_insets.double bottom = v12;
    [(PXGLayout *)v11 setContentSource:v11];
    [(PXGLayout *)v11 applySpriteChangeDetails:0 countAfterChanges:4 initialState:0 modifyState:0];
    v11->_sideMaskSpriteIndexRange = [(PXGLayout *)v11 addSpriteCount:2 withInitialState:&__block_literal_global_195921];
    [(PXGRoundedCornerMaskLayout *)v11 _invalidatePath];
  }

  return v11;
}

void __79__PXGRoundedCornerMaskLayout_initWithCornerRadius_continuousCorners_maskColor___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  if (HIDWORD(a2))
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    long long v6 = *(_OWORD *)off_1E5DAAF70;
    long long v7 = *((_OWORD *)off_1E5DAAF70 + 1);
    long long v8 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v9 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v12 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v13 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v14 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v15 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v16 = *(_OWORD *)off_1E5DAAF90;
    long long v17 = *((_OWORD *)off_1E5DAAF90 + 1);
    __asm { FMOV            V20.2S, #1.0 }
    do
    {
      CGFloat v23 = (_OWORD *)(a3[2] + v5);
      *CGFloat v23 = v6;
      v23[1] = v7;
      CGFloat v24 = (_OWORD *)(a3[3] + v3);
      v24[6] = v8;
      v24[7] = v9;
      v24[8] = v10;
      v24[9] = v11;
      v24[2] = v12;
      v24[3] = v13;
      v24[4] = v14;
      v24[5] = v15;
      *CGFloat v24 = v16;
      v24[1] = v17;
      uint64_t v25 = a3[4] + v4;
      *(unsigned char *)(v25 + 1) = 5;
      *(void *)(v25 + 8) = _D20;
      v5 += 32;
      v4 += 40;
      v3 += 160;
    }
    while (((a2 >> 27) & 0x1FFFFFFFE0) != v5);
  }
}

@end