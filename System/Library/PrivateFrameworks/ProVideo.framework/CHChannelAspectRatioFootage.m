@interface CHChannelAspectRatioFootage
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (OZChannelAspectRatioFootage)ozChannel;
@end

@implementation CHChannelAspectRatioFootage

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (OZChannelAspectRatioFootage)ozChannel
{
  result = (OZChannelAspectRatioFootage *)self->super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

@end