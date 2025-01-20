@interface PXStoryStyleChromeContainerLayout
- (NSSet)artworkPreloadingRecords;
- (PXNumberAnimator)visibilityAnimator;
- (PXStoryModel)storyModel;
- (PXStoryStyleChromeContainerLayout)init;
- (PXStoryStyleChromeContainerLayout)initWithViewModel:(id)a3;
- (PXStoryStyleManager)styleManager;
- (PXStoryViewModel)viewModel;
- (void)_invalidateResourcePreloading;
- (void)_invalidateStoryModel;
- (void)_invalidateStyleLayouts;
- (void)_invalidateStyleLayoutsContent;
- (void)_invalidateStyleManager;
- (void)_invalidateVisibilityAnimator;
- (void)_updateResourcePreloading;
- (void)_updateStoryModel;
- (void)_updateStyleLayouts;
- (void)_updateStyleLayoutsContent;
- (void)_updateStyleManager;
- (void)_updateVisibilityAnimator:(BOOL)a3;
- (void)dealloc;
- (void)displayScaleDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setArtworkPreloadingRecords:(id)a3;
- (void)setStoryModel:(id)a3;
- (void)setStyleManager:(id)a3;
- (void)setViewModel:(id)a3;
- (void)update;
@end

@implementation PXStoryStyleChromeContainerLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkPreloadingRecords, 0);
  objc_storeStrong((id *)&self->_storyModel, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
  objc_storeStrong((id *)&self->_visibilityAnimator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_framesArrayStore, 0);
}

- (NSSet)artworkPreloadingRecords
{
  return self->_artworkPreloadingRecords;
}

- (PXStoryModel)storyModel
{
  return self->_storyModel;
}

- (PXStoryStyleManager)styleManager
{
  return self->_styleManager;
}

- (PXNumberAnimator)visibilityAnimator
{
  return self->_visibilityAnimator;
}

