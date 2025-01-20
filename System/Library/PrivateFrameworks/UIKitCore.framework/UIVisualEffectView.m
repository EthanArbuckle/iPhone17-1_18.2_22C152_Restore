@interface UIVisualEffectView
+ (BOOL)supportsSecureCoding;
+ (Class)_contentViewClass;
- (BOOL)__isLandmarkView;
- (BOOL)_allowsGroupFiltering;
- (BOOL)_applyCornerMaskToSelf;
- (BOOL)_isContentViewStatic;
- (BOOL)_isNoiseEnabled;
- (BOOL)_useLiveMasking;
- (BOOL)_useReducedTransparencyForContentEffects;
- (BOOL)allowsBlurring;
- (BOOL)allowsDithering;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (NSArray)_captureDependents;
- (NSArray)backgroundEffects;
- (NSArray)contentEffects;
- (NSString)_groupName;
- (NSString)description;
- (UIImage)_maskImage;
- (UIView)contentView;
- (UIVisualEffect)effect;
- (UIVisualEffectView)_captureSource;
- (UIVisualEffectView)initWithCoder:(NSCoder *)coder;
- (UIVisualEffectView)initWithEffect:(UIVisualEffect *)effect;
- (UIVisualEffectView)initWithFrame:(CGRect)a3;
- (_UIVisualEffectBackdropView)_captureView;
- (_UIVisualEffectViewBackdropCaptureGroup)_captureGroup;
- (_UIVisualEffectViewCornerMask)_cornerMask;
- (double)_backdropViewBackgroundColorAlpha;
- (double)_continuousCornerRadius;
- (double)_cornerRadius;
- (id)_backgroundHost;
- (id)_colorViewBoundsOverlayCreateIfNecessary:(BOOL)a3;
- (id)_contentHost;
- (id)_cornerCurve;
- (id)_debug;
- (id)_effectDescriptorForEffects:(id)a3 usage:(int64_t)a4;
- (id)_environment;
- (id)_initialValueForKey:(id)a3;
- (id)_maskImageForMaskView:(id)a3;
- (id)_maskView;
- (id)_obtainDynamicContentAssertionForReason:(id)a3;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)_whatsWrongWithThisEffect;
- (int64_t)_renderMode;
- (int64_t)blurQuality;
- (void)_addCaptureDependent:(id)a3;
- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5;
- (void)_applyCornerRadiusToSubviews;
- (void)_commonInit;
- (void)_configureEffects;
- (void)_didUpdateContentView;
- (void)_ensureBackgroundHost;
- (void)_ensureContentHostWithView:(id)a3;
- (void)_generateBackgroundEffects:(id)a3 contentEffects:(id)a4;
- (void)_generateDeferredAnimations:(id)a3;
- (void)_generateEffectAnimations:(id)a3;
- (void)_registerNotifications;
- (void)_removeCaptureDependent:(id)a3;
- (void)_resetEffect;
- (void)_setAllowsGroupFiltering:(BOOL)a3;
- (void)_setBackdropViewBackgroundColorAlpha:(double)a3;
- (void)_setCaptureDependents:(id)a3;
- (void)_setCaptureView:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerMask:(id)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5;
- (void)_setGroupName:(id)a3;
- (void)_setIsContentViewStatic:(BOOL)a3;
- (void)_setMaskImage:(id)a3;
- (void)_setMaskView:(id)a3;
- (void)_setRenderMode:(int64_t)a3;
- (void)_setUseLiveMasking:(BOOL)a3;
- (void)_setUseReducedTransparencyForContentEffects:(BOOL)a3;
- (void)_unregisterNotifications;
- (void)_updateCaptureDependents;
- (void)_updateCornerTraits;
- (void)_updateEffectBackgroundColor;
- (void)_updateEffectForAccessibilityChanges:(id)a3;
- (void)_updateEffectForReducedTransparency;
- (void)_updateEffectForSnapshotDidEnd:(id)a3;
- (void)_updateEffectForSnapshotWillBegin:(id)a3;
- (void)_updateEffectsFromLegacyEffect;
- (void)_updateEnvironmentAndFlagUpdatesIfNecessary:(id)a3;
- (void)_updateSubView:(id)a3 frame:(CGRect)a4;
- (void)_updateSubviews;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)respondToSettingsUpdate;
- (void)setAllowsBlurring:(BOOL)a3;
- (void)setAllowsDithering:(BOOL)a3;
- (void)setBackgroundEffects:(id)a3;
- (void)setBlurQuality:(int64_t)a3;
- (void)setContentEffects:(id)a3;
- (void)setEffect:(UIVisualEffect *)effect;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIVisualEffectView

- (id)_maskView
{
  return self->_maskView;
}

- (void)layoutSubviews
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)UIVisualEffectView;
  [(UIView *)&v21 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_maskImage)
  {
    v11 = -[UIView _safeMaskView](self);
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  }
  v12 = [(_UIVisualEffectHost *)self->_backgroundHost views];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "setFrame:", v4, v6, v8, v10);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

void __48__UIVisualEffectView__generateEffectAnimations___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 40) initialValue];
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(void **)(v6 + 496);
    *(void *)(v6 + 496) = v5;
  }
}

- (void)_setIsContentViewStatic:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    char v4 = 0x80;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_effectViewFlags = v4 & 0x80 | *(unsigned char *)&self->_effectViewFlags & 0x7F;
  id v5 = [(UIView *)self traitOverrides];
  [v5 setNSIntegerValue:v3 forTrait:objc_opt_class()];
}

- (UIVisualEffect)effect
{
  return self->_effect;
}

- (BOOL)__isLandmarkView
{
  return 1;
}

