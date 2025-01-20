@interface VUIAdditionalAdvisoryInfoView
- (BOOL)_isPortrait;
- (CGSize)_dividerSize;
- (CGSize)_logoSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)_descriptionMargin;
- (UIEdgeInsets)_dividerMargin;
- (UIEdgeInsets)_logoMargin;
- (UIEdgeInsets)_margin;
- (UIView)dividerView;
- (VUIAdditionalAdvisoryInfoView)initWithAdvisoryInfoDictionary:(id)a3 reduceMotion:(BOOL)a4;
- (VUIAdditionalAdvisoryInfoViewLayout)layout;
- (VUIImageView)logoImageView;
- (VUILabel)descriptionView;
- (VUITextLayout)descriptionLayout;
- (double)_descriptionViewYOffset;
- (double)_descriptionWidth;
- (double)animationDistance;
- (void)_configureSubviewsWithDictionary:(id)a3;
- (void)_hideWithAnimationWithPlatterView:(id)a3 hidePlatterView:(BOOL)a4 completion:(id)a5;
- (void)_showAnimatedLogoAndTextWithCompletion:(id)a3 platterView:(id)a4 animateDivider:(BOOL)a5;
- (void)hideAnimated:(BOOL)a3 platterView:(id)a4 hidePlatterView:(BOOL)a5 completion:(id)a6;
- (void)layoutSubviews;
- (void)setAnimationDistance:(double)a3;
- (void)setDescriptionView:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLogoImageView:(id)a3;
- (void)showWithAnimatedLogoAndText:(BOOL)a3 animateDivider:(BOOL)a4 platterView:(id)a5 completion:(id)a6;
@end

@implementation VUIAdditionalAdvisoryInfoView

- (VUIAdditionalAdvisoryInfoView)initWithAdvisoryInfoDictionary:(id)a3 reduceMotion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIAdditionalAdvisoryInfoView;
  v7 = -[VUIAdditionalAdvisoryInfoView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v7)
  {
    os_log_t v8 = os_log_create("com.apple.AppleTV.playback", "VUIPhotoSensitivityView");
    v9 = (void *)sLogObject_16;
    sLogObject_16 = (uint64_t)v8;

    uint64_t v10 = objc_opt_new();
    layout = v7->_layout;
    v7->_layout = (VUIAdditionalAdvisoryInfoViewLayout *)v10;

    [(VUIAdditionalAdvisoryInfoView *)v7 _configureSubviewsWithDictionary:v6];
    double v12 = 100.0;
    if (v4) {
      double v12 = 0.0;
    }
    v7->_animationDistance = v12;
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(VUIAdditionalAdvisoryInfoView *)self _logoSize];
  double v5 = v4;
  double v7 = v6;
  [(VUIAdditionalAdvisoryInfoView *)self _logoMargin];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(VUIAdditionalAdvisoryInfoView *)self _descriptionMargin];
  double v17 = v16;
  double v19 = v18;
  [(VUIAdditionalAdvisoryInfoView *)self _dividerSize];
  if (v20 < v7 + v9 + v13 && v20 == 0.0) {
    double v22 = v7 + v9 + v13;
  }
  else {
    double v22 = v20;
  }
  [(VUIAdditionalAdvisoryInfoView *)self _descriptionWidth];
  double v24 = v17 + v19 + v5 + v11 + v15 + v23;
  double v25 = v22;
  result.height = v25;
  result.width = v24;
  return result;
}

- (double)_descriptionViewYOffset
{
  v3 = [(VUIAdditionalAdvisoryInfoView *)self descriptionView];
  double v4 = [v3 layer];
  double v5 = [v4 presentationLayer];
  double v6 = 0.0;
  if (!v5)
  {
    [(VUIAdditionalAdvisoryInfoView *)self animationDistance];
    double v6 = -v7;
  }

  return v6;
}

