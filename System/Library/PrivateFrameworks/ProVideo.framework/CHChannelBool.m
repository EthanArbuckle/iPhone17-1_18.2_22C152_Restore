@interface CHChannelBool
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBool)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (BOOL)BOOLValueAtTime:(id *)a3;
- (BOOL)curveBoolValueAtTime:(id *)a3;
- (BOOL)defaultCurveBoolValue;
- (BOOL)getFirstKeyframeTime:(id *)a3 curveBoolValue:(BOOL *)a4;
- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveBoolValue:(BOOL *)a5;
- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveBoolValue:(BOOL *)a5;
- (BOOL)getLastKeyframeTime:(id *)a3 curveBoolValue:(BOOL *)a4;
- (BOOL)maxCurveBoolValue;
- (BOOL)maxUIBoolValue;
- (BOOL)minCurveBoolValue;
- (BOOL)minUIBoolValue;
- (OZChannelBool)ozChannel;
- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minBoolValue:(BOOL *)a5 maxBoolValue:(BOOL *)a6;
- (void)setCurveBoolValue:(BOOL)a3 atTime:(id *)a4 options:(unsigned int)a5;
@end

@implementation CHChannelBool

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBool)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (OZChannelBool)ozChannel
{
  result = (OZChannelBool *)self->super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (BOOL)BOOLValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(CHChannelIntegral *)self _intValueAtTime:&v4] != 0;
}

- (BOOL)curveBoolValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(CHChannelIntegral *)self _curveIntValueAtTime:&v4] != 0;
}

- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minBoolValue:(BOOL *)a5 maxBoolValue:(BOOL *)a6
{
  uint64_t v10 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  [(CHChannelIntegral *)self _getExtremaBetweenStart:&v9 end:&v8 minIntValue:(char *)&v10 + 4 maxIntValue:&v10];
  if (a5) {
    *a5 = HIDWORD(v10) != 0;
  }
  if (a6) {
    *a6 = v10 != 0;
  }
}

- (void)setCurveBoolValue:(BOOL)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  [(CHChannelIntegral *)self _setCurveIntValue:a3 atTime:&v5 options:*(void *)&a5];
}

- (BOOL)defaultCurveBoolValue
{
  return [(CHChannelIntegral *)self _defaultCurveIntValue] != 0;
}

- (BOOL)minCurveBoolValue
{
  return [(CHChannelIntegral *)self _minCurveIntValue] != 0;
}

- (BOOL)maxCurveBoolValue
{
  return [(CHChannelIntegral *)self _maxCurveIntValue] != 0;
}

- (BOOL)minUIBoolValue
{
  return [(CHChannelIntegral *)self _minUIIntValue] != 0;
}

- (BOOL)maxUIBoolValue
{
  return [(CHChannelIntegral *)self _maxUIIntValue] != 0;
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveBoolValue:(BOOL *)a4
{
  int v6 = 0;
  BOOL result = [(CHChannelIntegral *)self getFirstKeyframeTime:a3 curveIntValue:&v6];
  if (a4) {
    *a4 = v6 != 0;
  }
  return result;
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveBoolValue:(BOOL *)a4
{
  int v6 = 0;
  BOOL result = [(CHChannelIntegral *)self getLastKeyframeTime:a3 curveIntValue:&v6];
  if (a4) {
    *a4 = v6 != 0;
  }
  return result;
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveBoolValue:(BOOL *)a5
{
  int v8 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  BOOL result = [(CHChannelIntegral *)self getKeyframeAfterTime:&v7 time:a4 curveIntValue:&v8];
  if (a5) {
    *a5 = v8 != 0;
  }
  return result;
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveBoolValue:(BOOL *)a5
{
  int v8 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  BOOL result = [(CHChannelIntegral *)self getKeyframeBeforeTime:&v7 time:a4 curveIntValue:&v8];
  if (a5) {
    *a5 = v8 != 0;
  }
  return result;
}

@end