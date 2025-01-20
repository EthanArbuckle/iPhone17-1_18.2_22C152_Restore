@interface CHChannelBlindData
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)pluginDataAtTime:(id *)a3;
- (void)ozChannel;
- (void)setDefaultCurveBlindDataValue:(id)a3;
- (void)setPluginData:(id)a3 atTime:(id *)a4;
@end

@implementation CHChannelBlindData

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (void)ozChannel
{
  result = self->super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (id)pluginDataAtTime:(id *)a3
{
  pOZChannel = (OZChannelBlindData *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannelBlindData::getPluginDataPtr(pOZChannel, (const CMTime *)a3);
}

- (void)setPluginData:(id)a3 atTime:(id *)a4
{
  pOZChannel = (OZChannelBlindData *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelBlindData::setPluginDataPtr(pOZChannel, (const CMTime *)a4, a3, 0, 1, 1);
}

- (void)setDefaultCurveBlindDataValue:(id)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  int v6 = (*(uint64_t (**)(OZChannelBlindData *))(*(void *)v5 + 512))(v5);
  uint64_t v7 = *(void *)v5;
  if (v6)
  {
    int v8 = (*(uint64_t (**)(OZChannelBlindData *))(v7 + 832))(v5);
    OZChannelBlindData::setDefaultValue(v5, a3);
    if (v8) {
      return;
    }
  }
  else
  {
    char v9 = (*(uint64_t (**)(OZChannelBlindData *, uint64_t))(v7 + 496))(v5, 1);
    OZChannelBlindData::setDefaultValue(v5, a3);
    if (v9) {
      return;
    }
  }
  v10 = *(void (**)(OZChannelBlindData *, void))(*(void *)v5 + 288);

  v10(v5, 0);
}

@end