- (void)layoutSubviews
{
  v67.receiver = self;
  v67.super_class = (Class)VUIAdditionalAdvisoryInfoView;
  [(VUIAdditionalAdvisoryInfoView *)&v67 layoutSubviews];
  int v3 = [(VUIAdditionalAdvisoryInfoView *)self vuiIsRTL];
  [(VUIAdditionalAdvisoryInfoView *)self bounds];
  double v63 = v4;
  double v59 = v5;
  double v7 = v6;
  [(VUIAdditionalAdvisoryInfoView *)self _logoSize];
  double v9 = v8;
  double v11 = v10;
  [(VUIAdditionalAdvisoryInfoView *)self _logoMargin];
  double v13 = v12;
  double v15 = v14;
  [(VUIAdditionalAdvisoryInfoView *)self _dividerSize];
  double v17 = v16;
  double v66 = v18;
  [(VUIAdditionalAdvisoryInfoView *)self _dividerMargin];
  double v58 = v19;
  double v21 = v20;
  double v61 = v22;
  [(VUIAdditionalAdvisoryInfoView *)self _descriptionMargin];
  double v60 = v23;
  [(VUIAdditionalAdvisoryInfoView *)self _descriptionWidth];
  double v62 = v24;
  double v54 = v13;
  double v56 = v7;
  double v25 = v7 - v15 - v9;
  double v26 = v63 + v13;
  if (v3) {
    double v27 = v25;
  }
  else {
    double v27 = v63 + v13;
  }
  double v64 = v27;
  double v28 = v11;
  VUIRoundValue();
  double v30 = v29;
  v31 = [(VUIAdditionalAdvisoryInfoView *)self logoImageView];
  double v32 = v28;
  double v33 = v26;
  objc_msgSend(v31, "setFrame:", v64, v30, v9, v32);

  double v65 = v21;
  double v34 = v26 + v9 + v15 + v21;
  double v35 = v15 + v21;
  double v36 = v15;
  double v37 = v17;
  double v38 = v25 - (v35 - v17);
  if (v3) {
    double v39 = v38;
  }
  else {
    double v39 = v34;
  }
  v40 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];

  if (v40)
  {
    v41 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
    [v41 frame];
    double v43 = v42;

    if (v43 > 0.0) {
      double v43 = v66;
    }
    v44 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
    objc_msgSend(v44, "setFrame:", v39, v59 + v58, v37, v43);

    double v45 = v37;
    double v46 = v66;
  }
  else
  {
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v46 = v66;
  }
  [(VUIAdditionalAdvisoryInfoView *)self _descriptionViewYOffset];
  double v48 = v47;
  if (v3)
  {
    double v49 = v62;
    double v50 = v57 - v55 - v9 - v36 - v65 - v37 - v61 - v60 - v62;
  }
  else
  {
    double v50 = v33 + v65 + v36 + v9 + v33 + v60 + v61 + v45;
    double v49 = v62;
  }
  -[VUILabel setFrame:](self->_descriptionView, "setFrame:", v50, v48, v49, v46);
  v51 = [(VUILabel *)self->_descriptionView layer];
  v52 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  [v52 descriptionCornerRadius];
  objc_msgSend(v51, "setCornerRadius:");

  v53 = [(VUILabel *)self->_descriptionView layer];
  [v53 setCompositingFilter:*MEMORY[0x1E4F3A370]];
}

