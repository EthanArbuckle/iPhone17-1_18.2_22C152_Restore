@interface UIPointerInteraction
- (BOOL)_pausesPointerUpdatesWhilePanning;
- (BOOL)_regionContainsCurrentHoverLocation:(id)a3;
- (BOOL)_supportsAssociation;
- (BOOL)isEnabled;
- (NSArray)drivers;
- (UIPointerInteraction)init;
- (UIPointerInteraction)initWithDelegate:(id)delegate;
- (UIPointerRegion)currentRegion;
- (UIPointerRegion)defaultRegion;
- (UIPointerRegion)mostRecentRegion;
- (UIView)view;
- (id)_notifyDelegate_willEnterRegion:(id)a3;
- (id)_notifyDelegate_willExitRegion:(id)a3;
- (id)_pointerRegionAtPoint:(CGPoint)a3 modifiers:(int64_t)a4;
- (id)_pointerStyleForRegion:(id)a3;
- (id)_targetedPreviewForContinuingEffectWithPreview:(id)a3;
- (id)delegate;
- (int64_t)currentModifiers;
- (void)_applyPointerStyle:(id)a3 forRegion:(id)a4 animator:(id)a5;
- (void)_handlePresentationNotification:(id)a3;
- (void)_modifiersDidChangeInRegion:(id)a3 update:(id *)a4;
- (void)_pointerDidEnterRegion:(id)a3 update:(id *)a4;
- (void)_pointerDidExit;
- (void)_pointerDidExitRegion:(id)a3 willEnterNewRegion:(BOOL)a4;
- (void)_queryDelegateForRegionWithRequest:(id)a3 completion:(id)a4 forceSynchronous:(BOOL)a5;
- (void)_runAlongsideAnimator:(id)a3;
- (void)_setPausesPointerUpdatesWhilePanning:(BOOL)a3;
- (void)_updateCurrentRegionIfNecessary:(id)a3 update:(id *)a4;
- (void)_updateDebugUIForRegionIfEnabled:(id)a3;
- (void)_updateInteractionIsEnabled;
- (void)_updatePointerStyleForRegion:(id)a3 update:(id *)a4 animator:(id)a5;
- (void)_viewTraitCollectionDidChange:(id)a3;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)driver:(id)a3 didIssueUpdate:(id *)a4;
- (void)driver:(id)a3 willAttachHoverGestureRecognizer:(id)a4 toView:(id)a5;
- (void)invalidate;
- (void)setCurrentModifiers:(int64_t)a3;
- (void)setCurrentRegion:(id)a3;
- (void)setDrivers:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setMostRecentRegion:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIPointerInteraction

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(UIPointerInteraction *)self view];
  v6 = [v5 traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];
  uint64_t v8 = [v4 userInterfaceIdiom];

  if (v7 != v8)
  {
    [(UIPointerInteraction *)self _updateInteractionIsEnabled];
  }
}

