@interface PXStoryMockPacingCueSource
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (NSArray)cueTimes;
- (PXAudioCueSource)audioCueSource;
- (PXStoryMockPacingCueSource)init;
- (PXStoryMockPacingCueSource)initWithCueTimes:(id)a3;
- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (int64_t)cuesVersion;
- (void)setCuesVersion:(int64_t)a3;
- (void)setCurrentTime:(id *)a3;
@end

@implementation PXStoryMockPacingCueSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cueTimes, 0);
  objc_storeStrong((id *)&self->_audioCueSource, 0);
}

- (void)setCuesVersion:(int64_t)a3
{
  self->_cuesVersion = a3;
}

- (int64_t)cuesVersion
{
  return self->_cuesVersion;
}

- (void)setCurrentTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_currentTime.epoch = a3->var3;
  *(_OWORD *)&self->_currentTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (NSArray)cueTimes
{
  return self->_cueTimes;
}

- (PXAudioCueSource)audioCueSource
{
  return self->_audioCueSource;
}

- (id)diagnosticCueStringForSize:(CGSize)a3 withIndicatorTime:(id *)a4 rangeIndicatorTimeRange:(id *)a5
{
  return @"Mock";
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  return @"Mock";
}

- (PXStoryMockPacingCueSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMockPacingCueSource.m", 35, @"%s is not available as initializer", "-[PXStoryMockPacingCueSource init]");

  abort();
}

- (PXStoryMockPacingCueSource)initWithCueTimes:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryMockPacingCueSource;
  v5 = [(PXStoryMockPacingCueSource *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cueTimes = v5->_cueTimes;
    v5->_cueTimes = (NSArray *)v6;

    uint64_t v8 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&v5->_currentTime.value = *MEMORY[0x1E4F1FA48];
    v5->_currentTime.epoch = *(void *)(v8 + 16);
    v9 = [PXConcreteAudioCueSource alloc];
    uint64_t v10 = [v4 count];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__PXStoryMockPacingCueSource_initWithCueTimes___block_invoke;
    v14[3] = &unk_1E5DB0CD8;
    id v15 = v4;
    uint64_t v11 = [(PXConcreteAudioCueSource *)v9 initWithNumberOfCues:v10 configuration:v14];
    audioCueSource = v5->_audioCueSource;
    v5->_audioCueSource = (PXAudioCueSource *)v11;
  }
  return v5;
}

unint64_t __47__PXStoryMockPacingCueSource_initWithCueTimes___block_invoke(uint64_t a1, CMTime *a2)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      [v6 doubleValue];
      CMTimeMakeWithSeconds(&v8, v7, 600);
      *a2 = v8;

      a2[1].value = 3;
      unint64_t result = [*(id *)(a1 + 32) count];
      a2 = (CMTime *)((char *)a2 + 32);
    }
  }
  return result;
}

@end