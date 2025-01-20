@interface _UISlideriOSVisualElement
+ ($8D73A32B3079A4343D49B0A1BE7BFAC4)drawingMetricsForPlatform;
+ (id)_modernThumbImageWithTraitCollection:(id)a3 tintColor:(id)a4;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_shouldBeginTrackingAtPoint:(CGPoint)a3 pointInKnob:(CGPoint *)a4 inKnob:(BOOL *)a5;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)cancelMouseTracking;
- (BOOL)cancelTouchTracking;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAnimatingValueChange;
- (CGRect)maximumValueImageRectForBounds:(CGRect)a3;
- (CGRect)minimumValueImageRectForBounds:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGRect)valueTextRectForBounds:(CGRect)a3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)thumbHitEdgeInsets;
- (UISlider)slider;
- (UISliderDataModel)data;
- (_UISlideriOSVisualElement)init;
- (_UISlideriOSVisualElement)initWithFrame:(CGRect)a3;
- (double)_cornerRadiusForRect:(CGRect)a3;
- (double)thumbDimensionNeue;
- (id)_maxTrackClipView;
- (id)_minTrackClipView;
- (id)createThumbView;
- (id)createThumbViewNeue;
- (id)currentMaximumTrackImage;
- (id)currentMinimumTrackImage;
- (id)currentThumbImage;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)maxTrackView;
- (id)maxValueImageView;
- (id)maximumValueImage;
- (id)minTrackView;
- (id)minValueImageView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)thumbTintColor;
- (id)thumbView;
- (id)thumbViewNeue;
- (unint64_t)state;
- (void)_bounceMinMaxValueImageViewsIfNeeded;
- (void)_buildTrackArtwork;
- (void)_controlTouchBegan:(id)a3 withEvent:(id)a4;
- (void)_initImages;
- (void)_initSubviews;
- (void)_layoutSubviewsForBoundsChange:(BOOL)a3;
- (void)_listenForContentSizeCategoryChangesIfNecessary;
- (void)_rebuildControlThumb:(BOOL)a3 track:(BOOL)a4;
- (void)_setSliderNeedsLayout;
- (void)_setValue:(float)a3 andSendAction:(BOOL)a4;
- (void)_setupFeedback;
- (void)_sliderAnimationDidStop:(BOOL)a3;
- (void)_sliderAnimationWillStart;
- (void)_traitCollectionDidChangeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)_updateAppearanceForEnabled:(BOOL)a3;
- (void)_updateMaxTrackColorForInitialization:(BOOL)a3;
- (void)_updateMinimumTrackTintColor;
- (void)dealloc;
- (void)didChangeMinimumTrackVisibleWithDuration:(double)a3;
- (void)didPerformLayout;
- (void)didSetEnabled;
- (void)didSetMaximumTrackImageForState:(unint64_t)a3;
- (void)didSetMaximumTrackImageForStates;
- (void)didSetMaximumTrackTintColor;
- (void)didSetMaximumValueImage;
- (void)didSetMinimumTrackImageForState:(unint64_t)a3;
- (void)didSetMinimumTrackImageForStates;
- (void)didSetMinimumTrackTintColor;
- (void)didSetMinimumValueImage;
- (void)didSetThumbEnabled;
- (void)didSetThumbImageForState:(unint64_t)a3;
- (void)didSetThumbImageForStates;
- (void)didSetThumbTintColor;
- (void)didUpdateConfiguration;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setData:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSlider:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)showValueDidChange;
- (void)tintColorDidChange;
@end

@implementation _UISlideriOSVisualElement

- (_UISlideriOSVisualElement)init
{
  +[_UISlideriOSVisualElement drawingMetricsForPlatform];
  return -[_UISlideriOSVisualElement initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, v4);
}

- (_UISlideriOSVisualElement)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UISlideriOSVisualElement;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setAlpha:1.0];
    [(UIView *)v4 setOpaque:0];
    v5 = [(UIView *)v4 layer];
    [v5 setAllowsGroupOpacity:1];

    -[UIView _setTouchInsets:](v4, "_setTouchInsets:", -12.5, -12.5, -12.5, -12.5);
    [(_UISlideriOSVisualElement *)v4 _listenForContentSizeCategoryChangesIfNecessary];
    v6 = (objc_class *)objc_opt_class();
    v7 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v6, sel__modifiedTrackRect_);
    IMP v9 = class_getMethodImplementation(v7, sel__modifiedTrackRect_);
    if (MethodImplementation)
    {
      if (v9 && MethodImplementation != v9) {
        *(unsigned char *)&v4->_sliderFlags |= 4u;
      }
    }
  }
  return v4;
}

- (void)setSlider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = [(UISliderDataModel *)self->_data edgeFeedbackGenerator];

    if (v6)
    {
      v7 = [(_UISlideriOSVisualElement *)self slider];
      v8 = [(UISliderDataModel *)self->_data edgeFeedbackGenerator];
      [v7 removeInteraction:v8];

      if (obj)
      {
        IMP v9 = [(UISliderDataModel *)self->_data edgeFeedbackGenerator];
        [obj addInteraction:v9];
      }
    }
    [(_UISlideriOSVisualElement *)self didUpdateConfiguration];
    objc_storeWeak((id *)&self->_slider, obj);
    v5 = obj;
  }
}

- (void)setData:(id)a3
{
  id v10 = a3;
  p_data = &self->_data;
  objc_storeStrong((id *)&self->_data, a3);
  [(_UISlideriOSVisualElement *)self _setupFeedback];
  self->_trackIsArtworkBased = 0;
  self->_thumbIsArtworkBased = 0;
  uint64_t v6 = [(UISliderDataModel *)self->_data minimumTrackImageForState:0];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(UISliderDataModel *)*p_data maximumTrackImageForState:0];

    if (v8) {
      self->_trackIsArtworkBased = 1;
    }
  }
  IMP v9 = [(UISliderDataModel *)*p_data thumbImageForState:0];

  if (v9) {
    self->_thumbIsArtworkBased = 1;
  }
}

- (void)_listenForContentSizeCategoryChangesIfNecessary
{
  if (dyld_program_sdk_at_least())
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__contentSizeCategoryChanged_ name:@"UIContentSizeCategoryDidChangeNotification" object:0];
  }
}

- (void)_setupFeedback
{
  id v3 = [(UISliderDataModel *)self->_data edgeFeedbackGenerator];

  if (!v3)
  {
    double v4 = +[_UIEdgeFeedbackGeneratorConfiguration sliderConfiguration];
    id v8 = [v4 tweakedConfigurationForClass:objc_opt_class() usage:@"edgeImpact"];

    v5 = [_UIEdgeFeedbackGenerator alloc];
    uint64_t v6 = [(_UISlideriOSVisualElement *)self slider];
    v7 = [(_UIEdgeFeedbackGenerator *)v5 initWithConfiguration:v8 view:v6];
    [(UISliderDataModel *)self->_data setEdgeFeedbackGenerator:v7];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  char v10 = 0;
  objc_msgSend(a4, "location", a3);
  -[_UISlideriOSVisualElement _shouldBeginTrackingAtPoint:pointInKnob:inKnob:](self, "_shouldBeginTrackingAtPoint:pointInKnob:inKnob:", 0, &v10);
  if (v10)
  {
    uint64_t v6 = 5;
    if (!self->_thumbIsArtworkBased) {
      uint64_t v6 = 6;
    }
    [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v6]) frame];
    v7 = @"UISliderKnob";
  }
  else
  {
    [(UIView *)self bounds];
    v7 = @"UISliderTrack";
  }
  id v8 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v7);
  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  +[_UISlideriOSVisualElement drawingMetricsForPlatform];
  uint64_t v6 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v16, v17, v18, v19);
  v7 = [v5 identifier];
  int v8 = [v7 isEqual:@"UISliderKnob"];

  if (v8)
  {
    if (self->_thumbIsArtworkBased)
    {
      IMP v9 = [[UITargetedPreview alloc] initWithView:self->_thumbView];
      char v10 = +[UIPointerEffect effectWithPreview:v9];
      objc_super v11 = +[UIPointerStyle styleWithEffect:v10 shape:0];
    }
    else
    {
      IMP v9 = (UITargetedPreview *)objc_opt_new();
      [(UITargetedPreview *)v9 setVisiblePath:v6];
      char v10 = [[UITargetedPreview alloc] initWithView:self->_innerThumbView parameters:v9];
      v14 = +[UIPointerEffect effectWithPreview:v10];
      objc_super v11 = +[UIPointerStyle styleWithEffect:v14 shape:0];
    }
  }
  else
  {
    v12 = [v5 identifier];
    int v13 = [v12 isEqual:@"UISliderTrack"];

    if (!v13)
    {
      objc_super v11 = 0;
      goto LABEL_10;
    }
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = v18;
    v21.size.height = v19;
    +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", 0.0, 0.0, v18, v19, CGRectGetWidth(v21) * 0.5);
    IMP v9 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
    objc_super v11 = +[UIPointerStyle styleWithShape:v9 constrainedAxes:2];
  }

LABEL_10:
  return v11;
}

