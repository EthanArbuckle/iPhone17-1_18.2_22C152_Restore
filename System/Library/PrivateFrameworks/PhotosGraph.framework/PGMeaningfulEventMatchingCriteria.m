@interface PGMeaningfulEventMatchingCriteria
- (BOOL)interestingForMeaningInference;
- (PGGraphMomentNode)momentNode;
- (PGMeaningfulEventMatchingCriteria)initWithMoment:(id)a3 cache:(id)a4 serviceManager:(id)a5;
- (double)_calculateMatchingScoreForPartOfDayWithMatchingTrait:(id)a3 requiredTrait:(id)a4 requiresStrictMatching:(BOOL)a5;
- (double)matchingScoreWithCriteria:(id)a3 failed:(BOOL *)a4 isReliable:(BOOL *)a5;
- (id)debugDescription;
- (id)matchingResultWithCriteria:(id)a3;
- (void)_calculateMatchingScoreForLocationsWithMatchingTrait:(id)a3 requiredTrait:(id)a4 result:(id)a5;
- (void)_calculateMatchingScoreForPOIROIWithMatchingTrait:(id)a3 requiredTrait:(id)a4 result:(id)a5;
- (void)_calculateMatchingScoreForScenesWithRequiredCriteria:(id)a3 result:(id)a4;
- (void)setInterestingForMeaningInference:(BOOL)a3;
@end

@implementation PGMeaningfulEventMatchingCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setInterestingForMeaningInference:(BOOL)a3
{
  self->_interestingForMeaningInference = a3;
}

- (BOOL)interestingForMeaningInference
{
  return self->_interestingForMeaningInference;
}

- (PGGraphMomentNode)momentNode
{
  return self->_momentNode;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(PGMeaningfulEventMatchingCriteria *)self description];
  v5 = [(PGMeaningfulEventCriteria *)self _debugDescriptionWithMomentNode:self->_momentNode];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (double)_calculateMatchingScoreForPartOfDayWithMatchingTrait:(id)a3 requiredTrait:(id)a4 requiresStrictMatching:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  unsigned __int8 v8 = [a3 value];
  unsigned __int8 v9 = [v7 value];
  uint64_t v10 = [v7 forbiddenValue];
  if (v10 == 1 || (v8 & v10 & 0x3F) == 0)
  {
    v11.i32[0] = v9 & v8 & 0x3F;
    int8x8_t v13 = vcnt_s8(v11);
    v13.i16[0] = vaddlv_u8((uint8x8_t)v13);
    unint64_t v12 = v13.u32[0];
    if (v5)
    {
      v13.i32[0] = v8 & 0x3F;
      uint8x8_t v14 = (uint8x8_t)vcnt_s8(v13);
      v14.i16[0] = vaddlv_u8(v14);
      if (v14.i32[0] > v12) {
        unint64_t v12 = 0;
      }
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  int v15 = [v7 isMatchingRequired];
  double v16 = 1.0;
  if (v15) {
    objc_msgSend(v7, "minimumScore", 1.0);
  }
  double v17 = fmin((double)v12 / v16, 1.0);

  return v17;
}

- (void)_calculateMatchingScoreForLocationsWithMatchingTrait:(id)a3 requiredTrait:(id)a4 result:(id)a5
{
  id v23 = a4;
  unsigned __int8 v8 = (void (**)(void, __n128))a5;
  unsigned __int8 v9 = [a3 nodes];
  uint64_t v10 = [v23 nodes];
  int8x8_t v11 = [v23 negativeNodes];
  unint64_t v12 = [v9 count];
  uint64_t v13 = [v11 count];
  int v14 = [v23 useStrictNegativeNodesMatching];
  if (v13)
  {
    if (v14) {
      unint64_t v15 = v12;
    }
    else {
      unint64_t v15 = 1;
    }
    double v16 = [v11 collectionByIntersecting:v9];
    unint64_t v17 = [v16 count];
    if (v17 && v17 >= v15)
    {
      [(PGMeaningfulEventCriteria *)self isDebug];
      v18.n128_u64[0] = 0;
      v8[2](v8, v18);
LABEL_11:

      goto LABEL_16;
    }
  }
  if ([v10 count])
  {
    double v16 = [v10 collectionByIntersecting:v9];
    double v20 = (double)(unint64_t)[v16 count] / (double)v12;
    [(PGMeaningfulEventCriteria *)self isDebug];
    v21.n128_f64[0] = v20;
    v8[2](v8, v21);
    goto LABEL_11;
  }
  v19.n128_u64[0] = 1.0;
  if (!v12)
  {
    int v22 = objc_msgSend(v23, "skipNegativeRequirementForMissingLocation", 1.0);
    v19.n128_u64[0] = 0;
    if (v22) {
      v19.n128_f64[0] = 1.0;
    }
  }
  v8[2](v8, v19);
LABEL_16:
}

- (void)_calculateMatchingScoreForPOIROIWithMatchingTrait:(id)a3 requiredTrait:(id)a4 result:(id)a5
{
  id v8 = a4;
  unsigned __int8 v9 = (void (**)(void, double))a5;
  uint64_t v10 = [a3 nodes];
  int8x8_t v11 = [v8 nodes];
  unint64_t v12 = [v8 negativeNodes];
  uint64_t v13 = [v11 count];
  int v14 = self->_momentNode;
  if ([v12 count])
  {
    int v22 = v10;
    unint64_t v15 = [v12 collectionByIntersecting:v10];
    uint64_t v16 = [v15 count];
    if (v16)
    {
      if (![(PGMeaningfulEventCriteria *)self isDebug])
      {
        v9[2](v9, 0.0);

        uint64_t v10 = v22;
        goto LABEL_11;
      }
      __n128 v21 = [(PGGraphMomentNode *)v14 collection];
      unint64_t v17 = +[PGGraphEdgeCollection edgesFromNodes:v21 toNodes:v15];
      [v17 enumerateEdgesUsingBlock:&__block_literal_global_283];
    }
    uint64_t v10 = v22;
  }
  else
  {
    uint64_t v16 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForPOIROIWithMatchingTrait_requiredTrait_result___block_invoke_2;
  aBlock[3] = &unk_1E68E7EF8;
  uint64_t v27 = v13;
  aBlock[4] = self;
  v24 = v14;
  uint64_t v28 = v16;
  id v25 = v8;
  id v18 = v10;
  id v26 = v18;
  __n128 v19 = (void (**)(void *, void *))_Block_copy(aBlock);
  double v20 = [v11 collectionByIntersecting:v18];
  v19[2](v19, v20);
  if (v9) {
    ((void (*)(void (**)(void, double)))v9[2])(v9);
  }

LABEL_11:
}

double __108__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForPOIROIWithMatchingTrait_requiredTrait_result___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 64)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  uint64_t v6 = [v3 count];
  if (v6)
  {
    unint64_t v7 = v6;
    if ([*(id *)(a1 + 32) isDebug])
    {
      id v8 = [*(id *)(a1 + 40) collection];
      unsigned __int8 v9 = +[PGGraphEdgeCollection edgesFromNodes:v8 toNodes:v4];
      [v9 enumerateEdgesUsingBlock:&__block_literal_global_285];
    }
    if (!*(void *)(a1 + 72))
    {
      int v14 = [*(id *)(a1 + 48) additionalMatchingBlock];

      if (!v14
        || ([*(id *)(a1 + 48) additionalMatchingBlock],
            unint64_t v15 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
            int v16 = ((uint64_t (**)(void, void *, void))v15)[2](v15, v4, *(void *)(a1 + 40)),
            v15,
            v16))
      {
        uint64_t v17 = *(void *)(a1 + 64);
        double v5 = 1.0;
        if (v17 != 1)
        {
          BOOL v18 = v17 == 2;
          unint64_t v19 = 1;
          if (!v18) {
            unint64_t v19 = 2;
          }
          double v20 = ((double)v7 + -1.0) / (double)v19;
          if (v20 >= 1.0) {
            double v5 = 1.0;
          }
          else {
            double v5 = v20 * 0.25 + 0.75;
          }
        }
      }
    }
    if ([*(id *)(a1 + 32) isDebug])
    {
      uint64_t v10 = [v4 collectionBySubtracting:*(void *)(a1 + 56)];
      int8x8_t v11 = [*(id *)(a1 + 40) collection];
      unint64_t v12 = +[PGGraphEdgeCollection edgesFromNodes:v11 toNodes:v10];
      [v12 enumerateEdgesUsingBlock:&__block_literal_global_287];
    }
  }

  return v5;
}

