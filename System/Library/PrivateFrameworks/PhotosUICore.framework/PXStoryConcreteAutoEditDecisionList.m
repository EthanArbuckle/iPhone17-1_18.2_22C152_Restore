@interface PXStoryConcreteAutoEditDecisionList
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo;
- (BOOL)allowsNUp;
- (NSString)colorGradeCategory;
- (NSString)decisionPapertrail;
- (NSString)diagnosticDescription;
- (PXAudioAsset)song;
- (PXStoryConcreteAutoEditDecisionList)init;
- (PXStoryConcreteAutoEditDecisionList)initWithColorGradeCategory:(id)a3 song:(id)a4 clipCatalog:(id)a5 constrainedOverallDurationInfo:(id *)a6 outroDuration:(id *)a7 allowsNUp:(BOOL)a8;
- (id)clipAtIndex:(int64_t)a3;
- (id)clipForDisplayAsset:(id)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)numberOfClips;
- (void)enumerateClipsUsingBlock:(id)a3;
@end

@implementation PXStoryConcreteAutoEditDecisionList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_clipCatalog, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
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

- (void)enumerateClipsUsingBlock:(id)a3
{
}

- (id)clipAtIndex:(int64_t)a3
{
  return (id)[(PXStoryAutoEditClipCatalog *)self->_clipCatalog clipAtIndex:a3];
}

- (id)clipForDisplayAsset:(id)a3
{
  return (id)[(PXStoryAutoEditClipCatalog *)self->_clipCatalog clipForDisplayAsset:a3];
}

- (int64_t)numberOfClips
{
  return [(PXStoryAutoEditClipCatalog *)self->_clipCatalog numberOfClips];
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo
{
  p_var1 = &self[1].var1;
  if (!self[1].var1.var0.var0)
  {
    v5 = self;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x6810000000;
    long long v20 = *MEMORY[0x1E4F1FA48];
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v19 = &unk_1AB5D584F;
    uint64_t v21 = v6;
    long long v22 = v20;
    long long v24 = v20;
    uint64_t v23 = v6;
    uint64_t v25 = v6;
    var0 = (void *)self->var1.var0.var0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__PXStoryConcreteAutoEditDecisionList_overallDurationInfo__block_invoke;
    v15[3] = &unk_1E5DC9890;
    v15[4] = &v16;
    [var0 enumerateClipsUsingBlock:v15];
    long long v8 = *((_OWORD *)v17 + 4);
    long long v9 = *((_OWORD *)v17 + 5);
    int64_t v10 = v17[12];
    long long v12 = *((_OWORD *)v17 + 2);
    long long v11 = *((_OWORD *)v17 + 3);
    v5[1].var1.var0.var0 = 1;
    v5[2].var0 = v10;
    *(_OWORD *)&v5[1].var1.var1.var3 = v8;
    *(_OWORD *)&v5[1].var1.var2.var1 = v9;
    *(_OWORD *)&v5[1].var1.var0.var1 = v12;
    *(_OWORD *)&v5[1].var1.var1.var0 = v11;
    _Block_object_dispose(&v16, 8);
  }
  long long v13 = *(_OWORD *)&p_var1->var2.var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&p_var1->var1.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v13;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&p_var1->var2.var3;
  long long v14 = *(_OWORD *)&p_var1->var0.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_var1->var0.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v14;
  return self;
}

double __58__PXStoryConcreteAutoEditDecisionList_overallDurationInfo__block_invoke(uint64_t a1, void *a2)
{
  long long v9 = 0u;
  memset(v10, 0, 56);
  if (a2) {
    [a2 durationInfo];
  }
  CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  *(_OWORD *)&rhs.value = v9;
  rhs.epoch = *(void *)v10;
  CMTimeAdd(&v8, &lhs, &rhs);
  *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v8;
  CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
  CMTime rhs = *(CMTime *)&v10[8];
  CMTimeAdd(&v5, &lhs, &rhs);
  *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 56) = v5;
  CMTime lhs = *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 80);
  CMTime rhs = *(CMTime *)&v10[32];
  CMTimeAdd(&v4, &lhs, &rhs);
  double result = *(double *)&v4.value;
  *(CMTime *)(*(void *)(*(void *)(a1 + 32) + 8) + 80) = v4;
  return result;
}

- (NSString)decisionPapertrail
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__238725;
  long long v12 = __Block_byref_object_dispose__238726;
  id v13 = (id)objc_opt_new();
  [(id)v9[5] appendFormat:@"%@ output\n=================\n", @"Papertrail"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PXStoryConcreteAutoEditDecisionList_decisionPapertrail__block_invoke;
  v5[3] = &unk_1E5DC9868;
  uint64_t v6 = @"Papertrail";
  v7 = &v8;
  [(PXStoryConcreteAutoEditDecisionList *)self enumerateClipsUsingBlock:v5];
  v3 = (void *)[(id)v9[5] copy];

  _Block_object_dispose(&v8, 8);
  return (NSString *)v3;
}

