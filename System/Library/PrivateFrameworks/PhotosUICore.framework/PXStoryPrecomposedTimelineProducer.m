@interface PXStoryPrecomposedTimelineProducer
- (PXStoryPrecomposedTimelineProducer)initWithTimelineKind:(unint64_t)a3;
- (id)_segmentsForTimelineKind:(unint64_t)a3 spec:(id)a4;
- (id)createTimelineWithConfiguration:(id)a3;
- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
- (unint64_t)timelineKind;
- (void)setTimelineKind:(unint64_t)a3;
@end

@implementation PXStoryPrecomposedTimelineProducer

- (void)setTimelineKind:(unint64_t)a3
{
  self->_timelineKind = a3;
}

- (unint64_t)timelineKind
{
  return self->_timelineKind;
}

- (id)_segmentsForTimelineKind:(unint64_t)a3 spec:(id)a4
{
  v155[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 0uLL:
      v106 = [MEMORY[0x1E4F28B00] currentHandler];
      [v106 handleFailureInMethod:a2 object:self file:@"PXStoryPrecomposedTimelineProducer.m" lineNumber:121 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1uLL:
      id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v10 = [_PXStoryPrecomposedTimelineSegment alloc];
      v11 = +[PXStoryClipCompositionFactory oneUpComposition];
      v12 = [(_PXStoryPrecomposedTimelineSegment *)v10 initWithClipComposition:v11 transitionKind:1];
      v155[0] = v12;
      v13 = [_PXStoryPrecomposedTimelineSegment alloc];
      v14 = +[PXStoryClipCompositionFactory oneUpComposition];
      v15 = [(_PXStoryPrecomposedTimelineSegment *)v13 initWithClipComposition:v14 transitionKind:2];
      v155[1] = v15;
      v16 = [_PXStoryPrecomposedTimelineSegment alloc];
      v17 = +[PXStoryClipCompositionFactory oneUpComposition];
      v18 = [(_PXStoryPrecomposedTimelineSegment *)v16 initWithClipComposition:v17 transitionKind:3];
      v155[2] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v155 count:3];
      v20 = (void *)[v9 initWithArray:v19];

      v21 = [(PXStoryPrecomposedTimelineProducer *)self _segmentsForTimelineKind:2 spec:v8];
      [v20 addObjectsFromArray:v21];

      v22 = [(PXStoryPrecomposedTimelineProducer *)self _segmentsForTimelineKind:3 spec:v8];
      [v20 addObjectsFromArray:v22];

      v23 = (void *)[v20 copy];
      goto LABEL_9;
    case 2uLL:
      v24 = [_PXStoryPrecomposedTimelineSegment alloc];
      v150 = v8;
      uint64_t v25 = +[PXStoryClipCompositionFactory oneUpComposition];
      v148 = [(_PXStoryPrecomposedTimelineSegment *)v24 initWithClipComposition:v25 transitionKind:4];
      v154[0] = v148;
      v26 = [_PXStoryPrecomposedTimelineSegment alloc];
      v27 = +[PXStoryClipCompositionFactory oneUpComposition];
      v28 = [(_PXStoryPrecomposedTimelineSegment *)v26 initWithClipComposition:v27 transitionKind:5];
      v154[1] = v28;
      v29 = [_PXStoryPrecomposedTimelineSegment alloc];
      v30 = +[PXStoryClipCompositionFactory oneUpComposition];
      v31 = [(_PXStoryPrecomposedTimelineSegment *)v29 initWithClipComposition:v30 transitionKind:6];
      v154[2] = v31;
      v32 = [_PXStoryPrecomposedTimelineSegment alloc];
      v33 = +[PXStoryClipCompositionFactory oneUpComposition];
      v34 = [(_PXStoryPrecomposedTimelineSegment *)v32 initWithClipComposition:v33 transitionKind:7];
      v154[3] = v34;
      v35 = [_PXStoryPrecomposedTimelineSegment alloc];
      v36 = +[PXStoryClipCompositionFactory oneUpComposition];
      v37 = [(_PXStoryPrecomposedTimelineSegment *)v35 initWithClipComposition:v36 transitionKind:9];
      v154[4] = v37;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:5];

      v8 = v150;
      v20 = (void *)v25;

      goto LABEL_9;
    case 3uLL:
      [v7 viewportSize];
      double v39 = v38;
      v151 = v8;
      [v8 viewportSize];
      double v41 = v40;
      v42 = [_PXStoryPrecomposedTimelineSegment alloc];
      uint64_t v149 = +[PXStoryClipCompositionFactory oneUpComposition];
      if (v39 <= v41)
      {
        v147 = [(_PXStoryPrecomposedTimelineSegment *)v42 initWithClipComposition:v149 transitionKind:1];
        v152[0] = v147;
        v73 = [_PXStoryPrecomposedTimelineSegment alloc];
        v146 = +[PXStoryClipCompositionFactory oneUpComposition];
        v145 = [(_PXStoryPrecomposedTimelineSegment *)v73 initWithClipComposition:v146 transitionKind:8];
        v152[1] = v145;
        v74 = [_PXStoryPrecomposedTimelineSegment alloc];
        v144 = +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition];
        v143 = [(_PXStoryPrecomposedTimelineSegment *)v74 initWithClipComposition:v144 transitionKind:8];
        v152[2] = v143;
        v75 = [_PXStoryPrecomposedTimelineSegment alloc];
        v142 = +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition];
        v141 = [(_PXStoryPrecomposedTimelineSegment *)v75 initWithClipComposition:v142 transitionKind:8];
        v152[3] = v141;
        v76 = [_PXStoryPrecomposedTimelineSegment alloc];
        v140 = +[PXStoryClipCompositionFactory oneUpComposition];
        v139 = [(_PXStoryPrecomposedTimelineSegment *)v76 initWithClipComposition:v140 transitionKind:8];
        v152[4] = v139;
        v77 = [_PXStoryPrecomposedTimelineSegment alloc];
        v138 = +[PXStoryClipCompositionFactory oneUpComposition];
        v137 = [(_PXStoryPrecomposedTimelineSegment *)v77 initWithClipComposition:v138 transitionKind:8];
        v152[5] = v137;
        v78 = [_PXStoryPrecomposedTimelineSegment alloc];
        v136 = +[PXStoryClipCompositionFactory threeUpHorizontalThirdsComposition];
        v135 = [(_PXStoryPrecomposedTimelineSegment *)v78 initWithClipComposition:v136 transitionKind:1];
        v152[6] = v135;
        v79 = [_PXStoryPrecomposedTimelineSegment alloc];
        v134 = +[PXStoryClipCompositionFactory oneUpComposition];
        v133 = [(_PXStoryPrecomposedTimelineSegment *)v79 initWithClipComposition:v134 transitionKind:8];
        v152[7] = v133;
        v80 = [_PXStoryPrecomposedTimelineSegment alloc];
        v132 = +[PXStoryClipCompositionFactory twoUpOneThirdTopTwoThirdsBottomComposition];
        v131 = [(_PXStoryPrecomposedTimelineSegment *)v80 initWithClipComposition:v132 transitionKind:1];
        v152[8] = v131;
        v81 = [_PXStoryPrecomposedTimelineSegment alloc];
        v130 = +[PXStoryClipCompositionFactory oneUpComposition];
        v129 = [(_PXStoryPrecomposedTimelineSegment *)v81 initWithClipComposition:v130 transitionKind:8];
        v152[9] = v129;
        v82 = [_PXStoryPrecomposedTimelineSegment alloc];
        v128 = +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition];
        v127 = [(_PXStoryPrecomposedTimelineSegment *)v82 initWithClipComposition:v128 transitionKind:1];
        v152[10] = v127;
        v83 = [_PXStoryPrecomposedTimelineSegment alloc];
        v126 = +[PXStoryClipCompositionFactory oneUpComposition];
        v125 = [(_PXStoryPrecomposedTimelineSegment *)v83 initWithClipComposition:v126 transitionKind:8];
        v152[11] = v125;
        v84 = [_PXStoryPrecomposedTimelineSegment alloc];
        v124 = +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition];
        v123 = [(_PXStoryPrecomposedTimelineSegment *)v84 initWithClipComposition:v124 transitionKind:1];
        v152[12] = v123;
        v85 = [_PXStoryPrecomposedTimelineSegment alloc];
        v122 = +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition];
        v121 = [(_PXStoryPrecomposedTimelineSegment *)v85 initWithClipComposition:v122 transitionKind:8];
        v152[13] = v121;
        v86 = [_PXStoryPrecomposedTimelineSegment alloc];
        v120 = +[PXStoryClipCompositionFactory oneUpComposition];
        v119 = [(_PXStoryPrecomposedTimelineSegment *)v86 initWithClipComposition:v120 transitionKind:1];
        v152[14] = v119;
        v87 = [_PXStoryPrecomposedTimelineSegment alloc];
        v118 = +[PXStoryClipCompositionFactory twoUpOneThirdTopTwoThirdsBottomComposition];
        v117 = [(_PXStoryPrecomposedTimelineSegment *)v87 initWithClipComposition:v118 transitionKind:8];
        v152[15] = v117;
        v88 = [_PXStoryPrecomposedTimelineSegment alloc];
        v116 = +[PXStoryClipCompositionFactory oneUpComposition];
        v115 = [(_PXStoryPrecomposedTimelineSegment *)v88 initWithClipComposition:v116 transitionKind:1];
        v152[16] = v115;
        v89 = [_PXStoryPrecomposedTimelineSegment alloc];
        v114 = +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition];
        v113 = [(_PXStoryPrecomposedTimelineSegment *)v89 initWithClipComposition:v114 transitionKind:8];
        v152[17] = v113;
        v90 = [_PXStoryPrecomposedTimelineSegment alloc];
        v112 = +[PXStoryClipCompositionFactory oneUpComposition];
        v111 = [(_PXStoryPrecomposedTimelineSegment *)v90 initWithClipComposition:v112 transitionKind:1];
        v152[18] = v111;
        v91 = [_PXStoryPrecomposedTimelineSegment alloc];
        v110 = +[PXStoryClipCompositionFactory twoUpTwoThirdsTopOneThirdBottomComposition];
        v109 = [(_PXStoryPrecomposedTimelineSegment *)v91 initWithClipComposition:v110 transitionKind:8];
        v152[19] = v109;
        v92 = [_PXStoryPrecomposedTimelineSegment alloc];
        v108 = +[PXStoryClipCompositionFactory twoUpOneThirdTopTwoThirdsBottomComposition];
        v107 = [(_PXStoryPrecomposedTimelineSegment *)v92 initWithClipComposition:v108 transitionKind:1];
        v152[20] = v107;
        v93 = [_PXStoryPrecomposedTimelineSegment alloc];
        v94 = +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition];
        v95 = [(_PXStoryPrecomposedTimelineSegment *)v93 initWithClipComposition:v94 transitionKind:8];
        v152[21] = v95;
        v96 = [_PXStoryPrecomposedTimelineSegment alloc];
        v97 = +[PXStoryClipCompositionFactory twoUpHalfTopHalfBottomComposition];
        v98 = [(_PXStoryPrecomposedTimelineSegment *)v96 initWithClipComposition:v97 transitionKind:1];
        v152[22] = v98;
        v99 = [_PXStoryPrecomposedTimelineSegment alloc];
        v100 = +[PXStoryClipCompositionFactory oneUpComposition];
        v101 = [(_PXStoryPrecomposedTimelineSegment *)v99 initWithClipComposition:v100 transitionKind:1];
        v152[23] = v101;
        v102 = [_PXStoryPrecomposedTimelineSegment alloc];
        v103 = +[PXStoryClipCompositionFactory oneUpComposition];
        v104 = [(_PXStoryPrecomposedTimelineSegment *)v102 initWithClipComposition:v103 transitionKind:1];
        v152[24] = v104;
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:25];

        v20 = (void *)v149;
      }
      else
      {
        v147 = [(_PXStoryPrecomposedTimelineSegment *)v42 initWithClipComposition:v149 transitionKind:8];
        v153[0] = v147;
        v43 = [_PXStoryPrecomposedTimelineSegment alloc];
        v146 = +[PXStoryClipCompositionFactory threeUpVerticalThirdsComposition];
        v145 = [(_PXStoryPrecomposedTimelineSegment *)v43 initWithClipComposition:v146 transitionKind:1];
        v153[1] = v145;
        v44 = [_PXStoryPrecomposedTimelineSegment alloc];
        v144 = +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition];
        v143 = [(_PXStoryPrecomposedTimelineSegment *)v44 initWithClipComposition:v144 transitionKind:8];
        v153[2] = v143;
        v45 = [_PXStoryPrecomposedTimelineSegment alloc];
        v142 = +[PXStoryClipCompositionFactory oneUpComposition];
        v141 = [(_PXStoryPrecomposedTimelineSegment *)v45 initWithClipComposition:v142 transitionKind:1];
        v153[3] = v141;
        v46 = [_PXStoryPrecomposedTimelineSegment alloc];
        v140 = +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition];
        v139 = [(_PXStoryPrecomposedTimelineSegment *)v46 initWithClipComposition:v140 transitionKind:8];
        v153[4] = v139;
        v47 = [_PXStoryPrecomposedTimelineSegment alloc];
        v138 = +[PXStoryClipCompositionFactory oneUpComposition];
        v137 = [(_PXStoryPrecomposedTimelineSegment *)v47 initWithClipComposition:v138 transitionKind:1];
        v153[5] = v137;
        v48 = [_PXStoryPrecomposedTimelineSegment alloc];
        v136 = +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition];
        v135 = [(_PXStoryPrecomposedTimelineSegment *)v48 initWithClipComposition:v136 transitionKind:8];
        v153[6] = v135;
        v49 = [_PXStoryPrecomposedTimelineSegment alloc];
        v134 = +[PXStoryClipCompositionFactory oneUpComposition];
        v133 = [(_PXStoryPrecomposedTimelineSegment *)v49 initWithClipComposition:v134 transitionKind:1];
        v153[7] = v133;
        v50 = [_PXStoryPrecomposedTimelineSegment alloc];
        v132 = +[PXStoryClipCompositionFactory oneUpComposition];
        v131 = [(_PXStoryPrecomposedTimelineSegment *)v50 initWithClipComposition:v132 transitionKind:8];
        v153[8] = v131;
        v51 = [_PXStoryPrecomposedTimelineSegment alloc];
        v130 = +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition];
        v129 = [(_PXStoryPrecomposedTimelineSegment *)v51 initWithClipComposition:v130 transitionKind:1];
        v153[9] = v129;
        v52 = [_PXStoryPrecomposedTimelineSegment alloc];
        v128 = +[PXStoryClipCompositionFactory oneUpComposition];
        v127 = [(_PXStoryPrecomposedTimelineSegment *)v52 initWithClipComposition:v128 transitionKind:8];
        v153[10] = v127;
        v53 = [_PXStoryPrecomposedTimelineSegment alloc];
        v126 = +[PXStoryClipCompositionFactory twoUpOneThirdLeadingTwoThirdsTrailingComposition];
        v125 = [(_PXStoryPrecomposedTimelineSegment *)v53 initWithClipComposition:v126 transitionKind:1];
        v153[11] = v125;
        v54 = [_PXStoryPrecomposedTimelineSegment alloc];
        v124 = +[PXStoryClipCompositionFactory oneUpComposition];
        v123 = [(_PXStoryPrecomposedTimelineSegment *)v54 initWithClipComposition:v124 transitionKind:8];
        v153[12] = v123;
        v55 = [_PXStoryPrecomposedTimelineSegment alloc];
        v122 = +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition];
        v121 = [(_PXStoryPrecomposedTimelineSegment *)v55 initWithClipComposition:v122 transitionKind:1];
        v153[13] = v121;
        v56 = [_PXStoryPrecomposedTimelineSegment alloc];
        v120 = +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition];
        v119 = [(_PXStoryPrecomposedTimelineSegment *)v56 initWithClipComposition:v120 transitionKind:8];
        v153[14] = v119;
        v57 = [_PXStoryPrecomposedTimelineSegment alloc];
        v118 = +[PXStoryClipCompositionFactory oneUpComposition];
        v117 = [(_PXStoryPrecomposedTimelineSegment *)v57 initWithClipComposition:v118 transitionKind:1];
        v153[15] = v117;
        v58 = [_PXStoryPrecomposedTimelineSegment alloc];
        v116 = +[PXStoryClipCompositionFactory twoUpTwoThirdsLeadingOneThirdTrailingComposition];
        v115 = [(_PXStoryPrecomposedTimelineSegment *)v58 initWithClipComposition:v116 transitionKind:8];
        v153[16] = v115;
        v59 = [_PXStoryPrecomposedTimelineSegment alloc];
        v114 = +[PXStoryClipCompositionFactory twoUpOneThirdLeadingTwoThirdsTrailingComposition];
        v60 = [(_PXStoryPrecomposedTimelineSegment *)v59 initWithClipComposition:v114 transitionKind:1];
        v153[17] = v60;
        v61 = [_PXStoryPrecomposedTimelineSegment alloc];
        v62 = +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition];
        v63 = [(_PXStoryPrecomposedTimelineSegment *)v61 initWithClipComposition:v62 transitionKind:8];
        v153[18] = v63;
        v64 = [_PXStoryPrecomposedTimelineSegment alloc];
        v65 = +[PXStoryClipCompositionFactory twoUpHalfLeadingHalfTrailingComposition];
        v66 = [(_PXStoryPrecomposedTimelineSegment *)v64 initWithClipComposition:v65 transitionKind:1];
        v153[19] = v66;
        v67 = [_PXStoryPrecomposedTimelineSegment alloc];
        v68 = +[PXStoryClipCompositionFactory oneUpComposition];
        v69 = [(_PXStoryPrecomposedTimelineSegment *)v67 initWithClipComposition:v68 transitionKind:1];
        v153[20] = v69;
        v70 = [_PXStoryPrecomposedTimelineSegment alloc];
        v71 = +[PXStoryClipCompositionFactory oneUpComposition];
        v72 = [(_PXStoryPrecomposedTimelineSegment *)v70 initWithClipComposition:v71 transitionKind:1];
        v153[21] = v72;
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:22];

        v20 = (void *)v149;
      }

      v8 = v151;
