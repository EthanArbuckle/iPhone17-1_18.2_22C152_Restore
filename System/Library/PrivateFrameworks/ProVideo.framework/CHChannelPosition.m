@interface CHChannelPosition
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (void)getPositionAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5;
- (void)getPositionAtTime:(id *)a3 x:(double *)a4 y:(double *)a5;
- (void)ozChannel;
@end

@implementation CHChannelPosition

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (void)ozChannel
{
  result = self->super.super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (void)getPositionAtTime:(id *)a3 x:(double *)a4 y:(double *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(CHChannel2D *)self getDoubleValuesAtTime:&v5 x:a4 y:a5];
}

- (void)getPositionAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(CHChannel2D *)self getDoubleValuesAtTime:&v5 curveX:a4 curveY:a5];
}

@end