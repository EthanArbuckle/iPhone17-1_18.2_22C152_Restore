@interface _UIBackdropView
+ (Class)defaultSettingsClass;
+ (Class)layerClass;
+ (id)allBackdropViews;
+ (void)adjustGraphicsQualityForAccessibilityIfNeeded:(id)a3;
+ (void)setAllBackdropViewsToGraphicsQuality:(int64_t)a3;
- (BOOL)_backdropVisible;
- (BOOL)allowsColorSettingsSuppression;
- (BOOL)appliesOutputSettingsAutomatically;
- (BOOL)appliesOutputSettingsAutomaticallyEnabledComputesColorSettings;
- (BOOL)applySaturationBeforeBlur;
- (BOOL)applySettingsAfterLayout;
- (BOOL)applyingBackdropChanges;
- (BOOL)applyingTransition;
- (BOOL)autoGroup;
- (BOOL)autosizesToFitSuperview;
- (BOOL)backdropVisibilitySetOnce;
- (BOOL)blurRadiusSetOnce;
- (BOOL)blursBackground;
- (BOOL)computesColorSettings;
- (BOOL)contentViewAccessed;
- (BOOL)contentViewAccessorGuard;
- (BOOL)disablesOccludedBackdropBlurs;
- (BOOL)isBackdropVisible;
- (BOOL)requiresTintViews;
- (BOOL)simulatesMasks;
- (BOOL)transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack;
- (BOOL)updateMaskViewsForViewReentrancyGuard;
- (CAFilter)colorOffsetFilter;
- (CAFilter)colorSaturateFilter;
- (CAFilter)gaussianBlurFilter;
- (CAFilter)tintFilter;
- (NSHashTable)observers;
- (NSMutableDictionary)colorBurnTintMaskViewMap;
- (NSMutableDictionary)colorTintMaskViewMap;
- (NSMutableDictionary)darkeningTintMaskViewMap;
- (NSMutableDictionary)filterMaskViewMap;
- (NSMutableDictionary)grayscaleTintMaskViewMap;
- (NSMutableSet)partialMaskViews;
- (NSString)_blurQuality;
- (NSString)groupName;
- (UIColor)colorMatrixColorTint;
- (UIImage)colorBurnTintMaskImage;
- (UIImage)colorTintMaskImage;
- (UIImage)darkeningTintMaskImage;
- (UIImage)filterMaskImage;
- (UIImage)grayscaleTintMaskImage;
- (UIView)colorBurnTintMaskViewContainer;
- (UIView)colorBurnTintView;
- (UIView)colorTintMaskViewContainer;
- (UIView)colorTintView;
- (UIView)contentView;
- (UIView)darkeningTintMaskViewContainer;
- (UIView)darkeningTintView;
- (UIView)filterMaskViewContainer;
- (UIView)grayscaleTintMaskViewContainer;
- (UIView)grayscaleTintView;
- (_UIBackdropEffectView)backdropEffectView;
- (_UIBackdropView)init;
- (_UIBackdropView)initWithFrame:(CGRect)a3;
- (_UIBackdropView)initWithFrame:(CGRect)a3 autosizesToFitSuperview:(BOOL)a4 settings:(id)a5;
- (_UIBackdropView)initWithFrame:(CGRect)a3 privateStyle:(int64_t)a4;
- (_UIBackdropView)initWithFrame:(CGRect)a3 settings:(id)a4;
- (_UIBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (_UIBackdropView)initWithPrivateStyle:(int64_t)a3;
- (_UIBackdropView)initWithSettings:(id)a3;
- (_UIBackdropView)initWithStyle:(int64_t)a3;
- (_UIBackdropViewGraphicsQualityChangeDelegate)graphicsQualityChangeDelegate;
- (_UIBackdropViewObserver)observer;
- (_UIBackdropViewSettings)inputSettings;
- (_UIBackdropViewSettings)outputSettings;
- (_UIBackdropViewSettings)savedInputSettingsDuringRenderInContext;
- (double)_blurRadius;
- (double)_continuousCornerRadius;
- (double)_cornerRadius;
- (double)_saturationDeltaFactor;
- (double)appliesOutputSettingsAnimationDuration;
- (double)blurRadius;
- (double)colorMatrixColorTintAlpha;
- (double)colorMatrixGrayscaleTintAlpha;
- (double)colorMatrixGrayscaleTintLevel;
- (double)previousBackdropStatisticsBlue;
- (double)previousBackdropStatisticsContrast;
- (double)previousBackdropStatisticsGreen;
- (double)previousBackdropStatisticsRed;
- (double)saturationDeltaFactor;
- (id)blurQuality;
- (id)computeAndApplySettingsNotificationObserver;
- (id)filters;
- (int64_t)configuration;
- (int64_t)maskMode;
- (int64_t)style;
- (void)_applyCornerRadiusToSubviews;
- (void)_setBlursBackground:(BOOL)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_transitionToGraphicsQuality:(int64_t)a3;
- (void)_updateBackdropGroupName;
- (void)_updateFilters;
- (void)addBackdropEffectViewIfNeededForSettings:(id)a3;
- (void)addColorBurnTintViewIfNeededForSettings:(id)a3;
- (void)addColorTintViewIfNeededForSettings:(id)a3;
- (void)addContentViewIfNeededForSettings:(id)a3;
- (void)addDarkeningTintViewIfNeededForSettings:(id)a3;
- (void)addGrayscaleTintViewIfNeededForSettings:(id)a3;
- (void)addObserver:(id)a3;
- (void)adjustTintImplementationIfNeeded:(id)a3;
- (void)applyOverlayBlendMode:(int64_t)a3 toView:(id)a4;
- (void)applyOverlayBlendModeToView:(id)a3;
- (void)applySettings:(id)a3;
- (void)applySettingsWithBuiltInAnimation:(id)a3;
- (void)computeAndApplySettingsForTransition;
- (void)dealloc;
- (void)didCallRenderInContextOnBackdropViewLayer;
- (void)didMoveToSuperview;
- (void)ensureProperSubviewOrdering;
- (void)layoutSubviews;
- (void)prepareForTransitionToSettings:(id)a3;
- (void)removeMaskViews;
- (void)removeObserver:(id)a3;
- (void)removeOverlayBlendModeFromView:(id)a3;
- (void)setAllowsColorSettingsSuppression:(BOOL)a3;
- (void)setAppliesOutputSettingsAnimationDuration:(double)a3;
- (void)setAppliesOutputSettingsAutomatically:(BOOL)a3;
- (void)setAppliesOutputSettingsAutomaticallyEnabledComputesColorSettings:(BOOL)a3;
- (void)setApplySaturationBeforeBlur:(BOOL)a3;
- (void)setApplySettingsAfterLayout:(BOOL)a3;
- (void)setApplyingBackdropChanges:(BOOL)a3;
- (void)setApplyingTransition:(BOOL)a3;
- (void)setAutoGroup:(BOOL)a3;
- (void)setAutosizesToFitSuperview:(BOOL)a3;
- (void)setBackdropEffectView:(id)a3;
- (void)setBackdropVisibilitySetOnce:(BOOL)a3;
- (void)setBackdropVisible:(BOOL)a3;
- (void)setBlurFilterWithRadius:(double)a3 blurQuality:(id)a4;
- (void)setBlurQuality:(id)a3;
- (void)setBlurRadius:(double)a3;
- (void)setBlurRadiusSetOnce:(BOOL)a3;
- (void)setBlursBackground:(BOOL)a3;
- (void)setColorBurnTintMaskImage:(id)a3;
- (void)setColorBurnTintMaskViewContainer:(id)a3;
- (void)setColorBurnTintMaskViewMap:(id)a3;
- (void)setColorBurnTintView:(id)a3;
- (void)setColorMatrixColorTint:(id)a3;
- (void)setColorMatrixColorTintAlpha:(double)a3;
- (void)setColorMatrixGrayscaleTintAlpha:(double)a3;
- (void)setColorMatrixGrayscaleTintLevel:(double)a3;
- (void)setColorOffsetFilter:(id)a3;
- (void)setColorOffsetFilterForSettings:(id)a3;
- (void)setColorSaturateFilter:(id)a3;
- (void)setColorTintMaskImage:(id)a3;
- (void)setColorTintMaskViewContainer:(id)a3;
- (void)setColorTintMaskViewMap:(id)a3;
- (void)setColorTintView:(id)a3;
- (void)setComputeAndApplySettingsNotificationObserver:(id)a3;
- (void)setConfiguration:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewAccessed:(BOOL)a3;
- (void)setContentViewAccessorGuard:(BOOL)a3;
- (void)setDarkeningTintMaskImage:(id)a3;
- (void)setDarkeningTintMaskViewContainer:(id)a3;
- (void)setDarkeningTintMaskViewMap:(id)a3;
- (void)setDarkeningTintView:(id)a3;
- (void)setFilterMaskImage:(id)a3;
- (void)setFilterMaskViewContainer:(id)a3;
- (void)setFilterMaskViewMap:(id)a3;
- (void)setGaussianBlurFilter:(id)a3;
- (void)setGraphicsQualityChangeDelegate:(id)a3;
- (void)setGrayscaleTintMaskImage:(id)a3;
- (void)setGrayscaleTintMaskViewContainer:(id)a3;
- (void)setGrayscaleTintMaskViewMap:(id)a3;
- (void)setGrayscaleTintView:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setInputSettings:(id)a3;
- (void)setMaskImage:(id)a3 onLayer:(id)a4;
- (void)setMaskMode:(int64_t)a3;
- (void)setObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setOutputSettings:(id)a3;
- (void)setPartialMaskViews:(id)a3;
- (void)setPreviousBackdropStatisticsBlue:(double)a3;
- (void)setPreviousBackdropStatisticsContrast:(double)a3;
- (void)setPreviousBackdropStatisticsGreen:(double)a3;
- (void)setPreviousBackdropStatisticsRed:(double)a3;
- (void)setRequiresTintViews:(BOOL)a3;
- (void)setSaturationDeltaFactor:(double)a3;
- (void)setSavedInputSettingsDuringRenderInContext:(id)a3;
- (void)setShouldRasterizeEffectsView:(BOOL)a3;
- (void)setSimulatesMasks:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintFilter:(id)a3;
- (void)setTintFilterForSettings:(id)a3;
- (void)setTintOpacity:(double)a3;
- (void)setTransitioningBetweenMaterialsRequiringRasterizationAndAlphaHack:(BOOL)a3;
- (void)setUpdateMaskViewsForViewReentrancyGuard:(BOOL)a3;
- (void)setUsesZoom;
- (void)set_backdropVisible:(BOOL)a3;
- (void)set_blurQuality:(id)a3;
- (void)set_blurRadius:(double)a3;
- (void)set_saturationDeltaFactor:(double)a3;
- (void)settingsDidChange:(id)a3;
- (void)transitionComplete;
- (void)transitionIncrementallyToSettings:(id)a3 weighting:(double)a4;
- (void)transitionIncrementallyToStyle:(int64_t)a3 weighting:(double)a4;
- (void)transitionToColor:(id)a3;
- (void)transitionToSettings:(id)a3;
- (void)transitionToStyle:(int64_t)a3;
- (void)updateMaskViewForView:(id)a3 flag:(int64_t)a4;
- (void)updateMaskViewsForView:(id)a3;
- (void)updateSubviewHierarchyIfNeededForSettings:(id)a3;
- (void)willCallRenderInContextOnBackdropViewLayer;
@end

@implementation _UIBackdropView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = self;
  v3 = _UIBackdropViewQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___RemoveFromAllBackdropViews_block_invoke;
  block[3] = &unk_1E52D9F70;
  v13 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = [(_UIBackdropView *)v4 computeAndApplySettingsNotificationObserver];

  if (v6)
  {
    v7 = [(_UIBackdropView *)v4 computeAndApplySettingsNotificationObserver];
    [v5 removeObserver:v7];

    id computeAndApplySettingsNotificationObserver = v4->_computeAndApplySettingsNotificationObserver;
    v4->_id computeAndApplySettingsNotificationObserver = 0;
  }
  v14[0] = @"UIApplicationDidBecomeActiveNotification";
  v14[1] = @"UIAccessibilityReduceTransparencyStatusDidChangeNotification";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v5, v4, v9);

  [(_UIBackdropView *)v4 setComputesColorSettings:0];
  v4->_observer = 0;
  observers = v4->_observers;
  v4->_observers = 0;

  [(_UIBackdropViewSettings *)v4->_inputSettings setBackdrop:0];
  [(_UIBackdropViewSettings *)v4->_outputSettings setBackdrop:0];
  [(_UIBackdropViewSettings *)v4->_savedInputSettingsDuringRenderInContext setBackdrop:0];

  v11.receiver = v4;
  v11.super_class = (Class)_UIBackdropView;
  [(UIView *)&v11 dealloc];
}

