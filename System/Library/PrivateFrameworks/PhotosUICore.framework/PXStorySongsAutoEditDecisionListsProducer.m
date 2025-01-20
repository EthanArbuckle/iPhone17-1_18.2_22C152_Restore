@interface PXStorySongsAutoEditDecisionListsProducer
+ ($0AC6E346AE4835514AAA8AC86D8F4844)audioModeDecisionForAsset:(id)a3 minimumAudioScore:(float)a4 playbackStyle:(int64_t)a5 movieHighlight:(id)a6 storyConfiguration:(id)a7;
- ($5EF5D5D6B68C46A6CC4A689629511B76)_optimizeOverallDurationOfClips:(SEL)a3 forSong:(id)a4;
- ($5EF5D5D6B68C46A6CC4A689629511B76)targetOverallDurationInfo;
- ($FF287EE8AFEAB54EC1BB010BF4A7F511)_durationInfoForClip:(SEL)a3 durationMultiplier:(id)a4 songPace:(double)a5 transitionIn:(int64_t)a6 transitionOut:(double *)a7;
- (BOOL)_canOverlapAudioFromClip:(id)a3 withNextClip:(id)a4;
- (BOOL)_canOverlapAudioFromClip:(id)a3 withPreviousClip:(id)a4;
- (BOOL)handlesDiagnosticTextForHUDType:(int64_t)a3;
- (PXDisplayAssetFetchResult)displayAssets;
- (PXStoryAutoEditClipComposabilityProvider)composabilityProvider;
- (PXStoryAutoEditMomentsProvider)diagnosticsMomentsProvider;
- (PXStoryAutoEditMomentsProvider)momentsProvider;
- (PXStoryChapterCollection)chapterCollection;
- (PXStoryConfiguration)storyConfiguration;
- (PXStoryMovieHighlightsCollection)movieHighlights;
- (PXStorySongsAutoEditDecisionListsProducer)init;
- (PXStorySongsAutoEditDecisionListsProducer)initWithAssetCollection:(id)a3 displayAssets:(id)a4 movieHighlights:(id)a5 chapterCollection:(id)a6 targetOverallDurationInfo:(id *)a7 configuration:(id)a8 storyConfiguration:(id)a9;
- (_NSRange)_clipRangeForMoment:(id)a3 inClips:(id)a4;
- (float)_volumeGainForAsset:(id)a3 movieHighlight:(id)a4 audioMode:(int64_t)a5;
- (id)_decisionListForSong:(id)a3 pace:(int64_t)a4 colorGradeCategory:(id)a5;
- (id)_diagnosticTextForAutoEditHUDAtDisplaySize:(CGSize)a3;
- (id)_diagnosticTextForComposabilityHUDAtDisplaySize:(CGSize)a3;
- (id)_diagnosticTextForMomentsHUDAtDisplaySize:(CGSize)a3;
- (id)_indexesOfClips:(id)a3 atChapterBeginningInChapterCollection:(id)a4;
- (id)_makeRandomNumberGenerator;
- (id)_movieHighlightForAsset:(id)a3 playbackStyle:(int64_t)a4;
- (id)debugQuickLookObject;
- (id)decisionListForSong:(id)a3 pace:(int64_t)a4 colorGradeCategory:(id)a5;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (id)requestAutoEditDecisionListsWithOptions:(unint64_t)a3 songs:(id)a4 colorGradeCategoriesBySong:(id)a5 resultHandler:(id)a6;
- (id)requestDefaultAutoEditDecisionListsWithColorGradeCategory:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
- (int64_t)_playbackStyleForAsset:(id)a3 songPace:(int64_t)a4;
- (unint64_t)_composeClips:(id)a3 inAssetRange:(_NSRange)a4;
- (void)_addComposabilityGraph:(id)a3;
- (void)_addMomentsGraph:(id)a3;
- (void)_addTimeConstraintGraph:(id)a3;
- (void)_adjustAudioPlaybackForClips:(id)a3;
- (void)_adjustAudioTransitionForClips:(id)a3;
- (void)_adjustDurationOfClips:(id)a3 forSongPace:(int64_t)a4;
- (void)_adjustTransitionsInClips:(id)a3 forChapterCollection:(id)a4;
- (void)_audioCutsFromClip:(id)a3 toClip:(id)a4 useJCut:(BOOL *)a5 useLCut:(BOOL *)a6;
- (void)_composeClips:(id)a3 forSongPace:(int64_t)a4;
- (void)_populateClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5;
- (void)_populateModulesInClips:(id)a3;
- (void)_populateMomentRecipesInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5;
- (void)_populateMotionStylesAndTransitionsInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5;
- (void)_populateMotionStylesInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5;
- (void)_populateTransitionsInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5;
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)setComposabilityProvider:(id)a3;
- (void)setMomentsProvider:(id)a3;
@end

@implementation PXStorySongsAutoEditDecisionListsProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_movieHighlights, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_ttrUnitTestsForFailedDurationConstraints, 0);
  objc_storeStrong((id *)&self->_lastGeneratedAutoEditDecisionLists, 0);
  objc_storeStrong((id *)&self->_composabilityProvider, 0);
  objc_storeStrong((id *)&self->_momentsProvider, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setComposabilityProvider:(id)a3
{
}

- (PXStoryAutoEditClipComposabilityProvider)composabilityProvider
{
  return self->_composabilityProvider;
}

- (void)setMomentsProvider:(id)a3
{
}

- (PXStoryAutoEditMomentsProvider)momentsProvider
{
  return self->_momentsProvider;
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)targetOverallDurationInfo
{
  long long v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[2].var1.var0.var1;
  long long v4 = *(_OWORD *)&self[1].var1.var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1.var1.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (PXStoryMovieHighlightsCollection)movieHighlights
{
  return self->_movieHighlights;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  long long v4 = objc_opt_new();
  v5 = [(PXStoryAutoEditMomentsProvider *)self->_momentsProvider error];
  [v4 setObject:v5 forKeyedSubscript:@"Moments"];

  v6 = [(PXStoryAutoEditClipComposabilityProvider *)self->_composabilityProvider error];
  [v4 setObject:v6 forKeyedSubscript:@"Composability"];

  v7 = (void *)[v4 copy];
  return v7;
}

- (id)_diagnosticTextForComposabilityHUDAtDisplaySize:(CGSize)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v4 appendString:@"AutoEdit - Composability\n"];
  objc_msgSend(v4, "appendFormat:", @"- count: %d\n", -[PXStoryAutoEditClipComposabilityProvider count](self->_composabilityProvider, "count"));
  [v4 appendString:@"- scores:\n "];
  if ([(PXStoryAutoEditClipComposabilityProvider *)self->_composabilityProvider count] >= 1)
  {
    int64_t v5 = 0;
    do
    {
      [(PXStoryAutoEditClipComposabilityProvider *)self->_composabilityProvider composabilityScoresForDisplayAssetIndex:v5];
      [v4 appendFormat:@"%d: diptych: %.2f, triptych: %.2f\n", v5++, v6, v7];
    }
    while ([(PXStoryAutoEditClipComposabilityProvider *)self->_composabilityProvider count] > v5);
  }
  [v4 appendString:@"\n"];
  return v4;
}

- (id)_diagnosticTextForMomentsHUDAtDisplaySize:(CGSize)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v4 appendString:@"AutoEdit - Moments\n"];
  int64_t v5 = [(PXStoryAutoEditMomentsProvider *)self->_momentsProvider statistics];
  objc_msgSend(v4, "appendFormat:", @"- count: %d\n", -[PXStoryAutoEditMomentsProvider count](self->_momentsProvider, "count"));
  [v5 averageAssetCount];
  [v4 appendFormat:@"- avg length: %.2f\n", v6];
  objc_msgSend(v4, "appendFormat:", @"- min length: %d\n", objc_msgSend(v5, "minimumAssetCount"));
  objc_msgSend(v4, "appendFormat:", @"- max length: %d\n", objc_msgSend(v5, "maximumAssetCount"));
  [v4 appendString:@"- moment counts:\n "];
  momentsProvider = self->_momentsProvider;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke;
  v55[3] = &unk_1E5DC6EF8;
  id v8 = v4;
  id v56 = v8;
  [(PXStoryAutoEditMomentsProvider *)momentsProvider enumerateMomentsUsingBlock:v55];
  [v8 appendString:@"\n"];
  v9 = [v5 clusteringDistanceCalculator];
  [v9 locationWeight];
  uint64_t v11 = v10;
  v12 = [v5 clusteringDistanceCalculator];
  [v12 timeWeight];
  uint64_t v14 = v13;
  v15 = [v5 clusteringDistanceCalculator];
  [v15 faceWeight];
  [v8 appendFormat:@"- moment weighted distances (l: %.3f, t: %.3f, f: %.3f):\n ", v11, v14, v16];

  v17 = self->_momentsProvider;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_2;
  v53[3] = &unk_1E5DC6EF8;
  id v18 = v8;
  id v54 = v18;
  [(PXStoryAutoEditMomentsProvider *)v17 enumerateMomentsUsingBlock:v53];
  [v18 appendString:@"\n"];
  [v18 appendString:@"- moment unweighted location distances:\n "];
  v19 = self->_momentsProvider;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_3;
  v51[3] = &unk_1E5DC6EF8;
  id v20 = v18;
  id v52 = v20;
  [(PXStoryAutoEditMomentsProvider *)v19 enumerateMomentsUsingBlock:v51];
  [v20 appendString:@"\n"];
  [v20 appendString:@"- moment unweighted time distances:\n "];
  v21 = self->_momentsProvider;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_4;
  v49[3] = &unk_1E5DC6EF8;
  id v22 = v20;
  id v50 = v22;
  [(PXStoryAutoEditMomentsProvider *)v21 enumerateMomentsUsingBlock:v49];
  [v22 appendString:@"\n"];
  [v22 appendString:@"- moment unweighted face distances:\n "];
  v23 = self->_momentsProvider;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_5;
  v47[3] = &unk_1E5DC6EF8;
  id v24 = v22;
  id v48 = v24;
  [(PXStoryAutoEditMomentsProvider *)v23 enumerateMomentsUsingBlock:v47];
  [v24 appendString:@"\n"];
  [v5 clusteringDuration];
  [v24 appendFormat:@"- clustering duration: %.2f\n", v25];
  v26 = [v5 memoryCategoryName];
  [v24 appendFormat:@"- clustering properties (%@):\n", v26];

  v27 = [v5 clusteringProperties];
  v28 = [v27 algorithm];
  [v24 appendFormat:@"  - algorithm: %@\n", v28];

  v29 = [v5 clusteringProperties];
  v30 = [v29 algorithmProperties];
  [v24 appendFormat:@"  - algorithmProperties: %@\n", v30];

  v31 = [v5 clusteringProperties];
  v32 = [v31 distanceWeights];
  [v24 appendFormat:@"  - distanceWeights: %@\n", v32];

  [v24 appendString:@"\nModules\n"];
  v33 = self->_lastGeneratedAutoEditDecisionLists;
  v34 = objc_opt_new();
  v35 = self->_momentsProvider;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_6;
  v45[3] = &unk_1E5DC6EF8;
  id v36 = v34;
  id v46 = v36;
  [(PXStoryAutoEditMomentsProvider *)v35 enumerateMomentsUsingBlock:v45];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_8;
  v42[3] = &unk_1E5DC6F48;
  id v43 = v36;
  id v37 = v24;
  id v44 = v37;
  id v38 = v36;
  [(NSArray *)v33 enumerateObjectsUsingBlock:v42];
  v39 = v44;
  id v40 = v37;

  return v40;
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"[%d]", objc_msgSend(a2, "count"));
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 totalWeightedClusteringDistance];
  return objc_msgSend(v2, "appendFormat:", @"[%.1f]", v3);
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 locationClusteringDistance];
  return objc_msgSend(v2, "appendFormat:", @"[%.1f]", v3);
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 timeClusteringDistance];
  return objc_msgSend(v2, "appendFormat:", @"[%.1f]", v3);
}

uint64_t __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 faceClusteringDistance];
  return objc_msgSend(v2, "appendFormat:", @"[%.1f]", v3);
}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_7;
  v5[3] = &unk_1E5DC6F20;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a3;
  [a2 enumerateAssetsUsingBlock:v5];
}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_9;
  v7[3] = &unk_1E5DC6D28;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [a2 enumerateClipsUsingBlock:v7];
  *a4 = 1;
}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  int64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 displayAssets];
  id v8 = [v7 firstObject];
  id v9 = [v8 uuid];
  id v22 = [v5 objectForKeyedSubscript:v9];

  uint64_t v10 = [v22 integerValue];
  uint64_t v11 = *(void **)(a1 + 40);
  v12 = [v6 displayAssets];
  uint64_t v13 = [v12 count];
  unint64_t v14 = [v6 moduleInfo];
  if (v14 > 3) {
    v15 = @"??";
  }
  else {
    v15 = off_1E5DB4F20[v14];
  }
  uint64_t v16 = v15;
  [v6 moduleInfo];
  if (v17) {
    id v18 = @" - start";
  }
  else {
    id v18 = &stru_1F00B0030;
  }
  [v6 moduleInfo];
  __int16 v20 = v19;

  v21 = @" - empty space break";
  if ((v20 & 0x100) == 0) {
    v21 = &stru_1F00B0030;
  }
  [v11 appendFormat:@"Clip %ld (%lu assets) moment: %ld module: %@%@%@\n", a3, v13, v10, v16, v18, v21];
}

void __87__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForMomentsHUDAtDisplaySize___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v8 = [v3 numberWithUnsignedInteger:v4];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v5 uuid];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (id)_diagnosticTextForAutoEditHUDAtDisplaySize:(CGSize)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v4 appendString:@"AutoEdit - Overview\n"];
  long long v5 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.epoch;
  long long v18 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.value;
  long long v19 = v5;
  long long v20 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.maximumDuration.timescale;
  long long v6 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.timescale;
  long long v16 = *(_OWORD *)&self->_targetOverallDurationInfo.kind;
  long long v17 = v6;
  uint64_t v7 = PFStoryOverallDurationInfoDescription();
  [v4 appendFormat:@"Target Overall Duration: %@\n", v7];

  lastGeneratedAutoEditDecisionLists = self->_lastGeneratedAutoEditDecisionLists;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForAutoEditHUDAtDisplaySize___block_invoke;
  v14[3] = &unk_1E5DC6ED0;
  id v9 = v4;
  id v15 = v9;
  uint64_t v10 = lastGeneratedAutoEditDecisionLists;
  [(NSArray *)v10 enumerateObjectsUsingBlock:v14];
  uint64_t v11 = v15;
  id v12 = v9;

  return v12;
}

void __88__PXStorySongsAutoEditDecisionListsProducer__diagnosticTextForAutoEditHUDAtDisplaySize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  long long v6 = v5;
  if (v5) {
    [v5 overallDurationInfo];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithUnsignedInteger:a3 + 1];
  id v9 = [v8 stringValue];
  uint64_t v10 = [v9 stringByPaddingToLength:2 withString:@" " startingAtIndex:0];
  uint64_t v11 = [v6 numberOfClips];
  id v12 = PFStoryDurationInfoDescription();
  uint64_t v13 = [v6 song];
  unint64_t v14 = PXAudioAssetShortDescription(v13);
  objc_msgSend(v7, "appendFormat:", @"%@ %ld Clips: %@; Song:%@;\n",
    v10,
    v11,
    v12,
    v14,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  switch(a3)
  {
    case 8:
      -[PXStorySongsAutoEditDecisionListsProducer _diagnosticTextForAutoEditHUDAtDisplaySize:](self, "_diagnosticTextForAutoEditHUDAtDisplaySize:", a4.width, a4.height);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[PXStorySongsAutoEditDecisionListsProducer _diagnosticTextForComposabilityHUDAtDisplaySize:](self, "_diagnosticTextForComposabilityHUDAtDisplaySize:", a4.width, a4.height);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[PXStorySongsAutoEditDecisionListsProducer _diagnosticTextForMomentsHUDAtDisplaySize:](self, "_diagnosticTextForMomentsHUDAtDisplaySize:", a4.width, a4.height);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      id v4 = &stru_1F00B0030;
      break;
  }
  return v4;
}

