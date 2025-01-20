@interface _UIFloatingContentView
+ (id)_defaultFocusAnimationConfiguration;
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (BOOL)_disableOutsetShadowPath;
- (BOOL)_shouldAppearToFloatForPrimaryState:(unint64_t)a3;
- (BOOL)_shouldApplyCornerRadiusForPrimaryState:(unint64_t)a3;
- (BOOL)clipsContentToBounds;
- (BOOL)forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview;
- (BOOL)isContentOpaque;
- (BOOL)isContinuousCornerEnabled;
- (BOOL)isShadowEnabled;
- (BOOL)roundContentWhenDeselected;
- (BOOL)scalesBackwards;
- (BOOL)showsHighContrastFocusIndicator;
- (BOOL)useShadowImage;
- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4;
- (CGPoint)focusScaleAnchorPoint;
- (CGPoint)highContrastFocusIndicatorOutset;
- (CGRect)shadowContentsCenter;
- (CGSize)asymmetricFocusedSizeIncrease;
- (CGSize)asymmetricScaleFactor;
- (CGSize)shadowExpansion;
- (CGSize)shadowSize;
- (CGSize)unfocusedShadowExpansion;
- (NSString)cornerCurve;
- (UIImage)shadowImage;
- (UIView)contentView;
- (UIView)highlightView;
- (UIView)transformView;
- (UIView)visualEffectContainerView;
- (_UIFloatingContentView)initWithFrame:(CGRect)a3;
- (_UIFloatingContentViewDelegate)floatingContentDelegate;
- (_UIFloatingMotionConfiguration)contentMotion;
- (_UIFocusAnimationConfiguration)focusAnimationConfiguration;
- (double)_currentShadowOpacity;
- (double)_effectiveShadowOpacity;
- (double)_effectiveShadowRadius;
- (double)cornerRadius;
- (double)focusedSizeIncrease;
- (double)highContrastFocusIndicatorCornerRadius;
- (double)scaleFactor;
- (double)shadowOpacity;
- (double)shadowOpacityForUserInterfaceStyle:(int64_t)a3;
- (double)shadowRadius;
- (double)shadowVerticalOffset;
- (double)unfocusedShadowOpacity;
- (double)unfocusedShadowRadius;
- (double)unfocusedShadowVerticalOffset;
- (double)visualEffectContainerViewScaleFactor;
- (id)_focusedFrameGuide;
- (id)_focusedFrameGuideCreateIfNecessary:(BOOL)a3;
- (id)backgroundColorForState:(unint64_t)a3;
- (id)focusAnimationConfigurationHandler;
- (int64_t)highlightStyle;
- (unint64_t)_primaryStateForState:(unint64_t)a3;
- (unint64_t)controlState;
- (void)_installContentMotionEffects;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_layoutContentView;
- (void)_layoutHighContrastFocusIndicator;
- (void)_layoutShadow;
- (void)_setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)_setShadowImageIfNeeded;
- (void)_uninstallContentMotionEffects;
- (void)_updateContainerLayerQualityForPrimaryState:(unint64_t)a3;
- (void)_updateCornerRadiusLayers;
- (void)_updateFocusedFrameGuideConstraintsIfApplicable;
- (void)_updateHighContrastFocusIndicatorForPrimaryState:(unint64_t)a3;
- (void)_updateHighContrastFocusIndicatorView;
- (void)_updateHighlightViewForPrimaryState:(unint64_t)a3;
- (void)_updateScaleFactor;
- (void)_updateShadowContentsScaleForPrimaryState:(unint64_t)a3;
- (void)_updateShadowLayer;
- (void)_updateShadowOpacityForPrimaryState:(unint64_t)a3;
- (void)_updateTransformForPrimaryState:(unint64_t)a3;
- (void)addContentMotionEffect:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeContentMotionEffect:(id)a3;
- (void)setAsymmetricFocusedSizeIncrease:(CGSize)a3;
- (void)setAsymmetricScaleFactor:(CGSize)a3;
- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4;
- (void)setBounds:(CGRect)a3;
- (void)setClipsContentToBounds:(BOOL)a3;
- (void)setContentMotion:(id)a3;
- (void)setContentMotionRotation:(CGPoint)a3 translation:(CGPoint)a4;
- (void)setContentOpaque:(BOOL)a3;
- (void)setContinuousCornerEnabled:(BOOL)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setCornerCurve:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFloatingContentDelegate:(id)a3;
- (void)setFocusAnimationConfiguration:(id)a3;
- (void)setFocusAnimationConfigurationHandler:(id)a3;
- (void)setFocusScaleAnchorPoint:(CGPoint)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setForwardsSubviewIntrinsicContentSizeInvalidationsToSuperview:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighContrastFocusIndicatorCornerRadius:(double)a3;
- (void)setHighContrastFocusIndicatorOutset:(CGPoint)a3;
- (void)setHighlightStyle:(int64_t)a3;
- (void)setRoundContentWhenDeselected:(BOOL)a3;
- (void)setScaleFactor:(double)a3;
- (void)setScalesBackwards:(BOOL)a3;
- (void)setShadowContentsCenter:(CGRect)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setShadowExpansion:(CGSize)a3;
- (void)setShadowImage:(id)a3;
- (void)setShadowImage:(id)a3 stretchable:(BOOL)a4;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowOpacity:(double)a3 forUserInterfaceStyle:(int64_t)a4;
- (void)setShadowRadius:(double)a3;
- (void)setShadowSize:(CGSize)a3;
- (void)setShadowVerticalOffset:(double)a3;
- (void)setShowsHighContrastFocusIndicator:(BOOL)a3;
- (void)setUnfocusedShadowExpansion:(CGSize)a3;
- (void)setUnfocusedShadowOpacity:(double)a3;
- (void)setUnfocusedShadowRadius:(double)a3;
- (void)setUnfocusedShadowVerticalOffset:(double)a3;
- (void)setUseShadowImage:(BOOL)a3;
- (void)setVisualEffectContainerViewScaleFactor:(double)a3;
- (void)set_disableOutsetShadowPath:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _UIFloatingContentView

- (_UIFloatingContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)_UIFloatingContentView;
  v7 = -[UIView initWithFrame:](&v19, sel_initWithFrame_);
  if (v7)
  {
    v7->_backgroundColorsByState = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
    [(UIView *)v7 setOpaque:0];
    v8 = -[UIView initWithFrame:]([_UIFloatingContentTransformView alloc], "initWithFrame:", x, y, width, height);
    transformView = v7->_transformView;
    v7->_transformView = v8;

    [(UIView *)v7->_transformView setClipsToBounds:0];
    [(UIView *)v7 addSubview:v7->_transformView];
    v10 = -[UIView initWithFrame:]([_UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView alloc], "initWithFrame:", x, y, width, height);
    containerView = v7->_containerView;
    v7->_containerView = v10;

    [(UIView *)v7->_containerView setOpaque:0];
    [(UIView *)v7->_containerView setBackgroundColor:0];
    [(UIView *)v7->_transformView addSubview:v7->_containerView];
    v12 = -[UIView initWithFrame:]([_UIFloatingContentCornerRadiusAnimatingView alloc], "initWithFrame:", x, y, width, height);
    highlightView = v7->_highlightView;
    v7->_highlightView = v12;

    [(UIView *)v7->_containerView addSubview:v7->_highlightView];
    [(UIView *)v7 setEdgesPreservingSuperviewLayoutMargins:15];
    [(UIView *)v7->_transformView setEdgesPreservingSuperviewLayoutMargins:15];
    [(UIView *)v7->_containerView setEdgesPreservingSuperviewLayoutMargins:15];
    [(UIView *)v7->_highlightView setEdgesPreservingSuperviewLayoutMargins:15];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40___UIFloatingContentView_initWithFrame___block_invoke;
    v17[3] = &unk_1E52D9F70;
    v14 = v7;
    v18 = v14;
    +[UIView _performSystemAppearanceModifications:v17];
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v14 selector:sel__updateHighContrastFocusIndicatorView name:@"UIAccessibilityHighContrastFocusIndicatorChangedNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  backgroundColorsByState = self->_backgroundColorsByState;
  if (backgroundColorsByState) {
    CFRelease(backgroundColorsByState);
  }
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIAccessibilityHighContrastFocusIndicatorChangedNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingContentView;
  [(UIView *)&v5 dealloc];
}

- (_UIFloatingContentViewDelegate)floatingContentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingContentViewDelegate);
  return (_UIFloatingContentViewDelegate *)WeakRetained;
}

