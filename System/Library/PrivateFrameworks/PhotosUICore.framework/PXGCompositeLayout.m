@interface PXGCompositeLayout
- (BOOL)allowsRepeatedSublayoutsUpdates;
- (BOOL)definesContextForPointReferences;
- (BOOL)wantsCustomAlphaForSublayouts;
- (PXGCompositeLayout)init;
- (PXGCompositeLayout)initWithComposition:(id)a3;
- (PXGSublayoutComposition)composition;
- (PXGSublayoutFaultingDelegate)sublayoutFaultingDelegate;
- (UIEdgeInsets)faultInOutsets;
- (UIEdgeInsets)faultOutOutsets;
- (double)alphaForSublayout:(id)a3 atIndex:(int64_t)a4;
- (void)_invalidateStylableType:(int64_t)a3;
- (void)_invalidateSublayouts;
- (void)_updateSublayoutOfStylableType:(int64_t)a3;
- (void)_updateSublayouts;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)dealloc;
- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)didApplySublayoutChangeDetails:(id)a3 axAdjustedSubgroupChangeDetails:(id)a4 countAfterChanges:(int64_t)a5;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)scrollSpeedRegimeDidChange;
- (void)setComposition:(id)a3;
- (void)setFaultInOutsets:(UIEdgeInsets)a3;
- (void)setFaultOutOutsets:(UIEdgeInsets)a3;
- (void)setSublayoutFaultingDelegate:(id)a3;
- (void)setSublayoutIndex:(int64_t)a3 forUniquelyStylableType:(int64_t)a4 animated:(BOOL)a5;
- (void)sublayoutDidChangeContentSize:(id)a3;
- (void)sublayoutNeedsUpdate:(id)a3;
- (void)update;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)willUpdate;
@end

@implementation PXGCompositeLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sublayoutFaultingDelegate);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (void)setFaultOutOutsets:(UIEdgeInsets)a3
{
  self->_faultOutOutsets = a3;
}

- (UIEdgeInsets)faultOutOutsets
{
  double top = self->_faultOutOutsets.top;
  double left = self->_faultOutOutsets.left;
  double bottom = self->_faultOutOutsets.bottom;
  double right = self->_faultOutOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFaultInOutsets:(UIEdgeInsets)a3
{
  self->_faultInOutsets = a3;
}

- (UIEdgeInsets)faultInOutsets
{
  double top = self->_faultInOutsets.top;
  double left = self->_faultInOutsets.left;
  double bottom = self->_faultInOutsets.bottom;
  double right = self->_faultInOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return self->_allowsRepeatedSublayoutsUpdates;
}

- (void)setSublayoutFaultingDelegate:(id)a3
{
}

- (PXGSublayoutFaultingDelegate)sublayoutFaultingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sublayoutFaultingDelegate);
  return (PXGSublayoutFaultingDelegate *)WeakRetained;
}

