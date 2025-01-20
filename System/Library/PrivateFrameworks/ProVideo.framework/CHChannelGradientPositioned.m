@interface CHChannelGradientPositioned
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)endChannel;
- (id)startChannel;
- (void)ozChannel;
@end

@implementation CHChannelGradientPositioned

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

- (id)startChannel
{
  pOZChannel = (char *)self->super.super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 1056);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)endChannel
{
  pOZChannel = (char *)self->super.super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 1760);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

@end