@interface UIVisualEffectBackingHost
- (BOOL)_hasDeferredAnimations;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (NSArray)backgroundEffects;
- (NSArray)contentEffects;
- (NSArray)visualEffectSubviews;
- (NSString)_captureGroupName;
- (UIView)view;
- (UIVisualEffect)visualEffect;
- (_UIVisualEffectEnvironment)environment;
- (_UIVisualEffectHost)backgroundHost;
- (_UIVisualEffectHost)contentHost;
- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup;
- (id)_effectDescriptorForEffects:(id)a3 usage:(int64_t)a4;
- (id)_initialValueForKey:(id)a3;
- (id)_mergedTraitCollection;
- (id)initForView:(id)a3;
- (int64_t)reentrantCount;
- (void)_configureEffects;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_ensureBackgroundHost;
- (void)_ensureContentHost;
- (void)_generateBackgroundEffects:(id)a3 contentEffects:(id)a4;
- (void)_generateDeferredAnimations:(id)a3;
- (void)_registerNotifications;
- (void)_setCaptureGroupName:(id)a3;
- (void)_unregisterNotifications;
- (void)_updateContentViewVibrancyTraitOverride:(id)a3;
- (void)_updateEffectForAccessibilityChanges:(id)a3;
- (void)_updateEnvironmentAndFlagUpdatesIfNecessary:(id)a3;
- (void)_updateSubviews;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)invalidateCaptureGroupName;
- (void)setBackgroundEffects:(id)a3;
- (void)setBackgroundHost:(id)a3;
- (void)setCaptureGroup:(id)a3;
- (void)setContentEffects:(id)a3;
- (void)setContentHost:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setReentrantCount:(int64_t)a3;
- (void)setView:(id)a3;
- (void)setVisualEffect:(id)a3;
- (void)setVisualEffectSubviews:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willGainDescendent:(id)a3;
- (void)willLoseDescendent:(id)a3;
@end

@implementation UIVisualEffectBackingHost

- (id)initForView:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIVisualEffectBackingHost;
  v5 = [(UIVisualEffectBackingHost *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v7 = [[_UIVisualEffectEnvironment alloc] initWithHost:v6];
    environment = v6->_environment;
    v6->_environment = v7;

    [(_UIVisualEffectEnvironment *)v6->_environment setBlurQuality:0];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_view);
    v10 = [WeakRetained traitCollection];
    BOOL v11 = [v10 userInterfaceIdiom] != 3 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    [(_UIVisualEffectEnvironment *)v6->_environment setReducedTransperancy:v11];

    v12 = objc_alloc_init(_UIVisualEffectViewBackdropCaptureGroup);
    captureGroup = v6->_captureGroup;
    v6->_captureGroup = v12;

    contentEffects = v6->_contentEffects;
    v15 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v6->_contentEffects = (NSArray *)MEMORY[0x1E4F1CBF0];

    backgroundEffects = v6->_backgroundEffects;
    v6->_backgroundEffects = v15;

    [(UIVisualEffectBackingHost *)v6 _registerNotifications];
    [(UIVisualEffectBackingHost *)v6 invalidateCaptureGroupName];
  }

  return v6;
}

- (void)invalidateCaptureGroupName
{
  if (self->_captureGroupName)
  {
    captureGroup = self->_captureGroup;
    -[_UIVisualEffectViewBackdropCaptureGroup setGroupName:](captureGroup, "setGroupName:");
  }
  else
  {
    id v4 = NSString;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v5 = objc_msgSend(v4, "stringWithFormat:", @"%p", WeakRetained);
    [(_UIVisualEffectViewBackdropCaptureGroup *)self->_captureGroup setGroupName:v5];
  }
}

- (void)_setCaptureGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_captureGroupName, a3);
  [(UIVisualEffectBackingHost *)self invalidateCaptureGroupName];
}

