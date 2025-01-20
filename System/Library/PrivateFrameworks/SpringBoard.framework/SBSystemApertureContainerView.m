@interface SBSystemApertureContainerView
+ (double)_defaultCornerRadiusForBounds:(CGRect)a3 inWindow:(id)a4;
- (BOOL)_isInRotationTransition;
- (BOOL)isContentClippingEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSUUID)interfaceElementIdentifier;
- (SAUIElementViewControlling)elementViewController;
- (SAUIElementViewControlling)outgoingElementViewController;
- (SBSAContainerViewDescription)containerViewDescription;
- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration;
- (SBSystemApertureContainerView)initWithInterfaceElementIdentifier:(id)a3;
- (SBSystemApertureContainerViewDelegate)delegate;
- (SBSystemApertureElementOrientationAuthority)elementOrientationAuthority;
- (UIColor)keyLineTintColor;
- (UIView)scalingContentView;
- (id)_generateAccessibilityIdentifier;
- (id)_validatedKeyLineTintColor;
- (int64_t)activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:(id)a3;
- (int64_t)keyLineMode;
- (int64_t)sampledBackgroundLuminanceLevel;
- (int64_t)shadowStyle;
- (unint64_t)rank;
- (void)_applySettingsValues;
- (void)_layoutHitTestViewWithBounds:(CGRect)a3;
- (void)_setContentViewTransform:(CGAffineTransform *)a3 elementViewControllerInterfaceOrientation:(int64_t)a4;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_updateContentViewTransformImmediately;
- (void)_updateKeyLineFilters;
- (void)_updateShadowStyleIfNeeded;
- (void)addContentSubview:(id)a3;
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
- (void)elementOrientationDidChangeWithTransitionCoordinator:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContentClippingEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setElementOrientationAuthority:(id)a3;
- (void)setElementViewController:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIDCornerRadius:(double)a3;
- (void)setKeyLineMode:(int64_t)a3;
- (void)setKeyLineTintColor:(id)a3;
- (void)setNeedsLayout;
- (void)setRank:(unint64_t)a3;
- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3;
- (void)setShadowStyle:(int64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SBSystemApertureContainerView

- (UIView)scalingContentView
{
  return self->_scalingContentView;
}

void __57__SBSystemApertureContainerView_containerViewDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSystemApertureContainerView.m", 339, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  v14 = [*(id *)(a1 + 32) interfaceElementIdentifier];
  [v7 setInterfaceElementIdentifier:v14];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 712));
  v16 = [WeakRetained elementViewProvider];
  v17 = [v16 element];
  [v7 setAssociatedSystemApertureElementIdentity:v17];

  [*(id *)(a1 + 32) center];
  objc_msgSend(v7, "setCenter:");
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v7, "setBounds:");
  v18 = [*(id *)(a1 + 32) _velocityForKey:@"bounds"];
  [v18 CGRectValue];
  objc_msgSend(v7, "setBoundsVelocity:");

  [*(id *)(a1 + 32) IDCornerRadius];
  objc_msgSend(v7, "setCornerRadius:");
  [*(id *)(a1 + 32) alpha];
  objc_msgSend(v7, "setAlpha:");
  objc_msgSend(v7, "setKeyLineMode:", objc_msgSend(*(id *)(a1 + 32), "keyLineMode"));
  v19 = [*(id *)(a1 + 32) keyLineTintColor];
  [v7 setKeyLineTintColor:v19];

  objc_msgSend(v7, "setSampledBackgroundLuminanceLevel:", objc_msgSend(*(id *)(a1 + 32), "sampledBackgroundLuminanceLevel"));
  v20 = *(void **)(a1 + 32);
  if (v20) {
    [v20 renderingConfiguration];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  [v7 setRenderingConfiguration:v21];
}

- (NSUUID)interfaceElementIdentifier
{
  return self->_interfaceElementIdentifier;
}

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  result = (SBSystemApertureContainerRenderingConfiguration *)self->_gainMapView;
  if (result) {
    return (SBSystemApertureContainerRenderingConfiguration *)[(SBSystemApertureContainerRenderingConfiguration *)result renderingConfiguration];
  }
  retstr->renderingStyle = 0;
  retstr->cloningStyle = 0;
  *(void *)&retstr->alwaysRenderInSnapshots = 0;
  return result;
}

- (UIColor)keyLineTintColor
{
  v2 = (void *)[(UIColor *)self->_keyLineTintColor copy];
  return (UIColor *)v2;
}

- (int64_t)keyLineMode
{
  return self->_keyLineMode;
}

