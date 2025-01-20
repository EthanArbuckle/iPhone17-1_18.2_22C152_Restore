@interface TUIViewFactory
- (TUIReusableSubviewPool)subviewPool;
- (TUIViewFactory)initWithRegistry:(id)a3;
- (TUIViewRegistry)registry;
- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5;
- (void)clearPool;
- (void)viewFactoryPrepareToReuseHost:(id)a3;
- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4;
@end

@implementation TUIViewFactory

- (TUIViewFactory)initWithRegistry:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIViewFactory;
  v6 = [(TUIViewFactory *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_registry, a3);
    v8 = [[TUIReusableSubviewPool alloc] initWithRegistry:v5];
    subviewPool = v7->_subviewPool;
    v7->_subviewPool = v8;
  }
  return v7;
}

- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5
{
  v6 = [(TUIReusableSubviewPool *)self->_subviewPool dequeueReusableSubviewWithReuseIdentifier:a3 host:a5];
  if (objc_opt_respondsToSelector()) {
    [v6 setFactory:self];
  }
  [v6 setHidden:0];

  return v6;
}

- (void)viewFactoryPrepareToReuseHost:(id)a3
{
}

- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4
{
}

- (void)clearPool
{
}

- (TUIViewRegistry)registry
{
  return self->_registry;
}

- (TUIReusableSubviewPool)subviewPool
{
  return self->_subviewPool;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewPool, 0);

  objc_storeStrong((id *)&self->_registry, 0);
}

@end