@interface MPAnimationKeyframe2D
+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4;
+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (CGPoint)point;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initKeyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)keyframe;
- (void)setPoint:(CGPoint)a3;
@end

@implementation MPAnimationKeyframe2D

+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "initKeyframe2DWithPoint:atTime:offsetType:", 0, a3.x, a3.y, a4);
  return v4;
}

+ (id)keyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  id v5 = objc_msgSend(objc_alloc((Class)a1), "initKeyframe2DWithPoint:atTime:offsetType:", a5, a3.x, a3.y, a4);
  return v5;
}

- (id)initKeyframe2DWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)MPAnimationKeyframe2D;
  id result = [(MPAnimationKeyframe *)&v10 init];
  if (result)
  {
    *((CGFloat *)result + 8) = x;
    *((CGFloat *)result + 9) = y;
    *((double *)result + 4) = a4;
    *((void *)result + 5) = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPAnimationKeyframe2D;
  id v4 = [(MPAnimationKeyframe *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setPoint:", self->_point.x, self->_point.y);
  return v4;
}

- (id)description
{
  v3 = +[NSString stringWithFormat:@"================================ Keyframe2D ====================================\n"];
  [(MPAnimationKeyframe *)self time];
  id v5 = [[(NSString *)v3 stringByAppendingFormat:@"\t                          Time: %f\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t                        Offset: %f\n", (double)[(MPAnimationKeyframe *)self offsetType]];
  [(MPAnimationKeyframe2D *)self point];
  objc_super v6 = [(NSString *)v5 stringByAppendingFormat:@"\t                         Point: %@\n", NSStringFromCGPoint(v9)];
  if (self->super._keyframe) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  return [(NSString *)v6 stringByAppendingFormat:@"\t               Has MCKayeframe: %@\n", v7];
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
  if (self->super._keyframe)
  {
    double y = a3.y;
    double x = a3.x;
    [(MPAnimationPath *)self->super._parentPath animatedParent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(MPAnimationPath *)self->super._parentPath animatedParent];
      v12.double x = x;
      v12.double y = y;
      CFStringRef v7 = (NSString *)objc_msgSend(v6, "convertMPAttributeToMCAttribute:withKey:", NSStringFromCGPoint(v12), -[MPAnimationPath animatedKey](self->super._parentPath, "animatedKey"));
      CGPoint v8 = CGPointFromString(v7);
      double x = v8.x;
      double y = v8.y;
    }
    -[MCAnimationKeyframe setPoint:](self->super._keyframe, "setPoint:", x, y);
  }
  parentPath = self->super._parentPath;
  if (parentPath)
  {
    [(MPAnimationPath *)parentPath animatedParent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(MPAnimationPath *)self->super._parentPath animatedParent];
      [v10 duplicateAnimationPaths];
    }
  }
}

- (id)keyframe
{
  return self->super._keyframe;
}

@end