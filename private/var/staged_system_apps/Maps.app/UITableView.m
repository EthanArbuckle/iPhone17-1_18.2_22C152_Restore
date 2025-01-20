@interface UITableView
- (BOOL)_maps_shouldShowTopHairline;
- (CGSize)_maps_contentSize;
- (id)_maps_footerViewWithTitle:(id)a3 linkText:(id)a4 target:(id)a5 selector:(SEL)a6;
- (id)_maps_groupedHeaderViewWithTitle:(id)a3;
- (id)_maps_groupedHeaderViewWithTitle:(id)a3 buttonTitle:(id)a4 target:(id)a5 selector:(SEL)a6;
- (int64_t)_maps_indexOfFirstNonEmptySection;
- (void)_maps_commitUpdates;
- (void)_maps_initializeRAPAppearance;
- (void)_maps_initializeRAPAppearanceWithStyle:(int64_t)a3;
- (void)_maps_registerGroupedHeaderView;
- (void)_maps_registerSelectableFooterView;
- (void)_maps_reloadCellHeights;
@end

@implementation UITableView

- (int64_t)_maps_indexOfFirstNonEmptySection
{
  v3 = [(UITableView *)self dataSource];
  uint64_t v4 = (uint64_t)[v3 numberOfSectionsInTableView:self];

  NSInteger v5 = [(UITableView *)self numberOfSections];
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 >= 1 && v4 == v5)
  {
    int64_t v6 = 0;
    while (1)
    {
      v7 = [(UITableView *)self dataSource];
      id v8 = [v7 tableView:self numberOfRowsInSection:v6];

      if (v8) {
        break;
      }
      if (v4 == ++v6) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v6;
}

- (BOOL)_maps_shouldShowTopHairline
{
  if ((id)[(UITableView *)self style] == (id)2)
  {
    [(UITableView *)self contentOffset];
    double v4 = v3;
    [(UITableView *)self contentInset];
    return v4 > v5;
  }
  else
  {
    int64_t v7 = [(UITableView *)self _maps_indexOfFirstNonEmptySection];
    NSInteger v8 = [(UITableView *)self numberOfSections];
    BOOL result = 0;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 < v8)
    {
      [(UITableView *)self rectForHeaderInSection:v7];
      if (v12 == 0.0)
      {
        return 1;
      }
      else
      {
        CGFloat v13 = v9;
        CGFloat v14 = v10;
        CGFloat v15 = v11;
        CGFloat v16 = v12;
        [(UITableView *)self contentOffset];
        UIRoundToViewScale();
        double v18 = v17;
        v20.origin.x = v13;
        v20.origin.y = v14;
        v20.size.width = v15;
        v20.size.height = v16;
        CGRectGetMaxY(v20);
        UIRoundToViewScale();
        return v18 >= v19;
      }
    }
  }
  return result;
}

- (void)_maps_registerGroupedHeaderView
{
  [(UITableView *)self registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"_maps_groupedHeaderReuseIdentifier"];
  uint64_t v3 = objc_opt_class();

  [(UITableView *)self registerClass:v3 forHeaderFooterViewReuseIdentifier:@"_maps_groupedHeaderButtonReuseIdentifier"];
}

- (void)_maps_registerSelectableFooterView
{
  uint64_t v3 = objc_opt_class();

  [(UITableView *)self registerClass:v3 forHeaderFooterViewReuseIdentifier:@"_maps_selectableFooterReuseIdentifier"];
}

- (id)_maps_groupedHeaderViewWithTitle:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    double v5 = [(UITableView *)self dequeueReusableHeaderFooterViewWithIdentifier:@"_maps_groupedHeaderReuseIdentifier"];
    int64_t v6 = [v5 titleLabel];
    [v6 setText:v4];

    int64_t v7 = +[UIFont system17];
    NSInteger v8 = [v5 titleLabel];
    [v8 setFont:v7];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)_maps_groupedHeaderViewWithTitle:(id)a3 buttonTitle:(id)a4 target:(id)a5 selector:(SEL)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  CGFloat v13 = [(UITableView *)self dequeueReusableHeaderFooterViewWithIdentifier:@"_maps_groupedHeaderButtonReuseIdentifier"];
  CGFloat v14 = [v13 titleLabel];
  [v14 setText:v12];

  CGFloat v15 = +[UIFont system17];
  CGFloat v16 = [v13 titleLabel];
  [v16 setFont:v15];

  double v17 = [v13 button];
  [v17 setTitle:v11 forState:0];

  double v18 = [v13 button];
  [v18 addTarget:v10 action:a6 forControlEvents:64];

  return v13;
}

- (id)_maps_footerViewWithTitle:(id)a3 linkText:(id)a4 target:(id)a5 selector:(SEL)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(TableViewFooterOptions);
  [(TableViewFooterOptions *)v12 setLabelText:v11];

  [(TableViewFooterOptions *)v12 setLinkText:v10];
  CGFloat v13 = [[TableViewSelectableFooterView alloc] initWithReuseIdentifier:@"_maps_selectableFooterReuseIdentifier" options:v12];
  [(TableViewSelectableFooterView *)v13 setTarget:v9 action:a6];

  return v13;
}

- (void)_maps_initializeRAPAppearance
{
  uint64_t v3 = +[UIDevice currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == (id)5;

  [(UITableView *)self _maps_initializeRAPAppearanceWithStyle:v4];
}

- (void)_maps_initializeRAPAppearanceWithStyle:(int64_t)a3
{
  [(UITableView *)self _maps_registerGroupedHeaderView];
  if (a3 == 2)
  {
    uint64_t v5 = +[UIColor systemBackgroundColor];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    uint64_t v5 = +[UIColor colorNamed:@"RAPGroupedTableViewBackgroundColor"];
  }
  int64_t v6 = (void *)v5;
  [(UITableView *)self setBackgroundColor:v5];

LABEL_6:
  id v7 = +[UIColor colorNamed:@"RAPGroupedTableViewSeparatorColor"];
  [(UITableView *)self setSeparatorColor:v7];
}

- (void)_maps_reloadCellHeights
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003D1F94;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (CGSize)_maps_contentSize
{
  [(UITableView *)self _contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_maps_commitUpdates
{
  [(UITableView *)self beginUpdates];

  [(UITableView *)self endUpdates];
}

@end