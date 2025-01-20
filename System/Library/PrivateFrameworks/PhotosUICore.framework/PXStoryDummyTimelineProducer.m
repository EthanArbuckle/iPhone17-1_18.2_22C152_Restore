@interface PXStoryDummyTimelineProducer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedDuration;
- (id)createTimelineWithConfiguration:(id)a3 detailsFraction:(double)a4;
- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
- (void)setFixedDuration:(id *)a3;
@end

@implementation PXStoryDummyTimelineProducer

- (void)setFixedDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_fixedDuration.epoch = a3->var3;
  *(_OWORD *)&self->_fixedDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (id)createTimelineWithConfiguration:(id)a3 detailsFraction:(double)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [PXStoryMutableDummyTimeline alloc];
  v8 = [v6 spec];
  [v8 viewportSize];
  v9 = -[PXStoryDummyTimeline initWithSize:](v7, "initWithSize:");

  v10 = [v6 resourcesDataSource];
  v11 = [v6 spec];
  v12 = [v6 style];
  uint64_t v13 = [v12 createRandomNumberGenerators];
  v14 = [v6 errorReporter];
  v41 = (void *)v13;
  v15 = [v12 timelineStyleWithSpec:v11 resourcesDataSource:v10 randomNumberGenerators:v13 errorReporter:v14];

  uint64_t v16 = [v10 keyAssetResource];
  v40 = (void *)v16;
  if (v16)
  {
    v57[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    CMTimeMakeWithSeconds(&v55, 2.0, 600);
    memset(&range, 0, 40);
    rhs[0] = PXStoryTransitionInfoNone;
    rhs[1] = xmmword_1AB35CB38;
    uint64_t v54 = 0;
    [(PXStoryMutableDummyTimeline *)v9 addSegmentWithResources:v17 preferredDuration:&v55 compositionInfo:&range transitionInfo:rhs];
  }
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  [(PXStoryDummyTimelineProducer *)self fixedDuration];
  uint64_t v18 = [v10 numberOfDisplayAssetResources];
  if (v18 >= 1)
  {
    uint64_t v19 = v18;
    v37 = v12;
    v38 = v11;
    id v39 = v6;
    long long v48 = 0uLL;
    uint64_t v49 = 0;
    if (v15) {
      [v15 defaultDisplayAssetPresentationDuration];
    }
    v20 = [[_PXStoryDummyDisplayAssetsFetchResult alloc] initWithResourcesDataSource:v10];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    uint64_t v22 = 0;
    char v23 = 0;
    double v24 = (double)v19;
    v42 = v20;
    while (1)
    {
      uint64_t v25 = v19 - v22;
      if (v19 - v22 >= 3) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = v19 - v22;
      }
      -[_PXStoryDummyDisplayAssetsFetchResult configureWithRange:](v20, "configureWithRange:", v22, v26);
      if (v9) {
        [(PXStoryDummyTimeline *)v9 timeRange];
      }
      else {
        memset(&v46, 0, sizeof(v46));
      }
      CMTimeRange range = v46;
      CMTimeRangeGetEnd(&v47, &range);
      v27 = [v15 allowedClipCompositionsWithStartTime:&v47 nextDisplayAssets:v20];
      if ((unint64_t)[v27 count] < 2) {
        goto LABEL_17;
      }
      uint64_t v28 = 1;
      if ((v23 & 1) == 0) {
        goto LABEL_18;
      }
      if ((double)v22 / v24 >= a4) {
LABEL_17:
      }
        uint64_t v28 = 1;
      else {
        uint64_t v28 = 2;
      }
LABEL_18:
      if (v25 >= 1)
      {
        v43 = v27;
        uint64_t v29 = v19;
        v30 = v15;
        v31 = v9;
        if (v28 >= v25) {
          uint64_t v32 = v25;
        }
        else {
          uint64_t v32 = v28;
        }
        uint64_t v33 = v22 + v32;
        do
        {
          v34 = [v10 displayAssetResourceAtIndex:v22];
          [v21 addObject:v34];

          ++v22;
          --v32;
        }
        while (v32);
        uint64_t v22 = v33;
        v9 = v31;
        v15 = v30;
        uint64_t v19 = v29;
        v20 = v42;
        v27 = v43;
      }
      long long v44 = v48;
      uint64_t v45 = v49;
      memset(&range, 0, 40);
      rhs[0] = PXStoryTransitionInfoNone;
      rhs[1] = xmmword_1AB35CB38;
      uint64_t v54 = 0;
      [(PXStoryMutableDummyTimeline *)v9 addSegmentWithResources:v21 preferredDuration:&v44 compositionInfo:&range transitionInfo:rhs];
      [v21 removeAllObjects];

      if (v22 >= v19)
      {

        v11 = v38;
        id v6 = v39;
        v12 = v37;
        break;
      }
      ++v23;
    }
  }
  [v12 songResource];
  if (objc_claimAutoreleasedReturnValue())
  {
    if (v9) {
      [(PXStoryDummyTimeline *)v9 timeRange];
    }
    [(PXStoryDummyTimeline *)v9 size];
    PXRectWithOriginAndSize();
  }
  v35 = (void *)[(PXStoryMutableDummyTimeline *)v9 copy];

  return v35;
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  v7 = (void (**)(id, PXStoryProducerResult *))a5;
  v8 = [(PXStoryDummyTimelineProducer *)self createTimelineWithConfiguration:a3 detailsFraction:1.0];
  v9 = [[PXStoryProducerResult alloc] initWithObject:v8];
  v7[2](v7, v9);

  return 0;
}

@end