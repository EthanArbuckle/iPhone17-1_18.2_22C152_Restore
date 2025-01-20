@interface SBFView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)animatedLayerProperties;
- (id)didMoveToWindowHandler;
- (void)didMoveToWindow;
- (void)setAnimatedLayerProperties:(id)a3;
- (void)setDidMoveToWindowHandler:(id)a3;
- (void)setIntrinsicContentSize:(CGSize)a3;
@end

@implementation SBFView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(SBFView *)self animatedLayerProperties];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFView;
    BOOL v7 = [(SBFView *)&v9 _shouldAnimatePropertyWithKey:v4];
  }

  return v7;
}

- (NSArray)animatedLayerProperties
{
  return self->animatedLayerProperties;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)SBFView;
  [(SBFView *)&v5 didMoveToWindow];
  v3 = [(SBFView *)self didMoveToWindowHandler];
  if (v3)
  {
    id v4 = [(SBFView *)self window];
    ((void (**)(void, SBFView *, void *))v3)[2](v3, self, v4);
  }
}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  if (self->_intrinsicContentSize.width != a3.width || self->_intrinsicContentSize.height != a3.height)
  {
    self->_intrinsicContentSize = a3;
    [(SBFView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setAnimatedLayerProperties:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)didMoveToWindowHandler
{
  return self->_didMoveToWindowHandler;
}

- (void)setDidMoveToWindowHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didMoveToWindowHandler, 0);
  objc_storeStrong((id *)&self->animatedLayerProperties, 0);
}

@end