- (PXGSublayoutComposition)composition
{
  return self->_composition;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if ((a4 & 2) != 0)
  {
    id v20 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v20);
    id v11 = v20;
    v12 = v11;
    if (v11)
    {
      v13 = [v11 axContainingGroup];
      for (uint64_t i = [v13 containingLayout];
      {
        v15 = (void *)i;

        v16 = [v15 superlayout];

        if (!v15 || v16 == self) {
          break;
        }
        v13 = v15;
        [v15 superlayout];
      }
      if (v15)
      {
        v17 = [(PXGLayout *)self sublayoutDataStore];
        uint64_t v18 = [v17 indexOfSublayout:v15];
      }
      else
      {
        uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (self->_currentSingleLayouts[1] != v18) {
      [(PXGCompositeLayout *)self setSublayoutIndex:v18 forUniquelyStylableType:1 animated:1];
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v19 axGroup:v8 didChange:a4 userInfo:v10];
}

- (void)_updateSublayouts
{
  v4 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    if (self->_isUpdatingSublayouts)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"PXGCompositeLayout.m", 318, @"Invalid parameter not satisfying: %@", @"!_isUpdatingSublayouts" object file lineNumber description];
    }
    self->_isUpdatingSublayouts = 1;
    v7 = [(PXGCompositeLayout *)self composition];
    if (!v7)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"PXGCompositeLayout.m", 322, @"%@ has no defined composition", self object file lineNumber description];
    }
    uint64_t v37 = 0;
    v38 = (CGRect *)&v37;
    uint64_t v39 = 0x4010000000;
    v40 = &unk_1AB5D584F;
    long long v41 = 0u;
    long long v42 = 0u;
    [(PXGLayout *)self visibleRect];
    *(void *)&long long v41 = v8;
    *((void *)&v41 + 1) = v9;
    *(void *)&long long v42 = v10;
    *((void *)&v42 + 1) = v11;
    [v7 setSublayoutDataStore:v4];
    [(PXGLayout *)self referenceSize];
    objc_msgSend(v7, "setReferenceSize:");
    [(PXGLayout *)self visibleRect];
    objc_msgSend(v7, "setVisibleRect:");
    [v7 updateEstimate];
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    unint64_t v13 = [(PXGLayout *)self anchoredContentEdges];
    uint64_t v14 = v34[3];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v13)
    {
      uint64_t v15 = [v7 anchorSublayoutIndexForAnchoredContentEdges:v13];
      v34[3] = v15;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_11;
      }
      BOOL v16 = [(PXGLayout *)self shouldFaultInContentAtAnchoredContentEdges];
      *((unsigned char *)v30 + 24) = v16;
      uint64_t v14 = v34[3];
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_26;
    }
LABEL_11:
    int64_t v17 = [(PXGLayout *)self anchoredSublayoutIndex];
    v34[3] = v17;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __39__PXGCompositeLayout__updateSublayouts__block_invoke;
      v28[3] = &unk_1E5DB4E60;
      v28[4] = &v33;
      v28[5] = &v29;
      [v4 enumerateSublayoutsUsingBlock:v28];
      if (v34[3] != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_26;
      }
      if (v6 < 1) {
        goto LABEL_21;
      }
      uint64_t v18 = 0;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v20 = [v4 geometries];
        CGFloat v21 = *(double *)(v20 + v18 + 48);
        CGFloat v22 = *(double *)(v20 + v18 + 56);
        v44.size.width = *(CGFloat *)(v20 + v18 + 32);
        v44.size.height = *(CGFloat *)(v20 + v18 + 40);
        v44.origin.x = v21;
        v44.origin.y = v22;
        if (CGRectIntersectsRect(v44, v38[1]))
        {
          v43.x = v21;
          v43.y = v22;
          BOOL v23 = CGRectContainsPoint(v38[1], v43);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v12 = i;
          }
          if (v23)
          {
            uint64_t v12 = i;
            goto LABEL_24;
          }
        }
        v18 += 136;
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_21:
      }
        uint64_t v12 = 0;
LABEL_24:
      char v24 = 0;
      v34[3] = v12;
    }
    else
    {
      char v24 = 1;
    }
    *((unsigned char *)v30 + 24) = v24;
LABEL_26:
    [(PXGLayout *)self viewEnvironment];
    [(id)objc_claimAutoreleasedReturnValue() accessibilityEnabled];
    id v25 = v4;
    [v25 geometries];
    [v25 infos];
    [(PXGCompositeLayout *)self faultInOutsets];
    sub_1AB23B20C();
  }
}