- (void)computeAndApplySettingsForTransition
{
  v3 = [(_UIBackdropView *)self outputSettings];
  v4 = [(_UIBackdropView *)self inputSettings];
  [v3 computeOutputSettingsUsingModel:v4];

  v5 = [(_UIBackdropView *)self outputSettings];
  [(_UIBackdropView *)self applySettings:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55___UIBackdropView_computeAndApplySettingsForTransition__block_invoke;
  aBlock[3] = &unk_1E52DC3A0;
  aBlock[4] = self;
  v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (!+[UIView _addCompletion:v6]) {
    v6[2](v6, 1);
  }
  v7 = [(_UIBackdropView *)self observers];
  v8 = [v7 allObjects];
  [v8 makeObjectsPerformSelector:sel_backdropViewDidChange_ withObject:self];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)layoutSubviews
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)_UIBackdropView;
  [(UIView *)&v27 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v11 = [(UIView *)self subviews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);
        v17 = [v16 layer];
        v18 = [v17 mask];
        objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);

        [v16 setNeedsDisplay];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v13);
  }

  if ([(_UIBackdropView *)self applySettingsAfterLayout])
  {
    [(_UIBackdropView *)self setApplySettingsAfterLayout:0];
    v19 = [(_UIBackdropView *)self outputSettings];
    v20 = [(_UIBackdropView *)self inputSettings];
    [v19 computeOutputSettingsUsingModel:v20];

    v21 = [(_UIBackdropView *)self outputSettings];
    [(_UIBackdropView *)self applySettings:v21];

    v22 = [(_UIBackdropView *)self outputSettings];
    [(_UIBackdropView *)self adjustTintImplementationIfNeeded:v22];
  }
}

- (void)didMoveToSuperview
{
  [(_UIBackdropView *)self _updateBackdropGroupName];
  if ([(_UIBackdropView *)self autosizesToFitSuperview])
  {
    double v3 = [(UIView *)self superview];
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    double Width = CGRectGetWidth(v14);
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    -[UIView setFrame:](self, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v15));
  }
  [(_UIBackdropView *)self setApplySettingsAfterLayout:[(_UIBackdropView *)self appliesOutputSettingsAutomatically]];
  [(UIView *)self setNeedsLayout];
}

- (BOOL)autosizesToFitSuperview
{
  return self->_autosizesToFitSuperview;
}

- (void)setApplySettingsAfterLayout:(BOOL)a3
{
  self->_applySettingsAfterLayout = a3;
}

- (BOOL)appliesOutputSettingsAutomatically
{
  return self->_appliesOutputSettingsAutomatically;
}

- (void)transitionToSettings:(id)a3
{
  [(_UIBackdropView *)self prepareForTransitionToSettings:a3];
  [(_UIBackdropView *)self computeAndApplySettingsForTransition];
}

- (void)prepareForTransitionToSettings:(id)a3
{
  id v4 = a3;
  [(_UIBackdropView *)self setApplyingTransition:1];
  CGFloat v5 = [(_UIBackdropView *)self inputSettings];
  BOOL v6 = [v5 style] == -2;

  uint64_t v7 = [v4 style];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___UIBackdropView_prepareForTransitionToSettings___block_invoke;
  v9[3] = &unk_1E52DD128;
  v9[4] = self;
  id v10 = v4;
  BOOL v11 = v6;
  BOOL v12 = v7 == -2;
  id v8 = v4;
  +[UIView performWithoutAnimation:v9];
}

- (void)setApplyingTransition:(BOOL)a3
{
  self->_applyingTransition = a3;
}

- (void)transitionComplete
{
  if (self->_applyingTransition)
  {
    [(_UIBackdropViewSettings *)self->_outputSettings computeOutputSettingsUsingModel:self->_inputSettings];
    [(_UIBackdropView *)self adjustTintImplementationIfNeeded:self->_outputSettings];
    if (!self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack)
    {
      [(_UIBackdropViewSettings *)self->_inputSettings scale];
      double v4 = v3;
      CGFloat v5 = [(_UIBackdropEffectView *)self->_backdropEffectView backdropLayer];
      [v5 setScale:v4];
    }
    [(_UIBackdropView *)self setBackdropVisible:[(_UIBackdropViewSettings *)self->_inputSettings isBackdropVisible]];
    self->_applyingTransition = 0;
  }
}

- (void)setBackdropVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->__backdropVisible != a3 || !self->_backdropVisibilitySetOnce)
  {
    self->_backdropVisibilitySetOnce = 1;
    CGFloat v5 = [(_UIBackdropEffectView *)self->_backdropEffectView backdropLayer];
    [v5 setEnabled:v3];

    self->__backdropVisible = v3;
    if (v3 || [(_UIBackdropViewSettings *)self->_inputSettings requiresBackdropLayer])
    {
      backdropEffectView = self->_backdropEffectView;
      if (backdropEffectView)
      {
        uint64_t v7 = [(UIView *)backdropEffectView superview];

        if (!v7)
        {
          [(_UIBackdropView *)self ensureProperSubviewOrdering];
        }
      }
    }
    else
    {
      id v8 = self->_backdropEffectView;
      [(UIView *)v8 removeFromSuperview];
    }
  }
}

- (void)_updateBackdropGroupName
{
  CGFloat v9 = self->_groupName;
  if (self->_autoGroup)
  {
    BOOL v3 = [(UIView *)self window];

    if (v3)
    {
      double v4 = [(UIView *)self traitCollection];
      CGFloat v5 = self;
      uint64_t v6 = [v4 objectForTrait:v5];

      CGFloat v9 = (NSString *)v6;
    }
  }
  uint64_t v7 = [(_UIBackdropView *)self backdropEffectView];
  id v8 = [v7 backdropLayer];
  [v8 setGroupName:v9];
}

- (void)adjustTintImplementationIfNeeded:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(_UIBackdropView *)self tintFilter];

  [v4 grayscaleTintAlpha];
  if (v6 <= 0.00000011920929)
  {
    [v4 colorTintAlpha];
    BOOL v7 = v8 > 0.00000011920929;
  }
  else
  {
    BOOL v7 = 1;
  }
  BOOL v9 = [(_UIBackdropView *)self requiresTintViews];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52___UIBackdropView_adjustTintImplementationIfNeeded___block_invoke;
  v11[3] = &unk_1E52DD150;
  BOOL v13 = v5 != 0;
  BOOL v14 = v9;
  v11[4] = self;
  id v12 = v4;
  BOOL v15 = v7;
  id v10 = v4;
  +[UIView performWithoutAnimation:v11];
}

- (CAFilter)tintFilter
{
  return self->_tintFilter;
}

- (void)setAppliesOutputSettingsAutomatically:(BOOL)a3
{
  self->_appliesOutputSettingsAutomatically = a3;
  if (a3)
  {
    id v4 = [(_UIBackdropView *)self inputSettings];
    uint64_t v5 = [v4 requiresColorStatistics];
  }
  else
  {
    if (![(_UIBackdropView *)self appliesOutputSettingsAutomaticallyEnabledComputesColorSettings])return; {
    uint64_t v5 = 0;
    }
  }
  [(_UIBackdropView *)self setComputesColorSettings:v5];
  [(_UIBackdropView *)self setAppliesOutputSettingsAutomaticallyEnabledComputesColorSettings:v5];
}

- (BOOL)requiresTintViews
{
  if ([(_UIBackdropView *)self configuration] == 1) {
    return 1;
  }
  if ([(_UIBackdropView *)self configuration] == 2) {
    return 0;
  }
  id v4 = [(_UIBackdropView *)self partialMaskViews];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 1;
  }
  BOOL v7 = [(_UIBackdropView *)self inputSettings];
  double v8 = [v7 grayscaleTintMaskImage];

  BOOL v9 = [(_UIBackdropView *)self inputSettings];
  id v10 = [v9 colorTintMaskImage];

  BOOL v11 = [(_UIBackdropView *)self inputSettings];
  id v12 = [v11 filterMaskImage];

  if (!v8 && !v10 && !v12 || (char v3 = 1, v8 == v10) && v10 == v12 && v8 == v12)
  {
    BOOL v13 = [(_UIBackdropView *)self inputSettings];
    uint64_t v14 = [v13 graphicsQuality];

    if (v14 == 10
      || ([(_UIBackdropView *)self inputSettings],
          BOOL v15 = objc_claimAutoreleasedReturnValue(),
          [v15 blurRadius],
          double v17 = v16,
          v15,
          v17 < 0.00000011920929)
      || [(_UIBackdropView *)self applyingTransition])
    {
      char v3 = 1;
    }
    else
    {
      v18 = [(_UIBackdropView *)self inputSettings];
      char v3 = [v18 usesColorTintView];
    }
  }

  return v3;
}

- (_UIBackdropViewSettings)inputSettings
{
  return self->_inputSettings;
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (NSMutableSet)partialMaskViews
{
  return self->_partialMaskViews;
}

- (BOOL)applySettingsAfterLayout
{
  return self->_applySettingsAfterLayout;
}

- (id)computeAndApplySettingsNotificationObserver
{
  return self->_computeAndApplySettingsNotificationObserver;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 privateStyle:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v9 = +[_UIBackdropViewSettings settingsForStyle:a4];
  id v10 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, v9, x, y, width, height);

  return v10;
}

- (_UIBackdropView)initWithPrivateStyle:(int64_t)a3
{
  id v4 = +[_UIBackdropViewSettings settingsForStyle:a3];
  uint64_t v5 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v5;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 autosizesToFitSuperview:(BOOL)a4 settings:(id)a5
{
  BOOL v5 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_UIBackdropView;
  id v12 = -[UIView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  BOOL v13 = v12;
  if (v12)
  {
    uint64_t v14 = v12;
    BOOL v15 = _UIBackdropViewQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___AddToAllBackdropViews_block_invoke;
    block[3] = &unk_1E52D9F70;
    v31 = v14;
    double v16 = v14;
    dispatch_sync(v15, block);

    double v17 = [(_UIBackdropView *)v16 backdropViewLayer];
    [v17 setBackdropView:v16];

    [(_UIBackdropView *)v16 setAutosizesToFitSuperview:v5];
    if ([(_UIBackdropView *)v16 autosizesToFitSuperview]) {
      [(UIView *)v16 setAutoresizingMask:18];
    }
    if (!v11)
    {
      NSLog(&cfstr_WarningCalling_0.isa);
      id v11 = objc_alloc_init(+[_UIBackdropView defaultSettingsClass]);
    }
    int v18 = _AXSEnhanceBackgroundContrastEnabled();
    _MergedGlobals_69 = v18 != 0;
    if (v18)
    {
      uint64_t v19 = +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:v11 graphicsQuality:10];

      id v11 = (id)v19;
    }
    [(_UIBackdropView *)v16 setInputSettings:v11];
    if ([v11 style])
    {
      +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", [v11 style]);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = objc_alloc_init((Class)objc_opt_class());
    }
    v21 = v20;
    [(_UIBackdropView *)v16 setOutputSettings:v20];

    -[_UIBackdropView setStyle:](v16, "setStyle:", [v11 style]);
    v22 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(_UIBackdropView *)v16 setObservers:v22];

    [(UIView *)v16 setOpaque:0];
    [(UIView *)v16 setUserInteractionEnabled:0];
    [(_UIBackdropView *)v16 setAppliesOutputSettingsAnimationDuration:0.25];
    long long v23 = [(UIView *)v16 layer];
    [v23 setAllowsGroupBlending:0];

    long long v24 = [(UIView *)v16 layer];
    [v24 setAllowsGroupOpacity:0];

    long long v25 = [(_UIBackdropView *)v16 inputSettings];
    [(_UIBackdropView *)v16 updateSubviewHierarchyIfNeededForSettings:v25];

    long long v26 = [(_UIBackdropView *)v16 inputSettings];
    [(_UIBackdropView *)v16 applySettings:v26];

    objc_super v27 = v16;
  }

  return v13;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (_UIBackdropViewSettings)outputSettings
{
  return self->_outputSettings;
}

- (void)_applyCornerRadiusToSubviews
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_cornerRadiusIsContinuous)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v3 = [(UIView *)self subviews];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = *(UIView **)(*((void *)&v18 + 1) + 8 * i);
          if (v8 != self->_contentView) {
            [(UIView *)v8 _setContinuousCornerRadius:self->_cornerRadius];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v3 = [(UIView *)self subviews];
    uint64_t v9 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v3);
          }
          BOOL v13 = *(UIView **)(*((void *)&v14 + 1) + 8 * j);
          if (v13 != self->_contentView) {
            [(UIView *)v13 _setCornerRadius:self->_cornerRadius];
          }
        }
        uint64_t v10 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v10);
    }
  }
}