- (void)_bounceMinMaxValueImageViewsIfNeeded
{
  id v3 = [(_UISlideriOSVisualElement *)self slider];
  int v4 = [v3 _allowsSymbolAnimations];

  if (v4)
  {
    id v5 = [(_UISlideriOSVisualElement *)self slider];
    [v5 maximumValue];
    float v7 = v6;

    int v8 = [(_UISlideriOSVisualElement *)self slider];
    [v8 minimumValue];
    float v10 = v9;

    if (v7 > v10)
    {
      if (self->_minValueImageView)
      {
        objc_super v11 = [(_UISlideriOSVisualElement *)self slider];
        [v11 value];
        float v13 = v12;

        if (v13 <= v10)
        {
          minValueImageView = self->_minValueImageView;
          v15 = [MEMORY[0x1E4F41A30] effect];
          [(UIImageView *)minValueImageView addSymbolEffect:v15];
        }
      }
      if (self->_maxValueImageView)
      {
        double v16 = [(_UISlideriOSVisualElement *)self slider];
        [v16 value];
        float v18 = v17;

        if (v18 >= v7)
        {
          maxValueImageView = self->_maxValueImageView;
          id v20 = [MEMORY[0x1E4F41A30] effect];
          [(UIImageView *)maxValueImageView addSymbolEffect:v20];
        }
      }
    }
  }
}

+ (id)_modernThumbImageWithTraitCollection:(id)a3 tintColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB25E488 != -1) {
    dispatch_once(&qword_1EB25E488, &__block_literal_global_394);
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_2;
  v21[3] = &unk_1E52EB218;
  v23 = &v29;
  id v7 = v6;
  id v22 = v7;
  v24 = &v25;
  +[UITraitCollection _performWithCurrentTraitCollection:usingBlock:]((uint64_t)UITraitCollection, (uint64_t)v5, (uint64_t)v21);
  int v8 = [_UICGColorCacheKey alloc];
  float v9 = -[_UICGColorCacheKey initWithColors:](v8, "initWithColors:", v30[3], v26[3], 0);
  float v10 = [(id)_MergedGlobals_19_8 objectForKey:v9];
  if (!v10)
  {
    objc_super v11 = [UIGraphicsImageRenderer alloc];
    +[_UISlideriOSVisualElement drawingMetricsForPlatform];
    float v12 = -[UIGraphicsImageRenderer initWithSize:](v11, "initWithSize:", v19, v20);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_3;
    v15[3] = &unk_1E52FE910;
    id v16 = v5;
    float v17 = &v25;
    float v18 = &v29;
    float v13 = [(UIGraphicsImageRenderer *)v12 imageWithActions:v15];
    float v10 = objc_msgSend(v13, "resizableImageWithCapInsets:", 0.0, 28.0, 0.0, 28.0);

    if (v10) {
      [(id)_MergedGlobals_19_8 setObject:v10 forKey:v9];
    }
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v10;
}

- (id)createThumbViewNeue
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  -[_UISlideriOSVisualElement trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
  LODWORD(v43) = 0;
  objc_msgSend(WeakRetained, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v13, v14, v15, v43);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = [(_UISlideriOSVisualElement *)self thumbTintColor];
  if (dyld_program_sdk_at_least())
  {
    uint64_t v25 = objc_opt_class();
    v26 = [(UIView *)self traitCollection];
    uint64_t v27 = [v25 _modernThumbImageWithTraitCollection:v26 tintColor:v24];
  }
  else
  {
    uint64_t v28 = _UIImageWithName(@"UISliderKnob");
    v26 = v28;
    if (!v24) {
      goto LABEL_6;
    }
    uint64_t v27 = [v28 _flatImageWithColor:v24];
  }
  uint64_t v29 = (void *)v27;

  v26 = v29;
LABEL_6:
  v30 = [[UIImageView alloc] initWithImage:v26];
  innerThumbView = self->_innerThumbView;
  self->_innerThumbView = v30;

  uint64_t v32 = -[UIImageView initWithFrame:]([UISliderImageView alloc], "initWithFrame:", v17, v19, v21, v23);
  [(UIView *)v32 setUserInteractionEnabled:0];
  [(UIView *)v32 setOpaque:0];
  if (v21 + -44.0 <= 0.0) {
    double v33 = (v21 + -44.0) * 0.5;
  }
  else {
    double v33 = 0.0;
  }
  if (v23 + -44.0 <= 0.0) {
    double v34 = (v23 + -44.0) * 0.5;
  }
  else {
    double v34 = 0.0;
  }
  -[UIView _setTouchInsets:](v32, "_setTouchInsets:", v34, v33, v34, v33);
  [(UIView *)v32 addSubview:self->_innerThumbView];
  [(UIView *)self->_innerThumbView frame];
  double v36 = v35;
  double v38 = v37;
  UIFloorToViewScale(self);
  double v40 = v39;
  UIFloorToViewScale(self);
  -[UIImageView setFrame:](self->_innerThumbView, "setFrame:", v40, v41, v36, v38);

  return v32;
}

- (void)_initImages
{
  v22[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(_UISlideriOSVisualElement *)self slider];
  double v4 = [v3 minimumTrackImageForState:0];

  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    [(UIView *)self bounds];
    objc_msgSend(WeakRetained, "trackRectForBounds:");
    double v7 = v6;

    if (v7 <= 0.0)
    {
      double v12 = 0;
    }
    else
    {
      double v8 = [(UIView *)self traitCollection];
      double v9 = +[UIColor blackColor];
      v22[0] = v9;
      double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      objc_super v11 = +[UIProgressView _tintedImageWithTraitCollection:v8 forHeight:v10 andColors:5 roundingRectCorners:v7];
      double v12 = [v11 imageWithRenderingMode:2];
    }
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __40___UISlideriOSVisualElement__initImages__block_invoke;
    double v19 = &unk_1E52D9F98;
    double v20 = self;
    id v21 = v12;
    id v13 = v12;
    +[UIView _performSystemAppearanceModifications:&v16];
  }
  double v14 = [(_UISlideriOSVisualElement *)self slider];
  double v15 = [v14 maximumTrackImageForState:0];

  if (!v15) {
    [(_UISlideriOSVisualElement *)self _updateMaxTrackColorForInitialization:1];
  }
}

- (void)_initSubviews
{
  [(_UISlideriOSVisualElement *)self _buildTrackArtwork];
  BOOL thumbIsArtworkBased = self->_thumbIsArtworkBased;
  double v4 = [(_UISlideriOSVisualElement *)self slider];
  double v5 = (objc_class *)[v4 createThumbView];
  uint64_t v6 = 5;
  if (!thumbIsArtworkBased) {
    uint64_t v6 = 6;
  }
  uint64_t v7 = OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v6];
  double v8 = *(Class *)((char *)&self->super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.isa + v7) = v5;

  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
  [(UIView *)self addSubview:v9];
}

- (double)_cornerRadiusForRect:(CGRect)a3
{
  if (a3.size.height <= a3.size.width) {
    double height = a3.size.height;
  }
  else {
    double height = a3.size.width;
  }
  return height * 0.5;
}

- (void)_buildTrackArtwork
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "trackRectForBounds:", v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, v15, v17, v19);
  maxTrackClipView = self->_maxTrackClipView;
  self->_maxTrackClipView = v20;

  double v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v13, v15, v17, v19);
  minTrackClipView = self->_minTrackClipView;
  self->_minTrackClipView = v22;

  [(UIView *)self->_maxTrackClipView setUserInteractionEnabled:0];
  [(UIView *)self->_maxTrackClipView setOpaque:0];
  [(UIView *)self->_maxTrackClipView setClipsToBounds:1];
  [(UIView *)self->_minTrackClipView setUserInteractionEnabled:0];
  [(UIView *)self->_minTrackClipView setOpaque:0];
  [(UIView *)self->_minTrackClipView setClipsToBounds:1];
  if (self->_thumbView || self->_thumbViewNeue)
  {
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_maxTrackClipView);
    thumbView = self->_thumbView;
    if (!thumbView) {
      thumbView = (UIImageView *)self->_thumbViewNeue;
    }
    [(UIView *)self insertSubview:self->_minTrackClipView belowSubview:thumbView];
  }
  else
  {
    [(UIView *)self addSubview:self->_maxTrackClipView];
    [(UIView *)self addSubview:self->_minTrackClipView];
  }
  uint64_t v25 = [UIImageView alloc];
  [(UIView *)self->_maxTrackClipView bounds];
  v26 = -[UIImageView initWithFrame:](v25, "initWithFrame:");
  maxTrackView = self->_maxTrackView;
  self->_maxTrackView = v26;

  [(UIView *)self->_maxTrackView setUserInteractionEnabled:0];
  [(UIView *)self->_maxTrackView setOpaque:0];
  [(UIView *)self->_maxTrackView setClipsToBounds:1];
  uint64_t v28 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v13, v15, v17, v19);
  minTrackView = self->_minTrackView;
  self->_minTrackView = v28;

  [(UIView *)self->_minTrackView setUserInteractionEnabled:0];
  [(UIView *)self->_minTrackView setOpaque:0];
  [(UIView *)self->_minTrackView setClipsToBounds:1];
  [(UIView *)self->_maxTrackClipView addSubview:self->_maxTrackView];
  v30 = self->_minTrackClipView;
  uint64_t v31 = self->_minTrackView;
  [(UIView *)v30 addSubview:v31];
}

