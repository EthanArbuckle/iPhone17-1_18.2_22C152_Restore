@interface PXSurveyQuestionAssetGroupView
- (CAGradientLayer)metadataViewGradient;
- (NSMutableArray)imageViews;
- (NSMutableSet)presentedAssetIds;
- (NSNumber)customMaximumPreviewAssetCount;
- (NSString)keyAssetLocalIdentifier;
- (OS_dispatch_queue)imageViewsQueue;
- (PHAssetCollection)assetCollection;
- (PXSurveyQuestionAssetGroupView)initWithAssetCollection:(id)a3;
- (PXSurveyQuestionAssetGroupView)initWithAssetCollection:(id)a3 customMaximumPreviewAssetCount:(id)a4 keyAssetLocalIdentifier:(id)a5;
- (PXSurveyQuestionAssetGroupViewDelegate)delegate;
- (UILabel)dateRangeLabel;
- (UILabel)locationLabel;
- (UIView)metadataView;
- (double)minXPositionForViewPosition:(unsigned __int8)a3 totalNumberOfViews:(unsigned __int8)a4;
- (double)minYPositionForViewPosition:(unsigned __int8)a3 totalNumberOfViews:(unsigned __int8)a4;
- (id)_arrangeAssetsForDisplay:(id)a3;
- (id)_imageViewForPosition:(unsigned __int8)a3 totalViewCount:(unsigned __int8)a4;
- (id)validCustomMaximumPreviewAssetCountForCustomMaximumPreviewAssetCount:(id)a3;
- (unsigned)_getTotalViews;
- (unsigned)getHorizontalViewCountForTotalNumberOfViews:(unsigned __int8)a3;
- (unsigned)getVerticalViewCountForTotalNumberOfViews:(unsigned __int8)a3;
- (void)_beginImageFetchFromCollection;
- (void)_handleViewTap;
- (void)_loadAndApplyImagesFromAssets:(id)a3;
- (void)_setupMetadataView;
- (void)_setupViews;
- (void)setCustomMaximumPreviewAssetCount:(id)a3;
- (void)setDateRangeLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrameForSubview:(id)a3 inPosition:(unsigned __int8)a4;
- (void)setImageViews:(id)a3;
- (void)setImageViewsQueue:(id)a3;
- (void)setKeyAssetLocalIdentifier:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setMetadataView:(id)a3;
- (void)setMetadataViewGradient:(id)a3;
- (void)setPresentedAssetIds:(id)a3;
@end

@implementation PXSurveyQuestionAssetGroupView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_customMaximumPreviewAssetCount, 0);
  objc_storeStrong((id *)&self->_dateRangeLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_metadataViewGradient, 0);
  objc_storeStrong((id *)&self->_metadataView, 0);
  objc_storeStrong((id *)&self->_imageViewsQueue, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_presentedAssetIds, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)setKeyAssetLocalIdentifier:(id)a3
{
}

- (NSString)keyAssetLocalIdentifier
{
  return self->_keyAssetLocalIdentifier;
}

- (void)setCustomMaximumPreviewAssetCount:(id)a3
{
}

- (NSNumber)customMaximumPreviewAssetCount
{
  return self->_customMaximumPreviewAssetCount;
}

- (void)setDateRangeLabel:(id)a3
{
}

- (UILabel)dateRangeLabel
{
  return self->_dateRangeLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setMetadataViewGradient:(id)a3
{
}

- (CAGradientLayer)metadataViewGradient
{
  return self->_metadataViewGradient;
}

- (void)setMetadataView:(id)a3
{
}

- (UIView)metadataView
{
  return self->_metadataView;
}

- (void)setImageViewsQueue:(id)a3
{
}

- (void)setImageViews:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setPresentedAssetIds:(id)a3
{
}

- (NSMutableSet)presentedAssetIds
{
  return self->_presentedAssetIds;
}

- (void)setDelegate:(id)a3
{
}

- (PXSurveyQuestionAssetGroupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSurveyQuestionAssetGroupViewDelegate *)WeakRetained;
}

