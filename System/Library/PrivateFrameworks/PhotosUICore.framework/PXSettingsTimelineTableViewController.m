@interface PXSettingsTimelineTableViewController
- (NSArray)widgetSizes;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setWidgetSizes:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXSettingsTimelineTableViewController

- (void).cxx_destruct
{
}

- (void)setWidgetSizes:(id)a3
{
}

- (NSArray)widgetSizes
{
  return self->_widgetSizes;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PXSettingsTimelineTableViewCell" forIndexPath:v6];
  v8 = [(PXSettingsTimelineTableViewController *)self widgetSizes];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];
  uint64_t v11 = [v10 integerValue];

  v12 = +[PXTimelineSize sizeDescriptionForSizeClass:v11];
  v13 = [v7 textLabel];
  [v13 setText:v12];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PXSettingsTimelineTableViewController *)self widgetSizes];
  uint64_t v7 = [v5 row];

  v8 = [v6 objectAtIndexedSubscript:v7];
  uint64_t v9 = [v8 integerValue];

  objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  +[PXTimelineSize widgetSizeForSizeClass:v9];
  double v11 = v10;
  double v13 = v12;
  v14 = -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:forWidgetSize:", v18, v10, v12);
  v15 = +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v18, v9, v11, v13);
  v16 = [[PXSettingsTimelineInspectorViewController alloc] initWithWidgetSizeClass:v9 timeline:v15 dataSource:v14];
  v17 = [(PXSettingsTimelineTableViewController *)self navigationController];
  [v17 pushViewController:v16 animated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PXSettingsTimelineTableViewController *)self widgetSizes];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PXSettingsTimelineTableViewController;
  [(PXSettingsTimelineTableViewController *)&v8 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(PXSettingsTimelineTableViewController *)self view];
  [v4 setBackgroundColor:v3];

  int64_t v5 = +[PXTimelineSize allSupportedSizes];
  [(PXSettingsTimelineTableViewController *)self setWidgetSizes:v5];

  id v6 = [(PXSettingsTimelineTableViewController *)self tableView];
  [v6 setAllowsMultipleSelection:0];

  uint64_t v7 = [(PXSettingsTimelineTableViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXSettingsTimelineTableViewCell"];
}

@end