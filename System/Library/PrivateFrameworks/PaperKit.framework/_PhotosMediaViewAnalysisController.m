@interface _PhotosMediaViewAnalysisController
- (BOOL)actionInfoViewHidden;
- (BOOL)analysisInteractionHidden;
- (BOOL)hasResultsForAnalysisTypes:(unint64_t)a3;
- (BOOL)highlightSelectableItemsEnabled;
- (NSError)error;
- (NSString)filledInfoButtonGlyphName;
- (NSString)infoButtonGlyphName;
- (PPKPhotosMediaViewImageAnalysisInteractionContextDelegate)delegate;
- (VKCImageAnalysis)analysis;
- (_PhotosMediaViewAnalysisController)initWithAssetView:(id)a3;
- (id)contentImageForImageAnalysisInteraction:(id)a3;
- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3;
- (unint64_t)activeInteractionTypes;
- (unint64_t)automaticallyInvokedInteraction;
- (void)_enumerateObservers:(id)a3;
- (void)_handleAnalysisResult:(id)a3 error:(id)a4;
- (void)_handleImageResult:(CGImage *)a3 orientation:(int64_t)a4 info:(id)a5;
- (void)_performAutomaticallyInvokedInteractionIfNeeded;
- (void)addAnalysisObserver:(id)a3;
- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5;
- (void)imageAnalysisInteractionDidDismissVisualSearchController:(id)a3;
- (void)removeAnalysisObserver:(id)a3;
- (void)setActionInfoViewHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setActiveInteractionTypes:(unint64_t)a3;
- (void)setAnalysis:(id)a3;
- (void)setAnalysisInteractionHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setAutomaticallyInvokedInteraction:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlightSelectableItemsEnabled:(BOOL)a3;
- (void)toggleInteractionTypes:(unint64_t)a3;
@end

@implementation _PhotosMediaViewAnalysisController

- (_PhotosMediaViewAnalysisController)initWithAssetView:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_PhotosMediaViewAnalysisController;
  v5 = [(_PhotosMediaViewAnalysisController *)&v24 init];
  if (v5)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v6 = (void *)getVKCImageAnalyzerClass_softClass;
    uint64_t v33 = getVKCImageAnalyzerClass_softClass;
    if (!getVKCImageAnalyzerClass_softClass)
    {
      id location = (id)MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      v27 = __getVKCImageAnalyzerClass_block_invoke;
      v28 = &unk_2640D3AD8;
      v29 = &v30;
      __getVKCImageAnalyzerClass_block_invoke((uint64_t)&location);
      v6 = (void *)v31[3];
    }
    v7 = v6;
    _Block_object_dispose(&v30, 8);
    v8 = (VKCImageAnalyzer *)objc_alloc_init(v7);
    analyzer = v5->_analyzer;
    v5->_analyzer = v8;

    objc_storeWeak((id *)&v5->_assetView, v4);
    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v10;

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v12 = (void *)getVKCImageAnalysisInteractionClass_softClass;
    uint64_t v33 = getVKCImageAnalysisInteractionClass_softClass;
    if (!getVKCImageAnalysisInteractionClass_softClass)
    {
      id location = (id)MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      v27 = __getVKCImageAnalysisInteractionClass_block_invoke;
      v28 = &unk_2640D3AD8;
      v29 = &v30;
      __getVKCImageAnalysisInteractionClass_block_invoke((uint64_t)&location);
      v12 = (void *)v31[3];
    }
    v13 = v12;
    _Block_object_dispose(&v30, 8);
    v14 = (VKCImageAnalysisInteraction *)objc_alloc_init(v13);
    interaction = v5->_interaction;
    v5->_interaction = v14;

    [(VKCImageAnalysisInteraction *)v5->_interaction setDelegate:v5];
    [(VKCImageAnalysisInteraction *)v5->_interaction setWantsAutomaticContentsRectCalculation:0];
    [(VKCImageAnalysisInteraction *)v5->_interaction setActionInfoViewHidden:0];
    [(VKCImageAnalysisInteraction *)v5->_interaction setAutomaticallyShowVisualSearchResults:1];
    [(VKCImageAnalysisInteraction *)v5->_interaction setActiveInteractionTypes:9];
    objc_initWeak(&location, v5);
    v16 = [v4 mediaProvider];
    v17 = [v4 asset];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __56___PhotosMediaViewAnalysisController_initWithAssetView___block_invoke;
    v22 = &unk_2640D3DC0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v16, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v17, 0, 0, &v19, *MEMORY[0x263F150B8], *(double *)(MEMORY[0x263F150B8] + 8));

    objc_msgSend(v4, "addInteraction:", v5->_interaction, v19, v20, v21, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)hasResultsForAnalysisTypes:(unint64_t)a3
{
  id v4 = [(_PhotosMediaViewAnalysisController *)self analysis];
  LOBYTE(a3) = [v4 hasResultsForAnalysisTypes:a3];

  return a3;
}