- (void)_updateInteractionIsEnabled
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPointerInteraction *)self view];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v3 && self->_enabled && (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = self->_drivers;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v10++) setView:v3];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = self->_drivers;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15++), "setView:", 0, (void)v17);
        }
        while (v13 != v15);
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }

    if (self->_observingPresentationNotification)
    {
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 removeObserver:self name:@"UIPresentationControllerPresentationTransitionWillBeginNotification" object:0];

      self->_observingPresentationNotification = 0;
    }
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (UIPointerInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v20.receiver = self;
  v20.super_class = (Class)UIPointerInteraction;
  uint64_t v5 = [(UIPointerInteraction *)&v20 init];
  v6 = (UIPointerInteraction *)v5;
  if (v5)
  {
    *(_WORD *)(v5 + 25) = 257;
    id v7 = objc_storeWeak((id *)v5 + 6, v4);
    v6->_observingPresentationNotification = 0;
    id v8 = v7;

    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.regionForRequest = objc_opt_respondsToSelector() & 1;

      id v10 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.styleForRegion = objc_opt_respondsToSelector() & 1;

      id v11 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.willEnterRegionAnimator = objc_opt_respondsToSelector() & 1;

      id v12 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.willExitRegionAnimator = objc_opt_respondsToSelector() & 1;

      id v13 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.asyncRegionForRequest = objc_opt_respondsToSelector() & 1;

      id v14 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.targetRegionForDeceleratingPointerWithRequests = objc_opt_respondsToSelector() & 1;
    }
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    if (_os_feature_enabled_impl())
    {
      v16 = [[_UIPointerInteractionPencilHoverDriver alloc] initWithSink:v6];
      [(NSArray *)v15 addObject:v16];
    }
    long long v17 = [[_UIPointerInteractionHoverDriver alloc] initWithSink:v6];
    [(NSArray *)v15 addObject:v17];

    drivers = v6->_drivers;
    v6->_drivers = v15;
  }
  return v6;
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  defaultRegion = self->_defaultRegion;
  if (defaultRegion)
  {
    self->_defaultRegion = 0;

    ++self->_generationID;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_drivers;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "invalidate", (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  [(UIPointerInteraction *)self _updateInteractionIsEnabled];
}

- (void)willMoveToView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_drivers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setView:", 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    [(UIPointerInteraction *)self _updateInteractionIsEnabled];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentRegion, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_drivers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultRegion, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)dealloc
{
  if (self->_observingPresentationNotification)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"UIPresentationControllerPresentationTransitionWillBeginNotification" object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)UIPointerInteraction;
  [(UIPointerInteraction *)&v4 dealloc];
}

- (UIPointerInteraction)init
{
  return [(UIPointerInteraction *)self initWithDelegate:0];
}

- (BOOL)_supportsAssociation
{
  return 1;
}

- (id)_targetedPreviewForContinuingEffectWithPreview:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIPointerInteraction *)self currentRegion];

  if (v5)
  {
    uint64_t v6 = +[_UIContentEffectManager sharedManager];
    uint64_t v7 = [(UIPointerInteraction *)self currentRegion];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    long long v9 = [v8 previewForContinuingToEffectWithPreview:v4];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (UIPointerRegion)defaultRegion
{
  defaultRegion = self->_defaultRegion;
  if (!defaultRegion)
  {
    id v4 = [(UIPointerInteraction *)self view];
    [v4 bounds];
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0);
    uint64_t v5 = (UIPointerRegion *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_defaultRegion;
    self->_defaultRegion = v5;

    defaultRegion = self->_defaultRegion;
  }
  return defaultRegion;
}

- (void)driver:(id)a3 didIssueUpdate:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double x = a4->var0.x;
  double y = a4->var0.y;
  int64_t var2 = a4->var2;
  int64_t var3 = a4->var3;
  long long v11 = objc_opt_new();
  objc_msgSend(v11, "setLocation:", x, y);
  [v11 setModifiers:var2];
  objc_msgSend(v11, "set_pointerType:", objc_msgSend(v6, "type"));
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __46__UIPointerInteraction_driver_didIssueUpdate___block_invoke;
  v33 = &unk_1E530CD00;
  id v12 = v6;
  char v41 = var3 & 1;
  id v34 = v12;
  v35 = self;
  long long v13 = *(_OWORD *)&a4->var4;
  long long v38 = *(_OWORD *)&a4->var2;
  long long v39 = v13;
  double var6 = a4->var6;
  long long v14 = *(_OWORD *)&a4->var0.z;
  long long v36 = *(_OWORD *)&a4->var0.x;
  long long v37 = v14;
  [(UIPointerInteraction *)self _queryDelegateForRegionWithRequest:v11 completion:&v30 forceSynchronous:0];
  uint64_t v15 = [(UIPointerInteraction *)self currentRegion];
  v16 = v15;
  if (v15 && ((var3 & 1) == 0 || ([v15 _isLatching] & 1) == 0))
  {
    if ([(UIPointerInteraction *)self _regionContainsCurrentHoverLocation:v16])
    {
      long long v17 = +[_UIContentEffectManager sharedManager];
      long long v18 = [(UIPointerInteraction *)self currentRegion];
      long long v19 = [v17 objectForKeyedSubscript:v18];

      [v19 setPressed:var3 != 0 animated:1];
    }
    else
    {
      objc_super v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerInteraction", &driver_didIssueUpdate____s_category) + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v16;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "auto exiting region: %@", buf, 0xCu);
      }
      [(UIPointerInteraction *)self _pointerDidExit];
    }
  }
  long long v21 = +[_UIContentEffectManager sharedManager];
  long long v22 = [(UIPointerInteraction *)self currentRegion];
  long long v23 = [v21 objectForKeyedSubscript:v22];

  if (v23)
  {
    double z = a4->var0.z;
    double var1 = a4->var1;
    if (var1 > z)
    {
      objc_msgSend(v23, "setLiftProgress:", 1.0 - fmax(fmin((z / var1 + -0.6) / 0.4, 1.0), 0.0));
      goto LABEL_20;
    }
    v26 = [v23 style];
    uint64_t v27 = [v26 pointerEffect];

    if (!v27)
    {
LABEL_19:

      goto LABEL_20;
    }
    double v28 = a4->var6;
    if (v28 <= 0.0)
    {
      if (v28 >= 0.0)
      {
LABEL_18:
        [v23 setLiftProgress:1.0 - v28];
        goto LABEL_19;
      }
      double v29 = -2.5;
    }
    else
    {
      double v29 = 2.5;
    }
    double v28 = (1.0 - 1.0 / (v28 / v29 * 0.55 + 1.0)) * v29;
    goto LABEL_18;
  }
