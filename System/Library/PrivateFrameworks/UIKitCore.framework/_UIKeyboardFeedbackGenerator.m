@interface _UIKeyboardFeedbackGenerator
+ (Class)_configurationClass;
- (double)_autoDeactivationTimeout;
- (double)_lastTypedKeyTimestamp;
- (float)scaleVolumeSlow:(float)a3 fast:(float)a4 timeSpan:(double)a5;
- (id)_feedbackWithUpdatedVolume:(id)a3;
- (id)_stats_key;
- (void)_playFeedbackForActionType:(int64_t)a3 withCustomization:(id)a4;
- (void)_setLastTypedKeyTimestamp:(double)a3;
- (void)actionOccurred:(int64_t)a3;
- (void)actionOccurred:(int64_t)a3 atLocation:(CGPoint)a4;
@end

@implementation _UIKeyboardFeedbackGenerator

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

- (id)_stats_key
{
  return @"keyboard";
}

- (double)_autoDeactivationTimeout
{
  return 0.0;
}

- (void)actionOccurred:(int64_t)a3
{
}

- (void)actionOccurred:(int64_t)a3 atLocation:(CGPoint)a4
{
}

- (float)scaleVolumeSlow:(float)a3 fast:(float)a4 timeSpan:(double)a5
{
  v9 = [(_UIKeyboardFeedbackGenerator *)self _keyboardConfiguration];
  [v9 slowTypingTime];
  double v11 = v10;

  v12 = [(_UIKeyboardFeedbackGenerator *)self _keyboardConfiguration];
  [v12 fastTypingTime];
  double v14 = v13;

  float result = (a5 - v14) / (v11 - v14) * (float)(a3 - a4) + a4;
  if (a3 >= a4) {
    float v16 = a4;
  }
  else {
    float v16 = a3;
  }
  if (a3 >= a4) {
    float v17 = a3;
  }
  else {
    float v17 = a4;
  }
  if (v16 >= result) {
    float result = v16;
  }
  if (v17 <= result) {
    return v17;
  }
  return result;
}

- (id)_feedbackWithUpdatedVolume:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKeyboardFeedbackGenerator *)self _keyboardConfiguration];
  [v5 fastTypingVolumeMultiplier];
  double v7 = v6;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  double lastTypedKeyTimestamp = self->_lastTypedKeyTimestamp;
  if (lastTypedKeyTimestamp > 0.0)
  {
    double v11 = v9 - lastTypedKeyTimestamp;
    v12 = [v4 audioParameters];
    [v12 volume];
    float v14 = v13;

    v15 = [v4 hapticParameters];
    [v15 volume];
    float v17 = v16;

    double v18 = v7 * v14;
    *(float *)&double v19 = v18;
    *(float *)&double v18 = v14;
    [(_UIKeyboardFeedbackGenerator *)self scaleVolumeSlow:v18 fast:v19 timeSpan:v11];
    float v21 = v20;
    double v22 = v7 * v17;
    *(float *)&double v23 = v22;
    *(float *)&double v22 = v17;
    [(_UIKeyboardFeedbackGenerator *)self scaleVolumeSlow:v22 fast:v23 timeSpan:v11];
    if (v21 != v14 || v24 != v17)
    {
      float v26 = v24;
      v27 = (void *)[v4 copy];

      v28 = [v27 audioParameters];
      *(float *)&double v29 = v21;
      [v28 setVolume:v29];

      v30 = [v27 hapticParameters];
      *(float *)&double v31 = v26;
      [v30 setVolume:v31];

      id v4 = v27;
    }
  }
  self->_double lastTypedKeyTimestamp = v9;
  return v4;
}

- (void)_playFeedbackForActionType:(int64_t)a3 withCustomization:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v7 = (void (**)(id, uint64_t))a4;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
  double v8 = [(_UIKeyboardFeedbackGenerator *)self _keyboardConfiguration];
  double v9 = [v8 feedbacks];
  double v10 = [NSNumber numberWithInteger:a3];
  double v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    v12 = [v11 _individualFeedbacks];
    unint64_t v13 = [v12 count];

    if (v13 >= 2)
    {
      float v14 = +[_UIFeedbackPreferences sharedPreferences];
      uint64_t v15 = [v14 enabledFeedbackTypesForCategory:0x1ED11B020];

      if ((unint64_t)(v15 - 1) <= 1)
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        float v16 = objc_msgSend(v11, "_individualFeedbacks", 0);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(v16);
              }
              float v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              if ([v21 _effectivePlayableFeedbackTypes] == v15)
              {
                id v22 = v21;

                double v11 = v22;
                goto LABEL_14;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
LABEL_14:
      }
    }
    if (v7)
    {
      uint64_t v23 = [v11 copy];

      v7[2](v7, v23);
    }
    else
    {
      float v24 = [(_UIKeyboardFeedbackGenerator *)self _keyboardConfiguration];
      int v25 = [v24 scalingForSpeedEnabled];

      if (!v25)
      {
LABEL_20:
        -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v11, 1.79769313e308, 1.79769313e308);

        goto LABEL_21;
      }
      uint64_t v23 = [(_UIKeyboardFeedbackGenerator *)self _feedbackWithUpdatedVolume:v11];
    }
    double v11 = (void *)v23;
    goto LABEL_20;
  }
LABEL_21:
}

- (double)_lastTypedKeyTimestamp
{
  return self->_lastTypedKeyTimestamp;
}

- (void)_setLastTypedKeyTimestamp:(double)a3
{
  self->_double lastTypedKeyTimestamp = a3;
}

@end