- (void)_commonInit
{
  backgroundEffects = self->_backgroundEffects;
  char v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  self->_backgroundEffects = (NSArray *)MEMORY[0x1E4F1CBF0];

  contentEffects = self->_contentEffects;
  self->_contentEffects = v4;

  uint64_t v6 = [[_UIVisualEffectEnvironment alloc] initWithHost:self];
  environment = self->_environment;
  self->_environment = v6;

  self->_useLiveMasking = dyld_program_sdk_at_least();
  double v8 = objc_alloc_init(_UIVisualEffectViewBackdropCaptureGroup);
  captureGroup = self->_captureGroup;
  self->_captureGroup = v8;

  double v10 = (NSMutableArray *)objc_opt_new();
  captureDependents = self->_captureDependents;
  self->_captureDependents = v10;

  [(UIView *)self _setShouldAdaptToMaterials:0];
  [(UIView *)self setAllowsGroupBlending:0];
  [(UIView *)self setAllowsGroupOpacity:0];
  [(_UIVisualEffectEnvironment *)self->_environment setAllowsDithering:(*(unsigned char *)&self->_effectViewFlags >> 2) & 1];
  [(_UIVisualEffectEnvironment *)self->_environment setBlurQuality:self->_blurQuality];
  v12 = [(UIView *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceIdiom];
  uint64_t v14 = self->_environment;
  if (v13 == 3)
  {
    [(_UIVisualEffectEnvironment *)v14 setReducedTransperancy:0];
  }
  else
  {
    uint64_t v15 = [(_UIVisualEffectEnvironment *)v14 traitCollection];
    BOOL v16 = [v15 userInterfaceIdiom] != 6 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    [(_UIVisualEffectEnvironment *)self->_environment setReducedTransperancy:v16];
  }
  long long v17 = [[_UIAssertionController alloc] initWithAssertionSubject:self];
  assertionController = self->_assertionController;
  self->_assertionController = v17;

  [(UIVisualEffectView *)self _setIsContentViewStatic:1];
  [(UIVisualEffectView *)self _registerNotifications];
}

- (void)_updateEnvironmentAndFlagUpdatesIfNecessary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(void))a3;
  id v5 = (void *)[(_UIVisualEffectEnvironment *)self->_environment copy];
  v4[2](v4);
  int effectViewFlags = (int)self->_effectViewFlags;
  if ((~effectViewFlags & 3) != 0)
  {
    double v8 = [(_UIVisualEffectEnvironment *)self->_environment traitCollection];
    double v9 = [v5 traitCollection];
    double v7 = [v8 changedTraitsFromTraitCollection:v9];

    LOBYTE(effectViewFlags) = self->_effectViewFlags;
    if (effectViewFlags) {
      goto LABEL_16;
    }
  }
  else
  {
    double v7 = 0;
    if (effectViewFlags) {
      goto LABEL_16;
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v10 = self->_backgroundEffects;
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
          *(unsigned char *)&self->_effectViewFlags |= 1u;
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

  LOBYTE(effectViewFlags) = self->_effectViewFlags;
LABEL_16:
  if ((effectViewFlags & 2) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v15 = self->_contentEffects;
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
            *(unsigned char *)&self->_effectViewFlags |= 2u;
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

void __47__UIVisualEffectView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) traitCollection];
  [*(id *)(*(void *)(a1 + 32) + 456) setTraitCollection:v2];

  id v7 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v3 = [v7 userInterfaceIdiom];
  char v4 = *(void **)(*(void *)(a1 + 32) + 456);
  if (v3 == 3)
  {
    [v4 setReducedTransperancy:0];
  }
  else
  {
    id v5 = [v4 traitCollection];
    BOOL v6 = [v5 userInterfaceIdiom] != 6 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    [*(id *)(*(void *)(a1 + 32) + 456) setReducedTransperancy:v6];
  }
}

- (void)_updateSubView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  objc_msgSend(v11, "setFrame:", x, y, width, height);
  [v11 setAutoresizingMask:18];
  [v11 _setShouldAdaptToMaterials:0];
  cornerMask = self->__cornerMask;
  double v10 = [v11 layer];
  if (cornerMask) {
    [(_UIVisualEffectViewCornerMask *)cornerMask _applyToLayer:v10];
  }
  else {
    +[_UIVisualEffectViewCornerMask _applyZeroMaskToLayer:v10];
  }

  [(UIView *)self addSubview:v11];
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ((*(unsigned char *)&self->_effectViewFlags & 0x20) != 0
    && ([v9 conformsToProtocol:&unk_1ED47DC78] & 1) != 0)
  {
LABEL_7:
    v13.receiver = self;
    v13.super_class = (Class)UIVisualEffectView;
    [(UIView *)&v13 _addSubview:v9 positioned:a4 relativeTo:v10];
    goto LABEL_8;
  }
  if (!dyld_program_sdk_at_least())
  {
    uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("VisualEffect", &_addSubview_positioned_relativeTo____s_category)
                       + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@ has been added as a subview to %@. Do not add subviews directly to the visual effect view itself, instead add them to the -contentView.", buf, 0x16u);
    }
    goto LABEL_7;
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"UIVisualEffectView.m", 1570, @"%@ has been added as a subview to %@. Do not add subviews directly to the visual effect view itself, instead add them to the -contentView.", v9, self object file lineNumber description];

LABEL_8:
}

- (void)setContentEffects:(id)a3
{
  id v5 = a3;
  if (!v5) {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v5;
  if ((_UIVisualEffectAssertEffectConstraints(v5) & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIVisualEffectView.m", 985, @"contentEffects can contain at most 1 UIBlurEffect and 1 UIVibrancyEffect (%@)", v11 object file lineNumber description];
  }
  if (![(NSArray *)self->_contentEffects isEqualToArray:v11])
  {
    if (-[UIView _hasDeferredAnimationForKey:]((uint64_t)self, @"effect"))
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIVisualEffectView.m" lineNumber:987 description:@"You cannot animate the effects property alongside the contentEffects property. Switch to using contentEffects exclusively."];
    }
    BOOL v6 = [(UIView *)self _deferredAnimationForKey:@"contentEffects"];
    id v7 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v11 copyItems:1];
    contentEffects = self->_contentEffects;
    self->_contentEffects = v7;

    if (v6)
    {
      [v6 addAnimationFrameForValue:self->_contentEffects];
    }
    else
    {
      *(unsigned char *)&self->_effectViewFlags |= 2u;
      [(UIVisualEffectView *)self _configureEffects];
    }
  }
}

- (void)setBackgroundEffects:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UIVisualEffectView.m" lineNumber:960 description:@"Setting background effects on a dependent visual effect view is not supported"];
  }
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v7;
  if ((_UIVisualEffectAssertEffectConstraints(v7) & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UIVisualEffectView.m", 964, @"backgroundEffects can contain at most 1 UIBlurEffect and 1 UIVibrancyEffect (%@)", v14 object file lineNumber description];
  }
  if (![(NSArray *)self->_backgroundEffects isEqualToArray:v14])
  {
    if (-[UIView _hasDeferredAnimationForKey:]((uint64_t)self, @"effect"))
    {
      objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"UIVisualEffectView.m" lineNumber:966 description:@"You cannot animate the effects property alongside the backgroundEffects property. Switch to using backgroundEffects exclusively."];
    }
    double v8 = [(UIView *)self _deferredAnimationForKey:@"backgroundEffects"];
    id v9 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v14 copyItems:1];
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v9;

    if (v8)
    {
      [v8 addAnimationFrameForValue:self->_backgroundEffects];
    }
    else
    {
      *(unsigned char *)&self->_effectViewFlags |= 1u;
      [(UIVisualEffectView *)self _configureEffects];
    }
    [(UIVisualEffectView *)self _updateCaptureDependents];
  }
}

