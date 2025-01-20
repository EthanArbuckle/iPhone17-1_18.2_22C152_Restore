@interface SUUIPinnedFooterView
- (NSAttributedString)attributedText;
- (SUUIPinnedFooterView)initWithFrame:(CGRect)a3;
- (UITextView)textView;
- (double)horizontalPadding;
- (void)_configureTextViewTextStyling;
- (void)_initializeTextView;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setTextView:(id)a3;
@end

@implementation SUUIPinnedFooterView

- (SUUIPinnedFooterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIPinnedFooterView;
  v3 = -[SUUIPinnedFooterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SUUIPinnedFooterView *)v3 _initializeTextView];
  }
  return v4;
}

- (void)layoutSubviews
{
  [(SUUIPinnedFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(SUUIPinnedFooterView *)self horizontalPadding];
  double v8 = v4 + v7 * -2.0;
  v9 = [(SUUIPinnedFooterView *)self textView];
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  double v11 = v10;
  double v13 = v12;

  [(SUUIPinnedFooterView *)self horizontalPadding];
  double v15 = v14;
  v16 = [(SUUIPinnedFooterView *)self textView];
  objc_msgSend(v16, "setFrame:", v15, v6 + -10.0 - v13, v11, v13);

  v17.receiver = self;
  v17.super_class = (Class)SUUIPinnedFooterView;
  [(SUUIPinnedFooterView *)&v17 layoutSubviews];
}

- (void)setAttributedText:(id)a3
{
  double v6 = (NSAttributedString *)a3;
  if (self->_attributedText != v6)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    double v5 = [(SUUIPinnedFooterView *)self textView];
    [v5 setAttributedText:v6];

    [(SUUIPinnedFooterView *)self _configureTextViewTextStyling];
  }
}

- (void)_configureTextViewTextStyling
{
  double v3 = [(SUUIPinnedFooterView *)self textView];
  double v4 = [MEMORY[0x263F825C8] lightGrayColor];
  [v3 setTextColor:v4];

  double v5 = [(SUUIPinnedFooterView *)self textView];
  [v5 setTextAlignment:1];

  id v7 = [(SUUIPinnedFooterView *)self textView];
  double v6 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  [v7 setFont:v6];
}

- (void)_initializeTextView
{
  id v3 = objc_alloc_init(MEMORY[0x263F82D60]);
  [(SUUIPinnedFooterView *)self setTextView:v3];

  double v4 = [(SUUIPinnedFooterView *)self textView];
  [v4 setDataDetectorTypes:2];

  double v5 = [(SUUIPinnedFooterView *)self textView];
  double v6 = [MEMORY[0x263F825C8] clearColor];
  [v5 setBackgroundColor:v6];

  id v7 = [(SUUIPinnedFooterView *)self textView];
  [v7 setEditable:0];

  double v8 = [(SUUIPinnedFooterView *)self textView];
  objc_msgSend(v8, "setTextContainerInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  [(SUUIPinnedFooterView *)self _configureTextViewTextStyling];
  id v10 = [(SUUIPinnedFooterView *)self contentView];
  v9 = [(SUUIPinnedFooterView *)self textView];
  [v10 addSubview:v9];
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end