- (int64_t)sampledBackgroundLuminanceLevel
{
  return self->_sampledBackgroundLuminanceLevel;
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (SBSAContainerViewDescription)containerViewDescription
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SBSystemApertureContainerView_containerViewDescription__block_invoke;
  v4[3] = &unk_1E6AF53A0;
  v4[4] = self;
  v4[5] = a2;
  v2 = +[SBSAViewDescription instanceWithBlock:v4];
  return (SBSAContainerViewDescription *)v2;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSystemApertureContainerView;
  if (-[SBSystemApertureContainerView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    hitTestView = self->_hitTestView;
    -[SBSystemApertureContainerView convertPoint:toView:](self, "convertPoint:toView:", hitTestView, x, y);
    char v8 = -[UIView pointInside:withEvent:](hitTestView, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (SAUIElementViewControlling)elementViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  return (SAUIElementViewControlling *)WeakRetained;
}

- (void)setElementViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_elementViewController);
    objc_storeWeak((id *)&self->_outgoingElementViewController, v5);
    objc_storeWeak((id *)&self->_elementViewController, obj);
    [(SBSystemApertureContainerView *)self _updateContentViewTransformImmediately];
    [(SBSystemApertureContainerView *)self setContentClippingEnabled:1];
    v6 = [(SBSystemApertureContainerView *)self _generateAccessibilityIdentifier];
    [(SBSystemApertureContainerView *)self setAccessibilityIdentifier:v6];
  }
}

- (void)setRank:(unint64_t)a3
{
  if (self->_rank != a3)
  {
    self->_rank = a3;
    id v4 = [(SBSystemApertureContainerView *)self _generateAccessibilityIdentifier];
    [(SBSystemApertureContainerView *)self setAccessibilityIdentifier:v4];
  }
}

- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  gainMapView = self->_gainMapView;
  SBSystemApertureContainerRenderingConfiguration v7 = *a3;
  [(_SBSystemApertureGainMapView *)gainMapView setRenderingConfiguration:&v7];
  BOOL v6 = a3->renderingStyle == 1;
  [(_UILumaTrackingBackdropView *)self->_backgroundLumaSamplingBackdrop setHidden:v6];
  [(UIView *)self->_darkBkgKeyLineView setHidden:v6];
  [(_SBAdaptiveKeyLineBackdropView *)self->_lightBkgKeyLineView setHidden:v6];
  [(UIView *)self->_blobEnablingBlackFillView setHidden:v6];
  [(UIView *)self->_contentClippingView setHidden:v6];
  [(UIView *)self->_rotatingContentView setHidden:v6];
  [(UIView *)self->_scalingContentView setHidden:v6];
  [(UIView *)self->_shadowView setHidden:v6];
}

