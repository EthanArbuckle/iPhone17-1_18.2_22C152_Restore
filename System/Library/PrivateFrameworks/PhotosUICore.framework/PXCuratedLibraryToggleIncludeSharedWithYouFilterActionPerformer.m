@interface PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
    if ([v3 shouldExcludeScreenshots]) {
      v4 = @"DISABLE_INCLUDE_SWY_FILTER_SHORTCUT";
    }
    else {
      v4 = @"ENABLE_INCLUDE_SWY_FILTER_SHORTCUT";
    }
    v5 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
  }
  else
  {
    v5 = PXContentFilterTitleForItemTag(3);
  }
  return v5;
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:3];

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)activitySystemImageName
{
  return @"shared.with.you";
}

- (void)performUserInteractionTask
{
  id v5 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  objc_msgSend(v5, "setIncludeSharedWithYou:", objc_msgSend(v5, "includeSharedWithYou") ^ 1);
  int64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "includeSharedWithYou"));
  v4 = +[PXUserDefaults standardUserDefaults];
  [v4 setIncludeSharedWithYou:v3];

  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v5];
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleIncludeSharedWithYouFilter";
  return @"PXActivityTypeToggleIncludeSharedWithYouFilter";
}

- (PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleIncludeSharedWithYouFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionToggleIncludeSharedWithYouFilter" viewModel:a3];
}

@end