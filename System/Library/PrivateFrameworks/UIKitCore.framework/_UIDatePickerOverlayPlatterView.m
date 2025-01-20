@interface _UIDatePickerOverlayPlatterView
- (BOOL)accessoryViewIgnoresDefaultInsets;
- (CGRect)contentBounds;
- (CGSize)preferredContentSize;
- (CGSize)preferredPlatterSize;
- (NSLayoutConstraint)contentHeightConstraint;
- (NSLayoutConstraint)contentWidthConstraint;
- (UIDatePicker)datePicker;
- (UIView)accessoryView;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)previousContentView;
- (_UIDatePickerOverlayPlatterView)initWithDatePicker:(id)a3 accessoryView:(id)a4;
- (_UIDatePickerStyle)datePickerStyle;
- (_UIRoundedRectShadowView)shadowView;
- (void)datePickerTransitionAnimation;
- (void)datePickerTransitionCompletion;
- (void)layoutSubviews;
- (void)prepareDatePickerTransitionWithDatePicker:(id)a3;
- (void)replaceDatePicker:(id)a3;
- (void)setAccessoryViewIgnoresDefaultInsets:(BOOL)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation _UIDatePickerOverlayPlatterView

- (_UIDatePickerOverlayPlatterView)initWithDatePicker:(id)a3 accessoryView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_UIDatePickerOverlayPlatterView;
  v8 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    [(UIView *)v8 setUserInteractionEnabled:1];
    [(UIView *)v9 setClipsToBounds:0];
    v10 = [(UIView *)v9 layer];
    [v10 setAllowsGroupOpacity:0];

    v11 = [v6 _style];
    [v11 overlayPlatterCornerRadius];
    double v13 = v12;

    v14 = [(_UIRoundedRectShadowView *)[_UICutoutShadowView alloc] initWithCornerRadius:v13];
    [(UIView *)v14 setUserInteractionEnabled:0];
    [(UIView *)v9 bounds];
    -[_UIRoundedRectShadowView frameWithContentWithFrame:](v14, "frameWithContentWithFrame:");
    -[UIImageView setFrame:](v14, "setFrame:");
    v15 = [v6 _style];
    -[UIImageView setHidden:](v14, "setHidden:", [v15 overlayPlatterWantsShadowView] ^ 1);

    [(UIView *)v9 addSubview:v14];
    shadowView = v9->_shadowView;
    v9->_shadowView = &v14->super;
    v17 = v14;

    v18 = [v6 _style];
    v19 = [v18 createOverlayBackgroundView];

    [(UIView *)v9 addSubview:v19];
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v19;
    v21 = v19;

    objc_storeStrong((id *)&v9->_accessoryView, a4);
    [(_UIDatePickerOverlayPlatterView *)v9 replaceDatePicker:v6];
  }

  return v9;
}

