@interface _TUIGradientStyler
- (BOOL)isEqualToStyle:(id)a3;
- (CAFilter)compositingFilter;
- (CGImage)maskImageWithStartPoint:(double)a3 endPoint:(double)a4 offset:(double)a5 startColor:(id)a6 endColor:(id)a7 direction:(unint64_t)a8 containerBounds:(CGRect)a9;
- (NSString)blendMode;
- (_TUIGradientStyler)initWithLayout:(id)a3;
- (void)applyStylingToLayer:(id)a3;
- (void)applyStylingToView:(id)a3;
@end

@implementation _TUIGradientStyler

- (_TUIGradientStyler)initWithLayout:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_TUIGradientStyler;
  v5 = [(_TUIGradientStyler *)&v34 init];
  if (v5)
  {
    v6 = [v4 box];
    uint64_t v7 = [v6 gradientStartColor];
    startColor = v5->_startColor;
    v5->_startColor = (UIColor *)v7;

    v9 = [v4 box];
    uint64_t v10 = [v9 gradientEndColor];
    endColor = v5->_endColor;
    v5->_endColor = (UIColor *)v10;

    v12 = [v4 box];
    [v12 gradientStartPosition];
    v5->_startPosition = v13;

    v14 = [v4 box];
    [v14 gradientEndPosition];
    v5->_endPosition = v15;

    v16 = [v4 box];
    v5->_direction = (unint64_t)[v16 gradientDirection];

    uint64_t v17 = objc_opt_class();
    v18 = [v4 layoutAncestor];
    v19 = [v18 box];
    v20 = TUIDynamicCast(v17, v19);
    [v20 cornerRadius];
    v5->_cornerRadius = v21;

    v22 = [v4 box];
    v5->_continuousCorners = [v22 continuousCorners];

    v23 = [v4 box];
    v24 = [v23 blendMode];
    v25 = (NSString *)[v24 copy];
    blendMode = v5->_blendMode;
    v5->_blendMode = v25;

    v27 = [v4 box];
    [v27 gradientBlurRadius];
    v5->_blurRadius = v28;

    v29 = [v4 box];
    [v29 gradientBlurOffset];
    v5->_blurOffset = v30;

    v31 = [v4 box];
    [v31 opacity];
    v5->_opacity = v32;
  }
  return v5;
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  TUIDynamicCast(v5, v4);
  v6 = (_TUIGradientStyler *)objc_claimAutoreleasedReturnValue();

  if (v6 == self) {
    char v10 = 1;
  }
  else {
    char v10 = v6
  }
       && self->_startPosition == v6->_startPosition
       && self->_endPosition == v6->_endPosition
       && self->_direction == v6->_direction
       && self->_cornerRadius == v6->_cornerRadius
       && self->_continuousCorners == v6->_continuousCorners
       && ((startColor = self->_startColor, startColor == v6->_startColor)
        || -[UIColor isEqual:](startColor, "isEqual:"))
       && ((endColor = self->_endColor, endColor == v6->_endColor)
        || -[UIColor isEqual:](endColor, "isEqual:"))
       && ((blendMode = self->_blendMode, blendMode == v6->_blendMode)
        || -[NSString isEqualToString:](blendMode, "isEqualToString:"))
       && self->_blurRadius == v6->_blurRadius
       && self->_blurOffset == v6->_blurOffset
       && self->_opacity == v6->_opacity;

  return v10;
}