- (void)setFloatingContentDelegate:(id)a3
{
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5 = a3;
  if ([(_UIFloatingContentView *)self _shouldAppearToFloatForPrimaryState:[(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]]])
  {
    v6 = [v5 objectForKey:@"focusDirectionX"];
    [v6 doubleValue];
    CGFloat v8 = v7;
    v9 = [v5 objectForKey:@"focusDirectionY"];
    [v9 doubleValue];
    self->_focusDirection.double x = v8;
    self->_focusDirection.double y = v10;

    [(_UIFloatingContentView *)self _updateTransformForPrimaryState:[(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]]];
  }

  return 1;
}

- (void)setContentMotion:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = (_UIFloatingMotionConfiguration *)a3;
  v6 = v5;
  if (self->_contentMotion != v5 && !-[_UIFloatingMotionConfiguration isEqual:](v5, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_contentMotion, a3);
    [(_UIFloatingMotionConfiguration *)v6 rotation];
    self->_contentRotation.double x = v7;
    self->_contentRotation.double y = v8;
    [(_UIFloatingMotionConfiguration *)v6 translation];
    self->_contentTranslation.double x = v9;
    self->_contentTranslation.double y = v10;
    [(NSMutableArray *)self->_contentMotionEffects removeAllObjects];
    v11 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"focusDirectionX" type:0];
    [(UIInterpolatingMotionEffect *)v11 setMinimumRelativeValue:&unk_1ED3F1B58];
    [(UIInterpolatingMotionEffect *)v11 setMaximumRelativeValue:&unk_1ED3F1B68];
    v12 = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"focusDirectionY" type:1];
    [(UIInterpolatingMotionEffect *)v12 setMinimumRelativeValue:&unk_1ED3F1B58];
    [(UIInterpolatingMotionEffect *)v12 setMaximumRelativeValue:&unk_1ED3F1B68];
    v13 = objc_alloc_init(UIMotionEffectGroup);
    v15[0] = v11;
    v15[1] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [(UIMotionEffectGroup *)v13 setMotionEffects:v14];

    [(_UIFloatingContentView *)self addContentMotionEffect:v13];
  }
}

- (void)setContentMotionRotation:(CGPoint)a3 translation:(CGPoint)a4
{
  id v5 = -[_UIFloatingMotionConfiguration _initWithTranslation:rotation:]([_UIFloatingMotionConfiguration alloc], "_initWithTranslation:rotation:", a4.x, a4.y, a3.x, a3.y);
  [(_UIFloatingContentView *)self setContentMotion:v5];
}

- (void)addContentMotionEffect:(id)a3
{
  id v4 = a3;
  contentMotionEffects = self->_contentMotionEffects;
  id v8 = v4;
  if (!contentMotionEffects)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    CGFloat v7 = self->_contentMotionEffects;
    self->_contentMotionEffects = v6;

    id v4 = v8;
    contentMotionEffects = self->_contentMotionEffects;
  }
  [(NSMutableArray *)contentMotionEffects addObject:v4];
}

- (void)removeContentMotionEffect:(id)a3
{
}

- (void)_installContentMotionEffects
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_contentMotionEffects;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        CGFloat v9 = [(UIView *)self motionEffects];
        char v10 = [v9 containsObject:v8];

        if ((v10 & 1) == 0) {
          [(UIView *)self addMotionEffect:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_uninstallContentMotionEffects
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_contentMotionEffects;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        CGFloat v9 = [(UIView *)self motionEffects];
        int v10 = [v9 containsObject:v8];

        if (v10) {
          [(UIView *)self removeMotionEffect:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (unint64_t)_primaryStateForState:(unint64_t)a3
{
  return +[UIControl _primaryStateForState:a3];
}

- (BOOL)_shouldApplyCornerRadiusForPrimaryState:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 || self->_roundContentWhenDeselected;
}

- (BOOL)_shouldAppearToFloatForPrimaryState:(unint64_t)a3
{
  return a3 == 8 || a3 == 1;
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    uint64_t v4 = [UIView alloc];
    [(UIView *)self bounds];
    uint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    uint64_t v6 = self->_contentView;
    self->_contentView = v5;

    [(UIView *)self->_contentView setEdgesPreservingSuperviewLayoutMargins:15];
    [(UIView *)self->_containerView addSubview:self->_contentView];
    [(UIView *)self setNeedsLayout];
    contentView = self->_contentView;
  }
  return contentView;
}

- (UIView)visualEffectContainerView
{
  visualEffectContainerView = self->_visualEffectContainerView;
  if (!visualEffectContainerView)
  {
    uint64_t v4 = [_UIFloatingContentCornerRadiusAnimatingView alloc];
    [(UIView *)self bounds];
    uint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    uint64_t v6 = self->_visualEffectContainerView;
    self->_visualEffectContainerView = v5;

    [(UIView *)self->_visualEffectContainerView setEdgesPreservingSuperviewLayoutMargins:15];
    [(UIView *)self->_visualEffectContainerView setOpaque:0];
    [(UIView *)self->_visualEffectContainerView setBackgroundColor:0];
    uint64_t v7 = [(UIView *)self->_visualEffectContainerView layer];
    [v7 setCornerCurve:self->_cornerCurve];

    uint64_t v8 = [(UIView *)self->_visualEffectContainerView layer];
    [v8 setCornerRadius:self->_cornerRadius];

    CGFloat v9 = [(UIView *)self->_visualEffectContainerView layer];
    [v9 setAllowsGroupOpacity:0];

    int v10 = [(UIView *)self->_visualEffectContainerView layer];
    [v10 setAllowsGroupBlending:0];

    [(UIView *)self->_visualEffectContainerView setClipsToBounds:0];
    [(UIView *)self->_visualEffectContainerView setAlpha:1.0];
    [(UIView *)self->_transformView insertSubview:self->_visualEffectContainerView below:self->_containerView];
    visualEffectContainerView = self->_visualEffectContainerView;
  }
  return (UIView *)visualEffectContainerView;
}

- (UIView)highlightView
{
  return (UIView *)self->_highlightView;
}

- (UIView)transformView
{
  return (UIView *)self->_transformView;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(_UIFloatingContentView *)self _updateCornerRadiusLayers];
  }
}

- (void)setCornerCurve:(id)a3
{
  if (self->_cornerCurve != a3)
  {
    self->_cornerCurve = (NSString *)a3;
    [(_UIFloatingContentView *)self _updateCornerRadiusLayers];
  }
}

- (BOOL)isContinuousCornerEnabled
{
  return self->_cornerCurve == (NSString *)*MEMORY[0x1E4F39EA8];
}

- (void)setContinuousCornerEnabled:(BOOL)a3
{
  v3 = (void *)MEMORY[0x1E4F39EA8];
  if (!a3) {
    v3 = (void *)MEMORY[0x1E4F39EA0];
  }
  [(_UIFloatingContentView *)self setCornerCurve:*v3];
}

- (void)_updateCornerRadiusLayers
{
  BOOL v3 = [(_UIFloatingContentView *)self _shouldApplyCornerRadiusForPrimaryState:[(_UIFloatingContentView *)self _primaryStateForState:self->_controlState]];
  uint64_t v4 = [(UIView *)self->_containerView layer];
  [v4 setCornerCurve:self->_cornerCurve];

  uint64_t v5 = [(UIView *)self->_containerView layer];
  uint64_t v6 = v5;
  double cornerRadius = 0.0;
  if (v3) {
    double cornerRadius = self->_cornerRadius;
  }
  [v5 setCornerRadius:cornerRadius];

  uint64_t v8 = [(UIView *)self->_highlightView layer];
  [v8 setCornerCurve:self->_cornerCurve];

  CGFloat v9 = [(UIView *)self->_highlightView layer];
  [v9 setCornerRadius:self->_cornerRadius];

  int v10 = [(UIView *)self->_visualEffectContainerView layer];
  [v10 setCornerCurve:self->_cornerCurve];

  id v11 = [(UIView *)self->_visualEffectContainerView layer];
  [v11 setCornerRadius:self->_cornerRadius];
}

- (void)setRoundContentWhenDeselected:(BOOL)a3
{
  if (self->_roundContentWhenDeselected != a3)
  {
    self->_roundContentWhenDeselected = a3;
    BOOL v4 = [(_UIFloatingContentView *)self _shouldApplyCornerRadiusForPrimaryState:[(_UIFloatingContentView *)self _primaryStateForState:self->_controlState]];
    uint64_t v5 = [(UIView *)self->_containerView layer];
    [v5 setCornerCurve:self->_cornerCurve];

    uint64_t v6 = [(UIView *)self->_containerView layer];
    double cornerRadius = 0.0;
    if (v4) {
      double cornerRadius = self->_cornerRadius;
    }
    id v8 = v6;
    [v6 setCornerRadius:cornerRadius];
  }
}