LABEL_9:

      break;
    default:
      v23 = 0;
      break;
  }

  return v23;
}

- (id)createTimelineWithConfiguration:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 spec];
  v6 = [PXStoryMutableConcreteTimeline alloc];
  [v5 viewportSize];
  double v8 = v7;
  double v10 = v9;
  v11 = [v4 resourcesDataSource];
  v31 = -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](v6, "initWithSize:resourcesDataSource:", v11, v8, v10);

  v28 = self;
  v32 = v5;
  [(PXStoryPrecomposedTimelineProducer *)self _segmentsForTimelineKind:[(PXStoryPrecomposedTimelineProducer *)self timelineKind] spec:v5];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v60;
    uint64_t v12 = -1;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v12;
      do
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
        v16 = [v15 clipComposition];
        char v17 = [v15 transitionKind];
        uint64_t v18 = [v16 numberOfClips];
        v19 = [v4 resourcesDataSource];
        uint64_t v20 = [v19 numberOfDisplayAssetResources];
        uint64_t v12 = v18 + v14;

        if (v20 < v18 + v14)
        {

          goto LABEL_11;
        }
        v21 = objc_alloc_init(_PXStoryPrecomposedDisplayAssetsFetchResult);
        v22 = [v4 resourcesDataSource];
        -[_PXStoryPrecomposedDisplayAssetsFetchResult configureWithRange:resourcesDataSource:](v21, "configureWithRange:resourcesDataSource:", v14, v18, v22);

        CMTimeMakeWithSeconds(&v54, 4.0, 600);
        *(CMTime *)&v56[8] = v54;
        *(void *)v56 = 0;
        long long v55 = PXStoryTimeZero;
        memset(v58, 0, 40);
        long long v57 = PXStoryTimeMaximum;
        PXStorySegmentClipCompositionInfoFromComposition(v16, (uint64_t)v53);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __70__PXStoryPrecomposedTimelineProducer_createTimelineWithConfiguration___block_invoke;
        v36[3] = &unk_1E5DCEC40;
        id v37 = v16;
        double v38 = v28;
        uint64_t v42 = v18;
        id v39 = v32;
        double v40 = v21;
        id v23 = v4;
        long long v48 = v58[0];
        long long v49 = v58[1];
        long long v44 = v55;
        long long v45 = *(_OWORD *)v56;
        long long v46 = *(_OWORD *)&v56[16];
        long long v47 = v57;
        v33[4] = v58[0];
        v33[5] = v58[1];
        v33[0] = v55;
        v33[1] = *(_OWORD *)v56;
        id v41 = v23;
        uint64_t v43 = v14;
        char v52 = v17;
        uint64_t v50 = *(void *)&v58[2];
        uint64_t v51 = 0;
        v33[2] = *(_OWORD *)&v56[16];
        v33[3] = v57;
        uint64_t v34 = *(void *)&v58[2];
        uint64_t v35 = 0;
        v24 = v21;
        id v25 = v16;
        [(PXStoryMutableConcreteTimeline *)v31 appendSegmentWithDurationInfo:v33 clipCount:v18 compositionInfo:v53 configuration:v36];

        ++v13;
        v14 += v18;
      }
      while (v30 != v13);
      uint64_t v30 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v31;
}