- (SBSystemApertureContainerView)initWithInterfaceElementIdentifier:(id)a3
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, self, @"SBSystemApertureContainerView.m", 169, @"Invalid parameter not satisfying: %@", @"interfaceElementIdentifier" object file lineNumber description];
  }
  v98.receiver = self;
  v98.super_class = (Class)SBSystemApertureContainerView;
  BOOL v6 = -[SBSystemApertureContainerView initWithFrame:](&v98, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    id v92 = v5;
    uint64_t v7 = [v5 copy];
    interfaceElementIdentifier = v6->_interfaceElementIdentifier;
    v6->_interfaceElementIdentifier = (NSUUID *)v7;

    uint64_t v9 = +[SBSystemApertureDomain rootSettings];
    settings = v6->_settings;
    v6->_settings = (SBSystemApertureSettings *)v9;

    [(PTSettings *)v6->_settings addKeyObserver:v6];
    objc_super v11 = [(SBSystemApertureSettings *)v6->_settings adaptiveKeyLineColorMatrix];
    [v11 addKeyObserver:v6];

    [(SBSystemApertureContainerView *)v6 _applySettingsValues];
    [(SBSystemApertureContainerView *)v6 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    hitTestView = v6->_hitTestView;
    v6->_hitTestView = v20;

    v22 = [(UIView *)v6->_hitTestView layer];
    v93 = v6;
    [v22 setHitTestsAsOpaque:1];

    [(SBSystemApertureContainerView *)v93 addSubview:v93->_hitTestView];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v15, v17, v19);
    contentClippingView = v6->_contentClippingView;
    v6->_contentClippingView = (UIView *)v23;

    [(UIView *)v6->_contentClippingView setClipsToBounds:1];
    [(SBSystemApertureContainerView *)v93 addSubview:v93->_contentClippingView];
    [(UIView *)v6->_contentClippingView setAutoresizingMask:18];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v15, v17, v19);
    subBackgroundGroupingView = v6->_subBackgroundGroupingView;
    v6->_subBackgroundGroupingView = (UIView *)v25;

    [(UIView *)v93->_contentClippingView addSubview:v93->_subBackgroundGroupingView];
    id v27 = objc_alloc(MEMORY[0x1E4F43240]);
    [(SBSystemApertureSettings *)v6->_settings keyLineDarkToMixedMinLuma];
    double v29 = v28;
    [(SBSystemApertureSettings *)v6->_settings keyLineMixedToDarkMaxLuma];
    double v31 = v30;
    [(SBSystemApertureContainerView *)v6 bounds];
    uint64_t v36 = objc_msgSend(v27, "initWithTransitionBoundaries:delegate:frame:", v6, v29, v31, v32, v33, v34, v35);
    backgroundLumaSamplingBackdrop = v6->_backgroundLumaSamplingBackdrop;
    v6->_backgroundLumaSamplingBackdrop = (_UILumaTrackingBackdropView *)v36;

    v6->_sampledBackgroundLuminanceLevel = 0;
    [(UIView *)v93->_subBackgroundGroupingView addSubview:v93->_backgroundLumaSamplingBackdrop];
    v38 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    darkBkgKeyLineView = v6->_darkBkgKeyLineView;
    v6->_darkBkgKeyLineView = v38;

    [(UIView *)v6->_darkBkgKeyLineView setAlpha:0.0];
    uint64_t v40 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    v41 = [(UIView *)v6->_darkBkgKeyLineView layer];
    v91 = (void *)v40;
    v102[0] = v40;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
    [v41 setFilters:v42];

    [(UIView *)v93->_subBackgroundGroupingView addSubview:v93->_darkBkgKeyLineView];
    v43 = objc_alloc_init(_SBAdaptiveKeyLineBackdropView);
    lightBkgKeyLineView = v93->_lightBkgKeyLineView;
    v93->_lightBkgKeyLineView = v43;

    v45 = [(_SBAdaptiveKeyLineBackdropView *)v93->_lightBkgKeyLineView backdropLayer];
    [v45 setAllowsInPlaceFiltering:1];

    [(_SBAdaptiveKeyLineBackdropView *)v93->_lightBkgKeyLineView setAlpha:0.0];
    [(SBSystemApertureContainerView *)v93 _updateKeyLineFilters];
    [(UIView *)v93->_subBackgroundGroupingView addSubview:v93->_lightBkgKeyLineView];
    v46 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    shadowView = v93->_shadowView;
    v93->_shadowView = v46;

    v48 = [(UIView *)v93->_shadowView layer];
    id v49 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v48, "setShadowColor:", objc_msgSend(v49, "CGColor"));

    v50 = [(UIView *)v93->_shadowView layer];
    [v50 setShadowOpacity:0.0];

    v51 = [(UIView *)v93->_shadowView layer];
    [v51 setShadowPathIsBounds:1];

    v93->_needsShadowStyleUpdate = 1;
    v52 = v93;
    [(UIView *)v93->_subBackgroundGroupingView addSubview:v93->_shadowView];
    v53 = objc_alloc_init(_SBSystemApertureGainMapView);
    gainMapView = v93->_gainMapView;
    v93->_gainMapView = v53;

    [(UIView *)v52->_subBackgroundGroupingView addSubview:v52->_gainMapView];
    uint64_t v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v15, v17, v19);
    backgroundGroupingView = v93->_backgroundGroupingView;
    v93->_backgroundGroupingView = (UIView *)v55;

    [(UIView *)v52->_contentClippingView addSubview:v52->_backgroundGroupingView];
    v57 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    blobEnablingBlackFillView = v93->_blobEnablingBlackFillView;
    v93->_blobEnablingBlackFillView = v57;

    v59 = v93->_blobEnablingBlackFillView;
    v60 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v59 setBackgroundColor:v60];

    [(UIView *)v93->_blobEnablingBlackFillView setClipsToBounds:1];
    [(UIView *)v52->_backgroundGroupingView addSubview:v52->_blobEnablingBlackFillView];
    uint64_t v61 = MEMORY[0x1E4F1DAB8];
    long long v62 = *MEMORY[0x1E4F1DAB8];
    long long v63 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v93->_previousContentTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v93->_previousContentTransform.c = v63;
    long long v64 = *(_OWORD *)(v61 + 32);
    *(_OWORD *)&v93->_previousContentTransform.tdouble x = v64;
    *(_OWORD *)&v93->_activeContentRotationTransform.a = v62;
    *(_OWORD *)&v93->_activeContentRotationTransform.c = v63;
    *(_OWORD *)&v93->_activeContentRotationTransform.tdouble x = v64;
    v65 = objc_alloc_init(_SBSystemApertureContainerViewScalingContentView);
    scalingContentView = v93->_scalingContentView;
    v93->_scalingContentView = &v65->super.super;

    v67 = objc_alloc_init(_SBSystemApertureContainerViewRotatingContentView);
    rotatingContentView = v93->_rotatingContentView;
    v93->_rotatingContentView = &v67->super.super;

    v69 = v93->_scalingContentView;
    uint64_t v70 = objc_opt_class();
    v71 = v69;
    if (v70)
    {
      if (objc_opt_isKindOfClass()) {
        v72 = v71;
      }
      else {
        v72 = 0;
      }
    }
    else
    {
      v72 = 0;
    }
    v73 = v72;

    [(UIView *)v73 setContentView:v93->_rotatingContentView];
    [(UIView *)v93->_contentClippingView addSubview:v93->_scalingContentView];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v74 = [(SBSystemApertureContainerView *)v93 layer];
    v100[0] = v74;
    v75 = [(UIView *)v93->_subBackgroundGroupingView layer];
    v100[1] = v75;
    v76 = [(UIView *)v93->_backgroundGroupingView layer];
    v100[2] = v76;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3];

    uint64_t v78 = [v77 countByEnumeratingWithState:&v94 objects:v101 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v95;
      uint64_t v81 = *MEMORY[0x1E4F3A030];
      uint64_t v82 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t i = 0; i != v79; ++i)
        {
          if (*(void *)v95 != v80) {
            objc_enumerationMutation(v77);
          }
          v84 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          v85 = [MEMORY[0x1E4F39BC0] filterWithType:v81];
          [v85 setValue:v82 forKey:@"inputReversed"];
          v99 = v85;
          v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
          [v84 setFilters:v86];
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v94 objects:v101 count:16];
      }
      while (v79);
    }

    BOOL v6 = v93;
    v87 = [(SBSystemApertureContainerView *)v93 layer];
    [v87 setHitTestsAsOpaque:1];

    v88 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v88 addObserver:v93 selector:sel__invertColorsChanged_ name:*MEMORY[0x1E4F43440] object:0];

    id v5 = v92;
  }

  return v6;
}

