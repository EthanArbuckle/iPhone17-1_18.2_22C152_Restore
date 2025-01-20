@interface WFConfigurationParametersViewController
- (NSArray)footerButtons;
- (NSArray)hiddenParameterKeys;
- (WFAction)action;
- (WFConfigurationParametersViewController)initWithAction:(id)a3;
- (WFConfigurationParametersViewController)initWithAction:(id)a3 hiddenParameterKeys:(id)a4;
- (WFConfigurationParametersViewController)initWithAction:(id)a3 hiddenParameterKeys:(id)a4 footerButtons:(id)a5 widgetType:(unint64_t)a6;
- (WFConfigurationParametersViewControllerDelegate)delegate;
- (WFDataConfigurationParametersDataSource)dataSource;
- (int64_t)widgetFamily;
- (void)loadView;
- (void)parameterAttributesDidChange:(id)a3;
- (void)parameterEditorCell:(id)a3 didUpdateParameterState:(id)a4;
- (void)parameterEditorCellDidInvalidateSize:(id)a3;
- (void)populateConfiguredActionWithCompletion:(id)a3;
- (void)reloadActionParameterModels;
- (void)setAction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFConfigurationParametersViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerButtons, 0);
  objc_storeStrong((id *)&self->_hiddenParameterKeys, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setDataSource:(id)a3
{
}

- (WFDataConfigurationParametersDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (WFConfigurationParametersViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFConfigurationParametersViewControllerDelegate *)WeakRetained;
}

- (NSArray)footerButtons
{
  return self->_footerButtons;
}

- (NSArray)hiddenParameterKeys
{
  return self->_hiddenParameterKeys;
}

- (void)setAction:(id)a3
{
}

- (WFAction)action
{
  return self->_action;
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [(WFConfigurationParametersViewController *)self tableView];
  v6 = [v5 visibleCells];

  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = [v11 model];
        v13 = [v12 parameter];
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          id v15 = objc_alloc((Class)WFParameterEditorModel);
          v16 = [(WFConfigurationParametersViewController *)self action];
          v17 = [v4 key];
          v18 = [v16 parameterStateForKey:v17];
          id v19 = objc_msgSend(v15, "initWithParameter:state:widgetFamily:", v4, v18, -[WFConfigurationParametersViewController widgetFamily](self, "widgetFamily"));
          [v11 updateModel:v19];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  [(WFConfigurationParametersViewController *)self reloadActionParameterModels];
}

- (void)parameterEditorCellDidInvalidateSize:(id)a3
{
  id v24 = a3;
  id v4 = [(WFConfigurationParametersViewController *)self tableView];
  v5 = [v4 indexPathForCell:v24];

  if (v5)
  {
    v6 = [v24 contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    objc_msgSend(v24, "sizeThatFits:", v8, 1.79769313e308);
    BOOL v13 = v12 == CGSizeZero.width && v11 == CGSizeZero.height;
    double v14 = vabdd_f64(v10, v11);
    if (!v13 && v14 > 1.0)
    {
      v16 = [(WFConfigurationParametersViewController *)self tableView];
      [v16 beginUpdates];

      v17 = [(WFConfigurationParametersViewController *)self tableView];
      [v17 endUpdates];

      [(WFConfigurationParametersViewController *)self preferredContentSize];
      double v19 = v18;
      double v21 = v20;
      [v4 contentSize];
      if (v19 != v22 || v21 != v23)
      {
        [v4 contentSize];
        -[WFConfigurationParametersViewController setPreferredContentSize:](self, "setPreferredContentSize:");
      }
    }
  }
}

- (void)parameterEditorCell:(id)a3 didUpdateParameterState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 model];
  double v9 = [v8 parameter];
  id v17 = [v9 key];

  double v10 = [(WFConfigurationParametersViewController *)self action];
  [v10 setParameterState:v6 forKey:v17];

  id v11 = objc_alloc((Class)WFParameterEditorModel);
  double v12 = [(WFConfigurationParametersViewController *)self action];
  BOOL v13 = [v12 parameterForKey:v17];
  id v14 = objc_msgSend(v11, "initWithParameter:state:widgetFamily:", v13, v6, -[WFConfigurationParametersViewController widgetFamily](self, "widgetFamily"));

  [v7 updateModel:v14];
  id v15 = [(WFConfigurationParametersViewController *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    v16 = [(WFConfigurationParametersViewController *)self delegate];
    [v16 configurationParametersViewControllerDidUpdateAction:self];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  [v21 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(WFConfigurationParametersViewController *)self dataSource];
  double v8 = [v7 itemIdentifierForIndexPath:v6];

  if ([v8 hasPrefix:@"_footerButton_"])
  {
    double v9 = [v8 substringFromIndex:objc_msgSend(@"_footerButton_", "length")];
    double v10 = [(WFConfigurationParametersViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      [v21 rectForRowAtIndexPath:v6];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v20 = [(WFConfigurationParametersViewController *)self delegate];
      objc_msgSend(v20, "configurationParametersViewControllerDidPressButton:buttonIdentifier:cellFrame:", self, v9, v13, v15, v17, v19);
    }
  }
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)WFConfigurationParametersViewController;
  [(WFConfigurationParametersViewController *)&v18 viewDidLoad];
  v3 = [(WFConfigurationParametersViewController *)self tableView];
  [v3 setEstimatedRowHeight:UITableViewAutomaticDimension];

  id v4 = [(WFConfigurationParametersViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];

  v5 = [(WFConfigurationParametersViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"ParameterEditorHostingCell"];

  id v6 = [(WFConfigurationParametersViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"ButtonCell"];

  objc_initWeak(&location, self);
  id v7 = [WFDataConfigurationParametersDataSource alloc];
  double v8 = [(WFConfigurationParametersViewController *)self tableView];
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = sub_10001F56C;
  double v15 = &unk_10002DE68;
  objc_copyWeak(&v16, &location);
  double v9 = [(WFDataConfigurationParametersDataSource *)v7 initWithTableView:v8 cellProvider:&v12];
  -[WFConfigurationParametersViewController setDataSource:](self, "setDataSource:", v9, v12, v13, v14, v15);

  double v10 = [(WFConfigurationParametersViewController *)self footerButtons];
  char v11 = [(WFConfigurationParametersViewController *)self dataSource];
  [v11 setFooterButtons:v10];

  [(WFConfigurationParametersViewController *)self reloadActionParameterModels];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)WFConfigurationParametersViewController;
  [(WFConfigurationParametersViewController *)&v7 loadView];
  v3 = [(WFConfigurationParametersViewController *)self tableView];
  [v3 setShowsVerticalScrollIndicator:0];

  id v4 = [(WFConfigurationParametersViewController *)self tableView];
  [v4 setShowsHorizontalScrollIndicator:0];

  v5 = [(WFConfigurationParametersViewController *)self tableView];
  [v5 setAlwaysBounceVertical:0];

  id v6 = [(WFConfigurationParametersViewController *)self tableView];
  [v6 setAlwaysBounceHorizontal:0];
}

- (void)reloadActionParameterModels
{
  if ([(WFConfigurationParametersViewController *)self isViewLoaded])
  {
    id v4 = [(WFConfigurationParametersViewController *)self dataSource];
    v5 = [(WFConfigurationParametersViewController *)self action];
    id v6 = [(WFConfigurationParametersViewController *)self hiddenParameterKeys];
    if (v6)
    {
      v2 = [(WFConfigurationParametersViewController *)self hiddenParameterKeys];
      objc_super v7 = +[NSSet setWithArray:v2];
    }
    else
    {
      objc_super v7 = 0;
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001FA8C;
    v8[3] = &unk_10002DE18;
    v8[4] = self;
    [v4 applyParametersFromAction:v5 animatingDifferences:1 hiddenParameterKeys:v7 completion:v8];
    if (v6)
    {
    }
  }
}

- (void)populateConfiguredActionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(WFConfigurationParametersViewController *)self action];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FC08;
  v7[3] = &unk_10002DDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 processParametersWithoutAskingForValuesWithInput:0 workQueue:&_dispatch_main_q completionHandler:v7];
}

- (WFConfigurationParametersViewController)initWithAction:(id)a3 hiddenParameterKeys:(id)a4 footerButtons:(id)a5 widgetType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)WFConfigurationParametersViewController;
  double v14 = [(WFConfigurationParametersViewController *)&v26 initWithStyle:2];
  double v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_action, a3);
    id v16 = (NSArray *)[v12 copy];
    hiddenParameterKeys = v15->_hiddenParameterKeys;
    v15->_hiddenParameterKeys = v16;

    objc_storeStrong((id *)&v15->_footerButtons, a5);
    objc_super v18 = [(WFConfigurationParametersViewController *)v15 action];
    double v19 = [v18 parameters];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10001FE20;
    v23[3] = &unk_10002DDC8;
    double v20 = v15;
    id v24 = v20;
    unint64_t v25 = a6;
    [v19 enumerateObjectsUsingBlock:v23];

    id v21 = v20;
  }

  return v15;
}

- (WFConfigurationParametersViewController)initWithAction:(id)a3 hiddenParameterKeys:(id)a4
{
  return [(WFConfigurationParametersViewController *)self initWithAction:a3 hiddenParameterKeys:a4 footerButtons:&__NSArray0__struct widgetType:0];
}

- (WFConfigurationParametersViewController)initWithAction:(id)a3
{
  return [(WFConfigurationParametersViewController *)self initWithAction:a3 hiddenParameterKeys:0];
}

- (int64_t)widgetFamily
{
  return 3;
}

@end