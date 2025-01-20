@interface CHChannelPosition3D
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (id)zChannel;
- (void)getDefaultCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5;
- (void)getMaxCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5;
- (void)getMinCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5;
- (void)getPositionAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5 curveZ:(double *)a6;
- (void)getPositionAtTime:(id *)a3 x:(double *)a4 y:(double *)a5 z:(double *)a6;
- (void)offsetPositionAtTime:(id *)a3 deltaX:(double)a4 deltaY:(double)a5 deltaZ:(double)a6 options:(unsigned int)a7;
- (void)ozChannel;
- (void)setDefaultCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5;
- (void)setDoubleValuesAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 curveZ:(double)a6 options:(unsigned int)a7;
- (void)setMaxCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5;
- (void)setMinCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5;
@end

@implementation CHChannelPosition3D

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (void)ozChannel
{
  result = self->super.super.super.super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (void)getPositionAtTime:(id *)a3 x:(double *)a4 y:(double *)a5 z:(double *)a6
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v11 = 0;
  (*(void (**)(CMTime *__return_ptr, char *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v11 + 336))(&v15, v11, a3);
  if (a4)
  {
    OZChannel::getValueAsDouble((OZChannel *)(v11 + 136), &v15, 0.0);
    *(void *)a4 = v12;
  }
  if (a5)
  {
    OZChannel::getValueAsDouble((OZChannel *)(v11 + 288), &v15, 0.0);
    *(void *)a5 = v13;
  }
  if (a6)
  {
    OZChannel::getValueAsDouble((OZChannel *)(v11 + 736), &v15, 0.0);
    *(void *)a6 = v14;
  }
}

- (void)getPositionAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5 curveZ:(double *)a6
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v11 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = OZChannel::getCurveValue((OZChannel *)(v11 + 136), (const CMTime *)a3, 0);
LABEL_4:
  if (a5) {
    *a5 = OZChannel::getCurveValue((OZChannel *)(v11 + 288), (const CMTime *)a3, 0);
  }
  if (a6) {
    *a6 = OZChannel::getCurveValue((OZChannel *)(v11 + 736), (const CMTime *)a3, 0);
  }
}

- (void)setDoubleValuesAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 curveZ:(double)a6 options:(unsigned int)a7
{
  char v7 = a7;
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    uint64_t v13 = pOZChannel;
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
  memset(v20, 0, sizeof(v20));
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*v13 + 336))(v20, v13, a3);
  uint64_t v18 = v13[17];
  v17 = v13 + 17;
  (*(void (**)(void *, void *, void, double))(v18 + 712))(v17, v20, 0, a4);
  (*(void (**)(double))(v17[19] + 712))(a5);
  v19 = (OZCoreGlobals *)(*(uint64_t (**)(double))(v17[75] + 712))(a6);
  *(unsigned char *)(OZCoreGlobals::getInstance(v19) + 8) = v16;
}

- (void)offsetPositionAtTime:(id *)a3 deltaX:(double)a4 deltaY:(double)a5 deltaZ:(double)a6 options:(unsigned int)a7
{
  char v7 = a7;
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    uint64_t v13 = (OZChannelPosition3D *)pOZChannel;
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
  memset(&v18, 0, sizeof(v18));
  (*(void (**)(CMTime *__return_ptr, OZChannelPosition3D *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v13 + 336))(&v18, v13, a3);
  v17 = (OZCoreGlobals *)OZChannelPosition3D::offsetPosition(v13, &v18, a4, a5, a6, 1);
  *(unsigned char *)(OZCoreGlobals::getInstance(v17) + 8) = v16;
}

- (void)getDefaultCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
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
    *a5 = OZChannel::getDefaultValue((OZChannel *)(v9 + 736));
  }
}

