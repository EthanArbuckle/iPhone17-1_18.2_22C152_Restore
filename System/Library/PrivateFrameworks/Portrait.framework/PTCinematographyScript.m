@interface PTCinematographyScript
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultMinimumUserFocusDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_startTimeOfFixedTransitionToDecision:(SEL)a3;
- ($69C59A32909E13F94AB58097350E6BB9)_timeRangeOfTransitionfromDecision:(SEL)a3 toDecision:(id)a4;
- ($69C59A32909E13F94AB58097350E6BB9)_timeRangeOfTransitionfromDecision:(SEL)a3 toDecision:(id)a4 didShortenTransition:(id)a5;
- ($69C59A32909E13F94AB58097350E6BB9)timeRange;
- ($69C59A32909E13F94AB58097350E6BB9)timeRangeOfTransitionAfterDecision:(SEL)a3;
- ($69C59A32909E13F94AB58097350E6BB9)timeRangeOfTransitionBeforeDecision:(SEL)a3;
- (AVAsset)asset;
- (BOOL)_isEditCreatedTrack:(id)a3;
- (BOOL)_loadWithAsset:(id)a3 changesDictionary:(id)a4 error:(id *)a5;
- (BOOL)_removeUserDecision:(id)a3;
- (BOOL)_resolveIfGroupDecision:(id)a3;
- (BOOL)_shouldAddTrackDecision:(id)a3 afterDecision:(id)a4;
- (BOOL)_useFixedTransition;
- (BOOL)addTrack:(id)a3;
- (BOOL)addUserDecision:(id)a3;
- (BOOL)didInternalizeTracks;
- (BOOL)focusOnDetection:(id)a3 strong:(BOOL)a4;
- (BOOL)focusOnGroupIdentifier:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (BOOL)focusOnTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (BOOL)focusOnTrackIdentifier:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5;
- (BOOL)removeAllUserDecisions;
- (BOOL)removeTrack:(id)a3;
- (BOOL)removeUserDecision:(id)a3;
- (NSArray)baseDecisions;
- (NSArray)frames;
- (NSArray)trackDecisions;
- (NSArray)tracks;
- (NSMutableArray)effectiveDecisions;
- (NSMutableArray)mutableGroupTracks;
- (NSMutableArray)mutableTracks;
- (NSMutableArray)userDecisions;
- (NSMutableDictionary)trackForGroupNumber;
- (NSMutableDictionary)trackForNumber;
- (NSMutableDictionary)trackNumberForFocusIdentifier;
- (PTCinematographyFocusFramesOptions)focusFramesOptions;
- (PTCinematographyFocusPuller)focusPuller;
- (PTCinematographyScript)init;
- (PTCinematographyScriptChanges)changesDelegate;
- (PTCinematographyTrack)zeroDisparityTrack;
- (PTCinematographyTrackAllocator)trackAllocator;
- (PTCinematographyTrackAllocator)trackAllocatorForFocusIdentifier;
- (PTGlobalCinematographyMetadata)globals;
- (float)loadedUserAperture;
- (float)userAperture;
- (id)_bestDetectionForGroupIdentifier:(int64_t)a3 time:(id *)a4;
- (id)_calculateTrackDecisions;
- (id)_detectionWithGroupIdentifier:(int64_t)a3 atOrBeforeTime:(id *)a4;
- (id)_detectionWithTrackIdentifier:(int64_t)a3 atOrBeforeTime:(id *)a4;
- (id)_effectiveDecisionsFromBaseDecisionsRange:(_NSRange)a3 userDecisionsRange:(_NSRange)a4 endTime:(id *)a5;
- (id)_effectiveDecisionsFromZippedDecisions:(id)a3 endTime:(id *)a4;
- (id)_existingGroupTrackForGroupIdentifier:(int64_t)a3;
- (id)_internalizeGroupTrackForDetection:(id)a3;
- (id)_internalizeTrackForDetection:(id)a3;
- (id)_internalizeTrackNumberForFocusIdentifier:(id)a3;
- (id)_internalizeTrackWithGroupNumberFromDetection:(id)a3;
- (id)_internalizeTrackWithNumberFromDetection:(id)a3;
- (id)_latestDetectionOfGroupIdentifier:(int64_t)a3 atOrBeforeFrameIndex:(unint64_t)a4 timeLimit:(id *)a5;
- (id)_latestDetectionOfTrackIdentifier:(int64_t)a3 atOrBeforeFrameIndex:(unint64_t)a4 timeLimit:(id *)a5;
- (id)_trackDecisionsInTimeRange:(id *)a3;
- (id)_userCreatedTracks;
- (id)_userDecisionDictionaries;
- (id)_userDecisionDictionariesTrimmedByTimeRange:(id *)a3;
- (id)_userDecisionToFocusOnDetection:(id)a3 time:(id *)a4 strong:(BOOL)a5 group:(BOOL)a6;
- (id)_userTrackDictionaries;
- (id)_userTrackDictionariesTrimmedByTimeRange:(id *)a3;
- (id)_zipBaseDecisionsRange:(_NSRange)a3 userDecisionsRange:(_NSRange)a4;
- (id)baseDecisionsInTimeRange:(id *)a3;
- (id)changesDictionary;
- (id)changesDictionaryTrimmedByTimeRange:(id *)a3;
- (id)decisionAfterTime:(id *)a3;
- (id)decisionAtOrBeforeTime:(id *)a3;
- (id)decisionBeforeTime:(id *)a3;
- (id)decisionNearestTime:(id *)a3;
- (id)decisionsInTimeRange:(id *)a3;
- (id)frameAtTime:(id *)a3 tolerance:(id *)a4;
- (id)frameNearestTime:(id *)a3;
- (id)framesInTimeRange:(id *)a3;
- (id)loadWithAsset:(id)a3 changesDictionary:(id)a4 completion:(id)a5;
- (id)primaryDecisionAtTime:(id *)a3;
- (id)secondaryDecisionAtTime:(id *)a3;
- (id)trackForDecision:(id)a3;
- (id)trackForGroupIdentifier:(int64_t)a3;
- (id)trackForIdentifier:(int64_t)a3;
- (id)userDecisionsInTimeRange:(id *)a3;
- (int64_t)_trackAllocatorState;
- (int64_t)loadedTrackAllocatorState;
- (void)_addDecision:(id)a3 toTrackDecisions:(id)a4;
- (void)_addDecisions:(id)a3 toTrackDecisions:(id)a4;
- (void)_addDetectionsFromCustomTrack:(id)a3;
- (void)_addDetectionsFromFixedFocusTrack:(id)a3;
- (void)_addGroupDecision:(id)a3 toTrackDecisions:(id)a4 nextDecision:(id)a5;
- (void)_addGroupTrack:(id)a3;
- (void)_addTrack:(id)a3 identifier:(int64_t)a4;
- (void)_addZeroDisparityTrack;
- (void)_internalizeBaseDecisionsFromFrames:(id)a3;
- (void)_internalizeDetectionsFromTrack:(id)a3;
- (void)_internalizeFocusPullerFromFrames:(id)a3;
- (void)_internalizeLoadedFrames:(id)a3 changesDictionary:(id)a4 reloading:(BOOL)a5;
- (void)_internalizeTracksFromChangesDictionary:(id)a3;
- (void)_internalizeTracksFromFrames:(id)a3;
- (void)_internalizeUserApertureFromChangesDictionary:(id)a3;
- (void)_internalizeUserDecisionsFromChangesDictionary:(id)a3;
- (void)_internalizeUserDecisionsFromFrames:(id)a3;
- (void)_invalidateTrackDecisions;
- (void)_notifyDelegateOfChangesToDecisionsInTimeRange:(id *)a3;
- (void)_notifyDelegateOfChangesToFramesInTimeRange:(id *)a3;
- (void)_reloadTrackAllocator;
- (void)_removeAllUserTracksForReloading;
- (void)_removeDetectionsWithTrackIdentifier:(int64_t)a3;
- (void)_removeTrack:(id)a3;
- (void)_updateDecisionsAndFramesInTimeRange:(id *)a3;
- (void)_updateEffectiveDecisionsInTimeRange:(id *)a3;
- (void)_updateFramesForDecision:(id)a3 upToTime:(id *)a4;
- (void)_updateFramesForDecisions:(id)a3 indexRange:(_NSRange)a4;
- (void)_updateFramesForDecisions:(id)a3 timeRange:(id *)a4;
- (void)_updateFramesForFinalDecision:(id)a3;
- (void)_updateFramesForTransitionFromDecision:(id)a3 toDecision:(id)a4;
- (void)_updateFramesForTransitionFromDecision:(id)a3 toDecision:(id)a4 timeRange:(id *)a5;
- (void)_updateFramesFromDecision:(id)a3 toDecision:(id)a4;
- (void)_updateFramesInIndexRange:(_NSRange)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6;
- (void)_updateFramesInIndexRange:(_NSRange)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6 overTimeRange:(id *)a7;
- (void)_updateFramesInIndexRange:(_NSRange)a3 toFocusOnDetection:(id)a4;
- (void)_updateFramesInIndexRange:(_NSRange)a3 toFocusOnTrackIdentifier:(int64_t)a4;
- (void)_updateFramesInTimeRange:(id *)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6;
- (void)_updateFramesInTimeRange:(id *)a3 toFocusOnTrackIdentifier:(unint64_t)a4;
- (void)addBaseDecision:(id)a3;
- (void)addFrame:(id)a3;
- (void)reloadWithChangesDictionary:(id)a3;
- (void)removeAllUserDecisions;
- (void)setAsset:(id)a3;
- (void)setBaseDecisions:(id)a3;
- (void)setBaseDecisionsAreMutable:(BOOL)a3;
- (void)setChangesDelegate:(id)a3;
- (void)setDidInternalizeTracks:(BOOL)a3;
- (void)setEffectiveDecisions:(id)a3;
- (void)setFocusFramesOptions:(id)a3;
- (void)setFocusPuller:(id)a3;
- (void)setFrames:(id)a3;
- (void)setFramesAreMutable:(BOOL)a3;
- (void)setGlobals:(id)a3;
- (void)setLoadedTrackAllocatorState:(int64_t)a3;
- (void)setLoadedUserAperture:(float)a3;
- (void)setMutableGroupTracks:(id)a3;
- (void)setMutableTracks:(id)a3;
- (void)setTrackAllocator:(id)a3;
- (void)setTrackAllocatorForFocusIdentifier:(id)a3;
- (void)setTrackDecisions:(id)a3;
- (void)setTrackForGroupNumber:(id)a3;
- (void)setTrackForNumber:(id)a3;
- (void)setTrackNumberForFocusIdentifier:(id)a3;
- (void)setUserAperture:(float)a3;
- (void)setUserDecisions:(id)a3;
- (void)setZeroDisparityTrack:(id)a3;
@end

@implementation PTCinematographyScript

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultMinimumUserFocusDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 2, 1);
}

- (PTCinematographyScript)init
{
  v35.receiver = self;
  v35.super_class = (Class)PTCinematographyScript;
  v2 = [(PTCinematographyScript *)&v35 init];
  v3 = v2;
  if (v2)
  {
    v2->_userAperture = 4.0;
    v2->_loadedUserAperture = 4.0;
    frames = v2->_frames;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_frames = (NSArray *)MEMORY[0x1E4F1CBF0];

    baseDecisions = v3->_baseDecisions;
    v3->_baseDecisions = v5;

    uint64_t v7 = objc_opt_new();
    userDecisions = v3->_userDecisions;
    v3->_userDecisions = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    effectiveDecisions = v3->_effectiveDecisions;
    v3->_effectiveDecisions = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    mutableTracks = v3->_mutableTracks;
    v3->_mutableTracks = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    trackForNumber = v3->_trackForNumber;
    v3->_trackForNumber = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    trackNumberForFocusIdentifier = v3->_trackNumberForFocusIdentifier;
    v3->_trackNumberForFocusIdentifier = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    mutableGroupTracks = v3->_mutableGroupTracks;
    v3->_mutableGroupTracks = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    trackForGroupNumber = v3->_trackForGroupNumber;
    v3->_trackForGroupNumber = (NSMutableDictionary *)v19;

    v21 = [[PTCinematographyTrackAllocator alloc] initWithTrackIdentifier:0x1200000000];
    trackAllocator = v3->_trackAllocator;
    v3->_trackAllocator = v21;

    v3->_loadedTrackAllocatorState = [(PTCinematographyTrackAllocator *)v3->_trackAllocator trackIdentifier];
    v23 = [[PTCinematographyTrackAllocator alloc] initWithTrackIdentifier:0x1300000000];
    trackAllocatorForFocusIdentifier = v3->_trackAllocatorForFocusIdentifier;
    v3->_trackAllocatorForFocusIdentifier = v23;

    focusPuller = v3->_focusPuller;
    v3->_focusPuller = 0;

    v26 = objc_alloc_init(PTCinematographyFocusFramesOptions);
    focusFramesOptions = v3->_focusFramesOptions;
    v3->_focusFramesOptions = v26;

    [(PTCinematographyScript *)v3 _addZeroDisparityTrack];
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime v32 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
    CMTimeRangeMake(&v34, &start, &v32);
    long long v28 = *(_OWORD *)&v34.start.epoch;
    *(_OWORD *)&v3->_timeRange.start.value = *(_OWORD *)&v34.start.value;
    *(_OWORD *)&v3->_timeRange.start.epoch = v28;
    *(_OWORD *)&v3->_timeRange.duration.timescale = *(_OWORD *)&v34.duration.timescale;
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.Portrait.CinematographyScript.serialQueue", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v29;
  }
  return v3;
}