- (UIVisualEffectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(UIVisualEffectView *)self initWithEffect:0];
  double v8 = v7;
  if (v7) {
    -[UIView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (void)_updateCaptureDependents
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_captureDependents;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        _UIVisualEffectViewConfigureDependent(self, *(id **)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_initialValueForKey:(id)a3
{
  id v4 = a3;
  if ([@"effect" isEqualToString:v4])
  {
    effect = self->_effect;
    if (!effect)
    {
      uint64_t v6 = +[UIVisualEffect emptyEffect];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([@"backgroundEffects" isEqualToString:v4])
  {
    uint64_t v7 = 512;
LABEL_8:
    effect = *(UIVisualEffect **)((char *)&self->super.super.super.isa + v7);
LABEL_9:
    uint64_t v6 = effect;
    goto LABEL_10;
  }
  if ([@"contentEffects" isEqualToString:v4])
  {
    uint64_t v7 = 520;
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)UIVisualEffectView;
  uint64_t v6 = [(UIView *)&v10 _initialValueForKey:v4];
LABEL_10:
  long long v8 = v6;

  return v8;
}

- (void)_didUpdateContentView
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIVisualEffectContentViewDidUpdateNotification" object:self];
}

- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5
{
  BOOL v6 = a4;
  long long v9 = self->__cornerMask;
  uint64_t v13 = v9;
  if (!v9
    || (BOOL v10 = [(_UIVisualEffectViewCornerMask *)v9 _isCornerWithRadius:v6 continuous:a5 mask:a3], v11 = v13, !v10))
  {
    if (v6) {
      +[_UIVisualEffectViewCornerMask continuousCornerMaskWithRadius:a3];
    }
    else {
    uint64_t v12 = +[_UIVisualEffectViewCornerMask cornerMaskWithRadius:a3];
    }

    id v14 = [v12 cornerMaskAppliedToCorners:a5];

    long long v11 = v14;
  }
  id v15 = v11;
  [(UIVisualEffectView *)self _setCornerMask:v11];
}

- (void)_setCornerMask:(id)a3
{
  id v4 = (_UIVisualEffectViewCornerMask *)a3;
  cornerMask = self->__cornerMask;
  if (cornerMask != v4)
  {
    long long v8 = v4;
    if (!v4 || !cornerMask || ![(_UIVisualEffectViewCornerMask *)cornerMask isEqual:v4])
    {
      BOOL v6 = (_UIVisualEffectViewCornerMask *)[(_UIVisualEffectViewCornerMask *)v8 copy];
      uint64_t v7 = self->__cornerMask;
      self->__cornerMask = v6;

      [(UIVisualEffectView *)self _applyCornerRadiusToSubviews];
    }
    [(UIVisualEffectView *)self _updateCornerTraits];
    id v4 = v8;
  }
}

- (void)_updateCornerTraits
{
  id v3 = (id)*MEMORY[0x1E4F39EA0];
  cornerMask = self->__cornerMask;
  id v14 = v3;
  if (cornerMask)
  {
    [(_UIVisualEffectViewCornerMask *)cornerMask radius];
    double v6 = v5;
    unint64_t v7 = [(_UIVisualEffectViewCornerMask *)self->__cornerMask appliedCorners];
    BOOL v8 = [(_UIVisualEffectViewCornerMask *)self->__cornerMask cornersAreContinuous];
    long long v9 = (void *)*MEMORY[0x1E4F39EA8];
    if (!v8) {
      long long v9 = v14;
    }
    id v10 = v9;

    id v14 = v10;
  }
  else
  {
    double v6 = 0.0;
    unint64_t v7 = 15;
  }
  long long v11 = [(UIView *)self traitOverrides];
  [v11 setCGFloatValue:objc_opt_class() forTrait:v6];

  uint64_t v12 = [(UIView *)self traitOverrides];
  [v12 setNSIntegerValue:v7 forTrait:objc_opt_class()];

  uint64_t v13 = [(UIView *)self traitOverrides];
  [v13 setObject:v14 forTrait:objc_opt_class()];
}

- (void)_applyCornerRadiusToSubviews
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(UIVisualEffectView *)self _applyCornerMaskToSelf])
  {
    cornerMask = self->__cornerMask;
    id v4 = [(UIView *)self layer];
    if (cornerMask) {
      [(_UIVisualEffectViewCornerMask *)cornerMask _applyToLayer:v4];
    }
    else {
      +[_UIVisualEffectViewCornerMask _applyZeroMaskToLayer:v4];
    }
  }
  if (self->__cornerMask)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v5 = [(UIView *)self subviews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = self->__cornerMask;
          long long v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) layer];
          [(_UIVisualEffectViewCornerMask *)v10 _applyToLayer:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v5 = [(UIView *)self subviews];
    uint64_t v12 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v5);
          }
          __int16 v16 = [*(id *)(*((void *)&v21 + 1) + 8 * j) layer];
          +[_UIVisualEffectViewCornerMask _applyZeroMaskToLayer:v16];
        }
        uint64_t v13 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)_applyCornerMaskToSelf
{
  return 0;
}

- (void)setEffect:(UIVisualEffect *)effect
{
  if (self->_effect != effect)
  {
    double v5 = effect;
    if ((-[UIView _hasDeferredAnimationForKey:]((uint64_t)self, @"backgroundEffects") & 1) != 0
      || -[UIView _hasDeferredAnimationForKey:]((uint64_t)self, @"contentEffects"))
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"UIVisualEffectView.m" lineNumber:927 description:@"You cannot animate the effects property alongside the backgroundEffects or contentEffects properties. Switch to using backgroundEffects and contentEffects exclusively."];
    }
    id v11 = [(UIView *)self _deferredAnimationForKey:@"effect"];
    uint64_t v6 = (UIVisualEffect *)[(UIVisualEffect *)v5 copy];

    uint64_t v7 = self->_effect;
    self->_effect = v6;

    if (self->_effect)
    {
      objc_msgSend(v11, "addAnimationFrameForValue:");
    }
    else
    {
      uint64_t v8 = +[UIVisualEffect emptyEffect];
      [v11 addAnimationFrameForValue:v8];
    }
    long long v9 = v11;
    if (!v11)
    {
      [(UIVisualEffectView *)self _updateEffectsFromLegacyEffect];
      long long v9 = 0;
    }
  }
}

- (void)_ensureBackgroundHost
{
  if (!self->_backgroundHost)
  {
    double v5 = objc_alloc_init(_UIVisualEffectBackdropView);
    id v3 = [[_UIVisualEffectHost alloc] initWithContentView:v5];
    backgroundHost = self->_backgroundHost;
    self->_backgroundHost = v3;

    [(_UIVisualEffectHost *)self->_backgroundHost setPrimaryCaptureGroup:self->_captureGroup];
  }
}

- (UIVisualEffectView)initWithEffect:(UIVisualEffect *)effect
{
  id v4 = effect;
  v10.receiver = self;
  v10.super_class = (Class)UIVisualEffectView;
  double v5 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v6 = v5;
  if (v5)
  {
    [(UIVisualEffectView *)v5 _commonInit];
    uint64_t v7 = [(UIVisualEffect *)v4 copy];
    uint64_t v8 = v6->_effect;
    v6->_effect = (UIVisualEffect *)v7;

    [(UIVisualEffectView *)v6 _updateEffectsFromLegacyEffect];
  }

  return v6;
}

- (void)_registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateEffectForAccessibilityChanges_ name:@"UIAccessibilityReduceTransparencyStatusDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__updateEffectForAccessibilityChanges_ name:@"UIAccessibilityReduceMotionStatusDidChangeNotification" object:0];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectView;
  [(UIView *)&v3 didMoveToWindow];
  [(UIVisualEffectView *)self _configureEffects];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectView;
  [(UIView *)&v3 didMoveToSuperview];
  [(UIVisualEffectView *)self _configureEffects];
}

