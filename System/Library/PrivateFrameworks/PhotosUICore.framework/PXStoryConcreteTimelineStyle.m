@interface PXStoryConcreteTimelineStyle
- ($01BB1521EC52D44A8E7628F5261DCEC8)_kenBurnsMotionParametersForDuration:(double)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationForVerticallyPanningPortraitAsset:(SEL)a3 atSpeed:(id)a4 motionInfo:(double)a5 minimumDuration:(id *)a6 croppingContext:(id *)a7;
- ($4ED8D8201E282D104BC63FC4BF259532)_durationInfoForClip:(SEL)a3 startTime:(id)a4 croppingContext:(id *)a5;
- ($4ED8D8201E282D104BC63FC4BF259532)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4;
- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3;
- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfoForDisplayAsset:(SEL)a3;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)_transitionInfoForClip:(SEL)a3 isKeyAsset:(id)a4;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4;
- (BOOL)allowsIncompleteTimelines;
- (BOOL)allowsKenBurnsAnimations;
- (BOOL)allowsMultipartPanoramaForDisplayAsset:(id)a3 startTime:(id *)a4;
- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3;
- (PXStoryConcreteTimelineStyle)init;
- (PXStoryConcreteTimelineStyle)initWithSpec:(id)a3 audioAsset:(id)a4 cueSource:(id)a5 overallDurationInfo:(id *)a6 autoEditDecisionList:(id)a7 autoEditConfiguration:(id)a8 allowedKeyAssetClipCompositions:(id)a9 allowedClipCompositions:(id)a10 randomNumberGenerators:(id)a11 errorReporter:(id)a12 allowsIncompleteTimelines:(BOOL)a13 styleOptions:(id)a14 storyConfiguration:(id)a15;
- (PXStoryConfiguration)storyConfiguration;
- (PXStoryMultipartPanoramaParameters)defaultHorizontalMultipartPanoramaParameters;
- (PXStoryMultipartPanoramaParameters)defaultVerticalMultipartPanoramaParameters;
- (double)composabilityScoreForSegmentWithDisplayAssets:(id)a3;
- (double)effectiveMovementDurationForDurationInfo:(id *)a3;
- (id)_clipForDisplayAsset:(id)a3;
- (id)_clipForDisplayAssets:(id)a3;
- (id)allowedClipCompositionsWithStartTime:(id *)a3 nextDisplayAssets:(id)a4;
- (id)clipCompositionForKeyAsset:(id)a3 contentInfo:(id *)a4 finalPlaybackStyle:(int64_t)a5;
- (id)sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:(id)a3 startTime:(id *)a4 proposedCropContentsRects:(id)a5 axis:(int64_t)a6 normalizedKenBurnsEffectParameters:(id *)a7 durationInfos:(id *)a8 transitionInfos:(id *)a9;
- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3;
- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4;
- (void)_ensureDefaultMultipartPanoramaParameters;
- (void)_getOneUpKenBurnsParameters:(id *)a3 forDisplayAsset:(id)a4 motionInfo:(id *)a5 motionParameters:(id *)a6 factory:(id)a7;
- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12;
- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9;
@end

@implementation PXStoryConcreteTimelineStyle

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storyConfiguration);
  objc_storeStrong((id *)&self->_defaultVerticalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_defaultHorizontalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_autoEditConfiguration, 0);
  objc_storeStrong((id *)&self->_fallbackMotionStyleProvider, 0);
  objc_storeStrong((id *)&self->_fallbackTransitionProvider, 0);
  objc_storeStrong((id *)&self->_lock_clipByAssetUUID, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositions, 0);
  objc_storeStrong((id *)&self->_allowedKeyAssetClipCompositions, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_possibleFallbackTransitionKinds, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (PXStoryConfiguration)storyConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storyConfiguration);
  return (PXStoryConfiguration *)WeakRetained;
}

- (BOOL)allowsIncompleteTimelines
{
  return self->_allowsIncompleteTimelines;
}

- (id)sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:(id)a3 startTime:(id *)a4 proposedCropContentsRects:(id)a5 axis:(int64_t)a6 normalizedKenBurnsEffectParameters:(id *)a7 durationInfos:(id *)a8 transitionInfos:(id *)a9
{
  id v14 = a3;
  if (a6 == 1)
  {
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 1;
    if (self->_isRTL) {
      uint64_t v15 = -1;
    }
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __198__PXStoryConcreteTimelineStyle_sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset_startTime_proposedCropContentsRects_axis_normalizedKenBurnsEffectParameters_durationInfos_transitionInfos___block_invoke;
  v38[3] = &__block_descriptor_48_e29_q24__0__NSValue_8__NSValue_16l;
  v38[4] = a6;
  v38[5] = v15;
  v16 = [a5 sortedArrayUsingComparator:v38];
  uint64_t v17 = [v16 count];
  v18 = [(PXStoryConcreteTimelineStyle *)self _clipForDisplayAsset:v14];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  v19 = [v14 resourcesDataSource];
  v20 = [v19 croppingContext];
  long long v28 = *(_OWORD *)&a4->var0;
  *(void *)&long long v29 = a4->var3;
  [(PXStoryConcreteTimelineStyle *)self _durationInfoForClip:v18 startTime:&v28 croppingContext:v20];

  if (v17 >= 1)
  {
    uint64_t v21 = v17;
    do
    {
      long long v22 = v36;
      *(_OWORD *)&a8->var2.var3 = v35;
      *(_OWORD *)&a8->var3.var0.var1 = v22;
      *(_OWORD *)&a8->var3.var1 = v37;
      long long v23 = v32;
      *(_OWORD *)&a8->var0.var0 = v31;
      *(_OWORD *)&a8->var0.var3 = v23;
      long long v24 = v34;
      *(_OWORD *)&a8->var1.var1 = v33;
      *(_OWORD *)&a8->var2.var0 = v24;
      ++a8;
      --v21;
    }
    while (v21);
  }
  v25 = &a9->var0 + 40 * v17;
  -[PXStoryConcreteTimelineStyle _transitionInfoForClip:isKeyAsset:](self, "_transitionInfoForClip:isKeyAsset:", v18, [v14 resourceIndex] == -1);
  long long v26 = v29;
  *(_OWORD *)(v25 - 40) = v28;
  *(_OWORD *)(v25 - 24) = v26;
  *((void *)v25 - 1) = v30;

  return v16;
}

void __198__PXStoryConcreteTimelineStyle_sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset_startTime_proposedCropContentsRects_axis_normalizedKenBurnsEffectParameters_durationInfos_transitionInfos___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 CGRectValue];
  PXRectGetMidForAxis();
}

