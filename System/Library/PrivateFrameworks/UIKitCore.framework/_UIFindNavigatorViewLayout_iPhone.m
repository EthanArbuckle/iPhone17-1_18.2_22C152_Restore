@interface _UIFindNavigatorViewLayout_iPhone
- (BOOL)usesSmallScreenStyle;
- (CGRect)preferredVerticalStackViewFrame;
- (CGSize)preferredContentSize;
- (_UIFindNavigatorViewLayout_iPhone)initWithFrame:(CGRect)a3;
- (void)_setAndActivateConstraints;
- (void)layoutSubviews;
- (void)prepareForLayout;
- (void)setReplaceFieldVisible:(BOOL)a3;
@end

@implementation _UIFindNavigatorViewLayout_iPhone

- (_UIFindNavigatorViewLayout_iPhone)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  v3 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    verticalStackView = v3->_verticalStackView;
    v3->_verticalStackView = (UIStackView *)v9;

    [(UIStackView *)v3->_verticalStackView setSpacing:12.0];
    [(UIStackView *)v3->_verticalStackView setAxis:1];
    [(UIStackView *)v3->_verticalStackView setDistribution:1];
    [(UIView *)v3 addSubview:v3->_verticalStackView];
    v11 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    findStackView = v3->_findStackView;
    v3->_findStackView = v11;

    [(UIStackView *)v3->_findStackView setSpacing:12.0];
    [(UIStackView *)v3->_findStackView setAxis:0];
    [(UIStackView *)v3->_verticalStackView addArrangedSubview:v3->_findStackView];
    v13 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    replaceStackView = v3->_replaceStackView;
    v3->_replaceStackView = v13;

    [(UIStackView *)v3->_replaceStackView setSpacing:12.0];
    [(UIStackView *)v3->_replaceStackView setAxis:0];
    [(UIStackView *)v3->_verticalStackView addArrangedSubview:v3->_replaceStackView];
    v15 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    nextPrevStackView = v3->_nextPrevStackView;
    v3->_nextPrevStackView = v15;

    [(UIStackView *)v3->_nextPrevStackView setSpacing:12.0];
    uint64_t v17 = makeSpacerView();
    nextPrevSpacerView = v3->_nextPrevSpacerView;
    v3->_nextPrevSpacerView = (UIView *)v17;

    [(UIView *)v3->_nextPrevSpacerView setHidden:1];
  }
  return v3;
}

- (CGSize)preferredContentSize
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  [(_UIFindNavigatorViewLayout *)&v12 preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  if ([(_UIFindNavigatorViewLayout *)self replaceFieldVisible]) {
    double v6 = v6 + v6;
  }
  double v7 = [(UIView *)self superview];
  [v7 safeAreaInsets];
  double v9 = v6 + v8;

  double v10 = v4;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  -[_UIFindNavigatorViewLayout setReplaceFieldVisible:](&v5, sel_setReplaceFieldVisible_);
  [(UIView *)self->_replaceStackView setHidden:v3 ^ 1];
  [(NSLayoutConstraint *)self->_doneSpaceConstraint setActive:v3];
  [(NSLayoutConstraint *)self->_replaceButtonWidthConstraint setActive:v3];
  [(UIView *)self->_nextPrevSpacerView setHidden:v3 ^ 1];
}

