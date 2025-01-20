@interface RouteStepCalloutCell
+ (RouteStepCalloutCell)cellWithRoute:(id)a3 stepIndex:(unint64_t)a4 type:(unsigned int)a5;
- (BOOL)rotate;
- (BOOL)shouldRotateWithCallout:(id)a3;
- (CGRect)_frameForType:(unsigned int)a3;
- (CGRect)contentRect;
- (CGRect)frame;
- (GEOComposedRoute)route;
- (GEOComposedRouteStep)routeStep;
- (RouteStepCalloutCell)initWithRoute:(id)a3 stepIndex:(unint64_t)a4 type:(unsigned int)a5;
- (unint64_t)stepIndex;
- (void)drawInRect:(CGRect)a3;
- (void)setRoute:(id)a3;
- (void)setStepIndex:(unint64_t)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation RouteStepCalloutCell

+ (RouteStepCalloutCell)cellWithRoute:(id)a3 stepIndex:(unint64_t)a4 type:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)a1) initWithRoute:v8 stepIndex:a4 type:v5];

  return (RouteStepCalloutCell *)v9;
}

- (RouteStepCalloutCell)initWithRoute:(id)a3 stepIndex:(unint64_t)a4 type:(unsigned int)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RouteStepCalloutCell;
  id v9 = [(RouteStepCalloutCell *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(RouteStepCalloutCell *)v9 setRoute:v8];
    [(RouteStepCalloutCell *)v10 setStepIndex:a4];
    v11 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.396078431 green:0.62745098 blue:0.992156863 alpha:1.0];
    calloutTextColor = v10->_calloutTextColor;
    v10->_calloutTextColor = v11;

    v10->_calloutType = a5;
    v10->_numberOfAttemptedRotations = 0;
  }

  return v10;
}

- (GEOComposedRouteStep)routeStep
{
  v3 = [(GEOComposedRoute *)self->_route steps];
  v4 = [v3 objectAtIndexedSubscript:self->_stepIndex];

  return (GEOComposedRouteStep *)v4;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->a;
  long long v5 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_t.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_t.tx = v5;
  *(_OWORD *)&self->_t.a = v4;
  [(RouteStepCalloutCell *)self _frameForType:self->_calloutType];
  self->_frame.origin.x = v6;
  self->_frame.origin.y = v7;
  self->_frame.size.width = v8;
  self->_frame.size.height = v9;
}

- (CGRect)_frameForType:(unsigned int)a3
{
  long long v4 = [(RouteStepCalloutCell *)self routeStep];
  [v4 startCoordinate];
  MKMapPoint v5 = MKMapPointForCoordinate(v23);

  float x = v5.x;
  double v7 = x;
  float y = v5.y;
  double v9 = self->_t.c * y + self->_t.a * v7;
  double v10 = self->_t.d * y + self->_t.b * v7;
  unsigned int calloutType = self->_calloutType;
  if (calloutType - 4 < 2)
  {
    double v13 = 18.0;
    double v12 = 9.0;
  }
  else if (calloutType != 2 && calloutType)
  {
    double v13 = 29.5;
    double v12 = 34.0;
  }
  else
  {
    double v12 = 29.0;
    double v13 = 34.0;
  }
  double v14 = self->_t.tx + v9;
  double v15 = self->_t.ty + v10;
  switch(calloutType)
  {
    case 0u:
      double v14 = v14 - v12 * 0.5;
      double v15 = v15 - v13 + 4.0;
      double v17 = v15 + 0.5;
      goto LABEL_12;
    case 1u:
      double v14 = v14 + -4.0;
      double v15 = v15 + v13 * -0.5;
      double v16 = v14 + 5.5 + -0.5;
      goto LABEL_15;
    case 2u:
      double v14 = v14 + v12 * -0.5;
      double v15 = v15 + -4.0;
      double v17 = v15 + 5.5 + -1.0;
LABEL_12:
      double v16 = v14;
      goto LABEL_16;
    case 3u:
      double v14 = v14 - v12 + 4.0;
      double v15 = v15 + v13 * -0.5 + -0.5;
      goto LABEL_14;
    case 4u:
    case 5u:
      double v14 = v14 + v12 * -0.5;
      double v15 = v15 - v13;
      double v16 = v14 + -9.5;
      double v17 = v15 + -9.5;
      goto LABEL_16;
    default:
LABEL_14:
      double v16 = v14;
LABEL_15:
      double v17 = v15;
LABEL_16:
      self->_frame.origin.float x = v14;
      self->_frame.origin.float y = v15;
      self->_frame.size.width = v12;
      self->_frame.size.height = v13;
      self->_contentRect.origin.float x = v16 + 9.5;
      self->_contentRect.origin.float y = v17 + 9.5;
      __asm { FMOV            V4.2D, #10.0 }
      self->_contentRect.size = _Q4;
      result.size.height = v13;
      result.size.width = v12;
      result.origin.float y = v15;
      result.origin.float x = v14;
      return result;
  }
}

- (BOOL)shouldRotateWithCallout:(id)a3
{
  [a3 contentRect];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  CGFloat x = self->_contentRect.origin.x;
  CGFloat y = self->_contentRect.origin.y;
  CGFloat width = self->_contentRect.size.width;
  CGFloat height = self->_contentRect.size.height;

  return CGRectIntersectsRect(*(CGRect *)&x, *(CGRect *)&v5);
}

- (BOOL)rotate
{
  unint64_t numberOfAttemptedRotations = self->_numberOfAttemptedRotations;
  if (numberOfAttemptedRotations == 5) {
    return 0;
  }
  uint64_t calloutType = (int)self->_calloutType;
  if ((calloutType & 0xFFFFFFFE) == 4) {
    return 0;
  }
  self->_unint64_t numberOfAttemptedRotations = numberOfAttemptedRotations + 1;
  if (calloutType > 3) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = dword_100F6FDF0[calloutType];
  }
  self->_uint64_t calloutType = v6;
  -[RouteStepCalloutCell _frameForType:](self, "_frameForType:");
  self->_frame.origin.CGFloat x = v7;
  self->_frame.origin.CGFloat y = v8;
  self->_frame.size.CGFloat width = v9;
  self->_frame.size.CGFloat height = v10;
  return 1;
}

- (void)drawInRect:(CGRect)a3
{
  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", self->_calloutType, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  if ((self->_calloutType & 0xFFFFFFFE) != 4)
  {
    [(UIColor *)self->_calloutTextColor set];
    uint64_t v4 = +[NSNumber numberWithUnsignedInteger:self->_stepIndex];
    id v13 = +[NSNumberFormatter localizedStringFromNumber:v4 numberStyle:0];

    double MidX = CGRectGetMidX(self->_contentRect);
    double MidY = CGRectGetMidY(self->_contentRect);
    CGFloat v7 = +[UIFont boldSystemFontOfSize:10.0];
    [v13 _maps_sizeWithFont:v7];
    double v9 = v8;
    double v11 = v10;

    double v12 = +[UIFont boldSystemFontOfSize:10.0];
    [v13 _maps_drawAtPoint:v12 withFont:MidX - v9 * 0.5, MidY - v11 * 0.5];
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndeCGFloat x = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutTextColor, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end