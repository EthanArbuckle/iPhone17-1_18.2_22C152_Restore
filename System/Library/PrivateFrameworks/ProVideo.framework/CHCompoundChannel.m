@interface CHCompoundChannel
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (void)ozChannel;
- (void)removeAllKeyframes;
- (void)reset;
@end

@implementation CHCompoundChannel

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return 0;
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  return 0;
}

- (void)ozChannel
{
  result = self->super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (void)reset
{
}

- (void)removeAllKeyframes
{
  if (v2)
  {
    unint64_t v3 = v2[1] - *v2;
    if ((v3 & 0x7FFFFFFF8) != 0)
    {
      uint64_t v4 = 0;
      uint64_t v5 = (v3 >> 3);
      uint64_t v6 = MEMORY[0x1E4F1FA48];
      do
      {
        v7 = *(const void **)(*v2 + 8 * v4);
        if (v7) {
        else
        }
          v8 = 0;
        (*(void (**)(void *, uint64_t, uint64_t))(*(void *)v8 + 752))(v8, v6, 1);
        (*(void (**)(void *, void))(*(void *)v8 + 288))(v8, 0);
        ++v4;
      }
      while (v5 != v4);
    }
  }
}

@end