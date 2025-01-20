@interface RAPTableViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)usesNavigationControllerPushForSegue;
- (RAPTablePartsDataSource)dataSource;
- (RAPTablePartsDataSource)newDataSource;
- (RAPTableViewController)init;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)infoCardThemeChanged;
- (void)returnFromViewController:(id)a3;
- (void)scrollToBottomAnimated;
- (void)scrollToPartAfterPartAnimated:(id)a3;
- (void)segueToViewController:(id)a3;
- (void)segueToViewController:(id)a3 afterReturningFromViewController:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation RAPTableViewController

- (RAPTableViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)RAPTableViewController;
  return [(RAPTableViewController *)&v3 initWithStyle:1];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)RAPTableViewController;
  [(RAPTableViewController *)&v10 viewDidLoad];
  objc_super v3 = [(RAPTableViewController *)self tableView];
  [v3 setAccessibilityIdentifier:@"RAPTableView"];

  v4 = [(RAPTableViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];

  v5 = [(RAPTableViewController *)self tableView];
  v6 = [(RAPTableViewController *)self dataSource];
  [v6 setTableView:v5];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Back" value:@"localized string not found" table:0];
  v9 = [(RAPTableViewController *)self navigationItem];
  [v9 setBackButtonTitle:v8];
}

- (void)infoCardThemeChanged
{
  v7.receiver = self;
  v7.super_class = (Class)RAPTableViewController;
  [(RAPTableViewController *)&v7 infoCardThemeChanged];
  objc_super v3 = [(RAPTableViewController *)self tableView];
  v4 = [v3 theme];
  v5 = [v4 controlBackgroundColor];
  v6 = [(RAPTableViewController *)self tableView];
  [v6 setBackgroundColor:v5];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)RAPTableViewController;
  [(RAPTableViewController *)&v13 viewDidLayoutSubviews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_super v3 = [(RAPTableViewController *)self dataSource];
  v4 = [v3 tableParts];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) presentingViewControllerViewDidLayoutSubviews];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (RAPTablePartsDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [(RAPTableViewController *)self newDataSource];
    id v5 = self->_dataSource;
    self->_dataSource = v4;

    dataSource = self->_dataSource;
  }

  return dataSource;
}

- (RAPTablePartsDataSource)newDataSource
{
  objc_super v3 = [RAPTablePartsDataSource alloc];

  return [(RAPTablePartsDataSource *)v3 initWithPresentingViewController:self];
}

- (void)segueToViewController:(id)a3
{
  id v5 = a3;
  if ([(RAPTableViewController *)self usesNavigationControllerPushForSegue])
  {
    v4 = [(RAPTableViewController *)self navigationController];
    [v4 pushViewController:v5 animated:1];
  }
}

- (void)segueToViewController:(id)a3 afterReturningFromViewController:(id)a4
{
  id v11 = a3;
  if ([(RAPTableViewController *)self usesNavigationControllerPushForSegue])
  {
    id v5 = [(RAPTableViewController *)self navigationController];
    id v6 = [v5 viewControllers];
    id v7 = [v6 mutableCopy];

    if ([v7 count])
    {
      [v7 insertObject:v11 atIndex:[v7 count] - 1];
      v8 = [(RAPTableViewController *)self navigationController];
      [v8 setViewControllers:v7 animated:0];

      long long v9 = [(RAPTableViewController *)self navigationController];
      id v10 = [v9 popToViewController:v11 animated:1];
    }
    else
    {
      long long v9 = [(RAPTableViewController *)self navigationController];
      [v9 pushViewController:v11 animated:1];
    }
  }
}

