@interface CHChannelGradientWithAngle
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (double)gradientAngleAtTime:(id *)a3;
- (id)gradientAngleChannel;
- (void)ozChannel;
@end

@implementation CHChannelGradientWithAngle

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

- (id)gradientAngleChannel
{
  pOZChannel = (char *)self->super.super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 1056);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (double)gradientAngleAtTime:(id *)a3
{
  pOZChannel = self->super.super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(&v7, v5, a3);
  OZChannel::getValueAsDouble((OZChannel *)(v5 + 1056), &v7, 0.0);
  return result;
}

@end