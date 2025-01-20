@interface SUUserRatingView
+ (double)reflectionHeight;
+ (id)copyImageForRating:(float)a3 backgroundColor:(id)a4 style:(int64_t)a5;
- (CGRect)_foregroundImageClipBounds;
- (SUUserRatingView)init;
- (SUUserRatingView)initWithForeground:(id)a3 background:(id)a4;
- (SUUserRatingView)initWithStyle:(int64_t)a3;
- (float)heightWithoutReflection;
- (void)layoutSubviews;
- (void)setValue:(float)a3;
@end

@implementation SUUserRatingView

- (SUUserRatingView)init
{
  return [(SUUserRatingView *)self initWithStyle:0];
}

- (SUUserRatingView)initWithForeground:(id)a3 background:(id)a4
{
  if (a4)
  {
    [a4 size];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  v11 = -[SUUserRatingView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v8, v10);
  if (v11)
  {
    v12 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:a4];
    v11->_backgroundImageView = v12;
    [(SUUserRatingView *)v11 bounds];
    -[UIImageView setFrame:](v12, "setFrame:");
    [(SUUserRatingView *)v11 addSubview:v11->_backgroundImageView];

    v13 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:a3];
    v11->_foregroundImageView = v13;
    [(UIImageView *)v13 setContentsPosition:3];
    [(UIImageView *)v11->_foregroundImageView setClipsToBounds:1];
    foregroundImageView = v11->_foregroundImageView;
    [(SUUserRatingView *)v11 _foregroundImageClipBounds];
    -[UIImageView setFrame:](foregroundImageView, "setFrame:");
    [(SUUserRatingView *)v11 addSubview:v11->_foregroundImageView];
  }
  return v11;
}

- (SUUserRatingView)initWithStyle:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (a3 == 1)
  {
    v6 = @"UserRatingBorderedStarsForeground.png";
    double v7 = @"UserRatingBorderedStarsBackground.png";
    goto LABEL_5;
  }
  if (!a3)
  {
    v6 = @"UserRatingPlainWhiteStarsForeground.png";
    double v7 = @"UserRatingPlainWhiteStarsBackground.png";
LABEL_5:
    uint64_t v8 = [MEMORY[0x263F1C6B0] imageNamed:v7 inBundle:v5];
    uint64_t v9 = [MEMORY[0x263F1C6B0] imageNamed:v6 inBundle:v5];
    goto LABEL_7;
  }
  uint64_t v9 = 0;
  uint64_t v8 = 0;
LABEL_7:

  return [(SUUserRatingView *)self initWithForeground:v9 background:v8];
}

+ (id)copyImageForRating:(float)a3 backgroundColor:(id)a4 style:(int64_t)a5
{
  double v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStyle:a5];
  [v7 setBackgroundColor:a4];
  if (a4) {
    BOOL v8 = [MEMORY[0x263F1C550] clearColor] != (void)a4;
  }
  else {
    BOOL v8 = 0;
  }
  [v7 setOpaque:v8];
  *(float *)&double v9 = a3;
  [v7 setValue:v9];
  [v7 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  char v14 = [v7 isOpaque];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  CGFloat v16 = v15;
  v19.width = v11;
  v19.height = v13;
  UIGraphicsBeginImageContextWithOptions(v19, v14, v16);
  objc_msgSend((id)objc_msgSend(v7, "layer"), "renderInContext:", UIGraphicsGetCurrentContext());
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

+ (double)reflectionHeight
{
  return 10.0;
}

- (float)heightWithoutReflection
{
  [(SUUserRatingView *)self frame];
  double v3 = v2;
  [(id)objc_opt_class() reflectionHeight];
  return v3 - v4;
}

- (void)setValue:(float)a3
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  float v3 = fmaxf(a3, 0.0);
  if (self->_value != v3)
  {
    self->_value = rintf(v3 * 10.0) / 10.0;
    [(SUUserRatingView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  foregroundImageView = self->_foregroundImageView;
  [(SUUserRatingView *)self _foregroundImageClipBounds];

  -[UIImageView setFrame:](foregroundImageView, "setFrame:");
}

- (CGRect)_foregroundImageClipBounds
{
  [(SUUserRatingView *)self bounds];
  double v7 = v6 * self->_value;
  result.size.height = v5;
  result.size.width = v7;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end