- (void)_calculateMatchingScoreForScenesWithRequiredCriteria:(id)a3 result:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void (**)(void, double, double))a4;
  id v8 = [(PGMeaningfulEventCriteria *)self scenesTrait];
  v41 = v6;
  unsigned __int8 v9 = [v6 scenesTrait];
  v40 = v8;
  uint64_t v10 = [v8 nodes];
  int8x8_t v11 = [v9 nodes];
  unint64_t v12 = [v9 negativeNodes];
  v39 = v11;
  uint64_t v13 = [v11 count];
  char v14 = [v9 accumulateHighConfidenceAssetCounts];
  unint64_t v15 = self->_momentNode;
  BOOL v16 = [(PGMeaningfulEventCriteria *)self isDebug];
  v42 = v15;
  v43 = v10;
  v38 = v12;
  if ([v12 count])
  {
    uint64_t v17 = [v12 collectionByIntersecting:v10];
    BOOL v18 = [(PGGraphMomentNode *)v15 collection];
    unint64_t v19 = +[PGGraphSceneEdge filterWithMinimumNumberOfHighConfidenceAssets:](PGGraphSceneEdge, "filterWithMinimumNumberOfHighConfidenceAssets:", [v9 minimumNumberOfNegativeHighConfidenceAssets]);
    double v20 = +[MAEdgeCollection edgesFromNodes:v18 toNodes:v17 matchingFilter:v19];

    if ([v20 count])
    {
      __n128 v21 = v41;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        v35 = [(PGMeaningfulEventMatchingCriteria *)self momentNode];
        v36 = [v35 name];
        v37 = [v41 identifier];
        *(_DWORD *)buf = 138478083;
        v52 = v36;
        __int16 v53 = 2114;
        v54 = v37;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[MeaningInference] Moment %{private}@ matched negative scenes for identifier %{public}@", buf, 0x16u);
      }
      v7[2](v7, 0.0, 0.0);

      int v22 = v39;
      goto LABEL_12;
    }

    unint64_t v15 = v42;
    uint64_t v10 = v43;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke;
  aBlock[3] = &unk_1E68E7EB0;
  uint64_t v48 = v13;
  BOOL v49 = v16;
  id v23 = v15;
  v45 = v23;
  id v46 = v9;
  char v50 = v14;
  id v24 = v10;
  id v47 = v24;
  id v25 = (double (**)(void *, void *))_Block_copy(aBlock);
  int v22 = v39;
  id v26 = [v39 collectionByIntersecting:v24];
  cache = self->_cache;
  uint64_t v28 = [(PGGraphMomentNode *)v23 collection];
  v29 = [(PGMeaningfulEventProcessorCache *)cache reliableSceneNodesForMomentNodes:v28];
  v30 = [v26 collectionByIntersecting:v29];

  double v31 = v25[2](v25, v26);
  uint64_t v32 = [v26 count];
  uint64_t v33 = [v30 count];
  v34.n128_f64[0] = v31;
  if (v32 != v33) {
    v34.n128_u64[0] = v25[2](v25, v30);
  }
  if (v7) {
    ((void (*)(void (**)(void, double, double), double, __n128))v7[2])(v7, v31, v34);
  }

  uint64_t v17 = v45;
  __n128 v21 = v41;
LABEL_12:
}