- (id)loadWithAsset:(id)a3 changesDictionary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[PTAssetReader alloc] initWithAsset:v8];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(PTAssetReader *)v11 estimatedFrameCount];
    if (v8) {
      [v8 duration];
    }
    else {
      memset(&duration, 0, sizeof(duration));
    }
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeRangeMake(&v49, &start, &duration);
    long long v17 = *(_OWORD *)&v49.start.epoch;
    *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v49.start.value;
    *(_OWORD *)&self->_timeRange.start.epoch = v17;
    *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v49.duration.timescale;
    v49.start.value = 0;
    *(void *)&v49.start.timescale = &v49;
    v49.start.epoch = 0x3032000000;
    v49.duration.value = (CMTimeValue)__Block_byref_object_copy__0;
    *(void *)&v49.duration.timescale = __Block_byref_object_dispose__0;
    v49.duration.epoch = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    char v47 = 0;
    start.value = 0;
    *(void *)&start.timescale = &start;
    start.epoch = 0x3032000000;
    v43 = __Block_byref_object_copy__0;
    v44 = __Block_byref_object_dispose__0;
    id v45 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v13];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__0;
    v40[4] = __Block_byref_object_dispose__0;
    id v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__0;
    v38[4] = __Block_byref_object_dispose__0;
    id v39 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
    v18 = dispatch_group_create();
    dispatch_group_enter(v18);
    uint64_t v19 = dispatch_get_global_queue(0, 0);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_23;
    v27[3] = &unk_1E6884730;
    CMTime v32 = v40;
    v33 = &v49;
    p_CMTime start = &start;
    long long v28 = v12;
    dispatch_queue_t v29 = self;
    objc_super v35 = v38;
    uint64_t v37 = v13;
    v36 = v46;
    id v30 = v9;
    v31 = v18;
    v20 = v18;
    dispatch_async(v19, v27);

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_2;
    v23[3] = &unk_1E6884780;
    v23[4] = self;
    id v24 = v10;
    v25 = v46;
    v26 = &v49;
    id v21 = v10;
    dispatch_group_notify(v20, v19, v23);

    id v16 = *(id *)(*(void *)&start.timescale + 40);
    _Block_object_dispose(v38, 8);

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&start, 8);

    _Block_object_dispose(v46, 8);
    _Block_object_dispose(&v49, 8);
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke;
    block[3] = &unk_1E68846E0;
    id v52 = v10;
    id v51 = v8;
    id v15 = v10;
    dispatch_async(serialQueue, block);

    id v16 = 0;
  }

  return v16;
}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [NSString stringWithFormat:@"Failed to read AVAsset: %@", *(void *)(a1 + 32), *MEMORY[0x1E4F28568]];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v5 = [v1 errorWithDomain:@"com.apple.Portrait.CinematographyScript" code:3 userInfo:v4];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v5);
}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_23(uint64_t a1)
{
  v65[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) globalCinematographyMetadata];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v6 + 40);
  int v7 = [v5 startReadingFrames:1 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
  {
    uint64_t v8 = 0;
    goto LABEL_25;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) isCancelled])
  {
    uint64_t v8 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = 0;
  uint64_t v45 = *MEMORY[0x1E4F28568];
  while (1)
  {
    id v10 = (void *)MEMORY[0x1D25E42A0]();
    uint64_t v11 = (void *)[*(id *)(a1 + 32) nextFrame];
    if (!v11) {
      break;
    }
    v12 = v11;
    uint64_t v13 = [v11 metadata];
    v14 = [v13 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.cinematography"];

    id v15 = [v12 metadata];
    id v16 = v15;
    if (v14)
    {
      long long v17 = [v15 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.cinematography"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v64 = v45;
        id v24 = [NSString stringWithFormat:@"Value for %@ key is of unexpected type: %@ for frame index %lu", @"com.apple.quicktime.cinematic-video.cinematography", v17, objc_msgSend(v12, "index")];
        v65[0] = v24;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
        uint64_t v26 = [v23 errorWithDomain:@"com.apple.Portrait.CinematographyScript" code:5 userInfo:v25];
        uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
        long long v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

LABEL_22:
        break;
      }
      [v12 metadataTime];
      long long v51 = v53;
      uint64_t v52 = v54;
      [v17 setTime:&v51];
      if (!v9) {
        goto LABEL_10;
      }
    }
    else
    {
      v18 = [v15 objectForKeyedSubscript:@"com.apple.quicktime.cinematography-dictionary"];

      if (!v18
        || ([v18 objectForKeyedSubscript:@"CinematographyDictionary"],
            uint64_t v19 = objc_claimAutoreleasedReturnValue(),
            v19,
            v19)
        && ([v18 objectForKeyedSubscript:@"CinematographyDictionary"],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            v18,
            (v18 = (void *)v20) == 0))
      {
        dispatch_queue_t v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v62 = v45;
        long long v17 = [NSString stringWithFormat:@"No %@ key in metadata for frame index %lu", @"com.apple.quicktime.cinematography-dictionary", objc_msgSend(v12, "index")];
        v63 = v17;
        id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        uint64_t v30 = [v29 errorWithDomain:@"com.apple.Portrait.CinematographyScript" code:5 userInfo:v24];
        uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
        v25 = *(void **)(v31 + 40);
        *(void *)(v31 + 40) = v30;
        goto LABEL_22;
      }
      id v21 = [PTCinematographyFrame alloc];
      [v12 metadataTime];
      uint64_t v22 = [(PTCinematographyFrame *)v21 _initWithCinematographyDictionary:v18 time:v50];
      if (!v22)
      {
        CMTime v32 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v60 = v45;
        id v24 = [NSString stringWithFormat:@"Failed to parse cinematography metadata for frame %lu. Dictionary: %@", objc_msgSend(v12, "index"), v18];
        v61 = v24;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        uint64_t v33 = [v32 errorWithDomain:@"com.apple.Portrait.CinematographyScript" code:5 userInfo:v25];
        uint64_t v34 = *(void *)(*(void *)(a1 + 72) + 8);
        objc_super v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = v33;

        long long v17 = v18;
        goto LABEL_22;
      }
      long long v17 = (void *)v22;

      if (!v9)
      {
LABEL_10:
        [v17 aperture];
        objc_msgSend(*(id *)(a1 + 40), "setUserAperture:");
        [*(id *)(a1 + 40) userAperture];
        objc_msgSend(*(id *)(a1 + 40), "setLoadedUserAperture:");
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setObject:v17 atIndexedSubscript:v9];
    uint64_t v8 = v9 + 1;
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setCompletedUnitCount:v9];

    ++v9;
    if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) isCancelled]) {
      goto LABEL_24;
    }
  }
  uint64_t v8 = v9;
LABEL_24:
  [*(id *)(a1 + 32) stopReadingFrames];
LABEL_25:
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    && [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) isCancelled])
  {
    uint64_t v36 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Portrait.CinematographyScript" code:2 userInfo:0];
    uint64_t v37 = *(void *)(*(void *)(a1 + 72) + 8);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    if (*(void *)(a1 + 104) == v8) {
      goto LABEL_33;
    }
    id v39 = _PTLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = *(void *)(a1 + 104);
      *(_DWORD *)buf = 134218240;
      uint64_t v57 = v40;
      __int16 v58 = 2048;
      uint64_t v59 = v8;
      _os_log_impl(&dword_1D0778000, v39, OS_LOG_TYPE_INFO, "WARNING: frameCount estimate was off. %lu frames expected, but only %lu were read", buf, 0x16u);
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
LABEL_33:
      uint64_t v41 = *(void *)(a1 + 40);
      v42 = *(NSObject **)(v41 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_37;
      block[3] = &unk_1E6884708;
      uint64_t v43 = *(void *)(a1 + 64);
      void block[4] = v41;
      uint64_t v44 = *(void *)(a1 + 88);
      uint64_t v48 = v43;
      uint64_t v49 = v44;
      id v47 = *(id *)(a1 + 48);
      dispatch_sync(v42, block);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_37(void *a1)
{
  objc_storeStrong((id *)(a1[4] + 56), *(id *)(*(void *)(a1[6] + 8) + 40));
  uint64_t v2 = (void *)a1[4];
  id v3 = (id)[*(id *)(*(void *)(a1[7] + 8) + 40) copy];
  [v2 _internalizeLoadedFrames:v3 changesDictionary:a1[5] reloading:0];
}

void __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_3;
  block[3] = &unk_1E6884758;
  id v4 = *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __69__PTCinematographyScript_loadWithAsset_changesDictionary_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (BOOL)_loadWithAsset:(id)a3 changesDictionary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PTCinematographyScript__loadWithAsset_changesDictionary_error___block_invoke;
  v15[3] = &unk_1E68847A8;
  long long v17 = &v25;
  v18 = &v19;
  uint64_t v11 = v10;
  id v16 = v11;
  id v12 = [(PTCinematographyScript *)self loadWithAsset:v8 changesDictionary:v9 completion:v15];
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v20[5];
  }
  char v13 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __65__PTCinematographyScript__loadWithAsset_changesDictionary_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)reloadWithChangesDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(PTCinematographyScript *)self changesDelegate];
  [(PTCinematographyScript *)self setChangesDelegate:0];
  [(PTCinematographyScript *)self removeAllUserDecisions];
  [(PTCinematographyScript *)self _removeAllUserTracksForReloading];
  [(PTCinematographyScript *)self loadedUserAperture];
  -[PTCinematographyScript setUserAperture:](self, "setUserAperture:");
  uint64_t v6 = [(PTCinematographyScript *)self frames];
  [(PTCinematographyScript *)self _internalizeLoadedFrames:v6 changesDictionary:v4 reloading:1];

  [(PTCinematographyScript *)self setChangesDelegate:v5];
  [(PTCinematographyScript *)self timeRange];
  [(PTCinematographyScript *)self _notifyDelegateOfChangesToDecisionsInTimeRange:v8];
  [(PTCinematographyScript *)self timeRange];
  [(PTCinematographyScript *)self _notifyDelegateOfChangesToFramesInTimeRange:&v7];
}

- (void)_internalizeLoadedFrames:(id)a3 changesDictionary:(id)a4 reloading:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(PTCinematographyScript *)self setFrames:v8];
  [(PTCinematographyScript *)self _internalizeUserApertureFromChangesDictionary:v9];
  [(PTCinematographyScript *)self _internalizeFocusPullerFromFrames:v8];
  id v10 = [[PTCinematographyFocusFramesOptions alloc] initWithGlobalMetadata:self->_globals];
  focusFramesOptions = self->_focusFramesOptions;
  self->_focusFramesOptions = v10;

  if (v5)
  {
    [(PTCinematographyScript *)self _reloadTrackAllocator];
    [(PTCinematographyScript *)self _internalizeTracksFromChangesDictionary:v9];
  }
  else
  {
    [(PTCinematographyScript *)self _internalizeTracksFromFrames:v8];
    [(PTCinematographyScript *)self _internalizeTracksFromChangesDictionary:v9];
    [(PTCinematographyScript *)self _internalizeBaseDecisionsFromFrames:v8];
  }
  if (v9) {
    [(PTCinematographyScript *)self _internalizeUserDecisionsFromChangesDictionary:v9];
  }
  else {
    [(PTCinematographyScript *)self _internalizeUserDecisionsFromFrames:v8];
  }
  [(PTCinematographyScript *)self timeRange];
  [(PTCinematographyScript *)self _updateEffectiveDecisionsInTimeRange:v16];
  id v12 = _PTLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[PTCinematographyScript _internalizeLoadedFrames:changesDictionary:reloading:](self);
  }

  char v13 = _PTLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PTCinematographyScript _internalizeLoadedFrames:changesDictionary:reloading:](self);
  }

  v14 = [(PTCinematographyScript *)self trackDecisions];
  [(PTCinematographyScript *)self timeRange];
  [(PTCinematographyScript *)self _updateFramesForDecisions:v14 timeRange:&v15];
}

- (void)_internalizeFocusPullerFromFrames:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PTCinematographyScript *)self globals];

  if (v5)
  {
    uint64_t v6 = [(PTCinematographyScript *)self globals];
    int v7 = [v6 majorVersion];

    if (v7 == 1)
    {
      id v8 = [(PTCinematographyScript *)self globals];
      [v8 focusPullerAlpha];
      float v10 = v9;
      [v8 focusPullerMaxV];
      float v12 = v11;
      [v8 focusPullerResistance];
      int v14 = v13;

      if (v12 > 0.0)
      {
        uint64_t v15 = [PTCinematographyFocusPuller alloc];
        *(float *)&double v16 = v12;
        LODWORD(v17) = v14;
        v18 = [(PTCinematographyFocusPuller *)v15 initWithMaximumVelocity:v16 resistance:v17];
LABEL_13:
        focusPuller = self->_focusPuller;
        self->_focusPuller = v18;
LABEL_15:

        goto LABEL_18;
      }
      if (v10 > 0.0)
      {
        uint64_t v25 = [PTCinematographyFocusPuller alloc];
        *(float *)&double v26 = v10;
        v18 = [(PTCinematographyFocusPuller *)v25 initWithExponentialMovingAverageAlpha:v26];
        goto LABEL_13;
      }
    }
    else
    {
      id v24 = _PTLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyScript _internalizeFocusPullerFromFrames:](self);
      }
    }
    focusPuller = self->_focusPuller;
    self->_focusPuller = 0;
    goto LABEL_15;
  }
  if ([v4 count])
  {
    uint64_t v19 = [v4 objectAtIndexedSubscript:0];
    uint64_t v20 = [v19 _snapshot];
    uint64_t v21 = [v20 objectForKeyedSubscript:@"focus_puller"];

    uint64_t v22 = [PTCinematographyFocusPuller alloc];
    if (v21) {
      v23 = [(PTCinematographyFocusPuller *)v22 _initWithCinematographyDictionary:v21];
    }
    else {
      v23 = [(PTCinematographyFocusPuller *)v22 initWithExponentialMovingAverageSampleCount:1];
    }
    char v28 = self->_focusPuller;
    self->_focusPuller = v23;
  }
LABEL_18:
}

- (void)_internalizeUserApertureFromChangesDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"user_aperture"];
  if (v4)
  {
    id v5 = v4;
    [v4 floatValue];
    -[PTCinematographyScript setUserAperture:](self, "setUserAperture:");
    id v4 = v5;
  }
}

- (void)_internalizeUserDecisionsFromChangesDictionary:(id)a3
{
  id v6 = [a3 objectForKeyedSubscript:@"user_decisions"];
  id v4 = +[PTCinematographyDecision _mutableDecisionsWithCinematographyDictionaries:v6];
  userDecisions = self->_userDecisions;
  self->_userDecisions = v4;
}

- (void)_internalizeUserDecisionsFromFrames:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v30 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v4)
  {
    float v9 = 0;
    goto LABEL_62;
  }
  uint64_t v6 = v4;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  float v9 = 0;
  uint64_t v10 = *(void *)v46;
  uint64_t v28 = -1;
  char v29 = 1;
  *(void *)&long long v5 = 138412290;
  long long v26 = v5;
  do
  {
    uint64_t v11 = 0;
    uint64_t v12 = v7;
    uint64_t v13 = v8;
    int v14 = v9;
    do
    {
      if (*(void *)v46 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
      double v16 = objc_msgSend(v15, "baseFocusTrackNumber", v26);

      if (!v16)
      {
        uint64_t v7 = v12;
        uint64_t v8 = v13;
        float v9 = v14;
        goto LABEL_46;
      }
      float v9 = [v15 userFocusTrackNumber];
      uint64_t v7 = [v15 isUserFocusStrong];
      uint64_t v8 = [v15 isUserFocusGroup];
      if ([v15 isUserFocusEnd])
      {
        double v17 = [v30 lastObject];
        if (v17)
        {
          if (v15) {
            [v15 time];
          }
          else {
            memset(&lhs, 0, sizeof(lhs));
          }
          [v17 time];
          CMTimeSubtract(&v44, &lhs, &rhs);
          CMTime v41 = v44;
          [v17 setMaximumDuration:&v41];
          uint64_t v19 = _PTLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            if (v15) {
              [v15 time];
            }
            else {
              memset(&v40, 0, sizeof(v40));
            }
            v23 = NSStringFromCMTime(&v40);
            LODWORD(buf.value) = 138412546;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v17;
            LOWORD(buf.flags) = 2112;
            *(void *)((char *)&buf.flags + 2) = v23;
            _os_log_debug_impl(&dword_1D0778000, v19, OS_LOG_TYPE_DEBUG, "internalizing user decision %@ end at %@", (uint8_t *)&buf, 0x16u);
          }
        }
        else
        {
          uint64_t v19 = _PTLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            [(PTCinematographyScript *)&v38 _internalizeUserDecisionsFromFrames:v19];
          }
        }
        goto LABEL_43;
      }
      if (v9
        && (!v14
         || ![v9 isEqualToNumber:v14]
         || ((v12 ^ v7) & 1) != 0
         || ((v13 ^ v8) & 1) != 0))
      {
        v18 = [v15 detectionForTrackNumber:v9];
        double v17 = v18;
        if (v18)
        {
          if ((v8 & v13) != 1 || [v18 groupIdentifier] != v28)
          {
            if (v15) {
              [v15 time];
            }
            else {
              memset(v37, 0, sizeof(v37));
            }
            uint64_t v19 = [(PTCinematographyScript *)self _userDecisionToFocusOnDetection:v17 time:v37 strong:v7 group:v8];
            uint64_t v22 = _PTLogSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf.value) = v26;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v19;
              _os_log_debug_impl(&dword_1D0778000, v22, OS_LOG_TYPE_DEBUG, "internalizing user decision %@", (uint8_t *)&buf, 0xCu);
            }

            [v30 addObject:v19];
            uint64_t v28 = [v17 groupIdentifier];
            goto LABEL_43;
          }
        }
        else
        {
          uint64_t v19 = _PTLogSystem();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.value) = 138412546;
            *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
            LOWORD(buf.flags) = 2112;
            *(void *)((char *)&buf.flags + 2) = v15;
            _os_log_error_impl(&dword_1D0778000, v19, OS_LOG_TYPE_ERROR, "userFocusTrackNumber %@ has no corresponding detection on frame %@. No user decision was added.", (uint8_t *)&buf, 0x16u);
          }
LABEL_43:
        }
