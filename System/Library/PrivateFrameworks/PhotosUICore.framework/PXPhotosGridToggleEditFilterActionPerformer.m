@interface PXPhotosGridToggleEditFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleEditFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v6 = a4;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PXPhotosGridToggleEditFilterActionPerformer;
  if (objc_msgSendSuper2(&v9, sel_canPerformActionType_withViewModel_, a3, v6)) {
    BOOL v7 = !+[PXPhotosGridToggleFilterActionPerformer isContentFilterHidden:9 viewModel:v6];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)performUserInteractionTask
{
  id v3 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setEdited:", objc_msgSend(v3, "edited") ^ 1);
  [(PXPhotosGridToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(PXPhotosGridActionPerformer *)self viewModel];
    v4 = [v3 contentFilterState];
    if ([v4 edited]) {
      v5 = @"DISABLE_EDITS_FILTER_SHORTCUT";
    }
    else {
      v5 = @"ENABLE_EDITS_FILTER_SHORTCUT";
    }
    id v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
  }
  else
  {
    id v6 = PXContentFilterTitleForItemTag(9);
  }
  return v6;
}

- (int64_t)menuElementState
{
  v2 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:9];

  return v3;
}

- (id)activitySystemImageName
{
  return @"slider.horizontal.3";
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleEditedFilter";
  return @"PXActivityTypeToggleEditedFilter";
}

@end