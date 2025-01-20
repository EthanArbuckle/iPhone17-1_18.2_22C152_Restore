@interface PXStoryConcreteSubtimelineScanner
- ($70EB31679AD570D2612C6654B67EF72A)scanState;
- (BOOL)_scanFastestSubtimelineWithNextDisplayAssetResultHandler:(id)a3;
- (BOOL)_scanMultipartPanoramaSubtimelineAfterTime:(id *)a3 axis:(int64_t)a4 nextDisplayAssetsInfo:(id)a5 resultHandler:(id)a6;
- (BOOL)_scanMultipartPanoramaSubtimelineAfterTime:(id *)a3 nextDisplayAssetsInfo:(id)a4 resultHandler:(id)a5;
- (BOOL)_scanSubtimelineWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 playbackStyles:(const int64_t *)a6 separatorEffectParameters:(id *)a7 kenBurnsEffectParameters:(id *)a8 transitionInfo:(id *)a9 startTime:(id *)a10 durationInfo:(id *)a11 resultHandler:(id)a12;
- (BOOL)isAtBeginning;
- (BOOL)isAtEnd;
- (BOOL)scanBestSubtimelineFollowingTimeline:(id)a3 loggingOptions:(unint64_t)a4 resultHandler:(id)a5;
- (BOOL)scanFastestSubtimelineWithDisplayAssetResourceCount:(int64_t)a3 resultHandler:(id)a4;
- (BOOL)scanFastestSubtimelineWithRemainingClipsResultHandler:(id)a3;
- (BOOL)scanSubtimelineWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 playbackStyles:(const int64_t *)a6 separatorEffectParameters:(id *)a7 kenBurnsEffectParameters:(id *)a8 transitionInfo:(id *)a9 startTime:(id *)a10 durationInfo:(id *)a11 resultHandler:(id)a12;
- (NSArray)randomNumberGenerators;
- (PXStoryConcreteSubtimelineScanner)init;
- (PXStoryConcreteSubtimelineScanner)initWithConfiguration:(id)a3;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (PXStoryTimelineScorer)timelineScorer;
- (PXStoryTimelineSpec)spec;
- (PXStoryTimelineStyle)timelineStyle;
- (id)_newDisplayAssetsInfo;
- (id)_nextDisplayAssetsInfoWithMaximumCount:(int64_t)a3;
- (int64_t)numberOfRemainingResources;
- (void)_addTitles:(unint64_t)a3 toTimeline:(id)a4;
- (void)_initializeDefaultMultipartPanoramaParameters;
- (void)_recycleDisplayAssetsInfo:(id)a3;
- (void)dealloc;
- (void)enumeratePossibleNextSubtimelinesAfterTime:(id *)a3 loggingOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)setScanState:(id *)a3;
@end

@implementation PXStoryConcreteSubtimelineScanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomNumberGenerators, 0);
  objc_storeStrong((id *)&self->_timelineScorer, 0);
  objc_storeStrong((id *)&self->_timelineStyle, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_defaultVerticalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_defaultHorizontalMultipartPanoramaParameters, 0);
  objc_storeStrong((id *)&self->_reusableDisplayAssetInfos, 0);
  objc_storeStrong((id *)&self->_originalPlaybackStylesAllowedInNUp, 0);
  objc_storeStrong((id *)&self->_emptySubtimeline, 0);
  objc_storeStrong((id *)&self->_subtimelineWithRemainingClips, 0);
  objc_storeStrong((id *)&self->_precedingSubtimelineWithCandidateAndSubsequentSubtimelines, 0);
  objc_storeStrong((id *)&self->_precedingSubtimelineWithCandidateSubtimeline, 0);
  objc_storeStrong((id *)&self->_precedingSubtimeline, 0);
  objc_storeStrong((id *)&self->_candidateSubtimeline, 0);
  objc_storeStrong((id *)&self->_bestSubtimeline, 0);
  objc_storeStrong((id *)&self->_subtimelineWithClipComposition, 0);
}

- (NSArray)randomNumberGenerators
{
  return self->_randomNumberGenerators;
}

- (PXStoryTimelineScorer)timelineScorer
{
  return self->_timelineScorer;
}

- (PXStoryTimelineStyle)timelineStyle
{
  return self->_timelineStyle;
}

- (PXStoryTimelineSpec)spec
{
  return self->_spec;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (void)_recycleDisplayAssetsInfo:(id)a3
{
}

- (id)_newDisplayAssetsInfo
{
  id result = [(NSMutableArray *)self->_reusableDisplayAssetInfos px_popFirst];
  if (!result)
  {
    return objc_alloc_init(_PXStoryDisplayAssetsInfo);
  }
  return result;
}

- (id)_nextDisplayAssetsInfoWithMaximumCount:(int64_t)a3
{
  id v5 = [(PXStoryConcreteSubtimelineScanner *)self _newDisplayAssetsInfo];
  int64_t nextResourceIndex = self->_nextResourceIndex;
  int64_t v7 = [(PXStoryConcreteSubtimelineScanner *)self numberOfRemainingResources];
  if (v7 < a3) {
    a3 = v7;
  }
  v8 = [(PXStoryConcreteSubtimelineScanner *)self resourcesDataSource];
  v9 = [(PXStoryConcreteSubtimelineScanner *)self timelineStyle];
  objc_msgSend(v5, "configureWithRange:resourcesDataSource:timelineStyle:nUpPlaybackStyleMapping:", nextResourceIndex, a3, v8, v9, self->_nUpPlaybackStyleMapping);

  return v5;
}

- (int64_t)numberOfRemainingResources
{
  return self->_numberOfResources - self->_nextResourceIndex;
}

- (BOOL)scanFastestSubtimelineWithRemainingClipsResultHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource keyAssetResource];
  v6 = (void *)v5;
  if (self->_nextResourceIndex) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7)
  {
    v8 = [(PXStoryResourcesDataSource *)self->_resourcesDataSource displayAssetResourceAtIndex:0];
    self->_int64_t nextResourceIndex = [v6 isEqual:v8];
  }
  BOOL v9 = [(PXStoryConcreteSubtimelineScanner *)self scanFastestSubtimelineWithDisplayAssetResourceCount:0x7FFFFFFFFFFFFFFFLL resultHandler:v4];

  return v9;
}

- (BOOL)scanFastestSubtimelineWithDisplayAssetResourceCount:(int64_t)a3 resultHandler:(id)a4
{
  v6 = (void (**)(id, PXStoryMutableConcreteTimeline *))a4;
  BOOL v7 = [(PXStoryConcreteSubtimelineScanner *)self isAtEnd];
  if (!v7)
  {
    [(PXStoryMutableConcreteTimeline *)self->_subtimelineWithRemainingClips removeAllClipsAndSegments];
    if (![(PXStoryConcreteSubtimelineScanner *)self isAtEnd] && a3 >= 1)
    {
      uint64_t v8 = MEMORY[0x1E4F143A8];
      int64_t v9 = 1;
      do
      {
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __103__PXStoryConcreteSubtimelineScanner_scanFastestSubtimelineWithDisplayAssetResourceCount_resultHandler___block_invoke;
        v12[3] = &unk_1E5DC1C00;
        v12[4] = self;
        [(PXStoryConcreteSubtimelineScanner *)self _scanFastestSubtimelineWithNextDisplayAssetResultHandler:v12];
        if ([(PXStoryConcreteSubtimelineScanner *)self isAtEnd]) {
          break;
        }
      }
      while (v9++ < a3);
    }
    v6[2](v6, self->_subtimelineWithRemainingClips);
  }

  return !v7;
}

uint64_t __103__PXStoryConcreteSubtimelineScanner_scanFastestSubtimelineWithDisplayAssetResourceCount_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) appendTimeline:a2];
}

