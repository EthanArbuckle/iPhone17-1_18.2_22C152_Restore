@interface PGStashView
- (PGStashView)initWithFrame:(CGRect)a3;
- (double)blurProgress;
- (double)stashedTabWidth;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutStashChevrons;
- (void)layoutSubviews;
- (void)resetChevronState;
- (void)setBlurProgress:(double)a3;
- (void)setChevronHidden:(BOOL)a3 left:(BOOL)a4;
- (void)setStashedTabWidth:(double)a3;
@end

@implementation PGStashView

- (PGStashView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = PGLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    [(PGStashView *)self initWithFrame:v9];
  }

  v45.receiver = self;
  v45.super_class = (Class)PGStashView;
  v10 = -[PGStashView initWithFrame:](&v45, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_chevronsHidden = 1;
    [(PGStashView *)v10 setOverrideUserInterfaceStyle:2];
    [(PGStashView *)v11 setAccessibilityIdentifier:@"PG-StashedView"];
    [(UIView *)v11 PG_recursivelyDisallowGroupBlending];
    [(UIView *)v11 PG_setAllowsEdgeAntialiasing:1];
    [(UIView *)v11 PG_setAllowsGroupBlending:0];
    v12 = [PGBackdropView alloc];
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v17 = -[PGBackdropView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
    [(UIView *)v17 PG_setAllowsEdgeAntialiasing:1];
    [(PGBackdropView *)v17 setGaussianBlurRadius:0.0];
    v18 = [MEMORY[0x1E4F29128] UUID];
    v19 = [v18 UUIDString];
    [(PGBackdropView *)v17 setGroupName:v19];

    [(PGStashView *)v11 addSubview:v17];
    backdropView = v11->_backdropView;
    v11->_backdropView = v17;
    v44 = v17;

    v21 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v14, v15, v16);
    [(UIView *)v21 PG_setAllowsEdgeAntialiasing:1];
    v22 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.55];
    [(UIView *)v21 setBackgroundColor:v22];

    [(UIView *)v21 setAlpha:0.0];
    [(PGStashView *)v11 addSubview:v21];
    darkTintView = v11->_darkTintView;
    v11->_darkTintView = v21;
    v43 = v21;

    v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v14, v15, v16);
    [(UIView *)v24 PG_setAllowsEdgeAntialiasing:1];
    v25 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.15];
    [(UIView *)v24 setBackgroundColor:v25];

    [(UIView *)v24 setAlpha:0.0];
    [(PGStashView *)v11 addSubview:v24];
    lightTintView = v11->_lightTintView;
    v11->_lightTintView = v24;
    v41 = v24;

    v42 = [MEMORY[0x1E4F42A30] systemFontOfSize:30.0 weight:*MEMORY[0x1E4F43930]];
    v27 = [MEMORY[0x1E4F42A98] configurationWithFont:v42];
    v28 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.compact.left" withConfiguration:v27];
    v29 = [v28 imageWithRenderingMode:2];

    v30 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v29];
    v31 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UIImageView *)v30 setTintColor:v31];

    [(UIImageView *)v30 setAlpha:0.0];
    [(PGStashView *)v11 addSubview:v30];
    leftChevron = v11->_leftChevron;
    v11->_leftChevron = v30;
    v33 = v30;

    v34 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.compact.right" withConfiguration:v27];
    v35 = [v34 imageWithRenderingMode:2];

    v36 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v35];
    v37 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UIImageView *)v36 setTintColor:v37];

    [(UIImageView *)v36 setAlpha:0.0];
    [(PGStashView *)v11 addSubview:v36];
    rightChevron = v11->_rightChevron;
    v11->_rightChevron = v36;
    v39 = v36;

    [(UIImageView *)v11->_leftChevron PG_updateVibrancyEffectForTintColor];
    [(UIImageView *)v11->_rightChevron PG_updateVibrancyEffectForTintColor];
  }
  return v11;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PGStashView;
  [(PGStashView *)&v15 layoutSubviews];
  [(PGStashView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PGBackdropView setBounds:](self->_backdropView, "setBounds:");
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
  -[PGBackdropView setCenter:](backdropView, "setCenter:", MidX, CGRectGetMidY(v17));
  lightTintView = self->_lightTintView;
  [(PGBackdropView *)self->_backdropView center];
  -[UIView setCenter:](lightTintView, "setCenter:");
  darkTintView = self->_darkTintView;
  [(PGBackdropView *)self->_backdropView center];
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
    v11 = self->_backdropView;
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
  [(PGBackdropView *)backdropView setTransform:v6];
  lightTintView = self->_lightTintView;
  objc_super v15 = self->_backdropView;
  if (v15) {
    [(PGBackdropView *)v15 transform];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  [(UIView *)lightTintView setTransform:v24];
  darkTintView = self->_darkTintView;
  CGRect v17 = self->_backdropView;
  if (v17) {
    [(PGBackdropView *)v17 transform];
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
  [(PGBackdropView *)self->_backdropView layoutIfNeeded];
  [(UIView *)self->_lightTintView layoutIfNeeded];
  [(UIImageView *)self->_leftChevron layoutIfNeeded];
  [(UIImageView *)self->_rightChevron layoutIfNeeded];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGStashView;
  -[PGStashView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(PGBackdropView *)self->_backdropView _setContinuousCornerRadius:a3];
  [(UIView *)self->_lightTintView _setContinuousCornerRadius:a3];
  [(UIView *)self->_darkTintView _setContinuousCornerRadius:a3];
}

- (void)setBlurProgress:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_blurProgress != a3)
  {
    self->_double blurProgress = a3;
    double v4 = fmin(fmax((a3 + -0.2) / 0.3 + 0.0, 0.0), 1.0);
    double v5 = fmin(fmax(v4 * -0.75 + 1.0, 0.25), 1.0);
    [(PGBackdropView *)self->_backdropView setGaussianBlurRadius:fmin(fmax(v4 * 15.0 + 0.0, 0.0), 15.0)];
    [(PGBackdropView *)self->_backdropView setBackdropScale:v5];
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      [(PGBackdropView *)self->_backdropView setAlpha:v4];
    }
    [(UIView *)self->_lightTintView setAlpha:v4];
    [(UIView *)self->_darkTintView setAlpha:v4];
    double v6 = PGLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double blurProgress = self->_blurProgress;
      int v8 = 134218496;
      double v9 = blurProgress;
      __int16 v10 = 2048;
      double v11 = v4;
      __int16 v12 = 2048;
      double v13 = v5;
      _os_log_impl(&dword_1B5645000, v6, OS_LOG_TYPE_DEFAULT, "[Layout] progress{%.2f} thresholdedProgress{%.2f} backdropScale{%.2f}", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)setChevronHidden:(BOOL)a3 left:(BOOL)a4
{
  if (self->_chevronsHidden != a3 || self->_isChevronShownLeft != a4)
  {
    self->_chevronsHidden = a3;
    self->_isChevronShownLeft = a4 & ~a3;
    [(PGStashView *)self layoutStashChevrons];
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
}

- (void)initWithFrame:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v4 = _PGLogMethodProem(a1, 1);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_debug_impl(&dword_1B5645000, a3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v5, 0xCu);
}

@end