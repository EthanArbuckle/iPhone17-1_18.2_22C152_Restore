@interface _UINavigationBarLayout
- (BOOL)isVariableHeight;
- (CGRect)_layoutFrameFor:(id)a3 withOrder:(int64_t)a4;
- (CGRect)topWhitespaceLayoutFrame;
- (NSString)description;
- (_UINavigationBarLayout)init;
- (_UINavigationBarLayout)initWithLayout:(id)a3;
- (double)backgroundViewLayoutFrame;
- (double)contentViewLayoutFrame;
- (double)layoutHeightRevealingPart:(id *)a1;
- (double)layoutHeights;
- (double)searchBarLayoutFrame;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layoutForMeasuringWidth:(void *)a1;
- (int64_t)_promptOrder;
- (int64_t)_topPaletteOrder;
- (uint64_t)removeAllViews;
- (uint64_t)setHidesSearchBarWhenScrolling:(uint64_t)result;
- (void)_addLayoutItem:(id)a3;
- (void)_includeContentLayoutDataInLayout:(BOOL)a3;
- (void)_removeLayoutItem:(id)a3;
- (void)_reorderLayoutItem:(id)a3 toOrder:(int64_t)a4;
- (void)_reprioritizeLayoutItem:(id)a3 toPriority:(int64_t)a4;
- (void)_updateContentViewLayoutItem;
- (void)_updateLargeTitleViewLayoutItem;
- (void)_updateLayoutOutputs;
- (void)_updateLayoutParametersForWidth:(double)a3;
- (void)_updateRefreshControlLayoutData;
- (void)ensureBackButtonTruncationOccursWithContext:(id)a3;
- (void)finalizeStateFromTransition:(id)a3;
- (void)installViewsInNavigationBar:(uint64_t)a1;
- (void)interleaveViewsWithLayout:(void *)a3 inNavigationBar:;
- (void)iterateLayoutViews:(uint64_t)a1;
- (void)layoutViews;
- (void)prepareToRecordToState:(id)a3;
- (void)recordFromStateForTransition:(id)a3;
- (void)recordToStateForTransition:(id)a3;
- (void)removeViewsNotInLayout:(uint64_t)a1;
- (void)restingHeights;
- (void)setAnimationContentClippingView:(uint64_t)a1;
- (void)setBackgroundView:(uint64_t)a1;
- (void)setBottomPalette:(uint64_t)a1;
- (void)setCompactBackgroundViewLayout:(uint64_t)a1;
- (void)setContentView:(uint64_t)a1;
- (void)setContentViewLayout:(id *)a1;
- (void)setContentViewVisualProvider:(uint64_t)a1;
- (void)setLargeTitleView:(uint64_t)a1;
- (void)setLargeTitleViewLayout:(id *)a1;
- (void)setLayoutSize:(double)a3;
- (void)setPromptView:(uint64_t)a1;
- (void)setRefreshControlHost:(id *)a1;
- (void)setSearchBar:(uint64_t)a1;
- (void)setStandardBackgroundViewLayout:(id *)a1;
- (void)setTopPalette:(uint64_t)a1;
- (void)setWeeTitleLabel:(uint64_t)a1;
- (void)updateLayout;
@end

@implementation _UINavigationBarLayout

- (void)_updateLayoutOutputs
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v3 = self->_stackingOrderedLayout;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v35 objects:v39 count:16];
  char v5 = 0;
  v6 = 0;
  if (!v4)
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    goto LABEL_28;
  }
  uint64_t v7 = *(void *)v36;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v36 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * v12);
      if (v6)
      {
        if (v13 && *(double *)(v13 + 64) > 0.0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_28;
        }
      }
      else
      {
        if (!v13)
        {
          double v17 = 0.0;
          goto LABEL_18;
        }
        double v14 = 0.0;
        if ((*(unsigned char *)(v13 + 8) & 1) == 0) {
          double v14 = *(double *)(v13 + 32);
        }
        double v15 = *(double *)(v13 + 40);
        if (v15 <= v14 || (*(unsigned char *)(v13 + 8) & 4) != 0)
        {
          double v17 = *(double *)(v13 + 56);
LABEL_18:
          v6 = 0;
          double v8 = v8 + v17;
          goto LABEL_22;
        }
        double v11 = 0.0;
        if ((*(unsigned char *)(v13 + 8) & 1) == 0) {
          double v11 = *(double *)(v13 + 32);
        }
        double v9 = *(double *)(v13 + 64);
        v6 = (_UIBarInsertLayoutData *)(id)v13;
        char v5 = 1;
        double v10 = v15;
      }
LABEL_22:
      ++v12;
    }
    while (v4 != v12);
    uint64_t v18 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v35 objects:v39 count:16];
    uint64_t v4 = v18;
  }
  while (v18);
LABEL_28:

  if (vabdd_f64(v9, v11) < 0.00000011920929) {
    double v9 = v11;
  }
  if (_UIBarsApplyChromelessEverywhere()) {
    BOOL clientCanUpdateChromelessTransitionProgress = self->_clientCanUpdateChromelessTransitionProgress;
  }
  else {
    BOOL clientCanUpdateChromelessTransitionProgress = 0;
  }
  BOOL useManualScrollEdgeAppearance = self->_useManualScrollEdgeAppearance;
  if (!clientCanUpdateChromelessTransitionProgress && self->_useManualScrollEdgeAppearance)
  {
    self->_chromelessTransitionProgress = 1.0 - self->_manualScrollEdgeAppearanceProgress;
    int64_t apiVersion = self->_apiVersion;
    goto LABEL_36;
  }
  int64_t apiVersion = self->_apiVersion;
  if (apiVersion < 1)
  {
    self->_chromelessTransitionProgress = 0.0;
    goto LABEL_56;
  }
  if (v9 <= v11)
  {
    if (clientCanUpdateChromelessTransitionProgress
      && (self->_clientUsesManualScrollEdgeAppearanceProgressSPI & v5) == 0)
    {
      double v24 = 1.0 - self->_manualScrollEdgeAppearanceProgress;
      goto LABEL_85;
    }
    self->_chromelessTransitionProgress = 0.0;
  }
  else if (v9 >= v10)
  {
    self->_chromelessTransitionProgress = 1.0;
  }
  else
  {
    if (clientCanUpdateChromelessTransitionProgress && !self->_clientUsesManualScrollEdgeAppearanceProgressSPI) {
      double v24 = 1.0;
    }
    else {
      double v24 = (v9 - v11) / (v10 - v11);
    }
LABEL_85:
    self->_chromelessTransitionProgress = v24;
  }
LABEL_36:
  if (apiVersion >= 2)
  {
    if (self->_largeTitleView)
    {
      if (v6 == self->_largeTitleLayoutData) {
        char v22 = v4;
      }
      else {
        char v22 = 1;
      }
      standardBackgroundViewLayout = self->_standardBackgroundViewLayout;
      if ((v22 & 1) == 0 && !useManualScrollEdgeAppearance)
      {
        -[_UIBarBackgroundLayout setUseExplicitGeometry:](standardBackgroundViewLayout, "setUseExplicitGeometry:", 1, (void)v35);
        [(_UIBarBackgroundLayout *)self->_standardBackgroundViewLayout setBackgroundHeight1:v8 + self->_backgroundExtension];
        [(_UIBarBackgroundLayout *)self->_standardBackgroundViewLayout setBackgroundHeight2:self->_layoutSize.height - v8];
        goto LABEL_56;
      }
    }
    else
    {
      standardBackgroundViewLayout = self->_standardBackgroundViewLayout;
    }
    -[_UIBarBackgroundLayout setUseExplicitGeometry:](standardBackgroundViewLayout, "setUseExplicitGeometry:", 0, (void)v35);
  }