double __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 56)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  uint64_t v6 = [v3 count];
  if (v6)
  {
    unint64_t v7 = v6;
    if (*(unsigned char *)(a1 + 64))
    {
      id v8 = [*(id *)(a1 + 32) collection];
      unsigned __int8 v9 = +[PGGraphEdgeCollection edgesFromNodes:v8 toNodes:v4];

      [v9 enumerateEdgesUsingBlock:&__block_literal_global_27164];
    }
    double v10 = (double)v7;
    double v11 = (double)v7 / (double)*(unint64_t *)(a1 + 56);
    [*(id *)(a1 + 40) minimumScore];
    if (v11 >= v12)
    {
      double v13 = v12;
      char v14 = [*(id *)(a1 + 40) additionalMatchingBlock];

      if (!v14
        || ([*(id *)(a1 + 40) additionalMatchingBlock],
            unint64_t v15 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
            int v16 = ((uint64_t (**)(void, void *, void))v15)[2](v15, v4, *(void *)(a1 + 32)),
            v15,
            v16))
      {
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2020000000;
        uint64_t v45 = 0;
        unint64_t v17 = [*(id *)(a1 + 40) minimumNumberOfHighConfidenceAssets];
        uint64_t v38 = 0;
        v39 = &v38;
        uint64_t v40 = 0x2020000000;
        uint64_t v41 = 0;
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x2020000000;
        uint64_t v37 = 0;
        BOOL v18 = [*(id *)(a1 + 32) collection];
        unint64_t v19 = +[PGGraphEdgeCollection edgesFromNodes:v18 toNodes:v4];

        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke_3;
        v27[3] = &unk_1E68E7E88;
        id v28 = *(id *)(a1 + 32);
        id v29 = *(id *)(a1 + 40);
        v30 = &v34;
        double v31 = &v38;
        uint64_t v32 = &v42;
        unint64_t v33 = v17;
        [v19 enumerateEdgesUsingBlock:v27];
        double v20 = (double)*(unint64_t *)(a1 + 56);
        if (*(unsigned char *)(a1 + 65)) {
          BOOL v22 = v10 / v20 >= v13 && v39[3] >= v17;
        }
        else {
          BOOL v22 = (double)(unint64_t)v43[3] / v20 >= v13;
        }
        if (v22 && (double)(unint64_t)v35[3] / v20 >= v13) {
          double v5 = 1.0;
        }
        else {
          double v5 = 0.0;
        }

        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(&v42, 8);
      }
    }
  }
  if (*(unsigned char *)(a1 + 64))
  {
    id v23 = [*(id *)(a1 + 48) collectionBySubtracting:v4];
    id v24 = [*(id *)(a1 + 32) collection];
    id v25 = +[PGGraphEdgeCollection edgesFromNodes:v24 toNodes:v23];

    [v25 enumerateEdgesUsingBlock:&__block_literal_global_278];
  }

  return v5;
}

void __97__PGMeaningfulEventMatchingCriteria__calculateMatchingScoreForScenesWithRequiredCriteria_result___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 numberOfHighConfidenceAssets];
  double v5 = (double)v4 / (double)(unint64_t)[*(id *)(a1 + 32) numberOfAssets];
  [*(id *)(a1 + 40) minimumRatioOfHighConfidenceAssets];
  if (v5 >= v6) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v7 = [v3 numberOfSearchConfidenceAssets];

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v7 + v4;
  if (v7 + v4 >= *(void *)(a1 + 72)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
}

- (double)matchingScoreWithCriteria:(id)a3 failed:(BOOL *)a4 isReliable:(BOOL *)a5
{
  id v7 = a3;
  BOOL v8 = [(PGMeaningfulEventCriteria *)self isDebug];
  uint64_t v9 = 1;
  if (!v8) {
    uint64_t v9 = objc_msgSend(v7, "isDebug", 1);
  }
  [(PGMeaningfulEventCriteria *)self setDebug:v9];
  uint64_t v264 = 0;
  v265 = (double *)&v264;
  uint64_t v266 = 0x2020000000;
  uint64_t v267 = 0;
  uint64_t v260 = 0;
  v261 = (double *)&v260;
  uint64_t v262 = 0x2020000000;
  uint64_t v263 = 0;
  uint64_t v256 = 0;
  v257 = (double *)&v256;
  uint64_t v258 = 0x2020000000;
  uint64_t v259 = 0;
  uint64_t v252 = 0;
  v253 = (double *)&v252;
  uint64_t v254 = 0x2020000000;
  uint64_t v255 = 0;
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  char v251 = 1;
  double v10 = [v7 numberOfPeopleTrait];
  unsigned int v218 = [v10 isMatchingRequired];

  double v11 = [v7 peopleTrait];
  int v217 = [v11 isMatchingRequired];

  double v12 = [v7 socialGroupsTrait];
  int v216 = [v12 isMatchingRequired];

  double v13 = [v7 locationsTrait];
  int v215 = [v13 isMatchingRequired];

  char v14 = [v7 datesTrait];
  int v212 = [v14 isMatchingRequired];

  unint64_t v15 = [v7 scenesTrait];
  int v206 = [v15 isMatchingRequired];

  int v16 = [v7 roisTrait];
  int v210 = [v16 isMatchingRequired];

  unint64_t v17 = [v7 poisTrait];
  int v209 = [v17 isMatchingRequired];

  BOOL v18 = [v7 minimumDurationTrait];
  int v214 = [v18 isMatchingRequired];

  unint64_t v19 = [v7 maximumDurationTrait];
  int v211 = [v19 isMatchingRequired];

  double v20 = [v7 significantPartsOfDayTrait];
  int v205 = [v20 isMatchingRequired];

  __n128 v21 = [v7 allPartsOfDayTrait];
  int v204 = [v21 isMatchingRequired];

  BOOL v22 = [v7 locationMobilityTrait];
  int v213 = [v22 isMatchingRequired];

  id v23 = [v7 publicEventCategoriesTrait];
  int v207 = [v23 isMatchingRequired];

  id v24 = [v7 numberOfPeopleTrait];
  int v25 = [v24 isActive];

  if (v25)
  {
    id v26 = [v7 numberOfPeopleTrait];
    [v26 value];
    double v28 = v27;

    id v29 = [(PGMeaningfulEventCriteria *)self numberOfPeopleTrait];
    [v29 value];
    double v31 = v30;

    double v32 = 1.0;
    if (v218)
    {
      unint64_t v33 = [v7 numberOfPeopleTrait];
      [v33 minimumScore];
      double v32 = v34;
    }
    [v7 minimumScore];
    double v35 = (double)(unint64_t)v31 / (double)(unint64_t)v28;
    double v200 = fmin(v35 / v32 * v36, 1.0);
    if (v35 < v32) {
      BOOL v37 = v218;
    }
    else {
      BOOL v37 = 0;
    }
    unint64_t v38 = v218;
    if (v218) {
      double v39 = v200 + 0.0;
    }
    else {
      double v39 = 0.0;
    }
  }
  else
  {
    BOOL v37 = 0;
    unint64_t v38 = 0;
    double v200 = 0.0;
    double v39 = 0.0;
  }
  uint64_t v40 = [v7 locationMobilityTrait];
  double v41 = 0.0;
  if ([v40 isActive])
  {
    if (v37)
    {
      BOOL v42 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v42)
      {
        BOOL v37 = 1;
        goto LABEL_27;
      }
    }
    else
    {
    }
    uint64_t v40 = [v7 locationMobilityTrait];
    uint64_t v43 = [v40 value];
    uint64_t v44 = [(PGMeaningfulEventCriteria *)self locationMobilityTrait];
    uint64_t v45 = [v44 value];

    double v46 = 1.0;
    if (v43 == v45) {
      double v47 = 1.0;
    }
    else {
      double v47 = 0.0;
    }
    if (v213)
    {
      [v40 minimumScore];
      double v46 = v48;
    }
    [v7 minimumScore];
    double v41 = fmin(v47 / v46 * v49, 1.0);
    if (v213)
    {
      double v39 = v39 + v41;
      ++v38;
      if (v47 < v46) {
        BOOL v37 = 1;
      }
    }
  }