- (BOOL)allowsMultipartPanoramaForDisplayAsset:(id)a3 startTime:(id *)a4
{
  id v4 = a3;
  if ([v4 mediaType] == 1) {
    BOOL v5 = [v4 mediaSubtypes] & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (PXStoryMultipartPanoramaParameters)defaultVerticalMultipartPanoramaParameters
{
  [(PXStoryConcreteTimelineStyle *)self _ensureDefaultMultipartPanoramaParameters];
  defaultVerticalMultipartPanoramaParameters = self->_defaultVerticalMultipartPanoramaParameters;
  return defaultVerticalMultipartPanoramaParameters;
}

- (PXStoryMultipartPanoramaParameters)defaultHorizontalMultipartPanoramaParameters
{
  [(PXStoryConcreteTimelineStyle *)self _ensureDefaultMultipartPanoramaParameters];
  defaultHorizontalMultipartPanoramaParameters = self->_defaultHorizontalMultipartPanoramaParameters;
  return defaultHorizontalMultipartPanoramaParameters;
}

- (void)_ensureDefaultMultipartPanoramaParameters
{
  if (!self->_didInitializeDefaultMultipartPanoramaParameters)
  {
    v3 = +[PXStoryMultipartPanoramaSettings sharedInstance];
    int v4 = [v3 isFeatureEnabled];

    if (v4)
    {
      CMTimeMakeWithSeconds(&v67, 2.0, 600);
      *(CMTime *)&v69[8] = v67;
      *(void *)v69 = 0;
      long long v68 = PXStoryTimeZero;
      memset(v71, 0, 40);
      long long v70 = PXStoryTimeMaximum;
      memset(v66, 0, sizeof(v66));
      PXStoryTransitionInfoMakeDefault(5u, (uint64_t)v66, 0.5);
      v66[29] = 1;
      uint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x8010000000;
      v59 = &unk_1AB5D584F;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x8010000000;
      v49 = &unk_1AB5D584F;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v42 = v71[0];
      long long v43 = v71[1];
      long long v38 = v68;
      long long v39 = *(_OWORD *)v69;
      long long v40 = *(_OWORD *)&v69[16];
      long long v41 = v70;
      uint64_t v44 = *(void *)&v71[2];
      uint64_t v45 = 0;
      [(PXStoryConcreteTimelineStyle *)self effectiveMovementDurationForDurationInfo:&v38];
      -[PXStoryConcreteTimelineStyle _kenBurnsMotionParametersForDuration:](self, "_kenBurnsMotionParametersForDuration:");
      spec = self->_spec;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __73__PXStoryConcreteTimelineStyle__ensureDefaultMultipartPanoramaParameters__block_invoke;
      v29[3] = &unk_1E5DCE248;
      v29[4] = self;
      v29[5] = &v56;
      int64x2_t v30 = vdupq_n_s64(1uLL);
      uint64_t v32 = v6;
      uint64_t v33 = v7;
      uint64_t v34 = v8;
      uint64_t v35 = v9;
      uint64_t v31 = 0;
      v29[6] = &v46;
      long long v36 = xmmword_1AB359D20;
      uint64_t v37 = 0;
      +[PXStoryClipKenBurnsEffectFactory genericFactoryForSpec:assetContentSize:handler:](PXStoryClipKenBurnsEffectFactory, "genericFactoryForSpec:assetContentSize:handler:", spec, v29, *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
      v10 = [PXStoryMultipartPanoramaParameters alloc];
      long long v11 = *((_OWORD *)v57 + 5);
      long long v25 = *((_OWORD *)v57 + 4);
      long long v26 = v11;
      long long v12 = *((_OWORD *)v57 + 7);
      long long v27 = *((_OWORD *)v57 + 6);
      long long v28 = v12;
      long long v13 = *((_OWORD *)v57 + 3);
      long long v23 = *((_OWORD *)v57 + 2);
      long long v24 = v13;
      long long v42 = v71[0];
      long long v43 = v71[1];
      long long v38 = v68;
      long long v39 = *(_OWORD *)v69;
      long long v40 = *(_OWORD *)&v69[16];
      long long v41 = v70;
      uint64_t v44 = *(void *)&v71[2];
      uint64_t v45 = 0;
      *(_OWORD *)long long v22 = *(_OWORD *)v66;
      *(_OWORD *)&v22[16] = *(_OWORD *)&v66[16];
      *(void *)&v22[32] = *(void *)&v66[32];
      id v14 = [(PXStoryMultipartPanoramaParameters *)v10 initWithNormalizedKenBurnsEffectParameters:&v23 partDurationInfo:&v38 transitionInfo:v22];
      defaultHorizontalMultipartPanoramaParameters = self->_defaultHorizontalMultipartPanoramaParameters;
      self->_defaultHorizontalMultipartPanoramaParameters = v14;

      v16 = [PXStoryMultipartPanoramaParameters alloc];
      long long v17 = *((_OWORD *)v47 + 5);
      long long v25 = *((_OWORD *)v47 + 4);
      long long v26 = v17;
      long long v18 = *((_OWORD *)v47 + 7);
      long long v27 = *((_OWORD *)v47 + 6);
      long long v28 = v18;
      long long v19 = *((_OWORD *)v47 + 3);
      long long v23 = *((_OWORD *)v47 + 2);
      long long v24 = v19;
      long long v42 = v71[0];
      long long v43 = v71[1];
      long long v38 = v68;
      long long v39 = *(_OWORD *)v69;
      long long v40 = *(_OWORD *)&v69[16];
      long long v41 = v70;
      uint64_t v44 = *(void *)&v71[2];
      uint64_t v45 = 0;
      *(_OWORD *)long long v22 = *(_OWORD *)v66;
      *(_OWORD *)&v22[13] = *(_OWORD *)&v66[13];
      v22[29] = 4;
      *(void *)&v22[30] = *(void *)&v66[30];
      *(_WORD *)&v22[38] = *(_WORD *)&v66[38];
      v20 = [(PXStoryMultipartPanoramaParameters *)v16 initWithNormalizedKenBurnsEffectParameters:&v23 partDurationInfo:&v38 transitionInfo:v22];
      defaultVerticalMultipartPanoramaParameters = self->_defaultVerticalMultipartPanoramaParameters;
      self->_defaultVerticalMultipartPanoramaParameters = v20;

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(&v56, 8);
    }
    self->_didInitializeDefaultMultipartPanoramaParameters = 1;
  }
}

void __73__PXStoryConcreteTimelineStyle__ensureDefaultMultipartPanoramaParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 displayAssets];
  id v5 = [v4 firstObject];

  [*(id *)(a1 + 32) _getOneUpKenBurnsParameters:*(void *)(*(void *)(a1 + 40) + 8) + 32 forDisplayAsset:v5 motionInfo:a1 + 56 motionParameters:a1 + 80 factory:v3];
  [*(id *)(a1 + 32) _getOneUpKenBurnsParameters:*(void *)(*(void *)(a1 + 48) + 8) + 32 forDisplayAsset:v5 motionInfo:a1 + 112 motionParameters:a1 + 80 factory:v3];
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfoForDisplayAsset:(SEL)a3
{
  id v9 = a4;
  if ([v9 playbackStyle] == 3
    && self->_styleOptions.preferStillKeySegment
    && [v9 resourceIndex] == -1)
  {
    retstr->var6 = 0.0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }
  else
  {
    uint64_t v6 = [(PXStoryConcreteTimelineStyle *)self _clipForDisplayAsset:v9];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 audioInfo];
    }
    else
    {
      retstr->var6 = 0.0;
      *(_OWORD *)&retstr->var2 = 0u;
      *(_OWORD *)&retstr->var4 = 0u;
      *(_OWORD *)&retstr->var0 = 0u;
    }
  }

  return result;
}

- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)_transitionInfoForClip:(SEL)a3 isKeyAsset:(id)a4
{
  BOOL v5 = a5;
  id v8 = a4;
  int64_t songPace = self->_songPace;
  v10 = self->_autoEditConfiguration;
  long long v11 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
  long long v12 = [v11 allowedTransitionKinds];

  if ([v12 count] != 1 || !objc_msgSend(v12, "firstIndex"))
  {
    if (self->_allowsDefaultTransitions)
    {
      if (!v8)
      {
        *(void *)&retstr->var3 = 0;
        *(_OWORD *)&retstr->int var0 = PXStoryTransitionInfoNone;
        *(_OWORD *)&retstr->var2.var1 = xmmword_1AB35CB38;
        goto LABEL_38;
      }
      [v8 transitionInfo];
      if (v5) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 0;
      }
      [(PFStoryAutoEditConfiguration *)v10 durationForTransitionKind:v16 songPace:songPace];
      if ((unint64_t)(v16 - 1) >= 8) {
        LOBYTE(v16) = 0;
      }
      *(_OWORD *)&retstr->int var0 = 0u;
      *(_OWORD *)&retstr->var2.var1 = 0u;
      *(void *)&retstr->var3 = 0;
      PXStoryTransitionInfoMakeDefault((char)v16, (uint64_t)retstr, v17);
      long long v24 = 0;
      if (v16 <= 0xAu)
      {
        switch((char)v16)
        {
          case 5:
            PXStoryErrorCreateWithCodeDebugFormat(8, @"invalid transition pan settings (direction: %li)", v18, v19, v20, v21, v22, v23, 0);
            goto LABEL_27;
          case 6:
          case 9:
            PXStoryErrorCreateWithCodeDebugFormat(8, @"invalid transition scale settings (direction: %li)", v18, v19, v20, v21, v22, v23, 0);
            goto LABEL_27;
          case 7:
            PXStoryErrorCreateWithCodeDebugFormat(8, @"invalid transition rotate settings (direction: %li)", v18, v19, v20, v21, v22, v23, 0);
            long long v24 = LABEL_27:;
            break;
          default:
            long long v24 = 0;
            break;
        }
      }
      if (self->_isRTL)
      {
        int var0 = retstr->var0;
        int v33 = SBYTE5(retstr->var2.var3);
        char v34 = BYTE5(retstr->var2.var3);
        unsigned __int8 v35 = retstr->var1 ^ 1;
        if (var0 == 5)
        {
          if (v33 == 1)
          {
            char v34 = 2;
          }
          else if (v33 == 2)
          {
            char v34 = 1;
          }
        }
        retstr->int var0 = var0;
        retstr->var1 = v35;
        BYTE5(retstr->var2.var3) = v34;
      }
      if (v24) {
        [(PXStoryErrorReporter *)self->_errorReporter setError:v24 forComponent:@"AutoEditTransitionInfo"];
      }
    }
    else
    {
      long long v25 = PFArrayRandomObjectWithRandomNumberGenerator();
      char v26 = [v25 integerValue];

      uint64_t v27 = (v26 - 1);
      if (v27 < 8) {
        uint64_t v28 = v27 + 1;
      }
      else {
        uint64_t v28 = 0;
      }
      [(PFStoryAutoEditConfiguration *)v10 durationForTransitionKind:v28 songPace:songPace];
      Float64 v30 = v29;
      long long v24 = +[PXStorySettings sharedInstance];
      if ([v24 overrideDurations])
      {
        [v24 showcaseTransitionDuration];
        Float64 v30 = v31;
      }
      *(void *)&retstr->var3 = 0;
      *(_OWORD *)&retstr->int var0 = 0u;
      *(_OWORD *)&retstr->var2.var1 = 0u;
      PXStoryTransitionInfoMakeDefault(v26, (uint64_t)retstr, v30);
    }

    goto LABEL_38;
  }
  uint64_t v13 = ((char)[v12 firstIndex] - 1);
  if (v13 < 8) {
    uint64_t v14 = v13 + 1;
  }
  else {
    uint64_t v14 = 0;
  }
  [(PFStoryAutoEditConfiguration *)v10 durationForTransitionKind:v14 songPace:songPace];
  PXStoryTransitionInfoMakeDefault((char)v14, (uint64_t)retstr, v15);
LABEL_38:

  return result;
}

- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4
{
  id v6 = a5;
  uint64_t v7 = [(PXStoryConcreteTimelineStyle *)self _clipForDisplayAssets:v6];
  id v10 = v6;
  BOOL v8 = [v10 count] == 1
    && *(void *)[v10 resourceIndexes] == -1;

  [(PXStoryConcreteTimelineStyle *)self _transitionInfoForClip:v7 isKeyAsset:v8];

  return result;
}

- (void)_getOneUpKenBurnsParameters:(id *)a3 forDisplayAsset:(id)a4 motionInfo:(id *)a5 motionParameters:(id *)a6 factory:(id)a7
{
  id v21 = a4;
  id v13 = a7;
  uint64_t v14 = v13;
  switch(a5->var0)
  {
    case 0:
    case 4:
      [v13 getParametersForNoEffect:a3];
      break;
    case 1:
      uint64_t v15 = 0;
      switch(a5->var1.var0.var0)
      {
        case 0uLL:
          uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
          [v20 handleFailureInMethod:a2 object:self file:@"PXStoryConcreteStyle.m" lineNumber:1081 description:@"Pan direction is undefined"];

          abort();
        case 2uLL:
          uint64_t v15 = 2;
          break;
        case 3uLL:
          uint64_t v15 = 1;
          break;
        case 4uLL:
          uint64_t v15 = 3;
          break;
        default:
          break;
      }
      if (self->_isRTL) {
        PXRectEdgeFlippedHorizontally();
      }
      uint64_t v18 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
      int v19 = [v18 usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets];

      if (!v19
        || (v15 & 0xFFFFFFFD) != 1
        || !+[PXStoryRecipeClipUtilities assetIsPortraitAspectWithLargeVerticalFaceArea:](PXStoryRecipeClipUtilities, "assetIsPortraitAspectWithLargeVerticalFaceArea:", v21)|| ([v21 preferredCropRect], CGRectIsEmpty(v23)))
      {
        PXRectEdgeOpposite();
      }
      [v14 getParameters:a3 forVerticallyPanningPreferredRectMovingTowardsVerticalEdge:v15];
      break;
    case 2:
      double var1 = a6->var1;
      if (a5->var1.var0.var0 != 1) {
        double var1 = 1.0 / var1;
      }
      [v13 getParameters:a3 forZoomWithScale:var1];
      break;
    case 3:
      double var2 = a6->var2;
      if (a5->var1.var0.var0 != 1) {
        double var2 = -var2;
      }
      [v13 getParameters:a3 forRotationWithAngle:var2 scale:a6->var3];
      break;
    default:
      break;
  }
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_kenBurnsMotionParametersForDuration:(double)a3
{
  BOOL v5 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
  [v5 kenBurnsPanSpeed];
  double v7 = v6 * a3;

  BOOL v8 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
  [v8 kenBurnsScaleSpeed];
  double v10 = 1.0;
  double v11 = v9 * self->_scaleSpeedFactor * a3 + 1.0;

  long long v12 = +[PXStoryConcreteTimelineSettings sharedInstance];
  [v12 kenBurnsRotationSpeed];
  double v14 = v13 * self->_rotationSpeedFactor * a3;
  [v12 kenBurnsScaleSpeedDuringRotation];
  double v16 = v15 * self->_scaleSpeedFactor * a3 + 1.0;
  BOOL v17 = [(PXStoryConcreteTimelineStyle *)self allowsKenBurnsAnimations];
  if (v17) {
    double v18 = v11;
  }
  else {
    double v18 = 1.0;
  }
  if (v17)
  {
    double v19 = v14;
  }
  else
  {
    double v7 = 0.0;
    double v19 = 0.0;
  }
  if (v17) {
    double v10 = v16;
  }

  double v20 = v7;
  double v21 = v18;
  double v22 = v19;
  double v23 = v10;
  result.var3 = v23;
  result.double var2 = v22;
  result.double var1 = v21;
  result.int var0 = v20;
  return result;
}

- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12
{
  id v33 = a3;
  id v18 = a4;
  double v19 = (void (**)(id, void))a12;
  if ([v18 count] == 1 && (*a6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v19[2](v19, 0);
    double v20 = v33;
  }
  else
  {
    double v21 = [v18 resourcesDataSource];
    double v22 = [v21 croppingContext];

    id v23 = v18;
    uint64_t v32 = a6;
    if ([v23 count] == 1)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)[v24 resourceIndexes];

      uint64_t v26 = 64;
      if (v25 == -1) {
        uint64_t v26 = 56;
      }
    }
    else
    {

      uint64_t v26 = 64;
    }
    uint64_t v27 = *(uint64_t *)((char *)&self->super.isa + v26);
    spec = self->_spec;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __244__PXStoryConcreteTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke;
    v34[3] = &unk_1E5DCE220;
    v34[4] = self;
    long long v29 = *(_OWORD *)&a8->var3.var0.var1;
    long long v42 = *(_OWORD *)&a8->var2.var3;
    long long v43 = v29;
    long long v44 = *(_OWORD *)&a8->var3.var1;
    long long v30 = *(_OWORD *)&a8->var0.var3;
    long long v38 = *(_OWORD *)&a8->var0.var0;
    long long v39 = v30;
    long long v31 = *(_OWORD *)&a8->var1.var1;
    long long v41 = *(_OWORD *)&a8->var2.var0;
    long long v40 = v31;
    double v20 = v33;
    id v35 = v33;
    uint64_t v45 = a11;
    uint64_t v37 = v19;
    id v36 = v23;
    SEL v46 = a2;
    +[PXStoryClipKenBurnsEffectFactory factoryForSpec:spec clipComposition:v35 displayAssets:v36 croppingContext:v22 croppingOptions:v27 assetContentInfos:a5 playbackStyles:v32 separatorEffectParameters:a9 handler:v34];
  }
}

