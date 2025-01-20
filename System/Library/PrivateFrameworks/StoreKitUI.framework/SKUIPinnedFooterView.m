@interface SKUIPinnedFooterView
- (NSAttributedString)attributedText;
- (SKUIPinnedFooterView)initWithFrame:(CGRect)a3;
- (UITextView)textView;
- (double)horizontalPadding;
- (void)_configureTextViewTextStyling;
- (void)_initializeTextView;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setTextView:(id)a3;
@end

@implementation SKUIPinnedFooterView

- (SKUIPinnedFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPinnedFooterView initWithFrame:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIPinnedFooterView;
  v8 = -[SKUIPinnedFooterView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8) {
    [(SKUIPinnedFooterView *)v8 _initializeTextView];
  }
  return v9;
}

- (void)layoutSubviews
{
  [(SKUIPinnedFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(SKUIPinnedFooterView *)self horizontalPadding];
  double v8 = v4 + v7 * -2.0;
  v9 = [(SKUIPinnedFooterView *)self textView];
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  double v11 = v10;
  double v13 = v12;

  [(SKUIPinnedFooterView *)self horizontalPadding];
  double v15 = v14;
  v16 = [(SKUIPinnedFooterView *)self textView];
  objc_msgSend(v16, "setFrame:", v15, v6 + -10.0 - v13, v11, v13);

  v17.receiver = self;
  v17.super_class = (Class)SKUIPinnedFooterView;
  [(SKUIPinnedFooterView *)&v17 layoutSubviews];
}

- (void)setAttributedText:(id)a3
{
  double v6 = (NSAttributedString *)a3;
  if (self->_attributedText != v6)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    double v5 = [(SKUIPinnedFooterView *)self textView];
    [v5 setAttributedText:v6];

    [(SKUIPinnedFooterView *)self _configureTextViewTextStyling];
  }
}

- (void)_configureTextViewTextStyling
{
  double v3 = [(SKUIPinnedFooterView *)self textView];
  double v4 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v3 setTextColor:v4];

  double v5 = [(SKUIPinnedFooterView *)self textView];
  [v5 setTextAlignment:1];

  id v7 = [(SKUIPinnedFooterView *)self textView];
  double v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [v7 setFont:v6];
}

- (void)_initializeTextView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  [(SKUIPinnedFooterView *)self setTextView:v3];

  double v4 = [(SKUIPinnedFooterView *)self textView];
  [v4 setDataDetectorTypes:2];

  double v5 = [(SKUIPinnedFooterView *)self textView];
  double v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  id v7 = [(SKUIPinnedFooterView *)self textView];
  [v7 setEditable:0];

  double v8 = [(SKUIPinnedFooterView *)self textView];
  objc_msgSend(v8, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  [(SKUIPinnedFooterView *)self _configureTextViewTextStyling];
  id v10 = [(SKUIPinnedFooterView *)self contentView];
  v9 = [(SKUIPinnedFooterView *)self textView];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPinnedFooterView initWithFrame:]";
}

@end