- (void)_rebuildControlThumb:(BOOL)a3 track:(BOOL)a4
{
  BOOL v4 = a4;
  p_thumbView = &self->_thumbView;
  thumbView = self->_thumbView;
  if (thumbView || self->_thumbViewNeue)
  {
    if (a3)
    {
      [(UIView *)thumbView removeFromSuperview];
      double v8 = (void *)*p_thumbView;
      void *p_thumbView = 0;

      [(UIView *)self->_thumbViewNeue removeFromSuperview];
      thumbViewNeue = self->_thumbViewNeue;
      self->_thumbViewNeue = 0;

      BOOL thumbIsArtworkBased = self->_thumbIsArtworkBased;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
      uint64_t v12 = [WeakRetained createThumbView];
      if (!thumbIsArtworkBased) {
        p_thumbView = &self->_thumbViewNeue;
      }
      double v13 = (void *)*p_thumbView;
      void *p_thumbView = v12;

      [(UIView *)self addSubview:*p_thumbView];
    }
    if (v4)
    {
      [(UIView *)self->_minTrackView removeFromSuperview];
      minTrackView = self->_minTrackView;
      self->_minTrackView = 0;

      [(UIView *)self->_minTrackClipView removeFromSuperview];
      minTrackClipView = self->_minTrackClipView;
      self->_minTrackClipView = 0;

      [(UIView *)self->_maxTrackView removeFromSuperview];
      maxTrackView = self->_maxTrackView;
      self->_maxTrackView = 0;

      [(UIView *)self->_maxTrackClipView removeFromSuperview];
      maxTrackClipView = self->_maxTrackClipView;
      self->_maxTrackClipView = 0;

      [(_UISlideriOSVisualElement *)self _buildTrackArtwork];
    }
    [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  }
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIContentSizeCategoryDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UISlideriOSVisualElement;
  [(UIView *)&v4 dealloc];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  char v6 = [WeakRetained isTracking];

  if (v6)
  {
    BOOL v8 = 0;
    goto LABEL_19;
  }
  [v4 locationInView:self];
  if (!-[_UISlideriOSVisualElement _shouldBeginTrackingAtPoint:pointInKnob:inKnob:](self, "_shouldBeginTrackingAtPoint:pointInKnob:inKnob:", 0, 0))goto LABEL_18; {
  double v9 = [v4 view];
  }
  if (v9 == self)
  {

    goto LABEL_18;
  }
  double v10 = v9;
  id v11 = [v4 view];
  id v12 = objc_loadWeakRetained((id *)&self->_slider);

  if (v11 == v12)
  {
LABEL_18:
    BOOL v8 = 1;
    goto LABEL_19;
  }
  if (![v4 _isGestureType:10] || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {
    if ([v4 _isGestureType:8]
      && (unint64_t)[v4 minimumNumberOfTouches] <= 1)
    {
      [v4 translationInView:self];
      double v7 = fabs(v24);
      BOOL v8 = v7 <= fabs(v25);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  double v13 = [v4 view];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, 10.0, 10.0);
  double v15 = v14;
  double v17 = v16;

  double v18 = [v4 view];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v18, 20.0, 10.0);
  double v20 = v19;
  double v22 = v21;

  if (([v4 direction] & 3) == 0 || (BOOL v8 = 0, v7 = v15 - v20, v15 - v20 >= 0.0) && v15 - v20 <= 0.0)
  {
    char v23 = objc_msgSend(v4, "direction", v7);
    double v7 = v17 - v22;
    BOOL v8 = (v23 & 0xC) == 0 || v17 - v22 == 0.0;
  }
LABEL_19:
  BOOL v26 = v8 & ~objc_msgSend(v4, "_isGestureType:", 16, v7);

  return v26;
}

- (void)didSetThumbImageForState:(unint64_t)a3
{
  double v5 = [(_UISlideriOSVisualElement *)self slider];
  id v7 = [v5 thumbImageForState:a3];

  if (!self->_thumbIsArtworkBased)
  {
    if (!v7) {
      goto LABEL_8;
    }
    BOOL v6 = 1;
    goto LABEL_7;
  }
  if (!a3 && !v7)
  {
    BOOL v6 = 0;
LABEL_7:
    self->_BOOL thumbIsArtworkBased = v6;
    [(_UISlideriOSVisualElement *)self _rebuildControlThumb:1 track:0];
  }
LABEL_8:
  [(UISliderDataModel *)self->_data setThumbTintColor:0];
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (id)thumbTintColor
{
  return [(UISliderDataModel *)self->_data thumbTintColor];
}

- (void)didSetThumbTintColor
{
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(_UISlideriOSVisualElement *)self _rebuildControlThumb:1 track:0];
}

- (void)didSetMinimumTrackImageForState:(unint64_t)a3
{
  uint64_t v5 = -[UISliderDataModel minimumTrackImageForState:](self->_data, "minimumTrackImageForState:");
  id v9 = (id)v5;
  if (a3 || v5)
  {
    if (!a3)
    {
      BOOL v6 = [(_UISlideriOSVisualElement *)self slider];
      id v7 = [v6 maximumTrackImageForState:0];

      if (!self->_trackIsArtworkBased && v7 != 0)
      {
        self->_trackIsArtworkBased = 1;
        [(_UISlideriOSVisualElement *)self _rebuildControlThumb:0 track:1];
      }
    }
  }
  else if (self->_trackIsArtworkBased)
  {
    self->_trackIsArtworkBased = 0;
    [(_UISlideriOSVisualElement *)self _rebuildControlThumb:0 track:1];
  }
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_updateMinimumTrackTintColor
{
  v14[1] = *MEMORY[0x1E4F143B8];
  [(UISliderDataModel *)self->_data setMinimumTrackImage:0 forStates:0];
  [(UISliderDataModel *)self->_data setMinimumTrackImage:0 forStates:7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  [(UIView *)self bounds];
  objc_msgSend(WeakRetained, "trackRectForBounds:");
  double v5 = v4;

  BOOL v6 = [(UISliderDataModel *)self->_data minimumTrackTintColor];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = 1;
  }
  else
  {
    id v8 = +[UIColor blackColor];
    uint64_t v9 = 2;
  }
  double v10 = [(UIView *)self traitCollection];
  v14[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v12 = +[UIProgressView _tintedImageWithTraitCollection:v10 forHeight:v11 andColors:5 roundingRectCorners:v5];
  double v13 = [v12 imageWithRenderingMode:v9];

  [(UISliderDataModel *)self->_data setMinimumTrackImage:v13 forStates:0];
}

- (void)didSetMinimumTrackTintColor
{
  [(_UISlideriOSVisualElement *)self _updateMinimumTrackTintColor];
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
}

- (void)didSetMaximumTrackImageForState:(unint64_t)a3
{
  double v5 = [(_UISlideriOSVisualElement *)self slider];
  id v9 = [v5 maximumTrackImageForState:a3];

  if (a3 || v9)
  {
    if (!a3)
    {
      uint64_t v6 = [(UISliderDataModel *)self->_data minimumTrackImageForState:0];
      id v7 = (void *)v6;
      if (!self->_trackIsArtworkBased && v6 != 0)
      {
        self->_trackIsArtworkBased = 1;
        [(_UISlideriOSVisualElement *)self _rebuildControlThumb:0 track:1];
      }
    }
  }
  else if (self->_trackIsArtworkBased)
  {
    self->_trackIsArtworkBased = 0;
    [(_UISlideriOSVisualElement *)self _rebuildControlThumb:0 track:1];
  }
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)didSetMaximumTrackTintColor
{
  self->_trackIsArtworkBased = 0;
  [(_UISlideriOSVisualElement *)self _updateMaxTrackColorForInitialization:0];
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
}

- (void)didSetMinimumValueImage
{
  uint64_t v3 = [(UISliderDataModel *)self->_data minimumValueImage];
  minValueImageView = self->_minValueImageView;
  id v8 = (id)v3;
  if (v3)
  {
    if (minValueImageView)
    {
      [(UIImageView *)minValueImageView setImage:v3];
      [(UIView *)self->_minValueImageView sizeToFit];
    }
    else
    {
      uint64_t v6 = [[UIImageView alloc] initWithImage:v3];
      id v7 = self->_minValueImageView;
      self->_minValueImageView = v6;

      [(UIView *)self addSubview:self->_minValueImageView];
    }
  }
  else
  {
    [(UIView *)minValueImageView removeFromSuperview];
    double v5 = self->_minValueImageView;
    self->_minValueImageView = 0;
  }
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)didSetMaximumValueImage
{
  uint64_t v3 = [(UISliderDataModel *)self->_data maximumValueImage];
  maxValueImageView = self->_maxValueImageView;
  id v8 = (id)v3;
  if (v3)
  {
    if (maxValueImageView)
    {
      [(UIImageView *)maxValueImageView setImage:v3];
      [(UIView *)self->_maxValueImageView sizeToFit];
    }
    else
    {
      uint64_t v6 = [[UIImageView alloc] initWithImage:v3];
      id v7 = self->_maxValueImageView;
      self->_maxValueImageView = v6;

      [(UIView *)self addSubview:self->_maxValueImageView];
    }
  }
  else
  {
    [(UIView *)maxValueImageView removeFromSuperview];
    double v5 = self->_maxValueImageView;
    self->_maxValueImageView = 0;
  }
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (id)maximumValueImage
{
  return [(UISliderDataModel *)self->_data maximumValueImage];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UISlideriOSVisualElement;
  [(UIView *)&v3 tintColorDidChange];
  [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:0];
}

- (id)currentThumbImage
{
  objc_super v3 = [(_UISlideriOSVisualElement *)self slider];
  double v4 = objc_msgSend(v3, "thumbImageForState:", -[_UISlideriOSVisualElement state](self, "state"));

  return v4;
}

- (id)currentMinimumTrackImage
{
  objc_super v3 = [(_UISlideriOSVisualElement *)self slider];
  double v4 = objc_msgSend(v3, "minimumTrackImageForState:", -[_UISlideriOSVisualElement state](self, "state"));

  return v4;
}

- (id)currentMaximumTrackImage
{
  objc_super v3 = [(_UISlideriOSVisualElement *)self slider];
  double v4 = objc_msgSend(v3, "maximumTrackImageForState:", -[_UISlideriOSVisualElement state](self, "state"));

  return v4;
}

- (unint64_t)state
{
  if ([(UISliderDataModel *)self->_data isEnabled]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  unint64_t v4 = v3 | [(UISliderDataModel *)self->_data isHighlighted];
  if ([(UISliderDataModel *)self->_data isSelected]) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

+ ($8D73A32B3079A4343D49B0A1BE7BFAC4)drawingMetricsForPlatform
{
  if (qword_1EB25E490 != -1) {
    dispatch_once(&qword_1EB25E490, &__block_literal_global_44_0);
  }
  CGSize v4 = *(CGSize *)&qword_1EB25E4B0;
  retstr->var0.origin = (CGPoint)xmmword_1EB25E4A0;
  retstr->var0.size = v4;
  long long v5 = unk_1EB25E4D0;
  retstr->var1 = (CGSize)xmmword_1EB25E4C0;
  *(_OWORD *)&retstr->var2 = v5;
  return result;
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  minValueImageView = self->_minValueImageView;
  if (minValueImageView)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v9 = [(UIImageView *)minValueImageView image];
    [v9 size];
    double v11 = v10;
    double v13 = v12;

    double v14 = x + width - v11;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
      double v14 = x;
    }
    double v15 = y + floor((height - v13) * 0.5);
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  maxValueImageView = self->_maxValueImageView;
  if (maxValueImageView)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v9 = [(UIImageView *)maxValueImageView image];
    [v9 size];
    double v11 = v10;
    double v13 = v12;

    double v14 = x + width - v11;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
      double v14 = x;
    }
    double v15 = y + floor((height - v13) * 0.5);
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(_UISlideriOSVisualElement *)self slider];
  id v8 = [v7 maximumTrackImageForState:0];
  [v8 size];
  double v10 = v9;

  if (!self->_trackIsArtworkBased)
  {
    int v11 = dyld_program_sdk_at_least();
    if (dyld_program_sdk_at_least()) {
      goto LABEL_6;
    }
    double v10 = 2.0;
    if (dyld_program_sdk_at_least())
    {
      if (_AXSEnhanceTextLegibilityEnabled()
        || ([(UIView *)self traitCollection],
            double v12 = objc_claimAutoreleasedReturnValue(),
            [v12 preferredContentSizeCategory],
            double v13 = (NSString *)objc_claimAutoreleasedReturnValue(),
            IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v13),
            v13,
            v12,
            IsAccessibilityCategory))
      {
LABEL_6:
        double v10 = 3.0;
      }
    }
    if (v11) {
      double v10 = 4.0;
    }
  }
  if (self->_minValueImageView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(WeakRetained, "minimumValueImageRectForBounds:", x, y, width, height);
    float v17 = v16 + 11.0;

    double v18 = v17;
    double v19 = -0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
      double v19 = v17;
    }
    double v20 = x + v19;
    double v21 = width;
    double v22 = width - v18;
  }
  else
  {
    double v21 = width;
    double v22 = width;
    double v20 = x;
  }
  double v23 = round((height - v10) * 0.5);
  if (self->_maxValueImageView)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_slider);
    double v25 = y;
    objc_msgSend(v24, "maximumValueImageRectForBounds:", x, y, v21, height);
    float v27 = v26 + 11.0;

    double v28 = -0.0;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
      double v28 = v27;
    }
    double v20 = v20 + v28;
    double v22 = v22 - v27;
  }
  else
  {
    double v25 = y;
  }
  if (dyld_program_sdk_at_least()) {
    double v29 = 3.0;
  }
  else {
    double v29 = 2.0;
  }
  if (v22 >= v29 + v29) {
    double v30 = v22;
  }
  else {
    double v30 = v29 + v29;
  }
  double v31 = v20;
  double v32 = v23;
  double v33 = v10;
  CGRect v44 = CGRectInset(*(CGRect *)(&v30 - 2), v29, 0.0);
  CGFloat v34 = v44.origin.x;
  CGFloat v35 = v44.origin.y;
  double v36 = v44.size.width;
  CGFloat v37 = v44.size.height;
  if ([(UISliderDataModel *)self->_data showValue])
  {
    -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:", x, v25, v21, height);
    double v36 = v36 - (v38 + 11.0);
  }
  double v39 = v34;
  double v40 = v35;
  double v41 = v36;
  double v42 = v37;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (double)thumbDimensionNeue
{
  +[_UISlideriOSVisualElement drawingMetricsForPlatform];
  return v3;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(UISliderDataModel *)self->_data minimumValue];
  float v11 = v10;
  [(UISliderDataModel *)self->_data maximumValue];
  float v13 = 0.0;
  if (v12 != v11)
  {
    float v14 = a5;
    if (v11 > a5) {
      float v14 = v11;
    }
    if (v14 > v12) {
      float v14 = v12;
    }
    float v13 = (float)(v14 - v11) / (float)(v12 - v11);
  }
  if (dyld_program_sdk_at_least()) {
    double v15 = -3.0;
  }
  else {
    double v15 = -2.0;
  }
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRect v33 = CGRectInset(v32, v15, 0.0);
  double v16 = v33.origin.x;
  double v17 = v33.origin.y;
  double v18 = v33.size.width;
  double v19 = v33.size.height;
  if (self->_thumbIsArtworkBased)
  {
    double v20 = [(_UISlideriOSVisualElement *)self currentThumbImage];
    [v20 size];
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    [(_UISlideriOSVisualElement *)self thumbDimensionNeue];
    double v22 = v25;
    [(_UISlideriOSVisualElement *)self thumbDimensionNeue];
    double v24 = v26;
  }
  float v27 = 1.0 - v13;
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
    float v27 = v13;
  }
  double v28 = v16 + round((v18 - v22) * v27);
  double v29 = v17 + round((v19 - v24) * 0.5);
  double v30 = v22;
  double v31 = v24;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double width = a3.width;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  +[_UISlideriOSVisualElement drawingMetricsForPlatform];
  id v7 = [(_UISlideriOSVisualElement *)self slider];
  id v8 = [v7 minimumTrackImageForState:0];

  if (v8)
  {
    [v8 size];
    double v10 = v9;
    double v12 = v11;
    BOOL v13 = [v8 leftCapWidth] > 0;
    if (v12 > v6) {
      double v6 = v12;
    }
    if (v10 > v5) {
      double v5 = v10;
    }
  }
  else
  {
    BOOL v13 = 1;
    if (v38 > v6) {
      double v6 = v38;
    }
  }
  float v14 = [(_UISlideriOSVisualElement *)self slider];
  double v15 = [v14 maximumTrackImageForState:0];

  if (v15)
  {
    [v15 size];
    double v17 = v16;
    double v19 = v18;
    if (v13) {
      LOBYTE(v13) = [v15 leftCapWidth] > 0;
    }
    if (v19 <= v6) {
      double v19 = v6;
    }
    if (v17 > v5) {
      double v5 = v17;
    }
  }
  else if (v38 > v6)
  {
    double v19 = v38;
  }
  else
  {
    double v19 = v6;
  }
  if (self->_thumbIsArtworkBased)
  {
    double v20 = [(_UISlideriOSVisualElement *)self slider];
    double v21 = [v20 thumbImageForState:0];

    if (v21)
    {
      [v21 size];
      if (v23 > v19) {
        double v19 = v23;
      }
      if (v22 > v5) {
        double v5 = v22;
      }
      double v15 = v21;
    }
    else
    {
      double v15 = 0;
    }
  }
  else
  {
    [(_UISlideriOSVisualElement *)self thumbDimensionNeue];
    double v25 = v24;
    [(_UISlideriOSVisualElement *)self thumbDimensionNeue];
    if (v26 > v19) {
      double v19 = v26;
    }
    if (v25 > v5) {
      double v5 = v25;
    }
  }
  float v27 = [(_UISlideriOSVisualElement *)self slider];
  double v28 = [v27 minimumValueImage];

  if (v28)
  {
    [v28 size];
    double v5 = v5 + v30 + 11.0;
    if (v29 > v19) {
      double v19 = v29;
    }
  }
  double v31 = [(_UISlideriOSVisualElement *)self slider];
  CGRect v32 = [v31 maximumValueImage];

  if (v32)
  {
    [v32 size];
    double v5 = v5 + v34 + 11.0;
    if (v33 > v19) {
      double v19 = v33;
    }
  }
  if (![(UISliderDataModel *)self->_data showValue] || (double v5 = v5 + 34.0, v35 = 15.0, v19 >= 15.0)) {
    double v35 = v19;
  }
  if (v5 > width || !v13) {
    double width = v5;
  }

  double v36 = width;
  double v37 = v35;
  result.CGFloat height = v37;
  result.double width = v36;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3 = [(_UISlideriOSVisualElement *)self slider];
  CGSize v4 = [v3 thumbImageForState:0];

  double v5 = [(_UISlideriOSVisualElement *)self slider];
  double v6 = [v5 minimumTrackImageForState:0];

  if (!v4
    || ([v4 alignmentRectInsets], v10 = v7, double v11 = v9, v12 = 1, v13 == 0.0)
    && v8 == 0.0
    && v7 == 0.0
    && v9 == 0.0)
  {
    int v12 = 0;
    double v11 = 1.0;
    double v10 = 0.0;
  }
  double v14 = 2.0;
  if (!v6
    || ([v6 alignmentRectInsets], double v19 = v18, v20 = v15, v21 = v16, v22 = v17, v18 == 0.0)
    && v16 == 0.0
    && v15 == 0.0
    && v17 == 0.0)
  {
    double v23 = 2.0;
  }
  else
  {
    int v24 = dyld_program_sdk_at_least();
    double v25 = 2.0;
    if (v24) {
      double v25 = 3.0;
    }
    double v23 = v20 + v25;
    double v14 = v22 + v25;
    if (!v12)
    {
      double v11 = v21;
      double v10 = v19;
    }
  }

  double v26 = v10;
  double v27 = v23;
  double v28 = v11;
  double v29 = v14;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  BOOL v12 = v11 != height || v9 != width;
  [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:v12];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  BOOL v12 = v11 != height || v9 != width;
  [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:v12];
}

