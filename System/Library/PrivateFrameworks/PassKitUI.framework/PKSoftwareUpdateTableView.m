@interface PKSoftwareUpdateTableView
- (PKSoftwareUpdateTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIColor)linkColor;
- (UIColor)textColor;
- (id)_messageAttributedStringWithTextColor:(id)a3;
- (int64_t)context;
- (void)layoutSubviews;
- (void)setContext:(int64_t)a3;
- (void)setLinkColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PKSoftwareUpdateTableView

- (PKSoftwareUpdateTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v26.receiver = self;
  v26.super_class = (Class)PKSoftwareUpdateTableView;
  v4 = -[PKSoftwareUpdateTableView initWithFrame:style:](&v26, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] grayColor];
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v5;

    linkColor = v4->_linkColor;
    v4->_linkColor = 0;

    v8 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v4->_scrollView;
    v4->_scrollView = v8;

    [(PKSoftwareUpdateTableView *)v4 addSubview:v4->_scrollView];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    v12 = v4->_titleLabel;
    v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v12 setFont:v13];

    v14 = v4->_titleLabel;
    v15 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v14 setBackgroundColor:v15];

    [(UILabel *)v4->_titleLabel setTextColor:v4->_textColor];
    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    PKDeviceSpecificLocalizedStringKeyForKey(@"FAIL_FORWARD_UPDATE_TITLE", 0);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = v4->_titleLabel;
    v18 = PKLocalizedPaymentString(v16);
    [(UILabel *)v17 setText:v18];

    [(UIScrollView *)v4->_scrollView addSubview:v4->_titleLabel];
    v19 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    messageView = v4->_messageView;
    v4->_messageView = v19;

    v21 = v4->_messageView;
    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v21 setBackgroundColor:v22];

    [(UITextView *)v4->_messageView setEditable:0];
    [(UITextView *)v4->_messageView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)v4->_messageView setAdjustsFontForContentSizeCategory:1];
    [(UITextView *)v4->_messageView setDataDetectorTypes:2];
    [(UITextView *)v4->_messageView setScrollingEnabled:0];
    v23 = v4->_messageView;
    v24 = [(PKSoftwareUpdateTableView *)v4 _messageAttributedStringWithTextColor:v4->_textColor];
    [(UITextView *)v23 setAttributedText:v24];

    [(UIScrollView *)v4->_scrollView addSubview:v4->_messageView];
    [(PKSoftwareUpdateTableView *)v4 setContext:0];
  }
  return v4;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
  int IsBridge = PKPaymentSetupContextIsBridge();
  PKDeviceSpecificLocalizedStringKeyForKey(@"FAIL_FORWARD_UPDATE_TITLE", IsBridge);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  v6 = PKLocalizedPaymentString(v7);
  [(UILabel *)titleLabel setText:v6];

  [(PKSoftwareUpdateTableView *)self setNeedsLayout];
}

- (void)setTextColor:(id)a3
{
  v7 = (UIColor *)a3;
  if (self->_textColor != v7)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(UILabel *)self->_titleLabel setTextColor:v7];
    messageView = self->_messageView;
    v6 = [(PKSoftwareUpdateTableView *)self _messageAttributedStringWithTextColor:v7];
    [(UITextView *)messageView setAttributedText:v6];
  }
}

- (void)setLinkColor:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (UIColor *)a3;
  if (self->_linkColor != v5)
  {
    objc_storeStrong((id *)&self->_linkColor, a3);
    messageView = self->_messageView;
    if (v5)
    {
      uint64_t v8 = *MEMORY[0x1E4FB0700];
      v9[0] = v5;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [(UITextView *)messageView setLinkTextAttributes:v7];
    }
    else
    {
      [(UITextView *)messageView setLinkTextAttributes:0];
    }
  }
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)PKSoftwareUpdateTableView;
  [(PKSoftwareUpdateTableView *)&v39 layoutSubviews];
  v3 = [(PKSoftwareUpdateTableView *)self safeAreaLayoutGuide];
  [v3 layoutFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(UILabel *)self->_titleLabel font];
  [(PKSoftwareUpdateTableView *)self directionalLayoutMargins];
  double v14 = v13;
  [(PKSoftwareUpdateTableView *)self directionalLayoutMargins];
  double v16 = v14 + v15;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v5, v7, v9, v11);
  titleLabel = self->_titleLabel;
  [(PKSoftwareUpdateTableView *)self bounds];
  PKFloatRoundToPixel();
  -[UILabel pkui_sizeThatFits:forceWordWrap:](titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1);
  double v19 = v18;
  double v21 = v20;
  [v12 _bodyLeading];
  double v23 = v9 - v16;
  if (v21 > v22 + v22)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v9 - v16, 1.79769313e308);
    double v19 = v24;
    double v21 = v25;
  }
  objc_super v26 = self->_titleLabel;
  PKFloatRoundToPixel();
  double v28 = v27;
  [v12 ascender];
  PKFloatRoundToPixel();
  -[UILabel setFrame:](v26, "setFrame:", v28, v29, v19, v21);
  -[UITextView sizeThatFits:](self->_messageView, "sizeThatFits:", v23, 1.79769313e308);
  double v31 = v30;
  double v33 = v32;
  messageView = self->_messageView;
  PKFloatRoundToPixel();
  double v36 = v35;
  [(UILabel *)self->_titleLabel frame];
  CGRectGetMaxY(v40);
  [v12 descender];
  [v12 _bodyLeading];
  [v12 ascender];
  PKFloatRoundToPixel();
  -[UITextView setFrame:](messageView, "setFrame:", v36, v37, v31, v33);
  scrollView = self->_scrollView;
  [(UITextView *)self->_messageView frame];
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v9, CGRectGetMaxY(v41));
}

- (id)_messageAttributedStringWithTextColor:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB0850];
  id v4 = a3;
  double v5 = [v3 defaultParagraphStyle];
  double v6 = (void *)[v5 mutableCopy];

  [v6 setAlignment:1];
  v14[0] = *MEMORY[0x1E4FB06F8];
  double v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v15[0] = v7;
  v15[1] = v4;
  uint64_t v9 = *MEMORY[0x1E4FB0738];
  v14[1] = v8;
  v14[2] = v9;
  v15[2] = v6;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  double v11 = PKLocalizedPaymentString(&cfstr_FailForwardUpd_1.isa);
  v12 = PKAttributedStringByParsingLinksInString();

  return v12;
}

- (int64_t)context
{
  return self->_context;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)linkColor
{
  return self->_linkColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end