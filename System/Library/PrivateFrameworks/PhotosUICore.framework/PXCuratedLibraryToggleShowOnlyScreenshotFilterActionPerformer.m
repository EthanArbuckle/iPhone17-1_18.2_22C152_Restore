@interface PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v4 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  if (![v4 isContentFilterActive:8]
    || ([v4 isContentFilterActive:7] & 1) != 0)
  {
    if (a3 != 1)
    {
      uint64_t v8 = PXContentFilterTitleForItemTag(13);
      goto LABEL_13;
    }
    int v5 = [v4 showOnlyScreenshots];
    v6 = @"ENABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT";
    v7 = @"DISABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT";
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    int v5 = [v4 showOnlyScreenshots];
    v6 = @"ENABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT";
    v7 = @"DISABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT";
LABEL_8:
    if (v5) {
      v9 = v7;
    }
    else {
      v9 = v6;
    }
    goto LABEL_12;
  }
  v9 = @"PXContentFilterMenu_ScreenRecordings";
LABEL_12:
  uint64_t v8 = PXLocalizedStringFromTable(v9, @"PhotosUICore");
LABEL_13:
  v10 = (void *)v8;

  return v10;
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:13];

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
  id v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setShowOnlyScreenshots:", objc_msgSend(v3, "showOnlyScreenshots") ^ 1);
  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleShowOnlyScreenshotsFilter";
  return @"PXActivityTypeToggleShowOnlyScreenshotsFilter";
}

- (PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleShowOnlyScreenshotFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionToggleShowOnlyScreenshotFilter" viewModel:a3];
}

@end