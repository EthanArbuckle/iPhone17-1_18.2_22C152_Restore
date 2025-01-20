@interface PKGlyphView
+ (BOOL)automaticallyNotifiesObserversOfState;
+ (id)sharedStaticResources;
+ (void)invokeSuccessFeedback;
- (BOOL)fadeOnRecognized;
- (BOOL)showQRCode;
- (CATransform3D)_phoneTransformDeltaWhileShownFromRotationPercentage:(SEL)a3 toPercentage:(double)a4;
- (CGImage)customImage;
- (CGPoint)_phonePositionDeltaWhileShownFromRotationPercentage:(double)a3 toPercentage:(double)a4;
- (CGPoint)_phonePositionWhileShownWithRotationPercentage:(double)a3;
- (PKGlyphView)initWithCoder:(id)a3;
- (PKGlyphView)initWithFrame:(CGRect)a3;
- (PKGlyphView)initWithStyle:(int64_t)a3;
- (PKGlyphViewDelegate)delegate;
- (UIColor)primaryColor;
- (UIEdgeInsets)customImageAlignmentEdgeInsets;
- (id)_primaryColorForStyle:(int64_t)a3 mode:(int64_t)a4;
- (id)_secondaryColorForStyle:(int64_t)a3 mode:(int64_t)a4;
- (id)createCustomImageLayer;
- (int64_t)colorMode;
- (int64_t)state;
- (unsigned)userIntentEdge;
- (void)_applyColorMode:(BOOL)a3;
- (void)_applyEffectiveHighlightColorsToLayersAnimated:(BOOL)a3;
- (void)_applyEffectivePrimaryColorToLayersAnimated:(BOOL)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_endPhoneWiggle;
- (void)_executeAfterMinimumAnimationDurationForStateTransition:(id)a3;
- (void)_executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio:(double)a3 handler:(id)a4;
- (void)_executeTransitionCompletionHandlers:(BOOL)a3;
- (void)_finishTransitionForIndex:(unint64_t)a3 cancelled:(BOOL)a4;
- (void)_layoutContentLayer:(id)a3;
- (void)_performTransitionWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setPrimaryColor:(id)a3 animated:(BOOL)a4;
- (void)_setRecognizedIfNecessaryWithTransitionIndex:(unint64_t)a3 completion:(id)a4;
- (void)_setSecondaryColor:(id)a3 animated:(BOOL)a4;
- (void)_startPhoneWiggle;
- (void)_updateCheckViewStateAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_updateCustomImageLayerOpacityAnimated:(BOOL)a3;
- (void)_updateLastAnimationTimeWithAnimationOfDuration:(double)a3;
- (void)_updatePhoneLayoutWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updatePhoneWiggleIfNecessary;
- (void)_updateUserIntentLayerRotation;
- (void)_updateUserIntentLayoutAnimated:(BOOL)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)fingerprintGlyphView:(id)a3 didLayoutContentLayer:(id)a4;
- (void)layoutSubviews;
- (void)pearlGlyphView:(id)a3 didLayoutContentLayer:(id)a4;
- (void)setColorMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setCustomImage:(CGImage *)a3 withAlignmentEdgeInsets:(UIEdgeInsets)a4;
- (void)setDelegate:(id)a3;
- (void)setFadeOnRecognized:(BOOL)a3;
- (void)setShowQRCode:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)tintColorDidChange;
- (void)updateRasterizationScale:(double)a3;
- (void)updateRotation;
@end

@implementation PKGlyphView

+ (BOOL)automaticallyNotifiesObserversOfState
{
  return 0;
}

+ (id)sharedStaticResources
{
  if (PKPearlIsAvailable())
  {
    v2 = [MEMORY[0x263F52580] sharedStaticResources];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (void)invokeSuccessFeedback
{
  if (PKPearlIsAvailable())
  {
    v2 = (void *)MEMORY[0x263F52580];
    [v2 invokeSuccessFeedback];
  }
}

- (PKGlyphView)initWithCoder:(id)a3
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This class is not NSCoding compliant"];

  return [(PKGlyphView *)self init];
}

- (PKGlyphView)initWithFrame:(CGRect)a3
{
  return -[PKGlyphView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKGlyphView)initWithStyle:(int64_t)a3
{
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  v108.receiver = self;
  v108.super_class = (Class)PKGlyphView;
  v6 = -[PKGlyphView initWithFrame:](&v108, sel_initWithFrame_, v4, v5, 63.0, 63.0);
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_unint64_t style = a3;
  v6->_userIntentEdge = 1;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  transitionCompletionHandlers = v7->_transitionCompletionHandlers;
  v7->_transitionCompletionHandlers = v8;

  dispatch_group_t v10 = dispatch_group_create();
  lastAnimationGroup = v7->_lastAnimationGroup;
  v7->_lastAnimationGroup = (OS_dispatch_group *)v10;

  [(PKGlyphView *)v7 setAutoresizesSubviews:0];
  if (PKPearlIsAvailable())
  {
    if (PKSystemApertureIsAvailable()) {
      v12 = (void *)[MEMORY[0x263F52578] createSystemApertureConfiguration];
    }
    else {
      v12 = (void *)[MEMORY[0x263F52578] createDefaultConfiguration];
    }
    v17 = v12;
    unint64_t style = v7->_style;
    double v16 = 1.0;
    if (style - 3 < 4)
    {
      uint64_t v19 = 3;
    }
    else
    {
      if (style >= 3)
      {
        if (style == 7)
        {
          [v12 setInitialStyle:7];
          [v17 setLineThicknessScale:1.4285712];
          [v17 setCheckmarkThicknessScale:2.16];
          double v16 = 1.71;
        }
        goto LABEL_12;
      }
      uint64_t v19 = 0;
    }
    [v12 setInitialStyle:v19];
LABEL_12:
    [v17 lineThicknessScale];
    double v21 = v20;
    [v17 checkmarkThicknessScale];
    double v15 = v21 * v22;
    uint64_t v23 = [objc_alloc(MEMORY[0x263F52580]) initWithConfiguration:v17];
    pearlView = v7->_pearlView;
    v7->_pearlView = (LAUIPearlGlyphView *)v23;

    [(LAUIPearlGlyphView *)v7->_pearlView setDelegate:v7];
    [(PKGlyphView *)v7 addSubview:v7->_pearlView];

    goto LABEL_13;
  }
  v13 = objc_alloc_init(PKFingerprintGlyphView);
  fingerprintView = v7->_fingerprintView;
  v7->_fingerprintView = v13;

  [(PKFingerprintGlyphView *)v7->_fingerprintView setDelegate:v7];
  [(PKGlyphView *)v7 addSubview:v7->_fingerprintView];
  double v15 = 1.0;
  double v16 = 1.0;
LABEL_13:
  v25 = [(LAUIPearlGlyphView *)v7->_pearlView contentLayer];
  v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [(PKFingerprintGlyphView *)v7->_fingerprintView contentLayer];
  }
  v28 = v27;

  long long v29 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v103[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v103[3] = v29;
  v103[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  uint64_t v30 = *(void *)(MEMORY[0x263F15740] + 80);
  long long v31 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v103[0] = *MEMORY[0x263F15740];
  v103[1] = v31;
  uint64_t v104 = v30;
  unint64_t v105 = 0xBF4F4DA659A413CFLL;
  long long v32 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v106 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v107 = v32;
  [v28 setSublayerTransform:v103];
  v33 = objc_alloc_init(PKPhoneGlyphLayer);
  phoneLayer = v7->_phoneLayer;
  v7->_phoneLayer = v33;

  -[PKPhoneGlyphLayer setAnchorPoint:](v7->_phoneLayer, "setAnchorPoint:", 0.5, 1.0);
  [(PKPhoneGlyphLayer *)v7->_phoneLayer setAllowsEdgeAntialiasing:1];
  [(PKPhoneGlyphLayer *)v7->_phoneLayer setShouldRasterize:1];
  [v28 addSublayer:v7->_phoneLayer];
  v35 = [(PKMicaLayer *)v7->_phoneLayer rootLayer];
  [v35 bounds];
  double v37 = v36;
  double v39 = v38;

  v7->_phoneAspectRatio = v37 / v39;
  if (PKUserIntentIsAvailable())
  {
    v40 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    userIntentLayer = v7->_userIntentLayer;
    v7->_userIntentLayer = v40;

    [v28 addSublayer:v7->_userIntentLayer];
    int v42 = PKIsPad();
    v7->_isPad = v42;
    if (v42)
    {
      v43 = PKPassKitUIFoundationBundle();
      v44 = [v43 URLForResource:@"Payment_glyph_intent_pad" withExtension:@"caar"];
      double v45 = 0.5;
      double v46 = 0.977777778;
    }
    else
    {
      int IsWithinScreen = PKFrontFaceCameraIsWithinScreen();
      v48 = PKPassKitUIFoundationBundle();
      v43 = v48;
      if (IsWithinScreen) {
        v49 = @"Payment_glyph_intent_phone-D73";
      }
      else {
        v49 = @"Payment_glyph_intent_phone";
      }
      v44 = [v48 URLForResource:v49 withExtension:@"caar"];
      double v46 = 0.00561797753;
      double v45 = 0.494444444;
    }

    uint64_t v50 = *MEMORY[0x263F15EE0];
    v51 = [MEMORY[0x263F15838] packageWithContentsOfURL:v44 type:*MEMORY[0x263F15EE0] options:0 error:0];
    id v52 = objc_alloc(MEMORY[0x263F5BF20]);
    double v53 = *MEMORY[0x263F001A0];
    double v54 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v55 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v56 = *(double *)(MEMORY[0x263F001A0] + 24);
    uint64_t v57 = objc_msgSend(v52, "initWithFrame:package:", v51, *MEMORY[0x263F001A0], v54, v55, v56);
    userIntentDeviceLayer = v7->_userIntentDeviceLayer;
    v7->_userIntentDeviceLayer = (PKMicaLayer *)v57;

    -[PKMicaLayer setAnchorPoint:](v7->_userIntentDeviceLayer, "setAnchorPoint:", v45, v46);
    v59 = PKPassKitUIFoundationBundle();
    v60 = [v59 URLForResource:@"Payment_glyph_intent_arrow" withExtension:@"caar"];

    v61 = [MEMORY[0x263F15838] packageWithContentsOfURL:v60 type:v50 options:0 error:0];

    uint64_t v62 = objc_msgSend(objc_alloc(MEMORY[0x263F5BF20]), "initWithFrame:package:", v61, v53, v54, v55, v56);
    userIntentArrowLayer = v7->_userIntentArrowLayer;
    v7->_userIntentArrowLayer = (PKMicaLayer *)v62;

    -[PKMicaLayer setAnchorPoint:](v7->_userIntentArrowLayer, "setAnchorPoint:", 0.0, 0.484375);
    if (v7->_isPad)
    {
      v64 = v7->_userIntentArrowLayer;
      CATransform3DMakeRotation(&v102, 1.57079633, 0.0, 0.0, 1.0);
      [(PKMicaLayer *)v64 setTransform:&v102];
    }
    [(CALayer *)v7->_userIntentLayer addSublayer:v7->_userIntentDeviceLayer];
    [(CALayer *)v7->_userIntentLayer addSublayer:v7->_userIntentArrowLayer];
  }
  v7->_checkScale = v16;
  v65 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x263F52570]);
  checkLayer = v7->_checkLayer;
  v7->_checkLayer = v65;

  [(LAUICheckmarkLayer *)v7->_checkLayer setLineWidthScale:v15 / v7->_checkScale];
  [(LAUICheckmarkLayer *)v7->_checkLayer setRevealed:0 animated:0];
  uint64_t v67 = [(PKGlyphView *)v7 createCustomImageLayer];
  customImageLayer = v7->_customImageLayer;
  v7->_customImageLayer = (CALayer *)v67;

  [v28 addSublayer:v7->_customImageLayer];
  [v28 addSublayer:v7->_checkLayer];
  v69 = [(PKGlyphView *)v7 layer];
  v70 = v69;
  if (a3 == 3)
  {
    [v69 setAllowsGroupOpacity:0];
    [v70 setAllowsGroupBlending:0];
    v71 = [(LAUIPearlGlyphView *)v7->_pearlView layer];
    v72 = v71;
    if (v71)
    {
      id v73 = v71;
    }
    else
    {
      id v73 = [(PKFingerprintGlyphView *)v7->_fingerprintView layer];
    }
    v74 = v73;

    [v74 setAllowsGroupOpacity:0];
    v75 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B28]];
    [v74 setCompositingFilter:v75];
  }
  v76 = [MEMORY[0x263F1C550] colorWithRed:0.8745098 green:0.9372549 blue:0.9960784 alpha:1.0];
  v77 = v76;
  v78 = (void *)MEMORY[0x263F1C550];
  if (a3 == 3)
  {
    uint64_t v79 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
    primaryHighlightColor = v7->_primaryHighlightColor;
    v7->_primaryHighlightColor = (UIColor *)v79;
  }
  else
  {
    v100[0] = MEMORY[0x263EF8330];
    v100[1] = 3221225472;
    v100[2] = __29__PKGlyphView_initWithStyle___block_invoke;
    v100[3] = &unk_2644F9740;
    v101 = v76;
    uint64_t v81 = [v78 colorWithDynamicProvider:v100];
    v82 = v7->_primaryHighlightColor;
    v7->_primaryHighlightColor = (UIColor *)v81;

    primaryHighlightColor = v101;
  }

  v83 = [MEMORY[0x263F1C550] colorWithRed:0.6784314 green:0.827451 blue:1.0 alpha:1.0];
  v84 = (void *)MEMORY[0x263F1C550];
  v98[0] = MEMORY[0x263EF8330];
  v98[1] = 3221225472;
  v98[2] = __29__PKGlyphView_initWithStyle___block_invoke_2;
  v98[3] = &unk_2644F9740;
  id v85 = v83;
  id v99 = v85;
  uint64_t v86 = [v84 colorWithDynamicProvider:v98];
  intentPrimaryHighlightColor = v7->_intentPrimaryHighlightColor;
  v7->_intentPrimaryHighlightColor = (UIColor *)v86;

  v88 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v89 = v88;
  v90 = (void *)MEMORY[0x263F1C550];
  if (a3 == 3)
  {
    uint64_t v91 = [MEMORY[0x263F1C550] colorWithWhite:0.5723 alpha:1.0];
    secondaryHighlightColor = v7->_secondaryHighlightColor;
    v7->_secondaryHighlightColor = (UIColor *)v91;
  }
  else
  {
    v96[0] = MEMORY[0x263EF8330];
    v96[1] = 3221225472;
    v96[2] = __29__PKGlyphView_initWithStyle___block_invoke_3;
    v96[3] = &unk_2644F9740;
    v97 = v88;
    uint64_t v93 = [v90 colorWithDynamicProvider:v96];
    v94 = v7->_secondaryHighlightColor;
    v7->_secondaryHighlightColor = (UIColor *)v93;

    secondaryHighlightColor = v97;
  }

  v7->_colorMode = 0;
  [(PKGlyphView *)v7 _applyColorMode:0];
  [(PKGlyphView *)v7 _applyEffectiveHighlightColorsToLayersAnimated:0];
  [v70 contentsScale];
  -[PKGlyphView updateRasterizationScale:](v7, "updateRasterizationScale:");
  [(PKGlyphView *)v7 setNeedsLayout];
  [(PKGlyphView *)v7 _updateUserIntentLayerRotation];
  [(PKGlyphView *)v7 updateRotation];
  [(PKGlyphView *)v7 setAccessibilityIdentifier:@"glyph"];

  return v7;
}