- (BOOL)actionInfoViewHidden
{
  return [(VKCImageAnalysisInteraction *)self->_interaction actionInfoViewHidden];
}

- (void)setActionInfoViewHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setAnalysisInteractionHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (BOOL)highlightSelectableItemsEnabled
{
  return [(VKCImageAnalysisInteraction *)self->_interaction highlightSelectableItems];
}

- (void)setHighlightSelectableItemsEnabled:(BOOL)a3
{
}

- (NSString)infoButtonGlyphName
{
  v2 = [(VKCImageAnalysisInteraction *)self->_interaction visualSearchResultItems];
  v3 = [v2 firstObject];
  id v4 = [v3 infoButtonGlyphName];

  return (NSString *)v4;
}

- (NSString)filledInfoButtonGlyphName
{
  v2 = [(VKCImageAnalysisInteraction *)self->_interaction visualSearchResultItems];
  v3 = [v2 firstObject];
  id v4 = [v3 filledInfoButtonGlyphName];

  return (NSString *)v4;
}

- (BOOL)analysisInteractionHidden
{
  v2 = [(VKCImageAnalysisInteraction *)self->_interaction view];
  BOOL v3 = v2 == 0;

  return v3;
}

- (unint64_t)activeInteractionTypes
{
  return [(VKCImageAnalysisInteraction *)self->_interaction activeInteractionTypes];
}

- (void)setActiveInteractionTypes:(unint64_t)a3
{
  uint64_t v5 = [(VKCImageAnalysisInteraction *)self->_interaction activeInteractionTypes];
  [(VKCImageAnalysisInteraction *)self->_interaction setActiveInteractionTypes:a3];
  if (v5 != a3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64___PhotosMediaViewAnalysisController_setActiveInteractionTypes___block_invoke;
    v6[3] = &unk_2640D3DE8;
    v6[4] = self;
    [(_PhotosMediaViewAnalysisController *)self _enumerateObservers:v6];
  }
}

- (void)toggleInteractionTypes:(unint64_t)a3
{
  unint64_t v4 = [(_PhotosMediaViewAnalysisController *)self activeInteractionTypes] ^ a3;
  [(_PhotosMediaViewAnalysisController *)self setActiveInteractionTypes:v4];
}

- (void)setAutomaticallyInvokedInteraction:(unint64_t)a3
{
  if (self->_automaticallyInvokedInteraction != a3)
  {
    self->_automaticallyInvokedInteraction = a3;
    [(_PhotosMediaViewAnalysisController *)self _performAutomaticallyInvokedInteractionIfNeeded];
  }
}

- (void)addAnalysisObserver:(id)a3
{
}

- (void)removeAnalysisObserver:(id)a3
{
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  unint64_t v4 = [(_PhotosMediaViewAnalysisController *)self delegate];
  uint64_t v5 = [v4 presentingViewControllerForContext:self];

  return v5;
}

- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __116___PhotosMediaViewAnalysisController_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke;
  v4[3] = &unk_2640D3DE8;
  v4[4] = self;
  [(_PhotosMediaViewAnalysisController *)self _enumerateObservers:v4];
}

- (void)imageAnalysisInteractionDidDismissVisualSearchController:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __95___PhotosMediaViewAnalysisController_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke;
  v3[3] = &unk_2640D3DE8;
  v3[4] = self;
  [(_PhotosMediaViewAnalysisController *)self _enumerateObservers:v3];
}