LABEL_56:
  if (self->_largeTitleView
    && (largeTitleLayoutData = self->_largeTitleLayoutData) != 0
    && (double preferredHeight = largeTitleLayoutData->_preferredHeight, preferredHeight > 0.0))
  {
    double collapsingHeight = largeTitleLayoutData->_collapsingHeight;
    if (collapsingHeight <= 0.0 || collapsingHeight < preferredHeight)
    {
      self->_largeTitleExposure = collapsingHeight / preferredHeight;
      if (fabs(collapsingHeight / preferredHeight) < 0.00000011920929) {
        self->_largeTitleExposure = 0.0;
      }
    }
    else
    {
      self->_largeTitleExposure = 1.0;
    }
    self->_largeTitleTransitionProgress = -[_UIBarInsertLayoutData transitionProgress]((uint64_t)largeTitleLayoutData);
    [(_UINavigationBarContentViewLayout *)self->_contentViewLayout setLargeTitleHeight:collapsingHeight];
    contentViewLayout = self->_contentViewLayout;
    double v30 = preferredHeight;
  }
  else
  {
    self->_largeTitleExposure = 0.0;
    self->_largeTitleTransitionProgress = 0.0;
    -[_UINavigationBarContentViewLayout setLargeTitleHeight:](self->_contentViewLayout, "setLargeTitleHeight:", 0.0, (void)v35);
    contentViewLayout = self->_contentViewLayout;
    double v30 = 0.0;
  }
  -[_UINavigationBarContentViewLayout setLargeTitleHeightRange:](contentViewLayout, "setLargeTitleHeightRange:", 0.0, v30, (void)v35);
  refreshControlHost = self->_refreshControlHost;
  if (refreshControlHost)
  {
    refreshControlLayoutData = self->_refreshControlLayoutData;
    if (refreshControlLayoutData) {
      double v33 = refreshControlLayoutData->_collapsingHeight;
    }
    else {
      double v33 = 0.0;
    }
    [(_UINavigationControllerRefreshControlHost *)refreshControlHost setUnobstructedHeight:v33];
  }
  if (self->_clientWantsBackgroundHidden)
  {
    self->_computedBackgroundViewAlpha = 0.0;
  }
  else
  {
    double requestedBackgroundViewAlpha = self->_requestedBackgroundViewAlpha;
    if (self->_apiVersion < 2)
    {
      if (v6 || self->_useManualScrollEdgeAppearance || self->_backgroundCoversContentOnly) {
        double requestedBackgroundViewAlpha = requestedBackgroundViewAlpha * (1.0 - self->_chromelessTransitionProgress);
      }
      self->_computedBackgroundViewAlpha = requestedBackgroundViewAlpha;
    }
    else
    {
      self->_computedBackgroundViewAlpha = requestedBackgroundViewAlpha;
      [(_UIBarBackgroundLayout *)self->_standardBackgroundViewLayout setBackgroundTransitionProgress:self->_chromelessTransitionProgress];
    }
  }
}

- (void)setBottomPalette:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 264) != v4)
  {
    id v14 = v4;
    objc_storeStrong((id *)(a1 + 264), a2);
    char v5 = *(void **)(a1 + 264);
    if (v5)
    {
      uint64_t v6 = [v5 _layoutPriority];
      uint64_t v7 = 700;
      if (v6 == 2) {
        uint64_t v7 = 1801;
      }
      if (v6 == 1) {
        uint64_t v8 = 1701;
      }
      else {
        uint64_t v8 = v7;
      }
      uint64_t v9 = *(void *)(a1 + 72);
      if (!v9)
      {
        double v10 = objc_alloc_init(_UIBarInsertLayoutData);
        uint64_t v12 = v10;
        if (v10)
        {
          objc_setProperty_nonatomic_copy(v10, v11, @"BottomPalette", 24);
          v12->_priority = v8;
          v12->_order = 30;
        }
        uint64_t v13 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v12;

        uint64_t v9 = *(void *)(a1 + 72);
        if (!v9) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v9 + 8) & 8) != 0) {
        objc_msgSend((id)a1, "_reprioritizeLayoutItem:toPriority:");
      }
      else {
LABEL_14:
      }
        objc_msgSend((id)a1, "_addLayoutItem:");
    }
    else
    {
      [(id)a1 _removeLayoutItem:*(void *)(a1 + 72)];
    }
    id v4 = v14;
  }
}

- (void)setTopPalette:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 256) != v4)
  {
    id v15 = v4;
    objc_storeStrong((id *)(a1 + 256), a2);
    char v5 = *(void **)(a1 + 256);
    if (v5)
    {
      uint64_t v6 = [v5 _layoutPriority];
      uint64_t v7 = 900;
      if (v6 == 2) {
        uint64_t v7 = 1802;
      }
      if (v6 == 1) {
        uint64_t v8 = 1702;
      }
      else {
        uint64_t v8 = v7;
      }
      uint64_t v9 = [(id)a1 _topPaletteOrder];
      uint64_t v10 = *(void *)(a1 + 64);
      if (!v10)
      {
        double v11 = objc_alloc_init(_UIBarInsertLayoutData);
        uint64_t v13 = v11;
        if (v11)
        {
          objc_setProperty_nonatomic_copy(v11, v12, @"TopPalette", 24);
          v13->_priority = v8;
          v13->_order = v9;
        }
        id v14 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v13;

        uint64_t v10 = *(void *)(a1 + 64);
        if (!v10) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v10 + 8) & 8) != 0)
      {
        objc_msgSend((id)a1, "_reprioritizeLayoutItem:toPriority:");
        [(id)a1 _reorderLayoutItem:*(void *)(a1 + 64) toOrder:v9];
      }
      else
      {
LABEL_14:
        objc_msgSend((id)a1, "_addLayoutItem:");
      }
    }
    else
    {
      [(id)a1 _removeLayoutItem:*(void *)(a1 + 64)];
    }
    id v4 = v15;
  }
}

- (void)setSearchBar:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 240) != v4)
  {
    id v18 = v4;
    objc_storeStrong((id *)(a1 + 240), a2);
    uint64_t v5 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 240))
    {
      if (!v5)
      {
        int v6 = *(unsigned __int8 *)(a1 + 116);
        uint64_t v7 = objc_alloc_init(_UIBarInsertLayoutData);
        uint64_t v9 = v7;
        if (v7)
        {
          if (v6) {
            uint64_t v10 = 1700;
          }
          else {
            uint64_t v10 = 1900;
          }
          objc_setProperty_nonatomic_copy(v7, v8, @"SearchBar", 24);
          v9->_priority = v10;
          v9->_order = 50;
        }
        double v11 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v9;

        uint64_t v12 = *(void *)(a1 + 48);
        if (v12) {
          *(unsigned char *)(v12 + 8) = *(unsigned char *)(v12 + 8) & 0xFE | *(unsigned char *)(a1 + 116);
        }
        uint64_t v13 = objc_alloc_init(_UIBarInsertLayoutData);
        id v15 = v13;
        if (v13)
        {
          objc_setProperty_nonatomic_copy(v13, v14, @"ActiveSearchScopeBar", 24);
          *(_OWORD *)&v15->_priority = xmmword_186B93750;
        }
        v16 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = v15;

        uint64_t v17 = *(void *)(a1 + 56);
        if (v17) {
          *(unsigned char *)(v17 + 8) |= 1u;
        }
        uint64_t v5 = *(void *)(a1 + 48);
      }
      [(id)a1 _addLayoutItem:v5];
      [(id)a1 _addLayoutItem:*(void *)(a1 + 56)];
    }
    else
    {
      [(id)a1 _removeLayoutItem:v5];
      [(id)a1 _removeLayoutItem:*(void *)(a1 + 56)];
    }
    id v4 = v18;
  }
}

- (void)setWeeTitleLabel:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v6 = *(id *)(a1 + 232);
    uint64_t v5 = (id *)(a1 + 232);
    if (v6 != v4)
    {
      id v7 = v4;
      objc_storeStrong(v5, a2);
      id v4 = v7;
    }
  }
}

- (void)setPromptView:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 120) != v4)
  {
    id v11 = v4;
    objc_storeStrong((id *)(a1 + 120), a2);
    uint64_t v5 = *(void *)(a1 + 16);
    if (*(void *)(a1 + 120))
    {
      if (!v5)
      {
        uint64_t v6 = [(id)a1 _promptOrder];
        id v7 = objc_alloc_init(_UIBarInsertLayoutData);
        uint64_t v9 = v7;
        if (v7)
        {
          objc_setProperty_nonatomic_copy(v7, v8, @"Prompt", 24);
          v9->_priority = 900;
          v9->_order = v6;
        }
        uint64_t v10 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v9;

        uint64_t v5 = *(void *)(a1 + 16);
      }
      [(id)a1 _addLayoutItem:v5];
    }
    else
    {
      [(id)a1 _removeLayoutItem:v5];
    }
    id v4 = v11;
  }
}

- (void)setLargeTitleView:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 144);
    id v9 = v4;
    if (v4)
    {
      if (v5 == v4)
      {
        if (*(void *)(a1 + 168)) {
          goto LABEL_8;
        }
        uint64_t v6 = v4;
      }
      else
      {
        objc_storeStrong((id *)(a1 + 144), a2);
        uint64_t v6 = *(void **)(a1 + 144);
      }
      uint64_t v7 = [v6 layout];
      uint64_t v8 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v7;
    }
    else
    {
      *(void *)(a1 + 144) = 0;

      uint64_t v8 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = 0;
    }

