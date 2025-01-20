@interface PerformanceDebugController
+ (id)navigationDestinationTitle;
- (PerformanceDebugController)init;
- (id)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)title;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PerformanceDebugController

- (PerformanceDebugController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PerformanceDebugController;
  v2 = [(AuxiliaryDebugViewController *)&v9 init];
  if (v2)
  {
    v3 = +[NSBundle bundleWithIdentifier:@"com.apple.Maps"];
    v4 = [v3 pathForResource:@"testDefinitions" ofType:@"plist"];

    v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithContentsOfFile:v4];
    tests = v2->_tests;
    v2->_tests = v5;

    v7 = v2;
  }

  return v2;
}

+ (id)navigationDestinationTitle
{
  return @"Performance Tests";
}

- (id)title
{
  return @"Performance Tests";
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_tests count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PerformanceCell"];
  if (!v7) {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"PerformanceCell"];
  }
  [v7 setAccessoryView:0];
  v8 = [v7 detailTextLabel];
  [v8 setText:0];

  tests = self->_tests;
  id v10 = [v6 row];

  v11 = [(NSMutableArray *)tests objectAtIndexedSubscript:v10];
  v12 = [v11 objectForKeyedSubscript:@"testName"];
  v13 = [v7 textLabel];
  [v13 setText:v12];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  [(PerformanceDebugController *)self dismissViewControllerAnimated:1 completion:0];
  tests = self->_tests;
  id v8 = [v6 row];

  id v12 = [(NSMutableArray *)tests objectAtIndexedSubscript:v8];
  objc_super v9 = +[UIApplication sharedMapsDelegate];
  id v10 = +[UIApplication sharedApplication];
  v11 = [v12 objectForKeyedSubscript:@"testName"];
  [v9 application:v10 runTest:v11 options:v12];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v4 = +[NSBundle bundleWithIdentifier:@"com.apple.Maps", a4];
  v5 = [v4 pathForResource:@"testDefinitions" ofType:@"plist"];

  return v5;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tests, 0);
}

@end