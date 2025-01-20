@interface PXEditAutoCinematicAction
- (NSString)localizedActionName;
- (PXEditAutoCinematicAction)initWithCinematicController:(id)a3;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setLocalizedActionName:(id)a3;
@end

@implementation PXEditAutoCinematicAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_cinematicController, 0);
}

- (void)setLocalizedActionName:(id)a3
{
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (void)performRedo:(id)a3
{
  v6 = (void (**)(id, BOOL, void))a3;
  int isInAutoFocusState = self->_isInAutoFocusState;
  int v5 = [(PXCinematicEditController *)self->_cinematicController isInAutoFocusState];
  if (isInAutoFocusState == v5) {
    [(PXCinematicEditController *)self->_cinematicController toggleAutoFocusState];
  }
  v6[2](v6, isInAutoFocusState == v5, 0);
}

- (void)performUndo:(id)a3
{
  v6 = (void (**)(id, BOOL, void))a3;
  int isInAutoFocusState = self->_isInAutoFocusState;
  int v5 = [(PXCinematicEditController *)self->_cinematicController isInAutoFocusState];
  if (isInAutoFocusState != v5) {
    [(PXCinematicEditController *)self->_cinematicController toggleAutoFocusState];
  }
  v6[2](v6, isInAutoFocusState != v5, 0);
}

- (void)performAction:(id)a3
{
  cinematicController = self->_cinematicController;
  v4 = (void (**)(id, uint64_t, void))a3;
  [(PXCinematicEditController *)cinematicController toggleAutoFocusState];
  v4[2](v4, 1, 0);
}

- (PXEditAutoCinematicAction)initWithCinematicController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXEditAutoCinematicAction;
  v6 = [(PXEditAutoCinematicAction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cinematicController, a3);
    v7->_int isInAutoFocusState = [v5 isInAutoFocusState];
  }

  return v7;
}

@end