LABEL_20:
}

void __46__UIPointerInteraction_driver_didIssueUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) allowsUpdatesWhilePrimaryButtonIsPressed]) {
    goto LABEL_6;
  }
  if (!*(unsigned char *)(a1 + 120)) {
    goto LABEL_6;
  }
  id v4 = [*(id *)(a1 + 40) currentRegion];
  char v5 = [v4 _isLatching];

  if ((v5 & 1) == 0)
  {
    if (([v3 _isLatching] & 1) != 0
      || ([*(id *)(a1 + 40) mostRecentRegion],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v3 isEqual:v6],
          v6,
          v7))
    {
LABEL_6:
      uint64_t v8 = *(void **)(a1 + 40);
      long long v9 = *(_OWORD *)(a1 + 96);
      v11[2] = *(_OWORD *)(a1 + 80);
      v11[3] = v9;
      uint64_t v12 = *(void *)(a1 + 112);
      long long v10 = *(_OWORD *)(a1 + 64);
      v11[0] = *(_OWORD *)(a1 + 48);
      v11[1] = v10;
      [v8 _updateCurrentRegionIfNecessary:v3 update:v11];
    }
  }
}

- (void)driver:(id)a3 willAttachHoverGestureRecognizer:(id)a4 toView:(id)a5
{
  id v6 = a4;
  objc_msgSend(v6, "_setPausesWhilePanning:", -[UIPointerInteraction _pausesPointerUpdatesWhilePanning](self, "_pausesPointerUpdatesWhilePanning"));
}

- (void)_pointerDidExit
{
  uint64_t v3 = 0;
  memset(v2, 0, sizeof(v2));
  [(UIPointerInteraction *)self _updateCurrentRegionIfNecessary:0 update:v2];
}

