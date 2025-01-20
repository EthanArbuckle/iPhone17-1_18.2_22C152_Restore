@interface UIDebuggingIvarViewController
- (Class)_classForTableSection:(int64_t)a3;
- (NSObject)inspectedObject;
- (UIDebuggingIvarViewController)init;
- (id)_classHierarchyForInspectedObject;
- (id)_ivarForIndexPath:(id)a3;
- (id)_ivarsForInspectedObjectInClass:(Class)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)prepareForDisplayAsTopLevelDebuggingViewController;
- (void)setInspectedObject:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation UIDebuggingIvarViewController

- (UIDebuggingIvarViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingIvarViewController;
  v2 = [(UITableViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(UITableViewController *)v2 tableView];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"kCellReuseIdentifier"];

    v5 = [(UITableViewController *)v3 tableView];
    [v5 setRowHeight:66.0];
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(UITableViewController *)self tableView];
  objc_super v7 = [v6 dequeueReusableCellWithIdentifier:@"kCellReuseIdentifier" forIndexPath:v5];

  v8 = [(UIDebuggingIvarViewController *)self _ivarForIndexPath:v5];

  [v7 setIvar:v8];
  if ([v8 isObject]) {
    [v7 setAccessoryType:1];
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(UIDebuggingIvarViewController *)self _ivarsForInspectedObjectInClass:[(UIDebuggingIvarViewController *)self _classForTableSection:a4]];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(UIDebuggingIvarViewController *)self _classHierarchyForInspectedObject];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5 = [(UIDebuggingIvarViewController *)self _classHierarchyForInspectedObject];
  v6 = [v5 objectAtIndex:a4];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_super v7 = [(UIDebuggingIvarViewController *)self _ivarForIndexPath:v6];
  if ([v7 isObject])
  {
    v8 = objc_alloc_init(UIDebuggingIvarViewController);
    v9 = [v7 value];
    [(UIDebuggingIvarViewController *)v8 setInspectedObject:v9];

    v10 = [(UIViewController *)self navigationController];
    [v10 pushViewController:v8 animated:1];
  }
  else
  {
    [v11 deselectRowAtIndexPath:v6 animated:0];
  }
}

- (id)_ivarForIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[UIDebuggingIvarViewController _ivarsForInspectedObjectInClass:](self, "_ivarsForInspectedObjectInClass:", -[UIDebuggingIvarViewController _classForTableSection:](self, "_classForTableSection:", [v4 section]));
  uint64_t v6 = [v4 row];

  objc_super v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (Class)_classForTableSection:(int64_t)a3
{
  id v4 = [(UIDebuggingIvarViewController *)self _classHierarchyForInspectedObject];
  int64_t v5 = [v4 objectAtIndex:a3];
  uint64_t v6 = NSClassFromString(v5);

  return (Class)v6;
}

- (id)_classHierarchyForInspectedObject
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(UIDebuggingIvarViewController *)self inspectedObject];
  for (uint64_t i = objc_opt_class(); ; uint64_t i = [v6 superclass])
  {
    uint64_t v6 = (void *)i;

    if (!v6) {
      break;
    }
    id v4 = NSStringFromClass((Class)v6);
    [v3 addObject:v4];
  }
  return v3;
}

- (id)_ivarsForInspectedObjectInClass:(Class)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = [MEMORY[0x1E4F1CA48] array];
  unsigned int outCount = 0;
  uint64_t v6 = class_copyIvarList(a3, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Ivar v8 = v6[i];
      v9 = [(UIDebuggingIvarViewController *)self inspectedObject];
      v10 = +[UIDebuggingIvar ivarWithObjcIvar:v8 forObject:v9];

      [v5 addObject:v10];
    }
  }
  free(v6);
  id v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v16[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  v13 = [v5 sortedArrayUsingDescriptors:v12];

  return v13;
}

- (void)prepareForDisplayAsTopLevelDebuggingViewController
{
}

- (void)setInspectedObject:(id)a3
{
  p_inspectedObject = &self->_inspectedObject;
  id v5 = a3;
  objc_storeWeak((id *)p_inspectedObject, v5);
  uint64_t v6 = (objc_class *)objc_opt_class();

  objc_super v7 = NSStringFromClass(v6);
  [(UIViewController *)self setTitle:v7];

  id v8 = [(UITableViewController *)self tableView];
  [v8 reloadData];
}

- (NSObject)inspectedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedObject);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end