- (void)setBackgroundEffects:(id)a3
{
  id v4 = a3;
  v5 = self->_backgroundEffects;
  v6 = (NSArray *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    v9 = v13;
LABEL_11:

    v8 = v13;
    goto LABEL_12;
  }
  if (!v6 || !v5)
  {

LABEL_8:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v9 = [WeakRetained _deferredAnimationForKey:@"backgroundEffects"];

    BOOL v11 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v13 copyItems:1];
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v11;

    if (v9)
    {
      [v9 addAnimationFrameForValue:self->_backgroundEffects];
    }
    else
    {
      *(unsigned char *)&self->_flags |= 1u;
      [(UIVisualEffectBackingHost *)self _configureEffects];
    }
    goto LABEL_11;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  v8 = v13;
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_12:
}

- (void)setVisualEffect:(id)a3
{
  id v4 = (UIVisualEffect *)[a3 copy];
  visualEffect = self->_visualEffect;
  self->_visualEffect = v4;

  v6 = 0;
  char v7 = 0;
  _UIVisualEffectViewUpgradeLegacyEffect(self->_visualEffect, &v7, &v6);
  [(UIVisualEffectBackingHost *)self setContentEffects:v6];
  [(UIVisualEffectBackingHost *)self setBackgroundEffects:v7];
}

- (void)setContentEffects:(id)a3
{
  id v4 = a3;
  v5 = self->_contentEffects;
  v6 = (NSArray *)v4;
  v13 = v6;
  if (v5 == v6)
  {

    v9 = v13;
LABEL_11:

    v8 = v13;
    goto LABEL_12;
  }
  if (!v6 || !v5)
  {

LABEL_8:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v9 = [WeakRetained _deferredAnimationForKey:@"contentEffects"];

    BOOL v11 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v13 copyItems:1];
    contentEffects = self->_contentEffects;
    self->_contentEffects = v11;

    if (v9)
    {
      [v9 addAnimationFrameForValue:self->_contentEffects];
    }
    else
    {
      *(unsigned char *)&self->_flags |= 2u;
      [(UIVisualEffectBackingHost *)self _configureEffects];
    }
    goto LABEL_11;
  }
  char v7 = [(NSArray *)v5 isEqual:v6];

  v8 = v13;
  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_12:
}

- (BOOL)_hasDeferredAnimations
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (-[UIView _hasDeferredAnimationForKey:]((uint64_t)WeakRetained, @"contentEffects"))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_view);
    char v4 = -[UIView _hasDeferredAnimationForKey:]((uint64_t)v5, @"backgroundEffects");
  }
  return v4;
}

- (void)_updateEnvironmentAndFlagUpdatesIfNecessary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(void))a3;
  id v5 = (void *)[(_UIVisualEffectEnvironment *)self->_environment copy];
  v4[2](v4);
  $AE0800C6C1830CBF550A377BF4428CA5 flags = self->_flags;
  if ((~*(_DWORD *)&flags & 3) != 0)
  {
    v8 = [(_UIVisualEffectEnvironment *)self->_environment traitCollection];
    v9 = [v5 traitCollection];
    char v7 = [v8 changedTraitsFromTraitCollection:v9];

    *(unsigned char *)&$AE0800C6C1830CBF550A377BF4428CA5 flags = self->_flags;
    if (*(unsigned char *)&flags) {
      goto LABEL_16;
    }
  }
  else
  {
    char v7 = 0;
    if (*(unsigned char *)&flags) {
      goto LABEL_16;
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_backgroundEffects;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v24 + 1) + 8 * i) _needsUpdateForTransitionFromEnvironment:v5 toEnvironment:self->_environment changedTraits:v7 usage:1])
        {
          *(unsigned char *)&self->_flags |= 1u;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  *(unsigned char *)&$AE0800C6C1830CBF550A377BF4428CA5 flags = self->_flags;
LABEL_16:
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = self->_contentEffects;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      while (2)
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "_needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:", v5, self->_environment, v7, 2, (void)v20))
          {
            *(unsigned char *)&self->_flags |= 2u;
            goto LABEL_27;
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_27:
  }
}

- (void)_registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateEffectForAccessibilityChanges_ name:@"UIAccessibilityReduceTransparencyStatusDidChangeNotification" object:0];
}

- (void)_unregisterNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityReduceTransparencyStatusDidChangeNotification" object:0];
}

- (void)_updateEffectForAccessibilityChanges:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__UIVisualEffectBackingHost__updateEffectForAccessibilityChanges___block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(UIVisualEffectBackingHost *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v4];
  [(UIVisualEffectBackingHost *)self _configureEffects];
}