void __244__PXStoryConcreteTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 144);
  long long v62 = *(_OWORD *)(a1 + 128);
  long long v63 = v5;
  long long v64 = *(_OWORD *)(a1 + 160);
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v58 = *(_OWORD *)(a1 + 64);
  long long v59 = v6;
  long long v7 = *(_OWORD *)(a1 + 112);
  long long v60 = *(_OWORD *)(a1 + 96);
  long long v61 = v7;
  [v4 effectiveMovementDurationForDurationInfo:&v58];
  objc_msgSend(*(id *)(a1 + 32), "_kenBurnsMotionParametersForDuration:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  *(double *)&long long v58 = v8;
  *((void *)&v58 + 1) = v14;
  *(double *)&long long v59 = v10;
  *((double *)&v59 + 1) = v12;
  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 200) nextUnsignedIntegerLessThan:2];
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = [v16 numberOfClips];
  uint64_t v18 = [v16 numberOfAssets];

  if (v17 > v18)
  {
    uint64_t v19 = -1;
    if (v15) {
      uint64_t v19 = 1;
    }
    [v3 getParameters:*(void *)(a1 + 176) forSplitAssetOppositePansWithDistance:v9 * (double)v19];
    goto LABEL_5;
  }
  double v21 = *(unsigned char **)(a1 + 32);
  if (!v21[90])
  {
    double v22 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 48), "count"));
    uint64_t v28 = [*(id *)(a1 + 48) objectsAtIndexes:v22];
    long long v29 = *(void **)(*(void *)(a1 + 32) + 272);
    uint64_t v30 = [*(id *)(a1 + 40) numberOfClips];
    if (v29)
    {
      [v29 nextMotionInfoForDisplayAssetCount:v30 displayAssets:v28];
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      uint64_t v66 = 0;
    }
    long long v56 = *(_OWORD *)buf;
    uint64_t v57 = v66;
    id v35 = PLStoryGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_OWORD *)buf = v56;
      uint64_t v66 = v57;
      id v36 = PXStoryAutoEditClipMotionInfoDescription((long long *)buf);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_1A9AE7000, v35, OS_LOG_TYPE_DEBUG, "Does not allow default ken burns. Falling back to %@", buf, 0xCu);
    }
LABEL_33:

    uint64_t v37 = [*(id *)(a1 + 40) numberOfClips];
    switch(v37)
    {
      case 3:
        if ((void)v56 == 3)
        {
LABEL_54:
          double v52 = -v11;
          if (*((void *)&v56 + 1) != 1) {
            double v52 = v11;
          }
          [v3 getParameters:*(void *)(a1 + 176) forRotationWithAngle:v52 scale:v13];
          goto LABEL_5;
        }
        if ((void)v56 != 1)
        {
          if ((void)v56)
          {
            v49 = PLStoryGetLog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              long long v50 = PFStoryRecipeClipMotionStyleDescription();
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v50;
              long long v51 = "Unsupported 3-up motion style: %@";
LABEL_72:
              _os_log_impl(&dword_1A9AE7000, v49, OS_LOG_TYPE_DEBUG, v51, buf, 0xCu);
            }
LABEL_73:
          }
          goto LABEL_74;
        }
        long long v53 = (void *)[*(id *)(a1 + 40) dividerAxes];
        if (*v53 != v53[1])
        {
LABEL_74:
          double v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
          goto LABEL_75;
        }
        uint64_t v54 = 1;
        if (*(unsigned char *)(*(void *)(a1 + 32) + 16)) {
          uint64_t v54 = 2;
        }
        BOOL v55 = *((void *)&v56 + 1) == v54 || *((void *)&v56 + 1) == 4;
        double v43 = 1.0;
        if (v55) {
          double v43 = -1.0;
        }
        if (v57 == 1)
        {
LABEL_78:
          [v3 getParameters:*(void *)(a1 + 176) forParallelPansWithDistance:v43 * v9];
          goto LABEL_5;
        }
        if (v57 == 2)
        {
LABEL_79:
          [v3 getParameters:*(void *)(a1 + 176) forOppositePansWithDistance:v43 * v9];
          goto LABEL_5;
        }
        if (v57)
        {
LABEL_5:
          double v20 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_75:
          v20();
          goto LABEL_76;
        }
        long long v44 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v43);
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)(a1 + 184);
        uint64_t v47 = *(void *)(a1 + 32);
        uint64_t v48 = 993;
        break;
      case 2:
        switch((uint64_t)v56)
        {
          case 0:
            goto LABEL_74;
          case 1:
            uint64_t v41 = 1;
            if (*(unsigned char *)(*(void *)(a1 + 32) + 16)) {
              uint64_t v41 = 2;
            }
            BOOL v42 = *((void *)&v56 + 1) == v41 || *((void *)&v56 + 1) == 4;
            double v43 = 1.0;
            if (v42) {
              double v43 = -1.0;
            }
            if (v57 == 1) {
              goto LABEL_78;
            }
            if (v57 == 2) {
              goto LABEL_79;
            }
            if (v57) {
              goto LABEL_5;
            }
            long long v44 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v43);
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)(a1 + 184);
            uint64_t v47 = *(void *)(a1 + 32);
            uint64_t v48 = 947;
            break;
          case 2:
            PXRectGetCenter();
          case 3:
            goto LABEL_54;
          default:
            v49 = PLStoryGetLog();
            if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_73;
            }
            long long v50 = PFStoryRecipeClipMotionStyleDescription();
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v50;
            long long v51 = "Unsupported 2-up motion style: %@";
            goto LABEL_72;
        }
        break;
      case 1:
        long long v38 = *(void **)(a1 + 32);
        uint64_t v39 = *(void *)(a1 + 176);
        long long v40 = [*(id *)(a1 + 48) firstObject];
        [v38 _getOneUpKenBurnsParameters:v39 forDisplayAsset:v40 motionInfo:&v56 motionParameters:&v58 factory:v3];

        goto LABEL_5;
      default:
        goto LABEL_74;
    }
    [v44 handleFailureInMethod:v46 object:v47 file:@"PXStoryConcreteStyle.m" lineNumber:v48 description:@"Relative pan direction is undefined"];

    abort();
  }
  double v22 = [v21 storyConfiguration];
  id v23 = *(id *)(a1 + 48);
  if ([v23 count] == 1)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)[v24 resourceIndexes];

    if (v25 == -1 && ([v22 disabledClipMotionStyles] & 2) == 0)
    {
      uint64_t v26 = [v22 forcedKenBurnsScaleDirection];
      if (!v26) {
        uint64_t v26 = [v22 keyAssetKenBurnsScaleDirection];
      }
      uint64_t v27 = 1;
      if (v15) {
        uint64_t v27 = 2;
      }
      if (v26) {
        uint64_t v27 = v26;
      }
      *((void *)&v56 + 1) = v27;
      uint64_t v57 = 0;
      *(void *)&long long v56 = 2;
      goto LABEL_30;
    }
  }
  else
  {
  }
  long long v31 = [*(id *)(a1 + 32) _clipForDisplayAssets:*(void *)(a1 + 48)];
  uint64_t v32 = [v31 displayAssets];
  uint64_t v33 = [v32 count];
  uint64_t v34 = [*(id *)(a1 + 40) numberOfClips];

  if (v33 == v34)
  {
    if (v31)
    {
      [v31 motionInfo];
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      uint64_t v66 = 0;
    }
    long long v56 = *(_OWORD *)buf;
    uint64_t v57 = v66;

LABEL_30:
    if ([*(id *)(a1 + 48) count] == 1
      && [v22 forcePanUpOrDownInOneUpKenBurnsWithPortraitAspectAsset])
    {
      [*(id *)(a1 + 48) firstObject];
      [(id)objc_claimAutoreleasedReturnValue() aspectRatio];
      PXAspectRatioIsPortrait();
    }
    goto LABEL_33;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_76:
}

- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a9;
  id v14 = v11;
  uint64_t v15 = [v14 numberOfClips];
  uint64_t v16 = [v14 numberOfAssets];

  if (v15 <= v16 && self->_allowsRandomSeparatorEffectsFallback)
  {
    [v14 mainDividerAxis];
    PXAxisTransposed();
  }
  (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
}

- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3
{
  return 1;
}

- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4
{
  id v6 = a3;
  long long v7 = v6;
  if (a4 == 3 && self->_styleOptions.preferStillKeySegment && [v6 resourceIndex] == -1)
  {
    int64_t v11 = 1;
  }
  else
  {
    double v8 = [(PXStoryConcreteTimelineStyle *)self _clipForDisplayAsset:v7];
    if ([v8 playbackStyle] == 4
      && ([v7 resourcesDataSource],
          double v9 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "movieHighlightsForDisplayAssetAtIndex:", objc_msgSend(v7, "resourceIndex")),
          double v10 = objc_claimAutoreleasedReturnValue(),
          v9,
          v10,
          !v10))
    {
      int64_t v11 = 1;
    }
    else
    {
      int64_t v11 = [v8 playbackStyle];
    }
  }
  return v11;
}

- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v4, v3, v5, v6);
    double v9 = [NSString stringWithUTF8String:"-[PXStoryConcreteTimelineStyle isOriginalPlaybackStyleAllowedInNUp:]"];
    [v8 handleFailureInFunction:v9 file:@"PXStoryConcreteStyle.m" lineNumber:723 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return (0xAu >> a3) & 1;
}

- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3
{
  PXStoryStyleDefaultContentInfoForDisplayAsset(a4, (uint64_t)retstr);
  return result;
}

- (double)composabilityScoreForSegmentWithDisplayAssets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryConcreteTimelineStyle *)self _clipForDisplayAssets:v4];
  uint64_t v6 = [v5 displayAssets];
  uint64_t v7 = [v6 count];
  double v8 = -1.0;
  if (v7 == [v4 count])
  {
    if ([v6 count])
    {
      uint64_t v9 = 0;
      while (1)
      {
        double v10 = [v6 objectAtIndexedSubscript:v9];
        int64_t v11 = [v4 objectAtIndexedSubscript:v9];

        if (v10 != v11) {
          break;
        }
        if (++v9 >= (unint64_t)[v6 count]) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      double v8 = 1.0;
    }
  }

  return v8;
}

- (id)allowedClipCompositionsWithStartTime:(id *)a3 nextDisplayAssets:(id)a4
{
  return self->_allowedClipCompositions;
}

- (id)clipCompositionForKeyAsset:(id)a3 contentInfo:(id *)a4 finalPlaybackStyle:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 resourcesDataSource];
  double v10 = [v9 croppingContext];

  allowedKeyAssetClipCompositions = self->_allowedKeyAssetClipCompositions;
  id v12 = [v8 displayAsset];

  id v13 = +[PXStoryConcreteStyle bestClipCompositionFromClipCompositions:allowedKeyAssetClipCompositions forKeyAsset:v12 contentInfo:a4 playbackStyle:a5 spec:self->_spec croppingContext:v10 options:self->_keyAssetCroppingOptions loggingOptions:0];

  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  $01BB1521EC52D44A8E7628F5261DCEC8 result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_autoEditDecisionList;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result defaultDisplayAssetPresentationDuration];
  }
  retstr->int var0 = 0;
  *(void *)&retstr->double var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationForVerticallyPanningPortraitAsset:(SEL)a3 atSpeed:(id)a4 motionInfo:(double)a5 minimumDuration:(id *)a6 croppingContext:(id *)a7
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a8;
  v12[0] = v9;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
}

BOOL __125__PXStoryConcreteTimelineStyle_durationForVerticallyPanningPortraitAsset_atSpeed_motionInfo_minimumDuration_croppingContext___block_invoke(uint64_t a1, void *a2)
{
  memset(v28, 0, sizeof(v28));
  uint64_t v3 = *(void **)(a1 + 32);
  CMTime time = *(CMTime *)(a1 + 88);
  id v4 = a2;
  [v3 _kenBurnsMotionParametersForDuration:CMTimeGetSeconds(&time)];
  v27[0] = v5;
  v27[1] = v6;
  v27[2] = v7;
  v27[3] = v8;
  [*(id *)(a1 + 32) _getOneUpKenBurnsParameters:v28 forDisplayAsset:*(void *)(a1 + 40) motionInfo:a1 + 56 motionParameters:v27 factory:v4];
  [v4 assetRectForClipIndex:0];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v4 clipFrameForClipIndex:0];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v29.origin.x = v10;
  v29.origin.y = v12;
  v29.size.width = v14;
  v29.size.height = v16;
  BOOL result = CGRectIsNull(v29);
  if (!result)
  {
    v30.origin.x = v18;
    v30.origin.y = v20;
    v30.size.width = v22;
    v30.size.height = v24;
    BOOL result = CGRectIsNull(v30);
    if (!result) {
      PXStoryRectFromCGRect();
    }
  }
  return result;
}

