@interface CNUserActivityRestorerDelegate
- (BOOL)userActivityRestorer:(id)a3 restoreCreateContact:(id)a4 activity:(id)a5;
- (BOOL)userActivityRestorer:(id)a3 restoreEditContact:(id)a4 activity:(id)a5;
- (BOOL)userActivityRestorer:(id)a3 restoreSearch:(id)a4 activity:(id)a5;
- (BOOL)userActivityRestorer:(id)a3 restoreViewContact:(id)a4 activity:(id)a5;
- (BOOL)userActivityRestorer:(id)a3 restoreViewGroupsWithActivity:(id)a4;
- (BOOL)userActivityRestorer:(id)a3 restoreViewListAtContact:(id)a4 displayedContact:(id)a5 searchString:(id)a6 isShowingGroups:(BOOL)a7 activity:(id)a8;
- (CNUserActivityRestorerDelegate)initWithContactsSplitViewController:(id)a3;
- (ContactsSplitViewController)contactsSplitViewController;
- (id)userActivityRestorer:(id)a3 keysToFetchWhenRestoringEditContactContactActivity:(id)a4;
- (id)userActivityRestorer:(id)a3 keysToFetchWhenRestoringViewContactActivity:(id)a4;
- (void)setContactsSplitViewController:(id)a3;
@end

@implementation CNUserActivityRestorerDelegate

- (CNUserActivityRestorerDelegate)initWithContactsSplitViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUserActivityRestorerDelegate;
  v5 = [(CNUserActivityRestorerDelegate *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contactsSplitViewController, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)userActivityRestorer:(id)a3 restoreCreateContact:(id)a4 activity:(id)a5
{
  v5 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
  [v5 createNewContact];

  return 1;
}

- (BOOL)userActivityRestorer:(id)a3 restoreViewContact:(id)a4 activity:(id)a5
{
  if (a4)
  {
    id v7 = a4;
    v8 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    [v8 showCardForContact:v7 fallbackToFirstContact:0];
  }
  return a4 != 0;
}

- (BOOL)userActivityRestorer:(id)a3 restoreEditContact:(id)a4 activity:(id)a5
{
  if (a4)
  {
    id v7 = a4;
    v8 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    [v8 showEditingCardForContact:v7];
  }
  return a4 != 0;
}

- (BOOL)userActivityRestorer:(id)a3 restoreSearch:(id)a4 activity:(id)a5
{
  id v6 = a4;
  char v7 = (*(uint64_t (**)(void, id))(CNIsStringEmpty + 16))(CNIsStringEmpty, v6);
  if ((v7 & 1) == 0)
  {
    v8 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    [v8 searchForString:v6];
  }
  return v7 ^ 1;
}

- (BOOL)userActivityRestorer:(id)a3 restoreViewListAtContact:(id)a4 displayedContact:(id)a5 searchString:(id)a6 isShowingGroups:(BOOL)a7 activity:(id)a8
{
  BOOL v8 = a7;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
  unsigned __int8 v16 = [v15 _isCollapsed];

  if ((v16 & 1) == 0)
  {
    v17 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    v18 = [v17 contactNavigationController];
    [v18 showCardForContact:v13 resetFilter:0 resetSearch:0 fallbackToFirstContact:1 scrollToContact:0 animated:0];

    v19 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    [v19 showContactList];

    v20 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    v21 = [v20 contactNavigationController];
    v22 = [v21 contactListViewController];
    [v22 setCellStateSelected:1 forContact:v13 animated:0];
  }
  if ((*(unsigned int (**)(void, id))(CNIsStringNonempty + 16))(CNIsStringNonempty, v14))
  {
    v23 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    v24 = [v23 contactNavigationController];
    [v24 searchForString:v14];
  }
  if (v12)
  {
    v25 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    v26 = [v25 contactNavigationController];
    [v26 scrollToContact:v12 animated:0];
  }
  if (v8)
  {
    v27 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
    [v27 showGroupsAnimated:0];
  }
  return 1;
}

- (BOOL)userActivityRestorer:(id)a3 restoreViewGroupsWithActivity:(id)a4
{
  id v4 = [(CNUserActivityRestorerDelegate *)self contactsSplitViewController];
  [v4 showGroupsAnimated:0];

  return 1;
}

- (id)userActivityRestorer:(id)a3 keysToFetchWhenRestoringViewContactActivity:(id)a4
{
  id v6 = CNContactIdentifierKey;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (id)userActivityRestorer:(id)a3 keysToFetchWhenRestoringEditContactContactActivity:(id)a4
{
  id v6 = CNContactIdentifierKey;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (ContactsSplitViewController)contactsSplitViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsSplitViewController);

  return (ContactsSplitViewController *)WeakRetained;
}

- (void)setContactsSplitViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end