LABEL_8:
    [(id)a1 _updateLargeTitleViewLayoutItem];
    id v4 = v9;
  }
}

- (void)_updateLargeTitleViewLayoutItem
{
  if (self->_largeTitleView && (largeTitleViewLayout = self->_largeTitleViewLayout) != 0)
  {
    [(_UINavigationBarLargeTitleViewLayout *)largeTitleViewLayout setOverlaysContentView:self->_largeTitleViewOverlaysContentView];
    largeTitleLayoutData = self->_largeTitleLayoutData;
    if (!largeTitleLayoutData)
    {
      id v5 = objc_alloc_init(_UIBarInsertLayoutData);
      uint64_t v7 = v5;
      if (v5)
      {
        objc_setProperty_nonatomic_copy(v5, v6, @"LargeTitle", 24);
        *(_OWORD *)&v7->_priority = xmmword_186B93730;
      }
      uint64_t v8 = self->_largeTitleLayoutData;
      self->_largeTitleLayoutData = v7;

      id v9 = self->_largeTitleLayoutData;
      if (v9 && (*(unsigned char *)&v9->_flags |= 2u, (uint64_t v10 = self->_largeTitleLayoutData) != 0))
      {
        *(unsigned char *)&v10->_flags |= 1u;
        largeTitleLayoutData = self->_largeTitleLayoutData;
      }
      else
      {
        largeTitleLayoutData = 0;
      }
    }
    [(_UINavigationBarLayout *)self _addLayoutItem:largeTitleLayoutData];
  }
  else
  {
    id v11 = self->_largeTitleLayoutData;
    [(_UINavigationBarLayout *)self _removeLayoutItem:v11];
  }
}

- (uint64_t)setHidesSearchBarWhenScrolling:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned __int8 *)(result + 116) != a2)
    {
      *(unsigned char *)(result + 116) = a2;
      if (*(void *)(result + 240))
      {
        uint64_t v2 = *(void *)(result + 48);
        if (v2)
        {
          *(unsigned char *)(v2 + 8) = *(unsigned char *)(v2 + 8) & 0xFE | a2;
          uint64_t v3 = *(void *)(result + 48);
          a2 = *(unsigned __int8 *)(result + 116);
        }
        else
        {
          uint64_t v3 = 0;
        }
        if (a2) {
          uint64_t v4 = 1700;
        }
        else {
          uint64_t v4 = 1900;
        }
        return [(id)result _reprioritizeLayoutItem:v3 toPriority:v4];
      }
    }
  }
  return result;
}

- (void)setContentViewVisualProvider:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (void)setContentView:(uint64_t)a1
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    if (*(void *)(a1 + 136) && *(id *)(a1 + 128) != v4)
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v12 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Surprise!", buf, 2u);
        }
      }
      else
      {
        id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setContentView____s_category) + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Surprise!", v13, 2u);
        }
      }
    }
    uint64_t v6 = *(void **)(a1 + 128);
    if (v5)
    {
      if (v6 == v5)
      {
        if (*(void *)(a1 + 160)) {
          goto LABEL_10;
        }
        uint64_t v7 = v5;
      }
      else
      {
        objc_storeStrong((id *)(a1 + 128), a2);
        uint64_t v7 = *(void **)(a1 + 128);
      }
      uint64_t v8 = [v7 layout];
      id v9 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v8;
    }
    else
    {
      *(void *)(a1 + 128) = 0;

      uint64_t v10 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = 0;

      [*(id *)(a1 + 136) removeFromSuperview];
      id v9 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0;
    }

LABEL_10:
    [(id)a1 _updateContentViewLayoutItem];
  }
}

- (void)_addLayoutItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (*((unsigned char *)v4 + 8) & 8) == 0)
  {
    *((unsigned char *)v4 + 8) |= 8u;
    id v6 = v4;
    -[NSMutableArray insertObject:atIndex:](self->_priorityOrderedLayout, "insertObject:atIndex:", v4, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_priorityOrderedLayout, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, [(NSMutableArray *)self->_priorityOrderedLayout count], 1024, &__block_literal_global_64));
    -[NSMutableArray insertObject:atIndex:](self->_stackingOrderedLayout, "insertObject:atIndex:", v6, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_stackingOrderedLayout, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, [(NSMutableArray *)self->_stackingOrderedLayout count], 1024, &__block_literal_global_2_1));
    id v5 = v6;
    *(unsigned char *)&self->_flags &= ~1u;
  }
}

- (void)_includeContentLayoutDataInLayout:(BOOL)a3
{
  if (a3 && !self->_largeTitleViewOverlaysContentView) {
    [(_UINavigationBarLayout *)self _addLayoutItem:self->_contentLayoutData];
  }
  else {
    [(_UINavigationBarLayout *)self _removeLayoutItem:self->_contentLayoutData];
  }
}

- (void)_updateContentViewLayoutItem
{
  if (self->_contentView && self->_contentViewLayout)
  {
    if (!self->_contentLayoutData)
    {
      uint64_t v3 = objc_alloc_init(_UIBarInsertLayoutData);
      id v5 = v3;
      if (v3)
      {
        objc_setProperty_nonatomic_copy(v3, v4, @"ContentView", 24);
        *(_OWORD *)&v5->_priority = xmmword_186B93720;
      }
      contentLayoutData = self->_contentLayoutData;
      self->_contentLayoutData = v5;
    }
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(_UINavigationBarLayout *)self _includeContentLayoutDataInLayout:v7];
}

- (void)setBackgroundView:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v6 = *(id *)(a1 + 176);
    id v5 = (id *)(a1 + 176);
    if (v6 != v4)
    {
      id v7 = v4;
      objc_storeStrong(v5, a2);
      id v4 = v7;
    }
  }
}

- (void)_removeLayoutItem:(id)a3
{
  id v4 = a3;
  if (v4 && (v4[8] & 8) != 0)
  {
    v4[8] &= ~8u;
    id v5 = v4;
    [(NSMutableArray *)self->_priorityOrderedLayout removeObjectIdenticalTo:v4];
    [(NSMutableArray *)self->_stackingOrderedLayout removeObjectIdenticalTo:v5];
    id v4 = v5;
    *(unsigned char *)&self->_flags &= ~1u;
  }
}

- (void)_reprioritizeLayoutItem:(id)a3 toPriority:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && *((void *)v6 + 9) != a4 && (*((unsigned char *)v6 + 8) & 8) != 0)
  {
    uint64_t v8 = v6;
    [(NSMutableArray *)self->_priorityOrderedLayout removeObjectIdenticalTo:v6];
    v8[9] = a4;
    -[NSMutableArray insertObject:atIndex:](self->_priorityOrderedLayout, "insertObject:atIndex:", v8, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_priorityOrderedLayout, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, [(NSMutableArray *)self->_priorityOrderedLayout count], 1024, &__block_literal_global_4_0));
    id v7 = v8;
    *(unsigned char *)&self->_flags &= ~1u;
  }
}

- (int64_t)_topPaletteOrder
{
  if (self->_adjustForTabBar) {
    return 65;
  }
  else {
    return 90;
  }
}

- (BOOL)isVariableHeight
{
  if (result)
  {
    uint64_t v1 = result;
    -[_UINavigationBarLayout updateLayout](result);
    double v2 = +[_UIBarInsertLayoutData calculateLayoutHeights:]((uint64_t)_UIBarInsertLayoutData, *(void **)(v1 + 88));
    return v2 < v3;
  }
  return result;
}

- (id)layoutForMeasuringWidth:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    double v3 = (void *)a1[21];
    if (v3 && (uint64_t v5 = [v3 twoLineMode], a2 != 0.0) && v5 == 1)
    {
      id v2 = (id)[v2 copy];
      [(_UINavigationBarLayout *)(uint64_t)v2 setLayoutSize:0.0];
    }
    else
    {
      -[_UINavigationBarLayout updateLayout]((uint64_t)v2);
      id v2 = v2;
    }
  }
  return v2;
}

