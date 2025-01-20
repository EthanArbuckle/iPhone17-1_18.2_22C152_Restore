@interface PXStoryMockAutoEditDecisionList
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo;
- (BOOL)allowsNUp;
- (NSString)colorGradeCategory;
- (NSString)decisionPapertrail;
- (NSString)diagnosticDescription;
- (PXAudioAsset)song;
- (PXStoryMockAutoEditDecisionList)init;
- (PXStoryMockAutoEditDecisionList)initWithSong:(id)a3;
- (id)clipAtIndex:(int64_t)a3;
- (id)clipForDisplayAsset:(id)a3;
- (int64_t)numberOfClips;
@end

@implementation PXStoryMockAutoEditDecisionList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo
{
  long long v3 = *(_OWORD *)&self[1].var1.var0.var3;
  long long v4 = *(_OWORD *)&self[1].var1.var2.var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var1.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v4;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[1].var1.var2.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1.var0.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  return self;
}

- (BOOL)allowsNUp
{
  return self->_allowsNUp;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (PXAudioAsset)song
{
  return self->_song;
}

- (NSString)colorGradeCategory
{
  return self->_colorGradeCategory;
}

- (NSString)decisionPapertrail
{
  return (NSString *)@"PXStoryMockAutoEditDecisionList papertrail";
}

- (NSString)diagnosticDescription
{
  return (NSString *)@"PXStoryMockAutoEditDecisionList";
}

- (id)clipAtIndex:(int64_t)a3
{
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMockAutoEditDecisionList.m", 44, @"Index (%ld) out of range", a3);

  abort();
}

- (id)clipForDisplayAsset:(id)a3
{
  return 0;
}

- (PXStoryMockAutoEditDecisionList)initWithSong:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryMockAutoEditDecisionList;
  v6 = [(PXStoryMockAutoEditDecisionList *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_numberOfClips = 0;
    uint64_t v8 = [v5 colorGradeCategory];
    colorGradeCategory = v7->_colorGradeCategory;
    v7->_colorGradeCategory = (NSString *)v8;

    objc_storeStrong((id *)&v7->_song, a3);
    CMTimeMakeWithSeconds(&v14, 2.0, 600);
    v7->_defaultDisplayAssetPresentationDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
    v7->_allowsNUp = 0;
    v7->_overallDurationInfo.kind = 4;
    uint64_t v10 = MEMORY[0x1E4F8D280];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 48);
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.preferredDuration.timescale = *(_OWORD *)(MEMORY[0x1E4F8D280] + 32);
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.maximumDuration.value = v11;
    v7->_overallDurationInfo.specificDurationInfo.maximumDuration.epoch = *(void *)(v10 + 64);
    long long v12 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.minimumDuration.value = *(_OWORD *)v10;
    *(_OWORD *)&v7->_overallDurationInfo.specificDurationInfo.minimumDuration.epoch = v12;
    CMTimeMakeWithSeconds(&v14, 1.5, 600);
    v7->_outroDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
  }

  return v7;
}

- (PXStoryMockAutoEditDecisionList)init
{
  return [(PXStoryMockAutoEditDecisionList *)self initWithSong:0];
}

@end