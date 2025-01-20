@interface COSDiscoverListViewController
- (BOOL)loadingPlugins;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (COSDiscoverListViewController)init;
- (NSMutableArray)plugins;
- (OS_dispatch_queue)pluginLoaderQueue;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (double)preferredCellWidth;
- (id)_pluginForIndexPath:(id)a3;
- (id)_pluginsToDisplay;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)titleForSectionIndex:(int64_t)a3;
- (int64_t)_numberOfItemsInDiscoverSection:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)reloadContentForTextSizeChange:(id)a3;
- (void)setLoadingPlugins:(BOOL)a3;
- (void)setPluginLoaderQueue:(id)a3;
- (void)setPlugins:(id)a3;
- (void)setPreferredCellWidth:(double)a3;
- (void)viewDidLoad;
@end

@implementation COSDiscoverListViewController

- (COSDiscoverListViewController)init
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Bridge.pluginLoaderQueue", 0);
  pluginLoaderQueue = self->_pluginLoaderQueue;
  self->_pluginLoaderQueue = v3;

  v5 = objc_opt_new();
  [v5 setSectionInset:0.0, 0.0, 20.0, 0.0];
  [v5 sectionInset];
  double v7 = v6;
  [v5 sectionInset];
  double v9 = v7 + v8;
  v10 = +[UIScreen mainScreen];
  [v10 bounds];
  self->_preferredCellWidth = v11 - v9;

  [v5 setEstimatedItemSize:self->_preferredCellWidth, self->_preferredCellWidth];
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"reloadContentForTextSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v15.receiver = self;
  v15.super_class = (Class)COSDiscoverListViewController;
  v13 = [(COSDiscoverListViewController *)&v15 initWithCollectionViewLayout:v5];

  return v13;
}

- (void)reloadContentForTextSizeChange:(id)a3
{
  id v3 = [(COSDiscoverListViewController *)self collectionView];
  [v3 reloadData];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)COSDiscoverListViewController;
  [(COSDiscoverListViewController *)&v20 viewDidLoad];
  id v3 = [(COSDiscoverListViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[COSDiscoverCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  double v6 = [(COSDiscoverListViewController *)self collectionView];
  uint64_t v7 = objc_opt_class();
  double v8 = +[COSDiscoverSectionHeader reuseIdentifier];
  [v6 registerClass:v7 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v8];

  double v9 = BPSGetActiveSetupCompletedDevice();
  if (v9) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  +[BCCAReporter incrementDiscoverSuccessType:v10];

  double v11 = +[UIColor blackColor];
  v12 = [(COSDiscoverListViewController *)self collectionView];
  [v12 setBackgroundColor:v11];

  v13 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  uint64_t v14 = NRDevicePropertyIsPaired;
  uint64_t v15 = [v13 valueForProperty:NRDevicePropertyIsPaired];
  v16 = (void *)v15;
  if (v13 && !v15)
  {
    v17 = pbb_setupflow_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Discover ~ Waiting for NRDevicePropertyIsPaired state to load...", v19, 2u);
    }

    uint64_t v21 = v14;
    v18 = +[NSArray arrayWithObjects:&v21 count:1];
    [v13 addPropertyObserver:self forPropertyChanges:v18];
  }
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v6 = a4;
  unsigned int v7 = [v6 isEqualToString:NRDevicePropertyIsPaired];
  double v8 = pbb_setupflow_log();
  double v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discover ~ Reloaded for property change: %@.", buf, 0xCu);
    }

    pluginLoaderQueue = self->_pluginLoaderQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100048908;
    block[3] = &unk_1002438A0;
    block[4] = self;
    dispatch_async(pluginLoaderQueue, block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100171D8C((uint64_t)v6, v9);
    }
  }
}

- (id)_pluginsToDisplay
{
  plugins = self->_plugins;
  if (!plugins)
  {
    if (self->_loadingPlugins)
    {
      plugins = 0;
    }
    else
    {
      self->_loadingPlugins = 1;
      pluginLoaderQueue = self->_pluginLoaderQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100048B28;
      block[3] = &unk_1002438A0;
      block[4] = self;
      dispatch_async(pluginLoaderQueue, block);
      plugins = self->_plugins;
    }
  }

  return plugins;
}

- (int64_t)_numberOfItemsInDiscoverSection:(int64_t)a3
{
  v5 = [(COSDiscoverListViewController *)self _pluginsToDisplay];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3) {
    return 0;
  }
  unsigned int v7 = [(COSDiscoverListViewController *)self _pluginsToDisplay];
  double v8 = [v7 objectAtIndex:a3];
  id v9 = [v8 count];

  return (int64_t)v9;
}

