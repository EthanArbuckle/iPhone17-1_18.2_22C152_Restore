@interface PFSlowMotionConfiguration
- (PFSlowMotionConfiguration)init;
- (PFSlowMotionRampConfiguration)rampDown;
- (PFSlowMotionRampConfiguration)rampUp;
- (float)volumeDuringRampToSlowMotion;
- (float)volumeDuringSlowMotion;
@end

@implementation PFSlowMotionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampUp, 0);

  objc_storeStrong((id *)&self->_rampDown, 0);
}

- (PFSlowMotionRampConfiguration)rampUp
{
  return self->_rampUp;
}

- (PFSlowMotionRampConfiguration)rampDown
{
  return self->_rampDown;
}

- (float)volumeDuringRampToSlowMotion
{
  return self->_volumeDuringRampToSlowMotion;
}

- (float)volumeDuringSlowMotion
{
  return self->_volumeDuringSlowMotion;
}

- (PFSlowMotionConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)PFSlowMotionConfiguration;
  v2 = [(PFSlowMotionConfiguration *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_volumeDuringSlowMotion = 0x3E19999A3E800000;
    v4 = [[PFSlowMotionRampConfiguration alloc] initForRampDown:1];
    rampDown = v3->_rampDown;
    v3->_rampDown = v4;

    v6 = [[PFSlowMotionRampConfiguration alloc] initForRampDown:0];
    rampUp = v3->_rampUp;
    v3->_rampUp = v6;
  }
  return v3;
}

@end