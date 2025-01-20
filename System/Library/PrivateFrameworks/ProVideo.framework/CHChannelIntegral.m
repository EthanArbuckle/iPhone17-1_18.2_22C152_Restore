@interface CHChannelIntegral
- (BOOL)getFirstKeyframeTime:(id *)a3 curveIntValue:(int *)a4;
- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveIntValue:(int *)a5;
- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveIntValue:(int *)a5;
- (BOOL)getLastKeyframeTime:(id *)a3 curveIntValue:(int *)a4;
- (double)_coarseDeltaIntValue;
- (double)_fineDeltaIntValue;
- (int)_curveIntValueAtTime:(id *)a3;
- (int)_defaultCurveIntValue;
- (int)_intValueAtTime:(id *)a3;
- (int)_maxCurveIntValue;
- (int)_maxUIIntValue;
- (int)_minCurveIntValue;
- (int)_minUIIntValue;
- (void)_getExtremaBetweenStart:(id *)a3 end:(id *)a4 minIntValue:(int *)a5 maxIntValue:(int *)a6;
- (void)_setCoarseDeltaIntValue:(int)a3;
- (void)_setCurveIntValue:(int)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)_setDefaultCurveIntValue:(int)a3;
- (void)_setFineDeltaIntValue:(int)a3;
- (void)_setMaxCurveIntValue:(int)a3;
- (void)_setMaxUIIntValue:(int)a3;
- (void)_setMinCurveIntValue:(int)a3;
- (void)_setMinUIIntValue:(int)a3;
@end

@implementation CHChannelIntegral

- (int)_intValueAtTime:(id *)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v5->var0 + 42))(&v7, v5, a3);
  return OZChannel::getValueAsInt(v5, &v7, 0.0);
}

- (int)_curveIntValueAtTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  return (int)OZChannel::getCurveValue(pOZChannel, (const CMTime *)a3, 0);
  }
}

- (void)_getExtremaBetweenStart:(id *)a3 end:(id *)a4 minIntValue:(int *)a5 maxIntValue:(int *)a6
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  double v11 = 0.0;
  }
  double v12 = 0.0;
  (*(void (**)(const void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *, double *, double *))(*(void *)pOZChannel + 824))(pOZChannel, a3, a4, &v12, &v11);
  if (a5) {
    *a5 = (int)v12;
  }
  if (a6) {
    *a6 = (int)v11;
  }
}

- (void)_setCurveIntValue:(int)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  if ((~a4->var2 & 0x11) == 0)
  {
    long long v9 = *MEMORY[0x1E4F1FA48];
    a4->var3 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)&a4->var0 = v9;
  }
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)self);
  char v11 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = a5 & 1;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  {
    if (a5) {
      goto LABEL_5;
    }
LABEL_8:
    (*((void (**)(void *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v13->var0 + 42))(v17, v13, a4);
    v16.n128_f64[0] = (double)a3;
    v15 = (OZCoreGlobals *)(*((uint64_t (**)(OZChannel *, void *, void, __n128))v13->var0 + 89))(v13, v17, 0, v16);
    goto LABEL_10;
  }
  v13 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_5:
  double v14 = (double)a3;
  if (a5 == 2) {
    v15 = (OZCoreGlobals *)OZChannel::setCurveSegmentValue(v13, (const CMTime *)a4, v14, 1);
  }
  else {
    v15 = (OZCoreGlobals *)OZChannel::setKeyframe(v13, (const CMTime *)a4, v14, 1);
  }
LABEL_10:
  *(unsigned char *)(OZCoreGlobals::getInstance(v15) + 8) = v11;
}

- (int)_defaultCurveIntValue
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  return (int)OZChannel::getDefaultValue(pOZChannel);
  }
}

- (void)_setDefaultCurveIntValue:(int)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  int v6 = (*((uint64_t (**)(OZChannel *))v5->var0 + 64))(v5);
  var0 = v5->var0;
  if (v6)
  {
    int v8 = ((uint64_t (*)(OZChannel *))var0[104])(v5);
    OZChannel::setDefaultValue(v5, (double)a3);
    if (v8) {
      return;
    }
  }
  else
  {
    char v9 = ((uint64_t (*)(OZChannel *, uint64_t))var0[62])(v5, 1);
    OZChannel::setDefaultValue(v5, (double)a3);
    if (v9) {
      return;
    }
  }
  v10 = (void (*)(OZChannel *, void))*((void *)v5->var0 + 36);

  v10(v5, 0);
}

- (int)_minCurveIntValue
{
  (*(void (**)(void))(**(void **)(v2[14] + 8) + 264))();
  return (int)0.0;
}

- (void)_setMinCurveIntValue:(int)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setMin(pOZChannel, (double)a3);
}

- (int)_maxCurveIntValue
{
  (*(void (**)(void))(**(void **)(v2[14] + 8) + 256))();
  return (int)0.0;
}

- (void)_setMaxCurveIntValue:(int)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setMax(pOZChannel, (double)a3);
}

- (int)_minUIIntValue
{
}

- (void)_setMinUIIntValue:(int)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setSliderMin(pOZChannel, (double)a3);
}

- (int)_maxUIIntValue
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  return (int)(*(double (**)(const void *, SEL))(*(void *)pOZChannel + 808))(pOZChannel, a2);
  }
}

- (void)_setMaxUIIntValue:(int)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setSliderMax(pOZChannel, (double)a3);
}

- (double)_coarseDeltaIntValue
{
}

- (void)_setCoarseDeltaIntValue:(int)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setCoarseDelta(pOZChannel, (double)a3);
}

- (double)_fineDeltaIntValue
{
}

- (void)_setFineDeltaIntValue:(int)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setFineDelta(pOZChannel, (double)a3);
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveIntValue:(int *)a4
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  double v9 = 0.0;
  }
  int FirstKeyframe = OZChannel::getFirstKeyframe(pOZChannel, (CMTime *)a3, &v9);
  if (a4 && FirstKeyframe) {
    *a4 = (int)v9;
  }
  return FirstKeyframe;
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveIntValue:(int *)a4
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  double v9 = 0.0;
  }
  int LastKeyframe = OZChannel::getLastKeyframe(pOZChannel, (CMTime *)a3, &v9);
  if (a4 && LastKeyframe) {
    *a4 = (int)v9;
  }
  return LastKeyframe;
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveIntValue:(int *)a5
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  double v11 = 0.0;
  }
  int NextKeyframe = OZChannel::getNextKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, &v11);
  if (a5 && NextKeyframe) {
    *a5 = (int)v11;
  }
  return NextKeyframe;
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveIntValue:(int *)a5
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  double v11 = 0.0;
  }
  int PreviousKeyframe = OZChannel::getPreviousKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, &v11);
  if (a5 && PreviousKeyframe) {
    *a5 = (int)v11;
  }
  return PreviousKeyframe;
}

@end