uint64_t __39__PXGCompositeLayout__updateSublayouts__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 numberOfDescendantAnchors];
  if (result >= 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

id __39__PXGCompositeLayout__updateSublayouts__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v8 = *(void *)(a1 + 88);
  uint64_t v44 = *(void *)(a1 + 80);
  uint64_t v9 = (double *)(v44 + 136 * a2);
  uint64_t v10 = (id *)(v8 + 16 * a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    char v11 = 1;
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + 96);
    BOOL v14 = a2 >= v12;
    unint64_t v13 = a2 - v12;
    BOOL v14 = !v14 || v13 >= *(void *)(a1 + 104);
    char v11 = !v14;
  }
  uint64_t v15 = v9 + 6;
  BOOL v16 = v9 + 4;
  double v17 = v9[4];
  double v18 = v9[5];
  uint64_t v19 = v8 + 16 * a2;
  uint64_t v21 = *(void *)(v19 + 8);
  uint64_t v20 = (id *)(v19 + 8);
  if (v21)
  {
    if (*v10)
    {
      if ((v11 & 1) == 0) {
        PXEdgeInsetsInsetRect();
      }
      id result = *v10;
LABEL_24:
      id v46 = result;
      CGFloat v26 = *v15;
      double v27 = v9[7];
      CGRect v47 = CGRectOffset(*(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), -*v15, -v27);
      double x = v47.origin.x;
      double y = v47.origin.y;
      double width = v47.size.width;
      double height = v47.size.height;
      [v46 contentSize];
      if (v32 != *MEMORY[0x1E4F1DB30] || v33 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        if ((v5 & 8) != 0) {
          double x = x + v32 - *v16;
        }
        if ((v5 & 4) != 0) {
          double y = y + v33 - v9[5];
        }
      }
      [v46 setViewEnvironment:*(void *)(a1 + 48)];
      objc_msgSend(v46, "setReferenceSize:", *v9, v9[1]);
      uint64_t v35 = v44 + 136 * a2;
      [v46 setReferenceDepth:*(double *)(a1 + 176) * *(double *)(v35 + 16)];
      [v46 setReferenceOptions:*(unsigned __int16 *)(v35 + 24)];
      objc_msgSend(v46, "setVisibleRect:", x, y, width, height);
      [v46 setDisplayScale:*(double *)(a1 + 184)];
      objc_msgSend(v46, "setLastScrollDirection:", *(double *)(a1 + 192), *(double *)(a1 + 200));
      [v46 setScrollSpeedRegime:*(void *)(a1 + 208)];
      [v46 setUserInterfaceDirection:*(void *)(a1 + 216)];
      objc_msgSend(v46, "setSafeAreaInsets:", *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240), *(double *)(a1 + 248));
      if (*(unsigned char *)(a1 + 264))
      {
        [*(id *)(a1 + 40) alphaForSublayout:v46 atIndex:a2];
        objc_msgSend(v46, "setAlpha:");
      }
      uint64_t v36 = [v46 createAnchorFromSuperlayoutWithSublayoutIndex:a2 sublayoutPositionEdges:v4 ignoringScrollingAnimationAnchors:1];
      if (v36)
      {
        id v37 = (id)[v36 autoInvalidate];
      }
      else if ((*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != a2 || *(void *)(a1 + 256)) {
             && ![v46 numberOfDescendantAnchors]
      }
             && [v46 needsUpdate])
      {
        if (*(void *)(a1 + 256)) {
          uint64_t v38 = *(void *)(a1 + 256);
        }
        else {
          uint64_t v38 = v5;
        }
        uint64_t v39 = [v46 createAnchorForContentEdges:v38];
        id v40 = (id)[v39 autoInvalidate];
      }
      [v46 updateIfNeeded];
      [*(id *)(a1 + 40) didUpdateSublayout:v46];
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2)
      {
        [v46 visibleRect];
        *(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = CGRectOffset(v48, v26, v27);
      }
      [v46 contentSize];
      *(void *)BOOL v16 = v41;
      *((void *)v9 + 5) = v42;
      PXGAssertErrValidSize();
    }
    if ((v11 & 1) == 0) {
      PXEdgeInsetsInsetRect();
    }
    uint64_t v23 = *(void *)(a1 + 40);
    id v24 = *v20;
    id v25 = [v24 layout:v23 createSublayoutAtIndex:a2];

    if (v25)
    {
      id v25 = v25;
      if (*v10 != v25)
      {

        id *v10 = v25;
      }

      objc_msgSend(*(id *)(a1 + 40), "didFaultInSublayout:atIndex:fromEstimatedContentSize:", v25, a2, v17, v18);
    }
    else
    {
      *uint64_t v20 = 0;
      *(_OWORD *)BOOL v16 = *MEMORY[0x1E4F1DB30];
    }
    uint64_t v5 = a3;

    uint64_t v4 = a4;
  }
  id result = *v10;
  if (result) {
    goto LABEL_24;
  }
  return result;
}

