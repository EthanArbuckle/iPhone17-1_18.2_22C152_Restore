@interface TUIAssistantSeparatorView
+ (id)barButtonItem;
- (TUIAssistantSeparatorView)initWithFrame:(CGRect)a3;
- (UIView)innerSeparatorView;
- (void)layoutSubviews;
- (void)setInnerSeparatorView:(id)a3;
@end

@implementation TUIAssistantSeparatorView

- (void).cxx_destruct
{
}

- (void)setInnerSeparatorView:(id)a3
{
}

- (UIView)innerSeparatorView
{
  return self->_innerSeparatorView;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)TUIAssistantSeparatorView;
  [(TUIAssistantSeparatorView *)&v17 layoutSubviews];
  [(TUIAssistantSeparatorView *)self bounds];
  double v4 = v3;
  v5 = [(TUIAssistantSeparatorView *)self innerSeparatorView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v4, 19.0);

  double v6 = TUIScreenScaleForView(self);
  v7 = [(TUIAssistantSeparatorView *)self innerSeparatorView];
  [v7 frame];
  UIRectCenteredYInRectScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(TUIAssistantSeparatorView *)self innerSeparatorView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (TUIAssistantSeparatorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TUIAssistantSeparatorView;
  double v3 = -[TUIAssistantSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(TUIAssistantSeparatorView *)v3 _setCornerRadius:*(double *)&kTUISeparatorCornerRadius];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(TUIAssistantSeparatorView *)v4 setInnerSeparatorView:v6];

    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v8 = [(TUIAssistantSeparatorView *)v4 innerSeparatorView];
    [v8 setBackgroundColor:v7];

    double v9 = [(TUIAssistantSeparatorView *)v4 innerSeparatorView];
    [(TUIAssistantSeparatorView *)v4 addSubview:v9];
  }
  return v4;
}

+ (id)barButtonItem
{
  v2 = objc_alloc_init(TUIAssistantSeparatorView);
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v2];
  [v3 setWidth:1.0];

  return v3;
}

@end