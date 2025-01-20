@interface PUInternalImageQualityFeedbackActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (id)assets;
- (void)feedbackImageQualityUIViewController:(id)a3 didFinish:(BOOL)a4;
@end

@implementation PUInternalImageQualityFeedbackActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)feedbackImageQualityUIViewController:(id)a3 didFinish:(BOOL)a4
{
  [(UIActivity *)self activityDidFinish:a4];
  feedbackController = self->_feedbackController;
  self->_feedbackController = 0;
}

- (id)activityViewController
{
  feedbackController = self->_feedbackController;
  if (!feedbackController)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F901F8]);
    v5 = [(PUInternalImageQualityFeedbackActivity *)self assets];
    v6 = (PXFeedbackImageQualityUIViewController *)[v4 initWithAssets:v5 delegate:self];
    v7 = self->_feedbackController;
    self->_feedbackController = v6;

    [(PXFeedbackImageQualityUIViewController *)self->_feedbackController setModalPresentationStyle:0];
    feedbackController = self->_feedbackController;
  }
  return feedbackController;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F90618], "sharedInstance", a3);
  int v5 = [v4 canShowInternalUI];

  if (v5)
  {
    v6 = [(PXActivity *)self itemSourceController];
    if ([v6 isPreparingIndividualItems] && v6) {
      [v6 requestAssetsMediaTypeCount];
    }
  }
  return 0;
}

- (id)assets
{
  v2 = [(PXActivity *)self itemSourceController];
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = [v2 assets];
  int v5 = [v4 array];
  v6 = [v3 arrayWithArray:v5];

  return v6;
}

- (id)_systemImageName
{
  return @"photo";
}

- (id)activityTitle
{
  return @"(Internal) Image Quality Feedback";
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A38];
}

@end