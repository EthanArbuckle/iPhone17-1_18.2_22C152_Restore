@interface CLPedestrianFenceStatus
- (CLPedestrianFenceStatus)initWithRadius:(float)a3 radialDisplacement:(float)a4 duration:(double)a5;
- (double)duration;
- (float)radialDisplacement;
- (float)radius;
- (id)description;
- (void)setDuration:(double)a3;
- (void)setRadialDisplacement:(float)a3;
- (void)setRadius:(float)a3;
@end

@implementation CLPedestrianFenceStatus

- (CLPedestrianFenceStatus)initWithRadius:(float)a3 radialDisplacement:(float)a4 duration:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLPedestrianFenceStatus;
  result = [(CLPedestrianFenceStatus *)&v9 init];
  if (result)
  {
    result->_radius = a3;
    result->_radialDisplacement = a4;
    result->_duration = a5;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"radius: %f, radialDisplacement: %f, duration: %f", self->_radius, self->_radialDisplacement, *(void *)&self->_duration];
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
}

- (float)radialDisplacement
{
  return self->_radialDisplacement;
}

- (void)setRadialDisplacement:(float)a3
{
  self->_radialDisplacement = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end