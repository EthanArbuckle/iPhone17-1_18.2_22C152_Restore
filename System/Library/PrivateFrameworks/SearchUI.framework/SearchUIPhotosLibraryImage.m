@interface SearchUIPhotosLibraryImage
- (BOOL)supportsFastPathShadow;
- (CGSize)pixelSize;
- (CGSize)size;
- (PHAsset)asset;
- (PHFetchResult)fetchResult;
- (id)fetchAsset;
- (id)photoIdentifier;
- (void)fetchAsset;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)rejectPerson:(id)a3;
- (void)setAsset:(id)a3;
- (void)setFetchResult:(id)a3;
- (void)setPixelSize:(CGSize)a3;
@end

@implementation SearchUIPhotosLibraryImage

- (CGSize)size
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUIPhotosLibraryImage;
  [(SearchUIImage *)&v12 size];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == v3 && v7 == v6)
  {
    v9 = [(SearchUIPhotosLibraryImage *)self fetchAsset];
    double v4 = (double)(unint64_t)[v9 pixelWidth];
    double v6 = (double)(unint64_t)[v9 pixelHeight];
    -[SearchUIPhotosLibraryImage setPixelSize:](self, "setPixelSize:", v4, v6);
    -[SearchUIPhotosLibraryImage setSize:](self, "setSize:", v4, v6);
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)photoIdentifier
{
  v2 = [(SearchUIImage *)self sfImage];
  double v3 = [v2 photoIdentifier];

  return v3;
}

- (id)fetchAsset
{
  v20[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(SearchUIPhotosLibraryImage *)self asset];
  if (!v3)
  {
    uint64_t v4 = [(SearchUIPhotosLibraryImage *)self photoIdentifier];
    double v5 = (void *)v4;
    if (v4)
    {
      v20[0] = v4;
      double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      double v7 = [(SearchUIImage *)self sfImage];
      v8 = +[SearchUIPhotosUtilities fetchResultForPhotoIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPhotoIdentifiers:isSyndicated:", v6, [v7 isSyndicated]);

      double v3 = [v8 firstObject];
      [(SearchUIPhotosLibraryImage *)self setAsset:v3];
      [(SearchUIPhotosLibraryImage *)self setFetchResult:v8];
      if (![v8 count])
      {
        v9 = SearchUIGeneralLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          double v11 = NSNumber;
          objc_super v12 = [(SearchUIImage *)self sfImage];
          v13 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isSyndicated"));
          int v14 = 138412802;
          v15 = v5;
          __int16 v16 = 2112;
          v17 = v8;
          __int16 v18 = 2112;
          v19 = v13;
          _os_log_error_impl(&dword_1E45B5000, v9, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: No assets fetched for photoIdentifier: %@ from fetchResult: %@ isSyndicated: %@", (uint8_t *)&v14, 0x20u);
        }
      }
    }
    else
    {
      v8 = SearchUIGeneralLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SearchUIPhotosLibraryImage fetchAsset](self);
      }
      double v3 = 0;
    }
  }
  return v3;
}

- (BOOL)supportsFastPathShadow
{
  return 1;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v8 = [(SearchUIPhotosLibraryImage *)self photoIdentifier];

  if (v8)
  {
    [(SearchUIPhotosLibraryImage *)self pixelSize];
    if (v10 == *MEMORY[0x1E4F1DB30] && v9 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [(SearchUIPhotosLibraryImage *)self size];
      double v14 = v16 * a3;
      [(SearchUIPhotosLibraryImage *)self size];
      double v12 = v17 * a3;
    }
    else
    {
      [(SearchUIPhotosLibraryImage *)self pixelSize];
      double v14 = v13;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v18[3] = &unk_1E6E73428;
    v18[4] = self;
    double v20 = v14;
    double v21 = v12;
    id v19 = v7;
    +[SearchUIUtilities dispatchAsyncIfNecessary:v18];
  }
  else
  {
    v15 = SearchUIGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SearchUIPhotosLibraryImage loadImageWithScale:isDarkStyle:completionHandler:](v15);
    }

    (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, 1);
  }
}

void __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fetchAsset];
  double v3 = objc_opt_new();
  [v3 setNetworkAccessAllowed:1];
  if (v2 && ([v2 isHidden] & 1) == 0)
  {
    double v5 = [MEMORY[0x1E4F390D0] defaultManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
    v6[3] = &unk_1E6E73400;
    id v7 = v2;
    id v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 1, v3, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    uint64_t v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_cold_1(v2);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *MEMORY[0x1E4F396F8];
  if (!v5)
  {
    double v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
    double v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F39690]];
    double v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    double v12 = SearchUIGeneralLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v17 = *(void **)(a1 + 32);
      __int16 v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "isHidden"));
      double v16 = [*(id *)(a1 + 32) photoLibrary];
      objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "syndicationState"));
      *(_DWORD *)buf = 138413826;
      double v20 = v17;
      __int16 v21 = 2112;
      v22 = v18;
      __int16 v23 = 2112;
      v24 = v16;
      v26 = __int16 v25 = 2112;
      v15 = (void *)v26;
      __int16 v27 = 2112;
      v28 = v9;
      __int16 v29 = 2112;
      v30 = v10;
      __int16 v31 = 2112;
      v32 = v11;
      _os_log_error_impl(&dword_1E45B5000, v12, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: missing image for asset: %@ isHidden: %@ photoLibrary: %@ syndicationState: %@ isImageDegraded: %@ isImageCancelled: %@ error: %@", buf, 0x48u);
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  double v14 = [v7 objectForKeyedSubscript:v8];
  (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v5, [v14 BOOLValue] ^ 1);
}