LABEL_44:

        goto LABEL_45;
      }
      if ((v29 & 1) != 0 && (unint64_t)[v30 count] <= 1)
      {
        uint64_t v20 = [v30 count];
        if (v9 || v20 != 1)
        {
          char v29 = 1;
          goto LABEL_45;
        }
        double v17 = [v30 firstObject];
        uint64_t v21 = objc_msgSend(v15, "detectionForTrackIdentifier:", objc_msgSend(v17, "trackIdentifier"));

        if (v21)
        {
          memset(&buf, 0, sizeof(buf));
          if (v15)
          {
            [v15 time];
            if (v17) {
              goto LABEL_38;
            }
LABEL_52:
            memset(&v35, 0, sizeof(v35));
          }
          else
          {
            memset(&v36, 0, sizeof(v36));
            if (!v17) {
              goto LABEL_52;
            }
LABEL_38:
            [v17 time];
          }
          CMTimeSubtract(&buf, &v36, &v35);
          id v24 = objc_opt_class();
          if (v24) {
            [v24 defaultMinimumUserFocusDuration];
          }
          else {
            memset(&time2, 0, sizeof(time2));
          }
          CMTime time1 = buf;
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            CMTime v32 = buf;
            [v17 setMinimumDuration:&v32];
          }
        }
        char v29 = 0;
        goto LABEL_44;
      }
      char v29 = 0;
LABEL_45:

      uint64_t v12 = v7;
      uint64_t v13 = v8;
      int v14 = v9;
LABEL_46:
      ++v11;
    }
    while (v6 != v11);
    uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    uint64_t v6 = v25;
  }
  while (v25);
LABEL_62:

  [(PTCinematographyScript *)self setUserDecisions:v30];
}

- (id)_userDecisionToFocusOnDetection:(id)a3 time:(id *)a4 strong:(BOOL)a5 group:(BOOL)a6
{
  if (a6) {
    uint64_t v7 = a5 | 2;
  }
  else {
    uint64_t v7 = a5;
  }
  id v8 = a3;
  float v9 = [PTCinematographyDecision alloc];
  uint64_t v10 = [v8 trackIdentifier];
  long long v14 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  uint64_t v11 = [(PTCinematographyDecision *)v9 initWithTime:&v14 trackIdentifier:v10 options:v7];
  uint64_t v12 = [v8 groupIdentifier];

  [(PTCinematographyDecision *)v11 setGroupIdentifier:v12];
  [(PTCinematographyDecision *)v11 setType:1];

  return v11;
}

- (float)userAperture
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  float userAperture = v2->_userAperture;
  objc_sync_exit(v2);

  return userAperture;
}

- (void)setUserAperture:(float)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    _PTLogSystem();
    uint64_t v4 = (PTCinematographyScript *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyScript setUserAperture:](&v4->super);
    }
  }
  else
  {
    uint64_t v4 = self;
    objc_sync_enter(v4);
    if (v4->_userAperture != a3)
    {
      v4->_float userAperture = a3;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v5 = [(PTCinematographyScript *)v4 frames];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            *(float *)&double v7 = a3;
            [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setAperture:v7];
          }
          while (v6 != v9);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
    }
    objc_sync_exit(v4);
  }
}

- (id)frameNearestTime:(id *)a3
{
  long long v5 = [(PTCinematographyScript *)self frames];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  unint64_t v6 = [v5 _indexNearestTime:&v12];

  double v7 = [(PTCinematographyScript *)self frames];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    long long v10 = 0;
  }
  else
  {
    uint64_t v9 = [(PTCinematographyScript *)self frames];
    long long v10 = [v9 objectAtIndexedSubscript:v6];
  }

  return v10;
}

- (id)frameAtTime:(id *)a3 tolerance:(id *)a4
{
  CMTime v13 = *(CMTime *)a3;
  unint64_t v6 = [(PTCinematographyScript *)self frameNearestTime:&v13];
  double v7 = v6;
  if (v6)
  {
    memset(&v13, 0, sizeof(v13));
    [v6 time];
    CMTime rhs = (CMTime)*a3;
    CMTimeSubtract(&v13, &lhs, &rhs);
    memset(&rhs, 0, sizeof(rhs));
    CMTime time = v13;
    CMTimeAbsoluteValue(&rhs, &time);
    CMTime time = rhs;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
    if (CMTimeCompare(&time, (CMTime *)&v9) >= 1)
    {

      double v7 = 0;
    }
  }

  return v7;
}

- (id)framesInTimeRange:(id *)a3
{
  long long v5 = [(PTCinematographyScript *)self frames];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 _indexRangeOfTimeRange:v13];
  uint64_t v9 = v8;

  if (v9)
  {
    long long v10 = [(PTCinematographyScript *)self frames];
    long long v11 = objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  }
  else
  {
    long long v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_detectionWithTrackIdentifier:(int64_t)a3 atOrBeforeTime:(id *)a4
{
  uint64_t v7 = [(PTCinematographyScript *)self frames];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  uint64_t v8 = [v7 _indexAtOrBeforeTime:&v11];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA10];
    uint64_t v9 = [(PTCinematographyScript *)self _latestDetectionOfTrackIdentifier:a3 atOrBeforeFrameIndex:v8 timeLimit:&v11];
  }

  return v9;
}

- (id)_detectionWithGroupIdentifier:(int64_t)a3 atOrBeforeTime:(id *)a4
{
  uint64_t v7 = [(PTCinematographyScript *)self frames];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  uint64_t v8 = [v7 _indexAtOrBeforeTime:&v11];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA10];
    uint64_t v9 = [(PTCinematographyScript *)self _latestDetectionOfGroupIdentifier:a3 atOrBeforeFrameIndex:v8 timeLimit:&v11];
  }

  return v9;
}

- (void)_updateFramesForDecisions:(id)a3 timeRange:(id *)a4
{
  long long v5 = *(_OWORD *)&a4->var0.var3;
  long long v9 = *(_OWORD *)&a4->var0.var0;
  long long v10 = v5;
  long long v11 = *(_OWORD *)&a4->var1.var1;
  id v6 = a3;
  uint64_t v7 = [v6 _indexRangeOfTimeRange:&v9];
  -[PTCinematographyScript _updateFramesForDecisions:indexRange:](self, "_updateFramesForDecisions:indexRange:", v6, v7, v8, v9, v10, v11);
}

- (void)_updateFramesForDecisions:(id)a3 indexRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  unint64_t location = a4.location;
  id v7 = a3;
  uint64_t v8 = v7;
  if (location && location < [v7 count])
  {
    long long v9 = [v8 objectAtIndexedSubscript:location - 1];
    long long v10 = [v8 objectAtIndexedSubscript:location];
    [(PTCinematographyScript *)self _updateFramesForTransitionFromDecision:v9 toDecision:v10];
  }
  if (location < location + length)
  {
    NSUInteger v11 = length;
    unint64_t v12 = location;
    do
    {
      unint64_t v13 = v12++;
      unint64_t v14 = [v8 count];
      uint64_t v15 = [v8 objectAtIndexedSubscript:v13];
      if (v12 >= v14)
      {
        [(PTCinematographyScript *)self _updateFramesForFinalDecision:v15];
      }
      else
      {
        double v16 = [v8 objectAtIndexedSubscript:v12];
        [(PTCinematographyScript *)self _updateFramesFromDecision:v15 toDecision:v16];
      }
      --v11;
    }
    while (v11);
  }
  double v17 = _PTLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18.unint64_t location = location;
    v18.NSUInteger length = length;
    -[PTCinematographyScript _updateFramesForDecisions:indexRange:](v18);
  }
}

- (void)_updateFramesFromDecision:(id)a3 toDecision:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 trackIdentifier];
  if (v8 == [v7 trackIdentifier])
  {
    long long v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyScript _updateFramesFromDecision:toDecision:]();
    }

    if (v7) {
      [v7 time];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    [(PTCinematographyScript *)self _updateFramesForDecision:v6 upToTime:v18];
  }
  else
  {
    char v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    [(PTCinematographyScript *)self _timeRangeOfTransitionfromDecision:v6 toDecision:v7 didShortenTransition:&v17];
    if (v17)
    {
      long long v10 = _PTLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PTCinematographyScript _updateFramesFromDecision:toDecision:](v6, v7, v10);
      }
    }
    long long v11 = v14;
    *(void *)&long long v12 = v15;
    [(PTCinematographyScript *)self _updateFramesForDecision:v6 upToTime:&v11];
    long long v11 = v14;
    long long v12 = v15;
    long long v13 = v16;
    [(PTCinematographyScript *)self _updateFramesForTransitionFromDecision:v6 toDecision:v7 timeRange:&v11];
  }
}

- (void)_updateFramesForFinalDecision:(id)a3
{
  id v4 = a3;
  [(PTCinematographyScript *)self timeRange];
  CMTimeRangeGetEnd(&v6, &range);
  [(PTCinematographyScript *)self _updateFramesForDecision:v4 upToTime:&v6];
}

- (void)_updateFramesForDecision:(id)a3 upToTime:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  memset(&v11, 0, sizeof(v11));
  if (v6) {
    [v6 time];
  }
  else {
    memset(&start, 0, sizeof(start));
  }
  *(_OWORD *)&v9.start.value = *(_OWORD *)&a4->var0;
  v9.start.epoch = a4->var3;
  CMTimeRangeFromTimeToTime(&v11, &start, &v9.start);
  uint64_t v8 = [v7 trackIdentifier];
  CMTimeRange v9 = v11;
  [(PTCinematographyScript *)self _updateFramesInTimeRange:&v9 toFocusOnTrackIdentifier:v8];
}

- (void)_updateFramesForTransitionFromDecision:(id)a3 toDecision:(id)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  id v6 = a4;
  id v7 = a3;
  [(PTCinematographyScript *)self _timeRangeOfTransitionfromDecision:v7 toDecision:v6];
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  [(PTCinematographyScript *)self _updateFramesForTransitionFromDecision:v7 toDecision:v6 timeRange:v8];
}

- (void)_updateFramesForTransitionFromDecision:(id)a3 toDecision:(id)a4 timeRange:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 trackIdentifier];
  uint64_t v11 = [v9 trackIdentifier];
  long long v12 = [(PTCinematographyScript *)self frames];
  long long v13 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
  long long v14 = *(_OWORD *)&a5->var1.var1;
  *(_OWORD *)&range.start.epoch = v13;
  *(_OWORD *)&range.duration.timescale = v14;
  uint64_t v15 = [v12 _indexRangeOfTimeRange:&range];
  uint64_t v17 = v16;

  if (v17)
  {
    *(_OWORD *)&range.start.value = *MEMORY[0x1E4F1FA10];
    range.start.epoch = *(void *)(MEMORY[0x1E4F1FA10] + 16);
    NSRange v18 = [(PTCinematographyScript *)self _latestDetectionOfTrackIdentifier:v10 atOrBeforeFrameIndex:v15 timeLimit:&range];
    if (v18)
    {
      unint64_t v19 = v15 + v17;
      uint64_t v20 = [(PTCinematographyScript *)self frames];
      unint64_t v21 = [v20 count];

      if (v19 >= v21)
      {
        id v24 = _PTLogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          long long v32 = *(_OWORD *)&a5->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
          long long v33 = *(_OWORD *)&a5->var1.var1;
          *(_OWORD *)&range.start.epoch = v32;
          *(_OWORD *)&range.duration.timescale = v33;
          CMTimeRangeGetEnd(&v42, &range);
          uint64_t v34 = NSStringFromCMTime(&v42);
          CMTime v35 = [NSNumber numberWithUnsignedInteger:v19];
          [(PTCinematographyScript *)self timeRange];
          CMTimeRangeGetEnd(&v41, &v40);
          CMTime v36 = NSStringFromCMTime(&v41);
          uint64_t v37 = NSNumber;
          uint8_t v38 = [(PTCinematographyScript *)self frames];
          id v39 = objc_msgSend(v37, "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
          LODWORD(range.start.value) = 138413058;
          *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v34;
          LOWORD(range.start.flags) = 2112;
          *(void *)((char *)&range.start.flags + 2) = v35;
          HIWORD(range.start.epoch) = 2112;
          range.duration.value = (CMTimeValue)v36;
          LOWORD(range.duration.timescale) = 2112;
          *(void *)((char *)&range.duration.timescale + 2) = v39;
          _os_log_error_impl(&dword_1D0778000, v24, OS_LOG_TYPE_ERROR, "error: endingDecision at %@ (%@) past end of frames at %@ (%@)", (uint8_t *)&range, 0x2Au);
        }
      }
      else
      {
        uint64_t v22 = [(PTCinematographyScript *)self frames];
        v23 = [v22 objectAtIndexedSubscript:v19];
        id v24 = [v23 detectionForTrackIdentifier:v11];

        uint64_t v25 = [v9 transition];
        long long v26 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
        long long v27 = *(_OWORD *)&a5->var1.var1;
        *(_OWORD *)&range.start.epoch = v26;
        *(_OWORD *)&range.duration.timescale = v27;
        [(PTCinematographyScript *)self _updateFramesInTimeRange:&range forTransition:v25 fromDetection:v18 toDetection:v24];
      }
    }
    else
    {
      id v24 = _PTLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PTCinematographyScript _updateFramesForTransitionFromDecision:toDecision:timeRange:]();
      }
    }
  }
  else
  {
    NSRange v18 = _PTLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
      range.start.epoch = a5->var0.var3;
      uint64_t v28 = NSStringFromCMTime(&range.start);
      long long v29 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
      long long v30 = *(_OWORD *)&a5->var1.var1;
      *(_OWORD *)&range.start.epoch = v29;
      *(_OWORD *)&range.duration.timescale = v30;
      CMTimeRangeGetEnd(&v43, &range);
      uint64_t v31 = NSStringFromCMTime(&v43);
      LODWORD(range.start.value) = 138413058;
      *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v8;
      LOWORD(range.start.flags) = 2112;
      *(void *)((char *)&range.start.flags + 2) = v9;
      HIWORD(range.start.epoch) = 2112;
      range.duration.value = (CMTimeValue)v28;
      LOWORD(range.duration.timescale) = 2112;
      *(void *)((char *)&range.duration.timescale + 2) = v31;
      _os_log_error_impl(&dword_1D0778000, v18, OS_LOG_TYPE_ERROR, "error: no frames in transition from %@ to %@ time range %@ to %@", (uint8_t *)&range, 0x2Au);
    }
  }
}

- (id)_latestDetectionOfTrackIdentifier:(int64_t)a3 atOrBeforeFrameIndex:(unint64_t)a4 timeLimit:(id *)a5
{
  long long v5 = (CMTime *)a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int var2 = a5->var2;
  uint64_t v10 = [(PTCinematographyScript *)self frames];
  uint64_t v11 = [v10 objectAtIndexedSubscript:a4];

  long long v12 = [v11 detectionForTrackIdentifier:a3];
  if (!v12)
  {
    int v25 = var2 & 0x1D;
    if (v25 == 1)
    {
      long long v13 = [(PTCinematographyScript *)self frames];
      if (v11) {
        [v11 time];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime rhs = *v5;
      CMTimeSubtract(&v27, &lhs, &rhs);
      uint64_t v14 = [v13 _firstIndexAtOrAfterTime:&v27];
    }
    else
    {
      uint64_t v14 = 0;
    }
    int64_t v15 = a4 - 1;
    while (v15 >= v14)
    {
      uint64_t v16 = [(PTCinematographyScript *)self frames];
      uint64_t v17 = [v16 objectAtIndexedSubscript:v15];
      long long v12 = [v17 detectionForTrackIdentifier:a3];

      --v15;
      if (v12) {
        goto LABEL_14;
      }
    }
    NSRange v18 = _PTLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unint64_t v21 = [NSNumber numberWithInteger:a3];
      uint64_t v22 = [NSNumber numberWithUnsignedInteger:a4];
      if (v25 == 1)
      {
        v23 = NSString;
        CMTime rhs = *v5;
        NSStringFromCMTime(&rhs);
        long long v5 = (CMTime *)objc_claimAutoreleasedReturnValue();
        id v24 = [v23 stringWithFormat:@" within %@", v5];
      }
      else
      {
        id v24 = &stru_1F269F3B0;
      }
      LODWORD(rhs.value) = 138412802;
      *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v21;
      LOWORD(rhs.flags) = 2112;
      *(void *)((char *)&rhs.flags + 2) = v22;
      HIWORD(rhs.epoch) = 2112;
      long long v29 = v24;
      _os_log_error_impl(&dword_1D0778000, v18, OS_LOG_TYPE_ERROR, "cannot find detections of track %@ at or before index %@%@", (uint8_t *)&rhs, 0x20u);
      if (v25 == 1)
      {
      }
    }

    long long v12 = 0;
  }
LABEL_14:
  id v19 = v12;

  return v19;
}

