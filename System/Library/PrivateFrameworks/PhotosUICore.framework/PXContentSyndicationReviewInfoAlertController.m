@interface PXContentSyndicationReviewInfoAlertController
@end

@implementation PXContentSyndicationReviewInfoAlertController

void ___PXContentSyndicationReviewInfoAlertController_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a4;
  id v8 = [v6 alloc];
  v9 = NSString;
  v10 = PHAssetSyndicationEligibilityDescription();
  v11 = [v9 stringWithFormat:@"%lu: \t%@\n", a3, v10];
  uint64_t v14 = *MEMORY[0x1E4FB0700];
  v15[0] = v7;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v13 = (void *)[v8 initWithString:v11 attributes:v12];

  [*(id *)(a1 + 32) appendAttributedString:v13];
}

@end