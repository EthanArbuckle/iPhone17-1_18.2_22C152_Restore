@interface UITableViewDiffableDataSource
- (BOOL)_isDiffableDataSource;
- (BOOL)_subclassOverridesMethodWithSelector:(SEL)a3;
- (NSDiffableDataSourceSnapshot)snapshot;
- (NSIndexPath)indexPathForItemIdentifier:(id)identifier;
- (NSInteger)indexForSectionIdentifier:(id)identifier;
- (NSString)description;
- (UITableViewDiffableDataSource)initWithTableView:(UITableView *)tableView cellProvider:(UITableViewDiffableDataSourceCellProvider)cellProvider;
- (UITableViewDiffableDataSource)initWithViewUpdatesSink:(id)a3;
- (UITableViewRowAnimation)defaultRowAnimation;
- (__UIDiffableDataSource)impl;
- (id)_diffableDataSourceImpl;
- (id)itemIdentifierForIndexPath:(NSIndexPath *)indexPath;
- (id)sectionIdentifierForIndex:(NSInteger)index;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences;
- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion;
- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot;
- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot completion:(void *)completion;
- (void)setDefaultRowAnimation:(UITableViewRowAnimation)defaultRowAnimation;
- (void)setImpl:(id)a3;
- (void)validateIdentifiers;
@end

@implementation UITableViewDiffableDataSource

- (UITableViewDiffableDataSource)initWithTableView:(UITableView *)tableView cellProvider:(UITableViewDiffableDataSourceCellProvider)cellProvider
{
  v6 = tableView;
  UITableViewDiffableDataSourceCellProvider v7 = cellProvider;
  v12.receiver = self;
  v12.super_class = (Class)UITableViewDiffableDataSource;
  v8 = [(UITableViewDiffableDataSource *)&v12 init];
  if (v8)
  {
    v9 = [[__UIDiffableDataSource alloc] initWithTableView:v6 cellProvider:v7];
    impl = v8->_impl;
    v8->_impl = v9;

    [(UITableView *)v6 setDataSource:v8];
  }

  return v8;
}

- (NSString)description
{
  return [(__UIDiffableDataSource *)self->_impl description];
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  id v3 = objc_alloc((Class)off_1E52D2BB8);
  v4 = [(__UIDiffableDataSource *)self->_impl snapshot];
  v5 = (void *)[v3 initWithImpl:v4];

  return (NSDiffableDataSourceSnapshot *)v5;
}

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences
{
}

- (void)applySnapshot:(NSDiffableDataSourceSnapshot *)snapshot animatingDifferences:(BOOL)animatingDifferences completion:(void *)completion
{
  BOOL v5 = animatingDifferences;
  impl = self->_impl;
  v8 = completion;
  id v9 = [(NSDiffableDataSourceSnapshot *)snapshot impl];
  [(__UIDiffableDataSource *)impl applyDifferencesFromSnapshot:v9 animatingDifferences:v5 completion:v8];
}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot
{
}

- (void)applySnapshotUsingReloadData:(NSDiffableDataSourceSnapshot *)snapshot completion:(void *)completion
{
  impl = self->_impl;
  v6 = completion;
  id v7 = [(NSDiffableDataSourceSnapshot *)snapshot impl];
  [(__UIDiffableDataSource *)impl reloadFromSnapshot:v7 completion:v6];
}

- (UITableViewRowAnimation)defaultRowAnimation
{
  return [(__UIDiffableDataSource *)self->_impl tableViewDefaultRowAnimation];
}

- (void)setDefaultRowAnimation:(UITableViewRowAnimation)defaultRowAnimation
{
}

- (id)sectionIdentifierForIndex:(NSInteger)index
{
  return [(__UIDiffableDataSource *)self->_impl sectionIdentifierForIndex:index];
}

- (NSInteger)indexForSectionIdentifier:(id)identifier
{
  return [(__UIDiffableDataSource *)self->_impl indexForSectionIdentifier:identifier];
}

- (id)itemIdentifierForIndexPath:(NSIndexPath *)indexPath
{
  return [(__UIDiffableDataSource *)self->_impl itemIdentifierForIndexPath:indexPath];
}

- (NSIndexPath)indexPathForItemIdentifier:(id)identifier
{
  return (NSIndexPath *)[(__UIDiffableDataSource *)self->_impl indexPathForItemIdentifier:identifier];
}

- (UITableViewDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITableViewDiffableDataSource;
  BOOL v5 = [(UITableViewDiffableDataSource *)&v9 init];
  if (v5)
  {
    v6 = [[__UIDiffableDataSource alloc] initWithViewUpdatesSink:v4];
    impl = v5->_impl;
    v5->_impl = v6;
  }
  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(__UIDiffableDataSource *)self->_impl numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(__UIDiffableDataSource *)self->_impl numberOfSections] <= a4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UIDiffableDataSource.m", 392, @"Invalid parameter not satisfying: %@", @"section < _impl.numberOfSections" object file lineNumber description];
  }
  impl = self->_impl;
  v8 = [(__UIDiffableDataSource *)impl state];
  objc_super v9 = [v8 sections];
  v10 = [v9 objectAtIndexedSubscript:a4];
  int64_t v11 = [(__UIDiffableDataSource *)impl numberOfItemsInSection:v10];

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIDiffableDataSource.m", 397, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  objc_super v9 = [(__UIDiffableDataSource *)self->_impl _cellForRowAtIndexPath:v8 tableView:v7];

  return v9;
}

- (BOOL)_isDiffableDataSource
{
  return 1;
}

- (id)_diffableDataSourceImpl
{
  return self->_impl;
}

- (BOOL)_subclassOverridesMethodWithSelector:(SEL)a3
{
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = (objc_class *)objc_opt_class();
  IMP MethodImplementation = class_getMethodImplementation(v4, a3);
  IMP v7 = class_getMethodImplementation(v5, a3);
  if (MethodImplementation) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  return !v8 && MethodImplementation != v7;
}

- (__UIDiffableDataSource)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)validateIdentifiers
{
  id v2 = [(__UIDiffableDataSource *)self->_impl state];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    [v2 sections];
    objc_claimAutoreleasedReturnValue();
    _UIDiffableDataSourceValidateIdentifiers();
  }
  [v2 validateIdentifiers];
}

@end