- (void)updateLayout
{
  if (a1)
  {
    [(id)a1 _updateLayoutParametersForWidth:*(double *)(a1 + 312)];
    id v2 = *(void **)(a1 + 32);
    if (!v2) {
      id v2 = *(void **)(a1 + 40);
    }
    double v3 = *(void **)(a1 + 80);
    double v4 = *(double *)(a1 + 320);
    id v5 = v2;
    +[_UIBarInsertLayoutData updateLayoutParameters:overflowLayout:forAvailableHeight:](v4, (uint64_t)_UIBarInsertLayoutData, v3, v5);
    +[_UIBarInsertLayoutData assignVerticalOriginsToItemsInLayouts:]((uint64_t)_UIBarInsertLayoutData, *(void **)(a1 + 88));
    *(unsigned char *)(a1 + 104) |= 1u;
    [(id)a1 _updateLayoutOutputs];
  }
}

- (void)_updateLayoutParametersForWidth:(double)a3
{
  promptView = self->_promptView;
  promptLayoutData = self->_promptLayoutData;
  if (promptView)
  {
    [(_UINavigationBarModernPromptView *)promptView updateLayoutData:promptLayoutData layoutWidth:a3];
  }
  else if (promptLayoutData)
  {
    promptLayoutData->_double minimumHeight = 0.0;
    promptLayoutData->_double preferredHeight = 0.0;
  }
  if (self->_contentView)
  {
    contentViewLayout = self->_contentViewLayout;
    if (!contentViewLayout)
    {
      uint64_t v8 = [(_UINavigationBarContentView *)self->_contentView layout];
      id v9 = self->_contentViewLayout;
      self->_contentViewLayout = v8;

      if (self->_contentViewLayout)
      {
        [(_UINavigationBarLayout *)self _includeContentLayoutDataInLayout:1];
        contentViewLayout = self->_contentViewLayout;
      }
      else
      {
        contentViewLayout = 0;
      }
    }
    [(_UINavigationBarContentViewLayout *)contentViewLayout updateLayoutData:self->_contentLayoutData layoutWidth:a3];
  }
  else
  {
    contentLayoutData = self->_contentLayoutData;
    if (contentLayoutData)
    {
      contentLayoutData->_double minimumHeight = 0.0;
      contentLayoutData->_double preferredHeight = 0.0;
    }
  }
  if (self->_refreshControlHost)
  {
    [(_UINavigationBarLayout *)self _updateRefreshControlLayoutData];
  }
  else
  {
    refreshControlLayoutData = self->_refreshControlLayoutData;
    if (refreshControlLayoutData)
    {
      refreshControlLayoutData->_double minimumHeight = 0.0;
      refreshControlLayoutData->_double preferredHeight = 0.0;
    }
  }
  searchBar = self->_searchBar;
  searchBarLayoutData = self->_searchBarLayoutData;
  if (searchBar)
  {
    [(UISearchBar *)searchBar _updateNavigationBarLayoutInsertDataForSearchBar:searchBarLayoutData collapsibleScopeBar:self->_scopeBarLayoutData forLayoutState:self->_representedSearchLayoutState];
  }
  else if (searchBarLayoutData)
  {
    searchBarLayoutData->_double minimumHeight = 0.0;
    searchBarLayoutData->_double preferredHeight = 0.0;
    scopeBarLayoutData = self->_scopeBarLayoutData;
    if (scopeBarLayoutData)
    {
      scopeBarLayoutData->_double minimumHeight = 0.0;
      scopeBarLayoutData->_double preferredHeight = 0.0;
    }
  }
  if (self->_largeTitleView)
  {
    largeTitleViewLayout = self->_largeTitleViewLayout;
    if (!largeTitleViewLayout)
    {
      v16 = [(_UINavigationBarLargeTitleView *)self->_largeTitleView layout];
      uint64_t v17 = self->_largeTitleViewLayout;
      self->_largeTitleViewLayout = v16;

      if (self->_largeTitleViewLayout)
      {
        [(_UINavigationBarLayout *)self _addLayoutItem:self->_largeTitleLayoutData];
        largeTitleViewLayout = self->_largeTitleViewLayout;
      }
      else
      {
        largeTitleViewLayout = 0;
      }
    }
    [(_UINavigationBarLargeTitleViewLayout *)largeTitleViewLayout updateLayoutData:self->_largeTitleLayoutData layoutWidth:a3];
    if (self->_largeTitleViewOverlaysContentView && self->_contentViewLayout)
    {
      v19 = self->_contentLayoutData;
      if (v19) {
        double minimumHeight = v19->_minimumHeight;
      }
      else {
        double minimumHeight = 0.0;
      }
      largeTitleLayoutData = self->_largeTitleLayoutData;
      if (largeTitleLayoutData)
      {
        largeTitleLayoutData->_double minimumHeight = minimumHeight;
        char v22 = self->_largeTitleLayoutData;
        if (v22)
        {
          *(unsigned char *)&v22->_flags &= ~1u;
          v23 = self->_largeTitleLayoutData;
          if (v23) {
            v23->_bottomInsetForTransitionProgress = 0.0;
          }
        }
      }
    }
    else
    {
      double v24 = self->_largeTitleLayoutData;
      if (v24)
      {
        *(unsigned char *)&v24->_flags |= 1u;
        v25 = self->_largeTitleLayoutData;
        if (v25) {
          v25->_bottomInsetForTransitionProgress = 14.0;
        }
      }
    }
  }
  else
  {
    id v18 = self->_largeTitleLayoutData;
    if (v18)
    {
      v18->_double minimumHeight = 0.0;
      v18->_double preferredHeight = 0.0;
    }
  }
  topPalette = self->_topPalette;
  if (topPalette) {
    [(_UINavigationBarPalette *)topPalette updateLayoutData:self->_topPaletteLayoutData layoutWidth:a3];
  }
  bottomPalette = self->_bottomPalette;
  if (bottomPalette) {
    [(_UINavigationBarPalette *)bottomPalette updateLayoutData:self->_bottomPaletteLayoutData layoutWidth:a3];
  }
  restingHeights = self->_restingHeights;
  self->_restingHeights = 0;
}

- (double)layoutHeights
{
  if (a1) {
    return +[_UIBarInsertLayoutData calculateLayoutHeights:]((uint64_t)_UIBarInsertLayoutData, *(void **)(a1 + 88));
  }
  else {
    return 0.0;
  }
}

- (void)setLayoutSize:(double)a3
{
  if (a1)
  {
    UIFloorToScale(a3, 6.0);
    BOOL v6 = *(double *)(a1 + 312) == a2 && *(double *)(a1 + 320) == v5;
    if (!v6 || (*(unsigned char *)(a1 + 104) & 1) == 0)
    {
      *(double *)(a1 + 312) = a2;
      *(double *)(a1 + 320) = v5;
      -[_UINavigationBarLayout updateLayout](a1);
    }
  }
}

