@interface _UIVisualEffectHost
- (BOOL)contentViewRequired;
- (NSArray)views;
- (NSString)description;
- (_UIVisualEffectBackdropView)captureView;
- (_UIVisualEffectDescriptor)currentEffectDescriptor;
- (_UIVisualEffectDescriptor)transitionEffectDescriptor;
- (_UIVisualEffectHost)initWithContentView:(id)a3;
- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup;
- (_UIVisualEffectViewParticipating)contentView;
- (id)_cloneFilters:(id)a3;
- (id)_viewForEntry:(id)a3 fromCapturePool:(id)a4 imagePool:(id)a5 otherPool:(id)a6;
- (void)_applyEffectDescriptor:(id)a3;
- (void)_applyIdentityDescriptorEffectInvertingView:(id)a3;
- (void)_applyRequestedDescriptorEffectInvertingView:(id)a3;
- (void)_configureEffectDescriptor:(id)a3;
- (void)_evaluateInPlaceFiltering;
- (void)_iterateViews:(id)a3;
- (void)_updateAdjustTintColors;
- (void)_updateView:(id)a3 shouldDrawWithTintColor:(BOOL)a4;
- (void)_view:(id)a3 willGainDescendent:(id)a4;
- (void)_view:(id)a3 willLoseDescendent:(id)a4;
- (void)_view:(id)a3 willMoveToWindow:(id)a4;
- (void)beginTransition;
- (void)endTransition;
- (void)monitorSubviewsOf:(id)a3;
- (void)prepareToTransitionToEffectDescriptor:(id)a3;
- (void)setCaptureView:(id)a3;
- (void)setContentViewRequired:(BOOL)a3;
- (void)setCurrentEffectDescriptor:(id)a3;
- (void)setPrimaryCaptureGroup:(id)a3;
- (void)willGainDescendent:(id)a3;
- (void)willLoseDescendent:(id)a3;
@end

@implementation _UIVisualEffectHost

