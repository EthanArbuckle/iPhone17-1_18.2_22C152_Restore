@interface PXGSplitLayout
- (BOOL)adjustSublayoutZPositions;
- (BOOL)allowsRepeatedSublayoutsUpdates;
- (BOOL)definesContextForPointReferences;
- (BOOL)floatingModesRespectSafeArea;
- (BOOL)shouldExcludeTopAndBottomPaddingFromReferenceSize;
- (PXGLayout)firstSublayout;
- (PXGLayout)secondSublayout;
- (UIEdgeInsets)padding;
- (UIEdgeInsets)presentedPadding;
- (double)floatingThresholdOffset;
- (double)interlayoutSpacing;
- (int64_t)firstSublayoutIndex;
- (int64_t)mode;
- (int64_t)objectReferenceLookup;
- (int64_t)scrollableAxis;
- (int64_t)secondSublayoutIndex;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_performUpdateSublayoutGeometries;
- (void)_replaceSublayout:(id)a3 withSublayout:(id)a4 atIndex:(int64_t)a5;
- (void)_updateSublayoutGeometries;
- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)didChangeSublayoutOrigins;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)enumerateSublayoutsForCreatingPointReferenceUsingBlock:(id)a3;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)removeSublayoutsInRange:(_NSRange)a3;
- (void)safeAreaInsetsDidChange;
- (void)scrollSpeedRegimeDidChange;
- (void)setAdjustSublayoutZPositions:(BOOL)a3;
- (void)setFirstSublayout:(id)a3;
- (void)setFloatingModesRespectSafeArea:(BOOL)a3;
- (void)setFloatingThresholdOffset:(double)a3;
- (void)setInterlayoutSpacing:(double)a3;
- (void)setMode:(int64_t)a3;
- (void)setObjectReferenceLookup:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSecondSublayout:(id)a3;
- (void)setShouldExcludeTopAndBottomPaddingFromReferenceSize:(BOOL)a3;
- (void)sublayoutDidChangeContentSize:(id)a3;
- (void)sublayoutDidChangeLastBaseline:(id)a3;
- (void)sublayoutNeedsUpdate:(id)a3;
- (void)update;
- (void)userInterfaceDirectionDidChange;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)willUpdate;
@end

@implementation PXGSplitLayout

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v10 sublayoutNeedsUpdate:v4];
  if (self->_isUpdatingSublayouts)
  {
    [(PXGLayout *)self assumeWillUpdateSublayoutInUpdatePass:v4];
    goto LABEL_9;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_9;
    }
LABEL_7:
    if (self->_updateFlags.updated)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"-[PXGSplitLayout sublayoutNeedsUpdate:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGSplitLayout.m", 520, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_7;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_9:
}

void __51__PXGSplitLayout__performUpdateSublayoutGeometries__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  if (*a4)
  {
    id v12 = *a4;
    [v12 contentSize];
    v6 = v12;
    *(void *)(a3 + 32) = v7;
    *(void *)(a3 + 40) = v8;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v12 == *(id *)(v9 + 904))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      *(_OWORD *)(a3 + 48) = *(_OWORD *)(a1 + 40);
      *(void *)(a3 + 64) = v11;
      [v12 setFloating:*(unsigned __int8 *)(a1 + 96)];
      [v12 setFloatingOffset:*(double *)(a1 + 64)];
      v6 = v12;
    }
    else if (v12 == *(id *)(v9 + 912))
    {
      uint64_t v10 = *(void *)(a1 + 88);
      *(_OWORD *)(a3 + 48) = *(_OWORD *)(a1 + 72);
      *(void *)(a3 + 64) = v10;
    }
  }
}

