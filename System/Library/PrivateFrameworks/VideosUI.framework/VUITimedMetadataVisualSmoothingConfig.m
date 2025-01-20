@interface VUITimedMetadataVisualSmoothingConfig
- (VUITimedMetadataVisualSmoothingConfig)init;
- (double)initialLookAhead;
- (double)initialLookBack;
- (double)lookAhead;
- (double)timeRangeProximityThreshold;
- (void)setInitialLookAhead:(double)a3;
- (void)setInitialLookBack:(double)a3;
- (void)setLookAhead:(double)a3;
- (void)setTimeRangeProximityThreshold:(double)a3;
@end

@implementation VUITimedMetadataVisualSmoothingConfig

- (VUITimedMetadataVisualSmoothingConfig)init
{
  v15.receiver = self;
  v15.super_class = (Class)VUITimedMetadataVisualSmoothingConfig;
  v2 = [(VUITimedMetadataVisualSmoothingConfig *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_timeRangeProximityThreshold = 0.5;
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [v4 objectForKey:@"CapInitialLookBack"];

    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 objectForKey:@"CapInitialLookAhead"];

    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v9 = [v8 objectForKey:@"CapLookAhead"];

    if (v5) {
      [v5 doubleValue];
    }
    else {
      double v10 = 5.0;
    }
    v3->_initialLookBack = v10;
    double v11 = 8.0;
    double v12 = 8.0;
    if (v7) {
      objc_msgSend(v7, "doubleValue", 8.0);
    }
    v3->_initialLookAhead = v12;
    if (v9)
    {
      [v9 doubleValue];
      double v11 = v13;
    }
    v3->_lookAhead = v11;
  }
  return v3;
}

- (double)initialLookBack
{
  return self->_initialLookBack;
}

- (void)setInitialLookBack:(double)a3
{
  self->_initialLookBack = a3;
}

- (double)initialLookAhead
{
  return self->_initialLookAhead;
}

- (void)setInitialLookAhead:(double)a3
{
  self->_initialLookAhead = a3;
}

- (double)lookAhead
{
  return self->_lookAhead;
}

- (void)setLookAhead:(double)a3
{
  self->_lookAhead = a3;
}

- (double)timeRangeProximityThreshold
{
  return self->_timeRangeProximityThreshold;
}

- (void)setTimeRangeProximityThreshold:(double)a3
{
  self->_timeRangeProximityThreshold = a3;
}

@end