- (void)_updateEffectsFromLegacyEffect
{
  objc_super v10 = 0;
  id v11 = 0;
  _UIVisualEffectViewUpgradeLegacyEffect(self->_effect, (void **)&v11, (void **)&v10);
  objc_super v3 = v11;
  *(unsigned char *)&self->_int effectViewFlags = *(unsigned char *)&self->_effectViewFlags & 0xFE | ![(NSArray *)self->_backgroundEffects isEqualToArray:v11];
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = v3;
  long long v9 = v3;

  double v5 = v10;
  if ([(NSArray *)self->_contentEffects isEqualToArray:v10]) {
    char v6 = 0;
  }
  else {
    char v6 = 2;
  }
  *(unsigned char *)&self->_int effectViewFlags = *(unsigned char *)&self->_effectViewFlags & 0xFD | v6;
  contentEffects = self->_contentEffects;
  self->_contentEffects = v5;
  uint64_t v8 = v5;

  [(UIVisualEffectView *)self _configureEffects];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__UIVisualEffectView_traitCollectionDidChange___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  id v4 = a3;
  [(UIVisualEffectView *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v6];
  [(UIVisualEffectView *)self _configureEffects];
  v5.receiver = self;
  v5.super_class = (Class)UIVisualEffectView;
  [(UIView *)&v5 traitCollectionDidChange:v4];
}

- (void)_configureEffects
{
  if ((*(unsigned char *)&self->_effectViewFlags & 3) == 0) {
    return;
  }
  objc_super v3 = [(_UIVisualEffectEnvironment *)self->_environment traitCollection];

  if (!v3)
  {
    id v4 = [(UIView *)self traitCollection];
    [(_UIVisualEffectEnvironment *)self->_environment setTraitCollection:v4];
  }
  +[UIView _isInAnimationBlockWithAnimationsEnabled];
  unsigned int effectViewFlags = self->_effectViewFlags;
  if (effectViewFlags)
  {
    [(UIVisualEffectView *)self _ensureBackgroundHost];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
    objc_super v10 = WeakRetained;
    backgroundEffects = self->_backgroundEffects;
    if (WeakRetained)
    {
      char v6 = [WeakRetained _effectDescriptorForEffects:backgroundEffects usage:1];
      uint64_t v12 = [v10 _captureGroup];
      [(_UIVisualEffectHost *)self->_backgroundHost setPrimaryCaptureGroup:v12];
      uint64_t v13 = [(_UIVisualEffectHost *)self->_backgroundHost contentView];
      [v13 setCaptureGroup:v12];
    }
    else
    {
      char v6 = [(UIVisualEffectView *)self _effectDescriptorForEffects:backgroundEffects usage:1];
      [(_UIVisualEffectHost *)self->_backgroundHost setPrimaryCaptureGroup:self->_captureGroup];
      captureGroup = self->_captureGroup;
      uint64_t v12 = [(_UIVisualEffectHost *)self->_backgroundHost contentView];
      [v12 setCaptureGroup:captureGroup];
    }

    long long v17 = self->_backgroundHost;
    *(unsigned char *)&self->_effectViewFlags &= ~1u;
    uint64_t v15 = [v6 layerHitTestsAsOpaque];
    __int16 v16 = [(UIView *)self layer];
    [v16 setHitTestsAsOpaque:v15];

    unsigned int effectViewFlags = self->_effectViewFlags;
    if ((effectViewFlags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    goto LABEL_13;
  }
  char v6 = 0;
  long long v17 = 0;
  if ((effectViewFlags & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  [(_UIVisualEffectEnvironment *)self->_environment setUseSimpleVibrancy:(effectViewFlags >> 4) & 1];
  uint64_t v7 = [(UIVisualEffectView *)self _effectDescriptorForEffects:self->_contentEffects usage:2];
  [(UIVisualEffectView *)self _ensureContentHostWithView:0];
  uint64_t v8 = self->_contentHost;
  *(unsigned char *)&self->_effectViewFlags &= ~2u;
LABEL_13:
  [(_UIVisualEffectHost *)v17 setCurrentEffectDescriptor:v6];
  [(_UIVisualEffectHost *)v8 setCurrentEffectDescriptor:v7];
  [(UIVisualEffectView *)self _updateSubviews];
}

- (void)_updateSubviews
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(UIView *)self subviews];
  objc_super v5 = [v3 setWithArray:v4];

  char v6 = [(_UIVisualEffectHost *)self->_backgroundHost views];
  uint64_t v7 = [(_UIVisualEffectHost *)self->_contentHost views];
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v6) {
      objc_super v10 = v6;
    }
    else {
      objc_super v10 = (void *)v7;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = [v6 arrayByAddingObjectsFromArray:v7];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__UIVisualEffectView__updateSubviews__block_invoke;
  v20[3] = &unk_1E52DCB30;
  v20[4] = self;
  id v12 = v11;
  id v21 = v12;
  id v13 = v5;
  id v22 = v13;
  +[UIView performWithoutAnimation:v20];
  uint64_t v14 = [(_UIVisualEffectHost *)self->_contentHost contentView];
  uint64_t v15 = v14;
  if (v14)
  {
    __int16 v16 = [v14 superview];

    if (v16 == self)
    {
      long long v17 = [v15 traitCollection];
      long long v18 = [(UIVisualEffectView *)self _traitCollectionForChildEnvironment:v15];
      uint64_t v19 = [v17 _vibrancy];
      if (v19 != [v18 _vibrancy]) {
        -[UIView _invalidateTraitCollectionAsRoot]((uint64_t)v15);
      }
    }
  }
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIView *)self traitCollection];
  contentHost = self->_contentHost;
  if (contentHost)
  {
    id v7 = [(_UIVisualEffectHost *)contentHost contentView];

    if (v7 == v4)
    {
      uint64_t v8 = [(_UIVisualEffectHost *)self->_contentHost currentEffectDescriptor];
      char v9 = [v8 textShouldRenderWithTintColor];

      if (v9)
      {
        uint64_t v10 = 2;
      }
      else
      {
        id v11 = [(_UIVisualEffectHost *)self->_backgroundHost currentEffectDescriptor];
        int v12 = [v11 allowsVibrancyInContent];

        if (!v12) {
          goto LABEL_8;
        }
        uint64_t v10 = 1;
      }
      uint64_t v13 = [v5 _traitCollectionByReplacingNSIntegerValue:v10 forTraitToken:0x1ED3F5C40];

      objc_super v5 = (void *)v13;
    }
  }
LABEL_8:
  id v14 = v5;

  return v14;
}

- (UIView)contentView
{
  [(UIVisualEffectView *)self _ensureContentHostWithView:0];
  [(_UIVisualEffectHost *)self->_contentHost setContentViewRequired:1];
  objc_super v3 = [(_UIVisualEffectHost *)self->_contentHost contentView];
  id v4 = [v3 superview];

  if (v4 != self) {
    [(UIVisualEffectView *)self _updateSubviews];
  }
  objc_super v5 = [(_UIVisualEffectHost *)self->_contentHost contentView];

  return (UIView *)v5;
}

- (void)_ensureContentHostWithView:(id)a3
{
  id v4 = a3;
  if (!self->_contentHost)
  {
    if (!v4) {
      id v4 = objc_alloc_init((Class)[(id)objc_opt_class() _contentViewClass]);
    }
    id v7 = v4;
    objc_super v5 = [[_UIVisualEffectHost alloc] initWithContentView:v4];
    contentHost = self->_contentHost;
    self->_contentHost = v5;

    [(_UIVisualEffectHost *)self->_contentHost monitorSubviewsOf:v7];
    id v4 = v7;
  }
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

- (void)_setGroupName:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = objc_loadWeakRetained((id *)&self->_captureSource);
    [v6 handleFailureInMethod:a2, self, @"UIVisualEffectView.m", 1126, @"Dependent Visual Effect Views cannot have an independently set group name. Set your group name on on '%@'", v7 object file lineNumber description];
  }
  [(_UIVisualEffectViewBackdropCaptureGroup *)self->_captureGroup setGroupName:v8];
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (NSString)_groupName
{
  v2 = [(UIVisualEffectView *)self _captureGroup];
  objc_super v3 = [v2 groupName];

  return (NSString *)v3;
}

- (_UIVisualEffectViewBackdropCaptureGroup)_captureGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v5 = [WeakRetained _captureGroup];
  }
  else
  {
    objc_super v5 = self->_captureGroup;
  }
  id v6 = v5;

  return v6;
}

