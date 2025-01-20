@interface SBUIProudLockIconView
- (BOOL)allowsAlongsideCoaching;
- (CGAffineTransform)_incomingTransformForActiveView:(SEL)a3 forState:(id)a4;
- (CGAffineTransform)_outgoingTransformForView:(SEL)a3 fromState:(id)a4;
- (CGAffineTransform)_transformForActiveView:(SEL)a3 forState:(id)a4;
- (CGAffineTransform)_zoomedTransform;
- (CGSize)_smallLockSize;
- (CGSize)_smallLockSizeForTextSize:(id)a3;
- (MTMaterialView)backgroundMaterialView;
- (SBUIFaceIDCameraGlyphView)cameraCoveredView;
- (SBUIProudLockIconView)initWithFrame:(CGRect)a3;
- (UIColor)contentColor;
- (_UILegibilitySettings)legibilitySettings;
- (double)_alphaForActiveViewForState:(int64_t)a3;
- (double)_lockToCoachingSpacing;
- (double)_scaleAmountForZoom;
- (double)durationOnCameraCoveredGlyphBeforeCoaching;
- (double)proudLockLandscapeOffset;
- (id)_activeViewsForState:(int64_t)a3;
- (id)_alphaAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6 forIncomingViews:(BOOL)a7;
- (id)_defaultAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6;
- (id)_faceIDCoachingView;
- (id)_layoutAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6;
- (id)_pearlGlyphView;
- (id)_pearlGlyphViewIfExists;
- (id)_transformAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6 forIncomingViews:(BOOL)a7;
- (id)acquireNonSecureContentAssertionForReason:(id)a3;
- (int64_t)state;
- (void)_configureShadowFromLegibilitySettings:(id)a3;
- (void)_forEachLayerInHierarchy:(id)a3 perform:(id)a4;
- (void)_resetCameraGlyphView;
- (void)_resetPearlGlyphView;
- (void)_resetfaceIDCoachingView;
- (void)_transitionToState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7;
- (void)layoutSubviews;
- (void)setAllowsAlongsideCoaching:(BOOL)a3;
- (void)setContentColor:(id)a3;
- (void)setDurationOnCameraCoveredGlyphBeforeCoaching:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setOverrideGlyphStyle:(int64_t)a3;
- (void)setOverrideSize:(CGSize)a3 offset:(CGPoint)a4 extent:(double)a5;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7;
@end

@implementation SBUIProudLockIconView

- (SBUIProudLockIconView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)SBUIProudLockIconView;
  v3 = -[SBUIProudLockIconView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (!v3) {
    return v4;
  }
  v3->_allowsAlongsideCoaching = 1;
  v3->_pearlGlyphStyle = 3;
  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  iconContainerView = v4->_iconContainerView;
  v4->_iconContainerView = v5;

  [(SBUIProudLockIconView *)v4 addSubview:v4->_iconContainerView];
  uint64_t v7 = SBUIAllowsIndicatorSecureRendering();
  v8 = [[SBUIProudLockIconContentView alloc] initWithSecureContent:v7];
  lockView = v4->_lockView;
  v4->_lockView = v8;

  v10 = [(SBUIProudLockIconContentView *)v4->_lockView layer];
  [v10 setAllowsGroupOpacity:1];

  [(UIView *)v4->_iconContainerView addSubview:v4->_lockView];
  v11 = [(SBUIProudLockIconView *)v4 layer];
  [v11 setAllowsGroupOpacity:1];

  v12 = [MEMORY[0x1E4F1CA80] set];
  v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = [MEMORY[0x1E4F1CA80] set];
  v15 = [(SBUIProudLockIconContentView *)v4->_lockView layer];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __39__SBUIProudLockIconView_initWithFrame___block_invoke;
  v32[3] = &unk_1E5CCCF40;
  id v16 = v12;
  id v33 = v16;
  id v17 = v13;
  id v34 = v17;
  id v18 = v14;
  id v35 = v18;
  [(SBUIProudLockIconView *)v4 _forEachLayerInHierarchy:v15 perform:v32];

  uint64_t v19 = [v16 copy];
  imageLayers = v4->_imageLayers;
  v4->_imageLayers = (NSSet *)v19;

  uint64_t v21 = [v17 copy];
  shadowImageLayers = v4->_shadowImageLayers;
  v4->_shadowImageLayers = (NSSet *)v21;

  uint64_t v23 = [v18 copy];
  shadowFilterLayers = v4->_shadowFilterLayers;
  v4->_shadowFilterLayers = (NSSet *)v23;

  [(SBUIProudLockIconContentView *)v4->_lockView setHidden:0];
  [(SBUIProudLockIconView *)v4 setAccessibilityIdentifier:@"proud-lock"];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v25 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];

  if (v26 == 1)
  {
LABEL_6:
    v27 = objc_alloc_init(SBUIFaceIDCameraGlyphView);
    cameraCoveredView = v4->_cameraCoveredView;
    v4->_cameraCoveredView = v27;
  }
LABEL_7:
  [(SBUIProudLockIconView *)v4 addSubview:v4->_cameraCoveredView];
  if (v7)
  {
    uint64_t v29 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:1];
    backgroundMaterialView = v4->_backgroundMaterialView;
    v4->_backgroundMaterialView = (MTMaterialView *)v29;

    [(MTMaterialView *)v4->_backgroundMaterialView setAutoresizingMask:18];
    [(MTMaterialView *)v4->_backgroundMaterialView setOverrideUserInterfaceStyle:1];
    [(MTMaterialView *)v4->_backgroundMaterialView _setCornerRadius:15.0];
    [(MTMaterialView *)v4->_backgroundMaterialView setAlpha:0.0];
    [(SBUIProudLockIconView *)v4 addSubview:v4->_backgroundMaterialView];
    [(SBUIProudLockIconView *)v4 sendSubviewToBack:v4->_backgroundMaterialView];
  }
  v4->_state = 0;
  [(SBUIProudLockIconView *)v4 _transitionToState:0 animated:0 updateText:1 options:0 completion:0];

  return v4;
}

void __39__SBUIProudLockIconView_initWithFrame___block_invoke(id *a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 name];
  if ([v3 isEqualToString:@"shackle"]
    || [v3 isEqualToString:@"body"])
  {
    v4 = a1 + 4;
LABEL_4:
    [*v4 addObject:v5];
    goto LABEL_5;
  }
  if ([v3 isEqualToString:@"shadow"])
  {
    v4 = a1 + 5;
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"filter"])
  {
    v4 = a1 + 6;
    goto LABEL_4;
  }