+ (id)_defaultFocusAnimationConfiguration
{
  return +[_UIFocusAnimationConfiguration configurationWithStyle:0];
}

- (_UIFocusAnimationConfiguration)focusAnimationConfiguration
{
  focusAnimationConfiguration = self->_focusAnimationConfiguration;
  if (!focusAnimationConfiguration)
  {
    BOOL v4 = [(id)objc_opt_class() _defaultFocusAnimationConfiguration];
    uint64_t v5 = self->_focusAnimationConfiguration;
    self->_focusAnimationConfiguration = v4;

    focusAnimationConfiguration = self->_focusAnimationConfiguration;
  }
  return focusAnimationConfiguration;
}

- (id)backgroundColorForState:(unint64_t)a3
{
  if (-[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:") != a3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UIFloatingContentView.m" lineNumber:498 description:@"_UIFloatingContentView: getting properties for mixed states is unsupported"];
  }
  backgroundColorsByState = self->_backgroundColorsByState;
  return (id)CFDictionaryGetValue(backgroundColorsByState, (const void *)a3);
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  id value = a3;
  if ([(_UIFloatingContentView *)self _primaryStateForState:a4] != a4)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UIFloatingContentView.m" lineNumber:505 description:@"_UIFloatingContentView: setting properties for mixed states is unsupported"];
  }
  backgroundColorsByState = self->_backgroundColorsByState;
  if (value) {
    CFDictionarySetValue(backgroundColorsByState, (const void *)a4, value);
  }
  else {
    CFDictionaryRemoveValue(backgroundColorsByState, (const void *)a4);
  }
  if ([(_UIFloatingContentView *)self _primaryStateForState:self->_controlState] == a4) {
    [(_UIFloatingContentView *)self _updateHighlightViewForPrimaryState:a4];
  }
}

- (void)setShadowImage:(id)a3 stretchable:(BOOL)a4
{
  uint64_t v6 = (UIImage *)a3;
  self->_useShadowImage = 1;
  self->_stretchableShadowImage = a4;
  if (!a4)
  {
    self->_unfocusedShadowVerticalOffset = 0.0;
    self->_shadowVerticalOffset = 0.0;
  }
  shadowImage = self->_shadowImage;
  self->_shadowImage = v6;

  [(_UIFloatingContentView *)self _updateShadowLayer];
  [(UIView *)self setNeedsLayout];
}