- (_UINavigationBarLayout)initWithLayout:(id)a3
{
  double v4 = (char *)a3;
  v31.receiver = self;
  v31.super_class = (Class)_UINavigationBarLayout;
  double v5 = [(_UINavigationBarLayout *)&v31 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_promptView, *((id *)v4 + 15));
    objc_storeStrong((id *)&v6->_contentView, *((id *)v4 + 16));
    objc_storeStrong((id *)&v6->_contentViewVisualProvider, *((id *)v4 + 19));
    objc_storeStrong((id *)&v6->_animationContentClippingView, *((id *)v4 + 17));
    objc_storeStrong((id *)&v6->_contentViewLayout, *((id *)v4 + 20));
    objc_storeStrong((id *)&v6->_largeTitleView, *((id *)v4 + 18));
    objc_storeStrong((id *)&v6->_largeTitleViewLayout, *((id *)v4 + 21));
    objc_storeStrong((id *)&v6->_backgroundView, *((id *)v4 + 22));
    objc_storeStrong((id *)&v6->_standardBackgroundViewLayout, *((id *)v4 + 24));
    objc_storeStrong((id *)&v6->_compactBackgroundViewLayout, *((id *)v4 + 23));
    objc_storeStrong((id *)&v6->_weeTitleLabel, *((id *)v4 + 29));
    objc_storeStrong((id *)&v6->_refreshControlHost, *((id *)v4 + 28));
    objc_storeStrong((id *)&v6->_searchBar, *((id *)v4 + 30));
    objc_storeStrong((id *)&v6->_topPalette, *((id *)v4 + 32));
    objc_storeStrong((id *)&v6->_bottomPalette, *((id *)v4 + 33));
    v6->_largeTitleViewOverlaysContentView = v4[108];
    long long v7 = *(_OWORD *)(v4 + 344);
    *(_OWORD *)&v6->_largeTitleViewInsets.top = *(_OWORD *)(v4 + 328);
    *(_OWORD *)&v6->_largeTitleViewInsets.bottom = v7;
    v6->_backgroundExtension = *((double *)v4 + 25);
    v6->_backgroundCoversContentOnly = v4[109];
    v6->_hidesSearchBarWhenScrolling = v4[116];
    v6->_adjustForTabBar = v4[117];
    v6->_layoutSize = *(CGSize *)(v4 + 312);
    v6->_BOOL useManualScrollEdgeAppearance = v4[111];
    v6->_manualScrollEdgeAppearanceProgress = *((double *)v4 + 27);
    v6->_representedSearchLayoutState = *((void *)v4 + 31);
    v6->_BOOL clientCanUpdateChromelessTransitionProgress = v4[113];
    v6->_clientUsesManualScrollEdgeAppearanceProgressSPI = v4[112];
    v6->_int64_t apiVersion = *((void *)v4 + 38);
    v6->_largeTitleExposure = *((double *)v4 + 34);
    v6->_largeTitleTransitionProgress = *((double *)v4 + 35);
    v6->_chromelessTransitionProgress = *((double *)v4 + 36);
    v6->_computedBackgroundViewAlpha = *((double *)v4 + 37);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    priorityOrderedLayout = v6->_priorityOrderedLayout;
    v6->_priorityOrderedLayout = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    stackingOrderedLayout = v6->_stackingOrderedLayout;
    v6->_stackingOrderedLayout = (NSMutableArray *)v10;

    uint64_t v12 = [*((id *)v4 + 1) copy];
    topWhitespaceLayoutData = v6->_topWhitespaceLayoutData;
    v6->_topWhitespaceLayoutData = (_UIBarInsertLayoutData *)v12;

    [(_UINavigationBarLayout *)v6 _addLayoutItem:v6->_topWhitespaceLayoutData];
    if (v6->_promptView)
    {
      uint64_t v14 = [*((id *)v4 + 2) copy];
      promptLayoutData = v6->_promptLayoutData;
      v6->_promptLayoutData = (_UIBarInsertLayoutData *)v14;

      [(_UINavigationBarLayout *)v6 _addLayoutItem:v6->_promptLayoutData];
    }
    if (v6->_contentView)
    {
      uint64_t v16 = [*((id *)v4 + 3) copy];
      contentLayoutData = v6->_contentLayoutData;
      v6->_contentLayoutData = (_UIBarInsertLayoutData *)v16;

      [(_UINavigationBarLayout *)v6 _includeContentLayoutDataInLayout:1];
    }
    if (v6->_refreshControlHost)
    {
      uint64_t v18 = [*((id *)v4 + 5) copy];
      refreshControlLayoutData = v6->_refreshControlLayoutData;
      v6->_refreshControlLayoutData = (_UIBarInsertLayoutData *)v18;
    }
    if (v6->_largeTitleView)
    {
      uint64_t v20 = [*((id *)v4 + 4) copy];
      largeTitleLayoutData = v6->_largeTitleLayoutData;
      v6->_largeTitleLayoutData = (_UIBarInsertLayoutData *)v20;

      [(_UINavigationBarLayout *)v6 _addLayoutItem:v6->_largeTitleLayoutData];
    }
    if (v6->_searchBar)
    {
      uint64_t v22 = [*((id *)v4 + 6) copy];
      searchBarLayoutData = v6->_searchBarLayoutData;
      v6->_searchBarLayoutData = (_UIBarInsertLayoutData *)v22;

      uint64_t v24 = [*((id *)v4 + 7) copy];
      scopeBarLayoutData = v6->_scopeBarLayoutData;
      v6->_scopeBarLayoutData = (_UIBarInsertLayoutData *)v24;

      [(_UINavigationBarLayout *)v6 _addLayoutItem:v6->_searchBarLayoutData];
      [(_UINavigationBarLayout *)v6 _addLayoutItem:v6->_scopeBarLayoutData];
    }
    if (v6->_topPalette)
    {
      uint64_t v26 = [*((id *)v4 + 8) copy];
      topPaletteLayoutData = v6->_topPaletteLayoutData;
      v6->_topPaletteLayoutData = (_UIBarInsertLayoutData *)v26;

      [(_UINavigationBarLayout *)v6 _addLayoutItem:v6->_topPaletteLayoutData];
    }
    if (v6->_bottomPalette)
    {
      uint64_t v28 = [*((id *)v4 + 9) copy];
      bottomPaletteLayoutData = v6->_bottomPaletteLayoutData;
      v6->_bottomPaletteLayoutData = (_UIBarInsertLayoutData *)v28;

      [(_UINavigationBarLayout *)v6 _addLayoutItem:v6->_bottomPaletteLayoutData];
    }
    *(unsigned char *)&v6->_flags &= ~1u;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithLayout:self];
}

- (void)_updateRefreshControlLayoutData
{
  refreshControlLayoutData = self->_refreshControlLayoutData;
  if (self->_refreshControlHost)
  {
    if (!refreshControlLayoutData)
    {
      id v4 = objc_alloc_init(_UIBarInsertLayoutData);
      BOOL v6 = v4;
      if (v4)
      {
        objc_setProperty_nonatomic_copy(v4, v5, @"RefreshControl", 24);
        *(_OWORD *)&v6->_priority = xmmword_186B93740;
      }
      long long v7 = self->_refreshControlLayoutData;
      self->_refreshControlLayoutData = v6;

      uint64_t v8 = self->_refreshControlLayoutData;
      if (v8)
      {
        *(unsigned char *)&v8->_flags |= 4u;
        refreshControlLayoutData = self->_refreshControlLayoutData;
      }
      else
      {
        refreshControlLayoutData = 0;
      }
    }
    [(_UINavigationBarLayout *)self _addLayoutItem:refreshControlLayoutData];
    id v9 = self->_refreshControlLayoutData;
    if (v9) {
      v9->_double minimumHeight = 0.0;
    }
    [(_UINavigationControllerRefreshControlHost *)self->_refreshControlHost restingHeightOfRefreshControl];
    id v11 = self->_refreshControlLayoutData;
    if (v11)
    {
      v11->_double preferredHeight = v10;
      uint64_t v12 = self->_refreshControlLayoutData;
      if (v12) {
        *(unsigned char *)&v12->_flags |= 1u;
      }
    }
  }
  else
  {
    [(_UINavigationBarLayout *)self _removeLayoutItem:refreshControlLayoutData];
  }
}

- (void)setStandardBackgroundViewLayout:(id *)a1
{
  id v4 = a2;
  if (a1 && a1[24] != v4)
  {
    id v5 = v4;
    objc_storeStrong(a1 + 24, a2);
    [a1 _updateLayoutOutputs];
    id v4 = v5;
  }
}

