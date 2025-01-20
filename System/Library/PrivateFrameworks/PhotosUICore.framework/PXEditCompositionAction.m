@interface PXEditCompositionAction
- (NSString)actionNameLocalizationKey;
- (NSString)localizedActionName;
- (NUComposition)sourceComposition;
- (NUComposition)targetComposition;
- (PICompositionController)compositionController;
- (PXEditCompositionAction)init;
- (PXEditCompositionAction)initWithCompositionController:(id)a3;
- (void)_applyComposition:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setActionNameLocalizationKey:(id)a3;
- (void)setLocalizedActionName:(id)a3;
@end

@implementation PXEditCompositionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_actionNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
}

- (void)setLocalizedActionName:(id)a3
{
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (void)setActionNameLocalizationKey:(id)a3
{
}

- (NSString)actionNameLocalizationKey
{
  return self->_actionNameLocalizationKey;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)performRedo:(id)a3
{
  compositionController = self->_compositionController;
  v5 = (void (**)(id, uint64_t, void))a3;
  id v9 = [(PICompositionController *)compositionController composition];
  v6 = [(PXEditCompositionAction *)self targetComposition];
  [(PXEditCompositionAction *)self _applyComposition:v6];

  v5[2](v5, 1, 0);
  v7 = (void *)MEMORY[0x1E4F91110];
  v8 = [(PXEditCompositionAction *)self targetComposition];
  [v7 reportAnalyticsForChangeFrom:v9 to:v8 actionType:1];
}

- (void)performUndo:(id)a3
{
  compositionController = self->_compositionController;
  v5 = (void (**)(id, uint64_t, void))a3;
  id v9 = [(PICompositionController *)compositionController composition];
  v6 = [(PXEditCompositionAction *)self sourceComposition];
  [(PXEditCompositionAction *)self _applyComposition:v6];

  v5[2](v5, 1, 0);
  v7 = (void *)MEMORY[0x1E4F91110];
  v8 = [(PXEditCompositionAction *)self sourceComposition];
  [v7 reportAnalyticsForChangeFrom:v9 to:v8 actionType:0];
}

- (NUComposition)targetComposition
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXEditCompositionAction.m", 53, @"Method %s is a responsibility of subclass %@", "-[PXEditCompositionAction targetComposition]", v6 object file lineNumber description];

  abort();
}

- (NUComposition)sourceComposition
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXEditCompositionAction.m", 49, @"Method %s is a responsibility of subclass %@", "-[PXEditCompositionAction sourceComposition]", v6 object file lineNumber description];

  abort();
}

- (void)_applyComposition:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXEditCompositionAction.m", 40, @"Invalid parameter not satisfying: %@", @"composition" object file lineNumber description];
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F8A280]) initWithComposition:v7];
  objc_msgSend(v5, "setImageOrientation:", -[PICompositionController imageOrientation](self->_compositionController, "imageOrientation"));
  [(PICompositionController *)self->_compositionController applyChangesFromCompositionController:v5];
}

- (PXEditCompositionAction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXEditCompositionAction.m", 34, @"%s is not available as initializer", "-[PXEditCompositionAction init]");

  abort();
}

- (PXEditCompositionAction)initWithCompositionController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXEditCompositionAction;
  v6 = [(PXEditCompositionAction *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_compositionController, a3);
  }

  return v7;
}

@end