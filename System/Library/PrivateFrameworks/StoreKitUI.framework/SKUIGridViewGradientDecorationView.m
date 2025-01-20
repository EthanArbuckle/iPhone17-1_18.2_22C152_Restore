@interface SKUIGridViewGradientDecorationView
- (SKUIGridViewGradientDecorationView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation SKUIGridViewGradientDecorationView

- (SKUIGridViewGradientDecorationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGridViewGradientDecorationView initWithFrame:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIGridViewGradientDecorationView;
  return -[SKUIGridViewGradientDecorationView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIGridViewGradientDecorationView;
  [(SKUIGridViewGradientDecorationView *)&v9 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(SKUIGridViewGradientDecorationView *)self bounds];
  -[SKUIGridViewGradientDecorationBackgroundView setFrame:](backgroundView, "setFrame:");
  if ([(IKColor *)self->_kolor colorType] == 3)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    v5 = [(IKColor *)self->_kolor gradientColors];
    v6 = [v4 arrayWithArray:v5];

    if ([v6 count])
    {
      v7 = [(IKColor *)self->_kolor gradientColors];
      v8 = [v7 firstObject];

      [v6 removeObjectAtIndex:0];
      [(SKUIGridViewGradientDecorationBackgroundView *)self->_backgroundView setBackgroundColor:v8];
      [(SKUIGridViewGradientDecorationView *)self _createGradient:v6 withGradientType:[(IKColor *)self->_kolor gradientDirectionType]];
    }
  }
}

- (void)_createGradient:(id)a3 withGradientType:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(SKUIGridViewGradientDecorationBackgroundView *)self->_backgroundView layer];
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
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
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
  v15.super_class = (Class)SKUIGridViewGradientDecorationView;
  [(SKUIGridViewGradientDecorationView *)&v15 applyLayoutAttributes:v4];
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(SKUIGridViewGradientDecorationBackgroundView *)backgroundView removeFromSuperview];
    v6 = self->_backgroundView;
    self->_backgroundView = 0;
  }
  double v7 = [SKUIGridViewGradientDecorationBackgroundView alloc];
  double v8 = -[SKUIGridViewGradientDecorationBackgroundView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v9 = self->_backgroundView;
  self->_backgroundView = v8;

  [(SKUIGridViewGradientDecorationBackgroundView *)self->_backgroundView setUserInteractionEnabled:0];
  [(SKUIGridViewGradientDecorationView *)self addSubview:self->_backgroundView];
  double v10 = [v4 gradientColor];
  kolor = self->_kolor;
  self->_kolor = v10;

  if ([(IKColor *)self->_kolor colorType] != 3)
  {
    id v12 = self->_backgroundView;
    uint64_t v13 = [v4 gradientColor];
    uint64_t v14 = [v13 color];
    [(SKUIGridViewGradientDecorationBackgroundView *)v12 setBackgroundColor:v14];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGridViewGradientDecorationView initWithFrame:]";
}

@end