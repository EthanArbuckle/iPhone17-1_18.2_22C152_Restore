@interface AEAnnotationMarker
+ (CGSize)fillSizeForScale:(double)a3;
+ (CGSize)imageSizeForScale:(double)a3;
+ (double)borderWidthForScale:(double)a3;
- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4;
- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4 cornerRadius:(double)a5;
- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4 cornerRadius:(double)a5 hasBorder:(BOOL)a6;
- (BOOL)p_hasBorder;
- (BOOL)strikethrough;
- (CALayer)layer;
- (CAShapeLayer)strikethroughLayer;
- (CGSize)imageSize;
- (CGSize)p_fillSize;
- (NSNumber)overrideHasBorder;
- (UIEdgeInsets)edgeInsets;
- (double)contentScale;
- (double)p_borderWidth;
- (double)viewScale;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)p_markerColor:(id)a3 withEffect:(int)a4;
- (int)effect;
- (int)style;
- (int64_t)pageTheme;
- (void)dealloc;
- (void)p_updateLayerColors;
- (void)p_updateLayerDimensions;
- (void)setContentScale:(double)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setEffect:(int)a3;
- (void)setOverrideHasBorder:(id)a3;
- (void)setPageTheme:(int64_t)a3;
- (void)setStrikethrough:(BOOL)a3;
- (void)setStyle:(int)a3;
- (void)setViewScale:(double)a3;
@end

@implementation AEAnnotationMarker

- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4
{
  return [(AEAnnotationMarker *)self initWithAnnotationStyle:*(void *)&a3 contentScale:a4 cornerRadius:0.0];
}

- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4 cornerRadius:(double)a5 hasBorder:(BOOL)a6
{
  BOOL v6 = a6;
  v7 = [(AEAnnotationMarker *)self initWithAnnotationStyle:*(void *)&a3 contentScale:a4 cornerRadius:a5];
  if (v7)
  {
    uint64_t v8 = +[NSNumber numberWithBool:v6];
    overrideHasBorder = v7->_overrideHasBorder;
    v7->_overrideHasBorder = (NSNumber *)v8;
  }
  return v7;
}

- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4 cornerRadius:(double)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AEAnnotationMarker;
  uint64_t v8 = [(AEAnnotationMarker *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_contentScale = a4;
    v8->_viewScale = 1.0;
    v8->_pageTheme = 4;
    v8->_effect = 0;
    v8->_style = a3;
    v8->_strikethrough = 0;
    v10 = objc_alloc_init(AEAnnotationMarkerLayer);
    layer = v9->_layer;
    v9->_layer = &v10->super;

    [(CALayer *)v9->_layer setDelegate:v9];
    if (a5 > 0.0)
    {
      [(CALayer *)v9->_layer setCornerRadius:a5];
      [(CALayer *)v9->_layer setCornerCurve:kCACornerCurveContinuous];
    }
    [(AEAnnotationMarker *)v9 p_updateLayerDimensions];
    [(AEAnnotationMarker *)v9 p_updateLayerColors];
  }
  return v9;
}

- (void)dealloc
{
  [(CALayer *)self->_layer setDelegate:0];
  [(CAShapeLayer *)self->_strikethroughLayer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationMarker;
  [(AEAnnotationMarker *)&v3 dealloc];
}

+ (CGSize)fillSizeForScale:(double)a3
{
  double v3 = 21.0;
  double v4 = 21.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)p_fillSize
{
  +[AEAnnotationMarker fillSizeForScale:self->_contentScale];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)imageSizeForScale:(double)a3
{
  [a1 borderWidthForScale:];
  double v6 = v5 + v5;
  [a1 fillSizeForScale:a3];
  double v8 = v6 + v7;
  double v10 = v6 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGSize)imageSize
{
  +[AEAnnotationMarker imageSizeForScale:self->_contentScale];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setStyle:(int)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(AEAnnotationMarker *)self p_updateLayerColors];
  }
}

- (void)setPageTheme:(int64_t)a3
{
  if (self->_pageTheme != a3)
  {
    self->_pageTheme = a3;
    [(AEAnnotationMarker *)self p_updateLayerColors];
  }
}

- (void)setStrikethrough:(BOOL)a3
{
  if (self->_strikethrough != a3)
  {
    BOOL v3 = a3;
    self->_strikethrough = a3;
    if (a3)
    {
      if (!self->_strikethroughLayer)
      {
        double v5 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
        strikethroughLayer = self->_strikethroughLayer;
        self->_strikethroughLayer = v5;

        [(CAShapeLayer *)self->_strikethroughLayer setDelegate:self];
        [(CALayer *)self->_layer addSublayer:self->_strikethroughLayer];
      }
      [(AEAnnotationMarker *)self p_updateLayerDimensions];
      [(AEAnnotationMarker *)self p_updateLayerColors];
    }
    double v7 = self->_strikethroughLayer;
    [(CAShapeLayer *)v7 setHidden:!v3];
  }
}

- (void)setEffect:(int)a3
{
  if (self->_effect != a3)
  {
    self->_effect = a3;
    [(AEAnnotationMarker *)self p_updateLayerColors];
  }
}

- (void)setContentScale:(double)a3
{
  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    [(AEAnnotationMarker *)self p_updateLayerDimensions];
  }
}