LABEL_5:
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v12 = (void (**)(id, void))a7;
  if (self->_state == a3)
  {
    if (v12) {
      v12[2](v12, 0);
    }
  }
  else
  {
    -[SBUIProudLockIconView _transitionToState:animated:updateText:options:completion:](self, "_transitionToState:animated:updateText:options:completion:", a3, v9, v8, a6);
  }
  MEMORY[0x1F4181888]();
}

- (void)setOverrideSize:(CGSize)a3 offset:(CGPoint)a4 extent:(double)a5
{
  self->_overridesSizing = 1;
  self->_overrideSize = a3;
  self->_overrideOffset = a4;
  self->_overrideExtent = a5;
  [(SBUIProudLockIconView *)self setNeedsLayout];
  [(SBUIProudLockIconView *)self layoutIfNeeded];
}

- (void)setOverrideGlyphStyle:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    int64_t v3 = 4;
  }
  else
  {
    int64_t v3 = 3;
  }
  if (v3 != self->_pearlGlyphStyle)
  {
    self->_pearlGlyphStyle = v3;
    [(SBUIProudLockIconView *)self _resetPearlGlyphView];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (([(_UILegibilitySettings *)self->_legibilitySettings isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    uint64_t v7 = SBLogLockScreenBiometricFaceIDCoaching();
    BOOL v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_DEFAULT, "[Legibility] Updating to legibility settings: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      -[SBUIProudLockIconView setLegibilitySettings:](v8);
    }

    BOOL v9 = [(_UILegibilitySettings *)*p_legibilitySettings primaryColor];
    [(SBUIProudLockIconView *)self setContentColor:v9];

    [(SBUIProudLockIconView *)self _configureShadowFromLegibilitySettings:v5];
    v10 = [(SBUIProudLockIconView *)self _faceIDCoachingView];
    [v10 setLegibilitySettings:*p_legibilitySettings];

    v11 = [(SBUIProudLockIconView *)self cameraCoveredView];
    [v11 setLegibilitySettings:*p_legibilitySettings];
  }
}

- (id)acquireNonSecureContentAssertionForReason:(id)a3
{
  return [(SBUIProudLockIconContentView *)self->_lockView acquireNonSecureContentAssertionForReason:a3];
}

- (void)layoutSubviews
{
  v78.receiver = self;
  v78.super_class = (Class)SBUIProudLockIconView;
  [(SBUIProudLockIconView *)&v78 layoutSubviews];
  [(SBUIProudLockIconView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double height = v9;
  v11 = (id *)MEMORY[0x1E4F43630];
  uint64_t v12 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  id v13 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (unint64_t)(v12 - 3) > 1)
  {
    double v16 = v8 * 0.5;
    [MEMORY[0x1E4FA5F68] proudLockCenterFromTopOfScreen];
    double v18 = v17;
  }
  else
  {
    if (v12 == 3)
    {
      [MEMORY[0x1E4FA5F68] proudLockCenterFromTopOfScreen];
      double v16 = v19;
    }
    else
    {
      v79.origin.x = v4;
      v79.origin.y = v6;
      v79.size.width = v8;
      v79.size.double height = height;
      double Width = CGRectGetWidth(v79);
      [MEMORY[0x1E4FA5F68] proudLockCenterFromTopOfScreen];
      double v16 = Width - v21;
    }
    double v18 = height * 0.5;
  }
  if (self->_overridesSizing)
  {
    double v8 = self->_overrideSize.width;
    double height = self->_overrideSize.height;
    double v16 = v8 * 0.5;
    double v18 = height * 0.5;
    double v6 = 0.0;
    double v4 = 0.0;
  }
  -[UIView setBounds:](self->_iconContainerView, "setBounds:", v4, v6, v8, height);
  if (self->_overridesSizing)
  {
    double v22 = self->_overrideSize.width * 1.13;
    double v23 = self->_overrideSize.height * 1.13;
    double v24 = self->_overrideSize.width * 0.5 + self->_overrideOffset.x;
    double v25 = v18 + self->_overrideOffset.y;
  }
  else
  {
    double v24 = v8 * 0.5;
    [MEMORY[0x1E4FA5F68] proudLockAssetSize];
    double v22 = v26;
    double v23 = v27;
    double v25 = height * 0.5 - (v27 - floor(v27)) * 0.5;
  }
  -[SBUIProudLockIconContentView setBounds:](self->_lockView, "setBounds:", 0.0, 0.0, v22, v23);
  -[SBUIProudLockIconContentView setCenter:](self->_lockView, "setCenter:", v24, v25);
  -[MTMaterialView setBounds:](self->_backgroundMaterialView, "setBounds:", 0.0, 0.0, v22 * 3.0, v22 * 3.0);
  -[MTMaterialView setCenter:](self->_backgroundMaterialView, "setCenter:", v24, v25);
  lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  if (lazy_pearlGlyphView)
  {
    if (self->_overridesSizing)
    {
      double overrideExtent = self->_overrideExtent;
    }
    else
    {
      double v25 = v25 + 2.333333;
      v30 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v31 = [v30 userInterfaceIdiom];

      if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double overrideExtent = 26.6666667;
      }
      else {
        double overrideExtent = 20.0;
      }
      lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
    }
    -[LAUIPearlGlyphView setBounds:](lazy_pearlGlyphView, "setBounds:", 0.0, 0.0, overrideExtent, overrideExtent);
    -[LAUIPearlGlyphView setCenter:](self->_lazy_pearlGlyphView, "setCenter:", v24, v25);
  }
  double v77 = v18;
  double v32 = v16;
  [(SBUIProudLockIconView *)self _smallLockSize];
  double v34 = v33;
  double v76 = v35;
  objc_super v36 = [MEMORY[0x1E4F42D90] mainScreen];
  [v36 bounds];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;

  v80.origin.x = v38;
  v80.origin.y = v40;
  v80.size.width = v42;
  v80.size.double height = v44;
  double v45 = CGRectGetWidth(v80);
  v81.origin.x = v38;
  v81.origin.y = v40;
  v81.size.width = v42;
  v81.size.double height = v44;
  double v46 = CGRectGetHeight(v81);
  if (v45 < v46) {
    double v46 = v45;
  }
  double v47 = v46 + -32.0 - v34;
  [(SBUIProudLockIconView *)self _lockToCoachingSpacing];
  -[SBUIFaceIDCoachingView setBounds:](self->_lazy_faceIDCoachingView, "setBounds:", 0.0, 0.0, v47 - v48, 40.0);
  v49 = [MEMORY[0x1E4F42D90] mainScreen];
  [v49 scale];
  double v51 = v50;

  if (!self->_changingAllowsAlongsideCoaching) {
    [(SBUIFaceIDCoachingView *)self->_lazy_faceIDCoachingView stringWidth];
  }
  BSFloatRoundForScale();
  double v53 = v52;
  v54 = [(SBUIProudLockIconView *)self window];
  [(SBUIProudLockIconContentView *)self->_lockView bounds];
  objc_msgSend(v54, "convertRect:fromView:", self->_lockView);
  double v56 = v55;
  double v58 = v57;

  if (self->_allowsAlongsideCoaching)
  {
    double v59 = v56;
    if (!self->_changingAllowsAlongsideCoaching)
    {
      [(SBUIProudLockIconView *)self _lockToCoachingSpacing];
      double v59 = v53 + v56 + v60;
    }
  }
  else
  {
    double v59 = v56;
  }
  if (!SBUIProudLockIconViewStateShowsCoachingText(self->_state)
    || self->_performingIncomingLayout
    || self->_changingAllowsAlongsideCoaching)
  {
    double v61 = v32;
    double v62 = v77;
  }
  else
  {
    double v73 = v59 - v56;
    uint64_t v74 = [*v11 userInterfaceLayoutDirection];
    double v75 = -(v73 * 0.5);
    if (v74 != 1) {
      double v75 = v73 * 0.5;
    }
    double v61 = v32 - v75;
    double v62 = v77 + (round(v51 * (v77 + v58 * 0.5)) - v51 * (v77 + v58 * 0.5)) / v51;
  }
  -[UIView setCenter:](self->_iconContainerView, "setCenter:", v61, v62);
  uint64_t v63 = [*v11 userInterfaceLayoutDirection];
  [(SBUIProudLockIconView *)self _lockToCoachingSpacing];
  double v65 = (v34 + v53) * 0.5 + v64 + -1.5;
  if (v63 == 1) {
    double v65 = -v65;
  }
  double v66 = v61 + v65;
  v67 = [MEMORY[0x1E4F42D90] mainScreen];
  [v67 scale];
  double v69 = v68;

  -[SBUIFaceIDCoachingView setCenter:](self->_lazy_faceIDCoachingView, "setCenter:", v66, v62 + round(v76 * v51 / 30.0) / v69);
  v70 = [(SBUIFaceIDCameraGlyphView *)self->_cameraCoveredView superview];

  if (v70 == self)
  {
    cameraCoveredView = self->_cameraCoveredView;
    v72 = [(SBUIFaceIDCameraGlyphView *)cameraCoveredView superview];
    [v72 bounds];
    -[SBUIFaceIDCameraGlyphView setFrame:](cameraCoveredView, "setFrame:");
  }
}

- (double)proudLockLandscapeOffset
{
  [MEMORY[0x1E4FA5F68] proudLockLandscapeOffset];
  double v3 = v2;
  int v4 = SBUIAllowsIndicatorSecureRendering();
  double result = 0.0;
  if (!v4) {
    return v3;
  }
  return result;
}

- (BOOL)allowsAlongsideCoaching
{
  return self->_allowsAlongsideCoaching;
}

- (void)setAllowsAlongsideCoaching:(BOOL)a3
{
  if (self->_allowsAlongsideCoaching != a3)
  {
    self->_allowsAlongsideCoaching = a3;
    self->_changingAllowsAlongsideCoaching = 1;
    [(SBUIFaceIDCoachingView *)self->_lazy_faceIDCoachingView setCoachingCondition:1];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__SBUIProudLockIconView_setAllowsAlongsideCoaching___block_invoke;
    v4[3] = &unk_1E5CCC580;
    v4[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
    self->_changingAllowsAlongsideCoaching = 0;
  }
}

uint64_t __52__SBUIProudLockIconView_setAllowsAlongsideCoaching___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 490))
  {
    [*(id *)(v2 + 480) setHidden:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [(id)v2 setNeedsLayout];
  uint64_t result = [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 490))
  {
    double v5 = *(void **)(v4 + 480);
    return [v5 setHidden:1];
  }
  return result;
}

