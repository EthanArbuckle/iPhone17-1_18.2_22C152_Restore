@interface CHChannelColorNoAlpha
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (double)blueValueAtTime:(id *)a3;
- (double)curveBlueValueAtTime:(id *)a3;
- (double)curveGreenValueAtTime:(id *)a3;
- (double)curveRedValueAtTime:(id *)a3;
- (double)greenValueAtTime:(id *)a3;
- (double)redValueAtTime:(id *)a3;
- (id)blueChannel;
- (id)greenChannel;
- (id)redChannel;
- (void)getColorAtTime:(id *)a3 curveRed:(double *)a4 curveGreen:(double *)a5 curveBlue:(double *)a6;
- (void)getColorAtTime:(id *)a3 red:(double *)a4 green:(double *)a5 blue:(double *)a6;
- (void)getDefaultCurveRed:(double *)a3 curveGreen:(double *)a4 curveBlue:(double *)a5;
- (void)ozChannel;
- (void)setColorAtTime:(id *)a3 curveRed:(double)a4 curveGreen:(double)a5 curveBlue:(double)a6 options:(unsigned int)a7;
- (void)setColorSpaceIDNoConversion:(int)a3;
- (void)setCurveBlueValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)setCurveGreenValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)setCurveRedValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)setDefaultCurveRed:(double)a3 curveGreen:(double)a4 curveBlue:(double)a5;
- (void)setIsColor:(BOOL)a3;
@end

@implementation CHChannelColorNoAlpha

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

- (void)setDefaultCurveRed:(double)a3 curveGreen:(double)a4 curveBlue:(double)a5
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v9 = 0;
  OZChannelColorNoAlpha::getPCColorSpace(v9, (CGColorSpace **)&v13);
  float v10 = a3;
  float v11 = a4;
  float v12 = a5;
  PCColor::PCColor((PCColor *)&v13.var1, v10, v11, v12, &v13);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v13);
  (*(void (**)(OZChannelColorNoAlpha *, OZFactory **))(*(void *)v9 + 848))(v9, &v13.var1);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v13.var7);
}

- (void)getDefaultCurveRed:(double *)a3 curveGreen:(double *)a4 curveBlue:(double *)a5
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = 0;
  if (a3) {
LABEL_3:
  }
    *a3 = OZChannel::getDefaultValue((OZChannel *)(v9 + 136));
LABEL_4:
  if (a4) {
    *a4 = OZChannel::getDefaultValue((OZChannel *)(v9 + 288));
  }
  if (a5) {
    *a5 = OZChannel::getDefaultValue((OZChannel *)(v9 + 440));
  }
}

- (void)setColorSpaceIDNoConversion:(int)a3
{
  v3 = *(OZChannelBase **)&a3;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelColorNoAlpha::setColorSpaceIDNoConversion((uint64_t)pOZChannel, v3, 0);
}

- (void)setIsColor:(BOOL)a3
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelColorNoAlpha::setIsColor((uint64_t)pOZChannel, a3);
}

- (void)getColorAtTime:(id *)a3 red:(double *)a4 green:(double *)a5 blue:(double *)a6
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    float v11 = 0;
  PCColor::PCColor(&v15);
  (*(void (**)(CGColorSpace **__return_ptr, OZChannelColorNoAlpha *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v11 + 336))(v14, v11, a3);
  (*(void (**)(OZChannelColorNoAlpha *, CGColorSpace **, PCColor *, double))(*(void *)v11 + 824))(v11, v14, &v15, 0.0);
  uint64_t v13 = 0;
  float v12 = 0.0;
  OZChannelColorNoAlpha::getPCColorSpace(v11, v14);
  PCColor::getRGB(&v15, (float *)&v13 + 1, (float *)&v13, &v12, (const PCColorSpaceHandle *)v14);
  PCCFRef<CGColorSpace *>::~PCCFRef(v14);
  *a4 = *((float *)&v13 + 1);
  *a5 = *(float *)&v13;
  *a6 = v12;
  PCCFRef<CGColorSpace *>::~PCCFRef(&v15.var1._obj);
}

- (double)redValueAtTime:(id *)a3
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v4 = (OZChannel *)(pOZChannel + 136);
  }
  (*(void (**)(CMTime *__return_ptr))(*(void *)pOZChannel + 336))(&v6);
  OZChannel::getValueAsDouble(v4, &v6, 0.0);
  return result;
}

- (double)greenValueAtTime:(id *)a3
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v4 = (OZChannel *)(pOZChannel + 288);
  }
  (*(void (**)(CMTime *__return_ptr))(*(void *)pOZChannel + 336))(&v6);
  OZChannel::getValueAsDouble(v4, &v6, 0.0);
  return result;
}