- (void)enumeratePossibleNextSubtimelinesAfterTime:(id *)a3 loggingOptions:(unint64_t)a4 usingBlock:(id)a5
{
  v93 = a3;
  SEL v88 = a2;
  v164[1] = *MEMORY[0x1E4F143B8];
  v95 = (char *)a5;
  v89 = (void *)MEMORY[0x1AD10CB00]();
  unint64_t v98 = a4;
  if (a4)
  {
    v73 = PLStoryGetLog();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)v155 = *(_OWORD *)&v93->var0;
      *(void *)&v155[16] = v93->var3;
      v74 = PXStoryTimeDescription((CMTime *)v155);
      *(_DWORD *)v155 = 138412290;
      *(void *)&v155[4] = v74;
      _os_log_impl(&dword_1A9AE7000, v73, OS_LOG_TYPE_DEFAULT, "enumerate possible next subtimelines after %@", v155, 0xCu);
    }
    if ([(PXStoryConcreteSubtimelineScanner *)self isAtEnd])
    {
      v75 = PLStoryGetLog();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v155 = 0;
        _os_log_impl(&dword_1A9AE7000, v75, OS_LOG_TYPE_DEFAULT, "at end", v155, 2u);
      }

      goto LABEL_84;
    }
  }
  else if ([(PXStoryConcreteSubtimelineScanner *)self isAtEnd])
  {
    goto LABEL_84;
  }
  long long v147 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  [(PXStoryConcreteSubtimelineScanner *)self scanState];
  id v92 = [(PXStoryConcreteSubtimelineScanner *)self timelineStyle];
  id v100 = [(PXStoryConcreteSubtimelineScanner *)self _nextDisplayAssetsInfoWithMaximumCount:3];
  if (self->_nextResourceIndex == -1)
  {
    if ((self->_productionOptions & 1) == 0)
    {
      int64_t v9 = [v100 displayAssetsWithCount:1];
      BOOL v7 = [v9 storyDisplayAssetAtIndex:0];

      id v10 = v100;
      v11 = objc_msgSend(v92, "clipCompositionForKeyAsset:contentInfo:finalPlaybackStyle:", v7, objc_msgSend(v10, "assetContentInfos"), *objc_msgSend(v10, "oneUpPlaybackStyles"));
      v163 = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v163 count:1];

      goto LABEL_9;
    }
    BOOL v7 = +[PXStoryClipCompositionFactory oneUpComposition];
    v164[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:1];
  }
  else
  {
    BOOL v7 = objc_msgSend(v100, "displayAssetsWithCount:", objc_msgSend(v100, "count"));
    *(_OWORD *)v155 = *(_OWORD *)&v93->var0;
    *(void *)&v155[16] = v93->var3;
    uint64_t v8 = [v92 allowedClipCompositionsWithStartTime:v155 nextDisplayAssets:v7];
  }
  v12 = (void *)v8;
LABEL_9:

  if (self->_nextResourceIndex) {
    BOOL firstDisplayAssetIsSameAsKey = 0;
  }
  else {
    BOOL firstDisplayAssetIsSameAsKey = self->_firstDisplayAssetIsSameAsKey;
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v141 objects:v162 count:16];
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v142 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v141 + 1) + 8 * i) numberOfClips];
        if (v15 <= v18) {
          uint64_t v15 = v18;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v141 objects:v162 count:16];
    }
    while (v14);

    if (v15 < 4) {
      goto LABEL_25;
    }
    v19 = [(PXStoryConcreteSubtimelineScanner *)self _nextDisplayAssetsInfoWithMaximumCount:v15];
    id v20 = v100;
    id v100 = v19;
  }
  else
  {
    id v20 = v13;
  }