- (void)updateSubviewHierarchyIfNeededForSettings:(id)a3
{
  id v4 = a3;
  [(_UIBackdropView *)self addBackdropEffectViewIfNeededForSettings:v4];
  [(_UIBackdropView *)self addGrayscaleTintViewIfNeededForSettings:v4];
  [(_UIBackdropView *)self addColorTintViewIfNeededForSettings:v4];
  [(_UIBackdropView *)self addColorBurnTintViewIfNeededForSettings:v4];
  [(_UIBackdropView *)self addContentViewIfNeededForSettings:v4];
  [(_UIBackdropView *)self addDarkeningTintViewIfNeededForSettings:v4];

  [(_UIBackdropView *)self ensureProperSubviewOrdering];
  [(_UIBackdropView *)self _applyCornerRadiusToSubviews];
}

- (void)setOutputSettings:(id)a3
{
  id v4 = (_UIBackdropViewSettings *)a3;
  [(_UIBackdropViewSettings *)self->_outputSettings setBackdrop:0];
  outputSettings = self->_outputSettings;
  self->_outputSettings = v4;
  uint64_t v6 = v4;

  [(_UIBackdropViewSettings *)self->_outputSettings setBackdrop:self];
}

- (void)setInputSettings:(id)a3
{
  id v4 = (_UIBackdropViewSettings *)a3;
  [(_UIBackdropViewSettings *)self->_inputSettings setBackdrop:0];
  inputSettings = self->_inputSettings;
  self->_inputSettings = v4;
  uint64_t v6 = v4;

  [(_UIBackdropViewSettings *)self->_inputSettings setBackdrop:self];
}

- (void)addGrayscaleTintViewIfNeededForSettings:(id)a3
{
  id v7 = a3;
  if (![v7 usesGrayscaleTintView]
    || ([(_UIBackdropView *)self grayscaleTintView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([v7 usesGrayscaleTintView])
    {
      uint64_t v5 = [UIView alloc];
      uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v6 setOpaque:0];
      [(UIView *)v6 setAutoresizingMask:18];
      [(UIView *)v6 setUserInteractionEnabled:0];
      [(UIView *)v6 setAlpha:0.0];
      [(UIView *)self bounds];
      -[UIView setFrame:](v6, "setFrame:");
      [(_UIBackdropView *)self setGrayscaleTintView:v6];
      [(_UIBackdropView *)self setAppliesOutputSettingsAutomatically:1];
    }
  }
}

- (void)addDarkeningTintViewIfNeededForSettings:(id)a3
{
  id v10 = a3;
  if (![v10 usesDarkeningTintView] || !self->_darkeningTintView)
  {
    if ([v10 usesDarkeningTintView])
    {
      id v4 = [UIView alloc];
      uint64_t v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v5 setOpaque:0];
      [(UIView *)v5 setAutoresizingMask:18];
      [(UIView *)self bounds];
      -[UIView setFrame:](v5, "setFrame:");
      uint64_t v6 = *MEMORY[0x1E4F3A070];
      id v7 = [(UIView *)v5 layer];
      [v7 setCompositingFilter:v6];

      double v8 = +[UIColor colorWithHue:0.619444444 saturation:0.2 brightness:0.64 alpha:1.0];
      [(UIView *)v5 setBackgroundColor:v8];

      [(UIView *)v5 setAlpha:0.2];
      [(_UIBackdropView *)self setDarkeningTintView:v5];
    }
    else
    {
      uint64_t v9 = [(_UIBackdropView *)self darkeningTintView];
      [v9 removeFromSuperview];

      [(_UIBackdropView *)self setDarkeningTintView:0];
    }
  }
}

- (void)setDarkeningTintView:(id)a3
{
}

- (void)addContentViewIfNeededForSettings:(id)a3
{
  id v6 = a3;
  if ((![v6 usesContentView] || !self->_contentView)
    && [v6 usesContentView]
    && [(_UIBackdropView *)self contentViewAccessed])
  {
    id v4 = [_UIBackdropContentView alloc];
    uint64_t v5 = -[_UIBackdropContentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v5 setOpaque:0];
    [(UIView *)v5 setAutoresizingMask:18];
    [(UIView *)self bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(_UIBackdropView *)self setContentView:v5];
  }
}

- (BOOL)contentViewAccessed
{
  return self->_contentViewAccessed;
}

- (void)addColorTintViewIfNeededForSettings:(id)a3
{
  id v7 = a3;
  if (![v7 usesColorTintView]
    || ([(_UIBackdropView *)self colorTintView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([v7 usesColorTintView])
    {
      uint64_t v5 = [UIView alloc];
      id v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v6 setOpaque:0];
      [(UIView *)v6 setAutoresizingMask:18];
      [(UIView *)v6 setUserInteractionEnabled:0];
      [(UIView *)v6 setAlpha:0.0];
      [(UIView *)self bounds];
      -[UIView setFrame:](v6, "setFrame:");
      [(_UIBackdropView *)self setColorTintView:v6];
      [(_UIBackdropView *)self setAppliesOutputSettingsAutomatically:1];
    }
  }
}

- (void)addColorBurnTintViewIfNeededForSettings:(id)a3
{
  id v9 = a3;
  if (![v9 usesColorBurnTintView]
    || ([(_UIBackdropView *)self colorBurnTintView],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    if ([v9 usesColorBurnTintView])
    {
      uint64_t v5 = [UIView alloc];
      id v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v6 setOpaque:0];
      [(UIView *)v6 setAutoresizingMask:18];
      [(UIView *)v6 setUserInteractionEnabled:0];
      [(UIView *)v6 setAlpha:0.0];
      [(UIView *)self bounds];
      -[UIView setFrame:](v6, "setFrame:");
      uint64_t v7 = *MEMORY[0x1E4F3A008];
      double v8 = [(UIView *)v6 layer];
      [v8 setCompositingFilter:v7];

      [(_UIBackdropView *)self setColorBurnTintView:v6];
      [(_UIBackdropView *)self setAppliesOutputSettingsAutomatically:1];
    }
  }
}

- (void)addBackdropEffectViewIfNeededForSettings:(id)a3
{
  id v9 = a3;
  if (([v9 usesBackdropEffectView] & 1) != 0
    || [(_UIBackdropView *)self computesColorSettings]
    || [v9 requiresBackdropLayer])
  {
    id v4 = [(_UIBackdropView *)self backdropEffectView];

    if (!v4)
    {
      uint64_t v5 = objc_alloc_init(_UIBackdropEffectView);
      [(UIView *)self bounds];
      -[UIView setFrame:](v5, "setFrame:");
      id v6 = [(UIView *)v5 layer];
      [v6 setAllowsEdgeAntialiasing:0];

      groupName = self->_groupName;
      double v8 = [(_UIBackdropEffectView *)v5 backdropLayer];
      [v8 setGroupName:groupName];

      [(_UIBackdropView *)self setBackdropEffectView:v5];
      [(_UIBackdropView *)self setAppliesOutputSettingsAutomatically:1];
    }
  }
}

- (void)transitionIncrementallyToSettings:(id)a3 weighting:(double)a4
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = self->_outputSettings;
  }
  else
  {
    uint64_t v7 = [[_UIBackdropViewSettingsCombiner alloc] initWithDefaultValuesForGraphicsQuality:0];
    double v8 = [(_UIBackdropViewSettings *)self->_inputSettings colorSettings];
    [(_UIBackdropViewSettings *)v7 setColorSettings:v8];

    [(_UIBackdropViewSettingsCombiner *)v7 setInputSettingsA:self->_inputSettings];
    [(_UIBackdropViewSettingsCombiner *)v7 setInputSettingsB:v11];
    [(_UIBackdropView *)self prepareForTransitionToSettings:v7];
    id v6 = self->_outputSettings;
    id v9 = [(_UIBackdropViewSettingsCombiner *)v7 inputSettingsA];
    [(_UIBackdropViewSettings *)v6 setInputSettingsA:v9];

    id v10 = [(_UIBackdropViewSettingsCombiner *)v7 inputSettingsB];
    [(_UIBackdropViewSettings *)v6 setInputSettingsB:v10];

    self->_style = -3;
  }
  [(_UIBackdropViewSettings *)v6 setWeighting:a4];
  [(_UIBackdropViewSettings *)v6 computeOutputSettingsUsingModel:self->_inputSettings];
  [(_UIBackdropView *)self applySettings:v6];
}

