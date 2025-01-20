@interface _UIFindNavigatorViewLayout_iPad
- (_UIFindNavigatorViewLayout_iPad)initWithFrame:(CGRect)a3;
- (void)_setAndActivateConstraints;
- (void)layoutSubviews;
- (void)prepareForLayout;
- (void)setReplaceFieldVisible:(BOOL)a3;
@end

@implementation _UIFindNavigatorViewLayout_iPad

- (_UIFindNavigatorViewLayout_iPad)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_UIFindNavigatorViewLayout_iPad;
  v3 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    contentStackView = v3->_contentStackView;
    v3->_contentStackView = (UIStackView *)v9;

    [(UIStackView *)v3->_contentStackView setSpacing:8.0];
    [(UIStackView *)v3->_contentStackView setAxis:0];
    [(UIView *)v3 addSubview:v3->_contentStackView];
    v11 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    textFieldsStackView = v3->_textFieldsStackView;
    v3->_textFieldsStackView = v11;

    [(UIStackView *)v3->_textFieldsStackView setSpacing:8.0];
    [(UIStackView *)v3->_textFieldsStackView setAxis:0];
    [(UIStackView *)v3->_textFieldsStackView setDistribution:1];
  }
  return v3;
}

- (void)prepareForLayout
{
  contentStackView = self->_contentStackView;
  v4 = [(_UIFindNavigatorViewLayout *)self doneButton];
  [(UIStackView *)contentStackView addArrangedSubview:v4];

  textFieldsStackView = self->_textFieldsStackView;
  double v6 = [(_UIFindNavigatorViewLayout *)self searchTextField];
  [(UIStackView *)textFieldsStackView addArrangedSubview:v6];

  double v7 = self->_textFieldsStackView;
  double v8 = [(_UIFindNavigatorViewLayout *)self replaceTextField];
  [(UIStackView *)v7 addArrangedSubview:v8];

  [(UIStackView *)self->_contentStackView addArrangedSubview:self->_textFieldsStackView];
  uint64_t v9 = self->_contentStackView;
  v10 = [(_UIFindNavigatorViewLayout *)self replaceButton];
  [(UIStackView *)v9 addArrangedSubview:v10];

  v11 = self->_contentStackView;
  v12 = [(_UIFindNavigatorViewLayout *)self previousResultButton];
  [(UIStackView *)v11 addArrangedSubview:v12];

  v13 = self->_contentStackView;
  objc_super v14 = [(_UIFindNavigatorViewLayout *)self nextResultButton];
  [(UIStackView *)v13 addArrangedSubview:v14];

  [(_UIFindNavigatorViewLayout_iPad *)self _setAndActivateConstraints];
}

- (void)_setAndActivateConstraints
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F5B268];
  v4 = [(_UIFindNavigatorViewLayout *)self nextResultButton];
  double v5 = [v4 widthAnchor];
  double v6 = [(UIView *)self->_contentStackView heightAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  v13[0] = v7;
  double v8 = [(_UIFindNavigatorViewLayout *)self previousResultButton];
  uint64_t v9 = [v8 widthAnchor];
  v10 = [(UIView *)self->_contentStackView heightAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v13[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v3 activateConstraints:v12];
}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFindNavigatorViewLayout_iPad;
  -[_UIFindNavigatorViewLayout setReplaceFieldVisible:](&v10, sel_setReplaceFieldVisible_);
  double v5 = [(_UIFindNavigatorViewLayout *)self replaceButton];
  double v6 = v5;
  if (v3)
  {
    [v5 setHidden:0];

    double v7 = [(_UIFindNavigatorViewLayout *)self replaceTextField];
    double v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    [v5 setHidden:1];

    double v7 = [(_UIFindNavigatorViewLayout *)self replaceTextField];
    double v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setHidden:v9];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorViewLayout_iPad;
  [(UIView *)&v20 layoutSubviews];
  int64_t v3 = [(_UIFindNavigatorViewLayout *)self assistantBarStyle];
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UIView *)self safeAreaInsets];
  double v13 = v12;
  [(UIView *)self safeAreaInsets];
  if (v3) {
    double v15 = 0.0;
  }
  else {
    double v15 = 3.0;
  }
  double v16 = v5 + v14;
  double v17 = v9 - (v13 + v14);
  double v18 = v15 + v7;
  double v19 = 6.0;
  if (v3) {
    double v19 = 0.0;
  }
  -[UIView setFrame:](self->_contentStackView, "setFrame:", v16, v18, v17, v11 - v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldsStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end