LABEL_25:
  id v21 = v100;
  if (v98)
  {
    v76 = PLStoryGetLog();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v155 = 67109120;
      *(_DWORD *)&v155[4] = firstDisplayAssetIsSameAsKey;
      _os_log_impl(&dword_1A9AE7000, v76, OS_LOG_TYPE_DEFAULT, "shouldSkipOneUp: %i", v155, 8u);
    }

    id v21 = v100;
  }
  if (!firstDisplayAssetIsSameAsKey)
  {
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke;
    v139[3] = &unk_1E5DC0DA8;
    v140 = v95;
    v139[4] = self;
    *(_OWORD *)v155 = *(_OWORD *)&v93->var0;
    *(void *)&v155[16] = v93->var3;
    BOOL v22 = [(PXStoryConcreteSubtimelineScanner *)self _scanMultipartPanoramaSubtimelineAfterTime:v155 nextDisplayAssetsInfo:v21 resultHandler:v139];
    v138[0] = v145;
    v138[1] = v146;
    v138[2] = v147;
    [(PXStoryConcreteSubtimelineScanner *)self setScanState:v138];
    if (v22)
    {
      if (v98)
      {
        v78 = PLStoryGetLog();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v155 = 0;
          _os_log_impl(&dword_1A9AE7000, v78, OS_LOG_TYPE_DEFAULT, "did scan multipart pano", v155, 2u);
        }
      }
      id v13 = 0;
    }
  }
  if (v98)
  {
    v77 = PLStoryGetLog();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v155 = 138412290;
      *(void *)&v155[4] = v13;
      _os_log_impl(&dword_1A9AE7000, v77, OS_LOG_TYPE_DEFAULT, "allowedClipCompositions: %@", v155, 0xCu);
    }
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v94 = v13;
  uint64_t v99 = [v94 countByEnumeratingWithState:&v134 objects:v161 count:16];
  if (v99)
  {
    v84 = &v117;
    v85 = v105;
    uint64_t v96 = *(void *)v135;
    v82 = v116;
    v83 = v115;
    v90 = v95 + 16;
    v91 = v127;
    *(void *)&long long v23 = 67109120;
    long long v80 = v23;
    *(void *)&long long v23 = 138412546;
    long long v81 = v23;
    *(void *)&long long v23 = 67109378;
    long long v79 = v23;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v135 != v96) {
          objc_enumerationMutation(v94);
        }
        v25 = *(void **)(*((void *)&v134 + 1) + 8 * v24);
        uint64_t v130 = 0;
        v131 = &v130;
        uint64_t v132 = 0x2020000000;
        char v133 = 0;
        uint64_t v26 = objc_msgSend(v25, "numberOfClips", (void)v79, *((void *)&v79 + 1));
        uint64_t v27 = v26;
        if (v26 == 1 && firstDisplayAssetIsSameAsKey)
        {
          ++self->_nextResourceIndex;
          BOOL v29 = [(PXStoryConcreteSubtimelineScanner *)self isAtEnd];
          if (v98)
          {
            v70 = PLStoryGetLog();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v155 = v80;
              *(_DWORD *)&v155[4] = v29;
              _os_log_impl(&dword_1A9AE7000, v70, OS_LOG_TYPE_DEFAULT, "did skip one up, is at end %i", v155, 8u);
            }
          }
          if (v29)
          {
            emptySubtimeline = self->_emptySubtimeline;
            [(PXStoryConcreteSubtimelineScanner *)self scanState];
            (*((void (**)(char *, PXStoryMutableConcreteTimeline *, uint64_t *, uint64_t *))v95 + 2))(v95, emptySubtimeline, &v125, v131 + 3);
            goto LABEL_73;
          }
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v127[0] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_53;
          v127[1] = &unk_1E5DC0DD0;
          v128 = v95;
          v129 = &v130;
          *(_OWORD *)v155 = *(_OWORD *)&v93->var0;
          *(void *)&v155[16] = v93->var3;
          [(PXStoryConcreteSubtimelineScanner *)self enumeratePossibleNextSubtimelinesAfterTime:v155 loggingOptions:v98 usingBlock:v126];
          v38 = v128;
          goto LABEL_72;
        }
        uint64_t v31 = v26 - 1;
        if (v26 >= 1)
        {
          uint64_t v32 = [v25 numberOfAssets];
          if (v32 <= [v100 count])
          {
            if ((unint64_t)v27 < 2)
            {
              int v35 = 1;
            }
            else
            {
              v33 = (void *)[v25 clipAssetIndexes];
              do
              {
                BOOL v34 = -[NSIndexSet containsIndex:](self->_originalPlaybackStylesAllowedInNUp, "containsIndex:", *(void *)([v100 originalPlaybackStyles] + 8 * *v33));
                int v35 = v34;
                BOOL v37 = v31-- != 0 && v34;
                ++v33;
              }
              while (v37);
            }
            if (v98)
            {
              v71 = PLStoryGetLog();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v155 = v79;
                *(_DWORD *)&v155[4] = v35;
                *(_WORD *)&v155[8] = 2112;
                *(void *)&v155[10] = v25;
                _os_log_impl(&dword_1A9AE7000, v71, OS_LOG_TYPE_DEFAULT, "is composition allowed %i %@", v155, 0x12u);
              }
            }
            if (v35)
            {
              uint64_t v39 = [v25 numberOfAssets];
              id v40 = v100;
              uint64_t v41 = [v100 displayAssetsWithCount:v39];
              id v42 = v40;
              uint64_t v87 = [v42 assetContentInfos];
              uint64_t v43 = v27 - 1;
              id v44 = v42;
              if ((unint64_t)v27 <= 1) {
                uint64_t v45 = [v44 oneUpPlaybackStyles];
              }
              else {
                uint64_t v45 = [v44 nUpPlaybackStyles];
              }
              uint64_t v47 = v45;
              v48 = (void *)v41;
              uint64_t v124 = 0;
              long long v122 = 0u;
              long long v123 = 0u;
              uint64_t v49 = (uint64_t)v92;
              if (v92) {
                uint64_t v49 = [v92 transitionInfoForSegmentWithClipComposition:v25 displayAssets:v41];
              }
              v86 = &v79;
              MEMORY[0x1F4188790](v49, v46);
              unint64_t v53 = (v52 + 15) & 0xFFFFFFFFFFFFFFF0;
              v54 = (char *)&v79 - v53;
              if (v27 >= 2)
              {
                v55 = (void *)((char *)&v79 - v53);
                do
                {
                  void *v55 = 0;
                  v55[1] = 0;
                  v55[2] = 0;
                  v55 += 3;
                  --v43;
                }
                while (v43);
              }
              MEMORY[0x1F4188790](v50, v51);
              v57 = &v79 - 2 * v56;
              v58 = v57;
              do
              {
                v58[2] = xmmword_1AB35B3E8;
                v58[3] = unk_1AB35B3F8;
                v58[4] = xmmword_1AB35B408;
                v58[5] = unk_1AB35B418;
                long long *v58 = PXStoryClipKenBurnsEffectParametersNull;
                v58[1] = unk_1AB35B3D8;
                v58 += 6;
                --v27;
              }
              while (v27);
              uint64_t v118 = 0;
              v119 = &v118;
              uint64_t v120 = 0x2020000000;
              char v121 = 0;
              long long v160 = 0u;
              long long v159 = 0u;
              long long v158 = 0u;
              long long v157 = 0u;
              long long v156 = 0u;
              memset(v155, 0, sizeof(v155));
              id v59 = v92;
              if (v92)
              {
                long long v148 = *(_OWORD *)&v93->var0;
                *(void *)&long long v149 = v93->var3;
                [v92 durationInfoForSegmentWithDisplayAssets:v48 startTime:&v148];
                id v59 = v92;
              }
              v104[0] = MEMORY[0x1E4F143A8];
              v104[1] = 3221225472;
              v105[0] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_54;
              v105[1] = &unk_1E5DC0E48;
              id v60 = v59;
              id v106 = v60;
              v107 = v25;
              v38 = v48;
              uint64_t v113 = v87;
              uint64_t v114 = v47;
              uint64_t v87 = v47;
              v61 = v93;
              v62 = v84;
              *(_OWORD *)v84 = *(_OWORD *)&v93->var0;
              v62[2] = v61->var3;
              long long v63 = v159;
              v65 = v82;
              v64 = v83;
              *((_OWORD *)v83 + 4) = v158;
              v64[5] = v63;
              v64[6] = v160;
              long long v66 = *(_OWORD *)&v155[16];
              _OWORD *v64 = *(_OWORD *)v155;
              v64[1] = v66;
              long long v67 = v157;
              v64[2] = v156;
              v64[3] = v67;
              v115[14] = v57;
              v108 = v38;
              v109 = self;
              v65[4] = v124;
              long long v68 = v123;
              *(_OWORD *)v65 = v122;
              *((_OWORD *)v65 + 1) = v68;
              v110 = v95;
              v111 = &v130;
              v116[5] = v88;
              v112 = &v118;
              long long v102 = *(_OWORD *)&v61->var0;
              int64_t var3 = v61->var3;
              long long v152 = v158;
              long long v153 = v159;
              long long v154 = v160;
              long long v148 = *(_OWORD *)v155;
              long long v149 = *(_OWORD *)&v155[16];
              long long v151 = v157;
              long long v150 = v156;
              [v60 enumerateAllowedSeparatorEffectParametersForSegmentWithClipComposition:v25 displayAssets:v38 finalPlaybackStyles:v87 startTime:&v102 durationInfo:&v148 buffer:v54 usingBlock:v104];
              if (!*((unsigned char *)v119 + 24)) {
                PXAssertGetLog();
              }

              _Block_object_dispose(&v118, 8);
LABEL_72:
            }
          }
        }
LABEL_73:
        v101[0] = v145;
        v101[1] = v146;
        v101[2] = v147;
        [(PXStoryConcreteSubtimelineScanner *)self setScanState:v101];
        int v69 = *((unsigned __int8 *)v131 + 24);
        _Block_object_dispose(&v130, 8);
        if (v69) {
          goto LABEL_83;
        }
        ++v24;
      }
      while (v24 != v99);
      uint64_t v72 = [v94 countByEnumeratingWithState:&v134 objects:v161 count:16];
      uint64_t v99 = v72;
    }
    while (v72);
  }
LABEL_83:

  [(PXStoryConcreteSubtimelineScanner *)self _recycleDisplayAssetsInfo:v100];
LABEL_84:
}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v7 = 0;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4) {
    [v4 scanState];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  (*(void (**)(uint64_t, id, _OWORD *, char *))(v5 + 16))(v5, v3, v6, &v7);
}

uint64_t __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_53(uint64_t a1, uint64_t a2, _OWORD *a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  id v10 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))(v8 + 16);
  long long v11 = a3[1];
  v13[0] = *a3;
  v13[1] = v11;
  v13[2] = a3[2];
  uint64_t result = v10(v8, a2, v13, v9, a5, a6);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v9 = *(void *)(a1 + 216);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_2;
  v27[3] = &unk_1E5DC0E20;
  id v10 = *(void **)(a1 + 48);
  v27[4] = *(void *)(a1 + 56);
  v27[5] = v6;
  id v28 = v10;
  long long v32 = *(_OWORD *)(a1 + 88);
  long long v11 = *(_OWORD *)(a1 + 240);
  long long v34 = *(_OWORD *)(a1 + 224);
  long long v35 = v11;
  uint64_t v12 = *(void *)(a1 + 256);
  uint64_t v33 = a2;
  uint64_t v36 = v12;
  long long v13 = *(_OWORD *)(a1 + 272);
  uint64_t v45 = *(void *)(a1 + 288);
  long long v14 = *(_OWORD *)(a1 + 120);
  long long v15 = *(_OWORD *)(a1 + 136);
  long long v37 = *(_OWORD *)(a1 + 104);
  long long v38 = v14;
  long long v16 = *(_OWORD *)(a1 + 152);
  long long v17 = *(_OWORD *)(a1 + 168);
  long long v43 = *(_OWORD *)(a1 + 200);
  long long v44 = v13;
  long long v18 = *(_OWORD *)(a1 + 184);
  long long v41 = v17;
  long long v42 = v18;
  long long v39 = v15;
  long long v40 = v16;
  id v19 = *(id *)(a1 + 64);
  uint64_t v20 = *(void *)(a1 + 72);
  id v29 = v19;
  uint64_t v30 = v20;
  uint64_t v31 = &v46;
  long long v25 = *(_OWORD *)(a1 + 272);
  uint64_t v26 = *(void *)(a1 + 288);
  long long v21 = *(_OWORD *)(a1 + 152);
  long long v22 = *(_OWORD *)(a1 + 184);
  long long v54 = *(_OWORD *)(a1 + 168);
  long long v55 = v22;
  long long v56 = *(_OWORD *)(a1 + 200);
  long long v23 = *(_OWORD *)(a1 + 120);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 104);
  long long v51 = v23;
  long long v52 = *(_OWORD *)(a1 + 136);
  long long v53 = v21;
  [v5 enumerateAllowedKenBurnsEffectParametersForSegmentWithClipComposition:v6 displayAssets:v28 assetContentInfos:v7 finalPlaybackStyles:v8 startTime:&v25 durationInfo:buf separatorEffectParameters:a2 separatorEffectContext:a3 buffer:v9 usingBlock:v27];
  if (!*((unsigned char *)v47 + 24)) {
    PXAssertGetLog();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;

  _Block_object_dispose(&v46, 8);
}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 96);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_3;
  v21[3] = &unk_1E5DC0DF8;
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  v21[4] = *(void *)(a1 + 32);
  id v22 = v10;
  uint64_t v23 = *(void *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 120);
  v19[0] = *(_OWORD *)(a1 + 104);
  v19[1] = v11;
  uint64_t v20 = *(void *)(a1 + 136);
  long long v12 = *(_OWORD *)(a1 + 256);
  v16[6] = *(_OWORD *)(a1 + 240);
  long long v17 = v12;
  uint64_t v18 = *(void *)(a1 + 272);
  long long v13 = *(_OWORD *)(a1 + 224);
  v16[4] = *(_OWORD *)(a1 + 208);
  v16[5] = v13;
  long long v14 = *(_OWORD *)(a1 + 160);
  v16[0] = *(_OWORD *)(a1 + 144);
  v16[1] = v14;
  long long v15 = *(_OWORD *)(a1 + 192);
  v16[2] = *(_OWORD *)(a1 + 176);
  v16[3] = v15;
  [v4 scanSubtimelineWithClipComposition:v5 displayAssets:v9 assetContentInfos:v6 playbackStyles:v7 separatorEffectParameters:v8 kenBurnsEffectParameters:a2 transitionInfo:v19 startTime:&v17 durationInfo:v16 resultHandler:v21];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
}

