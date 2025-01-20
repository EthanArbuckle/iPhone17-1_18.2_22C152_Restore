@interface _EnvironmentsAlertTableViewController
- (BOOL)isCustomEnvironmentSelected;
- (NSString)selectedEnvironmentName;
- (_EnvironmentsAlertTableViewController)initWithStyle:(int64_t)a3 environments:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation _EnvironmentsAlertTableViewController

- (_EnvironmentsAlertTableViewController)initWithStyle:(int64_t)a3 environments:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_EnvironmentsAlertTableViewController;
  v8 = [(_EnvironmentsAlertTableViewController *)&v17 initWithStyle:a3];
  v9 = v8;
  if (v8)
  {
    v10 = [(_EnvironmentsAlertTableViewController *)v8 tableView];
    [v10 setDelegate:v9];

    v11 = [(_EnvironmentsAlertTableViewController *)v9 tableView];
    [v11 setDataSource:v9];

    objc_storeStrong((id *)&v9->_environments, a4);
    v12 = GEOConfigGetString();
    v13 = (NSString *)[v12 copy];
    selectedEnvironmentName = v9->_selectedEnvironmentName;
    v9->_selectedEnvironmentName = v13;

    v15 = v9;
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSArray *)self->_environments count] + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
  id v7 = [v5 row];
  if (v7 == (id)[(NSArray *)self->_environments count])
  {
    v8 = [v6 textLabel];
    [v8 setText:@"Custom Environment"];

    if (self->_customEnvironmentSelected) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 0;
    }
    [v6 setAccessoryType:v9];
  }
  else
  {
    v10 = -[NSArray objectAtIndexedSubscript:](self->_environments, "objectAtIndexedSubscript:", [v5 row]);
    v11 = [v10 name];
    v12 = [v6 textLabel];
    [v12 setText:v11];

    selectedEnvironmentName = self->_selectedEnvironmentName;
    v14 = [v10 name];
    LODWORD(selectedEnvironmentName) = [(NSString *)selectedEnvironmentName isEqualToString:v14];

    if (selectedEnvironmentName) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    [v6 setAccessoryType:v15];
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = [v14 row];
  if (v7 == (id)[(NSArray *)self->_environments count])
  {
    selectedEnvironmentName = self->_selectedEnvironmentName;
    self->_selectedEnvironmentName = 0;

    self->_customEnvironmentSelected = 1;
  }
  else
  {
    uint64_t v9 = -[NSArray objectAtIndexedSubscript:](self->_environments, "objectAtIndexedSubscript:", [v14 row]);
    v10 = [v9 name];
    v11 = (NSString *)[v10 copy];
    v12 = self->_selectedEnvironmentName;
    self->_selectedEnvironmentName = v11;
  }
  v13 = [(_EnvironmentsAlertTableViewController *)self tableView];
  [v13 reloadData];

  [v6 deselectRowAtIndexPath:v14 animated:1];
}

- (NSString)selectedEnvironmentName
{
  return self->_selectedEnvironmentName;
}

- (BOOL)isCustomEnvironmentSelected
{
  return self->_customEnvironmentSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEnvironmentName, 0);

  objc_storeStrong((id *)&self->_environments, 0);
}

@end