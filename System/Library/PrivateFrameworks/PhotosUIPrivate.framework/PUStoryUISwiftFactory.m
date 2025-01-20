@interface PUStoryUISwiftFactory
+ (id)thumbnailActionPerformerWithModel:(id)a3;
+ (id)viewControllerWithConfiguration:(id)a3 contentViewController:(id *)a4;
@end

@implementation PUStoryUISwiftFactory

+ (id)thumbnailActionPerformerWithModel:(id)a3
{
  id v3 = a3;
  v4 = [[PUStoryThumbnailActionPerformer alloc] initWithModel:v3];

  return v4;
}

+ (id)viewControllerWithConfiguration:(id)a3 contentViewController:(id *)a4
{
  id v5 = a3;
  v6 = [[PUStoryViewController alloc] initWithConfiguration:v5];

  v7 = [[PUNavigationController alloc] initWithRootViewController:v6];
  v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9
    || ([MEMORY[0x1E4F90788] sharedInstance],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 allowsFormSheetPresentation],
        v10,
        !v11))
  {
    [(PUNavigationController *)v7 setModalPresentationStyle:0];
  }
  else
  {
    [(PUNavigationController *)v7 setModalPresentationStyle:2];
    v12 = [(PUNavigationController *)v7 presentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [(PUNavigationController *)v7 presentationController];
      [v14 _setWantsFullScreen:1];
      [v14 _setShouldScaleDownBehindDescendantSheets:1];
    }
  }
  [(PUStoryViewController *)v6 px_enableBarAppearance];
  v15 = [(PUStoryViewController *)v6 px_barAppearance];
  [v15 performChangesWithAnimationOptions:0 changes:&__block_literal_global_11981];

  v16 = v7;
  if (a4) {
    *a4 = v6;
  }

  return v16;
}

void __79__PUStoryUISwiftFactory_viewControllerWithConfiguration_contentViewController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPrefersNavigationBarVisible:0];
  [v2 setPrefersStatusBarVisible:0];
}

@end