void __106__PXStoryConcreteSubtimelineScanner_enumeratePossibleNextSubtimelinesAfterTime_loggingOptions_usingBlock___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  if (v4) {
    [v4 scanState];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  (*(void (**)(uint64_t, id, _OWORD *, uint64_t))(v5 + 16))(v5, v3, v6, *(void *)(a1[6] + 8) + 24);
}

- (void)_addTitles:(unint64_t)a3 toTimeline:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PXStoryConcreteSubtimelineScanner *)self resourcesDataSource];
  uint64_t v8 = v7;
  if (a3 && [v7 numberOfTextResources] && objc_msgSend(v6, "numberOfSegments"))
  {
    [v6 size];
    PXRectWithOriginAndSize();
  }
}

void __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    do
    {
      id v10 = (long long *)(a3 + 48 * v8);
      long long v11 = v10[1];
      long long v52 = *v10;
      long long v53 = v11;
      long long v54 = v10[2];
      uint64_t v48 = 0;
      char v49 = &v48;
      uint64_t v50 = 0x2020000000;
      uint64_t v51 = 0;
      v40[0] = v9;
      v40[1] = 3221225472;
      v40[2] = __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_2;
      v40[3] = &unk_1E5DC0D58;
      uint64_t v44 = *(void *)(a1 + 56);
      long long v12 = *(void **)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 96);
      uint64_t v15 = *(void *)(a1 + 104);
      uint64_t v45 = &v48;
      uint64_t v46 = v14;
      uint64_t v16 = *(void *)(a1 + 48);
      id v41 = v13;
      uint64_t v42 = v16;
      uint64_t v47 = v15;
      id v43 = *(id *)(a1 + 32);
      long long v26 = v52;
      long long v27 = v53;
      long long v28 = v54;
      objc_msgSend(v12, "enumerateConcreteClipsInTimeRange:rect:usingBlock:", &v26, v40, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      if (v49[3] >= 1)
      {
        uint64_t v17 = 0;
        uint64_t v18 = a4 + 200 * v8;
        long long v19 = *(_OWORD *)(v18 + 64);
        long long v37 = *(_OWORD *)(v18 + 48);
        long long v38 = v19;
        uint64_t v39 = *(void *)(v18 + 80);
        do
        {
          uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 576) + 8 * v17);
          long long v21 = *(void **)(a1 + 32);
          v36[0] = v52;
          v36[1] = v53;
          v36[2] = v54;
          double v22 = *(double *)(a1 + 64);
          double v23 = *(double *)(a1 + 72);
          double v24 = *(double *)(a1 + 80);
          double v25 = *(double *)(a1 + 88);
          v34[0] = v37;
          v34[1] = v38;
          uint64_t v35 = v39;
          uint64_t v33 = 0;
          long long v30 = xmmword_1AB35D248;
          long long v31 = xmmword_1AB35D258;
          long long v32 = xmmword_1AB35D268;
          long long v26 = PXStoryKenBurnsAnimationInfoNone;
          long long v27 = unk_1AB35D218;
          long long v28 = xmmword_1AB35D228;
          long long v29 = xmmword_1AB35D238;
          objc_msgSend(v21, "insertClipInTimeRange:resourceKind:options:resourceIndex:frame:transitionInfo:kenBurnsAnimationInfo:", v36, 3, 0, v20, v34, &v26, v22, v23, v24, v25);
          ++v17;
        }
        while (v17 < v49[3]);
      }

      _Block_object_dispose(&v48, 8);
      ++v8;
    }
    while (v8 != a2);
  }
}

uint64_t __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  if (a2 >= 1)
  {
    uint64_t v11 = result;
    uint64_t v12 = 0;
    for (uint64_t i = (void *)(a5 + 8); ; i += 96)
    {
      if (*i == 1)
      {
        uint64_t v14 = *(void *)(a6 + 8 * v12);
        if (v14 != *(void *)(*(void *)(*(void *)(v11 + 56) + 8) + 24))
        {
          uint64_t v15 = *(void **)(v11 + 32);
          uint64_t v16 = *(void *)(v11 + 40);
          uint64_t v18 = *(void *)(v11 + 64);
          uint64_t v17 = *(void *)(v11 + 72);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_3;
          v21[3] = &unk_1E5DC0D10;
          v21[4] = v16;
          void v21[5] = v18;
          v21[6] = *(void *)(v11 + 80);
          uint64_t result = [v15 enumerateTextResourcesForTitles:v17 displayAssetResourceAtIndex:v14 usingBlock:v21];
          if (*(uint64_t *)(*(void *)(*(void *)(v11 + 64) + 8) + 24) > 0) {
            break;
          }
        }
      }
      if (a2 == ++v12) {
        return result;
      }
    }
    uint64_t result = [*(id *)(v11 + 48) modifyOptionsForClipWithIdentifier:*(void *)(a5 + 768 * v12) hintIndex:v12 + a7 usingBlock:&__block_literal_global_48_162902];
    *(void *)(*(void *)(*(void *)(v11 + 56) + 8) + 24) = v14;
    *a8 = 1;
  }
  return result;
}

uint64_t __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  if (v3 >= *(void *)(v2 + 568)) {
    PXAssertGetLog();
  }
  *(void *)(*(void *)(v2 + 576) + 8 * v3) = a2;
  ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

void __59__PXStoryConcreteSubtimelineScanner__addTitles_toTimeline___block_invoke_45(uint64_t a1, void *a2)
{
  *a2 |= 8uLL;
}

