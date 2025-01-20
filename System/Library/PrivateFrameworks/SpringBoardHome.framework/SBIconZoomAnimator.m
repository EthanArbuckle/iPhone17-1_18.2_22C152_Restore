@interface SBIconZoomAnimator
- (BOOL)isPastPointOfNoReturn;
- (NSSet)criticalIconNodeIdentifiers;
- (SBIconListView)dockListView;
- (SBIconListView)iconListView;
- (SBIconZoomAnimator)initWithAnimationContainer:(id)a3;
- (double)startTime;
- (id)iconViewForIcon:(id)a3;
- (unint64_t)_numberOfSignificantAnimations;
- (unint64_t)dockIconCount;
- (unint64_t)listIconCount;
- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5;
- (void)_applyLabelAlphaFraction:(double)a3;
- (void)_cleanupAnimation;
- (void)_clearObservers;
- (void)_iconModelDidRelayout:(id)a3;
- (void)_iconModelDidReload:(id)a3;
- (void)_invalidateAnimationForSignificantIconModelChangesForReason:(id)a3;
- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)_setDockListView:(id)a3;
- (void)_setIconListView:(id)a3;
- (void)dealloc;
- (void)enumerateIconsAndIconViewsWithHandler:(id)a3;
- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4;
- (void)setCriticalIconNodeIdentifiers:(id)a3;
@end

@implementation SBIconZoomAnimator

- (SBIconZoomAnimator)initWithAnimationContainer:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBIconZoomAnimator;
  v5 = [(SBIconAnimator *)&v17 initWithAnimationContainer:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    listIconToViewMap = v5->_listIconToViewMap;
    v5->_listIconToViewMap = (NSMapTable *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    dockIconToViewMap = v5->_dockIconToViewMap;
    v5->_dockIconToViewMap = (NSMapTable *)v8;

    uint64_t v10 = [v4 iconModel];
    iconModel = v5->_iconModel;
    v5->_iconModel = (SBHIconModel *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v5 selector:sel__iconModelDidRelayout_ name:@"SBIconModelDidLayoutIconStateNotification" object:v5->_iconModel];
    [v12 addObserver:v5 selector:sel__iconModelDidReload_ name:@"SBIconModelDidReloadIconsNotification" object:v5->_iconModel];
    v13 = [v4 currentIconListView];
    uint64_t v14 = [v13 model];
    iconListModel = v5->_iconListModel;
    v5->_iconListModel = (SBIconListModel *)v14;

    [(SBIconListModel *)v5->_iconListModel addNodeObserver:v5];
  }

  return v5;
}

- (void)dealloc
{
  [(SBIconZoomAnimator *)self _clearObservers];
  v3.receiver = self;
  v3.super_class = (Class)SBIconZoomAnimator;
  [(SBIconAnimator *)&v3 dealloc];
}

- (id)iconViewForIcon:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_listIconToViewMap objectForKey:v4];
  if (!v5)
  {
    v5 = [(NSMapTable *)self->_dockIconToViewMap objectForKey:v4];
    if (!v5)
    {
      uint64_t v6 = SBLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SBIconZoomAnimator iconViewForIcon:](v6);
      }

      v7 = [(SBIconAnimator *)self animationContainer];
      uint64_t v8 = [v7 currentIconListView];

      v5 = [v8 iconViewForIcon:v4];
    }
  }

  return v5;
}

- (void)enumerateIconsAndIconViewsWithHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, void))a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(NSMapTable *)self->_listIconToViewMap keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v11 = [(NSMapTable *)self->_listIconToViewMap objectForKey:v10];
        v4[2](v4, v10, v11, 0);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = [(NSMapTable *)self->_dockIconToViewMap keyEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        v18 = [(NSMapTable *)self->_dockIconToViewMap objectForKey:v17];
        v4[2](v4, v17, v18, 1);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }
}

- (unint64_t)listIconCount
{
  return [(NSMapTable *)self->_listIconToViewMap count];
}

- (unint64_t)dockIconCount
{
  return [(NSMapTable *)self->_dockIconToViewMap count];
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isPastPointOfNoReturn
{
  if (BSFloatIsZero()) {
    return 1;
  }
  CACurrentMediaTime();
  return BSFloatGreaterThanFloat();
}

- (void)_prepareAnimation
{
  v8.receiver = self;
  v8.super_class = (Class)SBIconZoomAnimator;
  [(SBIconAnimator *)&v8 _prepareAnimation];
  objc_super v3 = [(SBIconAnimator *)self animationContainer];
  id v4 = [v3 currentIconListView];
  [(SBIconZoomAnimator *)self _setIconListView:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SBIconZoomAnimator__prepareAnimation__block_invoke;
  v7[3] = &unk_1E6AAEB78;
  v7[4] = self;
  [v4 enumerateIconViewsUsingBlock:v7];
  v5 = [v3 dockIconListView];
  [(SBIconZoomAnimator *)self _setDockListView:v5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SBIconZoomAnimator__prepareAnimation__block_invoke_2;
  v6[3] = &unk_1E6AAEB78;
  v6[4] = self;
  [v5 enumerateIconViewsUsingBlock:v6];
}

void __39__SBIconZoomAnimator__prepareAnimation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 88);
  id v3 = a2;
  id v4 = [v3 icon];
  [v2 setObject:v3 forKey:v4];
}

void __39__SBIconZoomAnimator__prepareAnimation__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = a2;
  id v4 = [v3 icon];
  [v2 setObject:v3 forKey:v4];
}