id __29__PKGlyphView_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 userInterfaceStyle];
  if (v3 >= 2)
  {
    if (v3 != 2)
    {
LABEL_6:
      double v5 = 0;
      id v4 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    id v4 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.1607843 blue:0.3137255 alpha:1.0];
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
  }
  double v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_7:
  id v6 = v4;

  return v6;
}

id __29__PKGlyphView_initWithStyle___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 userInterfaceStyle];
  if (v3 >= 2)
  {
    if (v3 != 2)
    {
LABEL_6:
      double v5 = 0;
      id v4 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    id v4 = [MEMORY[0x263F1C550] colorWithRed:0.0313725 green:0.4156863 blue:0.8 alpha:1.0];
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
  }
  double v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_7:
  id v6 = v4;

  return v6;
}

id __29__PKGlyphView_initWithStyle___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 userInterfaceStyle];
  if (v3 >= 2)
  {
    if (v3 != 2)
    {
LABEL_6:
      double v5 = 0;
      id v4 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    id v4 = [MEMORY[0x263F1C550] colorWithRed:0.01960784 green:0.2627451 blue:0.509804 alpha:1.0];
  }
  else
  {
    id v4 = *(id *)(a1 + 32);
  }
  double v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_7:
  id v6 = v4;

  return v6;
}

- (void)dealloc
{
  if (self->_transitioning) {
    [(PKGlyphView *)self _executeTransitionCompletionHandlers:1];
  }
  customImage = self->_customImage;
  if (customImage) {
    CFRelease(customImage);
  }
  [(LAUIPearlGlyphView *)self->_pearlView setDelegate:0];
  [(PKFingerprintGlyphView *)self->_fingerprintView setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)PKGlyphView;
  [(PKGlyphView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PKGlyphView;
  [(PKGlyphView *)&v3 didMoveToWindow];
  [(PKGlyphView *)self updateRotation];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKGlyphView;
  [(PKGlyphView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKGlyphView *)self _applyEffectiveHighlightColorsToLayersAnimated:1];
  [(PKGlyphView *)self _applyEffectivePrimaryColorToLayersAnimated:1];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKGlyphView;
  [(PKGlyphView *)&v13 layoutSubviews];
  [(PKGlyphView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  fingerprintView = self->_fingerprintView;
  if (fingerprintView)
  {
    [(PKFingerprintGlyphView *)fingerprintView bounds];
    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.width = v8;
    v16.size.height = v10;
    if (!CGRectEqualToRect(v14, v16))
    {
      -[PKFingerprintGlyphView setFrame:](self->_fingerprintView, "setFrame:", v4, v6, v8, v10);
      [(PKFingerprintGlyphView *)self->_fingerprintView setNeedsLayout];
    }
  }
  pearlView = self->_pearlView;
  if (pearlView)
  {
    [(LAUIPearlGlyphView *)pearlView bounds];
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    if (!CGRectEqualToRect(v15, v17))
    {
      -[LAUIPearlGlyphView setFrame:](self->_pearlView, "setFrame:", v4, v6, v8, v10);
      [(LAUIPearlGlyphView *)self->_pearlView setNeedsLayout];
    }
  }
}

- (void)_layoutContentLayer:(id)a3
{
  id v4 = a3;
  double v5 = [(PKGlyphView *)self layer];
  [v5 contentsScale];
  double v7 = v6;

  [v4 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  userIntentLayer = self->_userIntentLayer;
  CGRect v17 = (double *)MEMORY[0x263F00148];
  if (userIntentLayer)
  {
    [(CALayer *)userIntentLayer anchorPoint];
    double v19 = v18;
    double v21 = v20;
    -[CALayer setBounds:](self->_userIntentLayer, "setBounds:", *v17, v17[1], v13, v15);
    -[CALayer setPosition:](self->_userIntentLayer, "setPosition:", v9 + v19 * v13, v11 + v21 * v15);
    [(PKGlyphView *)self _updateUserIntentLayoutAnimated:0];
  }
  double v47 = v13;
  [(PKGlyphView *)self _updatePhoneLayoutWithTransitionIndex:self->_transitionIndex animated:0];
  [(CALayer *)self->_customImageLayer contentsScale];
  double v23 = v22;
  double top = self->_customImageAlignmentEdgeInsets.top;
  double left = self->_customImageAlignmentEdgeInsets.left;
  double bottom = self->_customImageAlignmentEdgeInsets.bottom;
  double right = self->_customImageAlignmentEdgeInsets.right;
  customImage = self->_customImage;
  if (customImage && (CGImageGetWidth(customImage), (long long v29 = self->_customImage) != 0))
  {
    CGImageGetHeight(v29);
    double v30 = bottom / v23;
    double v31 = left / v23;
    double v32 = top / v23;
    double v46 = right / v23;
    if (self->_customImage)
    {
      double v33 = left / v23;
      goto LABEL_9;
    }
  }
  else
  {
    double v46 = right / v23;
    double v30 = bottom / v23;
    double v31 = left / v23;
    double v32 = top / v23;
  }
  double v33 = v31;
LABEL_9:
  PKSizeAlignedInRectWithScale();
  double v34 = v7;
  double v36 = v35 - v33;
  double v38 = v37 - v32;
  double v40 = v46 + v33 + v39;
  double v42 = v30 + v32 + v41;
  [(CALayer *)self->_customImageLayer anchorPoint];
  -[CALayer setPosition:](self->_customImageLayer, "setPosition:", v36 + v43 * v40, v38 + v44 * v42);
  -[CALayer setBounds:](self->_customImageLayer, "setBounds:", *v17, v17[1], v40, v42);
  [(LAUICheckmarkLayer *)self->_checkLayer defaultSizeForCircleWithDiameter:v47 * self->_checkScale scale:v34];
  checkLayer = self->_checkLayer;
  PKSizeAlignedInRectWithScale();

  -[LAUICheckmarkLayer setFrame:](checkLayer, "setFrame:");
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKGlyphView;
  [(PKGlyphView *)&v3 tintColorDidChange];
  [(PKGlyphView *)self _applyColorMode:1];
}

- (void)updateRotation
{
  if (self->_userIntentLayer && self->_isPad)
  {
    objc_super v3 = [(PKGlyphView *)self window];
    id v34 = v3;
    if (v3) {
      [v3 screen];
    }
    else {
    id v4 = [MEMORY[0x263F1C920] mainScreen];
    }
    double v5 = [v4 fixedCoordinateSpace];
    double v6 = [v4 coordinateSpace];
    [v5 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [v6 bounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    LAUIPhysicalButtonNormalizedFrame();
    objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v5, v8 + v23 * v12, v10 + v24 * v14, v12 * v25, v14 * v26);
    if (v29 <= 0.0)
    {
      double v32 = v28;
      v37.origin.x = v16;
      v37.origin.y = v18;
      v37.size.width = v20;
      v37.size.height = v22;
      if (v32 < CGRectGetMidY(v37)) {
        unsigned int v31 = 1;
      }
      else {
        unsigned int v31 = 3;
      }
    }
    else
    {
      double v30 = v27;
      v36.origin.x = v16;
      v36.origin.y = v18;
      v36.size.width = v20;
      v36.size.height = v22;
      unsigned int v31 = 2 * (v30 >= CGRectGetMidX(v36));
    }
    if (self->_userIntentEdge != v31)
    {
      self->_userIntentEdge = v31;
      [(PKGlyphView *)self _updateUserIntentLayerRotation];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained glyphViewUserIntentEdgeDidChange:self];
      }
    }
  }
}

- (void)updateRasterizationScale:(double)a3
{
  double v5 = [(PKGlyphView *)self layer];
  [v5 setContentsScale:a3];

  phoneLayer = self->_phoneLayer;

  [(PKPhoneGlyphLayer *)phoneLayer setRasterizationScale:a3];
}

- (void)_updateLastAnimationTimeWithAnimationOfDuration:(double)a3
{
  self->_lastAnimationWillFinish = fmax(CFAbsoluteTimeGetCurrent() + a3, self->_lastAnimationWillFinish);
}

- (void)_executeAfterMinimumAnimationDurationForStateTransition:(id)a3
{
}

- (void)_executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio:(double)a3 handler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v8 = self->_lastAnimationWillFinish - Current;
    lastAnimationGroup = self->_lastAnimationGroup;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__PKGlyphView__executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio_handler___block_invoke;
    block[3] = &unk_2644F9768;
    double v12 = fmax(a3, 0.0) * fmax(v8, 0.0);
    CFAbsoluteTime v13 = Current;
    id v11 = v6;
    dispatch_group_notify(lastAnimationGroup, MEMORY[0x263EF83A0], block);
  }
}

void __93__PKGlyphView__executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio_handler___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40) - (CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
  if (v2 <= 0.0)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
  else
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
    id v4 = *(void **)(a1 + 32);
    double v5 = MEMORY[0x263EF83A0];
    dispatch_after(v3, v5, v4);
  }
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (self->_state == a3)
  {
    if (!v8) {
      goto LABEL_15;
    }
    id v15 = v8;
    if (self->_transitioning)
    {
      transitionCompletionHandlers = self->_transitionCompletionHandlers;
      double v10 = (void *)[v8 copy];
      [(NSMutableArray *)transitionCompletionHandlers addObject:v10];
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
  else
  {
    id v15 = v8;
    if (self->_transitioning)
    {
      self->_transitioning = 0;
      [(PKGlyphView *)self _executeTransitionCompletionHandlers:1];
      uint64_t v11 = self->_transitioningAnimated || v5;
      [(PKGlyphView *)self setState:a3 animated:v11 completionHandler:v15];
    }
    else
    {
      unint64_t v12 = self->_transitionIndex + 1;
      self->_transitionIndex = v12;
      self->_transitioning = 1;
      self->_transitioningAnimated = v5;
      self->_priorState = self->_state;
      if (v8)
      {
        CFAbsoluteTime v13 = self->_transitionCompletionHandlers;
        double v14 = (void *)[v8 copy];
        [(NSMutableArray *)v13 addObject:v14];
      }
      [(PKGlyphView *)self willChangeValueForKey:@"state"];
      self->_state = a3;
      [(PKGlyphView *)self didChangeValueForKey:@"state"];
      [(PKGlyphView *)self _performTransitionWithTransitionIndex:v12 animated:v5];
    }
  }
  id v8 = v15;
LABEL_15:
}

- (void)_executeTransitionCompletionHandlers:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void *)[(NSMutableArray *)self->_transitionCompletionHandlers copy];
  [(NSMutableArray *)self->_transitionCompletionHandlers removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_finishTransitionForIndex:(unint64_t)a3 cancelled:(BOOL)a4
{
  if (self->_transitioning && self->_transitionIndex == a3)
  {
    self->_transitioning = 0;
    [(PKGlyphView *)self _executeTransitionCompletionHandlers:a4];
  }
}

- (void)_performTransitionWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKGlyphView *)self layoutIfNeeded];
  char layoutFlags = (char)self->_layoutFlags;
  char v8 = layoutFlags;
  if (self->_state != 9)
  {
    [(PKPhoneGlyphLayer *)self->_phoneLayer setHighlighted:0 animated:v4];
    *(unsigned char *)&self->_layoutFlags &= 0xFCu;
    [(PKGlyphView *)self _updatePhoneLayoutWithTransitionIndex:a3 animated:v4];
    [(PKGlyphView *)self _updatePhoneWiggleIfNecessary];
    if (self->_state == 2) {
      goto LABEL_5;
    }
    char v8 = (char)self->_layoutFlags;
  }
  *(unsigned char *)&self->_char layoutFlags = v8 & 0xF3;
  [(PKGlyphView *)self _updateUserIntentLayoutAnimated:v4];
  if (self->_state == 10)
  {
LABEL_6:
    [(PKGlyphView *)self _updateCheckViewStateAnimated:v4 withCompletion:0];
    goto LABEL_7;
  }
