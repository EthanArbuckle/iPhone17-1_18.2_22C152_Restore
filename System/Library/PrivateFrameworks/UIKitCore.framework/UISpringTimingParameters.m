@interface UISpringTimingParameters
+ (BOOL)supportsSecureCoding;
+ (void)_convertBounce:(double)a3 toDampingRatio:(double *)a4;
+ (void)_convertDampingRatio:(double)a3 response:(double)a4 toMass:(double *)a5 stiffness:(double *)a6 damping:(double *)a7;
+ (void)_convertMass:(double)a3 stiffness:(double)a4 damping:(double)a5 toDampingRatio:(double *)a6 response:(double *)a7;
- (BOOL)implicitDuration;
- (BOOL)isEqual:(id)a3;
- (CGVector)initialVelocity;
- (UICubicTimingParameters)cubicTimingParameters;
- (UISpringTimingParameters)init;
- (UISpringTimingParameters)initWithCoder:(NSCoder *)coder;
- (UISpringTimingParameters)initWithDampingRatio:(CGFloat)ratio;
- (UISpringTimingParameters)initWithDampingRatio:(CGFloat)ratio initialVelocity:(CGVector)velocity;
- (UISpringTimingParameters)initWithDampingRatio:(double)a3 response:(double)a4;
- (UISpringTimingParameters)initWithDampingRatio:(double)a3 response:(double)a4 initialVelocity:(CGVector)a5;
- (UISpringTimingParameters)initWithDuration:(NSTimeInterval)duration bounce:(CGFloat)bounce;
- (UISpringTimingParameters)initWithDuration:(NSTimeInterval)duration bounce:(CGFloat)bounce initialVelocity:(CGVector)velocity;
- (UISpringTimingParameters)initWithMass:(CGFloat)mass stiffness:(CGFloat)stiffness damping:(CGFloat)damping initialVelocity:(CGVector)velocity;
- (UISpringTimingParameters)initWithParameters:(id)a3;
- (UISpringTimingParameters)initWithParameters:(id)a3 initialVelocity:(CGVector)a4;
- (UISpringTimingParameters)initWithVelocity:(CGVector)a3;
- (double)damping;
- (double)dampingRatio;
- (double)mass;
- (double)settlingDuration;
- (double)stiffness;
- (id)_mediaTimingFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectiveTimingFunction;
- (int64_t)timingCurveType;
- (void)encodeWithCoder:(id)a3;
- (void)setDamping:(double)a3;
- (void)setImplicitDuration:(BOOL)a3;
- (void)setMass:(double)a3;
- (void)setStiffness:(double)a3;
@end

@implementation UISpringTimingParameters

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setImplicitDuration:(BOOL)a3
{
  self->_implicitDuration = a3;
}

- (int64_t)timingCurveType
{
  return 2;
}

+ (void)_convertDampingRatio:(double)a3 response:(double)a4 toMass:(double *)a5 stiffness:(double *)a6 damping:(double *)a7
{
  double v7 = 6.28318531 / a4;
  if (a5) {
    *a5 = 1.0;
  }
  double v8 = v7 * v7;
  if (a6) {
    *a6 = v8;
  }
  if (a7)
  {
    double v9 = sqrt(v8);
    *a7 = (v9 + v9) * a3;
  }
}

- (UISpringTimingParameters)init
{
  v10.receiver = self;
  v10.super_class = (Class)UISpringTimingParameters;
  v2 = [(UISpringTimingParameters *)&v10 init];
  v2->_implicitDuration = 1;
  _UILoadDefaultSpringParameters();
  uint64_t v3 = _UIViewDefaultSpringStiffness;
  *(void *)&v2->_mass = _UIViewDefaultSpringMass;
  *(void *)&v2->_stiffness = v3;
  *(void *)&v2->_damping = _UIViewDefaultSpringDamping;
  v2->_initialVelocity.dx = 0.0;
  v2->_initialVelocity.dy = 0.0;
  [(UISpringTimingParameters *)v2 mass];
  double v5 = v4;
  [(UISpringTimingParameters *)v2 stiffness];
  double v7 = v6;
  [(UISpringTimingParameters *)v2 damping];
  +[UISpringTimingParameters _convertMass:&v2->_dampingRatio stiffness:0 damping:v5 toDampingRatio:v7 response:v8];
  return v2;
}