- (void)applySettings:(id)a3
{
  id v4 = (double *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *((void *)v4 + 3);
    if (self->_style == v6)
    {
      if (!self->_applyingTransition && !*((unsigned char *)v4 + 328)) {
        goto LABEL_31;
      }
      if (self->_tintFilter) {
        [(_UIBackdropView *)self setTintFilterForSettings:v4];
      }
      [(_UIBackdropView *)self setColorOffsetFilterForSettings:v5];
      double v7 = 1.0;
      double v8 = 1.0;
      if (!*((unsigned char *)v5 + 120)) {
        double v8 = v5[12];
      }
      id v9 = +[UIColor colorWithWhite:v5[11] alpha:v8];
      [(UIView *)self->_grayscaleTintView setBackgroundColor:v9];

      if (*((unsigned char *)v5 + 120)) {
        double v7 = v5[12];
      }
      [(UIView *)self->_grayscaleTintView setAlpha:v7];
      [(_UIBackdropView *)self setGrayscaleTintMaskImage:*((void *)v5 + 14)];
      float v10 = v5[13];
      id v11 = [(UIView *)self->_grayscaleTintView layer];
      id v12 = [v11 mask];
      *(float *)&double v13 = v10;
      [v12 setOpacity:v13];

      int v14 = *((unsigned __int8 *)v5 + 120);
      if (*((unsigned char *)v5 + 120))
      {
        long long v15 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A228]];
      }
      else
      {
        long long v15 = 0;
      }
      long long v16 = [(UIView *)self->_grayscaleTintView layer];
      [v16 setCompositingFilter:v15];

      if (v14) {
      [(UIView *)self->_colorTintView setBackgroundColor:*((void *)v5 + 16)];
      }
      [(UIView *)self->_colorTintView setAlpha:v5[17]];
      [(_UIBackdropView *)self setColorTintMaskImage:*((void *)v5 + 19)];
      float v17 = v5[18];
      long long v18 = [(UIView *)self->_colorTintView layer];
      long long v19 = [v18 mask];
      *(float *)&double v20 = v17;
      [v19 setOpacity:v20];

      long long v21 = +[UIColor colorWithWhite:v5[20] alpha:1.0];
      [(UIView *)self->_colorBurnTintView setBackgroundColor:v21];

      [(UIView *)self->_colorBurnTintView setAlpha:v5[21]];
      [(_UIBackdropView *)self setColorBurnTintMaskImage:*((void *)v5 + 22)];
      [(UIView *)self->_darkeningTintView setAlpha:v5[23]];
      v22 = +[UIColor colorWithHue:v5[24] saturation:v5[25] brightness:v5[26] alpha:1.0];
      [(UIView *)self->_darkeningTintView setBackgroundColor:v22];

      [(_UIBackdropView *)self setDarkeningTintMaskImage:*((void *)v5 + 27)];
      long long v23 = (void *)MEMORY[0x1E4F3A078];
      if (!*((unsigned char *)v5 + 224)) {
        long long v23 = (void *)MEMORY[0x1E4F3A070];
      }
      uint64_t v24 = [MEMORY[0x1E4F39BC0] filterWithType:*v23];
      long long v25 = [(UIView *)self->_darkeningTintView layer];
      [v25 setCompositingFilter:v24];

      [(_UIBackdropView *)self setBlurFilterWithRadius:*((void *)v5 + 30) blurQuality:v5[29]];
      [(_UIBackdropView *)self setSaturationDeltaFactor:v5[31]];
      [(_UIBackdropView *)self setFilterMaskImage:*((void *)v5 + 33)];
      long long v26 = [(UIView *)self->_backdropEffectView layer];
      float v27 = v5[32];
      v28 = [v26 mask];
      *(float *)&double v29 = v27;
      [v28 setOpacity:v29];

      double v30 = v5[10];
      v31 = [(_UIBackdropView *)self backdropEffectView];
      [v31 setZoom:v30];

      if (self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack)
      {
        +[UIView _currentAnimationDuration];
        if (v32 <= 0.0)
        {
          double v35 = 0.075;
          double v34 = 0.025;
        }
        else
        {
          double v33 = v32 * 60.0;
          double v34 = 1.0 / v33;
          double v35 = 2.0 / v33;
        }
        double v36 = v5[10];
        v37 = [(_UIBackdropView *)self backdropEffectView];
        v38 = v37;
        if (v36 <= 0.0)
        {
          [v37 setAlpha:1.0];

          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __33___UIBackdropView_applySettings___block_invoke_3;
          v46[3] = &unk_1E52DD178;
          *(double *)&v46[5] = v34;
          *(double *)&v46[6] = v35;
          v46[4] = self;
          v39 = v46;
        }
        else
        {
          [v37 setAlpha:0.0];

          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __33___UIBackdropView_applySettings___block_invoke;
          v47[3] = &unk_1E52DD178;
          *(double *)&v47[5] = v34;
          *(double *)&v47[6] = v35;
          v47[4] = self;
          v39 = v47;
        }
        +[UIView animateKeyframesWithDuration:0 delay:v39 options:0 animations:0.0 completion:0.0];
      }
      else
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __33___UIBackdropView_applySettings___block_invoke_5;
        v45[3] = &unk_1E52D9F70;
        v45[4] = self;
        +[UIView performWithoutAnimation:v45];
      }

      if (!self->_applyingTransition)
      {
LABEL_31:
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __33___UIBackdropView_applySettings___block_invoke_6;
        v43[3] = &unk_1E52D9F98;
        v43[4] = self;
        v40 = v5;
        v44 = v40;
        +[UIView performWithoutAnimation:v43];
        if (!self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack)
        {
          double v41 = v40[36];
          v42 = [(_UIBackdropEffectView *)self->_backdropEffectView backdropLayer];
          [v42 setScale:v41];
        }
      }
    }
    else
    {
      NSLog(&cfstr_WarningTriedTo_0.isa, self->_style, v6);
    }
  }
  else
  {
    NSLog(&cfstr_WarningTriedTo.isa, self);
  }
}

- (void)setSaturationDeltaFactor:(double)a3
{
  colorSaturateFilter = self->_colorSaturateFilter;
  if (self->_backdropEffectView)
  {
    if (!colorSaturateFilter)
    {
      uint64_t v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
      double v7 = [NSNumber numberWithDouble:a3];
      [v6 setValue:v7 forKey:@"inputAmount"];

      [v6 setName:@"colorSaturate"];
      double v8 = self->_colorSaturateFilter;
      self->_colorSaturateFilter = (CAFilter *)v6;

      [(_UIBackdropView *)self _updateFilters];
    }
    if (self->__saturationDeltaFactor != a3)
    {
      id v9 = [(UIView *)self->_backdropEffectView layer];
      float v10 = [NSNumber numberWithDouble:a3];
      [v9 setValue:v10 forKeyPath:@"filters.colorSaturate.inputAmount"];

      self->__saturationDeltaFactor = a3;
    }
  }
  else if (colorSaturateFilter)
  {
    self->_colorSaturateFilter = 0;

    [(_UIBackdropView *)self _updateFilters];
  }
}

- (void)setDarkeningTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningTintMaskImage, a3);
  id v5 = a3;
  id v7 = [(_UIBackdropView *)self darkeningTintView];
  uint64_t v6 = [v7 layer];
  [(_UIBackdropView *)self setMaskImage:v5 onLayer:v6];
}

- (void)setColorTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_colorTintMaskImage, a3);
  id v5 = a3;
  id v7 = [(_UIBackdropView *)self colorTintView];
  uint64_t v6 = [v7 layer];
  [(_UIBackdropView *)self setMaskImage:v5 onLayer:v6];
}

- (void)setColorOffsetFilterForSettings:(id)a3
{
  id v4 = (double *)a3;
  double v8 = v4;
  if (self->_backdropEffectView)
  {
    if (*((unsigned char *)v4 + 310))
    {
      id v9 = (void *)*((void *)v4 + 40);
      if (v9)
      {
        [v9 CAColorMatrixValue];
        __int32 v31 = v34;
        __int32 v32 = v35;
        float32x2_t v10 = v36;
        int32x2_t v11 = v38;
        float v12 = v39;
        long long v29 = v37;
        long long v30 = v40;
        uint64_t v13 = v41;
        int v14 = v42;
        objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:", *MEMORY[0x1E4F3A038], v33, v15);
      }
      else
      {
        double v17 = v8[39];
        double v18 = 1.0 - v17;
        *(float *)&unsigned int v19 = v17 * 0.8 + 1.0 - v17;
        v6.f64[0] = (1.0 - v17) * 0.0;
        float64x2_t v20 = vmulq_n_f64((float64x2_t)xmmword_186B92EB0, v17);
        *(void *)&v21.f64[0] = *(_OWORD *)&vsubq_f64(v6, v20);
        v21.f64[1] = vaddq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v6, 0), v20).f64[1];
        *(float *)v7.i32 = v20.f64[0] + v6.f64[0];
        float32x2_t v22 = vcvt_f32_f64(v21);
        *(float *)&unsigned int v23 = v17 + 1.0 - v17;
        *(float *)&double v17 = v17 * 0.1 + v6.f64[0];
        LODWORD(v24) = v7.i32[0];
        float v12 = v20.f64[0] + v18;
        HIDWORD(v24) = v7.i32[0];
        long long v29 = __PAIR64__(LODWORD(v17), v23);
        long long v30 = v24;
        __int32 v32 = v7.i32[0];
        int32x2_t v11 = vdup_lane_s32(v7, 0);
        uint64_t v13 = 0x3F80000000000000;
        int v14 = 0;
        __int32 v31 = v22.i32[0];
        float32x2_t v10 = v22;
        objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:", *MEMORY[0x1E4F3A038], v19, v5);
      long long v25 = };
      uint64_t v33 = v28;
      __int32 v34 = v31;
      __int32 v35 = v32;
      float32x2_t v36 = v10;
      long long v37 = v29;
      int32x2_t v38 = v11;
      float v39 = v12;
      long long v40 = v30;
      uint64_t v41 = v13;
      int v42 = v14;
      long long v26 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v33];
      [v25 setValue:v26 forKey:@"inputColorMatrix"];

      colorOffsetFilter = self->_colorOffsetFilter;
      self->_colorOffsetFilter = (CAFilter *)v25;

      goto LABEL_9;
    }
  }
  else
  {
    long long v16 = self->_colorOffsetFilter;
    if (v16)
    {
      self->_colorOffsetFilter = 0;

LABEL_9:
      [(_UIBackdropView *)self _updateFilters];
    }
  }
}

- (void)setColorBurnTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, a3);
  id v5 = a3;
  id v7 = [(_UIBackdropView *)self colorBurnTintView];
  float64x2_t v6 = [v7 layer];
  [(_UIBackdropView *)self setMaskImage:v5 onLayer:v6];
}

- (void)setFilterMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_filterMaskImage, a3);
  id v5 = a3;
  id v7 = [(_UIBackdropView *)self backdropEffectView];
  float64x2_t v6 = [v7 layer];
  [(_UIBackdropView *)self setMaskImage:v5 onLayer:v6];
}

- (void)setGrayscaleTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, a3);
  id v5 = a3;
  id v7 = [(_UIBackdropView *)self grayscaleTintView];
  float64x2_t v6 = [v7 layer];
  [(_UIBackdropView *)self setMaskImage:v5 onLayer:v6];
}

- (void)setMaskImage:(id)a3 onLayer:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    double v8 = [v6 mask];
    id v9 = [v8 contents];

    if (v9 != v12)
    {
      float32x2_t v10 = [v7 mask];
      int32x2_t v11 = v12;
      if (v12)
      {
        if (!v10)
        {
          float32x2_t v10 = [MEMORY[0x1E4F39BE8] layer];
          [v7 setMask:v10];
          [v10 setDelegate:self];
          int32x2_t v11 = v12;
        }
        objc_msgSend(v10, "setContents:", objc_msgSend(v11, "CGImage"));
        [(UIView *)self setNeedsLayout];
      }
      else
      {
        [v7 setMask:0];
      }
    }
  }
}

