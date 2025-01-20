@interface PXTimelineContentModeTableViewController
- (NSArray)dataSource;
- (PXTimelineContentModeTableViewController)initWithContentMode:(unint64_t)a3 widgetSizeClass:(unint64_t)a4;
- (id)_fetchAssetSourcesForContentMode:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)contentMode;
- (unint64_t)widgetSizeClass;
- (void)setDataSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXTimelineContentModeTableViewController

- (void).cxx_destruct
{
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)dataSource
{
  return self->_dataSource;
}

- (unint64_t)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (id)_fetchAssetSourcesForContentMode:(unint64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  if (a3 == 1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [v4 librarySpecificFetchOptions];
    v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"assetCollectionSubtype == %d || assetCollectionSubtype == %d", 203, 212);
    [v6 setPredicate:v7];

    v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
    if ([v8 count])
    {
      v9 = [[PXTimelineContentModeDataSource alloc] initWithName:@"Smart Album" assetSources:v8];
      [v5 addObject:v9];
    }
    v10 = (void *)MEMORY[0x1E4F38EE8];
    v11 = [v4 librarySpecificFetchOptions];
    v12 = [v10 fetchTopLevelUserCollectionsWithOptions:v11];

    if ([v12 count])
    {
      v13 = [[PXTimelineContentModeDataSource alloc] initWithName:@"My Albums" assetSources:v12];
      [v5 addObject:v13];
    }
    v14 = (void *)MEMORY[0x1E4F38EE8];
    v15 = [v4 librarySpecificFetchOptions];
    v16 = [v14 fetchAssetCollectionsWithType:1 subtype:101 options:v15];

    if ([v16 count])
    {
      v17 = [[PXTimelineContentModeDataSource alloc] initWithName:@"Shared Albums" assetSources:v16];
      [v5 addObject:v17];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PXSettingsTimelineContentModeTableViewCell" forIndexPath:v6];
  v8 = [(PXTimelineContentModeTableViewController *)self dataSource];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = [v9 assetSources];
  uint64_t v11 = [v6 row];

  v12 = [v10 objectAtIndexedSubscript:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [v12 localizedTitle];
    v14 = [v7 textLabel];
    [v14 setText:v13];
  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(PXTimelineContentModeTableViewController *)self dataSource];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  v7 = [v6 name];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PXTimelineContentModeTableViewController *)self dataSource];
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v8 = [v7 assetSources];
  uint64_t v9 = [v5 row];

  id v20 = [v8 objectAtIndexedSubscript:v9];

  v10 = [v20 photoLibrary];
  +[PXTimelineSize widgetSizeForSizeClass:[(PXTimelineContentModeTableViewController *)self widgetSizeClass]];
  double v12 = v11;
  double v14 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [v20 localIdentifier];
    v16 = +[PXWidgetTimeline timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:](PXWidgetTimeline, "timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:", v10, v15, 0, v12, v14);

    if (v16)
    {
      v17 = -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:forWidgetSize:", v10, v12, v14);
      v18 = [[PXSettingsTimelineInspectorViewController alloc] initWithWidgetSizeClass:[(PXTimelineContentModeTableViewController *)self widgetSizeClass] timeline:v16 dataSource:v17];
      v19 = [(PXTimelineContentModeTableViewController *)self navigationController];
      [v19 pushViewController:v18 animated:1];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(PXTimelineContentModeTableViewController *)self dataSource];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  v7 = [v6 assetSources];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(PXTimelineContentModeTableViewController *)self dataSource];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PXTimelineContentModeTableViewController;
  [(PXTimelineContentModeTableViewController *)&v5 viewDidLoad];
  v3 = [(PXTimelineContentModeTableViewController *)self tableView];
  [v3 setAllowsMultipleSelection:0];

  int64_t v4 = [(PXTimelineContentModeTableViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXSettingsTimelineContentModeTableViewCell"];
}

- (PXTimelineContentModeTableViewController)initWithContentMode:(unint64_t)a3 widgetSizeClass:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PXTimelineContentModeTableViewController;
  id v6 = [(PXTimelineContentModeTableViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_contentMode = a3;
    v6->_widgetSizeClass = a4;
    uint64_t v8 = [(PXTimelineContentModeTableViewController *)v6 _fetchAssetSourcesForContentMode:a3];
    dataSource = v7->_dataSource;
    v7->_dataSource = (NSArray *)v8;
  }
  return v7;
}

@end