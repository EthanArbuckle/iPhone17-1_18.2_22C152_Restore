@interface _UIMotionEffectEngineLogger
- (_UIMotionEffectEngineLogger)initWithFastUpdateInterval:(double)a3 slowUpdateInterval:(double)a4;
- (void)_dumpToAggregated;
- (void)recordMotionMagnitude:(double)a3 atTimestamp:(double)a4;
@end

@implementation _UIMotionEffectEngineLogger

- (_UIMotionEffectEngineLogger)initWithFastUpdateInterval:(double)a3 slowUpdateInterval:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIMotionEffectEngineLogger;
  result = [(_UIMotionEffectEngineLogger *)&v7 init];
  if (result)
  {
    _MergedGlobals_899 = (uint64_t)(1.0 / a3);
    qword_1EB256E08 = (uint64_t)(1.0 / a4);
    result->_updateFreqency = (uint64_t)(1.0 / a3);
    result->_lastUpdateTimeStamp = -1.0;
  }
  return result;
}

- (void)recordMotionMagnitude:(double)a3 atTimestamp:(double)a4
{
  double lastUpdateTimeStamp = self->_lastUpdateTimeStamp;
  if (lastUpdateTimeStamp != a4)
  {
    if (lastUpdateTimeStamp == -1.0)
    {
      uint64_t updateFreqency = self->_updateFreqency;
    }
    else if (lastUpdateTimeStamp == 0.0)
    {
      uint64_t updateFreqency = 0;
    }
    else
    {
      uint64_t v9 = (uint64_t)(1.0 / (a4 - lastUpdateTimeStamp));
      uint64_t v10 = _MergedGlobals_899;
      if (_MergedGlobals_899 <= v9)
      {
        uint64_t updateFreqency = _MergedGlobals_899;
      }
      else
      {
        uint64_t v11 = qword_1EB256E08;
        if (qword_1EB256E08 <= v9 || (uint64_t updateFreqency = 1, v10 = qword_1EB256E08, v11 = 1, v9 >= 1))
        {
          if (v10 - v9 <= v9 - v11) {
            uint64_t updateFreqency = v10;
          }
          else {
            uint64_t updateFreqency = v11;
          }
        }
      }
    }
    if (updateFreqency != self->_updateFreqency)
    {
      [(_UIMotionEffectEngineLogger *)self _dumpToAggregated];
      self->_uint64_t updateFreqency = updateFreqency;
    }
    if (a3 <= 0.01)
    {
      uint64_t v12 = 0;
    }
    else if (a3 <= 0.015)
    {
      uint64_t v12 = 1;
    }
    else if (a3 <= 0.02)
    {
      uint64_t v12 = 2;
    }
    else if (a3 <= 0.025)
    {
      uint64_t v12 = 3;
    }
    else if (a3 <= 0.03)
    {
      uint64_t v12 = 4;
    }
    else if (a3 <= 0.04)
    {
      uint64_t v12 = 5;
    }
    else
    {
      uint64_t v12 = 6;
      if (a3 > 0.05) {
        uint64_t v12 = 7;
      }
    }
    ++self->_motionLevelSamples[v12];
    self->_double lastUpdateTimeStamp = a4;
    int64_t sampleCount = self->_sampleCount;
    self->_int64_t sampleCount = sampleCount + 1;
    if (sampleCount >= 59)
    {
      [(_UIMotionEffectEngineLogger *)self _dumpToAggregated];
    }
  }
}

- (void)_dumpToAggregated
{
  _UIMainBundleIdentifier();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_updateFreqency);
  for (uint64_t i = 0; i != 8; ++i)
  {
    v5 = @"unknown";
    if ((i & 0xFFFFFFF8) == 0) {
      v5 = off_1E52FEFB0[i];
    }
    v6 = [NSString stringWithFormat:@"%@.%@.%@", v3, v5, v8];
    objc_super v7 = [@"com.apple.UIKit.motion." stringByAppendingString:v6];

    ADClientAddValueForScalarKey();
    self->_motionLevelSamples[i] = 0;
  }
  self->_int64_t sampleCount = 0;
}

@end