- ($4ED8D8201E282D104BC63FC4BF259532)_durationInfoForClip:(SEL)a3 startTime:(id)a4 croppingContext:(id *)a5
{
  id v10 = a4;
  id v41 = a6;
  int64_t v73 = 0;
  long long v72 = 0u;
  long long v70 = 0u;
  memset(v71, 0, sizeof(v71));
  if (v10)
  {
    [v10 durationInfo];
    long long v68 = 0u;
    long long v69 = 0u;
    [v10 transitionInfo];
  }
  else
  {
    long long v68 = 0uLL;
    long long v69 = 0uLL;
  }
  *(_OWORD *)&retstr->var0.int var0 = v70;
  int64_t v11 = v71[3];
  retstr->var0.var3 = v71[0];
  *(_OWORD *)&retstr->var1.int var0 = *(_OWORD *)&v71[1];
  retstr->var1.var3 = v11;
  *(_OWORD *)&retstr->var2.int var0 = v72;
  retstr->var2.var3 = v73;
  *(_OWORD *)&retstr->var3.var0.int var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var3 = 0u;
  *(void *)&retstr->var4 = 0;
  memset(&v67, 0, sizeof(v67));
  double v12 = *((double *)&v68 + 1);
  double v13 = +[PXStoryTransitionsSettings sharedInstance];
  [v13 cueAlignmentForTransitionKind:0];
  CMTimeMakeWithSeconds(&v67, v12 * v14, 600);

  *(_OWORD *)&lhs.start.value = *(_OWORD *)&retstr->var1.var0;
  lhs.start.CMTimeEpoch epoch = retstr->var1.var3;
  rhs.CMTime start = v67;
  CMTimeAdd(&v66, &lhs.start, &rhs.start);
  *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var2.var0;
  rhs.start.CMTimeEpoch epoch = retstr->var2.var3;
  lhs.CMTime start = v66;
  CMTimeMinimum((CMTime *)&v46, &lhs.start, &rhs.start);
  *(_OWORD *)&retstr->var1.int var0 = v46;
  retstr->var1.var3 = v47;
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&retstr->var0.var0;
  lhs.start.CMTimeEpoch epoch = retstr->var0.var3;
  rhs.CMTime start = v67;
  CMTimeAdd(&v65, &lhs.start, &rhs.start);
  *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var2.var0;
  rhs.start.CMTimeEpoch epoch = retstr->var2.var3;
  lhs.CMTime start = v65;
  CMTimeMinimum((CMTime *)&v46, &lhs.start, &rhs.start);
  *(_OWORD *)&retstr->var0.int var0 = v46;
  retstr->var0.var3 = v47;
  double v15 = +[PXStorySettings sharedInstance];
  CGFloat v16 = self->_cueSource;
  if ([v15 overrideDurations])
  {
    [v15 showcaseSegmentDuration];
    CMTimeMakeWithSeconds(&v61, v17, 600);
    lhs.CMTime duration = v61;
    lhs.start.CMTimeEpoch epoch = 0;
    *(_OWORD *)&lhs.start.value = PXStoryTimeZero;
    memset(v64, 0, sizeof(v64));
    long long v63 = PXStoryTimeMaximum;
    long long v18 = *(_OWORD *)&v64[16];
    *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)v64;
    *(_OWORD *)&retstr->var3.var0.CMTime var1 = v18;
    retstr->var3.CMTime var1 = *(void *)&v64[32];
    long long v19 = *(_OWORD *)&lhs.start.epoch;
    long long v20 = *(_OWORD *)&lhs.duration.timescale;
    *(_OWORD *)&retstr->var0.int var0 = PXStoryTimeZero;
    *(_OWORD *)&retstr->var0.var3 = v19;
    *(_OWORD *)&retstr->var1.CMTime var1 = v20;
    *(_OWORD *)&retstr->var2.int var0 = PXStoryTimeMaximum;
    retstr->var4 = 0;
    goto LABEL_6;
  }
  spec = self->_spec;
  if (spec)
  {
    [(PXStoryTimelineSpec *)spec fixedSegmentDuration];
    if ((v59 & 0x100000000) != 0)
    {
      double v23 = self->_spec;
      if (v23)
      {
        [(PXStoryTimelineSpec *)v23 fixedSegmentDuration];
      }
      else
      {
        long long v56 = 0uLL;
        CMTimeEpoch v57 = 0;
      }
      *(_OWORD *)&lhs.start.value = v56;
      lhs.start.CMTimeEpoch epoch = v57;
      *(_OWORD *)&rhs.start.value = PXStoryTimeZero;
      rhs.start.CMTimeEpoch epoch = 0;
      if (CMTimeCompare(&lhs.start, &rhs.start) >= 1)
      {
        memset(&rhs, 0, 24);
        CGFloat v24 = self->_spec;
        if (v24) {
          [(PXStoryTimelineSpec *)v24 fixedSegmentDuration];
        }
        uint64_t v25 = [v10 displayAssets];
        uint64_t v26 = [v25 count];

        if (v26 != 1) {
          goto LABEL_35;
        }
        uint64_t v27 = [v10 displayAssets];
        uint64_t v28 = [v27 firstObject];

        CGRect v29 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
        long long v40 = (void *)v28;
        if ([v29 usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets])
        {
          BOOL v30 = +[PXStoryRecipeClipUtilities assetIsPortraitAspectWithLargeVerticalFaceArea:v28];

          if (!v30) {
            goto LABEL_34;
          }
          memset(&lhs, 0, 24);
          fallbackMotionStyleProvider = self->_fallbackMotionStyleProvider;
          if (v10) {
            [v10 motionInfo];
          }
          else {
            memset(v55, 0, sizeof(v55));
          }
          if (!fallbackMotionStyleProvider) {
            goto LABEL_34;
          }
          [(PXStoryRecipeClipMotionStyleProvider *)fallbackMotionStyleProvider updatedMotionForPortraitAspectAsset:v40 motionInfo:v55];
          if (lhs.start.value != 1 || (unint64_t)(*(void *)&lhs.start.timescale - 3) > 1) {
            goto LABEL_34;
          }
          CGRect v29 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
          [v29 kenBurnsPanSpeed];
          CMTime time2 = lhs.start;
          CMTime v54 = rhs.start;
          -[PXStoryConcreteTimelineStyle durationForVerticallyPanningPortraitAsset:atSpeed:motionInfo:minimumDuration:croppingContext:](self, "durationForVerticallyPanningPortraitAsset:atSpeed:motionInfo:minimumDuration:croppingContext:", v40, &time2, &v54, v41);
          *(_OWORD *)&rhs.start.value = v46;
          rhs.start.CMTimeEpoch epoch = v47;
        }

LABEL_34:
LABEL_35:
        lhs.start.CMTimeEpoch epoch = rhs.start.epoch;
        lhs.CMTime duration = rhs.start;
        long long v37 = *(_OWORD *)&rhs.start.value;
        *(void *)long long v64 = rhs.start.epoch;
        memset(&v64[8], 0, 32);
        long long v38 = *(_OWORD *)&v64[16];
        *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)v64;
        *(_OWORD *)&retstr->var3.var0.CMTime var1 = v38;
        long long v39 = *(_OWORD *)&lhs.start.epoch;
        *(_OWORD *)&retstr->var1.CMTime var1 = *(_OWORD *)&lhs.duration.timescale;
        *(_OWORD *)&retstr->var2.int var0 = v37;
        retstr->var3.CMTime var1 = *(void *)&v64[32];
        *(_OWORD *)&retstr->var0.int var0 = v37;
        *(_OWORD *)&retstr->var0.var3 = v39;
        retstr->var4 = 0;
        goto LABEL_6;
      }
    }
  }
  else
  {
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
  }
  if ([v15 useMusicCuesForTimeline]
    && v16
    && ([(PXAudioCueSource *)v16 isEmpty] & 1) == 0)
  {
    uint64_t v32 = PXAudioAssetDefaultEntryPoint(self->_audioAsset);
    memset(&v54, 0, sizeof(v54));
    [v32 time];
    CMTimeMakeWithSeconds(&v54, v33, 600);
    memset(&v53, 0, sizeof(v53));
    CMTime v52 = (CMTime)*a5;
    lhs.CMTime start = v54;
    CMTimeAdd(&v53, &lhs.start, &v52);
    memset(&v51, 0, sizeof(v51));
    CMTime var1 = (CMTime)retstr->var1;
    lhs.CMTime start = v53;
    CMTimeAdd(&v51, &lhs.start, &var1);
    memset(&lhs, 0, sizeof(lhs));
    rhs.CMTime start = v53;
    long long v46 = *(_OWORD *)&retstr->var0.var0;
    *(void *)&long long v47 = retstr->var0.var3;
    CMTimeAdd(&start, &rhs.start, (CMTime *)&v46);
    *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var2.var0;
    rhs.start.CMTimeEpoch epoch = retstr->var2.var3;
    long long v46 = *(_OWORD *)&retstr->var0.var0;
    *(void *)&long long v47 = retstr->var0.var3;
    CMTimeSubtract(&duration, &rhs.start, (CMTime *)&v46);
    CMTimeRangeMake(&lhs, &start, &duration);
    long long v47 = 0u;
    CMTimeRange rhs = lhs;
    long long v46 = 0u;
    CMTime time2 = v51;
    [(PXAudioCueSource *)v16 bestCueInRange:&rhs preferredTime:&time2];
    *(_OWORD *)&rhs.start.value = v46;
    uint64_t v34 = *((void *)&v47 + 1);
    rhs.start.CMTimeEpoch epoch = v47;
    memset(&time2, 0, sizeof(time2));
    if (CMTimeCompare(&rhs.start, &time2) || v34)
    {
      *(_OWORD *)&rhs.start.value = v46;
      rhs.start.CMTimeEpoch epoch = v47;
      CMTime time2 = v53;
      CMTimeSubtract(&v44, &rhs.start, &time2);
      rhs.CMTime start = v44;
      memset(&v43, 0, sizeof(v43));
      CMTime time2 = v67;
      CMTimeSubtract(&v43, &rhs.start, &time2);
      *(_OWORD *)&rhs.start.value = *(_OWORD *)&retstr->var0.var0;
      rhs.start.CMTimeEpoch epoch = retstr->var0.var3;
      CMTime time2 = v43;
      CMTimeMaximum(&v42, &rhs.start, &time2);
      CMTimeEpoch epoch = v42.epoch;
      CMTime v43 = v42;
      *(_OWORD *)&retstr->var1.int var0 = *(_OWORD *)&v42.value;
      retstr->var1.var3 = epoch;
      long long v36 = v47;
      *(_OWORD *)&retstr->var3.var0.int var0 = v46;
      *(_OWORD *)&retstr->var3.var0.var3 = v36;
      retstr->var4 = 0;
    }
  }
