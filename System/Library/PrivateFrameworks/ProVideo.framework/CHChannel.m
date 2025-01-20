@interface CHChannel
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeInOffset;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutOffset;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)globalToLocalTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)localToGlobalTime:(SEL)a3;
- (BOOL)createCurveSegment:(id *)a3 maxTime:(id *)a4 deltaTime:(id *)a5 ease:(BOOL)a6;
- (BOOL)getFirstKeyframeTime:(id *)a3 curveValueAsDouble:(double *)a4;
- (BOOL)getKeyframe:(void *)a3 time:(id *)a4;
- (BOOL)getKeyframe:(void *)a3 time:(id *)a4 value:(double *)a5;
- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveValueAsDouble:(double *)a5;
- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveValueAsDouble:(double *)a5;
- (BOOL)getLastKeyframeTime:(id *)a3 curveValueAsDouble:(double *)a4;
- (BOOL)getTime:(id *)a3 forCurveDoubleValue:(double)a4 inRange:(id *)a5 frameDuration:(id *)a6 options:(unsigned int)a7;
- (BOOL)hasDifferentValuesForRange:(id *)a3;
- (BOOL)hasFadeHandles;
- (BOOL)hasKeyframeAtTime:(id *)a3;
- (BOOL)isPlayingWithScope:(unsigned int *)a3 mode:(unsigned int *)a4 resolution:(id *)a5;
- (BOOL)isRecording;
- (BOOL)moveKeyframe:(void *)a3 toTime:(id *)a4 constrainToOtherKeys:(BOOL)a5;
- (BOOL)moveKeyframeAtTime:(id *)a3 toTime:(id *)a4;
- (BOOL)removeKeyframe:(void *)a3;
- (BOOL)removeKeyframeAtTime:(id *)a3;
- (OZChannel)ozChannel;
- (double)curveValueAsDoubleAtTime:(id *)a3;
- (double)defaultCurveValueAsDouble;
- (double)fadeRatio:(id *)a3;
- (double)initialCurveValueAsDouble;
- (double)maxCurveValueAsDouble;
- (double)minCurveValueAsDouble;
- (double)scale;
- (double)valueAsDoubleAtTime:(id *)a3;
- (id)sliderTransformerName;
- (id)suffix;
- (unint64_t)keyframeCount;
- (unsigned)curveExtrapolation:(unsigned int)a3;
- (unsigned)curveInterpolation;
- (unsigned)fadeInCurve;
- (unsigned)fadeOutCurve;
- (unsigned)segmentInterpolation:(void *)a3;
- (unsigned)segmentSpeed:(void *)a3;
- (void)adjustSegmentSpeed:(void *)a3 offset:(double)a4;
- (void)appendKeyframes:(unsigned int)a3 times:(id *)a4 values:(double *)a5;
- (void)beginPlayback:(id *)a3 scope:(unsigned int)a4 mode:(unsigned int)a5 resolution:(id *)a6;
- (void)beginRecording:(id *)a3;
- (void)endPlayback:(id *)a3;
- (void)endRecording:(id *)a3;
- (void)firstKeyframe;
- (void)getKeyframeInputTangents:(void *)a3 inTanTime:(double *)a4 inTanValue:(double *)a5;
- (void)getKeyframeOutputTangents:(void *)a3 outTanTime:(double *)a4 outTanValue:(double *)a5;
- (void)getKeyframes:(void *)a3 enabledOnly:(BOOL)a4;
- (void)keyframeAtTime:(id *)a3;
- (void)lastKeyframe;
- (void)nextKeyframe:(void *)a3;
- (void)nextKeyframeFromTime:(id *)a3;
- (void)offsetKeyframesInTime:(id *)a3;
- (void)previousKeyframe:(void *)a3;
- (void)previousKeyframeFromTime:(id *)a3;
- (void)registerRecordingCallback:(void *)a3 context:(void *)a4;
- (void)removeAllKeyframes:(unint64_t)a3;
- (void)retimeKeyframesWithScale:(double)a3;
- (void)setCurveExtrapolation:(unsigned int)a3 direction:(unsigned int)a4;
- (void)setCurveInterpolation:(unsigned int)a3;
- (void)setCurveValueWithDouble:(double)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)setFadeInCurve:(unsigned int)a3;
- (void)setFadeInOffset:(id *)a3;
- (void)setFadeOutCurve:(unsigned int)a3;
- (void)setFadeOutOffset:(id *)a3;
- (void)setInitialCurveValueWithDouble:(double)a3;
- (void)setKeyframeInputTangents:(void *)a3 inTanTime:(double)a4 inTanValue:(double)a5;
- (void)setKeyframeOutputTangents:(void *)a3 outTanTime:(double)a4 outTanValue:(double)a5;
- (void)setScale:(double)a3;
- (void)setSegmentInterpolation:(void *)a3 interpolation:(unsigned int)a4;
- (void)setSegmentSpeed:(void *)a3 speed:(unsigned int)a4;
- (void)setSliderTransformerName:(id)a3;
- (void)setSuffix:(id)a3;
- (void)unregisterRecordingCallback:(void *)a3 context:(void *)a4;
@end

