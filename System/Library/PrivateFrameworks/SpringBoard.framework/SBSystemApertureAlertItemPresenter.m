@interface SBSystemApertureAlertItemPresenter
- (BOOL)canPresentMultipleAlertItemsSimultaneously;
- (BOOL)presentsAlertItemsModally;
- (NSMapTable)elementsToAssertions;
- (SBSystemApertureAlertItemPresenter)initWithSystemApertureController:(id)a3;
- (SBSystemApertureController)systemApertureController;
- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SBSystemApertureAlertItemPresenter

- (SBSystemApertureAlertItemPresenter)initWithSystemApertureController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBSystemApertureAlertItemPresenter.m", 26, @"Invalid parameter not satisfying: %@", @"systemApertureController" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureAlertItemPresenter;
  v6 = [(SBSystemApertureAlertItemPresenter *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_systemApertureController, v5);
  }

  return v7;
}

- (BOOL)presentsAlertItemsModally
{
  return 0;
}

- (BOOL)canPresentMultipleAlertItemsSimultaneously
{
  return 1;
}

- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v16 = a3;
  v8 = (void (**)(void))a5;
  BSDispatchQueueAssertMain();
  v9 = [v16 _systemApertureElement];
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBSystemApertureAlertItemPresenter.m", 48, @"%@ cannot present alert item '%@' that does not have an SAElement", self, v16 object file lineNumber description];
  }
  objc_super v10 = [(SBSystemApertureAlertItemPresenter *)self systemApertureController];
  v11 = [v10 registerElement:v9];
  if (v11)
  {
    if (!self->_elementsToAssertions)
    {
      v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      elementsToAssertions = self->_elementsToAssertions;
      self->_elementsToAssertions = v12;
    }
    v14 = [(SBSystemApertureAlertItemPresenter *)self elementsToAssertions];
    [v14 setObject:v11 forKey:v9];

    [v16 wakeDisplay];
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v14 = a3;
  v8 = (void (**)(void))a5;
  BSDispatchQueueAssertMain();
  v9 = [v14 _systemApertureElement];
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSystemApertureAlertItemPresenter.m", 72, @"%@ cannot dismiss alert item '%@' that does not have an SAElement", self, v14 object file lineNumber description];
  }
  objc_super v10 = [(SBSystemApertureAlertItemPresenter *)self elementsToAssertions];
  v11 = [v10 objectForKey:v9];

  if (v11)
  {
    [v11 invalidateWithReason:@"dismissAlertItem"];
    v12 = [(SBSystemApertureAlertItemPresenter *)self elementsToAssertions];
    [v12 removeObjectForKey:v9];
  }
  if (v8) {
    v8[2](v8);
  }
}

- (SBSystemApertureController)systemApertureController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureController);
  return (SBSystemApertureController *)WeakRetained;
}

- (NSMapTable)elementsToAssertions
{
  return self->_elementsToAssertions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsToAssertions, 0);
  objc_destroyWeak((id *)&self->_systemApertureController);
}

@end