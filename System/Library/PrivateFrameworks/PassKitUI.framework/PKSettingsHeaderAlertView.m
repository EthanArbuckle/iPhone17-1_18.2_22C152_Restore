@interface PKSettingsHeaderAlertView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)descriptionText;
- (NSString)headerText;
- (PKSettingsHeaderAlertView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setDescriptionText:(id)a3;
- (void)setHeaderText:(id)a3;
@end

@implementation PKSettingsHeaderAlertView

- (PKSettingsHeaderAlertView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[PKSettingsHeaderAlertView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textView = v5->_textView;
    v5->_textView = v6;

    uint64_t v8 = [v4 propertyForKey:@"settingsAlertHeaderText"];
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v8;

    uint64_t v10 = [v4 propertyForKey:@"settingsAlertDescriptionText"];
    descriptionText = v5->_descriptionText;
    v5->_descriptionText = (NSString *)v10;

    v12 = [NSString stringWithFormat:@"%@\n%@", v5->_headerText, v5->_descriptionText];
    [(UITextView *)v5->_textView setText:v12];
    v13 = v5->_textView;
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v13 setBackgroundColor:v14];

    [(UITextView *)v5->_textView setShowsVerticalScrollIndicator:0];
    [(UITextView *)v5->_textView setEditable:0];
    [(UITextView *)v5->_textView setSelectable:0];
    [(UITextView *)v5->_textView setScrollEnabled:0];
    v15 = v5->_textView;
    v16 = [MEMORY[0x1E4FB1618] systemDarkRedColor];
    [(UITextView *)v15 setTextColor:v16];

    v17 = v5->_textView;
    v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [(UITextView *)v17 setFont:v18];

    [(PKSettingsHeaderAlertView *)v5 addSubview:v5->_textView];
  }

  return v5;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PKSettingsHeaderAlertView;
  [(PKSettingsHeaderAlertView *)&v22 layoutSubviews];
  PSTextViewInsets();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  PSTableSectionFooterTopPad();
  double v10 = v9 - v4;
  PreferencesTableViewCellLeftPad();
  double v12 = v11 - v6;
  PSTableSectionFooterBottomPad();
  PreferencesTableViewCellRightPad();
  double v14 = v13 - v8;
  [(PKSettingsHeaderAlertView *)self bounds];
  double v16 = v12 + v15;
  double v18 = v10 + v17;
  double v20 = v19 - (v12 + v14);
  [(UITextView *)self->_textView frame];
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v20, 1.79769313e308);
  -[UITextView setFrame:](self->_textView, "setFrame:", v16, v18, v20, v21);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  PreferencesTableViewCellLeftPad();
  float v6 = v5;
  PreferencesTableViewCellRightPad();
  double v8 = (float)(v6 + v7);
  PSTableSectionFooterTopPad();
  double v10 = v9;
  PSTableSectionFooterBottomPad();
  double v12 = v10 + v11;
  double v13 = width - v8;
  -[UITextView sizeThatFits:](self->_textView, "sizeThatFits:", v13, 1.79769313e308);
  double v15 = v12 + v14;
  PSTableSectionFooterTopPad();
  double v17 = v16 + v15;
  double v18 = v13 + v8;
  result.height = v17;
  result.double width = v18;
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  -[PKSettingsHeaderAlertView sizeThatFits:](self, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end