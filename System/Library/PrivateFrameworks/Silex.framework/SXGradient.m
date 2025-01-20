@interface SXGradient
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (SXGradient)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 colors:(id)a5 locations:(id)a6;
@end

@implementation SXGradient

- (SXGradient)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 colors:(id)a5 locations:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v9 = a3.y;
  CGFloat v10 = a3.x;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SXGradient;
  v14 = [(SXGradient *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_startPoint.CGFloat x = v10;
    v14->_startPoint.CGFloat y = v9;
    v14->_endPoint.CGFloat x = x;
    v14->_endPoint.CGFloat y = y;
    uint64_t v16 = [v12 copy];
    colors = v15->_colors;
    v15->_colors = (NSArray *)v16;

    uint64_t v18 = [v13 copy];
    locations = v15->_locations;
    v15->_locations = (NSArray *)v18;
  }
  return v15;
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end