@interface TabOverviewItemLayoutInfo
- (BOOL)interactivelyInserted;
- (BOOL)isSnapshotBlank;
- (BOOL)visibleInTabOverview;
- (TabOverviewItemLayoutInfo)init;
- (__n128)setTransform:(uint64_t)a1;
- (double)alpha;
- (double)closeStartLocation;
- (double)frame;
- (double)interactiveInsertionProgress;
- (double)setCloseLastLayoutLocation:(double)a3;
- (double)setCloseStartLocation:(double)a3;
- (double)snapshotAlpha;
- (double)transform;
- (double)zPosition;
- (id)initWithTabOverview:(void *)a3 item:;
- (id)itemView;
- (uint64_t)attachedView;
- (uint64_t)borrowedContentView;
- (uint64_t)interpolatedBoundsLogScale;
- (uint64_t)interpolatedCornerRadius;
- (uint64_t)interpolatedHeightTransitionPercent;
- (uint64_t)interpolatedLocation;
- (uint64_t)interpolatedSnapshotAlpha;
- (uint64_t)interpolatedValuesAreSteady;
- (uint64_t)setInteractiveInsertionProgress:(uint64_t)result;
- (uint64_t)setInteractivelyInserted:(uint64_t)result;
- (void)_clearViews;
- (void)_ensureViews;
- (void)_insertBorrowedContentView;
- (void)_updateSnapshotImage;
- (void)copyGeometryFromLayoutInfo:(void *)a1;
- (void)dealloc;
- (void)interpolatedValues;
- (void)pulseDimmingView;
- (void)setAlpha:(uint64_t)a1;
- (void)setAttachedView:(uint64_t)a1;
- (void)setAttachedViewReferenceRect:(double)a3;
- (void)setBorrowedContentView:(double)a3 headerHeight:;
- (void)setDimmingAlpha:(double)a3 animated:;
- (void)setFrame:(CGFloat)a3;
- (void)setInterpolatedBoundsLogScale:(uint64_t)a1;
- (void)setInterpolatedCornerRadius:(uint64_t)a1;
- (void)setInterpolatedHeightTransitionPercent:(uint64_t)a1;
- (void)setInterpolatedLocation:(uint64_t)a1;
- (void)setInterpolatedSnapshotAlpha:(uint64_t)a1;
- (void)setSnapshotAlpha:(uint64_t)a1;
- (void)setVisibleInTabOverview:(uint64_t)a1;
- (void)setZPosition:(uint64_t)a1;
- (void)updateItemView;
- (void)updateSnapshot;
@end

@implementation TabOverviewItemLayoutInfo

- (void)updateItemView
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 216), *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240));
    v3 = objc_msgSend(*(id *)(a1 + 56), "layer", *(void *)(a1 + 312), *(void *)(a1 + 320), *(void *)(a1 + 328), *(void *)(a1 + 336), *(void *)(a1 + 344), *(void *)(a1 + 352), *(void *)(a1 + 360), *(void *)(a1 + 368), *(void *)(a1 + 376), *(void *)(a1 + 384), *(void *)(a1 + 392), *(void *)(a1 + 400), *(void *)(a1 + 408), *(void *)(a1 + 416), *(void *)(a1 + 424), *(void *)(a1 + 432));
    [v3 setTransform:&v15];

    double v4 = *(double *)(a1 + 136);
    v5 = [*(id *)(a1 + 56) layer];
    [v5 setZPosition:v4];

    v6 = [WeakRetained title];
    [*(id *)(a1 + 56) setTitle:v6];

    v7 = [WeakRetained icon];
    [*(id *)(a1 + 56) setIcon:v7];

    objc_msgSend(*(id *)(a1 + 56), "setRecording:", objc_msgSend(WeakRetained, "isRecording"));
    objc_msgSend(*(id *)(a1 + 56), "setMediaStateIcon:", objc_msgSend(WeakRetained, "mediaStateIcon"));
    objc_msgSend(*(id *)(a1 + 56), "setUnread:", objc_msgSend(WeakRetained, "isUnread"));
    v8 = [WeakRetained shareParticipants];
    [*(id *)(a1 + 56) setShareParticipants:v8];

    objc_msgSend(*(id *)(a1 + 56), "setPinned:", objc_msgSend(WeakRetained, "isPinned"));
    double v9 = *(double *)(a1 + 80);
    v10 = [*(id *)(a1 + 56) snapshotView];
    [v10 setAlpha:v9];

    double v11 = *(double *)(a1 + 128);
    v12 = [*(id *)(a1 + 56) dimmingView];
    [v12 setAlpha:v11];

    [*(id *)(a1 + 56) setAttachedView:*(void *)(a1 + 120)];
    objc_msgSend(*(id *)(a1 + 56), "setAttachedViewReferenceRect:", *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208));
    v13 = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    v14 = -[TabOverview _topBarThemeForItem:](v13, WeakRetained);
    [*(id *)(a1 + 56) setTopBarTheme:v14];

    if ([WeakRetained dragState] != 2) {
      [*(id *)(a1 + 56) setAlpha:*(double *)(a1 + 72)];
    }
  }
}

