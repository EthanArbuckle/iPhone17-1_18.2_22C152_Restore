@interface DBSCheckmarkView
- (BOOL)isSelected;
- (DBSCheckmarkView)initWithFrame:(CGRect)a3;
- (UIImageView)_checkmarkImageView;
- (UIImageView)_circleImageView;
- (void)_configureView;
- (void)_updateViewState;
- (void)setSelected:(BOOL)a3;
- (void)set_checkmarkImageView:(id)a3;
- (void)set_circleImageView:(id)a3;
@end

@implementation DBSCheckmarkView

- (DBSCheckmarkView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBSCheckmarkView;
  v3 = -[DBSCheckmarkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_selected = 0;
    [(DBSCheckmarkView *)v3 _configureView];
  }
  return v4;
}

- (void)_configureView
{
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [(DBSCheckmarkView *)self set_checkmarkImageView:v8];

  v9 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle.fill" compatibleWithTraitCollection:0];
  v10 = [v9 _imageThatSuppressesAccessibilityHairlineThickening];
  v11 = [v10 imageWithRenderingMode:2];
  v12 = [(DBSCheckmarkView *)self _checkmarkImageView];
  [v12 setImage:v11];

  v13 = [(DBSCheckmarkView *)self _checkmarkImageView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(DBSCheckmarkView *)self _checkmarkImageView];
  [v14 setContentMode:4];

  v15 = [(DBSCheckmarkView *)self _checkmarkImageView];
  [v15 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];

  v16 = [(DBSCheckmarkView *)self _checkmarkImageView];
  [v16 setAlpha:0.0];

  uint64_t v17 = *MEMORY[0x263F83570];
  v18 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F83570] scale:3];
  v19 = [(DBSCheckmarkView *)self _checkmarkImageView];
  [v19 setPreferredSymbolConfiguration:v18];

  v20 = [(DBSCheckmarkView *)self _checkmarkImageView];
  [(DBSCheckmarkView *)self addSubview:v20];

  v21 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v4, v5, v6, v7);
  [(DBSCheckmarkView *)self set_circleImageView:v21];

  v22 = [MEMORY[0x263F827E8] systemImageNamed:@"circle" compatibleWithTraitCollection:0];
  v23 = [v22 imageWithRenderingMode:2];
  v24 = [(DBSCheckmarkView *)self _circleImageView];
  [v24 setImage:v23];

  v25 = [(DBSCheckmarkView *)self _circleImageView];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = [(DBSCheckmarkView *)self _circleImageView];
  [v26 setContentMode:4];

  v27 = [(DBSCheckmarkView *)self _circleImageView];
  [v27 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];

  v28 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  v29 = [(DBSCheckmarkView *)self _circleImageView];
  [v29 setTintColor:v28];

  v30 = [MEMORY[0x263F82818] configurationWithTextStyle:v17 scale:3];
  v31 = [(DBSCheckmarkView *)self _circleImageView];
  [v31 setPreferredSymbolConfiguration:v30];

  v32 = [(DBSCheckmarkView *)self _circleImageView];
  [(DBSCheckmarkView *)self addSubview:v32];

  id v75 = [MEMORY[0x263EFF980] array];
  v33 = [(DBSCheckmarkView *)self _checkmarkImageView];
  v34 = [v33 leadingAnchor];
  v35 = [(DBSCheckmarkView *)self leadingAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v75 addObject:v36];

  v37 = [(DBSCheckmarkView *)self _checkmarkImageView];
  v38 = [v37 trailingAnchor];
  v39 = [(DBSCheckmarkView *)self trailingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v75 addObject:v40];

  v41 = [(DBSCheckmarkView *)self _checkmarkImageView];
  v42 = [v41 topAnchor];
  v43 = [(DBSCheckmarkView *)self topAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v75 addObject:v44];

  v45 = [(DBSCheckmarkView *)self _checkmarkImageView];
  v46 = [v45 bottomAnchor];
  v47 = [(DBSCheckmarkView *)self bottomAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  [v75 addObject:v48];

  v49 = [(DBSCheckmarkView *)self _circleImageView];
  v50 = [v49 leadingAnchor];
  v51 = [(DBSCheckmarkView *)self leadingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v75 addObject:v52];

  v53 = [(DBSCheckmarkView *)self _circleImageView];
  v54 = [v53 trailingAnchor];
  v55 = [(DBSCheckmarkView *)self trailingAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  [v75 addObject:v56];

  v57 = [(DBSCheckmarkView *)self _circleImageView];
  v58 = [v57 topAnchor];
  v59 = [(DBSCheckmarkView *)self topAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v75 addObject:v60];

  v61 = [(DBSCheckmarkView *)self _circleImageView];
  v62 = [v61 bottomAnchor];
  v63 = [(DBSCheckmarkView *)self bottomAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  [v75 addObject:v64];

  v65 = [(DBSCheckmarkView *)self _circleImageView];
  v66 = [v65 heightAnchor];
  v67 = [(DBSCheckmarkView *)self _circleImageView];
  v68 = [v67 widthAnchor];
  v69 = [v66 constraintEqualToAnchor:v68 multiplier:1.0];
  [v75 addObject:v69];

  v70 = [(DBSCheckmarkView *)self _checkmarkImageView];
  v71 = [v70 heightAnchor];
  v72 = [(DBSCheckmarkView *)self _checkmarkImageView];
  v73 = [v72 widthAnchor];
  v74 = [v71 constraintEqualToAnchor:v73 multiplier:1.0];
  [v75 addObject:v74];

  [MEMORY[0x263F08938] activateConstraints:v75];
}

- (void)_updateViewState
{
  memset(&v14, 0, sizeof(v14));
  BOOL v3 = [(DBSCheckmarkView *)self isSelected];
  double v4 = (_OWORD *)MEMORY[0x263F000D0];
  if (v3)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v14.c = v5;
    *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 0.01, 0.01);
  }
  double v6 = [(DBSCheckmarkView *)self _checkmarkImageView];
  long long v7 = v4[1];
  *(_OWORD *)&v13.a = *v4;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = v4[2];
  [v6 setTransform:&v13];

  v8 = [(DBSCheckmarkView *)self _checkmarkImageView];
  CGAffineTransform v13 = v14;
  [v8 setTransform:&v13];

  v9 = [(DBSCheckmarkView *)self _checkmarkImageView];
  if ([(DBSCheckmarkView *)self isSelected]) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  [v9 setAlpha:v10];

  v11 = [(DBSCheckmarkView *)self _circleImageView];
  if ([(DBSCheckmarkView *)self isSelected]) {
    double v12 = 0.0;
  }
  else {
    double v12 = 1.0;
  }
  [v11 setAlpha:v12];
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __32__DBSCheckmarkView_setSelected___block_invoke;
    v3[3] = &unk_264C7A6B0;
    v3[4] = self;
    [MEMORY[0x263F82E00] _animateUsingDefaultTimingWithOptions:2054 animations:v3 completion:0];
  }
}

uint64_t __32__DBSCheckmarkView_setSelected___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateViewState];
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIImageView)_checkmarkImageView
{
  return self->__checkmarkImageView;
}

- (void)set_checkmarkImageView:(id)a3
{
}

- (UIImageView)_circleImageView
{
  return self->__circleImageView;
}

- (void)set_circleImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__circleImageView, 0);
  objc_storeStrong((id *)&self->__checkmarkImageView, 0);
}

@end