@interface DBSDisplayZoomOptionView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)highlighted;
- (BOOL)isSelected;
- (DBSCheckmarkView)_checkmarkView;
- (DBSDeviceDisplayZoomAnimationView)_packageView;
- (DBSDisplayZoomOptionView)initWithFrame:(CGRect)a3 displayZoomOption:(unint64_t)a4;
- (DBSDisplayZoomOptionViewDelegate)delegate;
- (UIImpactFeedbackGenerator)_feedbackGenerator;
- (UILabel)optionNameLabel;
- (unint64_t)displayZoomOption;
- (void)_configureView;
- (void)_userDidTapOnView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlight:(BOOL)a3;
- (void)setOptionNameLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)set_checkmarkView:(id)a3;
- (void)set_feedbackGenerator:(id)a3;
- (void)set_packageView:(id)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation DBSDisplayZoomOptionView

- (DBSDisplayZoomOptionView)initWithFrame:(CGRect)a3 displayZoomOption:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DBSDisplayZoomOptionView;
  v5 = -[DBSDisplayZoomOptionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_displayZoomOption = a4;
    [(DBSDisplayZoomOptionView *)v5 _configureView];
  }
  return v6;
}

- (void)_configureView
{
  v4 = [[DBSDeviceDisplayZoomAnimationView alloc] initWithDisplayZoomOption:[(DBSDisplayZoomOptionView *)self displayZoomOption]];
  packageView = self->__packageView;
  self->__packageView = v4;

  v6 = [(DBSDisplayZoomOptionView *)self _packageView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(DBSDisplayZoomOptionView *)self _packageView];
  [v7 setContentMode:1];

  objc_super v8 = [(DBSDisplayZoomOptionView *)self _packageView];
  [(DBSDisplayZoomOptionView *)self addSubview:v8];

  id v9 = objc_alloc(MEMORY[0x263F828E0]);
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  v14 = (UILabel *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
  optionNameLabel = self->_optionNameLabel;
  self->_optionNameLabel = v14;

  v16 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  v18 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  [v18 setFont:v17];

  v19 = [MEMORY[0x263F825C8] labelColor];
  v20 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  [v20 setTextColor:v19];

  v21 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  [v21 setAdjustsFontForContentSizeCategory:1];

  v22 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  [v22 setAdjustsFontSizeToFitWidth:1];

  v23 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  [(DBSDisplayZoomOptionView *)self addSubview:v23];

  switch([(DBSDisplayZoomOptionView *)self displayZoomOption])
  {
    case 0uLL:
      v24 = @"STANDARD";
      goto LABEL_6;
    case 1uLL:
      v24 = @"ZOOMED";
      goto LABEL_6;
    case 2uLL:
      v24 = @"DENSE";
      goto LABEL_6;
    case 3uLL:
      v24 = @"DENSER";
LABEL_6:
      v25 = DBS_LocalizedStringForMagnify(v24);
      v26 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
      [v26 setText:v25];

      break;
    default:
      break;
  }
  v27 = -[DBSCheckmarkView initWithFrame:]([DBSCheckmarkView alloc], "initWithFrame:", v10, v11, v12, v13);
  checkmarkView = self->__checkmarkView;
  self->__checkmarkView = v27;

  v29 = [(DBSDisplayZoomOptionView *)self _checkmarkView];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(DBSDisplayZoomOptionView *)self _checkmarkView];
  [(DBSDisplayZoomOptionView *)self addSubview:v30];

  v31 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x263F82830]) initWithStyle:0];
  feedbackGenerator = self->__feedbackGenerator;
  self->__feedbackGenerator = v31;

  id v82 = (id)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__userDidTapOnView_];
  [v82 setMinimumPressDuration:0.0];
  [v82 setCancelPastAllowableMovement:1];
  [v82 setDelegate:self];
  [(DBSDisplayZoomOptionView *)self addGestureRecognizer:v82];
  v33 = [MEMORY[0x263EFF980] array];
  v34 = [(DBSDisplayZoomOptionView *)self _packageView];
  v35 = [v34 topAnchor];
  v36 = [(DBSDisplayZoomOptionView *)self topAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v33 addObject:v37];

  v38 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  v39 = [v38 topAnchor];
  v40 = [(DBSDisplayZoomOptionView *)self _packageView];
  v41 = [v40 bottomAnchor];
  int v42 = DBSReverseZoomEnabled();
  if (v42)
  {
    v2 = [MEMORY[0x263F82670] currentDevice];
    int v43 = objc_msgSend(v2, "sf_isiPad");
    double v44 = 20.0;
    if (v43) {
      double v44 = 12.0;
    }
  }
  else
  {
    double v44 = 20.0;
  }
  v45 = [v39 constraintEqualToAnchor:v41 constant:v44];
  [v33 addObject:v45];

  if (v42) {
  v46 = [(DBSDisplayZoomOptionView *)self _checkmarkView];
  }
  v47 = [v46 topAnchor];
  v48 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  v49 = [v48 bottomAnchor];
  int v50 = DBSReverseZoomEnabled();
  if (v50)
  {
    v2 = [MEMORY[0x263F82670] currentDevice];
    int v51 = objc_msgSend(v2, "sf_isiPad");
    double v52 = 8.0;
    if (v51) {
      double v52 = 6.0;
    }
  }
  else
  {
    double v52 = 8.0;
  }
  v53 = [v47 constraintEqualToAnchor:v49 constant:v52];
  [v33 addObject:v53];

  if (v50) {
  v54 = [(DBSDisplayZoomOptionView *)self _checkmarkView];
  }
  v55 = [v54 bottomAnchor];
  v56 = [(DBSDisplayZoomOptionView *)self bottomAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  [v33 addObject:v57];

  v58 = [(DBSDisplayZoomOptionView *)self _packageView];
  v59 = [v58 leadingAnchor];
  v60 = [(DBSDisplayZoomOptionView *)self leadingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  [v33 addObject:v61];

  v62 = [(DBSDisplayZoomOptionView *)self _packageView];
  v63 = [v62 trailingAnchor];
  v64 = [(DBSDisplayZoomOptionView *)self trailingAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  [v33 addObject:v65];

  v66 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  v67 = [v66 centerXAnchor];
  v68 = [(DBSDisplayZoomOptionView *)self centerXAnchor];
  v69 = [v67 constraintEqualToAnchor:v68];
  [v33 addObject:v69];

  v70 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  v71 = [v70 leadingAnchor];
  v72 = [(DBSDisplayZoomOptionView *)self leadingAnchor];
  v73 = [v71 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v72 multiplier:1.0];
  [v33 addObject:v73];

  v74 = [(DBSDisplayZoomOptionView *)self trailingAnchor];
  v75 = [(DBSDisplayZoomOptionView *)self optionNameLabel];
  v76 = [v75 trailingAnchor];
  v77 = [v74 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v76 multiplier:1.0];
  [v33 addObject:v77];

  v78 = [(DBSDisplayZoomOptionView *)self _checkmarkView];
  v79 = [v78 centerXAnchor];
  v80 = [(DBSDisplayZoomOptionView *)self centerXAnchor];
  v81 = [v79 constraintEqualToAnchor:v80];
  [v33 addObject:v81];

  [MEMORY[0x263F08938] activateConstraints:v33];
}

- (void)_userDidTapOnView:(id)a3
{
  uint64_t v4 = [a3 state];
  [(DBSDisplayZoomOptionView *)self setHighlight:(unint64_t)(v4 - 1) < 2];
  if (![(DBSDisplayZoomOptionView *)self isSelected])
  {
    if (v4 == 3)
    {
      v5 = [(DBSDisplayZoomOptionView *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        return;
      }
      v7 = [(DBSDisplayZoomOptionView *)self delegate];
      [v7 userDidTapOnDisplayZoomOptionView:self];

      id v8 = [(DBSDisplayZoomOptionView *)self _feedbackGenerator];
      [v8 impactOccurred];
    }
    else
    {
      if (v4 != 1) {
        return;
      }
      id v8 = [(DBSDisplayZoomOptionView *)self _feedbackGenerator];
      [v8 prepare];
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
    [(DBSDisplayZoomOptionView *)self setAlpha:v3];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    BOOL v3 = a3;
    self->_selected = a3;
    id v4 = [(DBSDisplayZoomOptionView *)self _checkmarkView];
    [v4 setSelected:v3];
  }
}

- (void)startAnimation
{
  id v2 = [(DBSDisplayZoomOptionView *)self _packageView];
  [v2 startAnimation];
}

- (void)stopAnimation
{
  id v2 = [(DBSDisplayZoomOptionView *)self _packageView];
  [v2 stopAnimation];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DBSDisplayZoomOptionView *)self gestureRecognizers];
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

- (unint64_t)displayZoomOption
{
  return self->_displayZoomOption;
}

- (DBSDisplayZoomOptionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBSDisplayZoomOptionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UILabel)optionNameLabel
{
  return self->_optionNameLabel;
}

- (void)setOptionNameLabel:(id)a3
{
}

- (DBSCheckmarkView)_checkmarkView
{
  return self->__checkmarkView;
}

- (void)set_checkmarkView:(id)a3
{
}

- (DBSDeviceDisplayZoomAnimationView)_packageView
{
  return self->__packageView;
}

- (void)set_packageView:(id)a3
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
  objc_storeStrong((id *)&self->__packageView, 0);
  objc_storeStrong((id *)&self->__checkmarkView, 0);
  objc_storeStrong((id *)&self->_optionNameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end