LABEL_5:
  [(PKGlyphView *)self _updateCustomImageLayerOpacityAnimated:v4];
  if (self->_state != 11) {
    goto LABEL_6;
  }
LABEL_7:
  objc_initWeak(location, self);
  v113[0] = MEMORY[0x263EF8330];
  v113[1] = 3221225472;
  v113[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke;
  v113[3] = &unk_2644F9790;
  objc_copyWeak(v114, location);
  v114[1] = (id)a3;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x223C3D8D0](v113);
  long long v10 = v9;
  long long v11 = &OBJC_IVAR___PKAuthenticatorSharedRootContext__userIntentAvailabilityState;
  switch(self->_state)
  {
    case 0:
      [(PKGlyphView *)self setColorMode:0 animated:v4];
      pearlView = self->_pearlView;
      if (pearlView)
      {
        v111[0] = MEMORY[0x263EF8330];
        v111[1] = 3221225472;
        v111[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3;
        v111[3] = &unk_2644F97B8;
        v112 = v10;
        [(LAUIPearlGlyphView *)pearlView setState:0 animated:v4 withCompletion:v111];
        long long v13 = v112;
        goto LABEL_60;
      }
      fingerprintView = self->_fingerprintView;
      if (!fingerprintView) {
        goto LABEL_61;
      }
      uint64_t v15 = 0;
      goto LABEL_51;
    case 1:
      [(PKGlyphView *)self setColorMode:0 animated:v4];
      fingerprintView = self->_fingerprintView;
      if (!fingerprintView) {
        goto LABEL_61;
      }
      uint64_t v15 = 1;
      goto LABEL_51;
    case 2:
      [(PKGlyphView *)self setColorMode:0 animated:v4];
      v108[0] = MEMORY[0x263EF8330];
      v108[1] = 3221225472;
      v108[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4;
      v108[3] = &unk_2644F97E0;
      objc_copyWeak(v109, location);
      v109[1] = (id)a3;
      BOOL v110 = v4;
      CGFloat v16 = (void (**)(void, void))MEMORY[0x223C3D8D0](v108);
      v105[0] = MEMORY[0x263EF8330];
      v105[1] = 3221225472;
      v105[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_7;
      v105[3] = &unk_2644F97E0;
      objc_copyWeak(v106, location);
      v106[1] = (id)a3;
      BOOL v107 = v4;
      double v17 = (void *)MEMORY[0x223C3D8D0](v105);
      v102[0] = MEMORY[0x263EF8330];
      v102[1] = 3221225472;
      v102[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_8;
      v102[3] = &unk_2644F97E0;
      objc_copyWeak(v103, location);
      v103[1] = (id)a3;
      BOOL v104 = v4;
      CGFloat v18 = (void *)MEMORY[0x223C3D8D0](v102);
      v98[0] = MEMORY[0x263EF8330];
      v98[1] = 3221225472;
      v98[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_9;
      v98[3] = &unk_2644F9830;
      id v19 = v17;
      id v99 = v19;
      id v20 = v18;
      id v100 = v20;
      v101 = v10;
      ((void (**)(void, void *))v16)[2](v16, v98);

      objc_destroyWeak(v103);
      objc_destroyWeak(v106);

      objc_destroyWeak(v109);
      long long v11 = &OBJC_IVAR___PKAuthenticatorSharedRootContext__userIntentAvailabilityState;
      goto LABEL_62;
    case 3:
      [(PKGlyphView *)self setColorMode:0 animated:v4];
      double v21 = self->_pearlView;
      if (!v21) {
        goto LABEL_61;
      }
      v94[0] = MEMORY[0x263EF8330];
      v94[1] = 3221225472;
      v94[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_12;
      v94[3] = &unk_2644F9880;
      CGFloat v22 = v96;
      objc_copyWeak(v96, location);
      v96[1] = (id)a3;
      BOOL v97 = v4;
      v95 = v10;
      [(LAUIPearlGlyphView *)v21 setState:4 animated:v4 withCompletion:v94];
      double v23 = v95;
      goto LABEL_48;
    case 4:
      [(PKGlyphView *)self setColorMode:0 animated:v4];
      double v24 = self->_pearlView;
      if (!v24) {
        goto LABEL_61;
      }
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_15;
      v92[3] = &unk_2644F97B8;
      uint64_t v93 = v10;
      [(LAUIPearlGlyphView *)v24 setState:1 animated:v4 withCompletion:v92];
      long long v13 = v93;
      goto LABEL_60;
    case 5:
      [(PKGlyphView *)self setColorMode:0 animated:v4];
      double v25 = self->_pearlView;
      if (!v25) {
        goto LABEL_61;
      }
      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_16;
      v90[3] = &unk_2644F97B8;
      uint64_t v91 = v10;
      [(LAUIPearlGlyphView *)v25 setState:2 animated:v4 withCompletion:v90];
      long long v13 = v91;
      goto LABEL_60;
    case 6:
      double v26 = self->_pearlView;
      if (v26)
      {
        v88[0] = MEMORY[0x263EF8330];
        v88[1] = 3221225472;
        v88[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_17;
        v88[3] = &unk_2644F97B8;
        v89 = v9;
        [(LAUIPearlGlyphView *)v26 setState:7 animated:v4 withCompletion:v88];
        long long v13 = v89;
        goto LABEL_60;
      }
      fingerprintView = self->_fingerprintView;
      if (!fingerprintView) {
        goto LABEL_61;
      }
      uint64_t v15 = 2;
LABEL_51:
      [(PKFingerprintGlyphView *)fingerprintView setState:v15 animated:v4 completionHandler:v10];
      goto LABEL_62;
    case 7:
      char v27 = layoutFlags & 1;
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_18;
      v83[3] = &unk_2644F9858;
      CGFloat v22 = v85;
      objc_copyWeak(v85, location);
      BOOL v86 = v4;
      double v28 = v10;
      char v87 = v27;
      id v84 = v28;
      v85[1] = (id)a3;
      uint64_t v29 = MEMORY[0x223C3D8D0](v83);
      double v30 = (void *)v29;
      if (v4)
      {
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_22;
        v80[3] = &unk_2644F98F8;
        objc_copyWeak(v82, location);
        v82[1] = (id)a3;
        id v81 = v30;
        [(PKGlyphView *)self _setRecognizedIfNecessaryWithTransitionIndex:a3 completion:v80];

        objc_destroyWeak(v82);
      }
      else
      {
        (*(void (**)(uint64_t))(v29 + 16))(v29);
      }

      double v23 = v84;
      goto LABEL_48;
    case 8:
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_23;
      v76[3] = &unk_2644F98A8;
      CGFloat v22 = &v78;
      objc_copyWeak(&v78, location);
      BOOL v79 = v4;
      unsigned int v31 = v10;
      id v77 = v31;
      uint64_t v32 = MEMORY[0x223C3D8D0](v76);
      double v33 = (void *)v32;
      if (v4)
      {
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_25;
        v72[3] = &unk_2644F9920;
        objc_copyWeak(v75, location);
        v75[1] = (id)a3;
        id v73 = v33;
        v74 = v31;
        [(PKGlyphView *)self _setRecognizedIfNecessaryWithTransitionIndex:a3 completion:v72];

        objc_destroyWeak(v75);
      }
      else
      {
        (*(void (**)(uint64_t))(v32 + 16))(v32);
      }

      double v23 = v77;
      goto LABEL_48;
    case 9:
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_28;
      v64[3] = &unk_2644F9948;
      CGFloat v22 = v66;
      objc_copyWeak(v66, location);
      v66[1] = (id)a3;
      BOOL v67 = v4;
      v65 = v10;
      uint64_t v34 = MEMORY[0x223C3D8D0](v64);
      double v35 = (void *)v34;
      if (v4)
      {
        v61[0] = MEMORY[0x263EF8330];
        v61[1] = 3221225472;
        v61[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_34;
        v61[3] = &unk_2644F98F8;
        objc_copyWeak(v63, location);
        v63[1] = (id)a3;
        id v62 = v35;
        [(PKGlyphView *)self _setRecognizedIfNecessaryWithTransitionIndex:a3 completion:v61];

        objc_destroyWeak(v63);
      }
      else
      {
        (*(void (**)(uint64_t))(v34 + 16))(v34);
      }

      double v23 = v65;
      goto LABEL_48;
    case 0xALL:
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_35;
      v57[3] = &unk_2644F9948;
      CGFloat v22 = v59;
      objc_copyWeak(v59, location);
      v59[1] = (id)a3;
      BOOL v60 = v4;
      v58 = v10;
      uint64_t v36 = MEMORY[0x223C3D8D0](v57);
      CGRect v37 = (void *)v36;
      double v38 = self->_pearlView;
      if (v38)
      {
        double v39 = v55;
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_37;
        v55[3] = &unk_2644F98F8;
        double v40 = v56;
        objc_copyWeak(v56, location);
        v56[1] = (id)a3;
        v55[4] = v37;
        [(LAUIPearlGlyphView *)v38 setState:6 animated:v4 withCompletion:v55];
LABEL_46:
        long long v11 = &OBJC_IVAR___PKAuthenticatorSharedRootContext__userIntentAvailabilityState;

        objc_destroyWeak(v40);
        goto LABEL_47;
      }
      double v44 = self->_fingerprintView;
      if (v44)
      {
        double v39 = v53;
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_38;
        v53[3] = &unk_2644F98F8;
        double v40 = v54;
        objc_copyWeak(v54, location);
        v54[1] = (id)a3;
        v53[4] = v37;
        [(PKFingerprintGlyphView *)v44 setState:5 animated:v4 completionHandler:v53];
        goto LABEL_46;
      }
      (*(void (**)(uint64_t))(v36 + 16))(v36);
      long long v11 = &OBJC_IVAR___PKAuthenticatorSharedRootContext__userIntentAvailabilityState;
LABEL_47:

      double v23 = v58;
LABEL_48:

      objc_destroyWeak(v22);
      goto LABEL_62;
    case 0xBLL:
      [(PKGlyphView *)self setColorMode:2 animated:v4];
      double v41 = self->_pearlView;
      if (v41)
      {
        if (self->_style == 7) {
          uint64_t v42 = 8;
        }
        else {
          uint64_t v42 = 6;
        }
        [(LAUIPearlGlyphView *)v41 setState:v42 animated:v4];
      }
      else
      {
        double v45 = self->_fingerprintView;
        if (v45) {
          [(PKFingerprintGlyphView *)v45 setState:5 animated:v4 completionHandler:0];
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained glyphView:self revealingCheckmark:v4];
      }
      self->_lastAnimationWillFinish = 0.0;
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_39;
      v50[3] = &unk_2644F98F8;
      objc_copyWeak(v52, location);
      v52[1] = (id)a3;
      v51 = v10;
      [(PKGlyphView *)self _updateCheckViewStateAnimated:v4 withCompletion:v50];

      objc_destroyWeak(v52);
      goto LABEL_62;
    case 0xCLL:
      [(PKGlyphView *)self setColorMode:1 animated:v4];
      double v43 = self->_pearlView;
      if (v43)
      {
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_26;
        v70[3] = &unk_2644F97B8;
        v71 = v10;
        [(LAUIPearlGlyphView *)v43 setState:6 animated:v4 withCompletion:v70];
        long long v13 = v71;
LABEL_60:

        goto LABEL_62;
      }
      double v47 = self->_fingerprintView;
      if (v47)
      {
        [(PKFingerprintGlyphView *)v47 setFadeOnRecognized:0];
        v48 = self->_fingerprintView;
        v68[0] = MEMORY[0x263EF8330];
        v68[1] = 3221225472;
        v68[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_27;
        v68[3] = &unk_2644F97B8;
        v69 = v10;
        [(PKFingerprintGlyphView *)v48 setState:4 animated:v4 completionHandler:v68];
        long long v13 = v69;
        goto LABEL_60;
      }
LABEL_61:
      v10[2](v10, 0);
LABEL_62:
      id v49 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + v11[176]));
      if (v49 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v49 glyphView:self transitioningToState:self->_state];
      }

      objc_destroyWeak(v114);
      objc_destroyWeak(location);
      return;
    default:
      goto LABEL_62;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke(uint64_t a1, char a2)
{
  BOOL v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained _finishTransitionForIndex:*(void *)(a1 + 40) cancelled:1];
    }
    else
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2;
      v7[3] = &unk_2644F9550;
      objc_copyWeak(v8, v4);
      v8[1] = *(id *)(a1 + 40);
      [v6 _executeAfterMinimumAnimationDurationForStateTransition:v7];
      objc_destroyWeak(v8);
    }
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _finishTransitionForIndex:*(void *)(a1 + 40) cancelled:0];
    id WeakRetained = v3;
  }
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && WeakRetained[53] == *(void *)(a1 + 40))
  {
    uint64_t v6 = (void *)WeakRetained[63];
    if (v6)
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5;
      v13[3] = &unk_2644F97B8;
      double v14 = v3;
      [v6 setState:6 animated:v7 withCompletion:v13];
      char v8 = v14;
LABEL_7:

      goto LABEL_8;
    }
    uint64_t v9 = (void *)WeakRetained[62];
    if (v9)
    {
      uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6;
      v11[3] = &unk_2644F97B8;
      long long v12 = v3;
      [v9 setState:5 animated:v10 completionHandler:v11];
      char v8 = v12;
      goto LABEL_7;
    }
    if (v3) {
      v3[2](v3);
    }
  }
LABEL_8:
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_7(uint64_t a1, void *a2)
{
  block = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 53) == *(void *)(a1 + 40))
    {
      *((unsigned char *)WeakRetained + 488) |= 4u;
      [WeakRetained _updateUserIntentLayoutAnimated:*(unsigned __int8 *)(a1 + 48)];
      if (block)
      {
        if (*(unsigned char *)(a1 + 48))
        {
          dispatch_time_t v5 = dispatch_time(0, 255000000);
          dispatch_after(v5, MEMORY[0x263EF83A0], block);
        }
        else
        {
          block[2]();
        }
      }
    }
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_8(uint64_t a1, void *a2)
{
  dispatch_time_t v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((void *)WeakRetained + 53) == *(void *)(a1 + 40))
    {
      *((unsigned char *)WeakRetained + 488) |= 8u;
      [WeakRetained _updateUserIntentLayoutAnimated:*(unsigned __int8 *)(a1 + 48)];
      if (v5) {
        v5[2]();
      }
    }
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_9(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_10;
  v3[3] = &unk_2644F9808;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_10(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_11;
  v2[3] = &unk_2644F8C80;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_12(uint64_t a1, char a2)
{
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_13;
  v5[3] = &unk_2644F9858;
  objc_copyWeak(v7, (id *)(a1 + 40));
  char v8 = a2;
  v7[1] = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(v7);
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v4 = WeakRetained == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 || *((void *)WeakRetained + 53) != *(void *)(a1 + 48))
  {
    (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 56) == 0);
  }
  else
  {
    id v5 = (void *)*((void *)WeakRetained + 63);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 57);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    id v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_14;
    v7[3] = &unk_2644F97B8;
    id v8 = *(id *)(a1 + 32);
    [v5 setState:0 animated:v6 withCompletion:v7];
  }
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_19;
    v9[3] = &unk_2644F98A8;
    objc_copyWeak(&v11, v2);
    char v12 = *(unsigned char *)(a1 + 56);
    id v10 = *(id *)(a1 + 32);
    uint64_t v4 = MEMORY[0x223C3D8D0](v9);
    id v5 = (void *)v4;
    if (*(unsigned char *)(a1 + 57))
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_21;
      v6[3] = &unk_2644F98D0;
      objc_copyWeak(v8, v2);
      v8[1] = *(id *)(a1 + 48);
      id v7 = v5;
      [WeakRetained _executeAfterMinimumAnimationDurationForStateTransition:v6];

      objc_destroyWeak(v8);
    }
    else
    {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    objc_destroyWeak(&v11);
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_19(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setColorMode:1 animated:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v4 = (void *)v3[63];
    if (v4)
    {
      uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      id v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_20;
      v7[3] = &unk_2644F97B8;
      id v8 = *(id *)(a1 + 32);
      [v4 setState:5 animated:v5 withCompletion:v7];
    }
    else
    {
      uint64_t v6 = (void *)v3[62];
      if (v6) {
        [v6 setState:3 animated:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 32)];
      }
      else {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_21(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_22(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    uint64_t v5 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setColorMode:1 animated:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v4 = (void *)v3[63];
    if (v4)
    {
      uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      id v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_24;
      v7[3] = &unk_2644F97B8;
      id v8 = *(id *)(a1 + 32);
      [v4 setState:6 animated:v5 withCompletion:v7];
    }
    else
    {
      uint64_t v6 = (void *)v3[62];
      if (v6) {
        [v6 setState:5 animated:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 32)];
      }
      else {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_25(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[53] == *(void *)(a1 + 56))
  {
    uint64_t v5 = WeakRetained;
    if (a2) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    id WeakRetained = v5;
  }
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_28(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_29;
    v16[3] = &unk_2644F9948;
    objc_copyWeak(v18, v2);
    v18[1] = *(id *)(a1 + 48);
    char v19 = *(unsigned char *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    uint64_t v5 = (void (**)(void))MEMORY[0x223C3D8D0](v16);
    [v4 setColorMode:1 animated:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v6 = (void *)v4[63];
    if (v6)
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
      id v8 = v14;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_32;
      v14[3] = &unk_2644F98F8;
      char v9 = v15;
      objc_copyWeak(v15, v2);
      v15[1] = *(id *)(a1 + 48);
      v14[4] = v5;
      [v6 setState:6 animated:v7 withCompletion:v14];
    }
    else
    {
      id v10 = (void *)v4[62];
      if (!v10)
      {
        v5[2](v5);
        goto LABEL_8;
      }
      uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
      id v8 = v12;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_33;
      v12[3] = &unk_2644F98F8;
      char v9 = v13;
      objc_copyWeak(v13, v2);
      v13[1] = *(id *)(a1 + 48);
      v12[4] = v5;
      [v10 setState:5 animated:v11 completionHandler:v12];
    }

    objc_destroyWeak(v9);
LABEL_8:

    objc_destroyWeak(v18);
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_29(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[488] |= 1u;
    [WeakRetained _updatePhoneLayoutWithTransitionIndex:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56)];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_30;
    v5[3] = &unk_2644F98D0;
    objc_copyWeak(v7, v2);
    v7[1] = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 32);
    [v4 _executeAfterMinimumAnimationDurationForStateTransition:v5];

    objc_destroyWeak(v7);
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_30(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && WeakRetained[53] == *(id *)(a1 + 48))
  {
    *((unsigned char *)WeakRetained + 488) |= 2u;
    [WeakRetained[64] setHighlighted:1 animated:1];
    [v4 _updatePhoneLayoutWithTransitionIndex:*(void *)(a1 + 48) animated:1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    id v7[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_31;
    v7[3] = &unk_2644F9550;
    objc_copyWeak(v8, v2);
    v8[1] = *(id *)(a1 + 48);
    [v4 _executeAfterMinimumAnimationDurationForStateTransitionWithDelayRatio:v7 handler:0.9];
    (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v5, v6);
    objc_destroyWeak(v8);
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_31(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[53] == *(void *)(a1 + 40))
  {
    id v3 = WeakRetained;
    [WeakRetained _updatePhoneWiggleIfNecessary];
    id WeakRetained = v3;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_32(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    uint64_t v5 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_33(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    uint64_t v5 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_34(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    uint64_t v5 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_35(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 53) == *(void *)(a1 + 48))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_36;
    v5[3] = &unk_2644F9948;
    objc_copyWeak(v7, v2);
    v7[1] = *(id *)(a1 + 48);
    char v8 = *(unsigned char *)(a1 + 56);
    id v6 = *(id *)(a1 + 32);
    [v4 _executeAfterMinimumAnimationDurationForStateTransition:v5];

    objc_destroyWeak(v7);
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    id v3 = WeakRetained;
    [WeakRetained _updateCustomImageLayerOpacityAnimated:*(unsigned __int8 *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_37(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    uint64_t v5 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_38(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0 && WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    uint64_t v5 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v5;
  }
}

void __62__PKGlyphView__performTransitionWithTransitionIndex_animated___block_invoke_39(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[53] == *(void *)(a1 + 48))
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_updatePhoneLayoutWithTransitionIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_transitionIndex == a3)
  {
    BOOL v4 = a4;
    id v6 = [(LAUIPearlGlyphView *)self->_pearlView contentLayer];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(PKFingerprintGlyphView *)self->_fingerprintView contentLayer];
    }
    char v9 = v8;

    [v9 bounds];
    double v11 = v10;
    double v73 = v12;
    double v14 = v13;
    [(PKPhoneGlyphLayer *)self->_phoneLayer bounds];
    double v16 = v15;
    double v18 = v17;
    [(PKPhoneGlyphLayer *)self->_phoneLayer position];
    double v20 = v19;
    double v22 = v21;
    memset(&v76[1], 0, sizeof(CATransform3D));
    phoneLayer = self->_phoneLayer;
    if (phoneLayer) {
      [(PKPhoneGlyphLayer *)phoneLayer transform];
    }
    double v24 = v14 * 0.75 / 0.675;
    double v25 = v24 * self->_phoneAspectRatio;
    if (v25 != v16 || v24 != v18)
    {
      double v71 = v11;
      double v72 = v22;
      double v27 = v20;
      double v28 = *MEMORY[0x263F00148];
      double v29 = *(double *)(MEMORY[0x263F00148] + 8);
      if (v4)
      {
        double v30 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"bounds.size.width"];
        objc_msgSend(v30, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v16, v25);
        id v31 = (id)[(PKPhoneGlyphLayer *)self->_phoneLayer pkui_addAdditiveAnimation:v30];
        [v30 duration];
        -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");
        uint64_t v32 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"bounds.size.height"];

        objc_msgSend(v32, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v18, v14 * 0.75 / 0.675);
        id v33 = (id)[(PKPhoneGlyphLayer *)self->_phoneLayer pkui_addAdditiveAnimation:v32];
        [v32 duration];
        -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");
      }
      -[PKPhoneGlyphLayer setBounds:](self->_phoneLayer, "setBounds:", v28, v29, v25, v14 * 0.75 / 0.675);
      double v20 = v27;
      double v11 = v71;
      double v22 = v72;
    }
    [(PKPhoneGlyphLayer *)self->_phoneLayer anchorPoint];
    $D7D2A1320813818F577E2AD43327F629 layoutFlags = self->_layoutFlags;
    if (*(unsigned char *)&layoutFlags)
    {
      [(PKGlyphView *)self _phonePositionWhileShownWithRotationPercentage:(double)((*(unsigned int *)&layoutFlags >> 1) & 1)];
      double v37 = v39;
      double v38 = v40;
    }
    else
    {
      double v37 = (v73 - v25) * 0.5 + v11 + v34 * v25;
      double v38 = v14 + v35 * v24;
    }
    if (v37 != v20 || v38 != v22)
    {
      if (v4)
      {
        uint64_t v42 = [MEMORY[0x263F15750] animation];
        id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
        double v44 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
        [v44 setAdditive:1];
        $D7D2A1320813818F577E2AD43327F629 v48 = self->_layoutFlags;
        if ((~*(_DWORD *)&v48 & 3) != 0)
        {
          if (*(unsigned char *)&v48)
          {
            double v45 = 0.0;
            LODWORD(v46) = 0.25;
          }
          else
          {
            LODWORD(v45) = 0.75;
            LODWORD(v46) = 1.0;
          }
          LODWORD(v47) = 1.0;
          id v52 = [MEMORY[0x263F15808] functionWithControlPoints:v45 :0.0 :v46 :v47];
          [v44 setTimingFunction:v52];

          [v44 setDuration:dbl_21EEE7E70[(*(unsigned char *)&self->_layoutFlags & 1) == 0]];
          [v44 duration];
          double v54 = 0.9;
          if ((*(unsigned char *)&self->_layoutFlags & 1) == 0) {
            double v54 = 0.75;
          }
          double v51 = v53 * v54;
        }
        else
        {
          LODWORD(v45) = 1058642330;
          LODWORD(v46) = *(_DWORD *)"ff&?";
          LODWORD(v47) = 1.0;
          id v49 = [MEMORY[0x263F15808] functionWithControlPoints:v45 :0.0 :v46 :v47];
          [v44 setTimingFunction:v49];

          [v44 setDuration:1.3];
          [v44 duration];
          double v51 = v50;
        }
        [v44 duration];
        objc_msgSend(v42, "setDuration:");
        [v43 addObject:v44];
        objc_msgSend(v44, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v20, v22, v37, v38);
        if ((*(unsigned char *)&self->_layoutFlags & 1) == 0 && (self->_state & 0xFFFFFFFFFFFFFFFELL) == 0xA)
        {
          double v55 = [v44 timingFunction];
          [(PKPhoneGlyphLayer *)self->_phoneLayer opacity];
          double v57 = v56;
          v58 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];

          [v58 setAdditive:1];
          [v58 setDuration:0.1];
          [v58 setTimingFunction:v55];
          [v58 setFillMode:*MEMORY[0x263F15AB0]];
          [v43 addObject:v58];
          objc_msgSend(v58, "pkui_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", v57, 0.0, v57);

          double v44 = v58;
        }
        [v42 setAnimations:v43];
        id v59 = (id)[(PKPhoneGlyphLayer *)self->_phoneLayer pkui_addAdditiveAnimation:v42];
        [(PKGlyphView *)self _updateLastAnimationTimeWithAnimationOfDuration:v51];
      }
      -[PKPhoneGlyphLayer setPosition:](self->_phoneLayer, "setPosition:", v37, v38);
    }
    memset(v76, 0, 128);
    if ((*(unsigned char *)&self->_layoutFlags & 2) != 0)
    {
      [(PKGlyphView *)self _phoneTransformDeltaWhileShownFromRotationPercentage:0.0 toPercentage:1.0];
    }
    else
    {
      long long v60 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      *(_OWORD *)&v76[0].m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      *(_OWORD *)&v76[0].m33 = v60;
      long long v61 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      *(_OWORD *)&v76[0].m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      *(_OWORD *)&v76[0].m43 = v61;
      long long v62 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      *(_OWORD *)&v76[0].m11 = *MEMORY[0x263F15740];
      *(_OWORD *)&v76[0].m13 = v62;
      long long v63 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      *(_OWORD *)&v76[0].m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      *(_OWORD *)&v76[0].m23 = v63;
    }
    CATransform3D a = v76[0];
    CATransform3D b = v76[1];
    if (!CATransform3DEqualToTransform(&a, &b))
    {
      if (v4)
      {
        v64 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
        [v64 setAdditive:1];
        LODWORD(v65) = 1058642330;
        LODWORD(v66) = *(_DWORD *)"ff&?";
        LODWORD(v67) = 1.0;
        v68 = [MEMORY[0x263F15808] functionWithControlPoints:v65 :0.0 :v66 :v67];
        [v64 setTimingFunction:v68];

        [v64 setDuration:1.3];
        CATransform3D a = v76[1];
        CATransform3D b = v76[0];
        objc_msgSend(v64, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
        id v69 = (id)[(PKPhoneGlyphLayer *)self->_phoneLayer pkui_addAdditiveAnimation:v64];
        if (*(unsigned char *)&self->_layoutFlags)
        {
          [v64 duration];
          -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");
        }
      }
      v70 = self->_phoneLayer;
      CATransform3D a = v76[0];
      [(PKPhoneGlyphLayer *)v70 setTransform:&a];
    }
  }
}

- (void)_updatePhoneWiggleIfNecessary
{
  BOOL v2 = self->_state == 9;
  if (self->_state == 9)
  {
    if (!self->_phoneWiggling)
    {
      self->_phoneWiggling = v2;
      [(PKGlyphView *)self _startPhoneWiggle];
    }
  }
  else if (self->_phoneWiggling)
  {
    self->_phoneWiggling = v2;
    [(PKGlyphView *)self _endPhoneWiggle];
  }
}

- (void)_startPhoneWiggle
{
  if (!self->_phoneWiggleAnimationKey)
  {
    [(PKPhoneGlyphLayer *)self->_phoneLayer _startPhoneWiggle];
    id v3 = [MEMORY[0x263F15750] animation];
    [v3 setDuration:2.6];
    LODWORD(v4) = 2139095040;
    [v3 setRepeatCount:v4];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v22[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v22[5] = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v22[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v22[7] = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v22[0] = *MEMORY[0x263F15740];
    v22[1] = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v22[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v22[3] = v9;
    double v10 = [MEMORY[0x263F08D40] valueWithCATransform3D:v22];
    double v11 = (void *)MEMORY[0x263F08D40];
    [(PKGlyphView *)self _phoneTransformDeltaWhileShownFromRotationPercentage:1.0 toPercentage:0.35];
    double v12 = [v11 valueWithCATransform3D:&v21];
    double v13 = __32__PKGlyphView__startPhoneWiggle__block_invoke((uint64_t)v12, @"transform", v10, v12);

    if (v13) {
      [v5 addObject:v13];
    }
    double v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    double v15 = (void *)MEMORY[0x263F08D40];
    [(PKGlyphView *)self _phonePositionDeltaWhileShownFromRotationPercentage:1.0 toPercentage:0.35];
    double v16 = objc_msgSend(v15, "valueWithPoint:");
    double v17 = __32__PKGlyphView__startPhoneWiggle__block_invoke((uint64_t)v16, @"position", v14, v16);

    if (v17) {
      [v5 addObject:v17];
    }
    [v3 setAnimations:v5];
    double v18 = [(PKPhoneGlyphLayer *)self->_phoneLayer pkui_addAdditiveAnimation:v3];
    double v19 = (NSString *)[v18 copy];
    phoneWiggleAnimationKey = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKey = v19;
  }
}

id __32__PKGlyphView__startPhoneWiggle__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v22[3] = *MEMORY[0x263EF8340];
  long long v6 = (void *)MEMORY[0x263F157D8];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 animationWithKeyPath:a2];
  [v9 setAdditive:1];
  [v9 setKeyTimes:&unk_26D086C98];
  v22[0] = v8;
  v22[1] = v7;
  v22[2] = v8;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  [v9 setValues:v10];

  LODWORD(v11) = 0.75;
  LODWORD(v12) = 1.0;
  LODWORD(v13) = *(_DWORD *)"ff&?";
  double v14 = [MEMORY[0x263F15808] functionWithControlPoints:v11 :0.0 :v13 :v12];
  LODWORD(v15) = 1058642330;
  LODWORD(v16) = 1.0;
  LODWORD(v17) = *(_DWORD *)"ff&?";
  double v18 = objc_msgSend(MEMORY[0x263F15808], "functionWithControlPoints::::", v15, 0.0, v17, v16, v14);
  v21[1] = v18;
  double v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

  [v9 setTimingFunctions:v19];
  [v9 setDuration:2.6];

  return v9;
}

- (void)_endPhoneWiggle
{
  if (self->_phoneWiggleAnimationKey)
  {
    [(PKPhoneGlyphLayer *)self->_phoneLayer _endPhoneWiggle];
    id v3 = self->_phoneWiggleAnimationKey;
    double v4 = [(PKPhoneGlyphLayer *)self->_phoneLayer animationForKey:v3];
    phoneWiggleAnimationKey = self->_phoneWiggleAnimationKey;
    self->_phoneWiggleAnimationKey = 0;

    [(PKPhoneGlyphLayer *)self->_phoneLayer pkui_elapsedDurationForAnimationWithKey:v3];
    if (v6 <= 0.0)
    {
      [(PKPhoneGlyphLayer *)self->_phoneLayer removeAnimationForKey:v3];
    }
    else
    {
      long double v7 = v6;
      [v4 duration];
      if (!v3)
      {
LABEL_7:

        return;
      }
      int64_t v9 = (uint64_t)((v8 - fmod(v7, v8)) * 1000000000.0);
      objc_initWeak(&location, self);
      dispatch_time_t v10 = dispatch_time(0, v9);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __30__PKGlyphView__endPhoneWiggle__block_invoke;
      block[3] = &unk_2644F9040;
      objc_copyWeak(&v13, &location);
      double v12 = v3;
      id v3 = v3;
      dispatch_after(v10, MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

    goto LABEL_7;
  }
}

void __30__PKGlyphView__endPhoneWiggle__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[64] removeAnimationForKey:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_updateUserIntentLayoutAnimated:(BOOL)a3
{
  userIntentLayer = self->_userIntentLayer;
  if (userIntentLayer)
  {
    [(CALayer *)userIntentLayer bounds];
    double v7 = v6;
    double v9 = v8;
    dispatch_time_t v10 = [(PKMicaLayer *)self->_userIntentDeviceLayer rootLayer];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    double v15 = [(PKMicaLayer *)self->_userIntentArrowLayer rootLayer];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    double v20 = *MEMORY[0x263F00148];
    double v21 = *(double *)(MEMORY[0x263F00148] + 8);
    double v41 = v7;
    if (self->_isPad)
    {
      double v22 = v7 * 0.697674419 / 0.697674419;
      double v23 = v22 * (v14 / v12);
    }
    else
    {
      double v24 = v12;
      double v23 = v9 * 0.857142857 / 0.612359551;
      double v22 = v23 * (v24 / v14);
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke;
    v44[3] = &unk_2644F9970;
    BOOL v45 = a3;
    v44[4] = self;
    double v25 = (void (**)(void, void, double, double, double, double))MEMORY[0x223C3D8D0](v44);
    ((void (**)(void, PKMicaLayer *, double, double, double, double))v25)[2](v25, self->_userIntentDeviceLayer, v20, v21, v22, v23);
    ((void (**)(void, PKMicaLayer *, double, double, double, double))v25)[2](v25, self->_userIntentArrowLayer, v20, v21, v9 * 0.253968254 * (v17 / v19), v9 * 0.253968254);
    BOOL isPad = self->_isPad;
    double v27 = v41 * dbl_21EEE7E80[!isPad];
    double v28 = v9 * dbl_21EEE7E90[!isPad];
    double v29 = 0.5;
    double v30 = v9 * 1.07936508;
    if (self->_isPad) {
      double v31 = v41 + v22 * 0.5;
    }
    else {
      double v31 = v41 * dbl_21EEE7E80[!isPad];
    }
    if (!self->_isPad) {
      double v29 = 0.615079365;
    }
    double v40 = v29;
    if (self->_isPad) {
      double v32 = v28 + v9 * 0.0465116279;
    }
    else {
      double v32 = v9 * 0.492063492;
    }
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke_2;
    v42[3] = &unk_2644F9998;
    if (!isPad) {
      double v9 = v9 * 0.492063492;
    }
    BOOL v43 = a3;
    v42[4] = self;
    uint64_t v33 = MEMORY[0x223C3D8D0](v42);
    uint64_t v36 = (void *)v33;
    if ((*(unsigned char *)&self->_layoutFlags & 4) != 0) {
      v34.n128_f64[0] = v27;
    }
    else {
      v34.n128_f64[0] = v31;
    }
    if (*(unsigned char *)&self->_layoutFlags & 4 | isPad) {
      v35.n128_f64[0] = v28;
    }
    else {
      v35.n128_f64[0] = v30;
    }
    double v37 = (void (**)(void *, PKMicaLayer *, double, __n128))(v33 + 16);
    (*(void (**)(uint64_t, PKMicaLayer *, __n128, __n128))(v33 + 16))(v33, self->_userIntentDeviceLayer, v34, v35);
    if ((*(unsigned char *)&self->_layoutFlags & 8) != 0) {
      v38.n128_f64[0] = v32;
    }
    else {
      v38.n128_f64[0] = v9;
    }
    double v39 = 1.17460317;
    if (*(unsigned char *)&self->_layoutFlags & 8 | isPad) {
      double v39 = v40;
    }
    (*v37)(v36, self->_userIntentArrowLayer, v41 * v39, v38);
  }
}

void __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v22 = a2;
  [v22 bounds];
  if (a5 != v11 || a6 != v12)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      double v14 = v11;
      double v15 = v12;
      double v16 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"bounds.size.width"];
      objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v14, a5);
      id v17 = (id)objc_msgSend(v22, "pkui_addAdditiveAnimation:", v16);
      double v18 = *(void **)(a1 + 32);
      [v16 duration];
      objc_msgSend(v18, "_updateLastAnimationTimeWithAnimationOfDuration:");
      double v19 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"bounds.size.height"];

      objc_msgSend(v19, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v15, a6);
      id v20 = (id)objc_msgSend(v22, "pkui_addAdditiveAnimation:", v19);
      double v21 = *(void **)(a1 + 32);
      [v19 duration];
      objc_msgSend(v21, "_updateLastAnimationTimeWithAnimationOfDuration:");
    }
    objc_msgSend(v22, "setBounds:", a3, a4, a5, a6);
  }
}

void __47__PKGlyphView__updateUserIntentLayoutAnimated___block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  id v15 = a2;
  [v15 position];
  if (a3 != v7 || a4 != v8)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      double v10 = v7;
      double v11 = v8;
      double v12 = [MEMORY[0x263F15890] animationWithKeyPath:@"position"];
      [v12 setAdditive:1];
      [v12 setMass:2.0];
      [v12 setStiffness:300.0];
      [v12 setDamping:400.0];
      [v12 durationForEpsilon:0.001];
      objc_msgSend(v12, "setDuration:");
      objc_msgSend(v12, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v10, v11, a3, a4);
      id v13 = (id)objc_msgSend(v15, "pkui_addAdditiveAnimation:", v12);
      double v14 = *(void **)(a1 + 32);
      [v12 duration];
      objc_msgSend(v14, "_updateLastAnimationTimeWithAnimationOfDuration:");
    }
    objc_msgSend(v15, "setPosition:", a3, a4);
  }
}

- (void)_updateUserIntentLayerRotation
{
  userIntentLayer = self->_userIntentLayer;
  if (userIntentLayer && self->_isPad)
  {
    uint64_t userIntentEdge = (int)self->_userIntentEdge;
    CGFloat v4 = 0.0;
    if (userIntentEdge <= 2) {
      CGFloat v4 = dbl_21EEE7EA8[userIntentEdge];
    }
    CATransform3DMakeRotation(&v5, v4, 0.0, 0.0, 1.0);
    [(CALayer *)userIntentLayer setTransform:&v5];
  }
}

- (void)_updateCustomImageLayerOpacityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CALayer *)self->_customImageLayer opacity];
  int64_t state = self->_state;
  double v7 = v6;
  if (state == 10) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  if (v7 != v8)
  {
    if (v3)
    {
      double v9 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v7, v8);
      id v10 = (id)[(CALayer *)self->_customImageLayer pkui_addAdditiveAnimation:v9];
      [v9 duration];
      -[PKGlyphView _updateLastAnimationTimeWithAnimationOfDuration:](self, "_updateLastAnimationTimeWithAnimationOfDuration:");
    }
    customImageLayer = self->_customImageLayer;
    double v12 = 0.0;
    if (state == 10) {
      *(float *)&double v12 = 1.0;
    }
    [(CALayer *)customImageLayer setOpacity:v12];
  }
}