- (BOOL)_isPortrait
{
  v2 = [(VUIAdditionalAdvisoryInfoView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (!v3 && (unint64_t)(objc_msgSend(MEMORY[0x1E4FB1F48], "vui_interfaceOrientation") - 1) < 2
    || (BOOL v4 = +[VUIUtilities isIpadPortrait]))
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (UIEdgeInsets)_margin
{
  BOOL v3 = [(VUIAdditionalAdvisoryInfoView *)self _isPortrait];
  BOOL v4 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  double v5 = v4;
  if (v3) {
    [v4 portraitMargin];
  }
  else {
    [v4 margin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (CGSize)_logoSize
{
  BOOL v3 = [(VUIAdditionalAdvisoryInfoView *)self _isPortrait];
  BOOL v4 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  double v5 = v4;
  if (v3) {
    [v4 portraitLogoSize];
  }
  else {
    [v4 logoSize];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_dividerSize
{
  [(VUIAdditionalAdvisoryInfoView *)self bounds];
  double v4 = v3;
  BOOL v5 = [(VUIAdditionalAdvisoryInfoView *)self _isPortrait];
  double v6 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  double v7 = v6;
  if (v5) {
    [v6 portraitDividerSize];
  }
  else {
    [v6 dividerSize];
  }
  double v9 = v8;

  double v10 = v9;
  double v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)_logoMargin
{
  BOOL v3 = [(VUIAdditionalAdvisoryInfoView *)self _isPortrait];
  double v4 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitLogoMargin];
  }
  else {
    [v4 logoMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_descriptionMargin
{
  BOOL v3 = [(VUIAdditionalAdvisoryInfoView *)self _isPortrait];
  double v4 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitDescriptionMargin];
  }
  else {
    [v4 descriptionMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)_descriptionWidth
{
  v2 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  [v2 descriptionWidth];
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)_dividerMargin
{
  BOOL v3 = [(VUIAdditionalAdvisoryInfoView *)self _isPortrait];
  double v4 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  BOOL v5 = v4;
  if (v3) {
    [v4 portraitDividerMargin];
  }
  else {
    [v4 dividerMargin];
  }
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)_configureSubviewsWithDictionary:(id)a3
{
  id v19 = a3;
  double v4 = objc_opt_new();
  BOOL v5 = [v19 objectForKeyedSubscript:@"VUIAdditionalAdvisoryInfoViewImageKey"];
  if (v5)
  {
    [v4 setImage:v5];
    double v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [v4 setTintColor:v6];
  }
  [v4 setAlpha:0.0];
  [(VUIAdditionalAdvisoryInfoView *)self addSubview:v4];
  [(VUIAdditionalAdvisoryInfoView *)self setLogoImageView:v4];
  [(VUIAdditionalAdvisoryInfoView *)self _dividerSize];
  double v8 = v7;
  double v9 = objc_opt_new();
  double v10 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  double v11 = [v10 dividerColor];
  [v9 setBackgroundColor:v11];

  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v8, 0.0);
  [(VUIAdditionalAdvisoryInfoView *)self addSubview:v9];
  [(VUIAdditionalAdvisoryInfoView *)self setDividerView:v9];
  double v12 = [v19 objectForKeyedSubscript:@"VUIIAdditionalAdvisoryInfoViewDescriptionKey"];
  double v13 = [(VUIAdditionalAdvisoryInfoView *)self description];
  double v14 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  double v15 = [v14 descriptionLayout];
  double v16 = +[VUILabel labelWithString:v13 textLayout:v15 existingLabel:0];

  [v16 setText:v12];
  [(VUIAdditionalAdvisoryInfoView *)self addSubview:v16];
  [(VUIAdditionalAdvisoryInfoView *)self setDescriptionView:v16];
  double v17 = [(VUILabel *)self->_descriptionView layer];
  double v18 = [(VUIAdditionalAdvisoryInfoView *)self layout];
  [v18 descriptionCornerRadius];
  objc_msgSend(v17, "setCornerRadius:");

  [(VUIAdditionalAdvisoryInfoView *)self layoutSubviews];
}

- (VUIAdditionalAdvisoryInfoViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (VUIImageView)logoImageView
{
  return self->_logoImageView;
}

- (void)setLogoImageView:(id)a3
{
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (VUILabel)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (VUITextLayout)descriptionLayout
{
  return self->_descriptionLayout;
}

- (double)animationDistance
{
  return self->_animationDistance;
}

- (void)setAnimationDistance:(double)a3
{
  self->_animationDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLayout, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)showWithAnimatedLogoAndText:(BOOL)a3 animateDivider:(BOOL)a4 platterView:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v30 = a5;
  double v10 = (void (**)(void))a6;
  if (v8)
  {
    [(VUIAdditionalAdvisoryInfoView *)self _showAnimatedLogoAndTextWithCompletion:v10 platterView:v30 animateDivider:v7];
  }
  else
  {
    double v11 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];

    if (v11)
    {
      double v12 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
      [v12 frame];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      [(VUIAdditionalAdvisoryInfoView *)self _dividerSize];
      double v20 = v19;
      double v21 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
      objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
    }
    double v22 = [(VUIAdditionalAdvisoryInfoView *)self logoImageView];
    [v22 setAlpha:1.0];

    double v23 = [(VUIAdditionalAdvisoryInfoView *)self descriptionView];
    [v23 setAlpha:1.0];

    if (v30)
    {
      [(VUIAdditionalAdvisoryInfoView *)self frame];
      double v25 = v24 + -15.0;
      [v30 frame];
      double v27 = v26;
      [(VUIAdditionalAdvisoryInfoView *)self frame];
      double v29 = v28 + 30.0;
      [v30 frame];
      objc_msgSend(v30, "setFrame:", v25, v27, v29);
    }
    v10[2](v10);
  }
}

- (void)_showAnimatedLogoAndTextWithCompletion:(id)a3 platterView:(id)a4 animateDivider:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x1E4F39CF8] begin];
  double v10 = (void *)MEMORY[0x1E4F39CF8];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __109__VUIAdditionalAdvisoryInfoView_Animator___showAnimatedLogoAndTextWithCompletion_platterView_animateDivider___block_invoke;
  v89[3] = &unk_1E6DF3DD0;
  id v88 = v8;
  id v90 = v88;
  [v10 setCompletionBlock:v89];
  double v11 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"bounds"];
  [v11 setMass:1.0];
  [v11 setStiffness:60.0];
  [v11 setDamping:16.0];
  [v11 setInitialVelocity:0.0];
  [v11 settlingDuration];
  objc_msgSend(v11, "setDuration:");
  double v12 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
  double v13 = [v12 layer];

  if (v5)
  {
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(VUIAdditionalAdvisoryInfoView *)self bounds];
    double v21 = v20;
    double v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v15, v17, v19, 0.0);
    [v11 setFromValue:v22];

    double v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v15, v17, v19, v21);
    [v11 setToValue:v23];

    [v13 addAnimation:v11 forKey:@"bounds"];
  }
  else
  {
    [(VUIAdditionalAdvisoryInfoView *)self bounds];
    double v15 = v24;
    double v17 = v25;
    double v19 = v26;
    double v21 = v27;
  }
  v87 = v13;
  objc_msgSend(v13, "setBounds:", v15, v17, v19, v21);
  if (v9)
  {
    double v28 = [v9 layer];
    [v28 bounds];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    [(VUIAdditionalAdvisoryInfoView *)self bounds];
    double v38 = v37 + 30.0;
    if (v34 == 0.0)
    {
      double v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v30, v32, v34, v36);
      [v11 setFromValue:v39];

      v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v30, v32, v38, v36);
      [v11 setToValue:v40];

      [v28 addAnimation:v11 forKey:@"bounds"];
      objc_msgSend(v28, "setBounds:", v30, v32, v38, v36);
    }
    else if (v34 < v38)
    {
      v41 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
      [v41 setMass:1.0];
      [v41 setStiffness:60.0];
      [v41 setDamping:16.0];
      [v41 setInitialVelocity:0.0];
      [v41 settlingDuration];
      objc_msgSend(v41, "setDuration:");
      [v28 position];
      double v43 = v42;
      double v45 = v44;
      double v46 = [(VUIAdditionalAdvisoryInfoView *)self layer];
      [v46 position];
      double v48 = v47;

      double v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v43, v45);
      [v41 setFromValue:v49];

      double v50 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v48, v45);
      [v41 setToValue:v50];

      [v28 addAnimation:v41 forKey:@"position"];
      objc_msgSend(v28, "setPosition:", v48, v45);
      [(VUIAdditionalAdvisoryInfoView *)self bounds];
      double v52 = v51 + 30.0;
      v53 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v30, v32, v34, v36);
      [v11 setFromValue:v53];

      double v54 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v30, v32, v52, v36);
      [v11 setToValue:v54];

      [v28 addAnimation:v11 forKey:@"bounds"];
      objc_msgSend(v28, "setBounds:", v30, v32, v52, v36);
    }
  }
  id v55 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v56) = 1.0;
  LODWORD(v57) = 1051260355;
  LODWORD(v58) = 1059816735;
  v85 = (void *)[v55 initWithControlPoints:v57 :0.0 :v58 :v56];
  [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  double v59 = v86 = v9;
  [v59 setTimingFunction:v85];
  [v59 setBeginTime:CACurrentMediaTime() + 0.8];
  double v60 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
  [v59 setFromValue:v60];

  LODWORD(v61) = 1.0;
  double v62 = [MEMORY[0x1E4F28ED0] numberWithFloat:v61];
  [v59 setToValue:v62];

  [v59 setDuration:0.88];
  [v59 setRemovedOnCompletion:0];
  uint64_t v63 = *MEMORY[0x1E4F39FA8];
  [v59 setFillMode:*MEMORY[0x1E4F39FA8]];
  double v64 = [(VUIAdditionalAdvisoryInfoView *)self logoImageView];
  v84 = [v64 layer];

  [v84 addAnimation:v59 forKey:@"opacity"];
  [v84 setOpacity:0.0];
  double v65 = [(VUILabel *)self->_descriptionView layer];
  double v66 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v66 setMass:1.0];
  [v66 setStiffness:24.0];
  [v66 setDamping:15.0];
  [v66 setInitialVelocity:0.0];
  [v66 settlingDuration];
  objc_msgSend(v66, "setDuration:");
  [v65 position];
  double v68 = v67;
  double v70 = v69;
  [(VUIAdditionalAdvisoryInfoView *)self animationDistance];
  double v72 = v70 + v71;
  v73 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v68, v70);
  [v66 setFromValue:v73];

  v74 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v68, v72);
  [v66 setToValue:v74];

  [v66 setRemovedOnCompletion:0];
  [v66 setFillMode:v63];
  [v65 addAnimation:v66 forKey:@"position"];
  objc_msgSend(v65, "setPosition:", v68, v70);
  id v75 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v76) = 1.0;
  LODWORD(v77) = 1051260355;
  LODWORD(v78) = 1059816735;
  v79 = (void *)[v75 initWithControlPoints:v77 :0.0 :v78 :v76];
  v80 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v80 setTimingFunction:v79];
  v81 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
  [v80 setFromValue:v81];

  LODWORD(v82) = 1.0;
  v83 = [MEMORY[0x1E4F28ED0] numberWithFloat:v82];
  [v80 setToValue:v83];

  [v80 setRemovedOnCompletion:0];
  [v80 setFillMode:v63];
  [v65 addAnimation:v80 forKey:@"opacity"];
  [v80 setBeginTime:CACurrentMediaTime() + 0.349999994];
  [v80 setDuration:3.0];
  [v65 setOpacity:0.0];
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __109__VUIAdditionalAdvisoryInfoView_Animator___showAnimatedLogoAndTextWithCompletion_platterView_animateDivider___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hideAnimated:(BOOL)a3 platterView:(id)a4 hidePlatterView:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  double v21 = (void (**)(void))a6;
  if (v8)
  {
    [(VUIAdditionalAdvisoryInfoView *)self _hideWithAnimationWithPlatterView:a4 hidePlatterView:v6 completion:v21];
  }
  else
  {
    double v10 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];

    if (v10)
    {
      double v11 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
      [v11 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      double v18 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
      objc_msgSend(v18, "setFrame:", v13, v15, v17, 0.0);
    }
    double v19 = [(VUIAdditionalAdvisoryInfoView *)self logoImageView];
    [v19 setAlpha:0.0];

    double v20 = [(VUIAdditionalAdvisoryInfoView *)self descriptionView];
    [v20 setAlpha:0.0];

    v21[2]();
  }
}

