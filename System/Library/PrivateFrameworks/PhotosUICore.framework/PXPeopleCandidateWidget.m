@interface PXPeopleCandidateWidget
+ (id)_fetchPersonForAsset:(id)a3;
- (BOOL)hasContentForCurrentInput;
- (BOOL)hasLoadedContentData;
- (BOOL)loadPeopleFromFirstAsset;
- (BOOL)wantsNoSpaceAfterContentBottom;
- (PHPerson)singleAssetPerson;
- (PXPeopleCandidateWidget)init;
- (PXPeopleSuggestionDataSource)dataSource;
- (PXPhotosBannerView)bannerView;
- (PXPhotosDetailsContext)context;
- (PXPhotosGridPeopleBannerProvider)bannerProvider;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (_PXPeopleCandidateWidgetContainerView)contentView;
- (double)preferredContentHeightForWidth:(double)a3;
- (id)presentationEnvironmentForPhotosBannerProvider:(id)a3;
- (int64_t)contentLayoutStyle;
- (int64_t)loadState;
- (void)_didLoadBannerView:(id)a3 forGeneration:(int64_t)a4;
- (void)_loadBannerProviderWithPerson:(id)a3 generation:(int64_t)a4 isAssetLoad:(BOOL)a5;
- (void)_requestPersonForAsset:(id)a3 withCompletion:(id)a4;
- (void)controllerTraitCollectionDidChangeFrom:(id)a3 to:(id)a4;
- (void)loadContentData;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3;
- (void)setBannerProvider:(id)a3;
- (void)setBannerView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHasLoadedContentData:(BOOL)a3;
- (void)setLoadPeopleFromFirstAsset:(BOOL)a3;
- (void)setLoadState:(int64_t)a3;
- (void)setSingleAssetPerson:(id)a3;
- (void)setSpec:(id)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)unloadContentData;
@end

@implementation PXPeopleCandidateWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleAssetPerson, 0);
  objc_storeStrong((id *)&self->_bannerProvider, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_loadQueue, 0);
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (int64_t)loadState
{
  return self->_loadState;
}

- (void)setSingleAssetPerson:(id)a3
{
}

- (PHPerson)singleAssetPerson
{
  return self->_singleAssetPerson;
}

- (void)setBannerProvider:(id)a3
{
}

- (PXPhotosGridPeopleBannerProvider)bannerProvider
{
  return self->_bannerProvider;
}

- (void)setBannerView:(id)a3
{
}

- (PXPhotosBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setContentView:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (PXPeopleSuggestionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setLoadPeopleFromFirstAsset:(BOOL)a3
{
  self->_loadPeopleFromFirstAsset = a3;
}

- (BOOL)loadPeopleFromFirstAsset
{
  return self->_loadPeopleFromFirstAsset;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setContext:(id)a3
{
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v9 = a3;
  v4 = [(PXPeopleCandidateWidget *)self singleAssetPerson];
  if (v4)
  {
    v5 = [(PXPeopleCandidateWidget *)self singleAssetPerson];
    v6 = [v9 changeDetailsForObject:v5];

    v7 = [v6 objectAfterChanges];
    if (v7)
    {
      [(PXPeopleCandidateWidget *)self setSingleAssetPerson:v7];
      v8 = [(PXPeopleCandidateWidget *)self bannerProvider];
      [v8 setPerson:v7];
    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXPeopleCandidateObservationContext != a5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXPeopleCandidateWidget.m" lineNumber:302 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if ((v6 & 8) != 0)
  {
    id v17 = v9;
    BOOL v11 = [(PXPeopleCandidateWidget *)self loadPeopleFromFirstAsset];
    v10 = v17;
    if (!v11)
    {
      v12 = [(PXPeopleCandidateWidget *)self context];
      v13 = [v12 people];
      v14 = [v13 firstObject];

      v15 = [(PXPeopleCandidateWidget *)self bannerProvider];
      [v15 setPerson:v14];

      v10 = v17;
    }
  }
}

- (id)presentationEnvironmentForPhotosBannerProvider:(id)a3
{
  v4 = [(PXPeopleCandidateWidget *)self widgetDelegate];
  v5 = [v4 presentationEnvironmentForWidget:self];

  return v5;
}

- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXPeopleCandidateWidget *)self bannerView];
  if (v5)
  {
    char v6 = (void *)v5;
    id v7 = [(PXPeopleCandidateWidget *)self bannerProvider];

    if (v7 == v4)
    {
      v8 = [(PXPeopleCandidateWidget *)self bannerProvider];
      int v9 = [v8 isDismissed];

      if (v9)
      {
        v10 = [(PXPeopleCandidateWidget *)self contentView];
        [v10 setIsDisappearing:1];

        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke;
        v17[3] = &unk_1E5DD36F8;
        v17[4] = self;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_2;
        v16[3] = &unk_1E5DD2188;
        v16[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v17 animations:v16 completion:0.25];
        BOOL v11 = [(PXPeopleCandidateWidget *)self widgetDelegate];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_3;
        v13[3] = &unk_1E5DD32A8;
        id v14 = v11;
        v15 = self;
        id v12 = v11;
        [v12 widget:self animateChanges:v13 withAnimationOptions:0];
      }
    }
  }
}

void __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bannerView];
  [v1 setAlpha:0.0];
}