void __57__PXStoryConcreteAutoEditDecisionList_decisionPapertrail__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  CMTime v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v7 = [a2 debugInfo];
  uint64_t v6 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v5 appendFormat:@"\nClip %d:\n=====\n%@", a3, v6];
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"Clip\tStyle\tN\tMin(s)\tPref(s)\tMax(s)\tAudio\tVolume\tJ-Cut\tL-Cut\tFadeIn\tFadeOut\tMotion\tSettings  \tTransition\tDuration\tSettings  \tModule    \tType \n"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PXStoryConcreteAutoEditDecisionList_diagnosticDescription__block_invoke;
  v6[3] = &unk_1E5DC9840;
  id v4 = v3;
  id v7 = v4;
  [(PXStoryConcreteAutoEditDecisionList *)self enumerateClipsUsingBlock:v6];

  return (NSString *)v4;
}

void __60__PXStoryConcreteAutoEditDecisionList_diagnosticDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  CMTime v5 = *(void **)(a1 + 32);
  [v4 playbackStyle];
  uint64_t v6 = PFDisplayAssetPlaybackStyleDescription();
  uint64_t v33 = [v6 stringByPaddingToLength:5 withString:@" " startingAtIndex:0];
  id v7 = [v4 displayAssets];
  uint64_t v8 = [v7 count];
  if (v4)
  {
    [v4 durationInfo];
    *(_OWORD *)&time.value = v84;
    time.epoch = v85;
    Float64 Seconds = CMTimeGetSeconds(&time);
    [v4 durationInfo];
    CMTime v83 = *(CMTime *)((char *)v81 + 8);
    Float64 v9 = CMTimeGetSeconds(&v83);
    [v4 durationInfo];
    CMTime v79 = v78;
    Float64 v10 = CMTimeGetSeconds(&v79);
    [v4 audioInfo];
    uint64_t v11 = v71;
    if ((unint64_t)v71 > 3)
    {
      long long v12 = @"??";
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v88 = 0;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    memset(&time, 0, sizeof(time));
    Float64 Seconds = CMTimeGetSeconds(&time);
    uint64_t v82 = 0;
    long long v80 = 0u;
    memset(v81, 0, sizeof(v81));
    *(_OWORD *)&v83.value = *(_OWORD *)((char *)v81 + 8);
    v83.epoch = 0;
    Float64 v9 = CMTimeGetSeconds(&v83);
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    memset(&v78, 0, sizeof(v78));
    memset(&v79, 0, sizeof(v79));
    Float64 v10 = CMTimeGetSeconds(&v79);
    uint64_t v11 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v74 = 0;
  }
  long long v12 = off_1E5DC5230[v11];
LABEL_6:
  id v13 = v12;
  long long v14 = [(__CFString *)v13 stringByPaddingToLength:5 withString:@" " startingAtIndex:0];
  if (v4)
  {
    [v4 audioInfo];
    [v4 audioInfo];
    uint64_t v15 = *((void *)&v64 + 1);
    [v4 audioInfo];
    uint64_t v16 = v61;
    [v4 audioInfo];
    uint64_t v17 = *((void *)&v57 + 1);
    [v4 audioInfo];
    uint64_t v18 = v54;
    [v4 motionInfo];
    double v19 = *(float *)&v68;
  }
  else
  {
    uint64_t v70 = 0;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v67 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v66 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v62 = 0;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v58 = 0;
    uint64_t v54 = 0;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v51 = 0u;
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    double v19 = 0.0;
    memset(&v50[3], 0, 24);
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  v40 = PFStoryRecipeClipMotionStyleDescription();
  v39 = [v40 stringByPaddingToLength:6 withString:@" " startingAtIndex:0];
  if (v4) {
    [v4 motionInfo];
  }
  else {
    memset(v50, 0, 24);
  }
  v37 = PXStoryAutoEditClipMotionSettingsDescription(v50);
  v34 = [v37 stringByPaddingToLength:10 withString:@" " startingAtIndex:0];
  if (v4)
  {
    [v4 transitionInfo];
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  v35 = PFStoryRecipeClipTransitionKindDescription();
  long long v20 = [v35 stringByPaddingToLength:10 withString:@" " startingAtIndex:0];
  if (v4)
  {
    [v4 transitionInfo];
    uint64_t v21 = *((void *)&v46 + 1);
    [v4 transitionInfo];
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    memset(v45, 0, sizeof(v45));
    uint64_t v21 = 0;
  }
  long long v22 = PXStoryAutoEditClipTransitionSettingsDescription(v45);
  uint64_t v23 = [v22 stringByPaddingToLength:10 withString:@" " startingAtIndex:0];
  unint64_t v24 = [v4 moduleInfo];
  v41 = v5;
  uint64_t v36 = v8;
  if (v24 > 3) {
    uint64_t v25 = @"??";
  }
  else {
    uint64_t v25 = off_1E5DB4F20[v24];
  }
  v26 = v25;
  v27 = [(__CFString *)v26 stringByPaddingToLength:10 withString:@" " startingAtIndex:0];
  [v4 moduleInfo];
  v43 = v7;
  v44 = v6;
  if (v28)
  {
    v29 = (void *)v33;
    v31 = @"start";
  }
  else
  {
    v29 = (void *)v33;
    [v4 moduleInfo];
    if ((v30 & 0x100) != 0) {
      v31 = @"break";
    }
    else {
      v31 = @"--";
    }
  }
  v32 = [(__CFString *)v31 stringByPaddingToLength:5 withString:@" " startingAtIndex:0];
  objc_msgSend(v41, "appendFormat:", @"%4lu\t%@\t%lu\t%6.2f\t%7.2f\t%6.2f\t%@\t%6.2f\t%5.2f\t%5.2f\t%6.2f\t%7.2f\t%@\t%@\t%@\t%8.2f\t%@\t%@\t%@\n", a3, v29, v36, *(void *)&Seconds, *(void *)&v9, *(void *)&v10, v14, *(void *)&v19, v15, v16, v17, v18, v39, v34, v20, v21,
    v23,
    v27,
    v32);
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CMTime v5 = [(PXStoryConcreteAutoEditDecisionList *)self colorGradeCategory];
  uint64_t v6 = [(PXStoryConcreteAutoEditDecisionList *)self song];
  [(PXStoryConcreteAutoEditDecisionList *)self defaultDisplayAssetPresentationDuration];
  Float64 Seconds = CMTimeGetSeconds(&time);
  if ([(PXStoryConcreteAutoEditDecisionList *)self allowsNUp]) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  int64_t v9 = [(PXStoryConcreteAutoEditDecisionList *)self numberOfClips];
  Float64 v10 = [(PXStoryAutoEditClipCatalog *)self->_clipCatalog debugDescription];
  uint64_t v11 = [v3 stringWithFormat:@"<%@:%p - colorGradeCategory: %@, song: %@, default asset duration: %f, allows N-up: %s, number of clips: %ld, clips: %@>", v4, self, v5, v6, *(void *)&Seconds, v8, v9, v10];

  return v11;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CMTime v5 = [(PXStoryConcreteAutoEditDecisionList *)self colorGradeCategory];
  uint64_t v6 = [(PXStoryConcreteAutoEditDecisionList *)self song];
  [(PXStoryConcreteAutoEditDecisionList *)self defaultDisplayAssetPresentationDuration];
  Float64 Seconds = CMTimeGetSeconds(&time);
  if ([(PXStoryConcreteAutoEditDecisionList *)self allowsNUp]) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  int64_t v9 = [v3 stringWithFormat:@"<%@:%p - colorGradeCategory: %@, song: %@, default asset duration: %f, allows N-up: %s, number of clips: %ld>", v4, self, v5, v6, *(void *)&Seconds, v8, -[PXStoryConcreteAutoEditDecisionList numberOfClips](self, "numberOfClips")];

  return v9;
}

- (PXStoryConcreteAutoEditDecisionList)initWithColorGradeCategory:(id)a3 song:(id)a4 clipCatalog:(id)a5 constrainedOverallDurationInfo:(id *)a6 outroDuration:(id *)a7 allowsNUp:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryConcreteAutoEditDecisionList;
  uint64_t v18 = [(PXStoryConcreteAutoEditDecisionList *)&v26 init];
  double v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_colorGradeCategory, a3);
    objc_storeStrong((id *)&v19->_song, a4);
    objc_storeStrong((id *)&v19->_clipCatalog, a5);
    *(_OWORD *)&v19->_overallDurationInfo.kind = *(_OWORD *)&a6->var0;
    long long v20 = *(_OWORD *)&a6->var1.var0.var1;
    long long v21 = *(_OWORD *)&a6->var1.var1.var0;
    long long v22 = *(_OWORD *)&a6->var1.var1.var3;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = *(_OWORD *)&a6->var1.var2.var1;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v22;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v21;
    *(_OWORD *)&v19->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v20;
    CMTimeMakeWithSeconds(&v25, 3.0, 600);
    v19->_defaultDisplayAssetPresentationDuration = ($95D729B680665BEAEFA1D6FCA8238556)v25;
    v19->_allowsNUp = a8;
    long long v23 = *(_OWORD *)&a7->var0;
    v19->_outroDuration.epoch = a7->var3;
    *(_OWORD *)&v19->_outroDuration.value = v23;
  }

  return v19;
}

- (PXStoryConcreteAutoEditDecisionList)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteAutoEditDecisionList.m", 23, @"%s is not available as initializer", "-[PXStoryConcreteAutoEditDecisionList init]");

  abort();
}

@end