- (BOOL)handlesDiagnosticTextForHUDType:(int64_t)a3
{
  return (unint64_t)(a3 - 8) < 3;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = self;
  id v5 = self->_ttrUnitTestsForFailedDurationConstraints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"failed_duration_test%d", v7 + v9);
        [v4 addAttachmentWithSwiftCode:v10 name:v11];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v7 = (v7 + v9);
    }
    while (v6);
  }

  [(NSMutableArray *)v15->_ttrUnitTestsForFailedDurationConstraints removeAllObjects];
  id v12 = [(PXStoryMovieHighlightsCollection *)v15->_movieHighlights diagnosticDescription];
  if (v12) {
    [v4 addAttachmentWithText:v12 name:@"MovieHighlights"];
  }
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__224717;
  v21 = __Block_byref_object_dispose__224718;
  id v22 = 0;
  queue = v15->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PXStorySongsAutoEditDecisionListsProducer_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = v15;
  block[5] = &v17;
  dispatch_sync(queue, block);
  uint64_t v14 = v18[5];
  if (v14) {
    [v4 addAttachmentWithText:v14 name:@"ComposabilityProvider"];
  }
  _Block_object_dispose(&v17, 8);
}

void __87__PXStorySongsAutoEditDecisionListsProducer_collectTapToRadarDiagnosticsIntoContainer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) diagnosticDescription];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)debugQuickLookObject
{
  return +[PXVisualDiagnosticsFactory debugQuickLookObjectWithRootProvider:self];
}

- (void)_addTimeConstraintGraph:(id)a3
{
}

- (void)_addComposabilityGraph:(id)a3
{
}

- (void)_addMomentsGraph:(id)a3
{
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  [v6 addTitlePageWithTitle:@"Auto Edit Visual Diagnostics" subtitle:&stru_1F00B0030];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _addMomentsGraph:v6];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _addComposabilityGraph:v6];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _addTimeConstraintGraph:v6];

  v7[2](v7, 1, 0);
}

- (PXStoryAutoEditMomentsProvider)diagnosticsMomentsProvider
{
  return self->_momentsProvider;
}

- (BOOL)_canOverlapAudioFromClip:(id)a3 withNextClip:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    uint64_t v8 = [v7 displayAssets];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v7 playbackStyle];

    uint64_t v11 = [(PXStorySongsAutoEditDecisionListsProducer *)self _movieHighlightForAsset:v9 playbackStyle:v10];

    id v12 = [v6 displayAssets];
    uint64_t v13 = [v12 firstObject];
    uint64_t v14 = -[PXStorySongsAutoEditDecisionListsProducer _movieHighlightForAsset:playbackStyle:](self, "_movieHighlightForAsset:playbackStyle:", v13, [v6 playbackStyle]);

    id v15 = +[PXStorySettings sharedInstance];
    uint64_t v16 = [v15 audioLCutStrategy];

    if (v16 == 3)
    {
      LODWORD(v16) = [v11 hasVoice];
      [v6 audioInfo];
      char v17 = [v14 hasVoice];
      char v18 = [v14 hasFace];
      if (v16 && v21 >= 2) {
        LOBYTE(v16) = (v17 | v18) ^ 1;
      }
    }
    else if (v16 == 2)
    {
      LODWORD(v16) = [v11 hasVoice];
      [v6 audioInfo];
      char v19 = [v14 hasVoice];
      if (v16)
      {
        if (v22 < 2) {
          LOBYTE(v16) = 1;
        }
        else {
          LOBYTE(v16) = v19 ^ 1;
        }
      }
    }
    else if (v16 != 1)
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_canOverlapAudioFromClip:(id)a3 withPreviousClip:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    uint64_t v8 = [v7 displayAssets];
    uint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v7 playbackStyle];

    uint64_t v11 = [(PXStorySongsAutoEditDecisionListsProducer *)self _movieHighlightForAsset:v9 playbackStyle:v10];

    id v12 = [v6 displayAssets];
    uint64_t v13 = [v12 lastObject];
    uint64_t v14 = -[PXStorySongsAutoEditDecisionListsProducer _movieHighlightForAsset:playbackStyle:](self, "_movieHighlightForAsset:playbackStyle:", v13, [v6 playbackStyle]);

    id v15 = +[PXStorySettings sharedInstance];
    uint64_t v16 = [v15 audioJCutStrategy];

    if (v16 == 3)
    {
      LODWORD(v16) = [v11 hasVoice];
      [v6 audioInfo];
      char v17 = [v14 hasVoice];
      char v18 = [v14 hasFace];
      if (v16 && v21 >= 2) {
        LOBYTE(v16) = (v17 | v18) ^ 1;
      }
    }
    else if (v16 == 2)
    {
      LODWORD(v16) = [v11 hasVoice];
      [v6 audioInfo];
      char v19 = [v14 hasVoice];
      if (v16)
      {
        if (v22 < 2) {
          LOBYTE(v16) = 1;
        }
        else {
          LOBYTE(v16) = v19 ^ 1;
        }
      }
    }
    else if (v16 != 1)
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)_audioCutsFromClip:(id)a3 toClip:(id)a4 useJCut:(BOOL *)a5 useLCut:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  if (!v10)
  {
    if (!v11) {
      goto LABEL_13;
    }
    [v11 audioInfo];
    unint64_t v13 = v14;
LABEL_10:
    if (v13 > 1)
    {
      *a5 = [(PXStorySongsAutoEditDecisionListsProducer *)self _canOverlapAudioFromClip:v12 withPreviousClip:v10];
LABEL_14:
      *a6 = 0;
      goto LABEL_15;
    }
LABEL_13:
    *a5 = 0;
    goto LABEL_14;
  }
  [v10 audioInfo];
  if (!v12)
  {
    if (v15 >= 2) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  [v12 audioInfo];
  unint64_t v13 = v14;
  if (v15 < 2) {
    goto LABEL_10;
  }
  if (v15 == 3 && v14 == 3) {
    goto LABEL_13;
  }
  if (v14 <= 1)
  {
LABEL_16:
    *a6 = [(PXStorySongsAutoEditDecisionListsProducer *)self _canOverlapAudioFromClip:v10 withNextClip:v12];
    *a5 = 0;
    goto LABEL_15;
  }
  *a5 = [(PXStorySongsAutoEditDecisionListsProducer *)self _canOverlapAudioFromClip:v12 withPreviousClip:v10];
  *a6 = [(PXStorySongsAutoEditDecisionListsProducer *)self _canOverlapAudioFromClip:v10 withNextClip:v12];
LABEL_15:
}

- (float)_volumeGainForAsset:(id)a3 movieHighlight:(id)a4 audioMode:(int64_t)a5
{
  float v5 = 0.0;
  if ((unint64_t)a5 >= 2)
  {
    id v7 = a4;
    uint64_t v8 = +[PXStorySettings sharedInstance];
    uint64_t v9 = v8;
    if (a5 == 3) {
      [v8 foregroundAudioLoudnessTarget];
    }
    else {
      [v8 backgroundAudioLoudnessTarget];
    }
    float v11 = v10;
    [v7 loudness];
    float v13 = v11 - v12;
    [v7 peakVolume];
    float v15 = v14;

    float v16 = fmin(fmax((float)(log10f(v15) * -20.0), 0.0), 12.0);
    float v17 = __exp10(fminf(v13, v16) / 20.0);
    float v5 = fminf(v17, 1.0);
  }
  return v5;
}

