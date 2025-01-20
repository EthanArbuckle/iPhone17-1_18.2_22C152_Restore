@interface CHChannelLevels
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (double)blackValueAtTime:(id *)a3;
- (double)gammaValueAtTime:(id *)a3;
- (double)whiteValueAtTime:(id *)a3;
- (id)blackChannel;
- (id)gammaChannel;
- (id)whiteChannel;
- (void)ozChannel;
@end

@implementation CHChannelLevels

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

- (id)blackChannel
{
  pOZChannel = (PVRenderJob *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  FrameStats = (OZChannelBase *)PVRenderJob::GetFrameStats(pOZChannel);
  }

  return CHChannelWrapperForOZChannel(FrameStats, 0);
}

- (id)whiteChannel
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  White = (OZChannelBase *)OZChannelLevels::getWhite((OZChannelLevels *)pOZChannel);
  }

  return CHChannelWrapperForOZChannel(White, 0);
}

- (id)gammaChannel
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  Gamma = (OZChannelBase *)OZChannelLevels::getGamma((OZChannelLevels *)pOZChannel);
  }

  return CHChannelWrapperForOZChannel(Gamma, 0);
}

- (double)blackValueAtTime:(id *)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelLevels *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(&v7, v5, a3);
  OZChannelLevels::getBlackValue(v5, &v7, 0.0);
  return result;
}

- (double)whiteValueAtTime:(id *)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelLevels *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(&v7, v5, a3);
  OZChannelLevels::getWhiteValue(v5, &v7, 0.0);
  return result;
}

- (double)gammaValueAtTime:(id *)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelLevels *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(&v7, v5, a3);
  OZChannelLevels::getGammaValue(v5, &v7, 0.0);
  return result;
}

@end