@interface PTUIModifiedChangesViewController
- (BOOL)_canShowWhileLocked;
- (PTUIModifiedChangesViewController)initWithParameterRecords:(id)a3 withTitle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_populateTableDataAndChildren;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PTUIModifiedChangesViewController

- (void)_populateTableDataAndChildren
{
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  tableData = self->_tableData;
  self->_tableData = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  children = self->_children;
  self->_children = v5;

  v7 = [(PTParameterRecords *)self->_parameterRecords recordDictionary];
  id v19 = [v7 allKeys];

  if ([v19 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v19 objectAtIndexedSubscript:v8];
      v10 = [(PTParameterRecords *)self->_parameterRecords recordDictionary];
      v11 = [v10 objectForKey:v9];

      id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v9, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        while (1)
        {
          v13 = [v11 allKeys];
          id v14 = [v13 count];

          if (v14 != (id)1) {
            break;
          }
          v15 = [v11 allKeys];
          v16 = [v15 firstObject];

          [v12 addObject:v16];
          v17 = [v11 objectForKey:v16];

          objc_opt_class();
          v11 = v17;
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_8;
          }
        }
      }
      v17 = v11;
LABEL_8:
      v18 = [v12 componentsJoinedByString:@"."];
      [(NSMutableArray *)self->_tableData addObject:v18];
      [(NSMutableArray *)self->_children addObject:v17];

      ++v8;
    }
    while ((unint64_t)[v19 count] > v8);
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PTUIModifiedChangesViewController;
  [(PTUIModifiedChangesViewController *)&v7 viewDidLoad];
  id v3 = objc_alloc((Class)UITableView);
  v4 = [(PTUIModifiedChangesViewController *)self view];
  [v4 bounds];
  id v5 = objc_msgSend(v3, "initWithFrame:style:", 2);

  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"ParameterRecordStandardCell"];
  [v5 setDelegate:self];
  [v5 setDataSource:self];
  [v5 reloadData];
  v6 = [(PTUIModifiedChangesViewController *)self view];
  [v6 addSubview:v5];
}

- (PTUIModifiedChangesViewController)initWithParameterRecords:(id)a3 withTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PTUIModifiedChangesViewController;
  v9 = [(PTUIModifiedChangesViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterRecords, a3);
    [(PTUIModifiedChangesViewController *)v10 _populateTableDataAndChildren];
    [(PTUIModifiedChangesViewController *)v10 setTitle:v8];
  }

  return v10;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = -[NSMutableArray objectAtIndex:](self->_tableData, "objectAtIndex:", [v6 row]);
  id v8 = -[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", [v6 row]);
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 deselectRowAtIndexPath:v6 animated:1];
      v9 = [[PTParameterRecords alloc] initWithDictionary:v8];
      v10 = [[PTUIModifiedChangesViewController alloc] initWithParameterRecords:v9 withTitle:v7];
      v11 = [(PTUIModifiedChangesViewController *)self navigationController];
      [v11 pushViewController:v10 animated:1];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = (int64_t)[(NSMutableArray *)self->_tableData count];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"ParameterRecordStandardCell"];
  id v8 = [v7 defaultContentConfiguration];
  if ([(NSMutableArray *)self->_tableData count])
  {
    v9 = -[NSMutableArray objectAtIndex:](self->_tableData, "objectAtIndex:", [v6 row]);
    [v8 setText:v9];
    v10 = -[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", [v6 row]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 setAccessoryType:1];
    }
    else
    {
      [v7 setSelectionStyle:0];
      v11 = [v10 changedValue];
      [v11 doubleValue];
      uint64_t v13 = v12;

      id v14 = +[NSString stringWithFormat:@"%.3f", v13];
      [v8 setSecondaryText:v14];
    }
  }
  else
  {
    [v8 setText:@"Hey there! 👋 It looks like you haven't changed any parameters from their default values in this prototyping session.\n\nAny settings changes that you make will eventually be viewable here. Feel free to consult this section later whenever you're curious about how your new settings differ from default settings. 😊"];
  }
  [v7 setContentConfiguration:v8];

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_tableData, 0);

  objc_storeStrong((id *)&self->_parameterRecords, 0);
}

@end