- (_UIVisualEffectBackdropView)_captureView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _captureView];
  }
  else {
  objc_super v5 = [(_UIVisualEffectHost *)self->_backgroundHost captureView];
  }

  return (_UIVisualEffectBackdropView *)v5;
}

- (void)_setRenderMode:(int64_t)a3
{
  [(UIVisualEffectView *)self _ensureBackgroundHost];
  id v5 = [(_UIVisualEffectHost *)self->_backgroundHost contentView];
  [v5 setRenderMode:a3];
}

- (void)_setCaptureView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (!WeakRetained)
  {
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v12 = [MEMORY[0x1E4F28B00] currentHandler];
  id v13 = objc_loadWeakRetained((id *)&self->_captureSource);
  [v12 handleFailureInMethod:a2, self, @"UIVisualEffectView.m", 1138, @"Dependent Visual Effect Views cannot have an independently set capture view. Set your capture view on '%@'", v13 object file lineNumber description];

  if (v5) {
LABEL_3:
  }
    [(UIVisualEffectView *)self _ensureBackgroundHost];
LABEL_4:
  [(_UIVisualEffectHost *)self->_backgroundHost setCaptureView:v5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_captureDependents;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v11++) _setCaptureView:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (UIVisualEffectView)_captureSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
  return (UIVisualEffectView *)WeakRetained;
}

void __37__UIVisualEffectView__updateSubviews__block_invoke(id *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)a1[4] + 472) |= 0x20u;
  [a1[4] bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = a1[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(a1[4], "_updateSubView:frame:", v15, v3, v5, v7, v9);
        [a1[6] removeObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = a1[6];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "removeFromSuperview", (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }

  *((unsigned char *)a1[4] + 472) &= ~0x20u;
}

- (void)_setMaskView:(id)a3
{
  p_super = (UIView *)a3;
  maskView = self->_maskView;
  if (maskView) {
    BOOL v6 = maskView == p_super;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    double v7 = [(UIView *)maskView _window];

    if (v7)
    {
      -[UIView _recursivelyUpdateCachedWindowForMoveToWindow:](&self->_maskView->super.super.isa, 0);
      double v8 = self->_maskView;
      double v9 = [(UIView *)v8 _window];
      [(UIView *)v8 _didMoveFromWindow:v9 toWindow:0];
    }
  }
  if (p_super && !self->_useLiveMasking)
  {
    id v10 = [UIImageView alloc];
    [(UIView *)p_super frame];
    uint64_t v11 = -[UIImageView initWithFrame:](v10, "initWithFrame:");
    uint64_t v12 = [(UIVisualEffectView *)self _maskImageForMaskView:p_super];
    [(UIImageView *)v11 setImage:v12];

    p_super = &v11->super;
  }
  maskImage = self->_maskImage;
  self->_maskImage = 0;

  long long v14 = self->_maskView;
  self->_maskView = p_super;
  uint64_t v15 = p_super;

  *((void *)&self->super._viewFlags + 1) = *((void *)&self->super._viewFlags + 1) & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)(v15 != 0) << 21);
  id v17 = [(UIView *)self->_maskView layer];

  id v16 = [(UIView *)self layer];
  [v16 setMask:v17];
}

void __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    double v4 = *(void **)(a1 + 32);
    if (v4)
    {
      double v5 = [v4 initialValue];
      [*(id *)(a1 + 40) setBackgroundEffects:v5];
    }
    BOOL v6 = *(void **)(a1 + 48);
    if (v6)
    {
      double v7 = [v6 initialValue];
      [*(id *)(a1 + 40) setContentEffects:v7];
    }
  }
  else
  {
    if (*(void *)(a1 + 32)
      && (double v8 = *(void **)(a1 + 56),
          [*(id *)(a1 + 64) transitionEffectDescriptor],
          double v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8 == v9))
    {
      [*(id *)(a1 + 64) endTransition];
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
    }
    if (*(void *)(a1 + 48)
      && (uint64_t v11 = *(void **)(a1 + 72),
          [*(id *)(a1 + 80) transitionEffectDescriptor],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11 == v12))
    {
      [*(id *)(a1 + 80) endTransition];
    }
    else if (!v10)
    {
      return;
    }
  }
  uint64_t v13 = *(void **)(a1 + 40);
  [v13 _updateSubviews];
}

- (void)_generateBackgroundEffects:(id)a3 contentEffects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6)
  {
    [(UIVisualEffectView *)self _ensureBackgroundHost];
    double v9 = [v6 animationFrames];
    int v10 = [v9 lastObject];
    uint64_t v11 = [v10 value];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
    uint64_t v13 = WeakRetained;
    if (WeakRetained)
    {
      long long v14 = [WeakRetained _effectDescriptorForEffects:v11 usage:1];
      uint64_t v15 = [v13 _captureGroup];
      [(_UIVisualEffectHost *)self->_backgroundHost setPrimaryCaptureGroup:v15];
      id v16 = [(_UIVisualEffectHost *)self->_backgroundHost contentView];
      [v16 setCaptureGroup:v15];
    }
    else
    {
      long long v14 = [(UIVisualEffectView *)self _effectDescriptorForEffects:v11 usage:1];
      [(_UIVisualEffectHost *)self->_backgroundHost setPrimaryCaptureGroup:self->_captureGroup];
      captureGroup = self->_captureGroup;
      uint64_t v15 = [(_UIVisualEffectHost *)self->_backgroundHost contentView];
      [v15 setCaptureGroup:captureGroup];
    }

    id v17 = self->_backgroundHost;
    uint64_t v21 = [v14 layerHitTestsAsOpaque];
    long long v22 = [(UIView *)self layer];
    [v22 setHitTestsAsOpaque:v21];

    if (v8) {
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_9;
  }
  long long v14 = 0;
  id v17 = 0;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_8:
  long long v23 = [v8 animationFrames];
  long long v24 = [v23 lastObject];
  long long v25 = [v24 value];
  uint64_t v19 = [(UIVisualEffectView *)self _effectDescriptorForEffects:v25 usage:2];

  [(UIVisualEffectView *)self _ensureContentHostWithView:0];
  uint64_t v18 = self->_contentHost;
LABEL_9:
  [(_UIVisualEffectHost *)v17 prepareToTransitionToEffectDescriptor:v14];
  [(_UIVisualEffectHost *)v18 prepareToTransitionToEffectDescriptor:v19];
  [(UIVisualEffectView *)self _updateSubviews];
  if (v6)
  {
    long long v26 = [v6 animationFrames];
    uint64_t v27 = [v26 count] - 1;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke;
    v48[3] = &unk_1E52DD7D0;
    v49 = v17;
    [v6 animateFrameAtIndex:v27 animations:v48];
  }
  if (v8)
  {
    long long v28 = [v8 animationFrames];
    uint64_t v29 = [v28 count] - 1;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_2;
    v46[3] = &unk_1E52DD7D0;
    v47 = v18;
    [v8 animateFrameAtIndex:v29 animations:v46];
  }
  uint64_t v30 = [(_UIVisualEffectHost *)v17 transitionEffectDescriptor];
  uint64_t v31 = [(_UIVisualEffectHost *)v18 transitionEffectDescriptor];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_3;
  v38[3] = &unk_1E52DD820;
  id v39 = v6;
  v40 = self;
  id v41 = v8;
  id v42 = v30;
  v43 = v17;
  id v44 = v31;
  v45 = v18;
  v32 = v18;
  id v33 = v31;
  v34 = v17;
  id v35 = v30;
  id v36 = v8;
  id v37 = v6;
  +[UIView _addCompletionWithPosition:v38];
}

