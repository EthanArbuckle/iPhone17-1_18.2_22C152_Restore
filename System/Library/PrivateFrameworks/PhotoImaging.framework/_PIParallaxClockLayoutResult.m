@interface _PIParallaxClockLayoutResult
- (NSString)clockLayerOrder;
- (NSString)description;
- (unint64_t)clockIntersection;
- (void)setClockIntersection:(unint64_t)a3;
- (void)setClockLayerOrder:(id)a3;
@end

@implementation _PIParallaxClockLayoutResult

- (void).cxx_destruct
{
}

- (void)setClockIntersection:(unint64_t)a3
{
  self->_clockIntersection = a3;
}

- (unint64_t)clockIntersection
{
  return self->_clockIntersection;
}

- (void)setClockLayerOrder:(id)a3
{
}

- (NSString)clockLayerOrder
{
  return self->_clockLayerOrder;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_PIParallaxClockLayoutResult *)self clockLayerOrder];
  unint64_t v6 = [(_PIParallaxClockLayoutResult *)self clockIntersection];
  v7 = @"NO";
  if (v6 == 1) {
    v7 = @"YES";
  }
  v8 = [v3 stringWithFormat:@"<%@:%p layerOrder:%@ intersectsForeground:%@>", v4, self, v5, v7];

  return (NSString *)v8;
}

@end