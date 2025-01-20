@interface SearchUIQuickLookThumbnailImage
- (BOOL)isCompact;
- (Class)classForCoder;
- (FPItemID)fpItemID;
- (NSURL)url;
- (QLThumbnailGenerationRequest)request;
- (SearchUIQuickLookThumbnailImage)initWithResult:(id)a3 url:(id)a4 isCompact:(BOOL)a5;
- (SearchUIQuickLookThumbnailImage)initWithSFImage:(id)a3;
- (int)defaultCornerRoundingStyle;
- (int64_t)bestRepresentationTypeLoaded;
- (unint64_t)representationType;
- (void)dealloc;
- (void)generateImageWithRequest:(id)a3 completionHandler:(id)a4;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setBestRepresentationTypeLoaded:(int64_t)a3;
- (void)setFpItemID:(id)a3;
- (void)setIsCompact:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setUrl:(id)a3;
- (void)setupRequest:(id)a3;
- (void)updateSize;
@end

@implementation SearchUIQuickLookThumbnailImage

- (SearchUIQuickLookThumbnailImage)initWithSFImage:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIQuickLookThumbnailImage;
  v5 = [(SearchUIImage *)&v16 initWithSFImage:v4];
  if (v5)
  {
    v6 = [v4 filePath];
    [(SearchUIQuickLookThumbnailImage *)v5 setUrl:v6];

    v7 = [v4 contentType];
    [(SearchUIQuickLookThumbnailImage *)v5 setContentType:v7];

    uint64_t v8 = [v4 coreSpotlightIdentifier];
    if (v8
      && (v9 = (void *)v8,
          [v4 fileProviderIdentifier],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      v11 = [v4 coreSpotlightIdentifier];
      v12 = [v4 fileProviderIdentifier];
      v13 = +[SearchUIUtilities fileProviderItemIDForCoreSpotlightIdentifier:v11 fileProviderIdentifier:v12];
      [(SearchUIQuickLookThumbnailImage *)v5 setFpItemID:v13];
    }
    else
    {
      v14 = [(SearchUIQuickLookThumbnailImage *)v5 url];

      if (v14)
      {
LABEL_9:
        [(SearchUIQuickLookThumbnailImage *)v5 updateSize];
        goto LABEL_10;
      }
      v11 = SearchUIGeneralLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SearchUIQuickLookThumbnailImage initWithSFImage:](v4, v11);
      }
    }

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (SearchUIQuickLookThumbnailImage)initWithResult:(id)a3 url:(id)a4 isCompact:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIQuickLookThumbnailImage;
  v10 = [(SearchUIQuickLookThumbnailImage *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(SearchUIQuickLookThumbnailImage *)v10 setUrl:v9];
    v12 = +[SearchUIUtilities fileProviderItemIDForFileResult:v8];
    [(SearchUIQuickLookThumbnailImage *)v11 setFpItemID:v12];

    [(SearchUIQuickLookThumbnailImage *)v11 setIsCompact:v5];
    [(SearchUIQuickLookThumbnailImage *)v11 updateSize];
  }

  return v11;
}

- (int)defaultCornerRoundingStyle
{
  return 1;
}

- (void)updateSize
{
  v3 = [(SearchUIImage *)self sfImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v8 == v5 && v9 == v7)
  {
    [MEMORY[0x1E4FAE100] maxThumbnailSize];
    -[SearchUIQuickLookThumbnailImage setSize:](self, "setSize:", v11, v11);
  }
}

- (void)dealloc
{
  v3 = [(SearchUIQuickLookThumbnailImage *)self request];
  if (v3)
  {
    double v4 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
    [v4 cancelRequest:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)SearchUIQuickLookThumbnailImage;
  [(SearchUIQuickLookThumbnailImage *)&v5 dealloc];
}

- (void)generateImageWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E6E72BF0;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v10];
  [(SearchUIQuickLookThumbnailImage *)self setRequest:v8];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) url];
  char v3 = [v2 hasDirectoryPath];

  double v4 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6E72BC8;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  char v9 = v3;
  id v7 = *(id *)(a1 + 48);
  [v4 generateRepresentationsForRequest:v5 updateHandler:v6];

  objc_destroyWeak(&v8);
}

void __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  char v9 = [v7 UIImage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_3;
  v11[3] = &unk_1E6E72BA0;
  v14[1] = a3;
  id v10 = v9;
  id v12 = v10;
  objc_copyWeak(v14, (id *)(a1 + 40));
  char v15 = *(unsigned char *)(a1 + 48);
  id v13 = *(id *)(a1 + 32);
  +[SearchUIUtilities dispatchMainIfNecessary:v11];

  objc_destroyWeak(v14);
}

void __78__SearchUIQuickLookThumbnailImage_generateImageWithRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (!*(void *)(a1 + 32)) {
    goto LABEL_15;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v2 <= [WeakRetained bestRepresentationTypeLoaded])
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = [v5 uiImage];
    if (v6)
    {

LABEL_14:
      goto LABEL_15;
    }
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v7 = *(void *)(a1 + 56);

      if (!v7) {
        goto LABEL_13;
      }
      goto LABEL_15;
    }

