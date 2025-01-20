@interface GeoRequestCounterSelectionTableViewController
- (GeoRequestCounterSelectionTableViewController)initWithSelection:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation GeoRequestCounterSelectionTableViewController

- (GeoRequestCounterSelectionTableViewController)initWithSelection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GeoRequestCounterSelectionTableViewController;
  v6 = [(GeoRequestCounterSelectionTableViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_selection, a3);
    v8 = [(GeoRequestCounterSelectionTableViewController *)v7 tableView];
    [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"selection"];
  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(GeoRequestCounterSelection *)self->_selection rowCount];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"selection" forIndexPath:v6];
  v8 = [(GeoRequestCounterSelection *)self->_selection currentSelection];
  unsigned int v9 = [v8 containsIndex:[v6 row]];

  if (v9) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v7 setAccessoryType:v10];
  v11 = -[GeoRequestCounterSelection stringForRow:](self->_selection, "stringForRow:", [v6 row]);
  v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = [v16 cellForRowAtIndexPath:v6];
  unsigned __int8 v8 = [(GeoRequestCounterSelection *)self->_selection supportsMultipleSelection];
  unsigned int v9 = [(GeoRequestCounterSelection *)self->_selection currentSelection];
  uint64_t v10 = v9;
  if (v8)
  {
    id v11 = [v9 mutableCopy];

    if ([v7 accessoryType] == (id)3)
    {
      [v7 setAccessoryType:0];
      [v11 removeIndex:[v6 row]];
    }
    else
    {
      [v7 setAccessoryType:3];
      objc_msgSend(v11, "addIndex:", objc_msgSend(v6, "row"));
    }
    [(GeoRequestCounterSelection *)self->_selection setSelection:v11];
    uint64_t v10 = v11;
  }
  else
  {
    if ([v9 count])
    {
      v12 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [v10 firstIndex], 0);
      v13 = [v16 cellForRowAtIndexPath:v12];

      [v13 setAccessoryType:0];
    }
    selection = self->_selection;
    v15 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v6 row]);
    [(GeoRequestCounterSelection *)selection setSelection:v15];

    [v7 setAccessoryType:3];
  }

  [v16 deselectRowAtIndexPath:v6 animated:1];
}

- (void).cxx_destruct
{
}

@end