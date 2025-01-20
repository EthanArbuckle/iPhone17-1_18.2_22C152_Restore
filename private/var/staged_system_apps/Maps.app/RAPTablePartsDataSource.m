@interface RAPTablePartsDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSArray)tableParts;
- (RAPTablePartsDataSource)init;
- (RAPTablePartsDataSource)initWithPresentingViewController:(id)a3;
- (UITableView)tableView;
- (id)indexPathForRow:(int64_t)a3 ofSection:(id)a4;
- (id)sectionAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)indexOfSection:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_clearPartsAndSections;
- (void)_createPartAndSectionArraysIfNeeded;
- (void)_rebuildTableSections;
- (void)_updateTableAppearance;
- (void)dealloc;
- (void)popTablePart:(id)a3 withRowAnimation:(int64_t)a4;
- (void)pushTablePart:(id)a3 withRowAnimation:(int64_t)a4;
- (void)setTableParts:(id)a3;
- (void)setTableParts:(id)a3 withRowAnimation:(int64_t)a4;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation RAPTablePartsDataSource

- (RAPTablePartsDataSource)init
{
  result = (RAPTablePartsDataSource *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (RAPTablePartsDataSource)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPTablePartsDataSource;
  v5 = [(RAPTablePartsDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(RAPTablePartsDataSource *)self _clearPartsAndSections];
  v3 = [(UITableView *)self->_tableView dataSource];

  if (v3 == self) {
    [(UITableView *)self->_tableView setDataSource:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)RAPTablePartsDataSource;
  [(RAPTablePartsDataSource *)&v4 dealloc];
}

- (void)_clearPartsAndSections
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_tableSections;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_setAssociatedObject(*(id *)(*((void *)&v18 + 1) + 8 * i), off_1015E2928, 0, (void *)3);
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v8 = self->_tableParts;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)j);
        [v13 setTableView:0, v14];
        [v13 setPresentingViewController:0];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)_updateTableAppearance
{
  if (sub_1000BBB44(self->_tableView) == 5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = self->_tableParts;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      uint64_t v7 = 2;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v5 == (id)++v8)
        {
          id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v7 = 1;
    }

    id v9 = [(RAPTablePartsDataSource *)self tableView];
    [v9 _maps_initializeRAPAppearanceWithStyle:v7];
  }
  else
  {
    id v10 = [(RAPTablePartsDataSource *)self tableView];
    [v10 _maps_initializeRAPAppearance];
  }
}

- (void)setTableView:(id)a3
{
  id v5 = (UITableView *)a3;
  p_tableView = &self->_tableView;
  tableView = self->_tableView;
  if (tableView != v5)
  {
    uint64_t v8 = [(UITableView *)tableView dataSource];

    if (v8 == self) {
      [(UITableView *)*p_tableView setDataSource:0];
    }
    objc_storeStrong((id *)&self->_tableView, a3);
    [(UITableView *)self->_tableView setDataSource:self];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = self->_tableParts;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) _setTableView:p_tableView v14];
          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    [(RAPTablePartsDataSource *)self _updateTableAppearance];
  }
}

- (void)setTableParts:(id)a3
{
}

- (void)setTableParts:(id)a3 withRowAnimation:(int64_t)a4
{
  id v6 = a3;
  if (([(NSMutableArray *)self->_tableParts isEqual:v6] & 1) == 0)
  {
    if ([(NSMutableArray *)self->_tableParts _maps_isPrefixOfArray:v6])
    {
      id v7 = [(NSMutableArray *)self->_tableParts count];
      uint64_t v8 = [v6 count];
      id v9 = [(NSMutableArray *)self->_tableParts count];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = [v6 subarrayWithRange:v7, v8 - v9];
      id v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v29;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v10);
            }
            [(RAPTablePartsDataSource *)self pushTablePart:*(void *)(*((void *)&v28 + 1) + 8 * i) withRowAnimation:a4];
          }
          id v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v12);
      }
    }
    else
    {
      if (!objc_msgSend(v6, "_maps_isPrefixOfArray:", self->_tableParts))
      {
        [(RAPTablePartsDataSource *)self _clearPartsAndSections];
        v22 = (NSMutableArray *)[v6 mutableCopy];
        tableParts = self->_tableParts;
        self->_tableParts = v22;

        [(RAPTablePartsDataSource *)self _rebuildTableSections];
        [(RAPTablePartsDataSource *)self _updateTableAppearance];
        goto LABEL_21;
      }
      id v15 = [v6 count];
      long long v16 = [(NSMutableArray *)self->_tableParts count];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v17 = -[NSMutableArray subarrayWithRange:](self->_tableParts, "subarrayWithRange:", v15, v16 - (unsigned char *)[v6 count], 0);
      id v10 = [v17 reverseObjectEnumerator];

      id v18 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v10);
            }
            [(RAPTablePartsDataSource *)self popTablePart:*(void *)(*((void *)&v24 + 1) + 8 * (void)j) withRowAnimation:a4];
          }
          id v19 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v19);
      }
    }
  }
LABEL_21:
}

