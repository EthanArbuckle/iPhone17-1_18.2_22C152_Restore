@interface TSDiOSToolbar
- (BOOL)drawsBackground;
- (CGSize)shadowOffset;
- (UIImage)backgroundImage;
- (double)shadowOpacity;
- (double)shadowRadius;
- (double)shadowX;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)p_updateLayerFlags;
- (void)setBackgroundImage:(id)a3;
- (void)setDrawsBackground:(BOOL)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShadowX:(double)a3;
- (void)setupShadowPath;
@end

@implementation TSDiOSToolbar

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDiOSToolbar;
  [(TSDiOSToolbar *)&v3 dealloc];
}

- (void)setBackgroundImage:(id)a3
{
  if (self->mBackgroundImage != a3)
  {
    id v5 = a3;

    self->mBackgroundImage = (UIImage *)a3;
    [(TSDiOSToolbar *)self p_updateLayerFlags];
    [(TSDiOSToolbar *)self setNeedsDisplay];
  }
}

- (void)setDrawsBackground:(BOOL)a3
{
  if (self->mDrawsBackground != a3)
  {
    self->mDrawsBackground = a3;
    [(TSDiOSToolbar *)self p_updateLayerFlags];
    [(TSDiOSToolbar *)self setNeedsDisplay];
  }
}

- (void)p_updateLayerFlags
{
  mBackgroundImage = self->mBackgroundImage;
  if (mBackgroundImage && self->mDrawsBackground)
  {
    CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo([(UIImage *)mBackgroundImage CGImage]);
    [(TSDiOSToolbar *)self setOpaque:(AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo)];
    uint64_t v5 = [(TSDiOSToolbar *)self isOpaque] ^ 1;
  }
  else
  {
    uint64_t v5 = 1;
    [(TSDiOSToolbar *)self setOpaque:1];
  }

  [(TSDiOSToolbar *)self setClearsContextBeforeDrawing:v5];
}

- (void)setShadowOpacity:(double)a3
{
  float v5 = a3;
  v6 = (void *)[(TSDiOSToolbar *)self layer];
  *(float *)&double v7 = v5;
  [v6 setShadowOpacity:v7];
  self->mShadowOpacity = a3;
}

- (void)setShadowOffset:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  objc_msgSend((id)-[TSDiOSToolbar layer](self, "layer"), "setShadowOffset:", a3.width, a3.height);
  self->mShadowOffset.CGFloat width = width;
  self->mShadowOffset.CGFloat height = height;
}

- (void)setShadowRadius:(double)a3
{
  self->mShadowRadius = a3;
}

- (void)drawRect:(CGRect)a3
{
  if (self->mDrawsBackground)
  {
    mBackgroundImage = self->mBackgroundImage;
    if (mBackgroundImage)
    {
      [(TSDiOSToolbar *)self bounds];
      -[UIImage drawInRect:](mBackgroundImage, "drawInRect:");
    }
    else
    {
      v4.receiver = self;
      v4.super_class = (Class)TSDiOSToolbar;
      -[TSDiOSToolbar drawRect:](&v4, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    }
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)TSDiOSToolbar;
  [(TSDiOSToolbar *)&v5 layoutSubviews];
  if (self->mShadowOpacity > 0.0)
  {
    objc_super v3 = (void *)[(TSDiOSToolbar *)self layer];
    double mShadowOpacity = self->mShadowOpacity;
    *(float *)&double mShadowOpacity = mShadowOpacity;
    [v3 setShadowOpacity:mShadowOpacity];
    objc_msgSend(v3, "setShadowOffset:", self->mShadowOffset.width, self->mShadowOffset.height);
    [v3 setShadowRadius:self->mShadowRadius];
    [(TSDiOSToolbar *)self setupShadowPath];
  }
}

- (void)setupShadowPath
{
  Mutable = CGPathCreateMutable();
  [(TSDiOSToolbar *)self bounds];
  double mShadowX = self->mShadowX;
  v8.origin.x = v5 + mShadowX;
  v8.size.CGFloat width = v6 - mShadowX;
  CGPathAddRect(Mutable, 0, v8);
  objc_msgSend((id)-[TSDiOSToolbar layer](self, "layer"), "setShadowPath:", Mutable);

  CFRelease(Mutable);
}

- (void)setShadowX:(double)a3
{
  self->double mShadowX = a3;
  [(TSDiOSToolbar *)self setupShadowPath];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if (![a4 isEqualToString:@"shadowPath"])
  {
    v11.receiver = self;
    v11.super_class = (Class)TSDiOSToolbar;
    return [(TSDiOSToolbar *)&v11 actionForLayer:a3 forKey:a4];
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDiOSToolbar;
  id v7 = [(TSDiOSToolbar *)&v12 actionForLayer:a3 forKey:@"position"];
  if (v7 == (id)[MEMORY[0x263EFF9D0] null]) {
    return (id)[MEMORY[0x263EFF9D0] null];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  CGRect v8 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:a4];
  [v7 duration];
  objc_msgSend(v8, "setDuration:");
  objc_msgSend(v8, "setTimingFunction:", objc_msgSend(v7, "timingFunction"));
  [v8 setFillMode:*MEMORY[0x263F15AA8]];
  objc_msgSend((id)objc_msgSend(v7, "delegate"), "animationDidStop:finished:", v7, 0);
  return v8;
}

- (UIImage)backgroundImage
{
  return self->mBackgroundImage;
}

- (BOOL)drawsBackground
{
  return self->mDrawsBackground;
}

- (double)shadowOpacity
{
  return self->mShadowOpacity;
}

- (CGSize)shadowOffset
{
  double width = self->mShadowOffset.width;
  double height = self->mShadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)shadowRadius
{
  return self->mShadowRadius;
}

- (double)shadowX
{
  return self->mShadowX;
}

@end