- (void)_generateEffectAnimations:(id)a3
{
  id v4 = a3;
  double v5 = [v4 animationFrames];
  uint64_t v6 = [v5 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    do
    {
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __48__UIVisualEffectView__generateEffectAnimations___block_invoke;
      v13[3] = &unk_1E52DD7D0;
      v13[4] = self;
      [v4 animateFrameAtIndex:v8++ animations:v13];
    }
    while (v7 != v8);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__UIVisualEffectView__generateEffectAnimations___block_invoke_2;
  v11[3] = &unk_1E52DD7F8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  +[UIView _addCompletionWithPosition:v11];
}

- (void)_generateDeferredAnimations:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UIVisualEffectView;
  id v4 = a3;
  [(UIView *)&v15 _generateDeferredAnimations:v4];
  double v5 = [(_UIVisualEffectEnvironment *)self->_environment traitCollection];

  if (!v5)
  {
    uint64_t v6 = [(UIView *)self traitCollection];
    [(_UIVisualEffectEnvironment *)self->_environment setTraitCollection:v6];
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"backgroundEffects"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"contentEffects"];
  uint64_t v9 = [v4 objectForKeyedSubscript:@"effect"];

  if (v7 || v8 || v9)
  {
    if (!v9
      || ([v9 animationFrames],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unint64_t v11 = [v10 count],
          v10,
          v11 > 2))
    {
      id v12 = [v7 animationFrames];
      if ((unint64_t)[v12 count] >= 3)
      {
      }
      else
      {
        uint64_t v13 = [v8 animationFrames];
        unint64_t v14 = [v13 count];

        if (v14 <= 2)
        {
          [(UIVisualEffectView *)self _generateBackgroundEffects:v7 contentEffects:v8];
          goto LABEL_14;
        }
      }
      NSLog(&cfstr_TrueKeyframeAn.isa);
      goto LABEL_14;
    }
    [(UIVisualEffectView *)self _generateEffectAnimations:v9];
  }
LABEL_14:
}

void __48__UIVisualEffectView__generateEffectAnimations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  double v3 = [a2 value];
  _UIVisualEffectViewUpgradeLegacyEffect(v3, &v7, &v6);

  id v4 = v6;
  [*(id *)(a1 + 32) setContentEffects:v6];
  id v5 = v7;
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundEffects:");
}

uint64_t __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginTransition];
}

- (void)dealloc
{
  [(UIVisualEffectView *)self _unregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)UIVisualEffectView;
  [(UIView *)&v3 dealloc];
}

- (void)_unregisterNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityReduceTransparencyStatusDidChangeNotification" object:0];
}

- (void)_setCornerRadius:(double)a3
{
}

- (void)_setAllowsGroupFiltering:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 && !self->_contentHost) {
    [(UIVisualEffectView *)self _ensureContentHostWithView:0];
  }
  id v5 = [(_UIVisualEffectHost *)self->_contentHost contentView];
  [v5 setDisableGroupFiltering:!v3];
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (void)_addCaptureDependent:(id)a3
{
  id v10 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIVisualEffectView.m" lineNumber:1203 description:@"UIVisualEffectView does not support multi-level capture dependents"];
  }
  if ([v10[54] count])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIVisualEffectView.m", 1204, @"Multi-level capture dependencies are not supported (visual effect view %@ has capture dependents)", v10 object file lineNumber description];
  }
  uint64_t v6 = (UIVisualEffectView *)objc_loadWeakRetained(v10 + 61);
  uint64_t v7 = v6;
  if (v6 != self)
  {
    if (v6) {
      _UIVisualEffectViewRemoveDependent(v6, v10);
    }
    [(NSMutableArray *)self->_captureDependents addObject:v10];
    _UIVisualEffectViewConfigureDependent(self, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->__cornerMask, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_destroyWeak((id *)&self->_captureSource);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contentHost, 0);
  objc_storeStrong((id *)&self->_backgroundHost, 0);
  objc_storeStrong((id *)&self->_captureDependents, 0);
  objc_storeStrong((id *)&self->_captureGroup, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
}

- (void)_removeCaptureDependent:(id)a3
{
  uint64_t v8 = (id *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIVisualEffectView.m" lineNumber:1218 description:@"UIVisualEffectView does not support multi-level capture dependents"];
  }
  uint64_t v6 = (UIVisualEffectView *)objc_loadWeakRetained(v8 + 61);

  if (v6 == self) {
    _UIVisualEffectViewRemoveDependent(self, v8);
  }
}

- (void)_setUseLiveMasking:(BOOL)a3
{
  self->_useLiveMasking = a3;
}

- (void)_updateEffectForAccessibilityChanges:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__UIVisualEffectView__updateEffectForAccessibilityChanges___block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(UIVisualEffectView *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v4];
  [(UIVisualEffectView *)self _configureEffects];
}

uint64_t __59__UIVisualEffectView__updateEffectForAccessibilityChanges___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) traitCollection];
  if ([v2 userInterfaceIdiom] == 3)
  {
    [*(id *)(*(void *)(a1 + 32) + 456) setReducedTransperancy:0];
  }
  else
  {
    BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 456) traitCollection];
    BOOL v4 = [v3 userInterfaceIdiom] != 6 && _AXSEnhanceBackgroundContrastEnabled() != 0;
    [*(id *)(*(void *)(a1 + 32) + 456) setReducedTransperancy:v4];
  }
  BOOL v5 = _AXSReduceMotionEnabled() != 0;
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 456);
  return [v6 setReducedMotion:v5];
}

