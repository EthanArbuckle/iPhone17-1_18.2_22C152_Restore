@interface PXEditAdjustmentAction
+ (id)muteToggleActionWithCompositionController:(id)a3 isLoopingVideo:(BOOL)a4;
- (NSNumber)targetValue;
- (NSString)adjustmentKey;
- (PXEditAdjustmentAction)init;
- (PXEditAdjustmentAction)initWithCompositionController:(id)a3 adjustmentKey:(id)a4 targetValue:(id)a5;
- (id)sourceComposition;
- (id)targetComposition;
- (void)performAction:(id)a3;
@end

@implementation PXEditAdjustmentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sourceComposition, 0);
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_adjustmentKey, 0);
}

- (NSNumber)targetValue
{
  return self->_targetValue;
}

- (NSString)adjustmentKey
{
  return self->_adjustmentKey;
}

- (id)targetComposition
{
  return self->_targetComposition;
}

- (id)sourceComposition
{
  return self->_sourceComposition;
}

- (void)performAction:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(PXEditCompositionAction *)self compositionController];
  v6 = [v5 composition];
  sourceComposition = self->_sourceComposition;
  self->_sourceComposition = v6;

  adjustmentKey = self->_adjustmentKey;
  if (self->_targetValue)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__PXEditAdjustmentAction_performAction___block_invoke;
    v11[3] = &unk_1E5DBB280;
    v11[4] = self;
    [v5 modifyAdjustmentWithKey:adjustmentKey modificationBlock:v11];
  }
  else
  {
    [v5 removeAdjustmentWithKey:adjustmentKey];
  }
  v9 = [v5 composition];
  targetComposition = self->_targetComposition;
  self->_targetComposition = v9;

  v4[2](v4, 1, 0);
}

void __40__PXEditAdjustmentAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "BOOLValue"));
}

- (PXEditAdjustmentAction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXEditAdjustmentAction.m", 61, @"%s is not available as initializer", "-[PXEditAdjustmentAction init]");

  abort();
}

- (PXEditAdjustmentAction)initWithCompositionController:(id)a3 adjustmentKey:(id)a4 targetValue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXEditAdjustmentAction;
  v10 = [(PXEditCompositionAction *)&v14 initWithCompositionController:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    adjustmentKey = v10->_adjustmentKey;
    v10->_adjustmentKey = (NSString *)v11;

    objc_storeStrong((id *)&v10->_targetValue, a5);
  }

  return v10;
}

+ (id)muteToggleActionWithCompositionController:(id)a3 isLoopingVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 adjustmentConstants];
  id v8 = [v7 PIMuteAdjustmentKey];

  id v9 = [v6 adjustmentControllerForKey:v8];
  v10 = v9;
  if (!v9)
  {
    v12 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "enabled"));
  v12 = v11;
  if (!v11 || [v11 BOOLValue])
  {
LABEL_6:
    char v14 = [v12 BOOLValue];
    id v13 = (id)MEMORY[0x1E4F1CC28];
    if (v14) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v13 = 0;
LABEL_7:
  v15 = (void *)MEMORY[0x1E4F1CC38];
  if (v4) {
    v15 = v13;
  }
  id v13 = v15;
LABEL_10:
  v16 = (void *)[objc_alloc((Class)a1) initWithCompositionController:v6 adjustmentKey:v8 targetValue:v13];
  if ([v13 BOOLValue]) {
    v17 = @"PXLivePhotoMuteAction";
  }
  else {
    v17 = @"PXLivePhotoUnmuteAction";
  }
  [v16 setActionNameLocalizationKey:v17];

  return v16;
}

@end