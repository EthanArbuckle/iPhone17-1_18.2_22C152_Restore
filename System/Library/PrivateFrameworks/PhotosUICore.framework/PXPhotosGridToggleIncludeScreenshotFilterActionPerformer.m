@interface PXPhotosGridToggleIncludeScreenshotFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleIncludeScreenshotFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PXPhotosGridToggleIncludeScreenshotFilterActionPerformer;
  id v5 = a4;
  unsigned int v6 = objc_msgSendSuper2(&v10, sel_canPerformActionType_withViewModel_, a3, v5);
  v7 = objc_msgSend(v5, "currentDataSource", v10.receiver, v10.super_class);

  v8 = [v7 firstAssetCollection];

  if (v6) {
    unsigned int v6 = objc_msgSend(v8, "px_isMediaTypeSmartAlbum") ^ 1;
  }

  return v6;
}

- (void)performUserInteractionTask
{
  id v3 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setIncludeScreenshots:", objc_msgSend(v3, "isContentFilterActive:", 2) ^ 1);
  [(PXPhotosGridToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = [(PXPhotosGridActionPerformer *)self viewModel];
    unsigned int v6 = [v5 contentFilterState];

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        v14 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
        [v11 handleFailureInMethod:a2, self, @"PXPhotosGridToggleIncludeScreenshotFilterActionPerformer.m", 45, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.viewModel.contentFilterState", v13, v14 object file lineNumber description];
      }
    }
    int v7 = [v6 shouldExcludeScreenshots];

    if (v7) {
      v8 = @"ENABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT";
    }
    else {
      v8 = @"DISABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT";
    }
    v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
  }
  else
  {
    v9 = PXContentFilterTitleForItemTag(2);
  }
  return v9;
}

- (int64_t)menuElementState
{
  v2 = [(PXPhotosGridActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:2];

  return v3;
}

- (id)activitySystemImageName
{
  return @"camera.viewfinder";
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleIncludeScreenshotsFilter";
  return @"PXActivityTypeToggleIncludeScreenshotsFilter";
}

@end