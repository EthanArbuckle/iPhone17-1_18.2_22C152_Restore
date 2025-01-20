@interface QLItemThumbnailGenerator
- (id)fetcherClassesForPreviewItem:(id)a3;
- (void)_generateThumbnailForRequest:(id)a3 completionHandler:(id)a4;
- (void)_generateThumbnailWithData:(id)a3 contentType:(id)a4 size:(CGSize)a5 minimumDimension:(double)a6 scale:(double)a7 badgeType:(unint64_t)a8 completionHandler:(id)a9;
- (void)_generateThumbnailWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionHandler:(id)a8;
- (void)_generateThumbnailWithURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionHandler:(id)a8;
- (void)generateThumbnailForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionBlock:(id)a8;
- (void)generateThumbnailRepresentationForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionBlock:(id)a8;
- (void)generateThumbnailRepresentationForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 completionBlock:(id)a7;
@end

@implementation QLItemThumbnailGenerator

- (void)generateThumbnailRepresentationForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 completionBlock:(id)a7
{
}

- (void)generateThumbnailForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionBlock:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104__QLItemThumbnailGenerator_generateThumbnailForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke;
  v17[3] = &unk_1E6DD3EA8;
  id v18 = v15;
  id v16 = v15;
  -[QLItemThumbnailGenerator generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:badgeType:completionBlock:](self, "generateThumbnailRepresentationForItem:ofSize:minimumSize:scale:badgeType:completionBlock:", a3, a7, v17, width, height, a5, a6);
}

void __104__QLItemThumbnailGenerator_generateThumbnailForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 UIImage];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)generateThumbnailRepresentationForItem:(id)a3 ofSize:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionBlock:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = (void (**)(id, void))a8;
  if (v16)
  {
    v17 = [v15 fpItem];

    if (v17)
    {
      id v18 = [v15 fpItem];
      -[QLItemThumbnailGenerator _generateThumbnailWithFPItem:size:minimumDimension:scale:badgeType:completionHandler:](self, "_generateThumbnailWithFPItem:size:minimumDimension:scale:badgeType:completionHandler:", v18, a7, v16, width, height, a5, a6);
LABEL_18:

      goto LABEL_19;
    }
    id v18 = [v15 fetcher];
    if ([v18 fetchingState] == 1)
    {
      if (!v18) {
        goto LABEL_14;
      }
    }
    else
    {
      char v21 = [v18 isLongFetchOperation];
      if (!v18 || (v21 & 1) != 0)
      {
LABEL_14:
        v26 = [v18 urlForThumbnail];
        if (v26) {
          -[QLItemThumbnailGenerator _generateThumbnailWithURL:size:minimumDimension:scale:badgeType:completionHandler:](self, "_generateThumbnailWithURL:size:minimumDimension:scale:badgeType:completionHandler:", v26, a7, v16, width, height, 0.0, a6);
        }
        else {
          v16[2](v16, 0);
        }

        goto LABEL_18;
      }
    }
    v22 = [v15 previewItemContentType];
    v23 = [(QLItemThumbnailGenerator *)self fetcherClassesForPreviewItem:v15];
    v24 = objc_opt_new();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __118__QLItemThumbnailGenerator_generateThumbnailRepresentationForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke;
    v27[3] = &unk_1E6DD3ED0;
    id v28 = v22;
    v29 = v16;
    double v30 = width;
    double v31 = height;
    double v32 = a5;
    double v33 = a6;
    unint64_t v34 = a7;
    v27[4] = self;
    id v25 = v22;
    [v18 fetchContentWithAllowedOutputClasses:v23 inQueue:v24 updateBlock:0 completionBlock:v27];

    goto LABEL_18;
  }
  v19 = (NSObject **)MEMORY[0x1E4F945F0];
  v20 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    v20 = *v19;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2805000, v20, OS_LOG_TYPE_ERROR, "Called generateThumbnailWithSize with nil completion block. generateThumbnailWithSize should be called with a completion block. #Thumbnail", buf, 2u);
  }
LABEL_19:
}