- (void)setDefaultCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v9 = 0;
  v10 = (OZChannel *)(v9 + 17);
  int v11 = (*(uint64_t (**)(void *))(v9[17] + 512))(v9 + 17);
  uint64_t v12 = v9[17];
  if (v11) {
    int v13 = (*(uint64_t (**)(void *))(v12 + 832))(v9 + 17) == 0;
  }
  else {
    int v13 = (*(uint64_t (**)(void *, uint64_t))(v12 + 496))(v9 + 17, 1) ^ 1;
  }
  long long v14 = (OZChannel *)(v9 + 36);
  int v15 = (*(uint64_t (**)(void *))(v9[36] + 512))(v9 + 36);
  uint64_t v16 = v9[36];
  if (v15) {
    int v17 = (*(uint64_t (**)(void *))(v16 + 832))(v9 + 36) == 0;
  }
  else {
    int v17 = (*(uint64_t (**)(void *, uint64_t))(v16 + 496))(v9 + 36, 1) ^ 1;
  }
  CMTime v18 = (OZChannel *)(v9 + 92);
  int v19 = (*(uint64_t (**)(void *))(v9[92] + 512))(v9 + 92);
  uint64_t v20 = v9[92];
  if (v19) {
    int v21 = (*(uint64_t (**)(void *))(v20 + 832))(v9 + 92) == 0;
  }
  else {
    int v21 = (*(uint64_t (**)(void *, uint64_t))(v20 + 496))(v9 + 92, 1) ^ 1;
  }
  OZChannel::setDefaultValue(v10, a3);
  OZChannel::setDefaultValue(v14, a4);
  OZChannel::setDefaultValue(v18, a5);
  if (!v13)
  {
    if (!v17) {
      goto LABEL_15;
    }
LABEL_20:
    (*((void (**)(OZChannel *, void))v14->var0 + 36))(v14, 0);
    if (!v21) {
      return;
    }
    goto LABEL_16;
  }
  (*((void (**)(OZChannel *, void))v10->var0 + 36))(v10, 0);
  if (v17) {
    goto LABEL_20;
  }
LABEL_15:
  if (!v21) {
    return;
  }
LABEL_16:
  v22 = (void (*)(OZChannel *, void))*((void *)v18->var0 + 36);

  v22(v18, 0);
}

- (void)getMinCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = 0;
  if (a3)
  {
LABEL_3:
    uint64_t v10 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v9[31] + 8) + 264))(*(void *)(v9[31] + 8), &v10);
    *(void *)a3 = v10;
  }
LABEL_4:
  if (a4)
  {
    uint64_t v10 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v9[50] + 8) + 264))(*(void *)(v9[50] + 8), &v10);
    *(void *)a4 = v10;
  }
  if (a5)
  {
    uint64_t v10 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v9[106] + 8) + 264))(*(void *)(v9[106] + 8), &v10);
    *(void *)a5 = v10;
  }
}

- (void)setMinCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v9 = 0;
  OZChannel::setMin((OZChannel *)(v9 + 136), a3);
  OZChannel::setMin((OZChannel *)(v9 + 288), a4);

  OZChannel::setMin((OZChannel *)(v9 + 736), a5);
}

- (void)getMaxCurveX:(double *)a3 curveY:(double *)a4 curveZ:(double *)a5
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v9 = 0;
  if (a3)
  {
LABEL_3:
    uint64_t v10 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v9[31] + 8) + 256))(*(void *)(v9[31] + 8), &v10);
    *(void *)a3 = v10;
  }
LABEL_4:
  if (a4)
  {
    uint64_t v10 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v9[50] + 8) + 256))(*(void *)(v9[50] + 8), &v10);
    *(void *)a4 = v10;
  }
  if (a5)
  {
    uint64_t v10 = 0;
    (*(void (**)(void, uint64_t *))(**(void **)(v9[106] + 8) + 256))(*(void *)(v9[106] + 8), &v10);
    *(void *)a5 = v10;
  }
}

- (void)setMaxCurveX:(double)a3 curveY:(double)a4 curveZ:(double)a5
{
  pOZChannel = self->super.super.super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v9 = 0;
  OZChannel::setMax((OZChannel *)(v9 + 136), a3);
  OZChannel::setMax((OZChannel *)(v9 + 288), a4);

  OZChannel::setMax((OZChannel *)(v9 + 736), a5);
}

- (id)zChannel
{
  pOZChannel = (char *)self->super.super.super.super.super._pOZChannel;
  if (pOZChannel) {
  v3 = (OZChannelBase *)(pOZChannel + 736);
  }

  return CHChannelWrapperForOZChannel(v3, 0);
}

@end