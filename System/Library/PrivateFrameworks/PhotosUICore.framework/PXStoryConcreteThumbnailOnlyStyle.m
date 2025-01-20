@interface PXStoryConcreteThumbnailOnlyStyle
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- ($4ED8D8201E282D104BC63FC4BF259532)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4;
- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3;
- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfoForDisplayAsset:(SEL)a3;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4;
- (BOOL)allowsIncompleteTimelines;
- (BOOL)allowsMultipartPanoramaForDisplayAsset:(id)a3 startTime:(id *)a4;
- (BOOL)isCustomized;
- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3;
- (NSString)originalColorGradeCategory;
- (PXAudioCueSource)cueSource;
- (PXStoryConcreteThumbnailOnlyStyle)init;
- (PXStoryConcreteThumbnailOnlyStyle)initWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4;
- (PXStoryMultipartPanoramaParameters)defaultHorizontalMultipartPanoramaParameters;
- (PXStoryMultipartPanoramaParameters)defaultVerticalMultipartPanoramaParameters;
- (PXStorySongResource)songResource;
- (double)composabilityScoreForSegmentWithDisplayAssets:(id)a3;
- (id)allowedClipCompositionsWithStartTime:(id *)a3 nextDisplayAssets:(id)a4;
- (id)clipCompositionForKeyAsset:(id)a3 contentInfo:(id *)a4 finalPlaybackStyle:(int64_t)a5;
- (id)createRandomNumberGenerators;
- (id)sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:(id)a3 startTime:(id *)a4 proposedCropContentsRects:(id)a5 axis:(int64_t)a6 normalizedKenBurnsEffectParameters:(id *)a7 durationInfos:(id *)a8 transitionInfos:(id *)a9;
- (int64_t)customColorGradeKind;
- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3;
- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4;
- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12;
- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9;
@end

@implementation PXStoryConcreteThumbnailOnlyStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositions, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (BOOL)allowsIncompleteTimelines
{
  return 0;
}

- (id)sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:(id)a3 startTime:(id *)a4 proposedCropContentsRects:(id)a5 axis:(int64_t)a6 normalizedKenBurnsEffectParameters:(id *)a7 durationInfos:(id *)a8 transitionInfos:(id *)a9
{
  return 0;
}

- (BOOL)allowsMultipartPanoramaForDisplayAsset:(id)a3 startTime:(id *)a4
{
  return 0;
}

- (PXStoryMultipartPanoramaParameters)defaultVerticalMultipartPanoramaParameters
{
  return 0;
}

- (PXStoryMultipartPanoramaParameters)defaultHorizontalMultipartPanoramaParameters
{
  return 0;
}

- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfoForDisplayAsset:(SEL)a3
{
  retstr->var6 = 0.0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return self;
}

- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4
{
  *(void *)&retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = PXStoryTransitionInfoNone;
  *(_OWORD *)&retstr->var2.var1 = xmmword_1AB35CB38;
  return self;
}

- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12
{
}

- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9
{
}

- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3
{
  return a3;
}

- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4
{
  if (a4 == 4) {
    return 1;
  }
  else {
    return a4;
  }
}

- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3
{
  return 0;
}

- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3
{
  PXStoryStyleDefaultContentInfoForDisplayAsset(a4, (uint64_t)retstr);
  return result;
}

- (double)composabilityScoreForSegmentWithDisplayAssets:(id)a3
{
  return 0.0;
}

- (id)allowedClipCompositionsWithStartTime:(id *)a3 nextDisplayAssets:(id)a4
{
  return self->_allowedClipCompositions;
}

- (id)clipCompositionForKeyAsset:(id)a3 contentInfo:(id *)a4 finalPlaybackStyle:(int64_t)a5
{
  return +[PXStoryClipCompositionFactory oneUpComposition];
}

- ($4ED8D8201E282D104BC63FC4BF259532)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4
{
  result = [(PXStoryConcreteThumbnailOnlyStyle *)self defaultDisplayAssetPresentationDuration];
  retstr->var1 = v7;
  retstr->var0.var3 = 0;
  *(_OWORD *)&retstr->var0.var0 = PXStoryTimeZero;
  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var2.var0 = PXStoryTimeMaximum;
  *(_OWORD *)&retstr->var3.var0.var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var3 = 0u;
  retstr->var4 = 0;
  return result;
}

- (id)createRandomNumberGenerators
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isCustomized
{
  return 0;
}

- (PXAudioCueSource)cueSource
{
  return 0;
}

- (PXStorySongResource)songResource
{
  return 0;
}

- (PXStoryConcreteThumbnailOnlyStyle)initWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryConcreteThumbnailOnlyStyle;
  v8 = [(PXStoryConcreteThumbnailOnlyStyle *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_customColorGradeKind = a3;
    objc_storeStrong((id *)&v8->_originalColorGradeCategory, a4);
    CMTimeMakeWithSeconds(&v14, 42.0, 600);
    v9->_defaultDisplayAssetPresentationDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
    v10 = +[PXStoryClipCompositionFactory oneUpComposition];
    v16[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    allowedClipCompositions = v9->_allowedClipCompositions;
    v9->_allowedClipCompositions = (NSArray *)v11;

    CMTimeMakeWithSeconds(&v14, 42.0, 600);
    v9->_outroDuration = ($95D729B680665BEAEFA1D6FCA8238556)v14;
  }

  return v9;
}

- (PXStoryConcreteThumbnailOnlyStyle)init
{
  return [(PXStoryConcreteThumbnailOnlyStyle *)self initWithCustomColorGradeKind:0 originalColorGradeCategory:0];
}

@end