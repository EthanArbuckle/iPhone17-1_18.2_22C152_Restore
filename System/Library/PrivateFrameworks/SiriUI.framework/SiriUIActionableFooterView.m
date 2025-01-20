@interface SiriUIActionableFooterView
+ (double)defaultHeight;
- (BOOL)hasKeyline;
- (NSString)title;
- (SiriUIActionableFooterView)initWithFrame:(CGRect)a3;
- (SiriUIActionableFooterViewDelegate)delegate;
- (UIEdgeInsets)edgeInsets;
- (id)snippetViewController;
- (void)_buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setHasKeyline:(BOOL)a3;
- (void)setSnippetViewController:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SiriUIActionableFooterView

- (SiriUIActionableFooterView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SiriUIActionableFooterView;
  v3 = -[SiriUIActionableFooterView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SiriUIContentButton buttonWithLightWeightFont];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button addTarget:v3 action:sel__buttonTapped_ forControlEvents:64];
    v6 = [(UIButton *)v3->_button titleLabel];
    [v6 setTextAlignment:0];

    [(UIButton *)v3->_button setContentHorizontalAlignment:1];
    -[UIButton setTitleEdgeInsets:](v3->_button, "setTitleEdgeInsets:", 0.0, 30.0, 0.0, 0.0);
    uint64_t v7 = +[SiriUIKeyline keylineWithKeylineType:2];
    keyline = v3->_keyline;
    v3->_keyline = (SiriUIKeyline *)v7;

    [(SiriUIActionableFooterView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(SiriUIActionableFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIButton setFrame:](self->_button, "setFrame:");
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  -[SiriUIKeyline sizeThatFits:](self->_keyline, "sizeThatFits:", v4, v6);
  keyline = self->_keyline;
  -[SiriUIKeyline setFrame:](keyline, "setFrame:", v7, v8, v9, v10);
}

- (NSString)title
{
  v2 = [(UIButton *)self->_button titleLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
}

- (void)setHasKeyline:(BOOL)a3
{
  if (self->_hasKeyline != a3)
  {
    self->_hasKeyline = a3;
    if (a3) {
      [(SiriUIActionableFooterView *)self addSubview:self->_keyline];
    }
    else {
      [(SiriUIKeyline *)self->_keyline removeFromSuperview];
    }
  }
}

- (void)setSnippetViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_snippetViewController, obj);
    int v7 = [obj conformsToProtocol:&unk_26D6B1E58];

    double v5 = obj;
    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_snippetViewController);
      [(SiriUIActionableFooterView *)self setDelegate:v8];

      double v5 = obj;
    }
  }
}

- (void)_buttonTapped:(id)a3
{
  id v4 = [(SiriUIActionableFooterView *)self delegate];
  [v4 footerViewTapped:self];
}

+ (double)defaultHeight
{
  return 44.0;
}

- (UIEdgeInsets)edgeInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)snippetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  return WeakRetained;
}

- (SiriUIActionableFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIActionableFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasKeyline
{
  return self->_hasKeyline;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_keyline, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end