- (void)_setAnimationFraction:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconZoomAnimator;
  -[SBIconAnimator _setAnimationFraction:](&v7, sel__setAnimationFraction_);
  v5 = [(SBIconAnimator *)self settings];
  int v6 = [v5 labelAlphaWithZoom];

  if (v6) {
    [(SBIconZoomAnimator *)self _applyLabelAlphaFraction:a3];
  }
}

- (void)_cleanupAnimation
{
  id v3 = [(SBIconAnimator *)self settings];
  int v4 = [v3 labelAlphaWithZoom];

  if (v4) {
    [(SBIconZoomAnimator *)self _applyLabelAlphaFraction:0.0];
  }
  self->_startTime = 0.0;
  if ([(SBIconAnimator *)self invalidated]) {
    [(SBIconZoomAnimator *)self _clearObservers];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBIconZoomAnimator;
  [(SBIconAnimator *)&v5 _cleanupAnimation];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconZoomAnimator;
  id v3 = [(SBIconAnimator *)&v7 _numberOfSignificantAnimations];
  int v4 = [(SBIconAnimator *)self settings];
  unint64_t v5 = (unint64_t)v3 + [v4 labelAlphaWithZoom];

  return v5;
}

- (void)_applyLabelAlphaFraction:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v5 = [(NSMapTable *)self->_listIconToViewMap objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v9++) setIconLabelAlpha:1.0 - a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(NSMapTable *)self->_dockIconToViewMap objectEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    double v14 = 1.0 - a3;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) setIconLabelAlpha:v14];
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8 = a5;
  BOOL v9 = [(SBIconAnimator *)self isAnimating];
  v12.receiver = self;
  v12.super_class = (Class)SBIconZoomAnimator;
  [(SBIconAnimator *)&v12 _animateToFraction:v8 afterDelay:a3 withSharedCompletion:a4];
  if (!v9) {
    self->_startTime = CACurrentMediaTime();
  }
  uint64_t v10 = [(SBIconAnimator *)self settings];
  uint64_t v11 = [v10 centralAnimationSettings];
  [(SBIconZoomAnimator *)self _performAnimationToFraction:v11 withCentralAnimationSettings:v9 delay:v8 alreadyAnimating:a3 sharedCompletion:a4];
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  id v10 = a7;
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    uint64_t v11 = [(SBIconAnimator *)self settings];
    int v12 = [v11 labelAlphaWithZoom];

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F4F898];
      double v14 = [(SBIconAnimator *)self centralAnimationFactory];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __119__SBIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
      v15[3] = &unk_1E6AAC838;
      v15[4] = self;
      *(double *)&v15[5] = a3;
      [v13 animateWithFactory:v14 additionalDelay:2 options:v15 actions:v10 completion:a5];
    }
  }
}

uint64_t __119__SBIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyLabelAlphaFraction:*(double *)(a1 + 40)];
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  id v7 = a4;
  if (-[NSSet intersectsSet:](self->_criticalIconNodeIdentifiers, "intersectsSet:"))
  {
    unint64_t v5 = (void *)[(NSSet *)self->_criticalIconNodeIdentifiers mutableCopy];
    [v5 intersectSet:v7];
    uint64_t v6 = [NSString stringWithFormat:@"Critical node identifier removed: %@", v5];
    [(SBIconZoomAnimator *)self _invalidateAnimationForSignificantIconModelChangesForReason:v6];
  }
}

- (void)_setIconListView:(id)a3
{
  unint64_t v5 = (SBIconListView *)a3;
  if (self->_iconListView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_iconListView, a3);
    unint64_t v5 = v6;
  }
}

- (void)_setDockListView:(id)a3
{
  unint64_t v5 = (SBIconListView *)a3;
  if (self->_dockListView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_dockListView, a3);
    unint64_t v5 = v6;
  }
}

- (void)_clearObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBIconModelDidLayoutIconStateNotification" object:self->_iconModel];
  [v3 removeObserver:self name:@"SBIconModelDidReloadIconsNotification" object:self->_iconModel];
  [(SBIconListModel *)self->_iconListModel removeNodeObserver:self];
}

- (void)_iconModelDidRelayout:(id)a3
{
}

- (void)_iconModelDidReload:(id)a3
{
}

- (void)_invalidateAnimationForSignificantIconModelChangesForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBIconAnimator *)self invalidated])
  {
    unint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2114;
      id v10 = v6;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "Invalidated icon zoom animation for reason: %@, stack=%{public}@", (uint8_t *)&v7, 0x16u);
    }
    [(SBIconAnimator *)self setInvalidated:1];
  }
}

- (NSSet)criticalIconNodeIdentifiers
{
  return self->_criticalIconNodeIdentifiers;
}

- (void)setCriticalIconNodeIdentifiers:(id)a3
{
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (SBIconListView)dockListView
{
  return self->_dockListView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockListView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconListModel, 0);
  objc_storeStrong((id *)&self->_criticalIconNodeIdentifiers, 0);
  objc_storeStrong((id *)&self->_dockIconToViewMap, 0);
  objc_storeStrong((id *)&self->_listIconToViewMap, 0);
}

- (void)iconViewForIcon:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Could not find icon view in visible icon list or dock!", v1, 2u);
}

@end