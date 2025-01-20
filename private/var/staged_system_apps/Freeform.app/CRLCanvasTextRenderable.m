@interface CRLCanvasTextRenderable
+ (id)renderable;
+ (id)renderableFromTextLayer:(id)a3;
- (CGColor)foregroundColor;
- (CRLCanvasTextRenderable)initWithTextLayer:(id)a3;
- (NSString)alignmentMode;
- (NSString)truncationMode;
- (double)fontSize;
- (id)p_textLayer;
- (id)string;
- (void)font;
- (void)setAlignmentMode:(id)a3;
- (void)setFont:(void *)a3;
- (void)setFontSize:(double)a3;
- (void)setForegroundColor:(CGColor *)a3;
- (void)setString:(id)a3;
- (void)setTruncationMode:(id)a3;
@end

@implementation CRLCanvasTextRenderable

- (CRLCanvasTextRenderable)initWithTextLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCanvasTextRenderable;
  return [(CRLCanvasRenderable *)&v4 initWithCALayer:a3];
}

+ (id)renderableFromTextLayer:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithTextLayer:v4];

  return v5;
}

+ (id)renderable
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[CATextLayer layer];
  id v4 = [v2 initWithTextLayer:v3];

  return v4;
}

- (id)p_textLayer
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLCanvasRenderable *)self layer];
  id v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (id)string
{
  id v2 = [(CRLCanvasTextRenderable *)self p_textLayer];
  uint64_t v3 = [v2 string];

  return v3;
}

- (void)setString:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasTextRenderable *)self p_textLayer];
  [v5 setString:v4];
}

- (double)fontSize
{
  id v2 = [(CRLCanvasTextRenderable *)self p_textLayer];
  [v2 fontSize];
  double v4 = v3;

  return v4;
}

- (void)setFontSize:(double)a3
{
  id v4 = [(CRLCanvasTextRenderable *)self p_textLayer];
  [v4 setFontSize:a3];
}

- (NSString)truncationMode
{
  id v2 = [(CRLCanvasTextRenderable *)self p_textLayer];
  double v3 = [v2 truncationMode];

  return (NSString *)v3;
}

- (void)setTruncationMode:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasTextRenderable *)self p_textLayer];
  [v5 setTruncationMode:v4];
}

- (void)setFont:(void *)a3
{
  id v4 = [(CRLCanvasTextRenderable *)self p_textLayer];
  [v4 setFont:a3];
}

- (void)font
{
  id v2 = [(CRLCanvasTextRenderable *)self p_textLayer];
  id v3 = [v2 font];

  return v3;
}

- (void)setForegroundColor:(CGColor *)a3
{
  id v4 = [(CRLCanvasTextRenderable *)self p_textLayer];
  [v4 setForegroundColor:a3];
}

- (CGColor)foregroundColor
{
  id v2 = [(CRLCanvasTextRenderable *)self p_textLayer];
  id v3 = (CGColor *)[v2 foregroundColor];

  return v3;
}

- (NSString)alignmentMode
{
  id v2 = [(CRLCanvasTextRenderable *)self p_textLayer];
  id v3 = [v2 alignmentMode];

  return (NSString *)v3;
}

- (void)setAlignmentMode:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLCanvasTextRenderable *)self p_textLayer];
  [v5 setAlignmentMode:v4];
}

@end