@implementation CHChannel

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

- (OZChannel)ozChannel
{
  result = (OZChannel *)self->super._pOZChannel;
  if (result) {
  return result;
  }
}

- (unint64_t)keyframeCount
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  return (*(unsigned int (**)(const void *, SEL))(*(void *)pOZChannel + 832))(pOZChannel, a2);
  }
}

- (BOOL)hasKeyframeAtTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {
  return OZChannel::getKeyframe(pOZChannel, (const CMTime *)a3) != 0;
  }
}

- (void)removeAllKeyframes:(unint64_t)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {
  if (a3)
  }
  {
    v5 = (void (*)(void))*((void *)pOZChannel->var0 + 94);
    v5();
  }
  else
  {
    OZChannel::resetCurve(pOZChannel);
  }
}

- (BOOL)removeKeyframeAtTime:(id *)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(v7, v5, a3);
  return (*(uint64_t (**)(void *, void *, uint64_t))(*(void *)v5 + 744))(v5, v7, 1);
}

- (BOOL)moveKeyframeAtTime:(id *)a3 toTime:(id *)a4
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v7 = 0;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(v10, v7, a3);
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v7 + 336))(v9, v7, a4);
  return (*(uint64_t (**)(void *, void *, void *, uint64_t))(*(void *)v7 + 760))(v7, v10, v9, 1);
}

- (void)retimeKeyframesWithScale:(double)a3
{
  double v3 = a3;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  v5 = *(void (**)(__n128))(*(void *)pOZChannel + 640);
  }
  a3 = v3;

  v5(*(__n128 *)&a3);
}

- (void)offsetKeyframesInTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::linearTimeWarp(pOZChannel, 1.0, (const CMTime *)a3);
}

- (unsigned)curveInterpolation
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getInterpolation(pOZChannel);
}

- (void)setCurveInterpolation:(unsigned int)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  v4 = *(void (**)(void))(*(void *)pOZChannel + 656);
  }

  v4();
}

- (void)setCurveExtrapolation:(unsigned int)a3 direction:(unsigned int)a4
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  v5 = *(void (**)(void))(*(void *)pOZChannel + 384);
  }

  v5();
}

- (unsigned)curveExtrapolation:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getExtrapolation(pOZChannel, v3);
}

- (void)setSegmentInterpolation:(void *)a3 interpolation:(unsigned int)a4
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setKeyframeInterpolation(pOZChannel, a3);
}

- (unsigned)segmentInterpolation:(void *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getKeyframeInterpolation(pOZChannel, a3);
}