- (void)didPerformLayout
{
  [(_UISlideriOSVisualElement *)self _initImages];
  if (!self->_thumbView && !self->_thumbViewNeue) {
    [(_UISlideriOSVisualElement *)self _initSubviews];
  }
  [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:0];
}

- (void)_setSliderNeedsLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  [WeakRetained setNeedsLayout];
}

- (void)_traitCollectionDidChangeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView _traitCollectionDidChangeInternal:](&v7, sel__traitCollectionDidChangeInternal_);
  if (dyld_program_sdk_at_least())
  {
    if (([a3->var1 hasDifferentColorAppearanceComparedToTraitCollection:a3->var0] & 1) != 0
      || (unint64_t v5 = _UIGetTraitTokenValue((const __CFNumber *)&unk_1ED3F5C40),
          _UITraitTokenSetContains((uint16x8_t **)&a3->var2, v5)))
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __63___UISlideriOSVisualElement__traitCollectionDidChangeInternal___block_invoke;
      v6[3] = &unk_1E52D9F70;
      v6[4] = self;
      +[UIView performWithoutAnimation:v6];
    }
  }
}

- (void)_updateMaxTrackColorForInitialization:(BOOL)a3
{
  BOOL v3 = a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(_UISlideriOSVisualElement *)self slider];
  double v6 = [v5 maximumTrackTintColor];

  if (!v6)
  {
    if (dyld_program_sdk_at_least()) {
      +[UIColor systemFillColor];
    }
    else {
    double v6 = +[UIColor colorWithRed:0.72265625 green:0.72265625 blue:0.72265625 alpha:1.0];
    }
  }
  double v15 = 0.0;
  double v16 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    if (v6)
    {
      int v8 = [v6 getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
      if ((dyld_program_sdk_at_least() & 1) == 0 && v8)
      {
        double v9 = +[UIColor colorWithRed:v16 * 0.978378378 green:v15 * 0.978378378 blue:v14 * 0.978378378 alpha:v13];
        v18[0] = v9;
        v18[1] = v6;
        objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

        goto LABEL_14;
      }
    }
    else
    {
      dyld_program_sdk_at_least();
    }
    double v17 = v6;
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
LABEL_14:
    if ([(NSArray *)self->_trackColors isEqual:v7]) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  v19[0] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
LABEL_15:
  objc_storeStrong((id *)&self->_trackColors, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67___UISlideriOSVisualElement__updateMaxTrackColorForInitialization___block_invoke;
  v12[3] = &unk_1E52D9F70;
  v12[4] = self;
  double v10 = _Block_copy(v12);
  double v11 = v10;
  if (v3)
  {
    +[UIView _performSystemAppearanceModifications:v10];
  }
  else
  {
    (*((void (**)(void *))v10 + 2))(v10);
    self->_trackIsArtworkBased = 0;
  }

LABEL_19:
}

- (void)_layoutSubviewsForBoundsChange:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  objc_msgSend(WeakRetained, "trackRectForBounds:", v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  CGFloat v116 = v21;
  CGFloat v117 = v19;
  CGFloat v118 = v17;
  CGFloat v119 = v15;
  if ((*(unsigned char *)&self->_sliderFlags & 4) != 0)
  {
    -[_UISlideriOSVisualElement _modifiedTrackRect:](self, "_modifiedTrackRect:", v15, v17, v19, v21);
    double v15 = v22;
    double v17 = v23;
    double v19 = v24;
    double v21 = v25;
  }
  id v26 = objc_loadWeakRetained((id *)&self->_slider);
  double v27 = [(_UISlideriOSVisualElement *)self slider];
  [v27 value];
  LODWORD(v113) = v28;
  objc_msgSend(v26, "thumbRectForBounds:trackRect:value:", v6, v8, v10, v12, v15, v17, v19, v21, v113);
  double v128 = v29;
  double v130 = v30;
  double v121 = v31;
  double v123 = v32;

  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  double v33 = [(_UISlideriOSVisualElement *)self slider];
  v133 = [v33 currentMinimumTrackImage];

  double v34 = [(_UISlideriOSVisualElement *)self slider];
  double v35 = [v34 currentMaximumTrackImage];

  double v36 = [(_UISlideriOSVisualElement *)self slider];
  double v37 = [v36 _edgeFeedbackGenerator];

  double v132 = v12;
  if (v37 && v3)
  {
    v136.origin.double x = v6;
    v136.origin.double y = v8;
    v136.size.double width = v10;
    v136.size.double height = v12;
    CGFloat Width = CGRectGetWidth(v136);
    double v39 = [(_UISlideriOSVisualElement *)self slider];
    double v40 = [v39 _edgeFeedbackGenerator];
    double v41 = Width;
    double v12 = v132;
    [v40 setDistance:v41];
  }
  double v42 = [(_UISlideriOSVisualElement *)self slider];
  char v43 = [v42 _isThumbEnabled];

  double v120 = v10;
  p_slider = &self->_slider;
  if (v43)
  {
    v137.origin.double x = v15;
    v137.origin.double y = v17;
    v137.size.double width = v19;
    v137.size.double height = v21;
    CGRectDivide(v137, &slice, &remainder, v128 + round(v130 * 0.5) - v15, CGRectMinXEdge);
    double v44 = slice.size.width;
    [v133 capInsets];
    if (v44 <= v45)
    {
      slice.origin.double x = v15;
      slice.origin.double y = v17;
      slice.size.double height = v21;
      slice.size.double width = 0.0;
      remainder.origin.double x = v15;
      remainder.origin.double y = v17;
      remainder.size.double width = v19;
      remainder.size.double height = v21;
    }
    else
    {
      double v46 = slice.size.width;
      [v35 capInsets];
      if (v46 >= v19 - v47)
      {
        slice.origin.double x = v15;
        slice.origin.double y = v17;
        slice.size.double width = v19;
        slice.size.double height = v21;
        remainder.origin.double x = v15;
        remainder.origin.double y = v17;
        remainder.size.double width = v19;
        remainder.size.double height = v21;
        v138.origin.double x = v15;
        v138.origin.double y = v17;
        v138.size.double width = v19;
        v138.size.double height = v21;
        remainder.origin.double x = CGRectGetMaxX(v138);
        remainder.size.double width = 0.0;
      }
    }
    double v12 = v132;
    if ((*(unsigned char *)&self->_sliderFlags & 2) != 0)
    {
      v49 = [(_UISlideriOSVisualElement *)self slider];
      v50 = [v49 currentMinimumTrackImage];
      double v51 = (double)([v50 leftCapWidth] + 1);

      v52 = [(_UISlideriOSVisualElement *)self slider];
      v53 = [v52 currentMaximumTrackImage];
      double v54 = (double)([v53 leftCapWidth] + 1);

      double v55 = slice.size.width;
      if (slice.size.width >= v51)
      {
        double v57 = remainder.size.width;
      }
      else
      {
        double v56 = v51 - slice.size.width;
        slice.size.double width = v51;
        double v57 = remainder.size.width - v56;
        remainder.origin.double x = v56 + remainder.origin.x;
        remainder.size.double width = remainder.size.width - v56;
        double v55 = v51;
      }
      double v12 = v132;
      if (v57 < v54)
      {
        double v58 = v54 - v57;
        remainder.origin.double x = remainder.origin.x - v58;
        remainder.size.double width = v54;
        slice.size.double width = v55 - v58;
      }
    }
    double v10 = v120;
    if ([(UISliderDataModel *)self->_data isMinimumTrackVisible])
    {
      v59 = v35;
      double v60 = remainder.size.width;
      double height = remainder.size.height;
      double x = remainder.origin.x;
      double y = remainder.origin.y;
      goto LABEL_21;
    }
  }
  else
  {
    CGSize v48 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    slice.size = v48;
  }
  v59 = v35;
  remainder.origin.double x = v15;
  remainder.origin.double y = v17;
  double x = v15;
  double height = v21;
  double v60 = v19;
  double y = v17;
  remainder.size.double width = v19;
  remainder.size.double height = v21;
LABEL_21:
  int v64 = *((_DWORD *)&self->super._viewFlags + 4);
  if ((v64 & 0x80000) == 0) {
    double y = slice.origin.y;
  }
  if ((*(void *)&v64 & 0x80000) != 0)
  {
    p_double y = &slice.origin.y;
  }
  else
  {
    double v60 = slice.size.width;
    double height = slice.size.height;
    double x = slice.origin.x;
    p_double y = &remainder.origin.y;
  }
  if ((*(void *)&v64 & 0x80000) != 0) {
    p_size = &slice.size;
  }
  else {
    p_size = &remainder.size;
  }
  if ((*(void *)&v64 & 0x80000) != 0) {
    p_double height = &slice.size.height;
  }
  else {
    p_double height = &remainder.size.height;
  }
  if ((*(void *)&v64 & 0x80000) != 0) {
    p_CGRect slice = &slice;
  }
  else {
    p_CGRect slice = &remainder;
  }
  -[UIView setFrame:](self->_minTrackClipView, "setFrame:", x, y, v60, height);
  [(UIImageView *)self->_minTrackView setImage:v133];
  -[UIView convertRect:fromView:](self->_minTrackClipView, "convertRect:fromView:", self, v15, v17, v19, v21);
  -[UIImageView setFrame:](self->_minTrackView, "setFrame:");
  -[UIView setFrame:](self->_maxTrackClipView, "setFrame:", p_slice->origin.x, *p_y, p_size->width, *p_height);
  v69 = v59;
  [(UIImageView *)self->_maxTrackView setImage:v59];
  -[UIView convertRect:fromView:](self->_maxTrackClipView, "convertRect:fromView:", self, v15, v17, v19, v21);
  -[UIImageView setFrame:](self->_maxTrackView, "setFrame:");
  if ((v64 & 0x80000) != 0) {
    -[UIView setFrameOrigin:](self->_maxTrackView, "setFrameOrigin:", *MEMORY[0x1E4F28AD0], *(double *)(MEMORY[0x1E4F28AD0] + 8));
  }
  if (self->_thumbIsArtworkBased)
  {
    v70 = [(_UISlideriOSVisualElement *)self currentThumbImage];
    v71 = [(UIImageView *)self->_thumbView image];

    if (v71 != v70)
    {
      [(UIImageView *)self->_thumbView setImage:v70];
      if ([v70 leftCapWidth] || objc_msgSend(v70, "topCapHeight")) {
        uint64_t v72 = 0;
      }
      else {
        uint64_t v72 = 4;
      }
      [(UIImageView *)self->_thumbView setContentMode:v72];
    }
    -[UIImageView setFrame:](self->_thumbView, "setFrame:", v128, v121, v130, v123);
  }
  else
  {
    -[UIView setFrame:](self->_thumbViewNeue, "setFrame:", v128, v121, v130, v123);
  }
  if ((*(unsigned char *)&self->_sliderFlags & 4) != 0)
  {
    uint64_t v77 = 9;
    if ((*(void *)&v64 & 0x80000) != 0) {
      uint64_t v78 = 9;
    }
    else {
      uint64_t v78 = 8;
    }
    v79 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v78]);
    if ((*(void *)&v64 & 0x80000) != 0) {
      uint64_t v77 = 8;
    }
    id v80 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                            + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v77]));
    id v74 = v79;
    id v81 = objc_loadWeakRetained((id *)p_slider);
    v82 = v81;
    if ((v64 & 0x80000) != 0)
    {
      objc_msgSend(v81, "maximumValueImageRectForBounds:", v6, v8, v10, v12);
      double v124 = v93;
      double v125 = v92;
      double v129 = v95;
      double v131 = v94;

      id v87 = objc_loadWeakRetained((id *)p_slider);
      objc_msgSend(v87, "minimumValueImageRectForBounds:", v6, v8, v10, v12);
    }
    else
    {
      objc_msgSend(v81, "minimumValueImageRectForBounds:", v6, v8, v10, v12);
      double v124 = v84;
      double v125 = v83;
      double v129 = v86;
      double v131 = v85;

      id v87 = objc_loadWeakRetained((id *)p_slider);
      objc_msgSend(v87, "maximumValueImageRectForBounds:", v6, v8, v10, v12);
    }
    double v114 = v91;
    double v115 = v88;
    double v127 = v89;
    double v122 = v90;
    BOOL v75 = v3;
    v76 = &OBJC_IVAR____UIEventSessionHoverAction__tapDragState;

    v139.origin.double x = v15;
    v139.origin.double y = v17;
    v139.size.double width = v19;
    v139.size.double height = v21;
    double MinX = CGRectGetMinX(v139);
    v140.origin.double x = v119;
    v140.origin.double y = v118;
    v140.size.double width = v117;
    v140.size.double height = v116;
    objc_msgSend(v74, "setFrame:", v125 + MinX - CGRectGetMinX(v140), v131, v129, v124);
    v141.origin.double x = v15;
    v141.origin.double y = v17;
    v141.size.double width = v19;
    v141.size.double height = v21;
    double MaxX = CGRectGetMaxX(v141);
    v142.origin.double x = v119;
    v142.origin.double y = v118;
    v142.size.double width = v117;
    v142.size.double height = v116;
    objc_msgSend(v80, "setFrame:", v115 + MaxX - CGRectGetMaxX(v142), v127, v122, v114);

    double v10 = v120;
    double v12 = v132;
  }
  else
  {
    id v73 = objc_loadWeakRetained((id *)p_slider);
    objc_msgSend(v73, "minimumValueImageRectForBounds:", v6, v8, v10, v12);
    -[UIImageView setFrame:](self->_minValueImageView, "setFrame:");

    id v74 = objc_loadWeakRetained((id *)p_slider);
    objc_msgSend(v74, "maximumValueImageRectForBounds:", v6, v8, v10, v12);
    -[UIImageView setFrame:](self->_maxValueImageView, "setFrame:");
    BOOL v75 = v3;
    v76 = &OBJC_IVAR____UIEventSessionHoverAction__tapDragState;
  }

  v98 = [(UIView *)self viewWithTag:1986096245];
  if ([*(id *)((char *)&self->super.super.super.isa + v76[778]) showValue])
  {
    if (v98)
    {
      if (!v75)
      {
LABEL_60:
        v99 = NSString;
        v100 = [(_UISlideriOSVisualElement *)self slider];
        [v100 maximumValue];
        float v102 = v101;
        v103 = [(_UISlideriOSVisualElement *)self slider];
        [v103 minimumValue];
        if ((float)(v102 - v104) < 10.0) {
          v105 = @"%.2f";
        }
        else {
          v105 = @"%.1f";
        }
        v106 = [(_UISlideriOSVisualElement *)self slider];
        [v106 value];
        v108 = objc_msgSend(v99, "stringWithFormat:", v105, v107);
        [(UILabel *)v98 setText:v108];

        goto LABEL_66;
      }
    }
    else
    {
      v110 = [UILabel alloc];
      -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:", v6, v8, v10, v12);
      v98 = -[UILabel initWithFrame:](v110, "initWithFrame:");
      [(UIView *)v98 setTag:1986096245];
      v111 = [off_1E52D39B8 boldSystemFontOfSize:12.0];
      [(UILabel *)v98 setFont:v111];

      v112 = +[UIColor lightGrayColor];
      [(UILabel *)v98 setTextColor:v112];

      [(UIView *)v98 setBackgroundColor:0];
      [(UILabel *)v98 setLineBreakMode:2];
      [(UIView *)v98 setOpaque:0];
      [(UIView *)self addSubview:v98];
      if (!v75) {
        goto LABEL_60;
      }
    }
    -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:", v6, v8, v10, v12);
    -[UILabel setFrame:](v98, "setFrame:");
    goto LABEL_60;
  }
  if (v98)
  {
    [(UIView *)v98 removeFromSuperview];
LABEL_66:
  }
  v109 = [(_UISlideriOSVisualElement *)self slider];
  -[_UISlideriOSVisualElement _updateAppearanceForEnabled:](self, "_updateAppearanceForEnabled:", [v109 isEnabled]);
}

