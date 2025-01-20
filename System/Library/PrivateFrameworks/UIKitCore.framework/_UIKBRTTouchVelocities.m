@interface _UIKBRTTouchVelocities
- (id)recognizer:(id)a3 confidenceWhenPendingTouchInfo:(id)a4;
- (id)recognizer:(id)a3 confidenceWhenSettingTouchInfo:(id)a4;
@end

@implementation _UIKBRTTouchVelocities

- (id)recognizer:(id)a3 confidenceWhenPendingTouchInfo:(id)a4
{
  return 0;
}

- (id)recognizer:(id)a3 confidenceWhenSettingTouchInfo:(id)a4
{
  id v4 = a4;
  v5 = objc_alloc_init(_UIKBRTConfidenceLevels);
  int v6 = [v4 preRuleTouchState];
  if (v6 == 7 || v6 == 1)
  {
    [(_UIKBRTConfidenceLevels *)v5 setTouchConfidence:0.0];
    [v4 currentZGradient];
    if (v10 <= 1.0) {
      double v9 = 0.5;
    }
    else {
      double v9 = 1.0 - v10 * 0.5;
    }
    *(float *)&double v9 = v9;
  }
  else
  {
    if (v6) {
      goto LABEL_13;
    }
    [v4 currentZGradient];
    if (v7 <= 1.0) {
      double v8 = 0.5;
    }
    else {
      double v8 = v7 * 0.5;
    }
    *(float *)&double v8 = v8;
    [(_UIKBRTConfidenceLevels *)v5 setTouchConfidence:v8];
    double v9 = 0.0;
  }
  [(_UIKBRTConfidenceLevels *)v5 setRestConfidence:v9];
LABEL_13:

  return v5;
}

@end