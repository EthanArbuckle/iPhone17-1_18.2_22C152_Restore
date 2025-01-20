@interface UICubicTimingParameters
- (BOOL)isEqual:(id)a3;
- (CGPoint)controlPoint1;
- (CGPoint)controlPoint2;
- (UICubicTimingParameters)init;
- (UICubicTimingParameters)initWithAnimationCurve:(UIViewAnimationCurve)curve;
- (UICubicTimingParameters)initWithCoder:(NSCoder *)coder;
- (UICubicTimingParameters)initWithControlPoint1:(CGPoint)point1 controlPoint2:(CGPoint)point2;
- (UICubicTimingParameters)initWithCustomCurve:(id)a3;
- (UISpringTimingParameters)springTimingParameters;
- (UIViewAnimationCurve)animationCurve;
- (_UIViewCubicTimingFunction)timingFunction;
- (id)_mediaTimingFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectiveTimingFunction;
- (int64_t)timingCurveType;
- (void)_setAnimationCurve:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSpringTimingParameters:(id)a3;
@end

@implementation UICubicTimingParameters

- (UISpringTimingParameters)springTimingParameters
{
  return self->_springTimingParameters;
}

- (int64_t)timingCurveType
{
  if (self->_animationCurve == 6) {
    return 1;
  }
  if (self->_springTimingParameters) {
    return 3;
  }
  return 0;
}

- (CGPoint)controlPoint2
{
  [(_UIViewCubicTimingFunction *)self->_timingFunction controlPoint2];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)controlPoint1
{
  [(_UIViewCubicTimingFunction *)self->_timingFunction controlPoint1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIViewAnimationCurve)animationCurve
{
  return self->_animationCurve;
}

- (UICubicTimingParameters)initWithCustomCurve:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 getControlPointAtIndex:1 values:&v8];
  double v5 = v8;
  double v6 = v9;
  [v4 getControlPointAtIndex:2 values:&v8];

  return -[UICubicTimingParameters initWithControlPoint1:controlPoint2:](self, "initWithControlPoint1:controlPoint2:", v5, v6, v8, v9);
}

- (UICubicTimingParameters)initWithControlPoint1:(CGPoint)point1 controlPoint2:(CGPoint)point2
{
  double y = point2.y;
  double x = point2.x;
  double v6 = point1.y;
  double v7 = point1.x;
  v12.receiver = self;
  v12.super_class = (Class)UICubicTimingParameters;
  float v8 = [(UICubicTimingParameters *)&v12 init];
  v8->_animationCurve = 6;
  float v9 = -[_UIViewCubicTimingFunction initWithControlPoint1:controlPoint2:]([_UIViewCubicTimingFunction alloc], "initWithControlPoint1:controlPoint2:", v7, v6, x, y);
  timingFunction = v8->_timingFunction;
  v8->_timingFunction = v9;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = self;
  double v5 = v4;
  if (!v4)
  {
LABEL_4:
    double v7 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    [(UICubicTimingParameters *)v5 controlPoint1];
    double v9 = v8;
    double v11 = v10;
    [(UICubicTimingParameters *)v5 controlPoint2];
    return (id)objc_msgSend(v7, "initWithControlPoint1:controlPoint2:", v9, v11, v12, v13);
  }
  if ([(UICubicTimingParameters *)v4 timingCurveType])
  {
    uint64_t v6 = [(UICubicTimingParameters *)v5 timingCurveType];

    if (v6 != 3) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  v15 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v16 = [(UICubicTimingParameters *)v5 animationCurve];
  return (id)[v15 initWithAnimationCurve:v16];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springTimingParameters, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

- (id)_mediaTimingFunction
{
  return [(_UIViewCubicTimingFunction *)self->_timingFunction _mediaTimingFunction];
}

- (UICubicTimingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)UICubicTimingParameters;
  double v2 = [(UICubicTimingParameters *)&v6 init];
  v2->_animationCurve = 5;
  uint64_t v3 = [(UICubicTimingParameters *)v2 effectiveTimingFunction];
  timingFunction = v2->_timingFunction;
  v2->_timingFunction = (_UIViewCubicTimingFunction *)v3;

  return v2;
}

- (UICubicTimingParameters)initWithAnimationCurve:(UIViewAnimationCurve)curve
{
  v10.receiver = self;
  v10.super_class = (Class)UICubicTimingParameters;
  id v4 = [(UICubicTimingParameters *)&v10 init];
  if (curve == (UIViewAnimationCurveLinear|0x4))
  {
    double v5 = objc_alloc_init(UISpringTimingParameters);
    springTimingParameters = v4->_springTimingParameters;
    v4->_springTimingParameters = v5;

    if ((dyld_program_sdk_at_least() & 1) == 0) {
      [(UISpringTimingParameters *)v4->_springTimingParameters setImplicitDuration:0];
    }
  }
  v4->_animationCurve = curve;
  uint64_t v7 = [(UICubicTimingParameters *)v4 effectiveTimingFunction];
  timingFunction = v4->_timingFunction;
  v4->_timingFunction = (_UIViewCubicTimingFunction *)v7;

  return v4;
}

- (id)effectiveTimingFunction
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  timingFunction = self->_timingFunction;
  if (timingFunction)
  {
    objc_super v6 = timingFunction;
  }
  else
  {
    int64_t animationCurve = self->_animationCurve;
    double v8 = (id *)MEMORY[0x1E4F3A490];
    switch(animationCurve)
    {
      case 0:
        goto LABEL_10;
      case 1:
        double v8 = (id *)MEMORY[0x1E4F3A488];
        goto LABEL_10;
      case 2:
        double v8 = (id *)MEMORY[0x1E4F3A498];
        goto LABEL_10;
      case 3:
      case 7:
        double v8 = (id *)MEMORY[0x1E4F3A4A0];
        goto LABEL_10;
      case 4:
        LODWORD(v2) = 1059648963;
        LODWORD(v3) = 1051260355;
        LODWORD(v4) = 1.0;
        double v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :0.0 :v3 :v4];
        break;
      case 5:
        double v8 = (id *)MEMORY[0x1E4F3A480];
LABEL_10:
        id v10 = *v8;
        double v9 = [MEMORY[0x1E4F39C10] functionWithName:v10];

        break;
      default:
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unknown/Unsupported UIViewAnimationCurve type %ld", animationCurve);
        double v9 = 0;
        break;
    }
    [v9 getControlPointAtIndex:1 values:&v14];
    double v11 = v14;
    double v12 = v15;
    [v9 getControlPointAtIndex:2 values:&v14];
    objc_super v6 = -[_UIViewCubicTimingFunction initWithControlPoint1:controlPoint2:]([_UIViewCubicTimingFunction alloc], "initWithControlPoint1:controlPoint2:", v11, v12, v14, v15);
  }
  return v6;
}

