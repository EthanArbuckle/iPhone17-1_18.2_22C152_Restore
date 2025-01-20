@interface WFCircularGlyphView
- (NSString)glyphName;
- (UIColor)glyphBackgroundColor;
- (UIColor)glyphColor;
- (UIImageView)glyphImageView;
- (UIView)backgroundColorView;
- (WFCircularGlyphView)initWithName:(id)a3 glyphColor:(id)a4 backgroundColor:(id)a5;
- (double)imagePointSize;
- (id)glyphImage;
- (void)configureBackgroundColorView;
- (void)configureGlyphImageView;
- (void)configureViews;
- (void)setBackgroundColorView:(id)a3;
- (void)setGlyphBackgroundColor:(id)a3;
- (void)setGlyphColor:(id)a3;
- (void)setGlyphImageView:(id)a3;
- (void)setGlyphName:(id)a3;
- (void)setImagePointSize:(double)a3;
@end

@implementation WFCircularGlyphView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_glyphBackgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_glyphName, 0);
}

- (void)setBackgroundColorView:(id)a3
{
}

- (void)setGlyphImageView:(id)a3
{
}

- (void)setGlyphBackgroundColor:(id)a3
{
}

- (UIColor)glyphBackgroundColor
{
  return self->_glyphBackgroundColor;
}

- (void)setGlyphColor:(id)a3
{
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphName:(id)a3
{
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (double)imagePointSize
{
  return self->_imagePointSize;
}

- (void)setImagePointSize:(double)a3
{
  if (self->_imagePointSize != a3)
  {
    self->_imagePointSize = a3 * 0.7;
    [(WFCircularGlyphView *)self configureViews];
    id v4 = [(WFCircularGlyphView *)self glyphImageView];
    [v4 frame];
    -[WFCircularGlyphView setFrame:](self, "setFrame:");
  }
}

- (void)configureBackgroundColorView
{
  id v21 = [(WFCircularGlyphView *)self backgroundColorView];
  v3 = [(WFCircularGlyphView *)self glyphImageView];
  id v4 = [(WFCircularGlyphView *)self glyphBackgroundColor];
  if (v4)
  {
    [v21 setBackgroundColor:v4];
  }
  else
  {
    v5 = [MEMORY[0x263F825C8] systemBlueColor];
    [v21 setBackgroundColor:v5];
  }
  [v3 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v3 image];
  [v14 contentInsets];
  objc_msgSend(v21, "setFrame:", v7 + v18, v9 + v15, v11 - (v18 + v16), v13 - (v15 + v17));

  [v21 frame];
  CGFloat v19 = CGRectGetWidth(v23) * 0.5;
  v20 = [v21 layer];
  [v20 setCornerRadius:v19];
}

- (void)configureGlyphImageView
{
  id v11 = [(WFCircularGlyphView *)self glyphImage];
  [v11 size];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(WFCircularGlyphView *)self glyphImageView];
  double v8 = [(WFCircularGlyphView *)self glyphImage];
  [v7 setImage:v8];

  double v9 = [(WFCircularGlyphView *)self glyphColor];
  if (v9)
  {
    [v7 setTintColor:v9];
  }
  else
  {
    double v10 = [MEMORY[0x263F825C8] systemWhiteColor];
    [v7 setTintColor:v10];
  }
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);
}

- (id)glyphImage
{
  double v3 = (void *)MEMORY[0x263F827E8];
  double v4 = [(WFCircularGlyphView *)self glyphName];
  double v5 = [v3 systemImageNamed:v4];
  double v6 = (void *)MEMORY[0x263F82818];
  [(WFCircularGlyphView *)self imagePointSize];
  double v7 = objc_msgSend(v6, "configurationWithPointSize:");
  double v8 = [v5 imageWithConfiguration:v7];

  return v8;
}

- (UIView)backgroundColorView
{
  backgroundColorView = self->_backgroundColorView;
  if (!backgroundColorView)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    double v5 = self->_backgroundColorView;
    self->_backgroundColorView = v4;

    backgroundColorView = self->_backgroundColorView;
  }
  double v6 = backgroundColorView;
  return v6;
}

- (UIImageView)glyphImageView
{
  glyphImageView = self->_glyphImageView;
  if (!glyphImageView)
  {
    double v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    double v5 = self->_glyphImageView;
    self->_glyphImageView = v4;

    glyphImageView = self->_glyphImageView;
  }
  double v6 = glyphImageView;
  return v6;
}

- (void)configureViews
{
  [(WFCircularGlyphView *)self configureGlyphImageView];
  [(WFCircularGlyphView *)self configureBackgroundColorView];
}

- (WFCircularGlyphView)initWithName:(id)a3 glyphColor:(id)a4 backgroundColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFCircularGlyphView;
  id v11 = [(WFCircularGlyphView *)&v17 init];
  double v12 = v11;
  if (v11)
  {
    [(WFCircularGlyphView *)v11 setGlyphName:v8];
    [(WFCircularGlyphView *)v12 setGlyphColor:v9];
    [(WFCircularGlyphView *)v12 setGlyphBackgroundColor:v10];
    [(WFCircularGlyphView *)v12 setImagePointSize:35.0];
    double v13 = [(WFCircularGlyphView *)v12 backgroundColorView];
    [(WFCircularGlyphView *)v12 addSubview:v13];

    v14 = [(WFCircularGlyphView *)v12 glyphImageView];
    [(WFCircularGlyphView *)v12 addSubview:v14];

    double v15 = v12;
  }

  return v12;
}

@end