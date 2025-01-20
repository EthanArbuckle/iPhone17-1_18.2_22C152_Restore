@interface PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
    int v4 = [v3 isContentFilterActive:2];

    if (v4) {
      v5 = @"DISABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT";
    }
    else {
      v5 = @"ENABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT";
    }
    v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
  }
  else
  {
    v6 = PXContentFilterTitleForItemTag(2);
  }
  return v6;
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:2];

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)activitySystemImageName
{
  return @"camera.viewfinder";
}

- (void)performUserInteractionTask
{
  id v5 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  objc_msgSend(v5, "setIncludeScreenshots:", objc_msgSend(v5, "isContentFilterActive:", 2) ^ 1);
  int64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "includeScreenshots"));
  int v4 = +[PXUserDefaults standardUserDefaults];
  [v4 setIncludeScreenshots:v3];

  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v5];
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleIncludeScreenshotsFilter";
  return @"PXActivityTypeToggleIncludeScreenshotsFilter";
}

- (PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleIncludeScreenshotFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionToggleIncludeScreenshotFilter" viewModel:a3];
}

@end