- (BOOL)isContentClippingEnabled
{
  return [(UIView *)self->_contentClippingView clipsToBounds];
}

- (void)setContentClippingEnabled:(BOOL)a3
{
}

- (void)addContentSubview:(id)a3
{
  id v4 = a3;
  id v5 = self->_rotatingContentView;
  BOOL v6 = [v4 superview];

  if (v6 != v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__SBSystemApertureContainerView_addContentSubview___block_invoke;
    v8[3] = &unk_1E6AF5290;
    uint64_t v9 = v5;
    id v10 = v4;
    [v7 _performWithoutRetargetingAnimations:v8];
  }
}

uint64_t __51__SBSystemApertureContainerView_addContentSubview___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 setContentView:*(void *)(a1 + 40)];
  uint64_t v7 = *(void **)(a1 + 40);
  return [v7 layoutIfNeeded];
}

- (void)setKeyLineMode:(int64_t)a3
{
  if (self->_keyLineMode != a3)
  {
    int64_t v3 = a3;
    self->_keyLineMode = a3;
    if (![(SBSystemApertureSettings *)self->_settings keyLineEnabled]) {
      int64_t v3 = 0;
    }
    [(_UILumaTrackingBackdropView *)self->_backgroundLumaSamplingBackdrop setPaused:v3 == 0];
    if (v3 == 2)
    {
      [(UIView *)self->_darkBkgKeyLineView setAlpha:*(double *)&SBSystemApertureKeyLineDarkBkgEnabledOpacity];
      double v5 = 0.0;
    }
    else if (v3 == 1)
    {
      [(UIView *)self->_darkBkgKeyLineView setAlpha:0.0];
      double v5 = 1.0;
    }
    else
    {
      if (v3) {
        return;
      }
      double v5 = 0.0;
      [(UIView *)self->_darkBkgKeyLineView setAlpha:0.0];
    }
    lightBkgKeyLineView = self->_lightBkgKeyLineView;
    [(_SBAdaptiveKeyLineBackdropView *)lightBkgKeyLineView setAlpha:v5];
  }
}

- (void)setKeyLineTintColor:(id)a3
{
  id v9 = a3;
  if ((-[UIColor isEqual:](self->_keyLineTintColor, "isEqual:") & 1) == 0)
  {
    id v4 = (UIColor *)[v9 copy];
    keyLineTintColor = self->_keyLineTintColor;
    self->_keyLineTintColor = v4;

    cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
    self->_cachedValidatedKeyLineTintColor = 0;

    darkBkgKeyLineView = self->_darkBkgKeyLineView;
    char v8 = [(SBSystemApertureContainerView *)self _validatedKeyLineTintColor];
    [(UIView *)darkBkgKeyLineView setBackgroundColor:v8];
  }
}

- (void)setShadowStyle:(int64_t)a3
{
  if (self->_shadowStyle != a3)
  {
    self->_shadowStyle = a3;
    self->_needsShadowStyleUpdate = 1;
    [(SBSystemApertureContainerView *)self _updateShadowStyleIfNeeded];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBSystemApertureContainerView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  [(SBSystemApertureContainerView *)self frame];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22)) {
    [(SBSystemApertureContainerView *)self setNeedsLayout];
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SBSystemApertureContainerView *)self center];
  double v7 = v6;
  double v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView setCenter:](&v13, sel_setCenter_, x, y);
  [(SBSystemApertureContainerView *)self center];
  if (v7 != v11 || v9 != v10) {
    [(SBSystemApertureContainerView *)self setNeedsLayout];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBSystemApertureContainerView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  [(SBSystemApertureContainerView *)self bounds];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22)) {
    [(SBSystemApertureContainerView *)self setNeedsLayout];
  }
}

