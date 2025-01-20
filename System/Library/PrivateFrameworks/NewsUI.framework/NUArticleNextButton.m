@interface NUArticleNextButton
+ (id)nextArrowImage;
+ (id)titleLabelFont;
- (NUArticleNextButton)initWithFrame:(CGRect)a3;
- (UIImageView)nextArrowImageView;
- (UILabel)nextTitleLabel;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setNextLabelTitle:(id)a3 animated:(BOOL)a4;
@end

@implementation NUArticleNextButton

+ (id)titleLabelFont
{
  if (titleLabelFont_onceToken != -1) {
    dispatch_once(&titleLabelFont_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)titleLabelFont_font;

  return v2;
}

uint64_t __37__NUArticleNextButton_titleLabelFont__block_invoke()
{
  titleLabelFont_font = [MEMORY[0x263F1C658] systemFontOfSize:13.0 weight:*MEMORY[0x263F1D310]];

  return MEMORY[0x270F9A758]();
}

+ (id)nextArrowImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__NUArticleNextButton_nextArrowImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nextArrowImage_onceToken != -1) {
    dispatch_once(&nextArrowImage_onceToken, block);
  }
  v2 = (void *)nextArrowImage_image;

  return v2;
}

void __37__NUArticleNextButton_nextArrowImage__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F1C6B0];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];
  uint64_t v2 = [v1 imageNamed:@"icon-article-next-arrow" inBundle:v4 compatibleWithTraitCollection:0];
  v3 = (void *)nextArrowImage_image;
  nextArrowImage_image = v2;
}

- (NUArticleNextButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NUArticleNextButton;
  v3 = -[NUArticleNextButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    nextTitleLabel = v3->_nextTitleLabel;
    v3->_nextTitleLabel = (UILabel *)v5;

    [(UILabel *)v3->_nextTitleLabel setTextAlignment:2];
    v7 = [(id)objc_opt_class() titleLabelFont];
    [(UILabel *)v3->_nextTitleLabel setFont:v7];

    [(UILabel *)v3->_nextTitleLabel nu_supportViewDebugging];
    [(NUArticleNextButton *)v3 addSubview:v3->_nextTitleLabel];
    id v8 = objc_alloc(MEMORY[0x263F1C6D0]);
    v9 = [(id)objc_opt_class() nextArrowImage];
    uint64_t v10 = [v8 initWithImage:v9];
    nextArrowImageView = v3->_nextArrowImageView;
    v3->_nextArrowImageView = (UIImageView *)v10;

    [(UIImageView *)v3->_nextArrowImageView setAlpha:0.0];
    [(NUArticleNextButton *)v3 addSubview:v3->_nextArrowImageView];
    [(UIView *)v3 nu_supportViewDebugging];
  }
  return v3;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)NUArticleNextButton;
  [(NUArticleNextButton *)&v23 layoutSubviews];
  [(NUArticleNextButton *)self center];
  double v4 = v3;
  double v6 = v5;
  v7 = [(NUArticleNextButton *)self nextArrowImageView];
  objc_msgSend(v7, "setCenter:", v4, v6);

  id v8 = [(NUArticleNextButton *)self nextArrowImageView];
  [v8 frame];
  CGFloat v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [(NUArticleNextButton *)self frame];
  double Width = CGRectGetWidth(v24);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  double v18 = Width - CGRectGetWidth(v25);
  v19 = [(NUArticleNextButton *)self nextArrowImageView];
  objc_msgSend(v19, "setFrame:", v18, v12, v14, v16);

  [(NUArticleNextButton *)self frame];
  double v21 = v20;
  v22 = [(NUArticleNextButton *)self nextTitleLabel];
  objc_msgSend(v22, "setFrame:", 0.0, 0.0, v18 + -10.0, v21);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUArticleNextButton;
  -[NUArticleNextButton setHighlighted:](&v8, sel_setHighlighted_);
  if (v3) {
    double v5 = 0.5;
  }
  else {
    double v5 = 1.0;
  }
  double v6 = [(NUArticleNextButton *)self nextTitleLabel];
  [v6 setAlpha:v5];

  v7 = [(NUArticleNextButton *)self nextArrowImageView];
  [v7 setAlpha:v5];
}

- (void)setNextLabelTitle:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v16 = [a3 uppercaseString];
    double v6 = [(NUArticleNextButton *)self nextTitleLabel];
    v7 = [v6 text];
    char v8 = [v16 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      if (v4)
      {
        double v9 = [MEMORY[0x263F15910] animation];
        [v9 setType:*MEMORY[0x263F15FD8]];
        [v9 setDuration:0.15];
        CGFloat v10 = [(NUArticleNextButton *)self nextTitleLabel];
        double v11 = [v10 layer];
        [v11 addAnimation:v9 forKey:@"crossfade"];

        double v12 = [(NUArticleNextButton *)self nextArrowImageView];
        double v13 = [v12 layer];
        [v13 addAnimation:v9 forKey:@"crossfade"];
      }
      double v14 = [(NUArticleNextButton *)self nextTitleLabel];
      [v14 setText:v16];

      double v15 = [(NUArticleNextButton *)self nextArrowImageView];
      [v15 setAlpha:1.0];
    }
  }
}

- (UILabel)nextTitleLabel
{
  return self->_nextTitleLabel;
}

- (UIImageView)nextArrowImageView
{
  return self->_nextArrowImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextArrowImageView, 0);

  objc_storeStrong((id *)&self->_nextTitleLabel, 0);
}

@end