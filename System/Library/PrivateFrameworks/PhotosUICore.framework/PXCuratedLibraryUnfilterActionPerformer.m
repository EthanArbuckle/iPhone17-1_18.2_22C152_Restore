@interface PXCuratedLibraryUnfilterActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryUnfilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryUnfilterActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXContentFilterTitleForItemTag(1);
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:1];

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)activitySystemImageName
{
  return @"square.grid.3x3";
}

- (void)performUserInteractionTask
{
  int64_t v3 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v4 = [v3 photoLibrary];
  id v6 = +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:v4];

  v5 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  objc_msgSend(v6, "setIncludeScreenshots:", objc_msgSend(v5, "includeScreenshots"));

  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v6];
}

- (id)activityType
{
  v2 = @"PXActivityTypeUnfilter";
  return @"PXActivityTypeUnfilter";
}

- (PXCuratedLibraryUnfilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryUnfilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionUnfilter" viewModel:a3];
}

@end