@interface SiriUIReusableHeaderView
+ (double)defaultHeight;
+ (id)elementKind;
+ (id)reuseIdentifier;
- (NSString)titleText;
- (SiriUIReusableHeaderView)initWithFrame:(CGRect)a3;
- (SiriUISnippetViewController)snippetViewController;
- (UIButton)headerAreaButton;
- (UIColor)titleTextColor;
- (double)desiredHeightForWidth:(double)a3;
- (void)_configureHeaderLabelForBounds:(CGRect)a3;
- (void)layoutSubviews;
- (void)setSnippetViewController:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation SiriUIReusableHeaderView

- (SiriUIReusableHeaderView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUIReusableHeaderView;
  v3 = -[SiriUIReusableHeaderView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SiriUIContentButton button];
    headerAreaButton = v3->_headerAreaButton;
    v3->_headerAreaButton = (UIButton *)v4;

    [(SiriUIReusableHeaderView *)v3 addSubview:v3->_headerAreaButton];
    uint64_t v6 = [MEMORY[0x263F74480] labelWithHeaderFont];
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (UILabel *)v6;

    [(SiriUIReusableHeaderView *)v3 addSubview:v3->_headerLabel];
    id v8 = objc_alloc(MEMORY[0x263F1C6D0]);
    v9 = objc_msgSend(MEMORY[0x263F1C6B0], "siriui_semiTransparentChevronImageAndAllowNaturalLayout:", 1);
    uint64_t v10 = [v8 initWithImage:v9];
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v10;

    [(SiriUIReusableHeaderView *)v3 addSubview:v3->_chevronView];
    *(_OWORD *)&v3->_contentInsets.top = SiriUIDefaultSnippetViewInsets;
    *(_OWORD *)&v3->_contentInsets.bottom = *(_OWORD *)&qword_22323EA30;
  }
  return v3;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SiriUIReusableHeaderView;
  [(SiriUIReusableHeaderView *)&v25 layoutSubviews];
  [(SiriUIReusableHeaderView *)self bounds];
  -[UIButton setFrame:](self->_headerAreaButton, "setFrame:");
  [(SiriUIReusableHeaderView *)self bounds];
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_contentInsets.right);
  double v12 = v11 - (top + self->_contentInsets.bottom);
  -[UIImageView sizeThatFits:](self->_chevronView, "sizeThatFits:", v10, v12);
  UIRectCenteredYInRect();
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if (!SiriUISystemLanguageIsRTL())
  {
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    double MaxX = CGRectGetMaxX(v26);
    v27.origin.x = v14;
    v27.origin.y = v16;
    v27.size.width = v18;
    v27.size.height = v20;
    double v6 = MaxX - CGRectGetWidth(v27);
  }
  -[UIImageView setFrame:](self->_chevronView, "setFrame:", v6, v16, v18, v20);
  [(SiriUIReusableHeaderView *)self bounds];
  -[SiriUIReusableHeaderView _configureHeaderLabelForBounds:](self, "_configureHeaderLabelForBounds:");
  v22 = [(SiriUIReusableHeaderView *)self titleTextColor];

  if (v22)
  {
    headerLabel = self->_headerLabel;
    v24 = [(SiriUIReusableHeaderView *)self titleTextColor];
    [(UILabel *)headerLabel setTextColor:v24];
  }
}

