@interface THHighlightContentLayer
+ (id)layer;
- (CGColor)highlightColor;
- (int)blendMode;
- (int64_t)pageTheme;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)setBlendMode:(int)a3;
- (void)setHighlightColor:(CGColor *)a3;
@end

@implementation THHighlightContentLayer

+ (id)layer
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THHighlightContentLayer;
  [super layer];
  [v2 setBlendMode:0];
  return v2;
}

- (void)dealloc
{
  CGColorRelease(self->_highlightColor);
  v3.receiver = self;
  v3.super_class = (Class)THHighlightContentLayer;
  [(THHighlightContentLayer *)&v3 dealloc];
}

- (void)setHighlightColor:(CGColor *)a3
{
  highlightColor = self->_highlightColor;
  if (highlightColor != a3)
  {
    CGColorRelease(highlightColor);
    self->_highlightColor = CGColorRetain(a3);
  }
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  CGContextSetFillColorWithColor(a3, (CGColorRef)[(THHighlightContentLayer *)self backgroundColor]);
  [(THHighlightContentLayer *)self bounds];
  CGContextFillRect(a3, v6);
  CGContextSetBlendMode(a3, (CGBlendMode)self->_blendMode);
  CGContextSetFillColorWithColor(a3, [(THHighlightContentLayer *)self highlightColor]);
  [(THHighlightContentLayer *)self bounds];
  CGContextFillRect(a3, v7);

  CGContextRestoreGState(a3);
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (CGColor)highlightColor
{
  return self->_highlightColor;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

@end