- (void)layoutViews
{
  if (a1)
  {
    if (*(void *)(a1 + 120))
    {
      objc_msgSend((id)a1, "_layoutFrameFor:withOrder:", *(void *)(a1 + 16), objc_msgSend((id)a1, "_promptOrder"));
      objc_msgSend(*(id *)(a1 + 120), "setFrame:");
    }
    if (*(void *)(a1 + 256))
    {
      uint64_t v2 = *(void *)(a1 + 64);
      if (v2) {
        uint64_t v3 = *(void *)(v2 + 80);
      }
      else {
        uint64_t v3 = 90;
      }
      [(id)a1 _layoutFrameFor:v2 withOrder:v3];
      objc_msgSend(*(id *)(a1 + 256), "setFrame:");
    }
    if (*(void *)(a1 + 128))
    {
      double v4 = -[_UINavigationBarLayout contentViewLayoutFrame](a1);
      CGFloat v8 = v4;
      double v9 = v5;
      CGFloat v10 = v6;
      double v11 = v7;
      uint64_t v12 = *(void **)(a1 + 136);
      if (v12)
      {
        [v12 frame];
        objc_msgSend(*(id *)(a1 + 136), "setFrame:");
        uint64_t v13 = [*(id *)(a1 + 136) superview];
        [v13 safeAreaInsets];
        double v15 = v14;
        double v17 = v16;
        v64.origin.x = v8;
        v64.origin.y = v9;
        v64.size.width = v10;
        v64.size.height = v11;
        double MinX = CGRectGetMinX(v64);
        if (MinX >= v15) {
          double v15 = MinX;
        }
        v65.origin.x = v8;
        v65.origin.y = v9;
        v65.size.width = v10;
        v65.size.height = v11;
        double MaxX = CGRectGetMaxX(v65);
        [v13 bounds];
        double v20 = CGRectGetMaxX(v66) - v17;
        if (MaxX < v20) {
          double v20 = MaxX;
        }
        double v21 = v20 - v15;
        uint64_t v22 = *(void **)(a1 + 136);
        v23 = [v22 superview];
        objc_msgSend(v22, "convertRect:fromView:", v23, v15, v9, v21, v11);
        objc_msgSend(*(id *)(a1 + 128), "setFrame:");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 128), "setFrame:", v4, v5, v6, v7);
      }
    }
    if (*(void *)(a1 + 224))
    {
      [(id)a1 _layoutFrameFor:*(void *)(a1 + 40) withOrder:70];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      [*(id *)(a1 + 224) fullHeightOfRefreshControl];
      double v31 = v30;
      v32 = [*(id *)(a1 + 224) hostContainerView];
      objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);
    }
    if (*(void *)(a1 + 144))
    {
      [(id)a1 _layoutFrameFor:*(void *)(a1 + 32) withOrder:60];
      objc_msgSend(*(id *)(a1 + 144), "setFrame:");
    }
    if (*(void *)(a1 + 240)
      && !+[UIView _hasInProcessProgressAnimator])
    {
      double v33 = -[_UINavigationBarLayout searchBarLayoutFrame]((void *)a1);
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      uint64_t v40 = [*(id *)(a1 + 240) _viewStackedInNavigationBar];
      objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);
    }
    if (*(void *)(a1 + 264))
    {
      [(id)a1 _layoutFrameFor:*(void *)(a1 + 72) withOrder:30];
      objc_msgSend(*(id *)(a1 + 264), "setFrame:");
    }
    if (*(void *)(a1 + 232))
    {
      double v41 = *MEMORY[0x1E4F1DB28];
      double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      [*(id *)(a1 + 144) frame];
      CGFloat recta = v44;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;
      [*(id *)(a1 + 144) directionalLayoutMargins];
      double v52 = v51;
      double v54 = *(double *)(a1 + 312) - v51 - v53;
      objc_msgSend(*(id *)(a1 + 232), "sizeThatFits:", v54, v43);
      double v56 = v55;
      objc_msgSend(*(id *)(a1 + 232), "setBounds:", v41, v42, v54, v55);
      v67.origin.x = recta;
      v67.origin.y = v46;
      v67.size.width = v48;
      v67.size.height = v50;
      double MaxY = CGRectGetMaxY(v67);
      [*(id *)(a1 + 144) restingHeightOfTitleView];
      double v59 = MaxY - v58;
      [*(id *)(a1 + 232) _firstLineBaseline];
      v61 = *(void **)(a1 + 232);
      objc_msgSend(v61, "setCenter:", v52 + v54 * 0.5, v56 * 0.5 + v59 - v60);
    }
  }
}

- (double)backgroundViewLayoutFrame
{
  if (a1) {
    return *MEMORY[0x1E4F1DB28];
  }
  else {
    return 0.0;
  }
}

- (void)setRefreshControlHost:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = a1[28];
    if (v5 != v4)
    {
      id v7 = v4;
      [v5 setDelegate:0];
      [a1[28] stopAnimations];
      double v6 = [a1[28] hostContainerView];
      [v6 removeFromSuperview];

      objc_storeStrong(a1 + 28, a2);
      [a1 _updateRefreshControlLayoutData];
      id v4 = v7;
    }
  }
}

- (void)removeViewsNotInLayout:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t v18 = v3;
    if (!v3)
    {
      double v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel_removeViewsNotInLayout_ object:a1 file:@"_UINavigationBarLayout.m" lineNumber:1078 description:@"otherLayout==nil"];
    }
    id v4 = [*(id *)(a1 + 224) hostContainerView];
    id v5 = [v18[28] hostContainerView];

    if (v4 != v5)
    {
      [*(id *)(a1 + 224) stopAnimations];
      double v6 = [*(id *)(a1 + 224) hostContainerView];
      [v6 removeFromSuperview];
    }
    id v7 = *(id *)(a1 + 120);
    CGFloat v8 = v18;
    if (v7 != v18[15])
    {
      [v7 removeFromSuperview];
      CGFloat v8 = v18;
    }
    id v9 = *(id *)(a1 + 128);
    if (v9 != v8[16])
    {
      [v9 removeFromSuperview];
      [*(id *)(a1 + 136) removeFromSuperview];
      CGFloat v8 = v18;
    }
    id v10 = *(id *)(a1 + 144);
    if (v10 != v8[18])
    {
      [v10 removeFromSuperview];
      CGFloat v8 = v18;
    }
    id v11 = *(id *)(a1 + 176);
    if (v11 != v8[22])
    {
      [v11 removeFromSuperview];
      CGFloat v8 = v18;
    }
    id v12 = *(id *)(a1 + 232);
    if (v12 != v8[29])
    {
      [v12 removeFromSuperview];
      CGFloat v8 = v18;
    }
    id v13 = *(id *)(a1 + 240);
    if (v13 != v8[30])
    {
      double v14 = [v13 _viewStackedInNavigationBar];
      [v14 removeFromSuperview];

      CGFloat v8 = v18;
    }
    id v15 = *(id *)(a1 + 256);
    if (v15 != v8[32])
    {
      [v15 removeFromSuperview];
      CGFloat v8 = v18;
    }
    id v16 = *(id *)(a1 + 264);
    if (v16 != v8[33]) {
      [v16 removeFromSuperview];
    }

    uint64_t v3 = v18;
  }
}

- (void)installViewsInNavigationBar:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *(void **)(a1 + 240);
    id v4 = a2;
    id v5 = [v3 _viewStackedInNavigationBar];
    v14[0] = *(void *)(a1 + 176);
    v14[1] = (id)[*(id *)(a1 + 224) hostContainerView];
    long long v15 = *(_OWORD *)(a1 + 256);
    uint64_t v7 = *(void *)(a1 + 136);
    uint64_t v6 = *(void *)(a1 + 144);
    id v16 = v5;
    uint64_t v17 = v6;
    uint64_t v9 = *(void *)(a1 + 120);
    CGFloat v8 = *(void **)(a1 + 128);
    if (!v7) {
      uint64_t v7 = *(void *)(a1 + 128);
    }
    uint64_t v18 = v7;
    uint64_t v19 = v9;
    uint64_t v20 = *(void *)(a1 + 232);
    id v10 = [v8 assistant];
    id v21 = (id)[v10 previewContainer];

    id v11 = [*(id *)(a1 + 128) layout];
    [v11 setActive:1 contentView:*(void *)(a1 + 128)];

    [v4 _ensureViewsAreInstalledInRelativeOrder:v14 viewCount:10 insertionStartIndex:0];
    if (*(void *)(a1 + 136))
    {
      id v12 = [*(id *)(a1 + 128) superview];
      id v13 = *(void **)(a1 + 136);

      if (v12 != v13) {
        [*(id *)(a1 + 136) addSubview:*(void *)(a1 + 128)];
      }
    }
    [v5 setTranslatesAutoresizingMaskIntoConstraints:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomPalette, 0);
  objc_storeStrong((id *)&self->_topPalette, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_weeTitleLabel, 0);
  objc_storeStrong((id *)&self->_refreshControlHost, 0);
  objc_storeStrong((id *)&self->_standardBackgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_compactBackgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_largeTitleViewLayout, 0);
  objc_storeStrong((id *)&self->_contentViewLayout, 0);
  objc_storeStrong((id *)&self->_contentViewVisualProvider, 0);
  objc_storeStrong((id *)&self->_largeTitleView, 0);
  objc_storeStrong((id *)&self->_animationContentClippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_promptView, 0);
  objc_storeStrong((id *)&self->_restingHeights, 0);
  objc_storeStrong((id *)&self->_stackingOrderedLayout, 0);
  objc_storeStrong((id *)&self->_priorityOrderedLayout, 0);
  objc_storeStrong((id *)&self->_bottomPaletteLayoutData, 0);
  objc_storeStrong((id *)&self->_topPaletteLayoutData, 0);
  objc_storeStrong((id *)&self->_scopeBarLayoutData, 0);
  objc_storeStrong((id *)&self->_searchBarLayoutData, 0);
  objc_storeStrong((id *)&self->_refreshControlLayoutData, 0);
  objc_storeStrong((id *)&self->_largeTitleLayoutData, 0);
  objc_storeStrong((id *)&self->_contentLayoutData, 0);
  objc_storeStrong((id *)&self->_promptLayoutData, 0);
  objc_storeStrong((id *)&self->_topWhitespaceLayoutData, 0);
}