- (void)rejectPerson:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 photosIdentifier];
  if (v4)
  {
    id v5 = [(SearchUIImage *)self sfImage];
    uint64_t v6 = [v5 isSyndicated];

    v16[0] = v4;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v8 = +[SearchUIPhotosUtilities fetchResultForPersonIdentifiers:v7 isSyndicated:v6];

    double v9 = [v8 firstObject];
    double v10 = [v9 photoLibrary];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke;
    v13[3] = &unk_1E6E72938;
    v13[4] = self;
    id v14 = v9;
    id v15 = v10;
    id v11 = v10;
    id v12 = v9;
    [v11 performChanges:v13 completionHandler:&__block_literal_global_18];
  }
}

void __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke(uint64_t a1)
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v2 = (id)[*(id *)(a1 + 32) fetchAsset];
  double v3 = [*(id *)(a1 + 32) fetchResult];
  if ([v3 count])
  {
    uint64_t v4 = [*(id *)(a1 + 32) fetchResult];
    id v5 = [v4 fetchedObjectIDs];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  if ([v5 count])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assetForFace in (%@)", v5];
    v33[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assetForTorso in (%@)", v5];
    v33[1] = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    v30 = [v6 orPredicateWithSubpredicates:v9];

    double v10 = (void *)MEMORY[0x1E4F28BA0];
    id v11 = (void *)MEMORY[0x1E4F28F60];
    id v12 = (void *)MEMORY[0x1E4F391F0];
    uint64_t v13 = [*(id *)(a1 + 40) localIdentifier];
    id v14 = [v12 uuidFromLocalIdentifier:v13];
    id v15 = [v11 predicateWithFormat:@"noindex:(personForFace) = %@", v14];
    v32[0] = v15;
    double v16 = (void *)MEMORY[0x1E4F28F60];
    double v17 = (void *)MEMORY[0x1E4F391F0];
    __int16 v18 = [*(id *)(a1 + 40) localIdentifier];
    id v19 = [v17 uuidFromLocalIdentifier:v18];
    double v20 = [v16 predicateWithFormat:@"noindex:(personForTorso) = %@", v19];
    v32[1] = v20;
    __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v22 = [v10 orPredicateWithSubpredicates:v21];

    __int16 v23 = (void *)MEMORY[0x1E4F28BA0];
    v31[0] = v30;
    v31[1] = v22;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    __int16 v25 = [v23 andPredicateWithSubpredicates:v24];

    uint64_t v26 = +[SearchUIPhotosUtilities fetchOptionsForLibrary:*(void *)(a1 + 48)];
    [v26 setIncludeTorsoOnlyDetectionData:1];
    [v26 setInternalPredicate:v25];
    __int16 v27 = [MEMORY[0x1E4F39050] fetchFacesWithOptions:v26];
    v28 = [v27 fetchedObjects];
    __int16 v29 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 40)];
    if (([*(id *)(a1 + 40) isVerified] & 1) == 0) {
      [v29 setVerified:1];
    }
    [v29 removeFaces:v28];
    [v29 addRejectedFaces:v28 forCluster:0];
  }
}

void __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = SearchUIGeneralLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke_2_cold_1((uint64_t)v4, v5);
    }
  }
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAsset:(id)a3
{
}

- (PHFetchResult)fetchResult
{
  return (PHFetchResult *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFetchResult:(id)a3
{
}

- (CGSize)pixelSize
{
  objc_copyStruct(v4, &self->_pixelSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPixelSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_pixelSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)fetchAsset
{
  v1 = [a1 sfImage];
  OUTLINED_FUNCTION_0_0(&dword_1E45B5000, v2, v3, "SearchUIPhotosLibraryImage: missing photoIdentifier for image: %@", v4, v5, v6, v7, 2u);
}

- (void)loadImageWithScale:(os_log_t)log isDarkStyle:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: missing photoIdentifier. no asset to fetch", v1, 2u);
}

void __79__SearchUIPhotosLibraryImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isHidden"));
  OUTLINED_FUNCTION_0_0(&dword_1E45B5000, v2, v3, "SearchUIPhotosLibraryImage: missing asset: isHidden: %@", v4, v5, v6, v7, 2u);
}

void __43__SearchUIPhotosLibraryImage_rejectPerson___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIPhotosLibraryImage: rejectPersonError: %@", (uint8_t *)&v2, 0xCu);
}

@end