- (double)minYPositionForViewPosition:(unsigned __int8)a3 totalNumberOfViews:(unsigned __int8)a4
{
  int v4 = a3;
  int v6 = [(PXSurveyQuestionAssetGroupView *)self getVerticalViewCountForTotalNumberOfViews:a4];
  double result = 0.0;
  switch(v4)
  {
    case 3:
      if (v6 == 2) {
        goto LABEL_6;
      }
      break;
    case 4:
      if (v6 != 2) {
        goto LABEL_8;
      }
LABEL_6:
      [(PXSurveyQuestionAssetGroupView *)self frame];
      double imagePadding = v11 * 0.5;
      double v9 = self->_imagePadding * 0.5;
      goto LABEL_7;
    case 5:
    case 6:
LABEL_8:
      [(PXSurveyQuestionAssetGroupView *)self frame];
      double result = v12 / 3.0 + self->_imagePadding * 0.5;
      break;
    case 7:
    case 8:
    case 9:
      [(PXSurveyQuestionAssetGroupView *)self frame];
      double v9 = v8 / 1.5;
      double imagePadding = self->_imagePadding;
LABEL_7:
      double result = imagePadding + v9;
      break;
    default:
      return result;
  }
  return result;
}

- (double)minXPositionForViewPosition:(unsigned __int8)a3 totalNumberOfViews:(unsigned __int8)a4
{
  unsigned int v4 = a3;
  int v6 = [(PXSurveyQuestionAssetGroupView *)self getHorizontalViewCountForTotalNumberOfViews:a4];
  double result = 0.0;
  if (v4 <= 9)
  {
    if (((1 << v4) & 0x124) != 0)
    {
      if (v6 == 3)
      {
        [(PXSurveyQuestionAssetGroupView *)self frame];
        return v12 / 3.0 + self->_imagePadding * 0.5;
      }
      if (v6 != 2)
      {
LABEL_8:
        [(PXSurveyQuestionAssetGroupView *)self frame];
        double v9 = v8 / 1.5;
        double imagePadding = self->_imagePadding;
        return imagePadding + v9;
      }
LABEL_11:
      [(PXSurveyQuestionAssetGroupView *)self frame];
      double imagePadding = v11 * 0.5;
      double v9 = self->_imagePadding * 0.5;
      return imagePadding + v9;
    }
    if (((1 << v4) & 0x248) != 0)
    {
      if (v6 == 2) {
        return result;
      }
      goto LABEL_8;
    }
    if (v4 == 4 && v6 == 2) {
      goto LABEL_11;
    }
  }
  return result;
}

- (void)setFrameForSubview:(id)a3 inPosition:(unsigned __int8)a4
{
  id v6 = a3;
  [v6 bounds];
  double v5 = v4;
  [v6 bounds];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v5);
}

- (unsigned)getHorizontalViewCountForTotalNumberOfViews:(unsigned __int8)a3
{
  if (a3 == 9) {
    char v3 = 3;
  }
  else {
    char v3 = 0;
  }
  if (a3 >= 5u) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = 2;
  }
  if (a3 >= 2u) {
    return v4;
  }
  else {
    return 1;
  }
}

- (unsigned)getVerticalViewCountForTotalNumberOfViews:(unsigned __int8)a3
{
  if (a3 == 9) {
    unsigned __int8 v3 = 3;
  }
  else {
    unsigned __int8 v3 = 0;
  }
  if (a3 == 4) {
    unsigned __int8 v3 = 2;
  }
  if (a3 < 3u) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)_imageViewForPosition:(unsigned __int8)a3 totalViewCount:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  unsigned int v9 = [(PXSurveyQuestionAssetGroupView *)self getHorizontalViewCountForTotalNumberOfViews:v4];
  unsigned int v10 = [(PXSurveyQuestionAssetGroupView *)self getVerticalViewCountForTotalNumberOfViews:v4];
  [(PXSurveyQuestionAssetGroupView *)self frame];
  double v12 = v11;
  if (v9 != 1) {
    double v12 = v11 / (double)v9 + self->_imagePadding * -0.5;
  }
  [(PXSurveyQuestionAssetGroupView *)self frame];
  if (v10) {
    double v14 = v13 / (double)v10;
  }
  else {
    double v14 = v13 / 0.0 + self->_imagePadding * -0.5;
  }
  [(PXSurveyQuestionAssetGroupView *)self minXPositionForViewPosition:v5 totalNumberOfViews:v4];
  double v16 = v15;
  [(PXSurveyQuestionAssetGroupView *)self minYPositionForViewPosition:v5 totalNumberOfViews:v4];
  objc_msgSend(v8, "setFrame:", v16, v17, v12, v14);
  return v8;
}

