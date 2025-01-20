@interface MFMailboxFilterPickerViewModel
- (BOOL)canDeselectRowAtIndexPath:(id)a3;
- (MFMailboxFilterPickerViewModel)initWithFilterViewModel:(id)a3 delegate:(id)a4;
- (MFMailboxFilterPickerViewModel)initWithProvider:(id)a3 selectedFilters:(id)a4 delegate:(id)a5;
- (MFMailboxFilterPickerViewModelDelegate)delegate;
- (MUIMailboxFilterProvider)provider;
- (NSArray)filters;
- (NSMutableSet)selectedIndexPaths;
- (id)filterAtIndexPath:(id)a3;
- (id)filtersForGroupAtIndex:(int64_t)a3;
- (id)groupAtIndex:(int64_t)a3;
- (id)indexPathForFilter:(id)a3;
- (id)indexPathsForFilters:(id)a3;
- (id)selected;
- (id)selectedFilters;
- (id)titleForSection:(int64_t)a3;
- (int64_t)indexOfGroup:(id)a3;
- (int64_t)numberOfFilterSection;
- (int64_t)numberOfFiltersForSection:(int64_t)a3;
- (int64_t)selectionTypeAtIndex:(id)a3;
- (void)_notifyDelegateOfChangeAtIndexPath:(id)a3;
- (void)deselectFilterAtIndexPath:(id)a3;
- (void)selectFilterAtIndexPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSelectedIndexPaths:(id)a3;
@end

@implementation MFMailboxFilterPickerViewModel

- (MFMailboxFilterPickerViewModel)initWithProvider:(id)a3 selectedFilters:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MFMailboxFilterPickerViewModel;
  v12 = [(MFMailboxFilterPickerViewModel *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_provider, a3);
    v14 = [(MFMailboxFilterPickerViewModel *)v13 indexPathsForFilters:v10];
    v15 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v14];

    selectedIndexPaths = v13->_selectedIndexPaths;
    v13->_selectedIndexPaths = v15;

    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (MFMailboxFilterPickerViewModel)initWithFilterViewModel:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 provider];
  id v9 = [v6 selectedFilters];
  id v10 = [(MFMailboxFilterPickerViewModel *)self initWithProvider:v8 selectedFilters:v9 delegate:v7];

  return v10;
}

- (NSArray)filters
{
  v2 = [(MFMailboxFilterPickerViewModel *)self provider];
  v3 = [v2 allFilters];

  return (NSArray *)v3;
}

- (int64_t)numberOfFilterSection
{
  v2 = [(MFMailboxFilterPickerViewModel *)self provider];
  v3 = [v2 filtersGroups];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)numberOfFiltersForSection:(int64_t)a3
{
  v3 = [(MFMailboxFilterPickerViewModel *)self filtersForGroupAtIndex:a3];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)filtersForGroupAtIndex:(int64_t)a3
{
  v3 = [(MFMailboxFilterPickerViewModel *)self groupAtIndex:a3];
  id v4 = [v3 filters];

  return v4;
}

- (id)groupAtIndex:(int64_t)a3
{
  id v4 = [(MFMailboxFilterPickerViewModel *)self provider];
  v5 = [v4 filtersGroups];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (int64_t)indexOfGroup:(id)a3
{
  id v4 = a3;
  v5 = [(MFMailboxFilterPickerViewModel *)self provider];
  id v6 = [v5 filtersGroups];
  id v7 = [v6 indexOfObject:v4];

  return (int64_t)v7;
}

- (id)titleForSection:(int64_t)a3
{
  v3 = [(MFMailboxFilterPickerViewModel *)self groupAtIndex:a3];
  uint64_t v4 = [v3 name];
  v5 = (void *)v4;
  id v6 = &stru_100619928;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  return v7;
}

- (id)filterAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[MFMailboxFilterPickerViewModel filtersForGroupAtIndex:](self, "filtersForGroupAtIndex:", [v4 section]);
  id v6 = [v5 objectAtIndexedSubscript:[v4 row]];

  return v6;
}

