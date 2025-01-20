@interface CHChannelGradientExtras
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)gradientTypeChannel;
- (int)gradientType:(id *)a3;
- (int)gradientType:(id *)a3 index:(double)a4;
- (void)ozChannel;
@end

@implementation CHChannelGradientExtras

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

- (id)gradientTypeChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 800);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (int)gradientType:(id *)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(&v7, v5, a3);
  return OZChannel::getValueAsInt((OZChannel *)(v5 + 800), &v7, 0.0);
}

- (int)gradientType:(id *)a3 index:(double)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    CMTime v7 = 0;
  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(&v9, v7, a3);
  return OZChannel::getValueAsInt((OZChannel *)(v7 + 800), &v9, a4);
}

@end