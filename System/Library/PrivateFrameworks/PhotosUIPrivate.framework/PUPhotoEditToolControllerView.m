@interface PUPhotoEditToolControllerView
- (PUPhotoEditToolController)toolController;
- (PUPhotoEditToolControllerView)initWithToolController:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setToolController:(id)a3;
@end

@implementation PUPhotoEditToolControllerView

- (void).cxx_destruct
{
}

- (void)setToolController:(id)a3
{
}

- (PUPhotoEditToolController)toolController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolController);
  return (PUPhotoEditToolController *)WeakRetained;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PUPhotoEditToolControllerView *)self toolController];
  v9 = [v8 delegate];
  v10 = [v9 toolControllerHitEventForwardView:v8];

  if (v10
    && (v16.receiver = self,
        v16.super_class = (Class)PUPhotoEditToolControllerView,
        -[PUPhotoEditToolControllerView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y),
        v11 = (PUPhotoEditToolControllerView *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11 == self))
  {
    id v12 = v10;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PUPhotoEditToolControllerView;
    -[PUPhotoEditToolControllerView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (PUPhotoEditToolControllerView)initWithToolController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditToolControllerView;
  v5 = [(PUPhotoEditToolControllerView *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PUPhotoEditToolControllerView *)v5 setToolController:v4];
  }

  return v6;
}

@end