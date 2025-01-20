@interface PXStoryViewModeBrowserToPlayerTransition
- (PXStoryViewModeBrowserToPlayerTransition)initWithDestinationTimelineLayoutSnapshot:(id)a3 assetReference:(id)a4 trackingClipIdentifier:(int64_t)a5;
- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6;
- (double)dampingRatio;
- (double)springStiffness;
@end

@implementation PXStoryViewModeBrowserToPlayerTransition

- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  id v10 = a6;
  unint64_t var1 = a3->var1;
  if (var1 <= 3 && var1 != 1)
  {
    v16.receiver = self;
    v16.super_class = (Class)PXStoryViewModeBrowserToPlayerTransition;
    memcpy(v15, a3, sizeof(v15));
    [(PXStoryViewModeTransition *)&v16 alphaForClipWithInfo:v15 proposedAlpha:a5 inViewMode:v10 layout:a4];
    a4 = v13;
  }

  return a4;
}

- (double)springStiffness
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewModeBrowserToPlayerTransition;
  [(PXStoryViewModeTransition *)&v4 springStiffness];
  return v2 * 1.5;
}

- (double)dampingRatio
{
  return 0.9;
}

- (PXStoryViewModeBrowserToPlayerTransition)initWithDestinationTimelineLayoutSnapshot:(id)a3 assetReference:(id)a4 trackingClipIdentifier:(int64_t)a5
{
  id v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E4F28E60];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v13 = [v8 timeline];
  if (v8) {
    [v8 timeRange];
  }
  else {
    memset(v30, 0, sizeof(v30));
  }
  [v8 timelineRect];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __124__PXStoryViewModeBrowserToPlayerTransition_initWithDestinationTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke;
  v27[3] = &unk_1E5DBEAC0;
  id v28 = v11;
  id v29 = v12;
  id v22 = v12;
  id v23 = v11;
  objc_msgSend(v13, "enumerateClipsInTimeRange:rect:usingBlock:", v30, v27, v15, v17, v19, v21);

  v26.receiver = self;
  v26.super_class = (Class)PXStoryViewModeBrowserToPlayerTransition;
  v24 = [(PXStoryViewModeFocusedClipsViewTransition *)&v26 initWithSourceViewMode:2 sourceSnapshot:0 destinationViewMode:1 destinationSnapshot:v8 assetReference:v10 focusedClipIdentifiers:v23 trackingClipIdentifier:a5];

  return v24;
}

void __124__PXStoryViewModeBrowserToPlayerTransition_initWithDestinationTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (a2 >= 1)
  {
    uint64_t v29 = v14;
    uint64_t v30 = v13;
    uint64_t v31 = v12;
    uint64_t v32 = v11;
    uint64_t v33 = v10;
    uint64_t v34 = v9;
    uint64_t v35 = v8;
    uint64_t v36 = v7;
    uint64_t v37 = v6;
    uint64_t v38 = v5;
    uint64_t v39 = v15;
    uint64_t v40 = v16;
    uint64_t v18 = a2;
    double v20 = (double *)(a4 + 16);
    do
    {
      uint64_t v21 = *a5;
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", *a5, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
      double v22 = *(v20 - 2);
      double v23 = *(v20 - 1);
      double v24 = *v20;
      double v25 = v20[1];
      v20 += 4;
      objc_super v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v22, v23, v24, v25);
      v27 = *(void **)(a1 + 40);
      id v28 = [NSNumber numberWithInteger:v21];
      [v27 setObject:v26 forKeyedSubscript:v28];

      a5 += 96;
      --v18;
    }
    while (v18);
  }
}

@end