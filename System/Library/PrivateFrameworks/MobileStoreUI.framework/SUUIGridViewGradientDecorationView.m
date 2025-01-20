@interface SUUIGridViewGradientDecorationView
- (SUUIGridViewGradientDecorationView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation SUUIGridViewGradientDecorationView

- (SUUIGridViewGradientDecorationView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIGridViewGradientDecorationView;
  return -[SUUIGridViewGradientDecorationView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIGridViewGradientDecorationView;
  [(SUUIGridViewGradientDecorationView *)&v9 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(SUUIGridViewGradientDecorationView *)self bounds];
  -[SUUIGridViewGradientDecorationBackgroundView setFrame:](backgroundView, "setFrame:");
  if ([(IKColor *)self->_kolor colorType] == 3)
  {
    objc_super v4 = (void *)MEMORY[0x263EFF980];
    v5 = [(IKColor *)self->_kolor gradientColors];
    v6 = [v4 arrayWithArray:v5];

    if ([v6 count])
    {
      v7 = [(IKColor *)self->_kolor gradientColors];
      v8 = [v7 firstObject];

      [v6 removeObjectAtIndex:0];
      [(SUUIGridViewGradientDecorationBackgroundView *)self->_backgroundView setBackgroundColor:v8];
      [(SUUIGridViewGradientDecorationView *)self _createGradient:v6 withGradientType:[(IKColor *)self->_kolor gradientDirectionType]];
    }
  }
}

- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(SUUIGridViewGradientDecorationBackgroundView *)self->_backgroundView layer];
  if ([(IKColor *)self->_kolor gradientType] == 1)
  {
    double v7 = 1.0;
    double v8 = 0.5;
    double v9 = 0.0;
    double v10 = 0.5;
  }
  else
  {
    if ([(IKColor *)self->_kolor gradientType] != 2) {
      goto LABEL_6;
    }
    double v9 = 0.5;
    double v10 = 1.0;
    double v8 = 0.0;
    double v7 = 0.5;
  }
  objc_msgSend(v6, "setStartPoint:", v8, v9);
  objc_msgSend(v6, "setEndPoint:", v10, v7);
LABEL_6:
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(id *)(*((void *)&v18 + 1) + 8 * v16);
        objc_msgSend(v11, "addObject:", objc_msgSend(v17, "CGColor", (void)v18));
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  [v6 setColors:v11];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIGridViewGradientDecorationView;
  [(SUUIGridViewGradientDecorationView *)&v15 applyLayoutAttributes:v4];
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(SUUIGridViewGradientDecorationBackgroundView *)backgroundView removeFromSuperview];
    v6 = self->_backgroundView;
    self->_backgroundView = 0;
  }
  double v7 = [SUUIGridViewGradientDecorationBackgroundView alloc];
  double v8 = -[SUUIGridViewGradientDecorationBackgroundView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v9 = self->_backgroundView;
  self->_backgroundView = v8;

  [(SUUIGridViewGradientDecorationBackgroundView *)self->_backgroundView setUserInteractionEnabled:0];
  [(SUUIGridViewGradientDecorationView *)self addSubview:self->_backgroundView];
  double v10 = [v4 gradientColor];
  kolor = self->_kolor;
  self->_kolor = v10;

  if ([(IKColor *)self->_kolor colorType] != 3)
  {
    id v12 = self->_backgroundView;
    uint64_t v13 = [v4 gradientColor];
    uint64_t v14 = [v13 color];
    [(SUUIGridViewGradientDecorationBackgroundView *)v12 setBackgroundColor:v14];
  }
}

- (UIView)backgroundView
{
  return &self->_backgroundView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kolor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end