- (void)setSegmentSpeed:(void *)a3 speed:(unsigned int)a4
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setCurveSegmentSpeed(pOZChannel, a3);
}

- (unsigned)segmentSpeed:(void *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getCurveSegmentSpeed(pOZChannel, a3);
}

- (void)adjustSegmentSpeed:(void *)a3 offset:(double)a4
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::offsetCurveSegmentSpeed(pOZChannel, a3, a4);
}

- (BOOL)createCurveSegment:(id *)a3 maxTime:(id *)a4 deltaTime:(id *)a5 ease:(BOOL)a6
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v10 = 0;
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v10->var0 + 41))(&v13, v10, a3);
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v10->var0 + 41))(&v12, v10, a4);
  return OZChannel::createCurveSegment(v10, &v13, &v12, (const CMTime *)a5);
}

- (id)sliderTransformerName
{
}

- (void)setSliderTransformerName:(id)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setSliderTransformerName(pOZChannel, (const __CFString *)a3);
}

- (void)beginPlayback:(id *)a3 scope:(unsigned int)a4 mode:(unsigned int)a5 resolution:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v11 = 0;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v11 + 336))(v12, v11, a3);
  (*(void (**)(void *, void *, uint64_t, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v11
                                                                                                  + 160))(v11, v12, v8, v7, a6);
}

- (void)endPlayback:(id *)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(v6, v5, a3);
  (*(void (**)(void *, void *))(*(void *)v5 + 168))(v5, v6);
}

- (void)beginRecording:(id *)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(v6, v5, a3);
  (*(void (**)(void *, void *))(*(void *)v5 + 176))(v5, v6);
}

- (void)endRecording:(id *)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*(void (**)(void *__return_ptr, void *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(void *)v5 + 336))(v6, v5, a3);
  (*(void (**)(void *, void *))(*(void *)v5 + 184))(v5, v6);
}

- (BOOL)isPlayingWithScope:(unsigned int *)a3 mode:(unsigned int *)a4 resolution:(id *)a5
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  v6 = *(uint64_t (**)(void))(*(void *)pOZChannel + 784);
  }

  return v6();
}

- (BOOL)isRecording
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)pOZChannel + 792);
  }

  return v3();
}

- (void)registerRecordingCallback:(void *)a3 context:(void *)a4
{
}

- (void)unregisterRecordingCallback:(void *)a3 context:(void *)a4
{
}

- (void)keyframeAtTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return (void *)OZChannel::getKeyframe(pOZChannel, (const CMTime *)a3);
}

- (BOOL)getKeyframe:(void *)a3 time:(id *)a4
{
  return [(CHChannel *)self getKeyframe:a3 time:a4 value:0];
}

- (BOOL)getKeyframe:(void *)a3 time:(id *)a4 value:(double *)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getKeyframe(pOZChannel, a3, (CMTime *)a4, a5);
}

- (void)firstKeyframe
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return (void *)OZChannel::getFirstEnabledKeyframe(pOZChannel);
}

- (void)lastKeyframe
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return (void *)OZChannel::getLastEnabledKeyframe(pOZChannel);
}

- (void)nextKeyframe:(void *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return (void *)OZChannel::getNextEnabledKeyframe(pOZChannel, a3);
}

- (void)previousKeyframe:(void *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return (void *)OZChannel::getPreviousEnabledKeyframe(pOZChannel, a3);
}

- (void)nextKeyframeFromTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return (void *)OZChannel::getNextEnabledKeyframe(pOZChannel, (const CMTime *)a3);
}

- (void)previousKeyframeFromTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return (void *)OZChannel::getPreviousEnabledKeyframe(pOZChannel, (const CMTime *)a3);
}

- (BOOL)removeKeyframe:(void *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::deleteKeyframe(pOZChannel, a3);
}

- (BOOL)moveKeyframe:(void *)a3 toTime:(id *)a4 constrainToOtherKeys:(BOOL)a5
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  v6 = *(uint64_t (**)(void))(*(void *)pOZChannel + 840);
  }

  return v6();
}

