@interface TLKSelectableGridButton
+ (id)selectableGridButton;
- (BOOL)customHighlight;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (TLKLabel)bottomLabel;
- (TLKLabel)topLabel;
- (TLKStackView)stackView;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBottomLabel:(id)a3;
- (void)setCustomHighlight:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setTitle:(id)a3 subtitle:(id)a4;
- (void)setTopLabel:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TLKSelectableGridButton

+ (id)selectableGridButton
{
  v2 = +[TLKSelectableGridButton buttonWithType:1];
  [v2 setCustomHighlight:0];
  v3 = [v2 layer];
  [v3 setCornerRadius:5.0];

  v4 = objc_opt_new();
  [v4 setAxis:1];
  [v4 setAlignment:3];
  [v4 setSpacing:0.0];
  objc_msgSend(v4, "setLayoutMargins:", 4.0, 4.0, 4.0, 4.0);
  [v4 setLayoutMarginsRelativeArrangement:1];
  [v4 setUserInteractionEnabled:0];
  [v2 setStackView:v4];
  [v2 addSubview:v4];
  v5 = objc_opt_new();
  v6 = +[TLKFontUtilities subheadFont];
  [v5 setFont:v6];

  [v2 setTopLabel:v5];
  [v4 addArrangedSubview:v5];
  v7 = +[TLKLabel secondaryLabel];
  v8 = +[TLKFontUtilities footnoteFont];
  [v7 setFont:v8];

  [v2 setBottomLabel:v7];
  [v4 addArrangedSubview:v7];
  objc_msgSend(v2, "_setTouchInsets:", -0.15, -0.15, -0.15, -0.15);

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKSelectableGridButton;
  [(TLKSelectableGridButton *)&v9 traitCollectionDidChange:v4];
  v5 = [(TLKSelectableGridButton *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(TLKSelectableGridButton *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKSelectableGridButton;
  [(TLKSelectableGridButton *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TLKSelectableGridButton;
  id v4 = a3;
  [(UIView *)&v6 tlk_updateForAppearance:v4];
  if (self->_customHighlight)
  {
    v5 = objc_msgSend(v4, "quaternaryColor", v6.receiver, v6.super_class);
    [(TLKSelectableGridButton *)self setBackgroundColor:v5];
  }
  else
  {
    -[TLKSelectableGridButton setBackgroundColor:](self, "setBackgroundColor:", 0, v6.receiver, v6.super_class);
  }
  [v4 enableAppearanceForView:self];
}

- (void)setCustomHighlight:(BOOL)a3
{
  self->_customHighlight = a3;
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (BOOL)customHighlight
{
  return self->_customHighlight;
}

- (void)setTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(TLKSelectableGridButton *)self topLabel];
  [v8 setText:v7];

  id v9 = [(TLKSelectableGridButton *)self bottomLabel];
  [v9 setText:v6];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(TLKSelectableGridButton *)self stackView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(TLKSelectableGridButton *)self stackView];
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(TLKSelectableGridButton *)self stackView];
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TLKSelectableGridButton;
  [(TLKSelectableGridButton *)&v12 layoutSubviews];
  [(TLKSelectableGridButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(TLKSelectableGridButton *)self stackView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (TLKLabel)topLabel
{
  return self->_topLabel;
}

- (void)setTopLabel:(id)a3
{
}

- (TLKLabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
}

@end