- (void)_updateCurrentRegionIfNecessary:(id)a3 update:(id *)a4
{
  id v6 = a3;
  int v7 = [(UIPointerInteraction *)self currentRegion];
  int64_t v8 = [(UIPointerInteraction *)self currentModifiers];
  int64_t var2 = a4->var2;
  id v10 = v6;
  id v11 = v7;
  uint64_t v12 = v11;
  if (v11 == v10)
  {
    int v13 = 1;
    goto LABEL_6;
  }
  if (v10 && v11)
  {
    int v13 = [v10 isEqual:v11];
LABEL_6:

    BOOL v14 = var2 == v8;
    BOOL v15 = var2 == v8;
    if (v13 && v14) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }

  LOBYTE(v13) = 0;
  BOOL v15 = var2 == v8;
LABEL_10:
  if (v12 && (v13 & 1) == 0) {
    [(UIPointerInteraction *)self _pointerDidExitRegion:v12 willEnterNewRegion:v10 != 0];
  }
  [(UIPointerInteraction *)self setCurrentRegion:v10];
  [(UIPointerInteraction *)self setCurrentModifiers:var2];
  v16 = [(UIPointerInteraction *)self currentRegion];
  if (v16)
  {
    if (v13)
    {
      if (!v15)
      {
        long long v17 = *(_OWORD *)&a4->var4;
        long long v23 = *(_OWORD *)&a4->var2;
        long long v24 = v17;
        double var6 = a4->var6;
        long long v18 = *(_OWORD *)&a4->var0.z;
        long long v21 = *(_OWORD *)&a4->var0.x;
        long long v22 = v18;
        [(UIPointerInteraction *)self _modifiersDidChangeInRegion:v16 update:&v21];
      }
    }
    else
    {
      long long v19 = *(_OWORD *)&a4->var4;
      long long v23 = *(_OWORD *)&a4->var2;
      long long v24 = v19;
      double var6 = a4->var6;
      long long v20 = *(_OWORD *)&a4->var0.z;
      long long v21 = *(_OWORD *)&a4->var0.x;
      long long v22 = v20;
      [(UIPointerInteraction *)self _pointerDidEnterRegion:v16 update:&v21];
    }
    [(UIPointerInteraction *)self setMostRecentRegion:v16];
  }

LABEL_20:
}

- (void)_pointerDidEnterRegion:(id)a3 update:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerInteraction", &_pointerDidEnterRegion_update____s_category)
                    + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v12[0]) = 138412290;
    *(void *)((char *)v12 + 4) = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Entered region: %@", (uint8_t *)v12, 0xCu);
  }
  [(UIPointerInteraction *)self _updateDebugUIForRegionIfEnabled:v6];
  int64_t v8 = [(UIPointerInteraction *)self _notifyDelegate_willEnterRegion:v6];
  long long v9 = *(_OWORD *)&a4->var4;
  v12[2] = *(_OWORD *)&a4->var2;
  v12[3] = v9;
  double var6 = a4->var6;
  long long v10 = *(_OWORD *)&a4->var0.z;
  v12[0] = *(_OWORD *)&a4->var0.x;
  v12[1] = v10;
  [(UIPointerInteraction *)self _updatePointerStyleForRegion:v6 update:v12 animator:v8];
  if (!self->_observingPresentationNotification)
  {
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:self selector:sel__handlePresentationNotification_ name:@"UIPresentationControllerPresentationTransitionWillBeginNotification" object:0];

    self->_observingPresentationNotification = 1;
  }
}

- (void)_handlePresentationNotification:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerInteraction", &_handlePresentationNotification____s_category)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating due to presentation.", v7, 2u);
    }
    [(UIPointerInteraction *)self invalidate];
  }
}