- (void)setContentColor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v5 = (UIColor *)a3;
  p_contentColor = &self->_contentColor;
  if (self->_contentColor != v5)
  {
    double v22 = v5;
    objc_storeStrong((id *)&self->_contentColor, a3);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v21 = self;
    double v7 = self->_imageLayers;
    uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v8) {
      goto LABEL_24;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "name", v21);
        if ([v13 isEqualToString:@"body"])
        {
          uint64_t v14 = objc_opt_class();
          id v15 = v12;
          if (v14)
          {
            if (objc_opt_isKindOfClass()) {
              double v16 = v15;
            }
            else {
              double v16 = 0;
            }
          }
          else
          {
            double v16 = 0;
          }
          id v20 = v16;

          objc_msgSend(v20, "setFillColor:", -[UIColor cgColor](*p_contentColor, "cgColor"));
        }
        else
        {
          if (![v13 isEqualToString:@"shackle"]) {
            goto LABEL_22;
          }
          uint64_t v17 = objc_opt_class();
          id v18 = v12;
          if (v17)
          {
            if (objc_opt_isKindOfClass()) {
              double v19 = v18;
            }
            else {
              double v19 = 0;
            }
          }
          else
          {
            double v19 = 0;
          }
          id v20 = v19;

          objc_msgSend(v20, "setStrokeColor:", -[UIColor cgColor](*p_contentColor, "cgColor"));
        }

LABEL_22:
      }
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v9)
      {
LABEL_24:

        [(LAUIPearlGlyphView *)v21->_lazy_pearlGlyphView setFinishedColor:*p_contentColor animated:0];
        double v5 = v22;
        break;
      }
    }
  }
}