- (void)_setAnimationCurve:(int64_t)a3
{
  self->_int64_t animationCurve = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(UICubicTimingParameters *)self timingCurveType] == 1)
    {
      objc_super v6 = [(UICubicTimingParameters *)self timingFunction];
      uint64_t v7 = [v5 timingFunction];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      UIViewAnimationCurve v9 = [(UICubicTimingParameters *)self animationCurve];
      char v8 = v9 == [v5 animationCurve];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[UICubicTimingParameters timingCurveType](self, "timingCurveType"), @"curveType");
  if ([(UICubicTimingParameters *)self timingCurveType] == 1)
  {
    id v4 = [(UICubicTimingParameters *)self timingFunction];
    [v5 encodeObject:v4 forKey:@"timingFunction"];
  }
  else
  {
    objc_msgSend(v5, "encodeInteger:forKey:", -[UICubicTimingParameters animationCurve](self, "animationCurve"), @"animationCurve");
  }
}

- (UICubicTimingParameters)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  if ([(NSCoder *)v4 allowsKeyedCoding])
  {
    v14.receiver = self;
    v14.super_class = (Class)UICubicTimingParameters;
    id v5 = [(UICubicTimingParameters *)&v14 init];
    if (v5)
    {
      if ([(NSCoder *)v4 decodeIntegerForKey:@"curveType"] == 1)
      {
        uint64_t v6 = [(NSCoder *)v4 decodeObjectForKey:@"timingFunction"];
        timingFunction = v5->_timingFunction;
        v5->_timingFunction = (_UIViewCubicTimingFunction *)v6;

        v5->_int64_t animationCurve = 6;
      }
      else
      {
        uint64_t v9 = [(NSCoder *)v4 decodeIntegerForKey:@"animationCurve"];
        id v10 = v5->_timingFunction;
        v5->_timingFunction = 0;
        v5->_int64_t animationCurve = v9;

        uint64_t v11 = [(UICubicTimingParameters *)v5 effectiveTimingFunction];
        double v12 = v5->_timingFunction;
        v5->_timingFunction = (_UIViewCubicTimingFunction *)v11;
      }
    }
    self = v5;
    char v8 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ only supports keyed coding.", objc_opt_class() format];
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  if ([(UICubicTimingParameters *)self timingCurveType])
  {
    int64_t v3 = [(UICubicTimingParameters *)self timingCurveType];
    id v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = (void *)v6;
    if (v3 != 3)
    {
      id v10 = [(UICubicTimingParameters *)self timingFunction];
      uint64_t v11 = [v4 stringWithFormat:@"<%@ (%p) timing function = %@>", v7, self, v10];

      goto LABEL_10;
    }
    [v4 stringWithFormat:@"<%@ (%p) builtin type = smooth>", v6, self, v15];
  }
  else
  {
    UIViewAnimationCurve v8 = [(UICubicTimingParameters *)self animationCurve];
    if ((unint64_t)v8 > 5) {
      uint64_t v9 = @"unknown";
    }
    else {
      uint64_t v9 = off_1E52DCB50[v8];
    }
    double v12 = NSString;
    double v13 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v13);
    [v12 stringWithFormat:@"<%@ (%p) builtin type = %@>", v7, self, v9];
  uint64_t v11 = };
LABEL_10:

  return v11;
}

- (_UIViewCubicTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setSpringTimingParameters:(id)a3
{
}

@end