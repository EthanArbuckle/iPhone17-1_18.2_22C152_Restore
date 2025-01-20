@interface UIKBHandwritingInputSpeedModel
- (BOOL)autoConfirmationEnabled;
- (CGRect)handwritingFrame;
- (UIKBHandwritingInputSpeedModel)init;
- (double)maxTimeout;
- (double)minTimeout;
- (double)smoothValueFromArray:(id)a3;
- (double)speedForCurrentStroke;
- (double)timeoutForNextPage;
- (void)addPoint:(CGPoint)a3 timestamp:(double)a4;
- (void)beginStroke;
- (void)endCharacter;
- (void)endStroke;
- (void)setHandwritingFrame:(CGRect)a3;
- (void)updatePreferences;
@end

@implementation UIKBHandwritingInputSpeedModel

- (UIKBHandwritingInputSpeedModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBHandwritingInputSpeedModel;
  v2 = [(UIKBHandwritingInputSpeedModel *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    recordedIntervals = v2->_recordedIntervals;
    v2->_recordedIntervals = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    recordedSpeeds = v2->_recordedSpeeds;
    v2->_recordedSpeeds = (NSMutableArray *)v5;

    [(UIKBHandwritingInputSpeedModel *)v2 updatePreferences];
  }
  return v2;
}

- (void)beginStroke
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  pointsCurrentStroke = self->_pointsCurrentStroke;
  self->_pointsCurrentStroke = v3;

  if (self->_lastStrokeTimeStamp != 0.0)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSinceReferenceDate];
    double v6 = v5 - self->_lastStrokeTimeStamp;

    recordedIntervals = self->_recordedIntervals;
    objc_msgSend(NSNumber, "numberWithDouble:", fmin(v6, 1.0));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](recordedIntervals, "insertObject:atIndex:");
  }
}

- (void)addPoint:(CGPoint)a3 timestamp:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = objc_alloc_init(_UIKBHandwritingInputSpeedModelPoint);
  -[_UIKBHandwritingInputSpeedModelPoint setLocation:](v8, "setLocation:", x, y);
  [(_UIKBHandwritingInputSpeedModelPoint *)v8 setTimestamp:a4];
  [(NSMutableArray *)self->_pointsCurrentStroke addObject:v8];
}

- (void)endStroke
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastStrokeTimeStamp = v3;
}

- (void)endCharacter
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastStrokeTimeStamp = v3;
  if ((unint64_t)[(NSMutableArray *)self->_recordedIntervals count] >= 0x81)
  {
    -[NSMutableArray subarrayWithRange:](self->_recordedIntervals, "subarrayWithRange:", 0, 64);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (NSMutableArray *)[v8 mutableCopy];
    recordedIntervals = self->_recordedIntervals;
    self->_recordedIntervals = v4;
  }
  if ((unint64_t)[(NSMutableArray *)self->_recordedSpeeds count] >= 0x81)
  {
    -[NSMutableArray subarrayWithRange:](self->_recordedSpeeds, "subarrayWithRange:", 0, 64);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    double v6 = (NSMutableArray *)[v9 mutableCopy];
    recordedSpeeds = self->_recordedSpeeds;
    self->_recordedSpeeds = v6;
  }
}

- (double)speedForCurrentStroke
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v3 = 0.0;
  if ((unint64_t)[(NSMutableArray *)self->_pointsCurrentStroke count] >= 2)
  {
    v4 = [(NSMutableArray *)self->_pointsCurrentStroke lastObject];
    [v4 timestamp];
    double v6 = v5;
    v7 = [(NSMutableArray *)self->_pointsCurrentStroke firstObject];
    [v7 timestamp];
    double v9 = v6 - v8;

    if (v9 > 0.0)
    {
      v10 = [(NSMutableArray *)self->_pointsCurrentStroke firstObject];
      [v10 location];
      double v12 = v11;
      double v14 = v13;

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v15 = self->_pointsCurrentStroke;
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v26;
        double v18 = 0.0;
        do
        {
          uint64_t v19 = 0;
          double v20 = v12;
          double v21 = v14;
          do
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v15);
            }
            objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v19), "location", (void)v25);
            double v12 = v22;
            double v14 = v23;
            double v18 = v18 + hypot(v20 - v22, v21 - v23);
            ++v19;
            double v20 = v12;
            double v21 = v14;
          }
          while (v16 != v19);
          uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v16);
      }
      else
      {
        double v18 = 0.0;
      }

      return v18 / v9;
    }
  }
  return v3;
}