- (id)_latestDetectionOfGroupIdentifier:(int64_t)a3 atOrBeforeFrameIndex:(unint64_t)a4 timeLimit:(id *)a5
{
  long long v5 = (CMTime *)a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int var2 = a5->var2;
  uint64_t v10 = [(PTCinematographyScript *)self frames];
  uint64_t v11 = [v10 objectAtIndexedSubscript:a4];

  long long v12 = [v11 bestDetectionForGroupIdentifier:a3];
  if (!v12)
  {
    int v25 = var2 & 0x1D;
    if (v25 == 1)
    {
      long long v13 = [(PTCinematographyScript *)self frames];
      if (v11) {
        [v11 time];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime rhs = *v5;
      CMTimeSubtract(&v27, &lhs, &rhs);
      uint64_t v14 = [v13 _firstIndexAtOrAfterTime:&v27];
    }
    else
    {
      uint64_t v14 = 0;
    }
    int64_t v15 = a4 - 1;
    while (v15 >= v14)
    {
      uint64_t v16 = [(PTCinematographyScript *)self frames];
      uint64_t v17 = [v16 objectAtIndexedSubscript:v15];
      long long v12 = [v17 bestDetectionForGroupIdentifier:a3];

      --v15;
      if (v12) {
        goto LABEL_14;
      }
    }
    NSRange v18 = _PTLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unint64_t v21 = [NSNumber numberWithInteger:a3];
      uint64_t v22 = [NSNumber numberWithUnsignedInteger:a4];
      if (v25 == 1)
      {
        v23 = NSString;
        CMTime rhs = *v5;
        NSStringFromCMTime(&rhs);
        long long v5 = (CMTime *)objc_claimAutoreleasedReturnValue();
        id v24 = [v23 stringWithFormat:@" within %@", v5];
      }
      else
      {
        id v24 = &stru_1F269F3B0;
      }
      LODWORD(rhs.value) = 138412802;
      *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)v21;
      LOWORD(rhs.flags) = 2112;
      *(void *)((char *)&rhs.flags + 2) = v22;
      HIWORD(rhs.epoch) = 2112;
      long long v29 = v24;
      _os_log_error_impl(&dword_1D0778000, v18, OS_LOG_TYPE_ERROR, "cannot find detections of group %@ at or before index %@%@", (uint8_t *)&rhs, 0x20u);
      if (v25 == 1)
      {
      }
    }

    long long v12 = 0;
  }
LABEL_14:
  id v19 = v12;

  return v19;
}

- (void)_updateFramesInTimeRange:(id *)a3 toFocusOnTrackIdentifier:(unint64_t)a4
{
  id v7 = [(PTCinematographyScript *)self frames];
  long long v8 = *(_OWORD *)&a3->var0.var3;
  v12[0] = *(_OWORD *)&a3->var0.var0;
  v12[1] = v8;
  v12[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v9 = [v7 _indexRangeOfTimeRange:v12];
  uint64_t v11 = v10;

  -[PTCinematographyScript _updateFramesInIndexRange:toFocusOnTrackIdentifier:](self, "_updateFramesInIndexRange:toFocusOnTrackIdentifier:", v9, v11, a4);
}

- (void)_updateFramesInIndexRange:(_NSRange)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  memset(&v18, 0, sizeof(v18));
  if (!v12)
  {
    memset(&start, 0, sizeof(start));
    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&end, 0, sizeof(end));
    goto LABEL_6;
  }
  [v12 time];
  if (!v14) {
    goto LABEL_5;
  }
LABEL_3:
  [v14 time];
LABEL_6:
  CMTimeRangeFromTimeToTime(&v18, &start, &end);
  CMTimeRange v15 = v18;
  -[PTCinematographyScript _updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:](self, "_updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:", location, length, v11, v12, v14, &v15);
}

- (void)_updateFramesInTimeRange:(id *)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(PTCinematographyScript *)self frames];
  long long v14 = *(_OWORD *)&a3->var0.var3;
  long long v19 = *(_OWORD *)&a3->var0.var0;
  long long v20 = v14;
  long long v21 = *(_OWORD *)&a3->var1.var1;
  uint64_t v15 = [v13 _indexRangeOfTimeRange:&v19];
  uint64_t v17 = v16;

  long long v18 = *(_OWORD *)&a3->var0.var3;
  long long v19 = *(_OWORD *)&a3->var0.var0;
  long long v20 = v18;
  long long v21 = *(_OWORD *)&a3->var1.var1;
  -[PTCinematographyScript _updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:](self, "_updateFramesInIndexRange:forTransition:fromDetection:toDetection:overTimeRange:", v15, v17, v12, v11, v10, &v19);
}

- (void)_updateFramesInIndexRange:(_NSRange)a3 toFocusOnTrackIdentifier:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v8 = _PTLogSystem();
  NSUInteger v9 = location + length;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long v19 = 134218496;
    *(void *)&v19[4] = location;
    *(_WORD *)&v19[12] = 2048;
    *(void *)&v19[14] = location + length;
    *(_WORD *)&v19[22] = 2048;
    int64_t v20 = a4;
    _os_log_debug_impl(&dword_1D0778000, v8, OS_LOG_TYPE_DEBUG, "updating frames %lu to %lu to focus on track %lu", v19, 0x20u);
  }

  *(_OWORD *)long long v19 = *MEMORY[0x1E4F1FA10];
  *(void *)&v19[16] = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  id v10 = [(PTCinematographyScript *)self _latestDetectionOfTrackIdentifier:a4 atOrBeforeFrameIndex:location timeLimit:v19];
  id v11 = [(PTCinematographyScript *)self focusPuller];
  [v11 reset];

  if (location < v9)
  {
    unint64_t v12 = location;
    do
    {
      id v13 = [(PTCinematographyScript *)self frames];
      long long v14 = [v13 objectAtIndexedSubscript:v12];

      uint64_t v15 = [v14 detectionForTrackIdentifier:a4];
      if (v15)
      {
        if (v10 && location + 1 < v12)
        {
          uint64_t v16 = [[PTCinematographyTransition alloc] initWithKind:1];
          -[PTCinematographyScript _updateFramesInIndexRange:forTransition:fromDetection:toDetection:](self, "_updateFramesInIndexRange:forTransition:fromDetection:toDetection:", location, v12 - location, v16, v10, v15);
        }
        uint64_t v17 = [(PTCinematographyScript *)self focusPuller];
        [v14 focusOnDetection:v15 focusPuller:v17];

        id v18 = v15;
        NSUInteger location = v12;
        id v10 = v18;
      }

      ++v12;
    }
    while (v9 != v12);
  }
  if (location < v9 - 1) {
    -[PTCinematographyScript _updateFramesInIndexRange:toFocusOnDetection:](self, "_updateFramesInIndexRange:toFocusOnDetection:", location, v9 - location, v10);
  }
}

- (void)_updateFramesInIndexRange:(_NSRange)a3 toFocusOnDetection:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  if (location < location + length)
  {
    do
    {
      id v7 = [(PTCinematographyScript *)self frames];
      long long v8 = [v7 objectAtIndexedSubscript:location];

      [v8 focusOnDetection:v9];
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)_updateFramesInIndexRange:(_NSRange)a3 forTransition:(id)a4 fromDetection:(id)a5 toDetection:(id)a6 overTimeRange:(id *)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v14 trackIdentifier];
  uint64_t v17 = [v15 trackIdentifier];
  id v18 = _PTLogSystem();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v16 == v17)
  {
    if (!v19) {
      goto LABEL_5;
    }
    LODWORD(time.value) = 134218496;
    *(CMTimeValue *)((char *)&time.value + 4) = location;
    LOWORD(time.flags) = 2048;
    *(void *)((char *)&time.flags + 2) = length + location - 1;
    HIWORD(time.epoch) = 2048;
    uint64_t v55 = [v14 trackIdentifier];
    int64_t v20 = "updating frames %lu thru %lu to fill in gap in track %lu";
    uint64_t v21 = v18;
    uint32_t v22 = 32;
  }
  else
  {
    if (!v19) {
      goto LABEL_5;
    }
    LODWORD(time.value) = 134218752;
    *(CMTimeValue *)((char *)&time.value + 4) = location;
    LOWORD(time.flags) = 2048;
    *(void *)((char *)&time.flags + 2) = length + location - 1;
    HIWORD(time.epoch) = 2048;
    uint64_t v55 = [v14 trackIdentifier];
    __int16 v56 = 2048;
    uint64_t v57 = [v15 trackIdentifier];
    int64_t v20 = "updating frames %lu thru %lu to rack focus from track %lu to track %lu";
    uint64_t v21 = v18;
    uint32_t v22 = 42;
  }
  _os_log_debug_impl(&dword_1D0778000, v21, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&time, v22);
LABEL_5:

  [v14 focusDistance];
  float v24 = v23;
  [v15 focusDistance];
  float v26 = v25;
  CMTime time = (CMTime)a7->var1;
  *(double *)&long long v27 = CMTimeGetSeconds(&time);
  if (location < location + length)
  {
    float v28 = *(double *)&v27;
    *(void *)&long long v27 = 134218242;
    long long v47 = v27;
    do
    {
      long long v29 = [(PTCinematographyScript *)self frames];
      uint64_t v30 = [v29 objectAtIndexedSubscript:location];

      if (v30) {
        [v30 time];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime time = (CMTime)a7->var0;
      CMTimeSubtract(&v53, &lhs, &time);
      float Seconds = CMTimeGetSeconds(&v53);
      long long v32 = _PTLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(float *)&double v33 = Seconds / v28;
        long long v46 = [NSNumber numberWithFloat:v33];
        LODWORD(time.value) = v47;
        *(CMTimeValue *)((char *)&time.value + 4) = location;
        LOWORD(time.flags) = 2112;
        *(void *)((char *)&time.flags + 2) = v46;
        _os_log_debug_impl(&dword_1D0778000, v32, OS_LOG_TYPE_DEBUG, "frame %lu: normalizedTime: %@", (uint8_t *)&time, 0x16u);
      }
      *(float *)&double v34 = Seconds / v28;
      [v13 coefficientForNormalizedTime:v34];
      float v36 = v35;
      float v37 = (float)(v26 * v35) + (float)((float)(1.0 - v35) * v24);
      uint64_t v38 = [v14 trackIdentifier];
      if (v38 == [v15 trackIdentifier])
      {
        CMTime v44 = (void *)[v14 copy];
        if (v30)
        {
          [v30 time];
        }
        else
        {
          long long v50 = 0uLL;
          uint64_t v51 = 0;
        }
        long long v48 = v50;
        uint64_t v49 = v51;
        [v44 setTime:&v48];
        *(float *)&double v45 = v37;
        [v44 setFocusDistance:v45];
        [v30 focusOnDetection:v44];
      }
      else
      {
        *(float *)&double v39 = v37;
        *(float *)&double v40 = v37;
        *(float *)&double v41 = v36;
        *(float *)&double v42 = Seconds;
        *(float *)&double v43 = v28;
        [v30 _focusFromDetection:v14 toDetection:v15 rawFocusDistance:v39 focusDistance:v40 transitionCoefficient:v41 elapsedTime:v42 duration:v43];
      }

      ++location;
      --length;
    }
    while (length);
  }
}

- (NSArray)trackDecisions
{
  trackDecisions = self->_trackDecisions;
  if (!trackDecisions)
  {
    id v4 = [(PTCinematographyScript *)self _calculateTrackDecisions];
    long long v5 = self->_trackDecisions;
    self->_trackDecisions = v4;

    trackDecisions = self->_trackDecisions;
  }

  return trackDecisions;
}

- (id)_trackDecisionsInTimeRange:(id *)a3
{
  long long v5 = [(PTCinematographyScript *)self trackDecisions];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 _indexRangeOfTimeRange:v13];
  uint64_t v9 = v8;

  if (v9)
  {
    id v10 = [(PTCinematographyScript *)self trackDecisions];
    id v11 = objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)_invalidateTrackDecisions
{
  self->_trackDecisions = 0;
  MEMORY[0x1F41817F8]();
}

- (id)_calculateTrackDecisions
{
  id v3 = objc_opt_new();
  id v4 = [(PTCinematographyScript *)self effectiveDecisions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(PTCinematographyScript *)self effectiveDecisions];
      uint64_t v8 = [v7 objectAtIndexedSubscript:v6];

      if ([v8 isGroupDecision])
      {
        uint64_t v9 = [(PTCinematographyScript *)self effectiveDecisions];
        if (v6 >= [v9 count] - 1)
        {
          id v11 = 0;
        }
        else
        {
          id v10 = [(PTCinematographyScript *)self effectiveDecisions];
          id v11 = [v10 objectAtIndexedSubscript:v6 + 1];
        }
        [(PTCinematographyScript *)self _addGroupDecision:v8 toTrackDecisions:v3 nextDecision:v11];
      }
      else
      {
        [(PTCinematographyScript *)self _addDecision:v8 toTrackDecisions:v3];
      }

      ++v6;
      unint64_t v12 = [(PTCinematographyScript *)self effectiveDecisions];
      unint64_t v13 = [v12 count];
    }
    while (v6 < v13);
  }
  id v14 = (void *)[v3 copy];

  return v14;
}

- (void)_addGroupDecision:(id)a3 toTrackDecisions:(id)a4 nextDecision:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[PTCinematographyScript _existingGroupTrackForGroupIdentifier:](self, "_existingGroupTrackForGroupIdentifier:", [v8 groupIdentifier]);
  long long v24 = 0uLL;
  CMTimeEpoch v25 = 0;
  if (v8) {
    [v8 time];
  }
  memset(&v23, 0, sizeof(v23));
  if (v10)
  {
    [v10 time];
  }
  else
  {
    [(PTCinematographyScript *)self timeRange];
    CMTimeRangeGetEnd(&v23, &range);
  }
  memset(&v21, 0, sizeof(v21));
  *(_OWORD *)&start.start.value = v24;
  start.start.epoch = v25;
  CMTime end = v23;
  CMTimeRangeFromTimeToTime(&v21, &start.start, &end);
  CMTimeRange start = v21;
  unint64_t v12 = [v11 trackDecisionsInTimeRange:&start];
  if (![v12 count]) {
    goto LABEL_14;
  }
  if (v8) {
    [v8 time];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  unint64_t v13 = [v12 objectAtIndexedSubscript:0];
  id v14 = v13;
  if (v13) {
    [v13 time];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  int32_t v15 = CMTimeCompare(&time1, &v17);

  if (v15 < 0)
  {
LABEL_14:
    uint64_t v16 = objc_msgSend(v8, "_decisionByRemovingOptions:", 2, v17.value, *(void *)&v17.timescale, v17.epoch, time1.value, *(void *)&time1.timescale, time1.epoch);
    [(PTCinematographyScript *)self _addDecision:v16 toTrackDecisions:v9];
  }
  -[PTCinematographyScript _addDecisions:toTrackDecisions:](self, "_addDecisions:toTrackDecisions:", v12, v9, v17.value, *(void *)&v17.timescale, v17.epoch);
}

- (void)_addDecision:(id)a3 toTrackDecisions:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 lastObject];
  LODWORD(self) = [(PTCinematographyScript *)self _shouldAddTrackDecision:v8 afterDecision:v7];

  if (self) {
    [v6 addObject:v8];
  }
}