- (void)setViewModel:(id)a3
{
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if ((void *)StoryViewModelObservationContext == a5)
  {
    id v11 = v9;
    if ((v6 & 0x40) != 0)
    {
      [(PXStoryStyleChromeContainerLayout *)self _invalidateStoryModel];
      id v9 = v11;
      if ((v6 & 0x20) == 0)
      {
LABEL_9:
        if ((v6 & 0x8000) == 0) {
          goto LABEL_21;
        }
LABEL_15:
        [(PXStoryStyleChromeContainerLayout *)self _invalidateVisibilityAnimator];
LABEL_20:
        id v9 = v11;
        goto LABEL_21;
      }
    }
    else if ((v6 & 0x20) == 0)
    {
      goto LABEL_9;
    }
    [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleLayoutsContent];
    [(PXStoryStyleChromeContainerLayout *)self _invalidateResourcePreloading];
    id v9 = v11;
    if ((v6 & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  if ((void *)StoryModelObservationContext_259431 == a5)
  {
    if ((v6 & 0x10000) == 0) {
      goto LABEL_21;
    }
    id v11 = v9;
    goto LABEL_15;
  }
  if ((void *)StyleManagerObservationContext_259432 == a5)
  {
    id v11 = v9;
    if ((v6 & 0x20) != 0)
    {
      [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleLayouts];
      [(PXStoryStyleChromeContainerLayout *)self _invalidateResourcePreloading];
      id v9 = v11;
    }
    if ((v6 & 0x100) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    if ((void *)VisibilityAnimatorObservationContext != a5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXStoryStyleChromeContainerLayout.m" lineNumber:307 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 2) != 0)
    {
      id v11 = v9;
LABEL_19:
      [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleLayoutsContent];
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)_updateResourcePreloading
{
  v3 = [(PXStoryStyleChromeContainerLayout *)self styleManager];
  id v13 = [v3 selectionDataSource];

  v4 = [(PXStoryStyleChromeContainerLayout *)self viewModel];
  v5 = [v4 viewLayoutSpec];

  [(PXGLayout *)self displayScale];
  double v7 = v6;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v13, "numberOfStyles"));
  if ([v13 numberOfStyles] >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [v13 styleInfoAtIndex:v9];
      id v11 = [[_PXStoryStyleChromePreloadingRecord alloc] initWithDisplayScale:v10 styleInfo:v5 viewLayoutSpec:v7];
      [v8 addObject:v11];

      ++v9;
    }
    while (v9 < [v13 numberOfStyles]);
  }
  v12 = (void *)[v8 copy];
  [(PXStoryStyleChromeContainerLayout *)self setArtworkPreloadingRecords:v12];
}

- (void)_invalidateResourcePreloading
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout _invalidateResourcePreloading]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleChromeContainerLayout.m", 261, @"invalidating %lu after it already has been updated", 128);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 128;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateStyleLayoutsContent
{
  [(PXGLayout *)self referenceSize];
  [(PXStoryStyleChromeContainerLayout *)self storyModel];
  v3 = [(id)objc_claimAutoreleasedReturnValue() layoutSpec];
  v4 = [(PXStoryStyleChromeContainerLayout *)self viewModel];
  [v4 viewLayoutSpec];
  objc_claimAutoreleasedReturnValue();

  [v3 styleSwitcherViewportSpacing];
  [v3 styleSwitcherChromeInset];
  PXEdgeInsetsInsetRect();
}

uint64_t __63__PXStoryStyleChromeContainerLayout__updateStyleLayoutsContent__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = a2 + 16;
    do
    {
      *(CGRect *)(v5 - 16) = CGRectOffset(*(CGRect *)(a1 + 64), *(double *)(a1 + 48) * ((double)(int)v4 - *(double *)(a1 + 56)), 0.0);
      v5 += 32;
      ++v4;
    }
    while (*(void *)(a1 + 40) > v4);
  }
  double v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[128];
  uint64_t v8 = v6[129];
  return objc_msgSend(v6, "setFrames:forSublayoutsInRange:", a2, v7, v8);
}

void __63__PXStoryStyleChromeContainerLayout__updateStyleLayoutsContent__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(double *)(a1 + 56);
  id v6 = a3;
  [v6 setAlpha:v5];
  uint64_t v7 = [*(id *)(a1 + 32) styleInfoAtIndex:a2];
  [v6 setStyleInfo:v7];

  [v6 setViewLayoutSpec:*(void *)(a1 + 40)];
  [v6 setReferenceDepth:*(double *)(a1 + 64)];
  objc_msgSend(v6, "setReferenceSize:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  id v8 = [*(id *)(a1 + 48) colorGradingRepository];
  [v6 setColorGradingRepository:v8];
}

- (void)_invalidateStyleLayoutsContent
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout _invalidateStyleLayoutsContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleChromeContainerLayout.m", 219, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateVisibilityAnimator:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PXStoryStyleChromeContainerLayout *)self storyModel];
  double v6 = 0.0;
  if ([v5 viewMode] == 4)
  {
    uint64_t v7 = [(PXStoryStyleChromeContainerLayout *)self viewModel];
    double v6 = (double)([v7 wantsRelatedOverlayVisible] ^ 1);
  }
  id v8 = [(PXStoryStyleChromeContainerLayout *)self visibilityAnimator];
  uint64_t v9 = v8;
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke;
    v11[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v11[4] = v6;
    [v8 performChangesUsingDefaultOpacityAnimation:v11];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke_2;
    v10[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v10[4] = v6;
    [v8 performChangesWithoutAnimation:v10];
  }
}

uint64_t __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __63__PXStoryStyleChromeContainerLayout__updateVisibilityAnimator___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_invalidateVisibilityAnimator
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout _invalidateVisibilityAnimator]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleChromeContainerLayout.m", 201, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateStyleLayouts
{
  p_styleSublayoutRange = &self->_styleSublayoutRange;
  if (self->_styleSublayoutRange.length) {
    [(PXGAbsoluteCompositeLayout *)self removeSublayoutsInRange:p_styleSublayoutRange->location];
  }
  uint64_t v4 = [(PXStoryStyleChromeContainerLayout *)self styleManager];
  double v5 = [v4 selectionDataSource];
  p_styleSublayoutRange->length = [v5 numberOfStyles];

  if (p_styleSublayoutRange->length)
  {
    NSUInteger v6 = 0;
    do
    {
      uint64_t v7 = [PXStoryStyleChromeLayout alloc];
      id v8 = [(PXStoryStyleChromeContainerLayout *)self viewModel];
      uint64_t v9 = [(PXStoryStyleChromeLayout *)v7 initWithViewModel:v8];
      [(PXGLayout *)self addSublayout:v9];

      ++v6;
    }
    while (p_styleSublayoutRange->length > v6);
  }
  [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleLayoutsContent];
}

