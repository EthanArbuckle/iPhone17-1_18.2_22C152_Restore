@interface CHChannelDecibel
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (CHChannelDecibel)initWithOZChannel:(OZChannelBase *)a3 freeWhenDone:(BOOL)a4;
- (OZChannelDecibel)ozChannel;
@end

@implementation CHChannelDecibel

- (CHChannelDecibel)initWithOZChannel:(OZChannelBase *)a3 freeWhenDone:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHChannelDecibel;
  v4 = [(CHChannelBase *)&v7 initWithOZChannel:a3 freeWhenDone:a4];
  v5 = v4;
  if (v4) {
    [(CHChannel *)v4 setSliderTransformerName:@"PISliderTransformerDecibel"];
  }
  return v5;
}

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (OZChannelDecibel)ozChannel
{
  result = (OZChannelDecibel *)self->super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

@end