- (void)_updateCheckViewStateAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = v6;
  if (self->_checkLayer)
  {
    double v8 = self->_lastAnimationGroup;
    dispatch_group_enter((dispatch_group_t)v8);
    checkLayer = self->_checkLayer;
    BOOL v10 = self->_state == 11;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__PKGlyphView__updateCheckViewStateAnimated_withCompletion___block_invoke;
    v12[3] = &unk_2644F99C0;
    id v13 = v8;
    id v14 = v7;
    double v11 = v8;
    [(LAUICheckmarkLayer *)checkLayer setRevealed:v10 animated:v4 withCompletion:v12];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

void __60__PKGlyphView__updateCheckViewStateAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

- (void)_setRecognizedIfNecessaryWithTransitionIndex:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_transitionIndex == a3)
  {
    objc_initWeak(&location, self);
    pearlView = self->_pearlView;
    if (pearlView)
    {
      if ((unint64_t)([(LAUIPearlGlyphView *)pearlView state] - 1) <= 3)
      {
        double v8 = self->_pearlView;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        id v13[2] = __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke;
        v13[3] = &unk_2644F99E8;
        id v14 = v6;
        objc_copyWeak(v15, &location);
        v15[1] = (id)a3;
        [(LAUIPearlGlyphView *)v8 setState:6 animated:1 withCompletion:v13];
        objc_destroyWeak(v15);

LABEL_11:
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
      if (!v6) {
        goto LABEL_11;
      }
    }
    else
    {
      fingerprintView = self->_fingerprintView;
      if (fingerprintView)
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke_2;
        v10[3] = &unk_2644F98F8;
        objc_copyWeak(v12, &location);
        id v11 = v6;
        v12[1] = (id)a3;
        [(PKFingerprintGlyphView *)fingerprintView setRecognizedIfNecessaryWithCompletion:v10];

        objc_destroyWeak(v12);
        goto LABEL_11;
      }
      if (!v6) {
        goto LABEL_11;
      }
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    goto LABEL_11;
  }
LABEL_12:
}