- (void)setUseShadowImage:(BOOL)a3
{
  if (self->_useShadowImage != a3)
  {
    self->_useShadowImage = a3;
    [(_UIFloatingContentView *)self _updateShadowLayer];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setShadowEnabled:(BOOL)a3
{
  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    [(_UIFloatingContentView *)self _updateShadowLayer];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setScalesBackwards:(BOOL)a3
{
  if (self->_scalesBackwards != a3) {
    self->_scalesBackwards = a3;
  }
}

- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  if (qword_1EB25D2C0 != -1) {
    dispatch_once(&qword_1EB25D2C0, &__block_literal_global_43);
  }
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  *(double *)v27 = width;
  *(double *)&v27[1] = height;
  [(_UIFloatingContentView *)self cornerRadius];
  v27[2] = v16;
  *(double *)&v27[3] = a4;
  v28 = self->_cornerCurve;
  v17 = [MEMORY[0x1E4F29238] valueWithBytes:v27 objCType:"{?={CGSize=dd}dd@}"];
  v18 = (CGPath *)[(id)_MergedGlobals_11_2 objectForKey:v17];
  if (!v18)
  {
    double v19 = round(v9 + (v13 - width) * 0.5);
    double v20 = round(v11 + (v15 - height) * 0.5);
    if ([(_UIFloatingContentView *)self isContinuousCornerEnabled])
    {
      [(_UIFloatingContentView *)self cornerRadius];
      double v22 = v21;
      [(_UIFloatingContentView *)self cornerRadius];
      +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, v19, v20, width, height, v22, v23);
    }
    else
    {
      [(_UIFloatingContentView *)self cornerRadius];
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v19, v20, width, height, v25);
    }
    id v24 = objc_claimAutoreleasedReturnValue();
    v18 = (CGPath *)[v24 CGPath];

    if (v18) {
      [(id)_MergedGlobals_11_2 setObject:v18 forKey:v17];
    }
  }

  return v18;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingContentView;
  id v4 = a3;
  [(UIView *)&v6 traitCollectionDidChange:v4];
  uint64_t v5 = [(UIView *)self traitCollection];
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingContentView;
  [(UIView *)&v6 _intrinsicContentSizeInvalidatedForChildView:v4];
  if ([(_UIFloatingContentView *)self forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview])
  {
    uint64_t v5 = [(UIView *)self superview];
    [v5 _intrinsicContentSizeInvalidatedForChildView:v4];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingContentView;
  [(UIView *)&v3 layoutSubviews];
  [(_UIFloatingContentView *)self _setShadowImageIfNeeded];
  [(_UIFloatingContentView *)self _layoutContentView];
  [(_UIFloatingContentView *)self _updateScaleFactor];
  [(_UIFloatingContentView *)self _updateTransformForPrimaryState:[(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]]];
  [(_UIFloatingContentView *)self _layoutShadow];
  [(_UIFloatingContentView *)self _layoutHighContrastFocusIndicator];
}

- (void)_layoutContentView
{
  [(UIView *)self bounds];
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  double MidY = CGRectGetMidY(v15);
  [(UIView *)self->_containerView bounds];
  if (width != v10 || height != v9)
  {
    -[UIView setBounds:](self->_transformView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_transformView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_visualEffectContainerView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_visualEffectContainerView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_containerView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_containerView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_contentView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_contentView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_highlightView, "setBounds:", x, y, width, height);
    highlightView = self->_highlightView;
    -[UIView setCenter:](highlightView, "setCenter:", MidX, MidY);
  }
}

- (void)_layoutShadow
{
  if ([(_UIFloatingContentView *)self isShadowEnabled])
  {
    unint64_t v3 = [(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]];
    BOOL v4 = [(_UIFloatingContentView *)self _shouldAppearToFloatForPrimaryState:v3];
    BOOL v5 = [(_UIFloatingContentView *)self useShadowImage];
    [(UIView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    if (v5)
    {
      if (self->_stretchableShadowImage)
      {
        [(_UIFloatingContentView *)self shadowSize];
        BOOL v14 = v12 == *MEMORY[0x1E4F1DB30];
        BOOL v15 = v13 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
        if (v14 && v15) {
          double v16 = v11;
        }
        else {
          double v16 = v13;
        }
        if (v14 && v15) {
          double v17 = v9;
        }
        else {
          double v17 = v12;
        }
        [(_UIFloatingContentView *)self shadowRadius];
        double v19 = v18 / 20.0;
        if (v4)
        {
          [(_UIFloatingContentView *)self shadowRadius];
          double v21 = v20;
          [(_UIFloatingContentView *)self shadowExpansion];
        }
        else
        {
          [(_UIFloatingContentView *)self unfocusedShadowRadius];
          double v21 = v35;
          [(_UIFloatingContentView *)self unfocusedShadowExpansion];
        }
        double v36 = v22;
        double v37 = v23;
        double v38 = v17 / v19;
        double v39 = v16 / v19;
        if (v3 == 1)
        {
          int64_t highlightStyle = self->_highlightStyle;
          if (highlightStyle)
          {
            if (highlightStyle == 1)
            {
              [(_UIFloatingContentView *)self shadowRadius];
              double v42 = v41;
              [(_UIFloatingContentView *)self unfocusedShadowRadius];
              double v21 = (v42 + v43) * 0.5;
              double v36 = v36 * 0.5;
              double v37 = v37 * 0.5;
            }
          }
          else
          {
            double v21 = v21 * 0.25;
            double v36 = v22 * 0.34;
            double v37 = v23 * 0.34;
          }
        }
        BOOL v49 = [(_UIFloatingContentView *)self _disableOutsetShadowPath];
        if (v49) {
          double v50 = v21;
        }
        else {
          double v50 = v37;
        }
        if (v49) {
          double v51 = v21;
        }
        else {
          double v51 = v36;
        }
        double v9 = v38 + v51 + v51;
        double v11 = v39 + v50 + v50;
      }
      else
      {
        shadowImage = self->_shadowImage;
        if (shadowImage)
        {
          [(UIImage *)shadowImage size];
          double v9 = v33;
          [(UIImage *)self->_shadowImage size];
          double v11 = v34;
        }
      }
      [(UIView *)self bounds];
      double v54 = round(v53 + (v52 - v9) * 0.5);
      shadowView = self->_shadowView;
      double v58 = round(v56 + (v55 - v11) * 0.5);
      -[UIView setFrame:](shadowView, "setFrame:", v54, v58, v9, v11);
    }
    else
    {
      double v24 = v6;
      double v25 = v7;
      if (v4) {
        [(_UIFloatingContentView *)self shadowRadius];
      }
      else {
        [(_UIFloatingContentView *)self unfocusedShadowRadius];
      }
      double v27 = v26;
      if (v3 == 1)
      {
        int64_t v28 = self->_highlightStyle;
        if (v28)
        {
          if (v28 == 1)
          {
            [(_UIFloatingContentView *)self shadowRadius];
            double v30 = v29;
            [(_UIFloatingContentView *)self unfocusedShadowRadius];
            double v27 = (v30 + v31) * 0.5;
          }
        }
        else
        {
          double v27 = v26 * 0.25;
        }
        double v9 = v9 - v27;
        double v11 = v11 - v27;
      }
      -[UIView setBounds:](self->_shadowView, "setBounds:", v24, v25, v9, v11);
      v61.origin.double x = v24;
      v61.origin.double y = v25;
      v61.size.double width = v9;
      v61.size.double height = v11;
      double MidX = CGRectGetMidX(v61);
      v62.origin.double x = v24;
      v62.origin.double y = v25;
      v62.size.double width = v9;
      v62.size.double height = v11;
      -[UIView setCenter:](self->_shadowView, "setCenter:", MidX, CGRectGetMidY(v62));
      v45 = -[_UIFloatingContentView _shadowPathForSize:radius:](self, "_shadowPathForSize:radius:", v9, v11, v27);
      v46 = [(UIView *)self->_shadowView layer];
      [v46 setShadowPath:v45];

      cornerCurve = self->_cornerCurve;
      v48 = [(UIView *)self->_shadowView layer];
      [v48 setCornerCurve:cornerCurve];

      id v59 = [(UIView *)self->_shadowView layer];
      [v59 setShadowRadius:v27];
    }
  }
}

- (void)_layoutHighContrastFocusIndicator
{
  highContrastFocusIndicatorView = self->_highContrastFocusIndicatorView;
  if (highContrastFocusIndicatorView)
  {
    BOOL v4 = [(UIView *)highContrastFocusIndicatorView layer];
    [v4 borderWidth];
    double x = v5 + v5;
    double v7 = [(UIView *)self->_highContrastFocusIndicatorView layer];
    [v7 borderWidth];
    double y = v8 + v8;

    if (self->_highContrastFocusIndicatorOutset.x != *MEMORY[0x1E4F1DAD8]
      || self->_highContrastFocusIndicatorOutset.y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      double y = self->_highContrastFocusIndicatorOutset.y;
      double x = self->_highContrastFocusIndicatorOutset.x;
    }
    [(UIView *)self bounds];
    CGRect v13 = CGRectInset(v12, -x, -y);
    double v10 = self->_highContrastFocusIndicatorView;
    -[UIView setFrame:](v10, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  }
}

- (void)setControlState:(unint64_t)a3
{
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
  if (a4)
  {
    double v6 = [(_UIFloatingContentView *)self focusAnimationConfiguration];
    if ((a3 & 8) != 0) {
      +[UIFocusAnimationCoordinator _focusingAnimationCoordinatorWithConfiguration:v6 inContext:0];
    }
    else {
    id v7 = +[UIFocusAnimationCoordinator _unfocusingAnimationCoordinatorWithConfiguration:v6 inContext:0];
    }

    [(_UIFloatingContentView *)self _setControlState:a3 withAnimationCoordinator:v7];
  }
  else
  {
    id v7 = 0;
    [(_UIFloatingContentView *)self _setControlState:a3 withAnimationCoordinator:0];
  }
  [v7 _animate];
}

- (void)_setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  unint64_t controlState = self->_controlState;
  if (controlState == a3) {
    goto LABEL_18;
  }
  self->_unint64_t controlState = a3;
  unint64_t v8 = [(_UIFloatingContentView *)self _primaryStateForState:a3];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_10;
  }
  if (v8 == 1)
  {
    if ((a3 & 8) != 0)
    {
      uint64_t v9 = 1;
      goto LABEL_8;
    }
    if (dyld_program_sdk_at_least())
    {
      uint64_t v9 = 4;
      goto LABEL_8;
    }
    uint64_t v9 = 0;
LABEL_10:
    char v10 = 1;
    goto LABEL_11;
  }
LABEL_8:
  [(_UIFloatingContentView *)self _updateContainerLayerQualityForPrimaryState:v9];
  char v10 = 0;
LABEL_11:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke;
  aBlock[3] = &unk_1E52D9FC0;
  aBlock[4] = self;
  char v21 = v10;
  double v11 = (void (**)(void))_Block_copy(aBlock);
  BOOL v12 = [v6 activeFocusAnimation] == 1;
  CGRect v13 = [v6 _activeConfiguration];
  [v13 unfocusingBackgroundFadeDurationPercentage];
  uint64_t v15 = v14;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_2;
  v18[3] = &unk_1E52DD870;
  v18[4] = self;
  v18[5] = v9;
  BOOL v19 = v12;
  v18[6] = v15;
  v18[7] = controlState;
  double v16 = _Block_copy(v18);
  double v17 = v16;
  if (v6)
  {
    [v6 addCoordinatedAnimations:v16 completion:v11];
  }
  else
  {
    if (v16) {
      (*((void (**)(void *))v16 + 2))(v16);
    }
    if (v11) {
      v11[2](v11);
    }
  }

LABEL_18:
}

- (void)setClipsContentToBounds:(BOOL)a3
{
  containerView = self->_containerView;
  if (containerView) {
    [(UIView *)containerView setClipsToBounds:a3];
  }
}

- (BOOL)clipsContentToBounds
{
  containerView = self->_containerView;
  if (containerView) {
    LOBYTE(containerView) = [(UIView *)containerView clipsToBounds];
  }
  return (char)containerView;
}

- (void)setShowsHighContrastFocusIndicator:(BOOL)a3
{
  self->_showsHighContrastFocusIndicator = a3;
  [(_UIFloatingContentView *)self _updateHighContrastFocusIndicatorView];
}

- (void)setHighContrastFocusIndicatorCornerRadius:(double)a3
{
  self->_highContrastFocusIndicatorCornerRadius = a3;
  id v4 = [(UIView *)self->_highContrastFocusIndicatorView layer];
  [v4 setCornerRadius:a3];
}

- (void)_updateHighContrastFocusIndicatorView
{
  if (self->_showsHighContrastFocusIndicator && _AXSHighContrastFocusIndicatorsEnabled())
  {
    if (!self->_highContrastFocusIndicatorView)
    {
      unint64_t v3 = [UIView alloc];
      [(UIView *)self bounds];
      id v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
      highContrastFocusIndicatorView = self->_highContrastFocusIndicatorView;
      self->_highContrastFocusIndicatorView = v4;

      id v6 = +[UIColor whiteColor];
      uint64_t v7 = [v6 CGColor];
      unint64_t v8 = [(UIView *)self->_highContrastFocusIndicatorView layer];
      [v8 setBorderColor:v7];

      uint64_t v9 = [(UIView *)self->_highContrastFocusIndicatorView layer];
      [v9 setBorderWidth:8.0];

      cornerCurve = self->_cornerCurve;
      double v11 = [(UIView *)self->_highContrastFocusIndicatorView layer];
      [v11 setCornerCurve:cornerCurve];

      double highContrastFocusIndicatorCornerRadius = self->_highContrastFocusIndicatorCornerRadius;
      if (highContrastFocusIndicatorCornerRadius <= 0.0) {
        double highContrastFocusIndicatorCornerRadius = self->_cornerRadius + 1.0;
      }
      CGRect v13 = [(UIView *)self->_highContrastFocusIndicatorView layer];
      [v13 setCornerRadius:highContrastFocusIndicatorCornerRadius];

      [(UIView *)self->_transformView insertSubview:self->_highContrastFocusIndicatorView atIndex:0];
      unint64_t v14 = [(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]];
      [(_UIFloatingContentView *)self _updateHighContrastFocusIndicatorForPrimaryState:v14];
    }
  }
  else
  {
    uint64_t v15 = self->_highContrastFocusIndicatorView;
    if (v15)
    {
      [(UIView *)v15 removeFromSuperview];
      double v16 = self->_highContrastFocusIndicatorView;
      self->_highContrastFocusIndicatorView = 0;
    }
  }
}

- (double)_effectiveShadowRadius
{
  [(_UIFloatingContentView *)self scaleFactor];
  double shadowRadius = self->_shadowRadius;
  if (fabs(v3) >= 2.22044605e-16)
  {
    [(_UIFloatingContentView *)self scaleFactor];
    return shadowRadius / v5;
  }
  return shadowRadius;
}

- (double)_effectiveShadowOpacity
{
  double v3 = [(UIView *)self traitCollection];
  -[_UIFloatingContentView shadowOpacityForUserInterfaceStyle:](self, "shadowOpacityForUserInterfaceStyle:", [v3 userInterfaceStyle]);
  double v5 = v4;

  return v5;
}

- (void)_updateShadowOpacityForPrimaryState:(unint64_t)a3
{
  [(_UIFloatingContentView *)self _effectiveShadowOpacity];
  double v6 = v5;
  unfocusedShadowOpacitdouble y = v5;
  if (![(_UIFloatingContentView *)self _shouldAppearToFloatForPrimaryState:a3]) {
    unfocusedShadowOpacitdouble y = self->_unfocusedShadowOpacity;
  }
  if ([(_UIFloatingContentView *)self useShadowImage])
  {
    if (a3 == 1)
    {
      int64_t highlightStyle = self->_highlightStyle;
      if (highlightStyle)
      {
        if (highlightStyle == 1) {
          unfocusedShadowOpacitdouble y = (v6 + self->_unfocusedShadowOpacity) * 0.5;
        }
      }
      else
      {
        unfocusedShadowOpacitdouble y = v6 * 0.75;
      }
    }
    id v13 = [(UIView *)self->_shadowView layer];
    *(float *)&double v12 = unfocusedShadowOpacity;
    [v13 setOpacity:v12];
  }
  else
  {
    uint64_t v9 = [(UIView *)self->_shadowView layer];
    LODWORD(v10) = 1.0;
    [v9 setOpacity:v10];

    id v13 = [(UIView *)self->_shadowView layer];
    *(float *)&double v11 = unfocusedShadowOpacity;
    [v13 setShadowOpacity:v11];
  }
}

- (void)_updateShadowLayer
{
  BOOL v3 = [(_UIFloatingContentView *)self isShadowEnabled];
  shadowView = self->_shadowView;
  if (v3)
  {
    if (!shadowView)
    {
      double v5 = [UIView alloc];
      [(UIView *)self frame];
      double v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
      uint64_t v7 = self->_shadowView;
      self->_shadowView = v6;

      [(UIView *)self insertSubview:self->_shadowView atIndex:0];
      shadowView = self->_shadowView;
    }
    BOOL v19 = [(UIView *)shadowView layer];
    [(UIView *)v19 setZPosition:-1000.0];
    if ([(_UIFloatingContentView *)self useShadowImage])
    {
      unint64_t v8 = [(_UIFloatingContentView *)self shadowImage];
      [(UIView *)self->_shadowView setOpaque:0];
      [(UIView *)self->_shadowView setBackgroundColor:0];
      id v9 = v8;
      -[UIView setContents:](v19, "setContents:", [v9 CGImage]);
      if (self->_stretchableShadowImage)
      {
        [(_UIFloatingContentView *)self shadowContentsCenter];
      }
      else
      {
        double v12 = 1.0;
        double v10 = 0.0;
        double v11 = 0.0;
        double v13 = 1.0;
      }
      -[UIView setContentsCenter:](v19, "setContentsCenter:", v10, v11, v12, v13);
      [(UIView *)v19 setShadowOpacity:0.0];
      [(UIView *)v19 setOpacity:0.0];
      [(UIView *)v19 setShadowRadius:0.0];
      [(UIView *)v19 setZPosition:-1000.0];
    }
    else
    {
      [(UIView *)v19 setContents:0];
      -[UIView setContentsCenter:](v19, "setContentsCenter:", 0.0, 0.0, 1.0, 1.0);
      uint64_t v15 = [(UIView *)self traitCollection];
      -[_UIFloatingContentView shadowOpacityForUserInterfaceStyle:](self, "shadowOpacityForUserInterfaceStyle:", [v15 userInterfaceStyle]);
      *(float *)&double v16 = v16;
      [(UIView *)v19 setShadowOpacity:v16];

      double v17 = [(_UIFloatingContentView *)self cornerCurve];
      [(UIView *)v19 setCornerCurve:v17];

      [(_UIFloatingContentView *)self shadowRadius];
      -[UIView setShadowRadius:](v19, "setShadowRadius:");
    }
    [(_UIFloatingContentView *)self _layoutShadow];
    unint64_t v18 = [(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]];
    [(_UIFloatingContentView *)self _updateShadowOpacityForPrimaryState:v18];
    [(_UIFloatingContentView *)self _updateTransformForPrimaryState:v18];
    unint64_t v14 = v19;
  }
  else
  {
    [(UIView *)shadowView removeFromSuperview];
    unint64_t v14 = self->_shadowView;
    self->_shadowView = 0;
  }
}

- (void)setShadowImage:(id)a3
{
}

- (void)setShadowContentsCenter:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_shadowContentsCenter = &self->_shadowContentsCenter;
  if (!CGRectEqualToRect(self->_shadowContentsCenter, a3))
  {
    p_shadowContentsCenter->origin.double x = x;
    p_shadowContentsCenter->origin.double y = y;
    p_shadowContentsCenter->size.double width = width;
    p_shadowContentsCenter->size.double height = height;
    if (self->_stretchableShadowImage)
    {
      id v9 = [(UIView *)self->_shadowView layer];
      objc_msgSend(v9, "setContentsCenter:", x, y, width, height);
    }
  }
}

- (double)shadowOpacity
{
  [(_UIFloatingContentView *)self shadowOpacityForUserInterfaceStyle:1];
  return result;
}

- (void)setShadowOpacity:(double)a3
{
}

- (void)setShadowOpacity:(double)a3 forUserInterfaceStyle:(int64_t)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65___UIFloatingContentView_setShadowOpacity_forUserInterfaceStyle___block_invoke;
  v5[3] = &unk_1E52DD178;
  v5[4] = self;
  v5[5] = a4;
  *(double *)&v5[6] = a3;
  +[UIView _performSystemAppearanceModifications:v5];
  [(_UIFloatingContentView *)self _updateShadowLayer];
}