- (void)_hideWithAnimationWithPlatterView:(id)a3 hidePlatterView:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x1E4F39CF8] begin];
  double v10 = (void *)MEMORY[0x1E4F39CF8];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __104__VUIAdditionalAdvisoryInfoView_Animator___hideWithAnimationWithPlatterView_hidePlatterView_completion___block_invoke;
  v55[3] = &unk_1E6DF3DD0;
  id v54 = v9;
  id v56 = v54;
  [v10 setCompletionBlock:v55];
  id v11 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v12) = 1.0;
  LODWORD(v13) = 1051260355;
  LODWORD(v14) = 1059816735;
  uint64_t v15 = [v11 initWithControlPoints:v13 :0.0 :v14 :v12];
  double v16 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  v53 = (void *)v15;
  [v16 setTimingFunction:v15];
  [v16 setBeginTime:CACurrentMediaTime()];
  LODWORD(v17) = 1.0;
  double v18 = [MEMORY[0x1E4F28ED0] numberWithFloat:v17];
  [v16 setFromValue:v18];

  double v19 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
  [v16 setToValue:v19];

  [v16 setDuration:0.88];
  [v16 setRemovedOnCompletion:0];
  uint64_t v20 = *MEMORY[0x1E4F39FA8];
  [v16 setFillMode:*MEMORY[0x1E4F39FA8]];
  double v21 = [(VUIAdditionalAdvisoryInfoView *)self logoImageView];
  double v22 = [v21 layer];

  [v22 addAnimation:v16 forKey:@"opacity"];
  [v22 setOpacity:0.0];
  if (v8 && v6)
  {
    double v23 = [v8 layer];
    [v23 addAnimation:v16 forKey:@"opacity"];
    [v23 setOpacity:0.0];
  }
  id v24 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v25) = 1.0;
  LODWORD(v26) = 1051260355;
  LODWORD(v27) = 1059816735;
  double v51 = (void *)[v24 initWithControlPoints:v26 :0.0 :v27 :v25];
  [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  double v28 = v52 = v8;
  [v28 setTimingFunction:v51];
  LODWORD(v29) = 1.0;
  double v30 = [MEMORY[0x1E4F28ED0] numberWithFloat:v29];
  [v28 setFromValue:v30];

  double v31 = [MEMORY[0x1E4F28ED0] numberWithFloat:0.0];
  [v28 setToValue:v31];

  [v28 setDuration:0.810000002];
  [v28 setRemovedOnCompletion:0];
  [v28 setFillMode:v20];
  double v32 = [(VUIAdditionalAdvisoryInfoView *)self descriptionView];
  double v33 = [v32 layer];

  [v33 addAnimation:v28 forKey:@"opacity"];
  [v28 setBeginTime:CACurrentMediaTime() + 0.349999994];
  [v33 setOpacity:0.0];
  double v34 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  [v34 setDuration:0.88];
  id v35 = objc_alloc(MEMORY[0x1E4F39C10]);
  LODWORD(v36) = 1062501089;
  LODWORD(v37) = 1051260355;
  double v38 = (void *)[v35 initWithControlPoints:v37 :0.0 :v36 :0.0];
  [v34 setTimingFunction:v38];
  double v39 = [(VUIAdditionalAdvisoryInfoView *)self dividerView];
  v40 = [v39 layer];

  [v40 bounds];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  [v34 setFromValue:v49];

  double v50 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v42, v44, v46, 0.0);
  [v34 setToValue:v50];

  [v34 setRemovedOnCompletion:0];
  [v34 setFillMode:v20];
  [v40 addAnimation:v34 forKey:@"bounds"];
  objc_msgSend(v40, "setBounds:", v42, v44, v46, v48);
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __104__VUIAdditionalAdvisoryInfoView_Animator___hideWithAnimationWithPlatterView_hidePlatterView_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end