uint64_t __66__UIVisualEffectBackingHost__updateEffectForAccessibilityChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  id v3 = [WeakRetained traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] != 3 && _AXSEnhanceBackgroundContrastEnabled() != 0;
  [*(id *)(*(void *)(a1 + 32) + 64) setReducedTransperancy:v4];

  BOOL v5 = _AXSReduceMotionEnabled() != 0;
  v6 = *(void **)(*(void *)(a1 + 32) + 64);
  return [v6 setReducedMotion:v5];
}

- (void)didMoveToSuperview
{
  [(UIVisualEffectBackingHost *)self invalidateCaptureGroupName];
  [(UIVisualEffectBackingHost *)self _configureEffects];
}

- (void)traitCollectionDidChange:(id)a3
{
  BOOL v4 = [(_UIVisualEffectEnvironment *)self->_environment traitCollection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__UIVisualEffectBackingHost_traitCollectionDidChange___block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  [(UIVisualEffectBackingHost *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v5];
  [(UIVisualEffectBackingHost *)self _configureEffects];
}

void __54__UIVisualEffectBackingHost_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _mergedTraitCollection];
  [*(id *)(*(void *)(a1 + 32) + 64) setTraitCollection:v2];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  id v3 = [WeakRetained traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] != 3 && _AXSEnhanceBackgroundContrastEnabled() != 0;
  [*(id *)(*(void *)(a1 + 32) + 64) setReducedTransperancy:v4];
}

- (id)_mergedTraitCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v3 = [WeakRetained traitCollection];

  return v3;
}

- (void)_generateDeferredAnimations:(id)a3
{
  environment = self->_environment;
  id v6 = a3;
  char v7 = [(_UIVisualEffectEnvironment *)environment traitCollection];

  if (!v7)
  {
    v8 = [(UIVisualEffectBackingHost *)self _mergedTraitCollection];
    [(_UIVisualEffectEnvironment *)self->_environment setTraitCollection:v8];
  }
  id v15 = [v6 objectForKeyedSubscript:@"backgroundEffects"];
  v9 = [v6 objectForKeyedSubscript:@"contentEffects"];
  v10 = [v6 objectForKeyedSubscript:@"effect"];

  if (v15 || v9 || v10)
  {
    uint64_t v11 = [v15 animationFrames];
    if ((unint64_t)[v11 count] >= 3)
    {
    }
    else
    {
      uint64_t v12 = [v9 animationFrames];
      unint64_t v13 = [v12 count];

      if (v13 <= 2)
      {
        [(UIVisualEffectBackingHost *)self _generateBackgroundEffects:v15 contentEffects:v9];
        goto LABEL_11;
      }
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIVisualEffectBackingHost.m" lineNumber:400 description:@"This should not exist."];
  }
LABEL_11:
}

- (void)_generateBackgroundEffects:(id)a3 contentEffects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = v8;
  ++v8->_reentrantCount;
  if (v6)
  {
    [(UIVisualEffectBackingHost *)v8 _ensureBackgroundHost];
    v10 = [v6 animationFrames];
    uint64_t v11 = [v10 lastObject];
    uint64_t v12 = [v11 value];

    unint64_t v13 = [(UIVisualEffectBackingHost *)v9 _effectDescriptorForEffects:v12 usage:1];
    [(_UIVisualEffectHost *)v9->_backgroundHost setPrimaryCaptureGroup:v9->_captureGroup];
    if ((*(unsigned char *)&v9->_flags & 8) == 0)
    {
      captureGroup = v9->_captureGroup;
      id v15 = [(_UIVisualEffectHost *)v9->_backgroundHost contentView];
      [v15 setCaptureGroup:captureGroup];
    }
    uint64_t v16 = v9->_backgroundHost;
    uint64_t v17 = [v13 layerHitTestsAsOpaque];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_view);
    v19 = [WeakRetained layer];
    [v19 setHitTestsAsOpaque:v17];

    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    unint64_t v13 = 0;
    uint64_t v16 = 0;
    if (v7)
    {
LABEL_5:
      [(UIVisualEffectBackingHost *)v9 _ensureContentHost];
      long long v20 = [v7 animationFrames];
      long long v21 = [v20 lastObject];
      long long v22 = [v21 value];
      long long v23 = [(UIVisualEffectBackingHost *)v9 _effectDescriptorForEffects:v22 usage:2];

      long long v24 = v9->_contentHost;
      goto LABEL_8;
    }
  }
  long long v23 = 0;
  long long v24 = 0;
