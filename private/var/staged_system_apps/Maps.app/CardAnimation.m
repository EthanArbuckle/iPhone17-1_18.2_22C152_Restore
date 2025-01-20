@interface CardAnimation
+ (CardAnimation)animationWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5;
+ (CardAnimation)animationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7;
+ (id)animationUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4;
- (CardAnimation)coordinatedUnitAnimation;
- (CardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5;
- (CardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7;
- (CardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7 calculateCoordinatedAnimation:(BOOL)a8;
- (id)description;
- (id)initUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4;
- (void)applyWithAnimations:(id)a3 completion:(id)a4;
@end

@implementation CardAnimation

- (CardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CardAnimation;
  v8 = [(CardAnimation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 0;
    v8->_typeParameters.basic.curve = a4;
    v8->_duration = a3;
    v8->_delay = a5;
    v10 = v8;
  }

  return v9;
}

- (CardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  return [(CardAnimation *)self initWithMass:1 stiffness:a3 damping:a4 initialVelocity:a5 delay:a6 calculateCoordinatedAnimation:a7];
}

- (CardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7 calculateCoordinatedAnimation:(BOOL)a8
{
  BOOL v8 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CardAnimation;
  v14 = [(CardAnimation *)&v32 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = 1;
    v14->_typeParameters.spring.mass = a3;
    v14->_typeParameters.spring.stiffness = a4;
    v14->_typeParameters.spring.damping = a5;
    v14->_typeParameters.spring.initialVelocity = a6;
    v16 = [[SpringInfo alloc] initWithMass:a3 stiffness:a4 damping:a5 initialVelocity:a6];
    [(SpringInfo *)v16 settlingTime];
    v15->_duration = v17;
    v15->_delay = a7;
    if (v8)
    {
      [(SpringInfo *)v16 undershootTime];
      double v19 = v18;
      [(SpringInfo *)v16 overshootTime];
      double v21 = v20;
      if (v19 <= 0.0)
      {
        BOOL v23 = 0;
      }
      else
      {
        [(SpringInfo *)v16 valueAtTime:v19];
        BOOL v23 = v22 > 1.005;
      }
      if (v21 > 0.0)
      {
        [(SpringInfo *)v16 valueAtTime:v21];
        if (v24 < -0.005)
        {
          v25 = [CardAnimation alloc];
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
          v28 = [(CardAnimation *)v25 initWithDuration:5 curve:v26 delay:v27];
          goto LABEL_14;
        }
      }
      if (v23)
      {
        v28 = [[CardAnimation alloc] initWithMass:0 stiffness:a3 damping:a4 initialVelocity:a5 delay:0.0 calculateCoordinatedAnimation:v19 + a7];
LABEL_14:
        coordinatedUnitAnimation = v15->_coordinatedUnitAnimation;
        v15->_coordinatedUnitAnimation = v28;
      }
    }
    v30 = v15;
  }
  return v15;
}

- (id)initUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CardAnimation;
  v6 = [(CardAnimation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    v6->_typeParameters.spring.mass = a3;
    v6->_delay = a4;
    BOOL v8 = v6;
  }

  return v7;
}

+ (CardAnimation)animationWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  id v5 = [objc_alloc((Class)a1) initWithDuration:a4 curve:a3 delay:a5];

  return (CardAnimation *)v5;
}

+ (CardAnimation)animationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  id v7 = [objc_alloc((Class)a1) initWithMass:a3 stiffness:a4 damping:a5 initialVelocity:a6 delay:a7];

  return (CardAnimation *)v7;
}

+ (id)animationUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  id v4 = [objc_alloc((Class)a1) initUsingDefaultSpringWithInitialVelocity:a3 delay:a4];

  return v4;
}

- (CardAnimation)coordinatedUnitAnimation
{
  if (self->_coordinatedUnitAnimation) {
    self = self->_coordinatedUnitAnimation;
  }
  return self;
}

- (void)applyWithAnimations:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int64_t type = self->_type;
  switch(type)
  {
    case 2:
      +[UIView _animateUsingDefaultDampedSpringWithDelay:2 initialSpringVelocity:v8 options:v6 animations:self->_delay completion:self->_typeParameters.spring.mass];
      break;
    case 1:
      +[UIView _animateUsingSpringWithDuration:2 delay:v8 options:v6 mass:self->_duration stiffness:self->_delay damping:self->_typeParameters.spring.mass initialVelocity:self->_typeParameters.spring.stiffness animations:self->_typeParameters.spring.damping completion:self->_typeParameters.spring.initialVelocity];
      break;
    case 0:
      +[UIView animateWithDuration:(self->_typeParameters.basic.curve << 16) | 2 delay:v8 options:v6 animations:self->_duration completion:self->_delay];
      break;
  }
}

- (id)description
{
  int64_t type = self->_type;
  if (type == 2)
  {
    +[NSString stringWithFormat:@"<DefaultSpringAnimation duration: %g, delay: %g, initialVelocity: %g>", *(void *)&self->_duration, *(void *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6];
  }
  else if (type == 1)
  {
    +[NSString stringWithFormat:@"<SpringAnimation duration: %g, delay: %g, mass: %g, stiffness: %g, damping: %g, initialVelocity: %g>", *(void *)&self->_duration, *(void *)&self->_delay, self->_typeParameters.basic.curve, *(void *)&self->_typeParameters.spring.stiffness, *(void *)&self->_typeParameters.spring.damping, *(void *)&self->_typeParameters.spring.initialVelocity];
  }
  else
  {
    if (type) {
      goto LABEL_8;
    }
    +[NSString stringWithFormat:@"<BasicAnimation duration: %g, delay: %g, curve: %ld>", *(void *)&self->_duration, *(void *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6];
  }
  a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return (id)(id)a2;
}

- (void).cxx_destruct
{
}

@end