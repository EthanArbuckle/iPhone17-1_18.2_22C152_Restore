@interface PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer

- (void)performUserInteractionTask
{
  id v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setShowOnlySharedWithYou:", objc_msgSend(v3, "showOnlySharedWithYou") ^ 1);
  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
    if ([v3 showOnlyScreenshots]) {
      v4 = @"DISABLE_SHOW_ONLY_SWY_FILTER_SHORTCUT";
    }
    else {
      v4 = @"ENABLE_SHOW_ONLY_SWY_FILTER_SHORTCUT";
    }
    v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
  }
  else
  {
    v5 = PXContentFilterTitleForItemTag(14);
  }
  return v5;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:14];

  return v3;
}

- (id)activitySystemImageName
{
  return @"shared.with.you";
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleShowOnlySharedWithYouFilter";
  return @"PXActivityTypeToggleShowOnlySharedWithYouFilter";
}

- (PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleShowOnlySharedWithYouFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionToggleShowOnlySharedWithYouFilter" viewModel:a3];
}

@end