- (void)_configureHeaderLabelForBounds:(CGRect)a3
{
  double height = a3.size.height;
  v31[1] = *MEMORY[0x263EF8340];
  double top = self->_contentInsets.top;
  double bottom = self->_contentInsets.bottom;
  double v7 = a3.size.width - (self->_contentInsets.left + self->_contentInsets.right);
  headerLabel = self->_headerLabel;
  double v9 = objc_msgSend(MEMORY[0x263F1C658], "siriui_headerFont");
  [(UILabel *)headerLabel setFont:v9];

  [(UILabel *)self->_headerLabel setNumberOfLines:1];
  uint64_t v10 = [(UILabel *)self->_headerLabel text];
  double v11 = (void *)v10;
  double v12 = &stru_26D647E48;
  if (v10) {
    double v12 = (__CFString *)v10;
  }
  double v13 = v12;

  id v14 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v14 setLineSpacing:0.0];
  [v14 setAlignment:1];
  id v15 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v16 = *MEMORY[0x263F1C268];
  uint64_t v30 = *MEMORY[0x263F1C268];
  v31[0] = v14;
  double v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  double v18 = (void *)[v15 initWithString:v13 attributes:v17];

  [(UILabel *)self->_headerLabel setAttributedText:v18];
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  if (v19 <= v7)
  {
    id v22 = [MEMORY[0x263F1C920] mainScreen];
    [v22 scale];
  }
  else
  {
    double v20 = self->_headerLabel;
    v21 = objc_msgSend(MEMORY[0x263F1C658], "siriui_dynamicHeaderFont");
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)self->_headerLabel setNumberOfLines:3];
    id v22 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v22 setLineSpacing:0.0];
    [v22 setMaximumLineHeight:36.0];
    [v22 setMinimumLineHeight:36.0];
    [v22 setAlignment:1];
    LODWORD(v23) = 1.0;
    [v22 setHyphenationFactor:v23];
    id v24 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v28 = v16;
    id v29 = v22;
    objc_super v25 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    CGRect v26 = (void *)[v24 initWithString:v13 attributes:v25];

    [(UILabel *)self->_headerLabel setAttributedText:v26];
    CGRect v27 = [MEMORY[0x263F1C920] mainScreen];
    [v27 scale];

    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v7, height - (top + bottom));
  }

  UIRectCenteredXInRect();
  -[UILabel setFrame:](self->_headerLabel, "setFrame:");
}

- (double)desiredHeightForWidth:(double)a3
{
  -[SiriUIReusableHeaderView _configureHeaderLabelForBounds:](self, "_configureHeaderLabelForBounds:", 0.0, 0.0, a3, 1.79769313e308);
  [(UILabel *)self->_headerLabel frame];
  double v5 = v4;
  NSInteger v6 = [(UILabel *)self->_headerLabel numberOfLines];
  double result = v5 + 103.0 + -72.0;
  if (v6 == 1) {
    return 72.0;
  }
  return result;
}

- (void)setSnippetViewController:(id)a3
{
  id obj = a3;
  p_snippetViewController = &self->_snippetViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);

  id v7 = obj;
  if (WeakRetained != obj)
  {
    id v8 = objc_storeWeak((id *)&self->_snippetViewController, obj);
    double v9 = [obj headerPunchOut];

    [(UIButton *)self->_headerAreaButton setEnabled:v9 != 0];
    chevronView = self->_chevronView;
    if (v9)
    {
      id v11 = objc_loadWeakRetained((id *)p_snippetViewController);
      -[UIImageView setHidden:](chevronView, "setHidden:", [v11 showHeaderChevron] ^ 1);
    }
    else
    {
      uint64_t v6 = [(UIImageView *)chevronView setHidden:1];
    }
    id v7 = obj;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)setTitleText:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_titleText, a3);
  [(UILabel *)self->_headerLabel setText:self->_titleText];
  double v5 = [(SiriUIReusableHeaderView *)self titleTextColor];

  if (v5)
  {
    headerLabel = self->_headerLabel;
    id v7 = [(SiriUIReusableHeaderView *)self titleTextColor];
    [(UILabel *)headerLabel setTextColor:v7];
  }
  [(SiriUIReusableHeaderView *)self setNeedsLayout];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  double v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

+ (double)defaultHeight
{
  return 72.0;
}

+ (id)elementKind
{
  return (id)*MEMORY[0x263F1D120];
}

- (SiriUISnippetViewController)snippetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  return (SiriUISnippetViewController *)WeakRetained;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (UIButton)headerAreaButton
{
  return self->_headerAreaButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerAreaButton, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end