@interface CHChannel2D
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)xChannel;
- (id)yChannel;
- (void)getDefaultCurveX:(double *)a3 curveY:(double *)a4;
- (void)getDoubleValuesAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5;
- (void)getDoubleValuesAtTime:(id *)a3 x:(double *)a4 y:(double *)a5;
- (void)getMaxCurveX:(double *)a3 curveY:(double *)a4;
- (void)getMinCurveX:(double *)a3 curveY:(double *)a4;
- (void)offsetDoubleValuesAtTime:(id *)a3 deltaX:(double)a4 deltaY:(double)a5 options:(unsigned int)a6;
- (void)ozChannel;
- (void)setDefaultCurveX:(double)a3 curveY:(double)a4;
- (void)setDoubleValuesAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 options:(unsigned int)a6;
- (void)setMaxCurveX:(double)a3 curveY:(double)a4;
- (void)setMinCurveX:(double)a3 curveY:(double)a4;
@end

@implementation CHChannel2D

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

- (void)getDoubleValuesAtTime:(id *)a3 x:(double *)a4 y:(double *)a5
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v9 = 0;
  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v9 + 336))(&v12, v9, a3);
  if (a4)
  {
    OZChannel::getValueAsDouble((OZChannel *)(v9 + 136), &v12, 0.0);
    *(void *)a4 = v10;
  }
  if (a5)
  {
    OZChannel::getValueAsDouble((OZChannel *)(v9 + 288), &v12, 0.0);
    *(void *)a5 = v11;
  }
}

- (void)getDoubleValuesAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = OZChannel::getCurveValue((OZChannel *)(v9 + 136), (const CMTime *)a3, 0);
LABEL_4:
  if (a5) {
    *a5 = OZChannel::getCurveValue((OZChannel *)(v9 + 288), (const CMTime *)a3, 0);
  }
}

- (void)setDoubleValuesAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 options:(unsigned int)a6
{
  char v6 = a6;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    uint64_t v11 = pOZChannel;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    long long v12 = *MEMORY[0x1E4F1FA48];
    a3->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a3->var0 = v12;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  char v14 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v6 & 1;
  memset(v18, 0, sizeof(v18));
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v11 + 336))(v18, v11, a3);
  uint64_t v16 = v11[17];
  v15 = v11 + 17;
  (*(void (**)(void *, void *, void, double))(v16 + 712))(v15, v18, 0, a4);
  v17 = (OZCoreGlobals *)(*(uint64_t (**)(double))(v15[19] + 712))(a5);
  *(unsigned char *)(OZCoreGlobals::getInstance(v17) + 8) = v14;
}

- (void)offsetDoubleValuesAtTime:(id *)a3 deltaX:(double)a4 deltaY:(double)a5 options:(unsigned int)a6
{
  char v6 = a6;
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    uint64_t v11 = (OZChannel2D *)pOZChannel;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    long long v12 = *MEMORY[0x1E4F1FA48];
    a3->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a3->var0 = v12;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  char v14 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v6 & 1;
  memset(&v16, 0, sizeof(v16));
  (*(void (**)(CMTime *__return_ptr, OZChannel2D *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v11 + 336))(&v16, v11, a3);
  v15 = (OZCoreGlobals *)OZChannel2D::setValueOffsetByBehaviors(v11, &v16, a4, a5);
  *(unsigned char *)(OZCoreGlobals::getInstance(v15) + 8) = v14;
}

- (void)getDefaultCurveX:(double *)a3 curveY:(double *)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v7 = 0;
  if (a3) {
LABEL_3:
  }
    *a3 = OZChannel::getDefaultValue((OZChannel *)(v7 + 136));
LABEL_4:
  if (a4) {
    *a4 = OZChannel::getDefaultValue((OZChannel *)(v7 + 288));
  }
}

- (void)setDefaultCurveX:(double)a3 curveY:(double)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  v8 = (OZChannel *)(v7 + 136);
  int v9 = (*(uint64_t (**)(char *))(*((void *)v7 + 17) + 512))(v7 + 136);
  uint64_t v10 = *((void *)v7 + 17);
  if (v9) {
    int v11 = (*(uint64_t (**)(char *))(v10 + 832))(v7 + 136) == 0;
  }
  else {
    int v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 496))(v7 + 136, 1) ^ 1;
  }
  long long v12 = (OZChannel *)(v7 + 288);
  int v13 = (*(uint64_t (**)(char *))(*((void *)v7 + 36) + 512))(v7 + 288);
  uint64_t v14 = *((void *)v7 + 36);
  if (v13) {
    int v15 = (*(uint64_t (**)(char *))(v14 + 832))(v7 + 288) == 0;
  }
  else {
    int v15 = (*(uint64_t (**)(char *, uint64_t))(v14 + 496))(v7 + 288, 1) ^ 1;
  }
  OZChannel::setDefaultValue(v8, a3);
  OZChannel::setDefaultValue(v12, a4);
  if (v11) {
    (*((void (**)(OZChannel *, void))v8->var0 + 36))(v8, 0);
  }
  if (v15)
  {
    CMTime v16 = (void (*)(OZChannel *, void))*((void *)v12->var0 + 36);
    v16(v12, 0);
  }
}

- (void)getMinCurveX:(double *)a3 curveY:(double *)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v7 = 0;
  if (a3)
  {
LABEL_3:
    uint64_t v8 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v7[31] + 8) + 264))(*(void *)(v7[31] + 8), &v8);
    *(void *)a3 = v8;
  }
LABEL_4:
  if (a4)
  {
    uint64_t v8 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v7[50] + 8) + 264))(*(void *)(v7[50] + 8), &v8);
    *(void *)a4 = v8;
  }
}

- (void)setMinCurveX:(double)a3 curveY:(double)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  OZChannel::setMin((OZChannel *)(v7 + 136), a3);

  OZChannel::setMin((OZChannel *)(v7 + 288), a4);
}

- (void)getMaxCurveX:(double *)a3 curveY:(double *)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v7 = 0;
  if (a3)
  {
LABEL_3:
    uint64_t v8 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v7[31] + 8) + 256))(*(void *)(v7[31] + 8), &v8);
    *(void *)a3 = v8;
  }
LABEL_4:
  if (a4)
  {
    uint64_t v8 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v7[50] + 8) + 256))(*(void *)(v7[50] + 8), &v8);
    *(void *)a4 = v8;
  }
}

- (void)setMaxCurveX:(double)a3 curveY:(double)a4
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  OZChannel::setMax((OZChannel *)(v7 + 136), a3);

  OZChannel::setMax((OZChannel *)(v7 + 288), a4);
}

- (id)xChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 136);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

- (id)yChannel
{
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 288);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

@end