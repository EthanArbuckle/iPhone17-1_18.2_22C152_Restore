@interface WFDeferredMenuElementGroup
- (BOOL)mayContainSelectedItem;
- (BOOL)onlyDisplayTitleWhenCollapsed;
- (BOOL)shouldCollapse;
- (NSString)title;
- (WFDeferredMenuElementGroup)initWithProvider:(id)a3;
- (id)itemProvider;
- (int64_t)estimatedItemCount;
- (unint64_t)style;
- (void)setEstimatedItemCount:(int64_t)a3;
- (void)setMayContainSelectedItem:(BOOL)a3;
- (void)setOnlyDisplayTitleWhenCollapsed:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFDeferredMenuElementGroup

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->title, 0);
}

- (void)setMayContainSelectedItem:(BOOL)a3
{
  self->_mayContainSelectedItem = a3;
}

- (BOOL)mayContainSelectedItem
{
  return self->_mayContainSelectedItem;
}

- (void)setEstimatedItemCount:(int64_t)a3
{
  self->_estimatedItemCount = a3;
}

- (int64_t)estimatedItemCount
{
  return self->_estimatedItemCount;
}

- (id)itemProvider
{
  return self->_itemProvider;
}

- (void)setOnlyDisplayTitleWhenCollapsed:(BOOL)a3
{
  self->onlyDisplayTitleWhenCollapsed = a3;
}

- (BOOL)onlyDisplayTitleWhenCollapsed
{
  return self->onlyDisplayTitleWhenCollapsed;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (void)setStyle:(unint64_t)a3
{
  self->style = a3;
}

- (unint64_t)style
{
  return self->style;
}

- (BOOL)shouldCollapse
{
  unint64_t v3 = [(WFDeferredMenuElementGroup *)self style];
  if (v3 != 1) {
    LOBYTE(v3) = [(WFDeferredMenuElementGroup *)self style] == 2;
  }
  return v3;
}

- (WFDeferredMenuElementGroup)initWithProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFDeferredMenuElementGroup;
  v5 = [(WFDeferredMenuElementGroup *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(WFDeferredMenuElementGroup *)v5 setStyle:0];
    uint64_t v7 = [v4 copy];
    id itemProvider = v6->_itemProvider;
    v6->_id itemProvider = (id)v7;

    v6->_estimatedItemCount = -1;
    v6->_mayContainSelectedItem = 1;
    v9 = v6;
  }

  return v6;
}

@end