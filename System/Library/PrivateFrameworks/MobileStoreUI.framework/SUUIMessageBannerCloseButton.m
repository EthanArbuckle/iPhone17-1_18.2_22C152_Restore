@interface SUUIMessageBannerCloseButton
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SUUIMessageBannerCloseButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUUIMessageBannerCloseButton *)self imageView];
  v6 = v5;
  double v7 = 0.5;
  if (v3) {
    double v7 = 1.0;
  }
  [v5 setAlpha:v7];

  v8.receiver = self;
  v8.super_class = (Class)SUUIMessageBannerCloseButton;
  [(SUUIMessageBannerCloseButton *)&v8 setHighlighted:v3];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIMessageBannerCloseButton;
  [(SUUIMessageBannerCloseButton *)&v6 layoutSubviews];
  BOOL v3 = [(SUUIMessageBannerCloseButton *)self imageView];
  int v4 = [(SUUIMessageBannerCloseButton *)self isHighlighted];
  double v5 = 0.5;
  if (v4) {
    double v5 = 1.0;
  }
  [v3 setAlpha:v5];
}

@end