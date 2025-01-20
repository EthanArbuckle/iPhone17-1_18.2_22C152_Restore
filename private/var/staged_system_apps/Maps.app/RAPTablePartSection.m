@interface RAPTablePartSection
- (BOOL)canEditRowAtIndex:(int64_t)a3;
- (BOOL)shouldHighlightCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
- (NSString)footerTitle;
- (NSString)headerTitle;
- (RAPPresentingViewController)presentingViewController;
- (RAPTablePart)partController;
- (RAPTablePartSection)init;
- (RAPTablePartsDataSource)dataSource;
- (UITableView)tableView;
- (UIView)footerView;
- (UIView)headerView;
- (double)footerHeight;
- (double)headerHeight;
- (id)cellForRowAtIndex:(int64_t)a3;
- (id)dequeueCellWithNamespacedReuseIdentifier:(id)a3;
- (id)dequeueCellWithNamespacedReuseIdentifier:(id)a3 creationBlock:(id)a4;
- (id)dequeueDefaultSingleLineTableViewCell;
- (id)dequeueSubtitleStyleCell;
- (id)namespacedReuseIdentifierWithSuffix:(id)a3;
- (int64_t)rowsCount;
- (int64_t)sectionIndex;
- (void)_registerReuseIdentifiersIfNeeded;
- (void)_reloadHeaderFooterWithAnimation:(int64_t)a3;
- (void)_setPartController:(id)a3;
- (void)didChange;
- (void)holdChangesAffectingTableViewWithinBlock:(id)a3;
- (void)registerClass:(Class)a3 forNamespacedReuseIdentifier:(id)a4;
- (void)reloadWithRowAnimation:(int64_t)a3;
- (void)setFooterTitle:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderView:(id)a3;
@end

@implementation RAPTablePartSection

- (RAPTablePartSection)init
{
  v3.receiver = self;
  v3.super_class = (Class)RAPTablePartSection;
  return [(RAPTablePartSection *)&v3 init];
}

- (void)_setPartController:(id)a3
{
}

- (RAPTablePartsDataSource)dataSource
{
  v2 = [(RAPTablePartSection *)self partController];
  objc_super v3 = [v2 dataSource];

  return (RAPTablePartsDataSource *)v3;
}

- (RAPPresentingViewController)presentingViewController
{
  v2 = [(RAPTablePartSection *)self partController];
  objc_super v3 = [v2 presentingViewController];

  return (RAPPresentingViewController *)v3;
}

- (void)holdChangesAffectingTableViewWithinBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPTablePartSection *)self partController];
  [v5 holdChangesAffectingTableViewWithinBlock:v4];
}

- (void)_registerReuseIdentifiersIfNeeded
{
  p_tableView = &self->_tableView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  id v4 = objc_loadWeakRetained((id *)&self->_partController);
  id v5 = [v4 tableView];

  if (WeakRetained != v5 && v5 != 0)
  {
    objc_storeWeak((id *)p_tableView, v5);
    [(RAPTablePartSection *)self registerReuseIdentifiersForCells];
  }
}

- (id)namespacedReuseIdentifierWithSuffix:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v5 stringByAppendingFormat:@"__%@", v3];

  return v6;
}

- (id)dequeueCellWithNamespacedReuseIdentifier:(id)a3
{
  return [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:a3 creationBlock:0];
}

- (id)dequeueCellWithNamespacedReuseIdentifier:(id)a3 creationBlock:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  v7 = [(RAPTablePartSection *)self namespacedReuseIdentifierWithSuffix:a3];
  v8 = [(RAPTablePartSection *)self tableView];
  v9 = [v8 dequeueReusableCellWithIdentifier:v7];

  if (v6 && !v9)
  {
    v9 = v6[2](v6, v7);
  }

  return v9;
}

- (id)dequeueDefaultSingleLineTableViewCell
{
  v2 = [(RAPTablePartSection *)self tableView];
  id v3 = +[RAPSingleLineTableViewCell reuseIdentifier];
  id v4 = [v2 dequeueReusableCellWithIdentifier:v3];

  if (!v4) {
    id v4 = objc_alloc_init(RAPSingleLineTableViewCell);
  }

  return v4;
}