- (void)_layoutHitTestViewWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v19 = 0;
    objc_msgSend(WeakRetained, "systemApertureContainerView:hitRectForBounds:debugColor:", self, &v19, x, y, width, height);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    hitTestView = self->_hitTestView;
    id v18 = v19;
    -[UIView setFrame:](hitTestView, "setFrame:", v10, v12, v14, v16);
    [(UIView *)self->_hitTestView setBackgroundColor:v18];
  }
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SBSystemApertureContainerView;
  [(SBSystemApertureContainerView *)&v28 layoutSubviews];
  [(SBSystemApertureContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SBSystemApertureContainerView *)self frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[UIView setFrame:](self->_subBackgroundGroupingView, "setFrame:");
  -[UIView setFrame:](self->_backgroundGroupingView, "setFrame:", v12, v14, v16, v18);
  double top = self->_gainMapLayerInsets.top;
  double left = self->_gainMapLayerInsets.left;
  double v21 = v4 + left;
  double v22 = v6 + top;
  double v23 = v8 - (left + self->_gainMapLayerInsets.right);
  double v24 = v10 - (top + self->_gainMapLayerInsets.bottom);
  -[_UILumaTrackingBackdropView setFrame:](self->_backgroundLumaSamplingBackdrop, "setFrame:", v4 + left, v6 + top, v23, v24);
  -[UIView setFrame:](self->_shadowView, "setFrame:", v21 + 1.0, v22 + 1.0, v23 + -2.0, v24 + -2.0);
  -[UIView setFrame:](self->_darkBkgKeyLineView, "setFrame:", v21 - *(double *)&SBSystemApertureKeyLineThickness, v22 - *(double *)&SBSystemApertureKeyLineThickness, v23 - (-*(double *)&SBSystemApertureKeyLineThickness - *(double *)&SBSystemApertureKeyLineThickness), v24 - (-*(double *)&SBSystemApertureKeyLineThickness - *(double *)&SBSystemApertureKeyLineThickness));
  -[_SBAdaptiveKeyLineBackdropView setFrame:](self->_lightBkgKeyLineView, "setFrame:", v21 - *(double *)&SBSystemApertureAdaptiveKeyLineThickness, v22 - *(double *)&SBSystemApertureAdaptiveKeyLineThickness, v23 - (-*(double *)&SBSystemApertureAdaptiveKeyLineThickness - *(double *)&SBSystemApertureAdaptiveKeyLineThickness), v24 - (-*(double *)&SBSystemApertureAdaptiveKeyLineThickness - *(double *)&SBSystemApertureAdaptiveKeyLineThickness));
  -[_SBSystemApertureGainMapView setFrame:](self->_gainMapView, "setFrame:", v21, v22, v23, v24);
  -[UIView setFrame:](self->_blobEnablingBlackFillView, "setFrame:", v21 + 0.666666667, v22 + 0.666666667, v23 + -1.33333333, v24 + -1.33333333);
  -[SBSystemApertureContainerView _layoutHitTestViewWithBounds:](self, "_layoutHitTestViewWithBounds:", v4, v6, v8, v10);
  rotatingContentView = self->_rotatingContentView;
  long long v26 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  v27[0] = *(_OWORD *)&self->_activeContentRotationTransform.a;
  v27[1] = v26;
  v27[2] = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  [(UIView *)rotatingContentView setTransform:v27];
  [(SBSystemApertureContainerView *)self _updateShadowStyleIfNeeded];
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureContainerView;
  [(SBSystemApertureContainerView *)&v3 setNeedsLayout];
  [(UIView *)self->_rotatingContentView setNeedsLayout];
  [(UIView *)self->_scalingContentView setNeedsLayout];
}

- (void)willMoveToSuperview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBSystemApertureContainerView;
  -[SBSystemApertureContainerView willMoveToSuperview:](&v8, sel_willMoveToSuperview_);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v6 = [WeakRetained parentViewForSubBackgroundForSystemApertureContainerView:self];
    [v6 addSubview:self->_subBackgroundGroupingView];

    double v7 = [WeakRetained parentViewForBackgroundForSystemApertureContainerView:self];
    [v7 addSubview:self->_backgroundGroupingView];
  }
  else
  {
    [(UIView *)self->_contentClippingView insertSubview:self->_subBackgroundGroupingView atIndex:0];
    [(UIView *)self->_contentClippingView insertSubview:self->_backgroundGroupingView atIndex:1];
  }
}