- (TabOverviewItemLayoutInfo)init
{
  return 0;
}

- (id)initWithTabOverview:(void *)a3 item:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)TabOverviewItemLayoutInfo;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeWeak(v7 + 3, v5);
      objc_storeWeak(a1 + 4, v6);
    }
  }

  return a1;
}

- (void)dealloc
{
  -[TabOverviewItemLayoutInfo _clearViews]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)TabOverviewItemLayoutInfo;
  [(TabOverviewItemLayoutInfo *)&v3 dealloc];
}

- (void)_clearViews
{
  if (!a1) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  [*(id *)(a1 + 56) setAttachedView:0];
  v2 = [*(id *)(a1 + 56) closeButton];
  [v2 removeTarget:WeakRetained action:sel__close_ forControlEvents:64];

  char v3 = [*(id *)(a1 + 56) containsBorrowedContentView:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3) {
    goto LABEL_5;
  }
  if (v4)
  {
    uint64_t v4 = 0;
LABEL_5:
    [*(id *)(a1 + 56) removeBorrowedContentView:v4];
  }
  -[TabOverview _relinquishReusableTabOverviewItemView:]((uint64_t)WeakRetained, *(void **)(a1 + 56));
  [*(id *)(a1 + 56) updateSnapshotWithImage:0];
  id v5 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0;
}

- (void)_ensureViews
{
  if (a1 && *(unsigned char *)(a1 + 17) && !*(void *)(a1 + 56))
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    uint64_t v3 = -[TabOverview _requestReusableTabOverviewItemView](WeakRetained);
    uint64_t v4 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v3;

    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__TabOverviewItemLayoutInfo__ensureViews__block_invoke;
    v7[3] = &unk_1E6D77D90;
    v7[4] = a1;
    v8 = WeakRetained;
    id v6 = WeakRetained;
    [v5 performWithoutAnimation:v7];
  }
}

void __41__TabOverviewItemLayoutInfo__ensureViews__block_invoke(uint64_t a1)
{
  -[TabOverviewItemLayoutInfo updateItemView](*(void *)(a1 + 32));
  -[TabOverviewItemLayoutInfo _updateSnapshotImage](*(void *)(a1 + 32));
  -[TabOverviewItemLayoutInfo _insertBorrowedContentView](*(void *)(a1 + 32));
  v2 = [*(id *)(*(void *)(a1 + 32) + 56) closeButton];
  [v2 addTarget:*(void *)(a1 + 40) action:sel__close_ forControlEvents:64];

  -[TabOverview scrollingContainerView](*(id **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addSubview:*(void *)(*(void *)(a1 + 32) + 56)];
}

- (void)_updateSnapshotImage
{
  if (a1)
  {
    if (*(void *)(a1 + 56))
    {
      BOOL v6 = 0;
      id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
      id v3 = objc_loadWeakRetained((id *)(a1 + 32));
      uint64_t v4 = *(void **)(a1 + 56);
      id v5 = -[TabOverview _snapshotForItem:isBlank:](WeakRetained, v3, &v6);
      [v4 updateSnapshotWithImage:v5];

      objc_msgSend(*(id *)(a1 + 56), "setAllowsSnapshotTopBackdropUnderlap:", -[TabOverview _itemHasAdditionalHeaderHeight:]((uint64_t)WeakRetained, v3));
      *(unsigned char *)(a1 + 16) = v6;
    }
  }
}

- (void)_insertBorrowedContentView
{
  if (a1 && *(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 56), "insertBorrowedContentView:headerHeight:", *(double *)(a1 + 48));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    id v2 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 56), "setAllowsBorrowedContentTopBackdropUnderlap:", -[TabOverview _itemHasAdditionalHeaderHeight:]((uint64_t)WeakRetained, v2));
  }
}