- (void)_updateAppearanceForEnabled:(BOOL)a3
{
  double v3 = 0.5;
  if (a3) {
    double v3 = 1.0;
  }
  [(UIView *)self setAlpha:v3];
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(_UISlideriOSVisualElement *)self slider];
  [v7 value];
  float v9 = v8;

  if (v9 != a3)
  {
    if (v4)
    {
      double v11 = [(_UISlideriOSVisualElement *)self slider];
      [v11 maximumValue];
      float v13 = v12;
      double v14 = [(_UISlideriOSVisualElement *)self slider];
      [v14 minimumValue];
      float v16 = v15;

      if (v16 >= a3) {
        a3 = v16;
      }

      if (v13 <= a3) {
        float v17 = v13;
      }
      else {
        float v17 = a3;
      }
      *(unsigned char *)&self->_sliderFlags |= 2u;
      [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:0];
      [(UIView *)self layoutBelowIfNeeded];
      [(UIView *)self bounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
      objc_msgSend(WeakRetained, "trackRectForBounds:", v19, v21, v23, v25);
      double v45 = v28;
      double v46 = v27;
      double v30 = v29;
      double v32 = v31;

      double v33 = [(UIView *)self->_thumbView layer];
      double v34 = [v33 presentationLayer];
      [v34 frame];
      double v36 = v35;

      id v37 = objc_loadWeakRetained((id *)&self->_slider);
      *(float *)&uint64_t v44 = v17;
      objc_msgSend(v37, "thumbRectForBounds:trackRect:value:", v19, v21, v23, v25, v46, v45, v30, v32, v44);
      double v39 = v38;

      float v40 = vabdd_f64(v36, v39) / v30;
      double v41 = v40 * 0.25;
      if (v41 >= 0.1) {
        double v42 = v41;
      }
      else {
        double v42 = 0.1;
      }
      [(_UISlideriOSVisualElement *)self _sliderAnimationWillStart];
      uint64_t v43 = 4 * (*(unsigned char *)&self->_sliderFlags & 1);
      v47[4] = self;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __47___UISlideriOSVisualElement_setValue_animated___block_invoke;
      v48[3] = &unk_1E52E7FF0;
      v48[4] = self;
      float v49 = v17;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __47___UISlideriOSVisualElement_setValue_animated___block_invoke_2;
      v47[3] = &unk_1E52DC3A0;
      +[UIView animateWithDuration:v43 delay:v48 options:v47 animations:v42 completion:0.0];
    }
    else
    {
      *(float *)&double v10 = a3;
      [(_UISlideriOSVisualElement *)self _setValue:0 andSendAction:v10];
    }
  }
}