LABEL_27:
  char v50 = [v7 significantPartsOfDayTrait];
  double v203 = 0.0;
  if (![v50 isActive])
  {
LABEL_35:

    goto LABEL_36;
  }
  if (v37)
  {
    BOOL v51 = [(PGMeaningfulEventCriteria *)self isDebug];

    if (!v51)
    {
      BOOL v37 = 1;
      double v203 = 0.0;
      goto LABEL_36;
    }
  }
  else
  {
  }
  v52 = [(PGMeaningfulEventCriteria *)self significantPartsOfDayTrait];
  __int16 v53 = [v7 significantPartsOfDayTrait];
  [(PGMeaningfulEventMatchingCriteria *)self _calculateMatchingScoreForPartOfDayWithMatchingTrait:v52 requiredTrait:v53 requiresStrictMatching:0];
  double v55 = v54;

  [v7 minimumScore];
  double v203 = fmin(v55 * v56, 1.0);
  if (v205)
  {
    char v50 = [v7 significantPartsOfDayTrait];
    [v50 minimumScore];
    double v39 = v39 + v203;
    ++v38;
    if (v55 < v57) {
      BOOL v37 = 1;
    }
    goto LABEL_35;
  }
LABEL_36:
  v58 = [v7 allPartsOfDayTrait];
  double v202 = 0.0;
  if (![v58 isActive])
  {
LABEL_44:

    goto LABEL_45;
  }
  if (v37)
  {
    BOOL v59 = [(PGMeaningfulEventCriteria *)self isDebug];

    if (!v59)
    {
      BOOL v37 = 1;
      double v202 = 0.0;
      goto LABEL_45;
    }
  }
  else
  {
  }
  v60 = [(PGMeaningfulEventCriteria *)self allPartsOfDayTrait];
  v61 = [v7 allPartsOfDayTrait];
  [(PGMeaningfulEventMatchingCriteria *)self _calculateMatchingScoreForPartOfDayWithMatchingTrait:v60 requiredTrait:v61 requiresStrictMatching:0];
  double v63 = v62;

  [v7 minimumScore];
  double v202 = fmin(v63 * v64, 1.0);
  if (v204)
  {
    v58 = [v7 allPartsOfDayTrait];
    [v58 minimumScore];
    double v39 = v39 + v202;
    ++v38;
    if (v63 < v65) {
      BOOL v37 = 1;
    }
    goto LABEL_44;
  }
LABEL_45:
  v66 = [v7 minimumDurationTrait];
  if (![v66 isActive])
  {

    goto LABEL_50;
  }
  if (v37)
  {
    BOOL v67 = [(PGMeaningfulEventCriteria *)self isDebug];

    if (!v67)
    {
      BOOL v37 = 1;
LABEL_50:
      double v199 = 0.0;
      goto LABEL_57;
    }
  }
  else
  {
  }
  v68 = [v7 minimumDurationTrait];
  [v68 value];
  double v70 = v69;

  v71 = [(PGMeaningfulEventCriteria *)self minimumDurationTrait];
  [v71 value];
  double v73 = v72;

  double v74 = 1.0;
  if (v214)
  {
    v75 = [v7 minimumDurationTrait];
    [v75 minimumScore];
    double v74 = v76;
  }
  [v7 minimumScore];
  double v78 = fmin(v73 / v70 / v74 * v77, 1.0);
  double v199 = v78;
  if (v214)
  {
    double v39 = v39 + v78;
    ++v38;
    if (v73 / v70 < v74) {
      BOOL v37 = 1;
    }
  }
LABEL_57:
  v79 = [v7 maximumDurationTrait];
  if (![v79 isActive])
  {

    goto LABEL_62;
  }
  if (v37)
  {
    BOOL v80 = [(PGMeaningfulEventCriteria *)self isDebug];

    if (!v80)
    {
      BOOL v37 = 1;
LABEL_62:
      objc_msgSend(v7, "peopleTrait", 0);
      goto LABEL_70;
    }
  }
  else
  {
  }
  v81 = [v7 maximumDurationTrait];
  [v81 value];
  double v83 = v82;

  v84 = [(PGMeaningfulEventCriteria *)self maximumDurationTrait];
  [v84 value];
  double v86 = v85;

  double v87 = 1.0;
  if (v211)
  {
    v88 = [v7 maximumDurationTrait];
    [v88 minimumScore];
    double v87 = v89;
  }
  [v7 minimumScore];
  double v90 = 1.0 - v86 / v83;
  double v92 = fmin(v90 / v87 * v91, 1.0);
  if (v211)
  {
    double v39 = v39 + v92;
    ++v38;
    if (v90 < v87) {
      BOOL v37 = 1;
    }
  }
  objc_msgSend(v7, "peopleTrait", *(void *)&v92);
  v93 = LABEL_70:;
  double v94 = 0.0;
  v208 = a5;
  if ([v93 isActive])
  {
    if (v37)
    {
      BOOL v95 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v95)
      {
        BOOL v37 = 1;
        goto LABEL_82;
      }
    }
    else
    {
    }
    v96 = [v7 peopleTrait];
    v93 = [v96 nodes];

    v97 = [(PGMeaningfulEventCriteria *)self peopleTrait];
    v98 = [v97 nodes];

    v99 = [v93 collectionByIntersecting:v98];
    unint64_t v100 = [v99 count];
    unint64_t v101 = [v93 count];
    double v102 = 1.0;
    if (v217)
    {
      v103 = [v7 peopleTrait];
      [v103 minimumScore];
      double v102 = v104;
    }
    [v7 minimumScore];
    double v105 = (double)v100 / (double)v101;
    double v94 = fmin(v105 / v102 * v106, 1.0);
    if (v217)
    {
      double v39 = v39 + v94;
      ++v38;
      if (v105 < v102) {
        BOOL v37 = 1;
      }
    }
    [(PGMeaningfulEventCriteria *)self isDebug];

    a5 = v208;
  }

