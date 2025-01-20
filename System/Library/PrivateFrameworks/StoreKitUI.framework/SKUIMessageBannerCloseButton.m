@interface SKUIMessageBannerCloseButton
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SKUIMessageBannerCloseButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SKUIMessageBannerCloseButton *)self imageView];
  v6 = v5;
  double v7 = 0.5;
  if (v3) {
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];

  v8.receiver = self;
  v8.super_class = (Class)SKUIMessageBannerCloseButton;
  [(SKUIMessageBannerCloseButton *)&v8 setHighlighted:v3];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIMessageBannerCloseButton;
  [(SKUIMessageBannerCloseButton *)&v6 layoutSubviews];
  BOOL v3 = [(SKUIMessageBannerCloseButton *)self imageView];
  int v4 = [(SKUIMessageBannerCloseButton *)self isHighlighted];
  double v5 = 0.5;
  if (v4) {
    double v5 = 1.0;
  }
  [v3 setAlpha:v5];
}

@end