- (void)_setValue:(float)a3 andSendAction:(BOOL)a4
{
  BOOL v4 = a4;
  float v8 = [(_UISlideriOSVisualElement *)self slider];
  [v8 minimumValue];
  float v10 = v9;

  double v11 = [(_UISlideriOSVisualElement *)self slider];
  [v11 maximumValue];
  float v13 = v12;

  if (v10 > v13)
  {
    double v22 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UISlideriOSVisualElement.m", 1480, @"Attempting to set a slider's minimumValue (%f) to be larger than the maximumValue (%f)", v10, v13);
  }
  if (v10 >= a3) {
    float v14 = v10;
  }
  else {
    float v14 = a3;
  }
  if (v13 <= v14) {
    float v15 = v13;
  }
  else {
    float v15 = v14;
  }
  float v16 = [(_UISlideriOSVisualElement *)self slider];
  [v16 value];
  float v18 = v17;

  if (v15 != v18)
  {
    *(float *)&double v19 = v15;
    if ([(UISliderDataModel *)self->_data setValue:v19]) {
      [(_UISlideriOSVisualElement *)self didSetValues];
    }
    if (*(unsigned char *)&self->_sliderFlags) {
      [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:0];
    }
    else {
      [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
    }
    double v20 = [(_UISlideriOSVisualElement *)self slider];
    int v21 = [v20 isTracking];

    if (v21) {
      [(_UISlideriOSVisualElement *)self _bounceMinMaxValueImageViewsIfNeeded];
    }
    if ([(UISliderDataModel *)self->_data showValue])
    {
      [(UIView *)self bounds];
      -[_UISlideriOSVisualElement valueTextRectForBounds:](self, "valueTextRectForBounds:");
      -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
    }
  }
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    [WeakRetained _sendActionsForEvents:4096 withEvent:0];
  }
}

