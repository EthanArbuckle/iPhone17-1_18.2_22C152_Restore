@interface CarDisambiguationModeController
- (BOOL)showsMapView;
- (CarDisambiguationModeController)initWithSearchInfo:(id)a3 completionBlock:(id)a4;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)focusOrderSubItems;
- (id)desiredCards;
- (id)itemAtIndexPath:(id)a3;
- (int)currentUsageTarget;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CarDisambiguationModeController

- (CarDisambiguationModeController)initWithSearchInfo:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarDisambiguationModeController;
  v9 = [(CarBaseSearchViewController *)&v14 initWithDisabledETAUpdates:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchInfo, a3);
    id v11 = [v8 copy];
    id resultCompletionBlock = v10->_resultCompletionBlock;
    v10->_id resultCompletionBlock = v11;
  }
  return v10;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)CarDisambiguationModeController;
  [(CarDisambiguationModeController *)&v19 viewDidLoad];
  v3 = [(CarDisambiguationModeController *)self view];
  [v3 setAccessibilityIdentifier:@"CarDisambiguationView"];

  v4 = [CarTableView alloc];
  v5 = [(CarDisambiguationModeController *)self view];
  [v5 bounds];
  v6 = -[CarTableView initWithFrame:style:](v4, "initWithFrame:style:", 0);
  [(CarBaseSearchViewController *)self setTableView:v6];

  id v7 = [(CarBaseSearchViewController *)self tableView];
  [v7 setAccessibilityIdentifier:@"CarDisambiguationTableView"];

  id v8 = [(CarBaseSearchViewController *)self tableView];
  [v8 setAutoresizingMask:18];

  v9 = +[UIColor clearColor];
  v10 = [(CarBaseSearchViewController *)self tableView];
  [v10 setBackgroundColor:v9];

  id v11 = [(CarBaseSearchViewController *)self tableView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(CarBaseSearchViewController *)self tableView];
  [v12 setDelegate:self];

  v13 = [(CarBaseSearchViewController *)self tableView];
  [v13 setRowHeight:UITableViewAutomaticDimension];

  objc_super v14 = [(CarBaseSearchViewController *)self tableView];
  uint64_t v15 = objc_opt_class();
  v16 = +[CarSearchItemCell reuseIdentifier];
  [v14 registerClass:v15 forCellReuseIdentifier:v16];

  v17 = [(CarDisambiguationModeController *)self view];
  v18 = [(CarBaseSearchViewController *)self tableView];
  [v17 addSubview:v18];
}

- (BOOL)showsMapView
{
  return 0;
}

- (id)desiredCards
{
  CFStringRef v4 = @"primary";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"primary"])
  {
    [v6 setContent:self];
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"Did you mean... [CarPlay disambiguation title]" value:@"localized string not found" table:0];
    [v6 setTitle:v8];

    HIDWORD(v24) = 0;
    *(_DWORD *)((char *)&v24 + 1) = 0;
    long long v14 = xmmword_100F6F1C0;
    long long v15 = xmmword_100F67600;
    uint64_t v16 = 3;
    uint64_t v17 = 1148846080;
    uint64_t v18 = 2;
    LODWORD(v19) = 1148846080;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v22 = _Q0;
    long long v23 = _Q0;
    LOBYTE(v24) = 1;
    uint64_t v25 = 8;
    LOBYTE(v26) = 0;
    if (v6) {
      [v6 setLayout:&v14];
    }
    [v6 setAccessory:1 v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26];
  }
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id resultCompletionBlock = (void (**)(id, uint64_t, id))self->_resultCompletionBlock;
  if (resultCompletionBlock) {
    resultCompletionBlock[2](resultCompletionBlock, -1, a3);
  }
  id v5 = +[CarChromeModeCoordinator sharedInstance];
  [v5 popFromContext:self];
}

- (id)itemAtIndexPath:(id)a3
{
  searchInfo = self->_searchInfo;
  id v4 = a3;
  id v5 = [(SearchInfo *)searchInfo results];
  id v6 = [v4 row];

  id v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(SearchInfo *)self->_searchInfo results];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CarDisambiguationModeController;
  [(CarBaseSearchViewController *)&v8 tableView:a3 didSelectRowAtIndexPath:v6];
  id resultCompletionBlock = (void (**)(id, id))self->_resultCompletionBlock;
  if (resultCompletionBlock) {
    resultCompletionBlock[2](resultCompletionBlock, [v6 row]);
  }
}

- (NSArray)carFocusOrderSequences
{
  v2 = [(CarDisambiguationModeController *)self chromeViewController];
  v3 = [v2 itemRepresentingOverlays];
  objc_super v8 = v3;
  id v4 = +[NSArray arrayWithObjects:&v8 count:1];
  id v5 = +[CarFocusOrderSequence sequenceWithItems:v4 options:5];
  v9 = v5;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];

  return (NSArray *)v6;
}

- (NSArray)focusOrderSubItems
{
  if ([(CarDisambiguationModeController *)self isViewLoaded])
  {
    v3 = [(CarBaseSearchViewController *)self tableView];
    id v4 = [v3 _car_visibleCells];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (int)currentUsageTarget
{
  return 503;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_resultCompletionBlock, 0);

  objc_storeStrong((id *)&self->_searchInfo, 0);
}

@end