- (void)_invalidateStyleLayouts
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      NSUInteger v6 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout _invalidateStyleLayouts]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleChromeContainerLayout.m", 186, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateStyleManager
{
  id v4 = [(PXStoryStyleChromeContainerLayout *)self storyModel];
  BOOL v3 = [v4 styleManager];
  [(PXStoryStyleChromeContainerLayout *)self setStyleManager:v3];
}

- (void)_invalidateStyleManager
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
      NSUInteger v6 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout _invalidateStyleManager]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleChromeContainerLayout.m", 178, @"invalidating %lu after it already has been updated", 2);

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

- (void)_updateStoryModel
{
  id v4 = [(PXStoryStyleChromeContainerLayout *)self viewModel];
  BOOL v3 = [v4 mainModel];
  [(PXStoryStyleChromeContainerLayout *)self setStoryModel:v3];
}

- (void)_invalidateStoryModel
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
      NSUInteger v6 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout _invalidateStoryModel]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleChromeContainerLayout.m", 170, @"invalidating %lu after it already has been updated", 1);

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
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      id v11 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXStoryStyleChromeContainerLayout.m", 146, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryStyleChromeContainerLayout *)self _updateStoryModel];
      if (!p_updateFlags->isPerformingUpdate)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout update]"];
        [v22 handleFailureInFunction:v23, @"PXStoryStyleChromeContainerLayout.m", 150, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryStyleChromeContainerLayout *)self _updateStyleManager];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXStoryStyleChromeContainerLayout.m", 153, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80uLL;
    if ((v6 & 0x80) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFF7FLL;
      [(PXStoryStyleChromeContainerLayout *)self _updateResourcePreloading];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout update]"];
      [v14 handleFailureInFunction:v15, @"PXStoryStyleChromeContainerLayout.m", 156, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryStyleChromeContainerLayout *)self _updateStyleLayouts];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout update]"];
      [v16 handleFailureInFunction:v17, @"PXStoryStyleChromeContainerLayout.m", 159, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryStyleChromeContainerLayout *)self _updateVisibilityAnimator:1];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout update]"];
      [v18 handleFailureInFunction:v19, @"PXStoryStyleChromeContainerLayout.m", 162, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v9 & 0x40) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFBFLL;
      [(PXStoryStyleChromeContainerLayout *)self _updateStyleLayoutsContent];
      unint64_t v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeContainerLayout update]"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PXStoryStyleChromeContainerLayout.m", 165, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PXStoryStyleChromeContainerLayout;
  [(PXGCompositeLayout *)&v24 update];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  [(PXGCompositeLayout *)&v3 displayScaleDidChange];
  [(PXStoryStyleChromeContainerLayout *)self _invalidateResourcePreloading];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  [(PXGCompositeLayout *)&v3 referenceDepthDidChange];
  [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleLayoutsContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleLayoutsContent];
}

- (void)dealloc
{
  [(NSSet *)self->_artworkPreloadingRecords enumerateObjectsUsingBlock:&__block_literal_global_13_259495];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeContainerLayout;
  [(PXGCompositeLayout *)&v3 dealloc];
}

void __44__PXStoryStyleChromeContainerLayout_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = [v2 styleInfo];
  objc_super v3 = [v2 viewLayoutSpec];
  [v2 displayScale];
  double v5 = v4;

  +[PXStoryStyleChromeLayout stopCachingResourcesForStyleInfo:v6 viewLayoutSpec:v3 displayScale:v5];
}