uint64_t __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentView];
  [v2 setContainedView:0];

  v3 = *(void **)(a1 + 32);
  return [v3 setBannerView:0];
}

uint64_t __70__PXPeopleCandidateWidget_photosBannerProviderInvalidateLoadedBanner___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) widgetPreferredContentHeightForWidthDidChange:*(void *)(a1 + 40)];
}

- (void)_didLoadBannerView:(id)a3 forGeneration:(int64_t)a4
{
  id v7 = a3;
  if (self->_contentLoadGeneration == a4)
  {
    objc_storeStrong((id *)&self->_bannerView, a3);
    v8 = [(PXPeopleCandidateWidget *)self contentView];
    [v8 setContainedView:v7];

    int v9 = [(PXPeopleCandidateWidget *)self spec];
    [v7 setSpec:v9];

    if ([(PXPeopleCandidateWidget *)self loadPeopleFromFirstAsset])
    {
      v10 = [MEMORY[0x1E4FB1618] clearColor];
      [v7 setBackgroundColor:v10];
    }
    BOOL v11 = [(PXPeopleCandidateWidget *)self bannerView];
    [v11 setAlpha:0.0];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke;
    v17[3] = &unk_1E5DD36F8;
    v17[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v17 animations:0.3];
    id v12 = [(PXPeopleCandidateWidget *)self widgetDelegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke_2;
    v14[3] = &unk_1E5DD32A8;
    id v15 = v12;
    v16 = self;
    id v13 = v12;
    [v13 widget:self animateChanges:v14 withAnimationOptions:0];
    [(PXPeopleCandidateWidget *)self setLoadState:2];
  }
}

void __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) bannerView];
  [v1 setAlpha:1.0];
}

uint64_t __60__PXPeopleCandidateWidget__didLoadBannerView_forGeneration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) widgetPreferredContentHeightForWidthDidChange:*(void *)(a1 + 40)];
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
  id v5 = a3;
  id v6 = [(PXPeopleCandidateWidget *)self bannerView];
  [v6 setSpec:v5];
}

- (_PXPeopleCandidateWidgetContainerView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = [_PXPeopleCandidateWidgetContainerView alloc];
    id v5 = -[_PXPeopleCandidateWidgetContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_contentView;
    self->_contentView = v5;

    contentView = self->_contentView;
  }
  return contentView;
}

- (BOOL)wantsNoSpaceAfterContentBottom
{
  return 1;
}

- (int64_t)contentLayoutStyle
{
  return 2;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  id v5 = [(PXPeopleCandidateWidget *)self bannerProvider];
  char v6 = [v5 isDismissed];

  double v7 = 0.0;
  if ((v6 & 1) == 0)
  {
    v8 = [(PXPeopleCandidateWidget *)self bannerView];
    objc_msgSend(v8, "sizeThatFits:", a3, 0.0);
    double v7 = v9;
  }
  return v7;
}

- (void)setHasLoadedContentData:(BOOL)a3
{
  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    id v4 = [(PXPeopleCandidateWidget *)self widgetDelegate];
    [v4 widgetHasLoadedContentDataDidChange:self];
  }
}

- (void)setLoadState:(int64_t)a3
{
  if (self->_loadState != a3)
  {
    self->_loadState = a3;
    if ((unint64_t)a3 <= 2) {
      [(PXPeopleCandidateWidget *)self setHasLoadedContentData:(a3 & 7) == 2];
    }
  }
}

- (void)unloadContentData
{
  self->_contentLoadGeneration = (self->_contentLoadGeneration + 1) % 1000;
  v3 = [(PXPeopleCandidateWidget *)self context];
  [v3 unregisterChangeObserver:self context:PXPeopleCandidateObservationContext];

  id v4 = [(PXPeopleCandidateWidget *)self singleAssetPerson];
  id v5 = [v4 photoLibrary];
  objc_msgSend(v5, "px_unregisterChangeObserver:", self);

  [(PXPeopleCandidateWidget *)self setSingleAssetPerson:0];
  char v6 = [(PXPeopleCandidateWidget *)self bannerProvider];
  [v6 setPresentationDelegate:0];

  double v7 = [(PXPeopleCandidateWidget *)self bannerProvider];
  [v7 setInvalidationDelegate:0];

  [(PXPeopleCandidateWidget *)self setBannerProvider:0];
  [(PXPeopleCandidateWidget *)self setLoadState:0];
}

- (BOOL)hasContentForCurrentInput
{
  v3 = [(PXPeopleCandidateWidget *)self context];
  id v4 = [v3 people];
  if ([v4 count]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(PXPeopleCandidateWidget *)self loadPeopleFromFirstAsset];
  }

  return v5;
}