- (void)_addDecisions:(id)a3 toTrackDecisions:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v12 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [v12 objectAtIndexedSubscript:v7];
      id v9 = [v6 lastObject];
      BOOL v10 = [(PTCinematographyScript *)self _shouldAddTrackDecision:v8 afterDecision:v9];

      if (v10) {
        break;
      }
      if (++v7 >= (unint64_t)[v12 count]) {
        goto LABEL_7;
      }
    }
    id v11 = objc_msgSend(v12, "subarrayWithRange:", v7, objc_msgSend(v12, "count") - v7);
    [v6 addObjectsFromArray:v11];
  }
LABEL_7:
}

- (BOOL)_shouldAddTrackDecision:(id)a3 afterDecision:(id)a4
{
  if (!a4) {
    return 1;
  }
  id v5 = a4;
  uint64_t v6 = [a3 trackIdentifier];
  uint64_t v7 = [v5 trackIdentifier];

  return v6 != v7;
}

- (id)_existingGroupTrackForGroupIdentifier:(int64_t)a3
{
  id v3 = [(PTCinematographyScript *)self trackForGroupIdentifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)decisionAfterTime:(id *)a3
{
  id v5 = [(PTCinematographyScript *)self effectiveDecisions];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = [(PTCinematographyScript *)self effectiveDecisions];
  CMTime time2 = (CMTime)*a3;
  uint64_t v8 = [v7 _indexNearestTime:&time2];

  id v9 = [(PTCinematographyScript *)self effectiveDecisions];
  BOOL v10 = [v9 objectAtIndexedSubscript:v8];
  id v11 = v10;
  if (v10) {
    [v10 time];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime time2 = (CMTime)*a3;
  int32_t v12 = CMTimeCompare(&time1, &time2);

  unint64_t v13 = v12 >= 1 ? v8 : v8 + 1;
  id v14 = [(PTCinematographyScript *)self effectiveDecisions];
  unint64_t v15 = [v14 count];

  if (v13 < v15)
  {
    uint64_t v16 = [(PTCinematographyScript *)self effectiveDecisions];
    CMTime v17 = [v16 objectAtIndexedSubscript:v13];
  }
  else
  {
LABEL_10:
    CMTime v17 = 0;
  }

  return v17;
}

- (id)decisionBeforeTime:(id *)a3
{
  id v5 = [(PTCinematographyScript *)self effectiveDecisions];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = [(PTCinematographyScript *)self effectiveDecisions];
  CMTime time2 = (CMTime)*a3;
  uint64_t v8 = [v7 _indexNearestTime:&time2];

  id v9 = [(PTCinematographyScript *)self effectiveDecisions];
  BOOL v10 = [v9 objectAtIndexedSubscript:v8];
  id v11 = v10;
  if (v10) {
    [v10 time];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime time2 = (CMTime)*a3;
  int32_t v12 = CMTimeCompare(&time1, &time2);

  uint64_t v13 = v8 - (v12 >= 0);
  if (v13 >= 0)
  {
    id v14 = [(PTCinematographyScript *)self effectiveDecisions];
    unint64_t v15 = [v14 objectAtIndexedSubscript:v13];
  }
  else
  {
LABEL_7:
    unint64_t v15 = 0;
  }

  return v15;
}

- (id)decisionNearestTime:(id *)a3
{
  id v5 = [(PTCinematographyScript *)self effectiveDecisions];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  unint64_t v6 = [v5 _indexNearestTime:&v12];

  uint64_t v7 = [(PTCinematographyScript *)self effectiveDecisions];
  unint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    BOOL v10 = 0;
  }
  else
  {
    id v9 = [(PTCinematographyScript *)self effectiveDecisions];
    BOOL v10 = [v9 objectAtIndexedSubscript:v6];
  }

  return v10;
}

- (id)decisionsInTimeRange:(id *)a3
{
  id v5 = [(PTCinematographyScript *)self effectiveDecisions];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 _indexRangeOfTimeRange:v13];
  uint64_t v9 = v8;

  if (v9)
  {
    BOOL v10 = [(PTCinematographyScript *)self effectiveDecisions];
    id v11 = objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)primaryDecisionAtTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  id v3 = [(PTCinematographyScript *)self decisionAtOrBeforeTime:&v5];

  return v3;
}

- (id)secondaryDecisionAtTime:(id *)a3
{
  long long v9 = *(_OWORD *)&a3->var0;
  *(void *)&long long v10 = a3->var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(PTCinematographyScript *)self decisionAfterTime:&v9];
  if (v5)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    [(PTCinematographyScript *)self timeRangeOfTransitionBeforeDecision:v5];
    CMTime time1 = (CMTime)*a3;
    *(_OWORD *)&v7.value = v9;
    v7.epoch = v10;
    if (CMTimeCompare(&time1, &v7) <= 0)
    {

      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = 0;
    }
  }

  return v5;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeOfTransitionAfterDecision:(SEL)a3
{
  id v5 = a4;
  long long v6 = v5;
  if (v5) {
    [v5 time];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  CMTime v7 = [(PTCinematographyScript *)self decisionAfterTime:v9];
  [(PTCinematographyScript *)self _timeRangeOfTransitionfromDecision:v6 toDecision:v7];

  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeOfTransitionBeforeDecision:(SEL)a3
{
  id v5 = a4;
  long long v6 = v5;
  if (v5) {
    [v5 time];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  CMTime v7 = [(PTCinematographyScript *)self decisionBeforeTime:v9];
  [(PTCinematographyScript *)self _timeRangeOfTransitionfromDecision:v7 toDecision:v6];

  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)_timeRangeOfTransitionfromDecision:(SEL)a3 toDecision:(id)a4
{
  return [(PTCinematographyScript *)self _timeRangeOfTransitionfromDecision:a4 toDecision:a5 didShortenTransition:0];
}

- ($69C59A32909E13F94AB58097350E6BB9)_timeRangeOfTransitionfromDecision:(SEL)a3 toDecision:(id)a4 didShortenTransition:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = v11;
  LOBYTE(v13) = 0;
  uint64_t v14 = MEMORY[0x1E4F1FA30];
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA30];
  *(_OWORD *)&retstr->var0.int64_t var3 = v15;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v14 + 32);
  if (v10 && v11)
  {
    memset(&v30[24], 0, 24);
    if ([(PTCinematographyScript *)self _useFixedTransition])
    {
      [(PTCinematographyScript *)self _startTimeOfFixedTransitionToDecision:v12];
    }
    else
    {
      uint64_t v16 = [[PTCinematographyFocusFrames alloc] initWithFrames:self->_frames options:self->_focusFramesOptions];
      CMTime v17 = [(PTCinematographyScript *)self frames];
      [v12 time];
      uint64_t v18 = [v17 _indexNearestTime:v30];

      uint64_t v19 = [(PTCinematographyFocusFrames *)v16 startIndexForLinearRackFocusPullToFrameAtIndex:v18];
      int64_t v20 = [(PTCinematographyScript *)self frames];
      CMTimeRange v21 = [v20 objectAtIndexedSubscript:v19];
      uint32_t v22 = v21;
      if (v21) {
        [v21 time];
      }
      else {
        memset(&time1, 0, 24);
      }
      *(CMTime *)&v30[24] = time1.start;
    }
    [v10 time];
    time1.CMTimeRange start = *(CMTime *)&v30[24];
    unsigned int v23 = CMTimeCompare(&time1.start, &time2);
    BOOL v13 = v23 >> 31;
    if ((v23 & 0x80000000) != 0)
    {
      [v10 time];
      *(CMTime *)&v30[24] = time1.start;
    }
    [v12 time];
    CMTime v26 = *(CMTime *)&v30[24];
    CMTimeRangeFromTimeToTime(&time1, &v26, &end);
    long long v24 = *(_OWORD *)&time1.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time1.start.value;
    *(_OWORD *)&retstr->var0.int64_t var3 = v24;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time1.duration.timescale;
  }
  if (a6) {
    *a6 = v13;
  }

  return result;
}

- (BOOL)_useFixedTransition
{
  id v3 = [(PTCinematographyScript *)self focusFramesOptions];
  id v4 = v3;
  if (v3) {
    [v3 minimumRackFocusPullTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  id v5 = [(PTCinematographyScript *)self focusFramesOptions];
  long long v6 = v5;
  if (v5) {
    [v5 maximumRackFocusPullTime];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  BOOL v7 = CMTimeCompare(&time1, &v9) == 0;

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_startTimeOfFixedTransitionToDecision:(SEL)a3
{
  id v6 = a4;
  memset(&v12, 0, sizeof(v12));
  BOOL v7 = [(PTCinematographyScript *)self focusFramesOptions];
  uint64_t v8 = v7;
  if (v7) {
    [v7 minimumRackFocusPullTime];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }

  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  if (v6) {
    [v6 time];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  CMTime v10 = v12;
  CMTimeSubtract((CMTime *)retstr, &lhs, &v10);

  return result;
}

- (id)decisionAtOrBeforeTime:(id *)a3
{
  id v5 = [(PTCinematographyScript *)self effectiveDecisions];
  uint64_t v6 = [v5 count];

  if (v6
    && ([(PTCinematographyScript *)self effectiveDecisions],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        long long v12 = *(_OWORD *)&a3->var0,
        int64_t var3 = a3->var3,
        uint64_t v8 = [v7 _indexAtOrBeforeTime:&v12],
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    CMTime v10 = [(PTCinematographyScript *)self effectiveDecisions];
    CMTime v9 = [v10 objectAtIndexedSubscript:v8];
  }
  else
  {
    CMTime v9 = 0;
  }

  return v9;
}

- (id)userDecisionsInTimeRange:(id *)a3
{
  id v5 = [(PTCinematographyScript *)self userDecisions];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 _indexRangeOfTimeRange:v13];
  uint64_t v9 = v8;

  if (v9)
  {
    CMTime v10 = [(PTCinematographyScript *)self userDecisions];
    id v11 = objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)baseDecisionsInTimeRange:(id *)a3
{
  id v5 = [(PTCinematographyScript *)self baseDecisions];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 _indexRangeOfTimeRange:v13];
  uint64_t v9 = v8;

  if (v9)
  {
    CMTime v10 = [(PTCinematographyScript *)self baseDecisions];
    id v11 = objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)_internalizeBaseDecisionsFromFrames:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CMTimeEpoch v25 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    long long v24 = self;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v29;
    int v9 = 1;
    uint64_t v10 = -1;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        int v12 = v9;
        BOOL v13 = v7;
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
        int v9 = [v14 isInTransition];
        uint64_t v15 = [v14 focusTrackIdentifier];
        uint64_t v16 = [v14 baseFocusTrackNumber];
        uint64_t v7 = v16;
        if (v16)
        {
          if (v13)
          {
            uint64_t v10 = v15;
            if ([v16 isEqualToNumber:v13]) {
              goto LABEL_22;
            }
          }
          uint64_t v10 = [v7 integerValue];
        }
        else
        {
          BOOL v17 = v15 != v10;
          if (v9)
          {
            uint64_t v10 = v15;
            goto LABEL_22;
          }
          uint64_t v10 = v15;
          if (((v12 | v17) & 1) == 0) {
            goto LABEL_22;
          }
        }
        uint64_t v18 = [v14 detectionForTrackNumber:v7];
        if (v18)
        {
          uint64_t v19 = [PTCinematographyDecision alloc];
          if (v14) {
            [v14 time];
          }
          else {
            memset(v27, 0, sizeof(v27));
          }
          int64_t v20 = [(PTCinematographyDecision *)v19 initWithTime:v27 trackIdentifier:v10];
          [v20 setType:0];
          -[NSObject setGroupIdentifier:](v20, "setGroupIdentifier:", [v18 groupIdentifier]);
          CMTimeRange v21 = _PTLogSystem();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)CMTime buf = 138412290;
            double v33 = v20;
            _os_log_debug_impl(&dword_1D0778000, v21, OS_LOG_TYPE_DEBUG, "internalizing base decision %@", buf, 0xCu);
          }

          [v25 addObject:v20];
        }
        else
        {
          int64_t v20 = _PTLogSystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 138412546;
            double v33 = v7;
            __int16 v34 = 2112;
            float v35 = v14;
            _os_log_error_impl(&dword_1D0778000, v20, OS_LOG_TYPE_ERROR, "baseFocusTrackNumber %@ has no corresponding detection on frame %@. No base decision was added.", buf, 0x16u);
          }
        }

LABEL_22:
        ++v11;
      }
      while (v6 != v11);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      uint64_t v6 = v22;
      if (!v22)
      {

        self = v24;
        break;
      }
    }
  }

  unsigned int v23 = (void *)[v25 copy];
  [(PTCinematographyScript *)self setBaseDecisions:v23];
}

- (NSArray)tracks
{
  uint64_t v2 = [(PTCinematographyScript *)self mutableTracks];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (id)trackForIdentifier:(int64_t)a3
{
  trackForNumber = self->_trackForNumber;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)trackForNumber objectForKeyedSubscript:v4];

  return v5;
}

- (id)trackForGroupIdentifier:(int64_t)a3
{
  trackForGroupNumber = self->_trackForGroupNumber;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)trackForGroupNumber objectForKeyedSubscript:v4];

  return v5;
}

- (id)trackForDecision:(id)a3
{
  id v4 = a3;
  if ([v4 isGroupDecision])
  {
    uint64_t v5 = [v4 groupIdentifier];

    [(PTCinematographyScript *)self trackForGroupIdentifier:v5];
  }
  else
  {
    uint64_t v7 = [v4 trackIdentifier];

    [(PTCinematographyScript *)self trackForIdentifier:v7];
  uint64_t v6 = };

  return v6;
}

- (int64_t)_trackAllocatorState
{
  return [(PTCinematographyTrackAllocator *)self->_trackAllocator trackIdentifier];
}

- (id)_userCreatedTracks
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PTCinematographyScript *)self mutableTracks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isUserCreated]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (void)_reloadTrackAllocator
{
  self->_trackAllocator = [[PTCinematographyTrackAllocator alloc] initWithTrackIdentifier:self->_loadedTrackAllocatorState];

  MEMORY[0x1F41817F8]();
}

- (void)_internalizeTracksFromFrames:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v10 = objc_msgSend(v9, "allDetections", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * j);
              id v16 = [(PTCinematographyScript *)self _internalizeTrackForDetection:v15];
              id v17 = [(PTCinematographyScript *)self _internalizeGroupTrackForDetection:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
  self->_loadedTrackAllocatorState = [(PTCinematographyTrackAllocator *)self->_trackAllocator trackIdentifier];
  self->_didInternalizeTracks = 1;
}

- (void)_internalizeTracksFromChangesDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"user_tracks"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [[PTCinematographyTrack alloc] _initWithCinematographyDictionary:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        -[PTCinematographyScript _addTrack:identifier:](self, "_addTrack:identifier:", v10, [v10 trackIdentifier]);
        [(PTCinematographyScript *)self _internalizeDetectionsFromTrack:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  uint64_t v11 = [v4 objectForKeyedSubscript:@"track_allocator"];
  if (v11)
  {
    uint64_t v12 = [[PTCinematographyTrackAllocator alloc] _initWithCinematographyDictionary:v11];
    trackAllocator = self->_trackAllocator;
    self->_trackAllocator = v12;
  }
}

- (void)_internalizeDetectionsFromTrack:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PTCinematographyScript *)self _addDetectionsFromCustomTrack:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PTCinematographyScript *)self _addDetectionsFromFixedFocusTrack:v4];
    }
    else
    {
      uint64_t v5 = _PTLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [v4 debugTrackIdentifierString];
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1D0778000, v5, OS_LOG_TYPE_DEFAULT, "warning: unable to add detections from non-custom track %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (id)_internalizeTrackForDetection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 trackNumber];

  if (v5)
  {
LABEL_6:
    id v10 = [(PTCinematographyScript *)self _internalizeTrackWithNumberFromDetection:v4];
    goto LABEL_7;
  }
  uint64_t v6 = [v4 focusIdentifier];
  int v7 = _PTLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      -[PTCinematographyScript _internalizeTrackForDetection:]();
    }

    uint64_t v9 = [(PTCinematographyScript *)self _internalizeTrackNumberForFocusIdentifier:v6];
    [v4 setTrackNumber:v9];

    goto LABEL_6;
  }
  if (v8) {
    -[PTCinematographyScript _internalizeTrackForDetection:]();
  }

  id v10 = 0;
