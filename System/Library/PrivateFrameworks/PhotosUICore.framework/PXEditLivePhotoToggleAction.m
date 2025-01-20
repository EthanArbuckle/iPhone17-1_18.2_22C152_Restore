@interface PXEditLivePhotoToggleAction
- (BOOL)_isLoopingVideo;
- (PXEditLivePhotoToggleAction)initWithCompositionController:(id)a3 livePhotoModel:(id)a4;
- (id)sourceComposition;
- (id)targetComposition;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXEditLivePhotoToggleAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sourceComposition, 0);
  objc_storeStrong((id *)&self->_livePhotoModel, 0);
}

- (id)targetComposition
{
  return self->_targetComposition;
}

- (id)sourceComposition
{
  return self->_sourceComposition;
}

- (void)performRedo:(id)a3
{
  livePhotoModel = self->_livePhotoModel;
  id v5 = a3;
  [(PXEditLivePhotoModel *)self->_livePhotoModel setVideoEnabled:[(PXEditLivePhotoModel *)livePhotoModel isVideoEnabled] ^ 1];
  v6.receiver = self;
  v6.super_class = (Class)PXEditLivePhotoToggleAction;
  [(PXEditCompositionAction *)&v6 performRedo:v5];
}

- (void)performUndo:(id)a3
{
  livePhotoModel = self->_livePhotoModel;
  id v5 = a3;
  [(PXEditLivePhotoModel *)self->_livePhotoModel setVideoEnabled:[(PXEditLivePhotoModel *)livePhotoModel isVideoEnabled] ^ 1];
  v6.receiver = self;
  v6.super_class = (Class)PXEditLivePhotoToggleAction;
  [(PXEditCompositionAction *)&v6 performUndo:v5];
}

- (BOOL)_isLoopingVideo
{
  v2 = [(PXEditCompositionAction *)self compositionController];
  v3 = [v2 autoLoopAdjustmentController];

  if (v3)
  {
    v4 = [v3 flavor];
    uint64_t v5 = PIAutoLoopFlavorFromString();

    BOOL v6 = (unint64_t)(v5 - 1) < 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)performAction:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v5 = [(PXEditCompositionAction *)self compositionController];
  BOOL v6 = [v5 composition];
  sourceComposition = self->_sourceComposition;
  self->_sourceComposition = v6;

  int v8 = [(PXEditLivePhotoModel *)self->_livePhotoModel isVideoEnabled];
  if ([(PXEditLivePhotoToggleAction *)self _isLoopingVideo])
  {
    v9 = [v5 adjustmentConstants];
    v10 = [v9 PIAutoLoopAdjustmentKey];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__PXEditLivePhotoToggleAction_performAction___block_invoke;
    v13[3] = &__block_descriptor_33_e40_v16__0__PIAutoLoopAdjustmentController_8l;
    char v14 = v8;
    [v5 modifyAdjustmentWithKey:v10 modificationBlock:v13];
  }
  v11 = [v5 composition];
  targetComposition = self->_targetComposition;
  self->_targetComposition = v11;

  [(PXEditLivePhotoModel *)self->_livePhotoModel setVideoEnabled:v8 ^ 1u];
  v4[2](v4, 1, 0);
}

uint64_t __45__PXEditLivePhotoToggleAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:*(unsigned char *)(a1 + 32) == 0];
}

- (PXEditLivePhotoToggleAction)initWithCompositionController:(id)a3 livePhotoModel:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXEditLivePhotoToggleAction;
  int v8 = [(PXEditCompositionAction *)&v11 initWithCompositionController:a3];
  if (v8)
  {
    if ([v7 isVideoEnabled]) {
      v9 = @"PXLivePhotoDisableAction";
    }
    else {
      v9 = @"PXLivePhotoEnableAction";
    }
    [(PXEditCompositionAction *)v8 setActionNameLocalizationKey:v9];
    objc_storeStrong((id *)&v8->_livePhotoModel, a4);
  }

  return v8;
}

@end