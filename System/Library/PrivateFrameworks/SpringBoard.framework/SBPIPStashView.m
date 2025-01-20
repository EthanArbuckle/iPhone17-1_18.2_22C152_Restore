@interface SBPIPStashView
- (SBPIPStashView)initWithFrame:(CGRect)a3;
- (SBPIPStashView)initWithFrame:(CGRect)a3 settings:(id)a4;
- (double)blurProgress;
- (double)stashedTabWidth;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateSettingsDerivedValues;
- (void)dealloc;
- (void)layoutStashChevrons;
- (void)layoutSubviews;
- (void)resetChevronState;
- (void)setBlurProgress:(double)a3;
- (void)setChevronHidden:(BOOL)a3 left:(BOOL)a4;
- (void)setStashedTabWidth:(double)a3;
@end

@implementation SBPIPStashView

- (SBPIPStashView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v12 = SBLogPIP();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPStashView initWithFrame:settings:]((uint64_t)self, (uint64_t)a2, v12);
  }

  v44.receiver = self;
  v44.super_class = (Class)SBPIPStashView;
  v13 = -[SBPIPStashView initWithFrame:](&v44, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_chevronsHidden = 1;
    objc_storeStrong((id *)&v13->_settings, a4);
    [(PTSettings *)v14->_settings addKeyObserver:v14];
    [(SBPIPStashView *)v14 setAccessibilityIdentifier:@"PG-StashedView"];
    [(UIView *)v14 SBPIP_recursivelyDisallowGroupBlending];
    [(UIView *)v14 SBPIP_setAllowsEdgeAntialiasing:1];
    [(UIView *)v14 SBPIP_setAllowsGroupBlending:0];
    v15 = [SBPIPBackdropView alloc];
    double v16 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v20 = -[SBPIPBackdropView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], v17, v18, v19);
    [(UIView *)v20 SBPIP_setAllowsEdgeAntialiasing:1];
    [(SBPIPBackdropView *)v20 setGaussianBlurRadius:0.0];
    v21 = [MEMORY[0x1E4F29128] UUID];
    v22 = [v21 UUIDString];
    [(SBPIPBackdropView *)v20 setGroupName:v22];

    [(SBPIPStashView *)v14 addSubview:v20];
    id v43 = v11;
    backdropView = v14->_backdropView;
    v14->_backdropView = v20;
    v42 = v20;

    v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    [(UIView *)v24 SBPIP_setAllowsEdgeAntialiasing:1];
    [(UIView *)v24 setAlpha:0.0];
    [(SBPIPStashView *)v14 addSubview:v24];
    darkTintView = v14->_darkTintView;
    v14->_darkTintView = v24;
    v41 = v24;

    v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v16, v17, v18, v19);
    [(UIView *)v26 SBPIP_setAllowsEdgeAntialiasing:1];
    [(UIView *)v26 setAlpha:0.0];
    [(SBPIPStashView *)v14 addSubview:v26];
    lightTintView = v14->_lightTintView;
    v14->_lightTintView = v26;
    v28 = v26;

    v29 = [MEMORY[0x1E4F42A30] systemFontOfSize:30.0 weight:*MEMORY[0x1E4F43930]];
    v30 = [MEMORY[0x1E4F42A98] configurationWithFont:v29];
    v31 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.compact.left" withConfiguration:v30];
    v32 = [v31 imageWithRenderingMode:2];

    v33 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v32];
    [(UIImageView *)v33 setAlpha:0.0];
    [(SBPIPStashView *)v14 addSubview:v33];
    leftChevron = v14->_leftChevron;
    v14->_leftChevron = v33;
    v35 = v33;

    v36 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.compact.right" withConfiguration:v30];
    v37 = [v36 imageWithRenderingMode:2];

    v38 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v37];
    [(UIImageView *)v38 setAlpha:0.0];
    [(SBPIPStashView *)v14 addSubview:v38];
    rightChevron = v14->_rightChevron;
    v14->_rightChevron = v38;
    id v11 = v43;

    [(SBPIPStashView *)v14 _updateSettingsDerivedValues];
  }

  return v14;
}

- (SBPIPStashView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = +[SBPIPSettingsDomain rootSettings];
  v9 = [v8 stashVisualSettings];
  v10 = -[SBPIPStashView initWithFrame:settings:](self, "initWithFrame:settings:", v9, x, y, width, height);

  return v10;
}