void __70__PXStoryPrecomposedTimelineProducer_createTimelineWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a5;
  uint64_t v7 = a3;
  uint64_t v6 = a2;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) getClipFrames:a4 forContext:*(void *)(a1 + 40) + 8];
  [*(id *)(a1 + 48) safeAreaInsets];
  [*(id *)(a1 + 48) viewportSize];
  PXRectWithOriginAndSize();
}

uint64_t __70__PXStoryPrecomposedTimelineProducer_createTimelineWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 getParametersForNoEffect:*(void *)(a1 + 32) + 40];
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  uint64_t v7 = (void (**)(id, PXStoryProducerResult *))a5;
  id v8 = a3;
  uint64_t v9 = [v8 spec];
  [v9 viewportSize];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  uint64_t v14 = [v8 spec];
  [v14 nUpDividerWidth];
  self->_clipCompositionContext.viewportSize.width = v11;
  self->_clipCompositionContext.viewportSize.height = v13;
  self->_clipCompositionContext.dividerWidth = v15;
  self->_clipCompositionContext.singleAssetAspectRatio = 0.0;

  v16 = [(PXStoryPrecomposedTimelineProducer *)self createTimelineWithConfiguration:v8];

  char v17 = [[PXStoryProducerResult alloc] initWithObject:v16];
  v7[2](v7, v17);

  return 0;
}

- (PXStoryPrecomposedTimelineProducer)initWithTimelineKind:(unint64_t)a3
{
  id v4 = [(PXStoryPrecomposedTimelineProducer *)self init];
  [(PXStoryPrecomposedTimelineProducer *)v4 setTimelineKind:a3];
  return v4;
}

@end