- (void)_configureShadowFromLegibilitySettings:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 shadowColor];
  uint64_t v6 = [v4 style];
  double v7 = (id *)MEMORY[0x1E4F3A078];
  if (v6 != 1) {
    double v7 = (id *)MEMORY[0x1E4F3A228];
  }
  id v8 = *v7;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_shadowImageLayers;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "superlayer", (void)v16);
        [v15 setAllowsGroupBlending:0];

        objc_msgSend(v14, "setShadowColor:", objc_msgSend(v5, "cgColor"));
        [v14 setCompositingFilter:v8];
      }
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)_forEachLayerInHierarchy:(id)a3 perform:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = objc_msgSend(v6, "sublayers", 0);
  uint64_t v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(SBUIProudLockIconView *)self _forEachLayerInHierarchy:*(void *)(*((void *)&v14 + 1) + 8 * v13++) perform:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_transitionToState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7
{
  BOOL v8 = a4;
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  char v132 = 0;
  unint64_t state = self->_state;
  self->_unint64_t state = a3;
  if ((a6 & 2) != 0)
  {
    [(SBUIProudLockIconView *)self _resetPearlGlyphView];
    [(SBUIProudLockIconView *)self _resetfaceIDCoachingView];
    [(SBUIProudLockIconView *)self _resetCameraGlyphView];
  }
  uint64_t v12 = [(SBUIProudLockIconView *)self _activeViewsForState:a3];
  uint64_t v13 = [(SBUIProudLockIconView *)self _activeViewsForState:state];
  long long v14 = (void *)[v12 mutableCopy];
  [v14 removeObjectsInArray:v13];
  double v64 = v14;
  long long v15 = (void *)[v13 mutableCopy];
  [v15 removeObjectsInArray:v12];
  BOOL v16 = a3 == 5 && state == 4 || a3 == 4 && state == 5 || a3 == 20 || state == 20;
  BOOL v69 = v16;
  unsigned __int8 v67 = [v12 isEqualToArray:v13];
  HIDWORD(v57) = SBUIProudLockIconViewStateShowsCoachingText(state);
  LODWORD(v57) = SBUIProudLockIconViewStateShowsCoachingText(a3);
  long long v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  dispatch_group_enter(v18);
  dispatch_group_enter(v18);
  dispatch_group_enter(v18);
  dispatch_group_enter(v18);
  uint64_t v19 = objc_opt_new();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke;
  block[3] = &unk_1E5CCCF90;
  block[4] = self;
  id v20 = v12;
  id v126 = v20;
  id v68 = v13;
  id v127 = v68;
  id v60 = v19;
  id v128 = v60;
  id v58 = v11;
  id v129 = v58;
  v130 = v131;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], block);
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_3;
  v120[3] = &unk_1E5CCCFE0;
  uint64_t v21 = v18;
  v121 = v21;
  v122 = self;
  BOOL v124 = v8;
  v123 = v131;
  uint64_t v63 = (void (**)(void, void))MEMORY[0x1AD0CF1C0](v120);
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_5;
  v118[3] = &unk_1E5CCD028;
  v118[5] = a6;
  v118[4] = self;
  BOOL v119 = v8;
  double v62 = (void (**)(void, void, void))MEMORY[0x1AD0CF1C0](v118);
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_8;
  v113[3] = &unk_1E5CCD050;
  double v22 = v21;
  BOOL v116 = a5;
  v114 = v22;
  v115 = self;
  BOOL v117 = v8;
  double v61 = (void (**)(void, void))MEMORY[0x1AD0CF1C0](v113);
  if (v8)
  {
    long long v23 = [(SBUIProudLockIconView *)self _alphaAnimationSettingsForTransitionFromViews:v68 andState:state toViews:v20 andState:a3 forIncomingViews:0];
  }
  else
  {
    long long v23 = 0;
  }
  long long v24 = (void *)MEMORY[0x1E4F4F898];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_9;
  v109[3] = &unk_1E5CCCC80;
  char v111 = v67 ^ 1;
  BOOL v112 = v69;
  id v59 = v15;
  id v110 = v59;
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_10;
  v107[3] = &unk_1E5CCC6E8;
  long long v25 = v22;
  v108 = v25;
  [v24 animateWithSettings:v23 actions:v109 completion:v107];
  [(SBUIProudLockIconView *)self _alphaForActiveViewForState:a3];
  uint64_t v27 = v26;
  if (v8)
  {
    uint64_t v28 = [(SBUIProudLockIconView *)self _alphaAnimationSettingsForTransitionFromViews:v68 andState:state toViews:v20 andState:a3 forIncomingViews:1];
  }
  else
  {
    uint64_t v28 = 0;
  }
  uint64_t v29 = (void *)MEMORY[0x1E4F4F898];
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_11;
  v102[3] = &unk_1E5CCD078;
  char v105 = v67 ^ 1;
  BOOL v106 = v69;
  id v66 = v20;
  id v103 = v66;
  uint64_t v104 = v27;
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_12;
  v100[3] = &unk_1E5CCC6E8;
  v30 = v25;
  v101 = v30;
  [v29 animateWithSettings:v28 actions:v102 completion:v100];

  double v31 = 0.0;
  uint64_t v32 = 1;
  uint64_t v33 = 3;
  switch(a3)
  {
    case 0:
      goto LABEL_41;
    case 1:
    case 20:
    case 21:
    case 22:
      uint64_t v33 = 0;
      goto LABEL_41;
    case 2:
      uint64_t v33 = 1;
      goto LABEL_41;
    case 3:
      if (HIDWORD(v57) != v57)
      {
        v98[0] = MEMORY[0x1E4F143A8];
        v98[1] = 3221225472;
        v98[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_13;
        v98[3] = &unk_1E5CCD0A0;
        v99 = v62;
        double v34 = (void *)MEMORY[0x1AD0CF1C0](v98);
        [v60 addObject:v34];
      }
      else
      {
        uint64_t v33 = 2;
LABEL_41:
        ((void (**)(void, uint64_t, NSObject *))v62)[2](v62, v33, v30);
      }
      goto LABEL_42;
    case 4:
    case 10:
    case 14:
    case 15:
    case 16:
      goto LABEL_32;
    case 5:
    case 8:
      uint64_t v32 = 2;
      goto LABEL_32;
    case 6:
      uint64_t v32 = 3;
      goto LABEL_32;
    case 7:
      uint64_t v32 = 4;
LABEL_32:
      v63[2](v63, v32);
      goto LABEL_42;
    case 9:
    case 17:
      ((void (**)(void, void, NSObject *))v62)[2](v62, 0, v30);
      uint64_t v35 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(self->_state);
      v61[2](v61, v35);
      goto LABEL_42;
    case 11:
      uint64_t v36 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(11);
      v61[2](v61, v36);
      goto LABEL_42;
    case 12:
      uint64_t v38 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(12);
      v61[2](v61, v38);
      double v31 = 0.5;
      uint64_t v39 = 2;
      goto LABEL_43;
    case 13:
      uint64_t v37 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(13);
      v61[2](v61, v37);
      double v31 = 0.5;
      goto LABEL_35;
    case 18:
      v61[2](v61, 12);
      goto LABEL_42;
    case 19:
      v61[2](v61, 12);
LABEL_35:
      uint64_t v39 = 1;
      goto LABEL_43;
    case 23:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled()) {
        uint64_t v40 = 14;
      }
      else {
        uint64_t v40 = 1;
      }
      v61[2](v61, v40);
      goto LABEL_42;
    default:
LABEL_42:
      uint64_t v39 = 0;
LABEL_43:
      -[SBUIFaceIDCameraGlyphView setState:delay:](self->_cameraCoveredView, "setState:delay:", v39, v31, v57);
      if (((v67 ^ 1) & 1) != 0 || v69)
      {
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v41 = v64;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v94 objects:v133 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v95;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v95 != v43) {
                objc_enumerationMutation(v41);
              }
              double v45 = *(void **)(*((void *)&v94 + 1) + 8 * i);
              long long v92 = 0u;
              long long v93 = 0u;
              long long v91 = 0u;
              [(SBUIProudLockIconView *)self _incomingTransformForActiveView:v45 forState:a3];
              v90[0] = v91;
              v90[1] = v92;
              v90[2] = v93;
              [v45 setTransform:v90];
            }
            uint64_t v42 = [v41 countByEnumeratingWithState:&v94 objects:v133 count:16];
          }
          while (v42);
        }
      }
      if (v8)
      {
        double v46 = [(SBUIProudLockIconView *)self _transformAnimationSettingsForTransitionFromViews:v68 andState:state toViews:v66 andState:a3 forIncomingViews:0];
      }
      else
      {
        double v46 = 0;
      }
      double v47 = (void *)MEMORY[0x1E4F4F898];
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_14;
      v84[3] = &unk_1E5CCD0C8;
      char v88 = v67 ^ 1;
      BOOL v89 = v69;
      id v48 = v59;
      id v85 = v48;
      v86 = self;
      unint64_t v87 = state;
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_15;
      v82[3] = &unk_1E5CCC6E8;
      v49 = v30;
      v83 = v49;
      [v47 animateWithSettings:v46 actions:v84 completion:v82];
      if (v8)
      {
        double v50 = [(SBUIProudLockIconView *)self _transformAnimationSettingsForTransitionFromViews:v68 andState:state toViews:v66 andState:a3 forIncomingViews:1];
      }
      else
      {
        double v50 = 0;
      }
      double v51 = (void *)MEMORY[0x1E4F4F898];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_16;
      v76[3] = &unk_1E5CCD0C8;
      char v80 = v67 ^ 1;
      BOOL v81 = v69;
      id v52 = v66;
      id v77 = v52;
      objc_super v78 = self;
      int64_t v79 = a3;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_17;
      v74[3] = &unk_1E5CCC6E8;
      double v53 = v49;
      double v75 = v53;
      [v51 animateWithSettings:v50 actions:v76 completion:v74];

      if ((v67 & 1) == 0
        && self->_lazy_faceIDCoachingView
        && objc_msgSend(v52, "containsObject:")
        && self->_allowsAlongsideCoaching)
      {
        self->_performingIncomingLayout = 1;
        [(SBUIProudLockIconView *)self setNeedsLayout];
        [(SBUIProudLockIconView *)self layoutIfNeeded];
        self->_performingIncomingLayout = 0;
      }
      [(SBUIProudLockIconView *)self setNeedsLayout];
      if (v8)
      {
        v54 = [(SBUIProudLockIconView *)self _layoutAnimationSettingsForTransitionFromViews:v68 andState:state toViews:v52 andState:a3];
      }
      else
      {
        v54 = 0;
      }
      double v55 = (void *)MEMORY[0x1E4F4F898];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_18;
      v73[3] = &unk_1E5CCC580;
      v73[4] = self;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_19;
      v71[3] = &unk_1E5CCC6E8;
      double v56 = v53;
      v72 = v56;
      [v55 animateWithSettings:v54 actions:v73 completion:v71];

      _Block_object_dispose(v131, 8);
      return;
  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_activeViewsForState:", objc_msgSend(*(id *)(a1 + 32), "state"));
  id v3 = *(id *)(*(void *)(a1 + 32) + 464);
  if (v3
    && ([*(id *)(a1 + 40) containsObject:v3] & 1) == 0
    && ([v2 containsObject:v3] & 1) == 0
    && [*(id *)(a1 + 48) containsObject:v3])
  {
    [*(id *)(a1 + 32) _resetPearlGlyphView];
  }
  id v4 = *(id *)(*(void *)(a1 + 32) + 480);
  if (v4
    && ([*(id *)(a1 + 40) containsObject:v4] & 1) == 0
    && ([v2 containsObject:v4] & 1) == 0
    && [*(id *)(a1 + 48) containsObject:v4])
  {
    [*(id *)(a1 + 32) _resetfaceIDCoachingView];
  }
  double v5 = dispatch_group_create();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_2;
  v13[3] = &unk_1E5CCCF68;
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v14 = v11;
  uint64_t v15 = v12;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v13);
}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v4 = [*(id *)(a1 + 40) _pearlGlyphView];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_4;
  v6[3] = &unk_1E5CCCFB8;
  uint64_t v8 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  [v4 setState:a2 animated:v5 withCompletion:v6];
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  dispatch_group_enter(v5);
  if (a2 == 1) {
    kdebug_trace();
  }
  double v7 = 2.0;
  if ((v6 & 1) == 0) {
    double v7 = 1.0;
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 424);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 48);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_6;
  v14[3] = &__block_descriptor_33_e8_v12__0B8l;
  BOOL v15 = a2 == 1;
  [v8 setState:a2 animated:v9 transitionSpeed:v14 completion:v7];
  dispatch_time_t v10 = dispatch_time(0, 150000000);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_7;
  v12[3] = &unk_1E5CCC580;
  uint64_t v13 = v5;
  id v11 = v5;
  dispatch_after(v10, MEMORY[0x1E4F14428], v12);
}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_6(uint64_t result)
{
  if (*(unsigned char *)(result + 32)) {
    return kdebug_trace();
  }
  return result;
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_7(uint64_t a1)
{
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 40) _faceIDCoachingView];
    [v4 setCoachingCondition:a2 animated:*(unsigned __int8 *)(a1 + 49) delay:0.18];
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v5);
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    id v1 = *(id *)(a1 + 32);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "setAlpha:", 0.0, (void)v6);
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_10(uint64_t a1)
{
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_12(uint64_t a1)
{
}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_14(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          long long v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v11 = 0u;
          long long v12 = 0u;
          long long v10 = 0u;
          long long v8 = *(void **)(a1 + 40);
          if (v8) {
            [v8 _outgoingTransformForView:v7 fromState:*(void *)(a1 + 48)];
          }
          v9[0] = v10;
          v9[1] = v11;
          v9[2] = v12;
          [v7 setTransform:v9];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_15(uint64_t a1)
{
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_16(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          long long v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v11 = 0u;
          long long v12 = 0u;
          long long v10 = 0u;
          long long v8 = *(void **)(a1 + 40);
          if (v8) {
            [v8 _transformForActiveView:v7 forState:*(void *)(a1 + 48)];
          }
          v9[0] = v10;
          v9[1] = v11;
          v9[2] = v12;
          [v7 setTransform:v9];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
  }
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_17(uint64_t a1)
{
}

uint64_t __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __83__SBUIProudLockIconView__transitionToState_animated_updateText_options_completion___block_invoke_19(uint64_t a1)
{
}

- (id)_transformAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6 forIncomingViews:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  int v14 = [v13 isEqualToArray:v12];
  int v19 = v14 ^ 1;
  if (a4 != 1) {
    int v19 = 0;
  }
  if (a6 == 4 && v19)
  {
    id v20 = (void *)MEMORY[0x1E4F39C10];
    if (v7)
    {
      LODWORD(v15) = 1048911544;
      LODWORD(v17) = 1056293519;
      LODWORD(v16) = 1.0;
      LODWORD(v18) = 1.0;
      uint64_t v21 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v15 :v16 :v17 :v18];
      double v22 = (void *)MEMORY[0x1E4F4F680];
      double v23 = 0.56;
LABEL_20:
      uint64_t v26 = [v22 settingsWithDuration:v21 timingFunction:v23];

      goto LABEL_21;
    }
    LODWORD(v15) = 1056293519;
    double v16 = 0.0;
    LODWORD(v17) = 1.0;
    LODWORD(v18) = 1.0;
LABEL_19:
    uint64_t v21 = [v20 functionWithControlPoints:v15 :v16 :v17 :v18];
    double v22 = (void *)MEMORY[0x1E4F4F680];
    double v23 = 0.27;
    goto LABEL_20;
  }
  BOOL v24 = a4 == 4 && a6 == 2;
  int v25 = !v7;
  if (!v24) {
    int v25 = 1;
  }
  if (((v25 | v14) & 1) == 0)
  {
    id v20 = (void *)MEMORY[0x1E4F39C10];
    LODWORD(v15) = 1043207291;
    LODWORD(v16) = 1038174126;
    LODWORD(v17) = 1057300152;
    LODWORD(v18) = 1064682127;
    goto LABEL_19;
  }
  if (v19 && SBUIProudLockIconViewStateShowsCoachingText(a6) && v7)
  {
    id v20 = (void *)MEMORY[0x1E4F39C10];
    LODWORD(v15) = 1054280253;
    LODWORD(v17) = 1061494456;
    LODWORD(v18) = 1062836634;
    double v16 = 0.0;
    goto LABEL_19;
  }
  uint64_t v26 = [(SBUIProudLockIconView *)self _defaultAnimationSettingsForTransitionFromViews:v12 andState:a4 toViews:v13 andState:a6];
LABEL_21:

  return v26;
}

- (id)_alphaAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6 forIncomingViews:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a5;
  int v14 = [v13 isEqualToArray:v12];
  if (a6 == 4 && a4 == 1 && !v14)
  {
    double v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    if (v7) {
      double v16 = 0.1;
    }
    else {
      double v16 = 0.27;
    }
    double v17 = [MEMORY[0x1E4F4F680] settingsWithDuration:v15 timingFunction:v16];
  }
  else
  {
    double v17 = [(SBUIProudLockIconView *)self _defaultAnimationSettingsForTransitionFromViews:v12 andState:a4 toViews:v13 andState:a6];
  }

  return v17;
}