- (void)setIDCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureContainerView;
  -[UIView setIDCornerRadius:](&v5, sel_setIDCornerRadius_);
  [(_UILumaTrackingBackdropView *)self->_backgroundLumaSamplingBackdrop setIDCornerRadius:a3];
  [(UIView *)self->_shadowView setIDCornerRadius:a3 + -1.0];
  [(UIView *)self->_darkBkgKeyLineView setIDCornerRadius:*(double *)&SBSystemApertureKeyLineThickness + a3];
  [(UIView *)self->_lightBkgKeyLineView setIDCornerRadius:*(double *)&SBSystemApertureAdaptiveKeyLineThickness + a3];
  [(_SBSystemApertureGainMapView *)self->_gainMapView setIDCornerRadius:a3];
  [(UIView *)self->_blobEnablingBlackFillView setIDCornerRadius:a3 + -0.666666667];
  [(UIView *)self->_scalingContentView setIDCornerRadius:a3];
  [(UIView *)self->_contentClippingView setIDCornerRadius:a3];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContainerView.m" lineNumber:449 description:@"use -[UIView setIDCornerRadius:] instead"];

  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureContainerView;
  [(SBSystemApertureContainerView *)&v7 _setContinuousCornerRadius:a3];
}

- (void)_setCornerRadius:(double)a3
{
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"SBSystemApertureContainerView.m" lineNumber:454 description:@"use -[UIView setIDCornerRadius:] instead"];

  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureContainerView;
  [(SBSystemApertureContainerView *)&v7 _setCornerRadius:a3];
}

- (void)_updateContentViewTransformImmediately
{
  int64_t v3 = [(SBSystemApertureContainerView *)self activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:self];
  +[SBSystemApertureViewControllerRotationTransitionContext transformForRotationToInterfaceOrientation:v3];
  long long v4 = v9;
  *(_OWORD *)&self->_activeContentRotationTransform.a = v8;
  *(_OWORD *)&self->_activeContentRotationTransform.c = v4;
  *(_OWORD *)&self->_activeContentRotationTransform.tdouble x = v10;
  long long v6 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  long long v5 = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  *(_OWORD *)&self->_previousContentTransform.a = *(_OWORD *)&self->_activeContentRotationTransform.a;
  *(_OWORD *)&self->_previousContentTransform.c = v6;
  *(_OWORD *)&self->_previousContentTransform.tdouble x = v5;
  long long v7 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  long long v8 = *(_OWORD *)&self->_activeContentRotationTransform.a;
  long long v9 = v7;
  long long v10 = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  [(SBSystemApertureContainerView *)self _setContentViewTransform:&v8 elementViewControllerInterfaceOrientation:v3];
}

- (void)setElementOrientationAuthority:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementOrientationAuthority);

  long long v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_elementOrientationAuthority, obj);
    [(SBSystemApertureContainerView *)self _updateContentViewTransformImmediately];
    long long v5 = obj;
  }
}

- (void)elementOrientationDidChangeWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  char v6 = SBSAIsElementViewControllerFixedInOrientation(WeakRetained);

  if ((v6 & 1) == 0)
  {
    long long v8 = *(_OWORD *)&self->_activeContentRotationTransform.c;
    long long v7 = *(_OWORD *)&self->_activeContentRotationTransform.tx;
    *(_OWORD *)&self->_previousContentTransform.a = *(_OWORD *)&self->_activeContentRotationTransform.a;
    *(_OWORD *)&self->_previousContentTransform.c = v8;
    *(_OWORD *)&self->_previousContentTransform.tdouble x = v7;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    if (v4) {
      [v4 targetTransform];
    }
    long long v9 = v17;
    long long v10 = v18;
    *(_OWORD *)&self->_activeContentRotationTransform.a = v17;
    *(_OWORD *)&self->_activeContentRotationTransform.c = v10;
    long long v11 = v19;
    *(_OWORD *)&self->_activeContentRotationTransform.tdouble x = v19;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke;
    v16[3] = &unk_1E6AF53F8;
    v16[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke_2;
    v12[3] = &unk_1E6AF8540;
    long long v14 = v10;
    long long v13 = v9;
    long long v15 = v11;
    v12[4] = self;
    [v4 animateAlongsideTransition:v16 completion:v12];
  }
}

uint64_t __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:*(void *)(a1 + 32)];
  int64_t v3 = *(_OWORD **)(a1 + 32);
  long long v4 = v3[40];
  long long v5 = v3[42];
  v7[1] = v3[41];
  v7[2] = v5;
  v7[0] = v4;
  return [v3 _setContentViewTransform:v7 elementViewControllerInterfaceOrientation:v2];
}

__n128 __86__SBSystemApertureContainerView_elementOrientationDidChangeWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a1 + 72);
  long long v3 = *(_OWORD *)(v1 + 640);
  long long v4 = *(_OWORD *)(v1 + 672);
  *(_OWORD *)&v7.c = *(_OWORD *)(v1 + 656);
  *(_OWORD *)&v7.tdouble x = v4;
  *(_OWORD *)&v7.a = v3;
  if (CGAffineTransformEqualToTransform(&t1, &v7))
  {
    long long v6 = *(_OWORD *)(v1 + 656);
    __n128 result = *(__n128 *)(v1 + 672);
    *(_OWORD *)(v1 + 592) = *(_OWORD *)(v1 + 640);
    *(_OWORD *)(v1 + 608) = v6;
    *(__n128 *)(v1 + 624) = result;
  }
  return result;
}