void __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v5 = 1;
    if (a2 && WeakRetained) {
      BOOL v5 = WeakRetained[53] != *(void *)(a1 + 48);
    }
    id v6 = WeakRetained;
    (*(void (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5);
  }
}

uint64_t __71__PKGlyphView__setRecognizedIfNecessaryWithTransitionIndex_completion___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    BOOL v6 = 1;
    if ((a2 & 1) == 0 && WeakRetained) {
      BOOL v6 = WeakRetained[53] != *(void *)(a1 + 48);
    }
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v6);
  }

  return MEMORY[0x270F9A790]();
}

- (void)_applyEffectiveHighlightColorsToLayersAnimated:(BOOL)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke;
  v7[3] = &unk_2644F9A38;
  BOOL v8 = a3;
  void v7[4] = self;
  BOOL v4 = (void (**)(void, void, void))MEMORY[0x223C3D8D0](v7, a2);
  ((void (**)(void, PKPhoneGlyphLayer *, UIColor *))v4)[2](v4, self->_phoneLayer, self->_primaryHighlightColor);
  intentPrimaryHighlightColor = self->_intentPrimaryHighlightColor;
  if (!intentPrimaryHighlightColor) {
    intentPrimaryHighlightColor = self->_primaryHighlightColor;
  }
  ((void (**)(void, PKMicaLayer *, UIColor *))v4)[2](v4, self->_userIntentArrowLayer, intentPrimaryHighlightColor);
  primaryHighlightColor = self->_intentPrimaryHighlightColor;
  if (!primaryHighlightColor) {
    primaryHighlightColor = self->_primaryHighlightColor;
  }
  ((void (**)(void, PKMicaLayer *, UIColor *))v4)[2](v4, self->_userIntentDeviceLayer, primaryHighlightColor);
}

