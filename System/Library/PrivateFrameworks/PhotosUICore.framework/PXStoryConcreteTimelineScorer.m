@interface PXStoryConcreteTimelineScorer
- (PXStoryConcreteTimelineScorer)init;
- (PXStoryConcreteTimelineScorer)initWithTimelineStyle:(id)a3;
- (PXStoryTimelineStyle)timelineStyle;
- (double)_scoreForClipInfo:(id *)a3 inClipFrame:(CGRect)a4 timelineBounds:(CGRect)a5 nUpBonus:(double *)a6;
- (double)_scoreForSplitAsset:(id)a3 inTimeline:(id)a4 segmentTimeRange:(id *)a5;
- (double)scoreForTimeline:(id)a3;
- (double)verySignificantScore;
- (int64_t)saliencyFallbackBehavior;
- (uint64_t)isAcceptableCropWithVisibleAssetRect:(CGFloat)a3 acceptableCropAssetRect:(CGFloat)a4 faceAreaAssetRect:(double)a5;
- (void)setSaliencyFallbackBehavior:(int64_t)a3;
@end

@implementation PXStoryConcreteTimelineScorer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineStyle, 0);
  objc_storeStrong((id *)&self->_splitAsset, 0);
  objc_storeStrong((id *)&self->_segmentDisplayAssets, 0);
}

- (void)setSaliencyFallbackBehavior:(int64_t)a3
{
  self->_saliencyFallbackBehavior = a3;
}

- (int64_t)saliencyFallbackBehavior
{
  return self->_saliencyFallbackBehavior;
}

- (PXStoryTimelineStyle)timelineStyle
{
  return self->_timelineStyle;
}

- (double)_scoreForSplitAsset:(id)a3 inTimeline:(id)a4 segmentTimeRange:(id *)a5
{
  id v6 = a3;
  [a4 size];
  PXRectWithOriginAndSize();
}

uint64_t __81__PXStoryConcreteTimelineScorer__scoreForSplitAsset_inTimeline_segmentTimeRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v6 = a2;
    uint64_t v7 = a4 + 16;
    do
    {
      if (*(void *)(a5 + 8) == 1)
      {
        *(CGRect *)(*(void *)(*(void *)(result + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(result + 32)+ 8)+ 32), *(CGRect *)(v7 - 16));
        PXEdgeInsetsInsetRect();
      }
      a5 += 768;
      v7 += 32;
      --v6;
    }
    while (v6);
  }
  return result;
}

- (double)_scoreForClipInfo:(id *)a3 inClipFrame:(CGRect)a4 timelineBounds:(CGRect)a5 nUpBonus:(double *)a6
{
}

void __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke()
{
}

void __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke_2()
{
}

