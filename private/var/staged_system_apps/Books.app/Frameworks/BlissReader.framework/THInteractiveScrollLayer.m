@interface THInteractiveScrollLayer
- (BOOL)canScroll;
- (BOOL)showFadeImages;
- (CALayer)contentLayer;
- (CGSize)contentSize;
- (THInteractiveScrollLayer)init;
- (TSUImage)bottomFadeImage;
- (TSUImage)topFadeImage;
- (double)bottomContentPadding;
- (double)topContentPadding;
- (id)swapIntoView:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setBottomContentPadding:(double)a3;
- (void)setBottomFadeImage:(id)a3;
- (void)setContentLayer:(id)a3;
- (void)setShowFadeImages:(BOOL)a3;
- (void)setTopContentPadding:(double)a3;
- (void)setTopFadeImage:(id)a3;
- (void)swapOutOfView:(id)a3;
@end

@implementation THInteractiveScrollLayer

- (THInteractiveScrollLayer)init
{
  v4.receiver = self;
  v4.super_class = (Class)THInteractiveScrollLayer;
  v2 = [(THInteractiveScrollLayer *)&v4 init];
  if (v2)
  {
    v2->_scrollLayer = (CAScrollLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionScrollLayer);
    v2->_topFadeLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v2->_bottomFadeLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [(THInteractiveScrollLayer *)v2 addSublayer:v2->_scrollLayer];
    [(THInteractiveScrollLayer *)v2 addSublayer:v2->_topFadeLayer];
    [(THInteractiveScrollLayer *)v2 addSublayer:v2->_bottomFadeLayer];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THInteractiveScrollLayer;
  [(THInteractiveScrollLayer *)&v3 dealloc];
}

- (void)setContentLayer:(id)a3
{
  contentLayer = self->_contentLayer;
  if (contentLayer != a3)
  {
    [(CALayer *)contentLayer removeFromSuperlayer];

    self->_contentLayer = (CALayer *)a3;
    -[CAScrollLayer setContentOffset:](self->_scrollLayer, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    scrollLayer = self->_scrollLayer;
    v7 = self->_contentLayer;
    [(CAScrollLayer *)scrollLayer addSublayer:v7];
  }
}

- (void)setTopFadeImage:(id)a3
{
  topFadeImage = self->_topFadeImage;
  if (topFadeImage != a3)
  {

    self->_topFadeImage = (TSUImage *)a3;
    [(THInteractiveScrollLayer *)self setNeedsLayout];
  }
}

- (void)setBottomFadeImage:(id)a3
{
  bottomFadeImage = self->_bottomFadeImage;
  if (bottomFadeImage != a3)
  {

    self->_bottomFadeImage = (TSUImage *)a3;
    [(THInteractiveScrollLayer *)self setNeedsLayout];
  }
}

- (void)setShowFadeImages:(BOOL)a3
{
  if (self->_showFadeImages != a3)
  {
    self->_showFadeImages = a3;
    [(THInteractiveScrollLayer *)self setNeedsLayout];
  }
}

- (void)setTopContentPadding:(double)a3
{
  if (self->_topContentPadding != a3)
  {
    self->_topContentPadding = a3;
    [(THInteractiveScrollLayer *)self setNeedsLayout];
  }
}

- (void)setBottomContentPadding:(double)a3
{
  if (self->_bottomContentPadding != a3)
  {
    self->_bottomContentPadding = a3;
    [(THInteractiveScrollLayer *)self setNeedsLayout];
  }
}

- (BOOL)canScroll
{
  [(THInteractiveScrollLayer *)self layoutIfNeeded];
  [(THInteractiveScrollLayer *)self contentSize];
  double v4 = v3;
  [(CAScrollLayer *)self->_scrollLayer bounds];
  if (v4 > CGRectGetWidth(v8)) {
    return 1;
  }
  [(THInteractiveScrollLayer *)self contentSize];
  double v7 = v6;
  [(CAScrollLayer *)self->_scrollLayer bounds];
  return v7 > CGRectGetHeight(v9);
}

- (void)setBackgroundColor:(CGColor *)a3
{
}

- (void)layoutSublayers
{
  v10.receiver = self;
  v10.super_class = (Class)THInteractiveScrollLayer;
  [(THInteractiveScrollLayer *)&v10 layoutSublayers];
  [(THInteractiveScrollLayer *)self bounds];
  -[CAScrollLayer setFrame:](self->_scrollLayer, "setFrame:");
  [(CALayer *)self->_contentLayer bounds];
  TSDRectWithOriginAndSize();
  -[CALayer setFrame:](self->_contentLayer, "setFrame:");
  [(CALayer *)self->_topFadeLayer setContents:[(TSUImage *)self->_topFadeImage CGImage]];
  [(THInteractiveScrollLayer *)self bounds];
  double Width = CGRectGetWidth(v11);
  [(TSUImage *)self->_topFadeImage size];
  -[CALayer setFrame:](self->_topFadeLayer, "setFrame:", 0.0, 0.0, Width, v4);
  [(CALayer *)self->_topFadeLayer setHidden:!self->_showFadeImages];
  [(CALayer *)self->_bottomFadeLayer setContents:[(TSUImage *)self->_bottomFadeImage CGImage]];
  [(THInteractiveScrollLayer *)self bounds];
  double MaxY = CGRectGetMaxY(v12);
  [(TSUImage *)self->_bottomFadeImage size];
  double v7 = MaxY - v6;
  [(THInteractiveScrollLayer *)self bounds];
  double v8 = CGRectGetWidth(v13);
  [(TSUImage *)self->_bottomFadeImage size];
  -[CALayer setFrame:](self->_bottomFadeLayer, "setFrame:", 0.0, v7, v8, v9);
  [(CALayer *)self->_bottomFadeLayer setHidden:!self->_showFadeImages];
}

- (id)swapIntoView:(id)a3
{
  if ([(THInteractiveScrollLayer *)self needsLayout]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveScrollLayer swapIntoView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveScrollLayer.m") lineNumber:281 description:@"layer must be laid out before swapping into a view"];
  }
  id v5 = objc_alloc((Class)UIView);
  [(THInteractiveScrollLayer *)self frame];
  id v6 = [v5 initWithFrame:];
  id v7 = objc_alloc((Class)UIScrollView);
  [(CAScrollLayer *)self->_scrollLayer frame];
  id v8 = [v7 initWithFrame:];
  [(THInteractiveScrollLayer *)self contentSize];
  [v8 setContentSize:];
  [(TSUImage *)self->_topFadeImage size];
  double v10 = v9;
  [(TSUImage *)self->_bottomFadeImage size];
  [v8 setScrollIndicatorInsets:v10, 0.0, v11, 0.0];
  objc_msgSend(objc_msgSend(v8, "layer"), "setBackgroundColor:", -[CAScrollLayer backgroundColor](self->_scrollLayer, "backgroundColor"));
  [v6 addSubview:v8];
  id v12 = objc_alloc((Class)UIView);
  [(CALayer *)self->_contentLayer bounds];
  id v13 = [v12 initWithFrame:];
  objc_msgSend(objc_msgSend(v13, "layer"), "setSublayers:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->_contentLayer));
  [v8 addSubview:v13];
  if (self->_showFadeImages)
  {
    id v14 = objc_alloc((Class)UIImageView);
    [(CALayer *)self->_topFadeLayer frame];
    id v15 = [v14 initWithFrame:];
    [v15 setImage:[self->_topFadeImage UIImage]];
    [v6 addSubview:v15];
    id v16 = objc_alloc((Class)UIImageView);
    [(CALayer *)self->_bottomFadeLayer frame];
    id v17 = [v16 initWithFrame:];
    [v17 setImage:[self->_bottomFadeImage UIImage]];
    [v6 addSubview:v17];
  }
  [(CAScrollLayer *)self->_scrollLayer contentOffset];
  [v8 setContentOffset:];
  objc_setAssociatedObject(v6, &off_45B0B0, v8, (char *)&dword_0 + 1);

  if (a3)
  {
    v18 = (void (**)(id, id))[a3 objectForKey:@"scrollViewBlock"];
    if (v18) {
      v18[2](v18, v8);
    }
  }

  return v6;
}

- (void)swapOutOfView:(id)a3
{
  [(CAScrollLayer *)self->_scrollLayer addSublayer:self->_contentLayer];
  objc_opt_class();
  objc_getAssociatedObject(a3, &off_45B0B0);
  id v5 = (void *)TSUDynamicCast();
  if (!v5) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveScrollLayer swapOutOfView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveScrollLayer.m") lineNumber:341 description:@"invalid nil value for '%s'", "scrollView"];
  }
  [v5 contentOffset];
  -[CAScrollLayer setContentOffset:](self->_scrollLayer, "setContentOffset:");
  [(THInteractiveScrollLayer *)self contentSize];
  double v7 = v6;
  [(CAScrollLayer *)self->_scrollLayer bounds];
  double v9 = v8;
  [(CAScrollLayer *)self->_scrollLayer contentOffset];
  double v11 = v10;
  scrollLayer = self->_scrollLayer;
  [(CAScrollLayer *)scrollLayer contentOffset];
  if (v11 >= 0.0)
  {
    if (v13 <= v7 - v9) {
      return;
    }
    scrollLayer = self->_scrollLayer;
    [(CAScrollLayer *)scrollLayer contentOffset];
  }

  -[CAScrollLayer setContentOffset:animated:](scrollLayer, "setContentOffset:animated:", 1);
}

- (CGSize)contentSize
{
  [(CALayer *)self->_contentLayer bounds];
  double v4 = v3;
  double v6 = v5 + self->_topContentPadding + self->_bottomContentPadding;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (TSUImage)topFadeImage
{
  return self->_topFadeImage;
}

- (TSUImage)bottomFadeImage
{
  return self->_bottomFadeImage;
}

- (BOOL)showFadeImages
{
  return self->_showFadeImages;
}

- (double)topContentPadding
{
  return self->_topContentPadding;
}

- (double)bottomContentPadding
{
  return self->_bottomContentPadding;
}

@end