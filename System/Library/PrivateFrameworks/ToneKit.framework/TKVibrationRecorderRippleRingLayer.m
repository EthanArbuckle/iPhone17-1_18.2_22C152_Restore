@interface TKVibrationRecorderRippleRingLayer
- (CGPoint)normalizedRingLocation;
- (TKVibrationRecorderRippleRingLayer)init;
- (double)ringSpeed;
- (double)timeIntervalSinceCreation;
- (void)configureWithTimeIntervalSinceCreation:(double)a3 normalizedRingLocation:(CGPoint)a4 ringSpeed:(double)a5;
- (void)reset;
@end

@implementation TKVibrationRecorderRippleRingLayer

- (TKVibrationRecorderRippleRingLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderRippleRingLayer;
  v2 = [(TKVibrationRecorderRippleRingLayer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TKVibrationRecorderRippleRingLayer *)v2 setFillColor:0];
    [(TKVibrationRecorderRippleRingLayer *)v3 reset];
  }
  return v3;
}

- (double)timeIntervalSinceCreation
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  return v3 - self->_creationTimestamp;
}

- (void)configureWithTimeIntervalSinceCreation:(double)a3 normalizedRingLocation:(CGPoint)a4 ringSpeed:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_creationTimestamp = v10 - a3;
  self->_normalizedRingLocation.CGFloat x = x;
  self->_normalizedRingLocation.CGFloat y = y;
  self->_ringSpeed = a5;
}

- (void)reset
{
  self->_creationTimestamp = 0.0;
  self->_normalizedRingLocation = (CGPoint)*MEMORY[0x263F00148];
  self->_ringSpeed = 0.0;
}

- (CGPoint)normalizedRingLocation
{
  double x = self->_normalizedRingLocation.x;
  double y = self->_normalizedRingLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)ringSpeed
{
  return self->_ringSpeed;
}

@end