- (uint64_t)removeAllViews
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 120) removeFromSuperview];
    [*(id *)(v1 + 224) stopAnimations];
    uint64_t v2 = [*(id *)(v1 + 224) hostContainerView];
    [v2 removeFromSuperview];

    [*(id *)(v1 + 128) removeFromSuperview];
    [*(id *)(v1 + 136) removeFromSuperview];
    [*(id *)(v1 + 144) removeFromSuperview];
    [*(id *)(v1 + 176) removeFromSuperview];
    [*(id *)(v1 + 232) removeFromSuperview];
    uint64_t v3 = [*(id *)(v1 + 240) _viewStackedInNavigationBar];
    [v3 removeFromSuperview];

    [*(id *)(v1 + 256) removeFromSuperview];
    id v4 = *(void **)(v1 + 264);
    return [v4 removeFromSuperview];
  }
  return result;
}

- (double)searchBarLayoutFrame
{
  if (!a1) {
    return 0.0;
  }
  [a1 _layoutFrameFor:a1[6] withOrder:50];
  return result;
}

- (double)contentViewLayoutFrame
{
  if (!a1) {
    return 0.0;
  }
  if (*(unsigned char *)(a1 + 108))
  {
    -[_UIBarInsertLayoutData verticalOrigin](*(void *)(a1 + 32));
    return 0.0;
  }
  else
  {
    [(id)a1 _layoutFrameFor:*(void *)(a1 + 24) withOrder:80];
  }
  return result;
}

- (CGRect)_layoutFrameFor:(id)a3 withOrder:(int64_t)a4
{
  uint64_t v6 = (double *)a3;
  uint64_t v7 = v6;
  if (v6 && ((_BYTE)v6[1] & 8) != 0)
  {
    CGFloat width = self->_layoutSize.width;
    double inserted = -[_UIBarInsertLayoutData verticalOrigin]((uint64_t)v6);
    double v12 = v7[8];
  }
  else
  {
    uint64_t v8 = +[_UIBarInsertLayoutData layoutPriorToItemWithOrder:inLayouts:]((uint64_t)_UIBarInsertLayoutData, a4, self->_stackingOrderedLayout);
    uint64_t v9 = (void *)v8;
    CGFloat width = 0.0;
    double inserted = 0.0;
    if (v8) {
      double inserted = -[_UIBarInsertLayoutData verticalOrigin](v8) + *(double *)(v8 + 64);
    }

    double v12 = 0.0;
  }

  double v13 = 0.0;
  double v14 = inserted;
  double v15 = width;
  double v16 = v12;
  result.size.height = v16;
  result.size.CGFloat width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (_UINavigationBarLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarLayout;
  uint64_t v2 = [(_UINavigationBarLayout *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    priorityOrderedLayout = v2->_priorityOrderedLayout;
    v2->_priorityOrderedLayout = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    stackingOrderedLayout = v2->_stackingOrderedLayout;
    v2->_stackingOrderedLayout = (NSMutableArray *)v5;

    [(_UINavigationBarLayout *)v2 _updateWhitespaceLayoutItems];
  }
  return v2;
}

- (void)restingHeights
{
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = a1[12];
    if (!v3)
    {
      uint64_t v4 = +[_UIBarInsertLayoutData calculateRestingHeightsForLayouts:]((uint64_t)_UIBarInsertLayoutData, a1[11]);
      uint64_t v5 = v2[12];
      v2[12] = (void *)v4;

      uint64_t v3 = v2[12];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCompactBackgroundViewLayout:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 184), a2);
  }
}

- (void)_reorderLayoutItem:(id)a3 toOrder:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && *((void *)v6 + 10) != a4 && (*((unsigned char *)v6 + 8) & 8) != 0)
  {
    objc_super v8 = v6;
    [(NSMutableArray *)self->_stackingOrderedLayout removeObjectIdenticalTo:v6];
    v8[10] = a4;
    -[NSMutableArray insertObject:atIndex:](self->_stackingOrderedLayout, "insertObject:atIndex:", v8, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_stackingOrderedLayout, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, [(NSMutableArray *)self->_stackingOrderedLayout count], 1024, &__block_literal_global_6_1));
    uint64_t v7 = v8;
    *(unsigned char *)&self->_flags &= ~1u;
  }
}

- (int64_t)_promptOrder
{
  return 95;
}

- (void)setContentViewLayout:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 20, a2);
    [a1 _updateContentViewLayoutItem];
  }
}

- (void)setLargeTitleViewLayout:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 21, a2);
    [a1 _updateLargeTitleViewLayoutItem];
  }
}

- (CGRect)topWhitespaceLayoutFrame
{
  topWhitespaceLayoutData = self->_topWhitespaceLayoutData;
  if (topWhitespaceLayoutData)
  {
    CGFloat width = self->_layoutSize.width;
    double inserted = -[_UIBarInsertLayoutData verticalOrigin]((uint64_t)self->_topWhitespaceLayoutData);
    double collapsingHeight = topWhitespaceLayoutData->_collapsingHeight;
  }
  else
  {
    CGFloat width = 0.0;
    double collapsingHeight = 0.0;
    double inserted = 0.0;
  }
  double v6 = 0.0;
  double v7 = width;
  result.size.height = collapsingHeight;
  result.size.CGFloat width = v7;
  result.origin.y = inserted;
  result.origin.x = v6;
  return result;
}

- (void)interleaveViewsWithLayout:(void *)a3 inNavigationBar:
{
  v20[19] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:sel_interleaveViewsWithLayout_inNavigationBar_ object:a1 file:@"_UINavigationBarLayout.m" lineNumber:1040 description:@"otherLayout==nil"];
    }
    v20[2] = (id)objc_msgSend(*(id *)(a1 + 224), "hostContainerView", *(void *)(a1 + 176), *((void *)v5 + 22));
    id v7 = (id)[*((id *)v5 + 28) hostContainerView];
    uint64_t v8 = *(void *)(a1 + 256);
    uint64_t v9 = *(void *)(a1 + 264);
    v20[3] = v7;
    v20[4] = v8;
    uint64_t v10 = *((void *)v5 + 33);
    v20[5] = *((void *)v5 + 32);
    v20[6] = v9;
    v20[7] = v10;
    v20[8] = (id)[*(id *)(a1 + 240) _viewStackedInNavigationBar];
    id v11 = (id)[*((id *)v5 + 30) _viewStackedInNavigationBar];
    uint64_t v12 = *(void *)(a1 + 136);
    uint64_t v13 = *(void *)(a1 + 144);
    v20[9] = v11;
    v20[10] = v13;
    v20[11] = *((void *)v5 + 18);
    if (!v12) {
      uint64_t v12 = *(void *)(a1 + 128);
    }
    v20[12] = v12;
    uint64_t v14 = *((void *)v5 + 17);
    if (!v14) {
      uint64_t v14 = *((void *)v5 + 16);
    }
    uint64_t v16 = *(void *)(a1 + 120);
    double v15 = *(void **)(a1 + 128);
    v20[13] = v14;
    v20[14] = v16;
    uint64_t v17 = *(void *)(a1 + 232);
    v20[15] = *((void *)v5 + 15);
    v20[16] = v17;
    v20[17] = *((void *)v5 + 29);
    uint64_t v18 = [v15 assistant];
    v20[18] = (id)[v18 previewContainer];

    [v6 _ensureViewsAreInstalledInRelativeOrder:v20 viewCount:19 insertionStartIndex:0];
  }
}