- ($FF287EE8AFEAB54EC1BB010BF4A7F511)_durationInfoForClip:(SEL)a3 durationMultiplier:(id)a4 songPace:(double)a5 transitionIn:(int64_t)a6 transitionOut:(double *)a7
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v69 = a4;
  if (!a6)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a3, self, @"PXStorySongsAutoEditDecisionListsProducer.m", 1121, @"Invalid parameter not satisfying: %@", @"songPace != PFStoryRecipeSongPaceUnknown" object file lineNumber description];
  }
  v68 = a7;
  uint64_t v14 = [v69 playbackStyle];
  *(_OWORD *)&retstr->var0.CMTime var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.CMTime var0 = 0u;
  retstr->var2.var3 = 0;
  configuration = self->_configuration;
  if (configuration) {
    [(PFStoryAutoEditConfiguration *)configuration durationInfoForPlaybackStyle:v14 songPace:a6];
  }
  float v16 = [v69 displayAssets];
  float v17 = [v16 firstObject];

  if (v14 == 4 && ([v17 mediaSubtypes] & 0x60000) != 0)
  {
    long long time = *(_OWORD *)&retstr->var0.var0;
    *(void *)time_16 = retstr->var0.var3;
    CMTimeMultiplyByRatio(time1, (CMTime *)&time, 3, 2);
    retstr->CMTime var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time1[0];
    CMTimeMake(&rhs, 1, 1);
    long long time = *(_OWORD *)&retstr->var1.var0;
    *(void *)time_16 = retstr->var1.var3;
    CMTimeAdd(time1, (CMTime *)&time, &rhs);
    *(_OWORD *)&retstr->var1.CMTime var0 = *(_OWORD *)&time1[0].value;
    CMTimeEpoch epoch = time1[0].epoch;
    retstr->var1.var3 = time1[0].epoch;
    long long time = *(_OWORD *)&retstr->var1.var0;
    *(void *)time_16 = epoch;
    CMTime time2 = (CMTime)retstr->var0;
    CMTimeMaximum(time1, (CMTime *)&time, &time2);
    retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time1[0];
    long long time = *(_OWORD *)&retstr->var2.var0;
    *(void *)time_16 = retstr->var2.var3;
    CMTime time2 = (CMTime)retstr->var1;
    CMTimeMaximum(time1, (CMTime *)&time, &time2);
    retstr->var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time1[0];
  }
  time1[0] = (CMTime)retstr->var0;
  long long time = *MEMORY[0x1E4F1FA48];
  *(void *)time_16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  if (CMTimeCompare(time1, (CMTime *)&time) <= 0) {
    PXAssertGetLog();
  }
  p_var1 = &retstr->var1;
  time1[0] = (CMTime)retstr->var1;
  long long time = *(_OWORD *)&retstr->var0.var0;
  *(void *)time_16 = retstr->var0.var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0) {
    PXAssertGetLog();
  }
  p_var2 = &retstr->var2;
  time1[0] = (CMTime)retstr->var2;
  long long time = *(_OWORD *)&p_var1->var0;
  *(void *)time_16 = retstr->var1.var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0) {
    PXAssertGetLog();
  }
  long long v21 = *(_OWORD *)&retstr->var2.var0;
  *(_OWORD *)&time_16[16] = *(_OWORD *)&retstr->var1.var1;
  *(_OWORD *)&v83.CMTimeValue value = v21;
  v83.CMTimeEpoch epoch = retstr->var2.var3;
  long long v22 = *(_OWORD *)&retstr->var0.var3;
  long long time = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)time_16 = v22;
  int32_t v23 = llround(a5 * 600.0);
  memset(&time2, 0, sizeof(time2));
  time1[0] = *(CMTime *)&time_16[8];
  CMTimeMultiplyByRatio(&time2, time1, v23, 600);
  memset(&var0, 0, sizeof(var0));
  memset(&v85, 0, sizeof(v85));
  if (a5 < 1.0)
  {
    *(_OWORD *)&time1[0].CMTimeValue value = time;
    time1[0].CMTimeEpoch epoch = *(void *)time_16;
    CMTimeMultiplyByRatio(&var0, time1, v23, 600);
    time1[0] = v83;
    CMTimeMultiplyByRatio(&v85, time1, v23, 600);
  }
  else
  {
    memset(time1, 0, 24);
    CMTime lhs = time2;
    CMTime v77 = *(CMTime *)&time_16[8];
    CMTimeSubtract(time1, &lhs, &v77);
    *(_OWORD *)&v77.CMTimeValue value = time;
    v77.CMTimeEpoch epoch = *(void *)time_16;
    CMTime v76 = time1[0];
    CMTimeAdd(&lhs, &v77, &v76);
    CMTime var0 = lhs;
    CMTime v77 = v83;
    CMTime v76 = time1[0];
    CMTimeAdd(&lhs, &v77, &v76);
    CMTime v85 = lhs;
  }
  long long v24 = *(_OWORD *)&var0.value;
  time1[0] = var0;
  time1[1] = time2;
  long long v25 = *(_OWORD *)&v85.value;
  time1[2] = v85;
  CMTimeEpoch v26 = v85.epoch;
  long long v27 = *(_OWORD *)&time1[0].epoch;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time2.timescale;
  *(_OWORD *)&retstr->var2.CMTime var0 = v25;
  retstr->var2.var3 = v26;
  *(_OWORD *)&retstr->var0.CMTime var0 = v24;
  *(_OWORD *)&retstr->var0.var3 = v27;
  v85.CMTimeScale timescale = 0;
  v85.CMTimeValue value = 0;
  v65 = v17;
  if ((unint64_t)(v14 - 3) > 1)
  {
    CMTimeEpoch v67 = 0;
    CMTimeFlags v31 = 0;
    CMTimeScale timescale = 0;
    CMTimeValue v37 = 0;
    CMTimeEpoch v62 = 0;
    CMTimeFlags v38 = 0;
    v32 = v68;
  }
  else
  {
    uint64_t v28 = [(PXStorySongsAutoEditDecisionListsProducer *)self _movieHighlightForAsset:v17 playbackStyle:v14];
    v29 = v28;
    if (v28)
    {
      [v28 timeRange];
      v85.CMTimeValue value = time1[0].value;
      CMTimeFlags flags = time1[0].flags;
      v85.CMTimeScale timescale = time1[0].timescale;
      CMTimeValue value = time1[1].value;
      CMTimeEpoch v62 = time1[0].epoch;
      CMTimeScale timescale = time1[1].timescale;
      CMTimeFlags v31 = time1[1].flags;
      CMTimeEpoch v67 = time1[1].epoch;
      v32 = v68;
      if (v14 == 4)
      {
        memset(time1, 0, 48);
        long long time = *(_OWORD *)&p_var1->var0;
        *(void *)time_16 = retstr->var1.var3;
        double Seconds = CMTimeGetSeconds((CMTime *)&time);
        long long time = *(_OWORD *)&retstr->var0.var0;
        *(void *)time_16 = retstr->var0.var3;
        double v34 = CMTimeGetSeconds((CMTime *)&time);
        long long time = *(_OWORD *)&p_var2->var0;
        *(void *)time_16 = retstr->var2.var3;
        [v29 bestTimeRangeForPreferredDuration:Seconds min:v34 max:CMTimeGetSeconds((CMTime *)&time)];
        v35 = PLStoryGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          long long time = *(_OWORD *)&time1[0].value;
          *(_OWORD *)time_16 = *(_OWORD *)&time1[0].epoch;
          *(_OWORD *)&time_16[16] = *(_OWORD *)&time1[1].timescale;
          id v36 = PXStoryTimeRangeDescription((uint64_t)&time);
          LODWORD(time) = 138412290;
          *(void *)((char *)&time + 4) = v36;
          _os_log_impl(&dword_1A9AE7000, v35, OS_LOG_TYPE_DEBUG, "Best video clip playback range: %@", (uint8_t *)&time, 0xCu);

          p_var1 = &retstr->var1;
        }

        if ((time1[0].flags & 1) != 0
          && (time1[1].flags & 1) != 0
          && !time1[1].epoch
          && (time1[1].value & 0x8000000000000000) == 0)
        {
          long long time = *(_OWORD *)&time1[1].value;
          *(void *)time_16 = 0;
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          if (CMTimeCompare((CMTime *)&time, &time2))
          {
            CMTime time2 = time1[1];
            CMTime var0 = (CMTime)retstr->var0;
            CMTimeMaximum((CMTime *)&time, &time2, &var0);
            *(_OWORD *)&p_var1->CMTime var0 = time;
            p_var1->var3 = *(void *)time_16;
          }
        }
      }
      CMTimeValue v37 = value;
      CMTimeFlags v38 = flags;
    }
    else
    {
      CMTimeEpoch v67 = 0;
      CMTimeFlags v31 = 0;
      CMTimeScale timescale = 0;
      CMTimeValue v37 = 0;
      CMTimeEpoch v62 = 0;
      CMTimeFlags v38 = 0;
      v32 = v68;
    }
  }
  v39 = PLStoryGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    time1[0] = (CMTime)retstr->var0;
    id v40 = PXStoryTimeDescription(time1);
    time1[0] = (CMTime)*p_var1;
    PXStoryTimeDescription(time1);
    v59 = p_var1;
    v41 = CMTimeFlags v61 = v31;
    *(_OWORD *)&time1[0].CMTimeValue value = *(_OWORD *)&p_var2->var0;
    time1[0].CMTimeEpoch epoch = retstr->var2.var3;
    v42 = PXStoryTimeDescription(time1);
    time1[0].CMTimeValue value = v85.value;
    time1[0].CMTimeScale timescale = v85.timescale;
    time1[0].CMTimeFlags flags = v38;
    time1[0].CMTimeEpoch epoch = v62;
    time1[1].CMTimeValue value = v37;
    time1[1].CMTimeScale timescale = timescale;
    time1[1].CMTimeFlags flags = v61;
    time1[1].CMTimeEpoch epoch = v67;
    PXStoryTimeRangeDescription((uint64_t)time1);
    id v43 = v64 = v38;
    LODWORD(time1[0].value) = 138413058;
    *(CMTimeValue *)((char *)&time1[0].value + 4) = (CMTimeValue)v40;
    LOWORD(time1[0].flags) = 2112;
    *(void *)((char *)&time1[0].flags + 2) = v41;
    HIWORD(time1[0].epoch) = 2112;
    time1[1].CMTimeValue value = (CMTimeValue)v42;
    LOWORD(time1[1].timescale) = 2112;
    *(void *)((char *)&time1[1].timescale + 2) = v43;
    _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_DEBUG, "video clip duration min: %@, pref: %@, max: %@, playback range: %@", (uint8_t *)time1, 0x2Au);

    CMTimeFlags v38 = v64;
    v32 = v68;

    CMTimeFlags v31 = v61;
    p_var1 = v59;
  }
  if ((v38 & 1) != 0 && (v31 & 1) != 0 && !v67 && (v37 & 0x8000000000000000) == 0)
  {
    time1[0].CMTimeValue value = v37;
    time1[0].CMTimeScale timescale = timescale;
    time1[0].CMTimeFlags flags = v31;
    time1[0].CMTimeEpoch epoch = 0;
    long long time = *MEMORY[0x1E4F1FA48];
    *(void *)time_16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    if (CMTimeCompare(time1, (CMTime *)&time))
    {
      memset(&time2, 0, sizeof(time2));
      CMTimeMakeWithSeconds(&v74, *v32 + *a8, 600);
      time1[0].CMTimeValue value = v37;
      time1[0].CMTimeScale timescale = timescale;
      time1[0].CMTimeFlags flags = v31;
      time1[0].CMTimeEpoch epoch = 0;
      long long time = *(_OWORD *)&v74.value;
      *(void *)time_16 = v74.epoch;
      CMTimeSubtract(&time2, time1, (CMTime *)&time);
      time1[0] = time2;
      long long time = *(_OWORD *)&retstr->var0.var0;
      *(void *)time_16 = retstr->var0.var3;
      if (CMTimeCompare(time1, (CMTime *)&time) < 0)
      {
        id v44 = PLStoryGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          time1[0].CMTimeValue value = v85.value;
          time1[0].CMTimeScale timescale = v85.timescale;
          time1[0].CMTimeFlags flags = v38;
          time1[0].CMTimeEpoch epoch = v62;
          time1[1].CMTimeValue value = v37;
          time1[1].CMTimeScale timescale = timescale;
          time1[1].CMTimeFlags flags = v31;
          time1[1].CMTimeEpoch epoch = 0;
          PXStoryTimeRangeDescription((uint64_t)time1);
          id v46 = v45 = v37;
          double v47 = *v32;
          CMTimeValue v48 = *(void *)a8;
          LODWORD(time1[0].value) = 138543874;
          *(CMTimeValue *)((char *)&time1[0].value + 4) = (CMTimeValue)v46;
          LOWORD(time1[0].flags) = 2048;
          *(double *)((char *)&time1[0].flags + 2) = v47;
          HIWORD(time1[0].epoch) = 2048;
          time1[1].CMTimeValue value = v48;
          _os_log_impl(&dword_1A9AE7000, v44, OS_LOG_TYPE_DEBUG, "Playback range %{public}@ too small for transitions %0.1fs/%0.1fs", (uint8_t *)time1, 0x20u);

          CMTimeValue v37 = v45;
        }

        if (*a8 >= *v32)
        {
          *a8 = 0.0;
          double v50 = *v32;
          double v49 = 0.0;
        }
        else
        {
          Float64 *v32 = 0.0;
          double v49 = *a8;
          double v50 = 0.0;
        }
        CMTimeMakeWithSeconds(&v73, v50 + v49, 600);
        time1[0].CMTimeValue value = v37;
        time1[0].CMTimeScale timescale = timescale;
        time1[0].CMTimeFlags flags = v31;
        time1[0].CMTimeEpoch epoch = 0;
        long long time = *(_OWORD *)&v73.value;
        *(void *)time_16 = v73.epoch;
        CMTimeSubtract(&var0, time1, (CMTime *)&time);
        CMTime time2 = var0;
        time1[0] = var0;
        long long time = *(_OWORD *)&retstr->var0.var0;
        *(void *)time_16 = retstr->var0.var3;
        if (CMTimeCompare(time1, (CMTime *)&time) < 0)
        {
          *a8 = 0.0;
          Float64 *v32 = 0.0;
          time2.CMTimeValue value = v37;
          time2.CMTimeScale timescale = timescale;
          time2.CMTimeFlags flags = v31;
          time2.CMTimeEpoch epoch = 0;
        }
      }
      time1[0] = (CMTime)retstr->var0;
      long long time = *(_OWORD *)&time2.value;
      *(void *)time_16 = time2.epoch;
      CMTimeMinimum(&var0, time1, (CMTime *)&time);
      retstr->CMTime var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)var0;
      time1[0] = (CMTime)*p_var1;
      long long time = *(_OWORD *)&time2.value;
      *(void *)time_16 = time2.epoch;
      CMTimeMinimum(&var0, time1, (CMTime *)&time);
      *(CMTime *)p_var1 = var0;
      *(_OWORD *)&time1[0].CMTimeValue value = *(_OWORD *)&p_var2->var0;
      time1[0].CMTimeEpoch epoch = retstr->var2.var3;
      long long time = *(_OWORD *)&time2.value;
      *(void *)time_16 = time2.epoch;
      CMTimeMinimum(&var0, time1, (CMTime *)&time);
      *(_OWORD *)&p_var2->CMTime var0 = *(_OWORD *)&var0.value;
      retstr->var2.var3 = var0.epoch;
    }
  }
  CMTimeMakeWithSeconds(&v72, *v32, 600);
  time1[0] = (CMTime)retstr->var0;
  long long time = *(_OWORD *)&v72.value;
  *(void *)time_16 = v72.epoch;
  CMTimeAdd(&time2, time1, (CMTime *)&time);
  retstr->CMTime var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)time2;
  CMTimeMakeWithSeconds(&v71, *v32, 600);
  time1[0] = (CMTime)*p_var1;
  long long time = *(_OWORD *)&v71.value;
  *(void *)time_16 = v71.epoch;
  CMTimeAdd(&time2, time1, (CMTime *)&time);
  *(CMTime *)p_var1 = time2;
  CMTimeMakeWithSeconds(&v70, *v32, 600);
  *(_OWORD *)&time1[0].CMTimeValue value = *(_OWORD *)&p_var2->var0;
  time1[0].CMTimeEpoch epoch = retstr->var2.var3;
  long long time = *(_OWORD *)&v70.value;
  *(void *)time_16 = v70.epoch;
  CMTimeAdd(&time2, time1, (CMTime *)&time);
  *(_OWORD *)&p_var2->CMTime var0 = *(_OWORD *)&time2.value;
  retstr->var2.var3 = time2.epoch;
  v51 = PLStoryGetLog();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    Float64 v52 = *v32;
    CMTimeValue v53 = *(void *)a8;
    time1[0] = (CMTime)retstr->var0;
    id v54 = PXStoryTimeDescription(time1);
    time1[0] = (CMTime)*p_var1;
    v55 = PXStoryTimeDescription(time1);
    *(_OWORD *)&time1[0].CMTimeValue value = *(_OWORD *)&p_var2->var0;
    time1[0].CMTimeEpoch epoch = retstr->var2.var3;
    id v56 = PXStoryTimeDescription(time1);
    LODWORD(time1[0].value) = 134219010;
    *(Float64 *)((char *)&time1[0].value + 4) = v52;
    LOWORD(time1[0].flags) = 2048;
    *(void *)((char *)&time1[0].flags + 2) = v53;
    HIWORD(time1[0].epoch) = 2112;
    time1[1].CMTimeValue value = (CMTimeValue)v54;
    LOWORD(time1[1].timescale) = 2112;
    *(void *)((char *)&time1[1].timescale + 2) = v55;
    WORD1(time1[1].epoch) = 2112;
    *(CMTimeEpoch *)((char *)&time1[1].epoch + 4) = (CMTimeEpoch)v56;
    _os_log_impl(&dword_1A9AE7000, v51, OS_LOG_TYPE_DEBUG, "video clip duration with transition %0.1fs/%0.1fs => min: %@, pref: %@, max: %@", (uint8_t *)time1, 0x34u);
  }
  time1[0] = (CMTime)retstr->var0;
  long long time = *MEMORY[0x1E4F1FA48];
  *(void *)time_16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  if (CMTimeCompare(time1, (CMTime *)&time) <= 0) {
    PXAssertGetLog();
  }
  time1[0] = (CMTime)*p_var1;
  long long time = *(_OWORD *)&retstr->var0.var0;
  *(void *)time_16 = retstr->var0.var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0) {
    PXAssertGetLog();
  }
  *(_OWORD *)&time1[0].CMTimeValue value = *(_OWORD *)&p_var2->var0;
  time1[0].CMTimeEpoch epoch = retstr->var2.var3;
  long long time = *(_OWORD *)&p_var1->var0;
  *(void *)time_16 = p_var1->var3;
  if (CMTimeCompare(time1, (CMTime *)&time) < 0) {
    PXAssertGetLog();
  }

  return result;
}

- (id)_movieHighlightForAsset:(id)a3 playbackStyle:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PXStorySongsAutoEditDecisionListsProducer *)self movieHighlights];
  uint64_t v8 = [v7 movieHighlightsForDisplayAsset:v6];

  if (!v8) {
    goto LABEL_16;
  }
  switch(a4)
  {
    case 3:
      uint64_t v9 = PXStoryMovieHighlightForPlaybackStyle(v8, 3);
      if (v9) {
        goto LABEL_17;
      }
      double v10 = PLStoryGetLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      float v16 = v8;
      float v11 = "No highlight for live photo: %@, curation: %@";
      goto LABEL_14;
    case 5:
      uint64_t v9 = PXStoryMovieHighlightForPlaybackStyle(v8, 5);
      if (v9) {
        goto LABEL_17;
      }
      double v10 = PLStoryGetLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      float v16 = v8;
      float v11 = "No highlight for looping video: %@, curation: %@";
      goto LABEL_14;
    case 4:
      uint64_t v9 = PXStoryMovieHighlightForPlaybackStyle(v8, 4);
      if (v9) {
        goto LABEL_17;
      }
      double v10 = PLStoryGetLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      float v16 = v8;
      float v11 = "No highlight for video: %@, curation: %@";
LABEL_14:
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x16u);
LABEL_15:

      break;
  }
LABEL_16:
  uint64_t v9 = 0;
LABEL_17:

  return v9;
}