- (UISpringTimingParameters)initWithMass:(CGFloat)mass stiffness:(CGFloat)stiffness damping:(CGFloat)damping initialVelocity:(CGVector)velocity
{
  CGFloat dy = velocity.dy;
  CGFloat dx = velocity.dx;
  v13.receiver = self;
  v13.super_class = (Class)UISpringTimingParameters;
  v11 = [(UISpringTimingParameters *)&v13 init];
  v11->_implicitDuration = 1;
  [(UISpringTimingParameters *)v11 setMass:mass];
  [(UISpringTimingParameters *)v11 setStiffness:stiffness];
  [(UISpringTimingParameters *)v11 setDamping:damping];
  v11->_initialVelocity.CGFloat dx = dx;
  v11->_initialVelocity.CGFloat dy = dy;
  +[UISpringTimingParameters _convertMass:&v11->_dampingRatio stiffness:0 damping:mass toDampingRatio:stiffness response:damping];
  return v11;
}

+ (void)_convertMass:(double)a3 stiffness:(double)a4 damping:(double)a5 toDampingRatio:(double *)a6 response:(double *)a7
{
  if (a6)
  {
    double v7 = sqrt(a3 * a4);
    *a6 = a5 / (v7 + v7);
  }
  if (a7) {
    *a7 = 6.28318531 / sqrt(a4 / a3);
  }
}

- (void)setStiffness:(double)a3
{
  self->_stiffness = a3;
}

- (void)setMass:(double)a3
{
  self->_mass = a3;
}

- (void)setDamping:(double)a3
{
  self->_damping = a3;
}

- (double)settlingDuration
{
  double v3 = 0.0;
  if (![(UISpringTimingParameters *)self implicitDuration]) {
    return v3;
  }
  [(UISpringTimingParameters *)self initialVelocity];
  double v5 = v4;
  [(UISpringTimingParameters *)self initialVelocity];
  double v7 = v6;
  [(UISpringTimingParameters *)self mass];
  double v9 = v8;
  [(UISpringTimingParameters *)self stiffness];
  double v11 = v10;
  [(UISpringTimingParameters *)self damping];
  double v13 = v12;
  self;
  _durationOfSpringAnimation(v9, v11, v13, v7);
  double v3 = v14;
  if (v5 == v7) {
    return v3;
  }
  [(UISpringTimingParameters *)self mass];
  double v16 = v15;
  [(UISpringTimingParameters *)self stiffness];
  double v18 = v17;
  [(UISpringTimingParameters *)self damping];
  double v20 = v19;
  self;
  _durationOfSpringAnimation(v16, v18, v20, v5);
  return fmax(v3, v21);
}

- (CGVector)initialVelocity
{
  double dx = self->_initialVelocity.dx;
  double dy = self->_initialVelocity.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)mass
{
  return self->_mass;
}

- (double)damping
{
  return self->_damping;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = [(UISpringTimingParameters *)self implicitDuration];
  double v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  if (v5)
  {
    [(UISpringTimingParameters *)self mass];
    double v8 = v7;
    [(UISpringTimingParameters *)self stiffness];
    double v10 = v9;
    [(UISpringTimingParameters *)self damping];
    double v12 = v11;
    [(UISpringTimingParameters *)self initialVelocity];
    return (id)objc_msgSend(v6, "initWithMass:stiffness:damping:initialVelocity:", v8, v10, v12, v13, v14);
  }
  else
  {
    [(UISpringTimingParameters *)self dampingRatio];
    double v17 = v16;
    [(UISpringTimingParameters *)self initialVelocity];
    return (id)objc_msgSend(v6, "initWithDampingRatio:initialVelocity:", v17, v18, v19);
  }
}

- (BOOL)implicitDuration
{
  return self->_implicitDuration;
}

- (UISpringTimingParameters)initWithDampingRatio:(CGFloat)ratio initialVelocity:(CGVector)velocity
{
  CGFloat dy = velocity.dy;
  CGFloat dx = velocity.dx;
  v8.receiver = self;
  v8.super_class = (Class)UISpringTimingParameters;
  CGVector result = [(UISpringTimingParameters *)&v8 init];
  result->_implicitDuration = 0;
  result->_dampingRatio = ratio;
  result->_initialVelocity.CGFloat dx = dx;
  result->_initialVelocity.CGFloat dy = dy;
  result->_mass = 1.0;
  return result;
}

- (UISpringTimingParameters)initWithDampingRatio:(CGFloat)ratio
{
  return -[UISpringTimingParameters initWithDampingRatio:initialVelocity:](self, "initWithDampingRatio:initialVelocity:", ratio, 0.0, 0.0);
}

- (id)_mediaTimingFunction
{
  return 0;
}

- (id)effectiveTimingFunction
{
  return 0;
}

