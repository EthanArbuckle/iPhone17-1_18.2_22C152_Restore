@interface CarActionButtonsCardViewController
- (BOOL)isTransitioning;
- (CarActionButton)destinationsButton;
- (CarActionButton)searchButton;
- (CarActionButtonsCardViewController)initWithDelegate:(id)a3;
- (CarActionButtonsCardViewControllerDelegate)delegate;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (UIStackView)buttonStack;
- (id)_getSearchButtonTitle;
- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5;
- (void)_buttonTapped:(id)a3;
- (void)checkFullTextSearchSupport;
- (void)setButtonStack:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationsButton:(id)a3;
- (void)setSearchButton:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CarActionButtonsCardViewController

- (CarActionButtonsCardViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CarActionButtonsCardViewController;
  v5 = [(CarActionButtonsCardViewController *)&v14 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[MapsOfflineUIHelper sharedHelper];
    unsigned int v8 = [v7 isUsingOfflineMaps];

    if (v8)
    {
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v9);
      offlinePlaceholderQueue = v6->_offlinePlaceholderQueue;
      v6->_offlinePlaceholderQueue = (OS_dispatch_queue *)v10;

      [(CarActionButtonsCardViewController *)v6 checkFullTextSearchSupport];
    }
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:"checkFullTextSearchSupport" name:@"UsingOfflineMapsStateChangedNotification" object:0];
  }
  return v6;
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)CarActionButtonsCardViewController;
  [(CarActionButtonsCardViewController *)&v49 viewDidLoad];
  v3 = [(CarActionButtonsCardViewController *)self _getSearchButtonTitle];
  id v4 = +[UIImage _mapsCar_systemImageNamed:@"magnifyingglass" textStyle:UIFontTextStyleTitle3 weight:4];
  v5 = +[CarActionButton actionButtonWithTitle:v3 image:v4];
  [(CarActionButtonsCardViewController *)self setSearchButton:v5];

  v6 = [(CarActionButtonsCardViewController *)self searchButton];
  [v6 setAccessibilityIdentifier:@"SearchButton"];

  v7 = [(CarActionButtonsCardViewController *)self searchButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  unsigned int v8 = [(CarActionButtonsCardViewController *)self searchButton];
  [v8 addTarget:self action:"_buttonTapped:" forControlEvents:64];

  v9 = +[NSBundle mainBundle];
  dispatch_queue_t v10 = [v9 localizedStringForKey:@"CarPlay_DestinationsButton" value:@"localized string not found" table:0];
  v11 = +[UIImage _mapsCar_systemImageNamed:@"mappin" textStyle:UIFontTextStyleTitle3 weight:4];
  v12 = +[CarActionButton actionButtonWithTitle:v10 image:v11];
  [(CarActionButtonsCardViewController *)self setDestinationsButton:v12];

  v13 = [(CarActionButtonsCardViewController *)self destinationsButton];
  [v13 setAccessibilityIdentifier:@"DestinationsButton"];

  objc_super v14 = [(CarActionButtonsCardViewController *)self destinationsButton];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(CarActionButtonsCardViewController *)self destinationsButton];
  [v15 addTarget:self action:"_buttonTapped:" forControlEvents:64];

  id v16 = objc_alloc((Class)UIStackView);
  v17 = [(CarActionButtonsCardViewController *)self searchButton];
  v51[0] = v17;
  v18 = [(CarActionButtonsCardViewController *)self destinationsButton];
  v51[1] = v18;
  v19 = +[NSArray arrayWithObjects:v51 count:2];
  id v20 = [v16 initWithArrangedSubviews:v19];
  [(CarActionButtonsCardViewController *)self setButtonStack:v20];

  v21 = [(CarActionButtonsCardViewController *)self buttonStack];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(CarActionButtonsCardViewController *)self buttonStack];
  [v22 setAxis:1];

  v23 = [(CarActionButtonsCardViewController *)self buttonStack];
  [v23 setDistribution:2];

  v24 = [(CarActionButtonsCardViewController *)self buttonStack];
  [v24 setSpacing:2.0];

  v25 = [(CarActionButtonsCardViewController *)self buttonStack];
  [v25 setAccessibilityIdentifier:@"CarActionsCard"];

  v26 = [(CarActionButtonsCardViewController *)self view];
  v27 = [(CarActionButtonsCardViewController *)self buttonStack];
  [v26 addSubview:v27];

  v48 = [(CarActionButtonsCardViewController *)self buttonStack];
  v46 = [v48 topAnchor];
  v47 = [(CarActionButtonsCardViewController *)self view];
  v45 = [v47 topAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v50[0] = v44;
  v43 = [(CarActionButtonsCardViewController *)self buttonStack];
  v41 = [v43 leftAnchor];
  v42 = [(CarActionButtonsCardViewController *)self view];
  v40 = [v42 leftAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v50[1] = v39;
  v38 = [(CarActionButtonsCardViewController *)self buttonStack];
  v28 = [v38 rightAnchor];
  v29 = [(CarActionButtonsCardViewController *)self view];
  v30 = [v29 rightAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  v50[2] = v31;
  v32 = [(CarActionButtonsCardViewController *)self buttonStack];
  v33 = [v32 bottomAnchor];
  v34 = [(CarActionButtonsCardViewController *)self view];
  v35 = [v34 bottomAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v50[3] = v36;
  v37 = +[NSArray arrayWithObjects:v50 count:4];
  +[NSLayoutConstraint activateConstraints:v37];
}

- (void)_buttonTapped:(id)a3
{
  id v11 = a3;
  id v4 = [(CarActionButtonsCardViewController *)self searchButton];

  if (v4 == v11)
  {
    v7 = [(CarActionButtonsCardViewController *)self delegate];
    unsigned int v8 = v7;
    v9 = self;
    uint64_t v10 = 0;
  }
  else
  {
    id v5 = [(CarActionButtonsCardViewController *)self destinationsButton];

    v6 = v11;
    if (v5 != v11) {
      goto LABEL_6;
    }
    v7 = [(CarActionButtonsCardViewController *)self delegate];
    unsigned int v8 = v7;
    v9 = self;
    uint64_t v10 = 1;
  }
  [v7 actionButtonsCard:v9 didSelectAction:v10];

  v6 = v11;
LABEL_6:
}

- (id)backgroundViewForCarCardLayout:(id *)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  return 0;
}

- (NSArray)focusOrderSubItems
{
  v3 = [(CarActionButtonsCardViewController *)self searchButton];
  v7[0] = v3;
  id v4 = [(CarActionButtonsCardViewController *)self destinationsButton];
  v7[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = [(CarActionButtonsCardViewController *)self searchButton];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (id)_getSearchButtonTitle
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"CarPlay_SearchButton" value:@"localized string not found" table:0];

  id v5 = +[MapsOfflineUIHelper sharedHelper];
  if ([v5 isUsingOfflineMaps])
  {
    BOOL supportsFullTextSearch = self->_supportsFullTextSearch;

    if (supportsFullTextSearch) {
      goto LABEL_5;
    }
    id v5 = +[NSBundle mainBundle];
    uint64_t v7 = [v5 localizedStringForKey:@"CarPlay_SearchButton_Offline" value:@"localized string not found" table:0];

    id v4 = (void *)v7;
  }

LABEL_5:

  return v4;
}

- (void)checkFullTextSearchSupport
{
  if (!self->_offlinePlaceholderQueue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v3);
    offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
    self->_offlinePlaceholderQueue = v4;
  }
  objc_initWeak(&location, self);
  v6 = self->_offlinePlaceholderQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100435930;
  v7[3] = &unk_1012E6708;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (CarActionButtonsCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarActionButtonsCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CarActionButton)searchButton
{
  return self->_searchButton;
}

- (void)setSearchButton:(id)a3
{
}

- (CarActionButton)destinationsButton
{
  return self->_destinationsButton;
}

- (void)setDestinationsButton:(id)a3
{
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_destinationsButton, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_offlinePlaceholderQueue, 0);
}

@end