- (void)setBlurFilterWithRadius:(double)a3 blurQuality:(id)a4
{
  unint64_t v24 = (__CFString *)a4;
  id v6 = [(_UIBackdropView *)self backdropEffectView];

  if (v6)
  {
    if (qword_1EB25E670 != -1) {
      dispatch_once(&qword_1EB25E670, &__block_literal_global_677);
    }
    if ((byte_1EB25E649 & 1) == 0)
    {
      id v7 = [(_UIBackdropView *)self gaussianBlurFilter];

      if (v7)
      {
LABEL_19:
        if (self->__blurRadius != a3)
        {
          long long v16 = [(_UIBackdropView *)self backdropEffectView];
          double v17 = [v16 layer];
          double v18 = [NSNumber numberWithDouble:a3];
          [v17 setValue:v18 forKeyPath:@"filters.gaussianBlur.inputRadius"];

          unsigned int v19 = [(_UIBackdropView *)self backdropEffectView];
          float64x2_t v20 = [v19 layer];
          float64x2_t v21 = [v20 valueForKeyPath:@"filters.gaussianBlur"];
          [(_UIBackdropView *)self setGaussianBlurFilter:v21];

          self->__blurRadius = a3;
        }
        if (([(__CFString *)v24 isEqualToString:self->__blurQuality] & 1) == 0)
        {
          float32x2_t v22 = [(_UIBackdropView *)self backdropEffectView];
          unsigned int v23 = [v22 layer];
          [v23 setValue:v24 forKeyPath:@"filters.gaussianBlur.inputQuality"];
        }
        goto LABEL_23;
      }
      double v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
      id v9 = [NSNumber numberWithDouble:a3];
      [v8 setValue:v9 forKey:@"inputRadius"];

      float32x2_t v10 = v24;
      if (!v24)
      {
        int32x2_t v11 = [(_UIBackdropView *)self inputSettings];
        if ([v11 graphicsQuality] == 10)
        {
        }
        else
        {
          if (qword_1EB25E678 != -1) {
            dispatch_once(&qword_1EB25E678, &__block_literal_global_683);
          }
          char v13 = byte_1EB25E64A;

          if ((v13 & 1) == 0)
          {
            float32x2_t v10 = @"default";
            goto LABEL_16;
          }
        }
        float32x2_t v10 = @"low";
      }
LABEL_16:
      unint64_t v24 = v10;
      if (!self->__blurQuality)
      {
        int v14 = (NSString *)[(__CFString *)v10 copy];
        blurQualitdouble y = self->__blurQuality;
        self->__blurQualitdouble y = v14;
      }
      [v8 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
      [v8 setValue:v24 forKey:@"inputQuality"];
      [v8 setName:@"gaussianBlur"];
      [(_UIBackdropView *)self setGaussianBlurFilter:v8];
      [(_UIBackdropView *)self _updateFilters];

      goto LABEL_19;
    }
  }
  else
  {
    id v12 = [(_UIBackdropView *)self gaussianBlurFilter];

    if (v12)
    {
      [(_UIBackdropView *)self setGaussianBlurFilter:0];
      [(_UIBackdropView *)self _updateFilters];
    }
  }
LABEL_23:
}

- (CAFilter)gaussianBlurFilter
{
  return self->_gaussianBlurFilter;
}

- (void)ensureProperSubviewOrdering
{
  uint64_t v3 = [(_UIBackdropView *)self backdropEffectView];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(_UIBackdropView *)self backdropEffectView];
    id v6 = [v5 superview];

    if (!v6)
    {
      id v7 = [(_UIBackdropView *)self backdropEffectView];
      [(UIView *)self addSubview:v7];

      double v8 = [(_UIBackdropView *)self inputSettings];
      char v9 = [v8 isBackdropVisible];

      if ((v9 & 1) == 0)
      {
        [(_UIBackdropView *)self setBackdropVisibilitySetOnce:0];
        [(_UIBackdropView *)self setBackdropVisible:0];
      }
    }
  }
  uint64_t v10 = [(_UIBackdropView *)self grayscaleTintView];
  if (v10)
  {
    int32x2_t v11 = (void *)v10;
    id v12 = [(_UIBackdropView *)self grayscaleTintView];
    char v13 = [v12 superview];

    if (!v13)
    {
      int v14 = [(_UIBackdropView *)self grayscaleTintView];
      [(UIView *)self addSubview:v14];
    }
  }
  uint64_t v15 = [(_UIBackdropView *)self colorTintView];
  if (v15)
  {
    long long v16 = (void *)v15;
    double v17 = [(_UIBackdropView *)self colorTintView];
    double v18 = [v17 superview];

    if (!v18)
    {
      unsigned int v19 = [(_UIBackdropView *)self colorTintView];
      [(UIView *)self addSubview:v19];
    }
  }
  uint64_t v20 = [(_UIBackdropView *)self colorBurnTintView];
  if (v20)
  {
    float64x2_t v21 = (void *)v20;
    float32x2_t v22 = [(_UIBackdropView *)self colorBurnTintView];
    unsigned int v23 = [v22 superview];

    if (!v23)
    {
      unint64_t v24 = [(_UIBackdropView *)self colorBurnTintView];
      [(UIView *)self addSubview:v24];
    }
  }
  uint64_t v25 = [(_UIBackdropView *)self darkeningTintView];
  if (v25)
  {
    long long v26 = (void *)v25;
    float v27 = [(_UIBackdropView *)self darkeningTintView];
    uint64_t v28 = [v27 superview];

    if (!v28)
    {
      long long v29 = [(_UIBackdropView *)self darkeningTintView];
      [(UIView *)self addSubview:v29];
    }
  }
  contentView = self->_contentView;
  if (contentView)
  {
    __int32 v31 = [(UIView *)contentView superview];

    if (!v31) {
      [(UIView *)self addSubview:self->_contentView];
    }
  }
  [(UIView *)self setNeedsLayout];
  __int32 v32 = [(_UIBackdropView *)self backdropEffectView];

  if (v32)
  {
    uint64_t v33 = [(_UIBackdropView *)self backdropEffectView];
    [(UIView *)self sendSubviewToBack:v33];

    unsigned int v34 = 1;
  }
  else
  {
    unsigned int v34 = 0;
  }
  __int32 v35 = [(_UIBackdropView *)self grayscaleTintView];

  if (v35)
  {
    float32x2_t v36 = [(UIView *)self subviews];
    long long v37 = [(_UIBackdropView *)self grayscaleTintView];
    uint64_t v38 = [v36 indexOfObject:v37];

    if (v38 != v34)
    {
      float v39 = [(_UIBackdropView *)self grayscaleTintView];
      [(UIView *)self exchangeSubviewAtIndex:v34 withSubviewAtIndex:v39];
    }
    ++v34;
  }
  long long v40 = [(_UIBackdropView *)self colorTintView];

  if (v40)
  {
    uint64_t v41 = [(UIView *)self subviews];
    int v42 = [(_UIBackdropView *)self colorTintView];
    uint64_t v43 = [v41 indexOfObject:v42];

    if (v43 != v34)
    {
      v44 = [(_UIBackdropView *)self colorTintView];
      [(UIView *)self exchangeSubviewAtIndex:v34 withSubviewAtIndex:v44];
    }
    ++v34;
  }
  v45 = [(_UIBackdropView *)self colorBurnTintView];

  if (v45)
  {
    v46 = [(UIView *)self subviews];
    v47 = [(_UIBackdropView *)self colorBurnTintView];
    uint64_t v48 = [v46 indexOfObject:v47];

    if (v48 != v34)
    {
      v49 = [(_UIBackdropView *)self colorBurnTintView];
      [(UIView *)self exchangeSubviewAtIndex:v34 withSubviewAtIndex:v49];
    }
    ++v34;
  }
  v50 = [(_UIBackdropView *)self darkeningTintView];

  if (v50)
  {
    v51 = [(UIView *)self subviews];
    v52 = [(_UIBackdropView *)self darkeningTintView];
    uint64_t v53 = [v51 indexOfObject:v52];

    if (v53 != v34)
    {
      v54 = [(_UIBackdropView *)self darkeningTintView];
      [(UIView *)self exchangeSubviewAtIndex:v34 withSubviewAtIndex:v54];
    }
  }
  if (self->_contentView)
  {
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (_UIBackdropEffectView)backdropEffectView
{
  return self->_backdropEffectView;
}

- (UIView)grayscaleTintView
{
  return self->_grayscaleTintView;
}

- (UIView)colorTintView
{
  return self->_colorTintView;
}

- (UIView)darkeningTintView
{
  return self->_darkeningTintView;
}

- (UIView)colorBurnTintView
{
  return self->_colorBurnTintView;
}

- (void)transitionIncrementallyToStyle:(int64_t)a3 weighting:(double)a4
{
  id v6 = +[_UIBackdropViewSettings settingsForStyle:a3];
  [(_UIBackdropView *)self transitionIncrementallyToSettings:v6 weighting:a4];
}

- (void)_updateFilters
{
  id v4 = [(_UIBackdropView *)self filters];
  uint64_t v3 = [(UIView *)self->_backdropEffectView layer];
  [v3 setFilters:v4];
}

- (id)filters
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_applySaturationBeforeBlur && self->_colorSaturateFilter) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_gaussianBlurFilter) {
    objc_msgSend(v4, "addObject:");
  }
  if (!self->_applySaturationBeforeBlur && self->_colorSaturateFilter) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_tintFilter) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_colorOffsetFilter) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (void)setAppliesOutputSettingsAutomaticallyEnabledComputesColorSettings:(BOOL)a3
{
  self->_appliesOutputSettingsAutomaticallyEnabledComputesColorSettings = a3;
}

- (void)setBackdropVisibilitySetOnce:(BOOL)a3
{
  self->_backdropVisibilitySetOnce = a3;
}

- (void)setGaussianBlurFilter:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setBackdropEffectView:(id)a3
{
}

- (void)setAutosizesToFitSuperview:(BOOL)a3
{
  self->_autosizesToFitSuperview = a3;
}

- (void)setAppliesOutputSettingsAnimationDuration:(double)a3
{
  self->_appliesOutputSettingsAnimationDuration = a3;
}

- (void)setGrayscaleTintView:(id)a3
{
}

- (void)setColorTintView:(id)a3
{
}

- (void)setAutoGroup:(BOOL)a3
{
  self->_autoGroup = a3;
  [(_UIBackdropView *)self _updateBackdropGroupName];
}

- (void)settingsDidChange:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIBackdropView *)self outputSettings];

  if (v5 != v4)
  {
    id v6 = [(_UIBackdropView *)self inputSettings];

    if (v6 == v4 && ![(_UIBackdropView *)self applyingBackdropChanges])
    {
      if ([(_UIBackdropView *)self appliesOutputSettingsAutomatically])
      {
        id v7 = [(_UIBackdropView *)self inputSettings];

        if (v7 == v4)
        {
          double v8 = [(_UIBackdropView *)self outputSettings];
          char v9 = [(_UIBackdropView *)self inputSettings];
          [v8 computeOutputSettingsUsingModel:v9];
        }
        uint64_t v10 = [(_UIBackdropView *)self outputSettings];
        [(_UIBackdropView *)self applySettingsWithBuiltInAnimation:v10];
      }
      [(_UIBackdropView *)self updateSubviewHierarchyIfNeededForSettings:v4];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      int32x2_t v11 = [(_UIBackdropView *)self observers];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * v15++) backdropViewDidChange:self];
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
}

+ (void)adjustGraphicsQualityForAccessibilityIfNeeded:(id)a3
{
  int v4 = _AXSEnhanceBackgroundContrastEnabled() != 0;
  if (_MergedGlobals_69 != v4)
  {
    _MergedGlobals_69 = v4;
    id v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 _graphicsQuality];

    if (_MergedGlobals_69) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = v6;
    }
    [a1 setAllBackdropViewsToGraphicsQuality:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__blurQuality, 0);
  objc_storeStrong((id *)&self->_colorMatrixColorTint, 0);
  objc_storeStrong(&self->_computeAndApplySettingsNotificationObserver, 0);
  objc_storeStrong((id *)&self->_filterMaskViewMap, 0);
  objc_storeStrong((id *)&self->_filterMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_colorTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_colorTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskViewMap, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskViewContainer, 0);
  objc_storeStrong((id *)&self->_partialMaskViews, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskImage, 0);
  objc_storeStrong((id *)&self->_darkeningTintView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_colorOffsetFilter, 0);
  objc_storeStrong((id *)&self->_tintFilter, 0);
  objc_storeStrong((id *)&self->_colorSaturateFilter, 0);
  objc_storeStrong((id *)&self->_gaussianBlurFilter, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorBurnTintView, 0);
  objc_storeStrong((id *)&self->_colorTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorTintView, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, 0);
  objc_storeStrong((id *)&self->_grayscaleTintView, 0);
  objc_storeStrong((id *)&self->_filterMaskImage, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
  objc_storeStrong((id *)&self->_savedInputSettingsDuringRenderInContext, 0);
  objc_storeStrong((id *)&self->_outputSettings, 0);
  objc_storeStrong((id *)&self->_inputSettings, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (id)allBackdropViews
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__13;
  uint64_t v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  v2 = _UIBackdropViewQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___UIBackdropView_allBackdropViews__block_invoke;
  block[3] = &unk_1E52D9900;
  void block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (void)setAllBackdropViewsToGraphicsQuality:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v4 = objc_msgSend(a1, "allBackdropViews", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _transitionToGraphicsQuality:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_transitionToGraphicsQuality:(int64_t)a3
{
  uint64_t v5 = [(_UIBackdropView *)self graphicsQualityChangeDelegate];

  if (!v5
    || ([(_UIBackdropView *)self graphicsQualityChangeDelegate],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 backdropView:self willChangeToGraphicsQuality:a3],
        id v11 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        (id v7 = v11) == 0))
  {
    uint64_t v8 = [(_UIBackdropView *)self inputSettings];
    id v12 = +[_UIBackdropViewSettings settingsPreservingHintsFromSettings:v8 graphicsQuality:a3];

    id v7 = v12;
  }
  id v13 = v7;
  -[_UIBackdropView transitionToSettings:](self, "transitionToSettings:");
  long long v9 = [(_UIBackdropView *)self graphicsQualityChangeDelegate];

  if (v9)
  {
    long long v10 = [(_UIBackdropView *)self graphicsQualityChangeDelegate];
    [v10 backdropView:self didChangeToGraphicsQuality:a3];
  }
}

+ (Class)defaultSettingsClass
{
  return (Class)objc_opt_class();
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIBackdropView)initWithSettings:(id)a3
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (_UIBackdropView)initWithStyle:(int64_t)a3
{
  int v4 = +[_UIBackdropViewSettings settingsForStyle:a3];
  uint64_t v5 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v5;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v9 = +[_UIBackdropViewSettings settingsForStyle:a4];
  long long v10 = -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, v9, x, y, width, height);

  return v10;
}

- (_UIBackdropView)initWithFrame:(CGRect)a3
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIBackdropView)init
{
  return -[_UIBackdropView initWithFrame:autosizesToFitSuperview:settings:](self, "initWithFrame:autosizesToFitSuperview:settings:", 1, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)setGroupName:(id)a3
{
  if (self->_groupName != a3)
  {
    int v4 = (NSString *)[a3 copy];
    groupName = self->_groupName;
    self->_groupName = v4;
  }
  [(_UIBackdropView *)self _updateBackdropGroupName];
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    self->_cornerRadiusIsContinuous = 0;
    [(_UIBackdropView *)self _applyCornerRadiusToSubviews];
  }
}

