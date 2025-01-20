@interface PXPhotosGridToggleShowOnlyScreenshotFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleShowOnlyScreenshotFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v6 = a4;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PXPhotosGridToggleShowOnlyScreenshotFilterActionPerformer;
  if (objc_msgSendSuper2(&v9, sel_canPerformActionType_withViewModel_, a3, v6)) {
    BOOL v7 = !+[PXPhotosGridToggleFilterActionPerformer isContentFilterHidden:13 viewModel:v6];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)performUserInteractionTask
{
  id v3 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setShowOnlyScreenshots:", objc_msgSend(v3, "showOnlyScreenshots") ^ 1);
  [(PXPhotosGridToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v5 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  if ([v5 isContentFilterActive:8]) {
    char v6 = [v5 isContentFilterActive:7] ^ 1;
  }
  else {
    char v6 = 0;
  }
  BOOL v7 = [(PXPhotosGridActionPerformer *)self viewModel];
  v8 = [v7 currentDataSource];
  objc_super v9 = [v8 firstAssetCollection];

  if ((v6 & 1) != 0 || objc_msgSend(v9, "px_isVideosSmartAlbum"))
  {
    if (a3 != 1)
    {
      v13 = @"PXContentFilterMenu_ScreenRecordings";
LABEL_14:
      uint64_t v14 = PXLocalizedStringFromTable(v13, @"PhotosUICore");
      goto LABEL_15;
    }
    int v10 = [v5 showOnlyScreenshots];
    v11 = @"ENABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT";
    v12 = @"DISABLE_SHOW_ONLY_SCREENRECORDINGS_FILTER_SHORTCUT";
LABEL_11:
    if (v10) {
      v13 = v12;
    }
    else {
      v13 = v11;
    }
    goto LABEL_14;
  }
  if (a3 == 1)
  {
    int v10 = [v5 showOnlyScreenshots];
    v11 = @"ENABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT";
    v12 = @"DISABLE_SHOW_ONLY_SCREENSHOTS_FILTER_SHORTCUT";
    goto LABEL_11;
  }
  uint64_t v14 = PXContentFilterTitleForItemTag(13);
LABEL_15:
  v15 = (void *)v14;

  return v15;
}

- (int64_t)menuElementState
{
  v2 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:13];

  return v3;
}

- (id)activitySystemImageName
{
  return @"camera.viewfinder";
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleShowOnlyScreenshotsFilter";
  return @"PXActivityTypeToggleShowOnlyScreenshotsFilter";
}

@end