- (void)appendKeyframes:(unsigned int)a3 times:(id *)a4 values:(double *)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::appendKeyframes(pOZChannel, a3, (CMTime *)a4, a5);
}

- (void)getKeyframes:(void *)a3 enabledOnly:(BOOL)a4
{
  BOOL v4 = a4;
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {
  OZChannel::getKeyframes(pOZChannel, v4, &v11);
  }
  uint64_t v7 = v11;
  if (v12 == v11)
  {
    if (!v11) {
      return;
    }
  }
  else
  {
    unint64_t v8 = (v12 - v11) >> 3;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    v9 = (void **)v11;
    do
    {
      v10 = *v9++;
      *a3++ = v10;
      --v8;
    }
    while (v8);
  }
  CMTime v12 = v7;
  operator delete(v7);
}

- (void)setKeyframeInputTangents:(void *)a3 inTanTime:(double)a4 inTanValue:(double)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setKeyframeInputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)setKeyframeOutputTangents:(void *)a3 outTanTime:(double)a4 outTanValue:(double)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setKeyframeOutputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)getKeyframeInputTangents:(void *)a3 inTanTime:(double *)a4 inTanValue:(double *)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::getKeyframeInputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)getKeyframeOutputTangents:(void *)a3 outTanTime:(double *)a4 outTanValue:(double *)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::getKeyframeOutputTangents(pOZChannel, a3, a4, a5, 1);
}

- (void)setFadeInOffset:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setFadeInOffset(pOZChannel, (const CMTime *)a3, 1);
}

- (void)setFadeOutOffset:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setFadeOutOffset(pOZChannel, (const CMTime *)a3, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeInOffset
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::getFadeInOffset(pOZChannel, (__n128 *)retstr);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fadeOutOffset
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)OZChannel::getFadeOutOffset(pOZChannel, (uint64_t)retstr);
}

- (void)setFadeInCurve:(unsigned int)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setFadeInCurve(pOZChannel, a3);
}

- (void)setFadeOutCurve:(unsigned int)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setFadeOutCurve(pOZChannel, a3);
}

- (unsigned)fadeInCurve
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getFadeInCurve(pOZChannel);
}

- (unsigned)fadeOutCurve
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getFadeOutCurve(pOZChannel);
}

- (double)fadeRatio:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getFadeRatio(pOZChannel, (const CMTime *)a3);
}

- (BOOL)hasFadeHandles
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)pOZChannel + 664);
  }

  return v3();
}

- (BOOL)hasDifferentValuesForRange:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {
  long long v5 = *(_OWORD *)&a3->var0.var3;
  }
  *(_OWORD *)&v7.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v7.start.epoch = v5;
  *(_OWORD *)&v7.duration.timescale = *(_OWORD *)&a3->var1.var1;
  return OZChannel::hasDifferentValuesForRange(pOZChannel, &v7);
}

- (double)valueAsDoubleAtTime:(id *)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    long long v5 = 0;
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v5->var0 + 42))(&v7, v5, a3);
  OZChannel::getValueAsDouble(v5, &v7, 0.0);
  return result;
}

- (double)curveValueAsDoubleAtTime:(id *)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getCurveValue(pOZChannel, (const CMTime *)a3, 0);
}

- (void)setCurveValueWithDouble:(double)a3 atTime:(id *)a4 options:(unsigned int)a5
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
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel)
  {
    if (a5) {
      goto LABEL_5;
    }
LABEL_8:
    (*((void (**)(void *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v13->var0 + 42))(v15, v13, a4);
    v14 = (OZCoreGlobals *)(*((uint64_t (**)(OZChannel *, void *, void, double))v13->var0 + 89))(v13, v15, 0, a3);
    goto LABEL_10;
  }
  CMTime v13 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_5:
  if (a5 == 2) {
    v14 = (OZCoreGlobals *)OZChannel::setCurveSegmentValue(v13, (const CMTime *)a4, a3, 1);
  }
  else {
    v14 = (OZCoreGlobals *)OZChannel::setKeyframe(v13, (const CMTime *)a4, a3, 1);
  }
LABEL_10:
  *(unsigned char *)(OZCoreGlobals::getInstance(v14) + 8) = v11;
}

- (double)initialCurveValueAsDouble
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getInitialValue(pOZChannel);
}

