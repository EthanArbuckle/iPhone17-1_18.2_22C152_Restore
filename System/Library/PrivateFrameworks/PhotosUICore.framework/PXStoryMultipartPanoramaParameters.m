@interface PXStoryMultipartPanoramaParameters
- ($0669C38B7D90FA3F997999461B0EDF00)normalizedKenBurnsEffectParameters;
- ($4ED8D8201E282D104BC63FC4BF259532)partDurationInfo;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo;
- (PXStoryMultipartPanoramaParameters)init;
- (PXStoryMultipartPanoramaParameters)initWithNormalizedKenBurnsEffectParameters:(id *)a3 partDurationInfo:(id *)a4 transitionInfo:(id *)a5;
@end

@implementation PXStoryMultipartPanoramaParameters

- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo
{
  long long v3 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(double *)&retstr->var3 = self->var5.var0;
  return self;
}

- ($4ED8D8201E282D104BC63FC4BF259532)partDurationInfo
{
  long long v3 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)&self[1].var3.var1;
  *(_OWORD *)&retstr->var3.var0.var1 = v3;
  *(_OWORD *)&retstr->var3.var1 = *(_OWORD *)&self[2].var0.var3;
  long long v4 = *(_OWORD *)&self[1].var2.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v4;
  long long v5 = *(_OWORD *)&self[1].var3.var0.var1;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var2.var3;
  *(_OWORD *)&retstr->var2.var0 = v5;
  return self;
}

- ($0669C38B7D90FA3F997999461B0EDF00)normalizedKenBurnsEffectParameters
{
  long long v3 = *(_OWORD *)&self[1].var0.var0.a;
  *(_OWORD *)&retstr->var0.var0.tx = *(_OWORD *)&self->var1.var0.tx;
  *(_OWORD *)&retstr->var1.var0.a = v3;
  long long v4 = *(_OWORD *)&self[1].var0.var0.tx;
  *(_OWORD *)&retstr->var1.var0.c = *(_OWORD *)&self[1].var0.var0.c;
  *(_OWORD *)&retstr->var1.var0.tx = v4;
  long long v5 = *(_OWORD *)&self->var1.var0.c;
  *(_OWORD *)&retstr->var0.var0.a = *(_OWORD *)&self->var1.var0.a;
  *(_OWORD *)&retstr->var0.var0.c = v5;
  return self;
}

- (PXStoryMultipartPanoramaParameters)initWithNormalizedKenBurnsEffectParameters:(id *)a3 partDurationInfo:(id *)a4 transitionInfo:(id *)a5
{
  v20.receiver = self;
  v20.super_class = (Class)PXStoryMultipartPanoramaParameters;
  result = [(PXStoryMultipartPanoramaParameters *)&v20 init];
  if (result)
  {
    long long v9 = *(_OWORD *)&a3->var0.var0.c;
    *(_OWORD *)&result->_transitionInfo.var1.scaleRelativeFactor = *(_OWORD *)&a3->var0.var0.a;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.s.t.b = v9;
    long long v10 = *(_OWORD *)&a3->var0.var0.tx;
    long long v11 = *(_OWORD *)&a3->var1.var0.a;
    long long v12 = *(_OWORD *)&a3->var1.var0.tx;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.t.t.b = *(_OWORD *)&a3->var1.var0.c;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.t.t.d = v12;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.s.t.d = v10;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.s.t.ty = v11;
    long long v13 = *(_OWORD *)&a4->var3.var1;
    long long v15 = *(_OWORD *)&a4->var2.var0;
    long long v14 = *(_OWORD *)&a4->var2.var3;
    *(_OWORD *)&result->_partDurationInfo.preferredCue.time.value = *(_OWORD *)&a4->var3.var0.var1;
    *(_OWORD *)&result->_partDurationInfo.preferredCue.time.epoch = v13;
    *(_OWORD *)&result->_partDurationInfo.preferredDuration.epoch = v15;
    *(_OWORD *)&result->_partDurationInfo.maximumDuration.timescale = v14;
    long long v16 = *(_OWORD *)&a4->var0.var0;
    long long v17 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&result->_partDurationInfo.minimumDuration.timescale = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&result->_partDurationInfo.preferredDuration.value = v17;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.t.t.ty = v16;
    long long v18 = *(_OWORD *)&a5->var0;
    long long v19 = *(_OWORD *)&a5->var2.var1;
    *(void *)&result->_transitionInfo.fallbackFromTransitionKind = *(void *)&a5->var3;
    *(_OWORD *)&result->_transitionInfo.duration.timescale = v19;
    *(_OWORD *)&result->_transitionInfo.orderOutTransition = v18;
  }
  return result;
}

- (PXStoryMultipartPanoramaParameters)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMultipartPanoramaParameters.m", 17, @"%s is not available as initializer", "-[PXStoryMultipartPanoramaParameters init]");

  abort();
}

@end