BOOL __87__PXStoryConcreteTimelineScorer__scoreForClipInfo_inClipFrame_timelineBounds_nUpBonus___block_invoke_3(uint64_t a1)
{
  if (CGRectIsEmpty(*(CGRect *)(a1 + 40))) {
    return 0;
  }
  double v3 = (*(double (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 96);
  return CGRectContainsRect(*(CGRect *)&v10, *(CGRect *)&v3);
}

- (uint64_t)isAcceptableCropWithVisibleAssetRect:(CGFloat)a3 acceptableCropAssetRect:(CGFloat)a4 faceAreaAssetRect:(double)a5
{
  *(double *)v36 = a5;
  *(double *)&v36[8] = a6;
  *(double *)&v36[16] = a7;
  *(double *)&v36[24] = a8;
  BOOL v24 = CGRectContainsRect(*(CGRect *)&a1, *(CGRect *)&a5);
  v38.origin.CGFloat x = a9;
  v38.origin.CGFloat y = a10;
  v38.size.CGFloat width = a11;
  v38.size.CGFloat height = a12;
  BOOL IsEmpty = CGRectIsEmpty(v38);
  BOOL v26 = IsEmpty;
  uint64_t result = !IsEmpty | v24;
  if (!v26 && !v24)
  {
    v39.origin.CGFloat x = a1;
    v39.origin.CGFloat y = a2;
    v39.size.CGFloat width = a3;
    v39.size.CGFloat height = a4;
    v41.origin.CGFloat x = a9;
    v41.origin.CGFloat y = a10;
    v41.size.CGFloat width = a11;
    v41.size.CGFloat height = a12;
    if (CGRectContainsRect(v39, v41))
    {
      return 1;
    }
    else
    {
      v42.origin.CGFloat x = a9;
      v42.origin.CGFloat y = a10;
      v42.size.CGFloat width = a11;
      v42.size.CGFloat height = a12;
      CGRect v40 = CGRectIntersection(*(CGRect *)v36, v42);
      CGFloat x = v40.origin.x;
      CGFloat y = v40.origin.y;
      CGFloat width = v40.size.width;
      CGFloat height = v40.size.height;
      CGFloat v32 = a1;
      CGFloat v33 = a2;
      CGFloat v34 = a3;
      CGFloat v35 = a4;
      return CGRectContainsRect(*(CGRect *)&v32, *(CGRect *)&x);
    }
  }
  return result;
}

- (double)scoreForTimeline:(id)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v9);
    uint64_t v10 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:a2, self, @"PXStoryConcreteTimelineScorer.m", 105, @"%@ should be an instance inheriting from %@, but it is %@", @"timeline", v8, v10 object file lineNumber description];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"PXStoryConcreteTimelineScorer.m", 105, @"%@ should be an instance inheriting from %@, but it is nil", @"timeline", v8 object file lineNumber description];
  }

LABEL_3:
  [v5 size];
  PXRectWithOriginAndSize();
}

void __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke()
{
}

