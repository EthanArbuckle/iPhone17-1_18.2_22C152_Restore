@interface _PXPhotosGridContainerUIView
- (_PXPhotosGridContainerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _PXPhotosGridContainerUIView

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (_PXPhotosGridContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_PXPhotosGridContainerDelegate *)WeakRetained;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PXPhotosGridContainerUIView;
  id v4 = a3;
  [(_PXPhotosGridContainerUIView *)&v6 willMoveToWindow:v4];
  v5 = [(_PXPhotosGridContainerUIView *)self delegate];
  [v5 containerView:self willMoveToWindow:v4];
}

@end