- (void)replaceDatePicker:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v5, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  p_datePicker = (id *)&self->_datePicker;
  objc_storeStrong((id *)&self->_datePicker, a3);
  id v7 = [v5 _style];
  datePickerStyle = self->_datePickerStyle;
  self->_datePickerStyle = v7;

  v9 = [(_UIDatePickerOverlayPlatterView *)self accessoryView];

  if (v9)
  {
    v10 = [UIStackView alloc];
    v22[0] = v5;
    v11 = [(_UIDatePickerOverlayPlatterView *)self accessoryView];
    v22[1] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    double v13 = [(UIStackView *)v10 initWithArrangedSubviews:v12];

    [(UIView *)v13 setAxis:1];
    [(UIView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(_UIDatePickerOverlayPlatterView *)self datePickerStyle];
    v15 = [(_UIDatePickerOverlayPlatterView *)self backgroundView];
    [v14 addSubview:v13 toOverlayBackgroundView:v15];

    contentView = self->_contentView;
    self->_contentView = v13;
  }
  else
  {
    v17 = [(_UIDatePickerOverlayPlatterView *)self datePickerStyle];
    id v18 = *p_datePicker;
    v19 = [(_UIDatePickerOverlayPlatterView *)self backgroundView];
    [v17 addSubview:v18 toOverlayBackgroundView:v19];

    objc_storeStrong((id *)&self->_contentView, *p_datePicker);
  }
  contentWidthConstraint = self->_contentWidthConstraint;
  self->_contentWidthConstraint = 0;

  contentHeightConstraint = self->_contentHeightConstraint;
  self->_contentHeightConstraint = 0;

  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v40[4] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)_UIDatePickerOverlayPlatterView;
  [(UIView *)&v39 updateConstraints];
  if (!self->_contentWidthConstraint)
  {
    [(_UIDatePickerOverlayPlatterView *)self preferredContentSize];
    double v4 = v3;
    double v6 = v5;
    id v7 = [(UIView *)self->_contentView widthAnchor];
    v8 = [v7 constraintEqualToConstant:v4];
    contentWidthConstraint = self->_contentWidthConstraint;
    self->_contentWidthConstraint = v8;

    v10 = [(UIView *)self->_contentView heightAnchor];
    v11 = [v10 constraintEqualToConstant:v6];
    contentHeightConstraint = self->_contentHeightConstraint;
    self->_contentHeightConstraint = v11;

    double v13 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
    v38 = [v13 _style];

    v14 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
    [v14 _appliedInsetsToEdgeOfContent];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    objc_super v23 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
    objc_msgSend(v38, "overlayPlatterPaddingForAppliedInsets:datePickerMode:", objc_msgSend(v23, "datePickerMode"), v16, v18, v20, v22);
    double v25 = v24;
    double v27 = v26;

    v28 = (void *)MEMORY[0x1E4F5B268];
    v29 = [(_UIDatePickerOverlayPlatterView *)self contentWidthConstraint];
    v40[0] = v29;
    v30 = [(_UIDatePickerOverlayPlatterView *)self contentHeightConstraint];
    v40[1] = v30;
    v31 = [(UIView *)self->_contentView leftAnchor];
    v32 = [(UIView *)self leftAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:v25];
    v40[2] = v33;
    v34 = [(UIView *)self->_contentView topAnchor];
    v35 = [(UIView *)self topAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:v27];
    v40[3] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
    [v28 activateConstraints:v37];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerOverlayPlatterView;
  [(UIView *)&v13 layoutSubviews];
  double v3 = [(_UIDatePickerOverlayPlatterView *)self shadowView];
  [(UIView *)self bounds];
  objc_msgSend(v3, "frameWithContentWithFrame:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(_UIDatePickerOverlayPlatterView *)self shadowView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CGSize)preferredContentSize
{
  double v3 = [(UIDatePicker *)self->_datePicker _style];
  double v4 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
  objc_msgSend(v3, "idealLayoutFittingSizeForDatePickerMode:", objc_msgSend(v4, "datePickerMode"));
  double v6 = v5;
  double v8 = v7;

  double v9 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
  if ([v9 datePickerMode])
  {
    double v10 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
    uint64_t v11 = [v10 datePickerMode];

    if (v11 != 3)
    {
      [(NSLayoutConstraint *)self->_contentWidthConstraint setActive:0];
      [(NSLayoutConstraint *)self->_contentHeightConstraint setActive:0];
      double v12 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
      LODWORD(v13) = 1148846080;
      LODWORD(v14) = 1112014848;
      objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, v8, v13, v14);
      double v6 = v15;
      double v8 = v16;

      [(NSLayoutConstraint *)self->_contentWidthConstraint setActive:1];
      [(NSLayoutConstraint *)self->_contentHeightConstraint setActive:1];
    }
  }
  else
  {
  }
  double v17 = [(_UIDatePickerOverlayPlatterView *)self accessoryView];

  if (v17)
  {
    double v18 = [(_UIDatePickerOverlayPlatterView *)self accessoryView];
    [v18 sizeToFit];

    double v19 = [(_UIDatePickerOverlayPlatterView *)self accessoryView];
    [v19 bounds];
    double v8 = v8 + CGRectGetHeight(v23);
  }
  double v20 = v6;
  double v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

- (CGSize)preferredPlatterSize
{
  +[UIViewController _horizontalContentMarginForView:self];
  [(_UIDatePickerOverlayPlatterView *)self preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
  [v7 _appliedInsetsToEdgeOfContent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
  double v17 = [v16 _style];

  [v17 overlayPlatterDefaultMargin];
  double v19 = v18;
  [v17 overlayPlatterDefaultMargin];
  double v21 = v20 + v20 - (v9 + v13);
  if ([(_UIDatePickerOverlayPlatterView *)self accessoryViewIgnoresDefaultInsets])
  {
    double v22 = [(_UIDatePickerOverlayPlatterView *)self accessoryView];

    if (v22)
    {
      [v17 overlayPlatterDefaultMargin];
      double v21 = v21 - (v23 - v13);
    }
  }
  [(UIView *)self _currentScreenScale];
  double v25 = UISizeRoundToScale(v4 + v19 + v19 - (v11 + v15), v6 + v21, v24);
  double v27 = v26;

  double v28 = v25;
  double v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  self->_contentBounds = a3;
  double v6 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
  id v30 = [v6 _style];

  [v30 overlayPlatterDefaultMargin];
  double v29 = v7;
  [v30 overlayPlatterDefaultMargin];
  double v28 = v8;
  [v30 overlayPlatterDefaultMargin];
  double v10 = v9;
  [v30 overlayPlatterDefaultMargin];
  double v12 = v11;
  double v13 = [(_UIDatePickerOverlayPlatterView *)self datePicker];
  [v13 _appliedInsetsToEdgeOfContent];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = [(_UIDatePickerOverlayPlatterView *)self accessoryView];
  if (v22)
  {
    double v23 = (void *)v22;
    BOOL v24 = [(_UIDatePickerOverlayPlatterView *)self accessoryViewIgnoresDefaultInsets];

    if (v24)
    {
      [v30 overlayPlatterDefaultMargin];
      double v19 = v25;
    }
  }
  double v26 = [(_UIDatePickerOverlayPlatterView *)self contentWidthConstraint];
  [v26 setConstant:width - (v28 - v17 + v12 - v21)];

  double v27 = [(_UIDatePickerOverlayPlatterView *)self contentHeightConstraint];
  [v27 setConstant:height - (v29 - v15 + v10 - v19)];

  [(UIView *)self layoutIfNeeded];
}

- (void)prepareDatePickerTransitionWithDatePicker:(id)a3
{
  id v7 = a3;
  double v4 = [(_UIDatePickerOverlayPlatterView *)self previousContentView];
  [v4 removeFromSuperview];

  [(UIDatePicker *)self->_datePicker resignFirstResponder];
  if (v7)
  {
    double v5 = [(_UIDatePickerOverlayPlatterView *)self contentView];
    previousContentView = self->_previousContentView;
    self->_previousContentView = v5;

    [v7 setAlpha:0.0];
    [(_UIDatePickerOverlayPlatterView *)self replaceDatePicker:v7];
  }
}

- (void)datePickerTransitionAnimation
{
  double v3 = [(_UIDatePickerOverlayPlatterView *)self previousContentView];

  if (v3)
  {
    double v4 = [(_UIDatePickerOverlayPlatterView *)self previousContentView];
    [v4 setAlpha:0.0];

    id v5 = [(_UIDatePickerOverlayPlatterView *)self contentView];
    [v5 setAlpha:1.0];
  }
}

- (void)datePickerTransitionCompletion
{
  double v3 = [(_UIDatePickerOverlayPlatterView *)self previousContentView];

  if (v3)
  {
    double v4 = [(_UIDatePickerOverlayPlatterView *)self previousContentView];
    [v4 removeFromSuperview];

    previousContentView = self->_previousContentView;
    self->_previousContentView = 0;
  }
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (BOOL)accessoryViewIgnoresDefaultInsets
{
  return self->_accessoryViewIgnoresDefaultInsets;
}

- (void)setAccessoryViewIgnoresDefaultInsets:(BOOL)a3
{
  self->_accessoryViewIgnoresDefaultInsets = a3;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (_UIRoundedRectShadowView)shadowView
{
  return self->_shadowView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIView)previousContentView
{
  return self->_previousContentView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSLayoutConstraint)contentWidthConstraint
{
  return self->_contentWidthConstraint;
}

- (NSLayoutConstraint)contentHeightConstraint
{
  return self->_contentHeightConstraint;
}

- (_UIDatePickerStyle)datePickerStyle
{
  return self->_datePickerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePickerStyle, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_previousContentView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end