- (void)returnFromViewController:(id)a3
{
  id v15 = a3;
  if ([(RAPTableViewController *)self usesNavigationControllerPushForSegue])
  {
    v4 = [(RAPTableViewController *)self navigationController];
    id v5 = [v4 viewControllers];
    id v6 = [v5 indexOfObject:v15];

    if (v6)
    {
      if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v7 = v15;
        if ([v7 conformsToProtocol:&OBJC_PROTOCOL___RAPInstrumentableTarget]) {
          v8 = v7;
        }
        else {
          v8 = 0;
        }
        id v9 = v8;

        if ([v9 analyticTarget])
        {
          id v10 = +[MKMapService sharedService];
          [v10 captureUserAction:10111 onTarget:[v9 analyticTarget] eventValue:0];
        }
        id v11 = [(RAPTableViewController *)self navigationController];
        long long v12 = [v11 viewControllers];
        id v13 = [v12 mutableCopy];

        [v13 trimToLength:v6];
        v14 = [(RAPTableViewController *)self navigationController];
        [v14 setViewControllers:v13 animated:1];
      }
    }
  }
}

- (BOOL)usesNavigationControllerPushForSegue
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(RAPTableViewController *)self dataSource];
  id v7 = [v6 sectionAtIndex:[v5 section]];

  LOBYTE(v6) = [v7 shouldHighlightCellForRowAtIndex:[v5 row] tableIndexPath:v5];
  return (char)v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(RAPTableViewController *)self dataSource];
  [v8 sectionAtIndex:[v6 section]];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 didSelectCellForRowAtIndex:[v6 row] tableIndexPath:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(RAPTableViewController *)self dataSource];
  v8 = [v7 sectionAtIndex:a4];
  id v9 = [v8 headerView];

  if (!v9)
  {
    id v10 = [(RAPTableViewController *)self dataSource];
    id v11 = [v10 sectionAtIndex:a4];
    long long v12 = [v11 headerTitle];
    id v9 = [v6 _maps_groupedHeaderViewWithTitle:v12];
  }

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5 = [(RAPTableViewController *)self dataSource];
  id v6 = [v5 sectionAtIndex:a4];
  id v7 = [v6 footerView];

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(RAPTableViewController *)self dataSource];
  id v6 = [v5 sectionAtIndex:a4];

  [v6 headerHeight];
  double v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = [(RAPTableViewController *)self dataSource];
  id v6 = [v5 sectionAtIndex:a4];

  [v6 footerHeight];
  double v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)scrollToBottomAnimated
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_super v3 = [(RAPTableViewController *)self dataSource];
  v4 = [v3 tableParts];
  id v5 = [v4 reverseObjectEnumerator];

  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        [v10 sections];
        long long v12 = [v11 reverseObjectEnumerator];

        id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v22;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              if ([v17 rowsCount])
              {
                v18 = [(RAPTableViewController *)self dataSource];
                v19 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v18 indexOfSection:v17]);

                v20 = [(RAPTableViewController *)self tableView];
                [v20 scrollToRowAtIndexPath:v19 atScrollPosition:2 animated:1];

                goto LABEL_18;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }
LABEL_18:
}

- (void)scrollToPartAfterPartAnimated:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = [(RAPTableViewController *)self dataSource];
  id v6 = [v5 tableParts];
  id v7 = (char *)[v6 indexOfObject:v4];

  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL
    || ([(RAPTableViewController *)self dataSource],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 tableParts],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = (char *)[v9 count] - 1,
        v9,
        v8,
        v7 == v10))
  {
LABEL_4:
    [(RAPTableViewController *)self scrollToBottomAnimated];
  }
  else
  {
    id v11 = [(RAPTableViewController *)self dataSource];
    long long v12 = [v11 tableParts];
    id v13 = [(RAPTableViewController *)self dataSource];
    id v14 = [v13 tableParts];
    uint64_t v15 = [v12 subarrayWithRange:v7 + 1, (unsigned char *)[v14 count] - (v7 + 1)];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v37;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v22 = [v21 sections];
          id v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v33;
            while (2)
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v33 != v25) {
                  objc_enumerationMutation(v22);
                }
                long long v27 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
                if ([v27 rowsCount])
                {
                  long long v28 = [(RAPTableViewController *)self dataSource];
                  v29 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v28 indexOfSection:v27]);

                  v30 = [(RAPTableViewController *)self tableView];
                  [v30 scrollToRowAtIndexPath:v29 atScrollPosition:2 animated:1];

                  goto LABEL_23;
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

          uint64_t v19 = v31;
        }
        id v18 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v18);
    }
LABEL_23:
  }
}

- (void).cxx_destruct
{
}

@end