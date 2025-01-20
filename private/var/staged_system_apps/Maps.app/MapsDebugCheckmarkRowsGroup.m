@interface MapsDebugCheckmarkRowsGroup
+ (id)rowsGroupContainingRows:(id *)a3 withContent:(id)a4 backingGeoConfigKey:(id)a5 get:(id)a6 set:(id)a7;
+ (id)rowsGroupContainingRows:(id *)a3 withContent:(id)a4 get:(id)a5 set:(id)a6;
- (BOOL)allowsMultipleSelection;
- (BOOL)canDeselectRows;
- (MapsDebugCheckmarkRowsGroup)init;
- (NSArray)rows;
- (NSString)groupIdentifier;
- (id)_initWithHeldRows;
- (id)_relinquishOwnershipOfHeldRows;
- (id)addRowWithTitle:(id)a3 subtitle:(id)a4 value:(id)a5;
- (id)addRowWithTitle:(id)a3 value:(id)a4;
- (id)selectionChanged;
- (id)weakRows;
- (unint64_t)minimumSelectionCount;
- (unint64_t)selectedRowsCount;
- (void)addRow:(id)a3;
- (void)checkmarkRowDidChangeChecked:(id)a3;
- (void)checkmarkRowWillInvalidate:(id)a3;
- (void)dealloc;
- (void)setAllowMultipleSelection:(BOOL)a3;
- (void)setGeoConfigKey:(id)a3;
- (void)setMinimumSelectionCount:(unint64_t)a3;
- (void)setSelectionChanged:(id)a3;
- (void)update;
@end

@implementation MapsDebugCheckmarkRowsGroup

- (id)_relinquishOwnershipOfHeldRows
{
  id v3 = [(NSMutableArray *)self->_heldRows copy];
  heldRows = self->_heldRows;
  self->_heldRows = 0;

  return v3;
}

+ (id)rowsGroupContainingRows:(id *)a3 withContent:(id)a4 get:(id)a5 set:(id)a6
{
  return [a1 rowsGroupContainingRows:a3 withContent:a4 backingGeoConfigKey:GEOConfigKey_Invalid[0] get:GEOConfigKey_Invalid[1] set:a5, a6];
}

+ (id)rowsGroupContainingRows:(id *)a3 withContent:(id)a4 backingGeoConfigKey:(id)a5 get:(id)a6 set:(id)a7
{
  var1 = a5.var1;
  uint64_t v9 = *(void *)&a5.var0;
  v11 = (void (**)(id, id))a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = [[MapsDebugCheckmarkRowsGroup alloc] _initWithHeldRows];
  v11[2](v11, v14);
  [v14 _relinquishOwnershipOfHeldRows];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) setGet:v12, var1];
      }
      id v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  objc_initWeak(&location, v14);
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_1003A3378;
  v25 = &unk_1012E72C0;
  objc_copyWeak(&v27, &location);
  id v19 = v13;
  id v26 = v19;
  [v14 setSelectionChanged:&v22];
  [v14 update];
  if (a3) {
    *a3 = v15;
  }
  [v14 setGeoConfigKey:v9 var1:var1 var1:v22 v23:v24 v25:v25];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v14;
}

- (MapsDebugCheckmarkRowsGroup)init
{
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRowsGroup;
  v2 = [(MapsDebugCheckmarkRowsGroup *)&v4 init];
  if (v2) {
    v2->_weakRows = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
  }
  return v2;
}

- (id)_initWithHeldRows
{
  v2 = [(MapsDebugCheckmarkRowsGroup *)self init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    heldRows = v2->_heldRows;
    v2->_heldRows = v3;
  }
  return v2;
}

- (void)dealloc
{
  weakRows = self->_weakRows;
  if (weakRows)
  {
    CFRelease(weakRows);
    self->_weakRows = 0;
  }
  GEOConfigRemoveDelegateListenerForAllKeys();
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugCheckmarkRowsGroup;
  [(MapsDebugCheckmarkRowsGroup *)&v4 dealloc];
}

- (id)weakRows
{
  return self->_weakRows;
}

- (id)addRowWithTitle:(id)a3 value:(id)a4
{
  return [(MapsDebugCheckmarkRowsGroup *)self addRowWithTitle:a3 subtitle:0 value:a4];
}

- (id)addRowWithTitle:(id)a3 subtitle:(id)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(MapsDebugCheckmarkRow);
  [(MapsDebugTableRow *)v11 setTitle:v10];

  [(MapsDebugTableRow *)v11 setSubtitle:v9];
  [(MapsDebugCheckmarkRow *)v11 setValue:v8];

  [(MapsDebugCheckmarkRowsGroup *)self addRow:v11];

  return v11;
}

- (void)addRow:(id)a3
{
  id v5 = a3;
  [v5 setRowsGroup:self];
  objc_super v4 = [(MapsDebugCheckmarkRowsGroup *)self weakRows];
  [v4 addObject:v5];

  [(NSMutableArray *)self->_heldRows addObject:v5];
}

- (void)checkmarkRowDidChangeChecked:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(MapsDebugCheckmarkRowsGroup *)self selectionChanged];

  if (v4)
  {
    id v5 = [(MapsDebugCheckmarkRowsGroup *)self selectionChanged];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)checkmarkRowWillInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsDebugCheckmarkRowsGroup *)self weakRows];
  [v5 removeObject:v4];
}

- (NSArray)rows
{
  v2 = [(MapsDebugCheckmarkRowsGroup *)self weakRows];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (unint64_t)selectedRowsCount
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(MapsDebugCheckmarkRowsGroup *)self rows];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isChecked];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)canDeselectRows
{
  unint64_t v3 = [(MapsDebugCheckmarkRowsGroup *)self selectedRowsCount];
  return v3 > [(MapsDebugCheckmarkRowsGroup *)self minimumSelectionCount];
}

- (void)update
{
  unint64_t v3 = [(MapsDebugCheckmarkRowsGroup *)self rows];
  [v3 makeObjectsPerformSelector:"updateChecked"];

  id v4 = [(MapsDebugCheckmarkRowsGroup *)self rows];
  [v4 makeObjectsPerformSelector:"updateConfiguration"];
}

- (NSString)groupIdentifier
{
  groupIdentifier = self->_groupIdentifier;
  if (!groupIdentifier)
  {
    id v4 = +[NSString stringWithFormat:@"MapsDebugCheckmarkRowsGroup-%p", self];
    unint64_t v5 = self->_groupIdentifier;
    self->_groupIdentifier = v4;

    groupIdentifier = self->_groupIdentifier;
  }

  return groupIdentifier;
}

- (void)setGeoConfigKey:(id)a3
{
  var1 = a3.var1;
  unsigned int var0 = a3.var0;
  GEOConfigRemoveDelegateListenerForAllKeys();
  if (var0 && var1)
  {
    _GEOConfigAddDelegateListenerForKey();
  }
}

- (id)selectionChanged
{
  return self->_selectionChanged;
}

- (void)setSelectionChanged:(id)a3
{
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowMultipleSelection;
}

- (void)setAllowMultipleSelection:(BOOL)a3
{
  self->_allowMultipleSelection = a3;
}

- (unint64_t)minimumSelectionCount
{
  return self->_minimumSelectionCount;
}

- (void)setMinimumSelectionCount:(unint64_t)a3
{
  self->_minimumSelectionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong(&self->_selectionChanged, 0);

  objc_storeStrong((id *)&self->_heldRows, 0);
}

@end