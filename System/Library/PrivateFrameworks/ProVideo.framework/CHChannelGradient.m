@interface CHChannelGradient
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asChars:(unsigned __int8)a5[4] samples:(unsigned int)a6;
- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asFloats:(float)a5[4] samples:(unsigned int)a6;
- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asShorts:(unsigned __int16)a5[4] samples:(unsigned int)a6;
- (void)ozChannel;
- (void)reset;
@end

@implementation CHChannelGradient

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

- (void)reset
{
}

- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asChars:(unsigned __int8)a5[4] samples:(unsigned int)a6
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v11 = 0;
  ((void (*)(CMTime *__return_ptr, uint64_t **, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v11)[42])(&v12, v11, a3);
  OZChannelGradient::getGradient(v11, &v12, a4, a5, a6, 0, (PCToneMapMethod *)&kPCNoToneMapMethod);
}

- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asShorts:(unsigned __int16)a5[4] samples:(unsigned int)a6
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v11 = 0;
  ((void (*)(CMTime *__return_ptr, uint64_t **, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v11)[42])(&v12, v11, a3);
  OZChannelGradient::getGradient(v11, &v12, a4, a5, a6, 0, (PCToneMapMethod *)&kPCNoToneMapMethod);
}

- (void)getGradientAtTime:(id *)a3 inColorSpace:(CGColorSpace *)a4 asFloats:(float)a5[4] samples:(unsigned int)a6
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v11 = 0;
  ((void (*)(CMTime *__return_ptr, uint64_t **, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v11)[42])(&v12, v11, a3);
  OZChannelGradient::getGradient(v11, &v12, a4, (uint64_t)a5, a6, 0, (PCToneMapMethod *)&kPCNoToneMapMethod);
}

@end