void __39__PXGCompositeLayout__updateSublayouts__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PXGCompositeLayout__updateSublayouts__block_invoke_4;
  v3[3] = &unk_1E5DB4EB0;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 updateSublayoutGeometriesFromAnchorSublayoutIndex:v1 usingSublayoutUpdateBlock:v3];
}

uint64_t __39__PXGCompositeLayout__updateSublayouts__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__PXGCompositeLayout__updateSublayouts__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invalidateSublayouts
{
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"-[PXGCompositeLayout _invalidateSublayouts]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGCompositeLayout.m", 307, @"invalidating %lu after it already has been updated", 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 8;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_updateSublayoutOfStylableType:(int64_t)a3
{
  uint64_t v5 = [off_1E5DA9658 sharedInstance];
  id v6 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v7 = [v6 geometries];
  uint64_t v8 = [(PXGCompositeLayout *)self composition];
  [v8 sublayoutInsetsForStylableType:a3];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke;
  aBlock[3] = &__block_descriptor_72_e11_v20__0q8B16l;
  aBlock[4] = v7;
  aBlock[5] = v10;
  aBlock[6] = v12;
  aBlock[7] = v14;
  aBlock[8] = v16;
  double v17 = _Block_copy(aBlock);
  double v18 = (void (**)(void, void, void))v17;
  int64_t v19 = self->_currentSingleLayouts[a3];
  if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
    (*((void (**)(void *, int64_t, void))v17 + 2))(v17, self->_currentSingleLayouts[a3], 0);
  }
  int64_t v20 = self->_pendingSingleLayouts[a3];
  if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
    v18[2](v18, self->_pendingSingleLayouts[a3], 1);
  }
  if (self->_pendingAnimations[a3])
  {
    int v21 = [v5 enableTungstenKeyboardNavigation];
    BOOL v22 = v20 == 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL;
    if (!v22 && v21 != 0)
    {
      id v29 = v6;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke_2;
      v30[3] = &unk_1E5DB4E38;
      id v31 = v5;
      id v24 = (void (**)(void))_Block_copy(v30);
      v28 = [(PXGLayout *)self createAnimation];
      v24[2](v24);
      id v25 = [(PXGLayout *)self superlayout];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v25 createAnimation];
        CGFloat v26 = v27 = v5;
        ((void (*)(void (**)(void), void *))v24[2])(v24, v26);

        uint64_t v5 = v27;
      }

      id v6 = v29;
    }
  }
  self->_currentSingleLayouts[a3] = v20;
  self->_pendingAnimations[a3] = 0;
}