- (double)shadowOpacityForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3 = a3 == 2 || a3 == 1000;
  uint64_t v4 = 31;
  if (v3) {
    uint64_t v4 = 30;
  }
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____UIFloatingContentView__backgroundColorsByState[v4]);
}

- (double)_currentShadowOpacity
{
  v2 = [(UIView *)self->_shadowView layer];
  [v2 opacity];
  double v4 = v3;

  return v4;
}

- (void)setUnfocusedShadowOpacity:(double)a3
{
  if (self->_unfocusedShadowOpacity != a3)
  {
    self->_unfocusedShadowOpacitdouble y = a3;
    unint64_t v4 = [(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]];
    [(_UIFloatingContentView *)self _updateShadowOpacityForPrimaryState:v4];
  }
}

- (void)setUnfocusedShadowVerticalOffset:(double)a3
{
  if (self->_unfocusedShadowVerticalOffset != a3)
  {
    self->_unfocusedShadowVerticalOffset = a3;
    unint64_t v4 = [(_UIFloatingContentView *)self _primaryStateForState:[(_UIFloatingContentView *)self controlState]];
    [(_UIFloatingContentView *)self _updateTransformForPrimaryState:v4];
  }
}

- (void)setUnfocusedShadowRadius:(double)a3
{
  if (self->_unfocusedShadowRadius != a3)
  {
    self->_unfocusedShadowRadius = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingContentView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIFloatingContentView *)self _layoutContentView];
  [(_UIFloatingContentView *)self _updateScaleFactor];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingContentView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIFloatingContentView *)self _layoutContentView];
  [(_UIFloatingContentView *)self _updateScaleFactor];
}

- (double)scaleFactor
{
  return self->_asymmetricScaleFactor.width;
}

- (void)setScaleFactor:(double)a3
{
  self->_symmetricScale = 1;
}

- (double)focusedSizeIncrease
{
  return self->_asymmetricFocusedSizeIncrease.width;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_symmetricScale = 1;
}

- (void)setAsymmetricScaleFactor:(CGSize)a3
{
  self->_asymmetricScaleFactor = a3;
  self->_customScale = 1;
  self->_symmetricScale = 0;
}

- (void)setAsymmetricFocusedSizeIncrease:(CGSize)a3
{
  self->_asymmetricFocusedSizeIncrease = a3;
  self->_customScale = 0;
  self->_symmetricScale = 0;
}