- (double)smoothValueFromArray:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 >= 0x14) {
    uint64_t v5 = 20;
  }
  else {
    uint64_t v5 = v4;
  }
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      double v10 = -[UIKBHandwritingInputSpeedModel smoothValueFromArray:]::gaussian[i];
      double v11 = [v3 objectAtIndex:i];
      [v11 doubleValue];
      double v8 = v8 + v10;
      double v7 = v7 + v10 * v12;
    }
  }
  if (v8 > 0.0) {
    double v6 = v7 / v8;
  }

  return v6;
}

- (double)timeoutForNextPage
{
  [(UIKBHandwritingInputSpeedModel *)self maxTimeout];
  double v4 = v3;
  if ([(NSMutableArray *)self->_recordedIntervals count])
  {
    [(UIKBHandwritingInputSpeedModel *)self smoothValueFromArray:self->_recordedIntervals];
    if (v5 > 0.0)
    {
      double v6 = v5;
      [(UIKBHandwritingInputSpeedModel *)self handwritingFrame];
      double v8 = v7;
      [(UIKBHandwritingInputSpeedModel *)self handwritingFrame];
      if (v8 >= v9) {
        double v8 = v9;
      }
      if (v8 > 0.0)
      {
        [(UIKBHandwritingInputSpeedModel *)self speedForCurrentStroke];
        recordedSpeeds = self->_recordedSpeeds;
        double v12 = [NSNumber numberWithDouble:v11 / v8];
        [(NSMutableArray *)recordedSpeeds insertObject:v12 atIndex:0];

        [(UIKBHandwritingInputSpeedModel *)self smoothValueFromArray:self->_recordedSpeeds];
        double v14 = v6 * ((1.0 - 1.0 / (exp(-(v13 + -2.0)) + 1.0)) * 4.6 + 0.9);
        [(UIKBHandwritingInputSpeedModel *)self maxTimeout];
        double v16 = v15;
        [(UIKBHandwritingInputSpeedModel *)self minTimeout];
        if (v14 >= v17) {
          double v17 = v14;
        }
        if (v16 >= v17) {
          return v17;
        }
        else {
          return v16;
        }
      }
    }
  }
  return v4;
}

- (void)updatePreferences
{
  id v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v3 = [v10 preferencesActions];
  self->_autoConfirmationEnabled = [v3 BOOLForPreferenceKey:@"HandwritingAutoConfirmationEnabled"];

  id v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v4 = [v11 preferencesActions];
  double v5 = [v4 valueForPreferenceKey:@"HandwritingAutoConfirmationMinTimeout"];
  [v5 doubleValue];
  self->_minTimeout = v6;

  id v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v7 = [v12 preferencesActions];
  double v8 = [v7 valueForPreferenceKey:@"HandwritingAutoConfirmationMaxTimeout"];
  [v8 doubleValue];
  self->_maxTimeout = v9;
}

- (BOOL)autoConfirmationEnabled
{
  return self->_autoConfirmationEnabled;
}

- (double)minTimeout
{
  return self->_minTimeout;
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (CGRect)handwritingFrame
{
  double x = self->_handwritingFrame.origin.x;
  double y = self->_handwritingFrame.origin.y;
  double width = self->_handwritingFrame.size.width;
  double height = self->_handwritingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHandwritingFrame:(CGRect)a3
{
  self->_handwritingFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointsCurrentStroke, 0);
  objc_storeStrong((id *)&self->_recordedSpeeds, 0);
  objc_storeStrong((id *)&self->_recordedIntervals, 0);
}

@end