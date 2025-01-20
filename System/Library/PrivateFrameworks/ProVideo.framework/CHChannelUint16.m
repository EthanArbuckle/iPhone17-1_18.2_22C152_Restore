@interface CHChannelUint16
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelUint16)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (BOOL)getFirstKeyframeTime:(id *)a3 curveUint16Value:(unsigned __int16 *)a4;
- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveUint16Value:(unsigned __int16 *)a5;
- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveUint16Value:(unsigned __int16 *)a5;
- (BOOL)getLastKeyframeTime:(id *)a3 curveUint16Value:(unsigned __int16 *)a4;
- (OZChannelUint16)ozChannel;
- (unsigned)curveUint16ValueAtTime:(id *)a3;
- (unsigned)defaultCurveUint16Value;
- (unsigned)maxCurveUint16Value;
- (unsigned)maxUIUint16Value;
- (unsigned)minCurveUint16Value;
- (unsigned)minUIUint16Value;
- (unsigned)uint16ValueAtTime:(id *)a3;
- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minUint16Value:(unsigned __int16 *)a5 maxUint16Value:(unsigned __int16 *)a6;
- (void)setCurveUint16Value:(unsigned __int16)a3 atTime:(id *)a4 options:(unsigned int)a5;
@end

@implementation CHChannelUint16

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelUint16)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (OZChannelUint16)ozChannel
{
  result = (OZChannelUint16 *)self->super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (unsigned)uint16ValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(CHChannelIntegral *)self _intValueAtTime:&v4];
}

- (unsigned)curveUint16ValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(CHChannelIntegral *)self _curveIntValueAtTime:&v4];
}

- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minUint16Value:(unsigned __int16 *)a5 maxUint16Value:(unsigned __int16 *)a6
{
  uint64_t v10 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  [(CHChannelIntegral *)self _getExtremaBetweenStart:&v9 end:&v8 minIntValue:(char *)&v10 + 4 maxIntValue:&v10];
  if (a5) {
    *a5 = WORD2(v10);
  }
  if (a6) {
    *a6 = v10;
  }
}

- (void)setCurveUint16Value:(unsigned __int16)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  [(CHChannelIntegral *)self _setCurveIntValue:a3 atTime:&v5 options:*(void *)&a5];
}

- (unsigned)defaultCurveUint16Value
{
  return [(CHChannelIntegral *)self _defaultCurveIntValue];
}

- (unsigned)minCurveUint16Value
{
  return [(CHChannelIntegral *)self _minCurveIntValue];
}

- (unsigned)maxCurveUint16Value
{
  return [(CHChannelIntegral *)self _maxCurveIntValue];
}

- (unsigned)minUIUint16Value
{
  return [(CHChannelIntegral *)self _minUIIntValue];
}

- (unsigned)maxUIUint16Value
{
  return [(CHChannelIntegral *)self _maxUIIntValue];
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveUint16Value:(unsigned __int16 *)a4
{
  int v6 = 0;
  BOOL result = [(CHChannelIntegral *)self getFirstKeyframeTime:a3 curveIntValue:&v6];
  if (a4) {
    *a4 = v6;
  }
  return result;
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveUint16Value:(unsigned __int16 *)a4
{
  int v6 = 0;
  BOOL result = [(CHChannelIntegral *)self getLastKeyframeTime:a3 curveIntValue:&v6];
  if (a4) {
    *a4 = v6;
  }
  return result;
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveUint16Value:(unsigned __int16 *)a5
{
  int v8 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  BOOL result = [(CHChannelIntegral *)self getKeyframeAfterTime:&v7 time:a4 curveIntValue:&v8];
  if (a5) {
    *a5 = v8;
  }
  return result;
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveUint16Value:(unsigned __int16 *)a5
{
  int v8 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  BOOL result = [(CHChannelIntegral *)self getKeyframeBeforeTime:&v7 time:a4 curveIntValue:&v8];
  if (a5) {
    *a5 = v8;
  }
  return result;
}

@end