- (id)itemView
{
  if (a1)
  {
    id v2 = a1;
    -[TabOverviewItemLayoutInfo _ensureViews]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAlpha:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 72) != a2)
    {
      *(double *)(a1 + 72) = a2;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (void)setFrame:(CGFloat)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v32.origin.x = a2;
    v32.origin.y = a3;
    v32.size.width = a4;
    v32.size.height = a5;
    if (!CGRectEqualToRect(*(CGRect *)(a1 + 216), v32))
    {
      if (fabs(a2) == INFINITY
        || ((v10 = fabs(a4), double v11 = fabs(a5), fabs(a3) != INFINITY) ? (v12 = v10 == INFINITY) : (v12 = 1),
            !v12 ? (char v13 = 0) : (char v13 = 1),
            !v13 ? (BOOL v14 = v11 == INFINITY) : (BOOL v14 = 1),
            !v14 ? (char v15 = 0) : (char v15 = 1),
            v15))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
        v17 = [WeakRetained items];
        id v18 = objc_loadWeakRetained((id *)(a1 + 32));
        uint64_t v19 = [v17 indexOfObject:v18];

        v20 = WBS_LOG_CHANNEL_PREFIXTabView();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          uint64_t v22 = [v17 count];
          [WeakRetained frame];
          v23 = NSStringFromCGRect(v31);
          int v24 = 134218498;
          uint64_t v25 = v19;
          __int16 v26 = 2048;
          uint64_t v27 = v22;
          __int16 v28 = 2114;
          v29 = v23;
          _os_log_error_impl(&dword_1E102C000, v21, OS_LOG_TYPE_ERROR, "Frame will be undefined for tab overview item at index: %ld, number of items: %ld, tab overview frame: %{public}@", (uint8_t *)&v24, 0x20u);
        }
      }
      *(CGFloat *)(a1 + 216) = a2;
      *(CGFloat *)(a1 + 224) = a3;
      *(CGFloat *)(a1 + 232) = a4;
      *(CGFloat *)(a1 + 240) = a5;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (__n128)setTransform:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (_OWORD *)(a1 + 312);
    long long v5 = a2[5];
    *(_OWORD *)&a.m31 = a2[4];
    *(_OWORD *)&a.m33 = v5;
    long long v6 = a2[7];
    *(_OWORD *)&a.m41 = a2[6];
    *(_OWORD *)&a.m43 = v6;
    long long v7 = a2[1];
    *(_OWORD *)&a.m11 = *a2;
    *(_OWORD *)&a.m13 = v7;
    long long v8 = a2[3];
    *(_OWORD *)&a.m21 = a2[2];
    *(_OWORD *)&a.m23 = v8;
    long long v9 = *(_OWORD *)(a1 + 392);
    *(_OWORD *)&v20.m31 = *(_OWORD *)(a1 + 376);
    *(_OWORD *)&v20.m33 = v9;
    long long v10 = *(_OWORD *)(a1 + 424);
    *(_OWORD *)&v20.m41 = *(_OWORD *)(a1 + 408);
    *(_OWORD *)&v20.m43 = v10;
    long long v11 = *(_OWORD *)(a1 + 328);
    *(_OWORD *)&v20.m11 = *(_OWORD *)(a1 + 312);
    *(_OWORD *)&v20.m13 = v11;
    long long v12 = *(_OWORD *)(a1 + 360);
    *(_OWORD *)&v20.m21 = *(_OWORD *)(a1 + 344);
    *(_OWORD *)&v20.m23 = v12;
    if (!CATransform3DEqualToTransform(&a, &v20))
    {
      long long v14 = *a2;
      long long v15 = a2[1];
      long long v16 = a2[3];
      v4[2] = a2[2];
      v4[3] = v16;
      *uint64_t v4 = v14;
      v4[1] = v15;
      long long v17 = a2[4];
      long long v18 = a2[5];
      long long v19 = a2[7];
      v4[6] = a2[6];
      v4[7] = v19;
      v4[4] = v17;
      v4[5] = v18;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
  return result;
}