void __118__QLItemThumbnailGenerator_generateThumbnailRepresentationForItem_ofSize_minimumSize_scale_badgeType_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E4F945F0];
    v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_ERROR, "Could not generate thumbnail because an error occurred while fetching the contents of the item: %@. #Thumbnail", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_11;
  }
  if (!v5) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailWithData:contentType:size:minimumDimension:scale:badgeType:completionHandler:", v5, *(void *)(a1 + 40), *(void *)(a1 + 88), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      goto LABEL_12;
    }
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailWithURL:size:minimumDimension:scale:badgeType:completionHandler:", v5, *(void *)(a1 + 88), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
LABEL_12:
}

- (void)_generateThumbnailWithURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionHandler:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = (objc_class *)MEMORY[0x1E4F3A6C0];
  id v16 = a8;
  id v17 = a3;
  id v18 = (id)objc_msgSend([v15 alloc], "initWithFileAtURL:size:scale:representationTypes:", v17, -1, width, height, a6);

  [v18 setMinimumDimension:a5];
  [v18 setBadgeType:a7];
  [(QLItemThumbnailGenerator *)self _generateThumbnailForRequest:v18 completionHandler:v16];
}

- (void)_generateThumbnailWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 badgeType:(unint64_t)a7 completionHandler:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = (objc_class *)MEMORY[0x1E4F3A6C0];
  id v16 = a8;
  id v17 = a3;
  id v18 = (id)objc_msgSend([v15 alloc], "initWithFPItem:size:scale:representationTypes:", v17, -1, width, height, a6);

  [v18 setMinimumDimension:a5];
  [v18 setBadgeType:a7];
  [(QLItemThumbnailGenerator *)self _generateThumbnailForRequest:v18 completionHandler:v16];
}

- (void)_generateThumbnailWithData:(id)a3 contentType:(id)a4 size:(CGSize)a5 minimumDimension:(double)a6 scale:(double)a7 badgeType:(unint64_t)a8 completionHandler:(id)a9
{
  double height = a5.height;
  double width = a5.width;
  id v17 = (objc_class *)MEMORY[0x1E4F3A6C0];
  id v18 = a9;
  id v19 = a4;
  id v20 = a3;
  id v21 = (id)objc_msgSend([v17 alloc], "initWithData:contentType:size:scale:representationTypes:", v20, v19, -1, width, height, a7);

  [v21 setMinimumDimension:a6];
  [v21 setBadgeType:a8];
  [(QLItemThumbnailGenerator *)self _generateThumbnailForRequest:v21 completionHandler:v18];
}

- (void)_generateThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    -[QLItemThumbnailGenerator _generateThumbnailForRequest:completionHandler:]();
  }
  v7 = v6;
  v8 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__QLItemThumbnailGenerator__generateThumbnailForRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E6DD3EF8;
  id v11 = v7;
  id v9 = v7;
  [v8 generateBestRepresentationForRequest:v5 completionHandler:v10];
}

void __75__QLItemThumbnailGenerator__generateThumbnailForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (NSObject **)MEMORY[0x1E4F945F0];
    v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_ERROR, "Could not generate thumbnail because an error occurred while generating best representation for contents of the item: %@. #Thumbnail", (uint8_t *)&v9, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetcherClassesForPreviewItem:(id)a3
{
  id v3 = a3;
  if (fetcherClassesForPreviewItem__onceToken != -1) {
    dispatch_once(&fetcherClassesForPreviewItem__onceToken, &__block_literal_global_0);
  }
  if ([v3 previewItemType] == 1)
  {
    v4 = [v3 UTIAnalyzer];
    int v5 = [v4 isAudioOnly];
    id v6 = &fetcherClassesForPreviewItem__fetcherAllowedClasses;
    if (!v5) {
      id v6 = &fetcherClassesForPreviewItem__movieAllowedClasses;
    }
    id v7 = (id)*v6;
  }
  else
  {
    id v7 = (id)fetcherClassesForPreviewItem__fetcherAllowedClasses;
  }

  return v7;
}

uint64_t __57__QLItemThumbnailGenerator_fetcherClassesForPreviewItem___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v4 = (void *)fetcherClassesForPreviewItem__fetcherAllowedClasses;
  fetcherClassesForPreviewItem__fetcherAllowedClasses = v3;

  fetcherClassesForPreviewItem__movieAllowedClasses = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

- (void)_generateThumbnailForRequest:completionHandler:.cold.1()
{
  __assert_rtn("-[QLItemThumbnailGenerator _generateThumbnailForRequest:completionHandler:]", "QLItemThumbnailGenerator.m", 125, "completionHandler != nil");
}

@end