@interface CHChannelDiscreteColor
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (PCColor)colorForIndex:(SEL)a3;
- (int)colorIndex;
- (int)defaultColorIndex;
- (void)ozChannel;
- (void)setColorIndex:(int)a3;
- (void)setDefaultColorIndex:(int)a3;
@end

@implementation CHChannelDiscreteColor

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

- (void)setColorIndex:(int)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelDiscreteColor::setColorIndex((OZChannelDiscreteColor *)pOZChannel, a3);
}

- (int)colorIndex
{
  pOZChannel = (OZChannel *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (const CMTime *)MEMORY[0x1E4F1FA48];
  }

  return OZChannel::getValueAsInt(pOZChannel, v3, 0.0);
}

- (void)setDefaultColorIndex:(int)a3
{
  pOZChannel = (OZChannel *)self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelDiscreteColor::setDefaultColorIndex(pOZChannel, a3);
}

- (int)defaultColorIndex
{
  pOZChannel = (OZChannel *)self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannelDiscreteColor::getDefaultColorIndex(pOZChannel);
}

- (PCColor)colorForIndex:(SEL)a3
{
  v4 = *(OZChannelDiscreteColor **)&a4;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  return (PCColor *)OZChannelDiscreteColor::getPCColorForIndex(v4, retstr);
}

@end