- (void)setViewScale:(double)a3
{
  if (self->_viewScale != a3)
  {
    self->_viewScale = a3;
    [(AEAnnotationMarker *)self p_updateLayerDimensions];
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

+ (double)borderWidthForScale:(double)a3
{
  if (a3 == 0.0) {
    return 1.0;
  }
  else {
    return 1.0 / a3;
  }
}

- (double)p_borderWidth
{
  +[AEAnnotationMarker borderWidthForScale:self->_contentScale];
  return result;
}

- (BOOL)p_hasBorder
{
  BOOL v3 = [(AEAnnotationMarker *)self overrideHasBorder];

  if (v3)
  {
    double v4 = [(AEAnnotationMarker *)self overrideHasBorder];
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else
  {
    double v4 = +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:");
    unsigned __int8 v5 = [v4 noteMarkerHasBorder];
  }
  BOOL v6 = v5;

  return v6;
}

- (id)p_markerColor:(id)a3 withEffect:(int)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  double v7 = v5;
  if (a4 == 1)
  {
    double v7 = [v5 bc_darkenedColorByFactor:0.2];
  }

  return v7;
}

- (void)p_updateLayerDimensions
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(AEAnnotationMarker *)self imageSize];
  double v4 = v3;
  double v6 = v5;
  [(AEAnnotationMarker *)self p_borderWidth];
  double v8 = v7;
  double viewScale = self->_viewScale;
  if (viewScale > 0.0 && viewScale != 1.0)
  {
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, viewScale, viewScale);
    double v11 = v6 * v19.d + v19.b * v4;
    double v4 = round(v6 * v19.c + v19.a * v4);
    double v6 = round(v11);
  }
  -[CALayer setBounds:](self->_layer, "setBounds:", 0.0, 0.0, v4, v6);
  [(CALayer *)self->_layer setBorderWidth:v8];
  if (self->_strikethrough)
  {
    CGFloat v12 = v4 - (v8 + v8);
    CGFloat v13 = v6 - (v8 + v8);
    Mutable = CGPathCreateMutable();
    v20.origin.x = v8;
    v20.origin.y = v8;
    v20.size.width = v12;
    v20.size.height = v13;
    CGFloat MaxX = CGRectGetMaxX(v20);
    v21.origin.x = v8;
    v21.origin.y = v8;
    v21.size.width = v12;
    v21.size.height = v13;
    CGFloat MinY = CGRectGetMinY(v21);
    CGPathMoveToPoint(Mutable, 0, MaxX, MinY);
    v22.origin.x = v8;
    v22.origin.y = v8;
    v22.size.width = v12;
    v22.size.height = v13;
    CGFloat MinX = CGRectGetMinX(v22);
    v23.origin.x = v8;
    v23.origin.y = v8;
    v23.size.width = v12;
    v23.size.height = v13;
    CGFloat MaxY = CGRectGetMaxY(v23);
    CGPathAddLineToPoint(Mutable, 0, MinX, MaxY);
    [(CAShapeLayer *)self->_strikethroughLayer setPath:Mutable];
    [(CAShapeLayer *)self->_strikethroughLayer setLineWidth:1.0];
    CGPathRelease(Mutable);
  }
  +[CATransaction commit];
}

- (void)p_updateLayerColors
{
  uint64_t v3 = [(AEAnnotationMarker *)self effect];
  double v4 = +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:");
  if (v4)
  {
    id v14 = v4;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    unint64_t pageTheme = self->_pageTheme;
    double v6 = [v14 noteMarkerFillColor];
    double v7 = [v6 bkaxAdjustedForIncreaseContrastAdjustingDarker:pageTheme < 2];
    id v8 = [(AEAnnotationMarker *)self p_markerColor:v7 withEffect:v3];
    -[CALayer setBackgroundColor:](self->_layer, "setBackgroundColor:", [v8 CGColor]);

    if ([(AEAnnotationMarker *)self p_hasBorder])
    {
      id v9 = [v14 noteMarkerBorderColor];
      double v10 = [v9 bkaxAdjustedForIncreaseContrastAdjustingDarker:pageTheme < 2];
      id v11 = [(AEAnnotationMarker *)self p_markerColor:v10 withEffect:v3];
      -[CALayer setBorderColor:](self->_layer, "setBorderColor:", [v11 CGColor]);
    }
    else
    {
      id v9 = +[UIColor clearColor];
      -[CALayer setBorderColor:](self->_layer, "setBorderColor:", [v9 CGColor]);
    }

    [(CALayer *)self->_layer setCornerRadius:4.0];
    [(CALayer *)self->_layer setCornerCurve:kCACornerCurveContinuous];
    if (self->_strikethrough)
    {
      CGFloat v12 = [v14 noteMarkerStrikethroughColor];
      id v13 = [(AEAnnotationMarker *)self p_markerColor:v12 withEffect:v3];
      -[CAShapeLayer setStrokeColor:](self->_strikethroughLayer, "setStrokeColor:", [v13 CGColor]);
    }
    +[CATransaction commit];
    double v4 = v14;
  }
}

- (CALayer)layer
{
  return self->_layer;
}

- (int)effect
{
  return self->_effect;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (int)style
{
  return self->_style;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (BOOL)strikethrough
{
  return self->_strikethrough;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (CAShapeLayer)strikethroughLayer
{
  return self->_strikethroughLayer;
}

- (NSNumber)overrideHasBorder
{
  return self->_overrideHasBorder;
}

- (void)setOverrideHasBorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHasBorder, 0);
  objc_storeStrong((id *)&self->_strikethroughLayer, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end