- (int64_t)_playbackStyleForAsset:(id)a3 songPace:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [v6 playbackStyle];
  switch(v7)
  {
    case 0:
      int64_t v7 = 1;
      break;
    case 1:
    case 2:
    case 4:
    case 5:
      break;
    case 3:
      uint64_t v9 = +[PXStorySettings sharedInstance];
      char v10 = [v9 forceLivePhotoVideo];

      if (v10)
      {
        int64_t v7 = 3;
      }
      else
      {
        float v11 = [(PXStorySongsAutoEditDecisionListsProducer *)self movieHighlights];
        float v12 = [v11 movieHighlightsForDisplayAsset:v6];

        *(_OWORD *)&v27.CMTimeValue value = PXStoryTimeZero;
        v27.CMTimeEpoch epoch = 0;
        int v13 = [v12 livePhoto];
        id v14 = v13;
        if (v13)
        {
          [v13 timeRange];
          CMTime v27 = v26;
        }
        else if ([v6 isEligibleForAutoPlayback])
        {
          __int16 v15 = [v12 defaultHighlight];
          float v16 = v15;
          if (v15)
          {
            [v15 timeRange];
            CMTime v27 = v25;
          }
        }
        uint64_t v24 = 0;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        configuration = self->_configuration;
        if (configuration) {
          [(PFStoryAutoEditConfiguration *)configuration durationInfoForPlaybackStyle:3 songPace:a4];
        }
        CMTime time1 = v27;
        *(_OWORD *)&v18.CMTimeValue value = v20;
        v18.CMTimeEpoch epoch = v21;
        if (CMTimeCompare(&time1, &v18) < 0) {
          int64_t v7 = 1;
        }
        else {
          int64_t v7 = 3;
        }
      }
      break;
    default:
      int64_t v7 = 0;
      break;
  }

  return v7;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)_optimizeOverallDurationOfClips:(SEL)a3 forSong:(id)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v68 = a4;
  id v8 = a5;
  [v8 pace];
  PXAudioAssetExportableDurationWithDefaultEntryPoint(v8, (uint64_t)&v100);
  CMTimeValue v111 = v100;
  CMTimeScale v112 = v101;
  if (v102)
  {
    CMTimeFlags v66 = v102;
    CMTimeEpoch v9 = v103;
  }
  else
  {
    CMTimeEpoch v9 = 0;
    CMTimeScale v112 = 0;
    CMTimeValue v111 = 0;
    CMTimeFlags v66 = 5;
  }
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  float v11 = self->_log;
  float v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    os_signpost_id_t v14 = v10;
    CMTimeValue v15 = [v68 numberOfClips];
    PFStoryRecipeSongPaceDescription();
    v65 = self;
    CMTimeEpoch v16 = v9;
    id v17 = v8;
    CMTime v18 = retstr;
    long long v20 = v19 = v13;
    LODWORD(buf[0].value) = 134218242;
    *(CMTimeValue *)((char *)&buf[0].value + 4) = v15;
    os_signpost_id_t v10 = v14;
    LOWORD(buf[0].flags) = 2114;
    *(void *)((char *)&buf[0].flags + 2) = v20;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryAutoEditDecisionList.OverallDuration", "Count=%ld pace=%{public}@", (uint8_t *)buf, 0x16u);

    unint64_t v13 = v19;
    retstr = v18;
    id v8 = v17;
    CMTimeEpoch v9 = v16;
    self = v65;
  }

  int64_t kind = self->_targetOverallDurationInfo.kind;
  long long v22 = (_OWORD *)MEMORY[0x1E4F8D288];
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 48);
  *(_OWORD *)&retstr->var1.var1.CMTime var0 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 32);
  *(_OWORD *)&retstr->var1.var1.var3 = v23;
  *(_OWORD *)&retstr->var1.var2.var1 = v22[4];
  long long v24 = v22[1];
  *(_OWORD *)&retstr->CMTime var0 = *v22;
  *(_OWORD *)&retstr->var1.var0.var1 = v24;
  if (kind)
  {
    CMTime v25 = objc_opt_new();
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke;
    v98[3] = &unk_1E5DC9840;
    id v67 = v25;
    id v99 = v67;
    [v68 enumerateClipsUsingBlock:v98];
    switch(self->_targetOverallDurationInfo.kind)
    {
      case 1:
      case 5:
        memset(&v104, 0, sizeof(v104));
        configuration = self->_configuration;
        if (configuration)
        {
          [(PFStoryAutoEditConfiguration *)configuration longOverallDuration];
        }
        else
        {
          long long v77 = 0u;
          memset(&v78, 0, sizeof(v78));
          long long v75 = 0u;
          long long v76 = 0u;
        }
        buf[0] = v78;
        *(void *)CMTime time2 = v111;
        *(_DWORD *)&time2[8] = v112;
        *(_DWORD *)&time2[12] = v66;
        *(void *)&time2[16] = v9;
        CMTimeMinimum(&v104, buf, (CMTime *)time2);
        buf[0] = v104;
        if ([v67 solveForMaximumDuration:buf]) {
          goto LABEL_48;
        }
        memset(v110, 0, sizeof(v110));
        memset(buf, 0, sizeof(buf));
        if (v67) {
          [v67 constrainedOverallDurationInfo];
        }
        *(_OWORD *)CMTime time2 = *(_OWORD *)((char *)v110 + 8);
        *(void *)&time2[16] = *((void *)&v110[1] + 1);
        CMTime v93 = v104;
        if (CMTimeCompare((CMTime *)time2, &v93) < 1) {
          goto LABEL_72;
        }
        unint64_t v29 = v13;
        v30 = PLStoryGetLog();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
          goto LABEL_45;
        }
        goto LABEL_44;
      case 2:
        memset(&v104, 0, sizeof(v104));
        if ((self->_targetOverallDurationInfo.specificDurationInfo.maximumDuration.flags & 0x1D) == 1)
        {
          buf[0] = (CMTime)self->_targetOverallDurationInfo.specificDurationInfo.maximumDuration;
          *(void *)CMTime time2 = v111;
          *(_DWORD *)&time2[8] = v112;
          *(_DWORD *)&time2[12] = v66;
          *(void *)&time2[16] = v9;
          CMTimeMinimum(&v104, buf, (CMTime *)time2);
        }
        else
        {
          CMTimeFlags v31 = self->_configuration;
          if (v31)
          {
            [(PFStoryAutoEditConfiguration *)v31 longOverallDuration];
          }
          else
          {
            long long v81 = 0u;
            memset(&v82, 0, sizeof(v82));
            long long v79 = 0u;
            long long v80 = 0u;
          }
          buf[0] = v82;
          *(void *)CMTime time2 = v111;
          *(_DWORD *)&time2[8] = v112;
          *(_DWORD *)&time2[12] = v66;
          *(void *)&time2[16] = v9;
          CMTimeMinimum(&v93, buf, (CMTime *)time2);
          CMTime v104 = v93;
        }
        buf[0] = v104;
        if ([v67 solveForMaximumDuration:buf]) {
          goto LABEL_48;
        }
        memset(v110, 0, sizeof(v110));
        memset(buf, 0, sizeof(buf));
        if (v67) {
          [v67 constrainedOverallDurationInfo];
        }
        *(_OWORD *)CMTime time2 = *(_OWORD *)((char *)v110 + 8);
        *(void *)&time2[16] = *((void *)&v110[1] + 1);
        v93.CMTimeValue value = v111;
        v93.CMTimeScale timescale = v112;
        v93.CMTimeFlags flags = v66;
        v93.CMTimeEpoch epoch = v9;
        if (CMTimeCompare((CMTime *)time2, &v93) < 1) {
          goto LABEL_72;
        }
        unint64_t v29 = v13;
        v30 = PLStoryGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
LABEL_44:
          *(CMTime *)CMTime time2 = v104;
          CMTimeFlags v38 = PXStoryTimeDescription((CMTime *)time2);
          long long v106 = *(_OWORD *)&buf[1].timescale;
          long long v107 = v110[0];
          long long v108 = v110[1];
          *(_OWORD *)CMTime time2 = *(_OWORD *)&buf[0].value;
          *(_OWORD *)&time2[16] = *(_OWORD *)&buf[0].epoch;
          v39 = PFStoryOverallDurationInfoDescription();
          *(_DWORD *)CMTime time2 = 138412546;
          *(void *)&time2[4] = v38;
          *(_WORD *)&time2[12] = 2114;
          *(void *)&time2[14] = v39;
          _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_INFO, "Failed to constrain maximum duration of auto edit clips for the Long duration to %@ or less. Actual overall duration: %{public}@", time2, 0x16u);
        }
LABEL_45:

        ttrUnitTestsForFailedDurationConstraints = self->_ttrUnitTestsForFailedDurationConstraints;
        v41 = PFStoryRecipeSongPaceDescription();
        *(CMTime *)CMTime time2 = v104;
        v42 = [v67 diagnosticSwiftCodeForDurationUnitTestNamed:v41 maximumDuration:time2];
        [(NSMutableArray *)ttrUnitTestsForFailedDurationConstraints addObject:v42];

        goto LABEL_71;
      case 3:
        memset(&v104, 0, sizeof(v104));
        CMTime v27 = self->_configuration;
        if (v27)
        {
          [(PFStoryAutoEditConfiguration *)v27 shortOverallDuration];
        }
        else
        {
          long long v96 = 0u;
          memset(&v97, 0, sizeof(v97));
          long long v94 = 0u;
          long long v95 = 0u;
        }
        buf[0] = v97;
        *(void *)CMTime time2 = v111;
        *(_DWORD *)&time2[8] = v112;
        *(_DWORD *)&time2[12] = v66;
        *(void *)&time2[16] = v9;
        CMTimeMinimum(&v104, buf, (CMTime *)time2);
        buf[0] = v104;
        if (![v67 solveForMaximumDuration:buf]) {
          goto LABEL_72;
        }
        goto LABEL_48;
      case 4:
        memset(&v93, 0, sizeof(v93));
        uint64_t v28 = self->_configuration;
        if (v28)
        {
          [(PFStoryAutoEditConfiguration *)v28 mediumOverallDuration];
        }
        else
        {
          long long v91 = 0u;
          memset(&v92, 0, sizeof(v92));
          long long v89 = 0u;
          long long v90 = 0u;
        }
        buf[0] = v92;
        *(void *)CMTime time2 = v111;
        *(_DWORD *)&time2[8] = v112;
        *(_DWORD *)&time2[12] = v66;
        *(void *)&time2[16] = v9;
        CMTimeMinimum(&v93, buf, (CMTime *)time2);
        buf[0] = v93;
        if ([v67 solveForMaximumDuration:buf]) {
          goto LABEL_48;
        }
        memset(v110, 0, sizeof(v110));
        memset(buf, 0, sizeof(buf));
        if (v67) {
          [v67 constrainedOverallDurationInfo];
        }
        v32 = PLStoryGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(CMTime *)CMTime time2 = v93;
          PXStoryTimeDescription((CMTime *)time2);
          CMTimeFlags v64 = retstr;
          double v34 = v33 = v13;
          long long v106 = *(_OWORD *)&buf[1].timescale;
          long long v107 = v110[0];
          long long v108 = v110[1];
          *(_OWORD *)CMTime time2 = *(_OWORD *)&buf[0].value;
          *(_OWORD *)&time2[16] = *(_OWORD *)&buf[0].epoch;
          PFStoryOverallDurationInfoDescription();
          id v36 = v35 = v10;
          *(_DWORD *)CMTime time2 = 138412546;
          *(void *)&time2[4] = v34;
          *(_WORD *)&time2[12] = 2114;
          *(void *)&time2[14] = v36;
          _os_log_impl(&dword_1A9AE7000, v32, OS_LOG_TYPE_INFO, "Failed to constrain maximum duration of auto edit clips for the Medium duration to %@ or less. Actual overall duration: %{public}@", time2, 0x16u);

          os_signpost_id_t v10 = v35;
          unint64_t v13 = v33;
          retstr = v64;
        }

        memset(&v88, 0, sizeof(v88));
        CMTimeValue v37 = self->_configuration;
        if (v37)
        {
          [(PFStoryAutoEditConfiguration *)v37 longOverallDuration];
        }
        else
        {
          uint64_t v87 = 0;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
        }
        *(_OWORD *)CMTime time2 = v86;
        *(void *)&time2[16] = v87;
        v104.CMTimeValue value = v111;
        v104.CMTimeScale timescale = v112;
        v104.CMTimeFlags flags = v66;
        v104.CMTimeEpoch epoch = v9;
        CMTimeMinimum(&v88, (CMTime *)time2, &v104);
        *(CMTime *)CMTime time2 = v88;
        if ([v67 solveForMaximumDuration:time2])
        {
LABEL_48:
          os_signpost_id_t v62 = v10;
          id v63 = v8;
          if ([v68 numberOfClips] >= 1)
          {
            uint64_t v43 = 0;
            id v44 = (CMTime *)MEMORY[0x1E4F1FA48];
            do
            {
              memset(v110, 0, 24);
              memset(buf, 0, sizeof(buf));
              if (v67) {
                [v67 constrainedDurationInfoAtIndex:v43];
              }
              *(CMTime *)CMTime time2 = buf[0];
              CMTime v104 = *v44;
              if (CMTimeCompare((CMTime *)time2, &v104) <= 0) {
                PXAssertGetLog();
              }
              *(CMTime *)CMTime time2 = buf[1];
              CMTime v104 = *v44;
              if (CMTimeCompare((CMTime *)time2, &v104) <= 0) {
                PXAssertGetLog();
              }
              *(CMTime *)CMTime time2 = buf[1];
              CMTime v104 = buf[0];
              if (CMTimeCompare((CMTime *)time2, &v104) < 0) {
                PXAssertGetLog();
              }
              CMTimeValue v45 = PLStoryGetLog();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              {
                *(CMTime *)CMTime time2 = buf[1];
                id v46 = PXStoryTimeDescription((CMTime *)time2);
                *(_DWORD *)CMTime time2 = 134218242;
                *(void *)&time2[4] = v43;
                *(_WORD *)&time2[12] = 2114;
                *(void *)&time2[14] = v46;
                _os_log_impl(&dword_1A9AE7000, v45, OS_LOG_TYPE_DEBUG, "constrained duration [%lu] %{public}@", time2, 0x16u);
              }
              v69[0] = MEMORY[0x1E4F143A8];
              v69[1] = 3221225472;
              v69[2] = __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke_238;
              v69[3] = &__block_descriptor_104_e38_v16__0___PXStoryMutableAutoEditClip__8l;
              long long v72 = *(_OWORD *)&buf[1].timescale;
              long long v73 = v110[0];
              uint64_t v74 = *(void *)&v110[1];
              long long v70 = *(_OWORD *)&buf[0].value;
              long long v71 = *(_OWORD *)&buf[0].epoch;
              [v68 updateClipAtIndex:v43++ usingBlock:v69];
            }
            while (v43 < [v68 numberOfClips]);
          }
          double v47 = v67;
          if (v67)
          {
            [v67 constrainedOverallDurationInfo];
          }
          else
          {
            memset(v110, 0, sizeof(v110));
            memset(buf, 0, sizeof(buf));
          }
          os_signpost_id_t v10 = v62;
          long long v48 = v110[0];
          *(_OWORD *)&retstr->var1.var1.CMTime var0 = *(_OWORD *)&buf[1].timescale;
          *(_OWORD *)&retstr->var1.var1.var3 = v48;
          *(_OWORD *)&retstr->var1.var2.var1 = v110[1];
          long long v49 = *(_OWORD *)&buf[0].epoch;
          *(_OWORD *)&retstr->CMTime var0 = *(_OWORD *)&buf[0].value;
          *(_OWORD *)&retstr->var1.var0.var1 = v49;
          id v8 = v63;
        }
        else
        {
          if (v67)
          {
            [v67 constrainedOverallDurationInfo];
          }
          else
          {
            long long v107 = 0u;
            long long v108 = 0u;
            long long v106 = 0u;
            memset(time2, 0, sizeof(time2));
          }
          unint64_t v29 = v13;
          *(_OWORD *)&buf[1].CMTimeScale timescale = v106;
          v110[0] = v107;
          v110[1] = v108;
          *(_OWORD *)&buf[0].CMTimeValue value = *(_OWORD *)time2;
          *(_OWORD *)&buf[0].CMTimeEpoch epoch = *(_OWORD *)&time2[16];
          double v50 = PLStoryGetLog();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(CMTime *)CMTime time2 = v88;
            v51 = PXStoryTimeDescription((CMTime *)time2);
            long long v106 = *(_OWORD *)&buf[1].timescale;
            long long v107 = v110[0];
            long long v108 = v110[1];
            *(_OWORD *)CMTime time2 = *(_OWORD *)&buf[0].value;
            *(_OWORD *)&time2[16] = *(_OWORD *)&buf[0].epoch;
            Float64 v52 = PFStoryOverallDurationInfoDescription();
            *(_DWORD *)CMTime time2 = 138412546;
            *(void *)&time2[4] = v51;
            *(_WORD *)&time2[12] = 2114;
            *(void *)&time2[14] = v52;
            _os_log_impl(&dword_1A9AE7000, v50, OS_LOG_TYPE_INFO, "Also failed to constrain to backup Long duration of %@ or less. Actual overall duration: %{public}@", time2, 0x16u);
          }
          CMTimeValue v53 = self->_ttrUnitTestsForFailedDurationConstraints;
          id v54 = PFStoryRecipeSongPaceDescription();
          *(CMTime *)CMTime time2 = v88;
          v55 = [v67 diagnosticSwiftCodeForDurationUnitTestNamed:v54 maximumDuration:time2];
          [(NSMutableArray *)v53 addObject:v55];

LABEL_71:
          unint64_t v13 = v29;
LABEL_72:
          id v56 = PLStoryGetLog();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            v57 = PFStoryOverallDurationKindDescription();
            v58 = PFStoryRecipeSongPaceDescription();
            LODWORD(buf[0].value) = 138543618;
            *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v57;
            LOWORD(buf[0].flags) = 2114;
            *(void *)((char *)&buf[0].flags + 2) = v58;
            _os_log_impl(&dword_1A9AE7000, v56, OS_LOG_TYPE_INFO, "Unable to constrain clip durations to '%{public}@' for the song pace '%{public}@'.", (uint8_t *)buf, 0x16u);
          }
          double v47 = v67;
        }
        v59 = self->_log;
        v60 = v59;
        if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v59))
        {
          LOWORD(buf[0].value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v60, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryAutoEditDecisionList.OverallDuration", "", (uint8_t *)buf, 2u);
        }

        break;
      default:
        goto LABEL_72;
    }
  }

  return result;
}

uint64_t __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    [a2 durationInfo];
  }
  else
  {
    uint64_t v5 = 0;
    memset(v4, 0, sizeof(v4));
  }
  return [v2 addClipWithDurationInfo:v4];
}

uint64_t __85__PXStorySongsAutoEditDecisionListsProducer__optimizeOverallDurationOfClips_forSong___block_invoke_238(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v2;
  uint64_t v6 = *(void *)(a1 + 96);
  long long v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return [a2 setDurationInfo:v5];
}