LABEL_7:

  return v10;
}

- (id)_internalizeGroupTrackForDetection:(id)a3
{
  id v4 = a3;
  if (PTGroupIDIsInvalid([v4 groupIdentifier]))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(PTCinematographyScript *)self _internalizeTrackWithGroupNumberFromDetection:v4];
  }

  return v5;
}

- (id)_internalizeTrackWithNumberFromDetection:(id)a3
{
  id v4 = a3;
  trackForNumber = self->_trackForNumber;
  uint64_t v6 = [v4 trackNumber];
  int v7 = [(NSMutableDictionary *)trackForNumber objectForKeyedSubscript:v6];

  if (!v7)
  {
    if ([v4 isFixedFocusDetection])
    {
      int v7 = [[PTCinematographyFixedFocusTrack alloc] initWithDetection:v4];
      [(PTCinematographyTrack *)v7 setUserCreated:0];
    }
    else
    {
      int v7 = -[PTCinematographyExistingTrack initWithDetectionType:trackIdentifier:groupIdentifier:]([PTCinematographyExistingTrack alloc], "initWithDetectionType:trackIdentifier:groupIdentifier:", [v4 detectionType], objc_msgSend(v4, "trackIdentifier"), objc_msgSend(v4, "groupIdentifier"));
    }
    -[PTCinematographyScript _addTrack:identifier:](self, "_addTrack:identifier:", v7, [v4 trackIdentifier]);
  }

  return v7;
}

- (id)_internalizeTrackWithGroupNumberFromDetection:(id)a3
{
  id v4 = a3;
  -[PTCinematographyScript trackForGroupIdentifier:](self, "trackForGroupIdentifier:", [v4 groupIdentifier]);
  uint64_t v5 = (PTCinematographyExistingGroupTrack *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v5 = -[PTCinematographyExistingGroupTrack initWithDetectionType:groupIdentifier:]([PTCinematographyExistingGroupTrack alloc], "initWithDetectionType:groupIdentifier:", PTDetectionTypeParent([v4 detectionType]), objc_msgSend(v4, "groupIdentifier"));
    [(PTCinematographyScript *)self _addGroupTrack:v5];
  }

  return v5;
}

- (id)_internalizeTrackNumberForFocusIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_trackNumberForFocusIdentifier objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v6 = [(PTCinematographyScript *)self trackAllocatorForFocusIdentifier];
    uint64_t v7 = [v6 nextTrackIdentifier];

    uint64_t v5 = [NSNumber numberWithInteger:v7];
    [(NSMutableDictionary *)self->_trackNumberForFocusIdentifier setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void)setFramesAreMutable:(BOOL)a3
{
  if (self->_framesAreMutable != a3)
  {
    frames = self->_frames;
    if (a3) {
      uint64_t v6 = (NSArray *)[(NSArray *)frames mutableCopy];
    }
    else {
      uint64_t v6 = (NSArray *)[(NSArray *)frames copy];
    }
    uint64_t v7 = self->_frames;
    self->_frames = v6;

    self->_framesAreMutable = a3;
  }
}

- (void)addFrame:(id)a3
{
  id v4 = a3;
  [(PTCinematographyScript *)self setFramesAreMutable:1];
  [(NSArray *)self->_frames addObject:v4];
}

- (void)setBaseDecisionsAreMutable:(BOOL)a3
{
  if (self->_baseDecisionsAreMutable != a3)
  {
    baseDecisions = self->_baseDecisions;
    if (a3) {
      uint64_t v6 = (NSArray *)[(NSArray *)baseDecisions mutableCopy];
    }
    else {
      uint64_t v6 = (NSArray *)[(NSArray *)baseDecisions copy];
    }
    uint64_t v7 = self->_baseDecisions;
    self->_baseDecisions = v6;

    self->_baseDecisionsAreMutable = a3;
  }
}

- (void)addBaseDecision:(id)a3
{
  id v4 = a3;
  [v4 setType:0];
  [(PTCinematographyScript *)self setBaseDecisionsAreMutable:1];
  [(NSArray *)self->_baseDecisions addObject:v4];
}

- (BOOL)focusOnTrackIdentifier:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  if ((a4->var2 & 0x1D) != 1)
  {
    uint64_t v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyScript focusOnTrackIdentifier:atTime:strong:]((uint64_t)a4);
    }
    goto LABEL_8;
  }
  BOOL v6 = a5;
  uint64_t v9 = -[PTCinematographyScript trackForIdentifier:](self, "trackForIdentifier:");

  if (!v9)
  {
    uint64_t v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyScript focusOnTrackIdentifier:atTime:strong:]();
    }
LABEL_8:
    BOOL v13 = 0;
    goto LABEL_9;
  }
  id v10 = [PTCinematographyDecision alloc];
  long long v15 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  uint64_t v11 = [(PTCinematographyDecision *)v10 initWithTime:&v15 trackIdentifier:a3 options:v6];
  uint64_t v12 = [(PTCinematographyScript *)self trackForIdentifier:a3];
  -[NSObject setGroupIdentifier:](v11, "setGroupIdentifier:", [v12 groupIdentifier]);

  BOOL v13 = [(PTCinematographyScript *)self addUserDecision:v11];
LABEL_9:

  return v13;
}

- (BOOL)focusOnGroupIdentifier:(int64_t)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  if ((a4->var2 & 0x1D) == 1)
  {
    uint64_t v8 = a5 | 2;
    uint64_t v9 = [PTCinematographyDecision alloc];
    long long v13 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    id v10 = [(PTCinematographyDecision *)v9 initWithTime:&v13 groupIdentifier:a3 options:v8];
    BOOL v11 = [(PTCinematographyScript *)self addUserDecision:v10];
  }
  else
  {
    id v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyScript focusOnGroupIdentifier:atTime:strong:]((uint64_t)a4);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)focusOnDetection:(id)a3 strong:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 trackIdentifier];
  if (v6) {
    [v6 time];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  BOOL v8 = [(PTCinematographyScript *)self focusOnTrackIdentifier:v7 atTime:v10 strong:v4];

  return v8;
}

- (BOOL)focusOnTrack:(id)a3 atTime:(id *)a4 strong:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [a3 trackIdentifier];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  return [(PTCinematographyScript *)self focusOnTrackIdentifier:v8 atTime:&v10 strong:v5];
}

- (id)_bestDetectionForGroupIdentifier:(int64_t)a3 time:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  BOOL v5 = [(PTCinematographyScript *)self frameNearestTime:&v8];
  id v6 = [v5 bestDetectionForGroupIdentifier:a3];

  return v6;
}

- (BOOL)addUserDecision:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _PTLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CMTime buf = 138412290;
    id v30 = v4;
    _os_log_impl(&dword_1D0778000, v5, OS_LOG_TYPE_INFO, "adding user decision %@", buf, 0xCu);
  }

  [v4 setType:1];
  BOOL v6 = [(PTCinematographyScript *)self _resolveIfGroupDecision:v4];
  if (v6)
  {
    uint64_t v7 = [(PTCinematographyScript *)self userDecisions];
    if (![v7 count])
    {

      goto LABEL_17;
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(PTCinematographyScript *)self userDecisions];
    uint64_t v9 = [v8 lastObject];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = v9;
    if (v9)
    {
      [v9 time];
      if (v4)
      {
LABEL_7:
        [v4 time];
        goto LABEL_14;
      }
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      if (v4) {
        goto LABEL_7;
      }
    }
    memset(&time2, 0, sizeof(time2));
LABEL_14:
    int32_t v12 = CMTimeCompare(&time1, &time2);

    if ((v12 & 0x80000000) == 0)
    {
      long long v13 = [(PTCinematographyScript *)self userDecisions];
      if (v4) {
        [v4 time];
      }
      else {
        memset(v26, 0, sizeof(v26));
      }
      uint64_t v15 = [v13 _firstIndexAtOrAfterTime:v26];

      long long v16 = [(PTCinematographyScript *)self userDecisions];
      long long v17 = [v16 objectAtIndexedSubscript:v15];
      long long v18 = v17;
      if (v17)
      {
        [v17 time];
        if (v4)
        {
LABEL_21:
          [v4 time];
LABEL_24:
          int32_t v19 = CMTimeCompare(&v25, &v24);

          if (!v19)
          {
            long long v20 = [(PTCinematographyScript *)self userDecisions];
            long long v21 = [v20 objectAtIndexedSubscript:v15];
            [(PTCinematographyScript *)self _removeUserDecision:v21];
          }
          long long v14 = [(PTCinematographyScript *)self userDecisions];
          [v14 insertObject:v4 atIndex:v15];
          goto LABEL_27;
        }
      }
      else
      {
        memset(&v25, 0, sizeof(v25));
        if (v4) {
          goto LABEL_21;
        }
      }
      memset(&v24, 0, sizeof(v24));
      goto LABEL_24;
    }
LABEL_17:
    long long v14 = [(PTCinematographyScript *)self userDecisions];
    [v14 addObject:v4];
LABEL_27:

    [(PTCinematographyScript *)self timeRange];
    [(PTCinematographyScript *)self _updateDecisionsAndFramesInTimeRange:v23];
    goto LABEL_28;
  }
  BOOL v11 = _PTLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[PTCinematographyScript addUserDecision:]();
  }

LABEL_28:
  return v6;
}

- (BOOL)removeUserDecision:(id)a3
{
  BOOL v4 = [(PTCinematographyScript *)self _removeUserDecision:a3];
  if (v4)
  {
    [(PTCinematographyScript *)self timeRange];
    [(PTCinematographyScript *)self _updateDecisionsAndFramesInTimeRange:&v6];
  }
  return v4;
}

- (BOOL)removeAllUserDecisions
{
  id v3 = _PTLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  BOOL v5 = _PTLogSystem();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PTCinematographyScript removeAllUserDecisions](self);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_1D0778000, v6, OS_LOG_TYPE_INFO, "removing all user decisions", buf, 2u);
  }

  uint64_t v7 = [(PTCinematographyScript *)self userDecisions];
  [v7 removeAllObjects];

  [(PTCinematographyScript *)self timeRange];
  [(PTCinematographyScript *)self _updateDecisionsAndFramesInTimeRange:&v9];
  return 1;
}

- (BOOL)_removeUserDecision:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _PTLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CMTime buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1D0778000, v5, OS_LOG_TYPE_INFO, "removing user decision %@", buf, 0xCu);
  }

  if (([v4 isUserDecision] & 1) == 0)
  {
    uint64_t v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyScript _removeUserDecision:]();
    }
    goto LABEL_15;
  }
  uint64_t v6 = [(PTCinematographyScript *)self userDecisions];
  if (v4) {
    [v4 time];
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  unint64_t v8 = [v6 _indexNearestTime:v15];

  uint64_t v9 = [(PTCinematographyScript *)self userDecisions];
  if (v8 >= [v9 count])
  {

LABEL_13:
    uint64_t v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyScript _removeUserDecision:]();
    }
LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(PTCinematographyScript *)self userDecisions];
  BOOL v11 = [v10 objectAtIndexedSubscript:v8];
  char v12 = [v11 isEqual:v4];

  if ((v12 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v7 = [(PTCinematographyScript *)self userDecisions];
  [v7 removeObjectAtIndex:v8];
  BOOL v13 = 1;
LABEL_16:

  return v13;
}

- (BOOL)_resolveIfGroupDecision:(id)a3
{
  id v4 = a3;
  if (![v4 isGroupDecision]
    || ([v4 trackIdentifier] & 0x8000000000000000) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v5 = [v4 groupIdentifier];
  if (v4) {
    [v4 time];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  uint64_t v6 = [(PTCinematographyScript *)self _bestDetectionForGroupIdentifier:v5 time:v9];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_msgSend(v4, "setTrackIdentifier:", objc_msgSend(v6, "trackIdentifier"));

LABEL_8:
    LOBYTE(v7) = 1;
  }

  return (char)v7;
}

- (void)_updateDecisionsAndFramesInTimeRange:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var0.var3;
  long long v10 = *(_OWORD *)&a3->var0.var0;
  long long v11 = v5;
  long long v12 = *(_OWORD *)&a3->var1.var1;
  [(PTCinematographyScript *)self _updateEffectiveDecisionsInTimeRange:&v10];
  uint64_t v6 = [(PTCinematographyScript *)self trackDecisions];
  long long v7 = *(_OWORD *)&a3->var0.var3;
  long long v10 = *(_OWORD *)&a3->var0.var0;
  long long v11 = v7;
  long long v12 = *(_OWORD *)&a3->var1.var1;
  [(PTCinematographyScript *)self _updateFramesForDecisions:v6 timeRange:&v10];

  [(PTCinematographyScript *)self timeRange];
  [(PTCinematographyScript *)self _notifyDelegateOfChangesToDecisionsInTimeRange:v9];
  [(PTCinematographyScript *)self timeRange];
  [(PTCinematographyScript *)self _notifyDelegateOfChangesToFramesInTimeRange:&v8];
}

- (void)_updateEffectiveDecisionsInTimeRange:(id *)a3
{
  long long v5 = [(PTCinematographyScript *)self baseDecisions];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  uint64_t v7 = [v5 _indexRangeOfTimeRange:&range];
  uint64_t v9 = v8;

  long long v10 = [(PTCinematographyScript *)self userDecisions];
  long long v11 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v11;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  uint64_t v12 = [v10 _indexRangeOfTimeRange:&range];
  uint64_t v14 = v13;

  uint64_t v15 = [(PTCinematographyScript *)self effectiveDecisions];
  long long v16 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v16;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  uint64_t v17 = [v15 _indexRangeOfTimeRange:&range];
  uint64_t v19 = v18;

  long long v20 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v20;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v23, &range);
  long long v21 = -[PTCinematographyScript _effectiveDecisionsFromBaseDecisionsRange:userDecisionsRange:endTime:](self, "_effectiveDecisionsFromBaseDecisionsRange:userDecisionsRange:endTime:", v7, v9, v12, v14, &v23);
  long long v22 = [(PTCinematographyScript *)self effectiveDecisions];
  objc_msgSend(v22, "replaceObjectsInRange:withObjectsFromArray:", v17, v19, v21);

  [(PTCinematographyScript *)self _invalidateTrackDecisions];
}

- (id)_effectiveDecisionsFromBaseDecisionsRange:(_NSRange)a3 userDecisionsRange:(_NSRange)a4 endTime:(id *)a5
{
  uint64_t v7 = -[PTCinematographyScript _zipBaseDecisionsRange:userDecisionsRange:](self, "_zipBaseDecisionsRange:userDecisionsRange:", a3.location, a3.length, a4.location, a4.length);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  uint64_t v8 = [(PTCinematographyScript *)self _effectiveDecisionsFromZippedDecisions:v7 endTime:&v10];

  return v8;
}

- (id)_zipBaseDecisionsRange:(_NSRange)a3 userDecisionsRange:(_NSRange)a4
{
  NSUInteger location = a4.location;
  NSUInteger v5 = a3.location;
  NSUInteger v7 = a3.location + a3.length;
  NSUInteger v8 = a4.location + a4.length;
  uint64_t v9 = objc_opt_new();
  while (v5 < v7 && location < v8)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(PTCinematographyScript *)self baseDecisions];
    long long v11 = [v10 objectAtIndexedSubscript:v5];

    uint64_t v12 = [(PTCinematographyScript *)self userDecisions];
    uint64_t v13 = [v12 objectAtIndexedSubscript:location];

    if (v13)
    {
      [v13 time];
      if (v11) {
        goto LABEL_6;
      }
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      if (v11)
      {
LABEL_6:
        objc_msgSend(v11, "time", v22.value, *(void *)&v22.timescale, v22.epoch, time1.value, *(void *)&time1.timescale, time1.epoch);
        goto LABEL_9;
      }
    }
    memset(&v22, 0, sizeof(v22));