LABEL_8:
  [(_UIVisualEffectHost *)v16 prepareToTransitionToEffectDescriptor:v13];
  [(_UIVisualEffectHost *)v24 prepareToTransitionToEffectDescriptor:v23];
  long long v25 = objc_loadWeakRetained((id *)&v9->_view);
  long long v26 = (void *)v25[21];
  if (v26) {
    long long v26 = (void *)v26[5];
  }
  long long v27 = v26;

  if (v27 == v9)
  {
    v36 = v13;
    [(UIVisualEffectBackingHost *)v9 _updateSubviews];
    if (v6)
    {
      v28 = [v6 animationFrames];
      uint64_t v29 = [v28 count] - 1;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke;
      v49[3] = &unk_1E52DD7D0;
      v50 = v16;
      [v6 animateFrameAtIndex:v29 animations:v49];
    }
    if (v7)
    {
      uint64_t v30 = [v7 animationFrames];
      uint64_t v31 = [v30 count] - 1;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_2;
      v47[3] = &unk_1E52DD7D0;
      v48 = v24;
      [v7 animateFrameAtIndex:v31 animations:v47];
    }
    v32 = [(_UIVisualEffectHost *)v16 transitionEffectDescriptor];
    v33 = [(_UIVisualEffectHost *)v24 transitionEffectDescriptor];
    objc_initWeak(&location, v9);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_3;
    v37[3] = &unk_1E52F1070;
    objc_copyWeak(&v45, &location);
    id v38 = v6;
    id v39 = v7;
    id v34 = v32;
    id v40 = v34;
    v41 = v16;
    id v35 = v33;
    id v42 = v35;
    v43 = v24;
    v44 = v9;
    +[UIView _addCompletionWithPosition:v37];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

    unint64_t v13 = v36;
  }
}

uint64_t __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginTransition];
}

uint64_t __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginTransition];
}

void __71__UIVisualEffectBackingHost__generateBackgroundEffects_contentEffects___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_17;
    }
    BOOL v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = [v5 initialValue];
      [WeakRetained setBackgroundEffects:v6];
    }
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = [v7 initialValue];
      [WeakRetained setContentEffects:v8];
    }
    goto LABEL_16;
  }
  if (*(void *)(a1 + 32)
    && (v9 = *(void **)(a1 + 48),
        [*(id *)(a1 + 56) transitionEffectDescriptor],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9 == v10))
  {
    [*(id *)(a1 + 56) endTransition];
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v12 = *(void **)(a1 + 64);
    unint64_t v13 = [*(id *)(a1 + 72) transitionEffectDescriptor];

    if (v12 == v13)
    {
      [*(id *)(a1 + 72) endTransition];
      goto LABEL_16;
    }
  }
  if (v11) {
LABEL_16:
  }
    [WeakRetained _updateSubviews];
LABEL_17:
  --*(void *)(*(void *)(a1 + 80) + 48);
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 80) + 56));
  -[UIView _backing_unwrapIfPossible]((uint64_t)v14);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 1;
}

