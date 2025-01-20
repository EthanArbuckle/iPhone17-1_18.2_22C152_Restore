@interface PXOfflinePHAsset
+ (id)createOfflinePHAssetUsingOfflineAssets:(id)a3;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)px_storyResourceFetchBestPlaybackRange;
- (CGRect)acceptableCropRect;
- (CGRect)bestCropRectForAspectRatio:(double)a3;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (CGRect)px_storyResourceFetchBestPlaybackRect;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5;
- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5;
- (NSData)px_storyResourceFetchNormalizationData;
- (NSSet)px_storyResourceFetchSceneClassifications;
- (PFVideoAdjustments)px_storyResourceFetchVideoAdjustments;
- (PHAsset)asset;
- (PHPhotoLibrary)photoLibrary;
- (PXOfflinePHAsset)initWithURL:(id)a3 matchingPHAsset:(id)a4;
- (PXOfflinePHAsset)initWithURL:(id)a3 matchingPHAssetUUID:(id)a4;
- (double)px_storyResourceFetchCurationScore;
- (id)localizedGeoDescription;
- (id)uuid;
- (int64_t)px_storyResourceFetchFaceCount;
- (int64_t)px_storyResourceKind;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
@end

@implementation PXOfflinePHAsset

- (void).cxx_destruct
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (int64_t)px_storyResourceKind
{
  return 1;
}

- (int64_t)px_storyResourceFetchFaceCount
{
  v2 = [(PXOfflinePHAsset *)self asset];
  int64_t v3 = objc_msgSend(v2, "px_storyResourceFetchFaceCount");

  return v3;
}

- (double)px_storyResourceFetchCurationScore
{
  v2 = [(PXOfflinePHAsset *)self asset];
  objc_msgSend(v2, "px_storyResourceFetchCurationScore");
  double v4 = v3;

  return v4;
}

- (NSSet)px_storyResourceFetchSceneClassifications
{
  v2 = [(PXOfflinePHAsset *)self asset];
  double v3 = objc_msgSend(v2, "px_storyResourceFetchSceneClassifications");

  return (NSSet *)v3;
}

- (NSData)px_storyResourceFetchNormalizationData
{
  v2 = [(PXOfflinePHAsset *)self asset];
  double v3 = objc_msgSend(v2, "px_storyResourceFetchNormalizationData");

  return (NSData *)v3;
}