- (void)_pointerDidExitRegion:(id)a3 willEnterNewRegion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerInteraction", &_pointerDidExitRegion_willEnterNewRegion____s_category)+ 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v8 = v7;
    long long v9 = NSStringFromBOOL();
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    long long v19 = v9;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Exited region: %@, is entering new region: %@", (uint8_t *)&v16, 0x16u);
  }
  [(UIPointerInteraction *)self _updateDebugUIForRegionIfEnabled:0];
  if (self->_observingPresentationNotification)
  {
    long long v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 removeObserver:self name:@"UIPresentationControllerPresentationTransitionWillBeginNotification" object:0];

    self->_observingPresentationNotification = 0;
  }
  id v11 = [(UIPointerInteraction *)self _notifyDelegate_willExitRegion:v6];
  uint64_t v12 = +[_UIContentEffectManager sharedManager];
  int v13 = [(UIPointerInteraction *)self currentRegion];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  if (v14)
  {
    [v14 setExitAnimator:v11];
    [v14 end:v4];
  }
  else
  {
    [(UIPointerInteraction *)self _runAlongsideAnimator:v11];
    if (!v4)
    {
      BOOL v15 = +[_UIPointerArbiter sharedArbiter];
      [v15 exitRegion:v6 removeStyle:1 completion:0];
    }
  }
}

- (void)_runAlongsideAnimator:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  [v4 setDampingRatio:1.0 response:0.4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__UIPointerInteraction__runAlongsideAnimator___block_invoke;
  v8[3] = &unk_1E52D9F70;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__UIPointerInteraction__runAlongsideAnimator___block_invoke_2;
  v6[3] = &unk_1E52DA9D0;
  id v7 = v9;
  id v5 = v9;
  +[UIView _animateUsingSpringBehavior:v4 tracking:0 animations:v8 completion:v6];
}

uint64_t __46__UIPointerInteraction__runAlongsideAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAllAnimations];
}

uint64_t __46__UIPointerInteraction__runAlongsideAnimator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performAllCompletions:a2];
}

- (void)_modifiersDidChangeInRegion:(id)a3 update:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerInteraction", &_modifiersDidChangeInRegion_update____s_category)+ 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v10[0]) = 138412290;
    *(void *)((char *)v10 + 4) = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Modifiers changed in region: %@", (uint8_t *)v10, 0xCu);
  }
  long long v8 = *(_OWORD *)&a4->var4;
  v10[2] = *(_OWORD *)&a4->var2;
  v10[3] = v8;
  double var6 = a4->var6;
  long long v9 = *(_OWORD *)&a4->var0.z;
  v10[0] = *(_OWORD *)&a4->var0.x;
  v10[1] = v9;
  [(UIPointerInteraction *)self _updatePointerStyleForRegion:v6 update:v10 animator:0];
}

- (id)_notifyDelegate_willEnterRegion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [NSString stringWithFormat:@"UIPointerInteraction.entranceAnimator.%@", v4];
  [v5 setDebugName:v6];

  if (self->_delegateImplements.willEnterRegionAnimator)
  {
    id v7 = [(UIPointerInteraction *)self delegate];
    [v7 pointerInteraction:self willEnterRegion:v4 animator:v5];
  }
  return v5;
}

- (id)_notifyDelegate_willExitRegion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [NSString stringWithFormat:@"UIPointerInteraction.exitAnimator.%@", v4];
  [v5 setDebugName:v6];

  if (self->_delegateImplements.willExitRegionAnimator)
  {
    id v7 = [(UIPointerInteraction *)self delegate];
    [v7 pointerInteraction:self willExitRegion:v4 animator:v5];
  }
  return v5;
}

- (void)_updatePointerStyleForRegion:(id)a3 update:(id *)a4 animator:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  long long v9 = [(UIPointerInteraction *)self _pointerStyleForRegion:v11];
  long long v10 = v9;
  if (!a4->var5) {
    [v9 _adaptForNonSystemEffectSupportingEnvironment];
  }
  [(UIPointerInteraction *)self _applyPointerStyle:v10 forRegion:v11 animator:v8];
}

- (void)_applyPointerStyle:(id)a3 forRegion:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 type] == 1)
  {
    id v11 = +[_UIContentEffectManager sharedManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke;
    v15[3] = &unk_1E530CD28;
    id v16 = v8;
    id v17 = v9;
    uint64_t v12 = [v11 compatibleEffectForKey:v17 descriptor:v16 constructor:v15];
    [v12 setEntranceAnimator:v10];
    [v12 begin];
  }
  else
  {
    int v13 = +[_UIPointerArbiter sharedArbiter];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke_2;
    v14[3] = &unk_1E530CD50;
    v14[4] = self;
    [v13 applyStyle:v8 forRegion:v9 effectSourceHandler:v14 completion:0];

    if (v8) {
      [(UIPointerInteraction *)self _runAlongsideAnimator:v10];
    }
  }
}

