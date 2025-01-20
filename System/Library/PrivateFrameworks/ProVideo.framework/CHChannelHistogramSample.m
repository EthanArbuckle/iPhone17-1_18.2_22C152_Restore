@interface CHChannelHistogramSample
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)blackInChannel;
- (id)blackOutChannel;
- (id)gammaChannel;
- (id)whiteInChannel;
- (id)whiteOutChannel;
- (void)ozChannel;
@end

@implementation CHChannelHistogramSample

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (void)ozChannel
{
  result = self->super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (id)blackInChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 136);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)blackOutChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 288);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)whiteInChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 440);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)whiteOutChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 592);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)gammaChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 744);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

@end