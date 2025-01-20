@interface THWLabelLayer
- (CALayer)renderLayer;
- (CGRect)p_erasableBounds;
- (CGRect)p_flippedImageBounds;
- (NSString)fontName;
- (NSString)string;
- (THWLabelLayer)init;
- (TSDShadow)shadow;
- (TSUColor)textColor;
- (__CTLine)line;
- (double)fontSize;
- (double)p_xOffsetForHorizontalAlignment:(int)a3;
- (double)p_yOffsetForVerticalAlignment:(int)a3;
- (double)shadowScale;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (int)horizontalAlignment;
- (int)verticalAlignment;
- (int)verticalAlignmentRule;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayers;
- (void)p_invalidateText;
- (void)setContentsScale:(double)a3;
- (void)setFontName:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setHorizontalAlignment:(int)a3;
- (void)setLine:(__CTLine *)a3;
- (void)setRenderLayer:(id)a3;
- (void)setShadow:(id)a3;
- (void)setShadowScale:(double)a3;
- (void)setString:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setVerticalAlignment:(int)a3;
- (void)setVerticalAlignmentRule:(int)a3;
@end

@implementation THWLabelLayer

- (THWLabelLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)THWLabelLayer;
  v2 = [(THWLabelLayer *)&v5 init];
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    v2->_renderLayer = v3;
    [(CALayer *)v3 setDelegate:v2];
    [(THWLabelLayer *)v2 addSublayer:v2->_renderLayer];
  }
  return v2;
}

- (void)dealloc
{
  line = self->_line;
  if (line) {
    CFRelease(line);
  }
  v4.receiver = self;
  v4.super_class = (Class)THWLabelLayer;
  [(THWLabelLayer *)&v4 dealloc];
}

- (void)setString:(id)a3
{
  if (self->_string != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_string = (NSString *)[a3 copy];
    [(THWLabelLayer *)self p_invalidateText];
  }
}

- (void)setFontName:(id)a3
{
  if (self->_fontName != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_fontName = (NSString *)[a3 copy];
    [(THWLabelLayer *)self p_invalidateText];
  }
}

- (void)setFontSize:(double)a3
{
  if (self->_fontSize != a3)
  {
    self->_fontSize = a3;
    [(THWLabelLayer *)self p_invalidateText];
  }
}

- (void)setTextColor:(id)a3
{
  if (self->_textColor != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    self->_textColor = (TSUColor *)a3;
    [(THWLabelLayer *)self p_invalidateText];
  }
}

- (void)setHorizontalAlignment:(int)a3
{
  if (self->_horizontalAlignment != a3)
  {
    self->_horizontalAlignment = a3;
    [(THWLabelLayer *)self p_invalidatePosition];
  }
}

- (void)setVerticalAlignment:(int)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    [(THWLabelLayer *)self p_invalidatePosition];
  }
}

- (void)setVerticalAlignmentRule:(int)a3
{
  if (self->_verticalAlignmentRule != a3)
  {
    self->_verticalAlignmentRule = a3;
    [(THWLabelLayer *)self p_invalidatePosition];
  }
}

- (void)setShadow:(id)a3
{
  if (self->_shadow != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    self->_shadow = (TSDShadow *)[a3 copy];
    [(THWLabelLayer *)self p_invalidateText];
  }
}

- (void)setShadowScale:(double)a3
{
  if (vabdd_f64(a3, self->_shadowScale) >= 0.00999999978)
  {
    self->_shadowScale = a3;
    [(THWLabelLayer *)self p_invalidateText];
  }
}

- (void)layoutSublayers
{
  v15.receiver = self;
  v15.super_class = (Class)THWLabelLayer;
  [(THWLabelLayer *)&v15 layoutSublayers];
  if (!self->_line)
  {
    if (self->_string)
    {
      CTFontRef v3 = CTFontCreateWithName((CFStringRef)self->_fontName, self->_fontSize, 0);
      if (v3)
      {
        CTFontRef v4 = v3;
        id v5 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v3, kCTFontAttributeName, [self->_textColor CGColor], kCTForegroundColorAttributeName, 0];
        CFAttributedStringRef v6 = (const __CFAttributedString *)[objc_alloc((Class)NSAttributedString) initWithString:self->_string attributes:v5];
        self->_line = CTLineCreateWithAttributedString(v6);

        CFRelease(v4);
      }
    }
    [(THWLabelLayer *)self p_erasableBounds];
    -[CALayer setBounds:](self->_renderLayer, "setBounds:");
    -[CALayer setAnchorPoint:](self->_renderLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    [(CALayer *)self->_renderLayer bounds];
    double v8 = v7;
    [(CALayer *)self->_renderLayer bounds];
    [(CALayer *)self->_renderLayer setPosition:v8];
    [(CALayer *)self->_renderLayer setNeedsDisplay];
  }
  [(THWLabelLayer *)self p_xOffsetForHorizontalAlignment:self->_horizontalAlignment];
  [(THWLabelLayer *)self p_yOffsetForVerticalAlignment:self->_verticalAlignment];
  TSURound();
  CGFloat v10 = v9;
  TSURound();
  CATransform3DMakeTranslation(&v14, v10, v11, 0.0);
  renderLayer = self->_renderLayer;
  CATransform3D v13 = v14;
  [(CALayer *)renderLayer setTransform:&v13];
}