- (void)_updateScaleFactor
{
  if (!self->_customScale)
  {
    [(UIView *)self bounds];
    double v5 = 1.0;
    if (v3 <= 0.0)
    {
      double v7 = 1.0;
    }
    else
    {
      double v6 = v4;
      double v7 = 1.0;
      if (v4 > 0.0)
      {
        double v8 = v3;
        if (self->_symmetricScale)
        {
          [(_UIFloatingContentView *)self focusedSizeIncrease];
          if (v8 <= v6) {
            double v5 = (v6 + v9) / v6;
          }
          else {
            double v5 = (v8 + v9) / v8;
          }
          double v7 = v5;
        }
        else
        {
          [(_UIFloatingContentView *)self asymmetricFocusedSizeIncrease];
          double v7 = (v8 + v10) / v8;
          [(_UIFloatingContentView *)self asymmetricFocusedSizeIncrease];
          double v5 = (v6 + v11) / v6;
        }
      }
    }
    if (v7 != self->_asymmetricScaleFactor.width || v5 != self->_asymmetricScaleFactor.height)
    {
      self->_asymmetricScaleFactor.double width = v7;
      self->_asymmetricScaleFactor.double height = v5;
      [(_UIFloatingContentView *)self _updateFocusedFrameGuideConstraintsIfApplicable];
    }
  }
}

- (void)_updateContainerLayerQualityForPrimaryState:(unint64_t)a3
{
  if ([(_UIFloatingContentView *)self _shouldAppearToFloatForPrimaryState:a3]) {
    BOOL v4 = self->_contentRotation.y != *(double *)(MEMORY[0x1E4F1DAD8] + 8)
  }
      || self->_contentRotation.x != *MEMORY[0x1E4F1DAD8];
  else {
    BOOL v4 = 0;
  }
  double v5 = [(UIView *)self->_containerView layer];
  [v5 setAllowsEdgeAntialiasing:v4];

  id v6 = [(UIView *)self->_containerView layer];
  [v6 setShouldRasterize:v4];
}

- (void)_updateHighlightViewForPrimaryState:(unint64_t)a3
{
  id v4 = [(_UIFloatingContentView *)self backgroundColorForState:a3];
  [(UIView *)self->_highlightView setBackgroundColor:v4];
}