- (double)_continuousCornerRadius
{
  return self->_cornerRadius;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    self->_cornerRadiusIsContinuous = 1;
    [(_UIBackdropView *)self _applyCornerRadiusToSubviews];
  }
}

- (void)setApplySaturationBeforeBlur:(BOOL)a3
{
  self->_applySaturationBeforeBlur = a3;
  [(_UIBackdropView *)self _updateFilters];
}

- (void)setShouldRasterizeEffectsView:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIBackdropViewSettings *)self->_inputSettings zoomsBack])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(_UIBackdropView *)self backdropEffectView];
    id v7 = [v6 layer];
    uint64_t v8 = [v7 meshTransform];
    BOOL v5 = v8 != 0;
  }
  id v10 = [(_UIBackdropView *)self backdropEffectView];
  long long v9 = [v10 backdropLayer];
  [v9 setShouldRasterize:v5 | v3];
}

- (void)willCallRenderInContextOnBackdropViewLayer
{
  BOOL v3 = [(_UIBackdropView *)self inputSettings];
  uint64_t v4 = [v3 graphicsQuality];

  if (v4 != 10)
  {
    id v7 = [(_UIBackdropView *)self inputSettings];
    BOOL v5 = [v7 combinedTintColor];
    uint64_t v6 = [v5 colorWithAlphaComponent:1.0];
    [(UIView *)self setBackgroundColor:v6];
  }
}

- (void)didCallRenderInContextOnBackdropViewLayer
{
  BOOL v3 = [(_UIBackdropView *)self inputSettings];
  uint64_t v4 = [v3 graphicsQuality];

  if (v4 != 10)
  {
    [(UIView *)self setBackgroundColor:0];
  }
}

- (void)setObserver:(id)a3
{
  observer = self->_observer;
  BOOL v5 = (_UIBackdropViewObserver *)a3;
  [(_UIBackdropView *)self removeObserver:observer];
  self->_observer = v5;
  -[_UIBackdropView addObserver:](self, "addObserver:");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIBackdropView *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIBackdropView *)self observers];
  [v5 removeObject:v4];
}

- (void)updateMaskViewForView:(id)a3 flag:(int64_t)a4
{
  id v38 = a3;
  int64_t v6 = a4 - 1;
  switch(a4)
  {
    case 1:
      id v7 = [(_UIBackdropView *)self grayscaleTintMaskViewMap];
      uint64_t v8 = [(_UIBackdropView *)self grayscaleTintMaskViewContainer];
      uint64_t v9 = [(_UIBackdropView *)self grayscaleTintView];
      goto LABEL_8;
    case 2:
      id v7 = [(_UIBackdropView *)self colorTintMaskViewMap];
      uint64_t v8 = [(_UIBackdropView *)self colorTintMaskViewContainer];
      uint64_t v9 = [(_UIBackdropView *)self colorTintView];
      goto LABEL_8;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_60;
    case 4:
      id v7 = [(_UIBackdropView *)self filterMaskViewMap];
      uint64_t v8 = [(_UIBackdropView *)self filterMaskViewContainer];
      uint64_t v9 = [(_UIBackdropView *)self backdropEffectView];
      goto LABEL_8;
    case 8:
      id v7 = [(_UIBackdropView *)self colorBurnTintMaskViewMap];
      uint64_t v8 = [(_UIBackdropView *)self colorBurnTintMaskViewContainer];
      uint64_t v9 = [(_UIBackdropView *)self colorBurnTintView];
      goto LABEL_8;
    default:
      if (a4 != 16) {
        goto LABEL_60;
      }
      id v7 = [(_UIBackdropView *)self darkeningTintMaskViewMap];
      uint64_t v8 = [(_UIBackdropView *)self darkeningTintMaskViewContainer];
      uint64_t v9 = [(_UIBackdropView *)self darkeningTintView];
LABEL_8:
      id v10 = (void *)v9;
      id v11 = [v38 _backdropMaskViewForFlag:a4];
      id v12 = [v38 _generateBackdropMaskViewForFlag:a4];
      id v13 = [MEMORY[0x1E4F29238] valueWithPointer:v38];
      BOOL v14 = 0;
      if (v11 && v12 != v11)
      {
        BOOL v14 = v12 != 0;
        if (v12)
        {
          [v11 frame];
          objc_msgSend(v12, "setFrame:");
        }
        [v11 removeFromSuperview];
        [v7 removeObjectForKey:v13];
      }
      if (v12)
      {
        if (!v7)
        {
          id v7 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        if (!v8 && v10)
        {
          uint64_t v15 = [UIView alloc];
          [(UIView *)self bounds];
          uint64_t v8 = -[UIView initWithFrame:](v15, "initWithFrame:");
          if (![(_UIBackdropView *)self maskMode])
          {
            +[UIColor blackColor];
            long long v37 = v13;
            v17 = long long v16 = v10;
            [(UIView *)v8 setBackgroundColor:v17];

            id v10 = v16;
            id v13 = v37;
          }
          [(UIView *)v8 setOpaque:0];
          [(UIView *)v8 setUserInteractionEnabled:0];
          [(UIView *)v8 setAutoresizingMask:18];
          [v10 _setMaskView:v8];
          [v10 setNeedsLayout];
        }
        [(UIView *)v8 addSubview:v12];
        long long v18 = [v38 superview];
        if (v18 == self->_contentView) {
          BOOL v14 = 1;
        }

        if (!v14)
        {
          [v12 bounds];
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v38);
          objc_msgSend(v12, "setFrame:");
        }
        [v7 setObject:v12 forKey:v13];
        if (![(_UIBackdropView *)self maskMode])
        {
          long long v19 = v8;
          uint64_t v20 = v11;
          uint64_t v21 = v7;
          float32x2_t v22 = v13;
          unsigned int v23 = v10;
          uint64_t v24 = *MEMORY[0x1E4F3A338];
          uint64_t v25 = [v12 layer];
          uint64_t v26 = v24;
          id v10 = v23;
          id v13 = v22;
          id v7 = v21;
          id v11 = v20;
          uint64_t v8 = v19;
          int64_t v6 = a4 - 1;
          [v25 setCompositingFilter:v26];
        }
        switch(v6)
        {
          case 0:
            float v27 = [(_UIBackdropView *)self grayscaleTintMaskViewMap];

            if (!v27 && v7) {
              [(_UIBackdropView *)self setGrayscaleTintMaskViewMap:v7];
            }
            uint64_t v28 = [(_UIBackdropView *)self grayscaleTintMaskViewContainer];

            if (v8 && !v28) {
              [(_UIBackdropView *)self setGrayscaleTintMaskViewContainer:v8];
            }
            break;
          case 1:
            __int32 v31 = [(_UIBackdropView *)self colorTintMaskViewMap];

            if (!v31 && v7) {
              [(_UIBackdropView *)self setColorTintMaskViewMap:v7];
            }
            __int32 v32 = [(_UIBackdropView *)self colorTintMaskViewContainer];

            if (v8 && !v32) {
              [(_UIBackdropView *)self setColorTintMaskViewContainer:v8];
            }
            break;
          case 2:
          case 4:
          case 5:
          case 6:
            break;
          case 3:
            uint64_t v33 = [(_UIBackdropView *)self filterMaskViewMap];

            if (!v33 && v7) {
              [(_UIBackdropView *)self setFilterMaskViewMap:v7];
            }
            unsigned int v34 = [(_UIBackdropView *)self filterMaskViewContainer];

            if (v8 && !v34) {
              [(_UIBackdropView *)self setFilterMaskViewContainer:v8];
            }
            break;
          case 7:
            __int32 v35 = [(_UIBackdropView *)self colorBurnTintMaskViewMap];

            if (!v35 && v7) {
              [(_UIBackdropView *)self setColorBurnTintMaskViewMap:v7];
            }
            float32x2_t v36 = [(_UIBackdropView *)self colorBurnTintMaskViewContainer];

            if (v8 && !v36) {
              [(_UIBackdropView *)self setColorBurnTintMaskViewContainer:v8];
            }
            break;
          default:
            if (a4 == 16)
            {
              long long v29 = [(_UIBackdropView *)self darkeningTintMaskViewMap];

              if (!v29 && v7) {
                [(_UIBackdropView *)self setDarkeningTintMaskViewMap:v7];
              }
              long long v30 = [(_UIBackdropView *)self darkeningTintMaskViewContainer];

              if (v8 && !v30) {
                [(_UIBackdropView *)self setDarkeningTintMaskViewContainer:v8];
              }
            }
            break;
        }
      }

LABEL_60:

      return;
  }
}

- (void)updateMaskViewsForView:(id)a3
{
  id v17 = a3;
  BOOL v4 = [(_UIBackdropView *)self simulatesMasks];
  uint64_t v5 = [v17 _backdropMaskViewFlags];
  if (v4)
  {
    if (v5) {
      [(_UIBackdropView *)self applyOverlayBlendModeToView:v17];
    }
    else {
      [(_UIBackdropView *)self removeOverlayBlendModeFromView:v17];
    }
  }
  else if (v5 {
         || ([v17 _backdropMaskViews],
  }
             int64_t v6 = objc_claimAutoreleasedReturnValue(),
             uint64_t v7 = [v6 count],
             v6,
             v7))
  {
    if (![(_UIBackdropView *)self updateMaskViewsForViewReentrancyGuard])
    {
      [(_UIBackdropView *)self setUpdateMaskViewsForViewReentrancyGuard:1];
      uint64_t v8 = [v17 _backdropMaskViewFlags];
      uint64_t v9 = [v17 _backdropMaskViewFlags];
      id v10 = [MEMORY[0x1E4F29238] valueWithPointer:v17];
      id v11 = [(_UIBackdropView *)self partialMaskViews];
      id v12 = v11;
      if (v8 == 7 || !v9)
      {
        [v11 removeObject:v10];
      }
      else
      {

        if (!v12)
        {
          id v13 = [MEMORY[0x1E4F1CA80] set];
          [(_UIBackdropView *)self setPartialMaskViews:v13];
        }
        id v12 = [(_UIBackdropView *)self partialMaskViews];
        [v12 addObject:v10];
      }

      [(_UIBackdropView *)self updateMaskViewForView:v17 flag:1];
      [(_UIBackdropView *)self updateMaskViewForView:v17 flag:2];
      [(_UIBackdropView *)self updateMaskViewForView:v17 flag:8];
      [(_UIBackdropView *)self updateMaskViewForView:v17 flag:16];
      [(_UIBackdropView *)self updateMaskViewForView:v17 flag:4];
      uint64_t v14 = [v17 superview];
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        do
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v15 _addScrollViewScrollObserver:v17];
          }
          uint64_t v16 = [v15 superview];

          uint64_t v15 = (void *)v16;
        }
        while (v16);
      }
      [(_UIBackdropView *)self setUpdateMaskViewsForViewReentrancyGuard:0];
    }
  }
}

