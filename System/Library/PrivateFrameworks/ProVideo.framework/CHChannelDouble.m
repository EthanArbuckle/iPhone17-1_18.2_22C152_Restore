@interface CHChannelDouble
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (BOOL)getFirstKeyframeTime:(id *)a3 curveDoubleValue:(double *)a4;
- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveDoubleValue:(double *)a5;
- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveDoubleValue:(double *)a5;
- (BOOL)getLastKeyframeTime:(id *)a3 curveDoubleValue:(double *)a4;
- (double)coarseDeltaDoubleValue;
- (double)curveDoubleValueAtTime:(id *)a3;
- (double)defaultCurveDoubleValue;
- (double)doubleValueAtTime:(id *)a3;
- (double)fineDeltaDoubleValue;
- (double)maxCurveDoubleValue;
- (double)maxUIDoubleValue;
- (double)minCurveDoubleValue;
- (double)minUIDoubleValue;
- (unsigned)getCurveSamples:(id *)a3 delta:(id *)a4 numberOfSamples:(unsigned int)a5 samplesX:(void *)a6 samplesY:(void *)a7;
- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minDoubleValue:(double *)a5 maxDoubleValue:(double *)a6;
- (void)setCoarseDeltaDoubleValue:(double)a3;
- (void)setCurveDoubleValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)setDefaultCurveDoubleValue:(double)a3;
- (void)setFineDeltaDoubleValue:(double)a3;
- (void)setKeyframesFromTime:(id *)a3 fromMap:(void *)a4 frameDuration:(id *)a5;
- (void)setMaxCurveDoubleValue:(double)a3;
- (void)setMaxUIDoubleValue:(double)a3;
- (void)setMinCurveDoubleValue:(double)a3;
- (void)setMinUIDoubleValue:(double)a3;
@end

@implementation CHChannelDouble

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (double)doubleValueAtTime:(id *)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v5->var0 + 42))(&v7, v5, a3);
  OZChannel::getValueAsDouble(v5, &v7, 0.0);
  return result;
}

- (double)curveDoubleValueAtTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getCurveValue(pOZChannel, (const CMTime *)a3, 0);
}

- (void)getExtremaBetweenStart:(id *)a3 end:(id *)a4 minDoubleValue:(double *)a5 maxDoubleValue:(double *)a6
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  CMTime v7 = *(void (**)(void))(*(void *)pOZChannel + 824);
  }

  v7();
}

- (void)setCurveDoubleValue:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  [(CHChannel *)self setCurveValueWithDouble:&v5 atTime:*(void *)&a5 options:a3];
}

- (double)defaultCurveDoubleValue
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getDefaultValue(pOZChannel);
}

- (void)setDefaultCurveDoubleValue:(double)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = 0;
  int v6 = (*((uint64_t (**)(OZChannel *))v5->var0 + 64))(v5);
  var0 = v5->var0;
  if (v6)
  {
    int v8 = ((uint64_t (*)(OZChannel *))var0[104])(v5);
    OZChannel::setDefaultValue(v5, a3);
    if (v8) {
      return;
    }
  }
  else
  {
    char v9 = ((uint64_t (*)(OZChannel *, uint64_t))var0[62])(v5, 1);
    OZChannel::setDefaultValue(v5, a3);
    if (v9) {
      return;
    }
  }
  v10 = (void (*)(OZChannel *, void))*((void *)v5->var0 + 36);

  v10(v5, 0);
}

- (double)minCurveDoubleValue
{
  (*(void (**)(void))(**(void **)(v2[14] + 8) + 264))();
  return 0.0;
}

- (void)setMinCurveDoubleValue:(double)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setMin(pOZChannel, a3);
}

- (double)maxCurveDoubleValue
{
  (*(void (**)(void))(**(void **)(v2[14] + 8) + 256))();
  return 0.0;
}

- (void)setMaxCurveDoubleValue:(double)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setMax(pOZChannel, a3);
}

- (double)minUIDoubleValue
{
}

- (void)setMinUIDoubleValue:(double)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setSliderMin(pOZChannel, a3);
}

- (double)maxUIDoubleValue
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  v3 = *(void (**)(void))(*(void *)pOZChannel + 808);
  }

  v3();
  return result;
}

- (void)setMaxUIDoubleValue:(double)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setSliderMax(pOZChannel, a3);
}

- (double)coarseDeltaDoubleValue
{
}

- (void)setCoarseDeltaDoubleValue:(double)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setCoarseDelta(pOZChannel, a3);
}

- (double)fineDeltaDoubleValue
{
}

- (void)setFineDeltaDoubleValue:(double)a3
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setFineDelta(pOZChannel, a3);
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveDoubleValue:(double *)a4
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getFirstKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveDoubleValue:(double *)a4
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getLastKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveDoubleValue:(double *)a5
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getNextKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveDoubleValue:(double *)a5
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getPreviousKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- (unsigned)getCurveSamples:(id *)a3 delta:(id *)a4 numberOfSamples:(unsigned int)a5 samplesX:(void *)a6 samplesY:(void *)a7
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  OZChannel::getSamples((uint64_t)pOZChannel);
  }
  return a5;
}

- (void)setKeyframesFromTime:(id *)a3 fromMap:(void *)a4 frameDuration:(id *)a5
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannelBase::setKeyframesWithChannelRef((uint64_t)pOZChannel, (CMTime *)a3, (uint64_t)a5, a4, 1);
}

@end