- (void)_sliderAnimationWillStart
{
  *(unsigned char *)&self->_sliderFlags = *(unsigned char *)&self->_sliderFlags & 0xFC | 1;
}

- (void)_sliderAnimationDidStop:(BOOL)a3
{
  if (a3)
  {
    *(unsigned char *)&self->_sliderFlags &= 0xFCu;
    [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:0];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_UISlideriOSVisualElement;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (_UISlideriOSVisualElement *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self) {
    id WeakRetained = (_UISlideriOSVisualElement *)objc_loadWeakRetained((id *)&self->_slider);
  }
  else {
    id WeakRetained = v5;
  }
  float v8 = WeakRetained;

  return v8;
}

- (BOOL)cancelMouseTracking
{
  double v3 = [(_UISlideriOSVisualElement *)self slider];
  int v4 = [v3 isHighlighted];

  if (v4)
  {
    double v5 = [(_UISlideriOSVisualElement *)self slider];
    [v5 setHighlighted:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  [WeakRetained _sendActionsForEvents:256 withEvent:0];

  return 1;
}

- (BOOL)_shouldBeginTrackingAtPoint:(CGPoint)a3 pointInKnob:(CGPoint *)a4 inKnob:(BOOL *)a5
{
  uint64_t v8 = 5;
  if (!self->_thumbIsArtworkBased) {
    uint64_t v8 = 6;
  }
  uint64_t v9 = OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "convertPoint:fromView:", self, a3.x, a3.y);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [*(id *)((char *)&self->super.super.super.isa + v9) bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(_UISlideriOSVisualElement *)self thumbHitEdgeInsets];
  CGFloat v23 = v17 + v22;
  CGFloat v26 = v19 - (v24 + v25);
  v33.size.double height = v21 - (v22 + v27);
  v33.origin.double x = v15 + v24;
  v33.origin.double y = v23;
  v33.size.double width = v26;
  v32.double x = v11;
  v32.double y = v13;
  BOOL v28 = CGRectContainsPoint(v33, v32);
  if (a4)
  {
    a4->double x = v11;
    a4->double y = v13;
  }
  if (a5) {
    *a5 = v28;
  }
  if (v28) {
    return 1;
  }
  data = self->_data;
  return [(UISliderDataModel *)data isTrackEnabled];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  p_beginPoint = &self->_beginPoint;
  id v6 = a3;
  [v6 locationInView:self];
  p_beginPoint->double x = v7;
  p_beginPoint->double y = v8;
  v34[0] = 0.0;
  v34[1] = 0.0;
  char v33 = 0;
  BOOL v9 = -[_UISlideriOSVisualElement _shouldBeginTrackingAtPoint:pointInKnob:inKnob:](self, "_shouldBeginTrackingAtPoint:pointInKnob:inKnob:", v34, &v33);
  int v10 = [v6 _isPointerTouch];

  if (v33)
  {
    if (self->_thumbIsArtworkBased) {
      uint64_t v11 = 432;
    }
    else {
      uint64_t v11 = 504;
    }
    [*(id *)((char *)&self->super.super.super.isa + v11) frame];
    self->_hitOffset = round(v19 * 0.5 - v34[0]);
    double v20 = [(_UISlideriOSVisualElement *)self slider];
    [v20 minimumValue];
    float v22 = v21;
    CGFloat v23 = [(_UISlideriOSVisualElement *)self slider];
    [v23 maximumValue];
    float v25 = ValueForPoint(self, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1, p_beginPoint->x, p_beginPoint->y, p_beginPoint->x, p_beginPoint->y, v22, v24);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    *(float *)&double v27 = v25;
    [WeakRetained setValue:0 animated:v27];

    BOOL v28 = [(_UISlideriOSVisualElement *)self slider];
    double v29 = [v28 _edgeFeedbackGenerator];
    [v29 userInteractionStarted];

    double v30 = [(_UISlideriOSVisualElement *)self slider];
    double v31 = [v30 _modulationFeedbackGenerator];
    [v31 activateWithCompletionBlock:0];

    return 1;
  }
  else if (([(UISliderDataModel *)self->_data isTrackEnabled] | v10) == 1)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_slider);
    CGFloat v13 = [(_UISlideriOSVisualElement *)self slider];
    [v13 minimumValue];
    float v15 = v14;
    double v16 = [(_UISlideriOSVisualElement *)self slider];
    [v16 maximumValue];
    *(float *)&double v18 = ValueForPoint(self, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1, p_beginPoint->x, p_beginPoint->y, p_beginPoint->x, p_beginPoint->y, v15, v17);
    BOOL v9 = 1;
    [v12 setValue:1 animated:v18];

    self->_hitOffset = 0.0;
  }
  return v9;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  [a3 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(_UISlideriOSVisualElement *)self slider];
  [v11 maximumValue];
  float v13 = v12;

  float v14 = [(_UISlideriOSVisualElement *)self slider];
  [v14 minimumValue];
  float v16 = v15;

  float v17 = ValueForPoint(self, (*((_DWORD *)&self->super._viewFlags + 4) >> 19) & 1, self->_beginPoint.x, self->_beginPoint.y, v8, v10, v16, v13);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  *(float *)&double v19 = v17;
  [WeakRetained setValue:0 animated:v19];

  if (v13 > v16)
  {
    double v20 = (float)((float)(v17 - v16) / (float)(v13 - v16));
    float v21 = [(_UISlideriOSVisualElement *)self slider];
    float v22 = [v21 _edgeFeedbackGenerator];
    [v22 distance];
    double v24 = v23 * v20;

    float v25 = [(_UISlideriOSVisualElement *)self slider];
    CGFloat v26 = [v25 _edgeFeedbackGenerator];
    objc_msgSend(v26, "positionUpdated:atLocation:", v24, v8, v10);

    double v27 = [(_UISlideriOSVisualElement *)self slider];
    BOOL v28 = [v27 _modulationFeedbackGenerator];
    [v28 valueUpdated:v20];
  }
  double v29 = [(_UISlideriOSVisualElement *)self slider];
  int v30 = [v29 isContinuous];

  if (v30)
  {
    id v31 = objc_loadWeakRetained((id *)&self->_slider);
    [v31 _sendActionsForEvents:4096 withEvent:v6];
  }
  CGPoint v32 = [(_UISlideriOSVisualElement *)self slider];
  [v32 setHighlighted:1];

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v13 = a4;
  id v6 = [(_UISlideriOSVisualElement *)self slider];
  [v6 setTracking:0];

  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    [WeakRetained _sendActionsForEvents:4096 withEvent:v13];
  }
  double v8 = [(_UISlideriOSVisualElement *)self slider];
  [v8 setHighlighted:0];

  double v9 = [(_UISlideriOSVisualElement *)self slider];
  double v10 = [v9 _edgeFeedbackGenerator];
  [v10 userInteractionEnded];

  uint64_t v11 = [(_UISlideriOSVisualElement *)self slider];
  float v12 = [v11 _modulationFeedbackGenerator];
  [v12 deactivate];
}