- (id)_defaultAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6
{
  id v8 = a3;
  id v9 = a5;
  if ([v9 isEqualToArray:v8]) {
    goto LABEL_2;
  }
  int v13 = [v9 containsObject:self->_lockView];
  if (self->_lazy_faceIDCoachingView)
  {
    char v14 = objc_msgSend(v8, "containsObject:");
    if (!v13) {
      goto LABEL_2;
    }
  }
  else
  {
    char v14 = 0;
    if (!v13)
    {
LABEL_2:
      long long v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
      long long v11 = (void *)MEMORY[0x1E4F4F680];
      double v12 = 0.4;
      goto LABEL_9;
    }
  }
  if (v14) {
    goto LABEL_2;
  }
  long long v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  long long v11 = (void *)MEMORY[0x1E4F4F680];
  double v12 = 0.2;
LABEL_9:
  double v15 = [v11 settingsWithDuration:v10 timingFunction:v12];

  return v15;
}

- (id)_layoutAnimationSettingsForTransitionFromViews:(id)a3 andState:(int64_t)a4 toViews:(id)a5 andState:(int64_t)a6
{
  LODWORD(v6) = 1048911544;
  LODWORD(v7) = 1041194025;
  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1.0;
  long long v10 = objc_msgSend(MEMORY[0x1E4F39C10], "functionWithControlPoints::::", a3, a4, a5, a6, v6, v7, v8, v9);
  long long v11 = [MEMORY[0x1E4F4F680] settingsWithDuration:v10 delay:0.63 timingFunction:0.12];

  return v11;
}