- (void)setInitialCurveValueWithDouble:(double)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setInitialValue(pOZChannel, a3, 0);
}

- (double)defaultCurveValueAsDouble
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getDefaultValue(pOZChannel);
}

- (double)minCurveValueAsDouble
{
  (*(void (**)(void))(**(void **)(v2[14] + 8) + 264))();
  return 0.0;
}

- (double)maxCurveValueAsDouble
{
  (*(void (**)(void))(**(void **)(v2[14] + 8) + 256))();
  return 0.0;
}

- (BOOL)getFirstKeyframeTime:(id *)a3 curveValueAsDouble:(double *)a4
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getFirstKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getLastKeyframeTime:(id *)a3 curveValueAsDouble:(double *)a4
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getLastKeyframe(pOZChannel, (CMTime *)a3, a4);
}

- (BOOL)getKeyframeAfterTime:(id *)a3 time:(id *)a4 curveValueAsDouble:(double *)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getNextKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- (BOOL)getKeyframeBeforeTime:(id *)a3 time:(id *)a4 curveValueAsDouble:(double *)a5
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  return OZChannel::getPreviousKeyframe(pOZChannel, (const CMTime *)a3, (CMTime *)a4, a5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)localToGlobalTime:(SEL)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  long long v5 = *(uint64_t (**)(void))(*(void *)pOZChannel + 336);
  }

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v5();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)globalToLocalTime:(SEL)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  long long v5 = *(uint64_t (**)(void))(*(void *)pOZChannel + 328);
  }

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v5();
}

- (BOOL)getTime:(id *)a3 forCurveDoubleValue:(double)a4 inRange:(id *)a5 frameDuration:(id *)a6 options:(unsigned int)a7
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  long long v22 = *(_OWORD *)&a5->var0.var0;
  }
  int64_t var3 = a5->var0.var3;
  long long v24 = *(_OWORD *)&a5->var1.var0;
  int64_t v25 = a5->var1.var3;
  __p = 0;
  v20 = 0;
  uint64_t v21 = 0;
  int64_t v18 = a6->var3;
  long long v17 = *(_OWORD *)&a6->var0;
  char TimeForValue = OZChannel::getTimeForValue(pOZChannel, (uint64_t *)&__p, &v22, &v17, a4);
  char v13 = TimeForValue ^ 1;
  v14 = __p;
  if (!a3) {
    char v13 = 1;
  }
  if ((v13 & 1) == 0)
  {
    long long v15 = *(_OWORD *)__p;
    a3->int64_t var3 = *((void *)__p + 2);
    *(_OWORD *)&a3->var0 = v15;
LABEL_8:
    v20 = v14;
    operator delete(v14);
    return TimeForValue;
  }
  if (__p) {
    goto LABEL_8;
  }
  return TimeForValue;
}

- (id)suffix
{
  return PCString::ns_str(v2);
}

- (void)setSuffix:(id)a3
{
  pOZChannel = self->super._pOZChannel;
  if (pOZChannel) {
  else
  }
    long long v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  OZChannel::setSuffix(v5, &v6);
  PCString::~PCString(&v6);
}

- (double)scale
{
}

- (void)setScale:(double)a3
{
  pOZChannel = (OZChannel *)self->super._pOZChannel;
  if (pOZChannel) {

  }
  OZChannel::setScale(pOZChannel, a3);
}

@end