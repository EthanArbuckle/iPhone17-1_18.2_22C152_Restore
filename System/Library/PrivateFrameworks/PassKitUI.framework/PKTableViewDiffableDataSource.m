@interface PKTableViewDiffableDataSource
- (id)commitEditingHandler;
- (id)sectionFooterProvider;
- (id)sectionHeaderProvider;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)setCommitEditingHandler:(id)a3;
- (void)setSectionFooterProvider:(id)a3;
- (void)setSectionHeaderProvider:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation PKTableViewDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (self->_sectionHeaderProvider)
  {
    id v6 = a3;
    v7 = [(UITableViewDiffableDataSource *)self snapshot];
    v8 = [v7 sectionIdentifiers];
    v9 = [v8 objectAtIndex:a4];

    v10 = (*((void (**)(void))self->_sectionHeaderProvider + 2))();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (self->_sectionFooterProvider)
  {
    id v6 = a3;
    v7 = [(UITableViewDiffableDataSource *)self snapshot];
    v8 = [v7 sectionIdentifiers];
    v9 = [v8 objectAtIndex:a4];

    v10 = (*((void (**)(void))self->_sectionFooterProvider + 2))();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  commitEditingHandler = (void (**)(id, id, int64_t, id))self->_commitEditingHandler;
  if (commitEditingHandler) {
    commitEditingHandler[2](commitEditingHandler, a3, a4, a5);
  }
}

- (id)sectionFooterProvider
{
  return self->_sectionFooterProvider;
}

- (void)setSectionFooterProvider:(id)a3
{
}

- (id)sectionHeaderProvider
{
  return self->_sectionHeaderProvider;
}

- (void)setSectionHeaderProvider:(id)a3
{
}

- (id)commitEditingHandler
{
  return self->_commitEditingHandler;
}

- (void)setCommitEditingHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commitEditingHandler, 0);
  objc_storeStrong(&self->_sectionHeaderProvider, 0);

  objc_storeStrong(&self->_sectionFooterProvider, 0);
}

@end