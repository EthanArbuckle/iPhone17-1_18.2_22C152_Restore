@interface PUPhotoEditIrisModel
- (BOOL)_hasLegacyIrisConflicts;
- (BOOL)assetHasAdjustments;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoresUpdates;
- (BOOL)isVideoEnabled;
- (BOOL)reenablingLivePhotoShouldRemoveEdits;
- (PICompositionController)compositionController;
- (PUEditableAsset)asset;
- (PUPhotoEditIrisModel)init;
- (PUPhotoEditIrisModel)initWithAsset:(id)a3 compositionController:(id)a4;
- (PUPhotoEditIrisModel)initWithIrisVisibilityState:(unsigned __int16)a3 hasAdjustments:(BOOL)a4 compositionController:(id)a5;
- (PUPhotoEditIrisModelChange)currentChange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newViewModelChange;
- (unsigned)assetVisibility;
- (unsigned)editingVisibility;
- (void)_setHidden:(BOOL)a3 explicit:(BOOL)a4 supportable:(BOOL)a5;
- (void)_updateAutoDisableStateIfNeeded;
- (void)dealloc;
- (void)notifyCannotSupportVideoEdits;
- (void)setCompositionController:(id)a3;
- (void)setEditingVisibility:(unsigned __int16)a3;
- (void)setIgnoresUpdates:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
@end

@implementation PUPhotoEditIrisModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (BOOL)assetHasAdjustments
{
  return self->_assetHasAdjustments;
}

- (unsigned)assetVisibility
{
  return self->_assetVisibility;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setEditingVisibility:(unsigned __int16)a3
{
  self->_editingVisibility = a3;
}

- (unsigned)editingVisibility
{
  return self->_editingVisibility;
}

- (BOOL)ignoresUpdates
{
  return self->_ignoresUpdates;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (void)_setHidden:(BOOL)a3 explicit:(BOOL)a4 supportable:(BOOL)a5
{
  if (a3 && a4) {
    int v6 = 4;
  }
  else {
    int v6 = 0;
  }
  if (a5) {
    int v7 = 8;
  }
  else {
    int v7 = 0;
  }
  [(PUPhotoEditIrisModel *)self setEditingVisibility:v7 | a3 | v6 | 2u];
  int IsPlayable = PHVideoComplementVisibilityStateIsPlayable();
  if (self->_videoEnabled != IsPlayable)
  {
    self->_videoEnabled = IsPlayable;
    id v9 = [(PUPhotoEditIrisModel *)self currentChange];
    [v9 _setVideoEnabledDidChange:1];
  }
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUPhotoEditIrisModelChange);
}

- (PUPhotoEditIrisModelChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditIrisModel;
  v2 = [(PUViewModel *)&v4 currentChange];
  return (PUPhotoEditIrisModelChange *)v2;
}

- (BOOL)_hasLegacyIrisConflicts
{
  v2 = [(PUPhotoEditIrisModel *)self compositionController];
  v3 = [v2 adjustmentConstants];
  objc_super v4 = (void *)MEMORY[0x1E4F8A358];
  v5 = (void *)[MEMORY[0x1E4F8A358] newComposition];
  int v6 = (void *)[v4 newCompositionControllerWithComposition:v5];

  int v7 = [v6 availableKeys];
  v8 = (void *)[v7 mutableCopy];

  id v9 = [v3 PIRedEyeAdjustmentKey];
  [v8 removeObject:v9];

  v10 = [v3 PIAutoEnhanceAdjustmentKey];
  [v8 removeObject:v10];

  v11 = [v6 composition];
  char v12 = [v2 isEqual:v11 forKeys:v8 visualChangesOnly:1];

  return v12 ^ 1;
}

- (void)_updateAutoDisableStateIfNeeded
{
  if ([(PUPhotoEditIrisModel *)self isVideoEnabled]
    && ![(PUPhotoEditIrisModel *)self ignoresUpdates])
  {
    if ([(PUPhotoEditIrisModel *)self _hasLegacyIrisConflicts])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __55__PUPhotoEditIrisModel__updateAutoDisableStateIfNeeded__block_invoke;
      v3[3] = &unk_1E5F2ED10;
      v3[4] = self;
      [(PUViewModel *)self performChanges:v3];
    }
  }
}

uint64_t __55__PUPhotoEditIrisModel__updateAutoDisableStateIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) editingVisibility];
  uint64_t HasFullEditingSupport = PHVideoComplementVisibilityStateHasFullEditingSupport();
  v3 = *(void **)(a1 + 32);
  return [v3 _setHidden:1 explicit:0 supportable:HasFullEditingSupport];
}

- (void)setIgnoresUpdates:(BOOL)a3
{
  if (self->_ignoresUpdates != a3)
  {
    self->_ignoresUpdates = a3;
    if (!a3) {
      [(PUPhotoEditIrisModel *)self _updateAutoDisableStateIfNeeded];
    }
  }
}