void __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke_2(uint64_t a1, uint64_t a2, long long *a3)
{
  if (a2 >= 1)
  {
    uint64_t v4 = a2;
    uint64_t v6 = 0;
    uint64_t v30 = 0;
    uint64_t v7 = (long long *)(a1 + 80);
    long long v29 = *(_OWORD *)off_1E5DAB030;
    do
    {
      long long v8 = a3[1];
      long long v68 = *a3;
      long long v69 = v8;
      long long v70 = a3[2];
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2020000000;
      uint64_t v67 = 0;
      uint64_t v60 = 0;
      v61 = (double *)&v60;
      uint64_t v62 = 0x2020000000;
      uint64_t v63 = 0;
      uint64_t v56 = 0;
      v57 = (double *)&v56;
      uint64_t v58 = 0x2020000000;
      uint64_t v59 = 0;
      uint64_t v50 = 0;
      v51 = (double *)&v50;
      uint64_t v52 = 0x4010000000;
      v53 = &unk_1AB5D584F;
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      long long v54 = *MEMORY[0x1E4F1DB20];
      long long v55 = v9;
      uint64_t v45 = 0;
      v46 = (double *)&v45;
      uint64_t v47 = 0x3010000000;
      v48 = &unk_1AB5D584F;
      long long v49 = v29;
      [*(id *)(a1 + 32) removeAllIndexes];
      [*(id *)(a1 + 40) removeAllIndexes];
      [*(id *)(*(void *)(a1 + 48) + 8) removeAllResources];
      uint64_t v10 = *(void **)(a1 + 56);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke_3;
      v35[3] = &unk_1E5DB9AD8;
      CGRect v38 = &v50;
      CGRect v39 = &v60;
      long long v11 = v7[1];
      long long v43 = *v7;
      long long v44 = v11;
      CGRect v40 = &v56;
      int8x16_t v31 = *(int8x16_t *)(a1 + 40);
      id v12 = (id)v31.i64[0];
      int8x16_t v36 = vextq_s8(v31, v31, 8uLL);
      id v37 = *(id *)(a1 + 32);
      CGRect v41 = &v45;
      CGRect v42 = &v64;
      *(_OWORD *)buf = v68;
      long long v33 = v69;
      long long v34 = v70;
      objc_msgSend(v10, "enumerateConcreteClipsInTimeRange:rect:usingBlock:", buf, v35, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
      if (v65[3] >= 1)
      {
        uint64_t v13 = [*(id *)(a1 + 32) count];
        if (v13 == v65[3])
        {
          *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v61[3] / (double)v13
                                                                      + *(double *)(*(void *)(*(void *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24);
          if (v13 >= 1) {
            *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v57[3]
          }
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 72)
                                                                                                + 8)
                                                                                    + 24);
          [*(id *)(*(void *)(a1 + 48) + 72) composabilityScoreForSegmentWithDisplayAssets:*(void *)(*(void *)(a1 + 48) + 8)];
          uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
          double v16 = *(double *)(v14 + 24) + v15 * 1000.0;
        }
        else
        {
          if (v13 != 1) {
            PXAssertGetLog();
          }
          v17 = *(void **)(*(void *)(a1 + 48) + 16);
          uint64_t v18 = [*(id *)(a1 + 32) firstIndex];
          v19 = [*(id *)(*(void *)(a1 + 48) + 8) resourcesDataSource];
          [v17 setResourceIndex:v18 resourcesDataSource:v19];

          v20 = *(void **)(a1 + 48);
          uint64_t v21 = *(void *)(a1 + 56);
          uint64_t v22 = v20[2];
          *(_OWORD *)buf = v68;
          long long v33 = v69;
          long long v34 = v70;
          [v20 _scoreForSplitAsset:v22 inTimeline:v21 segmentTimeRange:buf];
          uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
          double v16 = v23 + *(double *)(v14 + 24);
        }
        *(double *)(v14 + 24) = v16;
        if (v65[3] == 1)
        {
          double v24 = (*(double (**)(double, double))(*(void *)(a1 + 64) + 16))(v51[6], v51[7]);
          double v25 = (*(double (**)(double, double))(*(void *)(a1 + 64) + 16))(v46[4], v46[5]);
          double v26 = *(double *)(a1 + 120);
          if (v25 >= v26) {
            double v27 = *(double *)(a1 + 120);
          }
          else {
            double v27 = v25;
          }
          if (v25 < v26) {
            double v25 = *(double *)(a1 + 120);
          }
          if (v24 < v27 || v24 > v25) {
            *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72)
          }
                                                                                                + 8)
                                                                                    + 24)
                                                                        + -1000.0;
        }
        PXSizeGetArea();
      }
      uint64_t v28 = v65[3];
      if (v6 <= 0)
      {
        if (v28 > 1) {
          goto LABEL_32;
        }
      }
      else
      {
        if (v28 == v6) {
          *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72)
        }
                                                                                              + 8)
                                                                                  + 24)
                                                                      + -0.5;
        if (v28 >= 2 && (unint64_t)v6 >= 2)
        {
          *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + -2.0;
LABEL_32:
          if (v30 >= 1 && v28 == v30) {
            *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72)
          }
                                                                                                + 8)
                                                                                    + 24)
                                                                        + -0.5;
          if ([*(id *)(a1 + 40) containsIndex:4]) {
            *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72)
          }
                                                                                                + 8)
                                                                                    + 24)
                                                                        + -100.0;
          uint64_t v28 = v65[3];
          uint64_t v30 = v28;
          goto LABEL_38;
        }
        if (v28 >= 2) {
          goto LABEL_32;
        }
      }
LABEL_38:

      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v56, 8);
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);
      a3 += 3;
      uint64_t v6 = v28;
      --v4;
    }
    while (v4);
  }
}

