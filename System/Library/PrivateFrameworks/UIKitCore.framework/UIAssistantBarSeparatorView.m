@interface UIAssistantBarSeparatorView
+ (double)preferredWidth;
- (BOOL)_usesLightStyle;
- (UIAssistantBarSeparatorView)initWithFrame:(CGRect)a3;
- (UIView)innerSeparatorView;
- (void)_updateVisualStyle;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setInnerSeparatorView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIAssistantBarSeparatorView

+ (double)preferredWidth
{
  return 2.0;
}

- (UIAssistantBarSeparatorView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIAssistantBarSeparatorView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIAssistantBarSeparatorView *)v3 setInnerSeparatorView:v5];

    v6 = [(UIAssistantBarSeparatorView *)v3 innerSeparatorView];
    [(UIView *)v3 addSubview:v6];
  }
  return v3;
}

- (BOOL)_usesLightStyle
{
  v2 = [(UIView *)self _inheritedRenderConfig];
  char v3 = [v2 lightKeyboard];

  return v3;
}

- (void)_updateVisualStyle
{
  char v3 = +[UIColor grayColor];
  id v6 = [v3 colorWithAlphaComponent:0.3];

  if (![(UIAssistantBarSeparatorView *)self _usesLightStyle])
  {
    uint64_t v4 = +[UIColor colorWithWhite:1.0 alpha:0.3];

    id v6 = (id)v4;
  }
  v5 = [(UIAssistantBarSeparatorView *)self innerSeparatorView];
  [v5 setBackgroundColor:v6];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIAssistantBarSeparatorView;
  [(UIView *)&v3 didMoveToWindow];
  [(UIAssistantBarSeparatorView *)self _updateVisualStyle];
}

- (void)traitCollectionDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIAssistantBarSeparatorView;
  [(UIView *)&v3 traitCollectionDidChange:a3];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)UIAssistantBarSeparatorView;
  [(UIView *)&v19 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  v9 = [(UIAssistantBarSeparatorView *)self innerSeparatorView];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v6, 32.0);

  v10 = [(UIAssistantBarSeparatorView *)self innerSeparatorView];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = round(v4 + (v8 - v15) * 0.5);
  v18 = [(UIAssistantBarSeparatorView *)self innerSeparatorView];
  objc_msgSend(v18, "setFrame:", v12, v17, v14, v16);
}

- (UIView)innerSeparatorView
{
  return self->_innerSeparatorView;
}

- (void)setInnerSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end