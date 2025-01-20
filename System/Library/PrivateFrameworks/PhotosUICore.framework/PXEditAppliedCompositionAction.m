@interface PXEditAppliedCompositionAction
- (NUComposition)sourceComposition;
- (PXEditAppliedCompositionAction)initWithCompositionController:(id)a3;
- (PXEditAppliedCompositionAction)initWithCompositionController:(id)a3 sourceComposition:(id)a4;
- (id)targetComposition;
- (void)performAction:(id)a3;
@end

@implementation PXEditAppliedCompositionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sourceComposition, 0);
}

- (id)targetComposition
{
  return self->_targetComposition;
}

- (NUComposition)sourceComposition
{
  return self->_sourceComposition;
}

- (void)performAction:(id)a3
{
}

- (PXEditAppliedCompositionAction)initWithCompositionController:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXEditAppliedCompositionAction.m", 32, @"%s is not available as initializer", "-[PXEditAppliedCompositionAction initWithCompositionController:]");

  abort();
}

- (PXEditAppliedCompositionAction)initWithCompositionController:(id)a3 sourceComposition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXEditAppliedCompositionAction;
  v8 = [(PXEditCompositionAction *)&v13 initWithCompositionController:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceComposition, a4);
    uint64_t v10 = [v6 composition];
    targetComposition = v9->_targetComposition;
    v9->_targetComposition = (NUComposition *)v10;
  }
  return v9;
}

@end