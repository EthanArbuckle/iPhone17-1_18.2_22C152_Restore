@interface PSLegendColorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PSLegendColorView)initWithColor:(id)a3;
- (UIColor)color;
- (void)drawRect:(CGRect)a3;
- (void)setColor:(id)a3;
@end

@implementation PSLegendColorView

- (PSLegendColorView)initWithColor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSLegendColorView;
  v6 = -[PSLegendColorView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_color, a3);
    [(PSLegendColorView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [MEMORY[0x1E4F428B8] clearColor];
    [(PSLegendColorView *)v7 setBackgroundColor:v8];
  }
  return v7;
}

- (void)drawRect:(CGRect)a3
{
  v4 = [(PSLegendColorView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v7 = (void *)MEMORY[0x1E4F427D0];
  [(PSLegendColorView *)self bounds];
  objc_msgSend(v7, "bezierPathWithOvalInRect:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [MEMORY[0x1E4F428B8] clearColor];
  [v8 setFill];

  [v13 fill];
  color = self->_color;
  if (color)
  {
    objc_super v10 = color;
  }
  else
  {
    if (v5 == 2) {
      [MEMORY[0x1E4F428B8] systemDarkMidGrayColor];
    }
    else {
    objc_super v10 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
    }
  }
  v11 = v10;
  [(UIColor *)v10 setFill];
  [v13 fill];
  if (v5 == 2)
  {
    v12 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.1];
    [v12 setFill];
    [v13 fill];
  }
  CGContextRestoreGState(CurrentContext);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F42A30], "preferredFontForTextStyle:", *MEMORY[0x1E4F43880], a3.width, a3.height);
  [v3 xHeight];
  double v5 = v4;

  double v6 = v5;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end