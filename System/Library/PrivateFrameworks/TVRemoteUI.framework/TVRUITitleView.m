@interface TVRUITitleView
- (BOOL)isExclusiveTouch;
- (TVRUIStyleProvider)styleProvider;
- (TVRUITitleView)initWithStyleProvider:(id)a3;
- (UIImageView)deviceModelImageView;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (void)_animateTouchesUp;
- (void)_setupConstraints;
- (void)_setupViewsIfNeeded;
- (void)_updateDeviceNameAutomationIdentifier:(id)a3;
- (void)setDeviceModelImageView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateTitleWithDeviceName:(id)a3 icon:(id)a4;
@end

@implementation TVRUITitleView

- (TVRUITitleView)initWithStyleProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRUITitleView;
  v6 = [(TVRUITitleView *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleProvider, a3);
    [(TVRUITitleView *)v7 _setupViewsIfNeeded];
  }

  return v7;
}

- (void)_setupViewsIfNeeded
{
  v61[3] = *MEMORY[0x263EF8340];
  v3 = [(TVRUITitleView *)self deviceModelImageView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F82828]);
    [(TVRUITitleView *)self setDeviceModelImageView:v4];

    id v5 = [(TVRUITitleView *)self deviceModelImageView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(TVRUITitleView *)self styleProvider];
    v7 = [v6 primaryTextAndGlyphColor];
    v8 = [(TVRUITitleView *)self deviceModelImageView];
    [v8 setTintColor:v7];

    objc_super v9 = [(TVRUITitleView *)self deviceModelImageView];
    [v9 setContentMode:4];

    v10 = [(TVRUITitleView *)self deviceModelImageView];
    LODWORD(v11) = 1144750080;
    [v10 setContentCompressionResistancePriority:0 forAxis:v11];

    v12 = [(TVRUITitleView *)self deviceModelImageView];
    [v12 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  }
  v13 = [(TVRUITitleView *)self titleLabel];

  if (!v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F828E0]);
    [(TVRUITitleView *)self setTitleLabel:v14];

    v15 = [(TVRUITitleView *)self styleProvider];
    v16 = [v15 fontForDeviceTitle];
    v17 = [(TVRUITitleView *)self titleLabel];
    [v17 setFont:v16];

    v18 = [(TVRUITitleView *)self styleProvider];
    v19 = [v18 textColorForDeviceTitle];
    v20 = [(TVRUITitleView *)self titleLabel];
    [v20 setTextColor:v19];

    v21 = [(TVRUITitleView *)self titleLabel];
    [v21 setAdjustsFontSizeToFitWidth:1];

    v22 = [(TVRUITitleView *)self titleLabel];
    [v22 setMinimumScaleFactor:0.4];

    v23 = [(TVRUITitleView *)self titleLabel];
    [v23 setAdjustsFontForContentSizeCategory:1];

    v24 = [(TVRUITitleView *)self titleLabel];
    LODWORD(v25) = 1132068864;
    [v24 setContentCompressionResistancePriority:0 forAxis:v25];

    v26 = [(TVRUITitleView *)self titleLabel];
    LODWORD(v27) = 1132068864;
    [v26 setContentHuggingPriority:0 forAxis:v27];
  }
  v28 = [(TVRUITitleView *)self imageView];

  if (!v28)
  {
    id v29 = objc_alloc_init(MEMORY[0x263F82828]);
    [(TVRUITitleView *)self setImageView:v29];

    v30 = [(TVRUITitleView *)self imageView];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

    v31 = [(TVRUITitleView *)self styleProvider];
    v32 = [v31 tintColorForChevronImage];
    v33 = [(TVRUITitleView *)self imageView];
    [v33 setTintColor:v32];

    v34 = [(TVRUITitleView *)self styleProvider];
    v35 = [v34 chevronImage];
    v36 = [(TVRUITitleView *)self imageView];
    [v36 setImage:v35];

    v37 = [(TVRUITitleView *)self imageView];
    [v37 setContentMode:4];

    v38 = [(TVRUITitleView *)self imageView];
    LODWORD(v39) = 1144750080;
    [v38 setContentCompressionResistancePriority:0 forAxis:v39];

    v40 = [(TVRUITitleView *)self imageView];
    [v40 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  }
  v41 = [(TVRUITitleView *)self stackView];

  if (!v41)
  {
    id v42 = objc_alloc(MEMORY[0x263F82770]);
    v43 = (void *)[v42 initForTextStyle:*MEMORY[0x263F835D0]];
    id v44 = objc_alloc(MEMORY[0x263F82BF8]);
    v45 = [(TVRUITitleView *)self deviceModelImageView];
    v46 = [(TVRUITitleView *)self titleLabel];
    v61[1] = v46;
    v47 = [(TVRUITitleView *)self imageView];
    v61[2] = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:3];
    v49 = (void *)[v44 initWithArrangedSubviews:v48];
    [(TVRUITitleView *)self setStackView:v49];

    v50 = [(TVRUITitleView *)self stackView];
    [v50 setTranslatesAutoresizingMaskIntoConstraints:0];

    v51 = [(TVRUITitleView *)self stackView];
    [v51 setAlignment:3];

    v52 = [(TVRUITitleView *)self stackView];
    [v43 scaledValueForValue:6.0];
    double v54 = v53;
    v55 = [(TVRUITitleView *)self deviceModelImageView];
    [v52 setCustomSpacing:v55 afterView:v54];

    v56 = [(TVRUITitleView *)self stackView];
    [v43 scaledValueForValue:3.0];
    double v58 = v57;
    v59 = [(TVRUITitleView *)self titleLabel];
    [v56 setCustomSpacing:v59 afterView:v58];

    v60 = [(TVRUITitleView *)self stackView];
    [(TVRUITitleView *)self addSubview:v60];
  }
  [(TVRUITitleView *)self _setupConstraints];
}