LABEL_82:
  v107 = [v7 socialGroupsTrait];
  double v108 = 0.0;
  if ([v107 isActive])
  {
    if (v37)
    {
      BOOL v109 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v109)
      {
        BOOL v37 = 1;
        goto LABEL_94;
      }
    }
    else
    {
    }
    v110 = [v7 socialGroupsTrait];
    v107 = [v110 nodes];

    v111 = [(PGMeaningfulEventCriteria *)self socialGroupsTrait];
    v112 = [v111 nodes];

    v113 = [v107 collectionByIntersecting:v112];
    unint64_t v114 = [v113 count];
    unint64_t v115 = [v107 count];
    double v116 = 1.0;
    if (v216)
    {
      v117 = [v7 socialGroupsTrait];
      [v117 minimumScore];
      double v116 = v118;
    }
    [v7 minimumScore];
    double v119 = (double)v114 / (double)v115;
    double v108 = fmin(v119 / v116 * v120, 1.0);
    if (v216)
    {
      double v39 = v39 + v108;
      ++v38;
      if (v119 < v116) {
        BOOL v37 = 1;
      }
    }
    [(PGMeaningfulEventCriteria *)self isDebug];

    a5 = v208;
  }

LABEL_94:
  v121 = [v7 locationsTrait];
  if ([v121 isActive])
  {
    if (v37)
    {
      BOOL v122 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v122)
      {
        BOOL v37 = 1;
        goto LABEL_104;
      }
    }
    else
    {
    }
    v123 = [v7 locationsTrait];
    [v123 minimumScore];
    double v125 = v124;

    uint64_t v244 = 0;
    v245 = (double *)&v244;
    uint64_t v246 = 0x2020000000;
    uint64_t v247 = 0;
    v126 = [(PGMeaningfulEventCriteria *)self locationsTrait];
    v127 = [v7 locationsTrait];
    v238[0] = MEMORY[0x1E4F143A8];
    v238[1] = 3221225472;
    v238[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke;
    v238[3] = &unk_1E68E7E18;
    char v243 = v215;
    double v242 = v125;
    v240 = &v244;
    v241 = &v264;
    id v239 = v7;
    [(PGMeaningfulEventMatchingCriteria *)self _calculateMatchingScoreForLocationsWithMatchingTrait:v126 requiredTrait:v127 result:v238];

    if (v215)
    {
      double v39 = v39 + v265[3];
      ++v38;
      if (v245[3] < v125) {
        BOOL v37 = 1;
      }
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {
  }
LABEL_104:
  v128 = [v7 datesTrait];
  double v129 = 0.0;
  if ([v128 isActive])
  {
    if (v37)
    {
      BOOL v130 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v130)
      {
        BOOL v37 = 1;
        goto LABEL_119;
      }
    }
    else
    {
    }
    v131 = [v7 datesTrait];
    v128 = [v131 nodes];

    v132 = [(PGMeaningfulEventCriteria *)self datesTrait];
    v133 = [v132 nodes];

    v134 = [v128 collectionByIntersecting:v133];
    double v135 = 1.0;
    if ([v134 count]) {
      double v136 = 1.0;
    }
    else {
      double v136 = 0.0;
    }
    if (v212)
    {
      v137 = [v7 datesTrait];
      [v137 minimumScore];
      double v135 = v138;
    }
    [v7 minimumScore];
    double v129 = fmin(v136 / v135 * v139, 1.0);
    if (v212)
    {
      double v39 = v39 + v129;
      ++v38;
      if (v136 < v135) {
        BOOL v37 = 1;
      }
    }

    a5 = v208;
  }

LABEL_119:
  v140 = [v7 scenesTrait];
  if ([v140 isActive])
  {
    if (v37)
    {
      BOOL v141 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v141)
      {
        BOOL v37 = 1;
        goto LABEL_129;
      }
    }
    else
    {
    }
    v142 = [v7 scenesTrait];
    [v142 minimumScore];
    double v144 = v143;

    uint64_t v244 = 0;
    v245 = (double *)&v244;
    uint64_t v246 = 0x2020000000;
    uint64_t v247 = 0;
    v231[0] = MEMORY[0x1E4F143A8];
    v231[1] = 3221225472;
    v231[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_2;
    v231[3] = &unk_1E68E7E40;
    double v236 = v144;
    v233 = &v248;
    v234 = &v244;
    char v237 = v206;
    v235 = &v260;
    id v232 = v7;
    [(PGMeaningfulEventMatchingCriteria *)self _calculateMatchingScoreForScenesWithRequiredCriteria:v232 result:v231];
    if (v206)
    {
      double v39 = v39 + v261[3];
      ++v38;
      if (v245[3] < v144) {
        BOOL v37 = 1;
      }
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {
  }
LABEL_129:
  v145 = [v7 roisTrait];
  if ([v145 isActive])
  {
    if (v37)
    {
      BOOL v146 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v146)
      {
        BOOL v37 = 1;
        goto LABEL_139;
      }
    }
    else
    {
    }
    v147 = [v7 roisTrait];
    [v147 minimumScore];
    double v149 = v148;

    uint64_t v244 = 0;
    v245 = (double *)&v244;
    uint64_t v246 = 0x2020000000;
    uint64_t v247 = 0;
    v150 = [(PGMeaningfulEventCriteria *)self roisTrait];
    v151 = [v7 roisTrait];
    v225[0] = MEMORY[0x1E4F143A8];
    v225[1] = 3221225472;
    v225[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_3;
    v225[3] = &unk_1E68E7E18;
    char v230 = v210;
    double v229 = v149;
    v227 = &v244;
    v228 = &v256;
    id v226 = v7;
    [(PGMeaningfulEventMatchingCriteria *)self _calculateMatchingScoreForPOIROIWithMatchingTrait:v150 requiredTrait:v151 result:v225];

    if (v210)
    {
      double v39 = v39 + v257[3];
      ++v38;
      if (v245[3] < v149) {
        BOOL v37 = 1;
      }
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {
  }
LABEL_139:
  v152 = [v7 poisTrait];
  if ([v152 isActive])
  {
    if (v37)
    {
      BOOL v153 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v153)
      {
        BOOL v37 = 1;
        goto LABEL_149;
      }
    }
    else
    {
    }
    v154 = [v7 poisTrait];
    [v154 minimumScore];
    double v156 = v155;

    uint64_t v244 = 0;
    v245 = (double *)&v244;
    uint64_t v246 = 0x2020000000;
    uint64_t v247 = 0;
    v157 = [(PGMeaningfulEventCriteria *)self poisTrait];
    v158 = [v7 poisTrait];
    v219[0] = MEMORY[0x1E4F143A8];
    v219[1] = 3221225472;
    v219[2] = __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_4;
    v219[3] = &unk_1E68E7E18;
    char v224 = v209;
    double v223 = v156;
    v221 = &v244;
    v222 = &v252;
    id v220 = v7;
    [(PGMeaningfulEventMatchingCriteria *)self _calculateMatchingScoreForPOIROIWithMatchingTrait:v157 requiredTrait:v158 result:v219];

    if (v209)
    {
      double v39 = v39 + v253[3];
      ++v38;
      if (v245[3] < v156) {
        BOOL v37 = 1;
      }
    }

    _Block_object_dispose(&v244, 8);
  }
  else
  {
  }
LABEL_149:
  v159 = [v7 publicEventCategoriesTrait];
  double v160 = 0.0;
  if ([v159 isActive])
  {
    if (v37)
    {
      BOOL v161 = [(PGMeaningfulEventCriteria *)self isDebug];

      if (!v161)
      {
        BOOL v37 = 1;
        if (!v38) {
          goto LABEL_153;
        }
LABEL_163:
        double v162 = v39 / (double)v38;
        if (!v37) {
          goto LABEL_165;
        }
LABEL_164:
        if (![(PGMeaningfulEventCriteria *)self isDebug]) {
          goto LABEL_220;
        }
        goto LABEL_165;
      }
    }
    else
    {
    }
    v163 = [v7 publicEventCategoriesTrait];
    v159 = [v163 nodes];

    v164 = [(PGMeaningfulEventCriteria *)self publicEventCategoriesTrait];
    v165 = [v164 nodes];

    v166 = [v159 collectionByIntersecting:v165];
    unint64_t v167 = [v166 count];
    unint64_t v168 = [v159 count];
    double v169 = 1.0;
    if (v207)
    {
      v170 = [v7 publicEventCategoriesTrait];
      [v170 minimumScore];
      double v169 = v171;
    }
    [v7 minimumScore];
    double v172 = (double)v167 / (double)v168;
    double v160 = fmin(v172 / v169 * v173, 1.0);
    if (v207)
    {
      double v39 = v39 + v160;
      ++v38;
      if (v172 < v169) {
        BOOL v37 = 1;
      }
    }

    a5 = v208;
  }

  if (v38) {
    goto LABEL_163;
  }
LABEL_153:
  double v162 = 0.0;
  if (v37) {
    goto LABEL_164;
  }
LABEL_165:
  v174 = [v7 numberOfPeopleTrait];
  if (([v174 isActive] ^ 1 | v218))
  {
  }
  else
  {

    double v175 = v200;
    if (v200 >= v162)
    {
      double v39 = v200 + v39;
      ++v38;
    }
  }
  v176 = objc_msgSend(v7, "peopleTrait", v175);
  if (([v176 isActive] ^ 1 | v217))
  {
  }
  else
  {

    if (v94 >= v162)
    {
      double v39 = v94 + v39;
      ++v38;
    }
  }
  v177 = [v7 socialGroupsTrait];
  if (([v177 isActive] ^ 1 | v216))
  {
  }
  else
  {

    if (v108 >= v162)
    {
      double v39 = v108 + v39;
      ++v38;
    }
  }
  v178 = [v7 locationsTrait];
  if (([v178 isActive] ^ 1 | v215))
  {
  }
  else
  {
    double v179 = v265[3];

    if (v179 >= v162)
    {
      double v39 = v39 + v265[3];
      ++v38;
    }
  }
  v180 = [v7 datesTrait];
  if (([v180 isActive] ^ 1 | v212))
  {
  }
  else
  {

    if (v129 >= v162)
    {
      double v39 = v129 + v39;
      ++v38;
    }
  }
  v181 = [v7 scenesTrait];
  if (([v181 isActive] ^ 1 | v206))
  {
  }
  else
  {
    double v182 = v261[3];

    if (v182 >= v162)
    {
      double v39 = v39 + v261[3];
      ++v38;
    }
  }
  v183 = [v7 roisTrait];
  if (([v183 isActive] ^ 1 | v210))
  {
  }
  else
  {
    double v184 = v257[3];

    if (v184 >= v162)
    {
      double v39 = v39 + v257[3];
      ++v38;
    }
  }
  v185 = [v7 poisTrait];
  if (([v185 isActive] ^ 1 | v209))
  {
  }
  else
  {
    double v186 = v253[3];

    if (v186 >= v162)
    {
      double v39 = v39 + v253[3];
      ++v38;
    }
  }
  v187 = [v7 minimumDurationTrait];
  if (([v187 isActive] ^ 1 | v214))
  {
  }
  else
  {

    double v188 = v199;
    if (v199 >= v162)
    {
      double v39 = v199 + v39;
      ++v38;
    }
  }
  v189 = objc_msgSend(v7, "maximumDurationTrait", v188);
  if (([v189 isActive] ^ 1 | v211))
  {
  }
  else
  {

    double v190 = v198;
    if (v198 >= v162)
    {
      double v39 = v198 + v39;
      ++v38;
    }
  }
  v191 = objc_msgSend(v7, "significantPartsOfDayTrait", v190);
  if (([v191 isActive] ^ 1 | v205))
  {
  }
  else
  {

    double v192 = v203;
    if (v203 >= v162)
    {
      double v39 = v203 + v39;
      ++v38;
    }
  }
  v193 = objc_msgSend(v7, "allPartsOfDayTrait", v192);
  if (([v193 isActive] ^ 1 | v204))
  {
  }
  else
  {

    double v194 = v202;
    if (v202 >= v162)
    {
      double v39 = v202 + v39;
      ++v38;
    }
  }
  v195 = objc_msgSend(v7, "locationMobilityTrait", v194);
  if (([v195 isActive] ^ 1 | v213))
  {
  }
  else
  {

    if (v41 >= v162)
    {
      double v39 = v41 + v39;
      ++v38;
    }
  }
  v196 = [v7 publicEventCategoriesTrait];
  if (([v196 isActive] ^ 1 | v207))
  {
  }
  else
  {

    if (v160 >= v162)
    {
      double v39 = v160 + v39;
      ++v38;
      goto LABEL_223;
    }
  }
LABEL_220:
  if (v38) {
LABEL_223:
  }
    double v39 = v39 / (double)v38;
  if (a4) {
    *a4 = v37;
  }
  if (a5) {
    *a5 = *((unsigned char *)v249 + 24);
  }
  _Block_object_dispose(&v248, 8);
  _Block_object_dispose(&v252, 8);
  _Block_object_dispose(&v256, 8);
  _Block_object_dispose(&v260, 8);
  _Block_object_dispose(&v264, 8);

  return v39;
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  double v3 = 1.0;
  if (*(unsigned char *)(a1 + 64)) {
    double v3 = *(double *)(a1 + 56);
  }
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) / v3;
  [*(id *)(a1 + 32) minimumScore];
  double result = fmin(v4 * v5, 1.0);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_2(uint64_t a1, double a2, double a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 64) <= a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    a2 = a3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  double v4 = 1.0;
  if (*(unsigned char *)(a1 + 72)) {
    double v4 = *(double *)(a1 + 64);
  }
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) / v4;
  [*(id *)(a1 + 32) minimumScore];
  double result = fmin(v5 * v6, 1.0);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_3(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  double v3 = 1.0;
  if (*(unsigned char *)(a1 + 64)) {
    double v3 = *(double *)(a1 + 56);
  }
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) / v3;
  [*(id *)(a1 + 32) minimumScore];
  double result = fmin(v4 * v5, 1.0);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

double __81__PGMeaningfulEventMatchingCriteria_matchingScoreWithCriteria_failed_isReliable___block_invoke_4(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  double v3 = 1.0;
  if (*(unsigned char *)(a1 + 64)) {
    double v3 = *(double *)(a1 + 56);
  }
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) / v3;
  [*(id *)(a1 + 32) minimumScore];
  double result = fmin(v4 * v5, 1.0);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)matchingResultWithCriteria:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PGMeaningfulEventCriteria *)self isDebug]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v4 isDebug];
  }
  [(PGMeaningfulEventCriteria *)self setDebug:v5];
  __int16 v23 = 0;
  [v4 minimumScore];
  double v7 = v6;
  BOOL interestingForMeaningInference = self->_interestingForMeaningInference;
  int v9 = [v4 mustBeInteresting];
  int v10 = v9;
  if (interestingForMeaningInference || (v9 & 1) == 0)
  {
    [(PGMeaningfulEventMatchingCriteria *)self matchingScoreWithCriteria:v4 failed:(char *)&v23 + 1 isReliable:&v23];
    double v12 = v13;
    BOOL v11 = v13 >= v7 && HIBYTE(v23) == 0;
  }
  else
  {
    BOOL v11 = 0;
    double v12 = 0.0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    BOOL v18 = [(PGGraphMomentNode *)self->_momentNode name];
    unint64_t v19 = @"YES";
    *(_DWORD *)buf = 138413826;
    int v25 = v18;
    if (HIBYTE(v23)) {
      double v20 = @"YES";
    }
    else {
      double v20 = @"NO";
    }
    double v27 = v20;
    if (v11) {
      __n128 v21 = @"YES";
    }
    else {
      __n128 v21 = @"NO";
    }
    __int16 v26 = 2112;
    if (v10) {
      BOOL v22 = @"YES";
    }
    else {
      BOOL v22 = @"NO";
    }
    __int16 v28 = 2112;
    if (!interestingForMeaningInference) {
      unint64_t v19 = @"NO";
    }
    id v29 = v21;
    __int16 v30 = 2048;
    double v31 = v12;
    __int16 v32 = 2048;
    double v33 = v7;
    __int16 v34 = 2112;
    double v35 = v22;
    __int16 v36 = 2112;
    BOOL v37 = v19;
    _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[MeaningInference] [%@] isMatching %@, traitFailed %@, score %.2f of %.2f, requiresInteresting %@, isInteresting %@", buf, 0x48u);
  }
  unint64_t v15 = [PGMeaningfulEventMatchingResult alloc];
  int v16 = [(PGMeaningfulEventMatchingResult *)v15 initWithIsMatching:v11 score:v23 isReliable:v4 requiredCriteria:v12];

  return v16;
}