- (void)iterateLayoutViews:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    double v27 = v3;
    if (!v3)
    {
      double v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:sel_iterateLayoutViews_ object:a1 file:@"_UINavigationBarLayout.m" lineNumber:1108 description:@"Block has to be non-nil or this method is pointless"];
    }
    id v4 = *(void **)(a1 + 120);
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      id v6 = v4;
      objc_msgSend((id)a1, "_layoutFrameFor:withOrder:", v5, objc_msgSend((id)a1, "_promptOrder"));
      v27[2](v27, v6);
    }
    id v7 = *(void **)(a1 + 256);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)(a1 + 64);
      if (v9) {
        uint64_t v10 = *(void *)(v9 + 80);
      }
      else {
        uint64_t v10 = 90;
      }
      [(id)a1 _layoutFrameFor:v9 withOrder:v10];
      v27[2](v27, v8);
    }
    id v11 = *(void **)(a1 + 128);
    if (v11)
    {
      id v12 = v11;
      double v13 = -[_UINavigationBarLayout contentViewLayoutFrame](a1);
      ((void (*)(void (**)(id, id), id, double))v27[2])(v27, v12, v13);
    }
    uint64_t v14 = [*(id *)(a1 + 224) hostContainerView];
    if (v14)
    {
      [(id)a1 _layoutFrameFor:*(void *)(a1 + 40) withOrder:70];
      v27[2](v27, v14);
    }

    double v15 = *(void **)(a1 + 144);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = v15;
      [(id)a1 _layoutFrameFor:v16 withOrder:60];
      v27[2](v27, v17);
    }
    uint64_t v18 = [*(id *)(a1 + 240) _viewStackedInNavigationBar];
    if (v18)
    {
      double v19 = -[_UINavigationBarLayout searchBarLayoutFrame]((void *)a1);
      ((void (*)(void (**)(id, id), void *, double))v27[2])(v27, v18, v19);
    }

    uint64_t v20 = *(void **)(a1 + 264);
    if (v20)
    {
      uint64_t v21 = *(void *)(a1 + 72);
      id v22 = v20;
      [(id)a1 _layoutFrameFor:v21 withOrder:30];
      v27[2](v27, v22);
    }
    v23 = *(void **)(a1 + 232);
    uint64_t v3 = v27;
    if (v23)
    {
      id v24 = v23;
      double v25 = -[_UINavigationBarLayout searchBarLayoutFrame]((void *)a1);
      ((void (*)(void (**)(id, id), id, double))v27[2])(v27, v24, v25);

      uint64_t v3 = v27;
    }
  }
}

- (double)layoutHeightRevealingPart:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v2 = 0.0;
  if (!a1) {
    return v2;
  }
  switch(a2)
  {
    case 1:
      id v4 = a1 + 3;
      goto LABEL_15;
    case 2:
      id v4 = a1 + 4;
      goto LABEL_15;
    case 3:
      id v4 = a1 + 2;
      goto LABEL_15;
    case 4:
      goto LABEL_11;
    case 5:
      id v4 = a1 + 7;
      id v6 = a1[7];
      if (v6)
      {
        if ((v6[8] & 8) == 0) {
          id v4 = a1 + 6;
        }
      }
      else
      {
LABEL_11:
        id v4 = a1 + 6;
      }
      goto LABEL_15;
    case 6:
      id v4 = a1 + 8;
      goto LABEL_15;
    case 7:
      id v4 = a1 + 9;
      goto LABEL_15;
    case 8:
      id v4 = a1 + 5;
LABEL_15:
      id v7 = *v4;
      uint64_t v5 = v7;
      if (!v7 || (v7[1] & 8) == 0) {
        goto LABEL_31;
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = a1[10];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v9) {
        goto LABEL_30;
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      break;
    default:
      uint64_t v5 = 0;
      goto LABEL_31;
  }
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
      double v14 = 0.0;
      if (v13)
      {
        if (*(void *)(v13 + 72) >= v5[9])
        {
          uint64_t v15 = 40;
        }
        else
        {
          if (*(unsigned char *)(v13 + 8)) {
            goto LABEL_28;
          }
          uint64_t v15 = 32;
        }
        double v14 = *(double *)(v13 + v15);
      }
LABEL_28:
      double v2 = v2 + v14;
      ++v12;
    }
    while (v10 != v12);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v10);
LABEL_30:

LABEL_31:
  return v2;
}

- (NSString)description
{
  v18.receiver = self;
  v18.super_class = (Class)_UINavigationBarLayout;
  uint64_t v3 = [(_UINavigationBarLayout *)&v18 description];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = NSStringFromCGSize(self->_layoutSize);
  [v4 appendFormat:@" layoutSize=%@ priority=%p order=%p", v5, self->_priorityOrderedLayout, self->_stackingOrderedLayout];

  if (self->_promptView) {
    objc_msgSend(v4, "appendFormat:", @" prompt{view=%p data=%p}", self->_promptView, self->_promptLayoutData);
  }
  contentView = self->_contentView;
  if (contentView)
  {
    objc_msgSend(v4, "appendFormat:", @" content{view=%p data=%p layout=%p}", contentView, self->_contentLayoutData, self->_contentViewLayout);
    if (self->_animationContentClippingView) {
      [v4 appendString:@"[CLIPPED]"];
    }
  }
  if (self->_refreshControlHost) {
    objc_msgSend(v4, "appendFormat:", @" refreshControl{host=%p layout=%p}", self->_refreshControlHost, self->_refreshControlLayoutData);
  }
  largeTitleView = self->_largeTitleView;
  if (largeTitleView)
  {
    largeTitleLayoutData = self->_largeTitleLayoutData;
    largeTitleViewLayout = self->_largeTitleViewLayout;
    double largeTitleExposure = self->_largeTitleExposure;
    double largeTitleTransitionProgress = self->_largeTitleTransitionProgress;
    uint64_t v12 = NSStringFromDirectionalEdgeInsets(self->_largeTitleViewInsets);
    [v4 appendFormat:@" largeTitle{view=%p data=%p layout=%p exposure=%f progress=%f insets=%@}", largeTitleView, largeTitleLayoutData, largeTitleViewLayout, *(void *)&largeTitleExposure, *(void *)&largeTitleTransitionProgress, v12];
  }
  searchBar = self->_searchBar;
  if (searchBar)
  {
    if (self->_hidesSearchBarWhenScrolling) {
      double v14 = @" hidesWhenScrolling";
    }
    else {
      double v14 = &stru_1ED0E84C0;
    }
    [v4 appendFormat:@" searchBar{view=%p data=%p%@ scopeBarData=%p}", searchBar, self->_searchBarLayoutData, v14, self->_scopeBarLayoutData];
  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    if (self->_backgroundCoversContentOnly) {
      uint64_t v16 = @" coversContentOnly";
    }
    else {
      uint64_t v16 = &stru_1ED0E84C0;
    }
    [v4 appendFormat:@" background{view=%p extension=%f%@}", backgroundView, *(void *)&self->_backgroundExtension, v16];
  }
  if (self->_weeTitleLabel) {
    objc_msgSend(v4, "appendFormat:", @" weeTitleView=%p", self->_weeTitleLabel);
  }
  if (self->_topPalette) {
    objc_msgSend(v4, "appendFormat:", @" topPalette{view=%p data=%p}", self->_topPalette, self->_topPaletteLayoutData);
  }
  if (self->_bottomPalette) {
    objc_msgSend(v4, "appendFormat:", @" bottomPalette{view=%p data=%p}", self->_bottomPalette, self->_bottomPaletteLayoutData);
  }
  if (self->_useManualScrollEdgeAppearance)
  {
    objc_msgSend(v4, "appendFormat:", @" manualScrollEdgeProgress=%f", 1.0 - self->_manualScrollEdgeAppearanceProgress);
  }
  else if (self->_largeTitleView)
  {
    objc_msgSend(v4, "appendFormat:", @" chromelessScrollEdgeProgress=%f", *(void *)&self->_chromelessTransitionProgress);
  }
  return (NSString *)v4;
}

- (void)recordFromStateForTransition:(id)a3
{
  contentView = self->_contentView;
  id v5 = a3;
  [(_UINavigationBarContentView *)contentView recordFromStateForTransition:v5];
  [(_UINavigationBarLargeTitleView *)self->_largeTitleView recordFromStateForTransition:v5];
}

- (void)prepareToRecordToState:(id)a3
{
  contentView = self->_contentView;
  id v5 = a3;
  [(_UINavigationBarContentView *)contentView prepareToRecordToState:v5];
  [(_UINavigationBarLargeTitleView *)self->_largeTitleView prepareToRecordToState:v5];
}

- (void)recordToStateForTransition:(id)a3
{
  contentView = self->_contentView;
  id v5 = a3;
  [(_UINavigationBarContentView *)contentView recordToStateForTransition:v5];
  [(_UINavigationBarLargeTitleView *)self->_largeTitleView recordToStateForTransition:v5];
}

- (void)ensureBackButtonTruncationOccursWithContext:(id)a3
{
}

- (void)finalizeStateFromTransition:(id)a3
{
  [(_UINavigationBarContentView *)self->_contentView adoptLayout:self->_contentViewLayout];
  largeTitleView = self->_largeTitleView;
  largeTitleViewLayout = self->_largeTitleViewLayout;
  [(_UINavigationBarLargeTitleView *)largeTitleView adoptLayout:largeTitleViewLayout];
}

- (void)setAnimationContentClippingView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

@end