- (void)drawInContext:(CGContext *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  CTFontRef v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLabelLayer drawInContext:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLabelLayer.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:204 description:@"all rendering should happen in the render layer"];
}

- (void)setContentsScale:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWLabelLayer;
  -[THWLabelLayer setContentsScale:](&v6, "setContentsScale:");
  [(CALayer *)self->_renderLayer contentsScale];
  if (v5 != a3)
  {
    [(CALayer *)self->_renderLayer setContentsScale:a3];
    [(CALayer *)self->_renderLayer setNeedsDisplay];
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_renderLayer != a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLabelLayer drawLayer:inContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLabelLayer.m") lineNumber:221 description:@"unknown layer"];
  }
  [a3 contentsScale];
  TSDSetCGContextInfo();
  CGAffineTransformMakeScale(&v7, 1.0, -1.0);
  CGContextSetTextMatrix(a4, &v7);
  [(TSDShadow *)self->_shadow applyToContext:a4 viewScale:1 flipped:self->_shadowScale];
  CGContextSetTextPosition(a4, 0.0, 0.0);
  CGContextSetShouldSmoothFonts(a4, 0);
  CGContextSetShouldAntialias(a4, 1);
  CTLineDraw(self->_line, a4);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  if (self->_renderLayer != a3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWLabelLayer actionForLayer:forKey:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWLabelLayer.m") lineNumber:244 description:@"unknown layer"];
  }

  return +[NSNull null];
}

- (void)p_invalidateText
{
  line = self->_line;
  if (line)
  {
    CFRelease(line);
    self->_line = 0;
  }

  [(THWLabelLayer *)self setNeedsLayout];
}

- (CGRect)p_flippedImageBounds
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if (self->_line)
  {
    if (qword_573310 != -1) {
      dispatch_once(&qword_573310, &stru_45A5F8);
    }
    CGRect ImageBounds = CTLineGetImageBounds(self->_line, (CGContextRef)qword_573308);
    CGFloat v7 = ImageBounds.origin.x;
    CGFloat v8 = ImageBounds.origin.y;
    CGFloat v9 = ImageBounds.size.width;
    CGFloat v10 = ImageBounds.size.height;
    if (!CGRectIsNull(ImageBounds))
    {
      CGAffineTransformMakeScale(&v15, 1.0, -1.0);
      v17.origin.CGFloat x = v7;
      v17.origin.CGFloat y = v8;
      v17.size.CGFloat width = v9;
      v17.size.CGFloat height = v10;
      CGRect v18 = CGRectApplyAffineTransform(v17, &v15);
      CGRect v19 = CGRectIntegral(v18);
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
    }
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)p_erasableBounds
{
  [(THWLabelLayer *)self p_flippedImageBounds];
  shadow = self->_shadow;
  if (shadow) {
    -[TSDShadow shadowBoundsForRect:](shadow, "shadowBoundsForRect:");
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (double)p_xOffsetForHorizontalAlignment:(int)a3
{
  double v3 = 0.0;
  if (a3 == 1) {
    double v3 = 0.5;
  }
  if (a3 == 2) {
    double v4 = 1.0;
  }
  else {
    double v4 = v3;
  }
  line = self->_line;
  [(THWLabelLayer *)self bounds];

  return CTLineGetPenOffsetForFlush(line, v4, v6);
}

- (double)p_yOffsetForVerticalAlignment:(int)a3
{
  double v16 = 0.0;
  CGFloat ascent = 0.0;
  double TypographicBounds = CTLineGetTypographicBounds(self->_line, &ascent, &v16, 0);
  if (a3 == 2)
  {
    int verticalAlignmentRule = self->_verticalAlignmentRule;
    [(THWLabelLayer *)self bounds];
    double result = v9;
    if (!verticalAlignmentRule) {
      return v9 - v16;
    }
  }
  else
  {
    double v6 = ascent;
    if (a3 == 1)
    {
      double v10 = v16;
      int v11 = self->_verticalAlignmentRule;
      [(THWLabelLayer *)self bounds];
      double v13 = v12 * 0.5;
      if (v11)
      {
        double v14 = ascent;
        double v15 = v13 + ascent * -0.5;
      }
      else
      {
        double v15 = v13 + (v6 + v10) * -0.5;
        double v14 = ascent;
      }
      return v14 + v15;
    }
    else
    {
      double result = 0.0;
      if (!a3) {
        return ascent;
      }
    }
  }
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (TSUColor)textColor
{
  return self->_textColor;
}

- (int)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (int)verticalAlignment
{
  return self->_verticalAlignment;
}

- (int)verticalAlignmentRule
{
  return self->_verticalAlignmentRule;
}

- (TSDShadow)shadow
{
  return self->_shadow;
}

- (double)shadowScale
{
  return self->_shadowScale;
}

- (CALayer)renderLayer
{
  return self->_renderLayer;
}

- (void)setRenderLayer:(id)a3
{
}

- (__CTLine)line
{
  return self->_line;
}

- (void)setLine:(__CTLine *)a3
{
  self->_line = a3;
}

@end