- (BOOL)hasUnsavedChanges
{
  [(PUPhotoEditIrisModel *)self assetVisibility];
  [(PUPhotoEditIrisModel *)self assetHasAdjustments];
  int IsPlayable = PHVideoComplementVisibilityStateIsPlayable();
  if (IsPlayable != [(PUPhotoEditIrisModel *)self isVideoEnabled]
    && [(PUPhotoEditIrisModel *)self assetVisibility] == 2
    && [(PUPhotoEditIrisModel *)self editingVisibility] == 10)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int v5 = [(PUPhotoEditIrisModel *)self assetVisibility];
    return ((v5 ^ [(PUPhotoEditIrisModel *)self editingVisibility]) >> 2) & 1;
  }
  return v4;
}

- (BOOL)reenablingLivePhotoShouldRemoveEdits
{
  return PHVideoComplementVisibilityStateHasFullEditingSupport() ^ 1;
}

- (void)notifyCannotSupportVideoEdits
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__PUPhotoEditIrisModel_notifyCannotSupportVideoEdits__block_invoke;
  v2[3] = &unk_1E5F2ED10;
  v2[4] = self;
  [(PUViewModel *)self performChanges:v2];
}

uint64_t __53__PUPhotoEditIrisModel_notifyCannotSupportVideoEdits__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHidden:1 explicit:0 supportable:0];
}

- (void)setVideoEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__PUPhotoEditIrisModel_setVideoEnabled___block_invoke;
  v3[3] = &unk_1E5F2E120;
  v3[4] = self;
  BOOL v4 = a3;
  [(PUViewModel *)self performChanges:v3];
}

uint64_t __40__PUPhotoEditIrisModel_setVideoEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) editingVisibility];
  uint64_t HasFullEditingSupport = PHVideoComplementVisibilityStateHasFullEditingSupport();
  v3 = *(void **)(a1 + 32);
  BOOL v4 = *(unsigned char *)(a1 + 40) == 0;
  return [v3 _setHidden:v4 explicit:1 supportable:HasFullEditingSupport];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditIrisModel;
  [(PUPhotoEditIrisModel *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[PUPhotoEditIrisModel allocWithZone:a3];
  int v5 = [(PUPhotoEditIrisModel *)self asset];
  int v6 = [(PUPhotoEditIrisModel *)self compositionController];
  uint64_t v7 = [(PUPhotoEditIrisModel *)v4 initWithAsset:v5 compositionController:v6];

  *(_WORD *)(v7 + 68) = self->_editingVisibility;
  *(_WORD *)(v7 + 70) = self->_assetVisibility;
  *(unsigned char *)(v7 + 66) = self->_assetHasAdjustments;
  *(unsigned char *)(v7 + 64) = self->_videoEnabled;
  return (id)v7;
}

- (PUPhotoEditIrisModel)initWithIrisVisibilityState:(unsigned __int16)a3 hasAdjustments:(BOOL)a4 compositionController:(id)a5
{
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUPhotoEditIrisModel;
  v10 = [(PUViewModel *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_assetVisibility = a3;
    v10->_assetHasAdjustments = a4;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__PUPhotoEditIrisModel_initWithIrisVisibilityState_hasAdjustments_compositionController___block_invoke;
    v14[3] = &unk_1E5F2BD48;
    unsigned __int16 v16 = a3;
    char v12 = v10;
    v15 = v12;
    [v12 performChanges:v14];
    objc_storeStrong(v12 + 10, a5);
  }
  return v11;
}

uint64_t __89__PUPhotoEditIrisModel_initWithIrisVisibilityState_hasAdjustments_compositionController___block_invoke(uint64_t a1)
{
  uint64_t IsHidden = PHVideoComplementVisibilityStateIsHidden();
  uint64_t IsExplicit = PHVideoComplementVisibilityStateIsExplicit();
  objc_super v4 = *(void **)(a1 + 32);
  return [v4 _setHidden:IsHidden explicit:IsExplicit supportable:1];
}

- (PUPhotoEditIrisModel)initWithAsset:(id)a3 compositionController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isLivePhoto]) {
    unsigned __int16 v9 = [v7 livePhotoVisibilityState];
  }
  else {
    unsigned __int16 v9 = 0;
  }
  v10 = -[PUPhotoEditIrisModel initWithIrisVisibilityState:hasAdjustments:compositionController:](self, "initWithIrisVisibilityState:hasAdjustments:compositionController:", v9, [v7 isAdjusted], v8);

  if (v10) {
    objc_storeStrong((id *)&v10->_asset, a3);
  }

  return v10;
}

- (PUPhotoEditIrisModel)init
{
  return [(PUPhotoEditIrisModel *)self initWithAsset:0 compositionController:0];
}

@end