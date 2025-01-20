@interface PKPayLaterContentActionFooterView
+ (id)leadingTitleFont;
- (BOOL)showSpinner;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)buttonText;
- (NSString)leadingDetailText;
- (NSString)leadingTitleText;
- (PKPayLaterContentActionFooterView)initWithDelegate:(id)a3;
- (UIColor)buttonTintColor;
- (UIColor)buttonTitleColor;
- (UIColor)leadingDetailTextColor;
- (UIColor)leadingTitleTextColor;
- (UIImage)leadingTitleIcon;
- (int64_t)preferredBackdropStyle;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
- (void)setButtonText:(id)a3;
- (void)setButtonTintColor:(id)a3;
- (void)setButtonTitleColor:(id)a3;
- (void)setLeadingDetailText:(id)a3;
- (void)setLeadingDetailTextColor:(id)a3;
- (void)setLeadingTitleIcon:(id)a3;
- (void)setLeadingTitleText:(id)a3;
- (void)setLeadingTitleTextColor:(id)a3;
- (void)setShowSpinner:(BOOL)a3;
@end

@implementation PKPayLaterContentActionFooterView

- (PKPayLaterContentActionFooterView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterContentActionFooterView;
  v5 = -[PKPayLaterContentActionFooterView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_backdropStyle = [(PKPayLaterContentActionFooterView *)v5 preferredBackdropStyle];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:v6->_backdropStyle];
    backdropView = v6->_backdropView;
    v6->_backdropView = (_UIBackdropView *)v7;

    [(PKPayLaterContentActionFooterView *)v6 addSubview:v6->_backdropView];
    v9 = [[PKPayLaterContentActionFooterViewContent alloc] initWithDelegate:v4];
    content = v6->_content;
    v6->_content = v9;

    [(_UIBackdropView *)v6->_backdropView setUserInteractionEnabled:1];
    v11 = [(_UIBackdropView *)v6->_backdropView contentView];
    [v11 setUserInteractionEnabled:1];

    v12 = [(_UIBackdropView *)v6->_backdropView contentView];
    [v12 addSubview:v6->_content];

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topSeparatorView = v6->_topSeparatorView;
    v6->_topSeparatorView = v13;

    v15 = v6->_topSeparatorView;
    v16 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(UIView *)v15 setBackgroundColor:v16];

    v17 = [(_UIBackdropView *)v6->_backdropView contentView];
    [v17 addSubview:v6->_topSeparatorView];
  }
  return v6;
}

- (void)setButtonText:(id)a3
{
  id v4 = a3;
  v5 = [(PKPayLaterContentActionFooterViewContent *)self->_content buttonText];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(PKPayLaterContentActionFooterViewContent *)self->_content setButtonText:v8];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setButtonTintColor:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPayLaterContentActionFooterViewContent *)self->_content buttonTintColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(PKPayLaterContentActionFooterViewContent *)self->_content setButtonTintColor:v6];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
  }
}

- (void)setButtonTitleColor:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPayLaterContentActionFooterViewContent *)self->_content buttonTitleColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(PKPayLaterContentActionFooterViewContent *)self->_content setButtonTitleColor:v6];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
  }
}

- (void)setLeadingTitleText:(id)a3
{
  id v4 = a3;
  char v5 = [(PKPayLaterContentActionFooterViewContent *)self->_content leadingTitleText];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(PKPayLaterContentActionFooterViewContent *)self->_content setLeadingTitleText:v8];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setLeadingTitleTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPayLaterContentActionFooterViewContent *)self->_content leadingTitleTextColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(PKPayLaterContentActionFooterViewContent *)self->_content setLeadingTitleTextColor:v6];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
  }
}

- (void)setLeadingTitleIcon:(id)a3
{
  char v5 = (UIImage *)a3;
  if (self->_leadingTitleIcon != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_leadingTitleIcon, a3);
    [(PKPayLaterContentActionFooterViewContent *)self->_content setLeadingTitleIcon:self->_leadingTitleIcon];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
    char v5 = v6;
  }
}

- (void)setLeadingDetailTextColor:(id)a3
{
  id v6 = a3;
  id v4 = [(PKPayLaterContentActionFooterViewContent *)self->_content leadingDetailTextColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(PKPayLaterContentActionFooterViewContent *)self->_content setLeadingDetailTextColor:v6];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
  }
}

- (void)setLeadingDetailText:(id)a3
{
  id v4 = a3;
  char v5 = [(PKPayLaterContentActionFooterViewContent *)self->_content leadingDetailText];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v8 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(PKPayLaterContentActionFooterViewContent *)self->_content setLeadingDetailText:v8];
    [(PKPayLaterContentActionFooterView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setShowSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPayLaterContentActionFooterViewContent *)self->_content showSpinner] != a3)
  {
    content = self->_content;
    [(PKPayLaterContentActionFooterViewContent *)content setShowSpinner:v3];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterContentActionFooterView;
  [(PKPayLaterContentActionFooterView *)&v4 _dynamicUserInterfaceTraitDidChange];
  int64_t v3 = [(PKPayLaterContentActionFooterView *)self preferredBackdropStyle];
  if (self->_backdropStyle != v3)
  {
    self->_backdropStyle = v3;
    [(_UIBackdropView *)self->_backdropView transitionToPrivateStyle:v3];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterContentActionFooterView;
  [(PKPayLaterContentActionFooterView *)&v3 layoutSubviews];
  [(PKPayLaterContentActionFooterView *)self bounds];
  -[PKPayLaterContentActionFooterView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPayLaterContentActionFooterView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PKPayLaterContentActionFooterView *)self safeAreaInsets];
  double v11 = v10;
  -[PKPayLaterContentActionFooterViewContent sizeThatFits:](self->_content, "sizeThatFits:", width, height - v10);
  double v14 = v13;
  if (!a4)
  {
    double v15 = v12;
    -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", x, y, width, height);
    -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, width, PKUIPixelLength() * 3.0);
    -[PKPayLaterContentActionFooterViewContent setFrame:](self->_content, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v15, v14);
  }
  double v16 = v11 + v14;
  double v17 = width;
  result.double height = v16;
  result.double width = v17;
  return result;
}

- (int64_t)preferredBackdropStyle
{
  v2 = [(PKPayLaterContentActionFooterView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    return 2030;
  }
  else {
    return 2010;
  }
}

+ (id)leadingTitleFont
{
  return +[PKPayLaterContentActionFooterViewContent leadingTitleFont];
}

- (NSString)leadingTitleText
{
  return self->_leadingTitleText;
}

- (UIImage)leadingTitleIcon
{
  return self->_leadingTitleIcon;
}

- (UIColor)leadingTitleTextColor
{
  return self->_leadingTitleTextColor;
}

- (NSString)leadingDetailText
{
  return self->_leadingDetailText;
}

- (UIColor)leadingDetailTextColor
{
  return self->_leadingDetailTextColor;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (UIColor)buttonTitleColor
{
  return self->_buttonTitleColor;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_leadingDetailTextColor, 0);
  objc_storeStrong((id *)&self->_leadingDetailText, 0);
  objc_storeStrong((id *)&self->_leadingTitleTextColor, 0);
  objc_storeStrong((id *)&self->_leadingTitleIcon, 0);
  objc_storeStrong((id *)&self->_leadingTitleText, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end