- (id)_initialValueForKey:(id)a3
{
  id v4 = a3;
  if ([@"backgroundEffects" isEqualToString:v4])
  {
    uint64_t v5 = 40;
LABEL_5:
    id v6 = *(id *)((char *)&self->super.isa + v5);
    goto LABEL_7;
  }
  if ([@"contentEffects" isEqualToString:v4])
  {
    uint64_t v5 = 32;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)_configureEffects
{
  if ((*(unsigned char *)&self->_flags & 3) == 0) {
    return;
  }
  id v3 = self;
  ++v3->_reentrantCount;
  uint64_t v16 = v3;
  id v4 = [(_UIVisualEffectEnvironment *)v3->_environment traitCollection];

  if (!v4)
  {
    uint64_t v5 = [(UIVisualEffectBackingHost *)v16 _mergedTraitCollection];
    [(_UIVisualEffectEnvironment *)v16->_environment setTraitCollection:v5];
  }
  if (*(unsigned char *)&self->_flags)
  {
    [(UIVisualEffectBackingHost *)v16 _ensureBackgroundHost];
    id v7 = [(UIVisualEffectBackingHost *)v16 _effectDescriptorForEffects:v16->_backgroundEffects usage:1];
    [(_UIVisualEffectHost *)v16->_backgroundHost setPrimaryCaptureGroup:v16->_captureGroup];
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      captureGroup = v16->_captureGroup;
      int v11 = [(_UIVisualEffectHost *)v16->_backgroundHost contentView];
      [v11 setCaptureGroup:captureGroup];
    }
    id v6 = v16->_backgroundHost;
    *(unsigned char *)&self->_flags &= ~1u;
    uint64_t v12 = [v7 layerHitTestsAsOpaque];
    id WeakRetained = objc_loadWeakRetained((id *)&v16->_view);
    id v14 = [WeakRetained layer];
    [v14 setHitTestsAsOpaque:v12];

    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    v9 = 0;
    v8 = 0;
    goto LABEL_12;
  }
  id v6 = 0;
  id v7 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  [(UIVisualEffectBackingHost *)v16 _ensureContentHost];
  v8 = [(UIVisualEffectBackingHost *)v16 _effectDescriptorForEffects:v16->_contentEffects usage:2];
  v9 = v16->_contentHost;
  *(unsigned char *)&self->_flags &= ~2u;
LABEL_12:
  [(_UIVisualEffectHost *)v6 setCurrentEffectDescriptor:v7];
  [(_UIVisualEffectHost *)v9 setCurrentEffectDescriptor:v8];
  [(UIVisualEffectBackingHost *)v16 _updateSubviews];
  --v16->_reentrantCount;
  id v15 = objc_loadWeakRetained((id *)&v16->_view);
  -[UIView _backing_unwrapIfPossible]((uint64_t)v15);
}

- (id)_effectDescriptorForEffects:(id)a3 usage:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(_UIVisualEffectDescriptor);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "_updateEffectDescriptor:forEnvironment:usage:", v7, self->_environment, a4, (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_ensureBackgroundHost
{
  if ([(NSArray *)self->_backgroundEffects count] == 1)
  {
    id v3 = [(NSArray *)self->_backgroundEffects objectAtIndexedSubscript:0];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    int isKindOfClass = 0;
  }
  if (!self->_backgroundHost || ((isKindOfClass ^ ((*(unsigned char *)&self->_flags & 8) == 0)) & 1) == 0)
  {
    if (isKindOfClass)
    {
      uint64_t v9 = objc_alloc_init(_UIVisualEffectSubview);
      uint64_t v5 = +[UIColor blackColor];
      [(UIView *)v9 setBackgroundColor:v5];

      char v6 = *(unsigned char *)&self->_flags | 8;
    }
    else
    {
      uint64_t v9 = objc_alloc_init(_UIVisualEffectBackdropView);
      char v6 = *(unsigned char *)&self->_flags & 0xF7;
    }
    *(unsigned char *)&self->_$AE0800C6C1830CBF550A377BF4428CA5 flags = v6;
    id v7 = [[_UIVisualEffectHost alloc] initWithContentView:v9];
    backgroundHost = self->_backgroundHost;
    self->_backgroundHost = v7;

    [(_UIVisualEffectHost *)self->_backgroundHost setPrimaryCaptureGroup:self->_captureGroup];
  }
}

- (void)_ensureContentHost
{
  if (!self->_contentHost)
  {
    id v3 = [_UIVisualEffectHost alloc];
    id v4 = [_UIVisualEffectBackingFakeView alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    char v6 = [(_UIVisualEffectBackingFakeView *)v4 initWithClientView:WeakRetained];
    id v7 = [(_UIVisualEffectHost *)v3 initWithContentView:v6];
    contentHost = self->_contentHost;
    self->_contentHost = v7;

    uint64_t v9 = self->_contentHost;
    [(_UIVisualEffectHost *)v9 setContentViewRequired:1];
  }
}

- (void)_updateSubviews
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(UIVisualEffectBackingHost *)self visualEffectSubviews];
  uint64_t v5 = [v3 setWithArray:v4];

  char v6 = [(_UIVisualEffectHost *)self->_backgroundHost views];
  uint64_t v7 = [(_UIVisualEffectHost *)self->_contentHost views];
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v6) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = (void *)v7;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = [v6 arrayByAddingObjectsFromArray:v7];
  }
  uint64_t v12 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__UIVisualEffectBackingHost__updateSubviews__block_invoke;
  v17[3] = &unk_1E52DCB30;
  v17[4] = self;
  id v18 = v11;
  id v19 = v5;
  id v13 = v5;
  id v14 = v12;
  +[UIView performWithoutAnimation:v17];
  long long v15 = (void *)[v14 copy];
  [(UIVisualEffectBackingHost *)self setVisualEffectSubviews:v15];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [(UIVisualEffectBackingHost *)self _updateContentViewVibrancyTraitOverride:WeakRetained];
}