- (UIVisualEffectView)initWithCoder:(NSCoder *)coder
{
  BOOL v4 = coder;
  v22.receiver = self;
  v22.super_class = (Class)UIVisualEffectView;
  BOOL v5 = [(UIView *)&v22 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(UIVisualEffectView *)v5 _commonInit];
    uint64_t v7 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIVisualEffectViewEffect"];
    uint64_t v8 = [v7 copy];
    effect = v6->_effect;
    v6->_effect = (UIVisualEffect *)v8;

    if (!v6->_effect)
    {
      id v10 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIVisualEffectViewContentEffects"];
      uint64_t v11 = [v10 copy];
      id v12 = (void *)v11;
      uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
      if (v11) {
        unint64_t v14 = (void *)v11;
      }
      else {
        unint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&v6->_contentEffects, v14);

      objc_super v15 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIVisualEffectViewBackgroundEffects"];
      uint64_t v16 = [v15 copy];
      id v17 = (void *)v16;
      if (v16) {
        uint64_t v18 = (void *)v16;
      }
      else {
        uint64_t v18 = v13;
      }
      objc_storeStrong((id *)&v6->_backgroundEffects, v18);
    }
    uint64_t v19 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIVisualEffectViewGroupName"];
    [(_UIVisualEffectViewBackdropCaptureGroup *)v6->_captureGroup setGroupName:v19];

    long long v20 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIVisualEffectViewContentView"];
    if (v20)
    {
      [(UIVisualEffectView *)v6 _ensureContentHostWithView:v20];
      [(_UIVisualEffectHost *)v6->_contentHost setContentViewRequired:1];
    }
    if (v6->_effect)
    {
      [(UIVisualEffectView *)v6 _updateEffectsFromLegacyEffect];
    }
    else
    {
      *(unsigned char *)&v6->_unsigned int effectViewFlags = *(unsigned char *)&v6->_effectViewFlags & 0xFE | ([(NSArray *)v6->_backgroundEffects count] != 0);
      *(unsigned char *)&v6->_unsigned int effectViewFlags = *(unsigned char *)&v6->_effectViewFlags & 0xFD | (2
                                                                                * ([(NSArray *)v6->_contentEffects count] != 0));
      [(UIVisualEffectView *)v6 _configureEffects];
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIVisualEffectView;
  [(UIView *)&v9 encodeWithCoder:v4];
  effect = self->_effect;
  if (effect)
  {
    uint64_t v6 = @"UIVisualEffectViewEffect";
  }
  else
  {
    [v4 encodeObject:self->_contentEffects forKey:@"UIVisualEffectViewContentEffects"];
    effect = self->_backgroundEffects;
    uint64_t v6 = @"UIVisualEffectViewBackgroundEffects";
  }
  [v4 encodeObject:effect forKey:v6];
  uint64_t v7 = [(_UIVisualEffectViewBackdropCaptureGroup *)self->_captureGroup groupName];
  [v4 encodeObject:v7 forKey:@"UIVisualEffectViewGroupName"];

  uint64_t v8 = [(_UIVisualEffectHost *)self->_contentHost contentView];
  [v4 encodeObject:v8 forKey:@"UIVisualEffectViewContentView"];
}

- (void)respondToSettingsUpdate
{
  *(unsigned char *)&self->_effectViewFlags |= 1u;
  [(UIVisualEffectView *)self _configureEffects];
}

uint64_t __64__UIVisualEffectView__generateBackgroundEffects_contentEffects___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginTransition];
}

- (NSArray)_captureDependents
{
  double v2 = (void *)[(NSMutableArray *)self->_captureDependents copy];
  return (NSArray *)v2;
}

- (void)_setCaptureDependents:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);

  if (WeakRetained)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"UIVisualEffectView.m" lineNumber:1177 description:@"UIVisualEffectView does not support multi-level capture dependents"];
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    uint64_t v7 = v5;
  }
  id v8 = v7;

  if (([(NSMutableArray *)self->_captureDependents isEqualToArray:v8] & 1) == 0)
  {
    SEL v28 = a2;
    objc_super v9 = [(_UIVisualEffectViewBackdropCaptureGroup *)self->_captureGroup groupName];

    if (!v9)
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"UIVisualEffectViewCaptureGroupName(%p)", self->_captureGroup);
      [(_UIVisualEffectViewBackdropCaptureGroup *)self->_captureGroup setGroupName:v10];
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v11 = self->_captureDependents;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_storeWeak((id *)(*(void *)(*((void *)&v33 + 1) + 8 * i) + 488), 0);
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);
    }

    uint64_t v16 = (NSMutableArray *)[v8 mutableCopy];
    captureDependents = self->_captureDependents;
    self->_captureDependents = v16;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v18 = self->_captureDependents;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(id **)(*((void *)&v29 + 1) + 8 * v22);
          if ([v23[54] count])
          {
            long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
            [v26 handleFailureInMethod:v28, self, @"UIVisualEffectView.m", 1188, @"Multi-level capture dependencies are not supported (visual effect view %@ has capture dependents)", v23 object file lineNumber description];
          }
          long long v24 = (UIVisualEffectView *)objc_loadWeakRetained(v23 + 61);
          long long v25 = v24;
          if (v24 != self)
          {
            if (v24) {
              _UIVisualEffectViewRemoveDependent(v24, v23);
            }
            _UIVisualEffectViewConfigureDependent(self, v23);
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }
  }
}

- (int64_t)_renderMode
{
  backgroundHost = self->_backgroundHost;
  if (!backgroundHost) {
    return 0;
  }
  BOOL v3 = [(_UIVisualEffectHost *)backgroundHost contentView];
  id v4 = [v3 superview];

  if (v4) {
    id v4 = (void *)[v3 renderMode];
  }

  return (int64_t)v4;
}

- (double)_cornerRadius
{
  cornerMask = self->__cornerMask;
  if (!cornerMask) {
    return 0.0;
  }
  [(_UIVisualEffectViewCornerMask *)cornerMask radius];
  return result;
}

- (double)_continuousCornerRadius
{
  cornerMask = self->__cornerMask;
  if (!cornerMask) {
    return 0.0;
  }
  [(_UIVisualEffectViewCornerMask *)cornerMask radius];
  return result;
}

- (id)_cornerCurve
{
  id v3 = (id)*MEMORY[0x1E4F39EA0];
  if ([(_UIVisualEffectViewCornerMask *)self->__cornerMask cornersAreContinuous])
  {
    id v4 = (id)*MEMORY[0x1E4F39EA8];

    id v3 = v4;
  }
  return v3;
}

- (BOOL)_isNoiseEnabled
{
  return 0;
}

- (BOOL)allowsDithering
{
  return (*(unsigned char *)&self->_effectViewFlags >> 2) & 1;
}

- (void)setAllowsDithering:(BOOL)a3
{
  char effectViewFlags = (char)self->_effectViewFlags;
  if (((((effectViewFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_char effectViewFlags = effectViewFlags & 0xFB | v5;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__UIVisualEffectView_setAllowsDithering___block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [(UIVisualEffectView *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v6];
    [(UIVisualEffectView *)self _configureEffects];
  }
}

uint64_t __41__UIVisualEffectView_setAllowsDithering___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAllowsDithering:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 472) >> 2) & 1];
}

- (BOOL)allowsBlurring
{
  return [(UIVisualEffectView *)self blurQuality] != -1;
}

- (void)setAllowsBlurring:(BOOL)a3
{
}

- (void)setBlurQuality:(int64_t)a3
{
  if (self->_blurQuality != a3)
  {
    self->_blurQualitdouble y = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__UIVisualEffectView_setBlurQuality___block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    [(UIVisualEffectView *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v4];
    [(UIVisualEffectView *)self _configureEffects];
  }
}

uint64_t __37__UIVisualEffectView_setBlurQuality___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setBlurQuality:*(void *)(*(void *)(a1 + 32) + 528)];
}