LABEL_12:
LABEL_13:
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    [v9 setBestRepresentationTypeLoaded:v8];

    uint64_t v10 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setUiImage:v10];
    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)(a1 + 56);

  if (!v4) {
    goto LABEL_13;
  }
LABEL_15:
  id v11 = (id *)(a1 + 48);
  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = [v12 uiImage];

  if (v13 || v2 == 2)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v16 = objc_loadWeakRetained(v11);
    char v15 = [v16 uiImage];
    (*(void (**)(uint64_t, void *, BOOL))(v14 + 16))(v14, v15, v2 == 2);
  }
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  [(SearchUIImage *)self size];
  id v9 = v8;
  id v11 = v10;
  id v12 = [(SearchUIQuickLookThumbnailImage *)self fpItemID];
  if (v12)
  {
    id v13 = SearchUIGeneralLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v12 coreSpotlightIdentifier];
      char v15 = [v12 providerID];
      *(_DWORD *)buf = 138412802;
      v28 = v12;
      __int16 v29 = 2112;
      v30 = v14;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1E45B5000, v13, OS_LOG_TYPE_DEFAULT, "SearchUIQuickLookThumbnailImage loadImageWithScale fpItemId: %@ coreSpotlightIdentifier: %@ fileProviderIdentifier: %@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v22[3] = &unk_1E6E72C40;
    id v23 = v12;
    v26[1] = v9;
    v26[2] = v11;
    v26[3] = *(id *)&a3;
    objc_copyWeak(v26, (id *)buf);
    v24 = self;
    id v25 = v7;
    +[SearchUIUtilities dispatchAsyncIfNecessary:v22];

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v16 = [(SearchUIQuickLookThumbnailImage *)self url];

    if (v16)
    {
      v17 = SearchUIGeneralLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(SearchUIQuickLookThumbnailImage *)self url];
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_impl(&dword_1E45B5000, v17, OS_LOG_TYPE_DEFAULT, "SearchUIQuickLookThumbnailImage loadImageWithScale url: %@", buf, 0xCu);
      }
      id v19 = objc_alloc(MEMORY[0x1E4F3A6C0]);
      v20 = [(SearchUIQuickLookThumbnailImage *)self url];
      v21 = objc_msgSend(v19, "initWithFileAtURL:size:scale:representationTypes:", v20, -[SearchUIQuickLookThumbnailImage representationType](self, "representationType"), *(double *)&v9, *(double *)&v11, a3);

      [(SearchUIQuickLookThumbnailImage *)self setupRequest:v21];
      [(SearchUIQuickLookThumbnailImage *)self generateImageWithRequest:v21 completionHandler:v7];
    }
    else
    {
      (*((void (**)(id, void, uint64_t))v7 + 2))(v7, 0, 1);
    }
  }
}

void __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F25D38] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6E72C18;
  long long v8 = *(_OWORD *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 80);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  uint64_t v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  [v2 fetchItemForItemID:v3 completionHandler:v5];

  objc_destroyWeak(&v7);
}

void __84__SearchUIQuickLookThumbnailImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F3A6C0]);
    double v4 = *(double *)(a1 + 72);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v6 = objc_msgSend(v3, "initWithFPItem:size:scale:representationTypes:", v8, objc_msgSend(WeakRetained, "representationType"), *(double *)(a1 + 56), *(double *)(a1 + 64), v4);

    [*(id *)(a1 + 32) setupRequest:v6];
    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    [v7 generateImageWithRequest:v6 completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setupRequest:(id)a3
{
  id v11 = a3;
  [v11 setIconVariant:1];
  [v11 setIconMode:1];
  double v4 = [(SearchUIImage *)self sfImage];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  if (v6 != *MEMORY[0x1E4F1DB30] || v8 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if (v6 >= v8) {
      double v10 = v8;
    }
    else {
      double v10 = v6;
    }
    [v11 setMinimumDimension:v10];
  }
}

- (unint64_t)representationType
{
  if ([(SearchUIQuickLookThumbnailImage *)self isCompact]) {
    return 1;
  }
  else {
    return -1;
  }
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (FPItemID)fpItemID
{
  return self->_fpItemID;
}

- (void)setFpItemID:(id)a3
{
}

- (QLThumbnailGenerationRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (QLThumbnailGenerationRequest *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
}

- (int64_t)bestRepresentationTypeLoaded
{
  return self->_bestRepresentationTypeLoaded;
}

- (void)setBestRepresentationTypeLoaded:(int64_t)a3
{
  self->_bestRepresentationTypeLoaded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->_fpItemID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithSFImage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = [a1 coreSpotlightIdentifier];
  double v5 = [a1 fileProviderIdentifier];
  int v6 = 138412546;
  double v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIQuickLookThumbnailImage: missing info for quicklookthumbnail: corespotlightIdentifier: %@ fileprovideridentifier: %@", (uint8_t *)&v6, 0x16u);
}

@end