- (void)_loadAndApplyImagesFromAssets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXSurveyQuestionAssetGroupView *)self presentedAssetIds];
  [v5 removeAllObjects];

  id v6 = [(PXSurveyQuestionAssetGroupView *)self assetCollection];
  id v7 = [v6 photoLibrary];
  double v8 = [v7 librarySpecificFetchOptions];

  unsigned int v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v4 options:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke;
  v10[3] = &unk_1E5DC4908;
  v10[4] = self;
  [v9 enumerateObjectsUsingBlock:v10];
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  id v7 = [*(id *)(a1 + 32) imageViewsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_2;
  block[3] = &unk_1E5DCB838;
  v18 = v20;
  uint64_t v19 = a3;
  block[4] = *(void *)(a1 + 32);
  double v17 = v6;
  double v8 = v6;
  dispatch_sync(v7, block);

  unsigned int v9 = dispatch_get_global_queue(25, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_3;
  v12[3] = &unk_1E5DCB838;
  uint64_t v10 = *(void *)(a1 + 32);
  double v14 = v20;
  uint64_t v15 = a3;
  v12[4] = v10;
  id v13 = v5;
  id v11 = v5;
  dispatch_group_notify(v8, v9, v12);

  _Block_object_dispose(v20, 8);
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_2(void *a1)
{
  unint64_t v2 = a1[7];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 < [*(id *)(a1[4] + 448) count];
  unsigned __int8 v3 = a1[5];
  dispatch_group_leave(v3);
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_3(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F390D0]);
    unsigned __int8 v3 = [*(id *)(a1[4] + 448) objectAtIndexedSubscript:a1[7]];
    uint64_t v4 = a1[5];
    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_4;
    v11[3] = &unk_1E5DC48E0;
    unsigned int v9 = (void *)a1[5];
    v11[4] = a1[4];
    id v12 = v9;
    id v13 = v3;
    id v10 = v3;
    objc_msgSend(v2, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 1, 0, v11, v6, v8);
  }
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) imageViewsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_5;
  block[3] = &unk_1E5DD32A8;
  double v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  dispatch_sync(v4, block);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_6;
  v7[3] = &unk_1E5DD32A8;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_5(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) presentedAssetIds];
  id v2 = [*(id *)(a1 + 40) localIdentifier];
  [v3 addObject:v2];
}

uint64_t __64__PXSurveyQuestionAssetGroupView__loadAndApplyImagesFromAssets___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (id)_arrangeAssetsForDisplay:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((unint64_t)[v3 count] < 3
    || [v3 count] == 4
    || [v3 count] == 9)
  {
    id v5 = v3;

    id v4 = v5;
    goto LABEL_5;
  }
  double v7 = [v3 firstObject];
  [v4 addObject:v7];

  [v3 removeObjectAtIndex:0];
  id v8 = 0;
  if ((unint64_t)[v3 count] >= 2)
  {
    id v8 = [v3 lastObject];
    [v3 removeLastObject];
  }
  if ((unint64_t)[v3 count] >= 4)
  {
    id v9 = [v3 objectAtIndexedSubscript:0];
    v23[0] = v9;
    id v10 = [v3 objectAtIndexedSubscript:1];
    v23[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v4 addObjectsFromArray:v11];

    if ((unint64_t)[v3 count] >= 9)
    {
      unint64_t v12 = ((unint64_t)[v3 count] >> 1) - 1;
      id v13 = objc_msgSend(v3, "objectAtIndexedSubscript:");
      v22[0] = v13;
      double v14 = [v3 objectAtIndexedSubscript:v12];
      v22[1] = v14;
      uint64_t v15 = [v3 objectAtIndexedSubscript:v12];
      v22[2] = v15;
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
      [v4 addObjectsFromArray:v16];
    }
    double v17 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 2);
    v18 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count", v17) - 1);
    v21[1] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v4 addObjectsFromArray:v19];

    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  id v20 = v3;

  id v4 = v20;
  if (v8) {
LABEL_16:
  }
    [v4 addObject:v8];