- (id)contentImageForImageAnalysisInteraction:(id)a3
{
  return self->_image;
}

- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5
{
  v6 = (void (**)(void))a5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __97___PhotosMediaViewAnalysisController_imageAnalysisInteraction_prepareForCalloutAction_competion___block_invoke;
  v7[3] = &unk_2640D3DE8;
  v7[4] = self;
  [(_PhotosMediaViewAnalysisController *)self _enumerateObservers:v7];
  if (v6) {
    v6[2](v6);
  }
}

- (void)_enumerateObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_handleImageResult:(CGImage *)a3 orientation:(int64_t)a4 info:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  uint64_t v9 = (UIImage *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:a3 imageOrientation:a4];
  image = self->_image;
  self->_image = v9;

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  long long v11 = (void *)getVKCImageAnalyzerRequestClass_softClass;
  uint64_t v22 = getVKCImageAnalyzerRequestClass_softClass;
  if (!getVKCImageAnalyzerRequestClass_softClass)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getVKCImageAnalyzerRequestClass_block_invoke;
    v18[3] = &unk_2640D3AD8;
    v18[4] = &v19;
    __getVKCImageAnalyzerRequestClass_block_invoke((uint64_t)v18);
    long long v11 = (void *)v20[3];
  }
  long long v12 = v11;
  _Block_object_dispose(&v19, 8);
  long long v13 = (void *)[[v12 alloc] initWithImage:self->_image requestType:53];
  objc_msgSend(v13, "set_wantsFormFieldDetection:", 1);
  analyzer = self->_analyzer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_2;
  v15[3] = &unk_2640D3E58;
  objc_copyWeak(&v16, &location);
  [(VKCImageAnalyzer *)analyzer processRequest:v13 progressHandler:&__block_literal_global_2 completionHandler:v15];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (void)setAnalysis:(id)a3
{
  uint64_t v5 = (VKCImageAnalysis *)a3;
  if (self->_analysis != v5)
  {
    objc_storeStrong((id *)&self->_analysis, a3);
    [(VKCImageAnalysisInteraction *)self->_interaction setAnalysis:v5];
    [(VKCImageAnalysisInteraction *)self->_interaction set_photosImageForRemoveBackground:self->_image];
    [(VKCImageAnalysisInteraction *)self->_interaction beginImageSubjectAnalysisIfNecessary];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50___PhotosMediaViewAnalysisController_setAnalysis___block_invoke;
    v6[3] = &unk_2640D3DE8;
    v6[4] = self;
    [(_PhotosMediaViewAnalysisController *)self _enumerateObservers:v6];
    if (v5) {
      [(_PhotosMediaViewAnalysisController *)self _performAutomaticallyInvokedInteractionIfNeeded];
    }
  }
}

- (void)_handleAnalysisResult:(id)a3 error:(id)a4
{
  uint64_t v6 = (NSError *)a4;
  [(_PhotosMediaViewAnalysisController *)self setAnalysis:a3];
  error = self->_error;
  self->_error = v6;
}

- (void)_performAutomaticallyInvokedInteractionIfNeeded
{
  unint64_t v3 = [(_PhotosMediaViewAnalysisController *)self automaticallyInvokedInteraction];
  switch(v3)
  {
    case 1uLL:
      interaction = self->_interaction;
      [(VKCImageAnalysisInteraction *)interaction setHighlightSelectableItems:1];
      break;
    case 4uLL:
      [(_PhotosMediaViewAnalysisController *)self setActiveInteractionTypes:4];
      break;
    case 8uLL:
      unint64_t v4 = self->_interaction;
      [(VKCImageAnalysisInteraction *)v4 setSubjectHighlightActive:1];
      break;
  }
}

- (PPKPhotosMediaViewImageAnalysisInteractionContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (PPKPhotosMediaViewImageAnalysisInteractionContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)automaticallyInvokedInteraction
{
  return self->_automaticallyInvokedInteraction;
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
  objc_destroyWeak((id *)&self->_assetView);
}

@end