- (void)_updateTransformForPrimaryState:(unint64_t)a3
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v64 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v65 = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v66 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  CGFloat v67 = *(double *)(MEMORY[0x1E4F39B10] + 80);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v62 = *MEMORY[0x1E4F39B10];
  long long v63 = v7;
  CGFloat v8 = *(double *)(MEMORY[0x1E4F39B10] + 88);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v60 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v61 = v9;
  long long v56 = v64;
  long long v57 = v5;
  long long v58 = v66;
  CGFloat m33 = v67;
  long long v54 = v62;
  long long v55 = v7;
  long long v52 = v60;
  long long v53 = v9;
  *(_OWORD *)&v51.m31 = v66;
  *(_OWORD *)&v51.CGFloat m33 = v6;
  *(_OWORD *)&v51.m41 = v60;
  *(_OWORD *)&v51.m43 = v9;
  *(_OWORD *)&v51.m11 = v62;
  *(_OWORD *)&v51.m13 = v7;
  *(_OWORD *)&v51.m21 = v64;
  *(_OWORD *)&v51.m23 = v5;
  CGFloat m34 = v8;
  if ([(_UIFloatingContentView *)self useShadowImage])
  {
    [(_UIFloatingContentView *)self shadowRadius];
    CATransform3DMakeScale(&v50, v11 / 20.0, v11 / 20.0, 1.0);
    long long v56 = *(_OWORD *)&v50.m21;
    long long v57 = *(_OWORD *)&v50.m23;
    long long v58 = *(_OWORD *)&v50.m31;
    CGFloat m33 = v50.m33;
    long long v54 = *(_OWORD *)&v50.m11;
    long long v55 = *(_OWORD *)&v50.m13;
    CGFloat m34 = v50.m34;
    long long v52 = *(_OWORD *)&v50.m41;
    long long v53 = *(_OWORD *)&v50.m43;
  }
  if ([(_UIFloatingContentView *)self _shouldAppearToFloatForPrimaryState:a3])
  {
    p_asymmetricScaleFactor = &self->_asymmetricScaleFactor;
    if (fabs(self->_asymmetricScaleFactor.width) < 2.22044605e-16
      || fabs(self->_asymmetricScaleFactor.height) < 2.22044605e-16)
    {
      [(_UIFloatingContentView *)self _updateScaleFactor];
    }
    double shadowVerticalOffset = self->_shadowVerticalOffset;
    if (a3 == 1)
    {
      int64_t highlightStyle = self->_highlightStyle;
      if (highlightStyle)
      {
        if (highlightStyle == 1) {
          double shadowVerticalOffset = (shadowVerticalOffset + self->_unfocusedShadowVerticalOffset) * 0.5;
        }
      }
      else
      {
        double shadowVerticalOffset = shadowVerticalOffset * 0.4;
      }
    }
    *(_OWORD *)&a.m21 = v56;
    *(_OWORD *)&a.m23 = v57;
    *(_OWORD *)&a.m31 = v58;
    a.CGFloat m33 = m33;
    *(_OWORD *)&a.m11 = v54;
    *(_OWORD *)&a.m13 = v55;
    a.CGFloat m34 = m34;
    *(_OWORD *)&a.m41 = v52;
    *(_OWORD *)&a.m43 = v53;
    CATransform3DTranslate(&v50, &a, 0.0, shadowVerticalOffset, 0.0);
    long long v56 = *(_OWORD *)&v50.m21;
    long long v57 = *(_OWORD *)&v50.m23;
    long long v58 = *(_OWORD *)&v50.m31;
    CGFloat m33 = v50.m33;
    long long v54 = *(_OWORD *)&v50.m11;
    long long v55 = *(_OWORD *)&v50.m13;
    CGFloat v17 = v50.m34;
    v18.f64[0] = p_asymmetricScaleFactor->width;
    _NF = fabs(p_asymmetricScaleFactor->width) < 2.22044605e-16;
    long long v52 = *(_OWORD *)&v50.m41;
    long long v53 = *(_OWORD *)&v50.m43;
    if (_NF)
    {
      double height = self->_asymmetricScaleFactor.height;
      if (fabs(height) < 2.22044605e-16)
      {
LABEL_27:
        CGFloat v39 = self->_contentRotation.y * self->_focusDirection.y;
        *(_OWORD *)&a.m21 = v64;
        *(_OWORD *)&a.m23 = v65;
        *(_OWORD *)&a.m31 = v66;
        *(_OWORD *)&a.m11 = v62;
        *(_OWORD *)&a.m13 = v63;
        a.CGFloat m33 = v67;
        a.CGFloat m34 = -0.001;
        *(_OWORD *)&a.m41 = v60;
        *(_OWORD *)&a.m43 = v61;
        CATransform3DRotate(&v50, &a, v39, 1.0, 0.0, 0.0);
        long long v64 = *(_OWORD *)&v50.m21;
        long long v65 = *(_OWORD *)&v50.m23;
        long long v66 = *(_OWORD *)&v50.m31;
        CGFloat v67 = v50.m33;
        long long v62 = *(_OWORD *)&v50.m11;
        long long v63 = *(_OWORD *)&v50.m13;
        long long v60 = *(_OWORD *)&v50.m41;
        long long v61 = *(_OWORD *)&v50.m43;
        CGFloat v40 = -(self->_focusDirection.x * self->_contentRotation.x);
        CATransform3D a = v50;
        CATransform3DRotate(&v50, &a, v40, 0.0, 1.0, 0.0);
        long long v64 = *(_OWORD *)&v50.m21;
        long long v65 = *(_OWORD *)&v50.m23;
        long long v66 = *(_OWORD *)&v50.m31;
        CGFloat v67 = v50.m33;
        long long v62 = *(_OWORD *)&v50.m11;
        long long v63 = *(_OWORD *)&v50.m13;
        long long v60 = *(_OWORD *)&v50.m41;
        long long v61 = *(_OWORD *)&v50.m43;
        CGFloat v41 = self->_contentTranslation.x * self->_focusDirection.x;
        CGFloat v42 = self->_contentTranslation.y * self->_focusDirection.y;
        CATransform3D a = v50;
        CATransform3DTranslate(&v50, &a, v41, v42, 0.0);
        long long v64 = *(_OWORD *)&v50.m21;
        long long v65 = *(_OWORD *)&v50.m23;
        long long v66 = *(_OWORD *)&v50.m31;
        CGFloat v67 = v50.m33;
        long long v62 = *(_OWORD *)&v50.m11;
        long long v63 = *(_OWORD *)&v50.m13;
        CGFloat v8 = v50.m34;
        long long v60 = *(_OWORD *)&v50.m41;
        long long v61 = *(_OWORD *)&v50.m43;
        *(_OWORD *)&a.m21 = v56;
        *(_OWORD *)&a.m23 = v57;
        *(_OWORD *)&a.m31 = v58;
        a.CGFloat m33 = m33;
        *(_OWORD *)&a.m11 = v54;
        *(_OWORD *)&a.m13 = v55;
        a.CGFloat m34 = v17;
        *(_OWORD *)&a.m41 = v52;
        *(_OWORD *)&a.m43 = v53;
        CATransform3D b = v50;
        CATransform3DConcat(&v50, &a, &b);
        long long v56 = *(_OWORD *)&v50.m21;
        long long v57 = *(_OWORD *)&v50.m23;
        long long v58 = *(_OWORD *)&v50.m31;
        CGFloat m33 = v50.m33;
        long long v54 = *(_OWORD *)&v50.m11;
        long long v55 = *(_OWORD *)&v50.m13;
        CGFloat v16 = v50.m34;
        long long v52 = *(_OWORD *)&v50.m41;
        long long v53 = *(_OWORD *)&v50.m43;
        CATransform3DMakeScale(&v51, self->_visualEffectContainerViewScaleFactor, self->_visualEffectContainerViewScaleFactor, 1.0);
        goto LABEL_28;
      }
    }
    else
    {
      double height = self->_asymmetricScaleFactor.height;
    }
    v18.f64[1] = height;
    if (a3 == 1)
    {
      int64_t v21 = self->_highlightStyle;
      if (v21)
      {
        if (v21 != 1) {
          goto LABEL_22;
        }
        __asm { FMOV            V1.2D, #-1.0 }
        float64x2_t v26 = vaddq_f64(v18, _Q1);
        __asm { FMOV            V1.2D, #0.5 }
      }
      else
      {
        __asm { FMOV            V1.2D, #-1.0 }
        float64x2_t v26 = vaddq_f64(v18, _Q1);
        __asm { FMOV            V1.2D, #0.25 }
      }
      float64x2_t v29 = vmulq_f64(v26, _Q1);
      __asm { FMOV            V1.2D, #1.0 }
      float64x2_t v18 = vaddq_f64(v29, _Q1);
    }
LABEL_22:
    if (self->_focusScaleAnchorPoint.x == 0.5 && self->_focusScaleAnchorPoint.y == 0.5)
    {
      CATransform3DMakeScale(&v50, v18.f64[0], v18.f64[1], 1.0);
    }
    else
    {
      [(UIView *)self bounds];
      double v32 = v31 * 0.5;
      double v34 = v33 * 0.5;
      [(UIView *)self bounds];
      CGFloat v36 = self->_focusScaleAnchorPoint.x * v35 - v32;
      [(UIView *)self bounds];
      CGFloat v38 = self->_focusScaleAnchorPoint.y * v37 - v34;
      CATransform3DMakeTranslation(&v50, v36, v38, 0.0);
      long long v64 = *(_OWORD *)&v50.m21;
      long long v65 = *(_OWORD *)&v50.m23;
      long long v66 = *(_OWORD *)&v50.m31;
      CGFloat v67 = v50.m33;
      long long v62 = *(_OWORD *)&v50.m11;
      long long v63 = *(_OWORD *)&v50.m13;
      long long v60 = *(_OWORD *)&v50.m41;
      long long v61 = *(_OWORD *)&v50.m43;
      CATransform3D a = v50;
      CATransform3DScale(&v50, &a, sx, sx_8, 1.0);
      long long v64 = *(_OWORD *)&v50.m21;
      long long v65 = *(_OWORD *)&v50.m23;
      long long v66 = *(_OWORD *)&v50.m31;
      CGFloat v67 = v50.m33;
      long long v62 = *(_OWORD *)&v50.m11;
      long long v63 = *(_OWORD *)&v50.m13;
      long long v60 = *(_OWORD *)&v50.m41;
      long long v61 = *(_OWORD *)&v50.m43;
      CATransform3D a = v50;
      CATransform3DTranslate(&v50, &a, -v36, -v38, 0.0);
    }
    long long v64 = *(_OWORD *)&v50.m21;
    long long v65 = *(_OWORD *)&v50.m23;
    long long v66 = *(_OWORD *)&v50.m31;
    CGFloat v67 = v50.m33;
    long long v62 = *(_OWORD *)&v50.m11;
    long long v63 = *(_OWORD *)&v50.m13;
    long long v60 = *(_OWORD *)&v50.m41;
    long long v61 = *(_OWORD *)&v50.m43;
    goto LABEL_27;
  }
  double unfocusedShadowVerticalOffset = self->_unfocusedShadowVerticalOffset;
  *(_OWORD *)&a.m21 = v56;
  *(_OWORD *)&a.m23 = v57;
  *(_OWORD *)&a.m31 = v58;
  a.CGFloat m33 = m33;
  *(_OWORD *)&a.m11 = v54;
  *(_OWORD *)&a.m13 = v55;
  a.CGFloat m34 = m34;
  *(_OWORD *)&a.m41 = v52;
  *(_OWORD *)&a.m43 = v53;
  CATransform3DTranslate(&v50, &a, 0.0, unfocusedShadowVerticalOffset, 0.0);
  long long v56 = *(_OWORD *)&v50.m21;
  long long v57 = *(_OWORD *)&v50.m23;
  long long v58 = *(_OWORD *)&v50.m31;
  CGFloat m33 = v50.m33;
  long long v54 = *(_OWORD *)&v50.m11;
  long long v55 = *(_OWORD *)&v50.m13;
  long long v52 = *(_OWORD *)&v50.m41;
  long long v53 = *(_OWORD *)&v50.m43;
  CGFloat v16 = -0.001;
LABEL_28:
  double v43 = [(UIView *)self->_transformView layer];
  *(_OWORD *)&v50.m21 = v64;
  *(_OWORD *)&v50.m23 = v65;
  *(_OWORD *)&v50.m31 = v66;
  v50.CGFloat m33 = v67;
  *(_OWORD *)&v50.m11 = v62;
  *(_OWORD *)&v50.m13 = v63;
  v50.CGFloat m34 = v8;
  *(_OWORD *)&v50.m41 = v60;
  *(_OWORD *)&v50.m43 = v61;
  [v43 setTransform:&v50];

  v44 = [(UIView *)self->_shadowView layer];
  *(_OWORD *)&v50.m21 = v56;
  *(_OWORD *)&v50.m23 = v57;
  *(_OWORD *)&v50.m31 = v58;
  v50.CGFloat m33 = m33;
  *(_OWORD *)&v50.m11 = v54;
  *(_OWORD *)&v50.m13 = v55;
  v50.CGFloat m34 = v16;
  *(_OWORD *)&v50.m41 = v52;
  *(_OWORD *)&v50.m43 = v53;
  [v44 setTransform:&v50];

  v45 = [(UIView *)self->_visualEffectContainerView layer];
  CATransform3D v50 = v51;
  [v45 setTransform:&v50];
}

- (void)_updateHighContrastFocusIndicatorForPrimaryState:(unint64_t)a3
{
  BOOL v4 = [(_UIFloatingContentView *)self _shouldAppearToFloatForPrimaryState:a3];
  double v5 = 0.0;
  if (v4) {
    double v5 = 1.0;
  }
  highContrastFocusIndicatorView = self->_highContrastFocusIndicatorView;
  [(UIView *)highContrastFocusIndicatorView setAlpha:v5];
}

- (void)_updateShadowContentsScaleForPrimaryState:(unint64_t)a3
{
  double v4 = 1.0;
  if (a3 == 1) {
    double v4 = 2.0;
  }
  if (a3 == 8) {
    double v5 = 1.05;
  }
  else {
    double v5 = v4;
  }
  objc_msgSend(MEMORY[0x1E4F39CF8], "animationDuration", v4);
  double v7 = v6;
  id v17 = [MEMORY[0x1E4F39CF8] animationTimingFunction];
  CGFloat v8 = (void *)MEMORY[0x1E4F39CF8];
  +[UIView inheritedAnimationDuration];
  objc_msgSend(v8, "setAnimationDuration:");
  long long v9 = (void *)MEMORY[0x1E4F39CF8];
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 1.0;
  double v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v10 :v11];
  [v9 setAnimationTimingFunction:v12];

  double v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contentsScale"];
  [v13 setFromValue:&unk_1ED3F3318];
  unint64_t v14 = [NSNumber numberWithDouble:v5];
  [v13 setToValue:v14];

  uint64_t v15 = [(UIView *)self->_shadowView layer];
  [v15 setContentsScale:v5];

  CGFloat v16 = [(UIView *)self->_shadowView layer];
  [v16 addAnimation:v13 forKey:@"ShadowViewContentsScaleAnimation"];

  [MEMORY[0x1E4F39CF8] setAnimationTimingFunction:v17];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:v7];
}

- (void)_setShadowImageIfNeeded
{
  if (!self->_shadowImage)
  {
    if ([(_UIFloatingContentView *)self useShadowImage])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __49___UIFloatingContentView__setShadowImageIfNeeded__block_invoke;
      v3[3] = &unk_1E52D9F70;
      v3[4] = self;
      +[UIView _performSystemAppearanceModifications:v3];
    }
  }
}

- (id)_focusedFrameGuide
{
  return [(_UIFloatingContentView *)self _focusedFrameGuideCreateIfNecessary:1];
}

- (id)_focusedFrameGuideCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  v15[4] = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey);
  double v5 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    double v5 = objc_alloc_init(UILayoutGuide);
    objc_setAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey, v5, (void *)1);
    [(UIView *)self addLayoutGuide:v5];
    [(UILayoutGuide *)v5 _setLockedToOwningView:1];
    [(UILayoutGuide *)v5 setIdentifier:@"_UIFloatingContentViewFocusedFrameGuide"];
    double v7 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:3 relatedBy:0 toItem:self attribute:3];
    CGFloat v8 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:1 relatedBy:0 toItem:self attribute:1];
    long long v9 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:4 relatedBy:0 toItem:v5 attribute:4];
    double v10 = [MEMORY[0x1E4F5B268] constraintWithItem:self attribute:2 relatedBy:0 toItem:v5 attribute:2];
    [v7 setIdentifier:@"focusedFrameGuide-topConstraint"];
    [v8 setIdentifier:@"focusedFrameGuide-leftConstraint"];
    [v9 setIdentifier:@"focusedFrameGuide-bottomConstraint"];
    [v10 setIdentifier:@"focusedFrameGuide-rightConstraint"];
    v15[0] = v7;
    v15[1] = v8;
    v15[2] = v9;
    void v15[3] = v10;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
    [(UILayoutGuide *)v5 _setSystemConstraints:v11];

    [(_UIFloatingContentView *)self _updateFocusedFrameGuideConstraintsIfApplicable];
    double v12 = (void *)MEMORY[0x1E4F5B268];
    double v13 = [(UILayoutGuide *)v5 _systemConstraints];
    [v12 activateConstraints:v13];
  }
  return v5;
}

