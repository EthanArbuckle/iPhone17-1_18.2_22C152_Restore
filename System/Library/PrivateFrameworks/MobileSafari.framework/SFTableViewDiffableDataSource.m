@interface SFTableViewDiffableDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (SFTableViewDiffableDataSourceDelegate)delegate;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation SFTableViewDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v7 = [WeakRetained dataSource:self headerTextForSection:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v7 = [WeakRetained dataSource:self footerTextForSection:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v5 = [WeakRetained sectionIndexTitlesForDataSource:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    int64_t v9 = [WeakRetained dataSource:self sectionForSectionIndexTitle:v7 atIndex:a5];
  }
  else {
    int64_t v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    v8 = [(UITableViewDiffableDataSource *)self itemIdentifierForIndexPath:v9];
    [WeakRetained dataSource:self commitEditingStyle:a4 forItemIdentifier:v8];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v7 = [WeakRetained dataSource:self canEditRowAtIndexPath:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (SFTableViewDiffableDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFTableViewDiffableDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end