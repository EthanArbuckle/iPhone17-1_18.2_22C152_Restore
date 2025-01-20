@interface PXStoryBaseDisplayAssetCroppingContext
- (OS_os_log)log;
- (PHFetchOptions)fetchOptions;
- (PXStoryBaseDisplayAssetCroppingContext)init;
- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4;
- (id)cropContentRectsForMultipartPanoramaAsset:(id)a3 axis:(int64_t)a4 cropContentsRectsApectRatio:(double)a5;
- (id)orderedFacesForAsset:(id)a3 featuredFaceCount:(int64_t *)a4;
- (void)requestIndividualFaceRectsInAsset:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
@end

@implementation PXStoryBaseDisplayAssetCroppingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (PHFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (OS_os_log)log
{
  return self->_log;
}

- (id)cropContentRectsForMultipartPanoramaAsset:(id)a3 axis:(int64_t)a4 cropContentsRectsApectRatio:(double)a5
{
}

- (void)requestIndividualFaceRectsInAsset:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, os_signpost_id_t *, void, void *))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(PXStoryBaseDisplayAssetCroppingContext *)self log];
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
    v11 = v9;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = [v7 uuid];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "StoryIndividualFaceRectsRequest", "uuid=%{signpost.description:attribute}@", buf, 0xCu);
    }
    v27[0] = v10;

    *(void *)buf = 0;
    v14 = [(PXStoryBaseDisplayAssetCroppingContext *)self orderedFacesForAsset:v7 featuredFaceCount:buf];
    uint64_t v15 = [v14 count];
    v27[1] = (os_signpost_id_t)v27;
    double v17 = MEMORY[0x1F4188790](v15, v16);
    v19 = &v27[-4 * v18];
    if (v18 >= 1)
    {
      v20 = objc_msgSend(v14, "objectAtIndexedSubscript:", 0, v17, v27[0]);
      [v20 centerX];
      [v20 centerY];
      [v20 size];
      double v22 = v21;
      [v20 size];
      objc_msgSend(v20, "px_faceTileSizeAdjustingForImageAspectRatio:", v22, v23);
      PXRectWithCenterAndSize();
    }
    v24 = v12;
    v25 = v24;
    if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v24))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_END, v27[0], "StoryIndividualFaceRectsRequest", "", v28, 2u);
    }

    v8[2](v8, v15, v19, *(void *)buf, v14);
  }
  else
  {
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)buf = *MEMORY[0x1E4F1DB20];
    long long v30 = v26;
    v8[2](v8, 0, (os_signpost_id_t *)buf, 0, 0);
  }
}

- (id)adjustOrderedFaces:(id)a3 featuredFaceCount:(int64_t *)a4
{
  return a3;
}

- (id)orderedFacesForAsset:(id)a3 featuredFaceCount:(int64_t *)a4
{
  v6 = (void *)MEMORY[0x1E4F39050];
  id v7 = a3;
  v8 = [(PXStoryBaseDisplayAssetCroppingContext *)self fetchOptions];
  v9 = [v6 fetchFacesInAsset:v7 options:v8];

  os_signpost_id_t v10 = [(PXStoryBaseDisplayAssetCroppingContext *)self adjustOrderedFaces:v9 featuredFaceCount:a4];

  return v10;
}

- (PXStoryBaseDisplayAssetCroppingContext)init
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PXStoryBaseDisplayAssetCroppingContext;
  v2 = [(PXStoryBaseDisplayAssetCroppingContext *)&v14 init];
  if (v2)
  {
    v3 = (const char *)*MEMORY[0x1E4F8C518];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = objc_claimAutoreleasedReturnValue();
    os_log_t v6 = os_log_create(v3, (const char *)[v5 UTF8String]);
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    v8 = (PHFetchOptions *)objc_alloc_init(MEMORY[0x1E4F390A0]);
    fetchOptions = v2->_fetchOptions;
    v2->_fetchOptions = v8;

    os_signpost_id_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"size" ascending:0];
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"quality" ascending:0];
    v15[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [(PHFetchOptions *)v2->_fetchOptions setSortDescriptors:v12];
  }
  return v2;
}

@end