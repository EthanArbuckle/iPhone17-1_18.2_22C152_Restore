@interface UITabBarItemProxy
- (UITabBarItemProxy)initWithItem:(id)a3 inTabBar:(id)a4;
- (id)item;
- (id)view;
- (void)setSelected:(BOOL)a3;
@end

@implementation UITabBarItemProxy

- (UITabBarItemProxy)initWithItem:(id)a3 inTabBar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UITabBarItemProxy;
  v9 = [(UITabBarItemProxy *)&v17 init];
  v10 = v9;
  if (v9)
  {
    p_item = &v9->_item;
    objc_storeStrong((id *)&v9->_item, a3);
    uint64_t v12 = [v7 _createViewForTabBar:v8 asProxyView:1];
    view = v10->_view;
    v10->_view = (UITabBarButton *)v12;

    v14 = [v8 traitCollection];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if (v15 == 6)
    {
      if (*p_item) {
        objc_storeWeak((id *)&(*p_item)->_changeObserver, v8);
      }
    }
  }

  return v10;
}

- (void)setSelected:(BOOL)a3
{
}

- (id)item
{
  return self->_item;
}

- (id)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end