- (void)setArtworkPreloadingRecords:(id)a3
{
  double v4 = (NSSet *)a3;
  double v5 = self->_artworkPreloadingRecords;
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSSet *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      unint64_t v8 = self->_artworkPreloadingRecords;
      unint64_t v9 = (NSSet *)[(NSSet *)v4 copy];
      artworkPreloadingRecords = self->_artworkPreloadingRecords;
      self->_artworkPreloadingRecords = v9;

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke;
      v20[3] = &unk_1E5DCD3B8;
      id v11 = v4;
      v21 = v11;
      v12 = [(NSSet *)v8 objectsPassingTest:v20];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_2;
      v18 = &unk_1E5DCD3B8;
      v19 = v8;
      id v13 = v8;
      v14 = [(NSSet *)v11 objectsPassingTest:&v15];
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_259499, v15, v16, v17, v18);
      [v12 enumerateObjectsUsingBlock:&__block_literal_global_11_259500];
    }
  }
}

uint64_t __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = [v2 styleInfo];
  objc_super v3 = [v2 viewLayoutSpec];
  [v2 displayScale];
  double v5 = v4;

  +[PXStoryStyleChromeLayout stopCachingResourcesForStyleInfo:v6 viewLayoutSpec:v3 displayScale:v5];
}

void __65__PXStoryStyleChromeContainerLayout_setArtworkPreloadingRecords___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = [v2 styleInfo];
  objc_super v3 = [v2 viewLayoutSpec];
  [v2 displayScale];
  double v5 = v4;

  +[PXStoryStyleChromeLayout startCachingResourcesForStyleInfo:v6 viewLayoutSpec:v3 displayScale:v5];
}

- (void)setStyleManager:(id)a3
{
  unint64_t v8 = (PXStoryStyleManager *)a3;
  p_styleManager = &self->_styleManager;
  id v6 = self->_styleManager;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXStoryStyleManager *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryStyleManager *)*p_styleManager unregisterChangeObserver:self context:StyleManagerObservationContext_259432];
      objc_storeStrong((id *)&self->_styleManager, a3);
      [(PXStoryStyleManager *)*p_styleManager registerChangeObserver:self context:StyleManagerObservationContext_259432];
      [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleLayouts];
    }
  }
}

- (void)setStoryModel:(id)a3
{
  unint64_t v8 = (PXStoryModel *)a3;
  p_storyModel = &self->_storyModel;
  id v6 = self->_storyModel;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXStoryModel *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryModel *)*p_storyModel unregisterChangeObserver:self context:StoryModelObservationContext_259431];
      objc_storeStrong((id *)&self->_storyModel, a3);
      [(PXStoryModel *)*p_storyModel registerChangeObserver:self context:StoryModelObservationContext_259431];
      [(PXStoryStyleChromeContainerLayout *)self _invalidateStyleManager];
      [(PXStoryStyleChromeContainerLayout *)self _invalidateVisibilityAnimator];
    }
  }
}

- (PXStoryStyleChromeContainerLayout)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryStyleChromeContainerLayout.m", 76, @"%s is not available as initializer", "-[PXStoryStyleChromeContainerLayout init]");

  abort();
}

- (PXStoryStyleChromeContainerLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryStyleChromeContainerLayout;
  id v6 = [(PXGAbsoluteCompositeLayout *)&v15 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:32];
    framesArrayStore = v6->_framesArrayStore;
    v6->_framesArrayStore = (PXCArrayStore *)v7;

    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXStoryViewModel *)v6->_viewModel registerChangeObserver:v6 context:StoryViewModelObservationContext];
    uint64_t v9 = [objc_alloc((Class)off_1E5DA74E8) initWithValue:0.0];
    visibilityAnimator = v6->_visibilityAnimator;
    v6->_visibilityAnimator = (PXNumberAnimator *)v9;

    [(PXNumberAnimator *)v6->_visibilityAnimator registerChangeObserver:v6 context:VisibilityAnimatorObservationContext];
    v6->_styleSublayoutRange.location = 0;
    v6->_styleSublayoutRange.length = 0;
    id v11 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    artworkPreloadingRecords = v6->_artworkPreloadingRecords;
    v6->_artworkPreloadingRecords = v11;

    id v13 = [v5 mainModel];
    [(PXStoryStyleChromeContainerLayout *)v6 setStoryModel:v13];

    [(PXStoryStyleChromeContainerLayout *)v6 _updateVisibilityAnimator:0];
  }

  return v6;
}

@end