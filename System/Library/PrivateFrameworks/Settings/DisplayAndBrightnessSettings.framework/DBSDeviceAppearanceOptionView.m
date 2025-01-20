@interface DBSDeviceAppearanceOptionView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)highlighted;
- (DBSCheckmarkView)_checkmarkView;
- (DBSDeviceAppearanceOptionView)initWithFrame:(CGRect)a3 appearanceOption:(unint64_t)a4;
- (DBSDeviceAppearanceOptionViewDelegate)delegate;
- (UIImageView)_previewImageView;
- (UIImpactFeedbackGenerator)_feedbackGenerator;
- (UILabel)_label;
- (UILabel)_timeLabel;
- (UIStackView)_stackView;
- (unint64_t)appearanceOption;
- (void)_configureView;
- (void)_updateViewForCurrentInterfaceStyle:(int64_t)a3;
- (void)_userDidTapOnView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlight:(BOOL)a3;
- (void)set_checkmarkView:(id)a3;
- (void)set_feedbackGenerator:(id)a3;
- (void)set_label:(id)a3;
- (void)set_previewImageView:(id)a3;
- (void)set_stackView:(id)a3;
- (void)set_timeLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBSDeviceAppearanceOptionView

- (DBSDeviceAppearanceOptionView)initWithFrame:(CGRect)a3 appearanceOption:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DBSDeviceAppearanceOptionView;
  v5 = -[DBSDeviceAppearanceOptionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_appearanceOption = a4;
    v5->_highlight = 0;
    [(DBSDeviceAppearanceOptionView *)v5 _configureView];
  }
  return v6;
}

- (void)_configureView
{
  v80[3] = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F82830]) initWithStyle:0];
  [(DBSDeviceAppearanceOptionView *)self set_feedbackGenerator:v3];

  id v4 = objc_alloc(MEMORY[0x263F82828]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  [(DBSDeviceAppearanceOptionView *)self set_previewImageView:v9];

  v10 = [(DBSDeviceAppearanceOptionView *)self _previewImageView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  unint64_t v11 = [(DBSDeviceAppearanceOptionView *)self appearanceOption];
  v12 = (void *)MEMORY[0x263F827E8];
  v13 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
  if (v11) {
    v14 = @"AppearanceDark";
  }
  else {
    v14 = @"AppearanceLight";
  }
  v15 = [v12 imageNamed:v14 inBundle:v13 compatibleWithTraitCollection:0];
  v16 = [(DBSDeviceAppearanceOptionView *)self _previewImageView];
  [v16 setImage:v15];

  v17 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
  [(DBSDeviceAppearanceOptionView *)self set_label:v17];

  v18 = [(DBSDeviceAppearanceOptionView *)self _label];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(DBSDeviceAppearanceOptionView *)self _label];
  [v19 setAdjustsFontForContentSizeCategory:1];

  v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v21 = [(DBSDeviceAppearanceOptionView *)self _label];
  [v21 setFont:v20];

  v22 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
  [(DBSDeviceAppearanceOptionView *)self set_timeLabel:v22];

  v23 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  CTFontRef v24 = CTFontCreateWithNameAndOptions(@".SFSoftTime-Semibold", 15.0, 0, 0x20000uLL);
  v25 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  [v25 setFont:v24];

  v26 = [MEMORY[0x263F825C8] whiteColor];
  v27 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  [v27 setTextColor:v26];

  v28 = DBSLockScreenTimeString();
  v29 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  [v29 setText:v28];

  v30 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  [v30 setTextAlignment:1];

  v31 = [(DBSDeviceAppearanceOptionView *)self _previewImageView];
  v32 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  [v31 addSubview:v32];

  v33 = -[DBSCheckmarkView initWithFrame:]([DBSCheckmarkView alloc], "initWithFrame:", v5, v6, v7, v8);
  [(DBSDeviceAppearanceOptionView *)self set_checkmarkView:v33];

  v34 = [(DBSDeviceAppearanceOptionView *)self _checkmarkView];
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];

  if ([(DBSDeviceAppearanceOptionView *)self appearanceOption]) {
    v35 = @"DARK";
  }
  else {
    v35 = @"LIGHT";
  }
  v36 = DBS_LocalizedStringForDisplays(v35);
  v37 = [(DBSDeviceAppearanceOptionView *)self _label];
  [v37 setText:v36];

  v38 = [(DBSDeviceAppearanceOptionView *)self traitCollection];
  -[DBSDeviceAppearanceOptionView _updateViewForCurrentInterfaceStyle:](self, "_updateViewForCurrentInterfaceStyle:", [v38 userInterfaceStyle]);

  id v39 = objc_alloc(MEMORY[0x263F82BF8]);
  v40 = [(DBSDeviceAppearanceOptionView *)self _previewImageView];
  v41 = [(DBSDeviceAppearanceOptionView *)self _label];
  v80[1] = v41;
  v42 = [(DBSDeviceAppearanceOptionView *)self _checkmarkView];
  v80[2] = v42;
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:3];
  v44 = (void *)[v39 initWithArrangedSubviews:v43];
  [(DBSDeviceAppearanceOptionView *)self set_stackView:v44];

  v45 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  [v45 setTranslatesAutoresizingMaskIntoConstraints:0];

  v46 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  [v46 setAxis:1];

  v47 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  [v47 setAlignment:3];

  v48 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  [v48 setSpacing:1.17549435e-38];

  v49 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  [(DBSDeviceAppearanceOptionView *)self addSubview:v49];

  v50 = [MEMORY[0x263EFF980] array];
  v51 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  v52 = [v51 leadingAnchor];
  v53 = [(DBSDeviceAppearanceOptionView *)self leadingAnchor];
  v54 = [v52 constraintEqualToAnchor:v53];
  [v50 addObject:v54];

  v55 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  v56 = [v55 trailingAnchor];
  v57 = [(DBSDeviceAppearanceOptionView *)self trailingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v50 addObject:v58];

  v59 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  v60 = [v59 centerXAnchor];
  v61 = [(DBSDeviceAppearanceOptionView *)self _previewImageView];
  v62 = [v61 centerXAnchor];
  v63 = [v60 constraintEqualToAnchor:v62];
  [v50 addObject:v63];

  v64 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  v65 = [v64 topAnchor];
  v66 = [(DBSDeviceAppearanceOptionView *)self topAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  [v50 addObject:v67];

  v68 = [(DBSDeviceAppearanceOptionView *)self _stackView];
  v69 = [v68 bottomAnchor];
  v70 = [(DBSDeviceAppearanceOptionView *)self bottomAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  [v50 addObject:v71];

  v72 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v72, "sf_isiPad")) {
    double v73 = 11.0;
  }
  else {
    double v73 = 15.0;
  }

  v74 = [(DBSDeviceAppearanceOptionView *)self _timeLabel];
  v75 = [v74 topAnchor];
  v76 = [(DBSDeviceAppearanceOptionView *)self _previewImageView];
  v77 = [v76 topAnchor];
  v78 = [v75 constraintEqualToAnchor:v77 constant:v73];
  [v50 addObject:v78];

  [MEMORY[0x263F08938] activateConstraints:v50];
  v79 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__userDidTapOnView_];
  [v79 setMinimumPressDuration:0.0];
  [v79 setCancelPastAllowableMovement:1];
  [v79 setDelegate:self];
  [(DBSDeviceAppearanceOptionView *)self addGestureRecognizer:v79];
}

