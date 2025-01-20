@interface PXPhotosGridActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (PXContentFilterState)currentContentFilterState;
- (PXPhotosGridActionPerformer)initWithActionType:(id)a3;
- (PXPhotosGridActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4;
- (PXPhotosViewModel)viewModel;
- (int64_t)menuElementState;
@end

@implementation PXPhotosGridActionPerformer

- (void).cxx_destruct
{
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "activityType", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(PXActionPerformer *)self activityType];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  char v9 = [v6 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXPhotosGridActionManager.m", 328, @"Invalid parameter not satisfying: %@", @"PXStringEqualToString(activity.activityType, self.activityType)" object file lineNumber description];
LABEL_5:
  }
  v10 = objc_opt_class();
  v11 = [(PXActionPerformer *)self actionType];
  v12 = [(PXPhotosGridActionPerformer *)self viewModel];
  LOBYTE(v10) = [v10 canPerformActionType:v11 withViewModel:v12];

  return (char)v10;
}

- (int64_t)menuElementState
{
  return 0;
}

- (PXContentFilterState)currentContentFilterState
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  v3 = [v2 contentFilterState];

  if (v3)
  {
    v4 = (void *)[v3 copy];
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v4 = +[PXContentFilterState defaultFilterStateForPhotoLibrary:v5];
  }
  return (PXContentFilterState *)v4;
}

- (PXPhotosGridActionPerformer)initWithActionType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridActionManager.m", 302, @"%s is not available as initializer", "-[PXPhotosGridActionPerformer initWithActionType:]");

  abort();
}

- (PXPhotosGridActionPerformer)initWithViewModel:(id)a3 actionType:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosGridActionPerformer;
  v8 = [(PXActionPerformer *)&v11 initWithActionType:a4];
  char v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_viewModel, a3);
  }

  return v9;
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return 0;
}

@end