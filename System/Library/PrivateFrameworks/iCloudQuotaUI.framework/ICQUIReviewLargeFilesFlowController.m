@interface ICQUIReviewLargeFilesFlowController
- (CGSize)preferredContentSize;
- (NSNumber)storageRecovered;
- (RecommendationFlowControllerDelegate)cloudRecommendationsDelegate;
- (int64_t)modalPresentationStyle;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCloudRecommendationsDelegate:(id)a3;
- (void)setStorageRecovered:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICQUIReviewLargeFilesFlowController

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (CGSize)preferredContentSize
{
  [MEMORY[0x263F82E10] ICQUIUpsellPrefferredPresentationSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (RecommendationFlowControllerDelegate)cloudRecommendationsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudRecommendationsDelegate);
  return (RecommendationFlowControllerDelegate *)WeakRetained;
}

- (void)setCloudRecommendationsDelegate:(id)a3
{
}

- (NSNumber)storageRecovered
{
  return self->_storageRecovered;
}

- (void)setStorageRecovered:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageRecovered, 0);
  objc_destroyWeak((id *)&self->_cloudRecommendationsDelegate);
}

- (void)viewDidLoad
{
  double v2 = self;
  ICQUIReviewLargeFilesFlowController.viewDidLoad()();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  _sSo35ICQUIReviewLargeFilesFlowControllerC13iCloudQuotaUIE012presentationE10DidDismissyySo014UIPresentationE0CF_0();
}

@end