LABEL_9:
    if (CMTimeCompare(&time1, &v22) <= 0)
    {
      [v9 addObject:v13];
      ++location;
    }
    else
    {
      [v9 addObject:v11];
      ++v5;
    }
  }
  if (location < v8)
  {
    do
    {
      uint64_t v14 = [(PTCinematographyScript *)self userDecisions];
      NSUInteger v15 = location + 1;
      long long v16 = [v14 objectAtIndexedSubscript:location];
      [v9 addObject:v16];

      NSUInteger location = v15;
    }
    while (v8 != v15);
  }
  if (v5 < v7)
  {
    do
    {
      uint64_t v17 = [(PTCinematographyScript *)self baseDecisions];
      NSUInteger v18 = v5 + 1;
      uint64_t v19 = [v17 objectAtIndexedSubscript:v5];
      [v9 addObject:v19];

      NSUInteger v5 = v18;
    }
    while (v7 != v18);
  }
  long long v20 = objc_msgSend(v9, "copy", v22.value, *(void *)&v22.timescale, v22.epoch);

  return v20;
}

- (id)_effectiveDecisionsFromZippedDecisions:(id)a3 endTime:(id *)a4
{
  id v6 = a3;
  memset(&v38, 0, sizeof(v38));
  NSUInteger v7 = objc_opt_class();
  if (v7) {
    [v7 defaultMinimumUserFocusDuration];
  }
  else {
    memset(&v38, 0, sizeof(v38));
  }
  NSUInteger v8 = objc_opt_new();
  *(_OWORD *)&v37.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v37.epoch = v9;
  long long v24 = *(_OWORD *)&v37.value;
  *(_OWORD *)&v36.value = *(_OWORD *)&v37.value;
  v36.epoch = v9;
  if (![v6 count])
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = 0;
    id v11 = 0;
    goto LABEL_46;
  }
  CMTime v23 = (CMTime *)a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = 0;
  id v11 = 0;
  unint64_t v12 = 0;
  do
  {
    uint64_t v13 = [v6 objectAtIndexedSubscript:v12];
    uint64_t v14 = v13;
    if (!v10 || !v11) {
      goto LABEL_12;
    }
    if (v13) {
      [v13 time];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = v37;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTime time1 = v37;
      NSUInteger v18 = [v10 _decisionByChangingTime:&time1];
      [v8 addObject:v18];

      *(_OWORD *)&v37.value = v24;
      v37.epoch = v9;
      *(_OWORD *)&v36.value = v24;
      v36.epoch = v9;

      id v11 = 0;
      if (![v14 isUserDecision]) {
        goto LABEL_38;
      }
    }
    else
    {
LABEL_12:
      if (([v14 isUserDecision] & 1) == 0)
      {
        if (!v11) {
          goto LABEL_38;
        }
        if (([v11 isStrongDecision] & 1) == 0)
        {
          if (v14) {
            [v14 time];
          }
          else {
            memset(&v25, 0, sizeof(v25));
          }
          CMTime time1 = v36;
          if ((CMTimeCompare(&v25, &time1) & 0x80000000) == 0)
          {
LABEL_38:
            [v8 addObject:v14];

            id v11 = 0;
            *(_OWORD *)&v37.value = v24;
            v37.epoch = v9;
            *(_OWORD *)&v36.value = v24;
            v36.epoch = v9;
          }
        }
        id v19 = v14;

        $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = v19;
        goto LABEL_40;
      }
    }
    NSUInteger v15 = v11;
    [v8 addObject:v14];
    id v11 = v14;

    uint64_t v16 = [(PTCinematographyScript *)self trackForDecision:v11];
    uint64_t v17 = (void *)v16;
    if (v11)
    {
      [v11 time];
      if (v17) {
        goto LABEL_15;
      }
    }
    else
    {
      memset(v33, 0, sizeof(v33));
      if (v16)
      {
LABEL_15:
        [v17 timeRangeEndForTime:v33];
        goto LABEL_22;
      }
    }
    memset(&time1, 0, sizeof(time1));
LABEL_22:
    CMTime v37 = time1;

    memset(&time1, 0, sizeof(time1));
    if ([v11 hasMinimumDuration])
    {
      if (v11)
      {
        [v11 minimumDuration];
LABEL_26:
        [v11 time];
        goto LABEL_31;
      }
      memset(&time1, 0, sizeof(time1));
    }
    else
    {
      CMTime time1 = v38;
      if (v11) {
        goto LABEL_26;
      }
    }
    memset(&lhs, 0, sizeof(lhs));
LABEL_31:
    CMTime rhs = time1;
    CMTimeAdd(&v36, &lhs, &rhs);
    if ([v11 hasMaximumDuration])
    {
      memset(&rhs, 0, sizeof(rhs));
      if (v11)
      {
        [v11 time];
        [v11 maximumDuration];
      }
      else
      {
        memset(&v30, 0, sizeof(v30));
        memset(&v29, 0, sizeof(v29));
      }
      CMTimeAdd(&rhs, &v30, &v29);
      CMTime v28 = v37;
      CMTime v27 = rhs;
      CMTimeMinimum(&v37, &v28, &v27);
      CMTime v27 = v36;
      CMTime v26 = rhs;
      CMTimeMinimum(&v28, &v27, &v26);
      CMTime v36 = v28;
    }
LABEL_40:

    ++v12;
  }
  while (v12 < [v6 count]);
  if (v10)
  {
    if (v11)
    {
      CMTime time1 = v37;
      CMTime rhs = *v23;
      if (CMTimeCompare(&time1, &rhs) < 0)
      {
        CMTime time1 = v37;
        long long v20 = [v10 _decisionByChangingTime:&time1];
        [v8 addObject:v20];
      }
    }
  }
LABEL_46:
  long long v21 = (void *)[v8 copy];

  return v21;
}

- (BOOL)addTrack:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isUserCreated])
  {
    NSUInteger v5 = [v4 script];

    if (v5 == self)
    {
      CMTimeEpoch v9 = _PTLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v4 debugTrackIdentifierString];
        int v13 = 138412290;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1D0778000, v9, OS_LOG_TYPE_INFO, "track %@ already added", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      id v6 = [v4 script];

      if (v6)
      {
        NSUInteger v7 = _PTLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[PTCinematographyScript addTrack:](v4);
        }

        goto LABEL_7;
      }
      id v11 = [(PTCinematographyScript *)self trackAllocator];
      -[PTCinematographyScript _addTrack:identifier:](self, "_addTrack:identifier:", v4, [v11 nextTrackIdentifier]);

      [(PTCinematographyScript *)self _internalizeDetectionsFromTrack:v4];
    }
    BOOL v8 = 1;
    goto LABEL_13;
  }
LABEL_7:
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)removeTrack:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isUserCreated])
  {
    NSUInteger v5 = [v4 script];

    if (v5)
    {
      id v6 = [v4 script];

      if (v6 != self)
      {
        NSUInteger v7 = _PTLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[PTCinematographyScript removeTrack:](v4);
        }

        goto LABEL_7;
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = [(PTCinematographyScript *)self userDecisions];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        int v14 = 0;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            uint64_t v18 = [v17 trackIdentifier];
            if (v18 == [v4 trackIdentifier]) {
              v14 |= [(PTCinematographyScript *)self _removeUserDecision:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }
      else
      {
        LOBYTE(v14) = 0;
      }

      if ([v4 isUserCreated]) {
        -[PTCinematographyScript _removeDetectionsWithTrackIdentifier:](self, "_removeDetectionsWithTrackIdentifier:", [v4 trackIdentifier]);
      }
      [(PTCinematographyScript *)self _removeTrack:v4];
      if (v14)
      {
        [(PTCinematographyScript *)self timeRange];
        [(PTCinematographyScript *)self _updateDecisionsAndFramesInTimeRange:&v20];
      }
    }
    else
    {
      CMTimeEpoch v9 = _PTLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v4 debugTrackIdentifierString];
        *(_DWORD *)CMTime buf = 138412290;
        CMTime v27 = v10;
        _os_log_impl(&dword_1D0778000, v9, OS_LOG_TYPE_INFO, "track %@ already removed", buf, 0xCu);
      }
    }
    BOOL v8 = 1;
    goto LABEL_27;
  }
LABEL_7:
  BOOL v8 = 0;
LABEL_27:

  return v8;
}

- (void)_addZeroDisparityTrack
{
  if (!self->_zeroDisparityTrack)
  {
    id v3 = [[PTCinematographyFixedFocusTrack alloc] initWithFocusDistance:0.0];
    zeroDisparityTrack = self->_zeroDisparityTrack;
    self->_zeroDisparityTrack = &v3->super;

    [(PTCinematographyTrack *)self->_zeroDisparityTrack setUserCreated:0];
    NSUInteger v5 = self->_zeroDisparityTrack;
    [(PTCinematographyScript *)self _addTrack:v5 identifier:0x1000000000];
  }
}

- (void)_addTrack:(id)a3 identifier:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 setTrackIdentifier:a4];
  [v6 setScript:self];
  NSUInteger v7 = _PTLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = (objc_class *)objc_opt_class();
    CMTimeEpoch v9 = NSStringFromClass(v8);
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1D0778000, v7, OS_LOG_TYPE_INFO, "Adding track %@ (%@)", (uint8_t *)&v13, 0x16u);
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(PTCinematographyScript *)self mutableTracks];
  [v10 addObject:v6];

  trackForNumber = self->_trackForNumber;
  uint64_t v12 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)trackForNumber setObject:v6 forKeyedSubscript:v12];
}

- (void)_removeTrack:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = _PTLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    NSUInteger v7 = NSStringFromClass(v6);
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1D0778000, v5, OS_LOG_TYPE_INFO, "Removing track %@ (%@)", (uint8_t *)&v11, 0x16u);
  }
  trackForNumber = self->_trackForNumber;
  CMTimeEpoch v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "trackIdentifier"));
  [(NSMutableDictionary *)trackForNumber setObject:0 forKeyedSubscript:v9];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(PTCinematographyScript *)self mutableTracks];
  [v10 removeObject:v4];

  [v4 setTrackIdentifier:0];
  [v4 setScript:0];
}

- (BOOL)_isEditCreatedTrack:(id)a3
{
  return ([a3 trackIdentifier] & 0x7FFFFFFE00000000) == 0x1200000000;
}

- (void)_removeAllUserTracksForReloading
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(PTCinematographyScript *)self tracks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isUserCreated]
          && [(PTCinematographyScript *)self _isEditCreatedTrack:v8])
        {
          [(PTCinematographyScript *)self removeTrack:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_addGroupTrack:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (PTGroupIDIsInvalid([v4 groupIdentifier]))
  {
    uint64_t v5 = _PTLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyScript _addGroupTrack:](v4, v5);
    }
  }
  else
  {
    [v4 setScript:self];
    uint64_t v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSUInteger v7 = (objc_class *)objc_opt_class();
      BOOL v8 = NSStringFromClass(v7);
      long long v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "groupIdentifier"));
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1D0778000, v6, OS_LOG_TYPE_INFO, "Adding group track %@ (%@) with group identifier %@", (uint8_t *)&v12, 0x20u);
    }
    long long v10 = [(PTCinematographyScript *)self mutableGroupTracks];
    [v10 addObject:v4];

    trackForGroupNumber = self->_trackForGroupNumber;
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "groupIdentifier"));
    [(NSMutableDictionary *)trackForGroupNumber setObject:v4 forKeyedSubscript:v5];
  }
}

- (void)_addDetectionsFromCustomTrack:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 allDetections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    long long v19 = *MEMORY[0x1E4F1FA48];
    *((void *)&v9 + 1) = *(void *)(MEMORY[0x1E4F1FA48] + 8);
    uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(void *)&long long v9 = 138412290;
    long long v18 = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        int v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        objc_msgSend(v12, "setDetectionType:", objc_msgSend(v4, "detectionType", v18));
        objc_msgSend(v12, "setTrackIdentifier:", objc_msgSend(v4, "trackIdentifier"));
        if (v12) {
          [v12 time];
        }
        else {
          memset(v21, 0, sizeof(v21));
        }
        *(_OWORD *)CMTime buf = v19;
        uint64_t v27 = v10;
        id v13 = [(PTCinematographyScript *)self frameAtTime:v21 tolerance:buf];
        __int16 v14 = v13;
        if (v13)
        {
          [v13 _addDetection:v12];
        }
        else
        {
          uint64_t v15 = _PTLogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            if (v12) {
              [v12 time];
            }
            else {
              memset(&v20, 0, sizeof(v20));
            }
            __int16 v16 = NSStringFromCMTime(&v20);
            *(_DWORD *)CMTime buf = v18;
            *(void *)&uint8_t buf[4] = v16;
            _os_log_error_impl(&dword_1D0778000, v15, OS_LOG_TYPE_ERROR, "error: addTrack: track detection at time not present in script: %@", buf, 0xCu);
          }
        }

        ++v11;
      }
      while (v7 != v11);
      uint64_t v17 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
      uint64_t v7 = v17;
    }
    while (v17);
  }
}

- (void)_addDetectionsFromFixedFocusTrack:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(PTCinematographyScript *)self frames];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v10) {
          [*(id *)(*((void *)&v13 + 1) + 8 * i) time];
        }
        else {
          memset(v12, 0, sizeof(v12));
        }
        uint64_t v11 = [v4 _fixedFocusDetectionAtTime:v12];
        objc_msgSend(v11, "setTrackIdentifier:", objc_msgSend(v4, "trackIdentifier"));
        [v10 _addDetection:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_removeDetectionsWithTrackIdentifier:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(PTCinematographyScript *)self frames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _removeDetectionWithTrackIdentifier:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_notifyDelegateOfChangesToDecisionsInTimeRange:(id *)a3
{
  uint64_t v5 = [(PTCinematographyScript *)self changesDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(PTCinematographyScript *)self changesDelegate];
    long long v8 = *(_OWORD *)&a3->var0.var3;
    v9[0] = *(_OWORD *)&a3->var0.var0;
    v9[1] = v8;
    v9[2] = *(_OWORD *)&a3->var1.var1;
    [v7 decisionsDidChangeInScript:self timeRange:v9];
  }
}

- (void)_notifyDelegateOfChangesToFramesInTimeRange:(id *)a3
{
  uint64_t v5 = [(PTCinematographyScript *)self changesDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(PTCinematographyScript *)self changesDelegate];
    long long v8 = *(_OWORD *)&a3->var0.var3;
    v9[0] = *(_OWORD *)&a3->var0.var0;
    v9[1] = v8;
    v9[2] = *(_OWORD *)&a3->var1.var1;
    [v7 framesDidChangeInScript:self timeRange:v9];
  }
}

- (id)changesDictionary
{
  id v3 = objc_opt_new();
  id v4 = NSNumber;
  [(PTCinematographyScript *)self userAperture];
  uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  [v3 setObject:v5 forKeyedSubscript:@"user_aperture"];

  char v6 = [(PTCinematographyScript *)self _userDecisionDictionaries];
  [v3 setObject:v6 forKeyedSubscript:@"user_decisions"];

  uint64_t v7 = [(PTCinematographyScript *)self _userTrackDictionaries];
  [v3 setObject:v7 forKeyedSubscript:@"user_tracks"];

  long long v8 = [(PTCinematographyScript *)self trackAllocator];
  long long v9 = [v8 _asCinematographyDictionary];
  [v3 setObject:v9 forKeyedSubscript:@"track_allocator"];

  long long v10 = (void *)[v3 copy];

  return v10;
}

- (id)_userDecisionDictionaries
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PTCinematographyScript *)self userDecisions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) _asCinematographyDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = (void *)[v3 copy];

  return v10;
}

- (id)_userTrackDictionaries
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(PTCinematographyScript *)self tracks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isUserCreated])
        {
          long long v10 = [v9 _asCinematographyDictionary];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  long long v11 = (void *)[v3 copy];

  return v11;
}

