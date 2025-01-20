@interface PXPassthroughMediaAnalyzer
- (PXPassthroughMediaAnalyzer)initWithMatchedTimeRanges:(id)a3;
- (PXPassthroughMediaAnalyzer)initWithTimeRangeProvider:(id)a3;
- (id)requestAnalysisForAssets:(id)a3 options:(unint64_t)a4 contexts:(id)a5 resultHandler:(id)a6;
- (id)requestMatchedTimeRangesForAsset:(id)a3 searchQueryMatchInfo:(id)a4 resultHandler:(id)a5;
@end

@implementation PXPassthroughMediaAnalyzer

- (void).cxx_destruct
{
}

- (id)requestAnalysisForAssets:(id)a3 options:(unint64_t)a4 contexts:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2 object:self file:@"PXMediaAnalyzer.m" lineNumber:198 description:@"This code path is not implemented."];

  abort();
}

- (id)requestMatchedTimeRangesForAsset:(id)a3 searchQueryMatchInfo:(id)a4 resultHandler:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4F28F90];
  id v9 = a3;
  id v10 = [v8 progressWithTotalUnitCount:10];
  [v10 setCompletedUnitCount:1];
  timeRangeProvider = (void (**)(id, double))self->_timeRangeProvider;
  [v9 duration];
  double v13 = v12;

  v14 = timeRangeProvider[2](timeRangeProvider, v13);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PXPassthroughMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke;
  block[3] = &unk_1E5DD0E78;
  id v15 = v10;
  v23 = v14;
  id v24 = v7;
  id v22 = v15;
  id v16 = v14;
  id v17 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v18 = v23;
  id v19 = v15;

  return v19;
}

uint64_t __98__PXPassthroughMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (PXPassthroughMediaAnalyzer)initWithMatchedTimeRanges:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXPassthroughMediaAnalyzer_initWithMatchedTimeRanges___block_invoke;
  v8[3] = &unk_1E5DB9978;
  id v9 = v4;
  id v5 = v4;
  v6 = [(PXPassthroughMediaAnalyzer *)self initWithTimeRangeProvider:v8];

  return v6;
}

id __56__PXPassthroughMediaAnalyzer_initWithMatchedTimeRanges___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PXPassthroughMediaAnalyzer)initWithTimeRangeProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPassthroughMediaAnalyzer;
  id v5 = [(PXPassthroughMediaAnalyzer *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id timeRangeProvider = v5->_timeRangeProvider;
    v5->_id timeRangeProvider = v6;
  }
  return v5;
}

@end