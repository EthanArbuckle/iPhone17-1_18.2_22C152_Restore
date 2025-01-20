@interface SBHIconTableViewDiffableDataSource
- (SBHIconLibraryQueryResult)queryResult;
- (SBHTableViewIconLibrary)iconLibrary;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)applyQueryResult:(id)a3 animatingDifferences:(BOOL)a4;
- (void)applyQueryResult:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5;
- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5;
- (void)setIconLibrary:(id)a3;
@end

@implementation SBHIconTableViewDiffableDataSource

- (SBHIconLibraryQueryResult)queryResult
{
  return self->_queryResult;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if ([(SBHIconLibraryQueryResult *)self->_queryResult sortMethodology] == 1)
  {
    v4 = [(SBHIconLibraryQueryResult *)self->_queryResult totalNumberOfItems];
    if (v4)
    {
      v4 = [(SBHIconLibraryQueryResult *)self->_queryResult sectionIndexTitles];
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return -[SBHIconLibraryQueryResult indexOfSectionForSectionIndexTitleAtIndex:](self->_queryResult, "indexOfSectionForSectionIndexTitleAtIndex:", a5, a4);
}

- (void)applyQueryResult:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v8 = (SBHIconLibraryQueryResult *)a3;
  v9 = (void *)MEMORY[0x1E4F29060];
  id v10 = a5;
  if (([v9 isMainThread] & 1) == 0)
  {
    v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SBHIconTableViewDiffableDataSource applyQueryResult:animatingDifferences:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  queryResult = self->_queryResult;
  self->_queryResult = v8;
  v20 = v8;

  v21 = [(SBHIconLibraryQueryResult *)v20 snapshot];

  [(SBHIconTableViewDiffableDataSource *)self applySnapshot:v21 animatingDifferences:v6 completion:v10];
}

- (void)applyQueryResult:(id)a3 animatingDifferences:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (SBHIconLibraryQueryResult *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SBHIconTableViewDiffableDataSource applyQueryResult:animatingDifferences:completion:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  queryResult = self->_queryResult;
  self->_queryResult = v6;
  uint64_t v16 = v6;

  uint64_t v17 = [(SBHIconLibraryQueryResult *)v16 snapshot];

  [(UITableViewDiffableDataSource *)self applySnapshot:v17 animatingDifferences:v4];
}

- (void)applySnapshot:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[SBHIconTableViewDiffableDataSource applyQueryResult:animatingDifferences:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SBHIconTableViewDiffableDataSource;
  [(UITableViewDiffableDataSource *)&v18 applySnapshot:v8 animatingDifferences:v6 completion:v9];
}

- (SBHTableViewIconLibrary)iconLibrary
{
  return self->_iconLibrary;
}

- (void)setIconLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconLibrary, 0);
  objc_storeStrong((id *)&self->_queryResult, 0);
}

- (void)applyQueryResult:(uint64_t)a3 animatingDifferences:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end