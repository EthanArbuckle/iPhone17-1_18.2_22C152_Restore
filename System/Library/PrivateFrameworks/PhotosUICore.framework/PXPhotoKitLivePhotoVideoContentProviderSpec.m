@interface PXPhotoKitLivePhotoVideoContentProviderSpec
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)loopTimeRange;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopStartTime;
- (BOOL)stabilizeIfPossible;
- (BOOL)wantsAudio;
- (PXPhotoKitLivePhotoVideoContentProviderSpec)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (void)setCrossfadeDuration:(id *)a3;
- (void)setLoopStartTime:(id *)a3;
- (void)setLoopTimeRange:(id *)a3;
- (void)setStabilizeIfPossible:(BOOL)a3;
- (void)setWantsAudio:(BOOL)a3;
@end

@implementation PXPhotoKitLivePhotoVideoContentProviderSpec

- (void)setWantsAudio:(BOOL)a3
{
  self->_wantsAudio = a3;
}

- (BOOL)wantsAudio
{
  return self->_wantsAudio;
}

- (void)setStabilizeIfPossible:(BOOL)a3
{
  self->_stabilizeIfPossible = a3;
}

- (BOOL)stabilizeIfPossible
{
  return self->_stabilizeIfPossible;
}

- (void)setLoopTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)((char *)&self->_loopTimeRange.duration.value + 4) = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_loopTimeRange.start.flags = v4;
  *(_OWORD *)((char *)&self->_loopStartTime.epoch + 4) = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)loopTimeRange
{
  long long v3 = *(_OWORD *)((char *)&self[1].var1.var0 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var2;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)((char *)&self[1].var1.var3 + 4);
  return self;
}

- (void)setLoopStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_loopStartTime.flags = a3->var3;
  *(_OWORD *)((char *)&self->_crossfadeDuration.epoch + 4) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopStartTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  retstr->var3 = *(int64_t *)((char *)&self[2].var0 + 4);
  return self;
}

- (void)setCrossfadeDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_crossfadeDuration.flags = a3->var3;
  *(_OWORD *)(&self->_wantsAudio + 3) = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)crossfadeDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (id)identifier
{
  long long v3 = NSString;
  [(PXPhotoKitLivePhotoVideoContentProviderSpec *)self crossfadeDuration];
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(PXPhotoKitLivePhotoVideoContentProviderSpec *)self loopTimeRange];
  CMTime v11 = v10;
  Float64 v5 = CMTimeGetSeconds(&v11);
  [(PXPhotoKitLivePhotoVideoContentProviderSpec *)self loopTimeRange];
  CMTime v9 = v8;
  v6 = objc_msgSend(v3, "stringWithFormat:", @"-%f-%f-%f", *(void *)&Seconds, *(void *)&v5, CMTimeGetSeconds(&v9));
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  long long v5 = *(_OWORD *)&self->_loopTimeRange.start.flags;
  long long v6 = *(_OWORD *)((char *)&self->_loopTimeRange.duration.value + 4);
  *(_OWORD *)((char *)result + 60) = *(_OWORD *)((char *)&self->_loopStartTime.epoch + 4);
  *(_OWORD *)((char *)result + 92) = v6;
  *(_OWORD *)((char *)result + 76) = v5;
  *((unsigned char *)result + 8) = self->_stabilizeIfPossible;
  uint64_t v7 = *(void *)&self->_crossfadeDuration.flags;
  *(_OWORD *)((char *)result + 12) = *(_OWORD *)(&self->_wantsAudio + 3);
  *(void *)((char *)result + 28) = v7;
  uint64_t v8 = *(void *)&self->_loopStartTime.flags;
  *(_OWORD *)((char *)result + 36) = *(_OWORD *)((char *)&self->_crossfadeDuration.epoch + 4);
  *(void *)((char *)result + 52) = v8;
  *((unsigned char *)result + 9) = self->_wantsAudio;
  return result;
}

- (PXPhotoKitLivePhotoVideoContentProviderSpec)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitLivePhotoVideoContentProviderSpec;
  id result = [(PXPhotoKitLivePhotoVideoContentProviderSpec *)&v8 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1FA20];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)((char *)&result->_loopStartTime.epoch + 4) = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&result->_loopTimeRange.start.flags = v4;
    *(_OWORD *)((char *)&result->_loopTimeRange.duration.value + 4) = *(_OWORD *)(v3 + 32);
    *(_WORD *)&result->_stabilizeIfPossible = 0;
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    long long v6 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(&result->_wantsAudio + 3) = *MEMORY[0x1E4F1F9F8];
    uint64_t v7 = *(void *)(v5 + 16);
    *(void *)&result->_crossfadeDuration.flags = v7;
    *(_OWORD *)((char *)&result->_crossfadeDuration.epoch + 4) = v6;
    *(void *)&result->_loopStartTime.flags = v7;
  }
  return result;
}

@end