_UIPointerContentEffect *__62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke(uint64_t a1)
{
  v1 = [[_UIPointerContentEffect alloc] initWithStyle:*(void *)(a1 + 32) region:*(void *)(a1 + 40)];
  return v1;
}

void __62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) view];
  id v7 = [v6 _window];

  id v8 = [v10 superview];
  if (v8 == v7)
  {
    id v9 = [v5 superview];

    if (v9 == v7) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  [v7 addSubview:v10];
  [v7 addSubview:v5];
LABEL_5:
}

- (id)_pointerRegionAtPoint:(CGPoint)a3 modifiers:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = __Block_byref_object_copy__222;
  id v16 = __Block_byref_object_dispose__222;
  id v17 = 0;
  id v8 = objc_opt_new();
  objc_msgSend(v8, "setLocation:", x, y);
  [v8 setModifiers:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__UIPointerInteraction__pointerRegionAtPoint_modifiers___block_invoke;
  v11[3] = &unk_1E530CD78;
  _OWORD v11[4] = &v12;
  [(UIPointerInteraction *)self _queryDelegateForRegionWithRequest:v8 completion:v11 forceSynchronous:1];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __56__UIPointerInteraction__pointerRegionAtPoint_modifiers___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)_regionContainsCurrentHoverLocation:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_drivers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v34 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
      if (objc_msgSend(v10, "isActive", (void)v33)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v12 = v10;

    if (!v12)
    {
      BOOL v11 = 0;
      goto LABEL_16;
    }
    int v13 = [(UIPointerInteraction *)self view];
    [(NSArray *)v12 locationInView:v13];
    double v15 = v14;
    double v17 = v16;

    __int16 v18 = [(UIPointerInteraction *)self view];
    long long v19 = [v4 referenceView];

    if (v18 != v19)
    {
      uint64_t v20 = [v4 referenceView];
      long long v21 = [v20 _window];
      long long v22 = [v21 screen];
      long long v23 = [v22 fixedCoordinateSpace];

      long long v24 = [(UIPointerInteraction *)self view];
      objc_msgSend(v24, "convertPoint:toCoordinateSpace:", v23, v15, v17);
      double v26 = v25;
      double v28 = v27;

      double v29 = [v4 referenceView];
      objc_msgSend(v29, "convertPoint:fromCoordinateSpace:", v23, v26, v28);
      double v15 = v30;
      double v17 = v31;
    }
    [v4 rect];
    v39.double x = v15;
    v39.double y = v17;
    BOOL v11 = CGRectContainsPoint(v40, v39);
  }
  else
  {
LABEL_9:
    BOOL v11 = 0;
    uint64_t v12 = v5;
  }

LABEL_16:
  return v11;
}

- (void)_queryDelegateForRegionWithRequest:(id)a3 completion:(id)a4 forceSynchronous:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke;
  aBlock[3] = &unk_1E530CDA0;
  aBlock[4] = self;
  BOOL v20 = a5;
  id v10 = v9;
  id v19 = v10;
  BOOL v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v12 = [(UIPointerInteraction *)self delegate];
  int v13 = [(UIPointerInteraction *)self defaultRegion];
  double v14 = [(UIPointerInteraction *)self view];
  [v14 bounds];
  objc_msgSend(v13, "setRect:");

  if (!v12) {
    goto LABEL_7;
  }
  if (a5 || !self->_delegateImplements.asyncRegionForRequest)
  {
    if (self->_delegateImplements.regionForRequest)
    {
      double v15 = [v12 pointerInteraction:self regionForRequest:v8 defaultRegion:v13];
      v11[2](v11, v15);

      goto LABEL_8;
    }
LABEL_7:
    v11[2](v11, v13);
    goto LABEL_8;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke_2;
  v16[3] = &unk_1E530CDC8;
  double v17 = v11;
  [v12 _pointerInteraction:self regionForRequest:v8 defaultRegion:v13 completion:v16];

LABEL_8:
}