- (void)prepareForLayout
{
  BOOL v3 = [(_UIFindNavigatorViewLayout_iPhone *)self usesSmallScreenStyle];
  findStackView = self->_findStackView;
  objc_super v5 = [(_UIFindNavigatorViewLayout *)self doneButton];
  [(UIStackView *)findStackView addArrangedSubview:v5];

  double v6 = self->_findStackView;
  double v7 = [(_UIFindNavigatorViewLayout *)self searchTextField];
  [(UIStackView *)v6 addArrangedSubview:v7];

  nextPrevStackView = self->_nextPrevStackView;
  double v9 = [(_UIFindNavigatorViewLayout *)self previousResultButton];
  [(UIStackView *)nextPrevStackView addArrangedSubview:v9];

  double v10 = self->_nextPrevStackView;
  if (v3)
  {
    [(UIStackView *)self->_nextPrevStackView addArrangedSubview:self->_nextPrevSpacerView];
    double v11 = self->_nextPrevStackView;
    objc_super v12 = [(_UIFindNavigatorViewLayout *)self nextResultButton];
    [(UIStackView *)v11 addArrangedSubview:v12];

    -[UIView _setTouchInsets:](self->_nextPrevStackView, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);
    v13 = [(_UIFindNavigatorViewLayout *)self nextResultButton];
    objc_msgSend(v13, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);

    v14 = [(_UIFindNavigatorViewLayout *)self previousResultButton];
    objc_msgSend(v14, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);

    [(UIStackView *)self->_findStackView addArrangedSubview:self->_nextPrevStackView];
    v15 = self->_findStackView;
    v16 = makeSpacerView();
    [(UIStackView *)v15 addArrangedSubview:v16];
  }
  else
  {
    uint64_t v17 = [(_UIFindNavigatorViewLayout *)self nextResultButton];
    [(UIStackView *)v10 addArrangedSubview:v17];

    [(UIStackView *)self->_findStackView addArrangedSubview:self->_nextPrevStackView];
  }
  v18 = [UIView alloc];
  v37 = -[UIView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  -[UIStackView addArrangedSubview:](self->_replaceStackView, "addArrangedSubview:");
  replaceStackView = self->_replaceStackView;
  objc_super v20 = [(_UIFindNavigatorViewLayout *)self replaceTextField];
  [(UIStackView *)replaceStackView addArrangedSubview:v20];

  v21 = self->_replaceStackView;
  v22 = [(_UIFindNavigatorViewLayout *)self replaceButton];
  [(UIStackView *)v21 addArrangedSubview:v22];

  v23 = [(_UIFindNavigatorViewLayout *)self replaceButton];
  [v23 setHidden:0];

  v24 = [(_UIFindNavigatorViewLayout *)self replaceTextField];
  [v24 setHidden:0];

  if (v3)
  {
    v25 = self->_replaceStackView;
    v26 = makeSpacerView();
    [(UIStackView *)v25 addArrangedSubview:v26];
  }
  v27 = [(UIView *)v37 widthAnchor];
  v28 = [(_UIFindNavigatorViewLayout *)self doneButton];
  v29 = [v28 widthAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  doneSpaceConstraint = self->_doneSpaceConstraint;
  self->_doneSpaceConstraint = v30;

  v32 = [(UIView *)self->_nextPrevStackView widthAnchor];
  v33 = [(_UIFindNavigatorViewLayout *)self replaceButton];
  v34 = [v33 widthAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  replaceButtonWidthConstraint = self->_replaceButtonWidthConstraint;
  self->_replaceButtonWidthConstraint = v35;

  [(_UIFindNavigatorViewLayout_iPhone *)self _setAndActivateConstraints];
}

- (void)_setAndActivateConstraints
{
  v11[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F5B268];
  double v4 = [(_UIFindNavigatorViewLayout *)self nextResultButton];
  objc_super v5 = [v4 widthAnchor];
  double v6 = [v5 constraintEqualToConstant:28.0];
  v11[0] = v6;
  double v7 = [(_UIFindNavigatorViewLayout *)self previousResultButton];
  double v8 = [v7 widthAnchor];
  double v9 = [v8 constraintEqualToConstant:28.0];
  v11[1] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v3 activateConstraints:v10];
}

- (BOOL)usesSmallScreenStyle
{
  return 1;
}

- (CGRect)preferredVerticalStackViewFrame
{
  [(UIView *)self safeAreaInsets];
  double v4 = v3 + 2.0;
  [(UIView *)self bounds];
  double v7 = v6 + 0.0;
  double v9 = v8 + 3.0;
  double v11 = v10 - (v4 + 3.0);
  result.size.height = v11;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v7;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  [(UIView *)&v3 layoutSubviews];
  [(_UIFindNavigatorViewLayout_iPhone *)self preferredVerticalStackViewFrame];
  -[UIView setFrame:](self->_verticalStackView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_doneSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_nextPrevSpacerView, 0);
  objc_storeStrong((id *)&self->_nextPrevStackView, 0);
  objc_storeStrong((id *)&self->_replaceStackView, 0);
  objc_storeStrong((id *)&self->_findStackView, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
}

@end