- (void)_rebuildTableSections
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(RAPTablePartsDataSource *)self tableParts];
  id v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v4 = 0;
    location = (id *)&self->_presentingViewController;
    uint64_t v25 = *(void *)v33;
    v23 = self;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v7 = [(RAPTablePartsDataSource *)self tableView];
        [v6 _setTableView:v7];

        id WeakRetained = objc_loadWeakRetained(location);
        [v6 setPresentingViewController:WeakRetained];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v9 = [v6 sections];
        id v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v10)
        {
          id v11 = v10;
          long long v27 = i;
          uint64_t v12 = *(void *)v29;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
              [v3 addObject:v14];
              id v15 = off_1015E2928;
              long long v16 = +[NSNumber numberWithUnsignedInteger:(char *)j + v4];
              objc_setAssociatedObject(v14, v15, v16, (void *)3);
            }
            id v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
            v4 += (uint64_t)j;
          }
          while (v11);
          self = v23;
          i = v27;
        }
      }
      id v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }

  long long v17 = (NSMutableArray *)[v3 mutableCopy];
  tableSections = self->_tableSections;
  self->_tableSections = v17;

  id v19 = [(RAPTablePartsDataSource *)self tableView];
  unsigned __int8 v20 = +[RAPTablePart isHoldingChangesAffectingTableView:v19];

  if ((v20 & 1) == 0)
  {
    long long v21 = [(RAPTablePartsDataSource *)self tableView];
    [v21 reloadData];
  }
}

- (void)_createPartAndSectionArraysIfNeeded
{
  if (!self->_tableParts)
  {
    id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tableParts = self->_tableParts;
    self->_tableParts = v3;
  }
  if (!self->_tableSections)
  {
    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tableSections = self->_tableSections;
    self->_tableSections = v5;
  }
}

- (void)pushTablePart:(id)a3 withRowAnimation:(int64_t)a4
{
  id v5 = a3;
  [(RAPTablePartsDataSource *)self _createPartAndSectionArraysIfNeeded];
  v23 = (char *)[(NSMutableArray *)self->_tableSections count];
  [(NSMutableArray *)self->_tableParts addObject:v5];
  id v6 = [v5 sections];
  [(NSMutableArray *)self->_tableSections addObjectsFromArray:v6];
  id v7 = [(RAPTablePartsDataSource *)self tableView];
  [v5 _setTableView:v7];

  unsigned __int8 v20 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v22 = v5;
  [v5 setPresentingViewController:WeakRetained];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    uint64_t v13 = v23;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v14);
        long long v16 = off_1015E2928;
        long long v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v14 + (void)v13, v20);
        objc_setAssociatedObject(v15, v16, v17, (void *)3);

        long long v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v13 = (char *)v14 + (void)v13;
    }
    while (v11);
  }

  id v18 = [(RAPTablePartsDataSource *)v20 tableView];
  id v19 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v23, [v9 count]);
  [v18 insertSections:v19 withRowAnimation:a4];
}

- (void)popTablePart:(id)a3 withRowAnimation:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSMutableArray *)self->_tableParts lastObject];

  if (v7 == v6)
  {
    uint64_t v8 = [v6 sections];
    tableSections = self->_tableSections;
    id v10 = [v8 firstObject];
    id v11 = [(NSMutableArray *)tableSections indexOfObject:v10];

    uint64_t v12 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v11, [v8 count]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v8;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        long long v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_setAssociatedObject(*(id *)(*((void *)&v19 + 1) + 8 * (void)v17), off_1015E2928, 0, (void *)3);
          long long v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }

    [v6 _setTableView:0 v19];
    [v6 setPresentingViewController:0];
    [(NSMutableArray *)self->_tableParts removeLastObject];
    [(NSMutableArray *)self->_tableSections removeObjectsAtIndexes:v12];
    id v18 = [(RAPTablePartsDataSource *)self tableView];
    [v18 deleteSections:v12 withRowAnimation:a4];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(NSMutableArray *)self->_tableSections count];
}

- (int64_t)indexOfSection:(id)a3
{
  id v3 = objc_getAssociatedObject(a3, off_1015E2928);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)sectionAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_tableSections objectAtIndexedSubscript:a3];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(RAPTablePartsDataSource *)self sectionAtIndex:a4];
  id v5 = [v4 rowsCount];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", [v5 section]);
  id v7 = [v5 row];

  uint64_t v8 = [v6 cellForRowAtIndex:v7];

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(RAPTablePartsDataSource *)self sectionAtIndex:a4];
  id v5 = [v4 footerTitle];

  return v5;
}

- (id)indexPathForRow:(int64_t)a3 ofSection:(id)a4
{
  int64_t v5 = [(RAPTablePartsDataSource *)self indexOfSection:a4];

  return +[NSIndexPath indexPathForRow:a3 inSection:v5];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", [v5 section]);
  id v7 = [v5 row];

  LOBYTE(v5) = [v6 canEditRowAtIndex:v7];
  return (char)v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  -[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", [v7 section]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 commitEdit:a4 forRowAtIndex:[v7 row] tableViewIndexPath:v7];
}

- (NSArray)tableParts
{
  return &self->_tableParts->super;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableSections, 0);
  objc_storeStrong((id *)&self->_tableParts, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end