- (void)_performUpdateSublayoutGeometries
{
  unint64_t v3 = [(PXGSplitLayout *)self mode];
  [(PXGSplitLayout *)self padding];
  double v5 = v4;
  double v57 = v6;
  double v8 = v7;
  double v52 = v9;
  [(PXGLayout *)self referenceSize];
  double v11 = v10;
  double v13 = v12;
  [(PXGLayout *)self referenceDepth];
  uint64_t v48 = v14;
  if ([(PXGSplitLayout *)self shouldExcludeTopAndBottomPaddingFromReferenceSize])
  {
    double v15 = 0.0;
  }
  else
  {
    double v15 = v5 + v8;
  }
  unsigned __int16 v16 = [(PXGLayout *)self referenceOptions];
  uint64_t v17 = [(PXGLayout *)self viewEnvironment];
  [(PXGLayout *)self safeAreaInsets];
  uint64_t v51 = v18;
  uint64_t v49 = v19;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  [(PXGLayout *)self displayScale];
  uint64_t v25 = v24;
  [(PXGLayout *)self visibleRect];
  uint64_t v55 = v26;
  uint64_t v56 = v27;
  uint64_t v53 = v28;
  uint64_t v54 = v29;
  [(PXGLayout *)self lastScrollDirection];
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  int64_t v34 = [(PXGLayout *)self scrollSpeedRegime];
  v50 = (void *)v17;
  unint64_t v47 = [(PXGLayout *)self userInterfaceDirection];
  if (v3 > 7)
  {
    int64_t v35 = v34;
    unsigned __int16 v36 = v16;
    v40 = 0;
    v37 = 0;
LABEL_9:
    long long v89 = *MEMORY[0x1E4F1DAD8];
    long long v90 = v89;
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x3010000000;
    v87[3] = &unk_1AB5D584F;
    long long v88 = v89;
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x4010000000;
    v84[3] = &unk_1AB5D584F;
    long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v85 = *MEMORY[0x1E4F1DB28];
    long long v86 = v42;
    v43 = [(PXGLayout *)self sublayoutDataStore];
    uint64_t v44 = [v43 count];

    v45 = [(PXGLayout *)self sublayoutDataStore];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __51__PXGSplitLayout__performUpdateSublayoutGeometries__block_invoke;
    v58[3] = &unk_1E5DAF610;
    double v65 = v11 - (v57 + v52);
    double v66 = v13 - v15;
    unsigned __int16 v83 = v36;
    uint64_t v67 = v48;
    uint64_t v68 = v25;
    uint64_t v69 = v31;
    uint64_t v70 = v33;
    int64_t v71 = v35;
    uint64_t v72 = v51;
    uint64_t v73 = v49;
    uint64_t v74 = v21;
    uint64_t v75 = v23;
    unint64_t v76 = v47;
    uint64_t v77 = v55;
    uint64_t v78 = v56;
    uint64_t v79 = v53;
    uint64_t v80 = v54;
    id v59 = v50;
    v63 = v87;
    v46 = v37;
    v60 = v46;
    v64 = v84;
    unint64_t v81 = v3;
    uint64_t v82 = v44;
    v61 = v40;
    v62 = self;
    objc_msgSend(v45, "enumerateSublayoutsUsingBlock:", v58, v59);

    if (v46)
    {
      [(PXGLayout *)v46 visibleRect];
      PXPointSubtract();
    }
    if ([(PXGSplitLayout *)self scrollableAxis]) {
      [(PXGSplitLayout *)self scrollableAxis];
    }
    PXAxisTransposed();
  }
  if (((1 << v3) & 0xDE) != 0)
  {
    int64_t v35 = v34;
    unsigned __int16 v36 = v16;
    v37 = self->_secondSublayout;
    uint64_t v38 = 904;
  }
  else
  {
    if (!v3)
    {
      if ([(PXGLayout *)self numberOfSublayouts] == 1)
      {
        unsigned __int16 v36 = v16;
        firstSublayout = self->_firstSublayout;
        int64_t v35 = v34;
        v40 = 0;
        if (!firstSublayout) {
          firstSublayout = self->_secondSublayout;
        }
        v37 = firstSublayout;
      }
      else
      {
        int64_t v35 = v34;
        unsigned __int16 v36 = v16;
        firstSublayout = 0;
        v40 = 0;
        v37 = 0;
      }
      goto LABEL_8;
    }
    int64_t v35 = v34;
    unsigned __int16 v36 = v16;
    v37 = self->_firstSublayout;
    uint64_t v38 = 912;
  }
  firstSublayout = *(PXGLayout **)((char *)&self->super.super.isa + v38);
  v40 = firstSublayout;
LABEL_8:
  v41 = firstSublayout;
  goto LABEL_9;
}