- (void)_controlTouchBegan:(id)a3 withEvent:(id)a4
{
  id v8 = a4;
  id WeakRetained = [(_UISlideriOSVisualElement *)self slider];
  if ([WeakRetained isTracking])
  {
    id v6 = [(_UISlideriOSVisualElement *)self slider];
    int v7 = [v6 isContinuous];

    if (!v7) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
    [WeakRetained _sendActionsForEvents:4096 withEvent:v8];
  }

LABEL_5:
}

- (BOOL)cancelTouchTracking
{
  double v3 = [(_UISlideriOSVisualElement *)self slider];
  int v4 = [v3 isTracking];

  if (v4) {
    [(_UISlideriOSVisualElement *)self endTrackingWithTouch:0 withEvent:0];
  }
  double v5 = [(_UISlideriOSVisualElement *)self slider];
  int v6 = [v5 isHighlighted];

  if (v6)
  {
    int v7 = [(_UISlideriOSVisualElement *)self slider];
    [v7 setHighlighted:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  [WeakRetained _sendActionsForEvents:256 withEvent:0];

  return 1;
}

- (BOOL)isAnimatingValueChange
{
  return *(unsigned char *)&self->_sliderFlags & 1;
}

- (void)showValueDidChange
{
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (CGRect)valueTextRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UISliderDataModel *)self->_data showValue])
  {
    double v6 = x + width + -23.0;
    +[_UISlideriOSVisualElement drawingMetricsForPlatform];
    double v7 = y + floor((v11 + -15.0) * 0.5);
    double v8 = 23.0;
    double v9 = 15.0;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v10 = v6;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v10;
  return result;
}

- (id)createThumbView
{
  if (self->_thumbIsArtworkBased)
  {
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = objc_loadWeakRetained((id *)&self->_slider);
    objc_msgSend(v11, "trackRectForBounds:", v4, v6, v8, v10);
    LODWORD(v28) = 0;
    objc_msgSend(v11, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v13, v14, v15, v28);
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    double v24 = -[UIImageView initWithFrame:]([UISliderImageView alloc], "initWithFrame:", v17, v19, v21, v23);
    [(UIView *)v24 setUserInteractionEnabled:0];
    [(UIView *)v24 setOpaque:0];
    if (v21 + -44.0 <= 0.0) {
      double v25 = (v21 + -44.0) * 0.5;
    }
    else {
      double v25 = 0.0;
    }
    if (v23 + -44.0 <= 0.0) {
      double v26 = (v23 + -44.0) * 0.5;
    }
    else {
      double v26 = 0.0;
    }
    -[UIView _setTouchInsets:](v24, "_setTouchInsets:", v26, v25, v26, v25);
  }
  else
  {
    double v24 = [(_UISlideriOSVisualElement *)self createThumbViewNeue];
  }
  return v24;
}

- (void)didSetThumbImageForStates
{
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)didSetMinimumTrackImageForStates
{
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)didSetMaximumTrackImageForStates
{
  [(_UISlideriOSVisualElement *)self _setSliderNeedsLayout];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)didSetThumbEnabled
{
  double v3 = [(_UISlideriOSVisualElement *)self slider];
  int v4 = [v3 _isThumbEnabled];

  if (v4)
  {
    double v5 = [(_UISlideriOSVisualElement *)self slider];
    p_thumbView = (id *)&self->_thumbView;
    -[UIImageView setHidden:](self->_thumbView, "setHidden:", [v5 isEnabled] ^ 1);
  }
  else
  {
    p_thumbView = (id *)&self->_thumbView;
    [(UIImageView *)self->_thumbView setHidden:1];
  }
  [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:0];
  if (v4 != [(UISliderDataModel *)self->_data isMinimumTrackVisible])
  {
    id v7 = *p_thumbView;
    int v8 = [*p_thumbView isHidden];
    double v9 = 1.0;
    if (v8) {
      double v9 = 0.0;
    }
    [v7 setAlpha:v9];
  }
}

- (void)didChangeMinimumTrackVisibleWithDuration:(double)a3
{
  [(_UISlideriOSVisualElement *)self _layoutSubviewsForBoundsChange:0];
  BOOL v5 = [(UISliderDataModel *)self->_data isMinimumTrackVisible];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke;
  v8[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  *(double *)&v8[4] = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke_2;
  v6[3] = &unk_1E52D9FC0;
  v6[4] = self;
  BOOL v7 = v5;
  +[UIView conditionallyAnimate:a3 > 0.0 withAnimation:v8 layout:v6 completion:0];
}

- (void)didUpdateConfiguration
{
  double v3 = [(_UISlideriOSVisualElement *)self slider];
  uint64_t v7 = [v3 _sliderConfiguration];

  int v4 = (void *)v7;
  if (v7 && (v5 = objc_opt_respondsToSelector(), int v4 = (void *)v7, (v5 & 1) != 0)) {
    char v6 = *(unsigned char *)&self->_sliderFlags | 8;
  }
  else {
    char v6 = *(unsigned char *)&self->_sliderFlags & 0xF7;
  }
  *(unsigned char *)&self->_sliderFlags = v6;
}

- (UIEdgeInsets)thumbHitEdgeInsets
{
  uint64_t v2 = 5;
  if (!self->_thumbIsArtworkBased) {
    uint64_t v2 = 6;
  }
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____UISlideriOSVisualElement__sliderFlags[v2]) bounds];
  double v4 = -fmax((48.0 - v3) * 0.5, 0.0);
  double v6 = -fmax((48.0 - v5) * 0.5, 0.0);
  double v7 = v6;
  double v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v4;
  result.top = v6;
  return result;
}

- (id)minTrackView
{
  return self->_minTrackView;
}

- (id)maxTrackView
{
  return self->_maxTrackView;
}

- (id)_minTrackClipView
{
  return self->_minTrackClipView;
}

- (id)_maxTrackClipView
{
  return self->_maxTrackClipView;
}

- (void)didSetEnabled
{
  double v3 = [(_UISlideriOSVisualElement *)self slider];
  -[UIView setEnabled:](self, "setEnabled:", [v3 isEnabled]);

  id v4 = [(_UISlideriOSVisualElement *)self slider];
  -[_UISlideriOSVisualElement _updateAppearanceForEnabled:](self, "_updateAppearanceForEnabled:", [v4 isEnabled]);
}

- (id)maxValueImageView
{
  return self->_maxValueImageView;
}

- (id)minValueImageView
{
  return self->_minValueImageView;
}

- (id)thumbView
{
  return self->_thumbView;
}

- (id)thumbViewNeue
{
  return self->_thumbViewNeue;
}

- (UISliderDataModel)data
{
  return self->_data;
}

- (UISlider)slider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_slider);
  return (UISlider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_slider);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_trackColors, 0);
  objc_storeStrong((id *)&self->_thumbViewNeue, 0);
  objc_storeStrong((id *)&self->_maxTrackClipView, 0);
  objc_storeStrong((id *)&self->_minTrackClipView, 0);
  objc_storeStrong((id *)&self->_maxTrackView, 0);
  objc_storeStrong((id *)&self->_minTrackView, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_maxValueImageView, 0);
  objc_storeStrong((id *)&self->_minValueImageView, 0);
  objc_storeStrong((id *)&self->_innerThumbView, 0);
}

@end