- (void)applyStylingToLayer:(id)a3
{
  id v4 = a3;
  double opacity = self->_opacity;
  *(float *)&double opacity = opacity;
  [v4 setOpacity:opacity];
  uint64_t v6 = kCAFilterVariableBlur;
  if ([(NSString *)self->_blendMode isEqualToString:kCAFilterVariableBlur])
  {
    uint64_t v7 = -[_TUIGradientStyler maskImageWithStartPoint:endPoint:offset:startColor:endColor:direction:containerBounds:](self, "maskImageWithStartPoint:endPoint:offset:startColor:endColor:direction:containerBounds:", self->_startColor, self->_endColor, self->_direction, self->_startPosition, self->_endPosition, self->_blurOffset, 0.0, 0.0, 10.0, 10.0);
    id v8 = +[CAFilter filterWithType:v6];
    [v8 setValue:&__kCFBooleanFalse forKey:@"inputDither"];
    [v8 setValue:v7 forKey:@"inputMaskImage"];
    [v8 setValue:&__kCFBooleanTrue forKey:@"inputNormalizeEdges"];
    v9 = +[NSNumber numberWithDouble:self->_blurRadius];
    [v8 setValue:v9 forKey:@"inputRadius"];

    [v4 setAllowsHitTesting:0];
    id v29 = v8;
    char v10 = +[NSArray arrayWithObjects:&v29 count:1];
    [v4 setFilters:v10];

    [v4 setMasksToBounds:1];
  }
  else
  {
    uint64_t v11 = kCAFilterGaussianBlur;
    if ([(NSString *)self->_blendMode isEqualToString:kCAFilterGaussianBlur])
    {
      id v8 = +[CAFilter filterWithType:v11];
      [v8 setValue:&__kCFBooleanFalse forKey:@"inputDither"];
      [v8 setValue:&__kCFBooleanTrue forKey:@"inputNormalizeEdges"];
      v12 = +[NSNumber numberWithDouble:self->_blurRadius];
      [v8 setValue:v12 forKey:@"inputRadius"];

      double v13 = +[CAGradientLayer layer];
      v28[0] = [(UIColor *)self->_startColor CGColor];
      v28[1] = [(UIColor *)self->_endColor CGColor];
      v14 = +[NSArray arrayWithObjects:v28 count:2];
      [v13 setColors:v14];

      double v15 = +[NSNumber numberWithDouble:self->_startPosition];
      v27[0] = v15;
      v16 = +[NSNumber numberWithDouble:self->_endPosition];
      v27[1] = v16;
      uint64_t v17 = +[NSArray arrayWithObjects:v27 count:2];
      [v13 setLocations:v17];

      [v4 bounds];
      [v13 setFrame:];
      [v4 setAllowsHitTesting:0];
      id v26 = v8;
      v18 = +[NSArray arrayWithObjects:&v26 count:1];
      [v4 setFilters:v18];

      [v4 setMasksToBounds:1];
      [v4 setMask:v13];
    }
    else
    {
      id v8 = v4;
      startColor = self->_startColor;
      if (startColor && self->_endColor)
      {
        v25[0] = [(UIColor *)startColor CGColor];
        v25[1] = [(UIColor *)self->_endColor CGColor];
        v20 = +[NSArray arrayWithObjects:v25 count:2];
        [v8 setColors:v20];
      }
      if (self->_direction == 1)
      {
        double v21 = 0.5;
        [v8 setStartPoint:self->_startPosition, 0.5];
        double endPosition = self->_endPosition;
      }
      else
      {
        double endPosition = 0.5;
        [v8 setStartPoint:0.5, self->_startPosition];
        double v21 = self->_endPosition;
      }
      [v8 setEndPoint:endPosition v21];
      v23 = &kCACornerCurveContinuous;
      if (!self->_continuousCorners) {
        v23 = &kCACornerCurveCircular;
      }
      [v8 setCornerCurve:*v23];
      [v8 setCornerRadius:self->_cornerRadius];
      v24 = [(_TUIGradientStyler *)self compositingFilter];
      [v8 setCompositingFilter:v24];
    }
  }
}

- (void)applyStylingToView:(id)a3
{
  id v4 = [a3 layer];
  [(_TUIGradientStyler *)self applyStylingToLayer:v4];
}

- (CAFilter)compositingFilter
{
  if (self->_blendMode)
  {
    v2 = +[CAFilter filterWithType:](CAFilter, "filterWithType:");
  }
  else
  {
    v2 = 0;
  }

  return (CAFilter *)v2;
}

- (CGImage)maskImageWithStartPoint:(double)a3 endPoint:(double)a4 offset:(double)a5 startColor:(id)a6 endColor:(id)a7 direction:(unint64_t)a8 containerBounds:(CGRect)a9
{
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  id v18 = a6;
  id v19 = a7;
  v20 = +[UIGraphicsImageRendererFormat preferredFormat];
  [v20 setPreferredRange:2];
  id v21 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithBounds:v20 format:x, y, width, height];
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  id v29 = sub_88160;
  double v30 = &unk_254218;
  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  id v31 = v18;
  id v32 = v19;
  double v37 = a5;
  unint64_t v38 = a8;
  double v39 = a3;
  double v40 = a4;
  id v22 = v19;
  id v23 = v18;
  id v24 = [v21 imageWithActions:&v27];
  v25 = [v24 CGImage:v27, v28, v29, v30];

  return v25;
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_endColor, 0);

  objc_storeStrong((id *)&self->_startColor, 0);
}

@end