void __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v5 = a3;
    id v6 = a2;
    double v7 = [v6 publishedColorLayers];
    BOOL v8 = [v6 publishedColorShapeLayers];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    id v12[2] = __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke_2;
    v12[3] = &unk_2644F9A10;
    char v15 = *(unsigned char *)(a1 + 40);
    id v13 = v7;
    id v14 = v8;
    id v9 = v8;
    id v10 = v7;
    id v11 = (void (**)(void, void, void, void))MEMORY[0x223C3D8D0](v12);
    ((void (**)(void, id, __CFString *, uint64_t))v11)[2](v11, v5, @"primary_highlight", 15);
    ((void (**)(void, id, __CFString *, uint64_t))v11)[2](v11, v5, @"primary-border/primary_highlight-background", 1);

    ((void (**)(void, void, __CFString *, uint64_t))v11)[2](v11, *(void *)(*(void *)(a1 + 32) + 600), @"secondary_highlight", 15);
  }
}

void __62__PKGlyphView__applyEffectiveHighlightColorsToLayersAnimated___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        LayerApplyColor(*(void **)(*((void *)&v23 + 1) + 8 * v13++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }
  id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        ShapeLayerApplyColor(*(void **)(*((void *)&v19 + 1) + 8 * v18++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)_setPrimaryColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    id v6 = (UIColor *)[v8 copy];
    primaryColor = self->_primaryColor;
    self->_primaryColor = v6;

    [(PKFingerprintGlyphView *)self->_fingerprintView setPrimaryColor:self->_primaryColor animated:v4];
    [(PKGlyphView *)self _applyEffectivePrimaryColorToLayersAnimated:v4];
  }
}

