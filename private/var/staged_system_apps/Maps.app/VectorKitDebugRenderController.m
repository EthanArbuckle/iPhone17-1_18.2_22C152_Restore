@interface VectorKitDebugRenderController
+ (id)navigationDestinationTitle;
- (id)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)featureDisableSwitchChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation VectorKitDebugRenderController

+ (id)navigationDestinationTitle
{
  return @"Disable Render Features";
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)VectorKitDebugRenderController;
  [(MapsDebugValuesViewController *)&v8 viewDidLoad];
  uint64_t v3 = 8;
  v4 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:8];
  debugFeatureSwitches = self->_debugFeatureSwitches;
  self->_debugFeatureSwitches = v4;

  do
  {
    v6 = self->_debugFeatureSwitches;
    v7 = +[NSNull null];
    [(NSMutableArray *)v6 addObject:v7];

    --v3;
  }
  while (v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return @"Disable Features";
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 8 * (a4 == 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(VectorKitDebugRenderController *)self delegate];
  v9 = [v8 allVisibleMapViewsForDebugController:self];
  v10 = [v9 firstObject];
  v11 = [v10 _mapLayer];

  id v12 = [v7 dequeueReusableCellWithIdentifier:@"Cell"];

  if (!v12) {
    id v12 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"Cell"];
  }
  [v12 setAccessoryView:0];
  if (![v6 section]
    && (uint64_t)[v6 row] <= 7
    && ((unint64_t)[v6 row] & 0x8000000000000000) == 0)
  {
    v13 = -[NSMutableArray objectAtIndexedSubscript:](self->_debugFeatureSwitches, "objectAtIndexedSubscript:", [v6 row]);
    v14 = +[NSNull null];
    unsigned int v15 = [v13 isEqual:v14];

    if (v15)
    {
      v16 = objc_alloc_init(VKDebugRenderSwitch);

      -[VKDebugRenderSwitch setSwitchIndex:](v16, "setSwitchIndex:", [v6 row]);
      [(VKDebugRenderSwitch *)v16 addTarget:self action:"featureDisableSwitchChanged:" forControlEvents:4096];
      -[NSMutableArray setObject:atIndexedSubscript:](self->_debugFeatureSwitches, "setObject:atIndexedSubscript:", v16, [v6 row]);
      v13 = v16;
    }
    [v12 setAccessoryView:v13];
    v17 = off_1013146C0[(void)[v6 row]];
    switch((unint64_t)[v6 row])
    {
      case 0uLL:
        id v18 = [v11 rastersDisabled];
        goto LABEL_19;
      case 1uLL:
        id v18 = [v11 polygonsDisabled];
        goto LABEL_19;
      case 2uLL:
        id v18 = [v11 roadsDisabled];
        goto LABEL_19;
      case 3uLL:
        id v18 = [v11 transitLinesDisabled];
        goto LABEL_19;
      case 4uLL:
        id v18 = [v11 labelsDisabled];
        goto LABEL_19;
      case 5uLL:
        v20 = +[VKDebugSettings sharedSettings];
        id v21 = [v20 disableBuildingFootprints];
        goto LABEL_17;
      case 6uLL:
        v20 = +[VKDebugSettings sharedSettings];
        id v21 = [v20 disableRoute];
LABEL_17:
        id v19 = v21;

        break;
      case 7uLL:
        id v18 = [v11 gridDisabled];
LABEL_19:
        id v19 = v18;
        break;
      default:
        id v19 = 0;
        break;
    }
    v22 = [v12 textLabel];
    [v22 setText:v17];

    [v13 setOn:v19];
  }

  return v12;
}

- (void)featureDisableSwitchChanged:(id)a3
{
  id v11 = a3;
  v4 = [(VectorKitDebugRenderController *)self delegate];
  v5 = [v4 allVisibleMapViewsForDebugController:self];
  id v6 = [v5 firstObject];
  id v7 = [v6 _mapLayer];

  switch((unint64_t)[v11 switchIndex])
  {
    case 0uLL:
      [v7 setDisableRasters:[v11 isOn]];
      break;
    case 1uLL:
      [v7 setDisablePolygons:[v11 isOn]];
      break;
    case 2uLL:
      [v7 setDisableRoads:[v11 isOn]];
      break;
    case 3uLL:
      [v7 setDisableTransitLines:[v11 isOn]];
      break;
    case 4uLL:
      [v7 setDisableLabels:[v11 isOn]];
      break;
    case 5uLL:
      [v7 setDisableBuildingFootprints:[v11 isOn]];
      id v8 = [v11 isOn];
      v9 = +[VKDebugSettings sharedSettings];
      [v9 setDisableBuildingFootprints:v8];
      goto LABEL_9;
    case 6uLL:
      id v10 = [v11 isOn];
      v9 = +[VKDebugSettings sharedSettings];
      [v9 setDisableRoute:v10];
LABEL_9:

      break;
    case 7uLL:
      [v7 setDisableGrid:[v11 isOn]];
      break;
    default:
      break;
  }
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

  objc_storeStrong((id *)&self->_debugFeatureSwitches, 0);
}

@end