- (id)description
{
  BOOL v3 = [(UISpringTimingParameters *)self implicitDuration];
  double v4 = NSString;
  BOOL v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  if (v3)
  {
    [(UISpringTimingParameters *)self mass];
    uint64_t v8 = v7;
    [(UISpringTimingParameters *)self stiffness];
    uint64_t v10 = v9;
    [(UISpringTimingParameters *)self damping];
    uint64_t v12 = v11;
    [(UISpringTimingParameters *)self initialVelocity];
    uint64_t v14 = v13;
    [(UISpringTimingParameters *)self initialVelocity];
    [v4 stringWithFormat:@"<%@ (%p) mass=%.3f, stiffness=%.3f, damping=%.3f, velocity=(%.3f,%.3f)>", v6, self, v8, v10, v12, v14, v15];
  }
  else
  {
    [(UISpringTimingParameters *)self dampingRatio];
    uint64_t v17 = v16;
    [(UISpringTimingParameters *)self initialVelocity];
    uint64_t v19 = v18;
    [(UISpringTimingParameters *)self initialVelocity];
    [v4 stringWithFormat:@"<%@ (%p) dampingRatio=%.3f, velocity=(%.3f,%.3f)>", v6, self, v17, v19, v20, v23, v24];
  double v21 = };

  return v21;
}

- (UISpringTimingParameters)initWithVelocity:(CGVector)a3
{
  CGFloat dy = a3.dy;
  CGFloat dx = a3.dx;
  v13.receiver = self;
  v13.super_class = (Class)UISpringTimingParameters;
  BOOL v5 = [(UISpringTimingParameters *)&v13 init];
  v5->_implicitDuration = 1;
  _UILoadDefaultSpringParameters();
  uint64_t v6 = _UIViewDefaultSpringStiffness;
  *(void *)&v5->_mass = _UIViewDefaultSpringMass;
  *(void *)&v5->_stiffness = v6;
  *(void *)&v5->_damping = _UIViewDefaultSpringDamping;
  v5->_initialVelocity.CGFloat dx = dx;
  v5->_initialVelocity.CGFloat dy = dy;
  [(UISpringTimingParameters *)v5 mass];
  double v8 = v7;
  [(UISpringTimingParameters *)v5 stiffness];
  double v10 = v9;
  [(UISpringTimingParameters *)v5 damping];
  +[UISpringTimingParameters _convertMass:&v5->_dampingRatio stiffness:0 damping:v8 toDampingRatio:v10 response:v11];
  return v5;
}

- (UISpringTimingParameters)initWithDampingRatio:(double)a3 response:(double)a4 initialVelocity:(CGVector)a5
{
  double dy = a5.dy;
  double dx = a5.dx;
  double v10 = 0.0;
  double v11 = 0.0;
  double v9 = 0.0;
  +[UISpringTimingParameters _convertDampingRatio:&v11 response:&v10 toMass:&v9 stiffness:a3 damping:a4];
  return -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](self, "initWithMass:stiffness:damping:initialVelocity:", v11, v10, v9, dx, dy);
}

- (UISpringTimingParameters)initWithDampingRatio:(double)a3 response:(double)a4
{
  return -[UISpringTimingParameters initWithDampingRatio:response:initialVelocity:](self, "initWithDampingRatio:response:initialVelocity:", a3, a4, 0.0, 0.0);
}

- (UISpringTimingParameters)initWithDuration:(NSTimeInterval)duration bounce:(CGFloat)bounce initialVelocity:(CGVector)velocity
{
  CGFloat dy = velocity.dy;
  CGFloat dx = velocity.dx;
  v12.receiver = self;
  v12.super_class = (Class)UISpringTimingParameters;
  double v9 = [(UISpringTimingParameters *)&v12 init];
  double v11 = 0.0;
  +[UISpringTimingParameters _convertBounce:&v11 toDampingRatio:bounce];
  +[UISpringTimingParameters _convertDampingRatio:&v9->_mass response:&v9->_stiffness toMass:&v9->_damping stiffness:v11 damping:duration];
  v9->_implicitDuration = 1;
  v9->_initialVelocity.CGFloat dx = dx;
  v9->_initialVelocity.CGFloat dy = dy;
  return v9;
}

- (UISpringTimingParameters)initWithDuration:(NSTimeInterval)duration bounce:(CGFloat)bounce
{
  return -[UISpringTimingParameters initWithDuration:bounce:initialVelocity:](self, "initWithDuration:bounce:initialVelocity:", duration, bounce, 0.0, 0.0);
}