- (void)_adjustAudioTransitionForClips:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  uint64_t v6 = self->_log;
  int64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v4 numberOfClips];
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXStoryAutoEditDecisionList.AudioCuts", "Count=%ld", buf, 0xCu);
  }

  id v8 = +[PXStorySettings sharedInstance];
  char v9 = [v8 wantsAudioJLCuts];
  [v8 audioJCutDuration];
  uint64_t v11 = v10;
  [v8 audioLCutDuration];
  uint64_t v13 = v12;
  char v14 = [v8 wantsAudioFade];
  [v8 audioFadeMinDuration];
  uint64_t v16 = v15;
  [v8 audioFadeMaxDuration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__PXStorySongsAutoEditDecisionListsProducer__adjustAudioTransitionForClips___block_invoke;
  v20[3] = &unk_1E5DC6E88;
  v20[4] = self;
  char v21 = v9;
  v20[5] = v11;
  v20[6] = v13;
  char v22 = v14;
  v20[7] = v16;
  v20[8] = v17;
  [v4 enumeratePairsOfMutableClipsUsingBlock:v20];
  CMTime v18 = self->_log;
  unint64_t v19 = v18;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_END, v5, "PXStoryAutoEditDecisionList.AudioCuts", "", buf, 2u);
  }
}

void __76__PXStorySongsAutoEditDecisionListsProducer__adjustAudioTransitionForClips___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v44 = 0;
  [*(id *)(a1 + 32) _audioCutsFromClip:v5 toClip:v6 useJCut:(char *)&v44 + 1 useLCut:&v44];
  uint64_t v43 = 0;
  long long v7 = 0uLL;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  if (v5)
  {
    [v5 audioInfo];
    long long v7 = 0uLL;
  }
  uint64_t v39 = 0;
  long long v37 = v7;
  long long v38 = v7;
  long long v36 = v7;
  if (v6) {
    [v6 audioInfo];
  }
  double v8 = 0.0;
  double v9 = 0.0;
  if (HIBYTE(v44) && *(unsigned char *)(a1 + 72))
  {
    double v10 = *(double *)(a1 + 40);
    if (v5)
    {
      [v5 durationInfo];
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
    }
    *(_OWORD *)&time.CMTimeValue value = v30;
    time.CMTimeEpoch epoch = v31;
    *(double *)&long long v7 = CMTimeGetSeconds(&time);
    double v9 = fmin(v10, *(double *)&v7);
  }
  *((double *)&v37 + 1) = v9;
  if ((_BYTE)v44 && *(unsigned char *)(a1 + 72))
  {
    double v11 = *(double *)(a1 + 48);
    if (v6)
    {
      [v6 durationInfo];
    }
    else
    {
      uint64_t v28 = 0;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
    }
    *(_OWORD *)&v29.CMTimeValue value = v24;
    v29.CMTimeEpoch epoch = v25;
    *(double *)&long long v7 = CMTimeGetSeconds(&v29);
    double v8 = fmin(v11, *(double *)&v7);
  }
  *(double *)&long long v42 = v8;
  if (!*(unsigned char *)(a1 + 73))
  {
    double v12 = 0.0;
LABEL_25:
    *(void *)&long long v7 = 0;
    goto LABEL_30;
  }
  double v12 = 0.0;
  if ((unint64_t)v36 < 2) {
    goto LABEL_24;
  }
  if (v5)
  {
    [v5 transitionInfo];
    double v13 = *((double *)&v22 + 1);
    BOOL v14 = *(unsigned char *)(a1 + 73) == 0;
  }
  else
  {
    BOOL v14 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    double v13 = 0.0;
  }
  double v12 = fmin(fmax(*(double *)(a1 + 56), v9 + v13), *(double *)(a1 + 64));
  *(void *)&long long v7 = 0;
  if (!v14)
  {
LABEL_24:
    if ((unint64_t)v40 < 2) {
      goto LABEL_25;
    }
    if (v5)
    {
      objc_msgSend(v5, "transitionInfo", *(double *)&v7);
      double v15 = *((double *)&v20 + 1);
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      double v15 = 0.0;
    }
    *(double *)&long long v7 = fmin(fmax(*(double *)(a1 + 56), v8 + v15), *(double *)(a1 + 64));
  }
LABEL_30:
  *((double *)&v38 + 1) = v12;
  uint64_t v43 = v7;
  v18[0] = v40;
  v18[1] = v41;
  v18[2] = v42;
  uint64_t v19 = v7;
  [v5 setAudioInfo:v18];
  v16[0] = v36;
  v16[1] = v37;
  v16[2] = v38;
  uint64_t v17 = v39;
  [v6 setAudioInfo:v16];
}

- (void)_adjustAudioPlaybackForClips:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  id v6 = self->_log;
  long long v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v4 numberOfClips];
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXStoryAutoEditDecisionList.AudioMode", "Count=%ld", buf, 0xCu);
  }

  double v8 = [(PXStorySongsAutoEditDecisionListsProducer *)self storyConfiguration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PXStorySongsAutoEditDecisionListsProducer__adjustAudioPlaybackForClips___block_invoke;
  v12[3] = &unk_1E5DC6E38;
  v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  [v4 enumerateMutableClipsUsingBlock:v12];
  double v10 = self->_log;
  double v11 = v10;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, v5, "PXStoryAutoEditDecisionList.AudioMode", "", buf, 2u);
  }
}

void __74__PXStorySongsAutoEditDecisionListsProducer__adjustAudioPlaybackForClips___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 displayAssets];
  os_signpost_id_t v5 = [v4 firstObject];

  id v6 = objc_msgSend(*(id *)(a1 + 32), "_movieHighlightForAsset:playbackStyle:", v5, objc_msgSend(v3, "playbackStyle"));
  long long v19 = 0u;
  long long v20 = 0u;
  int v21 = 0;
  long long v7 = objc_opt_class();
  double v8 = +[PXStorySettings sharedInstance];
  [v8 audioQualityMin];
  int v10 = v9;
  uint64_t v11 = [v3 playbackStyle];
  LODWORD(v12) = v10;
  uint64_t v13 = [v7 audioModeDecisionForAsset:v5 minimumAudioScore:v11 playbackStyle:v6 movieHighlight:*(void *)(a1 + 40) storyConfiguration:v12];
  uint64_t v15 = v14;

  [*(id *)(a1 + 32) _volumeGainForAsset:v5 movieHighlight:v6 audioMode:v13];
  v17[0] = v13;
  v17[1] = v15;
  int v18 = v16;
  [v3 setAudioInfo:v17];
}

- (void)_adjustDurationOfClips:(id)a3 forSongPace:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  double v8 = self->_log;
  int v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v8))
  {
    uint64_t v10 = [v6 numberOfClips];
    uint64_t v11 = PFStoryRecipeSongPaceDescription();
    *(_DWORD *)buf = 134218242;
    uint64_t v26 = v10;
    __int16 v27 = 2114;
    uint64_t v28 = v11;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PXStoryAutoEditDecisionList.Durations", "Count=%ld pace=%{public}@", buf, 0x16u);
  }
  double v12 = self->_configuration;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke;
  v23[3] = &unk_1E5DC6E38;
  v23[4] = self;
  uint64_t v13 = v12;
  long long v24 = v13;
  [v6 enumerateMutableClipsUsingBlock:v23];
  if ([v6 numberOfClips] >= 1)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_2;
    v21[3] = &unk_1E5DC6CD8;
    uint64_t v14 = v13;
    long long v22 = v14;
    [v6 updateClipAtIndex:0 usingBlock:v21];
    uint64_t v15 = [v6 numberOfClips] - 1;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_3;
    v19[3] = &unk_1E5DC6CD8;
    long long v20 = v14;
    [v6 updateClipAtIndex:v15 usingBlock:v19];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_4;
  _OWORD v18[3] = &unk_1E5DC6E60;
  v18[4] = self;
  v18[5] = a4;
  [v6 enumeratePairsOfMutableClipsUsingBlock:v18];
  int v16 = self->_log;
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryAutoEditDecisionList.Durations", "", buf, 2u);
  }
}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 displayAssets];
  uint64_t v4 = [v3 count];
  if (v4 == 1)
  {
    os_signpost_id_t v5 = [v3 objectAtIndexedSubscript:0];
    id v6 = [*(id *)(a1 + 32) chapterCollection];
    int v7 = [v6 containsChapterBeginningWithAsset:v5];

    if (v7)
    {
      [*(id *)(a1 + 40) chapterBeginDurationMultiplier];
      objc_msgSend(v10, "setDurationMultiplier:");
    }
  }
  else
  {
    BOOL v8 = v4 == 2;
    if (v4 >= 2)
    {
      int v9 = *(void **)(a1 + 40);
      if (v8) {
        [v9 diptychDurationMultiplier];
      }
      else {
        [v9 triptychDurationMultiplier];
      }
      objc_msgSend(v10, "setDurationMultiplier:");
    }
  }
}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_2(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 initialDurationMultiplier];
  objc_msgSend(v3, "setDurationMultiplier:");
}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_3(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 finalDurationMultiplier];
  objc_msgSend(v3, "setDurationMultiplier:");
}

void __80__PXStorySongsAutoEditDecisionListsProducer__adjustDurationOfClips_forSongPace___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (v5)
    {
      [v5 transitionInfo];
      double v7 = *((double *)&v38 + 1);
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      double v7 = 0.0;
    }
    double v40 = v7;
    [v6 transitionInfo];
    double v37 = v36;
    [v6 durationMultiplier];
    BOOL v8 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(v8, "_durationInfoForClip:durationMultiplier:songPace:transitionIn:transitionOut:", v6, *(void *)(a1 + 40), &v40, &v37);
    }
    else
    {
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
    }
    v29[2] = v33;
    v29[3] = v34;
    uint64_t v30 = v35;
    v29[0] = v31;
    v29[1] = v32;
    [v6 setDurationInfo:v29];
    double v9 = v37;
    [v6 transitionInfo];
    if (v9 < v28)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      [v6 transitionInfo];
      if (v37 == 0.0) {
        *(void *)&long long v16 = 1;
      }
      *((double *)&v16 + 1) = v37;
      v27[0] = v16;
      v27[1] = v17;
      [v6 setTransitionInfo:v27];
    }
    double v10 = v40;
    if (v5)
    {
      [v5 transitionInfo];
      if (v10 >= *((double *)&v25 + 1)) {
        goto LABEL_25;
      }
      long long v23 = 0u;
      long long v24 = 0u;
      [v5 transitionInfo];
      double v10 = v40;
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      if (v40 >= 0.0) {
        goto LABEL_25;
      }
      long long v23 = 0uLL;
      long long v24 = 0uLL;
    }
    if (v10 == 0.0) {
      *(void *)&long long v23 = 1;
    }
    memset(&v22, 0, sizeof(v22));
    if (v5)
    {
      [v5 transitionInfo];
      double v11 = *((double *)&v20 + 1);
      double v10 = v40;
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      double v11 = 0.0;
    }
    CMTimeMakeWithSeconds(&v22, v11 - v10, 600);
    long long v18 = 0u;
    memset(&v19, 0, sizeof(v19));
    long long v16 = 0u;
    long long v17 = 0u;
    if (v5) {
      [v5 durationInfo];
    }
    CMTime lhs = v19;
    CMTime rhs = v22;
    CMTimeAdd(&v15, &lhs, &rhs);
    CMTime v19 = v15;
    v13[2] = v18;
    CMTime v14 = v15;
    v13[0] = v16;
    v13[1] = v17;
    [v5 setDurationInfo:v13];
    *((double *)&v23 + 1) = v40;
    v12[0] = v23;
    v12[1] = v24;
    [v5 setTransitionInfo:v12];
  }
LABEL_25:
}

- (id)_indexesOfClips:(id)a3 atChapterBeginningInChapterCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 numberOfClips];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      double v10 = [v5 clipAtIndex:i];
      double v11 = [v10 displayAssets];
      double v12 = [v11 firstObject];

      if (v12 && [v6 containsChapterBeginningWithAsset:v12]) {
        [v8 addIndex:i];
      }
    }
  }
  uint64_t v13 = (void *)[v8 copy];

  return v13;
}

- (void)_adjustTransitionsInClips:(id)a3 forChapterCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 numberOfChapters])
  {
    id v8 = [(PXStorySongsAutoEditDecisionListsProducer *)self _indexesOfClips:v6 atChapterBeginningInChapterCollection:v7];
    double v9 = +[PXStoryTransitionsSettings sharedInstance];
    char v10 = [v9 forcedTransitionKindAtChapterBoundary];
    char v11 = [v9 disableUnsupportedTransitionsAtChapterBoundary];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __92__PXStorySongsAutoEditDecisionListsProducer__adjustTransitionsInClips_forChapterCollection___block_invoke;
    _OWORD v13[3] = &unk_1E5DC6E10;
    id v14 = v8;
    char v15 = v10;
    char v16 = v11;
    id v12 = v8;
    [v6 enumerateMutableClipsUsingBlock:v13];
  }
}

void __92__PXStorySongsAutoEditDecisionListsProducer__adjustTransitionsInClips_forChapterCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int v6 = [*(id *)(a1 + 32) containsIndex:a3 + 1];
  int v7 = [*(id *)(a1 + 32) containsIndex:a3];
  int v8 = v7;
  if ((v6 & 1) != 0 || v7)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    if (v5) {
      [v5 transitionInfo];
    }
    unsigned int v9 = *(char *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      if (v9 < 9) {
        uint64_t v13 = v9 - 1 + 1;
      }
      else {
        uint64_t v13 = 0;
      }
      if ((unint64_t)(v13 - 5) <= 3)
      {
        uint64_t v11 = qword_1AB35D488[v13 - 5];
        uint64_t v12 = 1;
      }
      *(void *)&long long v15 = v13;
      *((void *)&v15 + 1) = 0x3FE0000000000000;
      *(void *)&long long v16 = v12;
      *((void *)&v16 + 1) = v11;
      goto LABEL_17;
    }
    if (!*(unsigned char *)(a1 + 41)) {
      goto LABEL_17;
    }
    if (v6)
    {
      unsigned int v10 = (0x13u >> v15) & 1;
      if ((unint64_t)v15 > 9) {
        LOBYTE(v10) = 1;
      }
      if (!v8) {
        goto LABEL_15;
      }
    }
    else
    {
      LOBYTE(v10) = 1;
      if (!v8) {
        goto LABEL_15;
      }
    }
    if ((unint64_t)(v15 - 5) < 5 || (void)v15 == 3) {
      goto LABEL_16;
    }
LABEL_15:
    if ((v10 & 1) == 0) {
LABEL_16:
    }
      *(void *)&long long v15 = 1;
LABEL_17:
    v14[0] = v15;
    v14[1] = v16;
    [v5 setTransitionInfo:v14];
  }
}

- (_NSRange)_clipRangeForMoment:(id)a3 inClips:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 firstGlobalIndex];
  uint64_t v9 = [v6 lastGlobalIndex];
  unsigned int v10 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:v8];
  uint64_t v11 = [v7 indexOfClipForDisplayAsset:v10];

  uint64_t v12 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:v9];
  uint64_t v13 = [v7 indexOfClipForDisplayAsset:v12];

  if (v13 < v11)
  {
    long long v17 = PLStoryGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134219010;
      uint64_t v27 = v8;
      __int16 v28 = 2048;
      uint64_t v29 = v9;
      __int16 v30 = 2048;
      uint64_t v31 = v11;
      __int16 v32 = 2048;
      uint64_t v33 = v13;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_FAULT, "Out of order clips detected. firstAssetIdx: %lu, lastAssetIdx: %lu, firstClipIdx: %lu, lastClipIdx: %lu, moment: %@", buf, 0x34u);
    }

    if ([(PXDisplayAssetFetchResult *)self->_displayAssets count] >= 1)
    {
      uint64_t v19 = 0;
      *(void *)&long long v18 = 134218498;
      long long v25 = v18;
      do
      {
        long long v20 = -[PXDisplayAssetFetchResult objectAtIndexedSubscript:](self->_displayAssets, "objectAtIndexedSubscript:", v19, v25);
        long long v21 = PLStoryGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = v20;
          if (objc_opt_respondsToSelector()) {
            [v22 alternateUUID];
          }
          else {
          long long v23 = [v22 uuid];
          }

          *(_DWORD *)buf = v25;
          uint64_t v27 = v19;
          __int16 v28 = 2112;
          uint64_t v29 = (uint64_t)v23;
          __int16 v30 = 2112;
          uint64_t v31 = (uint64_t)v22;
          _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_ERROR, "  #%ti: %@ %@", buf, 0x20u);
        }
        ++v19;
      }
      while (v19 < [(PXDisplayAssetFetchResult *)self->_displayAssets count]);
    }
    long long v24 = PLStoryGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEBUG, "Swapping first and last clip index.", buf, 2u);
    }

    uint64_t v14 = v11;
  }
  else
  {
    uint64_t v14 = v13;
    uint64_t v13 = v11;
  }

  NSUInteger v15 = v14 - v13 + 1;
  NSUInteger v16 = v13;
  result.length = v15;
  result.location = v16;
  return result;
}