- (int64_t)activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  char v5 = SBSAIsElementViewControllerFixedInOrientation(WeakRetained);

  if (v5) {
    return 1;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_elementOrientationAuthority);
  int64_t v8 = [v7 activeElementInterfaceOrientationForSystemApertureElementOrientationObserver:self];

  return v8;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6 = a4;
  [(SBSystemApertureContainerView *)self _applySettingsValues];
  if (([v6 containsString:@"keyLineColorFixedLstar"] & 1) != 0
    || [v6 containsString:@"activityKeyLineColorEnabled"])
  {
    cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
    self->_cachedValidatedKeyLineTintColor = 0;
  }
  [(SBSystemApertureContainerView *)self setNeedsLayout];
}

- (void)_applySettingsValues
{
  [(SBSystemApertureSettings *)self->_settings keyLineThickness];
  SBSystemApertureKeyLineThickness = v3;
  [(SBSystemApertureSettings *)self->_settings adaptiveKeyLineThickness];
  SBSystemApertureAdaptiveKeyLineThickness = v4;
  [(SBSystemApertureSettings *)self->_settings keyLineAlpha];
  SBSystemApertureKeyLineDarkBkgEnabledOpacitdouble y = v5;
  [(SBSystemApertureContainerView *)self _updateKeyLineFilters];
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_AXSClassicInvertColorsEnabled())
  {
    if (a4 == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    goto LABEL_12;
  }
  int v7 = _AXSInvertColorsEnabled();
  BOOL v8 = a4 == 2;
  uint64_t v9 = 1;
  if (a4 == 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  if (!v8) {
    uint64_t v9 = 2;
  }
  if (v7)
  {
    uint64_t v6 = v9;
LABEL_12:
    int v10 = 1;
    goto LABEL_13;
  }
  int v10 = 0;
LABEL_13:
  long long v11 = SBLogSystemApertureController();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = SBStringFromSystemApertureBackgroundLuminanceLevel(self->_sampledBackgroundLuminanceLevel);
    uint64_t v13 = SBStringFromSystemApertureBackgroundLuminanceLevel(v6);
    long long v14 = (void *)v13;
    long long v15 = &stru_1F3084718;
    int v17 = 138543874;
    long long v18 = v12;
    if (v10) {
      long long v15 = @"(Inverted)";
    }
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    double v22 = v15;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Key Line: Sampled background luma (%{public}@) -> (%{public}@) %@", (uint8_t *)&v17, 0x20u);
  }
  self->_sampledBackgroundLuminanceLevel = v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemApertureContainerView:self sampledLuminanceLevelChangedTo:v6];
}

+ (double)_defaultCornerRadiusForBounds:(CGRect)a3 inWindow:(id)a4
{
  double v4 = CGRectGetHeight(a3) * 0.5;
  uint64_t v5 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
  [v5 maximumContinuousCornerRadius];
  double v7 = v6;

  if (v4 <= v7) {
    return v4;
  }
  else {
    return v7;
  }
}

- (id)_validatedKeyLineTintColor
{
  cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
  if (!cachedValidatedKeyLineTintColor)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v5 = [WeakRetained keyLineColorValidatorForSystemApertureContainerView:self];
    double v6 = [v5 validateKeyLineColor:self->_keyLineTintColor];
    double v7 = self->_cachedValidatedKeyLineTintColor;
    self->_cachedValidatedKeyLineTintColor = v6;

    cachedValidatedKeyLineTintColor = self->_cachedValidatedKeyLineTintColor;
  }
  return cachedValidatedKeyLineTintColor;
}

- (void)_updateKeyLineFilters
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  double v4 = [(SBSystemApertureSettings *)self->_settings adaptiveKeyLineColorMatrix];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 colorMatrix];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
  }

  v19[2] = v22;
  v19[3] = v23;
  v19[4] = v24;
  v19[0] = v20;
  v19[1] = v21;
  double v6 = [MEMORY[0x1E4F29238] valueWithBytes:v19 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  [v3 setValue:v6 forKey:@"inputColorMatrix"];

  v26[0] = v3;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  if (_AXSClassicInvertColorsEnabled() || _AXSInvertColorsEnabled())
  {
    BOOL v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A028]];
    uint64_t v25 = v8;
    int v9 = 1;
    int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    uint64_t v11 = [v10 arrayByAddingObjectsFromArray:v7];

    double v7 = (void *)v11;
  }
  else
  {
    int v9 = 0;
  }
  double v12 = [(_SBAdaptiveKeyLineBackdropView *)self->_lightBkgKeyLineView backdropLayer];
  [v12 setAllowsInPlaceFiltering:v9 ^ 1u];

  uint64_t v13 = [(_SBAdaptiveKeyLineBackdropView *)self->_lightBkgKeyLineView layer];
  [v13 setFilters:v7];

  [(SBSystemApertureSettings *)self->_settings keyLineDarkToMixedMinLuma];
  double v15 = v14;
  if ((v9 ^ 1))
  {
    [(SBSystemApertureSettings *)self->_settings keyLineMixedToDarkMaxLuma];
    double v17 = v18;
  }
  else
  {
    double v15 = 1.0 - v14;
    [(SBSystemApertureSettings *)self->_settings keyLineMixedToDarkMaxLuma];
    double v17 = 1.0 - v16;
  }
  -[_UILumaTrackingBackdropView setTransitionBoundaries:](self->_backgroundLumaSamplingBackdrop, "setTransitionBoundaries:", v15, v17);
}

