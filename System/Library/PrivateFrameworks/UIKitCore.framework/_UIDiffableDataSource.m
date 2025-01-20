@interface _UIDiffableDataSource
- (NSArray)itemIdentifiers;
- (NSArray)sectionIdentifiers;
- (_UIDiffableDataSource)init;
- (_UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4;
- (_UIDiffableDataSource)initWithCollectionView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5;
- (_UIDiffableDataSource)initWithDiffableDataSource:(id)a3;
- (_UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4;
- (_UIDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5;
- (_UIDiffableDataSource)initWithViewUpdatesSink:(id)a3;
- (id)_impl;
- (id)dsImpl;
- (id)emptySnapshot;
- (id)indexPathForItemIdentifier:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3;
- (id)snapshot;
- (int64_t)defaultRowAnimation;
- (int64_t)indexOfItemIdentifier:(id)a3;
- (int64_t)indexOfSectionIdentifier:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInSection:(id)a3;
- (int64_t)numberOfSections;
- (void)appendItemsWithIdentifiers:(id)a3;
- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4;
- (void)appendSectionWithIdentifier:(id)a3;
- (void)appendSectionsWithIdentifiers:(id)a3;
- (void)applyDifferencesFromSnapshot:(id)a3;
- (void)applyDifferencesFromSnapshot:(id)a3 completion:(id)a4;
- (void)applySnapshot:(id)a3;
- (void)deleteAllItems;
- (void)deleteItemsWithIdentifiers:(id)a3;
- (void)deleteSectionsWithIdentifiers:(id)a3;
- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4;
- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4;
- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)reloadFromSnapshot:(id)a3;
- (void)reloadFromSnapshot:(id)a3 completion:(id)a4;
- (void)reloadItemsWithIdentifiers:(id)a3;
- (void)reloadSectionsWithIdentifiers:(id)a3;
- (void)setDefaultRowAnimation:(int64_t)a3;
@end

@implementation _UIDiffableDataSource

- (_UIDiffableDataSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIDiffableDataSource_OldSPI.m" lineNumber:31 description:@"This class cannot be constructed directly. Please use the concrete subclasses."];

  return 0;
}

- (_UIDiffableDataSource)initWithViewUpdatesSink:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDiffableDataSource;
  v5 = [(_UIDiffableDataSource *)&v9 init];
  if (v5)
  {
    v6 = [[__UIDiffableDataSource alloc] initWithViewUpdatesSink:v4];
    dsImpl = v5->_dsImpl;
    v5->_dsImpl = v6;
  }
  return v5;
}

- (_UIDiffableDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDiffableDataSource;
  v8 = [(_UIDiffableDataSource *)&v12 init];
  if (v8)
  {
    objc_super v9 = [[__UIDiffableDataSource alloc] initWithCollectionView:v6 cellProvider:v7];
    dsImpl = v8->_dsImpl;
    v8->_dsImpl = v9;
  }
  return v8;
}

- (_UIDiffableDataSource)initWithCollectionView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIDiffableDataSource;
  v11 = [(_UIDiffableDataSource *)&v15 init];
  if (v11)
  {
    objc_super v12 = [[__UIDiffableDataSource alloc] initWithCollectionView:v8 reuseIdentifierProvider:v9 cellConfigurationHandler:v10];
    dsImpl = v11->_dsImpl;
    v11->_dsImpl = v12;
  }
  return v11;
}

- (_UIDiffableDataSource)initWithDiffableDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDiffableDataSource;
  id v6 = [(_UIDiffableDataSource *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dsImpl, a3);
  }

  return v7;
}

- (id)dsImpl
{
  return self->_dsImpl;
}

- (id)_impl
{
  return self->_dsImpl;
}

- (_UIDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDiffableDataSource;
  id v8 = [(_UIDiffableDataSource *)&v12 init];
  if (v8)
  {
    objc_super v9 = [[__UIDiffableDataSource alloc] initWithTableView:v6 cellProvider:v7];
    dsImpl = v8->_dsImpl;
    v8->_dsImpl = v9;
  }
  return v8;
}

- (_UIDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIDiffableDataSource;
  v11 = [(_UIDiffableDataSource *)&v15 init];
  if (v11)
  {
    objc_super v12 = [[__UIDiffableDataSource alloc] initWithTableView:v8 reuseIdentifierProvider:v9 cellConfigurationHandler:v10];
    dsImpl = v11->_dsImpl;
    v11->_dsImpl = v12;
  }
  return v11;
}