- (void)dealloc
{
  [(PTSettings *)self->_settings removeKeyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBPIPStashView;
  [(SBPIPStashView *)&v3 dealloc];
}

- (void)_updateSettingsDerivedValues
{
  [(SBPIPStashVisualSettings *)self->_settings startBlurTransition];
  self->_startBlurThreshold = v3;
  [(SBPIPStashVisualSettings *)self->_settings completeBlurTransition];
  self->_completeBlurThreshold = v4;
  int64_t v5 = [(SBPIPStashVisualSettings *)self->_settings userInterfaceStyle];
  if (v5) {
    [(SBPIPStashView *)self setOverrideUserInterfaceStyle:v5];
  }
  v6 = [(SBPIPStashView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  id v17 = [(SBPIPStashVisualSettings *)self->_settings materialSettingsForUserInterfaceStyle:v7];
  darkTintView = self->_darkTintView;
  v9 = [v17 darkTintColor];
  [(UIView *)darkTintView setBackgroundColor:v9];

  lightTintView = self->_lightTintView;
  id v11 = [v17 lightTintColor];
  [(UIView *)lightTintView setBackgroundColor:v11];

  leftChevron = self->_leftChevron;
  v13 = [v17 chevronTintColor];
  [(UIImageView *)leftChevron setTintColor:v13];

  rightChevron = self->_rightChevron;
  v15 = [v17 chevronTintColor];
  [(UIImageView *)rightChevron setTintColor:v15];

  double v16 = [v17 chevronCompositingFilter];
  [(UIImageView *)self->_leftChevron SBPIP_updateVibrancyEffectForTintColorWithFilter:v16];
  [(UIImageView *)self->_rightChevron SBPIP_updateVibrancyEffectForTintColorWithFilter:v16];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SBPIPStashView;
  [(SBPIPStashView *)&v15 layoutSubviews];
  [(SBPIPStashView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SBPIPBackdropView setBounds:](self->_backdropView, "setBounds:");
  -[UIView setBounds:](self->_lightTintView, "setBounds:", v4, v6, v8, v10);
  -[UIView setBounds:](self->_darkTintView, "setBounds:", v4, v6, v8, v10);
  backdropView = self->_backdropView;
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  double MidX = CGRectGetMidX(v16);
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  -[SBPIPBackdropView setCenter:](backdropView, "setCenter:", MidX, CGRectGetMidY(v17));
  lightTintView = self->_lightTintView;
  [(SBPIPBackdropView *)self->_backdropView center];
  -[UIView setCenter:](lightTintView, "setCenter:");
  darkTintView = self->_darkTintView;
  [(SBPIPBackdropView *)self->_backdropView center];
  -[UIView setCenter:](darkTintView, "setCenter:");
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  -[UIImageView setCenter:](self->_leftChevron, "setCenter:", 18.0, CGRectGetMidY(v18));
  v19.origin.double x = v4;
  v19.origin.double y = v6;
  v19.size.double width = v8;
  v19.size.double height = v10;
  -[UIImageView setCenter:](self->_rightChevron, "setCenter:", v8 + -18.0, CGRectGetMidY(v19));
}

- (void)layoutStashChevrons
{
  if (self->_chevronsHidden)
  {
    leftChevron = self->_leftChevron;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
    long long v21 = *(_OWORD *)&v28.a;
    *(_OWORD *)&v28.c = v22;
    *(_OWORD *)&v28.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v20 = *(_OWORD *)&v28.tx;
    [(UIImageView *)leftChevron setTransform:&v28];
    rightChevron = self->_rightChevron;
    *(_OWORD *)&v28.a = v21;
    *(_OWORD *)&v28.c = v22;
    *(_OWORD *)&v28.tdouble x = v20;
    [(UIImageView *)rightChevron setTransform:&v28];
    backdropView = self->_backdropView;
    *(_OWORD *)&v28.a = v21;
    *(_OWORD *)&v28.c = v22;
    *(_OWORD *)&v28.tdouble x = v20;
    double v6 = &v28;
  }
  else
  {
    if (self->_isChevronShownLeft)
    {
      double v7 = self->_leftChevron;
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v28.c = v8;
      *(_OWORD *)&v28.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformTranslate(&v27, &v28, -30.0, 0.0);
      double v9 = &v27;
    }
    else
    {
      double v7 = self->_rightChevron;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v28.c = v10;
      *(_OWORD *)&v28.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformTranslate(&v26, &v28, 30.0, 0.0);
      double v9 = &v26;
    }
    [(UIImageView *)v7 setTransform:v9];
    id v11 = self->_backdropView;
    double stashedTabWidth = self->_stashedTabWidth;
    if (self->_isChevronShownLeft) {
      double stashedTabWidth = -stashedTabWidth;
    }
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v28.c = v13;
    *(_OWORD *)&v28.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformTranslate(&v25, &v28, stashedTabWidth, 0.0);
    double v6 = &v25;
    backdropView = v11;
  }
  [(SBPIPBackdropView *)backdropView setTransform:v6];
  lightTintView = self->_lightTintView;
  objc_super v15 = self->_backdropView;
  if (v15) {
    [(SBPIPBackdropView *)v15 transform];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  [(UIView *)lightTintView setTransform:v24];
  darkTintView = self->_darkTintView;
  CGRect v17 = self->_backdropView;
  if (v17) {
    [(SBPIPBackdropView *)v17 transform];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  [(UIView *)darkTintView setTransform:v23];
  double v18 = 0.0;
  double v19 = 0.0;
  if (!self->_chevronsHidden)
  {
    double v19 = 1.0;
    if (!self->_isChevronShownLeft) {
      double v19 = 0.0;
    }
  }
  [(UIImageView *)self->_leftChevron setAlpha:v19];
  if (!self->_chevronsHidden)
  {
    if (self->_isChevronShownLeft) {
      double v18 = 0.0;
    }
    else {
      double v18 = 1.0;
    }
  }
  [(UIImageView *)self->_rightChevron setAlpha:v18];
  [(SBPIPBackdropView *)self->_backdropView layoutIfNeeded];
  [(UIView *)self->_lightTintView layoutIfNeeded];
  [(UIImageView *)self->_leftChevron layoutIfNeeded];
  [(UIImageView *)self->_rightChevron layoutIfNeeded];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPIPStashView;
  -[SBPIPStashView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(SBPIPBackdropView *)self->_backdropView _setContinuousCornerRadius:a3];
  [(UIView *)self->_lightTintView _setContinuousCornerRadius:a3];
  [(UIView *)self->_darkTintView _setContinuousCornerRadius:a3];
}

- (void)setBlurProgress:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_blurProgress != a3)
  {
    self->_double blurProgress = a3;
    double v4 = fmin(fmax((a3 - self->_startBlurThreshold) / (self->_completeBlurThreshold - self->_startBlurThreshold) + 0.0, 0.0), 1.0);
    double v5 = fmin(fmax(v4 * -0.75 + 1.0, 0.25), 1.0);
    [(SBPIPBackdropView *)self->_backdropView setGaussianBlurRadius:fmin(fmax(v4 * 15.0 + 0.0, 0.0), 15.0)];
    [(SBPIPBackdropView *)self->_backdropView setBackdropScale:v5];
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      [(SBPIPBackdropView *)self->_backdropView setAlpha:v4];
    }
    [(UIView *)self->_lightTintView setAlpha:v4];
    [(UIView *)self->_darkTintView setAlpha:v4];
    double v6 = SBLogPIP();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double blurProgress = self->_blurProgress;
      int v8 = 134218496;
      double v9 = blurProgress;
      __int16 v10 = 2048;
      double v11 = v4;
      __int16 v12 = 2048;
      double v13 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Layout] progress{%.2f} thresholdedProgress{%.2f} backdropScale{%.2f}", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)setChevronHidden:(BOOL)a3 left:(BOOL)a4
{
  if (self->_chevronsHidden != a3 || self->_isChevronShownLeft != a4)
  {
    self->_chevronsHidden = a3;
    self->_isChevronShownLeft = a4 & ~a3;
    [(SBPIPStashView *)self layoutStashChevrons];
  }
}

- (void)resetChevronState
{
}

- (double)blurProgress
{
  return self->_blurProgress;
}

- (double)stashedTabWidth
{
  return self->_stashedTabWidth;
}

- (void)setStashedTabWidth:(double)a3
{
  self->_double stashedTabWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightChevron, 0);
  objc_storeStrong((id *)&self->_leftChevron, 0);
  objc_storeStrong((id *)&self->_darkTintView, 0);
  objc_storeStrong((id *)&self->_lightTintView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)initWithFrame:(NSObject *)a3 settings:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v4 = _SBFLoggingMethodProem();
  int v5 = 138412290;
  double v6 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
}

@end