- (BOOL)scanBestSubtimelineFollowingTimeline:(id)a3 loggingOptions:(unint64_t)a4 resultHandler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, PXStoryMutableConcreteTimeline *))a5;
  [(PXStoryMutableConcreteTimeline *)self->_precedingSubtimeline removeAllClipsAndSegments];
  uint64_t v10 = [v8 numberOfSegments];
  if (a4)
  {
    double v25 = PLStoryGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)range = 134217984;
      *(void *)&range[4] = v10;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_DEFAULT, "scan best subtimeline following timeline with %ti segments", range, 0xCu);
    }
  }
  if (v10 >= 1)
  {
    uint64_t v11 = 2;
    if (v10 > 2) {
      uint64_t v11 = v10;
    }
    uint64_t v12 = [v8 identifierForSegmentAtIndex:v11 - 2];
    memset(&v48, 0, sizeof(v48));
    if (v8)
    {
      [v8 timeRangeForSegmentWithIdentifier:v12];
      [v8 timeRange];
    }
    else
    {
      long long v40 = 0uLL;
      long long v41 = 0uLL;
      long long v42 = 0uLL;
    }
    *(_OWORD *)range = v40;
    *(_OWORD *)&range[16] = v41;
    *(_OWORD *)&range[32] = v42;
    CMTimeRangeGetEnd(&v43, (CMTimeRange *)range);
    CMTime rhs = v48.start;
    *(CMTime *)range = v43;
    CMTimeSubtract(&v44, (CMTime *)range, &rhs);
    v48.duration = v44;
    precedingSubtimeline = self->_precedingSubtimeline;
    long long v38 = *(_OWORD *)&v48.start.value;
    CMTimeEpoch epoch = v48.start.epoch;
    [(PXStoryMutableConcreteTimeline *)precedingSubtimeline setStartTime:&v38];
    uint64_t v14 = self->_precedingSubtimeline;
    *(CMTimeRange *)range = v48;
    [(PXStoryMutableConcreteTimeline *)v14 appendTimeRange:range fromTimeline:v8];
  }
  if (a4)
  {
    long long v26 = PLStoryGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = [(PXStoryBaseTimeline *)self->_precedingSubtimeline diagnosticDescription];
      *(_DWORD *)range = 138412290;
      *(void *)&range[4] = v27;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEFAULT, "preceding subtimeline: %@", range, 0xCu);
    }
  }
  [(PXStoryMutableConcreteTimeline *)self->_bestSubtimeline removeAllClipsAndSegments];
  uint64_t v15 = [(PXStoryConcreteSubtimelineScanner *)self timelineScorer];
  rhs.value = 0;
  *(void *)&rhs.timescale = &rhs;
  rhs.CMTimeEpoch epoch = 0x2020000000;
  unint64_t v37 = 0xFFEFFFFFFFFFFFFFLL;
  *(void *)range = 0;
  *(void *)&range[8] = range;
  *(void *)&range[16] = 0x5010000000;
  *(_OWORD *)&range[40] = 0u;
  long long v46 = 0u;
  uint64_t v47 = 0;
  *(void *)&range[24] = &unk_1AB5D584F;
  *(void *)&range[32] = 0x7FFFFFFFFFFFFFFFLL;
  memset(&v44, 0, sizeof(v44));
  uint64_t v16 = self->_precedingSubtimeline;
  if (v16) {
    [(PXStoryConcreteTimeline *)v16 timeRange];
  }
  else {
    memset(&v35, 0, sizeof(v35));
  }
  CMTimeRange v48 = v35;
  CMTimeRangeGetEnd(&v44, &v48);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke;
  v30[3] = &unk_1E5DC0CE8;
  unint64_t v34 = a4;
  v30[4] = self;
  id v17 = v15;
  id v31 = v17;
  p_CMTime rhs = &rhs;
  uint64_t v33 = range;
  v48.start = v44;
  [(PXStoryConcreteSubtimelineScanner *)self enumeratePossibleNextSubtimelinesAfterTime:&v48 loggingOptions:a4 usingBlock:v30];
  if (*(void *)(*(void *)&range[8] + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v21 = *(_OWORD *)(*(void *)&range[8] + 48);
    v29[0] = *(_OWORD *)(*(void *)&range[8] + 32);
    v29[1] = v21;
    v29[2] = *(_OWORD *)(*(void *)&range[8] + 64);
    [(PXStoryConcreteSubtimelineScanner *)self setScanState:v29];
    goto LABEL_19;
  }
  uint64_t v18 = [(PXStoryConcreteSubtimelineScanner *)self timelineStyle];
  int v19 = [v18 allowsIncompleteTimelines];

  if (v19)
  {
    uint64_t v20 = PLStoryGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48.start.value) = 0;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "skipping trailing clips because the timeline style allows incomplete timelines", (uint8_t *)&v48, 2u);
    }

    self->_int64_t nextResourceIndex = self->_numberOfResources;
LABEL_19:
    double v22 = [(PXStoryConcreteSubtimelineScanner *)self spec];
    -[PXStoryConcreteSubtimelineScanner _addTitles:toTimeline:](self, "_addTitles:toTimeline:", [v22 allowedInlineTitles], self->_bestSubtimeline);

    v9[2](v9, self->_bestSubtimeline);
    BOOL v23 = 1;
    if ((a4 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
  BOOL v23 = 0;
  if ((a4 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_29:
  long long v28 = PLStoryGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v48.start.value) = 67109120;
    HIDWORD(v48.start.value) = v23;
    _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_DEFAULT, "scanned: %i", (uint8_t *)&v48, 8u);
  }

LABEL_22:
  _Block_object_dispose(range, 8);
  _Block_object_dispose(&rhs, 8);

  return v23;
}

void __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke(uint64_t a1, void *a2, long long *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v15 = PLStoryGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      [v5 diagnosticDescription];
      *(CMTimeValue *)((char *)&range.start.value + 4) = LODWORD(range.start.value) = 138412290;
      uint64_t v16 = *(void **)((char *)&range.start.value + 4);
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "possible next subtimeline 1: %@", (uint8_t *)&range, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 96) setTimeline:v5];
  [*(id *)(*(void *)(a1 + 32) + 112) setTimeline:*(void *)(*(void *)(a1 + 32) + 104)];
  [*(id *)(*(void *)(a1 + 32) + 112) appendTimeline:v5];
  uint64_t v34 = 0;
  CMTimeRange v35 = (double *)&v34;
  uint64_t v36 = 0x2020000000;
  unint64_t v37 = 0xFFEFFFFFFFFFFFFFLL;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  memset(&v29, 0, sizeof(v29));
  id v6 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v6) {
    [v6 timeRange];
  }
  else {
    memset(&v28, 0, sizeof(v28));
  }
  CMTimeRange range = v28;
  CMTimeRangeGetEnd(&v29, &range);
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke_42;
  v23[3] = &unk_1E5DC0CE8;
  uint64_t v27 = v8;
  double v25 = &v30;
  v23[4] = v7;
  id v24 = *(id *)(a1 + 40);
  long long v26 = &v34;
  range.start = v29;
  [v7 enumeratePossibleNextSubtimelinesAfterTime:&range loggingOptions:v8 usingBlock:v23];
  if (!*((unsigned char *)v31 + 24))
  {
    [*(id *)(a1 + 40) scoreForTimeline:*(void *)(*(void *)(a1 + 32) + 112)];
    *((void *)v35 + 3) = v9;
    if (*(unsigned char *)(a1 + 64))
    {
      int v19 = PLStoryGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        CMTimeValue v20 = *((void *)v35 + 3);
        uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 112) diagnosticDescription];
        LODWORD(range.start.value) = 134218242;
        *(CMTimeValue *)((char *)&range.start.value + 4) = v20;
        LOWORD(range.start.flags) = 2112;
        *(void *)((char *)&range.start.flags + 2) = v21;
        double v22 = (void *)v21;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "score %f for %@", (uint8_t *)&range, 0x16u);
      }
    }
  }
  double v10 = v35[3];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v10 > *(double *)(v11 + 24))
  {
    *(double *)(v11 + 24) = v10;
    [*(id *)(*(void *)(a1 + 32) + 88) setTimeline:*(void *)(*(void *)(a1 + 32) + 96)];
    uint64_t v12 = *(_OWORD **)(*(void *)(a1 + 56) + 8);
    long long v13 = *a3;
    long long v14 = a3[2];
    v12[3] = a3[1];
    v12[4] = v14;
    v12[2] = v13;
    if (*(unsigned char *)(a1 + 64))
    {
      id v17 = PLStoryGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CMTimeValue v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        LODWORD(range.start.value) = 134217984;
        *(CMTimeValue *)((char *)&range.start.value + 4) = v18;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "bestScore: %f", (uint8_t *)&range, 0xCu);
      }
    }
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __103__PXStoryConcreteSubtimelineScanner_scanBestSubtimelineFollowingTimeline_loggingOptions_resultHandler___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v3 diagnosticDescription];
      int v11 = 138412290;
      double v12 = *(double *)&v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "possible next subtimeline 2: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(*(void *)(a1 + 32) + 120) setTimeline:*(void *)(*(void *)(a1 + 32) + 112)];
  [*(id *)(*(void *)(a1 + 32) + 120) appendTimeline:v3];
  [*(id *)(a1 + 40) scoreForTimeline:*(void *)(*(void *)(a1 + 32) + 120)];
  double v5 = v4;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v9 = PLStoryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [*(id *)(*(void *)(a1 + 32) + 120) diagnosticDescription];
      int v11 = 134218242;
      double v12 = v5;
      __int16 v13 = 2112;
      long long v14 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "score %f for %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v5 > *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = v5;
  }
}

