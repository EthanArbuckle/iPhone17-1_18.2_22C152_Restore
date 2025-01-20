@interface _PXStoryDummyTimelineStyle
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration;
- ($4ED8D8201E282D104BC63FC4BF259532)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4;
- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3;
- ($654D12A5B96C89A393ABE69D6FE3CC0A)audioInfoForDisplayAsset:(SEL)a3;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfoForSegmentWithClipComposition:(SEL)a3 displayAssets:(id)a4;
- (BOOL)allowsIncompleteTimelines;
- (BOOL)allowsMultipartPanoramaForDisplayAsset:(id)a3 startTime:(id *)a4;
- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3;
- (PXStoryMultipartPanoramaParameters)defaultHorizontalMultipartPanoramaParameters;
- (PXStoryMultipartPanoramaParameters)defaultVerticalMultipartPanoramaParameters;
- (_PXStoryDummyTimelineStyle)initWithStyle:(id)a3 spec:(id)a4 allowedClipCompositions:(id)a5;
- (double)composabilityScoreForSegmentWithDisplayAssets:(id)a3;
- (id)allowedClipCompositionsWithStartTime:(id *)a3 nextDisplayAssets:(id)a4;
- (id)clipCompositionForKeyAsset:(id)a3 contentInfo:(id *)a4 finalPlaybackStyle:(int64_t)a5;
- (id)sortedCropContentsRectsForMultipartPanoramaWithDisplayAsset:(id)a3 startTime:(id *)a4 proposedCropContentsRects:(id)a5 axis:(int64_t)a6 normalizedKenBurnsEffectParameters:(id *)a7 durationInfos:(id *)a8 transitionInfos:(id *)a9;
- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3;
- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4;
- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12;
- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9;
@end

@implementation _PXStoryDummyTimelineStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClipCompositions, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (BOOL)allowsIncompleteTimelines
{
  return 1;
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
  result = ($D9ACF32088E97DD3D62E5CBFAE4B0A27 *)self->_style;
  if (result) {
    return ($D9ACF32088E97DD3D62E5CBFAE4B0A27 *)[($D9ACF32088E97DD3D62E5CBFAE4B0A27 *)result transitionInfo];
  }
  *(void *)&retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2.var1 = 0u;
  return result;
}

- (void)enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 finalPlaybackStyles:(const int64_t *)a6 startTime:(id *)a7 durationInfo:(id *)a8 separatorEffectParameters:(id *)a9 separatorEffectContext:(int64_t)a10 buffer:(id *)a11 usingBlock:(id)a12
{
  id v14 = a3;
  id v15 = a12;
  id v16 = a4;
  v17 = [v16 resourcesDataSource];
  v18 = [v17 croppingContext];

  spec = self->_spec;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __242___PXStoryDummyTimelineStyle_enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition_displayAssets_assetContentInfos_finalPlaybackStyles_startTime_durationInfo_separatorEffectParameters_separatorEffectContext_buffer_usingBlock___block_invoke;
  v24[3] = &unk_1E5DD2908;
  id v25 = v14;
  v26 = self;
  id v27 = v15;
  v28 = a11;
  id v20 = v15;
  id v21 = v14;
  +[PXStoryClipKenBurnsEffectFactory factoryForSpec:spec clipComposition:v21 displayAssets:v16 croppingContext:v18 croppingOptions:0 assetContentInfos:a5 playbackStyles:a6 separatorEffectParameters:a9 handler:v24];
}

- (void)enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:(id)a3 displayAssets:(id)a4 finalPlaybackStyles:(const int64_t *)a5 startTime:(id *)a6 durationInfo:(id *)a7 buffer:(id *)a8 usingBlock:(id)a9
{
  id v9 = a3;
  id v10 = a9;
  [v9 mainDividerAxis];
  PXAxisTransposed();
}

- (int64_t)finalNUpPlaybackStyleForOriginalPlaybackStyle:(int64_t)a3
{
  return 1;
}

- (int64_t)finalOneUpPlaybackStyleForDisplayAsset:(id)a3 originalPlaybackStyle:(int64_t)a4
{
  return a4;
}

- (BOOL)isOriginalPlaybackStyleAllowedInNUp:(int64_t)a3
{
  return 1;
}

- ($60B83496CA56D3588CF925FE7FBD90DC)contentInfoForDisplayAsset:(SEL)a3
{
  PXStoryBasicContentInfoForDisplayAsset(a4, (uint64_t)retstr);
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

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultDisplayAssetPresentationDuration
{
  [(PXStoryDummyStyle *)self->_style defaultSegmentDuration];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 600);
}

- ($4ED8D8201E282D104BC63FC4BF259532)durationInfoForSegmentWithDisplayAssets:(SEL)a3 startTime:(id)a4
{
  result = [(_PXStoryDummyTimelineStyle *)self defaultDisplayAssetPresentationDuration];
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

- (_PXStoryDummyTimelineStyle)initWithStyle:(id)a3 spec:(id)a4 allowedClipCompositions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PXStoryDummyTimelineStyle;
  v12 = [(_PXStoryDummyTimelineStyle *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_style, a3);
    objc_storeStrong((id *)&v13->_spec, a4);
    objc_storeStrong((id *)&v13->_allowedClipCompositions, a5);
  }

  return v13;
}

@end