- (id)titleForSectionIndex:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = +[NSBundle mainBundle];
    uint64_t v4 = v3;
    CFStringRef v5 = @"GET_MORE_FROM_YOUR_WATCH";
    goto LABEL_5;
  }
  if (!a3)
  {
    id v3 = +[NSBundle mainBundle];
    uint64_t v4 = v3;
    CFStringRef v5 = @"GET_STARTED";
LABEL_5:
    id v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"Localizable"];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)_pluginForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [v4 row];

  unsigned int v7 = [(COSDiscoverListViewController *)self _pluginsToDisplay];
  id v8 = [v7 count];

  if (v5 >= v8)
  {
    double v11 = 0;
  }
  else
  {
    id v9 = [(COSDiscoverListViewController *)self _pluginsToDisplay];
    uint64_t v10 = [v9 objectAtIndex:v5];

    if (v6 >= [v10 count])
    {
      double v11 = 0;
    }
    else
    {
      double v11 = [v10 objectAtIndex:v6];
    }
  }

  return v11;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_loadingPlugins) {
    return 0;
  }
  id v4 = [(COSDiscoverListViewController *)self _pluginsToDisplay];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(COSDiscoverListViewController *)self _numberOfItemsInDiscoverSection:a4];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:UICollectionElementKindSectionHeader])
  {
    double v11 = +[COSDiscoverSectionHeader reuseIdentifier];
    v12 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v11 forIndexPath:v10];

    id v13 = -[COSDiscoverListViewController titleForSectionIndex:](self, "titleForSectionIndex:", [v10 section]);
    if (v12) {
      [v12 setSectionTitle:v13];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)COSDiscoverListViewController;
    v12 = [(COSDiscoverListViewController *)&v15 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  }

  return v12;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[COSDiscoverCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [v9 setPreferredWidth:self->_preferredCellWidth];
  id v10 = [(COSDiscoverListViewController *)self _pluginForIndexPath:v6];
  if (v10)
  {
    int64_t v11 = -[COSDiscoverListViewController _numberOfItemsInDiscoverSection:](self, "_numberOfItemsInDiscoverSection:", [v6 section]);
    BOOL v12 = [v6 row] != (id)(v11 - 1);
    id v13 = [v10 badgeImageForDiscoverPlugin];
    uint64_t v14 = [v10 titleForDiscoverPlugin];
    objc_super v15 = [v10 descriptionForDiscoverPlugin];
    [v9 setImage:v13 title:v14 subtitle:v15 wantsCellDivider:v12];
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = [(COSDiscoverListViewController *)self _pluginForIndexPath:a4];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 detailViewControllerToLaunch];
    if (v6)
    {
      [(COSDiscoverListViewController *)self presentViewController:v6 animated:1 completion:0];
      if (objc_opt_respondsToSelector()) {
        +[BCCAReporter incrementDiscoverSuccessType:](BCCAReporter, "incrementDiscoverSuccessType:", [v5 analyticsEventType]);
      }
    }
    else
    {
      id v7 = pbb_discover_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100171E7C(v7);
      }
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 onUserTappedPlugin];
    if (objc_opt_respondsToSelector()) {
      +[BCCAReporter incrementDiscoverSuccessType:](BCCAReporter, "incrementDiscoverSuccessType:", [v5 analyticsEventType]);
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6 = -[COSDiscoverListViewController titleForSectionIndex:](self, "titleForSectionIndex:", a5, a4);
  id v7 = objc_opt_new();
  id v8 = +[COSDiscoverSectionHeader titleLabelFont];
  [v7 setFont:v8];

  [v7 setNumberOfLines:0];
  [v7 setText:v6];
  id v9 = +[UIColor systemGrayColor];
  [v7 setTextColor:v9];

  [v7 setAdjustsFontForContentSizeCategory:1];
  [v7 setLineBreakMode:0];
  [v7 sizeThatFits:self->_preferredCellWidth + -40.0, 1.79769313e308];
  double v11 = v10;
  double v13 = v12;
  +[COSDiscoverSectionHeader topMargin];
  double v15 = v14;
  +[COSDiscoverSectionHeader bottomMargin];
  double v17 = v13 + v15 + v16;

  double v18 = v11;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)preferredCellWidth
{
  return self->_preferredCellWidth;
}

- (void)setPreferredCellWidth:(double)a3
{
  self->_preferredCellWidth = a3;
}

- (NSMutableArray)plugins
{
  return self->_plugins;
}

- (void)setPlugins:(id)a3
{
}

- (OS_dispatch_queue)pluginLoaderQueue
{
  return self->_pluginLoaderQueue;
}

- (void)setPluginLoaderQueue:(id)a3
{
}

- (BOOL)loadingPlugins
{
  return self->_loadingPlugins;
}

- (void)setLoadingPlugins:(BOOL)a3
{
  self->_loadingPlugins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginLoaderQueue, 0);

  objc_storeStrong((id *)&self->_plugins, 0);
}

@end