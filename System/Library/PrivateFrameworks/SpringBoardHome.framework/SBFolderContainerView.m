@interface SBFolderContainerView
- (SBFolderContainerView)childFolderContainerView;
- (SBFolderContainerView)initWithFolderView:(id)a3;
- (SBFolderContainerView)initWithFrame:(CGRect)a3;
- (SBFolderView)folderView;
- (UIView)backgroundView;
- (double)statusBarHeight;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setChildFolderContainerView:(id)a3;
- (void)setStatusBarHeight:(double)a3;
@end

@implementation SBFolderContainerView

- (SBFolderContainerView)initWithFolderView:(id)a3
{
  id v5 = a3;
  [v5 bounds];
  v9.receiver = self;
  v9.super_class = (Class)SBFolderContainerView;
  v6 = -[SBFolderContainerView initWithFrame:](&v9, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_folderView, a3);
    [(SBFolderContainerView *)v7 addSubview:v5];
  }

  return v7;
}

- (void)setChildFolderContainerView:(id)a3
{
  id v5 = (SBFolderContainerView *)a3;
  childFolderContainerView = self->_childFolderContainerView;
  if (childFolderContainerView != v5)
  {
    v7 = v5;
    if (childFolderContainerView) {
      [(SBFolderContainerView *)childFolderContainerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_childFolderContainerView, a3);
    if (v7) {
      [(SBFolderContainerView *)self addSubview:v7];
    }
    [(SBFolderContainerView *)self layoutIfNeeded];
    id v5 = v7;
  }
}

- (void)setBackgroundView:(id)a3
{
}

- (void)layoutSubviews
{
  folderView = self->_folderView;
  if (folderView)
  {
    [(SBFolderContainerView *)self _frameForFolderView:self->_folderView];
    -[SBFolderView setFrame:](folderView, "setFrame:");
  }
  childFolderContainerView = self->_childFolderContainerView;
  if (childFolderContainerView)
  {
    id v5 = [(SBFolderContainerView *)self->_childFolderContainerView folderView];
    [(SBFolderContainerView *)self _frameForFolderView:v5];
    -[SBFolderContainerView setFrame:](childFolderContainerView, "setFrame:");
  }
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(UIView *)backgroundView transform];
    if (CGAffineTransformIsIdentity(&v8))
    {
      v7 = self->_backgroundView;
      [(SBFolderContainerView *)self bounds];
      -[UIView setFrame:](v7, "setFrame:");
    }
  }
}

- (SBFolderView)folderView
{
  return self->_folderView;
}

- (SBFolderContainerView)initWithFrame:(CGRect)a3
{
  return -[SBFolderContainerView initWithFolderView:](self, "initWithFolderView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBFolderContainerView)childFolderContainerView
{
  return self->_childFolderContainerView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setStatusBarHeight:(double)a3
{
  self->_statusBarHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_childFolderContainerView, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
}

@end