- (void)_populateTransitionsInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  uint64_t v11 = self->_log;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    uint64_t v13 = [v8 numberOfClips];
    uint64_t v14 = PFStoryRecipeSongPaceDescription();
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = v13;
    __int16 v31 = 2114;
    __int16 v32 = v14;
    __int16 v33 = 2114;
    id v34 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.Transitions", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);
  }
  NSUInteger v15 = [(PXStorySongsAutoEditDecisionListsProducer *)self _makeRandomNumberGenerator];
  NSUInteger v16 = [[PXStoryRecipeClipTransitionProvider alloc] initWithConfiguration:self->_configuration colorGradeCategory:v9 songPace:a4 randomNumberGenerator:v15];
  long long v17 = self->_configuration;
  momentsProvider = self->_momentsProvider;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke;
  v24[3] = &unk_1E5DC6CB0;
  v24[4] = self;
  id v19 = v8;
  id v25 = v19;
  long long v20 = v16;
  long long v26 = v20;
  long long v21 = v17;
  uint64_t v27 = v21;
  int64_t v28 = a4;
  [(PXStoryAutoEditMomentsProvider *)momentsProvider enumerateMomentsUsingBlock:v24];
  id v22 = self->_log;
  long long v23 = v22;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v23, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryAutoEditDecisionList.Transitions", "", buf, 2u);
  }
}

void __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clipRangeForMoment:a2 inClips:*(void *)(a1 + 40)];
  uint64_t v5 = v4;
  id v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_2;
  v10[3] = &unk_1E5DC6DE8;
  id v11 = v6;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v12 = v8;
  uint64_t v13 = v9;
  objc_msgSend(v7, "provideTransitionsForMomentClipRange:withClipCatalog:usingBlock:", v3, v5, v11, v10);
}

void __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_2(uint64_t a1, long long *a2, uint64_t a3)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v5 = a2[1];
  long long v11 = *a2;
  v9[2] = __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_3;
  v9[3] = &unk_1E5DC6DC0;
  long long v12 = v5;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v13 = v8;
  [v6 updateClipAtIndex:a3 usingBlock:v9];
}

void __104__PXStorySongsAutoEditDecisionListsProducer__populateTransitionsInClips_forSongPace_colorGradeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 72);
  id v5 = a2;
  [v3 durationForTransitionKind:v2 songPace:v4];
  v7[0] = v2;
  v7[1] = v6;
  [v5 setTransitionInfo:v7];
}

- (void)_populateMotionStylesInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  long long v11 = self->_log;
  long long v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    uint64_t v13 = [v8 numberOfClips];
    uint64_t v14 = PFStoryRecipeSongPaceDescription();
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v13;
    __int16 v30 = 2114;
    __int16 v31 = v14;
    __int16 v32 = 2114;
    id v33 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.MotionStyles", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);
  }
  NSUInteger v15 = [(PXStorySongsAutoEditDecisionListsProducer *)self _makeRandomNumberGenerator];
  NSUInteger v16 = [PXStoryRecipeClipMotionStyleProvider alloc];
  configuration = self->_configuration;
  long long v18 = [(PXStorySongsAutoEditDecisionListsProducer *)self storyConfiguration];
  id v19 = [(PXStoryRecipeClipMotionStyleProvider *)v16 initWithConfiguration:configuration colorGradeCategory:v9 songPace:a4 randomNumberGenerator:v15 storyConfiguration:v18];

  momentsProvider = self->_momentsProvider;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke;
  v25[3] = &unk_1E5DC6D98;
  v25[4] = self;
  id v21 = v8;
  id v26 = v21;
  id v22 = v19;
  uint64_t v27 = v22;
  [(PXStoryAutoEditMomentsProvider *)momentsProvider enumerateMomentsUsingBlock:v25];
  long long v23 = self->_log;
  long long v24 = v23;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v24, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryAutoEditDecisionList.MotionStyles", "", buf, 2u);
  }
}

void __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clipRangeForMoment:a2 inClips:*(void *)(a1 + 40)];
  uint64_t v5 = v4;
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_2;
  v8[3] = &unk_1E5DC6D70;
  id v9 = v6;
  objc_msgSend(v7, "provideMotionStylesForMomentClipRange:withClipCatalog:usingBlock:", v3, v5, v9, v8);
}

uint64_t __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_2(uint64_t a1, long long *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_3;
  v5[3] = &__block_descriptor_56_e38_v16__0___PXStoryMutableAutoEditClip__8l;
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  return [v3 updateClipAtIndex:a3 usingBlock:v5];
}

uint64_t __105__PXStorySongsAutoEditDecisionListsProducer__populateMotionStylesInClips_forSongPace_colorGradeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 setMotionInfo:&v3];
}

- (void)_populateMomentRecipesInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  long long v11 = self->_log;
  long long v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    uint64_t v14 = [v8 numberOfClips];
    NSUInteger v15 = PFStoryRecipeSongPaceDescription();
    *(_DWORD *)buf = 134218498;
    uint64_t v37 = v14;
    __int16 v38 = 2114;
    long long v39 = v15;
    __int16 v40 = 2114;
    id v41 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.MomentRecipes", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);
  }
  os_signpost_id_t spid = v10;

  NSUInteger v16 = [(PXStorySongsAutoEditDecisionListsProducer *)self _makeRandomNumberGenerator];
  long long v17 = [[PXStoryMomentRecipeProvider alloc] initWithConfiguration:self->_configuration colorGradeCategory:v9 songPace:a4 randomNumberGenerator:v16];
  long long v18 = self->_configuration;
  momentsProvider = self->_momentsProvider;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke;
  v31[3] = &unk_1E5DC6CB0;
  v31[4] = self;
  id v20 = v8;
  id v32 = v20;
  id v21 = v17;
  id v33 = v21;
  id v22 = v18;
  uint64_t v34 = v22;
  int64_t v35 = a4;
  [(PXStoryAutoEditMomentsProvider *)momentsProvider enumerateMomentsUsingBlock:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_5;
  v28[3] = &unk_1E5DC6D28;
  long long v23 = v21;
  uint64_t v29 = v23;
  id v24 = v20;
  id v30 = v24;
  [v24 enumerateClipsUsingBlock:v28];
  id v25 = self->_log;
  id v26 = v25;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v26, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryAutoEditDecisionList.MomentRecipes", "", buf, 2u);
  }
}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clipRangeForMoment:a2 inClips:*(void *)(a1 + 40)];
  uint64_t v5 = v4;
  long long v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_2;
  v10[3] = &unk_1E5DC6C88;
  id v11 = v6;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v12 = v8;
  uint64_t v13 = v9;
  objc_msgSend(v7, "provideRecipeForMomentClipRange:withClipCatalog:usingBlock:", v3, v5, v11, v10);
}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_6;
  v5[3] = &unk_1E5DC6D00;
  uint64_t v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = a3;
  [v4 provideDebugInfoForClip:a3 usingBlock:v5];
}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_7;
  v7[3] = &unk_1E5DC6CD8;
  id v8 = v3;
  id v6 = v3;
  [v5 updateClipAtIndex:v4 usingBlock:v7];
}

uint64_t __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setDebugInfo:*(void *)(a1 + 32)];
}

uint64_t __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_2(uint64_t a1, long long *a2, long long *a3, uint64_t a4, uint64_t a5)
{
  id v8 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_3;
  _OWORD v18[3] = &__block_descriptor_64_e38_v16__0___PXStoryMutableAutoEditClip__8l;
  v18[4] = a4;
  long long v19 = *a2;
  uint64_t v20 = *((void *)a2 + 2);
  uint64_t result = [v8 updateClipAtIndex:a5 usingBlock:v18];
  BOOL v10 = a5 < 1;
  uint64_t v11 = a5 - 1;
  if (!v10)
  {
    [*(id *)(a1 + 40) durationForTransitionKind:*(void *)a3 songPace:*(void *)(a1 + 48)];
    *((void *)a3 + 1) = v12;
    uint64_t v13 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_4;
    v15[3] = &__block_descriptor_64_e38_v16__0___PXStoryMutableAutoEditClip__8l;
    long long v14 = a3[1];
    long long v16 = *a3;
    long long v17 = v14;
    return [v13 updateClipAtIndex:v11 usingBlock:v15];
  }
  return result;
}

void __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) == 2)
  {
    uint64_t v4 = +[PXStorySettings sharedInstance];
    [v4 autoEditDoublePlaceMultiplier];
    objc_msgSend(v3, "setDurationMultiplier:");
  }
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  [v3 setMotionInfo:&v5];
}

uint64_t __106__PXStorySongsAutoEditDecisionListsProducer__populateMomentRecipesInClips_forSongPace_colorGradeCategory___block_invoke_4(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setTransitionInfo:v4];
}

- (void)_populateMotionStylesAndTransitionsInClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  uint64_t v9 = +[PXStorySettings sharedInstance];
  int v10 = [v9 autoEditUseMomentRecipes];

  if (v10)
  {
    [(PXStorySongsAutoEditDecisionListsProducer *)self _populateMomentRecipesInClips:v12 forSongPace:a4 colorGradeCategory:v8];
  }
  else
  {
    [(PXStorySongsAutoEditDecisionListsProducer *)self _populateMotionStylesInClips:v12 forSongPace:a4 colorGradeCategory:v8];
    [(PXStorySongsAutoEditDecisionListsProducer *)self _populateTransitionsInClips:v12 forSongPace:a4 colorGradeCategory:v8];
  }
  uint64_t v11 = [(PXStorySongsAutoEditDecisionListsProducer *)self chapterCollection];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _adjustTransitionsInClips:v12 forChapterCollection:v11];
}

- (void)_populateModulesInClips:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  uint64_t v6 = self->_log;
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v4 numberOfClips];
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PXStoryAutoEditDecisionList.Modules", "Count=%ld", buf, 0xCu);
  }

  id v8 = [[PXStoryRecipeClipModuleProvider alloc] initWithConfiguration:self->_configuration];
  uint64_t v9 = +[PXStorySettings sharedInstance];
  uint64_t v10 = [v9 autoEditModuleLengthMax];

  uint64_t v11 = +[PXStorySettings sharedInstance];
  uint64_t v12 = [v11 autoEditEmptySpaceLengthMax];

  momentsProvider = self->_momentsProvider;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke;
  _OWORD v18[3] = &unk_1E5DC6C40;
  v18[4] = self;
  id v14 = v4;
  id v19 = v14;
  NSUInteger v15 = v8;
  uint64_t v20 = v15;
  uint64_t v21 = v10;
  uint64_t v22 = v12;
  [(PXStoryAutoEditMomentsProvider *)momentsProvider enumerateMomentsUsingBlock:v18];
  long long v16 = self->_log;
  long long v17 = v16;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_END, v5, "PXStoryAutoEditDecisionList.Modules", "", buf, 2u);
  }
}

void __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _clipRangeForMoment:a2 inClips:*(void *)(a1 + 40)];
  uint64_t v5 = v4;
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_2;
  v10[3] = &unk_1E5DC6C18;
  id v11 = v6;
  objc_msgSend(v7, "provideModulesForMomentClipRange:withClipCatalog:maxModuleLength:maxEmptySpaceLength:usingBlock:", v3, v5, v11, v9, v8, v10);
}

uint64_t __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_2(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_3;
  v7[3] = &__block_descriptor_42_e38_v16__0___PXStoryMutableAutoEditClip__8l;
  void v7[4] = a3;
  char v8 = a2;
  char v9 = a4;
  return [v5 updateClipAtIndex:a5 usingBlock:v7];
}

void __69__PXStorySongsAutoEditDecisionListsProducer__populateModulesInClips___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v4, "setModuleInfo:", v2, v3);
}