CGFloat __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)off_1E5DAAF78;
  long long v6 = *((_OWORD *)off_1E5DAAF78 + 1);
  *(_OWORD *)&v22.a = *(_OWORD *)off_1E5DAAF78;
  *(_OWORD *)&v22.c = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF78 + 2);
  *(_OWORD *)&v22.tdouble x = v7;
  double v8 = *((double *)off_1E5DAAF78 + 6);
  if (a3)
  {
    uint64_t v9 = v4 + 136 * a2;
    double v10 = *(double *)(v9 + 32);
    if (v10 > 0.0)
    {
      double v11 = *(double *)(v9 + 40);
      if (v11 > 0.0)
      {
        CGFloat v12 = (v10 - *(double *)(a1 + 48) - *(double *)(a1 + 64)) / v10;
        double v13 = v11 - *(double *)(a1 + 40) - *(double *)(a1 + 56);
        uint64_t v14 = v4 + 136 * a2;
        CGFloat v15 = v10 * 0.5 + *(double *)(v14 + 48);
        CGFloat v16 = v11 * 0.5 + *(double *)(v14 + 56);
        *(_OWORD *)&v21.a = v5;
        *(_OWORD *)&v21.c = v6;
        *(_OWORD *)&v21.tdouble x = v7;
        *(_OWORD *)&v23.a = v5;
        *(_OWORD *)&v23.c = v6;
        *(_OWORD *)&v23.tdouble x = v7;
        CGFloat v17 = v13 / v11;
        CGAffineTransformTranslate(&v21, &v23, v15, v16);
        double v8 = v8 + 0.0;
        CGAffineTransform v22 = v21;
        CGAffineTransform v23 = v21;
        CGAffineTransformScale(&v21, &v23, v12, v17);
        CGAffineTransform v22 = v21;
        CGAffineTransform v23 = v21;
        CGAffineTransformTranslate(&v21, &v23, -v15, -v16);
        CGAffineTransform v22 = v21;
      }
    }
  }
  uint64_t v18 = v4 + 136 * a2;
  long long v19 = *(_OWORD *)&v22.c;
  *(_OWORD *)(v18 + 72) = *(_OWORD *)&v22.a;
  *(_OWORD *)(v18 + 88) = v19;
  CGFloat result = v22.tx;
  *(_OWORD *)(v18 + 104) = *(_OWORD *)&v22.tx;
  *(double *)(v18 + 120) = v8;
  return result;
}

void __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 keyboardAnimationDuration];
  objc_msgSend(v5, "setDuration:");
  [*(id *)(a1 + 32) keyboardDampingRatio];
  *(float *)&double v4 = v4;
  [v5 setDampingRatio:v4];
  [v5 setScope:1];
}

- (void)_invalidateStylableType:(int64_t)a3
{
  if (a3 == 2)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_18;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v9 = 4;
      goto LABEL_27;
    }
    if ((self->_updateFlags.updated & 4) != 0)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = [NSString stringWithUTF8String:"-[PXGCompositeLayout _invalidateStylableType:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXGCompositeLayout.m", 236, @"invalidating %lu after it already has been updated", 4);
      goto LABEL_34;
    }
LABEL_18:
    uint64_t v7 = needsUpdate | 4;
    goto LABEL_22;
  }
  if (a3 == 1)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t v6 = self->_updateFlags.needsUpdate;
    if (v6)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_21;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v9 = 1;
      goto LABEL_27;
    }
    if (self->_updateFlags.updated)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = [NSString stringWithUTF8String:"-[PXGCompositeLayout _invalidateStylableType:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXGCompositeLayout.m", 233, @"invalidating %lu after it already has been updated", 1);
      goto LABEL_34;
    }
