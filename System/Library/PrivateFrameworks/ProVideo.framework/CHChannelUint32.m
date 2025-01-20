@interface CHChannelUint32
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelUint32)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (BOOL)getFirstKeyframeTime:(id *)a3 curveUint32Value:(unsigned int *)a4;
- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveUint32Value:(unsigned int *)a5;
- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveUint32Value:(unsigned int *)a5;
- (BOOL)getLastKeyframeTime:(id *)a3 curveUint32Value:(unsigned int *)a4;
- (OZChannelUint32)ozChannel;
- (unsigned)curveUint32ValueAtTime:(id *)a3;
- (unsigned)uint32ValueAtTime:(id *)a3;
- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minUint32Value:(unsigned int *)a5 maxUint32Value:(unsigned int *)a6;
- (void)setCurveUint32Value:(unsigned int)a3 atTime:(id *)a4 options:(unsigned int)a5;
@end

@implementation CHChannelUint32

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelUint32)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (OZChannelUint32)ozChannel
{
  result = (OZChannelUint32 *)self->super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (unsigned)uint32ValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(CHChannelIntegral *)self _intValueAtTime:&v4];
}

- (unsigned)curveUint32ValueAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(CHChannelIntegral *)self _curveIntValueAtTime:&v4];
}

- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minUint32Value:(unsigned int *)a5 maxUint32Value:(unsigned int *)a6
{
  uint64_t v10 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  [(CHChannelIntegral *)self _getExtremaBetweenStart:&v9 end:&v8 minIntValue:(char *)&v10 + 4 maxIntValue:&v10];
  if (a5) {
    *a5 = HIDWORD(v10);
  }
  if (a6) {
    *a6 = v10;
  }
}

- (void)setCurveUint32Value:(unsigned int)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  [(CHChannelIntegral *)self _setCurveIntValue:*(void *)&a3 atTime:&v5 options:*(void *)&a5];
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveUint32Value:(unsigned int *)a4
{
  unsigned int v6 = 0;
  BOOL result = [(CHChannelIntegral *)self getFirstKeyframeTime:a3 curveIntValue:&v6];
  if (a4) {
    *a4 = v6;
  }
  return result;
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveUint32Value:(unsigned int *)a4
{
  unsigned int v6 = 0;
  BOOL result = [(CHChannelIntegral *)self getLastKeyframeTime:a3 curveIntValue:&v6];
  if (a4) {
    *a4 = v6;
  }
  return result;
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveUint32Value:(unsigned int *)a5
{
  unsigned int v8 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  BOOL result = [(CHChannelIntegral *)self getKeyframeAfterTime:&v7 time:a4 curveIntValue:&v8];
  if (a5) {
    *a5 = v8;
  }
  return result;
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveUint32Value:(unsigned int *)a5
{
  unsigned int v8 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  BOOL result = [(CHChannelIntegral *)self getKeyframeBeforeTime:&v7 time:a4 curveIntValue:&v8];
  if (a5) {
    *a5 = v8;
  }
  return result;
}

@end