- (int64_t)scrollableAxis
{
  unint64_t v3 = [(PXGSplitLayout *)self mode];
  if (v3 > 7) {
    goto LABEL_6;
  }
  if (((1 << v3) & 0xDE) != 0)
  {
    double v4 = [(PXGSplitLayout *)self secondSublayout];
    goto LABEL_4;
  }
  if (v3)
  {
    double v4 = [(PXGSplitLayout *)self firstSublayout];
    goto LABEL_4;
  }
  double v4 = [(PXGSplitLayout *)self firstSublayout];
  if (v4)
  {
LABEL_4:
    double v5 = v4;
    int64_t v6 = [v4 scrollableAxis];
    goto LABEL_5;
  }
  double v8 = [(PXGSplitLayout *)self secondSublayout];
  int64_t v6 = [v8 scrollableAxis];

  double v5 = 0;
LABEL_5:

  if (!v6)
  {
LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)PXGSplitLayout;
    return [(PXGLayout *)&v9 scrollableAxis];
  }
  return v6;
}

- (int64_t)mode
{
  return self->_mode;
}

- (PXGLayout)secondSublayout
{
  return self->_secondSublayout;
}

- (PXGLayout)firstSublayout
{
  return self->_firstSublayout;
}

- (BOOL)shouldExcludeTopAndBottomPaddingFromReferenceSize
{
  return self->_shouldExcludeTopAndBottomPaddingFromReferenceSize;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)floatingThresholdOffset
{
  return self->_floatingThresholdOffset;
}

- (BOOL)floatingModesRespectSafeArea
{
  return self->_floatingModesRespectSafeArea;
}

- (BOOL)adjustSublayoutZPositions
{
  return self->_adjustSublayoutZPositions;
}