LABEL_17:

LABEL_5:
  return v4;
}

- (void)_beginImageFetchFromCollection
{
  objc_initWeak(&location, self);
  id v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke;
  block[3] = &unk_1E5DD20C8;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F390A0]);
  [v2 setFetchLimit:9];
  [v2 setIncludeHiddenAssets:0];
  [v2 setIncludeAllBurstAssets:0];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = __Block_byref_object_copy__205106;
  id v13 = __Block_byref_object_dispose__205107;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [*(id *)(a1 + 32) keyAssetLocalIdentifier];

  if (v3)
  {
    id v4 = (void *)v10[5];
    id v5 = [*(id *)(a1 + 32) keyAssetLocalIdentifier];
    [v4 addObject:v5];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*(void *)(a1 + 32) + 440) options:v2];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke_214;
    v8[3] = &unk_1E5DC48B8;
    v8[4] = &v9;
    [v5 enumerateObjectsUsingBlock:v8];
  }

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  double v7 = [v6 _arrangeAssetsForDisplay:v10[5]];
  [v6 _loadAndApplyImagesFromAssets:v7];

  _Block_object_dispose(&v9, 8);
}

void __64__PXSurveyQuestionAssetGroupView__beginImageFetchFromCollection__block_invoke_214(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 localIdentifier];
  [v2 addObject:v3];
}

- (void)_handleViewTap
{
  id v3 = [(PXSurveyQuestionAssetGroupView *)self delegate];
  objc_msgSend(v3, "px_surveyQuestionAssetGroupViewWasTapped:", self);
}

- (void)_setupMetadataView
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
  id v4 = [v3 superview];

  if (!v4)
  {
    id v5 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
    [(PXSurveyQuestionAssetGroupView *)self addSubview:v5];

    id v6 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
    double v7 = [v6 layer];
    [v7 setZPosition:1.79769313e308];

    id v8 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v9 = [(PXSurveyQuestionAssetGroupView *)self locationLabel];
    [v9 setTextColor:v8];

    double v10 = *MEMORY[0x1E4FB09D0];
    uint64_t v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB09D0]];
    unint64_t v12 = [(PXSurveyQuestionAssetGroupView *)self locationLabel];
    [v12 setFont:v11];

    id v13 = [MEMORY[0x1E4FB1618] whiteColor];
    id v14 = [(PXSurveyQuestionAssetGroupView *)self dateRangeLabel];
    [v14 setTextColor:v13];

    uint64_t v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:v10];
    double v16 = [(PXSurveyQuestionAssetGroupView *)self dateRangeLabel];
    [v16 setFont:v15];

    double v17 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
    [v17 addSubview:self->_locationLabel];

    v18 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
    [v18 addSubview:self->_dateRangeLabel];

    id v19 = [MEMORY[0x1E4FB1618] clearColor];
    v67[0] = [v19 CGColor];
    id v20 = [MEMORY[0x1E4FB1618] blackColor];
    id v21 = [v20 colorWithAlphaComponent:0.8];
    v67[1] = [v21 CGColor];
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
    v23 = [(PXSurveyQuestionAssetGroupView *)self metadataViewGradient];
    [v23 setColors:v22];

    [(PXSurveyQuestionAssetGroupView *)self bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    v32 = [(PXSurveyQuestionAssetGroupView *)self metadataViewGradient];
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    v33 = [(PXSurveyQuestionAssetGroupView *)self metadataViewGradient];
    [v33 setLocations:&unk_1F02D4DE0];

    v34 = [(PXSurveyQuestionAssetGroupView *)self metadataViewGradient];
    [v34 setZPosition:1000.0];

    v35 = [(PXSurveyQuestionAssetGroupView *)self layer];
    v36 = [(PXSurveyQuestionAssetGroupView *)self metadataViewGradient];
    [v35 addSublayer:v36];
  }
  [(PXSurveyQuestionAssetGroupView *)self bounds];
  double v38 = v37 * 0.666;
  [(PXSurveyQuestionAssetGroupView *)self bounds];
  double v40 = v39;
  [(PXSurveyQuestionAssetGroupView *)self bounds];
  double v42 = v41 / 3.0;
  v43 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
  objc_msgSend(v43, "setFrame:", 0.0, v38, v40, v42);

  v44 = [(PXSurveyQuestionAssetGroupView *)self delegate];
  v45 = objc_msgSend(v44, "px_surveyQuestionAssetGroupViewMetadataLocationString:", self);
  v46 = [(PXSurveyQuestionAssetGroupView *)self locationLabel];
  [v46 setText:v45];

  v47 = [(PXSurveyQuestionAssetGroupView *)self delegate];
  v48 = objc_msgSend(v47, "px_surveyQuestionAssetGroupViewMetadataDateRangeStringWithFormatter:assetGroupView:", self->_dateFormatter, self);
  v49 = [(PXSurveyQuestionAssetGroupView *)self dateRangeLabel];
  [v49 setText:v48];

  v50 = [(PXSurveyQuestionAssetGroupView *)self locationLabel];
  v51 = [v50 text];
  if ([v51 length]) {
    goto LABEL_6;
  }
  v52 = [(PXSurveyQuestionAssetGroupView *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v50 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingNoLocation", @"PhotosUICore");
    v51 = [(PXSurveyQuestionAssetGroupView *)self locationLabel];
    [v51 setText:v50];
LABEL_6:
  }
  v54 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
  [v54 bounds];
  double v56 = v55 + -40.0;
  v57 = [(PXSurveyQuestionAssetGroupView *)self metadataView];
  [v57 bounds];
  double v59 = v58 + -20.0;
  v60 = [(PXSurveyQuestionAssetGroupView *)self dateRangeLabel];
  objc_msgSend(v60, "setFrame:", 10.0, v56, v59, 40.0);

  v61 = [(PXSurveyQuestionAssetGroupView *)self dateRangeLabel];
  [v61 frame];
  double v63 = v62 + -20.0;
  [(PXSurveyQuestionAssetGroupView *)self bounds];
  double v65 = v64 + -20.0;
  v66 = [(PXSurveyQuestionAssetGroupView *)self locationLabel];
  objc_msgSend(v66, "setFrame:", 10.0, v63, v65, 40.0);
}

