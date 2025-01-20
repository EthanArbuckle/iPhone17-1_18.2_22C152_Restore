@interface PUCleanupCompositionAction
- (PIBrushStrokeHistory)afterBrushHistory;
- (PIBrushStrokeHistory)beforeBrushHistory;
- (PUCleanupCompositionAction)initWithCompositionController:(id)a3 sourceComposition:(id)a4 previousBrushHistory:(id)a5;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setAfterBrushHistory:(id)a3;
- (void)setBeforeBrushHistory:(id)a3;
@end

@implementation PUCleanupCompositionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterBrushHistory, 0);
  objc_storeStrong((id *)&self->_beforeBrushHistory, 0);
}

- (void)setAfterBrushHistory:(id)a3
{
}

- (PIBrushStrokeHistory)afterBrushHistory
{
  return self->_afterBrushHistory;
}

- (void)setBeforeBrushHistory:(id)a3
{
}

- (PIBrushStrokeHistory)beforeBrushHistory
{
  return self->_beforeBrushHistory;
}

- (void)performRedo:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PUCleanupCompositionAction_performRedo___block_invoke;
  v7[3] = &unk_1E5F2D848;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PUCleanupCompositionAction;
  id v5 = v4;
  [(PXEditCompositionAction *)&v6 performRedo:v7];
}

void __42__PUCleanupCompositionAction_performRedo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [*(id *)(a1 + 32) afterBrushHistory];
  objc_super v6 = [*(id *)(a1 + 32) compositionController];
  [v6 setBrushStrokeHistory:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PUCleanupCompositionAction_performUndo___block_invoke;
  v7[3] = &unk_1E5F2D848;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PUCleanupCompositionAction;
  id v5 = v4;
  [(PXEditCompositionAction *)&v6 performUndo:v7];
}

void __42__PUCleanupCompositionAction_performUndo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = [*(id *)(a1 + 32) beforeBrushHistory];
  objc_super v6 = [*(id *)(a1 + 32) compositionController];
  [v6 setBrushStrokeHistory:v5];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (PUCleanupCompositionAction)initWithCompositionController:(id)a3 sourceComposition:(id)a4 previousBrushHistory:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)PUCleanupCompositionAction;
  id v7 = a5;
  id v8 = a3;
  v9 = [(PXEditAppliedCompositionAction *)&v12 initWithCompositionController:v8 sourceComposition:a4];
  -[PUCleanupCompositionAction setBeforeBrushHistory:](v9, "setBeforeBrushHistory:", v7, v12.receiver, v12.super_class);

  v10 = [v8 brushStrokeHistory];

  [(PUCleanupCompositionAction *)v9 setAfterBrushHistory:v10];
  return v9;
}

@end