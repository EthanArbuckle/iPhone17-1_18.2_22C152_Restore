@interface PXEditAppliedCinematicStateAction
- (PXEditAppliedCinematicStateAction)initWithCinematicController:(id)a3 changeBlock:(id)a4;
- (id)actionNameLocalizationKey;
- (void)executeWithUndoManager:(id)a3;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXEditAppliedCinematicStateAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeBlock, 0);
  objc_storeStrong((id *)&self->_targetCinematographyState, 0);
  objc_storeStrong((id *)&self->_sourceCinematographyState, 0);
  objc_storeStrong((id *)&self->_cinematicController, 0);
}

- (void)executeWithUndoManager:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXEditAppliedCinematicStateAction;
  [(PXAction *)&v3 executeWithUndoManager:a3 completionHandler:&__block_literal_global_217910];
}

- (void)performRedo:(id)a3
{
  cinematicController = self->_cinematicController;
  targetCinematographyState = self->_targetCinematographyState;
  v5 = (void (**)(id, uint64_t, void))a3;
  [(PXCinematicEditController *)cinematicController resetToCinematographyState:targetCinematographyState];
  v5[2](v5, 1, 0);
}

- (void)performUndo:(id)a3
{
  cinematicController = self->_cinematicController;
  sourceCinematographyState = self->_sourceCinematographyState;
  v5 = (void (**)(id, uint64_t, void))a3;
  [(PXCinematicEditController *)cinematicController resetToCinematographyState:sourceCinematographyState];
  v5[2](v5, 1, 0);
}

- (void)performAction:(id)a3
{
  changeBlock = self->_changeBlock;
  cinematicController = self->_cinematicController;
  v6 = (void (*)(void *, PXCinematicEditController *))changeBlock[2];
  v9 = (void (**)(id, uint64_t, void))a3;
  v6(changeBlock, cinematicController);
  v7 = [(PXCinematicEditController *)self->_cinematicController cinematographyState];
  targetCinematographyState = self->_targetCinematographyState;
  self->_targetCinematographyState = v7;

  v9[2](v9, 1, 0);
}

- (id)actionNameLocalizationKey
{
  return @"PXCinematicEditAction";
}

- (PXEditAppliedCinematicStateAction)initWithCinematicController:(id)a3 changeBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXEditAppliedCinematicStateAction;
  v9 = [(PXEditAppliedCinematicStateAction *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cinematicController, a3);
    uint64_t v11 = [v7 cinematographyState];
    sourceCinematographyState = v10->_sourceCinematographyState;
    v10->_sourceCinematographyState = (NSDictionary *)v11;

    v13 = _Block_copy(v8);
    id changeBlock = v10->_changeBlock;
    v10->_id changeBlock = v13;
  }
  return v10;
}

@end