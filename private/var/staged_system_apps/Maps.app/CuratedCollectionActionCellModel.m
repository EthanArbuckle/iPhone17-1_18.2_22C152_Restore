@interface CuratedCollectionActionCellModel
- (CuratedCollectionActionCellModel)initWithCollection:(id)a3;
- (CuratedCollectionActionDelegate)actionDelegate;
- (CuratedCollectionActionManager)actionManager;
- (GEOPlaceCollection)collection;
- (void)_updateActionManagerState;
- (void)dealloc;
- (void)setActionDelegate:(id)a3;
- (void)setActionManager:(id)a3;
@end

@implementation CuratedCollectionActionCellModel

- (CuratedCollectionActionCellModel)initWithCollection:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionActionCellModel;
  v6 = [(CuratedCollectionActionCellModel *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = objc_alloc_init(CuratedCollectionActionManager);
    actionManager = v7->_actionManager;
    v7->_actionManager = v8;

    v10 = +[CuratedCollectionSyncManager sharedManager];
    [v10 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[CuratedCollectionSyncManager sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionActionCellModel;
  [(CuratedCollectionActionCellModel *)&v4 dealloc];
}

- (CuratedCollectionActionManager)actionManager
{
  [(CuratedCollectionActionCellModel *)self _updateActionManagerState];
  actionManager = self->_actionManager;

  return actionManager;
}

- (void)setActionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_actionDelegate, obj);
    v6 = [(CuratedCollectionActionCellModel *)self actionManager];
    [v6 setDelegate:obj];
  }
}

- (void)_updateActionManagerState
{
  v3 = +[CuratedCollectionSyncManager sharedManager];
  objc_super v4 = [(CuratedCollectionActionCellModel *)self collection];
  -[CuratedCollectionActionManager setCollectionIsSaved:](self->_actionManager, "setCollectionIsSaved:", [v3 collectionIsSaved:v4]);

  id v6 = [(CuratedCollectionActionCellModel *)self collection];
  id v5 = [v6 publisherCollectionURL];
  [(CuratedCollectionActionManager *)self->_actionManager setHasHomePage:v5 != 0];
}

- (void)setActionManager:(id)a3
{
}

- (CuratedCollectionActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (CuratedCollectionActionDelegate *)WeakRetained;
}

- (GEOPlaceCollection)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);

  objc_storeStrong((id *)&self->_actionManager, 0);
}

@end