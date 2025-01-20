@interface AEInlineAnnotationMarker
- (AEInlineAnnotationMarker)initWithAnnotationStyle:(int)a3 pageTheme:(int64_t)a4 contentScale:(double)a5;
- (CGSize)markerSize;
- (double)contentScale;
- (int)style;
- (int64_t)pageTheme;
- (void)renderIn:(CGContext *)a3;
- (void)setContentScale:(double)a3;
- (void)setMarkerSize:(CGSize)a3;
- (void)setPageTheme:(int64_t)a3;
- (void)setStyle:(int)a3;
@end

@implementation AEInlineAnnotationMarker

- (AEInlineAnnotationMarker)initWithAnnotationStyle:(int)a3 pageTheme:(int64_t)a4 contentScale:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AEInlineAnnotationMarker;
  result = [(AEInlineAnnotationMarker *)&v9 init];
  if (result)
  {
    result->_style = a3;
    result->_markerSize = (CGSize)vdupq_n_s64(0x4040000000000000uLL);
    result->_pageTheme = a4;
    result->_contentScale = a5;
  }
  return result;
}

- (void)renderIn:(CGContext *)a3
{
  id v22 = (id)objc_opt_new();
  unint64_t pageTheme = self->_pageTheme;
  v6 = +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:");
  if (v6)
  {
    uint64_t v7 = (pageTheme < 0xB) & (0x7E3u >> pageTheme);
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [v22 setBounds:0.0, 0.0, self->_markerSize.width, self->_markerSize.height];
    Mutable = CGPathCreateMutable();
    CGRectMakeWithSize();
    CGRect v25 = CGRectInset(v24, 5.0, 5.0);
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    CGFloat width = v25.size.width;
    CGFloat height = v25.size.height;
    CGPathAddEllipseInRect(Mutable, 0, v25);
    [v22 setPath:Mutable];
    [v22 setShadowPath:Mutable];
    [v22 setShadowOffset:0.0, self->_contentScale * 0.5];
    LODWORD(v13) = 1041865114;
    [v22 setShadowOpacity:v13];
    [v22 setShadowRadius:self->_contentScale * 1.5];
    CGPathRelease(Mutable);
    v14 = [v6 noteMarkerFillColor];
    id v15 = [v14 bkaxAdjustedForIncreaseContrastAdjustingDarker:v7];
    [v22 setFillColor:[v15 CGColor]];

    v16 = +[UIColor whiteColor];
    id v17 = [v16 bkaxAdjustedForIncreaseContrastAdjustingDarker:v7];
    id v18 = [v17 CGColor];

    [v22 setStrokeColor:v18];
    [v22 setLineWidth:2.0];
    LODWORD(v19) = 1063675494;
    [v22 setOpacity:v19];
    v20 = objc_opt_new();
    v21 = CGPathCreateMutable();
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRect v27 = CGRectInset(v26, 7.0, 7.0);
    CGPathAddRoundedRect(v21, 0, v27, 1.0, 1.0);
    [v20 setPath:v21];
    CGPathRelease(v21);
    [v22 addSublayer:v20];
    [v20 setFillColor:v18];
    +[CATransaction commit];
  }
  [v22 renderInContext:a3];
}

- (CGSize)markerSize
{
  double width = self->_markerSize.width;
  double height = self->_markerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMarkerSize:(CGSize)a3
{
  self->_markerSize = a3;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_unint64_t pageTheme = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(double)a3
{
  self->_contentScale = a3;
}

@end