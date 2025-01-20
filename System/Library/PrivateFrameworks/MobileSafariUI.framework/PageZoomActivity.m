@interface PageZoomActivity
- (id)activityTitle;
- (id)activityType;
- (id)systemImageNameWithTabDocument:(id)a3;
- (int64_t)actionTypeWithTabDocument:(id)a3;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation PageZoomActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)activityType
{
  return @"SafariActivityTypePageZoom";
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return @"textformat.size";
}

- (int64_t)actionTypeWithTabDocument:(id)a3
{
  if ([a3 isShowingReader]) {
    return 4;
  }
  else {
    return 3;
  }
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v14 = a3;
  [(_SFActivity *)self activityDidFinish:1];
  v4 = [v14 browserController];
  v5 = [v4 rootViewController];
  if ([v14 isShowingReader])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F3AEB0]);
    v7 = [v14 readerContext];
    uint64_t v8 = [v6 initWithReaderContext:v7];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F3AE90]);
    v7 = [v4 pageZoomManager];
    uint64_t v8 = [v9 initWithDocument:v14 preferenceManager:v7];
  }
  v10 = (void *)v8;

  v11 = [[CapsuleHidingStepperViewController alloc] initWithStepperController:v10];
  v12 = [v5 capsuleViewController];
  [(CapsuleHidingStepperViewController *)v11 setCapsuleViewController:v12];

  v13 = [v4 viewControllerToPresentFrom];
  [v13 presentViewController:v11 animated:1 completion:0];
}

@end