@interface PXVideoStabilizeOperationSpec
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (BOOL)abortIfStabilizationFails;
- (BOOL)performStabilization;
- (BOOL)wantsAudio;
- (PXVideoStabilizationRecipeSource)recipeSource;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAbortIfStabilizationFails:(BOOL)a3;
- (void)setCrossfadeDuration:(id *)a3;
- (void)setPerformStabilization:(BOOL)a3;
- (void)setRecipeSource:(id)a3;
- (void)setStartTime:(id *)a3;
- (void)setTimeRange:(id *)a3;
- (void)setWantsAudio:(BOOL)a3;
@end

@implementation PXVideoStabilizeOperationSpec

- (void).cxx_destruct
{
}

- (void)setWantsAudio:(BOOL)a3
{
  self->_wantsAudio = a3;
}

- (BOOL)wantsAudio
{
  return self->_wantsAudio;
}

- (void)setAbortIfStabilizationFails:(BOOL)a3
{
  self->_abortIfStabilizationFails = a3;
}

- (BOOL)abortIfStabilizationFails
{
  return self->_abortIfStabilizationFails;
}

- (void)setPerformStabilization:(BOOL)a3
{
  self->_performStabilization = a3;
}

- (BOOL)performStabilization
{
  return self->_performStabilization;
}

- (void)setCrossfadeDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_crossfadeDuration.value = *(_OWORD *)&a3->var0;
  self->_crossfadeDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var0.int64_t var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var1;
  return self;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setRecipeSource:(id)a3
{
}

- (PXVideoStabilizationRecipeSource)recipeSource
{
  return self->_recipeSource;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXVideoStabilizeOperationSpec;
  long long v4 = [(PXVideoProcessingOperationSpec *)&v10 copyWithZone:a3];
  objc_storeStrong((id *)v4 + 5, self->_recipeSource);
  long long v5 = *(_OWORD *)&self->_startTime.value;
  *((void *)v4 + 8) = self->_startTime.epoch;
  *((_OWORD *)v4 + 3) = v5;
  long long v6 = *(_OWORD *)&self->_timeRange.start.value;
  long long v7 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *((_OWORD *)v4 + 7) = *(_OWORD *)&self->_timeRange.start.epoch;
  *((_OWORD *)v4 + 8) = v7;
  *((_OWORD *)v4 + 6) = v6;
  int64_t epoch = self->_crossfadeDuration.epoch;
  *(_OWORD *)(v4 + 72) = *(_OWORD *)&self->_crossfadeDuration.value;
  *((void *)v4 + 11) = epoch;
  v4[32] = self->_performStabilization;
  v4[33] = self->_abortIfStabilizationFails;
  v4[34] = self->_wantsAudio;
  return v4;
}

@end