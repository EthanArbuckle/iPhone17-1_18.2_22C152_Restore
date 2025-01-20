@interface PUSlideShowActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUSlideShowActivity

- (void)performActivity
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  v4 = [(PXActivity *)self itemSourceController];
  if ([v4 isPreparingIndividualItems])
  {
    v5 = [(PXActivity *)self itemSourceController];
    char v6 = [v5 itemSourcesSupportSlideshow];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_systemImageName
{
  return @"play.rectangle";
}

- (id)activityTitle
{
  return PULocalizedString(@"PUPHOTOBROWSER_BUTTON_SLIDESHOW");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90AF8];
}

@end