- (id)changesDictionaryTrimmedByTimeRange:(id *)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = NSNumber;
  [(PTCinematographyScript *)self userAperture];
  uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
  [v5 setObject:v7 forKeyedSubscript:@"user_aperture"];

  long long v8 = *(_OWORD *)&a3->var0.var3;
  long long v16 = *(_OWORD *)&a3->var0.var0;
  long long v17 = v8;
  long long v18 = *(_OWORD *)&a3->var1.var1;
  long long v9 = [(PTCinematographyScript *)self _userDecisionDictionariesTrimmedByTimeRange:&v16];
  [v5 setObject:v9 forKeyedSubscript:@"user_decisions"];

  long long v10 = *(_OWORD *)&a3->var0.var3;
  long long v16 = *(_OWORD *)&a3->var0.var0;
  long long v17 = v10;
  long long v18 = *(_OWORD *)&a3->var1.var1;
  long long v11 = [(PTCinematographyScript *)self _userTrackDictionariesTrimmedByTimeRange:&v16];
  [v5 setObject:v11 forKeyedSubscript:@"user_tracks"];

  long long v12 = [(PTCinematographyScript *)self trackAllocator];
  long long v13 = [v12 _asCinematographyDictionary];
  [v5 setObject:v13 forKeyedSubscript:@"track_allocator"];

  long long v14 = (void *)[v5 copy];

  return v14;
}

- (id)_userDecisionDictionariesTrimmedByTimeRange:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  CMTime var0 = (CMTime)a3->var0;
  memset(&v45, 0, sizeof(v45));
  long long v7 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = v7;
  CMTimeRangeGetEnd(&v45, &range);
  long long v8 = [(PTCinematographyScript *)self userDecisions];
  range.CMTime start = var0;
  unint64_t v9 = [v8 _firstIndexAtOrAfterTime:&range];

  long long v10 = [(PTCinematographyScript *)self userDecisions];
  range.CMTime start = v45;
  unint64_t v11 = [v10 _firstIndexAtOrAfterTime:&range];

  if (v9)
  {
    range.CMTime start = var0;
    long long v12 = [(PTCinematographyScript *)self primaryDecisionAtTime:&range];
    if (![v12 isUserDecision]) {
      goto LABEL_25;
    }
    if (v12) {
      [v12 time];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    range.CMTime start = var0;
    if ((CMTimeCompare(&time1, &range.start) & 0x80000000) == 0) {
      goto LABEL_25;
    }
    long long v13 = [(PTCinematographyScript *)self userDecisions];
    long long v14 = [v13 objectAtIndexedSubscript:v9 - 1];

    long long v29 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&range.start.value = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    range.start.epoch = v15;
    long long v16 = [v14 _decisionByChangingTime:&range];
    memset(&start, 0, sizeof(start));
    if ([v14 hasMinimumDuration])
    {
      if (v14)
      {
        [v14 minimumDuration];
        memset(&v42, 0, sizeof(v42));
LABEL_15:
        [v14 time];
        char v18 = 0;
        goto LABEL_17;
      }
      memset(&start, 0, sizeof(start));
      memset(&v42, 0, sizeof(v42));
    }
    else
    {
      long long v17 = objc_opt_class();
      if (v17) {
        [v17 defaultMinimumUserFocusDuration];
      }
      else {
        memset(&start, 0, sizeof(start));
      }
      memset(&v42, 0, sizeof(v42));
      if (v14) {
        goto LABEL_15;
      }
    }
    memset(&lhs, 0, sizeof(lhs));
    char v18 = 1;
LABEL_17:
    range.CMTime start = start;
    CMTimeAdd(&v42, &lhs, &range.start);
    range.CMTime start = v42;
    CMTime rhs = var0;
    CMTimeSubtract(&time2, &range.start, &rhs);
    *(_OWORD *)&range.start.value = v29;
    range.start.epoch = v15;
    CMTimeMaximum(&v40, &range.start, &time2);
    CMTime v37 = v40;
    [v16 setMinimumDuration:&v37];
    if ([v14 hasMaximumDuration])
    {
      memset(&rhs, 0, sizeof(rhs));
      if (v18)
      {
        memset(&v36, 0, sizeof(v36));
        memset(&v35, 0, sizeof(v35));
      }
      else
      {
        [v14 time];
        [v14 maximumDuration];
      }
      CMTimeAdd(&rhs, &v36, &v35);
      range.CMTime start = rhs;
      CMTime v34 = var0;
      if (CMTimeCompare(&range.start, &v34) < 1)
      {
        long long v19 = _PTLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          if (v18) {
            memset(&v31, 0, sizeof(v31));
          }
          else {
            [v14 maximumDuration];
          }
          CMTime v26 = NSStringFromCMTime(&v31);
          range.CMTime start = var0;
          uint64_t v27 = NSStringFromCMTime(&range.start);
          LODWORD(range.start.value) = 138413058;
          *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v12;
          LOWORD(range.start.flags) = 2112;
          *(void *)((char *)&range.start.flags + 2) = v14;
          HIWORD(range.start.epoch) = 2112;
          range.duration.value = (CMTimeValue)v26;
          LOWORD(range.duration.timescale) = 2112;
          *(void *)((char *)&range.duration.timescale + 2) = v27;
          uint64_t v28 = (void *)v27;
          _os_log_error_impl(&dword_1D0778000, v19, OS_LOG_TYPE_ERROR, "Primary decision %@ is user decision, but previous user decision %@ has maximum duration %@ that ends before trim starts %@", (uint8_t *)&range, 0x2Au);
        }
        goto LABEL_24;
      }
      range.CMTime start = rhs;
      CMTime v34 = var0;
      CMTimeSubtract(&v33, &range.start, &v34);
      CMTime v32 = v33;
      [v16 setMaximumDuration:&v32];
    }
    long long v19 = [v16 _asCinematographyDictionary];
    [v5 addObject:v19];
LABEL_24:

LABEL_25:
  }
  if (v9 < v11)
  {
    do
    {
      CMTime v20 = [(PTCinematographyScript *)self userDecisions];
      long long v21 = [v20 objectAtIndexedSubscript:v9];

      memset(&range, 0, 24);
      if (v21) {
        [v21 time];
      }
      else {
        memset(&v30, 0, sizeof(v30));
      }
      CMTime start = var0;
      CMTimeSubtract(&range.start, &v30, &start);
      CMTime start = range.start;
      long long v22 = [v21 _decisionByChangingTime:&start];
      long long v23 = [v22 _asCinematographyDictionary];
      [v5 addObject:v23];

      ++v9;
    }
    while (v11 != v9);
  }
  long long v24 = (void *)[v5 copy];

  return v24;
}

- (id)_userTrackDictionariesTrimmedByTimeRange:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v6 = [(PTCinematographyScript *)self mutableTracks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v11 isUserCreated])
        {
          long long v12 = *(_OWORD *)&a3->var0.var3;
          v19[0] = *(_OWORD *)&a3->var0.var0;
          v19[1] = v12;
          v19[2] = *(_OWORD *)&a3->var1.var1;
          long long v17 = v19[0];
          int64_t var3 = a3->var0.var3;
          long long v13 = [v11 _trackByTrimmingToTimeRange:v19 subtracting:&v17];
          long long v14 = [v13 _asCinematographyDictionary];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  CMTimeEpoch v15 = (void *)[v5 copy];

  return v15;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  long long v3 = *(_OWORD *)&self[4].var0.var3;
  *(_OWORD *)&retstr->var0.CMTime var0 = *(_OWORD *)&self[4].var0.var0;
  *(_OWORD *)&retstr->var0.int64_t var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var1.var1;
  return self;
}

- (PTCinematographyScriptChanges)changesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changesDelegate);

  return (PTCinematographyScriptChanges *)WeakRetained;
}

- (void)setChangesDelegate:(id)a3
{
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (PTGlobalCinematographyMetadata)globals
{
  return self->_globals;
}

- (void)setGlobals:(id)a3
{
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (PTCinematographyFocusFramesOptions)focusFramesOptions
{
  return self->_focusFramesOptions;
}

- (void)setFocusFramesOptions:(id)a3
{
}

- (NSArray)baseDecisions
{
  return self->_baseDecisions;
}

- (void)setBaseDecisions:(id)a3
{
}

- (NSMutableArray)userDecisions
{
  return self->_userDecisions;
}

- (void)setUserDecisions:(id)a3
{
}

- (NSMutableArray)effectiveDecisions
{
  return self->_effectiveDecisions;
}

- (void)setEffectiveDecisions:(id)a3
{
}

- (void)setTrackDecisions:(id)a3
{
}

- (NSMutableArray)mutableTracks
{
  return self->_mutableTracks;
}

- (void)setMutableTracks:(id)a3
{
}

- (NSMutableDictionary)trackForNumber
{
  return self->_trackForNumber;
}

- (void)setTrackForNumber:(id)a3
{
}

- (PTCinematographyTrack)zeroDisparityTrack
{
  return self->_zeroDisparityTrack;
}

- (void)setZeroDisparityTrack:(id)a3
{
}

- (PTCinematographyTrackAllocator)trackAllocator
{
  return self->_trackAllocator;
}

- (void)setTrackAllocator:(id)a3
{
}

- (NSMutableArray)mutableGroupTracks
{
  return self->_mutableGroupTracks;
}

- (void)setMutableGroupTracks:(id)a3
{
}

- (NSMutableDictionary)trackForGroupNumber
{
  return self->_trackForGroupNumber;
}

- (void)setTrackForGroupNumber:(id)a3
{
}

- (NSMutableDictionary)trackNumberForFocusIdentifier
{
  return self->_trackNumberForFocusIdentifier;
}

- (void)setTrackNumberForFocusIdentifier:(id)a3
{
}

- (PTCinematographyTrackAllocator)trackAllocatorForFocusIdentifier
{
  return self->_trackAllocatorForFocusIdentifier;
}

- (void)setTrackAllocatorForFocusIdentifier:(id)a3
{
}

- (BOOL)didInternalizeTracks
{
  return self->_didInternalizeTracks;
}

- (void)setDidInternalizeTracks:(BOOL)a3
{
  self->_didInternalizeTracks = a3;
}

- (PTCinematographyFocusPuller)focusPuller
{
  return self->_focusPuller;
}

- (void)setFocusPuller:(id)a3
{
}

- (float)loadedUserAperture
{
  return self->_loadedUserAperture;
}

- (void)setLoadedUserAperture:(float)a3
{
  self->_loadedUserAperture = a3;
}

- (int64_t)loadedTrackAllocatorState
{
  return self->_loadedTrackAllocatorState;
}

- (void)setLoadedTrackAllocatorState:(int64_t)a3
{
  self->_loadedTrackAllocatorState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusPuller, 0);
  objc_storeStrong((id *)&self->_trackAllocatorForFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_trackNumberForFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_trackForGroupNumber, 0);
  objc_storeStrong((id *)&self->_mutableGroupTracks, 0);
  objc_storeStrong((id *)&self->_trackAllocator, 0);
  objc_storeStrong((id *)&self->_zeroDisparityTrack, 0);
  objc_storeStrong((id *)&self->_trackForNumber, 0);
  objc_storeStrong((id *)&self->_mutableTracks, 0);
  objc_storeStrong((id *)&self->_trackDecisions, 0);
  objc_storeStrong((id *)&self->_effectiveDecisions, 0);
  objc_storeStrong((id *)&self->_userDecisions, 0);
  objc_storeStrong((id *)&self->_baseDecisions, 0);
  objc_storeStrong((id *)&self->_focusFramesOptions, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_globals, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_changesDelegate);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)_internalizeLoadedFrames:(void *)a1 changesDictionary:reloading:.cold.1(void *a1)
{
  v1 = [a1 trackDecisions];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "Track decisions: %@", v4, v5, v6, v7, v8);
}

- (void)_internalizeLoadedFrames:(void *)a1 changesDictionary:reloading:.cold.2(void *a1)
{
  v1 = [a1 effectiveDecisions];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "Effective decisions: %@", v4, v5, v6, v7, v8);
}

- (void)_internalizeFocusPullerFromFrames:(void *)a1 .cold.1(void *a1)
{
  v1 = NSNumber;
  uint64_t v2 = [a1 globals];
  uint64_t v3 = objc_msgSend(v1, "numberWithUnsignedInt:", objc_msgSend(v2, "majorVersion"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v4, v5, "unsupported globals version %@", v6, v7, v8, v9, v10);
}

- (void)_internalizeUserDecisionsFromFrames:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *CMTime buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "internalizing user focus end without prior user decision", buf, 2u);
}

- (void)setUserAperture:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "attempt to set user aperture to non-positive value ignored", v1, 2u);
}

- (void)_updateFramesForDecisions:(NSRange)a1 indexRange:.cold.1(NSRange a1)
{
  v1 = NSStringFromRange(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "finished updating frames for decisions in index range %@", v4, v5, v6, v7, v8);
}

- (void)_updateFramesFromDecision:toDecision:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D0778000, v1, OS_LOG_TYPE_DEBUG, "track doesn't change across adjacent decisions (%@; %@)",
    v2,
    0x16u);
}

- (void)_updateFramesFromDecision:(NSObject *)a3 toDecision:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 trackIdentifier];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 trackIdentifier];
  _os_log_debug_impl(&dword_1D0778000, a3, OS_LOG_TYPE_DEBUG, "did shorten transition from track %lu to track %lu", (uint8_t *)&v5, 0x16u);
}

- (void)_updateFramesForTransitionFromDecision:toDecision:timeRange:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "error: cannot find current or prior detection for decision %@", v2, v3, v4, v5, v6);
}

- (void)_internalizeTrackForDetection:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "error: detection missing both trackIdentifier & focusIdentifier: %@", v2, v3, v4, v5, v6);
}

- (void)_internalizeTrackForDetection:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "error: detection missing trackIdentifier: %@", v2, v3, v4, v5, v6);
}

- (void)focusOnTrackIdentifier:atTime:strong:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "focusOnTrackIdentifier:atTime: No such %li trackIdentifier", v2, v3, v4, v5, v6);
}

- (void)focusOnTrackIdentifier:(uint64_t)a1 atTime:strong:.cold.2(uint64_t a1)
{
  OUTLINED_FUNCTION_4_2(a1);
  uint64_t v2 = NSStringFromCMTime(v1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v3, v4, "focusOnTrackIdentifier:atTime: time %@ is not numeric", v5, v6, v7, v8, v9);
}

- (void)focusOnGroupIdentifier:(uint64_t)a1 atTime:strong:.cold.1(uint64_t a1)
{
  OUTLINED_FUNCTION_4_2(a1);
  uint64_t v2 = NSStringFromCMTime(v1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v3, v4, "focusOnGroupIdentifier:atTime: time %@ is not numeric", v5, v6, v7, v8, v9);
}

- (void)addUserDecision:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "Adding group user decision with no corresponding detection: %@", v2, v3, v4, v5, v6);
}

- (void)removeAllUserDecisions
{
  uint64_t v1 = [a1 userDecisions];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1D0778000, v2, v3, "removing all user decisions %@", v4, v5, v6, v7, v8);
}

- (void)_removeUserDecision:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "attempt to remove decision not found: %@", v2, v3, v4, v5, v6);
}

- (void)_removeUserDecision:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D0778000, v0, v1, "attempt to remove non-user decision %@", v2, v3, v4, v5, v6);
}

- (void)addTrack:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 debugTrackIdentifierString];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v2, v3, "error: track %@ already belongs to another script", v4, v5, v6, v7, v8);
}

- (void)removeTrack:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 debugTrackIdentifierString];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v2, v3, "error: attempt to remove track %@ from a different script", v4, v5, v6, v7, v8);
}

- (void)_addGroupTrack:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "groupIdentifier"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "detectionType"));
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint8_t v9 = v5;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "attempt to add track with invalid group identifier %@ (%@)", (uint8_t *)&v6, 0x16u);
}

@end