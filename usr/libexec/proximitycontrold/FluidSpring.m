@interface FluidSpring
- (FluidSpring)init;
- (FluidSpring)initWithParameters:(FLSpringParameters)a3 retargetImpuse:(double)a4;
- (double)step:(double)a3 progress:(double)a4;
@end

@implementation FluidSpring

- (FluidSpring)init
{
  v6.receiver = self;
  v6.super_class = (Class)FluidSpring;
  v2 = [(FluidSpring *)&v6 init];
  if (v2)
  {
    v3 = [[FLSpring alloc] initWithValue:0.0];
    internalSpring = v2->_internalSpring;
    v2->_internalSpring = v3;

    nullsub_1(0.8425, 0.0625, 0.4, 0.125);
    -[FLSpring setTrackingParameters:](v2->_internalSpring, "setTrackingParameters:");
    [(FLSpring *)v2->_internalSpring setTracking:1];
    v2->_lastUpdate = 0.0;
  }
  return v2;
}

- (FluidSpring)initWithParameters:(FLSpringParameters)a3 retargetImpuse:(double)a4
{
  double responseSmoothing = a3.responseSmoothing;
  double response = a3.response;
  double dampingRatioSmoothing = a3.dampingRatioSmoothing;
  double dampingRatio = a3.dampingRatio;
  v13.receiver = self;
  v13.super_class = (Class)FluidSpring;
  v9 = [(FluidSpring *)&v13 init];
  if (v9)
  {
    v10 = [[FLSpring alloc] initWithValue:0.0];
    internalSpring = v9->_internalSpring;
    v9->_internalSpring = v10;

    [(FLSpring *)v9->_internalSpring setRetargetImpulse:a4];
    -[FLSpring setTrackingParameters:](v9->_internalSpring, "setTrackingParameters:", dampingRatio, dampingRatioSmoothing, response, responseSmoothing);
    [(FLSpring *)v9->_internalSpring setTracking:1];
    v9->_lastUpdate = 0.0;
  }
  return v9;
}

- (double)step:(double)a3 progress:(double)a4
{
  [(FLSpring *)self->_internalSpring setTarget:a4];
  double v6 = a3 - self->_lastUpdate;
  self->_lastUpdate = a3;
  [(FLSpring *)self->_internalSpring step:v6];
  internalSpring = self->_internalSpring;

  [(FLSpring *)internalSpring value];
  return result;
}

- (void).cxx_destruct
{
}

@end