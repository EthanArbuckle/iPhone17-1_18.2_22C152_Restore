@interface PXStoryKeyAssetVisualDiagnosticsProvider
- (PXStoryKeyAssetVisualDiagnosticsProvider)init;
- (PXStoryKeyAssetVisualDiagnosticsProvider)initWithModel:(id)a3;
- (PXStoryModel)model;
- (PXStoryVisualDiagnosticsProviderHelper)helper;
- (void)_requestPotentialKeyAssetsWithResultHandler:(id)a3;
- (void)_requestThumbnailTimelineWithKeyAsset:(id)a3 resultHandler:(id)a4;
- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4;
@end

@implementation PXStoryKeyAssetVisualDiagnosticsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryVisualDiagnosticsProviderHelper)helper
{
  return self->_helper;
}

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v7 addTitlePageWithTitle:@"Visual Diagnostics" subtitle:@"Key Asset"];
  v9 = [(PXStoryKeyAssetVisualDiagnosticsProvider *)self helper];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke;
  v13[3] = &unk_1E5DBE728;
  v13[4] = self;
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  SEL v17 = a2;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  [(PXStoryKeyAssetVisualDiagnosticsProvider *)self _requestPotentialKeyAssetsWithResultHandler:v13];
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  if (v5)
  {
    [v5 count];
    v11;
    a1[5];
    a1[6];
    a1[7];
    PXIterateAsynchronously();
  }
  id v12 = (void (**)(id, void, void *))a1[7];
  v13 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(9, a3, @"potential key assets request failed", v6, v7, v8, v9, v10, v14);
  v12[2](v12, 0, v13);
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  id v5 = PLStoryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = [v3 index];
    __int16 v19 = 2048;
    uint64_t v20 = [v3 count];
    __int16 v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "creating visual diagnostics for potential key asset %ti/%ti %@", buf, 0x20u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_29;
  v10[3] = &unk_1E5DBE6D8;
  uint64_t v6 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = v4;
  uint64_t v7 = *(void *)(a1 + 64);
  id v15 = v3;
  uint64_t v16 = v7;
  uint64_t v14 = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = v4;
  [v6 _requestThumbnailTimelineWithKeyAsset:v9 resultHandler:v10];
}

uint64_t __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) beginPage];
  [*(id *)(a1 + 32) currentPageBounds];
  CGRect v21 = CGRectInset(v20, 10.0, 10.0);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  memset(&slice, 0, sizeof(slice));
  memset(&v18, 0, sizeof(v18));
  memset(&v17, 0, sizeof(v17));
  memset(&remainder, 0, sizeof(remainder));
  memset(&v15, 0, sizeof(v15));
  CGFloat v11 = CGRectGetHeight(v21) * 0.4;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRectDivide(v22, &slice, &remainder, v11, CGRectMinYEdge);
  CGRectDivide(remainder, &v15, &remainder, 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v17, &remainder, 30.0, CGRectMaxYEdge);
  CGRectDivide(remainder, &v15, &v18, 10.0, CGRectMaxYEdge);
  if (v5)
  {
    [v5 size];
    PXSizeGetAspectRatio();
  }
  id v12 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_2_30;
  v13[3] = &unk_1E5DBE660;
  id v14 = v6;
  objc_msgSend(v12, "drawTextInRect:configuration:", v13, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);

  [*(id *)(a1 + 48) aspectRatio];
  PXRectWithAspectRatioFittingRect();
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_2_30(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithFormat:@"Error: %@", *(void *)(a1 + 32)];
  [v4 setText:v5];

  id v6 = [MEMORY[0x1E4FB1618] redColor];
  [v4 setTextColor:v6];
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 firstSegmentIdentifier];
  if (v4) {
    [v4 timeRangeForSegmentWithIdentifier:v5];
  }
  [*(id *)(a1 + 32) size];
  PXRectWithOriginAndSize();
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setText:v2];
  [v3 setFontSize:10.0];
}

uint64_t __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

