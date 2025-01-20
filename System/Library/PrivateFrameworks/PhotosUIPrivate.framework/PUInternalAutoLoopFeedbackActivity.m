@interface PUInternalAutoLoopFeedbackActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (id)asset;
- (void)feedbackAssetUIViewController:(id)a3 didFinish:(BOOL)a4;
@end

@implementation PUInternalAutoLoopFeedbackActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (void)feedbackAssetUIViewController:(id)a3 didFinish:(BOOL)a4
{
}

- (id)activityViewController
{
  id v3 = objc_alloc(MEMORY[0x1E4F901F0]);
  v4 = [(PUInternalAutoLoopFeedbackActivity *)self asset];
  v5 = (void *)[v3 initWithAsset:v4 delegate:self];

  [v5 setModalPresentationStyle:0];
  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = [(PXActivity *)self itemSourceController];
  int v5 = [v4 isPreparingIndividualItems];

  v6 = [(PUInternalAutoLoopFeedbackActivity *)self asset];
  char v7 = 0;
  if (MEMORY[0x1B3E7A510]() && v5)
  {
    if ([v6 canPlayLoopingVideo]) {
      char v7 = 1;
    }
    else {
      char v7 = [v6 canPlayLongExposure];
    }
  }

  return v7;
}

- (id)asset
{
  v2 = [(PXActivity *)self itemSourceController];
  id v3 = [v2 assets];
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)activityImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  id v3 = PLPhotoLibraryFrameworkBundle();
  v4 = [v2 imageNamed:@"RepeatBadge" inBundle:v3 compatibleWithTraitCollection:0];

  return v4;
}

- (id)activityTitle
{
  return @"Variation Feedback";
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A20];
}

@end