- (void)_updateFocusedFrameGuideConstraintsIfApplicable
{
  BOOL v3 = [(_UIFloatingContentView *)self _focusedFrameGuideCreateIfNecessary:0];
  if (v3)
  {
    id v31 = v3;
    [(_UIFloatingContentView *)self asymmetricScaleFactor];
    double v5 = v4;
    double v7 = v6;
    [(UIView *)self bounds];
    BOOL v10 = v8 > 0.0;
    BOOL v11 = v9 > 0.0;
    if (v10 && v11) {
      double v12 = v8 - v5 * v8;
    }
    else {
      double v12 = 0.0;
    }
    if (v10 && v11) {
      double v13 = v9 - v7 * v9;
    }
    else {
      double v13 = 0.0;
    }
    unint64_t v14 = [v31 _systemConstraints];
    uint64_t v15 = [v14 objectAtIndexedSubscript:0];
    [v15 constant];
    double v17 = v16;

    if (v17 != v13)
    {
      float64x2_t v18 = [v14 objectAtIndexedSubscript:0];
      [v18 setConstant:v13];
    }
    BOOL v19 = [v14 objectAtIndexedSubscript:1];
    [v19 constant];
    double v21 = v20;

    if (v21 != v12)
    {
      double v22 = [v14 objectAtIndexedSubscript:1];
      [v22 setConstant:v12];
    }
    double v23 = [v14 objectAtIndexedSubscript:2];
    [v23 constant];
    double v25 = v24;

    if (v25 != v13)
    {
      float64x2_t v26 = [v14 objectAtIndexedSubscript:2];
      [v26 setConstant:v13];
    }
    double v27 = [v14 objectAtIndexedSubscript:3];
    [v27 constant];
    double v29 = v28;

    if (v29 != v12)
    {
      double v30 = [v14 objectAtIndexedSubscript:3];
      [v30 setConstant:v12];
    }
    BOOL v3 = v31;
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGPoint)focusScaleAnchorPoint
{
  double x = self->_focusScaleAnchorPoint.x;
  double y = self->_focusScaleAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFocusScaleAnchorPoint:(CGPoint)a3
{
  self->_focusScaleAnchorPoint = a3;
}

- (double)visualEffectContainerViewScaleFactor
{
  return self->_visualEffectContainerViewScaleFactor;
}

- (void)setVisualEffectContainerViewScaleFactor:(double)a3
{
  self->_visualEffectContainerViewScaleFactor = a3;
}

- (void)setFocusAnimationConfiguration:(id)a3
{
}

- (BOOL)useShadowImage
{
  return self->_useShadowImage;
}

- (BOOL)isShadowEnabled
{
  return self->_shadowEnabled;
}

- (CGSize)shadowSize
{
  double width = self->_shadowSize.width;
  double height = self->_shadowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowSize:(CGSize)a3
{
  self->_shadowSize = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_double shadowRadius = a3;
}

- (double)shadowVerticalOffset
{
  return self->_shadowVerticalOffset;
}

- (void)setShadowVerticalOffset:(double)a3
{
  self->_double shadowVerticalOffset = a3;
}

- (double)unfocusedShadowRadius
{
  return self->_unfocusedShadowRadius;
}

- (double)unfocusedShadowOpacity
{
  return self->_unfocusedShadowOpacity;
}

- (double)unfocusedShadowVerticalOffset
{
  return self->_unfocusedShadowVerticalOffset;
}

- (CGSize)unfocusedShadowExpansion
{
  double width = self->_unfocusedShadowExpansion.width;
  double height = self->_unfocusedShadowExpansion.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUnfocusedShadowExpansion:(CGSize)a3
{
  self->_unfocusedShadowExpansion = a3;
}

- (CGSize)shadowExpansion
{
  double width = self->_shadowExpansion.width;
  double height = self->_shadowExpansion.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowExpansion:(CGSize)a3
{
  self->_shadowExpansion = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (CGRect)shadowContentsCenter
{
  double x = self->_shadowContentsCenter.origin.x;
  double y = self->_shadowContentsCenter.origin.y;
  double width = self->_shadowContentsCenter.size.width;
  double height = self->_shadowContentsCenter.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (_UIFloatingMotionConfiguration)contentMotion
{
  return self->_contentMotion;
}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (void)setHighlightStyle:(int64_t)a3
{
  self->_int64_t highlightStyle = a3;
}

- (BOOL)isContentOpaque
{
  return self->_contentOpaque;
}

- (void)setContentOpaque:(BOOL)a3
{
  self->_contentOpaque = a3;
}

- (BOOL)forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview
{
  return self->_forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview;
}

- (void)setForwardsSubviewIntrinsicContentSizeInvalidationsToSuperview:(BOOL)a3
{
  self->_forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview = a3;
}

- (BOOL)scalesBackwards
{
  return self->_scalesBackwards;
}

- (BOOL)roundContentWhenDeselected
{
  return self->_roundContentWhenDeselected;
}

- (CGSize)asymmetricScaleFactor
{
  double width = self->_asymmetricScaleFactor.width;
  double height = self->_asymmetricScaleFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)asymmetricFocusedSizeIncrease
{
  double width = self->_asymmetricFocusedSizeIncrease.width;
  double height = self->_asymmetricFocusedSizeIncrease.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)_disableOutsetShadowPath
{
  return self->__disableOutsetShadowPath;
}

- (void)set_disableOutsetShadowPath:(BOOL)a3
{
  self->__disableOutsetShadowPath = a3;
}

- (BOOL)showsHighContrastFocusIndicator
{
  return self->_showsHighContrastFocusIndicator;
}

- (double)highContrastFocusIndicatorCornerRadius
{
  return self->_highContrastFocusIndicatorCornerRadius;
}

- (CGPoint)highContrastFocusIndicatorOutset
{
  double x = self->_highContrastFocusIndicatorOutset.x;
  double y = self->_highContrastFocusIndicatorOutset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHighContrastFocusIndicatorOutset:(CGPoint)a3
{
  self->_highContrastFocusIndicatorOutset = a3;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (id)focusAnimationConfigurationHandler
{
  return self->_focusAnimationConfigurationHandler;
}

- (void)setFocusAnimationConfigurationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_focusAnimationConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_contentMotion, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_focusAnimationConfiguration, 0);
  objc_storeStrong((id *)&self->_contentMotionEffects, 0);
  objc_storeStrong((id *)&self->_highContrastFocusIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_visualEffectContainerView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_destroyWeak((id *)&self->_floatingContentViewDelegate);
}

@end