- (void)_setupViews
{
  id v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(PXSurveyQuestionAssetGroupView *)self setBackgroundColor:v3];

  uint64_t v4 = [(PXSurveyQuestionAssetGroupView *)self _getTotalViews];
  id v5 = dispatch_group_create();
  if (v4)
  {
    unsigned __int8 v6 = 1;
    do
    {
      dispatch_group_enter(v5);
      double v7 = [(PXSurveyQuestionAssetGroupView *)self _imageViewForPosition:v6 totalViewCount:v4];
      [v7 setContentMode:2];
      [v7 setClipsToBounds:1];
      if (v6) {
        [MEMORY[0x1E4FB1618] secondarySystemFillColor];
      }
      else {
      id v8 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
      }
      [v7 setBackgroundColor:v8];

      uint64_t v9 = [(PXSurveyQuestionAssetGroupView *)self imageViewsQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke;
      block[3] = &unk_1E5DD0F30;
      block[4] = self;
      id v13 = v7;
      id v14 = v5;
      id v10 = v7;
      dispatch_sync(v9, block);

      ++v6;
    }
    while (v4 >= v6);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_3;
  v11[3] = &unk_1E5DD36F8;
  v11[4] = self;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v11);
  [(PXSurveyQuestionAssetGroupView *)self _setupMetadataView];
}

uint64_t __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginImageFetchFromCollection];
}

void __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) imageViews];
  [v2 addObject:*(void *)(a1 + 40)];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_2;
  block[3] = &unk_1E5DD0F30;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__PXSurveyQuestionAssetGroupView__setupViews__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  id v2 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v2);
}

- (unsigned)_getTotalViews
{
  customMaximumPreviewAssetCount = self->_customMaximumPreviewAssetCount;
  if (customMaximumPreviewAssetCount) {
    return [(NSNumber *)customMaximumPreviewAssetCount intValue];
  }
  if ([(PHAssetCollection *)self->_assetCollection estimatedAssetCount] < 2) {
    return 1;
  }
  if ([(PHAssetCollection *)self->_assetCollection estimatedAssetCount] < 4) {
    return 2;
  }
  if ([(PHAssetCollection *)self->_assetCollection estimatedAssetCount] >= 9) {
    return 9;
  }
  return 4;
}