- (id)_activeViewsForState:(int64_t)a3
{
  p_isa = &self->super.super.super.isa;
  v31[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBUIProudLockIconView *)self allowsAlongsideCoaching];
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      uint64_t v20 = p_isa[52];
      v31[0] = p_isa[53];
      v31[1] = v20;
      double v16 = (void *)MEMORY[0x1E4F1C978];
      double v17 = v31;
      goto LABEL_15;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
    case 14:
    case 15:
    case 16:
      uint64_t v11 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
      double v12 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (unint64_t)(v11 - 3) >= 2) {
        [p_isa _pearlGlyphViewIfExists];
      }
      else {
      uint64_t v18 = [p_isa _pearlGlyphView];
      }
      double v6 = (void *)v18;
      if (v18)
      {
        uint64_t v19 = p_isa[52];
        v29[0] = v18;
        v29[1] = v19;
        double v8 = (void *)MEMORY[0x1E4F1C978];
        double v9 = v29;
        uint64_t v10 = 2;
      }
      else
      {
        uint64_t v30 = p_isa[52];
        double v8 = (void *)MEMORY[0x1E4F1C978];
        double v9 = &v30;
        uint64_t v10 = 1;
      }
      goto LABEL_17;
    case 9:
    case 11:
    case 12:
    case 13:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      if (v5)
      {
        v28[0] = p_isa[53];
        double v6 = [p_isa _faceIDCoachingView];
        uint64_t v7 = p_isa[52];
        v28[1] = v6;
        v28[2] = v7;
        double v8 = (void *)MEMORY[0x1E4F1C978];
        double v9 = v28;
        goto LABEL_4;
      }
      uint64_t v15 = p_isa[52];
      v27[0] = p_isa[53];
      v27[1] = v15;
      double v16 = (void *)MEMORY[0x1E4F1C978];
      double v17 = v27;
      goto LABEL_15;
    case 23:
      if (_SBUI_Private_PeriocularPoseOutOfRangeCoachingEnabled() & v5)
      {
        v26[0] = p_isa[53];
        double v6 = [p_isa _faceIDCoachingView];
        uint64_t v22 = p_isa[52];
        v26[1] = v6;
        v26[2] = v22;
        double v8 = (void *)MEMORY[0x1E4F1C978];
        double v9 = v26;
LABEL_4:
        uint64_t v10 = 3;
LABEL_17:
        p_isa = [v8 arrayWithObjects:v9 count:v10];
      }
      else
      {
        uint64_t v23 = p_isa[52];
        uint64_t v24 = p_isa[53];
        uint64_t v25 = v23;
        double v16 = (void *)MEMORY[0x1E4F1C978];
        double v17 = &v24;
LABEL_15:
        p_isa = objc_msgSend(v16, "arrayWithObjects:count:", v17, 2, v24, v25);
      }