- (void)visibleRectDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 visibleRectDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout visibleRectDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 485, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v10 sublayoutDidChangeContentSize:v4];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v9 = [NSString stringWithUTF8String:"-[PXGSplitLayout sublayoutDidChangeContentSize:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGSplitLayout.m", 529, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

void __51__PXGSplitLayout__performUpdateSublayoutGeometries__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  [v12 setViewEnvironment:*(void *)(a1 + 32)];
  objc_msgSend(v12, "setReferenceSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  [v12 setReferenceDepth:*(double *)(a1 + 96)];
  [v12 setReferenceOptions:*(unsigned __int16 *)(a1 + 224)];
  [v12 setDisplayScale:*(double *)(a1 + 104)];
  objc_msgSend(v12, "setLastScrollDirection:", *(double *)(a1 + 112), *(double *)(a1 + 120));
  [v12 setScrollSpeedRegime:*(void *)(a1 + 128)];
  objc_msgSend(v12, "setSafeAreaInsets:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  [v12 setUserInterfaceDirection:*(void *)(a1 + 168)];
  CGRect v14 = CGRectOffset(*(CGRect *)(a1 + 176), -*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), -*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  if (*(id *)(a1 + 40) == v12) {
    *(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = v14;
  }
  if (*(id *)(a1 + 48) == v12 && *(void *)(a1 + 208) == 6) {
    PXRectWithOriginAndSize();
  }
  objc_msgSend(v12, "setVisibleRect:");
  if (a2 || (unint64_t v5 = *(void *)(a1 + 208), v5 > 5)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_1AB35A3D0[v5];
  }
  if (*(void *)(a1 + 216) - 1 == a2)
  {
    unint64_t v7 = *(void *)(a1 + 208);
    uint64_t v8 = 5;
    if (v7 == 5) {
      uint64_t v8 = v6;
    }
    if (v7 >= 2) {
      uint64_t v6 = v8;
    }
    else {
      v6 |= 4uLL;
    }
  }
  objc_super v9 = [v12 createAnchorFromSuperlayoutWithSublayoutIndex:a2 sublayoutPositionEdges:v6 ignoringScrollingAnimationAnchors:0];
  id v10 = (id)[v9 autoInvalidate];

  [v12 updateIfNeeded];
  [*(id *)(a1 + 56) didUpdateSublayout:v12];
  if (*(void *)(a1 + 208) <= 1uLL)
  {
    [v12 contentSize];
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v11
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 40);
  }
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    unint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXGSplitLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGSplitLayout.m", 184, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
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
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[PXGSplitLayout update]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PXGSplitLayout.m", 190, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->unint64_t needsUpdate = needsUpdate;
    self->_updateFlags.BOOL willPerformUpdate = 0;
    if (!isPerformingUpdate) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (!needsUpdate) {
    goto LABEL_16;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_19:
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[PXGSplitLayout update]"];
    [v9 handleFailureInFunction:v10, @"PXGSplitLayout.m", 193, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.BOOL isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if (needsUpdate)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    [(PXGSplitLayout *)self _updateSublayoutGeometries];
    p_additionalUpdateFlags = &self->_additionalUpdateFlags;
    self->_additionalUpdateFlags.BOOL willPerformUpdate = 0;
    unint64_t v8 = self->_additionalUpdateFlags.needsUpdate;
    if (v8)
    {
      if (self->_additionalUpdateFlags.isPerformingUpdate)
      {
        double v13 = [MEMORY[0x1E4F28B00] currentHandler];
        CGRect v14 = [NSString stringWithUTF8String:"-[PXGSplitLayout update]"];
        [v13 handleFailureInFunction:v14, @"PXGSplitLayout.m", 197, @"Invalid parameter not satisfying: %@", @"!_additionalUpdateFlags.isPerformingUpdate" file lineNumber description];

        unint64_t v8 = p_additionalUpdateFlags->needsUpdate;
      }
      self->_additionalUpdateFlags.BOOL isPerformingUpdate = 1;
      self->_additionalUpdateFlags.updated = 1;
      if (v8)
      {
        p_additionalUpdateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFFELL;
        self->_isPerformingAdditionalUpdate = 1;
        [(PXGSplitLayout *)self _updateSublayoutGeometries];
        self->_isPerformingAdditionalUpdate = 0;
        unint64_t v8 = p_additionalUpdateFlags->needsUpdate;
      }
      self->_additionalUpdateFlags.BOOL isPerformingUpdate = 0;
      if (v8)
      {
        double v15 = [MEMORY[0x1E4F28B00] currentHandler];
        unsigned __int16 v16 = [NSString stringWithUTF8String:"-[PXGSplitLayout update]"];
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PXGSplitLayout.m", 203, @"still needing to update %lu after update pass", p_additionalUpdateFlags->needsUpdate);
      }
    }
    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.BOOL isPerformingUpdate = 0;
  if (needsUpdate)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"-[PXGSplitLayout update]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXGSplitLayout.m", 205, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
  }
LABEL_16:
  v19.receiver = self;
  v19.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v19 update];
}

- (void)_updateSublayoutGeometries
{
  self->_isUpdatingSublayouts = 1;
  [(PXGSplitLayout *)self _performUpdateSublayoutGeometries];
  if ([(PXGLayout *)self hasSublayoutsRemainingToBeUpdated]
    && [(PXGSplitLayout *)self allowsRepeatedSublayoutsUpdates])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __44__PXGSplitLayout__updateSublayoutGeometries__block_invoke;
    v3[3] = &unk_1E5DD36F8;
    v3[4] = self;
    [(PXGLayout *)self performRepeatedSublayoutsUpdate:v3];
  }
  self->_isUpdatingSublayouts = 0;
}

- (void)viewEnvironmentDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 viewEnvironmentDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout viewEnvironmentDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 464, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout referenceSizeDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 471, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)_replaceSublayout:(id)a3 withSublayout:(id)a4 atIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  self->_settingSublayouts = 1;
  [v9 setNeedsUpdate];
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)PXGSplitLayout;
    -[PXGLayout removeSublayoutsInRange:](&v15, sel_removeSublayoutsInRange_, a5, 1);
  }
  if (v9) {
    [(PXGLayout *)self insertSublayout:v9 atIndex:a5];
  }
  self->_settingSublayouts = 0;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_10:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      goto LABEL_11;
    }
