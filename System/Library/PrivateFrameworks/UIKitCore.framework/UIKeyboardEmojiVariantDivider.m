@interface UIKeyboardEmojiVariantDivider
- (CGSize)intrinsicContentSize;
- (UIKBRenderConfig)renderConfig;
- (UIKeyboardEmojiVariantDivider)initWithFrame:(CGRect)a3;
- (void)setRenderConfig:(id)a3;
@end

@implementation UIKeyboardEmojiVariantDivider

- (UIKeyboardEmojiVariantDivider)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiVariantDivider;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 3.0, 0.0, 1.0, 38.0);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    v6 = [(UIView *)v3->_backgroundView layer];
    [v6 setCornerRadius:6.0];

    v7 = +[UIColor separatorColor];
    [(UIView *)v3->_backgroundView setBackgroundColor:v7];

    [(UIView *)v3 addSubview:v3->_backgroundView];
  }
  return v3;
}

- (void)setRenderConfig:(id)a3
{
  if ([a3 lightKeyboard]) {
    UIKeyboardGetLightCandidateSeparatorColor();
  }
  else {
  id v4 = +[UIColor colorWithWhite:1.0 alpha:0.1];
  }
  [(UIView *)self->_backgroundView setBackgroundColor:v4];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 38.0;
  double v3 = 7.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end