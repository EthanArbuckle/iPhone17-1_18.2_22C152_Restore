@interface TKVibrationRecorderRippleTouchContext
- (CGPoint)location;
- (TKVibrationRecorderRippleTouchContext)init;
- (double)timeIntervalSinceCreation;
- (void)configureWithTimeIntervalSinceCreation:(double)a3 location:(CGPoint)a4;
- (void)reset;
@end

@implementation TKVibrationRecorderRippleTouchContext

- (TKVibrationRecorderRippleTouchContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderRippleTouchContext;
  v2 = [(TKVibrationRecorderRippleTouchContext *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TKVibrationRecorderRippleTouchContext *)v2 reset];
  }
  return v3;
}

- (double)timeIntervalSinceCreation
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  return v3 - self->_creationTimestamp;
}

- (void)configureWithTimeIntervalSinceCreation:(double)a3 location:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_creationTimestamp = v8 - a3;
  self->_location.CGFloat x = x;
  self->_location.CGFloat y = y;
}

- (void)reset
{
  self->_creationTimestamp = 0.0;
  self->_location = (CGPoint)*MEMORY[0x263F00148];
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end