@interface PLTileContainerView
- (BOOL)canBecomeFirstResponder;
- (PLTileContainerView)initWithFrame:(CGRect)a3;
- (PLTileContainerView)initWithFrame:(CGRect)a3 photoTileController:(id)a4;
- (void)clearBackReference;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PLTileContainerView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)clearBackReference
{
  self->_photoTileController = 0;
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLTileContainerView;
  -[PLTileContainerView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  [(PLPhotoTileViewController *)self->_photoTileController _viewWillMoveToSuperView:a3];
}

- (PLTileContainerView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PLTileContainerView)initWithFrame:(CGRect)a3 photoTileController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PLTileContainerView;
  objc_super v5 = -[PLTileContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    objc_msgSend((id)-[PLTileContainerView layer](v5, "layer"), "setEdgeAntialiasingMask:", 0);
    v6->_photoTileController = (PLPhotoTileViewController *)a4;
  }
  return v6;
}

@end