LABEL_9:
    if (self->_updateFlags.updated)
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v14 = [NSString stringWithUTF8String:"-[PXGSplitLayout _replaceSublayout:withSublayout:atIndex:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXGSplitLayout.m", 67, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_9;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_11:
  [(PXGLayout *)self setNeedsUpdateOfScrollableAxis];
}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v5 didAddSublayout:a3 atIndex:a4 flags:a5];
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXGSplitLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGSplitLayout.m", 212, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v10 sublayoutDidChangeLastBaseline:v4];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        id v9 = [NSString stringWithUTF8String:"-[PXGSplitLayout sublayoutDidChangeLastBaseline:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGSplitLayout.m", 536, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (void)safeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 safeAreaInsetsDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout safeAreaInsetsDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 492, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout displayScaleDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 499, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode == a3) {
    return;
  }
  self->_mode = a3;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 1;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_6:
    if (self->_updateFlags.updated)
    {
      unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v8 = [NSString stringWithUTF8String:"-[PXGSplitLayout setMode:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGSplitLayout.m", 106, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
  }
  p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
LABEL_8:
  [(PXGLayout *)self setNeedsUpdateOfScrollableAxis];
}

- (void)setFirstSublayout:(id)a3
{
  id v4 = (PXGLayout *)a3;
  firstSublayout = self->_firstSublayout;
  if (firstSublayout != v4)
  {
    id v9 = v4;
    uint64_t v6 = v4;
    unint64_t v7 = self->_firstSublayout;
    self->_firstSublayout = v6;
    objc_super v8 = firstSublayout;

    [(PXGSplitLayout *)self _replaceSublayout:v8 withSublayout:v6 atIndex:[(PXGSplitLayout *)self firstSublayoutIndex]];
    id v4 = v9;
  }
}

- (int64_t)firstSublayoutIndex
{
  return 0;
}

- (void)setSecondSublayout:(id)a3
{
  id v9 = (PXGLayout *)a3;
  if (self->_secondSublayout != v9)
  {
    int64_t v4 = [(PXGSplitLayout *)self secondSublayoutIndex];
    secondSublayout = self->_secondSublayout;
    uint64_t v6 = v9;
    unint64_t v7 = self->_secondSublayout;
    self->_secondSublayout = v6;
    objc_super v8 = secondSublayout;

    [(PXGSplitLayout *)self _replaceSublayout:v8 withSublayout:v6 atIndex:v4];
  }
}

- (int64_t)secondSublayoutIndex
{
  return self->_firstSublayout != 0;
}

- (void)setShouldExcludeTopAndBottomPaddingFromReferenceSize:(BOOL)a3
{
  if (self->_shouldExcludeTopAndBottomPaddingFromReferenceSize != a3)
  {
    self->_shouldExcludeTopAndBottomPaddingFromReferenceSize = a3;
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unint64_t v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout setShouldExcludeTopAndBottomPaddingFromReferenceSize:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 130, @"invalidating %lu after it already has been updated", 1);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondSublayout, 0);
  objc_storeStrong((id *)&self->_firstSublayout, 0);
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return self->_allowsRepeatedSublayoutsUpdates;
}

- (void)setObjectReferenceLookup:(int64_t)a3
{
  self->_objectReferenceLookup = a3;
}

- (int64_t)objectReferenceLookup
{
  return self->_objectReferenceLookup;
}

- (UIEdgeInsets)presentedPadding
{
  double top = self->_presentedPadding.top;
  double left = self->_presentedPadding.left;
  double bottom = self->_presentedPadding.bottom;
  double right = self->_presentedPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInterlayoutSpacing:(double)a3
{
  self->_interlayoutSpacing = a3;
}

- (double)interlayoutSpacing
{
  return self->_interlayoutSpacing;
}

- (void)setFloatingThresholdOffset:(double)a3
{
  self->_floatingThresholdOffset = a3;
}

- (void)setFloatingModesRespectSafeArea:(BOOL)a3
{
  self->_floatingModesRespectSafeArea = a3;
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v5 willRemoveSublayout:a3 atIndex:a4 flags:a5];
}

