@interface HomeOutlineRootControllerConfiguration
- (ActionCoordination)actionCoordinator;
- (HomeActionDelegate)homeActionDelegate;
- (HomeOutlineRootControllerConfiguration)initWithCollectionView:(id)a3 actionCoordinator:(id)a4 homeActionDelegate:(id)a5 homeUpdateDelegate:(id)a6;
- (HomeUpdateDelegate)homeUpdateDelegate;
- (UICollectionView)collectionView;
@end

@implementation HomeOutlineRootControllerConfiguration

- (HomeOutlineRootControllerConfiguration)initWithCollectionView:(id)a3 actionCoordinator:(id)a4 homeActionDelegate:(id)a5 homeUpdateDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HomeOutlineRootControllerConfiguration;
  v15 = [(HomeOutlineRootControllerConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_collectionView, a3);
    objc_storeWeak((id *)&v16->_actionCoordinator, v12);
    objc_storeWeak((id *)&v16->_homeActionDelegate, v13);
    objc_storeWeak((id *)&v16->_homeUpdateDelegate, v14);
  }

  return v16;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (ActionCoordination)actionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  return (ActionCoordination *)WeakRetained;
}

- (HomeActionDelegate)homeActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeActionDelegate);

  return (HomeActionDelegate *)WeakRetained;
}

- (HomeUpdateDelegate)homeUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeUpdateDelegate);

  return (HomeUpdateDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeUpdateDelegate);
  objc_destroyWeak((id *)&self->_homeActionDelegate);
  objc_destroyWeak((id *)&self->_actionCoordinator);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end