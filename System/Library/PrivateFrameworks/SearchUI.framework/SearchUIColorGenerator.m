@interface SearchUIColorGenerator
- (SFColor)sfColor;
- (SearchUIColorGenerator)initWithSFColor:(id)a3;
- (int)defaultTintStyle;
- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4;
- (void)setSfColor:(id)a3;
@end

@implementation SearchUIColorGenerator

- (SearchUIColorGenerator)initWithSFColor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIColorGenerator;
  v5 = [(SearchUIColorGenerator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SearchUIColorGenerator *)v5 setSfColor:v4];
  }

  return v6;
}

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a4;
  v6 = [(SearchUIColorGenerator *)self sfColor];
  v7 = (void *)MEMORY[0x1E4FB1618];
  [v6 redComponent];
  double v9 = fmin(v8, 1.0);
  [v6 greenComponent];
  double v11 = fmin(v10, 1.0);
  [v6 blueComponent];
  double v13 = fmin(v12, 1.0);
  [v6 alphaComponent];
  if (v14 == 0.0) {
    double v14 = 1.0;
  }
  uint64_t v15 = objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v9, v11, v13, fmin(v14, 1.0));
  v16 = (void *)v15;
  if (v15)
  {
    v18[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v5[2](v5, v17);
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (int)defaultTintStyle
{
  return 2;
}

- (SFColor)sfColor
{
  return self->_sfColor;
}

- (void)setSfColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end