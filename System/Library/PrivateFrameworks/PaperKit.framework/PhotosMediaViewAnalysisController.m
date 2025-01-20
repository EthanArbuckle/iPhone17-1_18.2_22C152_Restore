@interface PhotosMediaViewAnalysisController
@end

@implementation PhotosMediaViewAnalysisController

void __56___PhotosMediaViewAnalysisController_initWithAssetView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleImageResult:a2 orientation:a3 info:v7];
}

uint64_t __64___PhotosMediaViewAnalysisController_setActiveInteractionTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contextActiveInteractionTypesDidChange:*(void *)(a1 + 32)];
}

uint64_t __116___PhotosMediaViewAnalysisController_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contextWillPresentVisualSearchController:*(void *)(a1 + 32)];
}

uint64_t __95___PhotosMediaViewAnalysisController_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contextDidDismissVisualSearchController:*(void *)(a1 + 32)];
}

uint64_t __97___PhotosMediaViewAnalysisController_imageAnalysisInteraction_prepareForCalloutAction_competion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contextWillPresentVisualSearchController:*(void *)(a1 + 32)];
}

void __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_3;
  block[3] = &unk_2640D3E30;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __74___PhotosMediaViewAnalysisController__handleImageResult_orientation_info___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleAnalysisResult:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

void __50___PhotosMediaViewAnalysisController_setAnalysis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 contextAnalysisDidChange:v3];
  [v4 contextAvailableResultsDidChange:*(void *)(a1 + 32)];
}

@end