- (void)_updateView:(id)a3 shouldDrawWithTintColor:(BOOL)a4
{
  id v5 = a3;
  v6 = [_UIViewBlockVisitor alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___UIVisualEffectHost__updateView_shouldDrawWithTintColor___block_invoke;
  v8[3] = &__block_descriptor_33_e16_B16__0__UIView_8l;
  BOOL v9 = a4;
  v7 = [(_UIViewBlockVisitor *)v6 initWithTraversalDirection:2 visitorBlock:v8];
  [v5 _receiveVisitor:v7];
}

- (void)_view:(id)a3 willMoveToWindow:(id)a4
{
  id v7 = a3;
  if (a4) {
    BOOL v6 = [(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor textShouldRenderWithTintColor];
  }
  else {
    BOOL v6 = 0;
  }
  [(_UIVisualEffectHost *)self _updateView:v7 shouldDrawWithTintColor:v6];
}

- (void)_updateAdjustTintColors
{
  BOOL v3 = [(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor textShouldRenderWithTintColor];
  BOOL v4 = v3;
  if (v3 == !self->_autosetSubviewLabelTintColor)
  {
    uint64_t v5 = !self->_autosetSubviewLabelTintColor || v3;
    [(_UIVisualEffectHost *)self _updateView:self->_contentView shouldDrawWithTintColor:v5];
  }
  self->_autosetSubviewLabelTintColor = v4;
  contentView = self->_contentView;
  [(_UIVisualEffectViewParticipating *)contentView _setMonitorsSubtree:v4];
}

- (_UIVisualEffectViewParticipating)contentView
{
  return self->_contentView;
}

- (void)setContentViewRequired:(BOOL)a3
{
  if (a3 && !self->_contentViewRequired)
  {
    uint64_t v5 = [(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor _requestedContainerView];

    if (v5)
    {
      contentView = self->_contentView;
      id v7 = [(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor _requestedContainerView];
      [v7 setContainedView:contentView];
    }
    else if (([(NSMutableArray *)self->_views containsObject:self->_contentView] & 1) == 0)
    {
      v8 = [(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor underlays];
      unint64_t v9 = [v8 count];

      unint64_t v10 = [(NSMutableArray *)self->_views count];
      views = self->_views;
      v12 = self->_contentView;
      if (v9 <= v10) {
        [(NSMutableArray *)views insertObject:v12 atIndex:v9];
      }
      else {
        [(NSMutableArray *)views addObject:v12];
      }
    }
  }
  self->_contentViewRequired = a3;
}

- (NSArray)views
{
  return &self->_views->super;
}

- (_UIVisualEffectDescriptor)currentEffectDescriptor
{
  return self->_currentEffectDescriptor;
}

- (_UIVisualEffectHost)initWithContentView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIVisualEffectHost.m" lineNumber:27 description:@"Cannot construct a content host with a nil content view"];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIVisualEffectHost;
  id v7 = [(_UIVisualEffectHost *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentView, a3);
    uint64_t v9 = objc_opt_new();
    views = v8->_views;
    v8->_views = (NSMutableArray *)v9;
  }
  return v8;
}

- (void)setPrimaryCaptureGroup:(id)a3
{
  uint64_t v5 = (_UIVisualEffectViewBackdropCaptureGroup *)a3;
  if (self->_primaryCaptureGroup != v5)
  {
    objc_storeStrong((id *)&self->_primaryCaptureGroup, a3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46___UIVisualEffectHost_setPrimaryCaptureGroup___block_invoke;
    v8[3] = &unk_1E52DD6F8;
    void v8[4] = self;
    [(_UIVisualEffectHost *)self _iterateViews:v8];
    primaryCaptureGroup = self->_primaryCaptureGroup;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
    [WeakRetained setCaptureGroup:primaryCaptureGroup];
  }
}

- (void)_applyRequestedDescriptorEffectInvertingView:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least()) {
    [(_UIVisualEffectViewParticipating *)self->_contentView setClipsToBounds:[(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor contentViewRequiresClipping]];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  [WeakRetained applyRequestedFilterEffects];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68___UIVisualEffectHost__applyRequestedDescriptorEffectInvertingView___block_invoke;
  v7[3] = &unk_1E52DD6F8;
  id v8 = v4;
  id v6 = v4;
  [(_UIVisualEffectHost *)self _iterateViews:v7];
  [(_UIVisualEffectHost *)self _evaluateInPlaceFiltering];
}

- (void)_iterateViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, id))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_views copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        do
        {
          v4[2](v4, v10);
          uint64_t v11 = [v10 containedView];

          id v10 = (id)v11;
        }
        while (v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_evaluateInPlaceFiltering
{
  BOOL v3 = [(_UIVisualEffectViewParticipating *)self->_contentView layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v10 = v4;

  uint64_t v5 = v10;
  if (v10)
  {
    primaryCaptureGroup = self->_primaryCaptureGroup;
    if (primaryCaptureGroup) {
      unsigned int v7 = [(_UIVisualEffectViewBackdropCaptureGroup *)primaryCaptureGroup allowInPlaceFiltering];
    }
    else {
      unsigned int v7 = 1;
    }
    transitionEffectDescriptor = self->_transitionEffectDescriptor;
    if (!transitionEffectDescriptor) {
      transitionEffectDescriptor = self->_currentEffectDescriptor;
    }
    if (transitionEffectDescriptor) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7;
    }
    if (transitionEffectDescriptor && ((v7 ^ 1) & 1) == 0) {
      uint64_t v9 = [(_UIVisualEffectDescriptor *)transitionEffectDescriptor disableInPlaceFiltering] ^ 1;
    }
    [v10 setAllowsInPlaceFiltering:v9];
    uint64_t v5 = v10;
  }
}

- (void)setCurrentEffectDescriptor:(id)a3
{
  uint64_t v5 = (_UIVisualEffectDescriptor *)a3;
  if (self->_currentEffectDescriptor != v5)
  {
    uint64_t v8 = v5;
    [(_UIVisualEffectDescriptor *)v5 uniqueFilterNames];
    transitionEffectDescriptor = self->_transitionEffectDescriptor;
    self->_transitionEffectDescriptor = 0;

    objc_storeStrong((id *)&self->_currentEffectDescriptor, a3);
    [(_UIVisualEffectHost *)self _updateAdjustTintColors];
    [(_UIVisualEffectHost *)self _configureEffectDescriptor:self->_currentEffectDescriptor];
    unsigned int v7 = [(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor _identityContainerView];
    [(_UIVisualEffectHost *)self _applyRequestedDescriptorEffectInvertingView:v7];

    uint64_t v5 = v8;
  }
}

- (void)_configureEffectDescriptor:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v7 = [MEMORY[0x1E4F1CA48] array];
  v52 = [v4 _identityContainerView];
  v50 = v4;
  v51 = [v4 _requestedContainerView];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v8 = self->_views;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v62;
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(_UIVisualEffectViewParticipating **)(*((void *)&v61 + 1) + 8 * i);
        if (v14 != self->_contentView && v14 != v52 && v14 != v51)
        {
          [*(id *)(*((void *)&v61 + 1) + 8 * i) setFilters:v12];
          [(_UIVisualEffectViewParticipating *)v14 setViewEffects:v12];
          [(_UIVisualEffectViewParticipating *)v14 setContainedView:0];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v18 = v5;
          if ((isKindOfClass & 1) != 0
            || (objc_opt_class(), char v19 = objc_opt_isKindOfClass(), v18 = v6, (v19 & 1) != 0)
            || (int v20 = [(_UIVisualEffectViewParticipating *)v14 isMemberOfClass:objc_opt_class()],
                v18 = v7,
                v20))
          {
            [v18 addObject:v14];
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_views removeAllObjects];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v21 = [v50 underlays];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v58 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        v27 = [(_UIVisualEffectHost *)self _viewForEntry:v26 fromCapturePool:v5 imagePool:v6 otherPool:v7];
        [v27 setPrimaryCaptureGroup:self->_primaryCaptureGroup];
        uint64_t v67 = v26;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
        [v27 setViewEffects:v28];

        [(NSMutableArray *)self->_views addObject:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v23);
  }

  v29 = [v50 filterEntries];
  v30 = [v50 viewEffects];
  v48 = v30;
  if ([v29 count] || objc_msgSend(v30, "count") || v51 || v52)
  {
    [(_UIVisualEffectViewParticipating *)self->_contentView setFilters:v29];
    [(_UIVisualEffectViewParticipating *)self->_contentView setViewEffects:v30];
    v31 = self->_contentView;
    if (v51)
    {
      [(_UIVisualEffectViewParticipating *)v51 setContainedView:v31];
      v32 = v51;

      v31 = v32;
    }
    if (v52 && v52 != v51)
    {
      [(_UIVisualEffectViewParticipating *)v52 setContainedView:v31];
      v33 = v52;

      v31 = v33;
LABEL_38:
      [(NSMutableArray *)self->_views addObject:v31];
      goto LABEL_39;
    }
LABEL_37:
    if (!v31) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (self->_contentViewRequired)
  {
    uint64_t v34 = MEMORY[0x1E4F1CBF0];
    [(_UIVisualEffectViewParticipating *)self->_contentView setFilters:MEMORY[0x1E4F1CBF0]];
    [(_UIVisualEffectViewParticipating *)self->_contentView setViewEffects:v34];
    v31 = self->_contentView;
    goto LABEL_37;
  }
  v31 = 0;
LABEL_39:
  v47 = v31;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  v36 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCaptureGroup:self->_primaryCaptureGroup];
    v37 = [(_UIVisualEffectHost *)self _cloneFilters:v29];
    [v36 setFilters:v37];
  }
  v46 = v36;
  v49 = v29;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v38 = [v50 overlays];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v53 + 1) + 8 * k);
        v44 = [(_UIVisualEffectHost *)self _viewForEntry:v43 fromCapturePool:v5 imagePool:v6 otherPool:v7];
        [v44 setPrimaryCaptureGroup:self->_primaryCaptureGroup];
        uint64_t v65 = v43;
        v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
        [v44 setViewEffects:v45];

        [(NSMutableArray *)self->_views addObject:v44];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v40);
  }
}