- (void)_updateShadowStyleIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  BOOL v8 = SBStringFromSystemApertureShadowStyle(a2);
  int v9 = 138543874;
  int v10 = v7;
  __int16 v11 = 2050;
  uint64_t v12 = a1;
  __int16 v13 = 2114;
  double v14 = v8;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p>: Updating Container to Shadow Style: %{public}@", (uint8_t *)&v9, 0x20u);
}

- (BOOL)_isInRotationTransition
{
  long long v2 = *(_OWORD *)&self->_previousContentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_previousContentTransform.a;
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_previousContentTransform.tx;
  long long v3 = *(_OWORD *)&self->_activeContentRotationTransform.c;
  *(_OWORD *)&v5.a = *(_OWORD *)&self->_activeContentRotationTransform.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tdouble x = *(_OWORD *)&self->_activeContentRotationTransform.tx;
  return !CGAffineTransformEqualToTransform(&t1, &v5);
}

- (void)_setContentViewTransform:(CGAffineTransform *)a3 elementViewControllerInterfaceOrientation:(int64_t)a4
{
  rotatingContentView = self->_rotatingContentView;
  long long v7 = *(_OWORD *)&a3->c;
  long long v13 = *(_OWORD *)&a3->a;
  long long v14 = v7;
  long long v15 = *(_OWORD *)&a3->tx;
  BOOL v8 = rotatingContentView;
  [(UIView *)v8 setTransform:&v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementViewController);
  int v10 = objc_msgSend(WeakRetained, "elementViewProvider", v13, v14, v15);
  __int16 v11 = [v10 element];

  LOBYTE(WeakRetained) = objc_opt_respondsToSelector();
  if (WeakRetained)
  {
    if ((unint64_t)a4 > 4) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = qword_1D8FD0878[a4];
    }
    [v11 setObstructionEdge:v12];
  }
}

- (id)_generateAccessibilityIdentifier
{
  long long v3 = objc_msgSend(NSString, "stringWithFormat:", @"jindo-container-view:%lu", self->_rank + 1);
  double v4 = [(SBSystemApertureContainerView *)self elementViewController];
  CGAffineTransform v5 = v4;
  if (v4)
  {
    double v6 = [v4 elementViewProvider];
    long long v7 = [v6 element];
    BOOL v8 = [v7 clientIdentifier];

    int v9 = [v5 elementViewProvider];
    int v10 = [v9 element];
    __int16 v11 = [v10 elementIdentifier];

    uint64_t v12 = [NSString stringWithFormat:@",client-identifier:%@,element-identifier:%@", v8, v11];
    uint64_t v13 = [v3 stringByAppendingString:v12];

    long long v3 = (void *)v13;
  }

  return v3;
}

- (SAUIElementViewControlling)outgoingElementViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outgoingElementViewController);
  return (SAUIElementViewControlling *)WeakRetained;
}

- (SBSystemApertureElementOrientationAuthority)elementOrientationAuthority
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementOrientationAuthority);
  return (SBSystemApertureElementOrientationAuthority *)WeakRetained;
}

- (SBSystemApertureContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSystemApertureContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_elementOrientationAuthority);
  objc_destroyWeak((id *)&self->_outgoingElementViewController);
  objc_destroyWeak((id *)&self->_elementViewController);
  objc_storeStrong((id *)&self->_interfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionIDsToReasons, 0);
  objc_storeStrong((id *)&self->_cachedValidatedKeyLineTintColor, 0);
  objc_storeStrong((id *)&self->_keyLineTintColor, 0);
  objc_storeStrong((id *)&self->_rotatingContentView, 0);
  objc_storeStrong((id *)&self->_scalingContentView, 0);
  objc_storeStrong((id *)&self->_hitTestView, 0);
  objc_storeStrong((id *)&self->_subBackgroundGroupingView, 0);
  objc_storeStrong((id *)&self->_backgroundGroupingView, 0);
  objc_storeStrong((id *)&self->_gainMapView, 0);
  objc_storeStrong((id *)&self->_blobEnablingBlackFillView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_lightBkgKeyLineView, 0);
  objc_storeStrong((id *)&self->_darkBkgKeyLineView, 0);
  objc_storeStrong((id *)&self->_backgroundLumaSamplingBackdrop, 0);
  objc_storeStrong((id *)&self->_contentClippingView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (unint64_t)rank
{
  return self->_rank;
}

@end