- (UISpringTimingParameters)initWithParameters:(id)a3 initialVelocity:(CGVector)a4
{
  double dy = a4.dy;
  double dx = a4.dx;
  id v7 = a3;
  [v7 _dampingRatio];
  double v9 = v8;
  [v7 _response];
  double v11 = v10;

  return -[UISpringTimingParameters initWithDampingRatio:response:initialVelocity:](self, "initWithDampingRatio:response:initialVelocity:", v9, v11, dx, dy);
}

- (UISpringTimingParameters)initWithParameters:(id)a3
{
  return -[UISpringTimingParameters initWithParameters:initialVelocity:](self, "initWithParameters:initialVelocity:", a3, 0.0, 0.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(UISpringTimingParameters *)self implicitDuration])
    {
      [(UISpringTimingParameters *)self mass];
      double v7 = v6;
      [v5 mass];
      if (v7 != v8) {
        goto LABEL_11;
      }
      [(UISpringTimingParameters *)self stiffness];
      double v10 = v9;
      [v5 stiffness];
      if (v10 != v11) {
        goto LABEL_11;
      }
      [(UISpringTimingParameters *)self damping];
      double v13 = v12;
      [v5 damping];
    }
    else
    {
      [(UISpringTimingParameters *)self dampingRatio];
      double v13 = v16;
      [v5 dampingRatio];
    }
    if (v13 == v14)
    {
      [(UISpringTimingParameters *)self initialVelocity];
      double v18 = v17;
      [v5 initialVelocity];
      if (v18 == v19)
      {
        [(UISpringTimingParameters *)self initialVelocity];
        double v21 = v20;
        [v5 initialVelocity];
        BOOL v15 = v21 == v22;
LABEL_12:

        goto LABEL_13;
      }
    }
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[UISpringTimingParameters implicitDuration](self, "implicitDuration"), @"implicitDuration");
  if ([(UISpringTimingParameters *)self implicitDuration])
  {
    [(UISpringTimingParameters *)self mass];
    objc_msgSend(v5, "encodeDouble:forKey:", @"mass");
    [(UISpringTimingParameters *)self stiffness];
    objc_msgSend(v5, "encodeDouble:forKey:", @"stiffness");
    [(UISpringTimingParameters *)self damping];
    id v4 = @"damping";
  }
  else
  {
    [(UISpringTimingParameters *)self dampingRatio];
    id v4 = @"dampingRatio";
  }
  objc_msgSend(v5, "encodeDouble:forKey:", v4);
  [(UISpringTimingParameters *)self initialVelocity];
  objc_msgSend(v5, "encodeCGVector:forKey:", @"velocity");
}

- (UISpringTimingParameters)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  if ([(NSCoder *)v4 allowsKeyedCoding])
  {
    v17.receiver = self;
    v17.super_class = (Class)UISpringTimingParameters;
    id v5 = [(UISpringTimingParameters *)&v17 init];
    if (v5)
    {
      BOOL v6 = [(NSCoder *)v4 decodeBoolForKey:@"implicitDuration"];
      v5->_implicitDuration = v6;
      if (v6)
      {
        [(NSCoder *)v4 decodeDoubleForKey:@"mass"];
        -[UISpringTimingParameters setMass:](v5, "setMass:");
        [(NSCoder *)v4 decodeDoubleForKey:@"stiffness"];
        -[UISpringTimingParameters setStiffness:](v5, "setStiffness:");
        [(NSCoder *)v4 decodeDoubleForKey:@"damping"];
        -[UISpringTimingParameters setDamping:](v5, "setDamping:");
        [(UISpringTimingParameters *)v5 mass];
        double v8 = v7;
        [(UISpringTimingParameters *)v5 stiffness];
        double v10 = v9;
        [(UISpringTimingParameters *)v5 damping];
        +[UISpringTimingParameters _convertMass:&v5->_dampingRatio stiffness:0 damping:v8 toDampingRatio:v10 response:v11];
      }
      else
      {
        [(NSCoder *)v4 decodeDoubleForKey:@"dampingRatio"];
        v5->_dampingRatio = v13;
      }
      [(NSCoder *)v4 decodeCGVectorForKey:@"velocity"];
      v5->_initialVelocity.double dx = v14;
      v5->_initialVelocity.double dy = v15;
    }
    self = v5;
    double v12 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ only supports keyed coding.", objc_opt_class() format];
    double v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_convertBounce:(double)a3 toDampingRatio:(double *)a4
{
  if (a4)
  {
    if (a3 >= 0.0) {
      double v4 = 1.0 - a3;
    }
    else {
      double v4 = 1.0 / (a3 + 1.0);
    }
    *a4 = v4;
  }
}

@end