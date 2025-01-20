@interface LookAroundPuckGlyphView
- (BOOL)isTilted;
- (CGSize)intrinsicContentSize;
- (LookAroundPuckGlyphView)initWithFrame:(CGRect)a3;
- (void)setTilted:(BOOL)a3;
- (void)setTilted:(BOOL)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation LookAroundPuckGlyphView

- (LookAroundPuckGlyphView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)LookAroundPuckGlyphView;
  v3 = -[LookAroundPuckGlyphView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIImage imageNamed:@"LookAroundPuckAnimation"];
    v5 = +[UIColor whiteColor];
    uint64_t v6 = [v4 _flatImageWithColor:v5];
    image = v3->_image;
    v3->_image = (UIImage *)v6;

    v8 = [(LookAroundPuckGlyphView *)v3 layer];
    [v8 setContents:[v3->_image CGImage]];
    [(LookAroundPuckGlyphView *)v3 tintColorDidChange];
    [v8 setContentsRect:0.0, 0.0, 0.2, 0.2];
    v9 = v3;
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(UIImage *)self->_image size];
  double v3 = v2 / 5.0;
  double v5 = v4 / 5.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)LookAroundPuckGlyphView;
  [(LookAroundPuckGlyphView *)&v6 tintColorDidChange];
  id v3 = [(LookAroundPuckGlyphView *)self tintColor];
  id v4 = [v3 CGColor];
  double v5 = [(LookAroundPuckGlyphView *)self layer];
  [v5 setContentsMultiplyColor:v4];
}

- (void)setTilted:(BOOL)a3
{
  if (self->_tilted != a3)
  {
    BOOL v3 = a3;
    self->_tilted = a3;
    double v5 = [(LookAroundPuckGlyphView *)self layer];
    [v5 removeAnimationForKey:@"tilt"];

    if (v3) {
      char v6 = 24;
    }
    else {
      char v6 = 0;
    }
    if (v3) {
      unsigned int v7 = 4;
    }
    else {
      unsigned int v7 = 0;
    }
    double v8 = (double)((v6 - (v7 & 0xEF | (16 * ((v7 & 4) != 0)))) & 0xFC) / 5.0;
    double v9 = (double)v7 / 5.0;
    id v10 = [(LookAroundPuckGlyphView *)self layer];
    [v10 setContentsRect:v8, v9, 0.2, 0.2];
  }
}

- (void)setTilted:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_tilted != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    unsigned int v7 = [(LookAroundPuckGlyphView *)self layer];
    double v8 = [v7 presentationLayer];
    [v8 contentsRect];
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    double MinX = CGRectGetMinX(v26);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v27);

    [(LookAroundPuckGlyphView *)self setTilted:v5];
    if (v4)
    {
      unint64_t v15 = 5 * (unint64_t)MinX + 25 * (unint64_t)MinY;
      if (v5) {
        unint64_t v16 = 24;
      }
      else {
        unint64_t v16 = 0;
      }
      uint64_t v17 = v16 - v15 + 1;
      id v24 = +[NSMutableArray arrayWithCapacity:v17];
      if (v16 - v15 != -1)
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        do
        {
          if (v16 <= v15) {
            uint64_t v20 = v18;
          }
          else {
            uint64_t v20 = v19;
          }
          v21 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", (double)((v20 + v15) % 5) / 5.0, (double)((v20 + v15) / 5) / 5.0, 0.2, 0.2);
          [v24 addObject:v21];

          ++v19;
          --v18;
        }
        while (v17 != v19);
      }
      v22 = +[CAKeyframeAnimation animationWithKeyPath:@"contentsRect"];
      [v22 setDuration:(double)(unint64_t)v17 * 0.0166666667];
      [v22 setValues:v24];
      [v22 setCalculationMode:kCAAnimationDiscrete];
      v23 = [(LookAroundPuckGlyphView *)self layer];
      [v23 addAnimation:v22 forKey:@"tilt"];
    }
  }
}

- (BOOL)isTilted
{
  return self->_tilted;
}

- (void).cxx_destruct
{
}

@end