- (BOOL)_scanMultipartPanoramaSubtimelineAfterTime:(id *)a3 axis:(int64_t)a4 nextDisplayAssetsInfo:(id)a5 resultHandler:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a6;
  [v7 assetContentInfos];
  PXSizeGetAspectRatioWithDefault();
}

void __121__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_axis_nextDisplayAssetsInfo_resultHandler___block_invoke()
{
}

void __121__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_axis_nextDisplayAssetsInfo_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  *a2 = 1;
  *a3 = *(void *)(*(void *)(a1 + 32) + 56);
  PXRectWithOriginAndSize();
}

- (BOOL)_scanMultipartPanoramaSubtimelineAfterTime:(id *)a3 nextDisplayAssetsInfo:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(PXStoryConcreteSubtimelineScanner *)self numberOfRemainingResources] >= 1
    && [v8 count] >= 1
    && (id v10 = v8, *(void *)[v10 oneUpPlaybackStyles] == 1))
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_nextDisplayAssetsInfo_resultHandler___block_invoke;
    aBlock[3] = &unk_1E5DC0C78;
    id v17 = &v20;
    aBlock[4] = self;
    long long v18 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    id v15 = v10;
    id v16 = v9;
    int v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v11[2](v11, 2);
    v11[2](v11, 1);
    BOOL v12 = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __116__PXStoryConcreteSubtimelineScanner__scanMultipartPanoramaSubtimelineAfterTime_nextDisplayAssetsInfo_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    double v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 80);
    uint64_t result = [v5 _scanMultipartPanoramaSubtimelineAfterTime:&v8 axis:a2 nextDisplayAssetsInfo:v6 resultHandler:v7];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (BOOL)_scanSubtimelineWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 playbackStyles:(const int64_t *)a6 separatorEffectParameters:(id *)a7 kenBurnsEffectParameters:(id *)a8 transitionInfo:(id *)a9 startTime:(id *)a10 durationInfo:(id *)a11 resultHandler:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  uint64_t v20 = (void (**)(void, PXStoryMutableConcreteTimeline *))a12;
  uint64_t v21 = [v18 numberOfAssets];
  int64_t v22 = [(PXStoryConcreteSubtimelineScanner *)self numberOfRemainingResources];
  int64_t v52 = v21;
  if (v21 <= v22)
  {
    uint64_t v49 = a5;
    int64_t v45 = v22;
    uint64_t v23 = [v18 numberOfClips];
    CMTime time1 = (CMTime)a11->var1;
    *(_OWORD *)time2 = PXStoryTimeZero;
    *(void *)&time2[16] = 0;
    int32_t v24 = CMTimeCompare(&time1, (CMTime *)time2);
    uint64_t v97 = 0;
    long long v95 = 0u;
    long long v96 = 0u;
    PXStorySegmentClipCompositionInfoFromComposition(v18, (uint64_t)&v95);
    time1.value = 0;
    *(void *)&time1.timescale = &time1;
    time1.CMTimeEpoch epoch = 0x9810000000;
    v86 = &unk_1AB5D584F;
    uint64_t v94 = 0;
    long long v91 = xmmword_1AB35D248;
    long long v92 = xmmword_1AB35D258;
    long long v93 = xmmword_1AB35D268;
    long long v87 = PXStoryKenBurnsAnimationInfoNone;
    long long v88 = unk_1AB35D218;
    long long v89 = xmmword_1AB35D228;
    long long v90 = xmmword_1AB35D238;
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x2020000000;
    v84[3] = 0;
    [(PXStoryMutableConcreteTimeline *)self->_subtimelineWithClipComposition removeAllClipsAndSegments];
    double v25 = +[PXStorySettings sharedInstance];
    long long v26 = v25;
    uint64_t v50 = v25;
    long long v46 = v20;
    uint64_t v47 = a8;
    CMTimeRange v48 = a7;
    if (v24 >= 1
      && [v25 smartGradientEnabled]
      && (![v18 clipFramesExtendToBounds]
       || [v26 allowAspectModeToggle]))
    {
      uint64_t v27 = v23;
      CMTimeRange v28 = v19;
      BOOL v29 = [v18 numberOfAssets] == 1;
    }
    else
    {
      uint64_t v27 = v23;
      CMTimeRange v28 = v19;
      BOOL v29 = 0;
    }
    subtimelineWithClipComposition = self->_subtimelineWithClipComposition;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __223__PXStoryConcreteSubtimelineScanner__scanSubtimelineWithClipComposition_displayAssets_assetContentInfos_playbackStyles_separatorEffectParameters_kenBurnsEffectParameters_transitionInfo_startTime_durationInfo_resultHandler___block_invoke;
    v62[3] = &unk_1E5DC0C50;
    v62[4] = self;
    uint64_t v31 = v27;
    uint64_t v67 = v27;
    id v63 = v28;
    id v32 = v18;
    long long v33 = *(_OWORD *)&a11->var1.var1;
    long long v72 = *(_OWORD *)&a11->var2.var0;
    long long v34 = *(_OWORD *)&a11->var2.var0;
    long long v73 = *(_OWORD *)&a11->var2.var3;
    long long v35 = *(_OWORD *)&a11->var2.var3;
    long long v74 = *(_OWORD *)&a11->var3.var0.var1;
    long long v36 = *(_OWORD *)&a11->var3.var0.var1;
    long long v75 = *(_OWORD *)&a11->var3.var1;
    long long v37 = *(_OWORD *)&a11->var0.var3;
    long long v69 = *(_OWORD *)&a11->var0.var0;
    long long v38 = *(_OWORD *)&a11->var0.var0;
    long long v70 = *(_OWORD *)&a11->var0.var3;
    long long v71 = *(_OWORD *)&a11->var1.var1;
    long long v39 = *(_OWORD *)&a9->var0;
    long long v81 = *(_OWORD *)&a9->var2.var1;
    long long v80 = v39;
    long long v56 = v35;
    long long v57 = v36;
    long long v58 = *(_OWORD *)&a11->var3.var1;
    *(_OWORD *)time2 = v38;
    *(_OWORD *)&time2[16] = v37;
    v76 = v47;
    SEL v77 = a2;
    v78 = v49;
    long long v79 = a6;
    BOOL v83 = v29;
    id v64 = v32;
    p_CMTime time1 = &time1;
    long long v68 = v48;
    long long v66 = v84;
    uint64_t v82 = *(void *)&a9->var3;
    long long v54 = v33;
    long long v55 = v34;
    long long v59 = v95;
    long long v60 = v96;
    *(void *)&long long v61 = v97;
    uint64_t v40 = [(PXStoryMutableConcreteTimeline *)subtimelineWithClipComposition appendSegmentWithDurationInfo:time2 clipCount:v31 compositionInfo:&v59 configuration:v62];
    uint64_t v20 = v46;
    id v19 = v28;
    if ([v32 numberOfClips] < 2) {
      int v41 = 0;
    }
    else {
      int v41 = [v50 allowsNUpBackground];
    }
    if ((v41 | v29) == 1)
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v59 = 0u;
      long long v42 = self->_subtimelineWithClipComposition;
      if (v42)
      {
        [(PXStoryConcreteTimeline *)v42 timeRangeForSegmentWithIdentifier:v40];
        long long v42 = self->_subtimelineWithClipComposition;
      }
      [(PXStoryConcreteTimeline *)v42 size];
      PXRectWithOriginAndSize();
    }
    self->_nextResourceIndex += v52;
    v46[2](v46, self->_subtimelineWithClipComposition);

    _Block_object_dispose(v84, 8);
    _Block_object_dispose(&time1, 8);
    int64_t v22 = v45;
  }
  BOOL v43 = v52 <= v22;

  return v43;
}