- (unint64_t)_composeClips:(id)a3 inAssetRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  char v8 = [(PXStorySongsAutoEditDecisionListsProducer *)self storyConfiguration];
  char v9 = [v8 disableNUp];

  if ((v9 & 1) == 0)
  {
    id v11 = [(PXStoryAutoEditMomentsProvider *)self->_momentsProvider momentForDisplayAssetIndex:location];
    NSUInteger v12 = location + length;
    uint64_t v13 = [v11 assetIndexRange];
    if (location + length > v13 + v14) {
      goto LABEL_7;
    }
    if (!location) {
      goto LABEL_7;
    }
    if (v12 == [(PXDisplayAssetFetchResult *)self->_displayAssets count]) {
      goto LABEL_7;
    }
    NSUInteger v15 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:location];
    uint64_t v16 = [v7 indexOfClipForDisplayAsset:v15];

    long long v17 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:v12 - 1];
    uint64_t v18 = [v7 indexOfClipForDisplayAsset:v17];

    if (v18 == v16) {
      goto LABEL_7;
    }
    uint64_t v59 = v18 - v16;
    uint64_t v60 = v18;
    uint64_t v61 = v16;
    if (v18 < v16)
    {
      unint64_t v10 = 0;
    }
    else
    {
      CMTimeValue v45 = v11;
      unint64_t v10 = 0;
      uint64_t v46 = v18 + 1;
      do
      {
        uint64_t v20 = [v7 clipAtIndex:v16];
        if ([v20 playbackStyle] != 1)
        {
          unint64_t v10 = 0;
          id v11 = v45;
          goto LABEL_48;
        }
        double v47 = [v20 displayAssets];
        v10 += [v47 count];

        ++v16;
      }
      while (v46 != v16);
      if (v10 > 3)
      {
        unint64_t v10 = 0;
        id v11 = v45;
        goto LABEL_8;
      }
      id v11 = v45;
      if (length == 2 && v10 == 3)
      {
        long long v48 = [v7 clipAtIndex:v61];
        long long v49 = [v48 displayAssets];
        double v50 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:location];
        uint64_t v51 = [v49 indexOfObject:v50];

        [(PXStoryAutoEditClipComposabilityProvider *)self->_composabilityProvider composabilityScoresForDisplayAssetIndex:location - v51];
        float v53 = v52;
        [(PFStoryAutoEditConfiguration *)self->_configuration composabilityScoreThreshold];
        double v55 = v54;

        if (v55 > v53)
        {
LABEL_7:
          unint64_t v10 = 0;
LABEL_8:

          goto LABEL_9;
        }
        unint64_t v10 = 3;
      }
    }
    uint64_t v20 = +[PXStorySettings sharedInstance];
    if ([v20 autoEditUseMomentRecipes])
    {
      v57 = v11;
      uint64_t v56 = [(PFStoryAutoEditConfiguration *)self->_configuration composabilityMaximumNUpRunCount];
      uint64_t v21 = v61;
      if (v61 >= 1)
      {
        uint64_t v21 = v61;
        while (1)
        {
          uint64_t v22 = v21 - 1;
          long long v23 = [v7 clipAtIndex:v21 - 1];
          uint64_t v24 = [v23 displayAssets];
          unint64_t v25 = [v24 count];

          if (v25 < 2) {
            break;
          }
          --v21;
          if ((unint64_t)(v22 + 1) <= 1)
          {
            uint64_t v21 = 0;
            break;
          }
        }
      }
      uint64_t v26 = v60;
      do
      {
        uint64_t v27 = v26++;
        if (v26 >= [v7 numberOfClips]) {
          break;
        }
        int64_t v28 = [v7 clipAtIndex:v26];
        uint64_t v29 = [v28 displayAssets];
        unint64_t v30 = [v29 count];
      }
      while (v30 > 1);
      uint64_t v31 = v61 - (v60 + v21) + v27 + 1;
      id v11 = v57;
      if (v31 > v56) {
        goto LABEL_46;
      }
    }
    if ([v20 autoEditUseMomentRecipes])
    {
      v58 = v11;
      uint64_t v32 = [(PFStoryAutoEditConfiguration *)self->_configuration composabilityMinimum1UpRunCount];
      uint64_t v33 = (v61 - v32) & ~((v61 - v32) >> 63);
      uint64_t v34 = v61;
      if (v61 > v33)
      {
        uint64_t v34 = v61;
        do
        {
          uint64_t v35 = v34 - 1;
          uint64_t v36 = [v7 clipAtIndex:v34 - 1];
          uint64_t v37 = [v36 displayAssets];
          uint64_t v38 = [v37 count];

          if (v38 != 1) {
            break;
          }
          --v34;
        }
        while (v35 > v33);
      }
      uint64_t v39 = v60;
      do
      {
        uint64_t v40 = v39;
        uint64_t v41 = v39 + 1;
        if (v39 + 1 >= [v7 numberOfClips]) {
          break;
        }
        if (v40 >= v32 + v60) {
          break;
        }
        uint64_t v42 = [v7 clipAtIndex:v41];
        uint64_t v43 = [v42 displayAssets];
        uint64_t v44 = [v43 count];

        uint64_t v39 = v40 + 1;
      }
      while (v44 == 1);
      if (v61 - v34 >= 1 && v61 - v34 < v32)
      {
        unint64_t v10 = 0;
        id v11 = v58;
LABEL_48:

        goto LABEL_8;
      }
      id v11 = v58;
      if (v40 - v60 >= 1 && v40 - v60 < v32)
      {
LABEL_46:
        unint64_t v10 = 0;
        goto LABEL_48;
      }
    }
    objc_msgSend(v7, "composeClipsInRange:", v61, v59 + 1);
    goto LABEL_48;
  }
  unint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (void)_composeClips:(id)a3 forSongPace:(int64_t)a4
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  uint64_t v6 = self->_log;
  id v7 = v6;
  os_signpost_id_t spid = v5;
  unint64_t v77 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v6))
  {
    uint64_t v8 = [v79 numberOfClips];
    char v9 = PFStoryRecipeSongPaceDescription();
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PXStoryAutoEditDecisionList.NUps", "Count=%ld pace=%{public}@", buf, 0x16u);
  }
  unint64_t v10 = [(PXStorySongsAutoEditDecisionListsProducer *)self storyConfiguration];
  char v11 = [v10 disableNUp];

  if (v11)
  {
    NSUInteger v12 = 0;
  }
  else
  {
    NSUInteger v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[PXDisplayAssetFetchResult count](self->_displayAssets, "count"));
    if ([(PXDisplayAssetFetchResult *)self->_displayAssets count])
    {
      unint64_t v13 = 0;
      do
      {
        [(PXStoryAutoEditClipComposabilityProvider *)self->_composabilityProvider composabilityScoresForDisplayAssetIndex:v13];
        if (v15 > 0.0 || v14 > 0.0)
        {
          uint64_t v16 = [NSNumber numberWithUnsignedInteger:v13];
          uint64_t v17 = [v12 count];
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke;
          v139[3] = &unk_1E5DC6BA8;
          v139[4] = self;
          uint64_t v18 = objc_msgSend(v12, "indexOfObject:inSortedRange:options:usingComparator:", v16, 0, v17, 1024, v139);

          id v19 = [NSNumber numberWithUnsignedInteger:v13];
          [v12 insertObject:v19 atIndex:v18];
        }
        ++v13;
      }
      while (v13 < [(PXDisplayAssetFetchResult *)self->_displayAssets count]);
    }
  }
  configuration = self->_configuration;
  if (configuration)
  {
    [(PFStoryAutoEditConfiguration *)configuration durationInfoForPlaybackStyle:1 songPace:a4];
  }
  else
  {
    uint64_t v137 = 0;
    long long v136 = 0u;
    long long v134 = 0u;
    memset(v135, 0, sizeof(v135));
  }
  CMTime time = *(CMTime *)&v135[1];
  double Seconds = CMTimeGetSeconds(&time);
  uint64_t v22 = self->_configuration;
  if (v22)
  {
    [(PFStoryAutoEditConfiguration *)v22 durationInfoForPlaybackStyle:4 songPace:a4];
  }
  else
  {
    uint64_t v132 = 0;
    long long v131 = 0u;
    long long v129 = 0u;
    memset(v130, 0, sizeof(v130));
  }
  CMTime v133 = *(CMTime *)&v130[1];
  double v23 = CMTimeGetSeconds(&v133);
  uint64_t v24 = self->_configuration;
  if (v24)
  {
    [(PFStoryAutoEditConfiguration *)v24 durationInfoForPlaybackStyle:3 songPace:a4];
  }
  else
  {
    uint64_t v127 = 0;
    long long v126 = 0u;
    long long v124 = 0u;
    memset(v125, 0, sizeof(v125));
  }
  CMTime v128 = *(CMTime *)&v125[1];
  double v25 = CMTimeGetSeconds(&v128);
  uint64_t v26 = self->_configuration;
  if (v26)
  {
    [(PFStoryAutoEditConfiguration *)v26 longOverallDuration];
  }
  else
  {
    uint64_t v122 = 0;
    long long v121 = 0u;
    long long v119 = 0u;
    memset(v120, 0, sizeof(v120));
  }
  CMTime v123 = *(CMTime *)&v120[1];
  double v27 = CMTimeGetSeconds(&v123);
  int64_t v28 = self->_configuration;
  if (v28)
  {
    [(PFStoryAutoEditConfiguration *)v28 longOverallDuration];
  }
  else
  {
    uint64_t v117 = 0;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
  }
  *(_OWORD *)&v118.CMTimeValue value = v113;
  v118.CMTimeEpoch epoch = v114;
  *(double *)&long long v29 = CMTimeGetSeconds(&v118);
  int64_t kind = self->_targetOverallDurationInfo.kind;
  switch(kind)
  {
    case 4:
      uint64_t v35 = self->_configuration;
      if (v35)
      {
        [(PFStoryAutoEditConfiguration *)v35 mediumOverallDuration];
      }
      else
      {
        uint64_t v100 = 0;
        long long v99 = 0u;
        long long v97 = 0u;
        memset(v98, 0, sizeof(v98));
      }
      CMTime v101 = *(CMTime *)&v98[1];
      double v27 = CMTimeGetSeconds(&v101);
      uint64_t v37 = self->_configuration;
      if (v37)
      {
        [(PFStoryAutoEditConfiguration *)v37 mediumOverallDuration];
      }
      else
      {
        uint64_t v95 = 0;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
      }
      *(_OWORD *)&v96.CMTimeValue value = v91;
      v96.CMTimeEpoch epoch = v92;
      *(double *)&long long v29 = CMTimeGetSeconds(&v96);
      break;
    case 3:
      goto LABEL_32;
    case 2:
      long long v29 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.value;
      long long v31 = *(_OWORD *)&self->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.epoch;
      *(_OWORD *)buf = v29;
      *(_OWORD *)&buf[16] = v31;
      CMTimeFlags flags = self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.flags;
      v141[0] = self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.timescale;
      if ((flags & 0x1D) == 1)
      {
        CMTimeEpoch epoch = self->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.epoch;
        v89.CMTimeValue value = *(void *)&buf[24];
        v89.CMTimeScale timescale = v141[0];
        v89.CMTimeFlags flags = flags;
        v89.CMTimeEpoch epoch = epoch;
        double v27 = CMTimeGetSeconds(&v89);
        CMTime v89 = *(CMTime *)buf;
        *(double *)&long long v29 = CMTimeGetSeconds(&v89);
        break;
      }
LABEL_32:
      uint64_t v34 = self->_configuration;
      if (v34)
      {
        [(PFStoryAutoEditConfiguration *)v34 shortOverallDuration];
      }
      else
      {
        uint64_t v111 = 0;
        long long v110 = 0u;
        long long v108 = 0u;
        memset(v109, 0, sizeof(v109));
      }
      CMTime v112 = *(CMTime *)&v109[1];
      double v27 = CMTimeGetSeconds(&v112);
      uint64_t v36 = self->_configuration;
      if (v36)
      {
        [(PFStoryAutoEditConfiguration *)v36 shortOverallDuration];
      }
      else
      {
        uint64_t v106 = 0;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
      }
      *(_OWORD *)&v107.CMTimeValue value = v102;
      v107.CMTimeEpoch epoch = v103;
      *(double *)&long long v29 = CMTimeGetSeconds(&v107);
      break;
  }
  if (*(double *)&v29 < v27) {
    double v38 = *(double *)&v29;
  }
  else {
    double v38 = v27;
  }
  v89.CMTimeValue value = 0;
  *(void *)&v89.CMTimeScale timescale = &v89;
  v89.CMTimeEpoch epoch = 0x2020000000;
  int v90 = 0;
  uint64_t v85 = 0;
  long long v86 = &v85;
  uint64_t v87 = 0x2020000000;
  int v88 = 0;
  uint64_t v81 = 0;
  CMTime v82 = &v81;
  uint64_t v83 = 0x2020000000;
  int v84 = 0;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke_2;
  v80[3] = &unk_1E5DC6BD0;
  v80[4] = &v89;
  v80[5] = &v85;
  v80[6] = &v81;
  [v79 enumerateClipsUsingBlock:v80];
  int v39 = *(_DWORD *)(*(void *)&v89.timescale + 24);
  int v40 = *((_DWORD *)v86 + 6);
  int v41 = *((_DWORD *)v82 + 6);
  [(PFStoryAutoEditConfiguration *)self->_configuration diptychDurationMultiplier];
  double v43 = v42;
  [(PFStoryAutoEditConfiguration *)self->_configuration triptychDurationMultiplier];
  double v45 = v44;
  [(PFStoryAutoEditConfiguration *)self->_configuration composabilityTargetDurationMultiplier];
  double v47 = v46;
  long long v48 = PLStoryGetLog();
  double v49 = v23 * (double)v40 + (double)v39 * Seconds + (double)v41 * v25;
  double v50 = v27 * v47;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = [v12 count];
    *(_DWORD *)buf = 134218496;
    *(double *)&uint8_t buf[4] = v50;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v49;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v51;
    _os_log_impl(&dword_1A9AE7000, v48, OS_LOG_TYPE_DEBUG, "Target duration: %0.2f, current duration: %0.2f, composable clips: %lu", buf, 0x20u);
  }

  uint64_t v52 = [(PFStoryAutoEditConfiguration *)self->_configuration composabilityMinimumNUpCount];
  float v53 = [(PXStorySongsAutoEditDecisionListsProducer *)self storyConfiguration];
  char v54 = [v53 nUpCompositionIgnoresOverallTargetDuration];

  uint64_t v55 = 0;
  double v56 = Seconds * (2.0 - v43);
  double v57 = Seconds * (3.0 - v45);
  while (1)
  {
    uint64_t v58 = [v12 count];
    char v59 = v49 > v38 ? 1 : v54;
    if (!v58 || (v59 & 1) == 0) {
      break;
    }
    uint64_t v60 = [v12 lastObject];
    uint64_t v61 = [v60 unsignedIntegerValue];

    [v12 removeLastObject];
    [(PXStoryAutoEditClipComposabilityProvider *)self->_composabilityProvider composabilityScoresForDisplayAssetIndex:v61];
    float v63 = v62;
    float v65 = v64;
    CMTimeFlags v66 = PLStoryGetLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = v61;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v65;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = v63;
      _os_log_impl(&dword_1A9AE7000, v66, OS_LOG_TYPE_DEBUG, "Asset: %lu, Triptych score: %0.2f, diptych score: %0.2f", buf, 0x20u);
    }

    if (v55 >= v52 && v49 <= v50)
    {
      [(PFStoryAutoEditConfiguration *)self->_configuration composabilityScoreThreshold];
      float v68 = v63 >= v65 ? v63 : v65;
      if (v67 >= v68) {
        break;
      }
    }
    if (v65 <= v63)
    {
      unint64_t v71 = -[PXStorySongsAutoEditDecisionListsProducer _composeClips:inAssetRange:](self, "_composeClips:inAssetRange:", v79, v61, 2);
      if (v71 == 3)
      {
        double v49 = v49 - (v57 - v56);
      }
      else
      {
        if (v71 != 2) {
          goto LABEL_77;
        }
        double v49 = v49 - v56;
      }
      ++v55;
    }
    else
    {
      unint64_t v69 = -[PXStorySongsAutoEditDecisionListsProducer _composeClips:inAssetRange:](self, "_composeClips:inAssetRange:", v79, v61, 3);
      if (v69 == 3) {
        double v70 = v57;
      }
      else {
        double v70 = 0.0;
      }
      double v49 = v49 - v70;
      if (v69 == 3) {
        ++v55;
      }
    }
LABEL_77:
    long long v72 = PLStoryGetLog();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v73 = [v12 count];
      *(_DWORD *)buf = 134218752;
      *(double *)&uint8_t buf[4] = v50;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v49;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v55;
      LOWORD(v141[0]) = 2048;
      *(void *)((char *)v141 + 2) = v73;
      _os_log_impl(&dword_1A9AE7000, v72, OS_LOG_TYPE_DEBUG, "Target duration: %0.2f, current duration: %0.2f, composed clips: %lu, remaining composable clips: %lu", buf, 0x2Au);
    }
  }
  uint64_t v74 = self->_log;
  long long v75 = v74;
  if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v74))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v75, OS_SIGNPOST_INTERVAL_END, spid, "PXStoryAutoEditDecisionList.NUps", "", buf, 2u);
  }

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
}

uint64_t __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a1;
  os_signpost_id_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = a3;
  objc_msgSend(v5, "composabilityScoresForDisplayAssetIndex:", objc_msgSend(a2, "unsignedIntValue"));
  float v8 = v7;
  float v10 = v9;
  char v11 = *(void **)(*(void *)(v4 + 32) + 56);
  LODWORD(v4) = [v6 unsignedIntValue];

  [v11 composabilityScoresForDisplayAssetIndex:v4];
  if (v8 >= v10) {
    float v14 = v8;
  }
  else {
    float v14 = v10;
  }
  if (v12 < v13) {
    float v12 = v13;
  }
  if (v14 < v12) {
    return -1;
  }
  else {
    return v14 > v12;
  }
}

uint64_t __71__PXStorySongsAutoEditDecisionListsProducer__composeClips_forSongPace___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 playbackStyle];
  switch(result)
  {
    case 1:
      uint64_t v4 = a1 + 32;
      goto LABEL_5;
    case 2:
    case 4:
    case 5:
      uint64_t v4 = a1 + 40;
      goto LABEL_5;
    case 3:
      uint64_t v4 = a1 + 48;
LABEL_5:
      ++*(_DWORD *)(*(void *)(*(void *)v4 + 8) + 24);
      break;
    default:
      return result;
  }
  return result;
}