- (int64_t)defaultRowAnimation
{
  return [(__UIDiffableDataSource *)self->_dsImpl tableViewDefaultRowAnimation];
}

- (void)setDefaultRowAnimation:(int64_t)a3
{
}

- (int64_t)numberOfItems
{
  return [(__UIDiffableDataSource *)self->_dsImpl numberOfItems];
}

- (int64_t)numberOfSections
{
  return [(__UIDiffableDataSource *)self->_dsImpl numberOfSections];
}

- (NSArray)sectionIdentifiers
{
  return [(__UIDiffableDataSource *)self->_dsImpl sectionIdentifiers];
}

- (NSArray)itemIdentifiers
{
  return [(__UIDiffableDataSource *)self->_dsImpl itemIdentifiers];
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  return [(__UIDiffableDataSource *)self->_dsImpl numberOfItemsInSection:a3];
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  return [(__UIDiffableDataSource *)self->_dsImpl itemIdentifiersInSectionWithIdentifier:a3];
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  return [(__UIDiffableDataSource *)self->_dsImpl sectionIdentifierForSectionContainingItemIdentifier:a3];
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  return [(__UIDiffableDataSource *)self->_dsImpl indexOfItemIdentifier:a3];
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return [(__UIDiffableDataSource *)self->_dsImpl indexOfSectionIdentifier:a3];
}

- (void)appendItemsWithIdentifiers:(id)a3
{
}

- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4
{
}

- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4
{
}

- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4
{
}

- (void)deleteItemsWithIdentifiers:(id)a3
{
}

- (void)deleteAllItems
{
}

- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4
{
}

- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4
{
}

- (void)reloadItemsWithIdentifiers:(id)a3
{
}

- (void)appendSectionsWithIdentifiers:(id)a3
{
}

- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4
{
}

- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4
{
}

- (void)deleteSectionsWithIdentifiers:(id)a3
{
}

- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
}

- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
}

- (void)reloadSectionsWithIdentifiers:(id)a3
{
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  return [(__UIDiffableDataSource *)self->_dsImpl itemIdentifierForIndexPath:a3];
}

- (id)indexPathForItemIdentifier:(id)a3
{
  return [(__UIDiffableDataSource *)self->_dsImpl indexPathForItemIdentifier:a3];
}

- (id)snapshot
{
  v2 = [(__UIDiffableDataSource *)self->_dsImpl snapshot];
  v3 = [[_UIDiffableDataSourceSnapshot alloc] initWithDiffableDataSource:v2];

  return v3;
}

- (id)emptySnapshot
{
  v2 = [(__UIDiffableDataSource *)self->_dsImpl emptySnapshot];
  v3 = [[_UIDiffableDataSourceSnapshot alloc] initWithDiffableDataSource:v2];

  return v3;
}

- (void)applyDifferencesFromSnapshot:(id)a3
{
  dsImpl = self->_dsImpl;
  id v4 = [a3 dsImpl];
  [(__UIDiffableDataSource *)dsImpl applyDifferencesFromSnapshot:v4];
}

- (void)applyDifferencesFromSnapshot:(id)a3 completion:(id)a4
{
  dsImpl = self->_dsImpl;
  id v6 = a4;
  id v7 = [a3 dsImpl];
  [(__UIDiffableDataSource *)dsImpl applyDifferencesFromSnapshot:v7 animatingDifferences:1 completion:v6];
}

- (void)reloadFromSnapshot:(id)a3
{
  dsImpl = self->_dsImpl;
  id v4 = [a3 dsImpl];
  [(__UIDiffableDataSource *)dsImpl reloadFromSnapshot:v4];
}

- (void)reloadFromSnapshot:(id)a3 completion:(id)a4
{
  dsImpl = self->_dsImpl;
  id v6 = a4;
  id v7 = [a3 dsImpl];
  [(__UIDiffableDataSource *)dsImpl applyDifferencesFromSnapshot:v7 animatingDifferences:0 completion:v6];
}

- (void)appendSectionWithIdentifier:(id)a3
{
}

- (void)applySnapshot:(id)a3
{
}

- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
}

- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
}

- (void).cxx_destruct
{
}

@end