void __44__UIVisualEffectBackingHost__updateSubviews__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) |= 4u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
          id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
          uint64_t v10 = [v9 _layer];
          if (WeakRetained) {
            -[UIView _backing_addPrivateSubview:positioned:relativeTo:]((uint64_t)WeakRetained, v7, -3, (uint64_t)v10);
          }
        }
        [*(id *)(a1 + 48) removeObject:v7];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
        id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
        -[UIView _backing_removePrivateSubview:]((uint64_t)v17, v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 8) &= ~4u;
}

- (void)_updateContentViewVibrancyTraitOverride:(id)a3
{
  backgroundHost = self->_backgroundHost;
  id v7 = a3;
  uint64_t v4 = [(_UIVisualEffectHost *)backgroundHost currentEffectDescriptor];
  int v5 = [v4 allowsVibrancyInContent];

  if (v5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = -1;
  }
  [v7 _setOverrideVibrancyTrait:v6];
}

- (void)willGainDescendent:(id)a3
{
}

- (void)willLoseDescendent:(id)a3
{
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  int v5 = self;
  contentHost = v5->_contentHost;
  uint64_t v13 = v5;
  p_view = (id *)&v5->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_view);
  [(_UIVisualEffectHost *)contentHost _view:WeakRetained willMoveToWindow:a4];

  id v9 = objc_loadWeakRetained(p_view);
  uint64_t v10 = (void *)v9[21];
  if (v10) {
    uint64_t v10 = (void *)v10[5];
  }
  id v11 = v10;

  uint64_t v12 = v13;
  if (v11 == v13)
  {
    [(UIVisualEffectBackingHost *)v13 didMoveToWindow];
    uint64_t v12 = v13;
  }
}

- (void)dealloc
{
  [(UIVisualEffectBackingHost *)self _unregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectBackingHost;
  [(UIVisualEffectBackingHost *)&v3 dealloc];
}

- (NSString)_captureGroupName
{
  return self->_captureGroupName;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (NSArray)contentEffects
{
  return self->_contentEffects;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (int64_t)reentrantCount
{
  return self->_reentrantCount;
}

- (void)setReentrantCount:(int64_t)a3
{
  self->_reentrantCount = a3;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (_UIVisualEffectEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (_UIVisualEffectViewBackdropCaptureGroup)captureGroup
{
  return self->_captureGroup;
}

- (void)setCaptureGroup:(id)a3
{
}

- (_UIVisualEffectHost)backgroundHost
{
  return self->_backgroundHost;
}

- (void)setBackgroundHost:(id)a3
{
}

- (_UIVisualEffectHost)contentHost
{
  return self->_contentHost;
}

- (void)setContentHost:(id)a3
{
}

- (NSArray)visualEffectSubviews
{
  return self->_visualEffectSubviews;
}

- (void)setVisualEffectSubviews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectSubviews, 0);
  objc_storeStrong((id *)&self->_contentHost, 0);
  objc_storeStrong((id *)&self->_backgroundHost, 0);
  objc_storeStrong((id *)&self->_captureGroup, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_contentEffects, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
  objc_storeStrong((id *)&self->_captureGroupName, 0);
}

@end