void __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_8;
  }
  id v8 = v3;
  [v3 setGenerationID:*(void *)(*(void *)(a1 + 32) + 16)];
  id v4 = [v8 referenceView];

  if (!v4)
  {
    id v5 = [*(id *)(a1 + 32) view];
    [v8 setReferenceView:v5];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = v8;
    goto LABEL_9;
  }
  char v7 = [*(id *)(a1 + 32) _regionContainsCurrentHoverLocation:v8];
  id v6 = v8;
  if ((v7 & 1) == 0)
  {

LABEL_8:
    id v6 = 0;
  }
LABEL_9:
  id v9 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_pointerStyleForRegion:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIPointerInteraction *)self delegate];
  id v6 = v5;
  if (v5)
  {
    if (self->_delegateImplements.styleForRegion)
    {
      char v7 = [v5 pointerInteraction:self styleForRegion:v4];
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v8 = [(UIPointerInteraction *)self view];
  id v9 = [v8 _window];

  if (v9)
  {
    id v10 = [UITargetedPreview alloc];
    BOOL v11 = [(UIPointerInteraction *)self view];
    uint64_t v12 = [(UITargetedPreview *)v10 initWithView:v11];

    int v13 = +[UIPointerEffect effectWithPreview:v12];
    char v7 = +[UIPointerStyle styleWithEffect:v13 shape:0];

    goto LABEL_18;
  }
  if (os_variant_has_internal_diagnostics())
  {
    double v14 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    if (self)
    {
      double v29 = NSString;
      double v30 = self;
      double v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      double v28 = [v29 stringWithFormat:@"<%@: %p>", v32, v30];
    }
    else
    {
      double v28 = @"(nil)";
    }
    BOOL v20 = v28;
    long long v21 = [(UIPointerInteraction *)self view];
    if (v21)
    {
      long long v33 = NSString;
      long long v34 = (objc_class *)objc_opt_class();
      long long v35 = NSStringFromClass(v34);
      double v25 = [v33 stringWithFormat:@"<%@: %p>", v35, v21];
    }
    else
    {
      double v25 = @"(nil)";
    }
    *(_DWORD *)buf = 138412802;
    id v37 = v4;
    __int16 v38 = 2112;
    CGPoint v39 = v20;
    __int16 v40 = 2112;
    char v41 = v25;
    _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Unable to create default pointer style for region %@ provided to %@ attached to %@ since its view is not in a window. This most likely means the view (or an ancestor) was removed from the view hierarchy after receiving the pointer region.", buf, 0x20u);
    goto LABEL_15;
  }
  double v14 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_pointerStyleForRegion____s_category) + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if (self)
    {
      double v15 = NSString;
      double v16 = self;
      double v17 = (objc_class *)objc_opt_class();
      __int16 v18 = NSStringFromClass(v17);
      id v19 = [v15 stringWithFormat:@"<%@: %p>", v18, v16];
    }
    else
    {
      id v19 = @"(nil)";
    }
    BOOL v20 = v19;
    long long v21 = [(UIPointerInteraction *)self view];
    if (v21)
    {
      long long v22 = NSString;
      long long v23 = (objc_class *)objc_opt_class();
      long long v24 = NSStringFromClass(v23);
      double v25 = [v22 stringWithFormat:@"<%@: %p>", v24, v21];
    }
    else
    {
      double v25 = @"(nil)";
    }
    *(_DWORD *)buf = 138412802;
    id v37 = v4;
    __int16 v38 = 2112;
    CGPoint v39 = v20;
    __int16 v40 = 2112;
    char v41 = v25;
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Unable to create default pointer style for region %@ provided to %@ attached to %@ since its view is not in a window. This most likely means the view (or an ancestor) was removed from the view hierarchy after receiving the pointer region.", buf, 0x20u);
LABEL_15:
  }