- (void)setZPosition:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 136) != a2)
    {
      *(double *)(a1 + 136) = a2;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (void)setBorrowedContentView:(double)a3 headerHeight:
{
  id v6 = a2;
  if (a1 && (*(id *)(a1 + 40) != v6 || *(double *)(a1 + 48) != a3))
  {
    id v9 = v6;
    char v7 = objc_msgSend(*(id *)(a1 + 56), "containsBorrowedContentView:");
    uint64_t v8 = *(void *)(a1 + 40);
    if ((v7 & 1) == 0)
    {
      if (!v8)
      {
LABEL_7:
        objc_storeStrong((id *)(a1 + 40), a2);
        *(double *)(a1 + 48) = a3;
        -[TabOverviewItemLayoutInfo _insertBorrowedContentView](a1);
        id v6 = v9;
        goto LABEL_9;
      }
      uint64_t v8 = 0;
    }
    [*(id *)(a1 + 56) removeBorrowedContentView:v8];
    goto LABEL_7;
  }
LABEL_9:
}

- (void)setDimmingAlpha:(double)a3 animated:
{
  if (a1)
  {
    *(double *)(a1 + 128) = a3;
    long long v5 = [*(id *)(a1 + 56) dimmingView];
    uint64_t v6 = MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__TabOverviewItemLayoutInfo_setDimmingAlpha_animated___block_invoke;
    v8[3] = &unk_1E6D785E8;
    id v9 = v5;
    double v10 = a3;
    id v7 = v5;
    +[UIView safari_animate:withDuration:delay:options:animations:completion:](0.35, 0.0, v6, a2, 327682, v8, 0);
  }
}

uint64_t __54__TabOverviewItemLayoutInfo_setDimmingAlpha_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)pulseDimmingView
{
  if (a1)
  {
    id v2 = [*(id *)(a1 + 56) dimmingView];
    id v3 = (void *)MEMORY[0x1E4FB1EB0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke;
    v5[3] = &unk_1E6D77D90;
    id v6 = v2;
    uint64_t v7 = a1;
    id v4 = v2;
    [v3 animateKeyframesWithDuration:2 delay:v5 options:0 animations:0.5 completion:0.0];
  }
}

void __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_2;
  v9[3] = &unk_1E6D77E20;
  id v10 = *(id *)(a1 + 32);
  [v2 addKeyframeWithRelativeStartTime:v9 relativeDuration:0.0 animations:0.5];
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_3;
  v6[3] = &unk_1E6D77D90;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.5 animations:0.5];
}

uint64_t __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.5];
}

uint64_t __45__TabOverviewItemLayoutInfo_pulseDimmingView__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 40) + 128)];
}

- (void)setVisibleInTabOverview:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 17) != a2)
  {
    *(unsigned char *)(a1 + 17) = a2;
    if ((a2 & 1) == 0) {
      -[TabOverviewItemLayoutInfo _clearViews](a1);
    }
  }
}

- (void)updateSnapshot
{
  if (a1) {
    -[TabOverviewItemLayoutInfo _updateSnapshotImage](a1);
  }
}

- (void)setSnapshotAlpha:(uint64_t)a1
{
  if (a1)
  {
    if (*(double *)(a1 + 80) != a2)
    {
      *(double *)(a1 + 80) = a2;
      -[TabOverviewItemLayoutInfo updateItemView](a1);
    }
  }
}

- (void)interpolatedValues
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    id v2 = (void *)a1[1];
    if (!v2)
    {
      uint64_t v6 = a1[11];
      long long v7 = *((_OWORD *)a1 + 6);
      uint64_t v8 = a1[14];
      uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:4];
      id v4 = (void *)v1[1];
      v1[1] = v3;

      id v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

- (uint64_t)interpolatedValuesAreSteady
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1 || ![*(id *)(a1 + 144) isInSteadyStateWithConstraints:0]) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = -[TabOverviewItemLayoutInfo interpolatedValues]((void *)a1);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!-[TabOverviewInterpolatedValue isInSteadyState](*(void *)(*((void *)&v9 + 1) + 8 * v6)))
        {
          uint64_t v7 = 0;
          goto LABEL_14;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 1;
LABEL_14:

  return v7;
}

- (void)setAttachedView:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 120) != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(a1 + 120), a2);
    -[TabOverviewItemLayoutInfo updateItemView](a1);
    id v4 = v5;
  }
}

- (void)setAttachedViewReferenceRect:(double)a3
{
  if (a1 && !CGRectEqualToRect(*(CGRect *)&a2, *(CGRect *)(a1 + 184)))
  {
    *(double *)(a1 + 184) = a2;
    *(double *)(a1 + 192) = a3;
    *(double *)(a1 + 200) = a4;
    *(double *)(a1 + 208) = a5;
    -[TabOverviewItemLayoutInfo updateItemView](a1);
  }
}