- (void)setMaskMode:(int64_t)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (![(_UIBackdropView *)self simulatesMasks])
  {
    int64_t maskMode = self->_maskMode;
    self->_int64_t maskMode = a3;
    if (maskMode != a3)
    {
      if ([(_UIBackdropView *)self maskMode])
      {
        id v6 = 0;
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = +[UIColor blackColor];
        id v6 = (id)*MEMORY[0x1E4F3A338];
      }
      uint64_t v8 = [(_UIBackdropView *)self grayscaleTintMaskViewContainer];
      [v8 setBackgroundColor:v7];

      uint64_t v9 = [(_UIBackdropView *)self colorTintMaskViewContainer];
      [v9 setBackgroundColor:v7];

      id v10 = [(_UIBackdropView *)self colorBurnTintMaskViewContainer];
      [v10 setBackgroundColor:v7];

      id v11 = [(_UIBackdropView *)self darkeningTintMaskViewContainer];
      [v11 setBackgroundColor:v7];

      id v12 = [(_UIBackdropView *)self filterMaskViewContainer];
      [v12 setBackgroundColor:v7];

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v13 = [(_UIBackdropView *)self grayscaleTintMaskViewMap];
      uint64_t v14 = [v13 allValues];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v65 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = [*(id *)(*((void *)&v64 + 1) + 8 * i) layer];
            [v19 setCompositingFilter:v6];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v64 objects:v72 count:16];
        }
        while (v16);
      }

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v20 = [(_UIBackdropView *)self colorTintMaskViewMap];
      uint64_t v21 = [v20 allValues];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v61 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = [*(id *)(*((void *)&v60 + 1) + 8 * j) layer];
            [v26 setCompositingFilter:v6];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v60 objects:v71 count:16];
        }
        while (v23);
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      float v27 = [(_UIBackdropView *)self colorBurnTintMaskViewMap];
      uint64_t v28 = [v27 allValues];

      uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v70 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v57 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = [*(id *)(*((void *)&v56 + 1) + 8 * k) layer];
            [v33 setCompositingFilter:v6];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v56 objects:v70 count:16];
        }
        while (v30);
      }

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      unsigned int v34 = [(_UIBackdropView *)self darkeningTintMaskViewMap];
      __int32 v35 = [v34 allValues];

      uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v69 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v53;
        do
        {
          for (uint64_t m = 0; m != v37; ++m)
          {
            if (*(void *)v53 != v38) {
              objc_enumerationMutation(v35);
            }
            long long v40 = [*(id *)(*((void *)&v52 + 1) + 8 * m) layer];
            [v40 setCompositingFilter:v6];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v69 count:16];
        }
        while (v37);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v41 = [(_UIBackdropView *)self filterMaskViewMap];
      int v42 = [v41 allValues];

      uint64_t v43 = [v42 countByEnumeratingWithState:&v48 objects:v68 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v49;
        do
        {
          for (uint64_t n = 0; n != v44; ++n)
          {
            if (*(void *)v49 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = [*(id *)(*((void *)&v48 + 1) + 8 * n) layer];
            [v47 setCompositingFilter:v6];
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v48 objects:v68 count:16];
        }
        while (v44);
      }
    }
  }
}

- (void)removeMaskViews
{
  if (![(_UIBackdropView *)self simulatesMasks])
  {
    BOOL v3 = [(_UIBackdropView *)self grayscaleTintMaskViewContainer];
    BOOL v4 = [v3 subviews];
    [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

    uint64_t v5 = [(_UIBackdropView *)self grayscaleTintMaskViewContainer];
    [v5 removeFromSuperview];

    [(_UIBackdropView *)self setGrayscaleTintMaskViewContainer:0];
    id v6 = [(_UIBackdropView *)self colorTintMaskViewContainer];
    uint64_t v7 = [v6 subviews];
    [v7 makeObjectsPerformSelector:sel_removeFromSuperview];

    uint64_t v8 = [(_UIBackdropView *)self colorTintMaskViewContainer];
    [v8 removeFromSuperview];

    [(_UIBackdropView *)self setColorTintMaskViewContainer:0];
    uint64_t v9 = [(_UIBackdropView *)self colorBurnTintMaskViewContainer];
    id v10 = [v9 subviews];
    [v10 makeObjectsPerformSelector:sel_removeFromSuperview];

    id v11 = [(_UIBackdropView *)self colorBurnTintMaskViewContainer];
    [v11 removeFromSuperview];

    [(_UIBackdropView *)self setColorBurnTintMaskViewContainer:0];
    id v12 = [(_UIBackdropView *)self darkeningTintMaskViewContainer];
    id v13 = [v12 subviews];
    [v13 makeObjectsPerformSelector:sel_removeFromSuperview];

    uint64_t v14 = [(_UIBackdropView *)self darkeningTintMaskViewContainer];
    [v14 removeFromSuperview];

    [(_UIBackdropView *)self setDarkeningTintMaskViewContainer:0];
    uint64_t v15 = [(_UIBackdropView *)self filterMaskViewContainer];
    uint64_t v16 = [v15 subviews];
    [v16 makeObjectsPerformSelector:sel_removeFromSuperview];

    uint64_t v17 = [(_UIBackdropView *)self filterMaskViewContainer];
    [v17 removeFromSuperview];

    [(_UIBackdropView *)self setFilterMaskViewContainer:0];
    long long v18 = [(_UIBackdropView *)self grayscaleTintView];
    [v18 _setMaskView:0];

    long long v19 = [(_UIBackdropView *)self colorTintView];
    [v19 _setMaskView:0];

    uint64_t v20 = [(_UIBackdropView *)self colorBurnTintView];
    [v20 _setMaskView:0];

    uint64_t v21 = [(_UIBackdropView *)self darkeningTintView];
    [v21 _setMaskView:0];

    id v22 = [(_UIBackdropView *)self backdropEffectView];
    [v22 _setMaskView:0];
  }
}

- (void)applyOverlayBlendMode:(int64_t)a3 toView:(id)a4
{
}

- (void)applyOverlayBlendModeToView:(id)a3
{
}

- (void)removeOverlayBlendModeFromView:(id)a3
{
}

- (double)blurRadius
{
  return self->__blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  if (self->__blurRadius != a3 || ![(_UIBackdropView *)self blurRadiusSetOnce])
  {
    [(_UIBackdropView *)self setBlurRadiusSetOnce:1];
    [(_UIBackdropView *)self setBlurFilterWithRadius:@"default" blurQuality:a3];
    self->__blurRadius = a3;
  }
}

- (id)blurQuality
{
  return self->__blurQuality;
}

- (void)setBlurQuality:(id)a3
{
  if (self->__blurQuality != a3)
  {
    id v4 = a3;
    [(_UIBackdropView *)self blurRadius];
    -[_UIBackdropView setBlurFilterWithRadius:blurQuality:](self, "setBlurFilterWithRadius:blurQuality:", v4);
    uint64_t v5 = (NSString *)[v4 copy];

    blurQualitdouble y = self->__blurQuality;
    self->__blurQualitdouble y = v5;
  }
}

- (double)saturationDeltaFactor
{
  return self->__saturationDeltaFactor;
}

- (void)setTintFilterForSettings:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backdropEffectView)
  {
    double v39 = 0.0;
    double v40 = 0.0;
    double v37 = 0.0;
    double v38 = 0.0;
    double v6 = 0.0;
    uint64_t v7 = (void *)v4[16];
    if (v7)
    {
      [v7 getRed:&v40 green:&v39 blue:&v38 alpha:&v37];
      double v8 = *((double *)v5 + 17) * v37;
      double v37 = v8;
      double v9 = 1.0 - v8;
    }
    else
    {
      double v9 = 1.0;
      double v8 = 0.0;
    }
    if (*((unsigned char *)v5 + 305)) {
      double v6 = *((double *)v5 + 12);
    }
    double v11 = *((double *)v5 + 11);
    double v12 = v9 * (v6 * v11);
    float v13 = v9 * (1.0 - v6);
    float v14 = v12 + v8 * v40;
    float v15 = v12 + v8 * v39;
    float v16 = v12 + v8 * v38;
    if (!self->_tintFilter)
    {
      uint64_t v17 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
      [v17 setName:@"colorMatrix"];
      float v22 = v13;
      uint64_t v23 = 0;
      int v24 = 0;
      float v25 = v14;
      int v26 = 0;
      float v27 = v13;
      uint64_t v28 = 0;
      float v29 = v15;
      uint64_t v30 = 0;
      float v31 = v13;
      int v32 = 0;
      float v33 = v16;
      uint64_t v34 = 0;
      int v35 = 0;
      uint64_t v36 = 1065353216;
      long long v18 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v22];
      [v17 setValue:v18 forKey:@"inputColorMatrix"];

      tintFilter = self->_tintFilter;
      self->_tintFilter = (CAFilter *)v17;

      [(_UIBackdropView *)self _updateFilters];
      double v11 = *((double *)v5 + 11);
    }
    if (vabdd_f64(self->_colorMatrixGrayscaleTintLevel, v11) > 0.00000011920929
      || vabdd_f64(self->_colorMatrixGrayscaleTintAlpha, *((double *)v5 + 12)) > 0.00000011920929
      || vabdd_f64(self->_colorMatrixColorTintAlpha, *((double *)v5 + 17)) > 0.00000011920929)
    {
      goto LABEL_16;
    }
    if (![(UIColor *)self->_colorMatrixColorTint isEqual:*((void *)v5 + 16)])
    {
      double v11 = *((double *)v5 + 11);
LABEL_16:
      self->_colorMatrixGrayscaleTintLevel = v11;
      self->_colorMatrixGrayscaleTintAlpha = *((double *)v5 + 12);
      objc_storeStrong((id *)&self->_colorMatrixColorTint, *((id *)v5 + 16));
      self->_colorMatrixColorTintAlpha = *((double *)v5 + 17);
      uint64_t v20 = [(UIView *)self->_backdropEffectView layer];
      float v22 = v13;
      uint64_t v23 = 0;
      int v24 = 0;
      float v25 = v14;
      int v26 = 0;
      float v27 = v13;
      uint64_t v28 = 0;
      float v29 = v15;
      uint64_t v30 = 0;
      float v31 = v13;
      int v32 = 0;
      float v33 = v16;
      uint64_t v34 = 0;
      int v35 = 0;
      uint64_t v36 = 1065353216;
      uint64_t v21 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v22];
      [v20 setValue:v21 forKeyPath:@"filters.colorMatrix.inputColorMatrix"];
    }
  }
  else
  {
    id v10 = self->_tintFilter;
    if (v10)
    {
      self->_tintFilter = 0;

      [(_UIBackdropView *)self _updateFilters];
    }
  }
}

- (BOOL)isBackdropVisible
{
  return self->__backdropVisible;
}

- (void)setUsesZoom
{
  MeshTransformForZoom(0.0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(_UIBackdropView *)self backdropEffectView];
  id v4 = [v3 backdropLayer];
  [v4 setMeshTransform:v5];
}

- (void)_setBlursBackground:(BOOL)a3
{
  BOOL v3 = a3;
  self->_blursBackground = a3;
  if ([(_UIBackdropView *)self configuration] != 1) {
    [(_UIBackdropView *)self setConfiguration:1];
  }
  id v5 = [(_UIBackdropView *)self effectView];
  [v5 setAlpha:(double)v3];
}

- (void)transitionToStyle:(int64_t)a3
{
  id v4 = +[_UIBackdropViewSettings settingsForStyle:a3];
  [(_UIBackdropView *)self prepareForTransitionToSettings:v4];
  [(_UIBackdropView *)self computeAndApplySettingsForTransition];
}

- (void)transitionToColor:(id)a3
{
  id v4 = a3;
  id v5 = +[_UIBackdropViewSettings settingsForStyle:2040];
  [v5 setColorTint:v4];

  [v5 setColorTintAlpha:1.0];
  [(_UIBackdropView *)self prepareForTransitionToSettings:v5];
  [(_UIBackdropView *)self computeAndApplySettingsForTransition];
}