uint64_t __50__PXStoryConcreteTimelineScorer_scoreForTimeline___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  if (a2 >= 1)
  {
    v23[1] = v11;
    v23[2] = v10;
    v23[3] = v9;
    v23[4] = v8;
    v23[11] = v6;
    v23[12] = v7;
    uint64_t v14 = a2;
    uint64_t v15 = result;
    double v16 = (double *)(a4 + 16);
    do
    {
      if (*(void *)(a5 + 8) == 1)
      {
        double v17 = *(v16 - 2);
        double v18 = *(v16 - 1);
        double v19 = *v16;
        double v20 = v16[1];
        v24.origin.CGFloat x = v17;
        v24.origin.CGFloat y = v18;
        v24.size.CGFloat width = *v16;
        v24.size.CGFloat height = v20;
        *(CGRect *)(*(void *)(*(void *)(v15 + 56) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(v15 + 56)+ 8)+ 32), v24);
        v23[0] = 0.0;
        objc_msgSend(*(id *)(v15 + 32), "_scoreForClipInfo:inClipFrame:timelineBounds:nUpBonus:", a5, v23, v17, v18, v19, v20, *(double *)(v15 + 96), *(double *)(v15 + 104), *(double *)(v15 + 112), *(double *)(v15 + 120));
        *(double *)(*(void *)(*(void *)(v15 + 64) + 8) + 24) = v21
                                                                     + *(double *)(*(void *)(*(void *)(v15 + 64)
                                                                                             + 8)
                                                                                 + 24);
        *(double *)(*(void *)(*(void *)(v15 + 72) + 8) + 24) = v23[0]
                                                                     + *(double *)(*(void *)(*(void *)(v15 + 72)
                                                                                             + 8)
                                                                                 + 24);
        [*(id *)(v15 + 40) addIndex:*(void *)(a5 + 152)];
        uint64_t v22 = *a6;
        [*(id *)(v15 + 48) addIndex:*a6];
        uint64_t result = [*(id *)(*(void *)(v15 + 32) + 8) addResourceWithIndex:v22];
        *(_OWORD *)(*(void *)(*(void *)(v15 + 80) + 8) + 32) = *(_OWORD *)(a5 + 160);
        ++*(void *)(*(void *)(*(void *)(v15 + 88) + 8) + 24);
      }
      a5 += 768;
      ++a6;
      v16 += 4;
      --v14;
    }
    while (v14);
  }
  return result;
}

- (double)verySignificantScore
{
  return 100.0;
}

- (PXStoryConcreteTimelineScorer)initWithTimelineStyle:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryConcreteTimelineScorer;
  double v6 = [(PXStoryConcreteTimelineScorer *)&v18 init];
  if (v6)
  {
    double v7 = +[PXStorySettings sharedInstance];
    objc_storeStrong((id *)&v6->_timelineStyle, a3);
    double v8 = objc_alloc_init(_PXStoryConcreteScorerDisplayAssetsFetchResult);
    segmentDisplayAssets = v6->_segmentDisplayAssets;
    v6->_segmentDisplayAssets = v8;

    double v10 = objc_alloc_init(_PXStoryConcreteScorerDisplayAsset);
    splitAsset = v6->_splitAsset;
    v6->_splitAsset = v10;

    [v7 videoMaximumAspectFillScale];
    v6->_videoMaximumAspectFillScale = v12;
    [v7 livePhotoSameOrientationCompactMaximumScale];
    v6->_livePhotoSameOrientationMaximumScales[0] = v13;
    [v7 livePhotoSameOrientationRegularMaximumScale];
    v6->_livePhotoSameOrientationMaximumScales[1] = v14;
    [v7 livePhotoOppositeOrientationCompactMaximumScale];
    v6->_livePhotoOppositeOrientationMaximumScales[0] = v15;
    [v7 livePhotoOppositeOrientationRegularMaximumScale];
    v6->_livePhotoOppositeOrientationMaximumScales[1] = v16;
    [v7 aspectFillOneUpCropTolerance];
    PXFloatByLinearlyInterpolatingFloats();
  }

  return 0;
}

- (PXStoryConcreteTimelineScorer)init
{
  return [(PXStoryConcreteTimelineScorer *)self initWithTimelineStyle:0];
}

@end