LABEL_18:
      return p_isa;
    default:
      goto LABEL_18;
  }
}

- (CGAffineTransform)_incomingTransformForActiveView:(SEL)a3 forState:(id)a4
{
  double v8 = (UIView *)a4;
  if (a5 == 4
    && (double v17 = v8,
        [(SBUIProudLockIconView *)self _pearlGlyphViewIfExists],
        double v9 = (UIView *)objc_claimAutoreleasedReturnValue(),
        v9,
        double v8 = v17,
        v9 == v17))
  {
    char v14 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    CGAffineTransformMakeScale(retstr, dbl_1A76A5460[(v15 & 0xFFFFFFFFFFFFFFFBLL) == 1], dbl_1A76A5460[(v15 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
  }
  else
  {
    lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView;
    if (lazy_faceIDCoachingView) {
      BOOL v11 = lazy_faceIDCoachingView == (SBUIFaceIDCoachingView *)v8;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11 || self->_iconContainerView == v8)
    {
      uint64_t v12 = MEMORY[0x1E4F1DAB8];
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&retstr->c = v13;
      *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
      goto LABEL_12;
    }
    double v17 = v8;
    [(SBUIProudLockIconView *)self _zoomedTransform];
  }
  double v8 = v17;
LABEL_12:

  return result;
}

- (CGAffineTransform)_transformForActiveView:(SEL)a3 forState:(id)a4
{
  long long v13 = (UIView *)a4;
  double v8 = (CGAffineTransform *)SBUIProudLockIconViewStateShowsCoachingText(a5);
  double v9 = v13;
  if (v8 && self->_iconContainerView == v13)
  {
    double v8 = [(SBUIProudLockIconView *)self _zoomedTransform];
    double v9 = v13;
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F1DAB8];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v10 + 32);
  }
  return (CGAffineTransform *)MEMORY[0x1F41817F8](v8, v9);
}

- (CGAffineTransform)_outgoingTransformForView:(SEL)a3 fromState:(id)a4
{
  double v8 = (SBUIProudLockIconContentView *)a4;
  if (a5 == 4
    && (uint64_t v15 = v8,
        [(SBUIProudLockIconView *)self _pearlGlyphViewIfExists],
        double v9 = (SBUIProudLockIconContentView *)objc_claimAutoreleasedReturnValue(),
        v9,
        double v8 = v15,
        v9 == v15)
    || ((lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView) != 0
      ? (BOOL v11 = lazy_faceIDCoachingView == (SBUIFaceIDCoachingView *)v8)
      : (BOOL v11 = 0),
        v11 || (SBUIProudLockIconContentView *)self->_iconContainerView == v8 || self->_lockView != v8))
  {
    uint64_t v12 = MEMORY[0x1E4F1DAB8];
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  }
  else
  {
    double v16 = v8;
    [(SBUIProudLockIconView *)self _zoomedTransform];
    double v8 = v16;
  }

  return result;
}

- (CGAffineTransform)_zoomedTransform
{
  [(SBUIProudLockIconView *)self _scaleAmountForZoom];
  return CGAffineTransformMakeScale(retstr, v4, v4);
}

- (double)_scaleAmountForZoom
{
  [(SBUIProudLockIconView *)self _smallLockSize];
  double v3 = v2;
  [MEMORY[0x1E4FA5F68] proudLockAssetSize];
  return v3 / v4;
}

- (CGSize)_smallLockSize
{
  double v3 = [(SBUIFaceIDCoachingView *)self->_lazy_faceIDCoachingView currentSizeCategory];
  [(SBUIProudLockIconView *)self _smallLockSizeForTextSize:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_smallLockSizeForTextSize:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FA5F68];
  id v4 = a3;
  [v3 proudLockAssetSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = v5 / v7;
  SBUICeilingCapHeightForCoachingTextForUIContentSizeCategory(v4);
  double v11 = v10;

  double v12 = v11 * 1.66666667;
  double v13 = v12 * v9;
  int v14 = BSSizeLessThanSize();
  if (v14) {
    double v15 = v13;
  }
  else {
    double v15 = v6;
  }
  if (v14) {
    double v16 = v12;
  }
  else {
    double v16 = v8;
  }
  result.double height = v16;
  result.width = v15;
  return result;
}

- (double)_lockToCoachingSpacing
{
  [(SBUIProudLockIconView *)self _smallLockSize];
  return v2 * 0.5;
}

- (double)_alphaForActiveViewForState:(int64_t)a3
{
  return 1.0;
}

- (id)_pearlGlyphViewIfExists
{
  return self->_lazy_pearlGlyphView;
}

- (id)_pearlGlyphView
{
  lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  if (!lazy_pearlGlyphView)
  {
    if (self->_pearlGlyphStyle == 4)
    {
      uint64_t v15 = 0;
      double v16 = &v15;
      uint64_t v17 = 0x2050000000;
      id v4 = (void *)getLAUIPearlGlyphStaticConfigurationClass_softClass;
      uint64_t v18 = getLAUIPearlGlyphStaticConfigurationClass_softClass;
      if (!getLAUIPearlGlyphStaticConfigurationClass_softClass)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __getLAUIPearlGlyphStaticConfigurationClass_block_invoke;
        v14[3] = &unk_1E5CCC5D0;
        void v14[4] = &v15;
        __getLAUIPearlGlyphStaticConfigurationClass_block_invoke((uint64_t)v14);
        id v4 = (void *)v16[3];
      }
      id v5 = v4;
      _Block_object_dispose(&v15, 8);
      double v6 = (void *)[v5 createSystemApertureConfiguration];
      double v7 = (LAUIPearlGlyphView *)[objc_alloc((Class)getLAUIPearlGlyphViewClass()) initWithConfiguration:v6];
      double v8 = self->_lazy_pearlGlyphView;
      self->_lazy_pearlGlyphView = v7;

      [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView setFaceVisibility:7 animated:0];
    }
    else
    {
      double v9 = (LAUIPearlGlyphView *)[objc_alloc((Class)getLAUIPearlGlyphViewClass()) initWithStyle:self->_pearlGlyphStyle];
      double v10 = self->_lazy_pearlGlyphView;
      self->_lazy_pearlGlyphView = v9;

      [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView setFaceVisibility:0 animated:0];
    }
    [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView setFeedbackEnabled:0];
    [(UIView *)self->_iconContainerView addSubview:self->_lazy_pearlGlyphView];
    [(SBUIProudLockIconView *)self setNeedsLayout];
    [(SBUIProudLockIconView *)self layoutIfNeeded];
    if (!self->_pearlGlyphViewSharedResources)
    {
      double v11 = [getLAUIPearlGlyphViewClass() sharedStaticResources];
      id pearlGlyphViewSharedResources = self->_pearlGlyphViewSharedResources;
      self->_id pearlGlyphViewSharedResources = v11;
    }
    [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView setFinishedColor:self->_contentColor animated:0];
    [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView setHidden:0];
    [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView setAlpha:0.0];
    [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView setState:6 animated:0];
    lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  }
  return lazy_pearlGlyphView;
}

- (id)_faceIDCoachingView
{
  lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView;
  if (!lazy_faceIDCoachingView)
  {
    id v4 = objc_alloc_init(SBUIFaceIDCoachingView);
    id v5 = self->_lazy_faceIDCoachingView;
    self->_lazy_faceIDCoachingView = v4;

    [(SBUIProudLockIconView *)self addSubview:self->_lazy_faceIDCoachingView];
    [(SBUIProudLockIconView *)self layoutIfNeeded];
    double v6 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "[Legibility] Creating FaceID coaching view", v8, 2u);
    }

    [(SBUIFaceIDCoachingView *)self->_lazy_faceIDCoachingView setLegibilitySettings:self->_legibilitySettings];
    [(SBUIFaceIDCoachingView *)self->_lazy_faceIDCoachingView setHidden:[(SBUIProudLockIconView *)self allowsAlongsideCoaching] ^ 1];
    [(SBUIFaceIDCoachingView *)self->_lazy_faceIDCoachingView setAlpha:0.0];
    [(SBUIFaceIDCoachingView *)self->_lazy_faceIDCoachingView setCoachingCondition:1];
    lazy_faceIDCoachingView = self->_lazy_faceIDCoachingView;
  }
  return lazy_faceIDCoachingView;
}