LABEL_16:

LABEL_17:
  char v7 = 0;
LABEL_18:
  double v26 = (void *)[v7 copy];

  return v26;
}

- (void)_updateDebugUIForRegionIfEnabled:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3
    && (+[_UIPointerSettingsDomain rootSettings],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 showRegions],
        v4,
        v5))
  {
    if (!_updateDebugUIForRegionIfEnabled____regionDebugView)
    {
      uint64_t v6 = objc_opt_new();
      char v7 = (void *)_updateDebugUIForRegionIfEnabled____regionDebugView;
      _updateDebugUIForRegionIfEnabled____regionDebugView = v6;

      id v8 = [(id)_updateDebugUIForRegionIfEnabled____regionDebugView layer];
      [v8 setBorderWidth:1.0];

      id v9 = +[UIColor magentaColor];
      id v10 = [v9 colorWithAlphaComponent:0.75];
      uint64_t v11 = [v10 CGColor];
      uint64_t v12 = [(id)_updateDebugUIForRegionIfEnabled____regionDebugView layer];
      [v12 setBorderColor:v11];

      [(id)_updateDebugUIForRegionIfEnabled____regionDebugView setUserInteractionEnabled:0];
    }
    int v13 = [v3 referenceView];
    double v14 = [v13 window];

    double v15 = [v3 referenceView];
    [v3 rect];
    objc_msgSend(v15, "convertRect:toView:", v14);
    objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "setFrame:");

    double v16 = [(id)_updateDebugUIForRegionIfEnabled____regionDebugView layer];
    [v16 setZPosition:100000.0];

    [v14 addSubview:_updateDebugUIForRegionIfEnabled____regionDebugView];
    double v17 = objc_opt_new();
    __int16 v18 = [v3 referenceView];
    id v19 = [v18 layer];
    [v17 setSourceLayer:v19];

    [v17 setDuration:INFINITY];
    BOOL v20 = (void *)MEMORY[0x1E4F29238];
    [v3 rect];
    double v25 = objc_msgSend(v20, "valueWithCGPoint:", v22 + v21 * 0.5, v24 + v23 * 0.5);
    v29[0] = v25;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [v17 setSourcePoints:v26];

    double v27 = [(id)_updateDebugUIForRegionIfEnabled____regionDebugView layer];
    [v27 removeAnimationForKey:@"PointerInteractionDebugViewMatchMove"];

    double v28 = [(id)_updateDebugUIForRegionIfEnabled____regionDebugView layer];
    [v28 addAnimation:v17 forKey:@"PointerInteractionDebugViewMatchMove"];
  }
  else
  {
    [(id)_updateDebugUIForRegionIfEnabled____regionDebugView removeFromSuperview];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (NSArray)drivers
{
  return self->_drivers;
}

- (void)setDrivers:(id)a3
{
}

- (UIPointerRegion)currentRegion
{
  return self->_currentRegion;
}

- (void)setCurrentRegion:(id)a3
{
}

- (UIPointerRegion)mostRecentRegion
{
  return self->_mostRecentRegion;
}

- (void)setMostRecentRegion:(id)a3
{
}

- (int64_t)currentModifiers
{
  return self->_currentModifiers;
}

- (void)setCurrentModifiers:(int64_t)a3
{
  self->_currentModifiers = a3;
}

- (BOOL)_pausesPointerUpdatesWhilePanning
{
  return self->_pausesPointerUpdatesWhilePanning;
}

- (void)_setPausesPointerUpdatesWhilePanning:(BOOL)a3
{
  self->_pausesPointerUpdatesWhilePanning = a3;
}

@end