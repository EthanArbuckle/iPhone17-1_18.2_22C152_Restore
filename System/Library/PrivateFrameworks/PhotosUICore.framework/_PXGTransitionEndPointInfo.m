@interface _PXGTransitionEndPointInfo
- (PXGItemPlacement)originalItemPlacement;
- (PXGItemPlacementContext)placementContext;
- (PXGItemPlacementController)itemPlacementController;
- (PXGViewCoordinator)tungstenViewCoordinator;
- (id)itemReference;
- (void)setItemPlacementController:(id)a3;
- (void)setItemReference:(id)a3;
- (void)setOriginalItemPlacement:(id)a3;
- (void)setPlacementContext:(id)a3;
- (void)setTungstenViewCoordinator:(id)a3;
@end

@implementation _PXGTransitionEndPointInfo

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemReference, 0);
  objc_storeStrong((id *)&self->_originalItemPlacement, 0);
  objc_storeStrong((id *)&self->_placementContext, 0);
  objc_storeStrong((id *)&self->_itemPlacementController, 0);
  objc_storeStrong((id *)&self->_tungstenViewCoordinator, 0);
}

- (void)setItemReference:(id)a3
{
}

- (id)itemReference
{
  return self->_itemReference;
}

- (void)setOriginalItemPlacement:(id)a3
{
}

- (PXGItemPlacement)originalItemPlacement
{
  return self->_originalItemPlacement;
}

- (void)setPlacementContext:(id)a3
{
}

- (PXGItemPlacementContext)placementContext
{
  return self->_placementContext;
}

- (void)setItemPlacementController:(id)a3
{
}

- (PXGItemPlacementController)itemPlacementController
{
  return self->_itemPlacementController;
}

- (void)setTungstenViewCoordinator:(id)a3
{
}

- (PXGViewCoordinator)tungstenViewCoordinator
{
  return self->_tungstenViewCoordinator;
}

@end