- (void)_setupConstraints
{
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = [(TVRUITitleView *)self stackView];
  id v4 = [v3 centerXAnchor];
  id v5 = [(TVRUITitleView *)self centerXAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [v25 addObject:v6];

  v7 = [(TVRUITitleView *)self stackView];
  v8 = [v7 centerYAnchor];
  objc_super v9 = [(TVRUITitleView *)self centerYAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v25 addObject:v10];

  double v11 = [(TVRUITitleView *)self stackView];
  v12 = [v11 widthAnchor];
  v13 = [(TVRUITitleView *)self widthAnchor];
  id v14 = [v12 constraintLessThanOrEqualToAnchor:v13];
  [v25 addObject:v14];

  v15 = [(TVRUITitleView *)self stackView];
  v16 = [v15 heightAnchor];
  v17 = [(TVRUITitleView *)self heightAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v25 addObject:v18];

  v19 = [(TVRUITitleView *)self deviceModelImageView];
  v20 = [v19 widthAnchor];
  v21 = [v20 constraintEqualToConstant:24.0];
  [v25 addObject:v21];

  v22 = [(TVRUITitleView *)self imageView];
  v23 = [v22 widthAnchor];
  v24 = [v23 constraintEqualToConstant:15.0];
  [v25 addObject:v24];

  [MEMORY[0x263F08938] activateConstraints:v25];
}

- (void)updateTitleWithDeviceName:(id)a3 icon:(id)a4
{
  id v6 = a4;
  id v11 = a3;
  [(TVRUITitleView *)self _setupViewsIfNeeded];
  v7 = [(TVRUITitleView *)self titleLabel];
  [v7 setText:v11];

  v8 = [(TVRUITitleView *)self deviceModelImageView];
  [v8 setImage:v6];

  BOOL v9 = v6 == 0;
  v10 = [(TVRUITitleView *)self deviceModelImageView];
  [v10 setHidden:v9];

  [(TVRUITitleView *)self _updateDeviceNameAutomationIdentifier:v11];
}

- (void)_updateDeviceNameAutomationIdentifier:(id)a3
{
  [NSString stringWithFormat:@"selectedDevice=\"%@\"", a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [NSString stringWithFormat:@"UIA.TVRemoteService.%@", v6];
  id v5 = [(TVRUITitleView *)self titleLabel];
  [v5 setAccessibilityIdentifier:v4];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (BOOL)isExclusiveTouch
{
  return 1;
}

- (void)_animateTouchesUp
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__TVRUITitleView__animateTouchesUp__block_invoke;
  v2[3] = &unk_2647FFF70;
  v2[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v2 animations:0.48];
}

uint64_t __35__TVRUITitleView__animateTouchesUp__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)deviceModelImageView
{
  return self->_deviceModelImageView;
}

- (void)setDeviceModelImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_deviceModelImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end