@interface MapsDebugNavigationTableRow
- (Class)viewControllerClass;
- (MapsDebugNavigationTableRow)init;
- (id)cellContentConfiguration;
- (id)makeViewControllerToPresent;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)present;
- (void)setViewControllerClass:(Class)a3;
@end

@implementation MapsDebugNavigationTableRow

- (MapsDebugNavigationTableRow)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsDebugNavigationTableRow;
  v2 = [(MapsDebugTableRow *)&v7 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1007A7620;
    v4[3] = &unk_1012E6708;
    objc_copyWeak(&v5, &location);
    [(MapsDebugTableRow *)v2 setSelectionAction:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setViewControllerClass:(Class)a3
{
  if (self->_viewControllerClass != a3)
  {
    self->_viewControllerClass = a3;
    id v4 = [(objc_class *)a3 navigationDestinationTitle];
    [(MapsDebugTableRow *)self setTitle:v4];
  }
}

- (void)present
{
  id v5 = [(MapsDebugNavigationTableRow *)self makeViewControllerToPresent];
  if (v5)
  {
    v3 = [(MapsDebugTableRow *)self section];
    id v4 = [v3 displayingViewController];

    [v4 segueToViewController:v5];
  }
}

- (id)makeViewControllerToPresent
{
  v3 = [(MapsDebugTableRow *)self prepareContentBlock];

  if (v3)
  {
    id v4 = objc_alloc_init(MapsDebugValuesViewController);
    id v5 = [(MapsDebugTableRow *)self prepareContentBlock];
    [(MapsDebugValuesViewController *)v4 setPrepareContentBlock:v5];
  }
  else if ([(MapsDebugNavigationTableRow *)self viewControllerClass])
  {
    id v4 = (MapsDebugValuesViewController *)objc_alloc_init([(MapsDebugNavigationTableRow *)self viewControllerClass]);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (id)cellContentConfiguration
{
  v2 = [(MapsDebugTableRow *)self subtitle];
  if ([v2 length]) {
    +[UIListContentConfiguration valueCellConfiguration];
  }
  else {
  v3 = +[UIListContentConfiguration cellConfiguration];
  }

  return v3;
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsDebugNavigationTableRow;
  [(MapsDebugTableRow *)&v9 configureCell:v4];
  [v4 setAccessoryType:1];
  id v5 = [v4 contentConfiguration];
  v6 = [(MapsDebugTableRow *)self selectionAction];
  if (v6) {
    +[UIColor labelColor];
  }
  else {
  objc_super v7 = +[UIColor secondaryLabelColor];
  }
  v8 = [v5 textProperties];
  [v8 setColor:v7];

  [v4 setContentConfiguration:v5];
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MapsDebugNavigationTableRow;
  [(MapsDebugTableRow *)&v13 configureCollectionViewCell:v4];
  id v5 = v4;
  v6 = [v5 contentConfiguration];
  objc_super v7 = [(MapsDebugTableRow *)self selectionAction];
  if (v7) {
    +[UIColor labelColor];
  }
  else {
  v8 = +[UIColor secondaryLabelColor];
  }

  if (v6)
  {
    objc_super v9 = [v6 textProperties];
    [v9 setColor:v8];

    [v6 setPrefersSideBySideTextAndSecondaryText:1];
  }
  else
  {
    v10 = [v5 textLabel];
    [v10 setTextColor:v8];
  }
  [v5 setContentConfiguration:v6];
  id v11 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
  id v14 = v11;
  v12 = +[NSArray arrayWithObjects:&v14 count:1];
  [v5 setAccessories:v12];
}

@end