- (void)_applyEffectivePrimaryColorToLayersAnimated:(BOOL)a3
{
  v8[0] = MEMORY[0x263EF8330];
  id v8[2] = __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke;
  v8[3] = &unk_2644F9A88;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v3 = (void *)MEMORY[0x263F1CB00];
  BOOL v4 = self;
  id v5 = objc_msgSend(v3, "currentTraitCollection", v8[0], 3221225472);
  id v6 = (void *)MEMORY[0x263F1CB00];
  id v7 = [(PKGlyphView *)v4 traitCollection];

  [v6 setCurrentTraitCollection:v7];
  __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke((uint64_t)v8);
  [MEMORY[0x263F1CB00] setCurrentTraitCollection:v5];
}

void __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 504) setFinishedColor:*(void *)(*(void *)(a1 + 32) + 624) animated:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 624) CGColor];
  [*(id *)(*(void *)(a1 + 32) + 528) setColor:v2 animated:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 512) setPrimaryColor:v2 animated:*(unsigned __int8 *)(a1 + 40)];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_2;
  v4[3] = &unk_2644F9A60;
  char v5 = *(unsigned char *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  BOOL v3 = (void (**)(void, void))MEMORY[0x223C3D8D0](v4);
  v3[2](v3, *(void *)(*(void *)(a1 + 32) + 512));
  v3[2](v3, *(void *)(*(void *)(a1 + 32) + 544));
  v3[2](v3, *(void *)(*(void *)(a1 + 32) + 552));
}

void __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    BOOL v4 = [v3 publishedColorLayers];
    char v5 = [v3 publishedColorShapeLayers];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_3;
    v9[3] = &unk_2644F9A10;
    char v12 = *(unsigned char *)(a1 + 40);
    id v10 = v4;
    id v11 = v5;
    id v6 = v5;
    id v7 = v4;
    id v8 = (void (**)(void, void, void, void))MEMORY[0x223C3D8D0](v9);
    ((void (**)(void, void, __CFString *, uint64_t))v8)[2](v8, *(void *)(*(void *)(a1 + 32) + 624), @"primary", 15);
    ((void (**)(void, void, __CFString *, uint64_t))v8)[2](v8, *(void *)(*(void *)(a1 + 32) + 624), @"primary-border/primary_highlight-background", 2);
  }
}

void __59__PKGlyphView__applyEffectivePrimaryColorToLayersAnimated___block_invoke_3(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        LayerApplyColor(*(void **)(*((void *)&v23 + 1) + 8 * v13++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }
  id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        ShapeLayerApplyColor(*(void **)(*((void *)&v19 + 1) + 8 * v18++), v7, a4, *(unsigned __int8 *)(a1 + 48));
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (void)_setSecondaryColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    id v6 = (UIColor *)[v8 copy];
    secondaryColor = self->_secondaryColor;
    self->_secondaryColor = v6;

    [(PKFingerprintGlyphView *)self->_fingerprintView setSecondaryColor:self->_secondaryColor animated:v4];
  }
}

- (id)_primaryColorForStyle:(int64_t)a3 mode:(int64_t)a4
{
  pearlView = self->_pearlView;
  switch(a3)
  {
    case 0:
      if (!pearlView)
      {
        switch(a4)
        {
          case 0:
            goto LABEL_27;
          case 1:
          case 2:
          case 4:
            goto LABEL_11;
          case 3:
            goto LABEL_26;
          default:
            goto LABEL_25;
        }
      }
      goto LABEL_5;
    case 1:
      if (!pearlView)
      {
        switch(a4)
        {
          case 0:
          case 1:
            goto LABEL_27;
          case 2:
          case 4:
            goto LABEL_11;
          case 3:
            goto LABEL_26;
          default:
            goto LABEL_25;
        }
      }
      goto LABEL_5;
    case 2:
LABEL_5:
      BOOL v6 = a4 == 3;
      if ((unint64_t)a4 < 3) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 3:
      id v7 = (void *)MEMORY[0x263F1C550];
      double v8 = 0.744;
      double v12 = 1.0;
      double v9 = 0.744;
      double v10 = 0.744;
      goto LABEL_30;
    case 4:
      BOOL v6 = a4 == 3;
      if ((unint64_t)a4 < 3)
      {
        id v7 = (void *)MEMORY[0x263F1C550];
        double v8 = 1.0;
        double v9 = 1.0;
        double v10 = 1.0;
        goto LABEL_29;
      }
LABEL_9:
      if (v6)
      {
LABEL_26:
        uint64_t v11 = [MEMORY[0x263F1C550] systemRedColor];
      }
      else
      {
        if (a4 != 4) {
          goto LABEL_25;
        }
LABEL_11:
        uint64_t v11 = [MEMORY[0x263F1C550] systemBlueColor];
      }
      goto LABEL_31;
    case 5:
      goto LABEL_21;
    case 6:
      if (!pearlView)
      {
        switch(a4)
        {
          case 0:
LABEL_27:
            uint64_t v11 = [MEMORY[0x263F1C550] systemPinkColor];
            goto LABEL_31;
          case 1:
          case 2:
          case 4:
            goto LABEL_24;
          case 3:
            goto LABEL_26;
          default:
            goto LABEL_25;
        }
      }
      if ((unint64_t)a4 < 3) {
        goto LABEL_24;
      }
      if (a4 == 3) {
        goto LABEL_26;
      }
      if (a4 != 4) {
        goto LABEL_25;
      }
LABEL_24:
      uint64_t v11 = [MEMORY[0x263F1C550] labelColor];
      goto LABEL_31;
    case 7:
      if ((unint64_t)a4 < 3) {
        goto LABEL_21;
      }
      if (a4 == 3)
      {
        id v7 = (void *)MEMORY[0x263F1C550];
        double v8 = 0.9451;
        double v9 = 0.3686;
        double v10 = 0.3098;
LABEL_29:
        double v12 = 1.0;
LABEL_30:
        uint64_t v11 = [v7 colorWithRed:v8 green:v9 blue:v10 alpha:v12];
      }
      else
      {
        if (a4 != 4)
        {
LABEL_25:
          uint64_t v13 = 0;
          goto LABEL_32;
        }
LABEL_21:
        uint64_t v11 = [MEMORY[0x263F1C550] systemWhiteColor];
      }
LABEL_31:
      uint64_t v13 = (void *)v11;
LABEL_32:
      id v14 = -[PKGlyphView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v13, a4);

      return v14;
    default:
      goto LABEL_25;
  }
}

- (id)_secondaryColorForStyle:(int64_t)a3 mode:(int64_t)a4
{
  switch(a3)
  {
    case 0:
    case 6:
      uint64_t v6 = [MEMORY[0x263F1C550] systemGray3Color];
      goto LABEL_9;
    case 1:
    case 2:
    case 7:
      BOOL v4 = -[PKGlyphView _primaryColorForStyle:mode:](self, "_primaryColorForStyle:mode:");
      char v5 = [v4 colorWithAlphaComponent:0.5];

      break;
    case 3:
      id v7 = (void *)MEMORY[0x263F1C550];
      double v8 = 0.468;
      double v9 = 1.0;
      double v10 = 0.468;
      double v11 = 0.468;
      goto LABEL_7;
    case 4:
      id v7 = (void *)MEMORY[0x263F1C550];
      double v8 = 1.0;
      double v10 = 1.0;
      double v11 = 1.0;
      double v9 = 0.5;
LABEL_7:
      uint64_t v6 = [v7 colorWithRed:v8 green:v10 blue:v11 alpha:v9];
      goto LABEL_9;
    case 5:
      uint64_t v6 = [MEMORY[0x263F1C550] systemWhiteColor];
LABEL_9:
      char v5 = (void *)v6;
      break;
    default:
      char v5 = 0;
      break;
  }

  return v5;
}

- (void)_applyColorMode:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PKGlyphView *)self _primaryColorForStyle:self->_style mode:self->_colorMode];
  [(PKGlyphView *)self _setPrimaryColor:v5 animated:v3];

  id v6 = [(PKGlyphView *)self _secondaryColorForStyle:self->_style mode:self->_colorMode];
  [(PKGlyphView *)self _setSecondaryColor:v6 animated:v3];
}

- (void)setColorMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_colorMode != a3)
  {
    self->_colorMode = a3;
    [(PKGlyphView *)self _applyColorMode:a4];
  }
}

- (BOOL)fadeOnRecognized
{
  return [(PKFingerprintGlyphView *)self->_fingerprintView fadeOnRecognized];
}

- (void)setFadeOnRecognized:(BOOL)a3
{
}