void __223__PXStoryConcreteSubtimelineScanner__scanSubtimelineWithClipComposition_displayAssets_assetContentInfos_playbackStyles_separatorEffectParameters_kenBurnsEffectParameters_transitionInfo_startTime_durationInfo_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) spec];
  if (*(void *)(a1 + 72) == 1 && (uint64_t v7 = *(void **)(a1 + 40)) != 0)
  {
    long long v8 = [v7 objectAtIndexedSubscript:0];
    [v8 aspectRatio];
    *(void *)(*(void *)(a1 + 32) + 32) = v9;
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  [*(id *)(a1 + 48) getClipFrames:a4 forContext:*(void *)(a1 + 32) + 8];
  [v6 safeAreaInsets];
  [v6 viewportSize];
  PXRectWithOriginAndSize();
}

uint64_t __223__PXStoryConcreteSubtimelineScanner__scanSubtimelineWithClipComposition_displayAssets_assetContentInfos_playbackStyles_separatorEffectParameters_kenBurnsEffectParameters_transitionInfo_startTime_durationInfo_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 getParametersForNoEffect:*(void *)(a1 + 32) + 168];
}

- (BOOL)_scanFastestSubtimelineWithNextDisplayAssetResultHandler:(id)a3
{
  uint64_t v4 = _scanFastestSubtimelineWithNextDisplayAssetResultHandler__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&_scanFastestSubtimelineWithNextDisplayAssetResultHandler__onceToken, &__block_literal_global_162937);
  }
  uint64_t v15 = 1;
  uint64_t v6 = _scanFastestSubtimelineWithNextDisplayAssetResultHandler__oneUpComposition;
  PXStoryTransitionInfoMakeDefault(1u, (uint64_t)v14, 0.0);
  memset(v13, 0, sizeof(v13));
  long long v7 = *(_OWORD *)&self->_defaultDurationInfo.preferredCue.time.timescale;
  v12[4] = *(_OWORD *)&self->_defaultDurationInfo.maximumDuration.epoch;
  void v12[5] = v7;
  v12[6] = *(_OWORD *)&self->_defaultDurationInfo.preferredCue.rank;
  long long v8 = *(_OWORD *)&self->_defaultDurationInfo.minimumDuration.epoch;
  v12[0] = *(_OWORD *)&self->_defaultDurationInfo.minimumDuration.value;
  v12[1] = v8;
  long long v9 = *(_OWORD *)&self->_defaultDurationInfo.maximumDuration.value;
  v12[2] = *(_OWORD *)&self->_defaultDurationInfo.preferredDuration.timescale;
  v12[3] = v9;
  BOOL v10 = [(PXStoryConcreteSubtimelineScanner *)self _scanSubtimelineWithClipComposition:v6 displayAssets:0 assetContentInfos:0 playbackStyles:&v15 separatorEffectParameters:0 kenBurnsEffectParameters:0 transitionInfo:v14 startTime:v13 durationInfo:v12 resultHandler:v5];

  return v10;
}

void __94__PXStoryConcreteSubtimelineScanner__scanFastestSubtimelineWithNextDisplayAssetResultHandler___block_invoke()
{
  uint64_t v0 = +[PXStoryClipCompositionFactory oneUpComposition];
  v1 = (void *)_scanFastestSubtimelineWithNextDisplayAssetResultHandler__oneUpComposition;
  _scanFastestSubtimelineWithNextDisplayAssetResultHandler__oneUpComposition = v0;
}

- (BOOL)scanSubtimelineWithClipComposition:(id)a3 displayAssets:(id)a4 assetContentInfos:(id *)a5 playbackStyles:(const int64_t *)a6 separatorEffectParameters:(id *)a7 kenBurnsEffectParameters:(id *)a8 transitionInfo:(id *)a9 startTime:(id *)a10 durationInfo:(id *)a11 resultHandler:(id)a12
{
  long long v12 = *(_OWORD *)&a9->var2.var1;
  v19[0] = *(_OWORD *)&a9->var0;
  v19[1] = v12;
  uint64_t v20 = *(void *)&a9->var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a10;
  long long v13 = *(_OWORD *)&a11->var3.var0.var1;
  v17[4] = *(_OWORD *)&a11->var2.var3;
  v17[5] = v13;
  v17[6] = *(_OWORD *)&a11->var3.var1;
  long long v14 = *(_OWORD *)&a11->var0.var3;
  v17[0] = *(_OWORD *)&a11->var0.var0;
  v17[1] = v14;
  long long v15 = *(_OWORD *)&a11->var2.var0;
  v17[2] = *(_OWORD *)&a11->var1.var1;
  v17[3] = v15;
  return [(PXStoryConcreteSubtimelineScanner *)self _scanSubtimelineWithClipComposition:a3 displayAssets:a4 assetContentInfos:a5 playbackStyles:a6 separatorEffectParameters:a7 kenBurnsEffectParameters:a8 transitionInfo:v19 startTime:&v18 durationInfo:v17 resultHandler:a12];
}

- (void)setScanState:(id *)a3
{
  self->_int64_t nextResourceIndex = a3->var0;
  uint64_t v4 = [(PXStoryConcreteSubtimelineScanner *)self randomNumberGenerators];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PXStoryConcreteSubtimelineScanner_setScanState___block_invoke;
  _OWORD v6[3] = &__block_descriptor_80_e48_v32__0___PFSeededRandomNumberGenerator__8Q16_B24l;
  long long v5 = *(_OWORD *)&a3->var1[1];
  long long v7 = *(_OWORD *)&a3->var0;
  long long v8 = v5;
  long long v9 = *(_OWORD *)&a3->var1[3];
  [v4 enumerateObjectsUsingBlock:v6];
}

uint64_t __50__PXStoryConcreteSubtimelineScanner_setScanState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setSeed:*(void *)(a1 + 8 * a3 + 40)];
}

- ($70EB31679AD570D2612C6654B67EF72A)scanState
{
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x5010000000;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v21 = 0;
  int64_t nextResourceIndex = self->_nextResourceIndex;
  id v17 = &unk_1AB5D584F;
  int64_t v18 = nextResourceIndex;
  long long v7 = [(PXStoryConcreteSubtimelineScanner *)self randomNumberGenerators];
  if ((unint64_t)[v7 count] >= 6)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a3 object:self file:@"PXStoryConcreteSubtimelineScanner.m" lineNumber:227 description:@"too many random number generators"];
  }
  long long v8 = [(PXStoryConcreteSubtimelineScanner *)self randomNumberGenerators];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__PXStoryConcreteSubtimelineScanner_scanState__block_invoke;
  void v13[3] = &unk_1E5DC0C08;
  v13[4] = &v14;
  [v8 enumerateObjectsUsingBlock:v13];

  long long v9 = v15;
  long long v10 = *((_OWORD *)v15 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v15 + 2);
  *(_OWORD *)&retstr->var1[1] = v10;
  *(_OWORD *)&retstr->var1[3] = *((_OWORD *)v9 + 4);

  _Block_object_dispose(&v14, 8);
  return result;
}

uint64_t __46__PXStoryConcreteSubtimelineScanner_scanState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 seed];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8 * a3 + 40) = result;
  return result;
}

- (BOOL)isAtEnd
{
  return self->_nextResourceIndex >= self->_numberOfResources;
}

- (BOOL)isAtBeginning
{
  return self->_nextResourceIndex == self->_initialResourceIndex;
}

- (void)dealloc
{
  free(self->_nUpPlaybackStyleMapping);
  free(self->_titleTextResourceIndexes);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryConcreteSubtimelineScanner;
  [(PXStoryConcreteSubtimelineScanner *)&v3 dealloc];
}

