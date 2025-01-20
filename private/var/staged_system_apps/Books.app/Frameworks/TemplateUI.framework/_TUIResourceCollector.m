@interface _TUIResourceCollector
- (BOOL)resourceCollectorShouldIncludeEmbeddedForIdentifier:(id)a3;
- (CGRect)visibleBounds;
- (NSHashTable)imageResources;
- (NSMutableSet)resources;
- (_TUIResourceCollector)initWithBounds:(CGRect)a3 viewState:(id)a4;
- (id)resourceCollectorViewStateForIdentifier:(id)a3;
- (void)collectResource:(id)a3;
- (void)performWithViewState:(id)a3 block:(id)a4;
- (void)reset;
@end

@implementation _TUIResourceCollector

- (_TUIResourceCollector)initWithBounds:(CGRect)a3 viewState:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TUIResourceCollector;
  v11 = [(_TUIResourceCollector *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewState, a4);
    uint64_t v13 = objc_opt_new();
    resources = v12->_resources;
    v12->_resources = (NSMutableSet *)v13;

    v12->_visibleBounds.origin.CGFloat x = x;
    v12->_visibleBounds.origin.CGFloat y = y;
    v12->_visibleBounds.size.CGFloat width = width;
    v12->_visibleBounds.size.CGFloat height = height;
  }

  return v12;
}

- (BOOL)resourceCollectorShouldIncludeEmbeddedForIdentifier:(id)a3
{
  return 1;
}

- (id)resourceCollectorViewStateForIdentifier:(id)a3
{
  return 0;
}

- (void)collectResource:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_resources, "addObject:");
  }
}

- (void)reset
{
}

- (void)performWithViewState:(id)a3 block:(id)a4
{
  id v7 = a3;
  if (a4)
  {
    viewState = self->_viewState;
    p_viewState = &self->_viewState;
    id v13 = v7;
    id v10 = viewState;
    objc_storeStrong((id *)p_viewState, a3);
    v11 = (void (**)(void))a4;
    v11[2]();

    v12 = *p_viewState;
    *p_viewState = v10;

    id v7 = v13;
  }
}

- (NSMutableSet)resources
{
  return self->_resources;
}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_resources, 0);

  objc_storeStrong((id *)&self->_viewState, 0);
}

@end