- (void)controllerTraitCollectionDidChangeFrom:(id)a3 to:(id)a4
{
  id v5 = [(PXPeopleCandidateWidget *)self widgetDelegate];
  [v5 widgetPreferredContentHeightForWidthDidChange:self];
}

- (void)_requestPersonForAsset:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    loadQueue = self->_loadQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke;
    v10[3] = &unk_1E5DD3280;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(loadQueue, v10);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke(uint64_t a1)
{
  v2 = +[PXPeopleCandidateWidget _fetchPersonForAsset:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke_2;
  v5[3] = &unk_1E5DD3280;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __65__PXPeopleCandidateWidget__requestPersonForAsset_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_loadBannerProviderWithPerson:(id)a3 generation:(int64_t)a4 isAssetLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleCandidateWidget.m", 108, @"%s must be called on the main thread", "-[PXPeopleCandidateWidget _loadBannerProviderWithPerson:generation:isAssetLoad:]");
  }
  if (self->_contentLoadGeneration == a4)
  {
    if (v9)
    {
      if (v5)
      {
        [(PXPeopleCandidateWidget *)self setSingleAssetPerson:v9];
        v10 = [v9 photoLibrary];
        objc_msgSend(v10, "px_registerChangeObserver:", self);
      }
      id v11 = [[PXPhotosGridPeopleBannerProvider alloc] initWithPerson:v9 namingSuggestionsOnly:v5];
      [(PXPeopleCandidateWidget *)self setBannerProvider:v11];

      id v12 = [(PXPeopleCandidateWidget *)self bannerProvider];
      [v12 setPresentationDelegate:self];

      id v13 = [(PXPeopleCandidateWidget *)self bannerProvider];
      [v13 setInvalidationDelegate:self];

      objc_initWeak(&location, self);
      id v14 = [(PXPeopleCandidateWidget *)self bannerProvider];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __80__PXPeopleCandidateWidget__loadBannerProviderWithPerson_generation_isAssetLoad___block_invoke;
      v16[3] = &unk_1E5DCD640;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a4;
      [v14 loadBannerView:v16];

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PXPeopleCandidateWidget *)self _didLoadBannerView:0 forGeneration:a4];
    }
  }
}

void __80__PXPeopleCandidateWidget__loadBannerProviderWithPerson_generation_isAssetLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _didLoadBannerView:v4 forGeneration:*(void *)(a1 + 40)];
}

- (void)loadContentData
{
  if ([(PXPeopleCandidateWidget *)self loadState])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_1A9AE7000, log, OS_LOG_TYPE_ERROR, "loadContentData called multiple times for banner widget", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    [(PXPeopleCandidateWidget *)self setLoadState:1];
    id v4 = [(PXPeopleCandidateWidget *)self context];
    [v4 registerChangeObserver:self context:PXPeopleCandidateObservationContext];
    contentLoadGeneration = (void *)self->_contentLoadGeneration;
    if ([(PXPeopleCandidateWidget *)self loadPeopleFromFirstAsset])
    {
      id v6 = [v4 firstAsset];
      objc_initWeak(buf, self);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __42__PXPeopleCandidateWidget_loadContentData__block_invoke;
      v9[3] = &unk_1E5DCD618;
      objc_copyWeak(v10, buf);
      v10[1] = contentLoadGeneration;
      [(PXPeopleCandidateWidget *)self _requestPersonForAsset:v6 withCompletion:v9];
      objc_destroyWeak(v10);
      objc_destroyWeak(buf);
    }
    else
    {
      id v7 = [v4 people];
      v8 = [v7 firstObject];

      [(PXPeopleCandidateWidget *)self _loadBannerProviderWithPerson:v8 generation:contentLoadGeneration isAssetLoad:0];
    }
  }
}

void __42__PXPeopleCandidateWidget_loadContentData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _loadBannerProviderWithPerson:v4 generation:*(void *)(a1 + 40) isAssetLoad:1];
}

- (PXPeopleCandidateWidget)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleCandidateWidget;
  v2 = [(PXPeopleCandidateWidget *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("PXPeopleCandidateWidget-loadQueue", v4);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = (OS_dispatch_queue *)v5;

    os_log_t v7 = os_log_create((const char *)*MEMORY[0x1E4F8A240], "PeopleBanners");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;
  }
  return v2;
}

+ (id)_fetchPersonForAsset:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F390A0];
  id v4 = a3;
  dispatch_queue_t v5 = [v3 fetchOptionsWithPhotoLibrary:0 orObject:v4];
  [v5 setPersonContext:4];
  v10[0] = *MEMORY[0x1E4F397E0];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 setFetchPropertySets:v6];

  [v5 setIncludedDetectionTypes:&unk_1F02D5578];
  [v5 setIncludeTorsoAndFaceDetectionData:1];
  [v5 setFetchLimit:2];
  os_log_t v7 = [MEMORY[0x1E4F391F0] fetchPersonsInAsset:v4 options:v5];

  v8 = 0;
  if ([v7 count] == 1)
  {
    v8 = [v7 firstObject];
  }

  return v8;
}

@end