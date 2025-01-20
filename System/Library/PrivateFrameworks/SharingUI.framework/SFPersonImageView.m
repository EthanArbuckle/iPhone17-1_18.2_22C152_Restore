@interface SFPersonImageView
+ (id)darkenImage:(id)a3 toLevel:(double)a4;
- (BOOL)imageIsSquare;
- (SFPersonImageView)initWithImage:(id)a3 isSquare:(BOOL)a4;
- (double)highlightDarkeningAlpha;
- (void)layoutSubviews;
- (void)setHighlightDarkeningAlpha:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageIsSquare:(BOOL)a3;
@end

@implementation SFPersonImageView

- (SFPersonImageView)initWithImage:(id)a3 isSquare:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFPersonImageView;
  v7 = [(SFPersonImageView *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SFPersonImageView *)v7 setImageIsSquare:v4];
    [(SFPersonImageView *)v8 setImage:v6];
  }

  return v8;
}

- (void)layoutSubviews
{
  if ([(SFPersonImageView *)self imageIsSquare])
  {
    [(SFPersonImageView *)self frame];
    CGFloat v3 = CGRectGetWidth(v10) * 0.5;
    BOOL v4 = [(SFPersonImageView *)self layer];
    [v4 setCornerRadius:v3];

    v5 = [(SFPersonImageView *)self layer];
    id v8 = v5;
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [(SFPersonImageView *)self layer];
    [v7 setCornerRadius:0.0];

    v5 = [(SFPersonImageView *)self layer];
    id v8 = v5;
    uint64_t v6 = 0;
  }
  [v5 setMasksToBounds:v6];
}

- (void)setImageIsSquare:(BOOL)a3
{
  self->_imageIsSquare = a3;
  [(SFPersonImageView *)self setNeedsLayout];
}

- (void)setImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPersonImageView;
  [(SFPersonImageView *)&v4 setImage:a3];
  [(SFPersonImageView *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  [(SFPersonImageView *)self highlightDarkeningAlpha];
  if (fabs(v5) >= 2.22044605e-16)
  {
    if (v3)
    {
      v7 = [(SFPersonImageView *)self highlightedImage];

      if (!v7)
      {
        id v8 = objc_opt_class();
        v9 = [(SFPersonImageView *)self image];
        [(SFPersonImageView *)self highlightDarkeningAlpha];
        CGRect v10 = objc_msgSend(v8, "darkenImage:toLevel:", v9);
        [(SFPersonImageView *)self setHighlightedImage:v10];
      }
    }
  }
  else
  {
    if (v3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    [(SFPersonImageView *)self setDrawMode:v6];
  }
  v11.receiver = self;
  v11.super_class = (Class)SFPersonImageView;
  [(SFPersonImageView *)&v11 setHighlighted:v3];
}

+ (id)darkenImage:(id)a3 toLevel:(double)a4
{
  id v5 = a3;
  [v5 size];
  double v7 = v6;
  [v5 size];
  double v9 = v8;
  CGRect v10 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, v7, v8);
  objc_super v11 = [MEMORY[0x263F825C8] blackColor];
  [v10 setBackgroundColor:v11];

  [v10 setAlpha:a4];
  v20.width = v7;
  v20.height = v9;
  UIGraphicsBeginImageContext(v20);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v7, v9);
  CGContextTranslateCTM(CurrentContext, 0.0, v9);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  id v13 = v5;
  v14 = (CGImage *)[v13 CGImage];

  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v7;
  v21.size.height = v9;
  CGContextClipToMask(CurrentContext, v21, v14);
  v15 = [v10 layer];
  [v15 renderInContext:CurrentContext];

  Image = CGBitmapContextCreateImage(CurrentContext);
  v17 = [MEMORY[0x263F827E8] imageWithCGImage:Image];
  CGImageRelease(Image);
  UIGraphicsEndImageContext();

  return v17;
}

- (BOOL)imageIsSquare
{
  return self->_imageIsSquare;
}

- (double)highlightDarkeningAlpha
{
  return self->_highlightDarkeningAlpha;
}

- (void)setHighlightDarkeningAlpha:(double)a3
{
  self->_highlightDarkeningAlpha = a3;
}

@end