LABEL_21:
    uint64_t v7 = v6 | 1;
    goto LABEL_22;
  }
  if (a3) {
    return;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t v4 = self->_updateFlags.needsUpdate;
  if (v4)
  {
    if (!self->_updateFlags.isPerformingUpdate) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_14:
    if ((self->_updateFlags.updated & 2) == 0)
    {
LABEL_15:
      uint64_t v7 = v4 | 2;
LABEL_22:
      p_updateFlags->unint64_t needsUpdate = v7;
      return;
    }
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = [NSString stringWithUTF8String:"-[PXGCompositeLayout _invalidateStylableType:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXGCompositeLayout.m", 230, @"invalidating %lu after it already has been updated", 2);
LABEL_34:

    abort();
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  uint64_t v9 = 2;
LABEL_27:
  p_updateFlags->unint64_t needsUpdate = v9;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v4 = [NSString stringWithUTF8String:"-[PXGCompositeLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGCompositeLayout.m", 224, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  uint64_t v3 = [(PXGLayout *)self numberOfDescendantAnchors];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (v3 >= 1)
  {
    BOOL isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 8) != 0)
    {
      int64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      CGAffineTransform v21 = [NSString stringWithUTF8String:"-[PXGCompositeLayout update]"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PXGCompositeLayout.m", 201, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    needsUpdate |= 8uLL;
    p_updateFlags->unint64_t needsUpdate = needsUpdate;
    self->_updateFlags.BOOL willPerformUpdate = 0;
    if (!isPerformingUpdate) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (!needsUpdate) {
    goto LABEL_20;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_23:
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = [NSString stringWithUTF8String:"-[PXGCompositeLayout update]"];
    [v10 handleFailureInFunction:v11, @"PXGCompositeLayout.m", 204, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.BOOL isPerformingUpdate = 1;
  self->_updateFlags.updated = 8;
  if ((needsUpdate & 8) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    [(PXGCompositeLayout *)self _updateSublayouts];
    if (!self->_updateFlags.isPerformingUpdate)
    {
      CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
      double v13 = [NSString stringWithUTF8String:"-[PXGCompositeLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXGCompositeLayout.m", 208, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
  }
  unint64_t v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 1uLL;
  if (v7)
  {
    p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFELL;
    [(PXGCompositeLayout *)self _updateSublayoutOfStylableType:1];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v15 = [NSString stringWithUTF8String:"-[PXGCompositeLayout update]"];
    [v14 handleFailureInFunction:v15, @"PXGCompositeLayout.m", 211, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v8 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v8 & 2) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
    [(PXGCompositeLayout *)self _updateSublayoutOfStylableType:0];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    CGFloat v16 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v17 = [NSString stringWithUTF8String:"-[PXGCompositeLayout update]"];
    [v16 handleFailureInFunction:v17, @"PXGCompositeLayout.m", 214, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v9 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((v9 & 4) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
    [(PXGCompositeLayout *)self _updateSublayoutOfStylableType:2];
    unint64_t v9 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.BOOL isPerformingUpdate = 0;
  if (v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v19 = [NSString stringWithUTF8String:"-[PXGCompositeLayout update]"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"PXGCompositeLayout.m", 217, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
  }
LABEL_20:
  v22.receiver = self;
  v22.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v22 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v4 = [NSString stringWithUTF8String:"-[PXGCompositeLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGCompositeLayout.m", 195, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (void)didApplySublayoutChangeDetails:(id)a3 axAdjustedSubgroupChangeDetails:(id)a4 countAfterChanges:(int64_t)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v17 didApplySublayoutChangeDetails:v8 axAdjustedSubgroupChangeDetails:a4 countAfterChanges:a5];
  if ([v8 hasMoves]) {
    [(PXGCompositeLayout *)self _invalidateSublayouts];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  double v13 = __103__PXGCompositeLayout_didApplySublayoutChangeDetails_axAdjustedSubgroupChangeDetails_countAfterChanges___block_invoke;
  uint64_t v14 = &unk_1E5DD1558;
  CGFloat v15 = self;
  id v9 = v8;
  uint64_t v10 = 0;
  id v16 = v9;
  char v18 = 0;
  do
  {
    ((void (*)(void *, uint64_t, char *))v13)(v12, v10, &v18);
    if (v18) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v10 == 2;
    }
    ++v10;
  }
  while (!v11);
}

uint64_t __103__PXGCompositeLayout_didApplySublayoutChangeDetails_axAdjustedSubgroupChangeDetails_countAfterChanges___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 32);
  uint64_t v5 = *(void *)(*(void *)(v4 + 880) + 8 * a2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat result = [*(id *)(result + 40) indexAfterApplyingChangesToIndex:*(void *)(*(void *)(v4 + 880) + 8 * a2)];
    uint64_t v4 = *(void *)(v3 + 32);
    if (v5 != result)
    {
      *(void *)(*(void *)(v4 + 880) + 8 * a2) = result;
      CGFloat result = [*(id *)(v3 + 32) _invalidateStylableType:a2];
      uint64_t v4 = *(void *)(v3 + 32);
    }
  }
  if (*(void *)(*(void *)(v4 + 888) + 8 * a2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat result = objc_msgSend(*(id *)(v3 + 40), "indexAfterApplyingChangesToIndex:");
    *(void *)(*(void *)(*(void *)(v3 + 32) + 888) + 8 * a2) = result;
  }
  return result;
}

- (void)scrollSpeedRegimeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v3 scrollSpeedRegimeDidChange];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v3 referenceDepthDidChange];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)viewEnvironmentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v3 viewEnvironmentDidChange];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v4 sublayoutDidChangeContentSize:a3];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v5 sublayoutNeedsUpdate:v4];
  if (self->_isUpdatingSublayouts) {
    [(PXGLayout *)self assumeWillUpdateSublayoutInUpdatePass:v4];
  }
  else {
    [(PXGCompositeLayout *)self _invalidateSublayouts];
  }
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v6 willRemoveSublayout:a3 atIndex:a4 flags:a5];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v6 didAddSublayout:a3 atIndex:a4 flags:a5];
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout insertSublayoutProvider:inRange:](&v5, sel_insertSublayoutProvider_inRange_, a3, a4.location, a4.length);
  [(PXGCompositeLayout *)self _invalidateSublayouts];
}

