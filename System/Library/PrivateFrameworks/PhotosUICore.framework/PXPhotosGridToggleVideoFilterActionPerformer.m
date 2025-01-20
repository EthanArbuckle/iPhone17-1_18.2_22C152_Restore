@interface PXPhotosGridToggleVideoFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleVideoFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v6 = a4;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PXPhotosGridToggleVideoFilterActionPerformer;
  if (objc_msgSendSuper2(&v9, sel_canPerformActionType_withViewModel_, a3, v6)) {
    BOOL v7 = !+[PXPhotosGridToggleFilterActionPerformer isContentFilterHidden:8 viewModel:v6];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)performUserInteractionTask
{
  id v3 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setVideo:", objc_msgSend(v3, "video") ^ 1);
  [(PXPhotosGridToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(PXPhotosGridActionPerformer *)self viewModel];
    v4 = [v3 contentFilterState];
    if ([v4 video]) {
      v5 = @"DISABLE_VIDEOS_FILTER_SHORTCUT";
    }
    else {
      v5 = @"ENABLE_VIDEOS_FILTER_SHORTCUT";
    }
    id v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
  }
  else
  {
    id v6 = PXContentFilterTitleForItemTag(8);
  }
  return v6;
}

- (int64_t)menuElementState
{
  v2 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:8];

  return v3;
}

- (id)activitySystemImageName
{
  return @"video";
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleVideosFilter";
  return @"PXActivityTypeToggleVideosFilter";
}

@end