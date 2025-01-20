@interface PerformanceDebugBookmarksController
+ (id)navigationDestinationTitle;
- (PerformanceDebugBookmarksController)init;
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

@implementation PerformanceDebugBookmarksController

- (PerformanceDebugBookmarksController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PerformanceDebugBookmarksController;
  v2 = [(AuxiliaryDebugViewController *)&v9 init];
  if (v2)
  {
    v3 = +[NSBundle bundleWithIdentifier:@"com.apple.Maps"];
    v4 = [v3 pathForResource:@"Bookmarks" ofType:@"plist"];

    v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithContentsOfFile:v4];
    items = v2->_items;
    v2->_items = v5;

    v7 = v2;
  }

  return v2;
}

+ (id)navigationDestinationTitle
{
  return @"Bookmarks";
}

- (id)title
{
  return @"Bookmarks";
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_items count];
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

  items = self->_items;
  id v10 = [v6 row];

  v11 = [(NSMutableArray *)items objectAtIndexedSubscript:v10];
  v12 = [v11 objectForKeyedSubscript:@"Name"];
  v13 = [v7 textLabel];
  [v13 setText:v12];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  [(PerformanceDebugBookmarksController *)self dismissViewControllerAnimated:1 completion:0];
  v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", [v7 row]);
  objc_super v9 = [v8 objectForKeyedSubscript:@"latitude"];
  if (v9)
  {
    id v10 = [v8 objectForKeyedSubscript:@"latitude"];
    [v10 doubleValue];
  }
  v11 = [v8 objectForKeyedSubscript:@"longitude"];
  if (v11)
  {
    v12 = [v8 objectForKeyedSubscript:@"longitude"];
    [v12 doubleValue];
  }
  v13 = [v8 objectForKeyedSubscript:@"yaw"];
  if (v13)
  {
    v14 = [v8 objectForKeyedSubscript:@"yaw"];
    [v14 doubleValue];
    double v16 = v15;
  }
  else
  {
    double v16 = 12.0;
  }

  v17 = [v8 objectForKeyedSubscript:@"pitch"];
  if (v17)
  {
    v18 = [v8 objectForKeyedSubscript:@"pitch"];
    [v18 doubleValue];
    double v20 = v19;
  }
  else
  {
    double v20 = 35.0;
  }

  v21 = [v8 objectForKeyedSubscript:@"regionSize"];
  if (v21)
  {
    v22 = [v8 objectForKeyedSubscript:@"regionSize"];
    [v22 doubleValue];
    long double v24 = v23;
  }
  else
  {
    long double v24 = 0.000244;
  }

  log2(v24);
  id v25 = objc_initWeak(&location, self);
  v26 = [(PerformanceDebugBookmarksController *)self delegate];
  id v27 = objc_loadWeakRetained(&location);
  v28 = [v26 allVisibleMapViewsForDebugController:v27];
  v29 = [v28 firstObject];

  [v29 frame];
  MKCoordinateRegionMakeWithZoomLevel();
  MKMapRectForCoordinateRegion();
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  [v29 frame];
  v40 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v31, v33, v35, v37, v38, v39);
  [v40 setPitch:v20];
  [v40 setHeading:v16];
  [v29 setCamera:v40];

  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v4 = +[NSBundle bundleWithIdentifier:@"com.apple.Maps", a4];
  v5 = [v4 pathForResource:@"Bookmarks" ofType:@"plist"];

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

  objc_storeStrong((id *)&self->_items, 0);
}

@end