- (id)dequeueSubtitleStyleCell
{
  v2 = [(RAPTablePartSection *)self tableView];
  id v3 = +[RAPTwoLinesMenuTableViewCell reuseIdentifier];
  id v4 = [v2 dequeueReusableCellWithIdentifier:v3];

  if (!v4)
  {
    id v5 = [RAPTwoLinesMenuTableViewCell alloc];
    v6 = +[RAPTwoLinesMenuTableViewCell reuseIdentifier];
    id v4 = [(RAPTwoLinesMenuTableViewCell *)v5 initWithStyle:0 reuseIdentifier:v6];
  }

  return v4;
}

- (void)registerClass:(Class)a3 forNamespacedReuseIdentifier:(id)a4
{
  id v6 = a4;
  id v8 = [(RAPTablePartSection *)self tableView];
  v7 = [(RAPTablePartSection *)self namespacedReuseIdentifierWithSuffix:v6];

  [v8 registerClass:a3 forCellReuseIdentifier:v7];
}

- (int64_t)rowsCount
{
  return 0;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)sectionIndex
{
  id v3 = [(RAPTablePartSection *)self dataSource];
  id v4 = [v3 indexOfSection:self];

  return (int64_t)v4;
}

- (double)headerHeight
{
  id v3 = [(RAPTablePartSection *)self headerView];

  if (!v3) {
    return UITableViewAutomaticDimension;
  }
  id v4 = [(RAPTablePartSection *)self headerView];
  [v4 setNeedsLayout];

  id v5 = [(RAPTablePartSection *)self headerView];
  [v5 layoutIfNeeded];

  id v6 = [(RAPTablePartSection *)self headerView];
  [v6 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v8 = v7;

  return v8;
}

- (double)footerHeight
{
  return UITableViewAutomaticDimension;
}

- (void)setHeaderView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_headerView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_headerView, a3);
    [(RAPTablePartSection *)self didChange];
    id v5 = v6;
  }
}

- (void)setFooterView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_footerView != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_footerView, a3);
    [(RAPTablePartSection *)self didChange];
    id v5 = v6;
  }
}

- (void)setHeaderTitle:(id)a3
{
  if (self->_headerTitle != a3)
  {
    id v4 = (NSString *)[a3 copy];
    headerTitle = self->_headerTitle;
    self->_headerTitle = v4;

    [(RAPTablePartSection *)self _reloadHeaderFooterWithAnimation:5];
  }
}

- (void)setFooterTitle:(id)a3
{
  if (self->_footerTitle != a3)
  {
    id v4 = (NSString *)[a3 copy];
    footerTitle = self->_footerTitle;
    self->_footerTitle = v4;

    [(RAPTablePartSection *)self _reloadHeaderFooterWithAnimation:5];
  }
}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  return 0;
}

- (void)didChange
{
}

- (void)reloadWithRowAnimation:(int64_t)a3
{
  uint64_t v5 = qword_10160EE58;
  id v6 = [(RAPTablePartSection *)self tableView];
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    id v9 = [(RAPTablePartSection *)self tableView];
    double v7 = [(RAPTablePartSection *)self dataSource];
    double v8 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v7 indexOfSection:self]);
    [v9 reloadSections:v8 withRowAnimation:a3];
  }
}

- (void)_reloadHeaderFooterWithAnimation:(int64_t)a3
{
  uint64_t v5 = qword_10160EE58;
  id v6 = [(RAPTablePartSection *)self tableView];
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    id v9 = [(RAPTablePartSection *)self tableView];
    double v7 = [(RAPTablePartSection *)self dataSource];
    double v8 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v7 indexOfSection:self]);
    [v9 _reloadSectionHeaderFooters:v8 withRowAnimation:a3];
  }
}

- (BOOL)shouldHighlightCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  return 1;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (RAPTablePart)partController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_partController);

  return (RAPTablePart *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_partController);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_destroyWeak((id *)&self->_tableView);
}

@end