- (PGMeaningfulEventMatchingCriteria)initWithMoment:(id)a3 cache:(id)a4 serviceManager:(id)a5
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v79 = a5;
  BOOL v11 = [v9 graph];
  v91.receiver = self;
  v91.super_class = (Class)PGMeaningfulEventMatchingCriteria;
  double v12 = [(PGMeaningfulEventCriteria *)&v91 initWithGraph:v11];

  if (v12)
  {
    id v69 = a3;
    double v74 = v12;
    objc_storeStrong((id *)&v12->_cache, a4);
    uint64_t v13 = [v9 collection];
    char v14 = [v9 universalStartDate];
    v75 = v9;
    unint64_t v15 = [v9 universalEndDate];
    double v78 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v15];
    id v16 = v14;
    id v17 = v15;
    double v70 = v10;
    double v73 = (void *)v13;
    [v10 preciseAddressNodesForMomentNodes:v13];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v68 = long long v90 = 0u;
    id obj = [v68 locations];
    v71 = v17;
    double v72 = v16;
    BOOL v18 = v16;
    uint64_t v80 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
    if (v80)
    {
      uint64_t v77 = *(void *)v88;
      BOOL v18 = v16;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v88 != v77) {
            objc_enumerationMutation(obj);
          }
          uint64_t v81 = v19;
          double v20 = [v79 fetchLocationOfInterestVisitsAtLocation:*(void *)(*((void *)&v87 + 1) + 8 * v19) inDateInterval:v78];
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v82 = v20;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v83 objects:v92 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v84;
            do
            {
              uint64_t v24 = 0;
              int v25 = v17;
              __int16 v26 = v18;
              do
              {
                if (*(void *)v84 != v23) {
                  objc_enumerationMutation(v82);
                }
                double v27 = [*(id *)(*((void *)&v83 + 1) + 8 * v24) visitInterval];
                __int16 v28 = [v27 startDate];
                id v29 = [v27 endDate];
                BOOL v18 = [v26 earlierDate:v28];

                id v17 = [v25 laterDate:v29];

                ++v24;
                int v25 = v17;
                __int16 v26 = v18;
              }
              while (v22 != v24);
              uint64_t v22 = [v82 countByEnumeratingWithState:&v83 objects:v92 count:16];
            }
            while (v22);
          }

          uint64_t v19 = v81 + 1;
        }
        while (v81 + 1 != v80);
        uint64_t v80 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
      }
      while (v80);
    }

    [v17 timeIntervalSinceDate:v18];
    double v31 = v30;
    __int16 v32 = -[PGMeaningfulEventNumberTrait initWithNumberValue:]([PGMeaningfulEventNumberTrait alloc], "initWithNumberValue:", (double)(unint64_t)[v75 totalNumberOfPersons]);
    [(PGMeaningfulEventCriteria *)v74 setNumberOfPeopleTrait:v32];

    double v33 = [PGMeaningfulEventCollectionTrait alloc];
    id v10 = v70;
    __int16 v34 = [v70 peopleNodesForMomentNodes:v73];
    double v35 = [(PGMeaningfulEventCollectionTrait *)v33 initWithNodes:v34];
    [(PGMeaningfulEventCriteria *)v74 setPeopleTrait:v35];

    __int16 v36 = [PGMeaningfulEventCollectionTrait alloc];
    BOOL v37 = [v70 socialGroupNodesForMomentNodes:v73];
    uint64_t v38 = [(PGMeaningfulEventCollectionTrait *)v36 initWithNodes:v37];
    [(PGMeaningfulEventCriteria *)v74 setSocialGroupsTrait:v38];

    double v39 = [PGMeaningfulEventCollectionTrait alloc];
    uint64_t v40 = [v70 dateNodesForMomentNodes:v73];
    double v41 = [(PGMeaningfulEventCollectionTrait *)v39 initWithNodes:v40];
    [(PGMeaningfulEventCriteria *)v74 setDatesTrait:v41];

    BOOL v42 = [PGMeaningfulEventLocationCollectionTrait alloc];
    uint64_t v43 = [v70 addressNodesForMomentNodes:v73];
    uint64_t v44 = [(PGMeaningfulEventCollectionTrait *)v42 initWithNodes:v43];
    [(PGMeaningfulEventCriteria *)v74 setLocationsTrait:v44];

    uint64_t v45 = [PGMeaningfulEventCollectionTrait alloc];
    double v46 = [v70 roiNodesWithNonzeroConfidenceForMomentNodes:v73];
    double v47 = [(PGMeaningfulEventCollectionTrait *)v45 initWithNodes:v46];
    [(PGMeaningfulEventCriteria *)v74 setRoisTrait:v47];

    double v48 = [PGMeaningfulEventCollectionTrait alloc];
    double v49 = [v70 poiNodesWithNonzeroConfidenceForMomentNodes:v73];
    char v50 = [(PGMeaningfulEventCollectionTrait *)v48 initWithNodes:v49];
    [(PGMeaningfulEventCriteria *)v74 setPoisTrait:v50];

    BOOL v51 = [PGMeaningfulEventSceneCollectionTrait alloc];
    v52 = [v70 sceneNodesForMomentNodes:v73];
    __int16 v53 = [(PGMeaningfulEventSceneCollectionTrait *)v51 initWithNodes:v52];
    [(PGMeaningfulEventCriteria *)v74 setScenesTrait:v53];

    double v54 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:v31];
    [(PGMeaningfulEventCriteria *)v74 setMinimumDurationTrait:v54];

    double v55 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:v31];
    [(PGMeaningfulEventCriteria *)v74 setMaximumDurationTrait:v55];

    double v56 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", [v70 significantPartsOfDayForMomentNodes:v73]);
    [(PGMeaningfulEventCriteria *)v74 setSignificantPartsOfDayTrait:v56];

    double v57 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:", [v70 partsOfDayForMomentNodes:v73]);
    [(PGMeaningfulEventCriteria *)v74 setAllPartsOfDayTrait:v57];

    v58 = [v70 mobilityNodesForMomentNodes:v73];
    BOOL v59 = [v58 locationMobilityTypes];
    v60 = [v59 firstObject];
    uint64_t v61 = [v60 unsignedIntegerValue];

    double v62 = [[PGMeaningfulEventLocationMobilityTrait alloc] initWithMobility:v61];
    [(PGMeaningfulEventCriteria *)v74 setLocationMobilityTrait:v62];

    double v63 = [PGMeaningfulEventCollectionTrait alloc];
    double v64 = [v70 publicEventCategoryNodesForMomentNodes:v73];
    double v65 = [(PGMeaningfulEventCollectionTrait *)v63 initWithNodes:v64];
    [(PGMeaningfulEventCriteria *)v74 setPublicEventCategoriesTrait:v65];

    objc_storeStrong((id *)&v74->_momentNode, v69);
    if ([(PGGraphMomentNode *)v74->_momentNode isInteresting]) {
      char v66 = 1;
    }
    else {
      char v66 = [(PGGraphMomentNode *)v74->_momentNode isSmartInteresting];
    }
    double v12 = v74;
    v74->_BOOL interestingForMeaningInference = v66;

    id v9 = v75;
  }

  return v12;
}

@end