- (void)setCustomImage:(CGImage *)a3 withAlignmentEdgeInsets:(UIEdgeInsets)a4
{
  self->_customImageAlignmentEdgeInsets = a4;
  customImage = self->_customImage;
  if (customImage == a3)
  {
    [(PKGlyphView *)self setNeedsLayout];
  }
  else
  {
    BOOL v7 = customImage != 0;
    if (customImage)
    {
      CFRelease(self->_customImage);
      self->_customImage = 0;
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_customImage = a3;
    double v8 = self->_customImageLayer;
    [(CALayer *)v8 opacity];
    float v10 = v9;
    if ((v9 <= 0.0 || [(CALayer *)v8 isHidden])
      && (([(CALayer *)v8 animationKeys],
           double v11 = objc_claimAutoreleasedReturnValue(),
           uint64_t v12 = [v11 count],
           v11,
           customImage)
        ? (BOOL v13 = v12 == 0)
        : (BOOL v13 = 1),
          v13 ? (BOOL v7 = 0) : (BOOL v7 = 1),
          !v12))
    {
      BOOL v7 = 0;
    }
    else
    {
      LODWORD(v12) = self->_customImage != 0;
    }
    id v14 = [(PKGlyphView *)self createCustomImageLayer];
    customImageLayer = self->_customImageLayer;
    self->_customImageLayer = v14;

    if (v7)
    {
      uint64_t v16 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v16, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, 0.0);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke;
      v23[3] = &unk_2644F9AB0;
      uint64_t v17 = v8;
      long long v24 = v17;
      objc_msgSend(v16, "pkui_setCompletionHandler:", v23);
      id v18 = (id)[(CALayer *)v17 pkui_addAdditiveAnimation:v16];
      [(CALayer *)v17 setOpacity:0.0];
    }
    else
    {
      [(CALayer *)v8 removeFromSuperlayer];
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke_2;
    v22[3] = &unk_2644F8CF8;
    void v22[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v22];
    if (v12)
    {
      long long v20 = [MEMORY[0x263F5C280] springAnimationWithKeyPath:@"opacity"];
      objc_msgSend(v20, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, v10);
      id v21 = (id)[(CALayer *)self->_customImageLayer pkui_addAdditiveAnimation:v20];
    }
    *(float *)&double v19 = v10;
    [(CALayer *)self->_customImageLayer setOpacity:v19];
  }
}

uint64_t __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

uint64_t __54__PKGlyphView_setCustomImage_withAlignmentEdgeInsets___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = (CGImage *)v2[79];
  if (v3)
  {
    BOOL v4 = (void *)v2[71];
    double v5 = *MEMORY[0x263F00148];
    double v6 = *(double *)(MEMORY[0x263F00148] + 8);
    double Width = (double)CGImageGetWidth(v3);
    objc_msgSend(v4, "setBounds:", v5, v6, Width, (double)CGImageGetHeight(*(CGImageRef *)(*(void *)(a1 + 32) + 632)));
    [*(id *)(*(void *)(a1 + 32) + 568) setContents:*(void *)(*(void *)(a1 + 32) + 632)];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  double v8 = (void *)v2[63];
  if (!v8) {
    double v8 = (void *)v2[62];
  }
  [v8 setNeedsLayout];
  uint64_t v9 = *(void *)(a1 + 32);
  float v10 = *(void **)(v9 + 504);
  if (!v10) {
    float v10 = *(void **)(v9 + 496);
  }

  return [v10 layoutIfNeeded];
}

- (id)createCustomImageLayer
{
  id v3 = objc_alloc_init(MEMORY[0x263F157E8]);
  BOOL v4 = PKLayerNullActions();
  [v3 setActions:v4];

  [v3 setOpacity:0.0];
  double v5 = [(PKGlyphView *)self layer];
  [v5 contentsScale];
  objc_msgSend(v3, "setContentsScale:");

  customImageLayer = self->_customImageLayer;
  if (customImageLayer)
  {
    BOOL v7 = [(CALayer *)customImageLayer superlayer];
    [v7 insertSublayer:v3 above:self->_customImageLayer];
  }

  return v3;
}

- (void)setShowQRCode:(BOOL)a3
{
  if (((!self->_showQRCode ^ a3) & 1) == 0)
  {
    self->_showQRCode = a3;
    -[PKPhoneGlyphLayer setShowQRCode:](self->_phoneLayer, "setShowQRCode:");
  }
}

- (CATransform3D)_phoneTransformDeltaWhileShownFromRotationPercentage:(SEL)a3 toPercentage:(double)a4
{
  double v6 = fmin(fmax(a4, 0.0), 1.0);
  double v7 = fmin(fmax(a5, 0.0), 1.0);
  double v8 = (1.0 - v7 + v7 * 0.79) / (1.0 - v6 + v6 * 0.79);
  uint64_t v9 = (long long *)MEMORY[0x263F15740];
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  *(_OWORD *)&retstr->m31 = v10;
  *(_OWORD *)&retstr->m33 = v11;
  long long v12 = v9[6];
  long long v13 = v9[7];
  double v14 = v6 * 0.855211333;
  *(_OWORD *)&retstr->m41 = v12;
  *(_OWORD *)&retstr->m43 = v13;
  long long v15 = *v9;
  long long v16 = v9[1];
  *(_OWORD *)&retstr->m11 = *v9;
  *(_OWORD *)&retstr->m13 = v16;
  long long v17 = v9[2];
  long long v18 = v9[3];
  *(_OWORD *)&retstr->m21 = v17;
  *(_OWORD *)&retstr->m23 = v18;
  if (v14 != 0.0)
  {
    *(_OWORD *)&v41.m31 = v10;
    *(_OWORD *)&v41.m33 = v11;
    *(_OWORD *)&v41.m41 = v12;
    *(_OWORD *)&v41.m43 = v13;
    *(_OWORD *)&v41.m11 = v15;
    *(_OWORD *)&v41.m13 = v16;
    *(_OWORD *)&v41.m21 = v17;
    *(_OWORD *)&v41.m23 = v18;
    self = CATransform3DRotate(&v42, &v41, -v14, 1.0, 0.0, 0.0);
    long long v19 = *(_OWORD *)&v42.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v42.m31;
    *(_OWORD *)&retstr->m33 = v19;
    long long v20 = *(_OWORD *)&v42.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v42.m41;
    *(_OWORD *)&retstr->m43 = v20;
    long long v21 = *(_OWORD *)&v42.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v42.m11;
    *(_OWORD *)&retstr->m13 = v21;
    long long v22 = *(_OWORD *)&v42.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v42.m21;
    *(_OWORD *)&retstr->m23 = v22;
  }
  double v23 = v7 * 0.855211333;
  if (v8 != 0.0 && v8 != 1.0)
  {
    long long v25 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v41.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v41.m33 = v25;
    long long v26 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v41.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v41.m43 = v26;
    long long v27 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v41.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v41.m13 = v27;
    long long v28 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v41.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v41.m23 = v28;
    self = CATransform3DScale(&v42, &v41, v8, v8, 1.0);
    long long v29 = *(_OWORD *)&v42.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v42.m31;
    *(_OWORD *)&retstr->m33 = v29;
    long long v30 = *(_OWORD *)&v42.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v42.m41;
    *(_OWORD *)&retstr->m43 = v30;
    long long v31 = *(_OWORD *)&v42.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v42.m11;
    *(_OWORD *)&retstr->m13 = v31;
    long long v32 = *(_OWORD *)&v42.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v42.m21;
    *(_OWORD *)&retstr->m23 = v32;
  }
  if (v23 != 0.0)
  {
    long long v33 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v41.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v41.m33 = v33;
    long long v34 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v41.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v41.m43 = v34;
    long long v35 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v41.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v41.m13 = v35;
    long long v36 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v41.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v41.m23 = v36;
    self = CATransform3DRotate(&v42, &v41, v23, 1.0, 0.0, 0.0);
    long long v37 = *(_OWORD *)&v42.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v42.m31;
    *(_OWORD *)&retstr->m33 = v37;
    long long v38 = *(_OWORD *)&v42.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v42.m41;
    *(_OWORD *)&retstr->m43 = v38;
    long long v39 = *(_OWORD *)&v42.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v42.m11;
    *(_OWORD *)&retstr->m13 = v39;
    long long v40 = *(_OWORD *)&v42.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v42.m21;
    *(_OWORD *)&retstr->m23 = v40;
  }
  return self;
}

- (CGPoint)_phonePositionWhileShownWithRotationPercentage:(double)a3
{
  double v5 = [(LAUIPearlGlyphView *)self->_pearlView contentLayer];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(PKFingerprintGlyphView *)self->_fingerprintView contentLayer];
  }
  double v8 = v7;
  double v9 = fmin(fmax(a3, 0.0), 1.0);

  [v8 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(PKPhoneGlyphLayer *)self->_phoneLayer bounds];
  double v19 = v18;
  double v21 = v20;
  [(PKPhoneGlyphLayer *)self->_phoneLayer anchorPoint];
  double v24 = v11 + v23 * v19 + (v15 - v19) * 0.5;
  double v25 = v13 + (1.0 - v9) * (v17 * 0.25 + v22 * v21) + v9 * (v17 + v17 * -0.024 - v21 + v22 * v21);

  double v26 = v24;
  double v27 = v25;
  result.y = v27;
  result.x = v26;
  return result;
}

- (CGPoint)_phonePositionDeltaWhileShownFromRotationPercentage:(double)a3 toPercentage:(double)a4
{
  [(PKGlyphView *)self _phonePositionWhileShownWithRotationPercentage:a3];
  double v7 = v6;
  double v9 = v8;
  [(PKGlyphView *)self _phonePositionWhileShownWithRotationPercentage:a4];
  double v11 = v10 - v7;
  double v13 = v12 - v9;
  result.y = v13;
  result.x = v11;
  return result;
}

- (void)fingerprintGlyphView:(id)a3 didLayoutContentLayer:(id)a4
{
}

- (void)pearlGlyphView:(id)a3 didLayoutContentLayer:(id)a4
{
}

- (int64_t)colorMode
{
  return self->_colorMode;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIEdgeInsets)customImageAlignmentEdgeInsets
{
  double top = self->_customImageAlignmentEdgeInsets.top;
  double left = self->_customImageAlignmentEdgeInsets.left;
  double bottom = self->_customImageAlignmentEdgeInsets.bottom;
  double right = self->_customImageAlignmentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGImage)customImage
{
  return self->_customImage;
}

- (int64_t)state
{
  return self->_state;
}

- (unsigned)userIntentEdge
{
  return self->_userIntentEdge;
}

- (PKGlyphViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKGlyphViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showQRCode
{
  return self->_showQRCode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryHighlightColor, 0);
  objc_storeStrong((id *)&self->_intentPrimaryHighlightColor, 0);
  objc_storeStrong((id *)&self->_primaryHighlightColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_customImageLayer, 0);
  objc_storeStrong((id *)&self->_userIntentDeviceLayer, 0);
  objc_storeStrong((id *)&self->_userIntentArrowLayer, 0);
  objc_storeStrong((id *)&self->_userIntentLayer, 0);
  objc_storeStrong((id *)&self->_checkLayer, 0);
  objc_storeStrong((id *)&self->_phoneLayer, 0);
  objc_storeStrong((id *)&self->_pearlView, 0);
  objc_storeStrong((id *)&self->_fingerprintView, 0);
  objc_storeStrong((id *)&self->_phoneWiggleAnimationKey, 0);
  objc_storeStrong((id *)&self->_lastAnimationGroup, 0);

  objc_storeStrong((id *)&self->_transitionCompletionHandlers, 0);
}

@end