- (void)_updateViewForCurrentInterfaceStyle:(int64_t)a3
{
  unint64_t v5 = [(DBSDeviceAppearanceOptionView *)self appearanceOption];
  double v6 = [(DBSDeviceAppearanceOptionView *)self _checkmarkView];
  id v8 = v6;
  uint64_t v7 = 1;
  if (v5 == 1) {
    uint64_t v7 = 2;
  }
  [v6 setSelected:v7 == a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(DBSDeviceAppearanceOptionView *)self traitCollection];
  -[DBSDeviceAppearanceOptionView _updateViewForCurrentInterfaceStyle:](self, "_updateViewForCurrentInterfaceStyle:", [v4 userInterfaceStyle]);
}

- (void)_userDidTapOnView:(id)a3
{
  uint64_t v4 = [a3 state];
  [(DBSDeviceAppearanceOptionView *)self setHighlight:(unint64_t)(v4 - 1) < 2];
  unint64_t v5 = [(DBSDeviceAppearanceOptionView *)self _checkmarkView];
  char v6 = [v5 isSelected];

  if ((v6 & 1) == 0)
  {
    if (v4 == 3)
    {
      uint64_t v7 = [(DBSDeviceAppearanceOptionView *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) == 0) {
        return;
      }
      v9 = [(DBSDeviceAppearanceOptionView *)self delegate];
      [v9 userDidTapOnAppearanceOptionView:self];

      id v10 = [(DBSDeviceAppearanceOptionView *)self _feedbackGenerator];
      [v10 impactOccurred];
    }
    else
    {
      if (v4 != 1) {
        return;
      }
      id v10 = [(DBSDeviceAppearanceOptionView *)self _feedbackGenerator];
      [v10 prepare];
    }
  }
}

- (void)setHighlight:(BOOL)a3
{
  if (self->_highlight != a3)
  {
    self->_highlight = a3;
    double v3 = 1.0;
    if (a3) {
      double v3 = 0.5;
    }
    [(DBSDeviceAppearanceOptionView *)self setAlpha:v3];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(DBSDeviceAppearanceOptionView *)self gestureRecognizers];
  int v9 = [v8 containsObject:v7];

  if (v9)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (DBSDeviceAppearanceOptionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSDeviceAppearanceOptionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)appearanceOption
{
  return self->_appearanceOption;
}

- (UIStackView)_stackView
{
  return self->__stackView;
}

- (void)set_stackView:(id)a3
{
}

- (UIImageView)_previewImageView
{
  return self->__previewImageView;
}

- (void)set_previewImageView:(id)a3
{
}

- (UILabel)_timeLabel
{
  return self->__timeLabel;
}

- (void)set_timeLabel:(id)a3
{
}

- (UILabel)_label
{
  return self->__label;
}

- (void)set_label:(id)a3
{
}

- (DBSCheckmarkView)_checkmarkView
{
  return self->__checkmarkView;
}

- (void)set_checkmarkView:(id)a3
{
}

- (UIImpactFeedbackGenerator)_feedbackGenerator
{
  return self->__feedbackGenerator;
}

- (void)set_feedbackGenerator:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackGenerator, 0);
  objc_storeStrong((id *)&self->__checkmarkView, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->__timeLabel, 0);
  objc_storeStrong((id *)&self->__previewImageView, 0);
  objc_storeStrong((id *)&self->__stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end