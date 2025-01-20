@interface PXFeedTitleLayout
- (PXFeedTitleLayout)init;
- (PXFeedTitleLayout)initWithViewModel:(id)a3;
- (PXFeedViewModel)viewModel;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_invalidateAttributes;
- (void)_invalidateTitle;
- (void)_invalidateTitleContentVersion;
- (void)_updateAttributes;
- (void)_updateTitle;
- (void)displayScaleDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)update;
@end

@implementation PXFeedTitleLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_subtitleAttributes, 0);
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ViewModelObservationContext_212310 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXFeedTitleLayout.m" lineNumber:163 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v11 = v9;
  if ((v6 & 8) != 0)
  {
    [(PXFeedTitleLayout *)self _invalidateAttributes];
    [(PXFeedTitleLayout *)self _invalidateTitleContentVersion];
    id v9 = v11;
  }
  if ((v6 & 0x10) != 0)
  {
    [(PXFeedTitleLayout *)self _invalidateTitleContentVersion];
    id v9 = v11;
  }
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_subtitleAttributes;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  v4 = [(PXFeedTitleLayout *)self viewModel];
  v5 = [v4 subtitle];

  return v5;
}

- (void)_updateTitle
{
  v3 = [(PXFeedTitleLayout *)self viewModel];
  [(PXGLayout *)self displayScale];
  v4 = [v3 spec];
  [v4 subtitleInsets];
  double v6 = v5;
  double v8 = v7;

  id v9 = [v3 subtitle];
  [(PXGLayout *)self referenceSize];
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, self->_subtitleAttributes, 0, v10 - (v6 + v8), 1.79769313e308);
  [(PXGLayout *)self displayScale];
  PXSizeCeilingToPixel();
}

float32x2_t __33__PXFeedTitleLayout__updateTitle__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = *(float32x2_t **)(a3 + 16);
  CGFloat v6 = *(double *)(a1 + 40);
  CGFloat v7 = *(double *)(a1 + 48);
  CGFloat v8 = *(double *)(a1 + 56);
  CGFloat v9 = *(double *)(a1 + 64);
  v17.origin.x = v6;
  v17.origin.y = v7;
  v17.size.width = v8;
  v17.size.height = v9;
  CGFloat MidX = CGRectGetMidX(v17);
  v18.origin.x = v6;
  v18.origin.y = v7;
  v18.size.width = v8;
  v18.size.height = v9;
  CGFloat MidY = CGRectGetMidY(v18);
  v19.origin.x = v6;
  v19.origin.y = v7;
  v19.size.width = v8;
  v19.size.height = v9;
  CGFloat Width = CGRectGetWidth(v19);
  v20.origin.x = v6;
  v20.origin.y = v7;
  v20.size.width = v8;
  v20.size.height = v9;
  CGFloat Height = CGRectGetHeight(v20);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)double v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = 0;
  v5[3] = vcvt_f32_f64(v13);
  v14 = *(float32x2_t **)(a3 + 32);
  v14[4].i16[0] = *(_WORD *)(*(void *)(a1 + 32) + 876);
  *(float *)v13.f64 = *(double *)(a1 + 72);
  float32x2_t result = vmul_n_f32(*(float32x2_t *)(*(void *)(a3 + 16) + 24), *(float *)v13.f64);
  v14[1] = result;
  return result;
}

- (void)_invalidateTitle
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXFeedTitleLayout _invalidateTitle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedTitleLayout.m", 104, @"invalidating %lu after it already has been updated", 2);

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

- (void)_invalidateTitleContentVersion
{
}

- (void)_updateAttributes
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PXFeedTitleLayout *)self viewModel];
  v4 = [v3 spec];

  v9[0] = *MEMORY[0x1E4FB0700];
  double v5 = [v4 subtitleColor];
  v10[0] = v5;
  v9[1] = *MEMORY[0x1E4FB06F8];
  CGFloat v6 = [v4 subtitleFont];
  v10[1] = v6;
  CGFloat v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  subtitleAttributes = self->_subtitleAttributes;
  self->_subtitleAttributes = v7;

  [(PXFeedTitleLayout *)self _invalidateTitleContentVersion];
}

- (void)_invalidateAttributes
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXFeedTitleLayout _invalidateAttributes]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedTitleLayout.m", 86, @"invalidating %lu after it already has been updated", 1);

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
      CGFloat v6 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v7 = [NSString stringWithUTF8String:"-[PXFeedTitleLayout update]"];
      [v6 handleFailureInFunction:v7, @"PXFeedTitleLayout.m", 74, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXFeedTitleLayout *)self _updateAttributes];
      if (!p_updateFlags->isPerformingUpdate)
      {
        double v10 = [MEMORY[0x1E4F28B00] currentHandler];
        id v11 = [NSString stringWithUTF8String:"-[PXFeedTitleLayout update]"];
        [v10 handleFailureInFunction:v11, @"PXFeedTitleLayout.m", 78, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXFeedTitleLayout *)self _updateTitle];
      unint64_t v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      CGFloat v8 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v9 = [NSString stringWithUTF8String:"-[PXFeedTitleLayout update]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXFeedTitleLayout.m", 81, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PXFeedTitleLayout;
  [(PXGLayout *)&v12 update];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedTitleLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXFeedTitleLayout *)self _invalidateTitleContentVersion];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedTitleLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXFeedTitleLayout *)self _invalidateTitleContentVersion];
}

- (PXFeedTitleLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFeedTitleLayout;
  CGFloat v6 = [(PXGLayout *)&v9 init];
  CGFloat v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXFeedViewModel *)v7->_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_212310];
    v7->_titleSpriteIndex = [(PXGLayout *)v7 addSpriteWithInitialState:&__block_literal_global_212341];
    [(PXGLayout *)v7 setContentSource:v7];
    [(PXFeedTitleLayout *)v7 _invalidateTitle];
    [(PXFeedTitleLayout *)v7 _invalidateAttributes];
  }

  return v7;
}

__n128 __39__PXFeedTitleLayout_initWithViewModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(_OWORD **)(a3 + 24);
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 5);
  v3[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v3[5] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 3);
  v3[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v3[3] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 9);
  v3[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v3[9] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 7);
  v3[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v3[7] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 1);
  _OWORD *v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v8;
  uint64_t v9 = *(void *)(a3 + 32);
  *(void *)(v9 + 32) = *((void *)off_1E5DAAF88 + 4);
  __n128 result = *(__n128 *)off_1E5DAAF88;
  long long v11 = *((_OWORD *)off_1E5DAAF88 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)off_1E5DAAF88;
  *(_OWORD *)(v9 + 16) = v11;
  *(unsigned char *)(*(void *)(a3 + 32) + 1) = 3;
  return result;
}

- (PXFeedTitleLayout)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedTitleLayout.m", 39, @"%s is not available as initializer", "-[PXFeedTitleLayout init]");

  abort();
}

@end