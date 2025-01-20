@interface PXStoryViewLegibilityOverlayLayout
- (NSNumber)alphaOverride;
- (PXStoryViewLegibilityOverlayLayout)init;
- (PXStoryViewLegibilityOverlayLayout)initWithViewModel:(id)a3;
- (PXStoryViewModel)viewModel;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (void)_invalidateContent;
- (void)_updateContent;
- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)setAlphaOverride:(id)a3;
- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)update;
@end

@implementation PXStoryViewLegibilityOverlayLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)ViewModelObservationContext_204905 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryViewLegibilityOverlayLayout.m" lineNumber:176 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 0x18000002A020) != 0)
  {
    id v11 = v9;
    [(PXStoryViewLegibilityOverlayLayout *)self _invalidateContent];
    id v9 = v11;
  }
}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  if (a3)
  {
    v5 = NSNumber;
    [a3 legibilityOverlayAlpha];
    objc_msgSend(v5, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PXStoryViewLegibilityOverlayLayout *)self setAlphaOverride:v6];
  }
  else
  {
    -[PXStoryViewLegibilityOverlayLayout setAlphaOverride:](self, "setAlphaOverride:");
  }
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5 = a3;
  [(PXGLayout *)self alpha];
  objc_msgSend(v5, "setLegibilityOverlayAlpha:");
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  v4 = [(PXStoryViewLegibilityOverlayLayout *)self viewModel];
  id v5 = [v4 viewLayoutSpec];
  id v6 = [v5 legibilityGradientImageConfiguration];

  return v6;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_solidDimmingSpriteIndex != a3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXStoryViewLegibilityOverlayLayout.m" lineNumber:148 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = v7;
  id v9 = +[PXStorySettings sharedInstance];
  int v10 = [v9 wantsHighContrastColors];

  if (v10) {
    [MEMORY[0x1E4FB1618] yellowColor];
  }
  else {
  id v11 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v11;
}

- (void)_updateContent
{
  [(PXGLayout *)self alpha];
  double v4 = v3;
  id v5 = [(PXStoryViewLegibilityOverlayLayout *)self alphaOverride];
  id v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    double v4 = v7;
  }
  [(PXGLayout *)self referenceSize];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  -[PXGLayout setContentSize:](self, "setContentSize:");
  v12 = [(PXStoryViewLegibilityOverlayLayout *)self viewModel];
  [(PXGLayout *)self referenceDepth];
  uint64_t v14 = v13;
  uint64_t v15 = [(PXGLayout *)self localNumberOfSprites];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__PXStoryViewLegibilityOverlayLayout__updateContent__block_invoke;
  v18[3] = &unk_1E5DC4870;
  uint64_t v16 = v15 << 32;
  uint64_t v21 = v9;
  uint64_t v22 = v11;
  id v19 = v12;
  v20 = self;
  double v23 = v4;
  uint64_t v24 = v14;
  id v17 = v12;
  [(PXGLayout *)self modifySpritesInRange:v16 state:v18];
}

void __52__PXStoryViewLegibilityOverlayLayout__updateContent__block_invoke(uint64_t a1)
{
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
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryViewLegibilityOverlayLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLegibilityOverlayLayout.m", 104, @"invalidating %lu after it already has been updated", 1);

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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryViewLegibilityOverlayLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXStoryViewLegibilityOverlayLayout.m", 95, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryViewLegibilityOverlayLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      float v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXStoryViewLegibilityOverlayLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryViewLegibilityOverlayLayout.m", 99, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryViewLegibilityOverlayLayout;
  [(PXGLayout *)&v9 update];
}

- (void)setAlphaOverride:(id)a3
{
  float v7 = (NSNumber *)a3;
  id v5 = self->_alphaOverride;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alphaOverride, a3);
      [(PXStoryViewLegibilityOverlayLayout *)self _invalidateContent];
    }
  }
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewLegibilityOverlayLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXStoryViewLegibilityOverlayLayout *)self _invalidateContent];
}

- (PXStoryViewLegibilityOverlayLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryViewLegibilityOverlayLayout;
  char v6 = [(PXGLayout *)&v14 init];
  float v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXStoryViewModel *)v7->_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_204905];
    [(PXGLayout *)v7 setContentSource:v7];
    v7->_solidDimmingSpriteIndex = [(PXGLayout *)v7 addSpriteWithInitialState:&__block_literal_global_204934];
    LODWORD(v8) = 1.0;
    v7->_gradientResizableCapInsetsIndex = -[PXGLayout addResizableCapInsets:](v7, "addResizableCapInsets:", 0.0, 0.0, v8, 0.0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_2;
    aBlock[3] = &unk_1E5DC4848;
    objc_super v9 = v7;
    uint64_t v13 = v9;
    uint64_t v10 = (uint64_t (**)(void *, void))_Block_copy(aBlock);
    v9->_topGradientDimmingSpriteIndex = v10[2](v10, 0);
    v9->_bottomGradientDimmingSpriteIndex = v10[2](v10, 1);
  }
  return v7;
}

uint64_t __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_2(uint64_t a1, char a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_3;
  v6[3] = &unk_1E5DC4820;
  id v7 = v3;
  char v8 = a2;
  uint64_t v4 = [v7 addSpriteWithInitialState:v6];

  return v4;
}

__n128 __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
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
  *objc_super v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v8;
  uint64_t v9 = *(void *)(a3 + 24);
  *(_WORD *)(v9 + 68) = *(_WORD *)(*(void *)(a1 + 32) + 884);
  if (*(unsigned char *)(a1 + 40)) {
    *(unsigned char *)(v9 + 70) = 2;
  }
  uint64_t v10 = *(void *)(a3 + 32);
  __n128 result = *(__n128 *)off_1E5DAAF88;
  long long v12 = *((_OWORD *)off_1E5DAAF88 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)off_1E5DAAF88;
  *(_OWORD *)(v10 + 16) = v12;
  *(void *)(v10 + 32) = *((void *)off_1E5DAAF88 + 4);
  uint64_t v13 = *(void *)(a3 + 32);
  *(unsigned char *)(v13 + 1) = 1;
  *(unsigned char *)(v13 + 34) = 2;
  return result;
}

double __56__PXStoryViewLegibilityOverlayLayout_initWithViewModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(_OWORD **)(a3 + 24);
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 7);
  v3[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v3[7] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 9);
  v3[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v3[9] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 3);
  v3[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v3[3] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 5);
  v3[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v3[5] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF90 + 1);
  *objc_super v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v8;
  uint64_t v9 = *(void *)(a3 + 32);
  *(unsigned char *)(v9 + 1) = 5;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v9 + 8) = result;
  return result;
}

- (PXStoryViewLegibilityOverlayLayout)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewLegibilityOverlayLayout.m", 43, @"%s is not available as initializer", "-[PXStoryViewLegibilityOverlayLayout init]");

  abort();
}

@end