- (void)monitorSubviewsOf:(id)a3
{
}

- (_UIVisualEffectBackdropView)captureView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  return (_UIVisualEffectBackdropView *)WeakRetained;
}

- (void)setCaptureView:(id)a3
{
  obuint64_t j = a3;
  p_captureView = &self->_captureView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
    {
      [WeakRetained removeFromCurrentCaptureGroup];
      [WeakRetained setFilters:MEMORY[0x1E4F1CBF0]];
      [WeakRetained setRenderMode:2];
    }
    [obj setRenderMode:1];
    [obj setCaptureGroup:self->_primaryCaptureGroup];
    uint64_t v6 = [(_UIVisualEffectDescriptor *)self->_currentEffectDescriptor filterEntries];
    unsigned int v7 = [(_UIVisualEffectHost *)self _cloneFilters:v6];
    [obj setFilters:v7];

    [obj applyRequestedFilterEffects];
    objc_storeWeak((id *)p_captureView, obj);
  }
}

- (id)_cloneFilters:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "copy", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (_UIVisualEffectDescriptor)transitionEffectDescriptor
{
  return self->_transitionEffectDescriptor;
}

- (void)endTransition
{
  transitionEffectDescriptor = self->_transitionEffectDescriptor;
  if (transitionEffectDescriptor)
  {
    self->_transitionEffectDescriptor = 0;

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36___UIVisualEffectHost_endTransition__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView performWithoutAnimation:v4];
  }
}