- (UIView)contentView
{
  if ([(_UIBackdropView *)self contentViewAccessorGuard])
  {
    p_contentView = &self->_contentView;
  }
  else
  {
    [(_UIBackdropView *)self setContentViewAccessorGuard:1];
    p_contentView = &self->_contentView;
    if (!self->_contentView)
    {
      [(_UIBackdropView *)self setContentViewAccessed:1];
      id v4 = [(_UIBackdropView *)self inputSettings];
      [(_UIBackdropView *)self updateSubviewHierarchyIfNeededForSettings:v4];
    }
    [(_UIBackdropView *)self setContentViewAccessorGuard:0];
  }
  id v5 = *p_contentView;
  return v5;
}

- (void)setConfiguration:(int64_t)a3
{
  if (self->_configuration != a3)
  {
    self->_configuratiouint64_t n = a3;
    id v4 = [(_UIBackdropView *)self outputSettings];
    id v5 = [(_UIBackdropView *)self inputSettings];
    [v4 computeOutputSettingsUsingModel:v5];

    id v6 = [(_UIBackdropView *)self outputSettings];
    [(_UIBackdropView *)self adjustTintImplementationIfNeeded:v6];
  }
}

- (void)applySettingsWithBuiltInAnimation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_applyingTransition)
  {
    appliesOutputSettingsAnimationDuratiouint64_t n = self->_appliesOutputSettingsAnimationDuration;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke;
    v8[3] = &unk_1E52D9F98;
    v8[4] = self;
    id v9 = v4;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53___UIBackdropView_applySettingsWithBuiltInAnimation___block_invoke_2;
    v7[3] = &unk_1E52DC3A0;
    v7[4] = self;
    +[UIView animateWithDuration:4 delay:v8 options:v7 animations:appliesOutputSettingsAnimationDuration completion:0.0];
  }
}

- (BOOL)disablesOccludedBackdropBlurs
{
  return 0;
}

- (void)setTintOpacity:(double)a3
{
  id v18 = [(_UIBackdropView *)self inputSettings];
  int v5 = [v18 lightenGrayscaleWithSourceOver];
  double v6 = 1.0;
  if (v5) {
    objc_msgSend(v18, "grayscaleTintAlpha", 1.0);
  }
  double v7 = v6 * a3;
  double v8 = [(_UIBackdropView *)self grayscaleTintView];
  [v8 setAlpha:v7];

  [v18 colorTintAlpha];
  double v10 = v9 * a3;
  double v11 = [(_UIBackdropView *)self colorTintView];
  [v11 setAlpha:v10];

  [v18 colorBurnTintAlpha];
  double v13 = v12 * a3;
  float v14 = [(_UIBackdropView *)self colorBurnTintView];
  [v14 setAlpha:v13];

  [v18 darkeningTintAlpha];
  double v16 = v15 * a3;
  uint64_t v17 = [(_UIBackdropView *)self darkeningTintView];
  [v17 setAlpha:v16];
}

- (int64_t)style
{
  return self->_style;
}

- (_UIBackdropViewObserver)observer
{
  return self->_observer;
}

- (BOOL)computesColorSettings
{
  return self->_computesColorSettings;
}

- (double)appliesOutputSettingsAnimationDuration
{
  return self->_appliesOutputSettingsAnimationDuration;
}

- (BOOL)applySaturationBeforeBlur
{
  return self->_applySaturationBeforeBlur;
}

- (_UIBackdropViewSettings)savedInputSettingsDuringRenderInContext
{
  return self->_savedInputSettingsDuringRenderInContext;
}

- (void)setSavedInputSettingsDuringRenderInContext:(id)a3
{
}

- (BOOL)appliesOutputSettingsAutomaticallyEnabledComputesColorSettings
{
  return self->_appliesOutputSettingsAutomaticallyEnabledComputesColorSettings;
}

- (BOOL)applyingBackdropChanges
{
  return self->_applyingBackdropChanges;
}

- (void)setApplyingBackdropChanges:(BOOL)a3
{
  self->_applyingBackdropChanges = a3;
}

- (BOOL)applyingTransition
{
  return self->_applyingTransition;
}

- (void)setRequiresTintViews:(BOOL)a3
{
  self->_requiresTintViews = a3;
}

- (BOOL)blursBackground
{
  return self->_blursBackground;
}

- (void)setBlursBackground:(BOOL)a3
{
  self->_blursBackground = a3;
}

- (BOOL)allowsColorSettingsSuppression
{
  return self->_allowsColorSettingsSuppression;
}

- (void)setAllowsColorSettingsSuppression:(BOOL)a3
{
  self->_allowsColorSettingsSuppressiouint64_t n = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)autoGroup
{
  return self->_autoGroup;
}

- (UIImage)filterMaskImage
{
  return self->_filterMaskImage;
}

- (UIImage)grayscaleTintMaskImage
{
  return self->_grayscaleTintMaskImage;
}

- (UIImage)colorTintMaskImage
{
  return self->_colorTintMaskImage;
}

- (void)setColorBurnTintView:(id)a3
{
}

- (UIImage)colorBurnTintMaskImage
{
  return self->_colorBurnTintMaskImage;
}

- (CAFilter)colorSaturateFilter
{
  return self->_colorSaturateFilter;
}

- (void)setColorSaturateFilter:(id)a3
{
}

- (void)setTintFilter:(id)a3
{
}

- (CAFilter)colorOffsetFilter
{
  return self->_colorOffsetFilter;
}

- (void)setColorOffsetFilter:(id)a3
{
}

- (void)setContentView:(id)a3
{
}

- (UIImage)darkeningTintMaskImage
{
  return self->_darkeningTintMaskImage;
}

- (void)setContentViewAccessed:(BOOL)a3
{
  self->_contentViewAccessed = a3;
}

- (BOOL)contentViewAccessorGuard
{
  return self->_contentViewAccessorGuard;
}

- (void)setContentViewAccessorGuard:(BOOL)a3
{
  self->_contentViewAccessorGuard = a3;
}

- (int64_t)maskMode
{
  return self->_maskMode;
}

- (void)setPartialMaskViews:(id)a3
{
}

- (UIView)grayscaleTintMaskViewContainer
{
  return self->_grayscaleTintMaskViewContainer;
}

- (void)setGrayscaleTintMaskViewContainer:(id)a3
{
}

- (NSMutableDictionary)grayscaleTintMaskViewMap
{
  return self->_grayscaleTintMaskViewMap;
}

- (void)setGrayscaleTintMaskViewMap:(id)a3
{
}

- (UIView)colorTintMaskViewContainer
{
  return self->_colorTintMaskViewContainer;
}

- (void)setColorTintMaskViewContainer:(id)a3
{
}

- (NSMutableDictionary)colorTintMaskViewMap
{
  return self->_colorTintMaskViewMap;
}

- (void)setColorTintMaskViewMap:(id)a3
{
}

- (UIView)colorBurnTintMaskViewContainer
{
  return self->_colorBurnTintMaskViewContainer;
}

- (void)setColorBurnTintMaskViewContainer:(id)a3
{
}

- (NSMutableDictionary)colorBurnTintMaskViewMap
{
  return self->_colorBurnTintMaskViewMap;
}

- (void)setColorBurnTintMaskViewMap:(id)a3
{
}

- (UIView)darkeningTintMaskViewContainer
{
  return self->_darkeningTintMaskViewContainer;
}

- (void)setDarkeningTintMaskViewContainer:(id)a3
{
}

- (NSMutableDictionary)darkeningTintMaskViewMap
{
  return self->_darkeningTintMaskViewMap;
}

- (void)setDarkeningTintMaskViewMap:(id)a3
{
}

- (UIView)filterMaskViewContainer
{
  return self->_filterMaskViewContainer;
}

- (void)setFilterMaskViewContainer:(id)a3
{
}

- (NSMutableDictionary)filterMaskViewMap
{
  return self->_filterMaskViewMap;
}

- (void)setFilterMaskViewMap:(id)a3
{
}

- (void)setComputeAndApplySettingsNotificationObserver:(id)a3
{
}

- (BOOL)updateMaskViewsForViewReentrancyGuard
{
  return self->_updateMaskViewsForViewReentrancyGuard;
}

- (void)setUpdateMaskViewsForViewReentrancyGuard:(BOOL)a3
{
  self->_updateMaskViewsForViewReentrancyGuard = a3;
}

- (double)colorMatrixGrayscaleTintLevel
{
  return self->_colorMatrixGrayscaleTintLevel;
}

- (void)setColorMatrixGrayscaleTintLevel:(double)a3
{
  self->_colorMatrixGrayscaleTintLevel = a3;
}

- (double)colorMatrixGrayscaleTintAlpha
{
  return self->_colorMatrixGrayscaleTintAlpha;
}

- (void)setColorMatrixGrayscaleTintAlpha:(double)a3
{
  self->_colorMatrixGrayscaleTintAlpha = a3;
}

- (UIColor)colorMatrixColorTint
{
  return self->_colorMatrixColorTint;
}

- (void)setColorMatrixColorTint:(id)a3
{
}

- (double)colorMatrixColorTintAlpha
{
  return self->_colorMatrixColorTintAlpha;
}

- (void)setColorMatrixColorTintAlpha:(double)a3
{
  self->_colorMatrixColorTintAlpha = a3;
}

- (BOOL)simulatesMasks
{
  return self->_simulatesMasks;
}

- (void)setSimulatesMasks:(BOOL)a3
{
  self->_simulatesMasks = a3;
}

- (BOOL)backdropVisibilitySetOnce
{
  return self->_backdropVisibilitySetOnce;
}

- (BOOL)blurRadiusSetOnce
{
  return self->_blurRadiusSetOnce;
}

- (void)setBlurRadiusSetOnce:(BOOL)a3
{
  self->_blurRadiusSetOnce = a3;
}

- (double)previousBackdropStatisticsRed
{
  return self->_previousBackdropStatisticsRed;
}

- (void)setPreviousBackdropStatisticsRed:(double)a3
{
  self->_previousBackdropStatisticsRed = a3;
}

- (double)previousBackdropStatisticsGreen
{
  return self->_previousBackdropStatisticsGreen;
}

- (void)setPreviousBackdropStatisticsGreen:(double)a3
{
  self->_previousBackdropStatisticsGreeuint64_t n = a3;
}

- (double)previousBackdropStatisticsBlue
{
  return self->_previousBackdropStatisticsBlue;
}

- (void)setPreviousBackdropStatisticsBlue:(double)a3
{
  self->_previousBackdropStatisticsBlue = a3;
}

- (double)previousBackdropStatisticsContrast
{
  return self->_previousBackdropStatisticsContrast;
}

- (void)setPreviousBackdropStatisticsContrast:(double)a3
{
  self->_previousBackdropStatisticsContrast = a3;
}

- (_UIBackdropViewGraphicsQualityChangeDelegate)graphicsQualityChangeDelegate
{
  return self->_graphicsQualityChangeDelegate;
}

- (void)setGraphicsQualityChangeDelegate:(id)a3
{
  self->_graphicsQualityChangeDelegate = (_UIBackdropViewGraphicsQualityChangeDelegate *)a3;
}

- (BOOL)transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack
{
  return self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHack;
}

- (void)setTransitioningBetweenMaterialsRequiringRasterizationAndAlphaHack:(BOOL)a3
{
  self->_transitioningBetweenMaterialsRequiringRasterizationAndAlphaHacuint64_t k = a3;
}

- (NSString)_blurQuality
{
  return self->__blurQuality;
}

- (void)set_blurQuality:(id)a3
{
}

- (double)_blurRadius
{
  return self->__blurRadius;
}

- (void)set_blurRadius:(double)a3
{
  self->__blurRadius = a3;
}

- (double)_saturationDeltaFactor
{
  return self->__saturationDeltaFactor;
}

- (void)set_saturationDeltaFactor:(double)a3
{
  self->__saturationDeltaFactor = a3;
}

- (BOOL)_backdropVisible
{
  return self->__backdropVisible;
}

- (void)set_backdropVisible:(BOOL)a3
{
  self->__backdropVisible = a3;
}

@end