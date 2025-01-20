@interface CHChannelShear
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (void)getDefaultCurveX:(double *)a3 curveY:(double *)a4;
- (void)getMaxCurveX:(double *)a3 curveY:(double *)a4;
- (void)getMinCurveX:(double *)a3 curveY:(double *)a4;
- (void)getShearAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5;
- (void)getShearAtTime:(id *)a3 x:(double *)a4 y:(double *)a5;
- (void)ozChannel;
- (void)setDefaultCurveX:(double)a3 curveY:(double)a4;
- (void)setMaxCurveX:(double)a3 curveY:(double)a4;
- (void)setMinCurveX:(double)a3 curveY:(double)a4;
- (void)setShearAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 options:(unsigned int)a6;
@end

@implementation CHChannelShear

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

- (void)getShearAtTime:(id *)a3 x:(double *)a4 y:(double *)a5
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v9 = 0;
  OZChannel::getValueAsDouble((OZChannel *)(v9 + 136), (const CMTime *)a3, 0.0);
  *(void *)a4 = v10;
  OZChannel::getValueAsDouble((OZChannel *)(v9 + 288), (const CMTime *)a3, 0.0);
  *(void *)a5 = v11;
}

- (void)getShearAtTime:(id *)a3 curveX:(double *)a4 curveY:(double *)a5
{
  pOZChannel = self->super.super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v10 = 0;
  memset(&v13, 0, sizeof(v13));
  long long v11 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  [(CHChannelBase *)self convertGlobalToLocal:&v11];
  if (a4) {
    *a4 = OZChannel::getCurveValue((OZChannel *)(v10 + 136), &v13, 0);
  }
  if (a5) {
    *a5 = OZChannel::getCurveValue((OZChannel *)(v10 + 288), &v13, 0);
  }
}

- (void)setShearAtTime:(id *)a3 curveX:(double)a4 curveY:(double)a5 options:(unsigned int)a6
{
  char v6 = a6;
  pOZChannel = (char *)self->super.super.super._pOZChannel;
  if (pOZChannel)
  {
    long long v11 = pOZChannel;
  }
  else
  {
    long long v11 = 0;
  }
  if ((~a3->var2 & 0x11) == 0)
  {
    long long v12 = *MEMORY[0x1E4F1FA48];
    a3->int64_t var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a3->var0 = v12;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)pOZChannel);
  char v14 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v6 & 1;
  OZChannel::setValue((OZChannel *)(v11 + 136), (const CMTime *)a3, a4, 0);
  v15 = (OZCoreGlobals *)OZChannel::setValue((OZChannel *)(v11 + 288), (const CMTime *)a3, a5, 0);
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
    v16 = (void (*)(OZChannel *, void))*((void *)v12->var0 + 36);
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

@end