- (id)indexPathForFilter:(id)a3
{
  id v5 = a3;
  id v6 = [(MFMailboxFilterPickerViewModel *)self provider];
  id v7 = [v6 groupContainingFilter:v5];

  int64_t v8 = [(MFMailboxFilterPickerViewModel *)self indexOfGroup:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || ([(MFMailboxFilterPickerViewModel *)self filtersForGroupAtIndex:v8],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = (uint64_t)[v11 indexOfObject:v5],
        v11,
        v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MFMailboxFilterPickerViewModel.m" lineNumber:96 description:@"It should always be possible to find the group and the filter index"];

    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v12 = +[NSIndexPath indexPathForRow:v10 inSection:v8];

  return v12;
}

- (id)indexPathsForFilters:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A1FA4;
  v5[3] = &unk_10060B9B0;
  v5[4] = self;
  v3 = [a3 ef_map:v5];

  return v3;
}

- (BOOL)canDeselectRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = -[MFMailboxFilterPickerViewModel groupAtIndex:](self, "groupAtIndex:", [v4 section]);
  if ([v5 selectionCardinality])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(MFMailboxFilterPickerViewModel *)self selectedIndexPaths];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001A20F8;
    v10[3] = &unk_100609A40;
    id v11 = v4;
    id v8 = [v7 ef_countObjectsPassingTest:v10];

    BOOL v6 = (unint64_t)v8 > 1;
  }

  return v6;
}

- (int64_t)selectionTypeAtIndex:(id)a3
{
  id v4 = a3;
  id v5 = -[MFMailboxFilterPickerViewModel groupAtIndex:](self, "groupAtIndex:", [v4 section]);
  int64_t v6 = [v5 combinator] == 0;

  return v6;
}

- (void)selectFilterAtIndexPath:(id)a3
{
  id v10 = a3;
  if (!v10
    || (id v5 = [v10 row],
        [(MFMailboxFilterPickerViewModel *)self filters],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v5 >= v7))
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MFMailboxFilterPickerViewModel.m", 137, @"Invalid parameter not satisfying: %@", @"indexPath && ((NSUInteger)indexPath.row < self.filters.count)" object file lineNumber description];
  }
  id v9 = [(MFMailboxFilterPickerViewModel *)self selectedIndexPaths];
  [v9 addObject:v10];

  [(MFMailboxFilterPickerViewModel *)self _notifyDelegateOfChangeAtIndexPath:v10];
}

- (void)deselectFilterAtIndexPath:(id)a3
{
  id v10 = a3;
  if (!v10
    || (id v5 = [v10 row],
        [(MFMailboxFilterPickerViewModel *)self filters],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v5 >= v7))
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MFMailboxFilterPickerViewModel.m", 143, @"Invalid parameter not satisfying: %@", @"indexPath && ((NSUInteger)indexPath.row < self.filters.count)" object file lineNumber description];
  }
  id v9 = [(MFMailboxFilterPickerViewModel *)self selectedIndexPaths];
  [v9 removeObject:v10];

  [(MFMailboxFilterPickerViewModel *)self _notifyDelegateOfChangeAtIndexPath:v10];
}

- (id)selected
{
  v2 = [(MFMailboxFilterPickerViewModel *)self selectedIndexPaths];
  v3 = [v2 allObjects];

  return v3;
}

- (id)selectedFilters
{
  v3 = NSStringFromSelector("section");
  id v4 = +[NSSortDescriptor sortDescriptorWithKey:v3 ascending:1];

  id v5 = NSStringFromSelector("row");
  int64_t v6 = +[NSSortDescriptor sortDescriptorWithKey:v5 ascending:1];

  id v7 = [(MFMailboxFilterPickerViewModel *)self selected];
  v13[0] = v4;
  v13[1] = v6;
  id v8 = +[NSArray arrayWithObjects:v13 count:2];
  id v9 = [v7 sortedArrayUsingDescriptors:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A2688;
  v12[3] = &unk_10060B9D8;
  v12[4] = self;
  id v10 = [v9 ef_map:v12];

  return v10;
}

- (void)_notifyDelegateOfChangeAtIndexPath:(id)a3
{
  id v5 = [(MFMailboxFilterPickerViewModel *)self filterAtIndexPath:a3];
  if ([v5 hasCriterionOfType:23])
  {
    id v4 = [(MFMailboxFilterPickerViewModel *)self delegate];
    [v4 filterPickerViewModelDidChangeSelectedAccounts:self];
  }
}

- (MFMailboxFilterPickerViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFMailboxFilterPickerViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

- (void)setSelectedIndexPaths:(id)a3
{
}

- (MUIMailboxFilterProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end