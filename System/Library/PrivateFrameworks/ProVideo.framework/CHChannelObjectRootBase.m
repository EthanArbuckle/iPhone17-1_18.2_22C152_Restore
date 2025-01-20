@interface CHChannelObjectRootBase
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)offset;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOffset;
- (void)ozChannel;
- (void)setDuration:(id *)a3;
- (void)setOffset:(id *)a3;
- (void)setTimeOffset:(id *)a3;
@end

@implementation CHChannelObjectRootBase

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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeOffset
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  v4 = *(uint64_t (**)(void))(*(void *)pOZChannel + 320);
  }

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v4();
}

- (void)setTimeOffset:(id *)a3
{
  pOZChannel = (__n128 *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelObjectRootBase::setTimeOffset(pOZChannel, (const CMTime *)a3, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*(void *(**)(void *__return_ptr))(*(void *)pOZChannel
  }
                                                                                                + 712))(v6);
  *(_OWORD *)&retstr->var0 = v7;
  retstr->var3 = v8;
  return result;
}

- (void)setDuration:(id *)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(void *__return_ptr, OZChannelObjectRootBase *))(*(void *)v5 + 712))(v6, v5);
  long long v7 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  OZChannelObjectRootBase::setTimeExtent(v5, (const PCTimeRange *)v6, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)offset
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(*(void *(**)(long long *__return_ptr))(*(void *)pOZChannel
  }
                                                                                                  + 712))(&v6);
  *(_OWORD *)&retstr->var0 = v6;
  retstr->int64_t var3 = v7;
  return result;
}

- (void)setOffset:(id *)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(long long *__return_ptr, OZChannelObjectRootBase *))(*(void *)v5 + 712))(&v6, v5);
  long long v6 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  OZChannelObjectRootBase::setTimeExtent(v5, (const PCTimeRange *)&v6, 0);
}

@end