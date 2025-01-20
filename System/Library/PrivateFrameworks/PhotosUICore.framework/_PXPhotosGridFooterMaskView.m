@interface _PXPhotosGridFooterMaskView
- (_PXPhotosGridFooterMaskViewDelegate)delegate;
- (void)didMoveToWindow;
- (void)setDelegate:(id)a3;
@end

@implementation _PXPhotosGridFooterMaskView

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (_PXPhotosGridFooterMaskViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_PXPhotosGridFooterMaskViewDelegate *)WeakRetained;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_PXPhotosGridFooterMaskView;
  [(_PXPhotosGridFooterMaskView *)&v4 didMoveToWindow];
  v3 = [(_PXPhotosGridFooterMaskView *)self delegate];
  [v3 footerMaskViewDidMoveToWindow:self];
}

@end