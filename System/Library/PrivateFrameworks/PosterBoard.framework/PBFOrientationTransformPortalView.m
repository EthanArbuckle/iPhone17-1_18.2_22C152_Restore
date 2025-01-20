@interface PBFOrientationTransformPortalView
- (_UIPortalView)portalView;
- (void)setPortalView:(id)a3;
@end

@implementation PBFOrientationTransformPortalView

- (void)setPortalView:(id)a3
{
  v5 = (_UIPortalView *)a3;
  portalView = self->_portalView;
  v7 = v5;
  if (portalView != v5)
  {
    [(_UIPortalView *)portalView removeFromSuperview];
    objc_storeStrong((id *)&self->_portalView, a3);
    [(BSUIOrientationTransformWrapperView *)self addContentView:v7];
    [(PBFOrientationTransformPortalView *)self invalidateIntrinsicContentSize];
    [(PBFOrientationTransformPortalView *)self setNeedsLayout];
  }
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void).cxx_destruct
{
}

@end