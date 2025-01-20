@interface PXGOtherItemPlacementController
- (BOOL)isIndirectItemPlacementController;
- (PXGItemPlacementController)originalItemPlacementController;
- (PXGOtherItemPlacementController)init;
- (PXGOtherItemPlacementController)initWithOriginalItemPlacementController:(id)a3 originalItemReference:(id)a4;
- (id)originalItemReference;
- (id)placementInContext:(id)a3 forItemReference:(id)a4;
- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4;
@end

@implementation PXGOtherItemPlacementController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_originalItemReference, 0);
  objc_storeStrong((id *)&self->_originalItemPlacementController, 0);
}

- (id)originalItemReference
{
  return self->_originalItemReference;
}

- (PXGItemPlacementController)originalItemPlacementController
{
  return self->_originalItemPlacementController;
}

- (BOOL)isIndirectItemPlacementController
{
  return 1;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v5 = a3;
  id v8 = [(PXGOtherItemPlacementController *)self originalItemPlacementController];
  v6 = [v5 otherItemsPlacement];

  v7 = [(PXGOtherItemPlacementController *)self originalItemReference];
  [v8 setPlacementOverride:v6 forItemReference:v7];
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  return 0;
}

- (PXGOtherItemPlacementController)initWithOriginalItemPlacementController:(id)a3 originalItemReference:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGOtherItemPlacementController;
  v9 = [(PXGOtherItemPlacementController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalItemPlacementController, a3);
    objc_storeStrong(&v10->_originalItemReference, a4);
  }

  return v10;
}

- (PXGOtherItemPlacementController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGItemPlacementController.m", 30, @"%s is not available as initializer", "-[PXGOtherItemPlacementController init]");

  abort();
}

@end