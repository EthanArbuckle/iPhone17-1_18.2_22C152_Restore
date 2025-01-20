@interface VSJSItemGroup
- (VSJSItemGroupBridge)bridge;
- (int64_t)selectedItem;
- (void)setBridge:(id)a3;
- (void)setSelectedItem:(int64_t)a3;
@end

@implementation VSJSItemGroup

- (void)setSelectedItem:(int64_t)a3
{
  self->_selectedItem = a3;
  id v4 = [(VSJSItemGroup *)self bridge];
  [v4 setJSSelectedItem:a3];
}

- (int64_t)selectedItem
{
  v2 = [(VSJSItemGroup *)self bridge];
  int64_t v3 = [v2 jsSelectedItem];

  return v3;
}

- (VSJSItemGroupBridge)bridge
{
  return self->_bridge;
}

- (void)setBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end