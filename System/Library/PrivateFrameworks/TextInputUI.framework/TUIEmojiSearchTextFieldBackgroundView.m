@interface TUIEmojiSearchTextFieldBackgroundView
- (TUIEmojiSearchTextFieldBackgroundView)initWithFrame:(CGRect)a3;
- (unint64_t)backgroundStyle;
- (void)_setRenderConfig:(id)a3;
- (void)layoutSubviews;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setBackgroundStyle:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation TUIEmojiSearchTextFieldBackgroundView

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiSearchTextFieldBackgroundView;
  [(TUIEmojiSearchTextFieldBackgroundView *)&v8 layoutSubviews];
  if (TUIRemoteEmojiSearchViewControllerEnabled())
  {
    [(TUIEmojiSearchTextFieldBackgroundView *)self frame];
    double v4 = v3 * 0.5;
    v5 = [(TUIEmojiSearchTextFieldBackgroundView *)self layer];
    v6 = v5;
    double v7 = v4;
  }
  else
  {
    v5 = [(TUIEmojiSearchTextFieldBackgroundView *)self layer];
    v6 = v5;
    double v7 = 12.0;
  }
  [v5 setCornerRadius:v7];
}

- (void)setBackgroundStyle:(unint64_t)a3
{
}

- (void)setBackgroundStyle:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    BOOL v4 = a4;
    self->_backgroundStyle = a3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__TUIEmojiSearchTextFieldBackgroundView_setBackgroundStyle_animated___block_invoke;
    v8[3] = &unk_1E5593988;
    v8[4] = self;
    v8[5] = a3;
    v6 = (void (**)(void))_Block_copy(v8);
    if (v4)
    {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v6 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      double v7 = [(TUIEmojiSearchTextFieldBackgroundView *)self layer];
      [v7 removeAllAnimations];

      v6[2](v6);
    }
  }
}

void __69__TUIEmojiSearchTextFieldBackgroundView_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.04 alpha:1.0];
  }
  else
  {
    if (v2 != 1) {
      return;
    }
    uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_3057];
  }
  id v4 = (id)v3;
  [*(id *)(a1 + 32) setBackgroundColor:v3];
}

id __69__TUIEmojiSearchTextFieldBackgroundView_setBackgroundStyle_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 accessibilityContrast] == 1)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  else
  {
    if ([v2 userInterfaceStyle] == 1)
    {
      double v4 = 0.05;
      double v5 = 1.0;
    }
    else
    {
      double v5 = 0.1;
      double v4 = 1.0;
    }
    uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithWhite:v5 alpha:v4];
  }
  v6 = (void *)v3;

  return v6;
}

- (void)_setRenderConfig:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TUIEmojiSearchTextFieldBackgroundView;
  id v4 = a3;
  [(TUIEmojiSearchTextFieldBackgroundView *)&v7 _setRenderConfig:v4];
  int v5 = objc_msgSend(v4, "lightKeyboard", v7.receiver, v7.super_class);

  if (v5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(TUIEmojiSearchTextFieldBackgroundView *)self setOverrideUserInterfaceStyle:v6];
}

- (TUIEmojiSearchTextFieldBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchTextFieldBackgroundView;
  id v4 = -[TUIEmojiSearchTextFieldBackgroundView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  int v5 = v4;
  if (v4)
  {
    [(TUIEmojiSearchTextFieldBackgroundView *)v4 setUserInteractionEnabled:0];
    if (TUIRemoteEmojiSearchViewControllerEnabled())
    {
      uint64_t v6 = [(TUIEmojiSearchTextFieldBackgroundView *)v5 layer];
      [v6 setCornerRadius:height * 0.5];

      objc_super v7 = (uint64_t *)MEMORY[0x1E4F39EA0];
    }
    else
    {
      objc_super v8 = [(TUIEmojiSearchTextFieldBackgroundView *)v5 layer];
      [v8 setCornerRadius:12.0];

      objc_super v7 = (uint64_t *)MEMORY[0x1E4F39EA8];
    }
    uint64_t v9 = *v7;
    v10 = [(TUIEmojiSearchTextFieldBackgroundView *)v5 layer];
    [v10 setCornerCurve:v9];

    uint64_t v11 = *MEMORY[0x1E4F3A2E8];
    v12 = [(TUIEmojiSearchTextFieldBackgroundView *)v5 layer];
    [v12 setCompositingFilter:v11];

    [(TUIEmojiSearchTextFieldBackgroundView *)v5 setBackgroundStyle:1 animated:0];
  }
  return v5;
}

@end