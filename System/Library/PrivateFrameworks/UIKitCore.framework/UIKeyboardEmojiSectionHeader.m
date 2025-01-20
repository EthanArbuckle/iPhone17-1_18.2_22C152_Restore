@interface UIKeyboardEmojiSectionHeader
- (BOOL)useVibrantBlend;
- (NSString)headerName;
- (UIColor)headerTextColor;
- (UIEdgeInsets)insets;
- (UIKeyboardEmojiSectionHeader)initWithFrame:(CGRect)a3;
- (UIVisualEffect)effect;
- (double)headerFontSize;
- (double)headerOpacity;
- (void)layoutSubviews;
- (void)setEffect:(id)a3;
- (void)setHeaderFontSize:(double)a3;
- (void)setHeaderName:(id)a3;
- (void)setHeaderOpacity:(double)a3;
- (void)setHeaderTextColor:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setUseVibrantBlend:(BOOL)a3;
@end

@implementation UIKeyboardEmojiSectionHeader

- (UIKeyboardEmojiSectionHeader)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiSectionHeader;
  v3 = -[UICollectionReusableView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UILabel alloc];
    [(UIView *)v3 bounds];
    uint64_t v5 = -[UILabel initWithFrame:](v4, "initWithFrame:");
    emojiSectionHeader = v3->_emojiSectionHeader;
    v3->_emojiSectionHeader = (UILabel *)v5;

    v7 = +[UIColor clearColor];
    [(UIView *)v3->_emojiSectionHeader setBackgroundColor:v7];

    [(UIView *)v3 addSubview:v3->_emojiSectionHeader];
  }
  return v3;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardEmojiSectionHeader;
  [(UIView *)&v16 layoutSubviews];
  backdropView = self->_backdropView;
  if (backdropView)
  {
    [(UIView *)self bounds];
    -[UIView setFrame:](backdropView, "setFrame:");
  }
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UIKeyboardEmojiSectionHeader *)self insets];
  -[UILabel setFrame:](self->_emojiSectionHeader, "setFrame:", v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));
}

- (void)setHeaderName:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  double v6 = [v4 currentLocale];
  id v7 = [v5 uppercaseStringWithLocale:v6];

  [(UILabel *)self->_emojiSectionHeader setText:v7];
}

- (NSString)headerName
{
  return [(UILabel *)self->_emojiSectionHeader text];
}

- (void)setHeaderTextColor:(id)a3
{
}

- (UIColor)headerTextColor
{
  return [(UILabel *)self->_emojiSectionHeader textColor];
}

- (void)setHeaderFontSize:(double)a3
{
  emojiSectionHeader = self->_emojiSectionHeader;
  id v4 = [off_1E52D39B8 boldSystemFontOfSize:a3];
  [(UILabel *)emojiSectionHeader setFont:v4];
}

- (double)headerFontSize
{
  v2 = [(UILabel *)self->_emojiSectionHeader font];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (void)setHeaderOpacity:(double)a3
{
  [(UIView *)self->_emojiSectionHeader setOpaque:0];
  emojiSectionHeader = self->_emojiSectionHeader;
  [(UIView *)emojiSectionHeader setAlpha:a3];
}

- (double)headerOpacity
{
  [(UIView *)self->_emojiSectionHeader alpha];
  return result;
}

- (void)setUseVibrantBlend:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    double v6 = [(UIView *)self->_emojiSectionHeader layer];
    [v6 setCompositingFilter:v5];
  }
  else
  {
    id v5 = [(UIView *)self->_emojiSectionHeader layer];
    [v5 setCompositingFilter:0];
  }

  BOOL v7 = !v3;
  double v8 = [(UIView *)self layer];
  [v8 setAllowsGroupOpacity:v7];

  id v9 = [(UIView *)self layer];
  [v9 setAllowsGroupBlending:v7];
}

- (BOOL)useVibrantBlend
{
  v2 = [(UIView *)self->_emojiSectionHeader layer];
  BOOL v3 = [v2 compositingFilter];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setEffect:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4 && !self->_backdropView)
  {
    id v5 = [UIVisualEffectView alloc];
    [(UIView *)self bounds];
    double v6 = -[UIVisualEffectView initWithFrame:](v5, "initWithFrame:");
    backdropView = self->_backdropView;
    self->_backdropView = v6;

    [(UIView *)self insertSubview:self->_backdropView atIndex:0];
    id v4 = v8;
  }
  [(UIVisualEffectView *)self->_backdropView setEffect:v4];
}

- (UIVisualEffect)effect
{
  return [(UIVisualEffectView *)self->_backdropView effect];
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_emojiSectionHeader, 0);
}

@end