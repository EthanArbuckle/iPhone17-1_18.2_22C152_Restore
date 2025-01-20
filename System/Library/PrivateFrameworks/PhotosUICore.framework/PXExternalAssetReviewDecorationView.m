@interface PXExternalAssetReviewDecorationView
- (void)_updateAssetInformation;
@end

@implementation PXExternalAssetReviewDecorationView

- (void)_updateAssetInformation
{
  v3 = [(PXContentSyndicationReviewDecorationView *)self userData];
  uint64_t v4 = PXExternalAssetReviewDecorationEligibilityForAssetReference(v3);

  [(PXContentSyndicationReviewDecorationView *)self _setEligibility:v4];
}

@end