@interface PXPhotosGridZoomInActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (BOOL)performerResetsAfterCompletion;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridZoomInActionPerformer

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  [v3 zoomStep];
  uint64_t v5 = (uint64_t)(v4 + -1.0);
  if (v5 < 0 || [v3 numberOfZoomSteps] <= v5)
  {
    v7 = PLGridZeroGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Action tried to zoom in, but that's no longer possible.", v8, 2u);
    }

    uint64_t v6 = 0;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__PXPhotosGridZoomInActionPerformer_performUserInteractionTask__block_invoke;
    v9[3] = &__block_descriptor_40_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v9[4] = v5;
    [v3 performChanges:v9];
    uint64_t v6 = 1;
  }
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:v6 error:0];
}

uint64_t __63__PXPhotosGridZoomInActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomStep:0 isInteractive:1 shouldAnimate:0 anchorAssetReference:(double)*(uint64_t *)(a1 + 32)];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(@"PXLibraryAllPhotosZoomIn", @"PhotosUICore");
}

- (id)menuElement
{
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosGridZoomInActionPerformer;
  double v4 = [(PXActionPerformer *)&v10 menuElement];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PXPhotosGridZoomInActionPerformer.m", 35, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[super menuElement]", v8, v9 object file lineNumber description];
    }
  }
  objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

- (id)activitySystemImageName
{
  return @"plus.magnifyingglass";
}

- (id)activityType
{
  v2 = @"PXActivityTypeZoomIn";
  return @"PXActivityTypeZoomIn";
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4 = a4;
  if ([v4 supportsZooming]
    && ([v4 currentDataSource],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsAnyItems],
        v5,
        v6))
  {
    [v4 zoomStep];
    BOOL v8 = v7 >= 1.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end