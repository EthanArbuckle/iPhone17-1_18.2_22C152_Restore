@interface PXGenerativeStoryFeatureEligibilityRowCell
@end

@implementation PXGenerativeStoryFeatureEligibilityRowCell

void __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 processingStatus];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke_2;
  v9[3] = &unk_1E5DB1B30;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v8 = v5;
  id v10 = v8;
  +[PXGenerativeStoryFeatureEligibilityDataSource renderImageWithFeatureAvailability:v7 completionHandler:v9];

  objc_destroyWeak(&v11);
}

void __69___PXGenerativeStoryFeatureEligibilityRowCell_updateDisplayedContent__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [*(id *)(a1 + 32) featureEligibilityTitle];
  [WeakRetained _handleResultsWithTitle:v5 image:v4];
}

@end