- (void)_populateClips:(id)a3 forSongPace:(int64_t)a4 colorGradeCategory:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  char v11 = self->_log;
  float v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v11))
  {
    uint64_t v13 = [(PXDisplayAssetFetchResult *)self->_displayAssets count];
    float v14 = PFStoryRecipeSongPaceDescription();
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = v13;
    __int16 v33 = 2114;
    uint64_t v34 = v14;
    __int16 v35 = 2114;
    id v36 = v9;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PXStoryAutoEditDecisionList.Clips", "Count=%ld pace=%{public}@, grade=%{public}@", buf, 0x20u);
  }
  uint64_t v24 = v9;

  if ([(PXDisplayAssetFetchResult *)self->_displayAssets count] >= 1)
  {
    uint64_t v15 = 0;
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 48);
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 32);
    uint64_t v16 = *(void *)(MEMORY[0x1E4F8D280] + 64);
    long long v25 = *MEMORY[0x1E4F8D280];
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 16);
    do
    {
      uint64_t v17 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:v15];
      int64_t v18 = [(PXStorySongsAutoEditDecisionListsProducer *)self _playbackStyleForAsset:v17 songPace:a4];
      if (v18 == 3)
      {
        if (v15 && v15 + 1 != [(PXDisplayAssetFetchResult *)self->_displayAssets count]) {
          int64_t v18 = 3;
        }
        else {
          int64_t v18 = 1;
        }
      }
      id v19 = [(PXStorySongsAutoEditDecisionListsProducer *)self storyConfiguration];
      unsigned __int8 v20 = [v19 disableVideoPlayback];

      if (((v18 != 1) & v20) != 0) {
        int64_t v18 = 1;
      }
      uint64_t v21 = [[PXStoryConcreteAutoEditClip alloc] initWithDisplayAsset:v17];
      [(PXStoryConcreteAutoEditClip *)v21 setPlaybackStyle:v18];
      v29[2] = v28;
      v29[3] = v27;
      uint64_t v30 = v16;
      v29[0] = v25;
      v29[1] = v26;
      [(PXStoryConcreteAutoEditClip *)v21 setDurationInfo:v29];
      [v8 addClip:v21];

      ++v15;
    }
    while (v15 < [(PXDisplayAssetFetchResult *)self->_displayAssets count]);
  }
  uint64_t v22 = self->_log;
  double v23 = v22;
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v23, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryAutoEditDecisionList.Clips", "", buf, 2u);
  }
}

- (id)_decisionListForSong:(id)a3 pace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  os_signpost_id_t v10 = [(PXStorySongsAutoEditDecisionListsProducer *)self displayAssets];
  char v11 = -[PXStoryConcreteAutoEditClipCatalog initWithCapacity:]([PXStoryConcreteMutableAutoEditClipCatalog alloc], "initWithCapacity:", [v10 count]);
  [(PXStorySongsAutoEditDecisionListsProducer *)self _populateClips:v11 forSongPace:a4 colorGradeCategory:v8];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _composeClips:v11 forSongPace:a4];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _populateModulesInClips:v11];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _populateMotionStylesAndTransitionsInClips:v11 forSongPace:a4 colorGradeCategory:v8];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _adjustDurationOfClips:v11 forSongPace:a4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  [(PXStorySongsAutoEditDecisionListsProducer *)self _optimizeOverallDurationOfClips:v11 forSong:v9];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _adjustAudioPlaybackForClips:v11];
  [(PXStorySongsAutoEditDecisionListsProducer *)self _adjustAudioTransitionForClips:v11];
  memset(&v20, 0, sizeof(v20));
  [(PFStoryAutoEditConfiguration *)self->_configuration outroDurationForSongPace:a4];
  CMTimeMakeWithSeconds(&v20, v12, 600);
  uint64_t v13 = [(PXStorySongsAutoEditDecisionListsProducer *)self storyConfiguration];
  uint64_t v14 = [v13 disableNUp] ^ 1;

  uint64_t v15 = [PXStoryConcreteAutoEditDecisionList alloc];
  v19[2] = v23;
  v19[3] = v24;
  void v19[4] = v25;
  v19[0] = v21;
  v19[1] = v22;
  CMTime v18 = v20;
  uint64_t v16 = [(PXStoryConcreteAutoEditDecisionList *)v15 initWithColorGradeCategory:v8 song:v9 clipCatalog:v11 constrainedOverallDurationInfo:v19 outroDuration:&v18 allowsNUp:v14];

  return v16;
}

- (id)decisionListForSong:(id)a3 pace:(int64_t)a4 colorGradeCategory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__224717;
  long long v24 = __Block_byref_object_dispose__224718;
  id v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PXStorySongsAutoEditDecisionListsProducer_decisionListForSong_pace_colorGradeCategory___block_invoke;
  block[3] = &unk_1E5DC6B80;
  block[4] = self;
  id v16 = v8;
  CMTime v18 = &v20;
  int64_t v19 = a4;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, block);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __89__PXStorySongsAutoEditDecisionListsProducer_decisionListForSong_pace_colorGradeCategory___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _decisionListForSong:*(void *)(a1 + 40) pace:*(void *)(a1 + 64) colorGradeCategory:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)requestDefaultAutoEditDecisionListsWithColorGradeCategory:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  os_signpost_id_t v10 = self->_log;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXStoryAutoEditDecisionList.SingleRequest", "", buf, 2u);
  }

  id v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__PXStorySongsAutoEditDecisionListsProducer_requestDefaultAutoEditDecisionListsWithColorGradeCategory_options_resultHandler___block_invoke;
  block[3] = &unk_1E5DC8980;
  block[4] = self;
  id v21 = v7;
  id v14 = v12;
  id v22 = v14;
  id v23 = v8;
  os_signpost_id_t v24 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(queue, block);
  id v17 = v23;
  id v18 = v14;

  return v18;
}

void __125__PXStorySongsAutoEditDecisionListsProducer_requestDefaultAutoEditDecisionListsWithColorGradeCategory_options_resultHandler___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _decisionListForSong:0 pace:2 colorGradeCategory:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = [PXStoryProducerResult alloc];
  v11[0] = v2;
  os_signpost_id_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v6 = [(PXStoryProducerResult *)v4 initWithObject:v5];
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v3 + 16))(v3, v6);

  id v7 = *(id *)(*(void *)(a1 + 32) + 24);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)os_signpost_id_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryAutoEditDecisionList.SingleRequest", "", v10, 2u);
  }
}

- (id)requestAutoEditDecisionListsWithOptions:(unint64_t)a3 songs:(id)a4 colorGradeCategoriesBySong:(id)a5 resultHandler:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  uint64_t v12 = [v9 count];
  if (v12)
  {
    id v13 = 0;
  }
  else
  {
    id v14 = PLStoryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_INFO, "No songs available. Auto-edit cannot produce any clips.", buf, 2u);
    }

    id v13 = PXStoryErrorCreateWithCodeDebugFormat(8, @"Auto-edit cannot produce any clips without song.", v15, v16, v17, v18, v19, v20, v42);
  }
  id v21 = [(PXStorySongsAutoEditDecisionListsProducer *)self displayAssets];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    if (v13)
    {
LABEL_8:
      id v23 = [[PXStoryProducerResult alloc] initWithObject:0];
      os_signpost_id_t v24 = [(PXStoryProducerResult *)v23 error:v13];
      v11[2](v11, v24);
      id v25 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    long long v26 = PLStoryGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_INFO, "No displayable assets available. Auto-edit cannot produce any clips.", buf, 2u);
    }

    uint64_t v33 = PXStoryErrorCreateWithCodeDebugFormat(8, @"Auto-edit cannot produce any clips without display assets.", v27, v28, v29, v30, v31, v32, v42);

    id v13 = (void *)v33;
    if (v33) {
      goto LABEL_8;
    }
  }
  os_signpost_id_t v34 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  __int16 v35 = self->_log;
  id v36 = v35;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v35))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v52 = v12;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "PXStoryAutoEditDecisionList.MultipleRequest", "Count=%ld", buf, 0xCu);
  }

  uint64_t v37 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v12];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__PXStorySongsAutoEditDecisionListsProducer_requestAutoEditDecisionListsWithOptions_songs_colorGradeCategoriesBySong_resultHandler___block_invoke;
  block[3] = &unk_1E5DC79E8;
  uint64_t v49 = v12;
  id v39 = v37;
  id v44 = v39;
  id v45 = v9;
  id v46 = v10;
  double v47 = self;
  long long v48 = v11;
  os_signpost_id_t v50 = v34;
  dispatch_async(queue, block);
  int v40 = v48;
  id v23 = (PXStoryProducerResult *)v39;

  os_signpost_id_t v24 = v44;
  id v25 = v23;
LABEL_16:

  return v25;
}

void __132__PXStorySongsAutoEditDecisionListsProducer_requestAutoEditDecisionListsWithOptions_songs_colorGradeCategoriesBySong_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 72)];
  if (*(uint64_t *)(a1 + 72) >= 1)
  {
    uint64_t v4 = 0;
    *(void *)&long long v3 = 134218242;
    long long v28 = v3;
    do
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isCancelled", v28, *(_OWORD *)buf, *(void *)&buf[16], v30)) {
        goto LABEL_23;
      }
      os_signpost_id_t v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v4];
      id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
      id v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        id v8 = [v5 colorGradeCategory];
      }
      id v9 = v8;

      id v10 = +[PXStorySettings sharedInstance];
      uint64_t v11 = [v10 autoEditSongPaceOverride];

      if (!v11)
      {
        if (!v5)
        {
          uint64_t v12 = PLStoryGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v28;
            *(void *)&uint8_t buf[4] = v4;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v17;
            id v13 = v12;
            os_log_type_t v14 = OS_LOG_TYPE_ERROR;
            uint64_t v15 = "Falling back to medium song pace for nil song at index %lu. Songs: %@";
            uint32_t v16 = 22;
LABEL_14:
            _os_log_impl(&dword_1A9AE7000, v13, v14, v15, buf, v16);
          }
LABEL_15:

          uint64_t v11 = 2;
          goto LABEL_16;
        }
        uint64_t v11 = [v5 pace];
        if (!v11)
        {
          uint64_t v12 = PLStoryGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            id v13 = v12;
            os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
            uint64_t v15 = "Falling back to medium song pace for song with unknown pace";
            uint32_t v16 = 2;
            goto LABEL_14;
          }
          goto LABEL_15;
        }
      }
LABEL_16:
      uint64_t v18 = [*(id *)(a1 + 56) _decisionListForSong:v5 pace:v11 colorGradeCategory:v9];
      [v2 addObject:v18];
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);

      ++v4;
    }
    while (v4 < *(void *)(a1 + 72));
  }
  uint64_t v19 = +[PXStorySettings sharedInstance];
  [v19 autoEditProductionSimulatedDelay];
  double v21 = v20;

  if (v21 > 0.0) {
    [MEMORY[0x1E4F29060] sleepForTimeInterval:v21];
  }
  uint64_t v22 = (void *)[v2 copy];
  objc_storeStrong((id *)(*(void *)(a1 + 56) + 64), v22);
  uint64_t v23 = *(void *)(a1 + 64);
  os_signpost_id_t v24 = [[PXStoryProducerResult alloc] initWithObject:v22];
  (*(void (**)(uint64_t, PXStoryProducerResult *))(v23 + 16))(v23, v24);

  id v25 = *(id *)(*(void *)(a1 + 56) + 24);
  long long v26 = v25;
  os_signpost_id_t v27 = *(void *)(a1 + 80);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PXStoryAutoEditDecisionList.MultipleRequest", "", buf, 2u);
  }

LABEL_23:
}

- (id)_makeRandomNumberGenerator
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F8CD40]) initWithSeed:self->_randomNumberGeneratorSeed];
  return v2;
}

- (PXStorySongsAutoEditDecisionListsProducer)initWithAssetCollection:(id)a3 displayAssets:(id)a4 movieHighlights:(id)a5 chapterCollection:(id)a6 targetOverallDurationInfo:(id *)a7 configuration:(id)a8 storyConfiguration:(id)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)PXStorySongsAutoEditDecisionListsProducer;
  uint64_t v19 = [(PXStorySongsAutoEditDecisionListsProducer *)&v28 init];
  double v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_assetCollection, a3);
    objc_storeStrong((id *)&v20->_displayAssets, a4);
    objc_storeStrong((id *)&v20->_movieHighlights, a5);
    objc_storeStrong((id *)&v20->_chapterCollection, a6);
    *(_OWORD *)&v20->_targetOverallDurationInfo.int64_t kind = *(_OWORD *)&a7->var0;
    long long v21 = *(_OWORD *)&a7->var1.var0.var1;
    long long v22 = *(_OWORD *)&a7->var1.var1.var0;
    long long v23 = *(_OWORD *)&a7->var1.var2.var1;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.CMTimeEpoch epoch = *(_OWORD *)&a7->var1.var1.var3;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.maximumDuration.CMTimeScale timescale = v23;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.minimumDuration.CMTimeScale timescale = v21;
    *(_OWORD *)&v20->_targetOverallDurationInfo.specificDurationInfo.preferredDuration.CMTimeValue value = v22;
    px_dispatch_queue_create_serial();
  }

  return 0;
}

- (PXStorySongsAutoEditDecisionListsProducer)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStorySongsAutoEditDecisionListsProducer.m", 79, @"%s is not available as initializer", "-[PXStorySongsAutoEditDecisionListsProducer init]");

  abort();
}

+ ($0AC6E346AE4835514AAA8AC86D8F4844)audioModeDecisionForAsset:(id)a3 minimumAudioScore:(float)a4 playbackStyle:(int64_t)a5 movieHighlight:(id)a6 storyConfiguration:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  if (![a7 isAllowedToPlayAnyMusicOrSound])
  {
    uint64_t v14 = 10;
    uint64_t v13 = 1;
    goto LABEL_19;
  }
  if (a5 != 1)
  {
    uint64_t v15 = +[PXStorySettings sharedInstance];
    if (v12)
    {
      [v12 loudness];
      if (v16 >= 0.0 || ([v12 peakVolume], v17 <= 0.0))
      {
        uint64_t v13 = 0;
        uint64_t v14 = 3;
      }
      else
      {
        if [v12 hasMusic] && (objc_msgSend(v15, "muteBackgroundMusic"))
        {
          uint64_t v14 = 4;
        }
        else
        {
          [v12 audioQualityScore];
          if (v18 >= a4)
          {
            [v11 audioScore];
            if (v19 >= a4)
            {
              switch(a5)
              {
                case 5:
                  uint64_t v22 = [v15 loopingVideoAudioStrategy];
                  break;
                case 4:
                  if (([v11 mediaSubtypes] & 0x20000) != 0) {
                    uint64_t v22 = [v15 slomoVideoAudioStrategy];
                  }
                  else {
                    uint64_t v22 = [v15 videoAudioStrategy];
                  }
                  break;
                case 3:
                  uint64_t v22 = [v15 livePhotoAudioStrategy];
                  break;
                default:
LABEL_29:
                  uint64_t v13 = 1;
LABEL_32:
                  uint64_t v14 = 7;
                  goto LABEL_18;
              }
              switch(v22)
              {
                case 0:
                  goto LABEL_29;
                case 1:
                  uint64_t v13 = 2;
                  goto LABEL_32;
                case 2:
                  uint64_t v13 = 3;
                  goto LABEL_32;
                case 3:
                  if ([v12 hasVoice]) {
                    uint64_t v13 = 3;
                  }
                  else {
                    uint64_t v13 = 2;
                  }
                  uint64_t v14 = 8;
                  goto LABEL_18;
                case 4:
                  int v23 = [v12 hasVoice];
                  if ((v23 & [v12 hasFace]) != 0) {
                    uint64_t v13 = 3;
                  }
                  else {
                    uint64_t v13 = 2;
                  }
                  goto LABEL_46;
                case 5:
                  if ([v12 hasVoice])
                  {
                    if ([v12 hasFace]) {
                      uint64_t v13 = 3;
                    }
                    else {
                      uint64_t v13 = 1;
                    }
                  }
                  else
                  {
                    uint64_t v13 = 2;
                  }
LABEL_46:
                  uint64_t v14 = 9;
                  break;
                default:
                  uint64_t v14 = 0;
                  uint64_t v13 = 0;
                  break;
              }
              goto LABEL_18;
            }
            uint64_t v14 = 6;
          }
          else
          {
            uint64_t v14 = 5;
          }
        }
        uint64_t v13 = 1;
      }
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 2;
    }
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 1;
LABEL_19:

  int64_t v20 = v13;
  int64_t v21 = v14;
  result.var1 = v21;
  result.CMTime var0 = v20;
  return result;
}

@end