void __92__PXStoryKeyAssetVisualDiagnosticsProvider_addVisualDiagnosticsToContext_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    __dst[90] = v5;
    __dst[91] = v6;
    uint64_t v7 = a2;
    id v9 = (void *)(a5 + 16);
    do
    {
      uint64_t v10 = *(v9 - 2);
      uint64_t v11 = *(v9 - 1);
      memcpy(__dst, v9, 0x290uLL);
      if (v11 == 1)
      {
        id v12 = *(void **)(a1 + 32);
        id v13 = [*(id *)(a1 + 40) clipWithIdentifier:v10];
        id v14 = [v13 resource];

        CGRect v15 = objc_msgSend(v14, "px_storyResourceDisplayAsset");
        LODWORD(v12) = [v12 isEqual:v15];

        if (v12)
        {
          v16[4] = *(_OWORD *)&__dst[75];
          v16[5] = *(_OWORD *)&__dst[77];
          v16[6] = *(_OWORD *)&__dst[79];
          uint64_t v17 = __dst[81];
          v16[0] = *(_OWORD *)&__dst[67];
          v16[1] = *(_OWORD *)&__dst[69];
          v16[2] = *(_OWORD *)&__dst[71];
          v16[3] = *(_OWORD *)&__dst[73];
          [*(id *)(a1 + 56) setKenBurnsAnimationInfo:v16];
        }
      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

- (void)_requestThumbnailTimelineWithKeyAsset:(id)a3 resultHandler:(id)a4
{
  a3;
  id v6 = a4;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DBE610;
  aBlock[5] = v8;
  aBlock[4] = v6;
  _Block_copy(aBlock);
  [(PXStoryKeyAssetVisualDiagnosticsProvider *)self model];
  [(id)objc_claimAutoreleasedReturnValue() configuration];
  objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromAsset();
}

uint64_t __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 timeline];
  if (v5)
  {
    id v6 = v5;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v5 = v6;
    *a3 = 1;
  }
}

void __96__PXStoryKeyAssetVisualDiagnosticsProvider__requestThumbnailTimelineWithKeyAsset_resultHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  PXStoryErrorCreateWithCodeDebugFormat(1, @"request timed out", a3, a4, a5, a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v10);
}

- (void)_requestPotentialKeyAssetsWithResultHandler:(id)a3
{
  id v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke;
  aBlock[3] = &unk_1E5DBE5C0;
  CGRect v22 = v23;
  id v5 = v4;
  id v21 = v5;
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = [(PXStoryKeyAssetVisualDiagnosticsProvider *)self model];
  uint64_t v8 = [v7 configuration];
  uint64_t v9 = (void *)[v8 copy];

  objc_msgSend(v9, "setOptions:", objc_msgSend(v9, "options") & 0xFFFFFFFFFFFFFFFDLL);
  id v10 = objc_alloc_init(PXStoryDefaultAssetsProducerFactory);
  uint64_t v11 = [(PXStoryDefaultAssetsProducerFactory *)v10 assetsProducerForConfiguration:v9];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_2;
  v18[3] = &unk_1E5DBE5E8;
  id v12 = v6;
  id v19 = v12;
  id v13 = (id)[v11 requestAssetsWithOptions:1 storyQueue:0 resultHandler:v18];

  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_3;
  v16[3] = &unk_1E5DD3128;
  id v17 = v12;
  id v15 = v12;
  dispatch_after(v14, MEMORY[0x1E4F14428], v16);

  _Block_object_dispose(v23, 8);
}

uint64_t __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 isDegraded] & 1) == 0)
  {
    id v3 = [v2 object];
    id v4 = [v3 dataSource];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [v4 numberOfSections];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      int64x2_t v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v11[0] = objc_msgSend(v4, "identifier", *(_OWORD *)&v10);
        v11[1] = v8;
        int64x2_t v12 = v10;
        uint64_t v9 = [v4 assetsInSectionIndexPath:v11];
        [v5 addObject:v9];

        ++v8;
      }
      while (v7 != v8);
    }
    PXDisplayAssetFetchResultFromFetchResults();
  }
}

void __88__PXStoryKeyAssetVisualDiagnosticsProvider__requestPotentialKeyAssetsWithResultHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  PXStoryErrorCreateWithCodeDebugFormat(1, @"request timed out", a3, a4, a5, a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v10);
}

- (PXStoryKeyAssetVisualDiagnosticsProvider)initWithModel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryKeyAssetVisualDiagnosticsProvider;
  uint64_t v6 = [(PXStoryKeyAssetVisualDiagnosticsProvider *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    uint64_t v8 = [PXStoryVisualDiagnosticsProviderHelper alloc];
    uint64_t v9 = [(PXStoryModel *)v7->_model configuration];
    uint64_t v10 = [(PXStoryVisualDiagnosticsProviderHelper *)v8 initWithConfiguration:v9];
    helper = v7->_helper;
    v7->_helper = (PXStoryVisualDiagnosticsProviderHelper *)v10;
  }
  return v7;
}

- (PXStoryKeyAssetVisualDiagnosticsProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryKeyAssetVisualDiagnosticsProvider.m", 44, @"%s is not available as initializer", "-[PXStoryKeyAssetVisualDiagnosticsProvider init]");

  abort();
}

@end