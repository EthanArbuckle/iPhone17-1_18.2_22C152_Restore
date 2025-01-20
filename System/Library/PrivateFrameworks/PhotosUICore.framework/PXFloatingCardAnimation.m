@interface PXFloatingCardAnimation
+ (id)animationUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4;
+ (id)animationWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5;
+ (id)animationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7;
+ (id)drawerReleaseAnimationWithInitialVelocity:(double)a3;
- (PXFloatingCardAnimation)coordinatedUnitAnimation;
- (PXFloatingCardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5;
- (PXFloatingCardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7;
- (PXFloatingCardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7 calculateCoordinatedAnimation:(BOOL)a8;
- (id)description;
- (id)initUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4;
- (void)applyAnimations:(id)a3 completion:(id)a4;
@end

@implementation PXFloatingCardAnimation

- (void).cxx_destruct
{
}

- (id)description
{
  unint64_t type = self->_type;
  if (type == 2)
  {
    [NSString stringWithFormat:@"<DefaultSpringAnimation duration: %g, delay: %g, initialVelocity: %g>", *(void *)&self->_duration, *(void *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6];
  }
  else if (type == 1)
  {
    [NSString stringWithFormat:@"<SpringAnimation duration: %g, delay: %g, mass: %g, stiffness: %g, damping: %g, initialVelocity: %g>", *(void *)&self->_duration, *(void *)&self->_delay, self->_typeParameters.basic.curve, *(void *)&self->_typeParameters.spring.stiffness, *(void *)&self->_typeParameters.spring.damping, *(void *)&self->_typeParameters.spring.initialVelocity];
  }
  else
  {
    if (type) {
      goto LABEL_8;
    }
    [NSString stringWithFormat:@"<BasicAnimation duration: %g, delay: %g, curve: %ld>", *(void *)&self->_duration, *(void *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6];
  }
  a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_8:
  return (id)(id)a2;
}

- (void)applyAnimations:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t type = self->_type;
  switch(type)
  {
    case 2uLL:
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultDampedSpringWithDelay:2 initialSpringVelocity:v10 options:v6 animations:self->_delay completion:self->_typeParameters.spring.mass];
      break;
    case 1uLL:
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:2 delay:v10 options:v6 mass:self->_duration stiffness:self->_delay damping:self->_typeParameters.spring.mass initialVelocity:self->_typeParameters.spring.stiffness animations:self->_typeParameters.spring.damping completion:self->_typeParameters.spring.initialVelocity];
      break;
    case 0uLL:
      unint64_t v8 = self->_typeParameters.basic.curve - 1;
      if (v8 >= 3) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = (v8 << 16) + 65538;
      }
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 delay:v10 options:v6 animations:self->_duration completion:self->_delay];
      break;
  }
}

- (PXFloatingCardAnimation)coordinatedUnitAnimation
{
  if (self->_coordinatedUnitAnimation) {
    self = self->_coordinatedUnitAnimation;
  }
  return self;
}

- (id)initUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXFloatingCardAnimation;
  id result = [(PXFloatingCardAnimation *)&v7 init];
  if (result)
  {
    *((void *)result + 1) = 2;
    *((double *)result + 2) = a3;
    *((double *)result + 7) = a4;
  }
  return result;
}

- (PXFloatingCardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7 calculateCoordinatedAnimation:(BOOL)a8
{
  BOOL v8 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PXFloatingCardAnimation;
  v14 = [(PXFloatingCardAnimation *)&v31 init];
  v15 = v14;
  if (v14)
  {
    v14->_unint64_t type = 1;
    v14->_typeParameters.spring.mass = a3;
    v14->_typeParameters.spring.stiffness = a4;
    v14->_typeParameters.spring.damping = a5;
    v14->_typeParameters.spring.initialVelocity = a6;
    v16 = [[PXFloatingCardSpringInfo alloc] initWithMass:a3 stiffness:a4 damping:a5 initialVelocity:a6];
    [(PXFloatingCardSpringInfo *)v16 settlingTime];
    v15->_duration = v17;
    v15->_delay = a7;
    if (v8)
    {
      [(PXFloatingCardSpringInfo *)v16 undershootTime];
      double v19 = v18;
      [(PXFloatingCardSpringInfo *)v16 overshootTime];
      double v21 = v20;
      if (v19 <= 0.0)
      {
        BOOL v23 = 0;
      }
      else
      {
        [(PXFloatingCardSpringInfo *)v16 valueAtTime:v19];
        BOOL v23 = v22 > 1.005;
      }
      if (v21 > 0.0)
      {
        [(PXFloatingCardSpringInfo *)v16 valueAtTime:v21];
        if (v24 < -0.005)
        {
          v25 = [PXFloatingCardAnimation alloc];
          if (v23)
          {
            double v26 = v21 - v19;
            double v27 = v19 + a7;
          }
          else
          {
            double v26 = v21;
            double v27 = a7;
          }
          v28 = [(PXFloatingCardAnimation *)v25 initWithDuration:5 curve:v26 delay:v27];
          goto LABEL_14;
        }
      }
      if (v23)
      {
        v28 = [[PXFloatingCardAnimation alloc] initWithMass:0 stiffness:a3 damping:a4 initialVelocity:a5 delay:0.0 calculateCoordinatedAnimation:v19 + a7];
LABEL_14:
        coordinatedUnitAnimation = v15->_coordinatedUnitAnimation;
        v15->_coordinatedUnitAnimation = v28;
      }
    }
  }
  return v15;
}

- (PXFloatingCardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  return [(PXFloatingCardAnimation *)self initWithMass:1 stiffness:a3 damping:a4 initialVelocity:a5 delay:a6 calculateCoordinatedAnimation:a7];
}

- (PXFloatingCardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PXFloatingCardAnimation;
  id result = [(PXFloatingCardAnimation *)&v9 init];
  if (result)
  {
    result->_unint64_t type = 0;
    result->_typeParameters.basic.curve = a4;
    result->_duration = a3;
    result->_delay = a5;
  }
  return result;
}

+ (id)animationUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initUsingDefaultSpringWithInitialVelocity:a3 delay:a4];
  return v4;
}

+ (id)animationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  objc_super v7 = (void *)[objc_alloc((Class)a1) initWithMass:a3 stiffness:a4 damping:a5 initialVelocity:a6 delay:a7];
  return v7;
}

+ (id)animationWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDuration:a4 curve:a3 delay:a5];
  return v5;
}

+ (id)drawerReleaseAnimationWithInitialVelocity:(double)a3
{
  return (id)objc_msgSend(a1, "animationWithMass:stiffness:damping:initialVelocity:delay:", 1.0, dbl_1AB359AE0[a3 > 4.0], dbl_1AB359AF0[a3 > 4.0]);
}

@end