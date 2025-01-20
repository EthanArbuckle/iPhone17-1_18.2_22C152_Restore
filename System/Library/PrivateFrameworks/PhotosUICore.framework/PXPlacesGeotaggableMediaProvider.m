@interface PXPlacesGeotaggableMediaProvider
- (id)_fetchImageManagerAssetForPlacesAsset:(id)a3;
- (void)_imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6;
- (void)imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6;
@end

@implementation PXPlacesGeotaggableMediaProvider

- (id)_fetchImageManagerAssetForPlacesAsset:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    v4 = [v3 photoLibrary];
    v5 = [v4 librarySpecificFetchOptions];

    v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_placesFetchOptionsWith:", v5);

    uint64_t v7 = *MEMORY[0x1E4F39440];
    v16[0] = *MEMORY[0x1E4F394B0];
    v16[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v6 setFetchPropertySets:v8];

    v9 = (void *)MEMORY[0x1E4F38EB8];
    v10 = [v3 localIdentifier];

    v15 = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    v12 = [v9 fetchAssetsWithLocalIdentifiers:v11 options:v6];
    v13 = [v12 firstObject];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)_imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6
{
  BOOL v6 = a5;
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  v12 = [(PXPlacesGeotaggableMediaProvider *)self _fetchImageManagerAssetForPlacesAsset:a3];
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E4F8A930];
    v15 = [v12 coarseLocationProperties];
    [v15 gpsHorizontalAccuracy];
    char v16 = objc_msgSend(v14, "horizontalAccuracyIsCoarse:");

    id v17 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    [v17 setResizeMode:2];
    [v17 setNetworkAccessAllowed:v6];
    [v17 setDeliveryMode:1];
    if ([v13 mediaSubtypes])
    {
      double height = height * 3.0;
      double width = width * 3.0;
    }
    v18 = [MEMORY[0x1E4F390D0] defaultManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__PXPlacesGeotaggableMediaProvider__imageForGeotaggable_ofSize_networkAccessAllowed_andCompletion___block_invoke;
    v19[3] = &unk_1E5DC34F0;
    id v21 = v11;
    char v22 = v16;
    id v20 = v13;
    objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v20, 1, v17, v19, width, height);
  }
  else if (v11)
  {
    (*((void (**)(id, void, void, void, void))v11 + 2))(v11, 0, 0, 0, 0);
  }
}

void __99__PXPlacesGeotaggableMediaProvider__imageForGeotaggable_ofSize_networkAccessAllowed_andCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v9 = v5;
    BOOL v6 = CGImageRetain((CGImageRef)[a2 CGImage]);
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v7 = (void *)[v9 mutableCopy];
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:PKPlacesCoarseLocationMediaInfoKey];

      id v8 = v7;
    }
    else
    {
      id v8 = v9;
    }
    id v10 = v8;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    CGImageRelease(v6);
    id v5 = v10;
  }
}

- (void)imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1AD10CB00]();
  -[PXPlacesGeotaggableMediaProvider _imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:](self, "_imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v13, v7, v11, width, height);
}

@end