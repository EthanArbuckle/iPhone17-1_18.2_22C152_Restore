@interface PXCuratedLibraryActionPerformer
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryActionPerformer)initWithActionType:(id)a3;
- (PXCuratedLibraryActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4;
- (PXCuratedLibraryViewModel)viewModel;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)actionZoomLevel;
- (void)performActionWithCompletionHandler:(id)a3;
@end

@implementation PXCuratedLibraryActionPerformer

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
}

- (PXCuratedLibraryActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryActionPerformer;
  v8 = [(PXActionPerformer *)&v11 initWithActionType:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewModel, a4);
    v9->_actionZoomLevel = [v7 zoomLevel];
  }

  return v9;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v4 = [(PXActionPerformer *)self actionType];
  v5 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  id v7 = _PXCuratedLibraryActionTitle(v4, v6, v5, 0);

  return v7;
}

- (int64_t)actionZoomLevel
{
  return self->_actionZoomLevel;
}

- (BOOL)keepMenuPresented
{
  v2 = [(PXActionPerformer *)self actionType];
  if ([v2 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomIn"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomOut"];
  }

  return v3;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  uint64_t v6 = [(PXActionPerformer *)self actionType];
  int v7 = [v6 isEqualToString:@"PXCuratedLibraryActionEnterSelectMode"];

  if (v7)
  {
    v8 = &__block_literal_global_493;
    goto LABEL_5;
  }
  v9 = [(PXActionPerformer *)self actionType];
  int v10 = [v9 isEqualToString:@"PXCuratedLibraryActionCancelSelectMode"];

  if (v10)
  {
    v8 = &__block_literal_global_495;
    goto LABEL_5;
  }
  objc_super v11 = [(PXActionPerformer *)self actionType];
  int v12 = [v11 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomIn"];

  if (v12)
  {
    v13 = [v5 zoomablePhotosViewModel];
    v14 = v13;
    v15 = &__block_literal_global_498;
    goto LABEL_12;
  }
  v16 = [(PXActionPerformer *)self actionType];
  int v17 = [v16 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomOut"];

  if (v17)
  {
    v13 = [v5 zoomablePhotosViewModel];
    v14 = v13;
    v15 = &__block_literal_global_500_97450;
LABEL_12:
    [v13 performChanges:v15];

    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v18 = [(PXActionPerformer *)self actionType];
  int v19 = [v18 isEqualToString:@"PXCuratedLibraryActionShowSidebar"];

  if (!v19)
  {
    v20.receiver = self;
    v20.super_class = (Class)PXCuratedLibraryActionPerformer;
    [(PXActionPerformer *)&v20 performActionWithCompletionHandler:v4];
    goto LABEL_7;
  }
  v8 = &__block_literal_global_502;
LABEL_5:
  [v5 performChanges:v8];
  if (v4) {
LABEL_6:
  }
    v4[2](v4, 1, 0);
LABEL_7:
}

uint64_t __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setWantsSidebarVisible:1];
}

void __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = v2;
  if (v2)
  {
    [v2 zoomState];
    uint64_t v4 = *((void *)&v7 + 1) + 1;
  }
  else
  {
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v4 = 1;
    long long v5 = 0u;
    long long v6 = 0u;
  }
  objc_msgSend(v3, "zoomToColumnIndex:withAnchorAssetReference:animated:", v4, 0, 1, v5, v6, v7, v8, v9, v10, v11);
}

void __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = v2;
  if (v2)
  {
    [v2 zoomState];
    uint64_t v4 = *((void *)&v7 + 1) - 1;
  }
  else
  {
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v4 = -1;
    long long v5 = 0u;
    long long v6 = 0u;
  }
  objc_msgSend(v3, "zoomToColumnIndex:withAnchorAssetReference:animated:", v4, 0, 1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:0];
}

uint64_t __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsSelecting:1];
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "activityType", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(PXCuratedLibraryActionPerformer *)self activityType];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  long long v8 = v7;
  char v9 = [v6 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 487, @"Invalid parameter not satisfying: %@", @"PXStringEqualToString(activity.activityType, self.activityType)" object file lineNumber description];
LABEL_5:
  }
  return 1;
}

- (id)activitySystemImageName
{
  uint64_t v4 = [(PXActionPerformer *)self actionType];
  long long v5 = [(PXActionPerformer *)self actionType];
  char v6 = [v5 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomIn"];

  if (v6)
  {
    id v7 = @"plus.magnifyingglass";
  }
  else
  {
    long long v8 = [(PXActionPerformer *)self actionType];
    char v9 = [v8 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomOut"];

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 481, @"Unknown action type \"%@\"", v4 object file lineNumber description];

      abort();
    }
    id v7 = @"minus.magnifyingglass";
  }

  return v7;
}

- (id)activityType
{
  uint64_t v4 = [(PXActionPerformer *)self actionType];
  if ([v4 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomIn"])
  {
    long long v5 = PXActivityTypeZoomIn;
  }
  else
  {
    if (([v4 isEqualToString:@"PXCuratedLibraryActionAllPhotosZoomOut"] & 1) == 0)
    {
      long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 469, @"Unknown action type \"%@\"", v4 object file lineNumber description];

      abort();
    }
    long long v5 = PXActivityTypeZoomOut;
  }
  char v6 = *v5;

  return v6;
}

- (PXCuratedLibraryActionPerformer)initWithActionType:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryActionManager.m", 453, @"%s is not available as initializer", "-[PXCuratedLibraryActionPerformer initWithActionType:]");

  abort();
}

@end