- (void)_resetPearlGlyphView
{
  id v4 = self->_lazy_pearlGlyphView;
  [(LAUIPearlGlyphView *)v4 setState:6 animated:0];
  [(LAUIPearlGlyphView *)self->_lazy_pearlGlyphView removeFromSuperview];
  lazy_pearlGlyphView = self->_lazy_pearlGlyphView;
  self->_lazy_pearlGlyphView = 0;
}

- (void)_resetfaceIDCoachingView
{
}

- (void)_resetCameraGlyphView
{
}

- (int64_t)state
{
  return self->_state;
}

- (MTMaterialView)backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (SBUIFaceIDCameraGlyphView)cameraCoveredView
{
  return self->_cameraCoveredView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)durationOnCameraCoveredGlyphBeforeCoaching
{
  return self->_durationOnCameraCoveredGlyphBeforeCoaching;
}

- (void)setDurationOnCameraCoveredGlyphBeforeCoaching:(double)a3
{
  self->_durationOnCameraCoveredGlyphBeforeCoaching = a3;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cameraCoveredView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_lazy_faceIDCoachingView, 0);
  objc_storeStrong(&self->_pearlGlyphViewSharedResources, 0);
  objc_storeStrong((id *)&self->_lazy_pearlGlyphView, 0);
  objc_storeStrong((id *)&self->_shadowFilterLayers, 0);
  objc_storeStrong((id *)&self->_shadowImageLayers, 0);
  objc_storeStrong((id *)&self->_imageLayers, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
}

- (void)setLegibilitySettings:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1A7607000, log, OS_LOG_TYPE_FAULT, "[Legibility] Updated to nil legibility settings", v1, 2u);
}

@end