LABEL_6:

  return result;
}

- ($4ED8D8201E282D104BC63FC4BF259532)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(PXStoryConcreteTimelineStyle *)self _clipForDisplayAssets:v7];
  double v9 = [v7 resourcesDataSource];

  id v10 = [v9 croppingContext];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  [(PXStoryConcreteTimelineStyle *)self _durationInfoForClip:v8 startTime:&v12 croppingContext:v10];

  return result;
}

- (double)effectiveMovementDurationForDurationInfo:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
  double Seconds = CMTimeGetSeconds((CMTime *)&var1);
  if (Seconds >= 0.0 && Seconds <= 0.0) {
    double Seconds = 1.0;
  }
  return Seconds * self->_effectiveMovementDurationFactor;
}

- (id)_clipForDisplayAsset:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_clipByAssetUUID = self->_lock_clipByAssetUUID;
  id v7 = v4;
  if (objc_opt_respondsToSelector()) {
    [v7 alternateUUID];
  }
  else {
  uint64_t v8 = [v7 uuid];
  }

  double v9 = [(NSMutableDictionary *)lock_clipByAssetUUID objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    double v9 = [(PXStoryAutoEditDecisionList *)self->_autoEditDecisionList clipForDisplayAsset:v7];
    if (v9)
    {
LABEL_47:
      os_unfair_lock_lock(&self->_lock);
      long long v40 = self->_lock_clipByAssetUUID;
      id v41 = v7;
      if (objc_opt_respondsToSelector()) {
        [v41 alternateUUID];
      }
      else {
      CMTime v42 = [v41 uuid];
      }

      [(NSMutableDictionary *)v40 setObject:v9 forKeyedSubscript:v42];
      os_unfair_lock_unlock(p_lock);
      goto LABEL_51;
    }
    uint64_t v10 = [v7 playbackStyle];
    if (!v10)
    {
      uint64_t v45 = PLStoryGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        long long v46 = [v7 uuid];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v46;
        _os_log_impl(&dword_1A9AE7000, v45, OS_LOG_TYPE_FAULT, "Unsupported playback style for asset %@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v10 = 1;
    }
    int64_t v11 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
    unsigned __int8 v12 = [v11 disableVideoPlayback];

    if (((v10 != 1) & v12) != 0) {
      uint64_t v10 = 1;
    }
    int64_t songPace = self->_songPace;
    uint64_t v65 = 0;
    long long v63 = 0u;
    long long v64 = 0u;
    long long buf = 0u;
    long long v62 = 0u;
    autoEditConfiguration = self->_autoEditConfiguration;
    if (autoEditConfiguration) {
      [(PFStoryAutoEditConfiguration *)autoEditConfiguration durationInfoForPlaybackStyle:v10 songPace:songPace];
    }
    if (self->_allowsRandomKenBurnsFallback)
    {
      uint64_t v15 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 3, songPace);
      uint64_t v51 = v15 + 1;
      uint64_t v16 = [(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:2];
      uint64_t v17 = [(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:2];
      if (v15 == 2)
      {
        uint64_t v20 = v17 + 1;
      }
      else
      {
        if (v15 != 1)
        {
          if (v15)
          {
            uint64_t v47 = 0;
            uint64_t v49 = 0;
          }
          else
          {
            uint64_t v47 = 1;
            uint64_t v49 = 2;
          }
          goto LABEL_24;
        }
        uint64_t v20 = v16 + 1;
      }
      uint64_t v47 = v20;
      uint64_t v49 = 0;
      goto LABEL_24;
    }
    fallbackMotionStyleProvider = self->_fallbackMotionStyleProvider;
    id v60 = v7;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    if (fallbackMotionStyleProvider)
    {
      [(PXStoryRecipeClipMotionStyleProvider *)fallbackMotionStyleProvider nextMotionInfoForDisplayAssetCount:1 displayAssets:v19];
      uint64_t v47 = *(void *)&v57;
      uint64_t v49 = v58;
      uint64_t v51 = v56;
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v49 = 0;
      uint64_t v51 = 0;
    }

LABEL_24:
    if (!self->_allowsRandomTransitionFallback)
    {
      uint64_t v27 = v10;
      fallbackTransitionProvider = self->_fallbackTransitionProvider;
      if (fallbackTransitionProvider)
      {
        [(PXStoryRecipeClipTransitionProvider *)fallbackTransitionProvider nextIntraMomentTransition];
        uint64_t v24 = v56;
        double v32 = v57;
        unint64_t v33 = v58;
        uint64_t v30 = v59;
      }
      else
      {
        uint64_t v30 = 0;
        unint64_t v33 = 0;
        uint64_t v24 = 0;
        double v32 = 0.0;
      }
      goto LABEL_38;
    }
    double v21 = PFArrayRandomObjectWithRandomNumberGenerator();
    char v22 = [v21 integerValue];

    uint64_t v23 = (v22 - 1);
    if (v23 < 8) {
      uint64_t v24 = v23 + 1;
    }
    else {
      uint64_t v24 = 0;
    }
    uint64_t v25 = -[PFRandomNumberGenerator nextUnsignedIntegerLessThan:](self->_randomNumberGenerator, "nextUnsignedIntegerLessThan:", 2, v47, v49);
    uint64_t v26 = [(PFRandomNumberGenerator *)self->_randomNumberGenerator nextUnsignedIntegerLessThan:2];
    uint64_t v27 = v10;
    if (v24 == 7)
    {
      uint64_t v30 = 0;
      uint64_t v28 = v26 + 1;
    }
    else
    {
      if (v24 != 6)
      {
        LOWORD(v28) = 0;
        unint64_t v29 = 0;
        uint64_t v30 = 0;
        if (v24 == 5)
        {
          unint64_t v29 = 0;
          uint64_t v30 = 2;
          LOWORD(v28) = 1;
        }
        goto LABEL_37;
      }
      uint64_t v30 = 0;
      uint64_t v28 = v25 + 1;
    }
    unint64_t v29 = v28 & 0xFFFFFFFFFFFF0000;
LABEL_37:
    unint64_t v33 = v29 | (unsigned __int16)v28;
    double v32 = 0.5;
LABEL_38:
    uint64_t v34 = [(PXStoryConcreteTimelineStyle *)self storyConfiguration];
    id v35 = [v34 allowedTransitionKinds];

    if ([v35 count] == 1 && objc_msgSend(v35, "firstIndex"))
    {
      uint64_t v36 = ((char)[v35 firstIndex] - 1);
      if (v36 < 8) {
        uint64_t v37 = v36 + 1;
      }
      else {
        uint64_t v37 = 0;
      }
      [(PFStoryAutoEditConfiguration *)self->_autoEditConfiguration durationForTransitionKind:v37 songPace:self->_songPace];
      double v32 = v38;
      uint64_t v39 = ((char)v37 - 1);
      if (v39 < 8) {
        uint64_t v24 = v39 + 1;
      }
      else {
        uint64_t v24 = 0;
      }
    }
    double v9 = [[PXStoryConcreteAutoEditClip alloc] initWithDisplayAsset:v7];
    [(PXStoryConcreteAutoEditClip *)v9 setPlaybackStyle:v27];
    v54[2] = v63;
    v54[3] = v64;
    uint64_t v55 = v65;
    v54[0] = buf;
    v54[1] = v62;
    [(PXStoryConcreteAutoEditClip *)v9 setDurationInfo:v54];
    v53[0] = v51;
    v53[1] = v48;
    v53[2] = v50;
    [(PXStoryConcreteAutoEditClip *)v9 setMotionInfo:v53];
    v52[2] = v33;
    v52[3] = v30;
    v52[0] = v24;
    *(double *)&v52[1] = v32;
    [(PXStoryConcreteAutoEditClip *)v9 setTransitionInfo:v52];

    goto LABEL_47;
  }
LABEL_51:
  CMTime v43 = v9;

  return v43;
}

- (id)_clipForDisplayAssets:(id)a3
{
  id v4 = [a3 firstObject];
  uint64_t v5 = [(PXStoryConcreteTimelineStyle *)self _clipForDisplayAsset:v4];

  return v5;
}

- (BOOL)allowsKenBurnsAnimations
{
  return 1;
}

- (PXStoryConcreteTimelineStyle)initWithSpec:(id)a3 audioAsset:(id)a4 cueSource:(id)a5 overallDurationInfo:(id *)a6 autoEditDecisionList:(id)a7 autoEditConfiguration:(id)a8 allowedKeyAssetClipCompositions:(id)a9 allowedClipCompositions:(id)a10 randomNumberGenerators:(id)a11 errorReporter:(id)a12 allowsIncompleteTimelines:(BOOL)a13 styleOptions:(id)a14 storyConfiguration:(id)a15
{
  id v19 = a3;
  id v51 = a4;
  id v20 = a4;
  id v52 = a5;
  id v21 = a5;
  char v22 = v20;
  id v60 = v21;
  id v49 = a7;
  id v59 = a7;
  id v58 = a8;
  id v57 = a9;
  id v56 = a10;
  id v23 = a11;
  id v55 = a12;
  id v61 = a15;
  v62.receiver = self;
  v62.super_class = (Class)PXStoryConcreteTimelineStyle;
  uint64_t v24 = [(PXStoryConcreteTimelineStyle *)&v62 init];
  if (v24)
  {
    uint64_t v25 = +[PXStorySettings sharedInstance];
    objc_storeStrong((id *)v24 + 1, a3);
    v24[16] = [*((id *)v24 + 1) layoutDirection] == 2;
    objc_storeStrong((id *)v24 + 3, v51);
    if (v22) {
      uint64_t v26 = [v22 pace];
    }
    else {
      uint64_t v26 = 2;
    }
    *((void *)v24 + 4) = v26;
    *($1A23BB056C565A410801C90FE7234890 *)(v24 + 40) = a14;
    objc_storeStrong((id *)v24 + 27, v52);
    objc_storeWeak((id *)v24 + 39, v61);
    *((_DWORD *)v24 + 63) = 0;
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v28 = (void *)*((void *)v24 + 32);
    *((void *)v24 + 32) = v27;

    id WeakRetained = objc_loadWeakRetained((id *)v24 + 39);
    int v30 = [WeakRetained preferFaceCrops];

    if (v30)
    {
      *(int64x2_t *)(v24 + 56) = vdupq_n_s64(2uLL);
    }
    else
    {
      uint64_t v31 = *((void *)v24 + 5);
      *((void *)v24 + 7) = v31;
      *((void *)v24 + 8) = v31 & 0xFFFFFFFFFFFFFFFELL;
    }
    uint64_t v32 = [v25 transitionShowcaseMode];
    v24[72] = [v25 allowsDefaultBehaviorForShowcaseMode:v32];
    v24[73] = [v25 allowsRandomFallbackForShowcaseMode:v32];
    uint64_t v33 = objc_msgSend(v25, "possibleTransitionKindsForFallback:", objc_msgSend(v25, "transitionFallback"));
    uint64_t v34 = (void *)*((void *)v24 + 10);
    *((void *)v24 + 10) = v33;

    uint64_t v35 = [v25 separatorEffectsShowcaseMode];
    v24[88] = [v25 allowsDefaultBehaviorForShowcaseMode:v35];
    v24[89] = [v25 allowsRandomFallbackForShowcaseMode:v35];
    uint64_t v36 = [v25 kenBurnsShowcaseMode];
    v24[90] = [v25 allowsDefaultBehaviorForShowcaseMode:v36];
    v24[91] = [v25 allowsRandomFallbackForShowcaseMode:v36];
    *((_OWORD *)v24 + 6) = *(_OWORD *)&a6->var0;
    long long v37 = *(_OWORD *)&a6->var1.var2.var1;
    long long v39 = *(_OWORD *)&a6->var1.var0.var1;
    long long v38 = *(_OWORD *)&a6->var1.var1.var0;
    *((_OWORD *)v24 + 9) = *(_OWORD *)&a6->var1.var1.var3;
    *((_OWORD *)v24 + 10) = v37;
    *((_OWORD *)v24 + 7) = v39;
    *((_OWORD *)v24 + 8) = v38;
    objc_storeStrong((id *)v24 + 22, v49);
    objc_storeStrong((id *)v24 + 23, a9);
    objc_storeStrong((id *)v24 + 24, a10);
    uint64_t v40 = [v23 firstObject];
    id v41 = (void *)*((void *)v24 + 25);
    *((void *)v24 + 25) = v40;

    objc_storeStrong((id *)v24 + 26, a12);
    *((void *)v24 + 28) = 0x3FF0000000000000;
    if ([v61 movementAnimationCurve] == 5)
    {
      [v25 movementAnimationLinearFraction];
      *((double *)v24 + 28) = *((double *)v24 + 28) / v42;
    }
    [*((id *)v24 + 1) viewportSize];
    double v44 = v43;
    [*((id *)v24 + 1) viewportSize];
    if (v44 >= v45) {
      double v46 = v44;
    }
    else {
      double v46 = v45;
    }
    if (v46 >= 1.0) {
      double v47 = 2.0 / v46;
    }
    else {
      double v47 = 2.0;
    }
    *((double *)v24 + 29) = v47;
    PXDegreesToRadians();
  }

  return 0;
}

- (PXStoryConcreteTimelineStyle)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteStyle.m", 412, @"%s is not available as initializer", "-[PXStoryConcreteTimelineStyle init]");

  abort();
}

@end