@interface PXPhotosPointerController
- (PXPhotosPointerController)initWithContentView:(id)a3 delegate:(id)a4;
- (PXPhotosPointerControllerDelegate)delegate;
- (UIPointerInteraction)pointerInteraction;
- (UIView)contentView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_setupWithContentView:(id)a3;
- (void)invalidate;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXPhotosPointerController

- (PXPhotosPointerController)initWithContentView:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosPointerController;
  v9 = [(PXPhotosPointerController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_contentView, a3);
    [(PXPhotosPointerController *)v10 _setupWithContentView:v7];
    v11 = +[PXCursorInteractionSettings sharedInstance];
    [v11 addDeferredKeyObserver:v10];
  }
  return v10;
}

- (void)_setupWithContentView:(id)a3
{
  id v8 = a3;
  v4 = +[PXCursorInteractionSettings sharedInstance];
  int v5 = [v4 enableCuratedLibraryEffects];

  if (v5)
  {
    v6 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
    [v8 addInteraction:v6];
    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (PXPhotosPointerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosPointerControllerDelegate *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v8 = a3;
  id v6 = +[PXCursorInteractionSettings sharedInstance];

  if (v6 != v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXPhotosPointerController.m", 101, @"Unexpected settings observer instance: %@", v8 object file lineNumber description];
  }
  [(PXPhotosPointerController *)self invalidate];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  objc_msgSend(a4, "rect", a3);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v15 = [(PXPhotosPointerController *)self contentView];
  v14 = [(PXPhotosPointerController *)self delegate];
  objc_msgSend(v14, "pointerController:didExitRegionWithRect:inCoordinateSpace:", self, v15, v7, v9, v11, v13);
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  objc_msgSend(a4, "rect", a3);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v15 = [(PXPhotosPointerController *)self contentView];
  v14 = [(PXPhotosPointerController *)self delegate];
  objc_msgSend(v14, "pointerController:willEnterRegionWithRect:inCoordinateSpace:", self, v15, v7, v9, v11, v13);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  double v7 = [(PXPhotosPointerController *)self delegate];
  double v8 = [(PXPhotosPointerController *)self contentView];
  [v6 location];
  double v10 = v9;
  double v12 = v11;
  double v13 = [v8 coordinateSpace];
  v14 = objc_msgSend(v7, "pointerController:regionOfInterestForCursorAtLocation:inCoordinateSpace:", self, v13, v10, v12);

  if (v14)
  {
    [v6 location];
    double v16 = v15;
    double v18 = v17;
    v19 = [v8 coordinateSpace];
    v20 = objc_msgSend(v7, "pointerController:identifierForRegionAtLocation:inCoordinateSpace:", self, v19, v16, v18);

    v21 = (void *)MEMORY[0x1E4FB1AD8];
    [v14 rectInCoordinateSpace:v8];
    v22 = objc_msgSend(v21, "regionWithRect:identifier:", v20);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)invalidate
{
  id v2 = [(PXPhotosPointerController *)self pointerInteraction];
  [v2 invalidate];
}

@end