@interface UIKeyboardEmojiVariantViewCell
- (BOOL)highlighted;
- (CGSize)intrinsicContentSize;
- (NSString)emoji;
- (UIKBRenderConfig)renderConfig;
- (UIKeyboardEmojiVariantViewCell)initWithFrame:(CGRect)a3;
- (void)dragWillBegin:(id)a3;
- (void)setEmoji:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation UIKeyboardEmojiVariantViewCell

- (UIKeyboardEmojiVariantViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiVariantViewCell;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[UIKeyboardEmojiDraggableView initWithFrame:]([UIKeyboardEmojiDraggableView alloc], "initWithFrame:", 3.0, 3.0, 32.0, 32.0);
    labelView = v3->_labelView;
    v3->_labelView = v4;

    v6 = [off_1E52D39B8 systemFontOfSize:32.0];
    [(UIKeyboardEmojiDraggableView *)v3->_labelView setFont:v6];

    [(UIKeyboardEmojiDraggableView *)v3->_labelView setDragEnabled:1];
    [(UIKeyboardEmojiDraggableView *)v3->_labelView setDelegate:v3];
    v7 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 38.0, 38.0);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v7;

    v9 = [(UIView *)v3->_backgroundView layer];
    [v9 setCornerRadius:6.0];

    v10 = [(UIKeyboardEmojiVariantViewCell *)v3 colorForBackgroundView];
    [(UIView *)v3->_backgroundView setBackgroundColor:v10];

    [(UIView *)v3->_backgroundView setHidden:1];
    [(UIView *)v3 addSubview:v3->_backgroundView];
    [(UIView *)v3 addSubview:v3->_labelView];
  }
  return v3;
}

- (NSString)emoji
{
  return [(UIKeyboardEmojiDraggableView *)self->_labelView text];
}

- (void)setEmoji:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
}

- (CGSize)intrinsicContentSize
{
  double v2 = 38.0;
  double v3 = 38.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dragWillBegin:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end