- (void)setSublayoutIndex:(int64_t)a3 forUniquelyStylableType:(int64_t)a4 animated:(BOOL)a5
{
  self->_pendingSingleLayouts[a4] = a3;
  self->_pendingAnimations[a4] = a5;
  [(PXGCompositeLayout *)self _invalidateStylableType:a4];
}

- (double)alphaForSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXGCompositeLayout.m", 88, @"Method %s is a responsibility of subclass %@", "-[PXGCompositeLayout alphaForSublayout:atIndex:]", v9 object file lineNumber description];

  abort();
}

- (BOOL)wantsCustomAlphaForSublayouts
{
  return 0;
}

- (void)setComposition:(id)a3
{
  id v6 = (PXGSublayoutComposition *)a3;
  p_composition = &self->_composition;
  composition = self->_composition;
  if (composition != v6)
  {
    double v13 = v6;
    [(PXGSublayoutComposition *)composition setCompositeLayout:0];
    objc_storeStrong((id *)&self->_composition, a3);
    id v9 = [(PXGSublayoutComposition *)*p_composition compositeLayout];

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = *p_composition;
      CGFloat v12 = [(PXGSublayoutComposition *)*p_composition compositeLayout];
      [v10 handleFailureInMethod:a2, self, @"PXGCompositeLayout.m", 71, @"a layout composition currently cannot be use for multiple PXGCompositeLayouts (%@ is already assigned to %@, and thus can't be used with %@)", v11, v12, self object file lineNumber description];
    }
    [(PXGSublayoutComposition *)*p_composition setCompositeLayout:self];
    [(PXGCompositeLayout *)self _invalidateSublayouts];
    [(PXGCompositeLayout *)self _invalidateStylableType:1];
    [(PXGCompositeLayout *)self _invalidateStylableType:0];
    [(PXGCompositeLayout *)self _invalidateStylableType:2];
    id v6 = v13;
  }
}

- (PXGCompositeLayout)initWithComposition:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PXGCompositeLayout *)self init];
  [(PXGCompositeLayout *)v5 setComposition:v4];

  return v5;
}

- (void)dealloc
{
  free(self->_currentSingleLayouts);
  free(self->_pendingSingleLayouts);
  free(self->_pendingAnimations);
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  [(PXGLayout *)&v3 dealloc];
}

- (PXGCompositeLayout)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXGCompositeLayout;
  v2 = [(PXGLayout *)&v7 init];
  if (v2)
  {
    objc_super v3 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v2->_currentSingleLayouts = v3;
    memset_pattern16(v3, &unk_1AB35A240, 0x18uLL);
    id v4 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v2->_pendingSingleLayouts = v4;
    memset_pattern16(v4, &unk_1AB35A240, 0x18uLL);
    objc_super v5 = (BOOL *)malloc_type_calloc(3uLL, 1uLL, 0x100004077774924uLL);
    v2->_pendingAnimations = v5;
    v5[2] = 0;
    *(_WORD *)objc_super v5 = 0;
  }
  return v2;
}

@end