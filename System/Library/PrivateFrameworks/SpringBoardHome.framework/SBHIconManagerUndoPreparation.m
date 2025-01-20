@interface SBHIconManagerUndoPreparation
- (SBHIconManager)iconManager;
- (SBHIconManagerUndoPreparation)initWithIconManager:(id)a3;
- (SBHUndoObserving)observer;
- (SBRootFolder)originalRootFolder;
- (SBRootFolder)unmodifiedOriginalRootFolder;
- (void)registerWithUndoManager:(id)a3 actionName:(id)a4 observer:(id)a5;
- (void)setObserver:(id)a3;
@end

@implementation SBHIconManagerUndoPreparation

- (SBHIconManagerUndoPreparation)initWithIconManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHIconManagerUndoPreparation;
  v5 = [(SBHIconManagerUndoPreparation *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    v7 = [v4 rootFolder];
    objc_storeWeak((id *)&v6->_originalRootFolder, v7);
    uint64_t v8 = [v7 copy];
    unmodifiedOriginalRootFolder = v6->_unmodifiedOriginalRootFolder;
    v6->_unmodifiedOriginalRootFolder = (SBRootFolder *)v8;
  }
  return v6;
}

- (void)registerWithUndoManager:(id)a3 actionName:(id)a4 observer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBHIconManagerUndoPreparation *)self iconManager];
  [v11 undoPreparation:self registerWithUndoManager:v10 actionName:v9 observer:v8];
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (SBRootFolder)originalRootFolder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalRootFolder);
  return (SBRootFolder *)WeakRetained;
}

- (SBRootFolder)unmodifiedOriginalRootFolder
{
  return self->_unmodifiedOriginalRootFolder;
}

- (SBHUndoObserving)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SBHUndoObserving *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_unmodifiedOriginalRootFolder, 0);
  objc_destroyWeak((id *)&self->_originalRootFolder);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end