- (void)enumerateSublayoutsForCreatingPointReferenceUsingBlock:(id)a3
{
  int64_t v4 = (void (**)(id, void *, unsigned char *))a3;
  char v7 = 0;
  objc_super v5 = [(PXGSplitLayout *)self secondSublayout];
  if (v5) {
    v4[2](v4, v5, &v7);
  }
  uint64_t v6 = [(PXGSplitLayout *)self firstSublayout];
  if (v6 && !v7) {
    v4[2](v4, v6, &v7);
  }
}

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (void)didChangeSublayoutOrigins
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 didChangeSublayoutOrigins];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        char v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout didChangeSublayoutOrigins]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 543, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)userInterfaceDirectionDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 userInterfaceDirectionDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        char v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout userInterfaceDirectionDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 513, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)scrollSpeedRegimeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 scrollSpeedRegimeDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        char v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout scrollSpeedRegimeDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 506, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)referenceDepthDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  [(PXGLayout *)&v8 referenceDepthDidChange];
  if (!self->_isUpdatingSublayouts)
  {
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        char v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout referenceDepthDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 478, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

uint64_t __44__PXGSplitLayout__updateSublayoutGeometries__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performUpdateSublayoutGeometries];
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v9 = a3;
  int64_t v10 = [(PXGSplitLayout *)self objectReferenceLookup];
  switch(v10)
  {
    case 2:
      *a5 = v9;
      double v11 = [(PXGSplitLayout *)self secondSublayout];
      if (v11)
      {
        uint64_t v12 = [(PXGSplitLayout *)self secondSublayout];
LABEL_9:
        double v13 = (void *)v12;
        int64_t v5 = [(PXGLayout *)self indexOfSublayout:v12];

LABEL_11:
        break;
      }
LABEL_10:
      int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_11;
    case 1:
      *a5 = v9;
      double v11 = [(PXGSplitLayout *)self firstSublayout];
      if (v11)
      {
        uint64_t v12 = [(PXGSplitLayout *)self firstSublayout];
        goto LABEL_9;
      }
      goto LABEL_10;
    case 0:
      v15.receiver = self;
      v15.super_class = (Class)PXGSplitLayout;
      int64_t v5 = [(PXGLayout *)&v15 sublayoutIndexForObjectReference:v9 options:a4 updatedObjectReference:a5];
      break;
  }

  return v5;
}

- (void)setAdjustSublayoutZPositions:(BOOL)a3
{
  if (self->_adjustSublayoutZPositions != a3)
  {
    self->_adjustSublayoutZPositions = a3;
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        char v7 = [NSString stringWithUTF8String:"-[PXGSplitLayout setAdjustSublayoutZPositions:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGSplitLayout.m", 138, @"invalidating %lu after it already has been updated", 1);

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

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (self->_firstSublayout) {
    a3.NSUInteger length = (self->_secondSublayout != 0) + 1;
  }
  else {
    a3.NSUInteger length = self->_secondSublayout != 0;
  }
  v17.NSUInteger location = a3.location;
  v17.NSUInteger length = length;
  a3.NSUInteger location = 0;
  NSRange v6 = NSIntersectionRange(v17, a3);
  if (v6.length) {
    BOOL v7 = location == v6.location;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7 || length != v6.length)
  {
    v15.receiver = self;
    v15.super_class = (Class)PXGSplitLayout;
    -[PXGLayout removeSublayoutsInRange:](&v15, sel_removeSublayoutsInRange_, location, length);
    return;
  }
  if (self->_firstSublayout)
  {
    unint64_t v9 = [(PXGSplitLayout *)self firstSublayoutIndex];
    BOOL v11 = v9 >= location && v9 - location < v6.length;
  }
  else
  {
    BOOL v11 = 0;
  }
  if (self->_secondSublayout)
  {
    unint64_t v12 = [(PXGSplitLayout *)self secondSublayoutIndex];
    BOOL v14 = v12 >= location && v12 - location < v6.length;
    if (v11) {
      goto LABEL_29;
    }
  }
  else
  {
    BOOL v14 = 0;
    if (v11) {
LABEL_29:
    }
      [(PXGSplitLayout *)self setFirstSublayout:0];
  }
  if (v14)
  {
    [(PXGSplitLayout *)self setSecondSublayout:0];
  }
}

@end