- (CGRect)px_storyResourceFetchBestPlaybackRect
{
  v2 = [(PXOfflinePHAsset *)self asset];
  objc_msgSend(v2, "px_storyResourceFetchBestPlaybackRect");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)px_storyResourceFetchBestPlaybackRange
{
  double v4 = [(PXOfflinePHAsset *)self asset];
  if (v4)
  {
    double v6 = v4;
    objc_msgSend(v4, "px_storyResourceFetchBestPlaybackRange");
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (PFVideoAdjustments)px_storyResourceFetchVideoAdjustments
{
  v2 = [(PXOfflinePHAsset *)self asset];
  double v3 = objc_msgSend(v2, "px_storyResourceFetchVideoAdjustments");

  return (PFVideoAdjustments *)v3;
}

- (id)localizedGeoDescription
{
  double v3 = [(PXOfflinePHAsset *)self asset];

  if (v3)
  {
    double v4 = [(PXOfflinePHAsset *)self asset];
    double v5 = [v4 localizedGeoDescription];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    double v5 = [(PXOfflinePHAsset *)&v7 localizedGeoDescription];
  }
  return v5;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  double v13 = [(PXOfflinePHAsset *)self asset];

  if (v13)
  {
    double v14 = [(PXOfflinePHAsset *)self asset];
    objc_msgSend(v14, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", a5, v11, v10, x, y, width, height);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB20];
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withOcclusionRegion:(CGRect)a4 andOutputCropScore:(double *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  double v13 = [(PXOfflinePHAsset *)self asset];

  if (v13)
  {
    double v14 = [(PXOfflinePHAsset *)self asset];
    objc_msgSend(v14, "suggestedCropForTargetSize:withOcclusionRegion:andOutputCropScore:", a5, v11, v10, x, y, width, height);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)PXOfflinePHAsset;
    -[PXOfflinePHAsset suggestedCropForTargetSize:withOcclusionRegion:andOutputCropScore:](&v31, sel_suggestedCropForTargetSize_withOcclusionRegion_andOutputCropScore_, a5, v11, v10, x, y, width, height);
    double v16 = v23;
    double v18 = v24;
    double v20 = v25;
    double v22 = v26;
  }
  double v27 = v16;
  double v28 = v18;
  double v29 = v20;
  double v30 = v22;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3 withFocusRegion:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  double v11 = [(PXOfflinePHAsset *)self asset];

  if (v11)
  {
    double v12 = [(PXOfflinePHAsset *)self asset];
    objc_msgSend(v12, "suggestedCropForTargetSize:withFocusRegion:", v9, v8, x, y, width, height);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)PXOfflinePHAsset;
    -[PXOfflinePHAsset suggestedCropForTargetSize:withFocusRegion:](&v29, sel_suggestedCropForTargetSize_withFocusRegion_, v9, v8, x, y, width, height);
    double v14 = v21;
    double v16 = v22;
    double v18 = v23;
    double v20 = v24;
  }
  double v25 = v14;
  double v26 = v16;
  double v27 = v18;
  double v28 = v20;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)suggestedCropForTargetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(PXOfflinePHAsset *)self asset];

  if (v6)
  {
    objc_super v7 = [(PXOfflinePHAsset *)self asset];
    objc_msgSend(v7, "suggestedCropForTargetSize:", width, height);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  double v5 = [(PXOfflinePHAsset *)self asset];

  if (v5)
  {
    double v6 = [(PXOfflinePHAsset *)self asset];
    [v6 bestCropRectForAspectRatio:a3];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)PXOfflinePHAsset;
    [(PXFileBackedAsset *)&v23 bestCropRectForAspectRatio:a3];
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
    double v14 = v18;
  }
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)faceAreaRect
{
  double v3 = [(PXOfflinePHAsset *)self asset];
  if (v3)
  {
    double v4 = [(PXOfflinePHAsset *)self asset];
    [v4 faceAreaRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PXOfflinePHAsset;
    [(PXFileBackedAsset *)&v21 faceAreaRect];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }

  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v3 = [(PXOfflinePHAsset *)self asset];

  if (v3)
  {
    double v4 = [(PXOfflinePHAsset *)self asset];
    [v4 acceptableCropRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PXOfflinePHAsset;
    [(PXFileBackedAsset *)&v21 acceptableCropRect];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)preferredCropRect
{
  double v3 = [(PXOfflinePHAsset *)self asset];

  if (v3)
  {
    double v4 = [(PXOfflinePHAsset *)self asset];
    [v4 preferredCropRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PXOfflinePHAsset;
    [(PXFileBackedAsset *)&v21 preferredCropRect];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)uuid
{
  double v3 = [(PXOfflinePHAsset *)self asset];

  if (v3)
  {
    double v4 = [(PXOfflinePHAsset *)self asset];
    double v5 = [v4 uuid];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    double v5 = [(PXFileBackedAsset *)&v7 uuid];
  }
  return v5;
}

- (unint64_t)pixelHeight
{
  double v3 = [(PXOfflinePHAsset *)self asset];
  if (v3)
  {
    double v4 = [(PXOfflinePHAsset *)self asset];
    id v5 = (id)[v4 pixelHeight];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    id v5 = [(PXFileBackedAsset *)&v7 pixelHeight];
  }

  return (unint64_t)v5;
}

- (unint64_t)pixelWidth
{
  double v3 = [(PXOfflinePHAsset *)self asset];
  if (v3)
  {
    double v4 = [(PXOfflinePHAsset *)self asset];
    id v5 = (id)[v4 pixelWidth];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXOfflinePHAsset;
    id v5 = [(PXFileBackedAsset *)&v7 pixelWidth];
  }

  return (unint64_t)v5;
}

- (PHPhotoLibrary)photoLibrary
{
  v2 = [(PXOfflinePHAsset *)self asset];
  double v3 = [v2 photoLibrary];

  return (PHPhotoLibrary *)v3;
}

- (PXOfflinePHAsset)initWithURL:(id)a3 matchingPHAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXOfflinePHAsset.m", 38, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  double v9 = +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:v7];
  double v10 = [(PXFileBackedAsset *)self initWithDescription:v9];

  if (v10) {
    objc_storeStrong((id *)&v10->_asset, a4);
  }

  return v10;
}

- (PXOfflinePHAsset)initWithURL:(id)a3 matchingPHAssetUUID:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXOfflinePHAsset.m", 26, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  double v9 = +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:v7];
  v19.receiver = self;
  v19.super_class = (Class)PXOfflinePHAsset;
  double v10 = [(PXFileBackedAsset *)&v19 initWithDescription:v9];

  if (!v10) {
    goto LABEL_5;
  }
  double v11 = (void *)MEMORY[0x1E4F38EB8];
  v20[0] = v8;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  double v13 = [v11 fetchAssetsWithUUIDs:v12 options:0];
  uint64_t v14 = [v13 firstObject];
  asset = v10->_asset;
  v10->_asset = (PHAsset *)v14;

  if (!v10->_asset) {
    double v16 = 0;
  }
  else {
LABEL_5:
  }
    double v16 = v10;

  return v16;
}

+ (id)createOfflinePHAssetUsingOfflineAssets:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke;
  v21[3] = &unk_1E5DBB678;
  id v22 = v5;
  id v7 = v6;
  id v23 = v7;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v21];

  double v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v8 options:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke_2;
  double v18 = &unk_1E5DBB6A0;
  id v19 = v7;
  id v20 = v10;
  id v11 = v10;
  id v12 = v7;
  [v9 enumerateObjectsUsingBlock:&v15];
  double v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);

  return v13;
}

void __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 assetUUID];
  [v3 addObject:v5];

  id v8 = [v4 localAssetURL];
  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 assetUUID];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

void __59__PXOfflinePHAsset_createOfflinePHAssetUsingOfflineAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PXOfflinePHAsset alloc];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 uuid];
  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [(PXOfflinePHAsset *)v4 initWithURL:v7 matchingPHAsset:v3];

  [*(id *)(a1 + 40) addObject:v8];
}

@end