- (void)prepareToTransitionToEffectDescriptor:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v5 = (_UIVisualEffectDescriptor *)a3;
  uint64_t v6 = v5;
  p_currentEffectDescriptor = &self->_currentEffectDescriptor;
  if (self->_currentEffectDescriptor != v5)
  {
    [(_UIVisualEffectDescriptor *)v5 uniqueFilterNames];
    if (*p_currentEffectDescriptor)
    {
      v12[0] = *p_currentEffectDescriptor;
      v12[1] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
      uint64_t v9 = +[_UIVisualEffectDescriptor newTransitionDescriptorForStops:v8];
      transitionEffectDescriptor = self->_transitionEffectDescriptor;
      self->_transitionEffectDescriptor = v9;
    }
    else
    {
      objc_storeStrong((id *)&self->_transitionEffectDescriptor, a3);
    }
    [(_UIVisualEffectDescriptor *)self->_transitionEffectDescriptor uniqueFilterNames];
    objc_storeStrong((id *)&self->_currentEffectDescriptor, a3);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61___UIVisualEffectHost_prepareToTransitionToEffectDescriptor___block_invoke;
    v11[3] = &unk_1E52D9F70;
    v11[4] = self;
    +[UIView performWithoutAnimation:v11];
  }
}

- (void)beginTransition
{
  transitionEffectDescriptor = self->_transitionEffectDescriptor;
  if (transitionEffectDescriptor)
  {
    id v4 = [(_UIVisualEffectDescriptor *)transitionEffectDescriptor _identityContainerView];
    [(_UIVisualEffectHost *)self _applyRequestedDescriptorEffectInvertingView:v4];
  }
}

- (id)_viewForEntry:(id)a3 fromCapturePool:(id)a4 imagePool:(id)a5 otherPool:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v11 requirements];
  switch(v15)
  {
    case 0:
      v16 = v14;
      goto LABEL_7;
    case 1:
      v16 = v13;
      goto LABEL_7;
    case 2:
      v16 = v12;
LABEL_7:
      id v17 = v16;
      v18 = (objc_class *)objc_opt_class();
      goto LABEL_9;
  }
  id v17 = 0;
  v18 = 0;
