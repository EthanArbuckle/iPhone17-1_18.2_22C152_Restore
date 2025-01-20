@interface COSSoftwareUpdateCellFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (COSSoftwareUpdateCellFooterView)initWithSpecifier:(id)a3;
- (NSString)text;
- (PSSpecifier)specifier;
- (UITextView)textView;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setSpecifier:(id)a3;
- (void)setText:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation COSSoftwareUpdateCellFooterView

- (COSSoftwareUpdateCellFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[COSSoftwareUpdateCellFooterView initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_specifier, v4);
    v7 = (UITextView *)objc_alloc_init((Class)UITextView);
    textView = v6->_textView;
    v6->_textView = v7;

    v9 = +[UIColor clearColor];
    [(UITextView *)v6->_textView setBackgroundColor:v9];

    [(UITextView *)v6->_textView setShowsVerticalScrollIndicator:0];
    [(UITextView *)v6->_textView setEditable:0];
    [(UITextView *)v6->_textView setSelectable:0];
    [(UITextView *)v6->_textView setScrollEnabled:0];
    v10 = BPSTextColor();
    [(UITextView *)v6->_textView setTextColor:v10];

    v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    [(UITextView *)v6->_textView setFont:v11];

    [(COSSoftwareUpdateCellFooterView *)v6 addSubview:v6->_textView];
  }

  return v6;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)COSSoftwareUpdateCellFooterView;
  [(COSSoftwareUpdateCellFooterView *)&v25 layoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
  id v4 = [WeakRetained propertyForKey:PSFooterTextGroupKey];
  text = self->_text;
  self->_text = v4;

  [(UITextView *)self->_textView setText:self->_text];
  PSTextViewInsets();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  PSTableSectionFooterTopPad();
  double v13 = v12 - v7;
  PreferencesTableViewCellLeftPad();
  double v15 = v14 - v9;
  PSTableSectionFooterBottomPad();
  PreferencesTableViewCellRightPad();
  double v17 = v16 - v11;
  [(COSSoftwareUpdateCellFooterView *)self bounds];
  double v19 = v15 + v18;
  double v21 = v13 + v20;
  double v23 = v22 - (v15 + v17);
  [(UITextView *)self->_textView frame];
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v23, 1.79769313e308);
  -[UITextView setFrame:](self->_textView, "setFrame:", v19, v21, v23, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = [(COSSoftwareUpdateCellFooterView *)self text];
  id v6 = [v5 length];

  if (v6)
  {
    PreferencesTableViewCellLeftPad();
    float v8 = v7;
    PreferencesTableViewCellRightPad();
    double v10 = (float)(v8 + v9);
    PSTableSectionFooterTopPad();
    double v12 = v11;
    PSTableSectionFooterBottomPad();
    double v14 = v12 + v13;
    double v15 = width - v10;
    -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v15, 1.79769313e308);
    double v16 = v15 + v10;
    double height = v14 + v17;
  }
  else
  {
    double v16 = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = v16;
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  [(COSSoftwareUpdateCellFooterView *)self layoutIfNeeded];
  -[COSSoftwareUpdateCellFooterView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (PSSpecifier)specifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);

  return (PSSpecifier *)WeakRetained;
}

- (void)setSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_specifier);
  objc_storeStrong((id *)&self->_textView, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end