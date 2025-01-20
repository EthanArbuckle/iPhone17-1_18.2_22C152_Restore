@interface TabViewPopoverSourceInfo
- (CGRect)popoverSourceRect;
- (NSString)description;
- (TabViewPopoverSourceInfo)initWithBrowserController:(id)a3 barItem:(int64_t)a4;
- (UIView)popoverSourceView;
- (int64_t)_tabOverviewBarButton;
- (void)_tabOverviewBarButton;
- (void)popoverSourceView;
@end

@implementation TabViewPopoverSourceInfo

- (TabViewPopoverSourceInfo)initWithBrowserController:(id)a3 barItem:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TabViewPopoverSourceInfo;
  v8 = [(TabViewPopoverSourceInfo *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_barItem = a4;
    objc_storeStrong((id *)&v8->_browserController, a3);
    v10 = v9;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = _SFStringForBarItem();
  id v7 = [v3 stringWithFormat:@"<%@: %p barItem = %@>", v5, self, v6];;

  return (NSString *)v7;
}

- (int64_t)_tabOverviewBarButton
{
  int64_t barItem = self->_barItem;
  if (barItem == 7) {
    return 1;
  }
  if (barItem != 8)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(TabViewPopoverSourceInfo *)(uint64_t)self _tabOverviewBarButton];
    }
  }
  return 2;
}

- (CGRect)popoverSourceRect
{
  v3 = [(BrowserController *)self->_browserController tabCollectionViewProvider];
  v4 = [v3 tabThumbnailCollectionView];
  v5 = [v4 toolbar];
  objc_msgSend(v5, "rectForBarButton:", -[TabViewPopoverSourceInfo _tabOverviewBarButton](self, "_tabOverviewBarButton"));
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIView)popoverSourceView
{
  v3 = [(BrowserController *)self->_browserController tabCollectionViewProvider];
  v4 = [v3 tabThumbnailCollectionView];
  v5 = [v4 toolbar];

  if (!v5)
  {
    double v6 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(TabViewPopoverSourceInfo *)(uint64_t)self popoverSourceView];
    }
  }
  return (UIView *)v5;
}

- (void).cxx_destruct
{
}

- (void)_tabOverviewBarButton
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E102C000, a2, OS_LOG_TYPE_FAULT, "%{public}@: unhandled bar item", (uint8_t *)&v2, 0xCu);
}

- (void)popoverSourceView
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E102C000, a2, OS_LOG_TYPE_FAULT, "%{public}@: tab overview toolbar is nil", (uint8_t *)&v2, 0xCu);
}

@end