LABEL_9:
  uint64_t v19 = [v17 firstObject];
  if (v19)
  {
    id v20 = (id)v19;
    [v17 removeObjectAtIndex:0];
  }
  else if (!v18 || (id v20 = objc_alloc_init(v18)) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = NSStringFromClass(v18);
    [v21 handleFailureInMethod:a2, self, @"_UIVisualEffectHost.m", 216, @"Unable to allocate a view necessary for implementing the requested effect (viewClass=%@, entry=%@)", v22, v11 object file lineNumber description];

    id v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionEffectDescriptor, 0);
  objc_storeStrong((id *)&self->_currentEffectDescriptor, 0);
  objc_destroyWeak((id *)&self->_captureView);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_views, 0);
}

- (void)_applyIdentityDescriptorEffectInvertingView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);
  [WeakRetained applyIdentityFilterEffects];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67___UIVisualEffectHost__applyIdentityDescriptorEffectInvertingView___block_invoke;
  v7[3] = &unk_1E52DD6F8;
  id v8 = v4;
  id v6 = v4;
  [(_UIVisualEffectHost *)self _iterateViews:v7];
  [(_UIVisualEffectHost *)self _evaluateInPlaceFiltering];
}

- (void)_applyEffectDescriptor:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = [v4 underlays];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v12 = [(NSMutableArray *)self->_views objectAtIndexedSubscript:v8 + i];
        [v11 applyEffectAsRequested:1 toView:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v62 count:16];
      v8 += i;
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v13 = [v4 viewEffects];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        uint64_t v19 = [(NSMutableArray *)self->_views objectAtIndexedSubscript:v8];
        [v18 applyEffectAsRequested:1 toView:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v15);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v38 = v4;
  obuint64_t j = [v4 filterEntries];
  uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v41)
  {
    uint64_t v42 = 0;
    uint64_t v40 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v48 != v40) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v47 + 1) + 8 * k);
        uint64_t v22 = NSString;
        uint64_t v23 = [(NSMutableArray *)self->_views objectAtIndexedSubscript:v8];
        uint64_t v24 = [v23 filters];
        v25 = [v24 objectAtIndexedSubscript:v42 + k];
        uint64_t v26 = [v25 filterName];
        v27 = [v22 stringWithFormat:@"filters.%@.", v26];

        v28 = [(NSMutableArray *)self->_views objectAtIndexedSubscript:v8];
        v29 = [v28 layer];
        v30 = [v21 valueAsRequested:1];
        _UIVisualEffectSubviewApplyFilterValues(v29, v30, v27);
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
      v42 += k;
    }
    while (v41);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v31 = [v38 overlays];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v43 + 1) + 8 * m);
        v37 = [(NSMutableArray *)self->_views objectAtIndexedSubscript:v8 + m + 1];
        [v36 applyEffectAsRequested:1 toView:v37];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v43 objects:v59 count:16];
      v8 += m;
    }
    while (v33);
  }
}

- (void)_view:(id)a3 willGainDescendent:(id)a4
{
}

- (void)_view:(id)a3 willLoseDescendent:(id)a4
{
}

- (void)willGainDescendent:(id)a3
{
  currentEffectDescriptor = self->_currentEffectDescriptor;
  id v5 = a3;
  [(_UIVisualEffectHost *)self _updateView:v5 shouldDrawWithTintColor:[(_UIVisualEffectDescriptor *)currentEffectDescriptor textShouldRenderWithTintColor]];
}

- (void)willLoseDescendent:(id)a3
{
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectHost;
  id v3 = [(_UIVisualEffectHost *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@" contentView=%@", self->_contentView];
  if (self->_contentViewRequired) {
    [v4 appendString:@" contentViewRequired"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureView);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_captureView);
    [v4 appendFormat:@" captureView=%@", v6];
  }
  [v4 appendFormat:@" views=%@", self->_views];
  if (self->_transitionEffectDescriptor) {
    [v4 appendFormat:@" transitionEffect=%@", self->_transitionEffectDescriptor];
  }
  [v4 appendFormat:@" currentEffectDescriptor=%@", self->_currentEffectDescriptor];
  return (NSString *)v4;
}

- (BOOL)contentViewRequired
{
  return self->_contentViewRequired;
}

- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup
{
  return self->_primaryCaptureGroup;
}

@end