- (NSMutableArray)imageViews
{
  imageViews = self->_imageViews;
  if (!imageViews)
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_imageViews;
    self->_imageViews = v4;

    imageViews = self->_imageViews;
  }
  return imageViews;
}

- (OS_dispatch_queue)imageViewsQueue
{
  imageViewsQueue = self->_imageViewsQueue;
  if (!imageViewsQueue)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    id v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.ui.photosChallenge.imageViewsQueue", v4);
    id v6 = self->_imageViewsQueue;
    self->_imageViewsQueue = v5;

    imageViewsQueue = self->_imageViewsQueue;
  }
  return imageViewsQueue;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXSurveyQuestionAssetGroupView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionAssetGroupView;
  -[PXSurveyQuestionAssetGroupView setFrame:](&v18, sel_setFrame_, x, y, width, height);
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  if (!CGRectEqualToRect(v19, v20))
  {
    double v16 = [(PXSurveyQuestionAssetGroupView *)self imageViewsQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_sync(v16, block);
  }
}

void __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 448) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 448) enumerateObjectsUsingBlock:&__block_literal_global_205126];
    [*(id *)(*(void *)(a1 + 32) + 448) removeAllObjects];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke_3;
  block[3] = &unk_1E5DD36F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupViews];
}

uint64_t __43__PXSurveyQuestionAssetGroupView_setFrame___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (id)validCustomMaximumPreviewAssetCountForCustomMaximumPreviewAssetCount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 intValue];
    if (v5 <= 9 && ((1 << v5) & 0x216) != 0)
    {
      id v6 = v4;
      goto LABEL_8;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PXSurveyQuestionAssetGroupView] invalid customMaximumPreviewAssetCount input. Must be 1, 2, 4, or 9.", v8, 2u);
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (PXSurveyQuestionAssetGroupView)initWithAssetCollection:(id)a3 customMaximumPreviewAssetCount:(id)a4 keyAssetLocalIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PXSurveyQuestionAssetGroupView;
  double v12 = -[PXSurveyQuestionAssetGroupView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  CGFloat v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    v13->_double imagePadding = 2.0;
    double v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    presentedAssetIds = v13->_presentedAssetIds;
    v13->_presentedAssetIds = v14;

    double v16 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v13->_dateFormatter;
    v13->_dateFormatter = v16;

    objc_super v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    [(NSDateFormatter *)v13->_dateFormatter setLocale:v18];

    [(NSDateFormatter *)v13->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)v13->_dateFormatter setTimeStyle:0];
    CGRect v19 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    metadataView = v13->_metadataView;
    v13->_metadataView = v19;

    uint64_t v21 = [MEMORY[0x1E4F39BD0] layer];
    metadataViewGradient = v13->_metadataViewGradient;
    v13->_metadataViewGradient = (CAGradientLayer *)v21;

    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    locationLabel = v13->_locationLabel;
    v13->_locationLabel = v23;

    double v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dateRangeLabel = v13->_dateRangeLabel;
    v13->_dateRangeLabel = v25;

    double v27 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v13 action:sel__handleViewTap];
    [(PXSurveyQuestionAssetGroupView *)v13 addGestureRecognizer:v27];
    uint64_t v28 = [(PXSurveyQuestionAssetGroupView *)v13 validCustomMaximumPreviewAssetCountForCustomMaximumPreviewAssetCount:v10];
    customMaximumPreviewAssetCount = v13->_customMaximumPreviewAssetCount;
    v13->_customMaximumPreviewAssetCount = (NSNumber *)v28;

    objc_storeStrong((id *)&v13->_keyAssetLocalIdentifier, a5);
  }

  return v13;
}

- (PXSurveyQuestionAssetGroupView)initWithAssetCollection:(id)a3
{
  return [(PXSurveyQuestionAssetGroupView *)self initWithAssetCollection:a3 customMaximumPreviewAssetCount:0 keyAssetLocalIdentifier:0];
}

@end