- (id)_maskImageForMaskView:(id)a3
{
  id v3 = a3;
  id v4 = +[UIGraphicsImageRendererFormat preferredFormat];
  [v4 setPreferredRange:0x7FFFLL];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = -[UIGraphicsImageRenderer initWithBounds:format:]([UIGraphicsImageRenderer alloc], "initWithBounds:format:", v4, v5, v7, v9, v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__UIVisualEffectView__maskImageForMaskView___block_invoke;
  v17[3] = &unk_1E52DD848;
  id v18 = v3;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  id v14 = v3;
  objc_super v15 = [(UIGraphicsImageRenderer *)v13 imageWithActions:v17];

  return v15;
}

uint64_t __44__UIVisualEffectView__maskImageForMaskView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawViewHierarchyInRect:afterScreenUpdates:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_setMaskImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_maskImage != v5)
  {
    double v12 = v5;
    objc_storeStrong((id *)&self->_maskImage, a3);
    double v6 = [UIImageView alloc];
    [(UIView *)self bounds];
    double v7 = -[UIImageView initWithFrame:](v6, "initWithFrame:");
    [(UIView *)v7 setImage:self->_maskImage];
    maskView = self->_maskView;
    self->_maskView = v7;
    double v9 = v7;

    double v10 = [(UIView *)self->_maskView layer];

    double v11 = [(UIView *)self layer];
    [v11 setMask:v10];

    double v5 = v12;
  }
}

- (UIImage)_maskImage
{
  return self->_maskImage;
}

- (BOOL)_allowsGroupFiltering
{
  double v2 = [(_UIVisualEffectHost *)self->_contentHost contentView];
  char v3 = [v2 disableGroupFiltering] ^ 1;

  return v3;
}

- (BOOL)_isContentViewStatic
{
  return *(unsigned char *)&self->_effectViewFlags >> 7;
}

- (id)_obtainDynamicContentAssertionForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:0 initialState:1 reason:a3];
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return ![(UIVisualEffectView *)self _isContentViewStatic];
  }
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (!a4) {
    [(UIVisualEffectView *)self _setIsContentViewStatic:!a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_debug
{
  uint64_t v3 = NSString;
  backgroundEffects = self->_backgroundEffects;
  backgroundHost = self->_backgroundHost;
  contentEffects = self->_contentEffects;
  contentHost = self->_contentHost;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureSource);
  double v9 = [v3 stringWithFormat:@"backgroundEffects=%@ backgroundHost=%@ contentEffects=%@ contentHost=%@ capture=(source=%@, dependents=%@)", backgroundEffects, backgroundHost, contentEffects, contentHost, WeakRetained, self->_captureDependents];

  return v9;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIVisualEffectView;
  uint64_t v3 = [(UIView *)&v6 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if ([(_UIVisualEffectHost *)self->_contentHost contentViewRequired]) {
    [v4 appendString:@" clientRequestedContentView"];
  }
  if (self->_effect) {
    [v4 appendFormat:@" effect=%@", self->_effect];
  }
  else {
    [v4 appendString:@" effect=none"];
  }
  return (NSString *)v4;
}

- (id)_whatsWrongWithThisEffect
{
  return @"Nothing appears to be wrong\n";
}

- (void)_setBackdropViewBackgroundColorAlpha:(double)a3
{
  if (a3 <= 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  }
  *(unsigned char *)&self->_char effectViewFlags = *(unsigned char *)&self->_effectViewFlags & 0xBF | ((v4 != 0) << 6);
  id v5 = v4;
  objc_setAssociatedObject(self, &_UIVisualEffectViewBackdropViewBackgroundColorAlpha, v4, (void *)0x301);
}

- (double)_backdropViewBackgroundColorAlpha
{
  if ((*(unsigned char *)&self->_effectViewFlags & 0x40) == 0) {
    return 0.0;
  }
  uint64_t v3 = objc_getAssociatedObject(self, &_UIVisualEffectViewBackdropViewBackgroundColorAlpha);
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)_setUseReducedTransparencyForContentEffects:(BOOL)a3
{
  char effectViewFlags = (char)self->_effectViewFlags;
  if (((((effectViewFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char effectViewFlags = effectViewFlags & 0xEF | v4;
    if (a3) {
      [(UIVisualEffectView *)self _updateEffectForReducedTransparency];
    }
    else {
      [(UIVisualEffectView *)self _resetEffect];
    }
  }
}

- (BOOL)_useReducedTransparencyForContentEffects
{
  return (*(unsigned char *)&self->_effectViewFlags >> 4) & 1;
}

- (void)_updateEffectForSnapshotWillBegin:(id)a3
{
  char v4 = [(UIView *)self window];

  if (v4)
  {
    [(UIVisualEffectView *)self _updateEffectBackgroundColor];
    [(UIVisualEffectView *)self _updateEffectForReducedTransparency];
  }
}

- (void)_updateEffectForSnapshotDidEnd:(id)a3
{
  char v4 = [(UIView *)self window];

  if (v4)
  {
    [(UIVisualEffectView *)self _resetEffect];
  }
}

- (void)_updateEffectBackgroundColor
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v5 = self->_backgroundEffects;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "_isATVStyle", (void)v16)
            && [v10 _isAutomaticStyle])
          {
            if (v4 == 1000 || v4 == 2) {
              double v12 = 0.0;
            }
            else {
              double v12 = 0.7;
            }
            [(UIVisualEffectView *)self _backdropViewBackgroundColorAlpha];
            id v14 = +[UIColor colorWithWhite:v12 alpha:v13];
            objc_super v15 = [(_UIVisualEffectHost *)self->_backgroundHost contentView];
            [v15 setBackgroundColor:v14];

            goto LABEL_19;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
}

- (void)_resetEffect
{
  uint64_t v3 = [(_UIVisualEffectHost *)self->_backgroundHost contentView];
  [v3 setBackgroundColor:0];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__UIVisualEffectView__resetEffect__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [(UIVisualEffectView *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v4];
  *(unsigned char *)&self->_char effectViewFlags = *(unsigned char *)&self->_effectViewFlags & 0xED | 2;
  [(UIVisualEffectView *)self _configureEffects];
}

uint64_t __34__UIVisualEffectView__resetEffect__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setUseSimpleVibrancy:0];
}

- (void)_updateEffectForReducedTransparency
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__UIVisualEffectView__updateEffectForReducedTransparency__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(UIVisualEffectView *)self _updateEnvironmentAndFlagUpdatesIfNecessary:v3];
  *(unsigned char *)&self->_effectViewFlags |= 0x10u;
  [(UIVisualEffectView *)self _configureEffects];
}

uint64_t __57__UIVisualEffectView__updateEffectForReducedTransparency__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setUseSimpleVibrancy:1];
}

- (id)_contentHost
{
  return self->_contentHost;
}

- (id)_backgroundHost
{
  return self->_backgroundHost;
}

- (id)_environment
{
  return self->_environment;
}

- (_UIVisualEffectViewCornerMask)_cornerMask
{
  return self->__cornerMask;
}

- (NSArray)contentEffects
{
  return self->_contentEffects;
}

- (BOOL)_useLiveMasking
{
  return self->_useLiveMasking;
}

- (int64_t)blurQuality
{
  return self->_blurQuality;
}

- (id)_colorViewBoundsOverlayCreateIfNecessary:(BOOL)a3
{
  return 0;
}

@end