- (double)blueValueAtTime:(id *)a3
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v4 = (OZChannel *)(pOZChannel + 440);
  }
  (*(void (**)(CMTime *__return_ptr))(*(void *)pOZChannel + 336))(&v6);
  OZChannel::getValueAsDouble(v4, &v6, 0.0);
  return result;
}

- (void)getColorAtTime:(id *)a3 curveRed:(double *)a4 curveGreen:(double *)a5 curveBlue:(double *)a6
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  float v11 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = OZChannel::getCurveValue((OZChannel *)(v11 + 136), (const CMTime *)a3, 0);
LABEL_4:
  if (a5) {
    *a5 = OZChannel::getCurveValue((OZChannel *)(v11 + 288), (const CMTime *)a3, 0);
  }
  if (a6) {
    *a6 = OZChannel::getCurveValue((OZChannel *)(v11 + 440), (const CMTime *)a3, 0);
  }
}

- (double)curveRedValueAtTime:(id *)a3
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v5 = (OZChannel *)(pOZChannel + 136);
  }

  return OZChannel::getCurveValue(v5, (const CMTime *)a3, 0);
}

- (double)curveGreenValueAtTime:(id *)a3
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v5 = (OZChannel *)(pOZChannel + 288);
  }

  return OZChannel::getCurveValue(v5, (const CMTime *)a3, 0);
}

- (double)curveBlueValueAtTime:(id *)a3
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v5 = (OZChannel *)(pOZChannel + 440);
  }

  return OZChannel::getCurveValue(v5, (const CMTime *)a3, 0);
}

- (void)setColorAtTime:(id *)a3 curveRed:(double)a4 curveGreen:(double)a5 curveBlue:(double)a6 options:(unsigned int)a7
{
  char v7 = a7;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    uint64_t v13 = (OZChannelColorNoAlpha *)pOZChannel;
  }
  else
  {
    uint64_t v13 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    long long v14 = *MEMORY[0x1E4F1FA48];
    a3->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a3->var0 = v14;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  char v16 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v7 & 1;
  OZChannelColorNoAlpha::getPCColorSpace(v13, (CGColorSpace **)&v21);
  float v17 = a4;
  float v18 = a5;
  float v19 = a6;
  PCColor::PCColor((PCColor *)&v21.var3, v17, v18, v19, &v21);
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v21);
  (*(void (**)(OZChannelBase *__return_ptr, OZChannelColorNoAlpha *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v13 + 336))(&v21, v13, a3);
  v20 = (OZCoreGlobals *)(*(uint64_t (**)(OZChannelColorNoAlpha *, OZChannelBase *, unsigned int *, void))(*(void *)v13 + 840))(v13, &v21, &v21.var3, 0);
  *(unsigned char *)(OZCoreGlobals::getInstance(v20) + 8) = v16;
  PCCFRef<CGColorSpace *>::~PCCFRef((CGColorSpace **)&v21.var9);
}

- (void)setCurveRedValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5 = a5;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v9 = pOZChannel;
  }
  else
  {
    v9 = 0;
  }
  if ((~a4->var2 & 0x11) == 0)
  {
    long long v10 = *MEMORY[0x1E4F1FA48];
    a4->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  char v12 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v9 + 336))(v14, v9, a4);
  uint64_t v13 = (OZCoreGlobals *)(*(uint64_t (**)(void *, void *, void, double))(v9[17] + 712))(v9 + 17, v14, 0, a3);
  *(unsigned char *)(OZCoreGlobals::getInstance(v13) + 8) = v12;
}

- (void)setCurveGreenValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5 = a5;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v9 = pOZChannel;
  }
  else
  {
    v9 = 0;
  }
  if ((~a4->var2 & 0x11) == 0)
  {
    long long v10 = *MEMORY[0x1E4F1FA48];
    a4->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  char v12 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v9 + 336))(v14, v9, a4);
  uint64_t v13 = (OZCoreGlobals *)(*(uint64_t (**)(void *, void *, void, double))(v9[36] + 712))(v9 + 36, v14, 0, a3);
  *(unsigned char *)(OZCoreGlobals::getInstance(v13) + 8) = v12;
}

- (void)setCurveBlueValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5 = a5;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    v9 = pOZChannel;
  }
  else
  {
    v9 = 0;
  }
  if ((~a4->var2 & 0x11) == 0)
  {
    long long v10 = *MEMORY[0x1E4F1FA48];
    a4->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a4->var0 = v10;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  char v12 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v9 + 336))(v14, v9, a4);
  uint64_t v13 = (OZCoreGlobals *)(*(uint64_t (**)(void *, void *, void, double))(v9[55] + 712))(v9 + 55, v14, 0, a3);
  *(unsigned char *)(OZCoreGlobals::getInstance(v13) + 8) = v12;
}

- (id)redChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 136);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)greenChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 288);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)blueChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 440);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

@end