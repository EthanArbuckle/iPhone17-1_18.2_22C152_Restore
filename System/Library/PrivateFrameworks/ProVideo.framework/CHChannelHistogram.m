@interface CHChannelHistogram
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (double)blackInValueAtTime:(id *)a3 forHistogramChannel:(int)a4;
- (double)blackOutValueAtTime:(id *)a3 forHistogramChannel:(int)a4;
- (double)gammaValueAtTime:(id *)a3 forHistogramChannel:(int)a4;
- (double)whiteInValueAtTime:(id *)a3 forHistogramChannel:(int)a4;
- (double)whiteOutValueAtTime:(id *)a3 forHistogramChannel:(int)a4;
- (id)blackInChannelForHistogramChannel:(unsigned int)a3;
- (id)blackOutChannelForHistogramChannel:(unsigned int)a3;
- (id)gammaChannelForHistogramChannel:(unsigned int)a3;
- (id)selectedChannel;
- (id)whiteInChannelForHistogramChannel:(unsigned int)a3;
- (id)whiteOutChannelForHistogramChannel:(unsigned int)a3;
- (void)ozChannel;
@end

@implementation CHChannelHistogram

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

- (id)selectedChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 136);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)blackInChannelForHistogramChannel:(unsigned int)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  BlackIn = (OZChannelBase *)OZChannelHistogram::getBlackIn((OZChannelHistogram *)pOZChannel, a3);
  }

  return CHChannelWrapperForOZChannel(BlackIn, 0);
}

- (id)blackOutChannelForHistogramChannel:(unsigned int)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  BlackOut = (OZChannelBase *)OZChannelHistogram::getBlackOut((OZChannelHistogram *)pOZChannel, a3);
  }

  return CHChannelWrapperForOZChannel(BlackOut, 0);
}

- (id)whiteInChannelForHistogramChannel:(unsigned int)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  WhiteIn = (OZChannelBase *)OZChannelHistogram::getWhiteIn((OZChannelHistogram *)pOZChannel, a3);
  }

  return CHChannelWrapperForOZChannel(WhiteIn, 0);
}

- (id)whiteOutChannelForHistogramChannel:(unsigned int)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  WhiteOut = (OZChannelBase *)OZChannelHistogram::getWhiteOut((OZChannelHistogram *)pOZChannel, a3);
  }

  return CHChannelWrapperForOZChannel(WhiteOut, 0);
}

- (id)gammaChannelForHistogramChannel:(unsigned int)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  Gamma = (OZChannelBase *)OZChannelHistogram::getGamma((OZChannelHistogram *)pOZChannel, a3);
  }

  return CHChannelWrapperForOZChannel(Gamma, 0);
}

- (double)blackInValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(&v9, v7, a3);
  OZChannelHistogram::getBlackInValue(v7, a4, &v9, 0.0);
  return result;
}

- (double)blackOutValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(&v9, v7, a3);
  OZChannelHistogram::getBlackOutValue(v7, a4, &v9, 0.0);
  return result;
}

- (double)whiteInValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(&v9, v7, a3);
  OZChannelHistogram::getWhiteInValue(v7, a4, &v9, 0.0);
  return result;
}

- (double)whiteOutValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(&v9, v7, a3);
  OZChannelHistogram::getWhiteOutValue(v7, a4, &v9, 0.0);
  return result;
}

- (double)gammaValueAtTime:(id *)a3 forHistogramChannel:(int)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  (*(void (**)(CMTime *__return_ptr, OZChannelHistogram *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(&v9, v7, a3);
  OZChannelHistogram::getGammaValue(v7, a4, &v9, 0.0);
  return result;
}

@end