- (void)_initializeDefaultMultipartPanoramaParameters
{
  objc_super v3 = [(PXStoryTimelineStyle *)self->_timelineStyle defaultHorizontalMultipartPanoramaParameters];
  defaultHorizontalMultipartPanoramaParameters = self->_defaultHorizontalMultipartPanoramaParameters;
  self->_defaultHorizontalMultipartPanoramaParameters = v3;

  long long v5 = self->_defaultHorizontalMultipartPanoramaParameters;
  if (v5)
  {
    [(PXStoryMultipartPanoramaParameters *)v5 normalizedKenBurnsEffectParameters];
    PXStoryRectIsNull();
  }
  uint64_t v6 = [(PXStoryTimelineStyle *)self->_timelineStyle defaultVerticalMultipartPanoramaParameters];
  defaultVerticalMultipartPanoramaParameters = self->_defaultVerticalMultipartPanoramaParameters;
  self->_defaultVerticalMultipartPanoramaParameters = v6;

  long long v8 = self->_defaultVerticalMultipartPanoramaParameters;
  if (v8)
  {
    [(PXStoryMultipartPanoramaParameters *)v8 normalizedKenBurnsEffectParameters];
    PXStoryRectIsNull();
  }
  self->_minimumAspectRatioForHorizontalMultipartPanorama = 1.79769313e308;
  self->_maximumAspectRatioForVerticalMultipartPanorama = -1.79769313e308;
}

- (PXStoryConcreteSubtimelineScanner)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PXStoryConcreteSubtimelineScanner;
  long long v5 = [(PXStoryConcreteSubtimelineScanner *)&v55 init];
  if (v5)
  {
    uint64_t v6 = [v4 resourcesDataSource];
    resourcesDataSource = v5->_resourcesDataSource;
    v5->_resourcesDataSource = (PXStoryResourcesDataSource *)v6;

    long long v8 = [v4 spec];
    long long v9 = [v4 style];
    uint64_t v10 = [v9 createRandomNumberGenerators];
    randomNumberGenerators = v5->_randomNumberGenerators;
    v5->_randomNumberGenerators = (NSArray *)v10;

    objc_storeStrong((id *)&v5->_spec, v8);
    long long v12 = v5->_resourcesDataSource;
    long long v13 = v5->_randomNumberGenerators;
    uint64_t v14 = [v4 errorReporter];
    uint64_t v15 = [v9 timelineStyleWithSpec:v8 resourcesDataSource:v12 randomNumberGenerators:v13 errorReporter:v14];
    timelineStyle = v5->_timelineStyle;
    v5->_timelineStyle = (PXStoryTimelineStyle *)v15;

    id v17 = [v4 scorerFactory];
    if (v17)
    {
      int64_t v18 = [v4 scorerFactory];
      uint64_t v19 = ((void (**)(void, PXStoryTimelineStyle *))v18)[2](v18, v5->_timelineStyle);
      timelineScorer = v5->_timelineScorer;
      v5->_timelineScorer = (PXStoryTimelineScorer *)v19;
    }
    else
    {
      uint64_t v21 = [[PXStoryConcreteTimelineScorer alloc] initWithTimelineStyle:v5->_timelineStyle];
      int64_t v18 = (void (**)(void, void))v5->_timelineScorer;
      v5->_timelineScorer = (PXStoryTimelineScorer *)v21;
    }

    v5->_productionOptions = [v4 options];
    [v8 viewportSize];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    [v8 nUpDividerWidth];
    v5->_clipCompositionContext.viewportSize.width = v23;
    v5->_clipCompositionContext.viewportSize.height = v25;
    v5->_clipCompositionContext.dividerWidth = v26;
    v5->_clipCompositionContext.singleAssetAspectRatio = 0.0;
    uint64_t v27 = [(PXStoryResourcesDataSource *)v5->_resourcesDataSource keyAssetResource];
    if (v27) {
      uint64_t v28 = -1;
    }
    else {
      uint64_t v28 = 0;
    }
    v5->_initialResourceIndex = v28;
    v5->_int64_t nextResourceIndex = v28;
    uint64_t v29 = [(PXStoryResourcesDataSource *)v5->_resourcesDataSource numberOfDisplayAssetResources];
    v5->_numberOfResources = v29;
    if (v29 >= 1)
    {
      uint64_t v30 = [(PXStoryResourcesDataSource *)v5->_resourcesDataSource displayAssetResourceAtIndex:0];
      v5->_BOOL firstDisplayAssetIsSameAsKey = [v27 isEqual:v30];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PXStoryConcreteSubtimelineScanner_initWithConfiguration___block_invoke;
    aBlock[3] = &unk_1E5DC0BE0;
    aBlock[4] = v8;
    uint64_t v31 = v5;
    void aBlock[5] = v31;
    id v32 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v33 = v32[2]();
    subtimelineWithClipComposition = v31->_subtimelineWithClipComposition;
    v31->_subtimelineWithClipComposition = (PXStoryMutableConcreteTimeline *)v33;

    uint64_t v35 = ((void (*)(void (**)(void)))v32[2])(v32);
    bestSubtimeline = v31->_bestSubtimeline;
    v31->_bestSubtimeline = (PXStoryMutableConcreteTimeline *)v35;

    uint64_t v37 = ((void (*)(void (**)(void)))v32[2])(v32);
    candidateSubtimeline = v31->_candidateSubtimeline;
    v31->_candidateSubtimeline = (PXStoryMutableConcreteTimeline *)v37;

    uint64_t v39 = ((void (*)(void (**)(void)))v32[2])(v32);
    precedingSubtimeline = v31->_precedingSubtimeline;
    v31->_precedingSubtimeline = (PXStoryMutableConcreteTimeline *)v39;

    uint64_t v41 = ((void (*)(void (**)(void)))v32[2])(v32);
    precedingSubtimelineWithCandidateSubtimeline = v31->_precedingSubtimelineWithCandidateSubtimeline;
    v31->_precedingSubtimelineWithCandidateSubtimeline = (PXStoryMutableConcreteTimeline *)v41;

    uint64_t v43 = ((void (*)(void (**)(void)))v32[2])(v32);
    precedingSubtimelineWithCandidateAndSubsequentSubtimelines = v31->_precedingSubtimelineWithCandidateAndSubsequentSubtimelines;
    v31->_precedingSubtimelineWithCandidateAndSubsequentSubtimelines = (PXStoryMutableConcreteTimeline *)v43;

    uint64_t v45 = ((void (*)(void (**)(void)))v32[2])(v32);
    subtimelineWithRemainingClips = v31->_subtimelineWithRemainingClips;
    v31->_subtimelineWithRemainingClips = (PXStoryMutableConcreteTimeline *)v45;

    uint64_t v47 = ((void (*)(void (**)(void)))v32[2])(v32);
    emptySubtimeline = v31->_emptySubtimeline;
    v31->_emptySubtimeline = (PXStoryMutableConcreteTimeline *)v47;

    id v49 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v50 = 1;
    while (1)
    {
      if (-[PXStoryTimelineStyle isOriginalPlaybackStyleAllowedInNUp:](v5->_timelineStyle, "isOriginalPlaybackStyleAllowedInNUp:", v50))[v49 addIndex:v50]; {
      if (++v50 == 6)
      }
      {
        uint64_t v51 = [v49 copy];
        originalPlaybackStylesAllowedInNUp = v31->_originalPlaybackStylesAllowedInNUp;
        v31->_originalPlaybackStylesAllowedInNUp = (NSIndexSet *)v51;

        _PXGArrayResize();
      }
    }
  }

  return 0;
}

PXStoryMutableConcreteTimeline *__59__PXStoryConcreteSubtimelineScanner_initWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [PXStoryMutableConcreteTimeline alloc];
  [*(id *)(a1 + 32) viewportSize];
  objc_super v3 = -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](v2, "initWithSize:resourcesDataSource:", *(void *)(*(void *)(a1 + 40) + 616));
  return v3;
}

- (PXStoryConcreteSubtimelineScanner)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteSubtimelineScanner.m", 103, @"%s is not available as initializer", "-[PXStoryConcreteSubtimelineScanner init]");

  abort();
}

@end