- (void)copyGeometryFromLayoutInfo:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = (void *)a1[18];
    id v4 = (void *)a2[18];
    id v5 = a2;
    [v4 targetLocation];
    objc_msgSend(v3, "resetToLocation:");
    -[TabOverviewItemLayoutInfo interpolatedValues](a1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[TabOverviewItemLayoutInfo interpolatedValues](v5);

    objc_msgSend(v7, "safari_enumerateZippedValuesWithArray:withBlock:", v6, &__block_literal_global_1);
  }
}

void __56__TabOverviewItemLayoutInfo_copyGeometryFromLayoutInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v4 = -[TabOverviewInterpolatedValue targetValue](a3);
  -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v5, v4);
}

- (BOOL)isSnapshotBlank
{
  if (result) {
    return *(unsigned char *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)borrowedContentView
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (BOOL)visibleInTabOverview
{
  if (result) {
    return *(unsigned char *)(result + 17) != 0;
  }
  return result;
}

- (double)interactiveInsertionProgress
{
  if (a1) {
    return *(double *)(a1 + 64);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setInteractiveInsertionProgress:(uint64_t)result
{
  if (result) {
    *(double *)(result + 64) = a2;
  }
  return result;
}

- (BOOL)interactivelyInserted
{
  if (result) {
    return *(unsigned char *)(result + 18) != 0;
  }
  return result;
}

- (uint64_t)setInteractivelyInserted:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 18) = a2;
  }
  return result;
}

- (double)alpha
{
  if (a1) {
    return *(double *)(a1 + 72);
  }
  else {
    return 0.0;
  }
}

- (double)snapshotAlpha
{
  if (a1) {
    return *(double *)(a1 + 80);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)interpolatedSnapshotAlpha
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void)setInterpolatedSnapshotAlpha:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (uint64_t)interpolatedCornerRadius
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (void)setInterpolatedCornerRadius:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (uint64_t)interpolatedHeightTransitionPercent
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (void)setInterpolatedHeightTransitionPercent:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (uint64_t)interpolatedBoundsLogScale
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (void)setInterpolatedBoundsLogScale:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (uint64_t)attachedView
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

- (double)frame
{
  if (a1) {
    return *(double *)(a1 + 216);
  }
  else {
    return 0.0;
  }
}

- (double)zPosition
{
  if (a1) {
    return *(double *)(a1 + 136);
  }
  else {
    return 0.0;
  }
}

- (double)transform
{
  if (a1)
  {
    long long v2 = *(_OWORD *)(a1 + 392);
    a2[4] = *(_OWORD *)(a1 + 376);
    a2[5] = v2;
    long long v3 = *(_OWORD *)(a1 + 424);
    a2[6] = *(_OWORD *)(a1 + 408);
    a2[7] = v3;
    long long v4 = *(_OWORD *)(a1 + 328);
    *a2 = *(_OWORD *)(a1 + 312);
    a2[1] = v4;
    long long v5 = *(_OWORD *)(a1 + 344);
    long long v6 = *(_OWORD *)(a1 + 360);
    a2[2] = v5;
    a2[3] = v6;
  }
  else
  {
    *(void *)&long long v5 = 0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v5;
}

- (double)setCloseLastLayoutLocation:(double)a3
{
  if (result)
  {
    result[31] = a2;
    result[32] = a3;
    result[33] = a4;
    result[34] = a5;
  }
  return result;
}

- (double)closeStartLocation
{
  if (a1) {
    return *(double *)(a1 + 280);
  }
  else {
    return 0.0;
  }
}

- (double)setCloseStartLocation:(double)a3
{
  if (result)
  {
    result[35] = a2;
    result[36] = a3;
    result[37] = a4;
    result[38] = a5;
  }
  return result;
}

- (uint64_t)interpolatedLocation
{
  if (result) {
    return *(void *)(result + 144);
  }
  return result;
}

- (void)setInterpolatedLocation:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 144), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedLocation, 0);
  objc_storeStrong((id *)&self->_attachedView, 0);
  objc_storeStrong((id *)&self->_interpolatedBoundsLogScale, 0);
  objc_storeStrong((id *)&self->_interpolatedHeightTransitionPercent, 0);
  objc_storeStrong((id *)&self->_interpolatedCornerRadius, 0);
  objc_storeStrong((id *)&self->_interpolatedSnapshotAlpha, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_borrowedContentView, 0);
  objc_destroyWeak((id *)&self->_tabOverviewItem);
  objc_destroyWeak((id *)&self->_tabOverview);
  objc_storeStrong((id *)&self->_interpolatedValues, 0);
}

@end