@interface MPAnimationKeyframe1D
+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4;
+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (double)scalar;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initKeyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)keyframe;
- (void)setScalar:(double)a3;
@end

@implementation MPAnimationKeyframe1D

+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4
{
  id v4 = [objc_alloc((Class)a1) initKeyframe1DWithScalar:0 atTime:a3 offsetType:a4];
  return v4;
}

+ (id)keyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  id v5 = [objc_alloc((Class)a1) initKeyframe1DWithScalar:a5 atTime:a3 offsetType:a4];
  return v5;
}

- (id)initKeyframe1DWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MPAnimationKeyframe1D;
  id result = [(MPAnimationKeyframe *)&v9 init];
  if (result)
  {
    *((double *)result + 8) = a3;
    *((double *)result + 4) = a4;
    *((void *)result + 5) = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPAnimationKeyframe1D;
  id v4 = [(MPAnimationKeyframe *)&v6 copyWithZone:a3];
  [v4 setScalar:self->_scalar];
  return v4;
}

- (id)description
{
  v3 = +[NSString stringWithFormat:@"================================ Keyframe1D ====================================\n"];
  [(MPAnimationKeyframe *)self time];
  id v5 = [[(NSString *)v3 stringByAppendingFormat:@"\t                          Time: %f\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t                        Offset: %f\n", (double)[(MPAnimationKeyframe *)self offsetType]];
  [(MPAnimationKeyframe1D *)self scalar];
  v7 = [(NSString *)v5 stringByAppendingFormat:@"\t                        Scalar: %f\n", v6];
  if (self->super._keyframe) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  return [(NSString *)v7 stringByAppendingFormat:@"\t               Has MCKayeframe: %@\n", v8];
}

- (double)scalar
{
  return self->_scalar;
}

- (void)setScalar:(double)a3
{
  self->_scalar = a3;
  if (self->super._keyframe)
  {
    double v4 = a3;
    [(MPAnimationPath *)self->super._parentPath animatedParent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(MPAnimationPath *)self->super._parentPath animatedParent];
      *(float *)&double v7 = v4;
      objc_msgSend(objc_msgSend(v6, "convertMPAttributeToMCAttribute:withKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7), -[MPAnimationPath animatedKey](self->super._parentPath, "animatedKey")), "floatValue");
      double v4 = *(float *)&v5;
    }
    *(float *)&double v5 = v4;
    [(MCAnimationKeyframe *)self->super._keyframe setValue:v5];
  }
  parentPath = self->super._parentPath;
  if (parentPath)
  {
    [(MPAnimationPath *)parentPath animatedParent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(MPAnimationPath *)self->super._parentPath animatedParent];
      [v9 duplicateAnimationPaths];
    }
  }
}

- (id)keyframe
{
  return self->super._keyframe;
}

@end