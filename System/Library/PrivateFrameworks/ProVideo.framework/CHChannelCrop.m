@interface CHChannelCrop
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)bottomChannel;
- (id)leftChannel;
- (id)rightChannel;
- (id)topChannel;
- (void)ozChannel;
@end

@implementation CHChannelCrop

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

- (id)leftChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 136);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)rightChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 288);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)bottomChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 440);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)topChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 592);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

@end