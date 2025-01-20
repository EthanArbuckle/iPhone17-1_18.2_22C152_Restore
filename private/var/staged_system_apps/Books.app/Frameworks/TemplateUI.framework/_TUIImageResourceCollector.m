@interface _TUIImageResourceCollector
- (BOOL)resourceCollectorShouldIncludeEmbeddedForIdentifier:(id)a3;
- (CGRect)visibleBounds;
- (NSHashTable)imageResources;
- (NSMutableSet)resources;
- (_TUIImageResourceCollector)init;
- (_TUIImageResourceCollector)initWithBounds:(CGRect)a3 viewState:(id)a4;
- (id)resourceCollectorViewStateForIdentifier:(id)a3;
- (void)collectImageResource:(id)a3;
- (void)performWithViewState:(id)a3 block:(id)a4;
- (void)reset;
@end

@implementation _TUIImageResourceCollector

- (_TUIImageResourceCollector)init
{
  return -[_TUIImageResourceCollector initWithBounds:viewState:](self, "initWithBounds:viewState:", 0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (_TUIImageResourceCollector)initWithBounds:(CGRect)a3 viewState:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TUIImageResourceCollector;
  v11 = [(_TUIImageResourceCollector *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewState, a4);
    v12->_visibleBounds.origin.CGFloat x = x;
    v12->_visibleBounds.origin.CGFloat y = y;
    v12->_visibleBounds.size.CGFloat width = width;
    v12->_visibleBounds.size.CGFloat height = height;
    uint64_t v13 = +[NSHashTable hashTableWithOptions:512];
    imageResources = v12->_imageResources;
    v12->_imageResources = (NSHashTable *)v13;
  }
  return v12;
}

- (BOOL)resourceCollectorShouldIncludeEmbeddedForIdentifier:(id)a3
{
  return 1;
}

- (id)resourceCollectorViewStateForIdentifier:(id)a3
{
  return [(TUIViewState *)self->_viewState viewStateForIdentifier:a3];
}

- (void)collectImageResource:(id)a3
{
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

- (NSMutableSet)resources
{
  return self->_resources;
}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageResources, 0);
  objc_storeStrong((id *)&self->_resources, 0);

  objc_storeStrong((id *)&self->_viewState, 0);
}

@end